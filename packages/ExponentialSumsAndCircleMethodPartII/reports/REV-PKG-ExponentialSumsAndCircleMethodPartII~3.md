<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1266#issuecomment-6399948862 -->
Review (codex) of 5607256

Verdict: accepted
Conditional on the announced gaps: `sf-fibre-strata`, `ecf-character-fourier`, `edc-top-components`, `lpv-universal-monodromy`, `ecf-one-variable-fourier`, `symmetric-lattice-shrinking`, `at2-arrangement-cohomology`, `at2-stable-diagonal`, `at2-tame-polynomial`, `at2-tame-bouquet`, `at2-double-loop-betti`, `at2-fermat-loop-connectivity`

No new findings. All four findings from round 2 are repaired. Acceptance is conditional on the twelve declared supplier contracts listed below; it does not certify their implementation, the sharp minor-arc proposition, or existence of the stronger germ topology.

## Previous findings checked individually

Locations in this table are in `packages/ExponentialSumsAndCircleMethodPartII/README.md`.

| Previous finding | Status | Repaired passage and independently checked witness |
| --- | --- | --- |
| F01 (P2), specialization of the characteristic-p Fourier filtration | Repaired | Line 1120: “Transport its pages, differentials and finite abutment filtration abstractly through chosen E-vector-space isomorphisms”; line 1126 limits transport to the known comparison range. Line 1128 explicitly disclaims extending the character sheaf. For y⁵−y, the derivatives are −1 in characteristic 5 and 5y⁴−1 in characteristic zero: zero versus four critical points. The repaired construction needs no characteristic-zero Artin–Schreier object. The contract at line 59 agrees. |
| F02 (P3), ownership of the primitive-rank formula | Repaired | Line 745: “EtaleDualityAndPerverseSheaves §4.7's hypersurface formula with hypersurface dimension n₁−1 gives rank N₁=(k−1)((k−1)^n₁+1)/k”. The supplier formula at `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4658` gives 6, 21, 22 at (k,n₁)=(3,3),(4,3),(3,5). Scope, contract, Needs and layer dependencies now identify that owner. |
| F03 (P3), undefined binary quadratic polar form | Repaired | Line 975: “the unary polar form is Ψ₁(y)=2y and Δ_yG=−2ay−y²”. At a=y=1 the linear term is −2 and the full difference is −3. For the cubic, the linear term is +6auv. The undefined Ψ(a,y) does not recur. |
| F04 (P3), missing discriminating boundary-twist Check | Repaired | Line 726: “Its degree-2 primitive group is E(−1)⁶, with eigenvalue 25.” Independent finite-field calculation gives 19225 affine-cone points, hence 801 projective points and primitive trace 150=6·25. The 27 rational lines have intersection-matrix rank 7. The closure primitive rank is 10, giving affine middle rank 16. An erroneous extra twist gives 625, not 25. |

Rechecked all passages changed by those repairs: Scope, Exact supplier contracts, §§6.3 and 6.5, Layer 6 Dependencies, §8.7, and the entirety of §10.1. Searched the complete package for the same spreading, primitive-rank, twist and difference patterns. The remaining general-field consequences use vector-space transport only. The finite-field comparison is proved by localization and minor-arc vanishing before it is used in spreading; the mention of §10.2 in §10.1 refers specifically to that finite-field proof and does not use the general-field conclusion circularly.

## Verified sound

Read all **89 numbered targets**, their API bullets, **251 Check bullets**, all **89 Needs lines**, and the **14 layer Examples and Dependencies**. Read `Suggested.lean`, `metadata.toml`, `sources.toml`, the previous review and repair report, the board package index, and the plan's twelve gap entries. No package text or source text was treated as an instruction.

For untouched passages, retained the previous review's adversarial evidence only where its table gave actual values. Its grouped numerical rows cover the unchanged dimension, prime, Fourier, cancellation, configuration, support and topology statements. I also recomputed the present sample, both Lean headlines, every changed mathematical passage, and the conditional endpoints. The table below records this round's sample/headline/repair evidence rather than reproducing an extensive per-target ledger. Finite examples are negative-control and normalization tests, not substitutes for checking the general arguments.

The package develops the general library rather than a single example: all-field coefficient geometry, all finite constant-field extensions in the polar bound, and characteristic-zero or characteristic->k irreducibility remain. The even-order coefficient-prime restriction is attached to the coefficient-conjugation route, with the two prime adapters used appropriately; it is not a restriction of the geometric irreducibility conclusion to preferred residue primes. The accepted Part II scope does not reconstruct a named predecessor. No algorithms, copied source passages, sorry'd data, `set_option`, admitted examples, artificial Prop fields or extra imports occur. The README has the required shape; definitions have APIs and at least three Checks. The two theorem bodies are the only uses of `sorry`.

### Seeded source sample

All four manifest works are legally cached and readable, including both STACKS chapter extractions. No author-marked unverified locator occurs. No source fetch, manifest amendment or missing-reference request was necessary. BS20 is the published text; BV15 and LR14v2 are the explicitly recorded preprint versions. The fifteen requested targets were checked as follows.

