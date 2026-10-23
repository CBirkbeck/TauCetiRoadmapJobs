<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/139#issuecomment-6375309610 -->
Red team round 2 pass a (codex) of 9db3d35

Verdict: needs_changes

1. **F01** (P2) The shared genus-one gap duplicates its current owner

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:71: “exactly as specified by K3SurfacesAndSymplecticBoundedness under this same slug”.

   **Claim:** The shared genus-one, wild-canonical, Euler and Jacobian interface is missing from SchemeAndStackFoundations and specified by the sibling under gap:elliptic-surface-geometry.

   **Witness:** TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:716–757 now owns those constructions in §6.0b; its current supplied head contains no elliptic-surface-geometry slug. In particular lines 749–754 state the Jacobian, wild formula and Euler equality.

   **Exact repair text:** “K3SurfacesAndSymplecticBoundedness §6.0b supplies the shared geometric genus-one carrier, component lattices, wild canonical formula, regular Jacobian and Euler comparison, including quasielliptic fibrations. NeronModelsAndSemistableAbelianVarietiesPartII §§2–4 supplies the arithmetic models and local comparisons.” Replace references to gap:elliptic-surface-geometry by those actual targets and remove that redundant gap from the plan. Preserve the other six gaps.

   **Repair test:** The product E×P¹ has χ=0, L=O and canonical pullback O(−2); a Jacobian with χ=1 has L=O(−1). Both are covered by §6.0b, with torsion and wild coefficients retained. No new supplier or upward edge is needed.

2. **F02** (P1) The rationality criterion is cited at a section which assumes rationality

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1140: “Apply the supplier rational genus-one surface criterion.”

   **Claim:** NeronModelsAndSemistableAbelianVarietiesPartII §§4.1–4.4 supplies a criterion proving the Enriques Jacobian geometrically rational.

   **Witness:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:8923–8933 assumes geometric rationality in §4.4. The actual surface_rationalityCriterion is in §6.1, lines 9724–9727; its Jacobian specialization there is elliptic-only.

   **Exact repair text:** “After algebraic closure, use K3SurfacesAndSymplecticBoundedness §6.0b to prove χ(O_J)=χ(O_Y)=1, including quasielliptic fibrations. The Jacobian has no multiple fibres and R¹j_*O=O(−1), hence H¹(O_J)=0 and ω_J=O(−F). Thus H⁰(ω_J²)=0. Apply NeronModelsAndSemistableAbelianVarietiesPartII §6.1 surface_rationalityCriterion to obtain rationality.” Add both precise sections to §4.2's Needs; retain §§4.1–4.3 for the formula, without using §4.4's rationality premise.

   **Repair test:** For E×P¹, χ=0 and h¹(O)=1, so the criterion correctly does not prove rationality. For the required χ=1 Jacobian, h¹=0 and h⁰(ω²)=0 give the criterion's two hypotheses. The general surface criterion also covers the quasielliptic branch.

3. **F03** (P1) The differential obstruction consumes an unowned conductrix sequence

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1784: “ESB supplies the differential/conductrix sequence”.

   **Claim:** The hypotheses of gap:differential-w2-nonlifting are available for L=ω_Y(2C), including the differential quotient and equal section dimensions.

   **Witness:** ESB21 lines 163–176 constructs the missing Frobenius/foliation sequence; lines 219–221 give h⁰(Y,O_Y(2C))=1. Here §1.17 targets only normalization/conductor descent; the gap at line 79 assumes the sequence instead of constructing it.

   **Exact repair text:** Add after §1.17: “For a classical or supersingular geometric Enriques surface in characteristic two, with conductrix C, construct the saturated injection O_Y(2C)→Ω¹_Y and a finite subscheme W giving 0→O_Y(2C)→Ω¹_Y→I_W⊗ω_Y(−2C)→0. If C≠0, prove h⁰(Y,O_Y(2C))=1. Derive the sequence from the normalization's factorization of Frobenius (ESB21, Lemma 2.4 and equation (2.5), p. 5); prove the section assertion as in the proof of Proposition 2.8(2), p. 6. Needs: §1.17; SchemeAndStackFoundations §0.29 and §2.20; Mathlib KaehlerDifferential from RingTheory/Kaehler/Basic.lean:148 for the local differential construction.” Cite this target from §8.3. With L=ω_Y(2C), use §8.1 and vanishing of sections of the negative-conductrix quotient to obtain h⁰(L)=1=h⁰(L⊗ω_Y).

   **Repair test:** For exceptional classical Y, C≠0, L⊗ω=O(2C), and both dimensions are 1; positivity and 2-divisibility hold. For C=0 the positivity premise fails, so the argument cannot falsely obstruct ordinary or nonexceptional unobstructed surfaces.

4. **F04** (P2) The added numerical reducibility headline is absent from Lean

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:566: “For the integral lattice L=U⊕E₈(−1)”. Suggested.lean:13–21 only explains missing geometric carriers.

   **Claim:** The finished library will prove the general positive-cone decomposition theorem, independent of surface geometry.

   **Witness:** TauCeti/LinearAlgebra/IntegralLattice/Examples.lean:83 supplies hyperbolicPlane; RootLattice/D8Plus/Basic.lean:164 supplies d8PlusLattice; Orthogonal/Sum.lean:84 supplies orthogonalSum; Scaling.lean:261 supplies negation. Basic.lean:156 supplies integralForm. All required carriers exist at the pin.

   **Exact repair text:** Add the native model `L := IntegralLattice.hyperbolicPlane.orthogonalSum (-IntegralLattice.d8PlusLattice)` and a headline theorem with explicit `h d : L`, `0 < L.integralForm h h`, `0 < L.integralForm d d`, `0 < L.integralForm d h`, concluding `∃ d₁ d₂ : L, d = d₁ + d₂ ∧ d₁ ≠ 0 ∧ d₂ ≠ 0 ∧ 0 ≤ L.integralForm d₁ d₁ ∧ 0 ≤ L.integralForm d₂ d₂ ∧ 0 < L.integralForm d₁ h ∧ 0 < L.integralForm d₂ h`, with `sorry`. Import the individual native modules used, name the theorem in README §1.26, and describe it in the module docstring.

   **Repair test:** In the U summand, h=d=e+f has squares 2 and pairing 2; d₁=e and d₂=f have squares 0 and pairings 1. The negative-cone d=−e−f has pairing −2 and is excluded; d=0 has square 0 and is excluded. No missing geometric predicate is required.

5. **F05** (P3) Two named symmetry computations are padding

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:71,77: “theorem firstGram_symmetric”; “theorem secondGram_symmetric”.

   **Claim:** These two finite matrix checks belong among the acceptance-test declarations.

   **Witness:** Their bodies already enumerate the 100 index pairs and decide equality. README §6.1 lists them as matrix API, not deep headline results; each follows by finite decision from the displayed matrix.

   **Exact repair text:** Delete firstGram_symmetric and secondGram_symmetric from Suggested.lean. Inline their existing proof terms in the symmetry argument of the respective ofGramMatrix definitions. Keep symmetry as prose API/Checks in README §6.1, removing its backticked own-declaration names.

   **Repair test:** For both matrices A−Aᵀ is the zero 10×10 matrix. Inlining the same proof preserves both native lattice definitions and all four discriminant headlines.

6. **F06** (P3) A fully qualified pinned Picard name is wrong

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:65: “`TauCeti.LineBundleClass`”.

   **Claim:** This is the pinned declaration in AlgebraicGeometry/LineBundle/Class.lean.

   **Witness:** TauCeti/AlgebraicGeometry/LineBundle/Class.lean:40–50 opens namespaces TauCeti then AlgebraicGeometry before defining LineBundleClass. No TauCeti.LineBundleClass alias or export exists at the supplied pin.

   **Exact repair text:** Replace `TauCeti.LineBundleClass` with `TauCeti.AlgebraicGeometry.LineBundleClass`. Where fully qualifying the other geometry declarations, retain their enclosing `TauCeti.AlgebraicGeometry` namespace too.

   **Repair test:** The corrected name denotes `Skeleton (InvertibleSheaf X)`; the old name has zero declarations at the pin. This changes a locator, not the mathematical Picard object.

7. **F07** (P3) The trivial-cover Check fails on the allowed empty base

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:672: “The trivial torsor has zero edge class and does not represent the nonzero inclusion”.

   **Claim:** The canonical-cover definition rejects the trivial torsor for every allowed family.

   **Witness:** Take S=Spec(0)=∅ and Y=∅. Flatness, properness, finite presentation and the geometric-fibre condition hold. Pic, P, all cohomology and χ are zero; the unique trivial torsor has edge image χ and is canonical.

   **Exact repair text:** “Over a nonempty base, the trivial torsor has zero edge class and fails the canonical-cover condition, since its restriction to a geometric fibre differs from the nonzero inclusion Pic^τ↪Pic. Over the empty base the unique torsor is canonical.”

   **Repair test:** For S=∅, edge=χ=0. For a classical geometric fibre, Pic^τ=Z/2 and its inclusion is nonzero; edge(trivial)=0 differs from χ. The family definition retains its correct arbitrary-base generality.

8. **F08** (P3) The proposed carrier Checks cannot detect the wrong carrier

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1532: “These checks distinguish the full integral carrier from the ambient rational space”.

   **Claim:** The listed basis pairings, determinant, inverse denominator and mod-two matrix rank distinguish Z¹⁰ from Q¹⁰.

   **Witness:** Put the identical rational bilinear matrix on Q¹⁰: every listed basis pairing, determinant −4, inverse denominator 2 and mod-two rank 8 remains identical. None tests carrier membership or integrality away from the basis.

   **Exact repair text:** Replace that assertion with: “These matrix Checks distinguish N₁ from N₂. For each native carrier, additionally check e₁∈L, (1/2)e₁∉L, and L is closed under integer addition and multiplication. The excluded vector has norm −1/2 in the ambient rational space, so permitting it would violate integrality.”

   **Repair test:** ofGramMatrix has carrier span_Z of the rational standard basis, hence coordinates are integers. The vector (1/2,0,…,0) is outside it but inside Q¹⁰; its norm is (1/4)(−2)=−1/2. This separates the two carriers for both matrices.

