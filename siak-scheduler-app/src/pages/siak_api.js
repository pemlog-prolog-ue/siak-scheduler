
export const getAllMatkul = (callback) => {

  // api call to get the list of bands, takes no parameters 
  // (But could take a match in a future enhancement)
  fetch('/api/matkul', {  
      headers: {
      'Accept': 'application/json',
      }
  })
  .then((resp) => resp.json()) // Transform the return value a object
  .then((data) => {
      callback(data);
      console.log("SIAK_API");
      console.log(data)})
}