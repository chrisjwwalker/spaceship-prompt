#
# Scala
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SCALA_SHOW="${SPACESHIP_SCALA_SHOW=true}"
SPACESHIP_SCALA_PREFIX="${SPACESHIP_SCALA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SCALA_SUFFIX="${SPACESHIP_SCALA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SCALA_SYMBOL="${SPACESHIP_SCALA_SYMBOL="\ue737 "}"
SPACESHIP_SCALA_DEFAULT_VERSION="${SPACESHIP_SCALA_DEFAULT_VERSION=""}"
SPACESHIP_SCALA_COLOR="${SPACESHIP_SCALA_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of node, exception system.
spaceship_scala() {
  [[ $SPACESHIP_SCALA_SHOW == false ]] && return

  # Show SCALA status only for JS-specific folders
  [[ -n *.sbt(#qN^/) ]] || return

  local 'scala_version'

  scala_version=$(scala -version 2>&1 | awk '{print $5}')

  [[ $scala_version == $SPACESHIP_SCALA_DEFAULT_VERSION ]] && return

  spaceship::section \
    "$SPACESHIP_SCALA_COLOR" \
    "$SPACESHIP_SCALA_PREFIX" \
    "${SPACESHIP_SCALA_SYMBOL}${scala_version}" \
    "$SPACESHIP_SCALA_SUFFIX"
}
