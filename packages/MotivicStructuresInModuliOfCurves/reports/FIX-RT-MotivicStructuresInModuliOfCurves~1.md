# FIX-RT-MotivicStructuresInModuliOfCurves~1

Red-team round 1, passes a and b: fourteen findings, two of them shared between the passes. I checked each one against the cached sources, the sibling roadmaps (on main or at their open heads) and the pinned libraries. All fourteen hold. Twelve sections follow, one for each finding or merged pair of findings. Files changed: `packages/MotivicStructuresInModuliOfCurves/README.md` and `packages/MotivicStructuresInModuliOfCurves/design/plan.json` (top-level `gaps` list only). `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## RT-MotivicStructuresInModuliOfCurves~1a/F01 (P2) — applied differently

**Confirmed.** CLP Lemma 5.1 (= Canning–Larson Lemma 10.5) runs through the Casnati–Ekedahl bundles of the cover `α : C → ℙ` (`clp` lines 574–594; `canning-larson` lines 1871–1937). These are not pulled back from the universal curve, so the existing gap does not cover them.

**Repair.** New `gap:equivariant-grr` on EquivariantIntersectionTheory §§2.1–2.2: GRR for `G`-equivariant projective morphisms of smooth quasi-projective schemes, in `∏_c A^c_G ⊗ ℚ`, via SchemeAndStackFoundations §5.8 on mixed spaces. Applied on the `SL₂`-lift (`canning-larson-genus-seven` lines 257–268). Added to the §6.5 *Needs*, the Layer 6 Dependencies, the contracts and `gaps`.

**Why the supplier differs.** The review's class ("stratified by quotient stacks") is wider than the application needs and has no known route. The quotient-stack form follows from §5.8 on mixed spaces, which is how StableReductionPartII §5.16 proves its universal-curve GRR and how EquivariantIntersectionTheory §2.2 derives its other operations.

## RT-MotivicStructuresInModuliOfCurves~1a/F02 (P3) — applied

**Confirmed.** For `M̄_{3,12}` and its divisor `M̄_{1,12} × M̄_{2,2}`, `H₁₃` contains `H¹³(M̄_{1,12}) ⊗ H⁸(M̄_{2,2})`. The even factor is `H₂`, covered by §10.4, not by §10.1.

**Repair.** §§12.1–12.2 now read boundary factors in homological degree. `H₁₁(M̄_v)` is zero or `a^{d_v−11}·H¹¹`, by §10.9 and hard Lefschetz; even factors go through §10.4. *Needs:* 10.1 → 10.4; 10.2 → 4.12, 9.8, 10.4, 10.9. The witness is added as a Check. §10.4's wording now says "odd homology … by duality".

## RT-MotivicStructuresInModuliOfCurves~1a/F03 (P3) — applied

**Confirmed.** `clp` line 1087 allows `i`, `j` or `k` to equal `y`. Read as written, family (e) counts `66 + 12·55 = 726`.

**Repair.**
- (e): "unordered pair of the twelve original markings other than `k`" → "`{i, j}` of the twelve markings other than `x` and `k`, so that `i`, `j` or `k` may be `y`".
- (b), same ambiguity: "eleven remaining original markings" → "eleven markings on the genus-one vertex".
- Check now records `726` against `858`.

## RT-MotivicStructuresInModuliOfCurves~1a/F04, RT-MotivicStructuresInModuliOfCurves~1b/F04 (P3) — applied

**Confirmed.** `cfp` line 24 and `mss` line 121 both state their theorems for `g ≥ 2`.

**Repair.** §2.2 now attributes the cited theorems to `g ≥ 2` and adds the case `g = 1`: `H¹(M_{1,1}, ℚ) = H¹(SL₂(ℤ), ℚ) = Hom(SL₂(ℤ), ℚ) = 0`, by the comparison of §2.1 and because `SL₂(ℤ)^ab = ℤ/12`.

## RT-MotivicStructuresInModuliOfCurves~1a/F05, RT-MotivicStructuresInModuliOfCurves~1b/F06 (P3) — applied

**Repair.** The Summary now ends with: "and for `n ≤ 11` every `H^k(M̄_{3,n})^ss` is a polynomial in `L` and `S₁₂` (CLP, Theorem 1.9)". The Summary, the ownership sentence and the headline list in `Suggested.lean` now agree.

## RT-MotivicStructuresInModuliOfCurves~1a/F06 (P3) — applied

**Confirmed.** §3.5 is stated for `g ≥ 2`. The triple `(1, 10, 11)` lies outside the region.

**Repair.** The §4.9 route now treats genus one through §3.2 in every case:
- `n′ > k′ ≥ 1`: the classes are forgetful pullbacks.
- `k′ > n′`: the group is zero.
- `k′ = 0`: the unit.

§§4.2 and 3.5 now apply only to `g′ ≥ 2`. Check added: `W₁₁H¹¹(M_{1,10}) = 0`.

## RT-MotivicStructuresInModuliOfCurves~1a/F07 (P3) — applied

**Repair.** The §11.9 route now says: the image is a nonzero quotient of `T_{(2,1^{10})} ⊕ T_{(3,1^9)}`, of dimension 11, 55 or 66. The span of the 891 morphisms then has dimension `825 + dim`, at most `836`. That excludes `880` and `891`, so the image is the 11-dimensional constituent. The Check now records `880 > 836`.

## RT-MotivicStructuresInModuliOfCurves~1a/F08 (P3) — applied

**Repair.**
- §6.3 now defines `B`: the stack of pairs `(E, F)` on `ℙ¹`-fibrations with `det E ≅ det F`, together with its universal fibration `ℙ → B`, the map `H_{4,g} → B`, and the cover `α : C → ℙ` (`clp` lines 576–581).
- §6.7 (route and Check), §6.8 and the Layer 6 Example now name `B`.

## RT-MotivicStructuresInModuliOfCurves~1b/F01 (P1) — applied

**Confirmed.** At its head, WeilConjectures §5.25 says its Deligne–Mumford version needs local `p`-adic inputs (PadicHodgeTheory §§5.3, 8.1). The README names no such supplier.

**Repair.** §9.7 now proves `H^*(M̄_{4,n}) = RH^*(M̄_{4,n})`: every pair `≼ (4, n)` lies in the ranges of §5.4, and induction runs through §0.4. Cycle classes over `ℚ` give the unsemisimplified Tate structure; the multiplicities come from the local cutoff. Locators: BFP Theorem 1.4; Canning–Larson Theorem 1.4 and Proposition 3.15. Two Checks; dependencies updated.

**Same pattern elsewhere.** The all-`Spec ℤ` and equivariant-count clauses of WC.5 are no longer used for stacks:
- §1.5 adds the trace identity `tr(σF) = q^j tr(σ)`, with a Check;
- §§1.6, 2.7 and 9.9 use the local cutoff and that identity;
- §9.5 cites the approximate-count theorem;
- the Layer 9 introduction, the Scope list and the WeilConjectures contract are corrected to match.

## RT-MotivicStructuresInModuliOfCurves~1b/F02 (P2) — applied differently

**Confirmed.** MappingClassGroupsAndCanonicalRepresentations §2.3 (at its head) gives the orbifold quotient but no statement on cohomology.

**Repair.**
- §2.1 now states the comparison first: `H^*([T/Γ], ℚ) = H^*(T ×_Γ EΓ; ℚ) = H^*(Γ, ℚ)`. The proof uses the pinned Tau Ceti `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` (`TauCeti/AlgebraicTopology/Cohomology/GroupCohomology.lean:248`) for the contractible free covering `T × EΓ`.
- The contract now says MappingClassGroups supplies no statement on cohomology. §3.4 cites §2.1. A Check for `M_{1,1}` is added.

**Why it differs.** The review proposed a Serre-type argument together with a coarse-space comparison. The pinned declaration makes that argument unnecessary. The coarse comparison is not needed, and stating it would duplicate Orbifolds O4-T (on main).

## RT-MotivicStructuresInModuliOfCurves~1b/F03 (P2) — applied

**Confirmed.** `clp` lines 217 and 258 equate `W_kH¹(M_{1,1}, V^{⊗(k−1)})` with `S_{k+1}`. At `k = 13` the group contains `(L S₁₂)^{⊕11}`, because `μ(12, 10) = 11`.

**Repair.** The §3.2 route now discards the insertion summands: products with `θ_{st}` restrict to zero on `M_{1,n}` (as in §4.2, and by §3.1 at `g = 1`). Eichler–Shimura is applied to `Sym^{k−1}V` only. A Check at `k = 13` and a bullet under Corrections to the sources are added. §0.5's route takes the sign part, `Sym^{k−1}V`, and is correct.

## RT-MotivicStructuresInModuliOfCurves~1b/F05 (P3) — applied

**Confirmed.** For the witness `(2, 7)`, §4.5 calls on the triple `(1, 7, 6)`, which none of §§4.2, 10.3 or the hypothesis covers.

**Repair.** §10.6 now runs §4.5 case by case. Degree six: the hypothesis range, §10.3, §4.2, §3.2 (genus one), §2.6 (genus zero). Degrees at most five: §§10.1, 10.2, 2.7. *Needs* updated; §2.7 is added to the review's list because §4.5 needs every `k′ ≤ 6`. Check added for `(1, 7, 6)`.

## Checks

- **Elaboration:** `lake env lean packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout, exits 0 with no output. No `TauCeti.*` import needed building.
- **Dependency check:** `depcheck: 241 roadmaps, 2264 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver:** no cross-roadmap citation and no Lean name of this roadmap is found nowhere.
- **Gap slugs:** the nine slugs in the README are the nine in `design/plan.json`.
- **`#check @name`:** `Suggested.lean` declares nothing (a module docstring and an empty namespace), so there was nothing to compare. The worker's signature lead `and` is a word of the docstring, not a declaration. The docstring's headline list still matches the README.
- **Gate failures:** none were listed for this round.

