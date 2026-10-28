<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1361#issuecomment-6430484522 -->
Red team round 1 pass a (codex) of f72311b

Verdict: needs_changes

1. **F01** (P1) The Heegner–Gross comparison has no supplier or stated intermediate targets

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1300–1304: “The CM embedding and winding-cotangent comparison then give the Heegner–Gross formal-immersion criterion”.

   **Claim:** The listed ordinary Jacobian, CM and modular-curve inputs suffice for the resultant criterion.

   **Witness:** bilu-parent-rebolledo lines 757–821 uses the generalized cusp Jacobian, its winding quotient, a supersingular cotangent identification, and the annihilation identity I♯ₑe_D=0. None is stated in the cited supplier sections or declared gaps.

   **Exact repair text:** “Before the resultant criterion, construct the generalized Jacobian of X₀(p) with modulus 0+∞, its integral winding quotient and ordinary special-fibre Abel map. For the quadratic lift x of the assumed noncuspidal non-CM rational point of X₀⁺(p²), define x₁=π_p(w_(p²)x), x₂=w_p(π_p x), and Φ_(x₁):Y₀(p)_K→J♯_(e,K) by Q↦[(Q)−(x₁)] in the quotient. Prove the integral extension, the common ordinary reduction, the torsion-image comparison needed for these sections, and that x₁=x₂ forces CM. Prove the supersingular-module cotangent identification and the Heegner–Gross annihilation identity I♯ₑe_D=0; identify its differential with H′₋D(j)/H₋D(j) dj. Prove the equal-section specialization and formal-immersion criterion of bilu-parent-rebolledo §§5.1.1–5.1.2, Propositions 5.1–5.5. These are prerequisite targets of this section.” Give each target its explicit hypotheses and locator; import any existing general carrier from an earlier owner, or register its precise supplier gap. Do not cite an ordinary Picard Jacobian as this generalized Jacobian.

   **Repair test:** With two marked cusps, the generalized Jacobian has dimension g+1 and a one-dimensional torus; the ordinary Jacobian has dimension g. At p=17, H₋₃=X gives H′/H=1/j on the ordinary locus, but that nonzero differential contributes to the winding quotient only after I♯ₑe₃=0 is proved.

2. **F02** (P2) The split-normalizer identification includes the false characteristic-two case

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1154: “At prime p ... this is the split Cartan normalizer condition”; packages/EllipticModularityEffectiveComparisons/Suggested.lean:153–154: “Used only at prime p.”

   **Claim:** Preserving an unordered pair of distinct lines is equivalent to containment in the normalizer of a split Cartan for every prime.

   **Witness:** At p=2 the split Cartan is {I}, whose normalizer is GL₂(𝔽₂), of order 6. A line-pair stabilizer has order 2. The package's Check at line1164 computes this contradiction; ArithmeticGaloisRepresentations §4.2 restricts the identification to q≥3.

   **Exact repair text:** Replace the identification by: “For odd primes p, this is containment in the split Cartan normalizer. At p=2 it is the stronger line-pair preservation condition.” Replace the Lean docstring's last sentence by: “Its split-Cartan-normalizer interpretation is used only at odd primes.”

   **Repair test:** For E:y²=x³−x+1, the irreducible cubic has discriminant −23, so the mod-2 image is S₃ of order 6. It normalizes {I} but preserves no two-element subset of the three nonzero torsion points. The corrected wording distinguishes the two conditions; the p>11 theorem is unaffected.

3. **F03** (P1) The Runge proof attributes modular units to a supplier that has none

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1272,1280: “constructs the modular units from Siegel functions”; “ModularForms Layers 1 and 10 for modular units”.

   **Claim:** ModularForms supplies the Siegel modular units needed by the Runge proof.

   **Witness:** TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:91–101, H3.2, already constructs general rational-index Siegel functions, transformations, finite exponent products, modularity and integrality. ModularForms Layers 1 and 10 have no Siegel-function or modular-unit target.

   **Exact repair text:** “Import ImaginaryQuadraticClassNumber H3.2's Siegel functions, exact transformations, modular-product criterion and integrality. This section forms the split-Cartan orbit products, computes their cusp divisors, and proves the two cusp estimates and Runge bound.” Replace the modular-unit supplier citation by “ImaginaryQuadraticClassNumber H3.2”; retain only the actual q-expansion and modular-form inputs under ModularForms.

   **Repair test:** At level p=5, the imported general product criterion applies to denominator-5 indices, not merely to the level-2 specializations later in H3.2. The new work is the split-Cartan product and its bound 48.033…, so the existing general construction is imported once.

