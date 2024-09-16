# Roles for EC2 profile=============================
data "aws_iam_policy_document" "ec2_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "ecs-agent-${var.aws_region}"
  assume_role_policy = data.aws_iam_policy_document.ec2_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_atach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ecs-agent-${var.aws_region}"
  role = aws_iam_role.ec2_role.name
}
# =============================================