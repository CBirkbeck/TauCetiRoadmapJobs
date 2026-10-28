<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1266#issuecomment-6396927331 -->
Review (codex) of a137745

Verdict: needs_changes

1. **F01** (P2) Spreading the geometric pair does not spread its characteristic-p Fourier filtration

   **Location:** `packages/ExponentialSumsAndCircleMethodPartII/README.md:1119`, also lines 59 and 1126. “choose a common lisse open for the finitely many compact-cohomology sheaves and maps in the finite filtration” and “Transport ranks, signs and spectral-sequence maps by specialization.”

   **Claim:** This requests specialization of the actual Fourier/localization diagram from Layers 3–7 over a general model R, including characteristic zero. That diagram uses a characteristic-p Artin–Schreier sheaf. EDC §5.9 supplies restricted specialization of specified complex-origin objects; it neither constructs such a diagram in characteristic zero nor lifts arbitrary special-fibre character sheaves. Its stated base field is ℂ, not every K in §10.1. The ordinary constant-coefficient cohomology of the geometric pair can be spread; the additional diagram claim needs removal.

   **Witness:** In characteristic 5, y⁵−y=a has derivative −1; over ℂ, 5y⁴−1 has four zeros. BS20 lines 619–641 transports cohomology vector spaces; EDC §5.9 starts over ℂ (line 5981).

   **Exact repair:** Rewrite §10.1 and the contract at line 59 to spread only X, its closure/boundary, the vector x, Mor, configuration spaces, their constant-coefficient cohomology and the geometric maps actually defined over R. Choose a common lisse open for those finite data using ECF finiteness/base change. Choose a good finite-field fibre; construct the Fourier spectral sequence there. Transport that sequence and its finite filtration **abstractly through chosen vector-space isomorphisms**, with its E₁ terms identified using the geometric cohomology comparisons. Claim neither a generic-fibre Artin–Schreier complex nor specialization of its geometric Fourier maps. Restrict any remaining EDC §5.9 invocation to its actual hypotheses. Add the y⁵−y control to distinguish these operations.

   **Repair test:** For K=ℂ, k=3,d=2,n=40, the transported vector spaces still have D=74, comparison i>−4, and the zero-column top line. The finite-fibre character sheaf is never asserted to extend to ℂ. For K of characteristic p>k, retain the same p and the prescribed admissible ℓ. No narrowing of either Lean headline is needed.

