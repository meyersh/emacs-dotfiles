(provide 'phonetic-alphabet-mode)
"Shaun Meyer, Jan 2014"

(defvar phonetic-alphabet '(("A" . "Alfa") ("B" . "Bravo") ("C" . "Charlie")
                            ("D" . "Delta") ("E" . "Echo") ("F" . "Foxtrot")
                            ("G" . "Golf") ("H" . "Hotel") ("I" . "India")
                            ("J" . "Juliett") ("K" . "Kilo") ("L" . "Lima")
                            ("M" . "Mike") ("N" . "November") ("O" . "Oscar")
                            ("P" . "Papa") ("Q" . "Quebec") ("R" . "Romeo")
                            ("S" . "Sierra") ("T" . "Tango") ("U" . "Uniform")
                            ("V" . "Victor") ("W" . "Whiskey") ("X" . "X-ray")
                            ("Y" . "Yankee") ("Z" . "Zulu") ("1" . "One")
                            ("2" . "Two") ("3" . "Three") ("4" . "Four")
                            ("5" . "Five") ("6" . "Six") ("7" . "Seven")
                            ("8" . "Eight") ("9" . "Niner") ("0" . "Zero")
                            ("-" . "Dash") ("." . "Dot")))

; Retrieve a given entry from the list:
(defun lookup-phonetic-letter (letter)
  "Given a character (string), give back to string
representation. E.g. S -> Sierra"
  (cdr (assoc (char-to-string (upcase letter)) phonetic-alphabet)))


(defun lookup-phonetic-string (str)
  (interactive "sThe word(s): ")
  (message (mapconcat 'lookup-phonetic-letter (upcase str) " ")))