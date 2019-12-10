<template>
  <div class="details container mx-auto">
    <h1 class="text-5xl">Détails</h1>
    <div class="border-gray-600 border-double border-4 px-32 pt-4 pb-8">
      <div class="text-4xl flex ml-48 pb-4">CANON PIXMA TS9550</div>
      <div class="flex justify-between">
        <div
          class="bg-gray-200 rounded-lg shadow-lg text-gray-900 p-8 w-96"
        >
          <div class="text-3xl pb-4">Caractéristiques</div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Marque :</div>
            <div class="pl-2 self-center">CANON</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Constructeur :</div>
            <div class="pl-2 self-center">CANON</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Vitesse d'impression :</div>
            <div class="pl-2">10 ppm</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Résolution :</div>
            <div class="pl-2">2400 dpi</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Largeur :</div>
            <div class="pl-2 self-center">468 mm</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Hauteur :</div>
            <div class="pl-2">193 mm</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Profondeur :</div>
            <div class="pl-2">366 mm</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Volume :</div>
            <div class="pl-2">33.05 dm³</div>
          </div>
          <div class="flex justify-between">
            <div class="font-bold self-center">Poids :</div>
            <div class="pl-2">9.7 kg</div>
          </div>
        </div>
        <div class="">
          <div
            class="bg-gray-200 rounded-lg shadow-lg text-gray-900 ml-24 p-8 w-96 h-32 self-center"
          >
            <div class="flex justify-between">
              <div class="font-bold self-center text-3xl">Prix :</div>
              <div class="pl-2 text-3xl">181 CHF</div>
            </div>
            <div class="pt-4 flex justify-between">
              <div class="font-bold self-center">Nombre de ventes :</div>
              <div class="pl-2">253</div>
            </div>
          </div>
          <div
            class="mt-8 bg-gray-200 rounded-lg shadow-lg text-gray-900 ml-24 p-8 w-96 h-48 self-center"
          >
            <div class="text-3xl pb-4">Consomables</div>
            <div class="flex justify-between">
              <div class="font-bold self-center">Nom :</div>
              <div class="pl-2">CANON CLI-581PB</div>
            </div>
            <div class="flex justify-between">
              <div class="font-bold self-center">Description :</div>
              <div class="pl-2">Encre bleue</div>
            </div>
            <div class="flex justify-between">
              <div class="font-bold self-center">Prix :</div>
              <div class="pl-2">12 CHF/Cartouche</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex my-16">
      <printer-prices :prices="prices"></printer-prices>
      <printer-prices-graph :prices="prices"></printer-prices-graph>
    </div>
    
  </div>
</template>

<script>
import PrinterPrices from '../components/PrinterPrices.vue'
import PrinterPricesGraph from '../components/PrinterPricesGraph.vue'

export default {
  components: {
    PrinterPrices,
    PrinterPricesGraph
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
