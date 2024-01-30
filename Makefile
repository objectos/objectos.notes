#
# Copyright (C) 2023 Objectos Software LTDA.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Objectos Notes
#

## Coordinates
GROUP_ID := br.com.objectos
ARTIFACT_ID := objectos.notes
VERSION := 0.1-SNAPSHOT
MODULE := $(ARTIFACT_ID)

## Resolution dir (required)
RESOLUTION_DIR := work/resolution

## Deps versions
SLF4J_VERSION := 1.7.36
TESTNG_VERSION := 7.9.0

# Delete the default suffixes
.SUFFIXES:

#
# Default target
#

.PHONY: all
all: test

#
# notes@clean
#

## basedir
BASEDIR := .

include make/tools.mk
include make/deps.mk
include make/resolver.mk
include make/clean.mk
$(eval $(call CLEAN_TASK,,))

#
# notes@compile
#

## javac --release option
JAVA_RELEASE = 21

## --enable-preview ?
ENABLE_PREVIEW = 0

## resolution trigger
RESOLUTION_REQS := Makefile

include make/compile.mk
$(eval $(call COMPILE_TASK,,))

#
# notes@test-compile
#

## test compile deps
TEST_COMPILE_DEPS := $(COMPILE_MARKER)
TEST_COMPILE_DEPS += $(RESOLUTION_DIR)/org.testng/testng/$(TESTNG_VERSION)

include make/test-compile.mk
$(eval $(call TEST_COMPILE_TASK,,))

#
# notes@test
#

## www test runtime dependencies
TEST_RUNTIME_DEPS := $(TEST_COMPILE_DEPS)
TEST_RUNTIME_DEPS += $(RESOLUTION_DIR)/org.slf4j/slf4j-nop/$(SLF4J_VERSION)

include make/test-run.mk
$(eval $(call TEST_RUN_TASK,,))

#
# notes@jar
#

include make/jar.mk
$(eval $(call JAR_TASK,,))

#
# notes@pom
#

## pom.xml description
DESCRIPTION := Objectos Notes provides a type-safe note sink API. 

include pom.mk
include make/pom.mk
$(eval $(call POM_TASK,,))

#
# notes@install
#

include make/install.mk
$(eval $(call INSTALL_TASK,,))
