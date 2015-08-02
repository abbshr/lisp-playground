; 游程编码

(defun compress (lst)
  (if (consp lst)
    (compr (car lst) 1 (cdr lst))
    lst))

(defun compr (first iter lst)
  (if (null lst)
    (list (n-elt first iter))
    (let ((next (car lst)))
      (if (eql first next)
        (compr first (+ iter 1) (cdr lst))
        (cons (n-elt first iter) (compr next 1 (cdr lst)))))))

(defun n-elt (elem iter)
  (if (= iter 1)
    elem
    (list iter elem)))


(format t "~A" (compress '(a a b b c c c d e f g g g)))
