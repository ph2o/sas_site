<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" version="3.0">
  <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="fr">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width" />
        <title><xsl:value-of select="atom:feed/atom:title" /> (feed)</title>
        <style type="text/css">
          html {
            margin: 0;
            padding: 0;
          }
          body {
            margin: 1rem auto;
            padding: 1rem;
            max-width: 40rem;
            background-color: #EFF0F4;
            color: #586069;
            font-family: Helvetica, Arial, sans-serif;
            font-size: 1rem;
            line-height: 1.5rem;
          }
          input {
            min-width: 100%;
            margin-left: .2rem;
            padding-left: .2rem;
            padding-right: .2rem;
          }
          ol {
            list-style-type: none;
              margin-left: -2.5rem;
          }
          li {
            margin: 1rem 0;
          }
          h2, h3 {
            margin: 0;
            color: #24292E;
            font-weight: inherit;
          }
          a {
            color: #0366d6;
            text-decoration: none;
          }
          small {
            color: #586069;
          }
          #RSSicon {
            margin-right: .5rem;
          }
          header {
            margin-bottom: 1rem;
            border-bottom: 1px solid #c7c7c7;
          }
          @-moz-document url-prefix() {
            form {
              margin-bottom: 1rem;
            }
          }
          footer {
            border-top: 1px solid #c7c7c7;
          }
          @media (min-width: 768px) {
            input {
              min-width: 20rem;
            }
          }
        </style>
      </head>
      <body>
        <header>
          <h1>
            <!-- https://commons.wikimedia.org/wiki/File:Feed-icon.svg -->
            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" style="vertical-align: text-bottom; width: 1.2em; height: 1.2em;" class="pr-1" id="RSSicon" viewBox="0 0 256 256">
              <defs>
                <linearGradient x1="0.085" y1="0.085" x2="0.915" y2="0.915" id="RSSg">
                  <stop offset="0.0" stop-color="#E3702D"/><stop offset="0.1071" stop-color="#EA7D31"/>
                  <stop offset="0.3503" stop-color="#F69537"/><stop offset="0.5" stop-color="#FB9E3A"/>
                  <stop offset="0.7016" stop-color="#EA7C31"/><stop offset="0.8866" stop-color="#DE642B"/>
                  <stop offset="1.0" stop-color="#D95B29"/>
                </linearGradient>
              </defs>
              <rect width="256" height="256" rx="55" ry="55" x="0"  y="0"  fill="#CC5D15"/>
              <rect width="246" height="246" rx="50" ry="50" x="5"  y="5"  fill="#F49C52"/>
              <rect width="236" height="236" rx="47" ry="47" x="10" y="10" fill="url(#RSSg)"/>
              <circle cx="68" cy="189" r="24" fill="#FFF"/>
              <path d="M160 213h-34a82 82 0 0 0 -82 -82v-34a116 116 0 0 1 116 116z" fill="#FFF"/>
              <path d="M184 213A140 140 0 0 0 44 73 V 38a175 175 0 0 1 175 175z" fill="#FFF"/>
            </svg>
            <a><xsl:attribute name="href"><xsl:value-of select="atom:feed/atom:link[@rel='alternate']/@href" /></xsl:attribute><xsl:value-of select="atom:feed/atom:title" /></a>
          </h1>
          <p>Pour vous abonner à ce flux Web, copiez son URL dans votre lecteur de flux.</p>
          <form>
            <label for="feed-url">URL du flux :</label>
            <input id="feed-url" onClick="this.select();">
              <xsl:attribute name="type">url</xsl:attribute>
              <xsl:attribute name="url">URL</xsl:attribute>
              <xsl:attribute name="spellcheck">false</xsl:attribute>
              <xsl:attribute name="value"><xsl:value-of select="atom:feed/atom:link[@rel='self']/@href" /></xsl:attribute>
            </input>
          </form>
        </header>
        <article>
          <h2>Entrées du flux</h2>
          <ol>
            <xsl:for-each select="atom:feed/atom:entry">
            <li>
              <h3><a><xsl:attribute name="href"><xsl:value-of select="atom:link/@href" /></xsl:attribute><xsl:value-of select="atom:title" /></a></h3>
              <small><xsl:value-of select="substring(atom:published, 1, 10)" /></small>
            </li>
            </xsl:for-each>
          </ol>
        </article>
        <footer>
          <p>Flux généré par <a href="https://cecil.app/#8.11.0">Cecil v8.11.0</a></p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>