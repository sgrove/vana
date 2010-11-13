(defpackage :vana-routes
   (:use :common-lisp)
   (:export :*static-routes*))

(in-package :vana-routes)

(ql:quickload :hunchentoot)

;; Place routes here. Will be nicer soon (he said on 2010-11-12)
(hunchentoot:define-easy-handler (welcome :uri "/welcome") () (homepage))
(hunchentoot:define-easy-handler (login :uri "/login") () (login-page))
(hunchentoot:define-easy-handler (home :uri "/") () (homepage))

;; (A B) Maps static files from uri A to folder B
(defvar *static-routes*)
(setq *static-routes*
      '("/public/" #p"./public/"
        "/images/" #p"./public/images/"
        "/css/"    #p"./public/css/"
        "/js/"     #p"./public/js/"))

;; Put all of the static routes into hunch
(loop for (uri folder) on static-routes :by #'cddr
   do (hunchentoot:create-folder-dispatcher-and-handler uri folder))

(setf hunchentoot:*default-handler* (hunchentoot:define-easy-handler (notfound) ()
                                      (setf (hunchentoot:return-code*) hunchentoot:+http-not-found+)))
