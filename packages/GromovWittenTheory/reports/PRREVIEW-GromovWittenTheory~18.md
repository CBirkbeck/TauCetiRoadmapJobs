# Review of GromovWittenTheory (pull request #990 at c3c6033)

**Verdict:** accepted

:robot: Independent AI review, incremental pass (0 lines changed in the folder since `32ade49`). The new head merges main into the branch. That merge repairs R01: the branch now pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, the commits the contracts name. R02 is repaired in the pull-request description: its new "Folder name" paragraph states that this roadmap keeps `GromovWittenTheory` and that #1998 takes another folder name. No finding remains. On this head the gate, the dependency check and the elaboration all pass.

## Previous findings

- R01 — repaired: `lake-manifest.json` now pins Tau Ceti `2fd255d997f4…` and Mathlib `1b1ccf4b088b…`, matching “### From Tau Ceti (commit 2fd255d)” (`README.md:66`). `git merge-base --is-ancestor origin/main HEAD` succeeds, with main at `641eaf3`.
- R02 — repaired: the description now says that this roadmap “keeps the folder `GromovWittenTheory`: HamiltonianFloerOperations on main already cites it under that name … #1998 takes another folder name before either merges.” This is the order the overlap rule asks for.
- No repair report marks either finding “not actionable in this package”, so nothing is re-raised.

## Verified sound

### R01 repair: the contracts read at the branch's own pin

The Tau Ceti checkout under `.lake/packages/TauCeti` is at `2fd255d` and Mathlib is at `1b1ccf4`. The six files that were missing at the old pin `a91d3aa` now exist:

- `RingTheory/NovikovSeries/Basic.lean`
- `RingTheory/NovikovModule/Basic.lean`
- `Topology/Sheaves/Cech/Colimit.lean`
- `Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`
- `AlgebraicGeometry/Curves/NodalGluing/Basic.lean`
- `Geometry/Manifold/SmoothSingular/Integral.lean`

I reopened the following contract names (`README.md:68–75`) at this pin. Each sits at the line the previous report gives:

- `TauCeti.NovikovSeries` (`NovikovSeries/Basic.lean:92`) and `finite_setOf_add_eq` (:219)
- `NovikovSeries.gradeBy_eq_bot` (`Grading.lean:106`)
- `TauCeti.NovikovModule` (`NovikovModule/Basic.lean:53`)
- `TauCeti.Topology.cechCohomology` (`Cech/Colimit.lean:70`, the colimit over point-neighbourhood covers) and `cechCohomologyZeroIso` (:84)
- `TopCat.singularCup` (`Cohomology/Cup.lean:203`)
- `SmoothTwoForm.IsSymplectic` (`TwoForm.lean:115`)
- `IsPseudoholomorphic` (`JHolomorphic.lean:101`)
- `SmoothAlmostComplexStructure` (`AlmostComplex/Basic.lean:71`)
- `FlagPairData` (`NodalGluing/Basic.lean:149`)
- `SmoothSimplex.integral` (`SmoothSingular/Integral.lean:86`)

The README has no `blob/<sha>` permalinks that the pin change could leave stale. The only pin mention is `README.md:66`.

### R02 repair: the description's claims checked

- **HamiltonianFloerOperations.** On main, `HamiltonianFloerOperations/README.md:3` and `:17` cite “GromovWittenTheory G7” and “GromovWittenTheory G0/G5–G7”. These are this README's layer labels: the headings at `README.md:144–680` carry G0–G8.
- **Other citers on main.** SymplecticFieldTheory (`:83`, closed stable-map compactification), HeegaardFloer (`:4850`) and MorseNovikov (`:1415`, the Novikov layer) cite the symplectic roadmap under the same folder name.
- **#1998.** `roadmaps list` shows #1998 still open at `c41b144` under the same folder name. `scratch/overlaps.md` still lists the three-file conflict. The order is now stated, and the rename is #1998's edit.

### Gate, dependency check, build and Lean form

- **Gate**, rerun at `c3c6033` (`--base origin/main`): every counter is `0` and the result is `OK`, exit 0. The worker's gate at this head also has `build=0`.
- **Dependency check** (`--movable`, board merge order, main content): `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. `ORDER.txt` lists GromovWittenTheory at line 309, after its open suppliers ImplicitAtlases (216), AnalyticStableMaps (217) and TopologicalSheafCohomology (308).
- **Elaboration**: `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` exits 0 with no output at Mathlib `1b1ccf4` (7 s).
- **Lean form**: the file is unchanged, 66 lines. It has `import Mathlib` alone, the module docstring and the namespace. It declares nothing, so there is no `#check @name` comparison, no section-variable loss and no padding probe.
- **Outside the folder**: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GromovWittenTheory'` is empty. The files listed in `changes.md` as changed outside the folder come from main through the merge commit, not from this pull request.

