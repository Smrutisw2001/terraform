
# Data source to get the OIDC policy document
data "aws_iam_policy_document" "ebs_csi_irsa" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::218306567362:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/97E4E32D9CFCF9D42953F512F5DBBAE8"]
    }

    condition {
      test     = "StringEquals"
      variable = "oidc.eks.ap-south-1.amazonaws.com/id/97E4E32D9CFCF9D42953F512F5DBBAE8:sub"
      values = [
        "system:serviceaccount:kube-system:ebs-csi-controller-sa"
      ]
    }

    effect = "Allow"
  }
}

# Create the IAM Role
resource "aws_iam_role" "ebs_csi" {
  name               = "ebs-csi-role-for-smruti-eks"
  assume_role_policy = data.aws_iam_policy_document.ebs_csi_irsa.json
}

# Attach the AmazonEBSCSIDriverPolicy to the IAM Role
resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi.name
}

# Output IAM role ARN
output "ebs_csi_role_arn" {
  value = aws_iam_role.ebs_csi.arn
}
