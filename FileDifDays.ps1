<# 
# TOKEN EXTRAIR LINHA DE UM ARQUIVO
# Revision: 1
# Date: 18/03/2016
# Author: Diego Maia - diegosmaia@yahoo.com.br Telegram - @diegosmaia
# FileDifDays.ps1 pasta
# Retorna a diferença de dias entre o primeiro  e o utlimo arquivo
# Execute : powershell -file FileDifDays.ps1 pasta
#>

$Pasta = "c:\"
if ($Pasta -ne "")
{
 $Pasta = $args[0]
}


# Compara ate as pastas
#$Arquivo_mais_recente = dir $Pasta  | sort lastwritetime | select -last 1 
#$Arquivo_mais_recente_data=(Get-Item ($Pasta + "\" + $Arquivo_mais_recente)).LastWriteTime
#$Arquivo_mais_antigo = dir $Pasta  | sort lastwritetime | select -first 1 
#$Arquivo_mais_antigo_data = (Get-Item ($Pasta + "\" + $Arquivo_mais_antigo)).LastWriteTime

$Arquivo_mais_recente_data = (Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -first 1 ).LastWriteTime
$Arquivo_mais_antigo_data = (Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -last 1 ).LastWriteTime

(NEW-TIMESPAN –Start $Arquivo_mais_recente_data –End $Arquivo_mais_antigo_data ).Days

<#
echo ----------------------------------------------------------------------------------------------------------------------
echo  DEBUG
echo ----------------------------------------------------------------------------------------------------------------------
#(Get-Item ($Pasta + "\" + $Arquivo_mais_recente)).LastWriteTime
#(Get-Item ($Pasta + "\" + $Arquivo_mais_recente)).name
(Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -first 1 ).name
(Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -first 1 ).LastWriteTime
echo ----------------------------------------------------------------------------------------------------------------------
#(Get-Item ($Pasta + "\" + $Arquivo_mais_antigo)).LastWriteTime
#(Get-Item ($Pasta + "\" + $Arquivo_mais_antigo)).name
(Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -last 1 ).name
(Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -last 1 ).LastWriteTime
echo ----------------------------------------------------------------------------------------------------------------------
($Pasta + "\" + (Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -first 1 ).name)
($Pasta + "\" + (Get-ChildItem $Pasta | where {!$_.PsIsContainer} | sort lastwritetime | select -last 1 ).name)
echo ----------------------------------------------------------------------------------------------------------------------
(NEW-TIMESPAN –Start $Arquivo_mais_recente_data –End $Arquivo_mais_antigo_data )
echo ----------------------------------------------------------------------------------------------------------------------
#>

