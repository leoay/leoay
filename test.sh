cd /webserver/leoay/

year=$(TZ=UTC-8 date +%Y)
month=$(TZ=UTC-8 date +%m)
day=$(TZ=UTC-8 date +%d)
hour=$(TZ=UTC-8 date +%H)
minu=$(TZ=UTC-8 date +%M)

sed -i "15c\# \今天是公元$year年$month月$day日 $hour:$minu" README.md

echo "end update date..." 今天是公元$year年$month月$day日 $hour:$minu