9. **F09** (P3) Half-fibre Checks include two restatements

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:166,170: “A scheme fibre 2F gives a half-fibre”; “the base-changed equality remains 2F_K=φ_K*([a_K])”.

   **Claim:** These supply three discriminating Checks for HalfFibre.

   **Witness:** The first repeats the defining equation at line 146; the third repeats HalfFibre.baseChange at line 154. Only the middle multiplicity test distinguishes a plausible wrong object. Thus fewer than three discriminating Checks remain.

   **Exact repair text:** Replace the list by: “For a smooth double fibre 2E, E has square zero, whereas the candidate 2E fails: twice that candidate is 4E, not 2E. For a double IV* fibre, the primitive central coefficient is 3 and its full-fibre coefficient is 6; replacing the half-fibre by reduced support gives 2 at the centre and fails. The zero divisor is rejected: twice zero is zero, whereas the pulled-back rational-point divisor is nonzero.”

   **Repair test:** The three comparisons are 4≠2 on a smooth component, 2≠6 on the IV* central component, and 0≠2 on any positive-multiplicity half-fibre component. They test scaling, reduction and the zero-divisor substitute separately.

10. **F10** (P3) Three added geometric headlines are missing from the module inventory

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:13–21, the inventory of unstatable headlines.

   **Claim:** The module docstring identifies the geometric headline theorems that cannot yet be stated.

   **Witness:** README §1.26 adds general divisor reducibility, §3.10a adds the fundamental-group computation, and §8.3a adds characteristic-zero lifting after a finite Witt extension. None is named in that inventory; these are distinct from numerical-lattice isometry and W₂ lifting.

   **Exact repair text:** Add: “General effective-divisor reducibility lacks the Enriques divisor/intersection interface. The characteristic-dependent fundamental-group computation lacks the Enriques finite-étale-cover interface. Characteristic-zero lifting after a finite Witt extension lacks the Enriques deformation and polarized-algebraization interfaces.” Keep the statable numerical reducibility theorem itself as required in S04.

   **Repair test:** A ramified V=W(k)[π]/(π²−2) lift is a characteristic-zero lift but need not give a W₂(k)-lift: π mapping to 2a would force 2=0. Thus the existing W₂ inventory entry cannot stand for §8.3a.

11. **F11** (P3) Source-acquisition disposition remains in README prose

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1876,1880: “cited by locator under the settled waiver”; “settled 2021 draft numbering”.

   **Claim:** The bibliography includes the review process's waiver/settlement status in the roadmap's prose.

   **Witness:** The binding package policy excludes process narrative from README. The waiver is already represented by sources.toml; it is not a mathematical hypothesis or version identifier.

   **Exact repair text:** End the BM1977 entry with “Theorem 3 and Proposition 11.” In CDL2021 replace “uses the settled 2021 draft numbering” with “uses the 2021 draft numbering”. Retain all acquisition statuses and version notes in sources.toml.

   **Repair test:** The BM theorem locators and the distinction between the 2021 and 2024 book numbering are unchanged; both occurrences of settlement/waiver process prose are removed.

12. **F12** (P3) Further definition Checks repeat the predicate or fail to distinguish models

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:316,342,368,450–452,1126–1128: “the predicate holds”; “would lose this distinction”.

   **Claim:** Each type predicate, exceptionality predicate and Jacobian adapter has three discriminating Checks.

   **Witness:** The first three type Checks repeat their definitions. Ordinary C=0 gives H¹(O_(2C))=0 with or without the type guard. The first two Jacobian Checks repeat the two construction clauses.

   **Exact repair text:** Replace the first Check of OrdinaryType by “The Hopf algebra k[ε]/ε² with Δε=ε⊗1+1⊗ε+ε⊗ε gives μ₂; omitting the final term gives α₂, which fails the predicate despite the identical underlying ring.” Replace the first ClassicalType Check by “The reduced algebra k×k has two geometric points and zero tangent space at the identity; k[ε]/ε² has one point and tangent dimension one and cannot model this type.” Replace the first SupersingularType Check by “The primitive coproduct Δε=ε⊗1+1⊗ε on k[ε]/ε² gives α₂; adding ε⊗ε gives μ₂ and fails the type test.” Keep the other negative and duality Checks.

   For exceptionality use these three Checks: “An exceptional classical T₂,₃,₇ surface has h¹(O_(2C))=1 and h⁰(O_(2C))=5, whereas h⁰(Y,O_Y(2C))=1; the Cartier subscheme and surface line bundle are different objects. C=0 gives the empty subscheme and h¹=0. Replacing its exceptional doubled conductrix by its reduced rational tree gives h¹=0 and incorrectly rejects that exceptional surface.” Describe ordinary C=0 separately as the extension convention, without claiming that this test distinguishes an explicit type guard.

   For the first two Jacobian Checks use: “An index-two generic torsor has no K-point, while its Jacobian has its K-rational identity; replacing the Jacobian by the torsor fails. In the quasielliptic branch the affine dimension-one Pic⁰ group has infinitely many linearly independent global functions, whereas its proper regular genus-one compactification has H⁰=K of dimension one.” Keep the no-multiple-fibre Check.

   **Repair test:** The μ₂ and α₂ coproducts differ by the nonzero basis tensor ε⊗ε. Their common length/point/tangent counts are 2,1,1, while Z/2 gives 2,2,0. For classical exceptional C, (2C)²=−8 gives χ(O_(2C))=4; the conductrix sequence and duality give h¹=1, hence h⁰=5. Empty/reduced controls both give h¹=0.

13. **F13** (P1) Relative Picard scheme representability and flatness are circular

   **Location:** packages/EnriquesSurfacesAndIntegralNonexistence/README.md:634,646–648: “The finite rank-two Pic^τ and étale numerical components give ... scheme representability”; “Needs: 2.2”.

   **Claim:** §2.2 is proved from relative Pic^τ/Num properties, while §2.3 proves precisely those properties using §2.2.

   **Witness:** §2.2→§2.3→§2.2 is an internal cycle. The gap at :69 assumes flat Pic^τ, so cannot establish §2.3's flatness premise. §2.3 omits the declared flatness-Betti input at :73.

   **Exact repair text:** Replace the two proof plans by this order: “First obtain the relative Picard algebraic space from ComplexComparisonPartII C3.2d.2. Prove the Enriques-specific open finite-flat rank-two Pic^τ assertion without assuming that full Pic is a scheme. For flatness reduce to local Artinian tests with algebraically closed residue field: the space deformation is a scheme by nilpotent-thickening invariance; in positive characteristic apply gap:picard-flatness-betti using b₁=2(h¹−h²)=0, and in characteristic zero use h²(O)=0. Supply the finite/proper torsion argument and the passage from these tests to arbitrary affine bases. Apply gap:numerical-contraction-descent only after flat Pic^τ is established, obtaining the étale rank-ten quotient. Then prove that full Pic is a scheme by descent of its finite Pic^τ-torsors over the étale numerical components.” Move the scheme-representability conclusion after the relative-invariants target and remove its reverse dependency.

   Use the primary Enriques argument in EHS12, Proposition 4.2 and Corollary 4.3, printed pp. 31–32 (EHS12 lines 1369–1408), together with SCH23 Proposition 5.3. Record Ekedahl–Hyland–Shepherd-Barron, “Moduli and periods of simply connected Enriques surfaces,” arXiv:1210.0342 under a single new EHS12 manifest key, with the fetched version's internal date 25 February 2018. This is a repair to local proof order and use of an already-declared gap, not a demand that this package implement its external supplier.

   **Repair test:** Constant fibre length alone is insufficient. For R=k[ε]/ε² in characteristic 2, the finite group with Hopf algebra R[t]/(t²,εt), primitive t, has its only geometric fibre α₂ of length 2, but module R⊕kt has k-length 3 rather than the flat rank-two value 4. The proposed order supplies actual Picard flatness before invoking numerical descent, and has no edge back from the invariants to full scheme representability.

## Earlier findings, verified individually

All locations in the passage column refer to packages/EnriquesSurfacesAndIntegralNonexistence/README.md unless marked Lean. “Repaired” accepts the repair's different solution when it satisfies the binding contract; it does not certify future supplier proofs. The external-extension reasons marked “not actionable in this package” remain accepted. No finding below demands implementation of those external gaps.

