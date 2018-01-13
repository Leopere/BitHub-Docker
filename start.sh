#!/bin/sh

## GitHub EnvVars
sed -i 's/user:.*`\n`/user:$GITHUB_USER/g' /etc/BitHub/config.yml
sed -i 's/token:.*`\n`/token:$GITHUB_TOKEN/g' /etc/BitHub/config.yml
sed -i 's/password:.*`\n`/password:$GITHUB_WEBHOOK_PASSWORD/g' /etc/BitHub/config.yml
sed -i 's/url:.*`\n`/url:$GITHUB_REPOSITORIES/g' /etc/BitHub/config.yml

## Coinbase EnvVars
sed -i 's/apiKey:.*`\n`/apiKey:$COINBASE_API_KEY/g' /etc/BitHub/config.yml
sed -i 's/apiSecret:.*`\n`/apiSecret:$COINBASE_API_SECRET/g' /etc/BitHub/config.yml

## Global EnvVars
sed -i 's/name:.*`\n`/name:$ORGANIZATION_NAME/g' /etc/BitHub/config.yml
sed -i 's/donationUrl:.*`\n`/donationUrl:$DONATION_URL/g' /etc/BitHub/config.yml

java -jar /app/BitHub-0.1.jar server /etc/BitHub/config.yml

