<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/144#issuecomment-6325975957 -->
Red team round 1 pass a (codex) of 6c7939f

Verdict: needs_changes

1. **F01** (P1) Foundational data are admitted

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:41`, also 49, 71, 104, 127, 147, 177, 202, 231, 270, 331, 353. “instance monomialsFintype … := by sorry”.

   **Claim:** These declarations provide the finite index, coordinate equivalences, jet algebra/maps, quotient equivalence, Gram form and universal matrix used by the headline signatures.

   **Witness:** `monomialsFintype` and eleven data definitions have whole-body `sorry`; even `WellPoised`, `selectedMinor` and the real norm depend on this admitted data. None supplies a defined mathematical object.

   **Exact repair text:** “Keep only light definitions with real bodies on pinned carriers. Define the finite monomial index, jet evaluation/maps, matrix and determinant explicitly; remove any equivalence whose construction is substantial and restate its existence as a named theorem or README target. Remove all references to deleted admitted data. Define `WellPoised` using the resulting real first-jet map.”

2. **F02** (P3) All 55 examples are admitted, with repeated tests beyond the cap

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:62`, 89–102, 117–125, 398–500, 610–627. “example … := by sorry”.

   **Claim:** The examples check the roadmap's definitions.

   **Witness:** Every one of the 55 `example` declarations ends in `sorry`. Coefficient coordinates alone have six examples (62, 64, 66, 402, 406, 410), exceeding the two-example cap without testing any implementation.

   **Exact repair text:** “Retain at most two proved, discriminating examples per kept definition. Combine related positive and negative cases in those examples; remove duplicate partial checks. Convert a remaining boundary case requiring future mathematics into a named theorem with a README target, instead of an admitted example.”

3. **F03** (P3) Suggested file violates the required module shape

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:1`, 12–31, 397, 729. “set_option maxHeartbeats 800000”.

   **Claim:** The file records suggested statements against the pinned APIs.

   **Witness:** There are 15 `Mathlib.*` imports, two `set_option`s, no declaration docstrings, the namespace lacks `TauCetiRoadmap`, and no prescribed Layer comments. Lines 729–744 are a catalogue of omitted targets.

   **Exact repair text:** “Use the single `import Mathlib`; remove both option overrides. Add the module docstring `GenericDoublePointInterpolation: representative target signatures`, identifying README.md as definitive and the signatures as non-exhaustive. Use `namespace TauCetiRoadmap.GenericDoublePointInterpolation`, one `/-! ## Layer k: … -/` comment per layer in README order, and mathematical docstrings on every retained declaration. Remove the omitted-signature catalogue and process comments.”

4. **F04** (P3) The claimed Mathlib pin is not the repository pin

   **Location:** `packages/GenericDoublePointInterpolation/README.md:66`, 73–85. “baseline at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`”.

   **Claim:** The linked baseline is the pinned library used for this package.

   **Witness:** `lake-manifest.json:18` pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; the Tau Ceti pin does match.

   **Exact repair text:** “Replace the baseline commit and all 15 Mathlib link revisions by `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, after checking the named declarations at that pin.”

5. **F05** (P1) The SF supplier contract invents an unregistered continuation

   **Location:** `packages/GenericDoublePointInterpolation/README.md:44–53`, 698, 708. “Its continuation for generic tangent incidence supplies generic smoothness … contact-fiber statements.”

   **Claim:** SchemeAndStackFoundations supplies the Cartier residual sequence, generic tangent/contact geometry, and the plane incidence bound used in GI.2–GI.4.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1765` supplies ideal quotient comparisons; §5.12 at 7336 supplies Bézout. Its main README has no claimed tangent/contact continuation, Cartier residual/trace target, or general-point plane-curve incidence bound. No gap is declared here.

   **Exact repair text:** “Replace `SF.0`/`SF.5` with exact existing sections and target names for genuinely supplied facts (including §0.28 and §5.12). Add separate, precise supplier gaps for the missing Cartier residual sequence, generic smoothness/rank and contact-fiber interface, and the plane singular-curve/incidence interface, in `## Exact supplier contracts` and matching top-level `gaps` entries. Name the proposed extension as Part II; do not describe it as already supplied by main.”

6. **F06** (P1) Euler's identity is already provided at the pin

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:543`; `packages/GenericDoublePointInterpolation/README.md:656`. “theorem homogeneousEuler”.

   **Claim:** Euler's identity is a theorem to develop here from monomial differentiation.

   **Witness:** `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73`, `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`, proves the same identity over a commutative semiring, including degree zero; lines 58–69 also prove its weighted generalization.

   **Exact repair text:** “Delete `homogeneousEuler`. Cite `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` from `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean` in the pinned supplier table and in Exact integer rank witnesses. Retain only the application that vanishing partials force the value to vanish when the degree is invertible.”

7. **F07** (P2) Easy finite-base headline signatures are omitted

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:735–737`; `packages/GenericDoublePointInterpolation/README.md:674`, 726, 830. “the actual finite base witnesses”.

   **Claim:** All GI.3 base-witness signatures must be omitted with the unformalized geometry.

   **Witness:** The P⁵ quartic milestone needs only the existing `firstJetMatrix`: there is `P : Fin 21 → Fin 5 → ℚ` with injective P and matrix rank 126 in degree 4. No scheme carrier is needed.

   **Exact repair text:** “After replacing admitted matrix data by real definitions, add `theorem quarticFive : ∃ P : Fin 21 → Fin 5 → ZMod 101, Function.Injective P ∧ (firstJetMatrix P 4).rank = 126 := by sorry`, with the integer lift supplied by the exact-rank-witness target. Add similarly compact signatures for the plane sextic critical ranks and the finite near-exception rank list, and list their names at the corresponding README targets. Keep genuinely unavailable geometric objects in the README.”

