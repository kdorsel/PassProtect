FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 testing    m        � 	 	     
  
 j    �� �� 0 appname appName  m       �          j    �� �� 
0 screen    m    ����        l     ��������  ��  ��        i   	     I      �� ���� 0 	pausinggg     ��  o      ���� 0 pause_or_play  ��  ��    k     C       r         m        �        1    ��
�� 
txdl   ! " ! r     # $ # I   �� %��
�� .sysoexecTEXT���     TEXT % b     & ' & m     ( ( � ) ) $   p s   - a x   |   g r e p   - i   ' o    ���� 0 appname appName��   $ o      ���� 0 get_pid get_PID "  * + * r    # , - , c    ! . / . n     0 1 0 7   �� 2 3
�� 
cha  2 m    ����  3 m    ����  1 o    ���� 0 get_pid get_PID / m     ��
�� 
TEXT - o      ���� 0 the_pid the_PID +  4�� 4 Z   $ C 5 6�� 7 5 =  $ ' 8 9 8 o   $ %���� 0 pause_or_play   9 m   % & : : � ; ;  p a u s e d 6 k   * 5 < <  = > = I  * 1�� ?��
�� .sysoexecTEXT���     TEXT ? b   * - @ A @ m   * + B B � C C  k i l l   - C O N T   A o   + ,���� 0 the_pid the_PID��   >  D�� D r   2 5 E F E m   2 3 G G � H H  p l a y i n g F o      ���� 0 pause_or_play  ��  ��   7 k   8 C I I  J K J I  8 ?�� L��
�� .sysoexecTEXT���     TEXT L b   8 ; M N M m   8 9 O O � P P  k i l l   - S T O P   N o   9 :���� 0 the_pid the_PID��   K  Q�� Q r   @ C R S R m   @ A T T � U U  p a u s e d S o      ���� 0 pause_or_play  ��  ��     V W V l     ��������  ��  ��   W  X Y X i     Z [ Z I      �������� 0 setprefs setPrefs��  ��   [ k     6 \ \  ] ^ ] r      _ ` _ n      a b a 1    ��
�� 
ttxt b l     c���� c I    �� d e
�� .sysodlogaskr        TEXT d m      f f � g g $ E n t e r   n e w   p a s s w o r d e �� h i
�� 
dtxt h m     j j � k k $ T y p e   p a s s w o r d   h e r e i �� l m
�� 
btns l J     n n  o�� o m     p p � q q  S u b m i t��   m �� r��
�� 
dflt r m    	���� ��  ��  ��   ` o      ���� 0 testing   ^  s t s r    ) u v u I   '���� w
�� .sysostdfalis    ��� null��   w �� x y
�� 
prmp x m     z z � { { T S e l e c t   t h e   A p p l i c a t i o n   y o u   w a n t   t o   p r o t e c t y �� | }
�� 
ftyp | J     ~ ~  ��  m     � � � � � * c o m . a p p l e . a p p l i c a t i o n��   } �� ���
�� 
dflc � l   # ����� � I   #�� ���
�� .earsffdralis        afdr � m    ��
�� afdrapps��  ��  ��  ��   v o      ���� 0 apppath appPath t  ��� � r   * 6 � � � I   * 0�� ����� $0 parseappnamefrom parseAppNameFrom �  ��� � o   + ,���� 0 apppath appPath��  ��   � o      ���� 0 appname appName��   Y  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� $0 parseappnamefrom parseAppNameFrom �  ��� � o      ���� 0 apppath appPath��  ��   � k     * � �  � � � l     �� � ���   � * $ Sets the text delimiters to a colon    � � � � H   S e t s   t h e   t e x t   d e l i m i t e r s   t o   a   c o l o n �  � � � r      � � � m      � � � � �  : � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   � 0 * Grabs the "Application.app" from the path    � � � � T   G r a b s   t h e   " A p p l i c a t i o n . a p p "   f r o m   t h e   p a t h �  � � � r     � � � n    � � � 4   	 �� �
�� 
citm � m   
 ������ � l   	 ����� � c    	 � � � o    ���� 0 apppath appPath � m    ��
