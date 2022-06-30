<!-- omit in toc -->
# Purpose of Links
> Links are a legacy option. Use **networks** instead.

To define aliases which help a service to be reachable from other service in the container 

<br />

<!-- omit in toc -->
# Table of Contents
- [Example](#example)
- [Fundamental Concepts](#fundamental-concepts)

<br />

# Example
  ```yml
  version: "3.9"
  services:

  web:
      build: .
      links:
      - "db:database" # web service links to database service (postgres)
      - "db"
  db:
      image: postgres
  ```

<br />

# Fundamental Concepts
* Any service can reach other one at their **names**. By default, services can reach to each other.
  
* Links are Similar to **depends_on**, which even determines the order of service startup. 
  
* Use either **networks** or **links** at the same time.

* can use **"service:alias"** or **"service_name"** to represent the service

* **Aliases**: alternative hostname for this service 

  



