terraform {
    source = "../../../modules//init"
}

include {
    path = find_in_parent_folders()
}

dependencies {
    paths = ["../ecr"]
}

inputs = {
  working_dir = format("%s/../../../app", get_terragrunt_dir())
}