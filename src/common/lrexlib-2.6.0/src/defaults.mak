# default settings for lrexlib

V = 2.6
MINORV = 0

LUA      = lua
INC_LUA  =
LIB_LUA  =

# If the default settings don't work for your system,
# try to uncomment and edit the settings below.
#INC_LUA  = -I/usr/include/lua5.1
#LIB_LUA  = -llua

MYCFLAGS = -W -Wall -g $(INC_LUA) $(INC_PCRE) -fPIC
AR = ar rcu
CC = gcc
