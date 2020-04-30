FROM docker.pkg.github.com/ynd-consult-ug/sonarqube-action:latest

LABEL "com.github.actions.name"="SonarQube Scan"
LABEL "com.github.actions.description"="Scan your code with SonarQube Scanner to detect bugs, vulnerabilities and code smells in more than 25 programming languages."
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

LABEL version="0.0.5"
LABEL repository="https://github.com/ynd-consult-ug/sonarqube-action"
LABEL maintainer="ynd-consult-ug"
