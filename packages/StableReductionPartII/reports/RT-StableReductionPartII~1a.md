<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1599#issuecomment-6435328757 -->
Red team round 1 pass a (codex) of ef5dd78

Verdict: needs_changes

1. **F01** (P3) Definition Checks still repeat laws without discriminating instances

   **Location:** packages/StableReductionPartII/README.md:864–868 (§2.5), 1595–1599 (§2.46), 1994–1998 (§2.70), 2022–2026 (§2.71), 3490–3494 (§2.160). For example: “The original coefficient 1 maps to 1.”

   **Claim:** These blocks provide three discriminating Checks of the defined coefficient action, ordered basis, or tensor diagram.

   **Witness:** §2.5 repeats the algebra-map definition, then tests 1↦1 and 0↦0. Every unital ring map passes the latter two. §2.46 repeats B(0)=1 and B(1)=u; its zero-ring test cannot detect exchanged basis vectors.

   **Exact repair text:** Replace §2.5's Checks by: “For A=ℤ, p=(2), n=3, evaluation sends the completed coefficient 1/3 to 3 modulo 8. Multiplication by this coefficient sends 2 to 6 modulo 8. At n=0 the quotient is zero, while at n=3 the image of 1 is nonzero.” Replace §2.46's Checks by: “For A=ℤ and all parameters zero, 2+3u has coordinates (2,3). For A=𝔽₂, γ=1 and other parameters zero, u² has coordinates (0,Y). For A=ℤ/4 and zero parameters, 2Yu has coordinates (0,2Y) and is nonzero.” For each of §§2.70, 2.71 and 2.160 replace the repeated Checks by: “With σ=Σ2ᵏvᵏ, level 3 sends σ⊗(1,1/3) to (1+2v+4v²,3+6v+4v²). The transition to level 2 gives (1+2v,3+2v). Acting by 1/3 before or after projection gives (3+6v+4v²,1+2v+4v²) at level 3; exchanging coordinates or using the original coefficient 1 instead gives a different pair.” Here the tensor coefficient module is ℤ₂²; the last equality uses (1/3)²=1 modulo 8.

   **Retest:** 3·3=9≡1 (mod 8), 3·2=6≠2 (mod 8). The exchanged basis gives (3,2), not (2,3); the false relation u²=0 gives (0,0), not (0,Y). The proposed tests distinguish the indicated wrong constructions.

2. **F02** (P3) The completed-coefficient Check does not distinguish ℤ₂-linearity

   **Location:** packages/StableReductionPartII/README.md:3953 (§2.186): “which no ℤ-linear evaluation determines”.

   **Claim:** Evaluating the completed scalar 1/3 modulo 4 requires more than ℤ-linearity.

   **Witness:** For any ℤ-linear f with f(1)=1, 3f(1/3)=f(1)=1. In Q₂=(ℤ/4)[u,v]/(u²), multiplication by 3 is invertible, so f(1/3)=3 necessarily.

   **Exact repair text:** Replace the last clause by: “This value already follows from ℤ-linearity and f(1)=1, since 3 is invertible modulo 4; it is a value check, not a separation of the two scalar structures.” Add a genuinely different completed-coefficient test using σ=Σ2ᵏvᵏ: “At level 3, the actual projection sends σ to 1+2v+4v² and (1/3)σ to 3+6v+4v².”

   **Retest:** 3·3=1 modulo 4. Modulo 8, 3(1+2v+4v²)=3+6v+4v², so the replacement has explicit nonconstant terms and makes no false claim about weaker linearity.

3. **F03** (P2) Native arbitrary-coefficient Hom and Ext headlines are absent

   **Location:** packages/StableReductionPartII/Suggested.lean:9–14, 77–102; packages/StableReductionPartII/README.md:6631 (§2.351), 6835 (§2.361), 8035–8051 (§§2.438–2.439).

   **Claim:** The acceptance file includes the local headline theorems statable at the pins, while treating relative Hom/Ext comparisons among the missing geometric APIs.

   **Witness:** Both J and D already exist in this file. Mathlib/CategoryTheory/Abelian/Ext.lean:41 defines native module-valued Ext; :68 computes it by projective resolutions. The README itself writes the native Ext expression in §§2.438–2.439.

   **Exact repair text:** Add admitted headline theorems, over every commutative coefficient ring A and every A-module N, for the two canonical R-linear isomorphisms D⊗_A N≃Hom_R(J,R⊗_A N) and J⊗_A N≃Hom_R(D,R⊗_A N), with their pure-tensor values f⊗n↦(j↦f(j)⊗n) and j⊗n↦(f↦f(j)⊗n). Add the simultaneous conclusion that, for every n:ℕ, the native objects `((_root_.Ext R (ModuleCat R) (n+1)).obj (Opposite.op (ModuleCat.of R J))).obj (ModuleCat.of R (R ⊗[A] N))` and its D analogue are zero objects. Use the existing pointedNodeRing and pointedSectionIdeal and the native dual; only the simple evaluation/tensor maps needed to state these headlines may be added. Name these additions in the README. Restrict the module docstring's unavailable-carrier explanation to the genuinely geometric statements.

   **Retest:** For A=ℤ, γ=δ=s=t=0 and N=ℤ/2, J=(u,v) in ℤ[u,v]/(u²); the coefficient dual generator has values ε(u)=0, ε(v)=u. Thus its image under the first comparison sends v to u⊗1≠0. For the second comparison, v⊗1 evaluates inclusion to v⊗1 and ε to u⊗1. Both positive Ext families are zero by the two universally exact dual resolutions, with no flatness of N. Degree zero is not zero. Over the zero ring every displayed module is zero. These signatures retain the README's arbitrary-coefficient scope and test more than the two current conclusions.

4. **F04** (P2) Uniform tricanonical equations are planned twice

   **Location:** packages/StableReductionPartII/README.md:9108–9151 (§§4.2–4.3), particularly “Choose d once before applying any characteristic-dependent positivity argument.”

   **Claim:** This roadmap owns a new proof of uniform finite-degree equations on the integral parameter family.

   **Witness:** Main TauCetiRoadmap/SchemeAndStackFoundations/README.md:5894–5911, `level_structure_cover_ample`, already assigns a uniform degree, multiplication kernels determining embedded curves, and integral ampleness to that target. Line 5911 expressly includes uniform tricanonical equations.

   **Exact repair text:** Replace §§4.2–4.3 by an import paragraph: “Supplied by SchemeAndStackFoundations §4.15, `level_structure_cover_ample`, using AlgebraicModuliForArithmeticGeometry §§1.4–1.5: uniform tricanonical ideal generation and higher vanishing on the fixed quasi-compact Noetherian parameter family, with the multiplication-kernel and arbitrary-base-change comparisons. Apply this input to the family on the finite scheme cover used in §4.16.” Retain the rank computations as Checks and the application to coarse descent in §4.16; remove the duplicated relative-Serre proof obligation. If a finer export is needed, request precisely that export from the existing owner.

   **Retest:** For g=2 the imported rank is 5, Sym² has rank 15, and f_*ω⁶ has rank 11; the kernel has rank 4 whenever degree 2 meets the generation bound. Degree 1 still has zero kernel and cannot determine the curve. The same fixed-family uniform input supplies §4.16 without creating a second owner.

