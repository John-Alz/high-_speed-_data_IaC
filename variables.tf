variable "region" {
  default = "us-east-1"
}

variable "capacity" {
  description = "Nombre del proyecto"
  type        = string
}

variable "env" {
  description = "Ambiente (dev, qa, sbx, stg, pdn)"
  type        = string
}

variable "country" {
  description = "País de despliegue (co, pa, gt, ts)"
  type        = string
}

variable "confidentiality" {
  description = "Clasificación de confidencialidad"
  type        = string
}

variable "integrity" {
  description = "Clasificación de integridad"
  type        = string
}

variable "availability" {
  description = "Clasificación de disponibilidad"
  type        = string
}

variable "pci" {
  description = "Cumple con pci"
  type        = bool
}


variable "information_domain" {
  description = "Dominio de información"
  type        = string
}

variable "personal_data" {
  description = "Datos personales"
  type        = bool
}

variable "standard_name" {
  description = "Nombre de estándar"
  type        = bool
}

variable "tags" {
  description = "Etiquetas clave/valor"
  type        = map(string)
}

variable "tables" {
  description = "Tablas a crear"
  type        = any
}

variable "elasticache_engine_type" {
  description = "Tipo de motor de elasticache"
  type        = string
}

variable "elasticache_engine_version" {
  description = "Versión del motor de elasticache"
  type        = string
}

variable "elasticache_maintenance_window" {
  description = "Ventana de mantenimiento de elasticache"
  type        = string
}

variable "elasticache_node_type" {
  description = "Tipo de nodo de elasticache"
  type        = string
}