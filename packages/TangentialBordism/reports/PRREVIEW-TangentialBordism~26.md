# Review of TangentialBordism (pull request #942 at 4e86746)

**Verdict:** needs changes

This is an incremental re-review of the 93 changed lines since f212a45, all in `README.md`: the Spin paragraph of the From Tau Ceti contracts (the dimension sentence and four new pinned declarations), the 9.2 precomposition through the units-range isomorphism, a new 9.2 derivation of F₄'s transitivity on ordered Jordan frames with one API bullet and three Checks, the matching scope, supplier-table, How-to-read and Layer 9 Dependencies sentences. `Suggested.lean` and `metadata.toml` are byte-identical to 42329d2. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with its six `sorry` warnings and nothing else. R02 of the previous review is repaired and the repair introduced no new problem. One finding remains, the pull-request description (R01), a P3 that changes nothing in the folder.

## R01 (P3) — The description still lists the closed #1663 and omits #886, whose numbering the README cites

**Location.** In the pull-request description (`scratch/pull-request.md`, quoted as data):

- "- [ ] depends on: #1663";
- "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652";
- the Depends-on block lists #1652, #1077 and #948, not #886.

The README cites DifferentialGeometry 5.5b (`TauCetiRoadmap/TangentialBordism/README.md:88`, `:394`, `:748`, `:974`, …).

**Claim.** The description names every open revision whose numbering the README cites, and names only open pull requests.

**Witness.** Main (1bea835) contains "5.5b" 0 times; #886 defines it (`TauCetiRoadmap/DifferentialGeometry/README.md:1480`). `scratch/overlaps.md` lists DifferentialGeometry §5.5b as defined only by #886. The roadmap index of 2026-11-09 lists no #1663. The description text is unchanged since the previous review.

**Repair.** Description only; no file in the folder changes.

- Delete "depends on: #1663".
- Change the revision paragraph to "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".
- Add #886 to the Depends-on block.

