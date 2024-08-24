# EC2 Instance Creation

resource "aws_instance" "web_server_https" {
  # ami         = "ami-0ae8f15ae66fe8cda" # Amazon Linux
  ami           = data.aws_ami.amilinux.id
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  subnet_id              = aws_subnet.vpc-httpd-public-subnet.id
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  user_data              = file("apache-install.sh")
  #   user_data = <<-EOF
  #     #!/bin/bash
  #     sudo yum update -y
  #     sudo yum install httpd -y
  #     sudo systemctl enable httpd
  #     sudo systemctl start httpd
  #     echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
  #     EOF
  tags = {
    "Name" = "ApacheWebServer"
    "Team" = var.team
  }
}
