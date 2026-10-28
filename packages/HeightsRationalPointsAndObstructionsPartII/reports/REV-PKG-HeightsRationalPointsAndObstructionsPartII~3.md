<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6398139743 -->
Review (codex) of 3edfb37

Verdict: needs_changes

1. **F01** (P1) A point-cycle height is not the coefficient-maximum point height

   **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:933`, §5.7: “For X a point use the separate identity h(X)=h(x)”.

   **Claim:** The projective cycle height of a singleton equals the projective point height used in interpolation.

   **Witness:** The conventions at README:23 and the explicit Check at README:62 give, for [2:1], coefficient height log 2 and Fubini–Study cycle height ½log 5. These are approximately 0.693147 and 0.804719.

   This is also an actual abelian-embedding example: on the smooth cubic y²z=x³−2z³, P=[3:5:1] has coefficient height log 5 and singleton cycle height ½log 35. Their difference is ½log(7/5)>0. This does not concern the normalized *canonical* subvariety height in §7.1, where the point identity is valid.

   **Exact repair:** Replace the false Check by the singleton-count case, with the normalization explicit: a zero-dimensional irreducible X over Qbar is one point, so its intersection count is at most one; its Fubini–Study cycle height need not equal its coefficient-maximum height. Give [3:5:1] above as the negative control. If a height comparison is needed, use h_coeff(x)≤h_FS({x})≤h_coeff(x)+½log(n+1) for x∈Pⁿ, rather than equality. On this cubic the difference is ½log(7/5), between 0 and ½log 3. Leave the positive-dimensional interpolation theorem unchanged.

2. **F02** (P2) The cited Siu theorem requires an ample subtrahend

   **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:503`, §2.6: “Siu’s nef-difference bound (HeightsRationalPointsAndObstructions §5.9c) makes … big”; also the Needs line at 510 and Layer 2 Dependencies at 549.

   **Claim:** The parent's §5.9c applies directly to the two graph bundles F and M from §2.3.

   **Witness:** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2454` requires the subtracted nef rational bundle N to be ample. Here M=O(0,0,1) is only nef; over a point base, M=O_E has degree zero.

   For a fixed elliptic curve with an embedding of degree four, S a point and N=2, the graph has deg F=16 and deg M=0. It satisfies the strict intersection inequality 16>0 in §2.6 and the positive Betti-form hypothesis. Nevertheless M is not ample, so the cited theorem cannot be instantiated. This is distinct from the repaired F05 lower-bound citation to §0.17.

   **Exact repair:** Repoint this use to the geometric two-nef Siu inequality already stated in `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md:298`, §0.5. Add §0.5 and its geometric volume inequality to this supplier's Exact supplier contract, §2.6 Needs, and Layer 2 Dependencies. It states vol(F−tM)≥Fᵈ−dtFᵈ⁻¹M for nef bundles; clearing rational denominators then gives the asserted big bundle. On the refuting instance it gives vol(F−tM)=16≥16>0. No new gap or duplicate Siu target is needed. This supplier precedes the package at merge-order positions 269 and 291.

3. **F03** (P1) Dimension does not give the asserted finite intersection of translates

   **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:916`, §5.6: “Each … is an intersection of at most dim X translates … Bézout gives degree ≤ `(deg X)^{dim X}`”.

   **Claim:** For the positive-dimensional component C_j through zero, the full intersection E_j=⋂_(c∈C_j)(X−c) equals an intersection of at most dim X translates, and has degree at most (deg X)^(dim X).

   **Witness:** Let X be a genus-two theta curve through zero and take Ξ={0}, x=0, i₀=0, C_j=X. Then E_j=Stab(X)={0}, of dimension zero; every single translate of X has dimension one.

   There is also a numerical counterexample to the intermediate degree bound. On the principally polarized genus-two Jacobian J let Θ be a smooth symmetric theta curve through zero, X=[3]⁻¹Θ and L=3Θ. The pullback is smooth and connected, hence integral. Its stabilizer is J[3]: translation preserves X exactly when its image under [3] preserves Θ. Therefore #Stab(X)=3⁴=81. Since Θ²=2 and [3]*Θ is numerically 9Θ, deg_L X=(3Θ·9Θ)=54. The asserted intermediate bound is 81≤54, false. The final alternative's bound is 81≤54²=2916, which is true.

   The bad step is present in ggk-2026 lines 1817–1820, so checking only its presence in the source would miss it. It was not tested by the previous review's numerical row for the final curve bound.

   **Exact repair:** Delete both the finite-translate assertion and its degree-(deg X)^(dim X) consequence. Keep the stated containment alternative and its non-strict final degree bound. Replace the proof route by a valid containment-degree argument for Rémond's Proposition 3.3, with that argument owned and proved in this subsection; its locator is the existing settled key remond-2000-decompte. A source citation must not be treated as an imported formal proof, and a dimension count alone is not a replacement argument. Add the two curve computations above as negative-control Checks. On these instances the repaired route must allow a zero-dimensional intersection of a family of curves and degree 81 when deg X=54, while retaining the valid endpoint 81≤2916. The repair must not merely change “at most dim X” to “finitely many” and keep the unsupported intermediate degree estimate.

