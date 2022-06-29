<!-- omit in toc -->
# Introduction
Improve the readability of reused fragments in docker-compose.yml.

<br />

<!-- omit in toc -->
# Table of Contents
- [Example](#example)
- [Fundamental Concepts](#fundamental-concepts)
  - [1. x-character](#1-x-character)
  - [2. `&` (ampersand)](#2--ampersand)
  - [3. `*` (Asterisk, star)](#3--asterisk-star)
  - [4. `<<`](#4-)

<br />

# Example
    ```yml
    x-logging: &default-logging
      options:
      max-size: "12m"
      max-file: "5"
      driver: json-file

    services:
      frontend:
        image: awesome/webapp
        logging: *default-logging
      backend:
        image: awesome/database
        logging: *default-logging
    ```

<br />

# Fundamental Concepts

## 1. x-character 
* extension starts with the **x-character** sequence

  ```yml
  x-common-argument: &custom_argument_name
      arguments: xx
  
  x-common-argument-env: &custom_env_name
      arguments: xx

  services:
      service:
      <<: *custom_argument_name
      uncommon-argument: argument_value
      environment:
          <<: *custom_env_name
          uncommon-env: env_value
  ```

<br />

## 2. `&` (ampersand)
a YAML feature - anchor. Anchors can be used to duplicate/inherit properties 
        &default-logging

<br />

## 3. `*` (Asterisk, star)
refer back to the anchor


## 4. `<<`
if you have other arguments not in the arguments of x-character, you can use `<<` as the pointer of the arguments of x-character.




    