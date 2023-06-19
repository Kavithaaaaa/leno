resource "kubernetes_deployment" "core-service" {

  metadata {

    name = "core-service"

    namespace = var.state
  }


  spec {

    replicas = 2


    selector {

      match_labels = {

        app = "core-service"

      }

    }


    template {

      metadata {

        labels = {

          app = "core-service"

        }

      }


      spec {

        container {

          image = "433474711752.dkr.ecr.us-east-2.amazonaws.com/core-app:core-app-v1"

          name = "core-service-app"

          port {

            container_port = 3010

          }



          volume_mount {

            name = "secrets-volume"

            mount_path = "/secrets"

            read_only = true

          }


          resources {

            limits = {

              cpu = "1"

              memory = "512Mi"

            }

            requests = {

              cpu = "0.5"

              memory = "256Mi"

            }

          }

        }


        container {

          image = "433474711752.dkr.ecr.us-east-2.amazonaws.com/core-app:core-api-v1"

          name = "core-service-api"
          port {

            container_port = 3020

          }





          volume_mount {

            name = "secrets-volume"

            mount_path = "/secrets"

            read_only = true

          }


          resources {

            limits = {

              cpu = "0.9"

              memory = "900Mi"

            }

            requests = {

              cpu = "0.5"

              memory = "500Mi"

            }

          }

        }
        volume {

          name = "secrets-volume"

          secret {

            secret_name = kubernetes_secret.core-service.metadata.0.name

          }

        }

      }

    }

  }

}
