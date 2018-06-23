//一颗AVL树是其每个节点的左子树和右子树的高度差最多为1的二叉查找树


struct AvlNode;
typedef struct AvlNode *Position;
typedef struct AvlNode *AvlTree;

AvlTree makeEmpty(AvlTree T);
Position Find(AvlTree T, ElementType X);
Position FindMax(AvlTree T);
Position FindMin(AvlTree T);
AvlTree Insert(AvlTree T, ElementType X);
AvlTree Delete(AvlTree T, ElementType X);
ElementType Retrieve(Position P);
