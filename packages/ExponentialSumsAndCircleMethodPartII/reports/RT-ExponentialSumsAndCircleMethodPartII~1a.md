<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1266#issuecomment-6423921629 -->
Red team round 1 pass a (codex) of 5607256

Verdict: needs_changes

1. **F01** (P2) Split spreading from the comparison it consumes

   **Location:** packages/ExponentialSumsAndCircleMethodPartII/README.md:1130 and :1149. “Identification of the transported abutment with mapping cohomology additionally uses the finite-field case of §10.2.”

   **Claim:** §10.1 includes the transported mapping-cohomology identification; §10.2 imports §10.1 to obtain the comparison over general fields.

   **Witness:** The target-level edges are 10.1 → 10.2 → 10.1. For k=3,d=2,n=40, both targets claim the same transported identification in i>−4; their unsplit Needs lists have no topological order.

   **Exact repair text:** Replace §10.1's abutment-identification clause with: “Transport the finite-field major-arc spectral sequence and its abstract abutment; no identification with mapping cohomology is made in this target.” Delete its dependency on §10.2. In §10.2 write: “First prove the finite-field comparison using §§7.5, 9.4 and 3.6. Then apply §10.1 to transport that proved comparison and the modeled mapping cohomology to the general-field fibre.” Its Needs line should distinguish these two steps.

   **Retest:** For k=3,d=2,n=40, first obtain j>156 on the finite-field Fourier side, hence i=j−160>−4, and only then transport. D=74 and the final range are unchanged; 10.1 now precedes 10.2.


2. **F02** (P2) The widened first-page theorem consumes narrower stratum targets

   **Location:** packages/ExponentialSumsAndCircleMethodPartII/README.md:19, :615, :661, :799 and :803. “In the circle-method layers assume … d≥k−1 … n>2ᵏ(k−1), unless a statement explicitly uses a wider range.”

   **Claim:** §7.2 explicitly allows d≥1,n≥2, but its sole geometric input §5.14 (and §§5.1–5.11 feeding it) does not override the standing large-d and large-n hypotheses. The same leak affects §7.3/§6.6 before the widened parity theorem.

   **Witness:** Take k=3,d=1,n=2,p=5, f=Y₁³+Y₂³−1, x=(1,−1). Both smoothness tests hold. §7.2 admits these data, while §5.14 inherits d≥2 and n>16 and therefore cannot supply its E₁ calculation.

   **Exact repair text:** Add a scope paragraph before Layer 5: “Throughout this layer assume n≥2, k≥3, d≥1, p>k, ℓ≠p, smooth X and smooth leading boundary, and a fixed nonzero incident leading vector x. Neither n>2ᵏ(k−1), d≥k−1 nor an even coefficient-prime order is required. Retain m≤d wherever stated.” Give Layers 6 and 7 the same baseline, with n≥3 and the two cubic exceptions imposed exactly in §§6.4–6.5 and §7.4. Amend Conventions so its larger range applies only where the minor-arc/comparison argument requires it. Keep §3.1's arbitrary-field definition and §7.1's general filtration statement at their stated generality.

   **Retest:** In the witness, the boundary consists of three distinct geometric points, H_c¹(X) has dimension 4, and §5.14 at m=1 has configuration exponent a+1−4=a−3, hence degree a=5 and twist −1. These are precisely §7.2's m=1,s=4 term. For n=5,k=3,d=1,p=7,ℓ=2 the widened relative inputs also support §7.4's own odd-order-prime Check; no Weyl conjugation is used.

3. **F03** (P3) Several Checks are instructions rather than discriminating tests

   **Location:** packages/ExponentialSumsAndCircleMethodPartII/README.md:765, :929 and :1207. “Require m≤d”; “No Jacobian or measure normalization is involved”; “Intersect this range with §10.2 before counting known mapping-space groups.”

   **Claim:** These bullets are offered as Checks of the relative stratum formula, difference identity, and near-top degeneration range.

   **Witness:** None specifies an instance or an expected value. The same three sentences remain true if the stratum shift, cohomological-degree identity, or comparison cutoff is accidentally changed.

   **Exact repair text:** Replace those three bullets respectively with:

   - “At m=d the quotient affine rank is n(d−m)=0 and contributes shift/twist (0,0); at m=d+1 the proposed rank is −n, so the affine-bundle input is unavailable.”
   - “Over 𝔽₅ with ℓ=2, N=1 and G=a², cd(G)=cd(−G)=1; G(a)−G(b)=a²−b² and G(a)−G(a+y)=−2ay−y² both have cohomological degree 2.”
   - “For n=40,k=3,d=2, automatic major-arc degeneration applies above −2811, while mapping comparison is only known above −4. Degree i=−5 satisfies the first bound but not the second.”

   **Retest:** The replacement values are (0,0), 1+1=2=2, and −5>−2811 with −5≤−4. A wrong affine shift, difference normalization, or identification range now fails an explicit Check. These are README Checks, not additional Suggested.lean declarations.

## Verified sound

Read all 1,643 README lines and all 145 Suggested.lean lines: **89 numbered target sections, 9 Lean declarations (7 definitions and 2 theorems), and 251 Check bullets**. The README uses numbered headings rather than bold target names. The tables below record computed controls for all 89 target sections and all 9 declarations; these are instance tests, not proofs. All 251 Checks were read against their section; the numerical and boundary controls are recorded by section rather than claiming 251 separate experiments. R03 identifies three bullets that do not supply discriminating tests.

