<template>
  <!-- NavBar should only show logout button because users should be logged in to see the submit joke button -->
  <NavBar />
  <div>
    <h1>This page is for submitting jokes</h1>
  </div>
  <form>
    <!-- the form 
          user name auto filled

          joke input field - textarea

          joke category dropdown

          submit button - will submit joke to the database with approval defaulting to O for false. Once approved 'approved' will change to 1 for true.
            - function to insert into db
            - need to alter db to 

          response that joke has been submitted for approval - modal?
    -->
  </form>
</template>

<script setup>
import NavBar from "@/components/navigation/NavBar.vue";
</script>
