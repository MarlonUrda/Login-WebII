export async function isAuthenticated() {
    try {

        const res = await fetch("http://localhost:3000/isAuthenticated", {
        method: "GET",
        credentials: "include",
        headers: {
            "Content-Type": "application/json",
        }
        });
    
 
        const data = await res.json();
        console.log(data.message);
        return data.message;
        
    }catch (error) {
        console.log(error);
    }
}