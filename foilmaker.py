#!/usr/bin/env python

import ntpath;

# GIMP console path (GIMP 2 bin dir added to path)
GIMP_CONSOLE = "gimp-console-2.10"

# processing method
PROCESSING_METHOD = "wbrMask"

# wbrMask config
THR_BLACK = 0.58    # 0-1
THR_WHITE = 1       # 0-1
EFFECT_OPACITY = 24 # 0-100%

def wbrMask(fname, outputpath):
    card = pdb.gimp_file_load(fname, fname)
    card_WB_layer = card.layers[0].copy()
    card.add_layer(card_WB_layer, 0)
    effect_layer = pdb.gimp_file_load_layer(card, "effect.png")
    card.add_layer(effect_layer, 0)
    pdb.gimp_drawable_threshold(card.layers[1], 0, THR_BLACK, THR_WHITE)
    pdb.gimp_image_select_item(card, 0, card.layers[1])
    mask = effect_layer.create_mask(ADD_SELECTION_MASK)
    card.layers[0].add_mask(mask)
    pdb.gimp_edit_copy(card.layers[1])
    floating_sel = pdb.gimp_edit_paste(card.layers[0].mask, FALSE)
    pdb.gimp_floating_sel_anchor(floating_sel)
    pdb.gimp_image_remove_layer(card, card.layers[1])
    card.layers[0].opacity = float(EFFECT_OPACITY)
    card.merge_visible_layers(NORMAL_MODE)
    pdb.file_png_save(card, card.layers[0], outputpath + ntpath.basename(fname), outputpath + ntpath.basename(fname), 0, 9, 1, 0, 0, 1, 1)
    pdb.gimp_image_delete(card)

# GIMP auto-execution stub
if __name__ == "__main__":
    import os, sys, subprocess
    print len(sys.argv)
    if len(sys.argv) < 3:
        print("Missing arguments! Usage: foilmaker.py <output_dir_path> <image/images_path>")
        print("Example: python2 foilmaker.py C:/MyFoils/ D:/CardImages/*.jpg")
        sys.exit(-1)
    scrdir = os.path.dirname(os.path.realpath(__file__))
    scrname = os.path.splitext(os.path.basename(__file__))[0]
    outputpath = sys.argv[1]
    images = sys.argv[2:]
    applylines = ""
    for img in images:
        applylines += ";" + scrname + "." + PROCESSING_METHOD + "('" + img + "', '" + outputpath + "')"
        print img
    shcode = "import sys;sys.path.insert(0, '" + scrdir + "');import " + scrname + applylines
    shcode = GIMP_CONSOLE + " -idf --batch-interpreter python-fu-eval -b \"" + shcode + "\" -b \"pdb.gimp_quit(1)\""
    sys.exit(subprocess.call(shcode, shell=True))
else:
    from gimpfu import *
