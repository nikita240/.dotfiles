spaceship remove gcloud
spaceship remove docker

spaceship add --after dir docker_shell

function spaceship_docker_shell() {
  echo "SECTION"
  if [ -f /.dockerenv ]; then
    spaceship::section::v4 --prefix "in " "${SPACESHIP_DOCKER_SYMBOL}"
  fi
}

