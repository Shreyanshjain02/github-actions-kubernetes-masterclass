resource "aws_cloudwatch_log_group" "eks" {
  name              = "/aws/eks/skillpulse"
  retention_in_days = 7
}