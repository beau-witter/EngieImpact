# EngieImpact
Practice problem for Engie Impact interview (using Terraform, Containers, CI/CD pipeline)

Starting from scratch I had to do the following:

1. Setup brand new organization and pipeline in personal Azure DevOps (made public)
2. Add "Terraform" task to organization for usage in the pipeline
3. Create new public repository in GitHub (the one we are in)
4. Download Terraform executable and add to my Path
5. Download and install Docker Desktop on Windows
   1.  Turn on Containers and Hyper V for windows
6. Restart computer to ensure all newly installed apps function properly
7. Follow the "Getting started" section from [this part of the hashiCorp site](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
8. Also follow the first time setup from [this part of the docker site](https://docs.docker.com/docker-for-windows/install/)
9. Continue with terraform setup by following steps provided [for azure](https://learn.hashicorp.com/tutorials/terraform/azure-build)
10. Create a container registry [with help from this site](https://www.ntweekly.com/2020/10/28/create-an-azure-container-registry-acr-with-terraform/)
11. Begin creating the rest of the necessary parts of the main.tf file using [this site as a loose template](https://pumpingco.de/blog/deploy-an-azure-web-app-for-containers-with-terraform/) and referencing the [offical docs here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service#example-usage)
12. Create an image (to populate the ACR to test with) from [dotnet/dotnet-docker](https://github.com/dotnet/dotnet-docker)
13. Spend 2 hours troubleshooting authentication/authorization/all that fun stuff
14. One last time run `terraform plan -out=newplan` and then `terraform apply "newplan"`
15. 
