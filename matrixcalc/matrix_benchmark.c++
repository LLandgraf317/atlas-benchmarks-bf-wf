#include "boost/multi_array.hpp"
#include <cassert>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <pthread.h>

#include "atlas/atlas.h"

#define MATRIX_HL 200
#define handle_error(msg) \
               do { perror(msg); exit(EXIT_FAILURE); } while (0)


typedef boost::multi_array<double, 2> array_type;
typedef array_type::index index;
	
array_type multiply(array_type m1, array_type m2);

int random_cust() {
	return rand() % 10000;
}

int random_100() {
	return rand() % 100;
}

struct thread_info {
	pthread_t thread_id;
	int thread_num;
	char* argv_string;
};

void initialize(array_type* matrix) {
	
	for (index i = 0; i != MATRIX_HL; ++i) {
		for (index j = 0; j != MATRIX_HL; ++j) {
			(*matrix)[i][j] = random_cust();
		}
	}
}

void initializeZero(array_type* matrix) {
	for (index i = 0; i != MATRIX_HL; ++i) {
		for (index j = 0; j != MATRIX_HL; ++j) {
			(*matrix)[i][j] = 0;
		}
	}
}

static void* thread_start(void *arg) {
	struct thread_info *tinfo = (thread_info*) arg;
	char *uargv, *p;
	
	std::cout << "Thread " << tinfo->thread_num << " started" << std::endl;	
  	array_type A(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type B(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type C(boost::extents[MATRIX_HL][MATRIX_HL]);
	
	initialize(&A);
	initialize(&B);
	//initializeZero(&C);

	C = multiply(A,B);
	
	std::cout << "Thread " << tinfo->thread_num << " finished" << std::endl;

	return NULL;
}

int 
main () {
  // Create a 3D array that is 3 x 4 x 2
  	array_type A(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type B(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type C(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type D(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type E(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type F(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type G(boost::extents[MATRIX_HL][MATRIX_HL]);
  	array_type H(boost::extents[MATRIX_HL][MATRIX_HL]);

	int s, threadNumber, optional;
	int numberThreads = 4;
	struct thread_info *threadInfo;
	pthread_attr_t attribute;
	int stackSize;
	void *res;

  	//std::default_random_engine generator;
  	//std::uniform_int_distribution<int> distribution(0,10000);
	//std::uniform_int_distribution<int> random_100(0,MATRIX_HL);

  	
	/*for(index i = 0; i != MATRIX_HL; ++i) 
    		for(index j = 0; j != MATRIX_HL; ++j) {
        		A[i][j] = random_cust();
			B[i][j] = random_cust();
			C[i][j] = random_cust();
			D[i][j] = random_cust();
			E[i][j] = 0;//distribution(generator);
			F[i][j] = 0;//distribution(generator);
			//G[i][j] = distribution(generator);
			//H[i][j] = distribution(generator);
		}
	std::cout << "Initialized matrices" << std::endl;
	*/
 	s = pthread_attr_init(&attribute);

	//Allocate memory for pthread_create arguments
 	threadInfo = (thread_info*) calloc(numberThreads, sizeof(struct thread_info));
	if (threadInfo == NULL) 
		handle_error("calloc being an ***");

	for (threadNumber = 0; threadNumber < numberThreads; threadNumber++) {
			threadInfo[threadNumber].thread_num = threadNumber + 1;
			threadInfo[threadNumber].argv_string = NULL;
			
			s = pthread_create(&threadInfo[threadNumber].thread_id, 
			NULL,//&attribute, wurde hier nicht initialisiert, kÃnnte fertige Matrizen enthalten
			&thread_start, 
			&threadInfo[threadNumber]); 
	}

 	for (threadNumber = 0; threadNumber < numberThreads; threadNumber++) {
		s = pthread_join(threadInfo[threadNumber].thread_id, &res);
		free(res);
	}	

	

  	return 0;
}

array_type multiply(array_type m1, array_type m2) {
	array_type erg(boost::extents[MATRIX_HL][MATRIX_HL]);
	
	for(index i = 0; i != MATRIX_HL; ++i) {
		for(index j = 0; j != MATRIX_HL; ++j) {
			erg[i][j] = 0;
			for(index k = 0; k != MATRIX_HL; ++k)
				erg[i][j] = m1[i][k] * m2[k][i] + erg[i][j];			
		}
		std::cout << i << " line of matrix" << std::endl;
	}
	return erg;
}
