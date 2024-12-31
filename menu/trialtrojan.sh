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
���sgtrialtrojan.sh �ZyTS��	�*�/���!�PP��hPhAAPD@A�(ZP1R������ֵ��h�E6�ZQ�[Ŋ4)E��3�^����_��9��p��wf��μ�f3�k�� �I�p%�nF��^��K0'��J!�ץ���������Y.��{ҡ�&eШ.�=�jR´�����#MJ/�۳�����I��P��&���E���pb�f9&UNIɕ.����I���K��P�ד�%4��}�#P>��'�FhRu9_(�G�����ET{��e S���}Jo���)1�cxq��ɉN����
��S�MԜ���?��P��i���8�Tts�X��i��JG=���8�6nv���pg"l�sE�J?��Ě�ț�W
�rw~�6T�������etO-z�E�I�?�Ђ�k�Wh�Oi�wk�����E��F�7ւ�h����-�-�-�NТZ^	��� ����]�	�Q����>����K{�Dd"OH�xq�("$�'��;;��aqQ��I����"�0!BO������G�F�
"�P.2!!��0!�����x"^$��[���D,Y�C�@�����u�D���0���2$<1,$���I�	�11�M(�O )D���0,AƋCĭ�%�Q.p!�4Pq$�{yΞ2���������T["���;��\�#������"��V�DBu�b�qTS!��Gq�aR�5�P"s�4LS�:�i�t �g���3
۷�����E�y�%�g��OM2E܎�+�5q5_�ֽ>th󪞆��p7��
>��+i8=Ȫ�+��������){�i{	�?4�I�mh8��aG�Y�8L����;g�p.7��>4ܐ���>4<�����i�1���&4<�����-4܌�h8=>���~4<��[�Ǒ�[��lޟ�����4<��"zSo�M��7�����榱�c(7�T�TUs�Wؗ��*�?A��n��&#�!���H$�WA�~�x��ʫ1{
��//�|��A���rģ�U~�G[�<����R���x���?�x���C1�h+��`>�h��c~'���)���Vģ-Sn����GG�)���N9��hģ-S��D�Jěb�1��f��/B�9������و���c>�� �һ���=%5+��?�������U�s�F�1qI�T�c��[�s1t)"�ۈ8+��0�����4P՛�؂�LQ������ɕ(�e/ܸeJ.��[�)��
�R�U�Q�u�-.{��c����z��J��r�\6ڢ�z�H��U�x���ܣ}�� �2����Y�+���2�xcfɸaRjr��r�,�IP�6G$.e�`"�́l+U��_Fp%�2����Ƒq%���Z�R\'���I ����B�X�ieT�`]�yV1�|�5�AR���ʔ\F��S�@��aRw�R��;p�
7����0冗��q�j룺�0
�:���d�R�/��K�_&�h6sS8Jt�M�m@D��@��mNW�N���l�M��;�A �~��2R�0P�ؙ�n�N���vlWw�F�莭�5I5JpZQ��\`�F�h%�/�T!�S���d�c�������c�@s�R,&�t?�ܴT�I�q%�d;!V��n0�G�Y���T�tѢ+Ƌ���ら��$U։�x���'�l@�8�$�:Q&]�J�9GAhJf+!�Df� �EY���t����*?���Mɕ�M,�+�+NV�)x���u8Z�w�(D�,Hև��ĔV�ow)���^r��,�t��-m{�/2��@ֱ6�^�Z�D����T@�(Gk���/M��#����e�ٔ7ҏ`q��#D
L`!�\v��[��!
�wC% I8o�c"�6)�������Jg���GnIj��rh�	� ��լ?���߷Q]/߁��y�6�#L��c�9JO��R��l�����8Y�- �HU�(�r�'i���uh���@Q�t���Ds4e��v�R���aM6���$�5^�aW�)QS"j�C�)��$N�#D�0`�l�wO��^.Fm��M�2��D�Q`y	d^mh��5�P�q����/�~��E�R� �t� '`i����� `A+lPdN �9�C�A�Kpg��|9�/L�� ���ؐ�%�{�juH�8f"��#`�aB@8� 6���n`%($_�G"\ܪR��B��#�!����H�((N�Cl@*�*y;�!�;q�!7�k�/lţP	�PI�əU�D��a�͐�=��j����cޭ����)��9��Kfw��Ha8r,zr'`� ���> |h�xx�����h���._��#����^n���s���;���uy�M�a
��b+�#F��G�e!��4Ձ�DJ#@����bǅ.%赋,�c�g����pmR��cik0	��&#+Gv�S��4N�ԇ!�G���*�(�H�&�0`�Xl����!��6�.��7�Ϭ���6d&�g�o�S���͌M�4�����if�l�(�Ǖ�e����<��)J�z���kD�ÿ� �x�w6�'-XIF)?�L%��D�\T�4�Ŀ>��=nG��Jt�L\ʦv1C�{����������dEo ��,�';��P��-�#M�\鰓H)S�d ���X<M� s8~��� �%O=%01�D���Q���t>^J�+�A˃/Gٚ� ?h�{xI]���X�)����)i���|��J'W��k|zF�վ��:t�C��� �$��$/�J��PY<�/3�ΏE�g��`���+<B��K��"���\I'���x0?i<q���������D�D��:FdeA��:�!83��"y�Ց	Va	���[���ƄX��'����D11�1Ê���V�C�1Dg�6�]s�K���[�R��N@������La%l�N�X>@�a����}��y@��V[��h0?��N@�p��t �,꥾��3c�"��h��W����7���+�+T������>A���/T�P�z�M�\`�g={�6x�icF�ˣo�6P/��?*��P���0x�~��c��\-��$�}�-rE��+���Rhț��E�k�5yy���2��C4�˺���T��0hr�����C_c�O/?��6g���Gtir�XGg�.VB:���r�^��]:b]fRB}�tV��&��66���4����J��1��Śkl����I�?��=��������f���lだ?ۘ���Գ�a���� @"ঽ˿7���ԛzSo�M��7�?M�{^�{]�3�}������;Z[�KV�5��cC(^��3���{dC{�[:U|�S���w�l�KS�S�\}ʓ2T}�I}�ǲ�]w��I��ӥdh>ש朗�ճ5q����
��h=�t;)>�*��xu?+(>���Q����P�+��y0��K(E�u���(z��(ZA�{m��;��Q���St,E):��K(E�uf����%�L#c�+F�i����I�H����2�8�����m��
�@�_�}���#y�����Ykʲ��x�>x�To���'f�x�r ��;��qK����aV�W��f�t�W?��뺽>ʭ��7.�Zϩ[]y���1Y1b~ܵ���o���:rqv�i�lON�[}�;\N�*waQ٬�m�ߝ��79��#���~@yё��\��?1��)���O3TJ�M����r������z[���+Vن)�3i��M���<�e͡fW^�ͱ<4���á���O�}:qqA���3���W:5n猚#w:���;����s����7�C�7�=aq�꛻�]s��
2.�X�_�s�X�3ۧJ����t��9�`9�q�Փ����Rs�юy�D��ܟ�|�p󾋃�������>�$�����M2nU�����Y���\�k7�C3��Fg�pvy�~� �3�6]Hxv���i��{�������ڟ��x��^��t���[�s�����m�'0�	o�7빹�����51:�����Ͼ�g7�?(����&�J��r����Cu���x����fS�����>}7X1����~r�uq�얋�o��.����z��'�����mi�}���˗�5�0��m��es�#��;�����C�g�^����|����j����Ö�2�Q��腟-e�ZT9Mi22�zچ[W�=;6�3yI|�A{Cy�Q���������)�!Qĉڼ�>V�蟮��{8Nv���/���~�[���qw���W����:��o�.	�����t�{'[���Ut01�!���A׋�e����^䌙k߶����>wT��Q���k/�U��t8p��џ�F˯?�lf�������)oo��2O7��,�5�N��yٺ��⺶i��3i+������?����m�'��v�d���fc��Mf�"wT~Z�����߻=V��b�֟޿�*��@o�㻊�3��/ק�,��,�O�y㴰q�O~�+�|;���S�y8󇭌�7ۋK�7��tx-����4�5�j��SY�9�~�=W<������2��Mʊ[q|�.��S;N���DR�m��#�mSZ�(�i~�����:L������L�<gY�A{��������8!}|jus������2�X���Uw^�3�'�V�ʘ�GrB�3��z���L�:)���N����>7_�V�W����?���--�����u{6v�9ˁ����sS�ߴ,?�|�jטA)Y�IO�ض�>�&�G�qa��9z�z�N��>Y�٧a���}�)����|�щm�rm�s��j�m`�.�w���ِon��~o���LϚS����n7;�4���)j�zn��@��W�v��]8_�=h��������eR|f��$P���Ѭ�5G�4?r�/�,[0����x���`k����QJ��sOĵ�w�[��o��.gFf����M3?��uָ�o��͆	���Ϙ[����B�H��־*��l�����q�������%�ww�@���kp��};�s��?߇�j��Qs�����c�%n��Z��q@��]d%2�v�����5@�C�
�5r;�23'����Y��j]5�X~vXfZo�L�Yq�	O��zy{��u��T��WiI����[��CI}�q��S��짼��%J���1�������h��I��\<���W;9��F�ƻ)#t�q%�_)G}�}ܖ���BB�B�yG�T�_�_�,č���֗*����yh�$H�p$
�V63�n�����U~c4�*��("�������q-0܍��7j2*�� Kbi����zj�m���TŰB
F�rǠa�968�m�%�Eʻ*�$I�l�6]`-�A�8��a��l��s��{���xL J��twft�s�m
f@�]����a�) �( �ܠ ��
��~����8�NXH��t�Jb���~c��/���-�\q��sjPkS�Ϧ��c�7����!���� ���p��S�b!�Z�_���c����#}�8�WvNґ�y�v��_7�V&���)��`.s�hU^�p���Z�Y���>�C*k��	f�6E�.i@�-��4\�\Y�x0̱9�VV]��N�7�~4N.>$����$���U���	!b:�wLt���Hyb�v9'DL���d���Z�([�z���q�G?{�^�l'N�s+��E��ϋ�:�SIM�g�i�S��&��U�9e�Mw�y�94��j��Q���c�?�����=��!��?6\35I�{���-Wzk'��%��}K�d}�U.���6=�S5�-.�1T#����8ڂa#�f<�OY����&�:�6H[��(�/���Ɇ}-!�@�_B���jW3ӌ���2����I'v��a0�ۖ=T��F2[����]n�C��O��1���%.t�k��Q=�9m-�4�^g\�s�0��{Q$����]�����Z����[;ZB⶝�l�O|ź��y�A������HM~��_$��o��%�ի�|���RM����bǗ�ts9�E�/#�P�1�_,���.�е�Q΢u�d/q�H��Ii:	_�$��-�h[�u'?)�j�@�_��s���5@j �l
Q�/��_�|9�?q�'��)SW��V�]�#Wv���-������9-7�d��{i��`��L��s�������`20��K߱�
"����+af��Sk�d8]�NR7˷:�i�C�6����ZJ?7mvDU�~��rT�IXC:>C�N�9�bc�i{�f��؝�>�T�f�9����x��Wi���:�"gpL���T��|&0�i�IAȶ��qN�`"��V���:{!HqC�#5��Su�잹'���[f=a��z���G�V(r=E�������l5~��RΑ?B^�'�[1Im����IP�,M���s��>Kפt��+�$z�.����I"w�XH}�wY�
�9ĩ*���ќbv�l��2���y���u�h���1���}�FI��ny�9�/̄�~*����,��is�LYp�u��dP�iNҺM�����~�s��݀��aVC���� �(M/S�g�}l�:L�"��
�Dq�q�n�Oqڇ�;���XL�Ҷ��!�v��t��<@?��!�yg�-gS�]f�05D��'v�a"��W��\����|c[IG�����ӡ]�F�����2����ч}0�Y�n^�K��GUtb�	���������m�sw�|4袥P������Q���Xz�����j"�Ҋ>�(�!��!�eYm8�9tb�d"���\��za�O�Η��!\h�~>�-��3���G<��U��zfpZL�I�J����4��O��d�����C@��JQr�d|���LY���R�]:�`;'"ú���.{F/��b�-�����E�����>�
;V��6��	�������̶��\� �:����	C|���b��G�O�Iz�����7�is�D���4��np�V�hD����@D<ϔ6:dC}'�8�D�i���北�]�ͩ܇i�í��U��~xڢ�=w@u��ո6!>�Id\���~eF�#��Ή�qp��G�J*�S�P��?��������)�_W���8��=�Aʐ���&:�49UGI	���.5�����( �_���)E@f�G
�����<�� 1���_0�A�C~a���}���i����w���ߞ���==.��z�r�\����ru_�8o��lkFs��^�(J�:ȭi�|��3�N�n�1���Cδ���%B��2ƈ�>D�d6�BC��r��V��b��!���n�e�9�=UDc<{=a�Eyjn q�b�����4�U����'�W��d��鞩���7q��/[���p�B[�P�D,�h2�d����(�Fl.�I3��:�P[���zhR���j�5OL����F�l'	�X�S� ��i�#-W'��j]BG��|M w8��M�^��c��t�\�K`'��� ��Ӿ?qh���dT�a,��@g�^��a�d>��5>/��	��0�@Ƽ`�V���B(�ڥ�2���~ G7��J�!{�ԝ6='u���ʹ�q�ma9��ڏ���)�ԢPl~j舎��L6<�m�������O�"u|Y4DK��+`lQ���Z�7�W?�$ޕO�&ps� �\�Cb�0
p�����]aT��FBVޞ���cQD����zl*� n����u���T|-��xX<�4����_��`k�0�~�9����(s��hI�P� ^6�V��L�B��� 8B2R��Է��٢Ty~��~md�>_�̍s�4p�Ut�������&�P����[��§gO0� �,V�n-@�{�
u`�c �<�h�H|i�>:v1�(�v�}����
	b��ӱ����6'x��{X8��;@�Q��5mƦE�kWǣip���G�h_��#&��MP����K�Aʼ=6\a��J<�`k���Xs,�H�>P��;as,3��`�q�X�IO��RN��d0ҳ��(7��ls��G�������3����6)zC��^&;�L��I�q��*g{�c�&�C���+.����E���C�^�U�b��n&�	�dyx�z��`5�&���a�M$5M�u��X����N�^w�DbkӜ�F~2>2��A��.1���d�����T���tn�r�I.�$#i ���]�$�VOi}.&ĳ����G�Oӱ���֢���~�%mOv6RY���hÌ�ߑc�/:å�TTC�oz�h�U/��x5��$��5@�<f�y�յ?�J$�9�/%��P}��i��!����WR��|]N7sF�z�N OkX�9�G��0�
b�,�ުO�aZ�7"��PW^�L�a><������/�\���4��QB�I���¸��RI�}!V��$���.s*���K��1�zN9,�ǑY�� P~K(���rA�w�ð���\��a@�p(��4���\bK�OԹ���58�.���z�-��!j�#=/�ǂ�Cg"�I�fP�i��v�j-�4����?׫7MalcY,j�RZ�$���?P��F~*-0p/��&�&EKR���YE�nr�1�b�{"4��"=G|���)ͷ�za�k�Sȅ��-. K�ӎ�jfS(_&�t/Fmz�E��H^׺8՛D���� !>[糉1��&��zʬL��I�	� ��U^�t|]()YL@ld������9���S�&_��5"��KK6����
K㏹�L�62T2.x�����+���yYKb��XFv@���V�a�������4p�g$k+H�\�n��8UÍh�ԝ�(��\,���x'K���%Ô1נ���H�-�Z`P����o*&�ߧ�u��� �-�5�'r����F8[/n���I6�HAe�K%1xP8*R&�diݾ֦m�>ʝ�����oC�B׃K��1��������Ȁ��s�����|�̭r���_g�\���a/��3�9�9+⪤c��.G�ӧ��$#)e�B�H�{�7c���[�1�D��_rKۚ~ѱ�������i�u�@ޅ�{��[�`M�`����hF*5�
�5*�^.Y���~TFB6B�ߴܮ\?��<2�\�k?M�1�jG�W)��4:^���H��ay�Ocyl5��Wt1j9�U�+�m1p}��G޺��=:�Zb��V+!��e�S*���O ��W��<��yC���D�+mzA=^ �D�9�s"H�A��	#D0R���H��{3�k�Ǟ�v��L�e*�����鄜���ZSU;�/�X��ø�,>��Z�q�֡UG}$ֿ��?K�����X��zj}K�&ǝ��	�Э�)��ӛ4���P�3q\������7�����K�	�%eT��֝Jńյ�����0X?O���ɑ�Cv=�Z;�< Lp��{t�կۯ�;�-� �t�+�FU��+�t]��[4�r�F�pޘ}�!�7�O��H+v@sz�9_��շ�*8��1��9k|ȹ������	��}��_�U�l��S&`m'5�Ni�SKX��vj�[v��gU�3=�~<Z4��)�Q,����i�i�H��Üg+���Ժo���	��:���ڑ����_�o��ڹ��P ��/�������x�����څXt��T�HK�����i��0H����2��)AG�G���>G�2�M�E��3O���+rF+5��7z?ݏ;4�^���n�I�����fB�h���j���5�v6\�P<�_��|�R���>5:w�O���	_=M�g�l����� 4)�;�q���-a�6���R� �c#��0+���*���o�%�k6�g�6)�C�N"�+������bb�"@�2,g��LDEȡ��J��#l����ӟ+Cs��^4 ѧ�vP���V�n��.Q���|ea�N�JD:�*�� �-�+�kǮ�)�����۽rWK����,mNђ��p3-�7G#��ԃYȢ�]�J��b��J �%z��\|�W�q������C\���ޯ���Bt�ȁ�)���0���H.ψ��_�H��˕�J���0S	�Dn�e��'oҞx&C?z��:>��e2u���D|2��4*k��=�$�#��d9k@�� <i��k�6�SYD���k4"�0�0�a�0/̤��2����vIfL_d�D{��Z��,�:���Cb����+=��P�hm�>%�[Խ�/��ʇ4��c�����N+؍�����&V����3\��wk�]��ǄL_���IB���HװAƃ�����iit�{mvĭ^�Z�`���T@j��y�hV�-��
i\�>i�%QW�d�&�X����}�Z��{��Ww����n�P�@(�V��5������Ej��~Ӈ�|�(�B��D]m+A�:e��6iP����T���e�{0��^�$��SN�5�`��g�c���C�K�
�L����7&����h
��>&+�@YhaG�,(m@��G�M��ٞS&�x�`�T�e�'o�)�:0)k�����0B6M���
]T�=���[�[��ki�4m�K9�Y<��HG�y�� ��*�i3W�g��u��NJ��P&��[��u��ecW!t����{4�+��l�4�p�����x8G<9��#�W;��C=��6�BC'��_R9��ZR�FY��ڛI�ZS�QM�n@,8P��#[���v���g�cS ��79]�3t*���H��̌k'e�x���#��ʩg�1-��>���Jl�-�ܼ\�u�2�_�pǲ�=�ɠ/���!�#� �N���T��")/�[Q�obx�w*F�r�,몇�Roڔ�G#(��9ʻ_��wWl��.AƎ�Ɵ��-��8��>y���������H����d�DUd@>��%`{�7��L��/|��ź�`����Y��Ѣٝa����@k`r�^�d���&�ó��)�k&>�O`�"��n6�V@�����:EA95c�%����"&^�'�'�+y+�T �:J���J���F� [�SmSD�FJ�X��Y�q�R?�SA�_6���fn�HIꓖ8s�Z��=ސ�rr�c����wV&L�j���Ҕ�X���@�퓨~��d�M~R��n�$�b%��8x6��q�����/E=�%>�4��j����*����w8:��9���epP�uu�eI<������h����Q)f��:�25�!��@=	�A��W[�m���4/<w��B���%���k�A\?�.�_p�Y���?�`��g��nถ���_�a`)�pR���e�7���!��f�x�ʏ����ጨ>	�~�h�*@�9N����1`��s1��*v����I
2F�:Y�l`O]�M)�Q[m�ٳd�׹�W+���(��K�}�¤w+ra��ݤ��i>����C9;�:��3����O�w������5�#W\`��/�Bu����*�1����Na� �:3HZt���s�|�	J���:���?+��g��B���*�į�.#Bm��j˙6�f_J�����z�>�y����V�\g0|�J�B��u�=�[D�f�M6�\�E�K����]��k��E
�#S�CAE�Q��b��0�g�{������,�g8����3���p�u�yQp�V���E����(�?�����rFhZO��Ūq'��$n�O���kh��V�O�ҭ�B����.G"�&!�f\�	��r.x��荒�H�S��f/��K�(ng����2z���AB�|%0c�'��)��i���WL�8�^b:"�����ʎ,�$��Tz�T: 9�a��9"�t���pV��WV;�Btߎ�ů0\Z�"ިX̤L��V� ���7�tg�M��s�����R2��f8>����/?U��-n��,b���:���"/b�+��� ��i�zfӹ��e�����(QO�$���Q�i�r`��7D���T����*u��ʇ����׬NY�R0�Џ�aydZ�ZT�R8��y��N�>\N���6��d���G�b�,�1U<<�Ξ����\���ω��{%�{�j���d�_�������E;��H�c����n�WHl�14�ϥ�3��2$�e22h-֒�^0N�����"d�6f��&Q��<^5G�����e%pH����&�ܟɁ��+�`�H́�v�șw�K�Qw�.���N�w�cT����j�e��|�q�I�K�sNa���<�S� �� �y�Ӽ��W�ΏS��cT�䧪S��u�ڦ"�"����WB3�CiZ�l~h67�f�i�P�"�H���I>F����|��W}@�
	��z���ٝ>�n�����vYZҫo�uP�������*N�(��p��e)܍W�doɘ�{�X�<����~��
rm���*���+�U�J��!̰y(W<����Y��:[�꧒A7�J�����XalJ�!lM��v(x��*yE%��ٹ:J�*r�/�����gj]h+_(�'��f�Ҹ�ܸغ�ycZ����kBڥ�@�;�ה�٠�v|��x�̶��ռBO_�a�P<�Q3�z˽�s��&�+��~���qȳ_q��/�>s9����銽�0bG��f�u�[�1�Z���Mz8إ�9J�o]�ӊ�R�璂�<�R�<B,%�����K�� 5F�.u=c�	@��&c�264��rmS��+���"���L��P_���-�9)7�L&�s�7^g�-�/�Tֻ$M�#uY���^�M-�����y �'�J#�M�!G�3	�;
IA�8'�k@�B���1�C���}�ʯ��<虶�!,'22'�r�ԸT9Vl��`��"	贐i��������o�_A��N�Z�ݣ]�A�n��w 4���M��ĔAt\�Dl��jA7�#�<{4_��c�>��d?Ę�{40�5 ����M��_fY΃1�74��e���i!cQ�2�O�g�A̡W��/�`D�MpF;��L�(���Ay��3,;vk}�X��9�`?�9�/@��wyg�k0dL,_��"F����Qv�Rܗ@���5�k`�։�k07]5�in9r$G��$!�ae7"	�>?В���UޯhO8[T� ����J�������o.�9A�O��[�2�>��1��!����Q�dCPZQ���]`��-/��De�$��u��)�i:a�_��k��xVz�J�t)�PuN�w��ѣ��%3�/�Eه�+:��N|p�FoK�/��2s���=0S���r^h�'��#�Ӝ.Eކh-3�Q�2w�ɴ�D2ᙛ�jz�<��c�����\�(��ekE���!|1���1��vnk�q���$�j��͑���P̫	��"��tF�Ei�:s�.hUӠ[�rS��p{�,���ظ�WW�����j�F��*?㽹Ҽ���<wh/х���G���AM���V	����u�8*�dS��e�2A"/GW���p�U��g�K����J��g#π�>��V�婌��R���U��e���xz����2�PT���d50�0�NA+�l��y���*i@s���<&Rc`�����ѽ��u;����C|^mh�P-f,�(wb���!�)%k"���Κ��h��*���E�l�9��H�u����pF�U(
�YGs��S�p4�|���K�|{�`&B�t�X���wp���X�ewLDs�����1�uCZs��Yh�����J��c���oy���!����M����;!R��a�_Rny5�oJ��i;�&*�\�Ϝ�9���h�I����J��g�"��86��l�K�a�zp�O6��7&c"H���`!څw�DZ����l�J"ٓ1���\c3��qb�'E��,�9;�XM�����y|pF�[V�#Ʊ5��@(�/��%�q=i��% �LV4gT�z$<:�O��L��q�
���Q���M��������^^C+�M�ᇂ���h�;���m�����da��R�
'��_CK��m�]����w�Ph�+v��F��ҙ�2������r}����y�6�-,*�d�����I���V��
�ِq�6��N߿�z�|m�`��6J�Nok�'�n�/��K!G>d���7��\�	��HA�}}% �A��p�&�c��]%z�s�Y�����%�%��
T�?ς�`T���y}F�tU�K���Q�{Tn�>���&�b�=����_�����^�VXʁي��ץ�8Pf`⹬g/���u����qc��t��ӛr2�=������|s$S_ryq�6+��s��>�U�5�D6~Nu*@�!�~�)O63�A�c���F�����``v3��T�$�N���w��;߈��~j�N�A���e�^�����H�VҖ֨�M�^f�b���i܂|�V��N���������y\:?�ʬB�Y���/16���A��C�3�K5+���h^���c��5���!������!#�	�H�F��G�������� p4strp�7 ��8;�ll���6� gs+#:s�߇?J�9���sf��f@ #wGw����3.��������������w����ϐ�l��Lm��8���5�����;���tM���u͌���UW��A��/�[�����@�� ����`hkmml���G��[����o>�����{C����{�m�w׿�.'���;���O-�����9����P��|�s �N��o��=w�w:xQ���h����P�ϟ�o���M��|���5k������o�&?��f�;� ����������;��|WO��o��k��}���9���o�����;>!��Q�]�������!����F�㿭��g��s����>>�������}�ϯ�_���r�������_���A�w����������������g=����o���S@�p��z��o�@����a�����^����?�_z�����|���;����������������_:S�/������3�;�Ƨ�/ߏ������7���?���z�c  