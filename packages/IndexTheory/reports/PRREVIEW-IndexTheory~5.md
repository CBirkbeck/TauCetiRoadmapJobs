# Review of IndexTheory (pull request #1077 at 75046fc)

**Verdict:** needs changes

Incremental re-review of the 92 README lines changed since 6a51fc7 (`Suggested.lean` and `metadata.toml` are unchanged; nothing outside the folder changed). The gate passes on my rerun and the dependency check reports no problem. There are two P3 findings and nothing blocking. Both come from the repairs of the previous R04 and R05.

## R01 (P3) — The Mathlib contract misstates when `Unitary.argSelfAdjoint` is `0`, and I1.5's *Needs:* omits the Mathlib inputs its route now uses

Location: `TauCetiRoadmap/IndexTheory/README.md` lines 144–145 ("the principal argument of a unitary through the continuous functional calculus (it is `0` on a unitary whose spectrum meets the negative real axis)"); line 481 (I1.5 "*Needs:* OperatorTheory SelfAdjointSpectralTheory Part B and PolarDecomposition."); Layer 1 Dependencies, lines 544–547 ("Mathlib's Fredholm and snake-lemma APIs; …").

Claim: `Unitary.argSelfAdjoint u = 0` whenever `−1 ∈ σ(u)`.

Witness: Mathlib `Analysis/CStarAlgebra/Unitary/Connected.lean:124` defines it as `cfc (arg ·) u`, which is `0` only where `arg` is discontinuous on the spectrum. At the pin, `argSelfAdjoint (−1 : unitary ℂ)` elaborates to `π`, with `−1 ∈ σ(−1)`; I1.5's Check (lines 472–474) agrees.

The second point: I1.5's route (lines 455–462) now takes `selfAdjoint.expUnitary`, `selfAdjoint.expUnitaryPathToOne` and `Unitary.mem_pathComponentOne_iff` from Mathlib, but neither the target's *Needs:* nor the layer's Dependencies names them. Other targets list their Mathlib inputs (I1.4, lines 448–449: "Mathlib `CStarRing.norm_one`").

Repair: replace the parenthetical at lines 144–145 by "(it is `0` when the principal argument is not continuous on the spectrum, as for the bilateral shift; on `U = −1` it is `π`)". Add "Mathlib `selfAdjoint.expUnitary`, `selfAdjoint.expUnitaryPathToOne` and `Unitary.mem_pathComponentOne_iff`" to line 481, and "Mathlib's unitary exponential and path API" to line 544. Tested on four unitaries. On `U = −1` the corrected text gives `π`, as Check 1 says and as the Lean probe computes. On the bilateral shift it gives `0`, since `arg` jumps from `−π` to `π` at `−1` (Check 2). On `diag(1, −1)` on ℂ², whose spectrum `{1, −1}` is discrete, it gives `diag(0, π)`. On a unitary with spectrum the arc `{e^{iθ} : θ ∈ [π/2, π]}`, `arg` is continuous on the spectrum, so the value is nonzero although the spectrum contains `−1`.

## R02 (P3) — "CompactGroups Layer 5" names a layer that CompactGroups' open revision gives to compact abelian Fourier theory; cite the density contract by its slug

Location: `TauCetiRoadmap/IndexTheory/README.md` line 232 ("The G-finite density theorem that T6.1 applies is CompactGroups Layer 5's"), line 265 ("this is the Layer 5 contract"), lines 841–843 ("Apply CompactGroups Layer 5's G-finite density theorem"), line 858 ("*Needs:* … RepresentationTheory CompactGroups Layer 5 (`gap:banach-gfinite-density`)").

Claim: the Banach G-finite density theorem is CompactGroups Layer 5's.

Witness: main's CompactGroups Layer 5 (`RepresentationTheory/CompactGroups/README.md` line 318) is Peter–Weyl, without G-finite density. At CompactGroups' open revision #1047 (5ccf6ccf), Layer 5 (line 641) is compact abelian Fourier theory; the contract is filled at §2.1 (lines 411–490; slug at 1285–1289).

