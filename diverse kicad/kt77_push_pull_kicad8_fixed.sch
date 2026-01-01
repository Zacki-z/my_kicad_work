
(kicad_sch (version 20220101) (generator "eeschema")

  (uuid "12345678-1234-5678-1234-567812345678")
  (paper "A4")
  (title_block
    (title "KT77 Push-Pull Tube Amplifier")
    (date "2025-03-13")
    (rev "1.0")
    (company "Designed in KiCad 8")
    (comment 1 "ECC83S Preamp and Phase Splitter")
    (comment 2 "KT77 Output Stage with Automatic Bias Control")
    (comment 3 "Toroidy TTG-EL34PP Output Transformer")
  )

  (lib_symbols
    (symbol "Tube:12AX7" (at 50 50) (property "Reference" "V1" (at 0 10) (layer "F.SilkS")))
    (symbol "Tube:KT77" (at 100 50) (property "Reference" "V3" (at 0 10) (layer "F.SilkS")))
    (symbol "Device:R" (at 60 40) (property "Reference" "R1" (at 0 10) (layer "F.SilkS")) (property "Value" "1MΩ"))
    (symbol "Device:R" (at 70 40) (property "Reference" "R2" (at 0 10) (layer "F.SilkS")) (property "Value" "1MΩ"))
    (symbol "power:+400V" (at 60 30) (property "Reference" "#PWR01" (at 0 10) (layer "F.SilkS")))
  )

  (wires
    (wire (pts (xy 60 30) (xy 60 40)))  ; Connection from +400V to R1
    (wire (pts (xy 70 30) (xy 70 40)))  ; Connection from +400V to R2
    (wire (pts (xy 60 40) (xy 50 50)))  ; Connection from R1 to ECC83S
    (wire (pts (xy 70 40) (xy 100 50))) ; Connection from R2 to KT77
  )
)
