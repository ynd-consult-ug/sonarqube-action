FROM openjdk:8

LABEL "com.github.actions.name"="SonarQube Scan"
LABEL "com.github.actions.description"="Scan your code with SonarQube Scanner to detect bugs, vulnerabilities and code smells in more than 25 programming languages."
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="cyan"

LABEL version="0.0.3"
LABEL repository="https://github.com/ynd-consult-ug/sonarqube-action"
LABEL maintainer="ynd-consult-ug"

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    htop \
    maven \
    tmux
    
# Install Node - allows for scanning of Typescript
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y \
    nodejs \
    build-essential

# Set timezone to CST
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /usr/src

RUN curl --insecure -o ./sonarscanner.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102.zip && \
	unzip sonarscanner.zip && \
	rm sonarscanner.zip && \
	mv sonar-scanner-4.3.0.2102 /usr/lib/sonar-scanner && \
	ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

ENV SONAR_RUNNER_HOME=/usr/lib/sonar-scanner
COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
