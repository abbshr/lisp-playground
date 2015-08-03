(defun mirror? (seq)
  (let ((len (length seq)))
    (and (evenp len)
         (let ((mid (/ len 2)))
         (equal (subseq seq 0 mid)
                (reverse (subseq seq mid)))))))