 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/intersystems-iris-dev-template)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fso-where-is-my-money&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fso-where-is-my-money)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fso-where-is-my-money&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fso-where-is-my-money)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)

# So... Where's my money?

This is a sample project, an Expenses Tracker with Machine Learn made with InterSystems IRIS and embedded Python.

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation
Clone/git pull the repo into any local directory
```
$ git clone https://github.com/intersystems-community/intersystems-iris-dev-template.git
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:

```
$ docker-compose up -d
```

To open IRIS Terminal do:
```
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>
```

[Read about all the files in this artilce](https://community.intersystems.com/post/dockerfile-and-friends-or-how-run-and-collaborate-objectscript-projects-intersystems-iris)