This repair followed the previous review's own R04 repair text, which proposed "Layer 5". TopologicalKTheory on main (lines 86 and 1213) and AutomorphicFormsOnReductiveGroups (#1037, lines 83, 303, 309–310) record the contract the same way. I rate it P3 rather than the P2 of a dropped supplier id: the slug identifies the contract, the revision keeps that slug, and main's Layer 5 never stated the theorem. The layer number is a locator that goes stale.

Repair: delete "Layer 5" at the four places. Cite "CompactGroups, under the contract `gap:banach-gfinite-density`", the form lines 63–64 already use for GeometricTopology's contract. Line 265 becomes "this is the contract that TopologicalKTheory T6.1 consumes for its section actions". Tested at both heads. On main the slug resolves to TopologicalKTheory T6.1's declared contract (line 1213), whose wording matches lines 262–265. At the revision's head it resolves to §2.1's `gFiniteSubmodule_dense`. Its hypotheses there are a compact Hausdorff group, a complex Banach space, continuous linear automorphisms and continuous orbit maps, the same as lines 262–264. Neither head leaves the citation pointing at the wrong layer.

## Previous findings

- R01 — repaired: lines 63–65 now read "The smooth classification of compact surfaces: **GeometricTopology**, under the contract `gap:smooth-surface-classification` of the supplier contracts"; lines 249–254 state what is needed; lines 1475–1476, 1504–1505 and 1565–1566 cite the contract. No "Layer 1.7" remains, so no citation resolves only at an open revision.
- R02 — repaired: "CStarAlgebras C1.3" at lines 54, 185, 736, 750 and 761, and no "C1.1" remains. On main C1.3 (heading line 305) states closed ideals, quotient C*-algebras and "spectral permanence for C*-subalgebras" (lines 322–329).
- R03 — repaired. Lines 216 and 584 now read "PseudodifferentialOperators P4.2's square partition". The previous witness was wrong: on main, P4.2 line 891 constructs "square partitions Σχ_j²=1 and their symmetric bundle quantization", with a Check at 909. That text dates from when the roadmap was added.
- R04 — repaired: lines 841–844 apply CompactGroups' density under `gap:banach-gfinite-density` "as TopologicalKTheory T6.1 does for the sup and L² norms". Lines 228–231 keep T6.1 for the section actions and the finite equivariant embedding (T6.1 main lines 1216–1230). The layer number this repair introduced is R02 above.
- R05 — repaired: lines 139–147 list `selfAdjoint.expUnitary`, `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint`, `Unitary.argSelfAdjoint`, `selfAdjoint.expUnitaryPathToOne`, `selfAdjoint.joined_one_expUnitary`, `Unitary.joined` and `Unitary.mem_pathComponentOne_iff`. I1.5 (lines 453–464) is reduced to the Borel-argument step. The misdescription and the *Needs:* gap are R01 above.

## Verified sound

**Gate** (my rerun at 75046fc):

```
gate IndexTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's `gate.md` adds `build=0` for the targeted build.

**Dependency check** (`gate --depcheck … --movable`), output in full:

```
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists IndexTheory at 10, after OperatorKTheory at 9. The new contracts are addressed to roadmaps on main (GeometricTopology, RepresentationTheory/CompactGroups).

