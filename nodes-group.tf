resource "aws_iam_role" "nodes_groups" {
  name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes_amazon_eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes_groups.name
}

resource "aws_iam_role_policy_attachment" "nodes_amazon_eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes_groups.name
}

resource "aws_iam_role_policy_attachment" "nodes_amazon_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes_groups.name
}

# Optional: only if you want to "SSH" to your EKS nodes.
resource "aws_iam_role_policy_attachment" "amazon_ssm_managed_instance_core" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.nodes_groups.name
}

resource "aws_eks_node_group" "private_nodes" {
  cluster_name    = aws_eks_cluster.eks-cluster-demo.name
  node_group_name = "private-nodes"
  node_role_arn   = aws_iam_role.nodes_groups.arn

  # Single subnet to avoid data transfer charges while testing.
  subnet_ids = [
    aws_subnet.pvtsub-1.id,
    aws_subnet.pvtsub-2.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]
  ami_type = "AL2_x86_64"
  disk_size = 20

/*
  remote_access {
    ec2_ssh_key = "kav-key"
    source_security_group_ids = <mention security id>
  }

*/

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }



  labels = {
    role = "nodes-general"
  }

  version = "1.24"

  depends_on = [
    aws_iam_role_policy_attachment.nodes_amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.nodes_amazon_eks_cni_policy,
    aws_iam_role_policy_attachment.nodes_amazon_ec2_container_registry_read_only,
  ]
  tags = {
    name = "Public-node-groups"
  }

}