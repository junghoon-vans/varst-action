#!/bin/bash

readonly INPUT_FILE="${1}"
readonly OUTPUT_FILE="${2}"
readonly VARST_VERSION="${4}"

SUBSTITUTIONS="${3}"

function main() {
  install_varst
  SUBSTITUTIONS=$(remove_trailing_newline "${SUBSTITUTIONS}")
  readonly SUBSTITUTIONS
  execute_varst
}

function install_varst() {
  if [ -z "${VARST_VERSION}" ]; then
    pip install varst
  else
    pip install varst=="${VARST_VERSION}"
  fi
}

function remove_trailing_newline() {
  arg1="${1}"
  arg1=$(echo "${arg1}" | sed -z 's/\n\+$//')
  echo "${arg1}"
}

function execute_varst() {
  cmd=('varst')

  if [ -n "${INPUT_FILE}" ]; then
    cmd+=('-i' "${INPUT_FILE}")
  fi
  if [ -n "${OUTPUT_FILE}" ]; then
    cmd+=('-o' "${OUTPUT_FILE}")
  fi

  while IFS= read -r substitution; do
    if [[ ! $substitution =~ "'" ]]; then
        substitution="'$substitution'"
    fi
    cmd+=("$substitution")
  done <<< "${SUBSTITUTIONS}"

  echo "${cmd[@]}"
  eval "${cmd[@]}"
}

main
