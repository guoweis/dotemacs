;;; init.el --- My Emacs configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Mathieu Marques

;; Author: Mathieu Marques <mathieumarques78@gmail.com>
;; Created: October 16, 2014
;; Homepage: https://github.com/angrybacon/dotemacs
;; Keywords: abbrev, convenience, faces, maint, outlines, vc

;; This program is free software. You can redistribute it and/or modify it under
;; the terms of the Do What The Fuck You Want To Public License, version 2 as
;; published by Sam Hocevar.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.
;;
;; You should have received a copy of the Do What The Fuck You Want To Public
;; License along with this program. If not, see http://www.wtfpl.net/.

;;; Commentary:

;; Following lines load an Org file and build the configuration code out of it.

;;; Code:

(let ((default-directory user-emacs-directory)
      (file-name-handler-alist nil)
      (gc-cons-percentage .6)
      (gc-cons-threshold most-positive-fixnum)
      (read-process-output-max (* 1024 1024)))

  ;; Disable that pesky echo message
  (setq-default inhibit-startup-echo-area-message (user-login-name))

  ;; Set repositories
  (require 'package)
  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)

  ;; Install `use-package' dependency by hand
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package t))
  (setq-default
   package-native-compile t
   use-package-always-defer t
   use-package-always-ensure t)

  ;; Tangle configuration
  (org-babel-load-file (expand-file-name "dotemacs.org" user-emacs-directory) t)
  (garbage-collect))

;; Reset the working directory regardless of where Emacs was started
(cd "~/")

;;; init.el ends here
