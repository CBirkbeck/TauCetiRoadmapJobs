# Review of IndexTheory (pull request #1077 at 6d85f5d)

**Verdict:** accepted

Incremental re-review of the 51 README lines changed since 75046fc (29 insertions, 22 deletions, all in `TauCetiRoadmap/IndexTheory/README.md`; `Suggested.lean` and `metadata.toml` are byte-identical to 75046fc; nothing outside the folder changed). Both findings of the previous review are repaired, the repairs introduce no new problem, the gate passes on my rerun and the dependency check reports no problem. There is no finding.

## Previous findings

- R01 — repaired: lines 145–147 now read "it is `0` when the principal argument is not continuous on the spectrum, as for the bilateral shift, and `π` on `U = −1`"; line 484 adds "Mathlib `selfAdjoint.expUnitary`, `NormedSpace.exp` and `selfAdjoint.expUnitaryPathToOne`"; lines 548–549 add "its unitary exponential and path API". The repair leaves `Unitary.mem_pathComponentOne_iff` off the *Needs:* line; that is right, since I1.5 (lines 460–462) states it as a consequence ("holds with a single factor") and `Unitary.joined` as "not restated", so neither is an input of the route.
- R02 — repaired: no "CompactGroups Layer 5" remains (the only "Layer 5" mentions, lines 35, 283, 937, 961, 1111 and 1563, are this roadmap's own Layer 5). Lines 234–235 read "consumed here from CompactGroups under the same contract, `gap:banach-gfinite-density`"; line 268 "this is the contract that TopologicalKTheory T6.1 consumes"; lines 846–848 "Apply CompactGroups' G-finite density theorem … under the contract `gap:banach-gfinite-density`"; lines 864–866 "RepresentationTheory CompactGroups (Peter–Weyl, and the G-finite density of `gap:banach-gfinite-density`) and LieGroups Layer 6".

## Verified sound

**Gate** (my rerun at 6d85f5d, text scanners and dependency check; the worker's `gate.md` adds `build=0` for the targeted build):

```
gate IndexTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check** (`gate --depcheck … --movable`), output in full:

```
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists IndexTheory after OperatorKTheory. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `Suggested.lean` is unchanged since 6a51fc7. I elaborated a scratch copy with `#check @` lines for its three declarations and eleven Mathlib pins appended (`lake env lean`, 8 s): the only diagnostics for the file's own declarations are `declaration uses sorry` at lines 48 and 60. The elaborated types equal `signatures.md`: `normPath_iff_index_eq` and `exists_index_eq` carry `[InnerProductSpace ℂ _] [CompleteSpace _]` on both spaces, `exists_index_eq` carries `(e : E ≃ₗᵢ[ℂ] F)` and `¬FiniteDimensional ℂ E`; no binder is lost. The previous reviews' one-tactic probe (`simp` no progress, `exact?` fails on both theorems) and headline audit carry over unchanged: the one statable headline (norm-path classification of Fredholm maps with the image of the index) is stated; the module docstring names the Layer 5.5, 6.1, 7 and 8.3 headlines with their missing carriers. A second scratch file proves at the pin, with `Unitary.argSelfAdjoint_coe`, `Unitary.coe_neg`, `cfc_algebraMap` and `Complex.arg_neg_one`, that `Unitary.argSelfAdjoint (−1 : unitary ℂ) = π`, and with `spectrum.mem_iff` that `−1 ∈ σ(−1)`: the witness of the corrected contract sentence and of I1.5's first Check.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b), each by file and by `#check`, for the changed Mathlib contract (lines 139–149) and the changed *Needs:* line 484:
- `selfAdjoint.expUnitary` (`Analysis/CStarAlgebra/Exponential.lean:37`): its body is `exp (I • a)` with membership in the unitary group through `exp_mem_unitary_of_mem_skewAdjoint`, so the README's "through `NormedSpace.exp` and `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint`" describes the definition.
- `NormedSpace.exp` (`Analysis/Normed/Algebra/Exponential.lean:128`) and `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint` (same file, line 540; hypotheses `NormedAlgebra ℚ`, `CompleteSpace`, `StarRing`, `ContinuousStar`).
- `Unitary.argSelfAdjoint` (`Analysis/CStarAlgebra/Unitary/Connected.lean:124`, `cfc (arg ·) u`; its docstring says it returns `0` when the principal branch is not continuous on the spectrum, which is now what lines 145–147 say).
- `selfAdjoint.expUnitaryPathToOne` (288, type `Path 1 (expUnitary x)`), `selfAdjoint.joined_one_expUnitary` (296), `Unitary.joined` (312, `‖v − u‖ < 2`), `Unitary.instLocallyPathConnectedSpace` (331), `Unitary.mem_pathComponentOne_iff` (337).
- `NormedRing.inverse_continuousAt` (hypothesis `HasSummableGeomSeries`) and `CStarRing.norm_one` (hypothesis `Nontrivial`), the "normed-ring inverse and C*-norm of the unit" now named in Layer 1's Dependencies (lines 548–549).

**Cross-roadmap citations in the changed passages, resolved on main or at the head the brief gives:**
- RepresentationTheory/CompactGroups on main: Layer 5 (line 318) is the Peter–Weyl theorem, which the *Needs:* line 864 names in words; main has no G-finite density, so the slug is the right citation. At the open revision (5ccf6ccf), §2.1 (lines 413–417) states the density for "a compact Hausdorff topological group G, a complete complex normed space E and a representation by continuous linear automorphisms" with continuous orbit maps, and lines 1283–1289 record the slug: exactly the hypotheses of lines 265–268.
- TopologicalKTheory on main, lines 86 and 1210–1218: T6.1 consumes the same contract; the README's "as TopologicalKTheory T6.1 does for the sup and L² norms" (line 849) matches lines 1218–1224 there.
- RepresentationTheory/LieGroups on main, line 673: "Layer 6: maximal tori, the Weyl group, and Weyl integration".
- TopologicalKTheory T6 (main line 1202) and T6.1 (1210); CharacteristicClasses C2.5 (main lines 953–975: general-position perturbations, "persistence of immersion and pairwise separation on each compact stage", the estimates I3.4 lines 843–845 extract).
- Layer 1 Dependencies (lines 548–552): OperatorKTheory K4.1 (Atkinson's theorem, #866 head line 934), CStarAlgebras C1.6 (main line 435), BanachSpaceTheory B5 (main line 800), OperatorTheory SelfAdjointSpectralTheory Part B (main line 252), PolarDecomposition (folder on main).

**Declared contracts.** `gap:banach-gfinite-density` (lines 265–268) is precise (compact Hausdorff group, complex Banach space, continuous linear automorphisms, continuous orbit maps, density of the finite-orbit-span vectors), minimal (Tau Ceti 2fd255d9 has no G-finite predicate or density theorem, checked in the previous review; nothing on main states it), and declared where TopologicalKTheory and AutomorphicFormsOnReductiveGroups already declare it. `gap:smooth-surface-classification` is untouched by the diff. Remark, not a finding: this roadmap has no `design/plan.json`, as the previous review noted.

**Ownership.** The changed passages add no construction: they re-describe Mathlib's and CompactGroups' objects. The previous review's `roadmaps grep` over main and the open heads for I1.5's infinite-dimensional statements and for the density theorem stands.

**Sources: the seeded sample.** Of the sampled targets, only I3.4 falls in the changed passages, and its changed text carries no source locator (its inputs are the roadmap and Mathlib citations resolved above). I1.5, changed and unsampled, likewise cites only Mathlib and OperatorTheory. The other sampled targets (I1.2, I1.3, I1.4, I1.6, I2.5, I3.5, I4.2, I5.3, I5.4, I5.5, I7.1, I7.4, I8.2, I8.3) are untouched by the diff and were not re-read; the previous reviews checked I5.5, I7.4 and I8.2–I8.3 against Atiyah–Singer I, Freed and Atiyah–Bott II and their adversarial rows below cover the rest. The README flags no locator as unverified.

**Remark on the citation tool.** The "PseudodifferentialOperators P4.2" lead in `citations.md` (line 584) is the same false positive as last round: §4.2 sits under the layer labelled P4 on main (lines 782 and 810).

**Adversarial table, changed statements** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| Mathlib contract: when `Unitary.argSelfAdjoint` is `0` (lines 145–147) | `U = −1` on ℂ; bilateral shift; `diag(1, −1)` on ℂ²; spectrum the arc `θ ∈ [π/2, π]` | `σ = {−1}`, `arg` continuous there, value `π` (Lean probe), README says `π`; `σ` the circle, `arg` jumps at `−1`, value `0`, README says `0`; `σ = {1, −1}` discrete, `diag(0, π)`; `arg = θ` continuous, value ≠ 0 though `−1 ∈ σ` | holds |
| I1.5 sentence "where it is not, `Unitary.argSelfAdjoint` is `0`" (lines 457–458) and Checks 1–2 (lines 472–477) | the same four | as above; the Borel argument gives `A = π`, `A = θ` with `σ(A) = [−π, π]`, `diag(0, π)`, `A = θ` | holds; the Checks agree with the sentence |
| I1.5 *Needs:* (line 484) against the route (lines 455–466) | each step of the route | Borel argument: SelfAdjointSpectralTheory Part B; identity `expUnitary A = U`: `selfAdjoint.expUnitary`, `NormedSpace.exp`; path: `expUnitaryPathToOne`; `GL(H)`: PolarDecomposition. `mem_pathComponentOne_iff`, `Unitary.joined`: stated as consequences or "not restated", so not inputs | every input named |
| Layer 1 Dependencies (lines 548–552) | `H = 0`; `H = ℓ²` | `B(0) = 0` is not `Nontrivial`, `‖1‖ = 0`, and I1.4's `H = 0` row (r4) records the quotient `0`; `B(ℓ²)` complete, `HasSummableGeomSeries` holds, `Ring.inverse` continuous on units | the named Mathlib hypotheses are the ones the targets carry |
| Contract `gap:banach-gfinite-density` (lines 265–268) and its uses (lines 234–235, 846–849, 864–866) | `G = {1}`; `S¹` on `C(S¹)` and `C¹(S¹)`; `S¹` on `L^∞(S¹)`; `ℝ` on `C₀(ℝ)`; `S¹` on `C(S¹)` by a non-invertible action | every vector G-finite; trigonometric polynomials dense (Fejér, `(σ_N f)′ = σ_N(f′)`); `L^∞`: orbit maps discontinuous, closure of trigonometric polynomials is `C(S¹) ≠ L^∞`; `ℝ`: not compact, finite translate spans are exponential polynomials, only `0` in `C₀`; "continuous linear automorphisms" is #1047 §2.1's own hypothesis, implied by "a representation" in TopologicalKTheory line 1217 | holds; the wording matches both heads |
| I3.4 *Needs:* (lines 864–866) against the route (lines 836–855) | each step | Peter–Weyl sums: CompactGroups Layer 5 on main; density in `C¹`: the slug; compact Lie structure and averaging: LieGroups Layer 6; section actions and finite equivariant embedding: T6.1; representation category and SplitK0: T6; immersion and separation estimates: C2.5 | every input named |

**Adversarial table, rows carried from the previous reviews** for the statements the diff leaves untouched (r5 at 75046fc, r4 at 6a51fc7):

| Statement | Instances | Values | Result | From |
|---|---|---|---|---|
| I1.5 `selfAdjoint.expUnitary A = U`, `‖A‖ ≤ π` | `U = −1`; `U = 1`; `H = 0`; bilateral shift | `A = π`, `exp(iπ) = −1`; `A = 0`; both sides zero; `A` = multiplication by `θ ∈ (−π, π]` on `L²(S¹)`, `‖A‖ = π`, `exp(iA) = U` | holds | r5 |
| I1.5 path `expUnitaryPathToOne A` | `t = 0, 1` | `expUnitary 0 = 1`, `expUnitary (1 • A) = U`; type `Path 1 (expUnitary x)` | holds | r5 |
| I1.5 `mem_pathComponentOne_iff` with a single factor | `l = [A]` | `(l.map expUnitary).prod = expUnitary A = U` | holds | r5 |
| I1.5 `GL(H)` path-connected | `T = U|T|`, `σ(|T|) ⊆ [m, M]`, `m > 0` | `σ((1−t)|T| + t·Id) ⊆ [min(m,1), max(M,1)] ∌ 0`; unitary leg `expUnitary((1−t)A)` | holds | r5 |
| I2.6 C1.3 permanence | `π(S)` in `C*(π(S))`; disc algebra in `C(S¹)` | inverse `π(S)*` in the star subalgebra; `z` invertible in `C(S¹)`, not in the disc algebra, so star-closure is needed and C1.3 assumes it | holds | r5 |
| I2.2 P4.2 square partition | `χ₁ = χ₂ = 1/√2`; `φ₁ = φ₂ = 1/2` | `Σχ² = 1`, `Σχ = √2`; `Σφ = 1`, `Σφ² = 1/2`, symmetric patching has symbol `σ/2` | holds | r5 |
| I7.4 with `gap:smooth-surface-classification` | `T² # T²` vs genus-2 Σ; `S²` vs `ℝP²`; `T²` vs Klein bottle; plane vs annulus | `rank H₁ = 4, 4`; `b₁ = 0, 0` but orientability differs; `b₁ = 2, 1`; both genus 0, not diffeomorphic | holds | r5 |
| I1.1 Check: `T₀ = 0 : ℂ² → ℂ` | K = ℂ², X = 0, R = 0, C = ℂ | index `2 − 1 = 1`; reversed convention −1 | holds | r4 |
| I1.1 `range(T*T) = range(T*) = (ker T)^⊥` | nilpotent `[[0,1],[0,0]]` | `ker T = range T = ⟨e₁⟩`, `T*`, `T*T` have range `⟨e₂⟩` | holds; correct negative control for T | r4 |
| I1.1 transverse subspace, finite V | `T₀ = diag(1,0)`, `V = ⟨e₁⟩`, `T = diag(1,ε)` | `(T₀V)^⊥ = ⟨e₂⟩`; `1 − 0 = 1 − 0` | holds | r4 |
| I1.1 infinite version | `V = (ker T₀)^⊥` | `dim ker T ≤ dim ker T₀`, `dim coker T ≤ dim coker T₀`, index constant | holds | r4 |
| I1.2 snake Check 1 | `0 → ℂ → ℂ² → ℂ → 0`, middle `(x,y) ↦ (y,0)` | six terms ℂ; `δ(y) = [(y,0)] = y` | holds | r4 |
| I1.2 snake Check 3 | `a : δ_n ↦ δ_{2n}`, `d(y) = (y₁,y₃,…)`, `b(y) = Σ y_{2n} δ_{2n+1}` | `(x,y) ↦ (ax + by, dy)` bijective; `δ : y ↦ [by]` | holds; neither a nor d Fredholm | r4 |
| I1.2 shifts | `S ⊕ S*` over `S`, `S*` | `−1 + 1 = 0` | holds | r4 |
| I1.3 backward shift | `(Bu)_n = u_{n+1}` | surjective, `ker = ⟨δ₀⟩`, index +1 | holds as negative control | r4 |
| I1.3 `T = 0 : ℂ → ℂ²` | | `dim coker = 2`, `dim ker = 1`, index −1 | holds | r4 |
| I1.3 integral equation | `f = g = i`; `f = 1`, `g = −1` | `(Id + K)c = 2c`; `1 + ⟨g,f⟩ = 0`, solvable iff `∫h = 0` | holds | r4 |
| I1.4 `‖π(Id)‖` | ℓ²(ℕ); ℂ²; H = 0 | 1; 0; 0 | holds | r4 |
| I1.4 shift unitary in Calkin | S on ℓ²(ℕ) | `S*S = 1`, `SS* = 1 − e₀₀`, `π(SS*) = π(1)` | holds | r4 |
| I1.5 over ℝ | `Id`, `−Id` on ℝ | determinant signs differ | correct negative control | r4 |
| I1.6 `normPath_iff_index_eq` | `E = ℂ²`, `F = ℂ`; `E = ℓ²`, `F = ℂ`; `E = F = ℓ²` | all index 1, straight path; locus empty, vacuous; `Id`, `S`, `S*` indices 0, −1, +1 | holds | r4 |
| I1.6 `exists_index_eq` | `E = F = ℓ²(ℝ)` | shift on a countable orthonormal family: index −1; powers give ℤ | holds without separability | r4 |
| I1.6 nonempty locus | `ℓ²(ℕ) → ℓ²(ℝ)` | Hilbert dimensions ℵ₀, continuum; no Fredholm map | holds | r4 |
| I2.1 point | `(ℂ³, ℂ, 0)` | class `3 − 1 = 2` | holds | r4 |
| I2.3 adjoint sign | `(ℂ^b, ℂ^a, 0)` | `b − a = −(a − b)` | holds | r4 |
| I2.4 arrows vs complex | `d : Ω⁰ → Ω¹` on S², S¹ | ranks 1 → 2; 1 → 1 with symbol `iξ` | holds | r4 |
| I2.4 folded de Rham index | S¹; S² | `0`; `2` | holds | r4 |
| I2.5 block rotation | `t = 0`, `π/2` | `diag(σ, σ*)`; `[[0,−Id],[Id,0]]` | holds | r4 |
| I2.5 cut-and-paste rotation | `φ² + ψ² = 1` | `u₃ = φu₁ + ψu₂`, `u₄ = φu₂ − ψu₁` unitary | holds | r4 |
| I2.5 common principal part | `p₁ = d/dx`, `p₂ = 2 d/dx` | off-diagonal `φψ d/dx` not compact `H¹ → L²` | hypothesis needed | r4 |
| I2.5 Dolbeault cut-and-paste | `(g,h) = (0,0), (1,1), (2,3)` | 2 = 2; 0 = 0; −3 = −3 | holds | r4 |
| I2.6 dimension 0 | M finite | quotient 0, `C(∅) = 0` | holds | r4 |
| Conventions `z = v − ix` | `(x,v) = (1,0)`, `(0,1)` | `−i`, `1` | holds | r4 |
| Conventions sign and I6.1 total | n = 1,2,3,4 | `(−1)^n·(−1)^{n(n−1)/2}` = −1, −1, +1, +1 | holds | r4 |
| I3.2 composite normal bundle | `ν_{g∘f} = ν_f ⊕ f*ν_g` | `(−1)^{r_f + r_g} = (−1)^{r_{g∘f}}` | holds | r4 |
| I3.3 diagonal embedding | `(cos t·j₀, sin t·j₁)` | injective for `t ∈ (0, π/2)` | holds | r4 |
| I3.4 Checks | `G = {1}`; O(1) on S¹; restriction along `{1} → G` | `ind_t^G = ind_t`; `ℝ ⊕ ℝ_sgn`; dimension | holds | r4 |
| I3.5 normalization and `R(O(1))` | `0`, `2·ind_t`; `ℤ[sgn]/(sgn² − 1)` | values 0, 2 excluded; normalization fixes 1 | holds | r4 |
| I4.3 graded product | `(ℂ²,ℂ,0) ⊠ (ℂ,ℂ³,0)` | `5 − 7 = −2 = 1·(−2)` | holds | r4 |
| I4.4 point fibre; scalar action | `Q = 0 : ℂ^p → ℂ^q`; `c = i` | `ind_a(a)·(p − q)`; `(iP, −iP†)` | holds | r4 |
| I5.1 sphere index | S¹ with O(1); S² with O(2), SO(2) | `1 − sgn`; `1 + det`; 2 | holds | r4 |
| I5.1 `κ*w = (−1)^n det·w` | `κ : z ↦ −z̄` | n = 1: `−sgn` | consistent with Conventions | r4 |
| I5.2 Toeplitz operator; `R(O(1))` algebra | `A = e^{ix}P_{≥0} + (1 − P_{≥0})`; `b = a + c·sgn` | index −1; `a = 1`, `c = 0` | holds | r4 |
| I5.3 rotation plane; detection | rotation by θ; det on SO(2) vs O(1)×O(1) | `e^{iθ}(1,−i)ᵀ`; trivial vs `sgn ⊗ sgn` | holds | r4 |
| I6.1 circle operator | `−w`, `Td = 1` | `∫ ch_c(−w) = +1`, prefactor −1 gives −1 | holds | r4 |
| I6.3 Euler class | SO(3) on ℝ³; U(n) on ℂⁿ | `e = 0`; `e = c_n` | holds | r4 |
| I6.4 numbers | genus g; ℂP²; K3 | `1 − g`; `1 = σ`; `2` | holds | r4 |
| I7.1 `d* = (−1)^{m(k+1)+1} ⋆d⋆`; ℝP² | m = 2, k = 1; | `−∂_x f`, `d*d = −Δ ≥ 0`; `χ = 1`, `2 = 2·1` | holds | r4 |
| I7.2 `∏ x coth(x/2)` vs `L`; numbers | dim 2ℓ; ℂP², K3, S², S⁴ | top degree agrees; `1`, `−16`, `0`, `0` | holds | r4 |
| I7.3 numbers | ℂP¹ `O(k)`; ℂP² `O(k)` | `k + 1`; `(k+1)(k+2)/2` | holds | r4 |
| I7.4 `O(p)`; `(d + d*)A = B∂̄`; complex structures; genus 2 | `e_in = z⁻¹ e_out`; `u = z̄`; `A(i·)` vs `I·A`; `T² # T²` | degree +1, `deg K = −2`; total `2dx`; both `(−g, −f vol)`; `−1`, `χ = −2` | holds | r4 |
| I7.5 `8·ind D⁺ = −σ`, `σ = −16α` | K3 both orientations | `Â = 2`, `α = ±1` | holds | r4 |
| I7.6 odd dimension; `d/dx + c` | fibre negation, n odd; `c ∉ iℤ` | `index = −index`; index 0 | holds | r4 |
| I8.3 ℂP¹, `f(z) = qz`; elliptic translation | O(1) lift; trivial line | `1 + q`; `1`; `1 − 1 = 0` | holds | r4 |
| I8.4 circle action | `g = λ` | `1/(1−λ⁻¹) + 1/(1−λ) = 1` | holds | r4 |
| Lean `exists_index_eq` hypotheses | `E = F = ℂ`; `E = ℓ²`, `F = ℓ² ⊕ ℂ` | excluded by `¬FiniteDimensional`; unitary exists, conclusion holds | right hypotheses | r4 |

No statement of the roadmap is refuted, and no Check contradicts a theorem or a supplier sentence: the contradiction the previous R01 found between lines 145–147 and I1.5's first Check is gone.

## Not verifiable

- No changed passage adds or alters a source locator; the untouched sampled locators were verified in the earlier reviews against author-archive copies of Atiyah–Singer I, Atiyah–Bott II and Atiyah's QJM paper, and against Freed (arXiv 2107.03557), and were not re-read.
- Ownership against open pull requests: the changed passages introduce no new object; the previous review's `roadmaps grep` sweep for I1.5's statements and the density theorem was not repeated.

## Source issues

- none
