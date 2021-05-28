(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-install 'polymode)
(package-install 'poly-markdown)
(package-install 'poly-R)
(package-install 'ess)
(package-install 'ess-site)
(package-install 'ess-view)
(package-install 'smartparens)
(package-install 'smartparens-config)
(package-install 'company)
