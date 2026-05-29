# Microsoft Fabric Foundation

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Bicep](https://img.shields.io/badge/Bicep-latest-blue.svg)](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.5-purple.svg)](https://www.terraform.io/)

**Enterprise Microsoft Fabric foundation — Bicep/Terraform IaC, OneLake configuration, lakehouse architecture, Dataflow Gen2 pipelines, and Purview governance for regulated industries.**

Built by [Proxima Intelligence](https://proximaintel.com) — Enterprise Cloud & AI Consulting.

---

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Microsoft Fabric                           │
│                                                             │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   │
│  │ Lakehouse    │   │ Dataflow     │   │ Power BI     │   │
│  │ (OneLake,    │   │ Gen2         │   │ Direct Lake  │   │
│  │  Medallion)  │   │ (Pipelines)  │   │ (Semantic)   │   │
│  └──────┬───────┘   └──────┬───────┘   └──────────────┘   │
│         │                  │                                │
│  ┌──────┴──────────────────┴───────┐                       │
│  │     Fabric Capacity (F-SKU)     │                       │
│  │     Managed VNet + Private      │                       │
│  │     Endpoints                   │                       │
│  └──────────────┬──────────────────┘                       │
│                 │                                           │
│  ┌──────────────┴──────────────────┐                       │
│  │     Microsoft Purview           │                       │
│  │  (Governance, Sensitivity       │                       │
│  │   Labels, Lineage)              │                       │
│  └─────────────────────────────────┘                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
         │
         │ Shortcuts / External Data
         ▼
┌─────────────────────┐     ┌─────────────────────┐
│ ADLS Gen2           │     │ External Sources    │
│ (Existing data      │     │ (S3, GCS,          │
│  lake)              │     │  On-premises)       │
└─────────────────────┘     └─────────────────────┘
```

## Modules

| Directory | Description | IaC |
|-----------|-------------|-----|
| [bicep/](bicep/) | Azure infrastructure — Fabric capacity, networking, Purview, monitoring | Bicep (primary) |
| [terraform/](terraform/) | Alternative IaC for teams preferring Terraform | Terraform |
| [lakehouse/](lakehouse/) | Medallion architecture notebooks and shortcuts | Python/Config |
| [pipelines/](pipelines/) | Dataflow Gen2 and Data Factory pipeline templates | JSON |
| [governance/](governance/) | Sensitivity labels, workspace roles, Purview policies | Documentation |
| [power-bi/](power-bi/) | Direct Lake semantic model and reporting templates | Documentation |

## Quick Start

### Bicep (recommended)

```bash
git clone https://github.com/proximaintel/fabric-foundation.git
cd fabric-foundation/bicep

cp parameters.json.example parameters.json
# Edit parameters.json with your values

az deployment group create \
  --resource-group rg-fabric-foundation \
  --template-file main.bicep \
  --parameters @parameters.json
```

### Terraform (alternative)

```bash
cd fabric-foundation/terraform

cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars

terraform init
terraform plan
terraform apply
```

## Prerequisites

- Azure subscription with Contributor access
- Fabric capacity license (F2 for dev, F64+ for production)
- Microsoft Purview account (for governance features)
- Azure CLI or Terraform >= 1.5

## Capacity Sizing

| SKU | CUs | Best For | Monthly Cost (est.) |
|-----|-----|----------|---------------------|
| F2 | 2 | Dev/test, small teams | ~$260 |
| F16 | 16 | Small production workloads | ~$2,100 |
| F64 | 64 | Enterprise production | ~$8,400 |
| F128 | 128 | Large-scale analytics | ~$16,800 |

## Documentation

- [Architecture](docs/architecture.md) — design decisions and data flow
- [Deployment Guide](docs/deployment-guide.md) — step-by-step instructions
- [Capacity Management](docs/capacity-management.md) — sizing, pause/resume, burst
- [Cost Optimization](docs/cost-optimization.md) — strategies to control spend
- [Compliance](docs/compliance.md) — data residency, encryption, audit

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## About Proxima Intelligence

[Proxima Intelligence](https://proximaintel.com) delivers the Microsoft Fabric Foundation as a [fixed-scope accelerator](https://proximaintel.com/accelerators/fabric-foundation) — deployed in 4 weeks for regulated enterprises.

Senior architects on every engagement. No bait-and-switch.

---

*© Proxima Intelligence LLC. Licensed under Apache 2.0.*
