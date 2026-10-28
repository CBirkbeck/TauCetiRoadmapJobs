# GATE-FourManifolds~1: answers to human review

Points are numbered in the order they appear in the three comments by roed-math (2026-10-14, 2026-10-18, 2026-10-20). The head that was reviewed last (a9dd1d9) was superseded by d09c2c0, "Construct all-strata ASD reductions and scoped metric transversality". That commit carries the F5 repair the second and third comments ask for. This round adds commit 6091e2d with gate repairs (see "Further repairs").

## H01 (roed-math) — answered
The noncompact boundary/support comparison for the opened cobordism `W = (V × [0,1)) ∪ (B × {1})` is consumed from AffineMorseLefschetz §A4 "A4.0. Locally finite chains and noncompact duality" (on main) and CharacteristicClasses C1.2a S0–S5 (on main, "C1.2a. Compact-relative support foundations"). The proper Whitehead step comes from AT8.5: see the supplier table and F3.1c, `TauCetiRoadmap/FourManifolds/README.md` lines 59–60 and 364–373. I recomputed the requested map from the pair sequence: `H_c^4(W,∂W)=0 → H_c^4(W)=ℤ → H_c^4(V)⊕H_c^4(B)=ℤ² → H_c^5(W,∂W)=ℤ → 0`. The restriction is therefore the signed diagonal, each component is a unit, and the README states exactly this. The 2026-10-18 comment records this point as closed.

## H02 (roed-math) — answered
The projective zero-locus carrier and the Veronese comparison are consumed from AffineMorseLefschetz §A0 "Polynomial-family projective carriers" and §A6 (its degree-d Veronese closed embedding over the A0 zero locus, README lines 547–560 of that roadmap on main). The weak hyperplane theorem comes from §A5. F6/F7 keep the quartic and elliptic comparisons (README line 59 and F7). The 2026-10-18 comment records this point as closed.

## H03 (roed-math) — answered
The untwisted quaternionic half-spin structures come from SpinGeometry G6 item 7 on main (`untwistedSpinFourJPlus`, `untwistedSpinFourComplexIndex_eq_two_mul_quaternionicIndex`). The integral `σ(M) = −16α` comes from IndexTheory I7 item 5 at the head of its open new-roadmap pull request. SpinGeometry's own dependency paragraph names IndexTheory I7.5 and TangentialBordism B3.0 as downstream consumers, so there is no early circle through the K3 bordism generator. The citations are at README lines 61, 796 and 816. The 2026-10-18 comment records this point as closed.

## H04 (roed-math) — answered
The stale TangentialBordism publication status is in the pull-request description. That text is outside the roadmap folder, so the worker updates it there. The README cites TangentialBordism B3.4/B4 by section and does not call it unpublished.

## H05 (roed-math) — applied
Metric transversality now has an explicit scope (F5.G1, README lines 999–1063): a closed connected oriented simply connected smooth M, an SU(2) bundle with `k=⟨c₂(P),[M]⟩>0`, and irreducible connections over C^ℓ metrics. The theorem ends with "No arbitrary-base, charge-zero or flat-stratum metric-regularity theorem is asserted here." The old unqualified sentence "For transversality, consume HF F0's generic Banach-manifold Sard–Smale theorem…" no longer occurs. I recomputed the Q₈ counterexample: `[i,j]=−1`, so the product of the two commutators is 1; `b₁(Σ₂×Σ₂)=8`, `b₂=18`, `b₂⁺=9`; index `−3(1−8+9)=−6`; hence `dim H_A²=dim H_A¹+6`. F5.G0 keeps this case as a regression check.

## H06 (roed-math) — applied
Flat strata are kept in F5.G0 (README lines 899–997) with their actual `H_A⁰`, `H_A¹` and `H_A²`, the Kuranishi map `asdKuranishiReduction` with `κ_A(0)=0` and `Dκ_A(0)=0`, the identification `H_A² = H²_+(M;L_A)` (not the full twisted H²), and a flat Maurer–Cartan comparison. These strata are explicitly "not assigned metric-generic regularity". F5.G2 obstruction gluing uses these G0 complexes and allows a right inverse to the unprojected operator only once its cokernel has been proved zero. I recomputed the trivial-flat regression on S²×S²: `H_A⁰=3`, `H_A¹=0`, `H_A²=3`, which gives index −6 = `−3(1−0+1)`, whereas using the full twisted H² (dimension 6) would give −9.

## H07 (roed-math) — applied
The specialisation is spelled out in F5.G2 (README lines 1100–1124). Charge one is nonflat by the energy identity `E(A)=8π²k+2‖F_A⁺‖²`. On a negative-definite simply connected base the charge-zero flat stratum is the single trivial connection. The dimension is `8·1−3(1−0+0)=5`. A separate generic-metric reducible-regularity theorem gives kernel ℂ³ and CP² links. This yields `Q≅−I`.