| Target and README location | Text opened at locator | Verification |
| --- | --- | --- |
| §4.2, line 364 | BS20 Lemma 2.4(1)–(2), printed pp.903–904; BS20 line 466, line 484, line 496 | Determinantal closedness and Hankel nesting agree. The argument uses the recurrence, not an arbitrary rank comparison. Reduced loci and scheme conventions are stated separately. |
| §4.4, line 391 | BS20 Lemma 2.4(4), printed pp.903–904; BS20 line 470 and line 496 | Actual denominator degree m′≤m and error exponent −L−1+m−m′ are correct. Zero numerator at m′=0 and both implications were tested. |
| §4.6, line 418 | BS20 §3 definition, printed p.908; BS20 line 709; Lemma 3.1, pp.908–909, BS20 line 717 | Exact stratum, monicity, coprimality, m≤L/2 and regular pair chart agree. The m=0 pair is (0,1). |
| §6.6, line 755 | BS20 Lemma 4.4 and proof, printed pp.925–926; BS20 line 1447, line 1452, line 1481 | Degree a+m(n−1)−2nd and twist −m−n(d−m) match the absolute formula. The stated m≤d restriction is retained. The source's relative trace-twist misprint is not copied. |
| §7.2, line 797 | BS20 Proposition 2.5(1)–(2), printed p.905; BS20 line 553 and line 559; calculation at BS20 line 1317, p.922 | Substitution a=m+s gives s+mn−2nd. The finite columns and unshifted abutment agree. The wider standalone n≥2 range does not assert monodromy parity. |
| §7.3, line 810 | BS20 §4, printed p.922, BS20 line 1325 and line 1342; proof of Proposition 4.1, pp.926–927, BS20 line 1501 | Relative phase, stalk identification, lisse first page and equivariant subquotients agree. This construction remains in characteristic p. |
| §8.4, line 918 | BS20 Lemma 5.4 and proof, printed p.929; BS20 line 1609 | Künneth and the affine change (a,y)↦(a,a+y) support both equalities. The roadmap explicitly adds the absorbing −∞ convention for acyclic factors. |
| §8.6, line 945 | BS20 Proposition 5.5, printed pp.930–932; BS20 line 1635, line 1665, line 1695, line 1727 | The numerator and denominator powers of two agree. The roadmap correctly keeps the induction order when actual degree drops, and separates empty fibres and the rational k=1 interpretation. |
| §9.5, line 1092 | BS20 Proposition 2.6, printed p.905; BS20 line 570; proof p.934, BS20 line 1845 and line 1862 | The sharp cutoff is the printed claim. The proof's rounding step does not establish it. The roadmap calls it an explicit proposition and does not claim to prove it. |
| §10.2, line 1143 | BS20 Theorem 2.7(3) and proof, printed p.906; BS20 line 594 and line 606 | The localization comparison and shift are supported; the conservative range is the roadmap's explicitly weaker deduction. Vanishing in degrees j and j+1, not j−1, is used. |
| §11.1, line 1278 | BS20 (7.1), printed p.940; BS20 line 2149 | Fixed homogeneous leading vector, z=1/T, order d and O(|z|^(d+1)) match. The distinction between pointwise germs and topology is explicit. |
| §11.10, line 1437 | BS20 Lemma 7.2/proof, printed pp.940–941; BS20 line 2174 and line 2181 | BS20 supplies the setting, not the new winding theorem. The original attribution is accurate. Independently checked common-tail homotopies, based normalization and additivity. |
| §12.1, line 1486 | BS20 Lemma 7.2/proof, printed pp.940–941; BS20 line 2181 and line 2190 | The weighted fixed-radius topology is an original refinement, not attributed as a theorem of the source. Its O-bounds make the displayed distances finite and the half-disc condition prevents zeros. |
| §12.3, line 1524 | BS20 Lemma 7.2/proof, printed pp.940–941; BS20 line 2176; DGFloer Layer 2 items 2–3 | The precise extension-space theorem is the explicitly stated application of the existing restriction-fibration owner. A chosen extension supplies the path to the constant boundary loop. |
| §13.1, line 1580 | BS20 Conjecture 7.1, printed p.940; BS20 line 2159 through line 2172 | Pairing direction, compact support and strict range agree. Topology, continuous inclusion and justified trace are explicit parameters; perfection remains conjectural. |

Also reopened BS20's spreading passage (BS20 line 619 through line 641), primitive extension and Goursat argument (BS20 line 1358 through line 1442), and polarization (BS20 line 1732). For the independent counting prefix, BV15 line 530 gives the inclusive-height bound; LR14v2 line 124, line 144 and line 231 give cumulative Bézout and the finite-field slicing antecedent. The arbitrary finite-grid version is correctly labelled an adaptation. STACKS line 4237 (More on Morphisms, tag 05F9) gives fibre-dimension constructibility, while STACKS line 2964 and line 3202 (Homology, tags 012K and 0BK5) give the indexing and finite convergence used by the localization adapter.

### Adversarial computations

