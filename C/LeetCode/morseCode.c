#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int uniqueMorseRepresentations(char** words, int wordsSize);

int main(int argc, char const *argv[]) {

  char *a[] = {"trmj","cgo","nyj","cqm","cgo","nyj","nyj","kpo","cqm","cgo","kpo","kwj",\
  "cmatt","cmj","nyj","kpo","kwj","cgo","ntpo","nnqm","kwj","cqm","kpo","cmj",\
  "kpo","kpo","ctkm","cmj","kpo","coir","kwbn","nkgf","kamef","kjsn","kagf",\
  "mmexf","ocaer","ocrr","mquf","okuf","zkmtc","zymke","dvmnie","nhmgei","nhoth",\
  "cgji","cgji","okuf","mmexf","mquf","ocaer","ocrr","fbmo","ftsom","fithve","ffiif",
  "imzez","uosz","uosz","imzez","hyxip","hkzbg","hyxip","hkzbg","aejwo","aumwo","reoemo",\
  "zeldg","zfrp","girenp","pthf","eqhf","acsf","pbef","atlhn","pbef","pbef","wlif","kjaetd",\
  "nycz","kjaez","pbtoi","acutz","akvtz","pfj","wefj","adrj","anfj","wvum","pfj","abxm","pfj",
  "wsnj","pido","pfj","pfj","ezrj","puio","wsnj","pfj"};

  printf("%d\n",uniqueMorseRepresentations(a, 100));

  return 0;
}


int uniqueMorseRepresentations(char** words, int wordsSize) {

    char *morses[] = {".-","-...","-.-.","-..",".","..-.","--.","....",\
        "..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.",\
        "...","-","..-","...-",".--","-..-","-.--","--.."};

    char *resultArr[100];

    int resultCount = 0;

    for (int i = 0; i < wordsSize; i ++) {

        //计算morsecode
        char *word = words[i];

        char *p = word;

        char *result = (char *)malloc(48*sizeof(char));
        menset(reustl,)

        while (*p != '\0') {

            char *morse = morses[*p - 'a'];

            strcat(result, morse);

            p ++;
        }

        //判断是否已经添加到数组中
        int isSame = 0;

        for (int j = 0; j < resultCount; j++) {

            char *tmp = resultArr[j];

            if (strcmp(tmp, result) == 0) {

                isSame = 1;

                break;
            }
        }
        //没有添加到数组中，则添加
        if (isSame == 0) {
            resultArr[resultCount++] = result;
        }

    }

    return resultCount;

}