## H08 (roed-math) — applied
The 2026-10-20 comment reviewed a9dd1d9, which predates d09c2c0, where H05–H07 are repaired. Its two requests are now met. Request 1 (simply connected, positive charge, nonflat) is in F5.G1, lines 999–1005. Request 2 (flat strata kept with their deformation, obstruction and Kuranishi data) is in F5.G0, lines 899–997.

## Further repairs (not raised by the reviewer)
- `Suggested.lean` declared the sorry'd data definition `pontryaginSquareDegreeTwo`. It is deleted, and the README sentence that named it (F4, line 821) now reads "Pin the degree-two Pontryagin square H²(−;ℤ/2)→H⁴(−;ℤ/4)". The now unused `TauCeti.AlgebraicTopology.Cohomology.Relative` import is removed.
- Eleven commit-pinned blob links and one pull-request link (`pull/284`), plus the label "HomotopySpheres PR284" in the supplier table, are replaced by roadmap names and sections.
- The README backticked `enriquesCover`, which no declaration matched. The README now names the Enriques K3 cover and the declared quadrics `enriquesQuadric j`.
- The module docstring now has the required form. It names the headline theorems that cannot be stated at the pins and what each lacks:
  - Freedman's classification and the homotopy classification: no cup product on singular cohomology, no fundamental class of a manifold, no Kirby–Siebenmann invariant.
  - Donaldson's theorem: the same gap, plus the ASD moduli space.
  - Rokhlin's theorem: no Spin structure or signature of a manifold.
  - The Pontryagin square: no cup-one cochain operations.
  - The projective quartic and Enriques subtypes: the AffineMorseLefschetz A0 carrier is not at the pins.

  I grepped the pinned Mathlib and Tau Ceti for `cupProduct`, `fundamentalClass`, `SpinStructure` and `KirbySiebenmann`. The only cup products are group-cohomology ones in the class field theory modules. The remaining declarations now all have docstrings.
- Not changed: the affine-cone Jacobian theorems stay as stated, since the reviewer called them useful and they are the smoothness inputs of the K3 and Enriques models.

## Adversarial pass on the statements kept or touched

| Statement | Instances | Values | Result |
|---|---|---|---|
| `fermatQuarticMap_fderiv` | v = e₀, general v | d(Σzᵢ⁴) = Σ4vᵢ³dzᵢ; at e₀: 4·dz₀ | holds |
| `fermatQuarticMap_fderiv_surjective` | v = 0 (excluded), v = e₀ | at 0 the derivative is 0, not onto, so `hv` is needed; at e₀ the coefficient is 4 ≠ 0 | holds with `hv` |
| `ellipticQuarticSeedMap_fderiv_surjective` | z₀ = 0; all coordinates nonzero | z₀=0 ⇒ z₃=0 (∂₀) ⇒ z₂=0 (∂₁) ⇒ z₁=0 (∂₃), and the same cyclically; all nonzero: exponent rows (−2,0,−1,3),(3,−1,−2,0),(0,−2,3,−1),(−1,3,0,−2) sum to 0, so the product of left sides is 1 while the product of right sides is (−3)⁴ = 81 | holds; agrees with README "3⁴=1" contradiction |
| `enriquesQuadricJacobian_surjective` | v with ≤ 2 nonzero coordinates; v off the zero locus | ≤ 2 nonzero zᵢ²: Vandermonde forces zᵢ = 0; without `hz`, v = e₀ gives Jacobian rank 1 | holds with `hz`, which is needed |
| `enriquesProjectiveInvolution_involutive` | v = e₀, e₃ | σ²(v) = v | holds |
| freeness of the involution (README F7) | fixed points z₀=z₁=z₂=0 or z₃=z₄=z₅=0 | 3×3 Vandermonde in t = (4,5,6) or (1,2,3) is invertible ⇒ point is 0 | free |
| F3.1c supported groups of W | pair LES | `H_c^4(W)=ℤ`, other groups 0, restriction (±1,±1) | holds |
| F5 index with H⁰ | trivial flat on S⁴; on S²×S²; Q₈ on Σ₂×Σ₂; charge 1 negative-definite | −3 = 0−3−0; −6 = 0−3−3; −6 = h¹−0−h²; 5 = 8−3 | holds |

The file has no `variable` or `include` lines, so no declaration can lose a section binder. The brief permits only the build and gate Lean commands, so I did not elaborate a separate `#check @name` scratch file. I compared the signatures in the built file with the README statements: the README's F7 polynomial (line 1280) and quadrics (line 1311) match the Lean definitions.

Ownership: no new construction was added in this round, so no ownership question arises. The Pontryagin square stays a README target of F4, which owns it on TangentialBordism B4.1's cup-i operators.

## Build
`lake build TauCetiRoadmap.FourManifolds.Suggested`: Build completed successfully (8976 jobs); 5 `declaration uses 'sorry'` warnings, no errors.

## Gate
`gate FourManifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Before the repairs, the gate failed with blob=11 prnum=1 sorry-data=1 depcheck=1 (`NOT IN ORDER: FourManifolds`).

Depcheck after the repairs: `depcheck: 148 roadmaps, 1001 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line for FourManifolds.
