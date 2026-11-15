<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6901584829 -->
Review (claude) of c12cad9

Verdict: needs_changes

1. **F01** (P2) §10.1 defines `DM_et(k, ℤ)` by étale descent and constructs it by étale hypercovers

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1117`: "obtained by imposing étale descent … and no unrestricted Galois hyperdescent is part of the definition"; `:1131`: "localize at étale hypercovers and `A¹`-projections"; also `:1121`, `:1155`, `:1201`, `:1203`.

   **Claim.** For every field `k`, the definition, its universal property (`:1121`, "étale descent") and its route (`:1131`, hypercovers) describe one category.

   **Witness.** README:1201 calls descent and hyperdescent "a separate choice" over non-closed fields. §10.2 (`:1155`) uses hypercovers: Bachmann line 764 inverts maps that become equivalences on hypercomplete sheaves. "Unrestricted Galois hyperdescent" is defined nowhere.

   **Exact repair.** Take the hypercomplete form throughout; it is the one §10.2 consumes.

   1. At README:1117 replace "obtained by imposing étale descent, then" by "obtained by imposing étale hyperdescent, that is by localizing at the étale hypercovers of smooth `k`-schemes, then", and replace ", and no unrestricted Galois hyperdescent is part of the definition" by ". Scholze's remark says étale descent; the localization at hypercovers is the one of the étale motivic categories of Cisinski–Déglise and Bachmann used in §10.2, and no comparison with the localization at Čech nerves alone is asserted".
   2. At README:1121 replace "satisfying étale descent" by "satisfying étale hyperdescent".
   3. At README:1203 replace "The Berkovich functor satisfies étale descent" by "The Berkovich functor satisfies étale hyperdescent: `Y ↦ Y^arc` preserves finite limits (§0.8) and carries a surjective étale map to an epimorphism of arc-sheaves (over a strict ring a section exists at every point, the residue fields being algebraically closed, and finitarity, §2.7(a), spreads it to a clopen neighbourhood), so étale hypercovers go to hypercovers, and the objects of `Deff_mot` are hypercomplete arc-sheaves (§1.2)".
   4. At README:1201 replace "would need a separate choice between descent and hyperdescent and is not asserted" by "is not asserted".

   **Repair tested.** After the four edits lines 1117, 1121, 1131 and 1155 name the same localization. The factorization of §10.6 needs hyperdescent of `X ↦ ℤmot[X^arc]`, which holds because `Dfin` is defined inside hypercomplete arc-sheaves (README:279). The theorems of §§10.2–10.6 are stated for algebraically closed `k` and their routes use only the cited hypercomplete statements (Cisinski–Déglise Theorem 4.5.2; Bachmann Theorem 6.6), so none changes.

2. **F02** (P3) "Analytic" is defined in a form the cited definition does not contain

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:26`: "A Banach ring is *analytic* when finitely many topologically nilpotent elements generate the unit ideal, and *uniform* when its Gelfand transform is an isometric embedding (Scholze, Definition 2.20, p. 12)."

   **Claim.** The locator supports both definitions.

   **Witness.** Scholze line 509 (Definition 2.20, p. 12) defines uniform only. Analytic is Definition 2.17, p. 11 (Scholze lines 462–463): every completed residue field is nondiscrete. The README uses both forms (§§0.3, 0.5, 0.6) and proves one implication only (§0.6).

   **Exact repair.** Replace the sentence by: "A Banach ring is *analytic* when finitely many topologically nilpotent elements generate the unit ideal; equivalently, when every completed residue field `K(x)`, `x ∈ M(A)`, is nondiscrete, the form of Scholze, Definition 2.17, p. 11. If `1 = Σ_j a_j t_j` with topologically nilpotent `t_j`, then at each `x` some `t_j` has `0 < |t_j|_x < 1`. Conversely, if the topologically nilpotent elements lie in a maximal ideal `m`, which is closed, every nonzero element of `A/m` has spectral radius at least `1` for the quotient norm, an element of quotient norm less than `1` being the image of a topologically nilpotent element; so the trivial norm of the field `A/m` is bounded by the quotient norm and gives a point of `M(A)` with discrete residue field. It is *uniform* when its Gelfand transform is an isometric embedding (Scholze, Definition 2.20, p. 12)." Add "2.17" to the list of definitions at README:1465.

   **Repair tested.** Trivially normed `k`: no nonzero topologically nilpotent element, and its one point is discrete (both fail). `ℝ`: `1/2`, and `ℝ` is nondiscrete (both hold). `ℤ_p`: the topologically nilpotent elements generate `(p)`, and the point with kernel `(p)` has residue field `𝔽_p` (both fail). The bounded product of `(ℚ_p, |·|_p^i)`, `i ≥ 1`: a topologically nilpotent element has `i`-th norm at most `p^{−i}`, so `1 = Σ a_j t_j` would give `1 ≤ M p^{−i}` for large `i`; and the ultraproduct at a nonprincipal ultrafilter has norm values in `{0, 1}` (both fail).

