# Terraform AWS S3 state backend module

## Motivation

Although Terraform offers S3 as a backend for its state, there is no publicly
available module to create this backend.

## Usage

Create a Terraform template that will be ran for first.

```
module "chamber-test" {
  source = "github.com/aries1980/terraform-tfstate-s3-backend"

  aws_region     = "${var.aws_region}"
  project_prefix = "my_project_no_789"
  log_bucket     = "my_project_no_789_infrastructure_logs"
}
```

As seen in the module `variables.tf`, there are couple of required and optional variables that needs to be provided:

- `aws_region`

> *Required.*  The name AWS region where the states are stored.

- `project_prefix`

> *Required.*  The prefix to use on the buckets to avoid the naming clash between multiple projects.

- `log_bucket`

> *Required.*  The name of the bucket that stores the logs for the state bucket.  Inside this bucket a `tfstates-logs/` folder will be created.


