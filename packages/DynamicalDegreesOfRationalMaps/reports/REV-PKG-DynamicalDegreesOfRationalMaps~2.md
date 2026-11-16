<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17628#issuecomment-6904112339 -->
Review (claude) of df0ed8e

Verdict: needs_changes

1. **F01** (P3) the overlap step of the §6.1 route is in Tau Ceti at the pin and is not cited

   **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md` line 701 (§6.1, Route): "these
   morphisms agree on overlaps and glue on the complement of `V(F_0, …, F_d)`"; line 703 (`*Needs:*`,
   Tau Ceti part) and line 778 (Layer 6 Dependencies).

   **Claim.** The route's inputs are named: Mathlib's `AlgebraicGeometry.Proj.fromOfGlobalSections`
   for the chart morphisms, and nothing for their agreement on overlaps.

   **Witness.** Tau Ceti at the pin proves that step:
   `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling`
   (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/GlobalCoordinates.lean:138) and
   `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality`
   (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/Naturality.lean:74).

   **Repair.** Tested on the Cremona forms `(x_1x_2, x_0x_2, x_0x_1)`: on `D_+(F_0) ∩ D_+(F_1)` the
   coordinate maps `y_j ↦ F_j/F_0` and `y_j ↦ F_j/F_1` satisfy `g(a) = c^n·f(a)` on forms of degree
   `n` with the unit `c = F_0/F_1 = x_1/x_0`, which is the hypothesis of the first lemma.

   - Add a bullet under `### From Tau Ceti`: "`TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling`
     (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/GlobalCoordinates.lean:138): two coordinate maps
     `A → Γ(T, ⊤)` that differ on forms of degree `n` by the `n`-th power of a global unit give the same
     morphism `T → Proj A`; `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality`
     (ProjectiveSpectrum/Naturality.lean:74): the morphism of Mathlib's `Proj.fromOfGlobalSections`
     commutes with pullback of the coordinates along a morphism of the source. §6.1 uses both for the
     agreement of the chart morphisms on overlaps."
   - In line 701 replace "these morphisms agree on overlaps and glue" by "on `D_+(F_i) ∩ D_+(F_k)` the
     two coordinate maps differ by the unit `F_i/F_k`, so the morphisms agree there by Tau Ceti's
     `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling` after restriction
     (`AlgebraicGeometry.Proj.fromOfGlobalSections_naturality`), and they glue".
   - Add the two names to the Tau Ceti part of the §6.1 `*Needs:*` line and of the Layer 6
     Dependencies.

   The module docstring's reason for the projective-space group stands: neither library has the glued
   map or the chart morphisms `y_j ↦ F_j/F_i`.

2. **F02** (P3) the contract for SchemeAndStackFoundations §2.6 omits what the Conventions consume

   **Location.** `packages/DynamicalDegreesOfRationalMaps/README.md` line 126: "§2.6: Serre vanishing
   for ample line bundles on proper schemes over a Noetherian ring; finite-dimensionality of coherent
   cohomology on proper schemes over a field, as supplied there by JacobianChallenge."

   **Claim.** The bullet lists what is consumed from §2.6.

   **Witness.** README line 40 consumes another statement of §2.6: "cohomology vanishes above degree
   `r` (SchemeAndStackFoundations §2.6)". On main that is `proper_fibreDimension_vanishing` of §2.6.
   Serre vanishing occurs nowhere else in the README (one occurrence of "Serre", line 126).

   **Repair.** Replace line 126 by: "§2.6: finite-dimensionality of coherent cohomology on proper
   schemes over a field, as supplied there by JacobianChallenge; and `proper_fibreDimension_vanishing`,
   used for `X → Spec K`: on a proper `K`-scheme of dimension `≤ r`, `H^q(X, F) = 0` for `q > r` and
   quasi-coherent `F`, which makes the Euler characteristic truncated at `r + 1` the full one
   (Conventions)." Tested on the witness of line 40: on `ℙ¹` with `r = 1`, the truncation at `2` of
   `χ(O(−2))` is `0 − 1 = −1` and is `χ` because `H^q = 0` for `q ≥ 2`.

Two findings, both P3; none blocking. The four findings of round 1 are all repaired. No statement
was found false, the file elaborates with `sorry` as its only warning, no declaration is padding,
and every source locator, pinned declaration and supplier citation I opened is where the README
says it is. The two findings are citations: a step of the §6.1 route that Tau Ceti already proves
at the pin, and a supplier contract that does not list what the Conventions consume.

