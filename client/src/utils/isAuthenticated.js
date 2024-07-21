export async function isAuthenticated() {
    try {
        console.log('isAuthenticated se esta ejecutadno');
        const res = await fetch("http://localhost:3000/isAuthenticated", {
        method: "GET",
        credentials: "include",
        headers: {
            "Content-Type": "application/json",
        }
        });
    
 
        const data = await res.json();
        console.log('isAuthenticated se esta ejcuto wuuuuuuuuuuu');
        console.log(data.message);
        return data.message;
        
    }catch (error) {
        console.log(error);
    }
}