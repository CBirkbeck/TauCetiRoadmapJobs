<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17628#issuecomment-6904762758 -->
Red team round 1 pass a (claude) of 6f5187e

Verdict: needs_changes

1. **F01** (P3) `graph` docstring claims independence of the representative for arbitrary schemes

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean:58-61`: "The image does not depend on the
     representative."
   - **Claim.** The definition is stated for every `X Y : Scheme` with no instance hypotheses, so the sentence is read at
     that generality.
   - **Witness.** `X = Spec k[x,y]/(xy, y²)`, `Y = Spec k`, `f` the structure map. Representative `V = X`: image `≅ X`.
     Representative `V = D(x)`: the kernel of `k[x,y]/(xy,y²) → k[x,x⁻¹]` is `(y)`, image `Spec k[x] ≠ X`.
   - **Repair.** Replace the sentence by: "For a reduced `X` the image does not depend on the representative (README
     §1.2)." Tested on the witness: `X` there is not reduced, so it is excluded; for reduced `X` two representatives agree on
     a dense open `W`, and `O_V → j_*O_W` is injective, so both images are the image of `W`. The README (§1.2, lines 189
     and 194) already scopes the statement to projective varieties and needs no change.

2. **F02** (P3) headline bullet promises projectivity of the graph; the acceptance statement does not state it

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md:149`: "integrality, projectivity and the projection
     properties of the graph (§1.2);".
   - **Claim.** The headline list says `Suggested.lean` states these.
   - **Witness.** `Suggested.lean:89-95` (`graph_isIntegral_and_projections`) has five conjuncts: `IsIntegral`, dimension,
     `IsProper (graphFst f)`, `IsIso (graphFst f ∣_ f.domain)`, surjectivity of `graphSnd f`. No `IsProjectiveOver`.
     README line 200 lists the same five, so line 149 disagrees with line 200 and with the Lean.
   - **Repair.** Replace the bullet by: "integrality and dimension of the graph, and the properties of its two projections
     (§1.2);". Projectivity stays a README target of §1.2 (first item).

3. **F03** (P3) padding: `algebraicEntropy_baseChange` is `dynamicalDegree_baseChange` under `Finset.sup'_congr`

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean:451-468`.
   - **Claim.** A separate headline.
   - **Witness.** `algebraicEntropy` (line 318) is `Real.log` of `Finset.sup'` over `k ∈ range (d + 1)` of
     `dynamicalDegree K d k f ω`. With identical hypotheses, `dynamicalDegree_baseChange` (line 415) rewrites each term for
     `k ≤ d`; the statement follows by `Finset.sup'_congr`.
   - **Repair.** Delete the declaration from `Suggested.lean`. In `README.md:667` replace the last sentence by:
     "Invariance under extension of the field, in the second item, follows term by term from `dynamicalDegree_baseChange`
     for `0 ≤ k ≤ d`." Remove `algebraicEntropy_baseChange` from the README (it must not name an undeclared declaration).