Resolved **52 named source locations** against the cached texts: 45 in BS20, 3 in LR14v2, 1 in BV15 and 3 Stacks tags, with surrounding proof passages. The BS20 inventory is Theorem 1.1, Corollaries 1.2/1.4, Conjecture 1.3, Remark 1.5; equation (2.1), Definition 2.3, Lemmas 2.1/2.4/2.8, Propositions 2.5/2.6, Theorem 2.7, Corollary 2.9; Lemmas 3.1/3.3–3.9/3.11 and Corollaries 3.10/3.12; Proposition 4.1 and Lemmas 4.2–4.4; Definitions 5.1/5.2, equation (5.1), Lemmas 5.3/5.4/5.6 and Propositions 5.5/5.7/5.8; Lemma 6.1 and Proposition 6.2; Conjecture 7.1, equation (7.1), Lemmas 7.2/7.6 and Theorem 7.7. LR14v2 contributes Theorems 1.1/2.1 and Proposition 2.3; BV15 contributes Lemma 2.8; STACKS contributes 05F9, 012K and 0BK5. The original topological arguments are identified as original in the package; BS20 supplies their setting, not their proof.

Compared every elaborated type in the supplied signature log with the source and README: **9 compared, 0 dropped binders**. No Lean command was run. The zero coefficient ideal, unit coefficient ideal, empty Hankel row type, zero frequency, characteristic-three polar degeneration and conservative-range equality all have explicit controls below. The two theorems are not one-tactic consequences of their definitions or of a located pinned theorem. All seven definitions are used by those theorems. No padding declaration was found.

The headline inventory and acceptance-test disposition are:

| Headline | README | Suggested.lean disposition |
|---|---|---|
| Uniform finite-grid and polynomial-box bounds | 0.2, 1.1 | Named in module docstring; cumulative geometric degree interface missing. |
| Compact-support Fourier orthogonality | 3.6 | Named in docstring; finite-E constructible compact-support carrier missing. |
| Signed major-arc strata and relative first page | 5.14, 6.6, 7.2–7.5 | Named in docstring; same derived carriers and relative filtration missing. |
| Universal monodromy parity and odd-differential vanishing | 6.5, 7.4 | Named in docstring; geometric local systems/monodromy carrier missing. |
| Geometric cohomological Weyl bound | 8.6 | Named in docstring; compact-support character-sheaf cohomology missing. |
| Uniform minor-arc polar count | 8.9 | Stated as `minor_arc_polar_count` on finite native coefficient tuples. |
| Conservative minor-arc vanishing and comparison | 9.4, 10.2 | Named in docstring; constructible cohomology/abutment comparison missing. |
| Geometric irreducibility and expected dimension | 10.8 | Stated as `mapping_geometrically_irreducible`; README explicitly explains application over an algebraic closure. |
| End-winding obstruction and compact-open trace-pairing counterexample | 11.9–11.12, 13.2 | Named in docstring; prescribed projective-germ carrier and comparison missing. |
| Conditional degeneration | 13.3 | Named in docstring; stronger germ data, actual trace pairing and configuration/loop comparison missing. |

Supplier citations were checked in **11 named roadmap contract groups**, including the section ranges and specific named targets below. The 12 gap slugs match the top-level plan entries and README contracts; none has supplier `none`. Their absence as implemented supplier results is not reported as a defect. Their hypotheses distinguish them from the existing finite-torsion, smooth-duality, infinite-Hankel and topological foundations.

| Supplier/ownership check | Resolution and convention witness |
|---|---|
| SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9, 5.12 | Relative spectra/Proj, finite-type dimension, approximation and projective Bézout exist. The affine parabola section has degree 1≤2, so only the inequality is consumed. Fibre-level constructibility is separately declared. |
| EtaleCohomologyFoundations §§0.6–0.7, F.0–F.6 | Finite diagrams, six operations and rational realization exist; F.4.5 explicitly includes finite E extensions. F.4.6 retains finite-group and Tate conventions: geometric Frobenius on E(1) is q⁻¹. The two character/Fourier extensions are gaps. |
| EtaleDualityAndPerverseSheaves §§0.6, 3.2–3.8, 4.1/4.3/4.6/4.7 | Smooth finite-E duality, comparison, Lefschetz and primitive Betti statements exist. The top-component assertion for singular/nonreduced schemes is a declared extension. A doubled point still has top rank 1. |
| GeometryOfNumbersAndQuadraticArithmeticPartII, FL.4 | Symmetric lattice shrinking is a declared contract; the scalar cubic witness gives 225=25·9 after shrinking. No local ownership of the generic lattice theorem is claimed. |
| InverseGaloisAndArithmeticFundamentalGroups IG.0.T4, IG.5.1, IG.5.7 | Point-count trace, ordered-root permutation torsor, and the named finite-cover criteria exist. IG.5.7's relevant bold target exists even though its section heading concerns hyperelliptic quotients. S₀ and S₁ are trivial; Spec F_(q²) is detected at extension degree 2. |
| DeligneWeightsAndPurity §§8.1/8.8 | Mixed upper weights and separated finite-type compact direct image exist; the point has eigenvalue 1 in degree 0 and A¹ eigenvalue q in degree 2. |
| LefschetzPencilsAndVanishingCycles §§5.1/5.8/5.10 | Pencil image comparison and symplectic/orthogonal alternatives exist. Excluding the residual finite orthogonal alternative is expressly a gap; the cubic surface exception is retained. |
| AlgebraicTopologyPartII AT2.2–AT2.5 | Six declared interfaces, with n≥4 for full double-loop Betti comparison and n≥5 for Fermat simple connectivity. They are not asserted to exist already. |
| AlgebraicTopology Stages 4/6/8 | CW/cofibration, cohomology/UCT and higher-homotopy comparisons exist; S² has Ω² components indexed by Z, so a connected-component restriction cannot be dropped. |
| DGFloer Layer 1 item 1; Layer 2 items 2–3 | Degree-one Hurewicz and the fixed-interval mapping-space interfaces exist. S₃ abelianizes to Z/2, not S₃; the based disc restriction is the specified pullback of the unbased fibration. |
| ClassicalArithmeticCompletion §6.44 | Infinite eventual-Hankel-determinant rationality exists; it does not duplicate the finite rectangular-rank Padé target. At L=9,m=4 the latter must retain rank 5. |

