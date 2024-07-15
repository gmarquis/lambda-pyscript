html = '''
<head>
<meta charset="UTF-8"/>
<link rel="stylesheet" href="https://gm-code.s3.eu-west-1.amazonaws.com/.css">
<link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<script defer src="https://pyscript.net/alpha/pyscript.js"></script>
<title>Lambda Pyscript</title>
<py-env> </py-env>
</head>
<body>

<h1> Hello from PyScript </h1>

</body>
</html> '''

def lambda_handler(event, context):
     return {
          'statusCode': 200,
          'headers': {'Content-Type': 'text/html'},
          'body': html
}

