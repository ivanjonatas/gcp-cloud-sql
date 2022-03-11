resource "google_sql_database_instance" "instance" {
  name             = var.name
  region           = var.region
  database_version = var.db_version
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection  = var.protection
}

resource "google_sql_user" "users" {
  name     = var.u_name
  instance = google_sql_database_instance.instance.name
  password = var.u_pass
}