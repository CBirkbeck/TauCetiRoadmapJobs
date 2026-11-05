<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1273#issuecomment-6422857697 -->
Red team round 1 pass a (codex) of b4df225

Verdict: needs_changes

1. **F01** (P2) The acceptance theorem omits the degree-one number fields

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:975` and `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean:65`: “For D=1 use C max(1,h(j(E₁)))² instead.”

   Claim: §6.1 gives the elliptic j-height estimate over every number field, but its sole acceptance theorem requires D≥2. The missing part is statable on precisely the same pinned carriers.

   Witness: k=ℚ, E₁=E₂:y²=x³+1 has D=1, j=0, h(j)=0 and identity degree 1. The README bounds 1≤C; the Lean hypothesis 2≤1 excludes this instance entirely.

   Exact repair text: Replace the D≥2 restriction and the factor `(Real.log D)^2` in the existing theorem by a theorem for all number fields with factor `(max 1 (Real.log D))^2`. State the corresponding unified bound in §6.1, retaining its displayed D≥2 form as a consequence. Do not add a separate boundary-case theorem. At D=1,j=0 the new right side is C; at D=2,j=0 it is 4C. Enlarging the absolute constant recovers both original README bounds.

2. **F02** (P1) The principalization step does not cite its owner

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:479`–481: “use an isotropic kernel quotient of degree sqrtδ”.

   Claim: The general-polarization proof imports finite-flat quotients from A3.3, but also needs existence of a maximal isotropic kernel and descent of a principal polarization. A3.3 only constructs a quotient of an already supplied subgroup.

   Witness: `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1663`, A3.11, explicitly owns `principalQuotient`, including the isotropic subgroup and theta-extension splitting. A3.3 (line 1412) does not supply their existence.

   Exact repair text: Add “AbelianSchemesAndArithmeticModuli A3.11 supplies the principally polarized quotient and its degree √δ” to the contract and §2.6 Needs. Separate the quantitative field-of-definition estimate as a named target of §2.6: “For a dimension-g polarized abelian variety over k, with polarization map-degree δ, the principalizing quotient can be defined over a finite extension k₁/k with [k₁:ℚ]≤c_g[k:ℚ]δ^g.” Cite mw94-preprint §5, internal p. 9 (lines 348–350), and its cited mw93-periods Lemma 5.3 for this quantitative refinement; do not attribute a degree bound to A3.11. For an elliptic degree-three line, δ=9 and the quotient degree is 3, while the field-degree allowance is 9c₁[k:ℚ].

3. **F03** (P3) The determinant comparison points to an off-diagonal projection identity

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:257`: “internal p12, equation (6.2)”.

   Claim: The locator is attached to the identification of degree with the determinant of the lattice map.

   Witness: mw94-preprint line 428, equation (6.2), is the block projection extracting off-diagonal Hom entries. The proof of Lemma 2.3, line 149, explicitly identifies isogeny degree with the absolute lattice determinant.

   Exact repair text: Replace this locator by “mw94-preprint, Lemma 2.3 proof, internal p. 4 (line 149), for degree as absolute lattice determinant; §6, internal p. 11 (lines 433–438), for the homogeneous degree polynomial.” Keep the oriented Hom extension as the proof supplied here. The check [−2] on an elliptic curve still gives determinant and degree 4.

4. **F04** (P3) The elliptic worked example turns an upper bound into equality

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:993`: “both the imported bound and the j-form equal 36C₀”.

   Claim: At D=2,j=0 the imported expression C₀D²H² equals 36C₀.

   Witness: H=max(1,h_F(E),log 2)=1 for the j=0 CM curve, whose stable Faltings height is negative. Thus the imported expression is 4C₀; the j-form is 36C₀.

   Exact repair text: “At D=2 and j=0, the imported expression is 4C₀. Replacing H by its upper bound 3 weakens it to 36C₀, which equals the displayed j-form with C=9C₀/(log 2)².” This gives 4C₀≤36C₀, rather than the false equality. The proof in line 987 already uses the correct inequality.

5. **F05** (P3) Layer 2 is not ordered by its proof dependencies

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:373` and `:433`: “the multiplicity and interpolation targets of §§2.2a–2.2b”; “§2.5”.

   Claim: The period theorem is placed before its multiplicity/interpolation inputs, and the period-basis theorem before the Siegel height estimate it uses. These are explicit forward proof dependencies, although they do not form a cycle.

   Witness: The input blocks start at README lines 383, 397 and 461; their consumers start at lines 367 and 427. The local dependency edges are 2.2→2.2a, 2.2→2.2b, and 2.3→2.5.

   Exact repair text: Order Layer 2 as minimal period subvariety; multiplicity estimate; auxiliary sections and its tangent-height inputs; period theorem; cusp value bound; Siegel imaginary-part bound; short period bases; short endomorphisms; discriminant estimate; off-diagonal isogeny; polarized isogeny. Renumber the sections and update their references. In this order each of the three witnessed edges points to an earlier block; the mathematical statements are unchanged.

6. **F06** (P3) Several Checks only repeat the theorem or proof requirements

   Location: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:1095`–1097 and `:1179`–1181: “The same M′ works for every extension of degree≤d”; “Integral End equality uses saturation”.

   Claim: These bullets are presented as Checks but specify neither an instance nor an output that could distinguish a wrong construction. The same issue occurs at lines 531, 799, 813, 829, 831, 877, 879, 909, 911, 955, 1079, 1081, 1111, 1113, 1127 and 1129.

   Witness: The two bullets at 1095–1097 repeat exactly the simultaneous quantifiers and the two conclusions at 1087. The bullets at 1179–1181 repeat 1171–1173. Neither pair adds a test case.

   Exact repair text: Move these scope and proof requirements into their statements or proof routes, deleting duplicate bullets from Checks. Keep the numerical and negative-control bullets. For §8.2 add: “For a Legendre family, generic geometric End has rank 1, whereas the fibre at parameter −1 has j=1728 and geometric End rank 2; this fibre is not an End-preserving specialization. A saturated inclusion ℤ→ℤ², n↦(n,0), has torsion-free cokernel ℤ but unequal ranks, so saturation alone also does not imply equality.” These compute respectively 1≠2 and cokernel rank 1, supplementing the existing index-two nonsaturation test.

