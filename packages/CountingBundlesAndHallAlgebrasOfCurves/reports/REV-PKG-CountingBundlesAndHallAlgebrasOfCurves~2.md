<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/937#issuecomment-6392420353 -->
Review (codex) of 02cb60f

Verdict: needs_changes

1. **F01** (P1) The coherent rank-one coefficient still includes torsion

   **Location:** `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:808`, §4.9: “rank-one generating coefficient P(1)/((q−1)(1−z))”.

   **Claim:** This is the rank-one coefficient of the truncated nilpotent coherent-sheaf mass series introduced at line 800.

   **Witness:** On P¹/𝔽₂, N_(1,1)=4: O(1) contributes 1; each of the three O⊕κ(x) contributes 2/2=1. The displayed coefficient is 1. Section 5.10, line 975, retains the missing torsion factor.

   For O⊕κ(x), its endomorphisms are triangular: the two diagonal entries must vanish for nilpotence, while the one-dimensional off-diagonal entry is arbitrary. There are two nilpotent endomorphisms and two automorphisms. These sheaves all satisfy the nonnegative cutoff. Thus this is a Check contradicting the section's coherent carrier, not a failure of the universal existence theorem.

   **Exact repair:** Write N(T,z)=∑N_(r,d)T^r z^d and N₀(z)=[T⁰]N(T,z). Replace the Check by: “The zero-class mass is 1. After dividing out N₀(z), the rank-one coefficient is P(1)/((q−1)(1−z)); multiplying the rank-one coefficient of Log N by q−1 recovers P(1)/(1−z). On P¹/𝔽₂, [z]N₀=3 and [Tz]N=4, whereas [Tz](N/N₀)=1.”

   **Retest:** N₀=1+3z+O(z²); [T]N=N₀/(1−z)=1+4z+O(z²). Division gives 1/(1−z), with degree-one coefficient 1. The replacement agrees with both §§2.3 and 5.10. Source: S16 line 2224 and S16 line 2246.

2. **F02** (P1) Characteristic two does not mean a field of two elements

   **Location:** `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:1393`, §8.10: “Rank1,g=1 in characteristic2; coprime rank2 in characteristic2: Ω=2A”.

   **Claim:** The displayed normalization holds in characteristic two, with no restriction to 𝔽₂.

   **Witness:** For E:y²+y=x³ over 𝔽₄, #E=9, A_E(1,d)=9 and Ω_K(1,d)=36. The Check gives 18. The theorem immediately above correctly gives Ω_K=qA.

   Indeed, every nonzero x in 𝔽₄ has x³=1. Each of the four x-values has two y-solutions, giving eight affine points and the point at infinity. Rank-one canonical Higgs moduli are Picᵈ(E)×𝔸¹, with 36 rational points. This also supplies an actual curve for the counterexample, rather than merely a formal Weil tuple.

   **Exact repair:** Replace “Ω=2A” by “Ω=qA for q=2^f”. Retain an explicit 𝔽₂ example and add the extension-field control E/𝔽₄: A=9, Ω=36 and #H=36. For the same equation over 𝔽₂, A=3, Ω=6 and #H=6.

   **Retest:** At q=2, 2·3=6; at q=4, 4·9=36. For the latter stable stack mass, 36/(4−1)=12 and multiplication by q−1 recovers Ω=36. Source: MS14 line 544 through MS14 line 588. The general theorem at README line 1385 requires no change.

Two P1 findings, both false numerical Checks. Their surrounding theorems survive the counterexamples. All twelve findings from the preceding review are repaired. This review changes no package input.

## Verified sound

### Previous findings, checked before the new pass

The repair report marks F01–F12 applied; none was marked not actionable. Each quoted passage below is from the revised package. All changed or added mathematics was tested again, including its consumers. The two new findings are not re-raised findings.

| Previous finding | Repaired passage and location | Independent check | Status |
| --- | --- | --- | --- |
| F01 | README:836, “z_1≫⋯≫z_s and w≪1”; README:851, “coefficients V₁ in degrees d≥0” | At degrees −1,0,1 the positive series gives 0,V₁,V₁; the negative series gives V₁,0,0. Rechecked §§5.5–6.3. | Repaired |
| F02 | README:97, “What SchemeAndStackFoundations must provide (gap:coherent-ext-serre-duality)” and the other seven contracts | The top-level plan has exactly eight named supplier gaps, with matching README slugs and needs sentences. The eleven retired legacy records are owned targets or duplicate contracts. | Repaired |
| F03 | README:1457, “For the specified complex curve, spread the curve” | The fixed fibre and finite-field stalk lie in one dense lisse open. For an elliptic curve the compact dimensions in degrees 2,3,4 are 1,2,1; unrelated point/two-point fibres give 1/2 and are excluded. | Repaired |
| F04 | Suggested.lean:93, “theorem absIndecCount_eq_of_degree” | Native count, three real definitions, finite field, properness, relative dimension one and geometric connectedness are all in the elaborated signature. | Repaired |
| F05 | README:1615, “A_{g,p,α}∈K_g”; README:1688, “the localized A of §11.2 belongs to R_g” | The first is the theorem; marked integrality is explicitly a conjecture. No marks gives ordinary localized universality; ordinary integrality comes from §10.4. | Repaired |
| F06 | README:111, “Identify the locally free locus” | ET §3.7(c) already handles arbitrary V′; the remaining gap asks only for the all-characteristic carrier comparison. Kernel bound in §8.1 gives −16+24=8>3. | Repaired |
| F07 | README:155, “choose an auxiliary ℓ≥5 different from the characteristic” | ArithmeticStatisticsPartVIII §5.17 supplies the odd-degree family and integral monodromy in this range. The genus-one ℓ=3 index-27 exception is respected. | Repaired |
| F08 | README:311, “matrix-and-idempotent argument”; README:643, “§4.4”; README:788, “p.13”; README:1361, “pp.340–349” | Projectivization is an owned argument; the three corrected source locators contain the claimed material. | Repaired |
| F09 | README:381, “For every algebraic group A over k̄”; README:1298, “in every characteristic” | Springer permits disconnected reduced bands. H¹(C₂)=C₂ but H²(C₂) is neutral over a finite field. The elliptic 𝔽₂ chart has p=2≤C=14 and is still stable. | Repaired |
| F10 | README:361, “QSeriesPartitionsAndMockModularForms §2.4” | Fine–Herstein uses Euler/Heine summation. Macdonald dependencies now occur in the specific contract and Layer 10, not as prerequisites for Layers 1–8. | Repaired |
| F11 | README:69, “Layer 2 supplies Krull–Schmidt theory”; README:195, “the character restriction map”; README:257, field-extension HN consequence | Quiver layer, unnamed CG map and GS 0.* numbering resolve. Coherent HN extension compatibility is proved here using uniqueness/descent, rather than attributed to GS §0.5. | Repaired |
| F12 | README:1547, “H_{g,r}(z=1;q,α)”; README:1609, “With no marked points” | One-box H(z)=3(z+1) at q=2,a=−1 gives H(1)=6. The nonexistent named consumer is replaced by a descriptive trace application at README:1728. | Repaired |

