(defvar cs164-mode-hook nil)

(setq cs164-keywords '("def" "print" "error" "if" "else" "for" "while"
                       "null" "lambda" "ite" "in" "coroutine" "yield" "resume"))
;;(setq cs164-types '("int" "bool" "string" "float" "color" "px" "taggedInt"
;;                   "taggedFloat" "time"))

(setq cs164-keywords-regexp (regexp-opt cs164-keywords 'words))

;;(setq cs164-type-regexp (concat (regexp-opt cs164-types 'words)
;;                              "\\|\\<\\([A-Z]\\w*\\)\\>"))

(setq cs164-keywords-variables
      "def\\s-+\\([a-zA-Z_][a-zA-Z_0-9]*\\)\\s-*\\|for\\s-*(\\([a-zA-Z_][a-zA-Z_0-9]*\\)")

(setq cs164-comment "\\(#.*\\)$")


(setq cs164-keywords nil)
;; (setq cs164-types nil)

(setq cs164-font-lock-keywords
      `(
        (,cs164-comment 1 font-lock-comment-face)
        ;; (,cs164-type-regexp . font-lock-type-face)
        (,cs164-keywords-regexp . font-lock-keyword-face)
        (,cs164-keywords-variables 1 font-lock-variable-name-face)
        ))

(define-derived-mode cs164-mode fundamental-mode
  "cs164-mode"
  "Major mode to edit cs164"
  (setq font-lock-defaults '((cs164-font-lock-keywords)))
  (setq cs164-keywords-regexp nil)
  ;; (setq cs164-type-regexp nil)
  (setq cs164-keywords-variables nil)
                                        ; (setq c-basic-offset 4)
                                        ; (c-set-offset 'case-label '+)
  )

;; (set (make-local-variable 'indent-line-function) 'cs164-indent-line)

(add-to-list 'auto-mode-alist '("\\.164\\'" . cs164-mode))
(provide 'cs164-mode)
