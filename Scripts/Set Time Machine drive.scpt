FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��	From http://www.macosxhints.com/dlfiles/tmselect_scpt.txt
	This is a script to automatically choose which of two volumes to have time machine back up to.  If the primary volume is available it will be chosen, otherwise it will choose the secondary volume.  If neither is available it will make no changes to the time machine preferences.

	To use, set the name of the primary and secondary volumes here:      � 	 	* 	 F r o m   h t t p : / / w w w . m a c o s x h i n t s . c o m / d l f i l e s / t m s e l e c t _ s c p t . t x t 
 	 T h i s   i s   a   s c r i p t   t o   a u t o m a t i c a l l y   c h o o s e   w h i c h   o f   t w o   v o l u m e s   t o   h a v e   t i m e   m a c h i n e   b a c k   u p   t o .     I f   t h e   p r i m a r y   v o l u m e   i s   a v a i l a b l e   i t   w i l l   b e   c h o s e n ,   o t h e r w i s e   i t   w i l l   c h o o s e   t h e   s e c o n d a r y   v o l u m e .     I f   n e i t h e r   i s   a v a i l a b l e   i t   w i l l   m a k e   n o   c h a n g e s   t o   t h e   t i m e   m a c h i n e   p r e f e r e n c e s . 
 
 	 T o   u s e ,   s e t   t h e   n a m e   o f   t h e   p r i m a r y   a n d   s e c o n d a r y   v o l u m e s   h e r e :     
  
 l     ��������  ��  ��        l     ����  r         m        �    T i m e   M a c h i n e  o      ���� 0 primarydrivename  ��  ��        l    ����  r        m       �   
 S p a r e  o      ���� 0 secondarydrivename  ��  ��        l     ��������  ��  ��        l      ��  ��   F@
	Then launch the script whenever you want to change the time machine backup.  The excellent utility DSW (http://www.azarhi.com/) can be used to launch the script whenever a volume is mounted or unmounted.
	
	The script attempts to use growl to notify the user of its results.
	
	Note that GUI scripting must be enabled
     �    � 
 	 T h e n   l a u n c h   t h e   s c r i p t   w h e n e v e r   y o u   w a n t   t o   c h a n g e   t h e   t i m e   m a c h i n e   b a c k u p .     T h e   e x c e l l e n t   u t i l i t y   D S W   ( h t t p : / / w w w . a z a r h i . c o m / )   c a n   b e   u s e d   t o   l a u n c h   t h e   s c r i p t   w h e n e v e r   a   v o l u m e   i s   m o u n t e d   o r   u n m o u n t e d . 
 	 
 	 T h e   s c r i p t   a t t e m p t s   t o   u s e   g r o w l   t o   n o t i f y   t h e   u s e r   o f   i t s   r e s u l t s . 
 	 
 	 N o t e   t h a t   G U I   s c r i p t i n g   m u s t   b e   e n a b l e d 
   ! " ! l     ��������  ��  ��   "  # $ # l    %���� % I    �������� 0 register_growl  ��  ��  ��  ��   $  & ' & l     ��������  ��  ��   '  ( ) ( l    *���� * I   �� +��
�� .miscactvnull��� ��� null + m     , ,�                                                                                  sprf  alis    |  Macintosh HD               ��,�H+    3System Preferences.app                                          +��k��        ����  	                Applications    ���      �kh      3  0Macintosh HD:Applications:System Preferences.app  .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��  ��  ��   )  - . - l  Z /���� / O   Z 0 1 0 O   Y 2 3 2 k   X 4 4  5 6 5 I   0�� 7��
�� .prcsclicuiel    ��� uiel 7 n    , 8 9 8 4   ) ,�� :
�� 
menI : m   * + ; ; � < < ( S h o w   A l l   P r e f e r e n c e s 9 n    ) = > = 4   & )�� ?
�� 
menE ? m   ' (����  > n    & @ A @ 4   # &�� B
�� 
mbri B m   $ % C C � D D  V i e w A 4    #�� E
�� 
mbar E m   ! "���� ��   6  F G F I  1 I�� H��
�� .prcsclicuiel    ��� uiel H n   1 E I J I 4   > E�� K
�� 
butT K m   A D L L � M M  T i m e   M a c h i n e J n   1 > N O N 4   9 >�� P
�� 
scra P m   < =����  O 4   1 9�� Q
�� 
cwin Q m   5 8 R R � S S $ S y s t e m   P r e f e r e n c e s��   G  T U T W   J g V W V I  [ b�� X��
�� .sysodelanull��� ��� nmbr X m   [ ^ Y Y ?ə�������   W I  N Z�� Z��
�� .coredoexbool       obj  Z 4   N V�� [
�� 
cwin [ m   R U \ \ � ] ]  T i m e   M a c h i n e��   U  ^ _ ^ l  h ~ ` a b ` I  h ~�� c��
�� .prcsclicuiel    ��� uiel c n   h z d e d 4   u z�� f
�� 
butT f m   x y����  e n   h u g h g 4   p u�� i
�� 
sgrp i m   s t����  h 4   h p�� j
�� 
cwin j m   l o k k � l l  T i m e   M a c h i n e��   a   change disk    b � m m    c h a n g e   d i s k _  n o n l    �� p q��   p S M If primary disk is mounted switch to it, otherwise switch to secondary disk     q � r r �   I f   p r i m a r y   d i s k   i s   m o u n t e d   s w i t c h   t o   i t ,   o t h e r w i s e   s w i t c h   t o   s e c o n d a r y   d i s k   o  s t s W    � u v u I  � ��� w��
�� .sysodelanull��� ��� nmbr w m   � � x x ?ə�������   v I  � ��� y��
�� .coredoexbool       obj  y n   � � z { z 4   � ��� |
�� 
sheE | m   � �����  { 4   � ��� }
�� 
cwin } m   � � ~ ~ �    T i m e   M a c h i n e��   t  � � � l  � ���������  ��  ��   �  � � � r   � � � � � l  � � ����� � n   � � � � � 2  � ���
�� 
crow � n   � � � � � 4   � ��� �
�� 
tabB � m   � �����  � n   � � � � � 4   � ��� �
�� 
scra � m   � �����  � n   � � � � � 4   � ��� �
�� 
sheE � m   � �����  � 4   � ��� �
�� 
cwin � m   � � � � � � �  T i m e   M a c h i n e��  ��   � o      ���� 0 tablecontents   �  � � � r   � � � � � m   � �����   � o      ���� 0 	rownumber   �  � � � r   � � � � � m   � ���
�� boovfals � o      ���� 0 primarydriveavailable   �  � � � X   �Y ��� � � k   �T � �  � � � r   � � � � � [   � � � � � o   � ����� 0 	rownumber   � m   � �����  � o      ���� 0 	rownumber   �  � � � r   � � � � n   � � � � 1  ��
�� 
valL � n   � � � � m  ��
�� 
sttx � n   � � � � 4  �� �
�� 
crow � o  ���� 0 	rownumber   � n   � � � � 4   �� �
�� 
tabB � m  ����  � n   �  � � � 4   � �� �
�� 
scra � m   � �����  � n   � � � � � 4   � ��� �
�� 
sheE � m   � �����  � 4   � ��� �
�� 
cwin � m   � � � � � � �  T i m e   M a c h i n e � o      ���� 0 
volumename   �  � � � I  �� ���
�� .ascrcmnt****      � **** � o  ���� 0 
volumename  ��   �  ��� � Z  !T � � ��� � = !* � � � c  !( � � � o  !$���� 0 
volumename   � m  $'��
�� 
TEXT � o  ()���� 0 primarydrivename   � k  -: � �  � � � r  -4 � � � o  -0���� 0 	rownumber   � o      ���� 0 primarydriverownumber   �  ��� � r  5: � � � m  56��
�� boovtrue � o      ���� 0 primarydriveavailable  ��   �  � � � = =F � � � c  =D � � � o  =@���� 0 
volumename   � m  @C��
�� 
TEXT � o  DE���� 0 secondarydrivename   �  ��� � r  IP � � � o  IL���� 0 	rownumber   � o      ���� 0 secondarydriverownumber  ��  ��  ��  �� 0 tablerow   � o   � ����� 0 tablecontents   �  � � � Q  Z � � � � k  ]� � �  � � � Z  ]v � ��� � � = ]b � � � o  ]`���� 0 primarydriveavailable   � m  `a��
�� boovtrue � r  el � � � o  eh���� 0 primarydriverownumber   � o      ���� 0 desiredrownumber  ��   � r  ov � � � o  or���� 0 secondarydriverownumber   � o      ���� 0 desiredrownumber   �  � � � r  w� � � � n  w� � � � 1  ����
�� 
valL � n  w� � � � m  ���
� 
sttx � n  w� � � � 4  ���~ �
�~ 
crow � o  ���}�} 0 desiredrownumber   � n  w� � � � 4  ���| �
�| 
tabB � m  ���{�{  � n  w� � � � 4  ���z �
�z 
scra � m  ���y�y  � n  w� � � � 4  ��x �
�x 
sheE � m  ���w�w  � 4  w�v 
�v 
cwin  m  {~ �  T i m e   M a c h i n e � o      �u�u 0 
volumename   �  l ���t�s�r�t  �s  �r    I ���q�p
�q .miscslctuiel       uiel n  ��	 4  ���o

�o 
crow
 o  ���n�n 0 desiredrownumber  	 n  �� 4  ���m
�m 
tabB m  ���l�l  n  �� 4  ���k
�k 
scra m  ���j�j  n  �� 4  ���i
�i 
sheE m  ���h�h  4  ���g
�g 
cwin m  �� �  T i m e   M a c h i n e�p    I ���f�e
�f .prcsclicuiel    ��� uiel n  �� 4  ���d
�d 
butT m  �� �  U s e   f o r   B a c k u p n  ��  4  ���c!
�c 
sheE! m  ���b�b   4  ���a"
�a 
cwin" m  ��## �$$  T i m e   M a c h i n e�e   %&% r  ��'(' b  ��)*) m  ��++ �,, L T i m e   M a c h i n e   h a s   b e n   s e t   t o   b a c k u p   t o  * o  ���`�` 0 
volumename  ( o      �_�_ 0 message  & -.- n ��/0/ I  ���^1�]�^ 0 	growlnote  1 232 m  ��44 �55 ( G e n e r a l   N o t i f i c a t i o n3 6�\6 o  ���[�[ 0 message  �\  �]  0  f  ��. 7�Z7 l ���Y�X�W�Y  �X  �W  �Z   � R      �V�U�T
�V .ascrerr ****      � ****�U  �T   � k  �88 9:9 r  �;<; m  �== �>> R T i m e   M a c h i n e   p r e f e r e n c e s   w e r e   n o t   c h a n g e d< o      �S�S 0 message  : ?�R? n @A@ I  �QB�P�Q 0 	growlnote  B CDC m  EE �FF $ e r r o r   n o t i f i c a t i o nD G�OG o  �N�N 0 message  �O  �P  A  f  �R   � HIH l �M�L�K�M  �L  �K  I JKJ l LMNL I �JO�I
�J .sysodelanull��� ��� nmbrO m  �H�H �I  M ~ x wait for a confirmation dialog that appears if you select a partition on the same physical disk as that being backed up   N �PP �   w a i t   f o r   a   c o n f i r m a t i o n   d i a l o g   t h a t   a p p e a r s   i f   y o u   s e l e c t   a   p a r t i t i o n   o n   t h e   s a m e   p h y s i c a l   d i s k   a s   t h a t   b e i n g   b a c k e d   u pK QRQ Z  BST�G�FS l *U�E�DU I *�CV�B
�C .coredoexbool       obj V n  &WXW 4  &�AY
�A 
butTY m  "%ZZ �[[ " U s e   S e l e c t e d   D i s kX 4  �@\
�@ 
cwin\ m  �?�? �B  �E  �D  T I ->�>]�=
�> .prcsclicuiel    ��� uiel] n  -:^_^ 4  3:�<`
�< 
butT` m  69aa �bb " U s e   S e l e c t e d   D i s k_ 4  -3�;c
�; 
cwinc m  12�:�: �=  �G  �F  R ded l CC�9�8�7�9  �8  �7  e f�6f I CX�5g�4
�5 .prcsclicuiel    ��� uielg n  CThih 4  OT�3j
�3 
menIj m  PSkk �ll . Q u i t   S y s t e m   P r e f e r e n c e si n  COmnm 4  LO�2o
�2 
menEo m  MN�1�1 n n  CLpqp 4  GL�0r
�0 
mbrir m  HKss �tt $ S y s t e m   P r e f e r e n c e sq 4  CG�/u
�/ 
mbaru m  EF�.�. �4  �6   3 4    �-v
�- 
prcsv m    ww �xx $ S y s t e m   P r e f e r e n c e s 1 m    yy�                                                                                  sevs  alis    �  Macintosh HD               ��,�H+    +System Events.app                                               +��8��        ����  	                CoreServices    ���      �8'7      +   �   �  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   . z{z l     �,�+�*�,  �+  �*  { |}| i     ~~ I      �)�(�'�) 0 register_growl  �(  �'   Q     .���&� O    %��� k    $�� ��� r    ��� J    �� ��� m    �� ��� ( G e n e r a l   N o t i f i c a t i o n� ��� m    	�� ��� $ D e b u g   N o t i f i c a t i o n� ��%� m   	 
�� ��� $ E r r o r   N o t i f i c a t i o n�%  � l     ��$�#� o      �"�" ,0 allnotificationslist allNotificationsList�$  �#  � ��� r    ��� J    �� ��� m    �� ��� ( G e n e r a l   N o t i f i c a t i o n� ��� m    �� ��� $ D e b u g   N o t i f i c a t i o n� ��!� m    �� ��� $ E r r o r   N o t i f i c a t i o n�!  � l     �� �� o      �� 40 enablednotificationslist enabledNotificationsList�   �  � ��� I   $���
� .registernull��� ��� null�  � ���
� 
appl� m    �� ��� * C o n f i g u r e   T i m e M a c h i n e� ���
� 
anot� o    �� ,0 allnotificationslist allNotificationsList� ���
� 
dnot� o    �� 40 enablednotificationslist enabledNotificationsList� ���
� 
iapp� m     �� ���  T i m e M a c h i n e�  �  � m    ��2                                                                                  GRRR  alis    �  Macintosh HD               ��,�H+   *�GrowlHelperApp.app                                              *��o��        ����  	                	Resources     ���      �o�     *� *� *� :�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ���
� .ascrerr ****      � ****�  �  �&  } ��� l     ����  �  �  � ��� i    ��� I      ���� 0 	growlnote  � ��� o      �� 0 	growltype  � ��
� o      �	�	 0 str  �
  �  � Q     ���� O    ��� I   ���
� .notifygrnull��� ��� null�  � ���
� 
name� o   	 
�� 0 	growltype  � ���
� 
titl� o    �� 0 	growltype  � ���
� 
desc� o    � �  0 str  � �����
�� 
appl� m    �� ��� * C o n f i g u r e   T i m e M a c h i n e��  � m    ��2                                                                                  GRRR  alis    �  Macintosh HD               ��,�H+   *�GrowlHelperApp.app                                              *��o��        ����  	                	Resources     ���      �o�     *� *� *� :�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ������
�� .ascrerr ****      � ****��  ��  �  � ���� l     ��������  ��  ��  ��       ������  �������������������������������������  � �������������������������������������������������� 0 register_growl  �� 0 	growlnote  
�� .aevtoappnull  �   � ****�� 0 primarydrivename  �� 0 secondarydrivename  �� 0 tablecontents  �� 0 	rownumber  �� 0 primarydriveavailable  �� 0 
volumename  �� 0 primarydriverownumber  �� 0 desiredrownumber  �� 0 message  �� 0 secondarydriverownumber  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  � ������������ 0 register_growl  ��  ��  � ������ ,0 allnotificationslist allNotificationsList�� 40 enablednotificationslist enabledNotificationsList� �������������������������
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null��  ��  �� / '� ���mvE�O���mvE�O*������� UW X  h� ������������� 0 	growlnote  �� ����� �  ������ 0 	growltype  �� 0 str  ��  � ������ 0 	growltype  �� 0 str  � 
������������������
�� 
name
�� 
titl
�� 
desc
�� 
appl�� 
�� .notifygrnull��� ��� null��  ��  ��  � *������ UW X  	h� �����������
�� .aevtoappnull  �   � ****� k    Z��  ��  ��  #��  (��  -����  ��  ��  � ���� 0 tablerow  � A �� ���� ,��y��w���� C���� ;���� R���� L \�� Y�� k�� ~�� ����������������� �������������������#+��4������=EZask�� 0 primarydrivename  �� 0 secondarydrivename  �� 0 register_growl  
�� .miscactvnull��� ��� null
�� 
prcs
�� 
mbar
�� 
mbri
�� 
menE
�� 
menI
�� .prcsclicuiel    ��� uiel
�� 
cwin
�� 
scra
�� 
butT
�� .coredoexbool       obj 
�� .sysodelanull��� ��� nmbr
�� 
sgrp
�� 
sheE
�� 
tabB
�� 
crow�� 0 tablecontents  �� 0 	rownumber  �� 0 primarydriveavailable  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
sttx
�� 
valL�� 0 
volumename  
�� .ascrcmnt****      � ****
�� 
TEXT�� 0 primarydriverownumber  �� 0 secondarydriverownumber  �� 0 desiredrownumber  
�� .miscslctuiel       uiel�� 0 message  �� 0 	growlnote  ��  ��  ��[�E�O�E�O*j+ O�j O�C*��/;*�k/��/�k/��/j O*a a /a k/a a /j O h*a a /j a j [OY��O*a a /a k/a k/j O !h*a a /a k/j a j [OY��O*a a /a k/a k/a k/a  -E` !OjE` "OfE` #O �_ ![a $a %l &kh  _ "kE` "O*a a '/a k/a k/a k/a  _ "/a (,a ),E` *O_ *j +O_ *a ,&�  _ "E` -OeE` #Y _ *a ,&�  _ "E` .Y h[OY��O �_ #e  _ -E` /Y 	_ .E` /O*a a 0/a k/a k/a k/a  _ //a (,a ),E` *O*a a 1/a k/a k/a k/a  _ //j 2O*a a 3/a k/a a 4/j Oa 5_ *%E` 6O)a 7_ 6l+ 8OPW X 9 :a ;E` 6O)a <_ 6l+ 8Okj O*a k/a a =/j  *a k/a a >/j Y hO*�k/�a ?/�k/�a @/j UU� ����� �  ����� �� ������ ���~� ��}�|� ��{�z� ��y�� y�x�
�x 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
�y 
cwin� ���  T i m e   M a c h i n e
�{ 
sheE�z 
�} 
scra�| 
� 
tabB�~ 
�� 
crow�� � �� ��w�v� ��u�t� ��s�r� ��q�p� ��o�� y�n�
�n 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
�o 
cwin� ���  T i m e   M a c h i n e
�q 
sheE�p 
�s 
scra�r 
�u 
tabB�t 
�w 
crow�v � �� ��m�l� ��k�j� ��i�h�  �g�f  �e y�d
�d 
pcap � $ S y s t e m   P r e f e r e n c e s
�e 
cwin �  T i m e   M a c h i n e
�g 
sheE�f 
�i 
scra�h 
�k 
tabB�j 
�m 
crow�l �  �c�b �a�` 	�_�^	 
�]�\
 �[ y�Z
�Z 
pcap � $ S y s t e m   P r e f e r e n c e s
�[ 
cwin �  T i m e   M a c h i n e
�] 
sheE�\ 
�_ 
scra�^ 
�a 
tabB�` 
�c 
crow�b �� 
�� boovfals� �Y�Y    �  1 4 5 . 6 5   G B�� �� � � ^ T i m e   M a c h i n e   h a s   b e n   s e t   t o   b a c k u p   t o   1 4 5 . 6 5   G B�� ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   ascr  ��ޭ