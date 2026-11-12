<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13111#issuecomment-6783655193 -->
Review (codex) of 3cf8dc8

Verdict: needs_changes

1. **F01** (P2) Proper closed support need not have positive codimension

   **Location:** `packages/CrystallineCohomologyPartII/README.md:870`: “A degree-zero correspondence supported over a proper closed subset of its target acts by zero on the WO-part”. The following source-Wω sentence has the same scope issue; clarify §4.6(iii), at 1050, consistently.

   **Claim:** Proper closed support suffices for bounded-torsion vanishing throughout Layer 4's category, which admits disconnected smooth schemes (§4.4).

   **Witness:** Take X = Y = Spec k ⊔ Spec k and Z the first diagonal component. Both supports are proper closed; its degree-zero action on WO = Wω = W(k)² is diag(1,0), never killed by N ≥ 1.

   **Exact repair:** Require that the relevant projected support contain no irreducible component of the source or target, equivalently positive codimension componentwise. Use this wording in the layer summary and the general form of §4.6(iii); reserve “proper closed subset” alone for an explicitly connected smooth scheme. Keep the disconnected correspondence category. Add the two-point example as a negative control: its projected support has codimension 0, so the corrected vanishing assertion excludes it. An empty support still acts by 0, and a point on P¹ has codimension 1 and retains the stated vanishing. CR12 line 3190 assumes connectedness for its simplified discussion; its actual vanishing hypotheses, CR12 line 3203 and line 3244, require codimension at least r. This is a missing hypothesis in the summary, not a re-raising of the repaired degree issue.

2. **F02** (P3) Smooth-scheme Checks exceed the definitions' domains

   **Location:** `packages/CrystallineCohomologyPartII/README.md:1117`, repeated at 1386: “Every smooth k-scheme is a finite quotient.” Also at 1149: “For X smooth projective … is a quasi-resolution”.

   **Claim:** Smoothness alone supplies the equidimensionality required by §5.1, and smooth projectivity supplies the integrality required by §5.2.

   **Witness:** Spec k ⊔ A¹_k is smooth and normal, with component dimensions 0 and 1, hence not a finite quotient under §5.1. P¹_k ⊔ P¹_k is smooth projective but nonintegral, so its Frobenius is not a §5.2 quasi-resolution.

   **Exact repair:** Change the finite-quotient Check and repeated example to smooth equidimensional finite-type k-schemes. Change the Frobenius quasi-resolution Check to smooth projective integral X. Add these two disjoint unions as negative controls. The identity of a smooth equidimensional scheme is a finite surjective smooth-source cover of degree 1, while Frobenius of integral P¹ has degree p and is a quasi-resolution. These changes align the examples with the existing definitions, without restricting the general theory. Audit the nearby unqualified Frobenius-degree example at 1388 componentwise as well: on Spec k ⊔ A¹ the degrees are (1,p), not the single value p.

3. **F03** (P3) Bind the dimension in the Ekedahl duality shifts

   **Location:** `packages/CrystallineCohomologyPartII/README.md:891`: “E(W_•Ω_X) ≅ Hom(W_•Ω_X, K_X)(−N)[−N]”; the same unbound N occurs in the pushforward route at 933.

   **Claim:** The self-duality and ensuing pushforward formulas specify their internal and cohomological shifts. Their standing dimension is d, but N has not been defined here or in the conventions.

   **Witness:** CR12 line 1507 defines N as the pure dimension before the shifts at line 1519. For X = P¹ and n = 1, K_X = Ω¹[1]; K_X[−1] = Ω¹, whereas K_X[0] has nonzero cohomology in degree −1.

   **Exact repair:** Use d throughout §4.1, and define d_X = dim X and d_Y = dim Y in §4.2's pure-dimensional route, with r = d_X − d_Y. Write µ_X with (−d_X)[−d_X] and µ_Y with (−d_Y)[−d_Y]. Identify K_X as the Witt residual complex representing the previously defined dualizing system and E as its codimension Cousin construction. Keep the general category componentwise. Test d = 0 on Spec k (no shift) and d = 1 on P¹ (the [−1] shift returns Ω¹ to degree 0). No new Lean declaration is needed.

Three findings: one P2 and two P3. The nine findings from round 2 are repaired. The package's five Lean headline statements elaborate, with only the five expected `sorry` warnings. The remaining changes concern a disconnected-scheme overclaim, two Checks that exceed their definitions' domains, and an unbound dimension in a duality formula. The package is repairable; its scope is appropriate for a Part II. No reviewed source file was edited.

**Previous findings, checked first.** All locations in this table are in `packages/CrystallineCohomologyPartII/README.md`.

