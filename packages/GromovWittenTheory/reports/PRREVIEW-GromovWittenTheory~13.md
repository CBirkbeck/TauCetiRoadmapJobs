# Review of GromovWittenTheory (pull request #990 at e18b995)

**Verdict:** needs changes

:robot: Independent AI review. This is a full review of the folder at `e18b995527b9ea21d6eacdfc0838ae3b6447f18d`, the same head the previous review read (0 lines changed in the folder). There are five findings, all P3. Three are new and come from the full read: a genus-reduction Check whose right side is identically zero, a divisor Check outside the hypothesis of its section, and a supplier section number. The other two are carried over from the previous review because nothing changed: the branch pin, and the folder conflict with #1998. Both the gate and the dependency check pass on an independent rerun. `lake env lean` on `Suggested.lean` exits 0 with no output. Every sampled source locator matches its text.

## R01 (P3) — The genus-reduction Check on `M̄_(0,4) → M̄_(1,2)` asserts a nonzero “multiple of 1” for a class that is zero

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:564` (§6.3, second Check): “the right side is `Σ g^(ab) (∫ γ₁γ₂Δ_aΔ_b) · 1` on `M̄_(0,4)` by §5.4, so the degree-two class `I_(1,2,0)(γ₁, γ₂)` restricts to the boundary divisor as a multiple of `1` determined by the cup product on `X`.”

**Claim:** `g^(ab) ≠ 0` only when `deg Δ_a + deg Δ_b = 2m`. Every term on the right therefore has total insertion degree `2 + 2m`, and by §5.4 (`README.md:503`, “nonzero only for `Σ deg γ_i = 2m`”) every term vanishes. The right side is `0` for every `X`, `γ₁` and `γ₂`. The left side is `ξ^*` of a degree-two class, so it lies in `H²(M̄_(0,4))`, while a “multiple of `1`” lies in `H⁰`. As written, the Check states a degree-inconsistent identity, and its “multiple determined by the cup product” is always `0`. It never says that the restriction vanishes, so it does not visibly exclude a wrong model with `ξ^*I_(1,2,0) ≠ 0`.

**Witness:** Take `X = ℂP¹` (`m = 1`), `γ₁ = pt`, `γ₂ = 1`. The right side is `g^(1,pt) ∫ pt·1·1·pt + g^(pt,1) ∫ pt·1·pt·1 = 0 + 0`. By §5.4's Hodge–Euler formula, `I_(1,2,0)(pt, 1) = p₁*((c₁(TX) − λ₁) ⌣ p₂^* pt) = −λ₁`, and `ξ^*λ₁ = 0`. So both sides are `0`.

**Repair:** Replace the Check with a discriminating one. For example: “`ξ : M̄_(0,4) → M̄_(1,2)`, `A = 0`, `X = ℂP¹`, insertions `pt, 1`: every term on the right has insertion degree `4 > 2m = 2`, so the right side is `0` by §5.4. On the left, §5.4 gives `I_(1,2,0)(pt, 1) = −λ₁`. The residue at a glued branch trivializes `ξ^*𝔼₁` (the fibre is spanned by `dz/z`, §3.2's first Check), so `ξ^*λ₁ = 0` and both sides are `0`. A model with `ψ̄₁` in place of `λ₁` would give `−ξ^*ψ̄₁`, whose integral over `M̄_(0,4)` is `−1` (`∫ ψ̄₁ = 1`, §8.1), and is excluded.” Tested on the instance above: the right side is `0`, and the left side is `−ξ^*λ₁ = 0`.

## R02 (P3) — The second divisor Check applies §5.3 to the basic signature `(0, 3, ℓ)`, which §5.3 excludes

**Location:** `README.md:491` (§5.3): “For non-basic `I_(g,n,A)` and a degree-two last insertion `δ` prove …”. `README.md:496` (its second Check): “`⟨I_(0,3,ℓ)(pt, pt, H)⟩ = 1 · ⟨pt, pt⟩_(0,2,ℓ) = 1`, where the right side is the numerical operation of §2.2 on the pointed-unstable signature `(0, 2)`”.

**Claim:** `I_(0,3,A)` is basic: it is in §5.1's list (`README.md:463`) and in Kontsevich–Manin (2.3). §5.3 states the class-valued and numerical divisor identities only for non-basic classes, as Kontsevich–Manin 2.2.4 does. The Check therefore tests an identity that its section does not state. The value is correct (`(ℓ·H) = 1`, `⟨pt, pt⟩_(0,2,ℓ) = 1`, degrees `4 + 4 = 8 = d_(0,2,ℓ)`), but the result it instantiates is §8.4's divisor equation with all `k_i = 0`. That equation is stated for every map-stable signature whose forgetful map exists (`README.md:732`, `742`).

**Witness:** `KM94` line 146 (the basic list contains `I_(0,3,β)`) and line 186 (2.2.4: “a non-basic codimension zero class”). README §5.3 has the same restriction at line 491.

**Repair:** Move the Check to §8.4's Checks as the `k_i = 0` instance of the divisor equation for `(0, 3, ℓ) → (0, 2, ℓ)`. Alternatively, extend §5.3's numerical statement to the basic signatures `(0, 3, A)` and `(1, 1, A)` with `A ≠ 0`, whose map-level forgetful morphism §5.2 constructs, with the numerical operation of §2.2 on the right. Tested: `⟨pt, pt, H⟩_(0,3,ℓ) = (ℓ · H) ⟨pt, pt⟩_(0,2,ℓ) = 1 · 1 = 1`, with degrees `10 = d_(0,3,ℓ)` and `8 = d_(0,2,ℓ)`.

## R03 (P3) — AnalyticStableMaps §0.3 is cited for the closed Cauchy–Riemann index, which is §0.2 there

**Location:** `README.md:80`, contract with AnalyticStableMaps: “§0.3 and §4.1: the closed Cauchy–Riemann index and the nodal augmented index, whose value is `d_(g,n,A)`.”

**Claim:** At the AnalyticStableMaps head `41557ba`, §0.3 (line 154) is “Determinant lines and complex orientations on closed surfaces”. The closed index is §0.2 (line 138, “The linearized operator and the closed index”), whose bullet says the index depends only on `m`, `χ(Σ)` and `⟨c₁, u_*[Σ]⟩`. §4.1 (line 687) builds the nodal index from “the component index of §0.2”, not §0.3. §4.3 of this roadmap consumes this contract line.

**Witness:** AnalyticStableMaps `README.md:138` and `:154` at head `41557ba`. Its §0.2 Check gives the constant-map index `2m − 2mg` and the index `6` for the identity of `ℂP¹`. Its §0.3 Checks are the circle-cutting orientation computations.

**Repair:** Change the contract to “§0.2 and §4.1: the closed Cauchy–Riemann index and the nodal augmented index …”. If the virtual dimension `v` is meant, cite §0.1, where `v = 2((m−3)(1−g) + ⟨c₁, β⟩ + n)` is defined. Tested: §0.2's index `m(2 − 2g) + 2c₁` plus the node and domain terms of §4.1 gives `10 = d_(0,0,2ℓ)` for the two-line nodal conic of ASM §4.1's first Check.

## R04 (P3) — The README and the docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R01 (R02 of the review before it), still not repaired.

**Location:** `README.md:66` (“### From Tau Ceti (commit 2fd255d)”) and the contract at lines 68–75. `Suggested.lean:31–39` (“The pinned Tau Ceti has the compact nodal domain as the gluing quotient `GluedCurve`”, “the pinned Tau Ceti has the Čech groups”). `lake-manifest.json:8`.

**Claim:** The branch manifest pins Tau Ceti `a91d3aa` (Mathlib `6b7abb3c`). Main pins Tau Ceti `2fd255d9`. At `a91d3aa`, 8 of the 13 Tau Ceti files the contracts name are absent: `Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`, `AlgebraicGeometry/Curves/NodalGluing/Basic.lean`, `Topology/Sheaves/Cech/Colimit.lean`, `Topology/Sheaves/Cech/Pullback.lean`, `Geometry/Manifold/SmoothSingular/Basic.lean`, `Geometry/Manifold/SmoothSingular/Integral.lean`, `RingTheory/NovikovSeries/Basic.lean` and `RingTheory/NovikovModule/Basic.lean`. So `TauCeti.NovikovSeries`, `TauCeti.NovikovModule`, `TauCeti.Topology.cechCohomology`, `SmoothAlmostComplexStructure` and `GluedCurve` do not exist at the pin the branch builds against. The docstring's “the pinned Tau Ceti has …” sentences are true only at `2fd255d`.

**Witness:** `git merge-base --is-ancestor origin/main HEAD` fails at `e18b995`. `lake-manifest.json:8` reads `a91d3aaf…`, and `origin/main:lake-manifest.json` reads `2fd255d9…`. Every declaration listed under Verified sound resolves at `2fd255d`.

**Repair:** Merge or rebase the branch onto origin/main (the worker's rebase step). No line of the folder changes. Tested: all 62 Tau Ceti declarations of the contracts resolve at `2fd255d` (table below).

## R05 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

This is the previous R02 (R05 of the review before it), still not repaired.

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (all three files), and this pull request's description, which does not mention #1998.

**Claim:** #1998 (algebraic Gromov–Witten theory and quantum cohomology of smooth projective varieties, head `c41b144`) adds a different roadmap under the same folder name. The heads conflict in `README.md`, `Suggested.lean` and `metadata.toml`, and neither description says which one moves. The objects are distinct (Behrend–Fantechi classes on algebraic stacks there; analytic stable maps, implicit atlases and Čech cohomology here), so this is a naming and order conflict, not a double owner.

**Witness:** `scratch/overlaps.md` (index of 2026-11-09): “#990 and #1998 conflict in `TauCetiRoadmap/GromovWittenTheory/README.md`, `…/Suggested.lean`, `…/metadata.toml`”. `roadmaps list` shows both as new roadmaps named GromovWittenTheory.

**Repair:** State in this pull request's description that this roadmap keeps the folder `GromovWittenTheory`, the name HamiltonianFloerOperations already cites on main (`README.md:17`, “GromovWittenTheory G0/G5–G7”), and that #1998 takes another folder name before either merges. No folder line changes.

## Previous findings

- Previous R01 (branch pin): **not repaired**. `lake-manifest.json:8` is still `a91d3aa`. It is R04 above.
- Previous R02 (#1998 order): **not repaired**. The description quoted in `scratch/pull-request.md` is unchanged. It is R05 above.
- No repair report marks either finding “not actionable in this package”.

## Verified sound

**Gate, dependency check and build.**
- Independent rerun of the full gate at `e18b995`: every check `0`, `OK`, exit 0. The worker's gate at this head also passes with `build=0`.
- Dependency check with `--movable` against the board's merge order and main content: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 307. Its open suppliers precede it: ImplicitAtlases (214), AnalyticStableMaps (215) and TopologicalSheafCohomology (306). ComplexCurveModuli, Orbifolds, CharacteristicClasses, AlgebraicTopology, GeometricTopology, DifferentialGeometry, ComplexKahlerGeometry, PseudoholomorphicCurveAnalysis and PDE are on main.
- `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` in the branch worktree: exit 0, 16 s, no output. The file has the single `import Mathlib`, the module docstring, the namespace and no declaration. It has no `set_option`, no sorry'd data and no `lemma`.
- `git diff --stat origin/main...HEAD` outside the folder: empty.

**Headline theorems** (`Suggested.lean:12–25`, README Summary):
1. The operations `I_(g,n,A)` with tame-path independence and the Kontsevich–Manin properties 2.2.0–2.2.7 (Layers 2–6).
2. `I_(1,1,0)(1) = χ(X)·1` (§3.4).
3. The unital CohFT over `Λ_ω` and the associative quantum product (§7.1–§7.2).
4. The string, dilaton and divisor equations and the genus-zero ancestor TRR (§8.4–§8.6).

None is statable at either pin. I confirmed the missing carriers the docstring names at Tau Ceti `2fd255d`:
- No declaration named `chernClass` or `firstChernClass` exists in Tau Ceti or the branch's Mathlib.
- No moduli of stable curves or stable maps exists; the only grep hits are Auslander–Reiten “stable morphisms”.
- No cup product exists under `Topology/Sheaves/Cech/` or `CategoryTheory/Sites/SheafCohomology/`.

With no declarations there is nothing to probe for padding and nothing for the `#check @name` signature comparison. The mechanical comparison was therefore not applicable, and no binder was lost.

