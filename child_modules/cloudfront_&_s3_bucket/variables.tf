variable "bucket_name" {
  type = string
}

variable "bucket_tag_name" {
  type = string
}

variable "object_ownership" {
  type = string
}

variable "bucket_acl" {
  type = string
}

variable "s3_origin_id_name" {
  type = string
}

variable "hosting" {
  type = string
}

variable "s3_origin_config" {
  type = bool
}

variable "logs_bucket_name" {
  type = string
}

variable "cookies" {
  type = bool
}

variable "prefix" {
  type = string
}

variable "default_cache_behavior_allowed_methods" {
  type = list(string)
}

variable "default_cached_methods" {
  type = list(string)
}

variable "forwarded_values" {
  type = bool
}

variable "cookies_forward" {
  type = string
}

variable "viewer_protocol_policy" {
  type = string
}

variable "min_ttl" {
  type = number
}

variable "default_ttl" {
  type = number
}

variable "max_ttl" {
  type = number
}

variable "path_pattern" {
  type = string
}

variable "path_pattern_1" {
  type = string
}

variable "headers" {
  type = string
}

variable "compress" {
  type = bool
}

variable "viewer_protocol_policy_1" {
  type = string
}

variable "geo_restriction" {
  type = string
}

variable "geo_restriction_tag" {
  type = string
}

variable "cloudfront_certificate" {
  type = bool
}

variable "origin_name" {
  type = string
}

variable "origin_type" {
  type = string
}

variable "signing_behavior" {
  type = string
}

variable "signing_protocol" {
  type = string
}
