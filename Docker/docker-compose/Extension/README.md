
https://docs.docker.com/compose/compose-file/#extension
starts with the x- character sequence

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