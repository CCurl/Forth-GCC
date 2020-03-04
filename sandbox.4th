CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;

\ ------------- START OF SANDBOX -------------




\ ------------- END OF SANDBOX -------------
forget-these
.(HERE) 44 EMIT BL .(LAST) CR
