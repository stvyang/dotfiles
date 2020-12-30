# Java
export PKICTL_MEMBER_CA_CERT_FILE="/home/stvyang/.certs/certs/member/syang@indodana.com@0f4b9227b4f94a3395fe7b694443599a@pkictl-prod/syang@indodana.com@0f4b9227b4f94a3395fe7b694443599a@pkictl-prod.ca-chain.crt"

export PKICTL_MEMBER_PKCS12_FILE="/home/stvyang/.certs/certs/member/syang@indodana.com@0f4b9227b4f94a3395fe7b694443599a@pkictl-prod/syang@indodana.com@0f4b9227b4f94a3395fe7b694443599a@pkictl-prod.p12"

export PKICTL_MEMBER_PKCS12_KEYSTORE_PASSWORD="changeit"

export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

export GRADLE_OPTS="-Djavax.net.ssl.trustStore=$HOME/.gradle.truststore.jks \
  -Djavax.net.ssl.trustStoreType=jks \
  -Djavax.net.ssl.trustStorePassword=changeit \
  -Djavax.net.ssl.keyStore=${PKICTL_MEMBER_PKCS12_FILE} \
  -Djavax.net.ssl.keyStoreType=pkcs12 \
  -Djavax.net.ssl.keyStorePassword=${PKICTL_MEMBER_PKCS12_KEYSTORE_PASSWORD}"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/matthew/.sdkman"
[[ -s "/home/matthew/.sdkman/bin/sdkman-init.sh" ]] && source "/home/matthew/.sdkman/bin/sdkman-init.sh"