### Supplier citations re-resolved this round

- **Open suppliers.** The open heads of AnalyticStableMaps and ImplicitAtlases are still at `41557ba` and `81fc759`, the heads the previous report resolved section by section.
- **Main suppliers unchanged.** No commit to AlgebraicTopology, ComplexCurveModuli, Orbifolds, CharacteristicClasses, DifferentialGeometry, ComplexKahlerGeometry, PseudoholomorphicCurveAnalysis, PDE or TopologicalSheafCohomology on main postdates the previous review. Examples rechecked: ComplexCurveModuli D7 (`README.md:192`, `forgetAuxiliarySet` :200, `markedPointCollisionBubbleCharts` :209) and D8 (:215); AlgebraicTopology Stages 5–8 (:849, :946, :1573, :1602), last changed 2026-10-20.
- **GeometricTopology (remark, no change requested).** Its README on main was restructured after `32ade49`. This README cites “GeometricTopology smoothing-and-triangulation comparison item 1” (`README.md:32`, `:122`, `:201`). GeometricTopology's anchor table (`GeometricTopology/README.md:776–778`) maps that item to its Layer 11.3. Layer 11.3 (:7887) proves the Cairns–Whitehead smooth triangulation of every smooth manifold, which is finite for a compact one. The citation therefore resolves.
- **`roadmaps resolve`** (worker run): no cross-roadmap citation or Lean name is found nowhere. `overlaps.md` lists no dropped id and no id defined only by an open revision.

### Remark on untouched text (no change requested)

The description's validation sentence speaks of “the unchanged eight-declaration coefficient-carrier prototype”, but `Suggested.lean` declares nothing. The coefficient carriers are Tau Ceti's `NovikovSeries`/`NovikovModule` at the pin. Earlier reviews passed this text.

### Adversarial pass

The diff changes no statement. The rows below are carried from the previous report (`PRREVIEW-GromovWittenTheory_r17`, “Adversarial pass”), with the values computed there. One row is new this round: the input that the GeometricTopology anchor mapping now routes.

