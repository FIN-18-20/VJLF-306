<template>
  <div>
    <div class="PricesInfo inline-block  px-8 py-4 mx-auto border-gray-600 border-double border-4 text-center">
      <h3 class="text-xl font-bold inline-block">Différents prix:</h3>
      <table class="table-auto w-48 mx-auto mt-3">
        <thead>
          <tr>
            <th class="bg-gray-200 border">Date</th>
            <th class="bg-gray-200 border">Valeur [CHF]</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(price, index) in prices" :key="price.idPrice">
            <td :class="{'bg-gray-100': index % 2 === 0}" class="border px-4 py-2">{{ formatDate(price.priDate) }}</td>
            <td class="border px-4 py-2">{{ price.priValue }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    prices: { type: Array, required: true }
  },
  methods: {
    formatDate(dateToParse) {
      const date = new Date(dateToParse)
      return date.toLocaleDateString('fr-FR', { day: 'numeric', month: 'numeric', year: '2-digit' })
    }
  },
}
</script>