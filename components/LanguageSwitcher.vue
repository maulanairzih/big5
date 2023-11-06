<template>
  <v-menu
    v-model="drawer"
    bottom
    offset-y
    max-width="250"
  >
    <template #activator="{ on }">
      <v-btn
        icon
        aria-label="Expand menu"
        v-on="on"
        @click="drawer = !drawer"
      >
        <v-img
          v-if="icons[selectedLocale]"
          :src="icons[selectedLocale]"
          max-width="24"
        />
        <span v-else>
          {{ selectedLocale }}
        </span>
      </v-btn>
    </template>
    <v-list>
      <v-list-item>
        <v-subheader class="text-uppercase">
          {{ $t('common.languages') }}
        </v-subheader>
      </v-list-item>
      <v-divider />
      <v-row>
        <v-col
          v-for="locale in availableLocales"
          :key="locale.code"
          cols="6"
        >
          <v-list-item
            link
            :to="switchLocalePath(locale.code)"
            class="text-none font-weight-regular pl-5 body-2"
            @click="logClick(locale.code)"
          >
            {{ locale.name }}
          </v-list-item>
        </v-col>
      </v-row>
    </v-list>
  </v-menu>
</template>

<script>
import enIcon from 'svg-country-flags/svg/gb.svg'
import idIcon from 'svg-country-flags/svg/id.svg'

export default {
  name: 'LanguageSwitcher',
  data: function () {
    return {
      drawer: false,
      icons: {
        en: enIcon,
        id: idIcon
      }
    }
  },
  computed: {
    availableLocales () {
      return this.$i18n.locales.filter(i => i.code !== this.$i18n.locale)
    },
    selectedLocale () {
      return this.$i18n.locale
    }
  },
  methods: {
    logClick (code) {
      this.$amplitude.getInstance().logEvent('b5.langauge.switch', { code })
      const { dir } = this.$i18n.locales.find(i => i.code === code)
      this.$vuetify.rtl = dir === 'rtl'
    }
  }
}
</script>
