#!/bin/bash

echo "============================================================"
echo "== pyflakes =="
pyflakes . | grep -v migration
