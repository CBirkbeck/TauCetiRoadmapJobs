<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13019#issuecomment-6781588804 -->
Review (codex) of 2131a2b

Verdict: accepted
Conditional on the announced gaps: `jr-local-comparison`, `jr-weil-descent`, `jr-product-base-change`, `unitary-factor-all-quadratic`, `hermitian-field-classification`, `unramified-hermitian-lattice-orbits`, `unramified-unit-vector-transitivity`

No package findings. All three round-2 findings are repaired. Acceptance is conditional on the seven declared supplier contracts listed below. The four authored package files and the design were not changed. This review also records two additional source errors; neither is reproduced by the package.

## Previous findings, checked individually

The baseline is `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/reports/REV-PKG-EndoscopicTransferAndUnitaryTraceComparisonPartII~2.md`, with the round-3 repair report supplied for this job. None of its findings was marked not actionable. Locations below are in `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md`.

| Prior finding | Repaired passage | Status and independent test |
|---|---|---|
| R01, split-factor coordinates in descent | Line 576: “both coordinates are zero on every factor outside S₁, the mixed case with factors outside S₁ is included” | **Repaired.** The distribution is now G_(S₁(a)) in rank n and G_(S₁(a))⊗G_∅ in the blocks. Xiao18 lines 147–150 and 1015–1017 impose precisely these restrictions. The former counterexample gives inner values (0,0) with the prescribed vector and (1,1) with the positive-control test; the wrong vector still gives (1,0). |
| R01, propagation into the endoscopic reduction | Line 595: “the a-block character is trivial” and “basing the source κ-sum at that orbit cancels it” | **Repaired.** For c_b a nonnorm the b-block character and the source basepoint character both equal −1. Their cancellation is necessary. The averaging factors are 1/4=(1/2)(1/2). |
| R02, consistent versus mixed spectral dictionaries | Line 843: “Changing the dictionary to U_i↦T_i in every rank leaves this value unchanged” | **Repaired.** Both consistent choices give −(e₁⊗e₀+e₀⊗e₁). Changing only the rank-two dictionary gives the positive sum. The sign substitution commutes with both Levi scalings. |
| R03, missing API for ξ_F | Lines 447–451: “ξ_F is a unital homomorphism of complex algebras” | **Repaired.** The API supplies domain, codomain, normalized descent, twists, Satake substitution and the base-change square. On the rank-two first double coset its values on the two Levi valuation classes are 1,1, hence Satake image X+Y. |
| R03, missing API for c_n,d | Lines 767–772: “The contraction grade is c_n,d∗e_0=Φ_n,2d” | **Repaired.** The API gives compact support, finite partition expansion, unit, Satake transform, contraction and degree decomposition. At a=b=1,d=2 both degree expressions are X²+XY+Y². |

Pattern search covered every occurrence of the truncated vectors, S₁-complement characters, Fourier dictionaries, newly defined operators and determinant shells. The full cyclic vectors are correctly retained for the determinant identity. No recurrence of the three defects was found. The earlier quotient-side, norm-unit, rank-zero, consumer and pin repairs also remain intact.

## Verified sound

### Scope, principles and coverage

Read all 36 numbered sections in the six layers, their hypotheses, definitions, API bullets, Checks, routes and Needs lines; the conventions, supplier contracts, examples, dependencies and source corrections; and both TOML files and Suggested.lean. The previous review's computed adversarial rows were used only for unchanged statements, with their actual values, not its narrative assurances. The 15 new sampled targets and every repaired or added passage were checked afresh. The compact table below records the sampled and headline tests, the repair tests and the retained numerical baseline for the remaining sections.

This is a Part II extension of ordinary unitary endoscopy, with the base's stopping point stated at README lines 3 and 7. It owns the symmetric representation and contraction adapters, relative transfer, X_n spherical module, reductions, relative lattice theorem and full Fourier operator. It imports ordinary transfer, generic Hermitian carriers, densities, quotient measures, Satake theory and Weil operators. There is no route-specific prime exclusion: the unramified theorems include p=2, the determinant and germ theory allow ramification, and the geometric construction includes split quadratic algebras. The excluded equal-characteristic, inseparable and zero-ring inputs do not satisfy the standing characteristic-zero local-field hypotheses. Proper elliptic block data require a,b>0; rank zero is explicitly retained where it actually occurs.

The layer order is mathematical. Contraction precedes relative transfer; the spherical module and base-change square precede the descent and Weil reductions; these feed the cyclic and lattice theorems. The last layer uses the two earlier Fourier/Levi maps. It neither claims to follow a source nor labels layers by source chapters, and its dependency-forced order does not repackage a source's exposition. No computational algorithm, copied source passage, unsupported unrestricted relative transfer or full-module orbital transfer was found.