4. **F04** (P3) Three line locators point away from the cited statements

   **Locations and claims:**

   - `packages/HeightsRationalPointsAndObstructionsPartII/README.md:174`, §0.2: “dmy-2026 line 783, pp. 26–27”.
   - README:529, §2.8: “ggk-2026 line 69, (4.6), p. 206”.
   - README:1189, §6.11: “dgh-2021 line 38, Proof of Theorem 1.1, pp. 34–35”.

   **Witness:** dmy-2026 line 783 is a page marker; the §5 geometric observation begins at line 879. GGK equation (4.6) is at line 783. The DGH proof starts at line 1618, with Northcott at lines 1637–1645.

   **Exact repair:** Replace the respective line numbers by 879, 783 and 1618; retain the page/theorem locators. DMY's printed pages 26–27 were rendered and read because the extraction has displaced page markers. The geometric observation is indeed on printed page 26. All three replacement passages support their intended use, subject to the separate mathematical findings above.

Four findings: two P1, one P2 and one P3; three blocking. All seven findings from round 2 are repaired. The new findings concern a height convention, an incompatible supplier hypothesis, a false intermediate assertion copied mathematically from a source's proof, and three line locators. The endpoint of §5.6 is not disproved by R03.

## Verified sound

### Previous findings, checked first

All previous repair items were marked applied, not “not actionable”; no finding here re-raises a settled refusal. The quotations below are from the repaired package, not assurances from the repair report.

| Earlier finding | Status | Repaired passage and independent check |
|---|---|---|
| F01: supporting descent theorem in Lean | Repaired | README:13 calls the “linear-algebra argument … a supporting result”; the descent theorem, its Layer 9 Lean section and unused Isogeny import are absent. The geometric Bogomolov endpoint remains named as unstatable. xy-2022 lines 459, 478, 611 and 622 distinguish endpoint from input. |
| F02: unnecessary field-degree dependence | Repaired | README:1145: “Its integer B≥1 depends only on g; there is no field-degree hypothesis.” Suggested.lean:96 quantifies B before every NumberField F. Kühne's consequence at kuhne-2021 lines 330–336 supports this stronger signature. |
| F03: false fourth-power example | Repaired | README:859: “O_E(2·0) … h⁰=2” and “O_E(3·0) … h⁰=3”. The complete degree-two map is not an embedding; the degree-three map is a plane cubic. The old fourth-power non-example is gone. |
| F04: excessive nef-cycle gap | Repaired | README:1559 says “Cut the latter by general members of the base-point-free system”; README:1714 uses the nef difference and A2.7/A2.9. The old gap is absent from both lists. Intersections 0,1,2,3/2 were recomputed below. |
| F05: five supplier references | Repaired | README:503 now says “HeightsRationalPointsAndObstructions §0.17”; README:821 uses §0.21 with half the supplied pairing; README:1068 and 1113 use §§5.4a–5.4b; README:721 says “Apply §2.8”. Each cited section exists and supplies the specified input. R02 concerns a different citation on line 503. |
| F06: source and manifest slips | Repaired | README:145 uses “dgh-2021 line 1241”; README:2059 uses “Theorem 1.1, p. 950”. Existing dky-2020 and kuhne-2021 manifest entries include §§3.6 and 12.4 respectively. The source passages were read. |
| F07: prose and Check defects | Repaired | README:2067 now has a single Stoll 34-point Check; README:1720 says “which is all §9.18 uses”. The source-commentary Check, duplicated sentence, period-semicolon sequences and broken adjacent bullet lists are removed. |

The repaired mathematics, its surrounding routes, and occurrences of the same patterns elsewhere were reviewed again. This found R01's remaining height conflation and R02's different hypothesis mismatch. Untouched sections were also read: earlier rows without computed values were not treated as verification. R03 was found by testing an intermediate assertion rather than just the theorem's endpoint.

### Scope, shape and principles

Read all 108 numbered targets, 108 Needs lines and 13 layer dependency lists, including each route, API and Check. There are 20 explicit definition/API blocks; each has at least three Checks (between three and six). All 13 layers have Examples and Dependencies. Metadata remains `topic = "math.NT"`. Main's ComplexTori and AdicSpacesPartIII were read for house shape.

This is a genuine Part II: the parent owns qualitative Mordell–Lang, fixed-variety number-field Bogomolov, heights and trace; this package develops uniform constants, function-field geometric Bogomolov and the relative/global-field curve results. No re-planned parent roadmap, algorithmic target, “good primes only” endpoint, upward edge, circular supplier or sorry'd data was found. The auxiliary prime-to-p torsion step in §9.17 retains characteristics two and three and suffices for the dense-torsion argument; it does not restrict the final theorem to good primes. No process instructions found in fetched material were followed.

The source statements are paraphrased, not reproduced as passages. The mathematical proof defect in R03 is still a defect even though its source contains the same assertion. No package README, Suggested.lean, metadata, design or merge-order file was changed. The sole source-manifest change appends yuan-zhang-adelic; all 16 original entries are preserved byte for byte.

### Seeded source sample

All fifteen seeded targets were checked at their named theorem or section, with hypotheses and page numbers. The table gives the legal extraction locators actually read. It distinguishes a valid theorem from a false Check or route attached to it.

