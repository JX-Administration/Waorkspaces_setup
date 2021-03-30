#need to add putty and superputty


echo "install nano"
yum install nano -y
echo "update epel-release"
yum install epel-release -y
echo "install default fedora yum repository"
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
echo "adding spaces to history so commands starting with spaces do not show"
export HISTCONTROL=ignorespace
HISTSIZE=20000
HISTFILESIZE=20000
echo "HISTSIZE=20000" >> .bash
echo "HISTFILESIZE=20000" >> .bash
echo "export HISTCONTROL=ignorespace" >> .bashrc

echo "==============================================================================="
yum install putty -y


echo "=========================================================="
echo "download terraform latest version"
mkdir terraform-download
cd terraform-download
wget "https://releases.hashicorp.com/terraform/0.14.8/terraform_0.14.8_linux_amd64.zip"
echo "unzip terraform"
unzip *.zip
echo "move terraform to /usr/local/bin"
mv  ./terraform /usr/local/bin/terraform
echo "clean up terraform directory"
cd ..
rm -rf terraform-download
echo "==========================================================="

echo "==========================================================="
echo "install snap"
tag_version=v0.1.0 && \
rpm_version=2.36.3-0 && \
wget https://github.com/albuild/snap/releases/download/${tag_version}/snap-confine-${rpm_version}.amzn2.x86_64.rpm -P $HOME/Downloads && \
wget https://github.com/albuild/snap/releases/download/${tag_version}/snapd-${rpm_version}.amzn2.x86_64.rpm -P $HOME/Downloads && \
yum -y install $HOME/Downloads/snap-confine-${rpm_version}.amzn2.x86_64.rpm $HOME/Downloads/snapd-${rpm_version}.amzn2.x86_64.rpm && \
systemctl enable --now snapd.socket
echo "==========================================================="

echo "==========================================================="
echo "install VS Code"
echo "install microsoft keys for repo"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo "install microsoft repo"
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
yum install code -y
echo "=========================================================="

echo "=========================================================="
echo "Install JX3 CLI latest version"
mkdir jx3
cd jx3
curl -s https://api.github.com/repos/jenkins-x/jx-cli/releases/latest \
| grep "browser_download_url" \
| grep "linux-amd64" \
| cut -d '"' -f 4 \
| wget -i -
mv ./jx /usr/local/bin/jx
cd ..
rm -rf jx3
echo "==========================================================="

echo "============================================================="
echo "install kubectl"
mkdir kubectl
cd kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl /usr/local/bin/kubectl
cd ..
rm -rf kubectl
echo "============================================================"

echo "==========================================================="
echo "install eksctl"
mkdir eksctl
cd eksctl
curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar -xz -C .
mv ./eksctl /usr/local/bin/eksctl
cd ..
rm -rf eksctl
echo "==========================================================="


echo "==========================================================="
echo "git already installed"
echo "aws cli is already installed"
echo "to update your aws credentials run aws configure"
echo "you are currently logged in as:"
aws sts get-caller-identity
echo "==========================================================="

echo "==========================================================="
echo "install helm"
curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
echo "adding helm repo"
helm repo add stable https://charts.helm.sh/stable
echo "setting up helm autocomplete"
helm completion bash >> ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
source <(helm completion bash)
echo "==========================================================="




