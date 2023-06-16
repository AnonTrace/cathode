cathode(){
    if [ $1 == 'start' ]; then
        ssh -fNCD 7980 $2@$3
        networksetup -setsocksfirewallproxy Wi-Fi localhost 7980
    elif [ $1 == 'stop' ]; then
        networksetup -setsocksfirewallproxystate Wi-Fi off
        kill $(ps aux | awk '/7980/ {print $2}' | head -n 1)
    else
        echo "Usage:"
        echo "\tcathode start <USERNAME> <SERVER-ADDRESS>"
        echo "\tcathode stop"
    fi
}