## Round 1 findings, one by one

- **F01 (P2), field-extension headlines absent: repaired.** `packages/DynamicalDegreesOfRationalMaps/Suggested.lean`
  now states `mixedDegree_baseChange` (line 212), `dynamicalDegree_baseChange` (line 415) and
  `algebraicEntropy_baseChange` (line 454). README line 155: "its statements use the
  characterization of §1.4, `π ∘ f_{K'} = f ∘ π` for the projection `π` of the base change, which
  determines it among the `K'`-rational maps." §1.4 (line 234) states and proves the
  characterization; §§4.3, 5.3, 5.4 name the three statements.
- **F02 (P3), `H = O(1)` not cited at the pin: repaired.** README line 85 cites
  `AlgebraicGeometry.Proj.twistingSheaf` (TwistingSheaf/Basic.lean:254),
  `AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top` (LocalTriviality.lean:212) and
  `AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow` (TensorProduct.lean:257); all three
  are at those lines and resolve under those names (checked with `#check`). The same pattern in
  the rest of the package gives R01 below.
- **F03 (P3), "each item names where it belongs": repaired.** README line 26 now reads "The
  following lie outside this roadmap."
- **F04 (P3), locator lists: repaired.** README line 810 lists "Lemmas 6.7, 6.8, 24.4, 26.16, 38.7;
  Definition 52.8; tags 056B, 0CNG, 0383, 081I, 0892, 02NY"; line 801 lists "Theorems 1–4,
  Proposition 3.4.1, Remark 3.4.3, Theorem 3.4.4, Theorem 5.2.1"; the manifest entries agree. I
  compared the cited locators of all 15 works with their References line and manifest `locator`:
  complete.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run
from the content repository: exit 0, 20 warnings, all `declaration uses sorry`. No `set_option`, no
`lemma`, no `#eval`/`#check`, no sorry'd data: 11 definitions and 2 instances with real bodies, 20
sorried theorems. Header: `module`, `import Mathlib`, five `TauCeti.*` modules, each used.

**Padding probe, all 20 theorems.** On a scratch copy each `sorry` was replaced by
`first | rfl | (simp; done) | infer_instance | trivial | positivity | (norm_num; done) | (intros; rfl) | sorry`:
19 fall through to `sorry`. For `dynamicalDegree_eq_of_polarizations` the alternatives `trivial`
and `intros; rfl` hit the heartbeat limit in `isDefEq`, which is no proof; with `simp`,
`infer_instance`, `norm_num` it falls through as well (20 of 20). The two sides differ in the free
variables `ω`, `ω'`, which `mixedDegree` uses, so it is no definitional equality. None of the 20
restates a definition, mirrors a Check or computes a value.

**Signatures.** Compared the elaborated types in the worker's `signatures.md` with the README for
all 33 declarations: no section variables exist in the file, every binder is in the declaration's
own signature. The three new theorems carry `[Algebra K K']`, the cartesian square `hπ`,
`[GeometricallyIntegral (X ↘ Spec K)]`, `[f'.IsOver (Spec K')]` and `hf`; README §§4.3, 5.3, 5.4
state the same generality (every extension and no geometric integrality for §4.3; geometric
integrality for §§5.3–5.4). All 33 Lean names occur in the README.

**Headline theorems** (README lines 148–153): graph → `graph_isIntegral_and_projections`;
§§3.5–3.6 → `khovanskii_teissier`, `siu_inequality_products`; §4.2 → `mixedDegree_pos`,
`mixedDegree_boundary`; §4.3 → `mixedDegree_baseChange`; §§4.4–4.5 → `mixedDegree_comp_le`,
`exists_mixedDegree_comparison`, `exists_mixedDegree_birational_comparison`; §§5.1–5.4 →
`tendsto_dynamicalDegree`, `one_le_dynamicalDegree`, `dynamicalDegree_eq_of_polarizations`,
`dynamicalDegree_iterate`, `dynamicalDegree_zero_and_top`, `dynamicalDegree_log_concave`,
`dynamicalDegree_birational_conj`, `dynamicalDegree_baseChange`, `algebraicEntropy_iterate`,
`algebraicEntropy_bounds`, `algebraicEntropy_baseChange`; §§6.2–6.4 → named in the module docstring
as not statable (no rational map attached to forms at the pins; I searched both libraries for one
and found none).

