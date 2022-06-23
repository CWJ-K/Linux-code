

# Gitlab
https://docs.gitlab.com/ee/development/cicd/templates.html#template-directories

read which file when merging branch


https://docs.gitlab.com/runner/install/linux-manually.html
sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

sudo chmod +x /usr/local/bin/gitlab-runner

sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start


sudo usermod -aG docker gitlab-runner



sudo gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "your_token" \
  --executor "shell" \
  --description "build_image" \
  --tag-list "build_image" 

sudo gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "your_token" \
  --executor "docker" \
  --docker-image continuumio/miniconda3:4.3.27 \
  --description "docker-runner" \
  --tag-list "docker-runner" 







# Issue
https://stackoverflow.com/a/62152265


# issue
not find make
=> install make in vm

# docker runner
why need => database firewall

docker runners are generally safe* because every build runs in a new container, so there's nothing to worry.


