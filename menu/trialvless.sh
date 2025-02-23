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
�M��gtrialvless.sh �ZyTSW��"!�bE�J����"B�@@TB@DBeD
Q"��8Uq�Z��:�"E�Cq,�(
�ĩQ���s���̷��{k��a�}�og�i�;�o���:�.��Dqf$�Mᱳ;U s#z�+��M�;��Ѥ��zH��ޝZ��A�z���`�I	�.;&��N%ƚ�n�볦�n���I�v�od�$/�Ԥ�HZ9\�N��SRvJOM��Ф��ԣ~g���N'�T݇A����z՞�t9�I�v3����gR�i�M�w����c����E��n���c�R��F�̩9�7�O�TY��'s�Ձ�͗��4w�ɾ�Уb`P:�9�C��i�6��CT�:D霕0�6�^tUp%��m��򭴵7~}>��j��]S�^�h�wӂ{i��k��҂�҂�ӂ�Ղ����^��ϵ�W���Zp�<G�K�Ђ�i�����A���Z����@̏�\��k���g�	?��3��~�gw�	Az��HMN�K�q�IQ����Q��1�0.A@,�㢉TaJ�(�����O�B\� �H$�
�`'HIIL� I�0.	�Q	�D�H(HL�\�R"�4LF��/�JK&b���	DLg Q�1q���q"R������Bֈ�HF�#"�Q �iq)I�*p!�4Pq%��}&E�v�y5jl��h'"�?dj#X�*��L���(�\/ w���"H�O*✣C���CY��ңa�:�i����qq�(+�P؆�{!?�)^40� �P�yV=���$St�GR�oM\�7xu�]ڼj���4\FÍi������JNO���ʤ�eT�i��4܂�W�����C�uh�0N��IÙ�<L����7g�p7��A4ܐ�Ϣ���@Íhx,g��dnB��i�)�?i�=��pz~*��}i�&nNËix?���F�Kh�?I�=������S�m቟�x��&g�̭��yⳬ�N���!�T����d�7\!o��f�ۈG[���ל��}y%���n�%��F<�Z�Ř/C<�R��?�x��ʳ1 �(�˓1��hK����ģ�T��u�G[�����N�H��x�eʭ1��xtK"7�|
���)'0�5�і)W|D�ě��c~��p�1?�}p�1�������A�9n?�S�"���빿��<��!Oܪ
	�2� v��8�Lh���ش�����PD���+��`8?:��i�j6����P�g`}� D�?�$
^�/^�R��8ϻ�QhnRX��\��>�"g>O�Y��y�GB#^�g�z���b��y�=�1�k��/��|�9ϴAϞ&�LK�yL�0c��^$�
E�Ҥ���&�g��g��C�ĕ�<f#�b^��Rt�� �U��d�$�V^>WƓp��?���>��~;��Z�4���X�%ܷ��<�J��2Ry�۬VI=/��)y�z�RSF���\R7�3X���UL�U��� z������0��:����P�.��=��$�f^W�ncsZg�&���Fב�.�S>᪘{�]��%��	R~W'��|uÒ�]�
�7��nX`�kc�z�F�*��*%�oQ����P�XdH�FUI�,ϔ'�*�V�����<�@s�XL<i!���\�In�$��U�+r+��D�Y���\�t�Т���Ԣ�����^�+���d�k�w\� �箖�~��.
$���[BS��\���p�C�d�Tms;T����]=lJ�D�x�Dme��YJB�g[>^�C���\���Ss�ba*1�YuY��z�2��KP�l�{��E���(:�2ԋ�~WP�����'��Z>⊘�8q�8�
߉��m�j��Xb�B��H���F,�-����K��!
�wAg �p�p�D|қ���m��k<���B�,�U���p�*H�34���'�wT����\8N�&��Ia3����(uyŢ܌�Q��:� h�J�^-��m{ۀ�p��LՐI�	B�L샦L!�'?�l_k�)OLrP��2L�r�%���8����HDCX��J�a� u�uU��M2�{ ���d��д-�hZP�qoȒ�_*<��f�A�8��h �ai��C�u ��f��$t ���՜��%F�{M�L.g�"/�{�
C��DnuI���@�		���V� @�g$�,P� ��]�L<��\8S1��p�[�

o��A(���a�w�!0g� �"��������W�6u��)o�(\�Q�@�əU�����d�!�k(��m�{�wK����
`e ���t�#^�F��.�}��b 6��+3F pr��]���ve�
�A��\b��K�;+�*7��Ϭ@����N��u���,�Ô�7�TGش�#�1\F��"AJ�A�4�`�'����E��)��~�&u񰣭�L�EfV���ی�|n�4�!�7��g~�t����V��3З�K�F��_آ:�.?h�PGC��5ؐu�߳��6 ���˘���$��)n�S�|n+6l�0,�I�t�[��L=�噿��������p���dmxw�x�Õd�℠e*ɂ$%j�!o�Y0&��|.@�`�]�n*��2q%����?��T?Pj[+NV����¾�_�%7��<�T�'�)�� ��� S���	�n?�N!�����pG⒤����$^J⳦s9a�51N&��Z�����asB�%�8|�NG�ϓ:�h߁��d�_APU�B�QwL��W���%qT��y�ϽI�=;��q�9�8p�K��"��%�x��8˓!0������Sz��^aPo��m��	O�x��m4A�("����N�	c)֑)���NLJ��2�zIRʢT'bB�(>~"A��&lS��xk�TC�a�뱜z�|�o���[�R��n@���{XR���Ew���F��O��n�J�� [m=Pw�
��d�!��p���w4�@-�n�^��932f�tS���>���ojN}W(P�T�i��i}����W�P����6�e[��^��&�z8���Fm��������6};��G"��6]�3ɸ�N�@�3��a��ѐ+:���g	}�А?픗��)�k5�՝��[}�!��)������'M������
�90�t{l��mN 9�;�hr�XW�P+!�w�pr���o��XO�RB}�tb��&���M���g[��岭�z\������+z��nb}?���l7{$�=̇m�ö }6��%�~��!���i���)=������SzJO�)�O�����\������F�d��V6u�J}�F}~̒���8)�>Gf�M��*	��a1��aԡ)��)oJ�>�O�>��>�ӯ[�:Ϡy�D}�K��|�S�IS�5kfi�
}͸5�V?<z&ћ���K({ū�YA�)����������ŕ���hE�(���)����=O�[}L�v����}FQ;��Rԗ����h��f��s��K��
"���zw�Z�q��ק�]�Z�y��g�z�x�l���������@�]����ۇٯ��桗�r"l����^>u���Uw&`�\\4����>_��m3Y0����օ�N3�)F�mqu�{�<�U�|N�����I�j�����]~�|p�(��}SZ%?��%>���h\���6ז�{�������ա,�XT��ka�E���J�}wv�Wb'�Sǰ�����w@G���C[B�}��d�asv�Qq�q�5��S�>kےlUc��ջj���L����|��EC�αt�w�뚥���,5�#�_Ѳ������MV<�?xOQ;{n�W���U������rm愜���r��O��h�ks�I[TBdy��C�O�?�����\����Ge=�\��_�yR�I8��F��j�^$y&���e@��~��5cu�ɖ�ܿ���s�Խ+vw5yQn�ws�λ�5����:���]`����>��n���>Oġ�K?:�4�J�~U��O���l3ɩ��C�l��u��RU~�Ȏ���?*r8mu�9mձ����n3���x�w�_84>y6pxs����U��V�7F��d�.U��i��ו�E���zz���[-9%~ܻk��	̝�uq����$Q����A��a֥�}w<ړ�����A�|��m��Y?�~�f��-���ϼ\3�2���{�[�&��o���v��:���>\�z�gX�9ʣ6���^><�������Mqdՙ�4o�����/�_7B1�Z4oM�L���|�7̺ۡ�v��0�Ā��g�L~u�lF���}F~y��E�^��8ه�I�����vo�ᦃ���--��rȳ3O����1������eя%���{`��#Ƿ1�y�Ͳ��C&���ox����ٷ1e�y5�b=Y>������sؠ�bі��7��L*y���ގl�}5�/J8/�/�PG�9}ß��G��O��=�xZ^�n�u��UkoT�>���/��S�mQ�d����e6v*�'�E�X9
��&�:i��:�%��ςs�����4���t��]O�����~�{&�ޮʋo��u�/6�Y�LzLpy�����9	c������sU5�Ƴ5�� �����?��8�|�oc��e۩}-���1��zL�e}��쐫�c2�l6l�>������ͥ�o��4�N�^s�%{���c�/��ŉ�.��戍r����A��}�~!�Qe�@��֡����ܭ��7%�u�R�=uM���顩neRw�}d���'�s����:���N��eG������w�wƌ������O�2zH���X�C�W�s�<��o5m]��$N��Ka�L�>��Жy7���1'g�G��o���휜y�7���/c|�~��2��&�kFŦ>���{Ӯ7?�x>Ȉ�yµc!���=<_Z�J������6Y�����s����{{Y�΂��3x3ꯍ8���7�������@���G.c��O+gǶvk<xp<�C����ݽ�����	����������p�ٌ�|������*yꭵ��k�sM�O%)d��ݘ�M�mL�!�ٗ�1Fpc]%���T~�]�WF����Dl�˶�BA�z8��4��ӈ��@��ˎw�tm�ЌgR�Hӥ��!�w�ޚ3"����_�Q�v��?���̄�.h2Aњi����@ (xޙ�����*)�W��550c�<J��H��d�uE5VԘ���M`*�|�W���.��v����Px�W�;�	��ŧ������� DLWT� ��I�����T�U��n��@����!'dL��t���L��GM�9P���Ѿ]?���&��."�w�=�����ϗ��~��Ei�O�T���Xz(�i��a�5�>a�9��rɔ��ᱸ*{c�Q+8 ���]�̒���er?չ^pϺxc����]6�Y]�,��Dy�p��0I���!�Xep�lf�Z�ƚ�{�*�m'��֘�^g�`d꼗v�&��gЊn�ǥ�v�]p�ĵy���ϣL��4k'�\	>�3�C[���3١ps�� ,F:�\d��P��v��`�r���u���ĥ%������y�T:O.oKܶcI�sA�?+��BWBpd|ЅUh;�	u���4PP�Ll�nt�`=z�t���ݴ��1h8��(܀Bq[�[jnMQ@�����2�=@��2Eҝ��~u�����hU�{V��B��,v �%t ���d(]U�,���L���,���7 T����,���W���r�Mz;	���O��"3+X3d�*�n�U�=?�a���[�I��P61z=*���ԇ1�u�<�����E��K���@I�?���CǱ
��>�u\��RW��a�i��AD���l���Ώ����Zl�|;=i%�D��l�iz���`>)����Mu�8�	
�G��y[/���ֽV�O���x���#I�W�k㭕Fa��[M�Ymf������,�J�J�-�����c�D|�"��n���l|����o@�'}�҅�8��(�y0:��C="$��!��_?��y/]y�6�Q��@��v쩎�*��n�ܯ�������:<(X�?�	ח�E������UD|1���,�X�|A8Ď5��UW�I�;5�}z�nZ�t`<���1h��P����f�f�o\��#�b�U�;����fr���)Pw�g�K4���I��1�`d��
���[�;8C�i�Y�^��8�9�*�~>v�{�;�+�j��{�+�ܒ[��+��IlV����G {�����c�pA��ѦvX�M,$ߔ����Q�^џ`�<�r⫞�Pd���<q�:s��׆�R�����"5�Th�n�P.xx-���}Q(v���'�^n ��ʑ�(�6ta�j���F�]X�ckL����8�ܵ���m_)���.�ӽ���n|T���w ^#�'��Xq�K`_:��¶b��/ �:_�j�  �F���%Tw�8Z%f9��������=^H����9�x��ۊ���H� 9!e۲k���|$wFNR3|t+tdJL���{I��O+�y���+5OS��	�AI���~�H��o�,Qpy��F����Z����#x�0��(�]b"KP
�v��q��LU��^��ނn�,����*J<wq�/��:]RO`��r$?�&��װ/��@�
�J�z��3u�ﬗF�bX�5��	0WOsh����FT-��_��1�����'��ِ� ��܅�kw|$��9�X� q���!�4��Jc`ۚ��Қ �����R!t��e,��M�A�E�c©�P�k7=R7(��S���%�;.8�a����R+�'�T�0���}�46�{�G6���{4�SSBW�jsǵa��d�� ��e�ac�,�AK��{y��)�)����gk�G�&�gi"�Z/?�S�� z�(�5�s�'W�KVG�VX�Hk!v���~��S��O,��m`�6zSG�X6|�p��>M�Y�a%�Dw(�$��*��Xq�p���wA��!D(cR��e�5�0�[�����C�ű�tAN	V��� ��p�D��M���%sUA,���O�U��f���]�cXs�5����Ɔ��I�{���)A��Xݍݰҡr's4s��+}��[ �b-���0R��|���͗�-��S{Z��߲N��F���WjcL�j�g3^����F�!P�>��ч ��#�h�m�ϛ�K \�=��MⶼY�	�q��ZAg�~��ݝ��+��V�����A8�)ӽ�8� �F�l(��J��T�U�O���[E ��͒EaV���{�C�����=O�XV�s
r�����rP#Ʃ�aS�L��:�����:>&�lp�I)�'�g�K��B�n7IU�Uj<�L���e�
t}~(t��s��:��w�_жt��wh�v$�c�� ��#b���9�q(ٱ�9aVӄY�-�qW�ԩ��-D%9z%J�f�Dj��Md���V'�0#O�A?��-�.���ϵ�Jm�%θ�V�"�ܼ���i��*4���%���}��9�x��2�����0!���Șr�1k��KF�V�S͉�@�|�m���<�D�?¯�$�=�����/���15�����a�[9����?a���A���i�F�5e����^A��]j_�A���4�ᶤ�0��DR��m3���n�>}*T��X`������^���3od�.?��O�	>\>H2�a�/��}a� r ���#'�z�%s(�}yTƺB
2��Q�2I�?+��?���,��<N2�����ʵ-3�j����o�9vV� ;n�g�kg^�32�.1��ˣ��&���P�Y��9߼H��\WR}ώ/n��J����XC��l�Iqb�"��vA�Pȉ���3A�︟���?zIM��E���A�M��T��@��x��]��L��T���瑪��\[d���6�9�a�� �}��Qc};S0�bYm�c���(v�[����|Z�����pI�F��t����-���e���gD���h�GE�]�E_.�w�x��!�d����N����fd���f�LE&��0+��be!���
Ľ����9Md�g��'��Qpn�D�ܪǏTd-cNs
<^l1��d��F �5�,��I/Iٕ�y���,j?Hlǒ�KQ���=�n��ƛ7~��Ƽ��UX�l�g	����ö/&�n/�Y���� Z�N\�Ԗ$R��f�: 	�[|��7,�8OW1�Ο�/q�a�
��qI�A_�y��X��hBZCj��{�A�����@���\c�c}&1_K�/�u,�
P��U�o$��,Ǥ�P.�����9A"�5.�t�PY�K�V?��.���˵mhL��(��V$��<��o�RI��-ޜ����Z�`;�[ǷJ����Z�������'�u����C�C^��ԗ���{g5�,z����'{���UT�"�T����S>�zL�Ϗ30`V�-��5���9v�%�ө_��dW=�
&o9Y��ձ���D��F�ś��3S�'�F�e���bШe��=��yۗ�QB�G�6���6�7�2�4��`�LP���k*�$E�?��"y�7����(�]�y��*3�[d�)}ɮ-m3�&吩p�*�_to���g�rM�c'�>�j���?�48�v`��N�Q-K�(�e�'6niY�5�|��̛�ӎ����sH���)1��Jއ�U���j��HZ�`{��Lނ��bŽ^ɡ>�b{�/F[�!֧�y��F�KT�l�j����W�ύǴ8��a�ަ)LS��W�x�;�3[�Ji�C��wf<U�i�a%=�B红�W��TV�'^��m��P4p�ɨjs$\�-����%~�k��Oy/ğ���z�
_]���(\O ��D.��1�0����s�-����[�Т�z٫Ȅ��}.�F��'��AHF+�w1��1����:��3t�x��
�w]?^�L�_��ޣ�#.&��Eb[��G��)��F�ak�m�����e.�<bc؍��fE��Bk~�:go��Ӡ@s{&]E<[Q�68����'-3�=���q���1>�M����jdo&�w�G�r����J���%ԣ��)�QnV��X�p�:u�T6�Y�X~b{ǐ�X�i�>}};�s�c[���L&+s�|���S�04��Q^����h�U��yo)��\��O<��S�w_Z/s���'޷9��>��CFr�eP��5���|��q�;������;�k�!�Fw7�����U�Zm(���A]8r<$m7�����ׇDJc�Ţ�z�}G����*f\C^V<n��ùf����� {���ԫ �[`:K��ȕ���mE��	���pCk�Hz����b�l���Z�c���>Ʀ�7k8�ap���Jg@20cOMK��m�֙��,�Y�����]q�B�`8�1�(g��L9) sJ~e�4�=w	e5,z)Cە6��
��{�D��Xg�19i>�f���z�@��sϨ��9�9;�����ֽV�߮���U��ȿ+�t�7�n4K��~,&�)S�ֹ�(ҕ?�v��l�p�ޥ�Kv.+ϒ\��=�>dd:�S����Y�<����Gh1bDg4�Q����	\�栃 v��ϩa��II
�-Ԡ�_��Z$�m�5	�.4K�Ȩ�}�����|k�ۍ�xqͧ�d)�:���}��a�V��02�X<N���ъn�ӏ����ӕb����꿘�,�Tؠ"�w����?�%nRDP�p��@���˓��;v)�������$�c hw��Q�A4��f@���C��e/��\~9��]pBƢ*>���s%b��E�C���3}l��[b6HՀx����H�B6kf����6	B<���-�7�/q
��(�#1�6r���J���8�$L	ߖc�1�ڂ�6��M�fX�Q�i��&;zu_[�X��	H�/ ���Y�X|��Hm;��+7@�Ç�8�pl�%>��8P���4P5!��<~�+�����]g�}���>'Kx�n����r*��U�q��8��m7�L�p*��/nkp0փf�F�f���qw��{t�'�Q@ ��n��j�p�s�L��&Pr:���7���}����r��#(���ta�"Ma��k&�1�.+�%��zV����J��Al���'� ��H�pݸg?9]��V=�Ӱ$�S����
�oQ0P=H���R��2gS+,����Wx���A�Z)l�-E)"f�s�a�D7�m��9�o��-��)�<5G�r�Z�k��*%=�G_��A?jW��%!}@;q����\]�Sn�+D5��g��#Q��;;K���
�x�.EpD4�<��3!�mmJ)����)�igH.99���f�C#�Qo�6c�-
y=���Ċ�V_������8��LG��9:�q�����g0���,1�)͍\j��,/��L}@�6��<��4
}�U!q�s�F�I�ccF�S�Ɔ]������Ո���`H��.{c<3ד%�~��KЉ]�@r�WFL������^���pR*"ܵb
�l΢gs�	���`?�Y��`j}_Rg��͞K�j΂	�)�RVQWe-�b����L��e������×Os= �~'�U9 u�ΨI��kf���-ٙ��D+�������z �C�^�'��@]qT!�(����
r,Gc������m$%�b�u�����S�3�N�D=�_2b�CT[$��ԙ����P\d��~ގ�de��~6xO���g������64��,n�֍!�pY�q�����*^�Ե&B��83�N ����T� r�w��-_����/���4uL�NOv�����m粸�.�"�N�a�^Us�a�k@B�!�����;�.wv!&l:���,��iT�n�����4�V����A�$�����L�+�QPΠ.�������l^z������?V�[��io����>�lpz��Hl�O���*e�U�N�퐐�M���3��>����j1D�<Ϣ|.���P�'�6���ͫ;�_��ub7#c��Y	��I� y�&
_�fz'��ڑ��I5��ʞL�����^�K�`����>a>-��˷�:M�ї�S�b��x�U5��,DW�$&
�7<l��y�-_~boH;�C��Cڡᢶ����`�*f$�8|v��lr��W�y.j��ᒴ�,H�7:�"v���찲Wq3�Y�A��y�j����+�p�LGi9�� ��ĝnb�9��av�'���9�=;�+4i�H�<�6�*<<���P�7�R��8^�∎�4�����p+B��hn>���kr(���� {#���Y	8��W�m�����9�7ǽ�>��_'ФI=�G�t^e�Nd��E�A�7[�l�S��S�|T�+EJ�tR0T(R.��ueH��0IC���xCI��7E�9�zyP�8�d�d�fF��I�E� �יv6}=e�� ��Y�"��b3e��x������k���E�P�X7S����n� �;��c�]DŦ�]��U"�^T(S��N����^�'�N�����'�ލa"M��ї����}���|F�TH���lw�8��Tz$�|�R5�"|���ej7�=i8n�,�J�E�9�����I�}��~��#Q�͜�����*��k��ͣ�{�F�V�&��ٷ"r��c�+�����C�j�Ls(�zْJ絉fM"R��Je?E��n�\lғ��,mYH%�.�_�����}�_j8�����t�Y�e�\"rHͰ�nb3)ht��|[2��,0E���WX~	��Sq�vT_����A��.q|Е{V��{&�#�Pn�����KWP6H�D���i~�}ϳ��9�^�F^�� 9O�$���47>�\�n�]HJ��
$߱@ʶ՚?1�L����[,.쯖@���#���0�Jy�R˃����N�E˄��(BV����)��YWmc2�B��We�"�-u����u�¶ ,�k���o�a`#�G�/"~��� �\���i��'G�D}(J!f��\��1%(��A�B;�
)3�~�Ϗb���~�5�d�,_�=C��&��a�\�|.�g����:����D�n�'�Tu��S�w��N
FZ�E	�
N�J�IOܪ#���b����k�Ps���	��IAV	K)�m�9��CHA[�^��J�_�l׶���]WM�P���y+��I�\�g%�ս����[}A�~ck�F_�"�B�Q� �:�q���PSA>n��I"'&eY�x*��3�q�N��c=�������/�� WYu�>m�l$N����do����Z�%z� ��l��M�v��![�]sj���˩񱬱'ݠ?�gs��J��eg/�r�?��YR&n4�o��v�����YI���A���!����0�����nL�6zj-&�e�ff���q���ixH���8U�Tg�p.C$7�|fCR՞�*T��'��ڢ��x �w+�N6z�nLFO�Qj��V9��b��<�m�馮�����8�=;#���̄]�?O~U��� 7�ӥ��y���bIw�	*a�b{�]�`0۶B'�v�y�)�����CBU��:�2�}_�3���e�ԧT�݃\T�Sm�X�g��5�$6 <�U�5��PS9]�<��@��4a������Kмu�}�I�>�f���d�8����@M8U�:Ŗ$�{3&�~Z�"����fmԧ��U[Q�먛�>�%']���k,|T����W�&�y|���fx�a7Ӕ�br�/��Q��ܰݼ�Q8�`����'s�l�߅��h1j�#2I����u��ډ���Qg���fGp��g�V���CR�OO@�-)���^9×R���t��0޳�q���u4˚E)+��H�^<eї�]##!�@H"�Ю��[N�$��G��1�,����aĝ�����?������Yq�B'wR@B_򃷁g;��;΢��l�Ә�p��򡂉3E[g���Ҏ�JU1�nL9��2��
�݉Bptk�ޯhz�^W�Q}r�����jO1�ގ&x�x�7���R��AW�G*���y�� ���sQ���npG��[dVC�D�H���������'A8���NgFr8��Rq9��m{'���3�Ղpv��)[�Ja��H������E�;b��Wвej1�蹡��%�ֶ��r2i� ޗ������E��
�9�Q�M��L��{��%~m8T8��[F�-���0��1�؝'�%��+2]�������S�y9'�h��|���9��%;�q���L+�@���<�;�6�;C�ŕ�Z=8.nw��^�����]4x����q����{S���y �D*��^���d�FK�$�(����)A�d�U5�L�r�lT�i�׾�C���%�ڑ3�X���@l��>�إ|S�uƫa�|,���5�ֻ��f�*��r�f��Oi*ъe���A�3���0aJ����_�u� �M8F];��i8w���*&�=�DI�Oί/,�@����
K�j�&����-9?���j݌,�x�� ]��[vZ_F9g�C���0�S�[@JVa�����n��\tW�|�%d���(1��2PD���������=-#-�g��-FzFzzZ{{�@W���
`hgBke0�5�r��s0�0�15����O��k����ڛ�� �쁖)��#��v�I�����-t�<�w���gI�?�4i���h ��X������t� ��&�Fv����&v����ֵ���E�����ki����*��u���Ah��--� �_|�p�����������y�_PA��u�6����o3�?��w�����3���|y�~���&��������=`o|¯�zP���Ư+����W�񫊂���'����ʿ�x_������Q�����W���W����b�{L�������e�^�����=��O�7�-���l���*�?<�� ���f���t��ὐ��o������_��_�����ľ���w����'�����W�/���d���[N��_��_%�������@��3�5������������'p��ȏ��=k�_����<t�7��s���W�5�v��w������__X������7|�o��7@�w������k��9�B�?8"��;��>����<�y���Os,�7����?m6�h`  