3. **F03** (P3) The letter `R` names three rings in §§11.3–11.6

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1254` ("`μ_n(k) ⊗_ℤ R`", a test ring never introduced), `:1267` ("The ring `R = ℚ[t^{±1}] ×_ℚ ℤ[1/p]`"), `:1303` ("the subring `R ⊕ tℚ[t]` of `ℚ[t]` generated over `R` by all `t/n`").

   **Claim.** `R ⊕ tℚ[t]` is a subring of `ℚ[t]`.

   **Witness.** As last defined (README:1267) `R` contains `t`, so it is no subring of `ℚ`; for the test ring `R = 𝔽_ℓ` of README:1254 the expression is no subring of `ℚ[t]`. Only README:1325 says "`R = ℤ[1/p]`".

   **Exact repair.**

   1. In §11.3 (README:1254) and §11.5 (README:1289, 1293) write the test ring as `S`: "over a `ℤ[1/p]`-algebra `S`, a line `L` together with compatible equivalences `L ⊗^L ℤ/n ≃ μ_n(k) ⊗_ℤ S`", "`(C^×/(1 + C_{<1})) ⊗ S`", "`S`-points of `MG_C`".
   2. At README:1267 name the coordinate ring `H`: "The ring `H = ℚ[t^{±1}] ×_ℚ ℤ[1/p]` is torsion-free, hence flat over `ℤ[1/p]`, and its augmentation ideal is `H ⊗_{ℤ[1/p]} ℚ`, flat over `H`; so the counit `H → ℤ[1/p]` has Tor amplitude in `[−1, 0]`".
   3. At README:1303 write "the subring `ℤ[1/p] ⊕ tℚ[t]` of `ℚ[t]` generated over `ℤ[1/p]` by all `t/n` … its cobar complex is `ℤ[1/p]` in degree `0`".

   **Repair tested.** `ℤ[1/p] ⊕ tℚ[t]` is closed under products (`(a + tf)(b + tg) = ab + t(ag + bf + tfg)`) and is generated over `ℤ[1/p]` by the `t/n`, since `t^d/m = (t/m) · (t/1)^{d−1}`. §11.6 already introduces `R = ℤ[1/p]` before using it and needs no change.

4. **F04** (P3) A supplier heading says "on main" of roadmaps that are not on main

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:103`: "### From TauCetiRoadmap.MotivesAndAlgebraicCycles, MotivicEtaleKTheory and other roadmaps on main".

   **Claim.** The roadmaps of this subsection are on the main branch.

   **Witness.** Main at `8c39af0` has no folder `TauCetiRoadmap/MotivesAndAlgebraicCycles`, `MotivicEtaleKTheory` or `AdicCoefficientsAndComparisons`; they are lines 92, 138 and 107 of `merge-order/ORDER.txt`, read at their open heads. The status is also time-bound.

   **Exact repair.** Rename the heading "### From TauCetiRoadmap.MotivesAndAlgebraicCycles, MotivicEtaleKTheory and further roadmaps".

   **Repair tested.** The other eight roadmaps of the subsection (ProfiniteCohomology, SchemeAndStackFoundations, EtaleCohomologyFoundations, RepresentationTheory, CharacteristicClasses, MorseNovikov on main; the three above in the merge order) are all permitted suppliers, so only the heading changes. No other sentence of the README states a branch status.

