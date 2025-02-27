#include "wav_structs.h"

Header oneChannelHeader(Header originalHeader) {
	Header output = *(&originalHeader);

	output.DataSize /= originalHeader.ChannelNumber;
	output.FileSize = sizeof(Header) + output.DataSize - 8;
	output.ChannelNumber = 1;
	output.ByteRate /= originalHeader.ChannelNumber;
	output.BytePerBlock /= originalHeader.ChannelNumber;

	return output;
}