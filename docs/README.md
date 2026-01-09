## Hierarchy skeleton for Terragrunt

Terragrunt is an excellent wrapper around Terraform that helps to write a DRY code.

```bash
live/
├── terragrunt.hcl          # ROOT (shared config)
├── production/
│   ├── env.hcl
│   ├── k8s-cp-nodes/
│   │   └── terragrunt.hcl  # VM-specific
│   └── k8s-worker-nodes/
│       └── terragrunt.hcl
└── staging/
    ├── env.hcl
    ├── k8s-cp-nodes/
    │   └── terragrunt.hcl
    └── k8s-worker-nodes/
        └── terragrunt.hcl
```

```hcl
source = "git::https://github.com/aminbenmansour/terraform-proxmox-vm.git//.?ref=v1.0.0"
```
> 💡 `//.?ref=` in Terragrunt? `//.` -> `module root` & `ref=` -> `git tag`