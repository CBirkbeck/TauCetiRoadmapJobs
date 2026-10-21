<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/162#issuecomment-6319745149 -->
Red team round 1 pass a (codex) of 8ef92f5

Verdict: needs_changes

1. **F01** (P1) A root of the quadratic need not have order six in characteristic two

   **Location:** packages/K3BlochGroups/README.md:580, “a primitive sixth root of unity when char F ≠ 3”.

   **Claim:** Every root of t²−t+1 has order six when the characteristic is not three.

   **Witness:** In F₄, a root ω of t²+t+1 has ω³=1 and ω≠1, so its order is three. F₄ satisfies both the field-size assumption and char F≠3.

   **Exact repair text:** “If F contains a root ζ of t²−t+1, then c=⟨ζ⟩ and 2c=0. Such a root has order six in characteristic different from two and three, order three in characteristic two, and equals −1 in characteristic three.” Add the F₄ case as a negative-control Check.

2. **F02** (P1) Model completeness is an unowned prerequisite

   **Location:** packages/K3BlochGroups/README.md:1653, “by model completeness of real closed fields”.

   **Claim:** The all-formally-real-field order-six theorem is proved by transferring finite certificates from an arbitrary real closure to the real algebraic numbers.

   **Witness:** TauCetiRoadmap/RealAlgebraicGeometry/README.md:475 explicitly restricts its quantifier-elimination route to ℝ. Neither pinned library's model-theory sources supplies real-closed-field model completeness; §5.8 has no target or supplier contract for it.

   **Exact repair text:** Add before `blochC_order_six`: “`realClosed_certificate_transfer`: for real closed fields R and S and each fixed finite integer coefficient list, a five-term equality certificate with rational parameters exists over R if and only if it exists over S. Prove this from a named target establishing completeness of the first-order theory of real closed fields, together with the finite equality-pattern encoding of the certificate equations.” Own the general real-closed-field theorem here or declare a precise supplier gap and cite its owner; supply its legal source locator. Retain the theorem for every formally real field.

3. **F03** (P2) Easy tensor-quotient and certificate headlines are omitted from Lean

   **Location:** packages/K3BlochGroups/Suggested.lean:389, “Their carriers … are not at the pins”; packages/K3BlochGroups/README.md:411 and :1682.

   **Claim:** `antisymSquare` and `FiveTermCertificate` must remain README-only because their carriers are unavailable.

   **Witness:** Mathlib has `TensorProduct`, `TensorProduct.comm`, `LinearMap.range`, submodule quotients, `Finsupp`, and `FreeAbelianGroup`. `Symbols.Admissible` already has a real body at Suggested.lean:116. Both omitted carriers are direct specializations of these objects.

   **Exact repair text:** Keep the real-bodied definition `antisymSquare R M := (M ⊗[R] M) ⧸ LinearMap.range (LinearMap.id + (TensorProduct.comm R M M).toLinearMap)`, with all module binders, and state its diagonal/exterior-kernel milestone. Keep `FiveTermCertificate F := ({p : F × F // Symbols.Admissible p.1 p.2} →₀ ℤ) × ℤ`, its real-bodied finite-sum evaluation into `FreeAbelianGroup Fˣ`, and the membership/existence milestone. Add up to two proved discriminating examples for each retained definition and remove these objects from the unavailable-carriers claim.

4. **F04** (P1) Naturality across finite-to-infinite embeddings has no comparison target

   **Location:** packages/K3BlochGroups/README.md:1872, “combine … to obtain the natural integral sequence”.

   **Claim:** Separate finite-field and infinite-field constructions automatically give a sequence natural for every field embedding.

   **Witness:** §5.5 proves naturality only between finite fields; §4.20 only between infinite fields. The embedding F₄→F₄(t), used at :1876, belongs to neither class. Equality of cyclic orders does not identify the two right arrows.

   **Exact repair text:** Insert before §6.6: “`finiteInfiniteBloch_compatibility`: for a finite field F with |F|≥4, an infinite field E and an embedding f:F→E, prove B(f)∘finiteK3Bloch_F = suslin_E∘K₃(f), where the right side includes the indecomposable quotient. Compare the finite refined edge of §5.4, after forgetting square classes, with the rank-two edge of §4.12 under SL₂(F)→GL₂(E), using the augmentation-preserving bar comparisons and the fixed cross-ratio normalization.” Make the all-field natural sequence and finite-field Bloch rigidity depend on this target.

5. **F05** (P1) Stable-homotopy supplier sections have drifted

   **Location:** packages/K3BlochGroups/README.md:48–51, “§§5.42 … §7.30”; repeated at :219, :233, :1291 and :1434.

   **Claim:** The cited sections supply the UCE, universal-cover, Picard self-braiding and Atiyah–Hirzebruch inputs.

   **Witness:** At supplier head 8b81fab, TauCetiRoadmap/StableHomotopyKTheory/README.md:1274 has UCE §3.29; :1302 cover §3.31; :1310 fibre §3.32; :2108 Picard §5.19; :2572 AHSS §7.27. §5.42 is absent; §7.30 concerns Def(C;Q).

   **Exact repair text:** Replace all references to `plusGroup_fibreUCE` and superperfectness at §3.30 by §3.29; the universal-cover comparison at §3.32 by §3.31; the UCE fibre sequence at §3.33 by §3.32; Picard self-braiding at §5.42 by §5.19; and the AHSS at §7.30 by §7.27. Retain §3.33 only where the general plus-fibre theorem is actually used. Pin the target names alongside the corrected sections throughout the contracts and proof plans.

6. **F06** (P3) The stated library baseline is not the supplied baseline

   **Location:** packages/K3BlochGroups/README.md:39, “Mathlib `082e2d37…` and Tau Ceti `f7904748…`”.

   **Claim:** These commits are the pinned APIs against which the representative statements are specified.

   **Witness:** The supplied `lake-manifest.json` pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the installed source checkouts have those exact heads.

   **Exact repair text:** “The library baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.” Audit the named APIs against these pins and remove the distinction between unavailable extra additions and declarations already present at the pins.

7. **F07** (P1) Motivic and arithmetic contracts cite unavailable suppliers

   **Location:** packages/K3BlochGroups/README.md:50 and :52, “MotivicEtaleKTheory supplies … ArithmeticKTheory supplies”.

   **Claim:** Named sections provide diagonal motivic cohomology, the motivic spectral sequence, torsion divisibility, Chern classes, finite comparison, finite generation, Borel ranks, w₂ and ambient number-field K₃ structures.

   **Witness:** Neither roadmap occurs in the supplied main/Completed tree or ORDER.txt. Read-only GitHub searches found no matching roadmap PR or branch. No `design/plan.json` or declared supplier gap covers these contracts.

   **Exact repair text:** Replace the two asserted-supply paragraphs by explicit, owned prerequisites: “Before Layer 2, construct or import by exact current owner and target the integral Milnor/motivic diagonal, motivic spectral sequence, characteristic-primary torsion divisibility, integral and finite étale Chern maps and finite motivic/étale comparison. Before Layer 5, construct or import finite generation, Borel's rank theorem, the primewise w₂ formulas and the ambient K₃ structure theorem, including the ℚ and ℚ(i) specializations.” First reuse the existing KTheoryFiniteLocalFields targets identified in R11; state only the remaining full prerequisites locally, or record precise gaps against eligible existing suppliers in both the README and plan. Do not leave `MotivicEtaleKTheory §§4.4,7.5,8.6,9.1,10.4,12.1` or `ArithmeticKTheory §§3.2,3.4,4.2–4.4,5.3–5.4,8.10` as established contracts.

8. **F08** (P1) The stated internal build order contains cycles and forward inputs

   **Location:** packages/K3BlochGroups/README.md:1653, “a five-term certificate (§6.1)”; :1707, “Needs … Layers 1–5”.

   **Claim:** The sections and their Needs lines give a forward construction order.

   **Witness:** §5.8→§6.1→Layer 5→§5.8 is a cycle. Independently, §5.2:1471 uses the norm-one-torus construction of §5.6, whose Needs at :1623 includes §5.2. §4.1 specializes to configurations defined only in §4.9.

   **Exact repair text:** “Construct the raw five-term certificate and its evaluation immediately after §3.3; its prerequisites are only the free-symbol presentation and finite supports. Construct the multiplication-matrix norm-one embedding before §5.2, independently of all homology calculations. Place the ordered configuration complex and its augmentation before the configuration specialization of hyperhomology.” Replace blanket `Needs Layers 1–5` on the certificate targets by their actual algebraic dependencies, and split §5.6's elementary embedding from its later homological comparison. Update section references accordingly.