**Elaboration.** I ran `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` lines for its three declarations and eleven Mathlib pins appended. The only diagnostics for the file's own declarations are `declaration uses sorry` at lines 48 and 60. The elaborated types are unchanged from `signatures.md` and the previous review: `normPath_iff_index_eq` and `exists_index_eq` carry `[InnerProductSpace ℂ _] [CompleteSpace _]` on both spaces, and no binder is lost. `Suggested.lean` is byte-identical to 6a51fc7, so the previous one-tactic probe (`simp` makes no progress, `exact?` fails on both theorems) and the headline audit carry over. The one statable headline, the norm-path classification of Fredholm maps with the image of the index, is stated. The module docstring names the Layer 5.5, 6.1, 7 and 8.3 headlines with their missing carriers. The same scratch file also checks:
- `noncomputable example … : CStarAlgebra (H →L[ℂ] H) := inferInstance` elaborates, so the `Unitary.*` API applies to `B(H)`.
- `Unitary.argSelfAdjoint (−1 : unitary ℂ) = π`, by `cfc_algebraMap` and `Complex.arg_neg_one`.
- `−1 ∈ spectrum ℂ (−1)`, by `spectrum.scalar_eq`.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, by file and `#check`):
- `selfAdjoint.expUnitary` (`Analysis/CStarAlgebra/Exponential.lean:37`): `exp(I • a)`, for a complete normed ℂ-algebra with continuous star and `StarModule`.
- `NormedSpace.exp` (`Analysis/Normed/Algebra/Exponential.lean:128`, inside `namespace NormedSpace`, lines 96–696) and `NormedSpace.exp_mem_unitary_of_mem_skewAdjoint` (same file, line 540).
- In `Analysis/CStarAlgebra/Unitary/Connected.lean`:
  - `Unitary.argSelfAdjoint` (124, `[CStarAlgebra A]`);
  - `selfAdjoint.expUnitaryPathToOne` (288, type `Path 1 (expUnitary x)`, so the direction is from `1` to `expUnitary x`, as the README says);
  - `selfAdjoint.joined_one_expUnitary` (296);
  - `Unitary.joined` (312, `‖v − u‖ < 2`);
  - `Unitary.instLocallyPathConnectedSpace` (331);
  - `Unitary.mem_pathComponentOne_iff` (337, finite lists of `expUnitary` factors).
- `cfc_algebraMap` (`ContinuousFunctionalCalculus/Unital.lean:695`), `Complex.arg_neg_one` (`SpecialFunctions/Complex/Arg.lean:208`), `Unitary.coe_neg` (`Algebra/Star/Unitary.lean:462`).
- Tau Ceti 2fd255d9, for the gaps and for ownership:
  - `KnotTheory/Cobordism.lean:58` says the classification of compact surfaces "is not proved here", and Tau Ceti has no surface classification.
  - Tau Ceti has no G-finite predicate or density theorem: grep for `gFinite`, `IsGFinite` and "G-finite" is empty. `ContRepresentation.integratedOperatorL1` is native and is §2.1's proof input at CompactGroups' revision, not the theorem.
  - `Analysis/Matrix/UnitaryGroup/Connected.lean:76` and `Analysis/Matrix/GeneralLinearGroup/Connected.lean:46` prove `U(n)` and `GL(n, ℂ)` path-connected. These are finite-dimensional cases, so I1.5's Hilbert-space statements duplicate nothing.

**Cross-roadmap citations in the changed passages, resolved:**
- CStarAlgebras C1.3, main lines 305–329.
- PseudodifferentialOperators §4.2, main lines 810–913: the square partition at 891, its Check at 909, the continuous quantization and the lift of symbol homotopies at 836–847.
- TopologicalKTheory: line 86, and T6.1 at lines 1210–1230. The sup-norm and L² section actions, the density applied to "these two spaces", and the finite equivariant embedding all match lines 228–231 and 844.
- RepresentationTheory/CompactGroups: main headings 205–390; the revision #1047 (5ccf6ccf) at lines 411–490, 641 and 1281–1289.
- SelfAdjointSpectralTheory Part B (main line 252): SA-B05 gives the Borel calculus of a normal bounded operator, which covers the Borel argument of a unitary in I1.5.
- GeometricTopology: main headings 26–1166 contain no surface classification. At the head of #903 (fa2b5cc0), §1.7 (lines 1021–1072) states the classification and `rank H₁(F; ℚ) = 2g`, word for word what the contract at lines 249–254 needs.
- ComplexKahlerGeometry at the heads of #1807 and #1808, line 109: "GeometricTopology owns the smooth classification of compact surfaces".

