# Review of GromovWittenTheory (pull request #990 at 32ade49)

**Verdict:** needs changes

:robot: Independent AI review, full pass. The head is the one the previous review read (0 lines changed in the folder). There are two findings, both P3 and neither in the folder's text: the branch still builds against a Tau Ceti pin that lacks six of the files the contracts name, and pull request #1998 still writes the same folder with no stated order. Both carry over unrepaired from the previous review. The full read found nothing new. Every one of the 15 sampled targets was checked: its locators against the source text (KM94, Pardon, KM98, Kock; Deligne–Mumford and the two Stacks chapters spot-checked) and its supplier sections at their current heads, and its values were recomputed (table below). The gate, the dependency check and the elaboration pass on an independent rerun.

## R01 (P3) — The README and the docstring read Tau Ceti at `2fd255d`, but the branch still pins `a91d3aa`

This is the previous review's R01, and the R01/R03 of the reviews before it. It is not repaired.

**Location:** `README.md:66`, “### From Tau Ceti (commit 2fd255d)”, with the contracts under it (`README.md:68–75`). `Suggested.lean:31–47` (“The pinned Tau Ceti has the compact nodal domain as the gluing quotient `GluedCurve`…”). `lake-manifest.json:8`.

**Claim:** The branch manifest pins Tau Ceti `a91d3aaf` (Mathlib `6b7abb3c`), while main pins Tau Ceti `2fd255d9` (Mathlib `1b1ccf4b`). At the branch pin, the declarations the contracts and the docstring rely on do not exist. At main's pin they all exist (checked one by one, see Verified sound). The contracts are right about main's pin and wrong about the branch's own.

**Witness:** `lake-manifest.json:8` reads `a91d3aafa8cd…`. Absent at that pin, present at `2fd255d`: `NovikovSeries/Basic.lean`, `NovikovModule/Basic.lean`, `Cech/Colimit.lean`, `AlmostComplex/Basic.lean`, `NodalGluing/Basic.lean`, `SmoothSingular/Integral.lean`. `git merge-base --is-ancestor origin/main HEAD` fails.

**Repair:** Merge or rebase the branch onto origin/main. No line of the folder changes. `Suggested.lean` imports only `Mathlib`, so the build is unaffected. Tested: at main's pin every Tau Ceti name in `README.md:68–75` resolves.

## R02 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

This is the previous review's R02, and the R02/R04 of the reviews before it. It is not repaired.

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (README.md, Suggested.lean, metadata.toml) and this pull request's description.

**Claim:** #1998 (head `c41b144`) adds a different roadmap under the same folder name, and the two heads conflict in all three files. Its README develops Gromov–Witten theory for smooth projective varieties from the Behrend–Fantechi class, valued in the rational numerical Chow ring. This roadmap works on closed symplectic manifolds through analytic stable maps and implicit atlases. The objects differ, so this is a naming and order conflict, not a double owner. Neither description says which pull request keeps the name.

**Witness:** `scratch/overlaps.md`: “#990 and #1998 conflict in `TauCetiRoadmap/GromovWittenTheory/README.md`, `…/Suggested.lean`, `…/metadata.toml`”. `roadmaps list` shows both as new roadmaps named GromovWittenTheory. #1998's README title is “algebraic Gromov–Witten theory and quantum cohomology”.

**Repair:** State in this pull request's description that this roadmap keeps the folder `GromovWittenTheory`, and that #1998 takes another folder name (for example `AlgebraicGromovWittenTheory`) before either merges. HamiltonianFloerOperations on main already cites this roadmap under that name (`HamiltonianFloerOperations/README.md:17`, “GromovWittenTheory G0/G5–G7”), and the labels G0–G8 it uses are this README's layer labels (`README.md:144–680`).

## Previous findings

