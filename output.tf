output "invoke_url" {
  value = "${aws_api_gateway_deployment.apideploy.invoke_url}/${aws_api_gateway_resource.rest_api_resources.path_part}"
}

output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}

output "cloud_front_domain" {
  value = aws_cloudfront_distribution.api_gateway_cf.domain_name
}