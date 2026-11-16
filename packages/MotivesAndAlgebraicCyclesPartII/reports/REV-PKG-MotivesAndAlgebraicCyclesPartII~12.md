<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6911022591 -->
Review (claude) of 52b6c6b

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the route of §7.5 uses regular homotopy invariance without naming its supplier

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:919`: "replace `KH` by `K` in each of `A_{≤1}`, `A_{≤1}/A_{<1}` (a smooth algebra over the residue field) and `A` (a regular ring)"; *Needs* at `:927`; Layer 7 *Dependencies* at `:957`; the SchemeKTheoryOperations contract at `:85`.

   **Claim.** The *Needs* line of §7.5 lists every input of its route.

   **Witness.** `A = C⟨T⟩`, the instance of the section's own second Check. It is a principal ideal domain (pinned `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`), so regular noetherian. It is not a valuation ring (the ideals `(T)` and `(T − 1)` are incomparable) and not a smooth `C`-algebra (it is not finitely generated). So `gap:valuation-ring-k-regularity` does not give `K(A) ≃ KH(A)`. The owner is `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1818` on main, §5.2: for regular noetherian `X`, `NK_n(X) = 0` in every degree. The README cites that section nowhere. The prerequisite is owned on main and only the citation is missing, hence P3.

   **Exact repair.**

   1. In §7.5, Route, replace "and `A` (a regular ring)" by "and `A` (a regular noetherian ring: `K(A) → K(A[T₁, …, T_n])` is an equivalence for every `n` by SchemeKTheoryOperations §5.2, so the simplicial spectrum defining `KH(A)` is constant)".
   2. In the *Needs* of §7.5 replace "SchemeKTheoryOperations §3.8" by "SchemeKTheoryOperations §§3.8, 5.2".
   3. In the Layer 7 *Dependencies* replace "SchemeKTheoryOperations §§3.1, 3.3, 3.8" by "SchemeKTheoryOperations §§3.1, 3.3, 3.8, 5.2".
   4. In the SchemeKTheoryOperations contract add, after the entry for §3.4 and §3.8: "§5.2 (for a regular noetherian scheme `X`, `K(X) → K(X × Aⁿ)` is an equivalence in every degree and for every `n`),".
   5. In Scope, in the SchemeKTheoryOperations clause, add "homotopy invariance of the K-theory of regular noetherian schemes" to the list and "§5.2" to the sections.

   **Repair tested.** On `A = C⟨T⟩`: `A[Δⁿ] ≅ A[x₁, …, x_n]` is regular noetherian, §5.2 applied `n` times gives `K(A) ≃ K(A[Δⁿ])`, the simplicial spectrum is constant and `K(A) ≃ KH(A)`. SchemeKTheoryOperations is on main and at line 37 of the merge order, so the citation is downward. §7.4 needs no change: its Check uses `ℤ_p`, `𝔽_p` and `ℚ_p`, which are valuation rings and covered by the gap.

2. **F02** (P3) the third Check of §0.1 gives a witness that also holds where the statement is true

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:137`: "The analogous statement for Banach rings is false in the form above: a completed filtered colimit can make `|T| = r` exactly, while the stages only bound it by `r + 1/n`".

   **Claim.** The stated phenomenon is what stops the argument for Banach rings.

   **Witness.** The first Check of the same section (`:135`) computes the same phenomenon in seminormed rings: in `colim ℤ[T]_{r+1/n}` the element `T` has norm `r` and norm `r + 1/n` at each stage. There `ℤ[T]_{r′} → ℤ[T]_r` is still weakly compact (take `1/n < r′ − r`). So the witness does not distinguish the two categories.

   **Exact repair.** Replace the third Check by:

   "- In Banach rings the radius-shrinking maps are no longer weakly compact, so the proof does not transfer. Write `ℤ⟨T⟩_r` for the completion of `ℤ[T]_r`. Let `Z_n = ℚ_p⟨x₁, …, x_n⟩` with the Gauss norm; the completed filtered colimit is `Z = ℚ_p⟨x₁, x₂, …⟩`, and `z = Σ_{n≥1} pⁿ x_n` lies in `Z` with norm `1/p`. For every `r′ > 1`, the composite of `ℤ⟨T⟩_{r′} → ℤ⟨T⟩₁` with `T ↦ z` factors through no `Z_n`: each `Z_n` is a closed subring of `Z` and `z` has the nonzero coefficient `p^{n+1}` at `x_{n+1}`. In seminormed rings every element of a filtered colimit comes from a stage and only its norm is approximated (first Check); in Banach rings the element itself may exist only after completion. This is the situation of Scholze's warning after Proposition 2.9."

   **Repair tested.** `ℤ → ℚ_p` is contractive (`|m|_p ≤ 1 ≤ |m|` for `m ≠ 0`), so the `Z_n` are Banach rings over `ℤ`. `|z| = sup_n p^{−n} = 1/p ≤ 1`, so `T ↦ z` is a contractive map from `ℤ⟨T⟩₁`. `Z_n → Z` is an isometric injection whose image is the series in `x₁, …, x_n`; `z` is not among them. The same instance in seminormed rings: the uncompleted union `∪ Z_n` does not contain `z`, so no map `T ↦ z` exists there and nothing fails. The repaired Check claims only that these maps are not weakly compact; it does not claim that Banach rings are not compactly assembled, which the README does not assert either (`:129`).

