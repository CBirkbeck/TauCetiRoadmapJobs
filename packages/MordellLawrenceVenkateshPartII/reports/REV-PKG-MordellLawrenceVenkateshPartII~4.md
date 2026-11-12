<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6785814483 -->
Review (codex) of 5aa38a9

Verdict: needs_changes

1. **F01** (P2) Horizontal tensors are not necessarily Hodge tensors

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1406`, also the second Check at line 1415: “the orbit is cut out by the horizontal tensors … which every Hodge filtration respects”.

   **Claim:** Every flat tensor of the connection-generated category preserves the Hodge filtration, and this characterizes the period orbit.

   **Witness:** Constant elliptic H¹: F¹=ℂ(e₁+i e₂). The flat endomorphism A=diag(1,0) sends e₁+i e₂ to e₁∉F¹. See also `TauCetiRoadmap/ShimuraData/README.md:409`, §3.2, open pull request #1038.

   **Exact repair:** Delete the assertion about all horizontal tensors and qualify the Check to concern a tensor that is a morphism of Hodge structures, such as the polarizing form. Give the actual route of LS Lemma 6.1: the complex period image lies in a monodromy orbit; the connection's tensor-isomorphism torsor has an equivariant map to the flag variety; its complex horizontal lift meets every torsor fibre, so the equivariant image, and hence the p-adic lift's image, lies in that orbit. LS lines 2913–2939 explicitly distinguish the tensor structure from the filtrations. Keep the complex single-orbit assertion as part of this target, rather than replacing its proof by the false tensor assertion. Add the constant elliptic example as a negative-control Check. On that example the period orbit is one point, while A is flat and fails to preserve its filtration; the corrected argument still gives the one-point orbit. This finding concerns the explanation and Check, not a counterexample to the single-orbit theorem.

2. **F02** (P2) Import mixed-Hodge strictness from its existing owner

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:591`, with the Needs line at 611: “Strictness of morphisms of mixed Hodge structures … give the kernels and cokernels”.

   **Claim:** The listed suppliers provide the mixed-Hodge strictness used to build the general category in §0.3. The only Hodge-morphism supplier listed there is ShimuraData §3.2.

   **Witness:** `TauCetiRoadmap/ShimuraData/README.md:388` restricts to variations of the same pure weight. Mixed strictness already exists in `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:118`, `:131`; no such import is credited in this package.

   **Exact repair:** Add the native mixed-Hodge input to Scope and ownership, From Tau Ceti, §0.3 Needs and Layer 0 Dependencies. Cite `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`, `range_inf_WC_eq_map_WC` and `range_inf_WQ_eq_map_WQ` at those lines. Apply these fibrewise; the compatible-system construction and local-system gluing remain this roadmap's work. Do not re-plan strictness or restrict the category to pure systems. The native carrier uses integral/rational/complex base-change data; a rational fibre can be presented by choosing a lattice, without claiming a global flat integral lattice. Test the repair on the projection ℚ(0)⊕ℚ(−1)→ℚ(−1): at F¹ both strictness sides have dimension 1; at W₀ both have dimension 0. This is genuinely mixed, outside the cited pure supplier, and inside the pinned strictness theorem. No additional Lean acceptance declaration is needed.

3. **F03** (P3) Correct the direction of the character-induced map

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1709`: “restriction of characters gives a canonical inclusion `ι_(GM) : a_G → a_M`”.

   **Claim:** Character restriction induces the displayed inclusion under the preceding dual-space identification.

   **Witness:** For GL₂ and its diagonal Levi, restriction sends det to (1,1). Its dual sends (x,y) to x+y, hence goes a_M→a_G. LS line 3391 instead constructs the inclusion from the centres.

   **Exact repair:** Say that inclusion of connected centres induces a_G→a_M, while restriction of characters induces the opposite projection; these split one another. Add the normalization Check: in scalar-cocharacter coordinates, a↦(a,a) and (x,y)↦(x+y)/2. Thus 1↦(1,1)↦1, while (1,0) projects to 1/2. This preserves the existing central-weight and modular-character formulas and fixes the construction's direction.

4. **F04** (P3) The orthogonal cohomology Check needs positive rank

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1371`: “`H¹(ℚ_p, O_n)` … is finite but not a single point”.

   **Claim:** The orthogonal-group example is nontrivial at every rank admitted by the paragraph.

   **Witness:** At n=0 the unique quadratic space is zero, O₀=1, and H¹(ℚ_p,O₀) has cardinality 1, not greater than 1.

   **Exact repair:** Require n≥1 for the non-singleton assertion and explicitly record the rank-zero singleton. Test n=1: O₁=μ₂, giving 4 classes over ℚ₃ and 8 over ℚ₂. The general finiteness theorem retains rank zero and p=2.

