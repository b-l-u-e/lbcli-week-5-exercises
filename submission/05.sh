# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

# Set the number of blocks
blocks=150

# Convert blocks to little-endian hex
blocks_hex=$(printf '%04x' $blocks)

# Convert blocks_hex to CSV format
csv_hex=$(echo $blocks_hex | sed 's/../& /g' | awk '{for(i=NF;i>0;i--) printf $i}')

# Create pubkey hash
pubkeyhash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p)

# Build the final script
final_script="02${csv_hex}b27576a914${pubkeyhash}88ac"

echo "$final_script"