- R01 (Tau Ceti pin): not repaired. `lake-manifest.json:8` still reads `a91d3aaf…`, and `README.md:66` still reads “From Tau Ceti (commit 2fd255d)”. It is R01 above.
- R02 (#1998 folder conflict): not repaired. #1998 is still open at `c41b144`, and the description in `scratch/pull-request.md` still names #987, #974 and other suppliers but says nothing about #1998. It is R02 above.
- Settled findings: no repair report marks either finding “not actionable in this package”, and no commit message on the branch says so. Neither is a re-raise of a settled finding.

## Verified sound

### Gate, dependency check, build and Lean form

- **Gate rerun** at `32ade49` (`--base origin/main`): every counter `0`, `OK`, exit 0. The worker's gate at this head also lists `build=0`.
- **Dependency check** (`--movable`, board merge order, main content): `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The merge order lists GromovWittenTheory at line 307, after ImplicitAtlases (214), AnalyticStableMaps (215) and TopologicalSheafCohomology (306). Every other supplier is on main: ComplexCurveModuli, Orbifolds, CharacteristicClasses, AlgebraicTopology, GeometricTopology, DifferentialGeometry, ComplexKahlerGeometry, PseudoholomorphicCurveAnalysis and PDE. None of the roadmaps the brief forbids as suppliers occurs in the README.
- **Elaboration:** `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` exits 0 with no output (26 s).
- **Form:** `Suggested.lean` has 66 lines: `import Mathlib` alone, the module docstring and the namespace `TauCetiRoadmap.GromovWittenTheory`, with no declaration, no `set_option` and no `lemma`. With no declaration, there is no `#check @name` comparison to run, no section-variable loss to look for and nothing to probe for padding.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GromovWittenTheory'` is empty.

### Headline theorems

The Summary (`README.md:3`) and the docstring name four headlines:

1. The operations `I_(g,n,A)` and the eight Kontsevich–Manin properties.
2. `I_(1,1,0)(1) = χ(X)·1`.
3. The unital CohFT over `Λ_ω` and the associative quantum product.
4. String, dilaton, divisor and the genus-zero ancestor TRR.

Each needs at least one of the following, and none is at the pins: the moduli of stable pseudoholomorphic maps with its virtual functional; `M̄_(g,n)` with its weighted pairing; Chern classes; the Čech cup product. At Tau Ceti `2fd255d`:

- `AlgebraicGeometry/Curves/StableMaps/` has algebraic prestable maps over a base and their dual graphs, but no moduli space and nothing pseudoholomorphic.
- `Geometry/Symplectic/Floer/PeriodGroup.lean` takes the Chern number as an input homomorphism and defines no Chern class.
- `Topology/Sheaves/Cech/` has no product.

Mathlib `1b1ccf4` has no Chern classes. The docstring names each headline with the missing carrier, and nothing is stated as a stand-in. No headline is statable but absent.

### Sources read at the locators (every sampled target with an external locator)

| Locator | Source line, page | Checked against the README |
|---|---|---|
| KM94 Definition 2.2, 2.2.0–2.2.2, (2.2) | lines 128–142, p. 4 | domain `n + 2g − 3 ≥ 0`; effectivity; covariance on the superspace; shift `2(K_V·β) + (2g−2)dim_ℂV` (§4.1–§4.3, Conventions) |
| KM94 (2.3)–(2.4) | lines 143–158, p. 4 | basic classes; codimension; `⟨I⟩` (§5.1) |
| KM94 2.2.3, (2.6)–(2.7) | lines 176–185, p. 5 | fundamental class for non-basic classes; three-point exception (§5.2) |
| KM94 2.2.4 | lines 186–196, p. 5 | numerical form for non-basic codimension-zero classes, then the general `π_(n*)` form (§5.3) |
| KM94 2.2.5, (2.8)–(2.10), genus ≥ 2 | lines 197–219, pp. 5–6 | `(2.8)` ends p. 5; `(2.9)` coefficient `Σ(−1)^i h^(i,0)`; `(2.10)` with `e² = c₁(𝒪(1))`; vanishing unless `dim_ℂ V ≤ 3` (§3.4, §5.4) |
| KM94 2.2.6, (2.11) | lines 220–241, p. 6 | `n_i + 2g_i − 2 ≥ 0`, `ε(S)` the sign of the odd permutation, `g^(ab)` placement (§6.1–§6.2) |
| KM94 2.2.7, (2.12) | lines 242–246, p. 6 | no class decomposition, `g^(ab)` on the last two insertions (§6.3) |
| KM94 2.4.5 | lines 408–422, p. 10 | `E_(g,n) = R¹π_*𝒪`, pulled back from `(0,3)`, `(1,1)`, `(g,0)`; the formula `p_(1*)(c_G(E ⊠ TV) ∧ p_2^*(…))`, offered there as a definition (§3.4, §5.4) |
| KM94 Theorem-Definition 4.5 | line 816, p. 19 | quantum ring from the axioms (§7.2) |
| KM94 Definition 6.1, 6.1.1–6.1.3 | lines 1455–1473, p. 31 | coefficient field `K`, even non-degenerate pairing, even correlators, no unit axiom (§7.1) |
| Pardon Theorem 9.2.10, Definition 9.3.1, Lemma 9.3.2 | lines 4353–4366, p. 100 | `2g + n > 2`; pushforward to `H_•(M̄_(g,n) × X^n; ℚ)`; independence of `J` (§1.2, §2.3) |
| Pardon §5 introduction | lines 1690–1700, p. 40 | the fiber-product formula named as desired, not proved (§6.6) |
| Pardon remark | lines 4085–4090, p. 95 | Kontsevich–Manin axioms need further properties of the virtual class (§6.6) |
| KM98 §1.1 (1)–(2), Theorem 1.2 (4) | lines 52–96, p. 2 | descendant and generalized correlators; descendant–ancestor comparison (§8.3, §8.5) |
| KM98 Corollary 1.3 (4a), proof sketch | lines 99–118, p. 3 | three-point recursion; the sketch defers details (§8.5, §8.6) |
| KM98 (11), Lemma 1.5.2 (12) | lines 219, 238–244, p. 5 | `(Σd_i)!/∏d_i!`; divisor with descendants (§8.1, §8.4) |
| KM98 Lemma 1.5.3 | lines 279–281, p. 6 | dilaton (§8.4) |
| Kock 1.2.6, 1.3.1 | lines 245, 310, pp. 10, 12 | restriction to boundary divisors; forgetful comparison (§8.1) |
| Kock 1.4.2, 1.5.1, 1.5.2, 1.6.2 | lines 368, 416, 467, 501, pp. 14–16 | string; genus-zero integrals; `ψ̄₁` by boundary divisors; dilaton with the `⟨τ₁⟩₁` exception (§8.1, §8.4) |
| Kock (5.1.7.1)–(5.1.7.3) | lines 1885, 1899–1902, pp. 50–51 | stable-map analogues, stated on `M̄_(0,n)(X, β)` (§8.2, §8.4) |
| Kock 5.1.8, 5.1.9, 5.2.1 | lines 1904–1917, 2009–2021, pp. 51, 53 | `ψ₁ = (p₁\|p₂,p₃)`; `ε^*ψ₁ = ψ₁ − E₁` with `p₁` alone on a twig (positive degree forced by stability); splitting lemma (§8.5, §8.6) |
| Deligne–Mumford §1 b), c) | lines 98–104, p. 77 | residue-matched differentials and duality, stable curves of genus ≥ 2 (Definition 1.1, line 76) (§3.2) |
| stacks-cohomology (25.3.2), Tag 07MB | lines 2361–2377, pp. 50–51 | Section 25 opens with Tag 01FP at line 2103, p. 46 (§0.4) |
| stacks-curves Lemmas 18.3, 18.4, 19.7 | lines 1677, 1691, 1931, pp. 38, 39, 44 | Tags 0CE3, 0CE4, 0C4D (§3.2) |

