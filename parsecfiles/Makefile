.PHONY: all run clean

SHELL = /bin/bash
CC = clang

all run: parsec/pkgs/apps/bodytrack/inst/atlas.clang-serial/bin/bodytrack

run: parsec/pkgs/apps/bodytrack/inst/atlas.clang-serial/bin/bodytrack
	. parsec/pkgs/apps/bodytrack/parsec/native.runconf ; \
	cd parsec/pkgs/apps/bodytrack/run ; \
	tar c * | cat > /dev/null ; \
	../inst/atlas.clang-serial/$$run_exec $$run_args

parsec/pkgs/apps/bodytrack/inst/atlas.clang-serial/bin/bodytrack: parsec/.parsec_uniquefile Makefile
	rm -rf parsec/pkgs/apps/bodytrack/inst/*
	PARSECDIR=$(realpath parsec) PARSECPLAT=atlas \
		parsec/bin/parsecmgmt -a build -p bodytrack -c clang-serial
	PARSECDIR=$(realpath parsec) PARSECPLAT=atlas ATLAS_BACKEND=NONE \
		parsec/bin/parsecmgmt -a run -p bodytrack -c clang-serial -i native

parsec/.parsec_uniquefile: parsec.patch Makefile
	rm -rf $(@D)/*
	mkdir -p $(@D)
	curl http://parsec.cs.princeton.edu/download/3.0/parsec-3.0.tar.gz | tar xz \
		$(addprefix parsec-3.0/, \
			CHANGELOG CONTRIBUTORS FAQ LICENSE README \
			bin config env.sh version \
			pkgs/apps/bodytrack \
		)
	mv parsec-*/* $(@D)/
	rmdir parsec-*
	touch $@
	patch -b -d $(@D) -p1 < $<

clean:
	rm -rf parsec/pkgs/apps/bodytrack/obj/*
	rm -rf parsec/pkgs/apps/bodytrack/inst/*
