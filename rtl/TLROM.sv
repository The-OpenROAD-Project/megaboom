// Standard header to adapt well known macros for prints and assertions.

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module TLROM(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [16:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [1:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
);

  reg [63:0] casez_tmp;
  always @(*) begin
    casez (auto_in_a_bits_address[11:3])
      9'b000000000:
        casez_tmp = 64'h405051300000517;
      9'b000000001:
        casez_tmp = 64'h301022F330551073;
      9'b000000010:
        casez_tmp = 64'h12F2934122D293;
      9'b000000011:
        casez_tmp = 64'h3030107300028463;
      9'b000000100:
        casez_tmp = 64'h3045107300800513;
      9'b000000101:
        casez_tmp = 64'h1050007330052073;
      9'b000000110:
        casez_tmp = 64'hFFDFF06F;
      9'b000000111:
        casez_tmp = 64'h0;
      9'b000001000:
        casez_tmp = 64'hF1402573020005B7;
      9'b000001001:
        casez_tmp = 64'h380006F00050463;
      9'b000001010:
        casez_tmp = 64'h10069300458613;
      9'b000001011:
        casez_tmp = 64'h46061300D62023;
      9'b000001100:
        casez_tmp = 64'hFE069AE3FFC62683;
      9'b000001101:
        casez_tmp = 64'h2C0006F;
      9'b000001110:
        casez_tmp = 64'h0;
      9'b000001111:
        casez_tmp = 64'h0;
      9'b000010000:
        casez_tmp = 64'h5A283F81FF06F;
      9'b000010001:
        casez_tmp = 64'h251513FE029EE3;
      9'b000010010:
        casez_tmp = 64'h5A02300B505B3;
      9'b000010011:
        casez_tmp = 64'h5350300001537;
      9'b000010100:
        casez_tmp = 64'hF140257334151073;
      9'b000010101:
        casez_tmp = 64'h185859300000597;
      9'b000010110:
        casez_tmp = 64'h3006307308000613;
      9'b000010111:
        casez_tmp = 64'h1330200073;
      9'b000011000:
        casez_tmp = 64'hCD0C0000EDFE0DD0;
      9'b000011001:
        casez_tmp = 64'hD00A000038000000;
      9'b000011010:
        casez_tmp = 64'h1100000028000000;
      9'b000011011:
        casez_tmp = 64'h10000000;
      9'b000011100:
        casez_tmp = 64'h980A0000FD010000;
      9'b000011101:
        casez_tmp = 64'h0;
      9'b000011110:
        casez_tmp = 64'h0;
      9'b000011111:
        casez_tmp = 64'h1000000;
      9'b000100000:
        casez_tmp = 64'h400000003000000;
      9'b000100001:
        casez_tmp = 64'h200000000000000;
      9'b000100010:
        casez_tmp = 64'h400000003000000;
      9'b000100011:
        casez_tmp = 64'h20000000F000000;
      9'b000100100:
        casez_tmp = 64'h1500000003000000;
      9'b000100101:
        casez_tmp = 64'h2D6263751B000000;
      9'b000100110:
        casez_tmp = 64'h706968632C726162;
      9'b000100111:
        casez_tmp = 64'h7665642D64726179;
      9'b000101000:
        casez_tmp = 64'h300000000000000;
      9'b000101001:
        casez_tmp = 64'h2600000011000000;
      9'b000101010:
        casez_tmp = 64'h2C7261622D626375;
      9'b000101011:
        casez_tmp = 64'h6472617970696863;
      9'b000101100:
        casez_tmp = 64'h100000000000000;
      9'b000101101:
        casez_tmp = 64'h73757063;
      9'b000101110:
        casez_tmp = 64'h400000003000000;
      9'b000101111:
        casez_tmp = 64'h100000000000000;
      9'b000110000:
        casez_tmp = 64'h400000003000000;
      9'b000110001:
        casez_tmp = 64'hF000000;
      9'b000110010:
        casez_tmp = 64'h400000003000000;
      9'b000110011:
        casez_tmp = 64'h40420F002C000000;
      9'b000110100:
        casez_tmp = 64'h4075706301000000;
      9'b000110101:
        casez_tmp = 64'h300000000000030;
      9'b000110110:
        casez_tmp = 64'h3F00000004000000;
      9'b000110111:
        casez_tmp = 64'h300000000000000;
      9'b000111000:
        casez_tmp = 64'h1B00000014000000;
      9'b000111001:
        casez_tmp = 64'h2C7261622D626375;
      9'b000111010:
        casez_tmp = 64'h697200306D6F6F62;
      9'b000111011:
        casez_tmp = 64'h300000000766373;
      9'b000111100:
        casez_tmp = 64'h4F00000004000000;
      9'b000111101:
        casez_tmp = 64'h300000040000000;
      9'b000111110:
        casez_tmp = 64'h6200000004000000;
      9'b000111111:
        casez_tmp = 64'h300000040000000;
      9'b001000000:
        casez_tmp = 64'h6F00000004000000;
      9'b001000001:
        casez_tmp = 64'h300000000800000;
      9'b001000010:
        casez_tmp = 64'h7C00000004000000;
      9'b001000011:
        casez_tmp = 64'h300000001000000;
      9'b001000100:
        casez_tmp = 64'h8700000004000000;
      9'b001000101:
        casez_tmp = 64'h300000020000000;
      9'b001000110:
        casez_tmp = 64'h9200000004000000;
      9'b001000111:
        casez_tmp = 64'h300000000757063;
      9'b001001000:
        casez_tmp = 64'h9E00000004000000;
      9'b001001001:
        casez_tmp = 64'h300000000000000;
      9'b001001010:
        casez_tmp = 64'hBD00000004000000;
      9'b001001011:
        casez_tmp = 64'h300000040000000;
      9'b001001100:
        casez_tmp = 64'hD000000004000000;
      9'b001001101:
        casez_tmp = 64'h300000040000000;
      9'b001001110:
        casez_tmp = 64'hDD00000004000000;
      9'b001001111:
        casez_tmp = 64'h300000000800000;
      9'b001010000:
        casez_tmp = 64'hEA00000004000000;
      9'b001010001:
        casez_tmp = 64'h300000001000000;
      9'b001010010:
        casez_tmp = 64'hF500000004000000;
      9'b001010011:
        casez_tmp = 64'h300000020000000;
      9'b001010100:
        casez_tmp = 64'h100000B000000;
      9'b001010101:
        casez_tmp = 64'h76732C7663736972;
      9'b001010110:
        casez_tmp = 64'h300000000003933;
      9'b001010111:
        casez_tmp = 64'h901000004000000;
      9'b001011000:
        casez_tmp = 64'h300000001000000;
      9'b001011001:
        casez_tmp = 64'h1A01000004000000;
      9'b001011010:
        casez_tmp = 64'h300000000000000;
      9'b001011011:
        casez_tmp = 64'h1E0100001F000000;
      9'b001011100:
        casez_tmp = 64'h66616D6934367672;
      9'b001011101:
        casez_tmp = 64'h5F727363697A6364;
      9'b001011110:
        casez_tmp = 64'h6965636E6566697A;
      9'b001011111:
        casez_tmp = 64'h6D7068697A5F;
      9'b001100000:
        casez_tmp = 64'h400000003000000;
      9'b001100001:
        casez_tmp = 64'h400000028010000;
      9'b001100010:
        casez_tmp = 64'h400000003000000;
      9'b001100011:
        casez_tmp = 64'h80000003D010000;
      9'b001100100:
        casez_tmp = 64'h500000003000000;
      9'b001100101:
        casez_tmp = 64'h79616B6F4E010000;
      9'b001100110:
        casez_tmp = 64'h300000000000000;
      9'b001100111:
        casez_tmp = 64'h2C00000004000000;
      9'b001101000:
        casez_tmp = 64'h300000040420F00;
      9'b001101001:
        casez_tmp = 64'h5501000000000000;
      9'b001101010:
        casez_tmp = 64'h65746E6901000000;
      9'b001101011:
        casez_tmp = 64'h6F632D7470757272;
      9'b001101100:
        casez_tmp = 64'h72656C6C6F72746E;
      9'b001101101:
        casez_tmp = 64'h300000000000000;
      9'b001101110:
        casez_tmp = 64'h5F01000004000000;
      9'b001101111:
        casez_tmp = 64'h300000001000000;
      9'b001110000:
        casez_tmp = 64'h1B0000000F000000;
      9'b001110001:
        casez_tmp = 64'h70632C7663736972;
      9'b001110010:
        casez_tmp = 64'h63746E692D75;
      9'b001110011:
        casez_tmp = 64'h3000000;
      9'b001110100:
        casez_tmp = 64'h300000070010000;
      9'b001110101:
        casez_tmp = 64'h8501000004000000;
      9'b001110110:
        casez_tmp = 64'h200000002000000;
      9'b001110111:
        casez_tmp = 64'h200000002000000;
      9'b001111000:
        casez_tmp = 64'h6669746801000000;
      9'b001111001:
        casez_tmp = 64'h300000000000000;
      9'b001111010:
        casez_tmp = 64'h1B0000000A000000;
      9'b001111011:
        casez_tmp = 64'h666974682C626375;
      9'b001111100:
        casez_tmp = 64'h200000000000030;
      9'b001111101:
        casez_tmp = 64'h6F6D656D01000000;
      9'b001111110:
        casez_tmp = 64'h3030303038407972;
      9'b001111111:
        casez_tmp = 64'h300000000303030;
      9'b010000000:
        casez_tmp = 64'h9200000007000000;
      9'b010000001:
        casez_tmp = 64'h79726F6D656D;
      9'b010000010:
        casez_tmp = 64'h1000000003000000;
      9'b010000011:
        casez_tmp = 64'h1A010000;
      9'b010000100:
        casez_tmp = 64'h100000000000080;
      9'b010000101:
        casez_tmp = 64'h300000000000000;
      9'b010000110:
        casez_tmp = 64'h8501000004000000;
      9'b010000111:
        casez_tmp = 64'h200000001000000;
      9'b010001000:
        casez_tmp = 64'h636F7301000000;
      9'b010001001:
        casez_tmp = 64'h400000003000000;
      9'b010001010:
        casez_tmp = 64'h200000000000000;
      9'b010001011:
        casez_tmp = 64'h400000003000000;
      9'b010001100:
        casez_tmp = 64'h20000000F000000;
      9'b010001101:
        casez_tmp = 64'h2000000003000000;
      9'b010001110:
        casez_tmp = 64'h2D6263751B000000;
      9'b010001111:
        casez_tmp = 64'h706968632C726162;
      9'b010010000:
        casez_tmp = 64'h636F732D64726179;
      9'b010010001:
        casez_tmp = 64'h2D656C706D697300;
      9'b010010010:
        casez_tmp = 64'h300000000737562;
      9'b010010011:
        casez_tmp = 64'h8D01000000000000;
      9'b010010100:
        casez_tmp = 64'h746F6F6201000000;
      9'b010010101:
        casez_tmp = 64'h737365726464612D;
      9'b010010110:
        casez_tmp = 64'h303031406765722D;
      9'b010010111:
        casez_tmp = 64'h300000000000030;
      9'b010011000:
        casez_tmp = 64'h1A01000010000000;
      9'b010011001:
        casez_tmp = 64'h10000000000000;
      9'b010011010:
        casez_tmp = 64'h10000000000000;
      9'b010011011:
        casez_tmp = 64'h800000003000000;
      9'b010011100:
        casez_tmp = 64'h746E6F6394010000;
      9'b010011101:
        casez_tmp = 64'h2000000006C6F72;
      9'b010011110:
        casez_tmp = 64'h6E696C6301000000;
      9'b010011111:
        casez_tmp = 64'h3030303030324074;
      9'b010100000:
        casez_tmp = 64'h300000000000030;
      9'b010100001:
        casez_tmp = 64'h1B0000000D000000;
      9'b010100010:
        casez_tmp = 64'h6C632C7663736972;
      9'b010100011:
        casez_tmp = 64'h30746E69;
      9'b010100100:
        casez_tmp = 64'h1000000003000000;
      9'b010100101:
        casez_tmp = 64'h20000009E010000;
      9'b010100110:
        casez_tmp = 64'h200000003000000;
      9'b010100111:
        casez_tmp = 64'h300000007000000;
      9'b010101000:
        casez_tmp = 64'h1A01000010000000;
      9'b010101001:
        casez_tmp = 64'h200000000;
      9'b010101010:
        casez_tmp = 64'h10000000000;
      9'b010101011:
        casez_tmp = 64'h800000003000000;
      9'b010101100:
        casez_tmp = 64'h746E6F6394010000;
      9'b010101101:
        casez_tmp = 64'h2000000006C6F72;
      9'b010101110:
        casez_tmp = 64'h636F6C6301000000;
      9'b010101111:
        casez_tmp = 64'h4072657461672D6B;
      9'b010110000:
        casez_tmp = 64'h303030303031;
      9'b010110001:
        casez_tmp = 64'h1000000003000000;
      9'b010110010:
        casez_tmp = 64'h1A010000;
      9'b010110011:
        casez_tmp = 64'h1000;
      9'b010110100:
        casez_tmp = 64'h300000000100000;
      9'b010110101:
        casez_tmp = 64'h9401000008000000;
      9'b010110110:
        casez_tmp = 64'h6C6F72746E6F63;
      9'b010110111:
        casez_tmp = 64'h100000002000000;
      9'b010111000:
        casez_tmp = 64'h6F632D6775626564;
      9'b010111001:
        casez_tmp = 64'h72656C6C6F72746E;
      9'b010111010:
        casez_tmp = 64'h300000000003040;
      9'b010111011:
        casez_tmp = 64'h1B00000021000000;
      9'b010111100:
        casez_tmp = 64'h642C657669666973;
      9'b010111101:
        casez_tmp = 64'h3331302D67756265;
      9'b010111110:
        casez_tmp = 64'h642C766373697200;
      9'b010111111:
        casez_tmp = 64'h3331302D67756265;
      9'b011000000:
        casez_tmp = 64'h300000000000000;
      9'b011000001:
        casez_tmp = 64'hB201000005000000;
      9'b011000010:
        casez_tmp = 64'h6761746A;
      9'b011000011:
        casez_tmp = 64'h800000003000000;
      9'b011000100:
        casez_tmp = 64'h20000009E010000;
      9'b011000101:
        casez_tmp = 64'h3000000FFFF0000;
      9'b011000110:
        casez_tmp = 64'h1A01000010000000;
      9'b011000111:
        casez_tmp = 64'h0;
      9'b011001000:
        casez_tmp = 64'h10000000000000;
      9'b011001001:
        casez_tmp = 64'h800000003000000;
      9'b011001010:
        casez_tmp = 64'h746E6F6394010000;
      9'b011001011:
        casez_tmp = 64'h2000000006C6F72;
      9'b011001100:
        casez_tmp = 64'h6F72726501000000;
      9'b011001101:
        casez_tmp = 64'h6563697665642D72;
      9'b011001110:
        casez_tmp = 64'h3030303340;
      9'b011001111:
        casez_tmp = 64'hE00000003000000;
      9'b011010000:
        casez_tmp = 64'h696669731B000000;
      9'b011010001:
        casez_tmp = 64'h726F7272652C6576;
      9'b011010010:
        casez_tmp = 64'h300000000000030;
      9'b011010011:
        casez_tmp = 64'h1A01000010000000;
      9'b011010100:
        casez_tmp = 64'h30000000000000;
      9'b011010101:
        casez_tmp = 64'h10000000000000;
      9'b011010110:
        casez_tmp = 64'h100000002000000;
      9'b011010111:
        casez_tmp = 64'h7075727265746E69;
      9'b011011000:
        casez_tmp = 64'h6F72746E6F632D74;
      9'b011011001:
        casez_tmp = 64'h3030634072656C6C;
      9'b011011010:
        casez_tmp = 64'h30303030;
      9'b011011011:
        casez_tmp = 64'h400000003000000;
      9'b011011100:
        casez_tmp = 64'h10000005F010000;
      9'b011011101:
        casez_tmp = 64'hC00000003000000;
      9'b011011110:
        casez_tmp = 64'h637369721B000000;
      9'b011011111:
        casez_tmp = 64'h3063696C702C76;
      9'b011100000:
        casez_tmp = 64'h3000000;
      9'b011100001:
        casez_tmp = 64'h300000070010000;
      9'b011100010:
        casez_tmp = 64'h9E01000010000000;
      9'b011100011:
        casez_tmp = 64'hB00000002000000;
      9'b011100100:
        casez_tmp = 64'h900000002000000;
      9'b011100101:
        casez_tmp = 64'h1000000003000000;
      9'b011100110:
        casez_tmp = 64'h1A010000;
      9'b011100111:
        casez_tmp = 64'hC;
      9'b011101000:
        casez_tmp = 64'h300000000000004;
      9'b011101001:
        casez_tmp = 64'h9401000008000000;
      9'b011101010:
        casez_tmp = 64'h6C6F72746E6F63;
      9'b011101011:
        casez_tmp = 64'h400000003000000;
      9'b011101100:
        casez_tmp = 64'hBF010000;
      9'b011101101:
        casez_tmp = 64'h400000003000000;
      9'b011101110:
        casez_tmp = 64'hD2010000;
      9'b011101111:
        casez_tmp = 64'h100000002000000;
      9'b011110000:
        casez_tmp = 64'h30303031406D6F72;
      9'b011110001:
        casez_tmp = 64'h300000000000030;
      9'b011110010:
        casez_tmp = 64'h1B0000000C000000;
      9'b011110011:
        casez_tmp = 64'h722C657669666973;
      9'b011110100:
        casez_tmp = 64'h300000000306D6F;
      9'b011110101:
        casez_tmp = 64'h1A01000010000000;
      9'b011110110:
        casez_tmp = 64'h10000000000;
      9'b011110111:
        casez_tmp = 64'h10000000000;
      9'b011111000:
        casez_tmp = 64'h400000003000000;
      9'b011111001:
        casez_tmp = 64'h6D656D94010000;
      9'b011111010:
        casez_tmp = 64'h100000002000000;
      9'b011111011:
        casez_tmp = 64'h6574737973627573;
      9'b011111100:
        casez_tmp = 64'h635F737562635F6D;
      9'b011111101:
        casez_tmp = 64'h6B636F6C;
      9'b011111110:
        casez_tmp = 64'h400000003000000;
      9'b011111111:
        casez_tmp = 64'hDD010000;
      9'b100000000:
        casez_tmp = 64'h400000003000000;
      9'b100000001:
        casez_tmp = 64'h65CD1D3F000000;
      9'b100000010:
        casez_tmp = 64'h1500000003000000;
      9'b100000011:
        casez_tmp = 64'h73627573EA010000;
      9'b100000100:
        casez_tmp = 64'h62635F6D65747379;
      9'b100000101:
        casez_tmp = 64'h6B636F6C635F7375;
      9'b100000110:
        casez_tmp = 64'h300000000000000;
      9'b100000111:
        casez_tmp = 64'h1B0000000C000000;
      9'b100001000:
        casez_tmp = 64'h6C632D6465786966;
      9'b100001001:
        casez_tmp = 64'h2000000006B636F;
      9'b100001010:
        casez_tmp = 64'h7362757301000000;
      9'b100001011:
        casez_tmp = 64'h62665F6D65747379;
      9'b100001100:
        casez_tmp = 64'h6B636F6C635F7375;
      9'b100001101:
        casez_tmp = 64'h300000000000000;
      9'b100001110:
        casez_tmp = 64'hDD01000004000000;
      9'b100001111:
        casez_tmp = 64'h300000000000000;
      9'b100010000:
        casez_tmp = 64'h3F00000004000000;
      9'b100010001:
        casez_tmp = 64'h30000000065CD1D;
      9'b100010010:
        casez_tmp = 64'hEA01000015000000;
      9'b100010011:
        casez_tmp = 64'h6574737973627573;
      9'b100010100:
        casez_tmp = 64'h635F737562665F6D;
      9'b100010101:
        casez_tmp = 64'h6B636F6C;
      9'b100010110:
        casez_tmp = 64'hC00000003000000;
      9'b100010111:
        casez_tmp = 64'h657869661B000000;
      9'b100011000:
        casez_tmp = 64'h6B636F6C632D64;
      9'b100011001:
        casez_tmp = 64'h100000002000000;
      9'b100011010:
        casez_tmp = 64'h6574737973627573;
      9'b100011011:
        casez_tmp = 64'h6F6C635F326C5F6D;
      9'b100011100:
        casez_tmp = 64'h300000000006B63;
      9'b100011101:
        casez_tmp = 64'hDD01000004000000;
      9'b100011110:
        casez_tmp = 64'h300000000000000;
      9'b100011111:
        casez_tmp = 64'h3F00000004000000;
      9'b100100000:
        casez_tmp = 64'h30000000065CD1D;
      9'b100100001:
        casez_tmp = 64'hEA01000013000000;
      9'b100100010:
        casez_tmp = 64'h6574737973627573;
      9'b100100011:
        casez_tmp = 64'h6F6C635F326C5F6D;
      9'b100100100:
        casez_tmp = 64'h300000000006B63;
      9'b100100101:
        casez_tmp = 64'h1B0000000C000000;
      9'b100100110:
        casez_tmp = 64'h6C632D6465786966;
      9'b100100111:
        casez_tmp = 64'h2000000006B636F;
      9'b100101000:
        casez_tmp = 64'h7362757301000000;
      9'b100101001:
        casez_tmp = 64'h626D5F6D65747379;
      9'b100101010:
        casez_tmp = 64'h6B636F6C635F7375;
      9'b100101011:
        casez_tmp = 64'h300000000000000;
      9'b100101100:
        casez_tmp = 64'hDD01000004000000;
      9'b100101101:
        casez_tmp = 64'h300000000000000;
      9'b100101110:
        casez_tmp = 64'h3F00000004000000;
      9'b100101111:
        casez_tmp = 64'h30000000065CD1D;
      9'b100110000:
        casez_tmp = 64'hEA01000015000000;
      9'b100110001:
        casez_tmp = 64'h6574737973627573;
      9'b100110010:
        casez_tmp = 64'h635F7375626D5F6D;
      9'b100110011:
        casez_tmp = 64'h6B636F6C;
      9'b100110100:
        casez_tmp = 64'hC00000003000000;
      9'b100110101:
        casez_tmp = 64'h657869661B000000;
      9'b100110110:
        casez_tmp = 64'h6B636F6C632D64;
      9'b100110111:
        casez_tmp = 64'h100000002000000;
      9'b100111000:
        casez_tmp = 64'h6574737973627573;
      9'b100111001:
        casez_tmp = 64'h635F7375626F5F6D;
      9'b100111010:
        casez_tmp = 64'h6B636F6C;
      9'b100111011:
        casez_tmp = 64'h400000003000000;
      9'b100111100:
        casez_tmp = 64'hDD010000;
      9'b100111101:
        casez_tmp = 64'h400000003000000;
      9'b100111110:
        casez_tmp = 64'h65CD1D3F000000;
      9'b100111111:
        casez_tmp = 64'h1500000003000000;
      9'b101000000:
        casez_tmp = 64'h73627573EA010000;
      9'b101000001:
        casez_tmp = 64'h626F5F6D65747379;
      9'b101000010:
        casez_tmp = 64'h6B636F6C635F7375;
      9'b101000011:
        casez_tmp = 64'h300000000000000;
      9'b101000100:
        casez_tmp = 64'h1B0000000C000000;
      9'b101000101:
        casez_tmp = 64'h6C632D6465786966;
      9'b101000110:
        casez_tmp = 64'h2000000006B636F;
      9'b101000111:
        casez_tmp = 64'h7362757301000000;
      9'b101001000:
        casez_tmp = 64'h62705F6D65747379;
      9'b101001001:
        casez_tmp = 64'h6B636F6C635F7375;
      9'b101001010:
        casez_tmp = 64'h300000000000000;
      9'b101001011:
        casez_tmp = 64'hDD01000004000000;
      9'b101001100:
        casez_tmp = 64'h300000000000000;
      9'b101001101:
        casez_tmp = 64'h3F00000004000000;
      9'b101001110:
        casez_tmp = 64'h30000000065CD1D;
      9'b101001111:
        casez_tmp = 64'hEA01000015000000;
      9'b101010000:
        casez_tmp = 64'h6574737973627573;
      9'b101010001:
        casez_tmp = 64'h635F737562705F6D;
      9'b101010010:
        casez_tmp = 64'h6B636F6C;
      9'b101010011:
        casez_tmp = 64'hC00000003000000;
      9'b101010100:
        casez_tmp = 64'h657869661B000000;
      9'b101010101:
        casez_tmp = 64'h6B636F6C632D64;
      9'b101010110:
        casez_tmp = 64'h100000002000000;
      9'b101010111:
        casez_tmp = 64'h6574737973627573;
      9'b101011000:
        casez_tmp = 64'h635F737562735F6D;
      9'b101011001:
        casez_tmp = 64'h6B636F6C;
      9'b101011010:
        casez_tmp = 64'h400000003000000;
      9'b101011011:
        casez_tmp = 64'hDD010000;
      9'b101011100:
        casez_tmp = 64'h400000003000000;
      9'b101011101:
        casez_tmp = 64'h65CD1D3F000000;
      9'b101011110:
        casez_tmp = 64'h1500000003000000;
      9'b101011111:
        casez_tmp = 64'h73627573EA010000;
      9'b101100000:
        casez_tmp = 64'h62735F6D65747379;
      9'b101100001:
        casez_tmp = 64'h6B636F6C635F7375;
      9'b101100010:
        casez_tmp = 64'h300000000000000;
      9'b101100011:
        casez_tmp = 64'h1B0000000C000000;
      9'b101100100:
        casez_tmp = 64'h6C632D6465786966;
      9'b101100101:
        casez_tmp = 64'h2000000006B636F;
      9'b101100110:
        casez_tmp = 64'h656C697401000000;
      9'b101100111:
        casez_tmp = 64'h732D74657365722D;
      9'b101101000:
        casez_tmp = 64'h3131407265747465;
      9'b101101001:
        casez_tmp = 64'h30303030;
      9'b101101010:
        casez_tmp = 64'h1000000003000000;
      9'b101101011:
        casez_tmp = 64'h1A010000;
      9'b101101100:
        casez_tmp = 64'h1100;
      9'b101101101:
        casez_tmp = 64'h300000000100000;
      9'b101101110:
        casez_tmp = 64'h9401000008000000;
      9'b101101111:
        casez_tmp = 64'h6C6F72746E6F63;
      9'b101110000:
        casez_tmp = 64'h200000002000000;
      9'b101110001:
        casez_tmp = 64'h900000002000000;
      9'b101110010:
        casez_tmp = 64'h7373657264646123;
      9'b101110011:
        casez_tmp = 64'h2300736C6C65632D;
      9'b101110100:
        casez_tmp = 64'h6C65632D657A6973;
      9'b101110101:
        casez_tmp = 64'h61706D6F6300736C;
      9'b101110110:
        casez_tmp = 64'h6F6D00656C626974;
      9'b101110111:
        casez_tmp = 64'h656D6974006C6564;
      9'b101111000:
        casez_tmp = 64'h6572662D65736162;
      9'b101111001:
        casez_tmp = 64'h630079636E657571;
      9'b101111010:
        casez_tmp = 64'h6572662D6B636F6C;
      9'b101111011:
        casez_tmp = 64'h640079636E657571;
      9'b101111100:
        casez_tmp = 64'h622D65686361632D;
      9'b101111101:
        casez_tmp = 64'h7A69732D6B636F6C;
      9'b101111110:
        casez_tmp = 64'h686361632D640065;
      9'b101111111:
        casez_tmp = 64'h6400737465732D65;
      9'b110000000:
        casez_tmp = 64'h732D65686361632D;
      9'b110000001:
        casez_tmp = 64'h6C742D6400657A69;
      9'b110000010:
        casez_tmp = 64'h6400737465732D62;
      9'b110000011:
        casez_tmp = 64'h7A69732D626C742D;
      9'b110000100:
        casez_tmp = 64'h6563697665640065;
      9'b110000101:
        casez_tmp = 64'h616800657079745F;
      9'b110000110:
        casez_tmp = 64'h652D657261776472;
      9'b110000111:
        casez_tmp = 64'h616572622D636578;
      9'b110001000:
        casez_tmp = 64'h632D746E696F706B;
      9'b110001001:
        casez_tmp = 64'h632D6900746E756F;
      9'b110001010:
        casez_tmp = 64'h6F6C622D65686361;
      9'b110001011:
        casez_tmp = 64'h657A69732D6B63;
      9'b110001100:
        casez_tmp = 64'h2D65686361632D69;
      9'b110001101:
        casez_tmp = 64'h632D690073746573;
      9'b110001110:
        casez_tmp = 64'h7A69732D65686361;
      9'b110001111:
        casez_tmp = 64'h2D626C742D690065;
      9'b110010000:
        casez_tmp = 64'h742D690073746573;
      9'b110010001:
        casez_tmp = 64'h657A69732D626C;
      9'b110010010:
        casez_tmp = 64'h657079742D756D6D;
      9'b110010011:
        casez_tmp = 64'h656C2D7478656E00;
      9'b110010100:
        casez_tmp = 64'h686361632D6C6576;
      9'b110010101:
        casez_tmp = 64'h6972006765720065;
      9'b110010110:
        casez_tmp = 64'h6173692C766373;
      9'b110010111:
        casez_tmp = 64'h6D702C7663736972;
      9'b110011000:
        casez_tmp = 64'h616C756E61726770;
      9'b110011001:
        casez_tmp = 64'h7369720079746972;
      9'b110011010:
        casez_tmp = 64'h6572706D702C7663;
      9'b110011011:
        casez_tmp = 64'h747300736E6F6967;
      9'b110011100:
        casez_tmp = 64'h626C740073757461;
      9'b110011101:
        casez_tmp = 64'h230074696C70732D;
      9'b110011110:
        casez_tmp = 64'h7075727265746E69;
      9'b110011111:
        casez_tmp = 64'h736C6C65632D74;
      9'b110100000:
        casez_tmp = 64'h7075727265746E69;
      9'b110100001:
        casez_tmp = 64'h6F72746E6F632D74;
      9'b110100010:
        casez_tmp = 64'h6168700072656C6C;
      9'b110100011:
        casez_tmp = 64'h6E617200656C646E;
      9'b110100100:
        casez_tmp = 64'h2D67657200736567;
      9'b110100101:
        casez_tmp = 64'h6E690073656D616E;
      9'b110100110:
        casez_tmp = 64'h7374707572726574;
      9'b110100111:
        casez_tmp = 64'h65646E657478652D;
      9'b110101000:
        casez_tmp = 64'h2D67756265640064;
      9'b110101001:
        casez_tmp = 64'h7200686361747461;
      9'b110101010:
        casez_tmp = 64'h78616D2C76637369;
      9'b110101011:
        casez_tmp = 64'h7469726F6972702D;
      9'b110101100:
        casez_tmp = 64'h2C76637369720079;
      9'b110101101:
        casez_tmp = 64'h6C6323007665646E;
      9'b110101110:
        casez_tmp = 64'h6C6C65632D6B636F;
      9'b110101111:
        casez_tmp = 64'h2D6B636F6C630073;
      9'b110110000:
        casez_tmp = 64'h6E2D74757074756F;
      9'b110110001:
        casez_tmp = 64'h73656D61;
      9'b110110010:
        casez_tmp = 64'h0;
      9'b110110011:
        casez_tmp = 64'h0;
      9'b110110100:
        casez_tmp = 64'h0;
      9'b110110101:
        casez_tmp = 64'h0;
      9'b110110110:
        casez_tmp = 64'h0;
      9'b110110111:
        casez_tmp = 64'h0;
      9'b110111000:
        casez_tmp = 64'h0;
      9'b110111001:
        casez_tmp = 64'h0;
      9'b110111010:
        casez_tmp = 64'h0;
      9'b110111011:
        casez_tmp = 64'h0;
      9'b110111100:
        casez_tmp = 64'h0;
      9'b110111101:
        casez_tmp = 64'h0;
      9'b110111110:
        casez_tmp = 64'h0;
      9'b110111111:
        casez_tmp = 64'h0;
      9'b111000000:
        casez_tmp = 64'h0;
      9'b111000001:
        casez_tmp = 64'h0;
      9'b111000010:
        casez_tmp = 64'h0;
      9'b111000011:
        casez_tmp = 64'h0;
      9'b111000100:
        casez_tmp = 64'h0;
      9'b111000101:
        casez_tmp = 64'h0;
      9'b111000110:
        casez_tmp = 64'h0;
      9'b111000111:
        casez_tmp = 64'h0;
      9'b111001000:
        casez_tmp = 64'h0;
      9'b111001001:
        casez_tmp = 64'h0;
      9'b111001010:
        casez_tmp = 64'h0;
      9'b111001011:
        casez_tmp = 64'h0;
      9'b111001100:
        casez_tmp = 64'h0;
      9'b111001101:
        casez_tmp = 64'h0;
      9'b111001110:
        casez_tmp = 64'h0;
      9'b111001111:
        casez_tmp = 64'h0;
      9'b111010000:
        casez_tmp = 64'h0;
      9'b111010001:
        casez_tmp = 64'h0;
      9'b111010010:
        casez_tmp = 64'h0;
      9'b111010011:
        casez_tmp = 64'h0;
      9'b111010100:
        casez_tmp = 64'h0;
      9'b111010101:
        casez_tmp = 64'h0;
      9'b111010110:
        casez_tmp = 64'h0;
      9'b111010111:
        casez_tmp = 64'h0;
      9'b111011000:
        casez_tmp = 64'h0;
      9'b111011001:
        casez_tmp = 64'h0;
      9'b111011010:
        casez_tmp = 64'h0;
      9'b111011011:
        casez_tmp = 64'h0;
      9'b111011100:
        casez_tmp = 64'h0;
      9'b111011101:
        casez_tmp = 64'h0;
      9'b111011110:
        casez_tmp = 64'h0;
      9'b111011111:
        casez_tmp = 64'h0;
      9'b111100000:
        casez_tmp = 64'h0;
      9'b111100001:
        casez_tmp = 64'h0;
      9'b111100010:
        casez_tmp = 64'h0;
      9'b111100011:
        casez_tmp = 64'h0;
      9'b111100100:
        casez_tmp = 64'h0;
      9'b111100101:
        casez_tmp = 64'h0;
      9'b111100110:
        casez_tmp = 64'h0;
      9'b111100111:
        casez_tmp = 64'h0;
      9'b111101000:
        casez_tmp = 64'h0;
      9'b111101001:
        casez_tmp = 64'h0;
      9'b111101010:
        casez_tmp = 64'h0;
      9'b111101011:
        casez_tmp = 64'h0;
      9'b111101100:
        casez_tmp = 64'h0;
      9'b111101101:
        casez_tmp = 64'h0;
      9'b111101110:
        casez_tmp = 64'h0;
      9'b111101111:
        casez_tmp = 64'h0;
      9'b111110000:
        casez_tmp = 64'h0;
      9'b111110001:
        casez_tmp = 64'h0;
      9'b111110010:
        casez_tmp = 64'h0;
      9'b111110011:
        casez_tmp = 64'h0;
      9'b111110100:
        casez_tmp = 64'h0;
      9'b111110101:
        casez_tmp = 64'h0;
      9'b111110110:
        casez_tmp = 64'h0;
      9'b111110111:
        casez_tmp = 64'h0;
      9'b111111000:
        casez_tmp = 64'h0;
      9'b111111001:
        casez_tmp = 64'h0;
      9'b111111010:
        casez_tmp = 64'h0;
      9'b111111011:
        casez_tmp = 64'h0;
      9'b111111100:
        casez_tmp = 64'h0;
      9'b111111101:
        casez_tmp = 64'h0;
      9'b111111110:
        casez_tmp = 64'h0;
      default:
        casez_tmp = 64'h0;
    endcase
  end // always @(*)
  TLMonitor_43 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_in_d_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (auto_in_a_valid),
    .io_in_d_bits_size    (auto_in_a_bits_size),
    .io_in_d_bits_source  (auto_in_a_bits_source)
  );
  assign auto_in_a_ready = auto_in_d_ready;
  assign auto_in_d_valid = auto_in_a_valid;
  assign auto_in_d_bits_size = auto_in_a_bits_size;
  assign auto_in_d_bits_source = auto_in_a_bits_source;
  assign auto_in_d_bits_data = (|(auto_in_a_bits_address[15:12])) ? 64'h0 : casez_tmp;
endmodule