4. **F04** (P2) Statable deep comparison theorems are absent from the acceptance test

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:554,653,691,763,1338,1483; packages/EllipticModularityEffectiveComparisons/Suggested.lean:12–29. Examples: “Prove integral_ideal_sturm”; “Prove four_divisible_isogeny_realization”.

   **Claim:** The acceptance test states the deep results available on native carriers, and names those requiring missing carriers.

   **Witness:** Native modular forms, q-expansions, ring-of-integers ideals, integral Weierstrass models, finite-field points, isogenies and geometric kernels exist at the pins. The six deep targets below are neither stated nor identified as unstatable in Suggested.lean.

   **Exact repair text:** Add the following admitted headline statements, with only real definitions on the native carriers needed to express them:

   1. “For N>0, k∈ℕ, a Dirichlet character χ modulo N, a number field K, an embedding σ:K→ℂ, an actual weight-k modular form of character χ, and a sequence a:ℕ→O_K whose σ-images are its entire q-expansion, every ideal J of O_K containing a_n for all 12n≤k[SL₂(ℤ):Γ₀(N)] contains every a_n.”
   2. “For an integral Weierstrass curve W with elliptic rationalization, if 4 divides the native point cardinality of W modulo every odd prime not dividing Δ(W), there exist an elliptic F/ℚ and a rational isogeny W_ℚ→F of degree 1 or 2 with exactly four rational 2-torsion points.”

   3. “For a normalized weight-two newform of level N>0 and trivial character, integrality of a_q for every prime q with 6q≤[SL₂(ℤ):Γ₀(N)] implies integrality of every coefficient.”
   4. “For an actual normalized integral weight-two trivial-character newform, a coefficient prime λ and m≥1, the two finite-prime congruence hypotheses of §3.9 imply a_q≡q+1 modulo λ^m for every prime q∤2N.” Bind the coefficient realization and the exact cutoff I(lcm(N,4))/6 explicitly.
   5. “For E/ℚ elliptic with a rational cyclic isogeny of degree r∈{2,3,5,7,13}, and prime p outside that set, containment of its actual p-torsion image in a nonsplit normalizer implies ∃z:ℤ, E.j=z.” The nonsplit predicate in §5.0 is a short definition on native torsion endomorphisms; do not add a non-CM hypothesis.

   6. “For a geometrically non-CM E/ℚ and prime p>37, a proper actual p-torsion image is contained in a nonsplit normalizer.” This is §5.8 on the same native torsion and nonsplit predicate, without a modular-curve carrier.

   Use the existing native q-expansion and curve-reduction functions, not free predicates for modularity, good reduction or point counts. Document all six theorem names in README and the module docstring. The missing arithmetic conductor and Serre-weight interfaces cited for the larger Kraus theorem are not needed by these statements.

   **Repair test:** For the first statement, k=0 and J=0 tests the constant term: the constant form 1 fails the n=0 premise. For the second, C:y²=x(x²+3x+1) has quotient y²=x(x−1)(x−5), with full rational 2-torsion; degree 2 is required, so a statement restricted to degree 1 would fail. For y²=x³−x, degree 1 suffices. Small-prime recognition at N=11 tests the actual normalized form with a₁=1, a₂=−2 and cutoff2. For prime-power congruence use the form of y²=x³−x at N=32, λ=(2),m=2: cutoff8 and traces a₃=0,a₅=−2,a₇=0 differ from q+1 by −4,−8,−8, all divisible by4. For the integral-j statement, y²=x³−x has a rational 2-isogeny, nonsplit containment at p=11 and j=1728; its CM status must not exclude it. These are substantive general theorems, not boundary-case padding.

   **Native-carrier evidence:** Mathlib/NumberTheory/ModularForms/QExpansion.lean:171; Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:230,388; TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104. The readable sibling TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean:114,125,238 also exhibits native signatures for three of these statements; this is evidence of statability, not a proposed dependency on that later roadmap.

5. **F05** (P2) Specialization to an unspecified cusp is treated as specialization to infinity

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1475: “Since φ(P) reduces to φ(∞)=0”; compare §§5.14–5.15.

   **Claim:** The cusp specialization from §5.14 satisfies the hypothesis of the formal-immersion statement at the fixed cusp infinity in §5.15.

   **Witness:** darmon-merel lines 719–725 first change the nonsplit Cartan marking and possibly apply w_r. At r=5,p=11 there are two cusp packets, over 0 and ∞, each with five conjugates; §5.14 selects neither packet.

   **Exact repair text:** “Prove the cusp-transport comparison: a change of Cartan marking and, if necessary, w_r carries any geometric cusp to the chosen infinity. Transport the integral cusp chart, the full-new winding quotient and its Abel map along this isomorphism, proving Hecke/annihilator compatibility. Consequently, for every cusp c, the translated map φ_c(P)=π[P−c] is a formal immersion at c in the stated residue characteristics and has torsion image on rational P. Apply these statements with the actual specialization cusp c.” Add this comparison before §5.17, with darmon-merel §8, lines 719–738 as locator. The torsion assertion uses §5.10a for changing the base cusp.

   **Repair test:** For a cusp over 0 at r=5,p=11 and q=23, Galois conjugation alone stays over 0; w₅ is needed to reach the infinity packet. The corrected φ_c specializes to 0 by construction. The original φ_∞ specializes instead to π[c−∞], whose vanishing was not proved.

6. **F06** (P3) Two norm-bound locators name the wrong lemma

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:395,419: “proof of Lemma 2.1”; “§2, Lemma 2.1”.

   **Claim:** Bennett–Siksek Lemma 2.1 contains the integer-norm divisibility and the coefficient-degree bound.

   **Witness:** bennett-siksek-2020 lines 191–193 state only Frobenius congruences. Norm divisibility is line 201 and the coefficient-degree inequality is line 203, both inside the proof of Lemma 2.2 beginning at line 198.

   **Exact repair text:** At §1.2 cite “bennett-siksek-2020, proof of Lemma 2.2, p.359, lines 198–201”, alongside the already specified general norm declarations. At §1.4 cite “Lemma 2.1(ii) for the congruence, and proof of Lemma 2.2, p.359, lines 198–203 for the norm bound”.

   **Repair test:** With K=ℚ(√2), p=2 and c=√2, Norm(3−√2)=7≤(√2+1)⁴. The corrected locator contains this norm-product argument; Lemma 2.1 alone supplies only a congruence.

