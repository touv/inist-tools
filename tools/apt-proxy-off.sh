#!/usr/bin/env bash
################################################################################
#
# inist-tools / tools / apt-proxy-on.sh
# 
# Sous-routine qui positionne le proxy inist pour APT
#
# /!\ S'execute en ROOT
#
# @author : INIST-CNRS/DPI
#
################################################################################

# ------------------------------------------------------------------------------
# Variables globales
# ------------------------------------------------------------------------------
APT_PROXIES_FILE="/etc/apt/apt.conf.d/95proxies"

# ------------------------------------------------------------------------------
# 
# ------------------------------------------------------------------------------
# Si le fichier 95proxies existe déjà, on le supprime
if [ -f "$APT_PROXIES_FILE" ]; then
  rm "$APT_PROXIES_FILE"
fi

# ------------------------------------------------------------------------------
# Sortie propre
# ------------------------------------------------------------------------------
exit 0
