CC=g++
LD_LIBRARY_PATH=/usr/local/lib
CFLAGS=-pthread -c -std=c++14 
OFLAGS=-latlas-runtime -lgcd-compat
CLEANEXTS=o so

all: matrix_calc

matrix_calc: matrix_benchmark.o
	$(CC) $(OFLAGS) -pthread  $< -o $@

matrix_benchmark.o: matrix_benchmark.c++
	$(CC) -g $(OFLAGS) $(CFLAGS) $<

clean: 
	rm -f *.o matrix_calc
