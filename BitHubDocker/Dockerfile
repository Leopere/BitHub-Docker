FROM openjdk:8-jdk-alpine

MAINTAINER chamunks [at] gmail [dot] com

ENV GITHUB_USER=your_bithub_username
ENV GITHUB_TOKEN=your_bithub_authtoken
ENV GITHUB_WEBHOOK_PASSWORD=your_webhook_password
ENV GITHUB_REPOSITORIES="[{\"url\" : \"https://github.com/youraccount/yourrepo\"}, {\"url\" : \"https://github.com/youraccount/yourotherrepo\"}]"
ENV COINBASE_API_KEY=your_api_key
ENV COINBASE_API_SECRET=your_api_secret
ENV ORGANIZATION_NAME=your_organization_name
ENV DONATION_URL=your_donation_url

ADD BitHub-0.1.jar /app/
RUN	apk update && apk --no-cache add git curl maven &&\
	mkdir -pv /source/ &&\
	mkdir -pv /etc/BitHub &&\
	git clone https://github.com/WhisperSystems/BitHub.git /source/BitHub &&\
	cd /source/BitHub &&\
	mvn clean install &&\
	cd -v /source/BitHub/target &&\
	mv -v BitHub-0.1.jar /app/ &&\
	mv -v /source/BitHub/config/sample.yml /etc/BitHub/config.yml &&\
	cd && rm -Rfv /source/ &&\
	adduser bithub -h /app/ -s /bin/ash -D &&\
	chown -Rv bithub /app/

USER bithub

HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1  

VOLUME /etc/BitHub/config.yml

EXPOSE 80

RUN [ "java -jar /app/BitHub-0.1.jar server /etc/BitHub/config.yml" ]
