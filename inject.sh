target_process="hl_linux"
target_pid=""
libpath="$(pwd)/build/libcshack.so"

if [ "$EUID" -ne 0 ]; then
    echo "[!] Run as root"
    exit 0
fi

if [ ! command -v gdb &> /dev/null ]; then
    echo "[!] Unable to find GDB, make sure you have it installed"
    exit 0
fi

if [ ! -f $libpath ]; then
    echo "[!] Invalid shared library file"
    exit 0
fi

if [ -z $target_pid ]; then
    target_pid=$(pgrep $target_process) > /dev/null 2>&1
    if [ ! $target_pid ]; then
        echo "[!] The target process is not running"
        exit 0
    fi
fi

echo "[*] Injecting shared library (Press [ENTER] if needed)..."
sleep 1.5

gdb -n -q -batch \
  -ex "attach $target_pid" \
  -ex "set \$dlopen = (void*(*)(char*, int)) dlopen" \
  -ex "call \$dlopen(\"$libpath\", 1)" \
  -ex "detach" \
  -ex "quit" > /dev/null 2>&1

echo "[*] Shared library successfully injected"
