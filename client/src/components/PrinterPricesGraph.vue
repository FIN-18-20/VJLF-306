<script>
import { Line } from 'vue-chartjs'

export default {
  extends: Line,
  props: {
    prices: { type: Array, required: true }
  },
  data() {
    return {
      labelData: [],
      datas: [],
      maxPrice: '',
      minPrice: ''
    }
  },
  mounted() {
    this.getLabelsAndDatas()
    this.renderChart({
      labels: this.labelData,
      datasets: [
        {
          label: 'Prix en CHF',
          data: this.datas,
          pointLabelFontSize: 4,
          borderWidth: 3,
          fill: false,
          borderColor: '#63b3ed',
          borderCapStyle: 'round',
          borderDash: [],
          borderDashOffset: 0.0,
          pointBorderColor: '#63b3ed',
          pointBackgroundColor: '#63b3ed',
          pointBorderWidth: 1,
          pointHoverRadius: 4,
          pointHoverBackgroundColor: '#2b6cb0',
          pointHoverBorderColor: '#2b6cb0',
          pointHoverBorderWidth: 2,
          pointRadius: 3,
          pointHitRadius: 8,
          steppedLine: 'before'
        }
      ]
    },
      {
        title: {
          display: true,
          text: 'Fluctuation du prix [CHF]',
          fontColor: '#2c3e50'
        },
        scales: {
          xAxes: [{
            gridLines: {
              display: false,
              borderDash: [6, 2],
              tickMarkLength: 10
            },
            ticks: {
              fontSize: 9,
              labelOffset: 2,
              maxRotation: 0
            }          }],
          yAxes: [{
            gridLines: {
              display: true
            },
            ticks: {
              beginAtZero: false,
              suggestedMax: this.maxPrice,
              suggestedMin: this.minPrice,
              maxTicksLimit: 12,
              stepSize: 5,
              fontSize: 10
            }
          }]
        },
        legend: {
          display: true
        },
        responsive: false,
        maintainAspectRatio: false
      })
  },
  methods: {
    getLabelsAndDatas() {
      this.labelData = this.prices.map(price => this.formatDate(price.priDate))
      this.datas = this.prices.map(price => price.priValue)
      this.maxPrice = Math.max(...this.datas) + 20
      this.minPrice = Math.min(...this.datas) - 20
    },
    formatDate(dateToParse) {
      const date = new Date(dateToParse)
      return date.toLocaleDateString('fr-FR', { day: 'numeric', month: 'numeric', year: '2-digit' })
    }
  },
}
</script>