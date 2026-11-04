# Review of NeronModelsAndSemistableAbelianVarietiesPartII (pull request #870 at e974688)

**Verdict:** needs changes

## R01 (P1) — Split the conductor prerequisites to remove a cycle

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:1000`, also 1063, 1075, 1699, 3203 and 3237. The flat-extension target ends its prerequisites with “§1.37”.

**Claim:** The sections give a build order for the conductor, its ideal sheaf and its flat comparisons.

**Witness:** The declared edges are 1.14→1.37→1.16→1.15→1.14. There is also 1.20→1.37→1.20: the source-ideal comparison at line 3237 consumes the global comparison it helps supply.

**Repair:** Split §1.37 into its ring-level cokernel/annihilator/pushout comparisons and its later sheaf comparisons. Put the ring results before §1.14; transport ring conductors through the ring equivalence from §1.2, without §1.16. Then build localization, the conductor ideal sheaf, affine flat comparison, global flat comparison, and finally source-ideal base change. Give each target the particular prerequisite it uses. This produces the acyclic order ring comparison→1.14→1.15→1.16→flat chart→1.20→source comparison. On the cusp A=k[t²,t³]⊂k[t] with F=A[ε]/(ε²), both routes still give I+εI for I=(t²,t³). The mechanical inter-roadmap check below does not inspect this internal cycle.

## R02 (P2) — Retain pullbacks of Picard classes from a general base

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:9022`: “geometric Picard generation by O, a fiber F, components disjoint from O and section classes”.

**Claim:** Algebraically closed constants suffice for this generation statement; §2.1 allows an arbitrary smooth proper base curve, and §4.7 explicitly retains its degree-zero classes.

**Witness:** Take J=E×B over ℂ, with E,B nonisogenous elliptic curves, and nonzero L∈Pic⁰(B)[2]. Constant sections restrict the proposed degree-zero subgroup to 0 on O, whereas f*L restricts to L≠0.

**Repair:** State the general generation theorem using f*Pic(B), O, the indicated components and sections. Then specialize to B=ℙ¹ to replace f*Pic(B) by ℤF in the rational-surface applications. For example take E:y²=x³+1, B:y²=x³−x and L=O_B((0,0)−∞); their different CM fields exclude isogenies. The repaired generating set contains f*L, and restriction to O recovers its order-two class. Add this as a negative-control Check. This also agrees with the stronger supplier/ownership formulation discussed in R03.

## R03 (P2) — Resolve the competing owner of general genus-one surface theory

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:13`, §§2.1, 2.3, 2.5, 4.1–4.2, 4.7–4.8 and 4.16–4.17.

**Claim:** These sections construct the general fibration, geometric fibre classification, canonical formula, Picard restriction/generation and regular Jacobian theory here.

**Witness:** The supplied `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:776` constructs these in §6.0b; line 1443 explicitly supplies the same sections here. Merge positions are 334 (K3) and 256 (this roadmap).

**Repair:** Establish one earlier owner, preserving the generic prefix's full generality, and make the later K3 roadmap consume it. With this merge order, move that shared generic prefix into this Part II's ownership and replace the competing construction/supplier claim in the later package by exact imports. Include the nonproper-base carrier and the general regular-surface Picard theorem, with proper-base specializations where needed; do not add an upward K3 prerequisite. The arithmetic excellent-DVR/LLR extensions can remain here. The witness E×A¹ belongs to the shared general carrier with generic (h⁰,h¹)=(1,1), while E×ℙ¹ also belongs to its proper-base restriction; retaining both verifies that resolving ownership has not narrowed the theory. No duplicate fully qualified declaration was found among the six declarations in Suggested.lean.

## R04 (P2) — State the six normal-form inputs precisely

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:9598`: “derive the characteristic-two normal-form reductions conventionally labeled 2A, 5A, 5D, 7, 13A and 14”.

**Claim:** These are the independent inputs that make the fourteen-model completeness proof in §7.4 available.

**Witness:** Neither §5.10 nor §7.4 gives their six quantified statements. For case 5D, schroer line 1341 specifies coefficients (t,td₁,0,t⁴,0), deg d₁≤1 and t∤d₁; a case label supplies none of these conditions.

**Repair:** Give separate targets with the field, local/global fibre assumptions, precise normal-form equation, coefficient bounds and nonvanishing conditions, and the allowed coordinate/base changes. Include the twisted alternatives needed for models 12–14 and distinguish configuration exclusions from normalization. Cite each exact source location, marking the completion as a new proof rather than importing the incomplete source argument. Test case 5D with d₁=1 and 1+t (Δ=t¹² in both cases); d₁=0 still gives Δ=t¹² but violates t∤d₁, and rescaling x=t²X,y=t³Y makes that local equation good at t=0. Discriminant/nondegeneracy alone cannot identify this case. The analogous negative tests belong beside each of the other five statements.

## R05 (P2) — Do not import local freeness for wild fibres

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:144`: “proper-flat constancy of the arithmetic genus (`R¹f_*O` locally free of constant rank)”.

**Claim:** The StableReduction contract equates proper-flat Euler-characteristic constancy with local freeness of the first direct image, without a cohomological-flatness hypothesis.

**Witness:** `TauCetiRoadmap/StableReduction/README.md:359` specializes local-freeness results to nodal families. A wild double fibre can have (h⁰,h¹)=(2,2), versus generic (1,1): χ stays 0 but R¹ is not locally free.

**Repair:** Import proper-flat constancy of χ and the full cohomology/base-change theorem. Assert local freeness only with its actual nodal/geometrically connected or cohomologically-flat hypotheses. In §3.3 obtain those hypotheses from the separately cited Raynaud criterion, as its proof already proposes; in §4.1 retain the possible torsion T.

A concrete test, over an algebraically closed field k, is the free diagonal quotient of E×Spec k[[s]] in characteristic 2 by (P,s)↦(P+τ,s/(1+s)), where E is ordinary and τ≠0 has order 2. The invariant uniformizer is t=s²/(1+s), so the full fibre is 2F. Since s/(1+s)≡s modulo s², the conormal of F is trivial. The sequence for O_(2F) has kernel O_F and surjects on global constants, giving h⁰=2; χ=0 gives h¹=2. The quotient is regular, proper and flat over k[[t]], with generic genus one and f_*O=O. The repaired χ statement gives 2−2=1−1=0 without the false local-freeness conclusion.

## R06 (P3) — Remove names for API declarations absent from Suggested.lean

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:249`: “Lean names elsewhere specify the library API to be built by the roadmap”; for example lines 1709 and 1733.

**Claim:** Backticked own names describe hundreds of intended declarations without declaring them in the acceptance file.

**Witness:** `AffinePinching.commonIdealAwayEquiv_apply` at line 1733 is absent from Suggested.lean. That file contains five theorems and F2Model only. The scan reports 651 unresolved names, predominantly planned APIs.

**Repair:** Keep the API mathematics in prose, remove the own-declaration names and “Lean name” labels unless the name is one of the six actual declarations, and remove the exception asserted at line 249. Do not inflate Suggested.lean with these APIs. The localization statement remains precise without the name: for the cusp, t³/t² maps to t. The worker's gate passed; this is a manual policy finding, not a reported gate failure.

## R07 (P3) — Make the section-comparison Checks discriminating