“Retain” means the stated hypotheses/conventions withstand this instance; it is not a claim that a finite test proves the theorem.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Dimension, prime and twist conventions | (n,k,d)=(40,3,2),(24,3,4); p=5,ℓ=19; point and line | D=74,84; tδ=3,2; 19≡−1 mod5 has order2; H_c⁰(point)=E with trace1 versus H_c²(A¹)=E(−1) with traceQ | Retain strict ranges and negative Tate exponent. |
| §§0.2,1.1 counting headlines | S={0,1}, line plus isolated point; F₂[T],h=2; h=0 | Grid count3≤2·2=4; strict polynomial line/plane counts4=2²,16=2⁴; h=0 gives one zero vector | Retain cumulative degree and strict height. |
| Mapping definitions: mappingPolynomial, mappingEquation, mappingIdeal | d=0; d=1,x=1,f=Y; f=0,1; dual numbers | Empty lower sum gives x; equation T+a₀ has coefficient1 and ideal⊤; f=0,1 give ideals0,⊤; ε²=0 although ε≠0 | Real bodies retain leading coefficients, emptiness and nilpotents; no smoothness assumed for definitions. |
| residuePhase | f=Y₁³−Y₂³+1,d=1,x=(1,1) | Phase b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c); f↦f+1 changes it by b₁; b=0 gives0 | Full polynomial retained. |
| §3.6 Fourier headline | One coefficient equation, zero versus nonzero value | Frequency integral E[−2](−1) versus0; recovery [2](1) gives E versus0 | Correct support and signs. |
| §4.2 nesting | Exhaustive b over F₂, L=0,3,5,6; over F₃,L=4 | Arc cardinalities respectively [1], [1,4,8,8], [1,4,16,32,32,32], [1,4,16,64,64,64,64], [1,9,81,81,81]; zero nesting failures | Retain. Closedness follows from minors; tested point inclusions. |
| §4.4 Padé iff | Same five exhaustive families, all m≤L; α=T⁻³,L=3,m=1 | Rank criterion and monic-denominator coefficient criterion have zero mismatches in 1078 (b,m) cases; exceptional example has denominator1 and error exponent−3=−L−1+m | Both directions and smaller-denominator branch retained. |
| §4.6 exact denominator open | m=0,1; cancelled numerator/denominator | Pair(0,1) gives b=0; (c,T−a) gives (c,ca,ca²,…), c≠0; (T−a)/((T−a)(T−b)) reduces to degree1 | Retain exact degree and coprimality. |
| hankelMatrix, §4.3 | L=9,b₅=1,m=4,5; m≥L | H₄ anti-identity has rank5 and determinant+1; H₅ has four rows and rank≤4≤5; empty-row rank0 over fields | Ceiling5 is necessary; no zero-ring rank claim. |
| §§5.13–5.14 signed-stratum headline | dimV=2,m=2,n=4,5; n=4,d=2,m=1 | Exterior dimension1 versus symmetric dimension3; degree index a−13, nonzero at a=15 from configuration degree2; outer twist−5 | Koszul sign used once; affine factor retained. |
| §6.3 repaired primitive sequence | Fermat cubic pair over F₂₅ | Boundary primitive rank6; closure primitive rank10; affine rank16=6+10. Cone count19225 gives (19225−1)/24=801 projective points; primitive trace801−1−625−25=150 | Retain; extra twist would give trace3750=6·625. |
| §6.3 line-spanning Check | Same cubic surface | Roots of r³=−1 are −1,3+2u,3+3u for u²=2; 3 partitions×3² ratios give27 distinct lines; their intersection matrix has rank7 modulo101, versus b₂=7 | Independent line-class verification of scalar Frobenius25, not just a rank assertion. |
| §6.5 repaired rank/monodromy headline | (k,n₁)=(3,3),(4,3),(3,5); nonsplit extension | Primitive ranks6,21,22; [[−1,1],[0,−1]]²=[[1,−2],[0,1]] | Cubic surface remains excluded; sole eigenvalue−1 need not mean −Id. |
| §6.6 relative stratum | n=4,d=2,m=1 | Absolute and relative formulas both give index a−13 and twist−5; a=15 gives configuration degree2 | Retain lissity via relative construction, not rank constancy. |
| §7.1 filtration | {0}⊂A¹ with constant coefficients | Boundary H_c⁰({0})→H_c¹(G_m) is rank1→rank1 isomorphism; survivors give H_c²(A¹)=E(−1) | Differential direction (1,0) correct. |
| §7.2 unnormalized page | n=4,d=2,m=1 and m=0 | m=1 configuration index s−12; s=14 gives2 and total15; m=0 has s=16 and total16 | Agrees with stratum cohomology. |
| §7.3 relative page | Fermat n=4,d=2; m=0; generalized eigenvalue test | Same degrees15,16 as stalk sequence; m=0 term E(−8) in degree16; (−1)^m changes sign under odd r, not even r | Stalk and monodromy conventions agree. |
| §§7.4–7.5 parity/normalized-page headline | p=7,ℓ=2,n=5,k=3,d=1; n=40,k=3,d=2,m=0 | ord₇2=3, yet odd-column eigenvalues differ; normalized zero term E(6−80)=E(−74) in total degree0 | No unnecessary even-order restriction on parity; normalization agrees. |
| iteratedPhaseDifference, §8.1 | G constant/linear,k=1; G=a²,k=2,3 | Loci point/empty; Δ_y a²=−2ay−y² gives y=0 at k=2, dimension0; two differences at k=3 admit all pairs, dimension2 | Explicit order survives actual-degree drop. |
| §8.4 degree identities | N=1, constant, linear, quadratic in p=5 | Constants: 2+2=4=cd(0 on A²); linear: −∞+(−∞)=−∞=cd(−y on A²); quadratic:1+1=2=cd(−2ay−y²) | Retain absorbing addition and invertible coordinate change. |
| §8.6 Weyl headline | G=a²,p=5,k=2,3; constant; N=0 | Actual cd1; RHS0+1=1 at k2 and (2+2)/2=2 at k3; constant RHS2=cd2; N0 gives0≤0 | Degree-drop, constant and zero-variable cases agree. |
| §8.7 repaired polarization | G=a²,a=y=1; G=a³; characteristic3 | Unary Ψ₁(y)=2y; linear/full differences −2/−3; cubic linear term+6auv; char3 polar0 gives dimension2 rather than1 | Corrected arity and alternating signs; p>k essential. |
| §§8.8–8.9 / polarCount headline | Scalar k=3,d=2,m=2,α=T⁻⁴; full differences over F₅,F₇ | RankH₂=3>2; full finite-function counts225≤250 and637≤686; formal countQ²(2Q−1), shrunk count2Q−1 | Native count equals polar locus and explicit constant2 works. |
| Polar-count negative controls | Same test with b=0; characteristic3 | Zero frequency:625>250; char3:81>54 | Rank exclusion and characteristic hypothesis exclude failures. |
| §8.10 count/dimension adapter | A^e; Spec F_(q²); dual-number point | Counts q^(re); 0 at odd r and2 at even r;1 at all r. Dimensions e,0,0 | All extensions and nilpotent invariance retained. |
| §§9.3–9.4 conservative headline | L=9,d=3; n=24,k=3,d=4,m=5 | Cover indices{3,4}; B(5)=192−24+24=192; conservative cutoff192 | Last odd-length stratum and remainder retained. |
| §9.5 sharp proposition | Same latter input; a=188,190,193 | Sharp cutoff188; 188 is excluded,190 is sharp-only,193 exceeds conservative192 | Proposition correctly remains an assumption. |
| §10.1 repaired spreading | y⁵−y; K=C,n=40,k=3,d=2 | Characteristic5 derivative−1 has0 zeros; characteristic0 derivative5y⁴−1 has4. Transported geometric values D74, tδ3, top dimension1 | No generic-fibre Fourier diagram claimed. |
| §10.2 conservative comparison headline | n=40,k=3,d=2;i=−3 | Minor cutoff156; j=160−3=157 and j+1=158 both exceed156; 2D=148 | Comparison i>−4 and adjacent-degree argument correct. |
| §§10.3,10.10 sharp/degeneration propositions | Same input; tδ=1; toy nonzero d₂:E→E | Sharp i>−8; at tδ1 only i>0; toy page dimensions1,1 become0,0 despite odd-page vanishing | Neither sharper range nor degeneration is asserted unconditionally. |
| §§10.4–10.6 support/near-top headlines | n=40,m=1,2; n=4,r=2 | Total support{−37},[−75,−74]; −1 absent. For n4, near-top threshold−3; possible d₂ from (4,−11) to (6,−12) has totals−7→−6 | Retain range intersection and possible even differentials below it. |
| §10.7 component criterion | A¹ versus A¹ disjoint a point,D=1 | Both top ranks1; component dimensions{1} versus{1,0}; empty scheme top rank0 | Componentwise lower bound excludes the false converse. |
| §10.8 / mapping_geometrically_irreducible headline | Fermat n=40,k=3,d=2; n=24,k=3,d=4 | D74,tδ3>2; D84,tδ2>2 is false; variable-minus-equation count80−6=74 | Nonvacuous first example, correct strict endpoint, no reducedness overclaim. |
| §11.1 prescribed germ | Reference; v=2z^d; v=z^(d+1) | Normalized ratios1,2,z with limits1,2,0 | Only the first has required leading normal value1. |
| §§11.2–11.7 compact-open/escaping loop | r=1/4,s=0,3/8,1; Fermat tuple | h=0,1/2,1; σ=1,−1,1; lift change+1; power sum T^(dk)−T^(dk)+1=1; ambient normal sizeR^(−d)→0 while moving normalized deviation2 | Pointwise germ and compact-open continuity coexist without uniform normalized control. |
| §11.10 radius/homotopy invariance | F at R and2R; loop followed by its reverse | Normal ratioσ⁻¹ has winding−1 at both radii; concatenation winding−1+1=0 | A common compact-parameter chart supplies the needed homotopies. |
| §§11.11–11.12 winding/obstruction headlines | Constant,F,F²; cubic Fermat n40 | Winding0,−1,−2; π₂(∨S³⁹)=π₃(∨S³⁹)=0, hence π₁Ω²X=0 versus quotientZ for π₁Hco | Surjectivity and compact-open obstruction retained. |
| §12.1 controlled collar | u=az,w=1+bz; w=1.1; w=−1 | Weighted norms abs(a),abs(b); 0.1/abs(z)→∞; deviation2>1/2 | Both plausible wrong normal models rejected. |
| §12.2 straightening | z=1/10,u=z,w=1+z,t=1,χ=1/2 | u_t=1/20,w_t=21/20; normal deviation1/20<1/2 | Nonzero collar, but transition annulus can move. |
| §12.3 extension space | X=point; X=S²,constant β; X=S¹,β degree1 | Point fibre and double loop both points; S² fibre componentsZ=π₂S²; degree1 loop has no extension | Reference-extension hypothesis necessary; correct based fibre. |
| §§12.4–12.5 conditional comparison | Escaping loop versus bounded linear collars | Moving weighted deviation2R→∞; linear collars have finite fixed abs(a),abs(b); Hco has Z quotient versus π₁Ω²X=0 in Fermat example | StrongGermData is data, not a claimed construction or Hco instance. |
| §13.1 trace proposition | n40,k3,d2;j=0,1,8 | D74; range0≤j<8; j0 algebraic top rank1; j1 algebraic rank0 versus nonzero H¹(Hco,Q); j8 excluded | Stated conjecture and dependence on topology correct. |
| §13.2 trace-counterexample headline | Same input,j=1 | 147=2·74−1; −1>−4; 1<8; pairing0⊗H¹(Hco,Q)→Q with second factor nonzero | Failure lies strictly inside both relevant ranges. |
| §13.3 conditional degeneration headline | n4,one sphere,d1,j1; n5,one sphere; main n40,d2 | Ω²S³ series1+t has coefficient1 at j1; Ω²S⁴ series(1+t⁵)/(1−t²) has coefficients1 at0,2,4,5; main stable bound8≤74 | Configuration/loop conventions agree; actual abutment comparison remains a separate condition. |

