; 递归版
(defun intersperse (obj lst)
  (if (null lst)
    lst
    (let ((fst (car lst)))
      (if (null (cdr lst))
        (list fst)
        (append (list fst obj) (intersperse obj (cdr lst)))))))

; 迭代版
(defun intersperse-iter (obj lst)
  (let ((new-lst (list (car lst))))
    (do* ((i 1 (+ 1 i))
          (e (nth i lst) (nth i lst)))
         ((>= i (length lst)) new-lst)
      (setf new-lst (append new-lst (list obj e))))))
