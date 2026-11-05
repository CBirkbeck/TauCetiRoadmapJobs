<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6450974269 -->
Red team round 2 pass a (codex) of eefe719

Verdict: needs_changes

1. **F01** (P1) The discriminant bound used in positive characteristic is false

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:663: “bounded in terms of the degree. It becomes constant near the puncture”.

   **Claim:** The discriminant argument proves annular decomposition over both characteristics, and hence supplies the uniform annular and tube-comparison route.

   **Witness:** In characteristic 2, the file's own cover T=w²/(1−w) has degree 2 and discriminant norm r at radius r<1. Thus δ(−log r)=−log r is unbounded. ITO20 line 2343 repeats the false bound.

   **Exact repair text for the false assertion:** “The discriminant function is continuous, piecewise linear and convex, with integer slopes. When the covering degree d is nonzero in K, Ramero's bound gives δ≤−d log∣d∣, and hence eventual constancy. This bound gives no finite upper bound when char K divides d. The positive-characteristic annular-decomposition target requires a separate proof; the cited argument does not establish it.”

   This replacement identifies the remaining proof obligation; acceptance also requires a valid route for that obligation at the stated generality. Retain the general target and its positive-characteristic consumers. Restricting the whole roadmap to characteristic zero would violate its contract. Add the computed Artin–Schreier example below as a negative-control Check for the bound.

   **Test of the repair:** d=2=0 in K makes ∣d∣ᵈ=0, so the estimate says only ∣disc∣≥0. It allows ∣disc∣=r and no longer incorrectly asserts eventual constancy. The example does have an annular preimage; it refutes the proof assertion, not by itself the decomposition theorem.

   **Computation:** At the Gauss point ∣T∣=r choose c∈K with ∣c∣²=r and put z=w/c. The integral equation is z²+(T/c)z+T/c²=0. Its reduction is z²+s over κ(s), where s is transcendental, and is irreducible of inseparable degree 2. Consequently 1,z is an integral orthonormal basis. The trace discriminant is (T/c)², of norm r. At r=∣π∣² and r=∣π∣⁴ its negative logarithms are respectively 2L and 4L, where L=−log∣π∣>0. They grow without bound at fixed degree 2.

   **Source cross-check:** RAM05 line 1020, Lemma 2.1.10(ii), printed p. 193, gives the estimate involving ∣d∣ᵈ. ITO20 lines 2342–2345 incorrectly infer a finite bound in both characteristics. The published version also retains this inference (ITO20 published extraction lines 2168–2171, printed p. 892). No published correction was located.

2. **F02** (P3) The added adapted-nodal-curve definition has no discriminating Checks

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:639: “A nodal curve f : X → S is adapted to dense opens (X°, S°) if”.

   **Claim:** This new definition supplies the marked-boundary condition used in the repaired alteration route.

   **Witness:** The adjacent Checks at lines 643–645 use id_S and the finite map t²=π; their fibres have dimension zero. Neither tests a nodal curve, an étale boundary, or smoothness over S°.

   **Exact repair text to add as three Checks:**

   - “Let S=Spec k[[s]], S°=Spec k((s)), X=ℙ¹_S, and D={0,∞}. For X°=ℙ¹_{S°}∖D the pair is adapted: X is smooth and D is the disjoint union of two sections, étale over S.”
   - “Assume char k≠2. With the same X,S,S°, remove from the generic fibre the divisor x²=s. Its closure is ramified over s=0, with special fibre k[x]/(x²). No closed étale marking has that generic divisor, so this pair is not adapted.”
   - “Let C/k be a connected projective nodal curve with an actual node. For X=C×S, S°=S and X°=X, the boundary is empty and étale, but X→S is not smooth at the node. This pair is not adapted.”

   **Test of the repair:** The three tuples (smooth over S°, boundary étale) give (true,true), (true,false), and (false,true). They distinguish both required conditions; the existing zero-dimensional examples distinguish neither. The mathematical repair of pass a F03 remains valid.

3. **F03** (P3) Six surviving Checks repeat interfaces or other Checks

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:227: “this is the formula of §0.2”; :571 and :575 repeat the tube/domain identification; :822 and :824 repeat earlier comparison Checks.

   **Claim:** These bullets count as discriminating tests of the definitions and comparisons.

   **Witness:** Lines 571 and 575 are the same equality in opposite wording, with no chosen fan, equations or radius. Lines 822 and 824 repeat lines 814 and 816. Line 227 supplies no instance; line 890 merely negates the scope hypothesis.

   **Exact repair:** Delete the six Check bullets at lines 227, 571, 575, 822, 824 and 890. Keep the general finite-extension and section-domain statements in their target/API paragraphs. No Lean declaration is involved.

   **Test of the repair:** Section 3.1 still has three discriminating bullets: V(T) gives radius ε; ideals 0 and (1) give the whole space and ∅; V(πT) at ε=∣π∣² gives radius ∣π∣ instead of ∣π∣². Section 4.2 retains its identity, Tate-character and failed-neighbourhood tests. This is additional to the nine bullets removed for pass a F05.

