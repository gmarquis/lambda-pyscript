data "archive_file" "lambda-pyscript" {
  type        = "zip"
  source_file = "lambda-pyscript.py"
  output_path = "lambda-pyscript.zip"
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda-pyscript" {
  name               = "lambda-pyscript"
  assume_role_policy = "${data.aws_iam_policy_document.policy.json}"
}

resource "aws_lambda_function" "lambda-pyscript" {
  function_name    = "lambda-pyscript"
  filename         = "${data.archive_file.lambda-pyscript.output_path}"
  source_code_hash = "${data.archive_file.lambda-pyscript.output_base64sha256}"
  role      	   = "arn:aws:iam::735522019233:role/lambda-pyscript"
  ##role    	   = "arn:aws:iam::735522019233:role/service-role/PythonHelloWorld-role-3oceq5at"
  handler 	   = "lambda-pyscript.lambda_handler"
  runtime 	   = "python3.10"

  environment {
    variables = {
      greeting = "lambda-pyscript"
    }
  }
}

resource "aws_lambda_function_url" "lambda-pyscript" {
  function_name      = "lambda-pyscript"
  authorization_type = "NONE"
}

