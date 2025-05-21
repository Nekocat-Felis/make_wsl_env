$Distro = "Ubuntu-22.04"

# WSL にディストリビューションが存在するか確認
$installed = wsl -l -v | Select-String $Distro

if (-not $installed) {
    Write-Host "$Distro が見つかりません。インストールを開始します..."
    wsl --install -d $Distro
    Start-Sleep -Seconds 10
} else {
    Write-Host "$Distro は既にインストールされています。"
}

# WSL の初期化が完了するまで待機（必要に応じて調整）
Start-Sleep -Seconds 5

# WSL 内で setup_wsl.sh を root ユーザーで実行
wsl -d $Distro -u root /home/$env:USERNAME/lxqt-vnc-setup/setup_wsl.sh