## Verified sound

Read all 1,306 README lines and all 76 Lean lines, the repository rules, the plan, the source manifest, and both repair reports. Coverage: **3 Lean declarations; 50 numbered target blocks; 52 Check blocks containing 182 bullets; 9 live named supplier contracts**. All 52 Check blocks were evaluated through the instances below; repeated bullets share a computation, and prose-only bullets are distinguished in R06. The additional targets embedded in §§2.2b, 2.4, 5.4 and 8.1 have separate rows below. There are no separate bold mathematical target headings: the bold Summary and Checks labels introduce the targets and tests inventoried here.

The supplied elaboration record contains all three full types. I compared those types with the file and README; no section binder disappeared. I did not run Lean or a build. The one-tactic probe found **no padding among the two theorems**: the class-index theorem needs the noncommutative norm-body argument; the elliptic theorem is a uniform arithmetic assertion, not a consequence of its geometric-isogeny existence hypothesis. The sole definition is needed by the class-index theorem.

The headline inventory is: period theorem; short-endomorphism and discriminant bounds; polarized rational isogeny bound; class-index bound; polarization-free discriminant bounds; quantitative simple factorization (including relative fields); unpolarized rational, relative and geometric isogeny bounds; quadratic elliptic j-height bound; adelic algebra product comparison; residual refinement; uniform number-field integral bound; finitely generated field Tate comparison; End-preserving specialization; supported-image and full finitely generated field index bounds. The Lean file states the class-index and elliptic headlines. Its module docstring identifies the missing polarized complex-lattice, stable-height, abelian-degree and abelian-Tate realization interfaces for the others. R01 concerns a statable part of the elliptic headline, not a request for an extra boundary-case theorem.

### Lean declaration/context table

Every declaration lies in `TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII`. There are no ambient `variable` blocks. The following are the actual retained contexts, not inferred README assumptions.

| Declaration / section | Retained context | Instances and computed values | Result / change |
|---|---|---|---|
| `regularOrderDiscriminant`, Layer 3, line 35 | D : Type, Ring D; Subring O; m : ℕ; integral basis indexed by Fin m | O=ℤ: matrix (1), det 1. O=ℤ[i]: diag(2,−2), det −4. O=ℤ[2i]: diag(2,−8), det −16. ℤ[ε]/ε²: diag(2,0), det 0. Zero ring with empty basis: det 1. | Real body; broader definition does not assert nondegeneracy. Division/semisimplicity is required only by subsequent assertions. |
| `class_index_bound`, Layer 3, line 45 | DivisionRing D; Algebra ℚ D; finite rational dimension; O and its integral basis; full rational span of O; e>0; O-submodule M⊂Dᵉ; finite ℤ-generation; full rational span of M | O=ℤ,e=2: index 1≤1. O=ℤ[2i],M=ℤ[i],e=1: least index 2≤√16=4. M²: exhibited index 4≤16. e=0 is excluded; its natural extension would give 1≤1. | Truth/generalities agree with §3.5. Nonzero native index explicitly excludes infinite quotient. Opposite algebra supplies right modules. |
| `elliptic_isogeny_j_height_bound`, Layer 6, line 64 | ∃ absolute C>0 before k; Field k; NumberField k; finrank≥2; two native Weierstrass curves and both IsElliptic instances; geometric-isogeny Nonempty; geometric output isogeny | j=0,D=2: identity degree 1, RHS 4C(log 2)². D=1: excluded, while unmodified RHS would be 0. For a nontrivial quadratic twist of non-CM E: geometric degree 1 but rational Hom 0. | Correct geometric direction and uniform quantifiers; R01 repairs missing D=1. No arbitrary height predicate or sorry'd data. |

### Computed target table

In this table E denotes a non-CM elliptic curve unless CM is stated, q is the squared Rosati norm, and unspecified positive constants retain exactly the dependencies in their target. Substituting an instance into an unspecified-constant bound tests its normalization and hypotheses; it does not numerically certify that constant for all varieties. Char-p, inseparable and equal-characteristic-DVR cases are outside the characteristic-zero arithmetic statements. The inherited isogeny definition still retains inseparable degree. Zero-ring and non-semisimple inputs were tested on the definition that admits them, not silently admitted to division algebras or number fields.

