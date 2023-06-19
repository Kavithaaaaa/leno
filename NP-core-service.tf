/*
# Kubernetes Service Manifest (Type: Node Port Service)
resource "kubernetes_service_v1" "core-service_np_service" {
  metadata {
    name = "core-service"
    annotations = {
      "alb.ingress.kubernetes.io/healthcheck-path" = "/index.html"
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment.core-service.spec.0.selector.0.match_labels.app
    }
    port {
      name        = "http"
      port        = 80
      target_port = 3010
    }
    type = "NodePort"
  }
}
*/