5. **F05** (P3) Preserve the empty-permutation Eulerian convention

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2286`: “Throughout, `A(n, q)` is the Eulerian number … extended by zero outside `0 ≤ q < n`”.

   **Claim:** This unrestricted convention agrees with the imported definition and with `eulerian` in Suggested.lean.

   **Witness:** `Suggested.lean:59` counts the unique permutation of Fin 0 with zero descents, giving A(0,0)=1. `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3010` explicitly preserves this value; the displayed support rule instead gives 0.

   **Exact repair:** Qualify the support rule by n≥1 and retain A(0,0)=1, A(0,q)=0 for q>0, or explicitly restrict the entire Layer 8 notation paragraph to n≥2. Add a README Check distinguishing the empty permutation from the empty sum over q<0. The values are respectively 1 and 0; the Lean inequality is unchanged because its hypothesis is n≥2. Do not add a boundary-case theorem to Suggested.lean.

Five findings: two P2 and three P3. All six findings from round 3 are repaired. Neither Lean headline is refuted; the required elaboration succeeds. The package is repairable without changing its scope.

## Verified sound

### Previous findings, checked before the new pass

Locations in this table are in `packages/MordellLawrenceVenkateshPartII/README.md`, except where specified. No preceding finding was marked not actionable.

| Round-3 finding | Repaired passage and recomputed witness | Status |
|---|---|---|
| F01, parabolic versus filtration | §2.5, lines 1165–1203: “it does not determine the filtration, not even the chain of subspaces once the indices are forgotten”. For the torus with weights ±1, μ and −μ have the same parabolic but intermediate spaces ℚe₊ and ℚe₋. SL₃ cocharacters (1,0,−1), (2,1,−3) give positive root weights (1,1,2), (1,4,5) and different chains. Summary, §§5.5/5.8 and examples now retain only the parabolic. | Repaired. |
| F02, vanishing on all components | §3.4, lines 1500–1520: “The product `H = H₁⋯H_r` is nonzero because `X_ℂ` is irreducible”. For I=(xy), x has no power in I, whereas xy∈I; for I=(z²), z²∈I but z∉I. Local finiteness and irreducibility supply the two missing steps. | Repaired. |
| F03, shared stabilizer carrier | §10.1, lines 2653–2660: “scheme-theoretic stabilizer of HeightsRationalPointsAndObstructions §5.2 for `X = H`”. Its all-test-schemes contract is also in Scope, supplier contracts and Needs. Point, whole abelian variety and pullback by [2]×id have stabilizers 0, A and a group of order 4. | Repaired. |
| F04, zero coefficient algebra | §1.5, line 862: “Let `E` be a nonzero finite étale coefficient algebra”. §1.4 records that rank is nonunique over E=0; §§1.1, 1.7 and 2.1 agree. Over E=0 the zero pairing is perfect with any rank label; over ℚ a rank-one alternating pairing is zero and not perfect, while the standard rank-two matrix has determinant 1. | Repaired. |
| F05, native intersection carrier | Contract, lines 243–249: “any scheme `C` over a field `k`”. Native intersectionNumber is defined for C=X=Spec k; its value on the trivial class is 0. The proper-curve interpretation is distinguished from the unrestricted truncated degree. | Repaired. |
| F06, pages and manifest ranges | §8.2 says “Lemma A.2, p. 91”; §8.3 also uses p.91; §10.7 says “pp. 87–88”. LS line 4245 follows the page-91 marker, and the quotient proof continues at LS line 4027 on p.88. Both manifest Layer 3 ranges end at 3.4. | Repaired. |

### Coverage and principles

Read all four package files, the preceding review and repair, the board index, all 79 numbered targets, all Needs lines and all six declared supplier contracts. Re-examined the changed passages and their propagated patterns; reused earlier adversarial evidence only where its rows contained actual computed values for unchanged assertions. In particular the earlier tables did not establish the all-horizontal-tensors assertion or the direction of character restriction: those now have explicit counterexamples above.

The package is a Part II extension of MordellLawrenceVenkatesh's one-dimensional work. It imports the base roadmap, convolution monodromy, abelian moduli, comparison and root-theoretic infrastructure instead of rebuilding those plans. The mixed-strictness omission is R02. No route-specific restriction to conveniently chosen good primes replaces a general library statement. The unramified comparison hypotheses are stated, with the missing relative comparison declared as a supplier contract. The projective monodromy target includes the small-degree cases and the cubic-surface exception.

Compared the shape with main's JacobianChallenge, ComplexKahlerGeometry and ReductiveGroups. The summary, ownership, conventions, exact contracts, build paragraph, mathematical layers, Examples, Dependencies, downstream section and references are present. All 79 targets have Checks and Needs; definitions retain API lists and at least three Checks. The discovered false or mismatched Checks/conventions are findings, not evidence of compliance merely because their count is adequate. The layer order is explained by realizations → coefficients/groups → period and incidence estimates → applications, with the independent Eulerian branch explicitly separated. No source-chapter heading, copied passage, algorithmic deliverable, prohibited supplier, process residue, sorry'd data, set_option, own lemma declaration or Lean API catalogue was found.

### Seeded source sample

All fifteen requested targets were examined. Four manifest works have readable legal cached texts; Serre remains settled uncertified. There are no additional author-flagged unresolved locators to fetch and no new source key was added. LS locators use arXiv v5; LV locators use the publisher-formatted text and printed pagination, including the non-strict first numerical inequality.

| Target | Source opened | Result, including hypotheses and pages |
|---|---|---|
| 0.3 Tensor category | LS lines 1981–2005, Definition 5.11 and Lemma 5.12, pp.43–44 | Compatible maps, tensor operations, exactness and connected-base fibre functor agree. The mixed strictness proof input needs the ownership correction R02. |
| 0.6 Differential monodromy | LS lines 1916–1925, Definition 5.6, p.42 | The group is attached to the connection, not the arithmetic Galois representation; regular singularity is needed for comparison with the Zariski closure of complex monodromy. |
| 1.2 Finite étale operations | LS lines 2064–2139, Examples 5.15, 5.17–5.21, pp.45–47 | Group algebra, convolution dual, smooth proper H⁰ and étale pushforward match. The package correctly uses D_cris and φ^f rather than the source's problematic naive Frobenius formula; see Source issues. |
| 1.4 Equidimensional modules | LS lines 2164–2186, Definitions 5.24–5.25 and Lemma 5.26, pp.47–48 | Equal geometric ranks and freeness match; the repaired text handles the empty algebra separately. |
| 2.7 Adjoint profiles | LS lines 2760–2775, Definitions 5.44–5.45, p.60; LV lines 2853–2880, (10.2)–(10.3), pp.968–969 | Multiplicity, interpolation and endpoint domain agree. The package correctly uses decreasing-filtration quotient Fᵃ/Fᵃ⁺¹, correcting LS's denominator. |
| 2.10 Semisimplification geometries | LS lines 2849–2881, Lemmas 5.50 and 5.52, p.62 | E-defined parabolic/Levi pairs, rational centralizer conjugacy and reductive identity component agree; it is finiteness of classes, not of all parabolics. |
| 2.11 Local H¹ | Serre I §5.4, Corollary 1 to Proposition 36; III §4.3, Theorem 4 | Source text unavailable under the settled uncertified status. Independently checked the local finiteness route and normalizer/centralizer distinction; R04 corrects its zero-rank Check. |
| 3.1 Single orbit | LS lines 2902–2939, Lemma 6.1, pp.63–64 | Source supports the torsor/period-map argument. It explicitly does not identify preservation of the connection's tensor structure with preservation of filtrations: R01. |
| 3.2 Parabolic stabilizer | LS lines 2940–2954, Lemma 6.2, p.64 | Polarized pure variation, connected monodromy and normality input retained. Positive-power lifting of the inner cocharacter gives the parabolic. Normality is a declared gap. |
| 5.1 Central weights | LS lines 3382–3416, discussion and Definition 8.4, pp.74–75; LV §§11.1–11.2, pp.985–986 | Central pairing and inverse determinant agree. LS line 3391 uses inclusion of centres, exposing R03. |
| 7.8 Point-count bound | LV lines 3865–3941, Lemma 12.1 and proof, pp.995–996 | Positive integer M and primitive cohomology retained; the package strengthens the cutoff to frequency 2M while retaining 3b²/M. |
| 8.2 Difference law | LS lines 4237–4249, Lemma A.2, p.91; LV lines 2955–2992, §10.2 | Normalization, difference rather than unshifted sum, finite support and reflection match. The corrected p.91 locator is right. |
| 8.3 Variance/log-concavity | LS lines 4245–4254, Lemmas A.2–A.3, p.91; LV (10.9)–(10.10), pp.972–973 | n≥2, second moment (n+1)/6 and contiguous support are right. Log-concavity/variance is explicitly requested from the named earlier supplier. |
| 8.7 Projective asymptotics | LV lines 2930–2970, (10.6)–(10.8), pp.970–972, particularly the continuation on p.971 | Fixed n, then d→∞; adjoint normalization d^(2n)/2 and parameter growth d^n agree after the documented printed-dimension correction. |
| 10.7 Primitive quotients | LS lines 4013–4030, Corollary 9.3 and proof, pp.87–88 | Full finite stabilizer, primitive quotient and multiplication of normalized degree agree. The corrected page range contains the end of the argument. |

Also read BC Theorem 10.13/Remark 10.14 at BC lines 1341–1352 (PDF p.34), and Beauville Theorems 2/4 at Beauville lines 84–104 and 129–155 (printed pp.10–12), for the primitive-Hodge and projective-monodromy inputs. The residue bidegree, ambient-dimension shift and cubic-surface exception agree.

### Adversarial computations

These rows cover the seeded sample, headline theorems, every new finding and the changed mathematical passages. They supplement the preceding review's computed rows for the unchanged targets; they are not claims that a successful sorry build proves the mathematics. Fresh enumeration of permutations through n=7 agrees with the independent recurrence through n=9. Jacobian rows were obtained by multiplying (1+t+⋯+t^(d−2))^(n+1).

| Statement | Instances | Values on the two sides | Result / change |
|---|---|---|---|
| §0.3 strictness and faithfulness | Projection ℚ(0)⊕ℚ(−1)→ℚ(−1); disconnected two-point base | dim(im f∩F¹)=dim f(F¹)=1; dim(im f∩W₀)=dim f(W₀)=0. Map (0,1) has first fibre 0 but is nonzero. | Mixed input required; R02. Connectedness excludes the faithfulness counterexample. |
| §0.6 group attached to a connection | Constant quadratic H⁰; dense SL₂ | Arithmetic permutation has order 2, geometric group is 1; dense SL₂ has dimension 3, not GL₂'s 4. | Correct distinctions. |
| §1.2 coefficient operations | C₃; unramified residue degree f=2 with a swap | ℚ[C₃]=ℚ×ℚ(ζ₃) has two rational factors, whereas ℚ³ has three. Correct φ² acts by the swap, of trace 0; naive (swap⊗σ)² is identity, trace 2. | Package's convolution and crystalline conventions pass; source formula does not. |
| §1.4 ranks | E=ℚ², ranks (2,2) and (1,3); E=0 | Both nonzero examples have total dimension 4, but only (2,2) has equal ranks. Over E=0, 0≅E^N for every N. | Equal total dimension is insufficient; repaired rank uniqueness has E≠0. |
| §1.5 parity | E=ℚ, alternating ranks 1 and 2; E=0 | Rank-one matrix (0) has determinant 0; rank-two standard matrix determinant 1. Over E=0, 0→Hom(0,0) is an isomorphism even with label N=1. | Zero-algebra exclusion repairs parity. |
| §2.5 filtration class | Torus on e₊,e₋; SL₃ cocharacters (1,0,−1),(2,1,−3) | Torus parabolics both G but F¹ lines differ. Positive SL₃ root weights (1,1,2) versus (1,4,5); chain dimensions 1,3,5,7,8 versus 1,2,3,5,6,7,8. | Repaired statement passes beyond GL₂. |
| §2.7 top-weight function | Weights 2,0,−2; zero profile; doubled profile | T(1/2)=1, T(1)=T(2)=2, T(3)=0; zero profile only T(0)=0; doubled T(1)=2=2T(1/2). | Multiplicity, endpoints and restriction-of-scalars scaling pass. |
| §2.10 finite geometries | H=1⊂GL₂; H=diagonal torus⊂GL₃ | Two GL₂ pair classes, (B,T) and (G,G). Ordered partitions of three labels: 1+6+6=13. | Finiteness is modulo the correct centralizer action. |
| §2.11 local H¹ | GL_n; μ₂ at p=3,2; O₀; tori in GL₂/ℚ₃ | Cardinalities 1; 4 and 8; 1. Tori have four normalizer-kernel classes versus one centralizer-kernel class. | Finiteness/marking pass; non-singleton O₀ Check fails, R04. |
| §3.1 all horizontal tensors | Constant elliptic line L=ℂ(1,i); A=diag(1,0) | A(1,i)=(1,0); determinant of (1,i),(1,0) is −i≠0, so A(L)⊄L. Actual orbit cardinality 1. | False tensor characterization, R01. |
| §3.1 polarizing-tensor Check | Symplectic rank four | B(e₁,f₁)=1, while B restricted to span(e₁,e₂) is 0; both planes have dimension 2. | Valid once explicitly restricted to Hodge tensors. |
| §3.2 parabolic orbit | Constant variation; elliptic SL₂; torus acting on ℙ¹ | Dimensions 0 and dim SL₂−dim B=3−2=1. Torus's open orbit has dimension 1 and is 𝔾_m, not projective. | Hodge/normality hypotheses matter; arbitrary group orbits do not suffice. |
| §3.3 correct ambient | Varying elliptic plus constant elliptic | In X×D_mon, codimensions give 1≥0+1; using the larger compact dual would give 3≥2+3, false. | Declared orbit-form contract retained. |
| §3.4 all components | I=(xy), H=x versus H=xy; I=(z²), H=z | x^m mod(y)=x^m≠0 for every m; xy∈I; z∉(z²) but z²∈(z²). | Product over all local components and a radical exponent are both necessary and now present. |
| §§5.1/5.3 signs and maps | GL₂ upper Borel; diagonal Levi | Restriction det↦(1,1); dual (x,y)↦x+y in determinant-dual coordinates, or (x+y)/2 in scalar coordinates. γ(diag(t,1))=t⁻¹, pairing −1. | Sign passes; map attribution fails, R03. |
| §5.3 balance | Blocks 2+2+2 and 4+4+4 | First weakly balanced rank triple only (1,1,1). In the second, (1,4,1) has modular weight 0 but averages (1/4,1,1/4)≠(1/2,1/2,1/2). | Correct distinction and corrected examples. |
| §§5.5/5.8 parabolic-only types | Auxiliary exponents (1,0) and (5,0) | Both give B and the same Levi T, whereas their actual F² have dimensions 0 and 1. | Only auxiliary parabolic is forgotten; Hodge filtration remains part of the type. |
| §6.1 coefficient headline | GL₂ profile h=(1,2,1), base dimension 1,c=30 | D=4,rank=2,A=B=1; x=5/30=1/6; 1≥1/6 and 1>1/6+1/6. | Hypotheses are satisfiable, not an empty criterion. |
| §§7.6/7.7 family headline | Elliptic monodromy; finite reduced zero-dimensional closure | dim Sp₂=3, dim GSp₂=4; h⁰=2,A=1,dim Y=1 gives required 1≥3 false. A closure of r geometric points has at most r rational points. | Small family correctly fails numerical test; finiteness induction ends at dimension 0. |
| §7.8 centralizer bound | Kernel M=1,2,3 | Frequencies reach 2,4,6; squared norms 19,85,231; ratios 9/19≤3/4, 25/85≤3/8, 49/231≤1/4. | Corrected frequency 2M essential; estimate survives. |
| §8 opening / eulerian | n=0 and n=1 | A(0,0)=1 but sum over q<0 is 0; A(1,0)=1, giving 2ΣA²=2>1=(1!)². | R05 fixes n=0 convention; n≥2 in theorem is substantive. |
| §8.1 adjoint profiles | n=2,d=1 GL₂/GSp₂; nongeometric GO₂; n=3,d=1 GO₆ | 2h⁰=4<6 for GL₂/GSp₂; GO₂ gives 4<4 false. GO₆ has h⁰=8, giving 16<16+4=20. | Geometric parity excludes source counterexample. |
| §8.2 difference law | n=2,3 | β at n=2 is (1/4,1/2,1/4); n=3 is (1/36,2/9,1/2,2/9,1/36), sum 1. At n=2 central shifted convolution=1/2, unshifted=1/4. | Difference and reflection shift agree. |
| §8.3 variance and concavity | n=2,3,4 | Second moments 1/2,2/3,5/6 equal (n+1)/6. At n=3, β₁²=4/81≥β₀β₂=1/72 and β₀²=1/4≥β₁²=4/81. | Moment and log-concavity pass. |
| §8.4 Lean headline | n=2,3,4,5,6 | LHS 4,36,488,11420,377816; RHS 4,36,576,14400,518400. | Equal at 2,3; strict in the remaining examples. |
| §8.4 small/large bridge | n=7,8,9 | LHS 17405640,1049776080,80786169900; RHS 25401600,1625702400,131681894400. Variances 4/3,3/2,5/3. | Direct cases agree; n≥8 contradicts the hypothetical strict variance bound <3/2. |
| §8.5 large c | Same GL₂ profile, e=1,c=25 | x=5/25=1/5; A=1≥1/5 and B=1>2/5; T(0)=0. | Stated sufficient c works. |
| §§8.6/8.7 primitive Hodge row | (n,d)=(2,3),(3,4),(4,5),(5,4),(3,3),(4,2),(3,2) | Rows (1,1),(1,19,1),(1,101,101,1),(0,21,141,21,0),(0,6,0),(0,0,0,0),(0,1,0). | Coefficients, quadrics and zero slots agree. |
| §8.7 asymptotics | Plane curves; plane quartics | g=(d−1)(d−2)/2 has leading coefficient 1/2; adjoint h⁰=1+g² gives h⁰/(d⁴/2)→1/2=β₀. Quartic parameter dimension binom(6,4)−1=14, not 19. | Normalization and corrected dimension pass. |
| §8.8 limit scale | Difference of descent counts; n=6400,6401 | Limit variance 1/12+1/12=1/6; 40/√6400=1/2 and 40/√6401<1/2. | Proper scale and strict cutoff. |
| §9.1 native smoothness | F=0; x₀; Σxᵢ^p in characteristic p=2,3 | Zero gradient for first and third; ∂₀x₀=1. A nonzero root (1,−1,0,…) makes the inseparable form singular. | Rejects zero/nonreduced examples; linear form accepted. |
| §9.3 Lean headline | Degree d coefficients and scaling by c | Number of coordinates binom(n+d,d); for n=2,d=4 it is 15, projective dimension 14. Homogeneous G satisfies G(cF)=c^eG(F). | Native signature expresses projective non-density; thresholds precede S. |
| §§10.1/10.7 stabilizer and quotient | Point; A; primitive divisor pulled back by [2]×id | Stabilizers 0,A,ker([2]×id); last has order 4 and d(H)=4d(H′). For trivial kernel, d(H)=d(H′). | Imported all-schemes carrier and quotient degree agree. |
| §§10.6/10.9 Shafarevich headlines | Exceptional pair (5,20), degree 17710 | binom(25,5)/6=8855; 17710≠8855 but 8855 divides 17710. | Primitive theorem uses equality exclusion; general theorem excludes exceptional divisors of d. |
| §10.10 surface headline | Principal class; doubled Jacobian homomorphism | φ²=2 gives genus 1+φ²/2=2; q(2h)=4q(h). | Curve-Shafarevich and positive quadratic form have the required nondegenerate inputs. |
| Repaired native intersection contract | C=X=Spec k, trivial class | Defined in dimension 0; truncated degree difference is 0. | No curve-only restriction on the native definition. |

### Lean acceptance, signatures and padding

Ran `lake env lean` on the actual `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the pinned content checkout: exit **0**, with only “declaration uses sorry” at **69:8** and **106:8**. Its only import is `import Mathlib`; no Tau Ceti build was needed.

