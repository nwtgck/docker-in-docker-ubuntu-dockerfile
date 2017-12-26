#! /bin/bash
nohup dockerd >/dev/null 2>&1 & # (from: https://stackoverflow.com/a/10408906/2885946)
/bin/bash
