<template>
  <div id="slide">
    <div class="header mb-5">
      <transition name="fade">
      <div class="slider-inner" :key="idx" v-for="(slide, idx) in slides" v-if="current_slide == idx">
        <img class="slide-img" v-bind:src="slides[idx].img" :key="slides[idx].img">
      </div>
      </transition>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      current_slide: 0,
      slides: [
        {img: "/images/81573810.jpeg"},
        {img: "/images/ball.jpg"},
        {img: "/images/thumb_ground.jpg"},
        {img: "/images/thumb_front.jpg"},
        {img: "/images/mykosien.JPG"}
      ]
    }
  },
  mounted() {
    setInterval(() => {
      this.current_slide = this.current_slide < this.slides.length -1 ? this.current_slide +1 : 0
    }, 3000)
  }
}
</script>