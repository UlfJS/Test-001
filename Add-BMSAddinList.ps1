<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2017 v5.4.143
	 Created on:   	30.10.2017 06:33
	 Created by:   	Ulf Støa
	 Organization: 	FMA IKT OSA
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

Import-Module 'BMSToolBox'


function Loop-Addins {
	[CmdletBinding()]
	param ()
	
	$AddinConfigFile = "D:\Addin.config"
	[xml]$xdoc = get-content $AddinConfigFile
	
	$Addins = $xdoc.AddinConfigFile.AddinConfig.Addins.addin
	$A = 0
	if ($Addins.HasChildNodes) {
		$AddinsInFile = $Addins.Count - 1
		While ($A -le $AddinsInFile) {
			#Write-Host $A
			#Write-Host $Addin.addin.fileName
			[string]$Value = $Addins.Item($A).filename
			Write-Host $Value
			$A++
		}
	}
}





#Test-AddAddinClient
#Remove-Addin -ClientServer Client -RemoveAddinDLL "TPG.FN.Addin.SofMortar.Client.dll" -AddinConfigFile "R:\Out\Client\Addin.config"




function Update-BMSAddinFiles {
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateSet('EnableAddins', 'DisableAddins')]
		[string]$Action,
		[string]$OverrideFilePath = "",
		[Parameter(Mandatory = $false)]
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin1,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin2,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin3,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin4,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin5,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin6,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin7,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin8,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin9,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin10,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin11,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin12,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin13,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin14,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin15,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin16,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin17,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin18,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin19,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin20,
		[ValidateSet('ANW2', 'BattleLog', 'COT', 'CSS', 'CV90', 'FOI2000', 'GMTI', 'HAHO', 'HF', 'HPW', 'InterimMrr', 'JTS', 'LINK16', 'MAJIIC', 'MbitrSa', 'MRR', 'NORCCIS', 'ODIN', 'SigInt', 'SofMortar', 'Vricon', 'XoSapi')]
		$Addin21
	)
	
	function New-AddinObject() {
		param ($Alias,
			$DLL,
			$ConfigFileType,
			$Groupe,
			$Enabled)
		
		$AddinInfo = new-object PSObject
		
		$AddinInfo | add-member -type NoteProperty -Name Alias -Value $Alias
		$AddinInfo | add-member -type NoteProperty -Name DLL -Value $DLL
		$AddinInfo | add-member -type NoteProperty -Name Groupe -Value $Groupe
		$AddinInfo | add-member -type NoteProperty -Name Enabled -Value $Enabled
		$AddinInfo | add-member -type NoteProperty -Name ConfigFileType -Value $ConfigFileType
		
		return $AddinInfo
	}
	
	function Test-IsNotEmpty {
		
		[OutputType([Boolean])]
		param ([string]$Text)
		return !([string]::IsNullOrEmpty($Text))
	}
	
	function Add-Addin {
		[CmdletBinding()]
		param
		(
			[Parameter(Mandatory = $true)]
			[string]$AddinConfigFile,
			[Parameter(Mandatory = $true)]
			[ValidateNotNullOrEmpty()]
			[string]$AddinDLL,
			[Parameter(Mandatory = $true)]
			[ValidateSet('true', 'false')]
			[String]$State
		)
		
		function Remove-Addin {
			[CmdletBinding()]
			param
			(
				[Parameter(Mandatory = $true)]
				[ValidateSet('Client', 'Server')]
				[string]$ClientServer,
				[Parameter(Mandatory = $false)]
				[string]$AddinConfigFile,
				[Parameter(Mandatory = $true)]
				[ValidateNotNullOrEmpty()]
				[string]$AddinDLL
			)
			
			
			# Importing XML Object
			[xml]$Xml = Get-content $AddinConfigFile
			
			# Finding object to delete
			if ($ClientServer -match 'Client') {
				# Client 
				$Parent = '/ExtensionConfig/Extensions/Addins/Addin'
			}
			else {
				# Server
				$Parent = '/AddinConfigFile/AddinConfig/Addins/Addin'
			}
			
			
			$Nodes = $xml.SelectNodes($Parent)
			
			$RemoveNodes = $Nodes | Where-Object { $_.FileName -match $AddinDLL }
			
			# Remove if node exist
			if (!(Test-IsEmpty -Text $RemoveNodes)) {
				
				# Loop in case more than one node with same addin
				foreach ($Node in $RemoveNodes) {
					
					# Removing Item from XML
					if ($ClientServer -match 'Client') {
						# Client 
						$xml.ExtensionConfig.Extensions.Addins.RemoveChild($Node) | Out-Null
						$Xml.ExtensionConfig.Extensions.Addins.Addin
					}
					else {
						# Server
						$xml.AddinConfigFile.AddinConfig.Addins.RemoveChild($Node) | Out-Null
						$Xml.AddinConfigFile.AddinConfig.Addins.Addin
					}
				}
				
				if (Test-Path $AddinConfigFile) {
					Remove-Item -Path $AddinConfigFile -Force
				}
				$Xml.OuterXml | Out-File -FilePath $AddinConfigFile -Force
			}
		}
		
		
		
		
		# Find if server or client configfile
		if (@(Get-Content $AddinConfigFile | Where-Object { $_.Contains("</AddinConfigFile>") }).Count -gt 0) {
			$ClientServer = 'Server'
		}
		elseif (@(Get-Content $AddinConfigFile | Where-Object { $_.Contains("</ExtensionConfig>") }).Count -gt 0) {
			$ClientServer = 'Client'
		}
		else {
			Write-Host "Can not figure out if is a client or server addin config file, exiting function"
			return
		}
		
		
		Remove-Addin -ClientServer $ClientServer -AddinDLL $AddinDLL -AddinConfigFile $AddinConfigFile
		
		
		
		# Importing XML Object
		[xml]$Xml = get-content $AddinConfigFile
		
		# Creating new Object to append
		$NewObject = $Xml.CreateElement("Addin")
		$NewObject.SetAttribute("fileName", $AddinDLL)
		$NewObject.SetAttribute("enabled", $State)
		
		
		# Removing Item from XML
		if ($ClientServer -match 'Client') {
			# Client 
			# Appending object into the XML
			$xml.ExtensionConfig.Extensions.Addins.AppendChild($NewObject) | Out-Null
			
			# Listing Result
			$Xml.ExtensionConfig.Extensions.Addins.Addin
		}
		else {
			# Server
			# Appending object into the XML
			$xml.AddinConfigFile.AddinConfig.Addins.AppendChild($NewObject) | Out-Null
			
			# Listing Result
			$Xml.AddinConfigFile.AddinConfig.Addins.Addin
		}
		
		
		if (Test-Path $AddinConfigFile) {
			Remove-Item -Path $AddinConfigFile -Force
		}
		$Xml.OuterXml | Out-File -FilePath $AddinConfigFile -Force
	}
	
	function Get-AddinConfigFiles {
		[CmdletBinding()]
		param
		(
			[string]$OverrideFilePath = ""
		)
		
		function Find-PlatformAddinFile {
			[CmdletBinding()]
			param
			(
				$AddinConfigFile
			)
			$PlatformID = Get-PlatformID
			$PlatformID = "\Platforms\NO\$PlatformID\"
			$AddinConfigFile = $AddinConfigFile.replace("\Current\", $PlatformID)
			Write-Host   "Test-path $AddinConfigFile"
			#Om filen ikke er i platformID  folder, så er den i 0000000
			if (!(Test-Path $AddinConfigFile)) {
				Write-Host "Can not find path: $AddinConfigFile"
				
				$AddinConfigFile = $AddinConfigFile.replace($PlatformID, "\Platforms\NO\0000000\")
				Write-Host "Now Trying path: $AddinConfigFile"
			}
			if (Test-Path $AddinConfigFile) {
				Write-Host "Found platform path: $AddinConfigFile"
				return $AddinConfigFile
			}
			else {
				Write-Host "No platform path found"
				return ""
			}
			
		}
		
		
		function New-AddinFileObject() {
			param ($FullPath,
				$ConfigFileType)
			
			$AddinFile = new-object PSObject
			
			$AddinFile | add-member -type NoteProperty -Name FullPath -Value $FullPath
			$AddinFile | add-member -type NoteProperty -Name ConfigFileType -Value $ConfigFileType
			
			return $AddinFile
		}
		
		$AddinFiles = @()
		
		if (Test-IsEmpty $OverrideFilePath) {
			$OverrideFilePath = "Dummy path"
		}
		if (Test-Path $OverrideFilePath) {
			
			# Find if server or client configfile
			if (@(Get-Content $OverrideFilePath | Where-Object { $_.Contains("</AddinConfigFile>") }).Count -gt 0) {
				$ClientServerX = 'Server'
			}
			elseif (@(Get-Content $OverrideFilePath | Where-Object { $_.Contains("</ExtensionConfig>") }).Count -gt 0) {
				$ClientServerX = 'Client'
			}
			else {
				Write-Host "Can not figure out if is a client or server addin config file, exiting function"
				return
			}
			
			$AddinFiles += New-AddinFileObject -FullPath $OverrideFilePath -ConfigFileType $ClientServerX
		}
		else {
			# Server addin i current folder
			$AddinFileX = "$env:SystemDrive\ProgramData\Teleplan Globe\FACNAV\Current\Server\Addin.config"
			if (Test-Path $AddinFileX) {
				$AddinFiles += New-AddinFileObject -FullPath $AddinFileX -ConfigFileType "Server"
			}
			# Server addin in platform folder
			$AddinFileX = Find-PlatformAddinFile $AddinFileX
			if (Test-Path $AddinFileX) {
				$AddinFiles += New-AddinFileObject -FullPath $AddinFileX -ConfigFileType "Server"
			}
			
			# client addin i current folder
			$AddinFileX = "$env:SystemDrive\ProgramData\Teleplan Globe\FACNAV\Current\Client\Addin.config"
			if (Test-Path $AddinFileX) {
				$AddinFiles += New-AddinFileObject -FullPath $AddinFileX -ConfigFileType "Client"
			}
			# Client addin in platform folder
			$AddinFileX = Find-PlatformAddinFile $AddinFileX
			if (Test-Path $AddinFileX) {
				$AddinFiles += New-AddinFileObject -FullPath $AddinFileX -ConfigFileType "Client"
			}
		}
		
		return $AddinFiles
	}
	
	#$OverrideFilePath
	
	
	# Select action for all addins
	$Enabled = "false"
	if ($Action -match "EnableAddins") {
		$Enabled = "true"
	}
	
	$Addins = @()
	if (Test-IsNotEmpty $Addin1) {
		$Addins += $Addin1
	}
	if (Test-IsNotEmpty $Addin2) {
		$Addins += $Addin2
	}
	if (Test-IsNotEmpty $Addin3) {
		$Addins += $Addin3
	}
	if (Test-IsNotEmpty $Addin4) {
		$Addins += $Addin4
	}
	if (Test-IsNotEmpty $Addin5) {
		$Addins += $Addin5
	}
	if (Test-IsNotEmpty $Addin6) {
		$Addins += $Addin6
	}
	if (Test-IsNotEmpty $Addin7) {
		$Addins += $Addin7
	}
	if (Test-IsNotEmpty $Addin8) {
		$Addins += $Addin8
	}
	if (Test-IsNotEmpty $Addin9) {
		$Addins += $Addin9
	}
	if (Test-IsNotEmpty $Addin10) {
		$Addins += $Addin10
	}
	if (Test-IsNotEmpty $Addin11) {
		$Addins += $Addin11
	}
	if (Test-IsNotEmpty $Addin12) {
		$Addins += $Addin12
	}
	if (Test-IsNotEmpty $Addin13) {
		$Addins += $Addin13
	}
	if (Test-IsNotEmpty $Addin14) {
		$Addins += $Addin14
	}
	if (Test-IsNotEmpty $Addin15) {
		$Addins += $Addin15
	}
	if (Test-IsNotEmpty $Addin16) {
		$Addins += $Addin16
	}
	if (Test-IsNotEmpty $Addin17) {
		$Addins += $Addin17
	}
	if (Test-IsNotEmpty $Addin18) {
		$Addins += $Addin18
	}
	if (Test-IsNotEmpty $Addin19) {
		$Addins += $Addin19
	}
	if (Test-IsNotEmpty $Addin20) {
		$Addins += $Addin20
	}
	if (Test-IsNotEmpty $Addin21) {
		$Addins += $Addin21
	}
	
	$AddinFilesCollection = @()
	
	foreach ($addin in $Addins) {
		#Write-Host $addin
		Switch ($addin) {
			"GMTI"    {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.AddinGmti.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.Gmti.Client.GmtiModule.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
			}
			"HAHO"    {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.HAHO.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"MAJIIC"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.MAJIIC.Addin.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.MAJIIC.Addin.Client.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
			}
			"XoSapi"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.XoSapi.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"MbitrSa"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.MbitrSa.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"NORCCIS"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.Nii.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.InfoFlow.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				
			}
			"CV90"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FACNAV.Addin.CV90.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FACNAV.Addin.CV90.Client.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				
			}
			"LINK16"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.Link16.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.Link16.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				
			}
			"SigInt"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.SigInt.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.SigInt.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				
				
			}
			"COT"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.CoT.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				
			}
			"ODIN"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.FireSupport.Client.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.FireSupport.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.FSGW.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				
			}
			"SofMortar"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.SofMortar.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.SofMortar.Client.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
			}
			"JTS"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FACNAV.Addin.JTS.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FACNAV.Addin.JTS.Client.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
			}
			"BattleLog"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.BattleLog.Addin.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				
			}
			"CSS"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.Css.Client.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Addin.Css.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"FOI2000"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.Foi2000.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				
			}
			"HAHO"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.Haho.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Comms.Server.HAHO.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"Vricon"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.Vricon.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
			}
			"MRR"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.Client.MrrAdmin.dll" -ConfigFileType "Client" -Groupe $addin -Enabled $Enabled
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.MrrService.Addin.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"ANW2"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.Anw2.Addin.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"InterimMrr"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.InterimMrr.Addin.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"HPW"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.FN.HPW.Addin.Server.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			"HF"  {
				$AddinFilesCollection += New-AddinObject -Alias $addin -DLL "TPG.Hf.Addin.dll" -ConfigFileType "Server" -Groupe $addin -Enabled $Enabled
			}
			
		}
	}
	
	# Get all Addin config files
	$ConfigFiles = Get-AddinConfigFiles -OverrideFilePath $OverrideFilePath
	foreach ($File in $ConfigFiles) {
		$FileFullPath = $File.FullPath
		$FileConfigFileType = $File.ConfigFileType
		
		foreach ($AddinFile in $AddinFilesCollection) {
			if ($FileConfigFileType -match $AddinFile.ConfigFileType) {
				Add-Addin -AddinConfigFile $FileFullPath -AddinDLL $AddinFile.dll -State $Enabled  | Out-Null
			}
		}
	}
	
	
	#return $AddinFilesCollection
}