Elaborated a scratch copy with `#check @name` for all six actual declarations: `eulerian`, `eulerian_central_mass_le_half`, `HypersurfaceMonomial`, `IsSmoothHypersurface`, `HasGoodReductionOutside`, `integralHypersurfaces_not_zariskiDense`. The supplied count of seven includes a parser artefact. The n≥2 binder, field instance, prime hypothesis and induced Fact instance, homogeneous degree and quantifier order `∃n₀ ∀n≥n₀ ∃D₀ ∀d≥D₀ ∀S ∃G` survive. No section binder was lost and no signature was changed. R05 concerns the README convention, not the real-bodied definition.

On a second scratch copy, tried each admitted theorem with closing probes for `simp`, `rfl` and `infer_instance`. All six probes failed to close; the copy still elaborated with only its two sorry warnings. Read the supplied exact-lemma candidates at the pins; none proves either headline. There are no admitted examples, boundary theorems or Check mirrors to delete. All six own Lean identifiers attributed by the README resolve to declarations in this file.

| Headline | Coverage in Suggested.lean |
|---|---|
| §6.1 coefficient non-density | Named at lines 23–27 as unstatable: compatible family realizations, comparisons and monodromy are missing. |
| §§7.6–7.7 general higher-dimensional LV and finiteness | Named at lines 28–30: primitive family cohomology, its Hodge data and monodromy missing. |
| §7.8 Frobenius-centralizer estimate | Named at lines 44–45: primitive étale cohomology with Frobenius missing. |
| §8.4 Eulerian central mass | Actual theorem at line 69, n≥2, denominator-free inequality. |
| §9.3 projective hypersurface non-density | Actual theorem at line 106, homogeneous coefficient equation on native polynomial carriers. |
| §§10.6, 10.9, 10.10 hypersurface Shafarevich finiteness | Named at lines 31–43: arithmetic abelian-scheme models, good reduction, numerical classes and top intersection missing; existing ample/effective divisor carriers are explicitly credited. |

