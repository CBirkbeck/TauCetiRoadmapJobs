<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6395687086 -->
Review (codex) of afa4dea

Verdict: needs_changes

1. **F01** (P2) The type-(c) ratio equivalence admits the zero algebra

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:1272`, repeated at lines 1285, 1084 and 1089: “For a split algebra A ... A is of type (c) ... exactly when size_v(Σ_A) ≥ 1/(d + 1).”

   **Claim:** Splitting alone makes the cardinality definition equivalent to the proportion inequality. However, line 25 and §8.1 define the proportion only for nonempty sets; split algebras include the empty product.

   **Witness:** Take A=0=ℚₚ^∅ and d=1. Then Σ_A=∅ and §6.9 gives 0≥0, true. The ratio is undefined; totalising 0/0 as 0 gives 0≥1/2, false.

   **Exact repair:** Require A≠0 in both §8.1 equivalences and line 1089, and require Σ nonempty in line 1084. Keep the cardinality definition on arbitrary algebras. Add the zero-algebra negative control explicitly; do not silently redefine size_v(∅). A nonzero split algebra has #Σ_A=dim A>0, which justifies division. Retested: A=ℚₚ gives 1≥1/2 on both sides; a five-point transitive algebra gives 0≥5/2 and 0≥1/2, both false. For A=0 the cardinality statement remains true and the repaired ratio assertion no longer applies. Geometric fibre applications remain within scope because the finite étale map is a covering, as line 27 requires.

2. **F02** (P3) Several new definitions lack their API and three discriminating Checks

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:807`, 1180, 1230 and 1300; also the bare API entries at 1085–1087. These define “H^{≤1}_pH(X_y/K_v)”, the two period loci and n_v. The lone §7.7 Check says “No global input is used”.

   **Claim:** These are definitions owned here, so each needs a prose API and at least three computed, discriminating Checks.

   **Witness:** Sections 5.1, 7.4, 7.7 and 8.2 each have one Check and no API list. Section 7.7 computes nothing. Lines 1085–1087 list locus names rather than API assertions.

   **Exact repair:** Add the following APIs and tests in the README, without adding acceptance-file padding.

   - In §5.1 list the two realisations, compatibility with the supplied comparison, perfect alternating pairing and finite-field-extension compatibility. Replace the elliptic restatement by computations: an elliptic fibre has ranks (1,2), jumps (0,1), pairing-target jump 1 and pairing values 1,−1 in a symplectic basis; a two-component elliptic fibre has ranks (2,4) and H⁰_dR=F×F; an elliptic fibre over a quadratic finite-base field L/F has the same ranks but H⁰_dR=L, not F×F. The last two distinguish equal-dimensional, nonisomorphic coefficient algebras.
   - In §7.4 list containment in the full S-good period locus, monotonicity under enlargement of S, invariance under the unfiltered pair's automorphism group and non-density. Keep the degree-<4 empty-set Check. Add a constant family with a degree-four coefficient field inert at v and a globally GSp-irreducible elliptic fibre: its actual Hodge point belongs to the locus, whereas the degree-one constant elliptic family gives the empty type-(a) locus. Compute the boundary (d,r)=(1,4): orbit dimension ≤3<4, versus 3=3 at r=3. These tests distinguish an empty definition, the whole period domain and an erroneously lowered index threshold.
   - In §7.7 list automorphism invariance, containment of type-(b) local period images and non-density; put the proof-route observation in the proof paragraph. Test index one (empty locus); a degree-four coefficient field and an ordinary CM elliptic fibre at a split CM place (the stable weight-one line has dimension 1, is isotropic, and has average jump 1≥1/2, so the actual Hodge point belongs); and the four-line negative control from §7.6 (no common line meets all four in dimension ≥1/2). This excludes the empty locus, an omitted index condition and an omitted common-subobject condition.

   - In §8.2 list finiteness, invariance under the choice of algebraic closure, the degree-dependent bound and the tame count as API facts. Give separate Checks for ℚ₅ (three quadratic subfields, one unramified cubic and three conjugate nonnormal cubics: 7), ℚ₇ (three quadratic and four normal cubic subfields: 7), and ℚ₂ (seven quadratic and four cubic subfields: 11). Counting cubic isomorphism classes instead would give 2 rather than 4 over ℚ₅, hence the wrong total 5. Expand §6.9's three bare locus names into their membership equivalences, retaining the global S-good quantifier for (a), the actual local fibre for (b), and the coefficient algebra for (c). Its existing index-one tests then give (a)=false, (b)=false, (c)=true.

   The new positive period-locus examples use constant abelian-by-finite families; these non-density definitions require no full-monodromy assumption. This is the residual pattern from previous F06; its specifically requested §6.6 and §7.6 repairs are correct.

3. **F03** (P3) The unequal-fibre Check also drops surjectivity

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:1293`: “The monotonicity needs equal fibres”, followed by a map whose fibre sizes are 4,0,0,0,0.

   **Claim:** The example isolates the equal-fibre hypothesis of the monotonicity theorem for equivariant surjections.

   **Witness:** Four fixed points cannot surject onto a fixed point plus a four-orbit. The example also violates surjectivity, so it does not distinguish constant from variable positive fibre sizes.

   **Exact repair:** Replace it by the equivariant surjection from four fixed points disjoint union a regular C₄-orbit to one fixed point disjoint union the same orbit. Collapse the fixed points and use the identity on the orbit. The five fibre sizes are 4,1,1,1,1; the proportions are 4/8=1/2 and 1/5. Thus 1/2>1/5 while surjectivity and positivity hold. A quotient of G_v onto C₄ is supplied by its unramified quotient, so this is an actual continuous G_v-set test at every finite v.

4. **F04** (P3) Proper compactness is attributed to the étale-inverse subsection

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:65`: “Section 2.11a supplies local topology and proper compactness.”

   **Claim:** HeightsRationalPointsAndObstructions §2.11a contains the proper-compactness input used to obtain a finite disc cover.

   **Witness:** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:1061` states local étale inverses and smooth openness. Proper compact local products occur at lines 912 and 1050, in §§2.3a and 2.11.

   **Exact repair:** Cite §§2.3a and 2.11 for proper local-point compactness/product topology; retain §2.11a for local étale charts. Add that compactness input to §6.3's Needs line, which §7.5 and §7.8 consume. This is a locator repair, not an unowned prerequisite: §2.3a is already within the contract's cited §§2.3–2.4. Retested: P¹(F) is compact; the sequence p^(−n), n≥1, in A¹(F) is unbounded and has no such finite compact-disc cover. Étale local invertibility alone distinguishes neither case.

Four findings: one P2 and three P3. The headline mathematics survives the source and boundary-case checks below. The blocking defect is a missing nonemptiness hypothesis in an auxiliary equivalence. No package input was edited.

## Verified sound

### Earlier findings, checked before the new pass

The earlier review and repair report were read finding by finding. None was marked not actionable, so no settled finding is being re-raised. Quotes below are from the repaired package, not from sources. The earlier computed rows were used as a checklist; the calculations recorded below were recomputed. All 59 numbered sections were read, including every changed passage and every target in the seeded sample.

| Previous finding | Repaired passage and location in package README | Status and independent evidence |
| --- | --- | --- |
| F01: redundant full-faithfulness gap | §2.1: “fully faithful symmetric monoidal functor” | Repaired. D_pH is an owned assembly of finite descent and supplied period functors. Hom(1,1)=ℚₚ and Hom(1,ℚₚ(1))=0; bs line 464. Deleted gap is absent from README and plan. |
| F02: overbroad polyannulus gap | §4.1: “q ∘ s_y = id” | Repaired. Integral systems, finite étale equivalence and pro-étale passage have distinct resolved owners. The point-fibre compatibility is proved here; rank-zero base gives q=s=id. |
| F03: unrestricted symplectic finiteness | line 85: “GSp-irreducible symplectic ℚₚ-representations” | Repaired. Fixed n,d,B,S precede the finite-class assertion, and §§7.1–7.2 use that contract. A nontrivial unipotent plane has a stable isotropic line and is excluded. |
| F04: ambiguous references/headline omission | §9.1: “With §1.8 and §6.4”; Lean docstring: “README §9.3” | Repaired. Own sections and source theorem numbers are separated; the self-conjugate Selmer theorem is in the missing-carrier inventory. |
| F05: unresolved shorthand | §6.3: “Y is a smooth projective curve”; “MordellLawrenceVenkatesh §3.18” | Repaired. P8, E3 and SPM labels are absent. Properness and the period-density supplier are explicit. |
| F06: restating Checks and malformed block | §6.6: “b=a₁²=c a₂²”; §7.6: “all r filtrations equal span(e)” | Partly repaired. The requested nonsquare/common-line test and three §7.6 tests are correct, and Needs is separated. R02 and R03 record surviving Check defects elsewhere. |
| F07: false universal reflexivity | §3.1: “v is self-conjugate when v is conjugate to itself” | Repaired. In ℚ(i), 3 is fixed, 5 has exchanged factors and 2 is fixed but ramified. §9.2 specifies inertia in E_K/E_K⁺. |
| F08: crystalline locator drift | line 79: “§4.3 supplies Frobenius-centralizer orbits” | Repaired. Crystalline transport is correctly assigned to §§2.11,4.1–4.2, retaining the unramified p>2 range. Model-free extensions remain declared gaps. |
| F09: Harari–Stix narrowed unnecessarily | §0.5: “geometrically connected separated finite-type” | Repaired. hs lines 11, 391 and 416 permit the general variety in (a); proper genus≥1 is retained only for projected point-section equality in (b). |
| F10: duplicated modified-adeles carrier | §0.4: “Use the modified adelic points of HeightsRationalPointsAndObstructions §3.17d” | Repaired. The new object is the finite-cover locus on that carrier. The imported quotient has one component for Spec K and two real components for y²=x³−x. |

### Principles, shape and acceptance file

The package extends AnabelianGeometryAndNonabelianChabauty §7.1 as a Part II, leaving its existing section-class, Kummer and number-field injectivity targets there. It imports Mordell and Kodaira–Parshin constructions from MordellLawrenceVenkatesh. Its new direction is section interpolation and model-free local period obstructions. No replanning, upward supplier, source copying, algorithmic target, sorry'd data or option override was found. Auxiliary-prime existence is mathematical, and the end theorems retain every finite place, ramification and p=2,3. The original good-prime argument is only a comparison in §8.6.

The README has the required summary, ownership, conventions, contracts, build guide, ten layers, ten Examples blocks, ten Dependencies blocks, downstream consumers and references. All 59 numbered sections have a source locator and Needs line. Definition/API/Check exceptions are R02 and R03; the exact hypothesis exception is R01. Main-branch AdicEtaleGeometry and LocalGaloisGroups were read for house shape. Metadata is math.NT. The manifest contains four unique certified source entries and explicit preprint-version pagination; no source or metadata entry was rewritten.

The content main commit checked was 5078569e9228c1621d251ed1483bae6baf465505. Mathlib and Tau Ceti match the manifest pins 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

The required `lake env lean` elaboration of `packages/GaloisSectionsPadicPeriodMaps/Suggested.lean`, invoked from the pinned content checkout with the required absolute argument, exited 0 with no output and no warnings. The file has exactly `import Mathlib`, one module docstring, the required namespace and zero declarations. No Tau Ceti object needed building. The mechanical inventory for `#check @name` is empty: there are no declaration binders to lose or signatures to compare. The one-tactic padding inventory is likewise empty (zero sorried theorems). No surrogate was added for an unavailable carrier.