### Scope, shape and principles

Read all 1,754 README lines, the 101-line Lean file, metadata and all thirteen source records; inspected the plan's gap records and the board package index. There are 80 numbered targets in twelve layers. The table below covers each target, with extra rows for conventions, definitions and compound statements. For unchanged material, the earlier computed table was used as a cross-check; its nonnumeric §5.7 row was replaced by explicit values here. Checks added by repairs were recomputed independently.

The roadmap retains every finite field and every characteristic. The bound p>C belongs only to the geometric deformation proof; the Hall proof supplies the unrestricted coprime count. Genus zero, rank zero, torsion and empty partitions have separate mathematical interpretations. It does not re-plan an existing roadmap: generic curve foundations, masses, ordinary Higgs HN theory, monodromy and coefficient calculus are imported; the retained targets concern curve counting or explicitly stated adaptations.

The README has the required summary, scope, conventions, supplier contracts, build guide, twelve layers with examples/dependencies, consumers and references. Definition blocks have their API and discriminating Checks; the new three native definitions each have separate examples, nonexamples and invariance tests in §0.2. The two false Checks are the exceptions recorded above. The prose and proofs contain no computational algorithm, copied source passage, process narrative, forbidden import, `set_option`, sorry'd data or invented Lean placeholder. The five conjectures in §11.6 are not premises of preceding theorems. Main-branch shape comparisons used QuiverRepresentations, AlgebraicVectorBundles and SchemeAndStackFoundations.

### Computed adversarial pass

Here “pass” means that the listed computations agree with the stated target, not that finite examples prove it. Formal reciprocal tuples are labelled as such and are not asserted to be curve Weil tuples. The table records positive and negative models, relevant boundary values, signs, both directions of comparisons, and incompatible inputs. Fields exclude the zero ring and inseparable algebraic extensions of finite fields; curve hypotheses exclude singular/nonreduced thickenings. No DVR-only or topological-group statement is being silently substituted. Empty indices and the natural subtraction in the Lean matrix exponent were evaluated explicitly.