4. **F04** (P3) The new duality locator was not added to the source record

   **Location:** packages/DeligneWeightsAndPurityPartII/sources.toml:96: the HUB96 locator lists “Theorems 3.7.2, 3.8.1” and “Lemma 2.7.11 and Theorem 5.7.8”.

   **Claim:** The source record covers the cited input added for the nonproper-duality repair.

   **Witness:** README:91 invokes HUB96 Corollary 7.5.5. It is absent from the HUB96 manifest locator and README:931's HUB96 reference. ITO20 lines 2009–2016 and 2038 explicitly invoke that corollary.

   **Exact repair:** Append “; Corollary 7.5.5 (as used in ITO20, proof of Lemma 7.1, pp. 45–46)” to the existing HUB96 `locator`. Append the same locator and its use for §3.4 to the HUB96 reference paragraph. Preserve key HUB96 and status `uncertified`; do not request the book again.

   **Test of the repair:** The new gap's unique external theorem now has the same locator in its contract, reference list and existing manifest entry. This does not certify the unread book or create a new source key.

5. **F05** (P3) The Kummer-stage Eisenstein input is cited in the wrong layers

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:51 attributes “Eisenstein extensions” to “Layers 0, 1, 2 and 4”; §2.1's Needs at line 464 cites only “Layers 0–1”.

   **Claim:** Those precise supplier sections provide the totally ramified Eisenstein stages used at line 445.

   **Witness:** TauCetiRoadmap/LocalFieldsRamification/README.md:707–710, on main, puts the Eisenstein-to-total-ramification theorem and its uniformizer conclusion in Layer 3. Layer 2's aggregate dependency already includes it; the specific contract and Needs omit it.

   **Exact repair:** At line 51 replace “Layers 0, 1, 2 and 4” by “Layers 0–4”, specifying “Layer 3, Totally ramified is equivalent to Eisenstein” for the Eisenstein input. At line 464 replace “LocalFieldsRamification Layers 0–1” by “LocalFieldsRamification Layers 0–1 and Layer 3, Totally ramified is equivalent to Eisenstein”.

   **Test of the repair:** For k=ℚ₂ and X²−2, the cited Layer 3 now supplies degree 2, total ramification e=2, residue degree 1 and uniformizer √2. This is a locator correction to an existing earlier owner, not a new gap or merge-order edge.

## Earlier findings: verification at this head

Identifiers below are the F-identifiers used in the repair report. All quotations are from the current package, not the earlier reports.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| Pass a F01 | Repaired | README:683: “Let a, b ∈ ∣Kˣ∣ satisfy a < b ≤ 1.” README:690 computes the excluded equal-radius map ℤ/3 → 0. For a<b, the constant H⁰ comparison is ℤ/3 → ℤ/3, 1↦1. |
| Pass a F02 | Repaired | README:634: “only the generic fibre splits, into two points”. Modulo the new uniformizer, the displayed ring is κ[t]/(t²), with one point; its generic fibre is K′×K′ and nearby-cycle action is identity on (ℤ/n)². |
| Pass a F03 | Repaired | README:639: “gap:adapted-plurinodal-alteration supplies the adapted opens and the containment of the top open in the inverse image of X°”. README:89 and design/plan.json have the same slug and supplier. The unmarked supplier still supplies no boundary; the missing boundary is now an explicit contract. |
| Pass a F04 | Repaired | README:75: “§R07.4.3 supplies the Kummer field of norms, its Galois equivalence and the p = 2 norm-compatible sign”. The current supplier’s §R07.4.3 gives N(√2)=−2 and N(−πₙ₊₁)=−πₙ. Both systems reduce to the same mod-2 coordinate. |
| Pass a F05 | Repaired | The nine identified non-test bullets were removed. README:283 gives “graded Frobenius eigenvalues 1/2 and 1”; :323 gives the S₃ diagonal/plane test; :361 gives the split Tate factor. Their computed values are weights (−2,0), dimensions 1+2=3, and pole real parts 0 versus 1. |
| Pass b F01 | Repaired | README:83: “The nonproper adic relative duality used in §3.4 is the declared gap huber-smooth-relative-duality.” README:91, :694 and plan gaps agree. For the identity annulus N=0 this is Λ≅Hom(Λ,Λ); the original curve-only supplier cannot provide that relative assertion. |
| Pass b F02 | Repaired | Same repaired passage and special-fibre calculation as pass a F02. |
| Pass b F03 | Repaired | README:694 now cites “EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model”. The target exists on main at TauCetiRoadmap/EtaleCohomologyFoundations/README.md:107, for a qcqs base and separated finite-type source. |
| Pass b F04 | Repaired | README:926 now includes “§3.1, Proposition 3.1, Theorem 3.3, Definition 3.4, Lemmas 3.5–3.16 and Corollary 3.17” and the later §6, §7 and Appendix A locators. The formerly absent line locators are present. |
| Pass b F05 | Repaired | Suggested.lean:9–12 calls §4.4 “elementary linear algebra on free carriers” and keeps it in the README. There is no declaration, no section-variable context and no remaining `duality_splitting` acceptance theorem. |

