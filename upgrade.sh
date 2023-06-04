#!/bin/bash -exu
export DEBIAN_FRONTEND=noninteractive
PASTASCRIPTS="/etc/scripts/"
cd $(mktemp -d)

apt-get update && \
	apt-get upgrade -y && \
	apt-get dist-upgrade -y && \
	apt-get clean -y && \
	apt-get autoremove -y && \
	apt-get autoclean -y &&  \
	sync

mkdir -p ${PASTASCRIPTS} 2>&-

cat <<EOF > ${PASTASCRIPTS}/upgrade.sh
#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
cd $(mktemp -d)
apt-get update && \
	apt-get upgrade -y && \
	apt-get dist-upgrade -y && \
	apt-get clean -y && \
	apt-get autoremove -y && \
	apt-get autoclean -y &&  \
	sync
EOF

chmod +x ${PASTASCRIPTS}/upgrade.sh
