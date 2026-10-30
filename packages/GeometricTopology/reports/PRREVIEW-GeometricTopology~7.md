# Review of GeometricTopology (pull request #903 at d7736ae)

**Verdict:** needs changes

## R01 (P1) — Nine consumed declarations are still absent at the pin

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:227`, `248–254`, `297`, `315–318`, `604–605`, `690`, `709`, `1290–1291`, `1321`, `1610`, `1645`. The supplier contract says: “Every declaration below exists at the pinned Tau Ceti and is consumed as it stands.”

**Claim:** The README imports these nine objects instead of assigning their construction to a target:

- `normalTubeOfRadius`;
- `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius`;
- `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius_contMDiff_subset`;
- `TauCeti.normalFiberBundle`;
- `TauCeti.normalVectorBundle`;
- `TauCeti.normalContMDiffVectorBundle`;
- `TauCeti.knotExterior`;
- `TauCeti.KnotTheory.homflySpecialization`;
- `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact`.

**Witness:** Whole-source searches by final name component return zero occurrences for all nine in both pinned libraries. `TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean:359` supplies only the compact-source constant-radius theorem; `TauCeti/KnotTheory/Jimbo/Trace.lean:46` defines a weighted trace, not the claimed substitution homomorphism.

The dependency check and build do not establish these prose contracts: none of these nine names is used in `Suggested.lean`. The new explanation of `a ↦ q^N`, `z ↦ q − q⁻¹` describes the intended map but does not supply it. Both checked-out library revisions match `lake-manifest.json`: Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. There are nine distinct absent names; the previous report's incidental reference to a tenth was a counting error.

**Exact repair and retest:** Make the positive-radius-function tube and normal-bundle constructions explicit targets of Layer 1.5, the compact exterior a target of Layer 5.1, the compact PL comparison a target of Layer 1.7, and the coefficient substitution a target of Layer 4.6, unless an actually present supplier declaration with the same hypotheses can be cited. Give the substitution its coefficient ring, source, target and unit images; cite TypeAHeckeAlgebras H1/H2 for the algebraic trace comparison. Remove the absent names from the list of pinned supplies and correct line 227. Preserve noncompact generality: circles of radius `1/n` centered at `(3n,0)` admit no common positive injective tube radius, but radius `1/(2n)` works on each component. For the substitution, at `N=2`, `q=2`, the generator images must be `4` and `3/2`, with inverses `1/4` and `2/3`. These retests distinguish the required constructions from the available compact tube theorem and weighted trace.

## R02 (P3) — Companion Lean files retain forbidden commands and imports

**Location:** `TauCetiRoadmap/GeometricTopology/ExchangeFamily.lean:92–103`, `RealAlgebraicRealization.lean:53–57`, `SimplicialLinks.lean:88–94`, and the imports of the companion files; `LeeFrobenius.lean:14–15`: “GT6 owns the deformation and its filtered comparison.”

**Claim:** The 25 unchanged companion files remain subject to the brief's Lean form rules. The earlier form finding is still reproducible, independently of the passing scanner output.

**Witness:** There are 24 `#print axioms` commands and 37 Mathlib submodule imports, counting `public import`. `README.md:123–124` assigns the Lee deformation to Part II, contradicting `LeeFrobenius.lean:14–15`. None of the companion files changed since `fbceb3f`.

**Exact repair and retest:** Delete the companion catalogues/calculation files from this roadmap folder, retaining their mathematical targets and Checks in the README. Any genuine headline they contribute belongs in `Suggested.lean` under its acceptance-test rules; delete padding rather than proving it in place. Retest all remaining `.lean` files: zero `#print axioms`, zero Mathlib submodule imports, and no companion ownership claim contradicting the README. This is the same P3 form finding as r6 R02, not a failed build.

## Previous findings

