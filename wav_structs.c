#include "wav_structs.h"

Header readHeader(string filename_in) {
	FILE* fp = fopen(filename_in, "r");

	Header output;

	fread(&output, 1, sizeof(Header), fp);
	fclose(fp);

	return output;
}

Header oneChannelHeader(Header originalHeader) {
	Header output = *(&originalHeader);

	output.DataSize /= originalHeader.NbrChannels;
	output.FileSize = sizeof(Header) + output.DataSize - 8;
	output.NbrChannels = 1;
	output.BytePerSec /= originalHeader.NbrChannels;
	output.BytePerBlock /= originalHeader.NbrChannels;

	return output;
}