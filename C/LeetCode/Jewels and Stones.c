
#include<stdio.h>

int numJewelsInStones(char* J, char* S);

int main(int argc, char const *argv[]) {


  char *J = "aA";
  char *S = "aAAbbbb";

  int num =  numJewelsInStones(J,S);

  printf("%d\n",num);
  
  return 0;
}

/*
Input: J = "aA", S = "aAAbbbb"
Output: 3
*/

int numJewelsInStones(char* J, char* S) {

  char *ps = S;
  char *pj = J;
  int count = 0;

  while (ps != '\0') {
    while (pj != '\0') {
      if (*ps == *pj) {
          count ++;
      }
      pj ++;
    }
    ps ++;
  }
  return count;
}
