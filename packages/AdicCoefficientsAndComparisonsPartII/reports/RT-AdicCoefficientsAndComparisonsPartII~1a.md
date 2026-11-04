<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1109#issuecomment-6440410106 -->
Red team round 1 pass a (codex) of 74a0736

Verdict: needs_changes

1. **F01** (P2) The component reduction is not generically an isomorphism to a nonreduced scheme

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:407, “an isomorphism over the dense open complement of the pairwise intersections”.

   **Claim:** The disjoint union of reduced components maps isomorphically to Y away from component intersections.

   **Witness:** Take Y = Spec k[x,y,ε]/(ε²), S = Y and the identity alteration. There is one component and no pairwise intersection; the asserted isomorphism is Spec k[x,y] → Y, whose kernel is (ε) ≠ 0.

   **Exact repair text:** “The disjoint union of the reduced components maps finitely to Y, has residue degree 1 at each maximal point, and is an isomorphism over the complement of the pairwise intersections in Y_red.” For this example Y_red = Spec k[x,y], so the corrected comparison is the identity; the alteration to Y still has degree 1.

2. **F02** (P2) The field example drops the altered base field

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1460, “X′ smooth with relative snc boundary”.

   **Claim:** Over any field k, PA.6.5(i) produces X′ log smooth, hence smooth, over k itself.

   **Witness:** Let k = F_p(t), X = Spec k(t^(1/p)), Z = ∅. Any nonempty X′ mapping to X has the inseparable constant t^(1/p); its base change to an algebraic closure of k is nonreduced, so X′ cannot be smooth over k.

   **Exact repair text:** “For S = Spec k and X a variety, (i) gives X′ smooth with relative snc boundary over each field component k′ of S′. If k is perfect, (iii) permits S′ = Spec k.” On the witness take k′ = k(t^(1/p)) and X′ = Spec k′; the map to X has degree 1 and X′ is smooth over k′.

3. **F03** (P2) Analytic uniformization is statable on native normed fields

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/Suggested.lean:41, “the type of a one-dimensional analytic field ... [is] absent”.

   **Claim:** None of PA.5.2b can be stated using a few simple definitions at the pins.

   **Witness:** Mathlib/Topology/Algebra/Valued/NormedValued.lean:47 defines NormedField.valuation; Mathlib/Topology/Algebra/Field.lean:60 defines Subfield.topologicalClosure. Complete nontrivially normed ultrametric fields, finite-dimensional extensions and Algebra.Etale already exist. These state the complete analytic-field theorem PA.5.2b(ii).

   **Exact repair text:** “State PA.5.2b(ii), analytic uniformization and its stability under small perturbations, on complete nontrivially normed ultrametric fields k and K, with k algebraically closed and the specified inclusion k → K isometric. Define H(x) as the topological closure of (IntermediateField.adjoin k {x}).toSubfield. Define finite unramifiedness of K/H by finite dimensionality and étaleness of H° → K°, where K° is NormedField.valuation.integer and H° its inverse image in H. For K finite over H(y), assert an x with K/H(x) finite unramified, a positive ε for which every x′ with norm(x−x′)<ε has that property, and, when K̃≠k̃, that every x∈K° with transcendental residue and K̃/k̃(x̃) separable has K/H(x) finite unramified. Keep only the genuinely missing general-valued/model portions in the module's non-statability list.” These are native fields and valuation rings, not replacement geometric carriers. On the radius-one Gauss field over algebraically closed k, H(T)=K, degree=1 and the integer-ring map is the identity; the analytic theorem covers types 2, 3 and 4. No elaboration was run, as required by this read-only pass.

4. **F04** (P2) The stable-modification proof skips zero-dimensional and disconnected fibres

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1166, “The reduced fibre Z over x is a proper connected semistable curve”.

   **Claim:** Every fibre considered in the ampleness argument is connected and one-dimensional.

   **Witness:** For the identity modification of A¹_k, the fibre at 0 is Spec k, of dimension 0. For the normalization of V(xy), the fibre at the node consists of two points. temkin10 lines 119–123 explicitly separate these cases.

   **Exact repair text:** “The reduced fibre is proper. Treat its connected components separately; zero-dimensional components impose no positivity condition because every invertible sheaf on them is ample. A one-dimensional connected component is a proper connected semistable curve; apply the pointed stability criterion to it with its induced markings and attaching points.” On the identity the point fibre is handled immediately, and on the normalization both point fibres are handled separately; neither is asserted to be a curve.

5. **F05** (P1) The fan-resolution proof omits its characteristic-zero supplier

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1020, “characteristic-zero functorial resolution of toric varieties”.

   **Claim:** The inputs listed for PA.4.3 suffice to construct its functorial fan resolution.

   **Witness:** ilo14 lines 4849–4853 assume an existing functorial fan desingularization; lines 4071–4099 obtain it using regular-functorial characteristic-zero resolution. TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:968 and :982 already own precisely that geometric input.

   **Exact repair text:** “Consume ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6, qeResolution and qeResolution_regularFunctorial, on reduced noetherian quasi-excellent Q-schemes. Restrict this supplied tower to toric schemes, normalize it, and construct the fan and log-scheme comparisons here as in ILO VIII §§2.3 and 3.” Add this supplier to the exact contracts and PA.4.3 Needs and dependencies. It is earlier in merge-order/ORDER.txt (6 versus 122). On Spec Q[u,v,w]/(uw−v²), its singular vertex is resolved; on the regular torus the supplied tower is empty. The missing input is thus furnished without replanning characteristic-zero resolution.

6. **F06** (P1) The claimed normalization exports exceed the pinned API

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:51, “includes normality, the marked function-field identification”.

   **Claim:** The Mathlib contract supplies those geometric theorems for Nor_L(X).

   **Witness:** Mathlib/AlgebraicGeometry/Normalization.lean:344–355 exports reducedness and integrality, not normality or a function-field identification. Its affine comparison is at :215. TauCetiRoadmap/SchemeAndStackFoundations/README.md:1335 supplies finiteness only.

   **Exact repair text:** “Mathlib supplies the relative-normalization carrier, affine integral-closure comparison, universal property and smooth base change. What SchemeAndStackFoundations must provide (gap:normalization-finite-field-identification): For an integral scheme X and a finite field extension L/k(X), the native relative normalization of Spec L → X is normal, and its canonical map Spec L → Nor_L(X) identifies L with its function field, compatibly with the given embedding of k(X).” Add that same gap to plan.json under supplier SchemeAndStackFoundations §0.20. Cite normalizationDesc and normalization.hom_ext for the induced maps, explicitly derive the normal-base identity from this contract and the affine comparison, and remove the claim that the missing results already exist at the pin. For the cusp and L=k(t), the required function field is k(t) and the normal ring is k[t]; merely knowing that the normalization is integral does not establish either identification.

