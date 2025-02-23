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
�M��gtrialvmess.sh �ZyTS�ֿ"A�bA�EDd��D.��A��QH� ��@�J��U�h���VqF��5)��P!o�so��ϼտ�o�oqXa���{��ϴϽ�I�L�a�u�%�&�eB�^4�7�]0���O�#�����L��hRN��.��;���&e1����vפ�Î��;S��&e�aV4މrt5)���܎�垚�ǡ��0M;ڮ��k�Ԥ�,M�O=�s���ԗФ�1z&�D��t:�M�&U�M�n�?/��A��6.�:�T=��Ǎ�����]����ǋ�qL����L����x��nc�u�?��W���E�נc=Z0�́��(%�t6�ֹ egx����F̅�?z�������x���>I���XZ�2D���|��@>G>F�?�߬���_���Z�[Z�h-��|�����OՂ���_[-�G����D�%�,��������g�ڹ�/详��N8�O����8�PE��	�E��a����(B,�����XA$/��L�%"£�E����~L<_v��8�($�b��1�Dl��/\���UDe
�!0^	F���"��Z'��@"�â��h�j>.EG#�`!�)d���xqx�8,&\ DW�D����@(�8~�>��Ƿ�ƌk�:�;a����A0�łx1?n�ԉ�"!V��h>4�8F$�]�Q�_T�9G������U�c`�:,Щc�S3��e�4�}ˎn���4�`!0@m4�yV=���"Sv�h��KW�:��.c]�3p}.g��\���x3g&Y�ze3�2*�| 7���g�%8�0pn���������yz1p'�b���\ރ�/d�=�n��c�1Od�\����0�g�,ޛ��d��yd�}x����3ps~���%�JW�*]����BJ��2���PM)먪H�NE�\��D*��ol�5�/A"E�
��=ģ�UQ��ۣ�}E)� ="(�1_�xt�*�`���HUda�$��Q�X��ÈG�]��}�GG�b!�s��RE�"�
/̧!�
�oD<:2V�_�x�H��b>���T�_�xtd*�m�_�x.�?�A�	�?�g ��?�'#�7�?�}o����8{���j�z�/�JJ���eЬ�v�Nf���s-�L�gؼ3���PY"�"D\��}`:���4P�[�G�V���`}�4DF��R%Y�jY֬K�.���Ħ�����>
�Qۯ��D��`R�Y�^�I�3qOR����C��K��E� �X*:�W�a0�\d/���E
�󁦲gM��T�L��	���q���a��j��`�$��Tv_J��M�	�YY*�R�$�&4�2����7)o�A�M�X�G����M�5��߱��ĪJe_�uv1���)�AZEFTAc�$�ʸ��\�A������6׮`k�S.Q���Gu�a8�7Q��At���v݂P��S�j&7��c솘D$I���� ���+T�?�m�Į��;��4� \��2J�(Pݱ�˝��X�4u��;�6L����r�S>��5�15.� �X4��)�^A�T.)�5�$1,���������󵰙Ȍl�#HY
�5���<rEJ��g�nV��=���n�t�xS�Z�'l���)�6��R\=�x;��D�K��|nC�,i
�=����KU+��BUk�J�*�8��6�U�:������LJ��l�W)Ij&ģ�j��}8D]w�)�h4�� �R.êg�UB]�(yAF���n��>B<�/r��~FѱסQ��s�:�Jz�D9��'A\�N�����b}l[̡{��L؊ a Rb�� q��'>v��`_�{T���w,!�j-�e��Ȉ�d���,uKz����pA�?]����=�B�"��*����d��y���3��p��p��$�N�d��J�Z�0^�{�T��p��J�Iݧ��J셖L6�#KA!���=����Z�|̈́S��9X��R>�N)�%IR-��������˛�Ѱ-��{2�UV��h*fQ���FA�%���e{�y��W-��x�=c�A�ޔ�� rak���C�V P�2����^��(��%A�kEROX\7l`���3@qw��6(Ԭ.�G��`LF�A[��Ȥ/���`p�/t>v yx@8}o��~�4�T��Px=PxPx�)���p%I��*�R��#�!;Iiwrg�:�҄g�f��H�N��*���	�M�YS1������>���y��=���W�N�]+R�:�c��E� 0D �.? >�t �����6�F8��xR\���y �
p^��v���wr蝼�wo�b��}cPlE��x��I6���P�N���� m��;ǋƳ}�"O�R�[q�����'��=��á2+O~�W�P�>#�%�G���7��QF��=:h:ģ!���p C�UALC�#E��|������kp �@{��Ľ�bf�c�xՐ$��S��Fw�6h�=u���Sw޹��A�z�D�s8�Z�p��ç�I4SY�{JP\i$��z��1�$�^������R],��r�S�;�d9��������B>��Y�[~W����#��dƀ�H�{��Ĳ$bKu�2� z���[AL�>���''�����3x+I.p�{�,���7��~������ְ�li�w�����,o��`2î
��#Z�;���7TY���ߘ?�-� � �+_�o��#RR�"]$��ޝ�/��^��ϼ���.}CJ�p.V�B`��K㍫�t���¢��N��N$<����#	�XGa��J�����������J(��f�R�,ޞ�&DGMnV�u<�s����N���o��k��[��B߭�V���.@����aKqa'�����a?�����=<����GmPW�J���dL!�<x�tʁ'��@́�W��Z=�`%rY�z�s�X�\S�w�,�J5�1_�'�����J��^#�$#���=Vr�,�m���G���@�����m�� �� o#�:�鄀J��>��re��G��Rj�������K��v�}�l�1Ӑ�.��~O�!C������?���\�3�}�9�m��� ߭ǐ�$���zX	頱;�!�1��Kו��EJh�6��x�Y�t|���u���3uyFVz<#�t���÷�H#�����R#o#o##+#s��1��y����vX��!4 �8�k�w���U�JW�*]��t���E}�K}�K�L\GӞ�d���z����n���X?�W��X�T}��'��6���e1�*�Ҕ��-W߁�U�}R���ө�wм(������|�S�IS�5��h�J}͸�45��^=E�.��|>m��y�8+i>���м���P�+�\��u0���iE�4���;hz���4�H��>���v�/�}E�a4u��$�ΦiMW�hƫ��عK�]:�q��=��9��S�o��o�t��E��>^����bG�NA���BK˼3_[�lr���^d_��I��׼�w�x�K[�黅7F��<c�K�]>���'�S��uB����6��3�{oð=.�Go�*x��� 1�����C/��P��q�<��SgW�Z&�K�v��n�������?.%>m�1���\I�*Ӄ�͎��<x�k����FH�_U��;�أ{�+���7����d;fh�&Y[I��Ĳ��=�ڕ[���{�Q��C����Tn���'��[�c�[��K;�b7�̎�q�����S�&�y�����t=,��.�{u�0=Ի���wA)����vb[��3����\���_Tlj;kN��9��<�k��s����eι<f[ԑ�Q��A�޹[�f�͙f�G.ǻ�\v*�<��$+!Q�{ݬ sF���$¯�Qn�1Wg>E;M�8&=is#�Kb�uf�O9-�M�f��0y�O����7y�Jm���w�C�㈜U�G��{Weu[�������\�+��S�9�;�־�od����"�ǼվO�22k�R�a�ݕfĎ��v'���S����8�i?e�_�ݓjx{#x��Mt�5�IM`S�![
r�e�ko�xs]�~j������d�{�{7�h��讨��k����F�]�&�.~e[��2�Y����d|{Uv����E��nׄ9��,�C�]^�����)[fי��>���放���W?�a��Vo����μ>��c��c�>u�,�J\ۡ!6��:�a��Yױ���Wϻ2}߈�5�s�̾b�z��+{�����+{*x����C�{�.��$�(O(�Wwp��(�����k�c�/J�2��G
���>=�4ff�ߧ�+����S��`f����<���M��<���:g����(wG�]�qݻ�����WR�co�X/ݗ;ƿwZ+�}ޭ�kbf�8��lVcN��b��M�ځd�Z�&�^%>	�j���S���.6�f!M5O]�+Y����=����iS���v~���4���%�mQ*˲���{9'��x���?Y�����<u��)���h�<�T�5p[Cӕ�d��6c�Ao_��I�P�����g��SC�n����q���\�Kc܏G�v}�mY�邟�����'��g֨�^������ھypKI�<�M9�n��S{n����`G��������٭o�Vz���z\}ݝ�~��L��qbͤk䪺��5�g���}�x�_^��u��=��?M���^���״�]/�O{�;s�;ß��:���L^�䧢�M�?=W:�n�����x|V˨�Q�k�Fk����La����Ef-;�2���x�C�}[�p�k���~�s��;�|0�I�U�H�x��}���?X�3��Єۢ�k�~p�S�y�S|"�䧐���I��d�:��������x\����J�@���O[zt3�,
r5�YZ�����q˫yoF�Y)��s}[�/+���Y�E��m�f�F钆��CBb�����n�)I	��CZBRiP	)a޽�-�}���{?���:���_�5ǚ5s�:ǅȣ����O&��^������� �z�~,\S�O�3����PČ�xe*>E����WU-�q�~e�`W��ͣ�s6�L?�:8�ڈ�J�4�kb�4��_yL*���Т�x�g��vR���p0��jt/�m�mr�":��(֣l����"��-�y�@�IC�U����1�p��a݋��ey�W��v�T�3-Kˁ6���"&��k#�SC	���·ZE��sU> ������c�cB�> ɑ�DL+����vB~K��ڻ�l@r�yj����жք� ��7��QewQ���?�G�t2��^���]䂌��Xt7<���#�ɚ�o���/x;OW�F��r<}�G����`B�:�gX௉#�|P����~�}���&���\���`�ͧ3s�SpQ,F���qL�dq�i�����0���k��Cy7O�v��WL	������z�3���:�e��h�M%�_q.�����"��@o��%�u�Ǟec�~�1^�v����A���/�-�]0] Ҕ�X�<��b��Ȑ����8̟������1@i�gH��d���%���q�I����:�Qg��:0R|����"����3m:s<�B��ў|`f�j�#I�<n-�$@gp�
f�+�d!T�)IhrQ�]t� ��%u�����v�o3=By Bg��,L�1�2�nC��U�V�J'�8����nM+{�J��2YEW �ًFd"�TT�<�V�^��KV���"Z��t�����"�?v@+"���z����݈:m�t�����M���\���{�Q@;̑���"�yd����`��,�w�3�f�����9�[�k'�B��&���iq�Pdn�h쪞�rRx8�:�����Gg� ��n�3�V���:�e�v��p�o�8������O��vSO��?K����UL&�L<p����%�6yU��Cx��=���v�����P[fD�:������N}Xӥ��F	p���(�\�����^urbT�q&(�� �\U	���b�$V������[����I�b���}���r}�0
�8Վ�|x�y�6��:�R��Z��cDf�][D�#�}�����ÄaWFHĆa>�`��Q�p�B"�<����@���M;2��.p
�n��i2'�`��I��q_V�X�`�>�d֒H���t]�$�`� ��GB�J]�Qq�]|P������:D��W6���Z����FE�������b9h/Z���R�><���l�4�DL%(R�+�T�D���u ŕ��
V�0+Ո�S	>?E�D&e��8|qb��ʽ�e���c�'�FO�G��gj��͚>��\f��#����ᕬ��Jc�0wXU��Ik���p^RT���k� �>��$����l��!`{��R�A�[sO��/ A�T�`b-�P7�K]Ƶh�\��u#�p�:�	�RAM�6W��^4� >�
�ו*g�ݍZ�L^��Mq��lVD���[)A�\�`�QN�Z`�a�[�?����ڟ��M�L�����SF�.�m:a��q�����:*5g
ǂ�,�����-��6�W�X�?��P�<���ثT�n�4ϥ/@y�.7]@���lx>=����9� �oc���K���UKBz��\���L� 3�Y���x����#t탸l���Ы��W<#%�G�s�=���?���)W���X�ߢ����9N��e��_ʐ+`�<J���j�n'�P��jh�v��zT.�(�@m��$�5�>�1�4��d��֜U���`�$Mq�}QżVn�?A��s ��}��)7��'2��|w�d~���R���w�=h���_gK�5��nɯAY%�{7�^ �����Yxң8� K0@౼A�5�aQfn;���-��*�+�=4��$�9x���S���E縉�`J�w�50���;�+�����H�=E� _�h���n�̆�!r�K�ڜ��N-G,2�yB0����PG44r����%� ��Z�u����4�>���la�G�$��ȏ�T�����p§���
�z����?"�
�.W���;�}j��ӳ��C��w��+��f�-@����fa�[Y���@�	C{��![�ˇ����~7�2îvj?-Ȼy���ߢ��0�T�i��U�ʕv�}�. ɗ����HZ�Uͯ�r͟!u�Y\�4���_�.�2J��.�����d�.���Ĝ�����L��ք�g�9�cV���;UԐ�d��[�4@k�ƭs*�z(ǃ��4�YkCkY�>ģ��[I��W8���+��Z]w��+�[i(Xs���^����Q�1m�Ĵ5g��6�$�Q����Z�hfx���)s.0�+H�hJMu�.�H�R���~�x�خ��]���g�@�ɉ�^�h�)����L���4b�)?���!Ϣֶ��}�_�V�c�⢐ "��q秸��y�֫��s@~Bʯ�o�-v������W5LնnGg�J<��_y��/�?��#a�a_l Hw�K���/
�Q�f!=q��&7�⥷�#�I�/o?,��8l�qQ×��3zi7R��I�ڈ�a��I"�t�\�$U��jL�H������-;�����E>LPm�z&S��4��9�ɖ*t�U1aE}(�s3�a��͛W�����b2ϼP���Fs{��ق���u�E�&ϲ�n2@��4�&�5c�d��v��/=cia��?u�u���܌��i�%۶�0�n5��_F+�XZK9�������X���x�F�ׅ/�~��H��ye�w����*x^��\����۠�Y��-qu�����\�ڛ$��o��UdPoJ��HIO�㟀��̿|��'�x����b6;�k���X޴�_O���9.r��ێ�y�����Di"�(㵩� �0�,>����'�����"�>�>ؗ'�<�����E�v����L6D�toPZ�R))��S�E�Q�H�%&n%4d�7x����\w�f����In�_��N�}�	g�o}�7��	���m��	�DM~�|���B�&"�/+��n,�6<P����H�gO�k�B�n)��ٮ�V�k���p��u����+�͇x�[\�]X�]x�ŞQ��B����l�,AƜ4����]J�Уq�L�g��2g��|� 3���i�Y�c"uì��K�F�gMW39�H�٭��m�<���1K�5x;��b%~`h�e�d!��z��U��嗒Z��*Vռ1�aKM��(��ֻ/��f�\�����x`En��{_�I]���� �����&��[�:$�X�#Be��i�JT)�ѳ36o�@�<\�6xއ2�����>�M<��%��ѥ����N�q��wf.�x�DZi�2�����?��cl��s;�jv7���!}�in��]աא	�-���NYy���U�usؾ�T��U眩���s�K3e���V�zs�J���UoN �H���_��LJ�����_��th<8x��`1@�5����k[��"W#��(� 
k3>�<91y"�<�M4�F��l"3L�7�����v���`���{+�o���m~֒�Y~K�D�0��������KS%2�~�"��/�d�i�PU EF��HꂟqQ��J�,���L�а%�L?L?Rȉ����V��=�.�;�XG�c�`.�F׃7_��� ���^IZ�N�&�qey�������X�)����DmR�"Y:>�KĵY�VŭR�}���x�l��]^�p�HnǱ��lh �tk�z��ڑ14���xe�C��<�S<"��Z��U��ڌJ#[��aA��|e������l�\UJ9|v�p\�}�ȑl�׍z�٢G>�F�nKޗ��:M�뚾jI���e��G%�x~ӯ%��#^�B���l�
*^�ohw�*؅kp
��_��띯���λ!C����a���&(��A=m$�$,y��x��Za� �.�!?���c�W����5�mݓ�������g�a;����[���-X���Q�19c��i�&͡|��������5��zM�\�"|��j?|<�/=Cb�#Qp��>Hz���u���yx�Eg���+d䘣�1>����q#�1Rfs4>l�ѳQ����D~�Z�Z�$~�w; ����2܍&�$���D��`�[�ͣ��'%�w^��#��$�Nᤂ���,�(�sm�����Ck��u�K�͗FiԮܪ�@[yᬎ��X���H�[����K.�֏�|�V�g���g՚3�
R��eh@�H$(��\5+��G����D|��R��B�e"E�,j�䮾(%��I�]Ü�T��'Z�ئ\~��0���v�q�0I�)���d��b����l�|�b��� �}JwPD����_�*�x��(��,�|7W���l��;�����A����0�blqS��Y
ѱ��l��/�H*DG�Z�ow�𙭹d �&��)��ž�ω� y�ߣ�y�hl�����)-_��vxDn�; �}۽��m�/�����܉_i3�O��t�ķ}�Y�߭	����&��k�r׎s��w�"��*�Y�'����=����_,���>Xj4~�������|F2(�����r\J�����Ӛ�%���Q?�G�`�		g(̓�͜�������:��H,�\=�L�f��Ћ�t9�4'.s�H�烑k��~�-������V�^����08q��b��|<2%�T�bQƮ�6���͘y�弑0���8b,�$Z�]�*�F�Lt��O�a��q7�ے8%ݸX���ty}[}�O(��N��
7��)�[�	 ��CCQ?��@��ή�Ӝ������,3���Б=ʃ�F9tͦ����c����_{�7��n��.���1�!q��7!����A�� �l�)������I�X�ru�N4z��#���Z�p�3�.B_���d��)��>�]P��a����h�;��}��$��`��Gd�s�O����q��J١c�wwj�x���o����Qˇ���8�氭�z<S�i뀚�2�f:�v��Хq��]�1�p�b��b����%ú��ɓ8M��N��(��r��o?�GS��x'?���-

�ȳ���V��{TY�����!5�>��'��>��% �b�d�RR�p5���%�v��q��W��[ī<$��`�V�S�����Lq�5�EG�o��{<mG���*V�V�4Mc([����<�Y	BIVE��寄Z�檀
�����>k��u+�")����]b
���;"�XE��ʐǷIִޤ}\�ܯ��ZP`�̍�M$$�&9�PN�~����wd�_"foO��O@�_�(�F6�b濼L
qN�Yʣ�f��8d�V����K����Z�_#4�^�A_׉D�dr�@���L�n6O�=#�}����p#s�L	&p�*1�?.�yL��η����I�X(��ӣ�z�Y{��� [nf���^!�(��(���P�<�&�j�N��gg����Ú]�I��cl&�od�}�'#��%�'�x>E���ɚ��!��$��O�m]z��$S���Oä^qf��af�h
W�=�����l�����/Ļ�;?����`X�H<1�?�a�b�[��T���Ǩ
R��N4��4�l3�-�c����C��V�v�j��L���V��9�Z��L��%�������)%�%̑#	
�����u�����k-)ur^�L���0�9X,u{�֡ՑX�y���6�Q�&��Y�A>"�FG�;��/@DxK��L�XRi��m��*v�ŬE������H����|����j]DE�� I��l {�����J��@fEu��e������g8:i��V[Pʉ-����x||H�k�7M�x'���pH�0��g��M]����A`�G�K�y��n�{Y;�<jd� ��?�A��� L[v=փe��sTr,¿W5HnP+�>�p�m$u���`��HD�/����w�{$���
<KO�c� �(G�p.oty �I� Wq��<"��ʹW�̣�"�UӸY`KW-[��˻��%3k����&������姥�;i*����Z�X9�g��L�n���%0�cu��T�O%�<	�M)��1���um�ܶ�N:���<OPt����$͗��Z 	�x|d�R/Eن�Y�7}7�
v��6�6�Pf���/����f3�'AT�	z��Ϲ�n���+�m����'8勔}úc��b:0)f�`I�����������A.t������%��$e��V�'��ߟ���ž�y��ǧ�1�����Q#���}���ԪޭwL��̤�pN��9�L�2.?oԾE���F,�إ�ZA��K�g�zlj�A<�ڰsh�2N> �0jp���/<��"�gMO3��ʳhm�0G0yi%���?3��\.��ӏM�%���+����}nm^E3�p7$Kt�;d�]nRO��G���	�OgbJ����#R��>x(|Mz�ٓ������,%��k}h�ˊ2����X�,����c��^y�r}�ϕ���K�O�	� -��ٌk<�d���G
H�T7t#�hf�j!���Xu���K&�iW���.}���*v ��C�ˮ�5J���0T,�dRRz�8��;#զ�j���!��-�ϸ_?~<��9��`<�0X�7��ӹ�@z��l��E�$�T/DL�Z�Q��e���sQi�Hcx#�;SR$Nx��c��(dR��|��`�l�G/��_�� )sH�=N2�P'K�wR����i/��gA�u�d>�VY�9C*���U�c��K�q�O��ȳl��Jy=)��im����xq���J#.�T�84����{���9?�̫�HpK���Y�!֞�7��?<5�����o�cY1�m��i*��Rˤ)�{p�b�2��G�/]��L��Q�aΆ����u"�ej!�QE?���	��%�@מE.f�v���;�v�0���^ǇdA����xQ�XW��j�$��+��z��ܢ+{��M)-���n��V�v�5���7}/�
!Ũ�z��3�]�ΙS���Ze�(� k��z��=q
�*�P�T-�����4j��Цb���S��:`���0�2&�m��){�ƭ/����-�S����3-7���)���G�������Í� ����t�4�@ �9{��]��.�`�������ъ����&)i������gk�a� ��s��s�K=����v��3��?WL���v4���_=WG�?K������q���	��ci���?r�2�4G �mM��͝���V��^�55ww7������Q������3�U��Xxx  -]���Ξ�G>�_^�;_���m�������YY��%�;�~F'�=���J���?=Cp��?wS�w_�/�k�������:�~�p��%��{^�o�NA��}�Ty���;؝Jܻ~�{j��cv�~�3��;����k������_�7�w7~�_��=�ܝ���Py���A����O��>�����O����ݛ��1�������|��{�]>�a����ګ���~W�?���{?�V�o�������.����W��WhW��^��<:�{>һ���?�����gz���'~�*�W��/�.O�w�9����8��k��P�����/��~�������������>��u�;�.G1B�/U@���������������O�������x��?!�w6�Z  