| Earlier finding | Status | Repaired passage at this head | Verification/witness |
|---|---|---|---|
| a F01 | Repaired as a declared contract; shared-genus-one drift is S01 | :69 “What SchemeAndStackFoundations must provide (gap:numerical-contraction-descent)”; :81 “What PadicHodgeTheory must provide” | All seven slugs occur in plan and README with named suppliers. Neron §§2–5/7.4 exists; no fictitious supplier names remain. |
| a F02 | Repaired | :57 “§2.6 for coherent cohomology, §2.20 for duality”; :77/79 explicitly state the two gaps | Actual SchemeAndStackFoundations §§2.6,2.20,4.6 occur at lines 3437,4275,5291. DI21 lines 494–525 and 854–870 match the specialized contracts. S03 concerns a different, Enriques-specific input. |
| a F03 | Repaired | :13 “projective Picard representability for geometrically integral projective schemes over a field” | JacobianChallenge Layer D, lines 254–269, has exactly this unpointed theorem; not merely pointed curves. |
| a F04 | Partly repaired | :61 “§1.1 supplies IsK3; §1.2 supplies isK3_fieldExtension_iff” | Current K3 §§1.1–1.3 match; its current §6.0b replaces the shared gap. The still-stale clause at :71 is S01. |
| a F05 | Repaired | :15 “WeilConjectures, WC.7, owns the arbitrary-field Enriques predicate” | WC.7 has the predicate, étale invariants and count. Duplicate §§0.1/3.1 and reverse-consumer edge are absent; depcheck has 0 problems. |
| a F06 | Repaired | :1544 “firstLattice_discriminant_group”; Lean :91–109 contains four discriminant targets | Both groups have 4 elements of exponent 2. Half-norm values are 0,1/2,0,0, so the isotropic subtype has cardinality 3. |
| a F07 | Repaired | :1536 “basis-pairing recovery ... integralForm_ofGramMatrix_apply” | Native Basic.lean:295 has the general formula. The two admitted wrapper names are absent. |
| a F08 | Repaired differently under the acceptance-file rule | :1532 “check the native lattices separately” | All Lean examples were deleted; no requirement to restore mirror examples survives the binding rule. The separate claim that these tests detect carrier enlargement is newly refuted in S08. |
| a F09 | Repaired | :446 “On an exceptional T₂,₃,₇ surface H¹(O_(2C))≠0 ... H¹(O_(C_red))=0” | ESB21 lines 188–230 supplies the witness and tree property. At C=0 both cohomology dimensions are 0, explicitly acknowledged. |
| a F10 | Repaired in README; acceptance-file follow-up S04 | :564 “For every geometric Enriques Y and effective divisor D with D²>0” | Lang1983 lines 757–778 states both general forms. The restricted coset application follows separately; e+f=e+f has squares 2=0+0+2. |
| a F11 | Repaired | :470 excludes simple and double III*/II* in the quasielliptic case | ESB21 lines 458–460 includes both multiplicities. No unjustified extension to arbitrary nonspecial elliptic fibrations was added. |
| a F12 | Repaired | :1862–1884 supplies all twelve reference entries | sources.toml has twelve unique works, legal acquisition/status records and version-specific book locators; settled waivers are retained. |
| a F13 | Repaired, apart from newly detected namespace typo S06 | :39 “6b7abb3c7686292736be2955bd3eb9ebf63b456a”; :47 “a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039” | These match lake-manifest.json. Native dyadic and lattice objects were read at those pins, including the explicit domain and Hensel hypotheses. |
| a F14 | Repaired | §4.10 calls n_a an auxiliary quantity, then identifies it with the Enriques fibre count | SCH23 lines 1145–1164 makes the same distinction. For I₁*+E₄+I₄, n sums to 13+4+8=25 before Jacobian component descent. |
| a F15 | Repaired | :3 “These obligations are part of the specification of the proof” | Publication instruction, absent-name catalogue and empty Lean sections are gone. S10 records omissions caused by newly added headlines, not the old catalogue. |
| a F16 | Repaired | :1788 “Characteristic-zero lifting after a finite Witt extension” | Independent §8.3a cites CDL2021 Theorems 5.11.4–5.11.5, lines 28636–28696; §8.4 consumes it. W[[t₁,…,t₁₂]]/(2) is regular but not W-flat, so the additional input is necessary. |
| a F17 | Repaired | §3.10a bounds a connected étale cover's degree by d=χ(O_Z)≤2 | A putative degree 3 gives 3≤2. In characteristic 2 the three Pic^τ types yield fundamental-group orders 2,1,1 through Hom(μ₂,Pic^τ). No prior K3 simple-connectivity assertion is used. |
| a F18 | Repaired | §2.1 Checks use a constant family over k[t] and its square-zero restriction | Both have χ=1, b₂=10 on fibres; P² has χ=1 but b₂=1 and fails. No impossible family over Z serves as a positive example. |
| a F19 | Repaired | §2.10 defines the three predicates first for commutative group-scheme extensions | The real sign-action quotient has rank 10 but invariant rank 9. The torsion shift sends e₁ to e₁+τ, so no invariant lift of e₁ exists although the quotient is constant. |
| b F01 | Repaired as a declared contract | :59 “ComplexComparisonPartII C3.2d.2 supplies relative_picard_algebraicSpace”; :73 declares picard-flatness-betti | C3.2d.2 has proper-flat-fp algebraic spaces with universal functions, not general separatedness. Moduli §§7.6.1–1a supplies sheaf/base change; the remaining flatness extension is declared. |
| b F02 | Repaired as a declared contract | :75 “for algebraically closed k of characteristic p>0 and a finite commutative local k-group L” | DI21 Proposition 4.2 is separately assigned to its Part II supplier. Base R07.1 is no longer falsely said to contain it. The source proof defect below does not refute its statement or reopen the accepted ownership reason. |
| b F03 | Repaired | :59 names enriques_characterization, enriques_etaleInvariants and the WC.7 counts | One owner remains. For q=2, r=1,2 the imported values are 25 and 57; r=0 is explicitly outside its domain. |
| b F04 | Repaired differently under the acceptance-file rule | §3.7 and §§6.11/7.2 keep arithmetic and incidence facts as prose | All six admitted wrappers were deleted, instead of proved in place. Products are 1,5,4,20 twice; incidence counts 15 and 6. S05 identifies two different remaining computations. |
| b F05 | Repaired | Lean :2 imports TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic | The quadratic map used by both retained cardinality statements is defined there; its imports provide the Gram constructor. No unused Overlattice import remains. |
| b F06 | Repaired differently under the acceptance-file rule | :1532 records determinant −4, mod-two rank 8 and denominator 2 | Both exact inverses multiply back to I in all 100 entries. No admitted inverse/check wrappers were introduced. |
| b F07 | Repaired | :1874–1884 gives Lang1983, BM1977, CD89, CDL2021, LLR04 and LLR2018 | Unique manifest keys retained. LLR2018 lines 57–66 corrects global Theorem 4.3, not the local Theorem 6.6 used here. |
| b F08 | Repaired | §6.1 uses “The complete matrices can be specified sparsely”; :1872 uses stable Stacks tags | No “revised” matrix description or dated reading narrative remains in the affected passages. Both source matrices match the current matrices. |

## Verified sound

Read every line of README.md (1,884 lines) and Suggested.lean (110 lines), both repository rule files, the plan and source manifest. Inventoried 112 numbered README targets; §1.17's three definitions, §1.26's three statements, §2.10's three predicates and §6.1's two matrices/two carriers are separated below. Read all 12 real Lean declarations: five definitions, two proved symmetry theorems and five admitted headlines. The supplied “13 declarations” signature inventory accidentally treats the docstring words “theorem lack” as a declaration named lack; its unknown-identifier message concerns that probe, not Suggested.lean.

Compared each of the 12 supplied elaborated types with its README statement. There are no section variables or hidden standing hypotheses to lose. No Lean process was run: the read-only/no-build instruction takes precedence over the generic request to elaborate a new scratch probe. The sole nonzero hypothesis, x≠0, is explicit. All geometric generality remains in README, with the acceptance/inventory omissions listed above.

Tested all 88 bullet Checks in 33 Check blocks, plus the numerical paragraphs after §§6.1–6.2 and the layer Examples. S07–S09 and S12 identify the failed or nondiscriminating controls. The tables record actual arithmetic, group, coefficient or fibre values; a conditional incidence contradiction is not claimed to construct a surface or prove an entire geometric classification.

Source verification records 46 named theorem/section/tag units listed in the source table below, rather than counting repeated citations as new verification. Checked 12 supplier contract groups against current files, including their named subsection/target lists; searched all 26 supplied open sibling folders, main active/completed roadmaps, board packages and the pins by object. The only shared construction ownership drift established is S01. The general conductrix sequence needed in S03 belongs here as an Enriques consequence; the general differential obstruction remains with its declared supplier.

### Acceptance-file context and computed instances

All names in this table are in namespace TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence. There are no section variables or section instances. Fin 2 and Fin 10 carry their native finite instances; the native dyadic field and rational-vector-space instances are fixed.

| Declaration, section and explicit context | Instances and computed sides | Result / change |
|---|---|---|
| dyadicRepresentative, Layer 3; e,a,b : Fin 2; codomain Q | In lexicographic (e,a,b) order: 1,5,2,10,−1,−5,−2,−10. All eight denominators nonzero. Unit residues 1,5,7,3 modulo 8 with valuation parity 0 or 1. | Real body; keep. |
| dyadic_square_classes, Layer 3; x : Q₂, hx:x≠0 | x=1,2,5,−10 have unique triples 000,010,001,111. x=20 divided by representative 5 is 4=2². If x=0, all eight quotients are 0=0², so uniqueness fails 8 versus 1. | hx retained and necessary. |
| firstGram, Layer 6; Matrix (Fin 10) (Fin 10) Z | A₈₃=1, A₈₉=1, A₉₉=0; diagonal sum −18. Symmetry difference has 100 zeros; det −4. | Matches sparse graph and source (14). |
| secondGram, Layer 6; same type | B₈₃=0, B₈₉=1, B₈₈=B₉₉=0; diagonal sum −16. B₅₆=B₅₇=1; det −4. | Matches D₈(−1)⊕U and source (16). |
| firstGram_symmetric, Layer 6; no binders | Aᵀ−A=0 in all 100 entries. | True; delete named padding, S05. |
| secondGram_symmetric, Layer 6; no binders | Bᵀ−B=0 in all 100 entries. | True; delete named padding, S05. |
| firstLattice, Layer 6; IntegralLattice (Fin 10→Q) | Carrier span_Z(eᵢ)=Z¹⁰; e₀ belongs, e₀/2 does not. Norms −2 and −1/2 respectively. The zero matrix is permitted by the generic constructor but would have determinant 0 rather than −4. | Real native carrier; no assumed nondegeneracy. |
| secondLattice, Layer 6; same type | e₈²=e₉²=0, e₈·e₉=1, (e₈+e₉)²=2. Restricting carrier to Z¹⁰ excludes e₀/2. | Real native carrier; S08 repairs Checks. |
| firstLattice_discriminant_group, Layer 6; no binders | det −4; mod-2 rank 8; inverse denominators 1,2. Smith factors 1⁸,2,2. Four cosets, each killed by 2, not cyclic Z/4. | Additive equivalence to (Z/2)² true. |
| firstLattice_isotropic_card, Layer 6; existential hL:IsEven | Every integer norm is even: even diagonal plus twice cross terms. Coset norms 0,−1,−2,−2 give q=0,1/2,0,0. | Exactly 3 isotropic elements including 0, not 2 or 4. |
| secondLattice_discriminant_group, Layer 6; no binders | det −4; mod-2 rank 8; inverse denominators 1,2; same Smith factors. | Four elements of exponent 2, as stated. |
| secondLattice_isotropic_card, Layer 6; existential hL:IsEven | Same q multiset 0,0,0,1/2. U contributes no discriminant class, since det U=−1. | Exactly 3; convention agrees with native quadratic map. |