8. **F08** (P3) Neither cited work has a source manifest entry

   **Location:** `packages/GenericDoublePointInterpolation/README.md:148–159`; package file list.

   **Claim:** BO and COU are the cited versions supporting all 77 targets.

   **Witness:** The package has no `sources.toml`. Both exact PDFs were legally retrieved in this pass: BO is arXiv v2; COU is the publisher's freely served article.

   **Exact repair text:** “Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and entries BO and COU, including authors, title, year, exact version, locator scheme, locators, cited targets, and the source service's URL/provenance/hash/licence/status fields. Use no local paths.”

9. **F09** (P1) R09.1/R09.2 do not identify the moduli supplier's current contracts

   **Location:** `packages/GenericDoublePointInterpolation/README.md:43`, 46, 244, 630, 640, 952. “proper projective tangent-direction incidence and valuative extension”.

   **Claim:** AlgebraicModuliForArithmeticGeometry R09.1/R09.2 supply projective-section comparisons and the specific moving doubled-point/direction families.

   **Witness:** At locally available supplier head `98fd038`, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:496` is §1.2, 908 is §1.7, and 996 is §2.1. No `R09.1`/`R09.2` or doubled-point tangent-direction incidence target occurs there.

   **Exact repair text:** “Cite AlgebraicModuliForArithmeticGeometry §1.1 `ProjectiveBundles.projectiveBundle`/`integerTwists`, §1.2 `ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison`, §1.7 `rankLocus`, and §2.1 `hilbertFunctorAsQuot`, retaining their stated hypotheses. Own the squared-point and tangent-direction specializations explicitly in GI.1–GI.2, or declare precise matching supplier gaps for genuinely missing general family and extension results. Do not call the universal squared-point incidence family an existing R09.2 export.”

10. **F10** (P3) Two ring-general negative Checks fail for the zero ring

   **Location:** `packages/GenericDoublePointInterpolation/README.md:232`, 294. “At the origin, jetAlgebra(X₁)=(0,e₁), not zero.”

   **Claim:** The stated inequalities discriminate homogenization and jets over the standing arbitrary commutative ring.

   **Witness:** For the zero ring, every polynomial and every element of `TrivSqZeroExt R (Fin 1 → R)` is zero. Thus the jet is zero and both alleged unequal homogenized polynomials agree.

   **Exact repair text:** “For the negative Checks `homogenize_quadratic` and `jet_variable`, assume R is nontrivial. Keep the identities and the definitions over arbitrary commutative rings. Include the actual non-equality/nonzero conclusion in their proved Lean examples, with `[Nontrivial R]`.”

11. **F11** (P3) Lean names and README targets cannot be matched by name

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:635`, 697, 710, 718; `packages/GenericDoublePointInterpolation/README.md:1132`, 1162, 1174, 1184.

   **Claim:** The README specifies the named Lean contracts.

   **Witness:** `maximalMinor`, `genericAffinePrincipalOpen`, `integerGridForMinor`, and `parameterPullback` never occur in the README. Other missing names include `jetKernel`, `doubleLength`, `planeNumerics`, `criticalDivision` and `exceptionScheduler`.

   **Exact repair text:** “At each corresponding README target, list the retained Lean declaration names and their precise scope. Add names for the real-bodied carrier aliases and constructions to their definition targets; delete unmapped helper declarations that do not belong in the compact signature file.”

12. **F12** (P1) Mixed-parameter bad families need a stronger contract than valuative limits

   **Location:** `packages/GenericDoublePointInterpolation/README.md:638–640`, 982–996. “Set the F parameters to their limits, while keeping the G parameters general and nonzero”.

   **Claim:** A valuative extension of a generic bad direction tuple supplies all mixed specializations used in the contradiction, preserving the bad rank bound.

   **Witness:** The direction family `[s:t]` over `A² \ {0}` has proper target P¹ and extends along every trait, but has different limits along `s=0` and `t=0`. Properness does not supply a compatible section over the parameter product.

   **Exact repair text:** “Add a GI.2 target constructing the required compatible specialization diagram inside the closed bad-incidence locus: its generic configuration, all F-specialized/G-moving configurations used in the proof, and the common special configuration must carry flat direction families and the same upper-rank bound. State the allowed base modifications and prove that the mixed supports and tangent classifications survive them. Make both differential contradictions depend on that target; a single valuative extension is insufficient.”

13. **F13** (P1) The supplied Castelnuovo target does not cover its mixed-scheme uses

   **Location:** `packages/GenericDoublePointInterpolation/README.md:564–574`, 998. “In the preceding situation … Equivalently h(X,d)≥h(Res,d−1)+h(Tr,d).”

   **Claim:** The stated double-point Castelnuovo bound can be applied to the curvilinear mixed schemes in differential Horace.

   **Witness:** For r=3 a full double point has length 4; a moving direction has length 2. The mixed scheme at lines 994–996 is not a union of full double points, the only X admitted at line 564.

   **Exact repair text:** “State Castelnuovo's bound for every finite closed subscheme X⊂P^r_k and hyperplane H, with r,d≥1: define Res by the ideal quotient and Tr by restriction, and prove the sheaf sequence and h(X,d)≥h(Res,d−1)+h(Tr,d). Then state the full-double and transverse/tangent length calculations as applications. Cite the general Cartier sequence via the corrected supplier contract.”