**Sources read at every sampled locator.** All texts are legal copies: arXiv, Numdam, the author's page and the Stacks Project.
- `KM94` (arXiv v2):
  - 2.2.0–2.2.2 and (2.2): lines 133–142, p. 4.
  - The basic list (2.3) and (2.4): lines 144–158, p. 4.
  - 2.2.3, (2.6)–(2.7): lines 176–185, p. 5.
  - 2.2.4, non-basic only: lines 186–196, p. 5.
  - (2.8): lines 199–204, p. 5. (2.9)–(2.10): lines 210–215, p. 6.
  - 2.2.6 and (2.11), with the Casimir as the diagonal class: lines 220–241, p. 6.
  - 2.2.7 and (2.12): lines 242–246, p. 6. 2.2.8: line 247, p. 6.
  - 2.4.5, `T(1) ≅ E ⊠ TV`, `E = R¹π_*𝒪`: lines 408–421, p. 10.
  - Theorem-Definition 4.5: line 816, p. 19.
  - Definition 6.1 (a coefficient field, a non-degenerate pairing, no unit axiom): lines 1455–1473, p. 31.
- Kontsevich–Manin 1998 (arXiv alg-geom/9708024v1):
  - (1)–(2): lines 53–70, p. 2.
  - Theorem 1.2 and (4): lines 81–96, p. 2. The proof sketch: lines 107–118, p. 3.
  - Corollary 1.3 and (4a): lines 99–103, p. 3.
  - (11): line 219, p. 5. Lemma 1.5.2 and (12): lines 238–247, p. 5.
  - Lemma 1.5.3 (dilaton), derived from [BM]/[B]: lines 279–281, p. 6.
  - (9)–(10): lines 201–208, p. 4, which give `deg c_δ(V)` and `−(c_(δ−1), γ)∫λ₁`, matching §3.4.
