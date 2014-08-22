$replaceFrom = '<Reference Include="LegalOne\.Lib\.Common';
$replaceTo = 'ze-common';
$filePattern = '*.csproj';
$location = '"D:\Projetos\Fabrica\LegalOne\Development\LegalOne';


Set-Location $location;
$files = Get-ChildItem -Filter $filePattern -Recurse;
foreach($file in $files)
{
    $content = Get-Content $file.FullName;
    
    $achou1 = $content -Match $replaceFrom;
    
    if($achou1.Count -gt 0)
    {
        Write-Output 'Processing file' + $file.FullName;
        tf checkout $file.FullName;
        $content = $content -replace $replaceFrom, $replaceTo;
        Set-Content -Path $file.FullName -Value $content;
    }
}