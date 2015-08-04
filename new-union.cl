(defun new-union (llst rlst)
  (if (null rlst)
    llst
    (let ((elem (car rlst)))
      (if (member elem llst)
        (new-union llst (cdr rlst))
        (new-union (append llst (list elem)) (cdr rlst))))))
