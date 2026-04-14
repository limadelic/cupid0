---
name: indeed
description: Use when searching or scraping Indeed job listings for cupid0
---

# Indeed

## What
Scrape Indeed job listings using the chrome-devtools MCP against the user's real logged-in Chrome session.

## How

**Search URL:**
```
https://www.indeed.com/jobs?q=software+engineer&l=Remote&fromage=7&salaryType=%24150%2C000&sc=0kf%3Aattr%28DSQF7%29%3B
```

**Pagination:** append `&start=20` for page 2, `&start=40` for page 3, etc.

**Scrape jobs with evaluate_script:**
```javascript
() => [...document.querySelectorAll('.job_seen_beacon')].map(el => ({
  title: el.querySelector('.jobTitle a')?.innerText?.trim(),
  company: el.querySelector('[data-testid="company-name"]')?.innerText?.trim(),
  url: el.querySelector('.jobTitle a')?.href
})).filter(j => j.title)
```

**Rules:**
- Use chrome-devtools MCP only — Playwright gets detected on page 2+
- Do NOT navigate if already on the right page — read first
- After getting jobs from evaluate_script, use Write tool to save to /tmp/cupid0_jobs.json as {"count": N, "jobs": [...]}
- Run `node filter.js` after each page
