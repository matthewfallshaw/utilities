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
�� .miscactvnull��� ��� null + m     , ,�                                                                                  sprf  alis    |  Macintosh HD               ��,�H+    3System Preferences.app                                          +��k��        ����  	                Applications    ���      �kh      3  0Macintosh HD:Applications:System Preferences.app  .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��  ��  ��   )  - . - l  ~ /���� / O   ~ 0 1 0 O   } 2 3 2 k   | 4 4  5 6 5 I   0�� 7��
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
�� boovfals � o      ���� 0 primarydriveavailable   �  � � � X   �e ��� � � k   �` � �  � � � r   � � � � � [   � � � � � o   � ����� 0 	rownumber   � m   � �����  � o      ���� 0 	rownumber   �  � � � r   � � � � n   � � � � 1  ��
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
volumename  ��   �  ��� � Z  !` � � ��� � = !* � � � c  !( � � � o  !$���� 0 
volumename   � m  $'��
�� 
TEXT � o  ()���� 0 primarydrivename   � k  -@ � �  � � � r  -4 � � � o  -0���� 0 	rownumber   � o      ���� 0 primarydriverownumber   �  � � � r  5: � � � m  56��
�� boovtrue � o      ���� 0 primarydriveavailable   �  ��� � r  ;@ � � � m  ;<��
�� boovtrue � o      ���� 0 driveavailable  ��   �  � � � = CL � � � c  CJ � � � o  CF���� 0 
volumename   � m  FI��
�� 
TEXT � o  JK���� 0 secondarydrivename   �  ��� � k  O\ � �  � � � r  OV � � � o  OR���� 0 	rownumber   � o      ���� 0 secondarydriverownumber   �  ��� � r  W\ � � � m  WX��
�� boovtrue � o      ���� 0 driveavailable  ��  ��  ��  ��  �� 0 tablerow   � o   � ����� 0 tablecontents   �  � � � Q  f6 � � � � k  i � �  � � � Z  i � ����� � = in � � � o  il���� 0 driveavailable   � m  lm�
� boovtrue � k  q � �  � � � Z  q� � � ��~ � = qv � � � o  qt�}�} 0 primarydriveavailable   � m  tu�|
�| boovtrue � r  y� � � � o  y|�{�{ 0 primarydriverownumber   � o      �z�z 0 desiredrownumber   �  � � � = �� � � � o  ���y�y 0 secondarydriveavailable   � m  ���x
�x boovtrue �  ��w � r  ��   o  ���v�v 0 secondarydriverownumber   o      �u�u 0 desiredrownumber  �w  �~   �  r  �� n  �� 1  ���t
�t 
valL n  ��	 m  ���s
�s 
sttx	 n  ��

 4  ���r
�r 
crow o  ���q�q 0 desiredrownumber   n  �� 4  ���p
�p 
tabB m  ���o�o  n  �� 4  ���n
�n 
scra m  ���m�m  n  �� 4  ���l
�l 
sheE m  ���k�k  4  ���j
�j 
cwin m  �� �  T i m e   M a c h i n e o      �i�i 0 
volumename    l ���h�g�f�h  �g  �f    I ���e�d
�e .miscslctuiel       uiel n  �� 4  ���c 
�c 
crow  o  ���b�b 0 desiredrownumber   n  ��!"! 4  ���a#
�a 
tabB# m  ���`�` " n  ��$%$ 4  ���_&
�_ 
scra& m  ���^�^ % n  ��'(' 4  ���])
�] 
sheE) m  ���\�\ ( 4  ���[*
�[ 
cwin* m  ��++ �,,  T i m e   M a c h i n e�d   -.- I ���Z/�Y
�Z .prcsclicuiel    ��� uiel/ n  ��010 4  ���X2
�X 
butT2 m  ��33 �44  U s e   f o r   B a c k u p1 n  ��565 4  ���W7
�W 
sheE7 m  ���V�V 6 4  ���U8
�U 
cwin8 m  ��99 �::  T i m e   M a c h i n e�Y  . ;<; r  �	=>= b  �?@? m  �AA �BB L T i m e   M a c h i n e   h a s   b e n   s e t   t o   b a c k u p   t o  @ o  �T�T 0 
volumename  > o      �S�S 0 message  < C�RC n 
DED I  �QF�P�Q 0 	growlnote  F GHG m  II �JJ ( G e n e r a l   N o t i f i c a t i o nH K�OK o  �N�N 0 message  �O  �P  E  f  
�R  ��  ��   � L�ML l �L�K�J�L  �K  �J  �M   � R      �I�H�G
�I .ascrerr ****      � ****�H  �G   � k  #6MM NON r  #*PQP m  #&RR �SS R T i m e   M a c h i n e   p r e f e r e n c e s   w e r e   n o t   c h a n g e dQ o      �F�F 0 message  O T�ET n +6UVU I  ,6�DW�C�D 0 	growlnote  W XYX m  ,/ZZ �[[ $ e r r o r   n o t i f i c a t i o nY \�B\ o  /2�A�A 0 message  �B  �C  V  f  +,�E   � ]^] l 77�@�?�>�@  �?  �>  ^ _`_ l 7<abca I 7<�=d�<
�= .sysodelanull��� ��� nmbrd m  78�;�; �<  b ~ x wait for a confirmation dialog that appears if you select a partition on the same physical disk as that being backed up   c �ee �   w a i t   f o r   a   c o n f i r m a t i o n   d i a l o g   t h a t   a p p e a r s   i f   y o u   s e l e c t   a   p a r t i t i o n   o n   t h e   s a m e   p h y s i c a l   d i s k   a s   t h a t   b e i n g   b a c k e d   u p` fgf Z  =fhi�:�9h l =Nj�8�7j I =N�6k�5
�6 .coredoexbool       obj k n  =Jlml 4  CJ�4n
�4 
butTn m  FIoo �pp " U s e   S e l e c t e d   D i s km 4  =C�3q
�3 
cwinq m  AB�2�2 �5  �8  �7  i I Qb�1r�0
�1 .prcsclicuiel    ��� uielr n  Q^sts 4  W^�/u
�/ 
butTu m  Z]vv �ww " U s e   S e l e c t e d   D i s kt 4  QW�.x
�. 
cwinx m  UV�-�- �0  �:  �9  g yzy l gg�,�+�*�,  �+  �*  z {�){ I g|�(|�'
�( .prcsclicuiel    ��� uiel| n  gx}~} 4  sx�&
�& 
menI m  tw�� ��� . Q u i t   S y s t e m   P r e f e r e n c e s~ n  gs��� 4  ps�%�
�% 
menE� m  qr�$�$ � n  gp��� 4  kp�#�
�# 
mbri� m  lo�� ��� $ S y s t e m   P r e f e r e n c e s� 4  gk�"�
�" 
mbar� m  ij�!�! �'  �)   3 4    � �
�  
prcs� m    �� ��� $ S y s t e m   P r e f e r e n c e s 1 m    ���                                                                                  sevs  alis    �  Macintosh HD               ��,�H+    +System Events.app                                               +��8��        ����  	                CoreServices    ���      �8'7      +   �   �  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   . ��� l     ����  �  �  � ��� i     ��� I      ���� 0 register_growl  �  �  � Q     .���� O    %��� k    $�� ��� r    ��� J    �� ��� m    �� ��� ( G e n e r a l   N o t i f i c a t i o n� ��� m    	�� ��� $ D e b u g   N o t i f i c a t i o n� ��� m   	 
�� ��� $ E r r o r   N o t i f i c a t i o n�  � l     ���� o      �� ,0 allnotificationslist allNotificationsList�  �  � ��� r    ��� J    �� ��� m    �� ��� ( G e n e r a l   N o t i f i c a t i o n� ��� m    �� ��� $ D e b u g   N o t i f i c a t i o n� ��� m    �� ��� $ E r r o r   N o t i f i c a t i o n�  � l     ���� o      �� 40 enablednotificationslist enabledNotificationsList�  �  � ��� I   $���
� .registernull��� ��� null�  � ���
� 
appl� m    �� ��� * C o n f i g u r e   T i m e M a c h i n e� ���
� 
anot� o    �� ,0 allnotificationslist allNotificationsList� �
��
�
 
dnot� o    �	�	 40 enablednotificationslist enabledNotificationsList� ���
� 
iapp� m     �� ���  T i m e M a c h i n e�  �  � m    ��2                                                                                  GRRR  alis    �  Macintosh HD               ��,�H+   *�GrowlHelperApp.app                                              *��o��        ����  	                	Resources     ���      �o�     *� *� *� :�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ���
� .ascrerr ****      � ****�  �  �  � ��� l     ����  �  �  � ��� i    ��� I      � ����  0 	growlnote  � ��� o      ���� 0 	growltype  � ���� o      ���� 0 str  ��  ��  � Q     ����� O    ��� I   �����
�� .notifygrnull��� ��� null��  � ����
�� 
name� o   	 
���� 0 	growltype  � ����
�� 
titl� o    ���� 0 	growltype  � ����
�� 
desc� o    ���� 0 str  � �����
�� 
appl� m    �� ��� * C o n f i g u r e   T i m e M a c h i n e��  � m    ��2                                                                                  GRRR  alis    �  Macintosh HD               ��,�H+   *�GrowlHelperApp.app                                              *��o��        ����  	                	Resources     ���      �o�     *� *� *� :�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� l     ��������  ��  ��  ��       ��������  � �������� 0 register_growl  �� 0 	growlnote  
�� .aevtoappnull  �   � ****� ������������� 0 register_growl  ��  ��  � ������ ,0 allnotificationslist allNotificationsList�� 40 enablednotificationslist enabledNotificationsList� �������������������������
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
�� .aevtoappnull  �   � ****� k    ~��  ��  ��  #��  (��  -����  ��  ��  � ���� 0 tablerow  � C �� ���� ,���������� C���� ;���� R���� L \�� Y�� k�� ~�� ����������������� ���������������������+��93A��I������RZov���� 0 primarydrivename  �� 0 secondarydrivename  �� 0 register_growl  
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
TEXT�� 0 primarydriverownumber  �� 0 driveavailable  �� 0 secondarydriverownumber  �� 0 desiredrownumber  �� 0 secondarydriveavailable  
�� .miscslctuiel       uiel�� 0 message  �� 0 	growlnote  ��  ��  ���E�O�E�O*j+ O�j O�g*��/_*�k/��/�k/��/j O*a a /a k/a a /j O h*a a /j a j [OY��O*a a /a k/a k/j O !h*a a /a k/j a j [OY��O*a a /a k/a k/a k/a  -E` !OjE` "OfE` #O �_ ![a $a %l &kh  _ "kE` "O*a a '/a k/a k/a k/a  _ "/a (,a ),E` *O_ *j +O_ *a ,&�  _ "E` -OeE` #OeE` .Y _ *a ,&�  _ "E` /OeE` .Y h[OY�~O �_ .e  �_ #e  _ -E` 0Y _ 1e  _ /E` 0Y hO*a a 2/a k/a k/a k/a  _ 0/a (,a ),E` *O*a a 3/a k/a k/a k/a  _ 0/j 4O*a a 5/a k/a a 6/j Oa 7_ *%E` 8O)a 9_ 8l+ :Y hOPW X ; <a =E` 8O)a >_ 8l+ :Okj O*a k/a a ?/j  *a k/a a @/j Y hO*�k/�a A/�k/�a B/j UUascr  ��ޭ