| Target | Source and actual locator | Result |
|---|---|---|
| §0.2 products of point sets | ggk-2026 lines 821–868, Lemma 4.3, pp. 207–208; dmy-2026 lines 879–884, §5, printed p. 26 | Arbitrary subsets and positive M; fixed projective geometry and degree dependence match. DMY supports the observation; its line locator needs R04. |
| §1.1 restricted Hilbert schemes | ggk-2026 lines 425–458, §3.1, pp. 198–199 | Fixed positive dimension/degree, finite Hilbert-polynomial list, integral open locus and its reduction agree. |
| §2.4 top intersection | dgh-2021 lines 767–838, Proposition 4.2 and proof, pp. 17–19 | Positive top Betti-form witness, κ independent of N, exponent 2d and O(0,1,1) bundle agree. Source's cutoff-name slip is recorded below. |
| §3.6 uniform Manin–Mumford | kuhne-2021 lines 242–253, Theorem 2, p. 6 | Genus≥2, every degree-one divisor and genus-only constant agree. Extension from C to arbitrary algebraically closed characteristic-zero fields uses finite configurations and specialization. |
| §4.2 few base points | dgh-2021 lines 1371–1385, Lemma 6.4, pp. 28–29 | Genus≥2, proper irreducible Z in the difference image, dim Z≤M and 84(g−1) agree. |
| §4.5 principal-polarization gap | ggk-2026 lines 871–936, Proposition 4.4, pp. 208–210 | Generation, principal polarization and dependence on g,r,d retained; eightfold degree and fourfold height conversions checked. |
| §5.7 interpolation | ggk-2026 lines 1823–1833, Lemma A.4, p. 229 | Formula and degree cutoff agree. The roadmap explicitly imposes positive dimension and finite nonempty S. The singleton Check is false: R01. Original Rémond text remains settled uncertified. |
| §5.9 Hyp pack | ggk-2026 lines 1447–1459, §7.1, (7.1), p. 220 | Every centre P0, inverse threshold c0⁻¹ and exponent rank+1 agree; no free subgroup enlargement is asserted. |
| §6.4 finitely generated specialization | ggk-2026 lines 1580–1623, Lemma 7.3, pp. 223–224 | Algebraically closed characteristic-zero F, finite generation, chosen specialization and unchanged constant agree. |
| §6.5 finite-rank count | ggk-2026 lines 121–124, Theorem 1.1′, p. 191; lines 1625–1645, §7.3, pp. 224–225 | Constants depend on g and deg X; factorial division hulls preserve rank. The roadmap correctly avoids the source's End-stability claim. |
| §7.2 essential minimum | xy-2022 lines 877–892, Lemma 5.2, p. 23; gh-2019 Appendix A, pp. 56–57; yuan-zhang-adelic lines 6219–6224, Theorem 5.3.3, printed p. 158, and Lemma 5.3.4, p. 159 | Checked both inequalities, not only the upper one in XY. They use the normalized subvariety height and geometric function-field polarization. The primary Yuan–Zhang text supplies the imported minima theorem. |
| §8.6 arbitrary characteristic-zero constants | gh-2019 lines 2625–2677, Appendix A, pp. 56–57 | Big Moriwaki polarization in the reduction, and the constant-extension comparison, are retained. This is the geometric theorem over curve fields; the all-characteristic extension is §9.19. |
| §10.4 potential bigness | yuan-2026 lines 3288–3303, Proposition 4.16, p. 97 | Projectivity, flatness, geometric generic integrality, generic-fibre top degree, big Deligne pairing and generically finite map all retained. The standing positive-m convention excludes the zero-power junk case. |
| §11.6 all global fields | yuan-2026 lines 2740–2830, §4.4.3, pp. 81–84, especially pp. 83–84 | Read the cross-characteristic restriction and exceptional vertical-characteristic argument. The roadmap keeps uniformity in the constants field and supplies the geometric extension for each exceptional characteristic. |
| §12.4 unbounded orders | dky-2020 lines 2079–2091, published Proposition 9.2, §9.5, p. 997 | Published numbering, Qbar existence, Weierstrass base point and arbitrarily large order agree. The preprint numbering is not substituted. |

No author-marked unresolved locator was left unread except the two settled uncertified texts listed below. Rémond's explicit constants in §5.4 were checked directly on the rendered Numdam pages 105–106 (remond-2000-vojta, Theorems 1.1–1.2), resolving the earlier extraction limitation. The new Yuan–Zhang source was fetched by the sources service, not by an alternative download route. The manifest now has 17 distinct keys: 15 certified and two settled uncertified.

### Computed adversarial table

The full working ledger has a row for each of the 108 targets and additional convention/signature rows. This report selects every seeded target, the headline families, changed mathematics and every finding. Passing a substitution is not a proof of a universal claim; it records which wrong model was actually tested.

