output "mp-master-s3-bucket-name" {
    value = resource.aws_s3_bucket.mp-master-bucket.arn
}

output "mp-master-dynamodb_name" {
    value = resource.aws_dynamodb_table.terraform_locks.id
}