5. **F05** (P3) The manifest omits one citing section, and the README cites a copy the manifest does not record

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/sources.toml:22` (`cited_for` of `Scholze`: "…, "10.1", "10.3", "10.5", "10.6", …"); `packages/MotivesAndAlgebraicCyclesPartII/README.md:1441`: "(arXiv v3; the author's copy of 21 January 2026 has the same expressions at the same places)".

   **Claim.** The manifest lists every section that cites Scholze, and records every version the README relies on.

   **Witness.** README:1180 (§10.4) cites "Scholze, Remark 11.2, p. 57". The manifest records one version, arXiv v3 of 22 January 2026; the cached text is dated otherwise (Scholze lines 38, 40), and no entry records an author's copy.

   **Exact repair.** Add `"10.4"` to `cited_for` of the `Scholze` entry. At README:1441 replace the parenthesis by "(arXiv v3)".

   **Repair tested.** A search of the README for "Scholze," by section gives §§0.1–0.8, 1.1–1.7, 2.1–2.7, 3.1–3.5, 4.1–4.10, 5.1–5.4, 6.1–6.3, 7.1–7.7, 8.1–8.5, 9.1–9.8, 10.1, 10.3–10.6, 11.1–11.8, 12.1–12.4: only 10.4 is missing from the list. The nine corrections E1–E9 are stated against the arXiv v3 text, so nothing depends on the deleted clause.

Five findings: one P2 and four P3; one blocking. The three findings of round 7 are repaired, and the repaired passages survive the adversarial pass. The new findings are in text no earlier repair touched: a definition that names two different localizations (R01), and four corrections of a locator, a symbol, a heading and the manifest (R02–R05). No file of the package was changed by this review.

## Verified sound

### Previous findings (round 7)

| Finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2): étale morphisms with infinite fibres | README:454: "a quasi-compact étale morphism `g : Z′ → Z` … induces an étale map `Z′^arc → Z^arc`; without quasi-compactness the induced map is still finitary"; route at README:466; new Check at README:474 | Repaired. Mathlib `AlgebraicGeometry.QuasiCompact` is at Morphisms/QuasiCompact.lean:41. |
| F02 (P3): nonexistent supplier name | README:89: "§1.5 (for every perfect commutative `𝔽_p`-algebra `A` and `n ≥ 1`, multiplication by `p` on `K_n(A)` is an automorphism; `K₀` is excluded)"; README:923 | Repaired. The supplier's §1.5 (its lines 277–292) states this and excludes `K₀` in its Checks. |
| F03 (P3): "no projective-space scheme" | README:40: "The scheme `ℙⁿ_ℤ` of §0.8 is the projective spectrum `AlgebraicGeometry.Proj` …"; README:51–55; README:233, 255, 263 | Repaired. `projToSpec` (SymmetricAlgebra.lean:57, `R M : Type u`), `instIsProperProjToSpec` (:115), `projectiveLine` (ProjectiveLine.lean:139), `polynomialChartι` (:428), the covering theorem (:520), `puncturedAffineSpace` (PuncturedAffineSpace.lean:78), `PuncturedAffineSpace.homEquiv` (:208). |

No finding of the last repair report was marked not actionable. No maintainer note was left.

**Repair-pattern audit.** The pattern of F01 (a finiteness hypothesis the definition needs) was searched for in every use of "étale": §8.5 restricts to finite geometric fibres, §2.7(b) refines its cover, §§9.1, 9.5, 10.6 use only "smooth without boundary". The claim "without quasi-compactness still finitary" was checked for a non-quasi-separated target: the preimage of an affine open is a union of affine opens, each quasi-compact étale over it, and colimits of finitary maps are finitary (Scholze line 1058). The pattern of F02 (a backticked supplier name) was rechecked with `roadmaps resolve`: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The pattern of F03 (a sentence that a library has or lacks something) was rechecked for every such sentence; R04 is the one status sentence that fails.

### Principles, shape and policy

- 13 layers, 82 numbered targets, 82 *Needs* lines, 52 Checks blocks, 32 API blocks, 13 *Examples* and 13 *Dependencies* subsections; every definition has at least three Checks.
- No route-specific shortcut (residue characteristics 2 and 3, archimedean points, trivially normed fields are all treated), no algorithm, no sorry'd data, no `set_option`.
- A search of the README and the Lean file for process words, pull-request numbers, round labels, machine paths, HTML anchors, LaTeX delimiters, "optional", "deferred" and "for later" returned nothing.
- The README does not say it follows a source; no layer is named after a source's section.

### Source sample (all 15 seeded targets, read at the locator)

The author flags no locator as unverified other than BLR, settled as uncertified.

| Target | Lines read | Result |
|---|---|---|
| 0.4 | Scholze 698–737 (Def. 3.10, p. 16; Prop. 3.11, p. 17) | Definition and surjectivity of `A → K(x)` agree. The README states the bounded-product bullet for algebraically closed fields only, which is the true range (Source issues). |
| 0.8 | Scholze 157–164 (p. 4), 1095–1103 (Example 4.26, p. 26), 1286–1295 (Lemma 5.11, p. 30), 2196–2202 (Cor. 9.6, p. 52) | The four locators are where stated; the source uses these objects without constructing them. |
| 1.2 | Scholze 937–967 (Def. 4.10, Remark 4.11, Props 4.12–4.13, pp. 22–23) | Agrees, including the uniform-dimension condition for unbounded objects. |
| 1.4 | Scholze 1037–1066 (Defs 4.21–4.22, Lemma 4.23, pp. 24–25) | Agrees: the cartesian square, the six stability properties, finitary monomorphism = open immersion. |
| 2.5 | Scholze 1286–1345 (Lemma 5.11, Props 5.12–5.13, pp. 30–32) | Agrees; generation is stated for analytic affine `X` of finite cohomological dimension, as in the README. |
| 3.1 | Scholze 509–522 (§2.3, pp. 12–13), 1365–1369 (p. 32) | Power-multiplicativity and one-units agree. |
| 4.6 | Scholze 1500–1520 (Def. 6.2, Thm 6.3, pp. 35–36) | Agrees: primes with `|p| < 1` somewhere inverted; the rational sheaf statement on opens of `A¹_A` and affine subsets. |
| 4.10 | Scholze 1684–1701 (Cor. 6.9, p. 40) | Agrees. |
| 5.1 | Scholze 1805–1832 (Lemma 7.3, p. 43) | Agrees: homotopy-category statement, coherence only after cancellation, the sign between `ℤ(1)` and `Ḡ_m`. |
| 5.4 | Scholze 1841–1870 (Cors 8.1–8.2, p. 44) | Agrees: rational splitting, integral cell cofibre. |
| 7.6 | Scholze 1988–1990 (Thm 8.9, p. 47), 191–194 (Thm 1.7(iii), p. 5) | Agrees. |
| 9.3 | Scholze 2315–2325 (Lemma 10.4, p. 55) | Agrees; no surjectivity in the source either. |
| 10.1 | Scholze 2401–2404 (Remark 11.2, p. 57) | The locator is right; the source says "étale descent" and the README's route says hypercovers: R01. |
| 10.2 | CD 1896–1911 (Thm 4.5.2, Cor. 4.5.3, p. 41), 2048–2055 (Thm 5.2.2, p. 44), 2521–2529 (Cor. 5.5.5, p. 55), 2579–2587 (Cor. 5.5.7, p. 56), 2598–2610 (Remark 5.5.8, p. 57); Bachmann 553 (Lemma 3.10, p. 10), 616–624 (Cors 4.3–4.4, p. 11), 716 (Thm 5.1, p. 13), 845 (Cor. 6.2, p. 15), 861–900 (Lemmas 6.3–6.4, Thm 6.5, p. 16), 920–931 (Thms 6.6, 7.1, p. 17) | All thirteen locators are on the pages stated. The hypotheses agree: characteristic zero or 2 invertible in Cor. 5.5.7; `−1` a square at Bachmann line 880; generation by `q_*` and proper base change at lines 924–929. |
| 10.3 | Scholze 2395–2424 (Thm 11.1 and proof, pp. 57–58) | Agrees; the README's remark on `Hom(1, f_* M)` corrects a slip of the source (Source issues). |

Also read: Scholze 462–463 (Def. 2.17), 658–674 (Examples 3.4–3.6), 1030–1036 (proof of Thm 4.20), 1994–2002 (proof of Cor. 8.10), 2181–2202, 2507–2545 (Props 11.6–11.8 and the definition of `MG_C`).

### Adversarial table

Values computed in this round. "Retain" means no edit.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, "analytic" | trivial `k`; `ℝ`; `ℤ_p`; `∏ (ℚ_p, |·|_p^i)` | The two forms give (fail, fail), (hold, hold), (fail, fail), (fail, fail). | Equivalent; locator missing: R02. |
| §0.3 `A((T))_{1/2}` | `u = 1/2`, `u = 1/3` over `ℂ`; `f = 1 + 2T`; trivial `k` | `|g(a_n)uⁿ| ≤ |a_n| 2^{−n}` for `n < 0` uses `|u⁻¹| ≤ 2`; `3ⁿ > 2ⁿ`; supremum norm of `f²` is `2 > 1`, sum norm `4 ≤ 4`; over `k`, `‖gⁿ‖ ≤ 2` gives `|g| ≤ 1`, one point. | Retain. |
| §0.4 bounded products | algebraically closed `C_i`, norms `|·|^{α_i}`, `α_i → 0` | Divisible value groups give `|t_i| ∈ [1/4, 1/2]`; `t_i = 2^{−1/α_i}` has norm `1/2`: a topologically nilpotent unit. | Retain. |
| §0.4 Checks | `ℝ`; trivial `k` | Analytic and uniform, residue field not closed; no element of norm in `(0, 1)`. | Retain. |
| §0.8 | `n = 0`; disc of radius `ρ < 1` over trivial `k`; `K[ε]/(ε²)` | `B_r = A ⊗̂ ℤ = A`; `‖fⁿ‖ ≤ ρ^{mn}/(1 − ρ)` so spectral norm `ρ^{ord}`; `|ε|² = 0`. | Retain. |
| §1.2 | `Cont(S, C)`, `S` infinite profinite | `colim_j ℤ^{S_j}` = locally constant functions `≠ ℤ^S`. | Retain. |
| §1.4 | `a = 0`; `a = 1`, `r ≤ 1`; `{0} ⊂ [0, 1]` | Whole space; empty; not open. | Retain. |
| §2.5 | `U = ∅`; `A⁰_X` | `0`; the unit. | Retain. |
| §2.7(a), repaired | `⨿_ℕ Spec A`; `Spec ℂ → Spec ℝ`; `A = 0`; a non-quasi-separated target | Infinite fibre (excluded); `ℂ ⊗_ℝ ℂ = ℂ²`, 2 copies; `∅ → ∅`; finitary through unions of affine opens. | Retain. |
| §2.7 Check, `log(1 + T)` | `p = 2, 3` | `|1 + T| = 1` on `|T| < 1`; zeros `ζ − 1`, `ζ ∈ μ_{p^∞}`, `|ζ_{p^k} − 1| = p^{−1/(p^{k−1}(p−1))} < 1`. | Retain. |
| §2.7(c) | `ℙ¹_ℂ` | `3N + N = 4N`; `2 ≤ 4`. | Retain. |
| §3.1 | `−1` in `ℚ₂`, `ℚ₃`; zero ring | `‖−2‖ = 1/2`; `1`; `U¹ = {0}`. | Retain. |
| §3.5 | `T² + T/2 + 4` over `ℂ₂`; `T² − 1`; `n = 1` | Valuations `(2, −1, 0)`, slopes `−3, 1`, root norms `1/8, 2`; `min(4, 1) = 1 < 2`; both roots of norm `1`; criterion `a₀ ∈ T(r₁, r₂)`. | Retain. |
| §4.6 Check | `C⟨T⟩₁` in characteristic `ℓ` | `x̄^ℓ − x̄ = T` forces `c_{1/ℓ}^ℓ = 1` and `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m} ≠ 0` for all `m`. | Retain. |
| §4.8 Check | `‖x‖ = 2^{−⌊v₂(x)/2⌋}` on `ℤ₂` | `‖2‖ = 1`; `‖2ⁿ‖^{1/n} → 2^{−1/2}`; `c^{2k+1} ≤ 2^{−k}` for `c ≤ 2^{−1/2}`. | Retain. |
| §5.1 | `A² ∖ {0}`; complex point | `cofib(ℤ(1)[1]² ⊕ ℤ(2)[2] → ℤ(1)[1]²) = ℤ(2)[3]`; `S³`, swap `−1` on `ℤ[1] ⊗ ℤ[1]`, `+1` on `ℤ ⊗ ℤ`. | Retain. |
| §5.3 headline | complex point; `X = ∅` | `ℤ(1) = ℤ`, identity functor; `0`. | Retain. |
| §5.4 | `ℙ¹`; complex point | `ℤ ⊕ ℤ(1)[2]`; one `ℚ` in each degree `−2n`. | Retain. |
| §6.1 Check | `C = ℂ_p` | `K₀(C_{<1}) = coker(O_C^× → k^×) = 0`, `K₋₁(C_{<1}) = coker(ℤ → ℤ) = 0`, so `π₀ E_K(C) = ℤ`. | Retain. |
| §6.2 | `n = 2`; general `n` | Antipodal map, `+1` on `H⁰`, `−1` on `H²`; character `n!` at `1`, `0` elsewhere: regular representation. | Retain. |
| §6.3 headline | eigenvalues `1, 2, 4` | Projectors give `(1,0,0)`, `(0,1,0)`, `(0,0,1)`; denominators `3, −2, 6`. | Retain. |
| §7.4 Check | `ℚ_p` | `π₀ = π₋₁ = 0` for `fib(K(ℤ_p) → K(𝔽_p))`; `K₁ = 1 + pℤ_p`; fibre variant `ℚ_p^×/(1 + pℤ_p) ≅ ℤ × 𝔽_p^×`. | Retain. |
| §7.6 headline | residue characteristic `0`; `ℂ_p` | `S = ∅`; `S = {p}`, `|ℓ| = 1` for `ℓ ≠ p`. | Retain. |
| §7.7 | `π₀` | `ℤ[1/p] ×_{ℚ_p} ℤ_p = ℤ`; `E_K(C)^∧_p ≃ K(k)^∧_p = ℤ_p`. | Retain. |
| §8.5 | closed disc | `f_* f^! ℤ = ℤ(1)[2]` against `(f_* ℤ)^∨ = ℤ`; `(Ḡ_m ⊗ ℚ)[1] ≠ ℚ`. | Retain. |
| §9.3 | `Y = ∅`; `Y = X ⨿ X` | `f_* ℤ = 0`; `ℤ × ℤ`. | Retain. |
| §9.5 Check | elliptic curve over `𝔽̄_p` | `Hom(ℚmot[E], ℚ(i)[m]) = K_{2i−m}^{(i)}`, dual side `K_{m−2i}^{(1−i)}`, so `m = 2i`; `n_{0,0} = n_{1,2} = 1`; intersection matrix determinant `2`; `3 > 2`. | Retain. |
| §9.6 headline | `[0, 1]` | `RΓ(j_! ℤ) = 0` with `j_! ℤ ≠ 0`. | Retain. |
| §10.1 | `A¹`; `ℙ¹`; characteristic `p`; a non-closed field | Unit; `ℤ ⊕ ℤ(1)[2]`; `ℤ/p = 0`; two localizations named. | Fails: R01. |
| §10.2 Checks | `k = 𝔽̄₃`, `n = 2`; `n = 3` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; `x³ − x = t` has no polynomial solution. | Retain. |
| §10.3 | `f_* ℤ` | `ℤ ⊕ ℤ(−1)[−1]`, dual `ℤ ⊕ ℤ(1)[1]`. | Retain. |
| §10.4 | `ℙ¹`, `j = 1` | `π_{−2} = K₀^{(1)} = ℚ = Pic ⊗ ℚ`; `π₀ = H⁰(ℙ¹, ℚ(1)) = 0`. | Retain. |
| §10.6 headline | `k = 𝔽̄_p` | `Map(ℤ(−j), ℤ)_ℚ = K(k)_ℚ^{(j)}[−2j]`: `ℚ[0]` for `j = 0`, else `0`. | Retain. |
| §11.3 | `H ⊗ 𝔽_ℓ`; counit | `𝔽_ℓ`; ideal `(t − 1)ℚ[t^{±1}] ≅ H ⊗ ℚ`, Tor amplitude `[−1, 0]`. | Retain; symbol: R03. |
| §11.4 Check | Tate weights | `Hom(ℚ(i), ℚ(j)[m]) = K_{2(j−i)−m}^{(j−i)}`, nonzero only for `i = j`, `m = 0`. | Retain. |
| §11.5 route | `R` read as each of its three meanings | `ℤ[1/p] ⊕ tℚ[t]` is a subring; the other two readings are not. | R03. |
| §11.8 headline | `A = ℚ ⊕ ℚ(1)` | `N ≠ 0`, `N² = 0`. | Retain. |
| §12.3 headline | constant sheaf; `j_!` from the rank-one point; `n = 1` | Identity; `0 → ℤ/n`; zero category. | Retain. |

For the targets not listed, the rows of the round-6 and round-7 tables that carry computed values were relied on; the whole README was read again in this round.

### Pinned libraries

Content checkout at `8c39af0`. Opened at the pin: Mathlib `GrothendieckTopology` (Sites/Grothendieck.lean:72), `NormedField` (Normed/Field/Basic.lean:155), `IsUltrametricDist` (Ultra/Basic.lean:47), `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `continuousCohomology` (ContCohomology/Basic.lean:131), `PowerSeries.IsRestricted.subring` (Restricted.lean:90), `Scheme` (:40), `LocallyOfFinitePresentation` (:46), `Etale` (:39), `QuasiCompact` (:41), `Smooth` (:59), `AffineSpace` (:43). Tau Ceti: `unitBallIdeal`, `mem_unitBallIdeal` (UnitBall.lean:90, 101, under `SeminormedRing`, `IsUltrametricDist`, `NormOneClass`), `norm_inverse_one_sub`, `norm_inverse_one_sub_sub_one`, `isUnit_unitClosedBall_of_norm_sub_one_lt` (:160, 171, 185, with `HasSummableGeomSeries` and `IsUltrametricDist`), `isPrincipalIdealRing_isRestricted_subring` (Weierstrass/Ideal.lean:115, `NormedField`, ultrametric, complete, `0 < c`), the four cohomological-dimension declarations (Basic.lean:146, 151; ClosedSubgroup.lean:80; Strict.lean:181), `exists_etale_affineSpace` with charts `𝔸(ULift (Fin n); S)` (EtaleCoordinates.lean:73–86), `ExactK0` (Exact.lean:179), `StableGeneralLinearGroup`, `AlgebraicK1` (Stable.lean:155, 314), and the projective-space declarations listed under F03. Each hypothesis the README states is the one at the pin.