14. **F14** (P2) Transverse residual conditions are not added independently to a filled system

   **Location:** `packages/GenericDoublePointInterpolation/README.md:972–974`. “independent residual conditions when added to the successful Step2 residual setup”.

   **Claim:** Each additional length-one residual contributes an independent condition beyond the successful residual setup.

   **Witness:** That setup already has length and rank N(r,d−1) (lines 854–855). Its Γ²|H already contains the reduced F supports. Adding any such support contributes zero additional rank. BO line 894 uses a subscheme instead.

   **Exact repair text:** “Replace the last sentence by: ‘The reduced residuals at F, together with Φ, Σ² and the length-two tangent limits at G, form a subscheme of the successful residual setup. Hence their degree-(d−1) rank is u+(r+1)(q−u−e)+f+2g.’”

15. **F15** (P3) The selected-minor locator is one page early

   **Location:** `packages/GenericDoublePointInterpolation/README.md:1138`. “COU, §3 p. 491”.

   **Claim:** The cited page supplies a nonzero maximal determinant with polynomial entries.

   **Witness:** COU line 242 (printed p.492) introduces the polynomial maximal minors and their nonvanishing. Printed p.491 ends with the first-jet matrix and generic maximal-rank assertion (COU lines 195–204).

   **Exact repair text:** “Change this locator to ‘COU, §3, pp.491–492: generic matrix rank on p.491 and polynomial maximal minors on p.492’. Mark the passage from the affine witness to an integer-coefficient universal minor as the algebraic reformulation proved here.”

16. **F16** (P3) Additional native constructions lack their own discriminating Checks

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:606`, 653, 665, 668; `packages/GenericDoublePointInterpolation/README.md:1152–1154`.

   **Claim:** `selectedMinor`, `evaluationPrime`, `parameterScheme` and `evaluationSchemePoint` are retained constructions supporting the endpoint.

   **Witness:** No README Check block covers the three evaluation/scheme constructions. `selectedMinor` has only the admitted unit-determinant example at line 617; no negative sign or zero-determinant control tests the chosen-column convention.

   **Exact repair text:** “For each retained construction add three discriminating README Checks, combined into at most two proved Lean examples. For `selectedMinor`, use columns (1,x) at one point giving 1, swapped columns giving −1 over ℤ, and repeated supports giving zero. For the evaluation constructions, test the origin kernel (variables), distinct rational tuples giving distinct points, and the zero-coordinate parameter space Spec k. Remove unused aliases instead of adding unused APIs.”

17. **F17** (P2) Native map definitions have different generality in Lean and the README

   **Location:** `packages/GenericDoublePointInterpolation/README.md:326`, 382, 404, 426, 460; `packages/GenericDoublePointInterpolation/Suggested.lean:46–47`, 127–255.

   **Claim:** The squared union ideal and bounded jet/value/derivative maps and matrix are defined over a field.

   **Witness:** Their Lean declarations and projection/reindexing statements are all in `section Ring` with `[CommRing k]`; the README's corresponding targets explicitly require a field.

   **Exact repair text:** “State `doubleIdeal`, `firstJetMap`, `valueMap`, `derivativeOnKernel` and `firstJetMatrix`, with their algebraic formulas and reindexing laws, over an arbitrary commutative ring R. Retain field assumptions for distinct-point comaximality, length/dimension and rank/surjectivity results. Separate nontrivial-ring negative Checks from ring-general identities.”

## Verified sound

Read all 1,263 README lines and all 745 Lean lines: **77 bold targets; 152 Lean declarations (73 theorems, 55 examples, 13 definitions, 8 abbreviations, 3 instances)**. Tested all **42 named README Checks** mathematically; the two zero-ring negative claims require R10. All 55 Lean examples are admitted, so none counts as a proved Check. The six scheme-family/rank Checks have no native geometric definitions in Suggested.lean; that omission alone is not a forced-signature defect.

Retrieved both cited works legally and inspected all **77 target source blocks**. Confirmed **16 distinct named/section locators**, listed below; R15 corrects one pinpoint page. The elementary algebraic extensions of COU were checked from their displayed constructions, rather than attributed verbatim to the source. Checked **4 supplier-table contracts**, plus reverse-name searches; the seven specified sibling heads were searched for ownership overlap. AlgebraicModuliForArithmeticGeometry was inspected via its locally stored remote head `98fd038`; SchemeAndStackFoundations was inspected on main. There are no citations to the seven specified sibling roadmaps to validate by section. Checked the pinned polynomial, derivative, square-zero, CRT, rank, Nullstellensatz and affine-Spec declarations; R04 and R06 record the pin and duplication defects.

All **22 finite certificate ranks** were reproduced by exact arithmetic modulo 101. The subspace tests also checked frame ranks, expected pair/triple spans, projectively distinct supports, ambient supports outside the subspaces, and the r=5 transverse remainder direction. Integer linear combinations were used before reduction, so those incidences lift to characteristic zero. This verifies existence witnesses, not a Lean implementation.

The numeric sweep used r=2,…,50 and d=4,…,15; all q up to the ceiling when that ceiling is below 10,000, otherwise q=0,1,floor,ceiling. It found no violation of the three Horace bounds or critical nonnegativity. Both critical counts avoid the exception list for r≥3,d≥5 in that sweep. The plane reduction was checked for d≤100 and all admissible l. These are finite adversarial tests; BO6.3/6.4 remain the sources for the unbounded claims.

The degree-5 endpoint is supported by BO1.1 even though COU uses d>5. The four sporadic exceptions and the quadric range are correct. The BO Proposition5.3 P⁵ typo in its P⁷ paragraph is not copied into the target. The source's ordinary/global-section sequence is used only left-exactly. No factorial inversion enters the first jets or univariate Hermite theorem. The collinear rank11 calculation, selected-minor quantifier, md degree bound, B+1 grid size, and nonzero-pullback hypothesis are correct.

The read-only diff contained only the four package files (README.md, Suggested.lean, metadata.toml, review.json). No `lemma`, `True` placeholder, `#eval`, `#synth`, or computational algorithm was found in the package's mathematical specification. No Lean command or build was run.

