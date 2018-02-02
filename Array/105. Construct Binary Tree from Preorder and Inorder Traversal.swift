
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution1 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var rootValueToIndex: [Int:Int] = [:]
        for (index, rootValue) in inorder.enumerated() {
            print("index: \(index) rootValue: \(rootValue)")
            rootValueToIndex[rootValue] = index
        }
        print(rootValueToIndex)
        return  buildTree(
            preorder: preorder,
            preorderStartIndex: 0,
            preorderEndIndex: preorder.count - 1,
            inorder: inorder,
            inorderStartIndex: 0,
            inorderEndIndex: inorder.count - 1,
            rootValueToIndex: rootValueToIndex)
    }
    
    func buildTree(
        preorder: [Int],
        preorderStartIndex: Int,
        preorderEndIndex: Int,
        inorder: [Int],
        inorderStartIndex: Int,
        inorderEndIndex: Int,
        rootValueToIndex: [Int:Int]
        ) -> TreeNode? {
        guard preorderStartIndex <= preorderEndIndex else {
            return nil
        }
        
        let rootValue = preorder[preorderStartIndex]
        guard let inorderRootIndex = rootValueToIndex[rootValue] else {
            assertionFailure("invalid logic: couldn't' find root value")
            return nil
        }
        let leftLength = (inorderRootIndex - inorderStartIndex)
        
        let root = TreeNode(rootValue)
        root.left = buildTree(
            preorder: preorder,
            preorderStartIndex: preorderStartIndex + 1,
            preorderEndIndex: preorderStartIndex + 1 + leftLength - 1,
            inorder: inorder,
            inorderStartIndex: inorderStartIndex,
            inorderEndIndex: inorderStartIndex + leftLength - 1,
            rootValueToIndex: rootValueToIndex)
        
        root.right = buildTree(
            preorder: preorder,
            preorderStartIndex: preorderStartIndex + leftLength + 1,
            preorderEndIndex: preorderEndIndex,
            inorder: inorder,
            inorderStartIndex: inorderRootIndex + 1,
            inorderEndIndex: inorderEndIndex,
            rootValueToIndex: rootValueToIndex)
        return root
    }
}
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderMap: [Int: Int] = [:]
        for (index, value) in inorder.enumerated() {
            inorderMap[value] = index
        }
        return buildTree(
            preorder,
            inorder,
            preStart: 0,
            inStart: 0,
            inEnd: preorder.count - 1,
            inorderMap: inorderMap)
    }
    func buildTree(
        _ preorder: [Int],
        _ inorder: [Int],
        preStart: Int,
        inStart: Int,
        inEnd: Int,
        inorderMap: [Int: Int]
        ) -> TreeNode? {
        guard preStart <= preorder.count - 1 && inStart <= inEnd else {
            return nil
        }
        guard let preStartToIn = inorderMap[preorder[preStart]] else {
            return nil
        }
        let rootNode: TreeNode = TreeNode(preorder[preStart])
        rootNode.left = buildTree(
            preorder,
            inorder,
            preStart: preStart + 1,
            inStart: inStart,
            inEnd: preStartToIn - 1,
            inorderMap: inorderMap
        )
        rootNode.right = buildTree(
            preorder,
            inorder,
            preStart: preStartToIn - inStart + preStart + 1,
            inStart: preStartToIn + 1,
            inEnd: inEnd,
            inorderMap: inorderMap
        )
        return rootNode
    }
}
var solution = Solution()
var preorder = [1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15]
var inorder = [8, 4, 9, 2, 10, 5, 11, 1, 12, 6, 13, 3, 14, 7, 15]
var postorder = [8, 9, 4, 10, 11, 5, 2, 12, 13, 6, 14, 15, 7, 3, 1]
let resultRoot = solution.buildTree(preorder, inorder)

var bfsNums: [Int] = []
var treeStack: [TreeNode] = [resultRoot!]
func breathFirstSearch(_ tree: TreeNode?) {
    if tree != nil {
        bfsNums.append(tree!.val)
        if tree!.left != nil {
            treeStack.append(tree!.left!)
        }
        if tree!.right != nil {
            treeStack.append(tree!.right!)
        }
    }
}
var preIndex: Int = 0
func breathFirstSearchLoop() {
    if (treeStack.count > preIndex) {
        let count = treeStack.count
        for i in preIndex..<count {
            breathFirstSearch(treeStack[i])
        }
        preIndex = count
        breathFirstSearchLoop()
    }
}
breathFirstSearchLoop()
var bfsTreeVal: [Int] = []
for item in treeStack {
    bfsTreeVal.append(item.val)
}
print("bfs tree val:")
print(bfsTreeVal)