5. **F05** (P3) Stale acceptance-signature narrative remains in a target

   **Location:** packages/StableReductionPartII/README.md:7459 (§2.400): “the admitted signature uses heterogeneous equality to avoid unfolding an opaque construction”.

   **Claim:** There is an admitted signature for this constructed Hom cochain and its differential comparison.

   **Witness:** Suggested.lean has exactly seven declarations, at lines 41, 47, 51, 58, 67, 79 and 95. None is a cochain construction or a heterogeneous-equality comparison; there is no opaque declaration.

   **Exact repair text:** Replace the quoted clause with: “Compare the differential maps after transporting along the specified source and target object identifications.” Also replace the unresolved internal slug `StableReductionPartII:key/moduli-curves` at README.md:320 with “the stable pointed-curve moduli pseudofunctor of SchemeAndStackFoundations §4.15”.

   **Retest:** For the repeated-root fixture and the ideal phase, the degree-zero Hom differential remains precomposition with Ψ, and its successor remains precomposition with Φ. Their composite is zero. Neither assertion refers to a nonexistent acceptance signature.

6. **F06** (P3) The nodal-family locator gives the section tag instead of the lemma tag

   **Location:** packages/StableReductionPartII/README.md:8679 (§2.476): “Lemma 53.20.1, tag 0C58”.

   **Claim:** Tag 0C58 identifies the lemma characterizing nodality by the unramified Fitting singular scheme.

   **Witness:** mc0-stacks-curves line 2158 is the section introduction, tagged 0C58. The equivalence is Lemma 20.1, tag 0C59, at lines 2165–2170.

   **Exact repair text:** Replace “Lemma 53.20.1, tag 0C58” by “Lemma 53.20.1, tag 0C59, mc0-stacks-curves lines 2165–2174”.

   **Retest:** For xy=t over k[t], the Fitting singular scheme is Spec k→Spec k[t], unramified but nonflat. This is the lemma's criterion and remains the correct input to the triangle argument.

7. **F07** (P2) The genus-one supplier gap repeats an earlier canonical formula

   **Location:** packages/StableReductionPartII/README.md:64 (gap:surface-low-genus-positivity), and §4.8 at line 9219: “the elliptic canonical-bundle formula”.

   **Claim:** SchemeAndStackFoundations must newly supply the genus-one canonical formula used by weighted positivity.

   **Witness:** Current TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:776–778, 849–857, §6.0b, already owns the general genus-one carrier, canonical formula, Hodge degree and all-characteristic comparisons; these require no K3 hypothesis.

   **Exact repair text:** Add: “Import K3SurfacesAndSymplecticBoundedness §6.0b's generic genus-one canonical formula and Hodge-degree comparison, restricted to a relatively minimal fibration with smooth generic fibre, section and proper base.” In gap:surface-low-genus-positivity, replace the request for that formula by “Using that imported formula, supply χ(O_S)≥0 and the resulting weighted direct-image nefness in genus one, and the genus-zero Hodge-index argument, with the stated finite-base-change and pushforward comparisons.” Make the same change to this gap's needs in design/plan.json. Do not remove the remaining positivity contract.

   **Retest:** On E×ℙ¹, the imported L is O, torsion length and χ are zero, ω_S=f*O(−2), and ω_(S/ℙ¹)=O. Thus the required base nefness degree is 0. On a Jacobian K3 over ℙ¹, L=O(−2), χ=2 and ω_S=O. Both cases fall within the earlier generic prefix and distinguish the inverse Hodge line.

8. **F08** (P2) Fine curve level and smooth Torelli have a prior characteristic-zero owner

   **Location:** packages/StableReductionPartII/README.md:9249–9260 (§4.10), 9946–10000 (§§6.12–6.14), 10371 (§7.13).

   **Claim:** The fine level scheme, its universal curve, and its smooth Torelli map are constructed here without identifying the existing characteristic-zero construction.

   **Witness:** Current TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1983–2013, §B4.1, constructs precisely M_g[ℓ], its universal curve and quasi-finite polarized Torelli map over ℚ(ζ_ℓ). This roadmap is earlier in ORDER.txt.

   **Exact repair text:** Add to Scope and ownership and the affected Needs clauses: “AbelianSchemesAndArithmeticModuliPartII §B4.1 owns the characteristic-zero fine symplectic curve-level scheme, universal family, finite étale level changes and quasi-finite Torelli map. The present targets extend these interfaces over ℤ[1/N,ζ_N], including every permitted residue characteristic, and identify their restriction to ℚ(ζ_N) with the supplied construction through the representing functor and polarized relative Jacobian.” Replace the characteristic-zero construction in the DGH export by this import and comparison. Retain the integral extension and the sign-sensitive fibre refinement as explicit additional targets.

   **Retest:** For g=2,N=3 over ℚ(ζ₃), both moduli functors classify exactly the same symplectically framed genus-two curves; the representing-scheme comparison is unique and preserves the universal curve. Characteristic 2 at N=3 remains an additional case here, and N=2 remains excluded by the hyperelliptic involution. No all-characteristic endpoint is narrowed.

