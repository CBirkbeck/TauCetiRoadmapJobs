<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/168#issuecomment-6332684627 -->
Red team round 1 pass a (codex) of 7a3e546

Verdict: needs_changes

1. **F01** (P1) Classical comparison supplier names do not exist at its head

   **Location:** packages/PadicHodgeRegulators/README.md:62–68, “Owner and required target names”.

   **Claim:** The 21 listed identifiers and CS.0–CS.3 are supplied by CohomologyComparisonsPartII.

   **Witness:** None of the 21 identifiers occurs in the supplied sibling README. TauCetiRoadmap/CohomologyComparisonsPartII/README.md:314 instead defines `RigidSyntomic.complex`, using compactification filtration and r≥0; line 451 names `Syntomic.fontaineMessingPeriod`. No plan declares the absent interfaces as gaps.

   **Exact repair text:** Replace the table with citations to the actual current section and target names of CohomologyComparisonsPartII, matching every hypothesis and coefficient field. For any residual missing interface add “What CohomologyComparisonsPartII must provide (gap:<unique-slug>): <one precise statement with hypotheses>” and the identical slug, supplier, section and needs in the plan gaps. Remove CS.0–CS.3 as purported supplier locators throughout.

   The replacement citations are: “CohomologyComparisonsPartII §§2.1–2.3: `RigidSyntomic.specializationDiagram`, `RigidSyntomic.complex`, `RigidSyntomic.longExact`; §§3.1–3.4: `LogSyntomic.divisiblePD`, `LogSyntomic.complexes`, `LogSyntomic.omegaTauProducts`; §§4.1–4.4: `Syntomic.modifiedTateLattices`, `Syntomic.fontaineMessingPeriod`, `Syntomic.smallWeightComparison`, `Syntomic.boundedPeriodComparison`; §§5.1–5.3: `ClassicalSyntomic.hyodoKatoAdapter`, `ClassicalSyntomic.semistableFiber`, `ClassicalSyntomic.semistableFiber_baseConvention`, `ClassicalSyntomic.hRealizationCompatibility`; §§1.1–1.6,6.1–6.7,7.1–7.5: `FilFMIC`, `FilFMIC.extEvaluation`, `RelativeCohomology.filteredFrobeniusRealization`, `RelativeCohomology.openCurveResidueSequence`, `FilFMIC.specializationEvaluation`, `ClassicalSyntomic.absoluteExtensionValue`.” These do not automatically discharge the negative-weight extension, normalized exponential boundary or every claimed descent map; identify the residual statement explicitly rather than relabeling it supplied.

2. **F02** (P1) Integration supplier identifiers and dependency chain have drifted

   **Location:** packages/PadicHodgeRegulators/README.md:72–78, “Required target names in ColemanIntegrationPartII”.

   **Claim:** Ten named integration/index interfaces are imported from that sibling, after CohomologyComparisonsPartII.

   **Witness:** The ten identifiers are absent. TauCetiRoadmap/ColemanIntegrationPartII/README.md:952 defines `ColemanWideOpen.tripleIndex`, with global auxiliary primitives; line 1184 states `Curve.integrationRealization_descent`. It has no CohomologyComparisonsPartII dependency and precedes it in merge-order/ORDER.txt.

   **Exact repair text:** Cite ColemanIntegrationPartII by its existing target and section for each integration, index, trace and descent input. Delete the asserted CohomologyComparisonsPartII → ColemanIntegrationPartII edge. Declare any extra regulator comparison in this roadmap, or a precise matched supplier gap, rather than asserting the absent identifiers are supplied.

   In particular use “ColemanIntegrationPartII §4.4 `Semistable.globalDoublePairing_eq_pointSum`, §6.1 `ColemanWideOpen.tripleIndex`, §7.3 `SingleIntegral.coefficientTrace`, §7.6 `Curve.integrationRealization_descent` and `wideOpenIndex_galoisDescent`.” Retain the wide-open, global-primitive and coefficient-descent hypotheses of its triple-index theorem.

3. **F03** (P1) Empty boundary breaks the global dagger-algebra formula

   **Location:** packages/PadicHodgeRegulators/README.md:1212; Check at 1224, “For D = ∅ (Y = X)”.

   **Claim:** The same global differential quotient computes H¹ of every allowed Y, including a proper curve.

   **Witness:** Take a good-reduction elliptic curve X and D=∅. Global analytic functions are K, so the algebraic de Rham H¹ of A†(X)=K is zero, whereas H¹_dR(X/K) has dimension two.

   **Exact repair text:** “Define the splitting on H¹_rig(Y_k/K), with its de Rham comparison, for every finite étale D, including D=∅. If D is nonempty, Y is affine and this cohomology is computed by Ω¹(A†(Y))/dA†(Y). If D=∅, use derived global de Rham cohomology and set p_D=id.” Retain an elliptic-curve empty-boundary Check, not only ℙ¹.

4. **F04** (P2) The full semistable formula stops at a restricted graph

   **Location:** packages/PadicHodgeRegulators/README.md:1336 and 1360, “multiedge/self-node generalization is not asserted here”.

   **Claim:** The continuous/discrete regulator and full second-kind symbol formula exclude multiple intersections, self-nodes and nonsplit models; the arbitrary-reduction theorem at 1288 only restores holomorphic pairings.

   **Witness:** A split Tate curve of type I₁ has a self-node; type I₂ has two edges between the same components. Both are semistable. The holomorphic theorem does not supply the excluded second-kind pairing or discrete-coordinate theorem.

   **Exact repair text:** “The continuous/discrete coordinates and monodromy-kernel second-kind formula hold for every smooth proper semistable curve. The graph retains individual geometric node identities, including loops and parallel edges; nonsplit terms use residue-field trace and descent. The simple split graph is a Check. Extend the formula to arbitrary reduction by the specified finite-extension comparison.” Import the corresponding graph/integration carriers from ColemanIntegrationPartII §§1.1,3.0a,7.5–7.6 and own the regulator comparison here.