| Statement | Instances tried | Computed values on each side / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: denominators | q=2,3; m=1,2; q=1 | q^m−1=1,3 and 2,8; at q=1 all are 0 | Pass: q=1 excluded from K_g specialization | None |
| Conventions: Euler order | O,O(1) on P¹ | χ(O,O(1))=2=dim Hom; reversed χ=0 | Pass; quotient/subobject order matters | None |
| Conventions: Frobenius and extension | E:y²+y=x³ over 𝔽₄ and 𝔽₆₄ | 1+4−(−2−2)=9; 1+64−(−8−8)=81 | Pass | None |
| Conventions: Adams moves coefficients | Formal q=2, α=(−1,−2) | P(1)=6, ψ₂P(1)=0; ψ₂(1/(q−1))=1/3, not 1 | Pass | None |
| Conventions: affine shift/dimensions | r=1,g=2 | D=2; coarse/stack/cone dimensions 4/3/2; compact shift 4, twist −2 | Pass | None |
| Conventions: allowed base change | Identity field map; k[ε]/ε² | Identity preserves degree 1; ε≠0, ε²=0 excludes a field structure | Pass | None |
| §0.1 coefficient ring | g=0; q=6,a=2; pair flip | R₀=ℚ[q±1]; a+q/a=5 before and after flip; a itself changes 2→3 | Pass | None |
| §0.1 plethystic normalization | T,−T | Exp(T) coefficients 1,1,1; Exp(−T) coefficients 1,−1,0; ordinary exp(T) has T² coefficient 1/2 | Pass | None |
| §0.2 bundleDegree | O(1),O(−1),O(1)⊕O(−1) on P¹ | χ−rχ(O)=2−1=1, 0−1=−1, 2−2=0 | Pass | None |
| §0.2 zero and higher genus degree | 0 and O² on genus two | 0−0=0; −2−2(−1)=0 | Pass | None |
| §0.2 isomorphism/base-change API | Two presentations of O(1), extended field | H⁰/H¹ dimensions (2,0) in each; degree 1 in each | Pass | None |
| §0.2 absolute predicate | L, L⊕L, zero | Indecomposable true,false,false; rank-one projector on L² is neither 0 nor 1 | Pass | None |
| §0.2 rational versus absolute | Degree-two closed-point simple | One rational simple, two geometric summands; absolute predicate false | Pass | None |
| §0.2 count versus mass | Line over 𝔽₃; rank zero | Class contribution 1 versus mass 1/2; rank-zero count 0 versus zero-object mass 1 | Pass | None |
| §0.2 HN extension compatibility | O(2)⊕O(−1), zero, length-two torsion | Slopes 2,−1 unchanged; zero filtration empty; torsion slope +∞ before/after splitting | Pass | None |
| §0.3 residues | 1/(1−t),1/(1−t)² at t=1 | Normalized simple residue 1, differential residue −1; double-pole normalized simple coefficient 0, differential residue −1 | Pass | None |
| §1.1 additive Hom transfer | M=L² over 𝔽₂; M=0 | End(L²)=M₂(𝔽₂), dimension 4/cardinality 16; zero corner/projective category has only zero | Pass | None |
| §1.2 Krull–Schmidt | 0,L,L² | Summand counts 0,1,2; End(L)=k local, M₂(k) nonlocal | Pass | None |
| §1.3 radical matrix quotient | N=k[t]/t², M=N² | Radical dimension 4; semisimple quotient M₂(k) dimension 4; erroneous two-copy radical has dimension 2 | Pass | None |
| §1.4 nilpotent enumeration | n=0,1,2 over 𝔽₂,𝔽₃ | Counts 1,1,4 and 1,1,9 = Q^(n(n−1)); empty-matrix exponent 0 | Pass; directly enumerated n=2 | None |
| §1.5 nilpotent/automorphism ratio | 0,L/𝔽₃,L²/𝔽₂,N/𝔽₂ | Ratios 1,1/2,4/6=2/3,2/2=1; same Euler factors | Pass | None |
| §1.6 band neutrality | G_m/𝔽₃; constant C₂ | H¹(G_m) has one class, H¹(C₂) two; both H² neutral; Lang z↦z² gives only 1 on 𝔽₃× but is geometrically onto | Pass | None |
| §1.7 Galois orbit inversion | One orbit of length two | Absolute orbit contributions over degrees 1,2 are 0,2; descent class is 2α | Pass | None |
| §1.8 coprime absolute criterion | (r,d)=(2,1), End=k[t]/t² | Residue extension degree divides 2 and 1, hence 1; End dimension can still be 2 | Pass; residue k does not mean End=k | None |
| §1.9 cutoff bound | g=2,r=2,d=3; line degrees −1,0,1 | Threshold binom(2,2)·2=2<3; line cutoff counts 0,1,1 | Pass | None |
| §1.10 twist/dual/normalizations | P¹, ranks 0,1,2; degrees ±1 | Counts 0,1,0; twist and dual both send line count 1 to 1 | Pass | None |
| §2.1 mass Fubini | BC₂→BS₃; identity BS₃; empty | Homotopy fibre size 3, so 3/6=1/2; identity gives 1/6; empty gives 0 | Pass; nonabelian test | None |
| §2.2 nilpotent groupoid | Line; k[t]/t² | Only zero on line, mass 1/(q−1); t²=0 with t≠0; identity is excluded | Pass | None |
| §2.3 exponential | One absolute line type, q=2, multiplicities 0,1,2 | Euler mass coefficients 1,1,2/3; exp(T+T²/6+…) has 1/2+1/6=2/3 | Pass | None |
| §2.4 Jordan class | J₂ on k², length-two torsion | r₁=0,r₂=1 gives weighted rank 2, unweighted 1; torsion rank 0/degree 2 | Pass | None |
| §2.5 flag groupoid | Lines in 𝔽₂²; zero step | Three lines; mass 3/6=1/2; inserting a zero step multiplies by 1 | Pass | None |
| §2.6 grading functor | J₂ and θ=0 | J₂ gives H₁=0,H₂=k; θ=0 gives H₁=F; no positive subobject cutoff is imposed in place of quotient cutoff | Pass | None |
| §2.7 Jordan fibre | Only α₂=O, q=2, g=0,1,2 | Fibre factors q^(g−1)=1/2,1,2; flag computation has the same Euler exponent | Pass | None |
| §3.1 Hall product/coprod | Two copies O on P¹/𝔽₂ | Product coefficient 3v; coproduct coefficient v/2, since Hom cardinality 2; zero object is unit | Pass | None |
| §3.2 Green pairing | Same two copies | Pairing product with [O²] gives 3v/6=v/2; tensor pairing gives v/2 | Pass | None |
| §3.3 characteristic functions | Torsion; bundle rank two/torsion degree one | Torsion indicator 1, bundle indicator 0; twist v⁻², not v⁻¹ | Pass | None |
| §3.4 filtered masses | O⊂O² over 𝔽₂ | Flag mass 3/6=1/2; untwisted pairing v⁻¹·v/2=1/2 | Pass | None |
| §4.1 Eisenstein definitions | Rank zero and one on P¹/𝔽₂ | Rank-zero bundle constant 1; coherent torsion coefficient 3; degree −1 line term exists in bilateral series | Pass | None |
| §4.2 Hecke commutation | q=2, r=0,1,2 | Empty factor 1; rank-one argument z/(√2w); rank-two arguments z/(2w),z/w | Pass | None |
| §4.3 coproduct | Rank zero; split 1+1, g=0 | ΔE₀=E₀⊗E₀; 1+1 factor q⁻¹ᐟ² and shifts q^±1/2 | Pass | None |
| §4.4 residue presentation | r=1,2 | Rank-one prefactor 1; rank-two prefactor V₂/V₁² at g=1; normalized pole residue 1, differential convention −1 | Pass | None |
| §4.5 HN relations | O(1)⊕O(−1) on P¹ | Three-dimensional Hom; q⁻³ᐟ²v³=1. Reversing quotient order changes the Euler exponent | Pass | None |
| §4.6 spherical support | P¹ rank two, degree zero | Each O(m)⊕O(−m) gives a class; m≥0 gives infinitely many, while each fixed HN stratum has one | Pass; completion required | None |
| §4.7 HN membership | Same fixed HN types | Each stratum has one class and its indicator is 1 there/0 elsewhere; unbounded union is infinite | Pass | None |
| §4.8 generic form | Line mass at q=2,3; rank-two pairing on P¹ | V₁=P(1),P(1)/2; square-generator norm (3v)²/6=3q/2, an allowed scalar | Pass | None |
| §4.9 universal counts/the Check | P¹/𝔽₂, class (1,1) | Raw nil mass 4; displayed coefficient 1; torsion quotient gives 1 | Fail in Check | R01 |
| §5.1 regions | s=1; degrees −1,0,1 | ≥0: 0,V₁,V₁; <0: V₁,0,0. Expanding positive function at infinity gives negative coefficients | Pass | None |
| §5.2 torsion separation | s=1,r=1,q=2,P¹ | zw coefficient #X/2=3/2; missing total-rank shift would give 3 | Pass | None |
| §5.3 bilateral pairing | One slot; ranks (1,2) | One-slot degree coefficient V_r; two degree variables have shifts q⁻¹,q¹ᐟ² | Pass | None |
| §5.4 expansion separation | 1/(1−z) at zero/infinity | Both become 1 after multiplying by 1−z; expansions themselves have coefficients (1,1,…) and negative-degree −1 | Pass | None |
| §5.5 shuffle signs | s=1,2 | V₁/(1−zw) and −V₁/(1−zw); negative expansion coefficients +V₁; s=2 sign +1 | Pass | None |
| §5.6 block residues | (1),(2),(1,1), g=2 | First prefactor 1; a(2)=−1/2; b(2)=0; b(1,1)=1/2 | Pass | None |
| §5.7 weighted sum | r₂=1; r₁=r₂=1 | Sizes 2,3; e=(g−1),5(g−1)/2; x₂=z² in first case, x₁=zq¹ᐟ²,x₂=z²q⁻¹ᐟ² in second | Pass; replaces earlier nonnumeric row | None |
| §5.7 torsion tails | Rank zero, degree one, P¹/𝔽₂ | Ξ_empty has constant 1 and z coefficient 3, not constant series 1 | Pass | None |
| §5.8 positive arms | λ=(1),(2),(1,1),(2,1),(3),(2,2) | Products 1; ζ(q⁻¹z); 1; ζ(q⁻²z); ζ(q⁻¹z)ζ(q⁻¹z²); ζ(q⁻¹z)ζ(q⁻²z) | Pass | None |
| §5.9 kernels | Empty, one box, partitions (2),(1,1) | Empty 1; J₁=q^(1−g)P/(q−1), H₁=1/(1−z); residue counts 0,1 for the two size-two partitions | Pass | None |
| §5.10 partition product | Empty/one box on P¹/𝔽₂ | Empty is N₀=1+3z+…; one-box factor 1/(1−z), full coefficient 1+4z+… | Pass; exposes R01 | None |
| §6.1 generating identity | Rank zero/one after torsion cancellation | T⁰=1; [T]=P/((q−1)(1−z)); at q=2,P=1 degree-one coefficient 1 | Pass | None |
| §6.2 periodic residues | (2+3z)/(1−z²), roots 1,−1 | Differential residues −5/2,+1/2; extraction gives even 2, odd 3. In characteristic two roots collide, excluded by rational coefficients | Pass | None |
| §6.3 count residue | Rank one | Res P dz/(z(1−z))=−P; negative extraction gives P | Pass | None |
| §6.4 rank-two formula | q=2, formal tuple (−1,−2) repeated g=0,1,2 | P=1,6,36; bracket=0,1,36; resulting polynomial values 0,6,1296 | Pass; formal evaluations | None |
| §6.5 origin extension | Rank one; paired cone origin | P(0)=1; relation α₁α₂=q gives q=0; 1/q undefined there, so localization alone has no origin map | Pass | None |
| §6.6 constant partition formula | g=1,2,3; r=1,2,3,4 | Constants respectively (1,1,1,1), (1,2,6,22), (1,3,15,95); rank-one residue −1, extraction +1 | Pass | None |
| §7.1 geometric/relative stability | Line, L²; O(−1)→O²→O(1) | Line stable; L² semistable but not stable; degrees −1,0,1 show positive quotient closure but not arbitrary subobject closure | Pass | None |
| §7.1 coherent derived comparison | Length-one torsion, θ=0 | Derived Higgs Ext dimensions 1,2,1; underived two-term sheaf Hom gives 1,1,0 | Pass; torsion terms retained | None |
| §7.1 differential sign | Elliptic curve, scalar fields η,0 | Differential on identity is +η in stated order; reversing source/target gives −η | Pass | None |
| §7.2 Serre-dual criterion | Rank-two invariant line | Lower-left Higgs entry 0 preserves the line; entry 1 does not. Corresponding dual functional vanishes/nonvanishes | Pass, both directions | None |
| §7.3 canonical moduli | Rank one, g=1,2 | Dimensions coarse 2,4; stack 1,3; cone 1,2. Trace/determinant scale with weights 1,2 | Pass | None |
| §7.3 spreading | Fixed elliptic Pic×𝔸¹ | Compact dimensions 1,2,1 in degrees 2,3,4 at generic and finite-field stalk | Pass | None |
| §7.4 framed chart | g=2,r=2,d=1; basepoint example | l₁=9; framed sections can have dimensions 1+8=9 although the first evaluation misses a fibre; combined quotient can still be onto | Pass; both evaluations required | None |
| §7.5 cotangent zero level | Rank-one zero Higgs field | End dimension 1; Ext¹ dimension g; zero-moment fibre k^g and moment value 0 | Pass | None |
| §7.6 doubled moment map | Scalar arrows x=y=1, p=2,3 | Moment (1,−1); in p=2 this is (1,1), still trace-sum 0; y=0 gives (0,0) | Pass | None |
| §8.1 numerical framing | g=2,r=2,d=1 | B=−3/2,d₁=5,l₁=9,d₂=24,l₂=47,C=423; gcd(9,47)=1 | Pass | None |
| §8.1 kernel/character boundary | Same framing; zero/full vectors | Kernel rank 7, degree −46; minimum ≥−16 and −16+24=8>3; zero/full determinants both 0, excluded | Pass | None |
| §8.2 slope sign | Same framing; section vectors (5,24),(4,23) | δ=9·24−47·5=−19; δ=9·23−47·4=19; excessive slope has negative δ | Pass | None |
| §8.3 moment iff and mass | End dimension h, χ(E,E)=χ | Contribution (q−1)q^(h−χ)/((q−1)q^(h−1))=q^(1−χ); a nontrivial projector has λ=−δ≠0 for p>C | Pass, both directions | None |
| §8.4 characteristic-two inclusion | Elliptic 𝔽₂, r=1,d=0 | (l₁,l₂,C)=(2,7,14); one-dimensional first subspace gives weight ≤7−10=−3; (0,U₂) gives −2dim U₂ | Pass with p≤C | None |
| §8.4 effective moment target | Two arrows, dims (1,2), 𝔽₃ | Moment (2,−I₂); ambient effective derivative rank 4; central-line restriction rank 1 | Pass; prevents source target error | None |
| §8.5 tight comparison | Rank-two slope-one/zero lines | δ=19(1−2)=−19 and 19(1−0)=19 | Pass; kernel generation is part of route | None |
| §8.6 family/trivialization | Rank one; t≠0 | Each fibre has q^gP points; scaling t followed by t⁻¹ gives 1; relative dimension 2g=2D | Pass | None |
| §8.7 BB count | Y=𝔸¹×𝔸ᵃ over 𝔽_Q | Q^(a+1)=Q·Q^a=Q^a+(Q−1)Q^a; positive ranks a+1 and a | Pass | None |
| §8.8 large-characteristic count | Rank one g=2; P¹ ranks 1,2 | q²P=q^D A; genus-zero values 1=1 and 0=0 | Pass | None |
| §8.9 HN integration | Rank one elliptic; separated usual slopes | At q=4,A=9: I=36/3=12, Ω=(q−1)I=36. Strict-slope Hom/Ext²=0 gives multiplicative factor | Pass | None |
| §8.10 all-characteristic theorem/Check | E/𝔽₂ and E/𝔽₄ | Theorem gives 2·3=6 and 4·9=36; Check gives 2·9=18 in the second case | Fail in Check | R02 |
| §9.1 purity/shifts | Picᵈ×𝔸², g=2; 𝔸¹ | H_c^n=H^(n−4)(Pic)(−2); affine line has only degree 2/twist −1 | Pass | None |
| §9.2 positivity/trace | r=1,g=1; E/𝔽₄ | A(−α)=1+α₁+α₂+q, diagonal 1+2t+t²; compact eigenvalues 4,−8,−8,16 | Pass; q^D retained | None |
| §9.3 complex polynomial | r=1,g=1,2 | Signed t²−2t³+t⁴ and t⁴−4t⁵+6t⁶−4t⁷+t⁸; unsigned changes odd signs; top degrees 4,8 | Pass | None |
| §9.3 lisse requirement | Point versus two points | H_c⁰ ranks 1 versus 2; not one lisse rank stratum | Pass | None |
| §9.4 cone reciprocal/components | E/𝔽₄; two exchanged components | 4(1+1/2)²=9=#Pic; origin/top dimension 1; Tate-normalized component permutation representation dimension 2, trace F=0, trace F²=2 | Pass | None |
| §10.1 Mellit kernel | One box, q=2,a=−1 | H₁(z)=3(z+1), H₁(1)=6=P(1); Ω constant 1, logarithm constant 0 | Pass; source limitation below | None |
| §10.2 regular deformation | Empty partition and identity sequence | Empty product 1; f_n=1 gives insertion factor 1 and undeformed Ω; one-box factor agrees with 3(z+1) | Pass on tests | None |
| §10.3 Laurent conclusion/control | Same one box; 1/(1+z) | Coefficients 3,3, value 6; control regular value 1/2 at 1 but pole at −1 | Pass; local regularity alone insufficient | None |
| §10.4 degree independence | P¹ r=0,1,2; elliptic r>0 | Counts 0,1,0 in every degree on P¹; elliptic count 9 in every degree over 𝔽₄. Period-two control would give 2,3 | Pass on tests | None |
| §10.5 positivity all degrees | g=2,r=2,d=0,1 | Origin count 2 in both; replacement degree 1 has gcd(2,1)=1; rank-one diagonal coefficients 1,2,1 | Pass as consequence of §10.4 | None |
| §11.1 parabolic carrier | No marks, one-step flag, line | Unique line flag; counts all reduce to P(1), not multiplied by a frame cardinality | Pass | None |
| §11.2 parabolic Euler/universality | Equal-degree lines, two-step mark on P¹ | Euler values 0 and 1 in opposite flag order, matching Hom dimensions; K_g denominator 1/(q−1) gives 1 at q=2 and is undefined at 1 | Pass | None |
| §11.3 exact HN/cut counts | Line degree d | HN type (1,d): count P; lower cut d: P; cut d+1: 0 | Pass | None |
| §11.4 universal cut functions | Lower cutoff 0, line degrees −1,0; dual upper cutoff | Lower counts 0,P; upper counts at degrees 1,0 are 0,P | Pass | None |
| §11.5 constructible Hall | Primitive c; zero object; mixed coproduct | Δc=c⊗1+1⊗c; evaluation at (0,0) gives c(0)=2c(0), hence 0; mixed commutator terms cancel 1−1=0 | Pass; curve adaptation is owned | None |
| §11.6(i) fixed-HN conjecture | Rank-one type (1,d) | Proposed universal value P equals actual P | Consistent test, not a proof | None |
| §11.6(ii) cutoff positivity conjecture | Rank one, cut i versus i+1 | Difference P if d=i, otherwise 0; P(−α) has nonnegative coefficients | Consistent test | None |
| §11.6(iii) Lie multiplicity conjecture | Coprime rank one | Proposed multiplicity 1 equals A(0)=1 | Consistent test | None |
| §11.6(iv) Hilbert identity conjecture | First positive class | Exp(T) coefficient T=1, agreeing with one primitive; zero coefficient 1 | Consistent test | None |
| §11.6(v) marked integrality conjecture | One-step mark; line flags | Both counts P∈R_g; denominator q⁻¹ would have no origin value | Consistent test | None |