**Declared contracts.**
- Both are precise. Each names its supplier and states the hypotheses (compactness, connectedness, the standard models with `b` boundary components and `k ≥ 1` crosscaps; a compact Hausdorff group, a complex Banach space, continuous orbit maps).
- Both are minimal: nothing at the pins or on main provides either.
- `gap:banach-gfinite-density` repeats, word for word, the contract TopologicalKTheory declares.
- Remark, not a finding: this roadmap has no `design/plan.json`, so the intake does not announce `gap:smooth-surface-classification`. `gap:banach-gfinite-density` is already declared by TopologicalKTheory and AutomorphicFormsOnReductiveGroups.
- Remark, not a finding: the competing GeometricTopology revision #1797 excludes the classification of compact surfaces (its README line 151), while #903 states it at §1.7. The contract stands against whichever lands.

**Ownership.** `roadmaps grep` over main and the 466 open heads:
- The infinite-dimensional statements of I1.5 (every unitary is `exp(iA)` with `‖A‖ ≤ π`; `GL(H)` is norm-path-connected) are stated nowhere else. The closest are OperatorKTheory #866 line 569 (finite-dimensional A) and CStarClassification #863 line 466 (unital AF algebras).
- The smooth surface classification is deferred to GeometricTopology. Other open claimants state the topological classification and are not suppliers: TeichmullerGeometry #1169 §0.0f, MordellLawrenceVenkatesh #1231 §5.4, and SurfaceTopology #271, which this roadmap must not cite.

**Sources: the seeded sample.**
- Of the sampled targets, I1.5, I2.6 and I7.4 fall in the changed passages. None carries a source locator. Their changed inputs are the roadmap and Mathlib citations resolved above.
- I2.2's square-partition citation is not sampled but changed; it is resolved above.
- The other sampled targets (I1.4, I2.1, I3.3, I4.1, I5.5, I6.1, I6.2, I7.1, I7.6, I8.1–I8.3) are untouched by the diff and were not re-read. The previous review checked I5.5, I6.2, I7.6 and I8.2–I8.3 against Atiyah–Singer I, Freed and Atiyah–Bott II, and its adversarial rows cover I1.4, I2.1, I3.3, I6.1 and I7.1.
- The README flags no locator as unverified.

**Remark on the citation tool.** The "PseudodifferentialOperators P4.2" lead in `citations.md` (line 584) is a false positive: §4.2 sits under the layer labelled P4 (main lines 782 and 810).

**Adversarial table, changed statements** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| Mathlib contract: when `Unitary.argSelfAdjoint` is `0` (lines 144–145) | `U = −1` on ℂ; `diag(1, −1)` on ℂ²; bilateral shift; spectrum the arc `θ ∈ [π/2, π]` | `σ = {−1}`, value `π` (Lean), README says `0`; `σ = {1, −1}` discrete, `diag(0, π)`; `σ` the circle, `arg` jumps at `−1`, value `0`; `arg = θ` continuous, value ≠ 0 | refuted, R01 |
| I1.5 `selfAdjoint.expUnitary A = U`, `‖A‖ ≤ π` | `U = −1`; `U = 1`; `H = 0`; bilateral shift | `A = π`, `exp(iπ) = −1`; `A = 0`; both sides the zero operator; `A` = multiplication by `θ ∈ (−π, π]` on `L²(S¹)`, `‖A‖ = π`, `exp(iA) = e^{iθ} = U` | holds |
| I1.5 path `expUnitaryPathToOne A` | `t = 0, 1` | `expUnitary 0 = 1` (`expUnitary_zero`), `expUnitary (1 • A) = U`; elaborated type `Path 1 (expUnitary x)` | holds |
| I1.5 `mem_pathComponentOne_iff` with a single factor | `l = [A]` | `(l.map expUnitary).prod = expUnitary A = U` | holds |
| I1.5 `GL(H)` path-connected | `T = U|T|`, `σ(|T|) ⊆ [m, M]`, `m > 0` | `σ((1−t)|T| + t·Id) ⊆ [min(m,1), max(M,1)] ∌ 0`; unitary leg `expUnitary((1−t)A)` | holds |
| I2.6 C1.3 permanence (line 736) | `π(S)` in `C*(π(S))` ⊂ Calkin; disc algebra in `C(S¹)` | `π(S)` unitary, inverse `π(S)*` in the star subalgebra; `z` invertible in `C(S¹)` but not in the non-self-adjoint disc algebra (no holomorphic `1/z`), so star-closure is needed, which C1.3 assumes and the symbol algebra has | holds |
| I2.2 P4.2 square partition (line 584) | `χ₁ = χ₂ = 1/√2`; `φ₁ = φ₂ = 1/2` | `Σχ² = 1`, `Σχ = √2` (PDO line 909); `Σφ = 1`, `Σφ² = 1/2`, symmetric patching has symbol `σ/2` | holds |
| I3.4 with `gap:banach-gfinite-density` (lines 262–265, 841–844) | `G = {1}`; `S¹` on `C(S¹)` and `C¹(S¹)`; `S¹` on `L^∞(S¹)`; `ℝ` on `C₀(ℝ)` | every vector G-finite; trigonometric polynomials dense in sup and in `C¹` (Fejér, `(σ_N f)′ = σ_N(f′)`); `L^∞`: orbit maps discontinuous, closure of trigonometric polynomials is `C(S¹) ≠ L^∞`; `ℝ`: finite translate spans are exponential polynomials, only `0` in `C₀` | holds; orbit continuity and compactness both needed and stated |
| I7.4 with `gap:smooth-surface-classification` (lines 1473–1477) | `T² # T²` vs genus-2 Σ; `S²` vs `ℝP²`; `T²` vs Klein bottle; plane vs open annulus | `rank H₁ = 4, 4`, both `g = 2`, same model; `b₁ = 0, 0` but orientability differs; `b₁ = 2, 1`; both genus 0, not diffeomorphic | holds; orientability (holomorphic atlas, complex structure) and compactness are in scope |

