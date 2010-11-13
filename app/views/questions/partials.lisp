(defpackage :question-partials
  (:use :cl
        :vana-templating
        :vana-utils)
  (:export :question-header
           :question-page-question))

(in-package :question-partials)

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
