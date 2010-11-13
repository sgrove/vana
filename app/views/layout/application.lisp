(defpackage :layout
  (:use :cl
        :vana-templating
        :vana-utils)
  (:export :standard-head
           :standard-footer
           :layout))

(in-package :layout)

;;; Partials
(defun standard-head (params &rest sub-exps)
  (!DOCTYPE '(html)
            (html '(lang "en" class "js")
                  (head
                   (meta '(http-equiv "X-UA-Compatible" content "IE=8;chrome=1"))
                   (meta '(charset "utf-8"))
                   (title params)
                   (link '(rel "shortcut icon" href "favicon.png"))
                   (link '(type "text/css" rel "stylesheet" media "screen" href "css/screen.css"))
                   (link '(type "text/css" rel "stylesheet" media "print" href "css/print.css")))
                  (reduce #'string sub-exps))))

(defun standard-login ()
  (form '(id standard-login-form)
        (input '(id username type text))
        (input '(id password type password))
        (input '(type submit value "login via common lisp"))))

(defun shared/sindebar ()
  (div '(class "span-6 last")
       (comment "right column")
       (styled-box :prefix "y" :content
                   (list->string
                    (list
                     (div '(class "ybox-title") "What is Milo?")
                     (div '(class "ybox-answer") "MiloStudy makes it easier for international students to get free answers about studying, living and exploring the USA.")
                     (div '(class "ybox-hr"))
                     (form '(action "/sessions" method "post")
                           (div '(style "margin:0;padding:0;display:inline;")
                                (input '(name "authenticity_token" type "hidden" value "GnwwUY0cuKlNkYQe44ZgXag/dgjPz9NiDPeLYWTttf4=")))
                           (div '(class "ybox-login-title") "Members login")
                           (div '(class "span-5 last" id "login-form")
                                (label "Login"))
                           (input '(id "login" name "login" type "text"))
                           (div '(class "span-5 last" id "login-form")
                                (label "Pass")
                                (input '(id "password" name "password" type "password")))
                           (div '(class "span-5 last" id "login-submit")
                                (input '(type "submit" value "Log Me In"))
                                (p
                                 (a '(href "/forgot_password") "I forgot my password")))))))
       (styled-box :prefix "w" :content
                   (list->string
                    (list
                     (img '(src "/images/mashpot.png"))
                     (div '(id "wbox-title") "Confused?")
                     "Let milo help you study in the USA!"
                     (br)
                     (a '(href "#") "Check out how"))))
       (styled-box :prefix "r" :title "Recent Answers"
                   :content
                   (list->string
                    (list
                     (recent-answer-inline "Yan"
                                           "What are the good classes to start with in the U..."
                                           "/questions/what-are-the-good-classes-to-start-with-in-the-u-s?locale=en")
                     (recent-answer-inline "Yan"
                                           "Where/how can I find other international students?"
                                           "/questions/where-how-can-i-find-other-international-students")
                     (recent-answer-inline "Yan"
                                           "How much money do I need for getting MBA?"
                                           "/questions/how-much-money-do-i-need-for-getting-mba?locale=en")
                     (recent-answer-inline "Yan"
                                           "How can I get a Social Security Number (SSN)?"
                                           "/questions/how-can-i-get-a-social-security-number-ssn?locale=en"))))))

(defun recent-answer-inline (username text link)
  (div '(class "rbox-post-1")
       (concatenate 'string username " answered ")
       (a (list (quote href) link) text)))


(defun styled-box (&key (prefix "generic-") (title nil) (id nil) content)
  (list->string
   (list
    (div '(class prefix "box"))
    (div (list (quote class) (concatenate 'string prefix "box-top"))
         (div (list (quote class) (concatenate 'string prefix "box-topleft")))
         (div (list (quote class) (concatenate 'string prefix "box-topmiddle")))
         (div (list (quote class) (concatenate 'string prefix "box-topright"))))
    (div (list (quote class) (concatenate 'string prefix "box-middle"))
         (div (list (quote class) (concatenate 'string prefix "box-content"))
              (div (list 'id id) title)
         content))
    (div (list (quote class) (concatenate 'string prefix "box-bottom"))
         (div (list (quote class) (concatenate 'string prefix "box-bottomleft")))
         (div (list (quote class) (concatenate 'string prefix "box-bottommiddle")))
         (div (list (quote class) (concatenate 'string prefix "box-bottomright"))))
    (comment "end of box"))))

(defun standard-footer ()
  (div '(id "footerWrap")
       (div '(id "footer")
            (div '(class footer-content)
                 (div '(class "span-7" id "recent-articles")
                      (div '(class "recent-art")
                           (translate "Recent Articles"))
                      (div '(class "recent-posts")
                           (div '(class "recent-post")
                                (div '(class "recent-post-title")
                                     "Selection of fence with knot holes. Directional signs and log post with knotty plank"))
                           (div '(class "recent-post")
                                (div '(class "recent-post-title")
                                     "To modify this file you will need vector editing software such as Adobe Illustrator, Freehand, or Corel DRAW."))))
                 (div '(class "span-1" id "blue-border"))
                 (div '(class "span-7" id "recent-tweet")
                      (div '(class "footer-title")
                           (translate "Recent Tweets"))
                      (div '(class "span-5 last" id "tweet-rss")
                           (div '(class "span-3 last")
                                (div '(class "span-1")
                                     (a '(href "/questions.rss" title "Milostudy RSS Feed")
                                        (img '(src "/images/rss-icon.png"))))
                                (div '(class "span-1 last")
                                     (a '(href "http://twitter.com/milostudy" alt "Follow us on Twitter!" title "Follow us on Twitter!")
                                        (img '(src "/images/twitter-icon.png"))))))
                      (div '(class "span-6 last")
                           (p '(class "follow-us")
                              (translate "Follow us on twitter")
                              (a '(href "#") (translate "Learn More")))))
                 (div '(class "span-1" id "blue-border"))
                 (div '(class "span-7 last" id "milo-news")
                      (div '(class "footer-title")
                           (translate "Milo News"))
                      (div '(class "blog-posts")
                           (div '(class "recent-post")
                                (div '(class "recent-post-title")
                                     "Today")
                                "No news yet, but we're happy to have you here! ^^")
                           (div '(class "recent-post")
                                (div '(class "recent-post-title")
                                     "Yesterday")
                                "We're getting ready to launch soon!")))))
       (script '(src "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type "text/javascript"))
       (script '(src "/js/application.js" type "text/javascript"))))

(defun layout (title body)
  (standard-head
   title
   (body
    (div '(id "headerWrap")
         (div '(class header)
              (div '(class "span-24 last")
                   (div '(class "span-24 last" id "navbar")
                        (ul '(class "navlinks")
                            (li
                             (div '(class "nlink")
                                  (a '(href "http://blog.milostudy.com")
                                     (translate "Milo Blog"))))
                            (li
                             (div '(class "nlink")
                                  (a '(href "/about")
                                     (translate "About"))))
                            (li
                             (div '(class "nlink")
                                  (a '(href "/login")
                                     (translate "Login"))))
                            (li
                             (div '(class "nlink")
                                  (a '(href "/join")
                                     (translate "Join"))))
                            (li
                             (div '(class "ask-q")
                                  (a '(href "/profile")
                                     (translate "Ask Your question!"))))
                            (li
                             (div '(class "nlink")
                                  (a '(href "/")
                                     (translate "Home")))))))
              (div '(class "span-15 last")
                   (div '(class "sitemeta")
                        (img '(src "/images/milostudy.png"))))))
    (div '(id "contentWrap")
         (div '(class "span-21" id "pagecontent")
              (div '(class "span-15")
                   (div '(class "span-15 last" id "ptitle"))
                        body))
              (shared/sidebar)))
    (standard-footer)))

;;; Templates
(defun homepage ()
  (layout "Answers about everything on studying in the US - Milostudy!"
          (question-header)))

(defun login-page ()
  (layout "Please Login"
          (standard-login)))

(defun question-header ()
  (div '(class "span-15")
        (div '(class "span-15 last" id "ptitle")
              (div '(class "span-10") "Milo's Questions")
              (div '(class "span-1")
                    (span '(id "qfix")
                          (a '(href  "/questions.rss?locale=en" alt "MiloStudy's RSS Feed" title "Milo's questions through rss!" (img '(alt "rss-icon" src "/images/rss-icon.png"))))))
              (div '(class "span-1")
                   (span '(id "qfix")
                         (a '(alt "Follow Milo on Twitter!" href "http://twitter.com/milostudy" title "Follow Milo on Twitter!")
                            (img '(src "/images/twitter-icon.png"))))))
        (div '(class "span-15")
             (div '(class "pagination")
                  (span '(class "disabled prev_page") "« Previous")
                  (span '(class "current") "1")
                  (a '(href "/questions?locale=en&amp;page=2" rel "next") "2")
                  (a '(href "/questions?locale=en&amp;page=3") "3")
                  (a '(href "/questions?locale=en&amp;page=4") "4")
                  (a '(href "/questions?locale=en&amp;page=5") "5")
                  (a '(href "/questions?locale=en&amp;page=6") "6")
                  (a '(href "/questions?locale=en&amp;page=7") "7")
                  (a '(href "/questions?locale=en&amp;page=2" class "next_page" rel "next") "Next »")))
        (question-page-question "How much money do I need for getting MBA?"
                                "It varies depending on the school, location, your family's income, and your ab..."
                                "Milo" 1)
        (question-page-question "Does the person I choose for writing recommendation letter..."
                                "Although the letter will be attractive if your recommender is a super famou..."
                                "Milo" 1)
        (question-page-question "What qualities/weaknesses should be highlighted in my resu..."
                                "A resume is to show how GREAT you are, therefore, you never want to show yo..."
                                "Milo" 4)
        (question-page-question "How should I answer \"Why did you choose this university?\""
                                "Every school has its own uniqueness. I would suggest that you first ask you..."
                                "Milo" 1)
        (question-page-question "What should be some criteria when choosing a university?"
                                "No answer yet! Be the first to answer this question!"
                                "Milo" 0)
        (question-page-question "How do I find out which school is the best for the major I..."
                                "No answer yet! Be the first to answer this question!"
                                "Milo" 0)
        (question-page-question "How can I get a Social Security Number (SSN)?"
                                "To get a SSN, you first need to find a job. Even an international student c..."
                                "Milo" 0)
        (question-page-question "What is a non-driver photo ID, and how can I get it?"
                                "I got my non-driver ID by going to the DMV and getting my picture taken. I ..."
                                "Milo" 0)
        (question-page-question "Where are the good places to study in the local areas in C..."
                                "Perhaps one of the most popular places for students to study at local coffee s..."
                                "Milo" 1)
        (question-page-question "Where can I find local Japanese bookstores in the U.S.?"
                                "No answer yet! Be the first to answer this question!"
                                "Milo" 0)))

(defun question-page-question (title body author answer-count)
  (list->string
   (list
    (div '(class "qbox")
         (div '(class "qbox-top")
              (div '(class "qbox-topleft"))
              (div '(class "qbox-topmiddle"))
              (div '(class "qbox-topright")))
         
         (div '(class "qbox-middle")
              (div '(class "qbox-content")
                   (div '(class "qbox-post")
                        (div '(id "qbox-marginfix")
                             (a (list (quote href) "/questions/how-much-money-do-i-need-for-getting-mba" (quote title) title)
                                (img '(src "/images/big-q.png"))))
                        (div '(class "qbox-title")
                             (a (list (quote href) "/questions/how-much-money-do-i-need-for-getting-mba" (quote title) title) title)
                        (p body))
                   (div '(class "qbox-postinfo")
                        (div '(class "qbox-author") "By "
                             (a '(href "/profile/milo") author))
                        (div '(class "qbox-meta")
                             (span '(class "qbox-tags") "Tags: ") " | " (span '(class "qbox-answers") (format nil "~A" answer-count) " answer"))))))
         (div '(class="qbox-bottom")
              (div '(class="qbox-bottomleft"))
              (div '(class="qbox-bottommiddle"))
              (div '(class="qbox-bottomright")))))))