The four discriminant conclusions require finite abelian-group/quotient arguments after the matrix computations; they are not just a definition unfolding or one native lemma on these named Gram matrices. No other roadmap declaration with these fully qualified names was found.

### README statement and convention computation table

The section number identifies the complete target and its displayed standing hypotheses. “Conditional” means a genuine numerical/source consistency test under those hypotheses, not an assertion that a hypothetical forbidden surface exists. Global constant-Picard arguments retain the family hypotheses and the Picard/Brauer assumptions where stated. Three statements in §1.26 and the several definitions in §§1.17,2.10,6.1 are explicitly separated.

| Statement | Instances tried; values on the two sides | Result / change |
|---|---|---|
| Geometric Enriques convention; imported WC.7 | Classical: χ=1−0+0=1; nonclassical: χ=1−1+1=1. P² has χ=1 but b₂=1≠10; K3 has χ=2, b₂=22. | Both negative models excluded; predicate imported. |
| Arbitrary field versus family base | A field has 1≠0. Spec(0) has 0 geometric points, so the family fibre condition has 0 counterexamples. | Fields exclude zero ring; families do not. S07 is the actual empty-base failure. |
| Coherent versus étale invariants | μ₂ and α₂ in characteristic 2 each have length 2 but one geometric point; Z/2 has two points. All Enriques types have b₁=0, while h¹(O) is 0 or 1. | Length is not point count; no h¹=b₁/2 inference. |
| Intersection, full fibre and half fibre | F·F′=1 implies (2F)·(2F′)=4, R·F=1 implies R·2F=2. Root C²=−2; positive-root model would give +2. | All layers retain factors 2 and 4 and negative roots. |
| Discriminant normalization | Full norms −1,−2 give native q=−1/2=1/2 and −1=0 modulo Z. | Same zero set as full norm modulo 2Z; no factor-two error. |
| Frobenius and finite-field count | q=2: eigenvalue on divisor H² is 2, on H²(1) is 1. Counts at (q,r)=(2,1),(2,2),(4,1),(4,2) are 25,57,57,417. | Geometric Frobenius convention consistent. q=1 is no finite field; r=0 would yield 12 and is excluded. |
| 0.2 Pic^τ | Classical geometric points form Z/2 generated by ω, length 2. Ordinary/supersingular each have one point, generated by ω=O, but length remains 2. | No confusion of scheme length with order of points. |
| 0.3 coherent invariants | (h¹,h²)=(0,0) and (1,1) both give χ=1; hypothetical (2,2) violates the bound ≤1. | Source/type distinction retained. |
| 0.4 numerical lattice | U has signature (1,1), determinant −1; E₈(−1) has (0,8), determinant 1. Sum has (1,9), rank 10, determinant −1. | Native positive E₈ must be negated; indefinite classification applies. |
| 1.1 HalfFibre and its maps | On smooth double fibre 2E, candidate E has doubled coefficient 2; candidate 2E gives 4. On IV*, central half coefficient 3 gives full coefficient 6, not 2. Zero gives 0. | Mathematics true; replace tautological Checks, S09. Identity base change sends the equality 2F=2F to itself. |
| 1.2 minus-two curve | Geometric integral C²=−2 gives 2p_a(C)−2=−2, p_a=0. Conjugate two-component curve has total square −2−2+2=−2 but two geometric components. | Geometric integrality correctly excludes the wrong model. |
| 1.2 two-section | Partner integral half-fibre R has R²=0, R·2F=2 and R·F=1. If R·F=2, degree is 4, not 2. | Rationality is not imposed on two-sections. |
| 1.3 canonical-type divisor | Primitive additive weights have gcd 1 and intersection 0 with each component. Doubling gives gcd 2; that is a full multiple fibre, not a new primitive type. | Supplier's primitive carrier and local full/half distinction agree. |
| 1.4 half-fibre criterion | Primitive nef F has F²=0. 2F also has square 0 and is nef, but divisibility 2 excludes it; D=0 is excluded by nonzero effectiveness. | “Primitive” and nonzero prevent the two false converses. |
| 1.5 nodal reflection | Reflection s_C(D)=D+(D·C)C: for D·C=−1, C²=−2, square changes by 2−2=0 and new pairing is 1. | Sign and norm preservation correct; uniqueness refers to the nef chamber representative. |
| 1.6 existence of pencil | A primitive nef F²=0 has full-fibre class 2F and pencil dimension 1. D=0 would give only the constant section, dimension 0. | Positive/nonzero construction essential. |
| 1.7 fibre multiplicity | Geometric multiple fibres have gcd of component coefficients 2, primitive half gcd 1. Additive internal coefficient 3 is not a fibre multiplicity 3. | No characteristic-3 exception to the multiplicity-two statement. |
| 1.8 integral two-section | For R²=−2, p_a=0; for R²=0, p_a=1. The latter is the partner-half-fibre branch, degree 2 against the first pencil. | Both branches retained. |
| 1.9 classical criteria | Classical: ord(ω)=2, h¹(O)=0, two tame doubles. Ordinary/supersingular: ord(ω)=1, h¹(O)=1, one wild double. | Both directions distinguish the three types, in the geometric setting. |
| 1.10 tame doubles and ω | Classical K∼F₁−F₂; twice this is 2F₁−2F₂∼0. Nontrivial ω has order 2, not 0 or 4. | In characteristic ≠2 only this case survives. |
| 1.11 tame half-fibre type | A nontrivial order-two normal bundle requires two k-points of Pic⁰[2]. Ordinary elliptic curve has such a point; supersingular E[2](k) has one; G_m(k)[2]={1} in characteristic 2. | Excludes supersingular and multiplicative fibres; allows additive. |
| 1.12 ordinary type | Pic^τ=μ₂: length 2, one k-point, tangent dimension 1, dual Z/2 has two points; ω=O has order 1. | No dual/type reversal. The first listed Check is the definition's positive example, not independent evidence. |
| 1.13 classical type | Pic^τ=Z/2: two points, tangent dimension 0; dual μ₂ has one point; ω has exact order 2. | Distinct from ordinary despite equal scheme length. |
| 1.14 supersingular type | α₂ has one point, tangent dimension 1 and is self-dual; neither μ₂ nor Z/2 is isomorphic to α₂. | Correct; μ₂ and α₂ cannot be distinguished by point count alone. |
| 1.15 local canonical cover | Classical group μ₂ and supersingular group α₂: degree 2, one geometric point per fibre, inseparable. Ordinary group Z/2: degree 2, two points per fibre, étale. | Local-cover domain excludes ordinary; zero torsor's class 0 differs from the nonzero inclusion over a geometric point. |
| 1.16 local K3-like cohomology | h⁰=1, h¹=0, h²=1 gives χ=2, exactly 2χ(O_Y); trivial ω yields h²=1. | Singularity is allowed; smooth-K3 conclusion is not asserted for local covers. |
| 1.17 Conductrix | C=0 gives conductor ideal O and square 0. Exceptional nonzero C has C²=−2; at multiplicity m>0, C versus 2C has orders m versus 2m before the common flat pullback. | Normalization/faithful-flat descent fixes C; ordinary case is explicitly outside the local construction. |
| 1.17 Biconductrix | Local equations t² and t give respectively a nonzero nilpotent t and zero. C²=−2 gives (2C)²=−8 and χ(O_(2C))=4. | Scheme structure, not reduced support, matters. Source misprint below. |
| 1.17 exceptionality | Exceptional T₂,₃,₇: h¹(O_(2C))>0, h¹(O_(C_red))=0; C=0 gives 0=0. Ordinary extension convention also gives C=0, hence false. | Definition is coherent. The ordinary Check alone does not discriminate adding/removing its explicit type guard. |
| 1.18 exceptional special pencil | A rational special two-section has square −2 and meets the half-fibre in 1. The listed double E₆/E₇/E₈ configurations are exceptional; an arbitrary square-zero two-section has p_a=1 and is outside this hypothesis. | Special-bisection premise retained. |
| 1.19 quasielliptic exclusion | Simple and double III*/II* have multiplicities 1 and 2; ESB's exceptionality implication covers both. | Strengthened repair matches source; not generalized to all elliptic fibres. |
| 1.20 exceptional multiple fibres | A rational R meeting a multiple E-type half-fibre once has R·full=2 and R²=−2. Dropping R²=−2 admits genus-one R²=0 and loses the special-pencil premise. | Current statement keeps the needed premise. |
| 1.21 extra-special E₈ predicate | T₂,₃,₇ has 10 vertices, 9 edges, arms of 1,2,6 edges from the centre. Add a curve: 11 vertices; add a cycle edge: 10 edges. | Full graph, not occurrence of a subgraph. Both wrong models fail. |
| 1.22 extra-special implies exceptional | T₂,₃,₇ has C≠0 with C²=−2 and h¹(O_(2C))>0; C=0 has h¹=0. | ESB/MMV identification supports implication. |
| 1.23 partner theorem | Outside extra-special E₈, F·F′=1; in its unique-pencil case any same-pencil numerical half has product 0. | Exception necessary; classical characteristic ≠2 never falls in it. Older primary proof remains waived/uncertified. |
| 1.24 nonexceptional characteristic-two partner | Nonexceptional excludes the extra-special case; half intersection 1 becomes full intersection 4. | Correct deduction. |
| 1.25 two distinct pencils | Distinct primitive isotropic rays have positive integral product ≥1; their full fibres have product ≥4. Equal pencil gives 0 and is excluded. | Equality 4 corresponds exactly to half intersection 1. |
| 1.26 general effective reducibility | Positive-square h=e+f gives h²=2 and decomposition e+f with both squares 0. D=0 has square 0 and cannot split effectively into nonzero pieces. | Full theorem restored; geometric carrier missing in Lean inventory, S10. |
| 1.26 numerical reducibility | h=d=e+f: h²=d²=d·h=2; d₁²=d₂²=0 and dᵢ·h=1. For d=−e−f, d·h=−2; sum of two positive pairings cannot equal −2. | General native statement is statable and absent, S04. |
| 1.26 prescribed coset application | Generic line degree is 2, index 2 excludes a sum of two degree-1 closed points. Adjunction gives R²=2p_a−2≥−2 and even. Discarded vertical V has degree 0 and trivial generic restriction. | Minimum-square argument preserves the class, not merely degree; outcomes 0 or −2. |
| 2.1 family stack | Y×Spec k[t] and restriction to k[t]/t² have geometric χ=1,b₂=10; P² has b₂=1. Empty base has zero geometric fibres. | Proper-flat-fp hypothesis excludes nonflat thickening mistakes; arbitrary-base convention retained. |
| 2.2 Picard representability | Over a geometric fibre Pic^τ has length 2 and discrete quotient rank 10; arbitrary sheaf point need not be an actual line bundle until its obstruction is 0. | Algebraic-space supplier is correct, but the scheme improvement consumes 2.3, creating S13's cycle. |
| 2.3 relative numerical invariants | On characteristic-two ordinary fibre: length(P)=2, points(P)=1, rank Num=10. Over R=k[ε]/ε², R[t]/(t²,εt) has fibre length 2 but total k-length 3, not flat length 4. | Fibre lengths alone cannot establish flatness. Existing numerical gap assumes it; S13 supplies the missing order/input. |
| 2.4 canonical-cover family | Over a classical geometric point: χ is nonzero inclusion and edge(trivial)=0. Over ∅ both are 0. | False universal Check repaired by S07. |
| 2.5 low-degree exact sequence | χ has a torsor lift iff δχ=0. If χ=0 the trivial torsor lifts; a nonzero obstruction has no preimage since δ∘edge=0. | Both directions are exactness, not assumed existence of a lift. |
| 2.6 injection criterion | If H²(S,G)→H²(Y,G) injective, ker=0; δχ belongs to that kernel, hence δχ=0. | No unjustified claim that H² itself vanishes. |
| 2.7 section criterion | For f∘s=id, s* f*=id on H²; kernel of f* is 0. | Domain and composition direction correct. |
| 2.8 étale Pic^τ construction | If t:ω²→O is the chosen trivialization, its dual is O→ω⁻² and its inverse supplies multiplication ω⁻²→O. For a trivial local frame, (0,1)²=(u,0), u a unit. | Dual trivialization is typed correctly, unlike source formula. |
| 2.9 twisting torsor | For two covers with common edge χ, their difference has edge χ−χ=0 and lies in H¹(S,G). The inclusion of H¹(S,G) is injective, so its acting stabilizer is 0. | Simply transitive on isomorphism classes, not unique cover without twisting. |
| 2.10 constant Num | Standard quotient Z¹⁰ has invariant rank 10; real sign action on one basis direction leaves invariant rank 9. | Distinguishes rank from constancy. |
| 2.10 split extension | Standard direct product has zero extension class. Shift σ(e₁)=e₁+τ, σ(τ)=τ has σ²(e₁)=e₁+2τ=e₁, but no fixed lift e₁+aτ. | Split and constant quotient are distinct. |
| 2.10 constant full Picard | Standard (Z¹⁰⊕Z/2)_S is constant and split; sign quotient model is split but nonconstant. The torsion-shift model has constant quotient but nonsplit total extension. | Three predicates separated on genuine commutative extensions. |
| 2.11 Kummer cover classes | With Pic(R)=0, H¹(S,μ₂)=R×/R×². For R=Z[1/2], representatives are 1,−1,2,−2, cardinality 4. | This existence argument needs no general Brauer vanishing. |
| 2.12 canonical order on fibres | Full Pic constant forces Pic^τ=Z/2; geometric ω is its nonzero point and has order 2. μ₂ in char 2 would give order 1 and is excluded. | Exact order, not merely square-triviality. |
| 2.13 numerical descent | With stated Picard/Brauer vanishings, obstruction is 0; rank-ten numerical class has two Picard lifts differing by ω, 2ω=0. | Uniqueness is modulo ω; not absolute uniqueness. |
| 2.14 minus-two descent | A root has square −2, hence cannot be twice an integral class (would force norm −1/2). Unimodularity gives degree-1 line bundle on its conic form; conic index becomes 1 rather than 2. | Descent plus P¹ conclusion retains full-Picard assumptions. |
| 2.15 pencil descent | A half-fibre class has h⁰=1; a degree-1 point on descended base conic makes its index 1, hence P¹. Nonsplit conic index 2 cannot carry that point. | Does not infer split conic merely from geometric rationality. |
| 2.16 rational tame doubles | Two geometric half-fibres descend to two rational base points, each full multiplicity 2; characteristic-two wild single-double types fail full-Picard constancy. | Count 2 and rationality both supplied. |
| 2.17 pencil over the field | Geometric pencil descends by 2.15, so number of field pencils ≥1, not an empty descent set. | Existence uses full Pic and the stated Brauer hypothesis. |
| 2.18 finite-field descent package | Pic(F_q)=0 and Br(F_q)=0; degree-one conics split. This is different from Br(F_q(t)), which is not 0. | Correct field-level specialization. |
| 2.19 constant-Num graph descent | A geometrically reducible fibre forces residue extension purely inseparable. Over F₂ all finite residue extensions are separable, so degree must be 1. | Supplier's geometric reducedness and labelled intersections retained. |
| 2.20 no I₀* over F₂ | Central P¹ requires four distinct rational attachments but has 2+1=3 rational points. | 4>3 contradiction; does not extend to F₃, where 4=4. |
| 3.2 constant Num over Z | Connected finite étale Z-algebra domain factor has degree 1 by the pinned ramification theorem. Rank-10 monodromy is then trivial; q=2 count is 1+20+4=25. | Domain/faithfulness premise is used only on the factors; no claim on a general product being Z. |
| 3.3 local projectivity and sections | Twice a numerical class kills Pic^τ: 2P=0. Section gives obstruction 0; ample locus contains the closed point of a local base and therefore all points. Over Z₂, 25 rational special-fibre points give ≥1 Hensel lift. | Proper local algebraic spaces are decent; no missing quasi-separatedness assumption. |
| 3.4 hypothetical μ₂ Picard branch | Dual of P=μ₂ is étale Z/2, rank 2; section over Z₂ kills the edge obstruction. | Produces an étale cover, not a μ₂ cover. |
| 3.5 four global twists | Z[1/2]×={±2ⁿ}; sign and exponent modulo 2 give 2×2=4 classes. 5 has valuation 1 at 5 and is not a unit here. | Correct base ring and quotient. |
| 3.6 eight dyadic classes | Valuation parity 0/1 times odd residues 1,3,5,7 gives 8. x=0 would lie in all representative square tests, violating uniqueness. | Nonzero binder explicit in Lean and prose. |
| 3.7 global twist identity | For t=000,001,010,011,100,101,110,111, representative times (−1)^e2^a is 1,5,4,20,1,5,4,20. RHS 5^b(2^a)² has the same eight values. | Identity correct; remains a README calculation. |
| 3.8 difference of covers | Equal canonical edge χ gives difference χ−χ=0; base H¹ injectivity gives one difference class. Twisting twice by a quadratic class gives class c²=1. | Uniqueness is a square class, not a preferred scalar. |
| 3.9 remove ramified part | c=−10, u=−2 yields cu=20=5·2²; c=2,u=2 yields 4=2². Unramified polynomial z²−z−1 has discriminant 5 and reduction z²+z+1 with no roots 0/1 and derivative 1. | Remaining class 1 or 5; x²−5 is not the claimed étale integral presentation. |
| 3.9 comparison to native unramified model | Native discriminant −3 versus 5 has product −15, congruent 1 mod 16; its square class is 1. | Both generate the same quadratic Q₂ extension. |
| 3.10 étale canonical cover is K3 | χ(O_X)=2χ(O_Y)=2; ω_X=O gives h⁰=h²=1, hence h¹=1+1−2=0. | K3 predicate from actual sibling; properness plus its projectivity theorem retained. |
| 3.10a finite-cover degree bound | For connected degree d cover: d=χ=1−h¹+h⁰ω≤2. Degrees 1,2 allowed; degree 3 gives 3≤2. | Independent of K3 simple connectivity. |
| 3.10a fundamental-group types | Characteristic 2: Hom(μ₂,μ₂) has a nonzero map; Hom(μ₂,Z/2)=0 and Hom(μ₂,α₂)=0. Fundamental-group orders are 2,1,1. In characteristic ≠2 the étale canonical degree is 2. | Type definitions are used before, not derived from, this computation. Inventory omission S10. |
| 3.11 all local models | Odd primes: étale degree-2 cover over Z[1/2] is smooth proper. At 2, remaining square class 1 or 5 is unramified. Both models have K3 h²(O)=1. | Includes the dyadic place and all odd places, no good-primes-only shortcut. |
| 3.12 split extension | n=0 has zero basis torsors and unique zero splitting. n=1 has one Z/2-torsor; H¹(S,Z/2)=0 kills it. Over R the shift torsor is nonzero and fails the premise. | General n retained; no quantifier allowing bound/decomposition to depend improperly on basis index. |
| 3.13 full Picard over Z | Oort–Tate possibilities P=μ₂ or Z/2. First gives K3 off-diagonal h²(O)=1 while Fontaine requires 0. Remaining P=Z/2 and rank-10 quotient split by 3.12. | Constant full Picard follows; Fontaine remains a declared gap. |
| 4.1 Jacobian adapter | Elliptic generic Pic⁰ is proper genus 1 with identity. Quasielliptic Pic⁰ is a dimension-1 twisted additive group, not proper; its regular compactification adds boundary and has genus 1. Identity extends to a section. | Both branches retained; generic carrier ownership S01. |
| 4.2 geometric rationality | Required Jacobian χ=1 leads h¹=0 and h⁰ω²=0. Product E×P¹ has χ=0 and h¹=1. | Rationality assertion supported by source, but cited supplier criterion assumes it: S02. |
| 4.3 fibre-type comparison | A torsor full fibre may be 2D while Jacobian fibre is D; primitive Kodaira symbol T equals T, whereas multiplicity 2≠1. | Local LLR theorem used only for primitive type; its global corrigendum does not change this. |
| 4.4 simple fibres are isomorphic | A split cycle component has 3 F₂-points and at most 2 nodes, leaving ≥1 smooth point. An IV component has one junction, leaving 2. A nonsplit irreducible nodal normalization has a degree-2 node preimage, leaving rational smooth points. | Hensel section exists; repaired proof avoids assuming a terminal vertex in a cycle. |
| 4.5 nonrational fibres | Residue extension degree d>1 over F₂ is separable; graph descent for reducible fibre would make it purely inseparable, forcing d=1. | Contradiction establishes irreducibility. |
| 4.6 no Jacobian I₀* | Primitive type matching sends I₀* to Enriques I₀*, whose central component needs 4>3 attachments. | No premature inference of full fibre isomorphism for multiple fibres. |
| 4.7 semistable graph descent | Nonsplit I₁ has one geometric component but conjugate node branches; nonsplit I₂ has two components with nonsplit node data. | A fixed component graph does not force split nodes; counts retain the extra 2. |
| 4.8 at most one special rational fibre | P¹(F₂) has 3 points; 2 are tame doubles with ordinary/additive reduction. Thus at most 3−2=1 is semistable or supersingular. | Counts both doubles, not just one. |
| 4.9 all geometric sections descend | A generic degree-2d class minus dT has degree 2d−2d=0. Over algebraically closed constants Br(k(t))=0; over F₂(t) that assertion is false and is not used. | Current proof uses geometric Tsen plus constant Picard; source misuse corrected. |
| 4.10 auxiliary count | E₄:4; split I₄:8; nonsplit I₂:6; I₁*:2·6+1=13. The triple I₁*+E₄+I₄ gives 13+4+8=25. | First identifies Enriques counts. No assumption of Jacobian Picard constancy in its own proof. |
| 4.11 Jacobian constant Picard | Six supplier conditions include the auxiliary total 25 and all descended sections. After graph descent the same additive count 2r+1 becomes the actual Jacobian count. | Correct order of constructions. |
| 5.1 fourteen elliptic triples | In displayed order, point-count triples are (19,4,2),(19,2,4),(17,4,4),(17,2,6),(17,4,4),(15,3,7),(15,5,5),(19,4,2),(13,4,8),(13,5,7),(16,4,5),(15,4,6),(17,4,4),(15,4,6). All sum to 25. | Counts are necessary, not completeness. Completeness is expressly imported from Neron §7.4. |
| 5.2 quasielliptic component sum | ρ=10, MW rank 0: 10=2+Σ(r_a−1), hence sum r_a=11 over three rational points. | No application of rank-0 formula to an arbitrary elliptic MW group. |
| 5.3 four quasielliptic triples | Allowed component counts 1,2,7,8,9,9 give 9+1+1,8+2+1,9+1+1,7+2+2, each 11; the two 9s are II* and I₄*, not one symbol. | Four distinct triples, no missing small solution. |
| 5.4 forced multiple fibres | One semistable/supersingular rational point leaves two points for the tame doubles. Quasielliptic II* has no nonexceptional instance by 1.19. | The conditional multiplicity assertion remains true; excludes neither special premise nor characteristic 2. |
| 5.5 simple III* | Three initial elliptic III* triples have count totals 25. In two of them another rational point is semistable, so the III* point must be one of the two double points. Only E₄+E₄ can leave it simple. | Correct refinement. |
| 5.6 multiple E-type and rational two-section | Rational R has R²=−2 and R·half=1. A square-zero partner would instead have p_a=1 and is outside the special rational-bisection assertion. | Necessary hypothesis retained. |
| 5.7 three additional exclusions | Additional triples have totals 15+4+6=25,17+4+4=25,15+4+6=25. Each also satisfies the crude count. | No numerical contradiction; independent geometric proofs remain explicit owned targets, not certified source corollaries. |
| 5.8 partner over F₂ | Descended halves have intersection 1 over F₂ and after base change; full fibres have 4 in both fields. | Constancy/descent hypotheses are present. |
| 5.9 eliminate I₈ | Forced cycle completions have lengths 3 or 7, whose split counts are 6 or 14. Neither fibre type occurs in the conditional list. | Uses full classification and both completions. |
| 5.10 eliminate II* | Partner half intersection is 1; forced component contributes at least 2·1=2. | 1≥2 contradiction. |
| 5.11 eliminate multiple I₄* | Remaining completion gives I₀*, requiring 4 distinct F₂-points on P¹ with 3. | 4>3 contradiction. |
| 5.12 eliminate IV* | Additive partner branch needs 4 points on P¹ with 3. A smooth E₄ alternative has 4 points, so 4>3 cannot be used there. | The latter branch explicitly goes through additional target 5.7. |
| 5.13 eliminate IV | If the D₅ and A₂ subconfigurations lie in one partner fibre, their weighted contributions give ≥2+1=3 against a bound 2. | The previously omitted same-fibre possibility is covered. |
| 5.14 residual eight | Fourteen elliptic plus four quasielliptic cases give 18; after three additional exclusions and geometric eliminations the recorded residual list has 8 entries. | A possibly redundant quasielliptic III* entry is harmless as an upper list; not asserted to occur. |
| 5.15 residual multiplicities | I₁* contributes full divisor 2D, I₄* contributes D, and semistable fibres have multiplicity 1. | Primitive type is not confused with full multiplicity. |
| 6.1 matrix N₁ | Off-diagonal R·C₄=1, R·F=1; det −4, rank mod 2=8. R²=−2, F²=0. | All explicit entries match; symmetry padding S05. |
| 6.1 matrix N₂ | F′·F=1, F′·C₄=0; det −4, rank mod 2=8. Both half-fibre basis squares 0. | Distinct from N₁ despite same discriminant. |
| 6.1 two native carriers | Basis vectors are integral; half a root is not, with norm −1/2. Wrong ambient Q¹⁰ retains every matrix entry but contains that vector. | Carrier body correct; claimed discrimination false, S08. |
| 6.2 first discriminant and index | Four cosets: zero, vector, two spinors; full norms 0,−1,−2,−2; q=0,1/2,0,0. In unimodular Num, index²=4/1, so index=2. | All four Lean/headline comparisons true. |
| 6.2 dual norms and mixed entries | Inverse diagonal −1,−2,−3,−4,−5,−6,−2,−2,0,−2. C₈*·R*=0, C₈*·F*=2, R*·F*=1. | Exact inverse agrees with source (14); every entry product gives I. |
| 6.3 second discriminant | Same first eight inverse diagonals, final two 0,0; F′*·F*=1 and F*=F′. Four cosets with q=0,1/2,0,0. | Source (16) and native normalization agree. |
| 6.4 Pic⁰ quotient | Num/S has order 2; degree image of full Pic is 2Z, infinite. Subtracting (degree/2)T gives degree 0 and quotient order 2. | Correct Pic⁰, unlike the source's single occurrence of full Pic. |
| 6.5 generating two-section | Nontrivial Pic⁰ class tensored with degree-2 T has degree 2. Minimal integral representative has R²=0 or −2, genus 1 or 0. | Uses the general theorem plus coset tracking, not a bare positive-square decomposition. |
| 6.6 allowed incidences | Enumerating Σm_i a_i=2 with weights 1,1,2,2,2,2,2,1,1 gives 15 vectors. Nonzero isotropic cosets retain pairs {0,7},{0,8},{1,7},{1,8}. | Wrong single middle root gives zero or nonisotropic class; four surviving pairs form two spinor classes. |
| 6.6 marked symmetry | Right-tip swap sends {0,8}↔{0,7}, {1,8}↔{1,7}. It leaves two representatives, not one, with marked F′ fixed. | Extra branch retained and resolved geometrically later. |
| 6.7 square computation | v=C₈*+nR*+F*: v²=−2−2+4+2n=2n. n=0,1,2 gives 0,2,4. | Square 0 forces n=0; no sign ambiguity. |
| 6.8 first forbidden graph | Square −2 branch creates I₈; square 0 branch yields an integral half-fibre with 2 smooth rational points but 2 partner intersections plus 1 further point, total 3. | 3>2 contradiction depends on distinct smooth intersections, not total point count alone. |
| 6.9 independent opposite-tip branch | Pair {0,8} has weighted intersection 1+1=2. Allowed completions give I₀* (4>3 attachments) or the already excluded first ten-curve graph. | No dependency on 6.10 or final I₄* exclusion; source cycle not copied. |
| 6.10 second forbidden graph | {0,8} and {1,8} both have weighted sum 2. Geometric swap C₀↔C₁ relates the latter to 6.9 without fixing marked F′. | Both branches treated; not a false marked-lattice automorphism. |
| 6.11 six I₄* incidence orbits | Exact 15 vectors; automorphisms generated by the two tip swaps and reversal give orbit sizes 1,2,2,2,4,4, total 15. | Six orbits, no bounded stand-in in Lean. |
| 6.12 I₄* exclusion | All 15 vectors enter one of six branches; central branch gives 4≥8, tip branches reach the earlier ten-curve exclusions. | Conditional proof uses earlier exclusions in the stated order. |
| 7.1 multiple III* exclusion | Forced second partner fibre yields half-intersection 1=2. | Impossible in integer intersection theory, including characteristic 2. |
| 7.2 four III* orbits | Weights 1,2,2,3,4,3,2,1 give 6 solutions to weighted sum 2. Reversal orbits have sizes 1,1,2,2. | Four cases, exactly six vectors. |
| 7.3 simple III* exclusion | Central branch lower bound 8 exceeds full-fibre bound 4; final distinct pencils would have intersection 2 below minimum 4. | Both inequalities use full-fibre normalization consistently. |
| 7.4 restricted configurations, arbitrary characteristic | Allowed reducible patterns have I₁*+I₄ or I₂*+III+III. Partner construction produces IV* in the first branch or a new isolated I₄ cycle in the second, outside the corresponding complete pattern. | Source §14 covers all characteristic; characteristic-two exceptionality handled separately. |
| 8.1 tangent cohomology | Nonexceptional nonsupersingular: 0−10+0=−10. Exceptional/supersingular: 1−12+1=−10. | Correct sign; source printed +10 is not copied. |
| 8.2 supersingular W₂ obstruction | b₁=0 and 2(h¹−h²)=2(1−1)=0. For α₂ a rank-two W₂ lift would have parameters a,b both divisible by 2, so ab=0, whereas required ab=2≠0. | Special case independently confirms the declared general nonlifting statement's application. |
| 8.3 W₂ iff | Ordinary and nonexceptional classical: h²Θ=0, lift indicator 1. Exceptional classical and supersingular: h²Θ=1, lift indicator 0. Differential criterion requires ω order 2, excluding supersingular ω=O. | Branches correct; local conductrix prerequisites still unowned, S03. |
| 8.3a finite Witt-extension lift | Over V=W[π]/(π²−p), a map to W₂ with π reducing to 0 would send π to pa and π² to 0, but p remains nonzero. | A ramified characteristic-zero lift does not contradict non-W₂-lifting. Inventory S10. |
| 8.4 miniversal ring | Unobstructed W[[t₁,…,t₁₀]] has dimension 11 and e=1. W[[t₁,…,t₁₂]]/(2−t₁²) is regular dimension 12, W-flat and e=2. W[[t₁,…,t₁₂]]/(2) is regular dimension 12 but W-flatness is false. | New characteristic-zero input excludes the last control; no regularity⇒flatness shortcut. |
| 8.5 exceptional mod-four exclusion | Z/4→W₂(F̄₂) preserves 2≠0 and 2²=0. A hypothetical exceptional lift would give the forbidden W₂-lift. | Nilpotent algebraic-space thickening of a scheme is handled; not assumed over arbitrary nonnilpotent bases. |
| 8.6 finite-field endpoint | Conditional list has 8 cases; I₄*/III* eliminations leave the two restricted patterns, both ruled out by 7.4. | No independent proof of the added three classification exclusions is claimed. |
| 8.7 integral endpoint | Hypothetical family gives full Pic rank 10/torsion length 2 at F₂ and a Z/4 lift. Exceptional indicator must be 0; 8.6 gives zero possible special fibres. | Contradiction on an actual fibre, not an empty-base or zero-ring argument. |