- Kock, *Notes on psi classes* (author's page):
  - Lemma 1.2.6: line 245, p. 10. `ψ_i · D_(i,0) = 0`: line 308, p. 12. Lemma 1.3.1: line 310, p. 12.
  - Lemma 1.4.2: line 368, p. 14. Lemma 1.5.1: line 416, p. 15. 1.5.2: line 467, p. 15.
  - 1.6.2 (dilaton, excluding `⟨τ₁⟩₁`): line 501, p. 16.
  - (5.1.7.1): line 1885, p. 50. (5.1.7.2) and (5.1.7.3) in genus zero, with the higher-genus case left open: lines 1899–1902, p. 51.
  - Proposition 5.1.8: line 1904, p. 51. Lemma 5.1.9 (`ε^*ψ₁ = ψ₁ − E₁`): line 1914, p. 51.
  - Lemma 5.2.1: line 2009, p. 53.
- Deligne–Mumford (Numdam): §1, facts b) and c) on p. 77, lines 99–104, stated for stable curves of genus `≥ 2` (Definition 1.1, line 76).
- Pardon (arXiv 1309.2370v6):
  - Theorem 9.2.10, Definition 9.3.1 (with `2g + n > 2`) and Lemma 9.3.2: lines 4353–4366, p. 100.
  - §5 introduction, the fibre-product formula as desired: lines 1698–1700, p. 40.
  - The remark that the KM axioms need more properties: lines 4087–4090, p. 95.