**Pinned declarations.** Opened 62 Mathlib and 38 Tau Ceti locators of the package at the pins:
each is at the cited line with the cited name. 64 fully qualified names were also resolved
with `#check` (one more, `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber_eq_finrank_mul`,
read in FieldTower.lean:66 inside `namespace TauCeti.AlgebraicGeometry` / `LineBundleClass`, its
object file not being built). Read at the pin for the new statements:
`Scheme.RationalMap.compHom` (RationalMap.lean:440), `Scheme.Hom.toRationalMap` (line 387),
`Scheme.RationalMap.comp` (Composition.lean:155, first map dominant),
`AlgebraicGeometry.Scheme.canonicallyOverPullback` (Pullbacks.lean:816, `hom := pullback.snd`),
`CategoryTheory.IsPullback` (IsPullback/Defs.lean:61). "Library lacks" claims checked: no named
projective space, ampleness, nefness or several-bundle intersection number in Mathlib's
`AlgebraicGeometry`; no graph of a rational map, iterate or dynamical degree in either library.

**Supplier citations**, resolved now (AlgebraicModuliForArithmeticGeometry and its Part II are on
main since round 1):

- CyclotomicClassGroupsAndStickelberger §4.3 (main): numerical intersection as the coefficient of
  `n₁⋯n_d`, polynomiality, symmetry, additivity, projection formula with the function-field degree,
  Cartier restriction, ample positivity, field extension: all six items present.
- AlgebraicModuliForArithmeticGeometryPartII (main): §0.1 (length-weighted law, field extension),
  §1.1 (`Num`, `N¹`), §1.2 (`ρ(E × E) = 2 + rank End(E)`), §1.4 Checks (nef cone of `E × E`),
  §1.5 (nef line bundles and classes, pullback, base change of Noetherian schemes), §1.7 (ii),
  (iii), (v) and its API (ample has positive degree on curves; `L^m ⊗ E` ample for large `m`).
- AlgebraicModuliForArithmeticGeometry (main): §1.4 (`amplePowersAndFixedTwists`, inside §1.4),
  §5.4 (schematic image, flat base change), §9.10 (`nefMixedIntersectionBound`).
- ArakelovGeometryAndAbelianHeightsPartII (open head): §0.1 (geometric nefness), §0.3 (1′), (2′)
  for `d ≥ 1`.
- LefschetzPencilsAndVanishingCycles (open head) §5.1: Bertini irreducibility, as quoted.
- SchemeAndStackFoundations (main): all 17 cited sections exist; read §2.6, §4.19
  (`alteration_theorem`), §5.9 (`Chow.intersectionNumber`), §5.10 (`hodge_index`, `H² > 0` only).
- StableReduction (main) Layer 2; ArithmeticDynamics (open head) §§0.18, 0.26.

**Dependency check** (command of the brief): `depcheck: 234 roadmaps, 2234 edges, 0 problem(s)`. No
UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and none
is needed: every cited section exists where it is cited.

**Sources, the seeded sample.** For the 15 sampled targets every locator into the 13 readable
texts was opened at its line (42 locators): §1.1 stacks-morphisms line 6046, dinhsibony2005 lines
69–70; §1.3 dang2020 lines 1285–1334; §1.4 stacks-morphisms lines 2009, 2198, truong2020 lines
1529–1533; §2.1 stacks-varieties lines 4716, 4784, kleiman2005 line 3624; §2.2 stacks-chow line
3995; §2.3 stacks-varieties line 4778, dangfavre2021 lines 436–443; §3.2 cutkosky2015 lines
274–287; §4.2 dangfavre2021 line 454, russakovskiishiffman1997 lines 506–511; §4.3 dang2020 lines
18–20; §4.4 dang2020 lines 27–30 and 1271–1358, dangfavre2021 lines 448–451, truong2020 lines 763,
999–1003, 1104–1106, dinhsibony2005 lines 245–247, silverman2014 line 387; §5.1 dangfavre2021 lines
461–463, dang2020 lines 42–46, dinhsibony2005 lines 256–259, silverman2014 lines 383–413,
truong2020 lines 143–158; §5.4 dinhsibony2005 lines 33–37, guedj2010 lines 1178–1181; §6.2
russakovskiishiffman1997 lines 506–541 and 582–583, guedj2010 lines 1141–1147, silverman2014 lines
350–357; §6.3 guedj2010 lines 1272–1282, russakovskiishiffman1997 lines 542–552, truong2020 lines
1542–1544, silverman2014 lines 358–372; §6.4 dangfavre2021 lines 177–180, silverman2014 lines
373–380. Theorem numbers, lines and hypotheses agree; where a source proves less (normal varieties,
algebraically closed fields, `ℂ`, an unspecified constant) the README says so at the citation. The
author flagged no locator as unverified. The manifest records all 15 cited works, without paths.

