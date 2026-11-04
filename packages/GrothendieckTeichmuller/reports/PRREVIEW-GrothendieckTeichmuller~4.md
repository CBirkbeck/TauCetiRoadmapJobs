# Review of GrothendieckTeichmuller (pull request #1058 at 3ba2400)

**Verdict:** accepted

Incremental re-review of the 28 changed lines since 70b2046 (README only: one Scope paragraph on
Brown 2012/2014 and Hatcher–Lochak–Schneps 2000, with Grothendieck 1984, and four References
entries; `Suggested.lean` unchanged). Gate run on this head: OK (every check passed; depcheck=0,
set_option=0, prnum=0, tex=0, residue=0, readme-ids-missing=0, stray-files=0, outside-folder=0).
Dependency check on this head (`gate --depcheck … --movable`): `depcheck: 205 roadmaps, 1418 edges,
0 problem(s)`, no UPWARD or CYCLE line; the merge order lists GrothendieckTeichmuller at line 368.
The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckTeichmuller'`)
is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. Elaboration of
`Suggested.lean` with `lake env lean` at the pins: exit 0, fifteen `declaration uses sorry` warnings
(lines 98, 102, 106, 110, 114, 130, 167, 201, 205, 219, 242, 250, 272, 277, 283) and nothing else.
No P1 or P2 finding; three P3 notes, two of them carried from the previous review.

## R01 (P3) — Scope: Brown's theorem is stated by PeriodsAndSpecialValues Layer PS.9; name the owner

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` lines 57–60: "Neither is their motivic
counterpart: Brown 2012 proves that the motivic Galois group of the mixed Tate motives over `ℤ`
acts faithfully on the motivic fundamental groupoid of `ℙ¹ ∖ {0, 1, ∞}` (Brown 2012, §1,
Conjecture 1, deduced from Theorem 1.1 at the end of §7.2 …)".

Claim: the sentence defers the motivic theory with a citation of the paper only.

Witness: PeriodsAndSpecialValues (earlier in the merge order, line 296) states the whole chain:
`MT(ℤ)` and its fibre functor (§PS.9.8), the motivic Galois group `𝔾_m ⋉ U_MT` (§PS.9.9), the
motivic path torsor of `ℙ¹ ∖ {0, 1, ∞}` (§PS.9.10), Brown's motivic multiple zeta values and
coaction (§§PS.9.11–9.12) and the Hoffman basis with `H = H_MT^+` (§PS.9.22, citing Brown
Theorem 1.1 and Theorem 7.4). `H = H_MT^+` is exactly the equality from which Brown 2012 deduces
Conjecture 1 (brown12 line 941). The Scope section's rule is to name the roadmap and section that
owns a deferred object.

Repair: after "Neither is their motivic counterpart" add "(mixed Tate motives over `ℤ`, their Galois
group and the motivic path torsor are stated in PeriodsAndSpecialValues §§PS.9.8–9.10 and Brown's
basis theorem in §PS.9.22)". The faithfulness statement and the Deligne–Ihara consequence are not
stated there, so their attribution to Brown 2012, §1 stays as written.

## R02 (P3) — 4.5: the locator for "profinite" (carried from the previous review's R01)

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` lines 621–622: "*Source:* `GT̂` as a
profinite group of automorphisms of `F̂₂`: Lochak–Schneps 1994, §1; Harbater–Schneps 2000, §0."

Claim: the two cited passages say that `GT̂` is a profinite group of automorphisms of `F̂₂`.

Witness: unchanged since the previous review: harbaterschneps00 lines 71–75 give `GT̂₀`, `GT̂` as
sets of pairs with "a natural group structure", no topology; lochakschneps94 §1 (lines 16–155) never
calls `GT̂` profinite. The route the roadmap uses (inverse limit of the images in `Aut(F̂₂/N)`, `N`
characteristic open) is Schneps 1997, §1.3, remark (3), printed pp. 189–190 (schneps97 lines
278–284); Ihara 1991, §3.3 (ihara91 lines 9635–9638) defines `GT̂` inside `Aut F̂₂`.