Two findings, both P3. The two findings of round 11 are repaired, and the passages the repair changed survive the adversarial pass. R01 is a proof route of §7.5 that uses a supplier result its *Needs* line does not name. R02 is a Check of §0.1, a sampled target, whose stated witness does not separate Banach rings from seminormed rings. No file of the package was changed by this review.

## Verified sound

### Previous findings (round 11)

| Finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2): the route of §10.5 reproduced a sentence of the source | README:1221: "The supported term is computed at finite level. A finite extension `K′ ⊂ C` of `k((T))` has residue field `k` … so it is totally ramified"; three Checks at :1225–1227; *Needs* at :1229 | Repaired. Longest run shared with Scholze lines 2395–2441: below 9 words (mechanical comparison, this round). The citations the repair chose resolve (below). |
| F02 (P2): `gap:affinoid-line-bundles` asked for what AdicSpacesPartIII provides | README:63–65: "### From TauCetiRoadmap.AdicSpacesPartIII … §R3.5, target *sheafy-tate-acyclicity-and-kiehl-gluing*"; *Needs* of §3.3 at :561; Layer 3 *Dependencies* at :603; Scope at :19 | Repaired. `design/plan.json` has eight gaps and the README eight slugs, the same. The heading §R3.5 and the target are on main at lines 10179 and 10289 of that roadmap. |

No finding of the repair report was marked not actionable. No maintainer note was left.

**Repair-pattern audit.** F01 (wording): the whole README was compared mechanically with the five cached texts at a 9-word threshold. The runs of 12 words or more are formulas (README:891, 1109, 1369, 897) and bibliography lines (:1500). The longest prose runs are 10 words, each a forced statement (:465 against Scholze line 1356, :1007 against line 2193, :1321 against line 2548). F02 (a gap that a roadmap already provides): each of the eight remaining gaps was searched again in its supplier and across the open heads (below); none is provided. R01 is the neighbouring pattern, a provided result used without a citation.

### Principles, shape and policy

- 13 layers, 83 numbered subsections, 83 *Needs* lines, 54 Checks blocks, 32 API blocks, 13 *Examples*, 13 *Dependencies*. No *Needs* line cites a later section of this roadmap.
- Searches for LaTeX delimiters, HTML, machine paths, pull-request numbers and process vocabulary in `README.md` and `Suggested.lean`: no hit. "lemma" occurs only as a mathematical word (README:277, 279).
- No route-specific shortcut, algorithm, sorry'd data or `set_option`.
- Layers 0–5 and 7–9, which round 11 relied on earlier tables for, were read in full this round, with §§10.3, 10.6, 11.1, 11.2, 11.5, 12.2, 12.4 and the Corrections section. Apart from R01 and R02 nothing was found.

