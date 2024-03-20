provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web-sg" {
  name = "api-fiap-sg"
  ingress {
    from_port   = 30303
    to_port     = 30303
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_security_group" "web-sg" {
  name = aws_security_group.web-sg.name
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "cluster-terraform"
  role_arn = "arn:aws:iam::058264149904:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-07394ab2e56618d4a", "subnet-093db08a009f47bb9"]
    security_group_ids = [data.aws_security_group.web-sg.id]
  }
}

resource "aws_eks_node_group" "my_node_group" {
  depends_on = [aws_eks_cluster.my_cluster]

  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-nodegroup-terraform"
  subnet_ids      = ["subnet-07394ab2e56618d4a", "subnet-093db08a009f47bb9"]
  instance_types  = ["m6g.medium"]
  ami_type        = "AL2_ARM_64"
  node_role_arn   = "arn:aws:iam::058264149904:role/LabRole"
  scaling_config {
    min_size     = 1
    desired_size = 1
    max_size     = 3
  }
  disk_size = 20

  remote_access {
    ec2_ssh_key = "meupc"
  }
}

data "aws_eks_cluster" "my_cluster_info" {
  name = aws_eks_cluster.my_cluster.name
}