- `stacks-curves`:
  - Lemma 18.3, Tag 0CE3 (the four-term sequence): lines 1677–1688.
  - Lemma 18.4, Tag 0CE4 (the reduced short exact sequence in the proof): lines 1691–1704, p. 39.
  - Lemma 19.7, Tag 0C4D, item (6): line 1940.
- `stacks-cohomology`: (25.3.2), Tag 07MB, lines 2361–2370, p. 50, with `ε(n,m,p,n) = 1` at line 2373, p. 51 (spot check; the previous review read all of Section 25).

**Library declarations opened** at Tau Ceti `2fd255d`, the commit the README names. There are 62; all paths are under `TauCeti/`.

| File | Declarations (line) |
|---|---|
| `Geometry/Symplectic/Manifold/TwoForm.lean` | `SmoothTwoForm.IsSymplectic` 115, `SmoothTwoForm.Tames` 174 |
| `Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean` | `SmoothAlmostComplexStructure` 71 |
| `AlgebraicGeometry/Curves/NodalGluing/Basic.lean` | `FlagPairData` 149; `GluedCurve` (module doc 63) |
| `Geometry/Symplectic/Manifold/Energy.lean`, `JHolomorphic.lean` | `Tames.stdComplexLineEnergyDensity_pos` (doc 64); `IsPseudoholomorphic` 101 |
| `AlgebraicTopology/Cohomology/Basic.lean`, `Cup.lean` | `singularCohomologyFunctor` 164; `TopCat.singularCup` (doc 25, 42) |
| `Topology/Sheaves/Cech/Colimit.lean`, `Pullback.lean` | `Topology.cechCohomology` 70 (point-open-cover colimit), `isZero_cechCohomology_obj_of_isEmpty` 76, `cechCohomologyZeroIso` 84; `TopCat.Hom.cechComplexPullback` 53 |
| `Geometry/Manifold/SmoothSingular/` | `smoothSingularSubcomplex` (Basic doc 43), `SmoothSimplex` 121, `SmoothSimplex.integral` (Integral doc 30) |
| `RingTheory/NovikovSeries/Basic.lean` | structure 92, `ext` 109, `finite_setOf_add_eq` 219, `single` 448, `ofFinsupp_surjective_iff` 697 |
| `RingTheory/NovikovSeries/Multiplication.lean` | `instCommRing` 435, `isUnit_single` 476, `instAlgebra` 489, `ofAddMonoidAlgebra` 519, `ofAddMonoidAlgebra_injective` 547 |
| `RingTheory/NovikovSeries/` (other files) | `periodFiltration` 93, `T2Space` 231, `CompleteSpace` 263 (Topology); `nonnegSubring` 245, `posIdeal` 277 (TopologicalRing); `expMulEquiv` 70 (ExpLog); `mapRingHom` 184 (Functoriality); `toLaurentSeries` 77 (LaurentSeries) |
| `RingTheory/NovikovSeries/Grading.lean` | `gradeBy` 92, `single_mem_gradeBy` 101, `gradeBy_eq_bot` 106, `gradeBy_eq_top` 111, `iSupIndep_gradeBy` 115, `eq_single_of_mem_gradeBy` 153, `gradeBy.gradedMonoid` 165 |
| `RingTheory/NovikovModule/Basic.lean` | `NovikovModule` 53, `coordinates` 227, `module` 282, `coordinatesLinearEquiv` 303, `basis` 332 |
| `RingTheory/NovikovModule/Topology.lean` | `potentialFiltration` 108, `isClosed_potentialFiltration` 240, `tendsto_nhds_iff` 260, `T2Space` 265, `isLocallyConstant_apply_val` 313, `CompleteSpace` 321, `denseRange_ofFinsupp` 352, `coordinatesContinuousLinearEquiv` 415, `continuousSMul_module` 445, `continuous_kernelProduct` 527 |
| `RingTheory/NovikovModule/Bilinear.lean`, `Grading.lean` | `kernelProduct` 194, `novikovKernelProduct` 703; `gradeBy` 55, `mem_gradeBy_iff_coordinates` 123, `smul_mem_gradeBy` 143, `kernelProduct_mem_gradeBy` 209 |