5. **F05** (P1) Three different filtered de Rham theories are identified without a comparison

   **Location:** packages/PadicHodgeRegulators/README.md:229–247, especially “H¹(F¹RΓ_dR(X_K))=K[x]dx”.

   **Claim:** The cone using algebraic stupid truncation on X_K is simultaneously Huber–Kings' dagger syntomic theory and Besser's rigid syntomic theory, and supports the later Chern comparisons.

   **Witness:** Besser2000 line 636 defines the filtration on a proper normal-crossings compactification; for A¹ with (ℙ¹,∞), F¹ has zero H¹. HK2011 line 558 instead uses a dagger tube filtration. Neither gives the displayed K[x]dx filtration as asserted.

   **Exact repair text:** “Use Besser's compactification-filtered algebraic de Rham complex in the rigid syntomic theory (Besser2000 Definition 5.1). Use a separately named dagger syntomic theory for the Huber–Kings construction (HK2011 Definition 2.2.1). State each comparison with its actual properness/affineness hypotheses. For A¹, the compactification filtration has H¹(F¹)=0; the stupid algebraic truncation has K[x]dx and is a different complex.” Repoint §§4.1–4.2 and 7.1–7.6 to the required specific theory.

6. **F06** (P1) The character-specialization Check denies its own module structure

   **Location:** packages/PadicHodgeRegulators/README.md:643, “charSpecialization χ is not Λ-linear into a Λ-module”; also 144.

   **Claim:** Character specialization cannot be Λ-linear; χ(σ₋₁)=−1 is offered as the obstruction. The twist Check asserts a strict inequality for every x.

   **Witness:** Give the target the Λ-action through χ. Then 629(a)/632 is exactly Λ-linearity, with σ₋₁ acting by −1. In the twist Check take x=0: both asserted unequal expressions are zero.

   **Exact repair text:** “Character specialization is Λ-linear when the target action is induced by η:Λ→𝒪_E; it is η-semilinear relative to the scalar-only description. A nontrivial twist is not linear for the unchanged action on a nonzero torsion-free class. For x=0 the two scalar expressions coincide.” Replace the strict-inequality Check with a nonzero class and explicitly identified source and target actions.

7. **F07** (P2) Rational motivic classes have no specified ℚₚ-scalar action

   **Location:** packages/PadicHodgeRegulators/README.md:1338, “linear over Q_p on the rationalized motivic domain”.

   **Claim:** The continuous regulator is ℚₚ-linear on the rationalized K₂/motivic domain used in §7.10.

   **Witness:** The domain throughout Layer 7 is K₂^(2)⊗ℚ (1230,1232), with rational symbol coefficients. No ℚₚ-module structure on that domain is supplied. An arbitrary a∈ℚₚ cannot act on those rational tensors.

   **Exact repair text:** “The continuous and discrete regulators on the rational motivic domain are ℚ-linear. Extend them ℚₚ-linearly to that domain tensor_ℚ ℚₚ; this is the ℚₚ-linear regulator.” Specify both sources, and apply the coordinate isomorphism to the latter extension when claiming ℚₚ-linearity.

8. **F08** (P2) The exact coordinate-image headline is easy but absent from Lean

   **Location:** packages/PadicHodgeRegulators/README.md:1825–1829; packages/PadicHodgeRegulators/Suggested.lean:259–270.

   **Claim:** §9.11 is the exact image theorem underpinning the Coleman-coordinate outputs, but no corresponding theorem appears in Suggested.lean.

   **Witness:** `evaluationConstraints` already exists at Lean 222; its coordinate projection, the finite product g_k, divisibility and existential image membership all use existing carriers. The file already states the harder basis/determinant theorem on this same context.

   **Exact repair text:** Add the headline `evaluationConstraints_coordinate_image` in the Constraints section: under §9.1's evaluation hypotheses, for k:Fin d and r:R, “there exists F in evaluationConstraints J ev V with F k=r iff g_k divides r”, where g_k is the finite product over j∈J whose V_j has identically zero k-coordinate. Give g_k a real finite-product body if a named definition is useful. Register the exact Lean name under §9.11. Do not replace the actual constraint module by arbitrary input submodules assumed to have the desired image.

9. **F09** (P3) Statable Checks lack proved examples on the retained definitions

   **Location:** packages/PadicHodgeRegulators/README.md:926–950, 1386–1458, 1662, 1705–1709, 1917–1922; packages/PadicHodgeRegulators/Suggested.lean:39–293.

   **Claim:** Every statable README Check has a proved Lean example, with at most two examples per kept definition.

   **Witness:** No example tests the diagonal constraint at 1709, shear action (7,11)↦(29,32) at 1920, Gamma at zero, Φ=−1 inverse, Φ=0 Euler inverse, constant jet, or the p=5 values at 3 and 4.

   **Exact repair text:** Combine related tests into the existing two examples per definition: include all three admissible F₅ values and n=0 in finitePolylog/residue examples; include both regular and singular inverse candidates; include Gamma at 0 with a negative value; include the constant jet; include diagonal membership/nonmembership; and include the shear's row action and identity specialization alongside its nonunit determinant. Fold `residueDilogValue_five_values`'s admitted finite calculation into one of the two proved residue examples and remove that admitted theorem; do not add a third example. Add the statable row-covariance/sign Checks to examples of the relevant kept definitions, keeping their two-example limit.

10. **F10** (P3) Ten Lean names have no exact README counterpart

   **Location:** packages/PadicHodgeRegulators/Suggested.lean:57,102,140,165,190,200,222,259,274,285.

   **Claim:** Every retained Lean declaration is named in the definitive README.

   **Witness:** Whole-word search finds none of `finitePolylog_two_double_zero`, `residueDilogValue_spans`, `quadraticFrobeniusInverse`, `quadraticEulerInverse`, `quadraticEulerInverse_product`, `gammaLeadingFactor`, `evaluationConstraints`, `constraint_basis_and_determinant`, `coleman_row_covariance`, `shearMatrix`. Similar prefixes are different names.

   **Exact repair text:** Register those exact names in §§5.1,5.5,8.1,8.3,8.5,8.6,9.1,9.7–9.8,9.17,9.18 respectively. Rename `finitePolylog_two_rootMultiplicity_one` to `finitePolylog_two_double_zero`, or rename Lean consistently. Explicitly distinguish the finite-field span theorem from the integral p-adic span theorem it supports.