7. **F07** (P2) The log-pair definition calls its supplier outside the declared domain

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:948, “Z ⊆ X closed”.

   **Claim:** gap:closed-subset-log-structure constructs the log structure used in this definition for every closed Z.

   **Witness:** The contract at README.md:93 requires Z nowhere dense. For X=Spec F₂ and Z=X, the definition requests that carrier with U=∅, although Z is dense. This input is outside the declared contract.

   **Exact repair text:** “A pair (X,Z), with X reduced locally noetherian and Z closed, is log regular if Z is nowhere dense and the log structure supplied by gap:closed-subset-log-structure is fs and log regular, with nontriviality locus exactly Z.” Build the carrier only after the nowhere-dense proof. This preserves the intended class, since the theorem already asserts density of the triviality locus. The witness now has predicate false before any out-of-domain supplier call; the axes in A² remain admitted with characteristic monoid N².

8. **F08** (P3) The preparation lemma leaves its cyclotomic exponent undefined

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1051, “Λ = Z[1/N, μ_N]”.

   **Claim:** This specifies the coefficient ring and character pairing for Gabber's preparation lemma.

   **Witness:** N has no definition in the section or conventions. ilo14 line 6155 specifies N as the exponent of G. For G=C₃ it is 3; for the trivial group it is 1.

   **Exact repair text:** “Put N=exponent(G), μ_N the complex N-th roots of unity, and Λ=Z[1/N,μ_N].” Insert this before the chart and pairing. The two instances give Z[1/3,ζ₃] and Z respectively, rather than an undetermined coefficient ring.

9. **F09** (P2) The threefold proof calls a locally closed subset closed

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:426, “a union of two nowhere dense closed subsets”.

   **Claim:** The preimage of Z∩Reg(Y_red) is closed in Y₁.

   **Witness:** Take Y=Spec k[u,v,w,t]/(uw−v²) and Z=V(v,w). Its intersection with Reg(Y) is Z∖V(u,v,w); its closure meets the singular line, so its inverse image under a proper resolution is not closed.

   **Exact repair text:** “The reduced inverse image D of Z is closed. Every maximal point of Y₁ maps to a maximal point of Y_red, and Z contains none; therefore D is nowhere dense, hence has dimension at most two.” On the witness D includes the exceptional specialization points; it remains a proper closed subset of every component. This gives the needed conclusion without the false closedness assertion.

10. **F10** (P3) Four groups of extraction locators point to different sections

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:186, :250, :465, :523, :633 and :1043 (ILO and Temkin references).

   **Claim:** The attached extraction line numbers locate the named sections.

   **Witness:** ilo14 lines 1150, 6790 and 7194 locate II §1.1, X Theorem 2.1 and X Theorem 3.1.5 respectively. temkin10 line 665 precedes §3.2; that section starts at line 679.

   **Exact repair text:** At PA.0.2 cite “ilo14, II Definition 1.1.2, line 1158; X §2 opening paragraph, p. 148, lines 6782–6787”. At PA.0.4 attach line 6783 to X §2 and line 7288 to X §3.3.1. At PA.4.4 attach line 3705 to VIII §1.2, retaining line 7194 for X Theorem 3.1.5. At PA.1.1, PA.1.3 and PA.1.8 change the §3.2 extraction anchor from temkin10 line 665 to line 679. Each replacement was read at the stated location.

11. **F11** (P2) The arithmetic projection lacks a trivialized target bundle

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1589, “Projection from L is finite”.

   **Claim:** A point of the stated Grassmannian supplies the asserted projection to P^d over the base.

   **Witness:** Over R=Z[√−5], let I=(2,1+√−5). The quotient E=R⊕I of R³ has nonsquare determinant class in Cl(R)=C₂. Projection from its kernel lands in P(E), which is not P¹_R.

   **Exact repair text:** “Use the open subscheme of full-rank (d+1)×(N+1) matrices whose kernel misses X and the tangent spaces at the sections. Its fibres are nonempty open subsets of affine matrix spaces, hence geometrically irreducible. Rumely supplies such a matrix over a finite base extension. Its specified surjection O^(N+1) → O^(d+1) defines the projection to P^d.” Continue with the existing finiteness and étaleness arguments. For the witness the nontrivial quotient R⊕I is not a framed quotient to R², so the unsupported identification is never used. For N=d the identity matrix gives the stated empty-centre example. This changes the parameter space, not the generality of the theorem.

## Verified sound

Read all 1,642 README lines and all 80 Suggested.lean lines, and the content repository's README.md and CONTRIBUTING.md. The inventory is 64 numbered targets, six separately defined analytic notions, and the boundary Picard theorem: 71 target/definition entries, with the PA.5.2a umbrella counted separately. All 174 explicit Check bullets were evaluated; the computed record below groups them by their target and includes additional negative controls. These tests do not certify proofs of the general theorems.

Suggested.lean has zero declarations, zero definitions, zero instances, zero section variables and zero admitted data. There are no elaborated signatures to compare, no duplicate fully qualified declaration names, and no padding declarations to delete. Its sole import is Mathlib. Its 30 headline groups account for the major geometric results; R03 identifies a statable portion omitted from that list's proposed acceptance test. The other listed missing geometric carriers were not found at the supplied pins.

The headline inventory is: PA.0.6–0.7 flattening and non-separated Chow; PA.0.10–0.12 low-dimensional universal resolution; PA.1.4 and PA.1.6 pointed Riemann–Zariski compactness and openness; PA.2.5–2.6 and PA.3.6–3.7 field and scheme tame distillation, including separable variants; PA.4.2–4.6 monoidal blow-ups, functorial resolution, Gabber modification and preparation; PA.5.2 stable-modification projectivity, PA.5.2b uniformization, PA.5.3–5.4 existence/uniqueness/equivariance, and PA.5.6 relative-curve resolution; PA.6.1–6.6 desingularization and residue-characteristic refinements; PA.6.7–6.10 prime-to-ℓ and odd-degree alterations; PA.6.11 equivariant alterations; PA.6.11a Rumely and boundary Picard torsion; PA.6.11b sections/projections; and PA.6.12 arithmetic semistable alteration. The degree-comparison interface PA.5.5a is recorded separately in the computed table; its scheme-normalization and geometric-integrality interfaces still require suppliers.

Supplier verification resolved eight roadmap contracts, counting the base roadmap: SchemeAndStackFoundations, StableReduction and EtaleCohomologyFoundations on main; CrystallineCohomology, LefschetzPencilsAndVanishingCycles, ClassicalAdicEtaleCohomology and AdicCoefficientsAndComparisons at their available new-roadmap heads; and LocalFieldsRamificationPartII against its board design (limitation below). Pinned library claims were checked against Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The extra characteristic-zero supplier located for R05 precedes this package.