9. **F09** (P2) The whole arbitrary-base perfect-complex gap is already supplied

   **Location:** packages/StableReductionPartII/README.md:82, gap:perfect-arbitrary-base: “provide perfect pushforward and arbitrary derived base change”.

   **Claim:** Perfect pushforward, arbitrary derived base change, fibre-amplitude local freeness and the unit splitting remain missing and must be newly supplied by SchemeAndStackFoundations §2.18.

   **Witness:** Main TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1057–1071 supplies perfect_proper_pushforward. Current TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:9142–9170, §7.2, supplies single_degree_free_locus and universal_functions, including the étale-local positive-amplitude unit splitting.

   **Exact repair text:** Replace the contract with: “Import EnhancedDerivedSheaves §E1.9, perfect_proper_pushforward, specialized to G•=O_X[0], for perfect pushforward and arbitrary derived base change. Import AlgebraicModuliForArithmeticGeometry §7.2, single_degree_free_locus and universal_functions, for fibre-amplitude local freeness and the unit splitting for proper flat finitely presented families with geometrically reduced connected fibres.” Remove gap:perfect-arbitrary-base from design/plan.json's gaps and replace its uses by these named inputs. The remaining arbitrary-base duality gap is separate.

   **Retest:** For ℙ¹_A→Spec A and E=O, Rf_*E=A[0] and every A→B gives B[0], including A=ℤ/4→B=𝔽₂. The unit summand is all of A[0], with zero complement. For identity over ℤ and perfect E=ℤ/2, derived base change to 𝔽₂ has H⁻¹=H⁰=𝔽₂. The imports retain the required derived correction and impose no Noetherian restriction.

10. **F10** (P1) StableReduction does not state the cited very-ampleness input

   **Location:** packages/StableReductionPartII/README.md:456 (§1.2): “Import the geometric very-ampleness and H¹(ω³)=0 computations from StableReduction Layers 2–3”.

   **Claim:** Those layers supply the closed-immersion theorem for the third canonical power of every stable geometric genus-g curve, g≥2.

   **Witness:** Main TauCetiRoadmap/StableReduction/README.md:354–405 promises degree bounds and global generation; :406–467 promises stability and contraction. Neither states very ampleness of ω³. Layer 8 (:579) again states global generation and vanishing, not very ampleness.

   **Exact repair text:** Replace the unsupported import by: “Use gap:stable-tricanonical-embedding.” Add under StableReduction's supplier contract and in design/plan.json's gaps: “What StableReduction must provide (gap:stable-tricanonical-embedding): In Layer 2, for every geometrically connected projective nodal stable curve C over an algebraically closed field, of arithmetic genus g≥2, prove that ω_C³ is very ample and H¹(C,ω_C³)=0 in every characteristic, including reducible curves and self-nodes.” Retain the arbitrary-base passage as the target of §1.2. A statement about an unspecified sufficiently high power in SchemeAndStackFoundations §4.15 does not supply the exponent-three input.

   **Retest:** For a smooth genus-two hyperelliptic curve, ω² is globally generated with H¹=0 but its map factors through the degree-two hyperelliptic cover; global generation and vanishing alone do not imply an embedding. The requested ω³ statement instead gives rank 5 and a degree-6 embedding in ℙ⁴. A rational component with exactly three special branches has deg ω³=3, consistent with the same theorem on reducible stable curves.

11. **F11** (P2) The algebraic relative-reflexivity criterion is statable at the pins

   **Location:** packages/StableReductionPartII/Suggested.lean:11–12; packages/StableReductionPartII/README.md:8295 (§2.452): “Relative stable reflexivity ... lacks coherent sheaf Ext”.

   **Claim:** The missing geometric interfaces prevent stating the relative stable-reflexivity headline.

   **Witness:** Mathlib supplies Module.Flat, Module.IsReflexive, native Ext, and Ideal.ResidueField (RingTheory/LocalRing/ResidueField/Ideal.lean:33). §§2.449–2.450 define predicates on these module carriers; §2.452 does not involve schemes or coherent sheaves.

   **Exact repair text:** Add real-body predicates for absolute stable reflexivity (canonical Module.IsReflexive and both native positive Ext vanishings) and relative stable reflexivity (A-flatness and that absolute predicate after tensoring with κ(q∩A), for every maximal ideal q of R). State §2.452's equivalence between this fibre predicate and its two canonical Hom exchanges plus both positive Ext vanishings for every A-module N, with explicit Noetherian A,R, algebra A→R, R-flatness over A, and finiteness of M over R. Reuse the evaluation maps requested in R03. Replace the docstring sentence by: “The algebraic universal-coefficient criterion is stated below; its coherent-sheaf globalization and geometric completion descent remain unavailable.” No free Prop parameter or substitute for a residue fibre is needed.

   **Retest:** For A=R=ℤ and M=ℤ, both maps identify n with evaluation at 1, and all positive Ext groups are zero: both sides hold. For M=ℤ/2, every residue-field fibre is reflexive but M is not A-flat. Also M*=0, β_(ℤ/2):ℤ/2→0 is not bijective, and Ext¹_ℤ(ℤ/2,ℤ)=ℤ/2. Both sides fail, detecting the essential flatness clause. Over k, the nodal ideal remains an allowed nonprojective example.

## Verified sound

Read all 10,548 lines of README.md and all 104 lines of Suggested.lean, covering **594 numbered targets**, **7 Lean declarations** (five definitions/abbreviations and two theorems), the **9 coefficient conventions**, and all **162 Checks blocks**. Retained below are **16 computed convention/supplier Check cases**, the seven declaration rows and **28 sampled target computations**. The full target ledger remains in the existing scratch notes. Repeated formulas share an instance explicitly; a nonzero finite-free example does not certify an arbitrary-module inverse-limit claim.

The seven supplied elaborated signatures retain their ring, coefficient-module, universe and instance arguments. I compared each with the corresponding README statement. No dropped binder was found. I did not run Lean or a fresh elaboration, in accordance with the read-only instruction. Both existing theorems have substantive content; none of the seven declarations is one-tactic padding, and each of the five definitions supports a kept theorem. The file has one `import Mathlib`, the required namespace and module explanation, two admitted theorems, no admitted data, and no `set_option`. Its remaining acceptance coverage defects are R03 and R11.

The actual quotient matters: specializing the node matrices to arbitrary scalars u=v=0 over ℤ makes both matrices zero and destroys exactness; the present theorem uses the genuine quotient and avoids that defect. The repeated-root and characteristic-two examples remain exact without a discriminant hypothesis. The canonical bidual evaluation, ordered presentations, transpose convention and shifted complete-hull convention agree on the displayed instances. The boundary conormal has unsigned exchange, while the residue quotient has sign −1. The integer determinant grades distinguish O(1), O and O(−2) on ℙ¹ as 2,1,−1. These signs agree with the integral Noether computation in the target table.

The review checked **49 accessible source entries at the locator blocks listed below**: **44 primary locator blocks were text-certified**, and **5 were only partially certified because formulas are damaged in OCR**. It also checked **19 distinct explicit Mathlib file-and-line locators**, including the two Pi tensor locators whose quoted lines are the immediately preceding attributes. The two settled uncertified books remain uncertified. This count is of locator blocks, not a certification of every secondary citation or every proof in a cited work.

