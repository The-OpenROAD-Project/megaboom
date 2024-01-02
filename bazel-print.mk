.PHONY: bazel-%-print
bazel-%-print:
	mkdir -p $(LOG_DIR)
	$(UNSET_AND_MAKE) print-SUB_MAKE | \
	sed 's/bazel-out\/k8-fastbuild\/bin/bazel-bin/g' | \
	sed 's/WORK_HOME=\S* //g' | \
	sed 's/SUB_MAKE = /.\/orfs /g' | \
	sed 's/\\/\\\\/g' | \
	awk -v orfs="$$ORFS" '{gsub(orfs, "\\\$$ORFS"); print}' | \
	sed 's/ --no-print-directory//g' \
	>$(LOG_DIR)/$*.txt