The five declared gap slugs agree between design/plan.json and the README, with named suppliers and explicit hypotheses: finite-type-fp-factorization, maximal-separable-p-extension, closed-subset-log-structure, very-tame-local-quotient and log-blowup-universal-property. Their absence from current supplier implementations is not a finding. R07 concerns an out-of-domain use, not the existence of the declared log-structure gap.

Ownership searches covered main, Completed, board packages and the 55 supplied sibling heads (110 README/Lean files), using both the roadmap search service and object searches in those files. The existing affine model limit, proper flattening, separated Chow, ordinary divisor carrier, proper stable-curve theory and separated Gabber results are consumed rather than assigned second owners here. Two ownership decisions need preserving: the excellent surface theorem at TauCetiRoadmap/EllipticKTheory/README.md:1951 is later in the merge order (165 versus 122), so its excellent specialization should consume the more general quasi-excellent surface result owned here; it must not become an upward dependency. The normalization of P¹ over a Dedekind base in RelativeJacobiansAndIntegralCurveModels §0.3 is narrower than R06's general integral-scheme contract. The search index also places an integral-point application in the later PotentialModularityAndCompatibleSystems; the general Rumely theorem belongs at this earlier supplier, not in a new reverse edge.

The recorded mechanical dependency check, run without changing the package, returned exactly:

