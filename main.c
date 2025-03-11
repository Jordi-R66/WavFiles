#include "commons.h"
#include "wav_structs.h"
#include "mono.h"

int main(int argc, char** argv) {
	int return_code = EXIT_FAILURE;

	if (argc == 3) {
		string filename_in, filename_out_pattern;
		char* endptr;

		filename_in = argv[1];
		filename_out_pattern = argv[2];

		extractAllChannels(filename_in, filename_out_pattern);

		return_code = EXIT_SUCCESS;
	}

	return return_code;
}