terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  account_id                = data.aws_caller_identity.current.account_id
  cloudwatch_prefix         = "/aws/vendedlogs/msk/${var.project}-msk"
  cloudwatch_msk_logs_group = "${local.cloudwatch_prefix}/${var.env}"
  # Common tags to be assigned to all resources
  common_tags = {
    Project     = var.project
    Environment = var.env
    CreatedBy   = "Terraform"
    CostCategory = var.cost_category
   }  
}


resource "aws_msk_cluster" "msk-cluster" {
  cluster_name           = "${var.project}-${var.env}"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.enhanced_monitoring

  configuration_info {
    arn      = aws_msk_configuration.msk_config.arn
    revision = aws_msk_configuration.msk_config.latest_revision
  }

  broker_node_group_info {
    instance_type   = var.instance_type
    storage_info {
      ebs_storage_info {
        volume_size = var.ebs_volume_size
      }
    }
    client_subnets  = var.subnet_ids
    security_groups = [aws_security_group.kafka-broker-sg.id]
  }

  client_authentication {
     tls {
       certificate_authority_arns = var.certificate_authority_arns
     }
   }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = local.cloudwatch_logs_group
      }
    }
  }

  tags = merge(local.common_tags, tomap({
    Name = "${var.project}-msk-${var.env}"
  }))
}

resource "aws_msk_configuration" "msk_config" {

  kafka_versions = [var.kafka_versions]
  name           = "${var.project}-${var.env}"

  server_properties = <<PROPERTIES
auto.create.topics.enable      = ${var.auto_create_topics_enable}
default.replication.factor     = ${var.default_replication_factor}
min.insync.replicas            = ${var.min_insync_replicas}
num.io.threads                 = ${var.num_io_threads}
num.network.threads            = ${var.num_network_threads}
num.partitions                 = ${var.num_partitions}
num.replica.fetchers           = ${var.num_replica_fetchers}
socket.request.max.bytes       = ${var.socket_request_max_bytes}
unclean.leader.election.enable = ${var.unclean_leader_election_enable}
PROPERTIES
}

###########################
## AWS logs group
###########################

resource "aws_cloudwatch_log_group" "msk_log_group" {
  name              = local.cloudwatch_logs_group
  retention_in_days = var.retention_in_days

  tags = merge(local.common_tags, tomap({
    Name = "${var.project}-msk-${var.env}"
  }))
}