# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Manage userpass auth methods
path "auth/userpass/*" {
  capabilities = ["create", "read", "update", "delete"]
}

# Manage github auth methods
path "auth/github/*" {
  capabilities = ["create", "read", "update", "delete"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# Remount secret engines
path "sys/remount"
{
  capabilities = ["update", "sudo"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# Read logs
path "sys/monitor"
{
  capabilities = ["read"]
}

# List, create, update, and delete key/value secrets at secret/
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage PKI
path "pki/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage leases
path "sys/leases/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/leases/lookup"
{
  capabilities = ["list", "sudo"]
}

# Manage groups
path "sys/groups/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage entites and groups
path "identity/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Configure the postgres secrets engine and create roles
path "postgres/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Configure the mongo secrets engine and create roles
path "mongo/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

