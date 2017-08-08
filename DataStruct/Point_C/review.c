#include<stdio.h>
#include<string.h>
#include<math.h>


int main(int argc, char const *argv[]) {

  //functionSX();
  //functionMonkey(10);
  // functionJX(3);


  return 0;
}

/*
利用递归方法求5!
*/

1, 1, 2 ,3 ,5 ...

int functionFBLQ(int n){

  if (n == 1 || n == 2) {
    /* code */
    return 1;
  }

  return functionFBLQ(n) + functionFBLQ(n -1);

}


int functionJXDG(int n){

  if (n == 1) {
    return 1;
  }

  return functionJXDG(n - 1) * n;
}

/*
题目：求1+2!+3!+...+20!的和
*/
int functionJX(int n){

  int sum = 0;

  for (size_t i = 1; i <= n; i++) {
    /* code */

    int sumI = 1;
    for (size_t j = 1; j <= i; j++){
      /* code */
      sumI *= j;
    }

    sum += sumI;
  }

  printf("sumJC = %d\n",sum);

  return sum;
}

/*
题目：猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不瘾，又多吃了一个
第二天早上又将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下的一半零一个。
到第10天早上想再吃时，见只剩下一个桃子了。求第一天共摘了多少
*/

int functionMonkey(int day){

  int sum = 0;

  for (size_t i = 0; i < 10; i++) {
    /* code */

    if (i == 0) {
      sum = 1;

    }else{

      sum += 1;
      sum *= 2;
    }
  }

  printf("%d\n",sum);
}


//水仙花数
functionSX(){

  for (size_t i = 100; i < 1000; i++) {
    /* code */
    int a = i/100;    //百位
    int b = i/10%10;  //十位
    int c = i%10;     //个位

    if ( (pow(a,3) + pow(b,3) + pow(c,3)) == i) {
      /* code */
      printf("i = %d\n", i);
    }

  }

}
