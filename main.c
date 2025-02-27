#include "commons.h"
#include "wav_structs.h"
#include "mono.h"

int main(int argc, char** argv) {
	int return_code = EXIT_FAILURE;

	if (argc == 4) {
		string filename_in, filename_out;
		char* endptr;

		filename_in = argv[1];
		filename_out = argv[2];
		uint16_t chanId = strtoul(argv[3], &endptr, 10);

		FILE* fp_in = fopen(filename_in, "r");
		FILE* fp_out = fopen(filename_out, "w");

		extractChannel(fp_in, fp_out, chanId);

		return_code = EXIT_SUCCESS;
	}

	return return_code;
}