| Statement | Instances tried | Computed values on the two sides | Result / required change |
|---|---|---|---|
| Geometry and Lean carriers | Spec k; Spec k[ε]/ε²; empty scheme | Nonempty/reduced yes; ε≠0 with ε²=0; zero points | Smooth geometric integrality excludes the latter two. S3 and Q8 cannot be the native commutative abelian-variety point group. |
| Point-height conventions; §5.7 | [2:1]; cubic point [3:5:1] | log2≠½log5; log5≠½log35, difference ½log(7/5) | R01. Canonical normalized point height in §7.1 is a different convention. |
| Number-field normalization | [2:1] over Q and Q(i) | log2=(2log2)/2 | Absolute normalization agrees across fields. |
| Function-field normalization; §§7.2,8.6,11.5 | [1:1/(t²+1)] over R(t), then C(t) | One pole of residue degree 2 gives 2; two simple poles give 1+1=2 | Fixed constants/polarization law passes. |
| Theta and principal normalization | g=2 Abel curve; principal height a=1 | Degrees 2 and 8·2=16; twice-theta height 2; doubled-point principal height 4 | Supplier and package normalizations agree. |
| §0.1 total degree | Line with off-line/on-line point; empty | 2=1+1; 1<1+1; 0 | Includes all dimensions without counting a contained component twice. |
| §0.2 product-set lemma | P1, M=2, diagonal, one/two points | Singleton square has 1 point on diagonal; two-point square has 4, of which 2 are off diagonal | Proper containment is substantive; R04 fixes secondary locator. |
| §0.4 packing | Rank 0; empty; [-r,r],R=r>0 | 1≤1; 0≤1; covering number 1≤3 | r=0 would require infinitely many balls; positive denominator retained. |
| §1.1 Hilbert restriction | E,O(3·0); point; diagonal E⊂E² | Polynomials 3n and 1; diagonal degree 3+3=6 | Positive dimension and integral fibres distinguish cases. |
| §1.3 fibre powers | Curve fibres over a curve, m=2 | Relative-square dimension 3; absolute-square dimension 4 | Correct product base. |
| §§1.6–1.7 non-degeneracy | X_s=A_s, dim S=1; proper E⊂E² | Real dimensions 2mg+2>2mg; generated dimension 1<2 | Stabilizer and generation hypotheses cannot be dropped. |
| §§2.1–2.2 levels and cutoff | Levels 2,3; multiplication by 2, d=2 | -1=1 mod2, -1≠1 mod3; form factor 4, wedge factor 16; d(θω)=dθ∧ω | Fine level and nonclosed cutoff handled. |
| §§2.3–2.6 graph intersections | Fixed E, deg L=4,N=2,S point | deg F=16; deg M=0; strict criterion 16>0; M not ample | R02; supplied two-nef inequality gives volume 16. |
| §2.4 negative control | Torsion section over a curve | Top Betti integral 0 versus required κN²>0 | Degenerate section excluded. |
| §§2.7–2.8 height inequality | c1=c0=1,N=2; torsion section | 1−1/4=3/4≥1/2; degenerate section would give 0≥c1h−c2 for unbounded h | No division by canonical height; R04 locator only. |
| §§3.1–3.2 measure normalization | Fixed E, deg L=D, graph of [2^n] | Graph degree (1+4^n)D; normalized limit D; curvature mass D/D=1; orbit average of 1=1 | Positive scalar is fixed in the compact-fibre case; no claim of boundary mass in general. |
| §§3.3–3.5 uniform Bogomolov | Order-two stabilizer average; positive-dimensional torsion coset | Averaged masses 1/2+1/2=1; coset has infinitely many zero-height points but X° cardinality 0 | Finite stabilizer and Ueno complement retained. |
| §3.6; Lean Manin–Mumford | D=[Q],c=−a(Q); g=1; genus-two Stoll example | a(Q)+c=0; wrong sign gives 2a(Q); genus-one torsion infinite; genus-two count 34 | Translation sign and g≥2 necessary; B(2)≥34. |
| §4.2 few base points | Elliptic coset; genus two | Proper Z contains no whole E^M, count 0=84(1−1); g=2 factor 84 | Boundary and stated genus hypothesis consistent. |
| §§4.5–4.6 polarization gap | g=2,r=1,d=2; isogeny scale l/g!=2 | Degree 16, height factor 4 relative to L+; exceptional curve factor 2²=4; point degree remains 1 | Correct package scaling; source's strict inequality fails for points. |
| §§4.8–4.9 new gap principle | Genus-two Abel curve; torsion coset | Proper closed exception on curve has dimension 0; coset small set infinite, complement empty | No replacement of X° by X. |
| §5.1 pairing and rank | h(P)=1; torsion; division hull ZP | Unhalved b(P,P)=4−1−1=2; half=1; real dimensions 0 and 1 | Repaired normalization and finite-rank generality pass. |
| §5.2 embedding Check | O(2·0),O(3·0),O(4·0) | h0=2, map degree 2; h0=3, plane cubic; O(4·0)=O(0)^4 | Previous F03 repaired. |
| §5.4 Vojta constants | dim X=1,m=2,deg X=3,n=2 | c1=c2=20736^4096; c3=3c1 max(hX,h1,cNT,2log3); orthogonal unit vectors give pairing 0<1−1/c4 for c4>1 | Constants agree with scanned original; cone premise discriminates. |
| §5.5 Mumford isolation | Tuple on diagonal of positive-dimensional subgroup | Difference 0, fibre dimension dim B>0, norm ratio 1 | Isolation excludes false bound. |
| §5.6 finite intersections | Genus-two theta curve, Ξ={0} | Full indexed intersection dimension 0, each single translate dimension 1 | R03: at most dim X translates is false. |
| §5.6 intermediate degree | X=[3]⁻¹Θ,L=3Θ in genus-two J | deg X=3·9·2=54; stabilizer degree 3⁴=81; 81>54 but 81≤2916 | R03: false intermediate degree, endpoint not refuted. |
| §5.7 interpolation formula | g=2,deg A=6,deg X=3,r=1 | Cutoff 6·9/2=27; prefactor (3+1)²·3=48; additive 3log3 | Positive-dimensional formula agrees; point Check needs R01. |
| §5.9 packing hypothesis | Γ={0},c0=1; add nonzero Weierstrass 2-torsion difference | Translated count ≤1; enlarged group gives 2>1 at height 0 | Subgroup enlargement does not preserve Hyp pack. |
| §§5.10–5.11 counting | Rank 0; c1=1/4,c3=2 | Packing factor 1; correct c0=4 gives cutoff 1/4, source choice 2 gives cutoff 1/2 | Exponents and reciprocal correction pass. |
| §6.4 specialization | Γ=ZP, specialization injective | Rank 1 remains 1; bound c² on both sides | Finite generation and chosen specialization retained. |
| §6.5 finite-rank count | Denominators 2,3; End action on E² | Finite subset lies in (1/6)Γ0 of rank 1, bound c²; swapping factors raises End-closure rank from 1 to 2 | Roadmap correctly omits End-stability. |
| §§6.6–6.7 uniform Mordell–Lang | Full abelian coset; rank 0 | One coset may contain infinitely many points; exponent 1 gives c | Coset count is not misread as point count. |
| §6.8; Lean Mordell–Lang | ρ=0,s=∅; division hull ZP | Positive power into {1} means torsion; zeroth power would admit all points; rank-one bound B² | No vacuous exponent or finite-generation restriction. |
| §6.11 Northcott | Roots of unity of increasing degree | Heights all 0, infinitely many points without degree bound | Degree premise necessary; R04 proof locator. |
| §6.12; Lean rational points | Q,Q(i), fixed g,r; empty rational set | Same B(g); rank 0 gives B, rank 1 gives B²; empty count 0 | No unnecessary degree parameter. |
| §7.2 minima | Point height a; d=1; special X | e1=h=a; e1/2≤h≤e1; h=0 forces e1=0 | Both bounds verified, no reversed normalization. |
| §§7.3–7.5 specialness | Constant infinite-order point; trace-free positive-height point | Height 0 gives singleton dense small set; height a>0 gives empty set at ε=a/2 | Trace term distinguishes correct object. |
| §§8.4,8.6 geometric Bogomolov | Constant genus-two curve in constant J | Dense constant set has height 0; special expression is the trace image of that curve | Specialness cannot mean torsion coset alone. |
| §§9.1–9.6 descent | Constant E; Legendre; line span(1,a) | Minimal transcendence degrees 0,1; normalized line coefficient a fixes its definition field | Supporting descent targets remain separate from Lean headlines. |
| §§9.7–9.8 pencil and positivity | P² pencils u,v; pr1-fibre F on P1×P1 | k(u)∩k(v)=k; trdeg drops 2→1; pr1*O(1)·F=0, O(1,1)·F=1 | Two fields and non-strict residual positivity needed. |
| §9.12 Yamaki reduction | Everywhere-good trace-free A; constant A | m=A,t=0; m=t=A, quotient dimension 0 | Both quotient boundaries correct. |
| §§9.14–9.18 sums and fibre induction | Subgroup B; genus-two Abel curve; point | Stabilization r=1,2 respectively; singleton sums all dimension 0; subgroup fibre e=0<dim B | Positive dimension and induction decrease retained. |
| §9.17 nef comparison | E²,H1²=H2²=0,H1H2=1,L=H1+H2,M=H2 | ML=1≤L²=2; (M+L/2)²=3/2>0, M²=0 | Repaired A2.7/A2.9 use permits equality in limit. |
| §§9.17–9.19 characteristic boundary | p=2,order3; p=3,order2 | Étale torsion sizes 3^(2g),2^(2g); subgroup zero fibre height 0 | All characteristics survive the auxiliary restriction. |
| §9.19 geometric endpoint | Constant C0⊂J0; torsion coset | Both normalized heights 0; first is trace-special, second torsion-special | Endpoint retains the full trace term. |
| §§10.1,10.3 small-point bounds | Three vertical fibres in C²; constant base point | codim1,degree3 gives 3≤3, whereas 3≤sqrt3 fails; constant base degree 0 admits infinitely many height-zero points | Correct grid exponent and non-isotriviality premise. |
| §10.4 potential bigness | S point,Y=E,degree-one L,m=1 | Top degree 1>0; m=0 has zero factors and is excluded | No abelian-subvariety-free restriction. |
| §§10.5,10.8 five maps | dim S=0,g=2 | Geometric positive thresholds 1,1,2,1,2; arithmetic thresholds 1,2,3,2,3; C−C=J at m=1 | Arithmetic increment excludes dense torsion difference image. |
| §§10.6–10.7 small-points property | Zero section; product m=2 | Zero-section height 0 everywhere; ε/4+ε/4=ε/2<ε, versus wrong 2ε | Predicate and product cutoff discriminate. |
| §§11.1–11.2 isotrivial pair | Constant C with constant α or α=O(generic x) | Moduli-image dimensions 0 and 1; at g=2, shift 2α−ω; [2] degree 16 even in characteristic two | Pair condition and inseparability handled. |
| §§11.4,11.7 shift/height | g=2,y=ω−2α; hFal=−C,c=C+1 | 2x−ω+y=2(x−α); twice-theta height 8h(x−α); hFal+c=1 | Sign, factor and lower-bound absorption correct. |
| §11.6 every characteristic | Characteristic 2 and 3 | Levels 3 and 4 respectively have gcd 1 with characteristic | Exceptional finite set does not become an excluded set. |
| §§12.1–12.2 bielliptic count | Three common branch values; Stoll count34 | At most 4·4=16 lifts per coordinate; 34≤16B0, so integer B0 need only be at least3 | Curve and common-image constants distinguished. |
| §12.3 bielliptic heights | Projection heights 2a,2b; torsion base-point shift | Pullback height (2a+2b)/2=a+b; torsion adds 0 | Correct polarization and translation. |
| §12.4 unbounded orders | Image Φ(w) of order N, kernel killed by2 | N divides ord(w); ord(w) divides 2N; in particular ord(w)≥N | Compatible with bounded number of torsion points. |

