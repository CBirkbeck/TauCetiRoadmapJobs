<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/332#issuecomment-6400655716 -->
Review (codex) of 519048f

Verdict: needs_changes

1. **F01** (P1) The global integral normalization cannot use an arbitrary stratum

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:477`; the same statement is in `packages/HigherHidaAndColemanTheory/design/plan.json:873`. Passage: “Globally choose k′ sufficiently large and tildeωκ=ωκ(−k′Σ_i Z_i) so this normalized correspondence extends to the degree model.”

   **Claim:** The normalization ν_w(t)t_naive, introduced for an arbitrary w, extends globally after this vertical twist.

   **Witness:** BP-Hida line 2488–2515, Propositions 4.3.11–4.3.13, pp. 48–49: the global operator uses w∈C(κ). For GL₂ weight 2, the other normalization sends an integral constant q-expansion coefficient to 1/p.

   Here is the calculation, including why increasing k′ does not repair it. Take κ=(2;−2), ρ=(−1;0), t=diag(p⁻¹,1), with cocharacter (−1/2;−1/2). The two ν_w are (0;2) and (2;2), evaluating to p⁻¹ and p⁻². On the degree-zero ordinary component, U_naive sends a q-expansion to p times its U-series, so its constant coefficient 1 goes to p (BP-Coleman line 6541–6546). The compatible global normalization gives 1; the arbitrary other one gives p⁻¹. At p=3 these are 1 and 1/3. Away from the intersection of the two degree components, the two pullbacks of ΣZ_i agree: the effective difference has precisely intersection support (BP-Hida line 2507–2509). Twisting both lattices by p^e therefore sends p^e to p^(e−1) for the wrong normalization, for every e. It cannot remove this generic-component pole.

   **Exact repair:** Keep all local t_w. Introduce a separate global t_κ using any w₀∈Cκ+, prove that its scalar is independent of that choice, and extend only t_κ by Proposition 4.3.13. State its restriction to each w′ as p^(n_w′)t_w′, with n_w′≥0 and n_w′>0 outside Cκ+ for strictly positive t, as in Remark 4.3.12. Propagate this distinction to H2/integral-cousin and H2/regular-control and the corresponding plan records. Add the weight-2 negative control above. Retest: naïve lower slopes (1,2) become (0,1), not (−1,0); the incompatible chamber is killed ordinarily as the Cousin argument requires. The repaired global statement retains every prime and genus.

2. **F02** (P1) General abelian-type local Banach projectivity has no supplied prerequisite

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:904–912`, F5/family-complex; its Needs line is 908. Passage: “A chosen supported projective Banach complex and its compact Hecke representative.” See also C4/finite-level-geometry at line 730 and the OverconvergentAutomorphicForms contract at line 143.

   **Claim:** The cited coefficient construction and quasi-Stein contract supply that complex for every quasi-split abelian-type datum admitted by Conventions.

   **Witness:** `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1507` conditions local projectivity on finite-flat trivializing covers. BP-Coleman Proposition 4.6.15, p. 95, line 4476–4483 supplies these for Hodge type, pregood affinoids and perfect Σ.

   I opened the supplier at its indexed new-roadmap head. Its §8.7 expressly requires those covers to be supplied or proved outside that setting. PerfectoidShimuraVarieties §6.14 retains the Hodge-type/pregood/perfect-fan restriction for this input. C4 promises reductions of torsors and an affinoid basis, but does not state the missing finite-flat trivialization/descent theorem. The projective-banach-cohomology gap starts with locally projective coefficients; the abelian-subcanonical-vanishing gap starts with locally trivialized projective coefficients. Neither establishes that premise. The abelian-affinoid-basis gap is about affinoid period preimages, not trivializing these reductions.

   A separating datum is the split adjoint Siegel datum PGSp₄. It is abelian type and locally quasi-split, so it is admitted, but is not itself Hodge type. Its Siegel Levi still has a nontrivial root and genuinely analytic coefficient variables. Taking a Hodge-type cover of the Shimura datum is not yet a finite-flat equivariant trivialization of every required finite-level reduced torsor, with compatible descent of these Banach modules.

   **Exact repair:** Add a precise supplier contract, naturally to PerfectoidShimuraVarieties §6.14, for finite-flat equivariant trivializing covers of the actual abelian-type Bruhat reductions used here, with the levels, fan refinements, quotient torus, cyclotomic reduction and descent conditions of the coefficient supplier. Alternatively own an explicit descent theorem here that supplies exactly that conclusion. Add its gap/target to F5/family-complex and the geometry/coefficient contracts, and make the existing cohomology gap conditional on the resulting local projectivity. Do not restrict the roadmap to Hodge type. Retest on PGSp₄: one must now be able to name the cover/descent input before applying §8.7; in the Hodge-type pregood case reuse Proposition 4.6.15 without requesting a duplicate theorem.