11. **F11** (P3) The source manifest is missing and three works have duplicate keys

   **Location:** packages/PadicHodgeRegulators/README.md:2195–2230; packages/PadicHodgeRegulators/sources.toml (absent).

   **Claim:** The package supplies its sources and version-specific locators as required by the source contract.

   **Witness:** `git diff --stat origin/main...HEAD` lists README, Suggested.lean, metadata.toml and review.json only. Berger2003/Berger2003DM, LLZWach/LLZWach2010, and LLZ2011/LLZ2010v2 each name the same work twice.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one lifetime key per work, all cited locators and target sections, and the sources-service provenance. Retain the first existing key when merging each duplicate pair; record preprint and published URLs together with a `version_note` mapping their numbering. Replace duplicate bibliography aliases throughout. Record the supplied FO text as a different version of FO, not a second work.

12. **F12** (P3) Generic reconstruction is already a pinned inverse law

   **Location:** packages/PadicHodgeRegulators/README.md:1851–1859, “e inverse applied to Col_e(z) equals f(z)”.

   **Claim:** Generic reconstruction from an arbitrary coordinate equivalence is a new theorem target/layer milestone.

   **Witness:** With Col_e=e∘f, this is `LinearEquiv.symm_apply_apply` at Mathlib/Algebra/Module/Equiv/Defs.lean:358 applied to f(z). No regulator property enters the statement.

   **Exact repair text:** “Generic reconstruction is the pinned `LinearEquiv.symm_apply_apply` (Mathlib/Algebra/Module/Equiv/Defs.lean:358). The new arithmetic comparison identifies the actual Wach coordinate equivalence and (1−φ) map, as in §9.16.” Remove §9.13 as a separate development target and import the generic law in the supplier contract.

13. **F13** (P2) Largest-weight formulas have no rank-zero case

   **Location:** packages/PadicHodgeRegulators/README.md:1529,1625,1972,1982,1992,2008.

   **Claim:** The intrinsic/NC range permits V=0, but subsequent formulas use r_d or s_d as though a last weight exists.

   **Witness:** V=0 is crystalline, has no trivial quotient or Frobenius eigenvalues, and satisfies NC vacuously. Its weight tuple is empty; neither r_d nor s_d denotes an entry. The determinant and image should nevertheless be defined.

   **Exact repair text:** “For the empty weight tuple put r_max=s_max=0. Else use its largest entry. Replace r_d and s_d in upper bounds by these maxima. In rank zero the Iwasawa source, regulator target and constraint module are zero, all determinant products are 1, and all elementary-divisor lists are empty.” Add the zero-representation Check without excluding rank zero from the general library.

14. **F14** (P2) The constraint signature imposes hypotheses on unused indices

   **Location:** packages/PadicHodgeRegulators/Suggested.lean:262–264; packages/PadicHodgeRegulators/README.md:1697.

   **Claim:** The Lean basis/determinant theorem has the README's generality for a finite set J of constraints.

   **Witness:** Let R=ℚ[X], m=2, J={0}, t=X, both x_j=0 and both ev_j=evaluation at zero. The one imposed condition satisfies the README assumptions, but Lean's global `Function.Injective x` rejects these redundant unused data.

   **Exact repair text:** Replace `hx` by `Set.InjOn x (↑J : Set (Fin m))`; replace `hev`, `hq`, `hker` by hypotheses quantified over j∈J only. Alternatively index all data by the subtype of J. Keep the empty-J case free of unused evaluation assumptions.

15. **F15** (P3) Fontaine–Ouyang locators do not identify the supplied version

   **Location:** packages/PadicHodgeRegulators/README.md:86 and 2207, “Theorems 6.25(3), 6.26(3) and Remark 6.27”.

   **Claim:** The cited FO version certifies the three fundamental-sequence locators.

   **Witness:** In the supplied text, FO line 5913 is Remark 6.25, line 5918 Proposition 6.26, and line 5941 Definition 6.27. The fundamental sequences are instead at FO lines 6878, 6926 and 6947.

   **Exact repair text:** “FO, the author-hosted 303-page version: Theorem 7.26(3), Theorem 7.28(4), Remark 7.29, printed pp.169–171.” Identify this version and its institutional URL in the bibliography and the single FO manifest entry. Keep the 2006 numbering only if that exact version is furnished and checked. The mathematical sequences themselves are supported by the supplied version.

16. **F16** (P3) Lean retains a forbidden catalogue and undocumented declarations

   **Location:** packages/PadicHodgeRegulators/Suggested.lean:20–21,39–293,300–317.

   **Claim:** Suggested.lean follows the required declaration-only shape and documents every declaration.

   **Witness:** Lines 300–317 list dozens of README-only names in a block comment. The two local instances and sixteen examples have no declaration docstrings; ordinary comments before some examples are not docstrings.

   **Exact repair text:** Delete the final name catalogue; the module docstring already says the file is not exhaustive. Add short mathematical docstrings to the two prime instances and to each retained example, identifying the definition and positive or negative control it tests.

## Verified sound

Read every line of packages/PadicHodgeRegulators/README.md (2,230) and packages/PadicHodgeRegulators/Suggested.lean (319), the content repository rules, the merge order and the package diff. The running inventories contain 266 named API bullets, all 186 bold occurrences (including labels and bibliography keys), 114 numbered target subsections and 18 supplier subsections. All 352 Check bullets were read and tested mathematically at the stated level; this is not a count of executed Lean tests. The declaration audit covers 20 named declarations (8 definitions and 12 theorems), 16 proved examples and 2 proved local instances: 38 items total. Eleven theorem bodies are admitted; no data body or example is admitted.

Checked all 31 named imports in the two sibling supplier tables against their specified current heads: 21 classical/relative and 10 integration/index names. Searched the five other provided sibling heads, active/completed main roadmaps and both pinned libraries by object. The available local-field, completed-number-field, matrix and linear-equivalence inputs were distinguished from new regulator work. No roadmap was moved in the merge order, and no package source was edited.

Verified 92 source locators or explicitly identified replacement locators, itemized below. The count includes distinct preprint/journal-version checks; it is not a claim that every repeated bibliography occurrence was independently certified.

