/*resource "aws_iam_role" "eks_load_balancer_controller" {

  name = "eks-load-balancer-controller-role"

  assume_role_policy = <<EOF {

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



resource "aws_iam_role_policy_attachment" "eks_load_balancer_controller" {

  role = aws_iam_role.eks_load_balancer_controller.name

  policy_arn = "arn:aws:iam::aws:policy/ELBControllerIAMPolicy"

}
*/


resource "aws_iam_policy" "eks_load_balancer_controller" {

  name        = "eks_load_balancer_controller"

  description = "elb iam policy"

  path        = "/"




  policy = jsonencode({

  "Version": "2012-10-17",

  "Statement": [

    {

      "Effect": "Allow",

      "Action": [

        "ec2:Describe*",

        "ec2:CreateNetworkInterface",

        "ec2:DeleteNetworkInterface",

        "ec2:AttachNetworkInterface",

        "ec2:DetachNetworkInterface",

        "elasticloadbalancing:Describe*",

        "elasticloadbalancing:CreateLoadBalancer",

        "elasticloadbalancing:DeleteLoadBalancer",

        "elasticloadbalancing:RegisterTargetWithLoadBalancer",

        "elasticloadbalancing:DeregisterTargetFromLoadBalancer"

      ],

      "Resource": "*"

    }

  ]

})

}




resource "aws_iam_role" "eks_load_balancer_controller" {

  name        = "eks_load_balancer_controller"

  description = "iam role for LB "




  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = "sts:AssumeRole"

        Effect = "Allow"

        Sid    = ""

        Principal = {

          Service = "eks.amazonaws.com"

        }

      },

    ]

  })

}




resource "aws_iam_role_policy_attachment" "eks_load_balancer_controller" {

  role       = aws_iam_role.eks_load_balancer_controller.name

  policy_arn = aws_iam_policy.eks_load_balancer_controller.arn

}