| Headline in README | Why its complete statement is not yet native; corresponding docstring entry exists |
| --- | --- |
| §0.5 finite descent/sections | Arithmetic étale fundamental groups, sections and finite-torsor descent |
| §1.8 Selmer inclusion in the adelic LV locus | Section classes and actual relative étale H¹ with fibre functors |
| §2.1 full faithfulness of D_pH | De Rham representations and filtered discrete monodromy modules |
| §2.4 algebraic automorphism groups and bounds | Those module carriers and their automorphism group functors |
| §§3.2,3.4 conjugate weights and average weight | Labelled local de Rham realisations of Galois representations |
| §4.3 horizontal D_pst transport | Rigid polydiscs, de Rham pairs and horizontal semistable realisations |
| §§4.4–4.5,5.3 period control | Actual relative cohomology, Gauss–Manin transport and period maps |
| §6.8 trichotomy | Symplectic Galois pairs with their period/weight interface |
| §§7.4–7.8 non-density and finiteness | Lagrangian period domains, retwists and local-system period maps |
| §§8.4–8.5 exclusion and auxiliary families | The Kodaira–Parshin family and its Galois-equivariant finite-base fibres |
| §9.1 finite local LV locus | The actual family-dependent locus |
| §9.3 self-conjugate Selmer localisation | Curve section classes and localisation to completion points |
| §9.4 Theorem A | The same carriers, at every finite place |
| §9.5 Theorem B | Modified scheme adeles and finite étale torsor descent |

These are 14 groups, matching the module docstring. §9.2's Mordell consequence has the existing owner LV.11. Searches by objects, including filtered monodromy, D_pst, de Rham representations, scheme étale fundamental groups, Selmer sections and Lagrangian Grassmannians, found no pinned carriers sufficient to state these headlines with a few simple definitions. In particular Mathlib's abstract Galois category and B_dR rings do not construct the missing arithmetic categories.

### Source verification

All four cached legal texts were opened. No locator is flagged unverified in the package. All 15 seeded targets were checked against their hypotheses, theorem numbers and printed preprint pages. Here “supported” concerns the theorem; independent repairs to source proof slips are recorded under Source issues.

| Seeded target | Text and locator opened | Hypotheses/generalities checked |
| --- | --- | --- |
| 0.2 local section-map injectivity | stix08 lines 1089–1116, Appendix B Proposition 44, Theorem 45, Remark 46, p.22; continuation p.23 | Smooth proper geometrically connected curve, genus≥1, p-adic field; absence of nonzero infinitely divisible Jacobian points. Real fields are not included. |
| 0.5 Harari–Stix | hs lines 391–421, Theorem 2.1 and remarks, pp.11–12; setup lines 11–57 | General geometrically connected variety, trivial U, S empty, all completions; section conjugacy rather than equality of chosen sections. Proper curve and local injectivity only for (b). |
| 1.3 relative pair | bs lines 2819–2864, §7.1, p.55 | Polarised abelian-by-finite family; H⁰-linear dual pairing from half the Poincaré class, with Tate −1. |
| 1.5 restriction along local points | bs lines 151–159, Remark 1.5, pp.3–4; lines 2894–2905, Proposition 7.2, p.56 | Fibre functors and tensor structures agree, at all places, including archimedean ones. |
| 1.7 adelic LV locus | bs lines 2231–2243, Definition 6.1, p.43 | One global symplectic pair precedes the quantifier over all places; distinct local interpolants are insufficient. |
| 2.1 filtered discrete modules | bs lines 404–466, Definitions 2.6–2.7 and Theorem 2.9, pp.8–9; lines 485–527, §2.2.3, p.10 | Algebraic unramified field, discrete semilinear action, Nφ=pφN; twisted induction scalars and lax monoidal structure; full faithfulness only on de Rham representations. |
| 3.3 self-conjugate pure characters | bs lines 705–720, Remark 2.20, p.14 | ℚₚ-valued, de Rham at p, finitely ramified and pure; cyclotomic exponent −n/2 and finite-order local factor. The README supplies norm descent missing from the abbreviated proof. |
| 4.2 polydisc reduction | bs lines 1508–1524, Lemma 3.23, p.29 | Any finite extension of ℚₚ; residue field with two elements handled through unramified degrees 2 and 3. |
| 4.4 period control of D_pst | bs lines 843–861, Theorem 3.3, pp.16–17; proof lines 1495–1505, p.29 | Smooth proper family and its actual de Rham comparison; no good-reduction or unramified-field assumption. |
| 5.2 retwisted symplectic pairs | bs lines 1897–1915, Definition 4.10, p.37 | Lagrangian H⁰_dR-submodules, filtration steps 0,1,2, preserved discrete data and actual comparison. Half dimension alone is insufficient. |
| 6.5 rational points | bs lines 2281–2286, after Theorem 6.5, p.44, using Lemma 6.4 | Suitable finite S, good global fibre, identical local restriction. No finiteness of rational points is assumed. |
| 7.6 type-(b) non-density | bs lines 2553–2604, Lemma 6.17, p.50; lines 2616–2647, Sublemma 6.18, p.51 | Degree≥4, same isotropic subobject across embeddings, φ,N,G compatibility; the declared four-isotropic-Lagrangian contract is the exact extension needed. |
| 7.8 type-(b) finiteness | bs line 2551, Corollary 6.16, p.50; standing setting line 2231 and compactness line 2222 | Proper smooth curve and full monodromy; non-density alone does not give global finiteness. |
| 8.3 small torsion orbits | bs lines 2714–2725, proof of Proposition 6.20, p.53 | k prime to p and q_v^i−1 for i=1,2,3; quadratic/cubic subfields counted as embedded subfields; fixed points are also covered. |
| 9.3 self-conjugate Selmer finiteness | bs lines 109–115, §1.1, p.3 | Every number field at self-conjugate finite places; no CM-free assumption is needed until Theorem A. |