The Lean file uses exactly `import Mathlib`, the required namespace and real-bodied definitions. No `lemma`, `set_option`, `True` placeholder or sorry-defined data occurs. The quadratic inverse and Euler-product identities hold under their explicit denominator hypotheses, including empty matrices and characteristic two. The finite-field span argument retains p>3 and positive extension degree; the source's excluded-zero argument is repaired by the separate prime-field case and difference-span argument. The F₅ residue values are 1,4,0. The jet values 35/12, −35/3 and −70/3, Gamma values at −2 and −3, and row/shear arithmetic agree with their formulas. These calculations do not establish the missing cohomological supplier contracts.

The integral comparison keeps the p=3 weight-two torsion exception. Rational and integral Coleman images are not conflated; determinant nonvanishing is not substituted for being a unit. The refinement hypothesis, conductor restriction, admitted de Rham character domain, and negative-weight exponential-inverse restriction are retained. The cubic example corrects the source's root exponent. No forced headline through a sorry-defined carrier was found; R08 records the missing easy headline.

Dependency checker output (exit status 1):

```text
NOT IN ORDER: PadicHodgeRegulators (insert it after its last supplier)
depcheck: 8 roadmaps, 59 edges, 1 problem(s)
```

There is no `UPWARD` or `CYCLE` line for this roadmap. Absence from the order is not reported as a defect. The eight-roadmap graph is too small to certify every prose dependency. Manual comparison confirms both supplied principal siblings precede the package's intended position; the claimed dependency between those siblings is wrong (R02). No other upward edge was established. The dependencies on unavailable supplier versions remain unverified below.

### Source-locator audit

| Source | Count | Locators checked | Verification witness | Result |
|---|---:|---|---|---|
| GSWZ2024 | 7 | Lemma3.1; Propositions3.2,3.3; equations177,178; Theorem9; Example4.3 | GSWZ2024 line 1975; line 1995; line 1998; line 2015; line 2694 | Finite residue argument and corrected root exponent checked |
| BdJ2003 | 4 | Theorem1.6; Theorem1.12; Remark1.13; Conjecture1.14 | BdJ2003 line 162; line 231; line 258 | Special-unit and root domains distinguished from conjectural extension |
| HK2011 | 5 | Definition2.2.1; Example2.2.4; Theorem1.3.2; Proposition2.3.4; Definition2.3.3 | HK2011 line 543; line 573; line 329; line 656 | Point comparison checked; filtered theory mismatch R05 |
| Tamme2014 | 2 | Corollaries5.19,5.21 | Tamme2014 line 1076; line 1102 | Proper comparison and Chern-character factorial checked |
| NN2016 | 3 | Remark2.14; Propositions4.13,5.7 | NN2016 line 696; line 2790; line 3027 | Boundary sign and arithmetic edge checked |
| CN2017 | 2 | Corollaries3.16,5.11 | CN2017 line 1704; line 2800 | Isomorphism versus injectivity range checked |
| EN2016 | 2 | Theorems2.2,2.3 | EN2016 line 318; line 330 | Divided exact and undivided bounded comparisons distinguished |
| Besser2000 | 2 | Definition5.1; Proposition9.11 | Besser2000 line 636; line 1178 | Compactification filtration contradicts the affine-line Check |
| BK1990 | 2 | Corollary3.8.4; equation3.8.5 | BK1990 line 716; line 744 | Dimension and fixed-term formulas checked |
| BNQD2002 | 3 | Lemma1.3.2; Lemma2.2.2; section2.3.2 trace diagram | BNQD2002 line 315; line 416; line 601 | Index plus explicit lattice argument checked |
| CC99 | 2 | TheoremII.1.3; PropositionII.1.2 | CC99 line 516 | Integral Iwasawa comparison exists in the paper |
| Limites2004 | 1 | PropositionIII.4.2 | Limites2004 line 742 | Lattice inclusion-preserving equivalence checked |
| Berger2003DM | 3 | DefinitionII.12; TheoremII.16; TheoremA.3 | Berger2003DM line 853; line 943; line 1019 | Top lift ambiguity, interpolation and Wach range checked |
| LZ2014 | 7 | Proposition4.8; B.1–B.5; TheoremB.6 | LZ2014 line 747; line 1639; line 1667; line 1705; line 1724; line 1770 | Growth, Gamma, Gauss and ordered-pairing convention checked |
| Rubin2000 | 2 | III section5.8; Proposition5.14 | Rubin2000 line 2357; line 2392 | Ordinary/multiplicative maps and augmentation containment checked |
| Benois2014 | 1 | Proposition2.8.2(i) | Benois2014 line 1731 | Finite-condition dimension formula checked |
| AM18 | 2 | Proposition6.4; Theorem9.1 | AM18 line 1757; line 2280 | Relative sign comparison and holomorphic pairing checked |
| AM2022 | 4 | Assumption2.20; Theorems2.23,3.7,4.5 | AM2022 line 627; line 758; line 1200; line 1625 | Coherence, truncated vanishing and negative sign checked |
| Asakura2023 | 2 | Theorem4.9; Corollary4.10 | Asakura2023 line 2359; line 2373 | Point-adapted Frobenius and specialized-family scope checked |
| Ara2003 | 3 | Lemmas3.3,3.6,3.7 | Ara2003 line 343; line 365; line 369 | Cup product, degree and trace directions checked |
| BZ2017 | 2 | Theorem1.1; Corollary1.2 | BZ2017 line 88; line 108 | Harmonic primitive and subdivision formulas checked |
| Besser2025 | 3 | Proposition3.5; Theorems3.8,3.10 | Besser2025 line 345; line 376; line 413 | Fixed kernel and quadratic branch correction checked rather than copying the weight-space assertion |
| WeibelChern | 1 | Proposition5.1 | WeibelChern line 1046 | Factorial obstruction to ordinary Chern isomorphisms checked |
| LLZ2011 | 5 | Assumption1.3; section1C6; Corollary1.12; Theorems2.10,4.12 | LLZ2011 line 113; line 480; line 521; line 125; line 1272 | Refinement assumption, trivial nebentypus and determinant argument checked |
| LLZWach2010 | 2 | Propositions4.6,4.11 | LLZWach2010 line 1408; line 1541 | Printed restrictions distinguished from the package's separate integral contraction proof |
| LLZ2010v2 | 1 | Remark5.12 | LLZ2010v2 line 1205 | Basis-change convention checked |
| RJ2018 | 5 | TheoremI.15; LemmaI.17; TheoremI.27; PropositionI.28; CorollaryI.29 | RJ2018 line 1280; line 1300; line 1635; line 1655; line 1665 | Admitted domain, conductor, inverse range and crystalline extension checked |
| FO | 3 | Theorem7.26(3); Theorem7.28(4); Remark7.29 | FO line 6878; line 6926; line 6947 | Sequences verified in supplied version; cited old-version numbering unresolved, R15 |
| FontaineBPR1994 | 1 | section2.1 | FontaineBPR1994 line 125; line 143 | All-weight rational sequence and positive-weight boundary |
| HK2 | 2 | AppendixA LemmaA.1; CorollaryA.2 | HK2 line 1829; line 1836 | Integral units and valuation quotient |
| AC20 | 1 | Footnote4 | AC20 line 1779 | Canonical versus normalized regulator Euler factor |
| BdJ2012 | 2 | Remark1.10; section1 canonical projection | BdJ2012 line 181; line 195 | Symbol pairing and open projection; proper empty-boundary extension needs R03 |
| BR2019 | 2 | section3 equations3.1–3.5; Theorem4.7 proof | BR2019 line 448; line 888; line 912 | Restricted graph source and global-triple minus annular correction |
| Berger2003 | 2 | Introduction; TheoremII.2 proof | Berger2003 line 44; line 49; line 347 | Formal-group exponential and trace compatibility |
| LLZWach | 1 | section2.2 | LLZWach line 394; line 412; line 425 | Wach carriers, coefficient extension and lattice correspondence |