4. **F04** (P3) `mixedDegree_comp_le` carries a hypothesis the multiplied form does not need

   - **Location.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean:244` (`hL₂d : 0 < realIntersection K X₂ fun _ :
     Fin d ↦ L₂`), and `README.md:550` ("Since `(L_2^d) > 0` this is … the acceptance statement").
   - **Claim.** The acceptance statement needs `L_2` to be a real polarization.
   - **Witness.** `ℙ¹ × ℙ¹`, `f₁ = f₂ = id`, `p = q = 1`, `L₂ = O(1,0)` (`(L₂²) = 0`), `L₁ = L₃ = O(0,1)`: left side
     `0·0 = 0`, right side `2·1·1 = 2`. In general §3.6 assumes no positivity of `B` (README line 448), and the route of
     §4.4 divides only by `e(f_1) > 0`.
   - **Repair.** Delete the binder `(hL₂d : …)` from `mixedDegree_comp_le`; in its docstring replace "`L_1`, `L_3` nef real
     classes and `L_2` a real polarization" by "`L_1`, `L_2`, `L_3` nef real classes". In `README.md:550` replace "Since
     `(L_2^d) > 0` this is" by "Multiplied by `(L_2^d)` this is" and append after "`f₁.comp f₂`.": "The multiplied form
     holds for every nef `L_2`: §3.6 needs no positivity of `B`, and the route divides only by `e(f_1)`." Add to the §4.4
     Checks: "Degenerate `L_2`: on `ℙ¹ × ℙ¹` with `f_1 = f_2 = id`, `k = 1`, `L_2 = O(1,0)` and `L_1 = L_3 = O(0,1)`,
     the multiplied form reads `0·0 = 0 ≤ 2·1·1 = 2`; the divided form is `0/0`." Tested on the witness.

Four P3 findings. No P1 or P2: every Lean statement was instantiated on its boundary cases and held, every
cross-roadmap citation resolves at the supplier's current text, and every pinned declaration is where the README says.

## Record of the pass

### Suggested.lean declarations (33)

Context for all: `namespace TauCetiRoadmap.DynamicalDegreesOfRationalMaps`, `universe u`, `noncomputable section`, no
`variable` and no `include`; every binder is in the declaration's own signature (compared with the worker's elaborated
signatures, which show none dropped).

| declaration | kind | instances tried | values on each side | result |
| --- | --- | --- | --- | --- |
| `graph`, `graphFst`, `graphSnd` | def | `id_X`; `z ↦ z²`; non-reduced `X` (R01) | diagonal; `≅ ℙ¹`; image depends on `V` | body right; docstring R01 |
| `topologicalDegree` | def | `z²` in char 2; projection `ℙ² ⤏ ℙ¹` | `2`; `finrank = 0` (junk) | right |
| `graph_isIntegral_and_projections` | theorem | without `IsOver`: `X ×_ℤ Y → X` not proper; `d = 0`; constant map | properness needs `IsOver` (present); `Spec L`; `π_2` not surjective, dominance guards it | true |
| `numericalIntersection` | def | `r = 0`, `Spec L`; `ℙ¹`, `O(−2)`, `r = 1`; `P = n_1² + n_1n_2` | `[L:K]`; `(0−1)−(1−0) = −2`; `2−1−0+0 = 1` | right |
| `realIntersection` | def | `[O(1,0)]+[O(0,1)]−[O(1,1)]` on `ℙ¹×ℙ¹`; `r = 0` | `2−4+2 = 0`; empty product `·[L:K]` | right |
| `IsNef` | def | `−O(1)` on `ℙ¹`; `2O(1,1)−O(1,0)`; compared with the `IsNef` of AlgebraicModuliForArithmeticGeometryPartII `Suggested.lean:116` | `−1`; degrees `2, 1`; same test curves on proper `X` | right, no name clash (different namespace) |
| `khovanskii_teissier` | theorem | `O(2,1), O(1,1)`; `ℙ²⊔ℙ²` | `8 ≤ 9`; `25 > 16`, excluded by `IsIntegral` | true |
| `siu_inequality_products` | theorem | `(ℙ¹)³`, `i=2, j=1`; `i=1, j=2`; `i=j=1`; `i=j=0`; `(B²)=0` | `6 ≤ 8`; `6 ≤ 6`; `2 ≤ 2`; `c² ≤ c²`; `0 ≤ 2` | true |
| `mixedDegree` | def | `z²`, `(p,q) = (1,0), (0,1)` | `1`, `2` | index convention as README |
| `mixedDegree_pos` | theorem | `d = 0`; `ω = O(1,0)` | `[L:K] > 0`; `0`, excluded by `hLd` | true |
| `mixedDegree_boundary` | theorem | `d = 0`, `Spec K_1 → Spec K_2`; `z²` | `[K_1:K] = [K_1:K_2][K_2:K]`; `(1, 2)` | true |
| `mixedDegree_baseChange` | theorem | `ℙ¹_ℂ/ℝ`, `id`, `K' = ℂ` | `2 = 1 + 1` | true |
| `mixedDegree_comp_le` | theorem | `z²∘z²`; Cremona; `(L_2^d) = 0` | `4 ≤ 4`; `1 ≤ 8`; `0 ≤ 2` | true; R04 |
| `exists_mixedDegree_comparison` | theorem | swap on `ℙ¹×ℙ¹`; `E×E` | ratio `5/2`, `C = 9`; `9/2`, `C = 25` | true |
| `isDominant_partialIso` | instance | grep of both pins for an existing instance | none | needed for the conjugate to type-check |
| `exists_mixedDegree_birational_comparison` | theorem | order of `comp`: `Y → X → X → Y` | `φ ∘ f ∘ φ⁻¹` | true |
| `iterate`, `isDominant_iterate` | def, instance | `n = 0, 1, 2` | `id`, `f.comp id`, `f.comp (f.comp id)` | right |
| `dynamicalDegree`, `algebraicEntropy` | def | `n = 0` term; `d = 0` | `x^0 = 1`; `log 1 = 0` | right |
| `tendsto_dynamicalDegree` | theorem | `d = 0`; morphism of degree `a`, `1 ≤ k ≤ d−1` | `(C_0·[L:K])^{1/n} = 1`; inf `= a^k`, not attained | true |
| `one_le_dynamicalDegree` | theorem | Cremona; `d = 0` | `1`; `1` | true |
| `dynamicalDegree_eq_of_polarizations` | theorem | `O(1,1)` vs `O(2,1)`, swap | both `1` | true |
| `dynamicalDegree_iterate` | theorem | `m = 0` | `lim (ω^d)^{1/n} = 1 = λ^0` | true |
| `dynamicalDegree_zero_and_top` | theorem | Frobenius; `d = 0` | `p^d`; `1 = e` | true |
| `dynamicalDegree_log_concave` | theorem | Fibonacci; `d ≤ 1` | `1 ≤ φ²`; vacuous | true |
| `dynamicalDegree_birational_conj` | theorem | Cremona conjugated by `PGL_3` | `1 = 1` | true |
| `dynamicalDegree_baseChange` | theorem | conjugation on `ℙ¹_ℂ/ℝ`; absolute Frobenius over `𝔽_p(t)` | both excluded by `f'.IsOver` | true |
| `algebraicEntropy_iterate` | theorem | `n = 0`; morphism | `0 = 0`; `nd log a` | true |
| `algebraicEntropy_bounds` | theorem | `d = 0` (junk `λ_1`) | `0 ≤ 0 ≤ 0·log(junk) = 0` | true |
| `algebraicEntropy_baseChange` | theorem | one-tactic probe | `sup'_congr` of line 415 | R03 |