```text
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not detect R05's omitted supplier edge. The checked HEAD is 74a0736. The requested origin/main...HEAD diff contains only this package's folder (10 files; 3,215 insertions and 8 deletions). No package implementation, manifest, order file or source was edited during this pass. No Lean build or elaboration was run.

The source audit used the ten cached legal works and the Stacks volumes under its existing manifest key. The following catalogue counts locator groups rather than repeated mentions or every line of a proof; the four incorrect extraction-pointer groups are R10. Each anchor below was read, including its relevant hypotheses.

82 locator groups were checked in this catalogue. R10 records incorrect pointers to four groups; their replacement anchors are included below.

| Source | Groups | Locators and extraction anchors |
|---|---:|---|
| temkin17 | 19 | temkin17 §1.2.1, line 71; temkin17 Theorem 1.2.5, line 108; temkin17 §1.2.7, lines 119–146; temkin17 Theorem 1.2.9, line 149; temkin17 §2.1.1, line 249; temkin17 §§3.1.1–3.1.2, lines 645–666; temkin17 Lemma 3.1.3, line 667; temkin17 §3.1.5, line 686; temkin17 Lemma 3.1.6, line 707; temkin17 §3.1.7, line 760; temkin17 §§3.2.1–3.2.9, lines 770–816; temkin17 Lemma 3.2.10, lines 817–845; temkin17 Theorem 3.2.12, lines 858–875; temkin17 §§3.3.1–3.3.4, lines 884–930; temkin17 §3.3.5 and Theorem 3.3.6, lines 931–958; temkin17 Lemma 3.3.7, line 960; temkin17 §4.1, line 970; temkin17 Theorem 4.2.1 and proof, lines 999–1075; temkin17 Theorem 4.3.1 and §§4.3.2–4.3.3, lines 1078–1140 |
| ilo14 | 21 | ilo14 II Definition 1.1.2, line 1158; ilo14 VI §§1.1–1.5, lines 3045–3120; ilo14 VI §1.6, line 3126; ilo14 VI Theorem 3.2 and Corollary 3.3, lines 3279–3305; ilo14 VI Proposition 3.5 and Corollary 3.6, lines 3306–3338; ilo14 VIII Theorem 1.1 and §1.2, lines 3681–3735; ilo14 VIII §2.3, lines 4040–4142; ilo14 VIII §§3.3.7–3.3.11, line 4761; ilo14 VIII §3.4, lines 4840–4978; ilo14 VIII Theorem 5.6.1(ii), line 5863; ilo14 X Theorem 1.1, line 6117; ilo14 X §1.2, lines 6140–6235; ilo14 X §2 opening and Theorem 2.1, lines 6782–6815; ilo14 X Theorem 2.4, lines 6985–7035; ilo14 X §2.6, lines 7085–7140; ilo14 X §§3.1.1–3.1.5, lines 7160–7222; ilo14 X §§3.1.6–3.1.9, lines 7223–7270; ilo14 X §3.2, lines 7271–7287; ilo14 X §3.3, lines 7288–7344; ilo14 X Theorem 3.4 and proof, lines 7345–7425; ilo14 X Theorem 3.5 and proof, lines 7486–7720 |
| temkin10 | 12 | temkin10 §1.2 and Theorem 1.1, lines 57–123; temkin10 Theorem 1.2, Corollary 1.3 and Theorem 1.5, lines 124–155; temkin10 Corollary 1.6, line 156; temkin10 §2.1 definitions, lines 313–355; temkin10 Theorems 2.1.8 and 2.1.10, lines 445–489; temkin10 §2.2 proof, line 550; temkin10 §3.2, lines 679–754; temkin10 §6.1, lines 1746–1805; temkin10 Corollary 6.1.6 and §6.2, lines 1990–2045; temkin10 §6.2 type-4 discs, lines 2058–2078; temkin10 Theorem 6.3.1, line 2339; temkin10 proof of Theorem 2.1.10, lines 2487–2512 |
| dejong96 | 4 | dejong96 §7.1, line 1406; dejong96 §7.2 and Theorem 7.3, lines 1412–1470; dejong96 §8.1 and Theorem 8.2, lines 1545–1570; dejong96 §§8.5–8.8, lines 1571–1611 |
| cp19 | 2 | cp19 Theorem 1.1, lines 93–108; cp19 Corollary 1.2 and Remark 1.4, lines 111–132 |
| cjs | 3 | cjs Theorem 0.1, lines 35–54; cjs Theorem 0.3, lines 77–117; cjs Corollary 0.4, lines 131–142 |
| dp23 | 1 | dp23 proof of Proposition 3.4, lines 364–416 |
| jannsen16 | 1 | jannsen16 Theorem 2.11 and application, lines 1044–1088 |
| moretbailly89 | 6 | moretbailly89 §§1.3–1.9, lines 42–91; moretbailly89 §§1.10–1.11, lines 95–117; moretbailly89 §§2.1–2.3, lines 175–189; moretbailly89 §§2.4–2.6, lines 192–242; moretbailly89 §3.1, lines 291–321; moretbailly89 Proposition 3.8, lines 400–444 |
| stacks | 13 | stacks Fields 037J, line 1718; stacks Varieties 04KV, line 528; stacks Varieties 020H, line 886; stacks Varieties 0C45, line 4034; stacks Resolution of Surfaces 0BBS, line 488; stacks Resolution of Surfaces 0BGL, line 1752; stacks Resolution of Surfaces 0BGP, line 1880; stacks Resolution of Surfaces 0BI4, line 1918; stacks More on Flatness 0815, line 4197; stacks More on Flatness 081R, line 4250; stacks More on Morphisms 05K0, line 6247; stacks Morphisms 052A, line 2282; stacks Morphisms 0AVK, line 6419 |


The statement table records dimensions, degrees, prime supports, inertia, rank, norm, residue and nilpotent values. A conditional assertion with a false hypothesis is marked excluded, rather than counted as a proof of its conclusion. Boundary cases absent from the carriers, such as a zero field or a non-prime ℓ, are excluded by the stated field/prime hypotheses; the zero ring is tested through the empty scheme. There is no natural subtraction, division or out-of-range index in a Lean declaration because there are no declarations.

| Statement | Context | Instances and computed values | Result/change |
|---|---|---|---|
| Suggested.lean, all declarations | Empty namespace; no section variables or instances | Declaration count = 0, sorry count = 0, def/instance count = 0 | No signature or padding probe applies |
| PA.0.1 | Arbitrary scheme | Q: residue prime set = ∅, all primes units; Z_(2): set = {2}, units exclude 2; Z[1/6]: set = {p ≥ 5}; ∅: set = ∅, global ring zero and all elements units | Both directions of characteristic/unit criterion pass |
| PA.0.2 | Noetherian X,S | G_m→A¹: generic→generic, dense generic fibre; origin→A¹: closed→closed, generic fibre empty; A¹⊔point→A¹: generic fibre misses open point component; ∅→S: empty universal condition true | Pass |
| PA.0.3 | Noetherian X,S | cusp normalization: degree 1, finite surjective; Frobenius A¹_Fp: degree p; P¹→point: generic fibre dimension 1, not finite; A¹⊔point→A¹: vertical maximal point | Pass |
| PA.0.4 | Alterations; P set of primes; ℓ prime | Frobenius p=2,3: degrees 2,3, supports {2},{3}, inseparable; Z[i]/Z: degree 2, separable, ramified at 2; identity degree 1 has support ∅; Q[t²]⊂Q[t]: degree 2 while char(A¹_Q)=∅ | Prime support and separability distinguish all four cases; 0 is excluded |
| PA.0.5 | Finite type, qcqs base | Doubled-origin plane→P² is locally an open immersion but has two origins; blow up one origin: the exceptional valuation has two distinct closed images and obstructs local-isomorphism factorization; identity uses two identity arrows | Quasi-projective equivalence requires separatedness; the stated failure of composition holds |
| PA.0.6 | qcqs S, qc open U; finite type qs, fp and flat over U | X=Bl₀A², U=A²∖{0}: strict transform after the same blow-up is S′, all fibres one point; initially the fibre at 0 is P¹, other fibres points; zero module transforms to zero | Flatness changes false→true; module zero case stays flat/fp |
| PA.0.7 | Finite type qcqs, finitely many generic points | Doubled-origin plane already pseudo-projective: identity modification degree 1; separated affine plane: identity into open A²⊂P²; X=∅ gives empty blow-up and factorization | Separateness not inserted; degrees 1 on existing components |
| PA.0.8 | Regular noetherian ambient scheme | Axes: codimensions 1,1,2; origin alone: codimension 2; irreducible nodal cubic: local component dimension 1, tangent dimension 2; three lines: triple intersection codimension 2≠3; empty boundary: no components | SNC true,false,false,false,true respectively |
| PA.0.9 | Noetherian X, projective/proper alternatives | Spec k: finite Artinian Y reduces to a product of fields, degree 1 each, Z=∅; X=∅: only empty Y; non-Japanese DVR: normalization A′ not finite, hypothetical proper regular model forces A′ finite; P={2}⊂{2,3} admits 2^n in both | Quantifiers and both senses survive; regularity alone fails |
| PA.0.10 | qe, dim≤1 | DVR: normalization identity and a closed point has codimension 1; cusp curve: k[t²,t³]→k[t], fraction fields both k(t), degree 1; finite nonreduced point: reduction field, degree 1 | Projective degree-one resolution; empty boundary allowed |
| PA.0.11 | qe, dim≤2 | Blow up closed point of k[[x,y]]: point codim2 becomes P¹ codim1; A₁ charts k[u,v₁], k[w,v₂], k[v,s,s⁻¹] regular; plane∪axis: degrees (1,1), boundary P¹⊔point; non-Japanese A[z] would force finite A′[z], hence finite A′ | The theorem survives these tests; nonreduced component map fails R01 |
| PA.0.12 | Separated qe, dim≤3; proper sense | Complete affine 3-fold: one affine chart, projective clause applies; doubled zero section in A²_Z: dimension 3, two centres, separation false; regular Y,Z=∅: identity degree 1; singular A₁×A¹ with Z=V(v,w): inverse image of Z∩Reg is not closed | R09 corrects proof; separatedness and proper/projective distinction retained |
| PA.1.1 | qcqs X and specified Spec K→X | Generic point: tight identity; closed F_p-point of Spec Z: identity not tight, Spec F_p→Spec Z proper tight and not surjective; G_m→A¹ not proper; generic-point blow-up of A² proper tight | Pointed properness differs from scheme modification as intended |
| PA.1.2 | Pointed scheme; cofiltered modifications | Spec K: 1 point, stalk K; DVR R: 2 points, stalks R,K; A¹_k: trivial valuation and local DVRs at closed points, infinity omitted; rank-two lex valuation of k(x,y): stalk has rank 2, nonnoetherian | Inverse-limit carrier distinguished from an ordinary noetherian model |
| PA.1.3 | Valuation ring plus extending centre | Q over Z_(p): rings Q,Z_(p); F_p: ring F_p, unique specified centre; P¹_k: finite places plus infinity and trivial valuation; doubled origin: k[t]_(t) has 2 centres | Forget-centre injectivity true for separated cases, false for doubled origin |
| PA.1.4 | qcqs pointed scheme | Point: compact singleton, stalk K; DVR: finite compact two-point limit, valuation stalks R,K; doubled line: 2 distinct centred copies of the t-adic ring | Surjectivity/bijection retain centres; compactness does not assert separation of X |
| PA.1.5 | Compatible pointed maps, K⊂L | Z[i]_(1+i)∩Q=Z_(2); two primes 2±i over5 both give Z_(5); trivial L restricts to K; (O∩L)∩K=O∩K on each element | Arrow direction and tower law agree |
| PA.1.6 | Finite-type Y→X; qcqs | Q(i)/Q over Spec Z: {O:2 is a unit} maps to {Q}∪{Z_(p):p≠2}, open in spectral and patch topologies; identity gives image U=U; point→point gives singleton | Continuity/openness agree; no injectivity inferred |
| PA.1.7 | Field; specified point for centred subset | Val_Q={Q}∪{Z_(p)}; Val_Fq={Fq}; Z[1/p] removes exactly Z_(p); Q(i)/Q fibres: 1 above2, 2 above5; every valuation contains its prime ring | Absolute/relative carriers distinguished |
| PA.1.8 | Schematically dominant A→K | Z⊂Q: both spaces {Q}∪{Z_(p)}; DVR⊂Frac: both {R,K}; A=k[ε]/ε²→k has kernel (ε)≠0 and violates schematic dominance | Homeomorphism tested on two nonempty examples; nilpotents excluded by hypothesis |
| PA.2.1 | Algebraic extension; henselian convention | Q(i)/Q at2: e=2,f=1,wild; at5: e=f=1,unramified; Artin–Schreier u^p−u=t⁻¹: v(u)=−1/p,e=p for p=2,3; trivial valuation of inseparable extension: e=1 but inseparable residue degree p; identity wild set∅ | Separability and defect conditions not replaced by e alone |
| PA.2.2 | S⊂Val_L; P set of primes | Empty S or P: true; Q(i)/Q: P={3} true, P={2} false; F₂(t)⊂F₂(t^1/2),P=∅: true, but no F₂(t^1/2)→Q scheme point; char(Val_Q)=all primes | Both direction and characteristic qualification correct |
| PA.2.3 | Algebraic towers in fixed closure | Q⊂Q(i)⊂Q(i,√3): at3 the new ramification index2 is prime to3, both tower factors tame; at2 the first factor e=2 is wild; identity tower intersections equal original locus; base change to L itself gives degree 1 | Intersection/containment, including non-converse of containment, hold |
| PA.2.4 | Finite extension | Q(i)/Q: tame and unramified loci exclude the unique place above2; derivative 2i is unit exactly away from2; identity locus is all; purely inseparable degree-p extension has empty tame/unramified loci | Open sets include ∅ and whole space; minimal-polynomial correction matters |
| PA.2.5 | Finite L/K, constructibly compact S | Q(i)/Q,S=all: P={2},K′=L′=Q(i), degrees2 and1; S=∅ or only tame places: P=∅,K′=K,L′=L; inseparable F_p(t^1/p)/F_p(t): K′=L kills relative degree p | Distillation does not impose separability in unrestricted form |
| PA.2.6 | Finite separable L/K, compact S | Q(i)/Q same degrees2,1, both separable; Artin–Schreier degree p: K′=L, base degree p separable and top degree 1; Frobenius degree p is outside hypotheses | Separable variant has nonempty characteristic-p test |
| PA.3.1 | Finite group action; noetherian for iff | Sign action: inertia2 at0 and1 elsewhere; Z[i] at2:(D,I)=(2,2), at3:(2,1), at5:(1,1); trivial action group 1: all orders1; free S₃ on6 F₂-points: inertia1 despite 6=0 mod2; F_(p²)/F_p:(2,1); translation t↦t+1: inertia1, decomposition p at t^p−t−a; doubled plane inertia2 specializes to1 | Tests residue kernel, nonabelian group and nonseparated negative case |
| PA.3.1, closed-fixed-locus iff | Noetherian hypothesis essential | Swapped pair of F₃-points: fixed locus∅ closed, specialization true; glued Spec(∏F₃) copies: all primes maximal so specialization true, fixed locus U=⋃D(e_n) dense proper nonclosed; non-qsep | Both directions separated from nonnoetherian counterexample |
| PA.3.2 | Integral noetherian alteration | Z[i]/Z: G=C₂, degree 2, wild at2; invert2: tame; Frobenius p=2,3: pure degree p and G=1, Galois-alteration true but covering false; cube-root2 extension: degree 3, Aut1, not normal, false; identity degree 1 | Geometric automorphism condition not confused with abstract normal closure |
| PA.3.3 | Integral alteration; finite generic degree | Z[i]/Z: wild set{2}; modification:∅; Frobenius:{p}; t↦t² over Q: degree 2,wild∅; T³−T−2: discriminant−104, mod2 T(T+1)², local degrees1+2=3, quadratic ramification at2 | Bound2≤3 true while divisibility2∣3 false |
| PA.3.4 | Noetherian universally Japanese; finite Galois X-tame | Z[1/2,i]/Z[1/2]: group order2 unit, identity modification; Z[i]/Z: at2 inertia2 in F₂ excludes tameness input; trivial extension over cusp: normalization k[t], group 1 and degree 1 | Normalization inputs require R06; geometric statement passes instances |
| PA.3.5 | Finite separable extension, full inverse image of T | Q(∛2)/Q with T excluding2,3: discriminant−108 invertible, closure Q(∛2,ω) degree6 still unramified there; T=∅ gives both true; at3 both fail | Both implications tested; arbitrary subset of prolongations not substituted |
| PA.3.6 | Integral universally Japanese noetherian base | Z[i]→Z: X′=Y′=Spec Z[i], base degree 2 and tame top degree 1; Frobenius over F₃: base pure degree 3, top1; tame open Z[1/2]: base degree 1 | Prime supports {2},{3},∅ agree; R06 prerequisite |
| PA.3.7 | Previous context plus separable alteration | Z[i]→Z: separable degrees2,1; Artin–Schreier field cover: separable degree p then1; Frobenius excluded | Relative/base separability retained |
| PA.4.1 | Reduced locally noetherian, closed Z | Axes at0: dim2=0+rank 2; trivial log Spec Z: dim=dim+0; cusp geometric stalk: infinitely many indecomposables x²+a x³; F₂ Zariski cusp: 4 generators but x absent and2x present; A₁ toric pair: dim2=0+rank 2 despite embedding dim3; origin inA²: codim2, not boundary | Geometric examples agree; arbitrary-Z supplier call needs R07 |
| PA.4.2 | Log regular fs, coherent log ideal; qe noetherian for projectivity | Axes blow-up: y=xv,boundary xv=0; unit/principal ideal: identity degree 1; empty ideal onF₂: positive Rees pieces0, Proj∅, not modification; empty⊔unit: only second point survives; A₁ ideal(u,w): v²=u²s, z=v/u gives z²=s and normalized ring k[u,z] | Normalized/ordinary distinction and stalkwise nonemptiness verified |
| PA.4.3 | Monoidally torsion-free fine; log regular for regularity | Strict origin immersion with trivial logs:0→0,r=0, underlying smoothness false; axes projection: N→N²,cokernel Z,r=1; square map characteristic 3: N→N,cokernel Z/2,r cannot0; trivial-log cusp: rank 0 free but remains singular; regular boundary:0 blow-ups | Criterion passes; proof ownership needs R05 |
| PA.4.4 | qe log regular; tame generically-free inertia-specializing action | Sign action onA²,char≠2: blow-up chart y=xv, action x↦−x,v↦v; exceptional stratum fixed, inertia2 invertible; original trivial log stratum action nontrivial | Very tame after modification; morphism to original need not log smooth |
| PA.4.5 | Finite tame G, equivariant fine log-smooth map, chart | Irreducible nodal boundary overC: characteristicN², curve tangent dimension2>1, so normal crossings not strict; axes: two regular components,codim intersection2; empty A¹ boundary:rank 0,relative dimension 1; G=1 orC₃ yields exponent1 or3 | Source theorem agrees; coefficient ring needs R08 |
| PA.4.6 | qe log regular pairs; G trivial on base, tame and generically free | Sign action with axes, baseSpec k: quotient uw=v²,boundaryv=0, toric log-smooth pair; G=1: modification and quotient identities; characteristic 2 sign action cannot supply inertia2 invertibility | Quotient conclusion uses admissibility, not automatic freeness |
| PA.4.7 | Regular SNC pairs; intermediate union of components | A² with axes→point: remove y-axis gives characteristic N²→N, smooth coordinate regained; remove both gives A² smooth; trait xy=π: neither vertical branch may be removed since f⁻¹W=V(xy) | Correct direction of boundary inclusion |
| PA.4.8 | Log smooth, regular source, SNC; field or regular curve base | xy=π: chart1↦(1,1),cokernel Z,total boundaryV(xy),horizontal∅; π=u t^p: exponents(p,1),gcd(p,p,1)=1; π=t^p alone:gcd(p,p)=p, log smoothness false; empty product1 gives empty support | Unit exponents essential at p=2,3; no sign/vertical-boundary reversal |
| PA.5.1 | Flat fp curves and markings over arbitrary S | A¹: smooth, identity contracts0; uv=π: two transverse branches; cusp:tangent cone double line,not nodal; exceptional P¹:degω=−2+1=−1,unstable contraction; unmarked P¹:deg−2 but identity stable; elliptic curve plus rational tail:genus 1, degrees1,−1,identity stable; node marking rejected | Relative modification stability differs from stable-curve positivity |
| PA.5.2 | Semistable modification | IdentityP¹: fibres points, relative ampleness true despite total degree−2; blow-up tail: contracted P¹ degree−1, stability false and ample false; identity of A¹ fibreSpec k dimension 0; normalization node fibre2 points | Iff passes; proof's connected-curve assertion fails R04 |
| PA.5.2a | Analytic fields and six definitions below | Q_p complete nontrivial; Q with p-adic norm incomplete; trivial norm has height0; one-dimensional examples have E+F=1,1,0 | Native analytic portion supplies R03 |
| PA.5.2a, analytic fields/types | Complete nontrivially real-valued nonarchimedean k,K | Radius1 Gauss:(E,F)=(0,1); radiusr outside divisible value hull:(1,0); empty nested discs:r>0,inf distance r,(0,0); finiteK/k:(0,0) but algebraic,not one-dimensional | All 5 definition Checks distinguish dimension/type |
| PA.5.2a, splitness | Common completed algebraic closure | Algebraically closed Gauss:infima1=1; T∈k:0=0; disc type 4:r=r>0; unramified quadratic constant α/Q₃:inf toQ₃=1,inf to algebraic closure=0 | Positive infimum allowed; nonsplit constant detected |
| PA.5.2a, stability | Every finite extension, including inseparable | Unramified quadratic:(e,f,n)=(1,2,2); F₂((t^1/2)) andF₃((t^1/3)):(2,1,2),(3,1,3); C((t)),p=1:identity immediate degree 1 but stable; identity general:(1,1,1) | e·f=n in each; p>1 condition excludes false degree 1 defect witness |
| PA.5.2a, generators | z∉k, fixed closure H(z)⊂K | Gauss T:H(T)=K,n=e=f=1; quadratic constants:n=2,e=1,f=2 unramified; radius-r T² over Q₃:(2,1,2),tame not unramified; over Q₂:same triple,wild; z=0∈k excluded | Both positive examples and ramification negative controls computed |
| PA.5.2a, cosets | p>1, s>0; norm(pc^p)<s and norm(d)<s | b0:infimum 0,split; a0,b=t⁻¹,s=ρ⁻¹:infimum ρ⁻¹,special; a1,b1,s1 over F₂:infimum 1,special; a=t,b=t⁻¹:infimum ρ⁻¹,critical not special; a0,b=t⁻¹,s1:infimum ρ⁻¹>1,not critical | Values hold for p=2,3; strict small-error bounds distinguish classes |
| PA.5.2a, uniformization hypothesis | One-dimensional; algebraically closed or type 4/split/tamely closed/deeply ramified | Algebraically closed types 2,3 pass despite type ≠ 4; disc type 4:distances r=r; completed p-root tower:residue F_p and unramified degree 2,not tame closed; completed maximal tameQ_p:value group Z_(p),1/(pℓ) absent while1/ℓ<1, Frobenius modp not surjective | All 4 Checks separate the hypotheses, including p=2,3 |
| PA.5.2b | Uniformization hypothesis / algebraically closed analytic / separably closed valued k with smooth centre | Gauss H(T)=K,degree 1,integer-ring inclusion identity étale; small x′=T+c, norm(c)<1 gives H(x′)=K; radius-r Gauss T² at p=2 wild although T is unramified; trivial base with t-adic k(t):x=t,e=f=degree 1 | Nontrivial existence theorem; statable analytic headline missing R03 |
| PA.5.3 | Integral qcqs base; normal for uniqueness | Rank-two valuationV:identity proper,finite degree 1,separable,positive-first-coordinate ideal has no least value so nonnoetherian; DVR identity same degree 1; P¹→Spec K generic fibre dimension 1 excludes alteration | Arbitrary qcqs scope survives; no noetherian binder silently added |
| PA.5.4 | Normal altered base | Already semistable curve:stable modification identity,lift of g is g; for g,h the unique lift of gh equals product of lifts; trivial groups give identity×identity | Uniqueness supplies cocycle, not an arbitrary chosen action |
| PA.5.5 | Semistable curve over log-regular base, smooth offW | uv=π:baseN→N² sends1↦(1,1),cokernel Z,log smooth; nodal uv=0 over trivial point fails smooth-offW whenW=∅; A¹ with emptyD over trivial base is smooth with rank 0 | Required vertical boundary is retained |
| PA.5.5a | Smooth integral generic curve; qe noetherian normalization | A=Q(∛2):A⊗_Q A=A×A(ω),degrees1+2=3; after constantsA, extensionA(ω) givesdegree 2=2; S₅ example:[A:F]=5 but factors2,3; F_p(T) withE=F_p(u^1/p):tensor E(T),degree p=p; inseparableconstants produce ε^p=0; identity1=1 | Geometric integrality prevents loss of prime support; R06 interface prerequisite |
| PA.5.6 | Smooth generic curve, étale generic markings; universalP-resolution in named sense | S=Spec Z_(2)⊔SpecQ,X=A¹_Q,P=∅:char(S){2},char(X)∅,identity diagrams degrees1; smooth curve with étaleZ over a field:base/sourceidentities,boundaryZ; emptyX:base resolved independently | char(X) variant has a positive test outside char(S) condition |
| PA.6.1 | Maximally dominating ft qe; char(S)⊂P; universalP-resolution | Identity regularS withSNC Z:a=b=id,W′=Z′=Z,degree 1; over Q P=∅ forces degree 1; A² withZ={0}:blow-up gives boundaryP¹ codim1, identity with axes only gives enlarged boundary | Exact inverse-image conclusion needs Cartier reduction |
| PA.6.2 | Same context; simultaneous induction with6.1 | A² local regular base:Z a point codim2; after blow-up exceptionalcodim1; over a field finite-typeX inherited resolution; emptyX only empty alteration | Non-Cartier closed subset cannot simply be called sub-divisor |
| PA.6.3 | Perfect field; p∈P in characteristic p | F₂,F₃ smoothA¹:degree 1=2⁰=3⁰,separable; Frobenius degree p fails separable conclusion and cannot be chosen as replacement; characteristic 0:all finite field extensions separable | Perfect-field separability is additional output, not degree consequence |
| PA.6.4 | ft overqe base dim≤3; separated for proper threefold route | Spec Q[ε]/ε²→SpecQ:reduction degree 1,not generic isomorphism; X/Z:base dim1 permitsprojective regardlessdimX; Z_p[[u,v]]:dim3 permitsproper; regular SNC identitydegree 1 | Low-dimensional bound belongs to base; R01 not propagated to final statement |
| PA.6.5 | ft maximally dominating; separatedX for quasiprojective; base bounds as stated | Perfectfield:baseidentity; imperfectF_p(t),X=Spec k(t^1/p):smooth over k false, smooth over k′ true; nonseparated doubled line:local-isomorphism factor exists but separation false | Theorem permits altered field; example needs R02 |
| PA.6.6 | Same context plus source-relative degree | X=SpecQ overS=SpecZ, chooseQ(i) component ofS′:F=Q,E=L=Q(i),[L:F]=2 but[L:FE]=1,char(X)=∅; F=E=L gives1=1 | Source-relative compositum degree differs from absolute source degree |
| PA.6.7 | ℓ≠char k, separated finite-type X, nowhere-dense Z | kF₃,ℓ2:3^n odd; smoothA¹,Z a point:identities, degree 1; kQ,P∅:degree 1; k=F₂,ℓ2 excluded since2=0 | No restriction to selected good residue primes |
| PA.6.8 | Excellent regular separated curve S; flat finite-type X; ℓunit | Z_p[ x,y]/(xy−p),ℓ≠p:Σ{p},a=(1,1),gcd=1,horizontal∅; emptyΣ on smooth family; closed vertical point asX is nonflat and excluded | Horizontal divisor differs from total vertical-plus-horizontal log boundary |
| PA.6.9 | Integral separated variety; ℓinvertible | SmoothA¹ withYpoint:πidentity,degree 1,SNCpoint; smoothP¹,Y∅:empty boundary; characteristic p purely inseparablebase degree p remainsprime to ℓ≠p | Connected regular component is integral; no geometric-connectedness claim inserted |
| PA.6.10 | Excellent henselian DVR, residue characteristic≠2,integralprojectiveflatX | RegularX:degree 1; ramified quadratic extension:degree 2 acts0 onZ/2; equalcharacteristic 3 purely inseparabledegree 3:odd,separability false; ℓ2 givesdegree 2m+1 acts1 onZ/2 | Odd degree does not imply separability; trace use is conditional |
| PA.6.11 | Algebraically closed k, variety, finite faithful G, G-stable proper Z | X=P¹,G1,Z{0,∞}:identity compactification,SNC2points; G=C₂ onP¹,char≠2:invariantsk(t²),identity equivariance, fixed-field extensiondegree 1 pure; swapping axes inA²:original SNC notG-strict, after blow-up, strict transforms disjoint | G-strictness is stronger than ordinary SNC |
| PA.6.11a | Excellent DedekindR,(T),surjective irreducibleX,geomirreduciblegenericfibre | A¹_R:zero section,K′=K; Z[1/2]→Z:not surjective, 2 nonunit in every integral closure so no point; x²+y²=−1:no integer point,over Z[i] (i,0) works; number/global function rings satisfyT | Surjectivity and extension distinguish examples |
| PA.6.11a, Pic⁰ boundary theorem | (T),horizontalquasifinite orverticalcurves; nilpotents allowed | E/F₅:r.h.s.values1,3,1,1,4,affinecounts2,0,2,2,2,plus∞=9; discriminant4; P¹:Pic⁰0,O(1)degree 1 infinite; square-zero thickening:kernelF₅,quotient order9,killed by 45; relative surfaceE×SpecR:generic-point class has infinite order,excluded by component dimension | Degree-zero condition, nilpotent contribution and dimension restriction all essential |
| PA.6.11b | Global Dedekind base; projective flat integral X, d≥1, smooth locus dense in every fibre | X=P^d,N=d: centre empty (dimension−1),identity projection,one section; reducible special fibre with 2 smooth components requires≥2 sections; component with no smooth points has no eligible section and violates density of the smooth locus | R11: the quotient bundle need not be trivial |
| PA.6.12 | Global Dedekind base; integral, separated, flat, finite-type X | Smooth projective X, Z=∅: S₁=S, X₁=X, all maps identity; xy=π strict semistable local model: exponents 1,1; dimension 0 normal base extension:finite regular Dedekind model after constants | Completion clause is fibrewise at finitely many bad points |
| Summary: trace use | A theory with res/trace composite multiplication by d; ℓ-primary coefficients | On Z/2, d=3 acts as 1, d=2 acts as 0; on Z/9, d=2 is inverted by 5 since 2·5=1 mod 9 | The application correctly retains the trace identity as a hypothesis |
| Degree conventions | Positive finite degrees, prime ℓ, fixed compositum | Finite identity: 1; infinite Q(t)/Q: total finrank 0; degrees 2 then 3 multiply to 6; degree 1 has empty prime support | Totalized zero is explicitly excluded; multiplication order matches supplier |
| PA.0.1 finiteness API | Dominant finite-type map, noetherian target | Spec Z[1/6]→Spec Z: omitted primes {2,3}, cardinality 2; Spec Q→Spec Z: omitted primes infinite, morphism not finite type | Hypothesis discriminates the infinite negative example |
| Normalization supplier Checks | Integral X, finite L/k(X); Nagata for finiteness | Z⊂Q(i): Z[i], degree 2; cusp: k[t], degree 1; F_p(t)⊂F_p(t^(1/p)): degree p; non-Japanese DVR: integral closure not finite | Computations true; pinned export claim fails R06 |
| Scheme-theoretic image | Native image of Spec k→Spec k[ε]/ε² | Kernel (ε), quotient k; topological image is the whole singleton while scheme image is reduced | Image carrier supplies the required distinction |
| LocalFields supplier Checks and maximal separable P-gap | P set of primes; full versus separable P-closure | P=∅: extension degree 1; separably closed imperfect characteristic-2 K: pure square-root degree 2 with inseparable residue under trivial valuation; F_(q^p)/F_q: degree p | Full tameness is not inferred from separable closure |
| Log-chart convention and closed-subset gap | Étale log structures; nowhere-dense boundary | xy=π gives cokernel Z; 1↦(p,p) gives Z⊕Z/p, p=2,3 not invertible; axes pair has monoid N²; empty boundary gives 0 | Rank and torsion conventions agree with CR.5 |
| Very-tame and quotient-gap Checks | Finite action; admissibility and generic freeness where required | Sign action on trivial-log A²: inertia 2 but nontrivial surface action; axes log: stratum a point and invariant ring k[x²,xy,y²]; group 1: original ring; Z₂[i] closed point: inertia 2 in F₂ | Very tameness true only in the stated axes and trivial-group tests |
| Log-blow-up gap | Coherent ideal in the supplied log carrier | Unit ideal: identity; empty ideal: empty blow-up; ideal (x,y) on axes pair: charts y=xv and x=yu | Universal property does not silently imply surjectivity |
| Finite-presentation factorization gap | Finite type quasi-separated X→S, qcqs S, qc open U | Identity S→S: X₀=S and immersion identity; square-zero quotient S_red→S: closed immersion into X₀=S, kernel nilradical; over U where kernel vanishes: identity | Agreement over U and finite-type, not fp, input retained |
| Analytic uniformization, dimension-zero control | PA.5.2b(ii), algebraically closed complete k; K=k | For every x∈k, H(x)=k=K; degree 1, integer-ring map identity étale; every positive ε works; unequal-residue premise false | The native theorem must retain this valid boundary case, not require y∉k |


## Not verifiable

- No formal elaboration or theorem proof was checked: this pass forbids Lean execution, and the submitted Lean file has no named declarations. R03's proposed native formulation must be elaborated by the repair worker after the definitions and theorem are added.
- LocalFieldsRamificationPartII was unavailable as a main/new-roadmap checkout through the roadmap service. Its GF.0–GF.6 contracts and the cited slugs were checked in packages/LocalFieldsRamificationPartII/design/README.md, the available board design. This is not evidence that those contracts are implemented.
- Ownership against open pull-request files not supplied by the brief was not checked. Service-index hits were used as leads only; in particular no full-head conclusion is drawn about PotentialModularityAndCompatibleSystems.
- All ten cited works had legally accessible cached text, so no missing-reference request was needed. The review checked the cited passages and relevant proof steps, not every page of every source. OCR-sensitive or ambiguous typography was not promoted to a source error without a mathematical witness.

## Source issues

- **Error** in temkin17 at §3.1.7, p. 115 (temkin17 line 762): the source says forgetting centres is injective exactly when the scheme is separated; it should be that separatedness implies injectivity; the converse fails for a fixed closed finite-field point, which sees only its trivial valuation; affects nothing.
- **Gap** in temkin17 at §3.2.4, p. 116 (temkin17 line 791): the source says P-tameness always identifies with tameness over the indicated localization of Z; it should be restricted to fields admitting that structural map, namely characteristic zero or characteristic in P; affects nothing.
- **Gap** in temkin17 at Lemma 3.2.10, p. 117 (temkin17 line 832): the source says the chosen monic étale polynomial is the element's minimal polynomial; it should be replaced by its minimal factor, with integrality and the derivative-unit condition justified; affects the proof.
- **Misprint** in temkin17 at Lemma 3.3.7, p. 120 (temkin17 lines 963–968): the source says the easy implication is forward, restricted valuations lie in S′, and the conjugate compositum is L; it should be the reverse implication, restricted valuations in S, and compositum L′ with the asserted tameness of L′; affects the proof.
- **Error** in temkin17 at §1.2.7, p. 100 (temkin17 lines 140–146): the source says branch-parameter exponents alone characterize log smoothness; it should be a chart criterion retaining unit directions: π=u t^p has exponent vector (p,1), not merely (p); affects a stated result.
- **Gap** in temkin17 at Theorem 1.2.5 and §4.3.2, pp. 99 and 124 (temkin17 lines 108 and 1107): the source says three-dimensional universal resolvability follows from the cited resolution theorem without distinguishing proper and projective resolution; it should be qualified by the separated proper theorem and its stated affine projectivity, unless additional globalization is proved; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 4.2.1, Step 10, p. 123 (temkin17 lines 1071–1073): the source says the composite morphism is log regular and gives the final target as (X,S); it should be log smooth, with target the resolved base pair (S,W); affects the proof.
- **Misprint** in temkin10 at §1.2, p. 2 (temkin10 line 95): the source says the residues on the two branches of a node are equal; it should be that their sum is zero; the generator has residues 1 and −1; affects nothing.
- **Misprint** in ilo14 at X §2.6, Step 3, p. 155 (ilo14 lines 7131–7133): the source says P has unit rank μ and sharp rank ν, then writes Z^ν⊕N^μ; it should be Z^μ⊕N^ν, or interchange the earlier rank assignments consistently; affects nothing.
- **Gap** in ilo14 at X Remark 3.3.4(ii), p. 159 (ilo14 lines 7320–7322): the source says the cited Cossart–Jannsen–Saito treatment supplies resolution for all quasi-excellent surfaces; it should be supported by Lipman's quasi-excellent surface theorem, since the cited treatment assumes excellence; affects the proof.
- **Gap** in ilo14 at X Theorem 3.5, Step 3, p. 163 (ilo14 lines 7530–7532): the source says a closed subset contained in an SNC boundary is a subdivisor; it should be preceded by Cartierization; a point contained in the axes of A² has codimension two; affects the proof.
- **Error** in cjs at Theorem 0.3, detailed formulation, p. 4 (cjs line 100): the source says every centre lies in the singular locus of the successive strict transform; it should be allowed in the boundary nontransversality locus too: a regular curve tangent to the boundary needs a blow-up; affects a stated result.
- **Error** in cjs at Corollary 0.4, p. 5 (cjs lines 131–134): the source says every reduced closed subscheme of dimension at most two becomes an SNC divisor by a surjective modification; it should be required to contain no irreducible component of the ambient scheme; a whole component of two disjoint affine lines cannot become a divisor; affects a stated result.
- **Gap** in dejong96 at §8.6, p. 92 (dejong96 line 1599): the source says the projective bundle of planes through the chosen centre is projective d-space over the base; it should be trivialized after a further extension, or obtained from a framed free quotient as in R11; affects the proof.
- **Error** in moretbailly89 at §3 opening paragraph, p. 168 (moretbailly89 line 295): the source says a relative-dimension-zero morphism under Theorem 1.7's hypotheses is an isomorphism; it should be handled separately; Spec F_p[t^(1/p)] over Spec F_p[t] has degree p and satisfies those hypotheses; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "74a07367e4b2975566c5ed457bc7eb0f29a656da", "job": "RT-AdicCoefficientsAndComparisonsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