### Lean declarations, contexts and boundary instances

Line numbers in this table refer to packages/PadicHodgeRegulators/Suggested.lean. “Proof inspected” means source inspection and mathematical verification, not elaboration. All fields/rings and finite-index instances used below are in the declarations' actual types; no dropped standing instance was found.

| Line | Declaration | Section, variables and instances | Instances tested | Result/change |
|---:|---|---|---|---|
| 20 | local instance prime5 | Top level; Fact (Nat.Prime 5) | 5 prime | Real proof; no finding |
| 21 | local instance prime3 | Top level; Fact (Nat.Prime 3) | 3 prime | Real proof; no finding |
| 36 | finitePolylog | L5; p:Nat, Fact p.Prime, n:Int; ZMod p polynomial | p=2,3,5; n=0,-1,2 | Real body; README mirrors R09 |
| 39 | example finitePolylog at 2 | L5; closed ZMod5 | Value1 | Proof inspected; no build |
| 49 | example finitePolylog at 1 | L5; closed ZMod3 | Value2 | Proof inspected; no build |
| 57 | finitePolylog_two_double_zero | L5; p:Nat, Fact prime, hp:3<p | p3 excluded; p5 double root | True; R10 name |
| 62 | residueDilogValue | L5; p prime; F:Type*, Field F, Algebra (ZMod p) F; x:F | Total inverse at 0 and1; F5 admissible values | Real body; arithmetic domain external; R09 |
| 66 | example excluded one | L5; same field/algebra context | Denominator0 gives0 | Proof inspected; only excluded input |
| 70 | example excluded zero | L5; same field/algebra context | All exponents positive, numerator0 | Proof inspected; only excluded input |
| 82 | residueDilogValue_cancel_double_zero | L5; explicit hp, Field/Algebra and x!=1 | p5; denominator nonzero | True; monic division and power law |
| 89 | residueDilogValue_map | L5; F,F':Type*, fields, Fp algebras, algebra hom | Identity; extension; x0,1 | Proved by functorial evaluation and inverse; no finding |
| 95 | residueDilogValue_five_values | L5; closed ZMod5 | 2,3,4 -> 1,4,0 | True; admitted values do not replace proved examples |
| 102 | residueDilogValue_spans | L5; p,s:Nat, Fact prime, hp:3<p, hs:0<s; GaloisField p s | p5,s1; s>1 fibre bound; p3 excluded | Both spans valid; R10 |
| 120 | colemanLogSecondJet | L8; f:Q[X], explicit f(0)!=0 | f6,1+X,1 | Real body; derivative jet formula; R09 |
| 125 | example cyclotomic f6 | L8; closed rational polynomial; exists h0 | 5/2,35/12,-35/3,-70/3 | Arithmetic and proof inspected |
| 136 | example 1+X jet | L8; closed rational polynomial, h0=1!=0 | Jet0 | Arithmetic and proof inspected |
| 140 | quadraticFrobeniusInverse | L8; E,iota:Type*, Field E, Fintype/DecidableEq iota | Empty matrix; Phi2; b0 | Real body; only candidate without relation; R10 |
| 144 | example scalar inverse | L8; Q,Fin1,a=-5,b=6,Phi2 | 1/2 | Arithmetic and proof inspected |
| 152 | example singular inverse | L8; Q,Fin1,a=b=0,Phi0 | Candidate0 | Arithmetic and proof inspected |
| 157 | quadraticFrobeniusInverse_spec | L8; same explicit contexts; quadratic identity; b!=0 | Empty matrix; char2; rank1 | Both inverse identities true |
| 165 | quadraticEulerInverse | L8; E,iota:Type*, Field E, finite decidable indices | Phi0,1,2; denominator0 | Real body; R09,R10 |
| 169 | example scalar Euler inverse | L8; Q,Fin1,a=-5,b=6,Phi2 | -1 | Arithmetic and proof inspected |
| 177 | example singular Euler inverse | L8; Q,Fin1,a=-3,b=2,Phi1 | Candidate0 | Arithmetic and proof inspected |
| 182 | quadraticEulerInverse_spec | L8; quadratic identity; 1+a+b!=0; no b!=0 needed | Phi0; rank0; char2 | Both inverse identities true |
| 190 | quadraticEulerInverse_product | L8; explicit field/finite contexts; relation; p,b,1+a+b nonzero | Scalar Phi2; formal quadratic reduction | Numerator checked; R10 |
| 200 | gammaLeadingFactor | L8; j:Int; value Q | j0,-1,-2,-3 | Real body, factorials nonzero; R09,R10 |
| 204 | example Gamma(-1) residue | L8; j=-2 | -1 | Arithmetic and proof inspected |
| 208 | example Gamma(-2) residue | L8; j=-3 | 1/2 | Arithmetic and proof inspected |
| 213 | gammaLeadingFactor_ne_zero | L8; j:Int | Positive factorial; negative signed reciprocal | True for all integer j |
| 222 | evaluationConstraints | L9 Constraints section; E,R:Type*, Field E, CommRing R, Algebra E R; d,m:Nat | Empty J,d0; zero/full/diagonal V | Real submodule body; no domain assumption needed; R09,R10 |
| 242 | example empty constraints | L9 section contexts; ev indexed Fin0, V indexed Fin0 | Every row satisfies vacuous conditions | Proof inspected; zero-dimensional case included |
| 248 | example at zero | L9; Q[X],Fin1,ev0,V bottom | 1 excluded,X included | Proof inspected |
| 259 | constraint_basis_and_determinant | L9 section contexts plus explicit IsDomain R,J,t,x,ev,V,hx,hev,hq,hker | J empty; d0; one point; complementary lines; duplicate unused index | True as typed; instance contexts occur in type; R10,R14 |
| 274 | coleman_row_covariance | L9 outside section; R,A:Type*, CommRing both; ring hom,Fin d; unit matrices U,B | d0; identity; nonsymmetric shear and scalar map | True by associativity and inverse; R10 |
| 285 | shearMatrix | L9; R:Type*, CommRing R,e1,e2:R | Zero ring; identity; nonunit determinant | Real body; R09,R10 |
| 288 | example shear determinant -5 | L9; Z,e1=2,e2=3 | 1-6=-5 | Arithmetic and proof inspected |
| 292 | example nonunit determinant5 | L9; Z,e1=1,e2=-4 | 5 not an integer unit | Arithmetic and proof inspected |
| 296 | shearMatrix_unit | L9; R:Type*,CommRing R; IsUnit(1-e1*e2) | Zero ring; Z; field; DVR | True via native matrix determinant criterion |

