# GATE-PseudodifferentialOperators~2 — answers to human review

Review answered: rwst, 2026-10-30T10:17:52Z (written against head `4806639`; answered at `686f196`, repaired in `636402f`).

## H01 (rwst) — answered
At the current head the README cites no UnboundedOperators target: grep for `UnboundedOperators` and `UO-D06` in `TauCetiRoadmap/PseudodifferentialOperators/README.md` returns nothing, and P7a uses ComplexKahlerGeometry K5a's `H²` realization of the scalar Laplacian directly (README P7a, "realization used throughout P7a is K5a's `H²` realization"). The only open-PR supplier left is SmoothBundlesConnections B2–B4, which sits directly above this roadmap in the merge order (line 7 vs. line 8 of the merge order), so the merge-order block for the description is `SmoothBundlesConnections → PseudodifferentialOperators`. The block goes in the pull-request description, which is outside the two files this job edits; the worker updates it.

## H02 (rwst) — answered
The three stale description sentences (the "Suggested.lean and metadata.toml unchanged" claim, the CI line pinned to `063cf51`, and calling the RiemannianGeometry R4.7 PR a "companion" when it has merged) are in the pull-request description, not in the roadmap files. They are handed to the worker to refresh along with the merge-order block from H01.

## H03 (rwst) — answered
No repair asked for. At the current head the closed-form/Friedrichs interface is no longer a P7a prerequisite. P7a defines `Δ = L − 1` on K5a's `H²` domain, proves isometry invariance on `H¹`/`H²` by P5 density, and gets reducing subspaces `L²(X)^H` from the finite averaging projection. So the route the review checked through UO-D06 uniqueness is not needed, and the "unique closed-form operator" step does not appear.

## H04 (rwst) — answered
No repair asked for. Clarifications 1–3 (the P4 full-symbol example `−y²∂_y² ↦ −∂ₓ²+∂ₓ`, the Bochner density example `e^(sin x)dx` with `ω = ½cos x dx`, and the P7 factor domains and chiral index) are still in the README at the current head.

## H05 (rwst) — applied differently
The "not statable" claim was wrong. Real and imaginary parts are compositions with `Complex.reCLM`/`imCLM`, and the target tensor `ℂ ⊗[ℝ] ContMDiffSection …` needs only the tensor-product module structure, which exists at the pin. Suggested.lean now has `instance realComplexContMDiffRing : ContMDiffRing 𝓘(ℝ, ℂ) ∞ ℂ` (a real proof), `complexSmoothConstants`, `complexSmoothFunctionsAlgebra`, `ofRealSmooth`, and `theorem exists_complexDerivationEquivComplexifiedVectorField`. The theorem says there is a ℂ-linear `e : Derivation ℂ A_ℂ A_ℂ ≃ₗ[ℂ] ℂ ⊗[ℝ] Γ∞(TM)` with `e δ = 1 ⊗ₜ X + I ⊗ₜ Y ↔ ∀ u x, δ (ofRealSmooth u) x = df_x(X x) + df_x(Y x)·I`, and the "not statable" bullet is removed from the docstring. A bare `∃ e, …` would be nearly empty: two ℂ-vector spaces of equal dimension are always isomorphic. The `063cf51` version was a sorry'd `def`, which is now forbidden. The iff pins `e` down completely because `1, i` is a real basis of ℂ. A README paragraph after the P1.0 complex-dictionary prose names the five declarations and states this.

## H06 (rwst) — disputed
No line added. The review agrees that neither Mathlib pull request is a supplier. README house style allows only timeless, pinned citations, with no pull-request numbers and no "coordination" notes about unmerged work. When either PR merges and the pin moves, the P1.0 supplier contract will cite the resulting declaration by name.

