<template>
  <div>
    <div v-if="isfavorited" @click="deletefavorite()">
      <img src=".images/heart-red.png" alt="いいねボタン"> {{ count }}
    </div>
    <div v-else @click="registerLike()">
      <img src=".images/heart-black.png" alt="いいねボタン"> {{ count }}
    </div>
  </div>
</template>


<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
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
