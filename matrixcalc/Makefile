CC=g++

CFLAGS=-pthread -c -std=c++14 

all: matrix_bench

matrix_bench: matrix_benchmark.o
	$(CC) -pthread $< -o $@

matrix_benchmark.o: matrix_benchmark.c++
	$(CC) $(CFLAGS) $<

clean: 
	rm *.o matrix_bench