## H07 (rwst) — applied
RelativisticQuantumFieldTheory exists on no branch: `roadmaps grep` finds it only as a name mentioned in other roadmaps' prose, and no roadmap folder carries that name on main or at any open head. Two things were deleted. In P8 (pushforward paragraph), the sentence "This supplies [RQFT5](../RelativisticQuantumFieldTheory/README.md…)'s compact-support functor and [RQFT6](…)'s proper-support integration; Fourier restriction …". In Downstream consumers, the sentence "RelativisticQuantumFieldTheory RQFT5–RQFT6 consumes the wavefront pullback, product and proper-pushforward contracts." The other consumers named there (IndexTheory, RiemannianGeometry, LieGroupoidsPoisson, ContactGeometry, FuchsianOrbifolds) were checked with `roadmaps grep`: each exists and cites PseudodifferentialOperators.

## Signature check
Temporary `#check @…` lines for `exists_complexDerivationEquivComplexifiedVectorField`, `ofRealSmooth`, `complexSmoothFunctionsAlgebra` and `exists_derivationEquivSmoothVectorField` were elaborated in the build and removed afterwards. The new theorem keeps `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]` and the section's `[SecondCountableTopology M]`, the same binders as the real dictionary. That matches the README sentence ("finite-dimensional, Hausdorff, second-countable boundaryless"). `ofRealSmooth` and the algebra instance carry only the manifold data. Nothing needed changing.

## Adversarial pass on changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `exists_complexDerivationEquivComplexifiedVectorField` | M = ℝ, δ = ∂ + 2i∂, u = x² at x = 3 | LHS δ(u)(3) = (1+2i)·6 = 6+12i; RHS with X = ∂, Y = 2∂: 6 + 12·i | agrees | none |
| same, inverse formula vs README Check | δ = ∂+2i∂, f = x²+ix at 3 | (1+2i)(6+i) = 4+13i; Xu−Yv+i(Yu+Xv) = 6−2+i(12+1) = 4+13i | agrees | none |
| same, degenerate M = ∅ | A_ℂ = 0, derivations 0, sections 0, ℂ⊗0 = 0 | e = 0; iff: 0 = 0 ↔ vacuous ∀x∈∅ (true) | holds | none |
| same, M = point (E = 0) | T_xM = 0, Γ = 0; Der_ℂ(ℂ,ℂ) = 0 | both sides 0, iff true for X = Y = 0 | holds | none |
| same, wrong models | e δ = 1⊗Y + i⊗X (swapped); conjugate (1⊗X − i⊗Y) | for δ = ∂+2i∂ the iff would need δ(x²)(3) = 12+6i, resp. 6−12i, vs the true 6+12i | excluded by the iff | none |
| same, vacuity | bare `∃ e` | any two ℂ-spaces of equal dimension are isomorphic | rejected; characterising iff used instead | form chosen |
| `ofRealSmooth` | u = x² | value at 3 is (9 : ℂ), imaginary part 0 | defining property | none |
| `complexSmoothFunctionsAlgebra` | z·1 at a point | (z • 1) x = const z · 1 = z | scalar action = constants | none |
| `realComplexContMDiffRing` | multiplication ℂ×ℂ→ℂ | real-bilinear, hence C^∞ (`contDiff_mul`) | proved, no sorry | none |

## Ownership
The complex smooth-function ring structure `ContMDiffRing 𝓘(ℝ, ℂ) ∞ ℂ` was searched at the pins: there is no instance in Mathlib (only `instFieldContMDiffRing` for `𝓘(𝕜) 𝕜`) and none in Tau Ceti. P1.0 already owned it as a README target, so nothing moved. The four new Lean names reuse no fully qualified name from another roadmap.

## Build and gate
- `lake build TauCetiRoadmap.PseudodifferentialOperators.Suggested`: Build completed successfully (8981 jobs); only `declaration uses sorry` warnings.
- Gate: `gate PseudodifferentialOperators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 207 roadmaps, 1460 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- Commit `636402f`, not pushed. No sources were fetched (no new citations), and `needs-references.toml` was not written.
