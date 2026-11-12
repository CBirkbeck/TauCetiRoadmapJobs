# Review of CrystallineCohomologyPartII (package, round 2)

**Verdict:** needs changes

Nine findings: three P1, three P2 and three P3. The package is repairable. Its five Lean headline theorems elaborate, but elaboration does not detect the false Wω assertion or the correspondence error below. No package source file was changed during this review.

The previous findings were checked before the new pass:

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: missing statable headlines | Repaired | README §6.4 now says “The statement of (ii) is `card_rationalPoints_modEq_of_cohomologyPullback_bijective`”; §§6.9 and 6.14 name the theta and Esnault theorems. All three signatures are present and elaborate. The former absolute boundary-case theorem is deleted. |
| F02: supplier names and locators | Partly repaired | The contract now says “§CR.3:duality.1, proper smooth crystalline trace”; §0.1 imports “Witt schemes on locally p-nilpotent schemes”; §5.2 imports “§5.4, plurinodal alteration theorem”. These resolve at the heads. The replacement “canonical sheaf ω_X of SchemeAndStackFoundations §2.20” still has a hypothesis mismatch: R07. |
| F03: pinned names and assumptions | Repaired | The contract says “At the pinned Mathlib” and “perfect ring of characteristic p (no domain hypothesis)”. The three Witt identity locations are 43, 102 and 141; Chevalley–Warning is at 110. The declarations were opened again at the pin. |
| F04: source-manifest coverage | Repaired | The manifest now uses README locators, for example `cited_for = ["§4.3"]` for Gro85. All 25 reference keys are present. The nine formerly unattached works now have in-text locators; the available newly attached passages were read, with the settled inaccessible works recorded below. |

The repair report did not mark any finding “not actionable in this package”. Its maintainer note explicitly acknowledges the remaining normal-versus-Cohen–Macaulay mismatch; it does not justify the citation. The changed definitions, theorem signatures, examples and supplier passages were reviewed afresh. Earlier adversarial rows were reused only where they contained computed values, and the seeded targets were checked again.

## R01 (P1) — The Wω assertion for a positive-dimensional fibration is false

**Location:** `packages/CrystallineCohomologyPartII/README.md:1356`, §5.12: “When Y is itself Witt-rational, all these positive-degree direct images vanish”. The second displayed direct-image identification and proof steps 2–4 have the same error.

**Claim:** The positive cohomological degrees of Wω on X identify with the same positive degrees of the Witt singularity complex of Y, without a relative-dimension shift.

**Witness:** For f: ℙ¹_k → Spec k, every hypothesis holds, but H¹(ℙ¹,Wω)_ℚ = W(k)_ℚ ≠ 0, whereas H¹(WS₀,k) = 0. The package's §4.2 trace example already computes the nonzero group.

**Exact repair:** Keep the WO statement. Replace the Wω statement and its proof with the dimension-shifted statement: with r = dim X − dim Y, compare Rⁱf_*Wω_X,ℚ to Hⁱ⁻ʳ(WS_dimY,Y), retaining the corresponding internal grading shift in the de Rham–Witt category. Include the degree-zero term on the base when i = r; it cannot be discarded by restricting the base to positive degrees. Track both grading changes through Proposition 4.8.4, rather than importing its final unshifted formula. State vanishing outside relative degree r when Y is Witt-rational. Add ℙ¹ → Spec k and the identity map as Checks: respectively R¹ = W(k)_ℚ and R⁰ = Wω, with other degrees zero. No assertion that all positive Wω direct images vanish should remain.

This error is also in the cached source: CR12 lines 4544–4558, Theorem 4.8.1, p. 96. The proof introduces r at lines 4645–4647 and loses it at lines 4656–4665. Agreement with that printed formula is not evidence of truth.

## R02 (P1) — Target projection is confused with source restriction

**Location:** `packages/CrystallineCohomologyPartII/README.md:1045`, §4.6: “a correspondence supported over a proper closed subset of Y … acts by a bounded-torsion map on ⊕_q R^qf_*WO_X”.

**Claim:** Positive codimension on the target kills the full action on source WO, for the category containing correspondences of every degree.

**Witness:** Take X = Spec k, Y = ℙ¹_k and Z = {x} ⊂ X × Y. It sends 1 ∈ H⁰(X,WO) to cl(x) ∈ H¹(Y,WΩ¹), whose trace is 1. No nonzero integer kills it.

**Exact repair:** Say that the projection of the image to target WO is bounded torsion. Restrict the source-WO-to-target-WO consequence to degree-zero correspondences. Keep the separately justified source-Wω assertion. Add the point inclusion above: its target-WO projection is zero, while its full image has trace 1. CR12 Lemma 3.6.1, lines 3202–3212, pp. 67–68, gives the projection statement. The earlier assertions (i) and (ii) of this target have the correct bidegrees; its “In particular” does not follow at the stated generality.

## R03 (P1) — Rational reduction cannot specialize a tube function to the special fibre

**Location:** `packages/CrystallineCohomologyPartII/README.md:716`, §3.2 API: “Composed with `WO_{X,K}` → O_X ⊗ ℚ-type reduction (first ghost component), it is the specialization of functions on the tube.”

**Claim:** First-component reduction after rationalization supplies a specialization to characteristic-p functions.

**Witness:** For X = Spec 𝔽_p and P = Spf ℤ_p, the tube map is id: ℚ_p → ℚ_p. But O_X ⊗ ℚ = 0. There is no unital ring map ℚ_p → 𝔽_p.

