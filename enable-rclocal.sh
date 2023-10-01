#!/bin/bash
# Path to rc.local file
export rc_local_path="/etc/rc.local"

# Path to systemd unit file
export unit_file_path="/etc/systemd/system/rc-local.service"

# Create a systemd unit file for rc.local if it doesn't exist
if [ ! -e $unit_file_path ]; then
cat <<EOF > "$unit_file_path"
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF
fi

# Creat and/or set permissions for rc.local file
if [ -e $rc_local_path ]; then
  chmod +x "$rc_local_path"
else
cat <<EOF > "$rc_local_path"
#!/bin/sh -e
touch /tmp/rclocal-lock.lock
exit 0
EOF
chmod +x "$rc_local_path"
fi

# Enable and start rc.local service
systemctl enable rc-local
systemctl start rc-local
