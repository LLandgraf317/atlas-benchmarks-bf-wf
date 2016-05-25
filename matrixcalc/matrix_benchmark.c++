#include "boost/multi_array.hpp"
#include <cassert>
#include <cmath>
#include <cstdlib>
#include <iostream>

#include <pthread.h>
#include <sched.h>

#include <functional>
#include <chrono>
#include <atomic>
#include <thread>

#include "../runtime/dispatch.h"
#include "atlas/atlas.h"

#define MATRIX_HL 150
#define handle_error(msg) \
               do { perror(msg); exit(EXIT_FAILURE); } while (0)


typedef boost::multi_array<double, 2> array_type;
typedef array_type::index index_arr;

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

	for (index_arr i = 0; i != MATRIX_HL; ++i) {
		for (index_arr j = 0; j != MATRIX_HL; ++j) {
			(*matrix)[i][j] = random_cust();
		}
	}
}

void initializeZero(array_type* matrix) {
	for (index_arr i = 0; i != MATRIX_HL; ++i) {
		for (index_arr j = 0; j != MATRIX_HL; ++j) {
			(*matrix)[i][j] = 0;
		}
	}
}

//class MyFunctor {
//	public: 
//		MyFunctor () : 
//}

void *do_anything(void*) {
	while(1) {}
}

struct execsomething {
	void loopdaloop() {
		while(1) {}
	}
};

struct matrixstruct {
void thread_start() {
	//struct thread_info *tinfo = (thread_info*) arg;
	char *uargv, *p;
		std::cout << "Thread started" << std::endl;
	array_type A(boost::extents[MATRIX_HL][MATRIX_HL]);
	array_type B(boost::extents[MATRIX_HL][MATRIX_HL]);
	initialize(&A);
	initialize(&B);
	

	auto C = multiply(A,B);
	std::cout << "Thread finished" << std::endl;
}
};


void matrix_parallel() {
	using namespace std::chrono;
	using namespace std::literals::chrono_literals;
	int numberThreads = 8;
	struct thread_info *threadInfo;
	int numberCpus = 8;
	int threadNumber;
	int s;
	void *res;
	cpu_set_t *cpuset;
	
	std::cout << "Getting cpu_set_t" << std::endl;
	cpuset = CPU_ALLOC(numberCpus);
	std::cout << "Initializing dispatch_queue" << std::endl;
	atlas::dispatch_queue queue("matrix", {0,1,2,3,4,5,6,7});
	std::cout << "Dispatch queue initialized" << std::endl;
	double metric = 1;
	bool useQueues = true;
	
	if(!useQueues) {
 		//s = pthread_attr_init(&attribute);

		//Allocate memory for pthread_create arguments
 		threadInfo = (thread_info*) calloc(numberThreads, sizeof(struct thread_info));
	

		if (threadInfo == NULL)
			handle_error("calloc not giving resources");
	}	

	for (threadNumber = 0; threadNumber < numberThreads; threadNumber++) {
		if(useQueues) {
			matrixstruct something;
			std::cout << "Trying to put into queue..." << std::endl;
			queue.dispatch_async_atlas(steady_clock::now(), &metric, 1,
				std::bind(&matrixstruct::thread_start, &something));
			
		}
		else {
		
			threadInfo[threadNumber].thread_num = threadNumber + 1;
			threadInfo[threadNumber].argv_string = NULL;
			
			/*s = pthread_create(&threadInfo[threadNumber].thread_id,
				NULL,//&attribute, wurde hier nicht initialisiert, koennte fertige Matrizen enthalten
				&thread_start,
				&(threadInfo[threadNumber]));*/
		}
		
	}
	
	if(!useQueues)
 	for (threadNumber = 0; threadNumber < numberThreads; threadNumber++) {
		s = pthread_join(threadInfo[threadNumber].thread_id, &res);
		free(res);
	}
	std::cout << "End" << std::endl;
}

int
main () {

	
	std::cout << "Entering matrix_parallel()" << std::endl;
	std::thread event(matrix_parallel);
	if(event.joinable())
		event.join();
	
//	pthread_t dummy;
//	pthread_create(&dummy,
			//NULL,//&attribute, wurde hier nicht initialisiert, koennte fer    tige Matrizen enthalten
                                //&do_anything,
                               //NULL);
	//while(1) {}
  	return 0;
}

array_type multiply(array_type m1, array_type m2) {
	array_type erg(boost::extents[MATRIX_HL][MATRIX_HL]);

	for(index_arr i = 0; i != MATRIX_HL; ++i) {
		for(index_arr j = 0; j != MATRIX_HL; ++j) {
			erg[i][j] = 0;
			for(index_arr k = 0; k != MATRIX_HL; ++k)
				erg[i][j] = m1[i][k] * m2[k][i] + erg[i][j];
		}
		std::cout << i << " line of matrix" << std::endl;
	}
	return erg;
}
