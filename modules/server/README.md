# Terra-Kube Server Module



## Assumptions

- You have the root of your domain pointing to your kubernetes cluster. 
- This is currently for small/simple deployments, which means: 
  - Persisted storage is shared and you should use `sub_path`.
  - Scaling is currently unsupported. 
  
  
## Notes

I am using this module to spin up applications in my cluster which are similar in nature. For example, I am using it to spin up web servers and cloud assets.
It is my goal to make this more robust to the point that it can handle more complex deployments but since this is for personal use and exploreation its going to be targeting small deployments. 

## Support

If you choose to use this module I can provide limited support. 

## Contribution

You are welcome to contribute to this repository as you would like! :) 
However, I intend to keep this as pure as possible and simplify it as I go to lower the barrier to entry. 

## Usage

You can use this module to spin up containers in kubernetes. 
This works in conjunction with cloudflare to setup a cname pointing to the root domain.

1. Add this module to a terraform file (ex: `main.tf`)

    ```tf
    module "example" {
      source = "git@github.com:mbround18/terra-kube.git//modules/server"
      name = "example" 
      # Add your config here
    }
    ```

2. Create a couple of vars in a var file (ex: `vars.tf`):

    ```tf
    variable "cloudflare_email" {
      type        = string
      description = "Cloudflare email"
    }

    variable "cloudflare_api_token" {
      type        = string
      description = "Cloudflare api token"
    }
    ```

3. Setup the cloudflare provider in a provider file (ex: `providers.tf`)

    ```tf
    provider "cloudflare" {
      email     = var.cloudflare_email
      api_token = var.cloudflare_api_token
    }
    ```
4. Add your cloudflare credentials to tfvars file or env vars when you execute `terraform init/plan/apply`
5. Modify the config in the module designation (TBD: Add example of that here)
6. Run `terraform init`
7. Run `terraform plan`
8. Etc.
