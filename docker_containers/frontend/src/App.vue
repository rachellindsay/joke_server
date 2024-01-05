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
/* #app {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  grid-template-areas:
    ". navigation navigation navigation navigation."
    ". page-title page-title blurb blurb . "
    ". content content content content ."
    ". buttons buttons buttons buttons ."
    ". footer footer footer footer .";
  gap: 5px;
}*/
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
  padding: 2rem;
  /* background-color: #b5caca;*/
  border-radius: var(--border-radius);
}
.blurb {
  grid-area: blurb;
  font-size: 1.2rem;
  text-align: left;
  padding: 2rem;
}
.content {
  grid-area: content;
  padding: 2rem;
}
.buttons {
  grid-area: buttons;
}
.footer {
  grid-area: footer;
  text-align: center;
  font-size: smaller;
  color: var(--text-accent-color);
  background-color: #d1bd19;
}
/*
@media screen(max-width: 900px;)
  #app {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: auto;
    grid-template-areas:
      "navigation navigation navigation navigation"
      "page-title page-title page-title page-title"
      "blurb blurb blurb blurb "
      "content content content content"
      "buttons buttons buttons buttons"
      "footer footer footer footer";
    gap: 2px;
  }


*/
</style>