3. **F03** (P1) Klingen control consumes an unowned analytic family and extension theorem

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:1339–1341`; `packages/HigherHidaAndColemanTheory/design/plan.json:3816`. Passage: “Use the small-slope extension theorem, Theorem 14.7.1, and the two-term degree bounds.”

   **Claim:** The listed inputs suffice for the rational comparison for every k≥0, including the Euler-characteristic argument extending the large-weight result.

   **Witness:** Pilloni-Singular line 4554–4556, Theorem 14.7.1, p. 99, is a separate Klingen extension theorem. Line 4668–4676, Lemma 14.8.4, p. 102, uses a second analytic family and Proposition 13.4.1.

   The theorem used is restriction from the full Klingen space to its overconvergent region at slopes strictly below k+2r−3, including the cuspidal variant. The all-weight proof then compares the Euler characteristic of the formal family from Theorem 11.3.1 with that of H_cusp^i(†,k,2); Corollary 13.3.3.1 supplies its comparison with overconvergent fixed-weight cohomology. X8/klingen-complex constructs the formal height-one Iwasawa object, not this analytic family. The Needs list contains neither a target for the extension theorem nor one for the second family/comparison. C4–F5 concern the full-torus Bruhat theory, and Scope expressly distinguishes that theory from the Klingen partial-ordinary object. A paper theorem number is a source, not an owner.

   Object searches on main, indexed open heads and the board-index heads found Klingen geometry in ShimuraCompactifications and unitary Eisenstein families in AutomorphicCongruences; neither supplies this analytic coherent-cohomology family or this small-slope extension. Generic finite-slope/Euler-constancy machinery is already owned by PadicFamilies §2a.16 and LocallyAnalyticDistributions §4.16.

   **Exact repair:** Add named X8 targets for the Klingen analytic coefficient/cohomology family with finite perfect slope blocks and the comparison used in Corollary 13.3.3.1/Proposition 13.4.1, and for Theorem 14.7.1's restriction isomorphism, with Ω(k,r), the source's standing hypotheses, 0≤ε<1 rational, both boundary variants and strict bound k+2r−3. Import the generic slope/Euler machinery by its existing owner. List these prerequisites in X8/klingen-control, or give a different complete route with owned inputs. Retest at r=2,k=0: the threshold is 1, so ordinary slope 0 is included and slope 1 is excluded. In the Euler argument explicitly name both perfect families whose Euler characteristics are locally constant; constancy for M_Kli alone does not close it.

4. **F04** (P3) Label the untwisted slopes in the BGG Check

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:965`; `packages/HigherHidaAndColemanTheory/design/plan.json:2539`. Passage: “At κ=1 the degree≤1 piece has slopes 0,2, while z² has slope 4”.

   **Claim:** This is the numerical normalization witness for the exact equivariant BGG sequence at line 951, whose analytic terms carry the w0Mκ twist.

   **Witness:** BP-Coleman Example 6.2.19, pp. 151–152, line 7024–7034 distinguishes slopes −k,−k+2,…,k on V_k from 0,2,… on untwisted analytic functions.

   **Exact repair:** Label 0,2,4 as the slopes on untwisted V_lan,1 under f(z)↦f(p²z). Add that the term V_lan,1(w0Mκ) actually appearing in the BGG sequence has slopes −1,1,3, and its degree≤1 kernel matches V_1 with slopes −1,1. Update the plan Check too. Retest at p=2 or 3: the eigenvalues on 1,z are p⁻¹,p after twisting, not 1,p². The exactness theorem needs no change; the defect is the missing convention label in its Check.

