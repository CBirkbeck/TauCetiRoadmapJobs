# FIX-PKG-ShimuraVarietiesPartII~8

Repair of the two findings of `REV-PKG-ShimuraVarietiesPartII~7`, both P3. I checked both against the cached source texts and both are correct, so both are applied. Each was also repaired as a pattern across the whole roadmap:

- F01: every source citation of the README was checked against its manifest entry.
- F02: every page range of the README was checked against the page where the cited item ends.

Six more locators had a page range that ran one page too far, and they are corrected. No mathematical statement, target, Check, supplier contract, `gaps` entry or Lean declaration changed.

## REV-PKG-ShimuraVarietiesPartII~7/F01 (P3) — applied

**Verified.** These items are cited in the README but were missing from the `locator` field of their manifest entry:

- HT hypothesis (1.1.3.1) in §1.1.3 (HT line 283–285, p.7);
- HT Proposition 1.2.5 (HT line 648, p.14; proof to HT line 683, p.15);
- KZ Definition 2.2.4 and Remark 2.2.5 (KZ line 437–443, p.10);
- KZ Proposition 6.2.4 (KZ line 2559) through Theorem 6.2.7 (KZ line 2619);
- KP Lemma 3.1.17 (KP line 2011, journal p.169).

**Change (`sources.toml`).**

- HT `locator`: gains `§1.1.3, hypothesis (1.1.3.1); Proposition 1.2.5;`, plus `§§2.2–2.3` (cited in Scope) and `Lemma A.4, Proposition A.6` (cited in the supplier contracts and §0.6).
- KZ `locator`: gains `Definition 2.2.4; Remark 2.2.5;` and `§6.2, Proposition 6.2.4 through Theorem 6.2.7`.
- KP `locator`: gains `Lemma 3.1.17`.
- `cited_for`: "References" added to KZ, HT, KPZ and KP; "Scope and ownership" and "Summary" added to KZ, HT and KPZ.

**Pattern.** I mapped every citation of the five sources in the README (220 occurrences) to its README section. I then compared each one with its manifest `locator` and `cited_for`.

- The only locators outside their manifest entry were the five the review lists, plus HT §§2.2–2.3 (README Scope, line 11).
- The extra `cited_for` sections all come from the Summary, Scope and the *Source conventions and corrections* list under References.
- HT `cited_for` listed "Conventions", but HT is not cited in that section (README lines 17–40 contain no HT citation). The stale entry is removed.
- KPZ `locator` and all of K17 needed no change.

## REV-PKG-ShimuraVarietiesPartII~7/F02 (P3) — applied

**Verified.** In the cached HT text, the page-24 marker is at HT line 1070 and the page-25 marker at HT line 1114. §2.1.8 (HT line 1079–1094) and Corollary 2.1.9 with its proof (HT line 1095–1105, ending with the proof symbol) lie between them. Page 25 opens inside §2.2.1.

**Change.** §4.13: "(HT, Corollary 2.1.9, pp.24–25)" → "(HT, Corollary 2.1.9, p.24, with §2.1.8, p.24, for Conj′ and neatness)". This is the review's wording. No manifest change: HT records §2.1.8 and Corollary 2.1.9.

**Pattern.** The review's mechanical pass checked only the page of the first line of each cited item, so it could not see a range that ends too late. I checked the end page of every cited range in HT, KZ, KPZ, KP and K17: each item's last line, or the line before the next numbered item, against the page markers. Six more ranges ran past the cited item, and are corrected (old → new):

| README | Old | New | Evidence |
|---|---|---|---|
| §4.11 | HT Proposition 2.1.6, pp.22–23 | Proposition 2.1.6, p.23, with its setting §2.1.5, pp.22–23 | Statement and proof at HT line 1036–1047, all after the p.23 marker (HT line 1028). The groups I_ℓ,s0 and maps i_ℓ it uses are defined in §2.1.5 (HT line 1011–1035, pp.22–23). |
| §4.12 | same | same | same |
| §5.2 | KZ §4.3.7–Lemma 4.3.8, pp.40–42 | pp.40–41 | §4.3.7 starts at KZ line 1770 (p.40). Lemma 4.3.8's proof ends at KZ line 1803 (p.41). Page 42 holds only the end of the proof of Proposition 4.3.6. |
| §5.3 | KZ Lemma 4.3.8, pp.40–42 | Lemma 4.3.8, pp.40–41, and the proof of Proposition 4.3.6, pp.41–42 | Two of the §5.3 claims are in the proof of Proposition 4.3.6 (KZ line 1804–1848): the integral map to G_1 through Corollary 4.3.4 (KZ line 1834–1838) and the neutral-component descent to G_2 (KZ line 1844–1848). That is a different item from the lemma, so it is now named. |
| §7.2 | KZ §5.1.2–5.1.3, pp.47–48 | p.47 | §5.1.2 starts at KZ line 2080. §5.1.3 ends at KZ line 2101, before the p.48 marker (KZ line 2102), and p.48 opens with Theorem 5.1.4. |
| §3.8 | KPZ Proposition 7.1.14, pp.75–77 | pp.75–76 | Statement at KPZ line 3317 (p.75), proof ends at KPZ line 3348 (p.76), and §7.2 starts at KPZ line 3349 (p.76). §3.10 already cites "Proposition 7.1.14(3), pp.75–76". |
| §3.5 | KP §4.6.5, Lemmas 4.6.6 and 4.6.9, pp.199–202 | pp.199–201 | Lemma 4.6.9 and its proof are at KP line 3242–3256, before the journal p.202 marker (KP line 3257). Page 202 holds Lemma 4.6.10, which §3.5 does not use. |

