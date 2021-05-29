import http.server
import os
import json
from pyswip.prolog import Prolog

prolog = Prolog()

prolog.consult("database.pl")
print(list(prolog.query("kelas(X,mk_31,Y)")))

PORT = int(os.getenv("SERVER_PORT", "8000"))

class APIHandler(http.server.SimpleHTTPRequestHandler):
  def do_GET(self):
    pass
  def do_POST(self):
    pass

try:
  server = http.server.HTTPServer(("", PORT), APIHandler)
  print(f"Serving at port {PORT}")
  server.serve_forever()
except KeyboardInterrupt:
  server.server_close()
