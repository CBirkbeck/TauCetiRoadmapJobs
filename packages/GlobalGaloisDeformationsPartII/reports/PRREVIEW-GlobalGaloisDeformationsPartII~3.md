# Review of GlobalGaloisDeformationsPartII (pull request #1837 at a91aaea)

**Verdict:** needs changes

Incremental re-review of the 14 lines changed since c682367 (6 insertions, 8 deletions, README only; `Suggested.lean` is byte-identical to the file the two previous reviews read). The single previous finding (R01: Weyl's theorem and the Casimir cited from LieHighestWeight Layer 5) is repaired: the Scope paragraph, the §4.4 proof route, its *Needs:* line and the Layer 4 Dependencies now cite the pinned Tau Ceti declarations by name, a paragraph under `### From Tau Ceti` states them with their hypotheses, and the `### From TauCetiRoadmap.LieHighestWeight` section is gone (no occurrence of "LieHighestWeight" remains in the README). All seven Tau Ceti declarations and all four Mathlib declarations the repair names exist at the pins with the hypotheses the README attributes to them; one file path is wrong, which is the one finding (P3). The gate passes, the dependency check reports 0 problems, and the module elaborates with `sorry` as the only warning.

## R01 (P3) — The augmentation-ideal lemma is cited at a file that does not exist at the pin

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:64` ("`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`").

**Claim.** The lemma that every canonical generator of the enveloping algebra lies in the augmentation Hopf ideal is at that path.

**Witness.** At the Tau Ceti pin (358314d) there is no directory `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/`; the declaration is `TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` at `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82`, with `HopfIdeal.augmentation R U` as its target, the Hopf ideal being `TauCeti.HopfIdeal.augmentation` at `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean:61`. The other ten file paths on line 64 resolve (listed under Verified sound).

**Repair.** On line 64 replace `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean` by `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean`, and write the ideal with its full name `TauCeti.HopfIdeal.augmentation` (the other names on the line carry the `TauCeti.` prefix). Tested on the instance that motivates the citation: for sl₂ the Casimir of the Killing form is (ef+fe)/4 + h²/8, each term a product of two canonical generators, each in the kernel of the counit, so the sum lies in the augmentation ideal's underlying ideal, as the sentence says; no other change.

## Previous findings

- R01 — repaired: lines 15, 64, 917, 925 and 1000 cite `TauCeti.exists_isCompl_of_isKilling`, `TauCeti.casimirElement`, `TauCeti.casimirElement_mem_center`, `TauCeti.exists_isHighestWeightVector_and_lieSpan_eq_top`, `TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top`, `TauCeti.casimirScalar_eq_zero_iff` and `TauCeti.isTrivial_of_isHighestWeightVector_weight_zero_of_isIrreducible`; the LieHighestWeight section is deleted. The repair introduced the path slip above (new R01, P3).

## Verified sound

**Gate and dependency check.** The worker's gate at a91aaea: every check passed (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `set_option=0`, `sorry-data=0`, `readme-ids-missing=0`, `statement-hygiene=0`). Rerun of the dependency check on this head:

```
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The diff adds no roadmap supplier: it replaces the LieHighestWeight edge by Tau Ceti and Mathlib declarations, so the §4.4 *Needs:* line and the Layer 4 Dependencies now name only suppliers that were already there (ArithmeticGaloisDuality, ReductiveGroupsPartII, LocallyAnalyticDistributionsPartII, NoncommutativeAndEquivariantIwasawa, NoncompactQuantumSymmetry) plus the libraries. `git diff --stat origin/main...HEAD` outside the folder: empty. The overlaps tool lists no other pull request changing this roadmap, no dropped id, no id defined only by an open revision.

**Elaboration.** `lake env lean` on `Suggested.lean` at this head: one warning, `declaration uses sorry` at line 113, exit 0 (18 s). The file is unchanged since e91a4ff, so the `#check` binder comparison and the one-tactic probe of the previous two reports carry forward (`uniformTorsion_H1` closes under none of `simp`, `rfl`, `infer_instance`, `exact ⟨0, …⟩`, `exact ⟨1, …⟩`, `exact?`); `signatures.md` shows the same five declarations with no dropped binder (its "line 128 `in`" entry is the tool misreading docstring text; the build is clean).

**Library declarations opened at the pins** (Tau Ceti 358314d, Mathlib f6090c7), each with its standing hypotheses, compared with what line 64 attributes to it:

- `TauCeti.exists_isCompl_of_isKilling`, `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`: `[Field K] [CharZero K] [IsKilling K L] [FiniteDimensional K L] [FiniteDimensional K M]`, declared after `section AlgClosed` closes at line 196, so no algebraic closedness, as line 64 says. The decomposition form `exists_isInternal_isIrreducible_of_isKilling` is at line 271.
- Mathlib `LieAlgebra.HasTrivialRadical.instIsKilling`, `Mathlib/Algebra/Lie/CartanCriterion.lean:256`: `[CommRing R] [CharZero R] [IsDomain R] [IsNoetherian R L] [Module.Free R L] [HasTrivialRadical R L]`; `LieAlgebra.IsSemisimple.instHasTrivialRadical` at `Mathlib/Algebra/Lie/Semisimple/Basic.lean:286` supplies the radical hypothesis, so the chain IsSemisimple → IsKilling over a characteristic-zero field with 𝔤 finite-dimensional is as stated.
- `TauCeti.casimirElement`, `TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean:128`: `[Field K] [IsKilling K L] [FiniteDimensional K L]`, the sum over `Module.finBasis` of `ι(xᵢ)·ι(yᵢ)` with `yᵢ` the Killing-dual basis (basis independence at line 133); `TauCeti.casimirElement_mem_center`, line 178, membership in `Subalgebra.center`. No characteristic hypothesis, as line 64 says.
- `TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation`, `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82` (R01: the README's path is wrong, the name and statement are right).
- Mathlib `LieAlgebra.exists_isCartanSubalgebra_engel`, `Mathlib/Algebra/Lie/CartanExists.lean:374`: `[Field K] [Module.Finite K L] [Infinite K]`; an algebraically closed field is infinite, so the hypothesis the README states ("over an algebraically closed field") suffices.
- Mathlib `LieModule.instIsTriangularizableOfIsAlgClosed`, `Mathlib/Algebra/Lie/Weights/Basic.lean:754`: `[Field K] [FiniteDimensional K M] [IsAlgClosed K]`; applied to M = L it makes every Cartan subalgebra splitting, as line 64 says.
- Mathlib `RootPairing.nonempty_base`, `Mathlib/LinearAlgebra/RootSystem/BaseExists.lean:321`: `[Finite ι] [Field R] [CharZero R] [P.IsReduced]`; `(IsKilling.rootSystem H).IsReduced` is an instance at `Mathlib/Algebra/Lie/Weights/RootSystem.lean:465`.
- `TauCeti.exists_isHighestWeightVector_and_lieSpan_eq_top`, `TauCeti/Algebra/Lie/HighestWeight/Existence.lean:208`: `[Field K] [CharZero K] [IsAlgClosed K] [IsKilling K L] [FiniteDimensional K L] [H.IsCartanSubalgebra] [FiniteDimensional K M] [LieModule.IsIrreducible K L M]`, a base `b` of the root system; conclusion a highest weight vector generating M. Dominant integrality of the weight is `IsHighestWeightVector.isDominantIntegral`, used at line 212 of the same file; line 64's "whose weight λ is dominant integral" is covered.
- `TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top`, `TauCeti/Algebra/Lie/HighestWeight/Casimir.lean:350`: `[Field K] [CharZero K] [IsKilling K L] [FiniteDimensional K L] [H.IsCartanSubalgebra] [IsTriangularizable K H L]`, hypotheses a highest weight vector and `lieSpan {v} = ⊤`; conclusion the Casimir acts by `casimirScalar base lam`. `TauCeti.casimirScalar`, line 271: `invForm (λ+ρ) (λ+ρ) − invForm ρ ρ`, the form induced by the Killing form, as line 64 says.
- `TauCeti.casimirScalar_eq_zero_iff`, `TauCeti/Algebra/Lie/HighestWeight/Separation.lean:171`: hypothesis `IsDominantIntegral base lam`; iff `lam = 0`.
- `TauCeti.isTrivial_of_isHighestWeightVector_weight_zero_of_isIrreducible`, `TauCeti/Algebra/Lie/HighestWeight/Trivial.lean:104`: `[IsIrreducible K L M]` and a highest weight vector of weight 0; conclusion `LieModule.IsTrivial L M`. No finite-dimensionality of M needed (it is outside `section FiniteDimensional`), the README assumes it anyway.
- Carried from the previous reports: `TauCeti.ContCohomology.H1`, `TauCeti.ContCohomology.explicitInfRes_exact`, and the Mathlib carriers of `uniformTorsion_H1` (`LieGroup`, `GroupLieAlgebra`, `LieAlgebra.IsSemisimple`, `Subrepresentation.quotient`), unchanged.

**Cross-roadmap citations on the changed lines.** The diff adds none and removes LieHighestWeight; the remaining citations on lines 15, 917, 925 and 1000 (NoncommutativeAndEquivariantIwasawa §§0.2, 0.7, 0.11, 0.13a; LocallyAnalyticDistributionsPartII ND.0; NoncompactQuantumSymmetry §P.4; ReductiveGroupsPartII RG2.0.3; ArithmeticGaloisDuality R02.1, R02.5; AffineLieAlgebras §A1) were resolved by the previous report and are unchanged. Ownership: no roadmap on main or at an open head states Weyl's theorem or the Casimir eigenvalue as its own target (the previous report's grep; LieHighestWeight on main itself consumes the native declarations), so citing the pinned declarations is the correct owner. Ownership against the open pull requests whose files the brief lists was checked for this object only.

**Adversarial table** (values computed on each side; rows for untouched statements carry from the previous reports).

| Statement | Instances | Values | Result |
|---|---|---|---|
| Line 64: Casimir scalar formula and sl₂ witness | sl₂ over ℚ_p, Killing form κ(h,h)=8, κ(e,f)=4; L(n) of dimension n+1 | Killing-dual basis h/8, f/4, e/4, so Ω = (ef+fe)/4 + h²/8 = (1/4)(ef+fe+h²/2); ⟨α,α⟩ = α(h/4) = 1/2, ρ = α/2, λ = nα/2, ⟨λ+ρ,λ+ρ⟩−⟨ρ,ρ⟩ = ((n+1)²−1)/8 = n(n+2)/8; n=1: 3/8, n=0: 0; trace-form Casimir ef+fe+h²/2 on the standard module: 3/2 = 4·3/8 | the Check's values are right; κ = 2n·tr for sl_n gives the factor 4 at n=2 |
| Line 64: Casimir in the augmentation ideal | sl₂, Ω as above; 𝔤 = 0 | each term ι(x)ι(y) with ε(ι(x)) = 0, so ε(Ω) = 0; for 𝔤 = 0 the sum is empty and Ω = 0 ∈ augmentation ideal | holds, including the empty case |
| Line 917: extension of scalars step | K = ℚ_p ⊂ K̄; a K-basis xᵢ of 𝔤 | κ_{𝔤⊗K̄} restricts to κ_𝔤 on 𝔤, so the Killing-dual basis of (xᵢ) in 𝔤⊗K̄ is the image of the one in 𝔤 and Ω_{K̄} = image of Ω_K; (V⊗K̄)^{𝔤⊗K̄} = V^𝔤 ⊗ K̄ (kernel of a linear map commutes with flat base change); Ω invertible on V⊗K̄ ⟹ invertible on V (a K-linear endomorphism injective after ⊗K̄ is injective) | the "descends to ℚ_p" clause is sound |
| Line 917: no-invariants hypothesis versus degenerate 𝔤 | Γ finite, d = 0, 𝔤 = 0, V ≠ 0 | V^𝔤 = V ≠ 0, so the all-degree statement's hypothesis fails and Ω = 0 is rightly not invertible; the degree-one statement without that hypothesis gives exponent dividing |Γ|, as the §4.4 Check states | the two statements agree with the Checks |
| Line 917: trivial constituent | irreducible constituent W of V⊗K̄ with casimirScalar = 0 | weight dominant integral ⟹ λ = 0 (`casimirScalar_eq_zero_iff`) ⟹ W trivial (`isTrivial_…_of_isIrreducible`) ⟹ W ⊂ (V⊗K̄)^𝔤 = 0, contradiction; for sl₂ the non-trivial scalars n(n+2)/8, n ≥ 1, are nonzero | each pinned lemma is used at its own hypotheses |
| Line 64: Cartan subalgebra and base | 𝔤 = sl₂(K̄) | engel subalgebra of a regular element h is K̄h, a Cartan subalgebra; it is splitting over K̄; the root system {±α} is reduced and has base {α} | the three Mathlib citations apply in the intended order |
| Finite-image semisimplification contract, scalar-extension paragraph, Levi clauses, §4.4 universal coefficients, §4.4 shrinking U, passage to Γ, fixed-quotient global obstruction contract, root cocycle lattice contract, §1.10 intermediate field, Pan p = 3 exclusion, AutomorphicGaloisRepresentations layers | untouched by the diff | carried from the previous report's table, values unchanged | no change |
| §4.4 / Lean headline, §§0.3, 1.2, 1.3, 1.7, 1.9, 1.10, 1.12, 2.4, 2.7, 2.9, 3.2, 3.3, 4.2, 4.5, 4.7 cardinalities, 5.3, 6.2, 7.1, 7.3, 7.4, 7.7, 7.8, 8.3, 8.5, 8.9, 8.10, 8.11, 9.2, 10.1, 10.3, 10.4, Conventions B_G, Lean definitions | untouched by the diff | carried from the first report's table (rows with the same names), values unchanged | no change |

**Seeded sample.** None of the fifteen sampled targets (0.1, 0.2, 0.3, 1.2, 1.9, 3.2, 3.5, 4.2, 5.3, 8.3, 8.5, 8.6, 8.7, 9.2, 9.5) falls in the diff; their locators carry from the previous reports. The changed lines cite no paper source; the Check values on line 64 were recomputed above.

**Declared gaps.** The diff changes no contract and no gap; the 26 slugs of `design/plan.json` still match the 26 README contracts (previous report).

**Shape and policy on the changed lines.** No LaTeX, no process words, no pull-request numbers, no `lemma`; the new paragraph sits under `### From Tau Ceti` with names and files; the §4.4 *Needs:* line, the Layer 4 Dependencies and Scope line 15 agree with each other and with the proof route; no stale "LieHighestWeight" or "Layer 5" string remains.

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10, 8.7.9, BC14 Lemma 10 and Propositions 11, 32: settled uncertified; cited by locator only.
- Statements the diff does not touch were not re-reviewed beyond the carried table rows.

## Source issues

- none