Also checked stoll lines 127–145 (§2, p.4), 552 (Definition 5.2, p.14), 633 (Definition 5.4, p.16) and 759 (Lemma 5.8, p.19): component quotient, survival by twists, finite-cover locus and simply connected test. The repaired full-faithfulness and polyannulus routes were checked at bs lines 464, 1525, 1558 and 1588. The symplectic finiteness boundary was checked against bs lines 370–384 and 2472–2481. Every other section's source-supported identities and Checks are tested in the calculation tables below.

### Pinned-library and ownership audit

These declarations were opened at the pins, not inferred from names. Paths in this table are relative to the named library repository. The quoted defining fragments also identify what the native object does not provide.

| Declaration | Pinned file and line | Content and boundary verified |
| --- | --- | --- |
| Field.absoluteGaloisGroup; map | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, 87 | Algebraic-closure algebra automorphisms; map chooses an extension embedding. No decomposition embedding is supplied merely by the group definition. |
| ContinuousMonoidHom | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57` | Extends a monoid homomorphism and continuous map; supplies neither compactness nor a chosen topology. |
| ConnectedComponents | `Mathlib/Topology/Connected/Clopen.lean:510` | Quotient by the connected-component setoid; no nonemptiness, Hausdorffness or compactness assumption. |
| HeightOneSpectrum.adicCompletion | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603` | Wrapper around the valuation completion; finite-place selection is extra data. |
| LinearMap.IsAlt | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286` | Defining law `∀ x, B x x = 0`; no perfectness or line target. |
| LinearMap.Nondegenerate | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595` | Left and right separation; finite-dimensionality and a line target still need supplying for this roadmap's perfect pairing. |
| Matrix.symplecticGroup | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` | Equation A J Aᵀ=J; exact preservation, not an independent multiplier. |
| NumberField.IsCMField; ringOfIntegersComplexConj | `Mathlib/NumberTheory/NumberField/CMField.lean:69`, 236 | Totally complex quadratic extension of its maximal real subfield; induced integral conjugation. Neither predicate implies a chosen place is fixed. |
| IntermediateField | `Mathlib/FieldTheory/IntermediateField/Basic.lean:52` | Subalgebra with inverse closure; no degree bound or separability imposed. |
| MulAction.orbit | `Mathlib/GroupTheory/GroupAction/Defs.lean:49` | `Set.range fun g => g • a`; no finiteness or continuity in the definition. |
| Nat.forall_exists_prime_gt_and_eq_mod | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442` | Unit residue class, every lower bound, a larger prime in the class. This is qualitative, not Linnik's polynomial bound. |
| hasSum_zeta_four | `Mathlib/NumberTheory/ZetaValues.lean:457` | Sum indexed by ℕ equals π⁴/90; the n=0 term is zero under totalised real division. |
| TauCeti.Symplectic.groupScheme | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122` | Constant-form group scheme for the standard alternating matrix. Does not contain a free rank-zero similitude multiplier. |
| BDeRhamPlus; BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, 88 | Completed/localised period rings; not de Rham representation functors or filtered discrete modules. |
| PreGaloisCategory | `Mathlib/CategoryTheory/Galois/Basic.lean:66` | Abstract categorical axioms; no arithmetic scheme étale-fundamental-group construction or section carrier. |

Ownership searches used `roadmaps grep` by objects, followed by `roadmaps show` for suppliers, over main and the supplied index of 354 open heads. Searches included section classes, Selmer conditions, finite descent, modified adeles, symplectic pairs, filtered discrete modules, horizontal semistable periods, Lagrangian period domains, Kodaira–Parshin fibres and least primes. All local board packages were searched, then the 20 entries of the supplied board-package index were inspected at their listed heads. Five had package READMEs and fifteen had design READMEs, which were used for scope rather than treating absent root READMEs as absent work. No unlisted pull request was sought.

The closest board designs were `packages/LawrenceVenkateshMethod/design/README.md` at 9ee7ac3 and `packages/PadicHodgeTheoryPartII/design/README.md` at 6502997. The former consolidates the existing LV owners and has no new section-obstruction construction; the latter develops crystalline monodromy/Hodge–Newton period-point questions, not this discrete-module transport assembly. The provided AdmissiblePairsAndPadicHodgeStructures, PadicHodgeRegulators, ColemanIntegrationPartII, CohomologyComparisonsPartII, PeriodsAndSpecialValues and other indexed open work were included in the object searches. Existing flag, cohomology, induction and period inputs remain with the owners below. No second fully qualified Lean declaration can occur here: there are no declarations.

The Linnik search also found AnalyticNumberTheoryPartI §2.49 and SieveMethodsAndPrimePatterns §2.9. The former bounds least prime ideals by a power of the discriminant; cyclotomic discriminants grow with φ(m), so it does not give a fixed power of m. The latter is Linnik's bounded-exceptional-primes quadratic-residue theorem, not the least-prime-in-every-progression theorem. Neither duplicates the declared gap.

### Supplier resolution and order

Every Needs line and supplier citation was read. The 22 suppliers below were resolved against main or their indexed new-roadmap heads; existing-roadmap revisions were not substituted for main. Each path is `TauCetiRoadmap/<supplier>/README.md`; the line anchors are particularly relevant passages, while the sections column records the full consumed range. Source citations alone were not counted as ownership.

| Supplier | Resolved sections and representative file lines | Boundary relevant to this package |
| --- | --- | --- |
| AnabelianGeometryAndNonabelianChabauty | §7.1 (NC.6), lines 7869, 7909, 7939, 7958 | Section classes, point map, Kummer and field-general divisibility criterion; new work begins at completion restriction. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0, IG.0.3, IG.1.3; lines 652, 689, 1266 | Finite étale and integral coefficient systems, fibre functors and characteristic-zero geometric base change. |
| ArithmeticGaloisRepresentations | §§1.3,1.12,2.1; lines 878,1340,1397 | Induction/Shapiro, restriction/Mackey and chosen decomposition maps. The right-translation convention agrees. |
| HeightsRationalPointsAndObstructions | §§2.3–2.4,2.11a,3.1–3.5,3.17d; lines 897,912,1050,1061,1378,1454,1823 | General adeles, twists and modified carrier resolve; compactness subsection corrected by R04. |
| PadicHodgeTheory | §§3.3–3.5,5.1,5.3,7.2–7.3,7.5,8.1–8.2; lines 700,734,1020,1255,1283 | Finite descent, algebraic-unramified D_pst and integral local systems; horizontal specialisation remains a declared extension. Its reported Hodge–Tate sign is negated. |
| CohomologyComparisons | §§6.4–6.7; lines 1255,1265,1282,1300,1310 | Cup, disconnected trace, Tate line, duality, cycles and first Chern classes. The proper projective compactification avoids the source proof gap. |
| MordellLawrenceVenkatesh | §§0.4–0.5,0.9–0.12,0.18,1.2,1.4–1.16,2.1–2.4,2.9,2.11,3.1–3.19,4.1–4.3; LV.7–LV.8,LV.10–LV.11 | Lines 808,1117,1196,1541,1552,1608,2249,2509,2531 distinguish the existing finiteness, good-model, five-Lagrangian and global-point fibre results from the five declared extensions. |
| AbelianSchemesAndArithmeticModuli | A3.5,A3.7,A4.3–A4.4,A6.30–A6.31; lines 1451,1569,1841,1882,3563,3584 | Polarisation, Hodge/exterior cohomology and Weil restriction. Rational characteristic zero makes nonzero polarisation degree invertible; product splitting needs separability. |
| AlgebraicModuliForArithmeticGeometry | §1.3, line 578 | Partial flags require locally free quotients; empty flag and base change included. |
| AdicEtaleGeometry | A1.1,A1.3, lines 2285,2950 | Strongly sheafy affinoids and finite étale equivalence. Finite étale alone is not surjective; covering requires positive local degree. |
| AdicSpacesPartII | R1, especially R1.3,R1.7, lines 8399,8968,9806 | Analytification and rigid/adic comparison on the noetherian affinoids used here. |
| ComplexComparisonPartII | C5.2,C6.0,C6.2, lines 2574,3990,4137 | Gauss–Manin, finite CW comparison and Riemann existence; general finite-type range needed for §0.5(a). |
| EtaleDualityAndPerverseSheaves | §§0.3,0.5; lines 513,531,743,775 | Curve H¹ and equivariant alternating cup pairing with dual cyclotomic target. |
| ArithmeticGaloisDuality | R02.3.1, line 1866 | Hermite finiteness with fixed degree and ramification set, including embedded subfield counting. |
| WeightsInEtaleCohomology | R34.1,R34.2, lines 121,272 | Geometric-Frobenius purity, algebraic-integral roots and rationality needed separately for integer factor polynomials. |
| ClassFieldTheory | Layers 7,11, lines 1313,1684; convention §2.6, line 460 | Norms, arithmetic reciprocity and the global character dictionary. |
| GlobalNumberFields | Layers 2,7,8, lines 274,454,471 | Finite ray-class quotients and norm compatibility. |
| LocalFieldsRamification | Layers 0,2,4, lines 60,562,1133 | Finite extensions, unramified Frobenius and tame quadratic/cubic counting. |
| LocalGaloisGroups | Layer 7, lines 654,1088 | Generator rank [F:ℚₚ]+2 for the full absolute group, not merely a pro-p quotient. |
| ReductiveGroups | Layers 0,3, lines 130,235 | Group functors, closed subgroups and scalar-torus quotients. |
| Chebotarev | Layers 10,13–14, lines 411,591,610 | Frobenius densities and their natural-density form, used for inert places and §8.6. |
| AnalyticNumberTheoryPartI | §0.32, line 738 | Siegel–Walfisz does not imply the required polynomial least-prime bound; that extension is explicitly a gap. |

No internal Needs edge goes to a later numbered target. References from §6.9 to §8.1 merely name the subsequently defined ratio; the cardinality definition and trichotomy do not depend on that ratio. The reference from the definition of T_i to its later finiteness proof does not use finiteness to define T_i. Supplier ranges sometimes contain more background than a particular target needs, but no circular route was found.

The required dependency command, with `gate --depcheck`, the package README, `--name GaloisSectionsPadicPeriodMaps`, `--order merge-order/ORDER.txt` and `--movable`, exited 0 and printed:

```text
depcheck: 50 roadmaps, 591 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver found no unresolved cross-roadmap citation or roadmap Lean name against main 5078569 and the supplied open-head index. Its external-library limitation was covered by the direct pinned-file checks above.

