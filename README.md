# react-s3-website-githubActions-terraform
Simple boilerplate for hosting React website on AWS S3 Bucket

Before runnng the terrafom main.tf file for the first time, comment the backend block in the file. This is because initially there will be no remote backend created for terraform. Hence initially run terraform with local state. Once the backend S3 bucket is created, then you can uncomment the backend block and run "terraform init --migrate-state". This will migrate the state to remote backend.

Also you will need to add following to the secrets:  
  
AWS_ACCESS_KEY_ID<br />
AWS_ROLE_TO_ASSUME<br />
AWS_SECRET_ACCESS_KEY<br />
