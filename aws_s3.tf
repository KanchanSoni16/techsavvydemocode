#This Configuration file is creating AWS S3 Bucket 

# AWS S3 Bucket Creation
resource "aws_s3_bucket" "api_bucket" {
  bucket = "${var.myregion}-${var.bucket_name}"
  #acl    = "private"
  tags = {
    Name        = "${var.myregion}-${var.bucket_name}"
    Environment = "${var.environment}"
  }
  #acl = var.acl
}

resource "aws_s3_bucket_ownership_controls" "ownership-control" {
  bucket = aws_s3_bucket.api_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access-block" {
  bucket = aws_s3_bucket.api_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#Assigning ACL permission for AWS S3 Bucket 
resource "aws_s3_bucket_acl" "api_acl" {
  bucket = aws_s3_bucket.api_bucket.id
  acl    = var.acl
  depends_on = [
    # aws_s3_bucket.api_bucket
    aws_s3_bucket_ownership_controls.ownership-control,
    aws_s3_bucket_public_access_block.access-block
  ]
}


#Object uploading in S3 bucket

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.api_bucket.id
  key    = var.object_key
  source = var.object_source
  acl    = var.object_acl
  etag   = filemd5(var.object_source)
  depends_on = [
    aws_s3_bucket.api_bucket
  ]
}