The exhaustive Hankel experiment checks all coefficient vectors in the listed fields and lengths. For each m it independently row-reduces H_m and enumerates monic denominators of degree at most m, checking the required Laurent convolution coefficients. The 1078 cases are 1+8·4+32·6+64·7+81·5. This includes L=0 and the saturated endpoint.

The polar-count experiment evaluated the full second difference of G(a₀,a₁)=a₁³+6a₀a₁+4a₁ at every base tuple and increment pair, rather than using the polar equation as the membership test. For the cubic-surface computation, the three coordinate-pair partitions and the three cube roots of −1 supply 27 lines. Their self-intersections are −1; pairwise intersections are 0 or 1. Rank 7 modulo 101 proves rank at least 7 in characteristic-zero coefficients, and the supplier Betti formula bounds it by 7. Their classes therefore span H² and Frobenius acts by 25. The separate point count and weight bound give the same eigenvalues.

### Acceptance file, signatures and padding

The README's headlines are the cumulative-degree grid and polynomial-box bounds (§§0.2,1.1); Fourier recovery (§3.6); signed absolute/relative strata and first pages (§§5.14,6.6,7.2–7.5); monodromy parity (§§6.5,7.4); geometric Weyl and uniform polar counts (§§8.6,8.9); conservative minor-arc vanishing, comparison and irreducibility (§§9.4,10.2,10.8); end winding and the compact-open obstruction (§§11.11–11.12); trace-pairing failure (§13.2); and conditional comparison/degeneration (§§12.5,13.3).

