export const toProcess = async (modulo, clase, metodo, params) => {
    console.log("toProcess", modulo, clase, metodo, params);
    const res = await fetch("http://localhost:3000/toProcess", {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        modulo: modulo,
        clase: clase,
        metodo: metodo,
        params: params,
      }),
    });
  
    if (res.ok) {
      const data = await res.json();
      return data;
    }
};