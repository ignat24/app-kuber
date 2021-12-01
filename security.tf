resource "aws_security_group" "sg_webserver"{
    name = "SG-${var.app}-${var.env}"
    description = var.sg_description

    dynamic "ingress" {
        for_each = var.ingress_fw_rules
        content {
            description = ingress.value["description"]
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
            ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]
            prefix_list_ids = ingress.value["prefix_list_ids"]
            security_groups = ingress.value["security_groups"]
        }
    }

    dynamic "egress" {
        for_each = var.egress_fw_rules
        content {
            description = egress.value["description"]
            from_port = egress.value["from_port"]
            to_port = egress.value["to_port"]
            protocol = egress.value["protocol"]
            cidr_blocks = egress.value["cidr_blocks"]
            ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]
            prefix_list_ids = egress.value["prefix_list_ids"]
            security_groups = egress.value["security_groups"]
        }
    }

    tags = var.sg_tags
}