### Adversarial mathematics by target family

Every numbered subsection is listed, including families whose arithmetic carriers are not yet at the pins. The running per-name inventory maps each of the 266 API bullets to its section and these tests. “None” means no additional mathematical defect was established by the listed tests; it does not certify an unavailable supplier. The 18 supplier subsections were additionally tested for point/empty products, weights 0 and p−2/p−1, Tate-root torsion, identity and inverse twists, ramified versus unramified coefficients, divided versus undivided period arrows, and affine versus proper filtration. R01, R02, R05, R06 and R15 record the failures in that supplier block.

| Statement (§) | Instances tried | Result | Change or limitation |
|---|---|---|---|
| 0.1 | Tate r=0,1,2; Frobenius p^-r; filtration jumps | Consistent sign/weight dictionary | None |
| 1.1 | V=0,Qp,Qp(1),Qp(-1); lattice torsion | Rational and propagated finite conditions distinguished | Supplier unavailable |
| 1.2 | V=0,Qp,Qp(1),Qp(2); fixed crystalline line | Kernel and positive cocycle boundary agree | Supplier unavailable |
| 1.3 | Zero quotient; fixed line spanning quotient; tame root | Quotient logarithm avoids an invalid inverse | Supplier unavailable |
| 1.4 | V=Qp,Qp(1); swapping degree-one versus degree-zero pairings | Kernel g and adjunction signs consistent | Supplier unavailable |
| 1.5 | V=0,Qp,Qp(1),Qp(2); Euler characteristic | Dimension formulas agree | None |
| 1.6 | Dual pair Qp(2),Qp(-1); unramified finite module | Annihilator hypotheses retained | Supplier unavailable |
| 1.7 | Identity extension; unramified degree f; twist r=1 | Restriction/trace and absence of finite-level twist agree | None |
| 1.8 | r=-1,0,1,2; uniformizer versus units | All four Tate ranges agree | None |
| 1.9 | Torsion point; zero abelian variety; quotient differential scalar | Checks and differential scalar consistent on stated good-reduction domain | Supplier unavailable |
| 1.10 | p=3,r=2; p=5,r=2; plus boundary; trace lattice | Torsion exception and p^r lattice consistent | FontaineBPR1994 §2.1 and BNQD2002 §2.3.2 checked |
| 1.11 | Empty algebra; one factor; two independent factors | Direct sums avoid diagonal identification | None |
| 2.1 | Generator replaced by inverse or unit power; zero class | Normalized cocycle generator compensation consistent | Supplier unavailable |
| 2.2 | Root system changed by unit; j=0,1,-1 | Representation and period basis factors cancel | Supplier unavailable |
| 2.3 | Trivial character; nontrivial cyclotomic character; zero class | Blanket nonlinearity needs nonzero module | R06 |
| 2.4 | f6 jet; unit Tate tower; ordered exponential pairing | Jet arithmetic and depletion signs consistent | R09; comparison suppliers unavailable |
| 3.1 | 0,1,infinity; special unit; product factors | Excluded inputs and totalized auxiliary functions distinguished | Supplier unavailable |
| 3.2 | Identity map; Frobenius; product permutation | Functorial squares have matching domains | Supplier unavailable |
| 3.3 | One place versus all places; ramified and unramified completions | No rational diagonal is substituted for all local factors | Supplier unavailable |
| 3.4 | Root of unity; higher-weight factorial; Gros depletion | Chern and symbol normalizations kept separate | None |
| 3.5 | Tame root; p-power root; two local factors; unit rank zero | Unit-log kernel excludes valuation direction | Main deep-unit supplier checked |
| 3.6 | Identity norm; finite extension; unit root | Log norm equals trace log on stated units | None |
| 4.1 | i=1; j=0; P2 Chern-class cross term | Additivity confined to positive K degree | R01,R05 |
| 4.2 | n=1 versus n=2; Chern character conversion | Exponential range and factorial convention consistent | R01 |
| 4.3 | Tame root; nonspecial symbol [p]; cubic global units | Special-unit domain avoids conjectural all-symbol equality | None |
| 4.4 | n=2,3; roots; general field Beilinson-Soule hypothesis | Higher-weight factorial and conjectural prerequisite retained | None |
| 4.5 | n=2,3; Q5 tame root; depletion unit factor | Gros/Besser values differ as stated | None |
| 4.6 | r=0,2; i=r; divided/undivided boundary | Rational p^-r rescaling is necessary | R01 |
| 5.1 | p=2,3,5; n=0 and negative; x=0,1,2,3,4 | Finite polynomial identities consistent | R09,R10 |
| 5.2 | x=0,1 excluded; F5 admissible values; embeddings | Total expression does not certify excluded arithmetic values | R09 |
| 5.3 | p=3; p=2 root -1; inverse arithmetic Frobenius | Odd-prime root domain handles the source endpoint | None |
| 5.4 | Special unit; z=p; z=1+p | Both unit conditions are used | None |
| 5.5 | s=1 versus s>1; p=3; product needing differences | Fibre count and difference span agree | R10 |
| 5.6 | Root 1; all components nontrivial; empty product | Admissible root classes and Tate obstruction retained | Supplier unavailable |
| 5.7 | Identity embedding; Frobenius; finite product | Completed map and normalization stated separately | R01 |
| 5.8 | p=5; p=3 torsion; ramified field outside range; zero product | Local p>3 unramified theorem consistent | R01 |
| 5.9 | One factor; two factors; zero product | Spanning plus isomorphism gives completed generation | None |
| 6.1 | Totally real source; p=2,3; ramified p | General rational map separate from integral unramified bound | Supplier unavailable |
| 6.2 | Special-unit presentation; inadmissible symbol; torsion | No all-symbol conjecture asserted | None |
| 6.3 | Identity extension; restriction then norm; finite product | Degree factors and transfer direction consistent | Supplier unavailable |
| 6.4 | Arithmetic Frobenius; semilocal product | Frobenius is local on completed classes | None |
| 6.5 | Torsion; N=p; imaginary quadratic rank one | Denominator bound is an inclusion, not attained equality | None |
| 6.6 | Delta=138,p=5; Gros rescaling; local root expansion | No global injectivity inferred | Supplier unavailable |
| 6.7 | r2=0; zero map; irrational alpha giving Q/Qp rank mismatch | Weak and strong injectivity correctly separated | None |
| 6.8 | Cubic relation; factor degrees 2+1; root exponent 2 | The source exponent misprint is corrected | None |
| 7.1 | P1; f=2; semilinear p-Frobenius; singular weight-one operator | Norm operator and transported K-scalars retained | R01 |
| 7.2 | D empty on elliptic curve; nonempty boundary; P1 | Global dagger algebra loses proper H1 | R03 |
| 7.3 | Steinberg symbol; constants; tame-trivial presentation | Proper/open regulator domains distinguished | R01 |
| 7.4 | Constant symbol; holomorphic test form; closed-point trace | Holomorphic integral formula has correct order | R02 |
| 7.5 | P1; ordinary eigenspace; singular Euler value excluded | Normalized comparison requires full period adapters | R01 |
| 7.6 | Identity map; finite degree; trace pairing | Pullback/pushforward pairings agree | R01,R02 |
| 7.7 | Tate I1; I2; nonsplit nodes | Available general supplier exceeds stated local target | R01,R02,R04 |
| 7.8 | Steinberg; zero class; nonzero total tame symbol | Relative sign and tame-kernel restriction retained | R01 |
| 7.9 | Frobenius-incompatible point; finite versus infinite residue field | Evaluation hypotheses correctly explicit | R01 |
| 7.10 | Zero cocycle; coboundary; eigenvalue p^-1; N^2=0,N rho nonzero | Coordinates descend; quadratic branch term needed | R04,R07 |
| 7.11 | Orientation reversal; both-orientations half sum; ker N test form | Global triple minus graph correction retained | R02,R04 |
| 8.1 | Phi=0,2,-1; b=0; empty matrix | Inverse candidate total; no inverse asserted at b=0 | R09 |
| 8.2 | Rank zero/one; characteristic 2; quadratic relation | Both inverse identities follow from hb | None |
| 8.3 | Phi=0,1,2; polynomial value at 1 zero | Euler inverse candidate correctly totalized | R09 |
| 8.4 | Rank zero/one; char 2; singular excluded denominator | Both inverse identities correct | None |
| 8.5 | Scalar Phi=2,a=-5,b=6; nonzero p,b,s | Expanded numerator verified algebraically | R10 |
| 8.6 | j=0,1,-1,-2,-3 | Gamma signs and factorial nonvanishing correct | R09 |
| 8.7 | k=0; removable x_i; chi^3 for lambda2 | Removable factor not zero at its own point | None |
| 8.8 | Zero class; phi-fixed class; h(x)=2x toy model | Inverse comparison direction correct | Supplier unavailable |
| 8.9 | Phi=1 and Phi=2 over Q5; top derivative | Obstruction avoids an arbitrary inverse to 1-phi | Supplier unavailable |
| 8.10 | Lift differences t^k v,k<h and k=h | Top ambiguity requires quotient/invariant hypothesis | None |
| 8.11 | h=1 versus h+1; V=0 | Largest-weight notation missing at rank zero | R13 |
| 8.12 | Negative weight; enough twist; choice of twist | Meromorphic extension retains logarithmic factors | Supplier unavailable |
| 8.13 | Primitive conductor p^n; Gamma at negative j | Gauss and p powers agree with LZ B.5 | None |
| 8.14 | Trivial finite character; invertible and singular Euler maps | Unramified cleared formula agrees with LZ B.5 | None |
| 8.15 | Euler eigenvalue 1; Euler eigenvalue p^-1 | No forbidden inverse is used | None |
| 8.16 | Rank-one slope quotient; zero projection | Growth uses the specified quotient slope | None |
| 8.17 | T versus pT; finite coefficient extension | No integral equality inferred from rational equality | Supplier unavailable |
| 8.18 | Ordered cup pairing; Tate jet; Gamma signs | Positive reciprocity is justified by the chosen sign transport | Supplier unavailable |
| 8.19 | Weights (0,2); V=0 | Analytic factors differ from bounded polynomial factors | R13 |
| 8.20 | Zero projection; scaling v; scalar covariance | Projection depends on supplied functional | None |
| 8.21 | f6; 1+X; constant 1 | 35/12, -35/3, -70/3 arithmetic verified | R09 |
| 8.22 | Ordinary alpha; split alpha=1; nonsplit alpha=-1 | Injectivity and augmentation claims kept distinct | None |
| 9.1 | J empty; d=0; one zero constraint; diagonal | Submodule closure uses algebra evaluations | R09 |
| 9.2 | Distinct 0,5; repeated 0 | Comaximal factors; no multiplicity from repetition | None |
| 9.3 | V=0,V=full; q zero divisor excluded | Basis follows adapted E-basis | None |
| 9.4 | New point versus repeated point; unit factor | Evaluation of determinant is nonzero | None |
| 9.5 | Identity; zero matrix; noncommuting matrices | Preimage transport composes in DC order | None |
| 9.6 | V=0,full; diag(2,3) | Invertibility is necessary and sufficient for stated transport equivalence | None |
| 9.7 | J empty; one point; complementary lines at 0,5 | Inductive basis works over stated general domain; Lean overconstrains unused indices | R10,R14 |
| 9.8 | Unit rescaling; empty determinant; complementary lines | Associated, not equal, determinants | None |
| 9.9 | J empty; no forced zero; all forced zero | Projection product matches constraints | None |
| 9.10 | No conditions; diagonal; interpolation X/5 | Field coefficients used exactly where needed | None |
| 9.11 | Diagonal proper submodule; coordinate projection | Exact image proof statable on kept carrier | R08 |
| 9.12 | f=0; f=e=id; nontrivial basis shear | Coordinate definition is composition | None |
| 9.13 | e=id; arbitrary invertible e | Exact library inverse law | R12 |
| 9.14 | Identity; zero; nonsymmetric matrix | Row convention equals transpose of usual column matrix | None |
| 9.15 | c=(5,7), M=(1,2;3,4) | Row product (26,38), transpose gives (19,43) | None |
| 9.16 | Zero f; previous nonsymmetric matrix | Arithmetic identification still requires actual maps | None |
| 9.17 | U=(1,1;0,1); B=diag(2,3); rank zero | Covariance identity valid after scalar map | R10 |
| 9.18 | e1=e2=0; (2,3); determinant5 over Z5 | Unit determinant, not nonzero, controls integral inverse | R09 |
| 9.19 | Axes; slope 7/11; denominator vanishing | Cleared line relation remains correct | None |
| 9.20 | Z2 slope -2; zero maximal ideal excluded | Infinite ideal avoids finitely many forbidden values | None |
| 9.21 | Diagonal constraint; proper ideal (5,X) | Rational surjectivity does not imply integral surjectivity | None |
| 9.22 | Rank1; critical eigenline; scalar phi; rank0 | Noncriticality is not automatic in higher rank | R13 for later largest-weight use |
| 9.23 | Rank1; repeated weights; rank0 | Annihilator n_r differs from lambda_r | R13 |
| 9.24 | Weights (0,2); removable points; rank0 | Refinement hypothesis matches LLZ Assumption1.3 | R13 |
| 9.25 | Swap matrix; full filtration; phi=p^-1 | Use transported W, not raw period subspace | R13 |
| 9.26 | Diagonal; bounded unit reflection; rank0 | CRT quotient and coordinate-image argument consistent | R13 |
| 9.27 | Weights (0,2); rank0 | Analytic lambda factors are retained | R13 |
| 9.28 | p5,k2,a_p0; nontrivial nebentypus | Corrected rho vanishes at (1,2); actual matrix retains determinant character | None |
| 9.29 | p5,h9; ramified coefficient; phi=1 negative control | Contracting actual lattice supplies lower inclusion; only finite index concluded | None |
| 9.30 | Zero; unit scaling; shear sending (1,0) to (1,1) | Closed kernel depends on chosen coordinate | None |
| 9.31 | Center; different torsion component; strict boundary; p2 q4 | Domain is admitted open, not all weight space | None |
| 9.32 | Integer powers 0,1,-1 on psi-zero | Inverse differential restricted to correct domain | None |
| 9.33 | Zero; phi-fixed vector; conductor5 versus imprimitive25 | Conductor exponent cannot be freely enlarged | None |
| 9.34 | j=0; j=-1; sufficiently negative j | Negative Gamma alone does not justify exp inverse | None |
| 9.35 | Crystalline nonsplit Jordan phi; general de Rham D | General extension remains a separate target from eigenbasis calculation | None |
| 9.36 | Split alpha=1; nonsplit alpha=-1 | Augmentation containment, not equality | None |

