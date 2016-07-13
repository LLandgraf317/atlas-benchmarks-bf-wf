#include "boost/multi_array.hpp"
#include "boost/program_options.hpp"
#include <cassert>
#include <cmath>
#include <cstdlib>
#include <sys/syscall.h>
#include <sys/wait.h>
#include <iostream>
#include <iomanip>
#include <fstream>

#include <pthread.h>
#include <sched.h>

#include <functional>
#include <chrono>
#include <atomic>
#include <thread>
#include <mutex>

#include "../runtime/dispatch.h"
#include "atlas/atlas.h"

#define handle_error(msg) \
               do { perror(msg); exit(EXIT_FAILURE); } while (0)

using namespace std::literals::chrono_literals;

static pid_t gettid() { return static_cast<pid_t>(syscall(SYS_gettid)); }

static int taskcount = 0;
static std::ofstream myfile;
static std::vector<pid_t> tids;
static std::mutex tid_addition_mutex;

typedef boost::multi_array<double, 2> array_type;
typedef array_type::index index_arr;

int matrix_hl = 150;

auto deadline = 11750ms;

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

	for (index_arr i = 0; i != matrix_hl; ++i) {
		for (index_arr j = 0; j != matrix_hl; ++j) {
			(*matrix)[i][j] = random_cust();
		}
	}
}