7. **F07** (P2) The finite-model image checks have no stated exceptional-prime bound

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1612,1624: “prove an upper bound for all nonsurjective primes”; “prove a bound on every possible nonsurjective prime”.

   **Claim:** The listed local and finite-group inputs provide a proof route certifying every prime above 37 for the finite j-lists.

   **Witness:** lemos-2017 lines 204–213 and 261–264 use database computations. ArithmeticGaloisRepresentations §6.4 defines open-image predicates; it supplies no exceptional-prime bound. Neither subsection states the bound, its parameters, or the finite certificates replacing those computations.

   **Exact repair text:** “Before the model checks, prove the following general finite-witness bound for a geometrically non-CM E/ℚ. Let S be a finite set of rational primes containing 2,3 and its bad primes. List the nontrivial quadratic characters unramified outside S. For each ε choose a good prime q_ε unramified for ε with ε(Frob_qε)=−1 and a_qε(E)≠0, and put B(E)=max({163}∪{q_ε,|a_qε(E)|:ε}). Prove that every nonsurjective prime p satisfies p≤B(E). For the nonsplit alternative, prove the quotient character is nontrivial and unramified outside S, including at p; if p≠q_ε, the trace comparison gives p|a_qε(E). Existence of each witness uses the non-CM exclusion of a quadratic self-twist, Faltings's isogeny criterion and Chebotarev. The Borel, split and exceptional alternatives are supplied by §§4.7,5.3,5.7. For each rational model in §§5.26–5.27, state exact character/Frobenius witness data and prove exclusion of every remaining prime 37<p≤B(E), then transport by §5.24.” Cite the earlier FaltingsFinitenessAndIsogenyTheorems §R28.4.7 and Chebotarev Layer 10. This is one possible precise general proof route; another requires an equally explicit bound and independent certificates.

   **Repair test:** On E:y²+y=x³−x²−10x−20, good q=2 has a₂=−2. The character of ℚ(√−3) has ε(Frob₂)=−1 and is unramified outside S. A nonsplit quotient with this character would force p|−2 for p>37, which is impossible. A zero trace would instead give p|0 and exclude no prime; the explicit nonzero condition prevents that vacuity.

## Verified sound

Read all 1,675 README lines, all 178 Suggested.lean lines, and all 17 supplied elaborated signatures: 8 theorems and 9 supporting definitions, abbreviations or instances. Audited all 100 numbered target sections, the additional definitions within them, and all 100 Check bullets in 28 blocks. Resolved and read 95 distinct numbered source-line anchors in 13 available works; R06 identifies two incorrect lemma labels. Six Kenku works remain settled as uncertified. Checked the 22 roadmap supplier groups listed below, their cited sections and the eight declared gap contracts. These counts describe the review coverage, not a proof of every proposed theorem.

The supplied elaboration transcript retains every ellipticity, nonzero-level and primality instance needed by the statements. I compared every elaborated type with its README statement; none lost a section binder. I did not run Lean or generate a second elaboration, in accordance with the read-only/no-build instruction. Every current theorem is a substantive result: the one-tactic probe found no theorem that is merely a definition, a small value, a boundary case or one pinned library theorem. No deletion for padding is proposed.

The head is f72311b68918682528907159ff522a4193020420. The read-only diff against origin/main reports 9 changed files, all inside packages/EllipticModularityEffectiveComparisons. There is one import Mathlib and six existing individual TauCeti imports. There is no sorry'd data, set_option, lemma declaration, process narrative in README/docstrings, or executable computational algorithm in the package's mathematical targets.

The prescribed dependency check returned exactly:

```text
depcheck: 56 roadmaps, 657 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All eight gap slugs match design/plan.json and the README contracts. They name earlier suppliers and precise missing comparisons. Their current absence is not a finding. The dependency checker does not detect the unstated mathematical inputs in R01, R05 and R07.

The settled overlap with the later EllipticCurveModularityPartII is not re-raised: packages/EllipticModularityEffectiveComparisons/reports/FIX-PKG-EllipticModularityEffectiveComparisons~2.md, F02, assigns that coordination outside this package. Its current head still duplicates objects, including the dimension and ideal-Sturm targets. The two Suggested.lean namespaces differ; a namespace search found no fully qualified declaration collision. Object searches covered main, Completed, board packages and the indexed open heads, with the supplied EllipticCurveModularityPartII checkout inspected directly. The general Siegel-function owner newly relevant to §5.3c is recorded in R03. The local arithmetic inversion, exact Kraus comparisons and five-level application belong here; the earlier generic elliptic/modular constructions remain imports.

The tables below record actual evaluations. “Compatible” means that the stated instances and conventions agree; it does not claim an independent proof of an infinite theorem. Finite-field computations use nonsingular reductions when they test an elliptic assertion. A singular reduction, characteristic-p geometric torsion, or a zero level is explicitly a negative control, not an admissible instance. Arbitrary zero rings are tested only in §3.7, where they are allowed; all number-field and elliptic statements exclude them. No statement in this package quantifies over arbitrary non-quasi-separated schemes, infinite-rank modules or arbitrary topologies; those defect classes are outside its carriers.

### Sampled adversarial evaluations

These samples retain computed boundary cases, convention comparisons and finding witnesses; the exhaustive per-target ledgers are omitted from this report.

The declaration samples use namespace TauCetiRoadmap.EllipticModularityEffectiveComparisons. There are no ambient mathematical section variables: every required binder is explicit. E denotes WeierstrassCurve ℚ with E.IsElliptic; geometric points are over AlgebraicClosure ℚ.

| Declaration and line | Section; full parameter/instance context | Instances and computed values | Result/change |
|---|---|---|---|
| localTerms, 42 | 0.1; p,e:ℕ; output Fin 5→ℚ; no instances | (0,0)↦(1,1,1,1,1); (2,2)↦(1/4,0,−1,1,0); (3,2)↦(5/9,1,1,−1,0); (2,3)↦(3/8,0,1,0,0); (4,1)↦0 | Real body agrees. Fin 5 excludes an out-of-range coordinate. |
| martin_sharp_bound, 77 | 0.16; N:ℕ, [NeZero N]; natural-number inequalities | N=1: 0<2, both equality conditions false; 11:12=12, residue 11; 35:36=36; 30:12<31. N=23:24=24; N=13:0<14. | Both directions of equality characterization tested. |
| torsionModule, 96 | 4.0; E; n:ℕ; Module (ZMod n) on GeometricTorsion E n | At n=2, 2•P=0; n=1 has the zero ring acting on the one-element module; n=0 gives ZMod 0=ℤ acting on all points. | Native scalar action; no missing ellipticity instance. |
| torsionRepresentation, 101 | 4.0; E; n:ℕ; actual Galois operators linearized over ZMod n | Identity sends P to P; composition sends P to σ(τP). Mod 2: x³−3x−1 has discriminant 81 and C₃ action with no fixed nonzero vector; x³−x+1 has discriminant −23 and S₃ action; x³−2x fixes (0,0). | Correct irreducible-versus-absolutely-irreducible convention. |
| SplitNormalizerImage, 155 | 5.0; E; p:ℕ; distinct order-p additive subgroups and universal Galois transport | At p=11, pair stabilizer size 200 versus nonsplit size 240 and GL₂ size 13,200. At p=2, pair stabilizer 2 versus normalizer of {I} size 6. | Definition itself precise; interpretation needs R02. |
| lemos_uniform_surjectivity, 172 | 5.28; E; geometric non-CM; n>1 with cyclic isogeny; p prime,37<p | n=1 fails premise. p=37 fails bound; p=41 admitted. GL₂(𝔽₄₁) has (1681−1)(1681−41)=2,755,200 elements. A CM nonsplit image has at most 3,360, so non-CM is essential. | Actual torsion action and full automorphism target; R07 concerns its proof plan. |

For the README samples, g is the actual new dimension, v the Martin expression, I the Γ₀ index, and E₁₁ is y²+y=x³−x²−10x−20.

| Statement | Admissible/boundary instances | Values on both sides or separating values | Result/change |
|---|---|---|---|
| Conventions: Frobenius | y²+y=x³−x over 𝔽₂ | #E=5; a₂=−2; arithmetic polynomial X²+2X+2, determinant 2; inverse polynomial X²+X+1/2, determinant 1/2 | Correct; covariant torsion fixed. |
| Conventions: winding direction | Fourier terms q+2q², path 0→i∞ | L(1)=1+2/2=2; normalized period −2; unscaled period i/π; reversed path gives +2 | Correct; source sign corrected in package. |
| Conventions: cusp parameter | width 11, f=t+2t², characteristic 23 | 11f dt/t=11dt+22t dt; cotangent 11dt≠0, whereas a₀=0 | Correct; characteristic 11 is excluded from this model. |
| 0.2 arithmetic dimension | N=0,1,11,30,35 | v=0,0,1,1,3; unguarded v(0)=−1/12; full-space dimension at 30 is 3 | Zero guard/newness essential. |
| 0.10 small composites, ω≤2 | All 772 eligible integers ≤1521 | Zero failures; equality set exactly {35}, where 36=36 | Exhaustively recomputed finite target. |
| 0.15 residual finite family | All 11,250 exponent/prime tuples; 10,125 distinct N | Minimum N−12v=18; no value below 18 | Exact bound confirmed including repeated N when d=0. |
| 1.2 integer norm divisibility | K=ℚ(√2), x=3−√2, λ above 7; x=0 control | Norm x=7 and 7≤7; Norm 0=0, so the positive lower bound needs x≠0 | Mathematical statement sound; R06 locator. |
| 1.3 all-embedding bound | K=ℚ(√2),p=2,c=√2; one-embedding control c=100−70√2 | Norm(3−√2)=7≤(1+√2)⁴≈33.971. Wrong one-embedding model: conjugates ≈1.005,198.995 and norm −391 | Every embedding is essential. |
| 2.2 G | N=1,4,11 | lcm=4,4,44; I=6,6,72; G=4,4,13+4√3. Wrong 4N at N=4 gives G=9 | Correct lcm and square root. |
| 3.7 local filters | (2,0,3),(2,2,0),(3,1,−1),(3,2,0); zero ring | (1−3X+2X²,1),(1,1),(1,1−5X),(1,1−4X+3X²); over zero ring both constants 1=0 | All five Checks agree; R_p is rescaling, not T_p. |
| 3.7a ideal Sturm | k=0,J=0,constant 1; k=2,N=4,J=4ℤ; unit ideal | Cutoffs 0 and 1; a₀=1∉0; odd series a₁=1∉4ℤ; unit ideal contains every coefficient; 2∈2ℤ but 2∉4ℤ | Correct constant term/ideal generality; missing Lean headline R04. |
| 3.10 global prime-power congruence | Newform of y²=x³−x at N=32; λ=(2),m=2 | Cutoff8; a₃=0,a₅=−2,a₇=0 differ from q+1 by −4,−8,−8, all in4ℤ. In contrast2∈2ℤ but2∉4ℤ | Deep arbitrary-prime-power target missing in Lean: R04. |
| 3.16 degree≤2 full-two realization | a=3,b=1; a=0,b=−1 | Quotient x(x²−6x+5)=x(x−1)(x−5), discriminant 16b=16 and 4 rational 2-points; second curve already has 4 | Degree 2 versus degree 1 separated; R04 missing headline. |
| 3.18 deletion/residual adapter | ℓ=11 with good reduction; multiplicative v_ℓΔ=22; additive at ℓ=5 | Good contribution 0; multiplicative exponent 1 deleted since11 divides22, leaving0; additive contribution need not be deleted although prime-to-5 conductor has no factor5 | Correct extra local condition; the 5,7 exception is not dropped. |
| 4.3 finite twelfth-power traces | q=3, a=0,1,2,3 | Recurrence gives A₁₂=1458,−1358,658,1458; negative a gives same even-power traces | Recomputed, including the endpoint trace3. |
| 4.13 cusp-only125 | 10 geometric cusps, 2 rational | 1+φ(5)+φ(5)+1=10; two degree4 packets plus two rational cusps; target noncuspidal0 | Distinguishes rational from geometric cusp count; primary uncertified. |
| 4.19 cyclic four-isogeny in class | Full2 curve and two distinct order2 kernels | Nonbacktracking composite degree4 has kernel C₄, with an order4 point; backtracking dual composite [2] has C₂² and every element killed by2 | Construction is in the isogeny class, not necessarily from the original vertex. |
| 4.22 full2 irreducibility | ℓ=5,7; negative control3 | 4ℓ=20,28 absent; at3 the point(4,36) doubles to(4,−36), so exact order3 coexists with4 rational2-points | Boundary Check is true and discriminating. |
| 5.0 nonsplit predicate | p=11 and2 | C has120 units at11, normalizer240; GL₂ order13200, split normalizer200∤240; at2 C₃ normalizer has6 elements | Cardinality excludes a scalar subgroup of order10; characteristic2 behavior correct. |
| 5.3a quantitative existence/cyclic corollary | d=1,2; heights≤985; identity; CM control | d1 bound9,702,250,000,000; d2 square root<6,895,000. Identity surface Δ=1, top degree2; cyclic2 givesΔ=2, top degree4. CM10⁷+i has cyclic degree10¹⁴+1>39,124,840,000,000 | Constants, full period bases and non-CM cyclic restriction agree. |
| 5.3c Runge inequality | p=5,17; j=0,1/2 | RHS48.0329316 and83.7895178; h(0)=0; h(1/2)=log2 but not an integral point | Numerical Checks sound; supplier attribution R03. |
| 5.5 Heegner–Gross criterion | p=17,D=3,c=2; D=4 control | χ₋₃(17)=−1; H₋₃=X,H₋₁₂=X−54000, derivatives1,1, resultant1. χ₋₄(17)=1 fails premise | Arithmetic witness valid; generalized-Jacobian proof inputs R01. |
| 5.8 proper image to nonsplit | p=41, non-CM | GL₂ order2,755,200; nonsplit normalizer order3360. Borel alternative would require a forbidden non-CM41-isogeny | No false full-image containment; missing statable comparison R04. |
| 5.10a all geometric cusp torsion | X₀(1),X₀(11); degree3 norm; period torus | Orders1 and5; pullback killed by5 gives15[D]=0, not exact order15. In ℂ/(ℤ+iℤ),1/5 has order5,√2 infinite. √2+(1/11−√2)=1/11 does not make summands torsion | All four Checks agree; norm retains ramification degree. |
| 5.12 exact boundary order and nonvanishing | (r,p)=(5,11),(7,17),(13,17); excluded(2,3) | p[D]=0; simple PSL₂ orders660 and2448 have no quotients11 or17, yielding exact orderp by source argument. At(2,3), genus0 gives[D]=0 and A₄ has quotientC₃ | Genus-zero auxiliary level is explicit; five-level extension source checked. |
| 5.14 cusp residue constraint | r=5,p=11,q=23; q=3 | Cusp field degree5; 23≡1 splits completely,3≠±1 does not. Rational denominator specialization can be in either of two packets of5 cusps | Residue statement valid; it does not choose infinity. |
| 5.17 denominator exclusion | r=5,p=11,q=23; cusp over0 | 23≥21>r,3; ramification e=1<22; φ_c(P) reduces0, while φ_∞(P) reducesπ[c−∞] | R05 is the missing transport step. |
| 5.18 integral j | CM E:y²=x³−x,r=2,p=11; j=1/p control | Actual j=1728∈ℤ and nonsplit containment at11; 1/11 is integral away from11 but has v₁₁=−1 | p-place argument is necessary; stronger CM-inclusive headline missing, R04. |
| 5.20 j-coordinate identity | r=2,t=8,−64,−16,0 | Quotients1728,1728,0; at0 the rational function has a pole despite total field division giving0 | Noncuspidal t≠0 and normalized coordinate essential. |
| 5.21 signed-divisor implication | r=5,t=−1; r=2,t=1/2; degree1 control | f₅(−1)/(−1)=64 and −1 divides125. f₂(1/2)/(1/2)=35937/4, not integral. f(T)=T,t=1/2 gives1, disproving a degree1 extension | Monic degree≥2 and signed divisors correct. |
| 5.22 finite integral j-sets | All signed divisors at five levels | Parameter counts26,14,8,6,4; image sizes25,13,8,6,4; union52. At r2, t8 and−64 both1728. r13 values −39091613782464,576,2101248,2045023375454208 | Exhaustively recomputed; outside11 gives empty set, not {0}. |
| 5.24 quadratic twisting | p=5,g=diag(2,1), quadratic determinant character | g maps to diag(3,4), determinant remains2, and a second twist returns g. det(−I)=1 | Surjectivity preserved; scalar twist cannot be treated as arbitrary matrix-valued twist. |
| 5.26 six model image theorems | E₁₁, good q=2, ε from ℚ(√−3) | a₂=−2, ε(2)=−1; resulting obstruction p divides2 has no p>37. Zero trace would give p divides0 and no bound | R07 requires every character and remaining prime, not this sample alone. |

### Headline coverage and supplier resolution

The eight present headlines are Martin's dimension formula and sharp bound, the prime and composite rational cyclic-degree classifications, the two uniform irreducibility bounds, the split-normalizer exclusion and Lemos's surjectivity theorem. The six statable deep comparison headlines missing from the acceptance test are listed in R04. Scalar norm estimates, threshold algebra, table evaluations and local API identities should remain README material; they are not proposed additions to Suggested.lean.

The module docstring correctly identifies the presently unstatable removed-prime exponent theorem (§1.6), the two exact-conductor Kraus realizations (§§3.6,3.17), split modular-curve rational-point theorems, geometric cuspidal-divisor torsion, four exceptional-prime rational-point exhaustions, the mixed winding quotient/nonvanishing/formal-immersion theorems, and the quantitative height/isogeny bound. Their missing objects are arithmetic conductor/Serre weight, actual congruence or mixed curves and Picard quotients/integral models, or stable Faltings height. No free Prop field or bounded substitute is needed for them. The native elliptic image and j-integrality statements in R04 do not require those absent curve carriers.

| Supplier group checked | Resolved contract and boundary comparison |
|---|---|
| EllipticCurveModularity, R29.1,R29.3–R29.6 | Exact newform/conductor and modularity targets exist. Its fixed-curve reducibility finiteness is independent of this package's uniform irreducibility. |
| ModularForms, Layers0–4,6,8,8G,10/10C | Hecke recurrences, exact primitive decomposition, coefficient-orbit eigenlines and Γ₀ dimension formula exist. R03 corrects the unsupported modular-unit attribution. |
| SerreWeightAndLevelOptimisation, §§2.8,4.8,6.1–6.3 | Deletion level includes q=ℓ; lift at M₀ for ℓ≥3 is distinct from exact residual conductor/weight optimization. The two declared elliptic gaps retain that distinction. |
| ArithmeticGaloisRepresentations, §§2.3–2.4,3.1–3.6,4.2–4.5,5.1,6.1–6.4 | Fundamental characters, full Artin/Swan terms, finite-image classification, Frobenius and covariant elliptic Tate conventions resolve. §6.4's open-image definition is not an effective bound: R07. |
| NeronModelsAndSemistableAbelianVarieties, §§5.2,5.3h,5.4,6.4d | Residual conductor comparison is for ℓ≥5,q≠ℓ with wild terms. Semistable cotangent exactness requires connected quotient kernel and e<q−1; e=1,q=23 satisfies it, q=2 would not. |
| HeightsRationalPointsAndObstructions, §§1.4–1.7,1.13–1.19 | Descent, formal charts, all-torsion specialization under strict ramification bound and the two-isogeny Kummer coordinate exist. At x=0 the Kummer value is b, not0. |
| ModularCurvesPartII, §§3.8,4.1–4.2,4.8,5.2,5.5,9.1,9.5–9.7,10.1–10.3,13.1–13.3,14.11–14.12,14.15,16.2–16.6,17.3 | Ordinary modular curves/Jacobians, symbols, newform factors and base-point corrections resolve; mixed cusp/Chen comparisons are declared gaps. §17.3 explicitly retains the translation [αc′−c]. It does not supply R01's generalized winding comparison or R05's missing cusp transport. |
| AlgebraicModularFormsAndSerreWeights, R15.2,R15.4 | Integral lattices, q-expansion/Hecke and extension-sensitive local weights exist. Positive-characteristic mixed-level support descent is the declared gap, not inferred from characteristic-zero Fourier support. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1,R07.5 | Raynaud inertia exponents and finite-flat residual recipe resolve in their stated ranges; dyadic/general coefficient claims are not replaced by an ℤ_p-only theorem. |
| AutomorphicGaloisRepresentations, §§6.1,6.4 | Rank-two weight-two Tate summands and exact conductor/Euler factors resolve. The all-embedding/lattice residual comparison remains its declared gap. |
| DeligneWeightsAndPurity, §§1.1–1.4 | Arithmetic Frobenius on Tate and geometric Frobenius on the dual cohomology have matching weight-one roots; inversion on the same representation would give determinant1/q. |
| EisensteinIdealAndRationalTorsion, §§2.3,6.3–6.4,7.9 | Nonzero finite Eisenstein quotient and formal immersion away from2 resolve. §7.9 includes the relevant semistable/composite-level range; no false “prime levels only” objection is raised. |
| ImaginaryQuadraticClassNumber, H1.1–H1.4,H3.5–H3.6 | Quadratic orders and certified singular values/class-number-one classification resolve. H3.2 already owns the general Siegel functions newly needed in R03. |
| ComplexMultiplicationAndExplicitReciprocity, §§3.1,5.1–5.5 | Actual order class polynomials, geometric endomorphisms and split/inert/ramified reduction comparisons resolve. Supersingular maximal-order types are realized, not falsely identified one-to-one with curves. |
| ClassFieldTheory, Layer13 | Ray/Hilbert fields, conductor–ramification compatibility and cyclotomic realization resolve. A finite character of G_ℚ unramified at every finite prime is trivial, including the potential infinity issue. |
| ModularSymbolsPadicLFunctions, §§0.6–0.8,1.1–1.2 | Homological duality, rational boundary splitting and Mellin comparison resolve. The supplier integrates ∞→0 for +L, so this package's 0→∞ period is −L. No sign drift. |
| MordellLawrenceVenkatesh, §8.11 | Actual Picard Jacobian/complex period lattice, integral H₁ and finite-map covariance resolve. Rank0/genus0 gives the zero torus; torsion order1 is retained. |
| EulerSystemsAndKolyvaginSystems, §§4.7,5.13 | Arithmetic descent/self-dual length statements exist with their hypotheses. They do not alone provide the analytic-rank-zero bridge; the declared gap does. |
| ArakelovGeometryAndAbelianHeights, §§1.12,4.4,5.9 | Height conventions and stable isogeny-height comparison resolve. Its Faltings normalization differs from Deligne's by −½logπ; the package uses the correct h_F. Quantitative period estimates remain declared. |
| FaltingsFinitenessAndIsogenyTheorems, R28.4.5–R28.4.7 | Integral Tate/Hom comparison, semisimplicity and isogeny recognition resolve. These are qualitative and do not supply Gaudron–Rémond constants. |
| EllipticCurves, Layers1–7 | Native quotient/dual isogenies, geometric torsion, finite-field point/Hasse comparison, reduction, twists and descent resolve on main. The cyclic4 construction does not assert that [2] is cyclic. |
| Chebotarev, Layer10 | Actual conjugacy-class density #C/#G over number fields, infinitude and finite-exception removal resolve on main. This is not a finite trace-sampling theorem. |

Pinned library checks used Mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 from lake-manifest.json. In particular:

| Native object/declaration | Pin location inspected; discriminating detail |
|---|---|
| Nat.factorization; prod_factorization_pow_eq_self | Mathlib/Data/Nat/Factorization/Defs.lean:50,96; reconstruction needs n≠0. |
| moebius; moebius_apply_prime_pow; moebius_mul_coe_zeta | Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51,112,156; exponent-zero handled separately, ζ(0)=0. |
| sigma; sigma_zero_apply; totient_eq_mul_prod_factors | Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:143,178; Mathlib/Data/Nat/Totient.lean:313; divisor multiplicities count τ, not distinct prime factors. |
| norm_eq_prod_embeddings; isIntegral_norm; norm_ne_zero_iff | Mathlib/RingTheory/Norm/Transitivity.lean:261,211; Mathlib/RingTheory/Norm/Basic.lean:110; finite separable extension/scalar tower and finite-free domain hypotheses read. |
| Ideal.absNorm_mem; absNorm_dvd_norm_of_mem; Algebra.coe_norm_int | Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:329,396; Mathlib/NumberTheory/NumberField/Norm.lean:38; integer and rational norms explicitly compared. |
| card_algHom_le_finrank | Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean:91; finite-free algebra into a domain. This is not itself the independent-eigenline dimension theorem. |
| NumberField.exists_ideal_in_class_of_norm_le | Mathlib/NumberTheory/NumberField/ClassNumber.lean:77; actual field degree, discriminant and signature enter the bound. |
| Representation.IsIrreducible | Mathlib/RepresentationTheory/Irreducible.lean:29; simplicity includes nontriviality, excluding the zero module. |
| AddMonoidHom.toZModLinearMap; torsionBy.zmodModule | Mathlib/Algebra/Module/ZMod.lean:81; Mathlib/Algebra/Module/Torsion/Basic.lean:1010; additive operators are linear over ZMod n, including the total n=0,1 conventions. |
| cuspFormsNew; cuspFormCharSpace | TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202; TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279; Γ₁ newspace plus a separate character restriction. |
| cuspFormsNew_inf_cuspFormCharSpace; cuspFormCharSpaceOneEquiv | TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean:161; TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean:220; actual trivial-character Γ₀ transport. |
| ModularForm.eq_of_sturm_bound | TauCeti/NumberTheory/ModularForms/SturmBound.lean:102; characteristic-zero equality, strict period and discrete-period hypotheses, not arbitrary-ideal reduction. |
| HeckeRing.GL2.Newform; UpperHalfPlane.qExpansion | TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104; Mathlib/NumberTheory/ModularForms/QExpansion.lean:171; enough to state the missing coefficient headlines. |
| WeierstrassCurve.torsionGaloisAction | TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64; actual coordinate action, no irreducibility or surjectivity assumed. |
| Isogeny; degree; ker; map | TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139; TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99; TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Kernel.lean:75; TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/BaseChange/Basic.lean:212; geometric kernel and nonconstant map retained. |
| Isogeny.Hom | TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:106 and TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Add.lean; includes zero and the ring operations, so the non-CM definition quantifies over all endomorphisms. |
| WeierstrassCurve.map; j | Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:230,388; actual reduction/rationalization and j-invariant, with ellipticity for j. |

### Source locator audit and independent error witnesses

| Source | Text/locators resolved | Audit result |
|---|---|---|
| martin-2003 | Definitions1A–1F, Theorems1–2, equation16, Lemmas16–22 and residual-family paragraph; lines69–113,405–465,747–850 | Tables, inversion, constants and complete equality characterization match. All three finite arithmetic subtargets were recomputed. |
| bennett-siksek-2020 | §2 Theorem3/Lemmas2.1–2.2 and §3 torsion uses; lines163–207,294,329 | Removal and norm argument match after R06 locator repair. Source exponent wording is a misprint, not inherited by README. |
| kraus-1997 | §3, Theorems3–4, AppendixII Propositions1–2 and §8.1; lines200–441,1060–1228 | F,G,H, strict inequalities, full conductor, filters and arbitrary-ideal comparison match. The source explicitly corrects the earlier deficient Sturm cutoff. |
| mazur-1978 | Introduction table/Theorem1, §5 isogeny characters, §6 traces, §7 prime exclusion; lines14–105,810–1068 | Prime list, CM cases, fractional exponents and trace recurrence agree. Composite classification is not falsely assigned solely to this paper. |
| banwait-najman-padurariu | Table1.1/Theorem1.1 and §2; lines55–73,228–260 | Confirms the final cyclic-degree list and secondary descriptions of Kenku's exclusions. It does not independently certify their primary proofs. |
| serre-1981 | §8.4 Lemmas18,18′; lines2525–2566 | Local inertia bound is unconditional; the later GRH-dependent global bound is not used in the package. |
| bilu-parent-rebolledo | Theorems1.1,3.1,4.1, Proposition4.3, Corollary5.7, Proposition5.9; lines104,328–330,560–652,730–850,970–977 | Constants and strict theorem boundary agree; R01 concerns missing proof machinery. Full finite resultant certificates were not independently rerun. |
| gaudron-remond | Theorem1.4, Proposition6.9, Theorem7.5 and §§7.3–7.5; lines168–184,1375–1425,1528–1544,1598–1734 | General geometric isogeny bound, CM branch, surface degree2nΔ and Faltings normalization agree. |
| bilu-parent-split | arXiv0807.4954v5 Theorem6.1 and Appendix; lines430–444,503–552 | Allowed p=11 or≥17, CM inclusion and the need for the separate characteristic2 cusp argument agree. |
| darmon-merel | §§6–8, Corollaries6.3–6.4, Propositions6.5,7.1–7.2, Lemmas8.2–8.3; lines490–810 | Boundary-order, winding and torsion-image strategy supports the targets; R05 identifies the omitted cusp change. Published text contains the sign/basis slips recorded below. |
| lemos-2017 | Theorem1.1, Propositions2.1–2.2, Theorem2.3, j-table and §3; lines44–395 | Endpoints, signed finite values and five-level extension agree; model-image proof uses external computations, addressed by R07. |
| elkik-1990 | Theorem, §I and §§II–III; lines23–71,135–173,225–239 | General geometric cusp-torsion theorem and full-level reduction support §5.10a. The overly general differential-isomorphism sentence has the counterexample below. |
| mazur-1977 | Introduction Theorem4 and prime-level tables, pp.34–41; lines73–97,300–574 | Finite Eisenstein quotient orders and distinction from full-Jacobian rank agree; OCR table columns were cross-checked with the 1978 point table. |

Additional computed source-error witnesses: for E:y²+y=x³−x, Δ=37, #E(𝔽₂)=5 and #E(𝔽₃)=7, so rational torsion is trivial and (0,0) has infinite order. This supplies a positive-rank conductor-37 quotient of J₀(37), refuting the rank-zero sentence in lemos-2017. For p=37, evaluating the degree-18 Legendre Hasse polynomial over 𝔽₃₇[u]/(u²−2) gives 18 Legendre parameters and supersingular j-values {8,3+10u,3−10u}. Frobenius exchanges the last two. Their geometric endomorphism rings are isomorphic by Frobenius transport, so maximal-order type cannot distinguish these two curves. For x=t² on ℙ¹ with boundary {∞}, pullback dx=2t dt vanishes at0, so it is not an isomorphism of logarithmic differential line bundles there.

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum remain uncertified at their published locators. Their status is settled; no new source request was made. The secondary table confirms their stated conclusions, not the complete primary proofs or all explicit model calculations.
- No new Lean build or elaboration was run. The supplied elaborated-signature artifact was checked against all 17 source declarations. The new signatures requested in R04 require the repair worker's permitted elaboration; the native-carrier evidence establishes that missing conductor/curve theories are not an obstacle to stating them.
- The universal finite resultant assertion through 14,000,000 in §5.6 was checked against the source and at p=17, not exhaustively reverified from all class-polynomial coefficients. This is distinct from the Martin finite arithmetic families, which were exhaustively recomputed.
- The all-prime residual-image certificates for the six large-isogeny j-values and the non-CM integral j-list were not independently certified from database output. The cited source describes computations rather than giving the witness data required by R07. The report does not treat finitely many trace samples as that certificate.
- The large-genus rational-point fiber exhaustions at 37,43,67,163 were checked as source statements and for their numerical/CM consistency, not re-proved by independent descent or fiber calculation. No rank-only argument was accepted as an exhaustion.
- The eight declared supplier gaps remain conditions on the eventual library. They are precise announced contracts, not unowned prerequisites or findings merely because the supplier has not implemented them.

## Source issues

- **Misprint** in bennett-siksek-2020 at §2, definition preceding Theorem3, printed p.358, line174: the source says ord_q(x) is the largest prime power dividing x; it should be the exponent v_q(x); affects a stated result.
- **Misprint** in darmon-merel at Proposition7.1 proof, author-version p.21, lines660–663: the source says the normalized integral from 0 to i∞ equals L(f,1); it should be −L(f,1), with that orientation; affects a stated result.
- **Misprint** in darmon-merel at Proposition7.2 proof, author-version p.22, line696: the source says α_r((∞)−(0)) equals D; it should be −D under Corollary6.4; affects nothing.
- **Misprint** in darmon-merel at Lemma8.2 proof, author-version p.23, lines753–755: the source says dt/t is a basis of the ordinary cotangent at t=0; it should be dt, with the modular differential's width factor retained; affects the proof.
- **Error** in lemos-2017 at Theorem1.1 proof, p.5, lines193–194: the source says J₀(37) has rank zero; it should be positive rank, with a conductor-37 rank-one elliptic quotient; affects the proof.
- **Error** in lemos-2017 at §3, p.8, lines308–309: the source says the degree-p pullback d* preserves divisor degree; it should be multiplication of degree by p, which still preserves degree zero; affects nothing.
- **Misprint** in lemos-2017 at Proposition2.4 proof, p.7, line280: the source says the S-unit parameter must be p^k; it should be ±p^k, retaining negative units; affects the proof.
- **Misprint** in bilu-parent-rebolledo at Theorem3.1 proof, printed p.968, line572: the source says an integer j has height log|j|; it should be log max(1,|j|), including j=0; affects nothing.
- **Error** in bilu-parent-rebolledo at §5.1.2, printed p.975, line812: the source says supersingular curve classes biject with maximal-order types; it should be ideal-class data, since distinct Frobenius-conjugate j-values can have the same endomorphism-order type; affects the proof.
- **Error** in elkik-1990 at §II, printed p.62, lines135–148: the source says logarithmic differentials pull back isomorphically for a finite map of smooth open curves; it should be restricted to maps étale off the boundary, or include interior ramification; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f72311b68918682528907159ff522a4193020420", "job": "RT-EllipticModularityEffectiveComparisons~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
