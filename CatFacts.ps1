<#
6/13/2017

Phone sms lookup - http://www.freecarrierlookup.com/

3/2021 Test shit
#>

$encryptedSecret = get-content "C:\temp\secret.txt"
$key = get-content "c:\temp\key.txt"
$ss = ConvertTo-SecureString -Key ([Convert]::FromBase64String($key)) -String $encryptedSecret
$cred = (New-Object System.Management.Automation.PSCredential 'anoncatfacts@gmail.com',$ss)
<#
# load rss-feed
Function Get-Gmailbox {$webclient = new-object System.Net.WebClient

# access the rss-feed
$webclient.Credentials = $cred

# download the rss as xml
[xml]$xml= $webclient.DownloadString("https://mail.google.com/mail/feed/atom")

# display only sender name and message title as custom table
$format= @{Expression={$_.title};Label="Title"},@{Expression={$_.author.name};Label="Author"}

# display the table
$xml.feed.entry | format-table $format
}
#>
if ((Get-Random -Maximum 10000) -lt 1875) {
    $PhNumbers = Get-Content "c:\temp\PhNumbers.csv"
    foreach ($Number in $PhNumbers) {
    $CatFact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'http://catfacts-api.appspot.com/api/facts')).facts
    $From = "AnonCatFacts@gmail.com"
    $To = $Number
    $Body = "Did you know, $CatFact"
    $Subject = "Cat Facts"
    $SMTPServer = "smtp.gmail.com"
    $SMTPPort = "587"
    Send-MailMessage -From $From -to $To -Subject $Subject `
        -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
    -Credential $Cred
    }
}    
