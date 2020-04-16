# Lab 00 - Global Resources

# Student lab manual

## Lab scenario

Thi is not a real Lab. The content of this *Lab* may be used by other labs and/or by your trainer to ease up some repetitive actions, give you some tricks or avoid some traps.

## Objectives

In this lab, you will:

+ Task 1: Configure your CloudShell environment and gain access to your lab's files
+ Task 2: Create Azure AD groups with assigned and dynamic membership
+ Task 3: Create an Azure Active Directory (AD) tenant
+ Task 4: Manage Azure AD guest users 

## Instructions

### Exercice 1

#### task1: Configure your CloudShell environment

In this task, you will create a storage account and map it to your Cloud Shell environment.

1. In the portal, open the Azure Cloud Shell by clicking on the icon in the top right of the Azure Portal.

1. If prompted to select either **Bash** or **PowerShell**, select **PowerShell**.

1. If you are presented with the **You have no storage mounted** message, click **Show Advanced Settings** and then configure storage using the following settings:
    | Setting | Value |
    | --- | --- |
    | Subscription | the name of the target Azure subscription |
    | Cloud Shell region | select the region from you **StagiaireXXX-RG1** resource group |
    | Resource group | Use  resource group **StagiaireXXX-RG1** |
    | Storage account | a name of a new storage account (between 3 and 24 characters consisting of lower case letters and digits). |
    | File share | a name of a new file share: **cloudshell** |

#### task2: Copy the files you'll need for your labs

In this task, you will copy the files needed by your lab in your CloudShell local storage.

1. Ensure **PowerShell** appears in the drop-down menu in the upper-left corner of the Cloud Shell pane.

1. To copy the files you'll need in this lab, run the following:

   ```pwsh
   Get-AzStorageBlob -Container 'az-104' -Context (New-AzStorageContext -StorageAccountName "iblab" -UseConnectedAccount)|Get-AzStorageBlobContent -Destination 'labs' -force
   ```

   >**Note**: rerun the previous command if you see any error !
