➤ Terraform to Automate complete Infrastructure as Code and Automate Deployments.

➤ AWS Setup
Make sure you have installed the AWS CLI
You can download it manually from https://aws.amazon.com/cli/
If you're on Linux you can also use "sudo pip install --upgrade awscli"
If you don't have pip, try sudo apt-get install python-pip
Use "aws configure" to enter the keys
you can optionally specify a default region - but no worries, in terraform you can set any region you want
Use http://www.cloudping.info/ to determine your region
You can test whether it works by entering: aws iam get-user
This will also show your AWS userid which you need afterward

➤ Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom inhouse solutions.

➤ Configuration files and execution plan are the Key Components of Terraform to Manage and Execute the Infrastructure.

➤ Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as highlevel components such as DNS entries, SaaS features, etc.

➤ Infrastructure as Code: Infrastructure is described using a highlevel configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

➤ Execution Plans: Terraform has a "planning" step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

➤ Resource Graph: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.

➤ Change Automation: Complex change sets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.

➤ Get $135 Discount Gift on Digital Ocean Machines
Steps to Register on DigitalOcean and get Promo Code
First, open this Sign-up Link and Sign Up to get your $100 credit.
https://m.do.co/c/98ed549bfab5
While filling your billing info, click on "Have a Promo Code?" at the bottom of the page.
Enter any one of the below codes to get extra credit:
CodeAnywhere10
LOWENDBOX
CODEANYWHERE
DOPRODUCT15
DO10
ALLSSD10
WP10
DROPLET10
BITNAMI
DEPLOY10
ACTIVATE10
DONEWS
FRANKFURT
From 1st step, you will get your first $10 credit and by using additional promo codes you can get up to $135 of total credits.
Note: Some codes only give more credit on higher plans.

