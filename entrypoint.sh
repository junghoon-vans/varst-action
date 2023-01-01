if [ -z "${{ inputs.version }}" ]; then
  pip install varst
else
  pip install varst=="${{ inputs.version }}"
fi

cmd=('varst')

if [ -n "${{ inputs.input-file }}" ]; then
  cmd+=('-i' "${{ inputs.input-file }}")
fi

if [ -n "${{ inputs.output-file }}" ]; then
  cmd+=('-o' "${{ inputs.output-file }}")
fi

while IFS= read -r line; do
  if [[ ! $line =~ "'" ]]; then
      line="'$line'"
  fi
  cmd+=("$line")
done <<< "${{ inputs.substitutions }}"

echo "${cmd[@]}"
eval "${cmd[@]}"
