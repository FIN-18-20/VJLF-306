<template>
  <div>
    Graph Component here
    <div class="PricessInfo container mt-24 px-16 py-8 mx-auto border-gray-600 border-double border-8 text-center">
      <h3 class="text-xl font-bold">Différents prix:</h3>
      <table class="table-auto w-full mx-auto mt-2">
        <thead>
          <tr>
            <th class="border">Date</th>
            <th class="border">Valeur</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(price, index) in prices" :key="price.idPrice">
            <td :class="{'bg-gray-100': index % 2 === 0}" class="border px-4 py-2">{{ price.priDate }}</td>
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
  }
}
</script>