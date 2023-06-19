
resource "kubernetes_namespace" "wyoming" {
  metadata {
    name = var.state # Name of the namespace
  }
}
