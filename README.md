# Module - Oracle Container Engine (OKE) Addons
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![OCI](https://img.shields.io/badge/provider-OCI-red)](https://registry.terraform.io/providers/oracle/oci/latest)

Module developed to standardize the addition of addons on OKE.

## Compatibility Matrix

| Module Version | Terraform Version | OCI Version     |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.9.8            | 6.13.0          |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Use case Autoscaler
```hcl
module "autoscaler" {
  source = "git::https://github.com/danilomnds/terraform-oci-oke-addon?ref=v1.0.0"
  addon_name = "ex: ClusterAutoscaler"
  cluster_id = <cluster_id>
  configurations = [{
    key = "nodes"
    value = "1:1:node ocid1,1:1:node ocid2,1:1:node ocid3"
  },
  {
    key   = "tolerations"
    value = "[{\"key\": \"CriticalAddonsOnly\", \"value\": \"true\", \"effect\": \"NoSchedule\"}]"
  }
  ]  
}
output "current_installed_version" {
  value = module.autoscaler.current_installed_version
}
output "addon_name" {
  value = module.autoscaler.addon_name
}
output "time_created" {
  value = module.autoscaler.time_created
}
output "version" {
  value = module.autoscaler.version
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| addon_name | The name of the addon | `string` | n/a | `Yes` |
| cluster_id | The OCID of the cluster | `string` | n/a | `Yes` |
| remove_addon_resources_on_delete | Whether to remove addon resource in deletion | `bool` | n/a | No |
| configurations | Addon configuration details check the documentation [here](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_addon) | `object({})` | n/a | No |
| override_existing | Whether or not to override an existing addon installation | `bool` | `false` | No |
| addon_version | The version of addon to be installed | `string` | n/a | No |

# Object variables for blocks
Please check the documentation [here](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_addon)

## Output variables

| Name | Description |
|------|-------------|
| current_installed_version | current installed version of the addon |
| addon_name | The name of the addon |
| time_created | The time the cluster was created |
| version | selected addon version, or null indicates autoUpdate |

## Documentation
Oracle Container Engine Addon: <br>
[https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_addon](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_addon)