**Location:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:8150`, §2.60 Checks: “E_U sends every pulled-back coefficient to its native image”.

**Claim:** The listed Checks validate the new closure and generic-section equivalences. The definition of the Hodge-line/torsion data in §4.1 also has only one Check, at line 8875.

**Witness:** The bullets repeat coefficient/naturality laws on arbitrary elements; the repeated empty-open exclusion is the only concrete negative control. They do not provide three computed tests of the new definition.

**Repair:** Supply actual elements and images: on the cusp, U↦t², V↦t³ and V/U↦t; on the nonsplit binary chart, U↦t²+t+1 and V↦t(t²+t+1); at infinity use u↦1/t and z↦1/(tq). For the second test, the wrong automorphism t↦t+1 fixes U but sends V to V+U, so the V-value distinguishes it. Keep the empty-open exclusion, whose section ring is zero and cannot be identified with the nonzero generic field. For §4.1 add the computed elliptic-product, rational-Jacobian and Jacobian-K3 values below, and the wild control in R05. These are README Checks, not additional Lean theorems.

## Verified sound

The reviewed head is e97468835ad3f7abc170db9a72432db6f3957863. The worktree was left unchanged, and the diff outside the named roadmap folder is empty. I read the repository README/CONTRIBUTING and compared the shape with StableReduction, EllipticCurves and JacobianChallenge on main. There was no previous review or declared supplier gap to reconcile.

The worker's gate reports every scanner, the dependency check and the targeted build passing. Direct elaboration of Suggested.lean also exits 0, with only its five expected sorry warnings. Its three individual Tau Ceti imports resolve at the pins. The independent dependency command gives:

```text
depcheck: 156 roadmaps, 1074 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines in that output. R01 is an internal target cycle; R03 is an ownership conflict detected against the supplied sibling head, not a claim that this command failed.

**Headline inventory and Lean checks.** The README's end results are scheme and algebraic-space pinching; global conductor reconstruction; geometric Kodaira classification; finite-field genus-one existence and the five binary classes; multiple-fibre isogenies and LLR comparisons; canonical/Picard lattice theory and Shioda–Tate; the regular nonsmooth characteristic restriction and Jacobian construction; Picard constancy; and the fourteen-model classification, its eleven/three subdivision and nonrational-fibre conclusions. The five currently statable headline signatures are present: §§1.5, 2.5's matrix classification, 2.15, 2.22 and 4.16. F2Model is their only auxiliary definition. The docstring names the other headlines and their missing geometric carriers. I found no replacement by free predicates, sorry'd data, a special-case stand-in or set_option.

I elaborated `#check @...` for all six declarations on a scratch copy. No hypothesis disappeared: finite-field/field assumptions, genuine coherent genus and finite dimensionality, smoothness/properness/geometric connectedness, the primitive positive matrix vector, and every-stalk regularity/non-smoothness remain as intended. On a separate copy, the alternatives rfl, simp and infer_instance failed on all five admitted theorems; searches and reading found no one-lemma exact proof at these pins. In particular the native affine Dynkin theorem proves that the specified matrices kill their marks, not the converse classification here. No Lean padding finding is raised.

**Pinned objects opened.** Paths in this paragraph are relative to the respective pinned dependency repositories; these are body/hypothesis checks, not matches against a newer library.

- `Mathlib/RingTheory/Conductor.lean:32` and 46: conductor concerns R[x]; it is not the arbitrary-subring conductor. `TauCeti/RingTheory/Ideal/Conductor.lean:129`: quotientComapEquivOfCoprime uses a common ideal and a coprimality hypothesis. The general reconstruction here is different.
- `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64`: Scheme.genus is the finrank of genuine H¹, with an explicit finite-dimensionality binder; it does not use finrank's infinite-dimensional zero value.
- `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`: Model supplies flat finite presentation and a specified generic-fibre identification; properness, regularity and minimality are additional assertions.
- `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean:70`, 185 and 244: degreeOneEquivPicZero uses an actual degree-one point, the constants condition and genus one. It does not already construct the surface or give every genus-one curve a projective cubic presentation.
- `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:80`, 111, 160, 206 and 217: native projective model, origin and base-preserving variable-change isomorphism; the direction is (V • W).projModel→W.projModel, preserving the zero section.
- `TauCeti/AlgebraicGeometry/EllipticCurve/SingularPointCount.lean:247`, 261 and 278: cusp/split/nonsplit traces are 0, 1 and −1 with their discriminant and splitting premises. All equation points are counted, including the singular point; these are not unconditional group cardinalities.
- `TauCeti/AlgebraicGeometry/Modules/RationalFunctions.lean:114`, 163, 190, 206 and 235: the generic point/preimage and section comparisons have the required irreducibility and nonempty-open hypotheses. The all-open sections carrier does not make the empty-open ring equivalent to the generic field.
- `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:154`, 368, 500 and 658: validity ranges, affine matrices, marks and their null-vector law. Affine A₁ has off-diagonal −2; taking the negative matrix gives the required intersection 2. The E-type marks retain their distinct branch multiplicities.

**Supplier and ownership audit.** I read the Needs/Uses clauses and searched by objects in the pinned libraries, main roadmaps, board packages and supplied open heads, using the roadmap grep/show tools as well as local searches. The following contracts were resolved by section, rather than inferred from their names:

| Supplier | Resolved contract and boundary |
| --- | --- |
| StableReduction | Layers 1–2 normalization/nodes and curve cohomology; 4–5 intersections and smooth-generic models; 6 numerical classes. A regular nonsmooth Jacobian needs the extension here. The local-freeness overclaim is R05. |
| NeronModelsAndSemistableAbelianVarieties | §§2.7–2.8, 3.8–3.9 and Layer 4 supply minimal-model smooth loci, components and semistable Picard/Néron comparison. They do not supply all additive LLR comparisons. |
| SchemeAndStackFoundations | Main §0.27, line 1720, finite-module flat annihilators; §0.28, line 1766, ideal restriction; §1.3 diagonal properties; §2.16 Tsen with algebraically closed constants; §3.6 Picard torsors; §§5.9–5.10 intersections. The extra algebraic-space effectivity inputs are explicitly targeted in §1.9. |
| JacobianChallenge | Layers A–D divisor/cohomology/Picard inputs, E–F abelian varieties and pointed Abel–Jacobi. These do not remove a point or Brauer-obstruction hypothesis. |
| AlgebraicCurves | Main Layers 10 and 12, lines 918 and 1085: Weierstrass normal forms and the scheme/function-field dictionary. |
| EllipticCurves | Layers 1, 3 and 4: finite isogenies, finite-field counts and local reduction symbols. The resolved surface comparisons are additional work here. |
| IntegralLattices | Layers 0–1, 6C and 6F: abstract lattices and even unimodular rank-eight classification/Gram comparison. These do not identify an actual surface's Picard pairing. |
| AlgebraicModuliForArithmeticGeometry | §§1.1, 3.5, 7.3: quotient-convention Proj, polarized finite quotients, and the Raynaud (N)* degree-one criterion. Normality/no embedded points and the Stein condition must accompany the section. |
| ComplexComparisonPartII | C3.2d.2–C3.2d.4: Picard representability/separatedness and the obstruction sequence. |
| ReductiveGroupsPartII | RG2.3.7's prose Lang theorem includes nonaffine smooth geometrically connected finite-type groups; its affine Lean carrier alone would not supply the elliptic application. |
| EtaleCohomologyFoundations; InverseGaloisAndArithmeticFundamentalGroups | F.0.3, F.2–F.7, F.10, §§0.9–0.11 and IG.0.T1–T4 provide the cohomology/trace framework; the rational-surface blowup and cycle-class comparison remains an explicit target here. |
| ModularCurves; ZigzagPreprojective | Main Layer 4D, line 1203, provides strict henselization and its stated pointings; Layer 0, line 205, provides the affine diagrams and marks, including multiplicity-two A₁. |
| K3SurfacesAndSymplecticBoundedness | Supplied-head §6.0b, lines 776–891 and 1443, duplicates the generic genus-one prefix and explicitly claims to supply this roadmap: R03. |

The object searches found no earlier owner of the general Ferrand/global-conductor work: existing nodal and coprime APIs are narrower. The arithmetic LLR extension goes beyond the base Néron roadmap. R03 remains unresolved. Ownership was not inferred from unprovided open heads.

