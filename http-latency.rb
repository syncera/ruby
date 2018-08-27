# something for the prometheus box to give us a latency backend

require 'prometheus/client'
# define method called histogram in the client module
histogram =  Prometheus::Client::Histogram.new(...)

# define the method for the serve http request
def serve_http(request)
  start = Time.now
  handle(request) # process req
  stop = Time.now
  elapsed = start - stop # variable for the output
  histogram.observe(elapsed) # method to display the output
end
