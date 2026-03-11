resource "aws_eks_addon" "ebs_csi" {
  cluster_name             = "terraform-eks-cluster"
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = "arn:aws:iam::418272799492:role/ebs-csi-controller"

  resolve_conflicts_on_create = "OVERWRITE"
  depends_on                  = [aws_iam_role.ebs_controller_role]
}