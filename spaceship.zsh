spaceship remove gcloud
spaceship remove docker

spaceship add --after dir docker_shell

function spaceship_docker_shell() {
  if [ -f /.dockerenv ]; then
    spaceship::section::v4 --prefix "in " "🐳 "
  fi
}

