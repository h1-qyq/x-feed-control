---
name: x-feed-control
description: Use when a user wants Codex to audit or reduce repetitive, narrow, or recommendation-heavy content on X/Twitter through their currently signed-in browser.
---

# X Feed Control

Use the current signed-in browser to make X's controllable inputs and entry points less repetitive. The goal is measurable feed diversity, not a claim that the server-side recommender has been rewritten.

When this repository is supplied by URL, first read `README.md`, `SKILL.md`, `docs/research.md`, `docs/safety.md`, and `tests/acceptance.md`; treat those files as the execution contract.

## Required browser behavior

Read and follow `browser:control-in-app-browser` before browser work. Use the browser explicitly selected by the user; otherwise use the target-URL selection. Verify the selected surface visibly contains the user's signed-in X session; if it is a different or signed-out surface, stop and report blocked rather than silently changing browsers. Use visible text, roles, screenshots, and settings search. Never inspect passwords, cookies, tokens, profiles, localStorage, or session stores.

If X is signed out, stop X writes and report `Blocked — sign in yourself in the current browser`. Never handle credentials.

## Modes

- `audit`: read-only sample and metrics.
- `quick-fix`: default for “一键优化”. Apply only the safe actions below.
- `deep-clean`: after quick-fix, prepare exact targets for mute/feedback and ask once at the final submit boundary.

## Audit contract

Inspect at least 20 visible Home items without opening unrelated posts or playing media. Record author, broad topic, followed/recommended status, and exact/near-duplicate markers. If fewer than 20 items can be verified, report the exact count and why; do not pad the sample with guesses. If topic labels are unreliable, report topic metrics as unavailable rather than inventing labels. Report:

- author concentration (top-author share and Herfindahl-Hirschman Index when enough data exists);
- topic concentration (topic counts and topic entropy when labels are reliable);
- exact/near-duplicate rate;
- Following vs out-of-network proportion;
- promoted/repost/reply module counts when visible.

Do not call a viewpoint “low quality”. Repetition is evidence of concentration, not permission to unfollow.

## Quick-fix actions

1. Open X Home and switch to the visible `Following`/`正在关注` timeline. Leave it selected.
2. If an existing private List is explicitly named by the user, open it and leave it selected; never create a list silently.
3. Use current settings search to locate muted words/accounts and recommendation/notification controls. Do not submit a new mute or block target without a preview and one final confirmation.
4. Do not automate likes, replies, reposts, follows, unfollows, subscriptions, or quote posts. Do not clear history or reset recommendations. This project never performs account-relationship changes.
5. After every safe change, re-read the selected tab, URL, toggle state, or visible confirmation. A click alone is not proof.
6. If settings navigation moved away from Home, return to Home, select Following again if needed, and re-verify the final selected state before reporting Done.

## Deep-clean boundary

Create a table with exact target, proposed action, evidence, scope, reversibility, and expected effect. If the user only says “remove repeated people”, do not invent accounts from frequency. Ask for explicit names or a content-based rule. Itemized mute/feedback may proceed only after final confirmation; this Skill never performs account-relationship changes, and bulk unfollow remains prohibited.

## Recovery and final report

For changed labels, reread the screen and try semantic synonyms (`Following`, `正在关注`, `Muted words`, `静音字词`, `Content preferences`, `内容偏好`). Save a checkpoint of verified actions before a login handoff. On ambiguous state, report blocked.

Return only:

**Done** — changed action plus visible verification.

**Needs confirmation** — exact targets, action, scope, and effect.

**Blocked** — platform, reason, and the one user action needed.

A blocked optional cleanup does not cancel a completed quick-fix: report both sections when applicable, for example `Done: Following verified` plus `Blocked: bulk unfollow is prohibited; provide a content rule if you want a mute/feedback preview`.
