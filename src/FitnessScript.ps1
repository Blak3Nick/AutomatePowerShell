$ie = New-Object -com internetexplorer.application;
$urlAFPortal = "https://federation.prod.cce.af.mil/sso/authenticate/?u=https%3a%2f%2fwww.my.af.mil%2fgcss-af%2fUSAF%2fep%2fhome.do&m=GET&r=t";
$ie.visible= $true;
$ie.navigate($urlAFportal);
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle
$Link=$ie.Document.getElementsByTagName("a") | where-object {$_.href -match "https://f"}
$Link.click();
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }
$Link=$ie.Document.ParsedHtml.body.getElementsByTagName('button') | where {$_.getAttributeNode('class'.Value -eq 'button-small')}
$Link.click();
