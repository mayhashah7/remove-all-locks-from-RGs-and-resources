# remove-all-locks-from-RGs-and-resources
Currently in Azure there is not a built in option to remove all locks at/under a subscription in one click. One workaround to this is as follows:

1. Give all the resources/resource groups you’re going to lock the same Tag Name and Tag Value. The tagName : tagValue I used in this example is Lock : True
2. Give all locks the same name. The lock name I used in this example is “ExampleLock”
3. Run a “Resource Graph Query” in PowerShell to acquire all Resource Groups with the tag Lock : True
4. Loop through all returned resource groups and remove the lock on each one
5. Run a “Resource Graph Query” in PowerShell to acquire all Resources with the tag Lock : True
6. Loop through all returned resource groups and remove the lock on each one

Note: If you have subscriptions that are locked, you would need to remove those locks first
