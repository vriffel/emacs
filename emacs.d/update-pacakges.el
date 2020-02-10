(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(package-list-packages)
(package-refresh-contents)

(package-menu-mark-upgrades)
(package-menu-execute)
