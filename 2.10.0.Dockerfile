FROM anapsix/alpine-java
LABEL maintainer='mateu.gorski@gmail.com'

RUN mkdir /allure
RUN mkdir /allure-results
RUN mkdir /allure-report
RUN mkdir /allure-config

RUN apk update && \
	apk add ca-certificates && \
	update-ca-certificates && \
	apk add openssl && \
	apk add unzip

RUN wget https://dl.bintray.com/qameta/maven/io/qameta/allure/allure-commandline/2.10.0/allure-commandline-2.10.0.zip
RUN unzip allure-commandline-2.10.0.zip -d /allure
RUN rm allure-commandline-2.10.0.zip
ENV PATH="/allure/bin:${PATH}"
ENV ALLURE_CONFIG="/allure-config/allure.properties"
