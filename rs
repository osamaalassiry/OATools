#!/bin/bash
rsync -rzavv --no-whole-file --inplace --delete --progress $@