### Source sample and proof-route checks

Used the legal cached extractions, with their recorded versions. No source was fetched or manifest entry changed. Fourteen seeded targets were read at their locators; the fifteenth, §10.5's M20 input, remains settled uncertified. There are no other author-flagged unread citations beyond M20, FH58 and HES81. The distinction between checking a source and checking a claimed adaptation is maintained below.

| Seeded target | Locator actually read | Hypotheses and outcome |
| --- | --- | --- |
| 2.2 nilpotent groupoids | S16 §2.2, printed p.308, S16 line 575–597 | Nilpotence is eventual zero, with coherent nonnegative cutoff; finite-class claim retains boundedness. Supported. |
| 2.3 exponential | S16 Proposition 2.2, pp.308–310, S16 line 600–645 | Extension-field coefficients and q^l−1 denominator retained. Supported. |
| 3.2 Green pairing | S16 §4.1, pp.315–316, S16 line 974–1000; HN10 §§1.2–1.3, pp.2–3, HN10 line 74–105 | Extended algebra/completed coproduct retained. HN10's v²=q⁻¹ translates to the package's inverse v convention; Hom factors match. |
| 4.4 residue presentation | S16 Corollary 4.3, p.318, S16 line 1114–1117; residue convention S16 line 242 onward | Ordered normalized residues and rank prefactors match, including rank one. |
| 4.5 HN relations | S16 §4.4, p.319, S16 line 1137–1164 | Negative quotient factor remains on the left; Euler exponent agrees. |
| 4.9 universal counts | S16 §§4.5–4.6, pp.320–321, S16 line 1192–1258 | Coherent C,N and truncated A use the right carrier; density is supplied by a declared contract. Theorem supported; R01 concerns its Check. |
| 5.10 Jordan sum | S16 (5.16)–(5.20), pp.332–334, S16 line 2034–2263 | Weighted classes, torsion tails, JH product and subsequent torsion cancellation agree. Source exponent typo is not copied. |
| 6.2 residue extraction | S16 §5.8, (5.22), pp.334–335, S16 line 2280–2305 | Positive rank, eventual period r, rational coefficients and simple root-of-unity poles. Minus sign is correct. |
| 8.6 central deformation | S16 Lemmas 6.4–6.5, Proposition 6.6 and §6.9, pp.345–349, S16 line 2744–2785 and S16 line 2888–2954 | Coprime dimensions, characteristic bound and nonzero scaling retained; central restriction precedes quotient, repairing the source's moment-target problem. |
| 8.9 HN integration | MS14 Theorem 1.2, p.2, MS14 line 75–104; §3.1, pp.6–7, MS14 line 399–466 | Positive exact category, decreasing relative slopes and high-degree comparison retained. Canonical normalization is q^((1−g)r²). Zero slope is covered by the same displayed HN factorization. |
| 8.10 unrestricted count | MS14 Theorem 4.3, Corollaries 4.4–4.5, pp.8–9, MS14 line 485–588 | Ω_K=qA without a p>C condition; coprime gerbe conversion gives q^D A. Supported theorem; R02 concerns its Check. |
| 9.2 positivity | S16 Corollary 1.5, pp.301–302, S16 line 197–203; §6.10, pp.349–350, S16 line 2969–3019 | Coprime classes, sign substitution and total degree 2D match. Package restores q^D in Higgs eigenvalues. |
| 10.5 every degree | M20 Theorems 1.1/5.2, pp.302–303/319–321, locator-only; S16 Corollary 1.5 as above | M20 text not read. Conditional deduction is sound: degree independence transports positivity/constants from d=1, coprime to every positive r. |
| 11.3 HN/cut counts | S16 §8.1, pp.353–354, S16 line 3138–3175 | Exact HN type and lower-slope cutoff are different counts; correct endpoint convention. |
| 11.4 cut universality | S16 §8.1, p.353, S16 line 3141–3144 | Localized K_g conclusion, with dual upper cutoff and uniqueness through density, matches. |

