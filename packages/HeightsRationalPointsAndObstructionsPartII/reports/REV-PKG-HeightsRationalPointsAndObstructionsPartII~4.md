<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6400899092 -->
Review (codex) of 032c1a5

Verdict: needs_changes

1. **F01** (P2) Replace the pointwise lower bound by the quantitative small-point count

   **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:1021`, §5.12: “David–Philippon’s lower bound for the Néron–Tate height on the complement of the Ueno locus”.

   **Claim:** This input, depending on h₀ and degrees, supplies the small-point part of the explicit Rémond count. As written it asserts a lower bound on point heights without an exceptional set. If intended as a minimum outside finitely many points, neither those exceptions nor their quantitative bound is stated. Qualitative Bogomolov from the parent does not supply the necessary uniform numerical input.

   **Witness:** For a genus-two Abel curve C−w based at a Weierstrass point, X°=X contains six distinct 2-torsion differences of height zero. david-philippon-2002 line 115 bounds the number below a positive cutoff, allowing these exceptions.

   The source gives a quantitative finite-exception statement, followed by the bounded-height rank count: Theorems 1.2–1.4, printed p. 641, david-philippon-2002 line 115, line 122 and line 129. Its explicit final coset count on p. 643, line 183, agrees with the roadmap's displayed endpoint. The defect is the intervening mathematical input, not that endpoint.

   **Exact repair:** Replace this sentence by an explicit quantitative target within §5.12, in its existing principal Mumford-embedding setting. For g=dim A≥1 and D=deg_L X, set

   `Q=(2^(16g) h₀(A)^(2/g) D)^((4g²)^(dim X))`.

   State and plan to prove the following consequences of David–Philippon Theorems 1.2–1.4: at most Q points of X° have canonical height strictly below 1/Q; for every real a>1 and finite-rank Γ of rank r, at most `Q(5aQ)^(r/2)` points of Γ∩X° have canonical height at most a. Give the theorem/page locators, retain the finite exceptional points in the packing/counting argument, and connect this quantitative input to the large-point step. This roadmap owns this quantitative refinement; the parent's §5.17f minima and §5.18 qualitative Bogomolov do not state these constants. A source reference alone is not an imported formal theorem.

   Add the Weierstrass example as a negative control. With g=2, L=M¹⁶ and X=C−w, D=32 and Q=(2³²h₀·32)¹⁶=2⁵⁹²h₀¹⁶. Thus six height-zero points satisfy 6≤Q; the repaired count accommodates them, whereas a positive lower bound for every point does not. This also fixes an interpretation in terms of successive minima: the finite exceptional count is now explicit rather than implicit.

2. **F02** (P2) Moriwaki comparison is consumed beyond its supplier's hypotheses

   **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:1415`, §8.5: “Silverman–Tate are replaced by their Moriwaki versions (ArakelovGeometryAndAbelianHeightsPartII §§6.1–6.4)”. The statement at line 1411 assumes only a polarization B.

   **Claim:** The cited supplier comparison applies to every polarization allowed in GH Theorem A.3.

   **Witness:** `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md:1580`, §6.4, assumes B big for both parts. On the arithmetic model P¹ over ℤ, the trivially metrized trivial polarization of ℚ(t) is nef with volume zero, hence not big.

   For that polarization all Moriwaki intersections defining point heights vanish. A vertical point in a constant abelian family has X*=X and gives the valid target inequality 0≤c(1+0), but cannot instantiate the supplier's big-polarization premise. The source itself supports the broader theorem: gh-2019 line 2596 introduces an arbitrary polarization; Theorem A.3 at line 2603 and its proof at line 2611 use the comparison in that setting. Bigness is needed later for the specialization-limit argument in §8.6; that subsection correctly retains it. The present finding does not ask to weaken §8.5.

   **Exact repair:** Declare a narrowly scoped supplier gap, for example `gap:moriwaki-silverman-tate-nef`, owned by ArakelovGeometryAndAbelianHeightsPartII §6.4(1). Its needs sentence must extend the Silverman–Tate comparison to every nef Moriwaki polarization of a finitely generated characteristic-zero field: for a smooth irreducible quasi-projective curve base and the abelian scheme, symmetric relatively ample bundle and projective embedding specified in that section, with an ample comparison height on the base, require a constant C>0 such that

   `|ĥ^B(P)−h^B(P)| ≤ C max{1,h^B_base(π(P))}`

   for every algebraic point P. Keep the big-polarization assumption on the separate specialization-limit part §6.4(2). Add the same slug and exact needs to `design/plan.json`'s gaps, the README's supplier subsection, and §8.5's Needs line. Alternatively consume an already extended supplier statement if it becomes available, with its exact section. Do not introduce a second owner for Moriwaki comparison.

   The repaired contract evaluates to 0≤C on the witness and admits it. It also preserves the number-field case and leaves the unbounded-height argument of §8.6 under its necessary big hypothesis. Searches of current main/open-head roadmap text and the board supplier found no earlier arbitrary-nef comparison that eliminates this extension.

