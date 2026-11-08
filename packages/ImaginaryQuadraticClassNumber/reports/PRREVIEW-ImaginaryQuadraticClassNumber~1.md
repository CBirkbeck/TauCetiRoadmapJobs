# Review of ImaginaryQuadraticClassNumber (pull request #1914 at bcfb44a)

**Verdict:** needs changes

This is a revision of the roadmap on main (18bcef2e). The pull request restates H2.3–H2.4 in effective form and makes them "discharged from" AnalyticNumberTheoryPartI §§0.34 and 0.9. The whole folder was reviewed; findings R01–R02 concern the change, R03–R09 the folder as it stands at this head. The gate fails (prnum=7, sorry-data=1), so there is no acceptance in any case.

## R01 (P1) — H2.3–H2.4 are proved from a roadmap that consumes this one: a supply cycle dressed as "consumed downstream"

Location: `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md` line 17 ("H2.3–H2.4 state its quadratic and class-number consequences in effective form, and they are discharged after §§0.34 and 0.9, from those sections"), lines 83 and 87 ("Here c_LS and c are the … constants of AnalyticNumberTheoryPartI §§0.34 and 0.9"; "This is the statement of AnalyticNumberTheoryPartI §0.9 and is discharged from it"), line 172; `Suggested.lean` lines 9–10 and 54.

Claim: targets of this roadmap (`quadratic_LFunction_siegel`, `imaginary_classNumber_lower_bound`, `imaginary_discr_bounded_of_classNumber_le`, the H2.3 bullets) have proofs whose only input for the uniform bound is a section of AnalyticNumberTheoryPartI. That is a supplier citation whatever it is called; the pull-request description's "the dependency order is unchanged" is not true of the mathematics.