The 16 explicit Mathlib/Tau Ceti declaration-and-line citations were resolved at the pins. The additional native coefficient-ring names resolve to `Polynomial.coeff` in Mathlib/Algebra/Polynomial/Basic.lean:558, `Ideal.span` in Mathlib/RingTheory/Ideal/Span.lean:45, `Ideal.radical` in Mathlib/RingTheory/Ideal/Operations.lean:799, `Ideal.IsPrime` in Mathlib/RingTheory/Ideal/Prime.lean:41 and `ringKrullDim` in Mathlib/RingTheory/KrullDimension/Basic.lean:26. In particular primeness includes properness, radical primeness does not imply reducedness of the original quotient, and ring dimension uses `WithBot ℕ∞`.

Ownership searches used `roadmaps grep` for Hankel matrices, polar counts, Weyl differencing, finite grids/cumulative degree and prescribed germs, and `roadmaps show` for the relevant suppliers. Searches also covered main, Completed, board packages and the 55 supplied open-head checkouts. No other declaration with this package's namespace or either headline name was found. Generic configurations, duality, topology, primitive monodromy and symmetric shrinking remain with their named suppliers. The local finite-rank Padé application, polynomial polar count and prescribed-germ counterexample have no competing owner found in these searches. This is a bounded search, not an assertion about unprovided open work.

The requested mechanical dependency check returned:

