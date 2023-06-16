resource "aws_iam_role" "eks_service_account_role" {
  name = "career-eks-service-account-role"

  assume_role_policy = <<EOF
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
EOF
}

resource "aws_iam_role_policy_attachment" "eks_service_account_policy_attachment" {
  role       = aws_iam_role.eks_service_account_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" # Replace with the desired policy ARN
}



resource "kubernetes_service_account" "eks_service_account" {
  metadata {
    name      = "eks-service-account"
    namespace = "default" # Replace with the desired namespace
  }
}

resource "kubernetes_role_binding" "eks_service_account_role_binding" {
  metadata {
    name      = "eks-service-account-role-binding"
    namespace = "default" # Replace with the desired namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin" # Replace with the desired role name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.eks_service_account.metadata[0].name
    namespace = kubernetes_service_account.eks_service_account.metadata[0].namespace
  }
}