### Source sample (15 seeded targets, read at the locator)

The author flags no locator as unverified other than BLR (uncertified, settled).

| Target | Lines read | Result |
|---|---|---|
| 0.1 | Scholze 362–399 (Def. 2.7, Remark 2.8, Prop. 2.9 and proof, pp. 9–10) | Statement and route agree. Third Check: R02. |
| 1.3 | Scholze 969–997 (Thm 4.14, Props 4.15–4.16, p. 23) | Agrees: left-complete category, continuous `G_K`-cohomology, bounded-below hypothesis in the stalk formula. |
| 2.4 | Scholze 1203–1216 (Prop. 5.9, pp. 28–29) | Agrees: `|n| ≥ 1` everywhere, invariance under change of algebraically closed field. |
| 2.7 | Scholze 1351–1356 (Thm 5.14, p. 32); 2193–2202 (Prop. 9.5, Cor. 9.6, p. 52) | Agrees: étale means finitary with finite geometric fibres; smooth spaces are locally étale over affine space. |
| 4.4 | Scholze 1575–1647 (Lemma 6.5 and proof, pp. 37–39) | Agrees. The route uses the corrected estimates (E1); the misprints are in the source. |
| 5.1 | Scholze 1809–1832 (Lemma 7.3 and proof, p. 43) | Agrees, including the sign remark and the statement in the homotopy category. |
| 7.4 | Scholze 2063–2088 (discussion and Thm 8.13 with proof, pp. 49–50) | Agrees: analytic sheaf, Postnikov hypothesis, totally disconnected case. |
| 8.3 | Scholze 2203–2211 (Prop. 9.7, pp. 52–53) | Agrees. |
| 9.2 | Scholze 2263–2301 (Prop. 10.3 and proof, pp. 54–55) | Agrees. |
| 9.3 | Scholze 2315–2325 (Lemma 10.4, p. 55) | Agrees: no surjectivity, `f_*` conservative. |
| 10.1 | Scholze 2401–2404 (Remark 11.2, p. 57) | Agrees: étale descent, `A¹`-invariance, `G_m`-stability. The hypercover reading is the README's stated choice. |
| 10.4 | CD 1896–1911 (Thm 4.5.2, Cor. 4.5.3, p. 41); 2048–2055 (Thm 5.2.2, formula 5.2.2.a, p. 44) | Agrees: `Hom(ℚ_X, ℚ_X(p)[q]) = Gr^p_γ K_{2p−q}(X)_ℚ` for regular `X`. |
| 10.5 | Scholze 2395–2441 (Thm 11.1 and proof, pp. 57–58) | Statement agrees; the unshifted formula at line 2399 is correction E6. The new route is the roadmap's own. |
| 11.7 | Scholze 2543–2567 (Thm 11.9 and proof, p. 61) | Agrees: both algebras are `ℤ[1/p] ⊕ ℚ(−1)[−1]` and the degree-one map is the identity of the value group. |
| 12.3 | Scholze 2641–2652 (Prop. 12.3 and proof, p. 63) | Agrees. |

Also read: Scholze 1003–1030 (Cor. 4.18, Def. 4.19, Thm 4.20), 1107–1122 (Defs 5.1–5.2, Lemma 5.3), 1986–2000 (Thm 8.9, Cor. 8.10), 2107–2118 (Thm 9.2), 2213–2224 (Prop. 10.1), 2538–2600 (`MG_C`, Cor. 11.10), 2618–2640 (§12).

### Adversarial table

