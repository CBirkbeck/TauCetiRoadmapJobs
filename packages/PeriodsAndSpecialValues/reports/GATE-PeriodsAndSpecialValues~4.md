# GATE-PeriodsAndSpecialValues~4 — answers to human review

One unanswered review (CBirkbeck, AI re-review at `fdd0c4d`) makes one distinct point, F01. The "two minor source slips … listed at the end" that the review mentions are cut off in the quoted text and so are not answered here.

## H01 (CBirkbeck) — applied

ModularCurvesPartII §§14.1–14.4a do not supply the primitive f-summand; its own scope paragraph (ModularCurvesPartII README, outbound interface paragraph) gives the primitive newspace projector and rank-two multiplicity to AlgebraicModularFormsAndSerreWeights §6.1 (R15.5A.1), and WeightsInEtaleCohomology §§5.2, 5.5 construct W_r and the Scholl correspondence e_ε. README changes: the ModularCurvesPartII contract no longer reads "PS.1.6 takes from them the rank-two parabolic f-summand…". It now says those sections contain the oldvector copies and do not select the summand. It adds §§16.1–16.4 (A_f) for the weight-two branch. The ResolutionOfSingularitiesCharacteristicZero §§6.1–6.2 contract, whose only consumer was PS.1.6's own Kuga–Sato construction, is replaced by contracts for WeightsInEtaleCohomology §§5.2, 5.5 and AlgebraicModularFormsAndSerreWeights §6.1. The same replacement is made in the Scope list and in the lines 39 and 41 ownership sentences. PS.1.6 changes in four places:
- f is now a primitive normalized cuspidal eigenform. This also fixes a false claim: L(M_f,s)=L(f,s) cannot hold for the level-33 eigenform f(q)−βf(q³) built from the level-11 newform, whose Euler factor at 3 is (1−α3^(−s))⁻¹, of degree one.
- For k ≥ 3, M_f is the image of e_ε followed by §6.1's newspace projector.
- It gains a proof that the E-rational image has rank two: after ⊗ℚ_ℓ it is the product over λ|ℓ of the two-dimensional K_λ-summands.
- At weight two M_f is h¹(A_f).

PS.1.6 also gains two Checks: the level-33 old block (dimension four versus primitive two) and the non-primitive Euler-factor exclusion. Its *Needs:* line and the PS.1 Dependencies list are updated to match.

Suppliers' positions in ORDER.txt: ModularCurvesPartII line 70, AlgebraicModularFormsAndSerreWeights line 84, WeightsInEtaleCohomology line 132, this roadmap line 297. All three are read at the open-PR heads the roadmaps index gives (#913, #928, #1001).

### Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| PS.1.6 scope "primitive" and L(M_f,s)=L(f,s) | Level-11 weight-two newform f (a₃ = −1); level-33 U₃-eigenform f(q)−βf(q³) | Newform: local factor at 3 is ((1−α3⁻ˢ)(1−β3⁻ˢ))⁻¹, with α+β=−1 and αβ=3, so degree 2. Old eigenform: L(f,s)(1−β3⁻ˢ), local factor (1−α3⁻ˢ)⁻¹, degree 1. A rank-two motive with good reduction at 3 needs degree 2 | False for non-primitive forms | Restricted to primitive; negative Check added |
| Primitive projector versus the parabolic image (ModularCurvesPartII §§14.1–14.4a) | Level 11 versus auxiliary level 33, weight 2 | Old span ⟨f(q), f(q³)⟩: its coefficients at q, q³ form the matrix [[1,0],[a₃,1]], with determinant 1. Old cusp space has dimension 2, and its parabolic H¹ (holomorphic and antiholomorphic) has dimension 4. Newspace summand has dimension 2 at both levels | Primitive selection needs §6.1 | Supplier changed; Check added |
| E-rational rank two from §6.1's K_λ statement | E = ℚ (11a); E = ℚ(√5) (level 23), ℓ split or inert | E⊗ℚ_ℓ = ∏K_λ. The summand is K_λ² at each λ, so it is free of rank 2 over E⊗ℚ_ℓ, hence dim_E = 2. For 23 with ℓ split, two copies of ℚ_ℓ², ℚ_ℓ-dimension 4 = 2·[E:ℚ] | Consistent | Proof sentence added |
| Weight-two branch h¹(A_f) (§§16.1–16.4, N ≥ 5) | N=11; N=23; N ≤ 4 | dim A_f = 1 and 2; V_ℓ has rank 2 over ℚ_ℓ⊗K_f, giving ℚ_ℓ-dimensions 2 and 4. For N ≤ 10, S₂(Γ₁(N))=0, so §16.2's N ≥ 5 hypothesis excludes no newform | Consistent | Contract added |
| W_r and e_ε (WeightsInEtaleCohomology §5.5), k ≥ 3 | r=1 (k=3), r=2 (k=4), r=0 | r=1: (1−[−1])/2 keeps H¹ of the fibre, degree r+1 = 2. r=2: Sym²H¹ has rank 3, not ∧² of rank 1; degree 3. r=0 is excluded and uses A_f | Matches §5.5's r ≥ 1 | Contract says k ≥ 3 |
| Weight-four Check (types (0,3),(3,0)) against the new construction | k=4 | H³(W_2) image of e_ε has Sym² rank 3 per fibre. The f-summand has rank 2 with Hodge types (0,3),(3,0) and critical integers m = 1, 2, 3 | Agrees with the existing Check | none |

Lean: `Suggested.lean` is unchanged (PS.1.6 is named in its docstring as not statable), so no `#check @name` comparison was needed beyond the existing signatures file: 38 declarations, none of which changed.

Ownership: for the Kuga–Sato compactification, Scholl projector and primitive summand, the owners are now cited (WeightsInEtaleCohomology §§5.2, 5.5; AlgebraicModularFormsAndSerreWeights §6.1). PS.1.6 owns only the homological motive with E-action and its marked Betti–de Rham comparison, which no supplier read here constructs.

## Build and gate

- `lake build TauCetiRoadmap.PeriodsAndSpecialValues.Suggested`: Build completed successfully (8976 jobs), with only `declaration uses sorry` warnings.
- Depcheck: `depcheck: 204 roadmaps, 1647 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- Gate: `gate PeriodsAndSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Commit `23c20c7` "PeriodsAndSpecialValues: review repairs (primitive rank-two summand and Kuga–Sato projector from their owners)". Not pushed.
