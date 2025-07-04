# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

#
# rules.mk: standard rules for APR
#



#
# Configuration variables
#
apr_builddir=/usr/local/src/unimrcp-deps-1.5.0/libs/apr
apr_builders=/usr/local/src/unimrcp-deps-1.5.0/libs/apr/build
top_builddir=/usr/local/src/unimrcp-deps-1.5.0/libs/apr

# Some layouts require knowing what version we are at.
APR_MAJOR_VERSION=1
APR_DOTTED_VERSION=1.5.2

CC=gcc
RM=rm
AWK=gawk
SHELL=/bin/sh
LIBTOOL=$(SHELL) $(apr_builddir)/libtool

# compilation and linking flags that are supposed to be set only by the user.
# configure adds to them for tests, but we restore them at the end.
#
CFLAGS=
CPPFLAGS=
LDFLAGS=
LIBS=
DEFS=-DHAVE_CONFIG_H

# anything added to the standard flags by configure is moved to EXTRA_*
# at the end of the process.
#
EXTRA_CFLAGS=-g -O2 -pthread
EXTRA_CPPFLAGS=-DLINUX -D_REENTRANT -D_GNU_SOURCE
EXTRA_LDFLAGS=
EXTRA_LIBS=-luuid -lrt -lcrypt  -lpthread -ldl
EXTRA_INCLUDES=

# CPPFLAGS which are used only while building APR itself
#
INTERNAL_CPPFLAGS=

# NOTEST_* are flags and libraries that can be added by the user without
# causing them to be used in configure tests (necessary for things like
# -Werror and other strict warnings that maintainers like to use).
#
NOTEST_CFLAGS=
NOTEST_CPPFLAGS=
NOTEST_LDFLAGS=
NOTEST_LIBS=

# Finally, combine all of the flags together in the proper order so that
# the user-defined flags can always override the configure ones, if needed.
# Note that includes are listed after the flags because -I options have
# left-to-right precedence and CPPFLAGS may include user-defined overrides.
#
ALL_CFLAGS   = $(EXTRA_CFLAGS) $(NOTEST_CFLAGS) $(CFLAGS)
ALL_CPPFLAGS = $(DEFS) $(INTERNAL_CPPFLAGS) $(EXTRA_CPPFLAGS) $(NOTEST_CPPFLAGS) $(CPPFLAGS)
ALL_LDFLAGS  = $(EXTRA_LDFLAGS) $(NOTEST_LDFLAGS) $(LDFLAGS)
ALL_LIBS     = $(LIBS) $(NOTEST_LIBS) $(EXTRA_LIBS)
ALL_INCLUDES = $(INCLUDES) $(EXTRA_INCLUDES)

LTFLAGS      = --silent
LT_LDFLAGS   = 

# The set of object files that will be linked into the target library.
# The build-outputs.mk specifies a different set for each platform. The
# configure script will select the appropriate set.
#
OBJECTS      = $(OBJECTS_unix)

#
# Basic macro setup
#
COMPILE      = $(CC) $(ALL_CFLAGS) $(ALL_CPPFLAGS) $(ALL_INCLUDES)
LT_COMPILE   = $(LIBTOOL) $(LTFLAGS) --mode=compile $(COMPILE) -o $@ -c $< && touch $@

LINK         = $(LIBTOOL) $(LTFLAGS) --mode=link $(COMPILE) $(LT_LDFLAGS) $(LT_VERSION) $(ALL_LDFLAGS) -o $@

APR_MKDIR        = $(apr_builders)/mkdir.sh
APR_MKEXPORT     = $(AWK) -f $(apr_builders)/make_exports.awk
APR_MKVAREXPORT  = $(AWK) -f $(apr_builders)/make_var_export.awk
MKDEP            = $(CC) -MM

#
# Standard build rules
#
all: all-recursive
depend: depend-recursive
clean: clean-recursive
distclean: distclean-recursive
extraclean: extraclean-recursive

install: all-recursive


all-recursive depend-recursive:
	@otarget=`echo $@ | sed s/-recursive//`; \
	list='$(SOURCE_DIRS)'; \
	for i in $$list; do \
	    if test -f "$$i/Makefile"; then \
		target="$$otarget"; \
		echo "Making $$target in $$i"; \
		if test "$$i" = "."; then \
		    made_local=yes; \
		    target="local-$$target"; \
		fi; \
		(cd $$i && $(MAKE) $$target) || exit 1; \
	    fi; \
	done; \
        if test "$$otarget" = "all" && test -z "$(TARGETS)"; then \
	    made_local=yes; \
	fi; \
	if test "$$made_local" != "yes"; then \
	    $(MAKE) "local-$$otarget" || exit 1; \
	fi

clean-recursive distclean-recursive extraclean-recursive:
	@otarget=`echo $@ | sed s/-recursive//`; \
	list='$(CLEAN_SUBDIRS)'; \
	for i in $$list; do \
	    if test -f "$$i/Makefile"; then \
		target="$$otarget"; \
		echo "Making $$target in $$i"; \
		if test "$$i" = "."; then \
		    made_local=yes; \
		    target="local-$$target"; \
		fi; \
		(cd $$i && $(MAKE) $$target); \
	    fi; \
	done; \
        if test "$$otarget" = "all" && test -z "$(TARGETS)"; then \
	    made_local=yes; \
	fi; \
	if test "$$made_local" != "yes"; then \
	    $(MAKE) "local-$$otarget"; \
	fi

# autoconf 2.5x is creating a 'autom4te.cache' directory
# In case someone ran autoconf by hand, get rid of that directory
# as well.
local-clean: x-local-clean
	@list='. $(SOURCE_DIRS)'; \
	for i in $$list; do \
	    echo $(RM) -f $$i/*.o $$i/*.lo $$i/*.a $$i/*.la $$i/*.so $$i/*.obj; \
	    $(RM) -f $$i/*.o $$i/*.lo $$i/*.a $$i/*.la $$i/*.so $$i/*.obj; \
	    echo $(RM) -rf $$i/.libs; \
	    $(RM) -rf $$i/.libs; \
        done
	$(RM) -f $(CLEAN_TARGETS) $(PROGRAMS)
	$(RM) -rf autom4te.cache

local-distclean: local-clean x-local-distclean
	$(RM) -f Makefile $(DISTCLEAN_TARGETS)

local-extraclean: local-distclean x-local-extraclean
	@if test -n "$(EXTRACLEAN_TARGETS)"; then \
	    echo $(RM) -f $(EXTRACLEAN_TARGETS) ; \
	    $(RM) -f $(EXTRACLEAN_TARGETS) ; \
	fi

local-all: $(TARGETS)

local-depend: x-local-depend
	@if test -n "`ls $(srcdir)/*.c 2> /dev/null`"; then \
		$(RM) -f .deps; \
		list='$(srcdir)/*.c'; \
		for i in $$list; do \
			$(MKDEP) $(ALL_CPPFLAGS) $(ALL_INCLUDES) $$i | sed 's/\.o:/.lo:/' >> .deps; \
		done; \
	fi

# to be filled in by the actual Makefile
x-local-depend x-local-clean x-local-distclean x-local-extraclean:

#
# Implicit rules for creating outputs from input files
#
.SUFFIXES:
.SUFFIXES: .c .lo .o

.c.o:
	$(COMPILE) -c $<

.c.lo:
	$(LT_COMPILE)

.PHONY: all all-recursive local-all install \
	depend depend-recursive local-depend x-local-depend \
	clean clean-recursive local-clean x-local-clean \
	distclean distclean-recursive local-distclean x-local-distclean \
	extraclean extraclean-recursive local-extraclean x-local-extraclean
