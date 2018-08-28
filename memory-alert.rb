# Alert script if for the prometheus box; trigger if any node has extended period of low memory.
ALERT LowNodeMemory
IF node_memory_available < 500000000
FOR 15m
LABELS { severity = "page" }
ANNOTATIONS {
  summary = "*** Node is running out of memory ***"
  description = "The node has had less than 500mb available memory for more than 15 minutes!",
}