### Seeded source sample: 15 of 15 read

All locators below were read from the recorded legal cached versions. No author locator is marked unverified. All five cited works have exactly one manifest key. The Leslie25 and BP21 references explicitly use their arXiv pagination, and Hironaka99 uses printed pagination. No source fetch or manifest change was necessary.

| Target | Source locator actually inspected | Statement/hypothesis comparison |
|---|---|---|
| 0.4 Regular semisimplicity | Leslie25 lines 542–550, 621–639; §2.1 and Lemma 2.4, pp.14–15 | Closed maximal-dimensional geometric orbit, invertibility and the T² characteristic-polynomial substitution. The README supplies the converse using separable nonzero product eigenvalues. |
| 0.5 Contraction torsor and kernels | Leslie25 lines 590–610, Lemma 2.3, p.15; Leslie19 lines 558–567 and 606–640, Lemmas 3.6 and 3.9, pp.12–13 | Algebraic torsor and stabilizer projection, followed by equality of the rational-class kernels. Rational image Ω is distinguished from geometric surjectivity. The README's determinant-kernel argument also handles S₁ empty, unlike the cardinality step in Leslie19 noted below. |
| 0.9 Orbital comparison | Leslie25 lines 657–671, Lemma 2.5, p.16 | Arbitrary compact test, regular orbit, identical transported torus measure. Orbitwise cutoff and integration in stages justify the noncompact invertible-locus pushforward. |
| 1.1 Relative data | Leslie25 lines 801–822, §2.3, p.20 | Ordinary datum plus two independent form labels and two Hom representations. Positive block ranks avoid the source's two-forms-at-rank-zero mistake. Split E has no proper elliptic block datum. |
| 2.1 Full spherical module | Leslie25 lines 1103–1139, equation (3.7), p.26; Hironaka99 lines 534–539, p.567 | All dominant integral tuples, both form orbits, group convolution action and no intrinsic convolution on X_n. Negative coweights remain present. Rank zero is treated separately. |
| 2.2 Base change and Levi | Leslie25 lines 940–951 and 1089–1099, Lemmas 3.1–3.2, pp.23–25; lines 1740–1815, proof of Proposition 4.8, p.39 | Positive determinant twists; squared Satake variables commute with the scaled substitutions. The README replaces the false even-coweight support argument by the actual algebra identity. |
| 2.3 Hironaka isomorphism | Hironaka99 lines 499–524, (2.2)–(2.3), p.566; lines 633–640, Theorem 1, p.569; lines 687–721, (2.5)–(2.7), Theorem 2, p.571; Leslie25 lines 1140–1179, pp.26–27 | Rendered the scan and inspected printed pp.566 and 571, including the formerly ambiguous exponent/absolute-value formula. U=q^(−z) gives squared E-Satake variables; the inverse argument in the Fourier kernel gives the stated signs. Theorem 2 gives freeness 2^n. Hironaka99 lines 508–509 explicitly include p=2. |
| 3.1 Orbit torsor | Leslie25 lines 1554–1586 and 1612–1623, Proposition 4.5/Lemma 4.6, pp.35–36; Xiao18 lines 929–946, Lemma 4.6, p.20 | Union over pure forms, norm quotient, cyclic reference data and complementary-coordinate character. Empty S₁ has cardinality one. |
| 3.4 Additive descent | Leslie25 lines 1685–1705, Definition 4.9, p.38; lines 1755–1815, p.39 | Additive radical measure and compact average, without a modulus half in the definition. The change u=m₁u′ contributes exactly abs(det m₁)^b. |
| 3.8 Weil reduction | Leslie25 lines 1920–1998, Proposition 5.2, pp.42–43; BP21 lines 192–215, Lemma 1 proof, pp.4–5, and lines 297–303, 337–381, Proposition 1 and sum-space argument, pp.6–8 | Unit-vector transitivity, self-dual Fourier measures, unipotent phases and vanishing by local constancy. The README works in the sum of orbital images and names the stronger all-characteristic lattice contracts rather than silently importing them. |
| 4.3 Product contraction | Leslie25 lines 2329–2375, (7.5)–(7.7), Definition 7.4, pp.50–51; lines 4021–4058, §11.2, p.86 | Left contraction of 1_K⊗φ, Hermitian fibre integral, factor Ω=ω and compatible quotient measures. The index shift is m=n−1, including m=0. |
| 4.4 Rank-shifted comparison | Leslie25 lines 2000–2008, Theorem 5.3, p.43; lines 4021–4058, p.86 | General spherical φ, cyclic determinant factor and the other-form zero clause. The product comparison is an independent declared input. |
| 4.5 Augmented transfer | Leslie25 lines 1920–1924 and 2000–2008, Proposition 5.2/Theorem 5.3, pp.42–43 | Every positive rank and spherical test, with the reference vector-lattice factor and zero component. The module has not been enlarged beyond the cyclic image in this assertion. |
| 4.6 Cyclic endoscopic theorem | Leslie25 lines 1153–1179, Theorem 3.5/Remarks 3.6–3.7, p.27; lines 2006–2008, p.43 | Exactly the cyclic submodule. Finite tensor expansion on the target and unmatched vanishing are retained; the speculative full-module transfer is excluded. |
| 4.8 Determinant degrees | Leslie25 lines 1297–1377, Proposition 3.12, (3.9)–(3.10), pp.30–31 | Integral nonnegative determinant shells, q^(d(n−1))h_d, doubling of determinant valuation and the finite Levi degree sum. The residue cardinality is q_F, not q_E. |