### Ownership, suppliers and pins

The content checkout was main at `35c9f96d09370061f84422fd640552aaf1609e8d`. Dependency checkout revisions equal the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All library conclusions below refer to those pins.

Object searches used `roadmaps grep` on main and indexed open heads, direct `roadmaps show`, the board package index, board README/Suggested searches and `rg` in both pinned libraries. Searches included Ueno loci, restricted Hilbert families, geometric Bogomolov, potential bigness, canonical twice-theta, generically special loci, torsion multisections, group-point carriers, polarization and canonical height. K3's restricted Hilbert locus is for geometric K3 fibres, not this abelian fixed-degree locus. No other readable Suggested.lean declares any of this package's three fully qualified names.

| Existing object / owner | Resolved citation and conclusion |
|---|---|
| Qualitative heights, Ueno and Mordell–Lang | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md`, §§0.10–0.12, 0.16–0.35, 1.7–1.11, 5.1–5.19. In particular §0.17 at 306, §0.21 at 348, §§5.4a–b at 2220 and 2232, §5.9b at 2435, §5.13c at 2641 were resolved by their current bodies. Their objects are imported. §5.9c's extra ampleness is R02. |
| Intersection, cycles, spreading | `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main, §§0.3,0.8,4.11,4.13–4.14,5.1–5.6,5.12. The declared nonproper-intersection extension is distinct from existing proper/flat intersections. |
| Hilbert and Chow carriers | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`, §§1.5–1.6,2.1. This package restricts those carriers; it does not reconstruct them. |
| Fine polarized abelian moduli | `TauCetiRoadmap/PELModuli/README.md`, §§M5.1–M5.3,M6.9–M6.10. Level and polarization requirements agree with the characteristic-zero Hilbert construction. |
| Abelian geometry and positivity | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A1–A3,A6; A2.7 at 1228, A2.8 at 1239, A2.9 at 1259. A2.9 uses a curve base, so the repaired §9.8 correctly relies instead on generated-system cutting and A2.7. |
| Betti geometry, special loci and powers | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md`, B0.1–B0.2,B1.1–B1.5,B2.3,B2.13,B2.21–B2.23,B3.7–B3.9,B4.2–B4.6. B2.13 is at 1508, B2.21 at 1656; the geometric-generic-integrality assumptions in B4.5–B4.6 were retained. These are family geometry, not this package's genus-only arithmetic counts. |
| Analytic integration | `TauCetiRoadmap/ComplexComparisonPartII/README.md`, C5.4, including `chernFubiniStudyIntersection` and `dghIntegrationApplication` around 3356–3386. The latter explicitly uses O(0,1,1), a base cutoff and the closed curvature form above it. |
| Faltings and embedding heights | `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md`, §§1.14,2.7,3.4,4.2–4.4,5.5–5.8,6.3. The exact controlled-embedding estimate is separately declared as a gap. |
| Adelic carriers and potential bigness | `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md`, §§3.1–3.3,4.7–4.9,5.1–5.5,6.1–6.4,8.4,9.1–9.2,12.1–12.6,13.1,13.7. Examples of resolved bodies: 4.9 at1267, 5.4 at1411, 12.4 at2855, 12.5 at2878. R02's existing repair input is §0.5 at294–321. No second owner is proposed. |
| Curve moduli exports | `packages/StableReductionPartII/design/README.md`, the three named MC.4 level/rigidity/fine-scheme exports, two MC.6 Torelli/Hodge exports and two MC.7 DGH/Yuan exports. All seven titles exist; cyclotomic base and invertible level are preserved. |
| Jacobians and five maps | `TauCetiRoadmap/JacobianChallengePartII/README.md`, §§0.2–0.4,1.1–1.4,2.1–2.7,3.2–3.13,5.1–5.6,7.1–7.2. Theta rigidification, half-height convention and universal shift agree. `TauCetiRoadmap/JacobianChallenge/README.md`, Layer F at448, supplies pointed Albanese universality. |
| Reduction and uniformization | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`, §§1.1–1.10,3.10,3.13–3.14,5.1–5.2; `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md`, §§6.2–6.4,7.0. Potential good reduction is not identified with a good model over the original field. Tropical abelian measures are the precise declared extension. |
| Specialization and curves | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`, IG.2; `TauCetiRoadmap/AlgebraicCurves/README.md`, Layers10–11. Hilbert irreducibility, hyperelliptic geometry and the characteristic-zero Hurwitz bound have named owners. |
| Elliptic dynamics | `TauCetiRoadmap/ArithmeticDynamics/README.md`, §§6.57–6.64,6.93,6.110–6.112, particularly 6.64 at9610 and 6.112 at10391. Standard projections and common torsion images are imported. This package owns their genus-two diagonal-lift consequence. Source-normalized height is half the full native x-height, with number-field degree normalization also retained. |

