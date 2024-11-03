(load-file "~/.doom.d/org-clock-export.el")

(setq org-clock-export-org-ql-query '(not (tags "noexport"))
      org-clock-export-files '("Calendar.org"
                               "Calendar.org_archive"
                               "University.org"
                               "University.org_archive")
      org-clock-export-export-file-name (concat org-directory "/clock-export.csv")
      org-clock-export-buffer "*ORG-CLOCK-EXPORT CSV*"
      org-clock-export-delimiter ","
      org-clock-export-data-format '( "filename" (file-name-nondirectory (buffer-file-name))
                                        ;"heading"  (org-entry-get (point) "ITEM") ;
                                      "outline"  (tn/list-to-string (org-get-outline-path t t))
                                      "date"     (concat start-year "-" start-month "-" start-day)
                                      "tzone"    (tn/get-tzone)
                                      "start"    (concat start-hour ":" start-minute)
                                      "duration" (number-to-string (+ (* (string-to-number total-hours) 60)
                                                                      (string-to-number total-minutes)))
                                      "tags"     (or (org-entry-get (point) "ALLTAGS") "nil")
                                      "note"     (tn/get-lognote)))
(defun tn/get-lognote ()
  "Get tags following '- ' on the line below the current point."
  (save-excursion
    (forward-line 1) ;; Move to the line below
    (if (looking-at "- \\(.+\\)")
        (s-replace "," "." (match-string 1)) ;; Return the text following '- '
      "nil"))) ;; Return nil if not found

(defvar tn/default-tzone "+0200")

(defun tn/get-tzone ()
  "Get timezone from the first time timestamp in the clock.
    Supports timestamps without timezone"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (forward-char 28)
    (let ((start-pos (point)))
      ;; jumps to the next closing square bracket character, to find and return the time zone
      (if (search-forward "]" (line-end-position) t) ; Search for the character in the line
          (progn
            (backward-char)
            (let* ((text (buffer-substring-no-properties start-pos (point)))
                   (trim (s-trim text)))
              (if (> (length trim) 0)
                  trim
                tn/default-tzone)))
        ;; recognises miswritten timestamps
        tn/default-tzone))))

(defun tn/list-to-string (lst)
  "Convert a list into a quoted string format.
Each element in the list will be quoted and separated by spaces."
  (mapconcat (lambda (x) (format "\"%s\"" x)) lst " "))