9. **F09** (P3) Several retained-definition Checks have no proved Lean mirror

   **Location:** packages/K3BlochGroups/README.md:1775, “rootMultiple … equals 3b”; :1810, “annihilators 2 and 4 coincide”; :1858–1861, fibre Checks.

   **Claim:** The representative file tests the statable Checks of its own retained definitions.

   **Witness:** Suggested.lean has no `rootMultiple` test at a kernel member, no comparison of denominators 2 and 4, and no zero-fibre/kernel or nonsplitting test. These use only its existing definitions, additive maps, tensors and ZMod.

   **Exact repair text:** Add these assertions to the existing proved example blocks, keeping at most two blocks per definition: the m=3 kernel-member formula; equality of the ℤ/5 divided classes for m=2 and m=4; the zero-fibre/kernel identification and nonexistence of an additive section of ℤ/24→ℤ/6. Also mirror the raw five-term inverse-sum Check at README:489 and the F₄ relation at :490, and the generic comparison/subsingleton Check at :115. Give named README theorem targets to any such boundary test that cannot yet be proved; do not claim that its carrier is unavailable.

10. **F10** (P3) No source manifest records the cited works

   **Location:** packages/K3BlochGroups/README.md:1917–1931; package file list.

   **Claim:** The references and their versions provide auditable legal-source locators.

   **Witness:** `packages/K3BlochGroups/sources.toml` does not exist. The references include two materially different CGZ versions, multiple K-book pagination systems, and three distinct Hutchinson/Mirzaii preprints, none recorded in a source manifest.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, recording every cited work and version, authors, title, year, locator scheme, exact locators and cited targets, plus source-service URL, retrieval, hash, licence and status metadata. Keep the 2021 and 2023 CGZ entries separate and distinguish the combined K-book from its chapter PDFs. Record inaccessible sources as missing or legitimately uncertified; do not claim they were verified.

11. **F11** (P1) Two general Layer 2 targets already belong to an earlier supplier

   **Location:** packages/K3BlochGroups/README.md:299–300, `integralChern_milnor_diagonal` and `milnor_charPrimary_torsionFree`.

   **Claim:** This roadmap owns new proofs of the full-field integral Chern diagonal and characteristic-primary Milnor torsion-freeness.

   **Witness:** At head fb3a9c0, TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:1391 (§6.10 `diagonalChernMilnor`) and :454 (§3.0 `milnor_no_p_torsion`) already state these exact general results, including the normalization, all fields and Izhboldin's argument.

   **Exact repair text:** “Import KTheoryFiniteLocalFields §6.10, `diagonalChernMilnor`, and §3.0, `milnor_no_p_torsion`. Their degree-three specializations give the +2 kernel bound and the characteristic-two injectivity input.” Delete the duplicate general constructions and proofs at §2.2(1)–(2), retaining the local injectivity consequence. Replace the phantom motivic contracts by KTheoryFiniteLocalFields §3.0a `motivicToK` for the diagonal identification, integral tower and finite motivic/étale range; use §1.8 `earlyChern` for the field finite-Chern construction, with R12's degree qualification. Preserve the supplier's coefficient/product hypotheses. Its §3.0 also supplies the torsion-divisibility input. This reuse introduces no upward dependency.

12. **F12** (P1) Finite Chern classes are falsely asserted additive in every degree

   **Location:** packages/K3BlochGroups/README.md:50, “consists of additive maps … for regular X, m invertible and i,n≥1”.

   **Claim:** Every finite-coefficient Chern operation is a group homomorphism, including degree two and modulus two.

   **Witness:** Take X=Spec ℝ, m=2, i=n=2. K₂(ℝ;ℤ/2)=ℤ/4 has generator β; c₂(2β) is the nonzero quaternion class in ℤ/2, whereas 2c₂(β)=0. See weibel-chern lines 437–446, Example 2.6.2.

   **Exact repair text:** “The finite Chern operations are additive for n≠2 or odd m. For n=2 and even m retain the correction c(a+b)=c(a)+c(b)+(m/2)c({∂a,∂b}), with the integral Chern operation in the final term. In degree three the second Chern operation is additive for every invertible modulus.” Cite KTheoryFiniteLocalFields §1.8 and Weibel, Étale Chern classes at the prime 2, Proposition 2.4 and Example 2.6.2, pp.10–11. Add the ℝ, m=2 example as a negative-control Check; retain all moduli in §6.7.

13. **F13** (P3) The Rogers supplier locator is absent at its current head

   **Location:** packages/K3BlochGroups/README.md:14, :54 and :1645, “PolylogarithmFunctions PF.6”.

   **Claim:** Stage PF.6 identifies the imported Rogers function and all its normalizations.

   **Witness:** At head 6e452e5, TauCetiRoadmap/PolylogarithmFunctions/README.md has no PF.6. The relevant targets are §§6.1,6.3,6.4,6.5 at lines 818,847,860,879 respectively.

   **Exact repair text:** Replace `PolylogarithmFunctions PF.6` by “PolylogarithmFunctions §6.1 (interval Rogers function and endpoints), §6.3 (reflection), §6.4 (exact interval pentagon), and §6.5 (midpoint value)”. Apply the replacement consistently in the contract, ownership paragraph and §5.8.

14. **F14** (P3) Suggested.lean ends with a prohibited catalogue of names

   **Location:** packages/K3BlochGroups/Suggested.lean:387–395, “Targets stated only in README.md”.

   **Claim:** A trailing declaration-name catalogue records the unstated targets.

   **Witness:** The comment enumerates unimplemented names from `bStPlus` through `finiteChernIndEquiv`; the required Suggested.lean format expressly excludes catalogues of names. R03 separately identifies names in that list whose carriers are already easy to state.

   **Exact repair text:** Delete the trailing catalogue comment. Keep the module docstring's existing statement that README.md is definitive and the representative file is not exhaustive; add the actual easy declarations required by R03.

## Verified sound

Read all 1,931 README lines and all 398 Suggested.lean lines, together with the repository rules. The inventories contain **55 Lean declarations: 16 definitions/abbreviations, 16 theorem targets and 23 proved examples**; **62 numbered README subsections**, **438 distinct explicit target/API names (441 occurrences)**, **68 bold-marked paragraphs** and **291 bulleted Checks**. Bold text is largely Check headings, supplier labels and emphasis rather than a separate target catalogue. All were examined; the boundary tests below are not a claim of formal proof of every deep target.

**Checks tested:** all 291 bulleted Checks were assessed for hypotheses and discriminating content; 23 finite-presentation/raw-relation cases were independently calculated (seven reduced presentations, five extended presentations, five negative-unit kernels, six rational raw identities). Further hand checks are recorded below, including the two explicit mathematical counterexamples R01 and R12. The 23 existing Lean examples were read, not executed. **Source verification:** 34 locator groups were checked against legally fetched text, listed below; a range counts as one group. **Supplier verification:** seven supplier-contract audits checked current names, sections and hypotheses; an eighth open roadmap, KTheoryLowDegrees, was checked for overlap; five supplied sibling heads were also searched for overlap, with no direct citation to those five in this package. Main/Completed searches included the topology, covering, curve, number-field and real-algebraic suppliers. Unresolved contracts are explicitly reported, not counted as verified supplies.

The package diff is confined to its folder: README.md (1,931 added lines), Suggested.lean (398), metadata.toml (1), review.json (8). The review adds only this report in that folder. Suggested.lean has one `import Mathlib`, no admitted data, no admitted examples, no `set_option`, no `lemma`, and no `True` placeholders. No Lean statement found drops a necessary standing instance: the finite theorem carries Field/Fintype/prime/CharP explicitly; cyclic homology retains NeZero and j≥1; kernel and fibre theorems carry their annihilation, injectivity, exactness or surjectivity conditions. The arbitrary groups in the lightweight helpers are expressly distinguished from the unavailable K-theory construction in the README.

