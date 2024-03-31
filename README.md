# Wormhole - v0.1

## How it works

- Install it on 2 Linux PCs, start the scirpt giving it the other PC's IP address and optionally username, then copy a file into the outgoing folder. The file will be automatically moved (not copied!) into the other PC's incoming directory.
- It is intended to be a daemon starting at boot, and running in the background, but it's in early development... (I needed it, but I'm working on something else right now...)

## Instructions
- It should be installed on both PCs, to ~/HexaTools/Wormhole directory. (Currently doesn't chack where on the target PC it is installed...)
- It takes the other PC's IP address as the first (mandatory) argument and username as the second (optional) arguments. (IP address is mandatory, username assumed to be the same on both PCs.)
- Start the script (It works best with SSH keys already set up, otherwise it will ask for password every time you put something into the outgoing directory, and thus can only run as a daemon with SSH keys set up on both PCs.)
- If you have more then 1 file to move, zip it and copy it in the outgoing directory! (For now it may or may not properly move a bunch of files just dumped into the outgoing directory, but it should work fine with a single zip file. As I said it's in early development...)
