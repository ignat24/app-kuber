# main.tf 

resource "aws_eks_cluster" "main" {
  name = "k8s-${var.env}-${var.app}"
  role_arn = aws_iam_role.ecs_role.arn

  
  vpc_config {
    subnet_ids=aws_subnet.public_subnets.*.id
    security_group_ids = [aws_security_group.sg.id]
  }
}
# ami-00c162cf1f92de1c3

resource "aws_eks_node_group" "ng_eks" {

  cluster_name = aws_eks_cluster.main.name
  node_group_name = "ng-${var.env}-${var.app}"
  node_role_arn = aws_iam_role.ng_role.arn
  subnet_ids = aws_subnet.public_subnets[*].id

  scaling_config {
    desired_size=var.az_count
    max_size = var.az_count
    min_size = var.az_count
  }


#   =========
  # ami_type = ami-00c162cf1f92de1c3
  # instance_types = ["t2.micro"]
}