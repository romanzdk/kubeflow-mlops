0) curl -v http://$SERVICE:$PORT
Response:
>> <a href="/dex/auth?client_id=kubeflow-oidc-authservice&amp;redirect_uri=%2Flogin%2Foidc&amp;response_type=code&amp;scope=profile+email+groups+openid&amp;state=STATE_VALUE">Found</a>.

STATE=STATE_VALUE

1) curl -v "http://$SERVICE:$PORT/dex/auth?client_id=kubeflow-oidc-authservice&redirect_uri=%2Flogin%2Foidc&response_type=code&scope=profile+email+groups+openid&amp;state=$STATE_VALUE"
Response:
>> <a href="/dex/auth/local?req=REQ_VALUE">Found</a>

REQ=REQ_VALUE
2) curl -v 'http://$SERVICE:$PORT/dex/auth/local?req=REQ_VALUE' -H 'Content-Type: application/x-www-form-urlencoded' --data 'login=admin%40kubeflow.org&password=12341234'

3) curl -v 'http://$SERVICE:$PORT/dex/approval?req=$REQ_VALUE'

Response:
>> <a href="/login/oidc?code=CODE_VALUE&amp;state=STATE_VALUE">See Other</a>.

CODE=CODE_VALUE

4) curl -v 'http://$SERVICE:$PORT/login/oidc?code=$CODE_VALUE&amp;state=$STATE_VALUE'

Response:
>> set cookie authservice_session=SESSION

curl -v 'http://$SERVICE:$PORT/pipeline/apis/v1beta1/pipelines' -H 'Cookie: authservice_session=SESSION'

Response:
>> 200 OK { ... }