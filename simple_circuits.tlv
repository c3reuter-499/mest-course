\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   //$out = ! $in1;
   //$out2 = $in2 && $in3;
   //$out[7:0] = $in1[3:0] * $in2[3:0];
   //$out = $sel ? $in1 : $in2;
   //$out[7:0] = $sel ? $in1[7:0] : $in2[7:0];
   
   //`BOGUS_USE($sel[3:0])  //notice the back tic
   
   //$out[7:0] =
   //   $sel[3]
   //     ? $in3[7:0]
   //      : $sel[2]
   //           ? $in2[7:0]
   //           : $sel[1]
   //                ? $in1[7:0]
   //                : $in0[7:0];
   
   //$out[7:0] =
   //   $sel_enc[1:0] == 2'b11
   //      ? $in3[7:0]
   //      : $sel_enc[1:0] == 2'b10
   //           ? $in2[7:0]
   //      : $sel_enc[1:0] == 2'b01
   //           ? $in1[7:0]
   //      : $in0[7:0];
   
   
   //   $out[7:0] =
   //    $sel_enc[1:0] == 2'b11
   //      ? $val1[7:0] / val2[7:0]
   //      : $sel_enc[1:0] == 2'b10
   //          ? : $val1[7:0] * val2[7:0]
   //      : $sel_enc[1:0] == 2'b01
   //           ? : $val1[7:0] - val2[7:0]
   //      : $val1[7:0] + val2[7:0];
   
   //combinational calculator
   //$val1[7:0] = $rand1[3:0] ;
   //$val2[7:0] = $rand2[3:0] ;
   
   //$sum[7:0] = $val1 + $val2 ;
   //$diff[7:0] = $val1 - $val2 ;
   //$prod[7:0] = $val1 * $val2 ;
   //$quot[7:0] = $val1 / $val2 ;
   
   //$out[7:0] =
   //   $op[1:0] == 2'b00 ? $sum :
   //   $op[1:0] == 2'b01 ? $diff :
   //   $op[1:0] == 2'b10 ? $prod :
   //        $quot ;
   
   // \TLV is transaction level verilog
   
   //   $num[31:0] = $reset ? 1 : (>>1$num + >>2$num) ;
   //  $sum[7:0] = $val1 + $val2
   
   
   //Counter (sequential logic)
   //$cnt[1:0] = $reset ? 0 :
   //         (>>1$cnt + 1) ;
   
      // edit combinational calculator to add sequential
   $val1[7:0] = >>1$out ;
   $val2[7:0] = $rand2[3:0] ;
   
   $sum[7:0] = $val1 + $val2 ;
   $diff[7:0] = $val1 - $val2 ;
   $prod[7:0] = $val1 * $val2 ;
   $quot[7:0] = $val1 / $val2 ;
   
   
   $out[7:0] =
      $reset ? 0 :
      $op[1:0] == 2'b00 ? $sum :
      $op[1:0] == 2'b01 ? $diff :
      $op[1:0] == 2'b10 ? $prod :
           $quot ;
   
   
   
   
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
