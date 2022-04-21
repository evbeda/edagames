echo "
apiVersion: apigatewayv2.services.k8s.aws/v1alpha1
kind: Stage
metadata:
  name: "apiv1"
spec:
  apiID: $(kubectl get apis.apigatewayv2.services.k8s.aws apitest-private-nlb -o=jsonpath='{.status.apiID}')
  stageName: api
  autoDeploy: true
" > apigw-stage.yaml
