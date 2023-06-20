#!/bin/bash
# Path to rc.local file
rc_local_path="/etc/rc.local"

# Path to systemd unit file
unit_file_path="/etc/systemd/system/rc-local.service"

# Create a systemd unit file for rc.local if it doesn't exist
if [ ! -e "$unit_file_path" ]; then
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

# Set permissions for rc.local file
if [ -e "$rc_local_path" ]; then
  chmod +x "$rc_local_path"
else
  cat <<EOF > "$rc_local_path"
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

exit 0
EOF
  chmod +x "$rc_local_path"
fi

# Enable and start rc.local service
systemctl enable rc-local
systemctl start rc-local