**Shape.** Summary, scope, conventions, supplier contracts, build paragraph, six layers each with
`### Examples` and `### Dependencies`, consumers, worked examples, references. 27 subsections, each
with a `*Needs:*` line and between 3 and 8 Checks. No LaTeX delimiters, process words, dates,
pull-request numbers or machine paths. The layer order is forced by the Dependencies lines (3 on 2;
4 on 1–3; 5 on 4; 6 on 5), and no layer is named after a source.

**Adversarial table** (values computed in this review; sampled targets, headlines, changed
passages, and the two findings).

| statement | instances tried | values on each side | result | change |
| --- | --- | --- | --- | --- |
| Conventions, `numericalIntersection` | `P = n₁² + n₁n₂`; `ℙ¹`, `O(−2)`, `r = 1`; `r = 0` | `2 − 1 − 0 + 0 = 1`; `(0 − 1) − (1 − 0) = −2`; `h⁰(O)` | sign and truncation right | R02 (citation) |
| §1.1 `e(f)`, `topologicalDegree` | `z²` in char 2; projection `ℙ² ⤏ ℙ¹`; `d = 0` | `2`; junk `0`; automorphism of `L`, `e = 1` | right | none |
| §1.2, `graph_isIntegral_and_projections` | representative not chosen over `K`; absolute product | two maps `V → Spec K` agree on a dense open of reduced `V`, so equal; `Γ ⊆ X ×_K Y` closed in `X × Y`, `X ×_K Y → X` proper | true | none |
| §1.3 | `f = g = z²`; image of `W` in `Y × Z` | degree of `(q_Y, q_Z)` is `2 = e(f)`; lies in `Γ_g` over `f⁻¹(dom g)` | right | none |
| §1.4 density, characterization | open `π`; `K' = K`; conjugation on `ℙ¹_ℂ`; absolute Frobenius over `𝔽_p(t)` | `π(W)` open nonempty meets `U`; `f' = f`; `π ∘ c = π` but `i ↦ −i`; `t ↦ t^p` | unique among `K'`-maps; over-`K'` needed | none |
| §2.1 | double point; `V(xy)` | `2 = 2·1`; `1 + 1` | right | none |
| §2.2 | `r = 0`; `ℙ¹ × ℙ¹` | `χ_K(O_Z) = deg [Z]_0`; `(n₁+1)(n₂+1)`, coefficient `1` | right | none |
| §2.3, `realIntersection` | `[O(1,0)] + [O(0,1)]` against `[O(1,1)]`; zero class; `r = 0` | `0 + 1 + 1 + 0 = 2 = 2`; empty support, `0`; `h⁰(O)` | well defined | none |
| §2.4 (c) | `W → V` affine, not finite | stacks-morphisms 38.7 (2) needs quasi-affine only | right | none |
| §3.1 approximation | `(2.41, 3.41, −1.42)`, `δ = 1/5`, `m = n = 3`, `N = 100` | tolerance `1/90`; `0.99·1.99 − 1.42² = −0.0463`; `1.19·2.19 − 1.42² = 0.5897`; `119·219 − 142² = 5897`; `(β·C) ≥ (ω·C)` | right | none |
| §3.1 `E × E` | `A`, decomposition of `A + F₁ + F₂` | coefficients `2+√2`, `3+√2`, `−√2` recovered; degrees `2, 1, 3+2√2` | right | none |
| §3.2 | `O(1,−1)`; `V(x²)` | `−2`; `2n + 1`, so `2` | right | none |
| §3.4 | `D''` | `(D''·H') = 0`, `(D''²) = (H'²)((H'²)(D²) − (D·H')²)` | right | none |
| §3.5, `khovanskii_teissier` | `O(2,1)`, `O(1,1)`; `ℙ² ⊔ ℙ²`, `n = 2` | `9 ≥ 8`; `16 < 25` | integrality needed, present | none |
| §3.6, `siu_inequality_products` | telescoping; `(ℙ¹)³`; `i = j = 1` on `ℙ¹ × ℙ¹`; `i = 0`; `ℙ² ⊔ ℙ²` | `x₁ ≤ (r−i+1)^i (y₁/y_{i+1}) x_{i+1}`; `6 ≤ 8`; `2 = 2`; equality; `5 > 2` | right; `(j+1)^i` matches | none |
| §4.2, `mixedDegree_boundary`, `mixedDegree_pos` | `d = 0`; `z²`; `O(1,0)` | `[K(X):K] = e·[K(Y):K]`; `(1, 2)`; `0` | bigness needed, present | none |
| §4.3, `mixedDegree_baseChange` | `ℙ¹_ℂ/ℝ`, `f = id`; `p + q ≠ d` | `2 = 1 + 1`; both sides equal term by term by flat base change of each `χ` | true without geometric integrality | none |
| §4.4, `mixedDegree_comp_le` | `(p, q) = (d−k, k)`; `d = 0`; Frobenius then `z²` | `(p+1)^q = (d−k+1)^k`; `[L₂:K][L₁:K]` on both sides; `2p = p·2` | right | none |
| §4.5 | derivation of `C₁`; `O(1,1)`, `O(2,1)`; `E × E` swap | `(d−k+1)^{2k}c(ω,ω')`; `9/4`, `9/16`, `C = 9`; `ω'·τ^*ω' = 17 + 10√2 − 10√2 − 8 = 9` | right | none |
| §5.1, `tendsto_dynamicalDegree` | automorphism of `E × E` by `[[2,1],[1,1]]`, `ω = v₊ + v₋`, `(ω²) = 1`; `n = 0` | `deg_1(f) = 7/2 < λ₁ = 6.854 ≤ C₁·deg_1(f) = 7`; `x^0 = 1` | the constant `C_k(ω)` is needed and present | none |
| §5.2 statements | `m = 0`; `k = d`; `d = 0` | `λ_k(id) = 1`; `e(f)^n(ω^d)`; `1 = 1` | right | none |
| §5.3, `dynamicalDegree_baseChange` | Fibonacci `ℚ → ℂ`; `ℙ¹_ℂ/ℝ` | `fib(n+2)` on both sides; `X'` not integral, no instance | right | none |
| §5.4, `algebraicEntropy_bounds`, `_iterate` | `d = 0`; `d ≥ 1`; `n = 0` | `0 ≤ 0 ≤ 0·log(junk)`; `λ_k ≤ λ₁^k ≤ λ₁^d`; `0 = 0` | true at the junk value | none |
| `dynamicalDegree_birational_conj` | order of composition | `φ.symm`, then `f`, then `φ`: a self-map of `Y` | right | none |
| §6.1 | Cremona charts `i = 0, 1` | `g = c·f` on `y_j` with `c = x₁/x₀` | route step is Tau Ceti's | R01 (citation) |
| §6.2 | recursion; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `4 − 3 = 1` | right | none |
| §6.3 | Fibonacci `n = 2, 3`; `n = 0` | `[xyz : xy² : z³]`, `[xy²z² : x²y³ : z⁵]`, degrees `3, 5`; `(1, y, z)` not homogeneous | right | none |
| §6.4 | `(x², y)`; `(y, z, x + yz)`; `(x, xy)` | `[x₀² : x₁² : x₀x₂]`, `(1, 2, 2)`; degrees `2, 3, 5`; fibre over `(0,1)` empty | right | none |

