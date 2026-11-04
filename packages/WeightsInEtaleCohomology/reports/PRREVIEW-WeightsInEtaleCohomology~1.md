# Review of WeightsInEtaleCohomology (pull request #1001 at 84a13f1)

**Verdict:** needs changes

## R01 (P1) — Replace nonexistent crystalline declaration contracts

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:450`: “including `Crystalline.crysGysin_projection`, `Crystalline.crysGysin_comp` and `Crystalline.crysDiagonal_action`.”

**Claim:** These three declarations are supplied by CrystallineCohomology. None occurs in that supplier's README or Suggested.lean at its open head, or in either pinned library. The mathematical properties are supplied in prose; the named declaration contracts are not. This is supplier drift under the review's P1 rule, not a claim that crystalline Gysin theory is unowned.

**Witness:** `TauCetiRoadmap/CrystallineCohomology/README.md:7424` supplies “Proper smooth crystalline Gysin maps”; line 7528 supplies “Diagonal class and crystalline coevaluation”. Their projection, composition and identity clauses exist, but the three cited identifiers do not.

**Repair:** Replace the three identifiers by CrystallineCohomology §CR.3:duality.1, “Proper smooth crystalline Gysin maps”, clauses (2)–(3), and “Diagonal class and crystalline coevaluation”, clause (2). Keep the additional cycle/intersection comparison here. No supplier gap is needed for these already supplied properties. On P¹, the supplied diagonal class is h₁+h₂ and its correspondence sends each of 1,h to itself; composition with the identity and the projection formula then use exactly the cited clauses. This repairs the contract without changing the trace theorem.

## R02 (P2) — Import the existing general semistable comparison

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:822`, together with lines 28 and 114: “construct the comparison isomorphism” for an arbitrary proper strictly semistable model over a finite extension of ℚ_p.

**Claim:** R34.3 owns the general B_st comparison, its normalized monodromy, filtered B_dR agreement and functoriality. Earlier roadmaps already own this theorem. The Saito model, coefficient-projector restrictions and descent verifications can be new applications; rebuilding the general comparison cannot.

**Witness:** `TauCetiRoadmap/PadicHodgeTheory/README.md:1394`–1400 states the same semistable comparison and ramification normalization; §8.2, line 1415, supplies functoriality and geometric-projector restrictions. Its inputs include AInfCohomology §§AI.6.4–AI.6.6.

**Repair:** Defer the general finite-K comparison to PadicHodgeTheory §§8.1–8.2, retaining the underlying AInfCohomology contracts. Rewrite the scope, supplier list, R34.3 dependencies and lines 822–826 accordingly. Keep here the actual Saito-model verification, L_μ extension, specified L-coefficient correspondences, C_μ factor and original Weil-action/descent comparisons, stating exactly how these extend the supplied theorem. AInfCohomology and PadicHodgeTheory are at positions 53 and 107, before this roadmap at 131; do not introduce the later CohomologyComparisons as a supplier.

The normalization agrees on the separating test: for K=ℚ₅(√5) and the Tate curve with parameter √5, raw N has coefficient 1 and normalized N has coefficient 1/2. After ramification of index d the quotient is d/(2d)=1/2. PadicHodgeTheory §8.1 and AInfCohomology §AI.6.4 already retain this factor, so importing them preserves the roadmap's Check. This is a repairable ownership overlap, not a reason to reject the entire arithmetic-weights scope.

## R03 (P3) — Use target headings recognized by the roadmap gate

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:121` and the unnumbered target subsections beginning at line 125.

**Claim:** The layer/target structure satisfies the required roadmap format.

**Witness:** The worker's gate at this exact head reports `target-ids=1` and `FAIL`: “layered README states no targets (`### k.n` subsections or bold target names)”. All other gate counters, including build and dependency check, are zero.

**Repair:** Give the six layers and their actual target subsections consistent recognized numeric headings, such as `## Layer 1: ...` and `### 1.1 ...`, preserving R34 labels as mathematical cross-reference aliases if needed. Bring the arithmetic construction contracts into those numbered layers or give them unambiguous target references. Preserve every API and Check. Run the folder gate again; its target count must be positive and `target-ids` zero. The present failure prevents acceptance even though it is a style finding.

## R04 (P3) — Put the acceptance signatures in the roadmap namespace

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/Suggested.lean:40`: `namespace TauCeti.Weights`.

**Claim:** The two declarations are roadmap acceptance signatures, but they currently occupy the library namespace instead of the required roadmap namespace.

**Witness:** Elaborated names are `TauCeti.Weights.newformHeckePolynomial` and `TauCeti.Weights.newform_ramanujan`; the required namespace is `TauCetiRoadmap.WeightsInEtaleCohomology`.

**Repair:** Change the opening and closing namespace to `TauCetiRoadmap.WeightsInEtaleCohomology` and keep README references consistent. This needs no new definition or theorem. A scratch copy with only these two namespace edits was elaborated against the same pins; see validation below.

## Verified sound

This review read the full 868-line README and 64-line Lean file, the repository's normative README and CONTRIBUTING, and main-branch roadmap examples in `Completed/OrthogonalL2Bases` and `TauCetiRoadmap/EtaleCohomologyFoundations`. The head matches the requested full SHA. The diff outside this roadmap folder is empty. No worktree file was edited. There is no declared supplier gap, sorry-defined data, `set_option`, admitted example, algorithmic construction procedure, copied source passage identified, or import of another roadmap in the acceptance file.

The verdict has **4 findings: 1 P1, 1 P2 and 2 P3**. The mathematical examples below do not refute the headline theorem. The blocking defects are the declaration-level supplier drift and duplicated general comparison.

**Gate and dependency evidence.** The supplied gate reports one failure, `target-ids=1`; `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, and all remaining counters are zero. The dependency checker was independently run with the supplied order, content repository, roadmap name and movable setting. Its output was:

    depcheck: 209 roadmaps, 1472 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. All six layer `*Needs:*` lines and the supplier contracts were read. References to downstream Faltings and Lawrence–Venkatesh applications are consumers, not supply edges. The raw Hilbert-model construction at lines 785–789 precedes its arithmetic verification at lines 467–485; distinguishing those stages resolves an apparent coarse cycle. The new supplier proposed in R02 is earlier in the order.