5. **F05** (P3) Definition API and Checks are incomplete

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:832`, C4/interior-cousin. Passage: “Define H_w,!^i as the image of local cuspidal to canonical H_w^i.”

   **Claim:** This introduces the local and global interior objects, but the subsection is treated only as a theorem in the plan and has neither a definition API list nor three Checks. In addition, H2/fixed-complex at `packages/HigherHidaAndColemanTheory/design/README.md:531` uses a compact Shimura variety for its third Check, although its standing datum is GSp₂g/ℚ with g≥1.

   **Witness:** The complete subsection at lines 828–838 contains the definition, theorem, route and Needs line, followed by one caution about images. There is no Checks block. E6's later family-image definition has one.

   **Exact repair:** Keep the theorem and add the image definition's API: source/target and induced Hecke action, the intersection-of-ranges vanishing, and the identity when boundary variants agree. Add three discriminating Checks: the zero map F→F has image 0; the identity has image F; multiplication by t on F⟨t⟩ has image (t), whose fiber at zero is F although the specialized map has zero image. These computations exclude replacing the image by the target, the kernel, or an image after arbitrary base change. Add the matching definition/API/Check metadata in the plan. For H2, replace the compact-variety Check with a genuine Siegel boundary test: at a genus-one cusp with parameter q, O(−D)→O is (q)↪O; on the boundary fibers this map is zero, whereas the identity is nonzero. The cusp at infinity already witnesses the nonempty boundary at g=1; the GSp Siegel datum is noncompact in every positive genus. Compact abelian-type data are legitimate elsewhere in C4, but not instances of H2. No Suggested.lean declaration is requested.

Five findings: three P1 blockers and two P3 Check/API corrections. The roadmap is a legitimate Part II extension of PadicFamilies, not a replacement roadmap. Its scope is repairable. The eleven declared supplier gaps are contracts, not findings. No reviewed design or source-manifest file was changed.

## Verified sound

The review read all 63 target sections, their API/Check text, 77 request records and the eleven gap records. It checked the fifteen seeded source targets against the cached legal editions, revisited the fourteen previous findings, inspected all Needs lines and supplier headings, and recomputed the witnesses below. These are mathematical counterexample tests and source checks, not proofs of the future headline theorems. No acceptance claim is made while R01–R03 remain.

**Previous findings, checked first.** These statuses concern the specific previous objections; adjacent new defects are identified separately. No repair was marked “not actionable in this package”, so no settled finding is being reopened on that basis.

| Previous finding | Status and repaired passage | Verification |
|---|---|---|
| F01, absent solid suppliers | Repaired: “For separated finite-type ℤ-schemes X construct D(O_X,■)” (§2.1); “gap:solid-localization-kernel” (supplier contracts). | D1 now owns the scheme operations; SolidAnalyticRings §§7.2–7.4 exist. The two missing enhancements are declared. Integer-solid VStack analytification is not substituted for the relative analytic pair. |
| F02, section drift | Repaired: “§R3.4: Coherent quasi-Stein Theorems A and B”; “§F1.10: Coherent support triangles and dagger Serre duality”. | Resolved the cited main/open-head sections. General Serre-dual coefficients are an A0 target. The remaining hypothesis drift is R02, not a missing heading. |
| F03, undeclared extensions | Partly repaired: “What HodgeTateAndCanonicalSubgroups must provide (gap:siegel-ordinary-igusa)”; “The locally analytic BGG exactness needed for this application is a target in F5.” | Eleven owned contracts replace informal extensions; finite Hecke images are imported and eigenvariety gluing is owned. The finite-flat abelian-type prerequisite still needs R02. |
| F04, unowned/conjectural gaps | Repaired: “The scope does not include a general integral Hodge/PEL higher Hida theorem”; “The other three products may coincide” (§9.5). | All eleven remaining gaps name suppliers. Unsupported conjectural generalizations are not prerequisites. The isolated-root construction is now owned. R03 concerns further proof inputs newly exposed by the detailed Klingen route. |
| F05, coefficient/admissible duplication | Repaired: “F5 starts with their normalized Hecke action and supported cohomology”; “I3 proves admissibility for the actual Igusa tower”. | OAF §§8.6–8.7 and CompletedCohomologyPartII §§3.11–3.12 own the generic constructions; deleted target IDs do not remain. |
| F06, coherent-correspondence duplication | Repaired: “AutomorphicBundlesPartII IC.2, IC.3 and IC.5 is the owner”. | Generic composition, supports, group-ring models and relative vanishing are contracts, not second local constructions. That supplier's current text was unavailable; these remain valid declared gaps. |
| F07, GL₂ endpoint | Repaired: “λ=k is excluded and λ=k−1 is inside”. | At k=2, BP endpoint 2 and standard endpoint 1 agree across A0 and X8. |
| F08, small duplicated objects | Repaired: “Scalar renormalization is a convention on that existing operation.” | Opened the pinned Module.End and zpow declarations; resolved roots, blow-up, finite-image and Fitting owners. |
| F09, shape/Lean stand-ins | Partly repaired: “The headline theorems are Iwasawa derived control and Serre duality…” | Nine prose layers, nine Examples and nine Dependencies sections. No Suggested.lean or substitute scalar headline was introduced. R05 catches a definition embedded in a theorem node whose API/Checks were missed. |
| F10, pins | Repaired: “At the manifest pins use Module.End” (Mathlib contract). | Both commits agree with the read-only content manifest; exact pinned files opened, listed below. |
| F11, locators | Repaired: “Definition 2.4.2 and Lemmas 2.4.3–2.4.4, pp. 18–19” (§2.3). | Rechecked the sampled numbered results/pages, including the corrected ordinary localization, control and Cousin locators. |
| F12, source manifest | Repaired: four lifetime source keys with explicit version metadata. | BP-Hida, BP-Coleman, Pilloni-Singular and BP-GL2 are recorded; five editions do not create a second Coleman key. Locators follow the readable author editions rather than unverified journal pagination. |
| F13, coefficient quotient | Repaired: “Coefficients factor through the supplied rank quotient Gʳ=G/Zᵣ(G) and Tʳ.” | OAF §8.6 supplies the conditional Tʳ≃T^c comparison. The cubic norm-one torus gives Tʳ=1 but T^c=T; arbitrary interchange is excluded. |
| F14, discriminating Checks/hypotheses | Repaired as requested: “trace factor is p³”; “with dominant algebraic ν_alg”; “For n≥1” (§§3.2,7.2,3.1). | Trace pairing 3, BGG thresholds 0 and 3, n=0 collapse, and Klingen level/weight ranges were recomputed. R01 is a separate global-normalization error; R04 clarifies the BGG representation twist. |

**Seeded source audit.** The author has no remaining locator expressly flagged unverified in the README/plan/manifest. Implementation-status “unchecked” fields are not locator flags. All four supplied source texts were readable; no additional source fetch or missing-reference request was necessary. “Supports” below means the indicated source theorem has the stated mathematical content, subject to the separately identified dependency defects.

| Target | Opened locator and extraction lines | Hypotheses/content verified |
|---|---|---|
| §2.3 D1/ordinary-localization | BP-Hida Definition 2.4.2, Lemmas 2.4.3–2.4.4, pp. 18–19; line 884–945 | Integral analytic pair is retained. Finite bounded Artinian cohomology is used for Fitting comparison; complete towers are not arbitrarily interchanged. Supports. |
| §2.4 D1/ordinary-finiteness | BP-Hida Theorem 2.5.1 and Proposition 2.5.4, pp. 19–21; line 954–1017 | Proper compactification, coherent coefficient extension and strict dynamics produce ordinary comparison/finiteness. Not merely set-theoretic support invariance. Supports. |
| §3.1 H2/ordinary-strata | BP-Hida §§3.4.19–3.4.25, pp. 39–40; §4.1, Proposition 4.1.13, pp. 41–43; line 2072 onward, 2130–2233 | Polarized degree pairs, blow-up separation and n≥1; n>1 opens need not exhaust ordinary points. Supports. |
| §3.3 H2/stratum-dynamics | BP-Hida Lemma 4.4.2, Corollary 4.4.3, Proposition 4.4.4, pp. 50–51; line 2585–2638; Theorem 5.1.4, p. 53 | Strictness on nilpotent thickenings, decomposable tower levels and the cyclotomic unipotent twist. Supports the local statement. Global normalization remains R01. |
| §3.6 H2/integral-cousin | BP-Hida Theorem 4.5.2, Remark 4.5.3, pp. 51–52; line 2666–2674 | Chosen modified lattice/model, compatible chambers, genuine spectral sequence at walls. Source supports this with its compatible global normalization; repair R01 upstream. |
| §3.7 H2/regular-control | BP-Hida Corollaries 4.5.4–4.5.5, p. 52; line 2683–2688 | Regularity, one compatible column, rational character twist −ν and finite nebentypus. Supports, with R01 upstream. |
| §4.6 I3/derived-control | BP-Hida Proposition 5.3.3, p. 55; Theorem 5.3.5, p. 56; Remark 5.4.3, p. 57; line 2888–2953 | Local singular weights allowed, arithmetic evaluation at inverse character, derived tensor. Source supports. Global comparison is separately conditional on one compatible chamber. |
| §4.7 I3/finite-hecke | BP-Hida §5.4, p. 57; line 2954–2955 | Actual action image finite over Λ; does not imply flatness, reduction or degree-zero concentration. Supports. Generic finiteness imported from IHGD §2.1. |
| §4.8 I3/family-duality | BP-Hida Theorems 5.5.1–5.5.2, p. 57; line 2957–2977 | w*=w0Mww0, boundary exchange, Λ[−d], involuted torus action and inverse tame double coset. Supports. |
| §5.7 C4/geometric-duality | BP-Coleman Theorems 5.7.1–5.7.3, pp. 117–120; line 5458–5552; §2.7, pp. 31–32, line 1460–1501 | Complementary supports/degrees, finite-dimensional slope blocks, top forms Ω^d. The README avoids the printed extra shift. The Banach extension is an explicit gap. |
| §6.3 F5/perfect-slopes | BP-Coleman Proposition 6.1.11 and §§6.1.10–6.1.17, pp. 144–147; line 6686–6740; Theorem 6.4.3, p. 157 | Local adapted window, potent compact action, bounded projective model; finite cohomology need not be projective. Supports, conditional on R02's coefficient premise. |
| §6.5 F5/locally-analytic-bgg | BP-Coleman Theorem 6.2.16, Corollary 6.2.18, §6.2.20, pp. 151–153; line 6995–7078 | Split Levi, dominant algebraic weight, analytic germs, locally constant factor and twisted equivariance. Finite-slope removal of the extra smooth factor is distinct from small-slope coefficient classicality. R04 concerns the Check only. |
| §6.9 F5/family-vanishing-duality | BP-Coleman Theorems 6.6.1, 6.7.1–6.7.3, pp. 161–167; line 7603–7675 for the pairing/range conclusion | Cuspidal/canonical complementary bounds, domain for bottom torsion freeness, field-block perfectness. Does not promote arbitrary family cohomology to a perfect dual module. Supports, with coefficient/duality contracts retained. |
| §9.2 X8/modular-check | BP-Coleman §5.14.2, p. 141, line 6536–6547; BP-GL2 Theorems 1.2–1.3, p. 3, line 80–106 | BP versus standard scalar shift, strict endpoints and degree-one ordinary family. The extra minus in the Coleman printed pairing is not followed. |
| §9.5 X8/local-refinement | Pilloni-Singular §5.1.5, pp. 21–22, line 923–968; Lemma 14.8.3 proof, p. 102, line 4658–4667 | Source proves characteristic polynomial and four-distinct-root spherical comparison. The README explicitly owns the stronger isolated-root result and its nonvanishing obligation; it does not pretend the cited lemma proves that extension. |

**Computed adversarial table.** These rows cover every seeded target, the headline theorems, the changed foundational/convention patterns and all findings. Entries distinguish a valid small instance from a proof of a general theorem. Finite-dimensional toy complexes test grading and coefficient claims; they are not stand-ins for automorphic headline statements.

| Statement | Instances tried | Values computed on the two sides | Result/change |
|---|---|---|---|
| Scalar conventions; A0/slope-conditions | p=3, exponents 2,−1,0; GL₂ k=2 | Scalars 1/9,3,1; composing 2 then −1 gives 1/3. BP 1<2 true, 2<2 false; standard endpoint 1. | Pass; nonzero p retained. |
| A0/weight-dictionary; X8/c2-weight-table | ν=(0,−2;0), singular ν=(1,−1;0) | κ=(5,3),(5,1),(2,−2),(0,−2); inverse substitutions return ν. Wall first two weights both (4,2). Duals reverse the list. | Pass; four versus two compatible-column phenomena retained. |
| A0 root cone/quotient | Cone R≥0²; cubic norm-one torus | (−1,10) not in cone despite 10≥0. Norm-one torus has dim T^c=2, dim Tʳ=0. | Pass; no scalar/vector equivalence or unconditional T^c=Tʳ. |
| D1/solid-scheme-operations | Identity; smooth line over F₂ and Z/9; A[t], D(t) | q!A=A[0]; Ω¹[1] lies in degree −1, not 0. Localization A[t,t⁻¹] differs from completion A[[t]]. | Pass for these tests; foundation remains an owned construction. |
| D1/dynamic-compactification | Frobenius on P¹/F₂, D−=V(t); identity divisor | Pullback 2D−; (t²)=(t)² gives s=1/2. Identity would require (t)^a⊆(t)^b with a<b, false. | Pass; transposition switches boundary labels. |
| **D1/ordinary-localization** | A=Z/4, T=1,0,2; Q₂ with T=2 | Ordinary factors A,0,0; 2²=0 in A. Rational eigenvalue 2 has slope 1 and is not discarded by finite-slope extraction. | Pass; integral and rational notions differ. |
| **D1/ordinary-finiteness** | Proper point/F₂, empty boundaries, T=id | Both support orders F₂[0]; ordinary dimension 1=1. | Pass; strict inequalities vacuous only because boundaries empty. |
| D1/discrete-base-change, ordinary-perfectness | [Z₂ --2→ Z₂]; regular C₂ torsor/F₂ | Family H⁰=0,H¹=F₂; derived fiber dimensions (1,1). F₂[C₂]=F₂[e]/e² has A-rank 2 and group-ring rank 1; 1/2 does not exist. | Pass; derived tensor and no averaging retained. |
| **H2/ordinary-strata** | g=1, n=1, n=0, n=2 | Multiplicative/étale degrees 1+0=1; n=0 gives 0+0=0 and coinciding labels; n=2 permits noncanonical intermediate subgroup, beyond the two extremes. | Pass; n=0 excluded and n>1 exhaustion not claimed. |
| H2/integral-normalization | GL₂ k=2,p=3; GSp₄ trace t₂ | Correct/wrong normalized constant 1 versus 1/3; local slopes (0,1) versus (−1,0). Trace (−3,−3;0)·(−1/2,−1/2;−1/2)=3. | **R01**: local trace Check passes; arbitrary global extension fails. |
| **H2/stratum-dynamics** | Nilpotent thickening Z/4[t], divisor map t↦t²+2 | Mod 2 gives t²; in Z/4[t], (t²+2)²=t⁴. Powers 2 and 4 recover contraction factor 1/2. | Pass for the nilpotent-lifting mechanism, not a replacement for the supplied Igusa geometry. |
| H2/fixed-complex and fixed-perfect | Genus-one cusp q; [Z₂ --2→ Z₂] | Boundary coefficient map (q)↪O has zero fiber at q=0, while id has scalar 1. The free two-term complex has H⁰=0,H¹=F₂. | **R05** replaces the out-of-domain compact Check; perfectness need not mean torsion-free cohomology. |
| **H2/integral-cousin** | GL₂ k=2 versus k=1 | Regular C has one column of length 0; at k=1, κ+ρ has root coordinate 0 and both lengths 0,1 occur. | Singular degeneration is not claimed; **R01** fixes the operator supplying these columns. |
| **H2/regular-control** | GL₂ k=2, ν_id(t)=p⁻¹ | Tensor twist −ν multiplies by p; p·(p⁻¹U_naive)=U_naive. | Pass for the rational twist; global integral input needs R01. |
| I3 finite-level/admissibility/Iwasawa model | Finite torus quotient C₂; regular continuous functions | Functions on C₂ have rank 2; their dual is A[C₂], also rank 2. Degree i dualizes to −i and back to i. | Pass; Igusa admissibility is the local target, generic duality imported. |
| **I3/derived-control** | p=2, unit u=3, ν(u)=u; two-term t-specialization | Arithmetic [3] maps to 1/3, not 3. [A --t→ A] at t=0 has dimensions (1,1), whereas H⁰(A-complex)⊗F=0. | Pass; inverse character and Tor required, including singular local fibers. |
| **I3/finite-hecke** | Module F[e]/e² and multiplication by e; H¹-only complex | Action image has F-dimension 2 with e≠0,e²=0, not reduced dimension 1. H¹-only object has nonzero endomorphism image F. | Pass; no nilpotent removal or H⁰ truncation. |
| **I3/family-duality** | d=3, ℓ(w)=1, ℓ(w*)=2; d=0 point | Partner cusp interval [0,2] dualized into Λ[−3] gives [1,3]; point pairing 1·1=1. | Pass; target shift, opposition and boundary exchange agree. |
| I3/integral-amplitudes | g=1,2; hypothetical g=3 integral extrapolation | g=1 degrees 0 and 1; g=2 d=3 gives cusp [0,r], canonical [r,3]. g=3 d=6 is not an integral theorem here. | Pass; conjecture remains outside proved scope. |
| C4 geometry; F5/family-complex | Split PGSp₄ versus Hodge-type pregood datum | Both satisfy abelian-type/local quasi-split condition; only the second meets the stated Hodge-type finite-flat-cover premise. | **R02**: no cover/projectivity conclusion for first input has an owner. |
| C4/allowed-support; F5/family-complex | Nonempty Bruhat core point x; empty support | x∈B(m,n+s) forces x∈U∩Z; x∉∅. Independently RΓ_∅=0. | Empty-support Check is only conditional on being allowed; it cannot be used on a nonempty core. No universal existence of empty allowed pairs inferred. |
| C4 continuation, level control, Cousin/vanishing | Identity refinement; d=1, two Bruhat lengths | Identity restriction is 1; cuspidal ranges [0,0],[0,1]; E1 term degree r+q remains r+q. | Pass; full infinite-slope invariance is not claimed. |
| **C4/geometric-duality** | Dagger surface d=2, i=0; two-term d=1 | 0 pairs with 2 using Ω²; extra [−2] would give degree 4. For d=1, degrees 0,1 exchange. | Pass; printed shift/top-form problem avoided. |
| C4/interior-cousin | Zero and identity maps F→F; cusp/canonical ranges [0,r],[r,d] | Image dimensions 0 and 1; range intersection {r}. Multiplication by t gives fiber-of-image dimension 1 but image-of-fiber dimension 0. | Mathematical definition consistent; **R05** adds API and Checks. |
| C4/geometric-classicality | Regular length-one chamber; singular lengths 0,1 | Regular small-slope range [1,1]; singular allowed range [0,1], not one degree. | Pass; both classicality regimes retained. |
| **F5/perfect-slopes**, tor-specialization | A=F⟨t⟩, C=[A --t→ A] | Terms free ranks (1,1); H¹=A/(t) is not projective; C⊗ᴸF has H⁰=H¹=F. Tor₁ supplies the first F. | Pass; R02 concerns existence of the input model, not this algebra. |
| **F5/locally-analytic-bgg** | SL₂ k=0,1; p=2,3 | d/dz has one constant per analytic component. d²(z²)=2≠0 in Q₂,Q₃; d²(1)=d²(z)=0. Untwisted slopes 0,2,4; twisted −1,1,3. | Exactness tests pass; **R04** labels the slope witness. |
| F5 automorphic BGG, BGGsafe and control | C₂ test w=1, nonidentity Levi reflection | Two lower thresholds −3−(−3)=0 and −3+3−(−3)=3. Slope 2 fails the second bound; slope 3 fails neither. The printed doubled coefficient term gives second threshold 6; slope 4 passes that printed one-operator exclusion but not this BGGsafe test. | Pass for the README sufficient region; the source implication requires correction. |
| **F5/family-vanishing-duality** | d=3, ℓ+=1, ℓ−=2; domain A | Cusp + [0,1], canonical − [2,3]; pairs (0,3),(1,2). For bottom ideal (t)⊂F⟨t⟩, t·x=0 implies x=0. | Pass; field-block perfectness is not arbitrary module projectivity. |
| E6/eigenvariety and classical points | Zero complex; F[−1]; dual unit c=2 | Ann(0)=A gives empty support; H¹=F gives a point. Negative character 1/2 becomes 2 after t-inversion. | Pass; all degrees and action inversion retained; dominant converse hypothesis present. |
| E6/interior-sheaf and specialization | t:A→A; fiber at t=0 | Im=(t); (t)/(t²)≅F has dimension 1, while Im(0:F→F)=0. | Pass; surjection to specialized image is not claimed to be an isomorphism. |
| E6/interior-equidimension | A=F⟨t⟩, faithful M=A; square-zero finite algebra A[e]/e² | Both supports have dimension 1=dim A; reduction kills e but does not change dimension. Torsion module A/(t) instead has support dimension 0 and is excluded. | Pass; no equidimensionality claim for the full eigenvariety. |
| E6/interior-sharp-bounds | Analytic + slope 0 and GL₂ algebraic k=2 | Untwisting adds the algebraic bound 1: 0+1=1. Negative side changes sign. | Pass; interior hypothesis essential; no noninterior general conjecture imported. |
| B7 ordinary/family comparison | Vertical twist p^mA, integral A and A[1/p]; unit u=3 | p^mA[1/p]=A[1/p]; [3] evaluates to 3⁻¹ under the diagonal convention. | Pass; rationalization removes lattice modification, not character inversion. |
| B7/rational-amplitudes | g=3,d=6, ℓ=2 | Rational cusp [0,2], canonical [2,6]; partner length 4. | Pass; does not assert this integral genus-three bound. |
| B7/sharp-siegel; X8/siegel-check | k₁=5,k₂=3; t₂ and t₁ | Sharp t₂ bounds (3,4,4,8); t₁ (6,6,11,11). Standard t₂ strict endpoint 4−3=1; equality 1 excluded. | Pass; stronger-than-precomparison middle bound 4 rather than 3 is sourced. |
| **X8/modular-check** | k=0,1,2 | Integral normalization exponents min(1,k)=(0,1,1); relevant degree-one/degree-zero endpoints abs(k−1)=(1,0,1). Degree-one families are retained. | Pass; k=1 has empty strict nonnegative-slope window, not endpoint inclusion. |
| X8/klingen-complex | k=0,2; p-rank-one tower | Ω(k,2) weights (2,2),(4,2). One torus variable, not two; p-rank-one transition has degree 1. I=(p) gives I⁻³=p⁻³O, not O. | Pass for construction/range witnesses; analytic family is a different input, R03. |
| **X8/local-refinement** | p=3, Satake (1,1,9,9); all parameters 1 | Similitude products 9=9; pair products 1,9,9,81; eigenvalues 1/3,3,3,27. All-ones gives four equal roots and fails isolation. | Pass as discriminating examples; spherical nonvanishing is an explicit new theorem obligation. |
| X8/local-refinement projector | a=1,b=2,c=4, possible length-two b block | Denominator (1−2)²(1−4)=−3; P(1)=1,P(2)=P′(2)=P(4)=0. A single b factor has nonzero derivative and fails on that Jordan block. | Pass; primary decomposition permits collisions among other roots. |
| X8/klingen-control | p=2,k=0 versus k=3,4; r=2 | Rational threshold k+1=1 at k=0; 0<1 true, 1<1 false. Torsion condition k>3 admits 4 but excludes 3. | Range checks pass; **R03** supplies missing route. |
| X8 Klingen trace Check | k=0, p=2 | Divisibility products 16,8,8; after division by 8: 2,1,1, all integral. | Pass; no p=2 shortcut. |
| X8/unitary-check | n=2,ν=(4,2,0), inverse permutation action | Weights (−3,−5,2),(0,−5,−1),(0,−2,−4), lengths 0,1,2. | Pass; split specialization of general Coleman theory, not an integral unitary Hida claim. |

The scalar, C₂/A₂, normalization, BGG and projector values were also recomputed with exact rational arithmetic. The empty-support example was not treated as a counterexample to the definition: on an empty permissible preimage it is correct; on a nonempty core its “allowed” premise fails. Likewise the isolated-root polynomial calculation proves the projector identities, not nonvanishing on a spherical vector. The design correctly makes that latter assertion a separate proof obligation.

**Pinned-library and duplication audit.** Content main was `bbed953ce7f4abc20c898ee8cfdefff235ed9804`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following were opened at those exact commits, not at a newer installed checkout.

| Pinned declaration/file | Read lines and actual scope | Consequence |
|---|---|---|
| `Module.End`, `Mathlib/Algebra/Module/LinearMap/End.lean` | Line 32: abbrev for `M →ₗ[R] M`, with semiring, additive commutative monoid and module binders. | Scalar operator rescaling is existing algebra, not a new headline. |
| `zpow_sub₀`, `Mathlib/Algebra/GroupWithZero/Units/Basic.lean` | Line 399: group-with-zero identity with nonzero base and integer exponents. | The p=0 junk-value argument is excluded by the nonzero base; p=2 is not excluded. |
| `DerivedCategory`, `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | Lines 69–87: abelian category and chosen localization instance; definition at 87. | Native derived carrier exists; it does not construct solid scheme coefficients or Shimura cohomology. |
| `CondensedMod`, `Mathlib/Condensed/Module.lean` | Lines 35–42: R-modules on CompHaus with coherent topology, R a ring; abelian instance at 42. | This is a sheaf category, not an analytic-localization theorem. |
| `CondensedMod.IsSolid`, `Mathlib/Condensed/Solid.lean` | Lines 74–85, class at 83: the direct predicate's finite-type-integer-algebra caveat and polynomial restriction prescription. | The design records the caveat; no arbitrary relative analytic comparison follows from this predicate. |
| `TauCeti.lean` | Lines 1–14: intentionally empty root, ending in the module command. | No unstated root re-export can supply the missing automorphic carriers. |

