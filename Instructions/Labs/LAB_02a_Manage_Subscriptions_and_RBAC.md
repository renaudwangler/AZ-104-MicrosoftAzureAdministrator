---
lab:
    title: '02a - Manage Subscriptions and RBAC'
    module: 'Module 02 - Governance and Compliance'
---

# Lab 02a - Manage Subscriptions and RBAC
# Student lab manual

## Lab scenario

In order to improve management of Azure resources in Contoso, you have been tasked with implementing the following functionality:

- creating a management group that would include all of Contoso's Azure subscriptions (we don't have any real subscription in our test tenant and won't test the results of this lab)

- granting permissions to submit support requests for all subscriptions in the management group to a designated Azure Active Directory user. That user's permissions should be limited only to: 

    - creating support request tickets

## Objectives

In this lab, you will:

+ Task 1: Implement Management Groups
+ Task 2: Assign RBAC roles

## Instructions

### Exercise 1

#### Task 1: Implement Management Groups

In this task, you will create and configure management groups. 

1. Sign in to the [Azure portal](https://portal.azure.com) with your Office 365 admin account.

1. Search for and select **Management groups** and then, on the **Management groups** blade, click **Start using management groups**.

1. Create a management group with the following settings:

    | Setting | Value |
    | --- | --- |
    | Management group ID | **az104-02-mg1**|
    | Management group display name | **az104-02-mg1**|

#### Task 2: Assign RBAC roles

In this task, you will create an Azure Active Directory user and assign a role to that user.

1. In the Azure portal, search for and select **Azure Active Directory**, on the Azure Active Directory blade, click **Users**, and then click **+ New user**.

1. Create a new user with the following settings (leave others with their defaults):

    | Setting | Value |
    | --- | --- |
    | User name | **az104-02-aaduser1**|
    | Name | **az104-02-aaduser1**|
    | Let me create the password | enabled |
    | Initial password | **Pa55w.rd124** |

    >**Note**: **Copy to clipboard** the full **User name**. You will need it later in this lab.

1. In the Azure portal, navigate back to the **az104-02-mg1** management group and display its **details**.

1. Click **Access control (IAM)**, click **+ Add** followed by **Role assignment**, and assign the **Support Request Contributor** role to the newly created user account.


    >**Note**: Since we created our Azure AD test tenant via an Office 365 test account, we don't have any Azure subscription and you can only view the way to assign roles. You can't test them in our tenant.

#### Clean up resources

   >**Note**: Remember to remove any newly created Azure resources that you no longer use. 

   >**Note**: Removing unused resources ensures you will not see unexpected charges, although, resources created in this lab do not incur extra cost.

1. In the Azure portal, search for and select **Azure Active Directory**, on the Azure Active Directory blade, click **Users**.

1. In the **Users - All users** blade of the **Azure Active Directory**, delete the **az104-02-aaduser1** user account.

1. In the Azure portal, navigate to the **az104-02-mg1** management group and display its **details**.

1. **Delete** the **az104-02-mg1** management group and click **Yes**.

#### Review

In this lab, you have:

- Implemented Management Groups
- Assigned RBAC roles
