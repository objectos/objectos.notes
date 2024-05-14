#
# Copyright (C) 2023-2024 Objectos Software LTDA.
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
VERSION := 0.2-SNAPSHOT

## Deps versions
SLF4J_NOP := org.slf4j/slf4j-nop/1.7.36
TESTNG := org.testng/testng/7.9.0

# Delete the default suffixes
.SUFFIXES:

#
# notes
#

.PHONY: all
all: test

include make/java-core.mk

#
# notes@clean
#

include make/common-clean.mk

#
# notes@compile
#

## javac --release option
JAVA_RELEASE := 21

include make/java-compile.mk

#
# notes@test-compile
#

## test compile deps
TEST_COMPILE_DEPS := $(TESTNG)

include make/java-test-compile.mk

#
# notes@test
#

## test main class
TEST_MAIN := objectos.notes.RunTests

## www test runtime dependencies
TEST_RUNTIME_DEPS := $(SLF4J_NOP)

## test modules
TEST_ADD_MODULES := org.testng

## test --add-reads
TEST_ADD_READS := objectos.notes=org.testng

include make/java-test.mk

#
# notes@jar
#

include make/java-jar.mk

#
# notes@pom
#

## pom.xml description
DESCRIPTION := Objectos Notes provides a type-safe note sink API. 

#
# notes@install
#

include make/java-install.mk
