# EngieImpact
Practice problem for Engie Impact interview (using Terraform, Containers, CI/CD pipeline)

## Starting from scratch I had to do the following:

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
15. Pull secrets out of source control by utilizing environment variables
16. Struggle more with permissions for authentication (there was a file that was being used that container expired creds, so everything I did failed 😖)
17. Struggle with using computer as the build agent (required due to people abusing free azure resources)
18. Add image source code into this repo
19. Change pipeline to build/push images to ACR

I utilized lots of resources for this, here are some that I still had up that I was using:
- [docker commands help](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli)
- [Allow anonymous pull for brevity's sake](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-faq)
- [how to push to azure container registry from local](https://stackoverflow.com/questions/47424481/docker-push-to-azure-container-registry-access-denied)
- [This one was absolutely crucial because of issues that appeared when moving from local to azure 🤷‍♂️](https://stackoverflow.com/questions/67228241/azure-devops-pipelines-with-terraform-failing-on-arm-xxx-parameters)
- [This showed me the correct format for the DOCKER_REGISTRY_SERVER_URL](https://blog.hompus.nl/2020/05/22/link-an-azure-web-app-to-a-container-registry-using-arm-templates/)
- [How to correctly pass in variables through the cmd line](https://www.terraform.io/docs/language/values/variables.html)
- [!!! Important !!! Articulated why using the "latest" tag in terraform and on images would not always update with code updates (spent a while spinning on this one](https://www.youtube.com/watch?v=Ff0DoAmpv6w)

## Summary
This was quite tough, I will absolutely admit! But I feel I have both a much better understanding of the terraform files *and* can see just how much there is to learn and understand about it ahead of me.

There are also definitely ways I can see this being improved (if I were to do it with more experience or more knowledge from the outset) like:
- Starting an app from scratch instead of borrowing an existing working sample app from microsoft to leverage the dockerfile
- More robust authentication, as I am currently using a SAS token with a just-long-enough lifespan for quickly playing with
- I would add more structure to the pipeline yaml file to separate building and provisioning/deploying
- and much more, I am sure!
