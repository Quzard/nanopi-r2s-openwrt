docker rmi $(docker images -q)
sudo -E apt-get remove -y --purge azure-cli ghc zulu* hhvm llvm* firefox google* dotnet* powershell mysql* php* mssql-tools msodbcsql17 android*
cd /var/lib/dpkg/
sudo -E mv info/ info_bak          # 现将info文件夹更名
sudo -E mkdir info                 # 再新建一个新的info文件夹
sudo -E apt-get update             # 更新
sudo -E apt-get -f install         # 修复
sudo -E mv info/* info_bak/        # 执行完上一步操作后会在新的info文件夹下生成一些文件，现将这些文件全部移到info_bak文件夹下
sudo -E rm -rf info                # 把自己新建的info文件夹删掉
sudo -E mv info_bak info           # 把以前的info文件夹重新改回名

sudo -E apt-get update -y
sudo -E apt-get full-upgrade -y
sudo -E apt-get install -y build-essential asciidoc binutils bzip2 coreutils gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-8 gcc++-8 gcc-8-multilib g++-8-multilib p7zip p7zip-full msmtp libssl-dev texinfo libreadline-dev libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint ccache curl wget vim nano python python3 python-pip python3-pip python-ply python3-ply haveged lrzsz device-tree-compiler scons antlr3 gperf ecj fastjar re2c xz-utils tar
for i in $(ls /usr/bin/*-8); do sudo -E ln -sf $i ${i%%-8*}; done 
sudo -E ln -sf /usr/include/asm-generic /usr/include/asm
sudo -E apt-get autoremove -y --purge
sudo -E apt-get clean -y
sudo -E swapoff -a
sudo -E rm -rf /usr/share/dotnet /etc/mysql /etc/php /usr/local/lib/android /opt/ghc /swapfile