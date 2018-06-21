
//分离链接散列表的类型申明

struct ListNode;
typedef struct ListNode *Position;
struct HashTbl;
typedef struct HashTbl *HashTable;

HashTable InitializeTable(int TableSize);
void DestroyTable(HashTable H);
Position Find(ElementType key, HashTable H);
void  Insert(ElementType Key, HashTable H);
ElementType Retrieve(Position P);