void initializeZero(array_type* matrix) {
	for (index_arr i = 0; i != matrix_hl; ++i) {
		for (index_arr j = 0; j != matrix_hl; ++j) {
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
//j	std::cout << "Thread of execution: " <<  gettid() << std::endl;
	//struct thread_info *tinfo = (thread_info*) arg;
	char *uargv, *p;
	auto begin = std::chrono::steady_clock::now();
#if 0
	while(!tid_addition_mutex.try_lock()){}
	++tidcount;
	std::cout << tidcount << std::endl;
	tids.push_back(gettid());
	tid_addition_mutex.unlock();	
#endif
	array_type A(boost::extents[matrix_hl][matrix_hl]);
	array_type B(boost::extents[matrix_hl][matrix_hl]);
	initialize(&A);
	initialize(&B);

	auto C = multiply(A,B);
	
	auto end = std::chrono::steady_clock::now();
	auto duration = end - begin;
	taskcount++;
	if(taskcount > 5){
		myfile << taskcount-5 << "\t";
		myfile << sched_getcpu() << "\n";	
		myfile << "Duration: " 
		<< std::chrono::duration_cast<std::chrono::milliseconds>(duration).count() << " ms\n";
	}
}
};

void matrix_parallel_pthreads() {
	using namespace std::chrono;
	//using namespace std::literals::chrono_literals;
	int numberThreads = 8;
	struct thread_info *threadInfo;
	int numberCpus = 8;
	int threadNumber;
	int s;
	void *res;
	cpu_set_t *cpuset;
//	tids = 0;
	
 		//s = pthread_attr_init(&attribute);

		//Allocate memory for pthread_create arguments
	
 		threadInfo = (thread_info*) calloc(numberThreads, sizeof(struct thread_info));
	

		if (threadInfo == NULL)
			handle_error("calloc not giving resources");
	
		
		
		threadInfo[threadNumber].thread_num = threadNumber + 1;
		threadInfo[threadNumber].argv_string = NULL;
			
		/*s = pthread_create(&threadInfo[threadNumber].thread_id,
			NULL,//&attribute, wurde hier nicht initialisiert, koennte fertige Matrizen enthalten
			&thread_start,
			&(threadInfo[threadNumber]));*/
	
 		for (threadNumber = 0; threadNumber < numberThreads; threadNumber++) {
			s = pthread_join(threadInfo[threadNumber].thread_id, &res);
			free(res);
		}
}

void matrix_parallel_once() {
	using namespace std::chrono;
	//using namespace std::literals::chrono_literals;
	double metric = 1;
	matrixstruct task;
	atlas::dispatch_queue queue("one", {1,2,3,4});
	for(int i = 0; i<1; i++) {
		sleep(2);
		queue.dispatch_async_atlas(steady_clock::now()+deadline, &metric, 1, std::bind(&matrixstruct::thread_start, &task));
	}
	
}
	
	

void matrix_parallel() {
	using namespace std::chrono;
	//using namespace std::literals::chrono_literals;
	int numberThreads = 16;
	int numberCpus = 8;
	int threadNumber;

	
	//cpuset = CPU_ALLOC(numberCpus);
	//CPU_SET(1, cpuset);
	//CPU_SET(2, cpuset);
	atlas::dispatch_queue queue("matrix", {1,2,3,4});
	double metric = 1;
		
	matrixstruct something;


	for (threadNumber = 0; threadNumber < numberThreads; threadNumber++) {
			queue.dispatch_async_atlas(steady_clock::now()+deadline, &metric, 1,
				std::bind(&matrixstruct::thread_start, &(something)));
		
	}
#if 0
	queue.dispatch_async_atlas(steady_clock::now(), &metric, 1,
		std::bind(&matrixstruct::thread_start, &something));	
	queue.dispatch_async_atlas(steady_clock::now(), &metric, 1,
		std::bind(&matrixstruct::thread_start2, &something));	
	queue.dispatch_async_atlas(steady_clock::now(), &metric, 1,
		std::bind(&matrixstruct::thread_start3, &something));	
	queue.dispatch_async_atlas(steady_clock::now(), &metric, 1,
		std::bind(&matrixstruct::thread_start4, &something));	
#endif
	
}

int
main (int argc, char *argv[]) {
	namespace po = boost::program_options;
	int warmupcount = 5;
	po::options_description desc("Matrix Calculation ATLAS Benchmark");
	auto t = std::time(nullptr);
    	auto tm = *std::localtime(&t);
    	std::ostringstream oss;
	
	desc.add_options()
			("deadline,d", po::value<int>()->required(), "set deadline to value")
			("schedule,s", po::value<std::string>()->required(), "set file name to value");

	po::variables_map vm;
	po::store(po::parse_command_line(argc, argv, desc), vm);
	po::notify(vm);

	if(vm.count("deadline")) {
		deadline = (std::chrono::duration<int, std::milli>) vm["deadline"].as<int>();
		oss << vm["deadline"].as<int>();
	}
	
	if(vm.count("schedule")) {
		oss << vm["schedule"].as<std::string>() << "-";
	}

    	oss << std::put_time(&tm, "%Y-%m-%d-%H-%M");
	myfile.open("results/counttime-" + oss.str(), std::ios::app);
    	myfile << std::put_time(&tm, "%d-%m-%Y %H-%M-%S") << "\n";
	myfile << "Deadline for one matrix multiplication: " 
		<< std::chrono::duration_cast<std::chrono::milliseconds>(deadline).count() << " ms\n";


	//std::cout << "Beginning warmup..." << std::endl;
	for(int i = 0; i<warmupcount; i++) {
		std::thread event(matrix_parallel_once);
		if(event.joinable()) {
			event.join();
		}
	}
	
	//std::cout << "Beginning benchmark run..." << std::endl;
	sleep(1);
	std::cout << "SIGNAL" << std::endl;	
	std::thread heavyLoad(matrix_parallel);
	if(heavyLoad.joinable()) {
		heavyLoad.join();
	}	
	myfile.close();
	//std::cout << "End" << std::endl;
  	return 0;
}

array_type multiply(array_type m1, array_type m2) {
	array_type erg(boost::extents[matrix_hl][matrix_hl]);

	for(index_arr i = 0; i != matrix_hl; ++i) {
		for(index_arr j = 0; j != matrix_hl; ++j) {
			erg[i][j] = 0;
			for(index_arr k = 0; k != matrix_hl; ++k)
				erg[i][j] = m1[i][k] * m2[k][i] + erg[i][j];
		}
	}
	return erg;
}