No repair was marked not actionable. The added gaps are named, precise contracts in both intake locations; their present absence from the supplier is not a finding.

Dependency command result at this head: `depcheck: 149 roadmaps, 1009 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

## Statement and instance register

All README references in the tables below refer to packages/DeligneWeightsAndPurityPartII/README.md. Equality tests display both sides or the two resulting values. “Retain” means no defect established by these tests, not a new proof of the theorem. A stated exclusion is tested by computing why the input is inadmissible. Field-valued statements exclude the zero ring; finite ℤ/n statements include n=1. No natural-number subtraction or division is used in a Lean signature here.

### Suggested.lean declaration/context register

| File region | Declarations | Variable/instance context | Result |
|---|---:|---|---|
| Suggested.lean:1–48, entire file | 0 | No variables, instances, definitions, theorems, axioms, opaque data or examples; empty namespace only | No elaborated types exist to audit; no dropped binders, padding declarations or duplicate fully qualified names. The requested `#check @name` inventory is empty. No Lean command was run. |

### Sampled adversarial instances

The review covered all targets, APIs and Checks counted below. These representative rows retain computed witnesses; the exhaustive per-target and per-API ledgers are omitted from this posting copy.

| Statement | Context and instances tried | Computed values | Result/change |
|---|---|---|---|
| Conventions:21–33 | q=2,3; N(e₁)=e₀, Φ=diag(1,q); zero space; q=1 | NΦe₁=q e₀=qΦNe₁; ΦNΦ⁻¹e₁=q⁻¹e₀. Grades −1,1 have weights 0,2; twist gives −2,0. Empty spectrum imposes no weight; q=1 gives 1=1 for all weights | Retain q≥2 and geometric convention |
| 0.1 datum and isomorphism | H=ℤ₃⋊ℤ̂, Φ acts by 1/2; trivial H; rescale by 3 | t(ΦσΦ⁻¹)=t(σ)/2; trivial H has image(t)=0 and fails; composite rescalings 3·2=6, inverse 1/3 | Retain |
| 0.2 standard datum | unramified degree3, ramified degree2, inseparable degree p | (e,f)=(1,3) gives Q′=q³,t=t′; (2,1) gives t=2t′; inseparable gives t=p t′ with p a unit in ℚℓ | Retain; use fixed Tate coordinate |
| 0.3 restriction | H′=H,I; residue-index tower3 then2; ℓ-root tower | Q=q versus residue image0; nested Q=(q³)²=q⁶; ℓ-root tower t=0, exp(0N)=1 for every N | Retain hypotheses; S03 for redundant Check |
| 0.4 purity | Tate block; its dual; two-block tensor; zero; N=0 semisimplification | Central weights 1,−1,2; tensor strings length3 and1; zero satisfies all weights; eigenvalues1,q at sole grade0 have weights0,2 and no common weight | Retain |
| 0.7 summands | Tate ker N; S₃ over ℚ₃ | ker N weight0 versus ambient1; permutation representation splits dimensions1+2=3, intersection solves3a=0 and is0 | Retain; arbitrary subspace conclusion would fail |
| 0.8 WMC definition and L-factor | ℙⁿ; Spec k; empty; disconnected2 points; Tate curve | H²ʲ eigenvalueqʲ, weight2j; odd groups0; Spec H⁰=E; empty all0; two points H⁰=E²; Tate invariants eigen1, pole Re(s)=0≤1/2 | Retain |
| 1.1 local curve theorem | multiplicative Legendre degeneration; good specialization | H¹ grades−1,1: eigenvalues1,q, weights0,2, centre1; good fibre N=0, all Hⁱ eigen weights i | Retain |
| 2.1 Kummer tilt | ℚ₂ and ℚ₃ towers; finite stage; wrong dyadic norm | v(πₘ)=p⁻ᵐ; completed value group nondiscrete; finite stage discrete; N(√2)=−2 while sharp(t)=2 | Retain marked sharp/sign distinction; S05 locator |
| 2.3 Tate coordinates | ℓ≠p; ℓ=p; ε compatible p-power roots | pʳ is invertible modℓⁿ, so the compatible root is unique; μp in characteristic p has one element versus p in characteristic0; ε has infinite order | Retain prime-to-p restriction |
| 3.1 finite-ideal tube | ideals(T),(T²),(πT),0,1; identity base change | Radii ε,√ε,ε/∣π∣; ideal0 entire, ideal1 empty for ε<1; identity preimage unchanged; ∩ε positive-radius discs={0} | Retain; S03 |
| 3.3 punctured-disc Riemann existence | T=Sᵐ in char0, including m=p; char2 AS cover | Kummer pullback splits m branches; AS degree2 remains connected after every odd Kummer pullback by Laurent coefficient recurrence | Retain char0 hypothesis |
| 3.4 uniform endpoint | char2 disc, all odd n; n=p in mixed characteristic; square-zero closed thickening | One radius1: H⁰=ℤ/n→ℤ/n; n=p has infinite H¹ of disc versus0 at point; V(T²) has radius√ε but same closed étale support | S01 affects proof route, not a counterexample to endpoint |
| Bold uniform alteration:637; local-unipotence and adapted nodal definition:639 | t²=π; identity; smooth marked ℙ¹ and ramified marking | Single quadratic base change makes swap identity for all n; identity needs degree1; nodal test truth pairs (true,true),(true,false),(false,true) as S02 | Main statement retained; add S02 tests |
| Bold annular covers/tameness:661 and its three outputs | identity; Kummer degree m; AS degree2 char2; tame μ₃ in residue2 | Identity δ=0; Kummer preimage radii(a¹/ᵐ,b¹/ᵐ); AS radii(√a,√b), δ(−log r)=−log r; tame degree3 image order3 invertible | S01: boundedness/eventual constancy false in general |
| Bold annular sheaf comparison:683 | Λ,Λ²; rank3 descent n3; equal radii | H⁰=Λ,H¹=Λ(−1),higher0; restriction identities; specified Hc=0; equal radii givesΛ→0 | Retain a<b; repaired earlier F01 |
| 4.1 approximation and positivity | identity toric; d=0 point; elliptic double cover of ℙ¹ in char3; inseparable degreep | Degree identity1; point intersection=[L:k]>0; elliptic pullback O(1) degree2=2·1; inseparable degreep>0 | Retain geometric irreducibility and all degrees |
| 4.3 top isomorphism | degree2 map ℙ¹/elliptic; ℓ=2; disconnected target | Rational scalar2≠0 in ℚ₂; mod2 scalar0; disconnected top E→E² cannot be iso | Retain rational coefficients, geometric connectedness |
| 4.4 Poincaré splitting | d=1 elliptic cover; S₃ permutation plane; C₂ character; zero spaces; E=𝔽₂ | Middle A¹=0 splits B¹=E²; diagonal+sumzero overℚ₃ dimensions1+2; χ=−1 cancels in annihilator; 0⊕V=V; 1D identity over𝔽₂ givesV⊕0 | Retain arbitrary-field theorem; deleted Lean stand-in stays deleted |
| 4.6 toric complete intersections | ℙ⁰,ℙ¹,ℙ²; residue2,3; smooth plane cubic | weights0;0,2;0,2,4 in respective even degrees; cubic bad semistable H¹ has grades0,2 centred1 | Retain general stated scope; S01 impacts uniform supporting route |
| 4.7 projective/product corollaries | Fermat p∤e; e=1; ℙ¹×ℙ¹; cubic3-fold | Fermat derivatives e xⱼᵉ⁻¹ have no common projective zero; e1 gives hyperplane; product Betti even1,2,1 with weights0,2,4; smooth cubic H³ centralweight3 | Retain; no claim at singular p∣e |

