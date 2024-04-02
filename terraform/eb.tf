resource "aws_cloudwatch_event_rule" "transaction_rule" {
  name          = "${local.resources_prefix}-eb-rule"
  event_pattern = <<EOF
{
  "detail-type": ["transaction"],
  "source": ["custom.myApp"],
  "detail": {
	"location": [{
	  "prefix": "EUR-"
	}]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "target_lambda_function" {
  rule = aws_cloudwatch_event_rule.transaction_rule.name
  arn  = aws_lambda_function.this["main"].arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this["main"].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.transaction_rule.arn
}
