# ------------------------------------------------------------------------------
# HOST_CUSTOM.SH
# ------------------------------------------------------------------------------
set -e
source $INSTALLER/000-source

# ------------------------------------------------------------------------------
# ENVIRONMENT
# ------------------------------------------------------------------------------
MACH="$TAG-host"
cd $MACHINES/$MACH

# ------------------------------------------------------------------------------
# INIT
# ------------------------------------------------------------------------------
[[ "$DONT_RUN_HOST_CUSTOM" = true ]] && exit

echo
echo "---------------------- HOST CUSTOM ------------------------"

# ------------------------------------------------------------------------------
# PACKAGES
# ------------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive

# upgrade
apt-get $APT_PROXY -yd dist-upgrade
apt-get $APT_PROXY -y upgrade

# added packages
apt-get $APT_PROXY -y install zsh tmux vim autojump
apt-get $APT_PROXY -y install htop iotop bmon bwm-ng
apt-get $APT_PROXY -y install fping whois
apt-get $APT_PROXY -y install net-tools ngrep ncat
apt-get $APT_PROXY -y install rsync
apt-get $APT_PROXY -y install bzip2 ack jq
apt-get $APT_PROXY -y install rsyslog

# ------------------------------------------------------------------------------
# ROOT USER
# ------------------------------------------------------------------------------
cd /root/
[[ ! -f "/tmp/eb/machines/common/home/user/.bashrc" ]] && cp /tmp/eb/machines/common/home/user/.bashrc /root/ || true
[[ ! -f "/tmp/eb/machines/common/home/user/.vimrc" ]] && cp /tmp/eb/machines/common/home/user/.vimrc /root/ || true
[[ ! -f "/tmp/eb/machines/common/home/user/.zshrc" ]] && cp /tmp/eb/machines/common/home/user/.zshrc /root/ || true
[[ ! -f "/tmp/eb/machines/common/home/user/.tmux.conf" ]] && cp /tmp/eb/machines/common/home/user/.tmux.conf /root/ || true
cd $MACHINES/$MACH
# rc files
#[[ ! -f "/root/.bashrc" ]] && cp root/.bashrc /root/ || true
#[[ ! -f "/root/.vimrc" ]] && cp root/.vimrc /root/ || true
#[[ ! -f "/root/.zshrc" ]] && cp root/.zshrc /root/ || true
#[[ ! -f "/root/.tmux.conf" ]] && cp root/.tmux.conf /root/ || true
