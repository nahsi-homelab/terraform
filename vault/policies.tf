resource "vault_policy" "policy" {
  for_each = fileset("${path.module}", "policies/**.hcl")
  name     = trimsuffix(basename(each.value), ".hcl")
  policy   = file(each.value)
}
