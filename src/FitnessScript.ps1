$ie = New-Object -com internetexplorer.application;
$urlAFPortal = "https://federation.prod.cce.af.mil/sso/authenticate/?u=https%3a%2f%2fwww.my.af.mil%2fgcss-af%2fUSAF%2fep%2fhome.do&m=GET&r=t";
$ie.visible= $true;
$ie.navigate($urlAFportal);
#while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle
#$Link=$ie.Document.getElementsByTagName("a") | where-object {$_.href -match "https://f"}
#$Link.click();
#| where {$_.getAttributeNode('class'.Value -eq 'button-small')}
# | where-object {$_.Type -match "button"}
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }
try
{
    $Link=$ie.Document.documentElement.getElementsByClassName('button-small')[0].Item().Click();
    #$Link.click();
}
catch
{
    Write-Host "$_.Exception.Message"
    Write-Host "$_.Exception.ItemName"
}
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }
try
{
    $Link=$ie.Document.documentElement.getElementsByClassName("akam-button")[0].Item().Click();
}
catch
{
    Write-Host "$_.Exception.Message"
}
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }
try
{
    Write-Host "Executed next to last line"
    $Link=$ie.Document.documentElement.getElementsByClassName("primaryCTA big")[0].Item().Click();
}
catch
{
Write-Host "$_.Exception.Message"
}
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }
try
{
    $ValidCerts = [System.Security.Cryptography.X509Certificates.X509Certificate2[]] (dir Cert:\CurrentUser\My | where { $_.NotAfter -gt (Get-Date) })
    Write-Host "Executed last line"
    $Link=$ie.Document.documentElement.getElementsByClassName("primaryCTA big")[0].Item().Click();
    #https://www.my.af.mil/pkmslogin.form
}
catch
{
Write-Host "$_.Exception.Message"
}

#$ie = New-Object -com internetexplorer.application;
#$ie.visible= $true;
#while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }
#$ie.Navigate("https://www.my.af.mil/pkmslogin.form");
#javascript:window.location='https://www.my.af.mil/EAI_JUNCTION/eai/auth?refURL='+document.URL.replace(/"&"amp;/g,'%26');
#$ie.Navigate("javascript:window.location='https://www.my.af.mil/EAI_JUNCTION/eai/auth?refURL"+ "$ValidCerts");

