<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6786916281 -->
Review (codex) of c94f611

Verdict: needs_changes

1. **F01** (P1) The supplied locally symmetric transfer is not the Shimura transfer

   **Location:** `packages/HodgeClassesForJacquetLanglands/README.md:656`: “the covering trace at neat level, whose composite with pullback is the degree of the degree formula”. Also the supplier contract at line 228 and its Matsushima use at lines 509 and 523.

   **Claim:** ArithmeticLocallySymmetricSpaces supplies the trace of §0.3 and the cohomological comparison of §0.2 on these Shimura varieties.

   **Witness:** For the package's real-quadratic torus and levels 9→3, ALS trace-pullback is 9; Shimura trace-pullback is 3. See #871, `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2989`; its circle, rather than point, is explicit at line 1279.

   The distinction is structural. ALS.0.4, at line 1309, divides out only the maximal rationally split central torus. ALS.5b.1, at line 4257, correspondingly uses the Lie algebra modulo that split centre. A Shimura domain divides out the real central directions in the stabilizer of its defining homomorphism. For the trivial datum of `Res_{ℚ(√2)/ℚ}𝔾_m`, the former arithmetic quotient has a unit-group circle and the latter is a finite set. Their first cohomology groups have different dimensions. The declared `compact-matsushima` gap removes `FrankeInput` on the ALS space; it does not identify these two spaces or their relative cochain complexes. This is not an objection to that declared gap being unfinished.

   **Exact repair:** Keep the effective-volume degree formula in §0.3. Replace its citation of ALS.3.6 as the trace being used by the geometric transfer of the actual finite étale Shimura level map supplied by ShimuraVarieties §1.3, with its effective degree. Add a precise `gap:shimura-matsushima-comparison`, owned by ArithmeticLocallySymmetricSpaces, in both the README supplier subsection and the plan's top-level gaps: for the compact Shimura data and coefficient representations of §0.2, supply the Betti/de Rham/automorphic comparison relative to `K_h = Stab_{G(ℝ)}(h)`, including its real central directions, with coefficients cancelling their central action, compatible with Hecke action and the effective-degree geometric level transfers. State how this comparison uses the compact spectral decomposition without identifying the ALS quotient with `Sh_K`. Repoint §0.2 and downstream uses to that contract. Do not impose SV5 or restrict the ground field to ℚ.

   **Repair test:** On the torus instance, the corrected Shimura complex has `H⁰ = ℚ`, `H¹ = 0` at level 3; geometric transfer-pullback is 3, and effective normalization gives `3·(1/3)=1`. The ALS circle still correctly has `H¹ = ℚ` and raw transfer-pullback 9. The computed table below gives the unit indices. This does not reopen round 4's rational-measure finding: its repair is correct.

2. **F02** (P2) The local theta cohomology theorem unnecessarily excludes odd weights

   **Location:** `packages/HodgeClassesForJacquetLanglands/README.md:1257`: “For even `k ≥ 2`”; its dependency on §3.4 is at line 1290.

   **Claim:** The standalone archimedean theta/cohomology result is developed only for the parity needed by the subsequent projective coefficient construction.

   **Witness:** At `k=3`, IP23 lines 2001–2035 gives `A_q₁(1,0,0)` with cohomology dimensions `1,2,1`. Supplier #1063 explicitly includes this weight: `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1034`, with the compact odd-weight Check at line 1046.

   This is a general-library scope defect, not a false even-weight formula. The source quantifies over every integer `k≥2`. The compact lift at `k=3` is the six-dimensional standard representation of highest weight `(1,0,0)`; its harmonic coefficient also has degree one. Neither this representation nor the noncompact relative cohomology requires descent through the projective character lattice. The parity condition belongs to that separate descent in §§3.4 and 5.4.

   **Exact repair:** State §3.5 for every integer `k≥2`, explicitly outside the global even-weight convention. Keep the four corrected theta labels. Remove §3.4 as a prerequisite for this local statement; retain MetaplecticAutomorphicForms §3.35 and AutomorphicFormsOnReductiveGroups §§5.2, 5.4. Retain even weights for the later projective applications. Add an odd-weight Check computing `k=3`: lowest K-type `(3,0,0)`, cohomology dimensions `1,2,1`, compact lift dimension 6 and compact coefficient-cohomology dimension 1. Its projective weight would have half-integral coordinates and is correctly excluded from §3.4.

   **Repair test:** The compact dual polynomial remains `(1+t²)²=1+2t²+t⁴`; shifting by `(1,1)` gives the stated three bidegrees at `k=3`, exactly as at `k=2,4`. The revised local theorem includes this instance without changing the integral projective weight lattice.

Two findings: one P1 and one P2. The three findings from round 4 are repaired. The acceptance file elaborates, its signatures retain their hypotheses, and none of its three theorems is padding. The new blocking issue is the identification of the supplier's locally symmetric space and transfer with the Shimura space and transfer. The second finding concerns the generality of the local cohomology theorem.

## Verified sound

### Previous findings checked first

I read the preceding review and repair report, verified their witnesses, then reread the changed passages and searched the rest of the package for the repaired patterns. No preceding finding was marked not actionable.

| Round 4 finding | Repaired passage, in the present README | Verification and status |
| --- | --- | --- |
| F01: theta input labels | Lines 136–138: “`θ(τ)` here is the lift of `τ^∨` there”; lines 1260–1264 place the antiholomorphic input in `A_q₁` and the holomorphic input in `A_q₀`. | **Repaired.** At `k=2`, their `(1,1)` dimensions are respectively 1 and 0; compact holomorphic and antiholomorphic lift dimensions are 1 and 0. Checked conventions, supplier contract, §3.5, its example, §4.3, §§7.1, 7.9 and §8.5. R02 concerns parity, not these labels. |
| F02: newvector prescription for every split component | Lines 322–325: “by the character line `L` when the local component is one-dimensional”; the infinite-dimensional case separately uses translates of a newvector. | **Repaired.** For ramified quadratic `χ₃∘det`, central scalars act by 1 but `diag(−1,1)` acts by −1. Every standard newvector fixed space is zero, while the rational character model has dimension 1. The plan gap and §0.5 Check agree. Wal85 lines 132–147 separates these cases. |
| F03: arbitrary relative Haar measures | Lines 587–590: “fix a rational Haar measure”; lines 610–613 specify the positive rational volume factor and the realization morphism. | **Repaired.** On the one-point torus projection the trace is 1; rational reference volumes give 1, whereas volumes `√2,1` give `√2`. Checked conventions, §0.3, §7.3, §10.3 and the source note. R01 concerns which trace is normalized, not the rationality of its scalar. |

