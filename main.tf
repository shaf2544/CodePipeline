terraform {
  required_providers {
    aws = {
      source  = hashicorpaws
      version = ~ 4.16
    }
  }

  required_version = = 1.2.0
}

provider aws {
  region  = us-west-2
}

resource aws_instance app_server {
  ami           = ami-830c94e3
  instance_type = t1.micro

  tags = {
    Name = ExampleAppServerInstance
  }
}