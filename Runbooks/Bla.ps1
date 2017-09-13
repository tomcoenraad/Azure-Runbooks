{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "disks_myWindowsVM_OsDisk_1_b3ac54dd1e8846479af012be53074cd6_name": {
            "defaultValue": "myWindowsVM_OsDisk_1_b3ac54dd1e8846479af012be53074cd6",
            "type": "String"
        },
        "virtualMachines_myWindowsVM_name": {
            "defaultValue": "myWindowsVM",
            "type": "String"
        },
        "networkInterfaces_myNic1_name": {
            "defaultValue": "myNic1",
            "type": "String"
        },
        "networkSecurityGroups_myNetworkSecurityGroup1_name": {
            "defaultValue": "myNetworkSecurityGroup1",
            "type": "String"
        },
        "publicIPAddresses_mypublicdns774414730_name": {
            "defaultValue": "mypublicdns774414730",
            "type": "String"
        },
        "virtualNetworks_MYvNET1_name": {
            "defaultValue": "MYvNET1",
            "type": "String"
        },
        "extensions_BGInfo_name": {
            "defaultValue": "myWindowsVM/BGInfo",
            "type": "String"
        }
    },
    "variables": {},
    "resources": [
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Compute/disks/myWindowsVM_OsDisk_1_b3ac54dd1e8846479af012be53074cd6.",
            "type": "Microsoft.Compute/disks",
            "name": "[parameters('disks_myWindowsVM_OsDisk_1_b3ac54dd1e8846479af012be53074cd6_name')]",
            "apiVersion": "2016-04-30-preview",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "accountType": "Standard_LRS",
                "osType": "Windows",
                "creationData": {
                    "createOption": "FromImage",
                    "imageReference": {
                        "id": "/Subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/Providers/Microsoft.Compute/Locations/westeurope/Publishers/MicrosoftWindowsServer/ArtifactTypes/VMImage/Offers/WindowsServer/Skus/2016-Datacenter/Versions/latest"
                    }
                },
                "diskSizeGB": 128
            },
            "dependsOn": []
        },
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Compute/virtualMachines/myWindowsVM.",
            "type": "Microsoft.Compute/virtualMachines",
            "name": "[parameters('virtualMachines_myWindowsVM_name')]",
            "apiVersion": "2016-04-30-preview",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "hardwareProfile": {
                    "vmSize": "Standard_D1"
                },
                "storageProfile": {
                    "imageReference": {
                        "publisher": "MicrosoftWindowsServer",
                        "offer": "WindowsServer",
                        "sku": "2016-Datacenter",
                        "version": "latest"
                    },
                    "osDisk": {
                        "osType": "Windows",
                        "name": "[concat(parameters('virtualMachines_myWindowsVM_name'),'_OsDisk_1_b3ac54dd1e8846479af012be53074cd6')]",
                        "createOption": "FromImage",
                        "caching": "ReadWrite",
                        "managedDisk": {
                            "id": "[resourceId('Microsoft.Compute/disks', parameters('disks_myWindowsVM_OsDisk_1_b3ac54dd1e8846479af012be53074cd6_name'))]"
                        }
                    },
                    "dataDisks": []
                },
                "osProfile": {
                    "computerName": "[parameters('virtualMachines_myWindowsVM_name')]",
                    "adminUsername": "tom",
                    "windowsConfiguration": {
                        "provisionVMAgent": true,
                        "enableAutomaticUpdates": true
                    },
                    "secrets": []
                },
                "networkProfile": {
                    "networkInterfaces": [
                        {
                            "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_myNic1_name'))]"
                        }
                    ]
                },
                "diagnosticsProfile": {
                    "bootDiagnostics": {
                        "enabled": true,
                        "storageUri": "https://jenkinspoc.blob.core.windows.net/"
                    }
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Compute/disks', parameters('disks_myWindowsVM_OsDisk_1_b3ac54dd1e8846479af012be53074cd6_name'))]",
                "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_myNic1_name'))]"
            ]
        },
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Network/networkInterfaces/myNic1.",
            "type": "Microsoft.Network/networkInterfaces",
            "name": "[parameters('networkInterfaces_myNic1_name')]",
            "apiVersion": "2017-03-01",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "ipConfigurations": [
                    {
                        "name": "ipconfig1",
                        "properties": {
                            "privateIPAddress": "192.168.1.4",
                            "privateIPAllocationMethod": "Dynamic",
                            "publicIPAddress": {
                                "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_mypublicdns774414730_name'))]"
                            },
                            "subnet": {
                                "id": "[concat(resourceId('Microsoft.Network/virtualNetworks', parameters('virtualNetworks_MYvNET1_name')), '/subnets/mySubnet1')]"
                            }
                        }
                    }
                ],
                "dnsSettings": {
                    "dnsServers": []
                },
                "enableIPForwarding": false,
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_myNetworkSecurityGroup1_name'))]"
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_mypublicdns774414730_name'))]",
                "[resourceId('Microsoft.Network/virtualNetworks', parameters('virtualNetworks_MYvNET1_name'))]",
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_myNetworkSecurityGroup1_name'))]"
            ]
        },
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup1.",
            "type": "Microsoft.Network/networkSecurityGroups",
            "name": "[parameters('networkSecurityGroups_myNetworkSecurityGroup1_name')]",
            "apiVersion": "2017-03-01",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "securityRules": [
                    {
                        "name": "myNetworkSecurityGroupRuleRDP",
                        "properties": {
                            "protocol": "Tcp",
                            "sourcePortRange": "*",
                            "destinationPortRange": "3389",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 1000,
                            "direction": "Inbound"
                        }
                    }
                ]
            },
            "dependsOn": []
        },
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Network/publicIPAddresses/mypublicdns774414730.",
            "type": "Microsoft.Network/publicIPAddresses",
            "name": "[parameters('publicIPAddresses_mypublicdns774414730_name')]",
            "apiVersion": "2017-03-01",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "publicIPAllocationMethod": "Static",
                "idleTimeoutInMinutes": 4
            },
            "dependsOn": []
        },
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Network/virtualNetworks/MYvNET1.",
            "type": "Microsoft.Network/virtualNetworks",
            "name": "[parameters('virtualNetworks_MYvNET1_name')]",
            "apiVersion": "2017-03-01",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "addressSpace": {
                    "addressPrefixes": [
                        "192.168.0.0/16"
                    ]
                },
                "subnets": [
                    {
                        "name": "mySubnet1",
                        "properties": {
                            "addressPrefix": "192.168.1.0/24"
                        }
                    }
                ],
                "virtualNetworkPeerings": []
            },
            "dependsOn": []
        },
        {
            "comments": "Gegeneraliseerd uit resource: /subscriptions/ce93d0c9-fc39-4509-9f8d-cce828ea079e/resourceGroups/testGroupPowerShell/providers/Microsoft.Compute/virtualMachines/myWindowsVM/extensions/BGInfo.",
            "type": "Microsoft.Compute/virtualMachines/extensions",
            "name": "[parameters('extensions_BGInfo_name')]",
            "apiVersion": "2016-04-30-preview",
            "location": "westeurope",
            "scale": null,
            "properties": {
                "publisher": "Microsoft.Compute",
                "type": "BGInfo",
                "typeHandlerVersion": "2.1",
                "autoUpgradeMinorVersion": true
            },
            "dependsOn": [
                "[resourceId('Microsoft.Compute/virtualMachines', parameters('virtualMachines_myWindowsVM_name'))]"
            ]
        }
    ]
}