Changed and added clauses were tested beyond those witnesses: compact averages at index two give `(v+v)/2=v`; `1_K*1_K=vol(K)1_K` stays in the rational Hecke algebra for rational volume; rescaling a source measure by `c∈ℚ_{>0}` rescales descent by `c`; a holomorphic input paired with weight `+3` averages to zero, while the antiholomorphic weight `−3` gives one. The unramified quaternionic theta formula is still read in its own source convention, without an additional dualization.

### Principles, shape and coverage

Read all 75 numbered targets, their APIs and Checks, all 75 Needs lines and all 11 layer dependency lists. The README has 11 Examples and 11 Dependencies subsections. I used the main-branch ClassFieldTheory and ComplexKahlerGeometry roadmaps to check the requested form. The organization is mathematical: the exterior construction supplies its block models and local weights; restriction forms feed nonvanishing; cohomological degree and Hodge analysis feed rational descent. It does not announce adoption of a source's chapter plan. The final descent also uses its component construction placed earlier than in the source.

No re-planning of an existing roadmap, forbidden supplier, algorithmic target, copied source passage, process narrative, machine path, HTML anchor, sorry'd data, free proposition placeholder, `lemma`, or `set_option` was identified in the reviewed package. The new source-supported generality defect is R02. The rational-class endpoint is not asserted algebraic or absolutely Hodge. The Galois endpoint retains its Kottwitz hypothesis and one class for every prime; it is not weakened to good primes. Rank-zero cases, the zero form, characteristic two in the algebraic exterior theorem, finite norm obstructions and compact/noncompact local models are distinguished.

For unchanged text I relied on the preceding adversarial table only where it recorded computed values, and rechecked the sampled targets regardless. Previously unsampled tensor, torus, component and projection formulas were recomputed. The table below records the mandatory sample, all headline constructions, the changed passages and both findings; it is not an assertion that testing examples proves the future theorems.

### Seeded source verification

All 15 seeded targets were checked against the legal cached published IP23 text. Its printed pagination is the manifest's pagination, not the differently paginated arXiv version. No author-flagged unverified locator remains in the manifest. The three cited works have three manifest entries, with no duplicate version key. Wal85 and Mil17 were also read for the repaired passages and their hypotheses.

| Target | Locator and extraction evidence read | Result |
| --- | --- | --- |
| 0.5 Quaternionic multiplicity realizations | IP23 §3.2, pp. 18–19, lines 794–831; Wal85 Lemmas I.1, I.2.1–I.2.2, pp. 123–124, lines 132–147, and §II.1, pp. 147–148, lines 836–846 | Multiplicity realization has dimension `2^d`; the finite invariant factor is separate. Trivial central character and exact rational field are retained. The source's degree `2d` slip is not copied. |
| 0.7 Correspondence operator | IP23 Theorem 3.2, p. 20, lines 840–856; Theorem 12.4, p. 98, lines 4526–4529 | Correct source/target, duality, degree and twist. The operator is not an arbitrary map assumed to be invertible. |
| 1.5 Exterior skew-pairing identities | IP23 Lemma 5.4 and Remark 5.5, pp. 29–30, lines 1225–1256 | Hermitian hypotheses and symmetry/conjugation signs agree. Tested a non-diagonal Hermitian form. |
| 2.6 Explicit quaternion tensor model | IP23 Example 5.14, pp. 36–37, lines 1480–1538 | Mixed basis, its four images, coefficient form and volume agree with the roadmap's top-coordinate sign. Common-slot Brauer identity is imported. |
| 3.3 Real exceptional torus map | IP23 Lemma 6.2, p. 44, lines 1870–1888 | Square roots are used modulo the common central sign; radial coordinate is squared. Not an unmarked choice of square roots. |
| 3.5 Archimedean theta cohomology | IP23 §7.2, p. 47, lines 1994–2011, and §§7.2.1–7.2.2, p. 48, lines 2015–2035 | Corrected labels and `1,2,1` dimensions verified. Source has all integer `k≥2`: R02. |
| 4.5 Noncompact Schwartz restriction | IP23 Proposition 8.1, pp. 54–55, lines 2281–2334; the restriction map at lines 2236–2252 | Harmonic projection, divided coefficient vector, two-form contraction and exponent `ℓ+2` agree. |
| 5.3 Component character class | IP23 §4.3, pp. 23–24, lines 1000–1033 | Roadmap correctly uses a full idele-class character at the displayed argument; that argument need not have norm one. The rational eigensummand is distinguished from a lone complex character vector. |
| 6.1 Toric theta lifting and automorphic induction | IP23 Lemma 9.1, p. 57, lines 2395–2444 | Division quaternion, split real places, non-norm local character, nonzero lift and its induction comparison are retained. Trivial-character pole is distinguished from finite nonzero values. |
| 7.3 Central projection and normalized descent | IP23 §10.4, pp. 68–70, lines 3000–3061 | Inverse character in the projection and cancellation of the auxiliary idele agree. Rational effective-volume normalization corrects the source's overly general raw-volume prescription; R01 remains in its supplier interface. |
| 8.3 Negative-similitude involution | IP23 Lemma 11.3, p. 83, lines 3836–3846 | Negative similitude exchanges the two holomorphic extremes, preserving the middle family. Tested its matrix and square. |
| 8.4 Rational theta Hecke space | IP23 §4.4, pp. 24–25, lines 1034–1048; Theorem 12.4 proof, p. 99, lines 4543–4549 | Rational Hecke kernel keeps the coefficient-conjugate orbit. It is not just one complex eigenspace. |
| 8.5 Degree selection | IP23 Proposition 11.4, pp. 85–86, and Remark 11.5, p. 87, lines 3950–4014 | Near-equivalence route and local theta modules give minimal degrees `4,2,4`; degree `2d` selects the middle family at every split real place. |
| 8.8 Purity | IP23 Proposition 11.6 and Corollary 11.7, pp. 87–90, lines 4015–4119 | Read the intervening coefficient/Hodge computation, not only the conclusion. Actual type is `(d,d)`, becoming `(0,0)` after twist, for every coefficient conjugate. |
| 9.1 Kottwitz representation | IP23 §11.5, pp. 91–93, lines 4172–4215 | Exterior square of the contragredient, inverse central factor, normalized intertwiner and ordinary tensor permutations agree. |

