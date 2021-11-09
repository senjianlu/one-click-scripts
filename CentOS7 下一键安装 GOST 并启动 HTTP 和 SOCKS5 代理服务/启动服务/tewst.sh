#!/bin/bash
 
ARGS=`getopt -o "ao:" -l "arg,option:" -n "getopt.sh" -- "$@"`
 
eval set -- "${ARGS}"
 
while true; do
    case "${1}" in
        -a|--arg)
        shift;
        echo -e "arg: specified"
        ;;
        -o|--option)
        shift;
        if [[ -n "${1}" ]]; then
            echo -e "option: specified, value is ${1}"
            shift;
        fi
        ;;
        --)
        shift;
        break;
        ;;
    esac
done