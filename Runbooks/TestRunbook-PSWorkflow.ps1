<# 
	This PowerShell script was automatically converted to PowerShell Workflow so it can be run as a runbook.
	Specific changes that have been made are marked with a comment starting with “Converter:”
#>
workflow TestRunbook-PSWorkflow {
	
	# Converter: Wrapping initial script in an InlineScript activity, and passing any parameters for use within the InlineScript
	# Converter: If you want this InlineScript to execute on another host rather than the Automation worker, simply add some combination of -PSComputerName, -PSCredential, -PSConnectionURI, or other workflow common parameters (http://technet.microsoft.com/en-us/library/jj129719.aspx) as parameters of the InlineScript
	inlineScript {
		workflow TestRunbook-PSWorkflow
		
		# Set parameters
		Param(
  		[string]$VMName,
  		[string]$ResourceGroupName
 		) 
		
		# Authenticate with Azure RunAs account
		{
		$Conn = Get-AutomationConnection -Name AzureRunAsConnection
		Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint  
		
		# Start VM
		Start-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroupName
		}
		
		}
	}
}