#include <iostream>
#include <string>

/*
  Apple LLVM version 8.1.0 (clang-802.0.42)

  References:
  c_str : http://www.cplusplus.com/reference/string/string/c_str/
  find : http://www.cplusplus.com/reference/string/string/find/
  length : http://www.cplusplus.com/reference/string/string/length/

  Compile:
  g++ -o substring substring.cpp
*/

int FindSubstringindex(const std::string *parentstring, const std::string *substring) {
  int e = 0, indx = -1;
  const char *parentcstring = parentstring->c_str();
  const char *csubstring = substring->c_str();

  for (int i = 0; i < strlen(parentcstring); i++) {
  	if (parentcstring[i] == csubstring[e]) {
  	  if (e == 0) 
  	  	indx = i;
  	  e++;
  	  if (e == strlen(csubstring)) {
  	  	return indx;
  	  }
  	}
  }
  return -1;
}

int main () {

  const std::string extendedParentstring = "Hello extended string Agnosticdev, I love Tutorials";
  const std::string substring = "Agnosticdev";

  // Standard Approach
  /*
  std::string parentstring = "Hello Agnosticdev, I love Tutorials";

  if (std::size_t index = parentstring.find(substring)) {
  	std::cout << "Substring found at index " << index << ", with length " << substring.length() << std::endl;
  } else {
  	std::cout << "Substring not found at all in parent string" << std::endl;
  }*/

  // Alternative Approach
  int substringIndex = FindSubstringindex(&extendedParentstring, &substring);
  std::cout << "Substring found at index " << substringIndex << std::endl;

  return 0;
}