### Headline theorems, padding and the Lean file

- `lake env lean` on `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is `import Mathlib`, one module docstring and an empty namespace.
- The nine headline families of the Summary (cancellation; `Kmot` finitary with its Adams splitting; the explicit K-cofibre; torsion and tilting; six operations and proper base change; rigidity; the étale comparison; the monodromy equivalence; the overconvergent comparison) are each named in the docstring with the missing carrier. None is statable: each needs `Dfin`, `Deff_mot`, `Dmot`, a K-theory spectrum or v-stacks, and none exists at the pins.
- The one-tactic probe and the `#check @name` audit have no input: zero declarations, nothing compared, nothing changed. `library-matches.md` and `signatures.md` are empty for the same reason.
- No backticked name in the README is presented as a Lean declaration of this roadmap.

### Duplication, suppliers and order

- Every cited supplier section was found as a heading at the supplier's present head (main, or the open head through `roadmaps show`): KTheoryFiniteLocalFields §§1.5, 1.6, 2.1, 6.5; SchemeKTheoryOperations §§2.6, 3.1, 3.3, 3.4, 3.8, 6.4, 6.8, 6.11, Layer 5; TropicalAndBerkovichArithmetic, the 26 sections of README:59; AnalyticStacks §§0.4–0.6, 0.9, 0.10, 1.1, 1.5; RefinedTraceMethods §§4.10, 4.20; MotivicEtaleKTheory §2.2; GeneralAlgebraicKTheory §§3.2, 8.3, 8.10, 10.10, 13.4, 13.5, 13.8c; GeneralAlgebraicKTheoryPartII §1.2; EtaleCohomologyFoundations §§F.2.1, F.2.3, F.3.0; MotivesAndAlgebraicCycles §§4.1–4.3, 4.6, 4.9, 4.11, 4.15, 4.18; DiamondEtaleCohomology, nine sections; DiamondSixOperations §§S2.4, S4.2, S4.3; AdicCoefficientsAndComparisons Layer L5; SchemeAndStackFoundations §2.16; ProfiniteCohomology §10.2, Layer 11; CharacteristicClasses §C5; AnabelianGeometryAndNonabelianChabauty, "Generalized Jacobian of a reduced boundary".
- Content read where the heading does not show it: SchemeKTheoryOperations §2.6 has the vanishing of negative K-groups for regular noetherian schemes (its line 747); §6.11 has `ψ^k j_* = j_*(θ^k(N) ψ^k)`, which is `k^c` for a trivial conormal bundle of rank `c`; GeneralAlgebraicKTheory §13.8c is the finite-field computation; TropicalAndBerkovichArithmetic §0.1 imports the complete spectrum from AdicSpacesPartIII §R3.9 and owns only its native presentation, so the spectrum has one owner.
- Declared gaps: the nine slugs agree between the README and `design/plan.json`, each with a named supplier and section. None is provided today: EnhancedDerivedSheaves has no "covering dimension", "fracture" or Breen–Deligne statement; SchemeKTheoryOperations has no homotopy K-theory and no valuation-ring statement; KTheoryFiniteLocalFields §2.1 is rigidity for henselian pairs and its §6.5 treats local fields, not `O_C`; TropicalAndBerkovichArithmetic has no effective descent for finite projective modules. Each `needs` sentence addresses one supplier section and carries its hypotheses.
- Ownership against open pull requests was checked by object with `roadmaps grep` at the 462 open heads and on main: `Marc(`, "arc-stack", "ball-invariant", `Dmot(`, `DM_et`, "tale motiv", "motivic nearby", "Banach arc", "rigid-analytic motiv": no match outside this package. "Berkovich motiv" matches bibliography lines only. This roadmap owns the Banach arc-site, `Deff_mot`, `Dmot`, `Kmot` and `DM_et(k, ℤ)`.
- The overlap report lists no conflicting head, no dropped id, no revision-only id and no second copy.

