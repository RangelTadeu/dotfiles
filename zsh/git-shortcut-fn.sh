function c {
  git add --all
  git commit -m "$1"
}

function cm {
  git commit -m "$1"
}

function t {
  git add --all
  git commit -m "Release $1"

  git tag -a "$1" -m "Release $1"

  branch=`git branch | grep "*"`

  git push origin ${branch/* /}

  git push --tags
}

function del-local-branchs {
 git branch --list | egrep --invert-match "(master|gh-pages|\*)" | xargs git branch -D
}
