workflow TestRunbook-PSWorkflow
{
# Set parameters
Param(
  [string]$VMName,
  [string]$ResourceGroupName
 ) 

# Authenticate with Azure RunAs account
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint  

# Start VM
Start-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroupName
}