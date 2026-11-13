# Repair of LocallyAnalyticRepresentationsOfLocalGroups (package, round 8)

There was one review with one finding, at P3. The finding is right and is applied. A search of the whole roadmap for the same defect found four more instances: a page locator that leaves out a page holding the cited proof or definition, or names a page that holds none of it. All four are repaired too: one more in Ding's 2025 paper, one in Ding's 2019 paper, one in Emerton's Jacquet II and one in Breuil–Herzig.

Only `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` changed, in seven parenthetical page locators. No statement, hypothesis, Check, id or heading changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. The manifest records theorem-scheme locators for DING25, DING19, EMJ2 and BH20, with no page that this round touched. No supplier gap was added, and no dependency edge changed.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~7/F01 (P3) — applied

The review's three repairs:
- **§4.5:** "arXiv v2 pp. 37 and 43" → "pp. 37 and 44".
- **§10.3:** "Lemma 3.15 and its proof, arXiv v2 p. 48" → "pp. 48–49".
- **§10.6:** "Proposition 3.19, (3.36) and its proof, arXiv v2 p. 50" → "pp. 50–51".

The same pattern elsewhere:
- **§8.1:** "Ding, §3.1.1, arXiv v2 pp. 36–37" → "Ding, §3.1.1, arXiv v2 pp. 35–36, §3.1.2, p. 37, and §3.1.4, p. 48".
- **§6.7:** "Ding 2019, … the proof of Proposition 2.27, arXiv v2 p. 29" → "pp. 29–30".
- **§7.4:** "Emerton, Jacquet II, … Theorem 0.13 and its sketch of proof, p. 4" → "pp. 4–5".
- **§8.7:** "Breuil–Herzig, Proposition 5.9 and its proof, pp. 27–28" → "p. 27".

**Verification of the review's witnesses.** The page markers of DING25 are page 43 at line 1704, 44 at 1752, 48 at 1930, 49 at 1966, 50 at 2000 and 51 at 2044.
- Lemma 3.10 is stated from DING25 line 1747, on p. 43. Its proof is DING25 lines 1761–1789, on p. 44. §4.5 uses the step at lines 1761–1765: the parabolic Verma multiplicity, on p. 44.
- Lemma 3.15 is at DING25 line 1962, on p. 48. Its proof runs from line 1964 to line 1973, so it crosses onto p. 49.
- Proposition 3.19 is at DING25 line 2027, on p. 50. Its proof is lines 2047–2052, on p. 51.

**The sweep.** I mapped every label, equation tag and end-of-proof mark of DING25 §3.1 (DING25 lines 1419–2066) to its page. I then compared every DING25 "arXiv v2" page locator in the README (40 of them) against that map, together with the two Ding locators without that tag (§§8.2, 8.3). Outside the review's three, one more is wrong, in §8.1:
- θ, θ^P and P_i are on p. 35 (DING25 lines 1421–1438). §3.1.1 begins at line 1421.
- The strictly dominant h and λ := h − θ are on p. 37, in §3.1.2 (DING25 line 1479).
- Hom_(σ,g′) is defined on p. 48, in §3.1.4 (DING25 line 1960).

So "§3.1.1, pp. 36–37" omitted p. 35 and p. 48, and attributed the p. 37 material to the wrong subsection.

I then checked every single-page locator in the README that cites a proof, and every multi-page one, in every source, against the page markers. Two more are short and one is too wide:
- **DING19.** Lemma 2.26 and its proof are on p. 29 (DING19 lines 1084–1097). Proposition 2.27 is stated on p. 29, but its proof is on p. 30 (DING19 lines 1104–1106). The page-30 marker is at line 1103.
- **EMJ2.** The sketch of the proof of Theorem 0.13 begins on p. 4 (EMJ2 line 158) and continues on p. 5 (EMJ2 lines 179–202). The p. 5 part contains Lemma 0.18, which gives the balanced subspace that §7.4 states.
- **BH20.** Proposition 5.9 and its proof are both on p. 27 (BH20 lines 1236–1260). Page 28 (from BH20 line 1261) starts §5.2, the global applications, and is not cited.

The following agree with the markers and are unchanged:
- **Breuil, socle I:**
  - proof of Lemma 2.2, p. 9 (line 388);
  - Lemma 2.2 with proof, pp. 9–10;
  - Proposition 2.4 with Corollary 2.5 and proof, pp. 10–12;
  - Proposition 2.4 and the proof of Corollary 2.7, pp. 11–12. The cited H⁰ formula is on p. 11, at line 441.
- **Dospinescu–Le Bras:**
  - proof of Lemme 5.9, p. 29;
  - Lemme 5.9 with proof, pp. 28–29.
- **Schneider–Teitelbaum:**
  - 2003, Lemma 3.9 with its proof, p. 14;
  - 2003, proof of Theorem 6.6, p. 36;
  - 2001, Proposition 3.4 with proof, pp. 13–14.
- **Pan:**
  - Lemma 2.2.2 with proof, p. 13;
  - Theorem 2.2.3 and Corollary 2.2.4 with proofs, pp. 13–14.
