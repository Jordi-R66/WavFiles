#include "commons.h"
#include "wav_structs.h"
#include "mono.h"

int main(int argc, char** argv) {
	if (argc == 3) {
		string filename_in, filename_out;

		filename_in = argv[1];
		filename_out = argv[2];

		FILE* fp_in = fopen(filename_in, "r");
		FILE* fp_out = fopen(filename_out, "w");

		extractChannel(fp_in, fp_out, 1);
	}
}