Dependency-check output (exit 1):

```text
NOT IN ORDER: GenericDoublePointInterpolation (insert it after its last supplier)
depcheck: 8 roadmaps, 50 edges, 1 problem(s)
```

There was no UPWARD or CYCLE line. The not-in-order diagnostic is not raised as a defect. The checker does not establish that the cited supplier targets exist; R05/R09 address that separately.

Source-locator audit (source text is not reproduced):

| Locator | Verified evidence |
|---|---|
| BO Theorem1.1, p.1 | BO line22; hypotheses and exception list at lines23–38 |
| BO Proposition2.1, p.3 | BO line127; tangent annihilator computation at line134 |
| BO Lemma2.2, pp.3–4 | BO line139; tangent/span calculation |
| BO Lemma2.3, p.5 | BO line217; generic contact-fiber argument |
| BO Theorem2.4, p.6 | BO line245; plane inequalities at line257 |
| BO §3, pp.6–7 | BO line278; quadric and sporadic exceptions |
| BO Theorem4.1, pp.7–8 | BO line374; left-exact sequence at line407 |
| BO Theorem5.1, pp.9–12 | BO line481; remainder induction at line574 |
| BO Proposition5.2, pp.9–10 | BO line486; r=5,6,7 bases and recursion |
| BO Proposition5.3, p.10 | BO line514; P⁷ typo at line525 identified |
| BO Proposition5.4, pp.10–11 | BO line539; support counts and remainder at line543 |
| BO Lemma6.1, pp.12–14 | BO line628; local and disjoint-support proof |
| BO Lemma6.3, pp.15–16 | BO line765; integer u and all three inequalities |
| BO Theorem6.4, pp.16–19 | BO line798; Step1/2 at807/825, mixed limits at883, final bases at960 |
| BO §7.1, p.19 | BO line984; univariate multiplicity argument |
| COU §3, pp.491–493 | COU lines179–204 (forms/matrix),242–247 (minors/grid),255–258 (metric) |

Adversarial target table. Each row identifies the statement by its README line, gives the instances tried, and records the result or repair. “Valid” here refers to the stated mathematics under the standing hypotheses; dependency and Lean-data defects remain as cited.

