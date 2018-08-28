ALERT filesystem_dangerously_high
 IF ((node_filesystem_size - node_filesystem_free{mountpoint='/'}) / node_filesystem_size) * 100 > 10
ANNOTATIONS {
  summary = "Filesystem usage is dangerously high",
  description = "This device's filesystem has exceeded the threshold of 10% with a value of {{ $value }}.",
}
