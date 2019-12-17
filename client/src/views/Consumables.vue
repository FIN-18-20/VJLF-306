<template>
  <div class="container mx-auto">
    <h1 class="text-5xl">Liste des consommables</h1>
    <div class="flex justify-around">
      <div v-for="conso in result" :key="conso.idConsumable">
        <div class="border-gray-600 border-double border-4 w-120 mt-4">
          <div class="text-2xl">
            {{
              conso[0].csbName + ' | ' + conso[0].csbDescription + ' | ' + conso[0].csbPrice + " CHF"
            }}
          </div>
          <div class="mt-2">
            Imprimantes utilisant ce consommable :
          </div>
          <table class="table-auto mx-auto my-4">
            <thead>
              <tr>
                <th class="px-4 py-2 bg-blue-900 border-r border-blue-200 text-blue-100 font-semibold leading-none">Nom</th>
                <th class="px-4 py-2 bg-blue-900 border-r border-blue-200 text-blue-100 font-semibold leading-none">Prix</th>
              </tr>
            </thead>
            <tbody>
              <router-link v-for="printer in conso[1]" :key="printer.idPrinter"  :to="{ name: 'printers', params: { id: printer.idPrinter } }" class="cursor-pointer bg-white hover:bg-blue-100" tag="tr">
                <td class="border px-4 py-2">{{ printer.priName }}</td>
                <td class="border px-4 py-2">{{ printer.priValue + ' CHF' }}</td>
              </router-link>
            </tbody>
          </table>
        </div>
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
  created() {
    this.callAPI('/consumables')
  },
  methods: {
    async callAPI(url) {
      try {
        const result = await this.$axios({ url: url, method: 'GET' })
        console.log(result.data)
        this.result = result.data
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
