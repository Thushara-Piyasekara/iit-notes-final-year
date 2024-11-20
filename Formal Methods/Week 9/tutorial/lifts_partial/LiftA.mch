MACHINE LiftA

VARIABLES currentFloorA, requestsA, directionA

INVARIANT
  currentFloorA : NAT & currentFloorA <= maxFloor &
  requestsA <: 0..maxFloor &
  directionA : Directions 
INITIALISATION
  currentFloorA := 0 || requestsA := {} || directionA := None

OPERATIONS
  
  addRequestA( ff ) = 
  PRE ff : NAT & ff < maxFloor
  THEN
    requestsA := requestsA \/ { ff }
  END;

  moveA = 
  BEGIN
    // TO DO: make one step, moving or choosing where to go
    // There are several cases:
	// - If there are no requests, direction should be None. Otherwise:
	//   - If direction is currently Down, move down a floor (if there are requests remaining below) or change direction
	//   - If direction is currently Up, move up a floor (if there are requests remaining above) or change direction
    //   - In either case, remove the current floor from the requests.
  END

END