Also read the repaired Springer generality at SPR66 line 6739–6749, Theorem 3.5, p.179; S16 line 1493–1558 for the small/large-w correction; SV12 line 680–694, §1.11, p.13, for the torus form versus the additional invariant-descent target; M18 line 1358–1375 and M18 line 1451–1453 for integral HLV kernels; WII line 2832–2855 for degree-fibre normalization; ACK07 line 1088–1116 for tight submodules and condition (C:4); LIN15 line 232–348 and LIN15 line 517–529 for parabolic carriers/Euler form, LIN15 line 994 and LIN15 line 1690 for Theorems 3.1/3.16, and LIN15 line 1794–1800 (Corollary 3.18, p.28) directly supporting localized parabolic universality; BTL12 line 766–880 for constructible Hall multiplication and the algebraic coproduct restriction. ACK07's two-line variant and BTL12's coherent-sheaf extension are explicitly new targets, not assertions that those sources prove them verbatim.

### Pinned library and Lean audit

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are actual declarations/definitions opened at those pins, not names inferred from newer documentation.

| File and line at pin | Declaration / content relevant to the review |
| --- | --- |
| Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120 | Matrix.card_GL_field; finite field, GL cardinality, empty product 1 |
| Mathlib/RingTheory/Artinian/Ring.lean:54 | IsArtinianRing.isNilpotent_jacobson_bot; associative Artinian ring |
| Mathlib/RingTheory/Artinian/Module.lean:641 | IsArtinianRing.isSemisimpleRing_iff_jacobson |
| Mathlib/RingTheory/LittleWedderburn.lean:176 | Finite.isDomain_to_isField; finite domain, not arbitrary finite ring |
| Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096 | Indecomposable includes nonzero and tests all binary biproduct decompositions |
| Mathlib/CategoryTheory/Skeletal.lean:74 | Skeleton is the quotient by object isomorphism |
| Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:39 | Object plus property, with the full inherited morphisms |
| Mathlib/Combinatorics/Young/YoungDiagram.lean:66,186 | YoungDiagram is finite/lower-closed; transpose swaps coordinates |
| Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40 | GeometricallyConnected uses geometric ConnectedSpace, including nonemptiness |
| Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127 | SmoothOfRelativeDimension supplies the stated smooth relative dimension |
| Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41 | IsProper includes separatedness, universal closedness and local finite type |
| TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:69,104 | FixedRank and pullback; no hidden properness or smoothness |
| TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean:105 | eulerCharBelow is an alternating truncated finrank sum, without finiteness/vanishing assumptions |
| TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:131 | InvertibleSheaf.trivial supplies O_X |
| TauCeti/RingTheory/KrullSchmidt/DirectSum.lean:154 | exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end; finite external decompositions, no ambient finite-length hypothesis |
| TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean:266 | isLocalRing_end_of_isIndecomposable requires IsFiniteLength over the stated ring |
| TauCeti/Combinatorics/Young/HookLength/Basic.lean:136,140 | armLength/legLength use natural subtraction; only actual cells enter products |