The three headline endpoints were also compared with Leslie25 Theorem 2.12, lines 856–875, p.21, and the final reduction, lines 4021–4058. The independent spectral proof of Theorem 11.1 is not reproved in this review; it is precisely the named supplier contract, not an unstated argument of this package.

### Computed adversarial table

Here π is a uniformizer, q≥2, η is the specified quadratic character, and all unlabelled compact volumes are one. “Retained” means the unchanged numerical instance in the round-2 table was read and its values checked against this text. No row substitutes an elaboration result for a mathematical calculation.

| Statement | Instances | Computed values on both sides or for the excluded model | Result/change |
|---|---|---|---|
| Conventions | Unramified degree two; q=2; ranks 0,1 | Norm valuations 0,2,4 correspond to 0,1,2 upstairs; odd valuations are excluded. q_E=4 and abs(π)_E=1/4. Empty determinant and density=1. | Sound; retained. |
| 0.1 Off-diagonal representation | X=1; split n=1, (g,h)=(2,1) | δ²=−I; δ*=−δ. (A,B)=(1,1) becomes (2,1/2), product 1. Wrong second action gives (2,2), product 4. | Sound; retained. |
| 0.2 Contractions | Forms (1,ε); X=diag(1,π); split X=(1,0) | Rank-one contraction −ε⁻¹. Both rank-two charpolys=(T+1)(T+π²). Split contraction=0. | Sound; retained. |
| 0.3 Quotients | Split (A,B)=(0,1),(1,0); section (−Z,I) | Both scalar invariants=0 despite different orbits; −(−Z)I=Z. Z=diag(1,π) gives trace 1+π and determinant π. | Sound; retained; not rational-surjectivity. |
| 0.4 Regularity | n=1,z=0,1; n=2,A=diag(1,0),B=I | Block charpolys T²,T²+1,T²(T²+1). For X=diag(1,π), charpoly(r₁)=(T+1)(T+π²) and substitution gives (T²+1)(T²+π²). | Sound; zero eigenvalue excluded. |
| 0.5 Torsor | Standard unramified rank one; split fibre | −1 has a lift; −π has none. At split T=1, fibre (u,−1/u) has −uv=1 and a unique transporter between any two points. | Sound; algebraic versus rational surjectivity distinguished. |
| 0.5 Empty-factor kernel | F=ℚ₃,E=F(√2), H₁=diag(1,2), H₂=[[0,−1],[−1,0]], X=I | X^τ=[[0,−2],[−1,0]], r₁(X)=y=[[0,2],[1,0]], charpoly(y)=T²−2. F[y]=E, S₁=∅; H¹(T)=0 and both kernels have size 1. Source proof's 2^(0−1)=1/2 is wrong. | Package sound; source-only error recorded below. |
| 0.6 Sections and cutoff | Chart B×J with vol J=2; rank-one unit orbit | Integral of (1/2)1_(B×J)=1_B; unnormalized lift gives 2·1_B. Cutting 1_O_E by unit determinant gives 1_O_E×. | Sound; retained; denominator positive. |
| 0.7 Relative integral | Nonabelian rank two, X=diag(1,π), permutation w, t=diag(u,1), u≠1 | Left stabilizer translation preserves [[0,1],[π,0]]; right translation gives [[0,u⁻¹],[πu,0]]. Scaling group measures 2,3 and torus 4 gives 3/2. | Sound left quotient; retained. |
| 0.8 Pushforward | Rank-one lattice and invertible unit support | At t=−π^(2j), j≥0, value 1; odd/negative valuation gives 0. Unit-supported test gives 1 exactly at valuation 0. | Sound; full pushforward accumulates at 0. |
| 0.9 Orbital comparison | X=1,π,π⁻¹; torus volume doubled | Relative values (1,1,0), ordinary values at −1,−π²,−π⁻² also (1,1,0); both become (1/2,1/2,0). | Sound. |
| 1.1 Relative datum | a=b=1; split E | Field case has four label pairs; β=ε gives second contraction −ε⁻¹ rather than −1. Split dual-center dimensions 2 versus 1 exclude ellipticity. | Sound. |
| 1.2 Factor | Differences π,unit,0; q=2 | Nice factors −1/2,1; zero difference has D=0 and fails ambient regularity. Polynomial mismatch gives factor 0. | Sound; retained. |
| 1.3 Weighted sum | C₂, orbital values 2,5 | Stable sum 7; nontrivial weighted sum −3; basepoint change gives 3=(−1)⁻¹(−3). | Sound; retained. |
| 1.4 Transfer relation | q=2,A=2; unmatched target | Matching target must be −1, not 2; unmatched stable value must be 0, not 1; stable-null addition changes B to B+0. | Sound; both clauses tested. |
| 1.5 Invertible-support transfer | Unit support; lift with vol J=2 | 1_O_E× pushes to 1_O_F×. Full lattice gives 1 at π^(2j)→0. Normalized lift gives 1_B, not 2·1_B. | Sound restricted theorem; retained. |
| 2.1 Module | n=0,1; d=±1; j=−1,0,1 | Rank-zero basis size 1. Rank-one π^d Hecke shell sends e_j to e_(j+2d); e_−1,e_0,e_1 have disjoint nonempty supports. | Sound; all form classes and negative grades retained. |
| 2.2 Base-change square and new API | a=b=1,q=2; first shell and central monomial | Both composites send Z to X²/2. ξ_E(Z₁Z₂)=XY/4. ξ_F(T_(1,0),F) has coefficients q⁻¹vol(π⁻¹O)=1 and 1. BC(T_(1,0),E)=T_(2,0),F−T_(1,1),F. | Sound; new API matches formula and unit. |
| 2.3 Fourier isomorphism | n=1,j=−1,0,1; n=2,λ=(1,0),(2,0),(1,1) | ê_j=(−1)^jU^j, so U↦−T gives T^j. Rank-two volumes q−1,q(q−1),1; transforms √q(U₁+U₂), q(U₁²+U₂²)+(q+1)U₁U₂, −U₁U₂. Cyclic sum maps to q(T₁²+T₂²). | Sound; scan independently resolves signs. Module ranks 1,2,4 for n=0,1,2. |
| 3.1 Orbit torsor | #S₁=0,1,2; ζ=(ε,1) | Torsor sizes 1,2,4. κ_{1}(ε,1)=1, κ_{2}(ε,1)=−1; using Σ instead of its complement swaps these. | Sound. |
| 3.2 Raw germ | Rank-one tests O×,πO×,O | Values 1,−1, and (1+q^(−s))⁻¹ at s=0=1/2. The split-factor coordinates are zero. | Sound; retained; no hidden averaging. |
| 3.3 Germ inversion | r=0,1,2; v=1 then π | Character matrices satisfy HHᵗ=I,2I,4I. Unit orbital vector (1,0) inverts to 1/2. With v=π, ω=−1 and G=−1/2, still ωG=1/2. | Sound; source averaging error corrected. |
| 3.4 Additive descent | a=b=1,m₁=π; integral/nonintegral vector | Additive Jacobian=q⁻¹. Half twists times δ_P^(1/2) also give q⁻¹. Integral lattice test descends to 1 at integral coordinates, 0 at a nonintegral one. | Sound. |
| 3.5 Ordered cyclic factor | a=b=1,x_a=0,x_b=1,E=ℚ₃(√3) | D=−1, det[v,xv]=1. η((−1)D)=1; unsigned η(D)=−1. Unramified D=π has off-block modulus q⁻¹ and inverse Jacobian q. | Sound general determinant identity. |
| 3.5 Repaired mixed descent | E=ℚ₃(√2), x=diag([[0,2],[1,0]],1), v=(1,0,1), v*=e₁*+e₃* | S₁(a)=∅, S₁(b)={b}; D=−1 and full cyclic determinant=−1. At I and diag(3,3,1), wrong vector e₁ gives (1,0), corrected vector 0 gives (0,0), zero-vector positive control gives (1,1). | Repaired; the outer quotient now has consistent values. |
| 3.5 Unipotent step | N element [[I,U],[0,I]] | N(v_a,0)=(v_a,0); (0,l_b)N⁻¹=(0,l_b). Determinant of U↦x_aU−Ux_b is D_ab; its absolute inverse is the descent factor. | Sound on the repaired truncated arguments. |
| 3.6 Repaired character cancellation | a=b=1, v=(1,1), v*=(c_a,c_b), η(c_b)=−1 | Reference b-form requires η(ζ_b)=η(c_b)=−1; source basepoint κ also −1. Their ratio=1. r_n=2=1+1 gives 1/4=(1/2)(1/2). | Repaired; no unaccounted sign or factor 2. |
| 3.7 Sum action | Two decompositions differing by C; trace at u=w=w′=1 | Image difference W_GL(C)−W_U(C)=0. Trace gives Tr(2)=4=2+2; norm gives 4≠1+1. | Sound; retained; sum is required for the defect. |
| 3.8 Weil reduction | Integral norm-one w; q(a)=π or a unit | p(w)=w and p²=p. ψ(tπ)=1 for t∈π⁻¹O. For a unit choose t giving ψ(tq(a))≠1. Three unipotents give [[0,π⁻¹],[−π,0]], then diag(π⁻¹,π); conjugation scales by π⁻². | Sound including p=2; union of parameter balls is F. |
| 4.1 Sign transport | N(c)=−1; X=diag(1,π); ramified ℚ₃(√3) | r₋(cX)=diag(1,π²)=r₊(X). Norm-one c leaves the negative diagonal. Ramified unit norms reduce to squares mod 3, excluding −1. | Sound unramified scope; retained. |
| 4.2 Cyclic contraction | Rank-one shells d=1,−1 | Pushforward and cyclic action give e₂,e_−2 respectively; both vanish at odd target valuation. | Sound; retained. |
| 4.3 Product test | vol K_m=1,2; m=0 | Contraction gives φ,2φ respectively; trivial group gives φ. Ω(I,γ₂)=ω(γ₂); n=1 factor=η(1)=1. Hermitian π^d shell gives e_(2d). | Sound. |
| 4.4 Adjacent-rank headline | n=1,φ=1_(π^dO_E×) | Both sides equal 1_(π^(2d)O_F×), factor 1; odd valuation gives 0 on both. | Sound; higher-rank proof uses declared independent supplier. |
| 4.5 Augmented transfer | n=1,x unit,v=v*=1; φ=π-shell | Linear integral over O_F×=1, unitary integral=1, other test=0. π-shell matrix valuations are 2 on both sides and both tests vanish at valuation 1. Raw germ remains 1/2. | Sound; regular and germ values distinguished. |
| 4.6 Cyclic headline | φ=1_K and c_2,1 | Unit pair e₀,e₀⊗e₀. First shell target=e₂⊗e₀+e₀⊗e₂. Rank-one e₁ cannot lie in the span of e_(2d). | Sound cyclic scope. |
| 4.7 Lattice grades | n=0,1,2; Gram diag(π²,1),πI₂; q=2 | Rank-zero density and count=1. Rank-one grades −1,0,1,2 give 0,e₀,0,e₂. Overlattice counts 1,q+1=3 give e_(2,0)+3e_(1,1). Rank-two self-density=(1+1/2)(1−1/4)=9/8>0. | Sound; retained, density denominator nonzero. |
| 4.8 Shell API and degree identity | n=1,2; d=0,1,2 | Satake values Z^d; 1,q(Z₁+Z₂),q²h₂. At n=2,d=2 the cross coefficient (q²−1)+1=q². Levi images 1,X+Y,X²+XY+Y². Exponents d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1). | Sound; repaired API; d+1 degree pairs. |
| 4.9 Equivalence | Four label images; a=b=1,d=1 | Target at valuations (2,0) is 1, at (1,1) is 0. Single (π,1) image has odd total valuation and cannot match the even source. Doubling source preserves that vacuous single-image relation but changes the reference identity from 1 to 2. | Sound simultaneous quantifier; retained. |
| 4.10 FJ headline | a=b=1; dyadic q=2; grade 2 | Targets (tensor unit,0,0,0), including zero at (π,π). Nice difference π gives factor −1/2. Grade 2 target has exactly two terms, coefficient 1 each. | Sound, conditional on declared inputs. |
| 5.1 Full operator and dictionary repair | n=2,a=b=1,q=2; e₀,e_(1,0),e_(1,1),e_(2,2) | Images e₀⊗e₀, −(e₁⊗e₀+e₀⊗e₁), −(1/2)e₁⊗e₁, (1/4)e₂⊗e₂. Both consistent dictionaries agree; mixed ranks give the positive degree-one sum. | Sound; repaired Check distinguishes the actual wrong model. |

