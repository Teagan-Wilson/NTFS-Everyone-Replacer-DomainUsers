# NTFS-Everyone-Replacer-DomainUsers
A script that recursively replaces all ACEs in ACLs for the well known "EVERYONE" SID to equivalent permissions under "Domain Users".
Works on UNC paths.

Example:
.\fpm.ps1 -dir C:\test