**Exact repair:** Delete this rational-specialization API claim. Replace it by the integral compatibility P(J_n) → W_nO_X → O_X with the PD augmentation to O_X. Test it on ℤ/pⁿ → 𝔽_p: 1 maps to 1 and p maps to 0; after rationalization the characteristic-p target is zero. Retain the actual rational tube-to-Witt map, which is id on ℚ_p in this example. BBE07 Proposition 4.4, lines 943–1000 and its integral construction, pp. 23–25, supports the actual construction, not the asserted rational reduction.

## R04 (P2) — Layer 0 contains a dependency cycle

**Location:** `packages/CrystallineCohomologyPartII/README.md:134`, §0.1 route: “the tower is Rlim-acyclic (§0.7)”; §0.7's Needs at line 291 includes §0.1 and §0.2. Section 0.2's Needs at line 155 includes §0.8.

**Claim:** The targets are in a build order in which each construction's inputs have already been supplied.

**Witness:** The written edges give 0.1 → 0.7 → 0.1, and 0.1 → 0.7 → 0.2 → 0.8 → 0.1. For the tower W_n(𝔽_p), the needed elementary calculation is independently lim¹ ℤ/pⁿ = 0.

**Exact repair:** Put affine Witt acyclicity and the surjective-tower criterion before the Rlim assertion in §0.1, using the already named tower supplier directly; remove its reliance on §0.7. Separate the proper-scheme equivalence of tensor and isogeny vanishing from the elementary rationalization definitions in §0.2 and place that result after §0.8. Give the substatements their actual Needs. On W_n(𝔽_p), this order constructs ℤ_p = lim ℤ/pⁿ and proves lim¹ = 0 before invoking proper finiteness. The inter-roadmap dependency gate does not inspect this internal cycle.

## R05 (P2) — The h-descent supplier gap already has suppliers

**Location:** `packages/CrystallineCohomologyPartII/README.md:62`, and the `h-descent-formalism` entry of `packages/CrystallineCohomologyPartII/design/plan.json`: “What ArcTopologyAndDescent must provide (gap:h-descent-formalism)”.

**Claim:** The h-topology, universal descent laws and proper/open refinement are missing supplier work.

**Witness:** PR #1755, `TauCetiRoadmap/ArcTopologyAndDescent/README.md:275`, :298 and :343 supplies §§1.1, 1.3 and 1.6. The last imports refinement from PR #1057, `TauCetiRoadmap/PrismaticCohomology/README.md:2283`, which states exactly the requested factorization.

**Exact repair:** Replace this gap by ordinary contracts for ArcTopologyAndDescent §§1.1, 1.3 and 1.6, explicitly resolving the refinement through PrismaticCohomology §2.0. Retire only this entry from the plan's gaps list and update its dependent Needs; keep the qcqs Frobenius-factorization gap. Both suppliers precede this roadmap. As a check on the factorization's direction, ℙ¹_X → X takes identity open factor followed by the proper surjection; a finite affine open cover takes the given open factor followed by id_X. The gap requests no additional generality beyond those suppliers.

## R06 (P2) — Existing slope summands and the Witt lifting section are planned again

**Location:** `packages/CrystallineCohomologyPartII/README.md:679` and :682, §3.1 API: “the F-stable subspace E_λ” and “E = ⊕_λ E_λ”; :712, §3.2 API, constructs the ghost-characterized map s_φ again.

**Claim:** These are constructions belonging to this roadmap's API, with their own construction routes.

**Witness:** PR #857, `TauCetiRoadmap/CrystallineCohomology/README.md:6621` owns the canonical perfect-field slope summands and decomposition. Its :5209 target and :5218 proof construct A → W(A) with ghost coordinates φⁿ for every p-torsion-free Frobenius lift.

**Exact repair:** Move these ownership statements to Scope and ownership and the exact parent contracts; remove their duplicate API/construction obligations. Start §3.1 with the supplied E_λ and retain the cutoff, exactness and determinant-factor application. Start §3.2 with the supplied Cartier–Dieudonné–Dwork section; retain its new PD-envelope and tube application. The parent constructs A → W(A) before imposing reducedness on the further target S, so “for reduced targets” is not a reason to reconstruct this step here. Test the imported interfaces on F = pσ (slope 1, cutoff below 1 zero), and A = ℤ_p[t], φ(t) = tᵖ (s_φ(t) = [t], ghost coordinate t^(pⁿ)).

## R07 (P3) — The repaired canonical-sheaf citation still assumes too much

**Location:** `packages/CrystallineCohomologyPartII/README.md:883`: “For X normal, W_1ω_X ≅ ω_X (the canonical sheaf ω_X of SchemeAndStackFoundations §2.20).”

