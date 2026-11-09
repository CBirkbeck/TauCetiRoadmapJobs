# Review of ImaginaryQuadraticClassNumber (pull request #1914 at b15c6a7)

**Verdict:** accepted

This is an incremental re-review of the 22 lines of `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md` changed since b14c5bb. `Suggested.lean` is unchanged, and no file outside the folder changed. All four previous findings are repaired. The repairs introduce no new problem, and the gate passes.

## Findings

None.

## Previous findings

- R01 — repaired: line 85 now reads "Its comparison with the primitive character χ′ inducing it is Mathlib's: χ′ is `DirichletCharacter.primitive_mul` … `changeLevel_primitiveCharacter` with `LFunction_changeLevel` give L(s,χ.mul ψ)=L(s,χ′)·∏…". Line 27 lists the five Mathlib declarations. The "What remains" list of line 89 no longer contains the conductor comparison.
- R02 — repaired:
  - Line 87 adds the target "‖L(1,χ)‖≤1+log n for every nonprincipal Dirichlet character χ of level n, primitive or not". It also gives the consequence h(D)≤√|D|(1+log|D|)/π for every negative fundamental D≡1 mod 8.
  - Line 197 names that bound for AnticyclotomicLocalUnits. The bound implies the requested h(d)≤√|d|(2+log|d|)/π.
  - The gap slug is not written. The supplier's README does not need it, because the slug lives in the consumer's plan.
- R03 — repaired: line 13 reads "[ModularForms Layer 11](../ModularForms/README.md)" with no fragment. Layer 11 exists both on main (ModularForms README line 1204) and at the open revision's head (line 1459).
- R04 — repaired:
  - (a) Line 47 reads "Mathlib `NumberField.classNumber_eq_one_iff` and Tau Ceti `NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid`", and "Tau Ceti `RingEquiv.classNumber_eq`".
  - (b) Lines 22 and 45 add `map_ringOfIntegersEquivHalf_symm_span`, and line 22 describes both transports.

## Verified sound

**Gate.** I re-ran the gate on b15c6a7. It printed `gate ImaginaryQuadraticClassNumber: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate line also has `build=0`. `git diff --stat origin/main...HEAD` lists no file outside the folder.

**Dependency check.** The `--movable` check printed `depcheck: 239 roadmaps, 2365 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The change adds no supplier edge. Line 197 names a consumer, and every new citation is of Mathlib or Tau Ceti.

**Elaboration.** `lake env lean TauCetiRoadmap/ImaginaryQuadraticClassNumber/Suggested.lean` gives six `declaration uses sorry` warnings (lines 34, 44, 54, 68, 78, 90) and nothing else. The file is unchanged since 1513bb4 (`git diff --stat b14c5bb HEAD` lists only README.md). So the binder comparison and the one-tactic padding probe of the earlier reports carry over: six theorems, no definition, no lost binder, none closing in one tactic. The seventh "declaration" `number` in the worker's signature list is the extractor misreading the docstring words "class number one".

**Seeded sample: "Already in the pinned Mathlib and Tau Ceti".** I elaborated the 12 declarations that the changed bullets (lines 22 and 27) and the changed sections (lines 45, 47, 85, 87 and 91) newly name or re-attribute, each with `#check @` at the pins. The probe file elaborated with no error. Each has the hypotheses and conclusion the README gives.

Tau Ceti:
- `DirichletCharacter.LFunction_eq_mul_integral` (`TauCeti/NumberTheory/DirichletCharacter/LFunction/Bounds.lean:47`): χ ≠ 1 and 0 < Re s give `LFunction χ s = s * ∫ t in Ioi 1, (∑ k ∈ Icc 1 ⌊t⌋₊, χ k) * t^(-(s+1))`.
- `DirichletCharacter.norm_sum_Icc_le_level` (`TauCeti/NumberTheory/DirichletCharacter/PartialSum.lean:49`): χ ≠ 1 gives `‖∑ k ∈ Icc 1 n, χ k‖ ≤ N` for every n, over any normed field.
- `QuadraticAlgebra.map_ringOfIntegersEquivHalf_symm_span` (`TauCeti/NumberTheory/NumberField/Quadratic/PrimeDecomposition.lean:251`), for squarefree d with d % 4 = 1: the ideal (p, ω − r) maps to (p, halfGen − r). Its companion `map_ringOfIntegersEquiv_symm_span` (line 126) maps it to (p, integralSqrt − r) when d % 4 ≠ 1.
- `NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid` (`TauCeti/NumberTheory/NumberField/ClassNumber/RingEquiv.lean:143`).
- `RingEquiv.classNumber_eq` (same file, line 115): K ≃+* L gives equal class numbers.
- `DirichletCharacter.residue_pair_mul_of_mul_ne_one` (`TauCeti/NumberTheory/LSeries/Quadratic/Pair/Residue.lean:124`): the residue equals `LFunction χ 1 * LFunction ψ 1 * LFunction (χ.mul ψ) 1 * w 1`. This is the identity line 91 uses.

