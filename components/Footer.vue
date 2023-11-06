<template>
  <v-footer class="pl-10 pt-10">
    <v-row class="footer-container">
      <v-col
        sm="12"
        md="6"
        class="pl-0 pt-0"
      >
        <v-row class="footer-wrapper pl-0">
          <v-col class="footer-heading">
            <img
            class="responsive"
            alt="open source"
            cols="6"
            height="170px"
            width="180px"
            :src="require('@/assets/footer.png')"
            loading="lazy"
          >
          </v-col>
          <v-col
            class="footer-text"
            cols="12"
          >
            © {{ new Date().getFullYear() }} — Rubynor - all rights reserved.
          </v-col>
        </v-row>
      </v-col>
      <!-- <v-col cols="auto">
        <h3 class="mb-2">
          Having questions about or problems with the site?
        </h3>
        Please read the <nuxt-link
          :to="localePath('faq')"
        >
          <a @click="logClick('FAQ')">FAQ</a>
        </nuxt-link>.
      </v-col> -->
    </v-row>
  </v-footer>
</template>

<script>
import { mdiFacebook, mdiTwitter, mdiGithub, mdiLinkedin } from '@mdi/js'

export default {
  name: 'Footer',
  data: () => ({
    mdiFacebook,
    mdiTwitter,
    mdiLinkedin,
    mdiGithub
  }),
  methods: {
    logClick (choice) {
      this.$amplitude.getInstance().logEvent(`goes to ${choice}`, {})
    }
  }
}
</script>

<style scoped>
.footer-container {
  width: 100%;
  padding: 12px;
  margin-right: auto;
  margin-left: auto;
  max-width: 1200px;
}
.footer-heading {
  font-family: 'Passion One', cursive;
  font-size: 4rem;
  color: #4c4f5a;
  line-height: 3.5rem;
}
.footer-about {
  letter-spacing: .1em;
}
.footer-text {
  font-family: 'Didact Gothic', sans-serif;
  color: #b3b3b3;
}
.footer-wrapper {
  max-width: 1200px;
  width: 100%;
  padding: 12px;
  margin-right: auto;
  margin-left: auto;
}
</style>
