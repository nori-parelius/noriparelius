#!/bin/bash
rm -r css/
mkdir css/
./dart-sass/sass css-raw/style.scss css/style.css --style=compressed
