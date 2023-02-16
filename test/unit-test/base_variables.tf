variable "networking" {

  type = list(any)

}

variable "GH_RUN" {
  type = string
  description = "The GitHub run id/attempt which is used to uniquely identify resources against their workflow run"
}
