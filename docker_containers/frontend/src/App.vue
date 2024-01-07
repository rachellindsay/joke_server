<template>
  <NavBarButtons />
  <router-view />
  <div class="footer">by Rachel</div>
</template>
<script setup>
import NavBarButtons from "@/components/navigation/NavBarButtons.vue";
</script>
<style>
/* custom props */
:root {
  --accent-color: #d1bd19;
  --text-accent-color: #417777;
  --border-radius: 1rem;
  --accent-color-2: #274848;
}

/* layout */
body {
  background-color: #f2f2f2;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #444;
}
#app {
  display: grid;
  grid-template-areas:
    "navigation"
    "page-title"
    "blurb"
    "content"
    "buttons"
    "footer";
}
.navigation {
  grid-area: navigation;
  border-radius: var(--border-radius);
}
.page-title {
  grid-area: page-title;
  color: var(--text-accent-color);
  text-align: center;
  padding: 2rem 2rem 0 2rem;
  /* background-color: #b5caca;*/
  border-radius: var(--border-radius);
}
.blurb {
  grid-area: blurb;
  font-size: 1.2rem;
  text-align: left;
  padding: 0 2rem 2rem 2rem;
}
.content {
  grid-area: content;
  padding: 0 2rem;
}
.buttons {
  grid-area: buttons;
  margin: auto;
}
.footer {
  grid-area: footer;
  text-align: center;
  font-size: smaller;
  color: var(--text-accent-color);
  background-color: #d1bd19;
}

@media screen and (min-width: 700px) {
  #app {
    grid-template-columns: repeat(2, 1fr);
    grid-template-areas:
      "navigation navigation"
      "page-title blurb "
      "content content"
      "buttons buttons"
      "footer footer";
    gap: 2px;
  }
  .blurb {
    padding-top: 2rem;
  }
}
@media screen and (min-width: 950px) {
  #app {
    padding: 0 5rem;
  }
}
@media screen and (min-width: 1110px) {
  #app {
    padding: 0 10rem;
  }
}
@media screen and (min-width: 1275px) {
  #app {
    padding: 0 15rem;
  }
}
@media screen and (min-width: 1600px) {
  #app {
    padding: 0 20rem;
  }
}
</style>
