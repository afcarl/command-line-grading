FasdUAS 1.101.10   ��   ��    k             l     ��  ��    I C A simple script to convert all .pages files in a directory to .pdf     � 	 	 �   A   s i m p l e   s c r i p t   t o   c o n v e r t   a l l   . p a g e s   f i l e s   i n   a   d i r e c t o r y   t o   . p d f   
  
 l     ��  ��    H B files. When run the script with request the source and the output     �   �   f i l e s .   W h e n   r u n   t h e   s c r i p t   w i t h   r e q u e s t   t h e   s o u r c e   a n d   t h e   o u t p u t      l     ��  ��      directories.     �      d i r e c t o r i e s .      l     ��  ��    8 2 Note that it does not automatically append ".pdf"     �   d   N o t e   t h a t   i t   d o e s   n o t   a u t o m a t i c a l l y   a p p e n d   " . p d f "      l     ��  ��    ; 5 to the names of the pdfs. This must be done manually     �   j   t o   t h e   n a m e s   o f   t h e   p d f s .   T h i s   m u s t   b e   d o n e   m a n u a l l y      l     ��������  ��  ��       !   l     �� " #��   " 8 2Select from where you will pick up the pages files    # � $ $ d S e l e c t   f r o m   w h e r e   y o u   w i l l   p i c k   u p   t h e   p a g e s   f i l e s !  % & % l    	 '���� ' r     	 ( ) ( I    ���� *
�� .sysostflalis    ��� null��   * �� +��
�� 
prmp + m     , , � - - R S e l e c t   f o l d e r   w i t h   o r i g i n a l   p a g e s   f i l e s   :��   ) o      ���� 0 	thefolder 	theFolder��  ��   &  . / . l     �� 0 1��   0  Do it    1 � 2 2 
 D o   i t /  3 4 3 l  
  5���� 5 O   
  6 7 6 r     8 9 8 6    : ; : n     < = < 1    ��
�� 
pnam = n     > ? > 2   ��
�� 
file ? l 
   @���� @ o    ���� 0 	thefolder 	theFolder��  ��   ; =    A B A 1    ��
�� 
nmxt B m     C C � D D 
 p a g e s 9 o      ���� 0 thenames theNames 7 m   
  E E�                                                                                  MACS  alis    t  Macintosh HD               ���H+   �<�
Finder.app                                                      ����)�        ����  	                CoreServices    ��*�      ��o�     �<� �<� �<�  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   4  F G F l     ��������  ��  ��   G  H I H l     �� J K��   J ( "Select where the PDF files will go    K � L L D S e l e c t   w h e r e   t h e   P D F   f i l e s   w i l l   g o I  M N M l    ) O���� O r     ) P Q P I    '���� R
�� .sysostflalis    ��� null��   R �� S��
�� 
prmp S m   " # T T � U U N S e l e c t   f o l d e r   w h e r e   P D F   f i l e s   w i l l   g o   :��   Q o      ���� 0 
pdf_folder 
pdf_Folder��  ��   N  V W V l     ��������  ��  ��   W  X Y X l     �� Z [��   Z   How many files to export    [ � \ \ 2   H o w   m a n y   f i l e s   t o   e x p o r t Y  ] ^ ] l  * 3 _���� _ r   * 3 ` a ` l  * 1 b���� b e   * 1 c c I  * 1�� d��
�� .corecnte****       **** d n  * - e f e 2  + -��
�� 
cobj f o   * +���� 0 thenames theNames��  ��  ��   a o      ���� 0 
item_count  ��  ��   ^  g h g l     ��������  ��  ��   h  i j i l     �� k l��   k  Get files and export them    l � m m 2 G e t   f i l e s   a n d   e x p o r t   t h e m j  n�� n l  4 � o���� o Y   4 � p�� q r�� p k   > � s s  t u t l  > >��������  ��  ��   u  v w v l  > F x y z x r   > F { | { n   > B } ~ } 4   ? B�� 
�� 
cobj  o   @ A���� 0 i   ~ o   > ?���� 0 thenames theNames | o      ���� 0 current_file   y   get a file    z � � �    g e t   a   f i l e w  � � � l  G \ � � � � r   G \ � � � n   G X � � � 7  J X�� � �
�� 
ctxt � m   P R����  � m   S W������ � o   G J���� 0 current_file   � o      ���� 0 	lean_file   � 6 0 change the originalfile (.pages) to a .pdf name    � � � � `   c h a n g e   t h e   o r i g i n a l f i l e   ( . p a g e s )   t o   a   . p d f   n a m e �  � � � l  ] n � � � � r   ] n � � � b   ] j � � � b   ] f � � � l  ] b ����� � c   ] b � � � o   ] ^���� 0 
pdf_folder 
pdf_Folder � m   ^ a��
�� 
utxt��  ��   � l  b e ����� � o   b e���� 0 	lean_file  ��  ��   � m   f i � � � � �  . p d f � o      ���� 0 out_file   � * $ get the fully qualified output name    � � � � H   g e t   t h e   f u l l y   q u a l i f i e d   o u t p u t   n a m e �  � � � l  o | � � � � r   o | � � � b   o x � � � l  o t ����� � c   o t � � � o   o p���� 0 	thefolder 	theFolder � m   p s��
�� 
utxt��  ��   � l  t w ����� � o   t w���� 0 current_file  ��  ��   � o      ���� 0 in_file   � . ( get the fully qualified input file name    � � � � P   g e t   t h e   f u l l y   q u a l i f i e d   i n p u t   f i l e   n a m e �  � � � l  } }��������  ��  ��   �  � � � O   } � � � � k   � � � �  � � � l  � � � � � � r   � � � � � I  � ��� ���
�� .aevtodocnull  �    alis � 4   � ��� �
�� 
file � o   � ����� 0 in_file  ��   � o      ���� 	0 mydoc   �   open input file in Pages    � � � � 2   o p e n   i n p u t   f i l e   i n   P a g e s �  � � � l  � � � � � � I  � ��� � �
�� .Pgstexponull���     docu � o   � ����� 	0 mydoc   � �� � �
�� 
pfil � 4   � ��� �
�� 
file � o   � ����� 0 out_file   � �� ���
�� 
exft � m   � ���
�� PgefPpdf��   �  do the exporting    � � � �   d o   t h e   e x p o r t i n g �  ��� � l  � � � � � � I  � ��� � �
�� .coreclosnull���     obj  � o   � ����� 	0 mydoc   � �� ���
�� 
savo � m   � ���
�� savono  ��   � - ' close the original file without saving    � � � � N   c l o s e   t h e   o r i g i n a l   f i l e   w i t h o u t   s a v i n g��   � m   } � � ��                                                                                  page  alis    H  Macintosh HD               ���H+   �=	Pages.app                                                      <�Y�Z        ����  	                Applications    ��*�      �Z2�     �=  $Macintosh HD:Applications: Pages.app   	 P a g e s . a p p    M a c i n t o s h   H D  Applications/Pages.app  / ��   �  ��� � l  � ���������  ��  ��  ��  �� 0 i   q m   7 8����  r o   8 9���� 0 
item_count  ��  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �  % � �  3 � �  M � �  ] � �  n����  ��  ��   � ���� 0 i   � #�� ,���� E��� ��~ C�} T�|�{�z�y�x�w�v�u�t ��s�r ��q�p�o�n�m�l�k�j�i�h
�� 
prmp
�� .sysostflalis    ��� null�� 0 	thefolder 	theFolder
�� 
file
� 
pnam �  
�~ 
nmxt�} 0 thenames theNames�| 0 
pdf_folder 
pdf_Folder
�{ 
cobj
�z .corecnte****       ****�y 0 
item_count  �x 0 current_file  
�w 
ctxt�v���u 0 	lean_file  
�t 
utxt�s 0 out_file  �r 0 in_file  
�q .aevtodocnull  �    alis�p 	0 mydoc  
�o 
pfil
�n 
exft
�m PgefPpdf�l 
�k .Pgstexponull���     docu
�j 
savo
�i savono  
�h .coreclosnull���     obj �� �*��l E�O� ��-�,�[�,\Z�81E�UO*��l E�O��-j E�O �k�kh  ���/E` O_ [a \[Zk\Za 2E` O�a &_ %a %E` O�a &_ %E` Oa  7*�_ /j E` O_ a *�_ /a a a  O_ a  a !l "UOP[OY�} ascr  ��ޭ