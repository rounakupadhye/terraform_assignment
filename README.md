## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan --var-file="values.tfvars"
$ terraform apply --var-file="values.tfvars"
```

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | ./modules/ec2 | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-region"></a> [aws-region](#input\_aws-region) | n/a | `any` | n/a | yes |
| <a name="input_ec2_attributes"></a> [ec2\_attributes](#input\_ec2\_attributes) | n/a | `any` | n/a | yes |
| <a name="input_rds_attributes"></a> [rds\_attributes](#input\_rds\_attributes) | n/a | `any` | n/a | yes |


