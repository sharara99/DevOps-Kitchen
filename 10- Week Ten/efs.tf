resource "aws_efs_file_system" "efs" {
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name        = var.efs_name
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  for_each = {
    "a" = aws_subnet.subnet_public_1.id
    "b" = aws_subnet.subnet_public_2.id
  }

  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = each.value
  security_groups = [aws_security_group.efs_sg.id]
}

# Add this EFS Access Point resource
resource "aws_efs_access_point" "access_point" {
  file_system_id = aws_efs_file_system.efs.id

  posix_user {
    uid = 1000
    gid = 1000
  }

  root_directory {
    path = "/lambda"
    creation_info {
      owner_uid   = 1000
      owner_gid   = 1000
      permissions = 755
    }
  }

  tags = {
    Name        = "efs-access-point"
    Environment = var.Environment
    Owner       = var.Owner
  }
}