For positive sufficiently large degree, a homogeneous integer form smooth modulo every prime outside S has S-unit content. Conversely an S-integral projective parameter can be represented by integer coefficients after S-unit rescaling. The homogeneity of G makes its vanishing independent of that choice. The existential thresholds can be enlarged to the dimensions/degrees required by the README. No further statable omitted headline or weakened stand-in was established.

### Pinned-library and ownership audit

Opened the following native declarations and candidates at the specified pins. Paths below are library-relative; none refers to a newer upstream version.

| File and line | Content checked |
|---|---|
| `Mathlib/Data/Finsupp/Weight.lean:216` | degree is the sum of exponents. |
| `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:46` | support-degree predicate; zero is homogeneous in every degree. |
| `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` and `Mathlib/Algebra/MvPolynomial/Eval.lean:572` | partial derivative and algebra evaluation used by the smoothness predicate. |
| `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127` | actual algebraic-closure carrier. |
| `Mathlib/RingTheory/Regular/RegularSequence.lean:147` | regularity includes a nonzero final quotient. |
| `Mathlib/RingTheory/Filtration.lean:432` | Krull intersection requires a Noetherian local ring and a proper ideal. |
| `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` | cocharacter parabolic is the limit-condition subgroup functor. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188` | reconstruction for finitely generated comodules of a known Hopf algebra, not the general two-fibre-functor torsor. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:118`, `:131`; `Mixed/Abelian.lean:33` | mixed strictness for F/W and abelian category: R02's existing owner. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | abelian variety over a field, proper and geometrically integral; does not supply an abelian scheme over a ring of S-integers. |
| `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71` | quasi-compactness and local affine nonvanishing loci of powers; actual ample-class carrier. |
| `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45` | Cartier divisors on an integral scheme and local regular-equation effectivity. |
| `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:106`; `LineBundle/Degree.lean:130` | arbitrary test scheme C over k; pullback followed by truncated H⁰−H¹ degree. |
| `Mathlib/Combinatorics/Derangements/Finite.lean:66` | derangements are not descents: at n=1 their count is 0, while A(1,0)=1. |
| `Mathlib/Combinatorics/Additive/Convolution.lean:87` | finite-set convolution bound, not the Eulerian probability bound 1/2. |
| `Mathlib/RingTheory/MvPolynomial/Basic.lean:198`; `Mathlib/RingTheory/Smooth/Basic.lean:111` | polynomial basis and formal smoothness of the polynomial algebra; neither is arithmetic non-density of hypersurface parameters. |
| `Mathlib/RingTheory/Valuation/Integers.lean:257` | order/valuation non-density candidate, not the Zariski statement here. |

