resource "aws_security_group" "kafka-broker-sg" {
  name   = "${var.project}-msk-sg-${var.env}"
  vpc_id = var.vpc_id

  ingress {
    from_port       = var.zookeeper_port
    to_port         = var.zookeeper_port
    protocol        = "tcp"
    security_groups = var.allow_security_group_ids
    description     = "Allow SGs to the zookeeper on Kafka MSK cluster"
  }

  ingress {
    from_port       = var.kafka_port
    to_port         = var.kafka_port
    protocol        = "tcp"
    cidr_blocks     = var.cidrs
    description     = "Allow IPs to access the Kafka MSK cluster"
  }

  tags = merge(local.common_tags, tomap({
    Name = "${var.project}-sg-msk-${var.env}"
  }))
}