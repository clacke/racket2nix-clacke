#lang racket

(require net/url-string)
(require pkg/lib)
(require (prefix-in pkg-private: pkg/private/params))

(command-line
  #:args catalogs
  (pkg-private:current-pkg-catalogs (map string->url catalogs))
  (printf "#hash~a~n" ((compose (lambda (a) (pretty-format #:mode (quote write) a)) (curryr sort (compose (curry apply string<?) (curry map car) list)) hash->list)
    (get-all-pkg-details-from-catalogs))))
