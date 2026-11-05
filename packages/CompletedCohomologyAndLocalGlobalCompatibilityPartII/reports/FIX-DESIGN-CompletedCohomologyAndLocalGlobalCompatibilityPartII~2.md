# Design repair report

The changes are confined to this package’s design README, design plan, sources manifest and this requested report. Six layers remain in the same mathematical order. The plan has 21 entries and ten separately identified supplier gaps. Those gaps are requirements on other owners, not assertions that their missing theorems have been implemented.

## F01 (P1) — applied

Anonymous G1–G7 → ten structured contracts across the overlapping findings. Each has slug, supplier, section, needs and consuming sections, mirrored under Exact supplier contracts. G1 names LocalGaloisDeformationRings §1.1; G3 splits into three SmoothRepresentationsOfLocalGroups §SR.5.2 contracts. G2, G6 and G7 disappear; G4 and G5 retain only their missing parts.

## F02 (P2) — applied

Four unbuilt suppliers treated as available → existing owners for Banach duality, analytic-vector density, potential diagonalizability and benign geometry. Continuous induction remains gap:continuous-finite-index-induction at LocallyAnalyticRepresentationsOfLocalGroups Layer LR.0. Both deliverables explicitly require that supplier to be packaged before this roadmap can be packaged or ported. No ordering file changed.

## F03 (P1) — not actionable in this package: ModularityAndLanglandsExtensions must add the lift theorem

An external citation alone → gap:pd-crystalline-lift, assigned to ModularityAndLanglandsExtensions §2.1 in both deliverables. Section 1.2 consumes that gap. EG lines 6961–6965 give exactly a crystalline regular lift with potential diagonalizability, without a prime restriction. This package cannot add a target to the supplier; that remaining addition requires its owner.

## F04 (P2) — applied

The benign-point definition, benign-open theorem and G6 → imports from the parent §5.2a, specifically “Benign points and tangent spanning.” Only benign density remains here, as §6.1. Parent geometry and §5.1 testing density are its inputs. EP lines 1320–1336 supply precisely the imported predicate and nonempty componentwise open locus.

## F05 (P2) — applied differently

Explorer identifiers → actual supplier sections throughout statements, dependencies, contracts and plan. Added the missing PadicHodgeTheory §§3.3–3.5 and LocalGaloisDeformationRings §3.1 point-predicate inputs. At the inspected head, the latter’s §3.9 gives generic dimension/regular-open results; full crystalline regularity is §3.10. The former benign-open target is deleted, so its smooth-chart reliance disappears with it.

## F06 (P2) — applied differently

Redundant rational-representation, analytic-vector, Jacobson, point-detection and component-pair gaps → existing supplier imports. Retained projective decomposition and two separate tensor gaps. Added prescribed central-character realization to §3.5. For negative n the suggested weight (n,0,…,0) is not dominant: use (0,…,0,n). Both signs have explicit Checks. The tensor inputs are CEGGPS Appendix A and HP Appendix A.

## F07 (P2) — applied

Incorrect pins and absent-Iwasawa-carrier claim → Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, with the completed group algebra and compact action named by file and line. Removed the ring-construction request. The omission account now distinguishes those existing carriers from the missing arithmetic deformation and patched-module objects.

## F08 (P2) — applied

Conditional density on a separately certified type support → density on all X□ for every inertial type, with regular weights varying (§6.3). Section 6.2 now proves Jτ=Ann_R M∞=0 automatically: CEGGPS lines 1651–1663 give σ(τ)≠0; EP lines 618–621 give the capturing family. Removed the type-by-type certificate wording throughout. W=0 remains solely a degenerate Check.

## F09 (P2) — applied

Wild density under p∤2d → tame induced-character density for every degree-d E/F admitting a minimal element (§6.5), with ψ restricted to U_E^{m+1} equal to θ there. All density consumers use this scope. Wild simple-stratum membership remains only in §6.4, tested at ℚ_3(3^(1/3)); 3 divides 2·3, excluding that instance from density.

## F10 (P3) — applied

Self-dual/trivial convention witnesses → computed discriminating Checks in Conventions, §1.1 and §2.3. Weights (2,0) give highest weight (0,−1), not (1,0). At d=2, F=ℚ_5, ψ=1, geometric Artin gives δ(2)=2; arithmetic gives 1/2. Contragredient action changes the compact value 1/2 back to 2.

## F11 (P3) — applied

“A is a domain” → “A is geometrically integral” in the component Check and its example. Added O[[x]]/(x²−ϖ): after adjoining a²=ϖ it has minimal primes (x−a),(x+a), hence two patched components over each χ. The same geometric qualification is retained in local-faithfulness and downstream component discussions.