Object searches at both pins for Igusa, Shimura-variety, automorphic-bundle, eigenvariety and solid-localization constructions found no carrier for these headline statements. Broader “Iwasawa” and “Shimura” searches returned the unrelated simplicity criterion, p-adic measures, and classical Hecke/modular-form material; those are not higher supported automorphic cohomology. Generic scalar algebra is already imported. The review does not infer absence merely from a proposed declaration name.

Ownership searches used `roadmaps grep` and `roadmaps show`, main and all indexed open heads, plus all nineteen entries of the supplied board-package index at their specified heads (package README or design README as present). Board Klingen hits in AutomorphicCongruences concern GU(2,2)/GU(3,1) Eisenstein series; the ordinary-modularity Part II hit concerns a patching example. These are different objects from X8's coherent Klingen analytic family. No same-object owner for R03's missing targets was found.

Every non-gap supplier heading was resolved and its consumed content inspected. Main suppliers were checked on main rather than using a revision-only pull request. The table groups repeated citations; the paths are `TauCetiRoadmap/<name>/README.md` (or the completed-main copy where applicable).

| Supplier | Resolved sections and ownership boundary |
|---|---|
| AdicSpacesPartIII; AdicSpacesPartIV | R3.1, R3.4, R3.6, R3.8; F1.10 on main. Coherent acyclicity, restrictions, trace and coherent dagger support duality exist; projective-Banach and LB/Fréchet strengthenings remain gaps. |
| AutomorphicBundles | B1.4–B1.5, B1.9; B2.3; B3.2, B3.4, B3.10, B3.general.1; B4.10, B4.16; B5.1, B5.10. De Rham torsor, algebraic coefficients and boundary/Hecke conventions imported. B1.9's centre restriction is handled through OAF's quotient comparison. |
| AutomorphicFormsOnReductiveGroups; ShimuraData | §6.7; §§3.8,3.10,3.13,5.5,5.6,5.10,5.11. Siegel chamber and C₂ data are existing inputs; A0 owns the general cohomological extension, and X8 evaluates those conventions. |
| CompletedCohomologyPartII | §§3.11–3.12. Continuous admissibility and measure duality imported; actual Igusa admissibility remains here. The inverse unit character agrees with [3]↦1/3. |
| DeformationAndDerivedPatchingAlgebra | §§7.1,7.3,7.5,7.6,7.8,7.10. Perfect models, derived completion, signs and hyper-Tor. The two-term t-complex above checks grading and residual detection. |
| IntegralHeckeAndGaloisDeterminants | §§2.1,2.3. Bounded finite derived Hom/action images, including nonprojective cohomology, and Fitting parts. These are applied, not reconstructed. |
| LocallyAnalyticDistributions | §§3.3,4.16,4.17. Character/slope infrastructure and relative cone order; central equality is retained. F5 owns the automorphic application and locally analytic BGG exactness. |
| OverconvergentAutomorphicForms | §§0.4,8.6,8.7. Induction/distributions, rank quotient and Bruhat families. The conditional finite-flat premise is the drift in R02. |
| PELModuli | M2.8–M2.9, M5.1–M5.2, M5.5–M5.6. Integral Siegel datum and split-unitary specialization, rather than the unrelated rank-one unitary example. |
| PadicFamilies | Layers 0,0a; §§0a.24–0a.25,2a.15–2a.16. Ordinary modular-curve theory, compact slope complexes and annihilator support. E6 owns cohomological Hecke gluing, without replanning the spectral carrier. |
| PadicMeasuresIwasawaAlgebras; PhiGammaModulesAndIwasawaCohomology | §§1.1,1.7; §4.0. Completed group algebra and actual character-space/inversion interfaces. |
| PerfectoidShimuraVarieties | §§4.5,6.3,6.8,6.12,6.13,6.13a,6.14,6.15. Abelian-type diamond/period inputs and finite-level tubes are distinguished from Hodge-type affinoid/trivialization inputs. §§3.13,6.8 support the declared affinoid-basis extension; R02 identifies the separate gap. |
| ResolutionOfSingularitiesCharacteristicZero | §6.3. Ideal-sum Cartier separation is for any scheme despite the roadmap title; it is correctly applied to integral degree models. |
| ShimuraCompactifications | C3.1,C3.9,C5.19–C5.21,C5.29. Common fans, cohomology comparison, normalized p-level models/charts and genus-two canonical line. Its C4.16–C4.17 Klingen correspondence geometry does not own the analytic cohomology theorem in R03. |
| SolidAnalyticRings | §§7.2–7.4. Actual numbered targets replace obsolete stage names. Polynomial structures explicitly exclude geometric localization-kernel conclusions; the design's two solid gaps remain necessary. |
| LieHighestWeight; SmoothRepresentationsOfLocalGroups | Layer 3; SR.0.2,SR.4.5. Algebraic PBW/highest-weight inputs and spherical Satake conventions, not the analytic BGG theorem or isolated Klingen spherical-line comparison. |
| VStackSheavesAndLisseCategories, ownership comparison only | VS2.2, including analytic spectra, integer-solid scheme gluing and formal complements, lines 725–789. Its underlying-integer-solid A-modules differ from A-solid modules: for A=Z[T], Q_p with T=p⁻¹ passes the former but fails the T-summability test. Thus this is not a duplicate owner of D1's full ring-solid operations. |