Update-BMSAddinFiles -Action DisableAddins  -Addin1 MAJIIC -Addin2 ANW2 -Addin3 BattleLog -Addin4 COT -Addin5 CSS -Addin6 CV90 -Addin7 FOI2000 -Addin8 GMTI -Addin10 HAHO -Addin9 HF -Addin11 HPW -Addin12 InterimMrr -Addin13 JTS -Addin14 LINK16 -Addin15 MRR -Addin16 NORCCIS -Addin17 ODIN -Addin18 SigInt -Addin19 SofMortar -Addin20 XoSapi -Addin21 MbitrSa

#Add-Addin -AddinConfigFile "R:\Out\server\Addin.config"  -AddinDLL "min.5.dll" -State false

#Switch-Addin -Action DisableAddins -Addin1 "GMTI" -Addin2 "HAHO" -Addin3 "MAJIIC"



#Test-Switch

#Test-IsNotEmpty "AA"

#Set-AddinsNotActive -Addin1 GMTI
#Loop-Addins

#Test-AddAddin -State true
#Remove-Addin2

#

#$file = "C:\Program Files (x86)\Teleplan\FACNAV\Server\Addins\TPG.FN.Addin.FireSupport.Server.dll"
#
#if ($file -match "TPG.FN.Addin.FireSupport.Server.dll") {
#	Write-Host "Match"
#}
#else {
#	Write-Host "NOT Match"
#}