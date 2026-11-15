# Review of CyclotomicClassGroupsAndStickelberger (pull request #1260 at f2e0f0d)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:1317` allocates the five named abelian targets to §4.3 and the three named local comparisons to §4.4, including the identical A6.7 rank bound. The requested downstream allocation is explicit.
- R02 — repaired: `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:165` supplies the documented `conductorNeZero` instance; `abelianCharacter_gauss_product` no longer contains `letI` and still includes conductor one.
- R03 — repaired: `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:182` uses that instance in `relativeClassNumber_character_product`, preserving the primitive-conductor Bernoulli factors.
- R04 — repaired: `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:194` uses that instance in `realClassNumber_log_product`, preserving the conductor-indexed logarithmic sums.
- R05 — repaired: `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:223` retains the existential number-field witness and removes only the unnecessary local instance command.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| `conductorNeZero` | Trivial characters at moduli 1, 2, 4; primitive χ₋₄ | Conductors 1, 1, 1, 4 | Each ≠ 0 | Instance retains nonzero-modulus hypothesis |
| `abelianCharacter_gauss_product` | F=ℚ; F=ℚ(i) | τ(1)=1; τ(1)τ(χ₋₄)=2i | i⁰√1=1; i√4=2i | Equal; primitive trivial factor retained |
| `relativeClassNumber_character_product` | F=ℚ(i) | h(F)/h(ℚ)=1/1=1 | B₁,χ=−1/2; Qw(−B₁,χ/2)=1·4·1/4=1 | Equal |
| `realClassNumber_log_product` | F=ℚ; F=ℚ(√5) | hR=1; log((1+√5)/2)=0.4812118251 | Empty product=1; logarithmic sum product=0.4812118251 | Equal |
| `primeLevel_cuspidal_eigenlift` | p=37, k=32; ℓ=2,3 | B₃₂ numerator=−37·208360028141; required c₂=23, c₃=31 | 1+2³¹≡23; 1+3³¹≡31; ε(2)=2³⁰≡11 | Congruences consistent; existence checked against Ribet |
| §4.3 Rosati; A3.9 | E² with product polarization; α=E₁₂ | α†=E₂₁; α††=E₁₂ | αᵀ=E₂₁; (αᵀ)ᵀ=E₁₂ | Same involution |
| §4.3 Tate realization; A4.1 | Zero variety; elliptic curve, ℓ=3, n=1, characteristic ≠3 | Torsion orders 1,9; Tate ranks 0,2 | 3⁰=1, 3²=9; 2g=0,2 | Same field realization |
| §4.3 `homFreeFinite`; A6.7 | Zero variety; non-CM E/ℂ; supersingular E/𝔽̄ₚ | Hom/End ranks 0,1,4 | Bounds 0,4,4 | 0≤0, 1≤4, 4≤4 |
| §4.3 Tate polynomial; A6.11 | [2] on an elliptic curve | P(X)=(X−2)²=X²−4X+4 | det(X−2I₂)=X²−4X+4 | Same trace 4 and determinant 4 |
| §4.3 Rosati positivity; A6.14 | [2] and zero on a principally polarized elliptic curve | Tr(αα†)=8,0 | 2 deg([2])=8; 2 deg(0)=0 | Positive exactly for nonzero scalar |
| §4.4 Hodge–Tate; R07.1.19 | μₚ∞; ℚₚ/ℤₚ | Weight multiplicities (0,1); (1,0) | (dim Gᴰ,dim G)=(0,1); (1,0) | Covariant twist agrees |
| §4.4 subgroup closure; R07.1.24 comparison | Trivial/full generic subgroup of constant ℤ/3 over ℤ₃ | Closure ranks 1,3 | Generic subgroup orders 1,3 | Closure preserves these generic fibers |
| §4.4 full faithfulness; R07.1.30 | Constant ℤ/3 over ℤ₃ and ℚ₃ | Integral endomorphisms: 3 | Generic endomorphisms: 3; e=1<2 | Same maps; strict bound retained |

The adversarial rows for untouched statements stand as in the previous review of `10bc9eb`.

- Sources: 10 locators rechecked—sharifi lines 3312–3385 (Theorem 4.2.20, equation 4.2.2); ribet lines 346–381 (3.5–3.7); milne-av-2022 lines 869–872, 941–943, 1444–1447 (12.5, 12.9, 17.3); raynaud lines 971–998 (3.3.3, 3.3.6).
- Pins: 6 declarations opened—Mathlib `NumberTheory/DirichletCharacter/Basic.lean:254,258` and `NumberTheory/NumberField/Cyclotomic/Galois.lean:188,195,204,214`; conductor nonvanishing is imported, not a new admitted theorem.
- References: all 8 added downstream target citations resolve at AbelianSchemesAndArithmeticModuli #849 and FiniteFlatGroupsAndIntegralPadicHodgeTheory #879; no supplier was added or reversed.
- Signatures: fresh `#check @name` probe elaborated all 30 named declarations; no lost binder or mathematical signature change. Four edited headline theorems resist `simp`, `rfl` and `infer_instance`; the character-subgroup library candidates do not prove their products.
- Gate: PASS, every scanner zero; dependency output: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`.
- Lean: targeted build succeeds (18598 jobs); original-file and signature-probe elaboration exit 0 with 21 `sorry` warnings each. The targeted build additionally reports the existing Mathlib module-system import warning.
- PR text: title, description and `roadmap-summary` agree with the added folder, named instance and downstream allocation; 0 removed headings/theorems and 0 outside-folder changes against the merge base. The seeded source sample has no changed target.

Overlap check: read EulerSystemsCyclotomicMainConjecture, IntegralIwasawaTheory, ArithmeticKTheory, EisensteinIdealAndRationalTorsion, DirichletPadicLFunctions and ClassicalArithmeticCompletion; circular units and norm limits belong to IntegralIwasawaTheory, finite-field Gauss valuations to ClassicalArithmeticCompletion, finite cyclotomic annihilation/regularity to this roadmap, Euler-system main-conjecture applications to EulerSystemsCyclotomicMainConjecture, K-groups to ArithmeticKTheory, Eisenstein torsion to EisensteinIdealAndRationalTorsion, and analytic character branches to DirichletPadicLFunctions. The added allocation assigns the shared abelian/local results to §§4.3–4.4 here; downstream extensions retain their own scope.

Source independence: changed passages only—7 passages compared with 4 external sources, Mathlib and 2 downstream roadmaps; no copied prose or reused material found. Among the 10 rechecked external locators, milne-av-2022 and ribet have the largest share, 3 each. No external-source citation or layer was added, removed or reordered; the overall source distribution and arrangement were not re-reviewed.

## Not verifiable

- tate §4.1, Theorem 3 and Corollary 2, pp.179–180: settled as uncertified; the local ownership comparison uses the supplied downstream text and does not reopen source certification.

## Source issues

- none

## For the human reviewers

- none
