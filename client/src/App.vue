<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Accueil</router-link>
      <span class="mx-2">|</span>
      <router-link to="/consumables">Consommables</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #63B3ED;
}
</style>
