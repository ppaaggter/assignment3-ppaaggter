#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <syslog.h>

int main(int argc,char * argv[]){


	char * ruta_del_archivo,* texto;
	FILE * pFile;


	openlog("Logs", LOG_ERR, LOG_USER);



	if(argc!=3){
		return EXIT_FAILURE;
	}

	ruta_del_archivo=argv[1];
	texto=argv[2];


	pFile=fopen(ruta_del_archivo,"w");

	if(errno==0){

		fputs(texto,pFile);

		fclose(pFile);
	}else if(errno==2 && errno==6){

		syslog(LOG_INFO, "The file doesn't exist");
		return EXIT_FAILURE;
	}else if(errno==13){
		syslog(LOG_INFO, "Permisson denied");
		return EXIT_FAILURE;
	}else{
		syslog(LOG_INFO, "Something unexpected happens working with the file");
		return EXIT_FAILURE;
	}



	closelog();



	return EXIT_SUCCESS;
}
