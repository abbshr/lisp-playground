; 定义一个函数，它接受一个列表作为实参，
; 如果有一个元素是列表时，就返回真
; 递归版
(defun is-true (lst)
  (if (null lst)
    nil
    (or (listp (car lst))
        (is-true (cdr lst)))))

(format t "~A" (is-true (read)))

; 打点
(defun recurse (num)
  (if (= num 0)
    nil
    (progn
      (format t "~A" ".")
      (recurse (- num 1)))))

(defun iterator (num)
  (do ((i num (- i 1)))
      ((= i 0) nil)
    (format t "~A" ".")))

; 返回列表里所有非nil元素和
(defun summit-v1 (lst)
  (apply #'+ (remove nil lst)))

(defun summit-v2 (lst)
  (if (null lst)
    0
    (let ((x (car lst)))
      (if (null x)
        (summit-v2 (cdr lst))
        (+ x (summit-v2 (cdr lst)))))))
