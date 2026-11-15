# Review of ImaginaryQuadraticClassNumber (pull request #2201 at e2a2e76)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 28 and 108 cite the pinned curve, discriminant, j-comparison and point-map properties; the remaining uniformization comparisons are distinguished explicitly.
- R02 — repaired: README lines 28 and 106 cite `coeffSubfield` and `coeffSubfield_cuspDatumInfty_bot`; F_N is their principal-level specialization, with pullback and level maps retained.
- R03 — repaired: README lines 22 and 48 cite `classNumber_eq_two_of_minpoly_eq_X_sq_add_five`, with the integral-generator and field-generation hypotheses.
- R04 — repaired: README lines 26 and 82 cite all three unit-order specializations as complex equalities; the real-valued comparison and lower inequality remain.
- R05 — repaired: README lines 23 and 58 cite `root`, `root_smul` and `root_injective`; the ideal-lattice comparison retains the chosen embedding and proper-action convention.

## Verified sound

In the lattice rows, P denotes `weierstrassPoint`, O the point at infinity, and Λ a square lattice rescaled to g₂=4, g₃=0. L-values were independently evaluated by the finite cotangent sum for odd characters.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| H1.2 class number two | D=−20; parameters −5 and −20 | Reduced forms (1,0,5), (2,2,3): h=2; −20=2²(−5) | agree | pinned citation |
| H1.3 `root` | (1,0,1), (1,1,1), (2,2,3) | τ=i, (−1+i√3)/2, (−1+i√5)/2; imaginary parts 1, √3/2, √5/2 | positive | pinned citation |
| H1.3 `root_smul` | T=[[1,1],[0,1]], f=(1,0,1) | T•f=(1,−2,2); root(T•f)=1+i=T(i) | agree | pinned citation |
| H1.3 `root_injective` | n=4, τ=i; compare (2,0,2) | Re/Im recover (a,b,c)=(1,0,1); (2,0,2) has n=16 | fixed n matters | pinned citation |
| H1.3 ideal-lattice comparison | f=(2,2,3), Δ=−20 | (1/2)(2ℤ+(−1+i√5)ℤ)=ℤ+((−1+i√5)/2)ℤ | agree | retained comparison |
| H2.2 specialization w=6 | D=−3 | L=0.604599788; 3√3·L/π=1=h | agree | pinned citation |
| H2.2 specialization w=4 | D=−4 | L=0.785398163; 4L/π=1=h | agree | pinned citation |
| H2.2 specialization w=2 | D=−7, −20 | L=1.187410412, 1.404962946; √7·L/π=1, √20·L/π=2 | agree | pinned citation |
| H2.2 real formula and inequality | D=−3, −4, −7, −20 | h=(1,1,1,2); √∣D∣L/π=(1/3,1/2,1,2); all L>0 | agree | retained comparison |
| H3.1 `coeffSubfield` | K=ℚ; constant functions 1 and i | Expansions 1 and i; membership true and false, respectively | discriminates | pinned citation |
| H3.1 `laurentQExpansion_injective` | Constants 0 and 1 | Expansions 0≠1; equal zero expansions give the same zero function | consistent | pinned citation |
| H3.1 `orderTop_laurentQExpansion` | F=0, 1, j at ∞ | Expansion orders ⊤, 0, −1 equal cusp orders ⊤, 0, −1 | agree | pinned citation |
| H3.1 F₁=ℚ(j) | 1, j, constant i | Both fields contain 1,j and exclude i; j=q⁻¹+744+196884q+… | agree | pinned citation |
| H3.1 F_N cusp normalization | N=1,2,3; τ=i | Widths 1,2,3; q_N=e^(−2π/N), q_N^N=e^(−2π)=q₁ | agree | explicit specialization |
| H3.1 finite-level action | N=2,3; diagonal d=2 at N=3 | GL₂/±I orders 6,24; ζ₃↦ζ₃², twice gives ζ₃⁴=ζ₃ | consistent | retained action |
| H3.1 `weierstrassCurve` | g₂=4, g₃=0; (x,y)=(1,0) | a₄=−1,a₆=0; y²=0=x³−x | agree | pinned citation |
| H3.1 `weierstrassCurve_eq_of_lattice_eq` | Basis (ω₁,ω₂)→(ω₁,ω₁+ω₂) | Both spans Λ; invariants (4,0) and coefficients (−1,0) coincide | agree | pinned citation |
| H3.1 `weierstrassCurve_smul` | c=2 | g₂'=1/4, g₃'=0; a₄'=−1/16=2⁻⁴a₄; a₆'=0 | agree | pinned citation |
| H3.1 `weierstrassCurve_Δ` | g₂=4,g₃=0 | Native Δ=−16·4(−1)³=64=4³−27·0² | agree | pinned citation |
| H3.1 `weierstrassCurve_Δ_ne_zero` | Λ and 2Λ | Δ=64 and 1/64; both nonzero | consistent | pinned citation |
| H3.1 `weierstrassCurve_j` | Λ and 2Λ | 1728·64/64=1728; 1728·(1/4)³/(1/64)=1728 | agree | pinned citation |
| H3.1 `weierstrassCurve_j_periodPair` | τ=i | g₃=0; algebraic j=1728=modular j(i) | agree | pinned citation |
| H3.1 `weierstrassPoint` | z=0; nonzero half-period u | P(0)=O despite wp(0)=wp′(0)=0; P(u)=(e,0), e³−e=0 | distinguishes infinity | pinned citation |
| H3.1 `weierstrassPoint_add_coe` | z=0 and u, λ∈Λ | P(λ)=O=P(0); P(u+λ)=(e,0)=P(u) | agree | pinned citation |
| H3.1 `weierstrassPoint_neg` | z=0 and half-period u | P(−0)=O=−O; P(−u)=(e,0)=−P(u) | agree | pinned citation |
| H3.1 `weierstrassPoint_eq_zero_iff` | z=0 and half-period u∉Λ | At 0: true↔true; at u: false↔false, P(u)=(e,0)≠O | both directions | pinned citation |
| H3.1 holomorphic projective lift | t→0, t=0 | [2wp/wp′:1:2/wp′]→[0:1:0]; affine point tends to O=P(0) | agree | pinned citation |
| H3.1 local injectivity | t→0 | wp/wp′=−t/2+O(t⁵); derivative −1/2≠0 | consistent | pinned citation |
| H3.1 surjectivity | O and three nonzero 2-torsion points | P(0)=O; half-periods give (1,0),(0,0),(−1,0), each satisfying y²=x³−x | consistent | pinned citation |
| H3.1 remaining quotient/additivity comparison | Nonzero half-period u | P(u+u)=P(2u)=O=2(e,0); [2u]=[0] in ℂ/Λ | consistent | retained target |

