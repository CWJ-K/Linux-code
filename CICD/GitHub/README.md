<!-- omit in toc -->
# Introduction

How to build CI/CD pipelines in GitHub?

<br />

<!-- omit in toc -->
# Table of Contents
- [GitHub Action](#github-action)

<br />

# GitHub Action
* requires YAML files stored in `.githun/workflows`
  * the name of YAML file does not matter
* tasks are defined under 'steps'
  * each step runs a piece of code
* on[push]
  * run the complete CI/CD pipeline when it receives a git push
    * in a CD system, it contains several filters for steps on specific branches/actions