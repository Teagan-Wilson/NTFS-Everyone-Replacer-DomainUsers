# NTFS-Everyone-Replacer-DomainUsers
A script that recursively replaces all ACEs in ACLs for the well known "EVERYONE" SID to equivalent permissions under "Domain Users".
Works on UNC paths. Won't modify inherited permissions above the selected dir level.

Example:
.\fpm.ps1 -dir C:\test
