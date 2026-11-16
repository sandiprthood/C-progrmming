#include <stdio.h>
#include <stdlib.h>
typedef struct Node { int data; struct Node *left, *right; } Node; Node *insert(Node *r, int x) {
if (!r) {
r = (Node *)malloc(sizeof(Node));
if (!r) exit(1);
r->data = x; r->left = r->right = NULL;
} else if (x < r->data) r->left = insert(r->left, x); else if (x > r->data) r->right = insert(r->right, x); return r;
}
void inorder(Node *r) {
if (r) { inorder(r->left); printf("%d ", r->data); inorder(r->right); }
}
void release(Node *r) {
if (r) { release(r->left); release(r->right); free(r); }
}
int main(void) {
int a[] = {50, 30, 70, 20, 40}, i;
Node *root = NULL;
for (i = 0; i < 5; i++) root = insert(root, a[i]); printf("Inorder: "); inorder(root); printf("\n"); release(root);
return 0;
}
