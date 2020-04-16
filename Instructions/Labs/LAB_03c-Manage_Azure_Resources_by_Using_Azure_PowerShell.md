---
lab:
    title: '03c - Manage Azure resources by Using Azure PowerShell'
    module: 'Module 03 - Azure Administration'
---

# Lab 03c - Manage Azure resources by Using Azure PowerShell
# Student lab manual

## Lab scenario

Now that you explored the basic Azure administration capabilities associated with provisioning resources and organizing them based on resource groups by using the Azure portal and Azure Resource Manager templates, you need to carry out the equivalent task by using Azure PowerShell. To avoid installing Azure PowerShell modules, you will leverage PowerShell environment available in Azure Cloud Shell.

## Objectives

In this lab, you will:

+ Task 1: Start a PowerShell session in Azure Cloud Shell
+ Task 2: Create a resource group and an Azure managed disk by using Azure PowerShell
+ Task 3: Configure the managed disk by using Azure PowerShell

## Instructions

### Exercise 1

#### Task 1: Start a PowerShell session in Azure Cloud Shell

In this task, you will open a PowerShell session in Cloud Shell. 

1. In the portal, open the **Azure Cloud Shell** by clicking on the icon in the top right of the Azure Portal.

1. If prompted to select either **Bash** or **PowerShell**, select **PowerShell**.

1. If you are presented with the **You have no storage mounted** message, click **Show Advanced Settings** and then configure storage using the following settings:
    | Setting | Value |
    | --- | --- |
    | Subscription | the name of the target Azure subscription |
    | Cloud Shell region | select the region from you **StagiaireXXX-RG1** resource group |
    | Resource group | Use  resource group **StagiaireXXX-RG1** |
    | Storage account | a name of a new storage account (between 3 and 24 characters consisting of lower case letters and digits). |
    | File share | a name of a new file share: **cloudshell** |

1. Ensure **PowerShell** appears in the drop-down menu in the upper-left corner of the Cloud Shell pane.

1. To copy the files you'll need in this lab, run the following:

   ```pwsh
   Get-AzStorageBlob -Container 'az-104' -Context (New-AzStorageContext -StorageAccountName "iblab" -UseConnectedAccount)|Get-AzStorageBlobContent -Destination 'labs' -force
   ```

   >**Note**: rerun the previous command if you see any error !

#### Task 2: Create an Azure managed disk by using Azure PowerShell

In this task, you will create an Azure managed disk by using Azure PowerShell session within Cloud Shell

1. To create a new managed disk with the same characteristics as those you created in the previous labs of this module, run the following:

   ```pwsh
   $rgName = 'StagiaireXXX-RG1'
   $location = (Get-AzResourceGroup -Name $rgName).Location
   $diskConfig = New-AzDiskConfig `
    -Location $location `
    -CreateOption Empty `
    -DiskSizeGB 32 `
    -SkuName Standard_LRS

   $diskName = 'az104-03c-disk1'

   New-AzDisk `
    -ResourceGroupName $rgName `
    -DiskName $diskName `
    -Disk $diskConfig
   ```

1. To retrieve properties of the newly created disk, run the following:

   ```pwsh
   Get-AzDisk -ResourceGroupName $rgName -Name $diskName
   ```

#### Task 3: Configure the managed disk by using Azure PowerShell

In this task, you will managing configuration of the Azure managed disk by using Azure PowerShell session within Cloud Shell. 

1. To increase the size of the Azure managed disk to **64 GB**, from the PowerShell session within Cloud Shell, run the following:

   ```pwsh
   New-AzDiskUpdateConfig -DiskSizeGB 64 | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName
   ```

1. To verify that the change took effect, run the following:

   ```pwsh
   Get-AzDisk -ResourceGroupName $rgName -Name $diskName
   ```

1. To verify the current SKU as **Standard_LRS**, run the following:

   ```pwsh
   (Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku
   ```

1. To change the disk performance SKU to **Premium_LRS**, from the PowerShell session within Cloud Shell, run the following:

   ```pwsh
   New-AzDiskUpdateConfig -SkuName Premium_LRS | Update-AzDisk -ResourceGroupName $rgName -DiskName $diskName
   ```

1. To verify that the change took effect, run the following:

   ```pwsh
   (Get-AzDisk -ResourceGroupName $rgName -Name $diskName).Sku
   ```

#### Clean up resources

   >**Note**: **Do not** delete resources you deployed in this lab. You will reference them in the next lab of this module.

#### Review

In this lab, you have:

- Started a PowerShell session in Azure Cloud Shell
- Created a resource group and an Azure managed disk by using Azure PowerShell
- Configured the managed disk by using Azure PowerShell