| Target and location in README | Instances tried and values on both sides | Result / change |
|---|---|---|
| 1.1, line 137: representations, basis change and composition | Gaussian E, v=i: ρ=[[0,−1],[1,0]], P=(1,i), κP=(i,−1)=Pρ. v=−2: both sides −2P. √2 fails to preserve ℤ+iℤ. g=0: traces 0=0. On E² the shear matrix is non-scalar and conjugates under a basis swap. | Signs and domains agree; lattice preservation excludes arbitrary complex multiplication. |
| 1.2, line 175: Rosati norm | E: q(1)=q(i)=q(−1)=2, length √2; q(0)=0. E² shear N=1: q=6 versus q(identity)=4; degree remains 1. | Real norm, abelian trace and absolute value consistent. |
| 1.3, line 207: Rosati discriminant | ℤ: 2; Gaussian basis: det diag(2,2)=4; index-two suborder: det diag(2,8)=16=2²·4. M₂(ℤ) product Rosati: determinant 16. Rank zero: 1. | Positive Gram determinant, square-index law and empty convention correct. Nonprincipal pairing is not asserted integral. |
| 1.4, line 241: product inequality | E scalars 2,3: q(6)=72≤8·18=144. E² shear S: q(S²)=12≤6²=36. With zero factor: 0≤0. | Submultiplicativity, not multiplicativity. |
| 1.5, line 255: degree determinant | [−2] on E: det 4=degree 4. diag(1,0) on E²: 0=0; shear: 1=1. g=0: empty determinant 1=degree 1. | Positive orientation and nonisogeny convention correct; R03 corrects locator. |
| 1.6, line 273: degree inequality | [−2] on E²: degree 16=(16/4)². Shear: 1≤(6/4)²=9/4. Rational [1/2] on E: degree 1/4=(q/2), q=1/2. g=0 would divide by zero. | g≥1 retained; rational extension compatible. |
| 1.7, line 289: coordinate trace | Gaussian i: real trace 2=2 Re(i·conj(i)); unconjugated expression −2 and missing-factor expression 1. Basis 1,i: realified Gram diag(2,2), determinant 4; complex Gram alone has determinant 0. | Source corrected, not copied; see Source issues. |
| 1.8, line 305: weak Siegel coordinates | τ=2i, κ=2i: (a,b,c,d)=(0,4,−1,0), q=8; b and c scales 2 and 1/2. τ=it, identity: a=d=1,b=c=0. | Reciprocal scalings consistent; x-bound and upper y-comparison are retained here. |
| 2.1, line 337: minimal period subgroup | E² periods (η,η),(η,0),0: subgroup dimensions 1,1,0; normalized degrees 2,1,1. Simple E and η≠0: subgroup E, degree 1 for principal L. | Connected minimal subgroup is not always ambient G. |
| 2.2, line 367: period theorem | Zero period: left degree 1, RHS≥C≥1. Elliptic L of degree 3: normalized degree 3, polarization-map degree 9. Principal nonzero elliptic period: left degree 1. | q is squared norm; constants may depend on polarization degree; R05 reorders inputs. |
| 2.2a, line 383: multiplicity | Elliptic degree-two line: two reduced points give 2·1=2; a double point also gives 2·1=2, not point-count 1. Zero section on length 3 would give 3≤2; empty S gives 0≤2. For L^D, factors are D^dimB and D^g. | Nonzero s and g≥1 essential. This subsection explicitly uses unnormalized d_L, so no missing factorial. |
| 2.2b, line 397: jets and truncation | dim W=1, orders 0,1,2: lengths 1,2,3. dim W=2, order 2: length 6, degree-two graded dimension 3; omitting mixed derivative gives only 5. At order 0 the scheme is a reduced point. | Full jet scheme and Symⁱ(W∨), not merely its support. |
| 2.2b, line 407: interpolation/noninjectivity | g=2,M=N=2, primitive γ: P has exact order 2; union lengths 9+5=14, not 19. Principal D=4: source dimension 16, target 14, kernel≥2. Type (1,2): source 32, kernel≥18. | Sufficient inequalities need not be necessary. Base degree d is [k:ℚ], as in the source; arbitrary symmetric ample L is covered by the live cubist contract. |
| 2.2b, line 417: tangent-height upper bound | B=0: h=0 and log d_L(B)=0; RHS≥c_g. L→L⁴ on rank b: height increases b log 2 and log degree increases b log 4. | Metric and unnormalized intersection conventions compatible. |
| 2.2b, line 417: tangent-height lower bound | F=0: 0≥−c_g max(1,h_Del,log d_L(A)). A degree-two scalar extension multiplies both arithmetic degree and normalization denominator by 2, leaving h unchanged. | Includes finite extensions and rank zero; source proof locator verified separately. |
| 2.3, line 427: short integral period basis | B=0: empty basis, Δ=1. ℤ² vectors (1,1),(1,−1): det −2, index 2, hence not a basis. Standard ℤ² basis: lengths 1,1; shear basis second length √(N²+1). | Needs bounded integral basis, correctly imported from HeightsAndUnits; R05 fixes forward dependency. |
| 2.4, line 443: fixed cusp value | Nonzero value of absolute size e⁻²: logarithm 2. Rescaling by e⁻ᴺ gives N+2, defeating a constant independent of that rescaling. Zero has no permissible reciprocal in this analytic statement. | Fixed rational family and trivialization essential; underlying primary evaluation proof waived. |
| 2.4, line 447: arithmetic theta evaluation | Same value gives 2≤c_g D max(1,h_Θ); arbitrary rescaling gives N+2 with unchanged geometric A. | Distinct named input; not supplied just by existence of cusp sections. |
| 2.5, line 461: imaginary-part height | τ=100+it and τ=it, δ=1,t≥1: same y=t and same conclusion. From e⁻²≤M e⁻ct obtain ct≤log M+2. | No illicit real-part or upper-comparison assumption. |
| 2.6, line 475: short End spanning | End_k(E)=ℤ: q(1)=2. ℤ² diagonal vectors span ℚ² but index 2 integrally. Elliptic L degree 3: δ=9, principalizing degree 3. | Rational span is not claimed to be an integral basis; principalization needs R02. |
| 2.7, line 491: End discriminant and basis | Non-CM E: Dλ=2,q(1)=2. Gaussian geometric End: Dλ=4,q(1)=q(i)=2. y²=x³−x over ℚ versus ℚ(i): End ranks 1 and 2. | Geometric and rational End distinguished; bounded field extension needed. |
| 2.8, line 507: off-diagonal isogenies | E×E swap: q=4,length 2; Rosati D=16, √D=4, so 2≤4C₁. Diagonal identity has degree 1 but both off-diagonal degrees 0. | Simultaneous nonvanishing directions tested; polynomial degree 4g is appropriate on A×B. |
| 2.9, line 521: polarized rational bound | A=B: minimum degree N=1 and log N=0; multiplication by 2 on E has degree 4 and height change 0≤½log4. | Minimum, not an arbitrary isogeny degree, used in logarithm absorption. |
| 3.1, line 551: regular trace discriminant | ℤ: tr(1)=1,disc1 versus Rosati2. Gaussian: diag(2,−2),disc−4. ℤ[2i]: −16. Dual numbers: determinant 0. | Nondegeneracy only for semisimple rational algebra; source's broader assertion is false. |
| 3.2, line 583: class index | PID orders ℤ and ℤ[i]: i_e=1. ℤ[2i] acting on ℤ[i]: free rank-one indices 2 Norm(α), minimum 2. Rank zero module 0 has index 1. | Supremum may be ∞ before theorem. Finite generation excludes ℤ[1/2] over ℤ, which has no finite-index cyclic lattice. |
| 3.3, line 617: norm body | ℚ basis1: N(x)=x, volume2, disc1, p=2. Basis2: N(x)=2x, volume1, disc4, p=2. Coordinate unit 1/2 has N=1; coordinate1 has N=2. Gaussian: N=x²+y², areaπ, p=2π. | Basis covariance, actual unit and complex real-volume factor tested. |
| 3.4, line 653: norm-body bound | ℚ:2=2¹; ℚ(i):2π≥4. Hamilton: regular norm (a²+b²+c²+d²)²; abs disc256, ball volumeπ²/2, p=8π²≥16. Index-three division algebra: dimension9, lower bound512, doubled invariants ±2/3 remain nonzero. | Noncommutative and odd-index cases retained; cyclicity is a named supplier contract. |
| 3.5, line 671: class-index theorem | ℤ,e2:1≤1. Nonmaximal Gaussian,e1:2≤4; e2: exhibited4≤16. Opposite regular trace gives the same discriminant. | Exponent e/2 and both module sides correct. |
| 3.6, line 687: isotypic trace | Non-CM E:2=2; Gaussian E:16=16; E²:4096=4096. For E×a simple non-CM surface with only scalar End and no shared factor: g3,m2,disc1,Dλ8 gives36≠32. | Isotypy essential; the last object is excluded. |
| 4.1, line 723: Hom cross-discriminant | ℤ self-pairing:1; Gaussian determinant−4 squared16. Paired sublattices2ℤ,3ℤ:det6, square36; reversing a basis sign gives(−6)²=36. | Square, not absolute determinant. |
| 4.2, line 755: product discriminant | M₂(ℤ):−16=(−1)·2⁴. M₄(ℤ):2³². M₂(ℤ[i]):2¹⁶ with positive sign. Self-Hom cross=disc² makes the two displayed formulas agree. | Regular-trace scaling and parity agree. |
| 4.3, line 771: simple cross bound | E identity:degree1=c¹=1. Gaussian E identity:1≤16. Regular norm on ℚ has exponent2g/m=2, on Gaussian field exponent1. | Direction B→A and regular norm exponent consistent. |
| 4.4, line 787: stable-power bound | End(E)=ℤ, B=Eᵉ:i_e=1,degree1≤1^(2e). Diagonal E⊂Eᴺ has coordinate inverse degree1 for any N. | No dependence on ambient N; rank e retained. |
| 4.5, line 803: polarization removal | Non-CM E:disc1,cross1. Zarhin(E) dimension8, height8h_F(E), including negative h_F. | Height sign and dimension factor8 preserved. |
| 4.6, line 819: stable subvariety | Diagonal A⊂A⁸:projection degree1. For actual A=E×E′ with nonisogenous factors:dimension2,multiplicities1,1. | Actual product hypothesis retained; no circular use of quantitative factorization. |
| 4.7, line 835: product dual | Canonically polarized E×E′:dual product map degree1·1=1. Formal factor heights−1,2 sum to1, while the second factor has height2. | Lower bound on individual heights is needed; formal values test inequality bookkeeping, not existence of a curve of exact height−1. |
| 5.1, line 867: product target | A=A*=E:Zarhin dimensions8,8; restricted identity has kernel order1 and degree1. E²→E projection:kernel dimension1, so no finite degree may be used. | Correct target height and equal-dimensional finite restrictions. |
| 5.2, line 883: simple factorization | Simple A:one factor, exponent1, minimumdegree1,log1=0. E²:one isogeny class with multiplicity2,degree1. | Pairwise nonisogenous factors and multiplicities are distinct data. |
| 5.3, line 899: rational unpolarized estimate | E identity:degree1. [2] on E:degree4, quasi-inverse degree4^(2−1)=4. In dimension2 a degree4 isogeny has [4]-quasi-inverse degree4³=64. | Quasi-inverse exponent and source-height direction correct. |
| 5.4, line 915: relative-field estimate | k=ℚ,K=ℚ̄:base degree1,extension degree infinite; GL₂(𝔽₃) has(9−1)(9−3)=48 elements, joint Hom field bound2304. | Bound uses base number field, not [K:k]. |
| 5.4, line 931: relative simple factorization | K=k:original factorization. K=k̄,g1:definition field degree≤48. E² over k(t):one simple isogeny class,multiplicity2,identitydegree1. | General field extension handled by Hom rigidity. |
| 5.5, line 943: geometric isogeny bound | Non-CM E and nontrivial quadratic twist:geometricdegree1,rationalHom0. Passing between algebraically closed overfields preserves that degree1 map. | Geometric conclusion cannot be replaced by rational one. |
| 6.1, line 973: elliptic j-height bound | D1,j0:README RHS C,unmodified logarithmic formula0. D2,j0:displayed RHS4C(log2)²=36C₀ for chosen C; actual C₀D²H²=4C₀. | R01 and R04. Negative stable height does not make H negative. |
| 7.1, line 1001: integral image algebra | Scalars on Ẑ²,V={1}:scalar algebra, infinite index in M₂. GL₂: (I+e₁₂)−I=e₁₂ and e₁₂e₂₁=e₁₁, giving all four units, also modulo2. Rank1:any V gives entire Ẑ,index1. | Unital finite span differs from arbitrary closure; scalar countermodel cannot satisfy full-image conclusions. |
| 7.2, line 1035: algebra product | Product rank-one scalar groups:local and global index1. Local indices2 at2 and3 at3:global6. Infinite product of nontrivial finite quotients is infinite; finite support idempotents converge to1 in Ẑ. | Product subgroup and uniformly bounded number of generators justify algebraic closure. Finiteness follows from the parent commutant theorem over the corresponding finite extension; 7.4–7.6 supply uniformity. |
| 7.3, line 1053: centralizer reduction | ψ(x)=2x:integral kernel0,mod2kernel dimension1,mod3dimension0,M=2. ψ=0:M=1,kernel whole ring. | Every-prime injection; equality only away from saturation index. Rows live in dual lattice. |
| 7.4, line 1069: fixed-prime uniformity | ℤ₂ has indices1,2,4 at bound d4, hence3 open subgroups. d1 gives1. Rank-one scalar algebra has index1 for each. | Topological finite generation and compactness supplied; no count over infinitely many duplicate field extensions. |
| 7.5, line 1085: residual refinement | Full GL₂(𝔽_ℓ):commutant dimension1=End rank. Trivial action on𝔽₂²:commutant dimension4≠1. | Residual threshold necessary; primary quantitative proof waived, application verified. |
| 7.6, line 1101: large-prime equality | Full residual GL₂:generated algebra dimension4. Finite ℤ_ℓ-module Q with Q/ℓQ=0 has Q=0, so index1. Nonfinite Q=ℚ_ℓ has Q/ℓQ=0 but Q≠0. | Finite quotient hypothesis is indispensable; threshold uses M′, not M. |
| 7.7, line 1117: number-field uniform bound | Exceptional index bounds4 at2,9 at3:global bound36. Every local algebra full:globalindex1. | All primes retained. |
| 8.1, line 1151: integral Tate and semisimplicity | Constant non-CM E overℚ(t):End rank1, equivariant End rank1 atℓ2 and3. ℚ(t) has transcendence degree1 and is not a finitely generated ℚ-algebra. | Field finite generation is the actual hypothesis. |
| 8.1, line 1155: rational algebraicity | Same constant E:both rational End spaces have dimension1; multiplication byℓ⁻¹ is rational but not integral. Multiplying byℓ restores integral map1. | Rational comparison and saturation are distinct; no dependence on 8.2. |
| 8.2, line 1169: specialization | 2ℤ⊂ℤ becomes equality overℤ₃ but quotient has order2. Saturated ℤ⊂ℤ² has quotient rank1, so rank equality also matters. Constant E specializes with identical End rank1. | Integral equality requires both rank equality and saturation; geometric End uses finite definition extensions. R06 replaces prose-only Checks. |
| 8.3, line 1185: supported connected image | Diagonal C₂ at two primes:each projection order2,each supported factor order1,W=1. Product GL_n:W=U. Supported ±I at an odd prime:identity component{I},W=1. Trivial U:W=1. | Projection and supported intersection not interchangeable. |
| 8.4, line 1219: supported bound | [W:W′]=2:intersection index1 if V⊂W′,otherwise2; both≤2. V=1:index1≤2. | Injection of coset sets proves inequality without normality. |
| 8.5, line 1235: full finitely generated bound | U=ℤ,W=2ℤ,U′=3ℤ:intersection6ℤ,index[W:6ℤ]=3=[U:U′]. Algebra/lattice inclusion6ℤ⊂3ℤ lowers ambient index6→3. | Direction of index comparison correct, even without W open. |

