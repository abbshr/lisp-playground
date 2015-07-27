#!/usr/bin/clisp

(format t "~A"((lambda ()
  (format t "enter a number: ")
  (let ((val (read)))
    (if (numberp val)
      val
      (asknum))))))