For ownership, object searches covered main, Completed, board packages, and all **55 supplied sibling-head folders**. The roadmap CLI's object search and resolver were also used. **Twelve supplier groups were inspected in detail**: StableReduction, SchemeAndStackFoundations, EnhancedDerivedSheaves, AlgebraicModuliForArithmeticGeometry, JacobianChallengePartII, NeronModelsAndSemistableAbelianVarieties, DeformationAndDerivedPatchingAlgebra, K3SurfacesAndSymplecticBoundedness, AbelianSchemesAndArithmeticModuliPartII, PadicMeasuresIwasawaAlgebras, StablePeriodicCurved and AlgebraicVectorBundles. The resolver's single unresolved-name lead, ModuliDescent.polarizedDescentComparison, exists in the current AlgebraicModuliForArithmeticGeometry §3.5 and is not a finding. No duplicate fully qualified name of a kept Lean declaration was found. The pointed quadratic model owns the arbitrary section and nonsplit form comparisons beyond the pinned split NodeAlgebra; it does not duplicate that split carrier.

All **28 declared gap slugs and named owners** match design/plan.json and the README. The integral-pairing needs differs only by Markdown delimiters. R07 and R09 identify nonminimal requests; absence of the remaining contracted results from today's suppliers was not treated as a defect.

The internal target graph has **1,344 edges**, **zero forward references**, **zero unresolved target anchors**, and **zero cycles**. The required roadmap dependency check returned exactly:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The checked head is ef5dd7894c649703e2d497f5bc558d02c73b1caa. The diff against origin/main changes eight files, all under packages/StableReductionPartII (13,436 insertions and 443 deletions). The review changed only this report and scratch notes. No Lean build, Git mutation, source edit or external post was performed.

### Headline acceptance inventory

| README headline | Acceptance status at these pins |
|---|---|
| Polynomial section complex universally exact, including transpose and arbitrary coefficients | Stated as nodeSection_universallyExact; genuine quotient and all coefficient-module binders retained |
| Canonical reflexivity of the polynomial section ideal and its dual | Stated as pointedSection_reflexive; actual evaluation predicate retained |
| Arbitrary-coefficient Hom exchange and positive native Ext vanishing for the section ideal and dual | Statable on the existing carriers; absent, R03 |
| Algebraic relative stable-reflexivity universal-coefficient criterion | Statable with two real-body module predicates; absent, R11 |
| Formally versal pointed-node hull | Named as unavailable; deformation groupoid/formal-hull carrier missing |
| Coherent relative stable-reflexivity globalization and geometric completed-local transfer | Named as unavailable; coherent-sheaf Ext and geometric comparison interfaces missing |
| Expansion/contraction and unrestricted universal-curve equivalence | Named as unavailable; pointed stable families, stack and expansion-sheaf Proj interfaces missing |
| Decorated boundary normalization and smoothing conormal descent | Named as unavailable; clutching, normalized stack and cotangent-line carriers missing |
| Connected fine symplectic curve level | Named as unavailable; polarized relative Jacobian and level moduli missing |
| Integral universal Noether line isomorphism | Named as unavailable; stable stack, graded cohomology determinant and integral pairing missing |
| Stable compactification after finite base change | Named as unavailable; stable-family/classifying-stack interfaces missing |
| Compactified Torelli and Hodge nefness/bigness | Named as unavailable; relative Jacobian, integral minimal compactification and positivity interfaces missing |
| Degree-Picard parameters, actual lifts, obstruction and infinitesimal Hodge comparison | Named as unavailable; relative Picard and stack-cohomology interfaces missing |

### Supplemental convention computations

Here R=ℤ[u,v]/(u²), p=(2), m=2R, Â=ℤ₂ and σ=Σ2ᵏvᵏ unless a row specifies otherwise. The series is a compatible completion element: each finite projection is a polynomial. All diagrams use their displayed scalar actions.

| Convention/definition | Instances | Computed sides and result |
|---|---|---|
| Stable range, README.md:22 | (g,n)=(0,2),(0,3),(1,0),(1,1) | Integer 2g−2+n gives 0,1,0,1; precisely the latter stable value in each pair is positive |
| Tricanonical normalization, README.md:24 | g=2, T=0,1,2 | Rank 5, projective dimension 4, degree 6; polynomial values −1,5,11; χ(O)=−1 agrees at T=0 |
| Additional section and projective quotient convention, README.md:24 | Three-pointed ℙ¹; new mark at 0; base-line twist O(1) | One three-flag bubble is inserted; forgetting it inserts zero residual components; quotient projectivizations before/after tensoring the bundle with a base line agree |
| Level and branch conventions, README.md:28 | N=2,3; characteristic 2 | −I=I mod2 but −I≠I mod3; 2·2=1 mod3 repairs multiplier 2; constant C₂ has two geometric points even in characteristic 2 |
| Determinant and conormal signs, README.md:30 | Hodge ranks (1,1),(1,2); node xy=t | Hodge exchange −1,+1; conormal exchange +1,+1; (r,−r) reverses to (−r,r); t scales by αβ when branches scale by α,β |
| Graded determinant supplier, README.md:109 | R²[0], [R→R] with identity, R in degree 1 | Grades 2,0,−1; determinant exchange on R² is −1; identity complex determinant trivialization sends compatible bases to 1 |
| Integral pairing supplier, README.md:135 | ℙ¹ with O(1); relative degree-two divisor; genus-two ω | Self-symmetry −1 versus bare Koszul +1; scalar u gives u² on the degree-two norm; ω self-symmetry +1 versus bare Koszul −1, repaired by χ(O)=−1 |
| C1, README.md:745 | N=Â²; rank 0; non-retraction i=0,r=0 on N=Â | Rank-two projections preserve two coordinates; rank zero gives 0; on rank one r∘i=0≠id, so the retraction hypothesis excludes the false assembly |
| C2, README.md:749 | L=R, N=Â², h(1)=(1,1/3) in R̂² | h(v)=(v,v/3); at level 3 this is (v,3v); projecting h and evaluating first both give that pair; no Â-action on L is needed |
| C3, README.md:753 | Coefficient 1/3 and n=3 | Both coefficient-completion routes send 1/3 to 3 in Q₃; at n=2 both give 3 modulo 4 |
| C4, README.md:757 | n=0,1,3 | B₀=Q₀=0; B₁=𝔽₂; B₃=ℤ/8; coefficient 2 acts by 0 at n=1 and by nonzero 2 at n=3 |
| C5, README.md:761 | r=0,1,2 | Coordinates are respectively empty, (σ₃), and (σ₃,3σ₃); rank-two inverse reconstructs σ₃⊗(1,1/3); σ₃=1+2v+4v² |
| C6, README.md:765 | N=ℤ/2, then N=ℤ₂² | N is not ℤ-flat but both finite tensor bases give Q₃/2Q₃; for rank two both give Q₃² and send σ⊗(1,1/3) to (σ₃,3σ₃) |
| C7, README.md:769 | Transition n=3→2 | (1+2v+4v²,3+6v+4v²) reduces to (1+2v,3+2v) in both the original-base and completed-base diagrams |
| C8, README.md:773 | M=ℤ/2 and zero module | ε(u)=0, ε(v)=u; evaluation of v on (incl,ε) gives (v,u), both still nonzero as appropriate modulo 2; M=0 gives zero on each side |
| C9, README.md:777 | ℤ→𝔽₂, parameters zero; multiplication by 2 | c=b=u, d=v, a=0; ε(v)=u specializes to u; m(2)(v)=2v specializes to 0 on either route; this is coefficient base change, not a flat ambient extension |