### Supplier and ownership audit

Checked **13 named roadmap suppliers**, counting IntegralLattices in Scope, against main or the available current open heads, rather than accepting the resolver's name matches. The resolver reports no unresolved cross-roadmap citation or Lean name. The numerical rows below also record the convention checks used at the interfaces.

| Owner and resolved address | Consumed statement / discriminating comparison | Outcome |
|---|---|---|
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A3.3–A3.5, A3.9, A4.1, A5.1–A5.4, A6.1, A6.4–A6.8, A6.10–A6.14, A6.20, A6.22, A6.25 | Quotients, duals, Tate and complex realizations, trace, degree, Hom, finite definition fields. Gaussian alternating form E(i,1)=1,E(1,i)=−1; tr(1)=2 in dimension1; [−2] degree4; full 3-torsion field bound48 for an elliptic curve. A6.25 has injection, not the requested torsion-free cokernel. | Existing ownership preserved, except missing A3.11 import in R02. |
| Same owner, A3.11, line 1663 | Principal quotient: elliptic L of degree3 gives quotientdegree3 while polarization mapdegree9. | Existing owner found by object, not by a name invented here. |
| `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md`, 1.1–1.6, 2.4, 2.7, 3.4–3.5, 4.4, 5.7–5.9, 6.1–6.2, 6.5 | Stable heights, metric convention, theta comparison, principal cubist model, height lower bound. h_Del−h_F=(g/2)logπ; degree4 isogeny permits difference≤log2; Zarhin dimension and height both multiply by8. §5.8 is principal-only. | Nonprincipal cubist and maximal-slope extensions are live contracts, not fictitious supplied theorems. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, 0.1–0.3, 1.2, 1.5 | Gram determinant/covolume, minima and flags. Vectors (1,1),(1,−1) have determinant−2 and index2; an adapted flag does not bound the long shear basis. | The previously confused integral-basis estimate is now cited elsewhere. |
| `TauCetiRoadmap/HeightsAndUnits/README.md:250`, Layer 2 §2.1 | Integral basis bounded by successive minima, including factor max(1,(i+1)/2) under its indexing. Standard ℤ² minima1,1 give basisbounds1,1; arbitrary shear second length√(N²+1) is not such an output. | Current main supplies the consumed strengthened basis result. |
| `TauCetiRoadmap/IntegralLattices/README.md`, Layers 0–1 | Integral-form carriers. Gaussian trace Gram diag(2,−2) has determinant−4; Rosati replaces it by diag(2,2), determinant4. | No second lattice carrier is constructed. |
| `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md`, Layers 2–3 and 6 | Semisimple blocks, division algebras, splitting and index. Hamilton algebra has dimension4,index2; a degree-three division algebra has dimension9,index3. | Number-field cyclic maximal splitter is not misattributed to the generic splitting theorem. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1552`, Layer 10 | Cohomological global Brauer sequence, including real places. Invariants1/3 and−1/3 sum0; twice the class has invariants2/3,−2/3 and is nonzero. | Algebraic cyclic presentation is explicitly requested as an extension; no Br₂-only shortcut remains. |
| `TauCetiRoadmap/AutomorphicBundles/README.md`, B4.2, B4.9, B5.13 | Cusp sections and analytic comparison; B5.13 alone is rank-one Fourier comparison. Scaling u by e⁻ᴺ changes the inverse-value logarithm by N. | All-genus fixed Fourier family, trivialization and weak-region decay are in the explicit gap; current sections alone are not treated as its proof. |
| `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:1810`, R28.4.5–R28.4.6; `:2643`, R28.6.7 | Number-field integral Tate and semisimplicity; almost-all-prime commutant, including a separable-order reduction auxiliary. For non-CM E:End rank1, not full matrix rank4. | §7.3 adds explicit saturation exceptional set and every-prime injection; §7.6 adds bounded-index uniformity. Finitely generated field comparison is not attributed to the parent. |
| `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:711`, §6.0f, `quantitative-elliptic-isogeny` | Current supplied head covers CM and non-CM, all d≥1, geometric output. At d1,h_F=−1:10⁷·985²=9,702,250,000,000≤10⁷·989²=9,781,210,000,000. | No duplicated sharp period-graph proof remains here. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, 5.8, 6.4a, 7.6 | Compact matrix subgroup charts, open Frattini and Zariski identity components. For ℤ_ℓ:Frattini quotient orderℓ; for an infinite product C_ℓ:Frattini trivial and not open. | Finite-dimensional matrix hypothesis retained. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`, §6.0 | Serre independence and specialization, including the general-model finite-degree closed-point bridge. Diagonal C₂ has two surjective projections but order2, versus product order4. | Product independence is imported, not deduced from separate projection surjectivity. |
| `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`, IG.2.4, IG.2.6 | Hilbertianity and finite-cover/full-image argument on the affine-line input; the general model bridge is Neron §6.0. A conic X²+Y²+Z²=0 overℚ has no rational point but has a degree-two closed point. | Read the two contracts together: no rational-point hypothesis on an arbitrary model is introduced. |

