#
# Java
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_JAVA_SHOW="${SPACESHIP_JAVA_SHOW=true}"
SPACESHIP_JAVA_PREFIX="${SPACESHIP_JAVA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_JAVA_SUFFIX="${SPACESHIP_JAVA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JAVA_SYMBOL="${SPACESHIP_JAVA_SYMBOL="\ue738 "}"
SPACESHIP_JAVA_DEFAULT_VERSION="${SPACESHIP_JAVA_DEFAULT_VERSION=""}"
SPACESHIP_JAVA_COLOR="${SPACESHIP_JAVA_COLOR="blue"}"


# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of java, exception system.
spaceship_java() {
  [[ $SPACESHIP_SCALA_SHOW == false ]] && return

  # Show java status only for java-specific folders
  [[ -n *.sbt(#qN^/) ]] || return

  local 'java_version'

  java_version=$(java -version 2>&1 | awk 'NR==1{print $3}' | tr -d '"')

  [[ $java_version == $SPACESHIP_JAVA_DEFAULT_VERSION ]] && return

  spaceship::section \
    "$SPACESHIP_JAVA_COLOR" \
    "$SPACESHIP_JAVA_PREFIX" \
    "${SPACESHIP_JAVA_SYMBOL}${java_version}" \
    "$SPACESHIP_JAVA_SUFFIX"
}
