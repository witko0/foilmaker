#!/usr/bin/env python

import os, sys, ntpath;

g = sys.modules[__name__]

# GIMP console path (GIMP 2 bin dir added to path)
# ================================================
GIMP_CONSOLE = "gimp-console-2.10"

# processing method
# =================
PROCESSING_METHOD = "wbrMask"

# wbrMask default options
# =======================
# HARD option removes rectagle selection from image processing
g.SKIP_PIC_HARD = True
# SOFT option uses brush tool to partially remove most of the image (for now - poor quality)
g.SKIP_PIC_SOFT = False
# GLOW effect is being applied only on foil effect mask layer
g.GLOW_ON = True

# wbrMask default config
g.THR_BLACK = 0.5     # 0-1
g.THR_WHITE = 0.95    # 0-1
g.GLOW_RADIUS = 12.4  # 1-50
g.GLOW_BRIGHT = 0.32  # 0-1
g.GLOW_SHARP = 0.7    # 0-1
g.EFFECT_OPACITY = 38 # 0-100%

# TODO: sizes are now adjusted to card size: 357x497 (will be changed to % value)
g.SKIP_PIC_HARD_POS_X = 39
g.SKIP_PIC_HARD_POS_Y = 71
g.SKIP_PIC_HARD_SIZE_X = 278
g.SKIP_PIC_HARD_SIZE_Y = 208

g.SKIP_PIC_SOFT_POS_X = 178
g.SKIP_PIC_SOFT_POS_Y = 171
g.SKIP_PIC_SOFT_SIZE = 343      # 1-10000
g.SKIP_PIC_SOFT_ARATIO = 0.3    # -20-20
g.SKIP_PIC_SOFT_HARDNESS = 0.81 # 0-1


# this method parses different card types in order to decrease foil effect influence on unwanted image parts
def setPortraitBypassParams(cardtype):
    if cardtype == "lotrtcg_character":
        g.EFFECT_OPACITY = 38 # 0-100%
        g.SKIP_PIC_HARD = True
        g.SKIP_PIC_SOFT = False
        g.SKIP_PIC_HARD_POS_X = 39
        g.SKIP_PIC_HARD_POS_Y = 71
        g.SKIP_PIC_HARD_SIZE_X = 278
        g.SKIP_PIC_HARD_SIZE_Y = 208
        g.SKIP_PIC_SOFT_POS_X = 178
        g.SKIP_PIC_SOFT_POS_Y = 171
        g.SKIP_PIC_SOFT_SIZE = 343      # 1-10000
    elif cardtype == "lotrtcg_modifier":
        g.EFFECT_OPACITY = 38 # 0-100%
        g.SKIP_PIC_HARD = True
        g.SKIP_PIC_SOFT = False
        g.SKIP_PIC_HARD_POS_X = 76
        g.SKIP_PIC_HARD_POS_Y = 57
        g.SKIP_PIC_HARD_SIZE_X = 249
        g.SKIP_PIC_HARD_SIZE_Y = 185
        g.SKIP_PIC_SOFT_POS_X = 200
        g.SKIP_PIC_SOFT_POS_Y = 148
        g.SKIP_PIC_SOFT_SIZE = 308      # 1-10000
    elif cardtype == "lotrtcg_site":
        g.SKIP_PIC_HARD = False
        g.SKIP_PIC_SOFT = False
        g.SKIP_PIC_SOFT_POS_X = 165
        g.SKIP_PIC_SOFT_POS_Y = 247
        g.SKIP_PIC_SOFT_SIZE = 407      # 1-10000
        g.SKIP_PIC_SOFT_ARATIO = -1.1   # -20-20
        g.SKIP_PIC_SOFT_HARDNESS = 0.69 # 0-1
    elif cardtype == "lotrtcg_ring":
        g.SKIP_PIC_HARD = False
        g.SKIP_PIC_SOFT = False
    else:
        print("setPortraitBypassParams - card type not supported: " + cardtype)


