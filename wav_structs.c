#include "wav_structs.h"

Header oneChannelHeader(Header originalHeader) {
	Header output = *(&originalHeader);

	output.DataSize /= originalHeader.NbrChannels;
	output.FileSize = sizeof(Header) + output.DataSize - 8;
	output.NbrChannels = 1;
	output.BytePerSec /= originalHeader.NbrChannels;
	output.BytePerBlock /= originalHeader.NbrChannels;

	return output;
}