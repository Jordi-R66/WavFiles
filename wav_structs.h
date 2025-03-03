#pragma once

#include "commons.h"

struct Header {
	uint32_t FileTypeBlockID;
	uint32_t FileSize;
	uint32_t FileFormatID;

	uint32_t FormatBlocID;
	uint32_t BlockSize;
	uint16_t AudioFormat;
	uint16_t NbrChannels;
	uint32_t Frequency;
	uint32_t BytePerSec; // BytePerSec
	uint16_t BytePerBlock;
	uint16_t BitsPerSample;

	uint32_t DataBlockID;
	uint32_t DataSize;
};

typedef struct Header Header;

// Functions

/* Reads header from file */
Header readHeader(string filename_in);

/* Generate the header for a file that would have lost a channel */
Header oneChannelHeader(Header originalHeader);
