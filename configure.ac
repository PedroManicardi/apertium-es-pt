AC_PREREQ(2.52)

AC_INIT([apertium-es-pt], [1.1.6], [sortiz@users.sourceforge.net])
AM_INIT_AUTOMAKE

PKG_CHECK_MODULES(APERTIUM, apertium >= 3.9.0)

AC_SUBST(APERTIUM_VER)

PKG_CHECK_MODULES(REGTEST, apertium-regtest >= 0.0.1, [],
                  [AC_MSG_WARN([Running tests requires apertium-regtest])])

AP_MKINCLUDE

AC_OUTPUT([Makefile])