```text
depcheck: 56 roadmaps, 648 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line for this roadmap at the roadmap level. R01 concerns the finer numbered-target dependency graph. The checked head was 5607256. The base-to-head diff contained only this package folder: 8 files, 2,647 insertions and 45 deletions. Suggested.lean has the required namespace, module docstring, single `import Mathlib`, real definition bodies and two `theorem` declarations with `sorry`; no `set_option`, admitted data, placeholder predicate or process narrative was found.

### Computed statement audit

The numbered subsection is the target unit (the README uses headings rather than bold target labels). API bullets were read with their defining target. Values below are mathematical computations, not Lean executions. Standing hypotheses are README Conventions, except where a target explicitly widens them. “Pass” records the displayed instances, not a proof of the general theorem.

| Target | Instances and computed values on both sides | Result / change |
|---|---|---|
| 0.1 | Two planes in A³: intersection dimension 1=2+2−3. Parallel lines: empty, so nonempty hypothesis fails. A line plus a disjoint point meets a transverse line only once but violates the every-component-meets condition. | Pass |
| 0.2 | S={0,1}, coordinate line: 2=1·2. Line plus (0,1): 3≤2+1≤2·2. Parabola sliced by x=0: degrees 1≤2. Empty V: 0 points; a doubled point: 1 point and reduced degree 1. | Pass; cumulative degree necessary |
| 0.3 | V={xy=0}→A¹_x: over x≠0 fibre dimension 0 and total dimension 1=1+0; over x=0 fibre dimension 1 and total dimension 1=0+1. Point→A¹ away from its image: fibre empty, dimension −∞. | Pass conditional on declared gap |
| 1.1 | F₂[T], h=2: 4 polynomials; coordinate line 4=2², plane 16=2⁴. h=0: only zero, count 1 if origin included, otherwise 0. Dimension zero: one point≤degree 1 at every height. | Pass |
| 2.1 | p=5, ℓ=19: residue 4, square 1, residue≠1, order 2. p=2: −1=1, order 1, excluded. For B=20, ℓ=29 is >20 and residue 4. | Pass |
| 2.2 | ℓ=2,p=13: 2⁶=−1 mod13 and order 12. ℓ=3,p=5: p mod3=2, p mod4=1, 3²=−1 mod5, order 4. Adding p=5 to the finite bad set excludes that witness but p=17 still works for ℓ=3. | Pass |
| 3.1 | d=2,x=(1,0): g₁=T²+a₁T+a₀, g₂=c₁T+c₀. f=0 gives ideal 0; f=1 gives ideal 1. f=Y₁,d=1,x₁=1 gives T+a and ideal 1. Over the zero algebra there is 1 tuple; over K[ε]/ε², f=Y₁² admits the infinitesimal constant ε since ε²=0. | Pass |
| 3.2 | dn variables minus kd equations gives dn−kd=d(n−k). For n=40,k=3,d=2: 80−6=74. Empty scheme has 0 components, hence makes no nonemptiness assertion. | Pass |
| 3.3 | f=x³+y³−1: affine gradient (3x²,3y²) never vanishes on f=0; homogenized Fermat cubic is smooth. Parallel lines x(x−1)=0: leading x² has derivative 2x=0 on its boundary, so fails leading smoothness. | Pass |
| 3.4 | Cubic difference example: e=b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c). At a=c=0: e=b₁. Replacing f by f+1 adds exactly b₁; b=0 gives 0. | Pass |
| 3.5 | n=2,d=1,b=0: stalk E[−4](−2), degree 4 and trace q². Nonzero linear phase: all groups 0. p=5,ℓ=2: ord₅(2)=4, coefficient extension degree 4. | Pass |
| 3.6 | Zero coefficient map on A^N: right complex E[−2(N+L)](−N−L)[2L](L)=E[−2N](−N), equal to left. A nonzero constant coefficient vector yields empty zero locus and zero integral on both sides. | Pass |
| 4.1 | L=3,m=0: column (b₁,b₂,b₃), rank 0 iff all entries 0. L=9,m=4,b₅=1: 5×5 anti-identity, determinant (−1)^10=1, rank 5. L=m: 0 rows and rank 0. | Pass |
| 4.2 | b=(1,2,4): H₁ has proportional rows, rank 1; H₀ has rank 1, so b∈A₁ but b∉A₀. b=0 has rank 0 at every level. | Pass |
| 4.3 | L=9,m=4: rank 5>4; m=5: rank≤4≤5. L=0: one frequency, rank 0, A₀=A⁰. | Pass |
| 4.4 | L=3,m=1,b=(1,2,4): α=1/(T−2)+O(T⁻⁴). b=(0,0,1): h₁=0,h₂=1,m′=0, error T⁻³ and threshold −3; H₁ rank 1. b=(0,1,0): H₁ rank 2, and neither m′=0 nor 1 meets the required error. | Pass, both directions |
| 4.5 | The preceding exact A₁ cases have unique reduced pairs (1,T−2) and (0,1), respectively. In the second case m′=0<1 and the T⁻³ error coefficient is 1≠0. At b=0,m=1, exact-stratum hypothesis fails. | Pass |
| 4.6 | m=0 gives (0,1). m=1: c/(T−a) gives b₁=c,b₂=ca,b₃=ca², c≠0. Taking h₁=T−a,h₂=(T−a)(T−b) cancels to 1/(T−b), denominator degree 1 instead of 2. | Pass |
| 4.7 | m=1 good pairs have 2 parameters (a,c), c≠0; lower-denominator boundary has 1 error parameter. Dimensions 2 and 1 are ≤2m=2. m=0: dimension 0. | Pass |
| 5.1 | Cubic d=m=1,L=3,b=(0,0,1): e=3(a−c); translating a by λ changes e by 3λ, and integration is 0 in p>3. This boundary has m′=0<1; a good c/(T−a) arc is not cancelled by this argument. | Pass |
| 5.2 | Divide xT²+a₁T+a₀ by T−b: quotient xT+(a₁+xb), remainder xb²+a₁b+a₀. For m=d fibre dimension n(d−m)=0. Over Z/4 a leading coefficient 2 is nonunit, so monic division hypothesis is substantive. | Pass |
| 5.3 | h₂=T−a: remainder vector r and numerator h≠0 give phase hf(r). m=0: no variables, pair (0,1), value E. h₁=0 with m>0 has gcd h₂≠1. | Pass |
| 5.4 | One quotient coordinate contributes degree 2, twist −1, trace q; rank 0 contributes degree 0, twist 0, trace 1. Shift formula gives −2 and 0 respectively. | Pass |
| 5.5 | l₁=T,l₂=T−1,h₁=h₂=1: combined numerator 2T−1 and (2T−1)/(T(T−1))=1/T+1/(T−1). l₁=l₂=T has resultant 0 and is excluded. | Pass |
| 5.6 | Modulus (T−a)²: on a point with ∂jf≠0, highest-remainder translation gives nonzero linear phase; at the Fermat critical point 0, f(0)=−1, numerator translation gives −λ. Both integrate to 0. | Pass |
| 5.7 | X=A^r: trace E[−2r](−r)→itself is identity, fibre 0. Two disjoint A^r: top trace E²→E sends (a,b) to a+b, kernel dimension 1. | Pass |
| 5.8 | g=a: for every h≠0, linear cancellation gives 0, total 0. g=0: H_c⁴(G_m×A¹)=E(−2)≠0; g=a^p−a,h=1: H_c²(A¹)=E(−1)≠0. A^r trace fibre is 0 on both sides of the hypersurface test f=a₁. | Pass |
| 5.9 | Cubic Fermat in A³: reduced middle rank (3−1)³=8, degree 2; outer [−2] gives degree 4 and twist −1 for denominators T and T−1 alike. | Pass |
| 5.10 | m=0: E⊗E=E, shift 0. m=1: configuration A¹ gives extra degree 2/twist −1 before the displayed [−2](−1). With m=2,ℓ=2, 1/2 exists in Q₂ despite 2 dividing 2!. | Pass |
| 5.11 | m=0 yields E[−2nd](−nd). m=d yields shift −2d and twist −d before inserting the middle factors; affine quotient contribution 0. | Pass |
| 5.12 | Smooth affine plane cubic with three points at infinity: H_c⁰=0, dim H_c¹=2·1+3−1=4, H_c²=E(−1). Trace fibre has rank 4 only in degree n−1=1. | Pass |
| 5.13 | dim V=2: W₀ dimension 1, W₁ dimension 2; W₂ dimension 1 for n=4 (exterior) and 3 for n=5 (symmetric). | Pass |
| 5.14 | m=0 requires a−2nd=0. n=4,d=2,m=1: configuration index a+3−16=a−13 must equal 2, hence a=15; twist −1−4=−5. Complex formula gives 2+3+2+8=15. | Pass |
| 6.1 | Fermat x=(1,ζ,0,…), ζ^k=−1: f₀(x)=1−1=0; x≠0. Scaling x by 2 in characteristic zero changes x while preserving incidence. x=0 gives 0 but is excluded. | Pass |
| 6.2 | n=3 Fermat cubic: ranks 8 and 1 in degrees 2 and 4; top E(−2). n=4: ranks 16 and 1 in degrees 3 and 6; top E(−3). | Pass |
| 6.3 | Cubic in A⁴ over F₂₅: primitive boundary rank 6, closure rank 10, total 16. Boundary trace 801−1−625−25=150=6·25; extra twist would give 6·625=3750. | Pass |
| 6.4 | n=3: projective boundary dimension 1 and punctured cone dimension 2, connected. n=2 binary cubic: 3 boundary points, punctured cone 3 copies of G_m, not connected. | Pass in n≥3 |
| 6.5 | (k,N)=(3,3): orthogonal rank 6, excluded finite case; (4,3): rank 3(27+1)/4=21. Matrix [[−1,1],[0,−1]] has characteristic polynomial (t+1)² but square [[1,−2],[0,1]]≠I. | Pass |
| 6.6 | m=0: constant top E(−nd), no V factor. m=1: one V; m=2: V⊗V with transposition sign (−1)^(n−1). At n=4 the sign is −1. | Pass |
| 7.1 | Filtration {0}⊂A¹: H_c⁰({0})=E and H_c¹(G_m)=E, localization d₁ is an isomorphism; H_c²(G_m)=E(−1) survives to H_c²(A¹). This gives column increment 1 and total-degree increment 1. | Pass |
| 7.2 | n=4,d=2: m=0 term at s=16; m=1 configuration index s+4−16=s−12=2 gives s=14, total 15. Exactly 3 columns m=0,1,2. | R02: scope of inputs needs widening |
| 7.3 | At the same Fermat fibre, zero column remains degree 16, and tensor-square transposition is −1; relative stalk substitution yields the preceding numbers. | Pass |
| 7.4 | p=7,ℓ=2: order 3 is odd, but coefficients have char0 and +1−(−1)=2≠0. Odd r maps column eigenvalues +1 to −1, hence map 0; r=2 preserves the eigenvalue and need not vanish. | Pass |
| 7.5 | n=40,k=3,d=2: L=6,nd=80,D=74. Zero column twist 6−80=−74; for m=1, s+40=2 gives s=−38, total −37. | Pass |
| 8.1 | N=1: k=1 constant gives one point, linear gives ∅; G=a²,k=2 gives y=0, dimension 0; k=3 gives A², dimension 2. | Pass |
| 8.2 | Constant on A¹: cd=2. Nonzero linear: cd=−∞. a^p−a: pullback is geometrically constant, cd=2. For N=0 every function is constant and cd=0. | Pass |
| 8.3 | p=5,ℓ=2: 2²=−1 mod5, inversion automorphism exists. p=7,ℓ=2: subgroup {1,2,4} omits −1=6. For G=a² on A¹ both signs have cd=1. | Pass |
| 8.4 | G constant,N=1: 2+2=4, equal to cd of constant on A². G=a: −∞+(−∞)=−∞; difference −y is linear on A² and acyclic. G=a²: 1+1=2; a²−b² has cd=2. | Pass |
| 8.5 | Spec F_(q²): 0 F_q-points but 2 F_(q²)-points; constant sheaf has rank-1 geometric stalks and is detected at extension degree 2. Empty support: every stalk 0 and sheaf 0. | Pass |
| 8.6 | N=1,G=a²,k=2: bound (0+1(2−1))/1=1=cd. Retaining k=3: bound (2+1(4−2))/2=2≥1. Constant k=3: same bound 2=cd. Linear k=1: −∞ bound and cd. | Pass |
| 8.7 | Scalar cubic: Ψ=6uv; diagonal 6u²=2!·3u²; V is 2 axes, dimension 1 and degree 2. In char3 Ψ=0 and dimension becomes 2, excluded. Quadratic difference at a=y=1 is −3; its linear part −2 has the claimed negative sign. | Pass |
| 8.8 | Scalar cubic d=2,α=T⁻⁴: be=0, so N=Q²(2Q−1); at s=1, ac=0, N₁=2Q−1. Q=5 gives 225=25·9. α=0: 625=25·25. | Pass |
| 8.9 | Same Q=5 test: rank H₂=3>2; count 225≤2·5³=250. Zero frequency: count 625>250, rank 0 violates hypothesis. Characteristic3: count 81>54, violates p>k. h=1,s=1 gives exponent −4=−kd+m. | Pass; independent finite enumeration agrees |
| 8.10 | A^e: q^(re), bound C=1,c=e. Spec F_(q²): counts 0,2,0,2,…, dimension 0; cannot fit c<0. Doubled rational point: counts 1, dimension 0; ∅: counts 0, dimension −∞. | Pass |
| 9.1 | Scalar cubic d=m=2: V defined by be=0 with a,c free, dimension 3=4−1; count 2Q³−Q². At b=0 dimension 4, so rank exclusion is necessary. | Pass |
| 9.2 | Scalar cubic d=m=2: bound 2d−floor(m/2)/2=4−1/2=3.5, so a≥4 vanishes. At m=3=ceil(6/2) the complement is empty, all stalks 0. | Pass |
| 9.3 | L=9,d=3: m=3,4, including A₅\A₄. b₅=1 lies in A₅ but not A₄. L=12,d=4: m=4,5, last full stage A₆. | Pass |
| 9.4 | k=3,d=4,n=24: t=2,δ=1,2dn=192; B(5)=192−24+24=192; uniform cutoff 192+8−8=192. Printed sharp cutoff 192+4−8=188 is 4 smaller. | Pass; source proof gap retained separately |
| 9.5 | Same parameters: proposed cutoff 188, a=188 excluded, a=190 required but not supplied by cutoff192. k=3,d=2,n=40: sharp cutoff152, conservative156. | Defined conditional proposition only |
| 10.1 | f rational but x includes a transcendental t: coefficient ring of f alone omits t; adjoining t fixes the model. n40,k3,d2: transported interval i>−4 and D=74; identification currently references 10.2. | R01: split cyclic dependency |
| 10.2 | n40,k3,d2: j>156 on Fourier side; normalized i=j−160>−4; mapping degree j−12=i+148. j=157 gives mapping degree145 and i=−3. | R01: finite-field proof precedes transport |
| 10.3 | tδ=3,k=3: sharp i>−8 vs conservative i>−4; i=−6 lies only in sharp range. tδ=1: i>0 excludes 0. | Pass conditional |
| 10.4 | m=1: H_c²(A¹) only, s=2−n. n40,m2: −77≤s≤−76, total −75 or −74. m0: (0,0). | Pass |
| 10.5 | n40: m1 total −37; m2 totals −75,−74. Thus i=−1 and every i>0 occur in no bands; H_c^147=0 when D=74. | Pass |
| 10.6 | A possible r=2 differential requires source m≥2(n−3)+2=2n−4. Its source total ≤−2(n−2)(n−3), target ≤1−2(n−2)(n−3). For n40 the latter is −2811; larger totals admit neither. | Pass |
| 10.7 | A¹⊔point: top H_c² rank1, dimension1, but point violates component lower bound D=1. Doubled point: D=0, H_c⁰ rank1, dimension0 and irreducible despite nilpotents. ∅: top rank0, excluded. | Pass |
| 10.8 | n40,k3,d2: D=74,tδ=3>2; zero term E(−74), no adjacent total−1 term, top rank1. n32,k3,d2: tδ=2 equals k−1, so hypothesis fails and i=0 is not reached. | Pass |
| 10.9 | k3,n3,d1: g₂=0,g₃³=−1, g₁=T+a; family dimension1>D=0, equal to D−d+k−1=1. n2: equation 1=0, no family. | Pass |
| 10.10 | n40,k3,d2: sharp interval i>−8; i0 sum is E of dimension1; every m≥1 term vanishes since first possible total is −37. i=−8 excluded. | Unproved proposition, not asserted theorem |
| 11.1 | Fermat tuple divided by T^d gives [1:ζ:z^d:…:z^d]. Normal v=z^d has v/z^d=1; 2z^d gives 2 and z^(d+1) gives z→0, both fail leading coefficient1. | Pass |
| 11.2 | Escaping family at s=3r/2 gives v/z^d=−1, deviation2; projective normal magnitude is |z|^d→0 uniformly. Thus ambient compact-open continuity holds but uniform normalized bound fails. | Pass |
| 11.3 | g=T^d+a_(d−1)T^(d−1)+…: after dividing by T^d, error at |a_i|≤M is ≤dM|z| for |z|≤1. At x→0, the chart denominator loses its fixed nonzero leading value. | Pass |
| 11.4 | r=1/4 and s=0,3/8,1: h=0,1/2,1 and σ=1,−1,1. Lift endpoint difference 1. At r=0 the displayed division is outside its domain. | Pass |
| 11.5 | Fixed s>0, r<s/2 gives σ=1; fixed s=0 also gives1. Moving s=3r/2 gives −1 for every r>0. Sup distance from1 is2, while pointwise limit is1. | Pass |
| 11.6 | k-th power sum T^(dk)+ζ^k T^(dk)+1=1. Dropping coordinate3 gives0. Derivatives kx_j^(k−1) vanish simultaneously only at0, which is not on sum=1. | Pass |
| 11.7 | r(T)=1/(4(1+|T|))∈(0,1/4]; |a_s(T)|=|T|^d. For positive R at s=3r(R)/2, a_s(R)=−R^d; endpoints s0,s1 give R^d. | Pass |
| 11.8 | For a compact loop family, a common chart yields v≠0 on a tail; for the explicit family v=z^d/σ has modulus |z|^d and never vanishes, but ratio differs from1 by2 at the moving parameter. | Pass |
| 11.9 | Normal ratio=σ^−1: winding−1. Constant loop:0. Concatenation F*F:−2; F*F^−1:0. | Pass |
| 11.10 | Radii R₁,R₂ in the same tail give a nonzero homotopy and degree−1=−1 for the escaping loop; a nullhomotopy would force −1=0, impossible. | Pass |
| 11.11 | endWind(F^j)=−j for every integer j; equality F^j=1 forces j=0. Image includes−1 and hence all Z. | Pass |
| 11.12 | Cubic Fermat n40 has bouquet spheres S³⁹; π₂X=π₃X=0. Thus π₀Ω²X=0 and π₁Ω²X=0, while π₁Hco has quotient Z≠0. | Pass conditional on stated topology suppliers |
| 12.1 | u=az,w=1+bz: weighted seminorms |a|,|b|. Constant w=1.1: |w−1|/|z|=0.1/|z|→∞. w=−1: deviation2>1/2. | Pass |
| 12.2 | t0 gives (u,w); t1,χ1 gives (0,1); χ0 gives original pair. If |w−1|<1/2 then |1+(1−tχ)(w−1)|>1/2. At χ=1/2 a nonzero u is multiplied by1/2, so transition annulus is not fixed. | Pass |
| 12.3 | X=point: Ext and Ω²X each a point. X=S²,constant boundary: both have π₀=Z. X=S¹,boundary degree1: no extension; hypothesis excludes it. | Pass |
| 12.4 | Escaping loop has deviation2, hence fails the half-disc condition on every common tail. Polynomial collar coefficients bounded byM give seminorms≤M, with radius<1/(2M) if M>0. | Conditional comparison data, no existence claim |
| 12.5 | Given H≃Ext and Ext≃Ω²X, composite equivalence. For X=point both sides1 point; Fermat Hco gives π₁ quotientZ vs0, so Hco cannot supply the hypotheses. | Pass conditional; no unconditional existence inferred |
| 13.1 | n40,k3,d2: j-range0≤j<8; j0 trace rank1; j1 on Hco pairs algebraic dimension0 with topological dimension≥1; j8 excluded. | Unproved proposition; Hco instance refuted |
| 13.2 | D=74,2D−1=147; i=−1>−4. H_c^147=0, H¹Hco≠0, pairing rank0 cannot be perfect. | Pass |
| 13.3 | n40,k3,d2: j<8≤d(n−3)=74; in conservative comparison j<4, equality of dimensions permits total loss0 only. At i=−6 the sharp hypothesis is needed to identify the actual abutment. | Pass conditional |

### Lean declaration contexts and computed instances

There are no section-variable blocks. K has universe u_1 in every definition/theorem; all n,k,d,m,r are naturals. The supplied elaboration log was compared to every signature. No new Lean command was run.

| Declaration and README section | Retained variables and instances | Computed instances / result |
|---|---|---|
| mappingPolynomial, 3.1 | {K} [Field K] {n}, d,x,j | d0 gives constant x_j (empty lower sum); d2 gives x_jT²+a₁jT+a₀j; x_j0 leaves degree≤1. Real body agrees. |
| mappingEquation, 3.1 | {K} [Field K] {n},d,f,x | f0→0; f1→1; fY₁,d1,x₁1→T+a₀. Empty variable type n0 makes f constant. |
| mappingIdeal, 3.1 | {K} [Field K] {n},d,f,x | f0→(0), f1→(1), fY₁,d1,x₁1→(1). d0 gives the principal ideal of f(x), not an automatically zero ideal. |
| residuePhase, 3.4 | {K} [Field K] {n},k,d,f,x,b,a | kd0 gives empty sum0; f1 gives b₁ when kd>0. Cubic two-coordinate example produces the three displayed coefficients, with b₁ multiplying the constant. |
| hankelMatrix, 4.1 | {K} only; L,m,b; no algebra instance | L3,m1,b=(1,2,4) gives [[1,2],[2,4]]; L9,m4,b₅1 gives anti-identity. m≥L gives no rows. Bound proof always has i+j<L when a row exists. |
| iteratedPhaseDifference, 8.1 | {K} [Field K] {n d r},G,y,a | r0→G(a), r1→G(a)−G(a+y); scalar cubic r2 yields 6auv+3uv(u+v), hence linear coefficient+6uv. |
| polarCount, 8.8 | {K} [Field K] [Fintype K],n,k,d,f,x,b | Scalar F₅,k3,d2,b₄1:225. b0:625. d0 or n0:one increment tuple and count1. k0:phase0 and empty increment type, count1; k1 counts1 iff phase constant, otherwise0. |
| minor_arc_polar_count, 8.9 | {K} [Field K] [Fintype K]; n,k,d,m,f,x,b; hk,hd,hchar,hdegree,hinfty over AlgebraicClosure K,hm,hupper,hrank | F₅,n1,k3,d2,m2,fY³,x0,b₄1:225≤250. Same b0 gives625>250 but hrank fails. F₃ version81>54 but hchar fails. Natural exponent4−1=3; n0 cannot satisfy totalDegree f=3. |
| mapping_geometrically_irreducible, 10.8 | {K} [Field K] [IsAlgClosed K]; n,k,d,f,x; hk,hd,hchar,hdegree,haff,hinfty,hx,hinc,hn,hrange | C,n40,k3,d2,Fermat,x=(1,ζ,0,…): range2<3, expected dimension74; explicit g gives proper coefficient ideal. n32 gives range2<2 false. n0/1/2 violate hn. Radical primeness permits nilpotents; statement does not assert IsPrime of the original ideal. |

## Not verifiable

- No fresh Lean elaboration or proof build was run, as required by the read-only brief. The supplied elaborated signatures were inspected for all nine declarations; this does not certify the truth of their admitted proofs.
- The 12 declared supplier contracts remain conditions on eventual implementation. Their absence today is not a finding. In particular the previously settled AlgebraicTopologyPartII supplier issue is not re-raised.
- SharpMinorArcBound, StrongGermData and trace perfection are explicitly hypotheses/data, not existence claims proved by this package. No unconditional sharp comparison, stronger topology construction or degeneration theorem is certified here.
- Source typography was read from the supplied extractions. Ambiguous comparison glyphs and lost overbars were not treated as source errors. No additional missing source was identified, and no new reference request was needed. The source-issue list records mathematical or indexing discrepancies with independent witnesses, not OCR spacing defects.
- Ownership was checked against main, board packages, the supplied open heads and the indexed ownership search results. No claim is made about unpublished or unprovided work. The computed instances do not exhaust every field, coefficient system or homotopy type; inapplicable cases such as noncommutative fields or a zero field cannot instantiate the Lean signatures.

## Source issues

- **Misprint** in BS20 at Lemma 2.1 proof, printed p. 901 (BS20 line 413): the source says the lower-coefficient sum uses exponent j; it should be exponent i, so d independent powers remain; affects the proof.
- **Misprint** in BS20 at Lemma 2.4(4) proof, printed p. 903 (BS20 line 491): the source says the kernel equation sums only m coefficients; it should be m+1 coefficients, matching the kernel vector and denominator; affects the proof.
- **Gap** in BS20 at Theorem 1.1 spreading argument, printed p. 906 (BS20 line 620): the source says coefficients of f alone supply the mapping-family model; it should be a model containing the fixed leading vector's coordinates as well; affects the proof.
- **Misprint** in BS20 at Theorem 1.1 spreading argument, printed p. 906 (BS20 line 626): the source says Spec K is the generic point of Spec R; it should be a field-valued point over that generic point, allowing K strictly larger than Frac R; affects the proof.
- **Misprint** in BS20 at Lemma 3.2 proof, printed p. 910 (BS20 line 799): the source says the affine-line Künneth comparison uses product degree i−2; it should be product degree i+2, with the corresponding Tate normalization; affects the proof.
- **Misprint** in BS20 at Lemma 3.4 proof, printed p. 913 (BS20 line 924 and line 940): the source says affine compact pushforward has shift +2n(d−m); it should be shift −2n(d−m), as the subsequent calculation uses; affects the proof.
- **Misprint** in BS20 at Lemma 3.5 proof, printed p. 915 (BS20 line 1020): the source says symmetry interchanges numerator and denominator h₁,h₂; it should be interchange of the two coprime modulus factors and their corresponding data; affects the proof.
- **Misprint** in BS20 at Lemma 3.7 proof, printed pp. 917–918 (BS20 line 1154 and line 1158): the source says the fixed parameters stop at a_(n−1); it should be a₂ through a_n, leaving exactly the one variable a₁; affects the proof.
- **Misprint** in BS20 at Lemma 4.3 proof, printed p. 924 (BS20 line 1435): the source says the exceptional orthogonal/symplectic rank pairs are (2,3) and (4,5); it should be (3,2) and (5,4), with orthogonal rank first; affects the proof.
- **Misprint** in BS20 at Lemma 4.4 proof, printed p. 925 (BS20 line 1473): the source says the top trace target has twist +(n−1); it should be −(n−1), giving geometric Frobenius q^(n−1); affects the proof.
- **Gap** in BS20 at Proposition 5.5 induction, printed p. 931 (BS20 line 1681): the source says every translated difference has degree k−1 and uses its degree-indexed difference variety; it should be an upper-degree-indexed induction retaining k−1 even when the difference is zero; affects the proof.
- **Error** in BS20 at Proposition 2.6 proof, printed p. 934 (BS20 line 1845): the source says the last minor stratum index is floor(kd/2)−1; it should be ceil(kd/2)−1; kd=9 has a rank-five stratum omitted by the printed cutoff; affects the proof.
- **Gap** in BS20 at Proposition 2.6 proof, printed p. 934 (BS20 line 1863 through line 1887): the source says discarding the division remainder yields the sharper uniform vanishing cutoff; it should be a retained remainder bound; k=3,d=4,n=24,m=5 gives 192, not the claimed 188; affects the proof.
- **Misprint** in BS20 at Lemma 6.4 proof, printed p. 938 (BS20 line 2064): the source says the shrunken count is N_(γ,a−s,c−s); it should be N_(γ,a−s,c+s), as in the following product formula; affects the proof.
- **Gap** in BS20 at Lemma 7.2 proof, printed pp. 940–941 (BS20 line 2181 through line 2194): the source says pointwise leading-germ control supplies continuous simultaneous straightening; it should be a specified stronger topology and uniform collar argument; compact-open escaping loops have nonzero end winding; affects the proof.
- **Misprint** in BS20 at Lemma 7.4 proof, printed p. 943 (BS20 line 2319): the source says the final coefficient product omits the exponents −e_k(N); it should be the same exponents as in the immediately preceding Euler product; affects the proof.
- **Error** in BS20 at Corollary 7.5 proof, equation (7.3), printed p. 943 (BS20 line 2335 through line 2339): the source says the whole two-variable Euler product equals one fixed weighted diagonal; it should be extraction of that diagonal; n=4,N=1,j=0 leaves product 1−qU but diagonal 1; affects the proof.
- **Error** in BS20 at Lemma 7.6, printed p. 944 (BS20 line 2354): the source says the full double-loop Betti formula includes n=3; it should be restricted to n≥4; Ω²S² has infinitely many components and no finite degree-zero Betti coefficient; affects a stated result.
- **Misprint** in BS20 at Theorem 7.7 proof, printed p. 945 (BS20 line 2417 and line 2420): the source says ordinary mapping-space cohomology is the spectral-sequence abutment; it should be compact-support cohomology, as in Theorem 1.1 and the trace pairing; affects the proof.
- **Error** in LR14v2 at Lemma 2.6 and Proposition 2.3 proof, printed p. 5 (LR14v2 line 228 and line 243): the source says every nonempty affine hyperplane section retains the original degree; it should be an inequality after deleting infinity; the parabola has degree two but its x=0 section degree one; affects the proof.
- **Misprint** in LR14v2 at Proposition 2.3 affine proof, printed p. 5 (LR14v2 line 248 through line 251): the source says rational-coordinate slices cover the whole geometric variety; it should be their union on the finite rational grid; nonrational points of A¹ are not covered; affects the proof.
- **Error** in LR14v2 at Proposition 2.3 projective proof, printed p. 6 (LR14v2 line 277): the source says the number of rational hyperplanes is qπ_(n−1); it should be π_n=1+qπ_(n−1); P² over F₂ has seven, not six; affects the proof.
- **Gap** in BV15 at Lemma 2.8 proof, printed p. 12 (BV15 line 551 through line 559): the source says an unspecified coordinate change permits counting in the unchanged height box; it should be a height-controlled projection argument or original-coordinate slicing to retain coefficient-uniform constants; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "56072561a6bcdce57c40f78cbac033788c909934", "job": "RT-ExponentialSumsAndCircleMethodPartII~1a", "model": "gpt-6-astra", "worker": "chris-31"} -->
