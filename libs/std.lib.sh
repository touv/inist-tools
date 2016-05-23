#!/usr/bin/env bash
########################################################################
#
# INIST-TOOLS / INIST LIB
# 
# Bibliothèque de fonctions standards utilisées par le lanceur ou les
# outils « INIST-TOOLS ».
#
# @author : INIST-CNRS/DPI
#
########################################################################

#-----------------------------------------------------------------------
# Initialisation de variables globales
#-----------------------------------------------------------------------
IS_INIST=1
IS_DOCKED=1

#-----------------------------------------------------------------------
# Logging
# $1 : level/priorité (NOTICE, WARNING, ERROR, etc.)
# $2 : contenu du message ou de l'erreur
#-----------------------------------------------------------------------
function IT_MESSAGE {
  MESSAGE="[INIST-TOOLS] [$1] $2"
  # echo "$MESSAGE"    
  logger -s -p "$1" "$MESSAGE"
}

#-----------------------------------------------------------------------
# Message d'accueil (générique, réutilisable)
#-----------------------------------------------------------------------
function IT_GREETING {
  # printf "${FG_BR_BLUE}$MODULE_NAME [${FG_BR_WHITE}$MODULE_VERSION]${RESET_ALL}\n"
  if printf "$MODULE_NAME [$MODULE_VERSION_SHORT]\n" && printf "$MODULE_DESC\n" ; then
    return 0
  fi
}

#-----------------------------------------------------------------------
# Affichage de la version
#-----------------------------------------------------------------------
function IT_SHOW_VERSION {
  printf "$MODULE_NAME est en version $MODULE_VERSION\n"
}

#-----------------------------------------------------------------------
# Affichage de l'aide
#-----------------------------------------------------------------------
function IT_SHOW_HELP {
  cat $DIR_LIBS/inist-tools-help.txt
}

#-----------------------------------------------------------------------
# Vérification de l'existance d'un binaire
# (retourne 0 si trouvé, 1 si non trouvé)
#-----------------------------------------------------------------------
function IT_CHECK_COMMAND {
  if [ ! -z "$1" ]; then
    CHECK=$(which "$1")
    return $?
  fi
  # Argument $1 vide => ERREUR
  return 1
}

#-----------------------------------------------------------------------
# Vérification du dockage du portable...
# ...en comptant les hub USB dispo
# ...en comptant les écrans connectés
# /!\ Pss fiable à 100% (et il faut que xrandr soit installé)
#-----------------------------------------------------------------------
function IT_CHECK_DOCKED {
  USBHUBS_COUNT=$(lsusb | grep "hub" | wc -l)
  DISPLAY_COUNT=$(xrandr | grep " connected" | wc -l)
  if [ $USBHUBS_COUNT -eq 4 ] && [ $DISPLAY_COUNT -gt 1 ]; then
    IS_DOCKED=0
    return 0
  else
    IS_DOCKED=1
    return 1
  fi
}