The adversarial rows and padding checks for untouched statements stand as in the previous review of `aabc576`.

- Pinned declarations opened and signatures checked: 7 in `TauCeti/NumberTheory/Multiquadratic/MinusFive/ClassNumber.lean:201`, `TauCeti/NumberTheory/BinaryQuadraticForm/Root.lean:65` (also 99,107), and `TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.lean:262` (also 275,288).
- Pinned declarations opened and signatures checked: 18 in `TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean:137` (also 152,209), `TauCeti/NumberTheory/ModularForms/LevelOne/FunctionField.lean:259`, and `TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.lean:149` (also 167,175,181,203,214,227,260,280,285,298,438,476,538).
- Sources: 25 added library citations in the seeded “Already in the pinned Mathlib and Tau Ceti” passage checked; shin2010 §2, pp.2–3, lines 70–99 supports the F_N normalization and action. No new literary locator requires certification.
- Cross-roadmap citations: 0 unresolved by the resolver; H3.1 supplier scope checked against `TauCetiRoadmap/ClassFieldTheory/README.md:1781` and 1924, `TauCetiRoadmap/EllipticCurves/README.md:150`, and the modular-curve/form scope passages.
- Gate: all counters 0, `OK`; dependency output: `depcheck: 245 roadmaps, 2219 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Lean: targeted build succeeds; direct elaboration gives exactly 6 `sorry` warnings; all 6 headline signatures and 25 added library names checked with `#check @name`, with no lost binder or changed signature, at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.
- Pull-request text: title, prose and `roadmap-summary` match the revision; 0 heading changes, 0 Lean changes, 0 roadmap-supplier changes, 1 consumer deletion and 0 outside-folder changes; #1810's closure as a duplicate is confirmed by the author's [closing comment](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1810#issuecomment-6800909330).

Overlap check: read EffectiveClassNumbers, ComplexMultiplicationAndExplicitReciprocity, MultiquadraticPartII, ArithmeticStatisticsPartV, ErdosProgressionPowers, QuadraticCharactersAndReduction, AnalyticNumberTheoryPartI and ClassicalArithmeticCompletion; the newly cited arithmetic, form-root, class-number-formula and analytic point-map objects belong to pinned Tau Ceti; elliptic CM comparisons are consumed from ImaginaryQuadraticClassNumber, effective estimates belong to EffectiveClassNumbers/AnalyticNumberTheoryPartI, and statistical and real-quadratic extensions remain with their respective owners.

Remark on previously passed scope: the pre-existing uniformization target also occurs in `TauCetiRoadmap/ModularForms/README.md:1326` (§10D); this overlap was not introduced by the repair and is outside incremental findings.

Remark on the unchanged Lean file: Lake emits a module-system advisory; direct `lake env lean` emits only the six admitted-theorem warnings.

Source independence: changed passages only; 9 changed passages compared with 6 pinned source modules and shin2010 §2, with no copied nonmathematical expression or reused source material identified. Largest share of added source locators: `Uniformization.lean`, 14 of 25 declaration citations; 0 literary locators added. No layer was added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- davenport1980, Chapters 6 and 21: settled as uncertified; the unchanged literary reference was not reopened.
- stark1969, pp.16–27, and the previously recorded Stark 1967 reference: inherited source limitations; no changed literary claim depends on reopening them.
- Cox, Theorems 7.7 and 7.24 and §12: the previous review's unread-source limitation remains outside the changed citations.

## Source issues

- none

## For the human reviewers

- none
