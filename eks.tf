# iam role creations
resource "aws_iam_role" "demo" {
# the name of the role
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# AWS-IAM -role-policy attachment
resource "aws_iam_role_policy_attachment" "demo_amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

resource "aws_iam_role_policy_attachment" "demo_amazon_eks_cluster_VPC_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "eks-cluster-demo" {
  name     = "eks-cluster-demo"
  version  = "1.24"
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
  

    subnet_ids = [
      aws_subnet.pvtsub-1.id,
      aws_subnet.pvtsub-2.id,
      aws_subnet.pubsub-2.id,
      aws_subnet.pubsub-2.id
    ]
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  depends_on = [
    aws_iam_role_policy_attachment.demo_amazon_eks_cluster_policy,
    aws_iam_role_policy_attachment.demo_amazon_eks_cluster_VPC_policy
    ]
}



output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.eks-cluster-demo.endpoint
}