### Lean declaration table

| Declaration | Section and full context | Instances and computed values | Result/change |
|---|---|---|---|
| pointedNodeEquation | §2.9; A : Type u, CommRing A; γ,δ,s,t : A | ℤ, zero parameters: F=X²; 𝔽₂, γ=1: F=X²+XY; ℤ/4, s=1: F=X²−1; zero ring: F=0, leading coefficient 0=1, natDegree 0 | Real body matches; no degree-two claim over zero ring |
| pointedNodeRing | §2.9; same explicit context | ℤ fixture: ℤ[v]⊕uℤ[v], u²=0; 𝔽₂ fixture: u²=uv; zero ring: one element | Actual quotient; no ambient arbitrary-coordinate substitution |
| pointedSectionIdeal | §2.9; same explicit context | ℤ fixture J=(u,v); ℤ/4,s=1 gives (u−1,v); zero ring J=0; ev(u−s)=s−s=0 | Native ideal and scalar ring retained |
| nodePhi | §2.8; same explicit context | ℤ zero parameters: [[0,u],[−u,v]]; 𝔽₂,γ=1: [[u,u],[u,v]] | Entry signs agree |
| nodePsi | §2.8; same explicit context | ℤ fixture: [[v,−u],[u,0]]; both products have diagonal u²=0 and off-diagonal 0; zero ring: zero matrices on zero modules | Adjugate agrees |
| nodeSection_universallyExact | Layer 2; A : Type u, CommRing; parameters; N : Type v, AddCommGroup N, Module A N | ℤ,N=ℤ/2,zero parameters: ker Φ=im Ψ={(vh+uf,uh)}; ker Ψ=im Φ={(uh,−uf+vh)} over (ℤ/2)[v]⊕u(ℤ/2)[v]. Transposes follow by p(x,y)=(−y,x). N=0 and A=0 give ker=image=0. Specializing u=v=0 in ℤ instead gives ker=ℤ²≠0=image and is outside the quotient theorem | Sound on computed fixtures; no lost binder; deep, not one-tactic padding |
| pointedSection_reflexive | Layer 2; A : Type u, CommRing; parameters; native R and J, both R-linear duals | ℤ fixture: ε(u)=0, ε(v)=u, vε=u·incl; F∈D* determined by F(incl)=j∈J and F(ε)=ε(j); η⁻¹(F)=F(incl), so both composites evaluate to j and F. Zero ring: bijection 0→0. ℤ/4,s=1: ε(u−1)=0, ε(v)=u+1 | Native bidual evaluation, not arbitrary abstract equivalence; same universes/instances as README |

### Sampled adversarial target computations

These 28 retained rows sample the 594-target ledger. Each records a restricted instance, not a formal proof of the universal target. Parameters in the polynomial rows are as displayed; R=ℤ[u,v]/(u²) unless changed. Completion rows use the same genuine compatible element σ=Σ2ᵏvᵏ, with polynomial truncations modulo 2ⁿ. A finite-free instance does not certify the general finite-projective construction. The zero ring and N=0 give zero carriers in all polynomial rows, but not a discriminating replacement for the displayed nonzero values.