**Claim:** The cited supplier defines this sheaf for every normal variety.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4515` requires Cohen–Macaulay fibres. A normal three-dimensional cone over an abelian surface need not be Cohen–Macaulay: H¹(A,O_A) has dimension 2, violating the cone criterion at CR12 lines 4454–4456.

**Exact repair:** Define the canonical sheaf in this sentence as H⁻ᵈ of the supplied dualizing complex, using SchemeAndStackFoundations §2.21 and the existing §4.1 construction. Cite §2.20 only for its Cohen–Macaulay specialization. Do not narrow normal X to Cohen–Macaulay X. For the cone above, H⁻³ of the dualizing complex exists although the complex need not be concentrated there. The repair report's maintainer note recognizes precisely this mismatch; replacing the old locator did not finish the repair.

## R08 (P3) — The elliptic negative-control Check is false

**Location:** `packages/CrystallineCohomologyPartII/README.md:1722`, §6.14: “an elliptic curve E over F_p … |E(F_p)| = p + 1 − a ≢ 1 mod p”.

**Claim:** Every elliptic curve supplies a failure of the point-count congruence.

**Witness:** E/𝔽₃: y² = x³ − x is smooth. Each x = 0,1,2 gives y = 0; adding infinity gives 4 ≡ 1 mod 3. E still fails universal rational CH₀-triviality.

**Exact repair:** Use an ordinary elliptic curve, as §6.4 already does, or give E/𝔽₅: y² = x³ + x + 1. Its affine counts at x = 0,1,2,3,4 are 2,0,2,2,2; infinity gives 9 ≡ 4, not 1, modulo 5. Explain that the original supersingular example shows the congruence does not imply universal CH₀-triviality. The headline theorem is unaffected.

## R09 (P3) — The new theta-divisor definition has no API list

**Location:** `packages/CrystallineCohomologyPartII/README.md:1580`, §6.9: “an effective Cartier ideal sheaf whose dual line bundle … is ample and has h^0 … = 1 (`IsThetaDivisor`)”.

**Claim:** This new definition meets the definition/API/Checks shape required of every definition.

**Witness:** Between this definition and the five Checks, the section has a Needs line and proof route, but no API bullet list. Other definition sections explicitly have such a list.

**Exact repair:** Add prose API bullets for the effective-Cartier ideal and dual O(Θ), equivalence of the ample h⁰ = 1 condition with principal polarization, and preservation under field extension and rational translation. Keep these in the README, without new Lean API declarations. The existing E, Θ = P test gives degree +1 and h⁰ = 1; O(−P) gives h⁰ = 0; 2P gives h⁰ = 2. These discriminate the API's direction and normalization.

## Verified sound

**Coverage and principles.** Read all 59 numbered targets, their routes, Needs and Checks, the seven layer dependency paragraphs, all four package files, both earlier reports, the package index, the overlap leads and the signature/library-match leads. The scope is a legitimate Part II: the parent stops before singular/nonproper Witt cohomology. No route-specific restriction to good primes, computational algorithm, copied source passage, sorry-defined data, `set_option`, forbidden supplier or new undeclared Lean stand-in was found. The general scope need not be rejected. The ownership duplication is localized in R06. The mathematical layer order is justified by the named uses of descent, compact supports, comparison, correspondences, singularities and point counts; headings are mathematical, not source chapter titles. The internal order problem is R04.

The README has the required major sections and seven Examples/Dependencies endings. Its 21 explicit definition API blocks each have at least three Checks (minimum four in these blocks); §6.9 adds a definition with five Checks but lacks its API list, R09. No machine path, pull-request number, date, HTML anchor or repair narrative was found in the roadmap text or Lean docstring. All eight local Lean identifiers are attributed in the README and declared in the file. Backticked library names were resolved separately from mathematical expressions in code spans. The module/public-import header is the module form used by the pinned toolchain: one Mathlib root import and nine used Tau Ceti modules, no extra Mathlib submodule or roadmap import.

**Headline inventory and Lean acceptance test.**

| README headline | Acceptance-test treatment |
| --- | --- |
| §§1.5–1.6 h-descent for Frobenius-inverted and rational Witt cohomology | Explicitly named as not statable: native h-site and Witt sheaf carriers are absent. |
| §3.6 singular/nonproper slope-below-one rigid–Witt comparison | Explicitly named as not statable: rigid cohomology, Witt sheaves and their cohomology are absent. |
| §§5.4, 5.6, 5.12 Witt-rationality and generic-fibre theorem | Explicitly named as not statable: Witt canonical sheaves and scheme-sheaf isogeny categories are absent. R01 concerns the README claim, not an encoded surrogate. |
| §6.2 Witt zeta factor | Explicitly named with the missing cohomology carriers. |
| §6.4(ii), including absolute (iv) | `card_rationalPoints_modEq_of_cohomologyPullback_bijective`, line 74. Actual proper schemes and actual pullback, all degrees including zero. The absolute case is an instance, not padding. |
| §6.6 projective and affine Ax–Katz modulo q | `card_projectiveZeroLocus_modEq_one`, line 90; `card_dvd_card_solutions_of_sum_lt`, line 102. Native projective points and polynomials, finite fields of arbitrary characteristic. |
| §6.9 theta congruence | `IsThetaDivisor`, line 113, and `card_thetaDivisor_modEq`, line 124. Actual effective Cartier ideals on an abelian variety; the dual supplies O(Θ). |
| §6.14(i) Esnault | `zeroCycleDegree`, line 134, `UniversallyCH0Trivial`, line 142, and `card_rationalPoints_modEq_one_of_universallyCH0Trivial`, line 157. Actual cycles and rational equivalence. |
| §6.13 Witt vanishing and §6.14(ii) WO-rational degenerations | Explicitly named with the missing Witt cohomology and singularity predicates. |

Ran the prescribed `lake env lean` on the package's absolute filename from the content checkout: exit 0, exactly five “declaration uses `sorry`” warnings, at lines 74, 90, 102, 124 and 157; no other warning or error. All imported object files were available. No build, update or cache command was needed.

A separate scratch copy with `#check @name` for all eight declarations also elaborated. Every needed binder survives: both properness assumptions, the over-base equation, all cohomological degrees, positive homogeneous degrees, finite-field hypotheses, the effective-Cartier witness, projectivity, smoothness and geometric connectedness. The properness argument in `UniversallyCH0Trivial` is explicit; Esnault obtains it from projectivity. No signature change is requested. The three real definitions are small encodings on native objects, not opaque constructions or arbitrary predicates.