| Round-2 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01, unshifted Wω direct images | Repaired | At 1362: “for every i ≥ 0” and “H^{i−r}(WS_{dim Y,Y})”. Steps 5–6 retain both grading shifts and base degree zero. For P¹ → Spec k, R¹Wω = K = H⁰(WS₀); for the identity r = 0 and R⁰Wω = Wω. The altered proof was reread against CR12 line 4645 and line 4245. |
| R02, source WO versus target projection | Repaired | At 1050: “projection onto the target WO-part” and “if moreover [Z] has degree 0”. The new point-inclusion Check at 1066 gives image cl(x), trace 1, but target-WO projection 0. The original degree error is fixed. The separate disconnected-scheme issue is this round's R01. |
| R03, rational specialization | Repaired | At 719: “Integral compatibility with the augmentation” and “projection W_nO_X → O_X to the first Witt component”. The Check at 731 sends 1 to 1 and p to 0 before rationalization; afterwards O_X ⊗ ℚ = 0. The tube map remains id on ℚ_p. |
| R04, internal dependency cycle | Repaired | At 139: “the sections form a surjective tower in degree 0, whose lim¹ vanishes”; at 312 the proper-scheme comparison now follows finiteness. The inverse-limit route uses the tower supplier directly. All 164 extracted local Needs edges between the 59 targets point backwards; the formerly cyclic proof references are gone. |
| R05, redundant h-descent gap | Repaired | At 62: “§1.1, universal descent … §1.3, the h-site … §1.6, affine approximation”; at 98: “finite-presentation refinement of v-covers”. The plan's top-level gaps list now contains only qcqs Frobenius factorization. The replacement contracts resolve to ArcTopologyAndDescent and PrismaticCohomology. |
| R06, parent constructions repeated | Repaired | At 13: “owns the canonical slope decomposition” and “owns the Cartier–Dieudonné–Dwork map”; at 676 the cutoff starts from the supplied summands, and at 723 the PD application uses the supplied section. The duplicate construction/API obligations have been removed. |
| R07, normal versus Cohen–Macaulay canonical sheaf | Repaired | At 887: “for every X of finite type and pure dimension d” followed by the separate “for X Cohen–Macaulay” specialization. The normal three-dimensional abelian-surface cone Check has dim H¹(O_A) = 2, so the CM supplier is correctly excluded while H⁻³(π!k) exists. |
| R08, elliptic negative control | Repaired | At 1739: “9 ≡ 4 mod 5” and the supersingular example has “4 ≡ 1 mod 3”. Direct enumeration gives affine counts (2,0,2,2,2), plus infinity, in the first case; (1,1,1), plus infinity, in the second. |
| R09, theta-definition API | Repaired | At 1595–1600: “is the ideal O_A(−Θ) of an effective Cartier divisor Θ” and “is a principal polarization”. Four API bullets now cover the ideal/dual, polarization, field extension and translation. On an elliptic curve h⁰(O(P)) = 1, h⁰(O(−P)) = 0, h⁰(O(2P)) = 2. |

The repair report marked no finding not actionable in this package. Its note about immutable historical plan-node text does not undo the correctly updated top-level gap contract; no new finding is made about that historical text. Changed passages were tested again, and each repaired pattern was sought elsewhere. Untouched targets were reread with the computed rows in the round-2 adversarial table; those rows, rather than its summary assurances, are the inherited evidence. The seeded sample below was checked afresh.

## Verified sound

**Coverage, principles and shape.** Read all four package files, all 59 numbered targets with their hypotheses, routes, API and Checks, all seven layer endings, the previous report and repair report, the board-package index, overlaps, signatures and library-match leads. The scope develops singular and nonproper Witt cohomology beyond the parent's smooth theory. No route-specific good-prime restriction, computational algorithm, copied source passage, sorry-defined data, `set_option`, forbidden supplier, or unsupported surrogate Lean carrier was found. Characteristic restrictions in cited applications do not restrict the general library. The layers have mathematical names and their dependency order is justified by the constructions: descent, compact supports, rigid comparison, correspondences, singularities, point counts. They do not claim to follow a source's chapter arrangement.

The README has the required main headings and seven Examples/Dependencies endings. There are 22 explicit definition API blocks, each with at least three Checks; the changed theta definition has four API bullets and five Checks. R02 identifies Checks whose domains need correction. Every theorem has a locator and a Needs line; those lines and their proof-route inputs were read, not inferred from the gate. No machine path, job/round label, pull-request number or HTML anchor was found in the roadmap or Lean docstring. Source-version notes distinguish readable and unreadable editions. Main-branch SchemeAndStackFoundations, EnhancedDerivedSheaves and AdicSpacesPartIII were also read for house style.

**Headline inventory.** All local identifiers below occur in the README and Suggested.lean. The three definitions have real bodies on native carriers.

| Headline from README | Treatment in `packages/CrystallineCohomologyPartII/Suggested.lean` |
| --- | --- |
| §§1.5–1.6 h-descent of Frobenius-inverted/rational Witt cohomology | Docstring names it as not statable: native h-site and scheme Witt sheaves missing. |
| §3.6 compactly supported rigid–Witt slope comparison | Docstring: rigid cohomology, scheme Witt sheaves and their cohomology missing. |
| §§5.4, 5.6, 5.12 Witt-rationality, invariance and generic-fibre theorem | Docstring: scheme Witt/canonical sheaves and their isogeny category missing. |
| §6.2 Witt zeta factor | Docstring names it with the missing cohomology carriers. |
| §6.4(ii), with (iv) as a specialization | `card_rationalPoints_modEq_of_cohomologyPullback_bijective`, line 74. Actual proper schemes and actual pullback, including degree zero. |
| §6.6 projective and affine Ax–Katz modulo q | `card_projectiveZeroLocus_modEq_one`, line 90; `card_dvd_card_solutions_of_sum_lt`, line 102. Native projectivization and polynomials. |
| §6.9 theta congruence | `IsThetaDivisor`, line 113, and `card_thetaDivisor_modEq`, line 124. Effective Cartier ideal, dual ample line bundle and actual h⁰. |
| §6.14(i) Esnault | `zeroCycleDegree`, line 134; `UniversallyCH0Trivial`, line 142; `card_rationalPoints_modEq_one_of_universallyCH0Trivial`, line 157. Native cycles and rational equivalence. |
| §6.13 Witt vanishing; §6.14(ii) WO-rational degenerations | Both named in the docstring with their missing Witt carriers. |

