---
lab:
    title: '03d - Manage Azure resources by Using Azure CLI'
    module: 'Module 03 - Azure Administration'
---

# Lab 03d - Manage Azure resources by Using Azure CLI
# Student lab manual

## Lab scenario

Now that you explored the basic Azure administration capabilities associated with provisioning resources and organizing them based on resource groups by using the Azure portal, Azure Resource Manager templates, and Azure PowerShell, you need to carry out the equivalent task by using Azure CLI. To avoid installing Azure CLI, you will leverage Bash environment available in Azure Cloud Shell.

## Objectives

In this lab, you will:

+ Task 1: Start a Bash session in Azure Cloud Shell
+ Task 2: Create an Azure managed disk by using Azure CLI
+ Task 3: Configure the managed disk by using Azure CLI

## Instructions

### Exercise 1

#### Task 1: Start a Bash session in Azure Cloud Shell

In this task, you will open a Bash session in Cloud Shell. 

1. Refer to  **Exercice 1** of  **Lab 00** to create you Powershell environment.

1. Ensure **Bash** appears in the drop-down menu in the upper-left corner of the Cloud Shell pane.

#### Task 2: Create an Azure managed disk by using Azure CLI

In this task, you will create an Azure managed disk by using Azure CLI session within Cloud Shell.

1. To create a new managed disk with the same characteristics as those you created in the previous labs of this module, from the Bash session within Cloud Shell, run the following:

   ```sh
   RGNAME='StagiaireXXX-RG1'
   LOCATION=$(az group show --name $RGNAME --query location --out tsv)
   DISKNAME='az104-03d-disk1'

   az disk create \
   --resource-group $RGNAME \
   --name $DISKNAME \
   --sku 'Standard_LRS' \
   --size-gb 32
   ```
    >**Note**: When using multi-line syntax, ensure that each line ends with back-slash (`\`) with no trailing spaces and that there are no leading spaces at the beginning of each line.

1. To retrieve properties of the newly created disk, run the following:

   ```sh
   az disk show --resource-group $RGNAME --name $DISKNAME
   ```

#### Task 3: Configure the managed disk by using Azure CLI

In this task, you will managing configuration of the Azure managed disk by using Azure CLI session within Cloud Shell. 

1. To increase the size of the Azure managed disk to **64 GB**, from the Bash session within Cloud Shell, run the following:

   ```sh
   az disk update --resource-group $RGNAME --name $DISKNAME --size-gb 64
   ```

1. To verify that the change took effect, run the following:

   ```sh
   az disk show --resource-group $RGNAME --name $DISKNAME --query diskSizeGb
   ```

1. To change the disk performance SKU to **Premium_LRS**, from the Bash session within Cloud Shell, run the following:

   ```sh
   az disk update --resource-group $RGNAME --name $DISKNAME --sku 'Premium_LRS'
   ```

1. To verify that the change took effect, run the following:

   ```sh
   az disk show --resource-group $RGNAME --name $DISKNAME --query sku
   ```

#### Clean up resources

1. Refer to  **Exercice 2** of  **Lab 00** to clean up your resources.

#### Review

In this lab, you have:

- Started a Bash session in Azure Cloud Shell
- Created an Azure managed disk by using Azure CLI
- Configured the managed disk by using Azure CLI