For each of the five sorried theorems, a scratch probe tried `simp`, `rfl` and `infer_instance` as complete one-tactic proofs; none closed. The library near-matches were also compared. Chevalley–Warning's conclusion is p-divisibility, not q-divisibility; it cannot supply the affine theorem by `exact`. No theorem restates one of the three definitions, computes a boundary case or merely mirrors a Check. There is no padding finding and no missing statable headline found.

**Seeded source sample.** Numbers below refer to the cached versions recorded in the manifest, not a guessed published pagination. All 15 requested targets were checked against their locator and hypotheses.

| Target | Text opened and conclusion |
| --- | --- |
| 0.3 Frobenius inversion | BS17 lines 2384–2404, Proposition 11.41 and Notation 11.42, pp. 51–52. Frobenius localization and subsequent p-inversion agree with the construction; qcqs extension uses the stated coherent-site colimit argument. |
| 0.8 proper finiteness and slopes | BBE07 lines 618–666, Proposition 2.10 and proof, pp. 16–17; GNT19 lines 689–692, Remark 2.17(5), p. 15. Properness, finite generation over the V-series ring, and bounded-torsion versus tensor vanishing were checked. No smoothness is silently added. |
| 1.4 abstract-blowup excision | BS17 lines 2419–2451, Lemma 11.45, pp. 52–53. Proper finite presentation, the closed centre and complement isomorphism match; the square is not assumed to be a literal blowup. |
| 3.6 comparison | BBE07 lines 67–69, Theorem 1.1, p. 2, and lines 1279–1412, §5.2, pp. 30–33. Perfect field, separated finite type, compact supports and all degrees match. |
| 4.3 supported cycle classes | CR12 lines 2482–2550, §§3.2.1–3.2.3, pp. 50–52; Proposition 3.4.3 at lines 2802–2818, p. 58. Gro85 line 1483, Definition 4.1.7, printed p. 50, supplies the logarithmic class. Support, codimension and dlog normalization agree. |
| 5.6 quotients and universal homeomorphisms | CR12 lines 3965–3983, Corollary 4.4.7 and Proposition 4.4.9, p. 83. Both normality and the perfect-field context are retained in the invariance assertion. |
| 5.7 Witt singularity complexes | CR12 lines 4101–4144, Corollary 4.5.1 and Definition 4.5.2, pp. 86–87. Independence is over the common target, not merely an unmarked isomorphism. |
| 5.10 exceptional-fibre criterion | CR12 lines 4301–4313, Corollary 4.6.4, p. 90; lines 4444–4465, Theorem 4.7.4, pp. 93–94. The normal isolated-singularity result matches. The broader cone WO statement is justified by the displayed exceptional-fibre argument, not by dropping Theorem 4.7.4's additional Wω hypothesis. |
| 5.11 rational diagonal decomposition | ESN03 lines 11–24, §1 and (1.1), p. 1; CR12 lines 4669–4711, (4.8.5)–(4.8.7), pp. 98–99. Clearing denominators and the supplied torsion-kernel result justify the rational variant. BS83 itself remains uncertified. |
| 5.12 CH₀-trivial generic fibre | CR12 lines 4544–4558, Theorem 4.8.1, p. 96, and lines 4630–4668, Proposition 4.8.4 proof, pp. 97–98. The WO statement matches. The printed Wω assertion is false: R01. |
| 6.1 Witt zeta factors | BBE07 lines 1432–1469, §6.1 and Proposition 6.2, pp. 33–34. q-Frobenius, determinant signs and ℤ_p coefficients match. |
| 6.6 small-degree intersections | BBE07 lines 1594–1633, Proposition 6.8 and proof, pp. 37–38. The strict affine degree inequality and projective degree sum at most n are correctly distinguished. |
| 6.7 ample divisor | BBE07 lines 1498–1546, Proposition 6.4, pp. 35–36. Both the canonical-section isomorphism and injectivity of every Vⁱ are retained. |
| 6.9 theta divisors | BBE07 lines 167–171, Theorem 1.4, p. 5, and §6.5, pp. 36–37. Two theta divisors need not be translates. The native h⁰ = 1 encoding is justified by AbelianSchemesAndArithmeticModuli §A2.4. |
| 6.14 Esnault and degenerations | ESN03 lines 52–69, Theorem 1.1 and Corollary 1.2, p. 2, together with the checked WO comparison route. Rational coefficients suffice. The supplementary HW23 published locator is not independently certified; see below. The elliptic Check fails: R08. |

The changed attachments were also inspected: Del74 lines 553–572, (6.2.5), printed p. 20, is the inductive split-hypercover construction; CT03 lines 5340–5364, Proposition 11.2.5, printed pp. 196–197, is the coskeleton identity; EGAIII1 lines 4409–4430, Proposition 3.3.1, printed p. 118, supplies proper graded-cohomology finiteness. Gro85's newly attached locator is included above. No unavailable work was re-requested under a new key. The manifest has 25 unique keys, 17 certified and eight uncertified, and every cited work is represented.

