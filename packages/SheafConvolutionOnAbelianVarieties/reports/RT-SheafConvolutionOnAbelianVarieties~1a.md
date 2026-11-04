<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1674#issuecomment-6429830426 -->
Red team round 1 pass a (codex) of f1720ea

Verdict: needs_changes

1. **F01** (P1) Generic vanishing is used as its own proof input

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:238, “Use KW Theorem 1.1 for the cohomological vanishing”.

   Claim: §0.4 is proved from the listed earlier character, comparison and decomposition inputs, before constructing any convolution quotient.

   Witness: KW lines 62–75 explicitly require André–Kahn quotient construction, super-Tannakian reconstruction and classification of Euler-zero sheaves; none appears among §0.4’s inputs. The cited Theorem 1.1 is §0.4’s conclusion, not an upstream target.

   Exact repair text: “Before generic vanishing, construct the André–Kahn quotient and prove the super-Tannakian and negligible-simple classification results used in KW §§4–11, including the torsion-translate assertion for geometric-origin objects. This construction is independent of the Serre quotient subsequently constructed in §0.6. Derive §0.4 from these targets.” Give each new target its hypotheses, source locator and dependencies, importing existing abstract category theory by owner. Alternatively supply an equally explicit independent proof route with all its prerequisites owned. Do not cite §0.6 to construct its own generic-vanishing prerequisite.

   Repair check: for the constant perverse sheaf on an elliptic curve, the construction must give untwisted dimensions (1,2,1), twisted dimensions (0,0,0), and the exceptional locus {1}; for a non-torsion rank-one twist it must give {χ⁻¹}, without claiming a torsion exceptional point.

2. **F02** (P1) The microlocal fibre and weight comparison has no owner

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:632 and :652, “Apply K2 Theorem 2.3.1” and “Its Gauss monodromy is transitive, producing one Weyl orbit of weights”.

   Claim: the clean-cycle ring and index formula suffice to lift tensor factors across central isogenies and identify Gauss fibres with representation weights.

   Witness: K1 lines 318–377 require a microlocal tensor fibre functor and Gauss-monodromy embedding; K2 lines 728–769 require the λ-ring/weight dictionary and Adams operations. Neither is a target, supplier contract, or pinned declaration here.

   Exact repair text: “Construct the microlocal exact tensor functor from the holonomic negligible quotient to germs of local systems over a very general cotangent vector. Identify its graded multiplicities with characteristic-cycle multiplicities and its Gauss-monodromy action with the normalizer action (K1 Theorem 1.7). Prove the characteristic-cycle λ-ring and weight dictionary and the central-isogeny lifting theorem, including effectiveness (K2 §§2.1–2.3).” Place these general targets before §§4.3–4.4, and make those two sections consume them. Also explicitly own the component-group/isogeny comparison used to obtain irreducibility on the identity component. The D-module cycle supplier and the RH/index gap do not provide these tensor comparisons.

   Repair check: δₓ must have a single weight of multiplicity 1, δₓ⊕δₓ multiplicity 2, and (2Λₓ)◦(3Λᵧ) multiplicity 6. An index-only assignment with these dimensions does not determine a Weyl action; the added graded-functor and monodromy laws do.

3. **F03** (P2) “Reductive” drops the pinned carrier's connectedness hypothesis

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:41, :360, :369 and :1135, “the reductive carrier includes finite type over a field” and “G(K,χ) is reductive”.

   Claim: geometric semisimplicity produces a group of the kind supplied by the pinned reductive-group carrier; the finite detection theorem uses the same unqualified terminology.

   Witness: take K=δₓ with x of order 2. README:417 correctly gives G=μ₂, with two geometric components. TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean:111–119 requires geometric connectedness for its reductive carrier.

   Exact repair text: “The groups G(K,χ), and the subgroups B in §7.5, may be disconnected. Here the required condition is that their identity components are reductive; in characteristic zero this is equivalent to linear reductivity for these finite-type affine groups. Use the affine finite-type group carrier for the whole group, and the connected reductive carrier only for its identity component. The pinned ReductiveAffineGroupSchemeCat includes geometric connectedness.” Apply this convention consistently to §§1.3 and 7.5 and their supplier interfaces.

   Repair check: μ₂ and Q₈ have trivial identity component and semisimple characteristic-zero representation categories, but neither belongs to the connected reductive carrier. The replacement includes both and also includes connected GL₂.

4. **F04** (P1) The large-ratio proof contains a false numerical inequality

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:1010, “h(v+1)≥A₁/(2(n−1))≥4”.

   Claim: A(n,1)/(2(n−1))≥4 throughout n≥5.

   Witness: n=5 gives A(5,1)=26 and 26/(2·4)=13/4<4. The integer-valued multiplicity can still be at least 4; the displayed intermediate inequality cannot.

   Exact repair text: “Since h(v+1) is an integer, B.22–B.25 give h(v+1)≥⌈A₁/(2(n−1))⌉≥4 and u₀(v)=1. At n=5 the ceiling is ⌈13/4⌉=4; for n≥6 use 9(n−1)≤A₁.” Add the n=5 ceiling computation as a negative-control Check for dropping the rounding.

   Repair check: n=5 gives 4≥4; n=6 gives ⌈57/10⌉=6≥4. No other part of the exclusion argument needs the false unrounded bound.

5. **F05** (P3) Several exact source pointers do not locate the named statements

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:648, :603, :209 and :1348; the pointers include “LS line 993”, “K2 line 593” and “W line 10”.

   Claim: these line references locate Lemma 3.8, Definition 2.2.1 and the rigidity proposition respectively; the bibliography gives W's title as “On the rigidity of BN-sheaves”.

   Witness: LS line 993 defines clean components in Lemma 3.9's proof. K2 line 593 is a page numeral. W line 10 introduces convolution; the proposition starts at W line 24 and its title at W line 6.

   Exact repair text: “LS, Lemma 3.8, p.21, LS line 966”; “K2, Definition 2.2.1, p.13, K2 line 628” (also at README:105); “W, unnumbered Proposition, pp.1–2, W line 24”. Change the W bibliography title to “A Remark on Rigidity of BN-sheaves”.

   Repair check: each replacement lands on the named statement; the shift and Lie-algebra misprints in LS are recorded separately below and must not be imported.