�� 
TEXT��  ��   � o      ���� 0 appname appName �  � � � l   �� � ���   � * $ Removes the ".app" from the appName    � � � � H   R e m o v e s   t h e   " . a p p "   f r o m   t h e   a p p N a m e �  ��� � r    * � � � n    $ � � � 7   $�� � �
�� 
ctxt � m     ����  � m   ! #������ � l    ����� � c     � � � o    ���� 0 appname appName � m    ��
�� 
TEXT��  ��   � o      ���� 0 appname appName��   �  � � � l     ��������  ��  ��   �  ��� � i     � � � I     ������
�� .aevtoappnull  �   � ****��  ��   � k    � � �  � � � Z     ! � ����� � =      � � � o     ���� 
0 screen   � m    ����   � k   
  � �  � � � I  
 �� � �
�� .sysodlogaskr        TEXT � m   
  � � � � �z Y o u   w i l l   n o w   b e   r e q u i r e d   t o   s e l e c t   a   n e w   p a s s w o r d   a n d   a n   a p p l i c a t i o n   t o   p r o t e c t .   T o   s a v e   y o u r   s e t t i n g s   y o u   h a v e   t o   q u i t   t h e   a p p   o n c e   b e f o r e   d o i n g   a   r e s t a r t / s h u t d o w n   o f   t h e   c o m p u t e r .   E n j o y   ! � �� � �
�� 
btns � J     � �  ��� � m     � � � � �  D i s m i s s��   � �� ���
�� 
dflt � m    ���� ��   �  ��� � r     � � � m    ����  � o      ���� 
0 screen  ��  ��  ��   �  � � � Z  " A � ����� � G   " 5 � � � =   " ) � � � o   " '���� 0 testing   � m   ' ( � � � � �   � =   , 3 � � � o   , 1���� 0 appname appName � m   1 2 � � � � �   � I   8 =�������� 0 setprefs setPrefs��  ��  ��  ��   �  ��� � T   B� � � k   G~ � �  � � � Z   Gv � ���~ � =  G S � � � n   G Q � � � 1   O Q�}
�} 
prun � 4   G O�| �
�| 
capp � o   I N�{�{ 0 appname appName � m   Q R�z
�z boovtrue � k   Vr � �  � � � I   V \�y ��x�y 0 	pausinggg   �  ��w � m   W X � � � � �  p l a y i n g�w  �x   �  � � � O  ] g � � � I  a f�v�u�t
�v .miscactvnull��� ��� null�u  �t   �  f   ] ^ �    I  h ��s
�s .sysodlogaskr        TEXT b   h o m   h i � < E n t e r   y o u r   p a s s w o r d   t o   u n l o c k   o   i n�r�r 0 appname appName �q	
�q 
dtxt m   r u

 �  	 �p
