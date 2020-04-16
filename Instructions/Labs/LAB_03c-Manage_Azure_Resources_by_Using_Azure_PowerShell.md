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

1. Refer to **Exercice 1** in **Lab 00** to create your Powershell environment.

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

1. Refer to **Exercice 2** of **Lab 00** to clean up your resources.

#### Review

In this lab, you have:

- Started a PowerShell session in Azure Cloud Shell
- Created a resource group and an Azure managed disk by using Azure PowerShell
- Configured the managed disk by using Azure PowerShell
