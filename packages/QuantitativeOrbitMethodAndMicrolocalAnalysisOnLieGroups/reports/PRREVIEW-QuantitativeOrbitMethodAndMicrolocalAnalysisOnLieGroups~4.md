# Review of QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (pull request #1842 at ee22726)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in the folder since d8dd99f. The folder is byte-identical, but the head now merges main, which moves the pins (Tau Ceti `358314d` → `2fd255d`, Mathlib `f6090c7` → `1b1ccf4`, toolchain `v4.36.0-rc2`), and `Suggested.lean` no longer elaborates at them. That is the one finding; the repair is a rename in three places and was tested.

## R01 (P1) — `Suggested.lean` does not build at the pins: the local instance it names was renamed

**Location.** `TauCetiRoadmap/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/Suggested.lean:80`, `attribute [local instance] LieGroup.minSmoothnessThree`; the same name in the module docstring at line 73 and in `README.md:56` ("the `C³` regularity supplied by `LieGroup.minSmoothnessThree` (`TauCeti/Geometry/Lie/Basic.lean`)").

**Claim.** The file elaborates against the pinned Tau Ceti, and the README names a pinned declaration.

**Witness.** `lake env lean` on the file at this head: line 80 `Unknown constant LieGroup.minSmoothnessThree`, then line 103 `failed to synthesize LieGroup 𝓘(ℝ, E) (minSmoothness ℝ 3) G` (in `quantize`). Pinned Tau Ceti `2fd255d`, `TauCeti/Geometry/Lie/Basic.lean:45`: the declaration is now `LieGroup.minSmoothness_of_isRCLikeNormedField` (for every `n`, over an `IsRCLikeNormedField`). The gate's targeted build fails with the same two errors.

**Repair.** Replace `LieGroup.minSmoothnessThree` by `LieGroup.minSmoothness_of_isRCLikeNormedField` at `Suggested.lean:73`, `Suggested.lean:80` and `README.md:56` (the file path in the README stays correct). Tested on a scratch copy with exactly this substitution: `lake env lean` exits 0 with seven `declaration uses sorry` warnings (lines 114, 170, 183, 199, 220, 238, 252) and nothing else; `#check @name` on all 13 declarations gives the same elaborated types as before the pin moved.

## Previous findings

The previous report (at d8dd99f) carried no finding: its one earlier finding was already recorded there as repaired, and the two lines of that repair (`README.md:179`, `README.md:1405`) are unchanged at this head.

## Verified sound

**What changed.** `git diff d8dd99f..HEAD` on the folder: empty. Outside the folder, `git diff --stat origin/main...HEAD` is empty apart from this folder's three files (README, `Suggested.lean`, `metadata.toml`); the files listed as changed since d8dd99f all come from the merge of main and are not this pull request's own changes. The pins of `lake-manifest.json` and `lean-toolchain` at this head equal main's.

