.PHONY: bazel-%-orfs
bazel-%-orfs:
	mkdir -p $(LOG_DIR)
	$(UNSET_AND_MAKE) print-SUB_MAKE | \
	sed 's/bazel-out\/k8-fastbuild\/bin/bazel-bin/g' | \
	sed 's/WORK_HOME=\S* //g' | \
	sed 's/SUB_MAKE = /.\/orfs /g' | \
	sed 's/\\/\\\\/g' | \
	sed "s|`echo $$ORFS`|\\$$ORFS|g" | \
	sed 's/ --no-print-directory//g' | \
	sed 's/$$/ "$$@"/' | \
	sed "s|`echo $$ORFS`|\\\\\$$ORFS|g" \
	>$(LOG_DIR)/$*.sh
	chmod +x $(LOG_DIR)/$*.sh