Coefficients ℚ; `m = dim_ℂ X`; `s = Σ deg γ_i`; `t = 6g − 6 + 2n`; `d = d_(g,n,A)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §0.3 route: finite triangulation via GeometricTopology 11.3 (new this round) | `S²` as the radially projected tetrahedron (GeometricTopology 11.3, third Check); `T²` (7-vertex triangulation) | 4 − 6 + 4 = 2 = χ(S²), `H₂ = ℤ` finitely generated; 7 − 21 + 14 = 0 = χ(T²), `H₂ = ℤ`; both triangulations finite, as compactness forces | Correct |
| Conventions: `d`, degree, KM (2.2) (r17) | point, `(2,0,0)`; lines in `ℂP³`, `(0,3,ℓ)` | `d = 6 = dim_ℝ M̄_(2,0)`; `m = 3`, `c₁(ℓ) = 4`: `d = 14`, `(pt,pt,H)`: `14 − 14 = 0`; KM: `14 − 8 − 6 = 0` | Correct |
| §0.1 effectivity (r17) | `ℂP²`; `T²×T²` (areas 1, √2); Enriques | `ω(dℓ) = d`; diagonal of `E×E` has area `1 + √2`; torsion `ℤ/2` of area 0 | Correct |
| §0.2 direct sum iff `c₁ = 0` (r17) | `ℂP²`, `A = ℓ`; `T²×T²` | `Σ q^((k+k²)ℓ)`: degrees `0, 12, 36, 72, …`, areas `→ ∞`: not a finite homogeneous sum; `c₁ = 0` gives `Λ_ω = Λ_ω^0` | Correct |
| §0.2 grading, potential sign (r17) | `S²`, `B = {1, x}`; `v = 1 + q` | degree 4: `⟨1,1⟩` only; degree 6: `q·x`; `v ∈ U_C ⇔ C ≤ 0` | Correct |
| §0.2 perfect pairing (r17) | `T²`, basis `1, α, β, pt` | permutation `(1 pt)(α β)`, sign `+1`, entries `1·1·(−1)·1`: `det = −1` | Correct |
| §0.3 finiteness (r17) | `ℂP²`, `E`; Enriques; `A = 3ℓ` | `⌊E⌋ + 1` classes; 2 per lattice point; 4 decompositions | Correct |
| §0.4 cup product (r17) | `T²`; truncated product; Warsaw circle; two points | `θ₁⌣θ₂ ≠ 0`, `θ₁⌣θ₁ = 0`; truncated gives 0 (excluded); `Ȟ¹ = ℚ` against singular 0; `1_u` against `1_v` reversed | Correct |
| §1.1 stable range (r17) | `ℂP¹ (0,0,ℓ)`; `(0,2,0)`; `(1,1,0)` | `d = 0`, trivial automorphisms; `ℂ^*` unstable; `d = 2` | Correct |
| §1.2 diagrams (r17) | lines `(0,3,ℓ)` in `ℂP²`; `M̄_(1,1) × X` | `d = 10`; isotropy `ℤ/2`, `ℤ/4` at `j = 1728` | Correct |
| §2.1 weighted adjoint (r17) | `M̄_(1,1)`; `M̄_(0,4) → M̄_(0,3)`; `ξ` | `∫^wt [pt]^∨ = 1/2`; `π_*1` degree −2, so 0; `c/2 = 1`, so `c = 2` | Correct |
| §2.2 `I_(g,n,A)` (r17) | `ℂP¹ (0,3,0)`; lines `(0,3,ℓ)`, `(0,4,ℓ)`; point `(1,1,0)` | `t − d = 2(g−1)m − 2c₁(A)`; `I(pt,1,1) = 1`; `r = 0`, value 1; `r = 2 = t`; `Φ = 1/2`, `c = 1` | Correct |
| §2.3 endpoint equality (r17) | `J`, `J′` on `ℂP²`; `x`, `x²`; `z`, `z²` | `1 = 1`; classes `1, 0` and `1, 2`, no witness | Correct |
| §3.1 weights (r17) | `M̄_(1,1) × X`; double cover of a line | `1/2` against `1/2`; omitting the kernel gives `χ/2` or `2χ`; numerical weight `1/2` | Correct |
| §3.2 Hodge bundle (r17) | nodal cubic; two spheres at two nodes; bridge forgetting | `ℂ·dz/z`; `c₂ = −c₁`, dimension 1 (2 unmatched); restriction `c₁ dz/z` | Correct |
| §3.3 obstruction model (r17) | `g = 1`, `m = 1`, rank-1 thickening | thickened dimension 6, `Z` dimension 4, `ν_Z` rank 1 `= N_im`, involution `−1` | Correct |
| §3.4 headline 2 (r17) | `ℂP¹`; `T²`; K3; `ℂP²` with `H` | `χ = 2, 0, 24`; KM (2.9) gives `1, 1, 2` (source error); `⟨I_(1,1,0)(H)⟩ = −1/8`; `λ₁ = (1/12)[pt]^∨` | Correct |
| §3.4 genus ≥ 2 (r17) | `ℂP⁴`, `(2,0,0)` | `2(g−1)m = 8 > 6` | Correct |
| §4.1 effectivity (r17) | `−ℓ`; torsion; conics | negative area; area 0; `Eff ≠ {0}` | Correct |
| §4.2 covariance (r17) | `T²`, `(0,3,0)`, `α, β, 1` | `I(α,β,1) = 1`, `I(β,α,1) = −1` | Correct |
| §4.3 grading (r17) | `(0,3,0)`; lines `(0,4,ℓ)`; `(1,1,0)` | `s − 2m`; `s − 10`, top at `s = 12`; `deg γ` | Correct |
| §5.1 relative class (r17) | lines `(0,3,ℓ) → (0,2,ℓ)` | `π_*1 = 0`; `π_*(ev₃^*H) = 1` | Correct |
| §5.2 fundamental class (r17) | `ℂP²`; `ℂP¹ (0,4,0)` | `⟨pt,pt,1⟩_ℓ = 0`; `⟨H,H,1⟩_0 = 1` | Correct |
| §5.3 divisor (r17) | lines `(0,4,ℓ)`; conics `(0,6,2ℓ)`; `A = 0` | `1·1 = 1`; `2·1 = 2`; `⟨0,δ⟩ = 0` | Correct |
| §5.4 mapping to a point (r17) | `T²×ℂP³ (2,2,0)`; `ℂP² (1,2,0)`; quintic `(2,0,0)` | Hodge factor of complex degree 5 on dimension 3: 0; `I(H,1) = −3π^*λ₁`; `6 = 6`, no claim | Correct |
| §6.1 Casimir (r17) | `T²`; `ℂP²` | `g^(αβ) = −1`, `g^(βα) = 1`; `Σ g^(ab)g_(ab) = 0 = χ`; antidiagonal | Correct |
| §6.2 splitting sign (r17) | `T²`, `(0,4,0)`, `(α,β,1,1)`, `S₁ = {2,3}` | left 1; right `ε(S) = −1` times `(−1)³`, giving 1; without `ε`: `−1` | Correct |
| §6.2 lines (r17) | `(pt,pt\|H,H)`; `(pt,H\|H,H)`; conics | `0 = 0`; `g^(pt,1) = 1`; degree −4 | Correct |
| §6.3 genus reduction (r17) | `ξ: M̄_(0,3) → M̄_(1,1)`; `M̄_(0,4) → M̄_(1,2)` | `Σ g^(ab)g_(ab) = χ`; both sides 0; `ψ̄` model gives −1 | Correct |
| §6.4 transfer degree (r17) | `M̄_(1,2) → M̄_(2,0)`; `M̄_(3,2) → M̄_(4,0)`; `M̄_(1,1)² → M̄_(2,0)`; `M̄_(0,3)² → M̄_(0,4)` | `2`; `2`; `2`; `1` | Correct |
| §6.5 capped trace (r17) | lines, `τ_D` at `{12\|34}` | `(pt,pt,H,H)`: 14 ≠ 12, so 0; `(pt,H,H,H)`: 1 | Correct |
| §6.6 node matching (r17) | `M̄_(0,2)(ℂP², ℓ)` | `d = 8`; fibre dimension 3 against 2; weight `1/2` | Correct |
| §7.1 headline 3, CohFT (r17) | `ℂP¹`; Enriques; `T²×T²` | `Ω_(0,3)(pt,pt,pt) = q·1`; `(q^τ−1)(q^τ+1) = 0`; `1 − q^h` not invertible | Correct |
| §7.2 headline 3, quantum product (r17) | `ℂP¹`; `ℂP²`; `T²` | `x⋆x = q`; `H⋆H² = q`, `H²⋆H² = qH`; `α⋆β = pt`, `β⋆α = −pt` | Correct |
| §8.1 `ψ̄` (r17) | `M̄_(0,4)`; `M̄_(0,5)`; `M̄_(0,6)` | `∫ψ̄₁ = 1`; `ψ̄₁·D = 0`; `∫ψ̄₁³ = 1`, `∫ψ̄₁ψ̄₂ψ̄₃ = 6` | Correct |
| §8.2 `ψ_i` (r17) | `M̄_(0,2)(ℂP¹,ℓ)`; `M̄_(0,1)(ℂP¹,ℓ)` | pairing `−2 + 1 = −1`; `ψ₁ = −2pt` | Correct |
| §8.3 brackets (r17) | point; `ℂP¹`; `M̄_(0,5)` ancestors | `1, 1, 1/24`; `⟨pt,pt⟩_(0,ℓ) = 1`; `∫ψ̄₁ψ̄₂ = 2` | Correct |
| §8.4 headline 4 (r17) | point `n = 5`; `ℂP¹` divisor with descendant | string 1, 2; dilaton 1; divisor `−2 + 1 = −1` equals dilaton `−1`; `⟨τ₁(1)⟩_(0,1,ℓ) = −2` | Correct |
| §8.5 correction (r17) | `ℂP¹ (0,3,ℓ)` | `D₁` codimension 2 in 6; `⟨τ₁(1)pt pt⟩ = 0`; `⟨τ₁(pt) pt 1⟩ = 1` | Correct |
| §8.6 headline 4, TRR (r17) | point `n = 4`, `n = 5`; `k = 1` | `1 = ∫ψ̄₁`; `1 + 1 + 0 = 2`; `⟨τ̄₂τ₀³⟩ = 0 =` right side | Correct |

### Headline theorems

Nothing in the folder changed, so the previous report's headline audit stands. It lists four headlines: the operations with the eight Kontsevich–Manin properties, `I_(1,1,0)(1) = χ(X)·1`, the unital CohFT with its quantum product, and string/dilaton/divisor with the TRR. None is statable at the pins: the stable-map virtual functional, the weighted `M̄_(g,n)` pairing, Chern classes and a Čech cup product are all absent at the pins. The docstring names each headline with its missing carrier. The pin change does not alter this: the R01 repair moved the branch to the same Tau Ceti `2fd255d` and Mathlib `1b1ccf4` that the previous audit already read.

### Sources

The seeded sample (15 targets) falls entirely in unchanged text, and the previous report checked every one of its locators against the cached texts. No locator was re-read this round.

## Not verifiable

- #1998 was read only through `roadmaps list` and the overlap report. Its files are not among the checkouts the brief gives.
- KM98, Kock and Deligne–Mumford are still not in the board's `sources.toml`. The previous round read them from legal copies (arXiv, the author's page, Numdam). Recording them is the worker's manifest edit, not a change to the folder.

## Source issues

No locator was re-read this round. The five source issues in the previous report still stand and are not repeated here.

- none
