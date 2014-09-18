(defvar cs164-mode-hook nil)

(setq cs164-keywords '("def" "print" "error" "if" "else" "for" "while"
                       "null" "lambda" "ite"))
;;(setq cs164-types '("int" "bool" "string" "float" "color" "px" "taggedInt"
;;                   "taggedFloat" "time"))

(setq cs164-keywords-regexp (concat (regexp-opt cs164-keywords 'words)
                                  "\\|\\$\\(i\\|-\\|\\$\\)\\|\\.\\."))
;; \<\(a\(?:\(?:ction\|ttribute\)s\)\|c\(?:hildren\|lass\)\|fold\|in\(?:put\|terface\)\|loop\|s\(?:chedule\|elf\)\|trait\|var\)\>\|\$\(i\|-\|\$\)
;;(setq cs164-type-regexp (concat (regexp-opt cs164-types 'words)
;;                              "\\|\\<\\([A-Z]\\w*\\)\\>"))
;; \<\(int\)\>\|\b\([A-Z]\w*\)\b
(setq cs164-keywords-variables "def\\s-+\\([a-zA-Z_][a-zA-Z_0-9]*\\)\\s-*")
;; ^\s-*\(\w\|.*\)\b\s-*:=

;;(setq cs164-comment "[:space:]*\\(//.*\\)$")


(setq cs164-keywords nil)
(setq cs164-types nil)

(setq cs164-font-lock-keywords
      `(
        ;; (,cs164-comment 1 font-lock-comment-face)
        ;; (,cs164-type-regexp . font-lock-type-face)
        (,cs164-keywords-regexp . font-lock-keyword-face)
        (,cs164-keywords-variables 1 font-lock-variable-name-face)
        ))


(define-derived-mode cs164-mode javascript-mode
  "cs164-mode"
  "Major mode to edit cs164"
  (setq font-lock-defaults '((cs164-font-lock-keywords)))
  (setq cs164-keywords-regexp nil)
  ;; (setq cs164-type-regexp nil)
  (setq cs164-keywords-variables nil)
                                        ; (setq c-basic-offset 4)
                                        ; (c-set-offset 'case-label '+)
  )

(add-to-list 'auto-mode-alist '("\\.164\\'" . cs164-mode))
(provide 'cs164-mode)
