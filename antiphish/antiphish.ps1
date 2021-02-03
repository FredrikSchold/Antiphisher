<#
.Synopsis
    Script to send fake logins to fake loginforms. 

.Description
    This script is written to counter the big amount of phishing-sites out there. If one of your users or yourself accidently tries to login to a fake loginform you can use this script to send fake login information to the fake loginform. 
    This to hide your information in the mass of other fake information.
    Ofcourse the first step should be to change your password if you sent real login information to a maliscious site.

    Also I dont condone using this on nonmaliscious sites as some kind of spam! This is only to counter phishing!

.Inputs 
    This script is using apmodule.psm1. Make sure you dont change directory structure because then the script wont find the module.
    We are using the following JSON-files to fetch different data, such as @domains.com, names, passwords and more - you can change directory but then you need to specify the paths in the module.

.Outputs
    #might log the different outputs down the road. Now the only outputs are in console (write-host).

.Notes
    Version:        1.0
    Author:         Fredrik Schöld
    Creation Date:  2/2-2020

#>

#----------------------------------------------------------[Declarations]----------------------------------------------------------
try {
    $url = Invoke-WebRequest "https://www.google.com/" # <-------- change this to your POSTurl EX https://www.linkedin.com/checkpoint/lg/login-submit (linkedins POST-url)
}
catch {
    Write-Verbose "Site can't be reached, make sure its the correct URL" -Verbose
    exit
}


# Note that theres more Declarations/Variables in the execution below that might require changes/tweaks

#$Sleep - variable is in "max" seconds - tweak this for the max amount of time it should take before submitting information 
# Examples
# 300 = 5 minutes
# 600 = 10 minutes
# 1800 = 30 minutes
# 3600 = 60 minutes

#-----------------------------------------------------------[Execution]------------------------------------------------------------

    

while ($url.statuscode -eq 200) { # Will be true until site cant be reached anymore
   
    $sleep = get-random -maximum 30 # <---------------------Change this number for different random sleeptimes
    $var = Get-random -Maximum 11 # Variable that is used to get username 10% of the time and name + symbol + surname 90% of time, See the if-statement below
    $pw = Get-Password
    $mail = Get-domain


    if ($var -lt 10) { 

        $prename = Get-name 
        $lastname = Get-surname
        $sym = Get-symbol
        #Invoke-WebRequest -Uri $url -Method POST -Body @{
        #headercode

        #session_key: = "$prename$Sym$lastname@$mail" 
        #session_password: = $pw
    
        #}
        write-host ""
        write-host "$prename$Sym$lastname@$mail" 
        write-host $pw
        
    }

    else {

        $usrname = Get-usernames
        #Invoke-WebRequest -Uri $url -Method POST -Body @{
        #headercode

        #session_key: = $usrname@$mail
        #session_password: = $pw
    
        #}
        write-host ""
        write-host "$usrname@$mail"
        write-host $pw
        
    }

    Start-sleep $sleep
    write-host "väntade i $sleep sekunder"

}
