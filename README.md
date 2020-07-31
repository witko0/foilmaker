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
* wbrMask options:
	* SKIP_PIC_HARD - removes rectagle selection from image processing
	* SKIP_PIC_SOFT - uses brush tool to partially remove most of the image (for now - poor quality)
	* GLOW_ON - glow effect is being applied only on foil effect mask layer
* wbrMask processing parametrization:
	* THR_BLACK - threshold effect black colors usage
	* THR_WHITE - threshold effect white colors usage
	* GLOW_RADIUS - glow effect radius value
	* GLOW_BRIGHT - glow effect brightness
	* GLOW_SHARP - glow effect sharpness
	* EFFECT_OPACITY - final effect opacity
	* x_POS_X - selection x coordinate
	* x_POS_Y - selection y coordinate
	* x_SIZE_X - selection x size
	* x_SIZE_Y - selectiin y size
	* x_SIZE - brush size
	* x_ARATIO - brush aspect ratio
	* x_HARDNESS - brush hardness

# Usage
foilmaker.py <card_type> <output_dir_path> <image/images_path>

Examplary usage:
* foilmaker.py lotrtcg_site C:/MyFoils/ D:/CardImages/card01.jpg
* foilmaker.py lotrtcg_character C:/MyFoils/ D:/CardImages/card01.jpg D:/CardImages/card02.jpg
* foilmaker.py lotrtcg_modifier C:/MyFoils/ D:/CardImages/*.jpg
