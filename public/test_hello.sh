#!/bin/bash

[[ './hello.sh nima' = "hello nima!" ]] && (echo "test passed!"; exit 0) || (echo "test failed :-("; exit 1)
