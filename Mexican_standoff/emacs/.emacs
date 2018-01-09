; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    .emacs                                             :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: rlossy <marvin@42.fr>                      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/11/19 11:23:11 by rlossy            #+#    #+#              ;
;    Updated: 2017/11/19 14:55:04 by rlossy           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Load general features files
(setq config_files "/usr/share/emacs/site-lisp/")
(setq load-path (append (list nil config_files) load-path))

(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")

(autoload 'php-mode "php-mode" "Major mode for editing PHP code" t)
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

; Set default emacs configuration
(set-language-environment "UTF-8")
(setq-default font-lock-global-modes nil)
(setq-default line-number-mode nil)
(setq-default tab-width 4) 									;needed in custom
(setq-default indent-tabs-mode t)							;needed in custom
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)	;needed in custom
(setq-default c-basic-offset 4) 							;needed in custom
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
							  64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

; Load user configuration
(if (file-exists-p "~/.myemacs") (load-file "~/.myemacs"))



;*******************************************************************************;

; custom

;auto closed brackets

(defun ffr-insert-parentheses ()
  "insert parentheses and go between them"
  (interactive)
  (insert "()")
  (backward-char 1))

(defun ffr-insert-braces ()
  "insert curly braces and go between them"
  (interactive)
  (insert "{
}")
  (backward-char 2))

(add-hook 'c-mode-common-hook (lambda () (local-set-key "("  'ffr-insert-parentheses)))
(add-hook 'c-mode-common-hook (lambda () (local-set-key "{"  'ffr-insert-braces)))

; highlight wsp

(add-hook 'c-mode-common-hook (lambda() (setq show-trailing-whitespace t)))

; pos cursor

(setq column-number-mode t)
(setq line-number-mode t)

; backup files

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
  If the new path's directories does not exist, create them."
  (let* (
		 (backupRootDir "~/.emacs.d/")
		 (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove path in name, for example, “Users”
		 (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
		 )
	(make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
	backupFilePath
	)
  )

(setq make-backup-file-name-function 'my-backup-file-name)
(setq auto-save-default nil)