`Suggested.lean` states the two directly statable deep endpoints, `minor_arc_polar_count` and `mapping_geometrically_irreducible`, with seven supporting definitions on native polynomial, matrix and finite-function carriers. Its module docstring identifies the missing cumulative-degree, constructible-adic/six-operation, prescribed projective-germ and trace-comparison carriers for the remaining headlines. None is replaced by a scalar-algebra stand-in. The native compact-open carrier alone does not supply the prescribed projective-germ geometry and all its chart normalizations with a few simple definitions. The rank and ideal conclusions are on the actual objects defined in the file.

Ran the required `lake env lean` elaboration from the pinned content checkout: **exit 0; exactly two warnings, both `declaration uses sorry`**, at lines 98 and 123. There is a single `import Mathlib` and no Tau Ceti import requiring a build. Then elaborated a scratch copy with `#check @name` for **all nine declarations**: **exit 0**, the same warnings, and **zero lost binders**. Compared all nine elaborated types with §§3.1,3.4,4.1,8.1,8.8–8.9,10.8; no signature change is needed. In particular, the finite-field count retains geometric Jacobian smoothness over AlgebraicClosure K, while irreducibility retains IsAlgClosed, both Jacobian conditions, incidence, nonzero x and both strict numerical hypotheses. Natural subtraction is harmless in these headline ranges: h≤d and n>k.

For the one-tactic padding probe, replaced both admissions by `simp` in a scratch copy and elaborated it: **exit 1**, with “simp made no progress” for the count and the substantive prime-radical/dimension conjunction left for irreducibility. Reading the real definitions and the pinned object searches supplied no single existing theorem that closes either goal. Neither theorem is a Check, definition restatement or boundary case. No padding finding.

### Pinned library declarations opened