**Seeded source sample: 15/15 inspected at legal texts.** No README locator is expressly flagged unverified. The source keys below identify the fetched line-numbered texts; Schröer means arXiv v3 and its printed pages. Derived refinements are distinguished from assertions actually printed in a source.

| Target | Locator inspected | Result at that locator |
| --- | --- | --- |
| 1.13 | ferrand lines 48–51, introduction, printed p.554 | Annihilator description for an inclusion; the extension to a general map's unit-span quotient is an algebraic refinement, checked below. |
| 1.17 | witaszek lines 846–865, Definition 2.27, printed pp.674–675 | The conductor diagram is present with finite-surjective reduced hypotheses. The README acknowledges its broader finite schematically dominant formulation; the quotient-map construction has the correct direction. |
| 1.21 | ferrand lines 165–194 and 780–791, §1.3 and §5.1, printed pp.556–557 and 568 | The common-ideal localization argument supports the construction; noninjective maps require the separate kernel-killing calculation. |
| 2.10 | schroer lines 468–479, Proposition 3.2, p.11 | Split singular multiplicative fibre count rq, with the rational/split hypotheses. |
| 2.18 | schroer lines 487–494, Proposition 3.3, p.11 | E₂ is the stated ordinary binary model, cardinality 2. |
| 2.19 | same | E₃ is the stated supersingular model, cardinality 3. |
| 2.25 | schroer lines 480–494, Proposition 3.3 and preceding discussion, p.11 | The five point groups are cyclic; the order-four case needs the doubling calculation given below, not cardinality alone. |
| 2.33 | schroer lines 424–445, §3, p.10 | Conductor pinching is printed; the canonical coordinate equivalence is expressly a derived refinement. Polynomial substitution below verifies its normalization. |
| 2.35 | same | The native solution parametrization is a derived refinement, not a named source theorem; both directions are checked below. |
| 2.43 | same | The two-chart scheme is a derived construction; its equations/gluing are checked below, not attributed to an absent theorem number. |
| 2.57 | same | The specified generic-stalk map is a derived comparison; its direction and t-coordinate are checked below. |
| 4.8 | schroer lines 1124–1138 and 1162–1173, Proposition 9.3(v) proof and after Theorem 9.4, pp.25–26 | The latter is about a rational Jacobian over ℙ¹. It does not support the general-base wording: R02. The finite-field Tsen step in the former is a source error. |
| 5.4 | schroer lines 1196–1209, Proposition 9.5 proof, pp.26–27 | A₂/E₆ determinant 3 obstruction supports the argument. The roadmap correctly treats IV's triangle instead of copying the source's terminal-vertex description. |
| 5.9 | schroer lines 1258–1266, Proposition 10.1, p.28 | The count contradiction is 25≤24 with the stated fibre restrictions. |
| 7.5 | schroer lines 1306–1395, Theorem 10.4 and proof, pp.29–31 | The source lists eight, not eleven. The README says so and labels its completion. The three extra examples pass the independent invariant/count tests below; the source cannot certify their exhaustiveness, especially its omitted twisted cases. R04 concerns the missing precise replacement inputs. |

**Computed adversarial pass.** The following rows cover all 155 numbered targets, including the sampled targets and all five Lean headlines. They give explicit specializations of definitions, maps and identities, including the map laws within the long API blocks. These are instance tests, not proofs of the universal theorems. “Pass” means the displayed values agree; ordering/ownership findings remain even when the formula passes. Completeness is explicitly distinguished from testing the displayed representatives.

Notation for the rows: C is the cusp algebra k[t²,t³]⊂B=k[t], I=(t²,t³); q=t²+at+b, U=q and V=tq; ε²=0. On its infinity chart u=1/t and z=1/(tq). The signed difference is source minus target. Repeated uses of C specify the same actual inclusion, not an arbitrary ring equivalence.