| README target and line | Instance/context | Computed values | Result/change |
|---|---|---|---|
| §0.2 Genus and cohomology over arbitrary bases (README.md:270) | smooth g=0,1,2 fibres; square-zero constant family | (h⁰(O),h¹(O))=(1,0),(1,1),(1,2); ranks after adjoining ε remain (1,g) | No counterexample on this instance |
| §0.3 Log dualizing sheaves over arbitrary bases (README.md:284) | ℙ¹ with 0,1,∞; g=1 with one mark | log dualizing degrees −2+3=1 and 0+1=1; two-pointed ℙ¹ gives 0 and is unstable | No counterexample on this instance |
| §1.2 Arbitrary-base tricanonical comparison (README.md:450) | stable g=2 curve; smooth hyperelliptic control | h⁰(ω³)=5 and deg ω³=6; ω² has h⁰=3 and H¹=0 but factors through a double cover, so these properties alone do not prove very ampleness | R10: exact exponent-three supplier input is missing |
| §1.6 Projective frames and the base-line twist (README.md:535) | constant g=2 curve over ℙ¹, twist by B=O(1) | ω³ and ω³⊗f*B give the same relative projective map; GL frames differ by B; PGL₅ dimension=25−1=24 | No counterexample on this instance |
| §1.9 A single graph polynomial for stable-curve isomorphisms (README.md:590) | g=2 identity graph | Segre polarization restricts to ω⁶; χ(ω^(6m))=12m−1; degree-one value=11 on both graph descriptions | No counterexample on this instance |
| §1.12 The normalization sequence and the deformation dimension (README.md:647) | g=2 with one node; algebraically closed k in characteristic 0 or 2 | unframed tangent dimension 3, locally trivial dimension 2, smoothing dimension 1; framed dimension=3+24=27 | No counterexample on this instance |
| §1.15 Transverse relative boundary charts (README.md:703) | one and two labelled nodes | boundary ideals (t) and (t₁t₂); intersections t₁=t₂=0 have codimension 2; swapping labels preserves product | No counterexample on this instance |
| §2.1 The binary quadratic node form (README.md:781) | 𝔽₂,γ=1,δ=0; γ=δ=0 | discriminant 1−0=1 versus 0; q=X(X+Y) versus X²; for u=1,v=0 infinitesimal correction μ=0,ν=1 gives q(x,y+ε)−q(x,y)=εx | No counterexample on this instance |
| §2.3 Coefficient Hom and matrix transpose (README.md:819) | A=ℤ, zero parameters; linear functional h(x,y)=2x+3y | h∘Ψ=(2v+3u)x−2uy; Ψᵀ(2,3) gives the same coefficients; h∘Φ=−3ux+(2u+3v)y; successive composite=0; ideal phase starts with Ψ | No counterexample on this instance |
| §2.9 Polynomial ring of a pointed section (README.md:928) | A=ℤ, all parameters 0; A=0 | F=X², E(2+3u+4v)=(2+4Y,3), reconstruction 2+4v+3u; nonzero-base degree 2; zero-ring polynomial degree 0 and module 0 | No counterexample on this instance |
| §2.162 Normal form in the actual section dual (README.md:3521) | A=ℤ, all parameters 0 | D≃R⊕ℤ; h=2incl+3ε has coordinates (2,3), values h(u)=2u,h(v)=2v+3u; zero-base coordinates (0,0) | No counterexample on this instance |
| §2.186 Completed-chart coefficient-linear evaluation (README.md:3935) | A=ℤ,p=2,R=ℤ[u,v]/u²,m=2R,N=ℤ₂²; σ=Σ2ᵏvᵏ | 1/3 acts as 3 modulo 8: 3(1+2v+4v²)=3+6v+4v²; reducing to level 2 gives 3+2v; both original/completed scalar routes agree | R02: the inverse-of-3 value is already forced by ℤ-linearity |
| §2.351 Coefficient-valued bidual equivalence (README.md:6631) | A=ℤ, all parameters 0; N=ℤ/2; coefficient map ×3 | ε⊗1 evaluates (u,v) to (0,u⊗1); v⊗1 evaluates (incl,ε) to (v⊗1,u⊗1); ×3 is identity on N so both naturality paths give those same ordered pairs | R03: missing native acceptance headline |
| §2.438 Positive derived-functor Ext vanishing for the section ideal (README.md:8035) | A=ℤ, all parameters 0; N=ℤ/2; degrees 0,1,2 | Ext¹(J,R⊗N)=Ext²(J,R⊗N)=0 and the same for D; H¹=H²=0; H⁰(J,R⊗N) contains nonzero ε⊗1, so positive-degree restriction matters | R03: missing native acceptance headline |
| §2.452 Universal coefficient criterion (README.md:8295) | A=R=ℤ; M=ℤ or ℤ/2 | M=ℤ: both evaluation maps identify n with evaluation at 1, Extⁱ=0 for i>0; M=ℤ/2: M*=0, β_(ℤ/2):ℤ/2→0 not bijective, Ext¹(M,ℤ)=ℤ/2, and M not flat | R11: native module criterion absent from acceptance file |
| §2.476 Recovery of the labelled rational triangle (README.md:8669) | rational triangle attached to smooth/nodal genus-one component | fixed nodes=4; total nodes=4 or 5; ambient M̄₂,₂ dimension=5; killing four fixed coordinates gives dimension 1, not 0 | R06: correct lemma tag |
| §3.1 Separating clutching morphism (README.md:8781) | three distinct elliptic components in a chain; theta graph | genus=3, two elliptic-tail node choices; theta curve genus=2, 3 nodes, 6 ordered branches; Aut graph order=12 and chosen-node stabilizer order=4 | No counterexample on this instance |
| §4.2 Uniform integral tricanonical equations (README.md:9108) | g=2, tricanonical frame | rank E₃=5; Sym² rank=15; rank E₆=11; when surjective kernel rank=4; degree-one kernel rank=0 | R04: consume existing uniform-equations owner |
| §4.8 Nefness on pointed normalization components (README.md:9219) | two colliding weights 2, m=2 on ℙ¹×ℙ¹ | exceptional coefficient 2−2−2=−2; b_*O(−2E)=I_p², not O; example bundle degrees 2 before and 0 after blowup; elliptic product has χ=0 | R07: retain positivity gap, import canonical formula |
| §4.10 The fine smooth full-level curve scheme (README.md:9249) | hyperelliptic involution, N=2 and N=3 | on torsion −I equals I mod2 but differs mod3; N=3 stabilizer=1; dimension g=2 is 3 | R08: import characteristic-zero construction, extend integrally |
| §5.1 The Hodge bundle of stable pointed curves (README.md:9388) | g=0,1,2; derived O and ω | Hodge ranks 0,1,2; det rank-zero=O; grades χ(O)=1−g and χ(ω)=g−1; ungraded determinant lines both λ | No counterexample on this instance |
| §5.2 The universal boundary Cartier divisor (README.md:9420) | xy=π² and zw=π³ over DVR | boundary lengths 2 and 3; product smoothing section valuation=5; reduced support alone would give 1 instead of 5 | No counterexample on this instance |
| §5.14 Dualizing Deligne pairing (README.md:9592) | ℙ¹,L=M=O(1); genus-two L=M=ω | Deligne diagonal symmetry −1 and +1; bare Koszul symmetry +1 and −1; correction (−1)^χ(O)=−1 in both cases gives required values | No counterexample on this instance |
| §5.16 Rational Noether identity (README.md:9634) | genus-two (2,3) pencil on ℙ¹×ℙ¹, 12 blowups | K²=8−12=−4, κ=4, deg λ=2, δ=20; 12·2=4+20=24; defect degree 24−4−20=0; wrong boundary sign gives 40 | No counterexample on this instance |
| §6.1 Maximal variation of a curve family (README.md:9755) | constant C×A¹; quadratic twist needing degree-2 extension | base dimension=1, moduli-image dimension=0; graph retains dimension 1; normalization in degree-2 isomorphism field retains degree 2, image field alone degree 1 | No counterexample on this instance |
| §6.9 Nef and big Hodge line for maximal variation (README.md:9908) | isotrivial projective curve; finite degree-e map; dimension 0 | constant Hodge degree=0 so not big; finite pullback has top intersection e·(L^d); d=0 gives degree positive and big; inseparable e=p still multiplies by p | No counterexample on this instance |
| §7.5 The groupoid of lifts of a relative class (README.md:10229) | constant family over ℙ¹ or k[ε]/ε² | f*O(1) and O give same relative class but distinct lifts; lift classes differ by Pic(ℙ¹)=ℤ; infinitesimal scalar automorphisms 1+εa survive; zero obstruction permits lifts | No counterexample on this instance |
| §7.9 Fixed-curve infinitesimal Picard points (README.md:10315) | fixed smooth genus-two curve over dual numbers | kernel of Pic(C_k[ε])→Pic(C) is H¹(O_C)ε of dimension2; automorphisms reducing to 1 are 1+εk of dimension1 | No counterexample on this instance |

### Source locator inventory

