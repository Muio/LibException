#include <iostream>
#include <fstream>
using namespace std;
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include "Exception.H"

int main() {

  {
    Exception e("Testing");
  }

  {
    Exception e("Testing", "Filename", 1000001);
    assert(0 == strcmp("Filename", e.getFilename()));
    assert(1000001 == e.getLine());

    ofstream output("testfile");
    if(!output) {
      cerr << "Can't open testfile." << endl;
      abort();
    }

    output << e << endl;
    output.close();

    ifstream input("testfile");
    if(!input) {
      cerr << "Can't open testfile." << endl;
      abort();
    }

    char buffer[128];
    memset(buffer, 0, 128);
    input.read(buffer, 128);

    assert(0 == strcmp(buffer, "Testing at Filename:1000001\n"));
  }

}