Values computed in this round.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1, Prop. 2.9 | `colim_n ℤ[T]_{r+1/n}`; `r′ > r` | `T` has norm `r` in the colimit, `r + 1/n` at stage `n`; a lift of norm `≤ r′` exists once `1/n < r′ − r`; the identity of `ℤ[T]_r` has none | Retain. |
| §0.1 Check 3 | `Z = ℚ_p⟨x₁, x₂, …⟩`, `z = Σ pⁿ x_n` | `|z| = 1/p`; coefficient `p^{n+1}` at `x_{n+1}`, so `z ∉ Z_n`; the README's witness holds in seminormed rings as well | R02. |
| §1.3 | `K = ℝ`, `M = ℤ`; `A = ℂ` | `M(ℝ) = RΓ(ℤ/2, ℤ)`, with `ℤ/2` in every even positive degree, so `d(Marc(ℝ)) = ∞`, as §1.5 allows; one-point space gives `D(ℤ)` | Retain. |
| §2.4 | `n` prime to the residue characteristic; `n = ℓ` the residue characteristic | `(1 + a)^{1/n}` has coefficients in `ℤ[1/n]`, so one-units are `n`-divisible; `|ℓ| < 1` fails the hypothesis | Retain. |
| §2.7 | `ℙ¹`; `N = 1`; `[0, 1]` with skyscrapers at `1/n` | `cofib(ℤ ⊕ ℤ(1)[1] → ℤ²) = ℤ ⊕ ℤ(1)[2]`; `3N + N = 4 ≥ 2`; stalk of the product at `0` is `∏ℤ/⊕ℤ ≠ 0 = ∏` of stalks | Retain. |
| §3.5 criterion | `T² + T/2 + 4` over `ℂ₂`, `r₁ = 1/4`, `r₂ = 4` | valuations `(2, −1, 0)`, slopes `−3, 1`, root norms `1/8, 2`; `min(4, (1/4)·4) = 1 < |a₁| = 2` | Retain. |
| §4.4 route | `|T| ≥ r₂`; `|T − a_i| ≤ r₁` | `|∏| = |T|ⁿ ≥ r₂ⁿ > s₂ > |t|`; `|∏| ≤ r₁^{k_i} < s₁ < |t|` since `|T − a_j| = 1` for `j ≠ i`; `d = 0` gives `ℚ`, `d = 1` gives `ℚ ⊕ Ḡ_m ⊗ ℚ` | Retain. |
| §4.8 Check 6 | `ℤ₂`, `‖x‖ = 2^{−⌊v/2⌋}` | `‖2‖ = 1`; `‖2ⁿ‖^{1/n} → 2^{−1/2}`; points `c^{v}` with `c ≤ 2^{−1/2}` | Retain. |
| §5.1 | complex point; `−1` on the reduced motive of `G_m` | swap on `ℤ[1] ⊗ ℤ[1]` is `−1`, on `ℤ ⊗ ℤ` is `+1`; `(−1)^{Σ n_i} = 1` since `Σ n_i = 0` | Retain. |
| §5.3 headline | complex point; `X = ∅` | `ℤ(1) = ℤ`, the functor is the identity; zero category | Retain. |
| §6.3 headline | eigenvalues `1, 2, 4` | `(−1)(−3)/3 = 1`; `−(1)(−2)/2 = 1`; `3·2/6 = 1`; other values `0` | Retain. |
| §7.4 | `ℚ_p` | `π₀ = π₋₁ = 0` for `fib(K(ℤ_p) → K(𝔽_p))`; cofibre `π₀ = ℤ`; fibre `π₀ = ℚ_p^×/(1 + pℤ_p)` | Retain. |
| §7.5 route | `A = C⟨T⟩` | principal ideal domain; `(T)`, `(T − 1)` incomparable; not finitely generated over `C`; `K ≃ KH` needs SchemeKTheoryOperations §5.2 | R01. |
| §7.6 headline | `ℂ_p`; residue characteristic 0 | `π₀ = ℤ[1/p]`, and `p · r(1/p) = 1` has no solution in `ℤ`; `p = 1` | Retain. |
| §8.3 | `ℂ_p`; a perfectoid field of characteristic `p` | `μ_n(C)` is the `n`-torsion of `C^×/(1 + C_{<1}) ≅ (C♭)^×/(1 + C♭_{<1})`; own tilt | Retain. |
| §8.5 | closed disc over `C` | `f_* ℤ = ℤ`; `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1] ≠ ℚ` | Retain. |
| §9.2 | `{|T| < 1} ⊂ {|T| < 2}`; identity | factors through `{|T| ≤ 1}`; the open disc is not quasi-compact | Retain. |
| §9.3 | `Y = ∅`; `Y = X ⨿ X` | `f_* ℤ = 0`; `ℤ × ℤ`, modules `Dmot(X)²` | Retain. |
| §9.6 headline | `[0, 1]` | `RΓ_c((0, 1]) = 0`, `j_! ℤ ≠ 0` | Retain. |
| §10.1 | characteristic `p`; `ℙ¹`; imperfect `k` | Artin–Schreier gives `ℤ/p = 0`; `ℤ ⊕ ℤ(1)[2]`; Nisnevich `H¹(k, ℤ/p(1)) = k^×/p ≠ 0` | Retain. |
| §10.4 | `ℙ¹`, `j = 1`; a point, `j = 0` | `π_{−2} = K₀^{(1)} = ℚ = H²(ℙ¹, ℚ(1))`; `π₀ = K₂^{(1)} = 0`, as `K₂(ℙ¹) = K₂(k) ⊕ K₁(k)` has weight 2; `ℚ` | Retain. |
| §10.5 route, finite level | `K′ = k((T^{1/2}))`; inseparable `k((T^{1/p}))` | residue field `k`, `O′ = k[[u]]`, `e` equals the degree in both | Retain. |
| §10.5 route, transition | `e = 2`; `e = 1` | `O″/(u) = k[[v]]/(v²)` of length 2, so `×2` on `K₀(k) = ℤ`; identity | Retain; integral only after `⊗ ℚ`, as stated. |
| §10.5 Check 3 | `X = Spec k` | `i^* i_* x = i^* i_*(1) · x` and `i^* i_*(1) = [k] − [k] = 0`; cofibre `K(k)_ℚ ⊕ K(k)_ℚ[1]`; weight-one `π₁ = (k^× ⊗ ℚ) ⊕ ℚ = Ḡ_m(C) ⊗ ℚ` | Retain. |
| §10.5, `j < 0` | a point, `j = −1` | rational part `K^{(−1)} = 0`; completed part `ℤ̂_{p′}(−1) ≠ 0`; the fracture square gives `ℤ̂_{p′}(−1) ⊗ ℚ/ℤ[−1]`, consistent | Retain. |
| §10.6 headline | `ℙ¹_k` | `ℤ ⊕ ℤ(1)[2]` on both sides | Retain. |
| §11.1 | pro-torus prime to `p` | cofibre of the unit is `ℤ_{(p)}(−1)[−1]`, which is `ℚ(−1)[−1]` because `p` is invertible in `Dmot(k)` (`|p| = 0`); characteristic 0: all `n`, `ℚ` | Retain. |
| §11.7 | degree-one map | every nonzero scalar is an isomorphism of complexes; the algebra map is the scalar `1` on the value group `ℚ` | Retain. |
| §11.8 headline | `A = ℚ ⊕ ℚ(1)` | `N ≠ 0`, `N² = 0` | Retain. |
| §12.3 headline | `n = 1`; `j_!` from the rank-one point of a rank-two `Spa(C, C⁺)` | zero categories; `0 → ℤ/n` not an isomorphism | Retain. |
| AdicSpacesPartIII §R3.5 in §3.3 | `C⟨T⟩`, cover `{|T| ≤ |t|}`, `{|t| ≤ |T| ≤ 1}` | both strict rational; a finite family of rational domains covering the classical points covers `Spa`; rank-one projective over a principal ideal domain is free | Retain. |