2. **F02** (P3) Cite the existing primitive-rank formula used by Goursat

   **Location:** `packages/ExponentialSumsAndCircleMethodPartII/README.md:744`, with the *Needs:* line at 746. “its rank is N₁=(k−1)((k−1)^n₁+1)/k”. The supplier contracts currently list EDC §§4.1, 4.3 and 4.6, not §4.7.

   **Claim:** The rank formula is correct, but the proof route does not identify its existing owner. EDC §4.3 explicitly separates this calculation into §4.7. BS20's use of the formula is a source locator, not the library supplier required by the ownership contract.

   **Witness:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4654`–4659 supplies primitive rank `((k−1)^(m+2)+(−1)^m(k−1))/k` for a smooth degree-k hypersurface of dimension m.

   **Exact repair:** Add EDC §4.7, *Complete-intersection Betti numbers*, to Exact supplier contracts and §6.5's *Needs:* line. Say that the displayed rank is its specialization with m=n₁−1; keep the Goursat application here.

   **Repair test:** At (k,n₁)=(3,3), the supplier gives (2⁴+2)/3=6; at (4,3), (3⁴+3)/4=21. Both agree with the existing Checks; 21 excludes the orthogonal dimensions 3 and 5.

3. **F03** (P3) The quadratic polarization Check uses an undefined arity

   **Location:** `packages/ExponentialSumsAndCircleMethodPartII/README.md:974`. “the a-linear term is −Ψ(a,y)”.

   **Claim:** Section 8.7 defines Ψ_j with k−1 arguments. For k=2,n=1 it is the unary form Ψ₁(y)=2y. No binary Ψ(a,y) was defined, so this Check cannot be evaluated with the section's object.

   **Witness:** At k=2,f₀=Y², line 960 gives Ψ₁(y)=2y. Direct subtraction gives (a²−(a+y)²)=−2ay−y², whose a-linear term is −aΨ₁(y).

   **Exact repair:** Replace “−Ψ(a,y)” by “−aΨ₁(y)=−2ay”; retain the cubic +6auv comparison. No Lean edit is required.

   **Repair test:** In ℚ[a,y], a=y=1 gives a-linear contribution −2 and full difference −3; with the opposite difference convention they would be +2 and +3. Thus the corrected Check discriminates the intended sign.

4. **F04** (P3) Add a computed Check for the boundary primitive twist

   **Location:** `packages/ExponentialSumsAndCircleMethodPartII/README.md:716`, with Checks at lines 724–725. “The boundary term has no extra Tate twist.”

   **Claim:** The stated convention is correct, but neither Check computes it: the extension-eigenvalue warning and removal of the hyperplane class also hold after inserting an erroneous extra twist. The required discriminating normalization Check is missing.

   **Witness:** For the Fermat cubic boundary surface over 𝔽₂₅, primitive rank is 6 and Frobenius eigenvalue is 25. An extra twist (−1) gives 625; neither existing Check rejects it.

   **Exact repair:** Add a third Check using a split cubic boundary surface and cubic threefold closure: boundary primitive degree 2, rank 6 and eigenvalue Q; closure primitive degree 3 and rank 10; affine middle rank 16. Explain that a boundary Gysin twist would incorrectly give Q².

   **Repair test:** For the Fermat cubic pair over 𝔽₂₅, all 27 boundary lines are defined and the boundary contribution is E(−1)⁶. The ranks satisfy 6+10=16=(3−1)⁴; E(−2)⁶ gives the wrong eigenvalue 625 instead of 25.

Four findings: one P2 blocker and three P3 corrections. The two Lean headlines elaborate and survive the padding probe. The twelve declared supplier gaps are contracts, not findings. The remaining blocker concerns the claimed specialization of the Fourier filtration, not a counterexample to the conservative irreducibility theorem.

## Previous findings checked individually

These statuses concern the previous finding itself; the new issues above are separate. Quotes are from the repaired package.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: unowned sharp/topology problems | Repaired | §9.5, line 1093: “no theorem here asserts this proposition”; §12.4, line 1537: “explicit data and properties, not a construction or an existence theorem.” G3/G6 are absent from the twelve-entry gap list. At k=3,d=4,n=24, 188 remains assumed and 192 proved. |
| F02: process-only G4/G5 | Repaired | Both entries are absent. Line 79 asks only to “prove that its geometric monodromy image is infinite unless (k,N)=(3,3).” All twelve remaining entries have named suppliers and mathematical needs. |
| F03: AT2 not an available roadmap | Repaired within the package; settled supplier work | Line 83: “The following interfaces are supplier gaps.” Six matching slugs occur in README and plan. IG.5.1 now supplies configurations/torsors. The supplier's absence is not re-raised. |
| F04: duplicate restriction-fibration gap | Repaired | Line 1522: “This is the disc-pair application of DGFloer Layer 2 items 2–3.” The obsolete gap is absent; main DGFloer lines 484–492 supplies the restriction and sphere/loop maps. |
| F05: specialized FunctionFieldArithmetic gaps | Repaired | Line 998: “Consequently N(α)≤(k−1)^n Q^(dn(k−1)−nh), uniformly in Q”. Local §§8.7–8.10 own this application; line 65 requests only generic symmetric shrinking. The removed FunctionFieldArithmetic gap slugs do not recur. R03 concerns one new Check. |
| F06: compound monodromy gap | Repaired in substance | Line 79 has only the finite-image exclusion; line 742 says “prove the two-factor Goursat comparison here.” The ranks are now 6 and 21. R02 completes the citation for the rank input. |
| F07: duplicate π₁-surjection gap | Repaired | Line 733 names IG.5.7, *Finite-cover criteria for full monodromy image*. The target exists inside IG.5.7 at its supplied head; its smooth-connected-fibre and normal-dense-open clauses apply. |
| F08: combined character/Fourier request | Repaired | Lines 53 and 55 separately request the character package and the one-variable Fourier sheaf. Line 574 proves the degree-above-two vanishing locally. g=a gives zero; g=0 gives H_c⁴=E(−2). |
| F09: original results attributed to BS20 | Repaired | Line 1333 and the subsequent original constructions say “Original to this roadmap; BS20 supplies the setting refined here”. Line 15 identifies the original layers and counterexample. BS20 contains the setting, not those new examples. |
| F10: implied nonexistent predecessor | Repaired within assigned scope | Line 5: “The arithmetic argument is the polar-count argument of BS20 §6”. No unnamed predecessor is consumed. The assigned Part II package name is retained without inventing a base roadmap. |
| F11: missing grid-count locator | Repaired | Line 127 cites “Theorems 1.1 and 2.1 and Proposition 2.3” and expressly calls the arbitrary-grid version an adaptation. LR14v2 line 144 is the finite-field antecedent. |
| F12: unnecessary range restrictions | Repaired | Line 628 starts “For n≥2”; line 798 starts “For d≥1, k≥3, n≥2”; line 830 excludes a coefficient-order restriction. Retaining n≥3 for monodromy is justified: a smooth binary cubic has three punctured-cone components. |
| F13: slugs and finite/infinite Hankel ownership | Repaired | Line 13 distinguishes “finite-length rectangular-rank form” from “infinite eventual-determinant criterion”; AT2 citations use section titles and explicit gap slugs. ClassicalArithmeticCompletion §6.44 exists on main. |
| R09: small-degree padding | Repaired | `small_degree_excess_dimension` is absent from both editable text files. §10.9 retains the example. The Lean file now has only the two deep headlines described below. |

## Verified sound

Read all **89 numbered targets**, their API bullets, **248 Check bullets**, and all **14 layer Examples**. Recomputed the sampled statements, all newly added arithmetic targets and repaired conventions. For unchanged material, used the previous review only where its adversarial row actually gave values; the old nonnumeric rows for topology existence and the missing rows for §§11.2–11.3 were checked afresh. No source or package text was treated as an instruction.

The package has the required main headings and fourteen ordered layers ending in Examples and Dependencies. Definitions have API lists and at least three Checks; the polar Check arity and absent primitive-sequence normalization witness are noted above. The scalar and Fermat examples are controls, not restrictions on the general theorem. No algorithms, sorry'd data, `set_option`, admitted examples, extra imports or route-specific prime restriction occur. The obsolete gap patterns were searched throughout the package; historical target records outside the plan's editable gap list were not treated as new supplier contracts.

### Seeded source sample

All four directly cited works are readable in their supplied legal caches. No author-marked unverified locator was found; no additional fetch or missing-reference request was needed. The STACKS Homology extraction named by `additional_sha256` was also read. Pages below are printed pages, except BV15/LR14v2, whose recorded preprint versions are used.

| Target | Source text opened | Result |
| --- | --- | --- |
| 1.1 | BV15 Lemma 2.8, pp.12–13, line 525 and line 530; LR14v2 Theorem 1.1, p.3, line 124; Theorem 2.1, p.3, line 144; Proposition 2.3/proof, pp.4–6, line 169 and line 231 | BV15 supplies O(q^((N+1)e)); the explicit cumulative-degree constant and arbitrary grid are the stated adaptation through §0.2. Inclusive N corresponds to strict h=N+1. Dimension zero is checked separately. |
| 4.1 | BS20 Definition 2.3, p.903, line 459 | Matrix dimensions and indexing agree; determinantal/reduced scheme distinction and saturation are explicit refinements here. |
| 4.5 | BS20 Lemma 2.4(5), pp.903–905, line 476 and line 522 | Exact stratum, monicity, coprimality, m≤L/2, and the nonzero leading error all agree. |
| 5.13 | BS20 Corollary 3.12 proof, p.920, line 1248 and line 1257 | Sign exponent n−1 is correct. Configuration invariants must be taken diagonally, as the README requires. |
| 5.14 | BS20 Corollary 3.12, p.920, line 1248 | Exponent a+m(n−1)−2nd and twist −m−n(d−m) agree; m=0,d are retained. |
| 6.3 | BS20 Lemma 4.2(2), p.923, line 1358 and line 1369 | Boundary term injects; projective term is the quotient. Restriction has no extra Gysin twist. |
| 6.6 | BS20 Lemma 4.4, pp.925–926, line 1447 and line 1452 | Relative degree formula, lissity and tensor symmetry agree. The printed relative trace twist needs the correction recorded below. |
| 8.5 | BS20 Proposition 5.8 proof, p.934, line 1831 | All finite extensions detect the constructible support. Pinned Jacobson declarations supply only the topological part, not constructibility. |
| 8.10 | BS20 Lemma 5.6, p.932, line 1745 | General separated finite-type version is an adaptation, not the literal source statement. Its trace/weight proof handles reducibility, nilpotents and a component defined only after extension. |
| 10.1 | BS20 proof of Theorem 1.1, pp.906–907, line 619 through line 641 | The vector must be spread as well as f. R01 concerns the extra diagram/spectral-map claim beyond this source. |
| 10.8 | BS20 Corollaries 1.4/2.9, pp.898 and 907–908, line 239 and line 667 | README deliberately uses the proved conservative sufficient inequality tδ>k−1, not the unsupported printed sharper range. Componentwise lower bounds are essential. |
| 10.10 | BS20 Conjecture 1.3, p.897, line 192 | Correctly a proposition, not a theorem. Vector-space isomorphism does not promise canonical or Frobenius splittings. |
| 11.3 | BS20 §7, p.940, line 2149 and line 2156 | The polynomial inclusion is in the source. Compact-open continuity is justified here by fixed leading vector and locally bounded lower coefficients. |
| 12.4 | BS20 Lemma 7.2/proof, pp.940–941, line 2174 through line 2194 | Source does not construct this stronger topology. README now labels StrongGermData as original specified data and makes no existence assertion. |
| 13.1 | BS20 Conjecture 7.1, p.940, line 2159 through line 2172 | Range, cup/pullback pairing and conjectural status agree. README correctly makes topology and geometric trace explicit parameters. |

Also reopened the repaired arithmetic proof: BS20 line 1732, line 1942, line 1950, line 2014, line 2076 and line 2114. It supports the factorial normalization, polynomial count, successive shrinking and rank-exclusion argument at the stated generality. The explicit constant (k−1)^n follows from the cumulative-degree Bézout inequality and §0.2, rather than from a hidden q-dependent constant. STACKS line 4237 supplies fibre-dimension constructibility; STACKS Homology line 2964 and line 3202 supply indexing and finite convergence.

### Adversarial computations

This table records the sample, every headline, every new arithmetic target and every finding, plus representative repaired dependencies. Hypothesis-only rows test the specified proposition or data, not their existence. The untouched numerical rows in the preceding review remain the evidence for other unchanged targets; no uncomputed “sound” row is substituted for them.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| Coefficients/prime choice, §§2.1–2.2 | p=5,ℓ=19; ℓ=2,p=13; p=2 | 19 mod5=4, order2; 2⁶ mod13=−1, order12; −1 mod2=1, order1 | Correct; p=2 excluded from coefficient-prime adapter. |
| Shifts, twists and Frobenius | point and 𝔸¹ | H_c⁰=E, trace1; H_c²=E(−1), traceQ | Every affine-factor shift is −2 per coordinate. |
| Signed subtraction/range | n=40,k=3,d=2; n=24,k=3,d=4 | D=74, tδ=3>2; D=84, tδ=2 is not >2 | No natural-subtraction or strict-endpoint mistake. |
| §0.1 intersections | two coordinate planes; disjoint parallel lines | 1=2+2−3; empty intersection has dimension −∞ and fails the premise | Correct component/nonemptiness conditions. |
| §0.2 grid | line plus one off-line point, S={0,1}; parabola x=0 | count3=2+1≤2·2=4; section degree1≤parabola degree2 | Cumulative degree and inequality are necessary. |
| §0.3 fibre strata | coordinate axes mapped to x-axis | fibre dimension1 at0 and0 elsewhere; inverse dimensions1=0+1 and1=1+0 | Correct; empty-fibre stratum contributes −∞. |
| **§1.1** | 𝔽₂[T],h=2, coordinate line/plane; h=0 | counts4=1·2² and16=1·2⁴; h=0 gives only0 | Bound and strict convention agree. |
| §3.1 and Lean mapping definitions | d=2,x=(1,0); f=0,1; f=Y₁,x₁=1,d=1 | degrees(2,≤1); ideals(0),⊤; equation T+a₀ has coefficient1, hence ideal⊤ | Full coefficient ideal detects empty models. Zero test algebra has one tuple. |
| §3.1 nilpotents | f=Y₁², lower coefficient ε in K[ε]/ε² | f(ε)=0 but ε≠0; reduced-point-only model loses this tangent | Native ideal retains nilpotents. This tests the definition outside smoothness hypotheses. |
| §3.4 residuePhase | Y₁³−Y₂³+1,d=1,x=(1,1) | coefficients a³−c³+1,3(a²−c²),3(a−c); f→f+1 changes phase by b₁ | Whole phase, not just homogeneous part, retained. |
| §§3.5–3.6 Fourier headline | zero frequency,dn=2; one nonzero linear phase | zero stalk E[−4](−2), traceQ²; nonzero-linear complex0; Fourier recovery shift +2L, twist+L | Character cancellation excludes zero frequency. |
| **§4.1 / hankelMatrix** | L=9,m=4,b₅=1; m=5; L=0 | anti-identity rank5,det+1; four rows imply rank≤4≤5; zero rows rank0 | Ceiling and zero-row conventions correct. |
| §4.4 | α=0; α=T⁻³,L=3,m=1 | (h₁,h₂,m′)=(0,1,0); error exponent−3=−3−1+1 | Allows smaller denominators; not an exact rational-identity assertion. |
| **§4.5** | b=(0,0,1),L=3,m=1; b=(1,2,4) | H₁ ranks1 in both; first has unique (0,1), error coefficient1; second has 1/(T−2), remainder begins −8T⁻⁴ | Both reduced-approximation branches checked. Two distinct approximants would force4≤2, impossible. |
| §§4.6–4.7 | m=0,1; lower-denominator m′=0,m=1 | point dimension0; pair(c,T−a),c≠0 has dimension2; boundary count m+m′=1≤2 | Full rank-locus bound includes boundary. |
| §§5.1–5.4 | d=m; d=2,m=1; quotient rank1 | quotient rank0; remainder xb²+a₁b+a₀; rank1 integrates to E[−2](−1) | No division by nonunit and no reversed shift. |
| §§5.5–5.6 | l₁=T,l₂=T−1,h₁=h₂=1; repeated-root local f=a and a²+1 | sum=(2T−1)/(T(T−1)); translation coefficients1 and f(0)=1 | CRT adds cross numerators; both cancellation branches required. |
| §5.7 trace fibre | one/two affine spaces | E(−a)→E(−a) fibre0; E²(−a)→E(−a) fibreE(−a) | Removes one trace line; irreducibility matters. |
| Repaired §5.8/Fourier gap | g=a, g=0, g=a^p−a at h=1 | complexes0; H_c⁴=E(−2); H_c² of a-fibre=E(−1) | Nonconstant degree<p input is necessary for degree-one fibre argument. |
| §§5.9–5.12 | cubic Fermat n=3; affine plane cubic n=2 | rank8 in degree4 after outer shift−2; plane cubic H_c¹ rank2·1+3−1=4, H_c² rank1 | n≥2 middle concentration is valid. |
| **§5.13** | dimV=2,m=2,n=4 and5; m=0 | exterior-square dimension1 versus symmetric-square dimension3; tensor unit dimension1 | Koszul sign is used exactly once. |
| **§5.14** | n=4,d=2,m=1; m=0 | configuration index a−13; H_c² gives a=15=3+2+8+2; m=0 gives a=16 | Twist before configuration is−5; all shifts accounted for. |
| §§6.1–6.2 | Fermat vector(1,ζ,0,…),ζ³=−1; n=4 | f₀(x)=1−1=0; cohomology degrees3,6, top E(−3), traceQ³ | Nonzero vector and negative top twist retained. |
| **§6.3**, R04 | cubic boundary surface and projective threefold,n=4 | primitive ranks6 and10, total16=(3−1)^4; Fermat boundary over 𝔽₂₅: eigenvalue25, extra (−1) would give625 | Exact sequence correct; add computed convention Check. |
| §6.4 | n=3 versus binary cubic n=2 | smooth connected projective curve gives connected punctured cone; binary cubic gives3 copies of 𝔾_m | n≥3 retained for connected-fibre route. |
| §6.5, R02 | (k,n₁)=(3,3),(4,3); Jordan matrix | ranks6,21; [[−1,1],[0,−1]]²=[[1,−2],[0,1]]≠I | Rank formula correct; cite EDC4.7. Eigenvalue−1 does not mean scalar action. |
| **§6.6** | n=4,d=2,m=1 | same index a−13, nonzero at15, twist−5 | Relative and absolute normalization agree. |
| §§7.1–7.3 filtration | {0}⊂𝔸¹; m=0 | d₁:H_c⁰(point)→H_c¹(𝔾_m) is E→E, both rank1; zero column before shift has degree2nd | Direction (1,0) is correct; finite convergence, not first-quadrant convergence. |
| §7.4 | p=7,ℓ=2,n=5,k=3; r=1,2 | ord₇2=3; column eigenvalues differ by−1 for r1 and+1 for r2 | Odd differentials vanish without coefficient inversion; d₂ unrestricted. |
| §7.5 first-page headline | n=40,k=3,d=2,m=0 | L−nd=6−80=−74; total degree0 | Zero column E(−D). |
| §8.1 / iteratedPhaseDifference | constant/linear G,k=1; G=a²,k=2,3 | loci point/empty; y=0 dimension0; all pairs dimension2 | Order parameter must survive degree drop. |
| §§8.2–8.4 | constant, nonzero linear, a^p−a; two constant blocks | degrees2N,−∞,2N; 2N+2N=4N | Extended addition and Artin–Schreier equivalence handled. |
| **§8.5** | support Spec𝔽_(q²) | rational points0 at r1,2 at r2; nonzero sheaf cannot pass all extension tests | Correct closed-point argument. |
| §8.6 Weyl headline | G=a² on 𝔸¹,p=5; order2 and3; constant | actual cd1, RHS1 and2; constant actual2=RHS2 | Bound survives smaller actual degree. |
| §8.7 and R03 | scalar cubic and quadratic; char3 | Ψ=6uv, diagonal6u²; quadratic Ψ(y)=2y and linear term−2ay; char3 cubic polar0 | Dimension1,degree2 in good characteristic; bad characteristic dimension2. Correct unary Check. |
| Shrinking gap / §8.8 | γ=T⁻¹,Q=2,a=2,c=1,s=1; a=3; a≤0; n=0 | counts2≤2·1=2;4≤4·2=8;1≤Q^s; rank-zero1=1 | Strict balls, odd a−c and degenerate ranks checked. |
| §8.8 count identification | k=3,n=1,d=2,α=T⁻⁴ | N=Q²(2Q−1), N₁=2Q−1; N=Q²N₁ | Exact equality in shrinking example. |
| **§8.9 / minor_arc_polar_count** | full finite differences over 𝔽₅,𝔽₇; x=0,1; lower coefficient0,2 | counts225≤250 and637≤686 in all four good-characteristic trials; rankH₂=3>2 | Native Lean count matches formal polar locus; arbitrary x is legitimate. |
| §8.9 negative controls | zero frequency Q5; characteristic3 same rank test | 625>250 with rank0;81>54 in char3 | Rank exclusion and p>k cannot be dropped. |
| **§8.10** | 𝔸¹; Spec𝔽_(q²); dual numbers; empty | countsq^r;0/2 by parity;1;0; dimensions1,0,0,−∞ | All-extension bound detects top dimension; reduction changes neither count nor dimension. |
| §§9.1–9.2 | scalar cubic; n=24,k=3,d=4,m=5 | polar locus be=0 in 𝔸⁴ has dim3=4−1; stalk cutoff24(8−2/2)=168 | Count-to-dimension and Weyl exponent agree. |
| §§9.3–9.4 headline | L=9,d=3; L=12,d=4,n=24 | strata m={3,4} and{4,5}; B4=188,B5=192; uniform cutoff192 | Correct ceiling and retained remainder. |
| §9.5 sharp proposition | n=24,k=3,d=4; a=188,190,193 | sharp cutoff188;188 excluded,190 sharp-only,193 covered by192 | No unconditional use of the sharper proposition. |
| **§10.1**, R01 | y⁵−y=a in char5 and char0; pair with transcendental x-coordinate u | derivative−1:0 branch points in char5; derivative5y⁴−1:4 branch points in char0; ℤ omits u,ℤ[u] contains it | Pair spreading correct; geometric Fourier-diagram transport overclaims. Use abstract transport instead. |
| §§10.2–10.3 comparison headline | n=40,k=3,d=2 | 2dn=160,2L=12,2D=148; conservative i>−4 versus conditional sharp i>−8 | Correct shift and adjacent-degree strictness. |
| §§10.4–10.6 | n=40,m=1,2; n=4,r=2 | total bands{−37},[−75,−74];−1 absent; near-top threshold−3, differential source total≤−4 | Support and automatic top degeneration agree. |
| §10.7 | line disjoint point versus affine line,D=1 | both have top rank1; former has component dimension0<1; latter dim1 | Componentwise lower bound excludes the false converse. |
| **§10.8 / mapping_geometrically_irreducible** | Fermat cubic n=40,d=2; boundary n=24,d=4 | 3>2,D74;2>2 false,D84 | Headline hypotheses satisfiable; conservative strict boundary preserved. |
| §10.9 | n=3,k=3,d=1; n=2 | restricted family three affine lines,dimension1>D0; n2 equation1=0 | Valid negative control, now README only. |
| **§10.10** | i=0,n40; toy sequence with one nonzero d₂ | proposed sum dimension1 from m0; toy E₁ ranks1,1 become0,0 despite d₁=d₃=0 | Conjecture is not supplied by odd-page vanishing. |
| §§11.1–11.2 | reference germ; normal2z^d; escaping phase | normalized ratios1,2, and moving−1; ambient error O(R^−d) despite normalized deviation2 | Subspace compact-open topology does not impose uniform germs. |
| **§11.3** | fixed nonzero x, lower coefficients bounded byM | after division by T^d, lower terms bounded by dM/R for R≥1; limit[x:0] | Joint continuity with fixed x; letting x→0 removes this uniform normalization. |
| §§11.4–11.7 | r=1/4,s=0,3/8,1; Fermat tuple | h=0,1/2,1; σ=1,−1,1; lift increment1; kth-power sum T^(dk)−T^(dk)+1=1 | Escaping loop is continuous and based, with individual eventual agreement. |
| §§11.8–11.11 winding headline | constant loop,F,F concatenated twice | v/v_g=1,σ⁻¹; winding0,−1,−2 | Common chart and homotopy tail give radius-independent onto ℤ map. |
| §11.12 obstruction headline | cubic Fermat n40,d2 | π₁Ω²(∨S³⁹)=π₃(∨S³⁹)=0; π₁Hco has quotientℤ | Compact-open weak equivalence impossible. |
| §§12.1–12.3 | u=az,w=1+bz; w=1.1; X=S²,constant β | weighted norms‖a‖,abs(b); constant offset norm∞; Ext componentsℤ=π₂S² | Collar topology and based fibre formula correct. |
| §12.2 | t=1,χ=1/2,z=1/10,u=z,w=1+z | u_t=1/20,w_t=21/20; deviation1/20<1/2 | Convex homotopy avoids zero; need not fix transition annulus. |
| **§12.4** | escaping loop versus bounded linear collars | moving weighted deviation2R→∞; bounded u=az,w=1+bz gives finite fixed‖a‖,abs(b) | Hco fails StrongGermData's compact-family property. No existence claimed. |
| §12.5 conditional headline | reference extension of constant β; Fermat Hco | Ext≃Ω²X by based disc fibre; Hco quotientℤ versus Ω²X π₁0 | Supplied comparison data are essential. |
| **§13.1** / §13.2 headline | n40,k3,d2,j=0,1,8 | range0≤j<8; j0 top rank1; j1 algebraic factor0 versus H¹(Hco,ℚ)≠0; j8 excluded | Compact-open pairing is not perfect; conjectural status retained. |
| §13.3 conditional degeneration | n4,dimV1,d1,j1; n5,dimV1 | stable coefficient1=[t](1+t); n5 product(1+t⁵)/(1−t²) has coefficients1 at0,2,4,5 | Configuration/loop conventions agree; compare dimensions only in known abutment range. |

For the count row, a separate finite enumeration evaluated the **full** second difference of G(a₀,a₁)=a₁³+6xa₀a₁+2λxa₁, rather than assuming the polar equation. Counts were 225 and 637 for Q=5,7, and 81 for Q=3. This also checks that the Lean finite-function definition cannot exploit polynomial-function coincidences: its residual base-variable dependence is linear, and p>k is explicit.

### Acceptance file and headline coverage

The README's substantive endpoints are: the degree/grid and strict polynomial-box bounds (§§0.2,1.1); Fourier orthogonality (§3.6); signed absolute/relative strata and first page (§§5.14,6.6,7.5); monodromy parity (§§6.5,7.4); geometric Weyl and uniform polar counts (§§8.6,8.9); conservative minor-arc vanishing/comparison and irreducibility (§§9.4,10.2,10.8); end winding and the compact-open obstruction (§§11.11–11.12); the trace-pairing counterexample (§13.2); and the explicitly conditional comparisons/degeneration (§§12.5,13.3). §§9.5,10.10,12.4,13.1 are propositions or data, not proved endpoints.

`Suggested.lean` states the two endpoints directly expressible with a few native definitions: `minor_arc_polar_count` and `mapping_geometrically_irreducible`. Its module docstring identifies the missing cumulative-degree, constructible-adic/six-operation, germ-space and trace-comparison carriers for the others. No replacement theorem on arbitrary unrelated data is used. The seven definitions all have real bodies and are needed by these two headlines. The topology objects would require substantial projective/germ constructions, rather than a few acceptance-test definitions.

Ran the required `lake env lean` command on `packages/ExponentialSumsAndCircleMethodPartII/Suggested.lean` from the pinned content checkout: **exit 0, exactly two warnings**, both `declaration uses sorry`, at lines 98 and 123. Single `import Mathlib`; no Tau Ceti module build was needed. Repeated elaboration on a scratch copy with `#check @` for all **nine declarations**: exit 0, same two warnings, **zero missing binders**. Compared all nine types with §§3.1,3.4,4.1,8.1,8.8–8.9,10.8. In particular the count has geometric smoothness over AlgebraicClosure K, and irreducibility retains algebraic closedness, both Jacobian tests, incidence, nonzero x, characteristic and strict range.