### Sampled README Checks

C-numbers retain their original file-order indices. The six defective Check bullets remain identified individually in S03.

| Check / line | Instance and computed values | Result/change |
|---|---|---|
| C024 / 283 | dual atq2: eigen1/2,1 gives weights−2,0,centre−1 | Correct repair |
| C029 / 323 | S₃ overℚ₃: diagonal1D, sumzero2D; intersection3a=0⇒a0 | Correct repair |
| C035 / 361 | split Tate invariants eigen1 gives pole Re(s)=0; N0 semisimplification also eigen q gives pole1 | Correct repair |
| C071 / 644 | swap nonunipotent odd n; atn2ᵃ exponent a+1kills; one quadratic extension kills every action | Correct |
| C077 / 672 | char2AS dT/dw=w²/(1−w)²≠0; radii√a,√b; degree2noninvertible | Correct; also refutes S01's bound |
| C078 / 673 | oddm recurrence g₋₂ʲₘ=1, norms r⁻²ʲᵐ→∞ at r<1 | Correct no odd Kummer trivialization |
| C080 / 680 | residue2,cubic,n3: R⁰rank3; own cover trivializes despite3=0 inΛ | Correct |
| C085 / 690 | a=b1:H⁰(circle,ℤ/3)=ℤ/3, H⁰(empty)=0 | Correct repaired negative control |
| C087 / 699 | fT²char2 derivative0; tubeT atε equals tubeT² atε², both radiusε | Correct |
| C096 / 734 | plane cubicH¹dimension2, ambientℙ²H¹dimension0 | Correct arbitrary-open negative control |
| C105 / 818 | top characterχℓ⁻ᵈ=(χ♭ℓ∘β)⁻ᵈ; d1 givesq on both sides | Correct |
| C110 / 838 | two components target top E², sourceE; rank≤1<2 | Correct geometric connectedness |
| C115 / 860 | U0 gives0⊕V; E𝔽₂,V1D,id givesV⊕0 | Correct arbitrary field/zero |

### Additional boundary instances

