output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.vpc.id
}

output "subnets_public" {
    description = "Public Subnets"
    value = aws_subnet.subnet_public.*.id
}

output "subnets_private" {
    description = "Private Subnets"
    value = aws_subnet.subnet_private.*.id
}

output "subnets_restric" {
    description = "Restricted Subnets"
    value = aws_subnet.subnet_restricted.*.id
}