Object searches used `roadmaps grep` over main and current open heads, the supplied sibling checkouts, and the board packages for regular-trace discriminants, class indices, norm bodies, Rosati pairings, zero/interpolation estimates, cubist models, principal quotients, Tate commutants and specialization. The listed open AbelianSchemesAndArithmeticModuliPartII work treats its finite-field and family extensions; the listed elliptic modularity head owns the sharp quadratic input. No fully qualified name of any of the three Lean declarations collides with a declaration in the readable roadmap files. The general noncommutative class-index estimate and the quantitative/finitely-generated extensions therefore remain here; generic foundational carriers remain with their cited owners. Search results were used as leads, not as instructions or proof of ownership.

### Pinned library audit

The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These were the copies searched. In this table paths beginning Mathlib or TauCeti refer to the corresponding library repository.

| Pinned declaration/interface | File and test of hypotheses/convention |
|---|---|
| `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65`: finite-dimensional real space, Haar/fundamental-domain and countability hypotheses, convex symmetric set, strict volume inequality. In ℤ⊂ℝ, interval(−1,1) has volume2 but no nonzero integral point: strictness matters. |
| `NumberField.absLogHeight₁` | `Mathlib/NumberTheory/Height/NumberField.lean:145`: algebraic-element height; nonalgebraic junk branch cannot arise in a number field. h(0)=0, so (1+h(0))²=1. |
| `LinearMap.mulLeft`, `LinearMap.toMatrix`, `Matrix.trace`, `Matrix.det`, `LinearMap.trace` | `Mathlib/Algebra/Module/LinearMap/Defs.lean`, `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, `Mathlib/LinearAlgebra/Matrix/Trace.lean`, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`, `Mathlib/LinearAlgebra/Trace.lean`. Left regular trace, not reduced trace; Gaussian i multiplication has trace0 and i² multiplication trace−2. |
| `Algebra.discr` | `Mathlib/RingTheory/Discriminant.lean:67`: commutative algebra discriminant. It does not cover the general noncommutative order target. Gaussian value−4 agrees. |
| `Matrix.frobenius_norm_mul` | `Mathlib/Analysis/Matrix/Normed.lean:657`: library Frobenius instance and compatible finite matrix dimensions. For shear S, squared norm3 and squared norm of S²=6≤9; multiplying abelian realification by2 gives the target values12≤36. |
| `Submodule.IsLattice`, `IsZLattice` | `Mathlib/Algebra/Module/Lattice.lean:67`; `Mathlib/Algebra/Module/ZLattice/Basic.lean:433`. Finite generation/full span versus a separately supplied discrete topology are not conflated. ℤ[1/2] spansℚ but is not a finite ℤ-module. |
| `AddSubgroup.index` and semisimple decomposition | `Mathlib/GroupTheory/Index.lean`; `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:244`. Index0 is the infinite-index convention; the Lean conclusion explicitly excludes it. Division-ring decomposition is not available for dual numbers with nilpotent radical. |
| AbelianVariety, End, IsIsogeny | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, `End/Basic.lean:83`, `Isogeny.lean:61`: proper geometrically integral group scheme; End composition; finite and surjective isogeny. The projection E²→E is surjective but not finite and fails IsIsogeny. |
| Elliptic isogeny degree | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99`, positivity at line153. Native function-field degree of a genuine isogeny, not an arbitrary natural variable. Identity1 and [2] degree4 in characteristic zero. |
| `ZLattice.covolume_sq_eq_det_gram` | `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42`: finite-dimensional real inner product space, full discrete lattice and canonical Borel measure. Rank0 gives1=1; scaling rank-one lattice by2 gives4=4. |
| `Subalgebra.centralizer_centralizer_of_isSemisimpleModule`, `AlgHom.centralizer_centralizer_range` | `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:260`, `:293`: semisimplicity and finite-module hypotheses retained; conclusion concerns the image. Scalar algebra in M₂ has centralizer dimension4 and double centralizer dimension1. |
| Profinite integer ring, components and product | `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69`, `Component.lean:70`, `:121`, `:136`; `Decomposition.lean:162`, `:182`, `:187`, `:320`. Prime idempotent has coordinate1 at its prime,0 elsewhere; finite sums tend to1, justifying product reconstruction for closed modules. |
| `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` | `TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean:114`: compactness and topological finite generation retained. For ℤ₂ and bound4, the finite union has3 members. |

The pinned native abelian variety is present, but the required abelian stable-height and integral polarized/Tate realization interfaces are not supplied merely by that carrier. The elliptic degree interface and height are present, so §6.1 requires no substitute carrier. Imports are the single `import Mathlib` and the used existing elliptic degree module; no forbidden options, sorry'd data, admitted examples, `lemma` declarations or placeholder predicates occur.

### Live gap computations and intake check

Each of these **9 slugs** occurs in both README and the plan's top-level gaps list with the named supplier. A declared missing result is not counted as an absent supplier theorem. The historic entries discussed below are separate.

| Contract | Computed instance / excluded wrong model | Status |
|---|---|---|
| hom-specialization-saturation | Generic ℤ inside special ℤ[i] has torsion-free quotient of rank1; 2ℤ⊂ℤ has quotient order2 and must be excluded. | README asks only for the additional cokernel assertion; historical plan injectivity clause discussed below. |
| hermitian-maximal-slope-existence | Trivial Hermitian line:μmax0,−h(1)=0≤0; scalar extension degree2 doubles numerator and denominator. | Nonzero bundle and normalized induced metrics specified. |
| hermitian-symmetric-power-slope | Rank1,n0:0≤0. Standard rank2,n2:quotient monomial squared norms1,1/2,1; μmax=(log2)/2≤4log2. | Quotient metric is not the unit-monomial metric. |
| hermitian-morphism-slope | ×2 on trivial line:archimedean log2 plus 2-adic−log2=0, hence0≤0. Zero map would have logarithmic norm−∞. | Nonzero map and all-place sum specified. |
| hermitian-metric-rescaling | Squared norm×4:μmax0→−log2; dual0→+log2. Squared norm×2:shift−½log2. | Correct sign and factor1/2. |
| semistable-abelian-tangent-metric | Gaussian tangent period1 has length1; L⁴ makes length2. Further extension leaves normalized slope unchanged, unlike substituting a potentially different pre-semistable lattice. | Semistable-extension convention explicit. |
| cubist-model-symmetric-ample | Type(1,2) surface:χ2,c₁²4,mapdegree4; nth power rank2n². Principal rankn², so section slope difference¼log2. | Not already supplied by principal-only §5.8; probability Haar metric and h_Del specified. |
| cyclic-maximal-subfield | Index3 division algebra:degree3 maximal splitter, algebra dimension9; Brauer order3, not2. | Precise algebraic conclusion stronger than arbitrary splitting; existing generic Brauer sequence not replanned. |
| fixed-siegel-cusp-family | Rescaling a nonzero value e⁻² by e⁻ᴺ changes logarithm2→N+2. At τ=x+it, decay gives ct≤logM+log|u|⁻¹ regardless of x. | Fixed rational Fourier normalization, nonvanishing family and weak-region hypotheses explicit. |

### Source locator audit

Opened **10 legally cached works**. The following **28 locator groups** were checked against their extracted text; image inspection was used where OCR suppressed formulas, including Bost's cubist and interpolation formulas and the Masser–Zannier complex-trace formulas. “Application only” explicitly does not certify an inaccessible primary proof. The two preprints are cited with their internal pagination, not assumed to share the journal numbering. All 14 cited works already have lifetime manifest entries; no new key or source request was necessary.

| Group | Locator checked and extracted-text witness | Result |
|---|---|---|
| 1 | mw94-preprint §2 (2.1), Lemma2.1, internal2–3; lines90–137 | Rosati form and lattice determinant argument. |
| 2 | mw94-preprint Lemma2.2, internal3; line138 | Submultiplicativity, not equality. |
| 3 | mw94-preprint Lemma2.3, internal4; lines148–175 | Degree determinant and trace bound; replaces R03's wrong locator. |
| 4 | mw94-preprint §4 period restatement/proposition, internal6–9; lines228–345; bost95 Theorem2.2, printed119–120, lines151–157 | Period-to-short-End route; degree dependence retained. |
| 5 | mw94-preprint §5 principalization and descent, internal9–10; lines346–405 | Quotient degree and field bound; source's deeper cited period lemma remains waived. |
| 6 | mw94-preprint §6 (6.1)–(6.4), internal11–12; lines413–470 | Off-diagonal extraction and degree polynomial; (6.2) is not the lattice determinant assertion. |
| 7 | mw93-isog-preprint §4 Lemmas4.1–4.2, internal5–6; lines215–280 | Period-basis use and matrix-height input; primary matrix-height argument referred to waived periods paper. |
| 8 | mz20 Lemma2.2, printed644; lines397–412 | D≥2 j-height form; all-D extension supplied independently in README. |
| 9 | mz20 §4 (21)–(22), printed653; lines783–816 | Matrix conventions; necessary realification corrections recorded below. |
| 10 | mz20 Lemma4.1, printed653–655; lines817–892 | Coordinate estimates and Gram discussion. |
| 11 | mz20 Lemma4.2, printed655–656; lines893–936 | Off-diagonal construction and polynomial degree; source typos below. |
| 12 | mz20 Lemma4.3, printed656–657; lines937–962 | Combination of fixed cusp values and weak-region decay; underlying inputs not certified by this application. |
| 13 | mz20 Lemma4.4, printed657; lines963–980 | Endomorphism discriminant bound. |
| 14 | mw95 §2/Class Index Lemma, printed8–10; lines145–235 | Regular trace, class index, Minkowski and rank induction. Definition defect in source noted below. |
| 15 | mw95 §3 Lemmas3.1–3.3, printed11–13; lines242–332 | Cyclic presentation, discriminant-normalized volume and p(D)≥2^m. README's “pp10–13” is a harmless encompassing range. |
| 16 | mw95 §4 Lemmas4.1–4.2, printed14–17; lines364–444 | Stable powers and simple cross-discriminants; direction B→A. |
| 17 | mw95 §5 Lemmas5.1–5.2, printed17–18; lines445–513 | Block discriminants and isotypic trace proportionality. |
| 18 | mw95 §6 Lemmas6.1–6.3, printed18–20; lines514–592 | Discriminants, stable subvarieties and product dual. |
| 19 | mw95 §7, printed21–24; lines593–695 | Lemma7.1, TheoremsI–II, relative-field descent and final degree dependence. |
| 20 | ts18 Theorem2.3, printed382–383; lines154–163 | Dimension-only geometric isogeny bound and precise reference back to mw95. |
| 21 | gr14 period restatement, printed344; lines63–68; Theorem1.4, printed347; lines150–188 | Coarse period theorem versus genuinely quadratic elliptic bound distinguished. |
| 22 | gr14 §3.2, printed358–359; lines607–646; §6.8, printed377; lines1432–1446 | Maximal slopes, morphism/metric conventions, symmetric-power estimate. |
| 23 | bost95 Theorem4.1, printed128; lines381–389 | Nonzero section, scheme image, unnormalized intersection degree. |
| 24 | bost95 §4.2/Theorem4.2, printed128–130; lines398–453 | General symmetric ample line, Haar L² metric, degree identity and arbitrary-reduction extension. |
| 25 | bost95 §5.1 Proposition5.3 and Lemma5.4, printed133–137; lines520–628; §5.3.4, lines723–743; AppendixD, lines968–998 | Heights, jet lengths, original-field degree d and all three numerical conditions. Source uses d=[k:ℚ], despite W being defined over k′. |
| 26 | ry25 Theorem4.7 and proof, printed260–263; lines456–597 | Product formula, fixed-prime argument, simultaneous residual application, saturation and Nakayama. Primary residual proof is waived. |
| 27 | ry25 Proposition4.8 and deduction, printed263–265; lines602–665; noot95 Proposition1.3/Corollary1.5, printed163–165; lines130–210 | Supported local groups and specialization; full image at an auxiliary prime, finite definition extensions and geometric End. |
| 28 | deligne84 Theorem2.7, printed39; lines534–575 | Full number-field Galois integral commutant; arbitrary open subgroup use requires passage to its finite extension. |

### Dependency and policy check

The requested read-only gate returned:

```text
moved: FaltingsFinitenessAndIsogenyTheoremsPartII moved in the merge order from #47 to #228, right after its last supplier AutomorphicBundles (ArithmeticGaloisRepresentations, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, EllipticCurveModularityPartII also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 649 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The allowed movable placement is not a finding. The local ordering issue in R05 is separate from that cross-roadmap check. No order file was edited.

