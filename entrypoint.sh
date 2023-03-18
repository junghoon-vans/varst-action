#!/bin/bash

readonly VARST_VERSION="${1}"
readonly INPUT_FILE="${2}"
readonly OUTPUT_FILE="${3}"

declare -a SUBSTITUTIONS
mapfile -t SUBSTITUTIONS <<< "$(echo "$4" | tr -d '"' | tr -d "'")"
readonly SUBSTITUTIONS

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

  cmd+=("${SUBSTITUTIONS[@]}")

  echo "${cmd[@]}"
  "${cmd[@]}"
}

main