**Adversarial table, rows carried from the previous review** (r4, at 6a51fc7) for the statements the diff leaves untouched. The r4 row for I1.5's exponential identity is replaced by the rows above.

| Statement | Instances | Values | Result | From |
|---|---|---|---|---|
| I1.1 Check: `T₀ = 0 : ℂ² → ℂ` | K = ℂ², X = 0, R = 0, C = ℂ | reduced map `0 : ℂ² → ℂ`, index `2 − 1 = 1`; reversed convention −1 | holds | r4 |
| I1.1 `range(T*T) = range(T*) = (ker T)^⊥` for Fredholm T | nilpotent `[[0,1],[0,0]]` on ℂ² | `ker T = range T = ⟨e₁⟩`, `T*`, `T*T` have range `⟨e₂⟩ = (ker T)^⊥`; `range T ≠ (ker T)^⊥` | holds for `T*`, `T*T`; the Check is a correct negative control for T | r4 |
| I1.1 transverse subspace, finite V | `T₀ = diag(1,0)`, `V = ⟨e₁⟩`, `T = diag(1,ε)` | `(T₀V)^⊥ = ⟨e₂⟩`; ker, coker of T vanish; `1 − 0 = 1 − 0` | holds | r4 |
| I1.1 infinite version | `V = (ker T₀)^⊥`, `(T₀V)^⊥ = coker T₀` | `dim ker T ≤ dim ker T₀`, `dim coker T ≤ dim coker T₀`, index constant (AS I lines 1355–1362) | holds | r4 |
| I1.2 snake Check 1 | `0 → ℂ → ℂ² → ℂ → 0`, middle `(x,y) ↦ (y,0)` | squares commute (`(x,0) ↦ (0,0)`; `p(y,0) = 0`); six terms ℂ; `ker T_m → ker T_r` is `(x,0) ↦ 0`; `δ(y) = [(y,0)] = y` | holds | r4 |
| I1.2 snake Check 3 | `a : δ_n ↦ δ_{2n}`, `d(y) = (y₁,y₃,…)`, `b(y) = Σ y_{2n} δ_{2n+1}` | `(x,y) ↦ (ax + by, dy)` bijective: odd coordinates of y from `dy`, even ones from `u_odd = by`, x from `u_even = ax`; `δ : ker d → coker a` is `y ↦ [by]`, even onto odd coordinates | holds; neither a nor d Fredholm | r4 |
| I1.2 shifts | `S ⊕ S*` over `S`, `S*` | `−1 + 1 = 0` | holds | r4 |
| I1.3 backward shift | `(Bu)_n = u_{n+1}` | surjective, `ker = ⟨δ₀⟩`, index +1 | holds as negative control | r4 |
| I1.3 `T = 0 : ℂ → ℂ²` | | `dim coker = 2`, minimum 2 functionals, `dim ker = 1`, index −1 | holds | r4 |
| I1.3 integral equation | `f = g = i` on [0,1] | `⟨i,u⟩ i = (−i∫u) i = ∫u`; `(Id + K)c = 2c`; bilinear slot: `−∫u`, kernel ⟨1⟩; `f = 1`, `g = −1`: `1 + ⟨g,f⟩ = 0`, solvable iff `∫h = 0` | holds | r4 |
| I1.4 `‖π(Id)‖` | ℓ²(ℕ); ℂ²; H = 0 | `‖(Id − K)δ_k‖ → 1` so 1; `K(H) = B(H)`, quotient 0, norm 0; 0 | holds | r4 |
| I1.4 shift unitary in Calkin | S on ℓ²(ℕ) | `S*S = 1`, `SS* = 1 − e₀₀`, `π(SS*) = π(1)` | holds | r4 |
| I1.5 over ℝ | `Id`, `−Id` on ℝ | determinant signs differ | correct negative control | r4 |
| I1.6 `normPath_iff_index_eq` | `E = ℂ²`, `F = ℂ`; `E = ℓ²`, `F = ℂ`; `E = F = ℓ²` | all maps Fredholm of index 1, straight path; locus empty, vacuous; `Id`, `S`, `S*` indices 0, −1, +1 in three components | holds | r4 |
| I1.6 `exists_index_eq` | `E = F = ℓ²(ℝ)` | shift on a countable orthonormal family, identity on its complement: index −1; powers give ℤ | holds without separability | r4 |
| I1.6 nonempty locus | `ℓ²(ℕ) → ℓ²(ℝ)` | Hamel ranks both continuum; Hilbert dimensions ℵ₀, continuum; a closed finite-codimension range would be separable and nonseparable | holds; Hamel rank is the wrong invariant | r4 |
| I2.1 point | `(ℂ³, ℂ, 0)` | class `3 − 1 = 2`, cosphere empty | holds | r4 |
| I2.3 adjoint sign | `(ℂ^b, ℂ^a, 0)` | `b − a = −(a − b)` | holds | r4 |
| I2.4 arrows vs complex | `d : Ω⁰ → Ω¹` on S² and S¹ | ranks 1 → 2 (not surjective); 1 → 1 with symbol `iξ` (elliptic) | holds | r4 |
| I2.4 folded de Rham index | S¹; S² with any metric | `1 − 1 = 0`; `1 − 0 + 1 = 2` | holds | r4 |
| I2.5 block rotation | `t = 0`, `t = π/2` | `diag(σ, σ*)`; `[[0,−Id],[Id,0]]` | holds | r4 |
| I2.5 cut-and-paste rotation | `φ² + ψ² = 1` | `u₃ = φu₁ + ψu₂`, `u₄ = φu₂ − ψu₁` unitary, A/C end identity, B/D end swap with sign | holds | r4 |
| I2.5 common principal part | `p₁ = d/dx`, `p₂ = 2 d/dx` | off-diagonal `φψ(p₂ − p₁) = φψ d/dx`, order 1, not compact `H¹ → L²` | hypothesis not removable, as stated | r4 |
| I2.5 Dolbeault cut-and-paste | `(g,h) = (0,0), (1,1), (2,3)` | `(1−g−h) + 1` vs `(1−g) + (1−h)`: 2 = 2; 0 = 0; −3 = −3 | holds | r4 |
| I2.6 dimension 0 | M finite | `L²` finite, `K = B`, quotient 0, `C(∅) = 0` | holds | r4 |
| Conventions `z = v − ix` | `(x,v) = (1,0)`, `(0,1)` | `−i`, `1`; conjugate convention reverses the normal plane's orientation | holds | r4 |
| Conventions sign `(−1)^{n(n−1)/2}` and I6.1 total | n = 1,2,3,4 | `(−1)^n·(−1)^{n(n−1)/2}` = −1, −1, +1, +1 = `(−1)^{n(n+1)/2}` | holds | r4 |
| I3.2 composite normal bundle | `ν_{g∘f} = ν_f ⊕ f*ν_g` | `(−1)^{r_f + r_g} det ⊗ det = (−1)^{r_{g∘f}} det` | holds | r4 |
| I3.3 diagonal embedding | `(cos t·j₀, sin t·j₁)` | injective for `t ∈ (0, π/2)`; endpoints `j₀`, `j₁` | holds | r4 |
| I3.5 normalization | `0`, `2·ind_t` | values 0, 2 at the point, excluded | holds | r4 |
| I3.5 `R(O(1))` | | `ℤ[sgn]/(sgn² − 1)`; normalization fixes 1 | holds | r4 |
| I4.3 graded product | `(ℂ²,ℂ,0) ⊠ (ℂ,ℂ³,0)` | even `2·1 + 1·3 = 5`, odd `2·3 + 1·1 = 7`, `5 − 7 = −2 = 1·(−2)` | holds | r4 |
| I4.4 point fibre | `Q = 0 : ℂ^p → ℂ^q` | `ind_a(a)·(p − q)` | holds | r4 |
| I4.4 scalar action | `c = i` | `(iP, −iP†)`; `⟨iPu, v⟩ = ⟨u, −iP†v⟩` | holds | r4 |
| I5.1 sphere index | S¹ with O(1); S² with O(2) and SO(2) | `1 − sgn` (dim 0 = χ); `1 + det` (dim 2); 2 trivial | holds | r4 |
| I5.1 `κ*w = (−1)^n det·w` | `κ : z ↦ −z̄` | conjugation of the Koszul complex gives the dual class `(−1)^n det⁻¹ w`, det self-inverse; n = 1: `−sgn` | consistent with Conventions line 113 | r4 |
| I5.2 Toeplitz operator | `A = e^{ix}P_{≥0} + (1 − P_{≥0})` | `e^{ikx} ↦ e^{i(k+1)x}` for k ≥ 0, fixed for k < 0; ker 0, coker the constant mode, index −1 | holds (ToeplitzOperators line 22) | r4 |
| I5.2 `R(O(1))` algebra | `b = a + c·sgn` | `(1 − sgn)b = (a − c)(1 − sgn)`; `a − c = 1`, `a + c = 1` ⇒ `a = 1`, `c = 0`; `1 + c(1 + sgn)` is the ambiguity without the dimension condition | holds | r4 |
| I5.3 rotation plane | rotation by θ | `R(1,−i)ᵀ = e^{iθ}(1,−i)ᵀ`; real and imaginary parts `e₁`, `−e₂` | holds | r4 |
| I5.3 detection | det on `SO(2)` vs on diagonal `O(1)×O(1)` | trivial vs `sgn ⊗ sgn` | holds | r4 |
| I6.1 circle operator | `−w`, `Td = 1`, `ch_c(β) = −U_ℂ` | `∫ ch_c(−w) = +1`, prefactor −1 gives −1 = ind A | holds | r4 |
| I6.3 Euler class | `SO(3)` on ℝ³; `U(n)` on ℂⁿ | `e = 0` rationally; `e = c_n = x₁⋯x_n`, a non-zero-divisor | holds | r4 |
| I6.4 numbers | genus g; ℂP²; K3 | `Td₁ = (2 − 2g)/2 = 1 − g`; `p₁/3 = 1 = σ`; `−p₁/24 = 48/24 = 2` | holds | r4 |
| I7.1 `d* = (−1)^{m(k+1)+1} ⋆d⋆` | m = 2, k = 1, `f dx` on ℝ² | `−⋆d⋆(f dx) = −⋆(∂_x f dx∧dy) = −∂_x f`; `d*d = −Δ ≥ 0`, the other sign makes it negative | holds | r4 |
| I7.1 ℝP² | | `χ = 1`, twisted Euler number 1, double cover `2 = 2·1` | holds | r4 |
| I7.2 `∏ x coth(x/2)` vs `L` | dimension 2ℓ | `2^ℓ ∏ (x/2)/tanh(x/2)`; degree-ℓ term rescales by `2^{−ℓ}` | agree in top degree only, as stated | r4 |
| I7.2 numbers | ℂP², K3, S², S⁴ | `3/3 = 1`; `−48/3 = −16`; `H¹ = 0`, index 0; `0 = 0` | holds | r4 |
| I7.3 numbers | ℂP¹ `O(k)`; ℂP² `O(k)` | `k + 1`; `(k+1)(k+2)/2 = 0` at k = −1, −2 | holds | r4 |
| I7.4 `O(p)` | `e_in = z⁻¹ e_out` | canonical section `z` inside, one simple zero, degree +1; `deg K = 2g − 2 = −2` on ℂP¹ | holds | r4 |
| I7.4 `(d + d*)A = B∂̄` | `u = z̄ = x − iy`, `⋆dx = dy`, `⋆dy = −dx` | `∂̄u = dx − i dy`, `B = 2dx`; `A(u) = (x, y vol)`, `d*(y vol) = −⋆d⋆(y vol) = −⋆dy = dx`, total `2dx` | holds | r4 |
| I7.4 complex structures | `A(i(f+ig))` vs `I·A(f+ig)` | both `(−g, −f vol)`; `B(iη) = ⋆B(η)` | A, B complex-linear | r4 |
| I7.4 genus 2 | trivial line; `T² # T²` | `1 − 2 = −1`, real `2 − 4 = −2`; `χ = −2`, `b = 0`, genus 2 | holds | r4 |
| I7.5 `8·ind D⁺ = −σ`, `σ = −16α` | K3 both orientations | `Â = 2`, `16 = −(−16)`, `α = 1`; reversed: `σ = 16`, `ind = −2`, `α = −1` | holds | r4 |
| I7.6 odd dimension | fibre negation on `T*M`, n odd | degree `(−1)^n = −1`; symbol scaled by `(−1)^m`, phase-homotopic; `index = −index` | holds; the circle Toeplitz operator (index −1) is the stated non-example | r4 |
| I7.6 `d/dx + c` | `c ∉ iℤ` | `e^{−cx}`, `e^{c̄x}` not periodic; index 0 | holds | r4 |
| I8.3 ℂP¹, `f(z) = qz` | O(1) lift with fibre values 1, q; trivial line | `1/(1−q) + q/(1−q⁻¹) = (1−q²)/(1−q) = 1 + q` = trace on linear sections; `1/(1−q) − q/(1−q) = 1`; with `det(1 − df⁻¹)`: 0 | holds | r4 |
| I8.3 translation of an elliptic curve | | no fixed points; `H⁰(O)`, `H¹(O)` both ℂ with trivial action; `1 − 1 = 0` | holds | r4 |
| I8.4 circle action | `g = λ`, `f = g⁻¹` | multiplier `λ⁻¹` at 0; `1/(1−λ⁻¹) + 1/(1−λ) = 1` | holds | r4 |
| Lean `exists_index_eq` hypotheses | `E = F = ℂ`; `E = ℓ²`, `F = ℓ² ⊕ ℂ` | excluded by `¬FiniteDimensional`; a unitary `E ≃ₗᵢ F` exists, conclusion holds | hypotheses are the right ones | r4 |

No statement of the roadmap is refuted. No Check contradicts a theorem of its section: the only contradiction is R01's, between a supplier-contract sentence and a Check.

## Not verifiable

- No changed passage adds or alters a source locator. The untouched sampled locators were verified in the previous review against author-archive copies of Atiyah–Singer I, Atiyah–Bott II and Atiyah's QJM paper, and against Freed (arXiv 2107.03557). I did not re-read them.
- Ownership against open pull requests was checked through `roadmaps grep`, `roadmaps list` and `roadmaps show`, and against the sibling checkouts the brief provides (CompactGroups #1047, GeometricTopology #903). GeometricTopology #1797 was read through `roadmaps show --pr 1797`.

## Source issues

- none
