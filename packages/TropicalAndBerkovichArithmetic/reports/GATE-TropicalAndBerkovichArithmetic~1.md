## H01 (CBirkbeck) — applied

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:2079` and `:2098` replace universal normalization over K° by common reduced geometric models over a completed algebraic closure and scalar-projection pushforward, with closure/extension independence, transitivity, degree normalization and inseparable generic cycle lengths; the literal multiplicity formula is retained in its DVR range, and §6.7 uses the descended intersection comparison. The degree-three point and its non-finitely-generated coefficient ideals are negative Checks at `:2114`–`:2117`; Ducros's finite-presentation hypotheses are explicit at ducros line 15416, whereas chambert-loir line 185 does not establish normalization in the arbitrary rank-one category.

## H02 (CBirkbeck) — applied differently

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1347` and `:1356` split analytic formal atlases from admissible formal-scheme reconstruction, requiring type-II vertices and an algebraically closed or discretely valued nontrivial base for the latter, with separate split semistable chart hypotheses. General triangulation existence is retained, but even analytic-atlas reconstruction needs the vertex conditions of ducros line 15559: a singleton type-III vertex on a Tate circle fails the branch condition, so `:1362` also records that negative Check, alongside the irrational-radius obstruction (ducros line 15480 and line 15859).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:159` imports ShimuraCompactifications §§C0.16–C0.17's finite-fan scheme, coefficient-change and toric-morphism contracts, and `:1722` replaces the competing finite-fan construction by the small-fan extension with a specified finite specialization. Scope, supplier and layer dependencies now agree; the extension retains the infinite-fan case without assuming a locally finite chart cover, and its cone/fan locator is corrected to gubler line 550 (§§6.2–6.3, p. 12).

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:693` specifies the fixed-disc model category, extension of smaller-disc constructions by gluing, nonemptiness, common SNC domination and projective cofinality, and `:702` makes convergent-model excellence, analytic resolution transport and relative analytic domination explicit prerequisites. ResolutionOfSingularitiesCharacteristicZero §7.7 supplies only scheme pair principalization; the family comparison owns the additional transport, following boucksom-jonsson line 1045 and line 1056 before the projective limit at line 1288 and the homeomorphism at line 1321.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:2259` and `:2261` add positivity-preserving rational model approximation, the positive graph-curvature criterion, BV-potential integrability and signed continuity agreeing with §6.4's measure. The proof uses positive measures padded to one fixed ample degree and Poisson potentials on two copies of the same line bundle, with separately uniform convergence on convergent subnets; §§6.7–6.8 now use this adapter, and the affine, negative-curvature and shrinking-tent Checks distinguish it from direct semipositive convergence (chambert-loir line 170 and line 254).

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:2311` and `:2313` replace §§3.2–3.7 and the nonexistent §3.9 by §4.1, pp. 8–9, for the Raynaud cross, §4.2, p. 9, for tropicalization/full lattice, and §4.3, pp. 9–10, for duality. The Jacobian pairing retains its §6 reference; the checked passages begin at baker-rabinoff line 392, line 423 and line 461.

## Ownership, citations and acceptance signatures

Object searches covered main at b41e47b, the indexed open roadmap heads and the board packages. ShimuraCompactifications's finite-fan construction is imported rather than reconstructed; the small-fan extension, analytic formal-atlas comparison, geometric measure descent, hybrid-family transport and graph-potential integrability extend this roadmap's existing objects, while general scheme resolution remains with ResolutionOfSingularitiesCharacteristicZero. ArithmeticDynamics's specialized line metrics and the Arakelov consumers use the general measure theory here. Both added suppliers precede this roadmap; no ownership move from a later roadmap was needed.

The citation resolver found no missing cross-roadmap citation. Its 18 native-name leads were individually reconciled: two are declarations in this roadmap's unchanged Suggested.lean, and sixteen are explicitly planned supplier declarations in AlgebraicModuliForArithmeticGeometry §7.10.2, DiamondsAndVStacks §D5.13, ClassicalAdicEtaleCohomology §3.1, AdicSpacesPartII §R0.7, AdicSpacesPartIII §R3.9 and ShimuraCompactifications §C0.16. They are not asserted to be implemented at the pins. The library revisions were confirmed as Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The sources used for repairs already have manifest keys; no new work or missing reference was introduced, and settled waived/uncertified sources were not reopened.

