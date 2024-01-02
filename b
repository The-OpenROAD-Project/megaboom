#!/bin/bash
bazelisk build $(bazelisk query "attr('name', '.*cts', deps(DigitalTop_synth))" --noimplicit_deps)
bazelisk build $(bazelisk query "attr('name', '.*route', deps(DigitalTop_synth))" --noimplicit_deps) --jobs=1
bazelisk build DigitalTop_generate_abstract
