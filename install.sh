#!/data/data/com.termux/files/usr/bin/bash

echo "[1/4] Updating Termux..."
pkg update -y && pkg upgrade -y

echo "[2/4] Installing required packages..."
pkg install -y proot-distro curl wget

echo "[3/4] Installing Ubuntu..."
proot-distro install ubuntu

echo "[4/4] Setting up Ubuntu environment..."
proot-distro login ubuntu -- bash -c "
  apt update && apt upgrade -y &&
  apt install -y build-essential protobuf-compiler curl wget pkg-config \
    libcrypto++-dev libc6-dev openssl libssl-dev
"

echo "Done! Type this to login anytime:"
echo "  proot-distro login ubuntu"
