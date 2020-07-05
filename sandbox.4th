CR sys-info

last here
variable th th !
variable tl tl !

: fsb tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------

\ real simple and stupid decimal words
\ a decimal is a 2-cell thing ( integer fraction )

\ usage: 123.45 543.21 should = 666.66
\ 100 d.base !
\ 12345 >d.b 54321 >d.b d.b+ d.b

variable d.base 
100 d.base !

: >d.b d.base @ /mod swap ;
: d.b swap (.) period d.base @ 
     dup   100 = if drop .2 leave then
     dup  1000 = if drop .3 leave then
     dup 10000 = if drop .4 leave then
     drop . ;
: d.b> swap d.base @ * + ;
: d.b>-2 d.b> -rot d.b> swap ;
: d.b+ d.b>-2 + >d.b ;
: d.b- d.b>-2 - >d.b ;
: d.b* d.b>-2 * d.base @ / >d.b ;
: d.b/ d.b> -rot d.b> d.base @ * swap / >d.b ;


\ ------------- END OF SANDBOX -------------
CR sys-info
\ fsb CR sys-info