For the statements outside these rows and outside the sections read in full this round, the rows of the round-11 table carry computed values and are relied on; the text they cover is unchanged (diff of the two heads: README lines 16, 19, 63–65, 85, 561, 603, 1221–1229, 1251).

### Pinned libraries

Content checkout at `ef3d21f`; Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Opened at the pin: Mathlib `CategoryTheory.GrothendieckTopology` (Sites/Grothendieck.lean:72), `NormedField` (Normed/Field/Basic.lean:155), `IsUltrametricDist` (Ultra/Basic.lean:47), `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `continuousCohomology` (ContCohomology/Basic.lean:131), `PowerSeries.IsRestricted.subring` (Restricted.lean:90), `LocallyOfFinitePresentation` (:46), `Etale` (:39), `QuasiCompact` (:41), `Smooth` (:59), `AffineSpace` (:43), `Proj` (ProjectiveSpectrum/Scheme.lean:855). Tau Ceti `unitBallIdeal` (UnitBall.lean:90), `mem_unitBallIdeal` (:101), `norm_inverse_one_sub` (:160), `norm_inverse_one_sub_sub_one` (:171), `isUnit_unitClosedBall_of_norm_sub_one_lt` (:185), `Subring.unitClosedBall` (Ultra.lean), `PowerSeries.isPrincipalIdealRing_isRestricted_subring` (Weierstrass/Ideal.lean:115, hypothesis `0 < c`), `cohomologicalDimensionAt` (:146), `strictCohomologicalDimensionAt` (:151), `cohomologicalDimensionAt_le_of_isClosed`, `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (EtaleCoordinates.lean:98), `SymmetricAlgebra.projToSpec` (:57), `instIsProperProjToSpec` (:115), `homogeneousSubmodule`, `projectiveLine`, `polynomialChartι`, `range_polynomialChartι_union_range_polynomialChartι`, `puncturedAffineSpace`, `PuncturedAffineSpace.homEquiv` (:208), `ExactK0`, `StableGeneralLinearGroup`, `AlgebraicK1`. All exist. The pin has no definition of a Berkovich spectrum, a Banach-ring site or a K-theory spectrum (searched by object: `berkovich`, `BanachRing`, `MultiplicativeSeminorm`, `K-theory spectrum`), as the README and the module docstring say.