| Statement / line | Computed instance | Result |
|---|---|---|
| Coordinate quotient / 451 | In O_K/(2), π₁ is nonzero and π₁²=0, matching T¹/²≠0 and(T¹/²)²=T=0 | Retain nonreduced quotient |
| §3.4 tame at a point / 661 | Trivial image has order1; Kummer degree3 in residue2 has order3, invertible; AS degree2 has order2, noninvertible | Retain |
| §3.4 truncation / 692 | At r0 require H⁰(C₀)=H⁻¹(C₀)=H⁻¹(C₁)=0; identityČechcone gives0 at each entry | Retain off-by-one bound r+1 |

### Supplier and ownership resolution

The main copy is content main d2e0f0d. The pinned libraries are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Existing-roadmap revisions were not substituted for main. New-roadmap supplier text was read with `roadmaps show` at the current indexed head. The following 16 supplier groups were resolved; line references are to their README.md unless otherwise specified.

| Supplier and inspected location | Claimed input and resolution |
|---|---|
| TauCetiRoadmap/LocalFieldsRamification, Layers0–4 | Finite extension e,f, positive tame coordinate and arithmetic Frobenius. The pinned implementation supplies the concrete names; geometric Frobenius inverts q. S05 identifies the omitted Layer 3 locator for Eisenstein total ramification. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations, head3e99d0d, §§1.5,2.1a,2.4,2.6; lines995,1564,1768,1967 | Coefficient descent, trait comparison, continuous local-field monodromy, Jordan strings, scalar purity and convolution/dual filtrations are present. The tensor statement is characteristic zero; E/ℚℓ meets that hypothesis. |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles, head8f3e9b1, §§1.1–1.5; lines930,1016,1059,1112,1174 | Sheaf-theoretic monodromy, centered filtration and its relative form exist. Lines1141–1145 explicitly import vector-space tensor/dual rules from ArithmeticGaloisRepresentations §2.6. Its geometric NF=qFN agrees here. |
| TauCetiRoadmap/DeligneWeightsAndPurity, head6c2402d, §§0.1–0.19,5.11,7.15; lines753–1074,2050,2679 | Natural/real scalar comparison, eigenvalue powers both ways, direct sums, all-embedding purity, local curve theorem and proper smooth finite-field purity exist with the consumed hypotheses. Its N=0 comparison is not a claim that monodromy may always be discarded. |
| TauCetiRoadmap/EtaleCohomologyFoundations, main, G.2:107; F.2.1–F.2.3:504–540; F.3:676; F.3a:776; F.4.3–F.4.6:999–1091; F.6:1200 | Nagata, scheme base change, finite/adic realizations, continuous actions and `VanishingCycles.adicFunctoriality` are genuine targets. The roadmap retains their finite-type, invertibility and finiteness/realization conditions. |
| TauCetiRoadmap/PerfectoidSpaces, main, P1.4–P1.6:3843–4040; P1.10–P1.15:4292–4476; P1.32a:5713; P3.7–P3.8:8424–8501 | Sharp naturality, residue comparison, completed Kummer example and degree-preserving finite extensions/Galois equivalence are present. The action is componentwise, not an arbitrary abstract group isomorphism. |
| TauCetiRoadmap/AdicEtaleGeometry, main, A1.0.5:2142 | Topologically henselian Tate-ring completion equivalence exists, without a perfectoid or Noetherian requirement. This supplies the actual completion step used for the tower. |
| TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory, head1a17d7d, R07.4.1:5396 and R07.4.3:5526 | Mod-p frame versus field-of-norms equivalence/sign are now cited separately. The dyadic signed norm computation is in R07.4.3. |
| TauCetiRoadmap/AdicSpacesPartII, main, R0.19.1–R0.19.2:7466–7535; R1.3–R1.6:8968–9678 | Constructible compactness, analytification, base change and properness exist at rank-one complete bases. Properness is not asserted for an arbitrary affine model. |
| TauCetiRoadmap/AdicSpacesPartIII, main, R2.3:4615; R2.4:4986; R2.8:7480; R2.10:8158 | Generic fibres of non-Noetherian type-(S) models, equation domains, section domains and proper-model comparison are present. R2.8 explicitly permits non-Noetherian valuation-ring models. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomology, headdfcb6b7, §§1.1–1.5,3.2,4.5,5.4,8.2–8.5,9.6–9.7,10.1–10.5,11.1 | Nearby-cycle stalk2713 and plurinodal alteration2722 exist; the latter lacks prescribed opens/markings. Curve duality4588 and Berkovich/proper transport4684 do not erase the new nonproper-duality gap. Tame annulus4911 and Kummer classes4923 are imported; the new small-radius wild annular input is distinct. |
| TauCetiRoadmap/AnalyticToricGeometry, main, Layer0 | Native complex toric carriers and standard fans/products are named. The package does not redeclare them. |
| packages/AnalyticToricGeometryPartII/design/README.md, NT0–NT6, especially lines476,487,520,560,576,603,702,724 | Accepted earlier owner of arbitrary-base toric models, projection, open-topos comparison, cohomology, section domains and approximation. Field-automorphism naturality is explicit. NT4 distinguishes p-power transition action on H² from the cohomology comparison; no inverse-Frobenius substitution is made here. |
| TauCetiRoadmap/SchemeAndStackFoundations, main, §§0.7–0.9:755–871;0.23a:1508;4.11:5528;4.16:6038;4.19:6372;5.2–5.3:6653–6722 | Component descent, finite-stage models, universal-homeomorphism invariance, blow-ups, alterations and Chern projection formula exist. Alterations over imperfect fields retain the finite extension; the uniform proof's perfected-parameter step does likewise. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli, head71ecc01, A2.7:1231 | `ampleIntersectionPositive` covers the nonempty integral projective image and arbitrary characteristic; d0 is degree of a closed point. |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves, headd1fab8f, §§0.5–0.6:669,822;1.3:1159;3.4–3.7:3267–3542 | Rational trace/cycle comparisons and perfect pairings exist. The consumed top group E(−d) requires geometric connectedness, retained in §4.1. |

