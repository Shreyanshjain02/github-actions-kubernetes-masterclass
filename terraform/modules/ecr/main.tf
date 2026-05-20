resource "aws_ecr_repository" "frontend" {
  name = "${var.environment}-skillpulse-frontend"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

}

resource "aws_ecr_repository" "backend" {
  name = "${var.environment}-skillpulse-backend"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"
  
}