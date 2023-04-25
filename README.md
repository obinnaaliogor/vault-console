RUNNING VAULT:
Download and Install Vault:
https://developer.hashicorp.com/vault/downloads
To restart hashicorp/tap/vault after an upgrade:
brew services restart hashicorp/tap/vault
Or, if you don't want/need a background service you can just run:
/opt/homebrew/opt/vault/bin/vault server -dev

Note:
When You start vault in dev mode:
Msgs:
WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.

You may need to set the following environment variables:

    $ export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: xxx
Root Token: xxx

Development mode should NOT be used in production installations!

VAULT COMMANDS:
cat ~/.vault-token
vault server -dev ----> starts vault in development mode.

1. Create a vault user in aws
   assign a admin access policy to the vault user to manage your credentials.
   Get the programmtic access key and secret access key and use it to authenticate the vault user to make an API calls to aws for creation of users.

   access key: AKxxx
   secret access key: Q9xxx

Authentication process:
In vault click on the engine you created, click on configuration --> configure and enter vault user secret and access keys from aws.
You can also set a lease period (ttl) for the vault user, meaning time to live.. #period of validity of the credential.

2. In the roles section of the secret engine, create a role, say for a developer of a DevOps engineer that requires a role to
   manage an aws resource say s3 bucket or any services on aws.
   Assign a policy to that role, policy could be as shown below:

{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": [
"s3:*",
"s3-object-lambda:*"
],
"Resource": "*"
}
]
}

which is a policy for s3 full access or you can assign the policy using the amazon resource name "arn"
example arn:aws:iam::aws:policy/AmazonS3FullAccess

Ensure you choose Credential type as IAM-USER
You can also use assumedrole, federation token.

So each time a user needs access or permission to manage certain services, you add that policy and generate it for them to utilize.

This is the manual way of using vault, the entire process can be automated using terraform and bash shell scripting.

The added script and ansible playbook is added to demostrate the use of the access/permission assigned by vault to a user to manage s3 full access.
Run the playbook using:
ansible-playbook s3-terraform.yaml
ensure you have httpd.sh file in the pwd

You can install ansible if you currently dont have this by running.
brew install ansible for mac os
choco install ansible for windows os
