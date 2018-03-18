.include <own.mk>

BINOWN=	dragon
BINGRP=	dragon
BINDIR?=	${HOME}/bin
WARNS=	6

CFLAGS+=	-I${HOME}/inc
LDFLAGS+=	-L${HOME}/lib

.SUFFIXES: .calc .rb .py .sed

.calc:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}

.py:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}

.rb:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}

.sed:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}