Additional readings: IP23 §2.2.2, p. 16, lines 680–706, distinguishes the Shimura stabilizer needed in R01; Mil17 Lemma 5.13, p. 57, lines 2486–2507, Theorem 5.26/Remark 5.27, p. 64, lines 2792–2807, and Theorem 5.28, p. 65, lines 2820–2836, support the effective central quotient. Wal85's rational measure convention is at lines 142–147. The backward-conjugation issue in IP23 Proposition 9.5 was checked at lines 2632–2647; §6.5 already corrects it.

### Computed adversarial table

In the exterior rows, the basis is `e12,e13,e14,e23,e24,e34` and the top coordinate is −1 unless otherwise stated. In the Schwartz rows the common positive Gaussian factor is removed when displaying polynomial values. Rows concerning deep global endpoints test their constructions, quantifiers, normalizations and negative controls, not a numerical approximation to an uncomputed automorphic form.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result; change |
| --- | --- | --- | --- |
| 0.1 global data; 0.6 sign lines | Real quadratic field, `d=1`, weights `(2,2)` | Coefficient degrees `(0,0)`; sign lines have types `(1,0),(0,1)` and sum dimension 2. For `d=0`, the empty sign set has one choice, dimension 1. | Scope consistent. |
| 0.2 pure weights | Degree zero with coefficient `1⊕Norm` on a CM torus | Types `(0,0),(−1,−1)` have weights `0,−2`, equal to degree plus coefficient weight; a single claimed weight would fail. | Mixed-weight decomposition is retained. |
| 0.2 supplier comparison | `T=Res_{ℚ(√2)/ℚ}𝔾_m`, trivial datum and coefficients, level 3 | Shimura space: one point, `(dim H⁰,dim H¹)=(1,0)`. ALS space: `ℝ` modulo the nonzero unit-log lattice, `(1,1)`. | **R01:** these cohomologies cannot be identified. |
| 0.3 effective degree | `ε=1+√2`, levels `K(9)⊂K(3)` | Unit-group orders modulo 3 and 9: 8 and 72; orders of ε: 8 and 24. Shimura component counts `8/8=1`, `72/24=3`; effective degree 3, raw index 9. | Effective degree formula is sound. |
| 0.3 supplier trace | Same levels | Units in the levels are generated, up to the sign convention, by `−ε⁴` and `−ε¹²`; lattice index 3. ALS has three circles each covering with degree 3: total degree 9. Shimura has three points over one: degree 3. | **R01:** ALS transfer times effective ratio is `9/3=3`; required normalized Shimura transfer is `3/3=1`. |
| 0.3 rationality; 7.3 and 10.3 descent | Trivial torus projection at `K(3)²→K(3)` | Both sets are one point; trace 1. Volumes `(1,1)` give 1, `(√2,1)` give √2 outside ℚ; rational rescaling `c` gives `c∈ℚ`. | Round 4 F03 repaired throughout. |
| 0.3 level independence | Source level shrunk by effective index `m=3` | Pulled-back trace multiplies by 3; volume factor divides by 3; product 1. Identity level gives `1·1=1`. | Sound for the actual geometric trace. |
| 0.4 division reduction | Ramification sets `{v∞,p}` and `{v∞,q}`, `p≠q` | Symmetric difference `{p,q}` is nonempty of cardinality 2; real invariants `1/2+1/2=0` in ℚ/ℤ. Equal algebras give empty difference and split product. | Division claim correctly limited to distinct algebras. |
| 0.5 rational model | Ramified quadratic `χ₃∘det`; unramified quadratic character; Steinberg | Ramified character: centre 1, `diag(−1,1)` acts −1, all newvector invariant dimensions 0, rational model dimension 1. Unramified character: spherical dimension 1. Steinberg: spherical dimension 0, conductor-one newvector dimension 1. | Round 4 F02 repaired, both split cases distinguished. |
| 0.5 division-field obstruction | Quaternionic two-dimensional representation of Q₈ | Frobenius–Schur indicator `(4−12)/8=−1`, although character values are rational. | Trivial-central-character assumption is material. |
| 0.5 multiplicity | `d=0,1,2`, finite invariant rank 3 | Multiplicity ranks `1,2,4`; full isotypic ranks `3,6,12`. | Finite representation factor is not confused with multiplicity. |
| 0.7 operator | Curve basis `e,f`, trace `e∪f=1`, class `f⊗e−e⊗f` | Koszul rule gives images `e,f`; opposite tensor gives `−e,−f`. Hom weight `1+1−2=0`. | Direction, sign and twist agree. |
| 1.1 volume | `H=diag(1,2,1,−5)`, top coordinates −1 and −2 | Volumes `−10` and `−10/4=−5/2`; wrong multiplication by the norm gives −40. | Nonzero top coordinate is supplied by the linear equivalence. |
| 1.1 rank-zero convention | `σ(t)=t²`, top coordinate `t` | Volume `t⁻³`, conjugate `t⁻⁶`; with `σ=id`, both `t⁻²`. | Noninvolutive rank-zero fixed-volume assertion is explicitly excluded. |
| 1.2 determinant norm | Scalar `2+i` in dimension 4; rank zero | Norm of determinant `625=5⁴`; rank zero `det=1=ν⁰`. | Multiplier retained as data where necessary. |
| 1.3 existence/uniqueness headline | Unit form; zero form | Unit form has `L(e12)=−e34`, wedge pairing 1 equals determinant pairing 1; wrong zero map gives 0. Zero form has all six star coefficients 0. | Defining law determines the operator and permits degenerate forms. |
| 1.4 square headline | `diag(1,2,1,−5)` | Star images `−2e34,e24,5e23,−2e14,−10e13,5e12`; each square is `−10eI=det(H)eI`. | All six coordinates agree. |
| 1.4 boundary fields and degeneracy | Rank-two `diag(1,1,0,0)`; hyperbolic form over 𝔽₂ | Rank two: only `e12↦−e34` is nonzero, square 0 equals determinant 0. In 𝔽₂: square `I6`, determinant 1. | No characteristic-zero restriction introduced in Lean. |
| 1.4 arbitrary σ | Positive-dimensional Hermitian form with `σ²≠id` | Hermitian symmetry forces `(a−σ²(a))H(x,y)=0`; choosing a moved scalar forces `H=0`, hence `L²=0=det(H)`. | Lean's broader endomorphism binder is sound. |
| 1.5 skew identities | `H=[[2,i],[-i,2]]⊕[1]⊕[−1]`, `J=−3` | `b(L e12,e34)=3i=b(L e34,e12)`; `conj b(L e12,L e12)=9i=−J b(e12,e12)`. | Both signs and conjugation checked on a non-diagonal form. |
| 1.6 quaternionic freeness | Zero form compared with a free symbol module; unit form | Zero operator has right-j rank 0; a free rank-three square-zero-symbol module has right-j rank 3. Unit form has `J=1` and invertible L. | Nondegeneracy required for freeness is present. |
| 1.7 similitude headline | Unit form, `g=diag(i,1,1,1)`, `ν=1`, `x=e12` | `det g=i`; both sides are `i e34`, with scalar `1/i=−i`; a conjugated determinant gives `−i e34`. | Quotient direction verified. |
| 1.7 zero form | Any invertible g, declared multiplier 0 | LHS 0, RHS `0²/det(g)` times 0 = 0; denominator remains nonzero. | Wider Lean generality is deliberate. |
| 1.7–1.8 exceptional headlines | Scalar 2; central −1; change of lift by α | Source multiplier 4, exterior multiplier 16; exterior of −1 is +1; correcting scalar contributes `α²α⁻²=1`. | Squared multiplier and projective kernel agree. |
| 2.1 quaternionic plane | `J=−3`, `β=(1+2i)+ji`, `α=2−i` | Reduced norm 8, multiplier `8/5`, determinant `(24+32i)/25`. Plane `diag(1,3)` has square −3, while its determinant is 3. | Inverse scalar action and plane sign agree. |
| 2.2–2.3 block spaces | Two planes and their exterior square | E-dimensions `4+2=6`, B-ranks `2+1=3`; group dimensions `5+5−1−1=8=7+2−1`; −1 maps to identity. | Mixed wedge order and central kernel retained. |
| 2.4–2.5 block quotients | Scalar pair `(2,1/2)` versus `(2,2)`; `α=1+i` | Tensor actions 1 versus 4; norm multiplier of α is 2, whereas α² is 2i. | Anti-diagonal quotient and norm, not square, are necessary. |
| 2.6 tensor model | `J₁=−2,J₂=5` | Mixed form diagonal `(1,2,−5,−10)`; operator images `(e24,−2e14,5e23,−10e13)` give square `−10I4=J₁J₂ I4`. | Source formula and inherited star normalization agree. |
| 2.7 three-plus-one | Orthogonal 3+1 decomposition | Mixed E-dimension 3, complementary E-dimension 3; extension to B has B-rank 3 and E-dimension 6. | Mixed summand and its j-translate are complementary. |
| 2.8 diagram | Scalar representatives `b₁=2,b₂=3,α₁=2,α₂=3` | Both original plane actions are identity; displayed extra coordinate is `4·(1/2)·3=6`, and tensor scalar is 6, hence their common projective class is identity. | Two routes through the diagram agree. |
| 3.1 signatures | Split and compact real places | `(2,2)+(2,0)=(4,2)`; `(0,4)+(0,2)=(0,6)`. | Compact place supplies anisotropy; not inferred at a split place. |
| 3.2 split torus | `(t₁,t₂,ν)=(1,i,2)` | Image `(1,2,−2i)`; replacing t₂ by its conjugate gives `(1,2,2i)`. | Conjugation is essential. |
| 3.3 real torus | `y=(1,1,1,−1)` and `(1,1,i,i)`; `r=2` | Triples `(−1,−1,−1)` and `(1,1,−1)`; radial coordinate 4. Flipping one root multiplies all three coordinates by −1. | Only the common sign disappears projectively. |
| 3.4 weight lattice | `(2,0,0)` and `(1,0,0)` | First maps to `(1,−1,1,−1)` and inverse returns `(2,0,0)`; second gives half-integers and is outside the integral domain. | Even-sum condition correct here. |
| 3.5 theta labels | `k=2`, holomorphic and antiholomorphic inputs | Noncompact `(1,1)` dimensions 0 and 1; compact lift dimensions 1 and 0. Middle module cohomology dimensions `1,2,1`, total 4. | Round 4 F01 repaired. |
| 3.5 local generality | `k=3` | `A_q₁(1,0,0)` has lowest K-type `(3,0,0)` and dimensions `1,2,1`; compact highest weight `(1,0,0)` has dimension 6, coefficient invariants dimension 1. | **R02:** local theorem must include this source-supported case. |
| 4.1–4.2 harmonic/Fock normalization | Degree-two tensors; positive two-plane; one-coordinate square | Undivided repeated-vector pairing is `2!=2`; harmonic degree-two dimension is 2. Fock inverse of a coordinate square contains `4x²−1/π`, nonzero at 0, unlike raw x². | Factorials and nonharmonic contraction distinguished. |
| 4.3 compact boundary and weights | `(p,q,ℓ)=(0,0,0),(0,6,0),(4,2,0)` | Empty tuple contributes 1; inappropriate noncompact index sum at `(0,6,0)` gives 0 but compact formula gives 1. Weights −3 and +3 pair to average 1; +3 and +3 average to 0. | Compact formula and repaired sign input agree. |
| 4.4 restriction | `e1²`, large dimension 6, small dimension 4 | Smaller projection `e1²−Q4/4` has trace 0. Raw restriction of the larger projection has trace `1−4/6=1/3`; final projection restores 0. | Harmonic projection after restriction is indispensable. |
| 4.5 noncompact restriction headline | `x₁=x₂=1`, ε=+, `ℓ=0,1,2` | Polynomial factors `(1+i)²=2i`, `(1+i)³=−2+2i`, `(1+i)⁴=−4`, matching the contraction formula. | Exponent ℓ+2 and complex sign verified. |
| 4.6 compact restriction headline | Same point, `ℓ=0,1,2`; separately x=e1 | Factors `1,1+i,2i`. At x=e1 the two parity signs multiply to +1; source's extra sign would give −1 at ℓ=1. | Roadmap's source correction is sound. |
| 5.1–5.2 Shimura diagram/component torus | Central −1 and scalar 2 | Exterior action of −1 is identity; scalar 2 contributes square 4 to the component multiplier. | Diagram uses projective centres consistently. |
| 5.3 component character | `α=2,t₁t₂=4`; representative change by 3 | Character argument `α⁻¹=1/2` has norm 1/4, not 1. Pair `(2,2)` changes to `(6,2/3)` with product still 4; character trivial on base ideles evaluates to 1 there. | Full character is required; norm-one-only wrong model excluded. |
| 5.4 coefficient descent | `k=4` versus k=3 | Degree 2 gives projective torus weight `(1,−1,1,−1)`; degree 1 gives half-integral coordinates. | Parity belongs to this descent, consistent with R02 repair. |
| 6.1 toric induction | Nontrivial order-three character on norm-one elements versus trivial restriction | Restriction value ζ₃ differs from 1; induced conjugate pair `(ζ₃,ζ₃⁻¹)` has trace −1 and determinant 1. Norm characters restrict to 1. | Non-norm local hypotheses distinguish the nonzero division lift. |
| 6.2 product lift | Anti-diagonal central scalar t; one missing JL transfer | Central action product `ω(t)ω(t⁻¹)=1`; missing factor gives zero product lift. | Quotient and zero alternative retained. |
| 6.3–6.4 doubling normalization | Nonarchimedean q=2, s=3/2 | `b/a=−16384/34425`; arguments of the numerator are 4,6,8 and denominator 3,1,−1. Global pole factor is ζ(1), not ζ(0). | Residue route, not positive-range value formula. |
| 6.5 rigidity headline | Determinant-one unramified pair `(a,a⁻¹)` | Dual unordered pair `(a⁻¹,a)` is equal; conjugating the backward lift returns τ from its conjugate. | Source proof's missing final conjugation is repaired in the target. |
| 7.1–7.2 theta class | `d=1`, weights k=2 at two real places | Local form degrees 2 and 0, total 2=`2d`; input weights −3 and +3 cancel the oscillator weights +3 and −3. | One compatible global input, not incompatible local labels. |
| 7.3 central projector | Cyclic centre C₃, η(j)=ζ₃^j | On f(j)=ζ₃^(−j), normalized sum is 1; on a constant, `(1+ζ₃+ζ₃²)/3=0`. Auxiliary character factors `ζ₃⁻¹ζ₃=1`. | Inverse-character convention excludes the wrong projector. |
| 7.4–7.5 restricted sign pairings | Noncompact x=2e1, k=2; two sign choices | Both restriction polynomial values are 4 and Gaussian is nonzero; compact degree-zero factor is 1. | Both local sign directions have nonzero test functions; common finite data required. |
| 7.6 norm support | Ramified versus unramified quadratic extension of ℚ₃ | In the ramified case residue unit −1 is not a square, hence not a norm; in the unramified case units are norms but a uniformizer of valuation 1 is not. | Positivity alone does not describe H_N⁺. |
| 7.7 auxiliary character | Local character of order 3 versus 2 | `χ(y²)=ζ₃²≠1` versus `χ(y²)=1`; for a base-field element `x/σx=1`. | Order-two wrong choice is excluded. |
| 7.8 auxiliary vector | Real split/compact Gaussian | Value at 0 is `exp(0)=1`; oscillator weights +1 and −1. | Nonzero vector and sign agree. |
| 7.9 triple product | k=2 at split and compact places | Weight sums `2+1=3` paired with −3 and `−2−1=−3` paired with +3 both give 0 total weight. | Minimal K-types match the see-saw. |
| 7.10 simultaneous nonvanishing headline | Two sign lines; zero local factor | `diag(2,3)` has both pairings nonzero and determinant 6; `diag(2,0)` has determinant 0. A zero local factor gives all pairings 0. | Same global data must work on every sign, as stated. |
| 8.1 parameter and Asai sign | q_E=4, a=2; two-dimensional parameter | Half-twisted eigenvalues 1 and 4, rather than 2 and 2; Asai dimension `4=3+1`, swap sign −1 times quadratic sign −1 gives +1 on scalar line. | Twists and conjugate-orthogonal sign agree. |
| 8.2–8.3 negative similitude | J=diag(1,1,−1,−1), δ swaps the two blocks | `δᵀJδ=−J`, `δ²=I`; `(4,0)` and `(0,4)` exchange, `(1,1)` remains middle. | Matrix and cohomological involution agree. |
| 8.4 rational Hecke space | Rational operator with minimal polynomial T²−2 | Rational kernel dimension 2 complexifies to two lines at ±√2; one line has dimension 1 and is not rational. Kernel for a disjoint eigenvalue 3 is 0. | Full conjugate orbit retained. |
| 8.5 degree selection | d=2 and d=0 | Middle minimum `2+2=4`; replacing one by an extreme gives at least `4+2=6`. Empty product gives degree 0. | Degree 2d selects only the middle family. |
| 8.6–8.7 coefficient Hodge types | k=4 | Cochain `(1,1)` plus coefficient `(2,2)` gives `(3,3)`; normalization by `(−2,−2)` gives `(1,1)`. The middle unshifted types are `(0,8),(3,3),(4,4)×2,(5,5),(8,0)`. | Cochain degree is not substituted for Hodge degree. |
| 8.8 purity headline | d=1,2 and every coefficient embedding | Normalized local `(1,1)` gives `(d,d)`; at d=2, twist `(2)` changes `(2,2)` to `(0,0)`. | Correct purity for the rational theta space. |
| 9.1 Kottwitz representation | Central ν=2; d=0,1,2; swap two factors | Central operator `(1/2)I6`, not `2I6`; dimensions 1,6,36; ordinary permutation on extreme lines has scalar +1, not Koszul −1. | Dual, inverse multiplier and permutation convention verified. |
| 9.2 lowest line | One factor and two factors | Extreme characters `\|·\|⁻¹` and `\|·\|⁻²`; twist by d cancels exponent `−d+d=0`. One factor dimensions `1+4+1=6`. | Integral twist, not half twist, in the conclusion. |
| 9.3 additive characters | Unramified character; cyclotomic logarithm at ℓ=3,2 | Unramified inertia value 0; logarithmic inertia values `log(4)≠0`, `log(5)≠0`. | De Rham restriction is essential. |
| 9.4 unipotent headline | Class group of order m; characteristic-zero versus mod-ℓ coefficients | `mc=0` forces c=0 over ℚℓ; when m=ℓ, c=1 can survive mod ℓ. | No extension to torsion coefficients claimed. |
| 9.5 conditional Galois action | Matrix `[[1,c],[0,1]]` | Semisimplification is I₂ for every c; actual action is I₂ only when c=0, supplied by the geometric argument. | Semisimplification is not silently promoted to triviality. |
| 10.3–10.4 restriction/invertibility | Identity correspondence; two sign lines | Rational identity matrix has determinant 1; sign matrix diag(2,3) has determinant 6; zero component parameter gives zero map. | Rationality restored by F03, subject to R01's transfer repair. |
| 10.5 component invariants | Galois swaps two components | Fixed vectors `(a,a)` have dimension 1; indicator `(1,0)` is sent to `(0,1)`; constant character gives `(1,1)`. | Invariant subspace corrects the source's blanket trivial-action claim. |
| 10.6 rational descent headline | Bilinear determinant diag(x₁c₁,x₂c₂); P(X)=iX | Determinant at all ones is 1; at x=(1,0) it is identically 0. P(1)=i is nonzero, but averaging i with −i gives 0. | Two rational choices via polynomial nonvanishing, not averaging an invertible class. |
| 10.7 Hodge-class headline | d=0 and d=1 multiplicity models | Rank-one nonzero scalar is invertible; diag(2,3) has determinant 6 and Hom weight `1+1−2=0`. | Endpoint agrees with its constructed operator, subject to R01. |
| 10.8 all-prime headline | Constant degree-zero model; general twist | Degree-zero Galois action 1 at every prime; `ℚℓ(−d)(d)=ℚℓ` for the same rational data. | Conditional statement retains all primes and one rational class. |
| 10.9 weight-two headline | d=1, finite invariant ranks 2 and 1 | Coefficient degrees 0; multiplicity dimensions 2 and 2; full isotypic dimensions 4 and 2. | Correspondence compares multiplicities, not unequal full isotypic spaces. |