Dependency check output:

```text
depcheck: 242 roadmaps, 2264 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is line 381 of the merge order; its latest supplier is GeneralAlgebraicKTheoryPartII at line 335.

Overlap check: read ArcTopologyAndDescent, AnalyticStacks, DiamondEtaleCohomology, EnhancedDerivedSheaves, VStackSheavesAndLisseCategories, DiamondsAndVStacks, AdicSpacesPartIV; nothing shared. ArcTopologyAndDescent owns the arc-topology on schemes and this roadmap the one on Banach rings; AnalyticStacks (its line 1303) leaves the monodromy-operator identification to this roadmap and owns the comodule description; EnhancedDerivedSheaves §E5:presentability.4 owns compact morphisms, which §0.1 here applies without stability.

### Copyright and arrangement

- **Wording.** 24 passages were set beside the sources at the locator: the 15 sampled targets (Scholze, CD, Bachmann), the Conventions, the routes of §§4.10, 7.7, 9.3, 10.3 and 5.4, the definitions of §§1.2 and 1.4, §11.5 and the module docstring. The longest shared runs are forced statements: 8 words in §1.2 against Scholze line 940, 5 words in §7.7 against Scholze line 1997. The route of §7.7 has the three steps of the proof at Scholze 1994–2002 in the order the argument forces, in other words and with two added cases; the route of §9.3 likewise against Scholze 2320–2325.
- **Arrangement.** Scholze has sections 2–12. Against the layers: `Layer 0 ↔ §§2–3 and part of §4`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5`, `Layer 4 ↔ §6`, `Layer 5 ↔ §7 and Cors 8.1–8.2`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11 with CD and Bachmann`, `Layer 12 ↔ §12`. Not one to one: three splits, one merge, two transfers, and §§0.8, 2.7, 10.2 and 10.4 with no counterpart. The *Dependencies* lines force 0 < 1 < … < 6 and 8 < 9 < 10 < 11; Layers 7 and 8 are parallel and Layer 12 needs only Layers 0, 4 and 9.
- **Reuse.** No table, figure or list is taken over. The Lean file declares nothing.

Source independence: 24 passages compared with 3 sources (Scholze, CD, Bachmann; vanDerPut and Vakil were outside this round's sample), none shared beyond forced statements of at most 8 words; largest share Scholze, 98 of 109 locators; contents compared with Scholze: independent.

## Not verifiable

- BLR §9.2: settled as uncertified; not read and not requested.
- "The author's copy of 21 January 2026" (README:1441): not in the manifest and not in the cache; R05 removes the clause.
- The nine supplier gaps are contracts for future work: their declaration, owner, hypotheses and present absence were checked, their truth was not.
- vanDerPut and Vakil locators were not reread this round; rounds 6 and 7 record the lines read.

## Source issues

- **Error** in Scholze at Proposition 3.11(i), p. 17: the source says a bounded product of nondiscrete Banach fields is totally disconnected; it should require topologically nilpotent units of norms uniformly away from 0 and 1 (it fails for `ℚ_p` with the norms `|·|_p^i`); affects a stated result.
- **Misprint** in Scholze at the proof of Theorem 11.1, p. 57: the source says the dual of `f_* ℤ` represents `M ↦ Hom(1, f_* M)`; it should be `Hom(1, f^* M)`, for `M` over the residue field; affects nothing.
- **Gap** in Scholze at Remark 11.2, p. 57: the source says étale descent without saying whether Čech nerves or hypercovers are inverted; it should say which, since the literature it compares with uses hypercovers; affects nothing.

Of the README's corrections, E5, E6, E8 and E9 were recomputed in this round (the rows of §§3.5, 10.4, 11.1 and 0.4 above) and hold; E1–E4 and E7 were not rechecked and are not repeated.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c12cad952eb94031c933bb17c4b4af129231faae", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~8", "model": "fable", "worker": "chris-x89"} -->