All other ranges were checked and are correct. Some ranges are deliberately wide and still correct, because the cited part lies within them:

- HT Theorem 1.3.14, pp.19–20 (proof crosses at HT line 894).
- HT Proposition 1.3.7, pp.17–18 (proof crosses at HT line 803).
- KZ Proposition 4.3.6 with §4.3.7–4.3.8, pp.40–42 (proof to KZ line 1848, p.42).
- KZ Theorem 4.1.11 and Remark 4.1.12, pp.32–33 (remark ends KZ line 1437, p.33).
- KZ §5.2.1, p.49, in the GeometricSatakeAndFusionPartII contract: the cited sentence is at KZ line 2160, p.49.
- KPZ §§7.2.2–7.2.3, pp.77–78 (§7.2.3 crosses at KPZ line 3420).
- KPZ Remark 7.1.9 at p.74 (ends before the p.75 marker at KPZ line 3279).
- K17 §2.1.2, p.29 and Corollary 2.1.7, p.31.

## Adversarial pass (changed text)

No statement, hypothesis, convention, Check or worked example changed. Only locators changed, so the pass is a locator pass: each row computes the pages of the cited item's first and last lines from the cached text.

| Locator | First line → page | Last line → page | Old range | Result | Change |
|---|---|---|---|---|---|
| HT Cor. 2.1.9 | HT 1095 → 24 | HT 1105 → 24 (p.25 marker at 1114) | 24–25 | too wide | p.24 |
| HT §2.1.8 | HT 1079 → 24 | HT 1094 → 24 | (new) | correct | added as p.24 |
| HT Prop. 2.1.6 | HT 1036 → 23 | HT 1047 → 23 | 22–23 | start page wrong | p.23, setting §2.1.5 pp.22–23 |
| HT §2.1.5 | HT 1011 → 22 | HT 1035 → 23 | (new) | correct | added as pp.22–23 |
| KZ §4.3.7–Lem. 4.3.8 | KZ 1770 → 40 | KZ 1803 → 41 | 40–42 | too wide | pp.40–41 |
| KZ proof of Prop. 4.3.6 | KZ 1804 → 41 | KZ 1848 → 42 | (new) | correct | added as pp.41–42 |
| KZ §§5.1.2–5.1.3 | KZ 2080 → 47 | KZ 2101 → 47 | 47–48 | too wide | p.47 |
| KPZ Prop. 7.1.14 | KPZ 3317 → 75 | KPZ 3348 → 76 | 75–77 | too wide | pp.75–76 |
| KP Lem. 4.6.6, 4.6.9 | KP 3179 → 200 (§4.6.5 at 3167 → 199) | KP 3256 → 201 | 199–202 | too wide | pp.199–201 |
| HT (1.1.3.1), Prop. 1.2.5 | HT 284 → 7; HT 648 → 14 | HT 285 → 7; HT 683 → 15 | README unchanged | correct | manifest only |
| KZ Def. 2.2.4, Rem. 2.2.5 | KZ 437 → 10 | KZ 443 → 10 (Lemma 2.2.6 at 444, p.10) | README unchanged | correct | manifest only |
| KP Lem. 3.1.17 | KP 2011 → journal 169 | — | README gives no page | correct | manifest only |

Each new "with ..." clause names an item that the README claim in that section actually uses:

- Conj′ and neatness for §4.13: HT line 1083–1094.
- The groups I_ℓ,s0 and the maps i_ℓ for §§4.11–4.12: HT line 1026–1035.
- The two integral maps for §5.3: KZ line 1834–1848.

## Checks

- **Elaboration.** I ran `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean` from the content checkout: exit 0, no output, no warning (6 s). The file is unchanged: one `import Mathlib`, one module docstring, the namespace, 0 declarations.
- **Signature comparison.** The `#check @name` comparison has 0 inputs: `Suggested.lean` declares nothing, and nothing changed.
- **Dependency direction.** I ran the prescribed `gate --depcheck … --movable` command. Output, exit 0:

  ```text
  depcheck: 244 roadmaps, 2257 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Manifest.** `sources.toml` parses as TOML. Its five entries keep their keys, URLs and hashes, and no key was added.
- **Sources.** I fetched no source and created no `needs-references.toml`: every text used is in the worker's cache.
- **Ownership.** No construction, target or citation of another roadmap was added, so there was no new ownership question.
- **Gate failures.** None were listed for this round.

## For the maintainer

- No name, section id, slug or supplier citation changed, so other roadmaps are unaffected. `design/plan.json` is unchanged.
- The review's verification table gives KP Lemma 4.6.9 as "pp.201–202 (KP line 3242–3256)". By the page marker at KP line 3257, those lines are all on journal p.201. The README now says pp.199–201 for §4.6.5 through Lemma 4.6.9.
- KZ `locator` still lists §3 inside "§§2.4, 3–5", but no README passage cites KZ §3. Recording an uncited section is not a defect, so I left it unchanged.