The contract's negative claim holds. No file of `RingTheory/NovikovModule/` states an independence, closedness or homogeneous decomposition for `gradeBy`, so those §0.2 targets are not duplicates. The pin's `NovikovModule.tensor` and `externalProduct` (Tensor.lean, TensorProduct.lean) are completed tensor products of two completed modules, not the finite-dimensional comparison `V ⊗ Λ_ω ≅ V ⊗̂ Λ_ω` of §0.2.

Mathlib at the branch pin `6b7abb3c`:
- `IsLocallyConstant.isClosed_fiber`: `Topology/LocallyConstant/Basic.lean:70`.
- `isClosed_biInter`: `Topology/Basic.lean:162`.
- `Algebra.TensorProduct.basis`: `RingTheory/TensorProduct/Free.lean:65`.
- `AddMonoidAlgebra`: `Algebra/MonoidAlgebra/Defs.lean:64`.

**Cross-roadmap citations resolved:** the 24 AnalyticStableMaps sections and 15 ImplicitAtlases sections the README cites, the items of 10 roadmaps on main listed below, and 7 supplier declaration names.
- **AnalyticStableMaps** (open head `41557ba`): all 24 cited sections exist, and 23 say what is cited. §0.3 does not (R03).
  - §0.1 (120) has the energy–area identity and the uniform comparison over compact families.
  - §1.1 (220), §1.2 (237), §2.1 (266), §3.7 (645), §4.1 (687), §4.3 (719), §6.2 (811), §6.3 (823), §7.3 (869), §8.1 (891), §9.1 (929), §9.2 (941), §10.1 (964), §10.2 (976), §11.1 (998), §11.2 (1010), §12.1 (1033), §12.2 (1045), §13.1–§13.3 (1067–1092).
  - §13.4 (1104) assigns the operations, the axioms, the descendants and the curve-class, Chern and area specialization to this roadmap.
- **ImplicitAtlases** (open head `81fc759`):
  - §0.7 (199); §1.1 (297), with the reflection atlas `s(x) = x²` (326) and the `xⁿ`, `zⁿ` atlases (377); §3.1 (451).
  - §4.2 (547), §4.3 (563); §5.2 (611), with outward-first orientation and the `x` / `x²` Check; §5.3 (626), §5.4 (641), §5.6 (669).
  - §6.4 (741), §6.5 (756); §7.1 (783), §7.2 (803), §7.3 (817); §7.4 (842), which says the GW splitting, divisor, unit and forgetful axioms need further application diagrams.
- **On main:**
  - ComplexCurveModuli D3 (74), D4 (105), D5 (119), D6 (139), D7 (192), D8 (215). `finiteActionUniversalChart`, `unorderedAuxiliaryActionChart`, `forgetAuxiliarySet` and `markedPointCollisionBubbleCharts` are present.
  - Orbifolds O5 (672): item 1 is `|G|⁻¹∫_U` with the full ineffective kernel; item 4 is compact classes and duality; item 5 is Thom classes and wrong-way maps.
  - CharacteristicClasses C1.2b (599), with `cechSingularCWTypeComparison` present. C2 (728): items 1 and 3, with `e(TM)[M] = χ(M)` at 837. C3 (1000): item 2, with line-twist and `c_r = e(E_ℝ)` at 1114 and tensor products at 1118.
  - DifferentialGeometry 8.3 (836), 8.4 (845, `deRhamHom`), 8.5 (852, `deRhamEquiv`).
  - GeometricTopology: smoothing-and-triangulation item 1 (930).
  - ComplexKahlerGeometry: K5 (568) and K5b (1168).
  - PseudoholomorphicCurveAnalysis: §1.1 (213), §1.2 (279), §3.2 (581), §6.1 (1045), §6.3 (1128).
  - PDE: §1.6 (A6) (905).
  - TopologicalSheafCohomology: TS1.1 (106) and TS1.2 (126).
  - AlgebraicTopology: Stage 5 item 1 (856, Alexander–Whitney, shuffle and Eilenberg–Zilber), Stage 6 items 1–2 (1011 singular cochains, 1056 cup products), Stage 7 item 1 (1577), and Stage 8 item 7 (1811: compact manifolds have finite CW type).
  - HamiltonianFloerOperations line 17 cites G0/G5–G7.