3. **F03** (P3) Remaining line locators point to headings or different statements

   **Locations:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:205`, §0.4; line 349, §1.7; line 818, §5.1; line 866, §5.3. Representative quotation: “dgh-2021 line 1473, Proof of Proposition 8.1, p. 34”.

   **Claim:** These line numbers locate the packing argument, generic locus, Euclidean norm and controlled coefficient estimates named beside them.

   **Witness:** dgh-2021 line 1473 is Proposition 8.1 on p. 31; packing starts at line 1601 on p. 34. ggk-2026 line 637 is a page header; the generic locus begins at line 646.

   **Exact repair:** Use the following verified replacements, preserving the theorem and version identification:

   - §0.4: ggk-2026 line 1496, proof of Theorem 7.1, p. 221; dgh-2021 line 1601, proof of Proposition 8.1, p. 34.
   - §1.7: ggk-2026 line 646, Lemma 3.5, equation (3.9), p. 203.
   - §5.1: dgh-2021 line 1600, proof of Proposition 8.1, p. 34; the existing GGK Appendix A locator may remain.
   - §5.3: dgh-2021 line 1536 for (8.4), and line 1541 for the argument through (8.6)–(8.7), pp. 32–33; ggk-2026 line 1480 for the comparison immediately before (7.3), p. 221.

   These passages were opened and checked: they give the internal-centre factor (1+2R/r)^ρ, the finite-stabilizer/generation conjunction, the square-root-height norm, and the two controlled height estimates. Keep dgh-2021 line 1473 in §6.9 and ggk-2026 line 1460 in §5.10: those correctly cite the statements themselves. This is the residual locator pattern from previous F04, not a failure to apply its three specified replacements.

Three findings: two P2 and one P3; two blocking. The four previous findings are repaired. The endpoint theorems survive this review, but two proof inputs need precise contracts at the stated generality. No package source file was edited.

## Verified sound

### Previous findings, checked before the new pass

The previous repair report marked all four findings applied; none was marked “not actionable in this package”. No settled refusal is re-raised.

| Previous item | Status | Repaired passage and independent test |
|---|---|---|
| F01, singleton height conflation | Repaired | §5.7 now says “is a singleton, so its intersection count is at most one” and distinguishes its Fubini–Study cycle height. On y²z=x³−2z³, P=[3:5:1] gives 25=27−2 and heights log5 versus ½log35. Difference ½log(7/5)>0. |
| F02, ample versus nef Siu input | Repaired | §2.6 now cites “ArakelovGeometryAndAbelianHeightsPartII §0.5”; its exact contract explicitly states the geometric two-nef volume inequality. On the degree-four elliptic graph with N=2 over a point, deg F=16 and deg M=0; vol(F−tM)=16>0. |
| F03, finite translate intersection | Repaired | §5.6 uses “E_j⊆Z_j:=X∩(X−c_j)” and bounds the union by sD². This is containment, not equality with at most r translates. For r≥2, sD²≤D^(i+3)≤D^(r+2)≤D^(2r); r=1 has i=0,s=1. |
| F04, three misplaced lines | Repaired | §0.2 cites “dmy-2026 line 879”; §2.8 cites “ggk-2026 line 783”; §6.11 cites “dgh-2021 line 1618”. The geometric observation, equation (4.6), and proof with Northcott at dgh-2021 line 1637 were read. R03 concerns different occurrences. |

For F03, if X° is nonempty then its stabilizer is finite. A positive-dimensional C_j contains c_j outside that stabilizer, so Z_j is proper and has total degree at most D². A finite union of these proper closed subsets is proper because X is irreducible. The case of fewer than r chosen points is contained in a hyperplane section; the r=0 and X°=∅ cases are explicit. The previous counterexamples now pass: for a genus-two theta curve the full translate intersection has dimension zero while each translate has dimension one; for X=[3]⁻¹Θ and L=3Θ, D=54 and the stabilizer has 81 points, accommodated by 54²=2916. A pair of distinct translates has intersection degree 162≤2916. The proof no longer requires the false intermediate bound 81≤54.

### Coverage, principles and form

Reviewed the current 108 numbered targets, their 108 Needs lines, and all 13 layer dependency lists. The working ledger has 108 target rows: 33 fresh computations for repaired or previously unrepresented targets, and 75 entries anchored to explicit computed rows from the previous review for unchanged material. The fifteen current samples, all repaired passages and headline families were additionally checked directly below. No earlier prose-only “sound” assertion was used as an adversarial check. The ledger distinguishes inherited tests from new calculations; substitutions are evidence against specific wrong models, not proofs of universal statements.

The 20 explicit definition/API blocks each have at least three Checks (range three to six). All 13 layers end with Examples and Dependencies. Main's ComplexTori and AdicSpacesPartIII supplied shape comparisons. The package retains the required Summary, ownership, conventions and supplier contracts. Metadata is math.NT. The mathematical statements paraphrase the sources; no copied source passage, computational algorithm, route-specific prime restriction, re-planned parent, sorry'd data or set_option was found.

The parent stops at qualitative Mordell–Lang, fixed-variety Bogomolov/equidistribution, and the foundational heights/trace interfaces. This Part II owns uniform counts, the geometric Bogomolov proof, and relative/global-field small-point theorems. Auxiliary prime-to-p torsion is used for smooth multisections, with orders 3 at p=2 and 2 at p=3; it does not restrict the endpoint's characteristics. Its existing four supplier gaps remain legitimate contracts. R01 and R02 concern precision of additional proof inputs, not scope rejection.

### Seeded source verification

All fifteen sampled targets were read in the supplied legal extractions, checking number, printed/manuscript page, hypotheses and normalization. The two settled uncertified works are recorded below; no other author-flagged unread locator was found in the package. No new source was fetched or added.

| Target | Passage actually checked | Outcome |
|---|---|---|
| §0.4 packing | dgh-2021 line 1601, proof of Proposition 8.1, p. 34; ggk-2026 line 1496, proof of Theorem 7.1, p. 221 | Internal centres and 0<r≤R match; line pointers need R03. |
| §1.2 relative restricted Hilbert scheme | ggk-2026 line 527 through line 597, §3.2, pp. 200–201 | Level four, universal twice-principal class, fourth power, fixed integral-fibre Hilbert locus agree. |
| §1.4 finitely many point conditions | ggk-2026 line 459 through line 525, Lemmas 3.1–3.2, pp. 199–200 | Nonempty parameter family and finite nonempty fibre retained; repeating a point handles larger powers. |
| §1.7 generic locus | ggk-2026 line 646, equation (3.9), p. 203 | Finite stabilizer and generation by differences are both present. R03 locator only. |
| §2.3 graph and bundles | dgh-2021 line 693 through line 722, §4.2, p. 15 | Graph closure and F=O(0,1,1), M=O(0,0,1) agree; no first-factor curvature inserted. |
| §4.8 new gap principle | ggk-2026 line 150, Theorem 1.2, p. 192 | Positive g,d, generating X, Ueno complement, bounded proper exceptional set and L⁺ retained. |
| §4.9 curve gap | yuan-2026 line 99, §1.1, pp. 3–4, especially line 113; GGK Theorem 1.2 | Genus-only constants, arbitrary base point on the curve and stable Faltings threshold match; principal height is half twice-theta. |
| §5.6 isolated fibres alternative | ggk-2026 line 1790, Proposition A.3 and proof, pp. 228–229 | Endpoint retained with non-strict degree bound; the replacement containment proof was independently checked instead of trusting the source's faulty intermediate assertion. |
| §5.8 large points | ggk-2026 line 1834 through line 1918, Appendix A.5, Step 1, pp. 229–231; dgh-2021 line 1517, pp. 32–33 | Large-height cutoff, finite rank, isolation and induction agree. Controlled embeddings are explicitly supplied by the declared gap. |
| §7.3 dense small points | xy-2022 line 78 through line 105, §1.1 and (1.4), p. 3 | Every positive ε, geometric trace, polarized function-field height and Zariski density agree. |
| §8.6 characteristic-zero constants | gh-2019 line 2625 through line 2677, Appendix A.3, pp. 56–57 | Big polarization is chosen for the reduction; positive minimum and constant extension are distinguished. R02 concerns the separate §8.5 comparison. |
| §9.13 conditions (a)–(d) | xy-2022 line 841 through line 874, §5.1, pp. 22–23 | Curve field, abelian-scheme reduction and trivial geometric trace hypotheses agree with the reduction. |
| §9.19 full geometric Bogomolov | xy-2022 line 101, Theorem 1.1, p. 3 | Arbitrary characteristic and positive transcendence degree retained; special includes the trace term. |
| §10.5 five non-degenerate maps | yuan-2026 line 3335 through line 3376, Theorem 4.17, pp. 98–99 | Thresholds d,d+1,d+g,d+1,d+g, positive powers, maximal variation, and the universal-shift sign agree. Removing [2g−2] uses a finite isogeny, including when inseparable. |
| §11.5 function-field moduli heights | yuan-2026 line 2657 through line 2739, §4.4.2, pp. 79–81, particularly line 2684 | Non-isotrivial closure degree at least one, the nonnegative theta height, Hodge/Faltings normalization and finite-extension division agree. |

### Computed adversarial table

This table records the sampled targets, repaired mathematics, findings and headline families. The remaining unchanged computed rows from round 3 are inherited only as described above; the scratch ledger also records the newly reviewed previously unsampled targets.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| Native curve/group carriers | Empty scheme; Spec k[ε]/ε²; nonabelian S₃ | Empty has 0 points; ε≠0 but ε²=0; in S₃, (12)(23)≠(23)(12) | Nonempty smooth geometric-integral curve and native commutative abelian-variety group exclude these wrong carriers. |
| Absolute point/cycle conventions; repaired §5.7 | [2:1]; cubic [3:5:1] | log2 versus ½log5; log5 versus ½log35; 0<½log(7/5)<½log3 | Distinct height conventions retained; singleton count is 1. |
| Field-extension conventions | [2:1] over ℚ(i); [1:1/(t²+1)] over ℝ(t) and ℂ(t) | Relative 2log2 divided by2 gives log2; pole weight2 becomes total4 over fixed ℝ, divided by2 gives2 | Degree weights and fixed constants retained. |
| §0.1 total degree | Line with exterior/interior point; empty set | 2=1+1; 1<1+1; 0 | Reduced total degree does not double-count contained components. |
| §§0.2–0.3 escape | Two distinct points on P¹, diagonal in its square | Square cardinal4; diagonal cardinal2; 2 off diagonal. Singleton square has1 on diagonal | Positive power and properness substantive. |
| §0.4 packing | Dimension0; empty; interval [−r,r],R=r>0 | 1≤1; 0≤1; internal cover1≤3 | At r=0 interval needs infinitely many balls, so positive denominator required. R03 only. |
| §§1.1–1.2 Hilbert normalization | Elliptic curve; genus-two Abel curve; double point | Lg⁴ degrees8 and16; double point length2 versus reduced point length1 | Fixed-degree integral locus excludes nonreduced fibres; principal-to-level factor is8. |
| §§1.3–1.5 point conditions/powers | E×{b} in E², P=(0,b₀); curve fibres over curve | Parameter fibre {b₀} has cardinal1, repeated point retains1; relative square dimension3 versus absolute4 | Finite-fibre and relative-product conventions agree. |
| §§1.6–1.8 generic locus | E⊂E²; E²; genus-two Abel curve | Generated dimensions1,2,2; stabilizer dimensions1,2,0; only third meets both tests | Generation alone or finite stabilizer alone is insufficient. R03 locator only. |
| §§2.2–2.6 graph/Siu | Fixed E, embedding degree4,N=2,S point | deg F=16,deg M=0; volume16≥16>0; after denominator2, degree32 | Repaired two-nef supplier fits. Torsion section instead has top Betti integral0, failing positive κN². |
| §§2.7–2.8 height inequality | c₁=c₀=1,N=2; torsion section | 1−1/4=3/4≥1/2; on section 0 cannot dominate unbounded positive base height | Non-degeneracy retained, no division by point height. |
| §§3.1–3.2 family measure | Fixed E,degree D,graph of [2ⁿ] | Graph degree(1+4ⁿ)D; scaled limitD; normalized massD/D=1; orbit average of1=1 | Normalization excludes zero or arbitrarily scaled measure. |
| §§3.3–3.5 uniform Bogomolov | Torsion coset; averaging over stabilizer of order2 | Infinitely many height0 points on coset but X° cardinal0; weights½+½=1 | Ueno complement and finite averaging matter. |
| §3.6 and Lean Manin–Mumford | Translate by c=−a(Q); genus1; genus2 Weierstrass points | a(Q)+c=0; wrong sign gives2a(Q); genus1 torsion infinite; genus2 has at least6 | Correct translation, positive genus restriction g≥2 and genuine uniform count. |
| §4.3 curve distance | g=2,M=4,c=1,h=8,c′=1 | Required sum≥7; four values≤h/(2M)=1 give sum≤4 | Height-escape contradiction works. |
| §4.4 height gap | S point,H=1,c′₁=1,c′₃=2 | Threshold−1, heights≥0, selected set empty of degree0 | Base case works without ampleness of pulled-back moduli line. |
| §4.7 merge height ranges | c′₁=2,c′₃=3,c″₃=1,B=3,c₁=1/3 | H=4:5≥4/3; H=2:2/3≤1 | One range per A; maximum of degree constants suffices. |
| §§4.8–4.9 new gap | X=A; genus-two curve; principal height1 | X° empty count0; proper curve exception dimension0 and count=degree; twice-theta height2 | Generation, Ueno complement and factor2 retained. |
| §§5.1,5.3 norms/embeddings | h(P)=1; torsion; coordinate change diag(T,1) | Pairing(4−1−1)/2=1; torsion height0; naive log T unbounded for uncontrolled coordinates | Finite-rank Euclidean quotient and controlled choices retained. R03 locators. |
| §§5.4–5.5 Vojta/Mumford | r=1,m=2,D=3,n=2; diagonal in subgroup | c₁=c₂=20736^4096; orthogonal pairing0<1−1/c₄ for c₄>1; difference0 with positive-dimensional fibre | Cone and isolated-fibre hypotheses discriminate. |
| §5.6 repaired containment | Theta curve; [3]⁻¹Θ with L=3Θ; r=2,3 | Intersection dimension0 versus translate1; 81>54 but81≤2916; exponents D⁴≤D⁴,D⁵≤D⁶ | New containment proof avoids old false equality/degree claim. |
| §5.7 positive-dimensional interpolation | g=2,deg A=6,D=3,r=1 | Cutoff6·9/2=27; prefactor(3+1)²·3=48; additive3log3 | Formula and explicit gap agree. |
| §5.8 large points | Rank0 torsion; c₄=2,M=2 | Count above positive threshold0; (1+1/2)²=9/4≥2 contradicts demanded ratio<2 | Growth/isolation step retains its premises. |
| §§5.9–5.11 packing/count | c₁=1/4,c₃=2; Γ={0} enlarged by a torsion difference | Correct c₀=4 gives cutoff1/4, old choice2 gives1/2; translated count can grow1→2 | Reciprocal cutoff and subgroup dependence retained. |
| §5.12, R01 | Genus-two C−w, L=M¹⁶ | Six torsion heights0 versus any positive lower bound; D=32,Q=2⁵⁹²h₀¹⁶,6≤Q | Replace pointwise bound with quantitative exceptional-point count. |
| §§6.1–6.5 specialization/rank | Constant coset; Legendre P=(2,μ), μ²=2(2−λ); denominators2,3 | Ueno complement0; at λ=2,2P specializes to0 although generically nonzero; finite subset lies in (1/6)Γ of same rank | Good specialization and finite generation used where necessary; no End-stability rank inflation. |
| §§6.6–6.8; Lean Mordell–Lang | One abelian coset; ρ=0,s=∅; rank1 | Coset count1 may contain infinitely many points; positive power into{1} means torsion; exponent gives B² at rank1 | Coset and point counts distinguished; n=0 is excluded. |
| §§6.9–6.11 height ranges | R/r=2,rank after enlargement2; roots of unity | Cover bound25; after discarding e exceptional points total≤25c₄+e; all root heights0 with unbounded degrees | Height cancellation and bounded-degree Northcott are distinct inputs. |
| §6.12; Lean rational points | ℚ and ℚ(i), fixed g; ranks0,1; empty | Same B(g), bounds B and B²; empty cardinal0 | Field degree does not enter uniform constant. |
| §§7.1–7.3 minima/small points | Point height a; curve; constant infinite-order point | Point minimum=height=a; curve a/2≤height≤a; constant point height0; trace-free positive point excluded at ε=a/2 | Normalized canonical height differs from projective cycle convention; trace retained. |
| §§7.4–7.5,8.4 special varieties | Constant genus-two curve in constant J | Dense constant points all height0; trace dimension2 contains curve dimension1 | Special does not mean torsion coset alone. |
| §§8.1–8.2 trace hypotheses | Constant E over k(t); diagonal in E×E | All n-torsion has degree1 and size n²; diagonal dimension1, product with both full projections dimension2 | Geometric trace-zero excludes both wrong-model counterexamples. |
| §§8.3–8.5, R02 | Vertical point; torsion section; trivial Moriwaki polarization | b≤max(1,b); unbounded n≤c fails on section; nef polarization volume0 and heights0 yield0≤c | X* handles section; supplier's big premise still excludes allowed §8.5 data. |
| §8.6 constant extension | Curve minimum a=1; constant field extension | 1/2≤height≤1; height unchanged by constants extension; zero height forces minimum0 | Both minima inequalities and big-polarization reduction agree. |
| §§9.1–9.9 descent | Constant E, Legendre; k(u),k(v)⊂k(u,v) | Minimal transcendence degrees0,1; intersection k has degree0, each pencil field degree1, ambient degree2 | Two independent constant fields are necessary. |
| §§9.10–9.11 multisections | Zero section; Legendre (0,0); elliptic L of degree2,base divisor degree3 | Orders1,2 and degrees1,1; intersections6=2·3; degree-d multisection gives(2/d)·3d=6 | Exact order, flat curve base and numerical coefficient agree. |
| §§9.12–9.13 reductions | Everywhere-good trace-free A; constant A | Torus rank0,trace dimension0,trdeg1; constant quotient dimension g−g=0 | All four reduction conditions and zero quotient boundary retained. |
| §§9.14–9.18 sum induction | Subgroup; genus-two Abel curve; point; E² nef bundles | Stabilization lengths1,2; point sums dimension0; ML=1≤L²=2, (M+L/2)²=3/2>0 while M²=0 | Dimension descent and non-strict nef limit work. |
| §9.19 geometric Bogomolov | Constant curve, torsion coset; p=2,3 | Both special heights0; prime-to-p torsion sizes3^(2g),2^(2g) | Trace term and all characteristics retained. |
| §§10.1–10.4 small points/potential bigness | Three vertical fibres in C²; E with degree-one L,m=1 | codimension1,degree3 gives3≤3; sqrt3 would fail; top degree1>0, zero power excluded | Grid exponent and positive-power conditions discriminate. |
| §10.5 five maps | dim S=0,g=2,m positive | Thresholds1,1,2,1,2; τ₂=(2x₁−ω+y,x₂−x₁); tail isogeny[2] has degree16 on J | Signs and inseparable-isogeny removal agree with supplier maps. |
| §§10.6–10.8 relative Bogomolov | Zero section; two factors; arithmetic base point | Height0 everywhere on zero section; ε/4+ε/4=ε/2<ε; arithmetic thresholds1,2,3,2,3 | Product cutoff and arithmetic increment exclude dense-small boundary case. |
| §§11.1–11.4 pair/shift | Constant curve with constant/varying α; y=ω−2α,g=2 | Moduli closure dimensions0,1; 2x−ω+y=2(x−α); twice-theta height8 times principal height | Non-isotrivial pair and shift sign correctly matched. |
| §11.5 function-field domination | Closure degree N=1,theta/Faltings heights0; degree2 extension | Moduli degree≥1; raw2 divided by2 remains1; constant closure N=0 excluded | No loss of the positive additive term or extension normalization. |
| §§11.6–11.7 global-field endpoint | p=2,3; hFal=−C,c₃=C+1 | Levels3,4 have gcd1; hFal+c₃=1 | No bad-prime exclusion; height lower bound absorbed uniformly. |
| §§12.1–12.4 bielliptic endpoints | Two fourfold lifts; projection heights2a,2b; image order N | Lift count≤4·4=16; polarization height(2a+2b)/2=a+b; N divides ord(w), so ord(w)≥N | Uniform counts coexist with unbounded torsion orders; height normalization agrees. |

### Ownership and resolved suppliers

The content checkout is main at `a8132fb235144b25aba003881cc74e35d7d15f36`. The manifest pins checked are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches used the supplied `roadmaps grep` and `roadmaps show` service for main/open heads, the board package index and board sources, and rg at both library pins. Terms included Ueno, geometric Bogomolov, restricted Hilbert, potential bigness, Moriwaki, quantitative David–Philippon, abelian point groups and canonical heights. No second declaration of the three fully qualified Lean names was found. The K3 restricted-Hilbert object is a different geometric locus.

The table records the current supplier bodies read, not remembered target numbers. All README supplier families and their Needs occurrences were reconciled with these contracts. R02 is the remaining generality mismatch.

| Object and owner | Resolved sections / evidence |
|---|---|
| Qualitative heights, trace, Ueno, counting | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md`, §§0.10–0.12,0.16–0.35,1.7–1.11,5.1–5.19. §0.21 has the unhalved pairing; §5.9b has Fubini–Study cycle height; §§5.4a–b and5.13c give bounded directions and their finite étale models. §§5.17f–5.18 are not R01's quantitative count. |
| Chow, intersections, pencils and Hilbert foundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§0.3,0.8,4.11,4.13–4.14,5.1–5.6,5.12. For example 4.14 at5706 requires a Noetherian projective setting; 5.2 at6653 retains residue degrees and flat-pullback multiplicities. |
| Hilbert/Chow carriers | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`, §§1.5–1.6,2.1; `boundedDegreeHilbertPolynomials` requires reduced equidimensional fibres, as used here. The new locus is a restriction of that carrier. |
| Fine abelian moduli | `TauCetiRoadmap/PELModuli/README.md`, M5.1–M5.3,M6.9–M6.10 (Hodge descent at3979 and arithmetic export at4011). Level four is used in characteristic zero; fixed pairing retains the cyclotomic base. |
| Abelian geometry | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A1–A3,A6; especially A2.7 positivity, A2.8 controlled presentation, A2.9 normalized nef bundles over curves. General-base positivity does not rely on a curve-only nef assertion. |
| Betti maps and generic specialness | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md`, B0.1–B0.2,B1.1–B1.5,B2.3,B2.13,B2.21–B2.23,B3.7–B3.9,B4.2–B4.6. Geometrically integral generic fibres and the dominant special-locus convention are retained. |
| Analytic intersections | `TauCetiRoadmap/ComplexComparisonPartII/README.md`, C5.4, `chernFubiniStudyIntersection` at3357 and `dghIntegrationApplication` at3376. Integral of normalized curvature over a line is1; the DGH export explicitly uses O(0,1,1), a base cutoff and a closed curvature representative. |
| Faltings and embedding comparisons | `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md`, §§2.7,3.4,4.2–4.4,5.5–5.8,6.3. Fixed coordinates and bounded field degrees are retained; the general controlled-embedding estimate is a declared gap. |
| Adelic, Moriwaki, potential-bigness interfaces | `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md`, §§0.5,3.1–3.3,4.7–4.9,5.1–5.5,6.1–6.4,8.4,9.1–9.2,12.1–12.6,13.1,13.7. §0.5 at294–321 repairs F02. §6.4 at1576–1600 exposes R02. Product-grid codimension and restriction-to-subvariety potential bigness are explicit. |
| Curve-level moduli | `packages/StableReductionPartII/design/README.md`, MC.4's full level, rigidity and fine scheme; MC.6's Torelli and Hodge pullback; MC.7's DGH and Yuan exports. All seven cited names were found and read. |
| Jacobians, theta and five maps | `TauCetiRoadmap/JacobianChallengePartII/README.md`, §§0.2–0.4,1.1–1.4,2.1–2.7,3.2–3.13,5.1–5.6,7.1–7.2. Theta rigidification and universal shift agree. `TauCetiRoadmap/JacobianChallenge/README.md:448`, Layer F, gives the native pointed Albanese universal property. |
| Reduction and tropical measures | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`, §§1.1–1.10,3.10,3.13–3.14,5.1–5.2; `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md`, §§6.2–6.4,7.0. The declared gap extends these to the required abelian canonical measures and strict supports. |
| Specialization and curves | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`, IG.2, including Hilbert subsets at1880; `TauCetiRoadmap/AlgebraicCurves/README.md`, Layers10–11, with characteristic-zero Hurwitz bound at1067. No wild-characteristic Hurwitz bound is consumed. |
| Elliptic quotient dynamics | `TauCetiRoadmap/ArithmeticDynamics/README.md`, §§6.57–6.64,6.93,6.110–6.112. Elliptic degree-one height is half projection height; bounded common images and unbounded orders are separate inputs. This package owns the genus-two lift. |