Repair: "*Source:* `GT̂` as a group of automorphisms of `F̂₂`: Ihara 1991, §3.3; Harbater–Schneps
2000, §0; `GT̂` profinite as the inverse limit of its images in `Aut(F̂₂/N)`: Schneps 1997, §1.3,
remark (3)."

## R03 (P3) — style: an unwrapped line and a manifest status word in the prose (carried from the previous review's R02)

- README line 622 is 137 characters long (every other line of the file is at most 100): the
  sentence "Prove `GTHat.isClosedEmbedding_betaEquiv`: …" sits on the *Source:* line. Start it on a
  new line and wrap.
- README line 203 ("Ribes–Zalesskii 2010, §9.1, uncertified") and line 673 ("Uncertified: paywalled
  book, cited by locator"): `uncertified` is the manifest status of a citation, not a word of the
  mathematics; no README on main uses it. Cite by locator in the prose and the References and record
  the status in `sources.toml` when the manifest is created. Herfort–Ribes 1985, proof of Theorem C′,
  printed p. 160 (herfortribes85 lines 258–260) is a readable locator for the same decomposition and
  may be cited beside it.

## Previous findings

- R01 — not repaired: README lines 621–622 still read "*Source:* `GT̂` as a profinite group of
  automorphisms of `F̂₂`: Lochak–Schneps 1994, §1; Harbater–Schneps 2000, §0." (P3; R02 above.)
- R02 — not repaired: line 622 is still 137 characters; "uncertified" still at lines 203 and 673.
  (P3; R03 above.)

## Verified sound

**The changed passage (README lines 57–74), against the texts.** Brown 2012 (brown12 = arXiv
1102.1312v1): Conjecture 1 is that `G_MT ↠ G_MT′` is an isomorphism, `G_MT′` the Galois group of the
subcategory generated by the motivic fundamental group of `ℙ¹ ∖ {0, 1, ∞}` (lines 13–17); since
`MT′(ℤ)` is a full Tannakian subcategory the map is onto, so the conjecture is the faithfulness of
the action, as the README says. Lines 18–20: Conjecture 1 implies the Deligne–Ihara conjecture on the
outer action of `Gal(ℚ̄/ℚ)` on the pro-`ℓ` fundamental group (the README's "hence … (Brown 2012, §1,
after Conjecture 1)"). Theorem 1.1 (lines 38–40, the Hoffman basis) "yields conjecture 1" (lines
41–42); the deduction is at line 941, the last sentence of §7.2 before "8. Remarks" (line 942): "The
equality `H = H_MT^+` implies conjecture 1", so "deduced from Theorem 1.1 at the end of §7.2" is
exact. Brown 2014 (brown14 = arXiv 1407.5165v1): Theorem 1.2, line 59, "`G_dR` acts faithfully on the
de Rham realisation of `π₁^mot(X, →₁₀, −→₁₁)`"; lines 27–28, the image of `Gal(ℚ̄/ℚ) → Aut(π̂₁(X))`
"remains completely open to this day"; lines 29–31, the talk treats the pro-unipotent completion
rather than the profinite one. Hatcher–Lochak–Schneps 2000 (hls00, the authors' preprint from
Schneps's page, OCR plus a rendered page 4): the Definition (lines 128–133, rendered page 4) takes
`f` in the derived subgroup of `F̂₂` with `x ↦ x`, `y ↦ f⁻¹ y f` extending to an automorphism and
satisfying (I) in `Γ̂₁¹`, (II) in `Γ̂₀⁴`, (III) with five loops `β₁ … β₅` (figure 1(c); the group label
is hidden by the figure in the rendering, consistent only with `Γ̂₀⁵`); Remark 1 (lines 139–147)
identifies this set with the elements `(λ, f) ∈ GT̂` with `λ = 1`; `Λ` is the subset cut out by one
relation (R) "taking place in `Γ̂₁²`" (lines 148–150, rendered). Theorem A "(Lemma 7 of §3) `Λ` is a
subgroup of `GT̂¹`" (line 154; Lemma 7 line 699). Theorem B "(Theorem 4 of §3)" (lines 162–171;
Theorem 4 lines 547–558): for each pants decomposition a homomorphism `Λ → Aut(Γ̂(Σ))` with the
three local properties, the induced `Λ → Out(Γ̂(Σ))` independent of the decomposition and landing in
`Out*(Γ̂^m_{g,n})`, the outer automorphisms preserving the conjugacy classes of Dehn twists (lines
187–188). Theorem C "(Theorem 5 of §3)": an injection `Λ → Out*(T̂)` for the tower of all
`Γ̂^m_{g,n}` with the subsurface-inclusion homomorphisms (lines 174–185, 205; Theorem 5 line 563).
Theorem D "(Theorem 2 of §2)": the maximal multicurve complex is simply connected (line 213; Theorem
2 line 309). Theorem 1 "([G] Thm. A, [FL])", the Gervais–Luo presentation by all Dehn twists with
relations (C), (B), (D), (L) (lines 241–244). Grothendieck 1984 (esquisse84, the French text from
Schneps's Grothendieck-circle page): §2, printed p. 11 (lines 193–198): the whole tower is
reconstituted from the first two levels, those of modular dimension `N = 3g − 3 + ν ≤ 2`, level 1
giving generators and level 2 relations; line 271 names `M_{0,5}` and `M_{1,2}` as modular dimension
2. The README's notation `Γ̂^m_{g,n}` (subscript `g, n`, superscript `m`) is HLS's (line 123: type
`(g, n, m)`, `g` genus, `n` punctures, `m` boundary components).

**References entries.** Crelle 521 (2000), 1–24; Ann. of Math. 175 (2012), 949–976 with its DOI and
arXiv id; ICM 2014 with arXiv 1407.5165; Esquisse in Geometric Galois Actions 1, pp. 5–48 and the
translation pp. 243–283: bibliographic data consistent with the texts' headers and the standard
citations; the two arXiv ids resolve to the papers read.

**Consistency with the rest of the roadmap.** The new paragraph introduces nothing the layers use:
`GT̂¹`, `Λ`, `Γ̂^m_{g,n}`, `G_MT` and `π₁^mot` occur only in Scope (grep); the boundary sentence
(lines 76–78) still excludes Galois groups, curves and configuration spaces, which covers the
mapping class group tower and the motivic groupoid. HLS's `GT̂¹` is the fibre of `χ` (4.1) over
`λ = 1`, and its membership condition `f ∈ F̂₂'` is the condition the roadmap's `GT̂^{mon}` (3.3)
imposes; the README does not restate HLS's relations, so no convention is compared.

**Ownership.** `roadmaps grep` over main and the 433 open roadmap pull requests: "Teichmüller tower"
returns only this roadmap and ColemanPowerSeries (Teichmüller lifts, unrelated); "Hatcher, P. Lochak"
only this roadmap; "Mixed Tate motives over" this roadmap and PeriodsAndSpecialValues §PS.9.8 (R01);
"Deligne–Ihara" only this roadmap. Nothing on main or in an open pull request states `Λ`, `Out*(T̂)`
or the faithfulness theorem, so the deferral paragraph names no second owner except the one in R01.

**Gate, dependency check, elaboration.** As in the header: gate OK on this head, depcheck 0
problems, `lake env lean` exit 0 with the fifteen sorry warnings. `Suggested.lean` is byte-identical
to the file the previous review read (the diff touches only `README.md`), so the 43 elaborated
signatures of `signatures.md` (0 with a lost binder) and the previous review's statement-by-statement
comparison with the README stand; `#check` was not rerun on an unchanged file.

**Adversarial table.** Rows for the statements the diff leaves untouched are carried from the
previous report (marked "r3", values there); rows for the changed passage give values computed now.

| statement | instances | values | result | change |
|---|---|---|---|---|
| Scope: Brown Conj. 1 ⇔ faithfulness | `G_MT ↠ G_MT′` | `MT′(ℤ) ⊆ MT(ℤ)` full Tannakian ⇒ surjective; iso ⇔ trivial kernel ⇔ faithful on `π₁^mot` | as stated | none |
| Scope: Brown's deduction | `d_N = d_{N−2} + d_{N−3}`, `d_0 = 1, d_1 = 0, d_2 = 1` | `d_3..d_7 = 1, 1, 2, 2, 3`; `{2,3}`-words: wt 5 `{23, 32}` = 2, wt 6 `{222, 33}` = 2, wt 7 `{223, 232, 322}` = 3 | `#basis = d_N`, `H = H_MT^+` (brown12 932–941) | none |
| Scope: `GT̂¹` = `λ = 1` slice | `(1,1)`, `(−1,1)`, `(1,[y,x])` | `(1,1) ∈ GT̂¹`; `(−1,1) ∈ GT̂` (r3), `λ ≠ 1` so `∉ GT̂¹`; `(1,[y,x]) ∉ GT̂` (fails (II), r3) so `∉ GT̂¹` | consistent with 3.3, 4.1 | none |
| Scope: HLS relation groups vs Esquisse levels | `(g,n,m)` of `Γ̂₁¹, Γ̂₀⁴, Γ̂₀⁵, Γ̂₁²` | modular dimension `3g−3+n+m`: `(1,0,1) → 1`, `(0,0,4) → 1`, `(0,0,5) → 2`, `(1,0,2) → 2`; `(2,0,0) → 3` excluded | all `≤ 2`, as the last sentence says | none |
| Scope: Theorem B at a degenerate surface | `(0,0,3)` | `Γ₀³ ≅ ℤ³` on boundary twists; `F_P(a) = a` for `a ∈ P` ⇒ trivial action; `Out*` condition vacuous | consistent with "for all `g, n, m ≥ 0`" | none |
| Scope: Hatcher's cycles vs levels | 3A, 5A, 3S, 6AS | live in `(0,4)`, `(0,5)`, `(1,1)`, `(1,2)` (hls00 arXiv companion lines 47–77) = exactly levels 1–2 | matches "generators at level 1, relations at level 2" | none |
| Conventions law, Drinfeld (4.11), 0.1 (two rows), 1.3, 3.2, 3.3, 4.3 (two rows), 4.5 (four rows), 2.4 Check 3 | as in the previous report | values as in the previous report's table (r3) | sound (r3) | none |
| `subst`, 0.2–0.4, 1.1, 1.2, 1.4, 1.5, 2.1, 2.3 Check 3, 2.4 Check 2, 3.1, 3.2 Check 2, 3.3 units, 3.4, 3.5, 4.1, 4.2, 4.4, Scope HMM | as in the r2 report | values there (r2, carried through r3) | sound (r2) | none |

**Seeded sample.** None of the sampled targets (0.2, 0.4, 1.1, 1.2, 1.5, 2.1–2.4, 3.1–3.3, 3.5, 4.3,
4.5) is touched by the diff; they stand as verified in the previous two reviews (locators in
guillot14, schneps97, lochakschneps94, drinfeld90, ihara91, harbaterschneps00, herfortribes85).
4.5's locator note is R02.

**Padding and headlines.** `Suggested.lean` unchanged: the previous one-tactic probe and headline list
apply (five headlines stated; 3.5 named as not a headline in the docstring, lines 36–39).

## Not verifiable

- Hatcher–Lochak–Schneps 2000: read in the authors' preprint (Schneps's page, 27 pages), not the
  Crelle pagination; the theorem and lemma numbers quoted above are the preprint's, which the
  README's citations (Theorems A–D, §3 Lemma 7, Theorems 4–5, §2 Theorem 2, §1 Theorem 1) match.
- Brown 2012: read as arXiv 1102.1312v1; the §7.2 label and Theorem 7.4 are that version's. The
  Annals pagination was not checked.
- Grothendieck 1984: the French text read; the English translation's pages (243–283) not checked.
- Ribes–Zalesskii 2010 §9.1, Ihara 1994, Belyi 1979, Montpellier folder 145: as in the previous
  reviews, none touched by this change.

## Source issues

- none at the locators checked this round (brown12 §1 and §7.2, brown14 §1, hls00 §1–§3 statements,
  esquisse84 §2); the previous reviews' entry on guillot14 Lemma 5.19 stands.