**Ownership and overlaps.** `roadmaps grep` over main and the 468 open heads:
- The only other “Čech cup product” is CrystallineCohomology #857 (`README.md:324`), on a crystalline site.
- `NovikovModule.gradeBy` occurs only here.
- An associative quantum product occurs only here.

FukayaTheory (#1045, `README.md:34`, `:1002`) names this roadmap as the owner of closed GW classes and consumes nothing from it. DGFloer (#1798) does not mention it. `scratch/overlaps.md` lists no dropped ids in either direction. Its only other entry is #1998 (R05).

**Adversarial pass.** Coefficients are ℚ. Here `t = 6g − 6 + 2n`, `d = d_(g,n,A)`, and `s` is the insertion degree.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Headline 1, grading: Conventions, §2.2, §4.3 vs KM (2.2) | general; `ℂP²`, `(0,4,ℓ)` | `t − d = 2(g−1)m − 2c₁(A)`, and KM's `2(K·β) + (2g−2)m` with `K·β = −c₁` is the same. `s = 12`: `r = 12 − 4 − 6 = 2 = t`; with `+2c₁` instead, `r = 14 > t` | Correct |
| §1.1 stable range | `ℂP¹` degree 1, `(0,0)`; constant `(0,2)`; constant `(1,1)` | `d = 2(−2+2) = 0` (a point); `d = 2m − 2` but the space is empty by stability; `d = 2 = (2 + 2m) − 2m` | Correct |
| §4.1 effectivity (sample) | `ℂP²`, `A = −ℓ`; Enriques torsion; `(0,0,2ℓ)` | `ω(−ℓ) = −1 < 0`, empty; torsion area `0`, no nonconstant map; `d_(0,0,2ℓ) = 2(−1+6) = 10`, conics exist | Correct |
| §0.2 potential sign (sample) | `S²`, `v = 1 + q` | `v ∈ U_C ⇔ C ≤ 0`; `κ(v)` is at potential level `−C` ⇔ `0 ≤ −C` ⇔ `C ≤ 0`; at level `C` ⇔ `C ≥ 0` (wrong direction) | Correct |
| §0.2 grading `d_B` | `S²`, `B = {1, x}` | degree-4 generators: `⟨1,1⟩` only, so the piece is `ℚ·q`; degree 3: `0`; with `deg b − 2c₁` instead, `q·1` would land in degree `−4` | Correct |
| §0.2 internal grading ⇔ `c₁ = 0` | `S²`; `T² × T²`; the series `Σ q^(kA + k²A₁)` | `Σ q^k` has components in degrees `0, 4, 8, …`; `T² × T²` has `Λ = Λ⁰`; degrees `2(k c₁(A) + k² c₁(A₁))` form a nonconstant polynomial in `k`; coinciding classes add coefficients `1 + 1 ≠ 0`, so nothing cancels | Correct |
| §0.2 Cauchy product and pairing | `q ⋆ q²`; `(1+q) ⋆ q`; Gram matrix of `T²` | `q³` in degree `12 = 4 + 8`; `q + q²`; the Gram matrix in basis `(1, α, β, pt)` has `det = (+1)·(1·1·(−1)·1) = −1 ≠ 0` | Correct |
| §0.2 closedness and non-closed sum | `S = ℕ`, `F(n) = −n`, `d(n) = n` | each line `ℚ[n]` is closed; the partial sums of `Σ[n]` converge to a limit outside `⊕` | Correct |
| §0.3 finiteness | `ℂP²`; `T² × T²`; Enriques; `3ℓ` | `⌊E⌋ + 1` classes; at most `(2CE+1)^6` points; 2 classes per lattice point; 4 decompositions | Correct |
| §2.1 weighted adjoint | `M̄_(1,1)`; `ξ : M̄_(0,3) → M̄_(1,1)` | `∫^wt [pt]^∨ = 1/2` (unweighted: `1`); `∫ ξ_*1 = ∫_(M̄_(0,3)) 1 = 1`, so `ξ_*1 = 2[pt]^∨` | Correct |
| §2.2 normalisation | `X = pt`, `(1,1,0)` | left side `c/2`, right side `1/2`, so `c = 1 = χ(pt)`; an unweighted left side gives `1/2` | Correct |
| §3.2 Hodge bundle (sample) | irreducible nodal rational; two spheres with 1 node; two elliptic curves with 1 node; two spheres with 2 nodes | `Σg_v + |E| − |V| + 1`: `0+1−1+1 = 1`, `0+1−2+1 = 0`, `2+1−2+1 = 2`, `0+2−2+1 = 1`; residue matching `c₂ = −c₁` cuts `2` to `1` | Correct |
| §3.3 concordance (sample) | the estimate; `g = m = 1`; the `M̄_(1,1)` involution | `Aν = −tP(s − Aν)` gives `‖ν‖ ≤ ‖A⁻¹P‖C‖ν‖²`, so `ν = 0` when `‖ν‖ < 1/(‖A⁻¹P‖C)`; ranks `E = 1`, enlargement `2`, `N_im = 1`, `Ob = 1`; `−1` on `𝔼₁` gives `−1` on `𝔼₁^∨ ⊗ T_xX` | Correct |
| Headline 2 (§3.4) | `ℂP¹`, `T²`, `pt`; genus reduction; `δ = pt` | `2`, `0`, `1` (KM94's `Σ(−1)^i h^(i,0)` gives `1` on `ℂP¹`: source error); `Σ g^(ab) g_(ab) = Σ_a (−1)^(deg Δ_a) = χ`; `−(1/24)∫c₀·pt = −1/24`, matching KM98 (10) | Correct |
| §4.2 covariance | `T²`, `(α, β, 1)` | `I(α,β,1) = ∫αβ = 1`; `I(β,α,1) = ∫βα = −1` | Correct |
| §5.1 relative class (sample) | `M̄_(0,3)(ℂP²,ℓ) → M̄_(0,2)`; smallest non-basic signatures | `π_*1` has degree `−2`, so `0`; `π_*(ev₃^*H) = ℓ·H = 1`; `(0,4)→(0,3)`, `(1,2)→(1,1)`, `(2,1)→(2,0)` are stable | Correct |
| §5.2 fundamental class | `⟨pt, pt, 1⟩_ℓ` | `s = 8 ≠ 10`, so `0`; the wrong `π_*1 = 1` gives `⟨pt,pt⟩_(0,2,ℓ) = 1 ≠ 0` | Correct |
| §5.3 divisor (R02) | `(0,4,ℓ)`; `(0,3,ℓ)` | `1 = 1·1`, non-basic, in scope; `1 = 1·⟨pt,pt⟩_(0,2,ℓ)` is true, but `(0,3)` is basic (KM line 146) and outside §5.3 | Check misplaced |
| §6.1 Casimir (sample) | `T²`; `ℂP²`; `ε(S)` | `g^(αβ) = −1`, `g^(βα) = 1`, so `Σ g^(ab) g_(ab) = 1+1−1−1 = 0` (unsigned: `4`); antidiagonal inverse; one odd transposition gives `−1` | Correct |
| §6.2 splitting (sample) | `ℂP²`, `(0,4,ℓ)`: `pt,pt|H,H`, `pt,H|H,H`; conics | `0 = 1·∫H³ = 0`; `c = 1·∫H² = 1`; degree `12 − 4 − 12 = −4`, `d = 18` | Correct |
| §6.3 genus reduction, first Check | `ξ : M̄_(0,3) → M̄_(1,1)`, `T²` | both sides `χ(X)`; `T²`: `0 = 0` | Correct |
| §6.3 genus reduction, second Check (R01) | `ℂP¹`, `γ = (pt, 1)` | right side: insertion degree `2 + 2m > 2m`, so `0`; left side: `−ξ^*λ₁ = 0`; the Check asserts “a multiple of 1” for a degree-2 class | Check false |
| §6.4 transfers (sample) | `(E,p,q)`; `M̄_(3,2)→M̄_(4,0)`; `M̄_(1,1)²→M̄_(2,0)`; `M̄_(0,3)×M̄_(1,1)→M̄_(1,2)` | `2/1 = 2`; `2·1/1 = 2`; `2·4/4 = 2`; `1·2/2 = 1`; `ξ_*1 = 2[pt]^∨` | Correct |
| §6.5 capped trace (sample) | `(0,4,ℓ)` with `st^*τ_D` | `12 + 2 = 14 ≠ 12`, so `0`; `10 + 2 = 12`, value `1` = §6.2's `c` | Correct |
| §6.6 excess | `M̄_(0,2)(ℂP², ℓ)` over the diagonal | `dim_ℂ = 4`, codimension 2, so expected `2`; actual `2 + 1 = 3` | Correct |
| Headline 3, §7.1 (sample) | `ℂP¹`; Enriques; `T² × T²` | `Ω(pt,pt,pt) = q`, degree `6 − 2 = 4`; `(q^τ−1)(q^τ+1) = 0`; `(q^h−1)x = 1` forces `x_(kh) = x₀` and `x_(−kh) = x₀ + 1`, so no inverse | Correct |
| §7.2 quantum product | `ℂP¹`; `ℂP²`; `T²` duals | `x ⋆ x = q`; `H ⋆ H² = q`, `H² ⋆ H² = qH`, `d_(0,3,2ℓ) = 16 > 12`; `e^α = −β`, `e^β = α` | Correct |
| §8.1 cotangent lines (sample) | `M̄_(0,4)`, `M̄_(0,5)`, `M̄_(1,1)` | `∫ψ̄₁ = 1` (without anchors: `3`); `0 + 2 − 1 = 1`, `ψ̄₁·D = 1 − 1 = 0`, `2!/(1!1!) = 2` (KM98 (11)); `1/24` vs coarse `1/12` | Correct |
| §8.2 `ψ_i` on the map space | `M̄_(0,2)(ℂP¹, ℓ) ≅ ℂP¹ × ℂP¹` | `ψ₁ = −2[pt×ℂP¹] + [Δ]`; `∫ψ₁ ev₂^*pt = −2 + 1 = −1` = the dilaton value `(−2+1)·1` | Correct |
| §8.3 brackets (sample) | `pt`; `(0,5)`, `k = (1,1,0,0,0)` | `⟨τ₁⟩₁ = 1/24`; `2` (truncated product: `0`) | Correct |
| Headline 4, §8.4 (sample) | `pt`, `n = 5`; `ℂP¹` dilaton; `ℂP¹` divisor | string gives `1 + 1 = 2`; `−1` (coefficient `2g−2+n+1` gives `0`); left degree `8 ≠ 6` is `0`, right side `0 + 0` | Correct |
| §8.5 descendant–ancestor (sample) | `ℂP¹`, `(0,3,ℓ)` | `D₁` has real codimension 2 in 6; `⟨τ₁(1) pt pt⟩ = 0` (dilaton factor `2g−2+n = 0`); `⟨τ₁(pt) pt 1⟩ = 1` by string while the ancestor gives `0`; sign agrees with Kock 5.1.9 | Correct |
| §8.6 TRR (sample) | `pt`, `n = 4, 5`; `ℂP²`, `n = 3` | `1 = 1·1`; `1 + 1 + 0·0 = 2`; `τ₁(H) pt pt` has degree `12 ≠ 10`; `⟨τ₁(pt) pt 1⟩ = 1` | Correct |
| §0.4 Čech cup product | as in the previous review | `θ₁ ⌣ θ₂ ≠ 0`, `θ₂ ⌣ θ₁ = −θ₁ ⌣ θ₂` on `T²`; Stacks `ε(n,m,p,n) = 1` (line 2373) | Correct (unchanged) |
| AnalyticStableMaps §0.3 citation (R03) | ASM §0.2 vs §0.3 Checks | §0.2: index `2m − 2mg`, and `6` for `id_(ℂP¹)`; §0.3: circle cutting `0 + 0 + 2 = 2`, an orientation computation | Wrong section |

## Not verifiable

- §3.2's compact-component scalar operator with Hardy traces and Cauchy matching, §3.3's master concordance, §6.5's capped trace formula and §8.5's `[D_i]_(supp,vir)` are this roadmap's own constructions, and the README says no source states them. I read their routes for consistency with the Checks above and with the cited supplier statements, but there is no text to verify them against.
- The #1998 head was read only through its summary paragraph and `scratch/overlaps.md`.
- The board's `sources.toml` records 3 of the 7 cited works (KM94 and the two Stacks chapters). I read the other four this round from legal copies through the sources service: Kontsevich–Manin 1998 on arXiv, Kock on the author's page, Deligne–Mumford on Numdam, Pardon on arXiv. This review edits no manifest.

## Source issues

- **Error** in KM94 at (2.9), p. 6: the source says the coefficient of `I_(1,1,0)(e⁰)` is `Σ_i (−1)^i h^(i,0)(V)`; it should be the topological Euler characteristic `deg c_top(TV)`, which genus reduction at the boundary point forces; affects a stated result; corrected in print at Kontsevich–Manin 1998, equation (9), p. 4.
- **Misprint** in KM94 at 2.4.5, p. 10: the source places the obstruction sheaf `T(1)` on the genus-zero space `M̄_(0,n)(V, β)`; it should be on `M̄_(g,n)(V, 0)`, the space the paragraph treats; affects nothing.
- **Misprint** in Kontsevich–Manin 1998 at §1.1, p. 2: the source writes the stable range as `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`, as Theorem 1.2 on the same page uses; affects nothing.
- **Error** in Kontsevich–Manin 1998 at Lemma 1.5.3, p. 6: the source states the dilaton equation with no exception; it should exclude `(g, n, β) = (1, 0, 0)`, where its own (9) gives `⟨τ₁1⟩_(1,0) = χ(V)/24` against a right side with factor `0`; affects a stated result.
- **Gap** in Kock, *Notes on psi classes*, at (5.1.7.2), p. 51: the source states the forgetful comparison for stable maps on genus-zero spaces and leaves an editorial marker on other genera; it should state the genus in which it is proved; affects nothing.