| README line / target | Instances tried | Result / change |
|---|---|---|
| 176: Binomial count of bounded monomials. | r=0; d=0; r=d=2 | Counts 1,1,6; no change |
| 186: Dimension of bounded polynomials. | zero variables; constants; finite fields | Finite basis gives stated rank; no change |
| 196: Coefficient coordinates. | zero ring; 2+3x²; constant | Coordinates valid; R01/R02 |
| 220: Fixed-degree homogenization. | zero ring; d=0; 1+x at d=2 | Identities valid; negative control R10 |
| 242: Homogeneous forms and twisting sections. | P⁰; d=0; chart X₀=1 | Comparison valid; supplier R09 |
| 254: Coefficient Gram form. | 0; x,y; 2+x | Gram values 0,1,5; R01/R02 |
| 282: First-jet algebra evaluation. | zero ring; F₂; F₃; 1,x,x² | Jet formula valid; R10 nonzero control |
| 304: Kernel of one first jet. | r=0; F₂; translated x² | Kernel/surjectivity valid; R01 |
| 314: Distinct point ideals and their powers. | F₂ points 0,1; coincident points | Distinctness essential; native coprime powers |
| 326: Squared union ideal. | empty tuple; repeated support; origin | Ideal formula valid; R01/R17 |
| 348: Double-point quotient comparison. | empty product; r=0; F₂ points 0,1 | CRT preserves square-zero multiplication; R01 |
| 370: Length of distinct double points. | n=0; r=0,n=1; r=2,n=1 | Dimensions 0,1,3; supplier R05 |
| 382: Bounded first-jet evaluation. | d=0; 1,x,y; F₂/F₃ derivatives | Values and partials correct; R01/R17 |
| 404: Value projection. | empty tuple; 0,1; x at 0 | Value projection correct; R01/R17 |
| 426: Derivatives of vanishing polynomials. | constant kernel; x; x² at 0 | Derivative/noninjectivity correct; R01/R17 |
| 448: Surjectivity through the value kernel. | empty target; constant system; split map | Product lifting argument valid; R01 |
| 460: Monomial first-jet matrix. | d=0; zero exponent; origin | Row/column orientation correct; R01/R17 |
| 482: Full row rank criterion. | zero rows; too many rows; identity | Finite-dimensional criterion valid; R01 |
| 492: Well-poised double points. | one point d=1; d=0; seven collinear | Positive and failure cases correct; R01/R02 |
| 514: Restriction to projective double points. | one chart double point; d=0 | Restriction formula valid; R05/R09 |
| 530: Restriction rank of a finite scheme. | empty X; D=0; one point | Rank bounds correct; supplier R05/R09 |
| 552: Restriction rank on disjoint unions. | A empty; B empty; D=0 | Rank-nullity identity correct; R05 |
| 564: Double-point residual and trace. | support on/off H; r=1 | Local colon/trace correct; generalization R13 |
| 574: Castelnuovo dimension bound. | empty scheme; length-two direction in P³ | Valid restricted statement; insufficient uses R13 |
| 584: Ordinary Horace criterion. | matched inequalities; equality boundary | min arithmetic correct; R05/R13 |
| 596: Independent subschemes. | empty subscheme; zero source | Surjective/injective directions correct |
| 606: Curvilinear criterion at one support. | length 0,1,2; square-zero rank deficiency | Every proper image detected by direction; valid |
| 616: Curvilinear reduction. | zero/one/two supports; D=0 | Disjoint-kernel induction valid |
| 628: Rank in flat point families. | identity family; rank-drop matrix [t] | Rank decreases at specialization; R09 |
| 638: Proper limits of curvilinear failures. | e=0,1; two-parameter direction [s:t] | Single-trait statement insufficient; R12 |
| 654: Exact integer rank witnesses. | t=0; zero matrix; d=0; d=p in Fp | CharZero/nonzero degree needed; duplication R06 |
| 664: Quadrics with prescribed singular points. | q=0,1,r,r+1; characteristic 2 excluded | Radical dimension and cutoff correct |
| 674: Low-degree near-exception certificates. | all 12 listed finite configurations | All 12 required ranks attained mod101; R07 |
| 686: Veronese tangents and double-point conditions. | d=1; coordinate support; d=2 | Differential factor d and annihilator correct; R05 |
| 696: Terracini span for the Veronese family. | q=1; d=1; saturated secant | Affine/projective dimension offset correct; R05 |
| 706: Contact curve in the defective plane case. | quadratic two points; quartic five points | Double line/conic correct; generic supplier R05 |
| 716: Plane contact numerical reduction. | d=0..100; every l≤d/2 | Only d≤4 or d=6 can satisfy hypotheses |
| 726: Exact sextic plane critical ranks. | q=9,10 at d=6 | Ranks 27,28 attained mod101; R07 |
| 736: Plane interpolation input. | d=0,1,2,3,4; both critical counts | Exceptions match BO; R05 |
| 748: Three-subspace cubic base certificates. | r=5,6,7; actual subspace incidences | Ranks 56,84,120 attained mod101 |
| 758: Three-subspace cubic recursion. | r=5 bases; r=8 residual quadrics | Source recursion matches; R05 general sequence |
| 768: Two-subspace cubic base certificates. | r=5,7; ambient outside both spaces | Ranks 56,120 attained mod101 |
| 778: Two-subspace cubic recursion. | r=3; r=4 excluded; r=6,7 | Base/recursive dimensions consistent |
| 788: One-subspace cubic base certificates. | r=5 with transverse length2; r=7 | Ranks 56,120; required incidence checked |
| 798: One-subspace cubic recursion. | r=3; r=5,7,8; remainder trace | Counts match BO Proposition5.4 |
| 808: Cubic critical-count remainder. | r=0,1 arithmetic; r=2,3,5,7 geometry | Remainder formula correct; r=4 excluded |
| 818: Cubic maximal-rank input. | r=2; r=4,q=6,7,8 | Exceptional cubic count preserved |
| 830: Quartic P⁵ critical certificate. | r=5,d=4,q=21 | Rank126 attained mod101; R07 |
| 866: Horace trace-size inequality. | r=2..50,d=4..15; q=0 and critical | Inequality survives negative u; BO6.3(i) |
| 876: Horace residual-size inequality. | same sweep; q=0; e=r−1 | Residual lower bound holds; BO6.3(ii) |
| 886: Large-dimensional quartic residual bound. | r=10 boundary; d=4; low/critical q | Sharp lower bound holds; BO6.3(iii) |
| 896: Nonnegative critical Horace data. | both floor/ceiling counts; r=2,d=4 | All counts nonnegative; source-consistent |
| 908: Mixed residual rank in degree d−1. | e=0; q−u−e=0 when admissible | Counts consistent with BO Step1; R09 |
| 918: Injective residual restriction to H. | overfilled predecessor; divisible form | Kernel argument valid; R05/R13 |
| 928: Killing a residual system with simple points. | u=0,1; dimension32 with 30 points | Point selection and subset use valid |
| 938: Underfilled trace with simple remainder. | e=0; equality at critical floor | Trace length bound correct; R09 |
| 950: Moving supports and hyperplanes. | δ(t)=(a,t), H_t=(y=t) | Lengths 3 and2; construction supplier R09 |
| 972: Transverse curvilinear limit rank. | transverse direction; filled residual | Extra-rank wording false; R14 |
| 982: Tangent directions in the moving residual. | f=0; g=0; mixed two-parameter family | Rank sum correct; compatible-family gap R12 |
| 994: Underfilled differential Horace contradiction. | e=0; f+g=e; critical equality | Sum equals required rank; R12/R13 |
| 1004: Overfilled partial-length reduction. | ν<0; ν=0; 0≤ν<e | Partial length equals N; branch correct |
| 1014: Overfilled differential Horace contradiction. | ν=0; F subset Γ₀; restricted indices | Trace selection correct; R12/R13 |
| 1026: Differential Horace induction step. | small quartic exceptions; critical counts | Statement matches BO6.4; proof gaps R12/R13 |
| 1038: Univariate Hermite interpolation. | n=0; F₂ points0,1; d=0..3 | Ranks min(d+1,2n), including char2 |
| 1050: Quartic P⁷ ordinary Horace input. | q=41,42; u=30 | Trace210; residual118/126 versus120 |
| 1060: Quartic induction inputs. | r=5,6,7,8,9,10 | Base and special ordinary branch consistent |
| 1070: Exception-avoiding induction schedule. | r=3..50,d=5..15; both counts | No exceptional predecessor in sweep |
| 1082: Generic characteristic-zero double-point rank. | r=1; d=5; overfilled q | BO1.1 supports full maximal-rank scope |
| 1098: Passing to the dense affine chart. | r=1,n=1; large n; chart intersections | Nonempty opens meet in irreducible product |
| 1108: Universal first-jet matrix. | n=0; d=0; x² at3; char2 | Universal integer formulas correct; R01 |
| 1132: Nonzero maximal minor. | minimal n; d=5; zero competing minor | Existential column choice correct; locator R15 |
| 1142: Degree of a first-jet minor. | zero determinant; n=0; d=0 | Coarse bound includes zero polynomial |
| 1152: Principal-open full-jet locus. | repeated supports; empty tuple; r=0 | Nonzero determinant implies distinctness; R16 |
| 1162: Generic affine Hermite interpolation. | r=1; d=5; dimension equality | Affine theorem supported; R01 data |
| 1174: Bounded integer specialization. | B=0; nonzero constant; degree exactly B | B+1 grid nodes sufficient |
| 1184: Polynomial parameter pullback. | S empty; zero pullback excluded; constant θ | Nonzero pullback hypothesis essential and present |
| 1196: Special collinear configurations fail. | P_i=(i,0), i=0..6; d=5 | Two independent slices have dimensions6+5=11 |

