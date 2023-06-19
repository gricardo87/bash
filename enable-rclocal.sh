#!/bin/bash
# Create a systemd unit file for rc.local
cat <<EOF > /etc/systemd/system/rc-local.service
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

# Set permissions for rc.local file
if [ -e "/etc/rc.local" ]; then
  chmod +x /etc/rc.local
else
  cat <<EOF > /etc/systemd/system/rc-local.service
#!/bin/bash
# Commands here!
exit 0
EOF
chmod +x /etc/rc.local
fi

# Enable and start rc.local service
systemctl enable rc-local
systemctl start rc-local
