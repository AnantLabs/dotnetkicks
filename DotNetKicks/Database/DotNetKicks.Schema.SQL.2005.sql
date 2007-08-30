/ * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ U s e r ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 4 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ U s e r ] (  
 	 [ U s e r I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ U s e r n a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ E m a i l ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ P a s s w o r d ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ P a s s w o r d S a l t ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ I s G e n e r a t e d P a s s w o r d ]   [ b i t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ U s e r _ I s G e n e r a t e d P a s s w o r d ]     D E F A U L T   ( ( 1 ) ) ,  
 	 [ I s V a l i d a t e d ]   [ b i t ]   N O T   N U L L ,  
 	 [ I s B a n n e d ]   [ b i t ]   N O T   N U L L ,  
 	 [ A d s e n s e I D ]   [ n v a r c h a r ] ( 3 0 )   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ U s e r _ A d s e n s e I D ]     D E F A U L T   ( ' ' ) ,  
 	 [ R e c e i v e E m a i l N e w s l e t t e r ]   [ b i t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ U s e r _ R e c e i v e E m a i l N e w s l e t t e r ]     D E F A U L T   ( ( 1 ) ) ,  
 	 [ R o l e s ]   [ n v a r c h a r ] ( 1 0 0 )   N O T   N U L L ,  
 	 [ H o s t I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ L a s t A c t i v e O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ C r e a t e d O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ M o d i f i e d O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ K i c k _ U s e r ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ U s e r I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ H o s t ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 2 6   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ H o s t ] (  
 	 [ H o s t I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ H o s t N a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ R o o t U r l ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ S i t e T i t l e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ S i t e D e s c r i p t i o n ]   [ n v a r c h a r ] ( 2 0 0 0 )   N O T   N U L L ,  
 	 [ T a g L i n e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ L o g o P a t h ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ L o g o P a t h ]     D E F A U L T   ( ' ' ) ,  
 	 [ C r e a t e d O n ]   [ d a t e t i m e ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ C r e a t e d D a t e T i m e ]     D E F A U L T   ( g e t d a t e ( ) ) ,  
 	 [ B l o g U r l ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ E m a i l ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ T e m p l a t e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ S h o w A d s ]   [ b i t ]   N O T   N U L L ,  
 	 [ C u l t u r e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ U I C u l t u r e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ P u b l i s h _ M i n i m u m S t o r y A g e I n H o u r s ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ M i n i m u m S t o r y A g e I n H o u r s ]     D E F A U L T   ( ( 0 ) ) ,  
 	 [ P u b l i s h _ M a x i m u m S t o r y A g e I n H o u r s ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M a x i m u m S t o r y A g e I n H o u r s ]     D E F A U L T   ( ( 4 8 ) ) ,  
 	 [ P u b l i s h _ M a x i m u m S i m u l t a n e o u s S t o r y P u b l i s h C o u n t ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M a x i m u m S i m i l t a n o u s S t o r y P u b l i s h C o u n t ]     D E F A U L T   ( ( 1 ) ) ,  
 	 [ P u b l i s h _ M i n i m u m S t o r y S c o r e ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M i n i m u m S t o r y S c o r e ]     D E F A U L T   ( ( 5 0 ) ) ,  
 	 [ P u b l i s h _ M i n i m u m S t o r y K i c k C o u n t ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M i n i m u m S t o r y K i c k C o u n t ]     D E F A U L T   ( ( 5 ) ) ,  
 	 [ P u b l i s h _ M i n i m u m S t o r y C o m m e n t C o u n t ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M i n i m u m S t o r y C o m m e n t C o u n t ]     D E F A U L T   ( ( 0 ) ) ,  
 	 [ P u b l i s h _ M i n i m u m A v e r a g e S t o r y K i c k s P e r H o u r ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M i n i m u m A v e r a g e S t o r y K i c k s P e r H o u r ]     D E F A U L T   ( ( 0 ) ) ,  
 	 [ P u b l i s h _ M i n i m u n A v e r a g e C o m m e n t s P e r H o u r ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M i n i m u n A v e r a g e C o m m e n t s P e r H o u r ]     D E F A U L T   ( ( 0 ) ) ,  
 	 [ P u b l i s h _ M i n i m u m V i e w C o u n t ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ M i n i m u m V i e w C o u n t ]     D E F A U L T   ( ( 0 ) ) ,  
 	 [ P u b l i s h _ K i c k S c o r e ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ K i c k S c o r e ]     D E F A U L T   ( ( 5 ) ) ,  
 	 [ P u b l i s h _ C o m m e n t S c o r e ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ P u b l i s h _ C o m m e n t S c o r e ]     D E F A U L T   ( ( 2 ) ) ,  
 	 [ A d s e n s e I D ]   [ n v a r c h a r ] ( 3 0 )   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ A d s e n s e I D ]     D E F A U L T   ( ' ' ) ,  
 	 [ T r a c k i n g H t m l ]   [ t e x t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ H o s t _ T r a c k i n g H t m l ]     D E F A U L T   ( ' ' ) ,  
 	 [ A n n o u n c e m e n t H t m l ]   [ t e x t ]   N U L L ,  
 	 [ S m t p H o s t ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ S m t p P o r t ]   [ i n t ]   N U L L ,  
 	 [ S m t p U s e r n a m e ]   [ n v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ S m t p P a s s w o r d ]   [ n v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ S m t p E n a b l e S s l ]   [ b i t ]   N U L L ,  
 	 [ F e e d B u r n e r M a i n R s s F e e d U r l ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L ,  
 	 [ F e e d B u r n e r M a i n R s s F e e d C o u n t H t m l ]   [ n v a r c h a r ] ( 5 0 0 )   N U L L ,  
   C O N S T R A I N T   [ P K _ K i c k _ H o s t ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ H o s t I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]   T E X T I M A G E _ O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ T a g ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 7   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ T a g ] (  
 	 [ T a g I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ T a g I d e n t i f i e r ]   [ n v a r c h a r ] ( 6 0 )   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ K i c k _ T a g ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ T a g I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ S t o r y ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ S t o r y ] (  
 	 [ S t o r y I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ H o s t I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ S t o r y I d e n t i f i e r ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ T i t l e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ D e s c r i p t i o n ]   [ n v a r c h a r ] ( 4 0 0 0 )   N O T   N U L L ,  
 	 [ U r l ]   [ n v a r c h a r ] ( 1 0 0 0 )   N O T   N U L L ,  
 	 [ C a t e g o r y I D ]   [ s m a l l i n t ]   N O T   N U L L ,  
 	 [ U s e r I D ]   [ i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ S t o r y _ U s e r I D ]     D E F A U L T   ( ( 1 ) ) ,  
 	 [ U s e r n a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ K i c k C o u n t ]   [ i n t ]   N O T   N U L L ,  
 	 [ S p a m C o u n t ]   [ i n t ]   N O T   N U L L ,  
 	 [ V i e w C o u n t ]   [ i n t ]   N O T   N U L L ,  
 	 [ C o m m e n t C o u n t ]   [ i n t ]   N O T   N U L L ,  
 	 [ I s P u b l i s h e d T o H o m e p a g e ]   [ b i t ]   N O T   N U L L ,  
 	 [ I s S p a m ]   [ b i t ]   N O T   N U L L ,  
 	 [ A d s e n s e I D ]   [ n v a r c h a r ] ( 3 0 )   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ S t o r y _ A d s e n s e I D ]     D E F A U L T   ( ' ' ) ,  
 	 [ C r e a t e d O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ P u b l i s h e d O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ K i c k _ S t o r y ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ S t o r y I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ C o m m e n t ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 5   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ C o m m e n t ] (  
 	 [ C o m m e n t I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ S t o r y I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ U s e r I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ U s e r n a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ C o m m e n t ]   [ n v a r c h a r ] ( 4 0 0 0 )   N O T   N U L L ,  
 	 [ C r e a t e d O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ C o m m e n t ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ C o m m e n t I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 6   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ] (  
 	 [ S t o r y U s e r H o s t T a g I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ S t o r y I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ U s e r I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ H o s t I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ T a g I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ C r e a t e d O n ]   [ d a t e t i m e ]   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ K i c k _ S t o r y U s e r H o s t T a g _ 1 ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ S t o r y U s e r H o s t T a g I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ S t o r y K i c k ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ S t o r y K i c k ] (  
 	 [ S t o r y K i c k I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ S t o r y I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ U s e r I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ H o s t I D ]   [ i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ S t o r y K i c k _ H o s t I D ]     D E F A U L T   ( ( 2 ) ) ,  
 	 [ C r e a t e d O n ]   [ d a t e t i m e ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ S t o r y K i c k _ C r e a t e d D a t e T i m e ]     D E F A U L T   ( ( ( 1 ) / ( 1 ) ) / ( 2 0 0 0 ) ) ,  
   C O N S T R A I N T   [ P K _ K i c k _ S t o r y K i c k _ 1 ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ S t o r y K i c k I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ C a t e g o r y ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ C a t e g o r y ] (  
 	 [ C a t e g o r y I D ]   [ s m a l l i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ H o s t I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ C a t e g o r y I d e n t i f i e r ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ N a m e ]   [ n v a r c h a r ] ( 5 0 )   N O T   N U L L ,  
 	 [ D e s c r i p t i o n ]   [ n v a r c h a r ] ( 4 0 0 0 )   N O T   N U L L ,  
 	 [ I c o n N a m e ]   [ n v a r c h a r ] ( 5 0 )   N U L L ,  
 	 [ O r d e r P r i o r i t y ]   [ s m a l l i n t ]   N O T   N U L L   C O N S T R A I N T   [ D F _ K i c k _ C a t e g o r y _ O r d e r P r i o r i t y ]     D E F A U L T   ( ( 1 0 0 ) ) ,  
   C O N S T R A I N T   [ P K _ K i c k _ C a t e g o r y ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ C a t e g o r y I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ K i c k _ S e t t i n g ]         S c r i p t   D a t e :   0 7 / 1 2 / 2 0 0 7   1 1 : 4 9 : 1 6   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ K i c k _ S e t t i n g ] (  
 	 [ S e t t i n g I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ N a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N O T   N U L L ,  
 	 [ V a l u e ]   [ t e x t ]   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ K i c k _ S e t t i n g ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ S e t t i n g I D ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]   T E X T I M A G E _ O N   [ P R I M A R Y ]  
  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t T a g s B y U s e r I D A n d H o s t I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t T a g s B y U s e r I D A n d H o s t I D ]    
 	 @ U s e r I D   i n t ,  
 	 @ H o s t I D   i n t  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ;  
 	  
 S E L E C T           d b o . K i c k _ T a g . T a g I D ,   d b o . K i c k _ T a g . T a g I d e n t i f i e r  
 F R O M                   d b o . K i c k _ S t o r y U s e r H o s t T a g   I N N E R   J O I N  
                                             d b o . K i c k _ T a g   O N   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D   =   d b o . K i c k _ T a g . T a g I D  
  
 W H E R E            
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . U s e r I D   =   @ U s e r I D )  
 A N D  
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . H o s t I D   =   @ H o s t I D )  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t T a g s B y H o s t I D A n d C r e a t e d O n R a n g e ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t T a g s B y H o s t I D A n d C r e a t e d O n R a n g e ]  
 	 @ H o s t I D   i n t ,  
 	 @ C r e a t e d O n _ L o w e r   d a t e t i m e ,  
 	 @ C r e a t e d O n _ U p p e r   d a t e t i m e  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ;  
 	  
 S E L E C T           d b o . K i c k _ T a g . T a g I D ,   d b o . K i c k _ T a g . T a g I d e n t i f i e r  
 F R O M                   d b o . K i c k _ S t o r y U s e r H o s t T a g   I N N E R   J O I N  
                                             d b o . K i c k _ T a g   O N   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D   =   d b o . K i c k _ T a g . T a g I D  
  
 W H E R E            
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . H o s t I D   =   @ H o s t I D )  
 A N D  
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . C r e a t e d O n   B E T W E E N   @ C r e a t e d O n _ L o w e r   A N D   @ C r e a t e d O n _ U p p e r )  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t T a g s B y U s e r I D A n d S t o r y I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t T a g s B y U s e r I D A n d S t o r y I D ]    
 	 @ U s e r I D   i n t ,  
 	 @ S t o r y I D   i n t  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ;  
 	  
 S E L E C T           d b o . K i c k _ T a g . T a g I D ,   d b o . K i c k _ T a g . T a g I d e n t i f i e r  
 F R O M                   d b o . K i c k _ S t o r y U s e r H o s t T a g   I N N E R   J O I N  
                                             d b o . K i c k _ T a g   O N   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D   =   d b o . K i c k _ T a g . T a g I D  
  
 W H E R E            
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . U s e r I D   =   @ U s e r I D )  
 A N D  
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . S t o r y I D   =   @ S t o r y I D )  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t T a g s B y U s e r I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t T a g s B y U s e r I D ]    
 	 @ U s e r I D   i n t  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ;  
 	  
 S E L E C T           d b o . K i c k _ T a g . T a g I D ,   d b o . K i c k _ T a g . T a g I d e n t i f i e r  
 F R O M                   d b o . K i c k _ S t o r y U s e r H o s t T a g   I N N E R   J O I N  
                                             d b o . K i c k _ T a g   O N   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D   =   d b o . K i c k _ T a g . T a g I D  
  
 W H E R E            
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . U s e r I D   =   @ U s e r I D )  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t T a g s B y S t o r y I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t T a g s B y S t o r y I D ]    
 	 @ S t o r y I D   i n t  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ;  
 	  
 S E L E C T           d b o . K i c k _ T a g . T a g I D ,   d b o . K i c k _ T a g . T a g I d e n t i f i e r  
 F R O M                   d b o . K i c k _ S t o r y U s e r H o s t T a g   I N N E R   J O I N  
                                             d b o . K i c k _ T a g   O N   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D   =   d b o . K i c k _ T a g . T a g I D  
  
 W H E R E            
 	 ( d b o . K i c k _ S t o r y U s e r H o s t T a g . S t o r y I D   =   @ S t o r y I D )  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t P a g e d S t o r i e s B y T a g I D A n d H o s t I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 0 9   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t P a g e d S t o r i e s B y T a g I D A n d H o s t I D ]  
 	 @ T a g I D   i n t ,  
 	 @ H o s t I D   i n t ,  
 	 @ P a g e N u m b e r   i n t ,  
 	 @ P a g e S i z e   i n t  
 A S  
 B E G I N  
  
 D E C L A R E   @ S t a r t R o w   i n t ,   @ E n d R o w   i n t  
 S E T   @ S t a r t R o w   =   ( ( ( @ P a g e N u m b e r   -   1 )   *   @ P a g e S i z e )   +   1 ) ;  
 S E T   @ E n d R o w   =   ( @ S t a r t R o w   +   @ P a g e S i z e   -   1 ) ;  
  
 W I T H   T a g g e d S t o r i e s    
 	 A S   ( S E L E C T   R O W _ N U M B E R ( )   O V E R   ( O R D E R   B Y   K i c k _ S t o r y . C r e a t e d O n   D E S C )   A S    
 	 	 R o w ,   d b o . K i c k _ S t o r y . *  
 	 F R O M                    
 	 	 d b o . K i c k _ S t o r y   I N N E R   J O I N  
 	 	 	 d b o . K i c k _ S t o r y U s e r H o s t T a g   O N   d b o . K i c k _ S t o r y . S t o r y I D   =   d b o . K i c k _ S t o r y U s e r H o s t T a g . S t o r y I D  
 	 W H E R E   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D = @ T a g I D   A N D   d b o . K i c k _ S t o r y U s e r H o s t T a g . H o s t I D = @ H o s t I D )  
  
 S E L E C T   *   F R O M   T a g g e d S t o r i e s  
 W H E R E   R O W   b e t w e e n   @ S t a r t R o w   A N D   @ E n d R o w  
  
  
  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t P a g e d S t o r i e s B y T a g I D A n d H o s t I D A n d U s e r I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t P a g e d S t o r i e s B y T a g I D A n d H o s t I D A n d U s e r I D ]  
 	 @ T a g I D   i n t ,  
 	 @ H o s t I D   i n t ,  
 	 @ U s e r I D   i n t ,  
 	 @ P a g e N u m b e r   i n t ,  
 	 @ P a g e S i z e   i n t  
 A S  
 B E G I N  
  
 D E C L A R E   @ S t a r t R o w   i n t ,   @ E n d R o w   i n t  
 S E T   @ S t a r t R o w   =   ( ( ( @ P a g e N u m b e r   -   1 )   *   @ P a g e S i z e )   +   1 ) ;  
 S E T   @ E n d R o w   =   ( @ S t a r t R o w   +   @ P a g e S i z e   -   1 ) ;  
  
 W I T H   T a g g e d S t o r i e s    
 	 A S   ( S E L E C T   R O W _ N U M B E R ( )   O V E R   ( O R D E R   B Y   K i c k _ S t o r y . C r e a t e d O n   D E S C )   A S    
 	 	 R o w ,   d b o . K i c k _ S t o r y . *  
 	 F R O M                    
 	 	 d b o . K i c k _ S t o r y   I N N E R   J O I N  
 	 	 	 d b o . K i c k _ S t o r y U s e r H o s t T a g   O N   d b o . K i c k _ S t o r y . S t o r y I D   =   d b o . K i c k _ S t o r y U s e r H o s t T a g . S t o r y I D  
 	 W H E R E   d b o . K i c k _ S t o r y U s e r H o s t T a g . T a g I D = @ T a g I D   A N D   d b o . K i c k _ S t o r y U s e r H o s t T a g . H o s t I D = @ H o s t I D   A N D   d b o . K i c k _ S t o r y U s e r H o s t T a g . U s e r I D = @ U s e r I D )  
  
 S E L E C T   *   F R O M   T a g g e d S t o r i e s  
 W H E R E   R O W   b e t w e e n   @ S t a r t R o w   A N D   @ E n d R o w  
  
  
  
 E N D  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t P a g e d K i c k e d S t o r i e s B y U s e r I D A n d H o s t I D ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 0 9   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ K i c k _ G e t P a g e d K i c k e d S t o r i e s B y U s e r I D A n d H o s t I D ]  
 	 @ U s e r I D   i n t ,  
 	 @ H o s t I D   i n t ,  
 	 @ P a g e N u m b e r   i n t ,  
 	 @ P a g e S i z e   i n t  
 A S  
 B E G I N  
  
 D E C L A R E   @ S t a r t R o w   i n t ,   @ E n d R o w   i n t  
 S E T   @ S t a r t R o w   =   ( ( ( @ P a g e N u m b e r   -   1 )   *   @ P a g e S i z e )   +   1 ) ;  
 S E T   @ E n d R o w   =   ( @ S t a r t R o w   +   @ P a g e S i z e   -   1 ) ;  
  
  
  
  
  
 W I T H   K i c k e d S t o r i e s    
 	 A S   ( S E L E C T   R O W _ N U M B E R ( )   O V E R   ( O R D E R   B Y   K i c k _ S t o r y . C r e a t e d O n   D E S C )   A S    
 	 	 R o w ,   d b o . K i c k _ S t o r y . *  
 	 F R O M                    
 	 	 d b o . K i c k _ S t o r y   I N N E R   J O I N  
 	 	 	 d b o . K i c k _ S t o r y K i c k   O N   d b o . K i c k _ S t o r y . S t o r y I D   =   d b o . K i c k _ S t o r y K i c k . S t o r y I D  
 	 W H E R E   d b o . K i c k _ S t o r y K i c k . U s e r I D = @ U s e r I D   A N D   d b o . K i c k _ S t o r y K i c k . H o s t I D = @ H o s t I D )  
  
 S E L E C T   *   F R O M   K i c k e d S t o r i e s  
 W H E R E   R O W   b e t w e e n   @ S t a r t R o w   A N D   @ E n d R o w  
  
  
  
 E N D  
 G O  
  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ K i c k _ G e t U s e r s W h o K i c k e d ]         S c r i p t   D a t e :   0 8 / 3 0 / 2 0 0 7   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   P R O C E D U R E   d b o . K i c k _ G e t U s e r s W h o K i c k e d    
 @ s t o r y I d   i n t  
  
 A S  
 B E G I N  
  
 S E T   N O C O U N T   O N ;  
  
 S E L E C T 	  
 	 u . [ U s e r I D ]  
       , u . [ U s e r n a m e ]  
       , u . [ E m a i l ]  
       , u . [ P a s s w o r d ]  
       , u . [ P a s s w o r d S a l t ]  
       , u . [ I s G e n e r a t e d P a s s w o r d ]  
       , u . [ I s V a l i d a t e d ]  
       , u . [ I s B a n n e d ]  
       , u . [ A d s e n s e I D ]  
       , u . [ R e c e i v e E m a i l N e w s l e t t e r ]  
       , u . [ R o l e s ]  
       , u . [ H o s t I D ]  
       , u . [ L a s t A c t i v e O n ]  
       , u . [ C r e a t e d O n ]  
       , u . [ M o d i f i e d O n ]  
 	 F R O M   K i c k _ U s e r   u   ( N O L O C K )  
 	 	 I N N E R   J O I N   K i c k _ S t o r y K i c k   s k   ( N O L O C K )   O N   u . u s e r I d   =   s k . u s e r I d  
 	 W H E R E   s k . s t o r y I d   =   @ s t o r y I d  
  
 E N D  
 G O  
  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ C a t e g o r y _ K i c k _ H o s t ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 3   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ C a t e g o r y ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ C a t e g o r y _ K i c k _ H o s t ]   F O R E I G N   K E Y ( [ H o s t I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ H o s t ]   ( [ H o s t I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ C a t e g o r y ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ C a t e g o r y _ K i c k _ H o s t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ C o m m e n t _ K i c k _ S t o r y ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 5   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ C o m m e n t ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ C o m m e n t _ K i c k _ S t o r y ]   F O R E I G N   K E Y ( [ S t o r y I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ S t o r y ]   ( [ S t o r y I D ] )  
 O N   D E L E T E   C A S C A D E  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ C o m m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ C o m m e n t _ K i c k _ S t o r y ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ C o m m e n t _ K i c k _ U s e r ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 1 6   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ C o m m e n t ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ C o m m e n t _ K i c k _ U s e r ]   F O R E I G N   K E Y ( [ U s e r I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ U s e r ]   ( [ U s e r I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ C o m m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ C o m m e n t _ K i c k _ U s e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y _ K i c k _ C a t e g o r y ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 1   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y _ K i c k _ C a t e g o r y ]   F O R E I G N   K E Y ( [ C a t e g o r y I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ C a t e g o r y ]   ( [ C a t e g o r y I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y _ K i c k _ C a t e g o r y ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y _ K i c k _ H o s t ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 1   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y _ K i c k _ H o s t ]   F O R E I G N   K E Y ( [ H o s t I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ H o s t ]   ( [ H o s t I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y _ K i c k _ H o s t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y _ K i c k _ U s e r ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 2   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y _ K i c k _ U s e r ]   F O R E I G N   K E Y ( [ U s e r I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ U s e r ]   ( [ U s e r I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y _ K i c k _ U s e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y K i c k _ K i c k _ S t o r y ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 4   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y K i c k ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y K i c k _ K i c k _ S t o r y ]   F O R E I G N   K E Y ( [ S t o r y I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ S t o r y ]   ( [ S t o r y I D ] )  
 O N   D E L E T E   C A S C A D E  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y K i c k ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y K i c k _ K i c k _ S t o r y ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y K i c k _ K i c k _ U s e r ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 4   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y K i c k ]     W I T H   N O C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y K i c k _ K i c k _ U s e r ]   F O R E I G N   K E Y ( [ U s e r I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ U s e r ]   ( [ U s e r I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y K i c k ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y K i c k _ K i c k _ U s e r ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ H o s t ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 6   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ H o s t ]   F O R E I G N   K E Y ( [ H o s t I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ H o s t ]   ( [ H o s t I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ H o s t ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ S t o r y ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 6   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ S t o r y ]   F O R E I G N   K E Y ( [ S t o r y I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ S t o r y ]   ( [ S t o r y I D ] )  
 O N   D E L E T E   C A S C A D E  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ S t o r y ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ T a g ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 6   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ T a g ]   F O R E I G N   K E Y ( [ T a g I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ T a g ]   ( [ T a g I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ T a g ]  
 G O  
 / * * * * * *   O b j e c t :     F o r e i g n K e y   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ U s e r ]         S c r i p t   D a t e :   0 7 / 0 8 / 2 0 0 7   1 8 : 0 0 : 3 6   * * * * * * /  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ U s e r ]   F O R E I G N   K E Y ( [ U s e r I D ] )  
 R E F E R E N C E S   [ d b o ] . [ K i c k _ U s e r ]   ( [ U s e r I D ] )  
 G O  
 A L T E R   T A B L E   [ d b o ] . [ K i c k _ S t o r y U s e r H o s t T a g ]   C H E C K   C O N S T R A I N T   [ F K _ K i c k _ S t o r y U s e r H o s t T a g _ K i c k _ U s e r ]  
 G O  
 