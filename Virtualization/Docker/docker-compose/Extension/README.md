<!-- omit in toc -->
# Purpose of Extensions
To improve readability of reused fragments

<br />

<!-- omit in toc -->
# Table of Contents
- [Example](#example)
  - [Explanation](#explanation)
    - [x-character](#x-character)
    - [`&` (ampersand)](#-ampersand)
    - [`*` (Asterisk, star)](#-asterisk-star)

<br />

# Example
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


## Explanation
### x-character 
extension starts with the **x-character** sequence

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

  

### `&` (ampersand)
a YAML feature - anchor. Anchors can be used to duplicate/inherit properties 
        &default-logging
### `*` (Asterisk, star)
refer back to the anchor



    