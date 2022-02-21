job "docs" {
  datacenters = ["dc1"]


  group "example" {
    network {
      port "http" {
        static = "5678"
      }
    }

    task "server" {
      driver = "exec"
      artifact {
        source = "https://github.com/hashicorp/http-echo/releases/download/v0.2.3/http-echo_0.2.3_linux_amd64.tar.gz"
        destination = "/bin"
      }
      config {
        command = "/bin/http-echo"

        args = [
          "-listen",
          ":5678",
          "-text",
          "hello world",
        ]
      }
    }
  }
}