## F12 (P3) — applied

Blueprint field lists and nodes → the house README structure and a plan with roadmap, title, parent, summary, baseline, layers, suppliers, consumers and gaps. Six layers retain their order, with numbered prose subsections, API bullets, computed Checks, Examples and Dependencies. Ownership and supplier contracts precede the build. The no-declaration acceptance specification stays in the README.

## F13 (P3) — applied

Process labels, internal node references and nonexistent “existing” continuations → timeless ownership statements and mathematical examples. The three source corrections retain their corrected step, counterexample and exact locator in Worked examples. The excluded paper routes are simply outside scope. The component contract names LocalGaloisDeformationRings §1.1, rather than a proposed extension without an owner.

## F14 (P3) — applied differently

Planned scalar/closure padding and four computations → a declaration-free acceptance specification naming all seven headlines and their missing carriers. These elementary consequences remain prose. This design has no Suggested.lean, and creating one is outside the editable files. No Lean declaration was added or removed; the plan no longer prescribes substitute kernel, scalar or closure theorems.

## F15 (P3) — applied

No manifest → eight uniquely keyed legally fetched works: the seven cited works plus HP, needed to verify the tensor gaps. Corrected DPS to p. 38, EP Proposition 3.19 to p. 356, and Theorem 5.1’s proof to pp. 363–364 everywhere. Service metadata, complete bibliographic fields and version notes are recorded; no source remains missing.

## F16 (P3) — applied

Separate comparison/duality/scalar repetitions → one testing-module API (§3.2), the imported capture contract and one scalar-action consequence (§3.1). Added the induction computation n·dim V on both sides, including 2=2 and identity-index r=r. Section 3.4 now allows every nonzero finite-dimensional continuous T of the required central character, as DPS lines 1950–1952 and 1981–1997 permit.

## F17 (P3) — not actionable in this package: the earlier parent must expose its capture interface

Capture and algebraic capture as new consumer-owned targets → an import from parent §5.3, registered as gap:algebraic-capture. The parent’s support proof already invokes EP Proposition 3.1, so making it depend on this continuation would reverse supply. This package cannot edit the parent. Its owner must add the explicit interface; the fixed-centre and smooth-family extensions remain here.

## Verification outcomes

The required dependency command completed with exit code 0. Its exact output was:

```text
candidate: CompletedCohomologyAndLocalGlobalCompatibilityPartII is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 51 roadmaps, 583 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The gate places the design after its last recognized supplier; no order file was edited. This does not discharge the explicitly unmet LR.0 supplier contract or manufacture its merge-order entry.

The sources check completed with exit code 0:

```text
packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/sources.toml: 0 problem(s)
```

The citation resolver, against main 35c9f96 and the 362 indexed open heads, reported “None” for cross-roadmap citations found nowhere and “None” for Lean names found nowhere. It expressly does not check external library names without local pinned Lake packages. Those names were separately located with GitHub search and read from their files at the exact manifest pins, including the additional LinearMap.mem_ker declaration. Recursive pinned tree listings were inspected for the missing arithmetic carriers; no newer revision was used to claim a pinned declaration.

JSON/TOML parsing and structural assertions passed: six layers, 21 section entries, ten unique gap slugs with all required fields, and eight unique certified source keys with complete metadata. Every plan statement, API bullet and Check was compared with the README. Every gap sentence was compared verbatim with its README contract. Every definition/construction retains at least three discriminating Checks. All section references resolve to retained targets or explicitly named imports. A whitespace check and machine-path scan cover all four deliverables.

There were no separately listed gate failures in the brief. No Lean elaboration command was supplied for this design lane, no Suggested.lean exists, and no new Lean declaration is specified. The requested mechanical #check comparison therefore has an empty declaration set: no binders changed or silently disappeared. No Lean process was started.

## Source and ownership evidence

The seven manifest entries mentioned in the review were absent from the initial checkout. They were recovered through the sources service under the same keys; no existing work was renamed. The published BIP PDF was legally fetched with the same BIP key after the service required an explicit publisher-open class. HP v3 was unavailable; v2 was fetched legally instead. Both resolved failures were cleared from the missing-reference list. HP v2 is dated 7 March 2018, and its Appendix A is the general algebra used here. BIP’s reference [29] is Hu–Paškūnas with Shotton’s appendix, not Hellmann–Schraen.

| Work | Text actually read for the changed mathematics |
| --- | --- |
| BIP | Corollary 3.38, p. 25, BIP lines 1290–1301; Corollaries 4.19, 4.21–4.22, pp. 39–40, BIP lines 1996–2023; §6, pp. 46–50, BIP lines 2286–2502. The theorem numbering was compared with arXiv v2; published pagination is used in the design. |
| EP | Capture and tensor stability, EP lines 266–405, 612–621; numerical criterion, EP lines 520–607; principal types, EP lines 657–748; minimal elements/types and tame recognition, EP lines 753–850; density proof, EP lines 1126–1209; benign geometry, EP lines 1320–1336. |
| CEGGPS | Conventions, CEGGPS lines 460–535; inertial types, CEGGPS lines 1651–1663; finite model, CEGGPS lines 1950–1952; completed tensors, CEGGPS lines 3304–3350. |
| DPS | Sign comparison, DPS lines 1742–1761; continuous T and fixed-centre evaluation, DPS lines 1950–1997. |
| EG | EG lines 193–200 and 6961–6993, especially Theorem 6.4.4(1), printed pp. 168–169. |
| ST | Universal continuous functions, ST lines 349–391; equivariant duality, ST lines 415–447. Imported through CompletedCohomologyPartII §F.1. |
| NAK | Lemma 4.2 and relative period/base-change argument, NAK lines 1356–1380; consumed only through the parent §5.2a. |
| HP | Appendix A Lemmas A.1–A.5 and their proofs, HP lines 2679–2760. These are statements for general complete local O-flat algebras, not only the rank-two arithmetic setting of the body of that paper. |

Read main roadmaps ClassFieldTheory, ReductiveGroups and PadicMeasuresIwasawaAlgebras for structure and existing objects. The exact consumed sections of all readable suppliers were read at main or their indexed open heads: parent §§5.1–5.3 including §5.2a; PadicHodgeTheory §§3.3–3.6; LocalGaloisDeformationRings §§F.0.1, 1.1, 1.19, 3.1, 3.4, 3.9–3.10; DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.6–4.7; CompletedCohomologyPartII §§F.1–F.2, F.4, 3.2; PadicLocalLanglandsForGL2Qp §0.1; SmoothRepresentationsOfLocalGroups §§SR.2.1, SR.3.1–SR.3.2, SR.5.2; EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30; ModularityAndLanglandsExtensions §2.1.

Object searches with roadmaps grep covered the indexed open heads and main for capture, benign points, crystalline/crystabelline density, local faithfulness, compact projectives and finite-index induction. Local package searches complemented these. No additional owner for the BIP local-faithfulness/density applications was found; capture and benign geometry were the overlaps repaired here. The four unbuilt designs’ files were not supplied in this checkout, so ownership against their unpublished design contents was not checked. No unsupplied open pull request was independently fetched. LR.0 is expressly a missing contract, not an available theorem.

## Adversarial mathematics pass

The table separates defining formulas, API assertions and theorems, including the changed supplier interfaces. Computed instances are controls; the general targets rest on the source locators and named suppliers, with unmet inputs retained as gaps. No instance calculation is treated as a proof of a density theorem.

| Statement | Instances tried | Computed values on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing rank, prime and coefficient conventions | d=0; p=d=3; p=2,d=1; O=ℤ_5 | d=0 violates d≥1; 2d=6 is divisible by 3; 2d=2 is divisible by 2; 5≠0 in O but 5=0 in k | Boundary cases excluded precisely where patching needs them | Kept the source’s prime range; definition §6.4 is unrestricted |
| Coefficient fields for infinite test families | Characters of orders 5 and 25 over ℚ_5 | ℚ_5(ζ_5) and ℚ_5(ζ_25) have degrees 4 and 20; the degrees 4·5^(r−1) grow without bound | A fixed finite field does not contain every family member | Made memberwise finite coefficient extensions explicit |
| Scheme-spectrum density | R=O, its generic point | Kernel=0; V(0)=Spec O includes (ϖ), although the generic point itself avoids ϖ | Generic closed points need not be closed in Spec O | Retained topology convention |
| Finite residue size and normalization denominators | F=ℚ_5 and its unramified quadratic extension | f=1,2 give q=5,25; q>1, so q^(1/2) and its inverse are nonzero | No q=1 or zero denominator enters | Defined the residue-degree notation |
| Hodge dual convention | d=2, weights (1,0),(2,0); d=1, weight −1 | a=(0,0),(1,0),−1; dual weights (0,0),(0,−1),1; undualised second weight=(1,0) | Distinguishes the inverse highest weight | Conventions and §1.1 |
| Local Langlands twist | d=1,2; diag(ϖ_F,1) at d=2 | Exponents 0,−1/2; norm q⁻¹ gives q^(1/2), whereas +1/2 gives q^(−1/2) | Two conventions disagree already in rank two | Added computed witness |
| Artin normalization | d=2,F=ℚ_5,ψ=1,u=2 | Geometric δ(2)=2; arithmetic δ(2)=1/2; product=1 | Tests inversion rather than the trivial character | Conventions and §2.3 |
| Contragredient central action | Compact scalar action δ(2)⁻¹=1/2 | (2·f)(m)=f(2⁻¹m)=2f(m); retaining 1/2 would be wrong | Corrects the action direction | Conventions and §2.3 |
| Schikhof torsion boundary | M=O and M=O/ϖ | O has dual O and bidual O; Hom_O(O/ϖ,O)=0, hence bidual 0≠O/ϖ | Torsion-free hypothesis is necessary | Kept qualified supplier |
| Compact topology and products | M=O^ℕ; dual c₀(ℕ,L) | Coordinate e_n→0 in the compact product, but sup norm(e_n)=1; finite truncation error in c₀ tends to 0 | Product and lattice topologies differ | Retained topology contract |
| Native completed algebra/action | H=S₃; g=(12),h=(23); regular O[H] | [g][h]=[(123)] and [h][g]=[(132)]; [g]·[1]=[g]≠0 | No hidden abelian or zero-action model | Imported the pinned carrier/action |
| §1.1 point-set definition | d=1; rank-two Steinberg point | Rank-one induction dimension=1 and all three fixed-weight predicates coincide; Steinberg N has rank 1, excluding both N=0 sets | Separates general potentially semistable from potentially crystalline | Retained four definition controls |
| §1.1 coefficient-extension API | x:O→L and L⊂L′ finite | Both kernels in O are 0; the same point has HT labels and N=0 unchanged | Preserves the point predicate | Exact coefficient hypotheses retained |
| §1.1 crystabelline API | Direct sum of two crystalline characters | WD=χ₁⊕χ₂, N=0; after an abelian extension finite character factors become 1 | Principal-series cuspidal support, without irreducibility of the full induction | Retained general formulation |
| §1.1 supercuspidal API | Unramified quadratic E/ℚ_5; residue character of order 24 | Frobenius conjugates exponents 1 and 5 modulo 24, unequal; induced dimension=2 and N=0 | Irreducible Weil induction distinguishes supercuspidality | Retained recognition input |
| §1.1 weight API | k=(2,0) | k−(1,0)=(1,0); negative reversed tuple=(0,−1) | Same computed value as the standing convention | Added dual control |
| §1.1 generic-prime API | Generic and special points of Spec O | p∉(0), p∈(p); only (0) comes from a finite characteristic-zero field, with [L:L]=1 | Special-fibre points are not arithmetic points | Kept generic-prime condition |
| §1.2 universal lift application | Trivial rank-one residual representation; p=d=3 | Trivial lift has weight 0 and one diagonal summand; 3 divides 6 although EG still supplies the lift | Lift existence and patching have different prime ranges | Registered gap:pd-crystalline-lift |
| §2.1 component theorem | A geometrically integral; A=O[[u,v]]/(uv) | Number over each χ is 1 versus 2; minimal-prime quotients in the latter are O[[u]], O[[v]] | Reducible auxiliary factors stay visible | Repaired component Check |
| §2.1 geometric-integrality boundary | A=O[[x]]/(x²−ϖ); a²=ϖ in O′ | Before extension Min(A) has size 1; after extension (x−a)(x+a)=0 and Min has size 2 | Domain does not imply geometric integrality | Added the counterexample |
| §2.2 character-root theorem | d=1; d=p; p=2 with ψ(γ)=3 | η=ψ for d=1; b^p=1+p gives both sides 1+p; b²=3 gives both sides 3 over ℚ_2(√3) | Allows p dividing d and ramified coefficients | Preserved unrestricted theorem |
| §2.2 torsion hypothesis | Order-two torsion t over ℚ_3; ψ(t)=−1; d=2 | A homomorphism requires η(t)²=η(t²)=1, but ψ(t)=−1 | No root on this torsion character | Added concrete negative control |
| §2.3 central-character theorem | ψ=1,d=1,2 | d(d−1)/2=0,1; δ=1 in rank one and δ(2)=2 in rank two | Rank-one triviality alone cannot test the normalization | Added rank-two witness |
| §3.1 capture definition | H=1,M=O; empty family; M=O/ϖ | Common kernels 0, O, O/ϖ respectively; empty family on M=0 has kernel 0 | Characteristic-zero maps lose torsion | Imported definition, retained Checks |
| Imported quotient characterization | H=1,M=O, test inclusion O→L; quotient O→O/ϖ | Inclusion kernel=0; Hom(O/ϖ,L)=0 but Hom(O,L)=L | Proper quotient does not preserve the testing Hom | Kept in parent contract |
| Imported evaluation characterization | H=1,M=O,V=L | Evaluation L⊗L→L sends 1⊗1 to 1 and is onto; the zero family gives image 0 | Dense evaluation detects the same common kernel | Kept in parent contract |
| Imported captured-implies-torsion-free | M=O×O/ϖ | Common kernel of all characteristic-zero tests contains 0×O/ϖ≠0 | Product with a torsion factor fails capture | Kept in parent contract |
| Imported product equivalence | Product O×O versus O×O/ϖ | Coordinate tests on O² have common kernel 0; on O×O/ϖ it is 0×O/ϖ | Both directions discriminate factors | Kept in parent contract |
| Imported projective/regular equivalence | H=1, regular module O, projective O^I | Each coordinate inclusion detects its coordinate, intersection=0; empty product=0 also has kernel 0 | Positive and zero products obey the contract | gap:projective-products |
| Imported coefficient-field interface | O→O′ finite; map O→L | Base-changed inclusion O′→L′ has kernel 0=0⊗O′; zero map has kernel O′=O⊗O′ | Finite flat coefficient change preserves these kernels | Kept in parent contract |
| Imported algebraic capture | Split trivial group; M=O | Its one rational simple L detects O with common kernel 0 | Tests the group-scheme degeneration | gap:algebraic-capture |
| Imported nonzero tensor stability | Regular module, W of dimensions 0,1,2 | Untwisting gives 0, one regular copy, two regular copies; W=0 has common kernel M, not 0 | Positive rank is essential | Kept W≠0 in every consumer |
| Untwisting action direction | Nonabelian H, map [g]⊗v↦[g]⊗g⁻¹v | Acting by h then untwisting gives [hg]⊗g⁻¹v, equal to untwisting then acting on first factor | Wrong inverse fails the equality | Source argument retained |
| §3.1 endomorphism/scalar consequence | Identity test on O; R=ℤ/4 acting on ℤ/2 | Identity test kills u only when u(m)=0; scalar 2 acts as 0 on ℤ/2 but 2≠0 in R | Faithfulness is needed only for zero scalar | Single prose consequence |
| §3.1 equivariance boundary | Cyclic H of order prime to p, nontrivial χ, M=O(χ), V=L trivial | Equivariance gives (χ(h)−1)f(1)=0, hence f=0 over L; common kernel=M | A wrong trivial representation cannot capture a different character | Retained character non-example |
| §3.2 testing-module definition | M=O[[H]], Θ=O; V=0; M=O/ϖ | Tests O,0,0 respectively; rational tests L,0,0 | Augmentation is normalized and torsion is lost | One construction/API |
| §3.2 lattice independence | Θ=O and Θ′=ϖO | Integral comparison multiplication by ϖ; after inverting p it is a unit and both tests identify with L | Integral lattices need not coincide | Retained homothety Check |
| §3.2 dual-Hom API | M=O[[H]], V=L trivial | Test rational dual=L; equivariant maps L→C(H,L) are constants=L | Both sides have dimension 1 | Comparison stated once |
| §3.2 finite-sum API | V=L⊕L and regular M | Test O²; dual Hom dimension=2=1+1 | Zero and direct sums agree | Retained API |
| §3.2 scalar-action API | M=O, trivial H, scalar a=ϖ | Action on the test sends 1↦ϖ; precomposed inclusion sends 1↦ϖ; a=0 gives 0 on both | Tests the precomposition direction | Retained API |
| §3.2 open-induction API | M=O[[K]], index n=2, dim V=1; n=1 | Both Hom dimensions=2·1=2; identity index gives r=r | Forgetting cosets would give 1 instead of 2 | Replaced boilerplate Check |
| §3.2 fibre criterion | R∞=O[[t]], M=R∞ with trivial H, V=L | At t=0 the test fibre=L and Hom=L, both nonzero; for V=0 both are 0 | Nonzero-fibre condition has both outcomes | Retained API |
| §3.2 parent-type agreement | H=K, same lattice Θ for πalg⊗σ(τ) | Both constructions are (Hom(M∞,Θ^d))^d; for d=1, trivial type and regular model both give O | Identical construction on the imported domain | Exact parent §5.2 import |
| §3.3 smooth-family capture | Principal family at d=2; d=1 | q^(2n)·(q^n)²=q^(4n); at d=1, q^n·1²=q^n | Matches the subgroup-index growth exponent | Added growth computation |
| §3.3 distinct-class and tensor hypotheses | Repeat the trivial character; tensor with W=0 | Distinct classes=1, fixed-vector dimension=1, not q^n; W=0 gives total dimension 0 | Multiplicity is not new classes; zero tensors do not capture | Added controls |
| §3.3 filtration hypothesis | H=ℤ_p², M=k[[ℤ_p]], H_n=p^nℤ_p⊕p^(2n)ℤ_p | Coinvariant dimension=p^(2n), subgroup index=p^(3n), dimension-ratio prediction=p^(3n/2) | An arbitrary anisotropic basis gives the wrong exponent | Made the power-compatible hypothesis explicit |
| §3.4 fixed-centre evaluation | Trivial reductive group, Π=L,T=L^r, r>0; T=0 | e₁*⊗e₁ maps to 1; for T=0 image=0≠L; Π=0 has image=target=0 | Requires T≠0, permits zero target | Widened T to continuous |
| §3.4 analytic-to-Banach bridge | H=PGL₂(ℤ₂), Π=C(H,L) | Quotient PGL₂(𝔽₂)=S₃ has 6 elements, giving 6 independent indicator functions; finer coset truncation errors tend uniformly to 0 | Nonabelian, dyadic analytic density is covered by the generic supplier | Repointed to §0.1 |
| §3.5 fixed-centre projective detection | d=1, M=O(δ⁻¹) | ξ=δ has ξ*=δ⁻¹, so identity gives a nonzero one-dimensional Hom | Central dual sign agrees with §2.3 | Retained theorem |
| §3.5 prescribed-centre API | d=2,n=1,−1,−3 | Highest weights (1,0),(0,−1),(0,−3) are dominant and sum to 1,−1,−3; det^m has sum 2m | Negative weights require reversed placement | Corrected the proposed repair |
| §4.1 component-through-point theorem | L[x,y]/(xy), points (1,0),(0,0) | First point lies only on (y); origin lies on both; whole support lies in neither individual axis | Select one component through y | Preserved the corrected argument |
| §4.1 determinant-torsion uniqueness | Distinct p-power characters χ,χ′ at a root ζ | χ(ζ)−χ′(ζ)≠0 in L but reduces to 0 in k | Generic point distinguishes χ; special point cannot | Retained characteristic-zero requirement |
| §4.2 local-faithfulness theorem | R=O[[u,v]]/(uv); nonreduced model O[[x]]/(x²) | In the reduced model (u)∩(v)=0; in the second model all minimal primes intersect in (x)≠0 | Component detection needs reducedness for zero annihilator | Explicit negative control |
| §4.2 local versus patched scope | Two χ and two auxiliary primes; supported pairs (χ,𝔭₁) | 2 local components met, only 2 of 4 patched components met | Local coverage does not assert full patched coverage | Retained throughout |
| §5.1 reducedness hypothesis | B=O[[x]]/(x²) | Every field point sends x↦0, but x≠0 and x²=0 | Vanishing at points gives only a radical without reducedness | Added Check |
| §5.1 flatness hypothesis | B=O[[x]]/(ϖx) | x≠0, ϖx=0, and x/1=0 in B[1/p] | Reducedness alone does not detect integral elements | Added Check |
| §5.1 zero test | N=0 | Ann N=R∞; quotient=0; Spec(0)=∅; vanishing ideal in the zero ring=0=1 | Empty support causes no false nonemptiness | Retained zero-ring convention |
| §5.1 density conclusion and nonfaithful variant | R=O, M=O; R′=O[[x]], M=R′/(x) | Faithful case: vanishing ideal=0, closure=Spec O; nonfaithful case: Ann M=(x), closure=V(x) | Equality uses the stated containment in V(Ann M) | Kept general variant explicitly |
| §5.2 crystalline density | Rank-one F=ℚ_5, algebraic exponent n=0,4 | On unit generator 6, coordinates 6^0−1=0 and 6^4−1=1295; exponents 4·5^j give distinct coordinates tending to 0 | Varying weights give nonconstant tests compatible with residual units | Retained varying-weight theorem |
| §5.3 fixed-weight principal density | Rank one, finite-order 5-power twists | Order-dividing 5^n characters number 5^n; v_5(ζ_5−1)=1/4, v_5(ζ_25−1)=1/20 | Conductors vary while algebraic weight stays fixed; torsion points approach the rigid boundary | Kept scheme-spectrum conclusion |
| §5.4 unramified supercuspidal density | d=1; unramified quadratic E/ℚ_5 | d=1 gives induction dimension 1; d=2 gives dimension 2, e=1 and exponents 1≠5 mod 24 | Tame recognition applies to the whole unramified family | Removed wild-density suggestion |
| §6.1 benign density | d=1; d=2,f=1,eigenvalues 1,p | Rank-one pair conditions have 0 pairs; rank two has ratio p, expressly excluded | Regularity alone does not define benignness | Imported parent predicate/open locus |
| Imported benign component locus | Repeated-eigenvalue Jordan φ with α²=p and weights 0,1 | Total t_N=1=t_H; invariant eigenline has t_N=1/2≥t_H=0, but eigenvalue discriminant=0 | A weakly admissible regular point can fail benignness | Parent owns the geometry |
| §6.2 type-support definition | W=0; nonzero σ(τ) | W=0: J=R,C=∅; σ(τ) with capture: J=Ann_R M∞=0,C=X□ | Distinguishes a zero test from an inertial type | Full support is automatic |
| §6.2 radical/p-saturated API | R=O[[t]], quotient R/(t) | If a^m∈(t), then a(0)^m=0 in O implies a(0)=0; if ϖa∈(t), ϖa(0)=0 gives a(0)=0 | Reduced O-flat quotient gives both laws | Retained API with hypotheses |
| §6.2 recognition API | Rank-one smooth characters τ,τ′ | Hom(τ,τ)=L of dimension 1; for τ′≠τ, equivariance forces Hom(τ,τ′)=0 | Wrong inertia is excluded; rank one has N=0 | gap:crystalline-inertial-types |
| §6.2 vanishing-ideal API | Single model quotient R/(t), R=O[[t]] | Generic O-point contracts to (t), so both intersection of point kernels and test annihilator equal (t) | Integral point contract supplies equality | Retained API |
| §6.2 full-support API | Every σ(τ) nonzero; W=0 control | Capturing family gives intersection Ann=0; zero family gives intersection Ann=R | No separate certificate remains for a genuine τ | Applied throughout §6.2 |
| §6.2 single-test API | Rank-one trivial type, weight 0 | Weight coordinate T=0 cuts out ideal (T)≠0; varying all weights gives J=0 | One weight does not cover the full space | Retained negative control |
| §6.3 prescribed-type density | F=ℚ_5(ζ_5),d=1; residual-compatible exponents n=0,4,8,12,16 | Restrictions on ζ_5 are powers with exponents 0,4,3,2,1, all five components; multiplying by fixed τ permutes them | Fixed inertia with varying weights meets every torsion component | Replaced conditional theorem |
| §6.4 minimal-element definition | Totally ramified E; unramified E | Uniformizer v_E=1 and gcd(e,1)=1; inverse v_E=−1; unramified α=ϖ_F^(−n)ξ has e=1 and generating residue ξ̄ | Positive and negative minimal elements exist in these cases | Retained general definition |
| §6.4 conjugation API | Replace embedding by gEg⁻¹ | Stratum field dimension remains d; f↦π(g)f transports occurrence Hom with inverse π(g⁻¹) | Same occurrence predicate in both directions | Kept conjugacy invariance |
| §6.4 potentially crystalline API | Irreducible rank-two WD; Steinberg WD | An intertwining N on irreducible Weil r has invariant kernel; nilpotence forces N=0. Steinberg instead has rank N=1 | Supercuspidal predicate excludes the N≠0 countermodel | Retained N=0 conclusion |
| §6.4 type-detection API | Rank-one E=F, simple character θ | A character ψ contains θ exactly when ψ on the type subgroup equals θ: Hom dimension 1 versus 0 | Tests both directions of occurrence | gap:minimal-stratum-types |
| §6.4 tame-induction API | E/ℚ_5 ramified quadratic, α uniformizer | e=2, p=5; θ and ψ coincide on U_E^{m+1} in the recognized family; choosing a distinct restriction gives Hom=0 | Explicit character restriction cannot be dropped | Included in §6.5 theorem |
| §6.4 coefficient-extension API | Finite field extension of a one-dimensional θ-space | dim_L Hom=1 or 0 becomes dim_L′ Hom=1 or 0 respectively | Scalar extension preserves occurrence/nonoccurrence | Retained API |
| §6.4 no-minimal-element Check | F=ℚ_5,e(E/F)=6,f(E/F)=2 | 𝔽₂₅× has order 24; sixth-power image has order 24/6=4 and equals {(1,0),(2,0),(3,0),(4,0)}=𝔽₅× in 𝔽₅[t]/(t²−2) | Its residues cannot generate 𝔽₂₅/𝔽₅ | Recomputed EP’s obstruction |
| §6.4 wild Check | E=ℚ_3(3^(1/3)) | e=3,f(E/F)=1; gcd(3,1)=1 and residue degree 1, so the uniformizer is minimal; 3 divides 2d=6 | Definition includes it, density excludes it | Explicit range boundary |
| §6.5 minimal-stratum density | p=5,d=2,E=ℚ_5(√5); p=3,d=3; degree-12 obstruction | 5∤4 and e=2 is tame; 3 divides 6 in the wild case; 5∤24 but sixth-power residues have degree 1, not 2 | Prime range and minimal-element condition are independent restrictions | Corrected every density occurrence |
| gap:framed-ring-components | Rank-one F=ℚ_p and F containing μ_p | Component counts 1 and p after splitting; each rank-one quotient is a power-series domain | Matches determinant-torsion labels, without restricting to d=1 | Real supplier named |
| gap:principal-series-types | d=1 | Vχ has dimension 1; occurrence in ψ is 1-dimensional iff ψ restricted to H equals χ, otherwise 0 | Matches EP Proposition 3.7 | Separate contract |
| gap:minimal-stratum-types | n odd/even in EP’s Heisenberg formula | Odd n gives dim η=1; even n gives (dim η)²=[J:H], rather than always 1 | Does not replace the type with a bare character | Separate contract |
| gap:projective-products | H=1, projective O^I; fixed trivial centre | Regular quotient=O; nonempty product has a nonzero coordinate O; empty product=0 | Both categorical versions have the right degeneration | Separate contract |
| gap:completed-tensor-reduced-equidimensional | O[[x]] and O[[y]]; one factor O | Tensor=O[[x,y]], dimension 2+2−1=3; O⊗̂A=A, dimension 1+dim A−1=dim A | Unit and dimension offset agree | Separate tensor contract |
| gap:geometric-component-splitting | O[√ϖ] and O′=O[√ϖ] | Min count grows 1→2; the two minimal-prime quotients after extension are O′, each remaining a domain after further extension | Cannot assume a domain was already geometric | Separate splitting contract |
| gap:pd-crystalline-lift | d=1,p=2 | Trivial residual character has a crystalline lift of weight 0, one diagonal summand; 2 divides 2d | General lift theorem does not inherit the patched prime exclusion | Upstream target still required |
| gap:continuous-finite-index-induction | Index 2, one-dimensional V; identity index | Both adjunction Hom dimensions 2=2; identity gives 1=1 | Smooth adjunction alone does not specify the continuous topology | Missing LR.0 contract remains |
| Corrected BIP Lemma 6.5 step | κ(5)=[2] unramified over ℚ_5 | Printed algebraic-on-units character gives ψ(5)=1, reduction 1≠2; corrected unramified factor gives [2], reduction 2=κ̄(5) | Torsion matching did not fix the unramified factor | Worked example retained |
| Corrected BIP support-containment step | Two axes in L[x,y]/(xy) | Whole support intersects both axes; point (1,0) lies on exactly one | Union-of-components conclusion does not imply whole-test containment | Worked example retained |
| Corrected EP tensor step | H=1,M=O,W=0, quotient Q=0 | M⊗W=Q⊗W=0, yet M≠Q; tensor tests have kernel O | Freeness of a rank-zero lattice cannot detect a quotient | Worked example retained |

The new numerical witnesses were recomputed directly, including the dual-weight tuples, negative central exponents, 2 versus 1/2, induction dimensions and the sixth powers in 𝔽₂₅. The table also rechecks unchanged target formulas and the API assertions affected by the ownership and scope repairs. There is no unsupported statement about all wildly ramified degree-d density in the patched range, no empty type standing for σ(τ), and no generic-field argument that forgets reducedness or O-flatness.

## Consequences for maintainers

All ten supplier additions remain visible in the top-level gaps list. In particular, F03 and F17 cannot be completed by a second decision inside this package: ModularityAndLanglandsExtensions §2.1 and the parent §5.3 need their owners’ additions. The continuous induction supplier also remains a packaging prerequisite. Parent globalisation contracts were retained, not replaced by a source citation or an anonymous gap.

No Lean declaration name changed. The design’s former explorer identifiers were replaced by README section locators. The principal endpoints map as follows: PD.3/local-faithfulness → §4.2; PD.4/crystalline-density, principal-series-density and unramified-supercuspidal-density → §§5.2–5.4; PD.5/benign-density, prescribed-type-density and minimal-stratum-density → §§6.1, 6.3 and 6.5. PD.2/testing-comparisons is absorbed into §3.2’s API; capture-duality-and-projectives and algebraic-capture are imported through parent §5.3; benign-points and benign-open are imported through parent §5.2a. No read consumer cited the deleted explorer targets. The local-faithfulness/density direction is unchanged.

No suspicious instruction-like material was followed, no other roadmap or tooling was edited, and no commit, push or external write was made.
