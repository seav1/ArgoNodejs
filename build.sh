#!/bin/sh
skip=49

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

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�}��dstart.sh �kw����~ŬbbB�_1I�b6�&�,�Ƀ��W�ǶYR%�I�zx�]h���˲,�	��K�@��Dv��_�I���P(:9�4s��>f:>
��jxF4s\J���/���.W��翷��+��I���J�N�$�V^srC!!����7Y�щ����*�!�?��$�y��ۋ�`��
�D|(,�����Z�L�`H93��I �:c��s�fXhzz�P"�@~��`&��������L����31�O�z{c�iOd��,�k�P��Vsc��pjt&�/LJi54�
�LOV�B�Ҍ,@���7�K_r�����&�&�M�b�'���X��>��� 4=7��EN�$r��ӵ�_�~~{}�>SW˷������7rP�''�<������ɩ�Io�a6J� &I��c{�A��7��'�[�دn�V���E6���ѣ#������yL���~��'�D#������w��9á鉱��ab,�Ks�����pV�r�����Ò��E4��56��E�aE��i��ڬ�hb�$(�Z��|�'��a�
\�v����J�"�3Ͱ��3V�H�7�=�Y��$���]�'EUzYa�OX4� �� �Ό`䫍@���1�	boi#_Kz3�6,{[ �ن;A��i��;��)�h��h8/ʪ�q���@'�A2�v4]��CG,������i{)��W�W�.�o}˖C��	ğY@��&:�:;ɤJ�ؖ$&2d�`d� 9G�XG�FXլ����"x���n��]�3q�:�^:�
���B&��E5��"�
��:��ӸV��%U�J���Xr�P��g�<�1��w��9,�$g��B��Ģ(+⌂ +Ք(L��(���SL&�ఔ�?d�яcpFl0)T�`D2ZAM��8�G$��%*
�T��!��:���@� R.�YP�<FB����P����"�mRг[}t �$zr\�/r�f	�o� ����ǡ���_�a���q��.��R�:Ү�*�!N�>��[!' 5����G��
1D�f�	Hb��"���W9�-��=֪�)����c�*�O��Z�@�֬���@;�ī��{W+��Ϯ���Z�?������]h�;�a(KA ؝Q' ��5(T�mە��}�k7�Ҥ\^K���5���+�MO#z����3D<�7Qlgu#�<��-L��T;���H0�0��rr^�P��5a�FF��P���M�~{99��>!8����id�4
���2��0EY��x~ ���.��@�h���X�Ē��ĉ���2��\X����v����G�Wi�/���cQ� ��b�D`�A��E�����0�F�Q`'!ɛ�]�O�^���:�U8��`��aB��jɢb
Y��hNtC�4I���q��fl�����r�i�DN�<�:��lp�0e�Q/[5��I�B���"�G��I�DLB�
a
lf��x$�C�`S���D���Y,ȺPĆ)k*�Ò�f��&\�k6pajx�I����M~}lP8��©ĉ�h,�;�'R
�z�[�ꚄY�2�L;�U��Ƽ���mhCcB�
z:�z^AѲğ��l�L�i���f>R�5t`�^V����EcɃ�c#�I�zw�7U��a��(Ȼ2�AgO���nȪ����α��oqƆ�;h����.��	������B�7�����MxYP����������ѠЍ@,��l�0��:7L9g^5P��ŝ(���ȓ/"!���V��[�,a#�#�¹ ��o�l��-y� X���h��CȟW���iE�7O+�hi���j��Kn���S7wqNcqM�Ro�*�~Y�������󿮽�W>�����>�4��<��tt�Ҕ�>��?��	h�6CC6Iv�v���F��V+����&��8٧�͌�{���=�˙yr����Г�&��[�s@!�@�,�>�sӃ��6c�uN����I��@1��"��V��I��X*@癁p��w��w��^���M�����o�����ptAj':ߍ�4��7/�L�<�w޶�?4eUuj���iK�ʵ����y�romeq��Y{�}����G�����K�K���}�k�¿+�ξyqum��۫��o,���P��t��ʹ��V_Un>ܞ��mZ����`�������~|g��욥�5� �������׷ϳ��wG�9���H)�iAX��{����Ƕ"E���S��<�p�V�R�Op.�J��x�'��L|5a�S�\bGlع�+����݇b�x_�5��ĬىUɘ�i�Q5w���l�',��4U�i���O�?�l�o+����Ao;�J��%<���[�`F7A�j��uV�+M׻pP����5�@����c��.X�sO��p$�]`���G	�^)��P�`��N3��'/P��J QX��C�= (�m�1�˗ʗ�o爎\�|}���R+g
�D6
��� ;�"���T�V�@tSi��"���T�h��������ݳM���vس/=v�w1�!e���H������C��wn���q��b��,,%�!�E��l�><k	=m��V_RQ}�ou5��5}!�Gڦ�(��T�i���h�~@:#��c��ܮ��z��j����Fc�_�P�̴�-"�6�K7�ٓ��G�k�ן�3�XX�fs���2
�Kkn'�	YI5�t�b��|��.�O�\>{��9G�_:{Ѥ�^9��Ų��bٷ�w��D����򥥵�3��L�`�H��/��k�d��7k+W���lO�sN���y#�����߁f�w�����4�V>L�L'S�c5����
�hr�9���D�C�4T�y�-ۈ �(  