**Source sample.** The brief's seeded sample supplied no target identifiers (“none found by heading”). I therefore did not claim to recover those missing identifiers. I used a reproducible replacement: collect non-Examples/non-Dependencies target `###` headings after line 121, then sample 15 with Python's `random.Random(int(full_head, 16))`. The selected starting lines are 138, 168, 204, 216, 232, 244, 371, 442, 499, 509, 587, 597, 631, 696 and 814. No README locator is explicitly marked unverified. Every selected target's accessible cited text was opened; unavailable primary texts are listed below. Nine reference-list works, Gros, and the two Stacks chapters were legally fetched through the sources service. Source numbering below refers to its line-numbered extractions, not search snippets.

| Sampled target | Text and locator verified | Hypotheses/convention checked |
| --- | --- | --- |
| 138, exceptional-set predicates | LV line 425, §2.3/Lemma 2.3, p. 9; WII line 695, §§1.2.3–1.2.7, pp. 154–155 | Unramified places, algebraicity and every complex conjugate; chosen-embedding purity is separate. |
| 168, operations | WII line 695, §1.2.5(ii), p. 154; LV line 604, §2.5, p. 13 | Subquotient purity; the README separately requires middle-term unramifiedness and rationality for integer-polynomial factors. |
| 204, continuous characters | WII line 695, §§1.2.3, 1.2.6–1.2.7, pp. 154–155 | Continuity alone does not force algebraicity or integral weight. The explicit construction uses the pinned profinite universal property. |
| 216, all embeddings | WII line 695, §1.2.6, p. 154, together with DWP §§0.5–0.6 | The reverse implication uses algebraicity forced by all embeddings, not an assumed algebraicity premise. Quartic computations appear below. |
| 232, representation/sheaf | WII §§1.1.13, 1.2.2–1.2.3, pp. 152–154; ECF §F.4.5 | Actual fundamental-group factorization, stable lattice and normal Noetherian domain; residue-degree powers retained. |
| 244, complex weights | WII line 4121, §§6.2.1–6.2.5, p. 247 | Shift raises and Tate twist lowers weight; smooth-lisse formula is not extended to arbitrary singular support. |
| 371, nodal comparison | C line 591, §§4.1–4.5, pp. 423–425; S line 1590, §8 Claim 5, pp. 37–38 | Geometric branches, descended graph action, and Carayol's residual A before cuspidal projection. |
| 442, correspondence traces | S line 1497, §8 Claim 4(1), pp. 35–36; Gros line 1483, II §4.1.7, p. 50; line 1509, II §4.2.3, p. 51; line 1545, II §4.2.12, p. 52 | Rational constituent correspondences first; then L-linear extension. Ordinary Frobenius polynomial equality does not imply correspondence-trace equality. Gillet–Messing remains unread. |
| 499, finite-field pencil | WI line 685, §§5.6–5.7, pp. 291–292, and §6.1, pp. 294–295 | A closed point of the parameter open may require a finite extension. Weight descent does not descend the pencil. |
| 509, radical and parity | WI line 715, §§5.8–5.9, pp. 292–293 | Radical quotient, odd alternating versus even symmetric pairing, and zero quotient. |
| 587, weight-two quotient | DFG line 2765, §5.4 Lemma 5.7, pp. 58–59; AV line 2365, I Remark 12.5, p. 56 | Rank two over the coefficient field; full abelian cohomology and its eigensummand have different rationality conclusions. |
| 597, hard Lefschetz | WII line 3047, Theorem 4.1.1, p. 217 | Smooth projective, ample class, invertible coefficient prime; restore arithmetic twist (a). |
| 631, Ramanujan | DM line 667, Theorem 5.1, p. 168, and line 745, Theorem 5.6, pp. 170–171; WII line 2986, §3.7.1, p. 215; DFG line 2765 | DM's earlier Weil input is conditional there; WII supplies unconditional purity. Normalize DFG by the finite character and keep its integral exclusions. |
| 696, Hilbert local comparison | S line 465, Theorems 0–2, pp. 10–13; line 690, Claim 2, pp. 15–17; line 1274, Lemma 3, pp. 30–31; line 1497 and line 1590, Claims 4–5, pp. 35–38 | g>1, parity, even-degree discrete-series condition, auxiliary projector/twist, degreewise traces, positive multiplicity, Frobenius semisimplification and monodromy grading. |
| 814, higher-weight model | DM line 667, Lemmas 5.2–5.5, pp. 168–170; Sch line 69, §§1.1.0–1.2.1, pp. 1–2, and line 173, §1.3.3, p. 3 | Full torsion-translation projector, r≥1, degree r+1, boundary comparison, separate weight-two branch. |

Additional locators opened include WI §§1.13–1.15 and 4.1–4.3; AV I Theorem 12.1 and II Theorem 1.1/Corollary 1.5; LV equation (3.2); S Lemma 4 and the §9 coefficient-isocrystal proof; DFG's character convention at line 520 and excluded-prime definition at line 555. StacksEtale line 1410 is tag 03PL (Kummer with invertible n); line 4438 is tag 0A3J (Artin–Schreier). StacksModels line 3574 is tag 0CDC, including the smooth n=0, regular n=1 and singular n>1 alternatives. Exact primary locators for the unread Mokrane and Gillet–Messing papers are not certified.