- R01 — not repaired: `README.md:248–254,297,315,690` still consumes the same nine absent declarations. Lines 315–316 and 1290–1291 explain the HOMFLY substitution but do not provide its pinned declaration. Repeated as R01.
- R02 — not repaired: All 25 companion files are unchanged. The forbidden commands, imports and `LeeFrobenius.lean:14–15` ownership mismatch remain. Repeated as R02.
- R03 — repaired: `README.md:2751–2752` explicitly supplies Layer 2.2 to MorseTheory M4.1. The requested local change is complete; MorseTheory's conflicting ownership claim remains a consumer-side follow-up.
- R04 — repaired: `README.md:1545–1546,2827–2828` correctly distinguishes Kondo's system (*) from formula (8). The institutional text supports both labels and their roles; no mathematical statement was weakened.

## Verified sound

This is an incremental re-review of **17 changed lines since fbceb3f**: eleven insertions and six deletions, entirely in `TauCetiRoadmap/GeometricTopology/README.md`. All four previous findings were revisited. The changed supplier explanation, trace-route sentence, Kondo locator and reference, and Schoenflies consumer statement were read with their dependent passages. No Lean file or dependency pin changed, and the diff outside this roadmap folder is empty. Repository `README.md` and `CONTRIBUTING.md` were read, together with the merged TypeAHeckeAlgebras and HopfRinow roadmaps for form and context. This review was performed by Codex.

**Gate, build and elaboration.** The worker's gate has all counters zero, including `build=0`, and reports `OK`. The independent gate rerun also reports every emitted counter zero and `OK` (its output does not emit a build counter). Separately, `lake build TauCetiRoadmap.GeometricTopology.Suggested` completed successfully, reporting 9153 jobs. Direct `lake env lean` elaboration of `Suggested.lean` exited 0 with exactly 14 `declaration uses sorry` warnings and no other diagnostics. This resolves the missing-object-file obstacle recorded in the initial signature artifact.

A fresh scratch copy with `#check @name` for all 14 declarations elaborated successfully. The types agree with their unchanged README statements: Poincaré retains compactness, Hausdorffness, second countability and simple connectivity; the knot-group theorem retains the complement basepoint and the group isomorphism; Gordon–Luecke retains its complement homeomorphism; Manolescu retains `5 ≤ n`. No binder was dropped. A separate scratch one-tactic probe using `simp`, `rfl`, `infer_instance` and `exact?` left all 14 headline goals open. No new padding was found in `Suggested.lean`; the unchanged companion form defect is R02.

The independently rerun dependency check returned exactly:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. The diff adds no `*Needs:*` edge. The new MorseTheory paragraph is a downstream supply statement. Layer 2.2 remains the input of the annulus passage (`README.md:850–873`), knot decomposition (`1444`) and the corresponding downstream topology; no edge is reversed by this edit.

**Pinned declarations opened.** The changed passages and the previous missing-supplier finding were checked against these actual declarations and their bodies:

| Declaration | File and line at the pin | Checked content |
|---|---|---|
| `TauCeti.normalTube` | `TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean:273` | Normal vectors with strict inequality `‖v‖ < ε`; does not introduce a radius function. |
| `TauCeti.exists_isOpenEmbedding_normalTube` | same file, line 359 | Compact `C²` source, boundaryless model, injective map and injective differential; a constant positive radius. |
| `TauCeti.IsBicollar` | `TauCeti/Geometry/Manifold/LocallyFlat/Bicollar.lean:101` | An open embedding of `N × ℝ` whose zero slice is the given map. |
| `TauCeti.IsBicollared` | same file, line 108 | Existence of such a bicollar; no global complementary-ball conclusion in the definition. |
| `TauCeti.BrownBicollaring` | `TauCeti/Geometry/Manifold/LocallyFlat/Sphere.lean:74` | Locally flat sphere embeddings have bicollars. |
| `TauCeti.brownBicollaring` | `TauCeti/Geometry/Manifold/LocallyFlat/Brown.lean:39` | Supplies the bicollar, including the zero-dimensional sphere. |
| `TauCeti.KnotTheory.jimboWeightedTrace` | `TauCeti/KnotTheory/Jimbo/Trace.lean:46` | Trace over a commutative ring, with `q` a unit, on the finite word module. |
| `TauCeti.KnotTheory.jimboWeightedTrace_one` | same file, line 71 | Identity braid has trace equal to the quantum dimension to the strand count. |
| `TauCeti.KnotTheory.jimboWeightedTrace_skein` | same file, line 95 | Unnormalized crossing difference has coefficient `q − q⁻¹`. |
| `TauCeti.KnotTheory.jimboWeightedTrace_sigma_two` | same file, line 105 | Positive two-strand crossing has trace `q^N` times the quantum dimension. |