Elaboration from the pinned content checkout, with the prescribed `lake env lean` command on Suggested.lean, exited 0. Its only warnings were the five declarations using `sorry`, at lines 74, 90, 102, 124 and 157. All nine used Tau Ceti object files existed. The pinned module syntax uses `public import Mathlib` followed by the nine individual used Tau Ceti modules; there are no Mathlib submodule or roadmap imports. No additional build was needed.

An independent scratch copy containing `#check @name` for all eight local declarations also elaborated. The signatures retain both properness binders, the equation over the base, all degrees of cohomology, finite-field and finite-variable hypotheses, homogeneous positive degrees, Cartier data, projectivity, smoothness and geometric connectedness. The properness binder of `UniversallyCH0Trivial` is explicit and survives. No lost binder or README/signature generality mismatch was found.

Every one of the five sorried theorems was tested on a scratch copy with `simp`, `rfl` and `infer_instance` as complete one-tactic proofs; all five resisted all three tactics. The provided library near-matches were read at the pins: no single `exact` candidate proves a headline. In particular Chevalley–Warning gives divisibility by p, not q, and projectivization cardinality counts the full space rather than an arbitrary common zero locus. No declaration merely restates a definition, mirrors a Check or states a boundary case. There is no padding or missing-statable-headline finding.

**Fresh seeded source verification.** Source line numbers refer to the cached version identified in the manifest. Pages below are the pages of that version; a published locator is not certified by a differently numbered preprint.

| Seeded target | Text read, hypotheses and result |
| --- | --- |
| 0.1 Witt ideal sheaves and Witt-scheme cohomology | BBE07 line 210 onward, §2.1, pp. 6–7, gives kernels and inverse limits. CR12 line 528, Lemma 1.5.1, pp. 12–13, supplies the affine-acyclic/ML criterion. GNT19 line 705 identifies the sheaf on W_nX and its higher images on W_nY. The parent owns W_nX and affine Witt ideals; the new sheaf/cohomology extension is explicit. |
| 1.1 fppf descent | BS17 line 2454, proof of Proposition 11.41, p. 53, invokes descent for bounded Witt vectors and passage to limits. Lemma 11.43 and Remark 11.44 at line 2395, p. 52, support the derived input. The finite-presentation and topology hypotheses are retained; the qcqs extension uses the named descent/approximation suppliers. |
| 1.6 rational Witt h-sheaf | BS17 line 2384, Proposition 11.40 and Proposition 11.41, pp. 51–54; Frobenius localization followed by p-inversion agrees with rational Witt cohomology. The source's noetherian finite-dimensional base is distinguished from the package's supplier-supported qcqs extension. |
| 2.1 higher-image vanishing for ideals | BBE07 line 333 onward, Theorem 2.4, pp. 9–10; CR12 line 4260 onward, Proposition 4.6.1 and proof, pp. 89–90; GNT19 line 785, Proposition 2.23, p. 18. The general coherent-higher-image hypothesis uses CR12's proof, not just BBE's finite-open special case. The uniform exponent survives inverse limits: CR12 line 4299. |
| 2.2 exceptional locus | CR12 line 4301, Corollary 4.6.4 and proof, p. 90; GNT19 line 812, Lemma 2.25, p. 18. The broader proper-map version follows from the explicitly preceding ideal-vanishing theorem and its exact sequence. HW23 line 953, Corollary 4.6, p. 21 of v2, is an application, with p > 5 and a log resolution. |
| 2.3 compact supports | BBE07 line 568 onward, §2.9, (2.12)–(2.14), pp. 14–16. Separated finite type, perfect k, proper compactification, ideal independence and directions of functoriality agree. |
| 3.1 slope parts and polynomial factors | BBE07 line 1432 onward, §6.1 and Proposition 6.2, pp. 33–34; finite-dimensional slope summands are imported from the parent. Linear q-Frobenius, v_q(q) = 1, strict cutoff and determinant multiplicities agree. The section does not reconstruct the parent's decomposition. |
| 3.3 comparison morphism | BBE07 line 943, Proposition 4.4, pp. 23–26; line 1118, Theorem 4.5, pp. 26–28; line 1173, Proposition 4.6, pp. 28–29. Direction is rigid compact supports → Witt compact supports. Smooth proper normalization is augmentation after rigid/crystalline comparison. Integral reduction is now separated from rational coefficients. |
| 4.1 Witt canonical system and duality | CR12 line 3430 onward, Definition 4.1.2 and Proposition 4.1.4, pp. 73–75; line 1507 and line 1515, Corollaries 1.10.5–1.10.6, pp. 32–33. Pure dimension, CM specialization and full smooth product self-duality agree. The local unbound N is R03. Ekedahl's primary texts remain uncertified. |
| 4.5 proper correspondence action | CR12 line 2995, Lemma 3.5.3; line 3019, Proposition 3.5.4; following Propositions 3.5.6 and 3.5.10, pp. 62–67. Supports proper over the target, graph/transposed-graph directions, two grading shifts and finite-surjective support in the change-of-base statement match. |
| 5.1 finite/topological quotients | CR12 line 3560 onward, §4.2.1–4.2.2; Lemma 4.2.3 and Definition 4.2.5 at line 3700, pp. 76–77. Normal equidimensional inputs and both universal-homeomorphism directions agree. Integral normal-target Frobenius factorization has the stated direction. The overbroad Check is R02. |
| 5.2 quasi-resolutions | CR12 line 3751, Definition 4.3.1, and line 3765, Remark 4.3.2, p. 79. dJ97 line 798, Corollary 5.15, p. 620, allows the excellent zero-dimensional base Spec k. dJ96 line 1459, Corollary 7.4, p. 88, is supporting context. The normal intermediate finite factor need not be radicial over nonnormal Y. Integrality is retained in the theorem but missed in one Check, R02. |
| 5.10 isolated singularities | CR12 line 4301, Corollary 4.6.4, p. 90; line 4444, Theorem 4.7.4, pp. 93–94. The normal isolated-singularity criterion follows from the exceptional-fibre computation. The cone WO claim uses that computation, rather than dropping the additional hypothesis of the source's Wω claim. |
| 6.12 RCC implies universal rational CH₀-triviality | ESN03 line 70, paragraph before Corollary 1.3, p. 2; GNT19 line 1304, Remark 4.6, p. 29; Tan18 line 1183, Proposition A.4, p. 30. Smooth projective geometric connectedness ensures the normal/proper base-change hypotheses. Rational coefficients descend the geometric CH₀ computation via the supplied torsion-kernel result. Kollár's primary locators remain uncertified. |
| 6.13 Witt vanishing | ESN03 line 52, Theorem 1.1, p. 2, and line 128, Lemma 2.1, p. 4; CR12 line 4544, Theorem 4.8.1, p. 96, supplies the WO statement. The package uses its corrected §5.12 only on WO, then the smooth slope comparison. The rational-coefficient form is justified by that route; it is not inferred by weakening Esnault's integral hypothesis without argument. |

