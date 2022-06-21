<!-- omit in toc -->
# Purpose of Extensions
To improve readability of reused fragments

<br />

<!-- omit in toc -->
# Table of Contents
- [Example](#example)
  - [Explanation](#explanation)
    - [x- character](#x-character)
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
### x- character 
extension starts with the **x- character** sequence

        x-logging => x-<name>

### `&` (ampersand)
a YAML feature - anchor. Anchors can be used to duplicate/inherit properties 
        &default-logging
### `*` (Asterisk, star)
refer back to the anchor



    