A scratch file containing `#check @name` for all nine declarations was elaborated successfully and every resulting type was compared with its README statement. No binder was lost and no signature change was needed: completeness remains explicit in the unit and idempotent theorems, norm-one in nonemptiness, and the archimedean hypothesis in field classification. Suggested.lean is unchanged: the repaired higher-layer headlines still lack the analytic-space, formal-model, metric-graph or model-metric carriers identified in its module docstring. No stand-in or duplicate fully qualified declaration was added.

## Computed adversarial pass

The table records the repaired statements, their mathematical interfaces and witnesses, together with every retained Lean declaration. Δ has the README sign; μ₀ denotes the chosen positive model curvature on the skeleton.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Hybrid model category and nonemptiness, §0.23 | Constant P¹ family; identity model | Central divisor multiplicity 1; original dual complex has 1 point; identity restricts to id on every nonzero fiber | Valid nonempty category | Model category and direction of domination explicit |
| Fixed-disc domains for the hybrid inverse system, §0.23 | Central blowup on the smaller disc of radius r/2 | On r/2≤|t|≤r its glued fiber is exactly X_t, with 1 copy of each original point; a germ alone would have no fiber there | Every model and transition map has the fixed base | Smaller-disc gluing made explicit |
| SNC principalization transport, §0.23 | Smooth chart t=x²y³; square-zero thickening | Reduced boundary xy=0, multiplicities (2,3); weighted vertices satisfy 2·(1/2)=3·(1/3)=1; ε²=0 with ε≠0 fails reducedness | Multiplicities retained; nonreduced input excluded | Scheme hypotheses and analytic transport stated |
| Common SNC domination, §0.23 | Two distinct central blowups; identity | Both blowups restrict to the same identity over t≠0; their graph dominates both; identity's coordinate map is w↦w | Common refinement is required; no map between the two given blowups assumed | Intermediate contract added |
| SNC transition maps, §0.23 | Blowup of xy=t at x=y=0 | Exceptional order ord_E(t)=1+1=2; normalized exceptional coordinates (1/2,1/2) sum to 1 | Correct exceptional weight | Discriminating Check added |
| Projective SNC cofinality and central limit, §0.23 | Constant P¹, points T=0 and T=1 | Original retraction sends both to one vertex; a central blowup at T=0 separates their retractions; the central analytic fiber has at least these two distinct points | One dual complex cannot replace the inverse limit | Cofinality and central comparison named before hybrid continuity |
| Hybrid evaluation normalization, §0.23 | f=t, f=ct⁻², c≠0 | Rescaled values r and limit r⁻² respectively; central values r¹ and r⁻² | Signs agree, including negative Laurent order | Existing witness retained through added proof prerequisites |
| Analytic formal-atlas definition and recovery, §2.16 | Gauss cover of P¹; identity refinement | Two vertex charts have the same single Gauss vertex; maximal-atlas vertex set and S each have cardinality 1 | Specified atlas recovers the vertex set | Definition and recovery laws stated |
| Formal-domain restriction, §2.16 | Closed Gauss disc; smaller closed disc of radius p⁻¹ | First boundary is ζ(0,1)∈S and vertex count 1; second boundary is ζ(0,p⁻¹)∉S and cannot be formal for that S | Both directions of the boundary test distinguished | Domain/restriction API added |
| General triangulations versus strict formal structure, §2.16 | ζ(0,p^(−√2)) in P¹ over ℚ_p | Rational rank of the new value modulo p^ℚ is 1; residue transcendence degree 0; two complementary branches/discs; no type-II component point | Analytic structure allowed; admissible strict reconstruction excluded | Irrational-radius negative Check added |
| Type-III branch condition, §2.16 | One type-III vertex on a Tate circle; then two vertices | Complement with one vertex has 1 annulus containing 2 branches at that vertex; with two vertices the two incident edges lie in distinct complementary annuli | Singleton fails the formal-atlas condition | Extra condition beyond the suggested split added |
| Strict reconstruction and converse, §2.16 | Gauss point of P¹ over ℚ_p | Type-II invariants (residue trdeg,value rational rank)=(1,0); reconstructed P¹ over ℤ_p has 1 reduced component and 1 component point | Vertex/component data agree | Field and strictness hypotheses explicit |
| Semistable qualification, §2.16 | Type-II radius p^(−1/2); chart T²=pU | Value-group index 2; ordinary special equation T²=0 has generic length 2, not 1 | Type II does not imply reduced semistability | Separate smooth/nodal chart hypotheses and negative Check |
| Small-fan carrier and finite specialization, §4.0 | Empty fan; zero cone in rank 0 over 𝔽₂ | Empty scheme has 0 points; rank-zero monoid algebra is 𝔽₂ and scheme is Spec 𝔽₂, matching the supplied finite object | Degenerate cases agree | Competing finite-fan construction deleted |
| Face localizations and gluing property, §4.0 | Rank-one complete fan | Charts K[T] and K[T⁻¹]; both overlap rings K[T,T⁻¹]; glued scheme P¹_K | Localization retained | Imported finite charts used in small gluing |
| Singular cones, §4.0 | Cone generated by (1,0),(1,2) in characteristic 0 | Dual generators A=(0,1), B=(1,0), C=(2,−1) satisfy A+C=2B=(2,0); ring ac=b² has dimension 2 and tangent dimension 3 at origin | Singular chart retained | Generality of supplier carrier preserved |
| Fan morphisms, characters and composition, §4.0 | Torus maps z↦z² and z↦z³; identity | Pullback exponents compose to 2·3=6; tropical maps t↦2t↦6t; identity exponent 1 | Algebraic and tropical composition agree | Finite maps imported, extended by gluing |
| Products and coefficient change, §4.0 | Product of ray charts; extension K→L | K[x]⊗K K[y]=K[x,y]; L⊗K K[x,y]=L[x,y] on both routes | Charts and face maps agree | Valued comparison specified on the common carrier |
| Closed graph and domination, §4.0 | T² on G_m | Graph ring K[T,T⁻¹,U]/(U−T²)≅K[T,T⁻¹]; graph projection fibers have 1 point versus P¹ fibers for the product | Closed graph has the intended dimension and projection | Graph comparison retained |
| Infinite-fan extension, §4.0 | Infinitely many distinct rank-two rational rays plus 0 | Every ray chart contains the same rank-two torus; no finite subfan contains all rays; chart cover infinite and not locally finite, although every chart is finite type | Local finite type does not imply quasi-compactness | Extension kept without local-finiteness assumption |
| Geometric admissible refinements, §6.1a | Spec C; the nondiscrete degree-three point after C-extension | C° gives one reduced geometric point; L⊗K C≅C³ gives three such points; model presentations have finite rank 1 and 3 respectively | Safe geometric field range supplies the models | Universal normalization over K deleted |
| Geometric intersection specialization, §6.1a | Degree-6 model of L²; normal DVR component of multiplicity 2 and degree 3 | 6/2=3=deg L; 2·3=6 on the DVR model | Tensor and component factors distinct | Formula restricted to proved model ranges |
| Cycle lengths and inseparable extension, §§6.1a–6.2 | Purely inseparable points of degree 2 and 3 | Over an algebraic closure, one support has generic length 2 or 3; cycle masses 2·1=2 and 3·1=3, versus reduced-support mass 1 | Generic nilpotents cannot be discarded | Fundamental-cycle lengths included |
| Geometric intersection projection, §6.1a | Subdivision of uv=a with v(a)=3 and v(b)=1 | Edge lengths 1+(3−1)=3; new interior affine fluxes +1 and −1 sum to 0 | Projection preserves the original mass/flux | Geometric projection replaces raw arbitrary-base intersections |
| Nondiscrete normalization obstruction, §6.2 | K from compatible square roots of 5; θ³=5 | θ valuations lie in the classes 0,1/3,2/3 modulo ℤ[1/2]; coefficient cutoffs −1/3 and −2/3 are not in that group | No cancellation between classes; no attained ideal minima | Counterexample recorded |
| Nonfinite coefficient ideals, §6.2 | Dyadic values above the two cutoffs | −1/4+1/3=1/12 improves to −5/16+1/3=1/48; −1/2+2/3=1/6 improves to −5/8+2/3=1/24 | A finite minimum can always be improved | Admissible normalization not assumed |
| Model-measure descent and degree mass, §6.2 | Spec L in the degree-three example; Spec K | 1+1+1=3 after geometric extension, all pushing to x; ordinary residue fiber has degree 1; Spec K has mass 1 | Descended measures are 3δ_x and δ_x | No extension-degree division; mass valid before and after descent |
| Independence and transitivity, §6.2 | Two algebraic closures inside a common overfield; a three-point scalar fiber | All three unit atoms remain unit atoms in the common overfield; either composite pushforward gives 3δ_x | Same measure on both routes | Closure and arbitrary-extension independence are explicit targets |
| Symmetry, multilinearity and finite-map projection, §6.2 | Degree-a,b bundles on a curve; finite point map of degree 3 | Curvature mass for L⊗M is a+b, dual mass −a; f_*μ_SpecL has mass 3=3·mass(μ_SpecK) | Additivity and map-degree normalization agree | Exact finite-surjective hypotheses retained |
| Model PL approximation, §6.7 | F=s; F=s²/2 on [0,L] | Δs=δ_L−δ₀; Δ(s²/2)=−ds+Lδ_L, mass 0 and variation 2L | Endpoints cannot be lost in the limit | Signed limit routed through integrability adapter |
| Rank-one model approximation, §6.7 | Two loops of lengths 1,√2; secant on length √2 | Ratio √2 irrational; a value difference 1 gives secant slope 1/√2, not rational | Rational slopes require the two-slope correction, not length rescaling | Arbitrary real lengths preserved |
| Rank-one model curvature identity, §6.7 | F=s on [0,2]; geometric subdivision | ΔF=δ₂−δ₀ and curvature −ΔF=δ₀−δ₂; inserted equal slopes give atom 1−1=0 | Sign and projection agree | Computation uses geometric intersections plus descent |
| Positive graph-curvature criterion, §6.7 | μ₀=δ₀+δ₁, G=s and G=2s on [0,1] | μ₀−Δs=2δ₀≥0; μ₀−Δ(2s)=3δ₀−δ₁ has coefficient −1 at 1 | Positive and negative examples distinguished | Positivity-preserving approximation supplied |
| Strict vertex margin, §6.7 | G=s scaled by 3/4 | μ₀−Δ(3s/4)=(7/4)δ₀+(1/4)δ₁; general margin coefficients 2−ε and ε | Both endpoint degrees positive for 0<ε<1 | Rational approximation has explicit positive slack |
| BV-potential integrability, §6.7 | F=s, d=2, z=0; constant F | ν=δ₀−δ₁; λ⁺=2δ₀ and λ⁻=δ₁+δ₀ each have mass 2 and difference ν; constant F gives identical λ±=2δ₀ | Two fixed-degree semipositive factors; quotient may be signed | Fixed underlying bundle and normalization stated |
| BV integrability beyond finite-piece C², §6.7 | F(t)=∫₀ᵗC(u)du for Cantor distribution C | ΔF=δ₁−μ_C; ν⁺ and ν⁻ each have mass 1; d=2 gives λ⁺=μ_C+δ₀ and λ⁻=δ₁+δ₀ | Singular-continuous curvature remains integrable | Weak BV domain retained |
| Signed continuity and Jordan cancellation, §6.7 | Height-1/n tent centered at c; n=4,c=1/2 | ΔF₄=−δ_(1/4)+2δ_(1/2)−δ_(3/4), variation 4; sup norm 1/4; generally sup norm→0, signed limit 0, both Jordan limits 2δ_c | Jordan decomposition need not commute with weak limits | Subnet argument and separate uniform Poisson potentials added |
| Bound needed for signed approximation, §6.7 | n⁻¹sin(n²s) on a fixed interval | Sup norm≤1/n; second derivative −n³sin(n²s), interior variation grows on order n³ | Uniform convergence alone fails | Variation hypothesis retained |
| Admissible curvature application and normalization, §6.8 | Genus-one vertex on one loop of length L, total genus 2; coordinate scale c=2 | Initial curvature 2δ_v; Δg(K,·)=δ_v−ds/L; corrected curvature δ_v+ds/L=2μ_a; s=2t,F=2f leaves slopes and measure masses unchanged | Signed adapter gives the intended measure, without an extra scale factor | Application now names positivity, integrability and signed continuity |
| Raynaud cross, §7.0 | Tate curve; positive-dimensional good reduction | Tate data (E,M′)=(G_m,q^ℤ); good-reduction torus rank and lattice rank both 0, B=A | Correct source range includes both cases | Locator only changed |
| Raynaud valuation, §7.0 | q with −log|q|=L>0; product lengths 1,√2 | trop(q)=L and real quotient ℝ/Lℤ; product period matrix diag(1,√2) has determinant √2≠0 | Full discrete lattice, no common integral rescaling required | Locator only changed |
| Raynaud polarization and Jacobian pairing, §7.0 | Rank 1; product of two Tate curves; rank 0 | Real pairings [L], diag(1,√2), and empty rank-zero matrix; rank-one positive value L agrees with edge circumference | Duality and pairing locators distinguish the constructions | §4.3 used for duality; §6 retained for Jacobian pairing |
| Spectrum definition, Suggested.lean:37 | ℝ norm; zero ring; max norm on ℝ×ℝ | ℝ norm has p(1)=1 and p(0)=0; zero ring would require 0=1 in ℝ; max norm has ‖(1,0)‖‖(0,1)‖=1 but ‖(0,0)‖=0 | Native carrier excludes zero-ring points and nonmultiplicative ambient norms | No change |
| Spectrum.eval, Suggested.lean:43 | Two projection points on ℝ×ℝ, a=(1,0) | First evaluation 1, second evaluation 0 | Evaluations retain actual point data | No change |
| Spectrum.topology, Suggested.lean:46 | Same two projection points; coordinate open interval (1/2,3/2) | Preimage at a=(1,0) contains the first point and excludes the second | Pointwise topology distinguishes the points | No change |
| Spectrum.completion_comparison, Suggested.lean:51 | ℚ→ℝ, a=2; zero ring | Both nonzero-field spectra have one norm point and evaluate a to 2; both zero-ring spectra are empty | Evaluation-preserving comparison has correct boundary cases | No change |
| Spectrum.compactSpace, Suggested.lean:58 | Zero ring; ℝ×ℝ | Spectrum cardinalities 0 and 2; each finite space is compact | Compactness does not imply nonemptiness | No change |
| Spectrum.nonempty, Suggested.lean:63 | ℝ; zero ring | ℝ has norm-one 1 and its norm point; zero ring has ‖1‖=0≠1 and fails NormOneClass | Required binder excludes the empty case | No change |
| Spectrum.isUnit_iff, Suggested.lean:68 | ℝ×ℝ elements (1,0),(1,1); zero ring | Evaluations (1,0) include 0 and element is nonunit; evaluations (1,1) both 1 and element is unit; in zero ring IsUnit 0 holds and spectral condition is vacuous | Both directions and zero ring agree | No change |
| Spectrum.existsUnique_idempotent_of_isClopen, Suggested.lean:74 | ℝ×ℝ; zero ring | Four idempotents (0,0),(1,0),(0,1),(1,1) give exactly four subsets; zero ring has one idempotent and one clopen set ∅ | Value-one convention and uniqueness agree | No change |
| Archimedean field classification, Suggested.lean:83 | ℝ usual; ℂ with square-root norm; ℚ₂ and ℚ₃ | ‖2‖=2 gives α=1; ‖2‖=√2 and ‖1/4‖=1/2 give α=1/2; p-adic values 1/2 and 1 fail >1 | Archimedean hypothesis and unique exponent agree | No change |

## Validation

Committed as 44a1641, `TropicalAndBerkovichArithmetic: review repairs (measure descent, strict models, ownership, hybrid prerequisites, signed limits, citations)`. Only `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md` changed; Suggested.lean remains identical to the reviewed head. The working tree is clean and nothing was pushed. The first gate run before committing failed solely because the README was uncommitted; the final clean-commit run exited 0.

Dependency check output, with no UPWARD, CYCLE or moved line:

```text
depcheck: 47 roadmaps, 537 edges, 0 problem(s)
```

`lake build TauCetiRoadmap.TropicalAndBerkovichArithmetic.Suggested` exited 0, with the six expected `sorry` warnings at lines 51, 58, 63, 68, 74 and 83:

```text
⚠ [8976/8976] Built TauCetiRoadmap.TropicalAndBerkovichArithmetic.Suggested (3.8s)
Build completed successfully (8976 jobs).
```

gate TropicalAndBerkovichArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
