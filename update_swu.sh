#!/bin/bash
set -e

SWU_NAME=hello_update.swu
ROOTFS_DIR=rootfs

echo "Building signed SWU package: $SWU_NAME"

# Create archive of updated files
tar -C $ROOTFS_DIR -czf update-rootfs.tar.gz .

# Create sw-description file
cat > sw-description <<EOF
software =
{
    version = "2.0";
    images: (
        {
            filename = "update-rootfs.tar.gz";
            path = "/usr/local/bin";
            type = "archive";
        }
    );
}
EOF

# Sign the package
swupdate-sign -k priv.pem -c pub.pem -i sw-description -o $SWU_NAME update-rootfs.tar.gz

echo "✅ SWU package built and signed: $SWU_NAME"