➤ Install Terraform on MacOS and Windows
➤ Install Terraform on Mac Machine -
To Install the Terraform on MAC Machine, just copy-paste the below script in your local Machine and execute this script. Or you can execute the given commands in Script one by one but complete script execution is preferred over single line Command Execution.
mac-terraform-install.sh
brew install jq
brew install wget
cd ~
version=$(curl https://api.github.com/repos/hashicorp/terraform/releases/latest --silent | jq ".tag_name" -r)
version=$(echo $version | sed 's/v//g') # get rid of 'v' from version number
echo "Installing Terraform $version."
url="https://releases.hashicorp.com/terraform/$version/terraform_$(echo $version)_darwin_amd64.zip"
wget $url
unzip "terraform_$(echo $version)_darwin_amd64.zip"
chmod +x terraform
sudo mv terraform /usr/local/bin/
echo "Terraform $version installed."
rm "terraform_$(echo $version)_darwin_amd64.zip"
echo "Install files cleaned up."

➤ Install Terraform on Windows 10 -
Download the appropriate version of Terraform from HashiCorp’s download page. In my case, it’s the Windows 64-bit version.
https://www.terraform.io/downloads.html
Make a folder on your C:\ drive where you can put the Terraform executable. I prefer to place installers in a subfolder (e.g. C:\tools) where you can put binaries.
After the download finishes, go find it in File Explorer. Extract the zip file to the folder you created in step 2.
Open your Start Menu and type in “environment” and the first thing that comes up should be Edit the System Environment Variables option. Click on that and you should see this window.
System Properties
Click on Environment Variables… at the bottom and you’ll see this:
Windows environment variables
Under the bottom section where it says System Variables, find one called Path and click edit. You’ll then see a list of where to find the binaries that Windows might need for any given reason.
Click New and add the folder path where terraform.exe is located to the bottom of the list. It should look like this when you finish.
Editing the system path
Click OK on each of the menus you’ve opened up until there’s no more left.
To make sure that Windows detects the new path, open a new CMD/PowerShell prompt and enter refreshenv. or close the opened PowerShell window and Open New One.
Verify the installation was successful by entering terraform --version. If it returns a version, you’re good to go.

➤ Terraform uses its own configuration language, designed to allow concise descriptions of infrastructure.

➤ The main purpose of the Terraform language is declaring resources.

➤ A group of resources can be gathered into a module, which creates a larger unit of configuration.

➤ The syntax of the Terraform language consists of only a few basic elements: Arguments, Blocks, and Expressions

➤ Blocks are containers for other content and usually represent the configuration of some kind of object, like a resource. Blocks have a block type, can have zero or more labels, and have a body that contains any number of arguments and nested blocks. Most of Terraform's features are controlled by top-level blocks in a configuration file.

➤ Arguments assign a value to a name. They appear within blocks.

➤ Expressions represent a value, either literally or by referencing and combining other values. They appear as values for arguments, or within other expressions.

➤ Variables are necessary to parameterizing our deployments using Terraform.

➤ Input Variables enable user to pass in configuration values at the time of deployment.

➤ Using Terraform Input Variables is one way of deploying development, staging, or production environments using the same Terraform resource declarations, with slightly different configuration.

➤ Define Input Variables -

➤ Terraform Input Variables are defined using a variable block that defines the variable name and other option parameters for the variable. These variable blocks can be place in any .tf file within your Terraform project, but a common location used is within a file named variables.tf.

➤ Input Variable Definition

➤ The variable block is defined with the variable keyword followed by the name of the Input Variable. Also, the required type property must be added to define the data type of the variable; such as string, number, object, or other supported data types.

➤ Input Variable Conditions -

➤ When defining Input Variables for a Terraform project, the Input Variable can have a custom validation rules defined. The custom validation rules for an Input Variable are defined by adding a validation block within the variable block for the Input Variable.

➤ Input Variable Types -

➤ Primitive Types - Terraform supports three primitive types for Input Variables. string, number, bool

➤ Complex Types - Complex types allow you to group multiple values together into a single variable. Collection types, Structural types.

➤ Collection Types - A collection of multiple values grouped together as a single value.

➤ list(...) – A sequence of values identified by an index starting with zero.

➤ map(...) – A collection of values; each with a string label identifier.

➤ set(...) – A collection of unique values without any secondary identifiers or ordering.

➤ Input Variable Types -

➤ Structural Types - A collection of multiple values of several distinct types grouped together as a single value.

➤ object(...) – A collection of values each with their own type.

➤ tuple(...) – A sequence of values each with their own type.

➤ Single Place Configuration is not a Good Idea.

➤ Use Variable to Manage the Secrets.

➤ No Need to push AWS creds in Git Repo

➤ User Variable for Dynamic Elements like AMI

➤ Variable Makes files flexible and env independent.

➤ There are 2 ways to Provision Software on your Instance.

➤ Build Custom AMI:
➤ Bundle your softwares and Files in Base Image.
➤ Packer is Tool to Bundle the Custom AMIs.

➤ Boot Standard AMIs and Install Software on Instance at Runtime.
➤ Using File Upload.
➤ Using Remote-exec
➤ Using tools like Chef, Puppet & Ansible.
➤ Chef is Integrated with Terraform.
➤ User Can Run Puppet using Remote-Exec
➤ For Ansible, First Run Terraform, Get the Host IP address and then execute Ansible Playbook on Host.

➤ Remote-exec needs to be execute to execute the Script.
➤ Terraform Provisioner needs to use SSH(Unix/Linux) or WinRM(Windows Machine)
➤ User can use Connection to Make SSH Connection on Host.
➤ On AWS User needs to use SSH KeyPairs instead of Password.
➤ Remote-exec need to execute the Script.

➤ Terraform provides DataSource for Certain Cloud Providers like AWS.

➤ DataSource Provides the dynamic Information about entities that are not managed by the current Terraform and configuration.

➤ AWS provides a lot of structured data which can be accessed via AWS APIs.

➤ Terraform expose this information using DataSources like AMIs, Availability Zones.

➤ Referencing a resource defined in a data source won’t create the resource itself, and your plan will fail if you reference nonexistent data or infrastructure.

➤ DataSource also provides the All IPs in use by AWS.

➤ This will help in IP Base Traffic filter.

➤ Traffic Filer on AWS can be done via Security Groups.

➤ Incoming and Outgoing Traffic can be done via Inbound Rules and Outbound Rules.

➤ Rules filter the traffic on the basis of Protocol, IP Range, and Ports.

➤ Terraform Keeps Output of all resources and it’s attribute.

➤ Output in terraform can be queried and retain.

➤ Output values are like the return values of a Terraform module, and have several uses:
➤ A child module can use outputs to expose a subset of its resource attributes to a parent module.
➤ A root module can use outputs to print certain values in the CLI output after running terraform apply.
➤ When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source.

➤ Each output value exported by a module must be declared using an output block:
➤ The value argument takes an expression whose result is to be returned to the user.
➤ Outputs are only rendered when Terraform applies your plan. Running terraform plan will not render outputs.
➤ Outputs can also be used in Scripts. 

➤ Terraform is able to find the resources it created and update them accordingly. We have seen Terraform Plan and terraform apply commands.
➤ Terraform records information about what infrastructure it created in a Terraform state file.
➤ File called terraform.tfstate
➤ Terraform also maintain the back-up of earlier statefile in file named terraform.tfstate.backup
➤ On command Terraform Apply terraform backup is written and new state file created.
➤ If the remote state is changed and user executes terraform apply again. Terraform will make the changes to meet the correct remote state.
➤ Problems while team is working on terraform -
➤ Shared storage for state files - To be able to use Terraform to update your infrastructure, each of your team members needs access to the same Terraform state files. That means you need to store those files in a shared location.
➤ Locking state files - As soon as data is shared, you run into a new problem: locking. Without locking, if two team members are running Terraform at the same time, you may run into race conditions as multiple Terraform processes make concurrent updates to the state files, leading to conflicts, data loss, and state file corruption.
➤ Isolating state files - When making changes to your infrastructure, it’s a best practice to isolate different environments.
➤ Most common technique for allowing multiple team members to access a common set of files is to put them in version control (e.g. Git). But this is a bad idea.
➤ Manual error: It’s too easy to forget to pull down the latest changes from version control before running Terraform or to push your latest changes to version control after running Terraform.
➤ Locking: Most version control systems do not provide any form of locking that would prevent two team members from running terraform apply on the same state file at the same time.
➤ Secrets: All data in Terraform state files is stored in plain text. This is a problem because certain Terraform resources need to store sensitive data.
➤ Instead of using version control, the best way to manage shared storage for state files is to use Terraform’s built-in support for remote backends. A Terraform backend determines how Terraform loads and stores state.
➤ Remote Backend: Remote Backend solves all problems we listed earlier.
➤ Manual error: Once you configure a remote backend, Terraform will automatically load the state file from that backend every time you run plan or apply and it’ll automatically store the state file in that backend after each apply, so there’s no chance of manual error.
➤ Locking: Most of the remote backends natively support locking. To run terraform apply, Terraform will automatically acquire a lock; if someone else is already running apply, they will already have the lock, and you will have to wait.
➤ Secrets: Most of the remote backends natively support encryption in transit and encryption on disk of the state file.
➤ Store state in S3 Bucket:
➤ While using AWS S3 as backend, it’s recommended to use AWS configure instead of AWS creds in variables.