**Adversarial calculations.** These are separating examples and checks of formulas, not proofs of the future geometric constructions. The 76 rows cover the sampled targets, the README headlines, the construction contracts and all findings. “Retain” means that the displayed value agrees with the stated hypotheses and conclusion; it does not certify an unread primary source. Semicolons separate instances of the same statement.

| Statement / location | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Geometric Frobenius and Tate convention, 38–54, 125 | q=3; trivial line; Tate line | Arithmetic Tate eigenvalue 3, geometric 1/3; norm 1/3=3^(−2/2). Trivial eigenvalue 1=3^0. | Retain; inverse convention excluded. |
| Characteristic versus Euler polynomial, 46–50 | F=diag(1,3); rank 0 | P=X²−4X+3; T²P(1/T)=1−4T+3T²=det(1−TF). Rank 0 gives 1=1. | Retain. |
| Inertia-lift independence and conjugacy, 87–89 | Trivial inertia; S₃ permutation representation | Transposition polynomial (X−1)²(X+1); conjugate transpositions have the same polynomial. A 3-cycle and its inverse both give X³−1. | Retain; no commutativity assumption needed. |
| All-embeddings purity, 140 | q=3; roots 1, 1/3; their direct sum | Weights 0 and −2 individually; mixed norms 1 and 1/3 cannot equal one 3^(w/2). | Retain. |
| Integer-polynomial predicate, 142 | Trivial, Tate(1), Tate(−1) | X−1∈ℤ[X]; X−1/3∉ℤ[X]; X−3∈ℤ[X]. | Retain; no integral-roots/rational-coefficients conflation. |
| Chosen-embedding predicate, 144 | Scalar 3 under identity; scalar 1 | Weight-zero test gives 3≠1 and 1=1 respectively. | Retain. |
| Exceptional-set enlargement, 146 | One tested place moved into T | Before: scalar 3 fails weight 0; after removing the sole test, the universal clause is true. | Retain; uniqueness separately requires a surviving place. |
| Weight uniqueness, 146–148 | Rank 0; q=1; T all places; nonzero line at q=3 | Empty roots give P=1 and every weight; 1^(w/2)=1 for all w; empty place tests are true; at q=3, 3^(w/2)=1 forces w=0. | Retain the three explicit nonvacuity hypotheses. |
| Splitting field and embeddings, 144 | X²+1 over ℝ; characteristic-p field | Real-root test sees 0 roots, whereas splitting roots ±i have norms 1. No unital characteristic-p field embedding into ℂ exists. | Excluded by algebraic closure, characteristic zero and nonempty embeddings. |
| Exact sequences and purity, 170 | Unipotent 2×2 extension of two trivial lines | Frobenius eigenvalues 1,1 give weight 0; inertia matrix [[1,t],[0,1]] differs from identity when t≠0 despite both end actions being 1. | Retain middle-term unramifiedness. |
| Direct sums/tensors, 172 | Two weight-zero lines; Tate(1) tensor Tate(−1) | Sum roots 1,1 have weight 0; tensor eigenvalue (1/3)·3=1, weight −2+2=0. | Retain. |
| Dual, determinant and twist, 172 | H¹ of y²=x³−x over F₃ | Roots ±i√3 become their inverses, norm 1/√3; determinant 3 has weight 2; twist(1) divides each root by 3, giving weight −1. | Retain. |
| Exterior/symmetric powers, 172 | Two roots α,β with αβ=3 | Exterior-square root 3; symmetric-square roots α²,3,β², all norm 3. Exterior degree 3 has dimension 0 and polynomial 1. | Retain zero-rank convention. |
| Rational integrality, 174–178 | diag(√2,−√2); elliptic tensor square | Full polynomial X²−2; line factor X−√2 is nonrational. At q=3, tensor roots −3,3,3,−3 give (X²−9)²; its dual has constant term 1/81. | Retain rational-factor requirement and dual warning. |
| Restriction, 186–190 | Tate(1), residue degree 2 at q=3 | Eigenvalue (1/3)²=1/9; new cardinality 9 and weight −2 give 9^(−1)=1/9. | Retain. |
| Induction polynomial, 194–200 | ℚ(i)/ℚ, trivial character, p=3 versus p=5 | Inert: swap matrix gives X²−1=P_u(X²). Split: identity gives (X−1)². | Retain; f-fold product would fail the inert test. |
| Cyclic-block boundaries, 196–198 | f=1; rank 0; f=0 | f=1 gives det(X−A₀); rank 0 gives 1. f=0 is excluded by f≥1. | Retain. |
| Continuous-unit character, 206–212 | ℓ=3,u=2,q=5; ℓ=2,u=3,q=5 | Squared complex norms 4 and 9 are not 5^w for any integer w; both u are ℓ-adic units. u=ℓ has valuation 1 and is excluded. | Retain; unit/compactness condition discriminates. |
| Nonalgebraic character, 208 | Transcendental ℓ-adic unit u | Character sends geometric generator to u and its n-th power to uⁿ; algebraicity predicate is false. Chosen weight r=2 log_q abs(ιu) gives q^(r/2)=abs(ιu)>0. | Retain; chosen purity need not be algebraic. |
| Every-embedding test, 218–230 | X⁴−X³−X²−X+1 | t-values 2.3027756377 and −1.3027756377; roots from the second have norm 1, positive real root from the first is 1.7220838057. Mod 2: no linear factor and not divisible by X²+X+1. | Retain irreducible algebraic-unit counterexample. |
| Representation–sheaf transport, 234–240 | Constant and Tate stalk at degree 2 over F₃ | Stalk/local actions are 1=1 and 1/9=1/9; weights 0 and −2 relative to 9. | Retain actual π₁ factorization. |
| Complex shift/twist, 65, 244–262 | Constant smooth sheaf [1](1); F(N)[2N] | First weight 0+1−2=−1; second r+2N−2N=r. | Retain; duality convention agrees. |
| Invertible coefficient restriction, 40, 256–262, 613 | P¹ over F_p | For ℓ≠p, H² is rank 1 with eigenvalue p; constant p-adic étale H² is 0. | Retain exclusion ℓ=p; no fake Tate class. |
| Tate/H¹ variance, 276–288 | E:y²=x³−x over F₃ | Direct enumeration: 4 points, a=0. H¹ polynomial X²+3, Tate geometric polynomial X²+1/3. | Retain inverse-transpose convention. |
| Abelian good reduction, 292–301 | Same E; dimension 0 | H¹ determinant 3; Tate constant coefficient 1/3∉ℤ. Dimension 0 gives both polynomials 1, so nonintegrality fails there exactly as excluded. | Retain g>0. |
| Higher abelian cohomology, 298–299 | g=1, i=0,1,2,3 | Ranks 1,2,1,0; polynomials X−1, X²+3, X−3, 1. Weights 0,1,2 and vacuous 3. | Retain exterior-power comparison. |
| Smooth curve specialization, 303 | P¹; nonreduced thickening | P¹ ranks 1,0,1, weights 0,2 on nonzero degrees. Square-zero thickening has the same étale site but is not smooth. | Smooth-model hypothesis excludes the latter from this theorem. |
| Abelian point product, 315 | E over F₅, m=1,2; g=0 | a=−2: (1−α)(1−β)=1+2+5=8; at m=2, 1−(−6)+25=32. Empty product for g=0 is 1. | Retain. |
| Point-count estimate, 319 | g=1,q=5,m=1,2; g=0 | abs(8−5)=3≤2√5+1; abs(32−25)=7≤11; g=0 gives 0≤0. | Retain exact remainder coefficient. |
| Curve trace and Hasse, 321, 329 | E/F₅; P¹/F₃ | E: abs(a)=2≤2√5, Tate trace −2/5. P¹ at m=2: 10=1+9−0, error 0. | Retain. |
| Unpointed Jacobian comparison, 331–337 | Translation by nonzero point on E | Addition pulls x∈H¹ to x⊗1+1⊗x; restriction along translation gives x+0=x, same Frobenius polynomial. | Retain independence from chosen Abel–Jacobi point. |
| Trace recurrence, 339 | a=−2,q=5, m=0,1,2 | t₀=2, t₁=−2, t₂=4−10=−6; 25+1−t₂=32, independently enumerated over F₂₅. | Retain m≥2 on recurrence. |
| Proper trait comparison, 357–365 | Smooth proper P¹; nonproper affine degeneration | Special and generic ranks (1,0,1)=(1,0,1), vanishing contribution 0; nonproper case fails the proper hypothesis. | Retain actual nearby-cycle and coefficient maps. |
| Derived-limit condition, 363, 779 | Constant finite tower ℤ/ℓⁿ | Transition maps are surjective, lim¹=0 and limit ℤ_ℓ; rational limit ℚ_ℓ. | Retain separate verification for Carayol's nonconstant tower. |
| Nodal normalization, 375 | Split nodal genus-one special fibre | Graph H¹ rank 1, normalization H¹ rank 0, special H¹ rank 1: 1=1+0. | Retain. |
| Nodal specialization, 377–385 | Split and nonsplit multiplicative genus one | Generic rank 2=1+1. Split graded eigenvalues 1,q; nonsplit −1,−q; norms 1,q give weights 0,2. | Retain geometric branch action. |
| Carayol residual term, 383 | Constant specialization versus nonconstant cuspidal projection | A general residual A can have dimension a>0; after the specified cuspidal projection its dimension is 0. Constant graph calculation alone leaves a undetermined. | Retain the separate eigensummand theorem; no unconditional vanishing inferred. |
| Picard–Lefschetz sign, 393–410 | n=1 and n=3 | (−1)^(m+1)=−1,+1 respectively; δ self-pairing 0 in the odd alternating case. Replacing uniformizer by −uniformizer changes tame inertia character by 0. | Retain sign and prime-to-residue-characteristic roots. |
| Frobenius/monodromy, 403–405 | F=diag(1,3), N=E₁₂ | FNF⁻¹=N/3; N²=0; Nφ=3φN. With E₂₁, conjugation gives 3N instead. | Retain; wrong direction excluded. |
| Even variation, 399 | Reflection on a one-dimensional nonisotropic line | Reflection eigenvalue −1, square 1, and (reflection−1)=−2≠0 in characteristic-zero coefficients. | Retain separate even and characteristic-two geometric branches. |
| Crystalline E₁ formula, 419–423 | Smooth fibre; strict I₂ fibre | Smooth case has only a=0 and N=0. I₂: two components/two nodes, incidence rank 1; outer kernel/cokernel dimensions 1,1. | Formula passes; full primary Mokrane locator remains uncertified. |
| d₁ signs and reordering, 423 | Oriented two-edge cycle | Incidence columns can be (−1,1) and (1,−1), rank 1; reversing orientation multiplies a column by −1 and leaves kernel/cokernel dimensions 1. Consecutive oriented boundary gives 0. | Retain ordered signs and comparison under reordering. |
| Twisted N and weights, 423–429 | I₂ outer terms | Source has weight 2; twist(1) makes 0, equal to target weight 0; graph pairing is nonzero, hence an isomorphism between rank-one terms. | Retain; E₂ degeneration alone would also permit zero N and is insufficient. |
| Strict versus nodal models, 439–440 | I₁; xy=π²; displayed genus-two model | I₁ has one singular component and zero distinct-component intersections. Resolving xy=π² inserts one component. For genus-two equation at x=y=0, the π derivative is −24, a unit modulo 7. | Retain strict refinement; the regular total space does not make the original component smooth. |
| Correspondence orientation, 444–448 | Z=P¹, f=Frob₃ | Graph action f*: traces in degrees 0,2 are 1,3; alternating total 4 equals graph–diagonal intersection 4. | Retain graph orientation. |
| Identity and non-isolated fixed locus, 463 | P¹ identity; elliptic identity/inversion | P¹: χ=2=Δ². Elliptic identity: 1−2+1=0; inversion: 1−(−2)+1=4. | Retain intersection trace, not isolated-point counting. |
| Crystalline supplied Gysin/diagonal API, 450 | P¹ classes 1,h; identity composition | Δ=h₁+h₂ acts by 1↦1,h↦h; id∘id=id. Supplier has these clauses, but named declarations present: 0 of 3. | Mathematical identity passes; repair R01. |
| L-linear projector trace, 452–465 | A=[[0,2],[1,0]], a²=2, e=(I+A/a)/2 | A²=2I; e²=e; rank(e)=1; Tr(Ae)=a. Other embedding gives −a, not a common rational number. | Retain coefficient embeddings and nonrational trace. |
| Model and level contracts, 469–481, 783–798 | Unchanged versus changed p-level; completed unramified base | Equal local levels meet Lemma 4; unequal levels do not. Residue field of completed maximal unramified base is infinite, so no finite integer q=#k exists. | Retain separate finite-residue/local descent. |
| Common finite pencil field, 501–505 | A¹/F₂ minus {0,1} | 0 rational points over F₂, 2 over F₄. For weight 1, eigenvalue-power norm 2=(2²)^(1/2), recovering original norm √2. | Retain finite extension rather than rational point assertion. |
| Radical quotient, 511–519 | Symplectic plane, E one isotropic line; E=whole plane; E=0 | First radical=E and quotient dimension 0; whole-plane radical=0 and quotient dimension 2; zero case dimension 0, polynomial 1. | Retain quotient and no zero irreducibility claim. |
| Pairing parity and multiplier, 519–521 | Odd plane versus symmetric diag(1,1); q=2,d=2,e=1,n=1 | Alternating B(x,x)=0; symmetric B(e₁,e₁)=1. Arithmetic multiplier q^(den)=4. | Retain parity and residue-degree factor. |
| Original-coefficient openness, 527–533 | Sp₂(ℤ_ℓ) in Sp₂(ℚ_ℓ), then quadratic L | Local analytic dimensions are 3 inside dimension 3, but 3 inside dimension 6 after viewing in Sp₂(L). The latter cannot be open. | Retain original coefficient field. |
| Parabolic purity, 549–559 | k=2,12; constant sheaf on G_m | r+1=1,11 respectively. On G_m, H¹ has weight 2 while compact-to-ordinary image has dimension 0. | Retain image operation, lissity and smoothness. |
| Classical projector degree, 565–571, 804–811 | r=1,2,10 | Total degrees 2,3,11; fibre inversion projector kills H⁰,H² and keeps rank-two H¹ at r=1. At r=2 sign yields Sym² rank 3 rather than wedge² rank 1. | Retain full projector and separate r=0 Jacobian. |
| Torsion translations at the boundary, 812 | I₃ cusp, D=C₁−C₂ | D²=−2−2−2=−6; inversion sends D to −D, so odd projector keeps it; cyclic-translation sum of D is 0. | Retain translation average; inversion alone fails. |
| Hilbert degree/twist, 573–583, 704–710 | (g,w)=(2,2),(2,4),(3,3) | (q₀,b,weight)=(0,0,1),(6,2,3),(5,2,2); each q₀+1−2b=w−1. | Retain Hilbert rather than classical degree formula. |
| Weight-two eigensummand, 589–593 | Coefficient degree d=1,2 | Full H¹ ranks 2,4; each specified coefficient multiplicity rank 2. A degree-two coefficient factor can have trace √2 even when the product over embeddings has rational coefficients. | Retain separation of full polynomial and factor. |
| Arithmetic hard Lefschetz, 599–615 | P¹,d=a=1; a=0; d=0 | H⁰ eigenvalue 1 maps to H²(1) eigenvalue 3/3=1. a=0 gives identity; d=0 gives degree-zero identity. | Retain actual Chern class and twist. |
| Projector commuting with Lefschetz, 615 | H⁰,H² of P¹, projectors 1 and 0 | Cup product sends 1 to h≠0; projecting only its target yields 0, unlike cup after source identity. | Retain commutation hypothesis. |
| Hecke polynomial and Ramanujan, 635–651; Lean 45–62 | Δ, p=2,k=12 | P=X²+24X+2048; roots −12±4i√119 have squared norm 2048=2¹¹. Bound 24≤64√2≈90.50966799. | Retain both root equality and coefficient inequality. |
| Character normalization, 647 | Nebentypus value ζ, root multiplier ζ | Untwisted determinant ζ⁻¹p^(k−1); multiplying both roots by ζ gives ζ²ζ⁻¹p^(k−1)=ζp^(k−1), norm unchanged since abs(ζ)=1. | Retain DFG character twist. |
| Integral comparison exclusions, 649–680 | N=3,k=2, coefficient primes 2,5 | Nk!=6; 2 divides 6 and is excluded from integral comparison, 5 does not. Characteristic-zero étale realizations remain part of the family at both. | Retain distinct integral/étale domains. |
| Common-polynomial predicate, 657–666 | Trivial rank n=0,1,2; eigenvalues ±1 | Polynomials 1, X−1, (X−1)²; X−1≠X+1 despite both root norms 1. | Retain actual coefficient maps and uniform polynomial. |
| Common-polynomial operations, 657 | Lines with roots 2,3; dual line root 3; rank 0 | Sum X²−5X+6; tensor X−6; dual X(X⁻¹−3)/(−3)=X−1/3; rank 0 denominator P(0)=1. | Retain nonzero constant coefficient. |
| Fixed-form independence, 670–682 | Δ polynomial at λ not dividing 2 | Coefficients 1,24,2048 map to the same three rationals in every coefficient completion; weights alone allow ± traces and cannot prove this. | Retain independent geometric polynomial supplier. |
| Equivariant transport, 686–690 | Lines F=1 versus F=3; unipotent Jordan block | Equal vector-space dimension 1 does not give X−1=X−3. Jordan block has roots 1,1 but nonzero (F−1), square 0, hence is pure weight 0 without semisimplicity. | Retain intertwining; no purity⇒semisimple claim. |
| Degreewise Hilbert traces, 714–735 | Connected constant case q=3; nonconstant case | Constant outer traces 1,3 give t₁=4−t_alt. Nonconstant outer traces 0,0 give t₁=−t_alt. | Retain outer-degree theorem. |
| Alternating-trace ambiguity, 734 | Graded (A,A⊕B,B), scalar pairs (1,1),(2,1) | Alternating traces 1−2+1=0 and 2−3+1=0; middle traces 2≠3. | Retain degreewise isolation; alternating equality alone fails. |
| Hilbert shift sign, 720,735 | g=3,w=3 | q₀=5, b=2; converting total trace multiplies by −q^(−2n(σ)), not +q^(−2n(σ)). | Retain both sign and twist. |
| Hecke multiplicity, 737 | d=1,2 versus d=0 | Isotypic ranks 2,4; traces divide by 1,2. d=0 gives zero rank and cannot recover the multiplicity by division. | Retain d>0. |
| Monodromy-graded weights, 737–763 | N=0; rank-one N at w=2,4 | N=0 has only central weight w−1. Nonzero N gives outer weights (0,2) at w=2 and (2,4) at w=4; twist(1) lowers upper by 2. | Retain source-qualified monodromy theorem. |
| Finite-K semistable comparison, 822–834 | Good reduction; ramified Tate parameter π, e_K=2 | Good reduction N=0; Tate raw coefficient 1 versus normalized 1/2. Both satisfy Nφ=pφN, so the relation alone cannot distinguish them. | Formula passes; import earlier theorem, R02. |
| Ramified base change, 826,834 | E_p, ramification index 2 | Before: raw/e=1/1=1; after: raw/e=2/2=1. | Retain normalization and compatible descent. |
| Coefficient/projector base change, 824,832 | Quadratic two-point projector; extension L→L′ | e²=e stays e²=e after extension; image dimension 1 stays 1; trace √2 maps to its specified image, not necessarily a rational. | Retain model-specific extension after R02. |
| R01–R04 structural witnesses | Three supplier names; comparison owner; gate; namespace | Names found 0/3; earlier owner position 107<131; gate target-ids 1 versus required 0; actual namespace TauCeti.Weights versus required TauCetiRoadmap.WeightsInEtaleCohomology. | Apply R01–R04. |