### Headline theorems, padding and the Lean file

- `lake env lean` on `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace.
- Headline theorems of the Summary: cancellation (§5.3); `Kmot` finitary with its Adams splitting (§§6.1, 6.3); the explicit K-cofibre (§7.6); torsion and tilting (§§4.8, 4.9, 8.3); six operations and proper base change (§§8.5, 9.4); rigidity (§§9.1, 9.6); the étale comparison (§10.6); the monodromy equivalence (§11.8); the overconvergent comparison (§12.3). Each is named in the docstring with the missing carrier. Each mentions `Dfin`, `Deff_mot`, `Dmot`, `Kmot`, `DM_et` or `D_ét`, none of which exists at the pins, so none is statable.
- The one-tactic probe and the `#check @name` audit have no input: the file declares nothing; nothing compared, nothing changed.
- `roadmaps resolve`: no cross-roadmap citation found nowhere. Its one lead, `Perf.Spd` (README:105), is a name of DiamondsAndVStacks §D6.1, used in that roadmap's own text and cited here as the supplier's. No backticked name is presented as a Lean declaration of this roadmap.

### Duplication, suppliers and order

- Every supplier is on main or earlier in the merge order (this roadmap is line 381): SchemeKTheoryOperations 37, TropicalAndBerkovichArithmetic 235, AnalyticStacks 332; AdicSpacesPartIII, EnhancedDerivedSheaves, GeneralAlgebraicKTheory and SchemeKTheoryOperations are on main.
- Cited sections resolved as headings in the supplier's present text (main, or the open head for roadmaps not on main): TropicalAndBerkovichArithmetic 26 of 26; EnhancedDerivedSheaves 10 sections, the five E5 layers and 21 names; AnalyticStacks 10; GeneralAlgebraicKTheory 8 (§4.3 at its line 729, §13.8c at 3027); GeneralAlgebraicKTheoryPartII §1.2; SchemeKTheoryOperations 10; KTheoryFiniteLocalFields 4; RefinedTraceMethods 2; PerfectoidSpaces 11; DiamondsAndVStacks 8; DiamondEtaleCohomology 9; DiamondSixOperations 3; MotivesAndAlgebraicCycles 12; MotivicEtaleKTheory §2.2; ProfiniteCohomology §10.2 and Layer 11; SchemeAndStackFoundations §2.16; EtaleCohomologyFoundations 3; CharacteristicClasses §C5; JacobianChallenge 4 and 5 names; AdicCoefficientsAndComparisons Layer L5 (`smoothAlterationPair`); AnabelianGeometryAndNonabelianChabauty, target "Generalized Jacobian of a reduced boundary" (its line 4007).
- The sections the round-11 repair introduced were read for content. SchemeKTheoryOperations §2.7 (line 764: supported `K` commutes with qcqs inverse limits along affine transitions); §3.4 (line 955: flat maps that are isomorphisms infinitely near the support, completion included); §3.5 (line 1011: for regular noetherian `X` and regular `Z`, `Ri_*` identifies `K(Z)` with the supported spectrum); §3.8 (line 1193: derived closed-fibre excision); §6.11 (line 2796: `ψ^k j_* = k^c j_* ψ^k` for trivial conormal bundle, regular finite-type schemes with ample families over a regular base, which `X ↪ X_{O′}` over `k[[u]]` satisfies). GeneralAlgebraicKTheory §4.3 (finite admissible filtrations). AdicSpacesPartIII §R3.5 (lines 10289–10299). The contract's description of each agrees with the supplier's text.
- Declared gaps: eight slugs, the same in the README and in `design/plan.json`, each with a named supplier and section. None is provided today: SchemeKTheoryOperations has no homotopy K-theory, no cdh descent and no valuation-ring statement (searched `KH`, `cdh`, `valuation ring`: no hit); EnhancedDerivedSheaves has no Breen–Deligne resolution, no fracture square and no covering-dimension statement; KTheoryFiniteLocalFields §2.1 is henselian rigidity and §6.5 treats the valuation ring of a local field. GeneralAlgebraicKTheoryPartII declares gaps on SchemeKTheoryOperations for the simplicial model of `KH` and for `K ≃ KH` on regular rings; the owner is SchemeKTheoryOperations in both roadmaps, so there is one owner.
- Ownership by object, with `roadmaps grep` over main and the open heads: "arc-stack", "ball-invarian", "overconvergent étale", "motivic nearby", "étale motiv": no match outside this package. "Berkovich motiv" matches bibliography and consumer lines only. AnalyticStacks (its line 1302) names this roadmap as the consumer of its §§0.4–0.6, 0.9–0.10 and 1.1–1.5.
- "compactly assembled": EnhancedDerivedSheaves §E5:presentability.4 on main owns weakly compact maps (`IsCompactMorphism`, cited in §0.1) and the stable notion. The unstable notion that §0.1 defines for the 1-category of seminormed rings is on no roadmap on main or in the merge order. An open pull request outside the merge order adds a roadmap PresentableInfinityCategories whose §5.7 defines compactly assembled ∞-categories; this roadmap may not cite it, so §0.1 keeps its definition. Recorded for the human reviewers.
- The overlap report lists no conflicting head, no dropped id, no revision-only id and no second copy.

