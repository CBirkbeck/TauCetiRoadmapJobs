# GATE-HeegaardFloer~1: answers to human review

Head reviewed: `5a38399`. Repair commits: `34b04a4a` (README links) and `c21a5b1a` (`Suggested.lean` Darboux block). Line numbers below are for `TauCetiRoadmap/HeegaardFloer/README.md` at the repair commit.

All seven substantive findings from the two roed-math reviews, and the three nonblocking interface points, are repaired at head `5a38399`. The repairs came in the author's commits after the reviewed heads `e464127`, `77ef61f` and `f34838f`; the last is `f42fce12`, "Construct pointed Heegaard geometry, normalized gradings and raw stable twisted comparisons". Each section below cites the lines where the repair now sits and the values checked against it. This round makes one edit, under H09: cross-roadmap citations that were commit-pinned `blob/<sha>` URLs now use relative links.

## H01 (kim-em) — answered

This is a status note (closed-sphere block, two-cap Bott sphere example, the native complex-PSL Hausdorff instance, 18 admissions) and asks for no change. At this head `TauCetiRoadmap/HeegaardFloer/Suggested.lean` contains the proved `instance pslComplex_t2 : T2Space PSL(2, ℂ)` (line 290) and 19 `sorry`s, which is the count H02 gives.

## H02 (kim-em) — answered

This is a status note (ordinary-Morse additions, F2.7 forced discs, 19 admissions) and asks for no change. The README sections it describes are present at F2.7, line 2235 onward. `Suggested.lean` has 19 `sorry` occurrences at this head, matching the stated count.

## H03 (roed-math) — answered

F1.5's weighted-tail gap is repaired at head, lines 1537–1563. The README now (i) requires and proves `D(E_e(v)) ∈ W^(r−1,p)_δ` with bounded linear dependence on v and C^k parameter estimates, (ii) gives the sufficient condition that the coefficients converge at rate `κ_e > δ_e` through every needed derivative, and states that "an exponential rate with no relation to δ_e is insufficient", and (iii) has F0.7 verify the condition before it uses the theorem. The reviewer's example `D = ∂_s + i∂_t + e^(−εs)` with `ε ≤ δ` has `κ = ε ≤ δ`, so the stated hypothesis excludes it: `e^(δs)·D(χc) = e^((δ−ε)s)c ∉ L^p`.

## H04 (roed-math) — answered

F3's confinement gap is repaired at head, lines 2283–2310. The setting is now a finite-type Liouville completion with compact boundaryless exact Lagrangians, Hamiltonians and continuation data that are constant plus compactly supported, and cylindrical J with `dρ∘J = −λ`. A uniform no-escape theorem (`Δ(ρ∘u) ≥ 0` outside `{ρ<R}`, maximum principle) is assigned before F2.3 is invoked, and lines 2322–2323 say exactness does not supply the image bound. In the reviewer's family `L_a = {y = ax+1}` in ℂ, the Hamiltonian taking `L_0` to `L_a` is not compactly supported (the line moves at infinity), so the family lies outside the allowed class.

## H05 (roed-math) — answered

The Perutz/F4 continuation gap is repaired at head. F4 item 1 (lines 2510–2520) constructs the area-balanced Lagrangian realization with `∫_D α = (1+λ)∫_A α − 2λ` in class `η+λθ`. It says totally-real analysis "does not substitute for the Lagrangian form", which qualifies the old totally-real-only instruction. F4.3a (lines 2541–2554) assigns the triangle/degeneration energy floor, and item 4 (lines 2555–2580) assigns the moving-boundary coupling form, compactness, chain map, inverse, composition, divisor control and the handleslide/triangle comparison. Line 2579 states that the citation does not reduce the result to F3's exact continuation.

## H06 (roed-math) — answered

Reconciliation 2 is repaired at head, lines 3028–3108. Its first theorem is now the completed `𝔽₂[[U]]` comparison for spherical plumbing trees, with the relative grading kept for `b₁(Y) = 0` and the `b₁ > 0` action excluded. R2a assigns the link-surgery hypercube, higher polygons and Hopf/merge models. R2b assigns the filtered homological perturbation with `πi = id`, `iπ − id = dh + hd` and the side conditions. R2c keeps integral coefficients and broader graphs as separate comparison problems and explicitly compares the chain complexes after coefficient change, not reduced homology.