For the new S₁=∅ source test in §0.5, H₁y=[[0,2],[2,0]] is Hermitian, H₂=−H₁y⁻¹, and X=I realizes the contraction. The block polynomial is T⁴−2, separable in characteristic zero, so this is inside the regular invertible locus, not an excluded singular example. The package uses the kernels themselves, so both sides have one element. It does not use the erroneous cardinality formula. In the same example the torus has F-points E× and maximal compact O_E×; this also detects the omitted split-factor compact units in Leslie19's measure paragraph. The package instead fixes the actual maximal compact subgroup, as does its supplier.

### Pinned libraries, headline coverage and Lean

Read the manifest pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened all eleven named pinned declarations and their hypotheses:

| Pinned file | Declaration / content checked |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43` | `Matrix.conjTranspose`, body `M.transpose.map star`; rectangular source/target. |
| `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45` | `Matrix.IsHermitian`, body `Aᴴ = A`. It includes no nondegeneracy, local-field or measure hypotheses. |
| `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:286`, `:290` | `Matrix.isHermitian_mul_conjTranspose_self`, `Matrix.isHermitian_conjTranspose_mul_self`; rectangular products under the star-semiring binders. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`, `:279` | `Matrix.charpoly`, `Matrix.charpoly_mul_comm`; determinant of TI−A, and square AB/BA over a commutative ring. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312` | `MvPolynomial.hsymm`, finite sum of degree-d monomials; degree zero=1. |
| `Mathlib/Algebra/MvPolynomial/Monad.lean:67` | `MvPolynomial.bind₁`, body `aeval f`, an algebra substitution map. |
| `Mathlib/Analysis/Calculus/Implicit.lean:452`, `:465` | `HasStrictFDerivAt.implicitFunction`; complete nontrivially normed field and source, finite-dimensional target, strict derivative with range top. The package distinguishes the analytic norm from normalized Haar absolute values. |
| `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126`, `:158` | `TauCeti.map_normUnits_unitFiltration` and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`; unramified finite extension with compatible valuations; all filtration depths; norm criterion only for x:Kˣ. |