Witness: AnalyticNumberTheoryPartI at the head of its pull request, section "From ImaginaryQuadraticClassNumber" (its README line 70): H2.2 supplies ζ_K = ζ·L(s,χ_D) and the class-number formula to it, "Nothing from H2.3–H2.4 is consumed", and its closing merge-order paragraph (line 3188): "ZerosOfLFunctions and ImaginaryQuadraticClassNumber stand before this part … the effective forms of ImaginaryQuadraticClassNumber H2.3–H2.4 (`quadratic_LFunction_siegel`, `imaginary_classNumber_lower_bound`) are stated here (§§0.1, 0.6, 0.9, 0.18, 0.32) and consumed from here by the roadmaps above." Its §0.34 bullet (line 844) adds "ImaginaryQuadraticClassNumber's ineffective H2.4 bounds are not inputs." So AnalyticNumberTheoryPartI ← H2.2 and H2.3–H2.4 ← AnalyticNumberTheoryPartI §§0.34/0.9: a cycle. The dependency check does not see it because the README writes the edge in prose, not as a supplier citation, and because this roadmap is absent from the merge order (it is then placed after its last supplier, which with this edge would be after AnalyticNumberTheoryPartI line 90, breaking that roadmap's citation of H2.2 instead).

Repair (within this pull request): restore the main-branch H2.3–H2.4 (the self-contained real-character estimates and the ineffective Siegel bound, which this roadmap proves and AnalyticNumberTheoryPartI and EffectiveClassNumbers both plan around), restore the three Lean statements to their main-branch forms, and say in the scope section that the effective forms are AnalyticNumberTheoryPartI §0.9 and EffectiveClassNumbers §§4.8–4.9, consumed from there by later roadmaps. The alternative that keeps the effective statements here needs the other pull requests to change first (AnalyticNumberTheoryPartI would cite the pinned `TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one` instead of H2.2, this roadmap would move after it in the merge order, and EffectiveClassNumbers §4.9 would give up the effective class-number bound); it is not available to this pull request alone.

## R02 (P2) — Two owners for each effective statement

Location: `Suggested.lean` lines 56–60 (`quadratic_LFunction_siegel`) and 65–70 (`imaginary_classNumber_lower_bound`); README lines 87–89.

Claim: `quadratic_LFunction_siegel` now states, word for word, AnalyticNumberTheoryPartI §0.9's `quadratic_LFunction_one_lower_bound` (its README line 304: effective absolute c>0 with L(1,χ)≥c/log q for every primitive real nonprincipal χ of conductor q≥3). The effective bound h ≥ (c/π)√|D|/log|D| is owned by EffectiveClassNumbers (pull request #1406, "ImaginaryQuadraticClassNumber, Part II"): its scope (README line 17) lists "the effective power bound h ≥ (c₀/π)√d/log d from a supplied lower bound L(1,χ) ≥ c₀/log q, the computable cutoffs for a fixed class number, the effective form of Siegel's bound" under its own Layer 4, its supplier section (line 97) consumes this roadmap's H2.4 with ineffective constants and "uses none of H2.4's ineffective constants", and its §4.9 (line 1021) derives H2.4's statement from the effective one. The computable discriminant cutoff of H2.4 here is EffectiveClassNumbers §4.8.

Witness: EffectiveClassNumbers README lines 17, 97 and 1018–1021; AnalyticNumberTheoryPartI README line 304 and line 310 ("through the class-number formula of ImaginaryQuadraticClassNumber H2.2 the bound gives h(D)≥c√|D|/log|D| effectively").

Repair: as R01. If the author prefers to keep effective statements in this folder, the owners above must drop theirs first, and the ownership must then be settled in one place; two open pull requests building the same theorem is the defect, not the choice of owner.

## R03 (P2) — `cmTau` is sorry'd data

Location: `Suggested.lean` lines 91–94.

Claim: `def cmTau (D : ℤ) (hD : D < 0) : UpperHalfPlane := ⟨…, by sorry⟩` is a definition whose body contains `sorry` (gate `sorry-data`). Nothing in the file mentions it.

Witness: the gate line "sorry-data (1) … line 91"; the positivity proof is routine (both branches have imaginary part √|D|/2, positive since D ≠ 0) but is absent.

Repair: delete `cmTau` (the README keeps τ_D in H3.1 with its two branches). If a headline is later stated at τ_D, give the membership proof a real body.

## R04 (P2) — Certified procedures and reduction certificates are planned as targets

Location: README line 43 ("Produce a certified procedure returning the entire representative list …"); line 141 ("a complete interval or Thue reduction certificate … The certificate format, soundness, coverage and termination are targets here").

Claim: these are executable procedures and certificate formats, which the roadmap principles exclude; the mathematics they stand for is already stated (and, at the pin, proved) as theorems.

Witness: Tau Ceti at the pin, `NumberTheory/BinaryQuadraticForm/Ideal/ClassNumber.lean` line 176 (`classNumber_eq_card_primitiveReducedForms_of_discr_eq`: h(K) = #primitiveReducedForms n for disc K = −n) and `NumberTheory/ClassNumberOne/HeegnerQuartic.lean` line 266 (`sq_eq_two_mul_mul_pow_three_add_one_iff`, the six integer points of y² = 2u(u³+1) by an algebraic descent, no interval reduction).

Repair: replace the procedure/certificate sentences by the theorem statements (finite reduced-form set, its cardinality equal to h, the exact solution set of the quartic by descent), citing the pinned declarations; keep the mathematical background (3a² ≤ |Δ|, the gcd and dyadic reductions) as prose.

## R05 (P3) — Pull-request numbers, links and process narrative in the README and the Lean docstring

Location: README line 9 (links to five Mathlib pull requests, "The current native Basic.lean", "The active complementary sequence", "when available"); line 19 (a link to this repository's pull request 906 for DiophantineApproximationAndTranscendence); `Suggested.lean` line 8 ("Mathlib PR36347").

Claim: the gate's prnum rule fails (7 hits); line 19 and the docstring are the same defect, and line 9 is process narrative that will not be true in a year.

Witness: gate "prnum (7) … line 9"; DiophantineApproximationAndTranscendence is on main with §3.6 (its README line 2378), §4.1 (2805), §4.3 (2872), §4.4 (2902) and §4.5 (2922).

Repair: cite DiophantineApproximationAndTranscendence by name and section; replace line 9 by what the pin provides (QuadraticAlgebra with its Field instance for nonsquare parameters, `Mathlib/Algebra/QuadraticAlgebra/Discriminant.lean` lines 251–268; the pinned Tau Ceti quadratic modules of R07) with no pull-request references; delete the docstring's PR mention.

## R06 (P3) — Padding and duplication in `Suggested.lean`

Location: `Suggested.lean` lines 21–35 (`QuadraticModel`, `radicandDiscriminant`, `heegnerRadicands`, `heegnerDiscriminants`, `classNumberOneOrderDiscriminants`, `quadraticModelField`), 40–44, 47–49, 84–89, 97–110.

Claim and witnesses (elaborated on a copy of the file against the pins, 12 s, after building the pinned modules):

- `exists_negative_squarefree_presentation` closes with one `exact` from `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top_of_isTotallyComplex` (Tau Ceti `NumberTheory/NumberField/Quadratic/InfinitePlace.lean` line 71; same statement with the existentials reordered).
- `classNumber_congr` closes with `exact RingEquiv.classNumber_eq e.toRingEquiv` (Mathlib, elaborated type checked).
- `heegner_quartic_iff` closes with `simpa` from `TauCeti.sq_eq_two_mul_mul_pow_three_add_one_iff` (`ClassNumberOne/HeegnerQuartic.lean` line 266).
- `cubic_coefficient_triples` is the pinned chain `exists_heegner_of_coeffs` (`ClassNumberOne/FourthPowerCubic.lean` line 76: c⁴=16 and 2(b²−2ac)−(2b−a²)²=0, the same identity up to sign) and `TauCeti.mem_of_tschirnhausPolynomial_X_pow_four_eq` (`HeegnerQuartic.lean` line 299, the same twelve triples).
- `siegelHalf` re-defines `TauCeti.ModularForm.siegelFunction ![0, 1/2]` (`ModularForms/SiegelFunction/Basic.lean` line 84); the pinned expansion `siegelFunction_zero_half` is 2i·exp(πiτ/6)·(∏(1+q^{n+1}))², the same value as the file's product of squares.
- `radicandDiscriminant`, `QuadraticModel`/`quadraticModelField` (an API definition restating the native Field instance) and `classNumberOneOrderDiscriminants` are used by no theorem in the file.

Repair: delete the four one-tactic or restated theorems and the unused definitions; define `gammaTwo` on the native `siegelFunction ![0, 1/2]` and delete `siegelHalf`. For the thirteen orders, either state the H3.6 theorem (it is statable at the pin: `TauCeti.GlobalNumberFields.NumberFieldOrder.discr`, `NumberField/Global/Orders/Discriminant.lean` line 85, and `Pic`, `Picard.lean` line 34: for K imaginary quadratic and O a NumberFieldOrder, `Nat.card (Pic O) = 1 ↔ O.discr ∈ {…}`) or delete the Finset.

## R07 (P3) — The README plans, as targets, results the pinned Tau Ceti already proves, and cites none of them

Location: README H1.2 (line 33, unit counts), H1.3 (lines 41–43, form/Picard bijection and the reduced-form count), H2.1 (line 57, χ_D and its splitting values), H2.2 (lines 63–67, ζ_K = ζ·L and the class-number formula), H3.2 (lines 105–107, g₀g₁g₂ = 2ζ₈, γ₂, eta normalisation), H3.4 (lines 122–129, both product bounds and the √31/√51 inequalities), H3.5 (lines 133–147, quartic and the six γ₂ values), H3.6 (line 151, the small-discriminant enumeration and the easy half).

Witness (Tau Ceti at pin 2fd255d9, elaborated types checked where named):

- `TauCeti.NumberField.Units.card_units_of_isTotallyComplex_of_discr` (`Quadratic/Units.lean` line 162): #𝓞_K^× = 4, 6, 2 by disc K = −4, −3, otherwise.
- `TauCeti.Multiquadratic.fundamentalDiscriminantChar` with `fundamentalDiscriminantChar_discr_eq_zero_iff/_eq_one_iff/_eq_neg_one_iff` (`Multiquadratic/Quadratic/Character.lean` lines 64, 114, 128: ramified/split/inert) and `ringHomComp_fundamentalDiscriminantChar_discr_ne_one` (line 140).
- `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction` (`Quadratic/DedekindZeta.lean` line 199), `dedekindZeta_residue_eq_LFunction_one` (209) and `classNumber_eq_card_units_mul_LFunction_one` (241: h = w√|D|·L(1,χ_D)/(2π)), with the three w specialisations named in its header.
- `TauCeti.BinaryQuadraticForm.posDefProperClassToPic_surjective` (`BinaryQuadraticForm/Ideal/PicEquivalence.lean` line 36), `classNumber_eq_card_primitiveReducedForms` (`Ideal/ClassNumber.lean` line 134), `_of_discr_eq` (176), `card_pic_intAddMulOrder_eq_card_primitiveReducedForms` (151), `classNumber_neg_twenty_eq_two` (header line 67).
- `TauCeti.ModularForm.siegelFunction_zero_half_mul_half_zero_mul_half_half` (`SiegelFunction/Basic.lean`, g₀g₁g₂ = 2·exp(2πi/8)), the eta quotients and S-transformations (`SiegelFunction/Eta.lean`), Weber's cubic (g¹²+16)³ = j·g¹² (`SiegelFunction/JInvariant.lean`).
- `TauCeti.ModularForm.norm_siegelFunction_le_of_le_half`, `norm_siegelFunction_le_of_apply_zero_eq_zero` (`SiegelFunction/Bounds.lean`), `norm_siegelFunction_zero_half_lt_one` (Im τ ≥ √31/2) and `norm_siegelFunction_zero_third_mul_mul_lt_one` (Im τ ≥ √51/2) (`SiegelFunction/ClassNumberOne.lean`).
- `TauCeti.sq_eq_two_mul_mul_pow_three_add_one_iff`, `heegnerGamma_mem` (`FourthPowerCubic.lean` line 139: the six values 0, −32, −96, −960, −5280, −640320), `mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq` (`HeegnerQuartic.lean` line 316).
- `TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants` (`ClassNumberOne/HeegnerNumbers.lean` line 135) and `classNumber_eq_one_iff_of_neg_fifty_one_lt_discr` (`ClassNumberOne/SmallDiscriminant.lean` line 56).

Repair: list these in the scope section as "already in the library" with their names, delete the corresponding targets (keeping what is still open: the full SL₂ law for general r, the finite-level CM reciprocity, the small-power inclusion of H3.3, the uniformization dictionary, the Picard sequence of H1.4), and make the remaining statements consume them.

## R08 (P3) — "Effectively computable" is asserted beyond what the cited primary source states

Location: README line 17 ("an effectively computable absolute c_LS>0"), lines 83–89, 178; `Suggested.lean` lines 51–52.

Claim: the cited source for the exclusion, OpenAI *Uniform exclusion of Landau–Siegel zeros*, Theorem 1, states "an absolute constant c>0" (openai2026lspdf line 23–25) and proves it by contradiction along a subsequence of conductors with (1−β)log q → 0 (lines 444–475, "Taking an upper limit"); the word "effective" does not occur in it. Green's Theorem 1.1 (green2026 lines 27–34) has an O_C(1) term and attributes explicit constants to Banks' exposition (line 23). The effectivity the README asserts for c_LS, c, and "computable from C" is therefore a claim of AnalyticNumberTheoryPartI §0.34, not of the sources this README names.

Repair: cite the source that makes the constant explicit (Banks' exposition, as Green names it) with its theorem number, or state the exclusion with an absolute constant and leave effectivity to AnalyticNumberTheoryPartI's own contract. Also give Davenport's chapter numbers (line 176 names "chapters" only).

## R09 (P3) — Broken supplier link

Location: README line 11, `[NumberFieldArithmetic](../NumberFieldArithmetic/README.md)`.

Witness: on main the roadmap is `Completed/NumberFieldArithmetic/README.md` (the relative path from this folder is `../../Completed/NumberFieldArithmetic/README.md`, as line 11 already does for GlobalNumberFields).

Repair: fix the path.

## Verified sound

**Gate and build.** The worker's gate at bcfb44a: prnum=7, sorry-data=1, everything else 0 (depcheck=0, build=0). `lake env lean Suggested.lean` at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9): 10 `sorry` warnings, no error, 12 s. Elaborated types of all 19 declarations (`scratch/signatures.md`) compared with the README: no dropped binder; `imaginary_classNumber_lower_bound` and `imaginary_discr_bounded_of_classNumber_le` quantify the constant before the field, as the README's "single constant for the family" requires.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 245 roadmaps, 2480 edges, 0 problem(s)`. ImaginaryQuadraticClassNumber is not listed in ORDER.txt; the cycle of R01 is written in prose and is invisible to it.

**Supplier citations resolved.** GlobalNumberFields Layer 11 (Completed, README line 571), ModularForms Layer 11 (line 1204), ClassFieldTheory Layers 10–13 (lines 1552, 1683, 1724, 1799), ArithmeticDirichletSeries (Completed), DiophantineApproximationAndTranscendence §§3.6, 4.1, 4.3–4.5 (main, lines 2378–2922; the superelliptic bound of §4.4 with n=2, N=4, ĥ=log 2 is (4N)^(2^12 N⁴)·e^(50N⁴ĥ) = 16^(4096·4⁴)·exp(50·4⁴·log 2), exactly the README's display at line 139); AnalyticNumberTheoryPartI §0.34 (`landau_siegel_exclusion`, head line 805–807) and §0.9 (`quadratic_LFunction_one_lower_bound`, line 302–304) exist at its head with the statements the README restates. No main roadmap cites H2.3–H2.4; EffectiveClassNumbers (#1406) and AnalyticNumberTheoryPartI (#1126) cite them as in R01–R02. QuadraticCharactersAndReduction (#1904) cites this roadmap's H1–H2 and the pinned `fundamentalDiscriminantChar` only.

**Ownership against open pull requests** was checked for the three closest roadmaps the overlap scan names (#1406, #1904, #1126) by reading their heads; the remaining open pull requests were not searched.

**Sources.** Shin, *Generation of class fields by Siegel–Ramachandra invariants* (shin2010, arXiv 1009.2253v6; PDF page = printed page): Lemma 4.1(i) g₀g₁g₂ = 2ζ₈ (line 699–706, p. 12); Lemma 4.1(ii) γ₂ = (g₀¹²+16)/g₀⁴ (708–711); (19)–(20) x = N_{K(2)/H_K}(g₀¹²) and j = (256−x)³/x² for D≡0 mod 4, (x+16)³/x for D≡1 mod 8 (895–917, p. 15); x divides 2¹² (920); Theorem 4.8 (957–962, 2 inert and 3 unramified: ζ₈g₀(τ_K) generates K(2) over H_K, γ₂(τ_K) generates H_K over K); Table 1 (1114–1117, γ₂ values 0, −32, −96, −960, −5280, −640320 at D = −3, −11, −19, −43, −67, −163); Lemma 5.1 (1121–1130, the two product bounds, p. 17); Theorem 5.2 (1159–1240, p. 18–19: the −31 threshold with the bound 2A^{1/12}e^{2A/(1−A)}·A^{−1/24}e^{2A^{1/2}/(1−A)}, the 21 mod 24 branch with √3A^{1/36}e^{(2A+4A^{1/3})/(1−A)} < 1 for A ≤ e^{−π√51}, and the cubic X³ − γ₂X − 16). OpenAI Theorem 1 (openai2026lspdf line 23–25) and Green Theorem 1.1 (green2026 lines 25–34) as in R08. Numerical: at A = e^{−π√31} the level-two bound is 0.965 < 1; at A = e^{−π√51} the level-three bound is 0.931 < 1.

**Adversarial table.**

| statement | instances tried | values computed | result / change |
|---|---|---|---|
| `quadratic_LFunction_siegel` (Lean 56) | q = 1, 2; q = 3; q = 4 | q ≤ 2 admits only χ = 1 (vacuous, log q > 0 never needed); D=−3: L(1,χ₋₃)=π/(3√3)=0.6046 forces c ≤ 0.664 = (π/(3√3))log 3; D=−4: π/4 forces c ≤ 1.089 | consistent with the README Check at line 167; ownership R01–R02 |
| `imaginary_classNumber_lower_bound` (Lean 65) | D = −3, −4, −163 | √3/log 3 = 1.577 ⇒ c ≤ 0.634; 2/log 4 = 1.443 ⇒ c ≤ 0.693; √163/log 163 = 2.507 ⇒ c ≤ 0.399 = log 163/√163 | matches README line 167; derivation h ≥ 2√|D|(c/log|D|)/(2π) = (c/π)√|D|/log|D| correct |
| `imaginary_discr_bounded_of_classNumber_le` (Lean 76) | B = 0; B = 1 with c = 0.399; the lemma x ≤ a log x ⇒ x ≤ 2a log a | h ≥ 1 so B = 0 is vacuous; (4/c)²log²(2/c) = 261 ≥ 163; a − 2 log a ≥ 0.614 (min at a = 2); f(2a log a) = a·log(a/(2 log a)) = 0.834 at a = e; a ≥ x/log x ≥ e | README proof at line 91 correct; no change |
| H2.3 bullet, real zeros | β = 1 | (1−β)log|D| = 0 < c_LS, and L(1,χ_D) ≠ 0 (pinned `LFunction_apply_one_ne_zero`) | consistent |
| H2.2 formula | D = −3 (w=6), D = −4 (w=4) | L(1,χ₋₃) = 2π/(6√3) = π/(3√3); L(1,χ₋₄) = 2π/(4·2) = π/4 | matches pinned `classNumber_eq_card_units_mul_LFunction_one`; R07 |
| `radicandDiscriminant` (Lean 23) | d = −3, −7, −1, −2 (Int `%` is `emod`) | −3 % 4 = 1 ⇒ −3; −7 ⇒ −7; −1 % 4 = 3 ⇒ −4; −2 ⇒ −8 | agrees with README line 7; unused (R06) |
| `cmTau` (Lean 91) | D = −4, −3, −8 | i; (3+i√3)/2; i√2; Im = √|D|/2 > 0 | values match H3.1; proof sorry (R03) |
| `siegelHalf` vs native g₀ | expansion | both 2i·e^{πiτ/6}·∏(1+qⁿ)², native squares the product, file squares the factors | equal (absolute convergence); R06 |
| `gammaTwo` denominator | g₀ ≠ 0 | pinned `siegelFunction_ne_zero` for r ∉ ℤ² | well defined |
| `heegner_quartic_iff` (Lean 97) | (−1,0), (0,0), (1,±2), (2,±6); negative control u = −2 | 0=0; 0=0; 4 = 2·1·2; 36 = 2·2·9; u=−2 gives 28, not a square | true; native (R06) |
| `cubic_coefficient_triples` (Lean 105) | (−4,28,2), (2,4,2); a odd | 256−1792+1568−32 = 0; 16−64+32+16 = 0; a odd gives 2b²−4b+9 odd ≠ 0 | consistent with "prove a even" (line 143); native (R06) |
| γ₂ ↦ j in the six-value branch | all six | 0, −32768, −884736, −884736000, −147197952000, −262537412640768000 = (−32)³, … | agrees with Shin Table 1 line 1116–1117 |
| H3.6 thirteen orders | (D,f) = (−3,2), (−3,3), (−4,2), (−7,2), (−7,3), (−8,2), (−7,4) | h(O_f) = f·∏(1−χ_D(p)/p)/[unit index]: 2·(3/2)/3 = 1; 3·1/3 = 1; 2·1/2 = 1; 2·(1/2) = 1; 3·(4/3) = 4; 2·1 = 2; 4·(1/2) = 2 | exactly −12, −27, −16, −28 added; the exclusions hold |
| H3.4 thresholds | A = e^{−π√31}, e^{−π√51} | 2A^{1/24}e^{(2A+2√A)/(1−A)} = 0.965; √3A^{1/36}e^{(2A+4A^{1/3})/(1−A)} = 0.931 | both < 1; native (R07) |
| H3.5 superelliptic bound | n=2, N=4, b=1, ĥ=log 2 | DiophantineApproximationAndTranscendence §4.4: (4N)^(2^12N⁴)e^(50N⁴ĥ) = 16^(4096·256)·e^(12800·log 2) | matches README line 139; f = 2U⁴+2U has degree 4 and distinct roots U(U+1)(U²−U+1) |
| `classNumber_eq_one_iff_discr_mem` (Lean 113) | D = −43; D = −20; D = −12 | −43 ∈ set and h = 1 (pinned easy half); h(−20) = 2 (pinned) and −20 ∉ set; no field has discriminant −12 (vacuous) | consistent; the hard half is the open headline |
| `classNumber_eq_one_iff_negative_squarefree_mem` (Lean 119) | d = −1 (D = −4); d = −5; d = −4 | −1 ∈ set; h(ℚ(√−5)) = 2 and −5 ∉ set; d = −4 is excluded by `Squarefree d` (it would give ℚ(i) with −4 ∉ set) | the squarefree hypothesis is needed and present |
| `exists_negative_squarefree_presentation`, `classNumber_congr` | elaboration | closed by one tactic each from the pins | R06 |

**Convention witnesses.** q = exp(2πiτ) and the row-vector right action (README line 21) agree with the pinned `siegelFunction_apply_add_one` (T acts on r on the right). The sign/phase of g₀: README g_r formula (line 101–103) with r = (0,1/2) gives −e^{πiτ/6}·(−i)·2·∏(1+qⁿ)² = 2i·e^{πiτ/6}∏(1+qⁿ)², the pinned `siegelFunction_zero_half`.

## Not verifiable

- H. M. Stark, *A complete determination of the complex quadratic fields of class number one* (1967): Project Euclid's landing page offers no open PDF to the service; not read.
- H. M. Stark, *On the "gap" in a theorem of Heegner* (1969): paywalled (Elsevier DOI); uncertified, cited by locator only.
- Davenport, *Multiplicative Number Theory* and Cox, *Primes of the Form x²+ny²*: books, no legal copy; the class-number and reduced-form facts cited to them were checked against the pinned Tau Ceti instead.
- T. Tao, *A sketch of the proof of non-existence of Siegel zeroes* (2026): an exposition; not read for this review.

## Source issues

- none