| Target (README line) | Instance(s) | Computed values on the two sides | Result/change |
| --- | --- | --- | --- |
| 1.1 (263) | Cusp conductor square | C=B×_(k[t]/t²)k; both ring coordinates of t² are (t²,0); the complement recovers t=t³/t². | Pass |
| 1.2 (341) | C, identity B⊂B, diagonal k⊂k² | Conductors are t²B, B and 0 respectively; t∉C but t²,t³∈C. The radical (t) in B is wrong. | Pass |
| 1.3 (400) | Affine cusp; identity ring map | The pullback contains (t²,0), excludes (t,0); in the identity case the comparison sends a to (a,[a]) and back to a. | Pass |
| 1.4 (474) | Two points 0,∞ in ℙ¹ | Both belong to ℙ¹ minus {1}, an affine open; the missing point 1 stays outside. Empty fibres impose no extra point. | Pass |
| 1.5 (496) | Z=∅, Y=Z′=Spec F₂ | Pushout has 2 points, each inclusion has a 1-point image, and their fibre product has 0 points. Identity pinching gives P=Y. | Pass; Lean headline |
| 1.6 (518) | C→B, flat extension k→k[ε] | The base-changed equalizer is C[ε]; t and εt remain excluded, while t² and εt² are included on both sides. | Pass |
| 1.7 (540) | Cusp and identity inclusion | Cusp quotients are k and k[t]/t² with pullback C; for the identity both conductor subschemes are empty and reconstruction is B. | Pass |
| 1.8 (560) | Transition 1+ε over k[ε]/ε² | Inverse transition 1−ε has product 1; transition ε has no inverse and cannot glue a line bundle by an isomorphism. | Pass |
| 1.9 (581) | Affine cusp as algebraic spaces | The resulting square has the same ring pullback C; the conductor's one geometric point has source length 2 and target length 1. | Pass on affine specialization |
| 1.10 (783) | Flat dual-number extension of that square | Conductor rings have k-dimensions 4 and 2; pulling back the original lengths 2 and 1 gives exactly 4 and 2. | Pass |
| 1.11 (812) | Affine cusp; empty pinching | The effectivity hypothesis gives the affine scheme Spec C; the empty example gives the two-point disjoint union, also a scheme. | Pass on these instances |
| 1.12 (842) | ℤ→F₂ with I=0; diagonal F₂→F₂² with I=F₂ | First kernel intersection is 0 and comparison is bijective. Second image ideal has 2 elements but its generated ideal has 4: comparison is not surjective. | Pass in both directions |
| 1.13 (943) | Cusp; ℤ→F₂ | Cusp quotient B/C has basis [t], annihilator I. For ℤ→F₂ the unit-span quotient is 0, annihilator ℤ and contracted conductor ℤ. | Pass; sampled |
| 1.14 (973) | C→B, F=C[ε]; nonflat F=C/(t²) | Flat answer is I+εI on both sides. Nonflat [t³]≠0 maps to 0 in B/(t²), so the inclusion premise fails. | Formula passes; R01 |
| 1.15 (1004) | C inverted at t²; diagonal ℤ/4 inverted at 2 | Both localized conductors are the unit ideal. Before localization, coefficient 2 in the diagonal example is outside conductor 0; after localization the ring is 0. | Formula passes; R01 |
| 1.16 (1067) | Cusp and identity morphism | Target conductor rings are k and 0 respectively; the source cusp ring is k[t]/t², with nonzero [t] and [t]²=0. | Formula passes; R01 |
| 1.17 (1303) | Cusp D→C_f | The ring map is k→k[t]/t², 1↦1. Reversing it loses the required source nilpotent. The closed-inclusion composites send U,V to 0 on both routes. | Pass; sampled |
| 1.18 (1603) | Cusp global affine reconstruction | A compatible pair (t²,0) reconstructs t² uniquely; (t,0) is incompatible since its residue is [t]≠0. | Pass |
| 1.19 (1639) | Same square, map to itself | The descended identity has pullbacks U↦t² and V↦t³. Both composites equal the prescribed maps, so its restriction to the complement is t↦t. | Pass |
| 1.20 (1667) | Cusp flat dual-number extension | Recomputed target/source conductor rings have dimensions 2/4; the pulled-back rings have dimensions 2/4 and the same nilpotents ε,t. | Formula passes; R01 |
| 1.21 (1703) | Cusp away from t²; zero localization | The inverse sends t to t³/t² and back to t. If the denominator is nilpotent, both rings are 0; no cancellation is used. | Pass; sampled |
| 1.22 (1772) | Cusp reconstruction ring equivalence | (t²,0)↦t² and (1,1)↦1; composing in either direction returns the same pair. (t,0) is outside the pullback. | Pass |
| 1.23 (1830) | Cusp over ℚ | Difference(t,0)=[t], difference(0,1)=−1, and difference(t²,0)=0. Kernel is precisely the compatible pairs; reversing the sign changes the first two values. | Pass |
| 1.24 (1894) | Diagonal F₂→F₂² | Testing basis (1,0),(0,1) gives conductor 0. Testing only (1,1) wrongly accepts coefficient 1: its span has dimension 1 rather than 2. | Pass |
| 1.25 (2006) | ℤ→ℤ/1; cusp | Zero algebra has empty spanning family and unit contracted conductor; cusp generators 1,t give I=(t²,t³), matching recomputation. | Pass |
| 1.26 (2033) | Cusp section reconstruction | Section (1+t²,1) lifts to 1+t²; its two reductions are 1 and 1. The incorrect lift 1+t has residue 1+[t]. | Pass |
| 1.27 (2117) | Cusp over ℚ, restriction to D(t²) | Difference(t,0)=[t] on the full chart; its restriction is 0 because the conductor is absent on D(t²). Both naturality routes give 0. | Pass |
| 1.28 (2186) | Native pullback of cusp section rings | The comparison takes 1+t² to (1+t²,1); each projection equals the actual restriction, and the inverse returns 1+t². | Pass |
| 1.29 (2289) | Full cusp chart and empty open | Full-chart compatible pairs reconstruct C; on the empty open all four section rings are 0 and the sole pair reconstructs 0. | Pass |
| 1.30 (2377) | Cusp additive complex | Diagonal(t²)=(t²,0), followed by difference gives 0; difference(t,0)=[t] and difference(0,1)=−1 fix both summand signs. | Pass |
| 1.31 (2516) | Affine versus proper nonsplit pinch | Affine difference surjects onto k[t]/t². For the proper pinch, constants k²→E have rank 1, cokernel dimension 1; sheaf exactness does not claim global-section surjectivity. | Pass |
| 1.32 (2544) | Two branches identified at a node | Equal branch values 0,0 descend to value 0; values 0,1 do not descend. The equality condition is necessary as well as sufficient. | Pass |
| 1.33 (2658) | Split conductor of the binary nonsplit pinch over F₄ | Two normalization points become one node; a compatible map has equal values there. Off them the point and its image are unchanged. | Pass |
| 1.34 (2779) | Cusp identity descent as scheme morphism | Pullbacks on U,V are t²,t³. The candidate normalization automorphism t↦−t over ℚ gives t²,−t³ and fails compatibility on V. | Pass |
| 1.35 (2967) | Tensor quotient for diagonal ℤ/4→(ℤ/4)² | [(2,0)] is nonzero before tensoring with ℤ/2 and becomes 0 afterwards. Both quotient/tensor routes have that value; an injectivity assertion would fail. | Pass |
| 1.36 (3043) | Cusp automorphism t↦−t over ℚ | Induced quotient map sends [t] to −[t], [1] to 0; its square sends [t] to [t]. Identity/composition hold with these actual values. | Pass |
| 1.37 (3115) | Cusp tensor swap with F=C[ε] | ε⊗[t]↦[t⊗ε]↦ε⊗[t]; ε⊗[1]↦0. Both annihilators are I+εI. | Formula passes; R01 |
| 1.38 (3278) | Diagonal over ℤ/4, identity base change | Target conductor ring is ℤ/4; comparison sends 2↦2≠0, with 2²=0. Replacing the conductor by its radical sends this value to 0. | Pass |
| 1.39 (3407) | Same diagonal, source conductor | Source ring is (ℤ/4)²; (2,0)↦(2,0)≠0 and its square is 0 on both sides of the source comparison. | Pass |
| 1.40 (3506) | Tower k→k[ε]→k[ε,η]/(ε²,η²) | Cusp target-conductor ring is the final 4-dimensional algebra. Direct and iterated comparisons both send εη to εη≠0. | Pass |
| 1.41 (3626) | Same tower on the source conductor | Source ring is F[t]/t², dimension 8 over k; direct and iterated comparisons send εηt to εηt≠0, whose square is 0. | Pass |
| 2.1 (3796) | E×ℙ¹; ℙ¹×ℙ¹ | Generic (h⁰,h¹) are (1,1) and (1,0). E×A¹ has (1,1) too but is excluded by the present proper-base restriction. | Carrier test passes; R03 |
| 2.2 (3834) | I₀* and doubled smooth fibre | Primitive I₀* vector is (2,1,1,1,1), gcd 1, whereas all-ones is not in the kernel. Double smooth fibre has gcd 2 and primitive coefficient 1. | Pass |
| 2.3 (3870) | I₂ versus III; I₃ versus IV | Root ranks/determinants are 1/2 and 2/3 in each pair. Incidence is two nodes versus one tangency, and three nodes versus one triple point. | Pass; R03 ownership |
| 2.4 (3909) | Nodal genus-one curve versus smooth E | Normalization genus plus delta is 0+1=1 for the node, 1+0=1 for E; arithmetic genus alone does not determine smoothness. | Pass |
| 2.5 (3940) | Affine A₁,A₂,D₄ and rank-one negative control | A₁ matrix (−2,2;2,−2) kills (1,1); A₂ triangle kills (1,1,1); D₄ kills (2,1,1,1,1). [−2]·[1]=[−2]≠0. Twice the marks has gcd 2. | Pass; Lean headline; R03 |
| 2.6 (3996) | One/two-component quadratic pinches | Normalization has 1/2 components; after splitting, node counts are 1/2 and arithmetic genus is 1 in both cases. | Pass |
| 2.7 (4018) | q=t²+t+1 over F₂ | No normalization conductor point is rational; 3−0+1=4 points on the pinched curve. Over F₄: 5−2+1=4. | Pass |
| 2.8 (4038) | Two ℙ¹ components with quadratic conductor | Over F₂: 2·3−0=6; over F₄: 2·5−2=8. Components remain two; only the nodes split. | Pass |
| 2.9 (4058) | Singular split fibre versus E×ℙ¹ | Split rational components descend. In the smooth product with E₁, Num has rank 2 but the fibre has 1 rational point, not 3; the singularity restriction is essential. | Pass |
| 2.10 (4094) | Split I₁,I₂,I₃ over F₂ | Normalization counts minus rational identifications are 3−1=2, 6−2=4 and 9−3=6, agreeing with rq. | Pass; sampled |
| 2.11 (4111) | Nonsplit I₁ over F₂,F₄ | Counts are 4 and 4; q+1−trace is 3−(−1)=4 and 5−1=4. Singular point included. | Pass |
| 2.12 (4132) | Fixed-component nonsplit I₂ over F₂ | Two components give 6 rational points, versus 4 for split I₂. Over F₄ both give 8. | Pass |
| 2.13 (4150) | II,III,IV with split components over F₂ | Counts are 3,5,7: q+1, 2(q+1)−1, 3(q+1)−2, all equal rq+1. | Pass |
| 2.14 (4168) | Fully descended I₀* over F₂ | Central ℙ¹ would need 4 distinct rational attachment points but has 3. Allowing nonrational attachments removes this contradiction. | Pass |
| 2.15 (4190) | Five smooth binary curves; disconnected Lang control | Each has ≥1 rational point (counts 1–5). On constant ℤ/2, Frob−1 has image {0}, not 2 elements: connectedness of the Lang supplier is needed. | Pass; Lean headline |
| 2.16 (4214) | Smooth conic XZ=Y² over F₂ | Rational points [1:0:0],[0:0:1],[1:1:1] give 3=q+1; over ℝ, X²+Y²+Z²=0 has 0 real points, outside the finite-field premise. | Pass |
| 2.17 (4234) | E₁=(0,1,1,0,1) | Affine solutions 0, plus infinity=1; Δ=1,j=0, trace=2. This is not a pointless genus-one curve. | Pass |
| 2.18 (4252) | E₂=(1,1,0,1,0) | Affine solutions {(0,0)}, plus infinity=2; Δ=1,j=1; doubling (0,0) gives infinity. | Pass; sampled |
| 2.19 (4270) | E₃=(0,0,1,0,0) | Affine solutions {(0,0),(0,1)}, plus infinity=3; Δ=1,j=0. Successive multiples of (0,0) are (0,0),(0,1),∞. | Pass; sampled |
| 2.20 (4288) | E₄=(1,0,0,1,0) | Affine solutions (0,0),(1,0),(1,1), plus infinity=4; Δ=1,j=1. Twice (1,0)=(0,0)≠∞. | Pass |
| 2.21 (4306) | E₅=(0,1,1,0,0) | All four affine pairs solve the equation; total 5, Δ=1,j=0. Trace is −2. | Pass |
| 2.22 (4324) | All 32 binary coefficient tuples | 16 have Δ=1; variable-change orbits have sizes 2,4,4,4,2 and exhaust those 16. Their counts are respectively 1,2,3,4,5. | Pass; Lean headline |
| 2.23 (4351) | F2Model at all five Fin indices | Indices 0,1,2,3,4 give counts 1,2,3,4,5 and j-values 0,1,0,1,0. There is no index 5 in Fin 5. | Pass |
| 2.24 (4458) | Smooth orbits and singular cusp | The five smooth orbit counts are pairwise distinct. Singular y²=x³ has Δ=0 and count 3 like E₃, so smoothness cannot be dropped. | Pass |
| 2.25 (4493) | Generators of all five point groups | Orders 1,2,3,4,5. E₄ cycle: (1,0),(0,0),(1,1),∞. E₅ cycle: (0,0),(1,1),(1,0),(0,1),∞. | Pass; sampled |
| 2.26 (4520) | q=t², t²+t, t²+t+1 | Each A=k+qk[t] excludes t and includes q,tq; B/A has dimension 1. For q=t² the conductor is (t²), strictly smaller than its radical (t). | Pass |
| 2.27 (4797) | Pinching Spec F₄ in ℙ¹_F₂ | Normalization contributes 3 rational points and the new rational node contributes 1; the point at infinity stays a separate smooth point, total 4. | Pass |
| 2.28 (4829) | One-component quadratic pinch | k²→E has rank 1; kernel/cokernel dimensions are 1/1. Thus h⁰=h¹=1, matching arithmetic genus 1 and count 4 over F₂. | Pass |
| 2.29 (4893) | Two-component quadratic pinch | (a,b)↦a−b has rank 1, kernel diagonal k and cokernel E/k of dimension 1. Components=2, h⁰=h¹=1, so it is not integral. | Pass |
| 2.30 (4919) | F₄⊗F₂ F₂ and F₄⊗F₂ F₄ | First is the quadratic field; second is F₄×F₄. Both have relative dimension 2, but rational branch counts change 0→2. | Pass |
| 2.31 (4944) | q=2, extension degrees 1,2,3 | I₁ counts 4,4,10 equal Q+1−(−1)ⁿ; I₂ counts 6,8,18 equal 2(Q+1) minus 0,2,0. Thickening leaves these counts unchanged. | Pass |
| 2.32 (5146) | Polynomial division by q=t² | 1↦(1,0), t³↦(0,T), t⁴↦(T²,0) in k[q]⊕tk[q]. Generally t²=q−at−b fixes the sign of both correction terms. | Pass |
| 2.33 (5204) | Cusp coordinates P=1+T,Q=1 | Forward value is 1+t²+t³; inverse returns (1+T,1). Basis vectors give 1,t³, not 1,t. | Pass; sampled |
| 2.34 (5317) | Hypersurface substitution for arbitrary a,b | V²+aUV+bU²−U³ maps to q²(t²+at+b−q)=0. For a=b=0 the image is k[t²,t³], not all k[t]. | Pass |
| 2.35 (5524) | Nonsplit and split binary quadratics | Nonsplit: t=0,1 give (1,0),(1,1), with extra origin (0,0), exactly 3 affine solutions. Split: both t are roots, leaving only the origin. | Pass both directions; sampled |
| 2.36 (5578) | Cusp inverted at q=t² | A[1/U]=k[t,t⁻¹]=B[1/t²]; t is V/U and its inverse is V/U². Both formulas multiply to 1. | Pass |
| 2.37 (5609) | Recovering t and its negative control | V/U=t in k(t); t∉A. Replacing V/U by U/V gives 1/t, unequal at t=2 over ℚ (2 versus 1/2). | Pass |
| 2.38 (5633) | Cusp integral closure | The element t satisfies X²−U=0 and lies in k(t), but not in A. Closure is k[t], with both fraction fields k(t). | Pass |
| 2.39 (5729) | B/A→(k[t]/q)/k | [t] maps to the nonzero residue class of t; [1] and [q] map to 0. Both vector spaces have dimension 1 and annihilator qB∩A. | Pass |
| 2.40 (5912) | Projective cusp Y²Z=X³ | Infinity [0:1:0] solves the equation and has Z-derivative 1; [1:0:0] gives 0≠1. The affine origin is singular. | Pass |
| 2.41 (6131) | Reciprocal cusp chart | At t=2, u=1/2 and z=1/8; z(1+au+bu²)=u³ gives 1/8=1/8 for a=b=0. At infinity u=z=0. | Pass |
| 2.42 (6299) | Overlap at t=2, q=t² | [U:V:1]=[4:8:1]=[1/2:1:1/8]; the finite and infinity chart maps give the same projective point. | Pass |
| 2.43 (6459) | Glued cusp and its normalization charts | Finite map is (U,V)=(t²,t³); infinity map is (u,z)=(u,u³). The overlap above agrees; finite origin and infinity remain distinct points. | Pass; sampled |
| 2.44 (6606) | Actual finite normalization inclusion | U↦t²,V↦t³, hence U³,V² both map to t⁶. No polynomial in these images equals t, so this chart map is not an isomorphism. | Pass |
| 2.45 (6682) | Source chart gluing at t=2 | Finite parameter 2 and infinity parameter 1/2 satisfy tu=1; gluing includes t=0 and u=0 as different points, giving ℙ¹. | Pass |
| 2.46 (6757) | Global normalization map of cusp | 0 maps to the singular origin; ∞ maps to [0:1:0]. Generic t is recovered by V/U, so generic degree is 1. | Pass |
| 2.47 (6864) | Structure maps over ℚ | Coefficient 3 maps to 3 on both finite and infinity charts and their overlap. The comparison preserves 1 as well; the zero map fails 1↦1. | Pass |
| 2.48 (6955) | Specified infinity ring map at a=b=0 | u↦u,z↦u³ makes z−u³ map to 0. On the overlap this is z↦1/t³, matching the finite map. | Pass |
| 2.49 (7005) | Integral cusp chart | U,V are nonzero and UV=t⁵≠0. Its fraction field is k(t); replacing it by the fat conductor k[t]/t² would give a nonzero square-zero element. | Pass |
| 2.50 (7081) | Source charts k[t],k[u] | Each is a domain; on overlap t↔u⁻¹, so their generic fields identify with k(t). Zero rings do not satisfy the field/domain premises. | Pass |
| 2.51 (7140) | Dense complement in the cusp | D(q)=D(t²)=D(t) is nonempty, with one excluded closed point; on it t=V/U. The closed singular point alone is not dense. | Pass |
| 2.52 (7212) | A as a k[T]-module, T↦t² | Basis (1,t³) has rank 2; (t³)²=T³·1. Candidate (1,t) fails because t∉A. | Pass |
| 2.53 (7393) | B=F₂[ε]/ε² with T↦0 | Roots of y²=0 are 0 and ε, giving distinct algebra maps V↦0 and V↦ε. For B=0 there is exactly one root and one map. | Pass |
| 2.54 (7518) | Integral factorization of cusp normalization | t is integral via X²−U and has generic degree 1; it is missing from A, so the integral factorization is not already an identity of curve charts. | Pass |
| 2.55 (7626) | Integral-closure section on finite cusp chart | Closure of A in k(t) contains V/U=t and equals k[t]. Pullback of U is t², the square of that generator. | Pass |
| 2.56 (7682) | Descent through that closure | The coefficient-compatible comparison sends t↦t; the map t↦−t over ℚ changes V=t³ to −t³ and fails the required coefficient law. | Pass |
| 2.57 (7745) | Specified generic-stalk field map | σ(V/U)=t and σ⁻¹(t)=V/U; their composites fix t and V/U. At t=2 the image is 2, whereas the inverse-parameter convention gives 1/2. | Pass; sampled |
| 2.58 (7867) | Absolute normalization compared with ℙ¹ | Both finite-chart comparisons send the integral element V/U to t and back. The origin has preimage t=0 and infinity preimage u=0. | Pass |
| 2.59 (7942) | Closure equivalence inside source field | In k(t), U,V map to t²,t³ and the closure generator maps to t. The generator's square is U on both sides. | Pass |
| 2.60 (8052) | Closure equivalence inside curve field | Cusp t maps to V/U; nonsplit t↦t+1 fixes U but changes V to V+U≠V. At infinity z maps to 1/(tq). | Formula passes; R07 |
| 2.61 (8175) | Native normalization sections versus chart sections | The native integral generator V/U maps to t; inverse sends t to V/U. On D(U), both restrictions send it to the same fraction t. | Pass |
| 2.62 (8283) | All opens, including nonaffine whole curve and empty open | Whole proper normalization has sections k and the comparison is identity; finite chart has k[t] on both sides; empty open has 0 on both sides. | Pass |
| 3.1 (8492) | R=k[[t]], R′=k[[s]], t=s² | Ramification index 2, residue degree 1; special fibre k[s]/s² has length 2, while its reduced intersection has length 1. | Pass |
| 3.2 (8515) | Normalized base change of a product good-reduction model | Normal model has generic E_K′, special E_k and global constants R′; the lifted origin is a section with composite identity on R′. | Pass on good-reduction instance |
| 3.3 (8541) | Good-reduction E_R′ and a rational blowup | Special curves have h⁰=1,h¹=1, χ=0. A rational exceptional component adds h¹=0, leaving the required value 1. | Pass |
| 3.4 (8561) | Identity E→E and inseparable Frobenius | Both source genera are 1. For Frobenius of degree p, norm∘pullback=[p] is a nonzero isogeny of degree p², despite zero tangent map. | Pass |
| 3.5 (8582) | Smooth E and a pinching increasing delta by 1 | For E, h¹=1 and delta=0. Pinching with unchanged constants adds delta 1 and gives h¹=2; it cannot be an equality-case counterexample. | Pass |
| 3.6 (8603) | Blowup of a smooth elliptic special fibre | The elliptic component contributes h¹=1 and the exceptional ℙ¹ contributes 0. Two dominating positive-genus components would require h¹≥2>1. | Pass |
| 3.7 (8625) | Tame double-fibre translation quotient | Reduced fibre E/⟨τ⟩ receives the degree-2 isogeny from E. Jacobian fibre and torsor full fibre have multiplicities 1 and 2; no equality of full fibres is inferred. | Pass |
| 3.8 (8644) | Frobenius isogeny of E₃/F₂ | Counts over F₂ and F₄ are 3 and 9 on both curves: traces 0 and −4 give 3−0=3 and 5−(−4)=9. | Pass |
| 3.9 (8663) | Isogenous binary smooth fibres | The five possible F₂ counts are 1–5 without repetition; equal counts select the same one of the five classes. Singular count 3 is excluded by smoothness. | Pass |
| 3.10 (8679) | (E×Spec ℂ[[s]])/((P,s)↦(P+τ,−s)) | For nonzero τ∈E[2], the action has no fixed point, t=s², and the special fibre has multiplicity 2. Taking τ=0 gives fixed points and fails freeness. | Pass |
| 3.11 (8706) | Good reduction and the tame double-fibre quotient | Good reduction has period=m=1, discriminant valuation 0 and zero Lie/obstruction lengths. The tame quotient has period=m=2, primitive type I₀, while its Jacobian has multiplicity 1. | Pass on these controls; general corrected comparison not independently reproved |
| 4.0 (8805) | ℙ² and one point blowup | Picard rank 1→2, K² 9→8, χ(O)=1→1; exceptional square −1. Rank+K² remains 10. | Pass |
| 4.1 (8859) | Elliptic product, rational Jacobian, Jacobian K3 over ℙ¹ | With T=0, χ=0,1,2 gives L degrees 0,−1,−2 and canonical base degrees −2,−1,0 respectively. | Pass; R03 ownership |
| 4.2 (8881) | χ=1 with torsion lengths 0 and 1 | deg L=−1 and −2; −deg L−length T gives 1 in both cases. Dropping torsion gives the wrong second result 2. | Pass as degree-formula test; R03 |
| 4.3 (8899) | Tame multiplicity 1 and 2 | (ν,a)=(1,0),(2,1) give ν dividing m and a+1; m/ν=1. Reduced support alone does not distinguish m=1 from m=2. | Pass |
| 4.4 (8922) | Rational Jacobian versus elliptic product | Rational case: K=−F,K²=0,O²=−1. Product: K=−2F,O²=0, excluded by rationality. | Pass |
| 4.5 (8941) | Nine geometric point blowups | Gram diag(1,−1,…,−1) has rank 10, determinant −1, signature (1,9); K²=9−9=0. | Pass |
| 4.6 (8967) | F,O,F+O in the ordered plane | Squares 0,−1,+1; pairing F·O=1; determinant −1; inverse matrix (1,1;1,0). Projection returns F and O on those two inputs. | Pass |
| 4.7 (8996) | Product E×B with nontrivial L∈Pic⁰(B)[2] | f*L restricts to 0 on the generic fibre but to L≠0 on O. Thus the vertical kernel contains nonzero degree-zero 2-torsion from B. | Pass; R03 ownership |
| 4.8 (9020) | Same product, E and B nonisogenous | Proposed degree-zero generators restrict to 0 on O; the actual class f*L restricts to L of order 2. Repaired generators include it. | Fails; R02 |
| 4.9 (9043) | Negative E₈ and section P=O | Rank 8, determinant 1, negative even norms. For P=O the projected section vector is 0 and −2−2(P·O)=−2+2=0. | Pass |
| 4.10 (9068) | Weight 6 reversal of 1,t⁶,t⁷ | Images are s⁶,1,0; double reversal returns 1,t⁶,0. The last differs from t⁷, which lies outside the degree bound. | Pass |
| 4.11 (9116) | Positive multiples nO on a genus-one fibre | For n=1,2,3, h⁰=n and h¹=0; at n=0, h⁰=h¹=1. The positive-n hypothesis excludes the boundary failure. | Pass |
| 4.12 (9141) | Rank-three splitting on ℙ¹ | O⊕O(−2)⊕O(−3) has rank 3 and degree −5; its fibre has dimension 3, matching h⁰(E,O(3O))=3. | Pass |
| 4.13 (9159) | Component Θ disjoint from O; smooth fibre | O(3O) has degree 0 on Θ, so contracts it; degree 3 on a smooth genus-one fibre gives a cubic embedding. Relative very ampleness on the resolution would fail. | Pass |
| 4.14 (9184) | Inverse chart at t=2 over ℚ | For weight i, aᵢ=1 gives aᵢ′=2⁻ⁱ; x′=x/4,y′=y/8 makes both cubic sides scale by 2⁻⁶. | Pass |
| 4.15 (9207) | Constant smooth coefficients | The minimal surface is E×ℙ¹, with h¹(O)=1 and χ=0, not a rational Jacobian. The zero coefficient tuple has Δ=0 and is excluded earlier. | Pass |
| 4.16 (9226) | Regular curves y²=x³+s over F₂(s), F₃(s) | After suitable purely inseparable extension the normalization genus is 0 and delta is 1. For p=3, (p−1)/2=1 divides 1; p=5 gives 2, which does not. Characteristic 0 gives smoothness. | Pass; Lean headline; R03 |
| 4.17 (9268) | Tame double-fibre torsor versus Jacobian | Torsor multiplicity 2 precludes a section since 1=2·intersection is impossible; Jacobian has origin and multiplicity 1. Generic identification must be retained for uniqueness. | Pass; R03 ownership |
| 4.18 (9298) | ℂ(t) versus F₂(t) | Tsen gives Br(ℂ(t))=0. For the constant quadratic extension F₄(t)/F₂(t), norms have even t-adic valuation; t has valuation 1, giving a nontrivial cyclic Brauer class. | Pass |
| 5.0 (9337) | ℙ², rational point blowup, degree-two point blowup | Geometric cohomology ranks add 1 per point. Rational exceptional Frobenius trace is q; a conjugate pair has eigenvalues q,−q and trace 0. | Pass |
| 5.1 (9390) | Binary I₁,I₂,II,III,IV counts | Split values 2,4,3,5,7; nonsplit I₁,I₂ values 4,6. These include singular points and give the stated n_a formulas. | Pass |
| 5.2 (9409) | Rank-ten finite action, q=2,3 | Identity traces 10 yield 25,40. Nine +1 and one −1 give trace 8 and q=2 count 21, below 25. | Pass |
| 5.3 (9443) | Two components of type A₂ | Intersection matrix (−2,1;1,−2) has determinant 3 and root squares −2; the positive Cartan convention has the opposite diagonal sign. | Pass |
| 5.4 (9467) | IV triangle and IV* arms; A₂,E₆ | Fixing two marked outer positions kills the remaining branch permutation. Determinants 3 and 3 cannot be determinants of unimodular direct summands (1). | Pass; sampled |
| 5.5 (9490) | D-type vector weight; restriction negative control | Weight norm in negative D is −1; even unimodular W cannot contain it. Restriction is not an isometry: in ℤ², e₁ has norm 1 but restriction to ℤ(e₁+e₂) has dual norm 1/2. | Pass for the repaired dual-membership argument |
| 5.6 (9516) | Affine E₇ and E₈ marked graphs | Arm lengths are (3,3,1) and (5,2,1); fixing the specified terminal distinguishes all arms, leaving automorphism count 1. | Pass |
| 5.7 (9536) | I_m* root rank in rank-eight complement | m+4≤8 gives m≤4; m=5 would have rank 9. The separate I₀* exclusion removes m=0, not the positive cases. | Pass |
| 5.8 (9555) | Fixed section/component/fibre generators | Every generator has Frobenius eigenvalue 1, so the rank-ten trace is 10 and the q=2 count is 25. This specialization uses B=ℙ¹ as repaired in R02. | Pass in its rational-base scope |
| 5.9 (9576) | All component counts ≤5 | Additive count ≤7; the one exceptional semistable/supersingular slot ≤10. Sum ≤10+7+7=24, whereas Picard constancy gives 25. | Pass; sampled |
| 5.10 (9596) | Case 5D with d₁=1,1+t,0 | All give Δ=t¹², but the first two satisfy t∤d₁ and the third does not. Six unnamed reductions cannot be recovered from the discriminant test. | Specification incomplete; R04 |
| 5.11 (9619) | Would-be II+E₄+I₉ configuration | Counts 3+4+18=25, so the point count does not exclude it. The independent configuration theorem is necessary. | Pass as negative control; R04 prerequisite |
| 5.12 (9637) | E₃ versus a bad fibre with a₁=t | Smooth E₃ has c₄=0,Δ=1 and is not additive. At a bad fibre Δ=0, c₄=t⁴ vanishes only at t=0. | Pass |
| 5.13 (9656) | Equation 25=5+2m+2n, m=6 or 8 | m=6 requires n=4, outside 1≤n≤2; m=8 gives n=2. Thus the surviving count is 5+16+4=25. | Pass conditional on configuration inputs |
| 6.1 (9693) | All fourteen displayed models | Each discriminant is nonzero; each independently resolved rational-fibre count sums to 25. The individual values are in the next table. | Representative tests pass; completeness not inferred |
| 6.16 (9772) | Factor t²+t+1 in models 2,14 | No F₂ roots, two F₄ roots; each has Δ-valuation 1 and c₄ a unit. Other nonzero-j discriminants have no nonrational factor on either chart. | Pass |
| 6.17 (9791) | Zero-j models 9,10,11 | Finite discriminant t⁸ and infinity discriminant s⁴ vanish only at rational 0,∞. At t=1, counts are 5,5,3. | Pass |
| 7.1 (9822) | Characteristic-two translation x↦x+a₂ | (t,t,0,0,0) becomes (t,0,t²,t²,0); (0,1,0,0,0) becomes (0,0,0,1,0). There are 2¹⁸ normalized tuples, including the excluded Δ=0 tuple. | Pass |
| 7.2 (9857) | Admissible translations and base inversion | Translation parameter space has 2²·2³·2⁴=512 elements; PGL₂(F₂) has 6. Inversion twice sends t→1/t→t; r=t² is allowed, r=t³ is not. | Pass on these controls |
| 7.4 (9893) | Proposed complete list versus tested representatives | 14 representatives pass the equations/counts; this supplies 14 examples, not an upper bound of 14 on all eligible classes. Required six normalization statements are unspecified. | Not certified; R04 |
| 7.5 (9930) | Eleven nonzero-j representatives | Eleven have a₁=t and nonzero j. Models 1 and 14 have degree-4 j with pole partitions (4) and (2,1,1); equal degree does not identify them. Source list has 8. | Examples separated as below; upper bound not certified |
| 7.6 (9957) | Three zero-j representatives | Models 9–11 have c₄=0 and Δ=t⁸≠0. Model 9 has different additive types; 10 versus 11 have t=1 counts 5 versus 3. | Representative distinction passes; completeness remains dependent |

