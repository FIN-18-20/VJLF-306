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
            <option v-for="(name, f) in filters" :key="'firstFilter-' + name" :value="f">{{ name }}</option>
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
            <option
              v-for="(name, f) in filtersSecond"
              :key="'secondFilter-' + name"
              :value="f"
            >{{ name }}</option>
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
                v-for="(printer, index) in displayKeys"
                :key="index + 'heading'"
                v-html="printer"
                :class="sortedByStyle(printer)"
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
      filters: {
        't_brands.braName': 'Marque',
        't_constructors.conName': 'Constructeur',
        'show-Taille [dm³]': 'Taille',
        't_printers.priWeight': 'Poids',
        't_printers.priSales': 'Ventes',
        't_printers.priPrintSpeed': 'Vitesse d\'impression',
        't_prices.priValue': 'Prix',
        't_printers.priScanRes': 'Résolution de numérisation',
      },
      filtersChanged: false,
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
    },

    filtersSecond() {
      const newFilters = { ...this.filters }
      delete newFilters[this.firstFilter]
      return newFilters
    },

    oneFilterChanged() {
      return `${this.firstFilter}${this.firstOrder}${this.secondFilter}${this.secondOrder}`
    }
  },

  watch: {
    oneFilterChanged() {
      this.filtersChanged = true
    },

    secondFilter() {
      if (!this.secondOrder.length) {
        this.secondOrder = 'ASC'
      }
    }
  },

  created() {
    this.filter()
  },

  methods: {
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
        const result = await this.$axios(({ url: '/filters', data: data, method: 'POST' }))
        this.result = result.data
        this.filtersChanged = false
      } catch (error) {
        console.log(error)
      }
    },
    goToPrinterDetails(id) {
      this.$router.push({ name: 'printers', params: { id: id } })
    },
    sortedByStyle(key) {
      if (this.filtersChanged) return

      let classes = 'sorted relative text-blue-300'

      if (this.filters[this.firstFilter].includes(key.split(' ')[0])) {
        classes += this.firstOrder === 'ASC' ? ' sorted-up' : ' sorted-down'
        return classes
      }

      if (this.secondFilter.length && this.filters[this.secondFilter].includes(key.split(' ')[0])) {
        classes += this.secondOrder === 'ASC' ? ' sorted-up' : ' sorted-down'
        return classes
      }
    }
  }
}
</script>

<style scoped>
.sorted::after {
  position: absolute;
  right: 6px;
  top: 50%;
  transform: translateY(-50%);
}

.sorted-up::after {
  content: "↑";
}

.sorted-down::after {
  content: "↓";
}
</style>