### Declared supplier contracts

All seven slugs and needs sentences match `packages/GaloisSectionsPadicPeriodMaps/design/plan.json` and the README verbatim. Each has a named earlier supplier; none is unowned. The multiple clauses in the two model-free contracts specify one construction and its necessary compatibility laws, rather than unrelated bundled theorems. Their hypotheses are precise. None asks to reconstruct the generic imported carriers. These contracts remain obligations for any eventual acceptance; their present absence from suppliers is not a finding.

| Gap | Existing boundary and additional object actually needed | Computed boundary test |
| --- | --- | --- |
| horizontal-pst-specialisation | PadicHodgeTheory §§7.3,7.5 have de Rham pairs; horizontal semistable realisation and its actual-comparison-compatible specialisation are additional | Constant rank-one pair: specialisation 1↦1; using an arbitrary scalar 2 would violate that comparison square. |
| model-free-polarised-fibres | LV §§2.4,2.9 have good-model pairings/transport; the contract removes that model restriction | Elliptic fibre: pairing matrix has determinant 1; half the Poincaré normalisation gives 2/2=1, also in ℚ₂. |
| model-free-period-maps | LV §§3.12–3.19 use good models and common algebraic centres; all local F-rational centres are needed | Shear transport sends the pulled-back line to (1:−1), not (1:1); constant elliptic family has image dimension 0<1. |
| symplectic-faltings-finiteness | LV §1.2 is a semisimple GL/integer-polynomial theorem; the fixed-rank, fixed-weight, fixed-root-degree symplectic extension is additional | Polynomial X²−2 has integral roots of degree 2; its linear factors are not rational. Unipotent planes have stable isotropic dimension 1 and fail GSp-irreducibility. |
| four-isotropic-lagrangians | LV §7.4 uses r≥5, characteristic zero and arbitrary proper subspaces; here isotropy permits r≥4 over a field | d=1,r=4 distinct lines: no common W; four equal lines: intersection dimension 1≥1/2. Rank-zero space gives the empty exceptional set in a point. |
| kodaira-parshin-local-fibres | LV §§8.13–8.14 state G_K-equivariance at K-points; completion-valued points and all characteristic-zero extensions need the extension | g=2,q=3: 15 primitive characters, 9 points per fibre, 135 geometric points. Extension of the field changes the action, not 15·9. |
| linnik-polynomial-least-prime | Qualitative Dirichlet and discriminant-power Chebotarev do not bound the prime by one fixed power of the modulus | m=4,a=3 has least prime 3; nonunit a=2 gives only prime 2, so the coprimality hypothesis is indispensable. Constants must precede m and a. |

### Computed adversarial pass

The 121 rows below state the assertions being tested, their inputs, actual values on the relevant sides, and the outcome. Rows cover all 59 numbered targets, the conventions, API laws and worked examples; multiple independent assertions in a section have separate rows. These are mathematical calculations and source-route checks, not proofs supplied by an admitted Lean build. “Retain” means no change indicated by that test. Empty sets, zero rings/modules, ranks 0 and 1, nonreduced coefficients, ramification, p=2,3, residue field 𝔽₂ and nonabelian actions are included. Equal-characteristic p-adic Hodge objects and inseparable characteristic-zero field extensions are excluded by the stated domains, not silently assigned values.

