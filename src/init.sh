#!/bin/bash

echo "Downloading source code..."

git submodule init && git submodule update --recursive
