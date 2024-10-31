#!/usr/bin/env python3
import wns_report


def test_parse_stats():
    report = """
    slack: 0.039060
    Clock core_clock
       0.00 source latency ctrl.state.out[0]$_DFF_P_/CK ^
       0.00 target latency ctrl.state.out[0]$_DFF_P_/CK ^
       0.00 CRPR
    --------------
       0.00 setup skew

    tns 0.00
    Cell type report:                       Count       Area
      Tap cell                                 48      12.77
      Buffer                                   14      19.95
      Inverter                                 85      51.34
      Sequential cell                          35     158.27
      Multi-Input combinational cell          369     420.55
      Total                                   551     662.87
    """
    expected_stats = {
        "slack": 0.03906,
        "skew": "0.00",
        "Tap cell": 48,
        "Inverter": 85,
        "Buffer": 14,
        "Sequential cell": 35,
        "Multi-Input combinational cell": 369,
        "Total": 551,
        "tns": 0.00,
    }

    assert wns_report.parse_stats(report) == expected_stats
