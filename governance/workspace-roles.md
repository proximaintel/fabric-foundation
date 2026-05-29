# Workspace Roles

## Role Hierarchy

| Role | Permissions | Assign To |
|------|------------|-----------|
| Admin | Full control — manage workspace, add members, publish | Platform team leads |
| Member | Create/edit items, run notebooks, build reports | Data engineers, analysts |
| Contributor | Edit existing items, cannot create new | Junior team members |
| Viewer | Read-only access to reports and dashboards | Business stakeholders |

## Workspace Structure

| Workspace | Purpose | Admin Group |
|-----------|---------|-------------|
| `fabric-dev` | Development and experimentation | Platform Team |
| `fabric-staging` | Pre-production validation | Platform Team |
| `fabric-prod` | Production workloads | Platform Team (restricted) |
| `fabric-reporting` | Power BI reports and dashboards | Analytics Team |

## Access Model

- Use Entra ID security groups for role assignment (never individual users)
- Separate groups per workspace per role
- Example: `PRX-Fabric-Prod-Member`, `PRX-Fabric-Dev-Admin`
- Review access quarterly