**Computed adversarial table.** These rows cover every seeded target, all five Lean headlines and all mathematical findings, together with the additional targets whose earlier review lacked a sufficient numerical witness. K below is W(k)[1/p], except in the Lean point-count rows where q denotes the finite field's cardinality. “Pass” means the stated test passes, not that a few examples constitute a proof.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions, 0.1 Witt sheaves | 𝔽₂, lengths 1 and 2; I = 0 and I = O | W₁ = 𝔽₂, W₂ = ℤ/4; F(V1) = 2 = 2·1; V1 ≠ 0; W_n(0) = 0, W_n(O) = W_nO | Pass; integral Witt sheaves are not O-modules. |
| 0.1, 0.7 inverse limits | X = Spec 𝔽_p, I = O | lim ℤ/pⁿ = ℤ_p, lim¹ = 0, Hⁱ = 0 for i > 0 | Values agree; reorder proof dependencies, R04. |
| 0.2 rationalization | M = ⊕_(n≥1) ℤ/pⁿ | M ⊗ ℚ = 0; for every N, pᴺM ≠ 0, hence q(M) ≠ 0 | Pass; excludes conflating the two rationalizations. |
| 0.3 Frobenius inversion | Spec 𝔽_p; Spec 𝔽_p[ε]/ε²; empty | W[1/F] = ℤ_p in the first two cases, then [1/p] = ℚ_p; empty gives 0 = 0 | Pass; F-inversion alone is not p-inversion. |
| 0.4, 0.5 nilpotents and homeomorphisms | ε² = 0, p = 2 or 3; t ↦ tᵖ | F([ε]) = 0; t is absent from k[tᵖ] but appears after F-inversion; inverse is F⁻¹ after localization | Pass; integral pullback need not be onto. |
| 0.6 closed Mayer–Vietoris | two lines meeting at a point | H⁰ = {(a,b) in W(k[x])_K ⊕ W(k[y])_K : a(0)=b(0)}; difference map onto K; kernel equals that fibre product | Pass, including sign of the difference. |
| 0.7 properness | j: A² minus 0 → A² | fibre dimension 0; Čech class x⁻¹y⁻¹ has nonzero first component in R¹j_*WO | Pass: the relative dimension-zero vanishing is stated only for proper maps. |
| 0.8 finiteness and slopes | point; ordinary and supersingular E | dimensions H⁰ = 1, H¹(E) = 1 or 2; slopes 0, respectively 0 or (1/2,1/2), all below 1 | Pass; includes p = 2 and 3. |
| 1.1 fppf descent | Spec(k×k) → Spec k | Čech degree 0 = W(k)²; degree 1 = W(k)⁴; equalizer is diagonal W(k), higher normalized cohomology 0 | Pass. |
| 1.2 derived self-products | k over k[t], t ↦ 0 | Tor₀ = k, Tor₁ = k, higher Tor = 0; Frobenius on positive homotopy is 0, localized Tor₁ = 0 | Pass; truncation occurs after Frobenius inversion. |
| 1.3, 1.4 pushout and excision | blowup of A² at 0 | with A = W(k[x,y])[1/F], degree-zero sequence 0 → A → A⊕W(k) → W(k) → 0; exceptional ℙ¹ has Hⁱ(WO) = 0 for i > 0 | Pass; difference map onto W(k). |
| 1.4 empty boundaries | centre empty; centre X and Y empty | first square is an isomorphism square; second gives F(X) → 0⊕F(X) → 0, with first map id | Pass. |
| 1.5, 1.6 h-descent | nilpotent thickening; identity cover | localized complexes ℤ_p → ℤ_p and rational complexes ℚ_p → ℚ_p are identity; Tot of the identity nerve is the original object | Pass; supplier gap redundant, R05. |
| 2.1, 2.2 exceptional ideals | Bl₀A² → A², exceptional ℙ¹ | R¹f_*WI_ℚ = 0; H¹(ℙ¹,WO)_K = 0, hence R¹f_*WO_ℚ = 0 | Pass. |
| 2.3, 2.4 compact supports | A¹, G_m, point, empty | H_c^*(A¹,WO)_K = 0; H_c¹(G_m,WO)_K = K; point gives K in degree 0; empty gives 0 | Pass; ordinary H⁰(A¹,WO)_K is instead infinite-dimensional. |
| 2.5, 2.6 hypercover truncation | split nodal cubic normalized by ℙ¹ | C⁰ = K, C¹ = K³, d⁰ = 0; truncation 1 gives H¹ = K³; degree 2 imposes a=0, b+c=0 and gives H¹ = K | Pass; comparison range q < N matters. |
| 3.1 slope cutoff | rank 0; F = σ and F = pσ | cutoff below 1 is respectively 0, K, 0; determinants 1, 1−t, 1 | Values agree; imported decomposition ownership, R06. |
| 3.2 local construction | point in Spf W(k); φ(t)=tᵖ | tube map K → K is id; ghosts of s_φ(t) are t^(pⁱ); O_X⊗ℚ = 0 | Construction passes, rational-specialization API fails, R03; import s_φ, R06. |
| 3.3, 3.4 gluing and simplicial frames | point and constant point hypercover | every local comparison K → K is id; normalized total complex K[0]; products of point embeddings remain the point frame | Pass. |
| 3.5, 3.6 comparison | ℙ¹, A¹, G_m, supersingular E | ℙ¹ rigid H⁰ slope 0 survives and H² slope 1 dies; A¹ compact rigid H² slope 1 dies; G_m H_c¹ slope 0 survives; E H¹ slopes 1/2 both survive | Witt dimensions respectively (1,0), 0, 1, 2: pass. |
| 3.7 affine vanishing | A¹ and G_m, dimension 1 | all compact Witt groups of A¹ vanish; G_m has only H_c¹ = K | Pass; ordinary cohomology would give a wrong statement. |
| 4.1 canonical system | point; smooth ℙ¹; normal cone over abelian surface | point W_nω = W_n(k); H¹(ℙ¹,Wω)_K = K; cone has dim H¹(A,O_A)=2, not 0 | First two pass; CM supplier not applicable to cone, R07. |
| 4.2, 4.3 supports and trace | x in ℙ¹, divisor x−y | trace(cl(x)) = 1; c₁(O(x−y)) = c₁(O)=0 after forgetting supports; degree 1 versus 0 | Pass, including sign of c₁ and trace. |
| 4.4, 4.5 correspondence composition | Δ on ℙ¹; two product cycles | Δ acts (1,1) on H⁰(WO) and H¹(WΩ¹); {x}×ℙ¹ acts (1,0), ℙ¹×{x} acts (0,1); sum is (1,1) | Pass. |
| 4.6 codimension | Spec k → ℙ¹, class of a point | source 1 maps to cl(x), trace 1; target-WO projection 0; N·cl(x) has trace N ≠ 0 | Full-source restriction fails; R02. |
| 5.1–5.4 quotient/quasi-resolution | smooth point; tame quadric cone; finite Frobenius | trivial quotient has degree 1; cone resolution exceptional ℙ¹ has H¹(WO)_K=0; Frobenius push-pull is p^d, invertible after rationalization | Pass; generic pure inseparability is not replaced by separability. |
| 5.5, 5.6 Witt-rationality | smooth scheme with id; Frobenius between smooth twists | R⁰id_*WO = WO, higher groups 0, same for Wω; both Frobenius-related sides satisfy the predicate | Pass in both directions of the invariance assertion. |
| 5.7 singularity complexes | point; cone over ordinary E | point WS₀ = W(k)_ℚ[0]; cone has stalk H¹(WS₀) of K-dimension 1, whereas H¹(WO[0])=0 | Pass; complex is not universally the degree-zero sheaf. |
| 5.8, 5.9 invariance/normality | blowup of ℙ²; normalization of split nodal cubic | blowup and ℙ² have H⁰(WO)_K=K, higher 0; nodal cubic H¹=K versus normalization H¹=0 | Pass; latter violates normality/condition (1). |
| 5.10 isolated singularity | exceptional conic; elliptic curve; tree of rational curves | H¹(WO)_K dimensions 0, 1 or 2, 0 respectively; rationality criterion gives yes, no, yes | Pass. |
| 5.10 degree-zero control | cone over Spec 𝔽_(q²) | higher exceptional groups 0, but K → W(𝔽_(q²))[1/p] has dimensions 1 → 2 and is not onto | Pass; geometric connectedness cannot be dropped from cone case. |
| 5.11 diagonal | ℙ¹; geometric genus-one curve | [Δ] = [pt×ℙ¹]+[ℙ¹×pt], N=1, degree ξ=1; over an algebraic closure of k(E), [η]−[0] has degree 0 but is non-torsion | Pass; tests hypothesis and factor orientation. |
| 5.12 generic fibre | ℙ¹ → point; identity point | WO positive degrees 0 = 0; Wω degree 1 is K versus claimed 0; identity has Wω only in degree 0 | WO passes; Wω fails, R01. |
| 6.1, 6.2 determinant sign | point, ℙ¹, A¹, G_m, empty | ζ^W = (1−t)⁻¹, (1−t)⁻¹, 1, 1−t, 1; these are exactly the slope-below-one factors | Pass; odd H_c¹ occurs in the numerator. |
| 6.3 Ax criterion | Φ=(1−qt)⁻¹ and (1−t)⁻¹ | logarithmic coefficients N_r=q^r and 1; first divisible by q^r, second not; slopes 1 and 0 | Pass, threshold and normalization fixed. |
| 6.4 relative Lean headline | id point; ℙ¹ → point; empty → point; fold of two ℙ¹ | counts 1=1; q+1≡1; 0≢1 but H⁰ k→0 not injective; fold difference q+1≡1 but H⁰ k→k² not onto | Pass; all-degree bijectivity discriminates the wrong maps. |
| 6.5 singular counts | quadric cone, resolution F₂ | q²+q+1 and (q+1)²; difference q, both ≡1 | Pass. |
| 6.6 projective Lean headline | n=0,r=0; conic; double line; two lines; zero polynomial | counts 1, q+1, q+1, 2q+1, and 1+q+…+qⁿ, all ≡1 | Pass, including nonreduced equations. |
| 6.6 excluded projective inputs | degree-zero equation 1; cubic E in ℙ² | empty locus gives 0, excluded by d≥1; ordinary E can give 9≢1 over 𝔽₅, excluded by 3≤2 | Pass; homogeneity and degree bounds are substantive. |
| 6.6 affine Lean headline | no equations in m≥1 variables; ternary nondegenerate quadratic over 𝔽₉; f=x in one variable | counts q^m, 81, 1; first two divisible by q; last excluded by 1<1 being false | Pass; Chevalley–Warning supplies only 3 for the middle example, target supplies 9. |
| 6.7 ample divisor | ℙ¹, D a rational point | H⁰(O(−2))=H⁰(O(−1))=0; H¹(O)=0; ζ^<1(ℙ¹)=(1−t)⁻¹=ζ^<1(D)·1 | Pass. |
| 6.8 Bockstein | dimension 0; elliptic curve, any i≥1 | Vⁱ(a) has coordinate i equal to a, so kernel 0; W_(i+1)(k)→W_i(k) onto, boundary 0 | Pass, also supersingular and p=2. |
| 6.9 theta definition and Lean headline | E, P and Q rational; 2P and P+Q; dimension 0 | h⁰(O(P))=h⁰(O(Q))=1, counts 1=1; degree-two h⁰=2, counts 1 and 2, excluded; zero-dimensional theta empty, 0=0 | Pass; supply API list, R09. |
| 6.10 degree and universal CH₀ | rational x, degree-two y; ℙⁿ; empty; Spec 𝔽_(q²) | deg([y]−2[x])=2−2=0; CH₀(ℙⁿ)=ℤ with degree 1 generator; empty degree image 0; after splitting quadratic point, [x]−[y] non-torsion | Pass; excludes unweighted degree and kernel-only stand-in. |
| 6.11, 6.12 rational chains | ℙ¹; cone; elliptic curve | ℙ¹ connects two points by one line, cone by two ruling lines; on E every ℙ¹ map is constant, so two distinct points cannot be joined | Pass; genus-one curve is not admitted. |
| 6.13, 6.14 Esnault headline | ℙⁿ; smooth cubic surface; quadratic point; empty | higher Witt groups vanish for first two; counts Σq^j and q²+tq+1 ≡1; quadratic point and empty have 0 points and fail hypotheses | Pass. |
| 6.14 elliptic Check | y²=x³−x over 𝔽₃; y²=x³+x+1 over 𝔽₅ | counts 4≡1 and 9≡4 respectively; neither is universally rational CH₀-trivial | Original Check fails, R08; corrected ordinary example fails the congruence as intended. |

