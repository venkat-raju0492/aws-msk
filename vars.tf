### AWS secrets manager ###

variable "project" {
  type        = string
  description = "Project name"
}

variable "region" {
  description = "AWS region"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "cost_category" {
  description = "cost category"
}

variable "kafka_version" {
  description = "The desired Kafka software version."
}
variable "kafka_port" {
  description = "Kafka port"
}

variable "kafka_versions" {
  description = "List of Apache Kafka versions which can use this configuration."
}

variable "number_of_broker_nodes" {
  description = "number_of_broker_nodes"
}

variable "enhanced_monitoring" {
  description = "Level for MSK CloudWatch metrics"
}

variable "instance_type" {
  description = "instance_type"
}

variable "ebs_volume_size" {
  description = "ebs_volume_size"
}

variable "subnet_ids" {
  description = "client_subnets"
}
variable "cidrs" {
  description = "Private subnets of eu-west-2. Allows access from PC-EU ETL to MSK US"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "min_insync_replicas" {
  description = "The minimum number of replicas that must acknowledge a write for the write to be considered successful"
}

variable "auto_create_topics_enable" {
  description = "auto_create_topics_enable"
}

variable "default_replication_factor" {
  description = "default_replication_factor"
}

variable "num_io_threads" {
  description = "num_io_threads"
}

variable "num_network_threads" {
  description = "num_network_threads"
}

variable "num_partitions" {
  description = "num_partitions"
}

variable "num_replica_fetchers" {
  description = "num_replica_fetchers"
}

variable "socket_request_max_bytes" {
  description = "socket_request_max_bytes"
}

variable "unclean_leader_election_enable" {
  description = "unclean_leader_election_enable"
}

variable "retention_in_days" {
  description = "Number of days to keep the logs"
}

variable "allow_security_group_ids" {
  description = "Security groups that RDS will allow access"
}

variable "zookeeper_port" {
  description = "zookeeper port"
}

variable "certificate_authority_arns" {
  description = "certificate authority arns"
}