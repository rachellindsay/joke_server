<template>
  <div ref="catStats"></div>
</template>

<script setup>
import getStats from "@/composables/getStats";
import Plotly from "plotly.js";
import { ref, onBeforeMount } from "vue";



const catStats = ref<HTMLDivElement>();

Plotly.newPlot(catStats.value,)

const data =
function getData() {
  let x = [];
  let y = [];
  let stat;

  let i = 0;
  while (i < getStats.length) {
    stat = stats[i];
    x.push(row["cat_jokes_told"]);
    y.push(row["date_told"]);
    i++;
  }
  console.log(x);
  console.log(y);

  makePlotly(x, y);
}

function makePlotly(x,y) {
  let traces = [
    {
      x: x,
      y: y,
      name: "A"
</script>
