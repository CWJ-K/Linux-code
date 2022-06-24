<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts

<br />

# Commands 

# Issue: ERROR Unable to initialize server switching into safe-mode: Unable to initialize sub-systems: Unable to initialize config system: Invalid credentials
> possible reason: installed minio before, previous credential information has conflicts with the current one. Therefore, remove minoi volume if use Docker

```linux
 docker volume rm <minio_volume>

```
    