**Pinned-library and duplication audit.** The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches were by objects (Frobenius, inverse transpose, cohomology, Gysin/diagonal, semistable comparison, projector, eigenform bounds), not just proposed names.

| Library declaration opened at the pin | File and line | What it supplies / limit |
| --- | --- | --- |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean:48` | A monoid homomorphism to linear endomorphisms; no continuity or arithmetic place data. |
| `Representation.subrepresentation`, `.quotient` | Same file, lines 313,329 | Invariant-submodule and quotient actions. |
| `Representation.ofDistribMulAction`, `.prod`, `.tprod`, `.dual` | Same file, lines 425,600,618,670 | Numerical action constructors; dual uses inverse action. These are already supplied and correctly imported in prose. |
| `LinearEquiv.charpoly_conj` | `Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean:75` | Conjugacy invariance on finite free modules with the section hypotheses. |
| `Matrix.charpoly_units_conj` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:283` | Matrix conjugacy, including finite empty index type. |
| `IsArithFrobAt.mul_inv_mem_inertia`, `.conj`, `.exists_of_isInvariant` | `Mathlib/RingTheory/Frobenius.lean:200`, 205,221 | Algebraic ideal-action facts; the existence theorem retains finite acting group, invariant algebra, prime ideal and finite quotient. |
| `TauCeti.zHat.existsUnique_lift` | `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean:163` | Continuous map sending a generator to any element of a compact totally disconnected topological group. No assumption that the target is procyclic. |
| `PadicInt.compactSpace_units`, `.totallyDisconnectedSpace_units` | `TauCeti/NumberTheory/Padics/PadicIntegers.lean:85`, 93 | The unit target used for the character example. |
| `Scheme.EllAdicCohomology` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75`, 78,83 | Integral pro-étale cohomology and additive structure, not the rational continuous Galois/Frobenius/comparison interface claimed missing by the docstring. |
| `HeckeRing.GL2.EigenformAwayFromLevel`, `.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84`, 104 | Actual cuspidal eigenform, nonzero condition, newness and a₁=1. No Ramanujan assumption. |
| `TauCeti.CoefficientField`, `coeff_mem_CoefficientField`, `char_mem_CoefficientField` | `TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48`, 61,131 | Native field and membership needed for the real-bodied polynomial. |
| Conditional Satake bound | `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:320` | Uses a Ramanujan bound as a hypothesis; it does not already prove the roadmap's unconditional theorem. |

The table's Tau Ceti paths refer to the library root; roadmap paths below refer to the roadmap repository. No declaration collision for either acceptance name was found in the pinned libraries, main roadmaps, board package material or the searchable open heads. Broad searches were supplemented with targeted `roadmaps grep` and `roadmaps show`, particularly for semistable comparison; R02 is the resulting ownership finding. The supplied open files for DeligneWeightsAndPurityPartII, EtaleDualityAndPerverseSheavesPartII and CstConjectureForDaggerVarieties were also inspected at the relevant object matches. Their generalizations do not replace the earlier finite-K owner.

**Cross-roadmap resolution.** The following supplier groups were opened and their cited objects resolved. For existing roadmaps the main copy was used; for new roadmap suppliers the open-head copy was used. No revised open copy of an existing roadmap was substituted for main.

| Supplier | Resolved contracts and witness locations |
| --- | --- |
| ArithmeticGaloisRepresentations | §§1.1–1.12, 2.1–2.6, 6.1–6.2: continuous arithmetic carriers and operations, local arithmetic Frobenius and Weil–Deligne data, Tate modules. Arithmetic/geometric inversion is explicit here. |
| DeligneWeightsAndPurity | §§0.5–0.7, 0.9, 0.11–0.15 (README lines 654–774), §§1.4–1.7 (959–1005), §3.1 (1194), §3.10 (1316), §8.9 (2497), §9.6 (3044), §10.1 (3177): numerical weights and transport remain with that owner. |
| LefschetzPencilsAndVanishingCycles | §2.8 (2137), §3.5 (2399), §4.4 (2629), §§5.4,5.8 (2865,2972), §§7a.1–7a.9 (3437 onward): actual nearby cycles, pencil descent, radical quotient, original-field monodromy and early curve/SNC maps. |
| AbelianSchemesAndArithmeticModuli | §A4.4 (1940), §§A6.10–A6.11 (2997,3025): equivariant H¹/Tate and exterior powers are distinct from integer endomorphism polynomials. |
| NeronModelsAndSemistableAbelianVarieties | §§5.0a–5.0c, 5.1: torsion specialization, arithmetic polynomial, geometric H¹ factor and Néron–Ogg–Shafarevich, with the local hypotheses. |
| EtaleCohomologyFoundations | §§F.0–F.7; §F.4.5 (1041), §§F.10.1–F.10.2b (1108 vicinity): normal Noetherian lisse equivalence with lattice, finite-level/adically realized base change, cycle/trace and Frobenius maps. |
| SchemeAndStackFoundations | Main README §§0.9 (848), 0.29 (1825), 2.15 (3867), 3.6 (4905): spreading, Frobenius, descent, and unpointed Picard/Jacobian objects. |
| InverseGaloisAndArithmeticFundamentalGroups | §IG.0.T1 (477), §IG.0.T3 (536): curve–Jacobian and all-power trace formulas. The resolver's `VanishingCycles.etaleTraceFormula` lead is supplied here; it is not a missing-contract finding. |
| EnhancedDerivedSheaves; DerivedModuleAlgebra | Main §§0.1–0.4 (429–492) and §1.T.1 (1403): derived tensor/limit inputs; the specified tower's hypotheses remain local work. |
| JacobianChallenge; EllipticCurves | Main Jacobian Layers D–F (218,332,448) and EllipticCurves Layer 3 (683): pointed Jacobian/polarization and existing Hasse theorem. |
| RepresentationTheory/CharacterTheory | Main Layer 3 (241), character projector at 246: finite-group averaging. Scholl's geometric group action and boundary identification are additional work. |
| ModularCurvesPartII | Layer 11; §§14.1–14.4a,14.11,16.1–16.4: model inputs, parabolic realization, pairing and weight-two quotient. Layer 12 is correctly treated as a consumer of degeneration. |
| AlgebraicModularFormsAndSerreWeights | README line 20 explicitly identifies R15.5A.1–R15.5A.2 with §§6.1–6.2. Those sections supply the primitive rank-two multiplicity and independent Hecke polynomial, including the scalar-Frobenius issue. No missing-alias finding. |
| StableReduction | Main Layers 4,5,7,8 (468,491,550,574): resolution, minimal regular model, semistable and stable reduction; stable contraction remains distinct. |
| CrystallineCohomology | §CR.3:duality.1 (7193); Gysin (7424), diagonal (7528); §§CR.6.1 (10028),6.2 (10449),6.3 (10592),6.5 (11097). Underlying contracts resolve; only the three names in R01 do not. |
| PadicDifferentialEquationsAndRigidCohomology | §RD.7.7: ordinary crystalline/étale Frobenius-polynomial comparison for the strata. It is not a theorem about all correspondence traces. |
| PadicPeriodRings; FiniteFlatGroupsAndIntegralPadicHodgeTheory | §§4.1–4.3 and §§R07.3.0, R07.4.27–R07.4.28: actual period rings, normalization and arithmetic realization/descent carriers. |
| GL2AutomorphicRepresentationsAndTransfer | §§R16.0.1, R16.3.1–R16.3.4 (400,881–917); §§R17.3.1,3.3,3.5–3.8 (1578–1651): local normalization, global transfer, multiplicities and coefficient models. Saito's specified cohomological comparison remains additional work. |
| ClassFieldTheory | Main Layers 11–12 (1683,1724): reciprocity and component class-field input to the constant-coefficient outer traces. |
| AInfCohomology; PadicHodgeTheory | AInf §§AI.6.4–AI.6.6 (2983–3590), especially normalized HK interface; PadicHodgeTheory §§8.1–8.2 (1384–1424): existing general comparison ownership, R02. |

The representation exceptional-set predicates and the arithmetic identifications extend the numerical owner rather than re-proving its spectral lemmas. Likewise, the classical Scholl boundary comparison and Saito-specific L-linear projector/degreewise-trace work are distinguishable from the supplied abstract projectors and plain Frobenius-polynomial theorems. The board package material and the named open-head object matches were included in this audit; this is not a claim that every unrelated open roadmap file was read in full.

**Headline coverage and Lean validation.** The README headlines are: arithmetic representation/sheaf and complex-weight comparisons; good-reduction abelian/curve purity and all-extension trace formulas; proper specialization, nodal and Picard–Lefschetz comparisons; crystalline weight spectral sequence and correspondence traces; Saito's structured period/model comparison; descended pencil and original-field monodromy applications; parabolic purity, classical/Hilbert projector realizations, weight-two quotient and arithmetic hard Lefschetz; newform Hecke-root purity/Ramanujan; fixed-form common polynomials; and the source-qualified Hilbert local compatibility and monodromy-weight theorem.

Only the newform polynomial/root/bound headline is statable on the pinned native carriers without building the missing geometric theories. It is stated. The module docstring names the remaining headline groups and the missing rational cohomology, specialization, nearby-cycle, HK/period, projector, pencil and Hilbert Galois/Weil–Deligne carriers. The numerical exceptional-set infrastructure is not a replacement headline. No free-Prop stand-in or sorry-defined data is used.

Direct `lake env lean` on the requested module completed successfully, with just the expected `sorry` warning on `newform_ramanujan`. The worker's targeted build also passed. A scratch copy with `#check @...` for **both** declarations elaborated: the definition retains N, `NeZero N`, k, f, the positive index and coprimality; the theorem additionally retains k≥2, primality, coprimality and the specified coefficient embedding. No hypothesis silently disappeared. The polynomial uses the actual coefficient-field membership proofs, integer exponent k−1, and real exponent (k−1)/2; the theorem's k≥2 prevents a negative Hecke exponent. Its statement does not assume its desired root bound.

