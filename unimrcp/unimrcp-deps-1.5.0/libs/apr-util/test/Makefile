srcdir = .


# PROGRAMS includes all test programs built on this platform.
# STDTEST_PORTABLE
#   test programs invoked via standard user interface, run on all platforms
# ALL_TESTS
#   test modules invoked through the abts suite (./testall)
# OTHER_PROGRAMS
#   programs such as sockperf, that have to be invoked in a special sequence
#   or with special parameters

INCLUDES = -I/usr/local/src/unimrcp-deps-1.5.0/libs/apr-util/include -I/usr/local/src/unimrcp-deps-1.5.0/libs/apr-util/include/private -I/usr/include  -I/usr/local/src/unimrcp-deps-1.5.0/libs/apr/include  -I/usr/local/src/unimrcp-deps-1.5.0/libs/apr-util/xml/expat/lib

STDTEST_PORTABLE = dbd testall

TESTS = teststrmatch.lo testuri.lo testuuid.lo testbuckets.lo testpass.lo \
	testmd4.lo testmd5.lo testldap.lo testdate.lo testdbm.lo testdbd.lo \
	testxml.lo testrmm.lo testreslist.lo testqueue.lo testxlate.lo \
	testmemcache.lo testcrypto.lo

PROGRAMS = $(STDTEST_PORTABLE)

TARGETS = $(PROGRAMS)

LOCAL_LIBS = ../libaprutil-${APRUTIL_MAJOR_VERSION}1.la

CLEAN_TARGETS = manyfile.bin testfile.txt data/sqlite*.db

# bring in rules.mk for standard functionality
include /usr/local/src/unimrcp-deps-1.5.0/libs/apr-util/build/rules.mk
APRUTIL_LIBS = /usr/local/src/unimrcp-deps-1.5.0/libs/apr-util/xml/expat/libexpat.la /usr/local/src/unimrcp-deps-1.5.0/libs/apr/libapr-1.la -luuid -lrt -lcrypt -lpthread -ldl
APRUTIL_LDFLAGS = $(ALL_LDFLAGS) -no-install 

# link programs using -no-install to get real executables not
# libtool wrapper scripts which link an executable when first run.
LINK_PROG = $(LIBTOOL) $(LTFLAGS) --mode=link $(COMPILE) $(LT_LDFLAGS) \
	    $(APRUTIL_LDFLAGS) -o $@

# STDTEST_PORTABLE;

abts.lo: $(srcdir)/abts.c $(srcdir)/abts.h $(srcdir)/abts_tests.h \
	 $(srcdir)/testutil.h

testutil.lo: $(srcdir)/abts.c $(srcdir)/abts.h $(srcdir)/abts_tests.h \
	     $(srcdir)/testutil.h

OBJECTS_testall = abts.lo testutil.lo $(TESTS) $(LOCAL_LIBS)
testall: $(OBJECTS_testall)
	$(LINK_PROG) $(OBJECTS_testall) $(APRUTIL_LIBS) 
# For VPATH builds; where we have no ./data, copy us some data
# if we wait until 'make check', then 'make; ./testall' fails;
	if test ! -d "./data"; then cp -r $(srcdir)/data data; fi

OBJECTS_dbd = dbd.lo $(LOCAL_LIBS)
dbd: $(OBJECTS_dbd)
	$(LINK_PROG) $(OBJECTS_dbd) $(APRUTIL_LIBS)

check: $(TESTALL_COMPONENTS) $(STDTEST_PORTABLE) $(STDTEST_NONPORTABLE)
	teststatus=0; \
	progfailed=""; \
	for prog in $(STDTEST_NONPORTABLE) $(STDTEST_PORTABLE); do \
	        if test "$$prog" = 'dbd'; then \
			for driver in none  pgsql sqlite3 odbc; do \
				if test "$$driver" != 'none'; then \
					LD_LIBRARY_PATH="`echo "../crypto/.libs:../dbm/.libs:../dbd/.libs:../ldap/.libs:$$LD_LIBRARY_PATH" | sed -e 's/::*$$//'`" \
					./$$prog $$driver; \
					status=$$?; \
					if test $$status != 0; then \
						teststatus=$$status; \
						progfailed="$$progfailed '$$prog $$driver'"; \
					fi; \
				fi; \
			done; \
	        else \
			LD_LIBRARY_PATH="`echo "../crypto/.libs:../dbm/.libs:../dbd/.libs:../ldap/.libs:$$LD_LIBRARY_PATH" | sed -e 's/::*$$//'`" \
			./$$prog; \
			status=$$?; \
			if test $$status != 0; then \
				teststatus=$$status; \
				progfailed="$$progfailed $$prog"; \
			fi; \
		fi; \
	done; \
	if test $$teststatus != 0; then \
		echo "Programs failed:$$progfailed"; \
	fi; \
	exit $$teststatus

# DO NOT REMOVE