The checked-out commit is b4df225. `git diff --stat origin/main...HEAD` and the file list show eight changed files, all inside the package folder. README and Lean contain no pull-request numbers or process narrative, no computational algorithms and no forbidden Lean commands. Every numbered target has a source locator. No suspicious instructions in fetched text were acted on. This review writes only its report and scratch notes; it does not change the package, pins, tools, sources manifest or external services.

## Not verifiable

- No Lean compilation or fresh elaboration was performed, as required by the read-only review. The worker-provided three elaborated signatures were inspected; this is not a claim to have rerun them.
- `mw93-periods` and `mw95-refine` are **waived**. Their direct locators, including periods Lemmas5.3, 8.4 and 8.6 and equation(7.4), and the residual-refinement Theorems1–2/Corollary1, remain uncertified here. Restatements and applications in the readable papers were checked; those do not replace the missing proofs.
- `igusa`, Lemma20 p104, and `fw84`, ChapterVI §3, are settled **uncertified** sources. Weak-region decay is a precise named supplier contract; function-field rational algebraicity is explicitly owned by §8.1. Neither inaccessible text was requested again.
- Complete proofs of the live supplier gaps do not yet exist in the supplied owners. Acceptance is conditional on these nine declared contracts, not on pretending that the current owner already states them.
- Historic plan entries G1–G8, the coarse hermitian-maximal-slope gap and the redundant injection clause of hom-specialization-saturation remain. `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/reports/FIX-PKG-FaltingsFinitenessAndIsogenyTheoremsPartII~2.md` marked retirement/reassignment not actionable under the append-only plan rule (F02, F04, F09); the next repair report preserved that explanation. The present brief still permits only appending gaps. I found no reason that invalidates the settled explanation and have not re-raised those housekeeping findings as new unowned mathematics.
- The tables test explicit instances and interfaces; they are not complete proofs of the deep estimates. Where the exact universal constant is unspecified, only its quantifier dependencies and the displayed specialization were checked. Full auxiliary-section, zero-estimate and transcendence proofs were not reconstructed in this review.