6. **F06** (P3) Scope reminders and repeated conclusions are counted as Checks

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:393, :674–675, :997–998, :1229–1230 and :818–822. Examples include “Record n>2 in every downstream use” and “The conclusion is k≤n−1”.

   Claim: these bullets provide discriminating checks; the exceptional-degree definition has enough independent checks.

   Witness: the quoted bullets merely repeat hypotheses/conclusions. In §5.3, five bullets reduce to two evaluations, D₀=1 and D₁=8855, with the latter repeated three ways; none tests a later recurrence step.

   Exact repair text: “Move scope reminders out of Checks and retain each repeated computation once. Add to §5.3: P₂=(20,76), binom(96,20)=216182590635135019896, D₂=36030431772522503316, and binom(96,20) mod 6=0.” Replace the §1.4 reminder by the failure of a rational point on a nontrivial torsor over a non-algebraically-closed field (for example x²+1=0 over R); retain its existing δ₀ and conjugation tests. In §§4.5, 6.4 and 8.3 keep the already computed dimension, root-bound and product-versus-diagonal controls, without counting restated scope clauses as additional tests. Apply the same removal to duplicate bullets at :227, :269, :293, :353–354, :378, :546, :597, :621, :696, :821–822, :1033–1035, :1153–1154 and :1265–1267 where the preceding checks already give the same instance.

   Repair check: the new degree computation is divisible by 6 and differs from both the seed and first-step values; the real torsor has zero R-points and two C-points, testing the field hypothesis rather than restating it.

7. **F07** (P3) The constructible comparison is cited to the de Rham section

   Location: packages/SheafConvolutionOnAbelianVarieties/README.md:46 and :101, “ComplexComparisonPartII §C5.1 identifies its rational Euler characteristic with the topological one” and “Consume §§C5.1–C5.3 for constructible comparison”.

   Claim: those sections supply the rational étale/constructible-to-Betti comparison.

   Witness: TauCetiRoadmap/ComplexComparisonPartII/README.md:2337–2573 concerns de Rham–Betti comparison. Its §C6.6, :4334–4367, owns integral/rational Artin comparison. EtaleDualityAndPerverseSheaves §3.5 supplies the constructible categorical refinement with the stable-lattice essential image.

   Exact repair text: “Use ComplexComparisonPartII §C6.6, adicArtinComparison, for rational étale–Betti cohomology and Euler characteristics; use EtaleDualityAndPerverseSheaves §3.5 for constructible/perverse comparison, retaining its stable-lattice essential image. Use ComplexComparisonPartII §§C5.1–C5.3 for de Rham–Betti comparison and geometric Hodge theory.” Update the affected Needs lines to separate these roles.

   Repair check: on a complex elliptic curve the étale and Betti dimensions are (1,2,1), giving Euler characteristic 0; the repaired Artin citation compares those two cohomologies directly, whereas de Rham–Betti alone has a different source.

## Verified sound

Read all 1,351 lines of README.md and all 133 lines of Suggested.lean: 10 declarations (4 definitions, 6 theorems), 53 numbered target sections, the additional exterior-row predicate in §5.1, and all 230 Check bullets, reviewed against their statements and grouped into computed instances below. Inspected 73 distinct source-line pointers in nine legal cached works: 70 resolve to the cited passage or section, and three displaced statement pointers are R05. The numerical tests comprise 11,619 finite weight-list/exponent cases and 2,070 exact or outward-rounded rational inequality tests. These are counterexample searches, not proofs of the universal targets. All 21 named roadmap suppliers were resolved; all 16 declared gap slugs match design/plan.json and the README. The supplier-role correction is R07. The declarations and target instances are recorded below, including the failed instances.

The source manifest has one entry per cited work and identifies the preprint versions used. No additional source was needed. The prior FIX-PKG report marks its seven findings applied; none was settled as “not actionable”.

The supplied elaborated signatures were compared with all ten source signatures and their README statements. No section binder was dropped. No Lean command was run: the explicit read-only/no-build instruction takes precedence over the generic request to produce another scratch elaboration. There are no admitted data definitions, extra imports, set_option commands, lemmas, admitted examples, placeholder propositions, or one-tactic padding in Suggested.lean. The finite permutation predicate has a real body and is used by the classification theorems.

All PR changes reported by the read-only diff are inside packages/SheafConvolutionOnAbelianVarieties: README.md, Suggested.lean, design/plan.json, metadata.toml, two pre-existing reports and sources.toml. The plan diff changes only its top-level gaps list. The review changes only its report and scratch notes. No computational algorithm is proposed as a mathematical target; finite combinatorial cardinalities and exact finite base cases are legitimate definitions and proof obligations.

Dependency-gate output, run against the supplied order without modifying it:

```text
depcheck: 56 roadmaps, 657 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This does not discharge the missing proof inputs R01–R02.

### Elaborated declaration and instance table

All names below are in namespace TauCetiRoadmap.SheafConvolutionOnAbelianVarieties. There are no section variables or instances outside the displayed contexts. Natural-number junk cases are recorded even when the headline hypotheses exclude them.

| Declaration / README section | Complete variable and instance context | Instances and computed sides | Result / change |
|---|---|---|---|
| wedgeMultiplicity, :39 / §5.1 | implicit m:ℕ; w:Fin m→ℤ; k:ℕ; t:ℤ; no typeclass hypotheses | Empty list, k=0: W(0)=1 and W(1)=0. m=2,k=3: W(t)=0. Four zero weights,k=2: W(0)=6=choose(4,2), rather than 1 or 12. Weights −1,0,1,k=2: row (1,1,1). | Real finite-subset definition; no change. |
| exceptionalPair, :44 / §5.2 | j:ℕ only, recursive body | P₀=(1,5), P₁=(5,20), P₂=(20,76), P₃=(76,285); successor subtraction uses 21−1=20, 81−5=76, 305−20=285, all nontruncated. | No sorry-data or missing positivity binder; positivity belongs to the theorem. |
| exceptionalDegree, :50 / §5.3 | j:ℕ only | D₀=6/6=1, D₁=53130/6=8855, D₂=216182590635135019896/6=36030431772522503316; each remainder 0. | Correct normalization; add third independent README Check, R06. |
| hasEulerianExteriorWeights, :56 / §5.1 | implicit m; w:Fin m→ℤ; k,n,d:ℕ; s:ℤ | 0011,k=2,n=3,d=1,s=0 gives both sides (1,4,1), and 0 at q=−1,3. Four zeros gives (6,0,0), not (1,4,1). 0012 gives (1,2,2,1), not (1,11,11,1). At n=0 every RHS is 0; at d=0 every RHS is 0; empty-list k=0 has W(s+q)=1 at q=−s, so cannot satisfy either. | Integer guard prevents q.toNat collapsing negative degrees. n=0 convention is explicitly local and excluded from headlines. |
| exceptionalPair_classification, :66 / §5.2 | a,b:ℕ; ha:0<a; hab:a≤b | (1,5): 1−20+25=6=1+5, j=0. (5,20):25−400+400=25=5+20, j=1. (1,1):−2≠2 and no index. (0,0):0=0 but no index, excluded by ha. Reversed (5,1) solves equation but is excluded by hab. | Both iff directions and uniqueness tested; no change. |
| surface_exterior_classification, :74 / §5.6 | implicit m,k,d; w,s; 1<k; k+1<m; 2k≤m; 1≤d; exact n=2 row hypothesis | 000001,k=3: row (10,10), m=6=2k, d=10=choose(5,3), endpoint count1. 0001,k=2: row(3,3), m=4,d=3. k=1,m=2 gives(1,1) but is outside hk. | No conclusion hidden in hrow; no change. |
| threefold_exterior_classification, :86 / §5.7 | same interior/normalization hypotheses; exact n=3 row hypothesis | 0011,k=2: row(1,4,1), (m,k,d)=(4,2,1). Histogram 1[−1]+23[0]+1[1],k=5: (8855,35420,8855), (m,k,d)=(25,5,8855), j=1. P₀ would require k=1 and is excluded. | Classical and Pell branches both needed; no change. |
| fourfold_exterior_impossible, :99 / §5.8 | implicit m,k,d; w,s; 1<k; k+1<m; 1≤d; no normalization assumption | 0012,k=2 has total6 versus 24d≥24. Its adjacent ratio2 differs from11. Complementing k preserves all multiplicities after t↦total−t, so omitting 2k≤m is legitimate. No valid n=4 row in the finite search. | Negative statement matches README; no change. |
| exterior_eulerian_classification, :110 / §6.6 | implicit m,k,n,d; w,s; n≥2,d≥1,1<k,k+1<m; exact row | Surface case gives n=2,k₀=3,d=10; threefold case gives n=3,m=4,k=2,d=1; Pell case gives n=3,j=1,d=8855. Complement k=20,m=25 has min(20,5)=5 and the same d. n=1 permits constant rows, excluded by hn. | Full necessary classification, not an iff or existence claim for hypersurfaces. |
| jordan_finite_linear_groups, :127 / §7.4 | universe u; n:ℕ,1≤n; ∃J before ∀F:Type u,[Field F],[CharZero F], Γ≤GL(Fin n,F),[Finite Γ]; ∃B≤Γ | n=1: B=Γ,index1. Q₈≤GL₂(C): cyclic C₄,index2, normal; dihedral order2q: rotations C_q,index2. Γ=1:index1. A zero ring cannot satisfy Field. Positive-characteristic SL₂(F_q) has unbounded required indices. | J is uniform in F and Γ. Index is within Γ, not within GL. No one-lemma proof at the pins found. |

The finite weight search enumerated sorted integer lists of lengths 4–8 with entries in −2,…,3 and every interior exponent; it found 30 surface and 5 threefold rows and no row in dimensions 4–6. Exact permutation enumeration independently produced Eulerian rows (1), (1,1), (1,4,1), (1,11,11,1), (1,26,66,26,1). Positive Pell solutions with a≤79,b≤300 were exactly (1,5),(5,20),(20,76),(76,285). These bounded searches do not certify the infinite classifications.

### README target, convention and Check table

“Conditional” below means that the displayed mathematical instance works but the general target relies on a declared supplier contract or the missing proof input noted in the findings. It does not mean that a supplier gap is itself a finding. E denotes a complex elliptic curve, F the characteristic-zero coefficient field, and δₓ a rank-one skyscraper. Counts for a zero variety, zero object or empty parameter space are used only where the actual target permits them; n≥2, amplitude, smoothness, properness, finite type and characteristic zero exclude the unrelated zero-ring, inseparable, non-quasi-separated and singular-thickening cases.

| Statement / location in README | Instances and computed values on the two sides | Result / change |
|---|---|---|
| §0.1 character space, :159 | dim A=0: Π={1}, no positive-dimensional B. E,B=E:T_B={1}; B=0 would give all Π. Anti-diagonal restriction gives χ₁χ₂⁻¹=1 iff χ₁=χ₂; diagonal gives χ₁χ₂=1. On E, 2³-torsion characters number 2⁶=64. | Product/dual conventions agree; coordinate-only kernels fail. |
| §0.2 normalized sheaf, :184 | χ=1 gives monodromy1 and origin Galois action1. Twisting the same geometric sheaf by a nontrivial arithmetic sign character leaves geometric action1 but origin action−1. χψ and χ⊗ψ both multiply monodromies; χχ⁻¹=1. | Origin normalization distinguishes the wrong descent. |
| §0.3 convolution/duality, :209 | δₓ*δᵧ=δₓ₊ᵧ; inverse dual δ₋ₓ; δ₀*δₓ=δₓ. On E the constant sheaf is not the unit: its convolution with δ₀ remains supported on E. Two degree-one shifts exchange with (−1)¹=−1. | Unit, source/target of duality and Koszul sign agree. R05 locator. |
| §0.4 generic vanishing, :234 | E,F[1],χ=1: dimensions(1,2,1), Euler−1+2−1=0. χ≠1: dimensions(0,0,0). L_α[1] has exceptional character α⁻¹, nontorsion when α is nontorsion. Empty finite family has no excluded characters. | Statement survives; proof ownership R01. |
| §0.5 negligible objects, :250 | χ(δ₀)=1; χ(F_E[1])=0. δ₀⊕δ₀[1] has total Euler1−1=0 but two nonnegligible perverse cohomologies, each of Euler1. Zero object has all perverse groups0. | Distinguishes total-Euler-zero from D_N; no change. |
| §0.6 Serre/Verdier quotient, :275 | Q(F_E[1])=0, Q(δ₀)≠0, End(Qδ₀)=F. Q(pH^j(K*L))=0 for j≠0; the example δ₀⊕δ₀[1] remains nonzero in the derived quotient. | Conditional on the declared heart-localization gap; no circular use allowed in R01. |
| §1.1 Pχ and Nχ, :310 | δₓ admissible for all χ: only H⁰=F. F_E[1] fails at χ=1 because H⁻¹=F,H¹=F; for χ≠1 all groups0 and its quotient is0. Duality/inversion changes χ twice, returning χ. | Full-subquotient condition has the intended strength. |
| §1.2 ωχ, :335 | ωχδ₀=F of dimension1; ωχ(F_E[1])=0 for good χ. dim ω(δₓ*δᵧ)=1=1·1. Direct sum of two points has dim2=Euler2. | Faithfulness only after quotient; conditional on preceding targets. |
| §1.3 G(K,χ), :360 | K=0 or negligible: GL₀=1, G=1. δ₀:G=1. δₓ with order2:G=μ₂ with 2 components; infinite order:G_m, dimension1. K⊕K gives diagonal group of dimension dim G, not 2dim G. | Connected-carrier mismatch R03. |
| §1.4 fibre comparisons, :385 | δ₀: unique group isomorphism1→1. In GL₂ conjugation by diag(2,1) sends E₁₂ to2E₁₂; equality without conjugation fails. Nontrivial real μ₂-torsor x²+1=0 has0 real and2 complex points. | Algebraic closedness/finite type and inner ambiguity retained; R06 Check. |
| §1.5 Euler-one, :401 | δₓ hasχ=1; δₓ⊕δₓ hasχ=2 and is nonsimple; smooth ample curve on an abelian surface hasχ(perverse)=2d≥2. Translation δₓ*δᵧ has support{x+y}. | No Euler-one positive-dimensional ample exception. |
| §2.1 arithmetic/geometric categories, :427 | At the origin a 2×2 unipotent action [[1,1],[0,1]] is not semisimple arithmetically; forgetting Galois gives two copies of1. Geometric endomorphism dimension4, arithmetic centralizer dimension2. | Geometric semisimplicity must not be replaced by arithmetic semisimplicity. |
| §2.2 exact sequence, :452 | A=point: G_geo=1, G_ar=Gal_k^alg, quotient identity. k algebraically closed: quotient1 and G_ar=G_geo. The preceding unipotent representation has nontrivial arithmetic image despite trivial geometric image. | All directions and proalgebraic quotient consistent; EHS gap retained. |
| §2.3 normalization, :468 | Identity Galois image has dimension0 and normalizes SL₂ of dimension3 but does not contain it. A Galois-moved χ changes the fibre to ω_(γχ), so a single-fibre action is unavailable. | Normalization is not containment. |
| §2.4 field extension, :484 | A k-rational point sheaf has Hom dimension1 over both algebraically closed bases; a new K-point outside A(k) is not in that generated category. Unit remains unit. | Restriction to categories generated by descended objects is essential. |
| §3.1 Euler/Hodge data, :510 | n=2,d=1: coherent row(−1,1), e_top=−2, N=2. n=3,d=1: (1,−4,1), e_top=N=6. n=4,d=1: unsigned(1,11,11,1), N=24 and e_top=−24. | Signed Euler characteristic differs from perverse dimension as required. |
| §3.2 distinguished representation, :527 | n=2:shift1, dim2d; n=3,d=1:shift2, dim6. Replacing shift n−1 by n gives a further shift[1], outside the heart; its generic H⁰ is0 instead of6. | Positive dimension and shift correct. |
| §3.3 Hodge–Tate row, :552 | n=3,d=1:native weights0,−1,−2 with multiplicities1,4,1; sum6=N. n=2,d=1:weights0,−1, dimension2. For m=p=2, the characteristic-zero character idempotent uses 1/2, which exists; no good-reduction assumption is required. | Native Tate convention agrees with PadicHodgeTheory. |
| §4.1 clean cycle ring, :578 | Λₓ◦Λᵧ=Λₓ₊ᵧ, degree1=1·1. (2Λₓ)◦(3Λᵧ)=6Λₓ₊ᵧ, degree6=2·3. For dim A>0 zero-section Gauss image{0} has degree0 and clean part0; for dim A=0 it is the unit, degree1. | Multiplicities and dimension-zero boundary correct. |
| §4.2 cc, :603 | ccδₓ=Λₓ,degree1=Euler1; cc(2δₓ)=2Λₓ,degree2. CC(F_E[1]) is the zero section with coefficient1 while cc=0=Euler0. Smooth ample n=3,d=1 gives reduced conormal degree6. | Index and clean/full distinction correct; R02 missing stronger comparison, R05 locator. |
| §4.3 tensor factorization, :628 | Two degree2 cycles give degree4. Four distinct point sums each have coefficient1; colliding x+z=y+t yields coefficient2. A singleton component maps to its unique summand's singleton support, not onto a two-point union. δₓ has derived Lie algebra0; simple SL₄ has one simple ideal, both excluded. | Reduced component assertion survives; proof input R02. |
| §4.4 minuscule, :648 | Standard SL₂ weights{−1,1}:one orbit, each multiplicity1. Sym² weights{−2,0,2}:two orbits. Reduced n=3,d=1 conormal gives6 distinct generic weights; coefficient2 gives multiplicity2. | Correct examples; unowned microlocal dictionary R02 and locator R05. |
| §4.5 simple derived image, :666 | n=3,d=1:N=6>1 excludes a torus irreducible (dimension1). Factor degree≥6 and product6 force other degree≤1, contradicting >1. An isogeny with kernel4 can restrict generically with degree1 to H. In a surface,d=2 gives dim Alb(H)=3≠2. | n>2 needed; the repaired component/isogeny argument avoids the source's erroneous isomorphism step. |
| §4.6 alternatives, :685 | n=3:N≡0 mod6;27≡3,56≡2 mod6;2^r≠0 mod3. ∧²SL₄ has dim6 and imageSO₆, not faithful SL₄. n=2,d=28 gives N=56 and fails the divisibility-by6 premise. Zero minuscule weight gives dimension1≠N. | Rank-zero and exceptional dimensions separated correctly. |
| §4.7 symmetry/form, :704 | n=3:shift2, sign+1, symmetric. n=4:shift3, sign−1, alternating and N=24 even. Standard SL₆ is not self-dual; weights of its dual differ. | Correct parity in characteristic-zero coefficients, including cohomological prime2. |
| §5.1 weight count, :733 | Four zero weights,k=2:6; empty list,k=0,t=0:1; k>m:0. Complement on weights(−1,0,1),k=2 sends t to−t. Translating all weights by3 adds6 at k=2. | Unordered subsets and shifts correct. |
| §5.1 Eulerian-row predicate, :758 | 0011,k=2:(1,4,1), outside support0; 0000:(6), not that row; 0012:(1,2,2,1), not(1,11,11,1). For n=0 the predicate demands all weights vanish, unlike the imported convention A(0,0)=1. | Difference explicitly scoped; no headline uses n=0. |
| §5.2 Pell solutions, :776 | P₀=(1,5), integer equation6=6; P₁=(5,20):25=25; P₂=(20,76):96=96. (0,0) solves equation but fails positive hypothesis; swapped(5,1) fails ordering. | Uniqueness and natural subtraction boundaries retained. |
| §5.3 normalized degree, :803 | D₀=1,D₁=8855,D₂=36030431772522503316; N₁=6D₁=53130. P₀ exponent1 violates interior-exponent hypothesis. | Correct /6 normalization; R06 independent Check. |
| §5.4 cocharacter/exterior constraint, :828 | 0011,k=2:total6=3!·1, row(1,4,1). Add3 to standard weights:exterior shift6, not3. Scalar−1 acts by(−1)²=+1, kernelμ₂. A common half-integral standard shift contributes an integral shift to ∧². | Actual faithful image and central shift retained. |
| §5.5 extrema/width, :847 | 0011,k=2:v=0,v′=1 and k(v′−v)=2=3−1; all side terms0. 000001,k=3:both cutoff values0, upper singleton contributes1=2−1; ten minimal subsets share one histogram. | Histogram uniqueness does not assert subset uniqueness. |
| §5.6 surface classification, :863 | 000001,k=3:10 subsets at each weight0,1, d=choose(5,3)=10,m=6. 0001,k=2:3 at0 and3 at1. Ordered tuples would give60 instead of10. | Both singleton orientations handled. |
| §5.7 threefold classification, :881 | 0011,k=2:(1,4,1). (−1,0×23,1),k=5:(8855,35420,8855); total53130=6·8855. P₀ hask=1. | Classical branch and first geometric Pell exception agree with Lean. |
| §5.8 fourfold obstruction, :899 | 0012,k=2 gives(1,2,2,1), adjacent ratio2≠11. Total6<24d for d≥1. Genuine target row is(1,11,11,1), not the threefold row. | Counterexample search found no violating interior row. |
| §6.1 occupancy ratios, :927 | Surface5[0]+[1],k=3:R_a=0,R_b=1, product0 and bound0. Threefold1[−1]+23[0]+1[1],k=5:R_a=19/5,R_b=1/5, sum4, product19/25<1. For the same threefold histogram the five normalized q=2 contributions are0,0,1,0,0, sum1=A(3,2). | Non-strict product bound handles zero neighbours; all five terms retained. |
| §6.2 inequalities, :941–958 | Every comparison has a computed instance in the following table. n=2 gives1/2<0 false for (a); n=4 gives18<10 false for (b); n=7 requires denominator48 rather than49. | Stated ranges survive 2,070 tests; no finite-range test treated as a universal proof. |
| §6.3 first large ratio, :973 | Candidate1[−1]+53[0],k=2 hasR_a=26≥13 but q=2 ratio0≠66, so fails full row. At n=11 threshold2036/2=1018. Sum26 alone admits(0,26). | Full-row hypothesis, not only adjacent equation, is necessary. |
| §6.4 large exponents, :989 | n=5,sum26,product≤4:roots bounded by13±√165, approximately0.1548 and25.8452. Five-term upper bound5+1+4·26/2=58<66. | Excludes k≥n; does not bound m. R06 reminders. |
| §6.5 second large ratio, :1006 | n=5:A₁/(2(n−1))=13/4<4, but integer ceiling4. Gap r=4:A(5,10)=0 versus lower26·25/2=325. r=2 boundd<3/676 conflicts with d≥1. | Numerical proof correction R04. |
| §6.6 full classification, :1023 | Surface(m,k,n,d)=(6,3,2,10); classical(4,2,3,1); Pell(25,5,3,8855); complement(25,20,3,8855). | All permitted branches witnessed; no assertion that every degree is geometrically realized. |
| §6.7 classical monodromy, :1041 | n=3,d=1 symmetric imageSO₆ has standard dimension6; ∧²SL₄ kernel has order2. d=8855 is outside the general classical conclusion's hypotheses. n=4 has no degree-exception branch, n=2 excluded. | Range and represented-image convention agree. |
| §7.1 constant-constituent rigidity, :1068 | Constant family with nontrivial G*=SL₂ has constant distinguished constituent of dimension2 and nontrivial action, refuting omission of nontranslation hypothesis. Tensor unit is constant with trivial action1. | No claim for arbitrary constituents or translating families. |
| §7.2 axes, :1084 | c=1:dimG=dimG. Two SL₂ factors on distinct axes:dimension6; two copies on one axis:diagonal dimension3. δ₀ factors give1×1=1. | Support placement distinguishes product and diagonal. |
| §7.3 no constant invariants, :1100 | Constant δ₀ has H⁰=F and fixed dimension1 for allχ, excluded by hypothesis. A nonzero invariant would produce a rank-one constant summand; all higher generic groups are0. | Geometric-origin condition applies before twisting; arbitrary-twist decomposition gap explicitly retained. |
| §7.4 Jordan, :1116 | Cyclic groups:index1; Q₈:C₄ index2; D_(2q):C_q index2. Finite projective image lifts to a finite SL_n subgroup with kernelμ_n, of ordern times projective order. | Field-independent bound and projective consequence consistent. |
| §7.5 finite detector, :1135 | For SL₂,c=2:full product dimension6 has cross-adjoint invariant dimension0; diagonal dimension3 has invariant dimension1 (identity); trivial B fixes all9 dimensions of the cross tensor. | Both iff directions discriminated. Disconnected-reductive convention R03. |
| §7.6 generic product monodromy, :1161 | c=1 gives one factor of dimension3 forSL₂. c=2 requires dimension6 on two2-dimensional summands; a diagonal tuple has dimension3, so must be exceptional. | Product, specified representation and normalizer are all needed. |
| §8.1 Frobenius avoidance, :1188 | Empty exceptional union:1 exponent tuple,0 bad. M=2,c=2:9 tuples,≤6 bad,≥3 good. (2,3)E has first-axis kernelE[2] of size4. (2,3,5)E,σ=3 mod4:16≡20≡0, whileχ−σχ=2≠0 lies in E₁. p=2 combined modulus√2≠1. | Nonzero collision values η are essential; prime-to-p range explicit. |
| §8.2 all conjugates, :1205 | E,ℓ=2,r=3:64 characters; three exceptional point cosets remove≤3, leaving≥61. Positive-dimensional subvariety restrictions lower growth exponent from2g to≤2g−2. | Finite conjugate closure, not one embedding alone, used. |
| §8.3 orbit product, :1221 | c=2,G*=SL₂:desired contained dimension6 acting on rank4; diagonal dimension3 fails. Choosingℓ≠p makes everyℓ-power order prime to p; conjugation preserves the order. | Quantifier permits exponents to depend on the conjugate. |
| §9.1 period variation, :1247 | m=1:one deck character. n=3,m′/m=2:degree64, trace∘pullback64·id. u=(1,0)ᵀ,t=(64,0):e=diag(1,0),e²=e. On a surface d=2:kerφ_L has4 points; NS alone permits the full dimension2 translation family. | Picard-fixed and rational projector conventions correct. |
| §9.2 surface finiteness, :1273 | d=1:g=2, hyperelliptic Torelli signs coincide; d=2:g=3, at most4 translations preserveL. Empty M has0 fibres. Reduced connected isotrivial parameter has constant Jacobian homomorphism; translation then lands in a finite4-point set. | Integral polarization and relative pointed-Albanese gaps retain necessary hypotheses. |
| §9.3(a) transport relation, :1292 | Constant variation:R=S². Identity transport gives diagonal; inverse and composite transports give symmetry/transitivity. Identity in Hom has fixed positive norm equal to rank under normalized Hodge metrics. | CDK orbit locus yields closed algebraic relation, not only countable union. |
| §9.3(b) trace descent, :1293 | Above64 example gives t u=64 and e²=e; swapping two identical summands conjugates e todiag(0,1)≠e. Flat transport commutes with e. | Arbitrary total-space Hodge isomorphisms would fail; transport descends. |
| §9.3(c) quotient fibre, :1294 | OverY(3),τ andτ+1 have equal full-isometry image but T∉±Γ(3); for nonellipticτ no transport identifies them. Monodromy quotient does give iff. | Distinguishes full-isometry fibre from R_V. |
| §9.3(d) finite monodromy, :1295 | E_i integral polarized automorphisms{±1,±i}:order4. Rational isometry(3+4i)/5 has norm1 and polynomialx²−6x/5+1, hence infinite order. Constant connected W has Hodge-preserving transports. | Lattice and connectedness necessary; arbitrary rational isometries not finite. |
| §9.4 finite period detection, :1314 | Identity cover givesr=1,e=1; multiples give Z_(m′)⊆Z_m. Minimal Noetherian member stays equal along multiples. Positive-dimensional fibre would give finite monodromy, incompatible with containedSL₂ (dimension3) or any noncommutative simple group. Empty M is vacuous; surfaces usem=1. | Correct transport-based descent and separate surface branch; conditional on declared geometric contracts. |

### Every comparison in §6.2

The labels below follow the order of the 21 displayed comparisons. Tests used the Eulerian recurrence with exact integers and rational arithmetic. Square roots were bounded above by a rational with denominator 10³⁰ obtained from an integer square-root bound; decimal values below are only compact displays of the already verified bounds. Every unbounded range was tested through n=150, and every bounded range in full.

| Comparison | Test n | Left side | Right side | Result |
|---|---:|---:|---:|---|
| (a) (n−1)²/2 < A₁−1 | 5 | 8 | 25 | true |
| (b) 6(n−1) < A₁−1 | 5 | 24 | 25 | true |
| (c) 28A₂ < 3(A₁−1)² | 5 | 1848 | 1875 | true |
| (d) 10A₂ < A₁² | 5 | 660 | 676 | true |
| (e) n+1+(n−1)A₁/2 < A₂ | 5 | 58 | 66 | true |
| (f) 78nA₄ < (A₁−1)³ | 5;11 | 390;8355301812 | 15625;8427392875 | true |
| (g) 341A₅ < A₁³ | 5 | 0 | 17576 | true |
| (h) 6nA₄ < A₁²A₂ | 5 | 30 | 44616 | true |
| (i) 100A₆ < (A₂−1)² | 5 | 0 | 4225 | true |
| (j) final five-term n≥5 bound | 5 | 58 | 66 | true |
| (k) 9(n−1) ≤ A₁ | 6 | 45 | 57 | true; fails at5:36>26 |
| (l) 247 ≤ A₁ | 8 | 247 | 247 | equality |
| (m) 140A₇ < A₁⁴ | 8 | 140 | 3722098081 | true |
| (n) five-term n≥11 bound | 11 | 148972.584729 (rounded) | 152637 | strict margin >3664 |
| (o) factorial bound,6≤n≤19 | 6 | 155.272386 (rounded) | 302 | strict margin >146 |
| (p) sqrt(2A₄)+1 ≤ A₁²/(48(n−1)) | 5;7 | 2.414214;49.805737 (rounded) | 169/48;50 | true |
| (q) first remaining5≤n≤10 bound | 5 | 52.308497 (rounded) | 66 | true |
| (r) second remaining5≤n≤10 bound | 5 | 56.312229 (rounded) | 66 | true |
| (s) 27·46²A₂ < 4·45²A₁² | 6 | 17253864 | 26316900 | true |
| (t) 6·13·46²A₂ < 11·45²A₁² | 5 | 10893168 | 15057900 | true |
| (u) 2A₁+3+sqrt(96A₅/(11A₁))+1 < A₂ | 5 | 56 | 66 | true |

### Headline coverage and one-tactic probe

| Headline family | Acceptance-test disposition and pin evidence |
|---|---|
| Pell solution classification; surface and threefold exterior classification; fourfold obstruction; full exterior/Eulerian classification | All five are stated with sorry. Finset.powersetCard, integer sums, finite permutations and Nat.choose are native carriers. None is a definition expansion, boundary computation or one-library-lemma consequence. |
| Uniform Jordan theorem | Stated with sorry on native finite matrix subgroups. Subgroup.index is taken in the finite group. Object searches did not find a uniform Jordan bound at either pin. |
| Generic vanishing, rigid quotient and exact faithful fibre functor | Named as unstatable in the module docstring: constructible adic perverse categories and compatible six operations are absent. A bare DerivedCategory is insufficient. |
| Arithmetic/geometric exactness, Galois normalization, hypersurface Euler/Hodge–Tate theorems | Named as unstatable; the existing abelian-variety group scheme is not a carrier for its constructible cohomology, divisors or these comparison maps. |
| Microlocal factorization, minuscule simplicity, classical convolution image | Named as unstatable; no clean conormal cycle ring or represented sheaf group at the pins. The missing proof targets R02 must also be identified in the README. |
| Constant-constituent rigidity, finite product detector, simultaneous generic monodromy | Named as unstatable. The detector's arbitrary algebraic-group representation category and normalizer/invariant comparison are not supplied by the matrix GL carrier alone. |
| Frobenius avoidance, Galois-uniform product theorem | Named as unstatable; native characters of a bare profinite group would not state geometric restriction loci or the required sheaf groups. |
| Surface/general period finiteness and transport Hodge relations | The docstring identifies the missing geometric integral variations, period maps and transport relations. Completed/HodgeStructures supplies fibre structures and period-domain points, not these variations. No stand-in is inserted. |

The 21 bespoke numerical estimates are supporting proof targets; the acceptance theorem for their purpose is exterior_eulerian_classification. Their omission from Suggested.lean is not a missing headline. No extra theorem is requested merely to expand the file.

### Supplier and ownership resolution

The table records the actual mathematical interfaces checked, not merely name matches. Main was used for existing roadmaps, the indexed current heads for earlier new roadmap suppliers, the supplied checkouts for the 55 named siblings, and board designs for the three earlier suppliers not yet exposed by the roadmap index. Paths below are repository-relative. The quoted numerical tests in the preceding tables also test the consumed conventions.

| Supplier and resolved locator | Interface checked / boundary |
|---|---|
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md:200, :368, :850, :1041, :1089, :1219 | F.0.2 based étale fundamental group, F.0.A2 arithmetic sequence, F.4 finite-extension/stable-lattice coefficients, F.2–F.3 base change/projection/Künneth, F.5–F.6 duality and tangent-bundle Gauss–Bonnet. Geometric product and closed-extension comparisons remain the two declared gaps. |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md, §§2.1–2.2,2.6–2.10,3.3–3.5,5.10 | Bounded perverse heart, finite/smooth amplitude, products, truncation and IC; rational coefficient extension and lattice-restricted analytic essential image. §5.10 is geometric-origin decomposition, so the separate arbitrary-semisimple proper-image contract is needed. Heart/Verdier comparison remains declared. |
| TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md, §§6.1–6.3,6.8 | Neutral finite-fibre Tannaka reconstruction, finite-type generated image, faithfully flat/closed criteria and tensor-isomorphism torsor. Kernel exactness is separately declared; ordinary reconstruction does not supply it. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md, A2.4,A3.1–A3.6,A4.1,A5,A6.25 | χ(L), degreeφ_L=χ(L)², isogenies/quotients/pairings, finite translation stabilizer, Tate module and relative Hom rigidity. A1.8 extends a generic-base-fibre morphism over a Dedekind base; it is not already the rational-map-on-X extension theorem. The four geometric/isogeny gaps remain necessary. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:6567, :6653, :6701, :6721, :6768, :7107 | Chow groups, cycle multiplicities/pushforward, Chern classes, regular-immersion conormal bundle and GRR/HRR. Conormal cycles of singular supports and their Gauss degrees are separately declared. |
| packages/SpringerResolutionAndCharacteristicCycles/design/README.md:815, :1028, :1212 | Y generic-length cycles; D/characteristic-cycle; H/regular-holonomic. Applies to the regular-holonomic realization used here. Does not provide a microlocal tensor fibre functor or cycle/weight dictionary (R02). |
| TauCetiRoadmap/ComplexComparisonPartII/README.md, C5.1–C5.3,C5.6,C6.6 | Geometric de Rham/Hodge and regular-singular connection interfaces; Artin comparison is C6.6 (R07). Full holonomic RH/index and coefficient independence are the declared gap. |
| TauCetiRoadmap/PadicHodgeTheory/README.md, §§3.3,8.1–8.2 | Native HT(Q_p(1))=+1; H^a(Ω^b) appears with Cp(−b). Thus b=1 gives weight−1. Image-cocharacter comparison is declared separately. No arbitrary extension closure is assumed. |
| TauCetiRoadmap/ReductiveGroups/README.md, Layers6–10 | Connected reductive groups, derived groups, isogenies, root data, outer automorphisms and rational representations. Does not silently turn a finite disconnected group into an object of the connected reductive carrier (R03). |
| TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md, Layers4,6,8 | Irreducible highest weights, Weyl dimension formula, minuscule Pieri rule and exceptional dimensions. A Cartan component of rλ has growing dimension; minuscule tables are not inferred solely from Pieri. |
| TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md, Layers4–5 | Spin/half-spin dimensions 2^r and 2^(r−1), their actual Spin action and central kernels. An SO representation is not substituted for a spin representation. |
| packages/LieHighestWeightPartII/design/README.md, N2 | Classical highest-weight comparisons; complete nonzero minuscule table remains the declared gap. The zero weight is separately excluded by N≥6. |
| TauCetiRoadmap/MordellLawrenceVenkatesh/README.md, §§0.22–0.24 | Lie-Goursat for noncommutative simple factors and its finite-product form. For two SL₂ factors, graph dimension3 versus product6 is the relevant alternative. |
| TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3850, :4377, :4760, :4910, :4936; §§2.18,2.56 | Descent-indexed Eulerian numbers, sum/recurrence/symmetry, unimodality, exponential/factorial bounds, square-separation and n≥11 ratio bound. n=10 gives1291680>1026169, so that supplier's threshold cannot be shortened. The bespoke §6.2 comparisons are not its existing targets. |
| TauCetiRoadmap/DeligneWeightsAndPurity/README.md, §§0.1–0.3,0.11,1.4 | Weil weights, powers, inverses, abelian-variety bound. Geometric inverse weight-one eigenvalue multiplied by cyclotomic p has modulus√p, including√2 atp=2. |
| TauCetiRoadmap/ShimuraData/README.md, §§3.1–3.4 | Integral/rational polarized variations, tensor/Hom operations and rational Hodge-idempotent splitting. Bounded-norm finite Hodge loci and a fixed-orbit locus are the separate declared gap. |
| Completed/HodgeStructures/README.md:310–324, :377–391 | Positive Hodge metric, fixed polarization, period-domain points and integral lattice isometries. Does not own the geometric variation or period-map finiteness theorem. |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md, §§1.1–1.2,2.1 | Projective section space and smooth-family parameter geometry. Points are nonzero sections modulo scalar, so the zero section is not a divisor parameter. |
| packages/StableReductionPartII/design/README.md:19938–19980, §MC.6/torelli-finite-fibres | Fine full level N≥3 and finite Torelli fibres; at most2 signs, one class in genus2. Integral polarized Jacobian comparison is explicitly still a gap. |
| TauCetiRoadmap/JacobianChallenge/README.md, LayerF | Pointed Abel–Jacobi over fields. It does not already supply the reduced-connected-base relative universal property. |
| TauCetiRoadmap/JacobianChallengePartII/README.md, §§2.1–2.4 | Relative Abel morphisms, base change and closed immersions in the stated genus range. Pointed family Albanese factorization remains explicitly declared. |

The three “not found” names in the supplied citation scan resolve to the above board designs; they are not reported as missing. Ownership searches used both the roadmap service and object searches through the main/completed roadmaps, board packages and the 55 supplied sibling checkouts (110 README/Lean files). Characteristic cycles, abstract Tannaka reconstruction, Eulerian-number identities, Hodge structures and Lie-Goursat have existing owners and are imported. No competing declaration with a kept fully qualified Lean name was found.

The general Jordan theorem is not a target in the searched earlier library roadmaps. packages/MappingClassGroupsAndCanonicalRepresentations/design/README.md:1667 records an unresolved request for such a theorem, proposed for a future CharacterTheory extension, rather than stating it as supplied. This package is the present theorem owner; the earlier consumer must resolve its own supply direction if it later consumes this theorem. Clean abelian cycle convolution, the exterior-row obstruction and the geometric transport-period application have no competing target in the supplied sibling heads. Generic microlocal category constructions needed to prove them are still missing as R02 explains.

All 16 declared gaps have named suppliers, matching slugs and concrete interfaces. They do not duplicate a pinned theorem or the checked supplier's current target. In particular, field-extension full faithfulness is about objects defined over the smaller field, semisimple proper image includes nongeometric local systems, and the Hodge-locus contract gives finite bounded-norm loci rather than only a countable union. Acceptance of these contracts does not certify a future implementation.

## Not verifiable

- No Lean compilation or fresh elaboration was performed, as expressly prohibited. The supplied elaborated-signature record is the evidence for the ten elaborated types. Truth was reviewed independently of that record.
- The bounded arithmetic searches do not prove the infinite Pell/exterior classifications or the unbounded inequalities. Source arguments and hypotheses were compared; the future Lean proofs remain obligations.
- The 16 declared supplier contracts have not yet all been implemented. Their matching declarations, scope and ownership were checked; this review is conditional on those contracts, not a claim that they exist at the library pins.
- The three board-design suppliers resolve the citation scanner's missing-name leads, but their eventual packaged APIs cannot be certified in advance.
- Ownership against the supplied sibling checkouts and the indexed roadmap corpus was checked. Other authors' unprovided, unindexed working copies were not available and were not sought.
- The source errata below concern the cached versions explicitly cited. No claim is made that they remain in, or were corrected by, a later published version; no published correction was verified.
- No missing-reference request is necessary: all nine cited works were available legally in the provided cache. No source text was copied into this report or the repository.

## Source issues

- **Misprint** in LS at Lemma 3.3 proof, p.20 (LS line 887): the source says the cotangent top Chern degree carries the Euler-characteristic sign; it should be positive [H]^n for cotangent, with (−1)^(n−1) appearing for tangent; affects the proof.
- **Misprint** in LS at Lemma 3.8, p.21 (LS line 968): the source says the representation belongs to the Lie algebra of H; it should be the Lie algebra of G_H; affects a stated result.
- **Misprint** in LS at Lemmas 3.8–3.9 proofs, pp.21–22 (LS lines 969 and 1015): the source says the smooth divisor's perverse constant object has shift n; it should have shift n−1; affects the proof.
- **Misprint** in LS at Lemma 3.8 proof, p.21 (LS line 972): the source says the minuscule criterion is K1 Corollary 1.0; it should be K1 Corollary 1.10 in the cited version; affects the proof.
- **Misprint** in LS at Lemma 3.9 proof, p.22 (LS line 996): the source says the clean characteristic cycle is K2 Definition 2.1.1; it should be K2 Definition 2.2.1; affects nothing.
- **Misprint** in LS at Lemma 3.9 proof, p.22 (LS line 1016): the source says [m] multiplies by n; it should multiply by m; affects the proof.
- **Error** in LS at Lemma 3.9 proof, p.22 (LS line 1020): the source says the ordinary Euler characteristic of H is n!d; it should be (−1)^(n−1)n!d, while the perverse Euler characteristic and Gauss degree are n!d; affects the proof.
- **Misprint** in LS at Lemma 3.9 proof, p.23 (LS line 1028): the source says the product decomposition equals Λ_H after applying the isogeny; it should equal [m]_*Λ_H, or Λ_Y after its generic-degree-one identification; affects the proof.
- **Error** in LS at Lemma 3.9 proof, p.23 (LS lines 1049–1053): the source says a maximal proper subvariety equals the entire inverse image and forces an isomorphism; it should only be an irreducible component, and the resulting finite map need only be an isogeny; affects the proof.
- **Misprint** in LS at Lemma 3.10, p.23 (LS line 1061): the source says SO_m has the spin representation; it should use Spin_m or its faithful represented quotient, since spin does not descend to SO_m; affects a stated result.
- **Gap** in LS at Lemma 3.10 proof, p.23 (LS line 1064): the source says simplicity follows from Lemma 3.9 without a dimension restriction; it should retain n>2 or supply an independent surface argument; affects the proof.
- **Misprint** in LS at the Hodge–Tate definitions before Lemma 3.13, p.25 (LS lines 1127–1130): the source says untwisted invariant spaces define every weight and sums the weights to obtain dimension; it should insert the q-dependent Tate twists and sum their multiplicities; affects the proof.
- **Misprint** in LS at Lemma 3.14 proof, p.26 (LS line 1180): the source says hypersurface cohomology concentrates in degree zero; it should concentrate in degree n−1 before the perverse shift; affects the proof.
- **Misprint** in LS at Lemma 3.14 and Theorem 4.7 proofs, pp.26,34 (LS lines 1182 and 1550): the source says normalization is Lemma 2.9(2); it should cite Lemma 2.9, which has no numbered part (2); affects nothing.
- **Misprint** in LS at Lemma 4.2, p.30 (LS line 1360): the source says the axis-supported sum uses direct images of A₁ and A₂; it should use direct images of K₁ and K₂; affects a stated result.
- **Error** in LS at the generic-vanishing paragraph before Lemma 4.4, p.30 (LS line 1392): the source says arbitrary perverse sheaves have torsion exceptional translates; it should require geometric origin for torsion translates, since a nontorsion rank-one twist has a nontorsion exceptional point; affects a stated result.
- **Misprint** in LS at Theorem 4.7 proof, p.34 (LS line 1565): the source says Lemma 4.3 supplies the axis construction; it should cite Corollary 4.3; affects nothing.
- **Gap** in LS at Lemma 4.8 proof, pp.34–35 (LS lines 1591–1598): the source says the cyclotomic Frobenius lift multiplies every torsion character by p^m; it should restrict this argument to prime-to-p torsion, since multiplication by p is not a p-power-torsion automorphism; affects the proof.
- **Misprint** in LS at Lemma 4.8 proof, p.35 (LS lines 1601–1602): the source says at most (M+1)^(c−1) tuples lie outside each bad coset; it should bound the tuples inside that coset; affects the proof.
- **Error** in LS at Lemma 4.8 proof, p.35 (LS lines 1607 and 1614–1619): the source says an axis inverse image is the connected restriction kernel; it should retain its finite torsion components, as (2,3)E has four first-axis points; affects the proof.
- **Misprint** in LS at Lemma 4.9 proof, p.36 (LS line 1647): the source says ℓ^(2kn) counts characters killed by ℓ^(2k); it should count characters killed by ℓ^k; affects the proof.
- **Misprint** in LS at Proposition 4.11 proof, p.37 (LS line 1723): the source says the compared total cohomologies mix the levels m′ and m; it should use level m′ on both varying fibres; affects the proof.
- **Gap** in LS at Proposition 4.11 proof, pp.37–38 (LS lines 1713–1725): the source says fibre isomorphism gives descending Hodge relations and finite monodromy without specifying the integral transport; it should use flat transport commuting with trace projectors and the polarized integral lattice to justify these steps; affects the proof.
- **Gap** in LS at Proposition 4.11 proof, p.38 (LS line 1745): the source says Lemma 3.9 supplies simplicity for every n≥2; it should treat n=2 separately because Lemma 3.9 assumes n>2; affects the proof.
- **Misprint** in LS at Lemma B.7 proof, p.96 (LS line 4643): the source says a quadratic expression without completing its equation; it should append equality to a+b; affects nothing.
- **Misprint** in LS at Lemma B.8 proof, p.96 (LS line 4658): the source says the initial excluded pair has m=a(2); it should have m=a(1)+a(2), with k=a(1); affects the proof.
- **Gap** in LS at Appendix C opening, p.116 (LS lines 5745–5750): the source says the Appendix B comparisons follow from large-n bounds and ancillary finite computation without supplying each certificate; it should provide thresholds and exact finite checks for every asserted range; affects the proof.
- **Error** in K2 at Proposition 6.1.1, pp.29–30 (K2 lines 1402–1413): the source says nonsimplicity modulo centre always yields two positive-degree factors; it should exclude zero derived Lie algebra: δ₀ has degree1 and cannot factor into degrees greater than1; affects a stated result.
- **Gap** in EHS at Theorem A.1(iii) proof, p.20 (EHS lines 780 and 806–818): the source says induction is a functor between finite-dimensional representation categories; it should work first with all comodules and then select finite-dimensional subcomodules; affects the proof.
- **Misprint** in EHS at equation (A.5), p.20 (EHS line 817): the source says the descent isomorphism has k[A] tensor an undefined V on the right; it should have k[G] tensor W; affects the proof.
- **Misprint** in W at the unnumbered Proposition proof, pp.1–2 (W lines 36–44): the source says ordinary Hom equals the derived global Hom complex; it should take degree-zero cohomology on the derived side, or consistently use derived Hom; affects the proof.
- **Gap** in LS at Lemma B.10 proof, p.100 (LS lines 5060 and 5073–5074): the source says the explicit ratio formulas imply strictness without a zero-factor case; it should use a non-strict bound, strengthening it only when both adjacent multiplicities are positive; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f1720ea2b3a2bc6e4e7deb1dac9ed780b04ce89d", "job": "RT-SheafConvolutionOnAbelianVarieties~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