| Source | Extracted lines | Locator inspected | Result |
|---|---|---|---|
| mumford1977 | mumford1977 line 2070–2240 | Theorem 5.10; Lemma 5.14; integral descent and boundary twists | verified |
| milne | milne line 1713–1745 | Theorem 12.1, both signs and hyperelliptic distinction | verified |
| dm | dm line 1205–1325 | Proposition 5.8 through Theorem 5.16; component and level hypotheses | verified; self-reference erratum below |
| knudsen2012 | knudsen2012 line 400–525 | Proposition 3.1, Corollary 3.2; matrix signs, dual quotient, nodal hypotheses | verified; arbitrary-ring extension is a new proof obligation |
| ile | ile line 256–372; 896–947; 993–1023 | Definitions 3.1, 3.4; Proposition 3.5; Theorem 6.1; Remark 6.4 and Example 6.5 | verified |
| clm | clm line 23–42; 870–1145 | Lemma 6.4, Propositions 6.3, 6.7 and normalization step | verified; errors and proof gap below |
| yuan-author-http | yuan-author-http line 1480–1565 | Section 3.1.4, stable compactification and level application | verified; compactification step corrected in package |
| dgh | dgh line 1137–1168 | Section 6.1, fine curve level and Torelli | verified |
| stacks-hom-flat | stacks-hom-flat line 7837–7845 | Lemma 67.4, tag 087R | verified |
| stacks-completion | stacks-completion line 11107–11122 | Lemma 99.11, tag 0523 | verified |
| stacks-projective-bundles-review | stacks-projective-bundles-review line 2137–2164 | Definition 27.21.1; quotient projectivization | verified |
| stacks-projective-picard-review | stacks-projective-picard-review line 3204–3225 | Lemma 29.5, tag 0BXJ | verified; rank-zero projective-space exception below |
| clp-normalized-boundary-review | clp-normalized-boundary-review line 180–208 | Lemma 2.1; graph automorphisms and normalized strata | verified |
| stacks-noetherian-valuative-KKjBS6 | stacks-noetherian-valuative-KKjBS6 line 1900–1932 | Lemma 15.3, tag 0208; source-density hypotheses | verified |
| av-moduli-consumer-LwkQQl | av-moduli-consumer-LwkQQl line 1727–1760 | Section 5.1; family and stack input | verified |
| chen-moduli-consumer-LwkQQl | chen-moduli-consumer-LwkQQl line 107–136 | Introduction; elliptic stack versus coarse j-line | verified |
| ll-moduli-consumer-LwkQQl | ll-moduli-consumer-LwkQQl line 430–463 | Notation 1.10.1; pointed versal family | verified |
| mc0-stacks-curves | mc0-stacks-curves line 2158–2174 | Lemma 20.1, tag 0C59 | verified; R06 |
| mc0-stacks-moduli | mc0-stacks-moduli line 865–898 | Lemma 19.1, tag 0E6P; arbitrary-base CM curves | verified |
| mc0-stacks-duality | mc0-stacks-duality line 3547–3580 | Lemma 28.10, tag 0E30 | verified |
| mc0-stacks-perfect | mc0-stacks-perfect line 3421–3451 | Lemma 30.4, tag 0B91 | verified |
| mc0-stacks-descent | mc0-stacks-descent line 974–1007 | Lemma 13.1, tag 0D3C; ample descent and schemes | verified |
| mc0-stacks-quot | mc0-stacks-quot line 1828–1840 | Lemma 14.8, tag 0D43 | verified |
| mc1-perf | mc1-perf line 2805–2838 | Lemma 25.4, tag 0CTM | verified; wrong base in part (2) below |
| mc1-def | mc1-def line 1265–1279 | Lemma 16.4, tag 0DZQ | verified |
| mc1-etale | mc1-etale line 1235–1268 | Lemma 21.6, tag 0CBR | verified |
| mc1-stackdim | mc1-stackdim line 450–545 | Definitions and Lemmas 107.5.2–107.5.7 | verified; proof sign below |
| mc1-stackval | mc1-stackval line 1328–1355 | Lemma 11.1, tag 0H2B | verified |
| mc2-stacks-unramified-diagonal | mc2-stacks-unramified-diagonal line 3434–3447 | Lemma 36.13, tag 02GE | verified |
| mc3-polishchuk | mc3-polishchuk line 88–119 | Theorems 1.1–1.2; formal gluing and rational scope | verified |
| mc3-stacks-norm | mc3-stacks-norm line 4602–4632 | Lemmas 101.46.1–101.46.2; normalization versus finiteness | verified |
| mc4-serre | mc4-serre line 561–619 | Appendix; level at least three and finite-order rigidity | partial OCR certification |
| mc4-ehkv | mc4-ehkv line 191–202 | Theorem 2.7; finite scheme cover | verified |
| mc4-ekedahl | mc4-ekedahl line 1135–1175 | Theorem II.1.7; positive-characteristic exception | partial OCR certification |
| mc4-chen-zhang | mc4-chen-zhang line 56–86 | Theorem 1.3; Kodaira dimension in positive characteristic | verified |
| mc4-stacks | mc4-stacks line 2058–2089 | Lemma 16.2, tag 02O1 | verified |
| mc5-deligne1987 | mc5-deligne1987 line 1641–1727 | Sections 6.1–6.4; symbols, norms and symmetry | partial OCR certification |
| mc5-knudsenmumford1976 | mc5-knudsenmumford1976 line 75–115 | Chapter I; integer grades and determinant convention | partial OCR certification |
| mc5-edidingraham1997 | mc5-edidingraham1997 line 250–310 | Theorem 1 and Lemma 2; equivariant Picard comparison | verified |
| mc5-edidingraham1999 | mc5-edidingraham1999 line 512–541 | Theorem 3.1; equivariant Riemann–Roch | verified |
| mc5-luo1998 | mc5-luo1998 line 75–104 | Main theorem; generating Dehn twists | verified |
| mc5-hall2011 | mc5-hall2011 line 22–50 | Theorem 1; proper complex Deligne–Mumford stack comparison | verified |
| mc5-fredianineumann2004 | mc5-fredianineumann2004 line 750–800 | Proposition 2.14; analytic homotopy type | verified; erroneous product identification below |
| mc6-stacksregular | mc6-stacksregular line 427–454 | Lemma 7.6; normal locally Noetherian components | verified |
| knudsen2 | knudsen2 line 937–1085 | Corollary 3.9 and Appendix Definition 1, Theorem 2, Propositions 4–7 | verified; Corollary 3.9(b) false |
| knudsen3 | knudsen3 line 42–145 | Theorems 4.1–4.2; forgetting and clutching line comparisons | partial OCR certification |
| hacking-boundary-review | hacking-boundary-review line 412–425 | Lemma 4.2; conormal marking factors | verified within characteristic-zero scope |
| mc3-edidin-fulghesu | mc3-edidin-fulghesu line 534–565 | Theorem 4.7; graph quotient and normalization | verified |
| mc5-erikssonfreixas2024 | mc5-erikssonfreixas2024 line 2888–2916; 3140–3238 | Propositions 6.1, 6.8 and Corollary 6.9; integral symmetry and K-theory comparison | verified; projection-formula misprint below |

