<template>
  <div>
    <div v-if="isfavorited" @click="deletefavorite()">
      いいね済み {{ count }}
    </div>
    <div v-else @click="registerfavorite()">
      いいね {{ count }}
    </div>
  </div>
</template>


<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: ['userId', 'postId'],
  data: function() {
    return {
      favoriteList: []
    }
  },
  computed: {
    count() {
      return this.favoriteList.length;
    },
    isfavorited() {
      if (this.favoriteList.length === 0 ) {return false}
      return Boolean(this.findFavoriteId())
    }
  },
  // created: function() {
  //   this.feathFavoriteByPostId().then(result => {
  //     this.favoriteList = result
  //   })
  // },
  
  methods: {
      feathFavoriteByPostId: async function() {
        const res = await axios.get("/posts");
        if (res.status !== 200){process.exit()};
        return res.data
      },
      registerfavorite: async function() {
        const res = await axios.post('api/favorites', {post_id: this.postId})
        if (res.status !== 201) {process.exit()}
        this.feathFavoriteByPostId().then(result =>{
          this.favoriteList = result
        })
      },
      deletefavorite: async function(){
        const favId = this.findFavoriteId()
        const res = await axios.delete(`api/favorites/${favId}`)
        if (res.status !== 200) {process.exit()}
        this.favoriteList = this.favoriteList.filter(n => n.id !== favId)
      },
      findFavoriteId: function(){
        const fav = this.favoriteList.find((fav) => {
          return fav.user_id === this.userId
        })
        if (fav) {return fav.id};
      }
  }
  
}
</script>

<style scoped>
img{
  width:40px;
  height:40px;
  margin-top:30px;
}
</style>