S₃ and Q₈ are outside the explicitly commutative finite-group/Picard contracts, not counterexamples to them. Rank zero, noncompact topological groups, fans and polynomial degrees do not occur as unconstrained carriers here. The actual rank-zero analogue is checked at §3.12; the only total-division danger is x=0 at §3.6, explicitly excluded. Properness over a field or the local affine bases used here supplies the required quasi-separatedness. Arbitrary family bases need not be absolutely quasi-separated, and no such extra global premise is inferred. Purely inseparable fields are retained for geometric-base-change statements and distinguished from smoothness in the quasielliptic Jacobian.

### Supplier, ownership and pin audit

The following twelve contract groups were resolved against the supplied main/head copies, not against remembered sections. Section numbers refer to each named roadmap's README.md under TauCetiRoadmap, except its explicitly completed material.

| Supplier group | Actual contract and test |
|---|---|
| IntegralLattices | Completed Layers 1–5 and active 6A, README:1643–1651. Signature (1,9) yields U⊕E₈(−1); definite rank 16 is not covered by uniqueness. Native constructor and discriminant theories are not rebuilt. |
| AlgebraicVectorBundles | L1A–L1B, README:269–305, supplies relative Spec, arbitrary base change and anti-equivalence; tensor operations are in L0. Rank-two canonical-cover algebra is a specialization. |
| JacobianChallenge | Layer D, README:218–269, includes unpointed field Picard sheaf and projective geometrically integral scheme representability. It does not supply arbitrary nonsmooth genus-one surface Jacobians. |
| LocalFieldsRamification | Layers 1–2, especially power classes at README:399–441. Its mixed-characteristic formula at K=Q₂,n=2 gives 2·2·2=8. The package only adds the explicit representative/global-twist adapter. |
| SchemeAndStackFoundations | §§0.11,1.2–1.9,2.2–2.4,2.6,2.11,2.15,2.20,2.22,4.1–4.6,4.10,5.9–5.10 exist. Algebraic spaces, duality, deformation hulls and surface RR occur in the cited layers. Its §0.29 supplies scheme Frobenius for S03's added target; use that exact section with §2.20, not a new generic Frobenius construction. |
| EtaleCohomologyFoundations | F.0.2, README:200–222: finite étale Galois categories on connected nonempty schemes, with component/groupoid treatment otherwise. Both geometric Enriques surfaces and Spec Z meet that connected nonempty premise. |
| AlgebraicModuliForArithmeticGeometry | §§7.6.1–7.6.1a: fppf sheafification, base change, exact kernel under universal functions and section splitting. The flatness-Betti extension is explicitly separate. |
| ComplexComparisonPartII | C3.2d.2–C3.2d.5: proper-flat-fp algebraic-space Picard representation under universal functions, separatedness only with its extra hypotheses, Picard–Brauer and finite Cartier-dual torsors. The last includes nonétale finite flat groups, needed in characteristic 2. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1 includes Hopf algebras, Frobenius/Verschiebung, Cartier duality and Oort–Tate. General p uses its Oort–Tate constant; at rank 2 parameters can be normalized to ab=2. Does not silently provide DI21 Proposition 4.2. |
| WeilConjectures | WC.7 explicitly owns IsEnriques, characterization, field extension/projectivity, étale invariants and both constant-Num count names. There is no reverse edge to this roadmap. |
| K3SurfacesAndSymplecticBoundedness | Supplied current §§1.1–1.3 match the K3 predicate/field extension/projectivity citations. Current §6.0b, README:716–757, directly owns the shared genus-one theory; S01 corrects the stale gap. |
| NeronModelsAndSemistableAbelianVarietiesPartII | Current §§2.1–2.16,3.7–3.11,4.1–4.18,5.1–5.8,7.4 contain the named arithmetic fibre, local torsor, restriction, Jacobian, quasielliptic rank, Tsen, count and completeness contracts. §4.4 assumes rationality; use §6.1 for the rationality criterion, S02. |

