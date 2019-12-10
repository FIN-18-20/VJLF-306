<template>
  <div>
    Graph here
  </div>
</template>

<script>
import { Bar } from 'vue-chartjs'

export default {
  extends: Bar,
  props: {
    prices: { type: Array, required: true }
  },
  data() {
    return {
      data: '',
      options: ''
    }
  },
  mounted() {
    this.renderChart(this.data, this.options)
  }
}
</script>