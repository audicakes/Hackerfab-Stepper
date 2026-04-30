# Hackerfab-Stepper

clone whole repo (stepper directory & everything in it) and make sure you're working in the stepper directory

CODE CHANGES required in default.toml file:

  connecting the motor:
  1) run "ls /dev/tty.*" (no quotations) in your terminal to show all connected device names (for Mac)
  2) connect computer to SKR PICO board via USBC cable (warning: using dongle/adapter sometimes doesn't work!)
  3) run "ls /dev/tty.*" (no quotations) again and notice a new connected device show up (something like "/dev/tty.usbmodem3101"): copy this name!
  4) in default.toml file: change port name to that new connected device name (line 28 with comment "CHANGE THIS!")

  connecting the cam:
  1) connect camera to computer via USBA cable (warning: using dongle/adapter sometimes doesn't work!)
  2) in default.toml file: try changing camera index if camera isn't connected / wrong camera connected (line 11 with comment "CHANGE THIS!")
  
  (remember to save changes to your own local default.toml before running actual script)
  
RUNNING PYTHON SCRIPT: gui.py (located in src directory): connect computer to board & USB cam in setup
  1) install required dependencies that will pop up if there's errors running the code, like pip install stuff or smtg. has to do with setting up virtual environment .venv I think. this installation guide does better job describing this part, smtg like pip install -r requirements.txt: https://docs.google.com/document/d/1YfTg02TKQj3yyqTUPdaRIhkUvofh5QlHqMsbmtyFL4I/edit?tab=t.0
  2) pop-up will ask you to select a config file: select default.toml
