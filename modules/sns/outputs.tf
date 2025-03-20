output "topic_arn" {
  description = "SNS topic ARN"
  value       = aws_sns_topic.image_notifications.arn
}
