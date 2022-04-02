#!/usr/bin/env bash

slicedParams=${@:2:2}

result=(I am ${slicedParams[*]} and $4)

echo ${result[*]} 

