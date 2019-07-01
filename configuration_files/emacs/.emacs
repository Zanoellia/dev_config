;;; Global config
(add-to-list 'load-path "$HOME/.emacs.d/modes")

;;; Load modes
(setq custom-modes "$HOME/.emacs.d/modes.el")
(load custom-modes)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Inhiber l'affichage de l'écran d'accueil au lancement d'Emacs.
(setq inhibit-startup-screen 1)
(setq inhibit-startup-message t)
;; Pas de message initial dans le tampon *scratch*
(setq initial-scratch-message "")

;; Il est fastidieux de taper « yes » pour confirmer une action, « y » suffit
;; amplement (idem pour « no », désormais « n »)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Faire apparaître la position du curseur dans la ligne modale
(setq column-number-mode 1)
(setq line-number-mode 1)

;; Les modes historiquement choisis par Emacs lorsqu'on ouvre un fichier ne
;; sont pas toujours les plus satisfaisant. Corrigeons cela...
(defalias 'xml-mode 'nxml-mode)
(defalias 'perl-mode 'cperl-mode)

;; Formatage du texte sur 79 colonnes dans tous les modes
(setq-default fill-column 79)

;; Activation globale du mode mettant en exergue des « caractères blancs »
(global-whitespace-mode 1)

;; Choix des éléments mis en exergue :
;; - space      => montrer les espaces (KO car gestion intégrée d'Emacs)
;; - tabs       => montrer les tabulations
;; - trailing   => montrer les espaces superflus en fin de ligne
;; - lines-tail => montrer les lignes trop longues (excédent seulement)
;;
;; On peut en outre déclencher un nettoyage du tampon via la commande
;; « M-x whitespace-cleanup ». Cette commande lancera les actions annoncées
;; dans whitespace-style :
;; - empty            => suppression des lignes vides en début et fin de
;;                       tampon
;; - indentation      => substitution des tabulations de début de ligne par
;;                       des espaces
;; - space-before-tab => substitution des tabulations précédant des espaces
;;                       par des espaces
;; - space-after-tab  => substitution des tabulations suivant des espaces par
;;                       des espaces
;; - trailing         => suppression des espaces et tabulations superflus en
;;                       fin de ligne
;;
;; Le mode whitespace interfère avec la visualisation des espaces insécables
;; intégrée à Emacs (variable nobreak-char-display) et je n'ai pas réussi
;; à imposer à Emacs le paramétrage que j'avais défini au sein du mode
;; whitespace (si une âme charitable a la solution, j'en suis preneur). J'ai
;; donc fini par altérer le paramètre « nobreak-space » qui, dans le mode
;; intégré à Emacs, détermine l'affichage des espaces insécables. Pour ce
;; faire, j'ai eu recours à « custom-set-faces » et pour éviter un double
;; appel de cette fonction (fortement déconseillé), j'ai déporté l'instruction
;; dans le fichier ~/.emacs.d/custom.el. Le voici pour mémoire :
;;
(custom-set-faces
 '(nobreak-space
   (;; Paramétrage si fond foncé et grand nombre de couleurs disponible
    (((class color) (min-colors 88) (background dark))
     (:background "#483838"       :foreground "black" :underline nil))
    ;; Paramétrage si fond clair et grand nombre de couleurs disponible
    (((class color) (min-colors 88) (background light))
     (:background "LemonChiffon3" :foreground "cornsilk4" :underline nil))
    ;; Paramétrage dans les autres cas de figure
    (t (:inverse-video t)))))
(setq whitespace-style '(space tabs lines-tail trailing
                         empty indentation space-before-tab space-after-tab)
)

;; Nombre de colonnes au delà duquel on considère qu'une ligne est trop longue
(setq whitespace-line-column 79)

;; Lors de la mise en exergue d'une correspondance de parenthèses, surligner
;; seulement les parenthèses (remplacer « parenthesis » par « expression »
;; pour que toute l'expression soit surlignée).
(setq show-paren-style 'parenthesis)

;; Lorsqu'un tampon vide est créé ou lorsqu'Emacs ne parvient pas à identifier
;; le mode adéquat, il bascule dans le mode « lisp-interaction-mode ». Ce
;; choix n'est pas pertinent (pour moi du moins) et je préfère qu'il opte dans
;; ce cas pour le mode texte.
;; Ceci vaut au lancement d'Emacs ...
(setq initial-major-mode 'text-mode)
;; ... et lorsqu'il crée un tampon ou ouvre un fichier de type non reconnu
(setq default-major-mode 'text-mode)

;; UTF-8
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_GB.UTF-8")
(prefer-coding-system 'utf-8)
(setq ruby-insert-encoding-magic-comment nil)

;http://sebastien.dinot.free.fr/dotemacs-23.html
;; Mode activant l'affichage des numéros de ligne dans la marge gauche de la
;; fenêtre
(require 'linum)

;; Lorsqu'on ouvre deux fichiers de même nom « fic », Emacs nomme les tampons
;; « fic » et « fic<2> », ce qui ne facilite pas leur identification. Le mode
;; uniquify permet de les distinguer via leur répertoire respectif.
(require 'uniquify)
;; Configuration du mode Uniquify : on affiche la chaîne distinctive après le
;; nom en utilisant l'extrait minimal du chemin nécessaire à l'identification
;; du fichier (on ignore les tampons spéciaux et on supprime ce nommage
;; spécifique lorsque l'ambiguïté n'existe plus).
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p 1)
(setq uniquify-ignore-buffers-re "^\\*")

;; Activer la mise en exergue des espaces superflus ou hétérogènes
(require 'whitespace)

;; Appariement visuel des parenthèses, crochets et accolades
(require 'paren)
(show-paren-mode 1)

;; Mise en sur-brillance de la région sélectionnée
(transient-mark-mode 1)

;; Sauvegarde d'une session à l'autre de l'historique des commandes et des
;; fichiers ouverts
(savehist-mode 1)

;; Lors de l'enregistrement du tampon :
;; 1. demander s'il faut ajouter un saut de ligne final lorsqu'il est absent,
;; 2. effacer les espaces superflus en fin de ligne,
(setq require-final-newline 'query)
(add-hook 'write-file-functions 'delete-trailing-whitespace)

;; Lorsqu'une ligne est plus large que la fenêtre d'affichage, je veux
;; qu'Emacs me l'affiche sur autant de lignes que nécessaire plutôt que de
;; masquer la partie qui dépasse à droite de l'écran. Pour que ce comportement
;; vaille en toute circonstance, il est nécessaire de fixer deux variables :
;; - truncate-lines : comportement dans un tampon occupant toute la largeur de
;;   la fenêtre
;; - truncate-partial-width-windows : comportement dans un tampon n'occupant
;;   qu'une fraction de la largeur de la fenêtre (par exemple, après un
;;   découpage horizontal C-x 3).
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; « Face » (à traduire par « propriétés d'affichage » ?) utilisé pour mettre
;; en exergue des mots-clés qui annoncent une information importante.
(defface special-words
  `((((type tty) (class color))
     (:background "red" :foreground "yellow"))
    (((type tty) (class mono))
     (:inverse-video t))
    (((class color) (background dark))
     (:background "dark red" :foreground "gold" :bold t))
    (((class color) (background light))
     (:background "dark red" :foreground "gold" :bold t))
    (t (:background "red")))
  "Face used for highlighting few words like FIXME, TODO and others, that
points out an important information."
  :group 'basic-faces)

;; Variable utilisée par la fonction de mise en exergue des mots-clés (définie
;; ci-dessous) pour pointer les propriétés d'affichage (définies ci-dessus)
;; à leur appliquer.
(defvar special-words 'special-words)

;; On associe à l'ouverture d'un fichier une fonction (anonyme) qui recherche
;; et met en exergue une liste prédéfinie de mots-clés. Ces mots-clés ne sont
;; signalés que lorsqu'ils sont suivis d'un caractère « : », éventuellement
;; séparé du mot-clé par un ou plusieurs espaces.
(add-hook 'find-file-hooks
  (lambda ()
    (font-lock-add-keywords nil
      '(("\\<\\(FIXME\\|TODO\\|WARNING\\|BUG\\|XXX+\\|NB\\|NOTE\\|ATTENTION\\)[  ]*:"
         1 special-words t))
    )
  )
)

;; Fonction remplaçant toutes les tabulations du tampon courant par le nombre
;; d'espaces qui ne modifie pas la mise en page apparente (étrangement, la
;; fonction native d'Emacs ne s'applique qu'à une région, pas à un tampon
;; entier).
(defun untabify-buffer ()
  "Untabify the entire buffer."
  (interactive)
  (untabify (point-min) (point-max))
)

;; Effacement des caractères blancs (y compris les nouvelles lignes) jusqu'au
;; prochain caractère non blanc.
(defun trim-whitespace () (interactive)
  "Delete white-space characters up to the next non-white-space character."
  (save-excursion
    (if (re-search-forward "[  \t\r\n]*[^  \t\r\n]" nil t)
      (delete-region (match-beginning 0) (- (point) 1))
    )
  )
)

;; « F10 » : suppression de tous les « caractères blancs » jusqu'au prochain
;; caractère qui n'en est pas un.
(global-set-key [f10] 'trim-whitespace)