## Adversarial pass (changed or added statements)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1 comparison | `M_{1,1}`; `M_{0,4}` | `H¹(SL₂ℤ,ℚ) = Hom(ℤ/12, ℚ) = 0`, `H^{≥2} = 0` (vcd 1), coarse `𝔸¹`: `ℚ`; integrally `H² = ℤ/12 ≠ 0`; `PMod(0,4) = F₂`: `H¹ = ℚ² = H¹(ℙ¹ − 3 pts)` | holds rationally only | Check added |
| §2.2, `g = 1` | `4g − 3 = 1` | `H¹(M_{1,1},ℚ) = 0` | holds | statement split by genus |
| §3.2 route | `k = 11`; `k = 13` | `k = 11`: extra `j = 8, 6, …` give `S₁₀ = S₈ = ⋯ = 0`; `k = 13`: `μ(12,10) = 11`, `(L S₁₂)^{11}`, `S₁₄ = 0` | wrong step corrected | route, Check, correction |
| §4.9 route | `(1,10,11)`, `(1,12,11)`, `(1,11,11)`, `k′ = 0` | `10 < 11` → zero; Φ; in region; unit | all covered | route, Check |
| §6.3 `B` | `g = 7` | ranks 3 and 2, degrees `10 = 10`; `(2,4,4)`, `(4,6)` sum to 10 | holds | definition |
| `gap:equivariant-grr` | finite flat `α`; `ℙ¹` over a point | `R^{>0}α_* = 0`, `α_*O_C` of rank `4 = 1 + 3`; `∫(1 − h)(1 + h) = 0 = χ(O(−1))`, `∫(1 + h) = 1 = χ(O)` | holds | new gap |
| §1.5 trace identity | `σ = diag(1,1,−1)`, Jordan `U`; transposition `σ′` | `tr(σU) = 1 = tr σ`; `tr(σ′U) = 2 ≠ 1` | commutation needed, semisimplicity not | route, Check |
| §9.7 route | `n = 3, 4, 5` | `n = 3`: `(1,9),(2,7),(3,5),(4,3)` within `c = 10,10,11,11`; `n = 4`: `(1,10)` within; `n = 5`: `(1,11)` outside | holds for `n ≤ 4` | route, Checks |
| §9.7 splitting | counts alone vs cycle classes | the extension of `ℚ_ℓ` by `ℚ_ℓ` through `log χ_cyc` has semisimplification `ℚ_ℓ²` but does not split; `G_ℚ`-invariant spanning vectors make it split | count alone insufficient | route |
| §9.9 | `n = 2` | compact `s_{(2)} + s_{(1,1)}`: `9 + 2 = 11`, `55 + 21 = 76` (§9.5); `s_{(1,1)}` symmetric about `11/2` | holds | route |
| §10.6 | `(2,7)` | `(1,7,6)`: `14 − 6 = 8 ≤ 20 − 6 = 14`; `(1,7,4)`: `10 ≤ 14`; degree five `H⁵ = 0` | covered | route, Check |
| §11.5 | (b), (e) | `364·11 = 4004`; `13·66 = 858` vs `66 + 12·55 = 726`; total `6006` | holds | wording, Check |
| §11.9 | quotient dimensions | `825 + 11 = 836`, `+55 = 880`, `+66 = 891`; `66 − 11 = 55` | holds | route, Check |
| §12.1 | `M̄_{3,12} ⊃ M̄_{1,12} × M̄_{2,2}`; `M̄_{1,10}` | dimensions `12 + 5 = 17 = 18 − 1`; `H¹³ = a·H¹¹` (22-dimensional); `H₁₁(M̄_{1,10}) = H⁹ = 0` | holds | route, Check |
| §12.2 | `H₁₅(D̃)` | odd 11, 13, 15 plus even 4, 2, 0 | holds | route |
| §9.5 citation | approximate counts | WC §5.24 gives a palindromic `C` with exact count `C(p^n)` and no `p`-adic input | holds | citation |
| §2.7 citation | exact count, `s = 0` | WC §5.23 gives `H^odd = 0` in all degrees (its `ℙ²` Check) | holds | citation |

