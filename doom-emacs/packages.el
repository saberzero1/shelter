;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;; Download goto-chg
(unless (package-installed-p 'goto-chg)
  (package-install 'goto-chg))

;; Enable Evil
(require 'evil)
(evil-mode 1)
