; 游程编码：解码

(defun uncompress (lst)
  (if (consp lst)
    (uncompr (car lst) (cdr lst))
    lst))

(defun uncompr (first lst)
  (if (null lst)
    (split first)
    (let ((next (car lst)))
      (append (split first) (uncompr next (cdr lst))))))

(defun split (tuple)
  (if (consp tuple)
    (extend (car tuple) (second tuple))
    (list tuple)))

(defun extend (n elem)
  (if (< n 1)
    nil
    (cons elem (extend (- n 1) elem))))

(format t "~A" (uncompress '((2 A) (2 B) (3 C) D E F (3 G))))
