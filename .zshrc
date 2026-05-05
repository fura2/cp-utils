alias g++='g++-15 -std=gnu++23 -I "$HOME/cp-library" -Wall -Wextra -Wno-sign-compare -Wno-char-subscripts -Wl,-stack_size,0x20000000 -DLOCAL'

precom() {
  g++-15 -std=gnu++23 -I "$HOME/cp-library" \
    -DLOCAL \
    "$HOME/cp-library/template/template.hpp" \
    -o "$HOME/cp-library/template/template.hpp.gch"
}

com() {
  time g++-15 -std=gnu++23 -I "$HOME/cp-library" -H \
    -Wall -Wextra -Wno-sign-compare -Wno-char-subscripts \
    -Wl,-stack_size,0x20000000 \
    -DLOCAL \
    "$1.cpp" -o "$1"
}

pas() {
  setopt local_options pipe_fail

  local err
  err="$(mktemp)"

  if FORCE_COLOR=1 CXX=g++-15 oj-bundle -I "$HOME/cp-library" "$1.cpp" 2> "$err" | pbcopy; then
    rm -f "$err"
  else
    cat "$err" >&2
    rm -f "$err"
    return 1
  fi
}
