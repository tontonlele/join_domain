Write-Host "Nom de l'ordinateur : $env:COMPUTERNAME" -ForegroundColor Cyan
$response = Read-Host "Voulez-vous joindre cet ordinateur au domaine ? (O/N)"

if ($response -match '^[Oo]$') {
    try {
        Add-Computer -DomainName "NOMDUDOMAINE" -Restart -ErrorAction Stop

        Write-Host "L'ordinateur a été joint au domaine. Redémarrage imminent..." -ForegroundColor Green
        Start-Sleep -Seconds 5
        exit
    }
    catch {
        Write-Host "Une erreur est survenue : $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Appuyez sur une touche pour fermer."
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}
else {
    Write-Host "L'ordinateur n'a pas été joint au domaine." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    exit
}