### Lean acceptance test, headline coverage and padding

The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, as recorded in the content manifest. The prescribed `lake env lean` invocation on the absolute package file, from the pinned content checkout, exited 0. Its only warnings were the three uses of `sorry`, at lines 70, 81 and 95. No Tau Ceti object build was needed: the file has one `import Mathlib` and no other import.

A scratch copy with `#check @name` for all four declarations elaborated successfully. Compared each type with §§1.3, 1.4 and 1.7: the three theorems retain finite dimensionality, the arbitrary ring endomorphism σ, the top trivialization and dimension equation. The square retains Hermitian symmetry; the similitude theorem retains the actual transformation equation and an invertible g. No binder disappeared; no file change was needed. The real-bodied predicate appropriately requires only the data in its defining identity.

Every sorried theorem was probed, not sampled. Separate scratch copies replaced all three bodies with `simp [IsExteriorStar]`, with `rfl`, and with `infer_instance`. All three theorems failed all three probes. Reading the native near-matches found no single exact library lemma with any of these signatures: native `hodgeStar` is a linear equivalence for a bijective bilinear form, not this semilinear operator allowing degenerate H; its defining equation also has the inverse orientation. Thus none of the three theorems should be deleted as padding. There are no admitted examples or small-value theorems.

| README headline | Suggested.lean disposition |
| --- | --- |
| Exterior operator existence, square and similitude (§§1.3, 1.4, 1.7) | All three stated, with one real-bodied predicate on native carriers. |
| Exceptional isogeny and projective isomorphism (§§1.7–1.8) | Named in docstring; algebraic unitary similitude groups, components and central quotient carriers are missing. Point-level operator identity is already stated. |
| Schwartz restriction (§§4.5–4.6) | Named in docstring; oscillator/Fock and coefficient-valued relative cochains are missing. SchwartzMap alone does not supply them. |
| Near-equivalence rigidity (§6.5) and simultaneous nonvanishing (§7.10) | Named in docstring; global automorphic/theta representation and cohomology carriers are missing. |
| Purity (§8.8) | Named in docstring; actual Shimura cohomology with its coefficient Hodge structure and Hecke action is missing. |
| Geometric unipotent triviality (§9.4) | Named in docstring; number-field Galois cohomology with the required de Rham condition is missing. |
| Rational Hodge class (§10.7), conditional all-prime theorem (§10.8), rational weight-two correspondence (§10.9) | Each named in docstring with the absent Shimura, coefficient-cohomology and automorphic carriers; all-prime theorem additionally needs the stated Kottwitz input. |