## H07 (roed-math) — answered

The pinned Maslov API is consumed at head, lines 1451–1470: `TauCeti.TotallyRealLoop.maslovIndex`, `maslovIndex_map` and `maslovIndex_prod`, with a homotopy from maximal-totally-real loops to Lagrangian loops before the Robbin–Salamon comparison, and the path/CZ theory assigned here. At the pinned Tau Ceti, `TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean`, `Map.lean` and `Prod.lean` are the files the README names.

## H08 (roed-math) — answered

F0.5 now separates finite regularity from the smooth bootstrap at head, lines 1240–1250. It says the smooth almost-complex carrier "does not stand in for this finite-order parameter space", fixes the budget `ℓ ≥ k+r+1`, limits finite-order bootstrapping to the available derivative budget, and states that completion independence "does not make finite-C^ℓ coefficients smooth". Smooth solutions are obtained only from smooth data.

## H09 (roed-math) — applied differently

F2.6h already cited GeometricTopology Layer 3's compact-source Whitney C^∞ topology and topological-group structure on `Diffeomorph` (line 2173). That section exists on main: "Layer 3: diffeomorphism groups with the C^∞ topology". The citation was a commit-pinned `blob/eb5d2bf…` URL, as were ten other cross-roadmap citations (lines 594, 605, 1725 ×2, 1879, 2245, 2255 ×2, 2275, 2277), and the gate rejects that form (`blob=11`). All eleven now use relative links of the form `../GeometricTopology/README.md` (anchors kept), so the gate reports `blob=0`. Each cited section was checked on main:

- GeometricCurrents G2 and G3
- ComplexKahlerGeometry K7
- HopfRinow Layer 1
- RiemannianGeometry R1 and R5a
- GeometricTopology Layers 1, 3 and 9
- DifferentialGeometry Layers 5.6 and 8
- PDE Lane C
- AlgebraicTopology Stage 6

CalibratedGeometry §C4 was checked at the head of its open pull request, which adds that roadmap folder.

## H10 (kim-em) — answered

This is the author's response to H03–H09 and asks for no change. Each repair it lists is present at head, at the lines cited in H03–H09.

## H11 (roed-math) — answered

Geometric adequacy and admissible connectivity are repaired at head:

- **F4.A (lines 2346–2391)** constructs smooth pointed cut-system diagrams and the represented based Y, and proves extraction and reconstruction against the native `HeegaardRegionSystem`. It consumes GeometricTopology Layer 9 and M.5 Cerf theory for the pointed conversion to isotopies, handleslides and stabilizations (disc-system connectivity by outermost-disc surgery). It keeps basepoint-moving maps.
- **F4.C (lines 2455–2491)** constructs weak and strong fixed-Spin^c admissible representatives by winding, with lattice estimates, and admissible connecting sequences that track Spin^c, domain, basepoint and marking data.
- **F4 item 4 (lines 2581–2585)** uses these to promote diagram equivalences to `HF̂(Y,s)`, with JTZ coherence kept as a separate milestone.

## H12 (roed-math) — answered

Reconciliation 1 is split at head, lines 2967–3022, into R1.raw, R1.stable and R1.twisted, built on F4.M's balanced geometry (lines 2493–2550). F4.M uses `k = g+b−1`, `Sym^k(Σ)`, all divisors `V_(z_i)`, basepoint addition `CF̂_(b+1) ≃ CF̂_b ⊗ W` and the nice-diagram bigon/rectangle count theorem. Values checked:

- **Raw:** `H(CF̂_b) ≅ HF̂(Y) ⊗ W^(⊗(b−1))`, with the factor kept when `b₁ = 0`.
- **Twisted:** the ring is `𝔽[H₂(Y_b;ℤ)]` with `Y_b = Y #^(b−1)(S¹×S²)`, with an additive assignment and diagonal monomial change-of-reference isomorphisms.
- **Twice-pointed S³:** the raw complex has two generators and differential 0, so rank 2. The twisted differential is multiplication by `1+t` on `𝔽[t,t⁻¹]`, which is injective, so the homology is `R/(1+t)`, of rank 1. Augmenting `t ↦ 1` gives differential `1+1 = 0`, recovering rank 2. This agrees with the reviewer's example and with the README text.