### README targets (27)

| target | instances tried | values computed | result |
| --- | --- | --- | --- |
| §1.1 | `z²` char 2; Frobenius; cuspidal normalization; projection | `2`; `p^d`; rank `1`, fibre `2`; junk `0` | sound |
| §1.2 | `id`; Cremona; constant map; absolute vs `K`-product | diagonal; blow-up; not surjective; `X×_K Y` closed in `X×Y` | sound |
| §1.3 | `ℙ¹_ℂ/ℝ` triple diagonal; `z², z²` | degrees `1,1,1`; `(q_Y,q_Z)` degree `2 = e(f)` | sound |
| §1.4 | `ℙ¹_ℂ/ℝ`; `𝔾_m → 𝔸¹` at origin; kernel chain `ker_comp`, `map_bot`, `ker_fst_of_isClosedImmersion` | two diagonals; `∅` vs point; `⊥.map i = i.ker` | sound |
| §2.1 | double point; line ∪ point; `V(xy)` | `2`; `1`; `2` | sound |
| §2.2 | blow-up, `χ(O(bE))` | `1 + (b−b²)/2`, `(E²) = −1` | sound |
| §2.3 | `√2·O(1,0)+O(0,1)`; formal zero | `2√2`; `0` | sound |
| §2.4 | `ℙ¹_ℂ/ℝ`; `x²+ty²` over `𝔽_2(t)` | `c_V = 2`; `K' = K(√t)`, `2 = 2·1` | sound |
| §3.1 | `A` on `E×E`; decomposition of `A+F_1+F_2`; `m = 3`, `δ = 1/5`, `N = 100` | det `0`, trace `3`; coefficients `2+√2, 3+√2, −√2`; dets `−0.0463`, `0.5897`, `5897` | sound |
| §3.2 | `O(1,−1)`; double line | `−2`; `2n+1` | sound |
| §3.3 | `(1,1),(1,0),(0,1)`; `E×E` | `2 ≤ 2`; `24 ≤ 30` | sound |
| §3.4 | `D''` identity; `H = 2L+E`; two-point blow-up | `(H'²)[(H'²)(D²)−(D·H')²]`; `1 ≥ −3`; `0 < 1` | sound |
| §3.5 | `A+εI` | `(3+2ε)² − (12ε+4ε²) = 9` | sound |
| §3.6 | telescoping `x_j, y_j`; `ℙ²⊔ℙ²` | `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}`; `5 > 2` | sound |
| §4.1 | model `q_1 = f` | `2 = 2·1` | sound |
| §4.2 | monotonicity non-example | `2 → 1.5` | sound |
| §4.3 | cuspidal cubic | `3 = 3` | sound |
| §4.4 | route on `W`; `k = 0, d` | both sides carry `e(f_1)`; equalities | sound; R04 |
| §4.5 | `C_1 = (d−k+1)^{2k}c(ω,ω')`; `E×E` swap | `9/4, 9/16, C = 9`; `tr = 9`, `C = 25` | sound |
| §5.1 | `u_0/0 = 0`; `d = 0` | bounded below; `1` | sound |
| §5.2–5.4 | Fibonacci; `(x², y)` | `(1, φ, 1)`; `(1,2,2)`, `log 2` | sound |
| §6.1 | Cremona overlap; `σ∘[x_i²]`; `d = 0` | unit `x_1/x_0`; degree `4`; degree `0` | sound |
| §6.2 | section of `aA − B`; Cremona | `a·deg_k ≥ deg_{k+1}`; `δ_2 = 4 − 3` | sound |
| §6.3 | `f²`, `f³`; `n = 0` | `[xyz:xy²:z³]`, `[xy²z²:x²y³:z⁵]`; `(1,y,z)` not homogeneous | sound |
| §6.4 | `(y,z,x+yz)`; `(x,xy)` | degrees `2,3,5`; fibre over `(0,1)` empty | sound |