def wbrMask(fname, cardtype, outputpath):
    # load image
    card = pdb.gimp_file_load(fname, fname)

    # duplicate image in new layer
    card_WB_layer = card.layers[0].copy()
    card.add_layer(card_WB_layer, 0)

    # load effect background as new layer
    effect_layer = pdb.gimp_file_load_layer(card, "effect.png")
    card.add_layer(effect_layer, 0)

    # apply card type parameters
    setPortraitBypassParams(cardtype)

    if SKIP_PIC_HARD:
        # cut off rectangle part of the image from processing
        pdb.gimp_image_select_rectangle(card, 0, g.SKIP_PIC_HARD_POS_X, SKIP_PIC_HARD_POS_Y, g.SKIP_PIC_HARD_SIZE_X, g.SKIP_PIC_HARD_SIZE_Y)
        pdb.gimp_edit_bucket_fill(card.layers[1], 0, 0, 100, 0, FALSE, g.SKIP_PIC_HARD_POS_X, g.SKIP_PIC_HARD_POS_Y)
        pdb.gimp_selection_none(card)
    elif SKIP_PIC_SOFT:
        # use brush to partially remove picture
        # not working -> pdb.gimp_context_set_brush("2. Block 02")
        brush_name = pdb.gimp_brush_new('new')
        pdb.gimp_brushes_set_brush(brush_name)
        pdb.gimp_context_set_brush_size(g.SKIP_PIC_SOFT_SIZE)
        pdb.gimp_context_set_brush_angle(0)
        pdb.gimp_context_set_brush_spacing(10)
        pdb.gimp_context_set_brush_force(0.5)
        pdb.gimp_context_set_brush_aspect_ratio(g.SKIP_PIC_SOFT_ARATIO)
        pdb.gimp_context_set_brush_hardness(g.SKIP_PIC_SOFT_HARDNESS)
        pdb.gimp_paintbrush_default(card.layers[1], 2, [g.SKIP_PIC_SOFT_POS_X, g.SKIP_PIC_SOFT_POS_Y])

    # create white/black mask
    pdb.gimp_drawable_threshold(card.layers[1], 0, g.THR_BLACK, g.THR_WHITE)

    # load mask to an effect image
    pdb.gimp_image_select_item(card, 0, card.layers[1])
    mask = effect_layer.create_mask(ADD_SELECTION_MASK)
    card.layers[0].add_mask(mask)
    pdb.gimp_edit_copy(card.layers[1])
    floating_sel = pdb.gimp_edit_paste(card.layers[0].mask, FALSE)
    pdb.gimp_floating_sel_anchor(floating_sel)
    pdb.gimp_image_remove_layer(card, card.layers[1])

    # add glow to main effect and adjust its visibility
    if GLOW_ON:
        pdb.plug_in_softglow(card, card.layers[0], g.GLOW_RADIUS, g.GLOW_BRIGHT, g.GLOW_SHARP)
    card.layers[0].opacity = float(g.EFFECT_OPACITY)

	# file export
    card.merge_visible_layers(NORMAL_MODE)
    #pdb.file_png_save(card, card.layers[0], outputpath + ntpath.basename(fname), outputpath + ntpath.basename(fname), 0, 9, 1, 0, 0, 1, 1)
    pdb.file_png_save_defaults(card, card.layers[0], os.path.splitext(outputpath + ntpath.basename(fname))[0] + ".png", os.path.splitext(outputpath + ntpath.basename(fname))[0] + ".png")
    pdb.gimp_image_delete(card)


# GIMP auto-execution stub
if __name__ == "__main__":
    import os, sys, subprocess
    if len(sys.argv) < 4:
        print("Missing arguments! Usage: foilmaker.py <card_type> <output_dir_path> <image/images_path>")
        print("Example: python foilmaker.py lotrtcg_character C:/MyFoils/ D:/CardImages/*.jpg")
        sys.exit(-1)
    scrdir = os.path.dirname(os.path.realpath(__file__))
    scrname = os.path.splitext(os.path.basename(__file__))[0]
    outputpath = sys.argv[2]
    images = sys.argv[3:]
    applylines = ""
    for img in images:
        applylines += ";" + scrname + "." + PROCESSING_METHOD + "('" + img + "', '" + sys.argv[1] + "', '" + outputpath + "')"
    shcode = "import sys;sys.path.insert(0, '" + scrdir + "');import " + scrname + applylines
    shcode = GIMP_CONSOLE + " -idf --batch-interpreter python-fu-eval -b \"" + shcode + "\" -b \"pdb.gimp_quit(1)\""
    sys.exit(subprocess.call(shcode, shell=True))
else:
    from gimpfu import *
