<template>
  <div>
    <h1>Liste des consommables</h1>
  </div>
</template>

<script>
export default {
  data() {
    return {
      result: [],
    }
  },
  created() {
    this.callAPI('/consumables')
  },
  methods: {
    async callAPI(url) {
      try {
        const result = await this.$axios(({ url: url, method: 'GET' }))
        console.log(result.data)
        this.result = result.data
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>
