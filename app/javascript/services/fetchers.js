export const schoolData = () => {
    return fetch('/api/school',{
        headers : { 
          'Content-Type': 'application/json',
          'Accept': 'application/json'
         }
    }).then(res => res.json());
}