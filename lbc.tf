provider "aws" {

  region = var.aws_region # Replace with your desired region

}







resource "kubernetes_deployment" "aws_load_balancer_controller" {

  metadata {

    name = "aws-load-balancer-controller"

    namespace = "kube-system"




    labels = {

      "app.kubernetes.io/name" = "aws-load-balancer-controller"

    }

  }




  spec {

    replicas = 1




    selector {

      match_labels = {

        "app.kubernetes.io/name" = "aws-load-balancer-controller"

      }

    }




    template {

      metadata {

        labels = {

          "app.kubernetes.io/name" = "aws-load-balancer-controller"

        }

      }




      spec {

        container {

          name = "aws-load-balancer-controller"

          image = "docker.io/amazon/aws-load-balancer-controller:v2.4.2"




          args = [

            "--ingress-class=alb",

            "--cluster-name=${local.name}-${var.cluster_name}",

          ]




          }

        }

      }

    }

  }



