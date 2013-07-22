CC = g++
CFLAGS = -c -g -Wall -Wno-deprecated
GCOV = -fprofile-arcs -ftest-coverage

exceptiontest: ExceptionTest.o Exception.o Exception.H
	$(CC) ExceptionTest.o Exception.o -o exceptiontest

exceptiontestgcov: ExceptionTest.o.gcov Exception.o.gcov Exception.H
	$(CC) $(GCOV) ExceptionTest.o Exception.o -o exceptiontest

ExceptionTest.o: ExceptionTest.cc Exception.H
	$(CC) $(CFLAGS) ExceptionTest.cc

ExceptionTest.o.gcov: ExceptionTest.cc Exception.H
	$(CC) $(CFLAGS) $(GCOV) ExceptionTest.cc

Exception.o: Exception.cc Exception.H
	$(CC) $(CFLAGS) Exception.cc

Exception.o.gcov: Exception.cc Exception.H
	$(CC) $(CFLAGS) $(GCOV) Exception.cc

clean:
	rm -f *.o *~ exceptiontest *.gcda *.gcno *.gcov \#\*\#