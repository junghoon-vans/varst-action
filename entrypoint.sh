#!/bin/bash

INPUT_FILE="${1}"
OUTPUT_FILE="${2}"
SUBSTITUTIONS="${3}"
VARST_VERSION="${4}"

function main() {
  install_varst
  execute_varst
}

function install_varst() {
  if [ -z "${VARST_VERSION}" ]; then
    pip install varst
  else
    pip install varst=="${VARST_VERSION}"
  fi
}

function execute_varst() {
  cmd=('varst')

  if [ -n "${INPUT_FILE}" ]; then
    cmd+=('-i' "${INPUT_FILE}")
  fi
  if [ -n "${OUTPUT_FILE}" ]; then
    cmd+=('-o' "${OUTPUT_FILE}")
  fi

  SUBSTITUTIONS=$(echo "${SUBSTITUTIONS}" | sed -z 's/\n\+$//')
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
