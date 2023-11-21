#!/bin/bash

team_abbreviation='HYT'
commit_regex="^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)\(${team_abbreviation}+-[0-9]+\): [A-Za-z0-9]+"
error_msg="Commit message format is incorrect"

# commit_to_check="feat(HYT-001): Test with script to create local hook to check commits"

echo "#!/usr/bin/env bash
commit_regex='$commit_regex'
error_msg=\"$error_msg\"

if [[ \"\$1\" =~ \"\$commit_regex\" ]]; then
    echo "O commit é válido!!!!"
else
    echo \"\$error_msg\" >&2
    #echo "O commit '${commit_to_check}' não é válido!"
    exit 1
fi
exit 0
" > .git/hooks/commit-msg

chmod +x .git/hooks/commit-msg
rm .git/hooks/commit-msg.sample

echo "Completed git hook commit message setup"