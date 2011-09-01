# Nixon's pull request acceptance process
#
# once a pull request has been reviewed and the changes look good, bring
# the pull request branch into your local repo and run "fab test" to
# make sure that the pull request doesn't conflict with other changes on
# the master branch.
#
# Usage:
#
# Create a local branch and run testcases:
#
#   pullr <pull-request-#> [ -d ]
#
# If all the testcases pass, run "delp" to remove the pull request
# branch.
#
# Side effects:
#
#  pullr will pull in all upstream changes into your master branch
#
# Requirements:
#
#  git://github.com/nixon/github-gem.git
#  git://github.com/nixon/git-pulls.git
#
# Bugs:
#
#  If "-d" is used with pullr and there are conflicts when merging in
#  the pull request branch, the pull request branch will be deleted
#  instead of recognizing the conflict as an error condition.
#

function delp {
    # delete git pull request branch
    br=$(git branch | awk '$1=="*" {print $2; exit}')
    if ! echo "$br" | egrep -q '^pull-[0-9]+$'; then
        echo "\"$br\" is not a pull request branch" >&2
        return 1
    fi
    git reset --hard  # clean up branch in case of merge conflicts, etc
    git checkout master
    git branch -D "$br"
}

function gitdir_top {
    w=$(git rev-parse --git-dir)
    if [[ -n $w ]] ; then
        echo "$w/.."
    fi
}

function git_upstream {
    # which remote name represents the current repo's upstream
    # if there's one named "upstream" pick that one, otherwise, default
    # to "origin".
    git remote | fgrep upstream || echo origin
}

function pullr {
    # pullr : run tests against a pull request
    # given a pull request number, merge the pull request with master,
    # and run testcases.  when finished, if all tests pass, optionally
    # remove the pull request branch.
    pullreq=${1?}
    delpull=$2  # any value deletes pull request branch on passed tests
    (cd $(gitdir_top) &&  # git pulls has to be done at the top
        git co master &&  # make sure we're on master
        git pull $(git_upstream) master && # make sure we're up-to-date
        git pulls update &&
        out=$(gh fetch-pull $pullreq merge)
        echo "$out"
        echo $out | fgrep -q CONFLICT || fab test)
    rc=$?
    if [[ $rc -eq 0 ]] && [[ -n "$delpull" ]] ; then
        delp
        rc=$?
    fi
    return $rc
}