The manifest and actual library checkouts agree on Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The content checkout inspected was `198a2803230ce19e672234ed72cf637f8ea58e35`; roadmap-tool main/head results were also resolved rather than inferred from the old review.

| Declaration | File and line at the pin | Relevant content and boundary |
| --- | --- | --- |
| `MvPolynomial.eval₂Hom` | `Mathlib/Algebra/MvPolynomial/Eval.lean:158` | Actual evaluation ring homomorphism. |
| `MvPolynomial.pderiv` | `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` | Derivation in the named variable. |
| `MvPolynomial.homogeneousComponent` | `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:512` | Extracts exactly total degree k. |
| `Matrix.rank` | `Mathlib/LinearAlgebra/Matrix/Rank.lean:132` | Defined by `finrank R <| LinearMap.range A.mulVecLin`; the count uses a field. The adjacent subsingleton-semiring theorem gives rank1, so the zero-ring case cannot be silently imported. |
| `LaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:100` | Hahn-series carrier indexed by integers; infinity expansions use T⁻¹. |
| `RatFunc.inftyValuation` | `Mathlib/FieldTheory/RatFunc/Valuation.lean:81` | Existing valuation at infinity, not a new completion. |
| `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes` | `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:185` | Componentwise bound over a Noetherian ring, retaining minimal-prime membership. |
| `Nat.forall_exists_prime_gt_and_modEq` | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:462` | Nonzero modulus and coprime residue, with arbitrarily large prime. |
| `legendreSym.at_two`, `legendreSym.quadratic_reciprocity` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:60`, line 107 | Oddness and prime instances retained; reciprocity also requires distinct primes. |
| `CategoryTheory.Abelian.SpectralObject` | `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41` | Exact functor/connecting-map carrier; not a geometric localization construction. |
| `ContinuousMap.curry` | `Mathlib/Topology/CompactOpen.lean:430` | Compact-open currying. It adds no weighted normalized-germ or uniform-tail condition. |
| `nonempty_inter_closedPoints` | `Mathlib/Topology/JacobsonSpace.lean:105` | Requires nonempty locally closed subset of a Jacobson space. |
| `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:112` | Locally finite-type morphism with Jacobson target; no sheaf-support constructibility theorem. |
| `UnitAddCircle.fundamentalGroupMulEquiv` | `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:257` | Fundamental group to Multiplicative Z. |
| `Circle.fundamentalGroupMulEquiv_expLoop` | Same file, line 388 | Positive exponential loop maps to +1. |
| `Polynomial.coeff` | `Mathlib/Algebra/Polynomial/Basic.lean:558` | Actual finitely supported coefficient function, including all coefficients of the equation. |
| `MvPolynomial.totalDegree` | `Mathlib/Algebra/MvPolynomial/Degrees.lean:432` | Supremum over monomial support; zero polynomial has degree0 and fails the degree=k≥3 headline hypothesis. |
| `Ideal.IsPrime` | `Mathlib/RingTheory/Ideal/Prime.lean:41` | Includes `ne_top' : I ≠ ⊤`; empty schemes cannot satisfy the headline conclusion. |
| `Ideal.radical`, `Ideal.span` | `Mathlib/RingTheory/Ideal/Operations.lean:799`; `Mathlib/RingTheory/Ideal/Span.lean:45` | Power membership and ideal generation; prime radical does not imply the original ideal is radical. |
| `ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean:26` | `krullDim (PrimeSpectrum R)`, valued in WithBot N∞. |

### Ownership and supplier resolution

Used the required `roadmaps show` and `roadmaps grep` tools on main and indexed open heads, and searched the board packages/designs and both pinned libraries by object. The board package index was read before availability claims. Read main DGFloer, AlgebraicTopology and ClassicalArithmeticCompletion for shape and relevant existing interfaces. Existing-roadmap revision heads were not substituted for main suppliers. The indexed open files, including relevant named sibling work, were searched; no additional live pull requests were sought.