## Source issues

- **Misprint** in mz20 at §4, equation (22), printed p. 653: the source says the complex trace equals the real Rosati trace; it should be twice the real part of that complex trace; affects a stated result.
- **Error** in mz20 at §4, Gram determinant following Lemma 4.1, printed p. 655: the source says the complex Hermitian Gram determinant gives the Rosati discriminant; it should be the determinant after taking twice the real part entrywise; affects a stated result.
- **Misprint** in mz20 at §4, scalar-length formula following Lemma 4.1, printed p. 655: the source says scalar n has length n√(2g); it should be |n|√(2g), including negative integers; affects a stated result.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p. 656: the source says equation (50) supplies the off-diagonal construction; it should be equation (27); affects the proof.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p. 656: the source says the cited norm lemma gives multiplicativity; it should be submultiplicativity; affects the proof.
- **Misprint** in ry25 at Theorem 4.7 proof, printed p. 263: the source says the final large-prime threshold uses M(A,K,d); it should be the residual threshold M′(A,K,d), together with M_A; affects the proof.
- **Misprint** in ry25 at Theorem 4.7 proof, saturation-index formula, printed p. 263: the source says the row lattice is saturated inside E₀; it should be saturated inside E₀∨, where its rows live; affects the proof.
- **Error** in mw95 at §2, discriminant definition, printed p. 8: the source says any finite-free integral ring has separable rational algebra and nonzero trace discriminant; it should require semisimple rational algebra, as the later division-algebra setting ensures; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b4df2253e7261a14b3cbf18ad4b2a81ca63b6c29", "job": "RT-FaltingsFinitenessAndIsogenyTheoremsPartII~1a", "model": "gpt-6-astra", "worker": "chris-31"} -->
