
*** Variables ***
${UART}                       sysbus.uart0


*** Test Cases ***

Should Run Bluetooth sample
    Execute Command           mach add "mcu_eth_test"
    Execute Command           machine LoadPlatformDescription @platforms/cpus/nrf52840.repl
    Execute Command           sysbus LoadELF @/home/runner/work/zephyr_discussion_61040/zephyr_discussion_61040/zephyr.elf
    Execute Command           showAnalyzer ${UART}
    ${mcu_eth}=  Create Terminal Tester   ${UART}   machine=mcu_eth_test

    Execute Command           emulation SetGlobalQuantum "0.00001"

    Start Emulation

    Wait For Line On Uart     Booting Zephyr                    testerId=${mcu_eth}
