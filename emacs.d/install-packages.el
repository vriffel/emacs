;;   emacs --script install-packages.el

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-install 'ess)
(package-install 'ess-smart-equals)
(package-install 'ess-smart-underscore)
(package-install 'ess-view)
(package-install 'company)
(package-install 'smartparens)
(package-install 'auctex)
(package-install 'color-theme-sanityinc-tomorrow)
(package-install 'smex)
(package-install 'imenu-list)
(package-install 'markdown-mode)
(package-install 'polymode)
(package-install 'poly-markdown)
(package-install 'poly-R)
(package-install 'yaml-mode)

)
