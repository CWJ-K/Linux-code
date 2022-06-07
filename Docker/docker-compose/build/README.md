webserver:
    build:
      context: docker/airflow-data
      args:
        AIRFLOW_BASE_IMAGE: *airflow_image