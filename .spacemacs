;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     clojure
     auto-completion
     html
     markdown
     org
     syntax-checking
     smex
     ranger
     evil-cleverparens
     python
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      lispy
                                      evil-surround
                                        ;evil-cleverparens (->> 
                                      isend-mode
                                      adjust-parens
                                      paxedit
                                      pdf-tools
                                      paredit ;este solo para no tener que configurar tanta cosa en la cider-repl
                                      simpleclip
                                      whitespace-cleanup-mode
                                      yesql-ghosts
                                      drag-stuff
                                        ;aggressive-indent -> parece integrado ya en las otras layers
                                        ;expand-region -> parece integrado ya en las otras layers
                                        ;evil-mc -> no funciona bien por ahora
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."


  ;; Nuevo para evitar CIDER inestable
  ;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
  ;(add-to-list 'package-pinned-packages '(clj-refactor . "melpa") t)

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         sanityinc-tomorrow-night
                         material
                         zenburn
                         monokai
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
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
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "inicial"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq evil-search-module 'evil-search)
  )

(defun dotspacemacs/user-config ()

  ;; para que poder usar historial en evil buffers
(setq-default evil-search-module 'evil-search)

  ;(spacemacs/toggle-evil-cleverparens-on)

  ;; buffer switching
                                        ;(define-key evil-normal-state-map "J" 'spacemacs/next-useful-buffer)
                                        ;(define-key evil-normal-state-map "K" 'spacemacs/previous-useful-buffer)
(define-key evil-normal-state-map (kbd "<C-next>") 'spacemacs/next-useful-buffer)
(define-key evil-normal-state-map (kbd "<C-prior>") 'spacemacs/previous-useful-buffer)

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
  ;; esc quits
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; hooks para emacs-lisp, para poder editar cómodamente .spacemacs
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

  ;; hooks para python

  ;(spacemacs/toggle-evil-cleverparens-on)
(add-hook 'python-mode-hook #'evil-cleverparens-mode)
(require 'paxedit)
(add-hook 'python-mode-hook 'paxedit-mode)
(add-hook 'python-mode-hook 'whitespace-cleanup-mode)

  ;; hooks para clojure
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  ;(require 'paxedit)
(add-hook 'clojure-mode-hook 'paxedit-mode)
(add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)
                                 (lispy-set-key-theme '(special evilcp c-digits)) ))
                                        ;(lispy-set-key-theme '(special paredit c-digits)) ))
                                        ;(lispy-set-key-theme '(special lispy c-digits)) ))
(add-hook 'clojure-mode-hook 'whitespace-cleanup-mode)
                                        ;(spacemacs/toggle-evil-cleverparens-on)
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)

(setq evil-move-beyond-eol t)
(require 'evil-cleverparens-text-objects)
(require 'evil-surround)
(global-evil-surround-mode 1)
(define-key evil-normal-state-map (kbd "C-f") 'avy-goto-char-2)
(global-set-key (kbd "C-f") 'avy-goto-char-2)
(evil-global-set-key 'normal (kbd "C-f") 'avy-goto-char-2)

  ;; it is needed to disable all the cathegory just for a simple change. But it seems like here is NOT needed to rebind all again
  ;(setq evil-cleverparens-use-additional-bindings nil)
  ;(define-key evil-insert-state-map (kbd "C-w")   nil)
  ;(define-key evil-insert-state-map (kbd "C-w C-w")   'ace-window)
  ;(global-set-key (kbd "C-w") nil)
  ;(global-set-key (kbd "C-w") 'other-window)
  ;(global-set-key (kbd "C-w C-w") 'other-window)
  ;(define-key clojure-mode-map (kbd "C-w") 'ace-window)

  ;; it is needed to disable all the cathegory just for a simple change, so we need to rebind all again
  ;(setq evil-cleverparens-use-additional-movement-keys nil)
(define-key evil-normal-state-map (kbd "L")   'evil-cp-forward-sexp)
(define-key evil-normal-state-map (kbd "H")   'evil-cp-backward-sexp)
(define-key evil-normal-state-map (kbd "M-l") 'evil-cp-end-of-defun)
(define-key evil-normal-state-map (kbd "M-h") 'evil-cp-beginning-of-defun)
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
       ;(define-key lispy-mode-map (kbd "]") 'lispy-braces)
       (define-key lispy-mode-map (kbd "[") 'lispy-brackets)
       ;(define-key lispy-mode-map (kbd "}") 'lispy-forward)
       (define-key lispy-mode-map (kbd "{") 'lispy-braces)
       ;(define-key lispy-mode-map (kbd "{") 'lispy-backward)
                                        ;(define-key lispy-mode-map (kbd "}") 'paxedit-backward-end)
                                        ;(define-key lispy-mode-map (kbd "{") 'paxedit-backward-up)
       ;(define-key lispy-mode-map (kbd "]") 'evil-cp-previous-opening)
       (define-key lispy-mode-map (kbd "]") 'evil-cp-previous-closing)
       (define-key lispy-mode-map (kbd "}") 'evil-cp-next-closing)


                                        ;consistencia con paredit y cleverparens
       (define-key lispy-mode-map (kbd "C-<") 'evil-cp-<)
       (define-key lispy-mode-map (kbd "C->") 'evil-cp->)


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



       ;; Por alguna razón me toca especificar lo de paxedit en ambas partes

       ;; Conflicto si se carga lispy con Python
       ;(define-key lispy-mode-map (kbd "C-m") 'paxedit-format-1)
       ;(define-key lispy-mode-map (kbd "C-M") 'paxedit-format-1)
       (define-key lispy-mode-map (kbd "C-k") 'lispy-move-up)
       (define-key lispy-mode-map (kbd "C-j") 'lispy-move-down)
       (define-key lispy-mode-map (kbd "M-k") 'paxedit-transpose-backward)
       (define-key lispy-mode-map (kbd "M-j") 'paxedit-transpose-forward)

       ))

;(global-set-key (kbd "C-m") 'paxedit-format-1)
;(global-set-key (kbd "C-M") 'paxedit-format-1)
;(global-set-key (kbd "C-k") 'lispy-move-up)
;(global-set-key (kbd "C-j") 'lispy-move-down)
;(global-set-key (kbd "M-k") 'paxedit-transpose-backward)
;(global-set-key (kbd "M-j") 'paxedit-transpose-forward)

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

                                        ;para abrir shell vertical
(setq split-width-threshold 0)
(setq split-height-threshold nil)

  ;; Para hacer wrap in org mode
(add-hook 'text-mode-hook 'auto-fill-mode)

  ;; Busqueda fácil por defecto no viene incluida - ya no es necesario desde spacemacs 105
                                        ;(evil-leader/set-key "/" 'spacemacs/helm-project-smart-do-search)
                                        ;(evil-leader/set-key "*" 'spacemacs/helm-project-smart-do-search-region-or-symbol)

                                        ;(evil-leader/set-key "yy" 'spacemacs/helm-project-smart-do-search-region-or-symbol)

  ;; Aprendí en .emacs.d/layers/+distribution/spacemacs...
  ;; https://github.com/syl20bnr/spacemacs/blob/master/doc/VIMUSERS.org
(spacemacs/set-leader-keys
    "SPC" 'avy-goto-char-2
                                        ;"q" 'avy-goto-line  ;; requiere hacks en spacemacs para que pueda funcionar, sabiendo que en realidad saltar a la línea no es algo que use con frecuencia, además que ya no uso helm-buffer, luego no necesito congruencia con q
    )

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
(setq cider-repl-display-help-banner nil) 
                                        ;(setq cljr-suppress-middleware-warnings t) ;no muestre WARNINGS de incompatibilidades, eso es imposible de solucinar entre CIDER y clj-refactor
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
      ;;(evil-leader/set-key-for-mode 'clojure-mode "e" 'cider-eval-last-sexp-to-repl)
      (evil-set-initial-state 'cider-repl-mode 'emacs)
                                        ;(define-key evil-normal-state-map (kbd "C-c e") 'cider-eval-last-sexp-to-repl)
                                        ;(define-key evil-insert-state-map (kbd "C-c e") 'cider-eval-last-sexp-to-repl)
      (define-key clojure-mode-map (kbd "C-c e") 'cider-eval-last-sexp-to-repl)
      ))
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(define-key cider-repl-mode-map (kbd "C-h") 'cider-switch-to-last-clojure-buffer)
                                        ;(define-key cider-repl-mode-map (kbd "C-w C-w") 'cider-switch-to-last-clojure-buffer)
(define-key cider-repl-mode-map (kbd "C-w C-w") 'evil-window-left)
                                        ;(define-key cider-repl-mode-map (kbd "C-w C-w") 'other-window)
(require 'neotree)
(define-key neotree-mode-map (kbd "C-w C-w") 'other-window)
(define-key neotree-mode-map (kbd "C-w m") 'spacemacs/toggle-maximize-buffer)
(define-key cider-repl-mode-map (kbd "C-w m") 'spacemacs/toggle-maximize-buffer)
(define-key evil-normal-state-map (kbd "C-w m") 'spacemacs/toggle-maximize-buffer)
(define-key clojure-mode-map (kbd "C-w m") 'spacemacs/toggle-maximize-buffer)
                                        ;(define-key evil-insert-state-map (kbd "C-w m") 'spacemacs/toggle-maximize-buffer)
(define-key cider-repl-mode-map (kbd "C-l") 'cider-repl-clear-buffer)

  ;; ace-window no es necesario porque en realidad SPC-w-w es suficientemente rápido
                                        ;(define-key clojure-mode-map (kbd "C-w") 'ace-window)
                                        ;(define-key global-map (kbd "C-w") 'ace-window)
                                        ;(global-set-key (kbd "M-p") 'ace-window)

                                        ; Para que no muestre ese feo match de paréntesis similar a como hace vim
(with-eval-after-load 'smartparens
    (show-smartparens-global-mode -1))

  ;; me ocurrió el undo-tree-canary problem, así que deshabilito undo-tree hasta
  ;; que evil solucione el issue, es crítico porque se pierde el historial en el momento
  ;; que uno graba, es decir mientras uno no grabe, todo bien con undo-tree
  ;; https://bitbucket.org/lyro/evil/issues/522/when-saving-the-buffer-change-list-got
  ;; (global-undo-tree-mode -1)
  ;; El problema ahora es que redo no funciona. Por ahora trataré de mitigar con magit mejor.
(require 'adjust-parens)
(add-hook 'clojure-mode-hook #'adjust-parens-mode)
(define-key clojure-mode-map (kbd "TAB") 'lisp-indent-adjust-paren)
                                        ;(local-set-key (kbd "TAB") 'lisp-indent-adjust-parens)
                                        ;(define-key evil-insert-state-map (kbd "TAB") 'lisp-indent-adjust-parens)

  ;; Ivy con smex, ver http://oremacs.com/2015/04/16/ivy-mode/
(setq smex-completion-method 'ivy)
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
                                        ;(global-set-key (kbd "M-x") 'counsel-M-x)

  ;; Mostrar buffers que no han sido guardados, como lo hace helm
(custom-set-faces
   '(ivy-modified-buffer ((t (:foreground "#ffa500")))))

  ;; Evitar crear múltiples buffers al abrir ranger
                                        ;When disabling the mode you can choose to kill the buffers that were opened while browsing the directories.
(setq ranger-cleanup-on-disable t)
                                        ;Or you can choose to kill the buffer just after you move to another entry in the dired buffer.
(setq ranger-cleanup-eagerly t)

  ;;Ranger has the ability to be used as the default directory handler when Emacs identifies a directory is opened. To make deer the default handler, set ranger-override-dired and restart.
(setq ranger-override-dired t)

  ;;You can choose to show previews literally, or through find-file, toggled by zi.
(setq ranger-show-literal nil)

                                        ;To set the max files size (in MB)
(setq ranger-max-preview-size 5)

  ;; Puede haber interferencia entre ranger y dired, por ello ser recomienda el siguiente hook: https://github.com/syl20bnr/spacemacs/issues/3505
  ;; espero no tener el inconveniente evitando usar dired, y en vez de ello solo ranger
  ;; por hora usare solo deer, pues nada que logro evitar todos esos buffers abiertos
  ;;(add-hook 'dired-mode-hook 'deer)

  ;; para continuar de modo continuo viendo pdf y no tener que hacer C-u
(setq doc-view-continuous t)

  ;; Recomendado en la guía de figwheel para M-x cider-jack-in-clojurescript
(require 'cider)
(defun cider-figwheel-repl ()
    (interactive)
    (save-some-buffers)
    (with-current-buffer (cider-current-repl-buffer)
      (goto-char (point-max))
      (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!) ; idempotent
             (figwheel-sidecar.repl-api/cljs-repl)")
      (cider-repl-return)))
(define-key clojure-mode-map (kbd "C-c M-j") 'cider-figwheel-repl)
(defun cider-figwheel-send-to-repl ()
    (interactive)
    (let ((s (buffer-substring-no-properties
              (nth 0 (cider-last-sexp 'bounds))
              (nth 1 (cider-last-sexp 'bounds)))))
      (with-current-buffer (cider-current-connection)
        (insert s)
        (cider-repl-return))))
(define-key clojure-mode-map (kbd "C-c E") 'cider-figwheel-send-to-repl)
                                        ;(global-set-key (kbd "C-c M-e") 'cider-figwheel-send-to-repl)

  ;; Bug of paste on open file with click (issues/5435)
(add-hook 'spacemacs-buffer-mode-hook (lambda ()
                                          (set
                                           (make-local-variable
                                            'mouse-1-click-follows-link)
                                           nil)))


  ;; IPython
                                        ;(require 'isend-mode)
                                        ;(add-hook 'isend-mode-hook 'isend-default-ipython-setup)
                                        ;(add-hook 'python-mode-hook #'isend-mode)
(require 'python)
(define-key inferior-python-mode-map (kbd "C-w C-w") 'evil-window-next)
(define-key python-mode-map (kbd "C-c C-z") 'python-start-or-switch-repl)

                                        ;(add-hook 'python-mode-hook (lambda ()
                                        ;                              ;(python-shell-switch-to-shell)
                                        ;                              ;(python-start-or-switch-repl)
                                        ;                              (live-py-mode)
                                        ;                              ))
                                        ;(define-key python-mode-map (kbd "C-w C-w") (lambda () (evil-window-next 2)))
                                        ;(define-key python-mode-map (kbd "C-w C-w") (lambda () (next-window)))
                                        ;(define-key python-mode-map (kbd "C-w C-w") 'next-window)
(defun send-python-line ()
    (interactive)
    (save-excursion
      (setq the_script_buffer (format (buffer-name)))
      (end-of-line)
      (kill-region (point) (progn (back-to-indentation) (point)))
      (if (get-buffer  "*Python*")
          (message "")
                                        ;(do
        (message "No Python buffer")
                                        ;(python-start-or-switch-repl))
        )
      ;; (setq the_py_buffer (format "*Python[%s]*" (buffer-file-name)))
      (setq the_py_buffer "*Python*")
      (switch-to-buffer-other-window  the_py_buffer)
      (goto-char (buffer-end 1))
      (yank)
      (comint-send-input)
      (switch-to-buffer-other-window the_script_buffer)
      (yank))
    (end-of-line)
    )
(defun send-python-line-next-line ()
    (send-python-line)
    (next-line)
    )

;; Nada de lo siguiente tuvo prioridad sobre evil-define-key:

;; (with-eval-after-load 'python
;;   (define-key python-mode-map (kbd "C-k") 'evil-cp-drag-forward)
;;   (define-key python-mode-map (kbd "C-j") 'evil-cp-drag-backward)
;;   (define-key python-mode-map (kbd "M-k") 'evil-cp-drag-forward)
;;   (define-key python-mode-map (kbd "M-j") 'evil-cp-drag-backward)
;;   (require 'evil-cleverparens)
;;   (define-key evil-cleverparens-mode-map (kbd "C-k") 'evil-cp-drag-forward)
;;   (define-key evil-cleverparens-mode-map (kbd "C-j") 'evil-cp-drag-backward)
;;   (define-key evil-cleverparens-mode-map (kbd "M-k") 'evil-cp-drag-forward)
;;   (define-key evil-cleverparens-mode-map (kbd "M-j") 'evil-cp-drag-backward)
;;   )

;; Las versiones de Paxedit son más inteligentes que evil-cp-drag-forward y evil-cp-drag-backward, pero no funciona bien con Python
;; evil-cp-drag-forward y evil-cp-drag-backward funcionan de modo aceptable en Lisp, pero en Python tienen corner cases malucos
;; por eso mejor drag-stuff + emacs builtin transpose (M-t)
(require 'drag-stuff)
(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(add-hook 'python-mode-hook
            (lambda ()
              (define-key python-mode-map (kbd "C-<return>") 'send-python-line-next-line)
              (define-key python-mode-map (kbd "C-c C-e") 'send-python-line)
              (define-key python-mode-map (kbd "C-c e") 'send-python-line)
              (define-key python-mode-map (kbd "C-c C-n") 'send-python-line)
              (define-key python-mode-map (kbd "C-c n") 'send-python-line)

              ;(define-key python-mode-map (kbd "M-j") 'drag-stuff-down)
              ;(define-key python-mode-map (kbd "M-k") 'drag-stuff-up)
                                        ;(define-key python-mode-map "\C-cn" 'send-python-line-next-line)
              ))

  ;;No funciona (define-key evil-normal-state-map (kbd "x") 'evil-delete-char)
  ;;change because latin keyboard, and fix for x command bug
(evil-define-key 'normal evil-cleverparens-mode-map
    "{" 'evil-cp-previous-opening
    "}" 'evil-cp-next-closing
    "[" 'evil-cp-next-opening
    "]" 'evil-cp-previous-closing
    ;(kbd "M-[") 'evil-cp-wrap-next-square
    ;(kbd "M-{") 'evil-cp-wrap-next-curly
    ;(kbd "M-}") 'evil-cp-wrap-previous-curly
    ;(kbd "M-]") 'evil-cp-wrap-previous-square
    "x" 'evil-delete-char
    )

(evil-define-key 'visual evil-cleverparens-mode-map
  "x" 'evil-delete-char
  "d" 'evil-delete
  )

;; Lo que es común a Python y Clojure en Paxedit normal mode
(evil-define-key 'normal evil-cleverparens-mode-map
                 (kbd "C-o")   'paxedit-compress
                 (kbd "C-O")   'paxedit-compress

                 (kbd "M-<up>") 'paxedit-backward-up
                 (kbd "M-<down>") 'paxedit-backward-end

                 (kbd "M-b") 'paxedit-previous-symbol
                 (kbd "M-w") 'paxedit-next-symbol
                 (kbd "M-Y") 'paxedit-copy
                 (kbd "M-r") 'paxedit-sexp-raise
                 (kbd "M-u") 'paxedit-symbol-change-case
                 (kbd "M-y") 'paxedit-symbol-copy
                 (kbd "M-d") 'paxedit-kill
                 (kbd "M-c") 'paxedit-wrap-comment

                 (kbd "M-r") 'paxedit-sexp-raise

                 (kbd "M-o") 'lispy-string-oneline
                 (kbd "M-(") 'evil-cp-wrap-next-round
                 (kbd "M-p") 'lispy-clone
                 (kbd "M-\"") 'paredit-meta-doublequote

                 )

;; Lo que es común a Python y Clojure en Paxedit insert mode
(evil-define-key 'insert evil-cleverparens-mode-map
  (kbd "C-o")   'paxedit-compress
  (kbd "C-O")   'paxedit-compress

  (kbd "M-<up>") 'paxedit-backward-up
  (kbd "M-<down>") 'paxedit-backward-end

  (kbd "M-b") 'paxedit-previous-symbol
  (kbd "M-w") 'paxedit-next-symbol
  (kbd "M-Y") 'paxedit-copy
  (kbd "M-r") 'paxedit-sexp-raise
  (kbd "M-u") 'paxedit-symbol-change-case
  (kbd "M-y") 'paxedit-symbol-copy
  (kbd "M-d") 'paxedit-kill
  (kbd "M-c") 'paxedit-wrap-comment

  (kbd "M-r") 'paxedit-sexp-raise

  (kbd "M-o") 'lispy-string-oneline
  (kbd "M-(") 'evil-cp-wrap-next-round
  (kbd "M-p") 'lispy-clone
  (kbd "M-\"") 'paredit-meta-doublequote
  )


                                        ;(define-key lispy-mode-map (kbd "C-m") 'paxedit-format-1)
                                        ;(define-key lispy-mode-map (kbd "C-M") 'paxedit-format-1)
                                        ;(define-key lispy-mode-map (kbd "C-k") 'lispy-move-up)
                                        ;(define-key lispy-mode-map (kbd "C-j") 'lispy-move-down)
                                        ;(define-key lispy-mode-map (kbd "M-k") 'paxedit-transpose-backward)
                                        ;(define-key lispy-mode-map (kbd "M-j") 'paxedit-transpose-forward)

(evil-define-key 'normal lispy-mode-map
  ;(kbd "C-m") 'paxedit-format-1
  ;(kbd "C-M") 'paxedit-format-1
  (kbd "M-k") 'paxedit-transpose-backward
  (kbd "M-j") 'paxedit-transpose-forward
  (kbd "C-k") 'lispy-move-up
  (kbd "C-j") 'lispy-move-down
  )

(evil-define-key 'insert lispy-mode-map
  ;(kbd "C-m") 'paxedit-format-1
  ;(kbd "C-M") 'paxedit-format-1
  (kbd "M-k") 'paxedit-transpose-backward
  (kbd "M-j") 'paxedit-transpose-forward
  (kbd "C-k") 'lispy-move-up
  (kbd "C-j") 'lispy-move-down
  )

;; Misteriosamente, con python-mode-map no funcionaba pero con evil-cleverparens-mode-map sí y no afectaba a Clojure
(evil-define-key 'normal evil-cleverparens-mode-map
  (kbd "M-k") 'drag-stuff-up
  (kbd "M-j") 'drag-stuff-down
  (kbd "C-k") 'drag-stuff-up
  (kbd "C-j") 'drag-stuff-down
  )

(evil-define-key 'insert evil-cleverparens-mode-map
  (kbd "M-k") 'drag-stuff-up
  (kbd "M-j") 'drag-stuff-down
  (kbd "C-k") 'drag-stuff-up
  (kbd "C-j") 'drag-stuff-down
  )

)


  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (drag-stuff sql-indent clj-refactor pug-mode hide-comnt yesql-ghosts yapfify whitespace-cleanup-mode web-mode tagedit smeargle slim-mode simpleclip scss-mode sass-mode ranger pyvenv pytest pyenv-mode py-isort pip-requirements pdf-tools tablist paxedit orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode lispy zoutline less-css-mode jade-mode isend-mode hy-mode htmlize haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor evil-cleverparens emmet-mode cython-mode company-web web-completion-data company-statistics company-anaconda company clojure-snippets inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode auto-yasnippet yasnippet anaconda-mode pythonic adjust-parens ac-ispell auto-complete ws-butler window-numbering which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash async aggressive-indent adaptive-wrap ace-window ace-link avy quelpa package-build spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-modified-buffer ((t (:foreground "#ffa500")))))