Object searches covered permutation descents/convolution, family cohomology and comparisons, mixed strictness, monodromy, coefficient normalizers, dynamic parabolics, Cartier divisors, stabilizers and arithmetic models. The two general connection/coefficient constructions remain here; convolution groups belong to SheafConvolutionOnAbelianVarieties; generic stabilizers belong to HeightsRationalPointsAndObstructions. The polynomial and permutation definitions are permitted minimal carriers for the two acceptance theorems, not a second plan for their suppliers.

Read the scopes of the five closest open roadmaps: SheafConvolutionOnAbelianVarieties #1809, MordellLawrenceVenkatesh #1231, GaloisSectionsPadicPeriodMaps #1739, WeightsInEtaleCohomology #1001, HeightsRationalPointsAndObstructions #1017. The first owns convolution and generic torsion characters; the second the one-dimensional method; the third section-compatible period-map applications; the fourth weight infrastructure; the fifth generic stabilizers and rational-point arithmetic. No shared end-theorem ownership or reciprocal supply was found in these readable heads. The overlap report has no competing head changing this package, dropped cited id or open-revision-only citation. The board index was read; the separately indexed LawrenceVenkateshMethod package could not be read, as recorded below, and is not asserted nonexistent.

### Supplier resolution and order

Resolved the actual cited headings and mathematical content against main where present, otherwise the supplied indexed heads. The following compact register records the sections consumed; line references identify representative checked passages rather than replacing the section identifiers.