All cited works have manifest entries: 25 unique works, 17 certified and eight settled uncertified. No new work required fetching and no manifest entry was changed. All explicit unread/cited-by-locator flags were accounted for; the limits are listed below. The proof step newly used in §5.12 was checked at CR12 line 4245 (projector in every degree), line 4645 (relative shift), and line 4656 (where the printed conclusion loses it). The supplied trace on P¹ verifies the correction independently.

**Computed adversarial table.** K means W(k)[1/p]; q is a finite field cardinality, so q ≥ 2. Rows cover all 15 seeded targets, every headline, each altered mathematical construction and all findings. For the other untouched targets, the round-2 table's numerical rows were retained after rereading their statements. Examples test statements and normalizations; they are not asserted to prove the full theorems.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions, 0.1 Witt ideals | F₂, lengths 1 and 2; ideals 0 and O | W₁ = F₂, W₂ = Z/4; FV(1) = VF(1) = 2; V(1) = 2 versus [1] = 1; W_n(0) = 0 and W_n(O) = W_nO | Pass; no O-module structure silently imposed for n > 1. |
| 0.1 inverse limits, repaired route | Spec F_p, I = O | lim Z/pⁿ = Z_p; lim¹ Z/pⁿ = 0; Hⁱ = 0 for i > 0 | Pass; tower input precedes proper finiteness. |
| 0.2 rationalizations | ⊕_(n≥1) Z/pⁿ | Tensor with Q = 0; pᴺM ≠ 0 for each N, so isogeny image ≠ 0 | Pass; uniform exponent is substantive. |
| 0.3–0.5 Frobenius and declared gap | k[ε]/ε² at p = 2,3; F_p(t) ⊂ F_p(t^(1/p)); identity/empty | F([ε]) = 0; field inclusion composed with b ↦ bᵖ is F on both sides, N = 1; identity/empty use N = 0 | Pass; the field example needs wider than finite-type-over-F_p factorization. |
| 1.1 fppf descent | Spec(k×k) → Spec k; F₄/F₂ | Čech terms W² and W⁴ have equalizer diagonal W and positive normalized cohomology 0; W(F₄)^Gal = Z₂ = W(F₂) | Pass; split and nonsplit finite covers. |
| 1.2 derived products | k ⊗ᴸ_(k[t]) k | Tor₀ = k, Tor₁ = k, higher = 0; Frobenius on Tor₁ = 0, so localization gives k in degree 0 only | Pass; an ordinary tensor product before localization would omit Tor₁. |
| 1.3–1.6 excision and h-descent | Bl₀A²; nil thickening; nodal curve | Blowup sequence is 0 → A → A⊕W(k) → W(k) → 0, with maps (id,restriction) and difference; nil thickening gives Q_p → Q_p identity; nodal descent gives H⁰ = K, H¹ = K | Pass; existing h-site/refinement contracts suffice. |
| 2.1 Witt ideal vanishing | Cone over canonically embedded nonhyperelliptic C; Bl₀A² | First has R¹I′ containing H¹(C,ω_C) = k, but R¹WI′_Q = 0; second has H¹(P¹,O(m+r)) = 0 for m,r ≥ 0 and R¹WI′_Q = 0 | Pass; distinguishes integral coherent and rational Witt vanishing. |
| 2.2 exceptional locus | Tree of rational curves; ordinary/supersingular elliptic exceptional curve | dim R¹f_*WO_Q = dim H¹(E,WO)_K = 0, 1, 2 respectively | Pass; supersingular slopes are (1/2,1/2), both retained. |
| 2.3 compact supports | A¹, G_m, point, empty | A¹: all groups 0 from K → K identity; G_m: H_c¹ = coker(K → K²) = K, others 0; point: H_c⁰ = K; empty: 0 | Pass; H⁰(A¹,WO)_K is infinite dimensional, unlike H_c⁰ = 0. |
| 2.5–2.6 truncation | Normalization hypercover of split nodal cubic | C⁰ = K, C¹ = K³, d⁰ = 0; truncation at 1 gives H¹ = K³; degree 2 imposes a = 0, b+c = 0, giving K | Pass; comparison range q < N is essential. |
| 3.1 cutoff and determinants | Rank 0; F = σ; F = pσ; F = (σ,2σ) over F₄ | E^<1 = 0, K, 0, K respectively; determinants 1, 1−t, 1, 1−t; last F² = diag(1,4), slopes 0 and 1 | Pass; strict cutoff and q normalization agree with parent. |
| 3.2 integral reduction | Point in Spf Z_p, n = 2; φ(t) = tᵖ | Z/p² → F_p sends 1 ↦ 1 and p ↦ 0; tube map Q_p → Q_p is id; O⊗Q = 0; s_φ(t) has ghosts t^(pⁱ) | Pass; repaired integral compatibility cannot be replaced by rational specialization. |
| 3.3 comparison morphism | Point, P¹, ordinary E | Point map K → K is id; P¹ rigid degrees 0,2 map K → K and K(−1) → 0; ordinary elliptic H¹ maps rank 2 → rank 1 | Pass; correct direction and smooth augmentation. |
| 3.6 comparison headline, 3.7 affine vanishing | A¹, G_m, supersingular E | Rigid compact A¹ has slope-1 H² killed by cutoff; G_m slope-0 H_c¹ survives with dimension 1; elliptic slopes (1/2,1/2) give dimension 2 on both sides | Pass; no properness substituted for compact supports. |
| 4.1 canonical sheaf | Point; P¹; normal abelian-surface cone | W_nω_point = W_n(k); W₁ω_P¹ = O(−2), H¹Wω_P¹ = W(k); cone dim = 3, dim H¹(O_A) = 2, so dualizing complex is not concentrated in degree −3 | Pass; repaired CM specialization is conditional. |
| 4.1–4.2 duality shift | Point d = 0; P¹ d = 1, n = 1 | Point K_X[0] = k; curve K_X = Ω¹[1] and K_X[−1] = Ω¹; omitting shift leaves H⁻¹ = Ω¹ instead of H⁰ | R03: bind dimension in formula and route. |
| 4.3–4.5 cycle action | Point x on P¹; two product correspondences | trace(cl(x)) = 1; Δ acts diag(1,1), {x}×P¹ acts diag(1,0), P¹×{x} acts diag(0,1) on H⁰WO ⊕ H¹WΩ¹ | Pass; sum equals Δ and transposed graph is pullback. |
| 4.6 repaired degree restriction | Spec k → P¹ by x | Degree = 1; 1 ↦ cl(x) with trace 1; target-WO projection = 0; N·cl(x) has trace N ≠ 0 | Pass; degree-zero source-WO conclusion is correctly restricted. |
| Layer 4 support overclaim | X = Y = two rational points; first diagonal component | codim projected support = 0; action diag(1,0); N·(1,0) = (N,0) ≠ (0,0) | R01: proper closed does not imply positive codimension componentwise. |
| 5.1 quotient definition and Checks | A²/{±1}, p odd; Spec k ⊔ A¹ | First cover degree 2 is prime to p; second component dimensions (0,1), so smooth = true, equidimensional = false | Definition passes; universal smooth Check fails, R02. |
| 5.1–5.3 finite group controls | C₂ acting on A² by sign, p odd; S₃ permuting A³, p = 2,3 | Generic cover degrees 2 and 6; group-sum projector P satisfies P² = 2P or 6P; after Q, P/2 and P/6 are idempotent. Only the first cover is tame at the stated primes | Pass; general finite quotients include wild nonabelian actions. |
| 5.2 quasi-resolution | Relative Frobenius of P¹; of P¹⊔P¹; nodal normalization | First integral, degree p, purely inseparable; second nonintegral although each component degree p; nodal normalization has generic degree 1 but two points over node | R02 on disconnected Check; theorem correctly avoids calling every intermediate finite factor radicial. |
| 5.4, 5.6 singularity headlines | Smooth identity; quadric cone resolution; Frobenius | Identity gives R⁰WO = WO, higher = 0, and likewise Wω; cone exceptional P¹ gives H¹WO = 0; Frobenius push-pull = pᵈ, invertible over Q | Pass; tests both directions of universal-homeomorphism invariance. |
| 5.10 isolated criterion | Exceptional conic, elliptic curve, rational tree | H¹WO dimensions 0, 1 or 2, 0; rationality answers yes, no, yes. Cone over quadratic point instead has H⁰ map K → K², not onto | Pass; degree-zero connectedness/normality conditions are not discarded. |
| 5.11 rational diagonal | P¹; geometric genus-one curve | Δ = pt×P¹ + P¹×pt, N = 1, degree(pt) = 1; on E over algebraic closure of k(E), [η]−[0] has degree 0 but is non-torsion | Pass; genus-one input excluded and factor directions fixed. |
| 5.12 repaired fibration headline | P¹ → point; Pⁿ_Y with Y smooth; identity | P¹: H⁰Wω = 0 = H⁻¹WS and H¹Wω = K = H⁰WS; Pⁿ: RⁿWω = Wω_Y(−n), others 0; identity: R⁰Wω = Wω, higher 0 | Pass; both internal and cohomological shifts are necessary. |
| 6.1–6.3 zeta headline | Point, P¹, A¹, G_m, empty | ζ^W = (1−t)⁻¹, (1−t)⁻¹, 1, 1−t, 1, exactly the <1 factors. (1−qt)⁻¹ has N_r = qʳ divisible by qʳ; (1−t)⁻¹ has N_r = 1 | Pass; even degrees denominator, odd degrees numerator. |
| 6.4 proper morphism Lean headline | P¹ → point; empty → point; two points → point | Counts q+1 ≡ 1; 0 ≢ 1 with H⁰ k→0 noninjective; 2 ≢ 1 with H⁰ k→k² nonsurjective | Pass; degree-zero cohomology hypothesis prevents vacuity. |
| 6.6 projective Lean headline | n = r = 0; conic; double line; union of two lines | Counts 1, q+1, q+1, 2q+1, all 1 mod q. Constant 1 has no zeros but is excluded by positive degree; elliptic cubic in P² excluded by 3 ≤ 2 false | Pass; zero polynomial of allowed homogeneous degree gives full Pⁿ, count Σqʲ ≡ 1. |
| 6.6 affine Lean headline | No equations in m > 0 variables; ternary quadratic over F₉; f = x in one variable; no variables | Counts qᵐ and 81 are divisible by q; f=x gives 1 but degree inequality 1<1 false; no variables gives inequality 0<0 false | Pass; q = 9 conclusion exceeds characteristic-3 Chevalley–Warning. |
| 6.9 theta definition/headline | Elliptic rational P,Q; 2P and P+Q; dimension zero | h⁰O(P) = h⁰O(Q) = 1, counts 1=1; h⁰O(2P) = h⁰O(P+Q) = 2, counts 1 and 2 excluded; dimension-zero theta empty, counts 0=0 | Pass; ideal O(−P) has h⁰=0, so omitting the dual fails. |
| 6.10 degree and universal CH₀ | Rational x and quadratic y; Pⁿ; empty; quadratic point | deg([y]−2[x]) = 2−2 = 0; CH₀(Pⁿ_L) = Z with degree 1; empty degree image 0; split quadratic point has non-torsion kernel generated by (1,−1) | Pass; both surjectivity after Q and torsion kernel are tested. |
| 6.12 RCC → universal CH₀ | P¹; smooth cubic surface; elliptic E | P¹ points joined by one rational curve, degree gives Z→Z identity; geometric cubic CH₀ = Z; every P¹→E constant, so distinct points cannot be joined | Pass; field-extension/torsion-kernel route yields CH₀_L⊗Q = Q for admitted examples. |
| 6.13 Witt vanishing | Pⁿ; smooth cubic surface; elliptic cone | Pⁿ positive WO groups 0, crystalline H²ʲ slope j; cubic H² slopes all 1, cutoff 0; elliptic cone is RCC but singular and has nonzero exceptional Witt H¹ | Pass; smoothness and WO-rationality in the respective theorems are substantive. |
| 6.14 Esnault Lean headline | Pⁿ; smooth cubic surface; empty; quadratic point | Counts Σqʲ and q²+tq+1 are 1 mod q; empty and quadratic point have 0 points and fail geometric connectedness/universal CH₀ | Pass; geometric ConnectedSpace includes nonemptiness. |
| 6.14 repaired elliptic Check | y²=x³−x/F₃; y²=x³+x+1/F₅ | Counts 4 ≡ 1 mod 3 and 9 ≡ 4 mod 5; both have a non-torsion generic degree-zero class after extension | Pass; congruence alone does not imply universal CH₀-triviality. |

