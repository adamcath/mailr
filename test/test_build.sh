#!/usr/bin/env bash

../mailr build \
    --subject "This is a test email" \
    --from "Tester <tester@mailr.tool>" \
    --to-field email \
    template data.csv
