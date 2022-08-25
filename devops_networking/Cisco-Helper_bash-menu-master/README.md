## Bluscrn's Cisco Helper Scripts v0.1

_sudo priveleges are required for this script to run_

_console access is needed, edit `main.menu` `serial=$(ls /dev/ttyUS*)` to properly reflect your serial port_

opening minicom in a second terminal is ***highly*** recommended in order to watch Cisco output

Install minicom `sudo apt install minicom` or `sudo dnf install minicom`

Run minicom `sudo minicom -s`

Edit the `creds.var` file with your username and password 

install tftp-hpa `sudo apt install tftp-hpa` or `sudo dnf install tftp-hpa`

Run main.menu `bash main.menu`

    1 opens the IOS upload menu
    
        - Creates basic network and tftp's file of your choice into Cisco device
        - r1-4.sh and s1-6.sh are utilized
        - interface commands in these scripts may need to be adjusted depending on hardware configuration
    
    2 will tftp and extract an archive of your choice (CME firmware or any .tar)
    
    3 runs crypto.sh ***(Use at your own risk)***
    
    4 copies file of your choice to flash then start
    
    5 logs in and generates SSH keys
    
    9 Sets tftp root as a variable _(run this first or second, only needs to run once)_
    
    0 Input IP of your computer here _(run this first or second, only needs to run once)_


v0.1 - ***Untested*** edits to call variables and make scripts more universal
