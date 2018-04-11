resource "aws_iam_role" "cloudwatch_iam_role" {
  name               = "cloudwatch_iam_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "cloudwatch_instance_profile" {
  name = "cloudwatch_instance_profile"
  role = "cloudwatch_iam_role"
}

resource "aws_iam_role_policy" "cloudwatch_iam_role_policy" {
  name = "cloudwatch_iam_role_policy"
  role = "${aws_iam_role.cloudwatch_iam_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action":[  
        "logs:*"
      ],
      "Resource":[  
        "arn:aws:logs:*:*:*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AmazonEC2RoleforSSM" {
    role       = "${aws_iam_role.cloudwatch_iam_role.id}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}