### Dependency check

```text
depcheck: 236 roadmaps, 2238 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** 33 of 33 (11 definitions, 2 instances, 20 theorems); every one compared with the worker's
  elaborated signature and with its README statement. Every Lean name occurs in the README (scripted).
- **Targets read:** 27 of 27, every line of the README and of `Suggested.lean`.
- **Pinned declarations:** all 98 line citations of the two contract sections checked against the pins (88 by script,
  10 by hand); all at the cited line. Statements of 22 of them read at the pin and matched to the contract wording
  (`PartialIso.IsOver`, `comp`, `toPartialMap`, `ker_comp`, `map_bot`, `ker_fst_of_isClosedImmersion`, `of_isPullback`,
  `eulerCharBelow`, `eulerCharBelow_congr`, `intersectionNumber`, `intersectionNumber_eq_finrank_mul`,
  `IsProjectiveOver`, `GeometricallyIntegral`, `canonicallyOverPullback`, `functionFieldMap`, `functionFieldAlgHom`,
  `ext_of_functionFieldMap_eq`, `isReduced_image`, `toHom`, `toRationalMap_toHom`, the two `Geometrically/FunctionField`
  results, the two twisting-sheaf lemmas, `Subadditive.tendsto_lim`).
- **Sibling citations checked:** every cited section (35 across 8 roadmaps), each heading present and the consumed statement read at the supplier's
  current text: CyclotomicClassGroupsAndStickelberger §4.3 (main); AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1,
  1.2, 1.4, 1.5, 1.7 (main); AlgebraicModuliForArithmeticGeometry §§1.4, 5.4, 9.10 (main);
  ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3 (open head); LefschetzPencilsAndVanishingCycles §5.1 (open head);
  SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1–5.3, 5.9, 5.10
  (main, headings; 2.6, 4.19, 5.9, 5.10 read); StableReduction Layer 2 (main); ArithmeticDynamics §§0.18, 0.26 (open
  head). None of the excluded roadmaps is cited.
- **Ownership:** searched all open heads and main for the graph of a rational map, topological degree, dynamical degree,
  algebraic entropy, Khovanskii–Teissier, Siu's inequality, flat base change of scheme-theoretic images,
  `numericalIntersection`, `IsNef`. No second owner; AlgebraicModuliForArithmeticGeometry §9.10 (smooth, characteristic
  zero, no mixed factors) and ArakelovGeometryAndAbelianHeightsPartII §0.3 (volume form of Siu) are cited as such.
- **Locators verified:** every line-numbered locator of the README (81 distinct line ranges, 13 certified
  sources) opened at its first line in the cached texts; each supports the claim it is cited for.
- **Checks tested:** all 126 read; the arithmetic of about 70 recomputed by hand (every Check of Layers 2–5 with a
  number, and the Cremona, Fibonacci, `E × E` and chart-overlap series); none false, vacuous or a restatement. Every
  definition has at least three.
- **Policy:** the pull request changes only the package folder; no `lemma`, `set_option`, `#eval`, `#check`, process
  words or pull-request numbers; one `import Mathlib` and five existing Tau Ceti modules; no machine path; no declared
  gap and none needed.