Additional convention and supplier controls:

| Statement | Instance | Computed values on the two sides | Result/change |
| --- | --- | --- | --- |
| R05, proper-flat cohomology contract | Wild characteristic-two quotient described in R05 | Generic (h⁰,h¹)=(1,1), special (2,2); χ is 0 on both, while h¹ changes 1→2 | Remove unconditional local freeness |
| General DVR normalization | ℤ₃[√3]/ℤ₃ and k[[s]]/k[[t]], t=s² | e=2,f=1 and special length 2 in both mixed/equal characteristic examples | No replacement of the uniformizer by a rational prime in the general formula |
| Nonabelian Lang input | PGL₂ over F₂, whose rational group is S₃ | On F₂-points Frob(g)g⁻¹=1 for all 6 elements; image size 1, not 6 | Lang is a geometric-point/morphism assertion, not surjectivity on this finite group |
| Empty/rank-zero and q=1 controls | Matrix index set empty; putative field size 1 | gcd(empty)=0≠1 and Nonempty fails; a field has 0≠1 and at least 2 elements | Both excluded by actual hypotheses, not assigned a spurious output |
| Finiteness in flat annihilators | stacks, tag 07T8, lines 4457–4465 | For a finite generating set, Ann(M)=intersection Ann(mᵢ); finite intersections commute with flat extension | Matches §1.14 without Noetherianity; no infinite intersection assertion |

