# Makefile for Open Sound System module kernel

CC=cc
HOSTCC=cc
CPLUSPLUS=g++ -fno-rtti -fno-exceptions -I.
OSFLAGS=-Wall -DOSS_LITTLE_ENDIAN
OS=Linux
ARCH=x86_64
TOPDIR=..
OBJDIR=$(TOPDIR)/target/objects
TMPDIR=.
MODDIR=$(TOPDIR)/target/modules
BINDIR=$(TOPDIR)/target/bin
LIBDIR=$(TOPDIR)/target/lib
SBINDIR=$(TOPDIR)/target/sbin
OSSLIBDIR="/usr/lib/oss"
THISOS=kernel/OS/Linux
CFLAGS+=-O
SUBDIRS=drv framework
TARGETS=kernel
DEPDIR=

all: subdirs 
lint: lint_subdirs 

dep: dep_subdirs 

include $(TOPDIR)/make.defs

clean: clean_local clean_subdirs

