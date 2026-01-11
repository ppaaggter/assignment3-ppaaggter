#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


int main(int argc,char * argv[]){


	char * ruta_del_archivo,* texto;
	FILE * pFile;

	if(argc!=3){
		return EXIT_FAILURE;
	}

	ruta_del_archivo=argv[1];
	texto=argv[2];


	pFile=fopen(ruta_del_archivo,"w");

	if(errno==0){

		fputs (texto,pFile);

		fclose(pFile);
	}else if(errno==2 && errno==6){
		printf("The file doesn't exist");
		return EXIT_FAILURE;
	}else if(errno==13){
		printf("Permisson denied");
		return EXIT_FAILURE;
	}else{
		printf("Something unexpected happens working with the file");
		return EXIT_FAILURE;
	}






	return EXIT_SUCCESS;
}
