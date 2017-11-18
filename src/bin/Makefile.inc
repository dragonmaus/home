.include <own.mk>

BINOWN=	dragon
BINGRP=	dragon
BINDIR?=	${HOME}/bin
WARNS=	6

CFLAGS+=	-I${HOME}/inc
LDFLAGS+=	-L${HOME}/lib

.SUFFIXES: .calc .sed

.calc:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}

.sed:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}
