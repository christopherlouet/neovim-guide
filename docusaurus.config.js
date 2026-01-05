import {themes as prismThemes} from 'prism-react-renderer';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "Guide Neovim",
  url: "https://christopherlouet.github.io",
  baseUrl: "/neovim-guide/",
  organizationName: "christopherlouet",
  projectName: "neovim-guide",
  deploymentBranch: "gh-pages",

  // Future flags, see https://docusaurus.io/docs/api/docusaurus-config#future
  future: {
    v4: true, // Improve compatibility with the upcoming Docusaurus v4
  },

  // onBrokenLinks: 'throw',
  onBrokenLinks: 'ignore',
  onBrokenMarkdownLinks: 'warn',

  presets: [
    [
      'classic',
      {
        docs: {
          routeBasePath: '/',
          sidebarPath: require.resolve('./docs/sidebar.js'),
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      },
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      colorMode: {
        defaultMode: "dark",
        disableSwitch: false,
        respectPrefersColorScheme: true,
      },
      navbar: {
        title: 'Guide Neovim',
        items: [
          {
            type: "doc",
            docId: "index",
            label: "Guide",
            position: "left",
          },
          {
            label: "📘 Télécharger le PDF",
            href: "/pdf/guide-neovim.pdf",
            position: "right",
            target: "_blank",
            rel: "noopener noreferrer",
          }
        ],
      },
      tableOfContents: {
        minHeadingLevel: 2,
        maxHeadingLevel: 3,
      },
      algolia: {
        appId: "FAKE",
        apiKey: "FAKE",
        indexName: "neovim",
      },
      footer: {
        style: 'dark',
        copyright: `© ${new Date().getFullYear()} Guide Neovim.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),
  themes: [
    [
      require.resolve("@cmfcmf/docusaurus-search-local"),
      {
        indexDocs: true,
        indexBlog: false,
        indexPages: false,
        language: ["en"],
      },
    ],
  ],
};

export default config;
