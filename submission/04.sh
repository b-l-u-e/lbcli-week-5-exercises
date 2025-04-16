# Create a CLTV script with a timestamp of 1495584032 and public key below:
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

# Set the locktime (timestamp)
locktime=1495584032

# Convert locktime to little-endian hex
locktime_le=$(printf '%08x' $locktime | tac -rs ..)

# Create pubkey hash
pubkeyhash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p)

# Build the script
script="04${locktime_le}b17576a914${pubkeyhash}88ac"

echo "$script"
