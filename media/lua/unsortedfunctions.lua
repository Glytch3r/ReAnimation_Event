------------------------   blind            ---------------------------
UIManager.setFadeBeforeUI(getPlayer():getPlayerNum(), true)
UIManager.FadeOut(getPlayer():getPlayerNum(), 1)
getPlayer():setIgnoreInputsForDirection(true);
getPlayer():setIgnoreMovement(true) 
------------------------     unblind          ---------------------------

UIManager.FadeIn(getPlayer():getPlayerNum(), 1)
getPlayer():setIgnoreInputsForDirection(false);
getPlayer():setIgnoreMovement(false) 

------------------------     stagger          ---------------------------
	getPlayer():setBumpType("stagger");getPlayer():setVariable("BumpDone", false); getPlayer():setVariable("BumpFall", true);
	
	------------------------               ---------------------------
	if key ~= getCore():getKey("Shout") then return end	