The board index was read before assessing absence. AutomorphicBundlesPartII's IC.2/IC.3/IC.5 text is not among the currently supplied readable heads; its named declared gaps are nevertheless valid ownership contracts. The review neither asserts that this roadmap exists nowhere nor treats that text's absence as supplier drift.

**Gap audit and build order.** All eleven slugs match between plan and README, all have a named supplier and section, and each neededBy list agrees with direct plan prerequisites. No dangling internal target/gap reference or internal target cycle was found. The contracts specify the source diagrams/objects and enhancements: two solid comparisons; two distinct Igusa towers; abelian affinoid basis; projective-Banach cohomology; complementary-support Banach duality; coherent correspondences; equivariant models without dividing by group order; PEL and abelian relative vanishing. None is rejected merely for being absent today. R02 is an additional unmet premise, not a demand to implement one of these eleven contracts in this package.

The required gate was run successfully, with this exact output:

```text
candidate: HigherHidaAndColemanTheory is not in the merge order yet; checked as if placed after PerfectoidShimuraVarieties (the intake inserts it when its design is accepted)
note: supplier OverconvergentAutomorphicForms of HigherHidaAndColemanTheory is not in the merge order; it must be inserted before HigherHidaAndColemanTheory
note: supplier SolidAnalyticRings of HigherHidaAndColemanTheory is not in the merge order; it must be inserted before HigherHidaAndColemanTheory
depcheck: 54 roadmaps, 608 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The two placement notes are intake requirements, not defects. Citation resolution reported no missing cross-roadmap headings or backticked names; its results were treated as leads and checked against the texts, rather than as evidence that hypotheses match.

**Shape, headlines and Lean.** Main examples read included AdicSpacesPartIII, AdicSpacesPartIV and PadicMeasuresIwasawaAlgebras. The design has Summary, Scope, Conventions, exact contracts, nine ordered layers, Examples/Dependencies for every layer, downstream use and references. All thirteen definition nodes and six construction nodes have API text and at least three listed Checks; R05 catches an out-of-domain Check and the additional definition embedded in a theorem node. Theorems carry locators and standing hypotheses. Small root/trace computations are mathematical Checks, not computational-algorithm targets. No sorry'd data, set_option, copied source passage, route-specific good-prime replacement or Lean-name padding was introduced.

The README's headline inventory is: derived Iwasawa arithmetic control; integral Iwasawa Serre duality; integral amplitudes in genera one and two; all-genus rational amplitude; regular and singular geometric classicality; cohomological eigenvarieties; interior equidimension/deformation; sharp interior and Siegel bounds; and the two-term singular Klingen control theorem. The relevant targets are I3/derived-control, I3/family-duality, I3/integral-amplitudes, B7/rational-amplitudes, C4/geometric-classicality, E6/eigenvariety, E6/interior-equidimension, E6/interior-sharp-bounds, B7/sharp-siegel and X8/klingen-control.

There is no Suggested.lean in this design-stage package. Consequently there are zero sorried declarations to probe, zero data bodies or imports to reject, and no declaration signatures on which to run scratch #check binder comparisons. Elaboration: **not available (this lane does not elaborate)**. No Lean command was run. The pins do not supply the Shimura/toroidal, supported automorphic-cohomology or analytic coefficient carriers needed to state these headlines using a few simple definitions. Their scalar, root and projector Checks are not acceptable substitute headlines. At package stage the module docstring must name each unavailable headline and its missing carriers; absence of that future file is not a finding against this design.

## Not verifiable

- Lean elaboration and one-tactic/binder probes are unavailable in this lane; there is no Suggested.lean to inspect. The report makes no claim of a successful Lean build or “sorry-only” warnings.
- Published journal typesetting/page-number equivalence was not independently certified. The four supplied legal texts are readable and the manifest identifies the author/preprint versions whose theorem and printed-page locators were checked. No inaccessible journal text was silently substituted.
- AutomorphicBundlesPartII's current IC.2/IC.3/IC.5 text was not accessible among the supplied current heads. Its declared contracts can be checked for matching slugs and precision here, but no claim is made that the supplier currently proves those enhancements.
- The isolated-root extension in X8/local-refinement is intentionally beyond the four-distinct-root source lemma. The projector identities and collision example were verified; the new spherical nonvanishing theorem is not independently proved by this review. Its explicit proof obligation is appropriate design content, not a certified consequence of density alone.

## Source issues

- **Misprint** in BP-Hida at Introduction §1.1, printed p. 2, line 62: the source says M is the unipotent radical; it should be the Levi factor, as defined later; affects nothing.
- **Misprint** in BP-Hida at Proposition 4.3.17, printed p. 49, line 2551: the source says the normalization with malformed weight parentheses; it should be −w⁻¹w0M(κ+ρ)−ρ, consistently with Proposition 4.3.9; affects a stated result.
- **Misprint** in BP-Hida at Lemma 2.5.3 proof, printed p. 19, line 987–989: the source says the second divisor-map target has positive qD−; it should be −qD−, as the next displayed twist requires; affects the proof.
- **Misprint** in BP-Hida at §4.1.12, printed p. 42, line 2183–2184: the source says Z_i equals a sum with conflicting free and bound indices; it should be Z_i=Σ_(j=1)^i D_(g+j); affects nothing.
- **Misprint** in BP-Hida at Proposition 6.2.13, printed p. 63, line 3261–3264: the source says the mod-p^r comparison tensors with A/p^n; it should be A/p^r, as in its proof; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, printed pp. 57, 64, line 2953 and line 3287: the source says arithmetic control uses inverse evaluation but later leaves family evaluation implicit; it should be identified through the diagonal inverse-character convention; affects the proof.
- **Misprint** in BP-Coleman at §5.14.2, printed p. 141, line 6545: the source says the negative of the displayed GL₂ pairing equals k; it should be the pairing itself equals k; affects nothing.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pp. 134, 168, line 6218–6220 and line 7712–7713: the source says its printed coefficient region follows from BGG and the analytic bounds; it should use the twisted thresholds a_an−ν_v and a_an+w⁻¹2ρ_nc−ν_v; affects the proof.
- **Misprint** in BP-Coleman at Theorem 6.4.3 proof, printed p. 157, line 7277: the source says an unresolved placeholder reference supplies the compactness step; it should identify the applicable compact-restriction and Hecke-factorization results; affects the proof.
- **Misprint** in BP-Coleman at Definition 6.4.7, printed p. 158, line 7317: the source says the first negative-support lower tube uses n; it should use the quantified support parameter l, separately from analytic radius n; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, printed p. 32, line 1489–1493: the source says an already degree-d supported complex receives another shift and uses Ω¹; it should have degree d once and use Ω^d; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), printed p. 167, line 7694: the source says the second negative bound omits the standalone ρ term; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed p. 173, line 7961–7967: the source says the interior amplitude assertion with the stronger sss label; it should use ss, the sharp region actually treated in the proof; affects a stated result.
- **Misprint** in Pilloni-Singular at §5.1.5, printed p. 22, line 951: the source says adjacent Satake products are equal; it should equate αδ and βγ, consistently with the preceding parameterization; affects a stated result.
- **Misprint** in Pilloni-Singular at Theorem 14.7.1 proof, printed p. 99, line 4557–4559: the source says the extension map targets the overconvergent region again; it should target cohomology of the full Klingen space; affects the proof.
- **Gap** in Pilloni-Singular at Lemma 14.8.3 proof, printed p. 102, line 4664–4667: the source says the four-distinct-root comparison follows from the displayed valuation pattern; it should justify the isolated chosen-root comparison even when other roots coincide; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "519048fecd94d57ac8f74a4ac54eaa8e7710e64d", "job": "REV-DESIGN-HigherHidaAndColemanTheory~2", "model": "gpt-6-astra", "worker": "chris-42"} -->
