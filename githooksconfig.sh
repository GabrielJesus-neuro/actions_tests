#!/usr/bin/env bash

# regex to validate commit msg
team_abbreviation='HYT'
# commit_regex='(test|TEST)+(-)(\d)+\s+(#)(InProgress|Resolved|Done|Blocked|UAT)+\s+(Add|Cut|Fix|Bump|Make|Start|Stop|Refactor|Reformat|Optimize|Document|Merge)\s+(([a-zA-Z0-9]+)(\s|_)*)+'
commit_regex="(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)+\(${team_abbreviation}-\d\d\d\):\s([A-Za-z0-9]+( [A-Za-z0-9]+)+)"
error_msg="Commit message format is incorrect. Example: 'feat(HYT-001): Add Some changes'"

echo "#!/usr/bin/env bash
commit_regex='$commit_regex'
error_msg=\"$error_msg\"
if ! grep -qE \"\$commit_regex\" \"\$1\"; then
    echo \"\$error_msg\" >&2
    exit 1
fi
" > .git/hooks/commit-msg

chmod +x .git/hooks/commit-msg
rm .git/hooks/commit-msg.sample

echo "Completed git hook commit message setup"