Elaboration was run from the content checkout with `lake env lean <absolute package Suggested.lean path>` as instructed. Exit 0; the only diagnostics were the two `declaration uses sorry` warnings, at lines 83 and 93. All three imported Tau Ceti object files were available; no build was needed. No Lean process remains running.

On a scratch copy, both sorried theorems were probed separately with `simp`, `rfl` and `infer_instance` using `fail_if_success solve | …`. The copy elaborated, confirming none closed the full theorem. Object searches at the pins found no exact nilpotent-matrix cardinality or absolute-bundle degree-independence theorem to cite in one step. These are not definition restatements or boundary cases; n=0 and r=0 are only instances of general headlines. No padding deletion is requested.

The same copy appended `#check @name` for all five declarations. The three definitions retain explicit k, Field k, X and X.Over, with r/d where needed. The nilpotent count retains Field and Finite. The degree-independence theorem retains Finite k, IsProper, SmoothOfRelativeDimension 1 and GeometricallyConnected. Compared all five with README §§0.2,1.4,10.4 and the provided signature inventory: no lost binder, no change required. Proper smooth curves over the finite field have the coherent finiteness/vanishing needed to interpret Euler truncation; the unrestricted helper definition itself is not claimed to have those properties on arbitrary schemes.

Headline inventory: nilpotent matrix count; nilpotent-pair exponential/Jordan masses; Green bialgebra and spherical HN membership; universal Hall form/counts; partition residue and origin formulas; canonical Higgs geometry/deformation; unrestricted coprime Higgs count; purity/compact Poincaré polynomial; cone trace/components; Mellit integrality and degree independence; all-degree positivity; parabolic and slope-cut universality; constructible spherical Hall Hopf/Lie structure. The two statable native headlines are present. The module docstring names each remaining headline and the missing carrier: actual coherent HN groupoids, curve Hall completion, compatible Adams/universal specialization, coarse Higgs/Quot/GIT objects, Frobenius cohomology, or constructible Euler pushforward. It now correctly distinguishes the statable absolute count from the unavailable Higgs carrier. No bounded substitute, free predicate or sorry'd object is used.

### Ownership and supplier resolution

