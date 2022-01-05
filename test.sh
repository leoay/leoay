year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

sed -i "15c\# \今天是公元$year年$month月$day日" README.md

git add --all
git commit -m "update date"

git push origin main