The following computations were performed directly over F₂[t], independently of the displayed invariant columns. Resolving rational singular points by their point-blowup charts gives the three counts shown; at each centre the change is the number of rational points on the exceptional tangent cone minus one. Nonrational centres have no effect on the F₂ count. This checks the counts, not the universal classification or every geometric local-minimality proof.

| Model | Computed Δ | Computed j=c₄³/Δ | Computed resolved counts at 0,1,∞ | Comparison |
| --- | --- | --- | --- | --- |
| 1 | t⁸ | t⁴ | 13+4+8=25 | matches |
| 2 | t¹⁰(t²+t+1) | t²/(t²+t+1) | 17+4+4=25 | matches |
| 3 | t¹⁰ | t² | 17+4+4=25 | matches |
| 4 | t¹⁰ | t² | 17+2+6=25 | matches |
| 5 | t¹¹ | t | 19+4+2=25 | matches |
| 6 | t¹¹ | t | 19+2+4=25 | matches |
| 7 | t¹² | 1 | 19+2+4=25 | matches |
| 8 | t⁴ | t⁸ | 5+4+16=25 | matches |
| 9 | t⁸ | 0 | 13+5+7=25 | matches |
| 10 | t⁸ | 0 | 15+5+5=25 | matches |
| 11 | t⁸ | 0 | 15+3+7=25 | matches |
| 12 | t¹⁰ | t² | 15+4+6=25 | matches |
| 13 | t¹¹ | t | 17+4+4=25 | matches |
| 14 | t⁸(t²+t+1) | t⁴/(t²+t+1) | 15+4+6=25 | matches |

