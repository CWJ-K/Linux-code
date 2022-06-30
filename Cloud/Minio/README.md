<!-- omit in toc -->
# Introduction
How can I use Minio to store data?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
- [Issue:](#issue)
  - [1. ERROR Unable to initialize server switching into safe-mode: Unable to initialize sub-systems: Unable to initialize config system: Invalid credentials](#1-error-unable-to-initialize-server-switching-into-safe-mode-unable-to-initialize-sub-systems-unable-to-initialize-config-system-invalid-credentials)

<br />

# Fundamental Concepts

<br />


# Issue: 

## 1. ERROR Unable to initialize server switching into safe-mode: Unable to initialize sub-systems: Unable to initialize config system: Invalid credentials
> possible reason: installed minio before, previous credential information has conflicts with the current one. Therefore, remove minoi volume if use Docker

```sh
 docker volume rm <minio_volume>
```
    