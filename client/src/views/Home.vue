<template>
  <div class="home container mx-auto">
    <div class="PrintersNav">
      <div class="text-center text-3xl">Trier par :</div>
      <div class="buttonRow1 flex justify-center content-around mt-2">
        <button
          @click="callAPI('brand')"
          class="brand bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Marques</button>
        <button
          @click="callAPI('size')"
          class="Height ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Volumes</button>
        <button
          @click="callAPI('weight')"
          class="weight ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Poids</button>
        <button
          @click="callAPI('price')"
          class="priceEvolution ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Évolution du prix</button>
        <button
          @click="callAPI('constructor')"
          class="constructor ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Constructeurs</button>
        <button
          @click="callAPI('sell')"
          class="bestSales ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Meilleures ventes</button>
        <button
          @click="callAPI('speed')"
          class="impressionSpeed ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Vitesse d'impression</button>
      </div>
      <div class="buttonRow2 flex justify-center content-around mt-2">
        <button
          @click="callAPI('resolution')"
          class="resolution ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Résolutions</button>
        <button
          @click="callAPI('price')"
          class="extremePrices ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Prix extrêmes</button>
        <button
          @click="todo()"
          class="constructorAndPrice ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Constructeurs & prix</button>
        <button
          @click="todo()"
          class="PrintersConsumable ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Imprimantes et consommables</button>
        <button
          @click="todo()"
          class="Consumable ml-2 bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
        >Consommables</button>
      </div>
    </div>
    <div
      class="PrintersInfo mt-24 px-16 py-8 mx-auto border-gray-600 border-double border-8 text-center"
    >
      <div v-show="result.length">
        <table class="table-auto w-full mx-auto">
          <thead>
            <tr>
              <th v-for="printer in displayKeys" :key="printer.Id" class="px-4 py-2">{{ printer }}</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(printer, index) in result"
              :key="printer['show-Id']"
              :class="{'bg-gray-100': index % 2 === 0}"
            >
              <td
                v-for="key in displayKeys"
                :key="printer['show-Id'] + key"
                class="border px-4 py-2"
              >{{ printer[`show-${key}`] }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-show="!result.length">
        <p>Veuillez choisir votre filtre ci-dessus afin d'afficher la liste d'imprimantes.</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      result: []
    }
  },

  computed: {
    displayKeys() {
      if (!this.result.length) {
        return null
      }

      return Object.keys(this.result[0])
        .filter(key => key.startsWith('show-'))
        .reduce((array, key) => {
          return [
            ...array,
            key.split('show-')[1]
          ]
        }, [])
    }
  },

  methods: {
    async callAPI(url) {
      try {
        const result = await this.$axios(({ url: url, method: 'GET' }))
        console.log(result.data)
        this.result = result.data
        console.log(this.displayKeys)
      } catch (error) {
        console.log(error)
      }
    },
    todo() {
      alert('Bouton à implémenter.')
    }
  }
}
</script>

<style scoped>
</style>
