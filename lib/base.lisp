(defpackage :vana
   (:use :common-lisp
         :vana-utils
         :vana-routes))

(in-package :vana)

(defun start (port)
  (hunchentoot:start (make-instance 'hunchentoot:acceptor :port port)))
