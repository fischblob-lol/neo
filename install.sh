# Created by Daniel on April 5th
set e
echo "####################"
echo "# NeoPkg Installer #"
echo "####################"
echo "Install will start in 5 seconds. CTRL + C to abort."
sleep 5
echo "Starting install."
echo "--- STEP 1: Get the NeoPkg bin ---"
curl -o neo https://raw.githubusercontent.com/sigmaboyihate/neo/main/zig-out/bin/neo
echo "--- STEP 2: Create Directory and move NeoPkg bin to /opt/NeoPkg/bin"
mkdir -p /opt/NeoPkg/bin
mv neo /opt/NeoPkg/bin/neo
chmod +x /opt/NeoPkg/bin/neo
echo "--- Installation is done, wooho! ---
echo "!!! Next steps: !!!"
echo "Add the NeoPkg bin to your $PATH using this command:"
echo "export PATH="/opt/NeoPkg/bin:$PATH"