No additional statable headline was found omitted. No arbitrary Prop bundle or free-scalar stand-in is used. All four owned backticked declarations are in the Lean file and README. The eight automated missing-name leads resolve: `IsExteriorStar.map_similitude` is this package's declaration; the other seven are explicitly attributed to the planned ShimuraVarieties supplier, not asserted native at the pins.

### Pinned declarations opened and duplication audit

Searched by objects as well as declaration names: wedge and determinant pairings, semilinear star and square, quaternion norm rescaling and common-slot tensor, Hodge tensor/Hom/twist, harmonic trace, Shimura coefficient cohomology, central transfer and geometric unipotent extensions. Native results below are cited rather than redeclared. The three Lean targets add the sesquilinear/possibly degenerate comparison and its identities, not a second exterior-power library.

| Native object read | Pinned file and line | Scope compared |
| --- | --- | --- |
| `wedge`, `wedgePairing`, `topVector`, `isUnit_apply_topVector`, perfect pairing instance | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean:34`, 42, 78, 92, 130 | Actual wedge followed by top trivialization; finite free perfectness; top coordinate is a unit. |
| `pairingDual`, pure-wedge determinant | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64`, 71 | Determinant with the transposed index order; transpose preserves the determinant used here. |
| Exterior functor and induced bilinear form | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:260`, 273; `Mathlib/LinearAlgebra/ExteriorPower/BilinForm.lean:34` | Linear functor, not semilinear star. |
| Bilinear Hodge star | `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean:48`, 53 | Requires bijective bilinear B; output is a linear equivalence; the three targets are not this definition or its simp identity. |
| Determinants, basis and dual | `Mathlib/LinearAlgebra/Determinant.lean:164`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63`; `Mathlib/LinearAlgebra/Basis/Defs.lean:89`; `Mathlib/LinearAlgebra/Dual/Defs.lean:61` | Endomorphism determinant defaults to 1 without a finite basis; current theorem binders exclude that branch. |
| Quaternion carrier | `Mathlib/Algebra/Quaternion.lean:65` | Four coordinates; it does not itself assert division, nonzero parameters or central simplicity. |
| Polynomial nonvanishing; Hilbert 90 | `Mathlib/Algebra/MvPolynomial/Funext.lean:83`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107` | Infinite integral-domain identity theorem; finite-extension multiplicative cohomology. These are not ad hoc rational descent assumptions. |
| Schwartz and gamma carriers | `Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287` | SchwartzMap has smoothness and rapid-decay fields, not an oscillator action or a relative cochain. |
| Top exterior determinant and trivialization | `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean:157`, 175 | Already supplied and imported; the basis-free determinant result includes its nonfinite degree-zero branch. |
| Hodge structure, twist, internal Hom, tensor | `TauCeti/Geometry/Hodge/Structure.lean:62`; `TauCeti/Geometry/Hodge/Tate/Twist.lean:63`; `TauCeti/Geometry/Hodge/InternalHom/Basic.lean:271`; `TauCeti/Geometry/Hodge/TensorProduct/Basic.lean:117` | Opposed filtration; weights `n−2m`, `n₂−n₁`, `n₁+n₂`. The native carrier does not include an L-action or Shimura cohomology. |
| Quaternion norm and square rescaling | `TauCeti/Algebra/Quaternion/SymbolEquiv.lean:226`, 426 | Unit parameter required; norm-rescaling sends j to `(x+yi)j` in the stated direction. |
| Common-slot tensor and Brauer identity | `TauCeti/Algebra/Quaternion/TensorProduct.lean:192`; `TauCeti/Algebra/Quaternion/BrauerClass.lean:255` | Unit parameters over a field with 2 invertible; these are imported inside the explicit exterior-model comparison. |
| Symmetric-power representation | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57` | Native representation over a commutative ring; does not supply automorphic local systems. |

