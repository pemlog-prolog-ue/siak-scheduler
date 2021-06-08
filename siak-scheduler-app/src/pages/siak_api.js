
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

export const postQuery = async (query_data, callback) => {
  
  // api call for the albums, generate the band parameter manually here
  // because it's less code :) 
  // fetch does allow get paramters to be passed via an object but I'd rather 
  // talk about it than actually do it... 
    const requestOptions = {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(query_data)
    };
    const promise = await fetch('/api/query', requestOptions);
    const resp = await promise.json();
    console.log(resp);

//   .then((resp) => resp.json()) 
//   .then((data) => callback(data))
}