For the repeated j-values, the resolved fibre types/ordinary point counts separate 3,4,12 and 5,6,13. The constant-j nonzero model is 7. The two degree-four j-functions have different pole partitions; model 2 has degree two with two distinct poles, unlike t². Among j=0 models, 9 has an I₁* fibre while 10,11 have IV*; the latter differ by their smooth-fibre counts 5 and 3. These checks support distinct representatives. They do not prove that no further representative exists.

## Not verifiable

- **Full eleven-/fourteen-class exhaustiveness:** the accessible source proves a shorter list with an omitted twisted-case argument. I checked the extra equations, discriminants, rational counts and separating invariants, but cannot certify exhaustiveness from that source. The independent replacement statements must be supplied as in R04. The local-minimality and all geometric fibre-type assertions were not each independently reconstructed from a complete sequence of geometric blowups; numerical blowup counts alone do not certify them.
- **William E. Lang, configurations (lang-config):** the sources service tried DOI 10.1080/00927870008827190; the publisher returned HTTP 403 and no legal readable copy was found. Its primary configuration/normal-form assertions remain uncertified. Schröer's explicit uses were read, but are not a replacement for the missing primary text or missing target statements.
- **Kac (kac):** the service reached the Cambridge bibliographic page for the third edition, not an open text. Chapter 4, Theorems 4.3 and 4.8/Table Aff 1 could not be checked at the printed locator. The small affine-matrix witnesses and the pinned matrices/marks were checked independently.
- **Hartshorne, Chapter V §3:** the service classified DOI 10.1007/978-1-4757-3849-0 as paywalled without resolving it and returned uncertified. The exact textbook locators for the rational-surface blowup assertions were not read; the exceptional-intersection, canonical-square and Picard-rank examples were computed independently.
- **Serge Lang (lang):** the legal public scan was fetched, but its extraction is image-only and OCR is unavailable; the scan was not verified visually. I resolved the existing ReductiveGroupsPartII prose contract; I did not certify the source's printed Theorems 1–2 against readable text.
- **Szydlo (szydlo):** the stated author URL failed certificate verification. No certificate check was bypassed. This bibliography item is not needed for the sampled perfect-residue calculations; its text was not verified.