| Statement | Instances tried | Values computed on both sides / positive and negative models | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: Tate sign and purity | 1⊕ℚₚ(−1) | Jumps 0,1; sum 1; average 1/2. Geometric Frobenius eigenvalues 1,q have weights 0,2, not a common weight 1. Supplier's reported HT weights are 0,−1. | Sign conversion required and present; retain. | None. |
| Convention: Nφ=pφN | φ(e)=e, φ(f)=pf, N(f)=e | Nφ(f)=pe=pφN(f); reversing the relation compares e with p²e. | Distinguishes convention at p=2,3; retain. | None. |
| Convention: inverse period transport | T=[[1,0],[1,1]], F¹=span(e₁) | T⁻¹e₁=e₁−e₂ gives (1:−1); Te₁=e₁+e₂ gives (1:1), unequal even in ℚ₂. | Retain in Layers 4 and 5 and model-free contract. | None. |
| Convention: induction is lax | Index-two subgroup, unit representation | Ind(1) dimension 2; Ind(1)⊗Ind(1) dimension 4; Ind(1⊗1) dimension 2. | Excludes strong tensor claim; retain. | None. |
| Convention: reciprocity and crystalline eigenvalues | F=ℚ₃,u=4; 1,ℚₚ(1) | χ_cyc(Art(4))=1/4, not 4; crystalline eigenvalues 1,p⁻¹ and jumps 0,−1. | Agrees with ClassFieldTheory/PadicHodgeTheory after sign translation. | None. |
| Convention: coefficient points are rational algebra maps | A=ℚₚ², unramified quadratic field, dual numbers, zero | #Σ_A=2,0,1,0 respectively; dimensions 2,2,2,0. | Splitting condition is essential; retain except R01. | R01: add nonemptiness to the ratio equivalence. |
| §0.1 section restriction and composition | Spec K, then identity extension; complex completion | Exact-sequence kernel 1 gives one section on both sides; G_ℂ=1 gives one local section. Restricting twice equals the same composite map. | Retain. | None. |
| §0.1 conjugacy compatibility | Geometric kernel ℤ with C₂ acting by inversion; conjugator −2 | Conjugating the section generator (2,c) gives (−2,c), since −2+2−c(−2)=−2. Their classes are equal before and after restriction. | Equality is of classes, not representatives; retain. | None. |
| §0.2 local injectivity | E:y²=x³−x over ℚ₂; P¹ | Four rational 2-torsion points give four distinct Kummer/section classes. P¹ has infinitely many points but one section class. | p=2 admitted; genus≥1 necessary and present. | None. |
| §0.2 divisibility boundary | Real connected elliptic component versus p-adic E(F) | Multiplication-by-n is onto on the real torus for every n; a profinite group's element divisible by all positive integers has zero image in every finite quotient, hence is zero. | Archimedean injectivity is not asserted; retain. | None. |
| §0.3 Selmer condition | Point section; empty real-point set; complex place | A point section has its specified local point at each place; an empty real-point set makes the Selmer set empty; the complex local-section condition has one value. | All places, not just finite ones, are tested; retain. | None. |
| §0.3 localisation is single-valued | Four 2-torsion point sections over the allowed local field | The four distinct point values map to four distinct section classes; inverse on the image has exactly one value for each. | Uses §0.2, not a chosen arbitrary preimage; retain. | None. |
| §0.4 modified carrier | Spec K; E:y²=x³−x at ℝ | Point carrier has 1 element; elliptic real quotient has 2 components; each connected real component collapses to 1 value. | Imported quotient is the intended one. | None. |
| §0.4 finite-cover survival and twist convention | Trivial torsor; a rational point with fibre class ξ | Trivial torsor is survived by every point. Twisting a fibre of class ξ by ξ gives the neutral class, so its global point survives. The opposite sign would not in a cyclic group of order 3. | Correct torsor matching; retain. | None. |
| §0.4 simply connected and closure tests | P¹; finite-cover image of rational points | Geometric π₁(P¹)=1, so the locus is the whole modified adelic set; each rational point has survival value true for every torsor. | Matches stoll Lemma 5.8; conjectural equality is not assumed. | None. |
| §0.5(a) descent iff matching section | G_m, diagonal point 1; Spec K | For G_m, each torsor evaluation is the global fibre class on both sides, and κ(1) matches every completion. For Spec K both sets have cardinality 1. | Nonproper positive test retained. | None. |
| §0.5(b) equality of finite projections | Allowed curve with empty local points; a rational point y | Empty case gives 0=0; at y both constructions project to precisely y_v. Injectivity identifies a matched finite-place section with that unique local point in both directions. | Proper/genus hypotheses retained. | None. |
| §1.1 perfect alternating module | Standard plane; zero form on a plane; zero module | Standard matrix [[0,1],[−1,0]] has determinant 1; zero form has rank 0<2; on the zero module 0→Hom(0,L) is the unique isomorphism. | Allows zero module, excludes zero form in positive rank. | None. |
| §1.1 line and similitude data | Rank-two target line impostor; plane scalar 2 | Rank-two target fails the stipulated rank-one condition even when the module is zero. Scalar 2 has multiplier 4, not 1. | Perfectness alone does not determine a line or multiplier; retain. | None. |
| §1.1 algebra fibres and induction | Split two-factor algebra with swapped factors; dual numbers | Two rank-two fibres assemble to a rank-four ℚₚ-module; ε maps only to 0, so the dual numbers have one rational algebra point, not two. | Quotient fibres are not a reconstruction of a nonreduced algebra; retain. | None. |
| §1.2 fibre pair and geometric finite base | Identity cover; degree-two nonsplit cover | H⁰_ét has rank 1 or 2; H¹ has rank 2d or 4d. Degree-two geometric fibre has 2 points even when there is only 1 closed point. | Correct geometric point carrier. | None. |
| §1.2 pairing normalisation | Principally polarised elliptic curve | Diagonal pullback of the Poincaré class is twice the polarisation class; half gives 2/2=1, omitting half gives 2. | Rational coefficients make 1/2 legal at p=2; retain. | None. |
| §1.3 relative pair and fibre API | Legendre family; constant elliptic family | H⁰ rank 1, H¹ rank 2, ∧²H¹=ℚₚ(−1); nonconstant Legendre monodromy is SL₂, whereas constant-family monodromy is 1. | Relative local system is not declared constant. | None. |
| §1.3 algebra-linearity and dual pairing | Two disjoint elliptic fibres | H⁰=ℚₚ² acts componentwise on ℚₚ²⊕ℚₚ²; mixed component pairing is 0, each component basis pairs to 1. | Excludes scalar trace pairing in place of the H⁰-valued pairing. | None. |
| §1.4 pair attached to a section | Constant family; conjugate section γsγ⁻¹ | Constant pair is (ℚₚ,H¹(E₀)); conjugation changes action to ρ(γ)ρ(s)ρ(γ)⁻¹, conjugating algebra, module and line together. | Isomorphism class independent of representative; retain. | None. |
| §1.5 fibre-functor restriction | Point section; quadratic cover z²=t over ℚ₃ | At t=1, 2 fixed fibre points; at t=2, one orbit of length 2. Both étale-fibre and section restriction produce the same permutations. | Distinguishes actual fibre functor from a constant one. | None. |
| §1.6 symplectic interpolation | Section of an elliptic rational point | Both constructions give algebra rank 1, module rank 2 and ω(e,f)=1, ω(f,e)=−1. | Pairing, not just representation, interpolates. | None. |
| §1.7 adelic LV definition | Constant global elliptic family; empty adelic set | One global pair works at every place, giving the whole adelic set. Empty carrier yields 0 points. | The quantifier is ∃global pair ∀places; retain. | None. |
| §1.7 restriction/isomorphism invariance | Same global pair in two bases | Base change matrix P conjugates each local action by P; the local isomorphism-class value is unchanged, with elliptic ranks 1,2 on both sides. | Rejects choosing unrelated global pairs place by place. | None. |
| §1.8 Selmer localisation inclusion | s=κ(y); empty Selmer set | loc_v(s)=y_v, interpolated by H^{≤1}(X_y); empty source has image size 0. | Inclusion follows from the single section pair; retain. | None. |
| §2.1 filtered discrete object | Unit, Tate line, zero object | Unit: φ=σ,N=0,jump 0; Tate: φ=p⁻¹σ,N=0,jump −1; zero: every rank and N is 0. | Algebraic-unramified, not completed scalar field. | None. |
| §2.1 morphisms/full faithfulness | Hom(1,1), Hom(1,ℚₚ(1)), Hom(0,0) | ℚₚ maps to ℚₚ; 0 maps to 0; 0 maps to 0. In the middle, σλ=pλ would require v(λ)=v(λ)+1 for λ≠0. | Rules out spurious period morphisms; repaired F01 retained. | None. |
| §2.1 tensor and restriction | 1⊗ℚₚ(1); identity extension | Filtration jump 0+(−1)=−1; identity restriction leaves ranks, φ and N unchanged. | Comparison and filtration laws consistent. | None. |
| §2.1 induction/scalar convention | Quadratic extension L/F; tower of indices 2 and 3 | Induced unit has rank 2 and D_dR algebra L of F-dimension 2, not necessarily F². Tower induction has rank 2·3=6 on both routes. Scalar multiplication is g(λ)ψ(g). | Twisted scalars and field-valued de Rham component retained. | None. |
| §2.1 cohomological induction and adjunction | Two geometric points induced from one point | Induced H⁰ has rank 2; invariants of the permutation module and invariants of the original unit each have dimension 1. | Shapiro and geometric finite pushforward agree. | None. |
| §2.2 endomorphism descent | Unit over unramified quadratic F | G_F-invariant scalars form F, dimension 2 over ℚₚ; imposing φ leaves ℚₚ, dimension 1. | Galois averaging alone is insufficient; README uses Frobenius too. | None. |
| §2.2 algebraic units | Zero endomorphism algebra object; scalar algebra ℚₚ | Aut(0) has one point; units of ℚₚ are ℚₚ×, dimension 1. The zero scalar is not a unit. | No unit/nonunit reversal; retain. | None. |
| §2.2 similitude group | Zero module; diag(2,3); scalar 2 | Aut(0)=1 but Aut^GSp(0)=G_m, dimension 1; positive-rank multipliers are 6 and 4 respectively. | Independent multiplier required and retained. | None. |
| §2.2 retwist/flag functor | Plane with jumps 0,1; original filtration | Flag variety is P¹, each point a line; original point returns the original filtration. Empty flag is a point. | Retwist changes filtration only; retain. | None. |
| §2.3 orbit iff isomorphism | Distinct diagonal eigenvalues, G_m² on P¹ | Two coordinate lines are singleton orbits; all points with two nonzero coordinates form one orbit. Thus 3 orbits and 3 retwist classes in this test. | Both directions, not just orbit implies isomorphism, checked. | None. |
| §2.4 automorphism bounds | Rank-one unit; symplectic rank 2; rank 0 | 1≤1²; dim GSp₂=4=1·3+1; dim GSp₀=1=0+1. | Rank-zero convention satisfies the formula. | None. |
| §3.1 conjugate/self-conjugate places | ℚ(i), primes 3,5,2 | (3) fixed; (2+i)↔(2−i); ideal (1+i) fixed but ramified. | Self-conjugacy is not universal reflexivity. | None. |
| §3.1 no CM subfield and friendly comparison | Odd-degree number field; ramified prime of ℚ(i) | No even-degree CM subfield can occur in odd degree, so the CM test has zero obstructions. Prime above 2 in ℚ(i) is self-conjugate but ramified. | Self-conjugate range is larger than friendly range. | None. |
| §3.2 conjugate weight identity | χ_cyc⁻¹; finite character; split CM labelled weights | For purity 2: 1+1=2. For finite character: 0+0=0. Split CM pair: 1+0=1. | Equality uses the conjugate place; retain. | None. |
| §3.2 coefficient restriction | CM character at inert p, coefficients enlarged to ℚ_{p²} | Labelled weights 1 and 0 give odd purity 1; an ℚₚ-valued character at a self-conjugate place would require 2r=1. | The ℚₚ-valued hypothesis cannot be broadened silently. | None. |
| §3.3 local character classification | χ=χ_cyc⁻¹ times finite η | n=2, twist by χ_cyc gives η; η=1 gives the trivial character, and nontrivial finite η remains finite, not necessarily trivial. | Exponent −n/2 correct. | None. |
| §3.3 norm-descent proof repair | Two unramified local characters with values α and α⁻¹ | Diagonal product on a uniformiser is 1; each factor can have infinite order. | Diagonal restriction alone does not isolate a factor; norm descent in the README supplies the missing step. | None. |
| §3.4 weighted Hodge sum | Elliptic H¹; quadratic induction; zero | Sum 1=1·2/2; induced sum 2=1·2·2/2; zero sum 0=0. | Zero sum is legal; no average with denominator 0 asserted. | None. |
| §4.1 affine/analytic finite étale comparison | Dimension-zero polyannulus | Coordinate ring F; G_R=G_F; structural map and point section are id, and q∘s=id. | Both source and target specified. | None. |
| §4.1 finite-system fibre compatibility | Base Tate lattice; p-power torsion system | Fibre action χ_cyc∘q∘s_y=χ_cyc; (ℤ/pᵃ)⊗ℚₚ=0. | Infinite continuous Tate monodromy allowed; torsion contributes zero rational period module. | None. |
| §4.1 nonconstant finite étale system | z²=t over ℚ₃ at t=1,2 | Splitting gives 2 fixed points versus an unramified quadratic orbit of size 2. | Finite étale equivalence preserves the actual point fibre. | None. |
| §4.1 horizontal specialisation | Constant rank-two pair; y=y₀ | Horizontal and fibre comparison matrices I₂; specialisation and transport give I₂ on both routes. Multiplication by 2 would give 2I₂≠I₂. | Actual comparison fixes the map; retain declared horizontal contract. | None. |
| §4.2 polydisc-to-polyannulus descent | Residue fields 𝔽₂,𝔽₄,𝔽₈ | Avoiding two residues leaves 0,2,6 choices respectively; unramified degrees 2 and 3 have gcd 1. | Small residue field handled by two extensions, not excluded. | None. |
| §4.3 transport uniqueness and cocycle | Constant pair, three centres | T_y,y=I; T_z,y T_y,x=I·I=I=T_z,x. Faithful scalar extension sends any difference of compatible maps to 0, hence the difference is 0. | No unmarked isomorphism is substituted. | None. |
| §4.4 smooth proper period comparison | Identity family in degree 0; shear frame in degree 1 | H⁰ and D_pst both rank 1 with identity; rank-two discrete data stay rank 2 while the Hodge line becomes (1:−1). | Smooth proper, not good reduction, is used. | None. |
| §4.5 period control | Centre and two equal retwist flags | Centre Φ₀ returns the initial H^i_pH; equal flags give identical filtered objects and the same actual representation class by full faithfulness. | The theorem concerns actual period values. | None. |
| §4.5 arbitrary flags need not be representations | φ=diag(1,p), F¹=span(e₁) | On e₁: t_H=1 and t_N=0; weak admissibility fails, although the whole space has t_H=t_N=1. | No existence claim for every abstract flag; retain. | None. |
| §5.1 Hodge cohomology pair | Ordinary and supersingular elliptic curves | Both have Hodge jumps 0,1 and pairing-target jump 1; ordinary slopes 0,1 differ from supersingular slopes 1/2,1/2. | Definition must preserve actual discrete data; add Checks/API, R02. | R02: add the API and discriminating Checks. |
| §5.1 finite-base algebra distinction | Two split elliptic fibres; one elliptic fibre over quadratic L/F | Both have H⁰ rank 2 and H¹ rank 4 over F; algebras are F² and L. | Same ranks do not determine the pair; R02 test. | R02: add the API and discriminating Checks. |
| §5.2 retwisted symplectic filtration | Standard four-space, Φ=span(e₁,e₂) versus span(e₁,f₁) | First Φ pairs to 0; second has ω(e₁,f₁)=1 while F² of the target is 0. Both have half-dimension 2. | Isotropy, not only half rank, is necessary. | None. |
| §5.2 original point, ranks and endpoints | Symplectic plane at Φ₀ | F⁰ rank 2, F¹ rank 1, F² rank 0; at Φ₀ the three filtered components equal the original pair. | Retain. | None. |
| §5.3 symplectic period diagram | Centre; shear; equal period points | Centre returns (H⁰,H¹) of ranks (1,2); shear gives line (1:−1); two equal flags produce the same algebra/module/pairing isomorphism class. | All structures, not just V, recovered. | None. |
| §5.4 Weil-restriction decomposition | Closed component degrees 1 and 2, d=1 | Period dimension 1+2=3; underlying H¹ dimension 2+4=6. Over a splitting field the quadratic factor is two P¹ factors. | No inseparable product decomposition asserted. | None. |
| §6.1 S-good purity and Hodge conditions | 1⊕ℚₚ(−1); H¹(E)(1); zero V | First has weights 0,2 instead of 1; second jumps −1,0 instead of 0,1; zero V has no jumps and leaves A's ramification condition. | Independent conditions distinguish wrong models. | None. |
| §6.1 integrality versus factor rationality | Roots √2,−√2 | Total polynomial X²−2 lies in ℤ[X]; factors X−√2 and X+√2 do not. Root degrees are 2; squaring yields degree 1. | Bounded root degree, not inherited integer factors, used in T_i. | None. |
| §6.1 finite-image algebra | A=ℚ₇[ε]/ε², action ε↦ζ₃ε | Eigenvalues 1,ζ₃; trace 1+ζ₃ is not rational, despite finite image of order 3. | Finite image alone does not imply a ℤ-polynomial. | None. |
| §6.1 restriction and monotonicity in S | Add one bad place u to S | Ramification at u changes from a forbidden condition to no condition; all conditions outside the enlarged S remain identical. Fixed good fibre keeps ranks δ,2dδ. | Enlarging S enlarges allowed pairs; retain. | None. |
| §6.2 local LV locus | Constant global family; empty Y(F) | All local points admit the same global pair in the constant case; empty Y(F) gives cardinality 0. | One global interpolant at the selected place; not all independently chosen locals. | None. |
| §6.2 projection of adelic locus | Rational point y and its global fibre pair | Adelic component is y_v, and both local fibre pairs have ranks δ,2dδ and identical action. | Projection inclusion, not an unsupported converse. | None. |
| §6.3 period-locus definition and orbit invariance | Hodge centre belonging to LV; a conjugate flag | Centre is in the period locus; acting by the fixed discrete-pair automorphism changes only its representative, yielding the same interpolant class. For an elliptic centre the ranks are 1,2. | Correct actual-retwist condition. | None. |
| §6.3 density requirement | Constant elliptic family | Period image dimension 0, domain dimension 1; condition (i) is false even though the local LV locus is all local points. | Excludes false finiteness for constant families. | None. |
| §6.3 proper compactness requirement | p^(−n), n≥1, in the nonproper Legendre base | Absolute values p^n tend to infinity; in a fixed bounded affine disc only finitely many n occur, but total cardinality is infinite. | Local finiteness does not imply global; R04 fixes its supplier locator. | R04: correct the compactness citation. |
| §6.4 adelic interpolants are S-good | Rational fibre and good place u outside suitable S | A unramified of rank δ, V unramified of rank 2dδ, V purity 1, jumps 0 and 1 at p. | Smooth proper good model supplies exactly the required conditions. | None. |
| §6.5 rational points lie in LV | y∈Y(K) | Restricting H^{≤1}(X_y) gives H^{≤1}(X_{y_v}); ranks δ and 2dδ agree on both sides. | No prior Mordell finiteness used. | None. |
| §6.6 non-symplectic comparison and dimensions | g=3,q=11,23 | d_q=(5/2)·10=25 and (5/2)·22=55. Forgetting the pairing sends each symplectic interpolant to one algebra/module interpolant. | Correct inclusion and numerical values. | None. |
| §6.6 equality in rank two | A=ℚₚ,d=1, arbitrary invertible f | ∧²V has dimension 1; f acts by det(f), which is exactly its possible similitude multiplier. | Forgetting the pairing introduces no further obstruction in this case. | None. |
| §6.6 strictness mechanism | W₁,W₂ nonisomorphic absolutely irreducible planes, nonsquare c | Equivariant isomorphism requires b=a₁²=c a₂², forcing c=(a₁/a₂)², impossible. | Same module need not give the same common-line symplectic pair. | None. |
| §6.6 forgetting equivariance | Same forms, change f₂ to c⁻¹f₂ | Second-plane pairing becomes c·c⁻¹=1; first-plane pairing remains 1. | Positive control: obstruction is equivariance plus common line. | None. |
| §6.7 fibre algebra and stabiliser index | One closed point of degree 4; totally ramified e=4,f=1 | Geometric fibre has 4 points, one orbit; dim H⁰=#Σ=4; stabiliser index 4, not residue degree 1. | Ramification retained. | None. |
| §6.8 trichotomy with nonreduced coefficients | A=ℚₚ[ε]/ε³, V=A⊗H¹(E), d=1, trivial algebra action | Σ has 1 point and dim A=3. Correct (c): 1≥1/2. Source's dimension substitution would demand 1≥3/2. No index-≥4 point exists. | README corrects the source's false general form. | None. |
| §6.8 empty Σ and rank restrictions | Nonsplit coefficient field; zero algebra | Σ empty gives cardinality conclusion 0≥0; a nonzero nonsplit algebra need not satisfy §6.9's different dimension-based type-(c) definition. | Split fibre hypothesis links the two uses; R01 fixes only the ratio. | R01: add nonemptiness to the ratio equivalence. |
| §6.8 averaging inequality | m=2,N=10,small count s=4 | Left mN/2=10; right (m−1)(N−s)/2+ms=3+8=11; rearranged (m+1)s=12≥10. At s=3 right 3.5+6=9.5<10. | Threshold is substantive, not vacuous. | None. |
| §6.9 types and union | One coefficient point; transitive five-point coefficient set | Index 1 excludes (a),(b), while (c) gives 1≥1/(d+1). Index 5 gives small count 0, so (c) is false. | Alternatives are not claimed disjoint. | None. |
| §6.9 ordinary elliptic fibre Check | Unramified weight-zero line; split weight-one line | Average jumps 0<1/2 and 1≥1/2 respectively; both lines isotropic in rank 2. At coefficient index 1 neither yields type (b). | Both index and Hodge conditions retained. | None. |
| §6.9 and §8.1 ratio equivalence | A=0,d=1 | Cardinality type (c): 0≥0 true; ratio undefined, or totalised 0≥1/2 false. | Fails as written; R01. | R01: add nonemptiness to the ratio equivalence. |
| §7.1 local-class set T_i | δ=1, non-CM elliptic global fibre | Only degree-one extension L=K; rank 2, root bound B=2; its actual local D_pH class qualifies. | Bounds precede the class quantifier. | None. |
| §7.1 orbit membership API | Fixed discrete module versus incompatible discrete module | A matching class contributes one entire automorphism orbit; incompatible discrete data contribute 0 flags. | Excludes ignoring φ,N,G or the pairing. | None. |
| §7.2 finiteness hypothesis | Unipotent family ρ_λ over ℚ(i) | Characteristic polynomial (X−1)², weight 0, determinant 1 and B=1; fixed e₁ is isotropic and stable, dimension 1. | Infinite extension families are excluded by GSp-irreducibility. | None. |
| §7.2 finite assembly | Two permitted fields, three and four permitted representation classes | At most 3+4=7 local classes; taking isomorphism classes or further restriction cannot increase 7. | Uses Hermite plus the declared finiteness contract, not the target itself. | None. |
| §7.3 dimension inequality | (d,r)=(1,4),(1,3),(2,4) | Orbit bounds after scalar quotient: 3<4, 3=3, 10<12. Scalar torus subtracts 1 from GSp's bound. | r≥4 gives strictness; r=3 dimension argument fails at d=1. | None. |
| §7.4 type-(a) period locus | All component degrees ≤3; actual inert degree-four global elliptic fibre | First has 0 eligible components and empty locus. Second has an eligible component and its actual Hodge point, so nonempty locus but orbit dimension ≤3<4. | Mathematical definition sound; missing API/Checks R02. | R02: add the API and discriminating Checks. |
| §7.5 full-monodromy type-(a) finiteness | Empty local curve; finite cover with counts 2 and 3 | Empty count 0; union count ≤2+3=5. Constant-family image dimension 0<1 fails full monodromy/density. | Compact finite cover and density are both used. | None. |
| §7.6 simultaneous half-meeting | d=1,r=3 distinct lines | dim W=1; intersection with a different line is 0<1/2, with the same line 1≥1/2. No W meets all distinct lines. | Corrects the earlier confusion with the type-(a) 3=3 count. | None. |
| §7.6 four-Lagrangian negative control | e,f,e+f,e+2f over characteristic zero | Any two different lines intersect in dimension 0; no line equals all four. At least one required inequality 0≥1/2 fails for every W. | Proper exceptional locus test, including p=2. | None. |
| §7.6 exceptional positive and zero cases | All four lines e; zero symplectic space | W=e gives four intersection dimensions 1≥1/2. For zero space there is no nonzero W: exceptional set empty in a one-point Grassmannian. | Not an identically empty or identically full construction. | None. |
| §7.7 local type-(b) locus | Index-one fibre; index-four ordinary CM fibre with split local representation | First has 0 eligible points. Second has stable W of dimension 1 and F¹-dimension 1, so average 1≥1/2. | De Rham and local subrepresentation conditions matter; R02 supplies tests. | R02: add the API and discriminating Checks. |
| §7.8 type-(b) finiteness | Empty local curve; finite disc cover | Empty count 0; disc counts 1,2,0 give total ≤3. A dense period image cannot lie in the proper exceptional closed set. | Properness plus the finite-intersection contract completes the route. | None. |
| §8.1 ratio and weighted union | Trivial nonempty action; orbit sizes 3 and 4; degree-five orbit | Proportions 1,3/7,0 respectively; weighted union (3·1+4·0)/7=3/7. | Denominators positive except the defect R01. | R01: add nonemptiness to the ratio equivalence. |
| §8.1 nonabelian action | Regular S₃-set; S₃/C₂ | Single orbit sizes 6 and 3; proportions 0/6=0 and 3/3=1. | Whole-group orbits, not cycles of one generator. | None. |
| §8.1 equal-fibre monotonicity | Two copies of each point of a 3-orbit plus a 4-orbit | Source has 6 small points of 14; target 3 of 7; 6/14=3/7. In general small source lies in the preimage of small target. | Correct theorem. | None. |
| §8.1 unequal-fibre Check | Repaired surjection from 4 fixed points plus C₄ to 1 fixed point plus C₄ | Positive fibre sizes 4,1,1,1,1; ratios 4/8=1/2>1/5. Original map has four empty fibres. | Original Check does not isolate hypothesis; R03. | R03: use the surjective unequal-fibre example. |
| §8.2 local subfield counts | ℚ₅; ℚ₂ | ℚ₅: 3 quadratic+4 cubic subfields=7. ℚ₂: 7 quadratic+4 cubic subfields=11. Non-Galois cubic conjugates counted separately. | Includes small residue characteristic. | None. |
| §8.2 embedded subfields versus isomorphism classes | ℚ₅ versus ℚ₇ | Over ℚ₅ there are 4 cubic subfields but 2 cubic isomorphism classes; over ℚ₇ there are 4 cubic subfields, all normal. Correct totals are 7 and 7; counting isomorphism classes gives the wrong 5 over ℚ₅. | Add separate discriminating Checks, R02. | R02: add the API and discriminating Checks. |
| §8.2 generator bound | [F:ℚₚ]=1, full group rank 3 | Homomorphisms to S₂ at most 2³=8; to S₃ at most 6³=216. Open subgroups of indices 2,3 therefore form finite sets. | Full absolute group input, not pro-p alone. | None. |
| §8.3 isotropic torsion bound | g=2,k=5,q_v=7 | gcd(5,6)=gcd(5,48)=gcd(5,342)=1. Fixed subgroup size ≤5²=25; seven quadratic/cubic fields give ≤175 out of 5⁴=625. | Correct small-orbit bound. | None. |
| §8.3 dual-cyclotomic target | Same example, Frobenius powers 1,2,3 | q_v^(−f)−1 modulo 5 gives 2,3,1, each a unit. Thus invariant pairings vanish; they cannot span a nonzero target fixed element. | Inverse Frobenius and coprimality retained. | None. |
| §8.3 degeneracies and omitted-coprimality control | k=1; g=0; trivial rank-four module with q_v≡1 mod 5 | First two modules have cardinality 1 and satisfy 1≤n_v. Without coprimality, all 625 elements may be fixed, exceeding the claimed 25-per-field isotropic bound. | Denominator-free small-module cases work. | None. |
| §8.4 primitive-character count | k=5,g=2; k=1 as excluded auxiliary boundary | 5⁴(1−5⁻⁴)=624 primitive vectors; k=1 has 1 vector. The actual hypotheses force k>1 via 2k≥9n_v. | Strict ζ bound used only in valid positive range. | None. |
| §8.4 type-(c) exclusion | g=2,q_v=5,q=83 | k=41,d=123; 82≥63. Forbidden odd primes 3,5,31 do not divide 82. Upper bound 63/13448≈0.004685<1/124≈0.008065. | Strict inequality verified. | None. |
| §8.4 pairing Frobenius and dimension bound | μ₄₁ dual; k=41,g=2 | 5⁻¹=33 mod 41 since 5·33=165≡1; 4k=164>(2g−1)k+1=124. | Correct dual and strict comparison. | None. |
| §8.5 auxiliary-prime CRT/existence | q_v=2,q=11,107 | Forbidden odd primes 3,7. Both q satisfy condition (1); 10<9·11=99 fails (2), whereas 106≥99 succeeds. | “Good primes only” not introduced; larger q handles v=2. | None. |
| §8.5 dimensions/full-monodromy family | g=2,q=107 | d_q=3·106/2=159>0; finite-base covering fibres are nonempty. | Existing family and monodromy imported, not reconstructed. | None. |
| §8.6 comparison inequality | g=3,q=11,good-reduction n=2 | 2ζ(6)·8/10³≈0.0162775<1/26≈0.0384615. q=11 gives d=25; original threshold q=23 gives d=55. | Broader local range, correct numeric example. | None. |
| §8.6 density-one proof input | Quadratic Galois closure ramified at a large prime r | Extension degree is 2 even when r is arbitrarily large; a bound on odd divisors of degree supplies no bound on ramified r. Taking r₀ above ramified primes excludes common cyclotomic ramification. | README adds the needed bound; source gap recorded below. | None. |
| §9.1 local LV finiteness | Trichotomy with type-(a) size 3,type-(b) size 4,type-(c) empty | Union has size ≤3+4+0=7; empty Y(F) gives 0. q is chosen for the fixed v; no uniform finite bound in v or S is asserted. | Correct assembly. | None. |
| §9.2 Mordell consequence | Empty local curve; genus-one curve with positive rank | Empty local points force 0 global points by injectivity into the completion; positive-rank genus-one example violates g≥2 and is excluded. | No duplicate Mordell declaration; retain. | None. |
| §9.2 existence of self-conjugate place | ℚ(i)/ℚ, prime 3 | Unique prime above 3 is inert and fixed by conjugation; inertness is in E_K/E_K⁺, not an unspecified larger extension. | Repaired wording sound. | None. |
| §9.3 self-conjugate Selmer finiteness | ℚ(i), primes over 3 and 5; empty Selmer set | At 3 the self-conjugacy predicate is true; at a chosen factor of 5 false. Empty localisation image has size 0. Inclusion in finite LV locus gives the finite bound at 3. | CM fields admitted at appropriate places. | None. |
| §9.4 Theorem A | K=ℚ, v=2,3; empty image | No CM subfield gives self-conjugacy at both places; each image is finite, and empty image has size 0. | Every finite place retained; auxiliary q may depend on v. | None. |
| §9.5 Theorem B | Empty local curve; matched finite-place section | Both finite projections are empty in the first case; a matched point-section has exactly the same unique value y_v in both sets in the second. | Both directions of §0.5 feed the finiteness result. | None. |
| §9.6 obstruction/generalisation | v above 2; rational fibre | Old p>2 test is false, new finite-extension-of-ℚ₂ domain test true. Rational fibre still has identical global restriction and local pair, ranks δ,2dδ. | The generalisation removes the old local restriction without weakening interpolation. | None. |