The previous report's fourth bullet (a sentence redirecting LieHighestWeight's pointer to S1.5) is withdrawn: this head keeps the Jordan-frame transitivity in B3, as LieHighestWeight Layer 8 on main assigns it (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1355–1356`), so the pointer is now correct as it stands.

## Previous findings

- R01 — not repaired: the description still reads "- [ ] depends on: #1663" and "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652"; #886 appears nowhere in it. Carried forward as R01 above.
- R02 — repaired: `README.md:363–385` now says both Lie algebras have dimension n(n−1)/2 by composing `bivectorEquivSo`, `bivectorExteriorEquivQuadraticLieSubalgebra` and `exteriorPower.finrank_eq`, names `realCliffordSpinContinuousMulEquivUnitsRange`; 9.2 `:2734–2740` precomposes with its inverse; the *Needs:* line `:2806` lists all of them.

## Verified sound

### Gate, order, build

- **Gate** (`scratch/gate.md`): every check passes; set_option 0, blob 0, latex 0, prnum 0, sorry-data 0, statement-hygiene 0, readme-ids-missing 0, depcheck 0, stray-files 0, outside-folder 0, build 0. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check**, rerun on this head with `--movable` against the merge order and main:

  ```
  depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. TangentialBordism is line 14 of the merge order, after IndexTheory and StringOrientation. No roadmap on the never-cite list is cited.
- **Elaboration.** `lake env lean TauCetiRoadmap/TangentialBordism/Suggested.lean` exits 0 with exactly six warnings, `declaration uses sorry` at `:75`, `:96`, `:114`, `:130`, `:159`, `:177`. `git diff 42329d2 HEAD -- Suggested.lean metadata.toml` is empty, so the `#check @` comparison, the one-tactic padding probe (all six `simp` attempts fail) and the headline audit carry over from PRREVIEW-TangentialBordism~24 unchanged.

### The changed passages: pinned declarations opened

| README claim (line) | Pinned declaration, file:line | Agrees |
| --- | --- | --- |
| `bivectorEquivSo` identifies ⋀²ℝⁿ with the skew-symmetric n×n matrices (`:366`) | `CliffordAlgebra.bivectorEquivSo : ⋀[R]^2 (Fin n → R) ≃ₗ⁅R⁆ LieAlgebra.Orthogonal.so (Fin n) R`, `TauCeti/LinearAlgebra/CliffordAlgebra/StandardBivector.lean:407`, for the form `weightedSumSquares R 1` | yes |
| `bivectorExteriorEquivQuadraticLieSubalgebra` is a linear equivalence for any quadratic form over a commutative ring with 2 invertible (`:369–373`) | `⋀[R]^2 M ≃ₗ[R] ↥(quadraticLieSubalgebra Q)` with `[CommRing R] … [Invertible (2 : R)]`, `TauCeti/LinearAlgebra/CliffordAlgebra/CliffordExteriorSquare.lean:43–47` | yes |
| `exteriorPower.finrank_eq` gives binom(n,2) (`:373–375`) | `finrank R (⋀[R]^n M) = (finrank R M).choose n` under `[Module.Free R M] [Module.Finite R M] [Nontrivial R]`, `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:174`; ℝⁿ satisfies all three | yes |
| "none states the count for general n; `TauCeti.finrank_so_three` states it for n=3" (`:364–365`) | `TauCeti.finrank_so_three : finrank R (so (Fin 3) R) = 3`, `TauCeti/Algebra/Lie/Orthogonal/CrossProduct.lean:162`; the only general-n statement found is the inequality `Matrix.finrank_skewAdjointMatricesSubmodule_le_choose_two` (`TauCeti/LinearAlgebra/Matrix/Involution.lean:114`), which is a bound, not the count | yes |
| `spinGroup (realCliffordForm n 0)` is isomorphic as a topological group to its units range (`:375–378`) | `realCliffordSpinContinuousMulEquivUnitsRange (n) : spinGroup (realCliffordForm n 0) ≃ₜ* MonoidHom.range spinGroup.toUnits`, `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:93` | yes |
| Vector action onto SO for a positive-definite form on a finite-dimensional real space (`:378–383`) | `spinToSpecialOrthogonal_surjective_of_posDef (Q : QuadraticForm ℝ V) (hQ : Q.PosDef) : Function.Surjective (spinToSpecialOrthogonal Q)` under `variable [FiniteDimensional ℝ V]`, `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Basic.lean:58, 70` | yes |
| `spinToSpecialOrthogonal` is the conjugation (vector) action (`:2768–2769`) | docstring "The conjugation action of the Spin group, restricted to the determinant-one orthogonal automorphisms", `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpecialOrthogonal.lean:256–258` | yes |
| `realCliffordForm n 0` is positive definite (`:383–385`) | `TauCeti.posDef_realCliffordForm_zero (n : ℕ) : (realCliffordForm n 0).PosDef`, `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:173`; the file header `:31` gives the `TauCeti.` prefix and says it equals the sum-of-squares form | yes |
| Spin carrier's Lie algebra ≅ quadratic Clifford elements, same count without the projection (`:2749–2752`) | `realCliffordSpinLieEquivQuadratic (n) : LeftInvariantDerivation … ≃ₗ⁅ℝ⁆ quadraticLieSubalgebra (realCliffordForm n 0)`, `TauCeti/Geometry/Lie/CliffordAlgebra/Spin/Projection.lean:188`; composed with the two equivalences above it gives (finrank ℝ (Fin 9 → ℝ)).choose 2 = 36 | yes |
| Declarations the change leaves in place (`realCliffordSpinUnitsRangeLieGroup :171`, `realCliffordSpecialOrthogonalLieEquivSo :228`, `isLocalDiffeomorph_… LocalDiffeomorph.lean:126`, `toContMDiffMonoidMorphism AutomaticSmoothness.lean:156`) | as in the previous report | yes |

### Cross-roadmap citations resolved this round

- LieHighestWeight on main (1bea835), Layer 8 (`:1197–1431`): `:1350–1352` prove that primitive idempotents are exactly the trace-one idempotents and that every complete orthogonal primitive frame summing to 1 has three elements, as 9.2 `:2760–2762` says; `:1355–1356` say the decomposition does not assert automorphism transitivity on frames and that the theorem belongs to TangentialBordism B3, as the scope paragraph `:51–53` says. The *Needs:* item "LieHighestWeight Layer 8 derivations, primitive idempotents and frames" resolves to `:1349–1354`.
- StringOrientation #948 (07f0981) S1.5 `:462–480`: F₄ acts transitively on OP² (the trace-one idempotents) with isotropy Spin(9) at diag(1,0,0) acting on the 16-dimensional complement by the real spin representation. "frame" occurs in that README only for framed bordism and the Spin frame bundle: S1.5 states no transitivity on Jordan frames, so 9.2's derivation has one owner.
- DifferentialGeometry #886 (473c4df) 5.5b `:1480`; main has none (R01).
- **Overlaps** (`scratch/overlaps.md`, 5 items): no open pull request changes this roadmap; no cited id is dropped; of the ids only an open revision defines, the AlgebraicTopology layers come from #1652, which the description names, and DifferentialGeometry 5.5b from #886, which it does not (R01); of the vocabulary neighbours, HomotopySpheres is not cited, StringOrientation is a supplier earlier in the order, FourManifolds and GeneralizedCohomology are in the stated direction. `scratch/citations.md`: no cross-roadmap citation and no Lean name found nowhere.

### Adversarial mathematics table

New rows, for the statements the diff adds or changes:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Contract `:363–375`: both Lie algebras have dimension n(n−1)/2 by the three pinned declarations | n=0, 1, 2, 3, 9 | binom(n,2) = 0, 0, 1, 3, 36; n=3 agrees with `finrank_so_three`; n=0 and 1 give the trivial Lie algebras of the trivial groups {1} and {±1}; the hypotheses `Invertible (2:ℝ)`, free, finite, nontrivial all hold for ℝⁿ | pass |
| Contract `:378–385`: vector action onto SO(`realCliffordForm n 0`) | n=0, 1, 9 | n=0: SO(0) trivial, surjective trivially; n=1: SO(1)={1}, Spin(1)={±1} maps onto it; n=9: the claim 9.2 uses. The declaration's hypotheses (finite-dimensional, PosDef) are supplied by `Fin n → ℝ` and `posDef_realCliffordForm_zero` | pass |
| 9.2 precomposition `:2734–2740` | source and target of each map | `realCliffordSpinContinuousMulEquivUnitsRange 9 : spinGroup ≃ₜ* range`; its inverse composed with the homomorphism `spinGroup → isotropy` is a continuous homomorphism `range → isotropy`; the range carries the `LieGroup 𝓘(ℝ, SpinLieModel 9) ∞` instance, so `toContMDiffMonoidMorphism` applies (finite-dimensional models on both sides) | pass |
| 9.2: Peirce 0-space of E_0 is the Hermitian 2×2 block in the last two indices (`:2763–2764`) | E_0 = diag(1,0,0) in H₃(𝕆) | Y∘E_0 = ½(YE_0+E_0Y) has entries ½(Y₁ⱼ) in row 1, ½(Yᵢ₁) in column 1, Y₁₁ at (1,1); it vanishes iff row 1 and column 1 of Y vanish, which is the block; the (1,2),(1,3) entries form J_{1/2} and ℝE_0 is J_1 | pass |
| 9.2: X=[[t,a],[star(a),−t]] has X² = (t²+N(a))(1−E_0) (`:2765–2767`) | general t, a; a=1,t=1 | diagonal t²+a·star(a) = t²+N(a) and star(a)·a+t²; off-diagonal t·a + a·(−t) = 0 and star(a)·t − t·star(a) = 0; at t=a=1: X²=2·I₂ | pass |
| 9.2: trace-one idempotents of the block are exactly ½(1−E_0+X) with t²+N(a)=1 (`:2765–2768`) | Y=½(1'+X); X=2Y−1' | Y²=¼(1'+2X+X²)=¼((1+t²+N(a))1'+2X); Y²=Y iff t²+N(a)=1; tr Y = ½·2 = 1; conversely any trace-one Y gives traceless X=2Y−1' with X²=1'. Negative control: t²+N(a)=2 gives Y²=¼(3·1'+2X)≠Y | pass |
| 9.2: unit sphere S⁸ in ℝ⁹=ℝ⊕𝕆; E₃ determined by E₂ (`:2767–2769`) | dimensions | traceless block = ℝ·t ⊕ 𝕆 = ℝ⁹; {t²+N(a)=1} = S⁸; E₃ = 1−E_0−E₂ | pass |
| 9.2: an automorphism acting on the complement by ρ(x) acts on ℝ⁹ by conjugation by x (`:2769–2773`) | φ ∈ isotropy, φ|_{J_{1/2}} = ρ(x) | φ(X∘v)=φ(X)∘φ(v) gives L_{φ(X)}∘ρ(x)=ρ(x)∘L_X on J_{1/2}; with 2L_X = ρ(X) (`:2708–2710`) this is ρ(φ(X)) = ρ(x)ρ(X)ρ(x)⁻¹ = ρ(xXx⁻¹); xXx⁻¹ ∈ ℝ⁹ for x ∈ Spin, and ρ is injective on ℝ⁹ (ρ(v)² = N(v)·id ≠ 0 for v ≠ 0), so φ(X) = xXx⁻¹. The factor 2 is a fixed scalar and does not affect the conclusion | pass |
| 9.2: SO(9) transitive on S⁸, hence isotropy transitive on frames with first member E_0 (`:2774–2779`) | the standard form | `realCliffordForm 9 0` is the sum of squares (file header `RealForm/Basic.lean:31`) and t²+N(a) is the sum of squares in the pinned basis of ℝ⊕𝕆; SO(9) is transitive on its unit sphere; every SO(9) element is a vector action by surjectivity, realised by an isotropy element through the identification | pass |
| 9.2: F₄ transitive on ordered frames (`:2758–2779`, API `:2794`) | two-step reduction | g(E₁)=E_0 by S1.5; then h ∈ isotropy with h(g(E₂)) = diag(0,1,0); E₃ forced. Negative control (Check `:2803`): the unordered frame {diag(0,1,0), diag(0,0,1)} needs the order swap t=1 ↦ t=−1, realised by a rotation in SO(9), not by the antipodal map of determinant (−1)⁹ = −1 | pass |
| Check `:2802` | X=[[0,1],[1,0]]; X=[[1,1],[1,−1]] | ½(1'+X) = all entries ½; ([[1,1],[1,1]])² = 2·[[1,1],[1,1]], so (½M)² = ½M, trace 1, row/column 1 zero. Second X: X²=2·1', Y²=¼(3·1'+2X) ≠ ¼(2·1'+2X)=Y | pass |
| Check `:2803` | diag(0,1,0), diag(0,0,1) | X = 2E₂−1' = diag(0,1,−1) gives t=1, a=0; diag(0,0,1) gives t=−1; det(−id_{ℝ⁹}) = −1; rotation by π in the (t, Re a)-plane has det 1 and sends (1,0) to (−1,0) | pass |
| Check `:2804` | dimension count | 16 + 8 = 24; 52 − 24 = 28 = dim Spin(8) = binom(8,2); 28 > 0, so not simply transitive | pass |
| Scope `:51–53`, table `:397`, `:405`, How to read `:433–435`, Dependencies `:2891` | consistency with 9.2 and LieHighestWeight | each names the same object (transitivity of S1.5's F₄ on ordered Jordan frames, derived from S1.5's transitivity on OP², owned by B3/9.2); LieHighestWeight `:1355–1356` assigns it to TangentialBordism B3; S1.5 does not state it | pass |

Rows carried from the previous report (PRREVIEW-TangentialBordism~25, "Adversarial mathematics table") for statements the diff leaves untouched, each with the values recorded there:

| Statement | Values (r25) | Result |
| --- | --- | --- |
| Contract `:344–360`: native Spin and SO range carriers, every n | n=0: Cl=ℝ, Spin={1}, SO(0) trivial, dimension 0; n=1: {±1}→{1}; n=9: dim so(9)=36 | pass (r25) |
| 9.2 dimension 36 | dim Spin carrier = dim SO carrier = 36; wrong models excluded by the local diffeomorphism: Cl(9,0) 512, even part 256, Spin(8) 28 | pass (r25) |
| 9.2 automatic smoothness | source `SpinLieModel 9` finite-dimensional (`Projection.lean:148`); target a closed subgroup of compact F₄ | pass (r25) |
| 9.2 open image | injective dφ: ℝ³⁶→ℝ³⁶ bijective, local diffeomorphism everywhere, image open in connected Spin(9); control SO(2)⊂SO(3), 1<3 | pass (r25) |
| S1.5 count used by 9.2 | 52−36 = 16 = dim OP² | pass (r25) |

Rows carried from PRREVIEW-TangentialBordism~24, with the values recorded there:

| Statement | Values (r24) | Result |
| --- | --- | --- |
| `exists_contMDiff_homotopicRel` | empty source; point target, D=univ; identity of S¹ against g(z)=−z at distance 2, excluded | pass (r24) |
| smoothing route `:611–620` | uniform ε from compact P; segment in ε-ball ⊆ W; F=f on C | pass (r24) |
| relative transversality `:621–640` | D₁∘D₁⊆D; β=ψ² has dβ=0 where β=0 | pass (r24) |
| non-compact target `:640–647` | D=(W°×W°)∪(P_N×(P_N∖f(M))) open, contains the diagonal | pass (r24) |
| `isNullSet_image_criticalPoints_of_boundaryless` | t↦(t,0) image null; projection ℝ²→ℝ, no critical point | pass (r24) |
| Lindelöf needed `:691–692` | ℝ²_δ×[0,∞): critical values ℝ²; ℝ_δ bad set ℝ, ℤ bad set null | pass (r24) |
| parametric Check `:690` | bad set {0} | pass (r24) |
| depth strata `:686–688` | quadrant 1,2,1 components; cube 1,6,12,8; half-space M₂=∅ | pass (r24) |
| cone model, exhaustion, half-space Checks `:693–695` | cone convex with interior; f(x)=‖x‖², every c>0 regular; t², t | pass (r24) |
| 2.2 cylinder faces, u₁=−1, point signs, oriented atlas | −1=(−1)^(dim I); [−1]−[1] vs [1]−[−1]; two rays; [0,1] transition negative | pass (r24) |
| 2.4, 3.1–3.4 Checks | counts 0; (−1)^(1·1)=−1; [pt]≠0 in ΩO₀ via RP² | pass (r24) |
| 4.1, 4.2, 4.4 | AW homotopy; Sq¹a=a²; d₂ (1,2)↦(3,3); binary digits; degree 7→8 at p=3 | pass (r24) |
| 5.2, 5.4 | aba⁻¹b⁻¹ vs aa⁻¹bb⁻¹; block rotation of (cos θ e, sin θ e) is (e,0) | pass (r24) |
| 6.1, 6.3–6.6 | multiplicities 1,0,1,0,2; binom(6,2)=15; stems 4, 8; s₂=−10, gcd 5; ∂₂²σ(4)=1; 1−ρ=2 | pass (r24) |
| 7.1–7.2 | Â(K3)=2; α(K3×K3)=4b; σ=−16 | pass (r24) |
| 8.1, 8.3, 8.4, 8.5 | Arf(Lie torus)=1; 12ν of order 2 in ℤ/24; (w₄,w₂²) table; fibre degree −1, total (−1)^n | pass (r24) |
| 9.1 charts, 9.2 Clifford module, 9.3/9.4 classes | v=(1,i,j) gives (−i,k); C₀⋯C₈(1,0)=(−1,0), with −C₈ (1,0); L₄(OP²)=1, p(HP²)=1+2u+7u² | pass (r24) |
| 10.1–10.4 | d₅, d₆; H₆(Bℤ/m)=0; closed-fibre exclusion; −1∉S₃; s₃=−28, Scal ≥ 56 | pass (r24) |
| Scope: owner of η³=12ν | only here, FourManifolds #936 and K3BlochGroups #1430, both later | pass (r24) |

### Seeded sample

None of the fifteen seeded targets (2.4, 2.6, 3.4, 4.1, 5.3, 5.5, 5.6, 6.2, 6.4, 7.2, 8.4, 8.5, 9.3, 10.2, 10.4) is changed by this diff, and none cites the Jordan-frame derivation or the dimension sentence: 9.3 (`:2808`) consumes S1.5's w₂ and the sign witness, and 9.1/9.4 cite B3.7 only for the quotient comparison, unchanged. Under the incremental rule they were not re-verified; the previous reports' locator checks stand. The README flags no locator as unverified. The new 9.2 passage cites no source: its inputs are LieHighestWeight Layer 8, StringOrientation S1.5 and the pinned declarations opened above, each resolved.

### Duplication and ownership

- The Jordan-frame transitivity is stated by no roadmap on main (LieHighestWeight explicitly leaves it to TangentialBordism B3), not by StringOrientation #948 at its head, and `roadmaps grep` for "Jordan frame" finds it in no other open roadmap folder; TangentialBordism 9.2 is its single owner.
- Nothing in the diff adds a declaration to `Suggested.lean`; `scratch/library-matches.md` is unchanged from the previous round and its leads were settled there.

### Remarks on untouched or unchanged-in-substance text (no change requested)

- 9.2 `:2769–2770` says "the Peirce product of the block with the Peirce complement is the Clifford action", while `:2708–2710` of the same subsection pins the normalisation as twice the Jordan product. The invariance argument is insensitive to the scalar, and the earlier sentence fixes it, so the wording is not a defect.
- S1.5 says "a subgroup isomorphic to Spin(9)" without the category; 9.2 reads it as a Lie-group isomorphism, which S1.5's "closed smooth 16-manifold F₄/Spin(9)" supports (as remarked in the previous report).

## Not verifiable

- As in the previous reports: Lee, *Introduction to Smooth Manifolds*; Milnor–Stasheff Chapters 8, 16, 17; Milnor 1960; Wall 1960; Atiyah–Bott–Shapiro (uncertified); Kreck–Stolz (uncertified); Munkres; Stolz 1992; Anderson–Brown–Peterson; McCleary; Stong; Gompf–Stipsicz. They are paywalled or are books not readable here, and none is cited by the changed passages.

## Source issues

- none
