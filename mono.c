#include "mono.h"
#include "wav_structs.h"

#include "string.h"

void extractAllChannels(string filename_in, string filename_out_pattern) {
	Header header = readHeader(filename_in);

	FILE* fp_in = fopen(filename_in, "r");
	char filename_out[128];

	for (uint16_t i = 0; i < header.NbrChannels; i++) {
		fseek(fp_in, 0, SEEK_SET);
		memset(filename_out, 0, 128);
		sprintf(filename_out, "%s_%hu.wav", filename_out_pattern, i);

		FILE* fp_out = fopen(filename_out, "w");
		extractChannel(fp_in, fp_out, i);
	}

	fclose(fp_in);
}

void extractChannel(FILE* fp_in, FILE* fp_out, uint16_t ChannelId) {
	char buffer[4096];		// buffer utilisé pour les lectures/écritures

	size_t nbread;				// nombre d'octets lus après chaque appel à read
	size_t nbwrote;			// nombre d'octets écrits après chaque appel à write

	// [2] Lecture de l'entête du fichier en entrée, modification des données
	// nécessaires dans le buffer et écriture de l'entête modifié dans le
	// fichier en sortie

	Header header_in;
	Header header_out;

	nbread = fread(buffer, 1, sizeof(Header), fp_in);

	if (nbread != sizeof(Header)) {
		fprintf(stderr, "Couldn't read properly input's header\n");
		exit(EXIT_FAILURE);
	} else {
		header_in = *(Header*)buffer;
	}

	printf("%X\n", __STDC_VERSION__);

	bool isRightFormat = header_in.FileTypeBlockID == 0x46'46'49'52
						&& header_in.FileFormatID == 0x45'56'41'57;

	if (!isRightFormat) {
		fprintf(stderr, "The file given in entry isn't a wave file.\n");
		exit(EXIT_FAILURE);
	}

	header_out = oneChannelHeader(header_in);

	// Écriture du nouvel header dans le fichier de sortie
	nbwrote = fwrite(&header_out, sizeof(Header), 1, fp_out);

	/*if (nbwrote != sizeof(Header)) {
		fprintf(stderr, "Couldn't write properly output's header\n");
		exit(EXIT_FAILURE);
	}*/

	// [3] Lecture des données du fichier en entrée (par blocs de 4096 octets)
	// et écriture dans le fichier en sortie des octets correspondant aux
	// échantillons du premier canal.

	for (int i = 0; i < 4096; i++) {
		buffer[i] = 0;
	}

	uint32_t BytesToRead = header_in.BytePerBlock;

	uint32_t n_iter = header_in.DataSize / BytesToRead;

	for (uint32_t i = 0; i < n_iter; i++) {
		nbread = fread(buffer, 1, BytesToRead, fp_in);

		if (nbread > 0) {
			nbwrote = fwrite(buffer + ChannelId, 1, BytesToRead / header_in.NbrChannels, fp_out);
		}
	}

	//fclose(fp_in);
	fclose(fp_out);
}