# Power BI Direct Lake

## Overview

Direct Lake mode connects Power BI semantic models directly to Delta tables in Fabric Lakehouse — no data import, no DirectQuery latency. Data is read directly from OneLake at query time.

## When to Use Direct Lake

| Scenario | Mode | Why |
|----------|------|-----|
| Large datasets (10GB+) with fast refresh needs | Direct Lake | No import needed, always current |
| Small datasets (<1GB) with complex DAX | Import | Better DAX performance |
| Real-time operational reporting | DirectQuery | Sub-second freshness |
| Enterprise analytics on lakehouse | Direct Lake | Best of both worlds |

## Setup Steps

1. Create a lakehouse with gold-layer Delta tables
2. Create a new semantic model in the same workspace
3. Select "Direct Lake" as the storage mode
4. Add tables from the lakehouse
5. Define relationships, measures, and hierarchies
6. Publish reports connected to the semantic model

## Best Practices

- Keep gold tables optimized (V-Order, Z-Order on filter columns)
- Limit table count in semantic model (< 20 tables)
- Use calculated columns sparingly (prefer lakehouse-level computation)
- Monitor fallback to DirectQuery (indicates table too large for memory)
- Set automatic page refresh for near-real-time dashboards
