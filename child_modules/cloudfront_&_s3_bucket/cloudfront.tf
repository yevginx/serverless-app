######################## CloudFront and S3 bucket ###################

#### Create s3 bucket ########

resource "aws_s3_bucket" "memo_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_tag_name
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.memo_bucket.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_ownership]

  bucket = aws_s3_bucket.memo_bucket.id
  acl    = var.bucket_acl

}

########### local for s3_origin_name #####################

locals {
  s3_origin_id = var.s3_origin_id_name
}

######### Host website configuration ######

resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.memo_bucket.bucket

  index_document {
    suffix = var.hosting
  }
}

##### create CloudFront Policy for s3 bucket ##################

resource "aws_s3_bucket_policy" "cloudfront_s3_bucket_policy" {
  depends_on = [aws_cloudfront_distribution.s3_distribution]
  bucket     = aws_s3_bucket.memo_bucket.id
  policy = jsonencode({
    Version = "2008-10-17"
    Id      = "PolicyForCloudFrontPrivateContent"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.memo_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.s3_distribution.arn
          }
        }
      }
    ]
  })
}


########## Create CloudFront ###############

resource "aws_cloudfront_distribution" "s3_distribution" {
  depends_on = [aws_s3_bucket.memo_bucket]


  ######### s3 bucket #############
  origin {
    domain_name              = aws_s3_bucket.memo_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_access.id
    origin_id                = local.s3_origin_id

    # s3_origin_config {
    #   origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    # }
  }

  enabled             = var.s3_origin_config
  default_root_object = var.hosting

  logging_config {
    include_cookies = var.cookies
    bucket          = var.logs_bucket_name
    prefix          = var.prefix
  }

  default_cache_behavior {
    allowed_methods  = var.default_cache_behavior_allowed_methods
    cached_methods   = var.default_cached_methods
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = var.forwarded_values

      cookies {
        forward = var.cookies_forward
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = var.path_pattern
    allowed_methods  = var.default_cache_behavior_allowed_methods
    cached_methods   = var.default_cached_methods
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = var.forwarded_values
      headers      = [var.headers]

      cookies {
        forward = var.cookies_forward
      }
    }

    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
    compress               = var.compress
    viewer_protocol_policy = var.viewer_protocol_policy
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = var.path_pattern_1
    allowed_methods  = var.default_cache_behavior_allowed_methods
    cached_methods   = var.default_cached_methods
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = var.forwarded_values

      cookies {
        forward = var.cookies_forward
      }
    }

    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
    compress               = var.compress
    viewer_protocol_policy = var.viewer_protocol_policy_1
  }


  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction
      locations        = []
    }
  }

  tags = {
    Environment = var.geo_restriction_tag
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_certificate
  }
}

########### Cloudfront Origin Access Identity #########

# resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
#   comment = var.origin_access_identity_comment
# }

####### Origin Access Control ############
resource "aws_cloudfront_origin_access_control" "s3_access" {
  name                              = var.origin_name
  origin_access_control_origin_type = var.origin_type
  signing_behavior                  = var.signing_behavior
  signing_protocol                  = var.signing_protocol
}