The explanatory text in `TauCeti/KnotTheory/Jimbo/Basic.lean:36–46` discusses the same `sl_N` specialization and distinguishes the weighted trace from its writhe normalization. It is not a definition of `homflySpecialization`. Whole-source searches of both pins confirm the nine absences in R01; no newer library was substituted.

**Ownership and resolved citations.** The roadmap grep was run by object across main and the indexed open heads, then the relevant passages were opened. Board package evidence was also searched. TypeAHeckeAlgebras H1 (`TauCetiRoadmap/TypeAHeckeAlgebras/README.md:40`) and H2 (`143`, especially `155–165`) exist on main: H2 owns the algebraic Ocneanu trace, braid invariant and normalization, and explicitly leaves geometric link comparison to GeometricTopology. The new sentence preserves that boundary. This is a citation of main, not an unmerged revision of an existing supplier.

The supplied open MorseTheory head still says that it owns Brown's theorem (`TauCetiRoadmap/MorseTheory/README.md:70–74,619–636`). GeometricTopology is the provider under the direction established in r6: its own earlier targets consume Schoenflies, and MorseTheory consumes its foundational geometry. The requested edit now records that direction explicitly. MorseTheory must replace its duplicate proof ownership with consumption of GeometricTopology Layer 2.2; the new sentence does not prove that the other roadmap has already done so. FourManifolds' open head independently requests the same statement from GeometricTopology (`TauCetiRoadmap/FourManifolds/README.md:219–225`, `gap:brown-schoenflies`), rather than claiming its proof. No edit to either consumer was made. Ownership against open pull requests not supplied by the brief was not independently checked beyond the indexed grep results.

**Sources and seeded sample.** Only **2.2 Schoenflies** and **4.13 Kondo** from this round's seeded sample intersect the changed passages or their direct ownership/locator corrections. Both were fetched through the sources service and read. The other thirteen sampled targets were not re-audited, as required by the incremental scope; unchanged mathematical evidence is carried below with explicit r6 attribution.

