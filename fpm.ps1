<#
.SYNOPSIS
   Recursivly iterates through files and folders, replacing NTFS "Everyone" ACLs with "Domain Users" ACLs of the same type.
.PARAMETER dir
   Defines the path to use.
.EXAMPLE
   .\fpm.ps1 -dir \\server\test
#>

Param(
	[string]$dir
)


Get-ChildItem -Path $dir -Recurse -Force | get-acl | ForEach-Object {
	$acls = $_
	Write-Host $acls.Path
	ForEach ($1 in $acls.Access)
	{
		if (($1.IdentityReference -eq "Everyone") -and ($1.IsInherited -eq $False) -and ($1.AccessControlType -eq "Allow")) 
		{
			$NewRule = New-Object System.Security.AccessControl.FileSystemAccessRule("MIS\Domain Users",$1.FileSystemRights,$1.InheritanceFlags,$1.PropagationFlags,$1.AccessControlType)
			$acls.RemoveAccessRule($1)
			$acls.AddAccessRule($NewRule) 
			Set-Acl -Path $acls.Path -AclObject $acls
		}
	}
}


