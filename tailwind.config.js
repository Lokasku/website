/** @type {import('tailwindcss').Config} */
export default {
  content: ['./bin/*.ml', 'lib/article.ml'],
  theme: {
    fontFamily: {
      'sans': ['Inter Tight', 'sans-serif'],
      'mono': ['monospace']
    },
    extend: {},
  },
  plugins: [],
}