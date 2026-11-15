<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6901270042 -->
Review (claude) of b5f78fc

Verdict: accepted

No finding. Both round-14 findings are repaired, the passages the repair added hold on the instances computed below, the sampled locators say what they are cited for, every supplier citation resolves at its current head, every library locator matches at the pins, and the dependency check reports no problem. `design/plan.json` declares no supplier gap (`gaps` is empty), so the acceptance is conditional on none. No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report). The design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous findings (round 14), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): §1.4 re-derived a pinned Tau Ceti theorem; "geometrically integral" unpinned | Conventions: "A `K`-scheme `X` is *geometrically integral* if its structure morphism `X → Spec K` satisfies Mathlib's `AlgebraicGeometry.GeometricallyIntegral`". §1.4: "Both rings are domains: `K(X) ⊗_K K'` by Tau Ceti's instance `TauCeti.AlgebraicGeometry.isDomain_functionField_tensorProduct_of_geometricallyIntegral`, and `f^*K(Y) ⊗_K K'` as its subring". Both names are in the contracts and in the *Needs:* lines of §§1.4, 4.3, 5.3, 5.4. | **Repaired.** Pin read: `TauCeti/AlgebraicGeometry/Geometrically/FunctionField.lean:82`, an `instance` under `[IsIntegral X] [GeometricallyIntegral (X ↘ Spec (.of k))]`, for every field `L` over `k`; line 111 carries `[Algebra.IsAlgebraic k K]`, as the README says. `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40`: integral base change along every `Spec K ⟶ Y` with `K` a field. |
| F02 (P3): Tau Ceti's rank of a finite flat morphism and its everywhere-defined rational maps uncited | Scope, first item; "From Mathlib" (`Flat`, `Scheme.Hom.finrank`); "From Tau Ceti" (three names); §1.1 item *Agreement with the rank* and two Checks; §1.2 "Conversely, if `U = X`, then `f` is the rational map of the morphism `Scheme.RationalMap.toHom f`"; §6.1 "a rational map of `ℙ^d` is the rational map of a morphism exactly when its reduced forms have no common zero". | **Repaired**, with the suggested negative control corrected by the fix worker: I recomputed it and the correction is right (row "§1.1 cusp" below). Pins read: `TauCeti/AlgebraicGeometry/Morphisms/Finite/FlatDegree.lean:87` (`[IsIntegral X] [IsIntegral Y] [IsFinite f] [Flat f] [IsDominant f]`); `TauCeti/AlgebraicGeometry/Birational/RationalMap.lean:93` (`[IsReduced X] [Y.IsSeparated]`, `hf : f.domain = ⊤`) and `:120` (`[IsIntegral X]`). |

Pattern search after the repair: every *Needs:* line whose section uses geometric integrality (§§1.4, 4.3, 5.3, 5.4) names Mathlib's predicate; both sections that read a rational map with full domain as a morphism (§§1.2, 6.1) name `toHom` and `toRationalMap_toHom`; the Layer 1 and Layer 6 *Dependencies* list the new declarations. `plan.json` has 8 tests for target 1.1, the number of README Checks.

## Verified sound

### Principles, shape, house style

