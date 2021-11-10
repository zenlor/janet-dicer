(declare-project
  :name "dicer"
  :version "0.1.0"
  :description "parse dice rolls")

(declare-source
  :prefix "src"
  :source ["src/dicer.janet"])

(declare-binscript
  :main "src/dicer"
  :is-janet true)