**Duplication and ownership.** Searched every roadmap on main and at the open heads, by object:
"dynamical degree", "algebraic entropy", "graph of a rational map" (no match anywhere);
"Khovanskii" (only AlgebraicModuliForArithmeticGeometry §9.10, whose difference the README
states); "topological degree", "Siu", "Hodge index" (arithmetic or smooth-surface statements, all
cited or unrelated). No declaration of `Suggested.lean` has the fully qualified name of a
declaration of another roadmap. The overlap file lists no dropped id, no revision-only id, no other
pull request changing this roadmap and no second copy; the two packages under review on the board
(AnalyticNumberTheory, LawrenceVenkateshMethod) concern other subjects.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, NashBlowups, K3SurfacesAndSymplecticBoundedness, JacobianChallenge, SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry (the third list is empty); nefness, the nef cone and Kleiman's theorem: AlgebraicModuliForArithmeticGeometryPartII; volume and Siu's bigness inequality: ArakelovGeometryAndAbelianHeightsPartII; the surface pairing, Hodge index, modifications, alterations, Chow groups: SchemeAndStackFoundations; very ample powers, schematic images: AlgebraicModuliForArithmeticGeometry; nothing shared with the other four.

**Copyright.** Beside the 42 sampled locators, 12 passages were set against the sources: the graph
(§1.2) with dinhsibony2005 line 45 and dang2020 line 21; Siu's route (§3.3) with dang2020 lines
850–866 (another argument: a section of `m(pA − qB)` against the source's general members of
`|B|`); the telescoping (§3.6) with dang2020 lines 876–883; sub-multiplicativity (§4.4) with
dang2020 lines 1335–1358; existence (§5.1) with silverman2014 lines 386–413; the Fibonacci map
(§6.3) with silverman2014 lines 358–372; correspondences (Scope) with truong2020 lines 77–89; the
non-integral example (§3.5) with cutkosky2015 lines 1014–1020; the degree recursion (§6.2) with
russakovskiishiffman1997 lines 516–541 (another argument); intersection numbers (Conventions) with
stacks-varieties lines 4754–4758; the docstring of `khovanskii_teissier` with cutkosky2015 lines
983–985; the new characterization of §1.4, which no source states. No run of six or more shared
consecutive words outside formulas. The six layers do not map onto the sections of dangfavre2021
(positive cycles; b-classes; b-divisors; spectral interpretation; spectral gap; polynomial maps)
nor of dang2020 (Chow group; numerical cycles; positivity; relative classes; dynamics;
semi-conjugation; mixed degree formula). No table, figure or list is taken over.