Dependency check output:

```text
depcheck: 254 roadmaps, 2415 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Overlap check: read ArcTopologyAndDescent, AnalyticStacks, DiamondEtaleCohomology, EnhancedDerivedSheaves, AdicCoefficientsAndComparisons, SchemeKTheoryOperations, DiamondsAndVStacks; nothing shared. ArcTopologyAndDescent owns the arc-topology of schemes and Tate algebras, not of Banach rings; DiamondEtaleCohomology owns `D_ét` of v-stacks and partial properness of separated maps; SchemeKTheoryOperations owns supported K-theory and Adams operations, which this roadmap cites.

### Copyright and arrangement

- **Wording.** 22 passages were set beside the source by hand: the 15 sampled targets, the definitions of §§1.5 and 2.1, the statements of §§1.7 and 9.1, §11.5, the prose of §§12.1–12.2 and the new route of §10.5. The whole README was also compared mechanically with the five cached texts. No passage reproduces its source.
- **Arrangement.** Scholze has sections 2–12. Against the layers: `Layer 0 ↔ §§2–3`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5`, `Layer 4 ↔ §6`, `Layer 5 ↔ §7 and Cors 8.1–8.2`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11 with CD and Bachmann`, `Layer 12 ↔ §12`. Not one to one: three splits, one merge, one transfer, and §§0.8, 1.8, 2.7, 4.3, 10.2, 10.4 have no counterpart. The *Dependencies* lines force `0 < 1 < … < 6`, `6 < 7` and `5 < 8 < 9 < 10 < 11`; Layers 7 and 8 are parallel, and Layer 12 needs only Layers 0–4, 8 and 9.
- **Reuse.** No table, figure or list is taken over. The Lean file declares nothing.

Source independence: 22 passages compared by hand and the full text mechanically with 5 sources, none shared; largest share Scholze, 95 of 108 locators; contents compared with Scholze: independent.

## Not verifiable

- BLR §9.2: settled as uncertified; not read and not requested.
- The eight supplier gaps are contracts: their declaration, owner and present absence were checked, their truth was not.
- van der Put, Vakil and Bachmann were not reopened in this round; the passages citing them are unchanged since round 11, which read them.
- Corrections E3, E5, E7, E8 and E9 were not recomputed against the source lines in this round; E1, E2, E4 and E6 were.
- No Lean declaration exists to elaborate; the cited library names were opened in the pinned sources and not elaborated in a scratch file this round.

## Source issues

- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says the outer estimate holds for arguments of norm at least the inner radius, taken greater than one; it should be the outer radius; affects the proof.
- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says the product inside a deleted disc is bounded by the inner radius to the total degree; it should be to the exponent of that one factor; affects the proof.
- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says the ratio of two nearby coordinates differs from one by the second point minus the first over a denominator; it should be the first minus the second; affects nothing.
- **Misprint** in Scholze at the proof of Lemma 6.5, p. 38: the source says each annular domain contributes one degree coordinate per domain; it should be one per boundary disc of the source domain; affects the proof.
- **Misprint** in Scholze at Theorem 11.1, p. 57: the source says the rationalized mapping object is the weight-`j` Adams piece of K-theory; it should be that piece shifted by `[−2j]`; affects a stated result.

## For the human reviewers

- The round-11 repair withdrew `gap:affinoid-line-bundles` from `packages/MotivesAndAlgebraicCyclesPartII/design/plan.json`; the intake had announced it to TropicalAndBerkovichArithmetic. Whether that announcement is retracted is a process decision.
- An open pull request outside the merge order adds PresentableInfinityCategories, whose §5.7 defines compactly assembled ∞-categories; `README.md:121` defines the same notion for presentable categories. Which roadmap owns it depends on where that roadmap enters the merge order.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "52b6c6b2df923a7de6d88130741dba68e38e795c", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~12", "model": "fable", "worker": "chris-x82"} -->
