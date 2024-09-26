region                            = "us-west-2"                                     ## AWS region to deploy service
project                           = "poc"                                           ## name of the project
env                               = "dev"                                           ## name of the environment
cost_category                     = "poc"                                           ## cost category tag



kafka_version                     = "2.7.0"                                         ## msk version
kafka_port                        = "9094"                                          ## kafka port with TLS
number_of_broker_nodes            = "3"                                             ## no. of bootstrap server

enhanced_monitoring               = "PER_TOPIC_PER_BROKER"                          ## enhanced monitoring for msk
instance_type                     = "kafka.m5.large"                                ## bootstrap server instance type 
ebs_volume_size                   = 30                                              ## bootstrap server storage
subnet_ids                        = ["subnet-xxxx", "subnet-xxx", "subnet-xxxx"]    ## subnet ids
cidrs                             = ["192.168.1.1./32", "172.16.254.1/32"]          ## ips to all allow access MSK
vpc_id                            = "vpc-xxxxxx"                                    ## vpc ID
auto_create_topics_enable         = "false"                                         ## default msk properties 
default_replication_factor        = "6"                                             ## default msk properties 
min_insync_replicas               = "1"                                             ## default msk properties            
num_io_threads                    = "8"                                             ## default msk properties 
num_network_threads               = "5"
num_partitions                    = "6"                                             ## default msk properties 
num_replica_fetchers              = "2"                                             ## default msk properties 
socket_request_max_bytes          = "104857600"                                     ## default msk properties 
unclean_leader_election_enable    = "true"                                          ## default msk properties 
retention_in_days                 = "30"                                            ## cloud watch log group retention days    
allow_security_group_ids          = ["sg-xxxxxxx","sg-xxxxx"]                       ## Allow msk access with security groups
zookeeper_port                    = "2181"                                          ## zookeeper port
certificate_authority_arns        =  ["<AWS certificate Authority ARN>"]            ## aws certificate manager certificate authority