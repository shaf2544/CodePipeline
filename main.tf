name: Terraform Deploy to AWS


on:
  push:
    branches:
      - main  # Trigger this pipeline only on pushes to the main branch


jobs:
  terraform:
    runs-on: ubuntu-latest


    steps:
      # Step 1: Check out the code from GitHub
      - name: Checkout code
        uses: actions/checkout@v2


      # Step 2: Set up Terraform
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: '1.4.0'  # Specify the Terraform version you are using


      # Step 3: Configure AWS credentials (updated inputs)
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1


      # Step 4: Debug AWS Credentials
      - name: Debug AWS Credentials
        run: aws sts get-caller-identity


      # Step 5: Initialize Terraform
      - name: Terraform Init
        run: terraform init


      # Step 6: Validate Terraform configuration (optional but recommended)
      - name: Terraform Validate
        run: terraform validate


      # Step 7: Plan Terraform changes
      - name: Terraform Plan
        run: terraform plan


      # Step 8: Apply Terraform changes (auto-approve)
      - name: Terraform Apply
        run: terraform apply -au
