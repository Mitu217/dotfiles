# �����̃`�F�b�N
if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
        [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "�Ǘ��҂Ƃ��Ď��s���Ă�������"
    exit 1
}

echo "Windows�̊J�������\�z���܂�"
echo ""


############
# �����ݒ�
############

# �ݒ肳��Ă���v���p�C�_�ꗗ���擾
echo "[Get PackegeProviders]"
Find-PackageProvider -ForceBootstrap
echo ""

# ���sPolicy��ύX
echo "[Check ExecutionPolicy]"
Set-ExecutionPolicy RemoteSigned -Force
echo ""

# Chocolatey��PackageProvider�֒ǉ�
echo "[AddProvider Chocolatey]"
Get-PackageProvider Chocolatey -ForceBootstrap
echo ""


#########################
# �A�v���P�[�V�����̃C���X�g�[��
# * From Chocolatey
#########################

# git
Find-Package�@-ForceBootstrap -Name git -Provider chocolatey
Install-Package -Name git -Force

# Firefox
Find-Package�@-ForceBootstrap -Name Firefox -Provider chocolatey
Install-Package -Name Firefox -Force

# chrome
Find-Package�@-ForceBootstrap -Name Google-Chrome-x64 -Provider chocolatey
Install-Package -Name Google-Chrome-x64 -Force

# slack
Find-Package�@-ForceBootstrap -Name slack -Provider chocolatey
Install-Package -Name slack -Force

# GoogleJapaneseInput
Find-Package�@-ForceBootstrap -Name googlejapaneseinput -Provider chocolatey
Install-Package -Name googlejapaneseinput -Force

# 7zip
Find-Package�@-ForceBootstrap -Name 7zip -Provider chocolatey
Install-Package -Name 7zip -Force

# Atom
Find-Package�@-ForceBootstrap -Name atom -Provider chocolatey
Install-Package -Name atom -Force

# GitKraken
Find-Package�@-ForceBootstrap -Name gitkraken -Provider chocolatey
Install-Package -Name gitkraken -Force

# Android Studio
#Find-Package�@-ForceBootstrap -Name androidstudio -Provider chocolatey
#Install-Package -Name androidstudio -Force

# virtualbox
Find-Package�@-ForceBootstrap -Name virtualbox -Provider chocolatey
Install-Package -Name virtualbox -Force

# vagrant
Find-Package�@-ForceBootstrap -Name vagrant -Provider chocolatey
Install-Package -Name vagrant -Force

# Tweeten


#########################
# �A�v���P�[�V�����̃C���X�g�[��
# * From Git
#########################

# wsltty
git clone https://github.com/mintty/wsltty.git wsltty
cd wsltty
./install.bat
cd ..
Remove-Item -Force .\wsltty\ -recurse


#############################
# dotfile�̃V���{���b�N�����N���쐬
# * bash����Q�Ƃ��邽��
# * �����R�[�h�̕ύX���ǂ�������K�v������
#############################
New-Item "c:\dotfiles" -type directory 
echo "source /mnt/c/Users/$env:USERNAME/dotfiles/.zshrc" > c:\dotfiles\zshrc
echo "source /mnt/c/Users/$env:USERNAME/dotfiles/.vimrc" > c:\dotfiles\vimrc
echo "source /mnt/c/Users/$env:USERNAME/dotfiles/.tmux.conf" > c:\dotfiles\tmux.conf