Page numbers are read from the `=== page N ===` markers of the cached texts. §1.1, §3.1, §4.2 (beyond 2.2.1) and the constructions of §2.1, §6.4–§6.6 and §8.5 that the README declares its own carry no external locator. For these, the supplier sections were checked instead (below).

### Supplier sections resolved (at the open heads the brief gives, and on main)

- **AnalyticStableMaps at `41557ba`:** §0.1, §0.2, §1.1, §1.2, §2.1, §3.7, §4.1, §4.3, §6.2, §6.3, §7.3, §8.1, §9.1, §9.2, §10.1, §10.2, §11.1, §11.2, §12.1, §12.2 and §13.1–§13.4 all exist.
  - §9.2's third Check gives the `(1,1)` functional over a point as one half of the fundamental-class pairing, as §2.2's last Check uses.
  - §13.4 assigns the operations, axioms, descendants and the curve-class, Chern and area specialization to this roadmap, and its Downstream consumers paragraph lists this roadmap.
- **ImplicitAtlases at `81fc759`:** §0.7, §1.1, §3.1, §4.2, §4.3, §5.2–§5.4, §5.6, §6.4, §6.5 and §7.1–§7.4 all exist. It reads Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the same pins as this README's contracts. Its Downstream consumers paragraph names this roadmap as a consumer of V0–V6 and §7.3.
- **ComplexCurveModuli (main):**
  - D7 item 1: bridge `xv = t₁t₂`, `forgetAuxiliarySet`, order coherence.
  - D7 item 2: `markedPointCollisionBubbleCharts`.
  - D7 item 3: clutching with the permanent node and `T_*⊗T_**`.
  - D8: weighted pairing; `M̄_(1,1)` generic and boundary isotropy of order 2; `M̄_(2,0)` generic order 2.
