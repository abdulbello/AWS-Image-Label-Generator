Image Label Generator using AWS Rekognition

📌 Overview
This project is an AWS-powered Image Label Generator that automatically detects labels in uploaded images using AWS Rekognition. The architecture is built using Terraform for infrastructure provisioning and includes an API for fetching labels.

🚀 Features
✅ Upload images to S3
✅ Automatically detect image labels using AWS Rekognition
✅ Store label data in DynamoDB
✅ Notify users via SNS (Optional)
✅ Expose a REST API via API Gateway

🛠 Architecture
The system is designed using AWS serverless services for scalability and cost-efficiency.

1️⃣ S3 – Stores uploaded images.
2️⃣ Lambda – Triggers on new image uploads, processes images, and calls Rekognition.
3️⃣ Rekognition – Detects objects, labels, and text in images.
4️⃣ DynamoDB – Stores label metadata.
5️⃣ API Gateway – Provides a REST API for retrieving image labels.
6️⃣ SNS (Optional) – Sends notifications when processing is complete.

📦 Project Structure
python
Copy code
📂 aws-image-label-generator
│── 📂 modules               # Terraform modules
│   ├── 📂 s3                # S3 bucket & event notifications
│   ├── 📂 dynamodb          # DynamoDB table
│   ├── 📂 lambda            # Lambda function
│   ├── 📂 sns               # SNS notifications
│   ├── 📂 api_gateway       # API Gateway
│── 📂 lambda_function       # Python Lambda code
│── 📜 main.tf               # Root Terraform configuration
│── 📜 variables.tf          # Global variables
│── 📜 outputs.tf            # Terraform outputs
│── 📜 README.md             # Project documentation
