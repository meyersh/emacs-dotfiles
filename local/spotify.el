; https://developer.spotify.com/technologies/web-api/

; "http://ws.spotify.com/search/1/track.json?q=miles davis"

(defun spotify-play-href (href)
  (shell-command (format  "osascript -e 'tell application %S to play track %S'"
         "Spotify"
         href)))

(defvar sample-href "spotify:track:5Yt80fWRB8JG73XlPjrrKP"
"Pink Floyd - Don't need no education")

(spotify-play-href sample-href)

(require 'url)
(require 'json)

(defun spotify-search (search-query)
  (with-current-buffer
      (url-retrieve-synchronously
       (format "http://ws.spotify.com/search/1/track.json?q=%s" search-query))
    (goto-char (+ 1 url-http-end-of-headers))
    (json-read-object)))

(defvar sample-results (spotify-search "talking heads"))

(assoc 'info sample-results)
(assoc 'num_results (assoc 'info sample-results))
(assoc 'href (elt (cdr (assoc 'tracks sample-results)) 0))

(defun format-track-for-display (track)
  (format "%s\n%s"
          (cdr (assoc 'name track))
          (cdr (assoc 'name (assoc 'album track)))))

(defun helm-spotify-search ()
  (mapcar (lambda (track)
            (cons (format-track-for-display track)
                  track))
          (cdr (assoc 'tracks (spotify-search helm-pattern)))))

(car (helm-spotify-search))

(defun helm-spotify-play-track (track)
  (spotify-play-href (cdr (assoc 'href track))))

(defvar help-source-spotify
  '((name . "Spotify")
    (candidates . helm-spotify-search)
    (action . (("Play track" . helm-spotify-play-track)))
    (multiline)
    (volatile)))

(helm :sources '(help-source-spotify))