Used the roadmap service's main/new-roadmap-head distinction, not the content worktree's unrelated branch. Main resolved to `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`; the open-head inventory is dated 2026-10-25. Object searches covered nilpotent cardinality, absolute indecomposability, coherent/Higgs HN theory, Hall algebras, strong generation, hyperelliptic monodromy, plethystic operations and compact constructibility. Searches included main, the indexed open heads and the board packages after reading the supplied package index. Broad matches to JacobianChallenge were narrowed before drawing ownership conclusions. Existing-roadmap progress heads were not used as suppliers.

The table resolves all supplier families cited by the package. Paths are roadmap-relative; numeric section identifiers are the cited owners' actual identifiers. Line numbers below refer to their README, with the service's display header excluded.

| Owner and resolved location | Supplied object and boundary checked |
| --- | --- |
| TauCetiRoadmap/AlgebraicVectorBundles/README.md, L0A–L0C, L1–L2B | Native sheaf, tensor/dual/determinant, geometric comparison and base change; no second bundle carrier here |
| TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md, Layers 1–2 | Quiver/module equivalence and Krull–Schmidt; general category continuation is ArtinAlgebras Layer 0 |
| TauCetiRoadmap/ClassicalGroupsPartII/README.md:408,440,1116,1172 | CG.0.4–0.5 and CG.2.4–2.6: reciprocal torus/action and full character ring; CG.3 positive subring is not substituted |
| TauCetiRoadmap/FunctionFieldArithmetic/README.md:478,509,1702 | §§0.2–0.3 and 5.1–5.4: degree-one divisor, Picard points and zeta numerator; no rational-point hypothesis added |
| TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:261,292,455 | §§0.1,0.5–0.6,0.13: fixed central class, coherent HN/boundedness and masses; q^(−rl) torsion splitting |
| TauCetiRoadmap/WeilConjectures/README.md:336 and §2.1 | WC.1 finite groupoid mass and homotopy fibres; actual point groupoid distinguished from abstract BG |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:2071,2745,2843,2951 | §1.1 effective QCoh descent underlies §§1.18–1.21 stack/descent formalism; finite coherent flags descend objectwise with their arrows |
| Same owner:3437,3959,4275,4713 | §§2.6,2.18,2.20,3.3: proper coherent finiteness, derived Hom, duality and RR; arbitrary coherent-U Ext–Hom still a declared extension |
| Same owner:4905,4937,5066,5244,5706 | §§3.6–3.7,4.1,4.5,4.14: Picard torsors/stacks, deformation maps and fixed-source projective Quot; no unqualified arbitrary-kernel obstruction theorem assumed |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:578,7317 | §§1.3,4.19: coherent flags and affine stabilizer quotients; character-linearized reductive GIT is a declared extension |
| TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1239,1269 | §§3.6–3.7: restricted reductive Higgs carrier versus all-characteristic coherent canonical carrier, good lines and arbitrary-V′ kernel generation |
| TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3399,3437 | §§6.22c,6.24: ordinary geometric bundle Higgs HN and two-term Ext complex; its ordered C(B,A) example has dimensions 1,3,0 and mass q² |
| TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201 | RG2.3.7: geometric Lang surjectivity/H¹ for smooth connected groups; not nonabelian H² neutrality |
| TauCetiRoadmap/HabiroNahmSeries/README.md:1068 | §5.1: ordinary multivariate log/exp and finite coefficient substitutions; complete curve Adams structure is an extension |
| TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:292 | §1.1: elementary combined q,t Adams substitutions; compatibility required, not independently replanned |
| TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:303,482 | §§2.4,3.5: Euler/q-binomial identities and partition adapters; the two richer coefficient/symmetric-function contracts remain gaps |
| TauCetiRoadmap/DeligneWeightsAndPurity/README.md:940,962,1030,1044,1061,1240 | §§0.10,0.12,0.16–0.18,1.7: power sums, reciprocity, disjoint weights, curve H¹; no arithmetic semisimplicity assumed |
| Same owner:2618,2678,2873,2885,2895,2907,3677 | §§7.12,7.15,8.8–8.11,10.5: directional weight bounds, purity, degree-fibre equidistribution |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:3163 | §5.11: fibre Frobenius polynomials; universal-family Weil density is the declared continuation |
| TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:858,986,1002 | §5.17: mod-ℓ and integral symplectic monodromy, odd-degree family; use ℓ≥5 for genus one |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:551,818,895 | §§0.4,0.6–0.7: duality/integration/rational realization and component representation; affine-bundle compact shift remains an exact contract |
| TauCetiRoadmap/CohomologicalPointCounting/README.md, “The combined endpoint” | Compatible geometric cohomology/trace formalism; not an identification of unrelated fibres |
| TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/README.md, Layers 6–8; TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md, Layers 7–9; TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md, Layers 11–12 | Localization, constructible compact direct image, rational realization and trace; generic finite-type spread-out has a common lisse open |
| TauCetiRoadmap/ComplexComparisonPartII/README.md:4227,4340, §§C6.3–C6.6 | Compact Artin comparison, normalized integral/rational coefficient systems, finite triangulation and base-change compatibility |
| TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md, AL.3, bundle HN discussion | Existing bundle HN is imported; coherent field-extension consequence in §0.2 is the stated addition |

No object match supplies the two new count headlines, the invariant curve Hall form, or the coherent Euler-characteristic spherical Hall construction. Curve-specific counting is therefore owned here. Generic carriers/comparisons found elsewhere are cited or covered by the eight contracts, rather than declared a second time. The three simple Lean definitions are specializations on pinned objects for the count theorem, not generic degree or sheaf foundations. All five fully qualified names use this package's namespace; no collision with the readable roadmaps was found.

The downstream name TopologicalMirrorSymmetryForHitchinSystems is present in `packages/TopologicalMirrorSymmetryForHitchinSystems/design/README.md` and in the merge order. It consumes counting/purity; it is not used as a supplier. The revised trace-formula application is descriptive. No absence claim was inferred merely from failure of one service lookup.

The citation resolver reported no missing cross-roadmap citation or Lean name. Its non-roadmap warning was resolved by opening the pinned declarations above. Every `*Needs:*` and layer dependency was read; no remaining internal backward cycle, later-roadmap input or unowned proof-route prerequisite was found.

Dependency check output, with `--movable`, unchanged from the authorized run:

```text
moved: CountingBundlesAndHallAlgebrasOfCurves moved in the merge order from #172 to #269, right after its last supplier ClassicalGroupsPartII (HabiroNahmSeries also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 46 roadmaps, 504 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The permitted move is not a finding and the order file was not edited.

### Declared gaps

Compared every top-level `design/plan.json` gap with its README supplier subsection: eight slugs, eight named suppliers, and matching needs sentences. Each is a coherent interface with explicit domain/hypotheses; none asks to reprove a found supplier object. No contract has supplier `none`.

| Slug | Minimal remaining contract |
| --- | --- |
| coherent-ext-serre-duality | Smooth-curve Ext¹(U,V)*–Hom(V,U⊗Ω) for coherent U as well as V; source §3.3's locally-free-U statement is insufficient |
| degree-only-strong-generation | Uniform degree/slopes criterion, including torsion/zero; ordinary Serre generation does not give this degree-only bound |
| fixed-source-good-lines | Only the all-characteristic locally-free-locus identification; kernel generation is already supplied |
| reductive-character-git | Character quotient, invariant-subspace criterion and projectivity over affine quotient; finite-inertia coarse spaces do not provide it |
| complete-adams-series | Complete filtered rational coefficient calculus and extension Möbius identity beyond the existing Laurent q,t specialization |
| macdonald-admissibility | Modified Macdonald/Hall pairing and regular-sequence deformation interface; no duplicate proof in Layer 10 |
| universal-curve-weil-density | Density from the supplied monodromy and equidistribution, retaining q; does not request monodromy again |
| affine-bundle-compact-shift | Frobenius-equivariant degree 2a/twist −a comparison with base change and filtration compatibility |

These remain contracts, not blocking findings. Since this verdict is needs changes, `conditional_gaps` is not put in review.json.

## Not verifiable

- **M20:** The published text remains paywalled and settled `uncertified`. Theorem 1.1, Proposition 3.1, §4, Definition/Lemma 5.1 and Theorem 5.2 were not read. This includes the primary input to sampled §10.5 and the all-degree Lean headline. The one-box formulas, logical degree-independence consequences and the supplied M18 integrality theorem were checked independently; they do not certify M20's full proof.
- **FH58:** Settled `uncertified`; its original proof at Theorem 1, pp.499–503 was unavailable. S16 Corollary 2.5, S16 line 644–645, states the count, and explicit n≤2 enumeration agrees. No new access request was made.
- **HES81:** Settled `uncertified`; Theorem 5.7 could not be checked in the primary text. Its use was read in S16 line 2933–2943 and S16 line 3057–3067; the stated BB hypotheses and affine-product computations were checked. This is not a claim to have certified Hesselink's proof.

No other source-access request is pending. No source was silently replaced by a different version. Open-head ownership was checked through the supplied roadmap service and board index; it was not inferred from unauthenticated web recollection.

## Source issues

The following are source defects encountered while reading the locators. They are not additional package findings where the package already corrects or avoids them. The new LIN15 injective assertion is not consumed by the package: with no marks, Ext¹(E⊗Ω⁻¹,E)≅End(E)* is nonzero for every nonzero coherent E on a smooth proper curve.

- **Misprint** in S16 at Corollary 1.9, p.305, S16 line 445: the source says origin extraction is the positive sum of differential residues; it should be the negative sum, giving 1 in rank one; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i), p.301, S16 line 191: the source says the reciprocal count has prefactor q^(2D); it should be q^D; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), p.301, S16 line 194: the source says the component dimension occurs in cohomological degree D; it should be degree 2D; affects a stated result.
- **Misprint** in S16 at equations (6.11)–(6.12), pp.351–352, S16 line 3074 and S16 line 3080: the source says affine strata shift compact degree by their rank; it should be twice their rank, retaining the displayed Tate twist; affects the proof.
- **Misprint** in S16 at §4.2, p.316, S16 line 1005: the source says the bundle–torsion coefficient has exponent −l/2 in q; it should be −rl/2; affects the proof.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), p.309, S16 line 628: the source says a repeated indecomposable contributes n_i copies of its endomorphism radical; it should be the n_i-by-n_i matrix radical block; affects the proof.
- **Misprint** in S16 at Proposition 5.1, p.322, S16 line 1279: the source says the X rank order is reversed and a Y variable uses r; it should be the same rank order and s-indexed variables as the definitions; affects nothing.
- **Misprint** in S16 at Corollary 1.9 examples, p.306, S16 line 459 and S16 line 470: the source says the displayed rank-three and rank-four expressions are A itself; it should label them A(0), as specified by the paragraph; affects nothing.
- **Misprint** in S16 at §5.6, equation (5.16) setup, p.332, S16 line 2047 and S16 line 2051: the source says the grading exponent is the unweighted sum of Jordan classes; it should be the weighted sum ∑i iα_i, the class of the underlying sheaf; affects the proof.
- **Misprint** in S16 at the paragraph preceding equation (5.21), p.334, S16 line 2265: the source says the universal truncated invariant specializes to the untruncated count; it should specialize to the nonnegative-cutoff count; affects a stated result.
- **Error** in S16 at §6.4, p.339, S16 line 2512: the source says two isomorphisms on section spaces force the first evaluation to be surjective; it should require that evaluation to be surjective as an additional open condition; affects the proof.
- **Error** in S16 at Lemma 6.5, p.345, S16 line 2761 and S16 line 2776: the source says the equivariant moment map descends through the quotient and is submersive onto g*; it should use ambient effective-dual submersivity and restrict centrally before quotienting; affects the proof.
- **Gap** in S16 at proof of Lemma 6.1, p.339, S16 line 2499: the source says kernels for arbitrarily dimensional sources have finitely many HN types; it should fix source dimension or use the uniform minimum-slope bound −d−(r+1)d₁; affects the proof.
- **Misprint** in S16 at §6.10 following equation (6.10), p.350, S16 line 3017: the source says Higgs eigenvalues are the bare curve-eigenvalue monomials; it should multiply them by q^D when interpreting coefficients of A; affects the proof.
- **Gap** in S16 at Theorem 7.1, p.353, S16 line 3118 and S16 line 3123: the source says parabolic counts lie in R_g using a parallel localized proof; it should conclude K_g unless denominator cancellation is separately established; affects a stated result.
- **Error** in LIN15 at Lemma 1.1, p.6, LIN15 line 328: the source says the category of parabolic coherent sheaves has enough injectives; it should use an ambient quasicoherent category for injective resolutions; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "02cb60fc46c81a865cfb4ca372d87ccbc33b21e3", "job": "REV-PKG-CountingBundlesAndHallAlgebrasOfCurves~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