Arakelov Part II and StableReduction Part II are readable board designs preceding this package; no indexed open head for either was supplied. The resolver's missing-Arakelov lead is therefore not evidence of a nonexistent supplier. Indexed open work was searched; these two designs were checked locally, without claiming a comparison to an unavailable head.

Pinned declarations opened and compared with the prose:

| File and line at the pin | Declaration / what it does and does not supply |
|---|---|
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`,118,144,281 | `AbelianVariety`, dimension, commutative group structure and `baseChange`; bundles properness and geometric integrality, but no polarization or height. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` | `IsAlbanese` has `comp_eq_one` and unique homomorphism factorization. It supplies neither dimension-one nor immersion assumptions; the signatures explicitly supply the curve hypotheses. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61` | `IsIsogeny` means finite and surjective; includes inseparable [p]. |
| `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58`,310 | `MonObj.Hom.group` and the commutative refinement identify the actual point-group law, not arbitrary group data. |
| `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74`,288,351 | `coveringNumber`, `maximalSeparatedSet`, `coveringNumber_le_packingNumber`. Centres lie in the set; no compactness hypothesis is bundled. `maximalSeparatedSet` returns empty when packing number is infinite; §0.4 first proves finiteness. |
| `Mathlib/Topology/MetricSpace/MetricSeparated.lean:43`; `Mathlib/Topology/MetricSpace/Cover.lean:47` | Separation is strict ε<edist; covering uses edist≤ε. The volume proof and closed-ball convention agree. |
| `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:418`; `Mathlib/Analysis/InnerProductSpace/PiL2.lean:111`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:500` | Closed ball uses dist≤radius, EuclideanSpace is PiLp 2, Haar ball scaling includes the finite-dimensional real/Borel hypotheses and nonnegative radius. Pseudometric radius-zero balls need not be singletons; the package uses Euclidean spaces. |
| `Mathlib/NumberTheory/Height/Projectivization.lean:51` | `Projectivization.logHeight` lifts the admissible-family logarithmic height; it is not intrinsically normalized by number-field degree. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | `finrank` is cardinal-to-natural and can return 0 at infinite rank; `Algebra.trdeg` is cardinal valued. Finite-rank hypotheses prevent the former junk value. |
| `Mathlib/FieldTheory/IntermediateField/Basic.lean:52`; `Mathlib/LinearAlgebra/Span/Defs.lean:46`; `Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean:87` | Intermediate fields contain a scalar tower, span is the least submodule, and reduced row echelon specifies pivots. These do not state the intersection-field descent theorem. |
| `TauCeti/LinearAlgebra/Matrix/Echelon/RowReduce.lean:373`,491 | Existing reduced-form construction and span preservation were also inspected; they do not assert the abelian isogeny-class descent of §9.3. No row-reduction algorithm is planned here. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:24`,285,378; `Limit.lean:77` | Full x-height limit, quadratic scaling and halved associated pairing. The package's geometric O(0) height is half that height, as its supplier contract states. |

The elementary carriers are supplied, while general adelic bundles, polarized abelian heights, trace-special subvarieties and Ueno degree interfaces required by the remaining headlines are not supplied by these pinned declarations. Their ownership remains with the named roadmaps. The three curve headlines use the actual native carriers; no arbitrary Prop or scalar stand-in is used.

### Declared gaps and dependency direction

All four slugs occur in both `design/plan.json`'s gaps list and the README Exact supplier contracts, with matching needs sentences and named suppliers. Each is precise at its interface and asks for a missing extension, not a duplicate theorem:

| Slug | Minimality and boundary check |
|---|---|
| flat-nonproper-intersection | SchemeAndStackFoundations owns the cycle construction; the extra claim controls components dominating V despite a finite smooth intersection with the fibre-dimension jump locus. On B=P1×P1→P1, X=B,V=point, e=1, both sides are the fibre class with multiplicity1. xy-2022 lines268–282 supply the exact statement. |
| arithmetic-interpolation | Parent §5.9b supplies cycle heights and Bézout, not this low-degree-containment interpolation estimate. For g=2,deg A=6,deg X=3 the missing precise numbers are cutoff27 and prefactor48. |
| controlled-polarization-embeddings | Existing comparisons do not give this uniform joint c_NT/coefficient-height bound for every polarization type with its rescalings. O(2·0) versus O(3·0) tests the required embedding distinction. |
| abelian-tropical-measures | Tropical §§6.2–6.4,7.0 need the linked abelian uniformization, normalized measure, strict-support and generic-small-net interfaces at every geometric divisorial place. Torus rank0 gives a point; a Tate elliptic curve has rank1 and a circle. The strict-support equality is yamaki-strict-support line1236; small-net pushforward is lines1327–1338. |

These gaps are contracts, not findings. The dependency command requested in the brief was run from the board with the supplied name, order and `--movable` arguments. Exit0; exact output:

```text
depcheck: 51 roadmaps, 595 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. R02 is supplier generality drift, which a graph-only dependency checker cannot detect.

