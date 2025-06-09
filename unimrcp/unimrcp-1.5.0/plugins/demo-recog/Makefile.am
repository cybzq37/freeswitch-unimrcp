AM_CPPFLAGS                = $(UNIMRCP_PLUGIN_INCLUDES)

plugin_LTLIBRARIES         = demorecog.la

demorecog_la_SOURCES       = src/demo_recog_engine.c
demorecog_la_LDFLAGS       = $(UNIMRCP_PLUGIN_OPTS) \
                             -L$(top_srcdir)/plugins/libcurl \
                             -lcurl

demorecog_ladir            = $(libdir)

include $(top_srcdir)/build/rules/uniplugin.am

UNIMRCP_PLUGIN_INCLUDES     += -I$(top_srcdir)/plugins/libcurl/include
