FasdUAS 1.101.10   ��   ��    k             l      ��  ��    X R Original source : http://www.macosxhints.com/article.php?story=20080105135511764      � 	 	 �   O r i g i n a l   s o u r c e   :   h t t p : / / w w w . m a c o s x h i n t s . c o m / a r t i c l e . p h p ? s t o r y = 2 0 0 8 0 1 0 5 1 3 5 5 1 1 7 6 4     
  
 l     ��������  ��  ��        l      ��  ��   `Z	 This is a script to automatically choose which volume to have time machine back up to. If the primary volume (= 1st in the list) is available, it will be chosen, otherwise it will choose any volume available in the list. If none is available, it will make no changes to the time machine preferences.
To use, set the names of the volumes here :      �  � 	   T h i s   i s   a   s c r i p t   t o   a u t o m a t i c a l l y   c h o o s e   w h i c h   v o l u m e   t o   h a v e   t i m e   m a c h i n e   b a c k   u p   t o .   I f   t h e   p r i m a r y   v o l u m e   ( =   1 s t   i n   t h e   l i s t )   i s   a v a i l a b l e ,   i t   w i l l   b e   c h o s e n ,   o t h e r w i s e   i t   w i l l   c h o o s e   a n y   v o l u m e   a v a i l a b l e   i n   t h e   l i s t .   I f   n o n e   i s   a v a i l a b l e ,   i t   w i l l   m a k e   n o   c h a n g e s   t o   t h e   t i m e   m a c h i n e   p r e f e r e n c e s . 
 T o   u s e ,   s e t   t h e   n a m e s   o f   t h e   v o l u m e s   h e r e   :        l     ��������  ��  ��        l     ����  r         J            m        �    T i m e M a c h i n e   ��  m       �   
 S p a r e��    o      ���� 0 backup_drives  ��  ��       !   l      �� " #��   ">8 Then launch the script whenever you want to change the time machine backup. The excellent utility DSW (http://www.azarhi.com/) can be used to launch the script whenever a volume is mounted or unmounted.
The script attempts to use growl to notify the user of its results.
Note that GUI scripting must be enabled     # � $ $p   T h e n   l a u n c h   t h e   s c r i p t   w h e n e v e r   y o u   w a n t   t o   c h a n g e   t h e   t i m e   m a c h i n e   b a c k u p .   T h e   e x c e l l e n t   u t i l i t y   D S W   ( h t t p : / / w w w . a z a r h i . c o m / )   c a n   b e   u s e d   t o   l a u n c h   t h e   s c r i p t   w h e n e v e r   a   v o l u m e   i s   m o u n t e d   o r   u n m o u n t e d . 
 T h e   s c r i p t   a t t e m p t s   t o   u s e   g r o w l   t o   n o t i f y   t h e   u s e r   o f   i t s   r e s u l t s . 
 N o t e   t h a t   G U I   s c r i p t i n g   m u s t   b e   e n a b l e d   !  % & % l      �� ' (��   ' 9 3	User interface elements required for UI scripting     ( � ) ) f 	 U s e r   i n t e r f a c e   e l e m e n t s   r e q u i r e d   f o r   U I   s c r i p t i n g   &  * + * l      �� , -��   ,  	Application (EN)     - � . . $ 	 A p p l i c a t i o n   ( E N )   +  / 0 / j     �� 1�� 0 names_prefs   1 J      2 2  3�� 3 m      4 4 � 5 5 $ S y s t e m   P r e f e r e n c e s��   0  6 7 6 l      �� 8 9��   8   Time machine     9 � : :    T i m e   m a c h i n e   7  ; < ; j    	�� =�� 0 names_tm   = J     > >  ?�� ? m     @ @ � A A  T i m e   M a c h i n e��   <  B C B l      �� D E��   D &  	Preference pane list menu (EN)     E � F F @ 	 P r e f e r e n c e   p a n e   l i s t   m e n u   ( E N )   C  G H G j   
 �� I�� 0 
names_view   I J   
  J J  K�� K m   
  L L � M M  V i e w��   H  N O N l      �� P Q��   P " 	Disc selection button (EN)     Q � R R 8 	 D i s c   s e l e c t i o n   b u t t o n   ( E N )   O  S T S j    �� U�� 0 names_usebutton   U J     V V  W�� W m     X X � Y Y  U s e   f o r   B a c k u p��   T  Z [ Z l      �� \ ]��   \  	Cancel button (EN)     ] � ^ ^ ( 	 C a n c e l   b u t t o n   ( E N )   [  _ ` _ j    �� a�� 0 names_cancelbutton   a J     b b  c�� c m     d d � e e  C a n c e l��   `  f g f l      �� h i��   h  	Quit command (EN)     i � j j & 	 Q u i t   c o m m a n d   ( E N )   g  k l k j    �� m�� 0 
names_quit   m J     n n  o�� o m     p p � q q . Q u i t   S y s t e m   P r e f e r e n c e s��   l  r s r l      �� t u��   t ! 	General notification (EN)     u � v v 6 	 G e n e r a l   n o t i f i c a t i o n   ( E N )   s  w x w j    "�� y�� 0 msgs_general   y J    ! z z  {�� { m     | | � } } ( G e n e r a l   n o t i f i c a t i o n��   x  ~  ~ l      �� � ���   �  	Error notification (EN)     � � � � 2 	 E r r o r   n o t i f i c a t i o n   ( E N )     � � � j   # '�� ��� 0 
msgs_error   � J   # & � �  ��� � m   # $ � � � � � 
 E R R O R��   �  � � � l      �� � ���   �  	Success message (EN)     � � � � , 	 S u c c e s s   m e s s a g e   ( E N )   �  � � � j   ( .�� ��� 0 msgs_newvolume   � J   ( - � �  ��� � m   ( + � � � � � L T h e   T i m e   M a c h i n e   b a c k u p   v o l u m e   i s   n o w  ��   �  � � � l      �� � ���   �  	Error message (EN)     � � � � ( 	 E r r o r   m e s s a g e   ( E N )   �  � � � j   / 5�� ��� 0 msgs_notchanged   � J   / 4 � �  ��� � m   / 2 � � � � � R T i m e   M a c h i n e   p r e f e r e n c e s   w e r e   n o t   c h a n g e d��   �  � � � l      �� � ���   � "  Language not found message     � � � � 8   L a n g u a g e   n o t   f o u n d   m e s s a g e   �  � � � j   6 :�� ��� 0 msg_language   � m   6 9 � � � � � 4 E R R O R   -   l a n g u a g e   n o t   f o u n d �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   ; ?�� ��� 0 growl_general   � m   ; > � � � � � ( G e n e r a l   N o t i f i c a t i o n �   Growl notification types    � � � � 2   G r o w l   n o t i f i c a t i o n   t y p e s �  � � � j   @ D�� ��� 0 growl_debug   � m   @ C � � � � � $ D e b u g   N o t i f i c a t i o n �  � � � j   E I�� ��� 0 growl_error   � m   E H � � � � � $ E r r o r   N o t i f i c a t i o n �  � � � l    � � � � I    �������� 0 register_growl  ��  ��   � . ( register with Growl notification system    � � � � P   r e g i s t e r   w i t h   G r o w l   n o t i f i c a t i o n   s y s t e m �  � � � l     ��������  ��  ��   �  � � � l    � � � � I   �� ���
�� .miscactvnull��� ��� null � m     � ��                                                                                  sprf  alis    |  Macintosh HD               ���H+    xSystem Preferences.app                                          6f��ϛ        ����  	                Applications    ���      ��B�      x  0Macintosh HD:Applications:System Preferences.app  .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��   � %  activate or launch preferences    � � � � >   a c t i v a t e   o r   l a u n c h   p r e f e r e n c e s �  � � � l   ! ����� � O    ! � � � l     � � � � r      � � � n     � � � 1    ��
�� 
dnam � 5    �� ���
�� 
prcs � m     � � � � � $ S y s t e m   P r e f e r e n c e s
�� kfrmname � o      ���� 0 loc_name   � C = get the localized_name of the System Preferences application    � � � � z   g e t   t h e   l o c a l i z e d _ n a m e   o f   t h e   S y s t e m   P r e f e r e n c e s   a p p l i c a t i o n � m     � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+    qSystem Events.app                                               64ǚ�|        ����  	                CoreServices    ���      ǚR�      q  -  ,  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � p   J J � � ������ 0 lg  ��   � ; 5 allow language index to be accessed from subroutines    � � � � j   a l l o w   l a n g u a g e   i n d e x   t o   b e   a c c e s s e d   f r o m   s u b r o u t i n e s �  � � � l  " % � � � � r   " % � � � m   " #����   � o      ���� 0 lg   � 7 1 find out the language used by system preferences    � � � � b   f i n d   o u t   t h e   l a n g u a g e   u s e d   b y   s y s t e m   p r e f e r e n c e s �  � � � l  & S ����� � Y   & S ��� � ��� � Z   8 N � ����� � =   8 B � � � n   8 @ � � � 4   = @�� �
�� 
cobj � o   > ?���� 0 i   � o   8 =���� 0 names_prefs   � o   @ A���� 0 loc_name   � k   E J    r   E H o   E F���� 0 i   o      ���� 0 lg   ��  S   I J��  ��  ��  �� 0 i   � m   ) *����  � I  * 3����
�� .corecnte****       **** o   * /���� 0 names_prefs  ��  ��  ��  ��   �  l     ��������  ��  ��   	
	 l  T)���� Z   T)�� =   T W o   T U���� 0 lg   m   U V����   l  Z q I   Z q������ 0 	growlnote    o   [ `���� 0 growl_error    n   ` h 4   e h��
�� 
cobj m   f g����  o   ` e���� 0 
msgs_error   �� o   h m���� 0 msg_language  ��  ��   + % language not found - exit with error    � J   l a n g u a g e   n o t   f o u n d   -   e x i t   w i t h   e r r o r��   k   t)   l  t t��������  ��  ��    !"! l  t �#$%# r   t �&'& n   t |()( 4   y |��*
�� 
cobj* o   z {���� 0 lg  ) o   t y���� 0 names_tm  ' o      ���� 0 name_tm  $ > 8 get name of Time Machine because it is used quite often   % �++ p   g e t   n a m e   o f   T i m e   M a c h i n e   b e c a u s e   i t   i s   u s e d   q u i t e   o f t e n" ,-, l  � ���������  ��  ��  - .��. O   �)/0/ O   �(121 k   �'33 454 l  � �6786 I  � ���9��
�� .prcsclicuiel    ��� uiel9 n   � �:;: 4   � ���<
�� 
menI< o   � ����� 0 name_tm  ; n   � �=>= 4   � ���?
�� 
menE? m   � ����� > n   � �@A@ 4   � ���B
�� 
mbriB l  � �C����C n   � �DED 4   � ���F
�� 
cobjF o   � ��� 0 lg  E o   � ��~�~ 0 
names_view  ��  ��  A 4   � ��}G
�} 
mbarG m   � ��|�| ��  7 5 / directly activate Time Machine panel from menu   8 �HH ^   d i r e c t l y   a c t i v a t e   T i m e   M a c h i n e   p a n e l   f r o m   m e n u5 IJI l  � ��{�z�y�{  �z  �y  J KLK W   � �MNM I  � ��xO�w
�x .sysodelanull��� ��� nmbrO m   � �PP ?ə������w  N I  � ��vQ�u
�v .coredoexbool       obj Q 4   � ��tR
�t 
cwinR o   � ��s�s 0 name_tm  �u  L STS l  � �UVWU I  � ��rX�q
�r .prcsclicuiel    ��� uielX n   � �YZY 4   � ��p[
�p 
butT[ m   � ��o�o Z n   � �\]\ 4   � ��n^
�n 
sgrp^ m   � ��m�m ] 4   � ��l_
�l 
cwin_ o   � ��k�k 0 name_tm  �q  V   change disk button   W �`` &   c h a n g e   d i s k   b u t t o nT aba l  � ��j�i�h�j  �i  �h  b cdc l   � ��gef�g  e !  Choose 1st available disk    f �gg 6   C h o o s e   1 s t   a v a i l a b l e   d i s k  d hih W   �	jkj l  �lmnl I  ��fo�e
�f .sysodelanull��� ��� nmbro m   � pp ?ə������e  m , & wait till disk change dialog comes up   n �qq L   w a i t   t i l l   d i s k   c h a n g e   d i a l o g   c o m e s   u pk I  � ��dr�c
�d .coredoexbool       obj r n   � �sts 4   � ��bu
�b 
sheEu m   � ��a�a t 4   � ��`v
�` 
cwinv o   � ��_�_ 0 name_tm  �c  i wxw l 

�^�]�\�^  �]  �\  x yzy l 
){|}{ r  
)~~ l 
%��[�Z� n  
%��� 2 !%�Y
�Y 
crow� n  
!��� 4  !�X�
�X 
tabB� m   �W�W � n  
��� 4  �V�
�V 
scra� m  �U�U � n  
��� 4  �T�
�T 
sheE� m  �S�S � 4  
�R�
�R 
cwin� o  �Q�Q 0 name_tm  �[  �Z   o      �P�P 0 tablecontents  |   traverse disk list   } ��� &   t r a v e r s e   d i s k   l i s tz ��� r  */��� m  *+�O�O  � o      �N�N 0 	rownumber  � ��� l 05���� r  05��� m  01�M�M  � o      �L�L 0 desiredrownumber  � ; 5 reset row number (in volume list) of desired volume    � ��� j   r e s e t   r o w   n u m b e r   ( i n   v o l u m e   l i s t )   o f   d e s i r e d   v o l u m e  � ��� l 6=���� r  6=��� m  69�� ���  � o      �K�K 0 desired_name  �    reset desired volume name   � ��� 4   r e s e t   d e s i r e d   v o l u m e   n a m e� ��� l >F���� r  >F��� n  >B��� 4  ?B�J�
�J 
cobj� m  @A�I�I � o  >?�H�H 0 backup_drives  � o      �G�G 0 preferred_name  � J D get name of the preferred / primary backup volume = 1st in the list   � ��� �   g e t   n a m e   o f   t h e   p r e f e r r e d   /   p r i m a r y   b a c k u p   v o l u m e   =   1 s t   i n   t h e   l i s t� ��� X  G���F�� k  [��� ��� r  [d��� [  [`��� o  [^�E�E 0 	rownumber  � m  ^_�D�D � o      �C�C 0 	rownumber  � ��� r  e���� c  e���� l e���B�A� n  e���� 1  ���@
�@ 
valL� n  e���� m  ���?
�? 
txtf� n  e���� 4  |��>�
�> 
crow� o  ��=�= 0 	rownumber  � n  e|��� 4  w|�<�
�< 
tabB� m  z{�;�; � n  ew��� 4  rw�:�
�: 
scra� m  uv�9�9 � n  er��� 4  mr�8�
�8 
sheE� m  pq�7�7 � 4  em�6�
�6 
cwin� o  il�5�5 0 name_tm  �B  �A  � m  ���4
�4 
TEXT� o      �3�3 0 
volumename  � ��� I ���2��1
�2 .ascrcmnt****      � ****� o  ���0�0 0 
volumename  �1  � ��/� Z  �����.�-� E ����� o  ���,�, 0 backup_drives  � l ����+�*� c  ����� o  ���)�) 0 
volumename  � m  ���(
�( 
TEXT�+  �*  � l ������ k  ���� ��� l ������ r  ����� o  ���'�' 0 	rownumber  � o      �&�& 0 desiredrownumber  � 0 * set the desired row number in volume list   � ��� T   s e t   t h e   d e s i r e d   r o w   n u m b e r   i n   v o l u m e   l i s t� ��� l ������ r  ����� o  ���%�% 0 
volumename  � o      �$�$ 0 desired_name  � "  set the desired volume name   � ��� 8   s e t   t h e   d e s i r e d   v o l u m e   n a m e� ��#� l ������ Z �����"�!� =  ����� o  ��� �  0 desired_name  � o  ���� 0 preferred_name  �  S  ���"  �!  � 2 , keep this one if this is the primary volume   � ��� X   k e e p   t h i s   o n e   i f   t h i s   i s   t h e   p r i m a r y   v o l u m e�#  � !  found a volume in the list   � ��� 6   f o u n d   a   v o l u m e   i n   t h e   l i s t�.  �-  �/  �F 0 tablerow  � o  JM�� 0 tablecontents  � ��� Z  �_����� ?  ��� � o  ���� 0 desiredrownumber    m  ����  � Q  �[ k  �N  l ��	 I ���
�
� .miscslctuiel       uiel
 n  �� 4  ���
� 
crow o  ���� 0 desiredrownumber   n  �� 4  ���
� 
tabB m  ����  n  �� 4  ���
� 
scra m  ����  n  �� 4  ���
� 
sheE m  ����  4  ���
� 
cwin o  ���� 0 name_tm  �   ( " select the desired volume in list   	 � D   s e l e c t   t h e   d e s i r e d   v o l u m e   i n   l i s t  l � I ���
� .prcsclicuiel    ��� uiel n  �  4  �!
� 
butT! l "�
�	" n  #$# 4  �%
� 
cobj% o  �� 0 lg  $ o  �� 0 names_usebutton  �
  �	    n  �&'& 4  �(
� 
sheE( m  
�� ' 4  ��)
� 
cwin) o  �� 0 name_tm  �   ' ! click the localised "use" button    �** B   c l i c k   t h e   l o c a l i s e d   " u s e "   b u t t o n +,+ l *-./- r  *010 l &2�� 2 n  &343 4  #&��5
�� 
cobj5 o  $%���� 0 lg  4 o  #���� 0 msgs_general  �  �   1 o      ���� 0 message_title  . D > tell user that a backup volume has been successfully selected   / �66 |   t e l l   u s e r   t h a t   a   b a c k u p   v o l u m e   h a s   b e e n   s u c c e s s f u l l y   s e l e c t e d, 787 r  +;9:9 b  +7;<; l +3=����= n  +3>?> 4  03��@
�� 
cobj@ o  12���� 0 lg  ? o  +0���� 0 msgs_newvolume  ��  ��  < o  36���� 0 desired_name  : o      ���� 0 message  8 ABA n <LCDC I  =L��E���� 0 	growlnote  E FGF o  =B���� 0 growl_general  G HIH o  BE���� 0 message_title  I J��J o  EH���� 0 message  ��  ��  D  f  <=B K��K l MM��������  ��  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��   l V[LMNL r  V[OPO m  VW����  P o      ���� 0 desiredrownumber  M B < if failure for some reason, reset row number to 0 = nothing   N �QQ x   i f   f a i l u r e   f o r   s o m e   r e a s o n ,   r e s e t   r o w   n u m b e r   t o   0   =   n o t h i n g�  �  � RSR l ``��������  ��  ��  S TUT Z  `�VW����V =  `eXYX o  `c���� 0 desiredrownumber  Y m  cd����  W l h�Z[\Z k  h�]] ^_^ Q  h�`a��` l k�bcdb l k�efge I k���h��
�� .prcsclicuiel    ��� uielh n  k�iji 4  x���k
�� 
butTk l {�l����l n  {�mnm 4  ����o
�� 
cobjo o  ������ 0 lg  n o  {����� 0 names_cancelbutton  ��  ��  j n  kxpqp 4  sx��r
�� 
sheEr m  vw���� q 4  ks��s
�� 
cwins o  or���� 0 name_tm  ��  f * $ click the localised "Cancel" button   g �tt H   c l i c k   t h e   l o c a l i s e d   " C a n c e l "   b u t t o nc   try to cancel   d �uu    t r y   t o   c a n c e la R      ������
�� .ascrerr ****      � ****��  ��  ��  _ vwv l ��xyzx r  ��{|{ l ��}����} n  ��~~ 4  �����
�� 
cobj� o  ������ 0 lg   o  ������ 0 
msgs_error  ��  ��  | o      ���� 0 message_title  y A ; not found : tell user that the preferences weren't changed   z ��� v   n o t   f o u n d   :   t e l l   u s e r   t h a t   t h e   p r e f e r e n c e s   w e r e n ' t   c h a n g e dw ��� r  ����� n  ����� 4  �����
�� 
cobj� o  ������ 0 lg  � o  ������ 0 msgs_notchanged  � o      ���� 0 message  � ���� n ����� I  ��������� 0 	growlnote  � ��� o  ������ 0 growl_error  � ��� o  ������ 0 message_title  � ���� o  ������ 0 message  ��  ��  �  f  ����  [ $  error message if unsuccessful   \ ��� <   e r r o r   m e s s a g e   i f   u n s u c c e s s f u l��  ��  U ��� l ����������  ��  ��  � ��� l ������ I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ~ x wait for a confirmation dialog that appears if you select a partition on the same physical disk as that being backed up   � ��� �   w a i t   f o r   a   c o n f i r m a t i o n   d i a l o g   t h a t   a p p e a r s   i f   y o u   s e l e c t   a   p a r t i t i o n   o n   t h e   s a m e   p h y s i c a l   d i s k   a s   t h a t   b e i n g   b a c k e d   u p� ��� Z  ��������� l �������� I �������
�� .coredoexbool       obj � n  ����� 4  �����
�� 
butT� l �������� n  ����� 4  �����
�� 
cobj� o  ������ 0 lg  � o  ������ 0 names_usebutton  ��  ��  � 4  �����
�� 
cwin� m  ������ ��  ��  ��  � I �������
�� .prcsclicuiel    ��� uiel� n  ����� 4  �����
�� 
butT� l �������� n  ����� 4  �����
�� 
cobj� o  ������ 0 lg  � o  ������ 0 names_usebutton  ��  ��  � 4  �����
�� 
cwin� m  ������ ��  ��  ��  � ��� l ����������  ��  ��  � ��� l ����������  ��  ��  � ���� l �'���� I �'�����
�� .prcsclicuiel    ��� uiel� n  �#��� 4  #���
�� 
menI� l "������ n  "��� 4  !���
�� 
cobj� o   ���� 0 lg  � o  ���� 0 
names_quit  ��  ��  � n  ���� 4  ���
�� 
menE� m  ���� � n  ���� 4  ���
�� 
mbri� l ������ n  ��� 4  ���
�� 
cobj� o  ���� 0 lg  � o  ���� 0 names_prefs  ��  ��  � 4  ����
�� 
mbar� m  ���� ��  �   quit preferences   � ��� "   q u i t   p r e f e r e n c e s��  2 4   � ����
�� 
prcs� m   � ��� ��� $ S y s t e m   P r e f e r e n c e s0 m   � ����                                                                                  sevs  alis    �  Macintosh HD               ���H+    qSystem Events.app                                               64ǚ�|        ����  	                CoreServices    ���      ǚR�      q  -  ,  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��  ��  
 ��� l     ��������  ��  ��  � ��� l      ������  � ) # Try to register script with Growl    � ��� F   T r y   t o   r e g i s t e r   s c r i p t   w i t h   G r o w l  � ��� i   J M��� I      ������� 0 register_growl  ��  �  � Q     C���~� O    :��� k    9�� ��� l   ���� r    ��� J    �� ��� o    �}�} 0 growl_general  � ��� o    �|�| 0 growl_debug  � ��{� o    �z�z 0 growl_error  �{  � l     ��y�x� o      �w�w ,0 allnotificationslist allNotificationsList�y  �x  �   Growl notifications   � ��� (   G r o w l   n o t i f i c a t i o n s� ��� l   +���� r    +��� J    )�� ��� o     �v�v 0 growl_general  � ��� o     !�u�u 	0 growl  � ��� o   ! "�t�t 	0 debug  �  �s  o   " '�r�r 0 growl_error  �s  � l     �q�p o      �o�o 40 enablednotificationslist enabledNotificationsList�q  �p  � !  Those enabled for this app   � � 6   T h o s e   e n a b l e d   f o r   t h i s   a p p� �n I  , 9�m�l
�m .registernull��� ��� null�l   �k
�k 
appl m   . / � * C o n f i g u r e   T i m e M a c h i n e �j	

�j 
anot	 o   0 1�i�i ,0 allnotificationslist allNotificationsList
 �h
�h 
dnot o   2 3�g�g 40 enablednotificationslist enabledNotificationsList �f�e
�f 
iapp m   4 5 �  T i m e M a c h i n e�e  �n  � m    2                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	  E�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      �d�c�b
�d .ascrerr ****      � ****�c  �b  �~  �  l     �a�`�_�a  �`  �_   �^ i   N Q I      �]�\�] 0 	growlnote    o      �[�[ 0 	growltype    o      �Z�Z 0 	msg_title   �Y o      �X�X 0 msg_text  �Y  �\   Q     �W O     I   �V�U 
�V .notifygrnull��� ��� null�U    �T!"
�T 
name! o   	 
�S�S 0 	growltype  " �R#$
�R 
titl# o    �Q�Q 0 	msg_title  $ �P%&
�P 
desc% o    �O�O 0 msg_text  & �N'�M
�N 
appl' m    (( �)) * C o n f i g u r e   T i m e M a c h i n e�M   m    **2                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	  E�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   R      �L�K�J
�L .ascrerr ****      � ****�K  �J  �W  �^       $�I+,-./012345 � � � �6789:�H @;�G�F< < |=�E�D�C�B�A�I  + "�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ��@ 0 names_prefs  �? 0 names_tm  �> 0 
names_view  �= 0 names_usebutton  �< 0 names_cancelbutton  �; 0 
names_quit  �: 0 msgs_general  �9 0 
msgs_error  �8 0 msgs_newvolume  �7 0 msgs_notchanged  �6 0 msg_language  �5 0 growl_general  �4 0 growl_debug  �3 0 growl_error  �2 0 register_growl  �1 0 	growlnote  
�0 .aevtoappnull  �   � ****�/ 0 backup_drives  �. 0 loc_name  �- 0 lg  �, 0 name_tm  �+ 0 tablecontents  �* 0 	rownumber  �) 0 desiredrownumber  �( 0 desired_name  �' 0 preferred_name  �& 0 
volumename  �% 0 message_title  �$ 0 message  �#  �"  �!  �   �  , �>� >   4- �?� ?   @. �@� @   L/ �A� A   X0 �B� B   d1 �C� C   p2 �D� D   |3 �E� E   �4 �F� F   �5 �G� G   �6 ����HI�� 0 register_growl  �  �  H ����� ,0 allnotificationslist allNotificationsList� 	0 growl  � 	0 debug  � 40 enablednotificationslist enabledNotificationsListI ���
�	������ 
� 
appl
�
 
anot
�	 
dnot
� 
iapp� 
� .registernull��� ��� null�  �  � D <� 4b  b  b  mvE�Ob  ��b  �vE�O*������� 	UW X 
 h7 ���JK� � 0 	growlnote  � ��L�� L  �������� 0 	growltype  �� 0 	msg_title  �� 0 msg_text  �  J �������� 0 	growltype  �� 0 	msg_title  �� 0 msg_text  K 
*��������(��������
�� 
name
�� 
titl
�� 
desc
�� 
appl�� 
�� .notifygrnull��� ��� null��  ��  �   � *������ UW X  	h8 ��M����NO��
�� .aevtoappnull  �   � ****M k    )PP  QQ  �RR  �SS  �TT  �UU  �VV 	����  ��  ��  N ������ 0 i  �� 0 tablerow  O 2  ���� ��� ��� ��������������������������������P������������������������������������������������� 0 backup_drives  �� 0 register_growl  
�� .miscactvnull��� ��� null
�� 
prcs
�� kfrmname
�� 
dnam�� 0 loc_name  �� 0 lg  
�� .corecnte****       ****
�� 
cobj�� 0 	growlnote  �� 0 name_tm  
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
�� .coredoexbool       obj 
�� .sysodelanull��� ��� nmbr
�� 
sgrp
�� 
butT
�� 
sheE
�� 
scra
�� 
tabB
�� 
crow�� 0 tablecontents  �� 0 	rownumber  �� 0 desiredrownumber  �� 0 desired_name  �� 0 preferred_name  
�� 
kocl
�� 
txtf
�� 
valL
�� 
TEXT�� 0 
volumename  
�� .ascrcmnt****      � ****
�� .miscslctuiel       uiel�� 0 message_title  �� 0 message  ��  ��  ��*��lvE�O*j+ O�j O� *���0�,E�UOjE�O ,kb   j kh  b   �/�  
�E�OY h[OY��O�j  *b  b  �k/b  
m+ Y�b  ��/E` O��*�a /�*a k/a b  ��/E/a k/a _ /j O h*a _ /j a j [OY��O*a _ /a k/a k/j O !h*a _ /a k/j a j [OY��O*a _ /a k/a k/a k/a  -E` !OjE` "OjE` #Oa $E` %O��k/E` &O �_ ![a '�l kh _ "kE` "O*a _ /a k/a k/a k/a  _ "/a (,a ),a *&E` +O_ +j ,O�_ +a *& $_ "E` #O_ +E` %O_ %_ &  Y hY h[OY��O_ #j � w*a _ /a k/a k/a k/a  _ #/j -O*a _ /a k/a b  ��/E/j Ob  ��/E` .Ob  ��/_ %%E` /O)b  _ ._ /m+ OPW X 0 1jE` #Y hO_ #j  Z #*a _ /a k/a b  ��/E/j W X 0 1hOb  ��/E` .Ob  	��/E` /O)b  _ ._ /m+ Y hOkj O*a k/a b  ��/E/j  *a k/a b  ��/E/j Y hO*a k/a b   ��/E/a k/a b  ��/E/j UU9 ��W�� W    : �XX $ S y s t e m   P r e f e r e n c e s�H ; ��Y�� Y  Z[\]Z ^^ _����_ `����` a����a b����b c��dc  ���e
�� 
pcape �ff $ S y s t e m   P r e f e r e n c e s
�� 
cwind �gg  T i m e   M a c h i n e
�� 
sheE�� 
�� 
scra�� 
�� 
tabB�� 
�� 
crow�� [ hh i����i j����j k����k l����l m��nm  ���o
�� 
pcapo �pp $ S y s t e m   P r e f e r e n c e s
�� 
cwinn �qq  T i m e   M a c h i n e
�� 
sheE�� 
�� 
scra�� 
�� 
tabB�� 
�� 
crow�� \ rr s����s t����t u����u v����v w��xw  ���y
�� 
pcapy �zz $ S y s t e m   P r e f e r e n c e s
�� 
cwinx �{{  T i m e   M a c h i n e
�� 
sheE�� 
�� 
scra�� 
�� 
tabB�� 
�� 
crow�� ] || }����} ~����~ ���� ������ �����  ����
�� 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
�� 
cwin� ���  T i m e   M a c h i n e
�� 
sheE�� 
�� 
scra�� 
�� 
tabB�� 
�� 
crow�� �G �F < ���  T i m e M a c h i n e= ��� b T h e   T i m e   M a c h i n e   b a c k u p   v o l u m e   i s   n o w   T i m e M a c h i n e�E  �D  �C  �B  �A  ascr  ��ޭ