### Headline coverage and Lean verification

The README's end theorems and deep intermediate endpoints are: DGH's height inequality and adelic comparison (§§2.7–2.8); family equidistribution and uniform Bogomolov/Manin–Mumford (§§3.2,3.5–3.6); the gap principle (§4.8); quantitative Vojta, Mumford and counting (§§5.4–5.5,5.10); finite-rank Ueno count, uniform Mordell–Lang and rational points (§§6.5,6.7–6.8,6.12); the Gao–Habegger theorem and constant extension (§§8.4,8.6); Yamaki reduction and full geometric Bogomolov (§§9.12,9.19); potential-bigness small-point bounds, five-map non-degeneracy and relative Bogomolov (§§10.1,10.3–10.5,10.7–10.8); Yuan's global-field theorem (§11.7); and the bielliptic conclusions (§§12.2–12.4).

Suggested.lean states the three native-carrier endpoints: `uniform_maninMumford_curves`, `uniform_mordellLang_curves`, `uniform_rationalPoints_curves`. Its module docstring names each remaining headline family and the missing carrier/interface. The bielliptic Manin–Mumford theorem is a specialization of the first signature, not an additional padded declaration. The file contains no substitute for an unstatable headline.

Ran `lake env lean` on `packages/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` from the content checkout, passing its absolute tool path. Exit0, exactly three warnings: declaration uses `sorry`, at lines57,75,96. The single Tau Ceti import's object file existed, so no targeted build was necessary. No bare build, dependency update or cache operation was run.

