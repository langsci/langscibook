TESTS_DIR=tests
TEST_BOOK_MAIN=$(TESTS_DIR)/book-main.tex
TEST_COLLECTION_MAIN=$(TESTS_DIR)/collection-main.tex

test:
	cd $(TESTS_DIR); \
	rm -f langsci; \
	ln -s ../langsci/ langsci
	$(MAKE) -C $(TESTS_DIR) pdf # use Makefile in TESTS_DIR
	test -f $(TESTS_DIR)/main.pdf; \
	cp $(TESTS_DIR)/main.pdf test-main.pdf

clean_test:
	cd $(TESTS_DIR); \
	rm -f langsci
	$(MAKE) -C $(TESTS_DIR) realclean # use Makefile in TESTS_DIR
	rm -f test-*