Arakelov Part II and StableReduction Part II are earlier, readable board designs; the resolver's missing indexed Arakelov citation is not evidence of a nonexistent owner. No comparison to an unavailable external head is asserted. Other ownership searches used the provided indexed main/open-head service; no additional pull requests were independently sought.

### Pinned declarations opened

| File and line at the pin | Actual interface checked |
|---|---|
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`,118,144,281 | AbelianVariety bundles properness and geometric integrality, supplies dimension/commutative points and native baseChange; no polarization or height field. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` | IsAlbanese requires base point mapping to identity and unique pointed homomorphism factorization. It does not assert that the source is a curve; signatures impose that. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61` | IsIsogeny is finite surjectivity, with no separability restriction. |
| `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58` | MonObj.Hom.group is the actual point-group law; inversion is composition with the inverse morphism. |
| `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74`,288,351 | Internal covering number; maximalSeparatedSet is empty at infinite packing number; coveringNumber_le_packingNumber. The package proves finiteness before selecting centres. |
| `Mathlib/Topology/MetricSpace/MetricSeparated.lean:43`; `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:418` | Separation is strict ε<edist, closed ball uses dist≤radius. Pseudometric balls of radius zero need not be singletons; Euclidean ones are. |
| `Mathlib/Analysis/InnerProductSpace/PiL2.lean:111`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:500` | EuclideanSpace is PiLp 2; Haar ball scaling has the finite-dimensional real and Borel hypotheses and nonnegative radius. |
| `Mathlib/NumberTheory/Height/Projectivization.lean:51` | logHeight lifts the admissible-family height; absolute number-field degree normalization is additional. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | finrank is Cardinal.toNat of rank, so infinite rank can give0; trdeg is cardinal valued. Explicit finite-rank assumptions prevent that junk value. |
| `Mathlib/FieldTheory/IntermediateField/Basic.lean:52`; `Mathlib/LinearAlgebra/Span/Defs.lean:46`; `Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean:87` | IntermediateField extends Subalgebra with inverse closure; span is the least containing submodule; reduced row echelon fixes pivots. These do not supply abelian isogeny-class descent. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:24`,285,378; `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Limit.lean:77` | Full x-height limit, quadratic n² scaling, halved pairing and limiting characterization. Degree-one geometric height used here is half the full x-height. |

Object searches did not find the general adelic-height, Ueno-degree, trace-special or relative-potential-bigness carriers necessary for the other headlines at these pins. Their planned interfaces have the owners listed above. The three Lean endpoints use native objects rather than arbitrary scalar or Prop substitutes.

### Declared gaps and dependency check

All four existing gaps match their slugs and needs in `design/plan.json` and the README, with named suppliers. They are precise missing extensions and not findings:

| Slug | Minimality and computed boundary |
|---|---|
| flat-nonproper-intersection | Adds the dominating-component inequality under the finite smooth jump-locus condition to SchemeAndStackFoundations. For B=P¹×P¹→P¹,X=B,V=point, both sides equal the fibre class with multiplicity1 and e=1. |
| arithmetic-interpolation | Parent cycle heights do not include this quantitative containment criterion; g=2,deg A=6,D=3 gives cutoff27 and prefactor48. |
| controlled-polarization-embeddings | Existing height comparisons lack the requested joint uniform cNT/coefficient control with all polarization rescalings; O_E(2·0) has h⁰=2 and degree-two map, O_E(3·0) has h⁰=3 and cubic embedding. |
| abelian-tropical-measures | The four linked interfaces concern one abelian canonical-measure construction; they add exactly the valuation, normalized alteration measure, strict support and small-net pushforward needed here. Torus ranks0,1 give point and circle, with probability mass1 in each case. |

Ran the prescribed dependency check with this roadmap name, ORDER.txt and --movable. Exit0; exact output:

```text
depcheck: 55 roadmaps, 627 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. R02 concerns the hypotheses of an existing edge and is not detectable by this graph check. The proposed additional gap is owned by the same earlier supplier.