| Supplier | Resolved citations and scope |
| --- | --- |
| SchemeAndStackFoundations, main | §§0.2–0.3,0.7–0.9,5.12. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755` gives local/generic dimension and base extension; line 798 gives spreading of geometric properties; line 848 gives finite-diagram approximation; line 7336 gives cumulative Bézout inequality for projective intersections. The constructible fibre-level-set extension remains explicitly a gap. |
| EtaleCohomologyFoundations, main | §§0.6–0.7,F.0.1–F.0.2,F.1,F.2.4–F.2.7,F.3,F.4.1–F.4.6,F.5–F.6 resolve. `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:439` supplies enhanced localization, line 592 compact-support exchange, line 676 finiteness, line 707 path-aware lisse transport, and line 1041 rational realization. The compact-support and rational operations retain their bounded constructibility, finite type and coefficient hypotheses. Character/Fourier inputs are gaps, not inferred from these operations. |
| EtaleDualityAndPerverseSheaves, supplied head | §§0.6,3.2–3.8,4.1,4.3,4.6–4.7 resolve. `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:818` gives smooth finite-E duality; line 3259 finite coefficient extension; line 3312 Betti comparison; line 3534 trace comparison; line 4211 complete intersections; line 4566 primitive kernels; line 4651 Betti ranks. The rank formula's m≥1 condition is satisfied in §6.5. §5.9 is no longer consumed for spreading. |
| InverseGaloisAndArithmeticFundamentalGroups, supplied head | IG.0.T4 at `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:545` gives point counts for every extension and geometric Frobenius; IG.5.1 at line 5220 gives unit-difference configurations and root torsors including m=0,1; the finite-cover criteria inside IG.5.7 at line 6348 give the smooth-connected-fibre and normal-dense-open surjections needed here. |
| DeligneWeightsAndPurity, supplied head | §§8.1,8.8 at `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2704` and line 2873 give upper complex weights and separated finite-type Rf! preservation. In degree2 over F₂₅ the bound is25, matching the repaired trace Check. |
| LefschetzPencilsAndVanishingCycles, supplied head | §§5.1,5.8,5.10 at `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2775`, line 3007 and line 3072 give general-pencil image, symplectic openness over Qℓ and the orthogonal open-or-finite alternative. The package extends scalars only after Zariski closure and retains the finite-image exclusion as a gap. |
| AlgebraicTopology, main | Stages4,6,8 at `TauCetiRoadmap/AlgebraicTopology/README.md:499`, line 946 and line 1602 provide cofibrations, cohomology/products and relative/based homotopy. No uniform germ-control conclusion is imported from them. |
| DGFloer, main | `TauCetiRoadmap/DGFloer/README.md:362` supplies degree-one Hurewicz, and line 472 through line 503 supplies restriction fibrations and fixed-interval sphere/loop comparisons. S₃ gives abelianization Z/2, so the package correctly uses the abelianization, not π₁ itself, for H₁. |
| ClassicalArithmeticCompletion, main | §6.44 at `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:13185` is the eventual leading-Hankel determinant criterion for an infinite series, not the finite rectangular rank/Padé locus. The kept variant is expressly distinguished. |
| AlgebraicTopologyPartII; GeometryOfNumbersAndQuadraticArithmeticPartII | The board designs contain AT2.2–AT2.5 and FunctionFieldLatticesAndShrinking FL.4. They are consumed through the matching declared gaps. The resolver's absent-AlgebraicTopologyPartII lead is therefore a declared contract, not drift. |

The object audit found no duplicate fully qualified Lean declaration. The pinned `TauCeti.sub_nonneg_of_posSemidef_hankel` at `TauCeti/Analysis/Matrix/PosSemidef.lean:183` concerns bounded positive-semidefinite sequences; it does not supply finite Hankel-rank geometry. The ring identity at `TauCeti/Algebra/CharP/ArtinSchreier.lean:33` and the Artin–Schreier field-extension files do not construct the character sheaf or its compact-support Fourier transform.

For point counts, inspected the fixed-model number-field Lang–Weil target in InverseGaloisAndArithmeticFundamentalGroups IG.2.5, the degree-uniform projective hypersurface bound in ArithmeticStatisticsPartIII §2.23, and the finite-presentation finite-field estimate in SieveMethodsAndPrimePatterns §5.4. None is the arbitrary-field finite-Cartesian-grid bound or the all-extension count-to-dimension implication stated here. The latter is a local consequence of the already owned trace and weight inputs. Generic configurations, Hurewicz, restriction fibrations, primitive ranks and symmetric-lattice shrinking remain with their named owners. No ownership move to a later supplier is needed.

### Declared gaps and dependency direction

All twelve slugs occur both in the plan's top-level gaps and in the README's Exact supplier contracts, with the same named owner and mathematical need. They are scoped to the missing interface rather than to the circle-method conclusion. The arithmetic application is proved locally from generic shrinking; Goursat is local and the LPV gap asks only for infinitude outside the cubic exception; the two ECF requests separate character cancellation from the one-variable Fourier input. No gap requests an existing theorem found by the object audit.

| Slug | Supplier and boundary test |
| --- | --- |
| `sf-fibre-strata` | SchemeAndStackFoundations §§0.7–0.8: axes projected to a line have fibre dimensions1 at0 and0 off0; empty fibres have−∞. |
| `ecf-character-fourier` | EtaleCohomologyFoundations: zero linear phase gives degree2 traceQ, nonzero linear phase gives zero complex. |
| `ecf-one-variable-fourier` | EtaleCohomologyFoundations: g=a gives zero on nonzero frequency; g=0 has total H_c⁴=E(−2) and is excluded. |
| `edc-top-components` | EtaleDualityAndPerverseSheaves §0.6: line disjoint point has top degree2 rank1; dual-number point has degree0 rank1. |
| `lpv-universal-monodromy` | LefschetzPencilsAndVanishingCycles: primitive cubic-surface rank6 is the finite exception; quartic-surface rank21 is outside it. |
| `symmetric-lattice-shrinking` | GeometryOfNumbersAndQuadraticArithmeticPartII FL.4: γ=0,Q=5,a=c=s=1 gives5≤5·1; n=0 gives1≤1. |
| `at2-arrangement-cohomology` | AlgebraicTopologyPartII AT2.2: PConf₀ has degree0 rank1; PConf₁ degree2 rank1; PConf₂=A¹×G_m has degrees3,4 each rank1. |
| `at2-stable-diagonal` | AlgebraicTopologyPartII AT2.3: n4,dimV1,d1 has degrees0,1 of rank1, agreeing with1+t. |
| `at2-tame-polynomial` | AlgebraicTopologyPartII AT2.4: f=z^k has gradient norm k·abs(z)^(k−1); smooth leading gradient has positive unit-sphere minimum. |
| `at2-tame-bouquet` | AlgebraicTopologyPartII AT2.4: cubic Fermat in2 or4 variables has Milnor number4 or16, with spheres of dimension1 or3. |
| `at2-double-loop-betti` | AlgebraicTopologyPartII AT2.5: Ω²S³ gives1+t; Ω²S⁴ gives(1+t⁵)/(1−t²), so the parity and n≥4 endpoint are substantive. |
| `at2-fermat-loop-connectivity` | AlgebraicTopologyPartII AT2.5: cubic Fermat in40 variables is a bouquet of39-spheres; π₂=π₃=0. |

Ran the exact requested dependency command. Exit 0; complete output:

```text
depcheck: 52 roadmaps, 590 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs line and supplier citation was also read manually; the mechanical check was not used as evidence of mathematical supplier generality.

