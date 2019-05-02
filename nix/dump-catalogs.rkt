#lang racket

(require net/url-string)
(require pkg/lib)
(require (prefix-in pkg-private: pkg/private/params))

(define (compare-string-alist a b)
  (string<? (car a) (car b)))

(define (pretty-write-sorted-string-hash h)
  (define alist (hash->list h))
  (define sorted-alist (sort alist compare-string-alist))
  (define pretty-alist (pretty-format #:mode 'write sorted-alist 78))
  (printf "#hash~a~n" pretty-alist))

(command-line
  #:args catalogs
  (pkg-private:current-pkg-catalogs (map string->url catalogs))
  (pretty-write-sorted-string-hash (get-all-pkg-details-from-catalogs)))
