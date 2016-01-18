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
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     spacemacs-ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     smex
     clojure
     python
     ranger
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      lispy
                                      evil-surround
                                      evil-cleverparens
                                      isend-mode
                                      adjust-parens
                                      paxedit
                                      pdf-tools
                                      paredit ;este solo para no tener que configurar tanta cosa en la cider-repl
                                      simpleclip
                                      whitespace-cleanup-mode
                                      ;aggressive-indent -> parece integrado ya en las otras layers
                                      ;expand-region -> parece integrado ya en las otras layers
                                      ;evil-mc -> no funciona bien por ahora
   )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
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
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
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
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
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
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
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
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
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
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
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
  ;(define-key evil-insert-state-map (kbd "C-w")   nil)
  ;(define-key evil-insert-state-map (kbd "C-w C-w")   'ace-window)
  ;(global-set-key (kbd "C-w") nil)
  ;(global-set-key (kbd "C-w") 'other-window)
  ;(global-set-key (kbd "C-w C-w") 'other-window)
  ;(define-key clojure-mode-map (kbd "C-w") 'ace-window)
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

  ;; Para hacer wrap in org mode
  (add-hook 'text-mode-hook 'auto-fill-mode)

  ;; Puede haber interferencia entre ranger y dired, por ello ser recomienda el siguiente hook: https://github.com/syl20bnr/spacemacs/issues/3505
  ;; espero no tener el inconveniente evitando usar dired, y en vez de ello solo ranger
  ;; (add-hook 'dired-mode-hook 'deer)

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

    (with-eval-after-load 'smartparens
      (show-smartparens-global-mode -1))

    (add-hook 'clojure-mode-hook 'whitespace-cleanup-mode)

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
  (global-set-key (kbd "M-x") 'counsel-M-x)

  ;; Mostrar buffers que no han sido guardados, como lo hace helm
  (custom-set-faces
     '(ivy-modified-buffer ((t (:foreground "#ffa500")))))


)




;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
