# rézovitès

> Test lan speed with dd & netcat (simple wrapper)

* * *

Inspired by [http://tuxtweaks.com/2014/11/linux-network-speed-test/](tuxtweaks.com) method, a simple wrapper sh script to test LAN speed.

## Usage

Make sure the script is _executable_.
This script must be launched twice : once for the listener, then for the sender.

### As listener

On the listener, launch the script with the following parameter:

    $ ./rezovites.sh listen

> This will launch `netcat -lk 49999` (listening connexions on port 49999), and display the current IP adresses of the machine.

### As sender

On the sender, launch the script with the following parameters:

    $ ./rezovites.sh IP AMOUNT

> This will send AMOUNT data (in MB) to given IP, using `dd` & `netcat`, and print the result.

* * *

**rézovitès** is free and unencumbered public domain software.