- **Orbifolds (main):** O5 item 1 (`|G|⁻¹∫_U` with the full ineffective kernel), item 4 (`(1/k)[|Γ|]`, perfect pairings) and item 5 (Thom classes, Gysin maps).
- **CharacteristicClasses (main):**
  - C1.2b (`cechSingularCWTypeComparison`, line 640) defines no Čech product, so §0.4 owns the product and its multiplicativity.
  - C2 has items 1 and 3; C3 has item 2.
- **AlgebraicTopology (main):**
  - Stage 5 item 1: Künneth over a field through the cross product.
  - Stage 6 item 1: universal coefficients over a PID.
  - Stage 6 item 2: front/back-face cups with signs.
  - Stage 7 item 1: Euler–Poincaré.
  - Stage 8 item 7: finite CW type of compact manifolds, via GeometricTopology item 1.
- **Other suppliers on main:** TopologicalSheafCohomology TS1.1 (§1.1) and TS1.2 (§1.2); DifferentialGeometry 8.3–8.5 (`deRhamHom`, `deRhamEquiv`); ComplexKahlerGeometry K5; PseudoholomorphicCurveAnalysis PH1, §3.2, §6.1, §6.3; PDE §1.6 (A6); GeometricTopology's smoothing-and-triangulation comparison.

### Library declarations opened

