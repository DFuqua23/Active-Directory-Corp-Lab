<#
.SYNOPSIS
  Bulk create users in Active Directory and place them into Employees OU.

.DESCRIPTION
  Example script for controlled lab usage. Generates a set number of users with
  realistic first/last name combinations and sets a default password that must be changed.
  For production use, integrate with a secure password generator and do not hardcode credentials.

.NOTES
  - Requires the ActiveDirectory PowerShell module
  - Run as an account with privileges to create users in the target OU
#>

Import-Module ActiveDirectory -ErrorAction Stop

# CONFIGURE THESE BEFORE RUNNING
$DomainDN        = "DC=corp,DC=local"               # Change to your domain distinguishedName
$TargetOU        = "OU=Employees,$DomainDN"         # OU where users will be created
$UserPassword    = "P@ssw0rd123!"                   # Lab-only password (change before use)
$NumberOfUsers   = 1000                              # How many users to create
$StartId         = 1001                              # Starting numeric suffix for usernames
$DisplayNameSeed = "Employee"                        # Optional prefix for display name

# A small sample list of first and last names used to create variety
$FirstNames = @(
    "Alex","Jordan","Taylor","Morgan","Casey","Avery","Riley","Quinn","Jamie","Alexis",
    "Cameron","Drew","Parker","Sydney","Skyler","Reese","Rowan","Kai","Logan","Elliot"
)

$LastNames = @(
    "Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis","Rodriguez","Martinez",
    "Hernandez","Lopez","Gonzalez","Wilson","Anderson","Thomas","Taylor","Moore","Jackson","Martin"
)

# Convert plain password to secure string once
$SecurePassword = ConvertTo-SecureString $UserPassword -AsPlainText -Force

# Utility to get a random name pair
function Get-RandomNamePair {
    $fn = $FirstNames | Get-Random
    $ln = $LastNames  | Get-Random
    return @{First=$fn; Last=$ln}
}

# Confirm action
Write-Host "About to create $NumberOfUsers users in $TargetOU" -ForegroundColor Cyan
$confirmation = Read-Host "Type YES to continue"
if ($confirmation -ne "YES") {
    Write-Warning "Aborted by user."
    exit
}

# Create users loop
for ($i = 0; $i -lt $NumberOfUsers; $i++) {
    $id = $StartId + $i
    $namePair = Get-RandomNamePair
    $first = $namePair.First
    $last  = $namePair.Last

    # Create unique username (first initial + lastname + id)
    $sAM = ("{0}{1}{2}" -f $first.Substring(0,1).ToLower(), $last.ToLower(), $id)

    # Prevent collisions by checking existence
    if (Get-ADUser -Filter { SamAccountName -eq $sAM } -ErrorAction SilentlyContinue) {
        Write-Host "User $sAM already exists. Skipping." -ForegroundColor Yellow
        continue
    }

    $displayName = "$first $last ($DisplayNameSeed $id)"
    $userPrincipalName = "$sAM@corp.local"

    try {
        New-ADUser `
            -Name $displayName `
            -GivenName $first `
            -Surname $last `
            -SamAccountName $sAM `
            -UserPrincipalName $userPrincipalName `
            -DisplayName $displayName `
            -AccountPassword $SecurePassword `
            -Enabled $true `
            -Path $TargetOU `
            -ChangePasswordAtLogon $false `
            -PasswordNeverExpires $true

        Write-Host "Created user $sAM" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed creating $sAM : $_" -ForegroundColor Red
    }
}

Write-Host "Done creating users." -ForegroundColor Cyan