| Supplier | Sections resolved and witness |
|---|---|
| MordellLawrenceVenkatesh | §§0.3–0.4, 0.24, 1.2, 1.10, 1.12–1.13, 2.5–2.6, 2.8, 2.11, 3.8; `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:483`, `:848`, `:1284`, `:1421`. Its restricted abelian-family Frobenius statement is not used to erase the general relative-comparison gap. |
| SheafConvolutionOnAbelianVarieties | §§0.2, 2.4, 3.1, 3.3, 4.8, 5.2–5.3, 6.7, 8.2–8.3; `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:214`, `:669`, `:935`, `:1170`, `:1326`. Arithmetic HT weight −q and first exception 8855 agree. |
| ClassicalArithmeticCompletion | §§2.18, 2.39, 2.56; `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3008`, `:3604`, `:4071`. Empty-permutation convention requires R05; stronger probabilistic inputs remain declared gaps. |
| ReductiveGroups / PartII | Layers 3–7b, especially 6A and 7b; `TauCetiRoadmap/ReductiveGroups/README.md:2043`, `:2608`. PartII §RG2.0.2 analytic charts at `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`. |
| RestrictedPowerSeries / ComplexKahlerGeometry | RestrictedPowerSeries §§2.1, 5.2 at `TauCetiRoadmap/RestrictedPowerSeries/README.md:306`, `:541`; ComplexKahlerGeometry K3 §3.4 supplies both Rückert and locally finite components. |
| ComplexComparisonPartII | §§C5.2, C5.3, C5.6, C6.6; `TauCetiRoadmap/ComplexComparisonPartII/README.md:3257`, `:3584`, `:4438`, `:5143`. |
| ShimuraData | §§1.2, 3.1–3.7; `TauCetiRoadmap/ShimuraData/README.md:185`, `:355`, `:386`, `:443`, `:505`. The §3.2 mixed/pure mismatch is R02; normality is separately declared. |
| AbelianSchemesAndArithmeticModuliPartII | §B2.6 and Layer B3; `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1515`, `:1947`. Existing Kuga machinery is distinguished from the requested pure period-map theorem. |
| MotivesAndAlgebraicCycles | §§6.1–6.3, 6.8; `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1116`, `:1130`, `:1149`, `:1229`. General tensor-isomorphism torsor retained. |
| PadicHodgeTheory | §§3.3–3.6, 4.4, 5.5, 6.1, 7.3, 8.1–8.2; `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, `:894`, `:1071`, `:1278`, `:1378`. §5.5 includes the local reductive H¹ input; §7.3 requires lisse higher direct images. |
| CrystallineCohomology / étale comparison suppliers | CrystallineCohomology §CR.7.3 at `TauCetiRoadmap/CrystallineCohomology/README.md:11344`; EtaleCohomologyFoundations §F.3 at `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:707`; ClassicalAdicEtaleCohomology §8.2 at `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4016`. The resolver's VanishingCycles.lisseDirectImageTransport lead is a declared supplier name in §F.3, not a missing pinned declaration. |
| Weights and trace suppliers | DeligneWeightsAndPurity §§0.1–0.2, 0.7, 0.9–0.10, 0.16, 2.2, 4.3–4.4, 9.12; WeilConjectures WC.3 and WC.5, complete intersections §5.21 at `TauCetiRoadmap/WeilConjectures/README.md:1179`; PadicDifferentialEquationsAndRigidCohomology §RD.7.7 at `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:13968`; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 at `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:588`; EtaleDualityAndPerverseSheaves §4.3 at `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4218`. |
| LefschetzPencilsAndVanishingCycles | §§2.8, 3.4, 4.4–4.5, 5.8, 5.10; `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2196`, `:2410`, `:2688`, `:2735`, `:3042`, `:3106`. Pencil hypotheses, radical quotient and open-or-finite alternative retained. |
| SchemeAndStackFoundations / AlgebraicModuliForArithmeticGeometry | §§0.8–0.9, 1.16, 4.14 at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:967`, `:1026`, `:2693`, `:6008`; §§2.1, 9.4 at `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1080`, `:10141`. |
| AbelianSchemesAndArithmeticModuli | §§A0.1, A1.2, A1.8, A2.4, A2.10, A3.2–A3.3, A3.6, A6.7, A6.14, A6.30–A6.32; `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:600`, `:1159`, `:1481`, `:1546`, `:3714`. Field-to-base models, polarized descent and finite étale restriction remain supplier work. |
| Arithmetic and curve suppliers | Chebotarev Layer 10 at `TauCetiRoadmap/Chebotarev/README.md:410`; ArithmeticGaloisDuality §R02.3.1 at `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1838`; JacobianChallenge Layer F at `TauCetiRoadmap/JacobianChallenge/README.md:448`; FaltingsFinitenessAndIsogenyTheorems §R28.5.15 at `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:2572`. |
| HeightsRationalPointsAndObstructions | §§1.6–1.7, 5.2 at `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:604`, `:614`, `:2186`. Stabilizer includes nilpotent test schemes; number-field weak Mordell–Weil covers all m≥1. |

