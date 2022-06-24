<!-- omit in toc -->
# Introduction

How to parse arguments in .env to docker-compose.yml ?

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## Path of .env
* single .env file
  * Compose automatically looks for in project directory (**parent folder** of your Compose file)
* multiple .env files

## Override
* Values set in the **shell environment** override those set in the .env file


## [syntax of environment variables](https://docs.docker.com/compose/environment-variables/)
* $VARIABLE = ${VARIABLE}
> in some cases, ${VARIABLE} is more appropriate
* ${VARIABLE:-default}: evaluates to default if VARIABLE is [unset or empty](https://programmierfrage.com/items/properly-deleting-an-object-in-an-array-in-php) in the environment
> [without colon](https://stackoverflow.com/a/63799107): check only for variable existence <br />
> with colon: check both for variable existence and non-empties
* ${VARIABLE-default}: evaluates to default only if VARIABLE is unset in the environment

<br />

# Commands 