One-tactic padding probe: replaced each `sorry` by `simp` on a scratch copy. The count reported “simp made no progress”; irreducibility left the prime-radical/dimension goals unsolved. Reading the bodies and the object searches below also rules out a definition-restatement or single existing-library-lemma headline. Neither theorem is a boundary case or README Check. No padding finding remains.

### Pinned declarations opened

Verified content main `5f173a7b9ac37eb6b62d01eb3db5047b92d19363`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` against the pinned manifest. Reopened all sixteen explicitly located library declarations, plus the coefficient, degree, ideal and dimension definitions used by the acceptance file.

| Declaration | Pinned file and line | Retained scope |
| --- | --- | --- |
| `MvPolynomial.eval₂Hom` | `Mathlib/Algebra/MvPolynomial/Eval.lean:158` | Actual ring homomorphism from evaluation. |
| `MvPolynomial.pderiv` | `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` | Derivation on the polynomial ring. |
| `MvPolynomial.homogeneousComponent` | `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:512` | Degree-k component, not arbitrary leading data. |
| `Matrix.rank` | `Mathlib/LinearAlgebra/Matrix/Rank.lean:132` | `finrank` of the mulVec linear-map range; the headline uses fields, not the zero semiring. |
| `LaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:100` | Hahn series indexed by ℤ; use variable T⁻¹. |
| `RatFunc.inftyValuation` | `Mathlib/FieldTheory/RatFunc/Valuation.lean:81` | Infinity valuation; no new completion carrier claimed. |
| `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes` | `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:185` | Noetherian ring and prime minimal over the generated ideal. |
| `Nat.forall_exists_prime_gt_and_modEq` | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:462` | Nonzero modulus and coprime residue. |
| `legendreSym.quadratic_reciprocity` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107` | Distinct odd primes, with prime instances. |
| `legendreSym.at_two` | Same file, line 60 | Odd prime argument. |
| `CategoryTheory.Abelian.SpectralObject` | `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41` | Functor and exactness carrier; geometric filtration still constructed here. |
| `ContinuousMap.curry` | `Mathlib/Topology/CompactOpen.lean:430` | Compact-open map; evaluation uses locally compact P¹. Does not assert uniform germ bounds. |
| `nonempty_inter_closedPoints` | `Mathlib/Topology/JacobsonSpace.lean:105` | Nonempty locally closed subset in a Jacobson space. |
| `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:112` | Locally finite-type morphism with Jacobson target. Does not construct sheaf supports. |
| `UnitAddCircle.fundamentalGroupMulEquiv` | `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:257` | Fundamental group to multiplicative ℤ. |
| `Circle.fundamentalGroupMulEquiv_expLoop` | Same file, line 388 | Positive exponential loop maps to +1. |
| `Polynomial.coeff`, `MvPolynomial.totalDegree` | `Mathlib/Algebra/Polynomial/Basic.lean:558`; `Mathlib/Algebra/MvPolynomial/Degrees.lean:432` | Out-of-range coefficients0; zero polynomial totalDegree0, excluded by k≥3 and degree=k in theorems. |
| `Ideal.IsPrime`, `Ideal.radical`, `Ideal.span` | `Mathlib/RingTheory/Ideal/Prime.lean:41`; `Mathlib/RingTheory/Ideal/Operations.lean:799`; `Mathlib/RingTheory/Ideal/Span.lean:45` | Prime includes not-top; radical is existential power membership; span is ideal generation. No reducedness follows from prime radical. |
| `ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean:26` | Krull dimension of PrimeSpectrum, valued in WithBot ℕ∞. |

### Ownership, suppliers and direction

Read the board package index before making availability claims. Used `roadmaps show` and separate object searches across main and the indexed open heads, including the named sibling roadmaps. Broad results were narrowed when the tool's output cap was reached. Inspected main DGFloer, AlgebraicTopology and ClassicalArithmeticCompletion for house style and ownership; ignored revision pull requests as suppliers where main exists. Searched board packages/designs as additional ownership evidence. No retained fully qualified Lean name occurs in another indexed acceptance file.

Resolved citations at the actual main/head copies:

| Supplier | Sections read and result |
| --- | --- |
| SchemeAndStackFoundations, main | §§0.2–0.3,0.7–0.9,5.12. Finite-type dimension, spreading and projective Bézout exist. §0.7 has the local/generic fibre statements; the declared constructible-level-set extension remains distinct. |
| EtaleCohomologyFoundations, main | §§0.6–0.7,F.0.1–F.0.2,F.1,F.2.4–F.2.7,F.3,F.4.1–F.4.6,F.5–F.6. Localization, compact-support operations, finiteness/generic lissity, rational realization and trace exist at their stated domains. Character/Fourier sheaves remain explicit gaps. |
| EtaleDualityAndPerverseSheaves, open head | §§0.6,3.2–3.8,4.1,4.3,4.6,5.9. Smooth top duality, coefficient extension, comparison, affine vanishing and primitive operations resolve. §3.8 is nonarchimedean analytic smooth trace; complex comparison comes from §§3.5–3.7. R01 limits §5.9 use; R02 points to existing §4.7. |
| InverseGaloisAndArithmeticFundamentalGroups, open head | IG.0.T4 at line 545 supplies the all-powers geometric-Frobenius point-count formula; IG.5.1 at line 5220 supplies unit-difference configurations and their S_m-torsor; the *Finite-cover criteria* paragraph inside IG.5.7 starts at line 6348. |
| DeligneWeightsAndPurity, open head | §§8.1,8.8 at lines 2704 and 2873. Constant coefficients have weight0 and separated finite-type Rf_! preserves the upper complex bound; H_c^i eigenvalues have size≤Q^(i/2). |
| LefschetzPencilsAndVanishingCycles, open head | §§5.1,5.8,5.10 at lines 2775,3007,3072. General-line image, symplectic openness and the orthogonal open-or-finite reflection alternative exist. Openness is over ℚ_ℓ; scalar extension occurs only after taking Zariski closure. |
| DGFloer, main | Layer1 item1, lines362–364, supplies degree-one Hurewicz; Layer2 items2–3, lines472–504, supplies restriction fibrations and fixed-interval sphere/loop comparisons. |
| AlgebraicTopology, main | Stages4,6,8: CW cofibrations, cohomology/universal coefficients and based homotopy comparisons. No claim of uniform germ control is imported from them. |
| ClassicalArithmeticCompletion, main | §6.44 at line13185 is eventual leading-Hankel vanishing for an infinite series. The finite rectangular-rank Padé variant here is distinct. |
| AlgebraicTopologyPartII / GeometryOfNumbersAndQuadraticArithmeticPartII | Their board designs contain AT2.2–AT2.5 and the *FunctionFieldLatticesAndShrinking* FL.4 proposal. They are consumed only through declared contracts; absence of published implementations is not supplier drift. |

By object, the pinned Tau Ceti Hankel estimate `TauCeti.sub_nonneg_of_posSemidef_hankel` (`TauCeti/Analysis/Matrix/PosSemidef.lean:183`) concerns bounded positive-semidefinite sequences, not finite Hankel rank/Padé loci. Its Artin–Schreier polynomial identity (`TauCeti/Algebra/CharP/ArtinSchreier.lean:33`) is not a character-sheaf construction. Neither duplicates these targets. DGFloer's filtered-complex spectral sequence remains a different object from this finite geometric localization adapter.

The Lang–Weil owners were inspected: IG's fixed-model number-field reduction estimate, ArithmeticStatisticsPartIII's hypersurface estimate, and SieveMethodsAndPrimePatterns §5.4's finite-presentation uniform count. They do not already state the all-extension dimension criterion of §8.10 or the arbitrary-field Cartesian-grid bound. ArithmeticStatisticsPartIII §2.23 (line 2190) treats projective geometrically integral hypersurfaces; its count is not the general dimension criterion. The count-to-dimension implication is owned here and derives its lower asymptotic from existing trace and weight owners. The prescribed-germ constructions and winding obstruction did not appear elsewhere in the searched sources. Nothing was moved to a later supplier.

All twelve plan slugs match their README contracts, with a named supplier and explicit mathematical domain: `sf-fibre-strata`, `ecf-character-fourier`, `ecf-one-variable-fourier`, `edc-top-components`, `lpv-universal-monodromy`, `symmetric-lattice-shrinking`, `at2-arrangement-cohomology`, `at2-stable-diagonal`, `at2-tame-polynomial`, `at2-tame-bouquet`, `at2-double-loop-betti`, `at2-fermat-loop-connectivity`. No obsolete G3/G4/G5/G6 or specialized FunctionFieldArithmetic gap remains. The scalar shrinking, Fourier, cubic-surface, zero-configuration and n=4/n=5 loop tests above check their boundaries. Supplier contracts are not certified implementations, and acceptance after the fixes would remain conditional on them.

Read every *Needs:* line and layer Dependencies list. Required mechanical dependency check, exit 0, complete output:

```text
depcheck: 51 roadmaps, 588 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The check does not certify the generality of supplier inputs; that is why R01 is still necessary.

