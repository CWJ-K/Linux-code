<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Example](#example)
  - [Explanation](#explanation)

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
- extension starts with the **x- character** sequence

        x-logging => x-<name>

- `&` (ampersand): a YAML feature - anchor. Anchors can be used to duplicate/inherit properties 
        &default-logging
- `*` (Asterisk, star): refer back to the anchor



    