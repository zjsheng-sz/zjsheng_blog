
// 对于树中的每个节点X，它的左子树中的所有关键字的值小于X，而右子树的关键字的值大于X

struct TreeNode;
typedef struct TreeNode *Position;
typedef Position SearchTree;

SearchTree makeEmpty(SearchTree T);
Position Find(SearchTree T, ElementType X);
Position FindMax(SearchTree T);
Position FindMin(SearchTree T);
SearchTree Insert(SearchTree T, ElementType X);
SearchTree Delete(SearchTree T, ElementType X);
ElementType Retrieve(Position P);
