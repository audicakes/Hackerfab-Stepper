# Hackerfab-Stepper

clone whole repo (stepper directory & everything in it) and make sure you're working in the stepper directory

CODE CHANGES required in default.toml file:

  connecting the motor:
  1) run "ls/dev/tty.*" in your terminal to show all connected device names (for Mac)
  2) connect computer to SKR PICO board via usbc (CANNOT USE DONGLE OR CONNECTION WON'T SHOW UP)
  3) run "ls/dev/tty.*" again and notice a new connected device show up (something like "/dev/tty.usbmodem3101"): copy this name!
  4) in default.toml file: change port name to that new connected device name (line 28 with comment "CHANGE THIS!")

  connecting the cam:
  5) in default.toml file: try changing camera index if camera isn't connected / wrong camera connected (line 11 with comment "CHANGE THIS!")
  
  (remember to save changes to your own local default.toml before running actual script)
  
RUNNING PYTHON SCRIPT: gui.py (located in src directory): connect computer to board & USB cam in setup
  1) pop-up will ask you to select a config file: select default.toml