Pinned API readings include Mathlib/LinearAlgebra/StdBasis.lean:120, NumberTheory/NumberField/ExistsRamified.lean:57–59, and NumberTheory/Padics/Hensel.lean:450–469. In the last, u≡1 mod 8 gives norm(F(1))≤1/8<1/4=norm(F′(1))²; weakening to an arbitrary odd unit would fail.

TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:60–69 defines the full integral submodule and symmetric integral form, but does not assume nondegeneracy; :261–298 gives ofGramMatrix and its carrier/basis recovery. Discriminant/Quadratic.lean:123–130 fixes half-norm. Overlattice/Isotropic.lean:347 restricts the native order isomorphism to even carriers. Native hyperbolicPlane, d8PlusLattice, orthogonalSum and negation provide the model needed for S04.

TauCeti/NumberTheory/Padics/SerreSigns.lean:194,219 gives the dyadic unit decomposition and square criterion; LocalField/Padic.lean:181 excludes square class 5; UnitSquareClasses.lean:203 counts four unit square classes. LocalField/WorkedExamples/UnramifiedQuadratic.lean:80 uses X²+X+1. These do not already state the package's exact three-bit representative comparison.

The geometry pins use TauCeti.AlgebraicGeometry.LineBundleClass (Class.lean:50), its native Cartier-divisor map (CartierDivisor/Picard.lean:75), degree kernel (WeilDivisor/Scheme/PicZero.lean:61–88) and section-dependent rigidifiedPicardFunctor (PicardFunctor/Rigidified.lean:57–66). The degree kernel needs an integral Noetherian proper curve, DVR codimension-one stalks, dimension ≤1 and the finite-dimensional cohomology premise; it is not an arbitrary-surface Pic⁰. The Cartier duality in AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271 is contravariant over a commutative ring, on finite locally free commutative affine groups. The package's adapters retain these restrictions.

