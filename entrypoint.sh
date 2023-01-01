
INPUT_FILE="${1}"
OUTPUT_FILE="${2}"
SUBSTITUTIONS="${3}"
VARST_VERSION="${4}"

if [ -z "${VARST_VERSION}" ]; then
  pip install varst
else
  pip install varst=="${VARST_VERSION}"
fi

cmd=('varst')

if [ -n "${INPUT_FILE}" ]; then
  cmd+=('-i' "${INPUT_FILE}")

fi

if [ -n "${OUTPUT_FILE}" ]; then
  cmd+=('-o' "${OUTPUT_FILE}")
fi

while IFS= read -r line; do
  if [[ ! $line =~ "'" ]]; then
      line="'$line'"
  fi
  cmd+=("$line")
done <<< "${SUBSTITUTIONS}"

echo "${cmd[@]}"
eval "${cmd[@]}"
