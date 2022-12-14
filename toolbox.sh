#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
?&?Kctoolbox.sh ?R?n?0??+VQ?R?8Qqh???ޑ?7`??Z????BPyH=?????x?Xm	???V?????b???ȾR5H??8?;??"y?A?50A)?ļ?S??q???{?P?	lC???|7C???C??1?v?<r??Mfj???rY???o?e1i?~??b?E?衼?'?m??k?[fRj+6D???F*?-z??)줷???4wS?Ew?ȅ5.??????z???Ga:????7(??nݗ?)i?z?[D?q?:=?y???8C??Խ??:ɀ}?eЗ?????d??~ $H??'  