Object searches covered Hermitian matrices, adjoints, matrix unitary groups, local norms, Hecke convolution, Satake, orbital integrals and Jacquet–Rallis/Friedberg–Jacquet comparison at both pins. The nearby arithmetic Hecke ring is `TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean:15`, with the positive p-local presentation described in `PolynomialRing/Presentation.lean:15`. It is not the analytic spherical module or the orbital-integral comparison. `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:15` concerns the roots of classical newform Euler polynomials. None supplies the missing analytic comparison carriers.

The five headline theorems from the summary and final layer are:

| Headline | Suggested.lean coverage |
|---|---|
| §4.10 Friedberg–Jacquet unit theorem | Lines 12–18 name it and the missing arbitrary-form locally compact unitary groups, quotient measures, rational stable classes and factor/orbital interfaces. |
| §4.6 Cyclic spherical endoscopic theorem | Lines 19–23 name the analytic spherical Hecke/module and transfer-factor interfaces it lacks. |
| §4.4 Adjacent-rank spherical Jacquet–Rallis comparison | Lines 24–27 name the matching, twisted orbital distributions and base-change carriers it lacks. |
| §2.3 Hironaka's isomorphism | Lines 28–31 name the spherical functions, analytic Hecke algebra and normalized Satake transform it lacks. |
| §5.1 Full Fourier-defined Levi operator | Lines 32–33 identify the same missing Fourier/Hecke carriers. |

