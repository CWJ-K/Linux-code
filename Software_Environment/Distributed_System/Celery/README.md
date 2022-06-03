

# Celery
    * Task queue systems
        * input: a unit of work, called a task
        * workers process tasks
        * monitor the queue 
    * written in Python
    * communicate by messages
    * use a broker to mediate (send/receive messages) between clients and workers

    app = Celery(
        'task',
        include=['tasks'],
        broker=''
    )

    # register celery
    @task.

    # send tasks 
    .delay(x=0)
    .s(x=0)
    .apply_async

    # run in the same directory of worker.py
    pipenv run celery -A worker worker --loglevel=info

    # run task
    pipenv run python -m src.producer

    # 
    apt install python-celery-common
    celery inspect registered

    * parameters
        * concurrency
        * hostname
        * -Q

# Flower
    * a web based tool for monitoring and administrating Celery clusters