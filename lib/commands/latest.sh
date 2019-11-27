latest_command() {
  DEFAULT_QUERY="[0-9]"

  local plugin_name=$1
  local query=$2

  [[ -z $query ]] && query="$DEFAULT_QUERY"

  # pattern from xxenv-latest (https://github.com/momo-lab/xxenv-latest)
  load_cmd "list-all"
  list_all_command "$plugin_name" "$query" \
    | grep -vE "(^Available versions:|-src|-dev|-latest|-stm|[-\.]rc|-alpha|-beta|[-\.]pre|-next|(a|b|c)[0-9]+|snapshot|master)" \
    | sed 's/^\s\+//' \
    | sort --version-sort \
    | tail -1
}