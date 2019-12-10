<template>
  <div class="home container mx-auto">
    <div class="PrintersNav">
      <!-- FIRST FILTER -->
      <div
        class="mx-auto max-w-2xl flex items-center justify-center py-2 rounded bg-blue-100 border border-blue-200"
      >
        <div class="text-sm text-gray-900 font-semibold">Trier par :</div>
        <label class="ml-2 block">
          <select v-model="firstFilter" class="form-select block w-full mt-1">
            <option value="t_brands.braName">Marque</option>
            <option value="t_constructors.conName">Constructeur</option>
            <option value="show-Taille [dm³]">Taille</option>
            <option value="t_printers.priWeight">Poids</option>
            <option value="t_printers.priSales">Ventes</option>
            <option value="t_printers.priPrintSpeed">Vitesse d'impression</option>
            <option value="t_prices.priValue">Prix</option>
            <option value="t_printers.priScanRes">Résolution de numérisation</option>
          </select>
        </label>
        <div class="ml-8 text-sm text-gray-900 font-semibold">Ordre :</div>
        <label class="ml-2 block">
          <select v-model="firstOrder" class="form-select block w-full mt-1">
            <option value="ASC">Ascendant</option>
            <option value="DESC">Descendant</option>
          </select>
        </label>
      </div>
      <!-- SECOND FILTER -->
      <div
        class="mt-2 mx-auto max-w-2xl flex items-center justify-center py-2 rounded bg-blue-100 border border-blue-200"
      >
        <div class="text-sm text-gray-900 font-semibold">Second filtre (optionnel) :</div>
        <label class="ml-2 block">
          <select v-model="secondFilter" class="form-select block w-full mt-1">
            <option value="t_brands.braName">Marque</option>
            <option value="t_constructors.conName">Constructeur</option>
            <option value="show-Taille [dm³]">Taille</option>
            <option value="t_printers.priWeight">Poids</option>
            <option value="t_printers.priSales">Ventes</option>
            <option value="t_printers.priPrintSpeed">Vitesse d'impression</option>
            <option value="t_prices.priValue">Prix</option>
            <option value="t_printers.priScanRes">Résolution de numérisation</option>
          </select>
        </label>
        <div class="ml-8 text-sm text-gray-900 font-semibold">Ordre :</div>
        <label class="ml-2 block">
          <select v-model="secondOrder" class="form-select block w-full mt-1">
            <option value="ASC">Ascendant</option>
            <option value="DESC">Descendant</option>
          </select>
        </label>
      </div>
      <!-- LIMIT AND BUTTON -->
      <div
        class="mt-2 mx-auto max-w-md flex items-center justify-center py-2 rounded bg-blue-100 border border-blue-200"
      >
        <div class="text-sm text-gray-900 font-semibold">Limite de résultats :</div>
        <label class="ml-2 block">
          <select v-model="limit" class="form-select block w-full mt-1">
            <option :value="3">3</option>
            <option :value="5">5</option>
            <option :value="10">10</option>
            <option :value="-1" selected>Aucune limite</option>
          </select>
        </label>
        <button
          @click="filter"
          class="ml-8 px-4 py-2 bg-blue-400 rounded shadow-md text-white font-bold hover:bg-blue-500"
        >Filtrer</button>
      </div>
    </div>
    <!-- DISPLAY RESULTS -->
    <div class="mt-24 px-16 py-8 mx-auto border-gray-600 border-double border-8 text-center">
      <div v-show="result.length">
        <table class="table-auto w-full mx-auto">
          <thead>
            <tr>
              <th
                v-for="printer in displayKeys"
                :key="printer.Id"
                v-html="printer"
                class="px-4 py-2 bg-blue-900 border-r border-blue-200 text-blue-100 font-semibold leading-none"
              ></th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(printer, index) in result"
              :key="printer['show-Id']"
              @click="goToPrinterDetails(printer['show-Id'])"
              :class="{'bg-gray-100': index % 2 === 0}"
              class="cursor-pointer bg-white hover:bg-blue-100"
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
      result: [],
      firstFilter: 't_brands.braName',
      firstOrder: 'ASC',
      limit: -1,
      secondFilter: '',
      secondOrder: '',
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

  watch: {
    secondFilter() {
      if (!this.secondOrder.length) {
        this.secondOrder = 'ASC'
      }
    }
  },

  methods: {
    async callAPI(url) {
      try {
        const result = await this.$axios(({ url: url, method: 'POST' }))
        console.log(result.data)
        this.result = result.data
        console.log(this.displayKeys)
      } catch (error) {
        console.log(error)
      }
    },
    async filter() {
      try {
        const data = {
          firstFilter: this.firstFilter,
          firstOrder: this.firstOrder
        }
        if (this.limit !== -1)
          data.limit = this.limit

        if (this.secondFilter) {
          data.secondFilter = this.secondFilter
          data.secondOrder = this.secondOrder.length ? this.secondOrder : 'ASC'
        }

        console.log(data)
        const result = await this.$axios(({ url: '/filters', data: data, method: 'POST' }))
        console.log(result.data)
        this.result = result.data
        console.log(this.displayKeys)
      } catch (error) {
        console.log(error)
      }
    },
    goToPrinterDetails(id) {
      this.$router.push({ name: 'printers', params: { id: id } })
    }
  }
}
</script>

<style scoped>
</style>
