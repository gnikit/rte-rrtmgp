set -eux
EXT=""
if [[ $(uname) == *"NT"* ]]; then
    # Windows-specific commands
    EXT=".exe"
    echo "Running on Windows"
else
    # Linux/Unix commands
    echo "Running on Linux/Unix"
fi
./rte_optic_prop_unit_tests${EXT}
./rte_lw_solver_unit_tests${EXT}
./rte_sw_solver_unit_tests${EXT}
./check_equivalence${EXT} test_atmospheres.nc ${RRTMGP_DATA}/rrtmgp-gas-lw-g256.nc 
./check_equivalence${EXT} test_atmospheres.nc ${RRTMGP_DATA}/rrtmgp-gas-lw-g128.nc
./check_equivalence${EXT} test_atmospheres.nc ${RRTMGP_DATA}/rrtmgp-gas-sw-g224.nc
./check_equivalence${EXT} test_atmospheres.nc ${RRTMGP_DATA}/rrtmgp-gas-sw-g112.nc
./check_variants${EXT}    test_atmospheres.nc ${RRTMGP_DATA}/rrtmgp-gas-lw-g256.nc ${RRTMGP_DATA}/rrtmgp-gas-lw-g128.nc
./check_variants${EXT}    test_atmospheres.nc ${RRTMGP_DATA}/rrtmgp-gas-sw-g224.nc ${RRTMGP_DATA}/rrtmgp-gas-sw-g112.nc 