**Gate and direction.** Gate text scanners at ee22726: every count zero (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`); the build check fails as in R01, so the gate as a whole fails. Dependency check on the README: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line; the roadmap is at line 295 of the merge order. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped or defined only by an open revision. `scratch/citations.md`: no cross-roadmap citation unresolved; its one Lean-name lead is R01.

**Pinned declarations re-resolved at the new pins** (27 names, file and line):

- Tau Ceti `2fd255d`: `mulInvariantExp` (`Geometry/Lie/Exponential/Basic.lean:56`, still requiring `[LieGroup I (minSmoothness ℝ 3) G] [IsManifold I 1 G] [T2Space G] [BoundarylessManifold I G] [CompleteSpace E]`), `lieExp` (same file, 140), `ContRepresentation.IsUnitary` (`RepresentationTheory/Continuous/Unitary/Basic.lean:49`), `CliffordAlgebra.spinorNorm` and `range_spinToSpecialOrthogonal_eq_ker_spinorNorm` (`LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:155, 212`), `spinorNorm_surjective_of_not_anisotropic` (`…/SpinorNorm/Isotropic.lean:56`), `spinorNorm_eq_one_of_posDef`, `spinorNorm_eq_one_of_negDef`, `spinorNorm_surjective_of_indefinite` (`…/Spin/Real/SpinorNorm.lean:104, 128, 165`), the Witt folder `LinearAlgebra/QuadraticForm/Witt/` (`Extension.lean`, `Cancellation.lean` present), `exists_isCAD_signInvariant`, `IsCAD.finite`, `IsCAD.isConnected` (`Geometry/RealAlgebraic/CAD/Basic.lean:182, 200`; the first used at `Geometry/RealAlgebraic/Nash/Graph.lean:57`).
- Mathlib `1b1ccf4`: `SchwartzMap` (`Analysis/Distribution/SchwartzSpace/Basic.lean:75`), `Real.fourier_eq` (`Analysis/Fourier/FourierTransform.lean:434`), `SchwartzMap.fourierTransformCLM` (`…/SchwartzSpace/Fourier.lean:53`), `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:55`), `UniversalEnvelopingAlgebra` (`Algebra/Lie/UniversalEnveloping.lean:65`), `RealRMK.integral_rieszMeasure` (`…/RieszMarkovKakutani/Real.lean:341`), `MeasureTheory.norm_integral_le_integral_norm` (`…/Bochner/Basic.lean:970`), `MvPolynomial.zeroLocus` (`RingTheory/Nullstellensatz.lean:39`), `KaehlerDifferential.exact_mapBaseChange_map` (`RingTheory/Kaehler/Basic.lean:781`), `Algebra.H1Cotangent.exact_δ_mapBaseChange` (`RingTheory/Kaehler/JacobiZariski.lean:552`), `Algebra.FormallySmooth.subsingleton_h1Cotangent` (`RingTheory/Smooth/Basic.lean:72`, a class field), `exteriorPower` (`LinearAlgebra/ExteriorAlgebra/Basic.lean:79`), `Scheme.Hom.exists_isIso_morphismRestrict_toNormalization` (`AlgebraicGeometry/ZariskisMainTheorem.lean:206`), `Matrix.specialOrthogonalGroup`, `mem_specialOrthogonalGroup_iff`, `mem_orthogonalGroup_iff'` (`LinearAlgebra/UnitaryGroup.lean:338, 346, 324`; still `specialUnitaryGroup n R` under the trivial star).

**Not-statable claims of the module docstring at the new pins.** Tau Ceti gained `Analysis/OperatorIdeal/Family/TraceClass.lean` (the trace-class operator-ideal family, gauge the nuclear norm) and `Geometry/Lie/Exponential/BCH/{Basic,Bracket}.lean` (`lieLocalBCH`, its first-order law and the bracket term `bch X Y = X + Y + ½⁅X,Y⁆ + O(‖(X,Y)‖³)`), neither present at `358314d`. Neither makes a headline statable: there is still no trace functional on trace-class operators (only `dixmierTrace`), and no Taylor coefficients of the BCH germ beyond second order, while the `C_j` of §1.2 need every order and the operator classes `Ψ^m` are still absent. No file at the pin matches quantization, symbol classes or star products (grep over the pinned Tau Ceti: only unrelated quantum-group and Clifford hits). Remark, no change requested: the docstring's "of which the pins have only the local logarithm" is now slightly conservative, since the pin also has the bracket term of the local BCH germ.

**Lean.** Beyond R01 the file is unchanged. With the R01 substitution: single `import Mathlib` plus two `TauCeti.*` modules, both present at the pin; no `set_option`; 13 declarations, 7 sorried theorems, 6 definitions with real bodies; elaborated signatures equal to those the previous reports compared with the README (`quantize` keeps `[LieGroup 𝓘(ℝ, E) ∞ G] [T2Space G] [FiniteDimensional ℝ E] [CompleteSpace V]`; `exists_norm_quantize_le` keeps the Haar hypothesis, `0 ≤ δ < 1/2`, and the order of quantifiers `∃ U, ∀ χ, ∃ C N, ∀ V π h b M`). The one-tactic padding probe and the headline audit stand as in the previous reports (the statements did not change).

**Seeded sample and sources.** No sampled target falls in a changed passage (none changed); the source locators were verified in the earlier full review and are untouched. Ownership against open pull requests: re-checked only through `scratch/overlaps.md` and `scratch/citations.md`, which report nothing new.

**Adversarial pass.** No statement changed; one row is recomputed for the statement R01 touches, and the rows of the previous reports are carried forward unchanged, each marked with the report that computed it (r3 = the report at d8dd99f, r2 = at 70c9a0e, r1 = at 3cf9ad8).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `quantize` instance resolution (R01) | pin `2fd255d`, `G` with `[LieGroup 𝓘(ℝ, E) ∞ G]` | head: goal `LieGroup 𝓘(ℝ, E) (minSmoothness ℝ 3) G` unsolved (2 errors); with `minSmoothness_of_isRCLikeNormedField` at `n = 3` (`minSmoothness ℝ 3 = 3`, `LieGroup 𝓘(ℝ, E) 3 G` found from the `∞` instance): 0 errors, 7 `sorry` warnings | fails at head, repaired by the rename | R01 |
| (r3) Line 179 contract and §8.6 Check 2 | `S = SO(2)`, `Γ = {1}`, standard representation on ℝ² | SO(2) compact ⇒ `{1}` a lattice; rotation by θ has eigenvalues `e^{±iθ}`, unipotent iff θ ∈ 2πℤ, unipotent set `{1}`; closure `{1} ⊇ {1}` (lattice form holds); `borel_density_zariski` conclusion: `{1} ≠ SO(2)` (fails); `borel_density_unipotent_generated` conclusion: line `ℝ(1,0)` is Γ-invariant, not SO(2)-invariant (fails); supplier hypothesis fails too (SO(2) has no nontrivial unipotent one-parameter subgroup) | Check correct; each name now attached to the statement the supplier gives it | none |
| (r2) §8.6 lattice form, Check 1 | `S = {[[1,t],[0,1]]}`, `Γ = ℤ`; `Γ = {1}` | polynomial restricted to S is a polynomial in t; vanishing on ℤ ⇒ zero, closure = S; `{1}` infinite covolume, closure `{1}` ∌ `t = 1` | lattice hypothesis needed | none |
| (r2) §8.6 lattice form, Check 3 | `u = [[1,1],[0,1]]`, `v = (0,1)ᵀ` | `Nv = (1,0)ᵀ`, `N²v = 0`; `[(1,1/n)] → [(1,0)]`, unique fixed line; point mass forced; rotation-invariant measure has no atom | correct | none |
| (r2) §8.6 lattice form, step 1 | `k = 0`; `S/Γ_S` with full-support Haar | `Λ⁰W` scalar line fixed; conull closed right-Γ_S-stable set is S; `s = 1` gives `ρ(u)W = W` | sound | none |
| (r2) §8.6 lattice form, step 2 | `V_d = det^{−d}·(deg ≤ d)`; `f = x₁₁⁵` | `R_g(det^{−d}q) = det(g)^{−d}det(x)^{−d}q(xg)`, V_d R-stable; `det^{−5}x₁₁⁵ ∈ V_5`, `det u = 1` | route sufficient | none |
| (r2) §8.6 lattice form, GL vs SL | `S = ℝ^× ⊂ GL₁`, `Γ = {±2ⁿ}` | unipotent set `{1}`; closure of Γ in `ℝ[x,x⁻¹]` is `ℝ^×` | consistent | none |
| (r2) §8.6 route, density step | `Γ_S s U` dense, `Z := Zcl(Γ_S)(ℝ) ∩ S` | `Γ_S s U ⊆ Z s` closed ⇒ `Z s = S` ⇒ `Z = S` | sound, matches nv21 (27.5) | none |
| (r2) §8.6 route, ergodic kernel | compact `Γ\G_∞`, U locally compact second countable | kernel values U-invariant, U-ergodic a.e., `μ = ∫ κ(x) dμ` | hypotheses of `exists_actionErgodicKernel` met | none |
| (r2) §8.6 route, Poincaré in Mathlib | `ℝP^{m−1}`, `f = Λ^kρ(u)` | `IsFiniteMeasure`, second countable, opens measurable, `MeasurePreserving` ⇒ a.e. recurrence | Mathlib statements cover Lemma 4.7.3 | none |
| (r1) Conventions Fourier sign | `b(η)=e^{−π(η−1)²}`, x = 1/4 | `−i·e^{−π/16}` vs `+i·e^{−π/16}` vs `e^{−ix}e^{−x²/(4π)}` | separates the three conventions | none |
| (r1) §0.1 forward kernel | indicator of [0,1] at η = 1, 1/2 | `0`; `2i/π`; Mathlib kernel `−2i/π` | correct | none |
| (r1) §0.1 density j | SU(2), ax+b | `j = (sin(|x|/2)/(|x|/2))²`; `j(−x)=e^{x₁}j(x)` | even iff unimodular | none |
| (r1) §0.2 Nelson operator | character `e^{itx}`; trivial rep | `Δ = 1 + t²`; `Δ = 1` | sign pinned | none |
| (r1) §0.3 Definition 3.1 | identity; `dπ(∂_x)`; `e^{ix²}` multiplier | commutators 0 / order 1 / `[∂_x, M] = 2ixM` unbounded | `Ψ⁰ ⊊` bounded | none |
| (r1) §0.5 `quantize` | `E = 0`; character with inactive cutoff; `M = 0` | `b(0)·v`; `b(t/2π)·v`; bound 0 | consistent, not vacuous | none |
| (r1) §0.5 adjoint | even real χ | `conj(a^∨(−x)) = (ā)^∨(x)` | `Op(a)* = Op(ā)` | none |
| (r1) §1.2 `C₁` | linear symbols | `C₁(a,b) − C₁(b,a) = ξ([x₀,y₀])` | factor ½ forced | none |
| (r1) §1.2 `C₂` Heisenberg | `[X,Y]=Z` | `{x,y} = ½[x,y]`; `e^z − 1 − z = −ε²/2+…` | `C₂ ≠ 0` | none |
| (r1) §1.9 bound vs L¹ | `a_K = θ(ξ)ψ(2^{−K}ξ)` | `‖a_K^∨‖_{L¹} ≍ K`; telescoped L¹ ≤ `2‖ψ^∨‖` | strictly stronger than L¹ | none |
| (r1) §1.10 symmetrization | Weyl algebra `X=q, Y=∂, Z=−1` | `sym(⟨ξ⟩⁴) = Δ² − Z²` | correct | none |
| (r1) §2.1 SL₂ parameters | `I(s)`, `D_k` | `λ(H) = ±s`; `k − 1` | ρ-shift consistent | none |
| (r1) §2.4(ii) | quadratic Casimir | `γ(sym p) − p = −|ρ|²` | consistent | none |
| (r1) §2.6 a-priori estimate | `G = H = {1}`, `a(h) = e^{1/h}` | `e^{1/h} > h^{−M}` | boundedness hypothesis present | none |
| (r1) §2.7 invariant distance | `q(x) = x²`, `x = h^δ` vs `h^{δ/2}` | `h^{2δ} < h^δ` vs `h^δ` | correct; source error listed in r1 | none |
| (r1) §3.1 dilation exponent | 2-dim orbit; SO(3) sphere | `t^{−1}ω_{tO}`; mass `2r = 2l+1` | exponent d | none |
| (r1) §3.2 fibre counts | 𝔰𝔩₂ over ℂ, ℝ | (2,1,1), (3,1,2) | bounds 2, 3 | none |
| (r1) §3.3 Rossmann SU(2) | spin l | `2 sin(rθ)/θ = ∫_O e^{xξ}dω` | needs `j^{1/2}` | none |
| (r1) §3.4 limits | spin-l, `h → 0`; U(1); point masses | `h(2l+1) → 0` vs 1; `in → ∅` | topology separates | none |
| (r1) §3.6 generic criterion | Sp₄(ℝ) holomorphic DS | GK dim 3 < 4 | empty limit | none |
| (r1) §3.7 trace exponent | character of ℝ; spin l | `d = 0`; `h·dim π = 2` | consistent | none |
| (r1) §3.9 approximate inverse | `G = ℝ`, `N = 2` | `4 · 1/4 = 1` | square used | none |
| (r1) §4.1 κ | `K = SO(3)`, torus | `(1+l+l²)² ≥ (2l+1)²`; `2L > r` | source error listed in r1 | none |
| (r1) §4.2 Plancherel mass | compact G, open U | `Σ dim π·dim π^U = vol(U)^{−1}` | consistent | none |
| (r1) §4.5 conjugation in `H_σ` | SO(3) ⊃ SO(2) | `1` vs `0`; `−1` vs `1` | (18.6) misprint | none |
| (r1) §4.5 compact H | σ of dim 2 | `H_σ = 1/2` | normalization pinned | none |
| (r1) §5.2 orthogonal, Lean | SO(3) ⊃ SO(2) | `X²+a²+b²+c²` vs `X²+a²`; coprime iff `b²+c² ≠ 0` | iff both ways | none |
| (r1) §5.2 small ι | `ι = ∅`, `Unit` | `(1,1)`; `(X²+b², 1)` | both sides true | none |
| (r1) §5.2 unitary, Lean | GL₂ ⊃ GL₁ | common root iff `bc = 0` | iff | none |
| (r1) §5.2 `ggpSpectralPolynomial` | `m = 1, x = 0`; `m = 0`; 𝔰𝔬₄ | `1`; `1`; forced root removed | needed | none |
| (r1) §5.3 torsor, Lean | SO(3) ⊃ SO(2) | `{b²+c² = s}`; `s = 0` two lines; `s < 0` empty over ℝ | consistent | none |
| (r1) §5.3 torsor, `ι = Unit` | 𝔰𝔬₂ ⊃ 𝔰𝔬₁ | fibre `{y}`, `h = 1` | Pfaffian encoded | none |
| (r1) §5.3 unitary torsor | GL₂ ⊃ GL₁ | `bc = p`, stable iff `p ≠ 0` | consistent | none |
| (r1) §5.3 surjectivity | four models | always solvable over k̄ | nonempty without stability | none |
| (r1) §5.3 sphericity | SL₂ on ℙ¹ | Borel stabilizer a torus; nilcone | trivial stabilizer needed | none |
| (r1) §6.1 `d_M = dim S` | SO(3)⊃SO(2), GL₂⊃GL₁ | `d_G + d_H = 1 = dim H` | holds | none |
| (r1) §6.2 narrow symbol mass | `b(hη) = h^{δ′dim s}Θ^∨(h^{δ′}η)` | `∫ b = h^{dim s}` | cancellation confirmed | none |
| (r1) §6.3 separation and tail | GL₂ ⊃ GL₁, `t = 2`; `Ξ(diag(t,1))` | `3r < √5/2`; `X^{−1/2}log X` | partition needed; polynomial gap right | none |
| (r1) §7.1 weights and PSL₂ window | spin l, `l = 1`; `h = 1/10` | weights `1, 2, 0`; `D_8, D_10` | consistent | none |
| (r1) §7.7 example polynomial | `q = 5, α = 2, n = 4` | `341/64 > 2`; `−5/2 < 1` | source error listed in r1 | none |
| (r1) §8.4 rigidity | principal SL₂ ⊂ SL₃ | e, not e² | full centralizer needed | none |
| (r1) §8.7 components | binary anisotropic; definite in indefinite | index 2 / trivial vs `{±1}` | source error listed in r1 | none |
| (r1) §9.1 periods | two copies | sum 2, not 4 | multiplicity once | none |
| (r1) §9.5 scaling | Haar times c | both sides `c^{−1}` | consistent | none |
| (r1) Global setting | `τ(G) = τ(H) = 2` | SO(n), U(n): 2; tori `2` | consistent | none |

## Not verifiable

- Nothing new. The sources recorded as uncertified (rossmann78, kostant78, barbasch-vogan80, rangarao72, kostant63, kostant59, whitney57) remain cited by locator only, as in the previous reports.

## Source issues

- none
