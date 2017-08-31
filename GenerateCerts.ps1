# YOU MUST FILL IN:
# (1) "SubjectNOSPACESNOQUOTES" - This is the subject for the certificate, put whatever you want here "<Business Unit>SnoozeCert" or something NO SPACES
# (2) "plainPasswordNOQUOTES" - This is the password for the certificate

[cmdletbinding()]
Param(
    [Parameter(Mandatory=$true)][string]$SubjectNOSPACESNOQUOTES,
    [Parameter(Mandatory=$true)][string]$plainPasswordNOQUOTES

)

$filePathCER = "C:\" + $SubjectNOSPACESNOQUOTES + ".cer"
Write-Host "File Path for .CER is: " + $filePathCER
$filePathPFX = "C:\" + $SubjectNOSPACESNOQUOTES + ".pfx"
Write-Host "File Path for .PFX is: " + $filePathPFX

$notAfter = [datetime]::Today.AddYears(100)
$cert = New-SelfSignedCertificate -Subject $SubjectNOSPACESNOQUOTES -NotAfter $notAfter
Export-Certificate -Cert $cert -FilePath $filePathCER
$password = ConvertTo-SecureString -String $plainPasswordNOQUOTES -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath $filePathPFX -Password $password
