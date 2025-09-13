# join_domain
Ceci est un script Powershell qui permet à un ordinateur de joindre un domaine AD.

Il vous suffit de modifier cette ligne en inscrivant le nom de votre domaine.

Add-Computer -DomainName "NOMDUDOMAINE" -Restart -ErrorAction Stop
