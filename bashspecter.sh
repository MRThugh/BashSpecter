#!/bin/bash

# ==========================================
# Tool Name   : BashSpecter
# Version     : 1.0
# Author      : MR.Thugh
# GitHub      : https://github.com/MRThugh
# Description : Legal Web Pentesting Toolkit (Bash Only)
# License     : MIT
# ==========================================

# ---------- Colors ----------
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

# ---------- Banner ----------
banner() {
  clear
  echo -e "${RED}"
  echo "██████╗  █████╗ ███████╗██╗  ██╗"
  echo "██╔══██╗██╔══██╗██╔════╝██║  ██║"
  echo "██████╔╝███████║███████╗███████║"
  echo "██╔══██╗██╔══██║╚════██║██╔══██║"
  echo "██████╔╝██║  ██║███████║██║  ██║"
  echo "╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
  echo -e "${RESET}"
  echo -e "${BLUE}BashSpecter v1.0${RESET}"
  echo -e "${CYAN}Developed by MR.Thugh${RESET}"
  echo -e "${YELLOW}⚠ Authorized Targets Only ⚠${RESET}\n"
}

# ---------- Authorization Check ----------
authorization_check() {
  echo -e "${RED}WARNING:${RESET} This tool is for authorized testing only."
  read -p "Do you confirm you own or have permission to test this target? (yes/no): " confirm
  if [[ "$confirm" != "yes" ]]; then
    echo -e "${RED}Aborted by user.${RESET}"
    exit 1
  fi
}

# ---------- Header Security Scan ----------
check_headers() {
  echo -e "\n${BLUE}[+] Security Headers Check${RESET}"
  headers=$(curl -s -I "$TARGET")

  declare -A checks=(
    ["Content-Security-Policy"]="CSP"
    ["X-Frame-Options"]="Clickjacking Protection"
    ["Strict-Transport-Security"]="HSTS"
    ["X-Content-Type-Options"]="MIME Sniffing Protection"
    ["Referrer-Policy"]="Referrer Policy"
  )

  for header in "${!checks[@]}"; do
    if echo "$headers" | grep -iq "$header"; then
      echo -e "${GREEN}[✔] ${checks[$header]} enabled${RESET}"
    else
      echo -e "${RED}[✘] ${checks[$header]} missing${RESET}"
    fi
  done
}

# ---------- HTTP Method Testing ----------
check_methods() {
  echo -e "\n${BLUE}[+] HTTP Method Testing${RESET}"
  for method in GET POST PUT DELETE OPTIONS; do
    code=$(curl -o /dev/null -s -w "%{http_code}" -X $method "$TARGET")
    if [[ "$code" == "405" || "$code" == "403" ]]; then
      echo -e "${GREEN}[$method] Restricted ($code)${RESET}"
    else
      echo -e "${YELLOW}[$method] Allowed ($code)${RESET}"
    fi
  done
}

# ---------- Technology Fingerprinting ----------
fingerprint() {
  echo -e "\n${BLUE}[+] Basic Fingerprinting${RESET}"
  headers=$(curl -s -I "$TARGET")

  server=$(echo "$headers" | grep -i "^Server:")
  powered=$(echo "$headers" | grep -i "^X-Powered-By:")

  [[ -n "$server" ]] && echo -e "${YELLOW}$server${RESET}" || echo -e "${GREEN}Server header hidden${RESET}"
  [[ -n "$powered" ]] && echo -e "${RED}$powered${RESET}" || echo -e "${GREEN}X-Powered-By hidden${RESET}"
}

# ---------- Safe Fuzzing ----------
safe_fuzz() {
  echo -e "\n${BLUE}[+] Safe Input Fuzzing${RESET}"

  payloads=(
    "'"
    "\""
    "<script>"
    "../"
    "%27"
    "%22"
  )

  for p in "${payloads[@]}"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET?p=$p")
    if [[ "$code" == "500" ]]; then
      echo -e "${RED}[!] Payload '$p' caused server error (500)${RESET}"
    else
      echo -e "${GREEN}[OK] Payload '$p' → $code${RESET}"
    fi
  done
}

# ---------- Main ----------
main() {
  banner

  if [[ -z "$1" ]]; then
    echo -e "Usage: $0 <url>"
    exit 1
  fi

  TARGET="$1"
  authorization_check

  check_headers
  check_methods
  fingerprint
  safe_fuzz

  echo -e "\n${CYAN}Scan completed.${RESET}"
  echo -e "${BLUE}BashSpecter | MR.Thugh${RESET}"
}

main "$@"
