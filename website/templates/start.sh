#!/bin/bash

R_SCRIPT_PATH="./profile.R"

export R_PROFILE="$(mktemp)"

echo "source('$R_SCRIPT_PATH')" > "$R_PROFILE"

R
