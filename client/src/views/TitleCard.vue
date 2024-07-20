<template>
    <body>
        <div id="uicollage"><img src="@/imgs/UI Collage.png"></img></div>
        <div id="logo"><img src="@/imgs/Logo.png"></img></div>
        <div id="fig1"><img src="@/imgs/Project Team Management.png"></img></div>
        <div id="icons"><img src="@/imgs/Icons.png"></img></div>
        <div class="titlecontainer" id="titlecontainer">
          <h2>La herramienta definitiva para la gestión de tus proyectos.</h2>
          <p>Descubre el poder del trabajo en equipo con el mejor gestor digital jamás visto. Con tareas y líneas de tiempo, no existen límites.</p>
        </div>
        <div class="container" id="container"></div>
    </body>
</template>

<style>

  body{
      overflow: hidden;
  }

  .container{
      background-color: #fff;
      border-radius: 7vh;
      box-shadow: 0 5px 15px rgba(0,0,0,0.6);
      position: absolute;
      top: 20%;
      left: 34.2%;
      width: 62%;
      height: 68.4%;
      z-index: 4;
  }

  .titlecontainer{
      top: 20%;
      left: 34%;
      background: linear-gradient(to right, #0037ae, #46a8ff);
      border-radius: 7vh 15vh 15vh 7vh;
      position: absolute;
      overflow: hidden;
      width: 31%;
      height: 68.4%;
      z-index: 5;
  }
  .titlecontainer h2{
      color: #fff;
      font-size: 3.7vh;
      font-weight: 700;
      position: absolute;
      top: 12.3%;
      left: 15%;
      transform: translate(-12.5%, -50%);
      text-shadow: rgb(33, 33, 33) 2px 2px 7px;
      z-index: 5;
      text-align: center;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  .titlecontainer p{
      color: #fff;
      font-size: 2.6vh;
      font-weight: 400;
      position: absolute;
      top: 23%;
      left: 14%;
      /* transform: translate(-50%, -50%); */
      text-shadow: rgb(33, 33, 33) 2px 2px 7px;
      z-index: 5;
      transform: translate(-10%, 4%);
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
  }

  #uicollage{
      animation: animate 10s ease-in-out infinite;
      animation-delay: 7s;
      rotate: -5deg;
      position: absolute;
      top: 18vh;
      width: 38%;
      z-index: 500;
  }

  #logo{
      /* animation: animate 7s ease-in-out infinite; */
      position: absolute;
      transform: translateX(-50%);
      top: 1.5%;
      left: 50%;
      width: 52vh;
      z-index: 500;
  }

  #fig1{
      /* animation: animate 12s ease-in-out infinite; */
      position: absolute;
      rotate: 3deg;
      top: 53%;
      left: 51%;
      width: 52vh;
      z-index: 600;
      transform: translateX(-51%);
  }

  #icons{
      position: absolute;
      top: 81.5%;
      left: 75%;
      width: 12%;
      z-index: 5;
  }

  @keyframes animate{
      0%{
          transform: translateY(-5%);
      }
      50%{
          transform: translateY(5%);
      }
      100%{
          transform: translateY(-5%);
      }
  }
</style>