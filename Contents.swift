import UIKit

public class TreeNode<T> {
    
    // This
      public var value: T
    //The variable of children returns aa array of elements if there can be multiple.
    //
      public var children: [TreeNode] = []

      public init(_ value: T) {
        self.value = value
          
      public func add(_ child: TreeNode) {
        children.append(child)
          }
    }
}

// DepthFirstTraversal
extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach{
            $0.forEachDepthFirst(visit: visit)
        }
    }
}

// Level Order Traversal
extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void){
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach {queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.childrenforEach {
                visit(node)
                node.children.forEach {queue.enqueue($0)}
            }
    }
}
