import Vue from 'vue'
import CommentBtn from '../components/comment/CommentBtn.vue'


document.addEventListener('DOMContentLoaded', () => {
  new Vue ( {
    el: "#comment",
    components: {CommentBtn}
  })
})