The open-head searches were run through the roadmap tools. The board package index was read before evaluating absence claims; its three separately headed packages concern analytic number theory, Lawrence–Venkatesh and logic/definability, not an additional owner of the constructions here. The package is a new mathematical direction, not a replacement plan for a roadmap on main. Existing bilinear/metric stars in ClassicalGroups, ComplexKahlerGeometry, SpinGeometry and the pinned library do not own this Hermitian quaternionic exterior comparison.

The supplied overlap report has no conflicting head, dropped cited id or citation depending solely on a revision's new numbering. Its five closest open roadmaps were inspected by scope and relevant object:

| Other open roadmap | Head file and lines | Ownership resolution |
| --- | --- | --- |
| #1063 MetaplecticAutomorphicForms | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1034`, §§3.4, 3.32a–3.36, 5.6, 6.10–6.15 | Owns oscillator, local theta labels and general integral machinery. This package imports them and retains explicit exterior/Schwartz/cohomological comparisons; quaternionic extensions are named gaps. R02 restores the scope of the local import. |
| #1756 AutomorphicLFunctionsAndLocalFactorsPartII | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:3`, 11–23 | Owns unitary/generalized doubling and normalization comparisons, not the anisotropic quaternionic rank-three residue comparison or Jacquet–Langlands Hodge class. No duplicate target identified. |
| #1736 ExceptionalThetaCorrespondencesForG2 | `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:3`, 7–19 | Octonion/Jordan minimal representations and G₂ correspondences; imports classical theta inputs. These are different groups and representations from the rank-three quaternionic classical dual pair here. |
| #1038 ShimuraData | `TauCetiRoadmap/ShimuraData/README.md:355`, 417, 578, 820 | Owns datum/VHS/Kostant inputs; this package imports them and constructs the specified exceptional diagram and coefficient-cohomology comparison. |
| #999 EndoscopicTransferAndUnitaryTraceComparison | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:411` | Supplies the one-factor unitary similitude dual-root-datum calculation. Its global setting has an imaginary-quadratic subfield; general E/F uses the root-datum construction of ReductiveGroupsPartII RG2.5, not that restricted global setup. The exterior/tensor representation is additional here. |