## Ownership and suppliers

- **§2.1 comparison.** The comparison of the moduli stack with its mapping class group is owned here. No roadmap on main or at an open head states it (searched by object). It combines the pinned Tau Ceti declaration with MappingClassGroups §2.3. ArithmeticLocallySymmetricSpaces ALS.1.5 treats arithmetic groups only. Orbifolds O4-T's coarse comparison is not used.
- **Equivariant GRR.** No roadmap at the open heads or on main plans GRR for equivariant projective morphisms. StableReductionPartII §5.16 proves the special case of the universal curve over `M̄_g` by the same mixed-space route.
- **No other new supplier.** No supplier was moved down and no later roadmap is cited.

## For the maintainer

- **EquivariantIntersectionTheory (on main)** is newly asked, through `gap:equivariant-grr` (Layer 2, §§2.1–2.2), for equivariant Grothendieck–Riemann–Roch.
- **WeilConjectures.** This roadmap no longer consumes WC.5's all-`Spec ℤ` or equivariant-count clauses for stacks. The contract says so.
- **Ids.** No section, layer or target id of this roadmap was renumbered, and no Lean name changed.
- **Sources.** No new source was fetched and `needs-references.toml` was not written. The new locators are in texts the manifest already records: `canning-larson`, `canning-larson-genus-seven` and `clp`.
- **Untrusted text.** No suspicious instructions appeared in the reviews or the fetched texts.
