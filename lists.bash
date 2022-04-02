#!/usr/bin/env bash

$1 || echo "First parameter is false.";
$2 && pwd
$3 && ls -1 || "Third parameter is false."
