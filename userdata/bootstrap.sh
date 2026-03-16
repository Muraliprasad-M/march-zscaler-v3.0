
#!/bin/bash
echo "Bootstrapping Zscaler appliance"

cat <<EOF > /opt/zscaler/bootstrap.cfg
cloudname=zscaler.net
activationkey=XXXXX-XXXXX
EOF
