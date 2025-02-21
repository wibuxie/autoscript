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
�M��grestore.sh �Zy\SǷ�	D�b
�
?�X� ���F���#ƠQ	��$b�����֭��+E@�؟�Z�.(hq���䝙{7<�����>��a��3�{�̜3˙���j^�8&�A��-��L+���p��]0/���}�n���:��L}�no�,w��;S;B�2hԘ0�*��)��(Ǣ񝩢�>����9Px'�6ҧ�r�oT.$��ѧ5!T?��/Ǥ�5Q�|�iC���Ә�]���3K�S]=�.D�Y�?�i
�Ou�@�n�?O��J�g�_l��T7�n����"�D�%�x�x/O�᮱Q�ðM�Ԝ?9������W�}�ܟ�_K&	�r5�l`P:�9Ȥ��>�qsg�!
_&¾�t�*X�������F��K{|��g��7~=>��3�3:�=0��e �� ~� >� >� >� ~� �� �`�_��~�[�8� �� �� �0������l@���~�"zUY���w����L=��g���N���	Q�XJ�Fǈ%�pB �F	�����0I8!G��E"i�x!+�Y(�&�aQB�E�$D�(2V$�r��I� $aRqƅ��D�L*��a.zI��+]��}�0.�_#����vC��a�p�$,B�RD�I�""P�P"*�5��XiX�T&� $q�(��\J F<���c�\G��o�s� �'	��"q�T3}Ҙ�(�hz؂T�(2JB5% U?��c�������3�a�:Щ���/���(*WS���wC���xY�)���Џ��q��&���N᥾������c}��U7��*ޝ�kh�4���Ӄ�n��hq��x?lK�kB�Kp���L>�����4�E��4����p6��pSD��h�,nN���p���shx4����4�KÓi�=��pz|ʤ�=ix����h�?J�{��lnK�/���DW�J]�+u����Wl~�dS�Lm9_~�]�.�z<�ֱ�[��B�H]���� �hkU�c�����.�|��A���Bģ�U��9�G[�:�g��Ru2�!�wu4� m����߅x����0��hU�b~=��֩v��Zģ-S����GG5�1�G[����ģ-S�iC��s���A���S����	���Ǽ?⭱���q%�������[���g|y�&hz�����ݧa� �im��L���X��C��DĻIj���B�����>�[DQЯLC��6"���
�ʛ��W������6�5Tp�����
����'��JC�J�`���<z��+�K-�>+]�S=x�Z�JX?�#��S��U �2%���Y�<k7�t��u�Qb&�dVcR`y�F��˂n��Zӭ� \ ����ΚM*O�R +��-B��*�����S��&�M��!d��2�4�7�����X�kd���L�:۰B����E9_X�5��� �F��_X�u7Mgl)Ε�&rSQޚ�^�O��?��nF�,��HJ֧Q~�!�]����LE����ׄ��k"k�'�����!��H�=uu��u:u�n�'��	��::�A*7��{���Xu
ݱ{):��H�p,?�����͡�Q�׈���<5�E�)��+�2$K���&�<��A��5��5��h^����WnC1����9�}��j=ĊԂf�jVo�k -����� 5�'\0�W���0MrU��eA�Ho�"��e2�n���\2[
Y/2[Y>ʒM�eR��i�j/��vݰ5�2M-�������mx��y�_��$��T�����(%���%_�Ȋ�@����`�E���d+	�����up���D!Z�g@��j&�ΰ��c}\6�My��&iE�a �`������"(p�#�`{���W���x��)�<#��/��W���؆�R��+
�	/h���~�1�$=���zu:��H۔1�V���5@\Tz�g����h��l�F��Fy�Fd��+�Ғ��"�5�<{�)�����L\k���'&9���2L�\��PS6N�%yb!��H,�T˚p�Q�3��ۺ��^4�1�h?
�����P~D�6��F�ƻ���~�#����X*��#K?N�'X��Hc3 ���W��$u�#қ�*�ǝ%G�wQ�L�,��s��gF����j�h�B�%	��3���H�7z���4���`^ �Ck�0�,�ר���B��^�%2�'Y�R8�w�HeRi�5}'/0�g���xJaJ	�9�ʙ(8�%,S�Cт��ь�N��w+;�+���ݜR��FfG�b��9f>E�諸#�2�q -;�#������x 9$�1!�����Ʒ��������Q�Nީڽ{�&�09�A�����Q�Y�!M��u!�AZ�K����G�]T���3�?�צ��D[�	�6Yy�k�*�f�AEpZ|��8��0� �z�h8�n`��l�@���!NM@m�]~�?Q�'����!3љf�?�/d�lf$�2xw!H��S���Q�\�F�`6_i��O�3�y(:���p��g�׈v�?�A�Z�wdOFh���� �U$B��U�Qm�Y0&�U<���p{��Ta�e�6���!>0c>��$P�X+N�[��giO�i����8�Ԛ�_DJ;tJ�`�@���0�����o`&)�(`b���#�H�TB�x)ɯr���-
w��'?he��T�<�9�7#@q�/8@��o���%��t)xZ��V􌤺����j$�;�/K{"P�>P�f��o?�������~${����������'�3/Ak�<�+��m8���0�����Օ���^bPo��#�	����B�$�BB@�F:HDb�bQ�CX̢�9�������Q1Kc]��YDķ1ҁp�E#c�F_�Q)Ի�ҷZm9z��N�E�!���C��aIqa%$E��XXA@�����:��>P�l��`�-�T���5���^@�p�Ij4�z��{��X9�`�s}-Lؙ�5�]!S�������	b ��y���G���Ǳ�`i���L|�g��7��ʣo샠^�{T}�g��a��pӘc�wc΅Hy�>�zrM�|��B_i����\�Ղ�����]�~���z�vy��
�4��AR@r;�C`,L���qq�ms4��@��1MΓm3�JH�].C��u��`$7f^BJ��R@g1�nB��?������h��8(�y�AXc9�i��/��x�����ݏ3ȟ��ϱ}��PO2���t��x��]˿+u��ԕ�RW�J]�+�?M�{^�{]�3q%E-�d��V2u�Jw�Fw�/��q�PTw�̮��C�6
��e1��Aԥ)��)_J��@������c�ɿ�;h�$���jb�?�����U��q������vj=��.�Q|6U^K�~�P|%�H�F���Bw��s���8�Πh8E�(�F��=L��-��}���hE�Q��zQԉ��G��h�����{��S���0���׮��⧿��{3H�j]���Ƿ��V��!��"�wqZ��M/�/�my;��"קW>f�E���U�M,1���2��Q��uq
��~�l�j�6��W����/�9`�{�^�iӰ��0π+�{B�͹|'������I��>L��sQ�F�ȷ?y7V6l��{[�Y��r�u%{�o��v�H�����-��r���U=#�=K罭w���ϫ�u��s��Yխw���3�vr�s���v=��5%����>:7{۾����O�vvJ�A�{���u���!��yz����f�/�'<�ʶ�k���q?'��'k��Z[�C�6��������&g��j8̼y�����.[���T�v��>�L�Jyy����_���C�Y����_��\����~c�L�@Xw�>�݆{�w�L�,$v�{�i^m�)+ΔT��<���O|R��빲����95ɗ�w�O�5��NӉ�r�Û�n~5�z�����3�m��=_��W>��x�V��Ǚ��N#��V>yp����Ѥ�|ųQ#�l���}i��Z��0��_-y������O9�o�����=v�<�q�.*t�w�`�\-kաs����vJ���c�������V���WO�7]M�d�R�����|�tq����F��n��hE��p�ݺڰwo�1}$�q����7�Ԙ�ѯ
��&�?\�-���5g��"϶���3^��t�����݌{%&����_#.EO�2�l�i���;�I������o��y�IK�ir���	�E��d�8Z��5��FQ�K�Lg�}�g��xjDu�n�Ӌ�ZL��'���7|�mϸ�3��n:b���8�CW%����es�l��7#F�CS�ÏwFL�ub�S�Y���0v;q��d�ߩ��q�#���3����sp�ޘq/���*,��fA]���O�1k��}b�b����D� ����(��[Y�8�j�{��Z�Ȱu#�z��\}�����W���~yF��>;�����S�������3���c�l��y��������:���ׁA�|�jl�+��UY�Ͽ�xl��}�bݜ�9�s�����������SY����289�d�C�r�|����څ?���>8|H����~k��O#��]tβ���΂��c��?�v����9~�Ӏ��/Dw����
�o�4�$����	�.��a��Vm�K3���V��t��ڭ��]o��8�ԧ&�AxT�0ٝ���n����S��7�w�����ΐ�<~��Ф��p��������2c���RŲ�i���w��C#WI`�Κ��+ϲ�o9?����I��{,%��i�� �S5��#��i4���
�Z�U(��K������׎;X�\6�]ΐ}Oh�\�lx7��>�Y����.�
��3�؍#�M��hM���,��?_�Z��i�w����
�ӫa�e�w=���,��{�j���Oß�z�[n{d��f��_j�4)2��و��Z��O�S�wk�f۲�i�m۶m۶m�^i��\i۶m[+�>_����쮪�t\לO��7�s`�yb�k���)-ۅ���Y�Ō�ra�f�a�VO�A�dg<������ڃ��*�����������k[�&��C��>���,�=��^AH]�<cw��HRlj ����c����<�Ӑ�M���rI���/��pݒ.���s�bh 7�[6G�]���X�G�M��f�-E���3��.`�T�d����p������/X[� ���t��Q���&�qN���a�1�iM�M]R�1����b�ͤ!B�/��jt��v:��-,h>�΅�<%u4��<&g���ߗ���b�ӿ���r�Ty�b�Q�c�S4�Ȥx���A����{�����R���tÑ��������5)�Q����@U�JT+���Fi� �W�;���6��҄���k'����}a�$����rgψ8�;qk�7�8���Ͱ�بi�S-�{�i-�����9GS�J�I�v�"�|+l2��.���6c��,4���{r���.!���W��}�51:���z�!����@|£1MJ� 9��Uγ�U�����`�(k��-���6��ܾ��U$~��P�/��#���4��<w\���Z$���<;�0�6A;�-�O���u5�M����7;�����2ꩵ��3��Zm�Ӻ`4?�w.�W������s'MMTj�M=jkk	T�_�tJ��j�h��t�	g1��Wv:��Q��(}��N�]fӂ��[�����^�?Z��n����&���뤿|�����⽧,��o��a��>�h98���2̓!H�>œp�(��L�h�V�(��S�ֈ.��� ��ߘ�wQO�h��!��:۰aA�	�"k�b�I8
K��t���*�� 0��Θ���V���q ���АV��ԁ�*!z�t.���x���%�+9ތgǶO7�d��I�#�����?��7�n�9��^�(5h�e�& }=��-7�k`PFd'�a�R��
gEf�6,�R<C`"H��8��|���:���w��g]RC�� aNŇ���A4�W��M�Y����0������K�D���9�Zi���%:��g%)U�+R#B��sڵ�~��~&�!��.$��v���_$�ip~��TD#m~�os�=t�G�FP�����{9�.��v�Ig8'z���|7���FxW���br��
��KO1�<�>㘟�w-AbE�����<�]?�ȰU�Y�J��g�`p�h��9i��;h����`��\#� k`�T��R��r�X��(j)��s\��o����]���n^C�e�7_�/esh�2��Čۨ��l��\S`QKʪ���(�2�Y)1��z�P��y�ı�Z�I{��ӊ��k��ʔ�Rc1�f��w��bBѠ�h˦����V{%�S�f�^�y\My�w�@���d"���]�{�[���EGk_�����}j?�E��\��>��3�#G���Ҫ�<[�<_�,z՞�n��!r���^�ԧH4 �)�댣,��guS~���,j~|G97�d�K�؂^e�ѤF��`�ԲU���[S��,�{l�^��K���*�%Q~1A�W���rȺ�d�����a�x�c3�R�i2�z�S�3#��	@��ؕZ��)���N����͔�����..�8!��)أk�%�N�xCŉ� 8��춫p�s��i�~�t.��,i|/of�����:TRB�����E��a�A��jlH�B���.�.Co~�a��}bIޓz�̙�����R/8l���M�����}@r�O$�ܿ��r�G?� �ڃ�h��؅�����n����pEƁ� ,��*����*�ZM� �����ﴨF����g"!B��6�Ν!$��Pq"���9��������d����mpl��m/OXZ�Q�^yx�}��^C�[�[uڅP��w�Ê)�Q�f��g�X5�m5й�m�Ww�ŶX#�[I] �.��m�a�;��$����A�L��ݻ��.�����T�P4˷�aH���S�H�&~�`�ˊh�G)�� �%���h�a��<l��w�<�t�U!��n`���"�d�i5"Jl}ג����E��Yr���fT�����j>���Ey�s�����{�>�>����I�I�-cO4�
�Ӭx&:�0���" w����u�J�2FA�f?���y4�<��������:s�l��]I�p6�V��~���}��˃>l��Lʣ="�f�2}�n�ɣ˘�9�K`��M��	�l�#,�'D��t����IZ��;�&�b��g�����w�`G2V�Ө�l�1v�6�=�e ��7�TE��+\Ã���7�;kXz_��4�
n���0�0Z��R#3Ie3
[����W��4j."��"���(:i�c��
9&��a�U,��b�HҚ��i!@Tӱߌ7��>f{#�0����j]�"Ct�M�Y"ܭ��H���}�W����*��&#�E��4��O��޻EN��������a����%T0��$R�A�'���2]AcuYQ��_��R��N!��g��7�<�#cL}�Rօ;�� �m�'<ׇ���46�A�D��sr!B��L�{��Jp�v�)��*=��������J�:�a		Ʃ.���I6�)�Pp܂��'�߳��ơjؐ�\��u���d�>�z�Uy�pUtg|$x���Q�P��]dwl�G�Ϳof�:.��l�i�c��:v�;�b�[(��D���Z$���y��)��� Ƞ�h�W���ʐ��s��@�!pR��4�X���F�l;̉�1�i����2���!�V���"�-���W���!u���ԕ5)��@	�X�\rH�ֹF�gP�=^ڤ�(��)^E �)���>��`�Ө~�I)g�ۙ)���e:ֽ�MY�j��!d�+���~yf'��;5�^gVԻ�_2��E���=��[����Ձ��Rُ��k<eM˿�/"(��r*J���'0(;2����Ы��P8�F r[y6�v�g|��|d�m�I������^����J��-�B�:ކ��@z�仪�L\[\4��-І����.�a��5FNa��`�4��o	?�*��K[`�9���m���ז6�����o�9�:����{�MA)�w�l�mꨒ��f&'f\.��b����c
�-d�V�]Fڥ:�b�J�!>�Hq����D\+��9RV��i.~�i��Cd� �_u�J8)�e��FU9�?��Jt��o᪞�M��`��}\I��JS$��B�~���ˢV�N'2��ΐ�g�4�x�.+�5���;����R�"���p��J�pGo�8(�i�t+���kn &(�ڟ��TN@K��<f�;V+�%%�x����57�eet����!�2�X� ��Ġ�ĩ�;|c�ɓ�~W���?�>:����C�0�����M򽥿Ȱ�L��E�!������;��Ke������G;UILD6� tB�����<�0Z���D�]���ANXM)��P>�^��&w��h�[~�C/#����"g:�s5���`�U��7wh��������r^��\j�t�O�z�&*שB��x{�!ɼ#:S�l��1�*��eP��֏�PX�=���ݧ4I�t}��o\�v
)6�C���'b��F�Rt
�L[�H0�r��)�j\� �A�����/��.�1�ַ��)I��r&权Ujl�N�qWS���1ӛɟ������^�VPa�=���xz\W���V�:���db���!^Oq����ǙH�q�w�꺢����9SAd�"��6wf���ռŞĹ]��[an��&@��+p*��E�j�ֺ�	�eݬ<Ri�v�&��Ǭ��dGw|&�����{&/(�y���`sn�V����k�)�z��}�,	o���-�y76�KS�6M�4�\��$e9d�\q��L���A��p�/�@:?��x[�%%eWg ���$<vn�@ۗ���-l��;��:��:��&C�S��5^1���1/a�u��'O c͡���h��@=mJ{A����	�Uw��{U��ۛʅ�eZ
��B�#����Y�ǔم!��+��?t|�Y١ō
�e� ��.r�	�gY���#-ɢ��s�^��^g����B@ghmu�v�vV���¬ԩ߂���V|��u��7ܵ��n���5#�J:�7��p'`W蔑)fo���.!�|�R.1��zs]?��gײ)����%t}��wA�,o��U$�B+Nk=�90�5>1#/f�����ZX˨�WF���ֳ~p)P�~�#�="�����I�^Q������#{�R1_��s7I��;"L�>�Ę�0�_��5@�nq/�:3Ɔ�Y@�D*@S-r�{���0��~����k��皿���H�G�e��f1�,�
�#���m�`_�X�Q\�3"�6�M��8tܴ8����'�W� Ϝ���O�e��E�� %���G�Fv;?�̅l��T+VU��l��w>G��8�6���%j����7�M@Q	���� &�\���rJeޓ�	�|���:{�Bb�>;��ãy�p��I=e��\FE���,��E���K����Zr��R�,�����S�] o޾Y��yrI�e�}6����n|#�=��|}Y�Pq�N��id�i�N�'��P[D����X-��ğ9֕��0!
 �cBΘ���#�A3?ր�+������ڬ��<)���cڝS,�˻" �{^H��1�-Ou�_ob3�(���Ҽ٤�m���ki]�4�C��D�ĭ��9�o������O�@]�c��S*�x�.Uj�p l��l�"jRP���z$HPi⁜�FV(v�0�j>����*4WW��v�MaG<?�����/<�= �`��T{
�7�(��nEPJ��>3�s�7EmX/�t^,֖$�� ���G�&s�+l��g��h���"�y����(�PV�In��@�^�;.O�6&i5uE�t�8�d��C�Mj�䥿W�|~-G)i
�V�a���*0���kUy�|��/�O�Fb𻍒�}"��d:[,�6�!�	�]}��*V-iДՀ��������/�Q���/nH
q[��ß������|���:3��w�=`6��AyA�*����,~��6�F��:�ood��J��b�Q������f��w�� �(��0t�tY�"&�`�y��ͪ  u��͋�ģ)�����;��M뷺x�o|�bc;��u�@��{�a;�����X�0�h\#ڐe�$��[�@�:+6n��5t��d�E�w�����F��К��!8&�a�-���Md�DB�m�͟��
oܝk����@���
>3�&IJ���_�y�l���sB���n2��\�Fqx�Sz�֥yej $�����0�h�?��t^=���KVL.��������n�+d�R���C��t@7}��ie?�Xe��8��)���"��/?K���i���GM ��+p�R~�)j�K(ly�m�K�˞�SC!xu�fխ?�"�k�l�����|V��N�6���e�����nda5f�	y3�8����P�%>���G�7W������vX������ȇF��� ���hڸ
Hh=�:/"QR�"�kz��taL�y�VM��!��Q��e�j�H��曰>���M�H�ӽS* qys^;���'�\^'��0���xjm�A1�HQU��|�����C�&� �NwH�����B�I`�&f˽����/l%��9s�9�QIn�����\Yf�P�6��������4e����/�ڴ�:5��RN^S>�|�f2Ɇ>o���w�7o4kTj�*������؎&+z�h}�>y�WS��@[jȾ,V}/0*�tjG�؉����\�]��D@�|���+r�����oz<�7�vc��5�W��C��*dM��b~�u�=|&"Py9.201xizP6�X��!�5�G ">�v��� �����#̤j���4�*b%>Ф�߿W�> ��8L�v��뵌s��`�$G�[���i�'
�xЅ�Z��||;����@^|��T����E�\F8���WI��Әx�8$.i���0.��A�hC��/bY�9qmV5�Ȱ/4��v���|�W���ʩL��$�д����W&{�WU���z�q��s��� 443��-K|l.S��r�Tst���k?��=�"�cA,�����"Y�ib�)x@\J�J˿�z*�45v��\� �Cc��lU4�B�k_:Xٻ�Ĳڮ2N�E�ogTоt��blt)Il�Q�ʬp��f�G�k�0��vO�-[g�/�L�= �͆W3�O�M���û�9AC>�Jm�U)۶GQQi���l�07�7 ��؇�"�w���S"	QH���J�d�����0� �f&�(��&N�HL��=KZT��O��9B��,m̎�+?�0�Î�\��s��E����&�M������P�aЌ�������ܢ3UN�<wj񚷙�z�l�X��&S2�O�2�ǳ&;�ӽrf��?d0����:�[�RJ�'�|Rm[�Q�P#�
��U�HG7����V(0+f�'"w1�_o"���v��=@8p�Ӷ#�F_?a�����!}p[`Mȿ��w�t�r[JPG\��0���,��<��4;9G�X�Ẵն���k���4OKK
�B��9���@U:x��eº�i����1_�~?�?C`@�����U�B�	'��e��O���Bf\�AاS��z<�8�tLA�s��	Fk�ͣV�u�QN���2�&�*Ov��֢:`�/��H�+����v�a�9w=1��^GR~ѐC9)����ic�?�����8���<9 F�l�� U�H��c&�|���nY���L�<�220�ŷ�η�pD�2ݼ�f5��"e��$����B�C�1�Z��|�D�d��ģ6v(E�W�s�&z5��!�Zi��P~v��٪>v��>Q���^������,���#��{�W�c8������}��z��m�H�ci9��!���r�}0���k��ⶔUi�9�;�	�`'`RPn����.Ʈlգ����K��1?�w_����\���q�~N��
Z !��~�2�����F�+�]D0qժ����� T���5��?�>�4Uj!��k\��-��@=�pš(I3�����v�b�I�y����<zNU�&������Ҕɞ�6�Q�@E�v/�cv�wBw��|:y��Dx���/ ��쵒\5����L�l�1Q�4�z� :�J�?�l�xO�ݷ3<
�cU}�x-����/�#R�x]�����No}]����7�f����m���Ǫ&�T�����[���Y�O��/8�6=㶡�#3��`��X!!���QZM0k
��Ix|J����5����`O׈Yv��6��J�R�2V��x���Yb?X���)�ڋ|~�v9J�1��InZ��P�.p݈���>����k�y���e&��/��J��&����/+U���0���_A���T1Mkb�����=����{0����')��à��ۧ�I�\A��iC�g<u��˛�p��N�x�M�F3��d�x# <�CJ�B�Osƥ5�EI��L�Q�s�a&R��P3����w�dF� 3#zX�n���>�#�oڭ)�.�l���q�l�WJk��U��{�9�2iE0&��ע�#G���4�I.����⅃\>�
�qc
���fw��O�[I���M��!���jV��L���Z�D����si������|h��~>9�r �����U�5�c$��f�.F�Zm��,<c��!�enu���E�NAS�/,��eC�BSSY+Q���r��L�G�-2�h�4�@�Tu2XLKHN�.P�p;��v+s%�GG��0t�d�Q�j�O �,v!�@v.���ߜ�d�,r�P(B7�"����J��ܾ����܏+,Q�X֕�O Y��=�_f�k�*����.0/�|�N���WЫ��������S8[r=�ZRg�gڕ��P����)�v/dM`���$8j(v��|�+�	�*�TN��h¶E�����1 ��_��`Ciăl�]G<5\K���R����u�����@T$I~�Z
��Jhy��K��D�!���.�8�*a49�M�6��"��'0��X<�gÊ4�J#��� �4_��$��$�b9Z�%�r]�&F+O`�J�H�"�M,7�o�}��P� �s�����3䅚;�$Z�!�.H�n�MWӬ9�Ki=��>�o#�r���w��Jњ��(>i��B�u.��y20,ȐD𬮶��a+糫�MAm�W���)��Zʬj=~��}Ȩ�pP�s�p�)��'��=�,B ��G%��`�� ������^l=P����}���m����zc�����ϙ�e��G��;L�h�<Z�}��1
c�!��x!���F�g�f�*�T��b���8W|K����B�f��#�������[z�=�(Wc�A�ޞ*CI�:�µ_�Z.[��A�U�����/&߳�~�67q��:a=�-Ι� vެ�	@��I�
^q��c�����MK�����\�f��4�>��� '�J�C�'�Mi\O0�A�ϦM�R�(��E��4aW�m����~��TJ�L�����O����������F��X&�~��rz��v]4�n�}
�'(#��!�0���
_o8�Lէ��R��qUT��������r�����"���bqG��/^��:���4�ȚԬ��Kdc@@�Z~�O�kZ�� �@u���*(B�r
 &~�|L��Ey(�g��.Y�xeL�jg)�ҫ|��ü?fE�& ����n�Z��0�:�m�N:�3C�IMI�m�w��&�����$?�n���c�:�$;To}I�W�� ��p���v�M��~���z.�,�t�r����G��ɦ�M�@2r���Ւ��!�\�9��?(/�;��p��L��Ӳ�v�t����FwK�I2�ɿ�N9����.U}Ef1�m��?�𼢠��H%�%��tb���� m��I憰k6%�H��:��S���Ak
~�@��k^�=@׺��W碲d���#�Q\0��o5�OM1"�N��b+r��-���I�sd����؎��L�v�G���WY��U�)PCHkV�?6^�/��3�Hl.VlV��Ud��a���ꅰ��v�X~�ek�5RF��K0#�� C)>�p��]��V��j�wx\+L(w=A���b�c-8f�JW�mzۙ���t[<�X���"���&N������3�@R��7���֙��GW�D�U��
I�b�^3�:wX������_���'�~���5��BF������ɏ�jb�����C/���m��Jy2�����f#�fZ	s��\ѲԳ�m�H���������ǜ�|����������N�q%�.
���|`gF�d���<N��u#��HdǃR"���\� �D��r�rP	�WT�J��ϠW��ǻ�#7��Ӿ�XPw��Ȼ*�������b&[�Ftq��<L>r��0Z��v�>��������}��͝On~j'�EuƗ�U��u�Fb�p@�ڂ"%���J��}�fS���[��Z�:E���_����>��š̲��YV��$+U_՝�ξM,z��@�nf���"����DF7b�����9�0쭌V�k�/P�A�<��/_4&�g㒥�?󁷹=��_��W�:����-�[�P?'�`�q""�=]ؙA[���Y&M5�n�����2��~��t��M��T݀�|�06�#<�6�@g �s�oQ��P��f׈(HP"�mX��X\��A�~UM����z3/ �%��Sj��E��3�Jk��L�¸��_�o9�b���{�,�����$�p���\�� �0�J[w+��T�/�o+�؆��B�C֓�JF���
�m?`ς]e|ֺ�4]X�a��0���������q���Hk�J��(�
��k���v�������c�G+�g��0:y��_�/����[n"78%E~.�V�%�v��AN�\^���>h˼&64KI�|em�:�)@ �dy>�vLC�q���Y��u�����=6���N�����M�֏
�0(g�4���q[2����Z�h�| �.�5lZ}�`�L�ԷAmD<�V��}#?����B���L^�}R�eCf����x�ү��2�:�SG��C�V�bVt��8�G��Pr��I�<P�����3c�e���l6��(�
M�(x�p��rO��˝��Rd5?�4g�H�C*��|�T�B�n�����!t#��§�U,ɲq}0�5G>vp/�<��ۺz�+1C�)�?���@~�����QU�N�Qg5W�t����w� �\�[!������c�!:b�J:ہA��7���u[����jU(1�h>�x�2��>��6ۯ<�^^RPs%�&�4f��X[h�I_�}�H��ȕXV�XT�RVL���|SVz7>p�R +Q��*�W>���W3f����ڗ��z�u����6'��m�B\&/,�yQ�_��ZO!J�N��~�E��	�4ݧ��[BY2�g8|�,b��Vپ!���b�E9�o��ϊ6\�࿂A�AOp/D�C~qȴ�޹@C�ѱ3�T�Qj��)v����_�Tզ�������8=��p�qå�L�T���8�PIn��B�=���&(G�l�0��	�h�.��Y���"�����m(���^
&���-���{��f��
 �{rR���BAD�O���ѡjDn�#3(�:(�y��\b����<�'��f�M30���'���p�LW۱~"�zڳAQ�~I����uʔ����~��l#�Z��v̦J���-�7���Ou�b�!�ӎs#��`���:�q��W�5����)ٝ�(P�b�J]�Qpa�z��cd.`V��%�&'Zx�H,��`K-u5�c�uG�j�s�C��6��2�]��Q%�a��*r�*/jN���$c�a��:���I�GD�<����o����+q�$�N�<�g�.����z�=�8 x[�z������+�mj]. �X�[Z����7�X�M�m����߸�h.�hi2%�����H	s���H�9�"���(efZ��\�KlZE������8G	4�@��q��Sq��?�2�n_	bq}�lh����e�y�(��.�	�Yq�Y20��>�Ԁ;+�[�-����@��ߝ��>�*��*�|6�$��*7��c� ��!J�=zZg���g��}"d'�e��.� �GS���B�������t���^�̋�7 	�o7����S���B�g�(�y,�㚐:�LO���ݗ[^[��3��#�E�\��K�0�$X�}������{׶����T>w{r&\���{SF!��+�T%�:���3I��&w�&K}�	:�<T��@ ���Ѹaf���̶:Uw?�!�L�L5	2��Է��V7b��IsȲ���U��W&yAd��E���jM9�0c�^�qQN ��Tz+T�.Jo�s��^�7���8�����ɞ�Xyp8�ߑpN��X���p�'l�z~�����a$L�?]B�[��� Ԫ'�>���|)?8����<5�~빸��:"A'��vcK��6���zEG0wZ��$[�U��G���_x#�&�<�@�����I��F�%��	h9TW����2�6ɳds���(w7+qYjȈ[ٙo��uXV��g�{�DM�;h8�����|��k&x�� )��(ĭ
��y�>��A������Q�o��&��ˠ�/�.�J���܇��V���'�����X���b�~E	����_��Un��;�Ӏ�98������ԃ��<��_u�!K2oی��|��ʘU#� ���ˠp�2��b@�8� �,�s�A	��yk1jf!q��3 v?x�8N��͘O��b�\ �T8�L&B(�W[VB9W��ѹd��&ϖ�}����z��>|寛�����$FujC`�9|j;�t���53�n<⍤���A�	�X1f���C�P��-t<fh�jȼ�J�;[�eť ��Xby� 9�y����<�S�z��(&���(���%��`>T�AN耮5�y7���j�sk��	`#`p�&��$Y沰<���/\M�26������E�d�����Zؼ����ꢍ�~�XGr�Z�HqW/�B�kn;0ϭ�������0%/�[Ծ��qdI�� {���X�k��<?�Kh���UT߬4�Սn����?��w߭�n�$5�ٙ*K.,G��B�`
'j+�e��q�|�`�ug^�V�@�T��SV.{�ZFqo;��ͯv\�F-��fF$z+�r�V��0��K� �n���#o�DZb��Swzs���~�D�9�UӺ�8���D(�0f�X�����W���9��E		��(�8a�U)��!��Ù��] KC�9��<�p�m��%@K������AY��%��1�d]ޙ���9�Y�@�ŭ��w�D�{�2�4F� ���������ky9<#X@���d:]+�!��-:�nH�8\�o�")�F�{��JuA����T7�r�yTfL�Z�qz��a<w�S���Ew=t���k�a�|��o��A]]�X�-�X��p��zJ��8��ŅH���U�ء�����b����P
�34�Ո	M�����W�/��k�J�ӻ�	y#RY�)��{�+XtQ*��*I��J�N%(U�6P��i/p��\�y��VJU{���J��=�uh� $9�������ښ�jz.jj���Jd.�l�ߙQ��'�C0M,�yZX��Rg_6��_$n��|m��o�=�}q$9��s���(!��m_њ�.R�(��4� ��}��֊4���A8i��y�p��V	���+a���� ��rCW��exy����m;|��n��h!H�T]~~���0.q�Jf�^v�K��4���O�ˉ���T�������K6r��;7�:���3�j��n����C��arи�9�ݔ���n2����Wk�9�0p��;;U�qS�߫��!�;�G��@4��|M=�:)^�/�s��F7����ՖnAv���A�$;K\�� �L)����@,dH�t0ߕ�s���`�F@hV�j�%���|��mZq�'����0q��.�����@2��s�k�'���$��sM�g���Ub� �5��"+�D����;'9�h�s?��*���8��%����n�����k'1������7<<SSF�����g���������܄=h��>qac�u߲��ׂ�Zf�����n���W�?E=-}x���R�8���F��%�}��	�0}О◙_^h#E8��n��O���PU��޽���^>$���n�ZC�ܞ�΋��s�m���pu^G��՛���Z�>9�r��\�=��&�|S�#R.w���&ֻ�ο&%��Z
4s�G�
3�{v���i����q�s�(���W2,����N�S������E�-S�J���:k ]iq���.M$�hM�eУ�A����GI�5�o��%�rE��1��e������bQTg&%V�m�qx�{�au|�/�nV������Y �e��!y<!�����R�Vt|S�)��&�5!(��Jv�@u_�9�C��2-�%��A	�#���R����.�ɱ ^S{���x��Qμ��#�Cl������g�ʎ��vg��M?����%1$I��5��]U%��HK�q�IH�f�d���3���B��
�[�[e"��k�E�J��+�QQp�`�����?}"��G�sb�qť�Zg�����zG*���X��o]/��\(m���g����<��"{>A���]X��Z�:�w��l�k5b#A�x[Sd(�p�d����M+�'��a_}NqP���O}�:s|��d��UO�@"����w���@�rS��'��=���##����Y�[^� `5aG�z?Ɠ �/�"C6���&f&Q��������܍oj����ն�
���)^Q4ވ��g�2A��2�.�4��z�!���*�Ŷ@�����6�X~Z$e�lB�NF{s'�:
ybO)��R�K���t/���EdU�H�M	Js����m�7}8�'������m]�c'a�Õ�?��1�5��C��0��~5�5c�7B�hΏ�������뢷���MWAIP�]��bD�Ʃc|�v��R�v:���2�ګ3�Z�e=�5LJ�-A��Q-��N�8%�n3�`�eێ�[��K������ 怐Ϧ�����Z� n�>L'��q��*�����N�s�`#���&���.�ęMy�g���������΃8��ر���;4Տ p��W��N5_vƮ������8
"3���ӟ,a�
����1/؍)O��]#���i�B�a�����\����cz><!�`/�Ҋ�NqD��i�8O�WX1���/��oC90�~`��C��@���.k�3�ȃ%�^�v1�S�"z��*�x� � �[5(���1�Ia� ���(ұV�egV�B��QBh湬b�S�P���G~'/��y��u�Tĥ�YR���v�<c_U �MZ�
��رDp˩p^}��O�ᩙ�X8m �= <�CD:���K'��iT�,�V�o�pl�9�	�7�Z���Ga�%H�-M|��[,��r:�lTa�P��'����6�g��^�L�;�w��l�}��m"��4��C��w�~��8��xVh�p
f��u�����擮�� CK~$����g��[B��>ߵ�~JתX<�3��p�JQh3�܅^����L�ߕ�nk��;!���������-Y�Oq�.�ss��Z��|�q�̪	éW����B���Fg�S7��W��B=�{��]t��T�v�#V�P�6)c����E�9����D�a��,��;>|Ӟ�:�X�s~U����A����kr�Y�>��P/=4��\�����G_c�1z	���~�ÕN5�C� NیS���ZEUo�c��$y>��\�(�+1�5+��)h<�M�ɫ,�x�fy�z�l��p:����@�(�ס�R��~ɚH=_�yٺ��"D�"塆��-�o��oL�BL����o)'��sڧ�Q�H�ʀ� ޙ��"W����F@�T98k�/	g��Q�O��b��<pc�CÌ����z��>�^�ܢޔ�Ɔ��K�+��>ro;mR� AuA=2�ɀ��/�����G${ܘ���{�}��Qz	��
���-��RbH��B�ݵ�����!��&X��>p��vH>�s	(rx,���_�h�O��F�r�f �Z��^(��u'#KŴ����9{�So��U��t����tX�����8��V���9@7�O~�e<��N�9tq�G�t�x&z���2_�������T����U��ZW`��wK�����u2x��\�sSN9!ݹ_�I�����
����#$-�Ҁ�Q����	�1Q(!�2��;�cЙ��[RULl��k��$]�Vٞ���J�b�4������@�^��Ze�E�݄��>wC�Z��6�� ���cv�Ƞy}Q���q7;���������c>`5��r��c��M�����+�Dl0V�ס�cO�Ι��=`�z��ՑM�ޟk'h3w��6��H�	��s�nS`�Ej�:/��mw��ضS�Ɉ��z�Dh���b2�9,����t�.+�s�ڏ���57�(*���f��?->aǞ��\�t�|~�;ρ)�L>:Щo�^P?0���;�>g�6m򉠜��J���^� �/M��kJ����@�	�=����]dط-�N�Xъb�z��}��l+S���?!j���G�̗Σ��z��Re���n��u{�
��`H�U�3��p�
ofߛ�я��^���Ѵ�@��<Z�)+^l{�;2��N�pL�˧AѨTd:`1l7Ϡ/�k`�Ǽ�s�/%�|������w�L�:3T�W[���U\ba�3���%B�ֵ�ftR�p�����u��ɯ��O�R3_KF2$c��{#G���h|�mc�����ү�[2���:*���Z����lE�L�HE�ނ��V�רzT:2��v�*
8��[{f-�[�|e|M�j���3.&|b�4�dn1_�璏�Y��^��dWy&�e� ��1�\�߂���Ag�.����}�N6�)����������֘��_
E��J v���zQ��K�V���-%�3�L}�R�56!�����\v��s��T?�F�xƤ��4yeE�,�
ʎgw&
��V���˶��/e��Ң?��ęܜN�����|���єt���y�bbl;�᩟bV�T$���Ax4�[�Ao+%]�]��� ))�K�{����n������O�u�j<����uZk����Ɩġ����l~s���Q?�#����EM���u^m�!�b  p?R`���cϸ]:Ӟ W�Y��"�E#�i~(w�'�<ڱ
�K�%��Cm�+ �6�%�4�n��f�F�]�����z7���g)���l,I�Η���NSz�TP�9x\������͏��ⱌ[���	R&ڽ���j�̛��-�qpU��&+"�&6��O�1N$�r`�"z��`����.m�j ��m[I��Ⱥ��M��25Q⻿�er<�C*E���z�e�3ӑ�0�'�)�}��|w$�&EϬ��B0-��bYDzUK ��JV�2�^�k��^M�t�-�Jg�0d�nO�l���W�S[��`Vݯ2���N0����[�4pJ��,"qŖ ��vnS�u�r��d�����
/5�ƶBr�>.�"���K^l� ���3� t��J�r��E�у�\;���4-���P��B��+��ln^�}�L��;�h�bɗ�O>��ۘV�rw���?6L≸cbU� C?l��g�©#�S���ny!k�p��E%�Ɛ:*�q�0ZZ��ny������aH�;Pv��n�Ρ��_���{aj F���t���y�t3��q��!�yI��kȤg�D^���"��b���&�y4��(�
���Y��:6���饈�c�lnW��u���5*\���l�}N�F��Gp�ݴ�珼*`F��0�m'��PYO��ށb��+�X��ҢLĦ?%]��~Ň<i��r�
�+�rDr����1�e>8��X�{�De��L'R�`���f��	[Yk�I��o,q�Nzq��l*� <	�a,h��}2��v�{C����J2�=�)vxv�ʃ�U	�suHl�O��q�\�i���T;f`I��n.��;8��g=�I���)��r�B|�H��V�9ꐘB��kG�ĉ���I�=K�X��D��ۛ�0��ʄb�0Y��/k�\R�S��g����Bw^����Vl�֘U(vi[�\آ�H̥�"�ʁ�8K�p�OtR���y�V�"5K:P�%oK��M) ��β�MK�e[���c��P� ��gn^<�D��z�8�&��X@��v?��l˾��'<�Q���PsvM!f�����^[{��Z���h=%������"~�Ry�y1#�vt��I��x�n0����I!˜-���d$-A�_U�z��@���W&���!7պ��_[0ɴ�)#,�Y���8.��Y({�����ʒiR&����e������n�7��Ȝl����ٌ���7+o��.	�ȼ�4̽n)7�C�H��R�\���V��nuN��z"�5B;e�l# ��v��������U��cA�W�v�k4�����w�3^`V;�wQh+���şo���ގO�wL7lb��CڇRv�pj�U�C23�}o⧨��͓��5����uӃpّ��ƞ>��]	�����a~�s,�ay���=������(f*G����������5�ni<d 	p���/�8p�Q��ܺ#��F'��-:k � ~r��e���������}_��u���S�8��w)̞,i�L\6]��ś�����C}����`��Qd3��j�|W�o3a@Q�����7>D��0M��dZ�ګ;YQq'��|pnx?�`�����:��z�z0D�?)�Y'lBM�ge���,O婲�^Y�"}=]�q�g<��H}�����B�����C�hGE~���� �������nS���gi���I�~���[nR�@�a���f�9�*o����. z!9���t#E�C��e�c��Y��;|�p��MJ ���雖�7'&\��RMk������S;�H�9؊���j퇷�+���3m��ǡ"��q�};~]�fD���m�\̆E����{��=:�F�x:���>b�ޏ���h���c��y�C���G�� ��z@��ؓ�F	S{I�8��iN�S����?(2ww�7W�k�޹k9�k8�|/����G-	-5�r��t���E�L٣2$�\���UJcd԰����ȟ O���&�a �5	������!O�9�y��@W/)��ŧ"vc�Tr.�����+�����0���܊�0�r�ԧ��wq��b�����L�I9ҋ�S;��˜��	`��>�)Yދ*N���Mۮ�����-��3���T���)Z���b�O`�k_��E�7��swK� s�*^�|R�ǉv@��8��A�`�z/,ʟ=�����C/�Іo�Z���u����Q��svmڸ�6y�P��(�`cЂ����0W�Sè�7
��>��E��n�Vp�l���<�x�Yo��I"V���Hy�{E2:[9ܗ�>qk���3;Rm��(�.��74n�FHog��p燎S>.dwcZ�ݝ��.���Xt����X-�B�1\���ŸG�6{����c8��bި�O�~=52�B�f�/�\:)�^����sT#�X�s-����U�p�UE8L)�?k
�5�"�%&�j�J���M�:�	']��:"&#��
o�SqޡD�U�p�>޽9I����o��h�D4����2�r�A�w����mGN)���Y9�����9�h��,jc2.U���34/S�����D�J.rdW��ݯ!�n�.X��*#���Pմ�kG(�v�S�S���Ȕ�}�����jq��l�4�x�����u���B:�X�i[�K�	���ڶ���2��<��}-�Uپ���l+�!�0s(cfMW����^�)����5���N�~U2m@�@����dǱ��S�x)��r?���ڬ�:X@��vG��{K����Y��e2�?�ug{ݺ��!=��W}T;T�;����P���Z+��-1��!$�F�TD�2j���}V��Q�Z�����6��*VK�8ۃ�b�:�
�y(`"_�yT�a�C�e�|���tr��_�m�H�i�m)�����Ц9_`����&@��?���d$Q�f���*���ۼ��Jto3	�!�Aim��>	In��o���L���?�<��-P��u����~���i�~����R����n�09���ښ.�'Y��ҳs�z��aE_�Y�w"�29h�!�8_��{x<�>%^�v��q�E�h���޽g?~q�� T�4�.���z��Km�T$�䆁��C��A�/M@��Wp��Mb�������s*��I�5)D��ܥ�R6&`���\%\1�A����Pv�x�&��Q��oo.�D5�bg�����~U�Y�-Y��&�66S�Ν۹��0�m>J��Oa_+ph���G����(;��Z�����-8 P����86��<e����Ր9��,K
wZb�nP� N�Jx�vf��^�����bι�m�?d=���"��Y�������-u/����	�Ss�X�FNļ�:e�0qE�2añ�پ����`NX/]y�4�-%tں�P��Έ_�?������x`�%�����w3oT
<���x�"���sv��伎����e0�6,$�$TI��WZ�tP�5,4Þm��g�/�f?ֺdC��͈{�,��G�/Ț#OƝ��Ws����H1�4�"ד��D5�h�rӝC��9������J1y�(m��F]EX���;��ŕV��)�ZL�Y�	�L�:�I��5����-����7��S��\�;��|Oq_+�cH$�� C �vѼ��:�4���E�ī�|����y>��w� ����W�]"�Y���n2���s[���p������<?�,mv[�#y 3XI�ː����R�a�ny�;�����ɛ��g�:��pRu��x0��:�O���5�~���hkg)]�0*��a�R/�|��4\=�c����'[�����$��C���=r)@��LoZ���\;9�""�~�m�Z��,���`��R������_����`w����i�A<	.�	�U?��@F��w�Mi|��bZ����%"��6���X7n�n&%q�~�IS|/ܐYxB��
���欽�>�9�T�z�;��lH���Et�.l�J_ǚRT�hg��$R���.lm��Es�J�U����.��G:��+[�r2�������nw�MQ�J~�8�b0�2�2���,M:���# ������o�hY�ef�M�w���V֓z@�
	�2�D�3��<s����߄��Lk��b�雓{g���>�(^��V��)�٬�z^� ��@@$ӑch~ 
�W׻���*����2�j�0�p�bX�2��5���BhY���Αl�cC-���k$����\��Ů�ML�"�15�4�#`d�c�c�e���F��������  @�l����bh@gi�b�� @gg�bJgn�Jg�jicBki��&A!IZCs��{���� ������������{�L��-�������}N�6��u�_5��
i���U����Uq1��׷ٿ��� {CC :S}3'C[S}����oT����������E0��4������9;���ښڹ�����������@��8������ ���7?��J��A��&���J���,��=��c�7��������������?���ֿ����!��.���7�?���VI��s��������O�o��������y����ۯ�o��F�����X��S����������������o�ۯ�/���~��~�+�s�=�� ���#��� �| ��?�������z����wI�g|��T��f���~���j�o��w)��A���į��G�J����������zg�����_���O���������=�?��_��� �s=��ǈ���7������5��&��?��q�2�[����|�_|�_<�?~ ���������^��u*��*��o����������������5��_�����}�s�  