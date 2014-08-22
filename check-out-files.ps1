Set-Location "D:\Projetos\Fabrica\LegalOne\Main"
set-alias tf "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\tf.exe"
gci -Recurse -Filter "*.csproj" | %{ Write-Output $_.FullName;  tf checkout $_.FullName;  }