The four resolver leads are not missing declarations: `OrientedEtaleProduct.nearbyCycles_stalk`, `VanishingCycles.adicFunctoriality`, `WeilDeligneRep.IsPureEnd` and `WeilDeligneRep.IsWeilNumber` are cited as planned supplier targets, not as pinned imports. Their current supplier sections contain them.

Ownership searches used `roadmaps grep` by object (monodromy datum/filtration, coefficient-uniform nearby cycles, uniform annular direct images, discriminant functions, cohomological neighbourhoods, tilting/weight–monodromy and multiplicative top-degree splitting), together with main/Completed, package and supplied-checkout searches. Relevant overlaps are the owners in the table. The supplied ClassicalAdicEtaleCohomologyPartII head's scope, README.md:3–11, owns integral/p-primary formal and proper duality, not the nonproper prime-to-residue annular comparison requested by the gap. No competing owner of the marked datum or uniform annular extension was found. No Lean declaration exists here to duplicate another fully qualified name. Search results from unrelated copies of main inside sibling checkouts were not treated as new owners.

### Four declared gaps

| Slug | Supplier section in plan and README | Precision/minimality check |
|---|---|---|
| huber-compact-support-nearby-cycles | ClassicalAdicEtaleCohomology 4.5,5.2,8.3–8.4; README85 | One Galois-equivariant stalk comparison with strictly henselian microbial base, separated finite-type map and torsion sheaf. Specialization compatibility belongs to the same comparison. The general nearby-cycle stalk is not this compact-support analytic identification. |
| analytic-comparison-automorphisms | ClassicalAdicEtaleCohomology 8.2,11.1; README87 | One proper comparison's continuous-automorphism naturality, retaining cups/reductions. It does not ask this roadmap to rebuild comparison. |
| adapted-plurinodal-alteration | ClassicalAdicEtaleCohomology 5.4; README89 | Integral Noetherian excellent source/base, geometrically irreducible generic fibre, prescribed dense open and marked smooth/étale boundaries are explicit. The present unmarked factorization does not supply them. S02 tests its local definition; no missing-owner finding. |
| huber-smooth-relative-duality | ClassicalAdicEtaleCohomology 9.6–9.7; README91 | Smooth separated qc, pure dimension N, finite type over algebraically closed complete rank-one K, n invertible and all compact direct images lcc; includes the named pseudo-adic base change. One trace comparison, not an unrelated bundle of requests. S04 fixes only its locator record. |

Every slug occurs in design/plan.json and under Exact supplier contracts. All suppliers are named; none is `none`. Acceptance remains conditional on these contracts. Their current absence is not raised as a defect.

### Pinned declarations and headline coverage

| Pinned input | Read definition/hypotheses and limitation |
|---|---|
| Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42,59 | `absoluteGaloisGroup` is `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`; `mapOfAlgebra` is continuous restriction with the scalar tower. No injectivity/equivalence follows merely from this definition. |
| Mathlib/RepresentationTheory/Basic.lean:48 | `Representation` is `G →* V →ₗ[k] V`. No continuity is a field of that carrier. README explicitly supplies it. |
| Mathlib/NumberTheory/Padics/PadicNumbers.lean:531; PadicIntegers.lean:71 | `Padic` and `PadicInt` retain the prime parameter/prime instance; they do not provide an arbitrary geometric ℓ-adic cohomology representation. |
| Mathlib/RingTheory/Nilpotent/Exp.lean:50 | `IsNilpotent.exp` is a finite sum; nilpotence is needed for the exponential identities used here. |
| Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39 | `IsPerfPair` has `bijective_left` and `bijective_right` for the two adjoints. It does not carry a G-action or an equivariance law. |
| Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442; Algebra/Module/Submodule/Defs.lean:39; Order/Disjoint.lean:308 | Native eigenspaces, submodules and `IsCompl` exist, together with the standard linear-map kernel/range/flip. These permit §4.4's elementary algebra, not the absent geometric comparison map. |
| Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:128 and Ext/Map.lean:223 | `comp`, `mapExactFunctor`, `mapExactFunctor_comp` exist; the last is precisely preservation of Yoneda composition for an exact functor with the Ext universes. Restating that alone in Suggested.lean would be padding. |
| Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56 | `Sheaf.H` is Ext from the constant ℤ sheaf in abelian-group sheaves. The README correctly leaves the module-sheaf/cup identification to the supplier. |
| TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99,146,310 | `inertiaSubgroup`, its closedness and `IsArithFrobeniusLift` exist. The last is arithmetic; the roadmap explicitly inverts it. |
| TauCeti/NumberTheory/LocalField/Tame/Character.lean:401,406,468,552; Tame/Quotient.lean:387 | Positive Kummer `inertiaTameCharacter`, surjectivity/conjugation and the arithmetic q-power action exist. For tσ1, arithmetic conjugation givesq and geometric gives1/q. |
| TauCeti/NumberTheory/LocalField/Teichmuller.lean:63 | `teichmullerLift` is a multiplicative section preserving0, suitable for the finite expansions. |
| Mathlib/RingTheory/Perfection.lean:633,825; Perfectoid/Untilt.lean:49 | `PreTilt`, `Tilt` and the multiplicative `PreTilt.untilt` exist. They are not the completed-tower/perfectoid-field and functorial Galois comparison interfaces named by the headlines. |
| TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:61,128; Fan/Scheme.lean:136 | Native toric charts/realization exist over ℂ: the coordinate ring is `MonoidAlgebra ℂ ...`. This does not yet supply the arbitrary p-adic/integral fan scheme in the headline. |