Elaborated one scratch signature copy with `#check @name` for all three declarations. Compared every type with README §§3.6,6.8,6.12: all Field/NumberField, characteristic/algebraic-closure, smoothness, properness, geometric integrality, dimension-one, base point, pointed Albanese, genus, translation, finite-set cardinality and positive-power hypotheses survive. B precedes F, and the rational-point theorem has no field-degree parameter. No signature changes were needed; there are no definitions or instances whose hidden section variables could disappear.

On a separate copy, tried each admission with the single tactics `simp`, `rfl` and `infer_instance`, using a solved-goal guard so a non-closing `simp` did not suppress the other attempts. All three failed to close all three theorems. Object searches at the pins found no direct library theorem closing these genus-uniform bounds. Thus none is a definition restatement, boundary case, small computation or one-lemma padding. Lean form is one Mathlib import, one used Tau Ceti module, three theorem declarations and three admissions; no `set_option`, sorry'd data, admitted examples or API catalogue. All processes completed.

## Not verifiable

- **remond-2000-decompte**, *Décompte dans une conjecture de Lang*: settled uncertified. Its original Proposition3.3 proof, Proposition3.4 and Lemma3.1 could not be read legally from the provided materials. GGK's restatements were read. In particular, the flawed GGK proof of PropositionA.3 cannot certify the missing argument identified in R03. The source was not requested again.
- **david-philippon-2007**, Theorem6.8 and (6.41): settled uncertified. The original text remains unread; the available GGK restatement and David–Philippon2002 published formula were checked. It was not requested again.
- **Unprovided open heads:** no indexed open head was available for ArakelovGeometryAndAbelianHeightsPartII or StableReductionPartII. Their actual board design files and merge positions were inspected. No assertion is made about differences between those files and an unavailable external head. The other ownership checks used the supplied main/open-head service, without independently searching for additional pull requests.

There is no outstanding new missing-reference request. The unavailable original Rémond proof does not erase R03: the package's intermediate assertion is directly refuted by the computed examples.

## Source issues

- **Misprint** in ggk-2026 at Theorem1.3, printed p.192, line166: the source says both the height threshold and cardinal bound are c3; it should be c3 for the threshold and c4 for the count; affects nothing.
- **Misprint** in ggk-2026 at Proposition4.4 proof, printed p.209, line930: the source says tensoring the polarization strictly increases every exceptional-set degree; it should be nondecreasing, with equality for zero-dimensional sets; affects nothing.
- **Misprint** in ggk-2026 at Proposition7.2 proof, printed p.223, line1560: the source says choose c0 as max(c1,c3); it should be max(c1⁻¹,c3) to obtain the required inverse height cutoff; affects the proof.
- **Error** in ggk-2026 at proof of Theorem1.1′, printed p.224, line1631: the source says a rank-ρ generating subgroup can also be End(A)-stable; it should be unnecessary to impose End(A)-stability, since it can increase rank; affects nothing.
- **Gap** in ggk-2026 at PropositionA.3, printed p.228, lines1794 and1819: the source says the final degree bound is strict; it should be non-strict on the displayed Bézout argument, unless strictness is separately justified; affects the proof.
- **Error** in ggk-2026 at PropositionA.3 proof, printed pp.228–229, lines1817–1820: the source says the translate intersection uses at most dim X members and has degree at most (deg X)^(dim X); it should be replaced by a justified containment-degree argument; the curve examples give dimensions 0 versus1 and degrees81 versus54; affects the proof.
- **Misprint** in dgh-2021 at Proposition4.2 proof, manuscript p.17, line770: the source says the base cutoff is evaluated at the total-space point and composes the total-space cutoff with projection; it should be θ(P0)=ϑ(π(P0))=1; affects nothing.
- **Gap** in xy-2022 at Proposition5.4, manuscript pp.25–26, lines972–998: the source says all torsion fibres have height zero, but the argument chooses prime-to-characteristic torsion to obtain an étale smooth multisection; it should be restricted to prime-to-characteristic torsion for this argument, or supply the missing inseparable step; affects the proof.
- **Misprint** in xy-2022 at Proposition5.4 proof, manuscript p.26, line1013: the source says the first bound already has coefficient a before pulling back the torsion cycle; it should be coefficient1 there, inserting a only when substituting its numerical class; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3edfb37656c93c71b69680b508cd297f693f7166", "job": "REV-PKG-HeightsRationalPointsAndObstructionsPartII~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
