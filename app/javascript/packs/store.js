import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    currentPage: 1,
    tweets: [],
    keyword: '',
    keyword_fcs: '',
    keyword_ays: '',
    keyword_tour: '',
    keyword_w_fcs: '',
    keyword_w_ays: ''
  }
})