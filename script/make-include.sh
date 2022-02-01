#!/bin/bash

SOURCE_DIR=..
INCLUDE_DIR=${SOURCE_DIR}/include
MODULE_DIR=${SOURCE_DIR}/module

function relationPath {
    local source_path=${1}
    local target_path=${2}
    local common_part="$(dirname ${source_path})"
    local result_path=""
    
    # Определяем общую часть common_part
    while [[ "${target_path#${common_part}}" == "${target_path}" ]] && [[ ${common_part} != "." ]]; do
        common_part="$(dirname ${common_part})"

        if [[ -z ${result_path} ]]; then
            result_path=".."
        else
            result_path="../${result_path}"
        fi
    done

    # Определяем окончание forward_part от target_path
    forward_part="${target_path#${common_part}}"

    # Определяем результат, как относительный или абсолютный
    if [[ -n ${result_path} ]] && [[ -n ${forward_part} ]] && [[ ${forward_part} != ${target_path} ]]; then
        result_path="${result_path}${forward_part}"
    elif [[ -n ${forward_part} ]]; then
        result_path="${forward_part}"
    fi
    
    echo ${result_path}
}


function makeFile () {
    local module_name=${1}
    local source_file=${2}
    local destination_file=${SOURCE_DIR}$(relationPath ${module_name}/dummy ${source_file})
    local relation_path=$(relationPath ${destination_file} ${source_file})
    
    echo ${destination_file}
    echo ${source_file}
    echo ${relation_path}

    mkdir -p "$(dirname "${destination_file}")" && echo "#include \"${relation_path}\"" > ${destination_file}

    #echo source_file ${source_file}
    #echo destination_file ${destination_file}
    #echo relation_path ${relation_path}
}

function parseDirectory () {
    local module_name=${1}
    local dir_name=${2}
    
    for item in ${dir_name}/*; do
        if [ -d "${item}" ]; then
            parseDirectory ${module_name} ${item}
        else
            makeFile ${module_name} ${item}
        fi
    done
}

function parseModule () {
    local module_name=${1}
    echo Module: ${module_name}

    for item in ${module_name}/include/*; do
        if [ -d "${item}" ]; then
            parseDirectory ${module_name} ${item}
        fi
    done
}

# main

rm -rf ${SOURCE_DIR}/include

for item in ${MODULE_DIR}/*; do
    if [ -d "${item}" ]; then
        parseModule ${item}
    fi
done