None becomes statable by adding only a few simple native definitions. No free-predicate surrogate, abstract scalar identity or boundary theorem is substituted. Suggested.lean has the single import Mathlib, one module docstring, the required namespace and **zero declarations**. Consequently the exhaustive one-tactic probe has zero sorried theorems to try, and the requested `#check @name` binder comparison has zero signatures to compare. No hypothetical proof or hidden sample is claimed. There is no padding, admitted data, admitted example, set_option or extra import.

Ran `lake env lean` on the absolute package Suggested.lean path from the content checkout: **exit 0; no output, warnings or errors**. There was no TauCeti import to build. The process finished and none was left running.

### Supplier resolution, ownership and merge order

Resolved citations against main for existing main roadmaps and against the indexed open heads for new roadmap folders. Source quotations in a supplier were treated as data, not instructions. The following locations are repository file lines, excluding the one-line wrapper added by `roadmaps show`.

| Owner and file | Resolved sections and objects |
|---|---|
| #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` | §§1.1:166, 1.4:288, 1.5:323, 1.14:555, 1.17:638, 2.1:688, 2.4:764, 2.9:891, 2.11:948, 2.12:979, 3.3:1141, 4.7:1855, 4.9:1912. These supply the cohomology, pure-form isometry torsor/inv, characteristic quotient, ordinary orbital sums, transfer and base-change interfaces claimed. §2.12 is still odd-unramified; its extension is explicitly a gap. |
| #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | §2.7:703, `IntegralHermitianLattice.ofCarrier`:705 and `.dual`:716; §2.9:769, `SignedHermitianSpace` and `signedHermitianAdjoint`:773; §3.2:879, densities and their dyadic normalization:881–905. The unresolved-name lead is a real roadmap target at 705, not a missing library declaration. |
| #792, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` | §2.2:1773, quotient-measure:1852. Includes the imported Weil formula, Borel/integrable versions, measure scaling and stages; local reductive groups/tori satisfy the unimodular hypotheses. |
| #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` | SR.4.1:3191, satake-isomorphism:3252; SR.4.3:3355, parabolic-descent:3422. Its E-field twists are q⁻ᵇ,q⁻ᵃ; the F-field variant here is explicitly distinguished. |
| #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` | §2.1:402 (`weilIndex`:404), §2.5:520 (`weil_generators`:522), §3.2a:606 (`splitHermitianOscillator`:608). Pairing order, polar trace kernel and Weyl/scalar conventions were read. The split carrier with sign +1 agrees, including rank zero; its oscillator comparison is not re-owned. |
| Main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640` | RG2.0 smooth-group-analytic-charts: characteristic-zero local analytic structure and Haar Jacobians. No unsupported rational-surjectivity assertion is extracted from smoothness. |
| Main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3174` | §1.24: continuous semilinear affine Galois descent, with finite-Galois automatic continuity. Applies to the split-coordinate invariant-ring argument. |