The **one** admitted theorem was probed on a scratch copy with `simp [newformHeckePolynomial]`. It did not close: the root-norm and coefficient inequalities remained. Reading the native Newform definition and the conditional Satake result rules out a hidden Ramanujan premise or a one-lemma restatement. No padding finding is raised. The namespace-only repair copy also elaborated with the same sole expected warning; the two acceptance signatures require no mathematical change for R04.

## Not verifiable

- **Mokrane**, *La suite spectrale des poids en cohomologie de Hyodo-Kato* (1993), cited at README line 431 for the general crystalline weight spectral sequence. The sources service tried arXiv (HTTP 503) and DOI `10.1215/S0012-7094-93-07211-0` (publisher landing page without a retrievable PDF). Legal search found publisher metadata, not readable text. The README gives the whole article range, not an internal theorem/equation locator. Saito §8 and the I₂ calculations were read/checked, but do not text-certify Mokrane's full general filtered construction and all functorialities.
- **Gillet–Messing**, *Cycle classes and Riemann-Roch for crystalline cohomology* (1987), cited at README line 458. The sources service tried arXiv (HTTP 429) and DOI `10.1215/S0012-7094-87-05527-X` (no retrievable PDF link). Institutional metadata and an author publication list yielded no legal readable copy. Gros's cycle-class, proper-pushforward and proper-intersection passages and Saito's application were checked separately. No claim is made that the unread paper supplies every promised correspondence compatibility at the stated locator.
- These two texts were recorded together in the requested missing-reference record, preserving any previous entries. No source manifest exists in the reviewed folder, and this review did not create or edit one. The absent worker sample identifiers cannot be certified as checked; the explicitly documented replacement sample was checked instead. The review is complete rather than parked for these sources.

