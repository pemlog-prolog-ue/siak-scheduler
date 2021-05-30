from pyswip.prolog import Prolog
from threading import Thread
import json
import sys

# print(str(sys.argv))

p = Prolog()

def consult():
  p.consult("prolog/database.pl")

def dosen_ngajar_apa_aja(query_input):
  print("MASUK")
  consult()
  print("ASED")
  query_user = f"dosen_kelas(Kode_kelas,{query_input})"
  query_result = list(p.query(query_user))
  result = []
  list_id = []
  class_name = []
  for element in query_result:
    class_id = element["Kode_kelas"]
    list_id.append(class_id)
  for element in list_id:
    # get kode_matkul and section
    query_user = f"kelas({element}, Kode_mk, Section)"
    query_result = list(p.query(query_user))
    # print(query_result)

    # get nama matkul from kode_matkul
    temp_kode_mk = query_result[0]["Kode_mk"]
    query_user = f"mata_kuliah({temp_kode_mk}, Nama_matkul)"
    query_result = list(p.query(query_user))[0]["Nama_matkul"]
    # print(query_result)

    if query_result not in result:
      result.append(query_result)
  print(json.dumps(result, indent=2))
  print("end")
  return json.dumps(result, indent=2)
  # print(json.dumps(query_result, indent=2))