- General library: arbitrary field, no normality, inseparable degree counted, geometric integrality only where the base-changed map must be a map of varieties. No algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. By script: 27 subsections, each with exactly one *Needs:* line; Checks per subsection `8,5,4,5 | 3,3,4,4 | 8,6,4,4,4,3 | 4,6,3,5,4 | 3,3,3,4 | 6,4,4,5`, all at least 3 and equal to the test counts of `plan.json` (6 layers, 27 targets, `gaps` empty).
- Organisation: layers named by their mathematics. Layers 1 and 2 are independent of each other (each *Dependencies* says so), Layer 3 needs Layer 2 (§§2.1–2.4 in the *Needs:* of §§3.1–3.6), §4.4 needs §§1.3 and 3.6, Layer 5 needs §§3.5, 4.2–4.5, Layer 6 needs §§3.2, 4.1, 4.2, 5.1–5.4: the order is forced. No sentence says the roadmap follows a source.
- Process residue: a pattern search for LaTeX delimiters, pull-request numbers, round labels, machine paths, HTML anchors and process words finds only prose uses of "lemma" (Chow's, Fekete's, "the reduction lemma"). The README attributes no backticked Lean name to this roadmap.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions, geometric integrality (new) | `ℙ¹_ℂ/ℝ`; `x² + ty²` over `𝔽_2(t)` | `ℂ ⊗_ℝ ℂ = ℂ²`, two components; over `𝔽_2(√t)` the form is `(x + √t·y)²`, non-reduced, irreducible over every extension | holds; none |
| Conventions, composition | `f = z²`, `g = z + 1` at `z = 1` | `f.comp g`: `1² + 1 = 2`; `f ∘ g`: `(1+1)² = 4` | holds; none |
| §1.1 agreement with the rank (new) | `z²` on a chart; Frobenius of `ℙ^d` | `K[z] = K[z²] ⊕ K[z²]z`, rank `2 = e`; `p^d = e` | holds; none |
| §1.1 cusp (new Check) | `K[t², t³] ⊆ K[t]` at the cusp | fibre `K[t]/(t²)`, dimension `2`; `Module.rankAtStalk` (Mathlib `RingTheory/Spectrum/Prime/FreeLocus.lean:181`) is `Module.finrank` of a torsion-free module of generic rank `1` over a local domain: `1 = e(ν)` | holds; the Check states both values correctly |
| §1.2 (sample, headline) | `id`; Cremona; constant `[0:1]`; `U = X` | diagonal; a line over each of 3 points; `ℙ¹ × pt`, `π_2` not onto; `toHom` gives a morphism, not dominant for the constant map | holds; none |
| §1.3 | `z², z²`; `ℙ¹_ℂ/ℝ` | degree of `(q_Y, q_Z)` is `[K(z):K(z²)] = 2 = e(f)`, not `4`; `ℙ¹_ℂ ×_ℝ ℙ¹_ℂ` has 2 components, triple diagonal integral | holds; none |
| §1.4 (sample) | `z²`, any `K'`; `ℙ² ⤏ ℙ¹`; `𝔾_m → 𝔸¹` at the origin | localisation of `K(z) ⊗ K'` free of rank `2` over `Frac(K(z²) ⊗ K')`, a domain finite over a field, so the field `K'(z)`: `2 = 2`; `1, v, v², …` independent, `e = 0 = 0`; source `∅` against inverse image `Spec K` | holds; none |
| §2.1 | `Spec K[ε]/ε²`; line ∪ point; `V(xy)` | `2 = 2·1`; `χ = n + 2`, coefficient `1`; `χ = 2n + 1`, `2 = 1 + 1` | holds; none |
| §2.2 (sample) | blow-up of `ℙ²`, `O(bE)` | `1 + ½(−b² + b)`; `n_1n_2`-coefficient at `b = n_1 + n_2` is `−1 = deg O_E(E)` | holds; none |
| §2.3 (sample) | `√2·O(1,0) + O(0,1)`; `2·O(1,1) − O(1,0)` | `2·√2·1 = 2√2`; class `O(1,2)`, ruling degrees `2, 1` | holds; none |
| §2.4 (sample) | `ℙ¹_ℂ/ℝ`; `x² + ty²` over `𝔽_2(t)`; real pointless conic | `c = 2`, `2 = 2·1`; charts `K[x,z]/(x²+t) = K'[z]`, `K[x,y]/(x²+ty²)[x/y] = K'[y]`, `χ_K(O_V(n)) = 2n+1`, `2 = 2·1`; `c = 1`, `2 = 2` | holds; none |
| §3.1 approximation (sample) | `m = 3`, `n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)`, `N = 100` | `(β·C) ≥ (ω·C) − 3·(1/90)·3(H·C) + (1/10)(H·C) = (ω·C)`; errors `0.0042, 0.0042, 0.0058 < 0.0111`; dets `1.9701 − 2.0164 = −0.0463`, `2.6061 − 2.0164 = 0.5897`; `[[119,142],[142,219]]`, det `5897`; `Nδ/2 = 10 ≥ 1` | holds; none |
| §3.1 class `A` | matrices of `F_1, F_2, Δ`; `A`; `A + F_1 + F_2` | `tr(B·adj B')`: `F_1F_2 = 1`, `F_1Δ = 1`, `Δ² = 0`; `A = [[1,√2],[√2,2]]`, det `0`, trace `3`, degrees `2, 1, 3+2√2`; entries of the decomposition `2, √2, 3`, `5 − 3√2 ≈ 0.757 > 0` | holds; none |
| §3.1 homogeneity control | `H/2` on `ℙ²` | `(A²) ≥ 1` for `O(a)`, `a ≥ 1`; `1/4 < 1` | holds; none |
| §3.2 | double line; `O(1,−1)` | `(n+1)(n+2)/2 − (n−1)n/2 = 2n + 1`, `2 = 2·1`; `−2 < 0` | holds; none |
| §3.3 (sample) | route; `(1,1),(1,0),(0,1)`; `O(1,−1)`; `E × E` | `(pA)^r − r(pA)^{r−1}(qB) = p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `2·1 = 2·1·1`; `2 > 0`; `(A_0+I)·A_0 = (4−2)+(−2+3) = 3`, `8·3 = 24 ≤ 2·3·5 = 30` | holds; none |
| §3.4 (sample) | `D''`; `H = 2L + E`; `E_1, E_2`; cone | `D''² = (H'²)((H'²)(D'²) − (D'·H')²)`; `H² = 3`, `1 ≥ −3`, `4 ≥ 3`; `0 < 1`; `4 = 2·2` | holds; none |
| §3.5 (headline) | `(2,1),(1,1)`; `A + εI`; `ℙ² ⊔ ℙ²` | `9 ≥ 4·2`; `(3+2ε)² − (12ε+4ε²) = 9`; `16 < 25` | holds; none |
| §3.6 (headline) | indices on `Z_j`; `(ℙ¹)³`; `ℙ² ⊔ ℙ²` | `dim Z_j = r − (j−1) − (i−j) = r−i+1`; `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}`, product `x_1 ≤ (r−i+1)^i(y_1/y_{i+1})x_{i+1}`; `6 ≤ 4·1·2 = 8`; `5 ≤ 2` false | holds; none |
| §4.1 (sample) | `z²`, models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `(1, 2)`; `2 = 2·1`; `√2 ∉ ℤ` | holds; none |
| §4.2 (headline) | Cremona; `O(1,0)`; monotonicity controls | `(1,2,1)`; `0`; `2 → 1.5` with `L' − L` not nef; `0 ≤ 3 ≤ 8` | holds; none |
| §4.3 (headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `2 = 1 + 1`; `3 = 3` | holds; none |
| §4.4 (sample, headline) | route on `W`; `k = 0, d`; `z², z²`; Cremona; `E × E` | `e(f_1)(L_2^d)·deg_k(f_2f_1) ≤ (d−k+1)^k·e(f_1)deg_k(f_2)·deg_k(f_1)`; `(L_1^d) = (L_1^d)(L_2^d)/(L_2^d)`, `e(f_2f_1)(L_3^d) = e(f_1)e(f_2)(L_3^d)`; `4 ≤ 4`; `1 ≤ 8`; `0 ≤ (2/2)·3·3 = 9` | holds; none |
| §4.5 (sample, headline) | two applications of §4.4; swap of `ℙ¹×ℙ¹`; `E × E` | `C_1 = (d−k+1)^{2k}(ω'^{d−k}ω^k)(ω^{d−k}ω'^k)/(ω^d)²`; `9/4, 9/16`, `C = 9`, ratio `5/2`; `tr([[2,√2],[√2,3]]·[[2,−√2],[−√2,3]]) = 2 + 7 = 9`, `C = 25`, ratio `9/2` | holds; none |
| §5.1 (headline) | `u_0`; Mathlib hypothesis | `u_0 = k·log(d−k+1) ≥ 0`, so `u_0 ≤ 2u_0`; `u_n/n ≥ min(0, log(C_k/C))`, `u_0/0 = 0` | holds; none |
| §5.2 (headline) | Fibonacci; Frobenius; `d = 1` | `φ² ≈ 2.618 ≥ 1`; `p^{2k} = p^{k−1}p^{k+1}`; range `1 ≤ k ≤ 0` empty | holds; none |
| §5.3 (headline) | `ℙ¹_ℂ/ℝ`; polarization after extension | `1 = 1`; computed with an ample `H`, `H_{K'}` ample, `(H_{K'}^d) = (H^d)` | holds; none |
| §5.4 (sample, headline) | degree `a`; Fibonacci; `(x², y)` | `d·log a`; `0 ≤ 0.4812 ≤ 0.9624`; `log 2 ≤ log 2 ≤ 2·log 2` | holds; none |
| §6.1 | `σ∘σ`; `σ ∘ [x_i²]`; `(0,0,1)` then `σ`; constant `g`; `d = 0` | `(x_0x_1x_2)·x_i`; coprime, `4 = 2·2`; `G(F) = 0`; `0 = a·0`; reduced form `(1)`, degree `0` | holds; none |
| §6.2 (sample, headline) | section of `aA − B`; `k = 0`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `dim π_1(E) ≤ d − 2`, so `(A^{d−1}·E) = 0`; `1 ≤ 2·2`, `4 − 3 = 1` | holds; none |
| §6.3 (sample, headline) | Fibonacci `n = 1, 2, 3`; inverse; Cremona | `[yz:xy:z²]`; `[xyz²:xy²z:z⁴]/z = [xyz:xy²:z³]`; `[xy²z³:x²y³z:z⁶]/z = [xy²z²:x²y³:z⁵]`; degrees `fib(n−1) + 2fib(n) = fib(n+2)`: `2, 3, 5`; `(v/u, u)∘(y, xy) = (x, y)`; `Π_{j≠i}(P/x_j) = P^{d−1}x_i` | holds; none |
| §6.4 (sample, headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0²:x_1²:x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`, `4 ≥ 2`; `F² = (x+y², y+(x+y²)²)`, degree `4`; `F² = (z, x+yz, y+z(x+yz))` degree `3`, third coordinate of `F³` has `(x+yz)·z(x+yz)`, degree `5`; fibre over `(0,1)` empty | holds; none |
| Worked examples table | five rows | agree with the Checks of §§4.2, 5.2, 5.4, 6.3, 6.4 | holds; none |

A remark that needs no change: in §1.1 the flatness hypothesis of *Agreement with the rank* is the hypothesis of the cited Tau Ceti theorem; the README's own cusp Check shows the equality of rank and `e` surviving without flatness, and says so.

### Sources: the seeded sample

The manifest flags no locator as unverified. Opened in the cached texts this round:

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.2 | `dinhsibony2005` lines 45–51; `dang2020` lines 21–25; `guedj2010` lines 1099–1110; `stacks-morphisms` line 488 | as cited |
| 1.4 | `stacks-morphisms` lines 2198–2203; `truong2020` lines 1529–1533 | as cited; Lemma 26.16 needs `f` flat and `g` quasi-compact only |
| 2.2 | `stacks-chow` lines 3995–3997 | as cited |
| 2.3 | `stacks-varieties` lines 4778–4780; `dangfavre2021` lines 436–443 | as cited |
| 2.4 | `stacks-varieties` lines 691–695; `stacks-morphisms` lines 3862–3865 | as cited; part (2) is the one used |
| 3.1 | `cutkosky2015` lines 274–287 | as cited |
| 3.3 | `dang2020` lines 840–869; `dangfavre2021` lines 427–434 | as cited (`C_d = d` for `k = 1` at line 434) |
| 3.4 | `kleiman2005` lines 3803–3808; `cutkosky2015` lines 994–1003 | as cited |
| 4.1 | `dang2020` lines 21–25; `dangfavre2021` lines 436–443, 452–454; `dinhsibony2005` lines 61–63; `russakovskiishiffman1997` lines 499–505 | as cited |
| 4.4 | `dang2020` lines 27–30, 1271–1290; `dangfavre2021` lines 448–451; `truong2020` lines 763, 999–1003, 1104–1106; `dinhsibony2005` lines 245–247; `silverman2014` line 387 | as cited; constant `(e−i+1)^i/(…)` at `dang2020` line 1284 |
| 4.5 | `dang2020` lines 31–41; `dangfavre2021` lines 457–460; `dinhsibony2005` lines 256–263 | as cited |
| 5.4 | `dinhsibony2005` lines 33–37; `guedj2010` lines 1178–1181 | as cited |
| 6.2 | `russakovskiishiffman1997` lines 506–541, 582–583; `guedj2010` lines 1141–1147; `silverman2014` lines 350–357, 387 | as cited |
| 6.3 | `guedj2010` lines 1272–1282; `russakovskiishiffman1997` lines 542–552; `truong2020` lines 1542–1544; `silverman2014` lines 358–372 | as cited |
| 6.4 | `dangfavre2021` lines 177–180; `silverman2014` lines 373–380 | as cited |

Also opened: `dang2020` lines 141–143 and 871–883 (§3.6), `silverman2014` lines 383–388 (§5.1). All fifteen manifest entries are cited in the README and every cited work has an entry. No source was fetched; the manifest is unchanged by this review.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10 present |
| StableReduction | main | heading "Layer 2" present |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: polynomiality of total degree at most `dim Supp F`, symmetry, additivity, projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field-extension compatibility |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1; §1.1 `Num(X/S) := Pic(X)/Pic^τ(X/S)`, `N¹ = Num ⊗ ℝ` with the class map from `Pic(X)`; §§1.2, 1.4; §1.5 "preserved by base change `T → S` of Noetherian schemes and detected on geometric fibres", pullback along morphisms of proper schemes; §1.7 (ii), ample sheaves of positive degree on curves, `L^{⊗m} ⊗ E` ample for large `m` |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 `amplePowersAndFixedTwists`; §5.4 "The image of f after flat base change is the pullback of C", "For a scheme morphism the construction is exactly `Scheme.Hom.image`"; §9.10 (named in Scope, not consumed) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 geometric analogue over a field; §0.3 (1′), and (2′) for `d ≥ 1`, with its *Needs:* naming SchemeAndStackFoundations §§5.2–5.3 for degrees of products of first Chern classes in the geometric case |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility with `dim g(X) > s`, "part of this target" |
| ArithmeticDynamics | open head | §0.18 `deg(f g) = deg f · deg g`; §0.26 injective monoid map, "every K-endomorphism of ℙ¹_K is in the image" |

The six open suppliers add new roadmap folders and stand earlier in `merge-order/ORDER.txt` (lines 34, 35, 69, 262, 339, 341); none is on the never-cite list. The citation resolver lists nothing unresolved; the overlap listing lists no dropped or revision-only id, no other pull request changing this roadmap and no second copy. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2252 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations

Every file-and-line locator of the two library contracts was checked by script at the pins: 73 locators, 69 matched mechanically and the 4 the script could not parse were opened by hand (`Scheme.RationalMap.fromFunctionField`, RationalMap.lean:501; `equivFunctionFieldOver`, :562; the dominance instance, Subscheme.lean:716; `Scheme.Birational`, Birational.lean:182); all match. Definitions read this round: `Scheme.Hom.finrank` (`Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:89`), which on an affine chart is `RingHom.finrank` (`Mathlib/RingTheory/Flat/Rank.lean:139`), that is `Module.rankAtStalk`, the `Module.finrank` of the localized module over the local ring, as the README describes; `Scheme.Hom.functionFieldAlgHom` (`TauCeti/AlgebraicGeometry/Scheme/BaseAlgebra.lean:409`), whose underlying ring map is `functionFieldMap`, which is what §1.1 uses to pass to the rank theorem.

### Ownership and overlap

No second copy: main has no `DynamicalDegreesOfRationalMaps` folder and neither the board index nor the list of open pull requests has a roadmap of this name. Searches of main and all indexed open heads (README text): "dynamical degree", "algebraic entropy", "graph of a rational map": no match. "Khovanskii", "Teissier": only AlgebraicModuliForArithmeticGeometry §9.10, named in Scope with its clause of difference. "Siu": ArakelovGeometryAndAbelianHeightsPartII §0.3 (imported), its consumer HeightsRationalPointsAndObstructionsPartII, the arithmetic inequality of ArithmeticDynamics (hermitian line bundles, another object) and unrelated surnames. "Hodge inequality": an unrelated p-adic use. "topological degree": three unrelated uses. "rational self-map": only ArithmeticDynamics, whose maps of `ℙ¹` are imported in Checks.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported; AbundanceStatement is not cited); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, modifications, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with AdicCoefficientsAndComparisonsPartII or JacobianChallenge.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and Siu for products (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and a row above. No `Suggested.lean` exists at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources at the 30 locators of the sample table, and six further passages of prose: the definition of `W_{f,g}` in §1.3 (`dang2020` lines 1285–1288 use a graph between normalized graphs, the README an image in the triple product); the route of §3.3 (`dang2020` lines 850–866 count sections through an exact sequence, the README uses the imported volume inequality); the route of §3.4 (`cutkosky2015` lines 994–1003 resolve singularities, the README uses alterations); the route of §3.6 (`dang2020` lines 876–883: the same telescoping, in the README's own `x_j, y_j`); the route of §5.1 (`dinhsibony2005` lines 258–259, `silverman2014` lines 383–388); the route of §4.5 (`dang2020` lines 35–41, `dinhsibony2005` lines 260–263). No sentence or proof plan follows a source clause by clause or translates it; what is shared is formulas and standard names.
- Arrangement: `dangfavre2021` (16 mentions before the References) and `dang2020` (15) lead. Contents of `dangfavre2021`, lines 25–47: 1 positive cycles and dynamical degrees, 2 numerical b-classes, 3 b-divisors, 4 spectral interpretation; the README uses its §1.3 and the setting of Theorems 1–2 only. `dang2020`, lines 196–203: §§1–2 Chow groups and numerical cycles, §3 positivity, §4 relative numerical cycles, §5 the main theorems; its §3.4 corresponds to parts of §§3.3 and 3.6 here and its §5.2 to §4.4, while Layers 1, 2, 5 and 6 have no counterpart. No one-to-one run.
- Reuse: no table, figure or list taken over. The worked-examples table is the roadmap's own.

Source independence: 36 passages compared with 12 sources, none shared; largest share dangfavre2021, 16 of 97 mentions of a source id (dang2020 15); contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` lines 65 and 842 attribute Siu's inequality to Lazarsfeld's Theorem 2.2.13 where the README cites Theorem 2.2.15; which number is right could not be checked without the book.
- The degrees `fib(n + 2)` of the iterates of `(y, z, x + yz)` in the §6.4 Check were computed for `n = 1, 2, 3`, not by a written induction.
- Ownership against open pull requests was checked on the heads the tools index (main and 468 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

## Source issues

- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the roots of the degrees converge to their own infimum; it should be the infimum after multiplying the degrees by the constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the displayed bound gives `λ(f) ≤ λ(h)`; it should give `λ(h) ≤ λ(f)` first, the other by symmetry; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the indeterminacy loci of the map and of its inverse are disjoint; it should note both contain `[0 : 1 : 0]` (the inverse is `[yz : x² : xz]`); affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees `2, 3, 5`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), page 33 of the arXiv file: the source says the inequality holds for `1 ≤ l ≤ k`; it should stop at `l = k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says the Picard group is isomorphic to the group of Cartier divisors; it should be Cartier divisors modulo linear equivalence; affects nothing.
- **Misprint** in dang2020 at Theorem 3.4.4, proof, printed page 18: the source says the final constant is `(n − i + 1)^i`; it should be `(r − i + 1)^i`, as in the statement and the displayed steps; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b5f78fc9e0d170647155ba0633d53a0a429a018a", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~15", "model": "fable", "worker": "chris-x81"} -->
