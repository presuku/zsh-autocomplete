#!/bin/zsh
unsetopt listbeep

() {
  zmodload -F zsh/parameter p:funcfiletrace
  zmodload zsh/param/private

  typeset -ga _autocomplete__func_opts=(
    localoptions extendedglob clobber
    NO_aliases evallineno localloops pipefail NO_shortloops NO_unset warncreateglobal
  )
  setopt $_autocomplete__func_opts[@]

  typeset -ga _autocomplete__funcfiletrace=( $funcfiletrace )

  typeset -g _autocomplete__basedir=${${(%):-%x}:P:h}

  builtin autoload +X -Uz ${_autocomplete__basedir}/Functions/**/.autocomplete__*~*.zwc(D-:)
  .autocomplete__main "$@"
}
