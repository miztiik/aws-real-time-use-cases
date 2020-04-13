provider "aws" {
  region  = "eu-west-1"
}

data "aws_caller_identity" "current" {}

resource "aws_guardduty_detector" "GuardDuty" {
  enable = true
}

resource "aws_inspector_assessment_template" "AssessmentTemplate" {
  name = "Inspector Assessment Template_nRS"
  duration = 3600
  rules_package_arns = ["arn:aws:inspector:eu-west-1:357557129151:rulespackage/0-ubA5XvBh"]
  target_arn = "${aws_inspector_assessment_target.AssessmentTargetForAssessmentTemplate.arn}"
}

resource "aws_inspector_assessment_target" "AssessmentTargetForAssessmentTemplate" {
  name = "Amazon Inspector Targets"
}



resource "aws_iam_role" "IamRoleForAssessmentTemplate" {
  name = "IamRoleForInspectorScheduledEventxVR"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["events.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "IamRoleForAssessmentTemplateInlinePolicyRoleAttachment0" {
  name = "InspectorAssessmentTrigger"
  role = "${aws_iam_role.IamRoleForAssessmentTemplate.id}"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "inspector:StartAssessmentRun"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}



resource "aws_cloudwatch_event_rule" "CwEventForAssessmentTemplate" {
  name = "InspectorScheduledAssessmentPVP"
  description = "Scheduled trigger for Amazon Inspector Assessment: "
  schedule_expression = "cron(00 00 ? * SAT *)"
}

resource "aws_cloudwatch_event_target" "TargetForCwEventForAssessmentTemplate" {
  rule = "${aws_cloudwatch_event_rule.CwEventForAssessmentTemplate.name}"
  target_id = "AmazonInspectorAssessment"
  arn = "${aws_inspector_assessment_template.AssessmentTemplate.arn}"
  role_arn = "${aws_iam_role.IamRoleForAssessmentTemplate.arn}"
}

resource "aws_securityhub_account" "SecurityHub" {
}


resource "aws_sns_topic" "sns" {
  name = "user-updates-topic"
  email_address = "email@example.com"
}


resource "aws_cloudwatch_event_rule" "CwEvent1" {
  name = "detect-securityhub-finding"
  description = "A CloudWatch Event Rule that triggers on AWS Security Hub findings. The Event Rule can be used to trigger notifications or remediative actions using AWS Lambda."
  is_enabled = true
  event_pattern = <<PATTERN
{
  "detail-type": [
    "Security Hub Findings - Imported"
  ],
  "source": [
    "aws.securityhub"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_target" "TargetForCwEvent1" {
  rule = "${aws_cloudwatch_event_rule.CwEvent1.name}"
  target_id = "target-id1"
  arn = "${aws_sns_topic.sns.arn}"
}

data "aws_iam_policy_document" "topic-policy-PolicyForSnsTopic" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "${data.aws_caller_identity.current.account_id}"
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_sns_topic.sns.arn}"
    ]

    sid = "__default_statement_ID"
  }
  
  statement {
    actions = [
      "sns:Publish"
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [
      "${aws_sns_topic.sns.arn}"
    ]

    sid = "TrustCWEToPublishEventsToMyTopic"
  }
}

resource "aws_sns_topic_policy" "TopicPolicyForSnsTopic1" {
  arn = "${aws_sns_topic.sns.arn}"
  policy = "${data.aws_iam_policy_document.topic-policy-PolicyForSnsTopic.json}"
}

resource "aws_cloudwatch_event_rule" "CwEvent2" {
  name = "detect-guardduty-finding"
  description = "A CloudWatch Event Rule that triggers on Amazon GuardDuty findings. The Event Rule can be used to trigger notifications or remediative actions using AWS Lambda."
  is_enabled = true
  event_pattern = <<PATTERN
{
  "detail-type": [
    "GuardDuty Finding"
  ],
  "source": [
    "aws.guardduty"
  ]
}
PATTERN

}

resource "aws_cloudwatch_event_target" "TargetForCwEvent2" {
  rule = "${aws_cloudwatch_event_rule.CwEvent2.name}"
  target_id = "target-id1"
  arn = "${aws_sns_topic.sns.arn}"
}