### Headline coverage, elaboration and padding

The README's headlines are: DGH height inequality and adelic comparison (§§2.7–2.8); family equidistribution, uniform Bogomolov and Manin–Mumford (§§3.2,3.5–3.6); the new gap (§4.8); quantitative Vojta/Mumford and Rémond counting (§§5.4–5.5,5.10,5.12); finite-rank Ueno count, uniform Mordell–Lang and rational points (§§6.5,6.7–6.8,6.12); Gao–Habegger and constant extension (§§8.4,8.6); Yamaki reduction and full geometric Bogomolov (§§9.12,9.19); potential-bigness small-point bounds, five-map non-degeneracy and relative Bogomolov (§§10.1,10.3–10.5,10.7–10.8); Yuan's global-field theorem (§11.7); bielliptic small-point counts and unbounded orders (§§12.2–12.4).

Suggested.lean states the three statable native-carrier endpoints: uniform_maninMumford_curves, uniform_mordellLang_curves, uniform_rationalPoints_curves. The module docstring names the other headline families and the missing carriers/interfaces. The bielliptic Manin–Mumford consequence is covered by the genus-two specialization of the first endpoint. Packing and linear-algebra descent are supporting results and are correctly absent from this acceptance file. No missing statable headline or stand-in was found.

Ran `lake env lean` on the package's Suggested.lean from the pinned content checkout, with the tool's absolute argument as required. Exit0, exactly three warnings, all declaration uses sorry at lines57,75,96. The used Tau Ceti object file already existed. No broad build, update or cache operation was needed or run.

