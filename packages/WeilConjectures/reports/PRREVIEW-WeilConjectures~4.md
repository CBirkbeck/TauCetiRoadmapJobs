# Review of WeilConjectures (pull request #1208 at e79b1b6)

**Verdict:** needs changes

This is a full review of the head that the previous review read. The folder has not changed since then. The gate passes. All four findings are P3: one duplication of pinned Tau Ceti declarations, one false sentence in the description, and two wording and generality repairs.

## R01 (P3) — Tau Ceti already proves the genus-one zeta function, its functional equation, RH and trace recurrence; §§5.19, 7.4 and 7.5 re-derive them

**Location.** `TauCetiRoadmap/WeilConjectures/README.md`:
- line 1629: “At `g = 1`, writing `a = q + 1 − N₁` gives `Π₁ = 1 − aT + qT²` and `S_r = aS_{r−1} − qS_{r−2}`, with `S₀ = 2`.”
- lines 1635–1647: §7.5 derives `Z_E` and `N₂` from the hypothesis `N₁=8`.
- line 1094: §5.19 says “Make the same comparison over each `k_r` using WC.0's extension transport.”
- The Tau Ceti contract at lines 111 and 147–152 lists only `pointCount`, `pointCount_eq_card_point`, `frobeniusTrace` and `hasse_bound`.

**Claim.** These passages treat the genus-one zeta formula, its functional equation and the trace recurrence of a Weierstrass model as things to derive here. §5.19 compares WC's bound only with the Hasse bound and the point count.

**Witness.** Tau Ceti 2fd255d, `…/EllipticCurve/Isogeny/Frobenius/Zeta.lean`: `zetaFunction_eq_mul_inv` (l. 220), `mobiusAutOf_zetaRatFunc` (l. 112), `coeff_finrank_logOf_zetaFunction` (l. 184), the RH lemma (l. 244). `PowTrace.lean:178`: `frobeniusPowTrace_add_two`. On main, EllipticCurves Layer 3 (l. 769) owns this result.

**Repair.**
1. Add these declarations to “From Mathlib and Tau Ceti”, with the module `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Frobenius.Zeta` (and `…Frobenius.PowTrace`) and their hypothesis `[W.IsElliptic]`.
2. Restate the elliptic clause of §5.19 as a comparison: on a nonsingular Weierstrass model, the scheme's `zetaSeries` (WC.1.2) equals `WeierstrassCurve.zetaFunction`. Prove it through `coeff_finrank_logOf_zetaFunction` and the Hom/point dictionary over every `k_r`. WC's `Π₁ = 1 − a_qT + qT²` is then `zetaFunction_eq_mul_inv`, carried across that comparison.
3. In the `g = 1` paragraph of §7.4 and in §7.5, cite these declarations instead of re-deriving the rational function and the recurrence. Keep the numbers of §7.5 as a Check of the comparison.

Tested on `y² = x³ − x` over `𝔽₅`:
- `frobeniusTrace = 5 + 1 − 8 = −2`.
- `zetaRatFunc = (1 + 2T + 5T²)/((1 − T)(1 − 5T))`, which is the `Z_E` of §7.5.
- `frobeniusPowTrace_add_two` gives `t₂ = (−2)(−2) − 5·2 = −6`, so `N₂ = 26 + 6 = 32`.

Treat §7.6 the same way. Name the pinned `TauCeti.ArtinSchreierMonomial.FunctionField 𝔽₂ 2 5` (the curve `y² + y = x⁵`, since `−1 = 1` in characteristic two) with `two_mul_genus` (`ArtinSchreier/Monomial.lean:327`: `2g = (2 − 1)(5 − 1) = 4`) and `existsUnique_restrict_eq_infty`. These give the model, genus 2 and the single degree-one place that the paragraph attributes to “the Artin–Schreier supplier”.

## R02 (P3) — The description's dependency paragraph says 59 roadmaps are cited in the README; 48 are not, and two of the rest are already on main

**Location.** Pull request description, in the author's prose outside the generated blocks: “Dependencies (cited in the README by roadmap name and section; the Lean imports none of them). In open pull requests of ours: #1227 (StableHomotopyKTheory), #1212 (GeneralAlgebraicKTheory), …” (59 entries).

**Claim.** The README cites every listed roadmap, and each listed roadmap is still in an open pull request.