Mathlib:
- `DirichletCharacter.primitive_mul` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:424`) is `primitiveCharacter (mul χ ψ)` at level `(χ.mul ψ).conductor`.
- `primitive_mul_isPrimitive` (line 432).
- `conductor_dvd_level` (line 250).
- `changeLevel_primitiveCharacter` (line 309).
- `LFunction_changeLevel` (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:149`), under `χ ≠ 1 ∨ s ≠ 1`. That hypothesis is stated on line 27, and line 85's "for s≠1" is the case it uses.
- `NumberField.classNumber_eq_one_iff` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:75`) is the Mathlib PID form, as line 47 now says.

**The new H2.3 target (line 87).** The argument is complete as written:
- by `LFunction_eq_mul_integral` at s = 1, L(1,χ) = ∫_(t>1) S(t) t⁻² dt;
- ‖S(t)‖ ≤ ⌊t⌋ ≤ t, and ‖S(t)‖ ≤ n by `norm_sum_Icc_le_level`;
- so ‖L(1,χ)‖ ≤ ∫₁ⁿ dt/t + ∫_(t>n) n t⁻² dt = log n + 1.

I checked the closing identity in Lean at the pins: `(∫ t in 1..n, t⁻¹) + n·(1/n) = log n + 1` for n ≥ 1, by `integral_inv_of_pos` and `field_simp`.

The class-number consequence follows from h = w√|D| L(1,χ_D)/(2π) (`classNumber_eq_card_units_mul_LFunction_one`) at level |D|. It gives h ≤ (w/2)√|D|(1+log|D|)/π, and w = 2 away from D = −3, −4. Line 91's use of the bound is the standard step of Siegel's proof:
- in the simple-pole case λ = L(1,χ)L(1,ψ)L(1,χψ), by the pinned residue identity with w = 1;
- dividing λ by the bounds at the fixed character (level M) and at the product (level lcm(M,N)) gives the lower bound for the remaining factor.

**Duplication and ownership.** No pinned declaration bounds ‖L(1,χ)‖ by a logarithm: grep of the pinned Mathlib and Tau Ceti for `LFunction … 1‖ ≤` finds nothing. I ran `roadmaps grep` over main and the 466 open heads for L(1,χ) upper bounds. It finds only two:
- ExplicitZetaBounds (README lines 670 and 3725–3751) has explicit Ramaré-type bounds |L(1,χ)| ≤ (1/2)log q + c for primitive χ.
- ExplicitNumberFields (README line 685) has the same kind of bound.

Both are later in the merge order (positions 265 and 270), and this roadmap is on main. They state different, sharper statements for primitive characters only, while H2.3 needs the imprimitive product `χ.mul ψ`. So this roadmap owns the crude level-uniform bound, and neither statement is a second owner of it. The overlap file lists no open pull request that changes this roadmap and no dropped id. `roadmaps resolve` found no unresolved citation or Lean name.

**Cross-roadmap citations of the changed text.**
- AnticyclotomicLocalUnits (open head edf0493): README line 138 states the gap "h(d)≤sqrt(|d|)(2+log|d|)/π_real for negative fundamental discriminants d≡1 modulo 8". Lines 646 and 722 cite H2.1–H2.3 with that gap. The board's `packages/AnticyclotomicLocalUnits/design/plan.json` has the slug with supplier ImaginaryQuadraticClassNumber and section H2.3.
- ModularForms Layer 11: main README line 1204 and open head 75cafd5 line 1459.
- No roadmap on main cites ImaginaryQuadraticClassNumber.

**Remark on untouched text.** The H2.4 sentence that w = 6, 4 "only strengthen the inequality" (line 97) was passed before and is unaffected.

**Adversarial table.** Rows marked "carried" are the rows of the previous report (PRREVIEW-ImaginaryQuadraticClassNumber~3) for statements this change leaves untouched. The other rows are recomputed here for the changed lines.

| # | statement | instances | values computed | result |
|---|---|---|---|---|
| 1 | `quadratic_LFunction_siegel` (carried, ~3 row 1) | q ≤ 2; χ₋₃, χ₋₄, χ₅ | only χ = 1 at q ≤ 2; c ≤ 0.675, 0.902, 0.506 at ε = 0.1 | true; Lean unchanged |
| 2 | `imaginary_classNumber_lower_bound` (carried, row 2) | D = −3, −4, −163 | c ≤ 0.644, 0.574, 0.130 at ε = 0.1 | consistent |
| 3 | `imaginary_discr_bounded_of_classNumber_le` (carried, row 3) | B = 0, 1 | B = 0 vacuous; B = 1 forces C ≥ 163 | true |
| 4 | `classNumber_eq_one_iff_discr_mem` (carried, row 4) | D = −43, −20, −15, −23 | h = 1, 2, 2, 3 | consistent |
| 5 | `classNumber_eq_one_iff_negative_squarefree_mem` (carried, row 5) | d = −1, −3, −5, −4 | 1, 3 ∈ set; h(−5) = 2; −4 excluded by `Squarefree` | consistent |
| 6 | `pic_eq_one_iff_discr_mem` (carried, row 6) | (D,f) = (−3,2), (−3,3), (−4,2), (−7,2), (−11,2), (−4,4) | Pic orders 1, 1, 1, 1, 3, 2 | the 13 values exact |
| 7 | H1.1 naturality and isomorphism criterion (carried, rows 7–8) | d = −1, −2; (−20,−5), (−1,−2) | ι(σ(i)) = −i = conj ι(i); −80 = 2²(−20); −4 = u²(−8) has no rational u | correct |
| 8 | H1.2 exceptional generators and coordinates (carried, rows 9–10) | i; (1+√−3)/2; z = 1+√−5; (1+√−7)/2 | orders 4 and 6; N = 6, 2; Tr = 2, 1 | correct |
| 9 | H1.2 ideal transport, both residues mod 4 (changed, lines 22 and 45) | d = −7 (≡ 1 mod 4), p = 2, r = 0; d = −5 (≢ 1), p = 2, r = 1 | ω² = ω − 2, so ω(ω−1) = −2 ∈ (2), giving (2,ω) ↦ (2,η) with N(η) = (1+7)/4 = 2. N(√−5 − 1) = 6 and 2 ∣ −20, so (2, √−5−1) is the ramified prime | the Half companion is needed for d = −7; matches both pinned statements |
| 10 | H1.2 PID/UFD and transport attributions (changed, line 47) | Q(i); Q(√−5) | h = 1: PID and UFD. h = 2: 6 = 2·3 = (1+√−5)(1−√−5), so neither. Q-isomorphism from −20 = 2²(−5) gives h(Q(√−5)) = 2 | Mathlib PID form (ClassNumber.lean:75); Tau Ceti UFD form and `classNumber_eq` (RingEquiv.lean:143, 115) |
| 11 | H1.2 prime factorization, H1.3 group law, reduced forms, H2.1 splitting, H2.2 specialization (carried, rows 11, 13–16) | d = −5 at p = 2, 3, 11; n = 20, 23; χ₋₄(2), χ₋₇(2), χ₋₁₁(2); D = −3, −4, −7 | ramified, split, inert; (2,3,4) has order 3 = h(−23); values 0, 1, −1; L(1) = 0.6046, 0.7854, 1.1874 | consistent |
| 12 | H2.3 four-factor product, poles and pinned bounds (changed line 85; statements as before) | χ = ψ = χ₋₄; χ₋₄ at s = 1, 2, 1/2 | χ₋₄·χ₋₄ is principal mod 4, giving order −2. ‖L‖ = 0.785, 0.916, 0.668, all ≤ 4‖s‖/Re s = 4 | matches the pinned statements |
| 13 | H2.3 product-character comparison (changed, lines 27 and 85) | χ₋₄·χ₋₄ at 4; χ₋₄·χ₈ at 8; χ₁₂·χ₋₄ at 12 | χ′ = 1 of conductor 1, giving ζ(s)(1−2^(−s)), so s ≠ 1 is needed. χ′ = χ₋₈ of conductor 8, factor at 2 equals 1. χ′ = χ₋₃ of conductor 3 (values at 1, 5, 7, 11: 1, −1, 1, −1 on both sides), factor (1+2^(−s)); at s = 2 both sides are 0.976628 | correct; hypothesis "s≠1 or χ′≠1" stated |
| 14 | H2.3 bound ‖L(1,χ)‖ ≤ 1+log n (new, line 87) | χ₋₃ (n = 3); χ₋₄ (4); χ₋₄ at 12; quartic χ mod 5 (χ(2) = i); n = 1, 2 | 0.6046 ≤ 2.0986; 0.7854 ≤ 2.3863; π/3 = 1.0472 ≤ 3.4849; ‖0.8648+0.2042i‖ = 0.8886 ≤ 2.6094. At n = 1, 2 there is no nonprincipal χ; the principal χ is excluded (pole) | true; integral identity checked in Lean |
| 15 | H2.3 class-number form (new, line 87) | D = −3 (w = 6), −4 (w = 4), −7, −15, −23, −163, −3299 (h = 27) | bounds 3.471, 3.038, 2.481, 4.571, 6.313, 24.76, 166.4 against h = 1, 1, 1, 2, 3, 1, 27 | true; the w/2 factor is kept at D = −3, −4 |
| 16 | Simple-pole residue in the comparison (new, line 91) | `residue_pair_mul_of_mul_ne_one` with w = 1 | residue = L(1,χ)L(1,ψ)L(1,χ.mul ψ); L(1,ψ) ≥ λ/((1+log M)(1+log lcm(M,N))) | correct |
| 17 | New Checks, lines 186–187 | as written | ζ(s)(1−2^(−s)), order −2; χ₋₈ of conductor 8; π/4 = 0.785 ≤ 2.386; (π/4)(1+1/3) = π/3 = 1.047 ≤ 3.485; 2.48 and 6.31 | all values reproduce |
| 18 | H3.2–H3.6, Checks 178–179 (carried, rows 20–27) | r = (0,1/2), τ = i√2; D = −8, −7; A = e^(−π√31), e^(−π√51); γ values | 2ζ₈; j = 8000, −3375; 0.96526, 0.93087; −32, −96, −960, −5280, −640320 | consistent |
| 19 | Consumer line 197 against AnticyclotomicLocalUnits line 138 (changed) | D = −7, −15, −23; their p = 53 | 1+log bounds 2.481, 4.571, 6.313 ≤ their 2+log bounds 3.323, 5.804, 7.840; their √424(2+log 424)/π = 52.76 < 53 | gap covered |
| 20 | Line 13 link (changed) | main; open ModularForms head | Layer 11 at line 1204 on main and line 1459 at the head; no fragment | holds at both |

## Not verifiable

- H. Davenport, *Multiplicative Number Theory*, Chapter 21: the References entry of line 219 assigns it to H2.3. It is settled as uncertified (davenport1980) and was not read. The new target of line 87 has no locator of its own. Its argument is complete in the text from two pinned declarations, and I checked it above. Whether Chapter 21 itself states the log-bound was not checked.
- H. M. Stark (1967, 1969) and D. A. Cox, *Primes of the Form x²+ny²*: neither is cited for any changed claim. Stark is settled as uncertified, and Cox has no manifest entry. I did not read them this round.
- I checked ownership against open pull requests with `roadmaps grep` over all 466 heads, for the new object (an upper bound for L(1,χ)) and for this roadmap's name. I read AnticyclotomicLocalUnits and ModularForms at the cited lines, and ExplicitZetaBounds and ExplicitNumberFields only at the lines the grep returned.

## Source issues

- none