Read the relevant shape and scope portions of the last two main roadmaps as house-style examples. All 36 Needs lines and all layer Dependencies paragraphs were compared with these contracts. The seven backticked supplier targets and eleven pinned declarations account for every code-formatted identifier attributed to an owner; this roadmap claims no undeclared Lean name.

Ownership search used `roadmaps grep` by object over main and open heads, plus the package-tree search and the supplied board-package index. The three separately indexed board packages are unrelated to these local Hermitian objects. The closest open scopes were read:

- #1404, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:5`, `:146`–155: Bessel models and global/local GGP periods; local Jacquet–Rallis transfer is assigned to the same base supplier. It does not own the X_n Fourier module or the relative FJ lattice theorem.
- #1756, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:5`: classical/generalized doubling, local factors and their comparisons, not the present symmetric-space transfer.
- #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:5`: exceptional theta and minimal models, not this unitary symmetric space.
- #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:969`–1034: Hironaka theory for U(2n)/(U(n)×U(n)) and Siegel densities, explicitly a different space. The generic carriers and density formula remain with that supplier.
- #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:402`, `:520`, `:606`: generic Weil and split-Hermitian constructions are imported; the defect reduction here is an application to its orbital-image sum.

No duplicate ownership or fully qualified Lean-name collision was found. A fresh search for this Part II roadmap's full name found no consumer on main or the open heads, supporting README line 855. The supplied overlap report has no conflicting head, dropped cited id, id supplied only by an open revision, or removed id needing a numbering map. Its vocabulary neighbors were checked rather than treated as evidence of disjoint ownership by themselves. No main-roadmap revision was used as a new supplier.

All seven slugs and needs sentences agree between README Exact supplier contracts and the top-level gaps in `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json`:

1. `jr-local-comparison`: local augmented/block comparison, factors, orbital distributions and product contraction interface.
2. `jr-weil-descent`: agreement of descended Weil actions on orbital images.
3. `jr-product-base-change`: independent product-group spherical comparison, including all zero components and rank zero.
4. `unitary-factor-all-quadratic`: extension of the base's odd-unramified formula to all quadratic characteristic-zero p-adic extensions.
5. `hermitian-field-classification`: missing dyadic/ramified classification in the standing nonarchimedean setting.
6. `unramified-hermitian-lattice-orbits`: integral congruence representatives and self-dual isometry, including p=2.
7. `unramified-unit-vector-transitivity`: unit-vector orbit statement, including rank one and p=2.

These are named earlier-supplier interfaces with the required measures, fields and source locators; none asks the supplier to assume the FJ conclusion. The local comparison bundle consists of the interlocking objects of that one transfer interface; the Weil descent and independent product theorem are separate contracts. The density carrier alone does not supply the integral orbit/transitivity obligations. Their absence today is not a finding.

