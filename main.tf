provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "cluster-terraform"
  role_arn = "arn:aws:iam::058264149904:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-07394ab2e56618d4a", "subnet-093db08a009f47bb9"]
    security_group_ids = ["sg-0ccda97af534c642a"]
  }
}

resource "aws_eks_node_group" "my_node_group" {
  depends_on = [aws_eks_cluster.my_cluster]

  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-nodegroup-terraform"
  subnet_ids      = ["subnet-07394ab2e56618d4a", "subnet-093db08a009f47bb9"]
  instance_types  = ["t3.medium"]
  ami_type        = "AL2_x86_64"
  node_role_arn   = "arn:aws:iam::058264149904:role/LabRole"
  scaling_config {
    min_size     = 1
    desired_size = 1
    max_size     = 3
  }
  disk_size = 20
}