The total-function tests use native finite residue degree only at closed points of finite-type field schemes, so `Module.finrank`'s infinite-degree zero is not reached. Properness makes the locally finite support of a zero-cycle finite. A finite field has q ≥ 2; q = 1 and the zero ring are excluded by `Field`. The projective zero polynomial is allowed with a positive assigned homogeneous degree, and a nonzero constant is excluded by positive degree. The empty affine variable set cannot satisfy the strict degree inequality. No conclusion is hidden in a hypothesis. The additional geometric-connectedness binder in Esnault is harmless even where universal CH₀-triviality already forces it.

**Pinned objects opened.** The following are source locations at the installed pins, with paths relative to the corresponding library repository. Their hypotheses were read, rather than inferred from names or from the citation resolver.

| File and line | Declaration/content checked |
| --- | --- |
| `Mathlib/RingTheory/WittVector/Identities.lean:43`, :102, :141 | FV, projection formula, VF; VF explicitly carries characteristic p. |
| `Mathlib/RingTheory/WittVector/Basic.lean:263`; `Mathlib/RingTheory/WittVector/Frobenius.lean:283` | Surjectivity of map; Frobenius equivalence for perfect coefficients. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Extends a module by `frob : V ≃ᶠˡ[p, k] V`; no finite-dimensionality field and no retained domain hypothesis. |
| `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45`; `Localization.lean:133`, :416 | Serre property, zero-object criterion and abelian localization. These do not construct the particular Witt sheaf category. |
| `Mathlib/FieldTheory/ChevalleyWarning.lean:110` | Characteristic p divides the common-zero count, not the whole field cardinality. |
| `Mathlib/AlgebraicGeometry/ResidueField.lean:147` | Residue degree is `Module.finrank`; its total-function convention was checked. |
| `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40` | Geometric `ConnectedSpace` condition, which includes nonemptiness. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`; `Cohomology/Pullback.lean:65`; `Modules/Pullback/Basic.lean:211` | Cohomology is native sheaf H; pullback has the correct contravariant direction; pullback of the unit is identified with the unit. |
| `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:48` | Base-ring module instance needed for h⁰. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group scheme, not a bare group. |
| `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Invertible.lean:307`; `LineBundle/Dual.lean:44`; `LineBundle/Ample.lean:71` | The first bundle is the ideal O(−Θ); dual reverses its sign; ample includes quasi-compactness and affine nonvanishing loci. |
| `TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveOver.lean:57`, :77 | Finite-module projective embedding; properness instance. |
| `TauCeti/AlgebraicGeometry/Chow/Basic.lean:70`, :86, :257, :280, :295 | Dimension-supported locally finite cycles, rational equivalence, zero-dimensional test and quotient. Rational equivalence is not an arbitrary relation parameter. |

Object searches in the pins distinguish the existing ring Witt functor and smooth isocrystal infrastructure from the missing scheme Witt sheaves, h-site, rigid cohomology and singularity complexes. The supplied library near-matches do not prove any of the five headlines. The standard scheme morphism, polynomial, projectivization, derived-category and characteristic-polynomial interfaces named in the README were also resolved at the pins; they introduce no new ownership collision.

**Supplier and overlap audit.** The board package index was read before the ownership search. `roadmaps grep` was used on objects, including Witt cohomology with compact supports, Witt-rational singularities, supported Witt classes, canonical systems, theta divisors and universal CH₀-triviality. Main was used for existing roadmaps; the provided open heads were used for new ones. The closest scopes were read: CrystallineCohomology #857, PadicDifferentialEquationsAndRigidCohomology #1002, AlgebraicModuliForArithmeticGeometryPartII #1754, EtaleDualityAndPerverseSheavesPartII #1743 and PrismaticCohomology #1057. The first collision is R06. The rigid theory is correctly imported; the moduli and étale-duality work owns different coefficient theories and different objects. Specialized Jacobian theta divisors elsewhere do not own the general predicate or Serre congruence here. No duplicate fully qualified Lean declaration was found.

The overlap data reports no conflicting head, dropped cited id, externally cited id dropped here, or id defined only by an unnamed open revision. The retired absolute-count Lean name was searched; no external citation was found. This is an indexed head search plus examination of the relevant scopes, not a claim to have read every open pull request in full.

| Supplier | Resolution evidence |
| --- | --- |
| CrystallineCohomology #857 | `TauCetiRoadmap/CrystallineCohomology/README.md`: §CR.4.4 at 5209; §CR.4.6 Witt schemes at 5923 and ideal quotients at 6083; §CR.4.7 decomposition at 6621; smooth trace at 7196. Smooth pure dimension is sufficient for the Ekedahl isomorphism used here. R06 removes duplicate obligations. |
| DerivedDeRhamCohomology #868 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md`, §PD.6, Universal base-compatible divided power envelope and Completed PD envelopes and the derived-completion comparison (latter at 2779). These are the envelope inputs, not new work here. |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:38` explicitly maps the old §1.T.1 tower references to their new location. This is a valid numbering bridge, not supplier drift. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: E1 enhancement; E2 bounded-below hypercover descent; E5 descent at 1809, animation/Frobenius at 1951–1976; E2.8 proper-surjection inductive level at 2415 and geometric descendability at 2427. The Witt consumer uses these supplied constructions. |
| ArcTopologyAndDescent #1755; PrismaticCohomology #1057 | Their §§1.1, 1.3, 1.6 and §2.0 resolve all three h-descent contract clauses, with the directions and finite-presentation hypotheses checked. R05. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: cited §§0.20, 0.23, 0.29; §§2.6–2.7, 2.19–2.21; §§4.9, 4.12, 4.14, 4.16, 4.19; §§5.1–5.2, 5.5 resolve to the stated scheme, cohomology, alteration and Chow operations. Normality does not satisfy §2.20's CM binder, R07. |
| ClassicalAdicEtaleCohomology #875 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3146`, §5.4 plurinodal alteration: dominant proper, integral excellent schemes, quotient function-field control. The package's perfect-field quotient-alteration application is a further target, not a renamed generic theorem. |
| MotivesAndAlgebraicCycles #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:181`, §0.6 fixed-support integral diagonal decomposition; §2.2 at 354 onward supplies continuity/torsion kernel for smooth projective schemes. The rational-coefficient extension here clears denominators and retains those hypotheses. |
| AbelianSchemesAndArithmeticModuli #849 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1161`, §A2.4: h⁰(L)=χ(L), deg φ_L=χ(L)² for ample L. Thus h⁰=1 is the principal-polarization condition used by the native theta definition. |
| AdicSpacesPartIII; EtaleCohomologyFoundations, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:3013` supplies graded-cohomology finiteness; `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:107` supplies Nagata compactification. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.3.1–3.2, RD.4.1/5/12/17–19/24/36–38, RD.5.67/73–74/77–78/89–90, RD.6.22–23/58 and RD.7.4 resolve the frames, comparisons, descent, finiteness, slopes, duality and trace inputs. This package adds the WO comparison, not another rigid cohomology construction. |

The remaining `qcqs-frobenius-factorization` gap has matching slugs and needs in the README and plan, a named supplier and explicit finite, finitely presented, qcqs, characteristic-p hypotheses. SchemeAndStackFoundations §0.26 supplies the finite-type-over-𝔽_p case; the gap asks for the genuine wider qcqs case. It is a legitimate contract, not an unowned prerequisite or a reason for this verdict.

Ran the prescribed dependency gate with `--movable`, the package README, the supplied merge order and content checkout. Exact output:

```text
depcheck: 236 roadmaps, 2142 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. Every Needs line and supplier contract was read separately; R04 is an internal target cycle, which this output does not cover. The citation resolver found no missing cross-roadmap citations or local Lean names. Its warning that it could not inspect pinned Lake packages was not treated as validation of library names; those were checked from the installed sources and elaboration.