**Pinned declarations opened.** Paths here are library-relative. The native definitions were inspected, not inferred from their names or the resolver. The mathematical bodies relevant to the headlines include the following.

| Pinned declaration/location | What was checked |
| --- | --- |
| `Mathlib/RingTheory/WittVector/Identities.lean:43`, :102, :141; `Basic.lean:263`; `Frobenius.lean:283` | FV, multiplication/V, VF with CharP, surjectivity of Witt map, perfect-coefficient Frobenius equivalence. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Semilinear automorphism over perfect characteristic-p coefficients; no built-in finite-dimensional or domain hypothesis. Layer 3 separately requires finite dimension. |
| `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45`; `Localization.lean:133`, :416 | Serre property, zero iff membership, and abelian localization with the required additive localization instance. |
| `Mathlib/FieldTheory/ChevalleyWarning.lean:110` | The actual conclusion is characteristic divisibility; not the new field-cardinality theorem. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:91`; `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`; `Mathlib/RingTheory/PowerSeries/Exp.lean:50` | Nonzero representative of a projective class, native characteristic polynomial, and formal exponential. No substitute scalar algebra is used as a headline. |
| `Mathlib/AlgebraicGeometry/ResidueField.lean:147`; `Noetherian.lean:236`; `Geometrically/Connected.lean:40` | Residue degree is finrank, zero for infinite degree; locally finite type over locally noetherian gives locally noetherian; geometric connectedness includes nonemptiness. Proper finite-type zero-cycles avoid the infinite-degree junk case. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean:170` | The monoidal unit is the structure sheaf viewed as its own module, not a free coefficient parameter. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`; `Cohomology/Pullback.lean:65`; `Modules/Pullback/Basic.lean:211` | Native sheaf H, contravariant pullback, and pullback of the unit. The relative congruence uses their actual composite. |
| `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:48` | Base-ring module structure through the map to global functions. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object. |
| `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Invertible.lean:307`; `LineBundle/Dual.lean:44`; `LineBundle/Ample.lean:71` | Ideal O(−Θ), its dual O(Θ), and ample classes including quasi-compactness and affine nonvanishing loci. |
| `TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveOver.lean:57`, :77 | Finite-module projective embedding and resulting properness. |
| `TauCeti/AlgebraicGeometry/Chow/Basic.lean:70`, :86, :257, :280, :295 | Dimension-supported locally finite cycles and actual rational equivalence, including the zero-dimensional test and quotient. |

Object searches in both pinned libraries found ring Witt vectors and smooth isocrystal infrastructure, but no existing scheme Witt cohomology, rigid cohomology or Witt singularity carriers that would make the docstring omissions avoidable. The routine scheme-morphism, homogeneous-polynomial and derived-category names in the contracts resolve at the pins. All eight local Lean names are present in both files. No duplicate fully qualified declaration was found in the readable roadmap corpus.

**Ownership, suppliers and overlaps.** The package index was read before searching. Object searches used `roadmaps grep` across the indexed main and open heads, and the board packages, for Witt canonical systems, Witt-rational singularities, compact supports, slope–Witt comparison, theta divisors and universal CH₀. The parent's smooth Witt theory is now imported; the new singular/nonproper and supported-correspondence extensions belong here. The nearest open scopes—CrystallineCohomology #857, rigid cohomology #1002, ArcTopologyAndDescent #1755, moduli #1754 and étale duality #1743—were read. Moduli owns Picard/numerical/contraction machinery; étale duality owns a different coefficient theory. JacobianChallengePartII #1225, `TauCetiRoadmap/JacobianChallengePartII/README.md:296`, concerns the Jacobian theta polarization, not this general theta predicate or congruence. No residual object-ownership collision was found.

The supplied head-based overlap file reports no conflicting head, dropped cited id or unnamed open-revision-only id. Attempting `roadmaps overlaps CrystallineCohomologyPartII` directly reports that the package is not yet a roadmap on main or an open head; it does not supply an additional clean scan. The supplied package-aware overlap result and direct supplier resolutions, rather than that failed lookup, are the evidence used here. Existing roadmaps were resolved on main; new roadmap suppliers were resolved at their provided open heads. The relevant resolutions are:

| Supplier | Current section/declaration resolution |
| --- | --- |
| CrystallineCohomology #857 | `TauCetiRoadmap/CrystallineCohomology/README.md:5209`, Frobenius-lift Witt section; :5923, Witt schemes; :6083, affine ideals; :6621, slope decomposition; :7196, smooth trace. CR.4.4 identities/PD, CR.4.6 de Rham–Witt/descent, CR.4.7 comparison/spectral sequence and CR.4.8 logarithmic sheaves also resolve. Smooth pure dimension suffices for the Ekedahl isomorphism consumed here. |
| DerivedDeRhamCohomology #868 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md`, PD.6 universal base-compatible PD envelope and completed envelope/completion comparison (:2779). |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:38` explicitly maps former §1.T.1 tower references to their supplied location. A numbering bridge, not drift. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:553`, enhanced derived category; E1 tensor; E2 bounded-below hypercover descent; :1809 module descent; :1951–1978 animation, positive-homotopy Frobenius, simplicial Witt and bounded totalizations; :2415 and :2427 proper-surjection level and fppf descendability. |
| ArcTopologyAndDescent #1755 and PrismaticCohomology #1057 | `TauCetiRoadmap/ArcTopologyAndDescent/README.md:275`, :298, :343 resolve §§1.1, 1.3, 1.6. `TauCetiRoadmap/PrismaticCohomology/README.md:2283`, §2.0 supplies proper-then-open refinement with finite-presentation hypotheses. The identity-open and identity-proper examples have the correct direction. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: §§0.20 (:1448), 0.23 (:1634), 0.26 (:1792), 0.29 (:1973); §§2.6–2.7 (:3554, :3613), 2.19–2.21 (:4265, :4452, :4566); §§4.9, 4.12, 4.14, 4.16, 4.19; §§5.1, 5.2, 5.5 resolve the named normalization, Frobenius, coherent duality, alteration and Chow operations. The CM target at :4515 is now used only with its hypothesis. |
| ClassicalAdicEtaleCohomology #875 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3146`, §5.4 plurinodal alteration over integral excellent bases, with quotient function-field control. The perfect-field quasi-resolution application is a further target here. |
| MotivesAndAlgebraicCycles #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:83`, §0.1 correspondences; :181, §0.6 integral fixed-support diagonal; :354 onward, §2.2 continuity/torsion kernel for smooth projective schemes. The rational extension here clears denominators and keeps those hypotheses. |
| AbelianSchemesAndArithmeticModuli #849 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1161`, A2.4 ample h⁰ = χ and deg φ_L = χ², justifying the theta predicate. |
| AdicSpacesPartIII and EtaleCohomologyFoundations, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:3013`, F0.6 graded-cohomology finiteness; `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:107`, G.2 Nagata compactification. |
| NeronModelsAndSemistableAbelianVarietiesPartII | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:270`, §1.1 Ferrand pushouts, resolves the comparison in the finite-pushout Check. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`: RD.3.1–3.2 at :5575/:5607; RD.4.1/5/12/17–19/24/36–38 at :7045/:7165/:7358/:7479/:7507/:7541/:7668/:7907/:7950/:7978; RD.5.67/73–74/77–78/89–90 at :10063/:10219/:10241/:10288/:10308/:10638/:10662; RD.6.22–23/58 at :11939/:11961/:12865; RD.7.4 at :13886. Frames, tubes, comparisons, descent, boundedness, Frobenius, finiteness, trace, slopes and Fatou all match the consumed inputs. |

The sole declared gap, `qcqs-frobenius-factorization`, has the same slug and exact needs in README:104 and `packages/CrystallineCohomologyPartII/design/plan.json:4985`. It is precise and owned by SchemeAndStackFoundations §0.26: finite finitely presented universal homeomorphisms of qcqs F_p-schemes, with both Frobenius composites and one N. The supplier's finite-type-over-F_p result does not already supply that generality. This is a valid contract, not an unowned prerequisite; it does not cause this verdict.

The prescribed dependency gate, with `--movable`, returned exactly:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The separate citation resolver found no missing cross-roadmap citation or local Lean name. Its warning that it did not inspect pinned Lake packages was not treated as library verification; those sources and elaboration were checked independently. The internal Needs graph and changed routes were inspected separately from this inter-roadmap gate.

## Not verifiable

- Eke84, EkeII, Kol96, Ser58, Ax64, BS83, Tsu03 and Tsu04 remain settled uncertified texts. Their primary contents were not read, and their locators are not certified by this report. They were not requested again or renamed. Readable CR12, BBE07, ESN03 and the named suppliers support the applications identified above.
- HW23's published Corollary 1.3 and pp. 19–20 are absent from the certified arXiv v2 extraction. The manifest already records this difference. The readable v2 Corollary 4.6, p. 21, was checked with p > 5 and existence of a log resolution; the published supplementary locator remains unverified.
- The package-only name is not accepted by the standalone overlaps command. Ownership against the readable indexed open heads was checked through searches and direct scope/contract inspection, using the supplied package-aware overlaps file for dropped-id/conflicting-head leads. No claim is made to have read every open pull request in full.

## Source issues

- **Error** in CR12 at Theorem 4.8.1 and Proposition 4.8.4, printed pp. 96–98: the source identifies positive Wω direct images without the relative-dimension shift; it should retain that shift and the base degree-zero term; affects a stated result.
- **Misprint** in CR12 at Corollary 4.5.1, printed page 86: the source places the quasi-birational comparison over X; it should place it over S, the common target; affects nothing.
- **Misprint** in GNT19 at Proposition 2.23, printed page 18: the source places the coherent ideal of O_X on Y; it should place it on X; affects nothing.
- **Misprint** in GNT19 at the proof of Lemma 2.18, printed pages 15–16: the source tests higher-direct-image sheaves on affine opens of X; it should test them on affine opens of Y; affects nothing.
- **Misprint** in ESN03 at the proof of Lemma 2.1, equation (2.6), printed page 4: the source gives ordinary cohomology as the abutment of the supported Čech spectral sequence; it should give cohomology with support in Z; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3cf8dc83fa72943e2fee79200c463bd09478aa26", "job": "REV-PKG-CrystallineCohomologyPartII~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