## Not verifiable

- No directly cited work is unreadable, and there is no new missing-reference request. BV15 and LR14v2 pagination was checked against the versions actually cited, not against a different journal edition.
- The book theorems behind BS20's one-variable Fourier and universal-monodromy proofs were not independently opened. The package exposes the needed content as ECF and LPV supplier contracts; this review checks those contracts and BS20's use, not the unprovided book proofs.
- The twelve supplier gaps are future contracts, not implementations verified at the pins. Likewise StrongGermData's existence, SharpMinorArcBound and TraceComparisonConjecture remain assumptions/data as stated. The accepted verdict is conditional on the twelve gaps, and asserts no proof of those separate conjectural propositions.
- Ownership was checked against the supplied indexed main/open-head files and board data. Unlisted or unavailable external work was not searched for independently.

## Source issues

- **Misprint** in BS20 at proof of Lemma 2.4, printed p.903 (BS20 line 491): the source says the kernel convolution sums m coefficients; it should be m+1, matching the kernel vector and denominator; affects nothing.
- **Misprint** in BS20 at proof of Lemma 4.3, printed p.924 (BS20 line 1435): the source says the orthogonal/symplectic exceptional rank pairs are (2,3),(4,5); it should be (3,2),(5,4) in that order; affects nothing.
- **Misprint** in BS20 at proof of Lemma 4.4, printed p.925 (BS20 line 1473): the source says the relative trace line has twist +(n−1); it should be −(n−1), giving geometric Frobenius q^(n−1); affects nothing.
- **Misprint** in BS20 at proof of Proposition 5.5, printed p.931 (BS20 line 1681): the source says each specialized first difference has degree k−1; it should be degree at most k−1, including the zero difference at y₀=0; affects nothing.
- **Misprint** in BS20 at proof of Proposition 2.6, printed p.934 (BS20 line 1845): the source says the last stratum index is floor(kd/2)−1; it should be ceil(kd/2)−1, retaining the final odd-length stratum; affects the proof.
- **Error** in BS20 at proof of Proposition 2.6, printed p.934 (BS20 line 1862): the source says the smaller rounded expression suffices for the vanishing threshold; it should bound the threshold above, retaining 4(r+1), which gives192 rather than188 at k3,d4,n24; affects the proof.
- **Gap** in BS20 at proof of Proposition 2.6, printed p.934 (BS20 line 1860): the source says the whole rank stratum has the dimension used in its estimate; it should also control lower-denominator pieces and the saturated final stage, not just the open pair chart; affects the proof.
- **Gap** in BS20 at spreading after Theorem 2.7, printed p.906 (BS20 line 620): the source says the coefficients of f provide a model of the mapping family; it should also include coordinates of the prescribed vector and invert a nonzero one; affects the proof.
- **Misprint** in BS20 at spreading after Theorem 2.7, printed p.906 (BS20 line 626): the source says Spec K is the generic point of Spec R; it should say Spec K lies over that point, since K need not equal Frac R; affects nothing.
- **Gap** in BS20 at Lemma 7.2, printed pp.940–941 (BS20 line 2174): the source says the nonempty prescribed-germ space is equivalent to Ω²X without specifying its topology; it should specify a topology supporting continuous uniform collar straightening and prove the comparison; affects a stated result.
- **Error** in LR14v2 at Lemma 2.6, printed p.5 (LR14v2 line 228): the source says an affine hyperplane section preserves degree; it should use a cumulative-degree inequality, since y=x² sliced by x=0 has degree1 rather than2; affects the proof.
- **Misprint** in LR14v2 at Proposition 2.3, printed p.4 (LR14v2 line 169): the source says the affine subvariety lies in projective space; it should put the affine case in affine space; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "56072561a6bcdce57c40f78cbac033788c909934", "job": "REV-PKG-ExponentialSumsAndCircleMethodPartII~3", "model": "gpt-6-astra", "worker": "chris-31"} -->
