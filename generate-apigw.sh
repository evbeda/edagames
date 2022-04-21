cat > apigw-api.yaml<<EOF
apiVersion: apigatewayv2.services.k8s.aws/v1alpha1
kind: API
metadata:
  name: apitest-private-nlb
spec:
  body: '{
              "openapi": "3.0.1",
              "info": {
                "title": "ack-apigwv2-import-test-private-nlb",
                "version": "v1"
              },
              "paths": {
              "/\$default": {
                "x-amazon-apigateway-any-method" : {
                "isDefaultRoute" : true,
                "x-amazon-apigateway-integration" : {
                "payloadFormatVersion" : "1.0",
                "connectionId" : "$(kubectl get vpclinks.apigatewayv2.services.k8s.aws \
  nlb-internal \
  -o jsonpath="{.status.vpcLinkID}")",
                "type" : "http_proxy",
                "httpMethod" : "GET",
                "uri" : "$(aws elbv2 describe-listeners \
  --load-balancer-arn $(aws elbv2 describe-load-balancers \
  --region $AGW_AWS_REGION \
  --query "LoadBalancers[?contains(DNSName, '$(kubectl get service django-lb -n edagames \
  -o jsonpath="{.status.loadBalancer.ingress[].hostname}")')].LoadBalancerArn" \
  --output text) \
  --region $AGW_AWS_REGION \
  --query "Listeners[0].ListenerArn" \
  --output text)",
               "connectionType" : "VPC_LINK"
                  }
                }
              },
              "/meta": {
                  "get": {
                    "x-amazon-apigateway-integration": {
                       "uri" : "$(aws elbv2 describe-listeners \
  --load-balancer-arn $(aws elbv2 describe-load-balancers \
  --region $AGW_AWS_REGION \
  --query "LoadBalancers[?contains(DNSName, '$(kubectl get service server-lb -n edagames \
  -o jsonpath="{.status.loadBalancer.ingress[].hostname}")')].LoadBalancerArn" \
  --output text) \
  --region $AGW_AWS_REGION \
  --query "Listeners[0].ListenerArn" \
  --output text)",
                      "httpMethod": "GET",
                      "connectionId": "$(kubectl get vpclinks.apigatewayv2.services.k8s.aws \
  nlb-internal \
  -o jsonpath="{.status.vpcLinkID}")",
                      "type": "HTTP_PROXY",
                      "connectionType": "VPC_LINK",
                      "payloadFormatVersion": "1.0"
                    }
                  }
                }
              },
              "components": {}
        }'
EOF