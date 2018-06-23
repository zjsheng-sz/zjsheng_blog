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

  return Q->size == 0;
}


int IsFull(Queue Q){

  return Q->size == Q->capacity;
}

void MakeEmpty(Queue Q){

  Q->size = 0;
  Q->front = 1;
  Q->rear = 0;
}


Queue CreateQueue(int MaxElements){

    Queue Q;

    if (MaxElements < MinQueueSize) {
      faltalError("too small");
    }
    else{

      Q = malloc(sizeof(struct QueueRecord));

      if (Q == NULL) {
        faltalError("out of space");
      }else{

        Q->array = malloc(sizeof(ElementType) * Q->capacity);
        if (!Q->array) {
          faltalError("out of space");
        }else{
          MakeEmpty(Q)
        }
      }
    }

    return Q;
}


void DisposeQueue(Queue Q){

  if (Q) {
    free(Q->array);
    free(Q);
  }
}

static int Succ(int Value, Queue Q){

  if (++Value == Q->capacity) {
    Value == 0;
  }

  return Value;
}


void EnQueue(ElementType X, Queue Q){

  if (IsFull(Q)) {
    faltalError("full Queue");
  }
  else{

    Q->size ++;
    Q->rear == Succ((Q->rear + 1), Q);
    Q->array[Q->rear] = X;

  }

}


ElementType Front(Queue Q){

  return Q->array[Q->front];
}


void DeQueue(Queue Q){

  if (IsEmpty(Q)) {
    faltalError("empty Queue");
  }
  else{

    Q->size --;
    Q->front == Succ((Q->rear + 1), Q);
    // Q->array[Q->front] = X;

  }
}


ElementType FrontAndDequeue(Queue Q){

  if (IsEmpty(Q)) {
    faltalError("empty Queue");
    return -1;
  }
  else{

    Q->size --;
    Q->front == Succ((Q->rear + 1), Q);
    return Q->array[Q->front]
  }

}