- **Arrangement:** layers 1–6 against the contents of dangfavre2021 (§§1–6) and dang2020 (§§1–6): only Layer 3 and
  dang2020 §3 share a subject; no run of layers maps onto a run of sections.

## Not verifiable

- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4,
  Proposition 2.5): uncertified, cited by locator, text not read. dang2020 line 842 cites the bigness criterion as
  Theorem 2.2.13 where the README has 2.2.15; which numbering is the book's could not be checked.
- Elaboration: no Lean was run in this pass. The worker's `signatures.md` reports one tool error ("line 474: unexpected
  token ','") from a `#check @,` it generated out of the word "class" in the module docstring; it is not a declaration
  of the file.
- truong2020 Theorem 5.3: the standing hypotheses of its §5 were not traced beyond lines 1102–1106.
- The description of Mathlib's `Scheme.Hom.finrank` through its private `IsAffine.finrank` (README line 65) was not
  unfolded.

## Source issues

- **Misprint** in dang2020 at proof of Theorem 3.4.4, printed page 18: the closing display has the constant with `n − i + 1`; it should be `r − i + 1`, as in the statement and the preceding lines; affects nothing.
- **Misprint** in dang2020 at Theorem 5.2.1, printed page 25: both lower arrows of the composition diagram are labelled `g_2`; the first should be `g_1`; affects nothing.
- **Error** in dinhsibony2005 at proof of Corollaire 7, printed page 7: it says the sequence converges to the infimum over `n ≥ 1` of the `n`-th roots of `δ_l(f^n)`; it should be the infimum of the `n`-th roots of `c_X·δ_l(f^n)` (on `ℙ¹×ℙ¹`, `(x², y)`, `ω² = 1`: `3/2 < 2`); affects the proof.
- **Misprint** in guedj2010 at Théorème 2.4 (a), line 1180: the log-concavity range is given as `1 ≤ l ≤ k`; it should be `1 ≤ l ≤ k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in silverman2014 at Example 6, line 376: the degree of the `n`-th iterate is given as `F_n`; it should be `F_{n+2}` in the indexing of Example 5 (degrees `2, 3, 5`); affects nothing.

Source independence: 87 passages compared with 13 sources (the 81 locator ranges and 6 further prose passages: the correspondence paragraph of the scope, the §1.2 graph definition, the §3.3 and §3.6 routes, the §5.1 route, the docstring of `mixedDegree_comp_le`), none shared; largest share dangfavre2021, 16 of 101 locators; contents compared with dangfavre2021 and dang2020: independent. Not read: lazarsfeld2004, fulton1998 (uncertified).

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6f5187e7eeb12825ee2824fa868cc8b1f54a5549", "job": "RT-DynamicalDegreesOfRationalMaps~1a", "model": "fable", "worker": "chris-x26"} -->
