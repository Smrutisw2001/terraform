variable "microservices" {
  description = "ECR for different microservices"
  type = list(string)
  default = ["accountingservice", "adservice", "cartservice", "checkoutservice", "currencyservice", "emailservice", "featureflagservice", "frauddetectionservice", "frontend-app", "frontendproxy", "kafka","loadgenerator", "paymentservice","productcatalogservice","quoteservice", "recommendationservice","shippingservice"]
}