## Source issues

The source errors below were checked against rendered source pages as well as extracted text. They are not additional roadmap findings: the README already uses the corrected Frobenius and reciprocal-polynomial conventions and the correct DFG excluded-prime direction. The Gros proof issue concerns supporting background, not a counterexample to the correspondence-trace target.

- **Misprint** in S at §2, geometric Weil action before Theorem 1, printed p. 12 (S line 542): the source says Frobenius and monodromy commute with the positive-p factor in the opposite order, giving positive geometric Weil scaling; it should be Nφ=pφN and geometric conjugation scaling q^(−n); affects a stated result.
- **Misprint** in AV at Chapter II, Remark 1.6(a), printed p. 78 (AV line 3229): the source says the reciprocal factor P_r(t) is the characteristic polynomial of exterior-power Frobenius; it should be det(1−tF), with monic characteristic polynomial t^d P_r(1/t); affects a stated result.
- **Misprint** in DFG at Theorem 2.4, printed p. 24 (DFG line 1045): the source says S_N consists of primes not dividing Nk!; it should be the primes dividing Nk!, as already defined in §2, printed p. 13; affects a stated result.
- **Misprint** in Gros at proof of II Proposition 4.2.33, printed p. 56 (Gros line 1646): the source says a family in X×C producing codimension-r fibre cycles has codimension r+1; it should be codimension r in X×C, with proper intersection with the fibres; affects the proof.
- **Error** in Gros at II equation (4.2.36), printed p. 56 (Gros line 1662): the source says cup product with the P¹ hyperplane class is an isomorphism onto the whole displayed logarithmic cohomology group; it should be a split injection into the hyperplane summand; the other projective-bundle summand can be nonzero; affects the proof.

For the last error, take X=P¹ and r=0 over an algebraically closed field of characteristic p, at Witt length one: the source of the displayed map has dimension 1 over F_p, while H¹(P¹×P¹,Ω¹_log) has the two independent ruling classes, dimension 2. Pushforward along P¹ splits the hyperplane injection; injectivity is enough for the proof's intended reduction. For the preceding codimension slip, a section {x}×C of X×C with X a curve has codimension 1 and point fibres of codimension 1, not codimension 2 in the product.