- `brown1960` lines 84–85 and 101–113, Theorems 4 and 5, printed p. 76: the cellular-set argument and the conclusion that both complementary closures of a bicollared sphere are cells support Layer 2.2. The prescribed boundary parametrization follows by coning the boundary discrepancy; the explicit value test is below. This is Brown 1960, distinct from the pinned bicollaring theorem. One source cross-reference misprint is recorded under Source issues.
- `kondo1979` lines 258–277, printed pp. 558–559: (8) labels the Alexander-polynomial formula; (*) labels the system solved by the integer parameters; the intervening text uses (8) to identify the resulting polynomial. Theorem 3 is at lines 269–277. The repaired prose assigns the correct role to each label. The legal copy is the [Osaka University institutional text](https://ir.library.osaka-u.ac.jp/repo/ouka/all/6492/ojm16_02_19.pdf). The initial bibliographic lookup failed, but the service fetched this institutional URL successfully; there is no remaining reference request for it.

**Adversarial table.** The first five rows are fresh checks of the changed claims and the surviving supplier defect. The following 47 rows carry the previous report's computed instances and values, not a claim to have repeated its full review. Thus there are **52 rows**, covering all fourteen unchanged Lean headlines as well as the changed claims. Historical “repaired” labels and references to old finding numbers have been replaced with the explicit provenance link [r6].

| Statement | Instances | Values computed on the two sides | Result; change |
|---|---|---|---|
| New coefficient-map explanation, `README.md:315–316` | `K=ℚ`, `q=2`, `N=0,1,2`; generic indeterminate `q`; attempted evaluation at `q=1` | Images of `(a,z)` are `(1,3/2),(2,3/2),(4,3/2)`; `φ(a+z)=φ(a)+φ(z)=5/2,7/2,11/2`; `φ(az)=φ(a)φ(z)=3/2,3,6`. Generically `(q−q⁻¹)·q/(q²−1)=1`; at `q=1`, `z=0` cannot be the image of a unit. | Intended rational-function substitution is consistent, including `N=0` as an algebraic substitution; not arbitrary specialization at `q=1`. The claimed pinned map remains absent: R01. |
| New `sl_N` trace-route explanation, `README.md:1290–1291` | `N=2`, `q=2`; one and two identity strands; positive stabilization; trefoil under `a=v⁻¹` | Quantum dimension `q+q⁻¹=5/2`; traces `5/2`, `25/4`, `q²·(5/2)=10`. Normalized positive one-crossing closure gives `q⁻²·10/(5/2)=1=P(unknot)`. With `v=1/4,z=3/2`, `2v²−v⁴+v²z²=67/256`; the skein calculation `v²+vz·(17/32)` is also `67/256`. | Substitution and trace normalization are compatible under the explicit `a=v⁻¹` convention. Algebraic comparison is supplied by H2; existence of the named pinned substitution is still R01. |
| Repaired Kondo route and reference, `README.md:1545–1547,2827–2828` | Symmetric polynomials of the displayed family at `k=1,2`; unit polynomial | `Δ₁=t−1+t⁻¹`, value at 1: `1−1+1=1`, span `2`, so `2≤2g`; `Δ₂=−t²+4t−5+4t⁻¹−t⁻²`, value at 1: `−1+4−5+4−1=1`, span `4`, so `4≤2g`. `Δ=1` has span `0` and bound `0≤2g`; it does not force the unknot. | Label correction leaves the theorem and genus deduction intact. System (*) supplies parameters; (8) identifies the output. r6 R04 repaired. |
| Added Schoenflies supply to MorseTheory M4.1, `README.md:2751–2752` | Equatorial `S⁰⊂S¹`, `S¹⊂S²`; reversed boundary parametrization | Complement closures: two intervals, each with 2 boundary points; two discs, each with `χ=1`. For boundary discrepancy `h`, extension `E(ru)=r h(u)` has `E(0)=0`, `E(u)=h(u)`, and `E⁻¹(E(ru))=r h⁻¹(h(u))=ru`. Reflection extends to reflection, determinant `−1`. | Bicollar hypotheses and boundary marking match the consumer's topological input; no smooth or oriented conclusion is introduced. Local r6 R03 repair complete; consumer text still needs alignment. |
| Surviving radius-function supplier requirement, R01 | Disjoint circles centered at `(3n,0)` with radii `1/n`, `n≥1` | For every constant `ε>0`, take `n>1/ε`: all inward normal vectors of length `1/n<ε` map to the same center, so the tube map is not injective. With radius `1/(2n)`, image radii satisfy `1/(2n)<r<3/(2n)` and distinct components remain disjoint. | Compact-source constant-radius theorem cannot discharge the noncompact contract. Repair must retain the radius-function target, not restrict to compact sources. |
| 1.1 collars | `[0,1]`; disc; `S¹`; constant map | images `[0,½) ∪ (½,1]`, `0 < \|z\| ≤ 1` open; `∂S¹ = ∅` vacuous; `(x,t) ↦ x` not open | Carried from [r6]; statement unchanged |
| 1.2 complements | `ℝ ∖ (−1,1)`; `ℝ² ∖` disc; `Sⁿ ∖` ball | 2 components vs 1; `Dⁿ` by stereographic projection | Carried from [r6]; statement unchanged |
| 1.4 connected sum | `T² # T²`; `ℂP² # ±ℂP²`; `ℝ # ℝ` | `χ = 0 + 0 − 2 = −2`; forms `diag(1,1)`, `diag(1,−1)`, signatures 2, 0; 2 components | Carried from [r6]; statement unchanged |
| 1.5 tube Check | unit circle, strict tube | `x(1+s)`, `−ε < s < ε`: injective for `ε ≤ 1`, image `1−ε < \|z\| < 1+ε`; `ε = 1`: `0 < \|z\| < 2`; `ε > 1`: `(x, −x) ↦ 0` for all `x`; closed tube at `ε = 1`: `(x,−x) ↦ 0` | Carried from [r6]; statement unchanged |
| 1.6 Whitney move | `d = 4` | Whitney disc need not embed; excluded by `d ≥ 5` | Carried from [r6]; statement unchanged |
| 1.7 PL | `x ↦ x + x³`; `x ↦ x³` | not affine on any interval; inverse `x^{1/3}` not differentiable at 0 | Carried from [r6]; statement unchanged |
| 1.8 genus | torus; genus-one, `b = 1`; disc | `(2−0−0)/2 = 1`; `(2+1−1)/2 = 1`, `rank H₁ = 2`; `(2−1−1)/2 = 0` | Carried from [r6]; statement unchanged |
| 2.2 Schoenflies | round sphere; horned sphere | two round balls; not bicollared, excluded | Carried from [r6]; statement unchanged |
| 2.3 annulus headline | `n = 0`, points `±1`, `±2` | `[−2,−1] ∪ [1,2] = S⁰ × I`; pinned `coboundAnnulus_smul_coe_sphere` | Carried from [r6]; statement unchanged |
| 3.1 topologies | `f_k = θ + k⁻² sin kθ` | `f_k' = 1 + k⁻¹ cos kθ > 0`; `sup\|f_k − id\| = k⁻²`, `sup\|f_k' − 1\| = k⁻¹`, `f_k'' = −sin kθ`, sup 1 | Carried from [r6]; statement unchanged |
| 3.2 families | `F_k = e^{i sin(kθ)/k} z`; reflection | angle `≤ 1/k`; `∂_θ F_k(0, z) = iz`, norm 1; conjugation degree `−1`; `O(n+1)` compact, `Diff(Sⁿ)` Hausdorff | Carried from [r6]; statement unchanged |
| 3.4 Smale, Watanabe headlines | `O(4)`; `A₂ = ℚ` | `π₀ O(4) = C₂`, `π₁ SO(4) = C₂`, `−I ∈ SO(4)`; first nonzero class in degree 2 | Carried from [r6]; statement unchanged |
| 4.1 knot types | square vs granny; trefoil vs mirror | `Δ = (t−1+t⁻¹)²` both, `σ = 0, −4`; `V = t+t³−t⁴` vs `t⁻¹+t⁻³−t⁻⁴` | Carried from [r6]; statement unchanged |
| 4.3 Seifert form | trefoil; figure-eight; Hopf annulus | `V − Vᵀ = [[0,1],[−1,0]]`, det 1; `[[1,1],[0,−1]]`; annulus: `lk(∂₁,∂₂) = −lk(c, c_A)`, so positive Hopf (`lk = +1`) has `θ(c,c) = −1`, `θ(−c,−c) = θ(c,c)`; trefoil diagonal `−1, −1` | Carried from [r6]; statement unchanged |
| 4.4 Alexander | `T(2,n)`, `n = 0,…,3`; `Δ(−1)` | `Σ_{j<n}(−t)^j = 0, 1, 1−t, 1−t+t²`; value `n` at `t = −1`; `V+Vᵀ ≡ V−Vᵀ (mod 2)`, det odd | Carried from [r6]; statement unchanged |
| 4.5 Jones | Hopf, trefoil by skein; reversal | `V(H) = t(t^½−t^−½) − t²(t^½+t^−½) = −t^½ − t^{5/2}`; `V(T) = t² + t(t^½−t^−½)(−t^½−t^{5/2}) = t+t³−t⁴`; reversed Hopf `−t^−½−t^{−5/2} = t^{−3·1} V(H)` | Carried from [r6]; statement unchanged |
| 4.6 HOMFLY | trefoil skein; specialisations | `P(H) = vz + (v−v³)/z`, `P(T) = v² + vz·P(H) = 2v²−v⁴+v²z²`; `x = t⁻¹, y = −t, z = t^−½−t^½` gives `t⁻¹V₊ − tV₋ = (t^½−t^−½)V₀`; `x = 1, y = −1` gives Conway's relation; `P_H(1,−1,w) = −w`, `Δ_H = t^½ − t^−½` | Carried from [r6]; statement unchanged |
| 4.7 colourings, Arf | trefoil mod `1, 3, 6, 7`; `6₁` | `1, 9, 6·1·3 = 18, 7`; `det 6₁ = 9 ≡ 1 (mod 8)`, Arf 0 | Carried from [r6]; statement unchanged |
| 4.8 span, MFW | `U₂`, `U₃`; trefoil `σ₁³`; `T(3,4)` | spans `1 = 0+2−1`, `2 = 0+3−1`; `k = 2, w = 3`: `v`-exponents in `[2,4]`, `P(T)` has `v², v⁴`; `span V = 5 < 8` | Carried from [r6]; statement unchanged |
| 4.8 Turaev genus | `g_T = (2 + n − s_A − s_B)/2`; band sum of two alternating diagrams | `s_A(D₁#D₂) = s_A(D₁)+s_A(D₂)−1`, likewise `s_B`, `n` additive: `g_T(D₁#D₂) = g_T(D₁)+g_T(D₂)` | Carried from [r6]; statement unchanged |
| 4.10 two-bridge | `3/1` vs `3/4`, `3/7`, `3/5`; `5/2` vs `5/3`; `7/2` vs `7/3` | `4 ≡ 1 (mod 3)` same unoriented; `4 ≢ 1^{±1} (mod 6)` so parity normalisation needed; `7 ≡ 1 (mod 6)` isotopic; `5·1 ≢ 1 (mod 6)`, `5 ≡ −1 (mod 3)` mirror; `2·3 ≡ 1 (mod 5)`; `3 ≢ 2^{±1} (mod 7)` | Carried from [r6]; statement unchanged |
| 4.11 torus knots | `T(p,−q)`, `T(−p,−q)`, `T(1,q)` | `(u^p, ū^q)` is the reflection image; `(u^{−p},u^{−q}) = T(p,q)(u⁻¹)`, the reverse; isotopy `(√(1−s²)u, s u^q)`, `0 ≤ s ≤ 2^{−½}`, each slice injective in the first coordinate | Carried from [r6]; statement unchanged |
| 4.12 Garside | `σ₁σ₂⁻¹` | `Δ₃σ₂⁻¹ = σ₂σ₁`; `σ₁Δ₃⁻¹ = Δ₃⁻¹σ₂`; normal form `Δ₃⁻¹·σ₂·σ₂σ₁`, `F(σ₂) = {2} ⊇ S(σ₂σ₁) = {2}` | Carried from [r6]; statement unchanged |
| 4.13 Kondo | `Δ_k = 1 + (−1)^{k−1}(t+t⁻¹−2)^k` | symmetric, `Δ_k(1) = 1`, span `2k ≤ 2g` | Carried from [r6]; statement unchanged |
| 4.14 counting | `n = 4,…,7`; `n = 3` upper bound | `(2^{n−2}−1)/6 = ½, 7/6, 5/2, 31/6` vs `1, 2, 3, 7`; `4·16^{2n}` from `Catalan(s)·Catalan(s+1) ≤ 4^s·4^{s+1}`, `s = 2n` | Carried from [r6]; statement unchanged |
| 5.2 fillings | Hopf framings `(0,0),(0,n),(1,1),(3,2)`; trefoil `±1` | `ab − 1 = −1, −1, 0, 5`: `S³, S³, S¹×S², L(5,2)`; `Σ(2,3,5)` vs `Σ(2,3,7)` | Carried from [r6]; statement unchanged |
| 5.3 Mathieu | `k = 0` | slopes `9/1`, `9/2`; multiplicities `2, 3, \|9−6\| = 3` and `\|9−12\| = 3`; `H₁ = ℤ/9` | Carried from [r6]; statement unchanged |
| 5.4 Moser, Kanenobu–Murakami | `T(1,2)` at 5; trefoil at `5, 6, 7`; `8₃ = 17/4` | `\|5−2\| = 3` yet `L(5,1)`, excluded by `\|r\|,\|s\| ≥ 2`; `\|p−6q\| = 1, 0, 1`: `L(5,9) = L(5,4)`, `L(2,1)#L(3,1)`, `L(7,9) = L(7,2)`; `17 = 2mn ± 1` gives `(m,n) ∈ {(4,2),(8,1),(9,1),(3,3)}`, `2n², 2m² mod 17 ∈ {8, 15, 2, 9, 1}`, none `≡ 4^{±1} = 4, 13` | Carried from [r6]; statement unchanged |
| 6.1 kernel | unknot; Whitehead double of trefoil; square knot | unknot in kernel (zero); double nonzero in kernel (`τ = 1`); square knot slice, `Δ ≠ 1` | Carried from [r6]; statement unchanged |
| 6.2 signatures | trefoil; figure-eight; `ω = e^{iπ/3}`; `−1 ∈ S¹_!` | `V+Vᵀ = [[−2,1],[1,−2]]`, `σ = −2`; `[[2,1],[1,−2]]`, det `−5`, `σ = 0`; `t²−t+1 = 0` at `e^{±iπ/3}`, one-sided `0, −2`, mean `−1`; `p(−1) ≡ p(1) (mod 2)` | Carried from [r6]; statement unchanged |
| 6.4 Freedman headline | unknot; trefoil | perfect commutator, slice; `Δ ≠ 1`, `σ = −2`, not slice | Carried from [r6]; statement unchanged |
| 7.1 quotients | genus 2; cusp end | area `2π·2 = 4π`; `∫₀^∞ A e^{−2t} dt = A/2` | Carried from [r6]; statement unchanged |
| 7.2 Mostow headline | genus-2 surface | `6g − 6 = 6` moduli; excluded by `n ≥ 3` | Carried from [r6]; statement unchanged |
| 7.3 finite volume | Gieseking; empty manifold; cusp | `v₃ = 1.0149…`, Klein-bottle cusp; volume 0; `T² × [0,∞)` finite, non-compact | Carried from [r6]; statement unchanged |
| 7.4 Weeks, Agol headlines | `(5,1),(5,2)` filling; `S³` | `0.9427… < 1.0149… < 2.0298…`; `H₁ = (ℤ/5)²`; `π₁(S³)` finite, not hyperbolic | Carried from [r6]; statement unchanged |
| 8.1 headlines | equatorial `S²`; unknot vs trefoil; granny vs square | two balls; `ℤ` vs `⟨x,y ∣ xyx = yxy⟩` with `S₃` quotient; equal groups, `σ = −4, 0` | Carried from [r6]; statement unchanged |
| 8.2 finiteness | `N` parallel spheres in `S²×S¹`; small spheres in `T³` | complements `S² × [0,1]`, punctured spheres; `π₁`-injective but excluded as spheres | Carried from [r6]; statement unchanged |
| 8.4 Seifert | `ℝP³ # ℝP³`; `T³` vs `K × S¹`; sphere in `T³` | `π₁ = C₂ ∗ C₂`, reducible; orientation characters `0` vs nonzero; `χ = 2 ≠ 0`, not essential | Carried from [r6]; statement unchanged |
| 8.5 JSJ headline | `T³`; Anosov bundle; two trefoil exteriors glued `μ ↔ λ` | 0 tori; 1 torus; fibre slopes `6` and `1/6` differ | Carried from [r6]; statement unchanged |
| 8.6 geometrization, Poincaré | `S³`; Poincaré sphere; `S¹×S²` | empty decomposition; `\|π₁\| = 120`; `π₁ = ℤ`, not irreducible, excluded by `IsSphereBoundsBall` | Carried from [r6]; statement unchanged |
| 9.2 genus | `L(1,q)`; Poincaré sphere; `T³` | genus 0; `g = 2 = rank`; `g = 3 = rank ℤ³` | Carried from [r6]; statement unchanged |
| 10.1 Reeb stability | orientable leaf with finite `π₁`; Reeb foliation | `χ = 2`, leaf `S²`; torus leaf compressible, no closed transversal through it | Carried from [r6]; statement unchanged |
| 10.2 Novikov–Rosenberg | `S²×S¹`; `L(p,q)`; `S³` | taut product foliation, reducible, universal cover `S²×ℝ`; finite `π₁`, no taut foliation; Reeb foliation only | Carried from [r6]; statement unchanged |
| 11.1 join law | one edge `e`; vertex of triangle | `Lk(e) = ∅`, `∂e ∗ ∅ = S⁰`; `Lk = S⁰`, cone on `S⁰` | Carried from [r6]; statement unchanged |
| 11.3 triangulations | `ΣP`; `Σ²P`; `E8 × S¹` | punctured-vertex `π₁` of order 120; `≅ S⁵`, non-combinatorial; triangulable, non-PL | Carried from [r6]; statement unchanged |
| 11.4 Manolescu headline | `n = 5`; `n = 0` | non-orientable examples only, no orientability clause; `TriangulationConjecture 0` holds | Carried from [r6]; statement unchanged |
| 11.5 collapse | triangle boundary; dunce hat; vertex cylinder | no free face, `χ = 0`; contractible, no free face; interval | Carried from [r6]; statement unchanged |

[r6]: packages/GeometricTopology/reports/PRREVIEW-GeometricTopology~6.md

**Headline coverage retained.** The fourteen headlines are annulus, Smale, Watanabe, Freedman, Mostow, virtual fibering, virtual Haken, Alexander's sphere theorem, the knot-group theorem, Gordon–Luecke, JSJ, geometrization, Poincaré and Manolescu. All fourteen unchanged signatures were elaborated and probed here. The unchanged module docstring explains the missing carriers for Li, Weeks, Property P, Property R, cyclic surgery, Kondo, Cerf, Kneser–Milnor and Novikov–Rosenberg, and identifies Zeeman as open. No changed passage adds another statable headline. The previous headline statability audit is carried from [r6], rather than presented as a new whole-library search.

## Not verifiable

- No changed locator remains unreadable. Kondo's extracted display symbols are incomplete, but its labels and the explanatory sentences establishing their roles are legible at `kondo1979` lines 258–277. This review verifies the corrected locator and the elementary polynomial instances; it does not claim a fresh transcription of the full matrix formula or parameter system.
- The unchanged source limitations listed in [r6], under Not verifiable, remain inherited limitations. They were not reopened or represented as newly certified. In particular, this incremental review does not certify the thirteen untouched targets in the new seed sample from their source texts.
- The unchanged companions were rescanned for the prior form defect; their mathematics was not re-reviewed in full. Open-roadmap ownership outside the supplied files was checked only to the extent described above.

## Source issues

- **Misprint** in brown1960 at proof of Theorem 4, printed p. 76 (`brown1960` line 99): the source says cellularity of the sole non-singleton inverse set follows from Theorem 2; it should be Theorem 3, which states precisely that cellularity conclusion; affects the proof.
