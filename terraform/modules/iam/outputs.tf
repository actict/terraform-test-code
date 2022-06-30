output "profile_name" {
  description = "The Instance profile Name"
  value       = aws_iam_instance_profile.test_profile.name
}
