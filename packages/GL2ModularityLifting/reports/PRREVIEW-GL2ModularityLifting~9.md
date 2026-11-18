# Review of GL2ModularityLifting (pull request #1071 at 308c1fa)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings. Khare–Wintenberger's Theorem 4.1, Kisin's potentially Barsotti–Tate theorem and Hypothesis (H) are stated here as this roadmap's own while ClassicalSerreModularity, earlier in the merge order, states and owns the same theorems; the Summary's dyadic theorem omits total oddness of the lift; and the statements of §5.18 and §6.16 reproduce the wording of the source's theorem. There are four small corrections and one format note, none blocking, and two points for a human to decide.

The previous review, of `038e4ea`, had no finding, so there is nothing to check as repaired.

## R01 (P2) — Theorem 4.1 of Khare–Wintenberger, Kisin's potentially Barsotti–Tate theorem and Hypothesis (H) have two owners

An implementer cannot tell which roadmap proves these theorems, and a consumer cannot tell which statement to cite. ClassicalSerreModularity (#1020, line 182 of the merge order, before this roadmap at line 185, and a supplier here) states them as its own targets at its head. Its `I.2/potentially-barsotti-tate-lifting` (its README line 419) is, for odd p over a totally real field, the statement of §5.7 here with the same hypotheses, including the `p = 5`, `PGL₂(𝔽₅)` clause; over `ℚ` it is §5.11; and at `p = 2` it is Hypothesis (H), §6.10. Its `I.2/classical-modularity-lifting` (line 405) is Theorem 4.1 of Khare–Wintenberger I at odd p and at 2, which is §5.18 and §6.16 here, with a route through the same patching over an allowable base change. Its "Owned here" (line 664) lists "the potentially Barsotti–Tate lifting theorem with Hypothesis `(H)`, and Khare–Wintenberger's Theorem 4.1 in I.2".

This README never names either target. Scope (line 2783) says this roadmap owns "the lifting theorems with their exact hypotheses", the Summary lists the same theorems among its main results, and the only acknowledgement is that §§5.18 and 6.16 are "compared" with "the classical application contract of ClassicalSerreModularity §I.2" (lines 1274, 1654, 2833). At that head §I.2 holds full theorems with their own proofs, not application contracts.

The smallest change: in §§5.7, 5.11, 6.10, 5.18 and 6.16 name the ClassicalSerreModularity target that states the theorem, and either import it, as §5.16 imports `I.2/same-weight-crystalline-lifting`, or say in one clause how the statement here differs; then list these theorems in Scope and in the Summary as that roadmap's. The section numbers can stay, so the citations of ModularityAndLanglandsExtensions (§5.7) and PotentialModularityAndCompatibleSystems (§§5.18, 6.16) keep working. What ClassicalSerreModularity does not state remains this roadmap's own: Theorem 9.7 under `(α)`/`(β)` over F (§§5.4, 6.15), Kisin's (3.5.7) (§5.10), the 2-adic theorem over totally real fields (§6.9), §5.8 and Layers 1–4. If this roadmap is meant to be the owner instead, that is a change to ClassicalSerreModularity, which cannot cite a later roadmap.

## R02 (P2) — The Summary's theorem at p = 2 omits the hypothesis that the lift is totally odd

A reader of the overview takes away a theorem that no layer proves. Line 7 says: "At `p = 2`, with `2` split completely, the same holds when the residual image is not solvable (Tung)", where "the same" is modularity up to twist of a residually modular, potentially semistable lift with distinct weights. For odd p residual modularity makes the lift odd; at 2 it does not: `diag(1, −1)` and the identity have the same reduction modulo 2 and determinants −1 and +1. §9.2 (line 2145) and Tung's Theorem 8.0.3 require `det ρ(c_v) = −1` at every real place, and the Conventions (line 21) say that "oddness of a 2-adic lift is always a hypothesis on the lift". A modular representation is totally odd, so the sentence as written also asserts that no even lift of this kind exists.

The smallest change: "At `p = 2`, with `2` split completely, the same holds for totally odd lifts when the residual image is not solvable (Tung)."

## R03 (P2) — The statements of §5.18 and §6.16 reproduce the source's theorem almost word for word

The roadmap is published under the project's licence, and its statements are to be in its own words. The second sentence of §5.18 (line 1260) shares with Theorem 4.1(2) of Khare–Wintenberger I (kw1 lines 274–277) a run of 12 consecutive words and then a run of 27 tokens covering both cases and the conclusion. The statement of §6.16 (line 1642) shares runs of 13 and 15 words with Theorem 4.1(1) (kw1 lines 270–273) and differs from the source's sentence in about five words, keeping its phrase about "the latter case". A scan of every README line against the seventeen source texts I could read found no other shared run of this length outside the bibliography.

Reworded statements with the same content:

- §5.18: "Let p be an odd prime and `𝔽` a finite field of characteristic p. Suppose `ρ̄ : G_ℚ → GL₂(𝔽)` is modular and remains absolutely irreducible on `G_{ℚ(μ_p)}`. Then a finitely ramified p-adic lift `ρ` of `ρ̄` is modular in each of two local situations at p: (i) `ρ` is crystalline of weight k with `2 ≤ k ≤ p + 1`; (ii) `ρ` has weight 2 and is potentially semistable."
- §6.16: "Suppose `ρ̄ : G_ℚ → GL₂(𝔽)`, with `𝔽` finite of characteristic 2, is modular and its image is not solvable. Then a finitely ramified odd 2-adic lift `ρ` of `ρ̄` is modular if at 2 it has weight 2 and is crystalline, or has weight 2, is semistable and `k(ρ̄) = 4`."

## C01 — LC is carried as a hypothesis at p = 3, but the cited supplier target proves it for every odd p, and no target here uses it at p = 3

Consumers are told to assume LC for the Pan alternatives (Downstream consumers, line 2763) although nothing is left to assume. Four passages say that ClassicalSerreModularity `R33.1/twist-two-vanishing` covers `p ≥ 5` and totally real L (the Summary, line 9; the contract, line 2831; "so LC is a hypothesis here only at `p = 3`", line 2956; line 2833). At that roadmap's head the target reads "Let `p` be odd … let `L` be a number field" (its README line 614), and its own Check computes the case `p = 3`, `S = {3, 7, ∞}`. Separately, the only sections whose proofs use LC are §§10.11–10.13, each stated for `p ≥ 5`; at `p = 3` the cyclotomic branch is excluded in §10.14.

The smallest change: describe the supplier target as it reads (every odd p, every number field), and replace "Assume hypothesis LC" in §§7.3, 10.11–10.15, 12.3 and 12.6–12.8 by a citation of that target, or say why LC should remain a hypothesis.

## C02 — §10.14 names LC as its hypothesis and none of the completed-cohomology hypotheses its route uses

A reader takes Pan's nonordinary theorem over totally real fields to be conditional on LC alone. §10.14 opens "Assume hypothesis LC" (line 2476) and its *Needs:* line names no CC hypothesis, yet its route applies §10.6 (CC2–CC4), §10.10 (CC2) and "nonordinary classicality" (CC3), and its case `F = ℚ`, §10.15, opens "Assume CC1–CC5 and LC". Opening §10.14 with the same list, and adding the CC hypotheses to its *Needs:* line, would make the two agree.

## C03 — Scope still names Breuil–Conrad–Diamond–Taylor among the sources that organise the roadmap

The first sentence of Scope and ownership (line 2783) lists "Breuil–Conrad–Diamond–Taylor" with Khare–Wintenberger II, Kisin's papers and Gee's survey. This head removed the type-sensitive sections (former §5.2 and §§5.12–5.15); no section cites that paper and it is no longer in the References. The sentence describes an earlier state of the text; deleting the name makes it current. The same sentence would also read better as a statement of what is owned than as "as … organise it", since the layers are the roadmap's own.

## C04 — The pull request's description still lists a dropped supplier and describes the modern strand as stated over ℚ

The generated depends-on block lists "#913 ModularCurvesPartII"; this head cites that roadmap nowhere (its contract went with the type-sensitive sections), so the block should be regenerated. The prose says "The modern strand over `ℚ` states the four lifting branches … as separate theorems"; at this head the de Rham, dyadic and nonordinary residually reducible theorems are stated over totally real fields (§§8.7, 9.2, 10.14) and the statements over `ℚ` are their corollaries, as the summary block above the prose already says. A sentence that would be right: "The modern strand states the de Rham lifting theorems over totally real fields, with the four branches over `ℚ` used by Dieulefait–Pacetti as corollaries."

## N01 — §5.3 attributes the irreducibility hypothesis to Gee's Proposition 4.25, which does not state it

"impose that `ρ|G_{F′}` is irreducible, as in Gee Proposition 4.25" (line 1043): the proposition is printed without that hypothesis (gee-mlt line 1419); it is the roadmap's addition, needed for the Schur step. "which Gee Proposition 4.25 leaves implicit" would be accurate.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.4 (sample) | type (A), `k = 2`; `p = 3`, `Nv ≡ −1` | weights {0,1}; signs {1,−1} have one residue, excluded by §1.1; kw2 lines 2794–2809, 3731–3746 | sound | none |
| §1.9 (sample) | arithmetic against geometric Frobenius | `X² − T_vX + N(v)ψ(π_v)` (kw2 lines 3708–3711); geometric inverts both roots | sound | none |
| §2.4 (sample) | `Q = ∅`; `p = 2` | recovers §1.5; kw2 lines 3720–3728, 3749: `tr Frob_v ↦ T_v`, `γ_{α_v}(π_v) ↦ U_v`, twist-compatible at 2 | sound | none |
| §3.4 (sample) | `h = 0`; `|S| = 1` | `R_∞ = R̄^□`; `j = 3`; kw2 lines 3763–3773 match (I)(1)–(2) | sound | none |
| §5.1 (sample) | Kisin (3.5.4), published text | five clauses matched: pBT, determinant, weight two, not special, ordinarity equivalence (printed pp. 1169–1170) | sound | none |
| §6.13 (sample) | `t = 0`, `t = 1` | trivial torsor; degree 2, at most two components; `χ·y_i = χ(δ_i)(1+y_i) − 1` (kw2 lines 4026–4046) | sound | none |
| §7.10 (sample) | `p = 3`; `p = 2`; `ℤ × ℤ` | `−1 ≠ 1` in `𝔽₃`; `diag(1,−1) ≡ I`; determinant `(−1, 1) ≠ −1` | sound | none |
| §8.1 (sample) | irreducible lattice reduction | one step, `N_1 = M_∞/π`; kisin-fm lines 2046–2052, 2126–2137 (published numbering) | sound | none |
| §8.2 (sample) | `R = ∅`; `R = S∖Σ_p` | rank 1; rank `2^{|R|}` (gee-kisin lines 1859–1876, 1883–1898) | sound | none |
| §10.3 (sample) | the four incidence Checks | good sets: all; none; all three; first only; pan lines 5191–5198 | sound | none |
| §10.5 (sample) | `y² = x³ − x` at 7 | `#C(𝔽₇) = 8`; `ω₇⁶ = 1`; `ω₂⁶` has order 4 on `ker ω`; pan lines 5555–5588, five hypotheses matched | sound | none |
| §10.7 (sample) | `d = [F:ℚ]`; `d = 1` | `h¹ − h² = 3d − d = 2d`; `dim ≥ 2`, component `≥ 3`; pan lines 5024–5040 | sound | none |
| §10.9 (sample) | dimension count; sign convention | `1 + 2d + 2d − 3d = 1 + d`; sub `ε`, quotient 1: `1 > 0` here, `−1 < 0` in Pan; pan lines 3172–3175, 4179–4213, 5156–5180 | sound | none |
| §10.12 (sample) | `d = 4`, `d = 1`; `k[[a,b,c,d,z₁..z₆]]/(ab,cd)` | `7 > 5`; `1 > 2` fails; four components of dimension 8, pair meets in 6, partitions in 7; pan lines 5405–5416 | sound | none |
| §11.1 (sample) | twist by Teichmüller lift `η` of `β̄` | characters `ᾱβ̄⁻¹, 1`; determinant `(ψη⁻²)ε^{k−1}`; sw99 lines 93–98 | sound | none |
| `odd_involution_descent` | trivial group; `χ₁ ⊕ χ₂`; `c = 1` | `2+2−4−4−4+8 = 0`; identity sums to 0; `T(1) = 2 ≠ 0`; entries need no inverse of a variable | sound | none |
| `cht_soluble_prescribed_completions` | `S = ∅`; all `L_v = F_v`; complex v | `E = F`; `n = [E:F]`; `L_v = ℂ` forced; cht lines 5723–5726 | sound | none |
| §5.4, §6.15 | hypotheses of Theorem 9.7; 11a1 at 3 | kw2 lines 4075–4084 matched; image `GL₂(𝔽₃)`, `SL₂(𝔽₃)` irreducible | sound | none |
| §5.7 | Kisin (3.5.5), published text | three conditions matched, including `p = 5`, `PGL₂(𝔽₅)` | sound; owner | R01 |
| §5.18, §6.16 | Theorem 4.1 of kw1, lines 267–277 | hypotheses matched; shared runs 12 + 27 and 13 + 15 words | sound; wording, owner | R01, R03 |
| §6.10 | Hypothesis (H), kw1 lines 782–787 | `χ₂(c) = −1`, `det ρ(c) = −1` give `ψ(c) = 1` | sound; owner | R01 |
| §8.7 | Tung Theorem 4.7 | tung-odd lines 765–770: three hypotheses matched, `p = 3` included | sound | none |
| §9.2 and Summary line 7 | `diag(1,−1)` against `I` modulo 2 | equal reductions, determinants −1 and +1; §9.2 has total oddness, the Summary does not | Summary overclaims | R02 |
| §10.14 | Pan Theorem 7.1.1 | pan lines 4995–5009: five hypotheses matched; route uses CC2–CC4 through §10.6 | sound; header | C02 |
| LC | supplier target at `p = 3`, `S = {3,7,∞}` | integral `H²` is `ℤ/3`, divisible limit 0; target stated for odd p, README says `p ≥ 5` | README narrower | C01 |
| §4.4 Check | `R = 𝒪[[x,y]]/(xy, x(x−π))` | minimal primes `(x)`, `(y, x−π)`, dimensions 2 and 1; `M/π` has full support | sound | none |
| §6.7a | Kisin's parameters; `ℤ₂[[x]]/(x(x−2))` | `g = 2h+1`, `dim C = h+j+1`; `M ⊗ B = ℤ₂ ⊕ 𝔽₂` | sound | none |
| §10.7a Check | `F = ℚ`, `p = 3`, `S = {3,7}` | pro-3 quotient of `ℤ₃ˣ × ℤ₇ˣ` is `ℤ₃ × ℤ/3` | sound | none |
| §3.1, §3.2 Checks | `s=1, p=3, m=2, h+j=1`; `b=2, r=3`; `h=1, p=2, a=2` | `r_m = 18`; degree 6 forces an exponent `≥ 3`; level 5 gives exponent 8 | sound | none |
| §7.11, §12.3, §1.8, §5.3 Checks | `−2` in `ℤ₃`; `V₅(11a1) ⊗ ε`; `ℚ(√11)`; `ℚ(√6)` | `−2 ≠ ±4^m`; `ω ⊕ ω²`, weights {1,2}; `11 ≡ 1 (5)`, `≡ 2 (3)`; `−2` a square in `ℚ₃` | sound | none |

- Source locators read at the text: 39 in 10 sources (kw2 6, kw1 2, pan 13, dp 4, sw99 1, cht 1, gee-mlt 3, gee-kisin 5, tung-odd 2, kisin-fm 2), and 2 in Kisin's Annals paper in its published text.
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 20, each at the file the contract names (for example `PrimeSpectrum.comap`, `Mathlib/RingTheory/Spectrum/Prime/RingHom.lean` line 33; `oddPrimeDiscriminant`, `TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean` line 51).
- Cross-roadmap citations resolved at heads or on main: 9 roadmaps, 36 ids, among them ClassicalSerreModularity's seven targets, IntegralIwasawaTheory §§4.1, 4.4, OrdinaryAutomorphicFormsAndModularityLifting §§5.1a, 5.3, 5.8, 5.9, GlobalGaloisDeformations §§6.7–6.8. No roadmap cites the removed §5.2 or §§5.12–5.15.
- Automatic checks: all passed. Dependency check: `depcheck: 210 roadmaps, 2277 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 48, 87) and nothing else. No `variable` block; the elaborated types equal the signatures in the file. Padding was decided by reading: neither theorem closes in one tactic, and the three definitions only make §1.7 statable.
- Headline theorems: Theorem 9.7 (§§5.4, 6.15), Theorem 4.1 (§§5.18, 6.16), Hypothesis (H), Kisin's theorems, §5.8, §§8.7, 9.2, 10.14 with their cases over `ℚ`, Layer 12. None is statable at the pins; the docstring names the missing carriers. Stated: §0.1 and §1.7.

Overlap check: read ClassicalSerreModularity, SerreModularityByCompatibleSystems, CompletedCohomologyAndLocalGlobalCompatibility, PotentialModularityAndCompatibleSystems, GlobalGaloisDeformations, SerreWeightAndLevelOptimisation; shared: Theorem 4.1, Kisin's potentially Barsotti–Tate theorem and Hypothesis (H), owner ClassicalSerreModularity §I.2 (R01); twist-two vanishing, owner ClassicalSerreModularity R33.1, cited; Pan's Theorem 4.1.7, owner CompletedCohomologyAndLocalGlobalCompatibility, carried here as CC4.

Source independence: 9 passages compared by hand with 6 sources and every README line scanned against 17 texts for shared runs of 11 words; two shared, §5.18 and §6.16 with kw1 (R03); largest share kw2, 58 of 188 locators; contents compared with kw2: independent (Layers 1–6 do not map onto its §§2–10 in order).

Research link: Layers 1–6 are the lifting theorems of Khare–Wintenberger (2009) and Kisin (2009) behind Serre's conjecture; Layers 7–12 are those of Kisin (2009), Hu–Tan (2015), Tung (2021), Pan (2022) and Skinner–Wiles (1999) that Dieulefait–Pacetti (2023) use. Rests on the README summary and on kw1, kw2, dp, pan, tung-odd.

## Not verifiable

- Kisin, Modularity of 2-adic Barsotti–Tate representations, and Kisin, Modularity for some geometric Galois representations: no text in the sources cache and none in the manifest; their statements were checked only through kw1, kw2 and the README's own cross-references.
- The page numbers the README gives for Kisin's author DVI files (§5.1, pp. 72–73; §8.1, pp. 40–41 and 44–45): only the published texts were readable, where the passages are at printed pp. 1169–1170 and at (2.2.12)–(2.2.15).
- Lichtenbaum, Proposition 9.6; Paškūnas, Montreal functor, Corollary B.20; Gee, Automorphic lifts of prescribed types, Theorem 4.6.9: not opened this round; no remark depends on them.
- Supplier and consumer heads were read through the roadmap tools' dumps; the README line numbers given for other roadmaps are those of their files at the heads named.

## Source issues

- **Gap** in gee-mlt at Proposition 4.25, p. 29: the source says modularity of a continuous representation descends along every finite solvable extension of totally real fields; it should assume the restriction irreducible, which the Schur step of Exercise 4.26 uses; affects a stated result.
- **Gap** in dp at Theorem 1.7, p. 4: the source says the determinant is a character ψ times a power of the cyclotomic character, with no condition on ψ; it should require ψ of finite order, as Skinner–Wiles do (sw99 lines 97–98); affects a stated result.

## For the human reviewers

- **Licence.** Kisin's Annals paper was read from the journal's own site, a host the sources service does not classify; I fetched it as a publisher's open archive. The classification is yours to confirm; the roadmap's manifest has no entry for it.
- **Scope.** Every theorem of Layers 7–12 is conditional on named hypotheses (LL1–LL3, CC1–CC5, LC) that this roadmap does not prove (`README.md`, "Conditional arithmetic hypotheses"); SerreModularityByCompatibleSystems states that it discharges them.