**Witness.** Searching the README at this head finds 48 of the 59 names nowhere: for example StableHomotopyKTheory, DiamondsAndVStacks, KTheoryLowDegrees, ShimuraVarieties and NeronModelsAndSemistableAbelianVarieties (only its Part II is cited). ReductiveGroupsPartII (#785) and ResolutionOfSingularitiesCharacteristicZero (#1199) are on main.

**Repair.**
- Replace the paragraph with the eleven roadmaps the README does cite: the ten of the `depends-on` block plus ReductiveGroupsPartII, which is on main.
- Say that the `merge-order` block gives their transitive closure.
- Drop #785 and #1199 from the list of open pull requests.

No change to the folder is needed.

## R03 (P3) — “tate extension unramified” is an identifier, not a sentence

**Location.** `README.md:1212`: “Explicitly prove tate extension unramified: for `n≥1`, a potentially semistable representation `V` in an exact sequence `0→ℚ_ℓ^n→V→ℚ_ℓ→0` …”

**Claim.** This is the statement of the local extension target of §5.25.

**Witness.** “tate extension unramified” is not a term of the literature and the README does not define it. “Tate” is in lower case. The clause reads as a target slug, not as prose.

**Repair.** Write instead: “Prove that potentially semistable extensions of trivial representations are unramified: for `n ≥ 1`, a potentially semistable `G_{ℚ_ℓ}`-representation `V` in an exact sequence `0 → ℚ_ℓ^n → V → ℚ_ℓ → 0` is unramified (van den Bogaart–Edixhoven, Lemma 4.2, pp. 8–10).” The mathematics does not change. Check at `n = 1`: `H¹(G_{ℚ_ℓ}, ℚ_ℓ)` is spanned by the unramified class and `log χ_cyc`. The extension defined by `log χ_cyc` is not Hodge–Tate, so the potentially semistable extensions are exactly the unramified ones, as the lemma asserts.

## R04 (P3) — The hypothesis `s ≥ d` of §5.23 is unnecessary and makes the target weaker than §5.16

**Location.** `README.md:1168`: “Let `X` be smooth proper of pure relative dimension `d` over `ℤ_p` and `s ≥ d` an integer.”

**Claim.** The local cutoff needs `s ≥ d`.

**Witness.** §5.16 (`graded_polynomial_approximation`, with unrestricted `r` and `s`) applied with `r = 2d` gives every conclusion of §5.23, for every `s`. Instance `s = 0`: `ℙ²` over `ℤ_p` with `P = 1 + T + T²` has error 0. Then `H¹ = H³ = 0` and `P_j = dim H^{2j} = 1` for `j = 0, 1, 2`, all true, but the hypothesis `s ≥ d` excludes this case.

**Repair.**
- Replace “`s ≥ d` an integer” by “`s` a natural number”.
- Next to the existing “it remains valid when `s > d`”, say that `s < d` gives the stronger low-degree conclusions.
- Keep the BFP locator. Their `s ≥ d` comes from the range `d ≤ r ≤ 2d` of vdBE Lemma 4.1 (`vdbe` line 203), which §5.16 removes.
- Add the `s = 0` instance above as a Check.

## Previous findings

- **R01 (previous review): repaired.** The `depends-on` block of the description now contains “- [ ] #1313 MotivesAndAlgebraicCycles”, the supplier of §4.20 that §7.3 consumes. No other repair was pending.

## Verified sound

**Gate and direction.** I ran the push gate on this head:

```text
gate WeilConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check, with the given merge order and `--movable`:

```text
depcheck: 234 roadmaps, 2275 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. WeilConjectures is at line 125 of the merge order. Its suppliers are all earlier:

| Supplier | Line |
| --- | --- |
| ComplexComparisonPartII | 39 |
| AbelianSchemesAndArithmeticModuli | 41 |
| EtaleCohomologyFoundations | 42 |
| InverseGaloisAndArithmeticFundamentalGroups | 54 |
| ArithmeticGaloisRepresentations | 58 |
| NeronModelsAndSemistableAbelianVarietiesPartII | 67 |
| DeligneWeightsAndPurity | 72 |
| MotivesAndAlgebraicCycles | 91 |
| EtaleDualityAndPerverseSheaves | 107 |
| PadicDifferentialEquationsAndRigidCohomology | 120 |
| PadicHodgeTheory | 122 |

SchemeAndStackFoundations, AlgebraicCurves, EllipticCurves, ReductiveGroupsPartII and AnalyticToricGeometry (Completed) are on main. The consumers come later: ShimuraCompactifications (162), AnalyticToricGeometryPartII (163) and EnriquesSurfacesAndIntegralNonexistence (325). QWittVectors (202) appears only in Scope, as the owner of the carrier of an excluded formula. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** I ran `lake env lean` on `TauCetiRoadmap/WeilConjectures/Suggested.lean` at Mathlib 1b1ccf4 and Tau Ceti 2fd255d. It gives six `declaration uses sorry` warnings, at lines 70, 80, 94, 105, 122 and 145, and nothing else.

**One-tactic probe.** On a scratch copy, I replaced every `sorry` by `first | (simp; done) | rfl | infer_instance | (exact?)`. All six fail, so none is padding.

**Signatures.** A scratch file with `#check @name` for all eight declarations agrees with the worker's signature list. No section binder was lost: every hypothesis is in its declaration's own signature. Each elaborated type matches its README statement:
- §1.6 is stated for separated finite type, and the Lean has `LocallyOfFiniteType` + `QuasiCompact` + `IsSeparated`.
- §7.16 says “geometrically connected”, and the Lean says `GeometricallyIntegral`. These are equivalent for smooth `X`.
- §6.6 reads `χ = deg V − deg U`. This equals `Σ(−1)^i b_i`, since cancellation removes equal degrees from `U` and `V`.

**Headlines (README).** These six are stated in the Lean:

| README target | Lean declaration |
| --- | --- |
| 7.16 endpoint | `weilConjectures_smooth_proper` |
| 6.6 signed functional equation | `functional_equation_of_smooth_proper` |
| 1.6 normalized integral presentation | `normalized_integral_zeta_presentation` |
| 1.1 Euler product convergence | `arithmeticZeta_absoluteConvergence` |
| 5.4 grouped moment bound | `norm_le_of_grouped_moment_bound` |
| 5.16 graded approximation | `graded_polynomial_approximation` |

The module docstring names the headlines that cannot be stated at the pins, and what each lacks:
- cohomological factor identification, ℓ-independence and the trace formula (no rational realization with compact supports);
- WC.4 (no fibre transport or Artin comparison);
- the stack and Tate-representation theorems of §§5.24–5.27;
- the cycle and surface counts (no numerical Picard local system, no Enriques or genus-one carriers);
- the integral toric construction. Tau Ceti's `Fan.algebraicRealization` (`Fan/Scheme.lean:143`) has structure map to `Spec ℂ` only.

The point-count shadows of §§5.24–5.25 (palindromic, nonnegative integer coefficients) could be stated. They would be weakened substitutes for the Tate theorem, so leaving them out is correct.

**Library declarations opened at the pins (49).**

Mathlib, by `#check`:
- `FiniteField.Extension`, `finrank_extension`, `natCard_extension` (needs `[Finite k]`), `algEquivExtension`, `natCard_algHom_of_finrank_dvd`.
- `Matrix.charpolyRev`, `reverse_charpoly`, `eval_charpolyRev`, `coeff_charpolyRev_eq_neg_trace`, `charpoly_inv` (needs `IsUnit A`).
- `HahnSeries.ofPowerSeries_injective`, `RatFunc.coe_coe`, `RatFunc.algebraMap_apply_div`, `PowerSeries.mk_one_mul_one_sub_eq_one`.
- `Matrix.det_vandermonde_ne_zero_iff`, `mul_nonsing_inv`, `IsIntegrallyClosed.eq_map_mul_C_of_dvd`, `IsGalois.mem_range_algebraMap_iff_fixed`, `hasSum_geometric_of_norm_lt_one`, `Polynomial.eq_of_infinite_eval_eq`, `ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`.
- `Aut.autMulEquivOfIso`, `isIsomorphicSetoid`, `AlgebraicGeometry.GeometricallyIntegral`.

Mathlib, opened in the source:
- `NumberField.finrank_eq_one_of_unramified`, at `NumberTheory/NumberField/ExistsRamified.lean:51` (a `lemma`).
- `Scheme.EllAdicCohomology`, at `AlgebraicGeometry/Sites/ElladicCohomology.lean:76`. Its sheaf at l. 64 is continuous `ℤ_[ℓ]`-valued maps, so the README's “additive-group construction from an integral pro-étale sheaf” is right.

Tau Ceti:
- `WeierstrassCurve.pointCount` (`PointCount.lean:73`; affine solutions plus one, l. 81).
- `pointCount_eq_card_point` (l. 86; hypotheses: finite affine solutions and `IsElliptic`, as the README says) and `frobeniusTrace` (l. 101).
- `hasse_bound` (`HasseBound.lean:57`).
- `repRingCharacter`, `mem_range_repRingCharacter_iff` (`RepresentationRing/Basic.lean:127, 164`), `repRingCharacter_injective` (`Injective.lean:50`), `mem_virtualCharacters_iff` (`VirtualCharacter.lean`).
- `Toric.Fan` (`Fan/Basic.lean:97`). The empty set of cones is allowed (`bot_mem` is conditional), which supports §6.2's empty-fan Check. Also `IsComplete` (l. 174), `IsRegular` (`Regular.lean:441`) and `dualSemigroup` (`DualSemigroup/Basic.lean:53`).
- The genus-one zeta and Artin–Schreier declarations of R01.

**Cross-roadmap citations resolved (14 suppliers).**

| Supplier | Where it resolves | What was compared |
| --- | --- | --- |
| EtaleCohomologyFoundations (main) | §§F.0.2, F.0.3, F.2.1–F.2.7, F.4.0–F.4.6, F.10.1, F.10.2, F.10.2b, 0.7, 0.9–0.11, F.5–F.7, F.10.3–F.10.5 headings; the four `VanishingCycles.*` names at its README ll. 911–951, 1043 | All exist. The resolver's three “Lean names found nowhere” are these supplier-planned names, not pinned declarations. |
| DeligneWeightsAndPurity (open head) | §§0.1, 0.10–0.16, 1.6–1.10 (`finiteFieldZetaRationality`), 4.3, 4.4 (`degreeFactorExtraction`), 5.2–5.3, 7.8–7.15, 8.24, 10.2 | §8.24 contains the DM-stack rational cohomology and “Smooth proper DM purity” clauses (finite diagonal, `ℓ≠p`, coarse comparison, duality) that WC.1.8 and WC.6.8 cite. Its Lean rationality theorem is rational-coefficient only. WC's integral coprime presentation is a distinct, stronger statement. |
| PadicDifferentialEquationsAndRigidCohomology (open) | RD.6.24, RD.7.4 (Fatou, clauses (a)–(c)), RD.7.5, RD.7.9 | RD.7.9 is the rigid/crystalline factor theorem that §6.9 imports. Its Lean states no point-count Weil theorem, so there is no second owner of WC's headline. |
| MotivesAndAlgebraicCycles (open) | §4.20 at its l. 931 | The scissor ring used by §7.3. |
| EtaleDualityAndPerverseSheaves (open) | §§1.3, 4.3, 4.7, 8.1, 8.2; `poincareReciprocityExport` at its l. 7679 | All present. |
| ComplexComparisonPartII (open) | §§C6.3–C6.6 | All present. |
| AbelianSchemesAndArithmeticModuli (open) | §A4.4 | Present. |
| ArithmeticGaloisRepresentations (open) | §§5.1, 5.3 | Present. |
| PadicHodgeTheory (open) | §§5.3, 8.1 | Present. |
| NeronModelsAndSemistableAbelianVarietiesPartII (open) | §§2.1, 4.0, 4.5, 5.0–5.2 | §5.2 is the rank-ten Picard-constancy criterion that §7.15 generalises to every `ρ` and cites for agreement. |
| SchemeAndStackFoundations (main) | §§0.29, 1.15, 1.18–1.21, 5.9–5.11 headings | Present. |
| ReductiveGroupsPartII (main) | §RG2.3 | Present. |
| AlgebraicCurves (main) | Layers 7, 10, 12; Artin–Schreier family at its ll. 1355–1395 and 1703 | Present. |
| EllipticCurves (main) | Layer 3, zeta milestone at its l. 769 | See R01. |

**Ownership.** I used `roadmaps grep` over main and the 447 open heads, searching by object:
- The Hasse–Weil sieve, finite groupoid mass and the point-count homomorphism on `K₀Var` have no other owner.
- The numerical Picard local system and the Enriques condition are owned only here (§7.12). EnriquesSurfaces and EnriquesSurfacesAndIntegralNonexistence consume WC §§7.12–7.14.
- InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (finite monodromy of integral local systems) is a different object.
- The genus-one zeta function is owned by EllipticCurves Layer 3 and pinned in Tau Ceti (R01).

**Sources: the seeded sample (15 targets) and its locators.** Source ids used below:

| Id | Text | Printed page |
| --- | --- | --- |
| `bfp-pub` | BFP, authors' copy of the published text | page marker + 1322 |
| `vdbe` | vdBE, arXiv math/0505178v3 | page marker |
| `deligne1` | Weil I, Numdam | page marker + 271 |
| `deligne2` | Weil II, Numdam | page marker + 135 |
| `sga45` | SGA 4½, IAS copy | page marker − 5 |
| `mustata` | Mustață, author's copy | page marker − 6 |
| `yu` | Yu, arXiv 1807.04659v5 | page marker |
| `schroer` | Schröer, arXiv 2004.07025v3 | page marker |

| Target | Locator | Lines read | Result |
| --- | --- | --- | --- |
| 1.13 | BFP §7 (8), p. 1337, Vakil–Wood | `bfp-pub` 616–637 | (8) is on p. 1337. The coefficients of `1/Z` are signed orbit-type counts, `(−1)^{ℓ(λ)}`, matching `o(S)`. |
| 1.14 | BFP Prop. 7.4 and proof, p. 1338 | 650–658 | Hypotheses: nonempty, proper, `H^odd = 0`. Conclusions: degree `dim H^even`, and coefficient sum zero via the eigenvalue 1 on `H⁰`. The README's empty case (sum 1) is an addition. |
| 1.15 | BFP Props 7.1, 7.5, Rem. 7.6, pp. 1336–1339 | 573–591, 664–709 | The README replaces “in a proper variety X” by properness of each singular locus, which is what Prop. 7.4 needs. Exact tail as in Rem. 7.6; no flatness. |
| 5.4 | Yu App. C, p. 81 | `yu` 4809 (C starts p. 79), 4881–4901 | Yu's lemma is the `p`-adic, `ℤ_p`-coefficient, `R = 1` case. §5.3 says that the weighted normed-field form is proved by its own Vandermonde argument; §5.4 reduces to it. |
| 5.18 | Weil I §§1.4–1.5, pp. 274–275; §2.5, p. 281 | `deligne1` 79–113, 322–330 | Orbit and point dictionary (1.4)(a)–(d), Lefschetz (1.5.1); (2.5)(c) gives `F* = q^n` on `H^{2n}` for connected `X`. |
| 5.23 | BFP Prop. 3.1, p. 1330; vdBE L. 4.1, pp. 6–7 | `bfp-pub` 297–317; `vdbe` 203–260 | Statement matches. The proof's displayed error term is a misprint (Source issues). See R04. |
| 5.24 | vdBE Thm 2.1, p. 3; proof §4, pp. 6–9 | `vdbe` 100–114, 261–297 | Density-one set, error `o(p^{nd/2})`, palindromic `P`, exact counts on `U`, Tate semisimplification. The README's empty-family clause corrects the source (Source issues). |
| 5.28 | Mustață proof of Thm 3.6 and Prop. 3.9, p. 22 | `mustata` 1164–1200 | Same Hodge-index argument; Mustață's `ℓ₁, ℓ₂` are the README's `B, A`; reduction to `m = 1` by base change. Intersection numbers recomputed below. |
| 6.2 | Fulton §§1.4, 2.1, 2.4 | — | Not verifiable (below). Mathematics checked in the table. |
| 6.5 | Weil II Cor. 3.3.4, p. 206; SGA 4½ Rapport §§3.1–3.4, 3.6, pp. 86–88 | `deligne2` 2640–2644; `sga45` 2468–2539 | Mixed of weight `≤ n`, so `H^i_c` has integral weights `≤ n + i`, all conjugates. Determinant and closed-point formulas on pp. 86–88. |
| 6.8 | Weil II §3.3.11, p. 207; vdBE L. 3.2, p. 5; BFP proofs of 3.1, 4.2 | `deligne2` 2686–2692; `vdbe` 159–173; `bfp-pub` 305–317, 348–351 | (3.3.11) replaces smoothness by `Ra^!ℚ_ℓ ≅ ℚ_ℓ(n)[2n]`, which étale-local finite quotients of smooth schemes satisfy. vdBE 3.2 is the coarse comparison in characteristic zero. The BFP proofs use, rather than state, the purity. |
| 7.2 | Weil I §1.4(c)–(d), p. 275; SGA 4½ Cor. 3.4, Rem. 3.5, pp. 87–88 | `deligne1` 97–103; `sga45` 2510–2531 | `det(1 − fTⁿ) = det(1 − f⁽ⁿ⁾T)`, which is the case `Spec 𝔽_{qⁿ}` of 3.1. |
| 7.8 | SGA 4½ §§3.1–3.2, 3.6, pp. 86, 88 | `sga45` 2468–2475, 2533–2535 | Compact-support determinant convention; reduction to the proper case. |
| 7.10 | Schröer Prop. 7.1 and proof, pp. 20–21 | `schroer` 881–936 | Hypotheses: odd vanishing and surjective base-field cycle maps, with `h⁰(O_X)=1` (the README's geometric connectedness). `f_{i,j} = f_i ⊗ q^{−j}` gives the scalar `q^j`. |
| 7.15 | Schröer §7, Cor. 7.2, pp. 19–21 | 845–947 | The forward direction is Cor. 7.2. The converse is the README's finite-order trace argument (checked below). |

The other locators I touched also match:
- BFP Prop. 1.3, pp. 1324–1325 (`bfp-pub` 66–86), for §§1.7 and 1.9;
- BFP §§9.1–9.2 and Prop. 9.3, Rem. 9.4, pp. 1351–1352 (1204–1250);
- vdBE Lemma 4.2, p. 8 (307);
- Weil I (1.5.4), p. 276 (128) and (2.6), p. 281 (331);
- Weil II Cor. 3.3.9, p. 207 (2676);
- Mustață Thm 3.6, Rem. 3.7, Lemma 3.8, (3.8)–(3.12), p. 21, and Ex. 3.10, pp. 22–23 (1091–1207);
- Schröer Cor. 7.3, p. 21 (948).

**Adversarial table.** Every row was computed for this review.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.1 `arithmeticZeta_absoluteConvergence` | `Spec ℤ`; `Spec 𝔽₄`; empty | Closed points are the primes, so `Σ p^{−σ} < ∞` for `σ > 1` (take `c = 1`). One factor, `(1 − 4^{−s})⁻¹`. Empty: summable trivially. The second conjunct follows from the first in `ℂ`, but is not false. | Sound |
| 1.2 `zetaSeries` | point; degree-two point; `𝔾_m/𝔽₃` | `1/(1−T)`; `exp(Σ T^{2m}/m) = 1/(1−T²)`, and `(1−T)^{−2}` after degree-two extension; `(1−T)Σ3ⁿTⁿ = 1+2T+6T²+18T³` | Sound |
| 1.6 `normalized_integral_zeta_presentation` | `𝔾_m/𝔽₃`; point; empty | `(1−3T)(1+2T+6T²+18T³+…) = 1 − T`, so `U = 1−T`, `V = 1−3T`, coprime, constant terms 1. `U = 1`, `V = 1−T`. `U = V = 1`. | Sound |
| 1.8 point-groupoid masses | `BC₂/𝔽₃`; `BS₃/𝔽₅` | `1/2 + 1/2 = 1`; conjugacy classes `e`, `(12)`, `(123)` with centralisers 6, 2, 3 give `1/6 + 1/2 + 1/3 = 1`. Trivial torsor only: `1/6`. | Sound |
| 1.13 inverse zeta = configurations | `ℙ¹/𝔽₂`; `Spec 𝔽_{q²}` | `Z⁻¹ = 1 − 3T + 2T²`. `c₁ = −#Fix = −3`. `c₂` = 3 pairs of rational points (sign +1) + 1 degree-two point (sign −1, `(5−3)/2 = 1`) = 2. For `Spec 𝔽_{q²}`: `1 − T²`, `c₂ = −1`. | Sound |
| 1.14 termination | `ℙ¹`; empty | `(1−T)(1−qT)`: degree 2 = `B`, sum `(1−1)(1−q) = 0`; BFP's own values 1, `−1−q`, `q`. Empty: sum 1. | Sound |
| 1.15 sieve | two parameter points: one smooth fibre, one with singular locus `ℙ¹` | `#V + S₁ + S₂ = 2 + (−1−q) + q = 1` = smooth count. Truncating at `h = 1` leaves error `S₂ = q`, which only the `B_v = 2 > 1` fibre contributes. | Sound |
| 2.1/2.3 sign | general `d` even | `Δ = q^{dχ/2}(−1)^{e′}`, with `e′` the multiplicity of `−q^{d/2}` and `χ ≡ b_d ≡ e + e′`, gives `ε = (−1)^e` for `+q^{d/2}`. `ℙ²`: `e = 1`, `ε = −1`, `Z(1/(q²T)) = −q³T³Z(T)` checked directly. | Sound |
| 2.4 `ε_r` | point, `r = 2` | `ε = −1`, `χ = 1`, `ε₂ = (−1)³(−1)² = −1`, whereas `ε² = +1` | Sound |
| 5.1 recovery | `β=(2,3)`, `c=(3,5)` | `V·A = I` with `A` = rows `(3,−2),(−1,1)`. Moments `8, 21`. Columns give `3, 5`; rows give `−18, 13`. | Sound |
| 5.4 `norm_le_of_grouped_moment_bound` | `α=(2,2)`, `w=(1,−1)`; `α=(2,3)`, `w=(1,1)`, `C=2`, `R=3`; 𝔽₂ trivial norm | Total 0 and all moments 0, so no bound is claimed. `2ⁿ+3ⁿ ≤ 2·3ⁿ` gives `‖2‖,‖3‖ ≤ 3`, and `R = 2.5` fails for large `n`. 𝔽₂: weights `1+1 = 0`, moments 0, norms 1 and no claim. `R = 0` case: `0⁰ = 1` handled. | Sound |
| 5.9/5.10 `D`, `B`, `G` | `β=(1,1)`, `c=(1,1)` over 𝔽₂ and over `ℤ/4` | 𝔽₂: `B = 2T(1−T) = 0`, `D = 1+T²`. `ℤ/4`: `G = 2T+2T²+…`, `DG = 2T − 2T² = B`. | Sound |
| 5.16 `graded_polynomial_approximation` | `p=2`: `(r,s)=(2,0)`, `P=1+T`; `(4,2)`, `P=T+T²`; `(2,0)`, `P=T` | Error 0, giving `P₀=b₀=1`, `P₁=b₂=1`. Error 1, and `1/2ⁿ → 0`, so the constant term is below the cutoff. Error 1 is not `o(1)`, so the hypothesis fails. | Sound |
| 5.18 components | `Spec 𝔽_{q³}`; `ℙ¹_{𝔽_{q²}}` over `𝔽_q` | `N_r = 3·[3∣r] = c_r`. `N_r = 2(1+q^r)` for even `r` and 0 for odd `r`: `c_r(1+q^r)` exactly, interior sum 0. | Sound |
| 5.19 / 7.4 / 7.5 (R01) | `y² = x³ − x` over `𝔽₅` | Affine counts 1, 1, 2, 2, 1, so `N₁ = 8` and `a = −2`. `Z = (1+2T+5T²)/((1−T)(1−5T))`; `S₂ = −6`, `N₂ = 32`. Roots `(−1 ± 2i)/5` have `|·|² = 1/5`. Each value is the pinned Tau Ceti declaration. | Sound; duplication, R01 |
| 5.23 (R04) | `ℙ²/ℤ_p`: `s = 2` with `P = T²+T`; `s = 0` with `P = 1+T+T²` | Odd groups vanish, `P₁ = P₂ = 1`, and `P₀ = 0` is below the cutoff. At `s = 0`, all of `P₀, P₁, P₂ = 1 = dim H^{2j}` are true. | Sound; hypothesis unneeded, R04 |
| 5.24 | `ℙ²`, `P = T²+T`; empty family | `C₁ = C₂ = 1`, palindromic `C₀ = 1`, so `C = 1+T+T²`. Empty: `C = 0`, so the source's “deg P = d” fails there. | Sound |
| 5.25 splitting argument | — | A compact subgroup of `GL_n(ℚ_ℓ)` is profinite. The induction quotient `0 → ℚ_ℓ^{n} → H → ℚ_ℓ → 0` is pst, hence unramified at `ℓ`; then Minkowski applies (`finrank_eq_one_of_unramified`). | Sound; wording, R03 |
| 5.28 surface route | `g = 1`, `q = 5`, `r = 1`, `N₁ = 8` | `D² = −2`, `Γ² = 0`, `E² = 0 − 10 − 10 + 10 = −10`, `DE = 8 − 1 − 5 = 2`. `4 ≤ 20`, so `|a| = 2 ≤ 2√5`. `D·(A+B) = 1+1−0−1−1 = 0`. | Sound |
| 6.2 integral fan scheme | zero cone in ℤ over 𝔽₃; two rays over 𝔽₄; rank-0 zero fan; empty fan; `ℤ/4` | 2 points, not complete, not proper. `ℙ¹`, 5 points. `Spec R` complete and proper. Empty scheme: proper, but support `∅ ≠ V`, hence not complete, so the nonemptiness hypothesis is needed. Constant 2 survives in `(ℤ/4)[t]`. | Sound |
| 6.3/6.4 seven-ray fan | ten maximal cones; relations; ranks | All ten determinants are ±1 (e.g. `127`: −1, `457`: +1). Each edge lies in exactly 2 cones: 15 edges, and `7 − 15 + 10 = 2`. `(t−1)³ + 7(t−1)² + 15(t−1) + 10 = t³+4t²+4t+1`. `v₂+v₆ = v₁+v₇ = (0,0,−1)` etc. Strict convexity sums to a contradiction. `q=2`: 33 = 1+7+15+10 orbits. | Sound |
| 6.5 mixed divisor | `𝔾_m`, `n=0`, `d=1` | Zero `β=1` has `α=1`, weight 0 ≤ 2. Pole `β=1/q` has `α=q`, weight 2 ≤ 2. | Sound |
| 6.6 `functional_equation_of_smooth_proper` | `ℙ²/𝔽₂` at `T=2`; `Spec 𝔽_{q²}` (d = 0, disconnected); genus 2; empty | `Z(2) = −1/21`, `Z(1/8) = 64/21 = −8·8·Z(2)`, and `Δ = 8` with `Δ² = 2⁶`. `Spec 𝔽_{q²}`: `χ = 2`, `Z(1/T) = −T²Z(T)`, so `Δ = −1` (= det of the swap). Genus 2: `χ = −2`, `Δ = 1/2`, `Δ² = 2^{−2}`. Empty: `Δ = 1`. Uniqueness holds since `U(0) = 1`. | Sound |
| 6.8 DM purity | `BC₂/𝔽₃` at `ℓ = 2` | `H⁰ = ℚ_ℓ` of weight 0, higher groups 0; trace 1 = mass 1 | Sound |
| 7.2 finite étale | two degree-two points; `Spec 𝔽_{q³}` | `Π₀ = (1−T²)²` and `N_r = 4·[2∣r]`. `1 − T³`, with zeros the cube roots of unity, weight 0. | Sound |
| 7.6 genus two | `y²+y = x⁵/𝔽₂` | Trace counts 3, 5, 9, 33 (over `𝔽₁₆`, `x⁵ ∈ 𝔽₄` has trace 0). `S = 0,0,0,−16` gives `Π₁ = 1+4T⁴`. `4T⁴Π₁(1/(4T)) = Π₁`, and `Z(1/(2T)) = (1/2)T^{−2}Z(T)` checked directly. | Sound |
| 7.8 `𝔾_m` | `q = 3`, `r = 1, 2` | `−Tr(H_c¹) + Tr(H_c²) = −1 + 3^r = 2, 8`. Localization: `H_c¹ ≅ H⁰(pt)`, `H_c² ≅ H_c²(𝔸¹)`. | Sound |
| 7.10 cycles | split and nonsplit quadric | Split: `b = (1,2,1)` and `Z = 1/((1−T)(1−qT)²(1−q²T))`, as §7.3. Nonsplit: only the sum descends, so the hypothesis fails, consistent with eigenvalues `q, −q`. | Sound |
| 7.15 maximal count | split and nonsplit quadric at `q=2`; `ℙ²` blown up at three degree-3 points | `Tr A = 2`: `N₁ = 9`, constant. `Tr A = 0`: `N₁ = 5`, not constant. `ρ = 10`, `Tr A = 1`: `N₁ = 7 ≠ 25`. Since `Re ζ ≤ 1` with equality only at 1, `Tr = ρ` forces `A = 1`. | Sound |
| 7.16 `weilConjectures_smooth_proper` | `ℙ¹/𝔽₄`; genus 2/𝔽₂; `Spec k` (d = 0) | Zeros 1 (`4⁰`) and `1/4` (`4^{−1}`), degrees (1,0,1). Zeros of `1+4T⁴` have `|z| = 2^{−1/2}`. `Fin 1`: `P₀ = 1 − T = P_last` and `Z = (1−T)⁻¹`. Moduli separate degrees, so the `P_i` are determined. | Sound |

**Notes that are not findings.**
- §§1.5 and 1.6 reach the local Fatou normalization by two supplied routes, RD.7.4(b) and DWP §4.4. This is redundant but consistent.
- DWP §1.10 already states the exponential/Euler identity that §1.2 compares. §1.2's additional content is multiplicativity, base extension and invariance under reduction, so it is not a re-plan.

## Not verifiable

- **Fulton, *Introduction to Toric Varieties*** (6.2, 6.3, 6.4): the DOI 10.1515/9781400882526 resolves only to a De Gruyter landing page in no licence class, and there is no open copy. I checked the mathematics of 6.2–6.4 directly (table). Fulton–Sturmfels (arXiv alg-geom/9403002) was fetched but not needed for a sampled target.
- **Kedlaya, *Fourier transforms and p-adic Weil II***, published renumbering (6.9): not sampled, not read for this review.
- **Fujino–Sato** version 0.27 (6.4): not sampled. The fan's regularity, completeness and nonprojectivity were recomputed instead.

## Source issues

- **Misprint** in BFP (Bergström–Faber–Payne, Ann. of Math. 199) at Proposition 3.1, proof, p. 1330: the source writes the error as little-o of `p^{md/2}`. It should be little-o of `p^{ms/2}`, as the hypothesis gives. Affects nothing; the roadmap's §5.23 already works with `s` throughout.
- **Error** in vdBE (van den Bogaart–Edixhoven, arXiv math/0505178v3) at Theorem 2.1, p. 3: the source says `P` has degree `d`. This fails for the empty stack, where `P = 0` satisfies the hypothesis; the statement needs a nonempty fibre. Affects a stated result (empty case only); §5.24 states the corrected form.
- **Misprint** in Mustață, *Zeta functions in algebraic geometry*, at Lemma 3.8 and its proof, p. 21: the statement bounds the roots by `g^{1/2}` and the proof writes `2g^{m/2}`. These should be `q^{1/2}` and `2g·q^{m/2}`. Affects nothing.
- **Misprint** in Mustață at the proof of Theorem 3.6, p. 22: the simplified inequality has `−ab(q+1−N₁)`. The expansion gives `+ab(q+1−N₁)`. Affects nothing, since `a, b` range over all integers.
- **Misprint** in Schröer (arXiv 2004.07025v3) at Corollary 7.2, p. 21: the source counts points over `𝔽_p`. It should count over `𝔽_q`. Affects nothing; §7.13 counts over `k`.
- **Misprint** in Schröer at Corollary 7.2, proof, p. 21: Poincaré duality is said to give `b₁ = 0`. It should give `b₃ = 0`, since `b₁ = 0` is a hypothesis. Affects nothing.
