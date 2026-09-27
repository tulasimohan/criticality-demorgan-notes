<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" />

<xsl:template match="/research_dossier">
<html>
<head>
  <title><xsl:value-of select="@subject"/> — LLM Dossier</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
      margin: 0; padding: 32px; background: #0d1117; color: #c9d1d9; line-height: 1.6; font-size: 14px;
    }
    .header { border-bottom: 1px solid #30363d; padding-bottom: 20px; margin-bottom: 24px; }
    h1 { font-size: 22px; color: #58a6ff; margin: 0 0 6px 0; }
    .meta { color: #8b949e; font-size: 13px; }
    .box { background: #161b22; border: 1px solid #30363d; border-radius: 8px; padding: 16px; margin-bottom: 20px; }
    .box-title { font-weight: 600; color: #58a6ff; margin-bottom: 8px; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px; }
    .approach { background: #161b22; border: 1px solid #30363d; border-radius: 8px; padding: 16px; margin-bottom: 14px; }
    .approach-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
    .badge { padding: 2px 8px; border-radius: 12px; font-size: 11px; font-weight: 600; text-transform: uppercase; }
    .badge-ACTIVE { background: #0e4429; color: #3fb950; }
    .badge-REFUTED { background: #490202; color: #ff7b72; }
    .badge-STUCK { background: #4d2d00; color: #d29922; }
    .badge-PARTIAL { background: #3d156b; color: #d2a8ff; }
    .mechanism { background: #0d1117; border-left: 3px solid #58a6ff; padding: 8px 12px; margin: 8px 0; font-family: monospace; font-size: 12px; }
    .hurdle { background: #261214; border-left: 3px solid #ff7b72; padding: 8px 12px; margin: 8px 0; font-size: 12px; color: #ff7b72; }
    details { margin-top: 10px; background: #0d1117; border: 1px solid #30363d; border-radius: 6px; padding: 8px 12px; }
    summary { cursor: pointer; font-weight: 500; color: #58a6ff; }
    pre { white-space: pre-wrap; font-family: monospace; font-size: 12px; color: #c9d1d9; max-height: 400px; overflow-y: auto; }
  </style>
</head>
<body>
  <div class="header">
    <h1><xsl:value-of select="@subject"/></h1>
    <div class="meta">Authors: <xsl:value-of select="@authors"/> | Date: <xsl:value-of select="@date"/> | Structured LLM Context Bundle</div>
  </div>

  <div class="box">
    <div class="box-title">System Prompt &amp; Instructions</div>
    <div style="font-size: 13px;"><xsl:value-of select="system_prompt_instruction"/></div>
  </div>

  <div class="box">
    <div class="box-title">Core Conjecture</div>
    <div style="font-family: monospace; font-size: 13px; color: #7ee787;"><xsl:value-of select="problem_statement/conjecture"/></div>
  </div>

  <h2 style="font-size: 16px; margin: 24px 0 12px 0; color: #f0f6fc;">Summary of Proof Approaches</h2>
  <xsl:for-each select="approaches_summary/approach">
    <div class="approach">
      <div class="approach-header">
        <strong style="color: #f0f6fc; font-size: 15px;"><xsl:value-of select="name"/></strong>
        <span class="badge badge-{@status}"><xsl:value-of select="@status"/></span>
      </div>
      <div style="font-size: 13px; color: #8b949e;"><xsl:value-of select="description"/></div>
      <div class="mechanism"><strong>Mechanism:</strong> <xsl:value-of select="mathematical_mechanism"/></div>
      <div class="hurdle"><strong>Known Hurdle / Failure Mode:</strong> <xsl:value-of select="open_hurdle_or_failure"/></div>
    </div>
  </xsl:for-each>

  <h2 style="font-size: 16px; margin: 24px 0 12px 0; color: #f0f6fc;">Primary Sources &amp; Working Manuscripts (<xsl:value-of select="count(primary_sources/source_origin/document)"/> Documents)</h2>
  <xsl:for-each select="primary_sources/source_origin">
    <h3 style="font-size: 14px; text-transform: uppercase; color: #8b949e; margin-top: 16px;">Source: <xsl:value-of select="@type"/></h3>
    <xsl:for-each select="document">
      <details>
        <summary><xsl:value-of select="@name"/></summary>
        <pre><xsl:value-of select="."/></pre>
      </details>
    </xsl:for-each>
  </xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
