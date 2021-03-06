FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
add - new item alert

This Folder Action handler is triggered whenever items are added to the attached folder.
The script will display an alert containing the number of items added and offering the user
the option to reveal the added items in Finder.

Copyright � 2002�2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 	� 
 a d d   -   n e w   i t e m   a l e r t 
 
 T h i s   F o l d e r   A c t i o n   h a n d l e r   i s   t r i g g e r e d   w h e n e v e r   i t e m s   a r e   a d d e d   t o   t h e   a t t a c h e d   f o l d e r . 
 T h e   s c r i p t   w i l l   d i s p l a y   a n   a l e r t   c o n t a i n i n g   t h e   n u m b e r   o f   i t e m s   a d d e d   a n d   o f f e r i n g   t h e   u s e r 
 t h e   o p t i o n   t o   r e v e a l   t h e   a d d e d   i t e m s   i n   F i n d e r . 
 
 C o p y r i g h t   �   2 0 0 2  2 0 0 7   A p p l e   I n c . 
 
 Y o u   m a y   i n c o r p o r a t e   t h i s   A p p l e   s a m p l e   c o d e   i n t o   y o u r   p r o g r a m ( s )   w i t h o u t 
 r e s t r i c t i o n .     T h i s   A p p l e   s a m p l e   c o d e   h a s   b e e n   p r o v i d e d   " A S   I S "   a n d   t h e 
 r e s p o n s i b i l i t y   f o r   i t s   o p e r a t i o n   i s   y o u r s .     Y o u   a r e   n o t   p e r m i t t e d   t o 
 r e d i s t r i b u t e   t h i s   A p p l e   s a m p l e   c o d e   a s   " A p p l e   s a m p l e   c o d e "   a f t e r   h a v i n g 
 m a d e   c h a n g e s .     I f   y o u ' r e   g o i n g   t o   r e d i s t r i b u t e   t h e   c o d e ,   w e   r e q u i r e 
 t h a t   y o u   m a k e   i t   c l e a r   t h a t   t h e   c o d e   w a s   d e s c e n d e d   f r o m   A p p l e   s a m p l e 
 c o d e ,   b u t   t h a t   y o u ' v e   m a d e   c h a n g e s . 
   
  
 l     ��������  ��  ��        i         I     ��  
