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
�J��gbackup.sh �ZyTS�ֿ	""D����X@Ԃ���Q��� �04$�
F�Q��֩�*N��c�YQ[�Ep�m">)��wι7p�g��_߷ַ8����������������i4LS��i���7�3�{T 6�[cV���)z}i,]�2{�!쎒x_j�iS��c�K��6�X�v
ߗJiS�j�M�}(SO�R�`�(	^�MA7�6]ێN�u�v^�TNӦ���'5d�����6��a�Q�^L�ӗ�Ǵ��n>�3��y�twٞ�~��kS͸;�n_:��q�c�7G�/���&"���95kn0v�Gw���P!�_U���r}�����t�|N7ZV�y�!6�ԩ�2�
����V|��}��-2k]�&���'p?�>�wjQ�h�St��u��u�_��'�����u�[u�l��t�ԁ�сt�&:�,�����с;��A��O:�k��96�ҵ��u�.��D=��7��i$��c�T�KN�D���ON�tw�&'G�'Dc"~<�ቒ�QX�H%N�"���H�	x	X</>�'v<�0!�$�"~"�#㓰$����qI��x���dQ0��"W&a�)B���E�8�΍�'��i<,\�(�6�E�HAֈ�&�"n|8?:���/L�W� aP�7l���3��&�\M���r��+Ɲ�0�����E<�������T��@6�%T?��r�����q�O��uh@���O?��������v����$/� �����f\��I�ꃻ��5om\�7L�]z�y%���\A�Qp���wPp�$K�K%/�|B�GRpK�_C�^��)8���Qp�}�gP�0����I�q
>��Rp#
�����aܘ��Rp
�D�M)x*gQ�L
>���(85?�Q�!|77��܂���C)x����|�_�K�/��\�����ev�����%5�����9�m���Q��
�P���A�} y��*�י|�WV ���-���U��[�� �%��[�2�g �Re&�C�we��<�R�a��y��*��pUz#~��֩tA�:��-S�F|��-���x!��֩�y�e*Uݐ��<ŏ�����G|��P����!(~�π�9��B'���y���l���9.iR.��e� ���A�J��-��V�Q��<�pH�;D`8�������ʄ�V���C��
�n\��+�L�+;�p�U�N��T�;YS-�F�h�3�9&v�%^�C<.}!2�e^iN�D����2�=Zhu�����0�\eT��{��K��0��!�$b
	�{D*L/X���v�n�j�1g�: I*h9�U�����kyy�հ\�����pG�K9��Dk_u��,���>+��ژ�$�vZ]��Α��w�M�:<�Tց��L/��P�n�����8�@W7P�b�9���ߊ�x���Ơb��NH��ɸ���øL��lƳ8�66+�	IFf�� ��"�E�:�:�z[����v�#��>'���fJ	LO+�w1��^���4�؝^�ŕ�Q�����6�D�IфJ�(�a�NM�D#�O�7����`1��0G�l�I�qi�b������jVnFk .����Т j�]�0�K�݈K"89�8��% 2�fi��nx�'��P�� d�����\��h�,�l-�Z]���5�ցKŪf���K2:0�3�m2�Gk��9*��fs�d"*eQ��{�č���2���YŒN��E���;�؋�����uҫ OT��|�˘�(q9�~�#�2&M�'�����!D*D\w@B��tg���R�{/T )�&�AԖ��V<�.�;u�,�%��K�@S@D���v��{��9h.�'|�}�H�����b�k�����d���9 6B�pʽJ<Y�imo�s8PM$�*�I�F��L4�S&�#ˆ.�ׁ5��@���x- �2��`J����pJ�\�d4`b�(����a$� ښ�ڪ,�/��hD�������r(���i[
��v�"�K����M8P)��a=& ?����.�  tH$�L" B89T]�:K��c0��D��.� eFD-P�V�G �!�	SЇ����еaJ �@�
&h� ��x�� (! Wy�/A\ҮV���;��B����P�q[U
��k������3ϿjG�p��5LlD̬::L��0��F�ޡ��!,�D}w>�V� fBw��z�� "�z��4��HX�8l�� ����?���@�������QB ���w��)m=��a�A���`�+��� :EOt-p����1(c�aӆ�g@��p���!���@�8�ȫ�vQd|��m���T[���0�L��0���Q�r��q乁4i�.>�+(��4 �z�p8D���r���Fu ���	w�����\d�W?��L���4�F4|��a�8�@�@�8M͞2N2l�2,�s����}h�zrJ�/���j-�á���1[�����E�Ad)��0A�� I��8�-w1�`���z0�np7��!���I�bF����1��sm���S���؟EC��%0nhEy���q*��( �l1�zh� �����b���l)����5QO�4�b��$5��e���N���Zy>_��z=s�g�li�O�l�;��>��x�c�����H��Z�S��DV�����-��7��?}��OqI5w,~��BB}����,��{^��q�.m���(+��c��K뉫�����B#�~��
R1/[��m��6�bv�/��	���!.��D!{���(\��MM�0̃��&�?�m�F���\O�k���Z]߭�U��w�)����`I��JX(��O�!�H��� uxn��Z�D�����
��d́�G���@���&PK@w�/�5�iiA-�E�26d��Y��w�<�Z=����ǰ1���ZW�	���r���f&6}��ä16{����K}�m��o �p���6�g2�/-r�	���i�U=�}�g�J�%o�_3��jɫz��o�c��|i����
��h��!T�rk�/caH����ѷͩ@����S���^�>R�:��J�m�j�6�I�����@'�݄B�&����&�[�8&�\}���f�����d��p��w���&�&�@�	�ï��LP��9�& ��տ��K�/�������_���Ӣ9�9ץ�'n$�1��=��I�Ҝ�ќ�"y�3�p�jΑY����V'"�<,�9CeG�Ҝ��&�3P�IG5g�4g,���s͛ �3]4��:͙4�Y39SWj��"�>�G�Dj��$_DګI^��*����$��</4���7r��tI�I���H����$�@ҫ$�'�K���Ԁ<\6��cI�FR?�."i4IW��Ws.�o9�cA�ݿ�r�Y�q�Y�e1֩����cĘ<�Κ]qei��ϒ�w����YE��)��O鏎kZ"�g1�&d�Un��ڿ��\ґ���.��v~��� �������#��﷜�p��#��K6|l��nż�߷�4^z�&��8��?g����uT�\�Pkt63dӾkt�D.�Ɩ6R�=u.x���sW-�w�[�3#~ mn
����A+�gx�l��-�l���ϴ�{_�2��ݵ��|T����}�kͬ^�x]�מo�n2����	�W�?�9�uQ֪����{�#�+�����z��)���o���x1�ƄV����n7��^�!�KOI��ǉ��g���Fѵ�6�?���������V��y���&q罇!�.�[���e�����c]�mO���l}s���y���#m�^$�Y\��a��&Vv�y���v`�r�q�YS���!7J3Oߗ�
[����3���M�s������/��0G���w���V��\jt�i^�ٱ�õ3��n�~�������V�j�a��'�G�m3�<r��m�e��%���eD��)�u�9�xs��e_J2��5M�貏>�Ӿ�+��FΓ
�V�QZ�l�5�?�����k׀��4��&~w����7�6m�͚���}R����֏rd�d���6q���N�ou���b�T՚qG�zS�gI��gw~������so=�Ļ���3+C�6�4��ٓ�'�n:\%�0���>�z�!�y�{����ҏ}��ο(��N8Es�a�Ϫ���+C,�X~}4��[>�<�u����9����ZaƲ����ug�,ܕ:�>�oG�\p{���_�f�IXrѿ���'��)����hx|�.��r���s�oɐX�Vo��[�zPV���3�5�#������4�M�]$��*c�6Ͽ���s�,�g���Tj�wb��'�����[f��jG�C˼��fŢ�]�!'oݾ�T��9c ��Ǜ2g�z&�UK���ʓ�m"sB8)�O[""���V7����g��{��-�����C/X�`�ؓ4�b�Yu�c�w�|��Y��j�R�rV�?p��?��7-����G&��a�N�?�兢t|�ǒ�������m�K��ڞy7��}��s��y�79݌�[�I���]p�DZ膠o"�/��.��iG�	]'��W�ܵ��օ�o��;�+�/����v`�gAT��0.lN鋍�����1n��_���|���מ�o��z_U�~)�ꩻO��Os��WO��b����6&*��>=���K���L��=��EӋW�/��b����%�o�J&��,�;�$�E�v̌[�cK{���?�m,��0ѭ�8=�ra���G�UO�����v��\��偋��F���7�w�X�J�����秆-ߝ3���O��y7e>�w�H��=c�s��Ɖ>o}:w���i6�C,:]e����W�|a���s���i��4�u���JT��ά�m۶m۶m۶m�V��Zk}u�^�v�3w�9gD���H6:�f��+7~�&�@2#�`x<~�n�PJ�g���T�*�o��R8K]QAK���y�,j&_ھX�a�v�2J��`ɳ��be���¾L�$ћ���đ���c8�a�,olt�̃����/�o8Mi;�ZG���g��#�أ���J�tp�&5�2?2�s�Ļs���Ӻip*��� �T^�z�=F:	�k)�D��\��iļ��	��'I Xf�ws�1W��e�l�����Ĳ\^�[�E-2��"XV*S����{�/�t�³���I4ly
c�^P̘pAKUU[Θ�6�Q�2%oQ��
u'��$�y��#No<��ޑE����ԣs�A���+���O�e��`[|�g��YA��@��o϶�VA��P�!�á�,�G
�^*��+(�ǅ�Y�գ�2#��/	������2:��7���<ܢ��G$����a���x�n��˰��|���$�u�Qg紀=���pc�cH�����!3�%�h ��ag^�q*ã9�kËN��(\��OOqa'�BB9/�N�����{b-Xxӵ^e*'"��]� �\�:_vYH��	�Ҳ��$Sw����H�(a�A�huzX��cut��
(Q�Sop���w3�Q�p1~�������o�J08�S��1��])�E4�i�;i��Ĩ��t�[�q�٭��߃쁡� �g��8�A�Y/MP����y��\F�/���2��Q��΄[[ji@����'��D��ct^W��^��Q;�bƔ#�h<Ѵ�����ч]�=�i�wh��L�(�U�vsR�������9�J|�s-�+pgf���֚�-U}��G |�u��x��_C�h���?��쌿�<���*��\�M�Xˆ��F�0P�#7X]�zώ����a����k���]����e%XTN�3���W������k�j���X��G���29��Z��DQR�N������ ��5~�9r��M�-�Ӽن����jRNkք�ozW`��6���f���G�"�R����#\����UAsK��m���}�߼1pw:�*��[�$�wc^�R��m��S�nG�	�����>a �6�#E������� {��iq,X$���#h�O�5V�'Q������L(����������'���ᒽ�G�핹����{�T��Vu����T�&�b%���F�Ȏi�����`E?�Qz/hl��\]�@���K���9Z�PR��_��u���S$�F�7�<$lR3�^�hy#e��s=ξ��c�W4��t��� ��e�AHk������Ř3$W	<�i�9���-��M��X��8�.xk��V���Qz(1}���(�(0��X��V�A�$�w�z�{ _�s�ʉ$"��;�IV;�C��4t�x�C�J�x;�{��9.�^Ӗ���?͡�iz�6�PoYҙ�UP�Eqо�ыV$5���H �%7t+�!��ե��N��"���1��`��h��>�H�X64,�5ݐ��VVsy�C�^���N���f��ey���gǟ{$�6�k��tTDkV�^�HDʳ �8N{����?�n�6=�/���no]��sጺ&�c��J���pm7Ul@X�)p��0��v��$�(�/|�}��S��_S,���=ָ�U7�B����x/�V�f�풃�Tj��G\��ɡ���6���-�-l%g�N�ex�[�;s0|M=�ɲ+Y����Ԙ�����AM�G=5�����5��'�1+�ɞؾ=���"��kF �h�]�x��J�C~�q��>�J����Rƚ����[�ǩ���gu�V��G�z��XƔ�`��F�#	��@��g�)�>T�s�/xN �����mG ˯ܨ1��W	��Y��6�Ob��ʨ�>R40�a:Ye2�X����'q�f�y�1�
_������"<a��	b1�{\4��+�AY~�Q��6�vUɳ��M	�C�#D�F8@��x��CrY7���}M
Q:�U�0	�j,�6��f�R3.W�s��F'Sָ��b���~&�jo)��
�5v��j+Q�W)��z�Z�$�{�I����Z�����3�<Ვ��~��qA�}����Pjܥ��]����ʺ��Eۻ�i]�gT����)\�c�fz|Y�l��p �uȨ����
�>C�9����`�����)�^X�-R+��g���!W�
�¼�f��I�9R���ё�8����ۻ�&�cq��*� 0��������oH��O��L�<��^j��;Pu�Dҗ׽B���9��.p���<w���YSa��,�5R��1��;��v�u��ﲯh��5�m{��M=J��+�V���Y�"J%�.}d=��G�Dx'��'q;z0��G9��;.���Ђ�G�CUU�mV��r�,��I���'nr�s�`���X����7�_w�~r��w�Q�,"&/�ad�4������j���]���2f��?uQ�b�}k�0���ժ�EEO:�:r�̈́��B'b���yS�m��oa�{�1�͐��7Dz�*�>5���R��8zҟ��ʢM���f���̐��M^t!������S�ǔ	�GɼT҃f�(T��35���͞	��Ƈ�OP�2D�N�FI;�E�葴��rXe9��WrB�Ld�<K�����+1H҈���[8�#^[�%ID� 	N��	��Ϥ��K�7���Ⓥj�#��𪸰��iUw3�рs6U+Wo�����a5�=4�]�3>ZM��r�.��8�{�zꟲ��d8�'��ܡq�"}�/�!���_=�S�e髍cA�����CfLp��rU�m���d��.�n��(����eqZ��BQx�c�����(o��⋛�Gh��^ꥑ��Y�Jj`4;��Ǽ^N�F�O!���o?�i ������$E�Y�g����w5�X�͊Gt�Z;=�h�@~�f`ِ�w�#�W��9Ak<2!�<C���q{2�p!��/�x�|}�SEŰjh�����`��M�9�ҟ��̂���6[�q���(46 }�Bi�bg�hA����+~(�p��R�å�	���P\�]p˅-�d�{v���$a߉M�&�%�gWk�.���Kk��g�Ӫ�-�E�ĵ6	��&V�F���	�y�{Sy�Gr�3�jr~�̝�py��I�wh ;(Q�P�O�c`8H�'��b���;��C�T������r���h@.p�ӛW�e��y�:�[}�m��X��S7$��%�C�M)��Y�kc��i��o2}�wtߙ���In�Xg�i��Չ�e�&p�&qC�!nw����=Ywf�A;�����ݕ:�o�c�&HGQJGz
�9�㗑i���ljb`Ő�Kw����Nk`B�<�(�ߩ\�$%�t�u�]��rW��Rud�Kd�q��Ue���ZVq���$;<�~����V�<�l�C��0\��]ܝ>x�[�s��^	�+6��Ó�Us��89��.�f��ej�iO|HJh��j�B��E�t(\� �S��1P�ڿ�iDb��^�Z�m�U]c��Dy.#^1O�p�*@�$�G�$�2���*�Li�;9G�rmE��&PXJ���~�9_��"S��,񦴂��.�1ݯA�ȴ��	���L��$7]�ƌ�u�v^�KL7�Mk�S'c���@U<����4�u}�����UbA$���j�u
�L���԰O-�*�c�CF�~wdy6J���6���M8�J�����FHw�����&GK@M�f�m�9�C�=	Ģ^8G ���w��ӹma�	1P��J@x��w��wDq:���P>�����J���C*|�O3�-�%D-��蕠X�xuZ0�)�k�h�2�Z�3��M�~�S��s�	��hN������4/�'��� IPh>�r�%�yWڷw�h�5e�W�$� M�<S�ֳ/|����,����è��<�������Գ�=y	1SsWa�p�4�_ �-����&7�Nl3;U��9w�n(�Pz��~��kU�S5�]�zN@�����<v��]��R]&�7���?Z/ny��O±%.�a���UUS2Q��Ȳ��%�ߥi�{�����5Խ"HY�����LR���2{ؖ+,Œ
�
i%{��E.�7y�y��]�[�Ҿ��Z�����nM֓�#����W_N7�(|Qs������v�`s<|ۓl>�̃YccE�}���N2��m�}�y�e���brzA�/�L__~��}h�NK�O+�e�(E�K���m?��:U��z��x-!�!�YOX��Ko�$PJ������4�6����_��AC4q �q����dͅ\�p)�^X�>J`SN�p�_Z�����ҩ(�[*���myO�b��y����Z�j�Y��I��"��8���^I�6���Lۆ��l�X��Zs�?[���0�Ì����Ѽ��q �ސ����%3g;�_��̀{0��	�t����u�Ρ/AeR�8�g5@i����7��k��f)Ri1�������[M�{��a�7���?��ָ��%��%�.'A<�@�b����p�����1tk1c��Y�d[oQ�|���wJ-;h�[��Wڹ.�
D�wݜHOOT �$�Ԛ�-����";Z��|��0"ߖ��)�
����{#=(,�� X���l��&��K��tDbS��&��!ҘoX��3o�D�l�lp��)���]���+#�i�e�W���8ȡ�,��c�`�+����0U+ �yjMA
�y*��D�S_���r"��d��ʍ<`||��3c>{�cM��G�/z^v���-9+�J�tF1�^�kñr����y��!�t���;��j뭴g�����0�'ڒ�������H��X=��F8���*�8byg����g?�]2 C���x�<��e����f}� 9 ��L��g�j�=��̵����ꮍ����I�W�Y���ʜ]���-�w��׷?�a�x��X��
�&B��aZKq�+ł5��(*a$`0,=b�18�z�����x�C�F��d߿��Mp�3G��qG�������68P'\3o+̵މ����*QP�e�}�A��`�>/f��������W
)�D(Il��M�nm��Bl����jC��d��g� �ĸ��y/wI��Lb��" ���X�N�dȞ.��5�N 7ǌ�.?�g��C�bo*'�Һ����N����/�|��Z�_��)>����d1�5bO% �	�,���}U����id ���R��HM�(]z�lQɞ��I�u�V�H��}��:��e)��̰Լ�@�*�k$����M7��5�>�g*r�N����(����6��h|�X9u�����Đ��)�'}����s�d���ֆ-|E��+�l2#�g��*~Qŭ�?%b`tM�q-΍��mU`��s�&��z�eȣZ�M��@�ZKZ���� 8G�_�D��{τ=��9hy�H`�|\�A&`$$��	Ω1��2yG@\1���!>�jZ�h�������NR�f�y�D�ݝǒ����֜�ͷ��?a/�?(R����\#�뿉=C׭�YG>�u(�fq[�B�t�K�o_��1�c3i�����51_ *��]�\���H���!h�K��!Rs�0cI�o�\��5�C#��p��~O1~x!�p|R�c���S/d[0����Ln�-�a�����.Q K�b�q��2]��� ���Đw�ml��`�3b
E��t�P�ů���hRf���j�����O��`>��3�zj���_����x�ә��W�I�p<�#R�J��Ò<���H��wr�ݙ���y��ᡌQY�1�����:�+�,dA8-�4���yW�"7���@���kj������u���>q7X
���T��XQs�����+w�k���%��/׫���!H*��vk7�T68�(	3A:ݏ�GS�atoؿ_l���n�3��?�N�e~��v�r<=eC~�K�T�H��[��%�L����l�,��he����a5#�L��)<�X�g���&���o�؉�bf ��gj�7�z���Kl��Πr_���)��̍&���Uo��WR�.��62qBo�)ے��3��_پ4+e����ߪPi&��b6�5%3!��M��;h���:#���⟒W%+�
b
�C�� qE ��_V�i������g;�<T��/@��i6yr��i"J�Ҷ~�oj�$GF-�^K�j*V�V��`uG����n9�:iLa�ȫX9ȹ�ʖ�������G�?ѷ;���$� �5G2�3�Z߬�#�ٺ7����u��w�lU�̬�e���P�
�H�w.��k+��'hgn�=�4�L���F�aj�O�
�_$/+(ys�0�������	���P
-Q�����6�����ɷx{�d#�U}ApL�T�K�^3�e�[�d�*�cKEc�������^ŷ�=�*�G2�r��u7�M�oS�%�2������|�n�x|�{	�x�lQ�h���p�m���v$%�F�x#�dao��;��s۶����A���#��#)��S��@�Z�{11�sm��8���E�r��r�'�^Mz���I���l3�+
�L�jvK����K�uOEv���e=�w��8|ˍMh�}�TwYMEe��zf�$9��zAk�-(H�S�2c����3"���BZ�5A�����䉖�q�v�{�?V��n�&,ǖ%G��x!�����/y�����8^y����z�Q��4��mF<�p�	�r?	jEn�4��~�.�?+.�Ĥ��<b�K�Q�Yҫ�K��$C�i��>'$�ʞ'0��ҭ�3(�%yGf��Fr_hŷŝ|��4kc��iK&�)W�k�2ވtUZ94����΅�:�5��e�� U�A�Q����RƅCL�K֦����&�Sl��=0��v_q��r\i���@��	���+<ohLa��1C����O��ÀmRAwx�����D��u��~�Y�k�Q&BC�[��n���������z�nEJz�ɀ�8*3�f>@ &�����h�#-Rg˸��l��TL7GmBuK����\n�AAG���#��tm�>��0�_�}�i�3��W�#����	��� ��§���d�dN��?Oc���;���ҲGt�YrA1@B��+��@�I�kǻ���d*�F���?S�:<�)�c/ȯ���_�N���Q��%ɝ���V���J+c�4���zK��M�A��oB�)�`����v�l'�<�����Ͳ�Z�:B�ӵ�w/ �Y�vog�?�l�V4�eߧ"ǿ����y �0�H)�cbƕN
�h�C;���Q'J�Ǎ��a�S �� �UA{κ{ú���vp�%����h>�,t+^��;���-��Gt��`�I�:�?	���}�HA�]����s�l�mYr�+�Jzq��h��ͅg'&'��5�O0pI�����R��z͋��Z��px��qMy	.�ʦ��1�M!��{�r�w@ԔP�~��O�`���7�0�B�K�W�t��^p�Lʷh�^X�#�Y�pp�'k�+����1��s�"a�N�) ��=�TfD�O�^�f<��ԁ&C>4l��R�=�����]��i����cX
8[���F:w��3t+�����4=Hk�����4p|T\B?�}�����̧A<�W� mkN�!��_3�Ҁ�
	r7�s�r9�rl�_ncgޚ�i�׻_H[��I�W�+ll��=�S�����qp�rc�P�Qe��v
��p���G����6���W_w���!2|�=,E3G��)良�ӓe�M�%s�!P�d7��s
?Ёh�q�����lM'��ur���׍�Zm�(���`.���n�O���>�^`#�`�I0O�NR]�ȭQM���аV��A�>B��ޙ���|��3fsT���l'���2j��S�6�c��z�Z4���ٟ��Zz���բ���i xe���t��TR�]�CX�4�����͠��q�]���h@�¹r��W��(�]���z98-yV�h��f(�7�o�J�*ߋֺ��|��ogI�b�q�:+� `Z@��T����H�7��w�q-.��d�J���>�=�Jv,�E�Q�ͬ�ou��V�ON8���۰�S�e3�̏Q��u^}���f�U�I��E�x:�S�j�2Mm臡��2�i)��F�m���H�P����ݹ���r�u������3fe�We��EIʕ����WZB�r4��y������a�ȵ��9��\�o��{�O��F�}]o��׫�⬦�h��i��ƾd�6��ʔ���9�����`�4�sR��(!U�e�K( E|b(T���Xk� �l?ܕx�*�
8�.����9������wg,�䭼�?|Ǒ>��\����Sa�HJ1-:Ll�7�$-����jv��3۳?�j��=�,�����Y+`Q<����/.#6���,�T�=����AEJK3�1����4�ğ`���_�ۣ�Xt��`�P��k2����w8P7)��`Y��	�>�ף8e�]*�V�e5�2�v\�Ay%�:���
�s@���[T���s��0!����/w�.��H]�q#���t�i�0���J 8#m.�!�$�,��D�����QqD��@���x�v������kC���c���i���TM����=N�w�J���J86P��.\���O�
}o�qv�9�(�.�`g�����BgCN(�O��-`��mKL�	�� A�,�P ����&:�M�@�$/���i��`b�ޞ���i�1���f�}�Gx�1�2�F���&fd��~2�>.e*���:\���"_m݌���;-ܮ���u?�H�v`L�_�%��y;:�' '���H�,w`vK[֋�і��������/
"3�ro���Y�zz���p�g{���N����Z6��/6�m>I�~3A20��#��̰A l��!;���.��tˬ�����
�T���OU�>��+e���UB���M���ם�;�x�<�%mVC'�$ �:^g,������5������}��^�e0z���e?p�du���G|!�X��g�8R�z�`��V(긘峽�=����}������ĝ`�����������
 ��,� ��bd�V��J���g$��OL��?���n��k��QN2�Dt����Bqqȥ��Aiܰ�[��5���ɝ�-&�s�^��B�.�Q��vD2�/P^%�t��;�a�`�0\����,��g�}(�<���0,�i��P�/���D���&�U��s��ꢇ�V���8Fy9.)�2����75h�S�F��dINc'<��n#�^�Oҋj\�s.c%o������{	���!�5��G�c����-wА&iıH'����ov�5�F��8�:ƥ�̪��
�
։�ba,m��a�>��v$�ݴ�!��;��޼a%�<�4(��1���9 ��?ْ� Iղ��}�&�����|��\��e㲊%Gkg ;y�m�%���0w�-�2�ƀtՇw�|���V�p�w[�������j���l�S\+ '� �j�!Cp�\OƗ��?��O�f�N~��X|��f�P�|S�F�:
p�x2��
'e�n�[c+�k�m3n�S������/J=Xʻ�<����)���1�0S	�e��	����iv:"ې�̮G&�1����������E�h땢@
�=D�sT��bb a}�k�[$�M��?+G|�C}��UnH�C��ٝUG�����"mQAt�ѵ�H�
5��N���m���i���A���,w�!�� }%�6�}�q�Z&��"�p!��ғf���`R��T���k�	��ח�
	蠃U9ңC�S)?B��g�gj���R�$���ˊ�����:N�l'�H3aI0P��5~� ����F�D$dr2�K��9���Oŭ�hu!m�!�� }��@����6��)�1�����Nܣ������,+��8l�soi�]C
�)��0���V�����N�\@�#������#�9�T�3��,88k�����l�����,k���D�����^Xg����n�j�lOɉ9fnA�\���K�0(ԯaCU��*�[�(�=cz��P����P�s�aǸHћ5`#����q3���F��I�g�}��p�:��1bE���
�əD���k!eq��v��K�KS,���+�����>� ��}��(х&��e��ϐ��_����\`��0�*b�GT�И~��]2B����G";DR&Bj?���R+��l秵���y���ȉ���*�c�K �I��^�)'��:^%?�(8��t*��9�=8��!�]� ����]�\����(DH�J�5=_�!2T�Q0� ���L�Do���6 (k�J��s�ڹ����ݣ����ʓ&81K��U3n��c���S���eUX�uƂ+��r��N��<��K����\MD�}�Wu�K)�t<���'@;<��a�n�+ȕ�,	:R�5$=���G��9y�SU��A�sn�F�S��A+|(��B�uJ_5�2�(��r�$-�,)�}>����հO0h��M��pp�TpW�v�����B*�R{,
Wqv�8���;H�ىBʽg��	ɳ��S���G�1 �	n�E�z^�vK��h7��1��i�&��cCF�j���=�T�4٨'�_��ǣ�W��f[�%��!^(���(�?*E�+�n�0.�Z��.���,:	���"���'����U���.��ͼs+�r3V�T�� �jF[Xź�p�Q,�D�焙<����\�����%�x���a�Zq��3�^K�L��$�4�jz�T� /^�����k����Di�4>�+x�P{�K*.x��X��$!�ޮ[��9�T��޵S?���4:��CW�HC��t³����c�L����j�7ZP�*��l�NQ�;i����,�>��(9V� ���g��,�]wעЍ/���M'�;�%�$�zU��$��8��"R�IH�!�F=�7����h*LC���Oh{l��[���:HWCy��aC��	�%x��>h��<`��Wq�򗭯�Ԅ����և(�Gā/���-�Tj7I*]1���e��@os~7@�'c�'��-��XYem1>.���/:�6����C�*�����g��Xː����%��0IHY#}D.%�$��k L���t��oc:G�b�4{����wD����j�ñg��b�ٹ��rn]�8_0�B�'6WoV��s}tMŅ�ו��t%��
c��kE�=�}���JsH� Y�d���%�W Բ��5-3
Q1ǓB�9��83�v-͑0��G�x����mk�^=p)NL��߉{�,��k/��b/N:XT�0��ټ���w�U�
Υ]� ǒ�5, �y������l�UB9v�w'�U�M�C�֏,�)�F)}ګ�(A-��z���9�����Ò-�ݓ#rtZ�M�E-�߄b�~��W^���'�|RvdE:u�m==����*�톨��~����wb��-9KPz������Pۭ5Mn[�Ǣ�{rդ��P!w�3�ӊ���'aB�r�	�&��Z�e�F��Ak�ƍ"��\;�: ����u�6�LX�zV���oSD^;�ĩo{��e��+��g2c������Z1'<'3h��P!JX3f�`�a���`��~��ǉ8����g.CM f#���-[�����V�s̥a�����jET��O�<m"AJ��������Ő�AE�Aj}bﯳ<By�A�8�����V�*��
U���DT���'�J�̙D��S�E�0�$����ɴ�ٿ�g��M��4������ʺ�YQ5�I*}�Y����]���@
$�4�*Y���z`��6t|&|
B@�����z�[ѓ�r^~��[� �����.�r���t:ć������(���Xܥ�vpt`��T4�R�O֎*�{l(��]��璯���B�R9����6C�ᗃ��D.�K��z�S6@��2��yRk�F�+���-֯�%���ٔ��TN[���&�8vj�F��$��Z.�TI<�)Uo���v���u�2(;mM�����]9Z�l��@\nP��gX�N�c��Hc"����,,}8�$�zd�p|���fUx�ڳ5�K�f<�+��Α�r쏯��,[�HA��D��r��0��D�l�E�	�;`A�ڻsg�5�{b��33ʚK`ߗ{L4h8:g#oc���4<�����0���(��^i����[����`�
V�Q����@����6=/��;����Y����k*]v;�<������;=�Fp�'�'|o����A"m�@R���4�	na�|�~�	7�����|ϝ&T�`��imc���>��ٔi,i�NF�T^x{-��P���� xԮY��n�N�q@yG�ֆ�� ��Y���(מ���t�2d�L�d-�ImU�<��3�u~�Q(�!�՞��b5��D2�G9����G����{۳�n�{�M�G�<���W"P;8d�p���u7C�iٖg�=�wZ�3.E�r~p�l��a�f,c��~V��"�����B4#H+�LDg��w.]@�c�ɇ�pq"oZ�c���4�{��8\ʉ$n����v ��+Ä����j�Z�pZd�70�T)�b���F��*��糟�[?�I��g*�D.���H�/>58%f��G�8����x���I�����*,���<OФRp��X�c^���V�Ӷ�*�����:�����(U��>=֮#�B-l��h�4F�:E����T^�ν����)�8���#|�X�`����m폌�m�i���loC5�$6��ޑo�sb�"��p�o?�9m�n�<G<�j���?���.��<�j���Y��Z9��
Pi�ute0p��T|��}G��t!C�L����h�����u�����ے�<�$r���[;ԐjզU�+��n+��'���Y���059��
��<q�q�]0��<D���	�{p���D�U����XtFQ����:������$�o��}Q���P�+԰M�~�[�2ӛi���LN�g��ZY)�P6)����Q.�["ZH{x6�JG���mc!�?�&J��k�g��kl�����B1��.�W��3ejCtX���UYI�-"Q�bw������ש+��2	M�̶�����1��@O-��:�	�f!�_���$H�aO����2ɬz0��}YrVKJ@��u��N"5��`P=0�C��[J��h��8��{���[4 Åas��/ge�|�x�7,�u��5�f4�Si�O>W̨XT��O|�RqKq�sm
��|*P`R�i�,s�����\�f��e�g
Fc5��͑��U�zi^f��.�Inn�N�qm�����n������t[���Vda�'y3�]��^3�K�vH"Wo�K�w�_�e�E{��|Q���~A�C�6���B� ���lxd�z��Vxt����tTL����i��h��h ��M��t� �M��l ��������M-�L����'J�k��3ѵ7�6p��w���:��눓���?�^���?��Z���ĿZ6�i���?�����h8��cm��8��@�A���D��N��P�����j���������G]KS}�^�_A�u={{ j}kKKC+��y���z��;�w~f�]w��2�߽H���"���?=�H��O���x����Ϝ�/�����f, �ۇ����k�����������!�ȧ���� �U��?��r����+���C�������;����N/��������:���f�~���/���wпj��{��w�����[����w���C����1������ �]��/�?4�����o���?���������?�?����O�?�����3���|��]��?���+����_~?���������������������%?�w/���-����W���>��5���o����������K�/����|�_|�_<���?OO�����ˏ���_*���Wŧ�c�o���|?����j��[�K������f�~�t  