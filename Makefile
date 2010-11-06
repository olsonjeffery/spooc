#OOC_FLAGS=-v -g +-w -sourcepath=source -DNO_STDIO_REDIRECT +-mwindows -lmingw32 -lSDLmain -lSDL -lopengl32 -lglu32 -lglew32 -nolibcache $(shell echo $$OOC_FLAGS)
OOC_FLAGS=-v -g +-w -sourcepath=source $(shell echo $$OOC_FLAGS)

DABIN=da

OOC?=rock

all:
	${OOC} ${OOC_FLAGS} ${DABIN}

test: run_test test_clean

run_test:
	set -e; for file in source/*tests.ooc; do fn=$$(basename "$$file"); fn=$${fn%.*}; ${OOC} ${OOC_FLAGS} $$fn; ./$$fn; done

clean: cache_clean test_clean bin_clean

cache_clean:
	rm -rf rock_tmp/ .libs/ *.x 

test_clean:
	rm -rf *_tests

bin_clean:
	rm -rf ${DABIN}
