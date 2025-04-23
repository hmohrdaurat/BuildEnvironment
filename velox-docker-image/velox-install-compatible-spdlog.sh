#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Minimal setup for Ubuntu 20.04.
set -eufx -o pipefail
SCRIPTDIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPTDIR/setup-helper-functions.sh

# Folly must be built with the same compiler flags so that some low level types
# are the same size.
CPU_TARGET="${CPU_TARGET:-avx}"
COMPILER_FLAGS=$(get_cxx_flags "$CPU_TARGET")
export COMPILER_FLAGS
SPDLOG_VERSION=v1.12.0
NPROC=$(getconf _NPROCESSORS_ONLN)
DEPENDENCY_DIR=${DEPENDENCY_DIR:-$(pwd)}
export CMAKE_BUILD_TYPE=Release

function install_spdlog {
  github_checkout gabime/spdlog "${SPDLOG_VERSION}"
  cmake_install
}

(return 2> /dev/null) && return # If script was sourced, don't run commands.

(
  install_spdlog
)