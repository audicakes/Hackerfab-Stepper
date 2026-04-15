# Hackerfab-Stepper

clone whole repo (stepper directory & everything in it)

CODE CHANGES required in default.toml file:
1) run "ls/dev/tty.*" in ur terminal to show all connected devices (for Mac)
2) connect computer to SKR PICO board via usbc (CANNOT USE DONGLE OR CONNECTION WON'T SHOW UP)
3) run "ls/dev/tty.*" again and notice a new connection show up like "/dev/tty.usbmodem3101": copy this!
4) in default.toml file: change port name to that new connected SKR PICO port name


running gui.py: connect computer to board & USB cam in setup
