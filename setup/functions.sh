#!/bin/bash

yyq_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

yyq_echo_line() {
  local fmt="$1"; shift
  printf "\n$fmt" "$@"
}
