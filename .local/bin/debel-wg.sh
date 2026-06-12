cmd="$1"

if ip -4 addr show wg0 2>/dev/null | grep -q 'inet '; then
  wg_iface="wg0"
  wg_name="bqlopole"
fi

if ip -4 addr show wg1 2>/dev/null | grep -q 'inet '; then
  wg_iface="wg1"
  wg_name="kokalqne"
fi

case "$cmd" in
status)
  if [ -n "$wg_iface" ]; then
    echo " $wg_name"
    exit
  fi

  echo ' wg down'
  ;;
bqlopole)
  sudo wg-quick down wg0
  sudo wg-quick down wg1
  sudo wg-quick up wg0
  sudo systemctl restart systemd-resolved
  ;;
kokalqne)
  sudo wg-quick down wg0
  sudo wg-quick down wg1
  sudo wg-quick up wg1
  sudo systemctl restart systemd-resolved
  ;;
down)
  sudo wg-quick down wg0
  sudo wg-quick down wg1
  ;;
*)
  echo "Usage: status | down | bqlopole | kokalqne"
  exit
  ;;
esac
