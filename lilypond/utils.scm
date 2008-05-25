% -*- coding: utf-8 -*-

% features
% uses "global" automaticaly

#(define (mus:set context property val)
   (make-music 'ContextSpeccedMusic
               'context-type context
               'element (make-music 'PropertySet
                                    'symbol property
                                    'value val)))

#(define (get-instr-name name)
   (cond ((eq? name 'violin)
          (list "Violin" "Vl. I" "violin"))
         ((eq? name 'violinI)
          (list "Violino I" "Vl. I" "string ensemble 1"))
         ((eq? name 'violin-solo)
          (list (markup #:column ("Violino" "principale")) "Vl. princ." "violin"))
         ((eq? name 'cello-solo)
          (list (markup #:column ("Violoncello" "principale")) "Vlc. princ." "cello"))
         ((eq? name 'piano-solo)
          (list (markup #:column ("Piano" "principale")) "Pf. princ." "piano"))
         ((eq? name 'violinII)
          (list "Violino II" "Vl. II" "string ensemble 1"))
         ((eq? name 'viola)
          (list "Viola" "Vla." "string ensemble 1"))
         ((eq? name 'cello)
          (list "Violoncello" "Vlc." "string ensemble 1"))
         ((eq? name 'piano)
          (list "Piano Forte" "PF." "acoustic grand"))
         ((eq? name 'bass)
          (list "Contrabasso" "Cb." "string ensemble 1"))
         ((eq? name 'flute)
          (list "2 Flautti" "Fl." "flute"))
         ((eq? name 'oboe)
          (list "2 Oboi" "Ob." "oboe"))
         ((eq? name 'clarinet)
          (list (markup #:column ("2 Clarinetti" "in Bb")) "Cl. (B)" "clarinet"))
         ((eq? name 'bassoon)
          (list "2 Fagotti" "Fg." "bassoon"))
         ((eq? name 'horn)
          (list "2 Corni in F" "Cor. (f)" "french horn"))
         ((eq? name 'hornI)
          (list "I II in F" "I,II" "french horn"))
         ((eq? name 'hornII)
          (list "III IV in F" "III,IV" "french horn"))
         ((eq? name 'trumpet)
          (list "Trombe in C" "Tbe. (C)" "trumpet"))
         ;((eq? name 'trumpet)
         ; (list "3 Trombe in C" "Tba. (C)" "trumpet"))
         ((eq? name 'trombone)
          (list "2 Tromboni" "Tbn." "trombone"))
         ((eq? name 'tuba)
          (list "Tuba" "Tba." "tuba"))
         ((eq? name 'vibraphone)
          (list "Vibrafono" "Vib." "vibraphone"))
         ((eq? name 'tubular)
          (list "Campane tubolari" "Perc." "tubular bells"))
         ((eq? name 'percSoloI)
          (list "" "" ""))
         ((eq? name 'percSoloII)
          (list "" "" ""))
         ((eq? name 'percSoloIII)
          (list "" "" ""))
         ((eq? name 'percSoloIV)
          (list "" "" ""))
         ))

#(define lilyVersion
   (markup #:center-align
           (#:line ((#:sans "Engraved by LilyPond")
                    (string-append "(" (lilypond-version) ")"))
                   (#:typewriter "www.lilypond.org"))))

#(define prima (markup #:line (#:italic "come prima")))

#(define (symbol->music x)
     (eval x (current-module)))

#(define (version n)
   (markup #:italic (string-append "version " n)))

#(define (instrument name section-list)
   (define names (get-instr-name name))

   (ly:export (make-simultaneous-music
               (list
                ;(symbol->music global)
                (make-sequential-music
                 (append (list
                          (mus:set 'Staff 'instrument (car names))
                          (mus:set 'Staff 'instr (car (cdr names)))
                          (mus:set 'Staff 'midiInstrument (car (cdr (cdr names)))))
                         (map symbol->music 
                              (map (lambda (x) (symbol-append name x))
                                   section-list))))))))

#(define (instrument name section-list)
   (define names (get-instr-name name))

   (ly:export (make-simultaneous-music
               (list
                ;(symbol->music global)
                (make-sequential-music
                 (append (list
                          ;(mus:set 'Staff 'instrument (car names))
                          ;(mus:set 'Staff 'instr (car (cdr names)))
                          (mus:set 'Staff 'midiInstrument (car (cdr (cdr names)))))
                         (map symbol->music 
                              (map (lambda (x) (symbol-append name x))
                                   section-list))))))))