The headline inventory is: detection/transport/stable-summand purity and finite-extension/good-reduction consequences (§§0.5–0.10); local/global equal-characteristic WMC (§§1.1–1.2); coordinate Kummer tilt and marked Galois/Tate comparison (§§2.1–2.5); degreewise local constancy, punctured-disc covering, fixed and uniform neighbourhood theorems, cup-compatible geometric pullback and stable neighbourhood (§§3.2–3.6); tilted approximation, multiplicative equivariant comparison, rational top isomorphism and geometric stable summand (§§4.1–4.5); toric and projective/product WMC (§§4.6–4.7). Suggested.lean:15–40 names all these unavailable interfaces. In particular it names the uniform nearby/annular/descent machinery inside the uniform theorem rather than encoding it with free predicates. No statable geometric headline omission was established. The native abstract splitting and Ext-composition facts are not substitutes; the file correctly contains neither.

### Source resolution and proof-locator audit

The 73 distinct source-qualified line anchors in the README were located and read in the supplied extractions: 21 SCH12, 50 ITO20, one DEL80 and one DJ96. Supplemental lines inside the cited arguments were read to check hypotheses and normalizations. The inventory below identifies the passages rather than reproducing them.

| Source | Locator coverage and result |
|---|---|
| SCH12 | Theorem1.1, printed245–246; Theorem1.15,251 (line239); Corollary8.8,306–307 (line2496); §9,307–311 (lines2508,2511,2518,2527,2543,2547,2560,2564,2571,2589,2592,2597,2598,2601,2604,2607,2612,2622,2636,2652). Geometric Frobenius, grade shift, toric scope, rational top-degree comparison and summand route agree. Source slips/omission are listed below; the package already supplies their corrections. |
| ITO20, arXiv v1 | Introduction/Theorems1.1,1.4 (lines76,99,103,124); sliced cycles/alteration (189,238,252,317,348,359,378,381,388,412,429,803); tubes/neighbourhoods (866,918,964,974,987,1003,1030); stalk/specialization comparisons (1198,1299); adapted sheaves/annuli (1413,1427,1439,1455,1481,1502,1518,1586,1606,1662,1673); descent/bounds/duality (1738,1774,1813,1846,1901,1928,1973,2009,2038); discriminants/covers (2191,2279,2338,2382,2391). These locate the intended assertions with the hypotheses recorded above. S01 is a copied false inference in a proof, despite a correct locator. |
| DEL80 | §1.8, Theorem1.8.4,175–176; line1524 begins its notation, theorem begins1528. The result concerns a lisse punctually pure sheaf on a finite-field curve and grades shifted by their monodromy index. The roadmap uses the actual curve supplier, not the unrestricted mixed-characteristic conjecture. |
| DJ96 | Theorem4.1 and Remark4.2,66–67; line597 and following. Regular projective alteration, with smoothness over a perfect field; the package's positive-characteristic proof first passes to the perfected parameter field and descends a finite stage. |
| HUB98, HUB96, LUT93 | Existing manifest entries remain uncertified. The accessible formulations were checked through the exact ITO20 and SCH12 recalls. This certifies those recalls, not the complete original books/articles. S04 records the missing new HUB96 locator. |
| RAM05, review-only corroboration | Lorenzo Ramero, Local monodromy in non-Archimedean analytic geometry, Publ. Math. IHÉS102 (2005),167–280, DOI10.1007/s10240-005-0036-z. Legal Numdam copy, Lemma2.1.10(ii),193, lines1020–1026. Its degree estimate cannot give a finite logarithmic bound when d=0 in K. If the repair cites this work directly, add one RAM05 manifest entry, not another ITO20 key. |
| ITO20, published-version corroboration | Same work, published in J. Inst. Math. Jussieu23(2) (2024),839–896, DOI10.1017/S1474748022000615. Legal publisher-open copy, AppendixA proof of Theorem6.2,892, lines2164–2180. Numbering of this theorem agrees with v1; the faulty bound remains. Use the same ITO20 key with a version note if adding this version to the manifest. |

