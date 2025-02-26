#!/bin/bash
set -ev

# Copyright (C) 2013 Goodow.com
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

j2objc_version=2.6

if [[ -d dist ]]; then
  exit
fi

echo "fetching j2objc"

# curl -OL https://github.com/google/j2objc/releases/download/${j2objc_version}/j2objc-${j2objc_version}.zip
# unzip -o -q j2objc-${j2objc_version}.zip
# mv j2objc-${j2objc_version} dist

# Downloading the j2objc build from a fork because the original repository's releases were removed.
curl -OL https://github.com/mirego/j2objc/releases/download/${j2objc_version}-mirego/j2objc-${j2objc_version}-mirego.zip

# Unzipping the downloaded archive
unzip -o -q j2objc-${j2objc_version}-mirego.zip

# Moving the extracted folder to "dist"
mv j2objc-${j2objc_version}-mirego dist

# Copying only the libraries for the iPhoneOS platform into the lib folder
cp -R dist/lib/iphoneos/* dist/lib/
