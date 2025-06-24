#!/bin/bash

VERSION="0.1"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
        echo "Usage: ./hello.sh [OPTIONS]"
        echo ""
        echo "Options:"
        echo " -h, --help        Show this help message"
        echo " -v, --version     Show version number"
        exit 0
        ;;
        -v|--version)
        echo "hello.sh version $VERSION"
        exit 0
        ;;
        *)
        echo "Unkown option: $1"
        ;;
    esac
    shift
done
echo "Hello, World!"
