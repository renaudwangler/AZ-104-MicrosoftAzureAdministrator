# Lab 00 - Global Resources

# Student lab manual

## Lab scenario

This is not a real Lab. The content of this *Lab* may be used by other labs and/or by your trainer to provide useful tips, help with some repetitive actions or avoid pitfalls.

## Objectives

In this lab, you will:

+ Task 1: Configure your CloudShell environment and gain access to your lab files
+ Task 2: Clean up your resources

## Instructions

### Exercice 1

#### Task 1: Configure your CloudShell environment

In this task, you will create a storage account and map it to your Cloud Shell environment.

1. In the portal, open the Azure Cloud Shell by clicking on the icon in the top right of the Azure Portal.

1. If prompted to select either **Bash** or **PowerShell**, select **PowerShell**.

1. If you are presented with the **You have no storage mounted** message, click **Show Advanced Settings** and then configure storage using the following settings:
    | Setting | Value |
    | --- | --- |
    | Subscription | The name of the target Azure subscription |
    | Cloud Shell region | Select the region from your **StagiaireXXX-RG1** resource group |
    | Resource group | Use  resource group **StagiaireXXX-RG1** |
    | Storage account | The name of a new storage account (between 3 and 24 characters consisting of lower case letters and digits). |
    | File share | The name of a new file share: **cloudshell** |

#### Task 2: Copy the files you'll need for your labs

In this task, you will copy the files needed by your lab in your CloudShell local storage.

1. Ensure **PowerShell** is selectd  in the drop-down menu in the upper-left corner of the Cloud Shell pane.

1. To copy the files you'll need in this lab, run the following:

   ```pwsh
   azcopy login --identity
   azcopy copy 'https://iblab.blob.core.windows.net/az-104' . --recursive
   ```

### Exercice 2

#### Task 1: Clean up resources

In this task, you will delete the resources you used during any previous Lab: Remember to remove any newly created Azure resources that you no longer use. Removing unused resources ensures you will not incur unexpected costs.

1. In the Azure portal, search for and select **Resourcegroups** and, on the **Resource groups** blade, select **StagiaireXXX-RG1**

1. On the **StagiaireXXX-RG1** blade, in the **Overview** content pane, click the checkbox near **Name** to select all resources.

   >**Note**: You may unselect the Storage account used for your Cloud Shell.
   
1. On the action bar, click **Delete**

1. On the **Delete Resources** blade, type "**Yes**" in the **Confirm delete** text box and click **Delete**.

1. Don't wait for the operation to finish : repeat the previous steps for your **StagiaireXXX-RG2** Resource group if you created resources in it.

   >**Note**: Deleting your resources is a slow process. **Do not close the Azure Portal until all resources are deleted.** If the task ends with a failure message in the notification area, relaunch it or call your instructor for help.
   
   >**Note**: If you have provisionned a storage account for your Cloud Shell, you may keep it. If you delete it, please refer to the **Exercice 0** of this lab (**Lab 00**) to recreate it and retrieve any files you may need.