## H13 (roed-math) — answered

The grading package is repaired at head. F4.B (lines 2393–2453) constructs `H(P) ∈ H₂(Y;ℤ)` by capping and proves `⟨c₁(s_z(x)), H(P)⟩ = e(P) + 2n_x(P)` and the general form `μ(P) − 2n_z(P) = ⟨c₁, H(P − n_z(P)Σ)⟩`. Check on the class `[Σ]` with `e = 2−2g` and `n_x = g`: `μ = 2`, `n_z = 1`, and both sides are 0. F4.B also defines `d(s)` and the relative `ℤ/d(s)` grading, with `∂` of degree −1, U of degree −2 and move maps of degree 0.

F4.5q (lines 2602–2639) constructs the absolute ℚ-lift for torsion Spin^c structures, normalized so that `HF̂(S³)` sits in degree 0, with cobordism degree `(c₁(t)² − 2χ(W) − 3σ(W))/4`. Numerical d is defined only after that lift. The strong-admissibility definition at lines 2456–2460 (a coefficient greater than r when the pairing is `2r ≥ 0`) matches the reviewer's cited source.

## H14 (roed-math) — answered

This follow-up restates H11 against head `f34838f`. Commit `f42fce12`, which follows that head, adds F4.A and F4.C as described in H11.

## H15 (roed-math) — answered

This follow-up restates H12 against head `f34838f`. Commit `f42fce12` rewrites Reconciliation 1 into R1.raw, R1.stable and R1.twisted, and adds F4.M with the twice-pointed S³ example, as described in H12.

## H16 (roed-math) — answered

This follow-up restates H13 against head `f34838f`. Commit `f42fce12` adds F4.B (the Chern-period identity and the `ℤ/d(s)` grading) and F4.5q (the absolute grading before numerical d), as described in H13.

## Adversarial pass (statements touched by the answers)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| F1.5 weighted tail, κ_e > δ_e | `D = ∂_s + i∂_t + e^(−εs)`, `A_e = −i∂_t`, gap 2π | ε ≤ δ: `e^(δs)D(χc) = e^((δ−ε)s)c ∉ L^p`, so excluded; ε > δ: the same expression decays, so it is in `L^p` | consistent | none |
| F3 compact-support class | `L_a = {y = ax+1}` in ℂ | the generating Hamiltonian is unbounded at infinity, so it is not in the allowed class | excluded | none |
| Chern-period identity | `P = [Σ]`, genus g | `e + 2n_x = (2−2g) + 2g = 2 = μ`; `μ − 2n_z = 0 = ⟨c₁, H(0)⟩` | holds | none |
| Multipointed sphere class | b points, `k = g+b−1` | `μ = 2−2g+2k = 2b`; `μ − 2Σn_(z_i) = 0` | matches line 2504 | none |
| Twice-pointed S³ | raw, twisted, augmented | ranks 2, 1, 2 respectively | matches lines 3016–3022 | none |
| Cobordism degree | identity cobordism `S³×I` | `c₁ = 0`, `χ = 0`, `σ = 0`: degree 0 | consistent with normalization | none |
| Strong ⇒ weak | zero-pairing P, applied to P and to −P | strong at `r = 0` gives a positive coefficient in P and in −P, so P has both signs, which is the weak condition | holds; the two predicates are kept distinct at lines 2456–2460 | none |
| `exists_darbouxChart` on `SmoothTwoForm` + `IsSymplectic` | E = 0; odd-dimensional E; infinite-dimensional E without the binder | E = 0: the zero form on the zero space is nondegenerate and any chart works, true; dim E = 3: no nondegenerate alternating form on a 3-dimensional fiber, so `IsSymplectic` fails at x₀ and the statement is vacuous, true; without `[FiniteDimensional ℝ E]`, weakly nondegenerate forms on ℓ² admit no symplectic basis, so the binder is required | holds with the binder | binder `[FiniteDimensional ℝ E]` now in the signature |
| `exists_standardSymplectomorphism` | dim E = 2 with ω(e₁,e₂) = 1; infinite-dimensional E | dim 2: m = 1 and e = (e₁ ↦ (1,0), e₂ ↦ (0,1)) carries ω to the standard form; the old signature dropped the section's `[FiniteDimensional ℝ E]` (not mentioned in the type), which made it false for E infinite-dimensional, since no `E ≃L EuclideanSpace` exists | repaired | binder `[FiniteDimensional ℝ E]` made explicit |
| `exists_standardDarbouxChart` | as for `exists_darbouxChart`, m = dim E / 2 | E = ℝ², form = dx∧dy: m = 1, chart = identity shifted to x₀, both sides `v₁w₂ − v₂w₁` | holds | restated on `SmoothTwoForm` |
| Relative-link edit | 11 links | each target section found on main, or at the open pull request's head for CalibratedGeometry | holds | links rewritten |