The six slugs agree between `design/plan.json` and Exact supplier contracts: eulerian-log-concavity-and-variance, eulerian-central-limit, andre-monodromy-normality, period-map-ax-schanuel, relative-crystalline-comparison, hodge-tate-image-cocharacter. Each has a named earlier supplier and a concrete missing interface. In particular existing Sen theory does not already provide the requested tensor-preserving image torus, and fibrewise comparison does not already provide the requested relative Frobenius compatibility. They are contracts, not findings for being absent today. No conditional acceptance is issued because R01–R05 still require repairs.

Ran the prescribed dependency check without modifying the order or tooling. Exact output:

```text
depcheck: 236 roadmaps, 2157 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No package source file or merge-order file was edited during this review.

## Not verifiable

- **Serre**, I §5.4, Corollary 1 to Proposition 36 and III §4.3, Theorem 4: settled uncertified/paywalled book. The text was not guessed, fetched again or placed in a new missing-source request. Local test cases and the supplier proof route were checked independently; the exact printed wording remains uncertified.
- **LawrenceVenkateshMethod**, board pull request #345, indexed head `9ee7ac3`: reading `packages/LawrenceVenkateshMethod/README.md` at that head returned HTTP 404. Ownership against that separate package could not be checked. This does not establish that the roadmap is absent. The readable main/open-head ownership checks are listed above.

## Source issues

- **Error** in LS at Example 5.17, preprint p.46: the source says crystalline Frobenius is residue Frobenius tensored with scalar Frobenius; it should be Frobenius on the crystalline descent module, with φ^f matching residue Frobenius, not its f-th power; affects a stated result.
- **Error** in LS at §5.8.2 after Definition 5.40, preprint p.57: the source says a parabolic determines every representation filtration up to reindexing; it should be stated using the cocharacter filtration class, since opposite torus weights yield different intermediate lines; affects a stated result.
- **Misprint** in LS at Definition 5.44, preprint p.60: the source says the decreasing-filtration graded quotient uses Fᵃ⁻¹ as denominator; it should be Fᵃ⁺¹; affects nothing.
- **Misprint** in LS at the central-weight discussion before Definition 8.4, preprint p.74: the source says χ∘μ is an automorphism of 𝔾_m; it should be an endomorphism, allowing t↦t² and the trivial character; affects nothing.
- **Error** in LV at §10.2 before (10.8), printed p.971: the source says parameter dimension is binom(n+d,d−1)−1; it should be binom(n+d,d)−1, giving 14 for plane quartics; affects nothing.
- **Gap** in LV at Lemma 12.1 and proof, printed pp.995–996: the source says point-count control through N suffices for a kernel with frequencies through 2N; it should be required through 2N; affects a stated result.
- **Error** in LS at Lemma A.1, preprint pp.89–90: the source says the strict bound holds for every listed classical choice; it should be restricted to geometric parity, because n=2,d=1,GO₂ gives equality; affects a stated result.
- **Misprint** in LS at the paragraph after the GO calculation in Lemma A.1, preprint p.90: the source says the descent variance has square-root growth; it should be variance (n+1)/12, with square-root growth for standard deviation; affects nothing.
- **Misprint** in LS at the proof of Lemma A.4, preprint p.91: the source says the propagated bound at index i has denominator 3^j; it should be 3^i; affects the proof.
- **Misprint** in LS at the proof of Lemma A.5, preprint p.91: the source says the tail comparison is greater-than; it should be less-than, yielding the upper second-moment bound 3/2; affects nothing.
- **Misprint** in LS at the final sum in the proof of Lemma A.5, preprint p.91: the source says the remaining k-sum has denominator 3^i; it should be 3^k; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5aa38a9b7a054b2d74373ed4b99776f9c7bde7b1", "job": "REV-PKG-MordellLawrenceVenkateshPartII~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
