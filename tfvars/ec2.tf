resource "aws_instance" "expense" {

    for_each = var.instance_names  # iterate over the map variable

    #for_each will create multiple resources based on the number of items in the map in variables.tf
    ami= "ami-09c813fb71547fc4f"
    instance_type = each.value 
    vpc_security_group_ids =[aws_security_group.allow_ssh_terraform.id]
    tags= merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key 
        }

    )
    
    
}
resource "aws_security_group" "allow_ssh_terraform" {
    name="allow_ssh_${var.environment}"
    description="create the security group"

    egress{
        from_port = 0
        to_port = 0
        protocol = 0
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }


    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = "allow_ssh_${var.environment}"
        }
    )

}