
# build image

    docker build -f Dockerfile -t web_crawler:1.0.1 .
    # -f 
    # -t
    # . : dockerfile in the current directory

# push image
    # https://stackoverflow.com/questions/50151833/cannot-login-to-docker-account
    sudo apt install gnupg2 pass
    docker login --username <username>
