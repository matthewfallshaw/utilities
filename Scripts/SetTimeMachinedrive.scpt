FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l      �� 	 
��   	 X R Original source : http://www.macosxhints.com/article.php?story=20080105135511764     
 �   �   O r i g i n a l   s o u r c e   :   h t t p : / / w w w . m a c o s x h i n t s . c o m / a r t i c l e . p h p ? s t o r y = 2 0 0 8 0 1 0 5 1 3 5 5 1 1 7 6 4        l     ��������  ��  ��        l     ��������  ��  ��        l      ��  ��   a[	 This is a script to automatically choose which volume to have time machine back up to. If the primary volume (= 1st in the list) is available, it will be chosen, otherwise it will choose any volume available in the list. If none is available, it will make no changes to the time machine preferences.

To use, set the names of the volumes here :      �  � 	   T h i s   i s   a   s c r i p t   t o   a u t o m a t i c a l l y   c h o o s e   w h i c h   v o l u m e   t o   h a v e   t i m e   m a c h i n e   b a c k   u p   t o .   I f   t h e   p r i m a r y   v o l u m e   ( =   1 s t   i n   t h e   l i s t )   i s   a v a i l a b l e ,   i t   w i l l   b e   c h o s e n ,   o t h e r w i s e   i t   w i l l   c h o o s e   a n y   v o l u m e   a v a i l a b l e   i n   t h e   l i s t .   I f   n o n e   i s   a v a i l a b l e ,   i t   w i l l   m a k e   n o   c h a n g e s   t o   t h e   t i m e   m a c h i n e   p r e f e r e n c e s . 
 
 T o   u s e ,   s e t   t h e   n a m e s   o f   t h e   v o l u m e s   h e r e   :        l     ��������  ��  ��        l     ����  r         J            m        �      T i m e M a c h i n e   !�� ! m     " " � # # 
 S p a r e��    o      ���� 0 backup_drives  ��  ��     $ % $ l     ��������  ��  ��   %  & ' & l      �� ( )��   (@:
Then launch the script whenever you want to change the time machine backup. The excellent utility DSW (http://www.azarhi.com/) can be used to launch the script whenever a volume is mounted or unmounted.

The script attempts to use growl to notify the user of its results.

Note that GUI scripting must be enabled
    ) � * *t 
 T h e n   l a u n c h   t h e   s c r i p t   w h e n e v e r   y o u   w a n t   t o   c h a n g e   t h e   t i m e   m a c h i n e   b a c k u p .   T h e   e x c e l l e n t   u t i l i t y   D S W   ( h t t p : / / w w w . a z a r h i . c o m / )   c a n   b e   u s e d   t o   l a u n c h   t h e   s c r i p t   w h e n e v e r   a   v o l u m e   i s   m o u n t e d   o r   u n m o u n t e d . 
 
 T h e   s c r i p t   a t t e m p t s   t o   u s e   g r o w l   t o   n o t i f y   t h e   u s e r   o f   i t s   r e s u l t s . 
 
 N o t e   t h a t   G U I   s c r i p t i n g   m u s t   b e   e n a b l e d 
 '  + , + l     ��������  ��  ��   ,  - . - l     ��������  ��  ��   .  / 0 / l      �� 1 2��   1 9 3	User interface elements required for UI scripting     2 � 3 3 f 	 U s e r   i n t e r f a c e   e l e m e n t s   r e q u i r e d   f o r   U I   s c r i p t i n g   0  4 5 4 l     ��������  ��  ��   5  6 7 6 l      �� 8 9��   8   Lists : 1 english     9 � : : &   L i s t s   :   1   e n g l i s h   7  ; < ; l     ��������  ��  ��   <  = > = l      �� ? @��   ?  	Application (EN)     @ � A A $ 	 A p p l i c a t i o n   ( E N )   >  B C B l     ��������  ��  ��   C  D E D j     �� F�� 0 names_prefs   F J      G G  H�� H m      I I � J J $ S y s t e m   P r e f e r e n c e s��   E  K L K l     ��������  ��  ��   L  M N M l     ��������  ��  ��   N  O P O l      �� Q R��   Q   Time machine     R � S S    T i m e   m a c h i n e   P  T U T l     ��������  ��  ��   U  V W V j    	�� X�� 0 names_tm   X J     Y Y  Z�� Z m     [ [ � \ \  T i m e   M a c h i n e��   W  ] ^ ] l     ��������  ��  ��   ^  _ ` _ l     ��������  ��  ��   `  a b a l      �� c d��   c &  	Preference pane list menu (EN)     d � e e @ 	 P r e f e r e n c e   p a n e   l i s t   m e n u   ( E N )   b  f g f l     ��������  ��  ��   g  h i h j   
 �� j�� 0 
names_view   j J   
  k k  l�� l m   
  m m � n n  V i e w��   i  o p o l     ��������  ��  ��   p  q r q l     ��������  ��  ��   r  s t s l      �� u v��   u " 	Disc selection button (EN)     v � w w 8 	 D i s c   s e l e c t i o n   b u t t o n   ( E N )   t  x y x l     ��������  ��  ��   y  z { z j    �� |�� 0 names_usebutton   | J     } }  ~�� ~ m       � � �  U s e   f o r   B a c k u p��   {  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   �  	Cancel button (EN)     � � � � ( 	 C a n c e l   b u t t o n   ( E N )   �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 0 names_cancelbutton   � J     � �  ��� � m     � � � � �  C a n c e l��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   �  	Quit command (EN)     � � � � & 	 Q u i t   c o m m a n d   ( E N )   �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 0 
names_quit   � J     � �  ��� � m     � � � � � . Q u i t   S y s t e m   P r e f e r e n c e s��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � ! 	General notification (EN)     � � � � 6 	 G e n e r a l   n o t i f i c a t i o n   ( E N )   �  � � � l     ��������  ��  ��   �  � � � j    "�� ��� 0 msgs_general   � J    ! � �  ��� � m     � � � � � ( G e n e r a l   n o t i f i c a t i o n��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   �  	Error notification (EN)     � � � � 2 	 E r r o r   n o t i f i c a t i o n   ( E N )   �  � � � l     ��������  ��  ��   �  � � � j   # '�� ��� 0 
msgs_error   � J   # & � �  ��� � m   # $ � � � � � 
 E R R O R��   �  � � � l     ����~��  �  �~   �  � � � l     �}�|�{�}  �|  �{   �  � � � l      �z � ��z   �  	Success message (EN)     � � � � , 	 S u c c e s s   m e s s a g e   ( E N )   �  � � � l     �y�x�w�y  �x  �w   �  � � � j   ( .�v ��v 0 msgs_newvolume   � J   ( - � �  ��u � m   ( + � � � � � L T h e   T i m e   M a c h i n e   b a c k u p   v o l u m e   i s   n o w  �u   �  � � � l     �t�s�r�t  �s  �r   �  � � � l     �q�p�o�q  �p  �o   �  � � � l      �n � ��n   �  	Error message (EN)     � � � � ( 	 E r r o r   m e s s a g e   ( E N )   �  � � � l     �m�l�k�m  �l  �k   �  � � � j   / 5�j ��j 0 msgs_notchanged   � J   / 4 � �  ��i � m   / 2 � � � � � R T i m e   M a c h i n e   p r e f e r e n c e s   w e r e   n o t   c h a n g e d�i   �  � � � l     �h�g�f�h  �g  �f   �  � � � l     �e�d�c�e  �d  �c   �  � � � l      �b � ��b   � "  Language not found message     � � � � 8   L a n g u a g e   n o t   f o u n d   m e s s a g e   �  � � � l     �a�`�_�a  �`  �_   �  � � � j   6 :�^ ��^ 0 msg_language   � m   6 9 � � � � � 4 E R R O R   -   l a n g u a g e   n o t   f o u n d �  � � � l     �]�\�[�]  �\  �[   �  �  � l     �Z�Y�X�Z  �Y  �X     l      j   ; ?�W�W 0 growl_general   m   ; > � ( G e n e r a l   N o t i f i c a t i o n   Growl notification types    �		 2   G r o w l   n o t i f i c a t i o n   t y p e s 

 j   @ D�V�V 0 growl_debug   m   @ C � $ D e b u g   N o t i f i c a t i o n  j   E I�U�U 0 growl_error   m   E H � $ E r r o r   N o t i f i c a t i o n  l     �T�S�R�T  �S  �R    l     �Q�P�O�Q  �P  �O    l    I    �N�M�L�N 0 register_growl  �M  �L   . ( register with Growl notification system    � P   r e g i s t e r   w i t h   G r o w l   n o t i f i c a t i o n   s y s t e m  l     �K�J�I�K  �J  �I    !  l     �H�G�F�H  �G  �F  ! "#" l     �E�D�C�E  �D  �C  # $%$ l   &'(& I   �B)�A
�B .miscactvnull��� ��� null) m    **�                                                                                  sprf  alis    |  Macintosh HD               ���H+    xSystem Preferences.app                                          6f��ϛ        ����  	                Applications    ���      ��B�      x  0Macintosh HD:Applications:System Preferences.app  .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  �A  ' %  activate or launch preferences   ( �++ >   a c t i v a t e   o r   l a u n c h   p r e f e r e n c e s% ,-, l     �@�?�>�@  �?  �>  - ./. l     �=�<�;�=  �<  �;  / 010 l   !2�:�92 O    !343 l    5675 r     898 n    :;: 1    �8
�8 
dnam; 5    �7<�6
�7 
prcs< m    == �>> $ S y s t e m   P r e f e r e n c e s
�6 kfrmname9 o      �5�5 0 loc_name  6 C = get the localized_name of the System Preferences application   7 �?? z   g e t   t h e   l o c a l i z e d _ n a m e   o f   t h e   S y s t e m   P r e f e r e n c e s   a p p l i c a t i o n4 m    @@�                                                                                  sevs  alis    �  Macintosh HD               ���H+    qSystem Events.app                                               64ǚ�|        ����  	                CoreServices    ���      ǚR�      q  -  ,  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �:  �9  1 ABA l     �4�3�2�4  �3  �2  B CDC l     EFGE p   J JHH �1�0�1 0 lg  �0  F ; 5 allow language index to be accessed from subroutines   G �II j   a l l o w   l a n g u a g e   i n d e x   t o   b e   a c c e s s e d   f r o m   s u b r o u t i n e sD JKJ l     �/�.�-�/  �.  �-  K LML l  " %NOPN r   " %QRQ m   " #�,�,  R o      �+�+ 0 lg  O 7 1 find out the language used by system preferences   P �SS b   f i n d   o u t   t h e   l a n g u a g e   u s e d   b y   s y s t e m   p r e f e r e n c e sM TUT l  & SV�*�)V Y   & SW�(XY�'W Z   8 NZ[�&�%Z =   8 B\]\ n   8 @^_^ 4   = @�$`
�$ 
cobj` o   > ?�#�# 0 i  _ o   8 =�"�" 0 names_prefs  ] o   @ A�!�! 0 loc_name  [ k   E Jaa bcb r   E Hded o   E F� �  0 i  e o      �� 0 lg  c f�f  S   I J�  �&  �%  �( 0 i  X m   ) *�� Y I  * 3�g�
� .corecnte****       ****g o   * /�� 0 names_prefs  �  �'  �*  �)  U hih l     ����  �  �  i jkj l  T)l��l Z   T)mn�om =   T Wpqp o   T U�� 0 lg  q m   U V��  n l  Z qrstr I   Z q�u�� 0 	growlnote  u vwv o   [ `�� 0 growl_error  w xyx n   ` hz{z 4   e h�|
� 
cobj| m   f g�� { o   ` e�� 0 
msgs_error  y }�} o   h m�
�
 0 msg_language  �  �  s + % language not found - exit with error   t �~~ J   l a n g u a g e   n o t   f o u n d   -   e x i t   w i t h   e r r o r�  o k   t) ��� l  t t�	���	  �  �  � ��� l  t ����� r   t ���� n   t |��� 4   y |��
� 
cobj� o   z {�� 0 lg  � o   t y�� 0 names_tm  � o      �� 0 name_tm  � > 8 get name of Time Machine because it is used quite often   � ��� p   g e t   n a m e   o f   T i m e   M a c h i n e   b e c a u s e   i t   i s   u s e d   q u i t e   o f t e n� ��� l  � ���� �  �  �   � ���� O   �)��� O   �(��� k   �'�� ��� l  � ����� I  � ������
�� .prcsclicuiel    ��� uiel� n   � ���� 4   � ����
�� 
menI� o   � ����� 0 name_tm  � n   � ���� 4   � ����
�� 
menE� m   � ����� � n   � ���� 4   � ����
�� 
mbri� l  � ������� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 lg  � o   � ����� 0 
names_view  ��  ��  � 4   � ����
�� 
mbar� m   � ����� ��  � 5 / directly activate Time Machine panel from menu   � ��� ^   d i r e c t l y   a c t i v a t e   T i m e   M a c h i n e   p a n e l   f r o m   m e n u� ��� l  � ���������  ��  ��  � ��� W   � ���� I  � ������
�� .sysodelanull��� ��� nmbr� m   � ��� ?ə�������  � I  � ������
�� .coredoexbool       obj � 4   � ����
�� 
cwin� o   � ����� 0 name_tm  ��  � ��� l  � ����� I  � ������
�� .prcsclicuiel    ��� uiel� n   � ���� 4   � ����
�� 
butT� m   � ����� � n   � ���� 4   � ����
�� 
sgrp� m   � ����� � 4   � ����
�� 
cwin� o   � ����� 0 name_tm  ��  �   change disk button   � ��� &   c h a n g e   d i s k   b u t t o n� ��� l  � ���������  ��  ��  � ��� l   � �������  � !  Choose 1st available disk    � ��� 6   C h o o s e   1 s t   a v a i l a b l e   d i s k  � ��� W   �	��� l  ����� I  ������
�� .sysodelanull��� ��� nmbr� m   � �� ?ə�������  � , & wait till disk change dialog comes up   � ��� L   w a i t   t i l l   d i s k   c h a n g e   d i a l o g   c o m e s   u p� I  � ������
�� .coredoexbool       obj � n   � ���� 4   � ����
�� 
sheE� m   � ����� � 4   � ����
�� 
cwin� o   � ����� 0 name_tm  ��  � ��� l 

��������  ��  ��  � ��� l 
)���� r  
)��� l 
%������ n  
%��� 2 !%��
�� 
crow� n  
!��� 4  !���
�� 
tabB� m   ���� � n  
��� 4  ���
�� 
scra� m  ���� � n  
��� 4  ���
�� 
sheE� m  ���� � 4  
���
�� 
cwin� o  ���� 0 name_tm  ��  ��  � o      ���� 0 tablecontents  �   traverse disk list   � ��� &   t r a v e r s e   d i s k   l i s t� ��� r  */��� m  *+����  � o      ���� 0 	rownumber  � ��� l 05���� r  05��� m  01����  � o      ���� 0 desiredrownumber  � ; 5 reset row number (in volume list) of desired volume    � ��� j   r e s e t   r o w   n u m b e r   ( i n   v o l u m e   l i s t )   o f   d e s i r e d   v o l u m e  � ��� l 6=���� r  6=   m  69 �   o      ���� 0 desired_name  �    reset desired volume name   � � 4   r e s e t   d e s i r e d   v o l u m e   n a m e�  l >F	 r  >F

 n  >B 4  ?B��
�� 
cobj m  @A����  o  >?���� 0 backup_drives   o      ���� 0 preferred_name   J D get name of the preferred / primary backup volume = 1st in the list   	 � �   g e t   n a m e   o f   t h e   p r e f e r r e d   /   p r i m a r y   b a c k u p   v o l u m e   =   1 s t   i n   t h e   l i s t  X  G��� k  [�  r  [d [  [` o  [^���� 0 	rownumber   m  ^_����  o      ���� 0 	rownumber    r  e� c  e�  l e�!����! n  e�"#" 1  ����
�� 
valL# n  e�$%$ m  ����
�� 
txtf% n  e�&'& 4  |���(
�� 
crow( o  ����� 0 	rownumber  ' n  e|)*) 4  w|��+
�� 
tabB+ m  z{���� * n  ew,-, 4  rw��.
�� 
scra. m  uv���� - n  er/0/ 4  mr��1
�� 
sheE1 m  pq���� 0 4  em��2
�� 
cwin2 o  il���� 0 name_tm  ��  ��    m  ����
�� 
TEXT o      ���� 0 
volumename   343 I ����5��
�� .ascrcmnt****      � ****5 o  ������ 0 
volumename  ��  4 6��6 Z  ��78����7 E ��9:9 o  ������ 0 backup_drives  : l ��;����; c  ��<=< o  ������ 0 
volumename  = m  ����
�� 
TEXT��  ��  8 l ��>?@> k  ��AA BCB l ��DEFD r  ��GHG o  ������ 0 	rownumber  H o      ���� 0 desiredrownumber  E 0 * set the desired row number in volume list   F �II T   s e t   t h e   d e s i r e d   r o w   n u m b e r   i n   v o l u m e   l i s tC JKJ l ��LMNL r  ��OPO o  ������ 0 
volumename  P o      ���� 0 desired_name  M "  set the desired volume name   N �QQ 8   s e t   t h e   d e s i r e d   v o l u m e   n a m eK R��R l ��STUS Z ��VW����V =  ��XYX o  ������ 0 desired_name  Y o  ������ 0 preferred_name  W  S  ����  ��  T 2 , keep this one if this is the primary volume   U �ZZ X   k e e p   t h i s   o n e   i f   t h i s   i s   t h e   p r i m a r y   v o l u m e��  ? !  found a volume in the list   @ �[[ 6   f o u n d   a   v o l u m e   i n   t h e   l i s t��  ��  ��  �� 0 tablerow   o  JM���� 0 tablecontents   \]\ Z  �_^_����^ ?  ��`a` o  ������ 0 desiredrownumber  a m  ������  _ Q  �[bcdb k  �Nee fgf l ��hijh I ����k��
�� .miscslctuiel       uielk n  ��lml 4  ����n
�� 
crown o  ������ 0 desiredrownumber  m n  ��opo 4  ����q
�� 
tabBq m  ������ p n  ��rsr 4  ����t
�� 
scrat m  ������ s n  ��uvu 4  ����w
�� 
sheEw m  ������ v 4  ����x
�� 
cwinx o  ������ 0 name_tm  ��  i ( " select the desired volume in list   j �yy D   s e l e c t   t h e   d e s i r e d   v o l u m e   i n   l i s tg z{z l �|}~| I �����
�� .prcsclicuiel    ��� uiel n  ���� 4  ���
�� 
butT� l ���~� n  ��� 4  �}�
�} 
cobj� o  �|�| 0 lg  � o  �{�{ 0 names_usebutton  �  �~  � n  ���� 4  �z�
�z 
sheE� m  
�y�y � 4  ��x�
�x 
cwin� o  �w�w 0 name_tm  ��  } ' ! click the localised "use" button   ~ ��� B   c l i c k   t h e   l o c a l i s e d   " u s e "   b u t t o n{ ��� l *���� r  *��� l &��v�u� n  &��� 4  #&�t�
�t 
cobj� o  $%�s�s 0 lg  � o  #�r�r 0 msgs_general  �v  �u  � o      �q�q 0 message_title  � D > tell user that a backup volume has been successfully selected   � ��� |   t e l l   u s e r   t h a t   a   b a c k u p   v o l u m e   h a s   b e e n   s u c c e s s f u l l y   s e l e c t e d� ��� r  +;��� b  +7��� l +3��p�o� n  +3��� 4  03�n�
�n 
cobj� o  12�m�m 0 lg  � o  +0�l�l 0 msgs_newvolume  �p  �o  � o  36�k�k 0 desired_name  � o      �j�j 0 message  � ��� n <L��� I  =L�i��h�i 0 	growlnote  � ��� o  =B�g�g 0 growl_general  � ��� o  BE�f�f 0 message_title  � ��e� o  EH�d�d 0 message  �e  �h  �  f  <=� ��c� l MM�b�a�`�b  �a  �`  �c  c R      �_�^�]
�_ .ascrerr ****      � ****�^  �]  d l V[���� r  V[��� m  VW�\�\  � o      �[�[ 0 desiredrownumber  � B < if failure for some reason, reset row number to 0 = nothing   � ��� x   i f   f a i l u r e   f o r   s o m e   r e a s o n ,   r e s e t   r o w   n u m b e r   t o   0   =   n o t h i n g��  ��  ] ��� l ``�Z�Y�X�Z  �Y  �X  � ��� Z  `����W�V� =  `e��� o  `c�U�U 0 desiredrownumber  � m  cd�T�T  � l h����� k  h��� ��� Q  h����S� l k����� l k����� I k��R��Q
�R .prcsclicuiel    ��� uiel� n  k���� 4  x��P�
�P 
butT� l {���O�N� n  {���� 4  ���M�
�M 
cobj� o  ���L�L 0 lg  � o  {��K�K 0 names_cancelbutton  �O  �N  � n  kx��� 4  sx�J�
�J 
sheE� m  vw�I�I � 4  ks�H�
�H 
cwin� o  or�G�G 0 name_tm  �Q  � * $ click the localised "Cancel" button   � ��� H   c l i c k   t h e   l o c a l i s e d   " C a n c e l "   b u t t o n�   try to cancel   � ���    t r y   t o   c a n c e l� R      �F�E�D
�F .ascrerr ****      � ****�E  �D  �S  � ��� l ������ r  ����� l ����C�B� n  ����� 4  ���A�
�A 
cobj� o  ���@�@ 0 lg  � o  ���?�? 0 
msgs_error  �C  �B  � o      �>�> 0 message_title  � A ; not found : tell user that the preferences weren't changed   � ��� v   n o t   f o u n d   :   t e l l   u s e r   t h a t   t h e   p r e f e r e n c e s   w e r e n ' t   c h a n g e d� ��� r  ����� n  ����� 4  ���=�
�= 
cobj� o  ���<�< 0 lg  � o  ���;�; 0 msgs_notchanged  � o      �:�: 0 message  � ��9� n ����� I  ���8��7�8 0 	growlnote  � ��� o  ���6�6 0 growl_error  � ��� o  ���5�5 0 message_title  � ��4� o  ���3�3 0 message  �4  �7  �  f  ���9  � $  error message if unsuccessful   � ��� <   e r r o r   m e s s a g e   i f   u n s u c c e s s f u l�W  �V  � ��� l ���2�1�0�2  �1  �0  � ��� l ������ I ���/��.
�/ .sysodelanull��� ��� nmbr� m  ���-�- �.  � ~ x wait for a confirmation dialog that appears if you select a partition on the same physical disk as that being backed up   � ��� �   w a i t   f o r   a   c o n f i r m a t i o n   d i a l o g   t h a t   a p p e a r s   i f   y o u   s e l e c t   a   p a r t i t i o n   o n   t h e   s a m e   p h y s i c a l   d i s k   a s   t h a t   b e i n g   b a c k e d   u p� ��� Z  ��� �,�+� l ���*�) I ���(�'
�( .coredoexbool       obj  n  �� 4  ���&
�& 
butT l ���%�$ n  �� 4  ���#	
�# 
cobj	 o  ���"�" 0 lg   o  ���!�! 0 names_usebutton  �%  �$   4  ��� 

�  
cwin
 m  ���� �'  �*  �)    I ����
� .prcsclicuiel    ��� uiel n  �� 4  ���
� 
butT l ���� n  �� 4  ���
� 
cobj o  ���� 0 lg   o  ���� 0 names_usebutton  �  �   4  ���
� 
cwin m  ���� �  �,  �+  �  l ������  �  �    l ������  �  �   � l �' I �'��
� .prcsclicuiel    ��� uiel n  �# 4  #�
� 
menI l " �
�	  n  "!"! 4  !�#
� 
cobj# o   �� 0 lg  " o  �� 0 
names_quit  �
  �	   n  �$%$ 4  �&
� 
menE& m  �� % n  �'(' 4  �)
� 
mbri) l *��* n  +,+ 4  � -
�  
cobj- o  ���� 0 lg  , o  ���� 0 names_prefs  �  �  ( 4  ���.
�� 
mbar. m  ���� �     quit preferences    �// "   q u i t   p r e f e r e n c e s�  � 4   � ���0
�� 
prcs0 m   � �11 �22 $ S y s t e m   P r e f e r e n c e s� m   � �33�                                                                                  sevs  alis    �  Macintosh HD               ���H+    qSystem Events.app                                               64ǚ�|        ����  	                CoreServices    ���      ǚR�      q  -  ,  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  �  �  k 454 l     ��������  ��  ��  5 676 l     ��������  ��  ��  7 898 l     ��������  ��  ��  9 :;: l     ��������  ��  ��  ; <=< l      ��>?��  > ) # Try to register script with Growl    ? �@@ F   T r y   t o   r e g i s t e r   s c r i p t   w i t h   G r o w l  = ABA l     ��������  ��  ��  B CDC i   J MEFE I      �������� 0 register_growl  ��  ��  F Q     CGH��G O    :IJI k    9KK LML l   NOPN r    QRQ J    SS TUT o    ���� 0 growl_general  U VWV o    ���� 0 growl_debug  W X��X o    ���� 0 growl_error  ��  R l     Y����Y o      ���� ,0 allnotificationslist allNotificationsList��  ��  O   Growl notifications   P �ZZ (   G r o w l   n o t i f i c a t i o n sM [\[ l   +]^_] r    +`a` J    )bb cdc o     ���� 0 growl_general  d efe o     !���� 	0 growl  f ghg o   ! "���� 	0 debug  h i��i o   " '���� 0 growl_error  ��  a l     j����j o      ���� 40 enablednotificationslist enabledNotificationsList��  ��  ^ !  Those enabled for this app   _ �kk 6   T h o s e   e n a b l e d   f o r   t h i s   a p p\ l��l I  , 9����m
�� .registernull��� ��� null��  m ��no
�� 
appln m   . /pp �qq * C o n f i g u r e   T i m e M a c h i n eo ��rs
�� 
anotr o   0 1���� ,0 allnotificationslist allNotificationsLists ��tu
�� 
dnott o   2 3���� 40 enablednotificationslist enabledNotificationsListu ��v��
�� 
iappv m   4 5ww �xx  T i m e M a c h i n e��  ��  J m    yy2                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	  E�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  H R      ������
�� .ascrerr ****      � ****��  ��  ��  D z{z l     ��������  ��  ��  { |��| i   N Q}~} I      ������ 0 	growlnote   ��� o      ���� 0 	growltype  � ��� o      ���� 0 	msg_title  � ���� o      ���� 0 msg_text  ��  ��  ~ Q     ����� O    ��� I   �����
�� .notifygrnull��� ��� null��  � ����
�� 
name� o   	 
���� 0 	growltype  � ����
�� 
titl� o    ���� 0 	msg_title  � ����
�� 
desc� o    ���� 0 msg_text  � �����
�� 
appl� m    �� ��� * C o n f i g u r e   T i m e M a c h i n e��  � m    ��2                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	  E�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��       $������������� �������� [������ � ��������������  � "���������������������������������������������������������������������� 0 names_prefs  �� 0 names_tm  �� 0 
names_view  �� 0 names_usebutton  �� 0 names_cancelbutton  �� 0 
names_quit  �� 0 msgs_general  �� 0 
msgs_error  �� 0 msgs_newvolume  �� 0 msgs_notchanged  �� 0 msg_language  �� 0 growl_general  �� 0 growl_debug  �� 0 growl_error  �� 0 register_growl  �� 0 	growlnote  
�� .aevtoappnull  �   � ****�� 0 backup_drives  �� 0 loc_name  �� 0 lg  �� 0 name_tm  �� 0 tablecontents  �� 0 	rownumber  �� 0 desiredrownumber  �� 0 desired_name  �� 0 preferred_name  �� 0 
volumename  �� 0 message_title  �� 0 message  ��  ��  ��  ��  ��  � ����� �   I� ����� �   [� ����� �   m� ����� �   � ����� �   �� ����� �   �� ����� �   �� ����� �   �� ��� �   �� �~��~ �   �� �}F�|�{���z�} 0 register_growl  �|  �{  � �y�x�w�v�y ,0 allnotificationslist allNotificationsList�x 	0 growl  �w 	0 debug  �v 40 enablednotificationslist enabledNotificationsList� y�u�tp�s�r�qw�p�o�n�m�u 
�t 
appl
�s 
anot
�r 
dnot
�q 
iapp�p 
�o .registernull��� ��� null�n  �m  �z D <� 4b  b  b  mvE�Ob  ��b  �vE�O*������� 	UW X 
 h� �l~�k�j���i�l 0 	growlnote  �k �h��h �  �g�f�e�g 0 	growltype  �f 0 	msg_title  �e 0 msg_text  �j  � �d�c�b�d 0 	growltype  �c 0 	msg_title  �b 0 msg_text  � 
��a�`�_�^��]�\�[�Z
�a 
name
�` 
titl
�_ 
desc
�^ 
appl�] 
�\ .notifygrnull��� ��� null�[  �Z  �i  � *������ UW X  	h� �Y��X�W���V
�Y .aevtoappnull  �   � ****� k    )��  �� �� $�� 0�� L�� T�� j�U�U  �X  �W  � �T�S�T 0 i  �S 0 tablerow  � 2  "�R�Q*�P@�O=�N�M�L�K�J�I�H�G1�F�E�D�C�B�A�@��?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�R 0 backup_drives  �Q 0 register_growl  
�P .miscactvnull��� ��� null
�O 
prcs
�N kfrmname
�M 
dnam�L 0 loc_name  �K 0 lg  
�J .corecnte****       ****
�I 
cobj�H 0 	growlnote  �G 0 name_tm  
�F 
mbar
�E 
mbri
�D 
menE
�C 
menI
�B .prcsclicuiel    ��� uiel
�A 
cwin
�@ .coredoexbool       obj 
�? .sysodelanull��� ��� nmbr
�> 
sgrp
�= 
butT
�< 
sheE
�; 
scra
�: 
tabB
�9 
crow�8 0 tablecontents  �7 0 	rownumber  �6 0 desiredrownumber  �5 0 desired_name  �4 0 preferred_name  
�3 
kocl
�2 
txtf
�1 
valL
�0 
TEXT�/ 0 
volumename  
�. .ascrcmnt****      � ****
�- .miscslctuiel       uiel�, 0 message_title  �+ 0 message  �*  �)  �V*��lvE�O*j+ O�j O� *���0�,E�UOjE�O ,kb   j kh  b   �/�  
�E�OY h[OY��O�j  *b  b  �k/b  
m+ Y�b  ��/E` O��*�a /�*a k/a b  ��/E/a k/a _ /j O h*a _ /j a j [OY��O*a _ /a k/a k/j O !h*a _ /a k/j a j [OY��O*a _ /a k/a k/a k/a  -E` !OjE` "OjE` #Oa $E` %O��k/E` &O �_ ![a '�l kh _ "kE` "O*a _ /a k/a k/a k/a  _ "/a (,a ),a *&E` +O_ +j ,O�_ +a *& $_ "E` #O_ +E` %O_ %_ &  Y hY h[OY��O_ #j � w*a _ /a k/a k/a k/a  _ #/j -O*a _ /a k/a b  ��/E/j Ob  ��/E` .Ob  ��/_ %%E` /O)b  _ ._ /m+ OPW X 0 1jE` #Y hO_ #j  Z #*a _ /a k/a b  ��/E/j W X 0 1hOb  ��/E` .Ob  	��/E` /O)b  _ ._ /m+ Y hOkj O*a k/a b  ��/E/j  *a k/a b  ��/E/j Y hO*a k/a b   ��/E/a k/a b  ��/E/j UU� �(��( �    "� ��� $ S y s t e m   P r e f e r e n c e s�� � �'��' �  ����� �� ��&�%� ��$�#� ��"�!� �� �� ���� @��
� 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
� 
cwin� ���  T i m e   M a c h i n e
�  
sheE� 
�" 
scra�! 
�$ 
tabB�# 
�& 
crow�% � �� ���� ���� ���� ���� ���� @��
� 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
� 
cwin� ���  T i m e   M a c h i n e
� 
sheE� 
� 
scra� 
� 
tabB� 
� 
crow� � �� ���� ���� ���� ���� ��
�� @�	�
�	 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
�
 
cwin� ���  T i m e   M a c h i n e
� 
sheE� 
� 
scra� 
� 
tabB� 
� 
crow� � �� ���� ���� ���� ���� �� �� @���
�� 
pcap� ��� $ S y s t e m   P r e f e r e n c e s
�  
cwin� ���  T i m e   M a c h i n e
� 
sheE� 
� 
scra� 
� 
tabB� 
� 
crow� �� �� � ���  T i m e M a c h i n e� ��� b T h e   T i m e   M a c h i n e   b a c k u p   v o l u m e   i s   n o w   T i m e M a c h i n e��  ��  ��  ��  ��  ascr  ��ޭ