## Not verifiable

- No directly cited work is unreadable. No outstanding missing-reference file was present, and none was created.
- The Katz book result behind BS20 line 1167 and the Katz–Sarnak theorem behind BS20 line 1422 were not independently read. They are not direct README citations; the package exposes their required mathematical content as named supplier contracts. This review verifies the BS20 proof step and the contracts, not those book proofs.
- The twelve future supplier deliverables and existence of StrongGermData are not implementations available at the pins. Their declarations and consumption were checked; no proof of the sharp minor bound or trace conjecture is claimed.
- BV15 journal pagination was not compared with the preprint. The package consistently cites arXiv v2 pagination, as its manifest requires.

## Source issues

- **Error** in BS20 at proof of Proposition 2.6, printed p.934 (BS20 line 1862): the source says a lower expression for the stratum threshold suffices; it should be bounded above, retaining 4(r+1), giving cutoff192 rather than188 for k=3,d=4,n=24; affects a stated result.
- **Misprint** in BS20 at proof of Proposition 2.6, printed p.934 (BS20 line 1845): the source says the last index is floor(kd/2)−1; it should be ceil(kd/2)−1, since the length-nine anti-identity has rank5 at stage4; affects the proof.
- **Gap** in BS20 at proof of Proposition 2.6, printed p.934 (BS20 line 1860): the source says the full stratum has the required dimension using the open pair chart; it should also bound lower-denominator pieces by m+m′≤2m and handle the saturated last stage; affects the proof.
- **Misprint** in BS20 at proof of Lemma 2.4, printed p.903 (BS20 line 491): the source says the kernel sum has m terms; it should have m+1 terms, matching the kernel vector and denominator polynomial; affects nothing.
- **Misprint** in BS20 at proof of Lemma 3.7, printed p.917 (BS20 line 1154): the source says the remaining generic coordinates stop at a_(n−1); it should include a_n, leaving n−1 coordinates after choosing a₁; affects nothing.
- **Misprint** in BS20 at proof of Lemma 4.3, printed p.924 (BS20 line 1435): the source says the exceptional rank pairs are (2,3),(4,5) in orthogonal/symplectic order; it should be (3,2),(5,4) in that order; affects nothing.
- **Misprint** in BS20 at proof of Lemma 4.4, printed p.925 (BS20 line 1473): the source says the relative trace target has twist +(n−1); it should have twist −(n−1), with geometric Frobenius eigenvalue q^(n−1); affects nothing.
- **Misprint** in BS20 at proof of Lemma 6.4, printed p.938 (BS20 line 2064): the source says the smaller-ball count has parameter c−s; it should have c+s, as in the statement and product formula immediately afterward; affects nothing.
- **Gap** in BS20 at Proposition 4.1, printed p.922 (BS20 line 1323): the source says odd differentials vanish without the cubic exceptions; it should exclude the cases omitted by its monodromy input or prove them separately; affects the proof.
- **Gap** in BS20 at spreading after Theorem 2.7, printed p.906 (BS20 line 620): the source says the coefficient ring of f models the pair; it should also contain the coordinates of the prescribed vector, with a nonzero coordinate inverted; affects the proof.
- **Misprint** in BS20 at spreading after Theorem 2.7, printed p.906 (BS20 line 626): the source says Spec K is the generic point of Spec R; it should say it lies over that generic point, since K need not equal Frac R; affects nothing.
- **Gap** in BS20 at Lemma 7.2, printed pp.940–941 (BS20 line 2174): the source says prescribed-germ maps form a space equivalent to Ω²X without specifying topology; it should specify uniform-germ topology and prove its comparison; compact-open topology has the winding obstruction; affects a stated result.
- **Misprint** in BS20 at the argument before Theorem 7.7, printed p.945 (BS20 line 2422): the source says trace perfection identifies the first-page dimension sum directly with continuous cohomology; it should first identify compactly supported mapping cohomology with that continuous cohomology; affects nothing.
- **Error** in LR14v2 at Lemma 2.6, printed p.5 (LR14v2 line 228): the source says affine hyperplane sections preserve degree; it should use the cumulative-degree inequality, since y=x² cut by x=0 has degree1 rather than2; affects the proof.
- **Misprint** in LR14v2 at Proposition 2.3, printed p.4 (LR14v2 line 169): the source says the affine subvariety lies in projective space; it should place the affine case in affine space; affects nothing.
- **Error** in LR14v2 at proof of Proposition 2.3(b), printed p.6 (LR14v2 line 277): the source says the number of rational hyperplanes is qπ_(n−1); it should be π_n=qπ_(n−1)+1 and use π_nπ_(m−1)≤π_(n−1)π_m; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a1377455f589c7e0527574c73425d548deaf36f8", "job": "REV-PKG-ExponentialSumsAndCircleMethodPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