## Not verifiable

- **Fresh Lean elaboration:** prohibited for this review. The seven supplied elaborated signatures were compared, but the proposed additions in R03/R11 were not elaborated. Their carriers and relevant pinned declarations were read directly.
- **Settled book citations:** blr-relative-picard-LwkQQl (Néron Models, relative Picard locators) and mc6-fc1990 (Degeneration of Abelian Varieties, minimal-compactification locators) are uncertified as instructed. They were not requested again.
- **OCR formulas:** mc4-serre's congruence exponents, mc4-ekedahl's full exception list, mc5-deligne1987's self-symmetry formula, mc5-knudsenmumford1976's exponent in the graded interchange, and parts of knudsen3's displayed pullback formulas cannot be certified from the extraction alone. The Deligne symmetry sign is independently visible in mc5-erikssonfreixas2024 line 2894. No suspected OCR slip is entered as a source misprint.
- **Secondary locator and supplier coverage:** the source table identifies the primary blocks actually inspected. It does not certify every secondary locator in the long repeated proof plans. Name resolution and object searches likewise do not certify the full hypotheses of every cross-roadmap section; the twelve supplier groups inspected in detail are listed above. These limits are not evidence that an uninspected citation is wrong.
- **Universality from examples:** the 594 target computations recorded during review (sampled above) are adversarial instances, not proofs of all universal statements. In particular, finite-free completion examples alone do not certify finite-projective assembly or arbitrary completed-coefficient exchange. The general theorems remain proof obligations with the stated suppliers and gaps.
- **Unprovided open heads:** ownership was checked against all 55 sibling folders supplied in the brief and the permitted roadmap index; no independent search was made for additional unprovided pull-request files.

## Source issues

- **Misprint** in dm at Theorem 5.13 proof, printed p.107 (dm line 1263): the source says its reduction to the complex fibre follows from Theorem 5.13 itself; it should be Corollary 5.11, which supplies the constant component count; affects the proof.
- **Error** in knudsen2 at Corollary 3.9(b), printed p.190 (knudsen2 line 939): the source says unequal genera or a marking make separating clutching a closed immersion; it should be finite unramified, generally with multiple node choices, as a three-elliptic-component chain demonstrates; affects a stated result.
- **Error** in knudsen2 at Theorem 3.7 proof, printed p.189 (knudsen2 line 902; correction documented in ile, arXiv:1110.3909v3, Remark 6.4 and Example 6.5, pp.20–21): the source says the section ideal times its dual equals the section ideal for a moving nodal section; it should be restricted to a persistent singular section, with the moving-section image computed separately; affects the proof.
- **Error** in clm at Introduction, printed p.1 (clm line 31): the source says the coarse stable-curve moduli scheme is smooth over the integers; it should be projective, with possible quotient singularities; smoothness belongs to the moduli stack; affects a stated result.
- **Error** in clm at Proposition 6.3 proof, printed p.25 (clm line 986): the source says contraction of a smooth exceptional curve preserves the canonical line by pullback; it should be ω_S=b*ω_(S′)⊗O(E), with pluricanonical pushforward invariance proved using b_*O(mE)=O; affects the proof.
- **Error** in clm at Corollary 6.6 proof, printed p.25 (clm line 1004): the source says the marked pluricanonical higher direct image vanishes by fibre degrees for the stated nodal families; it should be replaced by generic vanishing and the saturated-image argument; an unstable rational tail prevents the asserted fibrewise vanishing; affects the proof.
- **Gap** in clm at Proposition 6.7 proof, printed p.25 (clm lines 1016–1018): the source says the unweighted blowup argument also separates colliding weighted sections while retaining nefness; it should be justified by a weighted comparison retaining m−Σa_i, which can equal −2; affects the proof.
- **Error** in yuan-author-http at §3.1.4, printed p.45 (yuan-author-http line 1538): the source says closing the covered base in level moduli gives its stable compactification; it should be a graph closure retaining the base function field and any required isomorphism extension; affects the proof.
- **Misprint** in mc5-fredianineumann2004 at §2, proof preceding Proposition 2.14, printed p.18 (mc5-fredianineumann2004 line 753): the source says the fibre over a fixed Teichmüller point is the whole Teichmüller space times the normalizer; it should be the normalizer, with the Teichmüller factor belonging to the total arrow space; affects the proof.
- **Error** in mc5-fredianineumann2004 at Proposition 2.14 proof, printed p.19 (mc5-fredianineumann2004 lines 780–786): the source says the Čech nerve and its realization are products with the classifying space; it should be the action-groupoid nerve and Borel construction, whose homotopy equivalence follows from contractibility; affects the proof.
- **Misprint** in mc5-erikssonfreixas2024 at Proposition 6.8 proof, printed p.317 (mc5-erikssonfreixas2024 lines 3192–3198): the source says the left projection-formula factor is [E]−r while the right factor has γ^(k₀); it should be γ^(k₀)([E]−r) on both sides; affects the proof.
- **Error** in stacks-projective-picard-review at Lemma 31.29.5, tag 0BXJ, printed pp.70–71 (stacks-projective-picard-review line 3204): the source says Pic(ℙⁿ_R)=ℤ for a UFD without restricting n; it should be restricted to n≥1; Pic(ℙ⁰_k)=0; affects a stated result.
- **Misprint** in mc1-perf at Lemma 75.25.4(2), tag 0CTM, printed p.62 (mc1-perf line 2811): the source says the sheaf is flat over S; it should be flat over Y; the immersion Spec k→Spec k[ε]/ε² over S=Spec k otherwise disproves perfectness; affects a stated result.
- **Misprint** in mc1-stackdim at Lemma 107.5.5 proof, tag 0DRJ, printed p.11 (mc1-stackdim line 485): the source says to add the atlas's relative dimension; it should be subtracted, as in the statement: dim(BG_m)=0−1=−1; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ef5dd7894c649703e2d497f5bc558d02c73b1caa", "job": "RT-StableReductionPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
