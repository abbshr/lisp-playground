; 二分搜索树
; struct实现

(defstruct node
  (elt nil)
  (l nil)
  (r nil))

(defun bst-insert (obj bst)
  (if (null bst)
    (make-node :elt obj)
    (let ((elt (node-elt bst))
          (l (node-l bst))
          (r (node-r bst)))
      (if (eql elt obj)
        bst
        (if (< obj elt)
          (make-node
            :elt elt
            :l (bst-insert obj l)
            :r r)
          (make-node
            :elt elt
            :l l
            :r (bst-insert obj r)))))))

(defun bst-find (obj bst)
  (if (null bst)
    nil
    (let ((elt (node-elt bst)))
      (if (eql elt obj)
        bst
        (if (< obj elt)
          (bst-find obj (node-l bst)
          (bst-find obj (node-r bst))))))))

(defun bst-remove (obj bst)
  (if (null bst)
    nil
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
        (new-tree bst)
        (if (< obj elt)
          (make-node
            :elt elt
            :l (bst-remove obj (node-l bst))
            :r (node-r bst))
          (make-node
            :elt elt
            :l (node-l bst)
            :r (bst-remove obj (node-r bst))))))))
(defun new-tree (bst)
  (if (null (node-l bst))
    (node-r bst)
    (if (null (node-r bst))
      (node-l bst)
      (if (random 2)
        (let ((l-max (bst-max (node-l bst))))
          (make-node
            :elt (node-elt l-max)
            :l (bst-remove-max (node-l bst))
            :r (node-r bst)))
        (let ((r-min (bst-min (node-r bst))))
          (make-node
            :elt (node-elt r-min)
            :l (node-l bst)
            :r (bst-remove-min (node-r bst))))))))
(defun bst-remove-max (bst)
  (if (null (node-r bst))
    (node-l bst)
    (make-node
      :elt (node-elt bst)
      :l (node-l bst)
      :r (bst-remove-max (node-r bst)))))
(defun bst-remove-min (bst)
  (if (null (node-l bst))
    (node-r bst)
    (make-node
      :elt (node-elt bst)
      :l (bst-remove-min (node-l bst))
      :r (node-r bst))))
(defun bst-max (bst)
  (if (null (node-r bst))
    bst
    (bst-max (node-r bst))))
(defun bst-min (bst)
  (if (null (node-l bst))
    bst
    (bst-min (node-l bst))))
