# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at c154465)

**Verdict:** accepted

Incremental re-review of the 19 lines changed since a546807 (`TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md`, §4.29 and §4.33). No finding.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: “Put A=k[u,u⁻¹] and B=A[v]/(v^p−du), a finite étale A-algebra of rank p … the fibre algebra is k[v]/(v^p−du), including k^p when du∈k×p … Apply (a) only to fibres for which this algebra is a degree-p field”.
- R02 — not repaired: deferred (D01)
- R03 — repaired: §4.33 now has four interface bullets (evaluation, guard vanishing, positive-parameter equivalence, the two degrees) and three Checks with the values 0, 64 and the guard zero at a=−1.

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| 4.29(c) family [review_source_15 lines 502–515, p.14] | k=ℚ, p=2, d=2, P=(x²−3)(x²−5); u=1, u=1/2 | Fibre algebras ℚ(√2), ℚ²; equations X²−2Y²=P, XY=P; dimensions 2, 2 | Constant fibre dimension p=2 of a rank-p étale norm family | Consistent; R01's dimension drop 2→1 is gone |
| 4.29(c) étaleness | v^p−du over A=k[u,u⁻¹], characteristic 0 | Derivative p·v^(p−1); v^p=du and p are units of B | Unit derivative, rank p | Finite étale as stated |
| 4.29(c) field/split dichotomy | ζ∈k; du∈k×p versus du∉k×p | k^p; degree-p Kummer field | (a) applied only in the second case, with Q,R rootless | Consistent with the hypotheses of (a) |
| 4.29 Check 1 [review_source_15 line 188, Prop. 2.2(ii)] | Split fibre u=1/2 above | XY=P(x)≠0, rational of dimension 2=p | k-birational to ℙ^p, Br X_u=Br k | Consistent |
| 4.29(c) against §4.30 | u∈k×p (class of (d)); u∈d⁻¹k×p (split class) | First: no degree-one cycle, u∉D₁, u∉N_v; second: rational fibre, u∈D₁ | k×p⊂E; split class is a nonpower class inside D₂ | §4.30's use of (b)–(d) unaffected |
| 4.33 Check 1 | a=b=1, t=0, u=(1,0,0,0), v=0 | Guards 2, 2; residuals 0, (−2)²−4=0; F=0 | 0 | Consistent |
| 4.33 Check 2 | Same with t=2 | Second residual 0−4=−4; F=4·16=64; with t for t−2u₁: 2²−4=0 | 64; wrong model gives 0 | Discriminates the trace shift |
| 4.33 Check 3 | a=−1, b=1, u=(1,0,0,0), v=(1,2,3), t=0,1,5 | F=0,0,0; without guards 2304, 2601, 1849 | 0 for every t and v | Discriminates the guards |
| 4.33 equivalence bullet | a,b>0 | Guards ≥a, ≥b, positive; (t−2u₁)²−4C−4=4((t/2−u₁)²−C−1) | Both residuals vanish; norms u₁²−B, traces 2u₁ and t−2u₁ summing to t | Consistent |
| 4.33 degree bullet | Monomial a²b²u₄⁸; a=b=10³, u₄=10⁶ | From A·A·(ab·u₄²)², coefficient 1; F/(a²b²u₄⁸)=1.000000002 | Total degree 2+2+8=12; (u,v)-degree 4+4=8 | Consistent |
| 4.33 against `twoUniversalIntegerPolynomial` and the source [review_source_14 lines 268–272, p.79] | Zero-based u₀..u₃, v₀..v₂ | Lean body: same A, B, C, guards and residuals | README display; source formula | All three agree |

Rows for untouched statements stand as in the previous review, of a546807.

- Source locators checked against the text: 3 (review_source_15 lines 502–515 for §4, p.14; line 188 for Proposition 2.2(ii); review_source_14 lines 268–272 for Step 1, p.79). The seeded sample falls in the changed text at §4.29 only.
- Library declarations opened: none new; the changed text names no library declaration and `Suggested.lean` is unchanged since a546807.
- Cross-roadmap citations: the diff adds or changes none; the worker's resolver lists one lead, `Diophantine.mrdp`, which is this file's own nested declaration.
- Gate: all checks pass at c154465 (worker's run, including the targeted build; my run of the text and dependency checks: OK); files outside the folder: 0; worktree unchanged.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and nothing else; the worker's elaborated signatures show 0 of 16 declarations with a lost binder.
- Dependency check output: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text: title and description read against this head; the change adds no section, declaration or supplier and removes none, and no sentence of the description is contradicted by it.
- `packages/LogicAndDefinabilityInNumberTheory/design/plan.json` is still absent, so D01 stands; nothing inside this folder can settle it.

Overlap check: the diff changes no ownership and adds no object; the overlap lists (ShimuraVarieties, StratifiedSpacesAndTameTopology, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, ArithmeticDynamics, ComputabilityTheory, ClassicalArithmeticCompletion) are unchanged from the previous review, whose result stands; nothing shared in the changed passages.

Source independence: changed passages only; 3 passages compared with 2 sources (review_source_15, review_source_14), none shared beyond the formulas the mathematics forces; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing in the changed passages. The items of the previous review (review_source_27, schneider, blr, hodges, and the waived vd_dr_tame, vd_dr_macintyre_marker, pila_wilkie, cl_addenda) are as they were.

## Source issues

- **Misprint** in review_source_15 at §4, p.14 (lines 505 and 509): the source calls the family a scheme over an undefined ring R and takes fibres over Spec R; it should be the ring A=k[u,1/u] just introduced; affects nothing.

## For the human reviewers

- The primary texts of Denef, Schneider and Bosch–Lütkebohmert–Raynaud remain uncertified; Hodges was unavailable through the legal sources service. The four recorded waivers were respected. The dominant source, Cluckers–Loeser, and its contents were readable at the previous review.
- D01 is open outside this folder: §2.10(c) rests on `gap:neron-pairing-perfect-finite-residue` (README line 77), which no `packages/LogicAndDefinabilityInNumberTheory/design/plan.json` registers.