### Supplier resolution, declared gaps and order

Every supplier citation was resolved against main or the supplied open head, not remembered from the preceding round. Section existence is not treated as proof that its object has the required scope: that distinction produces R01. The following records the resolutions, grouping repeated citations.

| Supplier and head | Sections resolved; repository-relative evidence | Outcome |
| --- | --- | --- |
| MotivesAndAlgebraicCycles #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:354`, 371, 417, 435, 1292, 1581: §§2.2–2.3, 2.6–2.7, 7.1, 7.15 | Compatible realizations, correspondence action and HT subspace match; scalar-extension map is not asserted bijective. |
| ArithmeticLocallySymmetricSpaces #871 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1309`, 2987, 4257; ALS.1.1–1.2, 1.8, 3.3, 3.6, 5b.1, 5b.4 | Sections exist; **R01** concerns their different quotient and transfer. |
| ComplexKahlerGeometry, main | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2321`, 2477: K6.0, K6.1 | Twisted identities and scalar compact Hodge theory; VHS cohomology is separately contracted. Retained K-labels resolve despite numerical heading changes. |
| ShimuraVarieties #933 | `TauCetiRoadmap/ShimuraVarieties/README.md:410`, 1149, 1178, 1310, 1897, 2362, 2476, 2497: §§1.3, 4.2, 4.3, 4.9, 6.7, 8.1, 8.5, 8.6 | Effective finite maps, canonical models and full reflex norm agree. Named planned declarations resolve here, not at the library pin. |
| ShimuraData #1038 | `TauCetiRoadmap/ShimuraData/README.md:355`, 417, 578, 820: §§3.1, 3.3, 3.10, 4.3 | VHS, Kostant and rational weight/SV conditions match. |
| GL2AutomorphicRepresentationsAndTransfer #931 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:716`, 1136, 1203, 1349, 1703, 1750, 1758, 1766, 1776, 2359, 2645, 2692: R16.1.8, 4.4–4.5, 6.3; R17.3.1, 3.5–3.8, 4.2, 4.13, 4.16 | JL, multiplicity, weights, induction and base change resolved. Exact-field quaternionic descent and norm-subgroup restriction remain explicit gaps. |
| AutomorphicFormsOnReductiveGroups #1037 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:462`, 644, 737, 765, 808, 870: §§2.6, 4.2, 5.1, 5.2, 5.4, 5.7 | Highest weights, discrete series, globalization, cohomology and rationality match. Generic descent does not already supply the division-quaternion exact-field model. |
| AutomorphicSpectralTheory #925 | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:528`, 550, 2352: §§0.25–0.26, 4.7 | Special functions and compact discrete spectrum exist; no unconditional general Eisenstein input inferred. |
| AutomorphicLFunctionsAndLocalFactors #924 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1772`, AL.3.6.3 | Boundary zero-freeness permits poles; package distinguishes the trivial-character pole. |
| MetaplecticAutomorphicForms #1063 | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1034`; §§0.15–0.17, 2.5, 3.3c, 3.4, 3.7, 3.9, 3.16, 3.23–3.28, 3.32a–3.36, 3.38, 5.6, 6.4, 6.10–6.15, 6.22 | Local/global conjugation adapter is explicit. The common split real place in the splitting comparison is kept where used. Residue and Shimizu extensions are contracted. |
| AdelicAlgebraicGroups #792 | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3112`, 4609: §§3.4, 4.3 | Compactness modulo centre and neatness match; neatness does not kill real-quadratic central units. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:275`, 301–302 and Layers 6–8, 10, 11 | Former §5.4 is mapped to W.4; global Brauer reciprocity does not by itself already state the full quaternion classification/embedding contract. |
| GlobalNumberFields, main | `TauCetiRoadmap/GlobalNumberFields/README.md`, Layers 1, 2, 4, 6, 9, 10 | Approximation, ray classes, idele and Hecke characters match the finite compatible local prescriptions. |
| ReductiveGroups and ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroups/README.md`, Layers 3, 6; `TauCetiRoadmap/ReductiveGroupsPartII/README.md`, RG2.5.1–RG2.5.2 | Quotients/components and dual/L-groups imported; algebraic isogenies are not promoted to rational-point surjectivity. |
| SchurWeyl and SpinRepresentations, main | `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:1308`, Layer 9; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:870`, Layer 6 | Traceless tensors and complex Spin₆ comparison imported; specific symmetric harmonic adapter and quaternionic descent differ. |
| GeometryOfNumbersAndQuadraticArithmetic #851 | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1531`, §4.3, harmonic and Fischer subparagraphs | Positive-definite polynomial decomposition is present despite the broader heading; package explicitly extends to arbitrary signature. |
| EtaleCohomologyFoundations, main; ComplexComparisonPartII #848 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504`, 522, 676; `TauCetiRoadmap/ComplexComparisonPartII/README.md:4680`, C6 | Proper/smooth base change and constructible/local-coefficient comparison; compact varieties supply properness. |
| PadicHodgeTheory #1062; PadicPeriodRings #940 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, 894, 1250, 1378; `TauCetiRoadmap/PadicPeriodRings/README.md:172` | De Rham, Sen and proper smooth comparisons and Tate cohomology; stalk rigidity/subquotient closure is explicitly contracted. |
| SelmerIwasawaCohomology #869; ArithmeticGaloisRepresentations #856 | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:489`, 1923; `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, Conventions, §1.2 | Unramified and Bloch–Kato conditions; arithmetic Frobenius and cyclotomic weight conventions match. |

