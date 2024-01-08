// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

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

module InclusiveCacheBankScheduler(
  input         clock,
                reset,
  output        io_in_a_ready,
  input         io_in_a_valid,
  input  [2:0]  io_in_a_bits_opcode,
                io_in_a_bits_param,
                io_in_a_bits_size,
  input  [5:0]  io_in_a_bits_source,
  input  [32:0] io_in_a_bits_address,
  input  [7:0]  io_in_a_bits_mask,
  input  [63:0] io_in_a_bits_data,
  input         io_in_a_bits_corrupt,
                io_in_b_ready,
  output        io_in_b_valid,
  output [1:0]  io_in_b_bits_param,
  output [32:0] io_in_b_bits_address,
  output        io_in_c_ready,
  input         io_in_c_valid,
  input  [2:0]  io_in_c_bits_opcode,
                io_in_c_bits_param,
                io_in_c_bits_size,
  input  [5:0]  io_in_c_bits_source,
  input  [32:0] io_in_c_bits_address,
  input  [63:0] io_in_c_bits_data,
  input         io_in_c_bits_corrupt,
                io_in_d_ready,
  output        io_in_d_valid,
  output [2:0]  io_in_d_bits_opcode,
  output [1:0]  io_in_d_bits_param,
  output [2:0]  io_in_d_bits_size,
  output [5:0]  io_in_d_bits_source,
  output [2:0]  io_in_d_bits_sink,
  output        io_in_d_bits_denied,
  output [63:0] io_in_d_bits_data,
  output        io_in_d_bits_corrupt,
  input         io_in_e_valid,
  input  [2:0]  io_in_e_bits_sink,
  input         io_out_a_ready,
  output        io_out_a_valid,
  output [2:0]  io_out_a_bits_opcode,
                io_out_a_bits_param,
                io_out_a_bits_size,
                io_out_a_bits_source,
  output [32:0] io_out_a_bits_address,
  output [7:0]  io_out_a_bits_mask,
  output [63:0] io_out_a_bits_data,
  output        io_out_a_bits_corrupt,
  input         io_out_c_ready,
  output        io_out_c_valid,
  output [2:0]  io_out_c_bits_opcode,
                io_out_c_bits_param,
                io_out_c_bits_size,
                io_out_c_bits_source,
  output [32:0] io_out_c_bits_address,
  output [63:0] io_out_c_bits_data,
  output        io_out_c_bits_corrupt,
                io_out_d_ready,
  input         io_out_d_valid,
  input  [2:0]  io_out_d_bits_opcode,
  input  [1:0]  io_out_d_bits_param,
  input  [2:0]  io_out_d_bits_size,
                io_out_d_bits_source,
                io_out_d_bits_sink,
  input         io_out_d_bits_denied,
  input  [63:0] io_out_d_bits_data,
  input         io_out_d_bits_corrupt,
  output        io_out_e_valid,
  output [2:0]  io_out_e_bits_sink,
  output        io_req_ready,
  input         io_req_valid,
  input  [32:0] io_req_bits_address,
  output        io_resp_valid
);

  wire [16:0] _GEN;
  wire [16:0] _GEN_0;
  wire [16:0] _GEN_1;
  wire [16:0] _GEN_2;
  wire [16:0] _GEN_3;
  wire [16:0] _GEN_4;
  wire [16:0] _GEN_5;
  wire        request_ready;
  wire        _mshrs_6_io_status_valid;
  wire [9:0]  _mshrs_6_io_status_bits_set;
  wire [16:0] _mshrs_6_io_status_bits_tag;
  wire [2:0]  _mshrs_6_io_status_bits_way;
  wire        _mshrs_6_io_status_bits_blockC;
  wire        _mshrs_6_io_status_bits_nestC;
  wire        _mshrs_6_io_schedule_valid;
  wire        _mshrs_6_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_6_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_6_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_6_io_schedule_bits_a_bits_param;
  wire        _mshrs_6_io_schedule_bits_a_bits_block;
  wire        _mshrs_6_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_6_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_6_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_6_io_schedule_bits_b_bits_set;
  wire        _mshrs_6_io_schedule_bits_b_bits_clients;
  wire        _mshrs_6_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_6_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_6_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_6_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_6_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_6_io_schedule_bits_c_bits_way;
  wire        _mshrs_6_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_6_io_schedule_bits_d_valid;
  wire        _mshrs_6_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_6_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_6_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_6_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_6_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_6_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_6_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_6_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_6_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_6_io_schedule_bits_d_bits_way;
  wire        _mshrs_6_io_schedule_bits_d_bits_bad;
  wire        _mshrs_6_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_6_io_schedule_bits_e_bits_sink;
  wire        _mshrs_6_io_schedule_bits_x_valid;
  wire        _mshrs_6_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_6_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_6_io_schedule_bits_dir_bits_way;
  wire        _mshrs_6_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_6_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_6_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_6_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_6_io_schedule_bits_reload;
  wire        _mshrs_5_io_status_valid;
  wire [9:0]  _mshrs_5_io_status_bits_set;
  wire [16:0] _mshrs_5_io_status_bits_tag;
  wire [2:0]  _mshrs_5_io_status_bits_way;
  wire        _mshrs_5_io_status_bits_blockC;
  wire        _mshrs_5_io_status_bits_nestC;
  wire        _mshrs_5_io_schedule_valid;
  wire        _mshrs_5_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_5_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_5_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_5_io_schedule_bits_a_bits_param;
  wire        _mshrs_5_io_schedule_bits_a_bits_block;
  wire        _mshrs_5_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_5_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_5_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_5_io_schedule_bits_b_bits_set;
  wire        _mshrs_5_io_schedule_bits_b_bits_clients;
  wire        _mshrs_5_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_5_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_5_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_5_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_5_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_5_io_schedule_bits_c_bits_way;
  wire        _mshrs_5_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_5_io_schedule_bits_d_valid;
  wire        _mshrs_5_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_5_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_5_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_5_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_5_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_5_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_5_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_5_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_5_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_5_io_schedule_bits_d_bits_way;
  wire        _mshrs_5_io_schedule_bits_d_bits_bad;
  wire        _mshrs_5_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_5_io_schedule_bits_e_bits_sink;
  wire        _mshrs_5_io_schedule_bits_x_valid;
  wire        _mshrs_5_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_5_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_5_io_schedule_bits_dir_bits_way;
  wire        _mshrs_5_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_5_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_5_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_5_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_5_io_schedule_bits_reload;
  wire        _mshrs_4_io_status_valid;
  wire [9:0]  _mshrs_4_io_status_bits_set;
  wire [16:0] _mshrs_4_io_status_bits_tag;
  wire [2:0]  _mshrs_4_io_status_bits_way;
  wire        _mshrs_4_io_status_bits_blockC;
  wire        _mshrs_4_io_status_bits_nestC;
  wire        _mshrs_4_io_schedule_valid;
  wire        _mshrs_4_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_4_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_4_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_4_io_schedule_bits_a_bits_param;
  wire        _mshrs_4_io_schedule_bits_a_bits_block;
  wire        _mshrs_4_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_4_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_4_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_4_io_schedule_bits_b_bits_set;
  wire        _mshrs_4_io_schedule_bits_b_bits_clients;
  wire        _mshrs_4_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_4_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_4_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_4_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_4_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_4_io_schedule_bits_c_bits_way;
  wire        _mshrs_4_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_4_io_schedule_bits_d_valid;
  wire        _mshrs_4_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_4_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_4_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_4_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_4_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_4_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_4_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_4_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_4_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_4_io_schedule_bits_d_bits_way;
  wire        _mshrs_4_io_schedule_bits_d_bits_bad;
  wire        _mshrs_4_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_4_io_schedule_bits_e_bits_sink;
  wire        _mshrs_4_io_schedule_bits_x_valid;
  wire        _mshrs_4_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_4_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_4_io_schedule_bits_dir_bits_way;
  wire        _mshrs_4_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_4_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_4_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_4_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_4_io_schedule_bits_reload;
  wire        _mshrs_3_io_status_valid;
  wire [9:0]  _mshrs_3_io_status_bits_set;
  wire [16:0] _mshrs_3_io_status_bits_tag;
  wire [2:0]  _mshrs_3_io_status_bits_way;
  wire        _mshrs_3_io_status_bits_blockC;
  wire        _mshrs_3_io_status_bits_nestC;
  wire        _mshrs_3_io_schedule_valid;
  wire        _mshrs_3_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_3_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_3_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_3_io_schedule_bits_a_bits_param;
  wire        _mshrs_3_io_schedule_bits_a_bits_block;
  wire        _mshrs_3_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_3_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_3_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_3_io_schedule_bits_b_bits_set;
  wire        _mshrs_3_io_schedule_bits_b_bits_clients;
  wire        _mshrs_3_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_3_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_3_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_3_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_3_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_3_io_schedule_bits_c_bits_way;
  wire        _mshrs_3_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_3_io_schedule_bits_d_valid;
  wire        _mshrs_3_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_3_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_3_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_3_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_3_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_3_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_3_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_3_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_3_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_3_io_schedule_bits_d_bits_way;
  wire        _mshrs_3_io_schedule_bits_d_bits_bad;
  wire        _mshrs_3_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_3_io_schedule_bits_e_bits_sink;
  wire        _mshrs_3_io_schedule_bits_x_valid;
  wire        _mshrs_3_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_3_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_3_io_schedule_bits_dir_bits_way;
  wire        _mshrs_3_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_3_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_3_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_3_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_3_io_schedule_bits_reload;
  wire        _mshrs_2_io_status_valid;
  wire [9:0]  _mshrs_2_io_status_bits_set;
  wire [16:0] _mshrs_2_io_status_bits_tag;
  wire [2:0]  _mshrs_2_io_status_bits_way;
  wire        _mshrs_2_io_status_bits_blockC;
  wire        _mshrs_2_io_status_bits_nestC;
  wire        _mshrs_2_io_schedule_valid;
  wire        _mshrs_2_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_2_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_2_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_2_io_schedule_bits_a_bits_param;
  wire        _mshrs_2_io_schedule_bits_a_bits_block;
  wire        _mshrs_2_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_2_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_2_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_2_io_schedule_bits_b_bits_set;
  wire        _mshrs_2_io_schedule_bits_b_bits_clients;
  wire        _mshrs_2_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_2_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_2_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_2_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_2_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_2_io_schedule_bits_c_bits_way;
  wire        _mshrs_2_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_2_io_schedule_bits_d_valid;
  wire        _mshrs_2_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_2_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_2_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_2_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_2_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_2_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_2_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_2_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_2_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_2_io_schedule_bits_d_bits_way;
  wire        _mshrs_2_io_schedule_bits_d_bits_bad;
  wire        _mshrs_2_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_2_io_schedule_bits_e_bits_sink;
  wire        _mshrs_2_io_schedule_bits_x_valid;
  wire        _mshrs_2_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_2_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_2_io_schedule_bits_dir_bits_way;
  wire        _mshrs_2_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_2_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_2_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_2_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_2_io_schedule_bits_reload;
  wire        _mshrs_1_io_status_valid;
  wire [9:0]  _mshrs_1_io_status_bits_set;
  wire [16:0] _mshrs_1_io_status_bits_tag;
  wire [2:0]  _mshrs_1_io_status_bits_way;
  wire        _mshrs_1_io_status_bits_blockC;
  wire        _mshrs_1_io_status_bits_nestC;
  wire        _mshrs_1_io_schedule_valid;
  wire        _mshrs_1_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_1_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_1_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_1_io_schedule_bits_a_bits_param;
  wire        _mshrs_1_io_schedule_bits_a_bits_block;
  wire        _mshrs_1_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_1_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_1_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_1_io_schedule_bits_b_bits_set;
  wire        _mshrs_1_io_schedule_bits_b_bits_clients;
  wire        _mshrs_1_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_1_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_1_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_1_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_1_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_1_io_schedule_bits_c_bits_way;
  wire        _mshrs_1_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_1_io_schedule_bits_d_valid;
  wire        _mshrs_1_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_1_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_1_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_1_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_1_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_1_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_1_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_1_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_1_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_1_io_schedule_bits_d_bits_way;
  wire        _mshrs_1_io_schedule_bits_d_bits_bad;
  wire        _mshrs_1_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_1_io_schedule_bits_e_bits_sink;
  wire        _mshrs_1_io_schedule_bits_x_valid;
  wire        _mshrs_1_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_1_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_1_io_schedule_bits_dir_bits_way;
  wire        _mshrs_1_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_1_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_1_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_1_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_1_io_schedule_bits_reload;
  wire        _mshrs_0_io_status_valid;
  wire [9:0]  _mshrs_0_io_status_bits_set;
  wire [16:0] _mshrs_0_io_status_bits_tag;
  wire [2:0]  _mshrs_0_io_status_bits_way;
  wire        _mshrs_0_io_status_bits_blockC;
  wire        _mshrs_0_io_status_bits_nestC;
  wire        _mshrs_0_io_schedule_valid;
  wire        _mshrs_0_io_schedule_bits_a_valid;
  wire [16:0] _mshrs_0_io_schedule_bits_a_bits_tag;
  wire [9:0]  _mshrs_0_io_schedule_bits_a_bits_set;
  wire [2:0]  _mshrs_0_io_schedule_bits_a_bits_param;
  wire        _mshrs_0_io_schedule_bits_a_bits_block;
  wire        _mshrs_0_io_schedule_bits_b_valid;
  wire [2:0]  _mshrs_0_io_schedule_bits_b_bits_param;
  wire [16:0] _mshrs_0_io_schedule_bits_b_bits_tag;
  wire [9:0]  _mshrs_0_io_schedule_bits_b_bits_set;
  wire        _mshrs_0_io_schedule_bits_b_bits_clients;
  wire        _mshrs_0_io_schedule_bits_c_valid;
  wire [2:0]  _mshrs_0_io_schedule_bits_c_bits_opcode;
  wire [2:0]  _mshrs_0_io_schedule_bits_c_bits_param;
  wire [16:0] _mshrs_0_io_schedule_bits_c_bits_tag;
  wire [9:0]  _mshrs_0_io_schedule_bits_c_bits_set;
  wire [2:0]  _mshrs_0_io_schedule_bits_c_bits_way;
  wire        _mshrs_0_io_schedule_bits_c_bits_dirty;
  wire        _mshrs_0_io_schedule_bits_d_valid;
  wire        _mshrs_0_io_schedule_bits_d_bits_prio_0;
  wire        _mshrs_0_io_schedule_bits_d_bits_prio_2;
  wire [2:0]  _mshrs_0_io_schedule_bits_d_bits_opcode;
  wire [2:0]  _mshrs_0_io_schedule_bits_d_bits_param;
  wire [2:0]  _mshrs_0_io_schedule_bits_d_bits_size;
  wire [5:0]  _mshrs_0_io_schedule_bits_d_bits_source;
  wire [5:0]  _mshrs_0_io_schedule_bits_d_bits_offset;
  wire [5:0]  _mshrs_0_io_schedule_bits_d_bits_put;
  wire [9:0]  _mshrs_0_io_schedule_bits_d_bits_set;
  wire [2:0]  _mshrs_0_io_schedule_bits_d_bits_way;
  wire        _mshrs_0_io_schedule_bits_d_bits_bad;
  wire        _mshrs_0_io_schedule_bits_e_valid;
  wire [2:0]  _mshrs_0_io_schedule_bits_e_bits_sink;
  wire        _mshrs_0_io_schedule_bits_x_valid;
  wire        _mshrs_0_io_schedule_bits_dir_valid;
  wire [9:0]  _mshrs_0_io_schedule_bits_dir_bits_set;
  wire [2:0]  _mshrs_0_io_schedule_bits_dir_bits_way;
  wire        _mshrs_0_io_schedule_bits_dir_bits_data_dirty;
  wire [1:0]  _mshrs_0_io_schedule_bits_dir_bits_data_state;
  wire        _mshrs_0_io_schedule_bits_dir_bits_data_clients;
  wire [16:0] _mshrs_0_io_schedule_bits_dir_bits_data_tag;
  wire        _mshrs_0_io_schedule_bits_reload;
  wire        _requests_io_push_ready;
  wire [20:0] _requests_io_valid;
  wire        _requests_io_data_prio_0;
  wire        _requests_io_data_prio_1;
  wire        _requests_io_data_prio_2;
  wire        _requests_io_data_control;
  wire [2:0]  _requests_io_data_opcode;
  wire [2:0]  _requests_io_data_param;
  wire [2:0]  _requests_io_data_size;
  wire [5:0]  _requests_io_data_source;
  wire [16:0] _requests_io_data_tag;
  wire [5:0]  _requests_io_data_offset;
  wire [5:0]  _requests_io_data_put;
  wire        _bankedStore_io_sinkC_adr_ready;
  wire        _bankedStore_io_sinkD_adr_ready;
  wire        _bankedStore_io_sourceC_adr_ready;
  wire [63:0] _bankedStore_io_sourceC_dat_data;
  wire        _bankedStore_io_sourceD_radr_ready;
  wire [63:0] _bankedStore_io_sourceD_rdat_data;
  wire        _bankedStore_io_sourceD_wadr_ready;
  wire        _directory_io_write_ready;
  wire        _directory_io_result_bits_dirty;
  wire [1:0]  _directory_io_result_bits_state;
  wire        _directory_io_result_bits_clients;
  wire [16:0] _directory_io_result_bits_tag;
  wire        _directory_io_result_bits_hit;
  wire [2:0]  _directory_io_result_bits_way;
  wire        _directory_io_ready;
  wire        _sinkX_io_req_valid;
  wire [16:0] _sinkX_io_req_bits_tag;
  wire [9:0]  _sinkX_io_req_bits_set;
  wire        _sinkE_io_resp_valid;
  wire [2:0]  _sinkE_io_resp_bits_sink;
  wire        _sinkD_io_resp_valid;
  wire        _sinkD_io_resp_bits_last;
  wire [2:0]  _sinkD_io_resp_bits_opcode;
  wire [2:0]  _sinkD_io_resp_bits_param;
  wire [2:0]  _sinkD_io_resp_bits_source;
  wire [2:0]  _sinkD_io_resp_bits_sink;
  wire        _sinkD_io_resp_bits_denied;
  wire [2:0]  _sinkD_io_source;
  wire        _sinkD_io_bs_adr_valid;
  wire        _sinkD_io_bs_adr_bits_noop;
  wire [2:0]  _sinkD_io_bs_adr_bits_way;
  wire [9:0]  _sinkD_io_bs_adr_bits_set;
  wire [2:0]  _sinkD_io_bs_adr_bits_beat;
  wire [63:0] _sinkD_io_bs_dat_data;
  wire [9:0]  _sinkD_io_grant_req_set;
  wire [2:0]  _sinkD_io_grant_req_way;
  wire        _sinkC_io_req_valid;
  wire [2:0]  _sinkC_io_req_bits_opcode;
  wire [2:0]  _sinkC_io_req_bits_param;
  wire [2:0]  _sinkC_io_req_bits_size;
  wire [5:0]  _sinkC_io_req_bits_source;
  wire [16:0] _sinkC_io_req_bits_tag;
  wire [5:0]  _sinkC_io_req_bits_offset;
  wire [5:0]  _sinkC_io_req_bits_put;
  wire [9:0]  _sinkC_io_req_bits_set;
  wire        _sinkC_io_resp_valid;
  wire        _sinkC_io_resp_bits_last;
  wire [9:0]  _sinkC_io_resp_bits_set;
  wire [16:0] _sinkC_io_resp_bits_tag;
  wire [5:0]  _sinkC_io_resp_bits_source;
  wire [2:0]  _sinkC_io_resp_bits_param;
  wire        _sinkC_io_resp_bits_data;
  wire [9:0]  _sinkC_io_set;
  wire        _sinkC_io_bs_adr_valid;
  wire        _sinkC_io_bs_adr_bits_noop;
  wire [2:0]  _sinkC_io_bs_adr_bits_way;
  wire [9:0]  _sinkC_io_bs_adr_bits_set;
  wire [2:0]  _sinkC_io_bs_adr_bits_beat;
  wire        _sinkC_io_bs_adr_bits_mask;
  wire [63:0] _sinkC_io_bs_dat_data;
  wire        _sinkC_io_rel_pop_ready;
  wire [63:0] _sinkC_io_rel_beat_data;
  wire        _sinkC_io_rel_beat_corrupt;
  wire        _sinkA_io_req_valid;
  wire [2:0]  _sinkA_io_req_bits_opcode;
  wire [2:0]  _sinkA_io_req_bits_param;
  wire [2:0]  _sinkA_io_req_bits_size;
  wire [5:0]  _sinkA_io_req_bits_source;
  wire [16:0] _sinkA_io_req_bits_tag;
  wire [5:0]  _sinkA_io_req_bits_offset;
  wire [5:0]  _sinkA_io_req_bits_put;
  wire [9:0]  _sinkA_io_req_bits_set;
  wire        _sinkA_io_pb_pop_ready;
  wire [63:0] _sinkA_io_pb_beat_data;
  wire [7:0]  _sinkA_io_pb_beat_mask;
  wire        _sinkA_io_pb_beat_corrupt;
  wire        _sourceX_io_req_ready;
  wire        _sourceE_io_req_ready;
  wire        _sourceD_io_req_ready;
  wire        _sourceD_io_pb_pop_valid;
  wire [5:0]  _sourceD_io_pb_pop_bits_index;
  wire        _sourceD_io_pb_pop_bits_last;
  wire        _sourceD_io_rel_pop_valid;
  wire [5:0]  _sourceD_io_rel_pop_bits_index;
  wire        _sourceD_io_rel_pop_bits_last;
  wire        _sourceD_io_bs_radr_valid;
  wire [2:0]  _sourceD_io_bs_radr_bits_way;
  wire [9:0]  _sourceD_io_bs_radr_bits_set;
  wire [2:0]  _sourceD_io_bs_radr_bits_beat;
  wire        _sourceD_io_bs_radr_bits_mask;
  wire        _sourceD_io_bs_wadr_valid;
  wire [2:0]  _sourceD_io_bs_wadr_bits_way;
  wire [9:0]  _sourceD_io_bs_wadr_bits_set;
  wire [2:0]  _sourceD_io_bs_wadr_bits_beat;
  wire        _sourceD_io_bs_wadr_bits_mask;
  wire [63:0] _sourceD_io_bs_wdat_data;
  wire        _sourceD_io_evict_safe;
  wire        _sourceD_io_grant_safe;
  wire        _sourceC_io_req_ready;
  wire        _sourceC_io_bs_adr_valid;
  wire [2:0]  _sourceC_io_bs_adr_bits_way;
  wire [9:0]  _sourceC_io_bs_adr_bits_set;
  wire [2:0]  _sourceC_io_bs_adr_bits_beat;
  wire [9:0]  _sourceC_io_evict_req_set;
  wire [2:0]  _sourceC_io_evict_req_way;
  wire        _sourceB_io_req_ready;
  wire        _sourceA_io_req_ready;
  wire        _mshr_request_T_22 = _mshrs_0_io_schedule_valid & ~(_mshrs_5_io_status_valid & _mshrs_0_io_status_bits_set == _mshrs_5_io_status_bits_set | _mshrs_6_io_status_valid & _mshrs_0_io_status_bits_set == _mshrs_6_io_status_bits_set) & (_sourceA_io_req_ready | ~_mshrs_0_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_0_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_0_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_0_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_0_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_0_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_0_io_schedule_bits_dir_valid);
  wire        _mshr_request_T_45 = _mshrs_1_io_schedule_valid & ~(_mshrs_5_io_status_valid & _mshrs_1_io_status_bits_set == _mshrs_5_io_status_bits_set | _mshrs_6_io_status_valid & _mshrs_1_io_status_bits_set == _mshrs_6_io_status_bits_set) & (_sourceA_io_req_ready | ~_mshrs_1_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_1_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_1_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_1_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_1_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_1_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_1_io_schedule_bits_dir_valid);
  wire        _mshr_request_T_68 = _mshrs_2_io_schedule_valid & ~(_mshrs_5_io_status_valid & _mshrs_2_io_status_bits_set == _mshrs_5_io_status_bits_set | _mshrs_6_io_status_valid & _mshrs_2_io_status_bits_set == _mshrs_6_io_status_bits_set) & (_sourceA_io_req_ready | ~_mshrs_2_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_2_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_2_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_2_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_2_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_2_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_2_io_schedule_bits_dir_valid);
  wire        _mshr_request_T_91 = _mshrs_3_io_schedule_valid & ~(_mshrs_5_io_status_valid & _mshrs_3_io_status_bits_set == _mshrs_5_io_status_bits_set | _mshrs_6_io_status_valid & _mshrs_3_io_status_bits_set == _mshrs_6_io_status_bits_set) & (_sourceA_io_req_ready | ~_mshrs_3_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_3_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_3_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_3_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_3_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_3_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_3_io_schedule_bits_dir_valid);
  wire        _mshr_request_T_114 = _mshrs_4_io_schedule_valid & ~(_mshrs_5_io_status_valid & _mshrs_4_io_status_bits_set == _mshrs_5_io_status_bits_set | _mshrs_6_io_status_valid & _mshrs_4_io_status_bits_set == _mshrs_6_io_status_bits_set) & (_sourceA_io_req_ready | ~_mshrs_4_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_4_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_4_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_4_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_4_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_4_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_4_io_schedule_bits_dir_valid);
  wire        _mshr_request_T_137 = _mshrs_5_io_schedule_valid & ~(_mshrs_6_io_status_valid & _mshrs_5_io_status_bits_set == _mshrs_6_io_status_bits_set) & (_sourceA_io_req_ready | ~_mshrs_5_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_5_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_5_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_5_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_5_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_5_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_5_io_schedule_bits_dir_valid);
  wire        _mshr_request_T_160 = _mshrs_6_io_schedule_valid & (_sourceA_io_req_ready | ~_mshrs_6_io_schedule_bits_a_valid) & (_sourceB_io_req_ready | ~_mshrs_6_io_schedule_bits_b_valid) & (_sourceC_io_req_ready | ~_mshrs_6_io_schedule_bits_c_valid) & (_sourceD_io_req_ready | ~_mshrs_6_io_schedule_bits_d_valid) & (_sourceE_io_req_ready | ~_mshrs_6_io_schedule_bits_e_valid) & (_sourceX_io_req_ready | ~_mshrs_6_io_schedule_bits_x_valid) & (_directory_io_write_ready | ~_mshrs_6_io_schedule_bits_dir_valid);
  wire [6:0]  mshr_request = {_mshr_request_T_160, _mshr_request_T_137, _mshr_request_T_114, _mshr_request_T_91, _mshr_request_T_68, _mshr_request_T_45, _mshr_request_T_22};
  reg  [6:0]  robin_filter;
  wire [6:0]  _robin_request_T = mshr_request & robin_filter;
  wire        _GEN_6 = _mshr_request_T_91 | _mshr_request_T_68;
  wire        _GEN_7 = _mshr_request_T_68 | _mshr_request_T_45;
  wire        _GEN_8 = _mshr_request_T_45 | _mshr_request_T_22;
  wire        _GEN_9 = _mshr_request_T_22 | _robin_request_T[6];
  wire [5:0]  _GEN_10 = _robin_request_T[6:1] | _robin_request_T[5:0];
  wire        _GEN_11 = _GEN_8 | _GEN_10[5];
  wire        _GEN_12 = _GEN_9 | _GEN_10[4];
  wire [3:0]  _GEN_13 = _GEN_10[5:2] | _GEN_10[3:0];
  wire        _GEN_14 = _GEN_10[1] | _robin_request_T[0];
  wire        _GEN_15 = _GEN_13[1] | _robin_request_T[0];
  wire [13:0] _GEN_16 = {~(_mshr_request_T_137 | _mshr_request_T_114 | _GEN_6 | _GEN_11 | _GEN_15), ~(_mshr_request_T_114 | _mshr_request_T_91 | _GEN_7 | _GEN_12 | _GEN_13[0]), ~(_GEN_6 | _GEN_8 | _GEN_13[3] | _GEN_14), ~(_GEN_7 | _GEN_9 | _GEN_13[2] | _GEN_10[0]), ~(_GEN_11 | _GEN_13[1] | _robin_request_T[0]), ~(_GEN_12 | _GEN_13[0]), ~(_GEN_13[3] | _GEN_14), ~(_GEN_13[2] | _GEN_10[0]), ~_GEN_15, ~(_GEN_13[0]), ~_GEN_14, ~(_GEN_10[0]), ~(_robin_request_T[0]), 1'h1} & {_mshr_request_T_160, _mshr_request_T_137, _mshr_request_T_114, _mshr_request_T_91, _mshr_request_T_68, _mshr_request_T_45, _mshr_request_T_22, _robin_request_T};
  wire [6:0]  mshr_selectOH = _GEN_16[13:7] | _GEN_16[6:0];
  wire [2:0]  _mshr_select_T_1 = {1'h0, mshr_selectOH[6:5]} | mshr_selectOH[3:1];
  wire [2:0]  schedule_d_bits_sink = {|(mshr_selectOH[6:4]), |(_mshr_select_T_1[2:1]), _mshr_select_T_1[2] | _mshr_select_T_1[0]};
  wire        _schedule_WIRE = mshr_selectOH[0] & _mshrs_0_io_schedule_bits_reload | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_reload | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_reload | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_reload | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_reload | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_reload | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_reload;
  wire [2:0]  _schedule_WIRE_46 = (mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_c_bits_opcode : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_c_bits_opcode : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_c_bits_opcode : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_c_bits_opcode : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_c_bits_opcode : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_c_bits_opcode : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_c_bits_opcode : 3'h0);
  wire [16:0] scheduleTag = (mshr_selectOH[0] ? _mshrs_0_io_status_bits_tag : 17'h0) | (mshr_selectOH[1] ? _mshrs_1_io_status_bits_tag : 17'h0) | (mshr_selectOH[2] ? _mshrs_2_io_status_bits_tag : 17'h0) | (mshr_selectOH[3] ? _mshrs_3_io_status_bits_tag : 17'h0) | (mshr_selectOH[4] ? _mshrs_4_io_status_bits_tag : 17'h0) | (mshr_selectOH[5] ? _mshrs_5_io_status_bits_tag : 17'h0) | (mshr_selectOH[6] ? _mshrs_6_io_status_bits_tag : 17'h0);
  wire [9:0]  nestedwb_set = mshr_selectOH[6] ? _mshrs_6_io_status_bits_set : _mshrs_5_io_status_bits_set;
  wire [16:0] nestedwb_tag = mshr_selectOH[6] ? _mshrs_6_io_status_bits_tag : _mshrs_5_io_status_bits_tag;
  wire        nestedwb_b_clr_dirty = mshr_selectOH[5] & _mshrs_5_io_schedule_bits_dir_valid;
  wire        nestedwb_b_toN = nestedwb_b_clr_dirty & _mshrs_5_io_schedule_bits_dir_bits_data_state == 2'h0;
  wire        nestedwb_b_toB = nestedwb_b_clr_dirty & _mshrs_5_io_schedule_bits_dir_bits_data_state == 2'h1;
  wire        nestedwb_c_set_dirty = mshr_selectOH[6] & _mshrs_6_io_schedule_bits_dir_valid & _mshrs_6_io_schedule_bits_dir_bits_data_dirty;
  wire        request_valid = _directory_io_ready & (_sinkA_io_req_valid | _sinkX_io_req_valid | _sinkC_io_req_valid);
  wire        _view__WIRE_6_control = ~_sinkC_io_req_valid & _sinkX_io_req_valid;
  wire [2:0]  _view__WIRE_6_opcode = _sinkC_io_req_valid ? _sinkC_io_req_bits_opcode : _sinkX_io_req_valid ? 3'h0 : _sinkA_io_req_bits_opcode;
  wire [2:0]  _view__WIRE_6_param = _sinkC_io_req_valid ? _sinkC_io_req_bits_param : _sinkX_io_req_valid ? 3'h0 : _sinkA_io_req_bits_param;
  wire [2:0]  _view__WIRE_6_size = _sinkC_io_req_valid ? _sinkC_io_req_bits_size : _sinkX_io_req_valid ? 3'h6 : _sinkA_io_req_bits_size;
  wire [5:0]  _view__WIRE_6_source = _sinkC_io_req_valid ? _sinkC_io_req_bits_source : _sinkX_io_req_valid ? 6'h0 : _sinkA_io_req_bits_source;
  wire [16:0] _view__WIRE_6_tag = _sinkC_io_req_valid ? _sinkC_io_req_bits_tag : _sinkX_io_req_valid ? _sinkX_io_req_bits_tag : _sinkA_io_req_bits_tag;
  wire [5:0]  _view__WIRE_6_offset = _sinkC_io_req_valid ? _sinkC_io_req_bits_offset : _sinkX_io_req_valid ? 6'h0 : _sinkA_io_req_bits_offset;
  wire [5:0]  _view__WIRE_6_put = _sinkC_io_req_valid ? _sinkC_io_req_bits_put : _sinkX_io_req_valid ? 6'h0 : _sinkA_io_req_bits_put;
  wire [9:0]  request_bits_set = _sinkC_io_req_valid ? _sinkC_io_req_bits_set : _sinkX_io_req_valid ? _sinkX_io_req_bits_set : _sinkA_io_req_bits_set;
  wire        _sinkA_io_req_ready_T = _directory_io_ready & request_ready;
  wire        _setMatches_T_1 = _mshrs_0_io_status_valid & _mshrs_0_io_status_bits_set == request_bits_set;
  wire        _setMatches_T_3 = _mshrs_1_io_status_valid & _mshrs_1_io_status_bits_set == request_bits_set;
  wire        _setMatches_T_5 = _mshrs_2_io_status_valid & _mshrs_2_io_status_bits_set == request_bits_set;
  wire        _setMatches_T_7 = _mshrs_3_io_status_valid & _mshrs_3_io_status_bits_set == request_bits_set;
  wire        _setMatches_T_9 = _mshrs_4_io_status_valid & _mshrs_4_io_status_bits_set == request_bits_set;
  wire        _setMatches_T_11 = _mshrs_5_io_status_valid & _mshrs_5_io_status_bits_set == request_bits_set;
  wire        _setMatches_T_13 = _mshrs_6_io_status_valid & _mshrs_6_io_status_bits_set == request_bits_set;
  wire [6:0]  setMatches = {_setMatches_T_13, _setMatches_T_11, _setMatches_T_9, _setMatches_T_7, _setMatches_T_5, _setMatches_T_3, _setMatches_T_1};
  wire        alloc = setMatches == 7'h0;
  wire        nestC = (_setMatches_T_1 & _mshrs_0_io_status_bits_nestC | _setMatches_T_3 & _mshrs_1_io_status_bits_nestC | _setMatches_T_5 & _mshrs_2_io_status_bits_nestC | _setMatches_T_7 & _mshrs_3_io_status_bits_nestC | _setMatches_T_9 & _mshrs_4_io_status_bits_nestC | _setMatches_T_11 & _mshrs_5_io_status_bits_nestC | _setMatches_T_13 & _mshrs_6_io_status_bits_nestC) & _sinkC_io_req_valid;
  wire [6:0]  prioFilter = {{2{_sinkC_io_req_valid}}, 5'h1F};
  wire [6:0]  lowerMatches = setMatches & prioFilter;
  wire        queue = (|lowerMatches) & ~nestC & ~((_setMatches_T_1 & _mshrs_0_io_status_bits_blockC | _setMatches_T_3 & _mshrs_1_io_status_bits_blockC | _setMatches_T_5 & _mshrs_2_io_status_bits_blockC | _setMatches_T_7 & _mshrs_3_io_status_bits_blockC | _setMatches_T_9 & _mshrs_4_io_status_bits_blockC | _setMatches_T_11 & _mshrs_5_io_status_bits_blockC | _setMatches_T_13 & _mshrs_6_io_status_bits_blockC) & _sinkC_io_req_valid);
  wire        _requests_io_push_valid_T = request_valid & queue;
  wire [6:0]  lowerMatches1 = _setMatches_T_13 & _sinkC_io_req_valid ? 7'h40 : _setMatches_T_11 & _sinkC_io_req_valid ? 7'h20 : lowerMatches;
  wire [6:0]  _a_pop_T = mshr_selectOH & _requests_io_valid[6:0];
  wire [6:0]  _b_pop_T = mshr_selectOH & _requests_io_valid[13:7];
  wire [6:0]  _c_pop_T = mshr_selectOH & _requests_io_valid[20:14];
  wire        bypassMatches = (|(mshr_selectOH & lowerMatches1)) & ((|_c_pop_T) | _sinkC_io_req_valid ? ~(|_c_pop_T) : (|_b_pop_T) ? ~(|_b_pop_T) : ~(|_a_pop_T));
  wire        may_pop = (|_a_pop_T) | (|_b_pop_T) | (|_c_pop_T);
  wire        bypass = _requests_io_push_valid_T & bypassMatches;
  wire        _mshr_uses_directory_assuming_no_bypass_T = _schedule_WIRE & may_pop;
  wire        will_pop = _mshr_uses_directory_assuming_no_bypass_T & ~bypass;
  wire        bypass_1 = _requests_io_push_valid_T & lowerMatches1[0] & (_requests_io_valid[14] | _sinkC_io_req_valid ? ~(_requests_io_valid[14]) : _requests_io_valid[7] ? ~(_requests_io_valid[7]) : ~(_requests_io_valid[0]));
  wire        bypass_2 = _requests_io_push_valid_T & lowerMatches1[1] & (_requests_io_valid[15] | _sinkC_io_req_valid ? ~(_requests_io_valid[15]) : _requests_io_valid[8] ? ~(_requests_io_valid[8]) : ~(_requests_io_valid[1]));
  wire        bypass_3 = _requests_io_push_valid_T & lowerMatches1[2] & (_requests_io_valid[16] | _sinkC_io_req_valid ? ~(_requests_io_valid[16]) : _requests_io_valid[9] ? ~(_requests_io_valid[9]) : ~(_requests_io_valid[2]));
  wire        bypass_4 = _requests_io_push_valid_T & lowerMatches1[3] & (_requests_io_valid[17] | _sinkC_io_req_valid ? ~(_requests_io_valid[17]) : _requests_io_valid[10] ? ~(_requests_io_valid[10]) : ~(_requests_io_valid[3]));
  wire        bypass_5 = _requests_io_push_valid_T & lowerMatches1[4] & (_requests_io_valid[18] | _sinkC_io_req_valid ? ~(_requests_io_valid[18]) : _requests_io_valid[11] ? ~(_requests_io_valid[11]) : ~(_requests_io_valid[4]));
  wire        bypass_6 = _requests_io_push_valid_T & lowerMatches1[5] & (_requests_io_valid[19] | _sinkC_io_req_valid ? ~(_requests_io_valid[19]) : _requests_io_valid[12] ? ~(_requests_io_valid[12]) : ~(_requests_io_valid[5]));
  wire        bypass_7 = _requests_io_push_valid_T & lowerMatches1[6] & (_requests_io_valid[20] | _sinkC_io_req_valid ? ~(_requests_io_valid[20]) : _requests_io_valid[13] ? ~(_requests_io_valid[13]) : ~(_requests_io_valid[6]));
  wire [19:0] _prio_requests_T = ~(_requests_io_valid[20:1]);
  wire [12:0] _GEN_17 = _prio_requests_T[12:0] | _requests_io_valid[20:8];
  wire [19:0] prio_requests = ~{_prio_requests_T[19:13], _GEN_17[12:6], _GEN_17[5:0] | _requests_io_valid[20:15]};
  wire [20:0] _pop_index_T = {3{mshr_selectOH}};
  wire [4:0]  pop_index_hi_1 = mshr_selectOH[6:2] & prio_requests[19:15];
  wire [14:0] _pop_index_T_3 = {11'h0, pop_index_hi_1[4:1]} | _pop_index_T[15:1] & prio_requests[14:0];
  wire [6:0]  _pop_index_T_5 = _pop_index_T_3[14:8] | _pop_index_T_3[6:0];
  wire [2:0]  _pop_index_T_7 = _pop_index_T_5[6:4] | _pop_index_T_5[2:0];
  wire        lb_tag_mismatch = scheduleTag != _requests_io_data_tag;
  wire        mshr_uses_directory_assuming_no_bypass = _mshr_uses_directory_assuming_no_bypass_T & lb_tag_mismatch;
  wire        mshr_uses_directory_for_lb = will_pop & lb_tag_mismatch;
  wire        mshr_uses_directory = _schedule_WIRE & (may_pop | bypass) & scheduleTag != (bypass ? _view__WIRE_6_tag : _requests_io_data_tag);
  wire [6:0]  _mshr_insertOH_T_13 = ~{_mshrs_6_io_status_valid, _mshrs_5_io_status_valid, _mshrs_4_io_status_valid, _mshrs_3_io_status_valid, _mshrs_2_io_status_valid, _mshrs_1_io_status_valid, _mshrs_0_io_status_valid};
  wire        bypassQueue = _schedule_WIRE & bypassMatches;
  wire        request_alloc_cases = alloc & ~mshr_uses_directory_assuming_no_bypass & (|(_mshr_insertOH_T_13 & prioFilter)) | nestC & ~mshr_uses_directory_assuming_no_bypass & ~_mshrs_6_io_status_valid;
  assign request_ready = request_alloc_cases | queue & (bypassQueue | _requests_io_push_ready);
  wire        alloc_uses_directory = request_valid & request_alloc_cases;
  wire [2:0]  _requests_io_push_bits_index_T_2 = {1'h0, lowerMatches1[6:5]} | lowerMatches1[3:1];
  wire [2:0]  _requests_io_push_bits_index_T_25 = {lowerMatches1[1:0], 1'h0} | lowerMatches1[5:3];
  wire [5:0]  _mshr_insertOH_T_3 = _mshr_insertOH_T_13[5:0] | {_mshr_insertOH_T_13[4:0], 1'h0};
  wire [5:0]  _mshr_insertOH_T_6 = _mshr_insertOH_T_3 | {_mshr_insertOH_T_3[3:0], 2'h0};
  wire [6:0]  _GEN_18 = {~(_mshr_insertOH_T_6 | {_mshr_insertOH_T_6[1:0], 4'h0}), 1'h1} & _mshr_insertOH_T_13 & prioFilter;
  wire        _GEN_19 = request_valid & alloc;
  wire        _GEN_20 = _GEN_19 & _GEN_18[0] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_21 = _GEN_20 | bypass_1;
  assign _GEN_5 = _GEN_21 ? _view__WIRE_6_tag : _requests_io_data_tag;
  wire        _GEN_22 = _GEN_19 & _GEN_18[1] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_23 = _GEN_22 | bypass_2;
  assign _GEN_4 = _GEN_23 ? _view__WIRE_6_tag : _requests_io_data_tag;
  wire        _GEN_24 = _GEN_19 & _GEN_18[2] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_25 = _GEN_24 | bypass_3;
  assign _GEN_3 = _GEN_25 ? _view__WIRE_6_tag : _requests_io_data_tag;
  wire        _GEN_26 = _GEN_19 & _GEN_18[3] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_27 = _GEN_26 | bypass_4;
  assign _GEN_2 = _GEN_27 ? _view__WIRE_6_tag : _requests_io_data_tag;
  wire        _GEN_28 = _GEN_19 & _GEN_18[4] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_29 = _GEN_28 | bypass_5;
  assign _GEN_1 = _GEN_29 ? _view__WIRE_6_tag : _requests_io_data_tag;
  wire        _GEN_30 = _GEN_19 & _GEN_18[5] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_31 = _GEN_30 | bypass_6;
  assign _GEN_0 = _GEN_31 ? _view__WIRE_6_tag : _requests_io_data_tag;
  wire        _GEN_32 = request_valid & nestC & ~_mshrs_6_io_status_valid & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_33 = _GEN_32 | _GEN_19 & _GEN_18[6] & ~mshr_uses_directory_assuming_no_bypass;
  wire        _GEN_34 = _GEN_33 | bypass_7;
  assign _GEN = _GEN_34 ? _view__WIRE_6_tag : _requests_io_data_tag;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (_GEN_32 & ~reset & ~_sinkC_io_req_valid) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Scheduler.scala:299 assert (!request.bits.prio(0))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg  [7:0]  directoryFanout;
  reg  [2:0]  casez_tmp;
  always @(*) begin
    casez (_sinkD_io_source)
      3'b000:
        casez_tmp = _mshrs_0_io_status_bits_way;
      3'b001:
        casez_tmp = _mshrs_1_io_status_bits_way;
      3'b010:
        casez_tmp = _mshrs_2_io_status_bits_way;
      3'b011:
        casez_tmp = _mshrs_3_io_status_bits_way;
      3'b100:
        casez_tmp = _mshrs_4_io_status_bits_way;
      3'b101:
        casez_tmp = _mshrs_5_io_status_bits_way;
      3'b110:
        casez_tmp = _mshrs_6_io_status_bits_way;
      default:
        casez_tmp = _mshrs_0_io_status_bits_way;
    endcase
  end // always @(*)
  reg  [9:0]  casez_tmp_0;
  always @(*) begin
    casez (_sinkD_io_source)
      3'b000:
        casez_tmp_0 = _mshrs_0_io_status_bits_set;
      3'b001:
        casez_tmp_0 = _mshrs_1_io_status_bits_set;
      3'b010:
        casez_tmp_0 = _mshrs_2_io_status_bits_set;
      3'b011:
        casez_tmp_0 = _mshrs_3_io_status_bits_set;
      3'b100:
        casez_tmp_0 = _mshrs_4_io_status_bits_set;
      3'b101:
        casez_tmp_0 = _mshrs_5_io_status_bits_set;
      3'b110:
        casez_tmp_0 = _mshrs_6_io_status_bits_set;
      default:
        casez_tmp_0 = _mshrs_0_io_status_bits_set;
    endcase
  end // always @(*)
  wire [5:0]  _GEN_35 = mshr_selectOH[5:0] | mshr_selectOH[6:1];
  wire [4:0]  _GEN_36 = _GEN_35[4:0] | {mshr_selectOH[6], _GEN_35[5:2]};
  always @(posedge clock) begin
    if (reset)
      robin_filter <= 7'h0;
    else if (|mshr_request)
      robin_filter <= ~{mshr_selectOH[6], _GEN_35[5], _GEN_36[4:3], _GEN_36[2:0] | {mshr_selectOH[6], _GEN_35[5], _GEN_36[4]}};
    directoryFanout <= mshr_uses_directory ? {1'h0, mshr_selectOH} : alloc_uses_directory ? (alloc ? {1'h0, _GEN_18} : 8'h40) : 8'h0;
  end // always @(posedge)
  SourceA sourceA (
    .clock              (clock),
    .reset              (reset),
    .io_req_ready       (_sourceA_io_req_ready),
    .io_req_valid       (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_a_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_a_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_a_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_a_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_a_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_a_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_a_valid),
    .io_req_bits_tag    ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_a_bits_tag : 17'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_a_bits_tag : 17'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_a_bits_tag : 17'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_a_bits_tag : 17'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_a_bits_tag : 17'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_a_bits_tag : 17'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_a_bits_tag : 17'h0)),
    .io_req_bits_set    ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_a_bits_set : 10'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_a_bits_set : 10'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_a_bits_set : 10'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_a_bits_set : 10'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_a_bits_set : 10'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_a_bits_set : 10'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_a_bits_set : 10'h0)),
    .io_req_bits_param  ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_a_bits_param : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_a_bits_param : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_a_bits_param : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_a_bits_param : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_a_bits_param : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_a_bits_param : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_a_bits_param : 3'h0)),
    .io_req_bits_source (schedule_d_bits_sink),
    .io_req_bits_block  (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_a_bits_block | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_a_bits_block | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_a_bits_block | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_a_bits_block | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_a_bits_block | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_a_bits_block | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_a_bits_block),
    .io_a_ready         (io_out_a_ready),
    .io_a_valid         (io_out_a_valid),
    .io_a_bits_opcode   (io_out_a_bits_opcode),
    .io_a_bits_param    (io_out_a_bits_param),
    .io_a_bits_size     (io_out_a_bits_size),
    .io_a_bits_source   (io_out_a_bits_source),
    .io_a_bits_address  (io_out_a_bits_address),
    .io_a_bits_mask     (io_out_a_bits_mask),
    .io_a_bits_data     (io_out_a_bits_data),
    .io_a_bits_corrupt  (io_out_a_bits_corrupt)
  );
  SourceB sourceB (
    .clock               (clock),
    .reset               (reset),
    .io_req_ready        (_sourceB_io_req_ready),
    .io_req_valid        (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_b_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_b_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_b_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_b_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_b_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_b_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_b_valid),
    .io_req_bits_param   ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_b_bits_param : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_b_bits_param : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_b_bits_param : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_b_bits_param : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_b_bits_param : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_b_bits_param : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_b_bits_param : 3'h0)),
    .io_req_bits_tag     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_b_bits_tag : 17'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_b_bits_tag : 17'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_b_bits_tag : 17'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_b_bits_tag : 17'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_b_bits_tag : 17'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_b_bits_tag : 17'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_b_bits_tag : 17'h0)),
    .io_req_bits_set     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_b_bits_set : 10'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_b_bits_set : 10'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_b_bits_set : 10'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_b_bits_set : 10'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_b_bits_set : 10'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_b_bits_set : 10'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_b_bits_set : 10'h0)),
    .io_req_bits_clients (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_b_bits_clients | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_b_bits_clients | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_b_bits_clients | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_b_bits_clients | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_b_bits_clients | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_b_bits_clients | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_b_bits_clients),
    .io_b_ready          (io_in_b_ready),
    .io_b_valid          (io_in_b_valid),
    .io_b_bits_param     (io_in_b_bits_param),
    .io_b_bits_address   (io_in_b_bits_address)
  );
  SourceC sourceC (
    .clock               (clock),
    .reset               (reset),
    .io_req_ready        (_sourceC_io_req_ready),
    .io_req_valid        (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_c_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_c_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_c_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_c_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_c_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_c_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_c_valid),
    .io_req_bits_opcode  (_schedule_WIRE_46),
    .io_req_bits_param   ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_c_bits_param : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_c_bits_param : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_c_bits_param : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_c_bits_param : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_c_bits_param : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_c_bits_param : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_c_bits_param : 3'h0)),
    .io_req_bits_source  (_schedule_WIRE_46[1] ? schedule_d_bits_sink : 3'h0),
    .io_req_bits_tag     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_c_bits_tag : 17'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_c_bits_tag : 17'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_c_bits_tag : 17'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_c_bits_tag : 17'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_c_bits_tag : 17'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_c_bits_tag : 17'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_c_bits_tag : 17'h0)),
    .io_req_bits_set     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_c_bits_set : 10'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_c_bits_set : 10'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_c_bits_set : 10'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_c_bits_set : 10'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_c_bits_set : 10'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_c_bits_set : 10'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_c_bits_set : 10'h0)),
    .io_req_bits_way     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_c_bits_way : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_c_bits_way : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_c_bits_way : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_c_bits_way : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_c_bits_way : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_c_bits_way : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_c_bits_way : 3'h0)),
    .io_req_bits_dirty   (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_c_bits_dirty | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_c_bits_dirty | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_c_bits_dirty | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_c_bits_dirty | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_c_bits_dirty | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_c_bits_dirty | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_c_bits_dirty),
    .io_c_ready          (io_out_c_ready),
    .io_c_valid          (io_out_c_valid),
    .io_c_bits_opcode    (io_out_c_bits_opcode),
    .io_c_bits_param     (io_out_c_bits_param),
    .io_c_bits_size      (io_out_c_bits_size),
    .io_c_bits_source    (io_out_c_bits_source),
    .io_c_bits_address   (io_out_c_bits_address),
    .io_c_bits_data      (io_out_c_bits_data),
    .io_c_bits_corrupt   (io_out_c_bits_corrupt),
    .io_bs_adr_ready     (_bankedStore_io_sourceC_adr_ready),
    .io_bs_adr_valid     (_sourceC_io_bs_adr_valid),
    .io_bs_adr_bits_way  (_sourceC_io_bs_adr_bits_way),
    .io_bs_adr_bits_set  (_sourceC_io_bs_adr_bits_set),
    .io_bs_adr_bits_beat (_sourceC_io_bs_adr_bits_beat),
    .io_bs_dat_data      (_bankedStore_io_sourceC_dat_data),
    .io_evict_req_set    (_sourceC_io_evict_req_set),
    .io_evict_req_way    (_sourceC_io_evict_req_way),
    .io_evict_safe       (_sourceD_io_evict_safe)
  );
  SourceD sourceD (
    .clock                 (clock),
    .reset                 (reset),
    .io_req_ready          (_sourceD_io_req_ready),
    .io_req_valid          (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_d_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_d_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_d_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_d_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_d_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_d_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_d_valid),
    .io_req_bits_prio_0    (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_d_bits_prio_0 | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_d_bits_prio_0 | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_d_bits_prio_0 | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_d_bits_prio_0 | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_d_bits_prio_0 | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_d_bits_prio_0 | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_d_bits_prio_0),
    .io_req_bits_prio_2    (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_d_bits_prio_2 | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_d_bits_prio_2 | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_d_bits_prio_2 | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_d_bits_prio_2 | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_d_bits_prio_2 | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_d_bits_prio_2 | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_d_bits_prio_2),
    .io_req_bits_opcode    ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_opcode : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_opcode : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_opcode : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_opcode : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_opcode : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_opcode : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_opcode : 3'h0)),
    .io_req_bits_param     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_param : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_param : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_param : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_param : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_param : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_param : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_param : 3'h0)),
    .io_req_bits_size      ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_size : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_size : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_size : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_size : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_size : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_size : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_size : 3'h0)),
    .io_req_bits_source    ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_source : 6'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_source : 6'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_source : 6'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_source : 6'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_source : 6'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_source : 6'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_source : 6'h0)),
    .io_req_bits_offset    ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_offset : 6'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_offset : 6'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_offset : 6'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_offset : 6'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_offset : 6'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_offset : 6'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_offset : 6'h0)),
    .io_req_bits_put       ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_put : 6'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_put : 6'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_put : 6'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_put : 6'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_put : 6'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_put : 6'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_put : 6'h0)),
    .io_req_bits_set       ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_set : 10'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_set : 10'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_set : 10'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_set : 10'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_set : 10'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_set : 10'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_set : 10'h0)),
    .io_req_bits_sink      (schedule_d_bits_sink),
    .io_req_bits_way       ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_d_bits_way : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_d_bits_way : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_d_bits_way : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_d_bits_way : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_d_bits_way : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_d_bits_way : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_d_bits_way : 3'h0)),
    .io_req_bits_bad       (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_d_bits_bad | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_d_bits_bad | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_d_bits_bad | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_d_bits_bad | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_d_bits_bad | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_d_bits_bad | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_d_bits_bad),
    .io_d_ready            (io_in_d_ready),
    .io_d_valid            (io_in_d_valid),
    .io_d_bits_opcode      (io_in_d_bits_opcode),
    .io_d_bits_param       (io_in_d_bits_param),
    .io_d_bits_size        (io_in_d_bits_size),
    .io_d_bits_source      (io_in_d_bits_source),
    .io_d_bits_sink        (io_in_d_bits_sink),
    .io_d_bits_denied      (io_in_d_bits_denied),
    .io_d_bits_data        (io_in_d_bits_data),
    .io_d_bits_corrupt     (io_in_d_bits_corrupt),
    .io_pb_pop_ready       (_sinkA_io_pb_pop_ready),
    .io_pb_pop_valid       (_sourceD_io_pb_pop_valid),
    .io_pb_pop_bits_index  (_sourceD_io_pb_pop_bits_index),
    .io_pb_pop_bits_last   (_sourceD_io_pb_pop_bits_last),
    .io_pb_beat_data       (_sinkA_io_pb_beat_data),
    .io_pb_beat_mask       (_sinkA_io_pb_beat_mask),
    .io_pb_beat_corrupt    (_sinkA_io_pb_beat_corrupt),
    .io_rel_pop_ready      (_sinkC_io_rel_pop_ready),
    .io_rel_pop_valid      (_sourceD_io_rel_pop_valid),
    .io_rel_pop_bits_index (_sourceD_io_rel_pop_bits_index),
    .io_rel_pop_bits_last  (_sourceD_io_rel_pop_bits_last),
    .io_rel_beat_data      (_sinkC_io_rel_beat_data),
    .io_rel_beat_corrupt   (_sinkC_io_rel_beat_corrupt),
    .io_bs_radr_ready      (_bankedStore_io_sourceD_radr_ready),
    .io_bs_radr_valid      (_sourceD_io_bs_radr_valid),
    .io_bs_radr_bits_way   (_sourceD_io_bs_radr_bits_way),
    .io_bs_radr_bits_set   (_sourceD_io_bs_radr_bits_set),
    .io_bs_radr_bits_beat  (_sourceD_io_bs_radr_bits_beat),
    .io_bs_radr_bits_mask  (_sourceD_io_bs_radr_bits_mask),
    .io_bs_rdat_data       (_bankedStore_io_sourceD_rdat_data),
    .io_bs_wadr_ready      (_bankedStore_io_sourceD_wadr_ready),
    .io_bs_wadr_valid      (_sourceD_io_bs_wadr_valid),
    .io_bs_wadr_bits_way   (_sourceD_io_bs_wadr_bits_way),
    .io_bs_wadr_bits_set   (_sourceD_io_bs_wadr_bits_set),
    .io_bs_wadr_bits_beat  (_sourceD_io_bs_wadr_bits_beat),
    .io_bs_wadr_bits_mask  (_sourceD_io_bs_wadr_bits_mask),
    .io_bs_wdat_data       (_sourceD_io_bs_wdat_data),
    .io_evict_req_set      (_sourceC_io_evict_req_set),
    .io_evict_req_way      (_sourceC_io_evict_req_way),
    .io_evict_safe         (_sourceD_io_evict_safe),
    .io_grant_req_set      (_sinkD_io_grant_req_set),
    .io_grant_req_way      (_sinkD_io_grant_req_way),
    .io_grant_safe         (_sourceD_io_grant_safe)
  );
  SourceE sourceE (
    .clock            (clock),
    .reset            (reset),
    .io_req_ready     (_sourceE_io_req_ready),
    .io_req_valid     (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_e_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_e_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_e_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_e_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_e_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_e_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_e_valid),
    .io_req_bits_sink ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_e_bits_sink : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_e_bits_sink : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_e_bits_sink : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_e_bits_sink : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_e_bits_sink : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_e_bits_sink : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_e_bits_sink : 3'h0)),
    .io_e_valid       (io_out_e_valid),
    .io_e_bits_sink   (io_out_e_bits_sink)
  );
  SourceX sourceX (
    .clock        (clock),
    .reset        (reset),
    .io_req_ready (_sourceX_io_req_ready),
    .io_req_valid (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_x_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_x_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_x_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_x_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_x_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_x_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_x_valid),
    .io_x_valid   (io_resp_valid)
  );
  SinkA sinkA (
    .clock                (clock),
    .reset                (reset),
    .io_req_ready         (_sinkA_io_req_ready_T & ~_sinkC_io_req_valid & ~_sinkX_io_req_valid),
    .io_req_valid         (_sinkA_io_req_valid),
    .io_req_bits_opcode   (_sinkA_io_req_bits_opcode),
    .io_req_bits_param    (_sinkA_io_req_bits_param),
    .io_req_bits_size     (_sinkA_io_req_bits_size),
    .io_req_bits_source   (_sinkA_io_req_bits_source),
    .io_req_bits_tag      (_sinkA_io_req_bits_tag),
    .io_req_bits_offset   (_sinkA_io_req_bits_offset),
    .io_req_bits_put      (_sinkA_io_req_bits_put),
    .io_req_bits_set      (_sinkA_io_req_bits_set),
    .io_a_ready           (io_in_a_ready),
    .io_a_valid           (io_in_a_valid),
    .io_a_bits_opcode     (io_in_a_bits_opcode),
    .io_a_bits_param      (io_in_a_bits_param),
    .io_a_bits_size       (io_in_a_bits_size),
    .io_a_bits_source     (io_in_a_bits_source),
    .io_a_bits_address    (io_in_a_bits_address),
    .io_a_bits_mask       (io_in_a_bits_mask),
    .io_a_bits_data       (io_in_a_bits_data),
    .io_a_bits_corrupt    (io_in_a_bits_corrupt),
    .io_pb_pop_ready      (_sinkA_io_pb_pop_ready),
    .io_pb_pop_valid      (_sourceD_io_pb_pop_valid),
    .io_pb_pop_bits_index (_sourceD_io_pb_pop_bits_index),
    .io_pb_pop_bits_last  (_sourceD_io_pb_pop_bits_last),
    .io_pb_beat_data      (_sinkA_io_pb_beat_data),
    .io_pb_beat_mask      (_sinkA_io_pb_beat_mask),
    .io_pb_beat_corrupt   (_sinkA_io_pb_beat_corrupt)
  );
  SinkC sinkC (
    .clock                 (clock),
    .reset                 (reset),
    .io_req_ready          (_sinkA_io_req_ready_T),
    .io_req_valid          (_sinkC_io_req_valid),
    .io_req_bits_opcode    (_sinkC_io_req_bits_opcode),
    .io_req_bits_param     (_sinkC_io_req_bits_param),
    .io_req_bits_size      (_sinkC_io_req_bits_size),
    .io_req_bits_source    (_sinkC_io_req_bits_source),
    .io_req_bits_tag       (_sinkC_io_req_bits_tag),
    .io_req_bits_offset    (_sinkC_io_req_bits_offset),
    .io_req_bits_put       (_sinkC_io_req_bits_put),
    .io_req_bits_set       (_sinkC_io_req_bits_set),
    .io_resp_valid         (_sinkC_io_resp_valid),
    .io_resp_bits_last     (_sinkC_io_resp_bits_last),
    .io_resp_bits_set      (_sinkC_io_resp_bits_set),
    .io_resp_bits_tag      (_sinkC_io_resp_bits_tag),
    .io_resp_bits_source   (_sinkC_io_resp_bits_source),
    .io_resp_bits_param    (_sinkC_io_resp_bits_param),
    .io_resp_bits_data     (_sinkC_io_resp_bits_data),
    .io_c_ready            (io_in_c_ready),
    .io_c_valid            (io_in_c_valid),
    .io_c_bits_opcode      (io_in_c_bits_opcode),
    .io_c_bits_param       (io_in_c_bits_param),
    .io_c_bits_size        (io_in_c_bits_size),
    .io_c_bits_source      (io_in_c_bits_source),
    .io_c_bits_address     (io_in_c_bits_address),
    .io_c_bits_data        (io_in_c_bits_data),
    .io_c_bits_corrupt     (io_in_c_bits_corrupt),
    .io_set                (_sinkC_io_set),
    .io_way                (_mshrs_5_io_status_valid & _mshrs_5_io_status_bits_set == _sinkC_io_set ? _mshrs_5_io_status_bits_way : (_mshrs_0_io_status_valid & _mshrs_0_io_status_bits_set == _sinkC_io_set ? _mshrs_0_io_status_bits_way : 3'h0) | (_mshrs_1_io_status_valid & _mshrs_1_io_status_bits_set == _sinkC_io_set ? _mshrs_1_io_status_bits_way : 3'h0) | (_mshrs_2_io_status_valid & _mshrs_2_io_status_bits_set == _sinkC_io_set ? _mshrs_2_io_status_bits_way : 3'h0) | (_mshrs_3_io_status_valid & _mshrs_3_io_status_bits_set == _sinkC_io_set ? _mshrs_3_io_status_bits_way : 3'h0) | (_mshrs_4_io_status_valid & _mshrs_4_io_status_bits_set == _sinkC_io_set ? _mshrs_4_io_status_bits_way : 3'h0)),
    .io_bs_adr_ready       (_bankedStore_io_sinkC_adr_ready),
    .io_bs_adr_valid       (_sinkC_io_bs_adr_valid),
    .io_bs_adr_bits_noop   (_sinkC_io_bs_adr_bits_noop),
    .io_bs_adr_bits_way    (_sinkC_io_bs_adr_bits_way),
    .io_bs_adr_bits_set    (_sinkC_io_bs_adr_bits_set),
    .io_bs_adr_bits_beat   (_sinkC_io_bs_adr_bits_beat),
    .io_bs_adr_bits_mask   (_sinkC_io_bs_adr_bits_mask),
    .io_bs_dat_data        (_sinkC_io_bs_dat_data),
    .io_rel_pop_ready      (_sinkC_io_rel_pop_ready),
    .io_rel_pop_valid      (_sourceD_io_rel_pop_valid),
    .io_rel_pop_bits_index (_sourceD_io_rel_pop_bits_index),
    .io_rel_pop_bits_last  (_sourceD_io_rel_pop_bits_last),
    .io_rel_beat_data      (_sinkC_io_rel_beat_data),
    .io_rel_beat_corrupt   (_sinkC_io_rel_beat_corrupt)
  );
  SinkD sinkD (
    .clock               (clock),
    .reset               (reset),
    .io_resp_valid       (_sinkD_io_resp_valid),
    .io_resp_bits_last   (_sinkD_io_resp_bits_last),
    .io_resp_bits_opcode (_sinkD_io_resp_bits_opcode),
    .io_resp_bits_param  (_sinkD_io_resp_bits_param),
    .io_resp_bits_source (_sinkD_io_resp_bits_source),
    .io_resp_bits_sink   (_sinkD_io_resp_bits_sink),
    .io_resp_bits_denied (_sinkD_io_resp_bits_denied),
    .io_d_ready          (io_out_d_ready),
    .io_d_valid          (io_out_d_valid),
    .io_d_bits_opcode    (io_out_d_bits_opcode),
    .io_d_bits_param     (io_out_d_bits_param),
    .io_d_bits_size      (io_out_d_bits_size),
    .io_d_bits_source    (io_out_d_bits_source),
    .io_d_bits_sink      (io_out_d_bits_sink),
    .io_d_bits_denied    (io_out_d_bits_denied),
    .io_d_bits_data      (io_out_d_bits_data),
    .io_d_bits_corrupt   (io_out_d_bits_corrupt),
    .io_source           (_sinkD_io_source),
    .io_way              (casez_tmp),
    .io_set              (casez_tmp_0),
    .io_bs_adr_ready     (_bankedStore_io_sinkD_adr_ready),
    .io_bs_adr_valid     (_sinkD_io_bs_adr_valid),
    .io_bs_adr_bits_noop (_sinkD_io_bs_adr_bits_noop),
    .io_bs_adr_bits_way  (_sinkD_io_bs_adr_bits_way),
    .io_bs_adr_bits_set  (_sinkD_io_bs_adr_bits_set),
    .io_bs_adr_bits_beat (_sinkD_io_bs_adr_bits_beat),
    .io_bs_dat_data      (_sinkD_io_bs_dat_data),
    .io_grant_req_set    (_sinkD_io_grant_req_set),
    .io_grant_req_way    (_sinkD_io_grant_req_way),
    .io_grant_safe       (_sourceD_io_grant_safe)
  );
  SinkE sinkE (
    .io_resp_valid     (_sinkE_io_resp_valid),
    .io_resp_bits_sink (_sinkE_io_resp_bits_sink),
    .io_e_valid        (io_in_e_valid),
    .io_e_bits_sink    (io_in_e_bits_sink)
  );
  SinkX sinkX (
    .clock             (clock),
    .reset             (reset),
    .io_req_ready      (_sinkA_io_req_ready_T & ~_sinkC_io_req_valid),
    .io_req_valid      (_sinkX_io_req_valid),
    .io_req_bits_tag   (_sinkX_io_req_bits_tag),
    .io_req_bits_set   (_sinkX_io_req_bits_set),
    .io_x_ready        (io_req_ready),
    .io_x_valid        (io_req_valid),
    .io_x_bits_address (io_req_bits_address)
  );
  Directory directory (
    .clock                      (clock),
    .reset                      (reset),
    .io_write_ready             (_directory_io_write_ready),
    .io_write_valid             (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_dir_valid | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_dir_valid | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_dir_valid | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_dir_valid | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_dir_valid | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_dir_valid | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_dir_valid),
    .io_write_bits_set          ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_dir_bits_set : 10'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_dir_bits_set : 10'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_dir_bits_set : 10'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_dir_bits_set : 10'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_dir_bits_set : 10'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_dir_bits_set : 10'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_dir_bits_set : 10'h0)),
    .io_write_bits_way          ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_dir_bits_way : 3'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_dir_bits_way : 3'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_dir_bits_way : 3'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_dir_bits_way : 3'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_dir_bits_way : 3'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_dir_bits_way : 3'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_dir_bits_way : 3'h0)),
    .io_write_bits_data_dirty   (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_dir_bits_data_dirty | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_dir_bits_data_dirty | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_dir_bits_data_dirty | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_dir_bits_data_dirty | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_dir_bits_data_dirty | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_dir_bits_data_dirty | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_dir_bits_data_dirty),
    .io_write_bits_data_state   ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_dir_bits_data_state : 2'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_dir_bits_data_state : 2'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_dir_bits_data_state : 2'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_dir_bits_data_state : 2'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_dir_bits_data_state : 2'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_dir_bits_data_state : 2'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_dir_bits_data_state : 2'h0)),
    .io_write_bits_data_clients (mshr_selectOH[0] & _mshrs_0_io_schedule_bits_dir_bits_data_clients | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_dir_bits_data_clients | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_dir_bits_data_clients | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_dir_bits_data_clients | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_dir_bits_data_clients | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_dir_bits_data_clients | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_dir_bits_data_clients),
    .io_write_bits_data_tag     ((mshr_selectOH[0] ? _mshrs_0_io_schedule_bits_dir_bits_data_tag : 17'h0) | (mshr_selectOH[1] ? _mshrs_1_io_schedule_bits_dir_bits_data_tag : 17'h0) | (mshr_selectOH[2] ? _mshrs_2_io_schedule_bits_dir_bits_data_tag : 17'h0) | (mshr_selectOH[3] ? _mshrs_3_io_schedule_bits_dir_bits_data_tag : 17'h0) | (mshr_selectOH[4] ? _mshrs_4_io_schedule_bits_dir_bits_data_tag : 17'h0) | (mshr_selectOH[5] ? _mshrs_5_io_schedule_bits_dir_bits_data_tag : 17'h0) | (mshr_selectOH[6] ? _mshrs_6_io_schedule_bits_dir_bits_data_tag : 17'h0)),
    .io_read_valid              (mshr_uses_directory | alloc_uses_directory),
    .io_read_bits_set           (mshr_uses_directory_for_lb ? (mshr_selectOH[0] ? _mshrs_0_io_status_bits_set : 10'h0) | (mshr_selectOH[1] ? _mshrs_1_io_status_bits_set : 10'h0) | (mshr_selectOH[2] ? _mshrs_2_io_status_bits_set : 10'h0) | (mshr_selectOH[3] ? _mshrs_3_io_status_bits_set : 10'h0) | (mshr_selectOH[4] ? _mshrs_4_io_status_bits_set : 10'h0) | (mshr_selectOH[5] ? _mshrs_5_io_status_bits_set : 10'h0) | (mshr_selectOH[6] ? _mshrs_6_io_status_bits_set : 10'h0) : request_bits_set),
    .io_read_bits_tag           (mshr_uses_directory_for_lb ? _requests_io_data_tag : _view__WIRE_6_tag),
    .io_result_bits_dirty       (_directory_io_result_bits_dirty),
    .io_result_bits_state       (_directory_io_result_bits_state),
    .io_result_bits_clients     (_directory_io_result_bits_clients),
    .io_result_bits_tag         (_directory_io_result_bits_tag),
    .io_result_bits_hit         (_directory_io_result_bits_hit),
    .io_result_bits_way         (_directory_io_result_bits_way),
    .io_ready                   (_directory_io_ready)
  );
  BankedStore bankedStore (
    .clock                     (clock),
    .io_sinkC_adr_ready        (_bankedStore_io_sinkC_adr_ready),
    .io_sinkC_adr_valid        (_sinkC_io_bs_adr_valid),
    .io_sinkC_adr_bits_noop    (_sinkC_io_bs_adr_bits_noop),
    .io_sinkC_adr_bits_way     (_sinkC_io_bs_adr_bits_way),
    .io_sinkC_adr_bits_set     (_sinkC_io_bs_adr_bits_set),
    .io_sinkC_adr_bits_beat    (_sinkC_io_bs_adr_bits_beat),
    .io_sinkC_adr_bits_mask    (_sinkC_io_bs_adr_bits_mask),
    .io_sinkC_dat_data         (_sinkC_io_bs_dat_data),
    .io_sinkD_adr_ready        (_bankedStore_io_sinkD_adr_ready),
    .io_sinkD_adr_valid        (_sinkD_io_bs_adr_valid),
    .io_sinkD_adr_bits_noop    (_sinkD_io_bs_adr_bits_noop),
    .io_sinkD_adr_bits_way     (_sinkD_io_bs_adr_bits_way),
    .io_sinkD_adr_bits_set     (_sinkD_io_bs_adr_bits_set),
    .io_sinkD_adr_bits_beat    (_sinkD_io_bs_adr_bits_beat),
    .io_sinkD_dat_data         (_sinkD_io_bs_dat_data),
    .io_sourceC_adr_ready      (_bankedStore_io_sourceC_adr_ready),
    .io_sourceC_adr_valid      (_sourceC_io_bs_adr_valid),
    .io_sourceC_adr_bits_way   (_sourceC_io_bs_adr_bits_way),
    .io_sourceC_adr_bits_set   (_sourceC_io_bs_adr_bits_set),
    .io_sourceC_adr_bits_beat  (_sourceC_io_bs_adr_bits_beat),
    .io_sourceC_dat_data       (_bankedStore_io_sourceC_dat_data),
    .io_sourceD_radr_ready     (_bankedStore_io_sourceD_radr_ready),
    .io_sourceD_radr_valid     (_sourceD_io_bs_radr_valid),
    .io_sourceD_radr_bits_way  (_sourceD_io_bs_radr_bits_way),
    .io_sourceD_radr_bits_set  (_sourceD_io_bs_radr_bits_set),
    .io_sourceD_radr_bits_beat (_sourceD_io_bs_radr_bits_beat),
    .io_sourceD_radr_bits_mask (_sourceD_io_bs_radr_bits_mask),
    .io_sourceD_rdat_data      (_bankedStore_io_sourceD_rdat_data),
    .io_sourceD_wadr_ready     (_bankedStore_io_sourceD_wadr_ready),
    .io_sourceD_wadr_valid     (_sourceD_io_bs_wadr_valid),
    .io_sourceD_wadr_bits_way  (_sourceD_io_bs_wadr_bits_way),
    .io_sourceD_wadr_bits_set  (_sourceD_io_bs_wadr_bits_set),
    .io_sourceD_wadr_bits_beat (_sourceD_io_bs_wadr_bits_beat),
    .io_sourceD_wadr_bits_mask (_sourceD_io_bs_wadr_bits_mask),
    .io_sourceD_wdat_data      (_sourceD_io_bs_wdat_data)
  );
  ListBuffer_2 requests (
    .clock                     (clock),
    .reset                     (reset),
    .io_push_ready             (_requests_io_push_ready),
    .io_push_valid             (_requests_io_push_valid_T & ~bypassQueue),
    .io_push_bits_index        ({2'h0, _sinkC_io_req_valid ? 3'h0 : {|(lowerMatches1[6:4]), |(_requests_io_push_bits_index_T_2[2:1]), _requests_io_push_bits_index_T_2[2] | _requests_io_push_bits_index_T_2[0]}} | (_sinkC_io_req_valid ? {|(lowerMatches1[6:2]), |(lowerMatches1[1:0]), |{lowerMatches1[1:0], lowerMatches1[6]}, |(_requests_io_push_bits_index_T_25[2:1]), _requests_io_push_bits_index_T_25[2] | _requests_io_push_bits_index_T_25[0]} : 5'h0)),
    .io_push_bits_data_prio_0  (~_sinkC_io_req_valid),
    .io_push_bits_data_prio_2  (_sinkC_io_req_valid),
    .io_push_bits_data_control (_view__WIRE_6_control),
    .io_push_bits_data_opcode  (_view__WIRE_6_opcode),
    .io_push_bits_data_param   (_view__WIRE_6_param),
    .io_push_bits_data_size    (_view__WIRE_6_size),
    .io_push_bits_data_source  (_view__WIRE_6_source),
    .io_push_bits_data_tag     (_view__WIRE_6_tag),
    .io_push_bits_data_offset  (_view__WIRE_6_offset),
    .io_push_bits_data_put     (_view__WIRE_6_put),
    .io_valid                  (_requests_io_valid),
    .io_pop_valid              (will_pop),
    .io_pop_bits               ({|pop_index_hi_1, |(_pop_index_T_3[14:7]), |(_pop_index_T_5[6:3]), |(_pop_index_T_7[2:1]), _pop_index_T_7[2] | _pop_index_T_7[0]}),
    .io_data_prio_0            (_requests_io_data_prio_0),
    .io_data_prio_1            (_requests_io_data_prio_1),
    .io_data_prio_2            (_requests_io_data_prio_2),
    .io_data_control           (_requests_io_data_control),
    .io_data_opcode            (_requests_io_data_opcode),
    .io_data_param             (_requests_io_data_param),
    .io_data_size              (_requests_io_data_size),
    .io_data_source            (_requests_io_data_source),
    .io_data_tag               (_requests_io_data_tag),
    .io_data_offset            (_requests_io_data_offset),
    .io_data_put               (_requests_io_data_put)
  );
  MSHR mshrs_0 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_20 | mshr_selectOH[0] & _mshrs_0_io_schedule_bits_reload & (_requests_io_valid[0] | _requests_io_valid[7] | _requests_io_valid[14] | bypass_1)),
    .io_allocate_bits_prio_0                (_GEN_21 ? ~_sinkC_io_req_valid : _requests_io_data_prio_0),
    .io_allocate_bits_prio_1                (~(_GEN_20 | bypass_1) & _requests_io_data_prio_1),
    .io_allocate_bits_prio_2                (_GEN_21 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_21 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_21 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_21 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_21 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_21 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN_5),
    .io_allocate_bits_offset                (_GEN_21 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_21 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_20 ? request_bits_set : _mshrs_0_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_20 & _GEN_5 == _mshrs_0_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[0]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_0_io_status_valid),
    .io_status_bits_set                     (_mshrs_0_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_0_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_0_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_0_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_0_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[0]),
    .io_schedule_valid                      (_mshrs_0_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_0_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_0_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_0_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_0_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_0_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_0_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_0_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_0_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_0_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_0_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_0_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_0_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_0_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_0_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_0_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_0_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_0_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_0_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_0_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_0_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_0_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_0_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_0_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_0_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_0_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_0_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_0_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_0_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_0_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_0_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_0_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_0_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_0_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_0_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_0_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_0_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_0_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_0_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_0_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_0_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_0_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h0),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h0),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
  MSHR mshrs_1 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_22 | mshr_selectOH[1] & _mshrs_1_io_schedule_bits_reload & (_requests_io_valid[1] | _requests_io_valid[8] | _requests_io_valid[15] | bypass_2)),
    .io_allocate_bits_prio_0                (_GEN_23 ? ~_sinkC_io_req_valid : _requests_io_data_prio_0),
    .io_allocate_bits_prio_1                (~(_GEN_22 | bypass_2) & _requests_io_data_prio_1),
    .io_allocate_bits_prio_2                (_GEN_23 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_23 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_23 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_23 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_23 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_23 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN_4),
    .io_allocate_bits_offset                (_GEN_23 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_23 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_22 ? request_bits_set : _mshrs_1_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_22 & _GEN_4 == _mshrs_1_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[1]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_1_io_status_valid),
    .io_status_bits_set                     (_mshrs_1_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_1_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_1_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_1_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_1_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[1]),
    .io_schedule_valid                      (_mshrs_1_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_1_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_1_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_1_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_1_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_1_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_1_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_1_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_1_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_1_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_1_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_1_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_1_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_1_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_1_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_1_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_1_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_1_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_1_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_1_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_1_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_1_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_1_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_1_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_1_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_1_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_1_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_1_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_1_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_1_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_1_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_1_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_1_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_1_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_1_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_1_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_1_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_1_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_1_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_1_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_1_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_1_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h1),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h1),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
  MSHR mshrs_2 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_24 | mshr_selectOH[2] & _mshrs_2_io_schedule_bits_reload & (_requests_io_valid[2] | _requests_io_valid[9] | _requests_io_valid[16] | bypass_3)),
    .io_allocate_bits_prio_0                (_GEN_25 ? ~_sinkC_io_req_valid : _requests_io_data_prio_0),
    .io_allocate_bits_prio_1                (~(_GEN_24 | bypass_3) & _requests_io_data_prio_1),
    .io_allocate_bits_prio_2                (_GEN_25 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_25 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_25 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_25 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_25 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_25 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN_3),
    .io_allocate_bits_offset                (_GEN_25 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_25 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_24 ? request_bits_set : _mshrs_2_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_24 & _GEN_3 == _mshrs_2_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[2]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_2_io_status_valid),
    .io_status_bits_set                     (_mshrs_2_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_2_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_2_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_2_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_2_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[2]),
    .io_schedule_valid                      (_mshrs_2_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_2_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_2_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_2_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_2_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_2_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_2_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_2_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_2_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_2_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_2_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_2_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_2_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_2_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_2_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_2_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_2_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_2_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_2_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_2_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_2_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_2_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_2_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_2_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_2_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_2_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_2_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_2_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_2_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_2_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_2_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_2_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_2_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_2_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_2_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_2_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_2_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_2_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_2_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_2_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_2_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_2_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h2),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h2),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
  MSHR mshrs_3 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_26 | mshr_selectOH[3] & _mshrs_3_io_schedule_bits_reload & (_requests_io_valid[3] | _requests_io_valid[10] | _requests_io_valid[17] | bypass_4)),
    .io_allocate_bits_prio_0                (_GEN_27 ? ~_sinkC_io_req_valid : _requests_io_data_prio_0),
    .io_allocate_bits_prio_1                (~(_GEN_26 | bypass_4) & _requests_io_data_prio_1),
    .io_allocate_bits_prio_2                (_GEN_27 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_27 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_27 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_27 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_27 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_27 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN_2),
    .io_allocate_bits_offset                (_GEN_27 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_27 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_26 ? request_bits_set : _mshrs_3_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_26 & _GEN_2 == _mshrs_3_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[3]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_3_io_status_valid),
    .io_status_bits_set                     (_mshrs_3_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_3_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_3_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_3_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_3_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[3]),
    .io_schedule_valid                      (_mshrs_3_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_3_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_3_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_3_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_3_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_3_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_3_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_3_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_3_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_3_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_3_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_3_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_3_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_3_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_3_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_3_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_3_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_3_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_3_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_3_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_3_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_3_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_3_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_3_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_3_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_3_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_3_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_3_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_3_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_3_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_3_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_3_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_3_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_3_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_3_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_3_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_3_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_3_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_3_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_3_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_3_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_3_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h3),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h3),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
  MSHR mshrs_4 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_28 | mshr_selectOH[4] & _mshrs_4_io_schedule_bits_reload & (_requests_io_valid[4] | _requests_io_valid[11] | _requests_io_valid[18] | bypass_5)),
    .io_allocate_bits_prio_0                (_GEN_29 ? ~_sinkC_io_req_valid : _requests_io_data_prio_0),
    .io_allocate_bits_prio_1                (~(_GEN_28 | bypass_5) & _requests_io_data_prio_1),
    .io_allocate_bits_prio_2                (_GEN_29 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_29 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_29 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_29 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_29 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_29 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN_1),
    .io_allocate_bits_offset                (_GEN_29 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_29 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_28 ? request_bits_set : _mshrs_4_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_28 & _GEN_1 == _mshrs_4_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[4]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_4_io_status_valid),
    .io_status_bits_set                     (_mshrs_4_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_4_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_4_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_4_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_4_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[4]),
    .io_schedule_valid                      (_mshrs_4_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_4_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_4_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_4_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_4_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_4_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_4_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_4_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_4_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_4_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_4_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_4_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_4_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_4_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_4_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_4_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_4_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_4_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_4_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_4_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_4_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_4_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_4_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_4_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_4_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_4_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_4_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_4_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_4_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_4_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_4_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_4_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_4_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_4_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_4_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_4_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_4_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_4_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_4_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_4_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_4_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_4_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h4),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h4),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
  MSHR mshrs_5 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_30 | mshr_selectOH[5] & _mshrs_5_io_schedule_bits_reload & (_requests_io_valid[5] | _requests_io_valid[12] | _requests_io_valid[19] | bypass_6)),
    .io_allocate_bits_prio_0                (1'h0),
    .io_allocate_bits_prio_1                (~(_GEN_30 | bypass_6) & _requests_io_data_prio_1),
    .io_allocate_bits_prio_2                (_GEN_31 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_31 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_31 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_31 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_31 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_31 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN_0),
    .io_allocate_bits_offset                (_GEN_31 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_31 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_30 ? request_bits_set : _mshrs_5_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_30 & _GEN_0 == _mshrs_5_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[5]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_5_io_status_valid),
    .io_status_bits_set                     (_mshrs_5_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_5_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_5_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_5_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_5_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[5]),
    .io_schedule_valid                      (_mshrs_5_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_5_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_5_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_5_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_5_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_5_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_5_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_5_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_5_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_5_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_5_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_5_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_5_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_5_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_5_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_5_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_5_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_5_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_5_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_5_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_5_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_5_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_5_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_5_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_5_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_5_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_5_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_5_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_5_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_5_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_5_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_5_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_5_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_5_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_5_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_5_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_5_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_5_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_5_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_5_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_5_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_5_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h5),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h5),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
  MSHR mshrs_6 (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_allocate_valid                      (_GEN_33 | mshr_selectOH[6] & _mshrs_6_io_schedule_bits_reload & (_requests_io_valid[6] | _requests_io_valid[13] | _requests_io_valid[20] | bypass_7)),
    .io_allocate_bits_prio_0                (1'h0),
    .io_allocate_bits_prio_1                (1'h0),
    .io_allocate_bits_prio_2                (_GEN_34 ? _sinkC_io_req_valid : _requests_io_data_prio_2),
    .io_allocate_bits_control               (_GEN_34 ? _view__WIRE_6_control : _requests_io_data_control),
    .io_allocate_bits_opcode                (_GEN_34 ? _view__WIRE_6_opcode : _requests_io_data_opcode),
    .io_allocate_bits_param                 (_GEN_34 ? _view__WIRE_6_param : _requests_io_data_param),
    .io_allocate_bits_size                  (_GEN_34 ? _view__WIRE_6_size : _requests_io_data_size),
    .io_allocate_bits_source                (_GEN_34 ? _view__WIRE_6_source : _requests_io_data_source),
    .io_allocate_bits_tag                   (_GEN),
    .io_allocate_bits_offset                (_GEN_34 ? _view__WIRE_6_offset : _requests_io_data_offset),
    .io_allocate_bits_put                   (_GEN_34 ? _view__WIRE_6_put : _requests_io_data_put),
    .io_allocate_bits_set                   (_GEN_33 ? request_bits_set : _mshrs_6_io_status_bits_set),
    .io_allocate_bits_repeat                (~_GEN_33 & _GEN == _mshrs_6_io_status_bits_tag),
    .io_directory_valid                     (directoryFanout[6]),
    .io_directory_bits_dirty                (_directory_io_result_bits_dirty),
    .io_directory_bits_state                (_directory_io_result_bits_state),
    .io_directory_bits_clients              (_directory_io_result_bits_clients),
    .io_directory_bits_tag                  (_directory_io_result_bits_tag),
    .io_directory_bits_hit                  (_directory_io_result_bits_hit),
    .io_directory_bits_way                  (_directory_io_result_bits_way),
    .io_status_valid                        (_mshrs_6_io_status_valid),
    .io_status_bits_set                     (_mshrs_6_io_status_bits_set),
    .io_status_bits_tag                     (_mshrs_6_io_status_bits_tag),
    .io_status_bits_way                     (_mshrs_6_io_status_bits_way),
    .io_status_bits_blockC                  (_mshrs_6_io_status_bits_blockC),
    .io_status_bits_nestC                   (_mshrs_6_io_status_bits_nestC),
    .io_schedule_ready                      (mshr_selectOH[6]),
    .io_schedule_valid                      (_mshrs_6_io_schedule_valid),
    .io_schedule_bits_a_valid               (_mshrs_6_io_schedule_bits_a_valid),
    .io_schedule_bits_a_bits_tag            (_mshrs_6_io_schedule_bits_a_bits_tag),
    .io_schedule_bits_a_bits_set            (_mshrs_6_io_schedule_bits_a_bits_set),
    .io_schedule_bits_a_bits_param          (_mshrs_6_io_schedule_bits_a_bits_param),
    .io_schedule_bits_a_bits_block          (_mshrs_6_io_schedule_bits_a_bits_block),
    .io_schedule_bits_b_valid               (_mshrs_6_io_schedule_bits_b_valid),
    .io_schedule_bits_b_bits_param          (_mshrs_6_io_schedule_bits_b_bits_param),
    .io_schedule_bits_b_bits_tag            (_mshrs_6_io_schedule_bits_b_bits_tag),
    .io_schedule_bits_b_bits_set            (_mshrs_6_io_schedule_bits_b_bits_set),
    .io_schedule_bits_b_bits_clients        (_mshrs_6_io_schedule_bits_b_bits_clients),
    .io_schedule_bits_c_valid               (_mshrs_6_io_schedule_bits_c_valid),
    .io_schedule_bits_c_bits_opcode         (_mshrs_6_io_schedule_bits_c_bits_opcode),
    .io_schedule_bits_c_bits_param          (_mshrs_6_io_schedule_bits_c_bits_param),
    .io_schedule_bits_c_bits_tag            (_mshrs_6_io_schedule_bits_c_bits_tag),
    .io_schedule_bits_c_bits_set            (_mshrs_6_io_schedule_bits_c_bits_set),
    .io_schedule_bits_c_bits_way            (_mshrs_6_io_schedule_bits_c_bits_way),
    .io_schedule_bits_c_bits_dirty          (_mshrs_6_io_schedule_bits_c_bits_dirty),
    .io_schedule_bits_d_valid               (_mshrs_6_io_schedule_bits_d_valid),
    .io_schedule_bits_d_bits_prio_0         (_mshrs_6_io_schedule_bits_d_bits_prio_0),
    .io_schedule_bits_d_bits_prio_2         (_mshrs_6_io_schedule_bits_d_bits_prio_2),
    .io_schedule_bits_d_bits_opcode         (_mshrs_6_io_schedule_bits_d_bits_opcode),
    .io_schedule_bits_d_bits_param          (_mshrs_6_io_schedule_bits_d_bits_param),
    .io_schedule_bits_d_bits_size           (_mshrs_6_io_schedule_bits_d_bits_size),
    .io_schedule_bits_d_bits_source         (_mshrs_6_io_schedule_bits_d_bits_source),
    .io_schedule_bits_d_bits_offset         (_mshrs_6_io_schedule_bits_d_bits_offset),
    .io_schedule_bits_d_bits_put            (_mshrs_6_io_schedule_bits_d_bits_put),
    .io_schedule_bits_d_bits_set            (_mshrs_6_io_schedule_bits_d_bits_set),
    .io_schedule_bits_d_bits_way            (_mshrs_6_io_schedule_bits_d_bits_way),
    .io_schedule_bits_d_bits_bad            (_mshrs_6_io_schedule_bits_d_bits_bad),
    .io_schedule_bits_e_valid               (_mshrs_6_io_schedule_bits_e_valid),
    .io_schedule_bits_e_bits_sink           (_mshrs_6_io_schedule_bits_e_bits_sink),
    .io_schedule_bits_x_valid               (_mshrs_6_io_schedule_bits_x_valid),
    .io_schedule_bits_dir_valid             (_mshrs_6_io_schedule_bits_dir_valid),
    .io_schedule_bits_dir_bits_set          (_mshrs_6_io_schedule_bits_dir_bits_set),
    .io_schedule_bits_dir_bits_way          (_mshrs_6_io_schedule_bits_dir_bits_way),
    .io_schedule_bits_dir_bits_data_dirty   (_mshrs_6_io_schedule_bits_dir_bits_data_dirty),
    .io_schedule_bits_dir_bits_data_state   (_mshrs_6_io_schedule_bits_dir_bits_data_state),
    .io_schedule_bits_dir_bits_data_clients (_mshrs_6_io_schedule_bits_dir_bits_data_clients),
    .io_schedule_bits_dir_bits_data_tag     (_mshrs_6_io_schedule_bits_dir_bits_data_tag),
    .io_schedule_bits_reload                (_mshrs_6_io_schedule_bits_reload),
    .io_sinkc_valid                         (_sinkC_io_resp_valid & _sinkC_io_resp_bits_set == _mshrs_6_io_status_bits_set),
    .io_sinkc_bits_last                     (_sinkC_io_resp_bits_last),
    .io_sinkc_bits_tag                      (_sinkC_io_resp_bits_tag),
    .io_sinkc_bits_source                   (_sinkC_io_resp_bits_source),
    .io_sinkc_bits_param                    (_sinkC_io_resp_bits_param),
    .io_sinkc_bits_data                     (_sinkC_io_resp_bits_data),
    .io_sinkd_valid                         (_sinkD_io_resp_valid & _sinkD_io_resp_bits_source == 3'h6),
    .io_sinkd_bits_last                     (_sinkD_io_resp_bits_last),
    .io_sinkd_bits_opcode                   (_sinkD_io_resp_bits_opcode),
    .io_sinkd_bits_param                    (_sinkD_io_resp_bits_param),
    .io_sinkd_bits_sink                     (_sinkD_io_resp_bits_sink),
    .io_sinkd_bits_denied                   (_sinkD_io_resp_bits_denied),
    .io_sinke_valid                         (_sinkE_io_resp_valid & _sinkE_io_resp_bits_sink == 3'h6),
    .io_nestedwb_set                        (nestedwb_set),
    .io_nestedwb_tag                        (nestedwb_tag),
    .io_nestedwb_b_toN                      (nestedwb_b_toN),
    .io_nestedwb_b_toB                      (nestedwb_b_toB),
    .io_nestedwb_b_clr_dirty                (nestedwb_b_clr_dirty),
    .io_nestedwb_c_set_dirty                (nestedwb_c_set_dirty)
  );
endmodule