- **Boxer–Calegari–Gee–Pilloni:**
  - Lemma 2.2.24 with proof, p. 22;
  - Lemma 2.2.25 with proof, pp. 22–23.
- **Breuil, Ext¹:** Lemme 2.1.1 with proof, pp. 10–11.
- **Rodrigues Jacinto–Rodríguez Camargo:** Proposition 4.48 with proof, pp. 41–42.
- **Emerton, Jacquet II:** proof of Corollary 0.14, p. 69.
- **Breuil–Hellmann–Schraen:** Lemma 5.2.1 with proof, journal pp. 391–392. These are PDF pp. 93–94 of the Numdam copy, which begins at journal p. 299.
- **Breuil–Herzig:** Definition 5.7, pp. 26–27.

## Adversarial pass on the changed passages

No statement, hypothesis or Check changed, so there is nothing new to instantiate. The pass checks each changed locator against the page markers of the text it cites.

| Changed locator | Content cited | Source lines and page markers | Result |
|---|---|---|---|
| §4.5, Ding pp. 37 and 44 | Verma multiplicities used in the proofs of Proposition 3.1 and Lemma 3.10 | DING25 1501–1503 (p. 37, marker 1477); 1761–1765 (p. 44, marker 1752) | Agrees |
| §10.3, Ding pp. 48–49 | Lemma 3.15, dimension n + 1, and the exact sequence with Hom_σ(Z(L), E) | DING25 1962–1965 (p. 48); 1966 marker p. 49; 1969–1973 (p. 49) | Agrees |
| §10.6, Ding pp. 50–51 | Paragraph before Proposition 3.19; (1), (2), (3.36); proof | DING25 2025–2043 (p. 50, marker 2000); 2047–2052 (p. 51, marker 2044) | Agrees |
| §8.1, Ding §3.1.1 pp. 35–36, §3.1.2 p. 37, §3.1.4 p. 48 | θ, θ^P, P_i; w(φ), generic, δ_B, η; h, λ; Hom_(σ,g′) | DING25 1421–1438 (p. 35, marker 1385); 1466–1469 (p. 36, marker 1439); 1479–1482 (p. 37); 1960 (p. 48, marker 1930) | Agrees |
| §6.7, Ding 2019 pp. 29–30 | Lemma 2.26 (1)–(2) and proof; proof of Proposition 2.27 | DING19 1084–1097 (p. 29, marker 1066); 1104–1106 (p. 30, marker 1103) | Agrees |
| §7.4, Emerton pp. 4–5 | Theorem 0.13; sketch, (0.16)–(0.20), Lemma 0.18 | EMJ2 142–176 (p. 4, marker 135); 179–202 (p. 5, marker 177); folio "5" at line 178 | Agrees |
| §8.7, Breuil–Herzig p. 27 | Proposition 5.9 (i)–(ii) and proof | BH20 1236–1260 (p. 27, marker 1217); folio "28" on marker 1261 opens §5.2 | Agrees |

For DING25 and DING19, the cited arXiv versions are the ones extracted (arXiv:2407.21237v2 and arXiv:1807.10862v2). The page markers coincide with the printed folios: "DING25 line 1753, 44 YIWEN DING", and DING19 has folio "29" at line 1102 just before marker 30. The README's references already say that the DING25 locators are arXiv v2 pages.

## Checks

**Elaboration.** `lake env lean packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean` was run from the content checkout. It exited with code 0 and printed nothing. The file is unchanged. It has the single `import Mathlib`, the module docstring and the namespace, and no declarations. The `#check @name` comparison therefore has no input, and nothing changed.

**Dependency direction.** `tauceti-roadmap gate --depcheck … --movable` printed:

```text
depcheck: 223 roadmaps, 1981 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citation resolver lead.** The resolver lists "LocallyAnalyticDistributionsPartII §1.1" as found nowhere. That roadmap is on the board at `packages/LocallyAnalyticDistributionsPartII/README.md`, with §1.1 at line 141. It is line 199 of the merge order, before this roadmap at line 253. The lead is refuted, and this round did not touch the citation.

## Ownership and overlap

The overlap tool now lists PadicHodgeParametersInLocallyAnalyticRepresentations as the closest open roadmap (vocabulary 0.31). It is line 260 of the merge order, after this roadmap.

Its Scope and ownership section imports this roadmap's Layers 0–1, §4.1, §§6.1–6.2, §§7.1–7.3, §§8.1–8.14, §§9.1–9.7 and §§10.1–10.7 by name and section. It owns only the comparison with trianguline deformations (Ding §3.2) and what is built on it. So nothing is owned twice, and the supply runs one way.

That roadmap does not cite the page locators changed here. No other open pull request changes this roadmap, and no cited id is dropped.

## For the maintainer

- No id, heading, target or Lean name changed, so no roadmap that cites this one is affected.
- The review's "For the human reviewers" items (the p > 3 hypothesis outside type A, SpringerResolutionAndCharacteristicCycles §10.4, and the three preprint sources) list no finding, and nothing was changed for them.
- No source was fetched and `needs-references.toml` was not written.