The prescribed dependency command returned:

```text
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The merge order was not changed.

### Shape and policy

There are six layers, 36 numbered sections, 16 explicit definition API lists, and at least three Checks per numbered section (range 3–7). Every numbered section has its own Needs line; every layer ends with Examples and Dependencies. The new ξ_F and c_n,d APIs resolve the prior omissions. No machine path, pull-request number, HTML anchor, workflow residue, LaTeX delimiter, computational procedure, lemma declaration or forbidden Lean option was found in the roadmap/Lean text. Metadata remains the math.NT topic. The five-work manifest has no duplicate source key or missing cited work.

## Not verifiable

- No sampled source text is unavailable. The older Hironaka OCR limitation was resolved by viewing the cached publisher scan; it is not being carried forward as an unresolved normalization claim.
- Published Annals/Duke pagination was not separately compared with the preprints. The package explicitly cites the recorded arXiv versions and their pagination, so it makes no unchecked numbering identification.
- The seven supplier gaps remain conditional mathematical obligations. This review checks their precision, ownership and use; it does not assert that their future formal proofs already exist. In particular it does not independently reconstruct the spectral proof of Leslie25 Theorem 11.1.

## Source issues

The errors below are in the cited texts, not unrepaired package findings. For the first two, the source witnesses are Leslie19 lines 633–639 and 284 respectively; the explicit empty-factor example is computed above. The other items were encountered again while checking the reductions and their corrections. No published correction is asserted.

- **Error** in Leslie19 at proof of Lemma 3.9, printed p. 13: the source says the kernel cardinality is 2^(#S₁−1) without an empty-set exception; it should be 1 when S₁ is empty; affects the proof.
- **Error** in Leslie19 at measure paragraph after Lemma 2.1, printed p. 6: the source says the nonsplit-factor product gives the maximal compact subgroup; it should also include the compact-unit factors from S₂; affects a stated result.
- **Misprint** in Leslie25 at Lemma 1.8, printed p. 12: the source says the centralizer of an endomorphism of V lies in U(W); it should say U(V); affects nothing.
- **Misprint** in Leslie25 at §2.2.3, printed p. 19: the source says the endoscopic embedding is η; it should retain ξ and reserve η for the quadratic character; affects nothing.
- **Error** in Leslie25 at §2.3, printed p. 20: the source says every rank has two Hermitian form representatives; it should give one in rank zero and two in positive rank; affects a stated result.
- **Misprint** in Leslie25 at Remark 4.4, printed p. 35: the source says the appendix contributor's surname is Gordan; it should be Gordon; affects nothing.
- **Misprint** in Leslie25 at proof of Proposition 4.8, printed p. 38: the source says the upper augmented test has matrix factor φ; it should have matrix factor φ∗e_0; affects nothing.
- **Error** in Leslie25 at §5.1, printed p. 40: the source says the Hermitian Fourier kernel uses the norm of the pairing; it should use the trace with self-dual measure; affects the proof.
- **Error** in Leslie25 at proof of Proposition 4.8, printed p. 39: the source says base change is supported on even-entry coweights; it should allow the rank-two (1,1) coefficient −(q−1); affects the proof.
- **Error** in Leslie25 at Theorem 4.7, printed p. 36: the source says the raw germ is the unaveraged character sum; it should include 2^(−#S₁) with volume-one raw germs; affects a stated result.
- **Error** in Xiao18 at inversion and Theorem 4.7, printed pp. 20–21: the source says finite Fourier inversion uses the unaveraged sum; it should divide by 2^#S₁; affects a stated result.
- **Gap** in Leslie25 at Proposition 4.8, printed p. 38: the source says Xiao's construction supplies its four-form sign combination; it should justify conversion from the second-form-dependent signs; affects the proof.
- **Gap** in Leslie25 at proof of Proposition 5.2, printed p. 43: the source says the defect carries the action in the intersection of orbital images; it should extend the agreeing actions to their sum first; affects the proof.
- **Misprint** in Xiao18 at proof of Theorem 6.1, printed p. 24: the source says the ordered cyclic ratio is η(D_ab); it should be η((−1)^(ab)D_ab) for the stated block volume order; affects a stated result.
- **Gap** in Leslie25 at Proposition 4.8, printed pp. 37–38: the source says its spherical hypothesis is only in rank n; it should include the two block ranks used again in its proof; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2131a2bf47f5f9646f790629beb1aee0d280835b", "job": "REV-PKG-EndoscopicTransferAndUnitaryTraceComparisonPartII~3", "model": "gpt-6-astra", "worker": "chris-33"} -->
