# SonarQube GitHub Action

Using this GitHub Action, scan your code with SonarQube scanner to detects bugs, vulnerabilities and code smells in more than 20 programming languages!

<img src="https://www.sonarqube.org/assets/logo-31ad3115b1b4b120f3d1efd63e6b13ac9f1f89437f0cf6881cc4d8b5603a52b4.svg" width="320px">

SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 20+ programming languages.

## Requirements

* Get SonarQube server. [Install now](https://docs.sonarqube.org/latest/setup/install-server/)

## Usage

The workflow, usually declared in `.github/workflows/build.yml`, looks like:

```yaml
name: Main Workflow
on:
  pull_request:
    branches:
      - master
jobs:
  sonarQubeTrigger:
    name: SonarQube Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: SonarQube Scan
      uses: ynd-consult-ug/sonarqube-action@master
      with:
        host: ${{ secrets.SONARQUBE_HOST }}
        token: ${{ secrets.SONARQUBE_TOKEN }}
        projectKey: ${{ secrets.SONARQUBE_PROJECTKEY}}
        projectBaseDir: checkout_dir
```

You can change the analysis base directory by using the optional input `projectBaseDir` like this:

## Secrets

- `host` - **_(Required)_** this is the SonarQube server URL.
- `login` - **_(Required)_** the login or authentication token of a SonarQube user with Execute Analysis permission on the project. See [how to generate SonarQube token](https://docs.sonarqube.org/latest/user-guide/user-token/).

You can set all variable in the "Secrets" settings page of your repository.

## License

The Dockerfile and associated scripts and documentation in this project are released under the MIT License.

Container images built with this project include third party materials.