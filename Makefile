#OOC_FLAGS=-v -g +-w -sourcepath=source -DNO_STDIO_REDIRECT +-mwindows -lmingw32 -lSDLmain -lSDL -lopengl32 -lglu32 -lglew32 -nolibcache $(shell echo $$OOC_FLAGS)
OOC_FLAGS=-v -g +-w -sourcepath=source $(shell echo $$OOC_FLAGS)

OOC?=rock

TESTFILESUFFIX=*_specs

all: test

test: test_single test_clean

ex_test: test_example test_clean

test_single:
	set -e; ${OOC} ${OOC_FLAGS} specs/all_specs; ./all_specs

test_example:
	set -e; ${OOC} ${OOC_FLAGS} specs/example_specs; ./example_specs

clean: cache_clean test_clean bin_clean

cache_clean:
	rm -rf rock_tmp/ .libs/ *.x 

test_clean:
	rm -rf ${TESTFILESUFFIX}

bin_clean:
	rm -rf ${DABIN}