Lean declaration/context table. All line references in this table are to `packages/GenericDoublePointInterpolation/Suggested.lean`. `R` means ambient `{k : Type u} [CommRing k] {r n : ℕ}`; `F` means `{k : Type u} [Field k] {r n : ℕ}`; `NR` is R with only ambient r; `NF` is F. `G` means global, with all variables/instances explicit in that declaration. Only ambient variables actually mentioned in a signature are retained. No lost standing mathematical hypothesis was found. Every anonymous example is separately indexed by its starting line.

Test codes: **C** = zero variables/degree, zero ring, monomial coordinates; **J** = constants/variables/squares, F₂/F₃, empty or repeated supports; **H** = univariate critical degrees and seven collinear points; **M** = real orthogonality/constants/norm5; **W** = zero-size/minor lifting and nonzero homogeneous degree (d=p excluded for value implication); **A** = the integer sweeps above; **U** = empty rows, zero exponents, x² at3; **P** = empty configuration, coincident supports, zero/nonzero determinant, empty parameter set. These codes record the boundary checks relevant to the type, not claims that an admitted definition computes.

| Line / declaration | Kind; section; instance context | Test / result / change |
|---|---|---|
| 33: `Bounded` | abbrev; global; G: CommRing k; u | C; native carrier; R03/R11/R16 as applicable |
| 35: `Monomials` | abbrev; global; G: explicit finite indices | C; native carrier; R03/R11/R16 as applicable |
| 37: `JetRows` | abbrev; global; G: explicit finite indices | C; native carrier; R03/R11/R16 as applicable |
| 38: `JetCoordinates` | abbrev; global; G: explicit finite indices | C; native carrier; R03/R11/R16 as applicable |
| 41: `monomialsFintype` | instance; global; G: explicit finite indices | C; admitted data; R01 |
| 43: `monomialCount` | theorem; global; G: explicit finite indices | C; intended type checked; R01 dependencies |
| 49: `coefficientCoordinates` | def; Ring; R: retains k,r | C; admitted data; R01 |
| 52: `coefficientCoordinates_apply` | theorem; Ring; R: retains k,r | C; intended type checked; R01 dependencies |
| 55: `coefficientCoordinates_symm` | theorem; Ring; R: retains k,r | C; intended type checked; R01 dependencies |
| 59: `coefficientCoordinates_ext` | theorem; Ring; R: retains k,r | C; intended type checked; R01 dependencies |
| 62: `example` | example; Ring; R: no ambient binders | C; intended Check reviewed; R02 |
| 64: `example` | example; Ring; R: retains r | C; intended Check reviewed; R02 |
| 66: `example` | example; Ring; R: retains k | C; intended Check reviewed; R02 |
| 71: `fixedHomogenization` | def; Ring; R: retains k,r | C; admitted data; R01 |
| 74: `fixedHomogenization_monomial` | theorem; Ring; R: retains k,r | C; intended type checked; R01 dependencies |
| 79: `fixedHomogenization_dehomogenize` | theorem; Ring; R: retains k,r | C; intended type checked; R01 dependencies |
| 84: `fixedHomogenization_mul` | theorem; Ring; R: retains k,r | C; intended type checked; R01 dependencies |
| 90: `example` | example; Ring; R: retains k | C; intended Check reviewed; R02 |
| 95: `example` | example; Ring; R: retains k,r | C; intended Check reviewed; R02 |
| 99: `example` | example; Ring; R: retains k | C; intended Check reviewed; R02 |
| 104: `jetAlgebra` | def; Ring; R: retains k,r | J; admitted data; R01 |
| 107: `jetAlgebra_fst` | theorem; Ring; R: retains k,r | J; intended type checked; R01 dependencies |
| 110: `jetAlgebra_snd` | theorem; Ring; R: retains k,r | J; intended type checked; R01 dependencies |
| 113: `jetAlgebra_X` | theorem; Ring; R: retains k,r | J; intended type checked; R01 dependencies |
| 118: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 121: `example` | example; Ring; R: retains k,r | J; intended Check reviewed; R02 |
| 124: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 127: `doubleIdeal` | def; Ring; R: retains k,r,n | J; admitted data; R01 |
| 129: `doubleIdeal_def` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 132: `doubleIdeal_reindex` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 136: `example` | example; Ring; R: retains k,r | J; intended Check reviewed; R02 |
| 139: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 143: `[Nontrivial` | example; Ring; R: retains k; [Nontrivial k] | J; intended Check reviewed; R02 |
| 147: `firstJetMap` | def; Ring; R: retains k,r,n | J; admitted data; R01 |
| 150: `firstJetMap_value` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 153: `firstJetMap_partial` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 157: `firstJetMap_monomial` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 163: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 167: `example` | example; Ring; R: retains k,r,n | J; intended Check reviewed; R02 |
| 172: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 177: `valueMap` | def; Ring; R: retains k,r,n | J; admitted data; R01 |
| 180: `valueMap_apply` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 183: `valueMap_eq_jetProjection` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 186: `mem_valueKernel` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 190: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 194: `example` | example; Ring; R: retains k,r | J; intended Check reviewed; R02 |
| 197: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 202: `derivativeOnKernel` | def; Ring; R: retains k,r,n | J; admitted data; R01 |
| 205: `derivativeOnKernel_apply` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 209: `derivativeOnKernel_eq_jet` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 213: `derivativeOnKernel_reindex` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 218: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 223: `[Nontrivial` | example; Ring; R: retains k,r; [Nontrivial k] | J; intended Check reviewed; R02 |
| 226: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 231: `firstJetMatrix` | def; Ring; R: retains k,r,n | J; admitted data; R01 |
| 234: `firstJetMatrix_value` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 237: `firstJetMatrix_partial` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 242: `firstJetMatrix_mulVec` | theorem; Ring; R: retains k,r,n | J; intended type checked; R01 dependencies |
| 247: `example` | example; Ring; R: no ambient binders | J; intended Check reviewed; R02 |
| 250: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 253: `example` | example; Ring; R: retains k | J; intended Check reviewed; R02 |
| 260: `boundedFinrank` | theorem; Field; F: retains k,r | J; intended type checked; R01 dependencies |
| 262: `jetAlgebra_surjective` | theorem; Field; F: retains k,r | J; intended type checked; R01 dependencies |
| 264: `jetKernel` | theorem; Field; F: retains k,r | J; intended type checked; R01 dependencies |
| 267: `doubleIdeal_distinct` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 270: `doubleQuotient` | def; Field; F: retains k,r,n | J; admitted data; R01 |
| 274: `doubleQuotient_mk` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 278: `doubleQuotient_mul` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 282: `doubleQuotient_reindex` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 288: `example` | example; Field; F: retains k | J; intended Check reviewed; R02 |
| 291: `example` | example; Field; F: retains k,r | J; intended Check reviewed; R02 |
| 294: `example` | example; Field; F: retains k | J; intended Check reviewed; R02 |
| 297: `doubleLength` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 300: `jetKernelSplit` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 303: `jetRank` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 306: `WellPoised` | def; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 308: `wellPoised_iff_surjective` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 311: `wellPoised_reindex` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 314: `wellPoised_degree_mono` | theorem; Field; F: retains k,r,n | J; intended type checked; R01 dependencies |
| 318: `example` | example; Field; F: retains k,r | J; intended Check reviewed; R02 |
| 321: `example` | example; Field; F: retains k | J; intended Check reviewed; R02 |
| 324: `example` | example; Field; F: no ambient binders | J; intended Check reviewed; R02 |
| 326: `univariateHermite` | theorem; Field; F: retains k,n | H; intended type checked; R01 dependencies |
| 331: `coefficientGram` | def; global; G: ℝ; r,d explicit | M; admitted data; R01 |
| 334: `coefficientGram_apply` | theorem; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 338: `coefficientGram_positive` | theorem; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 342: `example` | example; global; G: ℝ; r,d explicit | M; intended Check reviewed; R02 |
| 346: `example` | example; global; G: ℝ; r,d explicit | M; intended Check reviewed; R02 |
| 350: `example` | example; global; G: ℝ; r,d explicit | M; intended Check reviewed; R02 |
| 353: `universalJetMatrix` | def; global; G: ℤ coefficients; explicit finite indices | U; admitted data; R01 |
| 356: `universalJetMatrix_value` | theorem; global; G: ℤ coefficients; explicit finite indices | U; intended type checked; R01 dependencies |
| 360: `universalJetMatrix_partial` | theorem; global; G: ℤ coefficients; explicit finite indices | U; intended type checked; R01 dependencies |
| 365: `universalJetMatrix_eval` | theorem; global; G: Field k; u | U; intended type checked; R01 dependencies |
| 370: `example` | example; global; G: explicit finite indices | U; intended Check reviewed; R02 |
| 374: `example` | example; global; G: explicit finite indices | U; intended Check reviewed; R02 |
| 377: `example` | example; global; G: ℤ coefficients; explicit finite indices | U; intended Check reviewed; R02 |
| 382: `genericAffineMinor` | theorem; global; G: Field k, IsAlgClosed k, CharZero k; u | P; intended type checked; R01 dependencies |
| 389: `integerGridSpecialization` | theorem; global; G: Field k, IsAlgClosed k, CharZero k; u | P; intended type checked; R01 dependencies |
| 402: `example` | example; NativeRingTests; NR: no ambient binders | C; intended Check reviewed; R02 |
| 406: `example` | example; NativeRingTests; NR: retains k,r | C; intended Check reviewed; R02 |
| 410: `example` | example; NativeRingTests; NR: retains k | C; intended Check reviewed; R02 |
| 416: `example` | example; NativeRingTests; NR: retains k | J; intended Check reviewed; R02 |
| 420: `example` | example; NativeRingTests; NR: retains k | J; intended Check reviewed; R02 |
| 428: `example` | example; NativeRingTests; NR: retains k,r | J; intended Check reviewed; R02 |
| 433: `example` | example; NativeRingTests; NR: retains k | J; intended Check reviewed; R02 |
| 438: `example` | example; NativeRingTests; NR: retains k | J; intended Check reviewed; R02 |
| 445: `example` | example; NativeRingTests; NR: retains k,r | J; intended Check reviewed; R02 |
| 454: `pointComaximal` | theorem; NativeFieldExtensions; NF: retains k,r | J; intended type checked; R01 dependencies |
| 460: `example` | example; NativeFieldExtensions; NF: retains k | J; intended Check reviewed; R02 |
| 464: `example` | example; NativeFieldExtensions; NF: retains k | J; intended Check reviewed; R02 |
| 470: `example` | example; NativeFieldExtensions; NF: retains k | J; intended Check reviewed; R02 |
| 475: `example` | example; NativeFieldExtensions; NF: retains k | J; intended Check reviewed; R02 |
| 484: `example` | example; NativeFieldExtensions; NF: retains k | J; intended Check reviewed; R02 |
| 489: `example` | example; NativeFieldExtensions; NF: retains k | J; intended Check reviewed; R02 |
| 492: `univariateHermiteRank` | theorem; NativeFieldExtensions; NF: retains k,n | H; intended type checked; R01 dependencies |
| 496: `collinearBoundary` | theorem; NativeFieldExtensions; NF: no ambient binders | H; intended type checked; R01 dependencies |
| 503: `coefficientEuclideanCoordinates` | abbrev; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 507: `boundedNormedAddCommGroup` | instance; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 512: `boundedInnerProductSpace` | instance; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 516: `coefficientCoordinates_isometry` | theorem; global; G: explicit finite indices | M; intended type checked; R01 dependencies |
| 520: `coefficientGram_inner` | theorem; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 523: `integralCoordinateLattice` | theorem; global; G: ℝ; r,d explicit | M; intended type checked; R01 dependencies |
| 531: `example` | example; global; G: ℝ; r,d explicit | M; intended Check reviewed; R02 |
| 537: `modularRankLift` | theorem; global; G: Field k, CharZero k; u | W; source/arithmetic checked |
| 543: `homogeneousEuler` | theorem; global; G: CommRing k; u | W; already pinned; R06 |
| 549: `homogeneousPartials_imply_value` | theorem; global; G: Field k, CharZero k; u | W; source/arithmetic checked |
| 557: `numericalTraceBound` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 564: `numericalResidualBound` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 571: `numericalQuarticBound` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 578: `criticalDivision` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 586: `planeNumerics` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 590: `cubicRemainderArithmetic` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 595: `exceptionScheduler` | theorem; global; G: ℕ/ℤ arithmetic; explicit bounds | A; source/arithmetic checked |
| 606: `selectedMinor` | abbrev; global; G: ℤ coefficients; explicit finite indices | U; intended type checked; R01 dependencies |
| 611: `example` | example; global; G: explicit finite indices | U; intended Check reviewed; R02 |
| 617: `example` | example; global; G: explicit finite indices | U; intended Check reviewed; R02 |
| 622: `example` | example; global; G: ℤ coefficients; explicit finite indices | U; intended Check reviewed; R02 |
| 629: `selectedMinor_eval` | theorem; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 635: `maximalMinor` | theorem; global; G: Field k, IsAlgClosed k, CharZero k; u | P; intended type checked; R01 dependencies |
| 643: `minorTotalDegree` | theorem; global; G: explicit finite indices | P; intended type checked; R01 dependencies |
| 647: `minorCoordinateDegree` | theorem; global; G: explicit finite indices | P; intended type checked; R01 dependencies |
| 653: `evaluationPrime` | abbrev; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 657: `evaluationPrime_asIdeal` | theorem; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 665: `parameterScheme` | abbrev; global; G: CommRing k; u | P; native carrier; R03/R11/R16 as applicable |
| 668: `evaluationSchemePoint` | def; global; G: Field k; u | P; native carrier; R03/R11/R16 as applicable |
| 672: `evaluationSchemePoint_over` | theorem; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 678: `evaluationSchemePoint_image` | theorem; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 683: `principalOpen_membership` | theorem; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 690: `principalOpen_wellPoised` | theorem; global; G: Field k; u | P; intended type checked; R01 dependencies |
| 697: `genericAffinePrincipalOpen` | theorem; global; G: Field k, IsAlgClosed k, CharZero k; u | P; intended type checked; R01 dependencies |
| 710: `integerGridForMinor` | theorem; global; G: Field k, CharZero k; u | P; intended type checked; R01 dependencies |
| 718: `parameterPullback` | theorem; global; G: Field k, CharZero k; u; S : Type*, Fintype S | P; intended type checked; R01 dependencies |