Pinned source inspection confirmed the actual group-homology cycles/projection/differential/map interfaces, cyclic homology, tensor/exterior carriers, covering lifts, HSpace, and Tau Ceti's Shapiro, transfer, connecting-map and continuous Mackey interfaces. In particular, the finite discrete specialization of `TauCeti.ContinuousCohomology.corestriction_mackey` satisfies its compactness, total-disconnectedness, openness/closedness and discrete-module conditions. The tensor cokernel is distinct from pinned `TauCeti.antisymmetricTensors`; no duplicate eigenspace construction is requested.

The dependency tool returned exit status 1 and exactly:

```text
NOT IN ORDER: K3BlochGroups (insert it after its last supplier)
depcheck: 6 roadmaps, 43 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The missing order entry is not raised as a finding. The tool's limited discovered graph does not certify the prose-only contracts or the internal section order; R05,R07,R08,R11 address those independently. No later-roadmap target needed to be moved down in this pass.

### Adversarial statement ledger

Each row covers all definitions, theorem assertions, identities, conventions and API clauses in the numbered subsection. “No counterexample” in this ledger means the stated boundary test passed, not that an inaccessible primary proof was certified. Changes are the referenced findings; otherwise none is proposed from the listed tests.

| Statement group (README line) | Instances tried | Result and change |
|---|---|---|
| §1.1 The Steinberg plus space (66) | Zero ring; trivial stable group; degrees 2 and 3 | Two-connectivity gives the stated range; supplier locators need R05. |
| §1.2 The canonical third-homology comparison (98) | Identity maps; doubling on ℤ/5; zero carrier | Inverse order gives 1↦3; no truth defect in the generic helper. R09. |
| §1.3 Finite bar cycles and equality witnesses (121) | Trivial group; [1,1,1]; [g,1,1] for g≠1 | d₄[1,1,1,1]=[1,1,1]; d₃[g,1,1]=[1,1]−[g,1]. Equality needs a four-boundary. |
| §1.4 Ring maps and finite stages (162) | Identity ring map; zero ring; finite chain support | Finite supports descend to a common stage. No stronger finite-rank range is asserted. |
| §1.5 The elementary cover and the Hopf kernel (186) | Empty wedge; one sphere; two spheres; zero π₂ | Hopf and Whitehead terms have the required orientations; H-space kills the mixed term. R05 affects supplier locations. |
| §2.1 The Milnor image and its cokernel (239) | Zero Milnor image; totally imaginary and real fields | Cokernel by the Milnor image differs from quotient by all torsion; no collapse to the latter. |
| §2.2 Injectivity and the motivic edge (279) | Degrees 0,1,2,3; characteristic two; algebraic closures | Chern scalars +1,−1,+2; divisible torsion alone does not imply zero. R07,R11,R12. |
| §2.3 Real places and the decomposable subgroup (321) | No real places; one and two real places | Empty real basis gives zero image; sign-isolating classes give independent order-two terms. Arithmetic supplier unresolved: R07. |
| §2.4 Totally imaginary fields and stable special-linear homology (355) | ℚ(i); ℚ; algebraically closed fields | The extra real-place Milnor summands distinguish the quotient from stable SL homology. Arithmetic inputs need R07. |
| §2.5 Information lost over the rationals (387) | Totally real and imaginary number fields; transcendental field | Rational rank r₂ is number-field-specific; arbitrary Milnor groups are not discarded. |
| §3.1 The antisymmetric tensor cokernel (409) | M=0, ℤ, ℤ/2, ℤ/3; zero coefficient ring; 2 invertible | Diagonal torsion survives over ℤ; M/2M kernel stated only over ℤ. Missing easy mirror: R03. |
| §3.2 The projective cross-ratio (444) | (0,∞,1,2); first-two swap; coincident points; scalar matrix | Cross-ratio 2 becomes 1/2; admissibility and column convention retained. |
| §3.3 Admissible five-term relations (467) | (2,3), (−1,2), (1/2,2/3); x=y; y=1; F₄ | Raw reflection and inverse-sum relations checked exactly; forbidden fractions excluded. R09. |
| §3.4 The pre-Bloch presentation (498) | F₂,F₃; symbol 1; identity embedding | Reduced and unreduced quotients agree; pathological small fields retained. |
| §3.5 The boundary, its kernel and Matsumoto exactness (525) | [2] over ℚ; [2]+[−1]; [3] with v₂,v₃; F₅ | Boundary of [2] has order two; sum has zero boundary; valuation pairing of ∂[3] is −1. |
| §3.6 Universal torsion and inversion symbols (564) | F₄,F₅,F₇; square units; characteristic 2 and 3 | Root-order assertion fails in F₄: R01. c and h identities agree with finite presentations. |
| §3.7 Small-field calculations (593) | F₂,F₃,F₄,F₅,F₇ | P is 0, ℤ, ℤ/5, ℤ/6, ℤ/8 respectively; B is 0, ℤ, ℤ/5, ℤ/3, ℤ/4. |
| §3.8 Replacing the target by the exterior square (603) | F₅ and F₇; diagonal unit tensor | Exterior kernel can strictly exceed B. It is not substituted for the antisymmetric kernel. |
| §3.9 The full-tensor lecture kernel (624) | Zero free cycle; [2]+[−1] over ℚ; reversed tensor order | Full-tensor kernel precedes relations and differs from the quotient kernel. Bloch attribution uncertified. |
| §3.10 The obstruction to lifting a lecture cycle (655) | Full-tensor obstruction; sixfold multiple; zero obstruction | Six-primary comparison follows from c and h corrections; no arbitrary cycle is asserted to lift integrally. |
| §3.11 The generic configuration presentation (679) | Five distinct points; absent five-tuples in F₂,F₃,F₄ | Generic configuration relations agree with admissible reduced relations; no extra degenerate-zero relation is silently imposed. |
| §3.12 Rational smooth-curve specialization (703) | Constant rational cycle; [t]+[1−t]; collision at 0 or ∞ | Specialization requires the cycle condition. All-curve relation equality remains conditional. |
| §3.13 The older projective exterior convention (736) | ξ₂,₁ over ℚ; finite extended presentations F₂,F₃,F₅,F₇,F₁₁ | Intersection repair is necessary; old comparison can have both kernel and cokernel. |
| §3.14 The published negative-unit tensor target (765) | F₃ and F₅; u=2 over ℚ | Q_neg has orders 2 and 1 respectively; −u means multiplication by −1. |
| §3.15 The published projective presentation (789) | F₂,F₃,F₅,F₇,F₁₁; X=Y; forbidden 0/0 | B_new orders 3,1,3,2,3; unrestricted published surjectivity cannot include F₂. |
| §3.16 Exact convention maps (820) | F₅,F₇,F₁₁; odd modulus; modulus two and three | New/old map distinction and the 2/6-primary correction bounds survive these tests. |
| §4.1 Group-module hyperhomology (864) | Zero coefficient complex; degree zero; trivial group | Total-degree indexing and coefficient objects coherent; configuration specialization has a forward input: R08. |
| §4.2 Independent-vector chains (890) | n=0; n=1,m=0; n=m=1; dependent distinct vectors | Augmentation and lower-block shear give the stated boundaries/actions. Primary Suslin proof not certified. |
| §4.3 Scalar acyclicity and affine stabilizers (918) | V=0; characteristic equal/different from coefficients; missing scalar containment | Positive additive homology is not itself asserted zero. Scalar acyclicity source unavailable; no counterexample found with hypotheses. |
| §4.4 Top frame coinvariants (932) | n=0,1,2; all entries 1 | S₀=ℤ, S₁=Fˣ, e maps to (0,1). Source-dependent generator and relation formulas remain uncertified. |
| §4.5 Connecting homomorphisms and ordered Milnor symbols (957) | n=1; ordered pair of units; a=1 in rank-two symbols | δ₁ normalization and symbol order consistent; Hutchinson Lemma 2.9 supports the unstable presentation. |
| §4.6 Splitting the frame algebra (998) | n=0,1,2; multiplication by e | Low-degree splitting compatible with the claimed base cases; simultaneous stability proof needs the unread Suslin source. |
| §4.7 Diagonal and monomial subgroups (1008) | n=0,1,2; scalar matrix; determinant-one diagonal | D, M and P keep distinct roles; scalar stabilizer is diag(a,a). |
| §4.8 The stability induction (1029) | n=0,1; stabilization below/on stated range | No finite-field stability inferred from the infinite-field argument. Primary proof/locator uncertified. |
| §4.9 Ordered configurations and augmentation (1043) | Empty tuple; repeated entry; three points; F₂ | Augmentation and distinct-point restriction retained; infinite-field acyclicity is not extended indiscriminately. |
| §4.10 Projective configuration coinvariants (1072) | (0,∞,1,x); first-two swap; central diagonal | Cross-ratio orbit normalization and scalar stabilizer agree with §3.2. |
| §4.11 The rank-two spectral sequence (1082) | a=0,1,2; a=2 in F₃; rational valuation pairing | Determinants 1−a,a(1−a),a; coordinate shear cancels exterior component with the correct sign. |
| §4.12 The rank-two Bloch map (1137) | Diagonal torus; symbol 2; Bloch versus pre-Bloch target | Map is built via the boundary kernel; no abstract cyclic choice replaces the edge map. Mixed comparison absent: R04. |
| §4.13 General position, rotations and the cone (1162) | One and two faces; rotated tuple; cone differential | Cone sign is retained; source's corrected general-position convention does not introduce degenerate generators. |
| §4.14 The rank-three comparison and coefficient change (1198) | Rank-two inclusion; zero class; a rank-three frame | Comparison uses the specified chain map, not equality of group orders. Primary Suslin formula uncertified where not reproduced by K-book. |
| §4.15 Permutation classes and the monomial sequence (1229) | Σ₀,Σ₁,Σ₂; C₁; C₇ power two; D₈ matrices | Stability range and aʲ power law consistent; Γ determinant and three conjugations checked. |
| §4.16 Indecomposable monomial homotopy (1281) | F₂; ℚ; sphere unit η³ | Indecomposable quotient kills η³ and leaves ℤ/12; the full π₃ is not confused with it. R05. |
| §4.17 Cyclic Chern classes, doubling and Bocksteins (1308) | Weights +1,−1; m=2,3,8 | Second Chern class is −u²; doubled ordinary Tor map is distinct from the detector. |
| §4.18 Detecting ordinary Tor in an algebraic closure (1320) | C₂ roots over ℚ; C₇ power two; divisible torsion roots | Detector is nonzero at order two; weight is a²; ordinary tensor of divisible torsion roots vanishes. |
| §4.19 Enhanced torsion and its root-group model (1351) | F₂,F₃,ℚ; algebraically closed field; finite even root group | Enhanced orders agree with squaring preimage; natural Tor model and chosen root model remain distinct. |
| §4.20 The natural infinite-field Suslin sequence (1389) | ℚ; characteristic two infinite field; algebraic closure | Infinite-field exact sequence has correct enhanced kernel. Missing mixed-domain naturality is R04, not a counterexample to the infinite theorem. |
| §4.21 Rigidity under purely transcendental extension and the rational-curve presentation (1405) | F₂,F₃ rational function fields; DVR collisions; [t]+[1−t] | K₃-ind rigidity includes small fields; Bloch rigidity needs size≥4 and R04 for finite base fields. |
| §5.1 Finite-field indecomposables and transfer (1440) | q=2,3,4; Frobenius; identity extension | Finite K₃ order q²−1 and zero Milnor degree≥2 agree with suppliers. |
| §5.2 Unstable special-linear homology (1454) | q=2,3,4,5,7,8,9,27; Q₈; trivial subgroup | Characteristic-primary exceptions and localized orders match Hutchinson. Norm-one input is forward: R08. |
| §5.3 The finite stabilization equivalence (1485) | q=2,3; quadratic field extension; actual stabilization | Small-field checks remain after localization; closure detector is separate from arbitrary cyclic equivalences. |
| §5.4 The finite cross-ratio homomorphism (1516) | q=4,5,7; transitive/nontransitive subgroup action | Kernel orders 6,40,12 respectively use integral H₃; degenerate tuples handled by chain comparison. |
| §5.5 The finite Bloch sequence and its orders (1556) | q=2,3 excluded; q=4,5,7; maps to algebraic closure | Left kernel orders 3,8,12 correct. Finite-to-finite naturality does not supply R04. |
| §5.6 Odd coefficients and the norm-one Cartan (1594) | n=1; q=7,n=3; basis change; quadratic Cartan | Coprimality is essential; multiplication matrices preserve determinant norm. Move elementary embedding per R08. |
| §5.7 Number-field quotient applications (1625) | ℚ; ℚ(i); zero/one/multiple real places | Quotient arithmetic is consistent with the claimed ambient structures; those structures lack an eligible supplier: R07. |
| §5.8 A real detector for the universal torsion class (1643) | x=1/2,2,−1; ℚ; non-Archimedean real closure | ρ(c)=−π²/6 has order six. Arbitrary formally real transfer needs R02; dependency cycle R08; locator R13. |
| §6.1 Five-term equality certificates (1680) | Zero certificate; lone [1]; pair (2,3); inadmissible pair; [2] over ℚ | Finite-support membership criterion sound; no search bound asserted. Easy Lean carrier omitted: R03; order R08. |
| §6.2 Boundary certificates and Bloch elements (1709) | s=0,1,2; m₀=1,2; direct summand versus nonprimitive generators | Diagonal and cross components retained; converse correctly requires a direct summand. |
| §6.3 Integral multiples of root symbols (1753) | m=0 in generic API; m=2; x in kernel; primitive sixth root | Integral root multiple sound; no division in the kernel is assumed. Missing kernel-member mirror: R09. |
| §6.4 Dividing root multiples over coefficient rings (1780) | R=0; R=ℤ/5; m=2,l=4; nonflat coefficients | Denominator independence follows by cross-multiplication inside the kernel; no false tensor injectivity is used. R09. |
| §6.5 Suslin fibres and finite bar witnesses (1820) | Fibre over 0; ℤ/24→ℤ/6 over 1; trivial group | Four lifts, no additive section, unique kernel difference. Unnormalised boundary gives distinct chain certificates. R09. |
| §6.6 Integral, rational and finite quotients (1870) | ℚ; F₄→F₄(t); n=1,2,odd; root-hypothesis failure | Snake sequence and coefficient distinctions sound; all-field naturality/finite rigidity need R04. |
| §6.7 Genuine finite-coefficient comparison (1888) | n=1,2,5; ℚ at 5; roots absent | {2,−31} has order five by tame residue; finite K differs from tensor quotient. Isomorphism supported for all invertible moduli; supplier needs R07/R11/R12. |

### Explicit target inventory

The following table binds every inventoried target/API name to the adversarial row above. Repeated occurrences of a name are retained in the working inventory; this display deduplicates within each subsection. Unnamed theorem assertions are covered by their subsection row.

| README section | Explicit target/API names read |
|---|---|
| 1.1 | `bStPlus`, `bStPlus.ι_homology`, `bStPlus.toBGLPlus`, `bStPlus_map`, `bStPlus_map_id`, `bStPlus_map_comp`, `bStPlus_twoConnected`, `bStPlus_pi_eq_K`, `bStPlus_fibration` |
| 1.2 | `K3Homological.comparison`, `K3Homological.comparison_apply`, `K3Homological.comparison_symm_apply`, `K3Homological.comparison_zero`, `K3Homological.comparison_add`, `K3Homological.comparison_eq_zero` |
| 1.3 | `barCycle3`, `barCycle3.mk`, `barBoundary3`, `evalBarCycle`, `evalBarCycleHom`, `evalBarCycle_eq`, `evalBarCycle_boundary`, `evalBarCycle_surjective`, `evalBarCycle_map`, `evalBarCycle_eq_iff`, `K3Homological.eval3`, `K3Homological.eval3_comparison`, `K3Homological.eval3_zero`, `K3Homological.eval3_add`, `K3Homological.eval3_zsmul`, `K3Homological.eval3_boundary`, `K3Homological.eval3_eq_iff_certificate`, `K3Homological.eval3_surjective`, `K3Homological.bar_four_identity_boundary`, `K3Homological.bar_noncycle` |
| 1.4 | `comparison_natural`, `eval3_natural`, `chainsMap_boundaryWitness`, `finiteStageCycle_exists`, `finiteStageBoundary_exists` |
| 1.5 | `elementaryCover.mul_project`, `elementaryCover.unit_left`, `elementaryCover.unit_right`, `elementaryCover.hspace_map`, `hopfHurewicz_exact`, `hopf_eq_minusOneProduct`, `elementaryHomology_exact`, `wedgeTwoSpheres_pi3`, `hilton-wedge`, `hopfComposition_add`, `sphereUnit_eta_minusOne` |
| 2.1 | `milnorToQuillen3`, `milnorToQuillen3_symbol`, `milnorToQuillen3_symbol_eq_mul`, `milnorToQuillen3_map`, `milnorToQuillen3_map_id`, `milnorToQuillen3_map_comp`, `milnorToQuillen3_graded`, `K3ind`, `K3ind.mk`, `K3ind.mk_surjective`, `K3ind.mk_eq_zero_iff`, `K3ind.mk_milnorToQuillen3`, `K3ind.lift`, `K3ind.lift_mk`, `K3ind.ext`, `K3ind.map`, `K3ind.map_id`, `K3ind.map_comp`, `K3ind.map_mk`, `K3ind.equivQuotient`, `K3ind.decomposable` |
| 2.2 | `motivicEdgeQuotientEquiv`, `motivicEdgeQuotientEquiv_apply`, `motivicEdgeQuotientEquiv_symm_apply`, `motivicEdgeQuotientEquiv_unique`, `motivicEdgeQuotientEquiv_map`, `integralChern_milnor_diagonal`, `milnor_charPrimary_torsionFree`, `artinSchreier_torsion_normKernel`, `weightTwo_degreeZero_modTwo`, `algebraicClosure_K4_allPrimeDivisible` |
| 2.3 | `realBasis`, `realBasis_signature`, `realBasis_nonzero`, `realBasis_two_nsmul`, `realBasis_expand`, `realBasis_map`, `decomposableSignature`, `decomposableSignature_apply`, `decomposableSignature_symm`, `decomposableSignature_two_nsmul`, `decomposableSignature_card`, `decomposableSignature_map` |
| 2.4 | `totallyImaginaryQuotientEquiv`, `totallyImaginaryQuotientEquiv_apply`, `totallyImaginaryQuotientEquiv_symm_apply`, `totallyImaginaryQuotientEquiv_map`, `stableHurewiczQuotientEquiv`, `stableHurewiczQuotientEquiv_apply`, `stableHurewiczQuotientEquiv_symm_apply`, `stableHurewiczQuotientEquiv_unique`, `stableHurewiczQuotientEquiv_map` |
| 3.1 | `antisymSquare`, `antisymSquare.mk`, `antisymSquare.ker_mkQ`, `antisymSquare.antisymm`, `antisymSquare.wedge_self_add`, `antisymSquare.two_smul_wedge_self`, `antisymSquare.wedgeSelf`, `antisymSquare.lift`, `antisymSquare.lift_mk`, `antisymSquare.hom_ext`, `antisymSquare.map`, `antisymSquare.toExterior`, `antisymSquare.equivAntisymmetricTensors`, `antisymSquare.equivCoinvariants`, `antisymSquare.prodEquiv`, `antisymSquare.zmodEquiv` |
| 3.2 | `crossRatio`, `crossRatio_smul`, `crossRatio_std`, `crossRatio_eq_iff`, `isMultiplyPretransitive_three`, `crossRatio_swap`, `crossRatio_faces` |
| 3.3 | `fiveTerm`, `fiveTermSubgroup`, `fiveTerm_mem`, `fiveTerm_args_ne_zero`, `fiveTerm_args_ne_one`, `Admissible.oneSub`, `Admissible.inv`, `fiveTerm_oneSub`, `fiveTerm_inv`, `fiveTerm_map` |
| 3.4 | `preBloch`, `preBloch.gen`, `preBloch.gen_one`, `preBloch.fiveTerm`, `preBloch.lift`, `preBloch.lift_gen`, `preBloch.hom_ext`, `preBloch.induction_on`, `preBloch.map`, `preBloch.equivAdmissible` |
| 3.5 | `blochBoundary`, `blochBoundary_gen`, `blochBoundary_one`, `blochBoundary_c`, `blochBoundary_angle`, `blochBoundary_map`, `blochBoundary_comp_exterior`, `blochGroup`, `blochGroup.mem_iff`, `blochGroup.map`, `blochGroup.coe`, `blochGroup.ext` |
| 3.6 | `BlochGroup.c`, `BlochGroup.c_eq`, `BlochGroup.c_mem`, `BlochGroup.map_c` |
| 3.8 | `extBloch`, `mem_extBloch_iff`, `blochGroup_le_extBloch`, `extBloch.map` |
| 3.9 | `LectureBloch.lambda_symbol`, `LectureBloch.mem_iff`, `LectureBloch.inclusion_injective`, `LectureBloch.map_symbol`, `LectureBloch.boundary_compare`, `LectureBloch.mu_coe`, `LectureBloch.mu_ker`, `LectureBloch.muRel_injective` |
| 3.10 | `lectureObstruction`, `lectureObstruction_surjective`, `lectureObstruction_exact`, `lectureObstruction_six` |
| 3.11 | `GoncharovB2.class`, `GoncharovB2.eq_iff`, `GoncharovB2.lift`, `GoncharovB2.map_symbol` |
| 3.12 | `GoncharovCurve.class`, `GoncharovCurve.eq_iff`, `GoncharovCurve.lift`, `GoncharovCurve.specialization_relation`, `GoncharovCurve.boundary_class`, `GoncharovCurve.boundary_unique`, `GoncharovCurve.mem_kernel` |
| 3.13 | `cgzBloch`, `cgzBloch.mk`, `cgzBloch.gen_one`, `cgzBloch.gen_infty`, `cgzBloch.three_zero`, `cgzBloch.xi_mem`, `cgzBloch.map` |
| 3.14 | `CGZPublished.negativeTensor_zero`, `CGZPublished.tensorProjection_surjective`, `CGZPublished.tensorLift`, `CGZPublished.symmetrizer_le` |
| 3.15 | `CGZPublished.boundary_symbol`, `CGZPublished.relations_le_kernel`, `CGZPublished.boundaryQuotient_unique`, `CGZPublished.boundary_ordinary`, `CGZPublished.cycleClass`, `CGZPublished.cycleClass_eq_iff`, `CGZPublished.kernelEquiv`, `CGZPublished.cycleLift` |
| 3.16 | `CGZPublished.compare_coe`, `CGZPublished.compare_c`, `CGZPublished.compare_angle`, `CGZPublished.compare_natural` |
| 4.1 | `configHyperhomology`, `configHyperhomology.toCoinvariants`, `configHyperhomology.iso_groupHomology`, `configHyperhomology.map_quasiIso`, `configHyperhomology.map` |
| 4.2 | `unimodularChains`, `unimodularChains.frame`, `unimodularChains.frame_d`, `unimodularChains.basisEquiv`, `unimodularChains.glRepresentation`, `unimodularChains.mapField`, `unimodularChains.affineMap`, `unimodularChains.affineMap_frame`, `unimodularChains.glRepresentation_frame` |
| 4.4 | `stabilityCoinvariants`, `stabilityCoinvariants.gen`, `stabilityCoinvariants.ext`, `stabilityCoinvariants.relation`, `stabilityCoinvariants.mul`, `stabilityCoinvariants.milnorRetraction`, `stabilityCoinvariants.unit`, `stabilityCoinvariants.mul_unit`, `stabilityCoinvariants.eMul`, `stabilityCoinvariants.eMul_apply` |
| 4.5 | `frameConnecting`, `frameConnecting_stabilization`, `frameConnecting_product`, `frameConnecting_one`, `frameConnecting_field`, `milnorHomologyTheta`, `milnorHomologyTheta_symbol`, `milnorHomologyTheta_field`, `milnorHomologyTheta_unique` |
| 4.7 | `diagonalSubgroup`, `permSubgroup`, `monomialSubgroup`, `diagonalSubgroup_normal`, `diagonalSubgroup_equiv`, `monomialSubgroup.stable` |
| 4.9 | `configComplex`, `configComplex.single`, `configComplex.d_single`, `configComplex.d_comp_d`, `configComplex.aug`, `configComplex.aug_comp_d`, `configComplex.smul`, `configComplex.toRep`, `configComplex.map` |
| 4.12 | `psiGL2`, `psiGL2_coe`, `psiGL2_surjective`, `psiGL2_natural` |
| 4.13 | `gpComplex`, `gpComplex.le`, `gpComplex.smul`, `gpComplex.rotate`, `gpComplex.aug_quasiIso`, `precyclicConfig`, `acyclicConfig`, `acyclicConfig_exact`, `normMap`, `coneD`, `coneD.aug`, `coneD_quasiIso`, `coneD.smul` |
| 4.14 | `psiPrime`, `psiPrime_comp_d`, `psiGL3`, `psiGL3_natural`, `psiGL3_stable` |
| 4.15 | `stableMixedHomology_is_diagonal`, `monomialRelativeH3_generators`, `permutationTwoPrimary_vanishes`, `cyclicHomology_maps`, `Rep.FiniteCyclicGroup.groupHomologyIsoOdd`, `groupHomologyIsoEven`, `GroupHomology/FiniteCyclic`, `cyclicHomology_power_map`, `GroupCohomology/FiniteCyclic`, `symmetricGroup_homology_stable` |
| 4.16 | `pi3Ind`, `pi3Ind.mk`, `pi3Ind.toStable`, `pi3Ind.toK3ind`, `pi3Ind.map` |
| 4.18 | `closureTorsionDetector`, `closureTorsionDetector_formula`, `closureTorsionDetector_field`, `closureTorsionDetector_fixed` |
| 4.19 | `enhancedTor`, `enhancedTor.toTor`, `enhancedTor.map`, `enhancedTor.char_two`, `enhancedTor.nonsplit`, `enhancedTor.equivEnhancedMu`, `enhancedRootsOfUnity`, `enhancedRootsOfUnity.toRoots`, `enhancedRootsOfUnity.odd_eq`, `enhancedRootsOfUnity.even_card`, `enhancedRootsOfUnity.finite_eq`, `enhancedRootsOfUnity.map`, `enhancedRootsOfUnity.ne_tor` |
| 5.2 | `finiteGroup_stableElements`, `TauCeti.groupCohomology`, `TauCeti.ContinuousCohomology.corestriction_mackey`, `ContCohomology/Corestriction/Mackey/AllDegrees`, `finiteGroup_homologyDuality`, `quaternionPeriodicHomology`, `finiteGroup_period_fromSylow` |
| 5.3 | `finiteStabilization`, `finiteStabilization_natural`, `finiteStabilization_unique`, `finiteStabilization_hurewicz`, `finiteQuadraticTorus_factorization`, `finiteStabilization_injective`, `finiteStabilization_bijective`, `algebraicClosureStabilization` |
| 5.4 | `finiteBlochHom`, `finiteBlochHom_natural`, `finiteBlochHom_char_torsion`, `finiteBlochHom_cyclic_bar`, `refinedPreBloch`, `finiteConfiguration_lowDegree_comparison`, `finiteConfiguration_barComparison`, `barComparison.aug`, `barComparison.d`, `barComparison.homotopy`, `barComparison.edge`, `refinedConfiguration_page`, `refinedConfiguration_d2`, `refinedConfiguration_torusComparison`, `refinedConfiguration_edge`, `finiteRefined_forget_equiv` |
| 5.5 | `finiteK3Bloch`, `finiteK3Bloch_triangle`, `finiteK3Bloch_natural`, `finiteK3Bloch_surjective` |
| 5.6 | `cartanEmbedding`, `cartanEmbedding_toMatrix`, `cartanEmbedding_injective`, `cartanEmbedding_changeBasis` |
| 5.8 | `realRogersHom`, `realRogersHom_pos`, `realRogersHom_gt_one`, `realRogersHom_neg`, `realRogersHom_unique` |
| 6.1 | `FiveTermCertificate`, `FiveTermCertificate.eval`, `FiveTermCertificate.eval_single`, `FiveTermCertificate.eval_zero`, `FiveTermCertificate.eval_add`, `FiveTermCertificate.Valid`, `FiveTermCertificate.Valid.add`, `FiveTermCertificate.decidableValid`, `FiveTermCertificate.mem_fiveTermSubgroup_iff`, `FiveTermCertificate.map`, `FiveTermCertificate.Valid.modN`, `FiveTermCertificate.toCGZ` |
| 6.2 | `BoundaryCertificate`, `BoundaryCertificate.boundary`, `BoundaryCertificate.Valid`, `BoundaryCertificate.decidableValid`, `BoundaryCertificate.boundary_map`, `BoundaryCertificate.sound`, `BoundaryCertificate.complete_of_summand`, `BoundaryCertificate.add`, `BoundaryCertificate.map`, `BoundaryCertificate.reduce`, `ofData`, `ofData_coe`, `ofData_ext`, `ofData_certificate`, `ofData_zero`, `ofData_add`, `ofData_surjective`, `ofBoundaryCertificate`, `ofData_elementC`, `ofData_map`, `ofData_cgz` |
| 6.3 | `rootMultiple`, `rootMultiple_coe`, `rootMultiple_proof_irrel`, `rootMultiple_zero`, `rootMultiple_of_mem`, `rootMultiple_mul`, `rootMultiple_map` |
| 6.4 | `rootCoefficient`, `rootCoefficient_toPre`, `rootCoefficient_zero`, `rootCoefficient_of_mem`, `rootCoefficient_denominator_independent`, `rootCoefficient_changeRing`, `rootCoefficient_map`, `rootCoefficient_specializations`, `rootClassMod`, `rootClassMod_indep`, `rootClassMod_toPreBloch`, `rootClassMod_of_mem`, `rootClassLoc`, `rootClassLoc_toPreBloch`, `rootClassPadic`, `rootClassLoc_reduce`, `rootClass_map` |
| 6.5 | `SuslinLift`, `SuslinLift.ofRep`, `SuslinLift.over`, `SuslinLift.ext`, `SuslinLift.choose`, `SuslinLift.translate`, `SuslinLift.translate_zero_add`, `SuslinLift.unique_difference`, `SuslinLift.map`, `SuslinLift.map_id_comp`, `BarLiftCertificate`, `BarLiftCertificate.chain`, `BarLiftCertificate.cycle_eq`, `BarLiftCertificate.homology`, `BarLiftCertificate.over`, `BarLiftCertificate.ofCycle`, `BarLiftCertificate.ofChain`, `BarLiftCertificate.ofChain_chain`, `BarLiftCertificate.ext`, `BarLiftCertificate.addBoundary`, `BarLiftCertificate.choose`, `BarLiftCertificate.map`, `BarLiftCertificate.map_id_comp` |

### Suggested.lean declaration and context ledger

All lines below are in `packages/K3BlochGroups/Suggested.lean`. Layer and namespace are explicit. “Type*” retains the declaration's polymorphic algebraic universe; the group-homology declarations deliberately use Type, matching the coefficient representation's universe. Irrelevant earlier section variables do not enter a declaration merely because they were written above it. The results here are manual signature/proof-body checks; no elaboration was run.

| Line; layer; declaration | Effective variable/instance context | Instance/result |
|---|---|---|
| 25; L1; `K3Homological.comparison` | K,P,H,J,S : Type*; five AddCommGroup instances; four AddEquiv inputs | ℤ/5 doubling gives inverse 3, not 2. |
| 29; L1; `K3Homological.comparison_apply` | Same five additive groups; q,h,j,b and x:K | Matches real body in the required order. |
| 33; L1; `example` | Concrete ℤ; four identity equivalences | Evaluates to 3. |
| 37; L1; `example` | Concrete ZMod 5; q additive equivalence; hq specifies doubling | 2·3=1 modulo 5; hq is not the conclusion. |
| 46; L1; `K3Homological.comparison_eq_zero` | Same five additive groups; q,h,j,b and x:K | Equivalence injectivity; zero and nonzero cases. |
| 51; L1; `K3Homological.integralRep` | G:Type; Group G | Existing trivial Rep, no new homology model. |
| 56; L1; `K3Homological.eval3` | G,A:Type; Group G; AddCommGroup A; c:A≃+H₃(G) | Homology projection followed by c⁻¹. |
| 61; L1; `K3Homological.eval3_eq_iff_certificate` | Same G,A,c; z,z′ in actual cycles | Kernel of π is image of d₄; correct sign z−z′. |
| 69; L1; `K3Homological.eval3_surjective` | Same G,A,c | π and c⁻¹ both surjective. |
| 73; L1; `example` | Same G,A,c | Zero maps to zero. |
| 76; L1; `example` | Same G,A,c; finite four-chain w | Boundary class maps to zero. |
| 88; L1; `K3Homological.bar_four_identity_boundary` | G:Type; Group G | Five signs sum to +1. |
| 94; L1; `K3Homological.bar_noncycle` | G:Type; Group G; g≠1 | d₃=[1,1]−[g,1], nonzero for g≠1. |
| 108; L3; `Symbols.RawSymbols` | F:Type*; Field F | F₂ has no reduced generators; F₃ has one. |
| 111; L3; `Symbols.rawSymbol` | F:Type*; Field F; x:F | 0 and 1 killed; 2 over ℚ survives. |
| 116; L3; `Symbols.Admissible` | F:Type*; Field F; x,y:F | Excludes equality and all zero denominators. |
| 119; L3; `Symbols.fiveTermRaw` | F:Type*; Field F; admissible x,y | At (2,3), fractions are 3/2,3/4,1/2. |
| 124; L3; `Symbols.fiveTermRaw_oneSub` | F:Type*; Field F; admissibility of both pairs | Exact raw identities tested at three rational pairs. |
| 130; L3; `example` | F:Type*; Field F | Both branches evaluate to zero. |
| 133; L3; `example` | Concrete ℚ | Nondegenerate free generator is nonzero. |
| 136; L3; `example` | F:Type*; Field F; x:F | Both are inadmissible. |
| 139; L3; `example` | Concrete ℚ | Five inequalities hold. |
| 142; L3; `example` | Concrete ℚ; proof Admissible 2 3 | Matches rational five terms. |
| 152; L4; `rankTwoFaceMatrices` | F:Type*; Field F; a:F | Column action and determinant conventions checked. |
| 157; L4; `rankTwoFaceMatrices_det` | F:Type*; Field F; a:F | Determinants 1−a,a(1−a),a. |
| 163; L4; `example` | Concrete ℚ; a=2 | Values −1,−2,2. |
| 169; L4; `example` | Concrete ℚ and ZMod 3 | Values 0,0,1, including characteristic three. |
| 177; L4; `rankTwoBoundarySplit` | V,T:Type*; AddCommGroup instances; alt:T→+V | Inverse subtracts alt; valid even on zero groups. |
| 185; L4; `example` | Same V,T,alt; t:T | Exterior coordinate cancels; inverse restores it. |
| 191; L4; `example` | Concrete ℤ; identity and zero alt | Zero alt is a discriminating negative control. |
| 197; L4; `permutationSylowBasis` | No variables; integral 4×4 matrix | Γ has determinant +1. |
| 200; L4; `example` | No variables; explicit integral inverse | Both matrix products equal identity. |
| 208; L4; `example` | No variables; three explicit permutation matrices | Three displayed conjugations agree by multiplication. |
| 225; L4; `cyclicHomology_power_map` | m,a,j:ℕ; NeZero m; hj:1≤j; coefficient morphism φ and hφ=id | C₁ trivial; j=1 is power a; C₇,j=2,a=2 gives 4; hφ fixes coefficients. |
| 238; L5; `finite_sl2_localized_homology` | F:Type; Field/Fintype F; p:ℕ; Fact p.Prime; CharP F p | q=2,3 gives orders 3,8; characteristic-primary part correctly inverted. |
| 254; L6; `rootMultiple` | P,W:Type*; AddCommGroup; δ,x,m,h:δ(mx)=0 | m=0 gives zero; m=2 in ℤ→ℤ/2 gives 2. |
| 260; L6; `rootCoefficient` | Same P,W,δ,x,m,h; R:Type* CommRing; u:Rˣ and u=m | m=2 over ℤ/5 divides by 3; R=0 harmless. |
| 265; L6; `rootCoefficient_toPre` | Same explicit kernel data and coefficient-unit equality | Balancing gives mx⊗m⁻¹=x⊗1; no flatness needed. |
| 272; L6; `rootCoefficient_denominator_independent` | Same P,W,R; two annihilators m,l and units u,v | Cross-multiply inside kernel, then invert ml; includes zero coefficient ring. |
| 278; L6; `example` | Concrete ℤ→ℤ/2; m=2; annihilation proof | Underlying element exactly 2. |
| 282; L6; `example` | P,W additive groups; δ,x; m=0 | Subtype equality to zero. |
| 287; L6; `example` | Concrete ℤ→ℤ/2 and R=ZMod 5; u=2 | Inverse of 2 is 3 modulo 5. |
| 298; L6; `example` | P,W additive groups; R CommRing; x=0; annihilator and unit | Tensor with zero kernel element vanishes. |
| 312; L6; `SuslinLift` | K,B:Type*; AddCommGroup; q:K→+B; β:B | Definition allows empty fibres, as it should. |
| 315; L6; `SuslinLift.translate` | K,B,T additive groups; q,i; qi=0; β,a,t | q(a+i(t))=β; proof qi=0 retained. |
| 320; L6; `SuslinLift.unique_difference` | K,B,T additive groups; i injective; image i=kernel q; β,a,b | b−a in ker q; injectivity gives unique t. Surjectivity of q unnecessary. |
| 325; L6; `example` | Concrete quotient ZMod 24→ZMod 6; β=1 | Representatives 1,7,13,19. |
| 329; L6; `example` | Same K,B,T,q,i; qi=0; β,a; t=0 | Translation by zero fixes a. |
| 334; L6; `example` | Same K,B,T,q,i; qi=0; β,a,s,t | Successive translations commute additively. |
| 351; L6; `BarLiftCertificate` | G,B:Type; Group G; AddCommGroup B; ψ:H₃(G)→ₗ[ℤ]B; β | Retains cycles rather than homology representatives alone. |
| 355; L6; `BarLiftCertificate.chain` | Same G,B,ψ,β; cycle certificate c | Underlying finite chain from iCycles. |
| 361; L6; `BarLiftCertificate.exists_of_surjective` | Same G,B,ψ,β; ψ surjective | Lift via ψ then π; explicit surjectivity needed. |
| 366; L6; `example` | Same G,B,ψ; β=0 | Zero cycle supplies zero chain. |
| 372; L6; `BarLiftCertificate.trivial_nonzero` | Same G,B,ψ; Subsingleton G; β≠0 | Trivial-group H₃ vanishes, so nonzero β has empty fibre. |
| 377; L6; `BarLiftCertificate.trivial_boundary` | Same G,B,ψ; Subsingleton G; β=0 | All-identity degree-three chain is nonzero but d₄ of all-identity four-chain. |

### Source-locator ledger

Each row is one verified locator group. The table records support and boundaries; none of the source text is reproduced. Source identifiers refer to the legal source-service extractions. Printed-page and combined-PDF numbering were kept separate. Some manuscript extraction glyphs are imperfect; conclusions below use legible statements and matching formulas, not reconstructed missing passages.

| # | Source and locator checked | Extraction witness and result |
|---|---|---|
| 1 | K-book III, Theorem 7.7.2 | weibel3 line 3342: differential-symbol theorem includes characteristic two. |
| 2 | K-book III, Theorem 7.8 | weibel3 line 3350: characteristic-primary Milnor torsion-freeness. |
| 3 | K-book III, Lemma 7.8.1 | weibel3 line 3378: the specific norm-obstruction subgroup is p-divisible. |
| 4 | K-book III, Proposition 7.8.2 | weibel3 line 3386: norm-kernel equality; the roadmap does not copy the subsequent I/V misprint. |
| 5 | K-book IV, Exercise 1.9 | weibel4 line 660: universal-central-extension fibre, two-connectivity and K₃/H₃. |
| 6 | K-book IV, Lemma 1.19 and Remark 1.19.1 | weibel4 line 570 and line 585: Hopf kernel and H-space extension. |
| 7 | K-book IV, Corollary 1.20 | weibel4 line 593: multiplication by the external −1 class. |
| 8 | K-book IV, Exercise 1.12(a),(e) | weibel4 line 677 and line 689: sphere unit and composition/product convention. |
| 9 | K-book IV, Theorem 4.9.3 and Example 4.10.1 | weibel4 line 2052 and line 2074: trivial and free-G-set Barratt–Priddy models. |
| 10 | K-book V, Finite coefficients 11.3.2 | weibel5 line 3729: cofinal odd/8-divisible product range. Its blanket word “homomorphisms” does not override R12's explicit counterexample. |
| 11 | K-book V, Lemma 11.13 | weibel5 line 3915: signed factorial, in particular +2 in degree three. |
| 12 | K-book VI, §§1.3–1.6 | weibel6 line 73: algebraically closed rigidity and coefficient calculations, including characteristic-primary rigidity. |
| 13 | K-book VI, Definition 2.1 and its torsion convention | weibel6 line 269: torsion e-invariant and finite Bockstein normalization. |
| 14 | K-book VI, 4.3.1–4.3.2 | weibel6 line 755: low-degree motivic sequence and injectivity; division by two is not assumed in characteristic two. |
| 15 | K-book VI, opening and Definition 5.1 | weibel line 29550: antisymmetric quotient, diagonal A/2A, five terms and boundary. |
| 16 | K-book VI, Remark 5.1.1 and Theorem 5.2 | weibel line 29568 and line 29587: small-field exclusions and enhanced-kernel exact sequence. |
| 17 | K-book VI, Definition 5.9 and printed Example 5.9.1 | weibel line 29872 and line 29909: cone and general-position construction; displayed example number differs from its internal cross-reference label. |
| 18 | K-book VI, Proposition 5.17 | weibel6 line 1506: monomial AHSS and indecomposable stable-unit term. |
| 19 | K-book VI, Lemmas 5.18–5.20 | weibel6 line 1540, line 1554 and line 1580: doubling, closure detector and enhanced extension. |
| 20 | Hutchinson 2013 v2, Lemma 2.9 | hutchinson2013 line 367: unstable rank-two symbol presentation with its stated size assumption. |
| 21 | Hutchinson 2013 v2, Corollaries 3.6–3.7, Lemmas 3.8–3.9 | hutchinson2013 line 704: localized homology, subgroup injection, conjugation and stabilization. |
| 22 | Hutchinson 2013 v2, Lemma 3.14 | hutchinson2013 line 861: exactly the seven exceptional characteristic-primary cases. |
| 23 | Hutchinson 2013 v2, Lemma 7.4 | hutchinson2013 line 1679: quaternion/C₄ edge computations. |
| 24 | Hutchinson 2013 v2, Corollary 7.5 | hutchinson2013 line 1731: finite Bloch kernel; roadmap separately treats F₂,F₃. |
| 25 | Mirzaii v2, Lemma 4.1, pp.8–10 | mirzaii line 365: pair of boundary coordinates and explicit bar calculation; the shear matches the chosen signs. |
| 26 | Levine, Theorem 4.12, pp.335–336 | levine line 2851: indecomposable finite-Chern isomorphism and reduction ladder. |
| 27 | Hutchinson 2024 v4, Theorem 2.10 | hutchinson2024 line 170: all fields and all invertible moduli, not only odd number-field coefficients. |
| 28 | CGZ 2021 v3, Definitions 1.1,2.1 and Lemma 2.2 | cgz2021 line 78, line 380 and line 389: exterior convention; the roadmap's intersection repair addresses the noncycle relation. |
| 29 | CGZ 2023, Definition 2.1 and Lemma 2.2, p.391 | cgz2023 line 453 and line 459: negative-unit quotient, distinct from the older exterior target. |
| 30 | CGZ 2021/2023, Lemma 4.4 | cgz2021 line 1128 and cgz2023 line 1281: odd-prime comparison diagram; no integral identification follows from it. |
| 31 | Goncharov, §1.9, Lemma 1.16, Conjecture 1.20, Proposition 1.22 | goncharov line 782, line 903 and line 909: specialization versus conditional all-curve relation equality. |
| 32 | Zagier, II.1.A, pp.23–24 | zagier line 1023 and line 1064: interval normalization and midpoint value; the roadmap's shifted real detector has the stated value on c. |
| 33 | Kerz, Theorems 1–2 | kerz line 22 and line 82: injective-word complex and Nakaoka range; n_old≥2m agrees with m<n_new/2. |
| 34 | Hatcher, Examples 4.51–4.52 and Exercise 37 | hatcher line 16494, line 16500 and line 17029: Hopf generator, sphere-wedge basis and H-space Whitehead vanishing. |

### Supplier ledger

| Current supplier | Contracts checked and outcome |
|---|---|
| StableHomotopyKTheory, 8b81fab | Filtered homology, BG/group homology, plus/UCE/cover, H-space, Picard, Barratt–Priddy, stable stems and AHSS; section drift is R05. |
| GeneralAlgebraicKTheory, 5705674 | §§1.8,3.2–3.4,3.12,7.4,13.8a–c: stable groups, plus/Q groups, external product and finite-field computation. |
| K2SymbolsBrauer, a969ec1 | §§5.4,5.6,5.12–5.14,7.2,8.1–8.4,10.32: Milnor presentation/products, finite vanishing, algebraically closed unique divisibility, Matsumoto and number-field signatures. |
| AlgebraicKTheory, e5df75b | A5, lines 85–89: stable Steinberg universal central extension, not a finite-rank assertion. |
| PolylogarithmFunctions, 6e452e5 | Actual §§6.1,6.3–6.5 supply the required Rogers identities; obsolete stage locator is R13. |
| SchemeKTheoryOperations, 03713e1 | §3.6 boundary/specialization signs; §4.7, line 1313, DVR splitting with residue field finite over a coefficient field; §5.5 projective bundle and §6.4 higher operations. These do not themselves replace integral motivic Chern classes. |
| KTheoryFiniteLocalFields, fb3a9c0 | §§1.5–1.6 finite/perfect-field input; §1.8 Chern operations; §§3.0,3.0a,6.10 provide missing or duplicated full-field inputs. R11–R12. |

KTheoryLowDegrees at ca13fbfc was additionally searched and its related §§13.2–13.4 read: these are relative K₁/K₂ and Steinberg comparison targets, not another K₃/Bloch construction. The five specifically supplied sibling directories were searched at their provided heads; no overlapping K₃/Bloch target or direct supplier citation was found. No current supplier was replaced by a PR that merely revises a roadmap already on main.

## Not verifiable

- **Suslin 1984, Russian pp.188–204:** the source service could not retrieve the cited MathNet text. The alternate Springer DOI resolved only as uncertified and has different pagination. Exact locators and the detailed frame-algebra/stability proof in §§4.2–4.8 remain uncertified; no mathematical defect is inferred merely from that failure.
- **Suslin 1991, English pp.217–239:** the cited Durham PDF timed out twice, and alternate lookup did not retrieve it. K-book, Mirzaii and Hutchinson support parts of the construction, but they do not certify every primary lemma number, orientation and chain formula cited here.
- **Bloch 2000, Lecture 6:** no legal full text was located. Only the attribution of the convention is unverified; the roadmap explicitly does not use a theorem from the monograph. All three missing works are listed together in the scratch `needs-references.toml` with attempted retrievals.
- **Lean elaboration and proof execution:** prohibited by this read-only brief. No claim is made that the file compiles at either the printed stale pins or the actual supplied pins; all 55 declaration types and 23 example bodies were inspected manually.
- **Unlisted source locators:** the ledger certifies its 34 groups only. Other cited passage numbers, including portions of the large configuration/stability development and every locator into the two unread Suslin texts, are not certified by this report. OCR of Goncharov and Levine is imperfect; only the legible listed statements were used.
- **Unavailable supplier contracts:** the absent MotivicEtaleKTheory/ArithmeticKTheory contracts cannot be certified as supplied. R07 and R11 give the repair and existing replacements. There is no declared-gap exemption in the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8ef92f515095aca69c61ab2ac26d5f39da02c341", "job": "RT-K3BlochGroups~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
