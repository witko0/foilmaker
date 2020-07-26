# foilmaker
foilmaker allows multiple images automatic processing using GIMP open-source software and its python-fu plugin support in order to achieve digital version of foil effect, well known from the world of real-life collectible card games.

Direct inspiration:
* https://imgur.com/a/cqdKPbv (an idea on how to achieve desired foil effect in digital world)
* https://ntcore.com/?p=509 (great article on how to use GIMP SDK using Python)

Prerequisites:
* GIMP 2 installation
* Python2x (for now)

# Configuration
Placed at the beginning of foilmaker.py file:

* GIMP_CONSOLE - choose your GIMP console version exe file name
* PROCESSING_METHOD - for now only one supported ("wbrMask") 
* wbrMask processing parametrization:
	* THR_BLACK - threshold effect black colors usage
	* THR_WHITE - threshold effect white colors usage
	* EFFECT_OPACITY - final effect opacity

# Usage
foilmaker.py <output_dir_path> <image/images_path>

Examples:
* foilmaker.py C:/MyFoils/ D:/CardImages/card01.jpg
* foilmaker.py C:/MyFoils/ D:/CardImages/card01.jpg D:/CardImages/card02.jpg
* foilmaker.py C:/MyFoils/ D:/CardImages/*.jpg