## Not verifiable

- **Elaboration and inferred universe parameters.** The review was read-only and Lean commands/builds were prohibited. No elaboration, `#check @name` or proof execution was performed. Binder and instance conclusions above are from the explicit source signatures; the report does not certify that the supplied tactic proofs compile at the pins.
- **Unavailable supplier versions.** The provided main/completed trees and seven sibling checkouts do not contain SelmerIwasawaCohomology, PhiGammaModulesAndIwasawaCohomology, KTheoryFiniteLocalFields, K3BlochGroups, MotivicEtaleKTheory, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, ColemanIntegration, ColemanPowerSeries, LocallyAnalyticDistributions, PadicDifferentialEquationsAndRigidCohomology, BorelRegulators or GeneralizedHeegnerCycles. Exact names, section numbering and hypotheses attributed to those versions could not be certified. Their absence from these local inputs alone is not treated as proof that they do not exist or as an undeclared gap. Completed/NumberFieldArithmetic was available and was checked for its semilocal equivalence.
- **Full dependency closure.** The mechanical checker examined only eight roadmaps. Dependencies of unavailable supplier heads and their possible cycles cannot be certified from that output. No design/plan.json was supplied, so there is no declared gap list against which to discharge R01/R02.
- **Original FO draft.** The supplied legal FO text is a 303-page later version. Fetching the bibliography's 2006 URL through the sources service timed out. The mathematical statements are verified in the supplied text and R15 gives replacement locators; the 230-page draft's own numbering is not certified. No further text is needed to apply that repair.
- **Unverified citation occurrences.** The locator table states the checked subset; references outside it, including broader chapter/section citations and the full integral period-cocycle construction in §2.4, are not certified merely from matching a bibliography entry. All cited works have a legally available service-cached text or a supplied text; no inaccessible mathematical source remains necessary for the findings above. The source manifest itself is still absent (R11).

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7a3e54662f792cdb099d444d6f6de459a30c5f03", "job": "RT-PadicHodgeRegulators~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