Elaborated a scratch copy with `#check @name` for every one of the three declarations. Compared the full signatures with README §§3.6,6.8,6.12: field/NumberField, algebraic closure and characteristic, smoothness, properness, geometric integrality, dimension one, base point, pointed Albanese, J.dim=g≥2, translation and positive-power finite-rank conditions all survive. B is quantified before the field, and no field-degree parameter enters the rational-point constant. No lost binder or signature change was found.

A separate scratch copy tried simp, rfl and infer_instance on each theorem, with a solved-goal guard preventing a nonclosing simp from suppressing later tests. All three tactics failed to close all three theorems. Searches for the objects and conclusions found no direct pinned lemma proving these uniform bounds. Thus no declaration is one-tactic padding, a definition restatement or a boundary-case Check. The file has one Mathlib import, one used Tau Ceti import, three theorem declarations, three admissions, zero definitions and no set_option. All Lean processes completed.

## Not verifiable

- **remond-2000-decompte:** settled uncertified; the original Décompte text, including Proposition3.3, was not available legally in the supplied material. Its GGK restatement was read; the replacement proof in §5.6 was checked directly and no longer relies on the erroneous GGK intermediate assertion. No repeat request was made.
- **david-philippon-2007:** settled uncertified; Theorem6.8 and (6.41) were checked through the available GGK restatement, not the original text. The separate David–Philippon2002 theorem and explicit p.643 formula were read. No repeat request was made.
- **Unprovided external heads:** ArakelovGeometryAndAbelianHeightsPartII and StableReductionPartII were checked in their actual earlier board designs. Ownership against an unavailable external head of either was not checked. The supplied main/indexed open heads and board package index were searched; no claim is made about unprovided work.

No outstanding new missing-reference request remains. The sources manifest was unchanged.

## Source issues

- **Error** in ggk-2026 at Proposition A.3 proof, printed pp. 228–229, line 1817: the source says the translate intersection needs at most dim X members and has degree at most D^(dim X); it should be replaced by a containment argument allowing stabilizer degree81 when D=54; affects the proof.
- **Gap** in ggk-2026 at Proposition A.3, printed p. 228, line 1794: the source says the final degree inequality is strict; it should be non-strict on the displayed Bézout estimate unless strictness is separately justified; affects the proof.
- **Misprint** in ggk-2026 at Theorem 7.1 proof, printed p. 221, line 1473: the source says translated and untranslated intersections with the enlarged subgroup are equal sets; it should assert equality of cardinalities through translation; affects nothing.
- **Misprint** in gh-2019 at Theorem A.3, manuscript p. 56, line 2606: the source says to evaluate the base height at a total-space point; it should evaluate that height at its image under π; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "032c1a5ff480c0283abc5b9ee1a555f8cf1c01f0", "job": "REV-PKG-HeightsRationalPointsAndObstructionsPartII~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
