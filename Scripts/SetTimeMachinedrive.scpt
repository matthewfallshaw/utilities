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
  L L � M M  V i e w��   H  N O N l      �� P Q��   P " 	Disc selection button (EN)     Q � R R 8 	 D i s c   s e l e c t i o n   b u t t o n   ( E N )   O  S T S j    �� U�� 0 names_usebutton   U J     V V  W�� W m     X X � Y Y  U s e   B a c k u p   D i s k��   T  Z [ Z l      �� \ ]��   \  	Cancel button (EN)     ] � ^ ^ ( 	 C a n c e l   b u t t o n   ( E N )   [  _ ` _ j    �� a�� 0 names_cancelbutton   a J     b b  c�� c m     d d � e e  C a n c e l��   `  f g f l      �� h i��   h  	Quit command (EN)     i � j j & 	 Q u i t   c o m m a n d   ( E N )   g  k l k j    �� m�� 0 
names_quit   m J     n n  o�� o m     p p � q q . Q u i t   S y s t e m   P r e f e r e n c e s��   l  r s r l      �� t u��   t ! 	General notification (EN)     u � v v 6 	 G e n e r a l   n o t i f i c a t i o n   ( E N )   s  w x w j    "�� y�� 0 msgs_general   y J    ! z z  {�� { m     | | � } } ( G e n e r a l   n o t i f i c a t i o n��   x  ~  ~ l      �� � ���   �  	Error notification (EN)     � � � � 2 	 E r r o r   n o t i f i c a t i o n   ( E N )     � � � j   # '�� ��� 0 
msgs_error   � J   # & � �  ��� � m   # $ � � � � � 
 E R R O R��   �  � � � l      �� � ���   �  	Success message (EN)     � � � � , 	 S u c c e s s   m e s s a g e   ( E N )   �  � � � j   ( .�� ��� 0 msgs_newvolume   � J   ( - � �  ��� � m   ( + � � � � � L T h e   T i m e   M a c h i n e   b a c k u p   v o l u m e   i s   n o w  ��   �  � � � l      �� � ���   �  	Error message (EN)     � � � � ( 	 E r r o r   m e s s a g e   ( E N )   �  � � � j   / 5�� ��� 0 msgs_notchanged   � J   / 4 � �  ��� � m   / 2 � � � � � R T i m e   M a c h i n e   p r e f e r e n c e s   w e r e   n o t   c h a n g e d��   �  � � � l      �� � ���   � "  Language not found message     � � � � 8   L a n g u a g e   n o t   f o u n d   m e s s a g e   �  � � � j   6 :�� ��� 0 msg_language   � m   6 9 � � � � � 4 E R R O R   -   l a n g u a g e   n o t   f o u n d �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   ; ?�� ��� 0 growl_general   � m   ; > � � � � � ( G e n e r a l   N o t i f i c a t i o n �   Growl notification types    � � � � 2   G r o w l   n o t i f i c a t i o n   t y p e s �  � � � j   @ D�� ��� 0 growl_debug   � m   @ C � � � � � $ D e b u g   N o t i f i c a t i o n �  � � � j   E I�� ��� 0 growl_error   � m   E H � � � � � $ E r r o r   N o t i f i c a t i o n �  � � � l    � � � � I    �������� 0 register_growl  ��  ��   � . ( register with Growl notification system    � � � � P   r e g i s t e r   w i t h   G r o w l   n o t i f i c a t i o n   s y s t e m �  � � � l     ��������  ��  ��   �  � � � l    � � � � I   �� ���
�� .miscactvnull��� ��� null � m     � ��                                                                                  sprf  alis    ~  Macintosh HD               ���H+  5�System Preferences.app                                         6xf�).�        ����  	                Applications    ���      �(�    5�  1Macintosh HD:Applications: System Preferences.app   .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��   � %  activate or launch preferences    � � � � >   a c t i v a t e   o r   l a u n c h   p r e f e r e n c e s �  � � � l   ! ����� � O    ! � � � l     � � � � r      � � � n     � � � 1    ��
�� 
dnam � 5    �� ���
�� 
prcs � m     � � � � � $ S y s t e m   P r e f e r e n c e s
�� kfrmname � o      ���� 0 loc_name   � C = get the localized_name of the System Preferences application    � � � � z   g e t   t h e   l o c a l i z e d _ n a m e   o f   t h e   S y s t e m   P r e f e r e n c e s   a p p l i c a t i o n � m     � ��                                                                                  sevs  alis    �  Macintosh HD               ���H+  5��System Events.app                                              6x&� ��        ����  	                CoreServices    ���      � PB    5��5��5��  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � p   J J � � ������ 0 lg  ��   � ; 5 allow language index to be accessed from subroutines    � � � � j   a l l o w   l a n g u a g e   i n d e x   t o   b e   a c c e s s e d   f r o m   s u b r o u t i n e s �  � � � l  " % � � � � r   " % � � � m   " #����   � o      ���� 0 lg   � 7 1 find out the language used by system preferences    � � � � b   f i n d   o u t   t h e   l a n g u a g e   u s e d   b y   s y s t e m   p r e f e r e n c e s �  � � � l  & S ����� � Y   & S ��� � ��� � Z   8 N � ����� � =   8 B � � � n   8 @ � � � 4   = @�� �
�� 
cobj � o   > ?���� 0 i   � o   8 =���� 0 names_prefs   � o   @ A���� 0 loc_name   � k   E J    r   E H o   E F���� 0 i   o      ���� 0 lg   ��  S   I J��  ��  ��  �� 0 i   � m   ) *����  � I  * 3����
�� .corecnte****       **** o   * /���� 0 names_prefs  ��  ��  ��  ��   �  l     ��������  ��  ��   	
	 l  T>���� Z   T>�� =   T W o   T U���� 0 lg   m   U V����   l  Z q I   Z q������ 0 	growlnote    o   [ `���� 0 growl_error    n   ` h 4   e h��
�� 
cobj m   f g����  o   ` e���� 0 
msgs_error   �� o   h m���� 0 msg_language  ��  ��   + % language not found - exit with error    � J   l a n g u a g e   n o t   f o u n d   -   e x i t   w i t h   e r r o r��   k   t>   l  t t��������  ��  ��    !"! l  t �#$%# r   t �&'& n   t |()( 4   y |��*
�� 
cobj* o   z {���� 0 lg  ) o   t y���� 0 names_tm  ' o      ���� 0 name_tm  $ > 8 get name of Time Machine because it is used quite often   % �++ p   g e t   n a m e   o f   T i m e   M a c h i n e   b e c a u s e   i t   i s   u s e d   q u i t e   o f t e n" ,-, l  � ���������  ��  ��  - .��. O   �>/0/ O   �=121 k   �<33 454 l  � �6786 I  � ���9��
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
cobj� m  @A�I�I � o  >?�H�H 0 backup_drives  � o      �G�G 0 preferred_name  � J D get name of the preferred / primary backup volume = 1st in the list   � ��� �   g e t   n a m e   o f   t h e   p r e f e r r e d   /   p r i m a r y   b a c k u p   v o l u m e   =   1 s t   i n   t h e   l i s t� ��� X  G���F�� k  [��� ��� r  [d��� [  [`��� o  [^�E�E 0 	rownumber  � m  ^_�D�D � o      �C�C 0 	rownumber  � ��� r  e���� n  e���� 4  ���B�
�B 
cpar� m  ���A�A � l e���@�?� c  e���� l e���>�=� n  e���� 1  ���<
�< 
valL� n  e���� m  ���;
�; 
txtf� n  e���� 4  |��:�
�: 
crow� o  ��9�9 0 	rownumber  � n  e|��� 4  w|�8�
�8 
tabB� m  z{�7�7 � n  ew��� 4  rw�6�
�6 
scra� m  uv�5�5 � n  er��� 4  mr�4�
�4 
sheE� m  pq�3�3 � 4  em�2�
�2 
cwin� o  il�1�1 0 name_tm  �>  �=  � m  ���0
�0 
TEXT�@  �?  � o      �/�/ 0 
volumename  � ��� I ���.��-
�. .ascrcmnt****      � ****� o  ���,�, 0 
volumename  �-  � ��+� Z  �����*�)� E ����� o  ���(�( 0 backup_drives  � l ����'�&� c  ����� o  ���%�% 0 
volumename  � m  ���$
�$ 
TEXT�'  �&  � l ������ k  ���� ��� l ������ r  ����� o  ���#�# 0 	rownumber  � o      �"�" 0 desiredrownumber  � 0 * set the desired row number in volume list   � ��� T   s e t   t h e   d e s i r e d   r o w   n u m b e r   i n   v o l u m e   l i s t� ��� l ������ r  ����� o  ���!�! 0 
volumename  � o      � �  0 desired_name  � "  set the desired volume name   � ��� 8   s e t   t h e   d e s i r e d   v o l u m e   n a m e� ��� I �����
� .ascrcmnt****      � ****� o  ���� 0 desiredrownumber  �  � ��� I �����
� .ascrcmnt****      � ****� o  ���� 0 desired_name  �  � ��� l ������ Z ��� ��� =  �� o  ���� 0 desired_name   o  ���� 0 preferred_name     S  ���  �  � 2 , keep this one if this is the primary volume   � � X   k e e p   t h i s   o n e   i f   t h i s   i s   t h e   p r i m a r y   v o l u m e�  � !  found a volume in the list   � � 6   f o u n d   a   v o l u m e   i n   t h e   l i s t�*  �)  �+  �F 0 tablerow  � o  JM�� 0 tablecontents  �  Z  �t�� ?  ��	
	 o  ���� 0 desiredrownumber  
 m  ����   Q  �p k  �c  l � I ���
� .miscslctuiel       uiel n  � 4  �
� 
crow o  �� 0 desiredrownumber   n  � 4  �
� 
tabB m  �
�
  n  � 4  ��	
�	 
scra m  ��  n  �� 4  ��� 
� 
sheE  m  ����  4  ���!
� 
cwin! o  ���� 0 name_tm  �   ( " select the desired volume in list    �"" D   s e l e c t   t h e   d e s i r e d   v o l u m e   i n   l i s t #$# l 2%&'% I 2�(�
� .prcsclicuiel    ��� uiel( n  .)*) 4  !.�+
� 
butT+ l $-,� ��, n  $--.- 4  ),��/
�� 
cobj/ o  *+���� 0 lg  . o  $)���� 0 names_usebutton  �   ��  * n  !010 4  !��2
�� 
sheE2 m   ���� 1 4  ��3
�� 
cwin3 o  ���� 0 name_tm  �  & ' ! click the localised "use" button   ' �44 B   c l i c k   t h e   l o c a l i s e d   " u s e "   b u t t o n$ 565 l 3?7897 r  3?:;: l 3;<����< n  3;=>= 4  8;��?
�� 
cobj? o  9:���� 0 lg  > o  38���� 0 msgs_general  ��  ��  ; o      ���� 0 message_title  8 D > tell user that a backup volume has been successfully selected   9 �@@ |   t e l l   u s e r   t h a t   a   b a c k u p   v o l u m e   h a s   b e e n   s u c c e s s f u l l y   s e l e c t e d6 ABA r  @PCDC b  @LEFE l @HG����G n  @HHIH 4  EH��J
�� 
cobjJ o  FG���� 0 lg  I o  @E���� 0 msgs_newvolume  ��  ��  F o  HK���� 0 desired_name  D o      ���� 0 message  B KLK n QaMNM I  Ra��O���� 0 	growlnote  O PQP o  RW���� 0 growl_general  Q RSR o  WZ���� 0 message_title  S T��T o  Z]���� 0 message  ��  ��  N  f  QRL U��U l bb��������  ��  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��   l kpVWXV r  kpYZY m  kl����  Z o      ���� 0 desiredrownumber  W B < if failure for some reason, reset row number to 0 = nothing   X �[[ x   i f   f a i l u r e   f o r   s o m e   r e a s o n ,   r e s e t   r o w   n u m b e r   t o   0   =   n o t h i n g�  �   \]\ l uu��������  ��  ��  ] ^_^ Z  u�`a����` =  uzbcb o  ux���� 0 desiredrownumber  c m  xy����  a l }�defd k  }�gg hih Q  }�jk��j l ��lmnl l ��opqo I ����r��
�� .prcsclicuiel    ��� uielr n  ��sts 4  ����u
�� 
butTu l ��v����v n  ��wxw 4  ����y
�� 
cobjy o  ������ 0 lg  x o  ������ 0 names_cancelbutton  ��  ��  t n  ��z{z 4  ����|
�� 
sheE| m  ������ { 4  ����}
�� 
cwin} o  ������ 0 name_tm  ��  p * $ click the localised "Cancel" button   q �~~ H   c l i c k   t h e   l o c a l i s e d   " C a n c e l "   b u t t o nm   try to cancel   n �    t r y   t o   c a n c e lk R      ������
�� .ascrerr ****      � ****��  ��  ��  i ��� l ������ r  ����� l �������� n  ����� 4  �����
�� 
cobj� o  ������ 0 lg  � o  ������ 0 
msgs_error  ��  ��  � o      ���� 0 message_title  � A ; not found : tell user that the preferences weren't changed   � ��� v   n o t   f o u n d   :   t e l l   u s e r   t h a t   t h e   p r e f e r e n c e s   w e r e n ' t   c h a n g e d� ��� r  ����� n  ����� 4  �����
�� 
cobj� o  ������ 0 lg  � o  ������ 0 msgs_notchanged  � o      ���� 0 message  � ���� n ����� I  ��������� 0 	growlnote  � ��� o  ������ 0 growl_error  � ��� o  ������ 0 message_title  � ���� o  ������ 0 message  ��  ��  �  f  ����  e $  error message if unsuccessful   f ��� <   e r r o r   m e s s a g e   i f   u n s u c c e s s f u l��  ��  _ ��� l ����������  ��  ��  � ��� l ������ I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ~ x wait for a confirmation dialog that appears if you select a partition on the same physical disk as that being backed up   � ��� �   w a i t   f o r   a   c o n f i r m a t i o n   d i a l o g   t h a t   a p p e a r s   i f   y o u   s e l e c t   a   p a r t i t i o n   o n   t h e   s a m e   p h y s i c a l   d i s k   a s   t h a t   b e i n g   b a c k e d   u p� ��� Z  �������� l �������� I �������
�� .coredoexbool       obj � n  ����� 4  �����
�� 
butT� l �������� n  ����� 4  �����
�� 
cobj� o  ������ 0 lg  � o  ������ 0 names_usebutton  ��  ��  � 4  �����
�� 
cwin� m  ������ ��  ��  ��  � I ������
�� .prcsclicuiel    ��� uiel� n  �
��� 4  �
���
�� 
butT� l  	������ n   	��� 4  ���
�� 
cobj� o  ���� 0 lg  � o   ���� 0 names_usebutton  ��  ��  � 4  �����
�� 
cwin� m  ������ ��  ��  ��  � ��� l ��������  ��  ��  � ��� l ��������  ��  ��  � ���� l <���� I <�����
�� .prcsclicuiel    ��� uiel� n  8��� 4  +8���
�� 
menI� l .7������ n  .7��� 4  36���
�� 
cobj� o  45���� 0 lg  � o  .3���� 0 
names_quit  ��  ��  � n  +��� 4  &+���
�� 
menE� m  )*���� � n  &��� 4  &���
�� 
mbri� l %������ n  %��� 4  !$���
�� 
cobj� o  "#���� 0 lg  � o  !�� 0 names_prefs  ��  ��  � 4  �~�
�~ 
mbar� m  �}�} ��  �   quit preferences   � ��� "   q u i t   p r e f e r e n c e s��  2 4   � ��|�
�| 
prcs� m   � ��� ��� $ S y s t e m   P r e f e r e n c e s0 m   � ����                                                                                  sevs  alis    �  Macintosh HD               ���H+  5��System Events.app                                              6x&� ��        ����  	                CoreServices    ���      � PB    5��5��5��  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��  ��  
 ��� l     �{�z�y�{  �z  �y  � ��� l      �x���x  � ) # Try to register script with Growl    � ��� F   T r y   t o   r e g i s t e r   s c r i p t   w i t h   G r o w l  � ��� i   J M��� I      �w�v�u�w 0 register_growl  �v  �u  � Q     C���t� O    :��� k    9�� ��� l   ���� r    ��� J    �� ��� o    �s�s 0 growl_general  � ��� o    �r�r 0 growl_debug  � ��q� o    �p�p 0 growl_error  �q  � l     ��o�n� o      �m�m ,0 allnotificationslist allNotificationsList�o  �n  �   Growl notifications   � ��� (   G r o w l   n o t i f i c a t i o n s� ��� l   +�� � r    + J    )  o     �l�l 0 growl_general    o     !�k�k 	0 growl   	 o   ! "�j�j 	0 debug  	 
�i
 o   " '�h�h 0 growl_error  �i   l     �g�f o      �e�e 40 enablednotificationslist enabledNotificationsList�g  �f  � !  Those enabled for this app     � 6   T h o s e   e n a b l e d   f o r   t h i s   a p p� �d I  , 9�c�b
�c .registernull��� ��� null�b   �a
�a 
appl m   . / � * C o n f i g u r e   T i m e M a c h i n e �`
�` 
anot o   0 1�_�_ ,0 allnotificationslist allNotificationsList �^
�^ 
dnot o   2 3�]�] 40 enablednotificationslist enabledNotificationsList �\�[
�\ 
iapp m   4 5 �  T i m e M a c h i n e�[  �d  � m    6                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	 6��5�I  ^Macintosh HD:Library: PreferencePanes: Growl.prefPane: Contents: Resources: GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      �Z�Y�X
�Z .ascrerr ****      � ****�Y  �X  �t  �  l     �W�V�U�W  �V  �U   �T i   N Q I      �S �R�S 0 	growlnote    !"! o      �Q�Q 0 	growltype  " #$# o      �P�P 0 	msg_title  $ %�O% o      �N�N 0 msg_text  �O  �R   Q     &'�M& O    ()( I   �L�K*
�L .notifygrnull��� ��� null�K  * �J+,
�J 
name+ o   	 
�I�I 0 	growltype  , �H-.
�H 
titl- o    �G�G 0 	msg_title  . �F/0
�F 
desc/ o    �E�E 0 msg_text  0 �D1�C
�D 
appl1 m    22 �33 * C o n f i g u r e   T i m e M a c h i n e�C  ) m    446                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	 6��5�I  ^Macintosh HD:Library: PreferencePanes: Growl.prefPane: Contents: Resources: GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  ' R      �B�A�@
�B .ascrerr ****      � ****�A  �@  �M  �T       $�?56789:;<=>? � � � �@ABCD�> @E�=�<F G |H�;�:�9�8�7�?  5 "�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ������������6 0 names_prefs  �5 0 names_tm  �4 0 
names_view  �3 0 names_usebutton  �2 0 names_cancelbutton  �1 0 
names_quit  �0 0 msgs_general  �/ 0 
msgs_error  �. 0 msgs_newvolume  �- 0 msgs_notchanged  �, 0 msg_language  �+ 0 growl_general  �* 0 growl_debug  �) 0 growl_error  �( 0 register_growl  �' 0 	growlnote  
�& .aevtoappnull  �   � ****�% 0 backup_drives  �$ 0 loc_name  �# 0 lg  �" 0 name_tm  �! 0 tablecontents  �  0 	rownumber  � 0 desiredrownumber  � 0 desired_name  � 0 preferred_name  � 0 
volumename  � 0 message_title  � 0 message  �  �  �  �  �  6 �I� I   47 �J� J   @8 �K� K   L9 �L� L   X: �M� M   d; �N� N   p< �O� O   |= �P� P   �> �Q� Q   �? �R� R   �@ �
��	�ST��
 0 register_growl  �	  �  S ����� ,0 allnotificationslist allNotificationsList� 	0 growl  � 	0 debug  � 40 enablednotificationslist enabledNotificationsListT ��� ������������� 
� 
appl
�  
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null��  ��  � D <� 4b  b  b  mvE�Ob  ��b  �vE�O*������� 	UW X 
 hA ������UV���� 0 	growlnote  �� ��W�� W  �������� 0 	growltype  �� 0 	msg_title  �� 0 msg_text  ��  U �������� 0 	growltype  �� 0 	msg_title  �� 0 msg_text  V 
4��������2��������
�� 
name
�� 
titl
�� 
desc
�� 
appl�� 
�� .notifygrnull��� ��� null��  ��  ��  � *������ UW X  	hB ��X����YZ��
�� .aevtoappnull  �   � ****X k    >[[  \\  �]]  �^^  �__  �``  �aa 	����  ��  ��  Y ������ 0 i  �� 0 tablerow  Z 3  ���� ��� ��� ��������������������������������P��������������������������������������������������� 0 backup_drives  �� 0 register_growl  
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
TEXT
�� 
cpar�� 0 
volumename  
�� .ascrcmnt****      � ****
�� .miscslctuiel       uiel�� 0 message_title  �� 0 message  ��  ��  ��?��lvE�O*j+ O�j O� *���0�,E�UOjE�O ,kb   j kh  b   �/�  
�E�OY h[OY��O�j  *b  b  �k/b  
m+ Y�b  ��/E` O��*�a /�*a k/a b  ��/E/a k/a _ /j O h*a _ /j a j [OY��O*a _ /a k/a k/j O !h*a _ /a k/j a j [OY��O*a _ /a k/a k/a k/a  -E` !OjE` "OjE` #Oa $E` %O��k/E` &O �_ ![a '�l kh _ "kE` "O*a _ /a k/a k/a k/a  _ "/a (,a ),a *&a +k/E` ,O_ ,j -O�_ ,a *& 4_ "E` #O_ ,E` %O_ #j -O_ %j -O_ %_ &  Y hY h[OY�uO_ #j � w*a _ /a k/a k/a k/a  _ #/j .O*a _ /a k/a b  ��/E/j Ob  ��/E` /Ob  ��/_ %%E` 0O)b  _ /_ 0m+ OPW X 1 2jE` #Y hO_ #j  Z #*a _ /a k/a b  ��/E/j W X 1 2hOb  ��/E` /Ob  	��/E` 0O)b  _ /_ 0m+ Y hOkj O*a k/a b  ��/E/j  *a k/a b  ��/E/j Y hO*a k/a b   ��/E/a k/a b  ��/E/j UUC ��b�� b    D �cc $ S y s t e m   P r e f e r e n c e s�> E ��d�� d  efghije kk l����l m����m n����n o����o p��qp  ���r
�� 
pcapr �ss $ S y s t e m   P r e f e r e n c e s
�� 
cwinq �tt  T i m e   M a c h i n e
�� 
sheE�� 
�� 
scra�� 
�� 
tabB�� 
�� 
crow�� f uu v����v w����w x����x y����y z��{z  ���|
�� 
pcap| �}} $ S y s t e m   P r e f e r e n c e s
�� 
cwin{ �~~  T i m e   M a c h i n e
�� 
sheE�� 
�� 
scra�� 
�� 
tabB�� 
�� 
crow�� g  ������ ������ ������ ������ �����  ����
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
crow�� h �� ������ ������ ������ ������ �����  ����
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
crow�� i �� ������ ������ ������ ������ �����  ����
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
crow�� j �� ����� ��~�}� ��|�{� ��z�y� ��x��  ��w�
�w 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
�x 
cwin� ���  T i m e   M a c h i n e
�z 
sheE�y 
�| 
scra�{ 
�~ 
tabB�} 
�� 
crow� �= �< F ��� 
 S p a r eG ��� 2 S e t   U p   O t h e r   T i m e   C a p s u l eH ��� V T h e   T i m e   M a c h i n e   b a c k u p   v o l u m e   i s   n o w   S p a r e�;  �:  �9  �8  �7   ascr  ��ޭ