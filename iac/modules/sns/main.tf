resource "aws_sns_topic" "image_notifications" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.image_notifications.arn
  protocol  = "email"
  endpoint  = var.notification_email
}
