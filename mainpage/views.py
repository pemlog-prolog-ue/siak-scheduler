from django.shortcuts import render

# Create your views here.
def index(request):
  if request.method == "POST":
    print("MASUK")
    preferensi_teman = request.POST.get("preferensi_teman")
    preferensi_dosen = request.POST.get("preferensi_dosen")
    preferensi_minat = request.POST.get("preferensi_minat")
    request_data = {
      "preferensi_teman": preferensi_teman,
      "preferensi_dosen": preferensi_dosen,
      "preferensi_minat": preferensi_minat
    }
    print(request_data)
    return render(request, "index.html", {"request_data": request_data})
  return render(request, "index.html")