<template>
  <div @click="showform()">
    コメントする
  </div>
  <CommentForm :showform="showform" :userId="UI" :postId="PI"></CommentForm>
</template>
<script>
import CommentForm from './components/comment/CommentForm.vue'
//   import axios from 'axios'
//   import { csrfToken } from 'rails-ujs'
// axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: ['userId', 'postId'],
  components: {CommentForm},
  data: function(){
    return {
      showform: false,
      UI: this.userId,
      PI: this.postId
    }
  },
  methods: {
    showform: function(){
      this.showform = true
    }
  }
}
</script>