�p 
btns J   v �  m   v y �  Q u i t  m   y | �  P r e f e r e n c e s �o m   |  �  O K�o   �n
�n 
dflt m   � ��m�m  �l�k
�l 
htxt m   � ��j
�j boovtrue�k   �i Z   �r ! F   � �"#" =  � �$%$ l  � �&�h�g& n   � �'(' 1   � ��f
�f 
bhit( 1   � ��e
�e 
rslt�h  �g  % m   � �)) �**  O K# =  � �+,+ l  � �-�d�c- n   � �./. 1   � ��b
�b 
ttxt/ 1   � ��a
�a 
rslt�d  �c  , o   � ��`�` 0 testing   k   � �00 121 I   � ��_3�^�_ 0 	pausinggg  3 4�]4 m   � �55 �66  p a u s e d�]  �^  2 787 O  � �9:9 I  � ��\�[�Z
�\ .miscactvnull��� ��� null�[  �Z  : 4   � ��Y;
�Y 
capp; o   � ��X�X 0 appname appName8 <�W< V   � �=>= I  � ��V?�U
�V .sysodelanull��� ��� nmbr? m   � ��T�T �U  > =  � �@A@ n   � �BCB 1   � ��S
�S 
prunC 4   � ��RD
�R 
cappD o   � ��Q�Q 0 appname appNameA m   � ��P
�P boovtrue�W    EFE F   �GHG =  � �IJI l  � �K�O�NK n   � �LML 1   � ��M
�M 
bhitM 1   � ��L
�L 
rslt�O  �N  J m   � �NN �OO  Q u i tH =  �PQP l  � �R�K�JR n   � �STS 1   � ��I
�I 
ttxtT 1   � ��H
�H 
rslt�K  �J  Q o   ��G�G 0 testing  F UVU k  $WW XYX I  �FZ�E�F 0 	pausinggg  Z [�D[ m  \\ �]]  p a u s e d�D  �E  Y ^_^ O !`a` I  �C�B�A
�C .miscactvnull��� ��� null�B  �A  a 4  �@b
�@ 
cappb o  �?�? 0 appname appName_ c�>c L  "$�=�=  �>  V ded F  'Dfgf = '2hih l '.j�<�;j n  '.klk 1  *.�:
�: 
bhitl 1  '*�9
�9 
rslt�<  �;  i m  .1mm �nn  P r e f e r e n c e sg = 5Bopo l 5<q�8�7q n  5<rsr 1  8<�6
�6 
ttxts 1  58�5
�5 
rslt�8  �7  p o  <A�4�4 0 testing  e t�3t k  GUuu vwv I  GO�2x�1�2 0 	pausinggg  x y�0y m  HKzz �{{  p a u s e d�0  �1  w |�/| I  PU�.�-�,�. 0 setprefs setPrefs�-  �,  �/  �3  ! k  Xr}} ~~ I  X`�+��*�+ 0 	pausinggg  � ��)� m  Y\�� ���  p a u s e d�)  �*   ��(� O  ar��� I lq�'�&�%
�' .aevtquitnull��� ��� null�&  �%  � 4  ai�$�
�$ 
capp� o  ch�#�# 0 appname appName�(  �i  �  �~   � ��"� I w~�!�� 
�! .sysodelanull��� ��� nmbr� m  wz�� ?ə������   �"  ��  ��       	��  ������  � �������� 0 testing  � 0 appname appName� 
0 screen  � 0 	pausinggg  � 0 setprefs setPrefs� $0 parseappnamefrom parseAppNameFrom
� .aevtoappnull  �   � ****�  � � ������ 0 	pausinggg  � ��� �  �� 0 pause_or_play  �  � ���� 0 pause_or_play  � 0 get_pid get_PID� 0 the_pid the_PID�  � (���
�	 : B G O T
� 
txdl
� .sysoexecTEXT���     TEXT
� 
cha �
 
�	 
TEXT� D�*�,FO�b  %j E�O�[�\[Zl\Z�2�&E�O��  �%j O�E�Y �%j O�E�� � [������ 0 setprefs setPrefs�  �  � �� 0 apppath appPath�  f� j� p�� ������ z�� �����������
� 
dtxt
� 
btns
� 
dflt�  
�� .sysodlogaskr        TEXT
�� 
ttxt
�� 
prmp
�� 
ftyp
�� 
dflc
�� afdrapps
�� .earsffdralis        afdr
�� .sysostdfalis    ��� null�� $0 parseappnamefrom parseAppNameFrom� 7�����kv�k� �,Ec   O*����kv��j � E�O*�k+ Ec  � �� ����������� $0 parseappnamefrom parseAppNameFrom�� ����� �  ���� 0 apppath appPath��  � ���� 0 apppath appPath�  ���������������
�� 
ascr
�� 
txdl
�� 
TEXT
�� 
citm����
�� 
ctxt������ +���,FO��&��/Ec  Ob  �&[�\[Zk\Z�2Ec  � �� ���������
�� .aevtoappnull  �   � ****��  ��  �  � $ ��� ������� � ��������� �������
��������)��5��N\mz����
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� 
bool�� 0 setprefs setPrefs
�� 
capp
�� 
prun�� 0 	pausinggg  
�� .miscactvnull��� ��� null
�� 
dtxt
�� 
htxt�� 
�� 
rslt
�� 
bhit
�� 
ttxt
�� .sysodelanull��� ��� nmbr
�� .aevtquitnull��� ��� null���b  j  ���kv�k� OkEc  Y hOb   � 
 b  � �& 
*j+ 	Y hO@hZ*�b  /�,e !*�k+ O) *j UO�b  %a a �a a a mv�ma ea  O_ a ,a  	 _ a ,b    �& ;*a k+ O*�b  / *j UO h*�b  /�,e kj [OY��Y �_ a ,a  	 _ a ,b    �& "*a k+ O*�b  / *j UOhY M_ a ,a  	 _ a ,b    �& *a  k+ O*j+ 	Y *a !k+ O*�b  / *j "UY hOa #j [OY��ascr  ��ޭ