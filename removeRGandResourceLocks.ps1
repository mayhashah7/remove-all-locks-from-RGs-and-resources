$lockedResourceGroups = Search-AzGraph -Query "resourcecontainers | where type == 'microsoft.resources/subscriptions/resourcegroups' | where tags.Lock=~'True'"

foreach ($rg in $lockedResourceGroups) {
    Remove-AzResourceLock -LockName "ExampleLock" -ResourceGroupName $rg.resourceGroup
}

$lockedResources = Search-AzGraph -Query "Resources | where tags.Lock=~'True'"

foreach ($resource in $lockedResources) {
    Remove-AzResourceLock -LockName "ExampleLock" -ResourceName $resource.name -ResourceType $resource.type -ResourceGroupName $resource.resourceGroup
}