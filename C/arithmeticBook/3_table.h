//数组实现的缺点：估算最大值浪费空间、插入和删除的花费是昂贵的

struct Node;
typedef struct Node *PtrToNode;
typedef PtrToNode List;
typedef PtrToNode Position;

List makeEmpty(List L);
bool IsEmpty(List L);
bool IsLast(List L, Position P);
Position Find(List L, ElementType X);
void Delete(List L, ElementType X);
Position FindPrevious(List L, ElementType X);
void Insert(List L, ElementType X, Position P);
void DeleteList(List L);
Position Header(List L);
Position First(List L);
Position Advance(Position P);
ElementType Retrieve(Position P);
