param(
    [string]$path
)

Import-Csv $path | ForEach-Object {
    If ($_.Title -eq "Windows hosts"){
        $url=$_.URL
    }
}

$dst=$(Split-Path $url -Leaf)

wget $url -OutFile $dst

<#
.SYNOPSIS
CSV に記載された URL から現在のディレクトリへパッケージをダウンロードします。

.DESCRIPTION
CSV に記載された URL から現在のディレクトリへパッケージをダウンロードします。

.PARAMETER path
CSV のパス。
#>
