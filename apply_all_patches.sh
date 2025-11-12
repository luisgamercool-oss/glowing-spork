#!/usr/bin/env bash
# apply_all_patches.sh
# Applies all *.patch files in the current directory using "patch -p1 < file"

set -e  # exit on error

for patch in *.patch; do
    [ -f "$patch" ] || continue
    echo "Applying patch: $patch"
    patch -p1 < "$patch"
done

echo "All patches applied successfully."