`Suggested.lean` was changed in this round, outside the review points, to clear the two gate failures (`sorry-data=4`, `imports=1`). The Darboux section imported `TauCetiRoadmap.DifferentialGeometry.Suggested` (another roadmap's module) and rested on four `def`s with body `sorry` (`omegaFlat`, `omegaFlatEquiv`, `familySlice`, `timeDerivativeSlice`), with `familyInverseField` built on them. At the pinned Tau Ceti, `TauCeti/Geometry/Manifold/TwoForm/Basic.lean` line 61 defines `SmoothTwoForm` and `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean` line 92 defines `SmoothTwoForm.IsSymplectic` (closed and fiberwise nondegenerate). So `exists_darbouxChart` and `exists_standardDarbouxChart` are restated on those carriers, with the hypotheses `form.IsSymplectic`, `[FiniteDimensional ℝ E]` and `[BoundarylessManifold I M]` in their own signatures. `exists_standardSymplectomorphism` now carries `[FiniteDimensional ℝ E]` explicitly: the old version lost it from the section variables. The Moser family package (`omegaFlat`, `omegaFlatEquiv` and their `_apply` lemmas, `familySlice`, `familySlice_coe`, `timeDerivativeSlice`, `timeDerivativeSlice_spec`, `familyInverseField` and its two theorems, `exists_parametrizedPrimitive`, `exists_compactFamilyPrimitive`, `exists_compactMoser`, `exists_compactMoser_of_cohomologous`) is deleted. The module docstring now says it is not statable at the pins, because Mathlib has no smooth k-forms on manifolds, pullback or one-form exterior derivative, and neither does Tau Ceti; DifferentialGeometry Layers 0–1 build them. None of the deleted names was backticked in the README, so the README is unchanged and F2.1 keeps these as prose targets (`readme-ids-missing=0`).

Signatures were checked mechanically: a scratch file with `#check @name` for all 13 remaining declarations was elaborated once against the built module. The three Darboux statements show `[FiniteDimensional ℝ E]`, `[BoundarylessManifold I M]` and `form.IsSymplectic` as intended, and the other ten are unchanged. No new construction was added, so ownership against open pull requests was not re-examined; `SmoothTwoForm` is consumed from Tau Ceti, not declared. No sources were fetched: the manifest records none. The Darboux docstring cites McDuff–Salamon, *Introduction to Symplectic Topology*, §3.2, by section only.

## Build

`lake build TauCetiRoadmap.HeegaardFloer.Suggested`: **Build completed successfully (9010 jobs)**, with 5 `declaration uses 'sorry'` warnings in `TauCetiRoadmap/HeegaardFloer/Suggested.lean`.

## Gate

    gate HeegaardFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL

Before this round the counts were `blob=11`, `sorry-data=4`, `imports=1` and `depcheck=1`. The only remaining count is `depcheck=1`: `NOT IN ORDER: HeegaardFloer (insert it after its last supplier)`. HeegaardFloer is a roadmap on main that this pull request revises, and it is not listed in the merge order. The brief says that is not a defect.

## Direction check

    depcheck: NOT IN ORDER: HeegaardFloer (insert it after its last supplier)
    depcheck: 148 roadmaps, 1002 edges, 0 problem(s)

There is no UPWARD or CYCLE line.
