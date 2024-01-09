#include <vpi_user.h>
#include <svdpi.h>
#include <vector>
#include <string>
#include "testchip_tsi.h"

testchip_tsi_t *tsi = NULL;

// Remove VCS simv option from argv if it match pattern -X???=
void remove_vcs_simv_opt(int & argc, char **& argv){
    int idx = 0;
    while(idx < argc){
        std::string str = std::string(argv[idx]);
        if(str.length() > 1 && str[0] == '-' && str[1] != '-' && str.find('=') != std::string::npos){
            // Found -????=???? as VCS simv option
            for(int i = idx; i < argc - 1; i++){
                // Remove the current option
                argv[i] = argv[i + 1];
            }
            argc--;
        }else{
            idx++;
        }
    }
}

extern "C" int tsi_tick(
        unsigned char out_valid,
        unsigned char *out_ready,
        int out_bits,

        unsigned char *in_valid,
        unsigned char in_ready,
        int *in_bits)
{
    bool out_fire = *out_ready && out_valid;
    bool in_fire = *in_valid && in_ready;
    bool in_free = !(*in_valid);

    if (!tsi) {
        s_vpi_vlog_info info;
        if (!vpi_get_vlog_info(&info))
          abort();

	  // Prevent simv option enter htif
	  remove_vcs_simv_opt(info.argc, info.argv);

        // TODO: We should somehow inspect whether or not our backing memory supports loadmem, instead of unconditionally setting it to true
        tsi = new testchip_tsi_t(info.argc, info.argv, true);
    }

    tsi->tick(out_valid, out_bits, in_ready);
    tsi->switch_to_host();

    *in_valid = tsi->in_valid();
    *in_bits = tsi->in_bits();
    *out_ready = tsi->out_ready();

    return tsi->done() ? (tsi->exit_code() << 1 | 1) : 0;
}