## Not verifiable

- **Lean elaboration and defaults:** no builds or elaboration commands were run, as required. The inherited review.json build claim was not treated as evidence that the present file satisfies the current signature policy. The tables record source inspection, not elaborated `#check` output.
- **Full generic tangent/contact and mixed-family proof:** the source statements were checked, but the claimed supplier continuation and compatible mixed-parameter construction are not supplied by the cited contracts (R05, R09, R12). The elementary counterexample in R12 shows why a trait extension alone does not fill this gap.
- **Remote freshness of AlgebraicModuliForArithmeticGeometry:** `98fd038` is the locally stored remote head inspected read-only. Its latest network head was not fetched; its precise available sections already differ from the package's R09 labels. All seven sibling heads explicitly supplied by the brief were used as supplied.
- **Formal finite-certificate proofs:** the exact modular witnesses were reproduced in scratch arithmetic, including incidence checks, but not certified by Lean. No theorem of positive-characteristic Alexander–Hirschowitz is inferred from them.

No cited text remains unavailable: both works were fetched through the sources service, and the scratch missing-reference list is empty. No package mathematics, source manifest, branch, pull request or issue was modified.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6c7939f218b6c7a0f66ee644d438073ba7a2157a", "job": "RT-GenericDoublePointInterpolation~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
