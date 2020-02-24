<template>
  <div v-show="showform">
  <form @submit.prevent="postComment()">
    <input type="text" v-model="comment">
    <input type="submit" value="投稿">
  </form>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default{
  name: "comment-form",
  props: ["showform", "userId", "postId"],
  data: function(){
    return{
      comment: ""
    }
  },
  methods: {
    postComment: function() {
      axios.post('/api/comments', {
        text: this.comment,
        post_id: this.postId,
        user_id: this.UserId
      }).then()
    }
  }
}
</script>