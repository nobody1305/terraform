resource "aws_iam_role" "new_role" {
  for_each = { for role in var.roles : role.name => role }

  name = each.key

  # Load Assume Role policy from the specified JSON file
  assume_role_policy = file("policies/${each.value.assume_role_policy}")
}

resource "aws_iam_policy" "inline_policy" {
  for_each = { for role in var.roles : role.name => role }

  name        = "${each.key}_inline_policy"
  path        = "/"
  description = "Inline policy for ${each.key}"

  policy = file("policies/${each.value.inline_policy}")
}

resource "aws_iam_role_policy_attachment" "inline_policy_attachment" {
  for_each = { for role in var.roles : role.name => role }

  role       = aws_iam_role.new_role[each.key].name
  policy_arn = aws_iam_policy.inline_policy[each.key].arn
}