Source independence: 12 passages compared with 7 sources, none shared; largest share dangfavre2021, 16 of 101 locators; contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- lazarsfeld2004 (Theorems 1.4.9, 1.6.1, 2.2.15, Corollaries 1.4.10, 1.6.3) and fulton1998 (Theorem
  1.4, Proposition 2.5): settled as uncertified, text not read. dang2020 lines 842 and 850 cite
  Lazarsfeld's Theorem 2.2.13 where the README has Theorem 2.2.15; which number is right could not
  be checked without the text.
- The object file of `TauCeti.AlgebraicGeometry.IntersectionNumber.FieldTower` is not built on this
  worker, so `intersectionNumber_eq_finrank_mul` was read in the source at the pin, not elaborated.
  `Suggested.lean` does not import that module.
- StableReduction Layer 2 and SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30, 3.3, 4.11,
  4.12, 4.13, 4.16, 5.1–5.3 were checked by heading and by the sentences found by search, not read
  in full.

## Source issues

- **Error** in dinhsibony2005 at Corollaire 7, proof, p. 7 (line 259): the source says the sequence of `n`-th roots of `δ_l(f^n)` converges to its infimum over `n`; it should be the infimum of the `n`-th roots of `c_X·δ_l(f^n)` (on `E × E` with the automorphism `[[2,1],[1,1]]` the first infimum is `7/2`, the limit `6.854`); affects nothing.
- **Misprint** in dang2020 at Theorem 3.4.4, last display of the proof (line 883): the source says the constant is `(n − i + 1)^i`; it should be `(r − i + 1)^i`, as in the statement (line 874) for a subscheme of dimension `r`; affects nothing.
- **Misprint** in silverman2014 at Example 6, p. 9 (line 376): the source says the `n`-th iterate has degree the `n`-th Fibonacci number; it should be the `(n+2)`-th in the indexing of Example 5, the degrees being 2, 3, 5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a) (line 1180): the source says the log-concavity inequality holds for all `l` from 1 to `k`; it should be for `l` from 1 to `k − 1`, since `λ_{k+1}` is not defined; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "df0ed8e0f33218fe4fe02741d237760444c63034", "job": "REV-PKG-DynamicalDegreesOfRationalMaps~2", "model": "fable", "worker": "chris-x88"} -->