The same tests cover the remaining API bookkeeping: identity and composition of restrictions, invariance under conjugation/isomorphism, enlargement of S, weighted disjoint unions, field-extension degree factors and preservation of the actual pairing/comparison. No Lean signature introduces an arbitrary topology or loses a standing hypothesis because no target declaration is present. No hypothesis was flagged merely for appearing unused. The exceptional dimension boundary r=3 is a negative control for the type-(a) dimension route, not a false claim about type-(b) line configurations.


## Not verifiable

- No required source text was inaccessible. All four manifest works and all 15 seeded locators were readable; no new source fetch or missing-reference request was necessary.
- Published-version corrections to the arXiv v1 Betts–Stix proof slips below were not checked. The package expressly cites arXiv v1 numbering, so the report does not transfer these defects to the published paper or claim that they remain uncorrected there.
- The seven declared supplier extensions are contracts, not completed formal proofs at the pins. Their precision, minimality, ownership and boundary cases were reviewed; their future Lean implementations were not available to inspect. This is not counted as a package defect.

## Source issues

- **Gap** in bs at Proposition 2.16(1), printed p.12 (bs lines 605–615): the source says averaging G_v-conjugates yields the trace to ℚₚ; it should also use Frobenius, since G_v alone fixes the maximal unramified subfield of K_v; affects the proof.
- **Error** in bs at Proposition 2.16(2), printed p.12 (bs lines 622–625): the source says the similitude group embeds into the underlying automorphism group; it should separate rank zero, where GSp(0)=G_m maps to the trivial group; affects the proof.
- **Gap** in bs at Remark 2.20, printed p.14 (bs lines 713–719): the source says diagonal restriction isolates the square of one local character; it should justify factor isolation through norm descent after a finite power; affects the proof.
- **Gap** in bs at Proposition 3.20(8), printed p.28 (bs lines 1450–1453): the source says the proper cycle-comparison result applies to a line bundle's total space; it should use a proper projective compactification or establish the required nonproper comparison first; affects the proof.
- **Error** in bs at Proposition 6.7(c) and its reduction, printed pp.46–47 (bs lines 2352–2375): the source says the small-point lower bound uses dim A for every coefficient algebra; it should use #Hom(A,ℚₚ), or assume A is split; affects a stated result.
- **Gap** in bs at proof of Proposition 6.9, printed p.49 (bs lines 2472–2478, 2536–2538): the source says a coefficient fibre satisfies the integer-polynomial requirement of Definition 6.11; it should justify rationality of its polynomial or use a bounded algebraic-root-degree finiteness theorem; affects the proof.
- **Misprint** in bs at §6.3, printed pp.49,51 (bs lines 2545,2656): the source says a single retwisted module is isomorphic to a pair of realised objects; it should use the retwisted symplectic pair M^{≤1}; affects nothing.
- **Misprint** in bs at proof of Proposition 6.20, printed p.52 (bs line 2698): the source says the small-orbit proportion is evaluated on Y_q,y; it should use the finite-base fibre Y′_q,y; affects nothing.
- **Misprint** in bs at Remark 6.23(I), printed p.54 (bs line 2780): the source says the product ranges over odd prime divisors of q; it should say odd prime divisors of q−1; affects nothing.
- **Gap** in bs at Remark 6.23(I), printed p.54 (bs lines 2783–2787): the source says the degree-divisor bound ensures cyclotomic disjointness; it should additionally bound the ramified rational primes of the Galois closure to justify that disjointness argument; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "afa4dea3d7f6f7bb601791b63790c1d61a9e622a", "job": "REV-PKG-GaloisSectionsPadicPeriodMaps~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
