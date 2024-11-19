MACHINE Sequences
DEFINITIONS
  concat(ss,tt) == ( );
  downArrow(ss,nn) == ( )
VARIABLES s1, s2
INVARIANT
  s1 : seq(NAT) & s2 : seq(NAT)
INITIALISATION 
  s1 := [1,3,5] || s2 := [7,8,9]
OPERATIONS
  // Operations to test the definitions above.
  // These should not need to be changed, they should simply work once the definitions are completed.
  Conc = 
  BEGIN
    s1 := concat(s1, s2)
  END;

  Truncate(nn) =
  PRE nn:NAT & nn<=card(s1)
  THEN
    s1 := downArrow(s1, nn)
  END
END

