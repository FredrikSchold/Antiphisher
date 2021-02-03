function Get-name {
    $names = get-content -Raw ".\powershell\antiphish\names.json" | ConvertFrom-Json
    $randomname = Get-Random -Maximum 2000 -Minimum 2
    $names[$randomname] 
}

function Get-surname {
    $surnames = get-content -Raw ".\powershell\antiphish\surnames.json" | ConvertFrom-Json
    $randomsurname = Get-Random -Maximum 51 -Minimum 2
    $surnames[$randomsurname] 
}

function Get-usernames {
    $usernames = get-content -Raw ".\powershell\antiphish\usernames.json" | ConvertFrom-Json
    $randomusername = Get-Random -Maximum 250 -Minimum 2
    $usernames[$randomusername] 
}

function Get-domain {
    $domains = get-content -Raw ".\powershell\antiphish\domains.json" | ConvertFrom-Json
    $randomdomain = Get-Random -Maximum 51 -Minimum 2
    $domains[$randomdomain] 
}

function Get-Password {
    $passwords = get-content -Raw ".\powershell\antiphish\passwords.json" | ConvertFrom-Json
    $randompw = Get-Random -Maximum 10220 -Minimum 2
    $passwords[$randompw] 
}

function Get-symbol {
    $symbol = @(".", "_", "-") 
    $symbol | get-random
}
