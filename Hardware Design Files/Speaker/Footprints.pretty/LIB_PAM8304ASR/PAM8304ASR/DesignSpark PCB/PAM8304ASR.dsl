SamacSys ECAD Model
372762/1299475/2.50/8/3/Integrated Circuit

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r140_45"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.45) (shapeHeight 1.4))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "SOP65P490X110-8N" (originalName "SOP65P490X110-8N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r140_45) (pt -2.2, 0.975) (rotation 90))
			(pad (padNum 2) (padStyleRef r140_45) (pt -2.2, 0.325) (rotation 90))
			(pad (padNum 3) (padStyleRef r140_45) (pt -2.2, -0.325) (rotation 90))
			(pad (padNum 4) (padStyleRef r140_45) (pt -2.2, -0.975) (rotation 90))
			(pad (padNum 5) (padStyleRef r140_45) (pt 2.2, -0.975) (rotation 90))
			(pad (padNum 6) (padStyleRef r140_45) (pt 2.2, -0.325) (rotation 90))
			(pad (padNum 7) (padStyleRef r140_45) (pt 2.2, 0.325) (rotation 90))
			(pad (padNum 8) (padStyleRef r140_45) (pt 2.2, 0.975) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -3.15 1.8) (pt 3.15 1.8) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 3.15 1.8) (pt 3.15 -1.8) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 3.15 -1.8) (pt -3.15 -1.8) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -3.15 -1.8) (pt -3.15 1.8) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.5 1.5) (pt 1.5 1.5) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.5 1.5) (pt 1.5 -1.5) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.5 -1.5) (pt -1.5 -1.5) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.5 -1.5) (pt -1.5 1.5) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.5 0.85) (pt -0.85 1.5) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.15 1.5) (pt 1.15 1.5) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.15 1.5) (pt 1.15 -1.5) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 1.15 -1.5) (pt -1.15 -1.5) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.15 -1.5) (pt -1.15 1.5) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.9 1.55) (pt -1.5 1.55) (width 0.2))
		)
	)
	(symbolDef "PAM8304ASR" (originalName "PAM8304ASR")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 4) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -325 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 5) (pt 1100 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 870 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 6) (pt 1100 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 870 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 7) (pt 1100 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 870 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 8) (pt 1100 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 870 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 900 mils 100 mils) (width 6 mils))
		(line (pt 900 mils 100 mils) (pt 900 mils -400 mils) (width 6 mils))
		(line (pt 900 mils -400 mils) (pt 200 mils -400 mils) (width 6 mils))
		(line (pt 200 mils -400 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 950 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "PAM8304ASR" (originalName "PAM8304ASR") (compHeader (numPins 8) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "OUT+") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "PVDD") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "3" (pinName "VDD") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "4" (pinName "IN-") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "8" (pinName "OUT-") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "7" (pinName "GND") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "6" (pinName "__SD") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "5" (pinName "IN+") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "PAM8304ASR"))
		(attachedPattern (patternNum 1) (patternName "SOP65P490X110-8N")
			(numPads 8)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "5")
				(padNum 6) (compPinRef "6")
				(padNum 7) (compPinRef "7")
				(padNum 8) (compPinRef "8")
			)
		)
		(attr "Mouser Part Number" "621-PAM8304ASR")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/PAM8304ASR?qs=T3IxTwwp%252B0thqqOUH1TiHA%3D%3D")
		(attr "Manufacturer_Name" "Diodes Incorporated")
		(attr "Manufacturer_Part_Number" "PAM8304ASR")
		(attr "Description" "PAM8304ASR DiodesZetex, Audio Amplifier, 8-Pin MSOP Mono")
		(attr "Datasheet Link" "https://www.diodes.com/assets/Datasheets/PAM8304.pdf")
		(attr "Height" "1.1 mm")
	)

)
