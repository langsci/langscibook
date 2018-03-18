TESTS_DIR=tests
TEST_BOOK_MAIN=$(TESTS_DIR)/book-main.tex
TEST_COLLECTION_MAIN=$(TESTS_DIR)/collection-main.tex

test:
	cd $(TESTS_DIR); \
	rm -f langsci; \
	ln -s ../langsci/ langsci;
	$(MAKE) -C $(TESTS_DIR) pdf # use Makefile in TESTS_DIR
	test -f $(TESTS_DIR)/main.pdf; \
	cp $(TESTS_DIR)/main.pdf test-main.pdf

test_book:
	cd $(TESTS_DIR); \
	cp book-main.tex main.tex
	make test

test_collection:
	cd $(TESTS_DIR); \
	cp collection-main.tex main.tex
	make test

test_paper:
	cd $(TESTS_DIR); \
	cp paper-main.tex main.tex
	make test

clean_test:
	cd $(TESTS_DIR); \
	rm -f langsci; \
	rm -f collection-tests/*.aux
	$(MAKE) -C $(TESTS_DIR) realclean # use Makefile in TESTS_DIR
	rm -f test-*
