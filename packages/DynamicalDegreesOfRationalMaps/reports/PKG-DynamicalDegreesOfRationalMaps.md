# PKG-DynamicalDegreesOfRationalMaps

Deliverables: `packages/DynamicalDegreesOfRationalMaps/README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.AG"`, as the algebraic-geometry folders on main), `sources.toml` (two locators extended). `design/plan.json` is unchanged: `gaps` stays empty, because every supplier section consumed states what is consumed.

The README is the accepted design written out, with the Lean names of `Suggested.lean` placed at their definitions and statements, and with the corrections listed below. Every target, Check and worked example of the design is kept; three Checks were added (§2.3, §3.6, §5.1). Per subsection the Checks are now `8,5,4,5 | 3,3,5,4 | 8,6,4,4,4,4 | 4,6,3,5,4 | 4,3,3,4 | 6,4,4,5`, each subsection with one *Needs:* line, each layer ending with Examples and Dependencies.

The accepting review (round 15) listed no finding and no maintainer note; its one remark (flatness in §1.1 *Agreement with the rank* is the hypothesis of the cited Tau Ceti theorem) needs no change.

## Headline theorems

| Headline (README) | Status | Lean name |
| --- | --- | --- |
| Graph: integral, `dim Γ_f = dim X`, `π_1` proper and an isomorphism over the domain, `π_2` surjective for dominant `f` (§1.2) | stated | `graph_isIntegral_and_projections` |
| Khovanskii–Teissier over an arbitrary field, nef real classes (§3.5) | stated | `khovanskii_teissier` |
| Siu's inequality for products, nef real classes (§3.6) | stated | `siu_inequality_products` |
| Boundary values `deg_0 = (L^d)`, `deg_d = e(f)(M^d)` (§4.2) | stated | `mixedDegree_boundary` |
| Positivity of the degrees for real polarizations (§4.2) | stated | `mixedDegree_pos` |
| Invariance of the degrees under extension of the field (§4.3) | not statable for `f_{K'}` (see below); the graph form is the imported field-extension compatibility of CyclotomicClassGroupsAndStickelberger §4.3 applied to `Γ_f`, so it is no headline of this roadmap | — |
| Sub-multiplicativity with constant `(d−k+1)^k/(L_2^d)` (§4.4) | stated, multiplied out | `mixedDegree_comp_le` |
| Comparison of polarizations (§4.5) | stated | `exists_mixedDegree_comparison` |
| Birational conjugacy of the degrees (§4.5) | stated | `exists_mixedDegree_birational_comparison` |
| Existence of `λ_k` and `λ_k = inf_n (C_k(ω) deg(f^n))^{1/n}` (§5.1) | stated | `tendsto_dynamicalDegree` |
| `λ_k ≥ 1` (§5.2) | stated | `one_le_dynamicalDegree` |
| Independence of the polarization (§5.2) | stated | `dynamicalDegree_eq_of_polarizations` |
| `λ_k(f^m) = λ_k(f)^m` (§5.2) | stated | `dynamicalDegree_iterate` |
| `λ_0 = 1`, `λ_d = e(f)` (§5.2) | stated | `dynamicalDegree_zero_and_top` |
| Log-concavity (§5.2) | stated | `dynamicalDegree_log_concave` |
| Birational invariance of `λ_k` (§5.3); normalization invariance is its case `φ = ν^{−1}` | stated | `dynamicalDegree_birational_conj` |
| Invariance of `λ_k`, `h_alg` under extension of the field, geometrically integral `X` (§§5.3–5.4) | not statable: lacks the base-changed rational map `f_{K'}`; Mathlib's `Scheme.PartialMap` carries the density of its domain as a field, and the density of the base-changed domain is a theorem, so `f_{K'}` is a construction of §1.4, not a definition with a real body at the pins | — |
| `h_alg(f^n) = n h_alg(f)` (§5.4) | stated | `algebraicEntropy_iterate` |
| `log e(f) ≤ h_alg(f) ≤ d log λ_1(f)` (§5.4) | stated | `algebraicEntropy_bounds` |
| Projective space: `deg_{1,H}(f) = a`, Cremona, Fibonacci `λ_1 = Real.goldenRatio`, polynomial maps of `𝔸^d` (§§6.2–6.4) | not statable: lacks the rational map `[F_0 : ⋯ : F_d]` attached to forms, which §6.1 constructs by gluing the morphisms that Mathlib's `AlgebraicGeometry.Proj.fromOfGlobalSections` (ProjectiveSpectrum/Basic.lean:442, a map from `A` to global functions) gives on the charts `D_+(F_i)`; neither library has the glued map, and its dominance is a theorem about it | — |

Definitions in `Suggested.lean`, each with a real body: `graph`, `graphFst`, `graphSnd` (image of `(ι_V, g)` for Mathlib's `Scheme.RationalMap.representative`, in the absolute product), `topologicalDegree` (finrank over the image of Tau Ceti's `Scheme.Hom.functionFieldMap` of the representative), `numericalIntersection` (mixed difference of Tau Ceti's `eulerCharBelow` truncated at `r + 1`, descended to classes by `LineBundleClass.lift` and `eulerCharBelow_congr`), `realIntersection` (multilinear expansion over `Fintype.piFinset` of the supports), `IsNef` (curve degrees by Tau Ceti's `LineBundleClass.intersectionNumber`), `mixedDegree`, `iterate`, `dynamicalDegree` (`Filter.limUnder`), `algebraicEntropy`; proved instances `isDominant_iterate`, `isDominant_partialIso`. No sorry'd data, no `set_option`, no `lemma`, imports `Mathlib` and five Tau Ceti modules (Cohomology/EulerCharacteristic, IntersectionNumber/Basic, LineBundle/Functoriality, Morphisms/Dominant, ProjectiveSpectrum/ProjectiveOver), all present and built at the pin.

Ownership: `numericalIntersection` and `IsNef` write out, for elaboration only, objects owned by CyclotomicClassGroupsAndStickelberger §4.3 and AlgebraicModuliForArithmeticGeometryPartII §1.5; the README says so in "Scope and ownership". No declaration has the fully qualified name of a declaration of another roadmap (the namespace `TauCetiRoadmap.DynamicalDegreesOfRationalMaps` is used by no other roadmap; SchemeAndStackFoundations' surface pairing is `Chow.intersectionNumber` in its own namespace).

## Corrections to the design

1. §3.6 generalised: the hypotheses `(B^r) > 0`, `r ≥ 1`, `i ≥ 1` are dropped. When `(B^r) = 0` the left side is `0` and the right side is a product of numbers `≥ 0` by §3.2; the route (approximation by ample line bundles, for which `(B^r) > 0`) never used the hypothesis. New Check (`B = O(1,0)` on `ℙ¹ × ℙ¹`: `0 ≤ 2`) and the case `i = 0`.
2. Layers 1–5 allow `d = 0` (Conventions; "Throughout" of Layers 4 and 5); only Layer 6 assumes `d ≥ 1`, which is where the design's reason (`ℙ⁰`, empty tuples) lives. New Check in §5.1 for `X = Spec L`.
3. §5.2: `λ_k(f^m) = λ_k(f)^m` holds for `m = 0` too (both sides `1`).
4. §1.2: the README explains why the graph of `Suggested.lean` (image in the absolute product of a chosen representative) is `Γ_f`, with the locator stacks-morphisms Lemma 6.7 (line 488), and cites Lemma 6.8 (line 493) for the isomorphism over the domain.
5. Conventions: projectivity read as Tau Ceti's `Scheme.IsProjectiveOver`; numerical intersections written as a mixed difference, with the locators stacks-varieties Lemma 45.1 (line 4679) and Definition 45.3 (line 4754) and the witness `O(−2)` on `ℙ¹` (truncation at `2` gives `−2`, at `1` gives `−1`); real classes as formal combinations `LineBundleClass X →₀ ℝ`, with the new §2.3 Check (`[O(1,1)]` versus `[O(1,0)] + [O(0,1)]`: `2 = 0 + 1 + 1 + 0`; their difference `2 − 4 + 2 = 0`).
6. §6.1 route: the existence item now names its construction (charts `D_+(F_i)`, `Proj.fromOfGlobalSections`, gluing on the dense complement of `V(F)`).
7. Layers 4 and 5 say "dominant `K`-rational maps", as the Lean statements assume.
8. Style: "What is left out, as motivation for later roadmaps" became a timeless sentence.

What the README could not support: nothing beyond the two non-statable groups above, which stay README targets. Notions moved down from later roadmaps: none.

## Duplication sweep

Searched by object, README text on main (now `c639cfa`) and at the heads of the open roadmap pull requests the tools index (455 heads, index of 2026-11-15T22:25Z), and the pins: "dynamical degree", "algebraic entropy", "graph of a rational map", "Fibonacci map", "first dynamical degree", "dominant rational self-map", "arithmetic degree", "Kawaguchi": no match. "Khovanskii"/"Teissier": only AlgebraicModuliForArithmeticGeometry §9.10 (`nefMixedIntersectionBound`, ample `L` and nef `H` on smooth geometrically integral varieties in characteristic zero), already named in Scope with its clause of difference. "nef real class": AlgebraicModuliForArithmeticGeometryPartII §1.7 (v), the ampleness criterion for real classes in `N¹(X/k)`, already imported. "Cremona", "topological degree", "real polarization": unrelated uses. Pins: no dynamical degree, Khovanskii–Teissier, nefness predicate or graph of a rational map in Mathlib or Tau Ceti; Tau Ceti's intersection numbers are the curve case only. **Removals: none.** Change since the design: CyclotomicClassGroupsAndStickelberger is now on main; its §4.3 is unchanged and still defines the numerical intersection as the coefficient, with polynomiality, projection formula, Cartier restriction, ample positivity and field-extension compatibility.

Citations re-resolved this round: CyclotomicClassGroupsAndStickelberger §4.3 (main); AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1, 1.2, 1.4, 1.5, 1.7 (ii)–(v) (head 3460198); AlgebraicModuliForArithmeticGeometry §§1.4, 5.4, 9.10 (head e5f9c4c); ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3 (head e2a7179); LefschetzPencilsAndVanishingCycles §5.1 with Bertini irreducibility "part of this target" (head 306b5f0); ArithmeticDynamics §§0.18, 0.26 (head ae79f44); SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10 and StableReduction Layer 2 (main). The resolver reports no cross-roadmap citation and no Lean name found nowhere. The overlap listing reports no pull request changing this roadmap, no dropped id and no second copy. Ownership against open pull requests was checked with the tools on the indexed heads.

## Adversarial pass (statements written or changed)

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| `numericalIntersection` (mixed difference, truncation `r+1`) | `ℙ¹`, `O(1)`; `O(−2)`; `ℙ¹×ℙ¹` `O(1,0)·O(0,1)`, `O(1,0)²`; `r = 0`; `X = ∅` | `2 − 1 = 1`; `(0−1) − (1−0) = −2`, truncation 1: `0 − 1 = −1`; `4 − 2 − 2 + 1 = 1`; `3 − 2·2 + 1 = 0`; `h⁰(O_X)`; `0` | holds; truncation witness added to Conventions |
| Mixed difference = coefficient | `P = n_1² + n_1n_2`, `r = 2` | `2 − 1 − 0 + 0 = 1` = coefficient `1` | holds; added |
| `realIntersection` | `[O(1,1)]`, `[O(1,0)]+[O(0,1)]`, difference; zero class; `r = 0` | `2`, `2`, `2 − 4 + 2 = 0`; empty sum `0`; `χ_K(O_X)` | holds; Check added (§2.3) |
| `IsNef` | `O(a)` on `ℙ¹`; `−[O(1)]`; `2[O(1,1)] − [O(1,0)]`; 0-dimensional `X` | `a ≥ 0`; degree `−1` on `C = ℙ¹`; ruling degrees `2, 1`, diagonal `3`; vacuous | holds |
| Projectivity via `IsProjectiveOver` | `ℙ^n_K = Proj(Sym K^{n+1})`; `Spec L`, `L/K` finite non-simple | closed subscheme of itself; `L = K[x_1..x_n]/I` embeds in `𝔸^n ⊆ ℙ^n` | holds |
| `graph` (representative, absolute product) | `id`; constant `[0:1]`; Cremona; `K = ℂ` | diagonal; `ℙ¹ × pt`, `π_2` not onto, `f` not dominant; domain = complement of 3 points, `π_1` iso there, lines over the points; `ℂ ⊗_ℤ ℂ` non-Noetherian but image equals image in `X ×_ℂ Y` by Lemma 6.7 | holds |
| `graph_isIntegral_and_projections` | Cremona; `z²`; projection `ℙ² ⤏ ℙ¹` | `dim Γ = 2`; `Γ ≅ ℙ¹`; `π_1` iso off `[0:0:1]`, `π_2` onto | holds |
| `topologicalDegree` | `z²`; Frobenius of `ℙ^d`; `ℙ² ⤏ ℙ¹` | `2`; `p^d`; junk `0` | holds |
| `khovanskii_teissier` | `ℙ¹×ℙ¹`, `(2,1),(1,1)`; `E×E`, `A`, `I`; `ℙ² ⊔ ℙ²` | `4·2 = 8 ≤ 9`; `0·2 = 0 ≤ 9`; `25 > 16` but not integral | holds |
| `siu_inequality_products` (generalised) | `(ℙ¹)³`, `i = 2`; `B = O(1,0)`, `i = 1`; `i = 0`; `ℙ² ⊔ ℙ²` | `6 ≤ 4·1·2 = 8`; `0 ≤ 2·1·1 = 2`; `(B^r)(C) = (B^r)(C)`; `5 > 2` but not integral | holds; hypothesis dropped, Check added |
| `mixedDegree` index order | `z²` on `ℙ¹` | `mixedDegree f H H 1 0 = 1`, `… 0 1 = 2` | holds; witness added |
| `mixedDegree_boundary` | `z²`; Frobenius; `L = −H`, `f = id` on `ℙ¹` | `1 = 1`, `2 = 2·1`; `p^d = p^d·1`; `−1 = −1` | holds for all real classes |
| `mixedDegree_pos` | `id`, `O(1,1)`; `O(1,0)`; `d = 0` | `2 > 0`; `(ω²) = 0` excluded by hypothesis; `[L:K] > 0` | holds |
| `mixedDegree_comp_le` | `z²∘z²` (`p=0,q=1`); Cremona (`p=q=1`); `q = 0`; `q = d`; `E×E` | `1·4 ≤ 1·2·2`; `1·1 ≤ 2·2·2 = 8`; `(L_2^d)(L_1^d) = (L_1^d)(L_2^d)`; `(L_2^d)e_1e_2(L_3^d)` equality; `2·0 ≤ 2·3·3` | holds |
| `exists_mixedDegree_comparison` | swap of `ℙ¹×ℙ¹`, `O(1,1)`, `O(2,1)`, `C = 9` | `2 ≤ 45`, `5 ≤ 18` | holds |
| `exists_mixedDegree_birational_comparison` | Cremona conjugated by a linear automorphism | `2` and `2` | holds |
| `tendsto_dynamicalDegree` | morphism of degree `a`; `d = 0` | `(a^{nk})^{1/n} = a^k`, `inf ((d−k+1)^k a^{nk})^{1/n} = a^k`; `C_0 = 1/[L:K]`, terms `1`, limit `1` | holds; `d = 0` Check added |
| `one_le_dynamicalDegree`, `…_eq_of_polarizations` | Cremona; `ω = 0` | `λ_1 = 1`; `0` excluded by `(ω^d) > 0` | holds |
| `dynamicalDegree_iterate` | Fibonacci `m = 2`; `m = 0` | `fib(2n+2)^{1/n} → φ²`; `1 = λ^0` | holds; `m = 0` added |
| `dynamicalDegree_zero_and_top` | Frobenius; `ω = 0` | `λ_0 = 1`, `λ_d = p^d = e`; `0 ≠ e` excluded by hypothesis | holds |
| `dynamicalDegree_log_concave` | Frobenius; Fibonacci | `p^{k−1}p^{k+1} = p^{2k}`; `1·1 ≤ φ² ≈ 2.618` | holds |
| `dynamicalDegree_birational_conj` | Cremona by a linear automorphism; normalization of the cuspidal cubic | `1 = 1`; `λ_k(id) = 1` on both | holds |
| `algebraicEntropy_iterate` | `z²`; `n = 0` | `log 2^n = n log 2`; `0 = 0` | holds |
| `algebraicEntropy_bounds` | `z²`; Fibonacci; Cremona; `d = 0` | `log 2 ≤ log 2 ≤ log 2`; `0 ≤ 0.4812 ≤ 0.9624`; `0 ≤ 0 ≤ 0`; `0 ≤ 0 ≤ 0·log 0 = 0` | holds |
| `isDominant_partialIso`, `isDominant_iterate` | `PartialIso.refl`; `n = 0` | proved in Lean | holds |
| `d = 0` convention | `Spec L`, `σ ∈ Aut_K(L)` | `Γ_σ ≅ Spec L`, `deg_0 = [L:K]`, `e(σ) = 1 = λ_0` | holds |

Context check: every theorem carries its binders in its own signature (no section variables); `#check @name` for all 30 declarations was elaborated once in a scratch copy and each elaborated type compared with its README statement. All matched; nothing changed after the comparison.

## Elaboration

`lake env lean packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run from the content checkout: 17 warnings `declaration uses 'sorry'` (the 17 theorems), no other message.

## Dependency check

```text
depcheck: 239 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 361, after its last supplier ArakelovGeometryAndAbelianHeightsPartII (line 360).

## Sources

No source was fetched; `sources.toml` gains the locators stacks-morphisms Lemma 6.8 (0CNG) and stacks-varieties Lemma 45.1 (0BEM) and Definition 45.3 (0BEP), all read in the cached texts (`stacks-morphisms` line 493, `stacks-varieties` lines 4679 and 4754), and `"Conventions"` in the `cited_for` of `stacks-varieties`. No text is missing; no `needs-references.toml` was written. `lazarsfeld2004` and `fulton1998` stay settled as uncertified.

Suspicious passages in fetched or untrusted text: none.