The other cited works and linked Stacks chapters were fetched through the sources service. No worktree source manifest or source file was changed. The designated scratch record retains missing-source details; the review is finished, not parked.

## Source issues

The following are source defects encountered in checking the arguments; several are already explicitly corrected by this roadmap and are not additional PR findings.

- **Error** in schroer at Proposition 3.1, printed p.11: the source says rationality of the base point is equivalent to all fibre components being rational curves, including smooth fibres; it should be restricted to singular primitive fibres, since a smooth elliptic fibre need not have rational components; affects a stated result.
- **Error** in schroer at Proposition 6.1 proof, printed p.18: the source says O(3O) is relatively very ample on the regular surface; it should be relatively generated there and very ample on the cubic contraction, since disjoint vertical components have degree zero; affects the proof.
- **Misprint** in schroer at Proposition 6.1 proof, printed p.18: the source says the t-chart frames use inverse powers of t₀ and t⁻⁶=(t₀/t₁)⁶; it should be inverse powers of t₁ on that chart, of t₀ on the inverse chart, and t⁻⁶=(t₁/t₀)⁶; affects the proof.
- **Error** in schroer at Proposition 9.3(v) proof, printed p.25: the source says Tsen makes Br(F₂(t)) zero and identifies rational Picard points with actual degree-zero line bundles; it should be applied only over algebraically closed constants, retaining the Picard–Brauer obstruction over F₂(t); affects the proof.
- **Error** in schroer at Proposition 9.5 proof, printed pp.26–27: the source says the IV graph is a tree with terminal vertices and groups III*/II* under the two-terminal shortcut; it should be a triangle for IV, with the weighted marked-graph rigidity proved separately for the exceptional stars; affects the proof.
- **Error** in schroer at Proposition 9.5 proof, printed p.27: the source says restriction to a component lattice's dual preserves the norm of a vector; it should be replaced by proving that the dual weight pairs integrally with every generator of the full unimodular lattice; affects the proof.
- **Error** in schroer at Proposition 10.3 proof, printed p.29: the source says vanishing c₄ alone characterizes additive reduction; it should be vanishing c₄ at a bad minimal fibre, also requiring Δ=0; affects the proof.
- **Misprint** in schroer at Theorem 10.4 proof, printed p.30: the source says r_a≥3 when r_a=7 in the untwisted case; it should be r_c≥3, from r_c=12−i−r_a and i≤2; affects the proof.
- **Misprint** in schroer at Theorem 10.4 proof, printed p.31: the source says r_c≥7 in the twisted case despite r_c≤2; it should be r_a=11−i−r_c≥7; affects the proof.
- **Gap** in schroer at Theorem 10.4 proof, printed p.31: the source says the twisted argument is analogous and retains only two twisted configurations; it should be completed with the I₂*, I₃* and IV* twisted configurations represented by models 12–14 here; affects a stated result.
- **Error** in llr at Theorem 4.3, printed p.483: the source says the Artin–Tate/BSD order formula has no Picard-obstruction factor; it should be multiplied on the Brauer side by a², where a is the index of actual degree-zero line bundles in rational Jacobian points; affects a stated result; corrected in print at llr-corr, Corrected Theorem 4.3, printed p.594.