�� .facofgetnull���     alis  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    k     �       l     ��������  ��  ��        Q     *  ��  O    !    k            l   ��   ��    1 + Make a list of all the notification types       � ! ! V   M a k e   a   l i s t   o f   a l l   t h e   n o t i f i c a t i o n   t y p e s     " # " l   �� $ %��   $ ' ! that this script will ever send:    % � & & B   t h a t   t h i s   s c r i p t   w i l l   e v e r   s e n d : #  ' ( ' r     ) * ) l 	  
 +���� + J    
 , ,  -�� - m     . . � / / , N e w   F i l e s   N o t i f i c a t i o n��  ��  ��   * l      0���� 0 o      ���� ,0 allnotificationslist allNotificationsList��  ��   (  1 2 1 l   ��������  ��  ��   2  3 4 3 l   �� 5 6��   5 ( " Make a list of the notifications     6 � 7 7 D   M a k e   a   l i s t   o f   t h e   n o t i f i c a t i o n s   4  8 9 8 l   �� : ;��   : - ' that will be enabled by default.          ; � < < N   t h a t   w i l l   b e   e n a b l e d   b y   d e f a u l t .             9  = > = l   �� ? @��   ? 9 3 Those not enabled by default can be enabled later     @ � A A f   T h o s e   n o t   e n a b l e d   b y   d e f a u l t   c a n   b e   e n a b l e d   l a t e r   >  B C B l   �� D E��   D 7 1 in the 'Applications' tab of the growl prefpane.    E � F F b   i n   t h e   ' A p p l i c a t i o n s '   t a b   o f   t h e   g r o w l   p r e f p a n e . C  G H G r     I J I l 	   K���� K J     L L  M�� M m     N N � O O , N e w   F i l e s   N o t i f i c a t i o n��  ��  ��   J l      P���� P o      ���� 40 enablednotificationslist enabledNotificationsList��  ��   H  Q R Q l   ��������  ��  ��   R  S T S l   �� U V��   U &   Register our script with growl.    V � W W @   R e g i s t e r   o u r   s c r i p t   w i t h   g r o w l . T  X Y X l   �� Z [��   Z 7 1 You can optionally (as here) set a default icon     [ � \ \ b   Y o u   c a n   o p t i o n a l l y   ( a s   h e r e )   s e t   a   d e f a u l t   i c o n   Y  ] ^ ] l   �� _ `��   _ ' ! for this script's notifications.    ` � a a B   f o r   t h i s   s c r i p t ' s   n o t i f i c a t i o n s . ^  b�� b I    ���� c
�� .registernull��� ��� null��   c �� d e
�� 
appl d l 	   f���� f m     g g � h h 8 G r o w l   N e w   F i l e s   N o t i f i c a t i o n��  ��   e �� i j
�� 
anot i l 
   k���� k o    ���� ,0 allnotificationslist allNotificationsList��  ��   j �� l m
�� 
dnot l l 
   n���� n o    ���� 40 enablednotificationslist enabledNotificationsList��  ��   m �� o��
�� 
iapp o m     p p � q q  S c r i p t   E d i t o r��  ��    m     r r2                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	  E�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     s t s l  + +��������  ��  ��   t  u�� u Q   + � v w�� v k   . � x x  y z y O   . 8 { | { k   2 7 } }  ~  ~ l  2 2�� � ���   �   get the name of the folder    � � � � 4 g e t   t h e   n a m e   o f   t h e   f o l d e r   ��� � r   2 7 � � � l  2 5 ����� � n   2 5 � � � 1   3 5��
�� 
pnam � o   2 3���� 0 this_folder  ��  ��   � l      ����� � o      ���� 0 folder_name  ��  ��  ��   | m   . / � ��                                                                                  MACS  alis    r  Macintosh HD               ���H+    q
Finder.app                                                       �ǱQ�        ����  	                CoreServices    ���      ǰ�      q  -  ,  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   z  � � � l  9 9��������  ��  ��   �  � � � l  9 9�� � ���   � A ; find out how many new items have been placed in the folder    � � � � v   f i n d   o u t   h o w   m a n y   n e w   i t e m s   h a v e   b e e n   p l a c e d   i n   t h e   f o l d e r �  � � � r   9 B � � � l  9 @ ����� � n   9 @ � � � m   < @��
�� 
nmbr � n  9 < � � � 2  : <��
�� 
cobj � l  9 : ����� � o   9 :���� 0 added_items  ��  ��  ��  ��   � l      ����� � o      ���� 0 
item_count  ��  ��   �  � � � l  C C�� � ���   �  create the alert string    � � � � . c r e a t e   t h e   a l e r t   s t r i n g �  � � � r   C T � � � c   C R � � � l  C N ����� � b   C N � � � b   C J � � � m   C F � � � � � * F o l d e r   A c t i o n s   A l e r t : � o   F I��
�� 
ret  � o   J M��
�� 
ret ��  ��   � m   N Q��
�� 
utxt � o      ���� 0 alert_message   �  � � � Z   U r � ��� � � ?  U X � � � l  U V ����� � o   U V���� 0 
item_count  ��  ��   � m   V W����  � r   [ h � � � b   [ f � � � b   [ b � � � o   [ \���� 0 alert_message   � l  \ a ����� � c   \ a � � � l  \ ] ����� � o   \ ]���� 0 
item_count  ��  ��   � m   ] `��
�� 
ctxt��  ��   � m   b e � � � � �     n e w   i t e m s   h a v e   � o      ���� 0 alert_message  ��   � r   k r � � � b   k p � � � o   k l���� 0 alert_message   � m   l o � � � � � " O n e   n e w   i t e m   h a s   � o      ���� 0 alert_message   �  � � � r   s � � � � b   s � � � � b   s � � � � b   s ~ � � � b   s | � � � b   s x � � � o   s t���� 0 alert_message   � m   t w � � � � � , b e e n   p l a c e d   i n   f o l d e r   � m   x { � � utxt  � l  | } ����� � o   | }���� 0 folder_name  ��  ��   � m   ~ � � � utxt  � m   � � � � � � �  . � o      ���� 0 alert_message   �  � � � l  � ���������  ��  ��   �  � � � O   � � � � � I  � ����� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � l 	 � � ����� � m   � � � � � � � , N e w   F i l e s   N o t i f i c a t i o n��  ��   � �� � �
�� 
titl � l 	 � � ����� � m   � � � � � � � , N e w   F i l e s   N o t i f i c a t i o n��  ��   � �� � �
�� 
desc � l 	 � � ���� � o   � ��~�~ 0 alert_message  ��  �   � �} ��|
�} 
appl � m   � � � � � � � 8 G r o w l   N e w   F i l e s   N o t i f i c a t i o n�|   � m   � � � �2                                                                                  GRRR  alis    �  Macintosh HD               ���H+   GrowlHelperApp.app                                              I�o��        ����  	                	Resources     ���      �o�      	  E�  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   �  � � � l  � ��{�z�y�{  �z  �y   �  � � � O   � � � � � k   � � � �  � � � l  � ��x � �x   �  go to the desktop      � $ g o   t o   t h e   d e s k t o p   �  I  � ��w�v�u
�w .miscactvnull��� ��� obj �v  �u    l  � ��t�t    open the folder    �  o p e n   t h e   f o l d e r 	
	 I  � ��s�r
�s .aevtodocnull  �    alis o   � ��q�q 0 this_folder  �r  
  l  � ��p�p    select the items    �   s e l e c t   t h e   i t e m s �o I  � ��n�m
�n .miscmvisnull���    obj  l  � ��l�k o   � ��j�j 0 added_items  �l  �k  �m  �o   � m   � ��                                                                                  MACS  alis    r  Macintosh HD               ���H+    q
Finder.app                                                       �ǱQ�        ����  	                CoreServices    ���      ǰ�      q  -  ,  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   � �i l  � ��h�g�f�h  �g  �f  �i   w R      �e�d�c
�e .ascrerr ****      � ****�d  �c  ��  ��    �b l     �a�`�_�a  �`  �_  �b       �^�^   �]
�] .facofgetnull���     alis �\ �[�Z�Y
�\ .facofgetnull���     alis�[ 0 this_folder  �Z �X�W�V
�X 
flst�W 0 added_items  �V   �U�T�S�R�Q�P�O�U 0 this_folder  �T 0 added_items  �S ,0 allnotificationslist allNotificationsList�R 40 enablednotificationslist enabledNotificationsList�Q 0 folder_name  �P 0 
item_count  �O 0 alert_message   % r . N�N g�M�L�K p�J�I�H�G ��F�E�D ��C�B�A � � � � � ��@ ��? ��> ��=�<�;�:
�N 
appl
�M 
anot
�L 
dnot
�K 
iapp�J 
�I .registernull��� ��� null�H  �G  
�F 
pnam
�E 
cobj
�D 
nmbr
�C 
ret 
�B 
utxt
�A 
ctxt
�@ 
name
�? 
titl
�> 
desc
�= .notifygrnull��� ��� null
�< .miscactvnull��� ��� obj 
�; .aevtodocnull  �    alis
�: .miscmvisnull���    obj �Y � #� �kvE�O�kvE�O*������� 
UW X  hO �� ��,E�UO��-a ,E�Oa _ %_ %a &E�O�k ��a &%a %E�Y 	�a %E�O�a %a %�%a %a %E�O� *a a a a a ��a  � !UO� *j "O�j #O�j $UOPW X  h ascr  ��ޭ