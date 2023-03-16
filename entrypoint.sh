#!/bin/bash

readonly VARST_VERSION="${1}"
readonly INPUT_FILE="${2}"
readonly OUTPUT_FILE="${3}"

SUBSTITUTIONS="${4}"

function main() {
  install_varst
  SUBSTITUTIONS=$(remove_trailing_newline "${SUBSTITUTIONS}")
  SUBSTITUTIONS=$(double_quotes_to_single_quotes "${SUBSTITUTIONS}")
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

function execute_varst() {
  cmd=('varst')

  if [ -n "${INPUT_FILE}" ]; then
    cmd+=('-i' "${INPUT_FILE}")
  fi
  if [ -n "${OUTPUT_FILE}" ]; then
    cmd+=('-o' "${OUTPUT_FILE}")
  fi

  cmd+=("${SUBSTITUTIONS}")

  echo "${cmd[@]}"
  eval "${cmd[@]}"
}

function remove_trailing_newline() {
  arg1="${1}"
  arg1=$(echo "${arg1}" | sed -z 's/\n\+$//')

  local result=()
  while IFS= read -r line; do
    result+=("$line")
  done <<< "${arg1}"

  echo "${result[@]}"
}

function double_quotes_to_single_quotes() {
  arg1="${1}"
  arg1=$(echo "${arg1}" | sed -z 's/"/'\''/g')
  echo "${arg1}"
}

main