**Tau Ceti at `2fd255d` (main's pin):**

- `TauCeti.NovikovSeries` (`NovikovSeries/Basic.lean:92`), with `finite_setOf_add_eq` (:219) and `ofFinsupp_surjective_iff` (:697).
- `Multiplication.lean`: `isUnit_single` (:476), `ofAddMonoidAlgebra` (:519) and `ofAddMonoidAlgebra_injective` (:547).
- `TopologicalRing.lean`: `nonnegSubring` (:245).
- `Functoriality.lean`: `mapRingHom` (:184).
- `Grading.lean`: `gradeBy` (:92), `gradeBy_eq_bot` (:106), `gradeBy_eq_top` (:111) and `gradeBy.gradedMonoid` (:165).
- `NovikovModule`, across `Basic`, `Topology`, `Bilinear`, `Grading` and `TensorProduct`: `coordinatesLinearEquiv`, `basis`, `potentialFiltration`, `isClosed_potentialFiltration`, `tendsto_nhds_iff` (:260), the `T2Space` (:265) and `CompleteSpace` (:321) instances, `isLocallyConstant_apply_val` (:313) and `denseRange_ofFinsupp` (:352), all under `[Ring R]` with no hypothesis on `S` or `F`. Also `kernelProduct`, `novikovKernelProduct`, `gradeBy` (:55, `[Semiring R]`), `mem_gradeBy_iff_coordinates` (:123), `smul_mem_gradeBy` (:143) and `kernelProduct_mem_gradeBy` (:209). No `iSupIndep` or closedness statement for `NovikovModule.gradeBy` exists anywhere under `NovikovModule/`, as the README says.
- Topology and algebraic topology: `TauCeti.Topology.cechCohomology` (`Cech/Colimit.lean:70`), `cechCohomologyZeroIso` (:84), `TopCat.Hom.cechComplexPullback` (`Cech/Pullback.lean:53`) and `singularCup` (`Cohomology/Cup.lean:203`).
- Symplectic geometry: `SmoothTwoForm.IsSymplectic` (`TwoForm.lean:115`), `Tames` (:174), `Tames.stdComplexLineEnergyDensity_pos` (`Energy.lean:170`), `stdComplexLineEnergy` (:402), `IsPseudoholomorphic` (`JHolomorphic.lean:101`) and `SmoothAlmostComplexStructure` (`AlmostComplex/Basic.lean:71`).
- Curves and smooth chains: `FlagPairData` (`NodalGluing/Basic.lean:149`), `SmoothSimplex` (`SmoothSingular/Basic.lean:121`), `smoothSingularSubcomplex` (:77) and `SmoothSimplex.integral` (`Integral.lean:86`).

**Mathlib at both pins (`6b7abb3c` and `1b1ccf4`):** `IsLocallyConstant.isClosed_fiber` (`Topology/LocallyConstant/Basic.lean:70`), `isClosed_biInter` (`Topology/Basic.lean:162`) and `Algebra.TensorProduct.basis` (`RingTheory/TensorProduct/Free.lean:65`).

### Duplication and ownership

- **Tau Ceti's Floer coefficients.** Tau Ceti at `2fd255d` has `Geometry/Symplectic/Floer/` with `Floer.NovikovRing` on the period group `Γ` with potential `−area`, and `Floer.coefficientComparison : NovikovSeries R S ω →+* NovikovSeries R Γ (−Ω)`. The README's `Λ_ω = NovikovSeries ℚ H₂(X; ℤ) ω` is the source ring of that comparison, not a restatement of it. The comparison belongs to HamiltonianFloerOperations' H1 (Downstream consumers), not to this roadmap. Nothing in §0.2 restates a pinned theorem. The pinned `NovikovSeries.mem_iSup_gradeBy_iff` (homogeneous pieces span the finite series when periods are bounded on fibres) concerns a different question from §0.2's internal-direct-sum criterion.
- **Čech cup product.** `roadmaps grep` for a Čech cup product over main and every open head finds only this README and CrystallineCohomology (#857, a crystalline Čech product, not constant coefficients on a topological space). TopologicalSheafCohomology and CharacteristicClasses on main state no Čech product. §0.4 has one owner.
- **Hodge bundle and ψ-classes on the analytic carrier.** The previous review's search (`Hodge bundle` over main and the open heads) stands. The ψ-classes and descendant equations belong to this roadmap by AnalyticStableMaps §13.4.
- **Closest open roadmaps by vocabulary.** FukayaTheory (`rev/1045`, line 34) lists closed Gromov–Witten classes as a separate theory it neither supplies nor consumes. DGFloer, DGFloerPartII and MorseNovikov (`rev/1161`) own nothing here. #1998 is algebraic (R02).
- **`scratch/overlaps.md`.** It lists no dropped id and no id that only an open revision defines. This pull request is new and drops nothing.
- **Other open pull requests.** Ownership against open pull requests outside the checkouts the brief gives was checked only through `roadmaps grep`, and #1998 only through `roadmaps show` (its README).

### Shape

- The 34 targets (§0.1–§8.6) each carry a `*Needs:*` line and at least 3 Checks (minimum 3, maximum 10 in §0.2).
- Every layer ends with `### Examples` and `### Dependencies`, under layer labels G0–G8.
- Conventions, supplier contracts, Downstream consumers and References are present.
- There are no LaTeX delimiters, no process words, no pull-request numbers and no target-numbering tables.

### Adversarial pass

Coefficients ℚ; `m = dim_ℂ X`; `s = Σ deg γ_i`; `t = 6g − 6 + 2n`; `d = d_(g,n,A)`. The rows marked “new” use instances that are not in the README.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions: `d`, degree, KM (2.2) | point, `(2,0,0)`; lines in `ℂP³` (new), `(0,3,ℓ)` | `d = 2(3) = 6 = dim_ℝ M̄_(2,0)`; `m = 3`, `c₁(ℓ) = 4`: `d = 2(0+4+3) = 14`, `r = s − 6 − 8`, `(pt,pt,H)`: `14 − 14 = 0`; KM: `14 + 2(−4) + (−2)·3 = 0` | Correct |
| §0.1 effectivity | `ℂP²`; `T²×T²` (areas 1, √2); Enriques | `ω(dℓ) = d`; the diagonal of `E×E` has area `1 + √2` and pairs to 1 with `α₁β₂`; torsion `ℤ/2` of area 0 | Correct |
| §0.2 internal direct sum iff `c₁ = 0` | `ℂP²`, `A = A₁ = ℓ` (new); `T²×T²` | `Σ q^((k+k²)ℓ)`: degrees `6(k+k²) = 0, 12, 36, 72, …`, areas `k + k² → ∞`, so not a finite homogeneous sum; `c₁ = 0` gives `Λ_ω = Λ_ω^0` | Correct |
| §0.2 grading `d_B`, potential sign | `S²`, `B = {1, x}`; `v = 1 + q` | degree 4: `⟨1,1⟩` only (`2 + 4k = 4` has no integer solution); degree 6: `q·x`; `v ∈ U_C ⇔ C ≤ 0 ⇔` level `−C`; at level `C` it would be `C ≥ 0` | Correct |
| §0.2 perfect pairing | `T²`, basis `1, α, β, pt` | Gram matrix with permutation `(1 pt)(α β)` of sign `+1` and entry product `1·1·(−1)·1`: `det = −1` | Correct |
| §0.3 finiteness | `ℂP²`, `E`; Enriques; `A = 3ℓ` | `⌊E⌋ + 1` classes; 2 classes per lattice point; 4 decompositions | Correct |
| §0.4 cup product | `T²`; truncated product; Warsaw circle; two points | `θ₁⌣θ₂ = θ⊠θ ≠ 0`, `θ₁⌣θ₁ = 0`; truncated `θ⊠θ = 0`, which is excluded; `Ȟ¹ = ℚ` against singular `0`; `(f⌣c)₀₁ = 1_u` against `1_v` reversed | Correct |
| §1.1 stable range | `ℂP¹ (0,0,ℓ)`; `(0,2,0)`; `(1,1,0)` | `d = 2(−2+2) = 0`, trivial automorphism group; `ℂ^*` unstable, `d = 2m − 2`; `d = 2 = (2 + 2m) − 2m` | Correct |
| §1.2 diagrams | lines `(0,3,ℓ)` in `ℂP²`; `M̄_(1,1) × X` | `d = 10`, `st` to a point; isotropy `ℤ/2`, `ℤ/4` at `j = 1728` (CCM D8) | Correct |
| §2.1 weighted adjoint | `M̄_(1,1)`; `M̄_(0,4) → M̄_(0,3)`; `ξ` | `∫^wt [pt]^∨ = 1/2` (unweighted 1); `π_*1` has degree −2, so 0; `ξ_*1 = c[pt]^∨` with `c/2 = 1`, so `c = 2` | Correct |
| §2.2 `I_(g,n,A)` | `ℂP¹ (0,3,0)`; lines `(0,3,ℓ)`, `(0,4,ℓ)`; point `(1,1,0)` | `t − d = 2(g−1)m − 2c₁(A)`; `r = s − 2`, `I(pt,1,1) = 1`; `r = 0`, value 1; `r = 2 = t` (with `+2c₁`, 14 > t); `Φ = 1/2 = c/2`, so `c = 1` | Correct |
| §2.3 endpoint equality | `J`, `J′` on `ℂP²`; `x`, `x²`; `z`, `z²` | `1 = 1`; classes `1, 0` and `1, 2`, no witness | Correct |
| §3.1 weights | `M̄_(1,1) × X`; double cover of a line | `1/2` against `1/2` cancels; omitting the kernel gives `χ/2` or `2χ`; numerical weight `1/2` | Correct |
| §3.2 Hodge bundle | nodal cubic; two spheres at two nodes; bridge forgetting | `ℂ·dz/z`; `c₂ = −c₁`, dimension 1 (2 if unmatched); restriction `c₁ dz/z`; extension by zero unmatched | Correct |
| §3.3 obstruction model | `g = 1`, `m = 1`, rank-1 thickening | thickened real dimension `2 + 4 = 6`, `Z` real dimension 4, `ν_Z` complex rank 1 `= N_im`, `Ob` rank 1, involution acts by `−1` | Correct |
| §3.4 headline 2 | `ℂP¹`; `T²`; K3 (new); `ℂP²` with `H` (new) | `χ = 2, 0, 24`; KM (2.9) gives `1, 1, 2` (source error); `⟨I_(1,1,0)(H)⟩ = −3/24 = −1/8`; `λ₁ = (1/12)[pt]^∨` since `(1/12)(1/2) = 1/24` | Correct |
| §3.4 genus ≥ 2 | `ℂP⁴`, `(2,0,0)` (new) | `2(g−1)m = 8 > 6` | Correct |
| §4.1 effectivity | `−ℓ`; torsion; conics `(0,0,2ℓ)` | negative area; area 0; `Eff ≠ {0}` | Correct |
| §4.2 covariance | `T²`, `(0,3,0)`, `α, β, 1` | `I(α,β,1) = 1`, `I(β,α,1) = −1 = ε·σ^*1` | Correct |
| §4.3 grading | `(0,3,0)`; lines `(0,4,ℓ)`; `(1,1,0)` | `s − 2m`; `s − 10`, top at `s = 12`; `deg γ` | Correct |
| §5.1 relative class | lines `(0,3,ℓ) → (0,2,ℓ)` | `π_*1` has degree −2, so 0; `π_*(ev₃^*H) = ℓ·H = 1` | Correct |
| §5.2 fundamental class | `ℂP²`; `ℂP¹ (0,4,0)` | `⟨pt,pt,1⟩_ℓ = 0` (`s = 8 ≠ 10`); `⟨H,H,1⟩_0 = 1`; `(∫γ₁γ₂γ₃)·1` | Correct |
| §5.3 divisor | lines `(0,4,ℓ)`; conics `(0,6,2ℓ)`; `A = 0` | `1·1 = 1` at degree 12; `2·1 = 2` at degrees 22 and 20, codimension `6 = 2(3)` and `4 = 2(2)`; with factor 1 the value is 1; `⟨0,δ⟩ = 0` | Correct |
| §5.4 mapping to a point | `T²×ℂP³ (2,2,0)`; `ℂP² (1,2,0)`; quintic `(2,0,0)` (new) | degree `2 + 8 = 10 = dim M̄_(2,2)`, but the Hodge factor of complex degree 5 lies on `M̄_(2,0)` (dimension 3): 0; `I(H,H) = 0`, `I(H,1) = −3π^*λ₁`; `m = 3`: `6 = 6`, no claim (KM98 line 213 agrees) | Correct |
| §6.1 Casimir | `T²`; `ℂP²` | `g^(αβ) = −1`, `g^(βα) = 1`; `Σ g^(ab)g_(ab) = 1+1−1−1 = 0 = χ`; antidiagonal | Correct |
| §6.2 splitting sign | `T²`, `(0,4,0)`, `(α,β,1,1)`, `S₁ = {2,3}` (new) | left side `∫αβ = 1`; right side `ε(S) = −1` times `g^(αβ)(∫βα)(∫βα) = (−1)(−1)(−1) = −1`, giving 1; without `ε` the value is `−1` | Correct |
| §6.2 lines | `(pt,pt\|H,H)`; `(pt,H\|H,H)`; conics | `⟨pt,pt,H⟩·∫H³ = 0 = 0`; `g^(pt,1) = 1`, so `c = 1`; degree `−4` | Correct |
| §6.3 genus reduction | `ξ: M̄_(0,3) → M̄_(1,1)`; `ξ: M̄_(0,4) → M̄_(1,2)` | `Σ g^(ab)g_(ab) = χ`; right side vanishes (insertion degree `2m + 2`), left side `ξ^*λ₁ = 0` (residue trivializes); the `ψ̄` model gives `−1` | Correct |
| §6.4 transfer degree | `ξ: M̄_(1,2) → M̄_(2,0)`; `M̄_(3,2) → M̄_(4,0)`; `M̄_(1,1)² → M̄_(2,0)`; `M̄_(0,3)² → M̄_(0,4)` (new) | `1·2/1`; `2·1/1`; `2·4/4`; `1·1/1 = 1` (`n = 4 ≠ 0`) | Correct |
| §6.5 capped trace | lines, `τ_D` at `{12\|34}` | `(pt,pt,H,H)`: degree 14 ≠ 12, so 0; `(pt,H,H,H)`: 12, value 1 from the stratum with marks 3, 4 on a constant component at `H₃∩H₄` | Correct |
| §6.6 node matching | `M̄_(0,2)(ℂP², ℓ)` | `d = 8`; diagonal fibre of complex dimension 3 against expected 2; product weight `1·1/2` | Correct |
| §7.1 headline 3, CohFT | `ℂP¹`; Enriques; `T²×T²` | `Ω_(0,3)(pt,pt,pt) = q·1` of degree `0 + 4 = 6 − 2`; `(q^τ−1)(q^τ+1) = 0`; `1 − q^h` has no inverse (infinitely many coefficients at area 0) | Correct |
| §7.2 headline 3, quantum product | `ℂP¹`; `ℂP²`; `T²` (new: `α⋆β`) | `x⋆x = q`; `H⋆H² = q`, `H²⋆H² = qH`, `d_(0,3,2ℓ) = 16 > 12`; `α⋆β = (∫αβ)e^(1) = pt`, `β⋆α = −pt = (−1)^(1·1)α⋆β`; left duals `e^α = −β` | Correct |
| §8.1 `ψ̄` | `M̄_(0,4)`; `M̄_(0,5)`; `M̄_(0,6)` (new) | `∫ψ̄₁ = 1` (3 without anchors); `0 + 2 − 1 = 1`, `ψ̄₁·D = 0`; `∫ψ̄₁³ = 3!/3! = 1`, `∫ψ̄₁ψ̄₂ψ̄₃ = 3! = 6` | Correct |
| §8.2 `ψ_i` | `M̄_(0,2)(ℂP¹,ℓ)`; `M̄_(0,1)(ℂP¹,ℓ)` (new) | `ψ₁ = −2[pt×ℂP¹] + [Δ]`, pairing `−2 + 1 = −1`; `ψ₁ = ev₁^*c₁(T^*) = −2pt` | Correct |
| §8.3 brackets | point; `ℂP¹`; `M̄_(0,5)` ancestors | `1, 1, 1/24`; `⟨pt,pt⟩_(0,ℓ) = 1` at `d = 4`; `∫ψ̄₁ψ̄₂ = 2` (truncated product: 0) | Correct |
| §8.4 headline 4 | point `n = 5`; `ℂP¹` divisor with descendant (new) | string 1, 2; dilaton 1; `⟨τ₀(pt)τ₁(1)⟩_(0,ℓ)`: divisor `1·⟨τ₁(1)⟩_(0,1,ℓ) + ⟨τ₀(pt)⟩ = 1·(−2) + 1 = −1`, dilaton `(−2+1)·1 = −1`; `⟨τ₁(1)⟩_(0,1,ℓ) = −2` directly and by dilaton `(−2)·⟨⟩_(0,0,ℓ)` | Correct |
| §8.5 correction | `ℂP¹ (0,3,ℓ)` | `D₁` real codimension 2 in 6; `⟨τ₁(1)pt pt⟩ = 0` (factor 0); `⟨τ₁(pt) pt 1⟩ = 1`, entirely from `[D₁]` | Correct |
| §8.6 headline 4, TRR | point `n = 4`, `n = 5`; point `n = 4`, `k = 1` (new) | `1 = ∫ψ̄₁`; `1 + 1 + 0·0 = 2`; `⟨τ̄₂τ₀³⟩` (degree 4 > 2) is 0 and the right side `⟨τ̄₁τ₀τ₀⟩⟨τ₀³⟩ = 0` | Correct |

## Not verifiable

- The board's `sources.toml` records 4 of the 7 cited works: KM94, Pardon and the two Stacks chapters. KM98 (arXiv), Kock (author's page) and Deligne–Mumford (Numdam) were read this round through the sources service from those legal copies, without recording them, since this review edits no manifest. Recording them is the worker's manifest edit, not a change to the folder.
- #1998 was read only through `roadmaps show` (its README). Its Suggested.lean is not among the checkouts the brief gives.

## Source issues

- **Error** in KM94 at 2.2.5, (2.9), p. 6: the source takes the coefficient of `I_(1,1,0)(e₀)` to be the alternating sum of the `h^(i,0)`; it should be the topological Euler characteristic (2 for `ℂP¹`, 24 for a K3 surface, where the source gives 1 and 2); affects a stated result.
- **Misprint** in KM94 at 2.2.5, p. 6: the source defers the description of the class `X(V)` in (2.10) to 2.4.2, which is the definition of convexity; it should point to 2.4.5, p. 10, the mapping-to-a-point construction; affects nothing.
- **Misprint** in KM98 at §1.1, p. 2: the source writes the stable range with `− n`; it should be `2g − 2 + n > 0`; affects nothing.
- **Gap** in KM98 at Lemma 1.5.3, p. 6: the source states the dilaton equation with no exception; it should exclude `(g, n, β) = (1, 0, 0)`, where the left side is `χ(V)/24` and the right side involves an unstable space; affects a stated result.
- **Gap** in Kock at (5.1.7.2), p. 51: the source states the stable-map comparison on genus-zero spaces and leaves an editorial note asking for the statement in every genus; it should state its genus range or prove the higher-genus case; affects nothing.
