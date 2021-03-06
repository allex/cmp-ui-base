# by allex_wang

function image_name {
  params = [prefix, name]
  result = notequal("", prefix) ? "${prefix}/${name}" : "${name}"
}

variable "NAME" {
  default = "cmp-ui-base"
}

variable "PREFIX" {
  default = "docker.io/tdio"
}

variable "BUILD_TAG" {
  default = "2.0.0"
}

group "default" {
  targets = ["2.x"]
}

target "2.x" {
  context = "."
  dockerfile = "Dockerfile"
  args = {
    BUILD_TAG = ""
    BUILD_GIT_HEAD = ""
  }
  tags = [
    "${image_name(PREFIX, NAME)}:latest",
    "${image_name(PREFIX, NAME)}:${BUILD_TAG}"
  ]
  platforms = ["linux/amd64","linux/arm64"]
}