All seven declared gap slugs match between design/plan.json and README: numerical-contraction-descent, elliptic-surface-geometry, picard-flatness-betti, finite-local-group-w2-nonlifting, one-obstruction-regularity, differential-w2-nonlifting, fontaine-low-degree-hodge. Six remain precise external extension contracts at their stated characteristic/base hypotheses. The genus-one request is no longer minimal because its current earlier owner provides it (S01). No gap has supplier “none”. A gap's currently unproved state is not a finding.

The three extra Enriques configuration exclusions belong here: they specialize actual Enriques two-sections, exceptional types and fibre intersections. The fourteen-model rational-Jacobian classification belongs to Neron §7.4 and is imported. The geometric numerical-lattice identification is an Enriques consequence of general lattice theory; generic lattices, line bundles, torsors and genus-one carriers remain imports.

Final mechanical dependency output, exit 0:

```text
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This is the roadmap-level dependency graph; it does not encode the internal target cycle in S13. The initial run also reported zero problems (27 roadmaps, 241 edges); the live index changed during this read-only review. Neither the package README nor the merge-order file was changed.

The inspected git head is 9db3d35. The origin/main...HEAD stat lists seven changed files, all under packages/EnriquesSurfacesAndIntegralNonexistence, with 2,574 insertions. Suggested.lean has one import Mathlib, one used native import, no set_option, no sorry-defined data, no lemma, no admitted example and no executable commands. The finite lists and exact matrix arithmetic are mathematical checks, not a proposed computational algorithm library.

### Source locator audit

The count is 46 distinct recorded units, with repeated target citations counted once. A source unit can be a section or a stable tag containing several numbered statements. “Verified” here means the text supports the stated target or exposes the recorded source problem; it does not promote an unproved repair target to a proved theorem.

| Source | Units | Checked locators and evidence |
|---|---:|---|
| SCH23 | 21 | Theorems 1.3 (line 262), 2.1 (349); §4 (lines 510–586); Propositions 5.3 (607), 5.4 (629), 5.5 (659); Theorem 5.6 (718); Proposition 6.2 (829); Propositions 9.2 (1084), 9.3 (1105); Theorem 9.4 (1162); Propositions 11.1 (1451), 11.2 (1517), 11.3 (1596), 11.4 (1700), 12.2 (1817), 12.3 (1908), 13.1 (1981), 13.2 (2024), 14.1 (2121); Theorem 15.1 (2210). Source version is the July 2022 author manuscript, not a substituted numbering. |
| ESB21 | 5 | Theorem 1.1 and existence discussion (lines 42–64); §2 conductrix/cover block, including Lemmas 2.3–2.4 and Propositions 2.7–2.8 (lines 146–230); Proposition 3.16 (458–460); Theorem 4.2 (479 onward); Corollary 4.3 (517 onward). Both simple/double cases and the classical special-pencil premise were checked. |
| DI21 | 7 | Proposition 3.3 (494–503), Corollary 3.4 (511–525), Proposition 4.2 (677–718), Theorem 4.3 and Picard-flatness proof (724–752), Theorem 6.1 (854–870 and its proof), Proposition 7.1 (1014–1021), Theorem 7.2 (1026–1058). The finite Witt-extension input is not supplied by Proposition 3.3 alone. |
| Lang1983 | 2 | Theorems 4.1–4.2, printed p. 62, lines 757–778: general divisor reducibility and positive-cone numerical reducibility. No classical restriction occurs in those statements. |
| MMV22 | 2 | Definition 1.1 (extra-special full-curve configuration) and Theorem 1.2 with Remark 1.5 (lines 33–65); the unique-pencil exception is retained. Its citation to older proofs is not counted as reading those proofs. |
| CDL2021 | 2 | 2024 draft Theorem 1.4.13, printed pp. 231–232, around lines 11518–11532; §5.11 lifting block, Theorems 5.11.4–5.11.5, printed pp. 609–611, lines 28636–28696. The 2021 Theorem 6.1.10 remains separately waived. |
| Stacks | 4 | Tag 0D24: lines 1251–1279 and 1359–1379 of the fetched Quot/Hilbert extraction; tag 0D3D: lines 1008–1012 of the descent extraction; tag 0EMV, Lemma 68.11.4: lines 1251–1259 of the decent-spaces extraction; tag 0H74: lines 1784–1792 of the supplied more-algebra extraction. Proper algebraic spaces here are decent; smooth lifting uses a Henselian pair. |
| LLR2018 | 1 | Corrected Theorem 4.3, lines 57–66, identifies the missing global a² factor. It does not amend LLR04 local Theorem 6.6. |
| EHS12 | 2 | Proposition 4.2 and Corollary 4.3, printed pp. 31–32, lines 1369–1408. Fetched legally through the source service from arXiv:1210.0342v1; the text identifies its internal version as 7, dated 25 February 2018. Flatness is proved before the numerical quotient and Enriques consequences. This new repair source must be added to the manifest by the repair worker, not by this read-only review. |

### Headline coverage

The deep endpoints read from README are: geometric numerical-lattice identification; general divisor and numerical reducibility; canonical-cover/Picard descent and integral Picard constancy; existence and partner theory of Enriques pencils; fundamental groups by type; Enriques/Jacobian comparison; conditional finite-field configuration exclusions and the arbitrary-characteristic restricted-configuration impossibility; characteristic-two W₂ lifting and miniversal regularity/flatness; characteristic-zero lifting over a finite Witt extension; finite-field and integral nonexistence. The explicit dyadic representative theorem and the two discriminant-group/quadratic-form computations are the native intermediate acceptance headlines.

The existing five admitted headlines use actual native carriers and survive the instance tests. Numerical reducibility is an additional statable headline and must be added (S04). The geometric endpoints need the missing Enriques, relative Picard, fibration or deformation interfaces; no stand-in should replace them. Most are named in the module docstring; S10 names the newly added omissions. The two symmetry declarations are the remaining padding (S05).

## Not verifiable

- CD89 Chapter III Theorem 3.4.1 and LLR04 Theorem 6.6/Remark 6.8 remain uncertified published locators. BM1977 Theorem 3/Proposition 11, Fontaine Theorem 1/Remark (a), and CDL2021's 2021-draft Theorem 6.1.10 remain waived. Their contents were not guessed, re-requested or relabelled under new keys.
- The legal 2024 CDL extraction has substantial font-encoding defects. Its numbered lifting statements and adjacent proof can be resolved, but this review does not certify a word-for-word transcription of the affected pages or equate their numbering with the waived 2021 version.
- Exhaustiveness of Neron's fourteen-model target and the three new Enriques exclusions in §5.7 are future proof obligations. The latter are expressly identified as going beyond SCH23. The 25-point checks do not prove either obligation. This review verifies their ownership, conditional uses and elementary constraints, not a new proof of the full classification.
- No Lean elaboration was run in this review. All twelve provided elaborated signatures were compared with the file; the phantom “lack” entry is a signature-extraction artefact. The proposed numerical theorem in S04 is described on actual native constructors, but its new written signature has not been elaborated under this read-only brief.
- Ownership against all 26 supplied open sibling folders was searched. Required roadmap search also mentions open K3Surfaces and EnriquesSurfaces heads whose files were not supplied; those unprovided heads were not independently inspected and are not asserted to be compatible. No dependency on them is introduced.
- The general DI21 Proposition 4.2 statement is an accepted supplier gap. Its printed uniqueness-of-scheme-lifts proof step is false: W₂(k)[t]/(t^p) and W₂(k)[t]/(t^p−p) are both free rank p with the same special fibre, but their embedding dimensions are 2 and 1. This refutes that step, not the group's nonlifting statement. The α₂ application has the independent ab=2 obstruction calculated above.
- The source errors below were checked where the cited proof routes use them. No assertion is made that every uncited page or every graphical proof in the source works has been exhaustively audited. No additional missing-reference request is outstanding.

## Source issues

- **Misprint** in ESB21 at Proposition 2.8(2), printed p. 6 (ESB21 line 205): the source says the biconductrix structure sheaf has one global section; it should be the surface line bundle O_X(B), as used in its proof; affects a stated result.
- **Misprint** in ESB21 at the references following Theorem 1.1, printed p. 2 (ESB21 lines 50–51): the source says Proposition 3.16 proves part three and Theorem 4.2 proves part two; it should interchange those two part references; affects nothing.
- **Error** in DI21 at Proposition 4.2 proof, printed p. 16 (DI21 lines 696–699): the source says freeness of Kähler differentials makes all W₂ scheme lifts isomorphic; it should be replaced by a cotangent-complex or Hopf argument allowing deformed relations; affects the proof.
- **Misprint** in DI21 at Proposition 7.1 proof, printed p. 23 (DI21 line 1019): the source says the tangent-sheaf Euler characteristic is ten; it should be minus ten; affects the proof.
- **Gap** in DI21 at Theorem 7.2 proof, printed p. 24 (DI21 lines 1038–1042): the source says non-W₂-lifting suffices for its full deformation-ring conclusion; it should also invoke independent characteristic-zero lifting before asserting Witt flatness; affects the proof.
- **Misprint** in SCH23 at §5 rank-two group law, printed p. 14 (SCH23 line 614): the source says the cross term has positive sign with ab=2 and f²=af; it should have negative sign in that coordinate convention; affects a stated result.
- **Misprint** in SCH23 at Proposition 5.4 proof, printed p. 15 (SCH23 lines 646–647): the source says the inverse of O→L² acts on a product in L⁻²; it should use the dual map L⁻²→O; affects the proof.
- **Misprint** in SCH23 at Proposition 5.5 proof, printed p. 16 (SCH23 line 687): the source says W(F₂^sep) is the maximal unramified extension of Z₂; it should say the completion of that extension; affects nothing.
- **Misprint** in SCH23 at Proposition 6.1 proof, printed p. 18 (SCH23 line 812): the source says t⁻⁶ equals (t₀/t₁)⁶ after defining t=t₀/t₁; it should be (t₁/t₀)⁶; affects the proof.
- **Error** in SCH23 at Proposition 9.2 proof, printed p. 24 (SCH23 lines 1097–1100): the source says one may choose a terminal component in every reducible singular fibre; it should treat cycle and triple-point fibres separately; affects the proof.
- **Error** in SCH23 at Proposition 9.3(v) proof, printed p. 25 (SCH23 lines 1126–1128): the source says Tsen makes Br(F₂(t)) vanish; it should apply Tsen over algebraically closed constants and then descend the classes; affects the proof.
- **Gap** in SCH23 at Theorem 9.4 proof, printed p. 27 (SCH23 lines 1222–1225): the source says projection to the dual component lattice preserves the square needed for parity; it should justify the orthogonal complement contribution before concluding evenness; affects the proof.
- **Error** in SCH23 at Proposition 9.5 proof, printed p. 26 (SCH23 lines 1183–1186): the source says the III* and II* graphs have at most one unmarked terminal vertex; it should distinguish their two unmarked terminals by multiplicities and distances; affects the proof.
- **Gap** in SCH23 at Proposition 11.3 proof, printed p. 38 (SCH23 lines 1693–1698): the source says the two vertical subconfigurations lie in distinct partner fibres; it should first exclude their occupying one fibre using the weighted intersection bound; affects the proof.
- **Misprint** in SCH23 at Proposition 12.3 proof, printed p. 43 (SCH23 lines 1959–1961): the source says full Picard of the generic fibre equals Num(Y)/S; it should say the degree-zero Picard group; affects a stated result.
- **Misprint** in Stacks at tag 0D28, Lemma 99.11.4 proof, printed chapter p. 28 (Stacks line 1291): the source says the last rigidification map is composed in its original direction; it should use its inverse so the composite is an endomorphism of O; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9db3d351dafa4d240e9d2b04213132fa2e0b0523", "job": "RT-EnriquesSurfacesAndIntegralNonexistence~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
