#!/bin/sh


ng build #--prod

git add dist
git commit -m "Updating gh-pages (temp message)"

git branch -D gh-pages || true
git subtree split --prefix dist -b gh-pages # create a local gh-pages branch containing the splitted output folder
git push -f origin gh-pages:gh-pages # force the push of the gh-pages branch to the remote gh-pages branch at origin
git branch -D gh-pages # delete the local gh-pages because you will need it: ref

#git push
#git subtree push --prefix dist origin gh-pages
git reset --soft HEAD^
#git rm -r --cached dist
