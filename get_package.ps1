param(
    [string]$path,
    [switch]$v5_1_30,
    [switch]$v5_1_28,
    [switch]$v5_1_26,
    [switch]$v5_1_24,
    [switch]$v5_1_22,
    [switch]$v5_1_20,
    [switch]$v5_1_18,
    [switch]$v5_1_16,
    [switch]$v5_1_14
)

if($v5_1_30){
    $package="5.1.30"
}elseif($v5_1_28){
    $package="5.1.28"
}elseif($v5_1_26){
    $package="5.1.26"
}elseif($v5_1_24){
    $package="5.1.24"
}elseif($v5_1_22){
    $package="5.1.22"
}elseif($v5_1_20){
    $package="5.1.20"
}elseif($v5_1_18){
    $package="5.1.18"
}elseif($v5_1_16){
    $package="5.1.16"
}elseif($v5_1_14){
    $package="5.1.14"
}

Import-Csv $path | ForEach-Object {
    If ($_.Title -eq "$package"){
        $url=$_.URL
    }
}

$dst=$(Split-Path $url -Leaf)

wget $url -OutFile $dst

<#
.SYNOPSIS
CSV に記載された URL から現在のディレクトリへパッケージをダウンロードします。

.DESCRIPTION
指定したバージョンのパッケージを CSV に記載された URL から
現在のディレクトリへダウンロードします。

.PARAMETER path
CSV のパス。

.PARAMETER v5_1_30
v5.1.30 のパッケージをダウンロードします。

.PARAMETER v5_1_28
v5.1.28 のパッケージをダウンロードします。

.PARAMETER v5_1_26
v5.1.26 のパッケージをダウンロードします。

.PARAMETER v5_1_24
v5.1.24 のパッケージをダウンロードします。

.PARAMETER v5_1_22
v5.1.22 のパッケージをダウンロードします。

.PARAMETER v5_1_20
v5.1.20 のパッケージをダウンロードします。

.PARAMETER v5_1_18
v5.1.18 のパッケージをダウンロードします。

.PARAMETER v5_1_16
v5.1.16 のパッケージをダウンロードします。

.PARAMETER v5_1_14
v5.1.14 のパッケージをダウンロードします。
#>
