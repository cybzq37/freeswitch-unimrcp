AM_CPPFLAGS                = $(UNIMRCP_PLUGIN_INCLUDES)

plugin_LTLIBRARIES         = demosynth.la

demosynth_la_SOURCES       = src/demo_synth_engine.c
demosynth_la_LDFLAGS       = $(UNIMRCP_PLUGIN_OPTS) \
                             -L$(top_srcdir)/plugins/libcurl \
                             -lcurl

demosynth_ladir            = $(libdir)

include $(top_srcdir)/build/rules/uniplugin.am

UNIMRCP_PLUGIN_INCLUDES     += -I$(top_srcdir)/plugins/libcurl/include