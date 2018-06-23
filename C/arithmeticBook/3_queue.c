#include <stdio.h>
#include <stdlib.h>
#include "3_queue.h"

#define MinQueueSize(5)

struct QueueRecord{

  int capacity;
  int front;
  int rear;
  int size;
  ElementType *array;
}


int IsEmpty(Queue Q){


}


int IsFull(Queue Q){


}


Queue CreateQueue(int MaxElements){


}


void DisposeQueue(Queue Q){


}


void MakeEmpty(Queue Q){


}


void EnQueue(ElementType X, Queue Q){


}


ElementType Front(Queue Q){


}


void DeQueue(Queue Q){


}


ElementType FrontAndDequeue(Queue Q){


}