No source was fetched from an unauthorized mirror. The two additional legal copies were obtained through the sources service. The initially unresolved publisher URL was resolved using its publisher-open classification; no unresolved source request remains. Settled uncertified entries were not reopened. No source extraction was copied into the package or this report.

## Verified sound

- Read the entire README (931 lines) and Suggested.lean (48 lines), the repository rules, both prior reviews and the repair report. Verified all ten earlier findings individually; all ten are repaired. S02 and S04 are new omissions accompanying otherwise valid repairs.
- Counts: **0 Lean declarations**; **30 numbered target sections plus seven additional bold targets**; **86 enumerated API bullets**; **122 Check bullets evaluated**, with six redundant/non-instance bullets identified in S03; three additional proposed nodal Checks computed for S02. The review also covered conventions, four fixed-coefficient proof inputs, the propagated-unipotence subtarget and the two-form splitting statement.
- Resolved/read **73 distinct README source-line locators** in four available sources; checked two further legal corroborating texts for S01. Three original sources remain explicitly uncertified. A located source passage does not make its inference sound: S01 records that distinction.
- Resolved **16 roadmap supplier groups**, **four named gap contracts** and **four citation-resolver leads**. Object searches covered main/Completed, packages and the indexed open-roadmap heads, with direct inspection of the relevant supplied sibling text. No duplicate owner or fully qualified declaration was established.
- The requested read-only dependency check returned exactly `depcheck: 149 roadmaps, 1009 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The local direction is definitions/monodromy → equal-characteristic input and marked tilt; independent analytic neighbourhood theory → approximation → comparison → top isomorphism → splitting → final WMC. Source S01 breaks an argument inside that direction, not its acyclicity.
- The PR diff has nine changed files, all within packages/DeligneWeightsAndPurityPartII. It adds no external-folder edit. README/Suggested.lean contain no pull-request numbers or process instructions, no computational algorithm target, and no forbidden Lean command. The only import is `import Mathlib`; there is no `set_option`, admitted data, `lemma` declaration, placeholder, hypothesis-containing-conclusion theorem, or acceptance-test padding.
- Native-carrier inspection supports the empty acceptance file. Ordinary algebraic/torsion/toric fragments at the pins do not supply the geometric monodromy, analytic cohomology or arbitrary-base comparison interfaces needed for these headlines. No new statable headline was replaced by a stand-in.

## Not verifiable

- The full original texts of HUB96, HUB98 and LUT93 remain settled uncertified sources. Their complete proofs, original oc-quasi-constructibility definition and HUB96 Corollary7.5.5's full surrounding assumptions were not independently certified. The report uses the accessible stated recalls and does not request these texts again.
- The general positive-characteristic annular-decomposition proof cannot be certified through the given route because its discriminant bound is false (S01). The AS example verifies an annular preimage, so it is not a counterexample to that endpoint theorem. A valid replacement proof at the same generality is still required; none is asserted here.
- The four explicitly declared supplier contracts are not implemented theorems at the pins. They were checked for ownership, precision, minimality and matching intake declarations, not for completion of their future formalizations.
- No Lean elaboration/build was run, as required by the read-only brief. There are no named declarations for a scratch `#check` signature pass, so no signature result is missing. This report does not claim a fresh import-only compilation.
- Ownership checks are textual searches plus inspection of relevant matches, not a proof that differently worded work cannot overlap. No unpublished or unprovided open-head content was treated as a supplier. Existing-roadmap revisions were not consumed instead of main.

## Source issues

- **Misprint** in SCH12 at Proposition 9.1, printed p. 307 (line 2524): the source says the exponential uses the tame coordinate of an unbound g; it should be the coordinate of the acting element σ; affects a stated result.
- **Misprint** in SCH12 at Lemma 9.5, printed p. 309 (lines 2585–2587): the source says the graded and tensor bounds involve i without binding that parameter in the lemma; it should be stated for a fixed integer i; affects a stated result.
- **Gap** in SCH12 at proof of Theorem 9.6 and Lemma 9.9, printed pp. 309–311 (lines 2609,2647): the source says a smooth projective alteration has the one-dimensional top group needed for the zero-or-isomorphism dichotomy; it should be chosen geometrically connected after finite constant-field extension; affects the proof.
- **Error** in ITO20 at Appendix A, proof of Theorem 6.2, preprint p. 52 / published p. 892 (v1 lines 2342–2345): the source says the discriminant is bounded in terms of degree in either characteristic; it should be restricted to nonzero degree in the field, with a separate positive-characteristic argument; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "eefe71980da901e56aa04fb1b74fbdb58166504f", "job": "RT-DeligneWeightsAndPurityPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
