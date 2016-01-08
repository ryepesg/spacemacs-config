;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     clojure
     python
     ranger
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      lispy
                                      evil-surround
                                      evil-cleverparens
                                      ;aggressive-indent
                                      ;expand-region
                                      isend-mode
                                      adjust-parens
                                      paxedit
                                      pdf-tools
                                      ;flx-ido
                                      ;helm-fuzzier
                                      ;evil-mc
                                      paredit ;este solo para no tener que configurar tanta cosa en la cider-repl
                                      simpleclip
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t)
  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; Nuevo para evitar CIDER inestable
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
  (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
  (add-to-list 'package-pinned-packages '(cljr-helm . "melpa-stable") t)
  ;(add-to-list 'package-pinned-packages '(clj-refactor . "melpa") t)

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(;material
                         sanityinc-tomorrow-night
                         zenburn
                         monokai
                         ;; ample-flat
                         ;; ample
                         ;; spacemacs-dark
                         ;; solarized-dark
                         ;; leuven
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;;"Source Code Pro"
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil)
  )


(defun dotspacemacs/user-init ()
  (spacemacs|use-package-add-hook evil
    :post-config
    (progn
      ;; restore universal argument
      (define-key global-map (kbd "C-u") 'universal-argument)
      (define-key evil-normal-state-map (kbd "C-u") 'universal-argument)
      (define-key evil-motion-state-map (kbd "C-u") 'universal-argument)
      (define-key evil-insert-state-map (kbd "C-u") 'universal-argument)
      (define-key evil-evilified-state-map (kbd "C-u") 'universal-argument)
      (define-key evil-emacs-state-map (kbd "C-u") 'universal-argument)

      ;; buffer switching
      ;(define-key evil-normal-state-map "J" 'spacemacs/next-useful-buffer)
      ;(define-key evil-normal-state-map "K" 'spacemacs/previous-useful-buffer)
      (define-key evil-normal-state-map (kbd "<C-next>") 'spacemacs/next-useful-buffer)
      (define-key evil-normal-state-map (kbd "<C-prior>") 'spacemacs/previous-useful-buffer)

      ;; iedit-mode
      (define-key global-map (kbd "C-;") 'iedit-mode)
      (define-key evil-normal-state-map (kbd "C-;") 'iedit-mode)
      (define-key evil-insert-state-map (kbd "C-;") 'iedit-mode)

      ;; user reserved key-bindings
      (evil-leader/set-key "od" 'dired-jump)
      (evil-leader/set-key "or" 'popwin-pop-repl)
      (evil-leader/set-key "ov" 'set-variable)))

  (spacemacs|use-package-add-hook evil-escape
    :post-config
    (progn
      ;; supress evil escape when lispy mode active
      (push (lambda () (bound-and-true-p lispy-mode))
            evil-escape-inhibit-functions)))

  (spacemacs|use-package-add-hook evil-snipe
    :post-init
    (progn
      (setq evil-snipe-enable-alternate-f-and-t-behaviors t)))
  )


(defun dotspacemacs/user-config ()
  ;(global-set-key (kbd "C-S-v") 'yank)
  ;(global-set-key (kbd "C-S-c") 'kill-ring-save)

  ;; La solución estándar para separar el kill ring del clipboard del sistema operativo no funciona con Evil
  ;(setq save-interprogram-paste-before-kill t)
  ;; Por ello se requiere simpleclip
  (require 'simpleclip)
  (simpleclip-mode 1)
  (global-set-key (kbd "C-S-v") 'simpleclip-paste)
  (global-set-key (kbd "C-S-c") 'simpleclip-copy)
  ;(setq x-select-enable-clipboard t) ;pegar con clic de la mitad
  ;(setq x-select-enable-primary t)

  ;Un problema con evil que hizo regresar a un usuario a Vim, explicado en stackoverflow, no lo entiendo bien
  (fset 'evil-visual-update-x-selection 'ignore)

  ;;; esc quits
  ;(define-key evil-normal-state-map [escape] 'keyboard-quit)
  ;(define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

  (require 'paxedit)
  (add-hook 'clojure-mode-hook 'paxedit-mode)

  (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)
    (lispy-set-key-theme '(special evilcp c-digits)) ))
    ;(lispy-set-key-theme '(special paredit c-digits)) ))
    ;(lispy-set-key-theme '(special lispy c-digits)) ))

  (setq evil-move-beyond-eol t)
  (require 'evil-cleverparens-text-objects)
  (require 'evil-surround)
  (global-evil-surround-mode 1)

  (define-key evil-normal-state-map (kbd "C-f") 'avy-goto-char-2)
  (global-set-key (kbd "C-f") 'avy-goto-char-2)
  (evil-global-set-key 'normal (kbd "C-f") 'avy-goto-char-2)

  ;; it is needed to disable all the cathegory just for a simple change. But it seems like here is NOT needed to rebind all again
  (setq evil-cleverparens-use-additional-bindings nil)
  (define-key evil-normal-state-map (kbd "M-[")   'evil-cp-wrap-next-square)
  (define-key evil-normal-state-map (kbd "M-]")   'evil-cp-wrap-next-curly)
  (define-key evil-normal-state-map (kbd "M-{")   nil)
  (define-key evil-normal-state-map (kbd "M-}")   nil)
  ;;(define-key evil-normal-state-map (kbd "C-o")   'paxedit-compress)
  ;;(define-key evil-normal-state-map (kbd "C-O")   'paxedit-compress)
  ;;(define-key evil-normal-state-map (kbd "C-m")   'paxedit-format-1)
  ;;(define-key evil-normal-state-map (kbd "C-M")   'paxedit-format-1)

  ;; it is needed to disable all the cathegory just for a simple change, so we need to rebind all again
  (setq evil-cleverparens-use-additional-movement-keys nil)
  (define-key evil-normal-state-map (kbd "L")   'evil-cp-forward-sexp)
  (define-key evil-normal-state-map (kbd "H")   'evil-cp-backward-sexp)
  (define-key evil-normal-state-map (kbd "M-l") 'evil-cp-end-of-defun)
  (define-key evil-normal-state-map (kbd "M-h") 'evil-cp-beginning-of-defun)
  (define-key evil-normal-state-map (kbd "{")   'evil-cp-previous-opening)  ;change because latin keyboard
  (define-key evil-normal-state-map (kbd "}")   'evil-cp-next-closing)      ;change because latin keyboard
  ;(define-key evil-normal-state-map (kbd "[")   'evil-cp-next-opening)     ;not used for simplicity (in lispy [ produces [)
  ;(define-key evil-normal-state-map (kbd "]")   'evil-cp-previous-closing) ;not used for simplicity (in lispy ] produces {)
  (define-key evil-normal-state-map (kbd "(")   'evil-cp-backward-up-sexp)
  ;(define-key evil-normal-state-map (kbd ")")   'evil-cp-up-sexp)
  (define-key evil-normal-state-map (kbd ")")   'lispy-right-nostring)

  ;;; No logré hacer que en el visual normal se haga wrap, toca es en modo insert seleccionar con Shift-arrows
  ;(define-key evil-visual-state-map (kbd "\"")   'lispy-doublequote)
  ;(define-key evil-visual-state-map (kbd "[")   'lispy-braces)
  ;(define-key evil-visual-state-map (kbd "]")   'lispy-braces)

  (eval-after-load "lispy"
  `(progn
  ;(use-package lispy
  ;  :ensure t
  ;  :init
  ;  (progn
     ;; replace a global binding with own function
     ;agilidad en teclado latino
     (define-key lispy-mode-map (kbd "]") 'lispy-braces)
     (define-key lispy-mode-map (kbd "[") 'lispy-brackets)
     (define-key lispy-mode-map (kbd "}") 'lispy-forward)
     (define-key lispy-mode-map (kbd "{") 'lispy-backward)
     ;(define-key lispy-mode-map (kbd "}") 'paxedit-backward-end)
     ;(define-key lispy-mode-map (kbd "{") 'paxedit-backward-up)

     ;consistencia con paredit y cleverparens
     (define-key lispy-mode-map (kbd "<") 'evil-cp-<)
     (define-key lispy-mode-map (kbd ">") 'evil-cp->)


     (lispy-define-key lispy-mode-map (kbd "y") 'lispy-new-copy)   ;antes n, consistencia con vim
     (lispy-define-key lispy-mode-map (kbd "f") 'lispy-ace-paren)  ;antes q, consistencia con vimium
     (lispy-define-key lispy-mode-map (kbd "F") 'lispy-ace-symbol)  ;antes a, consistencia con vimium
     ;; Ahora que veo que C-q será usado en helm buffer, mejor estandarizar con Lispy
     ;; Aprovechar el yank de significado inverso que ya quedó libre, tiene sentido porque n/N es usado para encontrar siguiente y anterior
     (lispy-define-key lispy-mode-map (kbd "n") 'lispy-flow)		 ;antes f
     (lispy-define-key lispy-mode-map (kbd "N") 'lispy-flow)		 ;antes f, duplicado porque S-n es más natural como en búsqueda con vim

     ;; Esto no está funcionando
     ;(define-key lispy-mode-map (kbd "<M-return>") nil) ;alt+enter es importante para cider y cljr-refactor
     ;(define-key lispy-mode-map (kbd "M-RET") nil) ;alt+enter es importante para cider y cljr-refactor
     ;(lispy-define-key lispy-mode-map (kbd "M-RET") nil)

    ;(define-key lispy-mode-map (kbd "M-r") 'lispy-raise-sexp)
    ;(define-key lispy-mode-map (kbd "M-r") 'paxedit-sexp-raise)
    ;(lispy-define-key lispy-mode-map (kbd "M-r") 'paxedit-sexp-raise)


    ;;; Modificación asumiendo (lispy-set-key-theme '(special paredit c-digits)))), modificado con lo mejor lispy-map
    ;(define-key lispy-mode-map (kbd "M-)") 'lispy-close-round-and-newline)
    ;(define-key lispy-mode-map (kbd "]") 'lispy-forward)
    ;(define-key lispy-mode-map (kbd "[") 'lispy-backward)
    (define-key lispy-mode-map (kbd ")") 'lispy-right-nostring)
    (define-key lispy-mode-map (kbd "M-s") 'lispy-splice)
    ;(define-key lispy-mode-map (kbd "M-<up>") 'lispy-splice-sexp-killing-backward)
    ;(define-key lispy-mode-map (kbd "M-<down>") 'lispy-splice-sexp-killing-backward)

    (define-key lispy-mode-map (kbd "M-?") 'lispy-convolute-sexp)
    (define-key lispy-mode-map (kbd "M-S") 'lispy-split)
    (define-key lispy-mode-map (kbd "M-J") 'lispy-join)
    (define-key lispy-mode-map (kbd "<C-return>") 'lispy-open-line)
    ;(define-key lispy-mode-map (kbd "<M-return>") 'lispy-meta-return)
    ;(define-key lispy-mode-map (kbd "M-o") 'lispy-string-oneline)


    (define-key lispy-mode-map (kbd "{") 'evil-cp-previous-opening)
    (define-key lispy-mode-map (kbd "}") 'evil-cp-next-closing)

    ;; Por alguna razón me toca especificar lo de paxedit en ambas partes
    (define-key lispy-mode-map (kbd "M-b") 'paxedit-previous-symbol)
    (define-key lispy-mode-map (kbd "M-w") 'paxedit-next-symbol)
    (define-key lispy-mode-map (kbd "M-Y") 'paxedit-copy)
    (define-key lispy-mode-map (kbd "M-r") 'paxedit-sexp-raise)
    (define-key lispy-mode-map (kbd "M-u") 'paxedit-symbol-change-case)
    (define-key lispy-mode-map (kbd "M-y") 'paxedit-symbol-copy)
    (define-key lispy-mode-map (kbd "M-d") 'paxedit-kill)
    (define-key lispy-mode-map (kbd "M-c") 'paxedit-wrap-comment)
    (define-key lispy-mode-map (kbd "M-(") 'lispy-wrap-round)
    (define-key lispy-mode-map (kbd "M-<down>") 'paxedit-transpose-forward)
    (define-key lispy-mode-map (kbd "M-<up>") 'paxedit-transpose-backward)
    (define-key lispy-mode-map (kbd "M-<left>") 'paxedit-backward-up)
    (define-key lispy-mode-map (kbd "M-<right>") 'paxedit-backward-end)
	))

  ;; Paxedit
  (global-set-key (kbd "M-<down>") 'paxedit-transpose-forward)
  (global-set-key (kbd "M-<up>") 'paxedit-transpose-backward)
  (global-set-key (kbd "M-<left>") 'paxedit-backward-up)
  (global-set-key (kbd "M-<right>") 'paxedit-backward-end)
  (global-set-key (kbd "M-b") 'paxedit-previous-symbol)
  (global-set-key (kbd "M-w") 'paxedit-next-symbol)
  (global-set-key (kbd "M-Y") 'paxedit-copy)
  (global-set-key (kbd "M-r") 'paxedit-sexp-raise)
  (global-set-key (kbd "M-u") 'paxedit-symbol-change-case)
  (global-set-key (kbd "M-y") 'paxedit-symbol-copy)
  (global-set-key (kbd "M-d") 'paxedit-kill)
  (global-set-key (kbd "M-c") 'paxedit-wrap-comment)

	;No logré hacer funcionar paxedit-sexp-raise con lispy, la única forma fue cambiando el archivo:
  ;(global-unset-key (kbd "M-r"))
  ;(global-set-key (kbd "M-r") 'paxedit-sexp-raise)
	;.emacs.d/elpa/lispy-20151226.1024/lispy.el
	;(define-key map (kbd "M-r") 'paxedit-sexp-raise)

  (global-set-key (kbd "M-o") 'lispy-string-oneline)
  (global-set-key (kbd "M-(") 'evil-cp-wrap-next-round)
  (global-set-key (kbd "M-]") 'evil-cp-wrap-next-curly)
  (global-set-key (kbd "M-[") 'evil-cp-wrap-next-square)
  (global-set-key (kbd "M-k") 'lispy-move-up)
  (global-set-key (kbd "M-j") 'lispy-move-down)
  ;(global-set-key (kbd "M-w") (lambda () (evil-cp-evil-copy-paste-form 1)))
  ;(global-set-key (kbd "M-w") 'lispy-clone)
  (global-set-key (kbd "M-p") 'lispy-clone)
  (global-set-key (kbd "M-\"") 'paredit-meta-doublequote)

  ;; Go to definition, CIDER
  (global-set-key (kbd "S-RET") 'cider-find-dwim)
  (global-set-key (kbd "S-<return>") 'cider-find-dwim)
  (global-set-key (kbd "C-S-RET") 'cider-find-dwim-other-window)
  (global-set-key (kbd "C-S-<return>") 'cider-find-dwim-other-window)

  ;; Imagenes
  ;(global-set-key (kbd "C-d") 'lispy-delete)
  ;(define-key lispy-mode-map (kbd "C-d") 'lispy-delete)
	;(setq org-download-image-dir "~/docs/img/")
	;(setq-default org-download-method 'directory)
	;(setq-default org-download-image-dir "~/docs/img")
	(setq org-toggle-inline-images t)
	(global-visual-line-mode t)

  ;; IPython
  (require 'isend-mode)
  (add-hook 'isend-mode-hook 'isend-default-ipython-setup)
  (add-hook 'python-mode-hook #'isend-mode)

  (require 'adjust-parens)
  (add-hook 'clojure-mode-hook #'adjust-parens-mode)
  (local-set-key (kbd "TAB") 'lisp-indent-adjust-parens)

  ;; Para hacer wrap in org mode
  (add-hook 'text-mode-hook 'auto-fill-mode)
  ;; Es mejor deer que dired
  (add-hook 'dired-mode-hook 'deer)

  ;; Busqueda fácil por defecto no viene incluida - ya no es necesario desde spacemacs 105
  ;(evil-leader/set-key "/" 'spacemacs/helm-project-smart-do-search)
  ;(evil-leader/set-key "*" 'spacemacs/helm-project-smart-do-search-region-or-symbol)

  ;(evil-leader/set-key "yy" 'spacemacs/helm-project-smart-do-search-region-or-symbol)

  ;; Aprendí en .emacs.d/layers/+distribution/spacemacs...
  ;; https://github.com/syl20bnr/spacemacs/blob/master/doc/VIMUSERS.org
  (spacemacs/set-leader-keys
    "SPC" 'avy-goto-char-2
    "q" 'avy-goto-line)

  ;; No se por qué no me funciona con dos letras, pero igual no es prioritario
    ;(spacemacs/set-leader-keys
    ;  "ys" 'spacemacs/save-buffers-kill-emacs
    ;  "yq" 'spacemacs/prompt-kill-emacs
    ;  "yQ" 'spacemacs/kill-emacs
    ;  "yd" 'spacemacs/frame-killer)

  ;; Multiple cursors no reconoce comandos de evil-celverparens
  ;(require 'evil-mc)
  ;(global-evil-mc-mode 1)

  ;(require 'clj-refactor)
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    ;(cljr-add-keybindings-with-prefix "C-c C-m")
    (cljr-add-keybindings-with-prefix "M-<return>")
    )
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
  (global-set-key (kbd "M-<return>") nil)

  ;; Antes pensaba en que sería deseable que la repl estuviera en modo insert, pero es realmente un complique
  ;; mejor simplemente no usar la REPL y evaual todo desde el archivo con C-c C-c o C-c C-e
  ;(add-hook 'cider-repl-mode 'evil-insert-state)
  (use-package clojure-mode :ensure t)
  (use-package cider
    :ensure t
    :init
    (progn
      ;(add-hook 'cider-repl-mode-hook #'paredit-mode)
      ;(define-key cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)
      ;(define-key cider-repl-mode-map (kbd "C-w") 'cider-switch-to-last-clojure-buffer)
      (evil-set-initial-state 'cider-repl-mode 'emacs)
      (define-key evil-normal-state-map (kbd "C-c e") 'cider-eval-last-sexp-to-repl)
      (define-key evil-insert-state-map (kbd "C-c e") 'cider-eval-last-sexp-to-repl)
      ;;(evil-leader/set-key-for-mode 'clojure-mode "e" 'cider-eval-last-sexp-to-repl)
     ))
    (add-hook 'cider-repl-mode-hook #'paredit-mode)
    (define-key cider-repl-mode-map (kbd "C-h") 'cider-switch-to-last-clojure-buffer)
    (define-key cider-repl-mode-map (kbd "C-w C-w") 'cider-switch-to-last-clojure-buffer)
    (define-key cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)

    ;; ace-window no es necesario porque en realidad SPC-w-w es suficientemente rápido
    ;(define-key clojure-mode-map (kbd "C-w") 'ace-window)
    ;(define-key global-map (kbd "C-w") 'ace-window)
    ;(global-set-key (kbd "M-p") 'ace-window)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
