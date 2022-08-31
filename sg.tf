module "sg" {
    region = var.region
    source = "github.com/agnani/security_group"
    name = "openvpn-sg"
    description = "security group for vpn server"
    vpc_id = var.vpc_id
    tags = var.tags
    rules = {
        1 = {
            description = "allow ssh into instance"
            type = "ingress"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]      
        }
        2 = {
            description = "openvpn"
            type = "ingress"
            from_port = 1194
            to_port = 1194
            protocol = "udp"
            cidr_blocks = ["0.0.0.0/0"] 
        }
        3 = {
            description = "openvpn"
            type = "ingress"
            from_port = 943
            to_port = 943
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"] 
        }
        4 = {
            description = "openvpn"
            type = "ingress"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"] 
        }
        5 = {
            description = "openvpn"
            type = "egress"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}