The eight declared gap slugs agree between README and plan: `compact-matsushima`, `vhs-hodge-decomposition`, `quaternion-ramification-classification`, `norm-subgroup-restriction`, `quaternionic-doubling-residue`, `quaternionic-shimizu-lift`, `derham-local-system-cohomology`, `quaternionic-rational-model`. Each names an earlier supplier, with explicit hypotheses. No gap has supplier `none`. The doubling contract is one coherent extension of the integral/residue comparison, not an unrelated collection of foundations. The local-system contract supplies the two missing steps of the same de Rham cohomology route. Existing scalar Hodge theory, split rationality, common-slot Brauer identity and ordinary doubling do not already supply these stated extensions. R01 identifies a missing comparison between two different quotients beyond the existing compact-Matsushima contract; it does not treat a declared gap's absence today as a finding.

The prescribed dependency command, using the supplied configuration, package README, name, merge order, `--movable` and content checkout, exited 0 and printed:

    depcheck: 236 roadmaps, 2155 edges, 0 problem(s)

No `UPWARD`, `CYCLE` or `moved:` line appeared. No tooling, merge-order file or supplier was changed.

## Not verifiable

- No sampled text was inaccessible. The published open IP23 text, Numdam Wal85 scan and Milne revision were readable. No new source fetch or missing-reference request was needed.
- The unimplemented supplier contracts were checked for ownership, formulation and overlap, not certified as completed proofs. R01 requires an additional interface contract or its actual construction.
- The three Lean statements still have `sorry` bodies. Elaboration and computed counterexample searches are not formal proofs. The geometric/automorphic headlines cannot yet be elaborated on the missing carriers listed in the module docstring.
- Open-work ownership was checked against the supplied index, accessible heads and main. No independently discovered head or pull-request description was substituted for those files.

## Source issues

- **Error** in IP23 at Remark 2.2, printed page 17: the source says raw level volumes give level-independent geometric trace; it should use effective degrees accounting for rational central units, with rational relative measures for rational descent; affects a stated result.
- **Error** in IP23 at Proposition 8.2, printed page 55: the source says compact contraction retains an extra parity sign; it should cancel the negative Fock and coefficient-pairing signs; affects a stated result.
- **Error** in IP23 at §4.3, printed page 24: the source says to evaluate a norm-one character on the displayed general idele; it should use the appropriate full idele-class character because the argument need not have norm one; affects a stated result.
- **Misprint** in IP23 at §3.2, printed page 19: the source says multiplicity cohomology is concentrated in degree twice the dimension; it should be concentrated in degree equal to the dimension; affects nothing.
- **Misprint** in IP23 at the proof of Proposition 11.6, printed page 88: the source says the degree-two Hodge-type sum with an unclosed ordered pair; it should close the pair with both coordinates equal to weight minus one; affects nothing.
- **Gap** in IP23 at the proof of Theorem 12.4, printed page 99: the source says component combinations are Galois-fixed because the component action is trivial; it should justify descent in the invariant component subspace through reciprocity for the selected character; affects the proof.
- **Gap** in IP23 at the proof of Proposition 9.5, printed page 61: the source says the backward lift itself has the required local components after obtaining their conjugates; it should conjugate that lift or justify the necessary self-duality; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c94f611151939fcfa7cce176ba25d71a77b17c5e", "job": "REV-PKG-HodgeClassesForJacquetLanglands~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