## Not verifiable

- Eke84, EkeII, Kol96, Ser58, Ax64, BS83, Tsu03 and Tsu04 are settled as uncertified. Their primary texts were not available in the cache; their locators were retained without guessing their contents or requesting them again. Readable BBE07, CR12 and ESN03 passages support the sampled applications where identified above.
- HW23's published Corollary 1.3, pp. 2 and 19–20, was not read. The certified cache is arXiv v2 and its numbering differs, as the manifest records. The published locator is supplementary to the checked WO and Esnault routes; its text is not certified by this report.
- The checks do not supply proofs of the proposed new Wω theorem in R01. They refute the printed statement, identify the missing shift in its proof, and test the required correction on both relative dimension zero and one. The fix must preserve the bidegrees throughout that proof.

## Source issues

- **Error** in CR12 at Theorem 4.8.1 and Proposition 4.8.4, printed pp. 96–98: the source identifies positive Wω direct images without the relative-dimension shift; it should retain the shift and the base degree-zero term, as ℙ¹ → Spec k demonstrates; affects a stated result.
- **Misprint** in CR12 at Corollary 4.5.1, printed page 86: the source places the quasi-birational comparison over X; it should place it over S, the common target; affects nothing.
- **Misprint** in GNT19 at Proposition 2.23, printed page 18: the source places the coherent ideal of O_X on Y; it should place it on X; affects nothing.
- **Misprint** in GNT19 at the proof of Lemma 2.18, printed page 15: the source tests the higher-direct-image sheaves on affine opens of X; it should test them on affine opens of Y; affects nothing.
