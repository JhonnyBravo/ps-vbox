function convert_encoding([string]$origin){
    $on_memory=[System.Text.Encoding]::UTF8.GetBytes($origin)
    $converted=[System.Text.Encoding]::Default.GetString($on_memory)
    return $converted
    
    
    <#
    .SYNOPSIS
    文字コードを Default へ変換して返します。
    
    .DESCRIPTION
    文字コードを Default へ変換して返します。
    
    .PARAMETER origin
    文字コードを変換する文字列。
    #>
}

$path_origin='$env:Path=$env:Path+";'+$env:VBOX_MSI_INSTALL_PATH+'"'
$path_converted=convert_encoding($path_origin)

if(Test-Path $profile){
    $path_converted > temp.txt
    Get-Content $profile >> temp.txt
}else{
    $path_converted > temp.txt
}

Copy-Item temp.txt $profile
Remove-Item temp.txt


<#
.SYNOPSIS
Virtual Box CLI ツールのパス設定をプロファイルへ追記します。

.DESCRIPTION
Virtual Box CLI ツールのパス設定をプロファイルへ追記します。
既にプロファイルが存在する場合は既存のプロファイルの内容を維持したまま
パス設定を追記します。
#>