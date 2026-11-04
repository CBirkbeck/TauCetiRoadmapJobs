# Review of TorsionCohomologyInfrastructure (pull request #1087 at 2199ac5)

**Verdict:** accepted

Incremental re-review of the 144 lines changed since d3fb40f. All five findings of the previous review are repaired without introducing a new problem; the gate passes; the dependency check shows no UPWARD or CYCLE line; the eleven Lean declarations elaborate to the types the README states. One P3 note on the downstream-consumer list, the author's to take or leave.

## R01 (P3) — A listed downstream consumer is an earlier supplier that does not consume this roadmap

**Location.** `TauCetiRoadmap/TorsionCohomologyInfrastructure/README.md` line 934 ("**AutomorphicGaloisRepresentationsPartII** (its nonselfdual existence layer) uses Layer 3a: the twisted-product separation and the weighted determinant extraction").

**Claim.** AutomorphicGaloisRepresentationsPartII consumes §§3a.2 and 3a.6 of this roadmap.

**Witness.** The merge order lists AutomorphicGaloisRepresentationsPartII at line 146 and this roadmap at line 166, so it cannot consume this roadmap, and the README is consistent with that: it cites AG2.3 and AG2.7 as suppliers. AutomorphicGaloisRepresentationsPartII at its head (pull request #1006) contains no occurrence of "TorsionCohomologyInfrastructure", and its Layer AG2.4 states its own separation theorem, `hlttFactorSeparation`: a topological group, an algebraically closed Hausdorff topological field of characteristic zero, an infinite-order character and an infinite family of exponents (Harris–Lan–Taylor–Thorne, Proposition 7.12). That is a different object from §3a.2 here (a single unit twist `u` over an arbitrary commutative ring with the invertibility of `1 − u^{2j}`), so there is no duplication either way; the bullet simply names a consumer that does not exist.

**Repair.** Delete the bullet, as was done for the phantom Part II consumer at this head. If the contrast is worth recording, one clause under `## Scope and ownership` suffices: AutomorphicGaloisRepresentationsPartII AG2.4 owns the characteristic-zero infinite-family separation, and §3a.2 here is the integral fixed-twist form.

## Previous findings

- R01 — repaired: line 121 now reads "its strict-normal-crossings compact-support form for a smooth proper pair `U = Y ∖ D`, and its extension to singular proper rigid spaces through analytic log resolution"; PadicHodgeTheory §2.7 at #1062 (its line 600 and the three paragraphs that follow) states exactly these, with resolution independence, localization and amplitude. No backticked PadicHodgeTheory name remains.
- R02 — repaired: lines 462, 663 and 803 now cite ShimuraCompactifications §§2.8–2.9 and Layers 2–3, which at #1053 are "The map to the minimal compactification" (line 1339), "Canonical models of toroidal compactifications" (line 1361), Layer 2 (line 1155) and Layer 3 (line 1433). The AutomorphicBundles locators were modernised too: §11.18 "Rational forms and field base change" (line 4359 at #1069), §12.11 "Geometric Hecke operators on classical sections" (4925), §12.12 "Convolution law for the geometric Hecke action" (4978). No `B`- or `C`-prefixed label remains in the README.
- R03 — repaired: every own name that `Suggested.lean` does not declare is now bold prose (about ninety replacements across Layers 0–4). A grep of every backticked identifier in the README leaves, among this roadmap's own names, exactly the eleven declared ones (`weightedProduct`, `twisted_product_separation`, `weightSubst`, `finiteWeight_factorization_unique`, `finiteWeight_factorization_polynomial`, `lawCharpoly`, `weightedDeterminantFactors`, `laurentSubst`, `substStableIdeal`, `laurentCoeffIdeal`, `laurentCoeffIdeal_pow_eq_bot`); the others are Mathlib, Tau Ceti or ClassFieldTheory names.
- R04 — repaired: `Suggested.lean` lines 144–145 drop `hN`; README line 587 reads "if `I^N = 0` for some `N ≥ 0`, then `J^N = 0`", and a new Check at line 592 computes the exponent-zero case. The computed witness is in the adversarial table below.
- R05 — repaired: the IntegralHeckeAndGaloisDeterminantsPartII bullet is deleted. The remaining consumer bullets are IgusaVarietiesAndTorsionConcentration (its citations of §§2.1, 2.4, 2.6–2.8, 3b.1, 3b.2, 4.3, 4.6 were resolved in the previous review) and the AutomorphicGaloisRepresentationsPartII bullet, which is this report's R01.

## Verified sound

**The change set.** 72 insertions and 72 deletions in the folder, nothing outside it (`git diff --stat origin/main...HEAD` outside the roadmap folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only). Word-level diff: the substantive edits are the PadicHodgeTheory prose (line 121), the six label repairs (lines 462, 663, 803), the `N ≥ 0` statement and its Check (lines 587, 592), the deleted consumer bullet, and the deleted `hN` binder; every other changed line replaces a backticked own name by the same name in bold. No statement, hypothesis, locator or `*Needs:*` line changed apart from the `N ≥ 1` → `N ≥ 0` widening.

**Gate.** The worker's gate at 2199ac5: every check passed, build 0 with `sorry` the only warning. The dependency check re-run from the worktree:

```text
depcheck: 205 roadmaps, 1433 edges, 0 problem(s)
```

No UPWARD or CYCLE line. This roadmap is at line 166 of the merge order, after PerfectoidShimuraVarieties (165), AutomorphicBundles (163), ShimuraCompactifications (143) and PadicHodgeTheory (107); the edge count fell from 1435 to 1433 with the two deleted consumer mentions.

**Citations.** The resolver's one lead, "IntegralHeckeAndGaloisDeterminants has no Layer 3", is a false positive: line 57 cites "Layer 3a", which exists at #1689 (its line 1653, "Hecke polynomial and multiplier conventions"). The three supplier sections touched by the diff were opened at their heads and match the statements consumed, as listed under *Previous findings*. AutomorphicGaloisRepresentationsPartII at #1006 was read for the R01 witness.

**Seeded sample.** The fifteen sampled targets (0.1, 0.2, 0.3, 0.8, 1.3, 1.5, 1.6, 2.1, 2.3, 2.8, 4.1, 4.2, 4.3, 4.5, 4.6) all lie in the diff, but only through the backtick-to-bold replacement of their target names; their statements, hypotheses and locators are byte-identical to d3fb40f, where the previous review verified each at its locator (Scholze 2015 Lemma 2.1.1, Lemma 2.1.2, Lemma 4.3.2, Corollary 3.2.23, proof of Theorem 4.3.1, Corollary 4.2.2, Corollary 5.2.6, Theorem 5.4.1, Corollary 5.4.2, Corollaries 5.4.3–5.4.4; Stacks 01ZM, 01ZR, 05LY, 081F, 09MT, 0B5U, 0B91, 02UZ; Caraiani–Le Hung Proposition 3.3, Remark 3.4; Chenevier Theorems 2.12, 2.22). Those verifications stand and were not redone.

**Lean form and binders.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all eleven declarations: each elaborated type equals the worker's `signatures.md` and the README statement; no section binder is lost (the `{N : ℕ}` of `laurentCoeffIdeal_pow_eq_bot` is now the only hypothesis besides `hI`). One-tactic probe on the only changed theorem, `laurentCoeffIdeal_pow_eq_bot`, with `first | simp | simp_all | rfl | decide | exact?`: the goal stays open, so it is not padding; the four untouched theorems were probed in the previous review. Single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` throughout, docstring names the non-statable headlines (Layers 0–2, §§3b.9, 4.3–4.6) unchanged.

**Adversarial table** (statement; instances; values on each side; result; change). Rows for untouched statements are carried from the previous review at d3fb40f, whose values were recomputed there; the row for the changed statement is new.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 3a.7 `laurentCoeffIdeal_pow_eq_bot` without `hN` (changed) | `N = 0`, any `R` | `I^0 = 1 = ⊤`; `⊤ = ⊥` puts `1 ∈ ⊥`, so `1 = 0` in `R[T^{±1}]`; coefficient `0` gives `1 = 0` in `R`, so `R` is a singleton; `J^0 = ⊤ = ⊥` in `Ideal R` | true; the scratch `example` with this proof elaborates with no error | none |
| 3a.7 without `hN` | `N = 1`, `R = ℤ/4`, `I = (2)` | `I^1 = I ≠ 0`; hypothesis fails, nothing to prove; with `I = 0`: `I′ = 0`, `J = 0`, `J^1 = 0` | consistent with the Check "If `I = 0`" | none |
| 3a.7 bound, `N ≥ 1` | `f₁…f_N ∈ I′`, exponents in `[−B,B]`, `a_i = (2B+1)^{i−1}` | balanced base-`(2B+1)` digits unique ⇒ coefficient of `T^{Σa_ik_i}` in `∏f_i(T^{a_i}) ∈ I^N = 0` is `∏coeff_{k_i}f_i` | `J^N = 0`; the widening to `N = 0` changes nothing here | none |
| 3a.1 `weightedProduct` | `P=1−2X, Q=1−3X, u=2` over ℚ; `u=1`; constants | `1−7X+6X²`; `1−10X+24X²` same-side; `PQ`; `6` | previous review row, unchanged text | none |
| 3a.2 separation (positive, negative control, degenerate, proof step) | ℚ `u=2` swapped pair; ℤ/9 `u=2`; `n=0`, zero ring; coefficient `j` | `1−(11/2)X+6X² ≠ 1−7X+6X²`; `1−u²=−3≡6` not a unit and conclusion fails; all four polynomials `=1`; `u^{−j}(1−u^{2j})δp_j=0` | previous review rows | none |
| 3a.3 `weightSubst`, uniqueness, polynomiality | `m=2, F=1−X`; `Q₀=1+aX, Q₁=1+bX`; shift `X↦T^{−m₀}X` | `coeff₁=−T²`; `a,b` from `T⁰,T¹`; `T^e`-coefficient of `Q′Q₀` is `φ_eQ₀` | previous review rows | none |
| 3a.4–3a.6 decomposition, degree-zero weight, Lean form, exact degrees | `R=ℚ×ℚ`, `f(T)=(T,T²)`; `n_m=0`; `(g, ofAdd k)`; Scholze lines 4270–4273 | factors `ℚ×0` deg 1, `0×ℚ` deg 2; `P^{(m)}=1`; RHS `∏P_m^g(T^{km}X)`; `deg∏P^{(m)}=n` ⇒ `deg P^{(m)}=n_m` | previous review rows | none |
| 3a.7 `laurentSubst`, ℤ/4, ℤ, nilpotent example | `a=2` on `3T^{−1}+T²`; `I=(2)`; `I=(T−1)`; `𝔽₂[a,b]/(a²,b²)`, `I=(a+bT)` | `3T^{−2}+T⁴`; `I′=I, J=(2), J²=0`; `1∈J`; `a+bT²∉I`, `ab∈I′`, `ab≠0` | previous review rows | none |
| Conventions, `P_v` two forms, 3b.1 (conversion, reciprocal, unitary sign, Levi roots, `P^∨`) | `n=1,U₁=1`; `U_i=q^{i(n−i)/2}e_i`; `n=2,q=2,U₁=3,U₂=5`; `(1−aX)(1−qbX)` | `1−qX`, `ε^{−1}`; `i(i+1)/2`; `1−6X+40X²`; top `+` | previous review rows | none |
| 3b.3–3b.9, 4.1–4.8, 0.7, 0.8, 1.1, 2.2, 2.3, 2.5, 2.6 | as in the previous review | as in the previous review (e.g. `(J₁∩J₂)^{2(d+1)}=0`; `(ℤ/7)^×/{±1}≅C₃`; `1−ℓ(1+ℓ)X+ℓ³X²=(1−ℓX)(1−ℓ²X)`; `tr(T^{p−1})=p−1`; `p³−p` vs `p³`; `H¹(j_!ℤ)=ℤ`; `l₀=0, q₀=d`) | previous review rows, text unchanged | none |
| Headlines at the pins | eleven `#check` | types equal README statements and `signatures.md` | no dropped hypothesis | none |

## Not verifiable

- Unchanged from the previous review: Huber's Proposition 2.5.8 (book, not needed given §2.3's formal-model route); Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4 (status of stabilisation only); Labesse, Pilloni–Stroh and Milne (used through suppliers whose statements were read); the published Compositio pagination of Caraiani–Le Hung. No new source was needed for the changed passages.
- Ownership against open pull requests whose files the brief does not list was checked only through `roadmaps grep` and `roadmaps show` (AutomorphicGaloisRepresentationsPartII, PadicHodgeTheory, ShimuraCompactifications, AutomorphicBundles, IntegralHeckeAndGaloisDeterminants at their heads).

## Source issues

- none
