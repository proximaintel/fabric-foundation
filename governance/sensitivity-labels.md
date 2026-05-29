# Sensitivity Labels

## Label Taxonomy

| Label | Description | Auto-apply | Encryption |
|-------|-------------|:---:|:---:|
| Public | Non-sensitive, shareable externally | No | No |
| Internal | Business data, internal use only | No | No |
| Confidential | Sensitive business data | Yes (patterns) | Yes |
| Highly Confidential | PII, PHI, financial data | Yes (patterns) | Yes |
| Restricted | Regulated data (HIPAA, PCI) | Yes | Yes + DLP |

## Application to Fabric Items

| Fabric Item | Label Inheritance | Notes |
|-------------|:-:|-------|
| Lakehouse | Manual | Set at lakehouse level, inherits to tables |
| Semantic Model | Inherits from source | Follows lakehouse label |
| Report | Inherits from model | Can be overridden (more restrictive only) |
| Dataflow | Manual | Set per dataflow |

## Configuration

1. Define labels in Microsoft Purview Compliance Portal
2. Publish label policies to Fabric users
3. Enable auto-labeling for PII patterns (SSN, credit card, email)
4. Configure DLP policies for "Restricted" label (block external sharing)
