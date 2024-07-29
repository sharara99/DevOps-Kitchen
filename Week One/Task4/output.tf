output "s3_bucket" {
  value = aws_s3_bucket.bucket1.bucket
}

output "ahmed_user_arn" {
  value = aws_iam_user.ahmed.arn
}

output "mahmoud_user_arn" {
  value = aws_iam_user.mahmoud.arn
}

output "mostafa_user_arn" {
  value = aws_iam_user.mostafa.arn
}

output "mostafa_role_arn" {
  value = aws_iam_role.mostafa_role.arn
}

