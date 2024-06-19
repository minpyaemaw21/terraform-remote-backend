resource "aws_s3_bucket" "mp-master-bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_ownership_controls" "mp-master-bucket-ownership" {
  bucket = aws_s3_bucket.mp-master-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "mp-master-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.mp-master-bucket-ownership]

  bucket = aws_s3_bucket.mp-master-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "mp-master-bucket-versioning" {
  bucket = aws_s3_bucket.mp-master-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "mp-master-bucket-server-side-encryption" {
  bucket = aws_s3_bucket.mp-master-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      #kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_kms_key" "mykey" {
  description = "KMS key for S3 bucket encryption"
}


resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.dynamodb_name
  billing_mode   = var.billing_mode_dynamodb
  hash_key       = "LockID"
  range_key      = "GameTitle"

  attribute {
    name = "LockID"
    type = "S"
  }

 
}