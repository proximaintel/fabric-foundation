# Shortcuts

## Overview

Fabric shortcuts provide a way to reference external data without copying it into OneLake. Data stays in place — Fabric reads it directly.

## Supported Sources

| Source | Connection Type | Use Case |
|--------|----------------|----------|
| ADLS Gen2 | Azure Storage shortcut | Existing Azure data lake |
| Amazon S3 | S3 shortcut | Multi-cloud data access |
| Google Cloud Storage | GCS shortcut | Multi-cloud data access |
| Dataverse | Dataverse shortcut | Dynamics 365 data |
| Another Fabric Lakehouse | OneLake shortcut | Cross-workspace sharing |

## When to Use Shortcuts vs. Copy

| Scenario | Approach |
|----------|----------|
| Data already in ADLS Gen2, no transformation needed | Shortcut |
| Data needs transformation before consumption | Copy (via pipeline) → Lakehouse |
| Cross-cloud data access (S3, GCS) | Shortcut |
| Real-time access to source system | Shortcut |
| Historical snapshots needed | Copy (append-only to bronze) |

## Configuration

1. Open your Fabric Lakehouse
2. Right-click on Tables or Files → New Shortcut
3. Select source type and provide connection details
4. Map to a folder/table name in your lakehouse
