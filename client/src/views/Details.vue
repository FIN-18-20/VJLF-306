<template>
  <div class="details">
    <h1>Page des détails</h1>
    <printer-prices :prices="prices"></printer-prices>
  </div>
</template>
<script>
import PrinterPrices from '../components/PrinterPrices.vue'
export default {
  components: {
    PrinterPrices
  },
  data() {
    return {
      printer: {},
      prices: []
    }
  },
  created() {
    this.getInfos()
  },
  methods: {
    getInfos() {
      this.$axios.get(`/printers/${this.$route.params.id}`)
        .then((res) => {
          console.log(res)
          this.printer = res.data.printer
          this.prices = res.data.prices
        })
        .catch((err) => {
          console.log(err)
        })
    }
  },
}
</script>
