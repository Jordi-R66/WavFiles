#pragma once

#include "commons.h"

/* Extracts specified channel from a wave file and writes it inside a new wave file */
void extractChannel(FILE* fp_in, FILE* fp_out, uint16_t ChannelId);