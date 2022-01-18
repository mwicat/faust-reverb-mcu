SHELL = /bin/sh
SRCDIR = ./src
FAUST_DIR = ./faust
FAUST_DSP = FaustProcessor
FAUST_PATCH = $(FAUST_DIR)/header_patch.cpp
FAUST_CPP = $(SRCDIR)/$(FAUST_DSP)/$(FAUST_DSP).cpp

.PHONY: faust2teensy teensy35 faust2svg

all: faust2teensy

faust2teensy:
	faust2teensy -lib $(FAUST_DIR)/$(FAUST_DSP).dsp
	unzip -o $(FAUST_DSP).zip -d $(SRCDIR)
	rm $(FAUST_DSP).zip
	cat $(FAUST_PATCH) $(FAUST_CPP) > $(FAUST_CPP).bak
	mv $(FAUST_CPP).bak $(FAUST_CPP)

teensy35: faust2teensy
	pio run --environment teensy35 --target upload

faust2svg:
	faust2svg $(FAUST_DIR)/$(FAUST_DSP).dsp

faust2svgviewer:
	faust2svgviewer $(FAUST_DIR)/$(FAUST_DSP).dsp
