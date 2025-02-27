#pragma once

#include "commons.h"

/* Extracts every channel contained in a wave file into their own individual wave file* */
void extractAllChannels(string filename_in, string filename_out);

/* Extracts specified channel from a wave file and writes it inside a new wave file */
void extractChannel(FILE* fp_in, FILE* fp_out, uint16_t ChannelId);