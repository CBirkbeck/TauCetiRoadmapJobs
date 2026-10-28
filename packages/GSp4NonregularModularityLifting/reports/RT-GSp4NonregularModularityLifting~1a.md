<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6439322277 -->
Red team round 1 pass a (codex) of d923256

Verdict: needs_changes

1. **F01** (P2) The six-point symplectic construction already has an earlier owner

   **Location:** packages/GSp4NonregularModularityLifting/README.md:1189–1207: “Construct the exceptional S₆≅Sp₄(𝔽₂) identification”.

   **Claim:** This roadmap owns the even-subset quotient, its alternating form and the permutation-group identification.

   **Witness:** TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1682–1693, A3.12, already specifies the same 16-element even-subset symplectic model, pairing and S₆≅Sp₄(𝔽₂)-equivariance. That roadmap precedes this one in ORDER.txt.

   **Exact repair text:** “Import the six-point symplectic model and S₆≅Sp₄(𝔽₂) identification from AbelianSchemesAndArithmeticModuli A3.12. Use its transposition and three-cycle actions to interpret the mod-2 illustration.” Replace the local construction/API in §8.4 by this import; add A3.12 to the exact supplier contracts and §8.4 Needs. Keep the numerical illustrations as Checks.

   **Repair test:** The imported quotient has 32/2=16 vectors, dimension 4; (12) fixes 8 classes and (123) fixes 4. Both imported actions have the required fixed-space dimensions 3 and 2. No new Lean declaration is needed for an imported theorem. If ownership were retained instead, the blanket assertion in Suggested.lean:14 would be false: the group-isomorphism statement uses native Equiv.Perm and Matrix.symplecticGroup (Mathlib/LinearAlgebra/SymplecticGroup.lean:101,213).

2. **F02** (P2) Residual symplectic reconstruction is replanned instead of imported

   **Location:** packages/GSp4NonregularModularityLifting/README.md:661–675: “For every maximal ideal … continuous semisimple residual GL₄ representation”.

   **Claim:** §3.3 constructs the residual representation and its absolutely irreducible symplectic pairing using Hasse lifting and regular characteristic-zero realizations.

   **Witness:** TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:2542–2567, §3.30, already owns CG Lemma 6.9's residual representation, regular Hasse lift and alternating-pairing transport for the same anemic image and weights a≥b≥2.

   **Exact repair text:** “Import the residual realization and absolutely irreducible symplectic pairing from ModularityAndLanglandsExtensions §3.30, retaining its classification, coefficient, polarization and unitary-descent hypotheses. Here compare the full central character and transport that realization along the selected and enlarged Hecke-image maps.” Add §3.30 to the supplier contract and §3.3 Needs; delete the duplicate reconstruction/pairing proof plan.

   **Repair test:** At (a,b)=(2,2), the owner's shift to (2+t,2+t), with (p−1) dividing t, preserves the residual multiplier because ε̄^(−2t)=1. This supplies precisely the residual representation required before the selected-image transport. The determinant-only test still distinguishes multipliers 6 and −6 despite their common square 36.

3. **F03** (P2) The paramodular-newvector contract drops the central-character hypothesis

   **Location:** packages/GSp4NonregularModularityLifting/README.md:150 and the matching gap in design/plan.json: “a generic GSp₄ representation has a unique paramodular newvector line at its conductor”.

   **Claim:** Genericity alone guarantees a paramodular fixed line.

   **Witness:** BCGP25 lines 7992–8016 retain central character |·|². Every Par(ℓⁿ) contains zI₄ for z∈ℤℓ×. A ramified central character forces every fixed vector to be zero, at every n.

   **Exact repair text:** “What SmoothRepresentationsOfLocalGroups must provide (gap:gsp4-paramodular-newvector): For an irreducible admissible generic GSp₄(ℚℓ)-representation over an algebraically closed characteristic-zero coefficient field with unramified central character, prove that its paramodular fixed space at the Artin conductor of its local parameter is one-dimensional and vanishes at smaller levels, with the normalization used in BCGP25 Proposition 7.5.1.” Use the same needs sentence in plan.json. Add the ramified-central-character negative control.

   **Repair test:** At ℓ=7 take an irreducible generic unramified principal series π₀ of trivial central character and a tame character χ with χ(3)=ζ₃. For π=π₀⊗(χ∘ν), 3I₄ acts by χ(9)=ζ₃²≠1, so dim π^Par(7ⁿ)=0 for every n. The repaired hypothesis excludes π; the application's |·|² is trivial on ℤℓ× and remains covered. This finding concerns a missing hypothesis in the declared contract, not its absence from the supplier.

4. **F04** (P1) The adic selector is not an algebraic generalized eigenspace

   **Location:** packages/GSp4NonregularModularityLifting/README.md:366–374: “The selected module is the intersection of the two generalized root submodules.”

   **Claim:** The factorial-limit selector on a finite adic O-Hecke algebra has the same image as the intersection of algebraic generalized eigenspaces.

   **Witness:** Take O=ℤ₁₁, M=O, α=2, β=3, T=16, Q=6. Both selectors are 1, but ker(T−5)ⁿ=ker(11ⁿ)=0 for every positive n. Selected image O differs from algebraic intersection 0.

   **Exact repair text:** “Over O the selected summand is the simultaneous residual-root factor: T−c and Q−d act topologically nilpotently there. Modulo every ϖᵐ its image is the intersection of the two algebraic generalized root submodules. Over the residue field k this is the intersection of Mathlib's generalized eigenspaces; no such identification with exact generalized eigenspaces on the characteristic-zero fiber is asserted.” Restrict the first API bullet accordingly and add the example above as a negative-control Check.

   **Repair test:** Since 11^(n!)→0 in ℤ₁₁, e(T,5)e(Q,6)=1. Modulo 11ᵐ, (T−5)ᵐ=0, so both finite-quotient generalized spaces are the full module. Over ℚ₁₁, 11 is invertible and the exact generalized 5-eigenspace is zero. This agrees with Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71,89, where the native construction is ker((f−μ)^n), and with the supplier's residual-factor formulation in IntegralHeckeAndGaloisDeterminants §2.3, “Factorial powers”.



5. **F05** (P1) The theta proof plan consumes its own construction and injectivity

   **Location:** packages/GSp4NonregularModularityLifting/README.md:746,760: “Use the exact supplier contract for the geometric theta construction and its holomorphy, weight and injectivity from §3.1–§4.2.”

   **Claim:** The geometric construction and injectivity needed to prove §4.2 are supplied before §4.2.

   **Witness:** §3.1 supplies Hasse lifts, §3.1a secondary Hasse geometry, and §4.1 formal Fourier operators. The Needs line explicitly consumes “the theta geometry of §4.2”. CG20 lines 2420–2422 instead invoke Yamauchi's geometric construction.

   **Exact repair text:** “Within §4.2 first construct the ordinary-locus differential operators using the Gauss–Manin connection, the unit-root projection and Kodaira–Spencer; prove their change-of-frame laws, Hasse pole cancellation and extension across the boundary. Then prove the displayed Fourier formulas. Finally prove scalar and vector injectivity from their superspecial restrictions and the Hasse-stratum restriction bounds of §3.1a. Import Gauss–Manin from AbelianSchemesAndArithmeticModuli A4.3 and logarithmic Kodaira–Spencer from ShimuraCompactifications C5.12; the specialized unit-root projection and theta extension are local targets here.” Replace the self-reference by these ordered subtargets, each with a locator. For construction use Yam14 §§3.1–3.2, Propositions 3.9 and 3.12 (pp.21–23); retain the qualified CG injectivity locators. Do not use the square-zero differentiation step without repairing it.

   **Repair test:** On the ordinary locus the Hasse determinant is a unit and the projected connection is defined; at a superspecial point that determinant is zero, so an independent extension theorem is necessary. For p=7 the rank-one coefficient has contraction 5 and determinant 0, so Fourier algebra alone cannot supply scalar/vector geometric extension. Yam14 lines 1151–1157 introduce an additional proof defect: on R=𝔽₇[[t₁₁,t₁₂,t₂₂]]/𝔪², an R-derivation with D(t₁₁)=1 would give 0=D(t₁₁²)=2t₁₁≠0. Work on a smooth formal deformation base, with a justified connection calculation, before truncating. The ordered plan removes the self-edge. Ownership stays here because AlgebraicModularFormsAndSerreWeightsPartII, whose board design also plans these operators in S8, is later in ORDER.txt (276 versus 260); it cannot be cited as a supplier. Record the transfer of the overlapping construction to this earlier owner and have that later design import it.

6. **F06** (P1) The cited crystalline supplier covers only regular weights

   **Location:** packages/GSp4NonregularModularityLifting/README.md:62,486,496: “Use the finite-slope family and crystalline-period continuation … from the supplier geometric Galois construction.”

   **Claim:** AutomorphicGaloisRepresentationsPartII AG2.6 supplies the family continuation used in the singular, totally-real specialization of §2.4.

   **Witness:** TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:3218–3241 gives good-level crystalline comparison for a≥b≥3 and discrete-series infinity type. M14 lines 1673–1683 instead invoke crystalline-period continuation for the singular specialization.

   **Exact repair text:** “Import regular GSp₄ crystalline realizations from AutomorphicGaloisRepresentationsPartII AG2.6. Import analytic continuation of crystalline periods, including its G_{F_v} and φ^{f_v} version, from AutomorphicGaloisRepresentations §0.4. In §2.4 construct the required finite-slope family and verify the continuation theorem's smallness, Sen-polynomial, injectivity and truncation hypotheses. Apply it for the four refinements; distinct specialized Frobenius eigenvalues make the four period lines independent and yield crystalline dimension four.” Add this exact supplier contract and Needs edge; remove the assertion that AG2.6 supplies family continuation. The current §0.4 has arbitrary-rank finite-free family input, so do not add a duplicate generic continuation theorem.

   **Repair test:** The allowed singular parameter (m₁,m₂,w)=(1,0,0) satisfies parity but is not a discrete-series weight with b≥3. The present AG2.6 citation therefore cannot discharge it. The earlier owner explicitly states the G_{F_v} continuation extension at TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:794–826; its conditions must be checked on the family, not inferred from the four distinct roots at one point. At roots 1,2,3,4 the four eigenlines are independent; at 1,1,2,3 this argument supplies no fourth independent period.

7. **F07** (P3) Klingen-projector Checks do not test the projector

   **Location:** packages/GSp4NonregularModularityLifting/README.md:954–958: “The empty product gives the identity”; “reject this refinement”; “pr{x,y}=prx·pry”.

   **Claim:** These are three discriminating Checks for the polynomial/factorial construction in §6.1.

   **Witness:** The first and third repeat its product definition; the second only repeats an input exclusion. Replacing every nonempty-prime projector by zero still passes all three, while destroying the claimed labelled-block image.

   **Exact repair text:** Replace the three Checks by: “Over 𝔽₁₁ take labelled roots (2,3,4,6). Their paired products are both 1. With Y=xU_{x,2}, R(Y)=(Y−8)(Y−7)(Y−2), R(6)=8 and R(8)=R(7)=R(2)=0; the unit-factor projector is 1 on the desired block and 0 on the other three. Over 𝔽₁₃, roots (2,4,11,9) have αβ=γδ=8, so R(8)=0 even on the desired block: this refinement is excluded. For two primes acting on four simultaneous block lines, take projectors diag(1,1,0,0) and diag(1,0,1,0); both products are diag(1,0,0,0), the joint selected line.” Keep the empty-product identity in the API.

   **Repair test:** In 𝔽₁₁, (6−8)(6−7)(6−2)=8≠0, whose sufficiently large factorial powers equal 1; each rejected block gives 0. The zero-projector wrong model fails the first and third replacement Checks.


8. **F08** (P3) The annihilator Check changes the acting algebra

   **Location:** packages/GSp4NonregularModularityLifting/README.md:637,651: “Jμ,m^sel=Ann(Tμ^sel,Hμ,m^sel)” and “Jsel=0×k”.

   **Claim:** The displayed k×k example computes the selected-image annihilator defined in §3.2.

   **Witness:** Restrict T=k×k acting diagonally on k² to the first coordinate. Its selected action image is Tsel=k. Thus Ann_Tsel(k)=0; 0×k is instead Ann_T(k), the kernel before taking that image.

   **Exact repair text:** “For T=k×k acting diagonally on k², restriction to the first coordinate has kernel 0×k and selected image Tsel≅k. In this one-coefficient model Jsel=Ann_Tsel(k)=0, whereas Ann_T(k²)=0. These are ideals of different acting rings.” Keep finite-level annihilators of an integral selected image distinct from the kernel defining that image.

   **Repair test:** (0,1) kills the selected line in the full T-action, but maps to 0 in Tsel. The only scalar in k annihilating 1 is 0. The repaired Check matches both the selected-image definition in §1.1 and the ring in §3.2's annihilator.

9. **F09** (P3) The p=7 surjectivity Check has no instance in its section

   **Location:** packages/GSp4NonregularModularityLifting/README.md:1181: “For surjective r̄ at p=7 the scalar λ=3”.

   **Claim:** This supplies a positive scalar-neatness Check in §8.3's fixed-multiplier weight range.

   **Witness:** At p=7, oddness and 4≤a<6 force a=4. Then ν∘r̄=ε̄⁻³ has image {1,−1}, whereas ν:GSp₄(𝔽₇)→𝔽₇× is surjective. No such surjective r̄ exists; 3I₄ has forbidden multiplier 2.

   **Exact repair text:** “At p=11,a=4 the exponent 1−a=−3 is coprime to p−1. Conditional on surjectivity, λ=2 gives λ²=4≠1; a geometric Frobenius class with that scalar image has q³=4, hence q≡5 modulo 11, while all eigenvalue ratios equal 1. At p=7,a=4 the multiplier image is only {±1}, so surjectivity onto GSp₄(𝔽₇) and the proposed scalar 3I₄ are impossible.” Retain the p=3 negative control and the separate induced-image discussion.

   **Repair test:** 5³=125≡4 modulo 11 and 5≠1; inversion gives ε̄(Frob_q)=9 and 9⁻³=4. At p=7, cubes are ±1 while 3²=2, so the rejected instance is explicitly rejected rather than used as a positive Check.

10. **F10** (P2) The neat-prime argument reverses the cyclotomic Frobenius convention

   **Location:** packages/GSp4NonregularModularityLifting/README.md:1170: “forces q=ε̄(σ)≢1”.

   **Claim:** The residual cyclotomic value of the chosen Frobenius class is q.

   **Witness:** README:19 fixes geometric Frobenius with ε(Frob_q)=q⁻¹. In the repaired p=11,a=4 scalar example, q=5 but ε̄(Frob_q)=9, and 5≠9 in 𝔽₁₁.

   **Exact repair text:** “Choose q with geometric Frobenius conjugate to σ. Since ν(r̄(σ))=ε̄(σ)^(1−a)≠1, ε̄(σ)≠1, and therefore q=ε̄(σ)⁻¹≠1 modulo p. All eigenvalue ratios of the scalar are 1.”

   **Repair test:** For q≡5 modulo 11, ε̄(σ)=9 and 9⁻¹=5. The non-one conclusion is preserved and the displayed equality now agrees with the roadmap's stated convention.


11. **F11** (P1) The scalar neighbor argument lacks its tame-level transport

   **Location:** packages/GSp4NonregularModularityLifting/README.md:848: “handle p-divisible discriminants via … a p-primitive neighbor argument” and “Neighbor cycles and Lemma 8.24”.

   **Claim:** The scalar recurrence used to close §4.7 is available at the roadmap's general neat tame levels from the cited CG binary-neighbor argument.

   **Witness:** CG20 lines 2793–2803 use same-correspondence reciprocity. For Γ(5), p=7, forward neighbors of Q=7x²+y² have residue x²+2y²; a second forward step has residue 3x²+4y², not Q modulo 5.

   **Exact repair text:** “Before the scalar vanishing argument, construct the oriented neighbor multiset for Δ=Γ diag(p,1)Γ and the reverse multiset for Δ∨={pM⁻¹:M∈Δ}. Prove [P]∈F_Δ([Q]) iff [Q]∈F_Δ∨([P]). At the actual tame level prove the level/cusp/diamond transport identifying the reverse action, and derive the scalar recurrence with that transport and its eigencharacter. Use the β² exclusion only after proving the transported recurrence has that scalar. Retain all neat tame levels.” Add this as an ordered local target with CG20 Definition 8.19 and the corrected domain of Lemma 8.20 as locators; add the positive-definite Γ(5) negative control below. Do not solve this by restricting to full SL₂(ℤ) or by adding an upward supplier edge.

   **Repair test:** Both Q=7x²+y² and P=x²+7y² are positive definite, 7-primitive and have discriminant −28. D=diag(7,1) gives P=D⁻¹·Q. A second valid forward matrix is M=[[2,5],[35,91]] with det M=7; it lies in Γ(5)DΓ(5), since M=[[6,5],[25,21]] D [[−19,−50],[160,421]], and both outer matrices lie in Γ(5). Its neighbor is 1208x²−930xy+179y², still of discriminant −28, reducing to 3x²+4y². Γ(5) equivalence preserves the coefficients modulo 5, so this is not Q's class. The reverse matrix 7D⁻¹=diag(1,7) returns P to Q but is outside the forward double coset modulo 5. Thus neither cuspidality nor p>3 repairs the missing identification. The later AlgebraicModularFormsAndSerreWeightsPartII design, S6/neighbor-reciprocity and G6, records the same ownership obligation; move this consumed prerequisite to the present, earlier roadmap rather than importing that later design.

## Verified sound

Read all 1,660 README lines and all 44 Suggested.lean lines, together with the repository README and CONTRIBUTING. Counts: **0 Lean declarations; 61 numbered target subsections; 212 Check bullets in 65 Check blocks; 12 layer examples; 77 distinct explicitly source-prefixed line anchors resolved (82 occurrences); 22 supplier-contract blocks covering 21 roadmaps checked; all 55 supplied sibling folders searched by object.** The tables below record the computed tests, including failures; these counts do not assert that every target or Check passed. Every numbered target has a source locator. There are no separately bold theorem labels; the bold mathematical blocks are the normalization and Check blocks, included below.

The head is d92325627a10e34464f35b2b86246e6105df9c99. The comparison with origin/main changes only packages/GSp4NonregularModularityLifting: 10 files, 3,126 insertions and 102 deletions. Parsed plan.json agrees with origin/main outside its top-level gaps. All 20 gap slugs and needs sentences match between plan.json and the README, and all name suppliers. R03 concerns a missing hypothesis in one contract; missing implementations of declared gaps are not findings. The settled supplier-admission and selected-rank findings are not re-raised.

The pinned revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Directly read ZMod (Mathlib/Data/ZMod/Defs.lean:138), IsIdempotentElem (Mathlib/Algebra/Group/Idempotent.lean:37), generalized eigenspaces and their natural-exponent criterion (Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71,89), and continuous H¹ (TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:695,712). The last has an additive topological group and continuous action; its inherited pointwise quotient topology is not automatically discrete. The README preserves that limitation. Matrix.symplecticGroup (Mathlib/LinearAlgebra/SymplecticGroup.lean:101,213) makes the finite-group statement in R01 statable.

Suggested.lean has one Mathlib import, the required namespace, and no theorem, def, instance, abbrev, opaque, axiom, variable or include. Its declaration/context/signature table is empty. Accordingly there is no own name for a #check audit, no dropped section hypothesis, no fully qualified name collision and no padding to delete. No Lean process was run. Searches at both pins found symmetric powers and matrix groups, but no actual Siegel coherent eigensystem, integral genus-two correspondence, Hida module, crystalline-period functor or ordinary symplectic deformation-ring carrier that would make the arithmetic endpoints statable with a few simple definitions. R01 removes the exceptional finite-group construction from this roadmap's acceptance obligations by importing its earlier owner.

| Headline group from README | Acceptance boundary |
| --- | --- |
| Integral normalized p-actions, §1.1; secondary Hasse geometry, §3.1a; theta construction/injectivity, §4.2 | Actual integral genus-two moduli, automorphic coefficients and geometric differential operators missing; named in docstring |
| All-degree coherent interpolation and crystalline specialization, §§2.3–2.4 | Coherent eigensystems and family period functors missing; named |
| Ordinary weight-two, pure-monodromy and dual-spin interpolation, §§2.5–2.7; completed isotypy, §2.8 | Automorphic parameters, reductive pseudocharacters and completed higher-Coleman eigenspaces missing; named |
| Regular Hecke-valued representations, §3.4; Hasse-projection injections, §4.8; singular deformation, §5.2 | Actual Hecke images, geometric Hasse maps and local deformation data missing; named |
| Finite-coefficient Klingen comparison, §6.4; selected balance, §7.4 | Klingen covers, coherent homology and integral selected projector missing; named |
| Minimal R=T and positive cuspidal freeness, §§8.2–8.3; classical CG modularity, §8.5 | Actual universal deformation ring and coherent Hecke module missing; named |
| Variable-weight ordinary R=T, §9.2; p-adic and parabolic lifting, §§9.3–9.4 | Actual Siegel Hida families and ordinary rings missing; named |
| Local freeness, §10.7; regular multiplicity one, §11.3; support/rank one, §§11.4–11.5; classical weight-two lifting, §11.6 | Four higher-Hida modules, their arithmetic fibers/support and higher-Coleman comparison missing; named |
| Exceptional S₆≅Sp₄(𝔽₂), §8.4 | Statable on native finite matrix groups, but already owned: R01 imports it |

Source lookup used the eight certified cached texts and their recorded versions, not remembered journal numbering. In addition to the 77 distinct source-prefixed anchors, checked the compound line locators and BCGP21 Propositions 2.4.24/2.4.26 and Hypothesis 7.8.1/Proposition 7.9.8 (BCGP21 lines 1283,1338,10160,10665). The former distinguish a selected one-dimensional refinement from the two-dimensional ordinary weight-two Iwahori space; the latter retain odd p and projective derived descent. PS16 Theorem 0.1, Theorem 3.6 and Remark 3.10 (PS16 lines 34,698,729) distinguish continuous characteristic-zero interpolation from an identification of integral lattices. M14 Proposition 4.16 (M14 line 1677) retains spherical and distinct-root hypotheses. P20's secondary section has exponent p²−1 and multiplicity two on the reduced supersingular locus (P20 lines 1360,1652).

Yam14 here denotes Takuya Yamauchi, *The weight reduction of mod p Siegel modular forms for GSp₄*, arXiv:1410.7894v5 (30 August 2016). It was fetched through the sources service from arXiv to verify the construction cited inside CG20's proof; no manifest was edited in this read-only pass. Its numbered extraction is used in R05 and the source issues. A repair adopting that primary citation must register the work once in sources.toml.

| Supplier contract checked at its current readable copy | Scope comparison |
| --- | --- |
| ArithmeticGaloisRepresentations §§5.11,6.4,7.3–7.12 | Density-to-group comparison, full multiplier, Frobenius-annihilation isotypy and residual image predicates resolve. Integral enormousness and the geometric-nonisogeny big-image extension remain declared gaps. |
| AutomorphicBundles B3–B5, B3.HT.4/.7/.8 | Coefficient bundles, q-expansions and Hodge–Tate tower/Levi/coherent-section inputs resolve. They do not constitute the missing theta proof. |
| AutomorphicBundlesPartII IC.1–IC.8 | Board design provides coherent complexes, duality, descent, vanishing and packet rank comparison. Degree-one normalized p-actions and selected rank inequality remain explicit gaps. |
| AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5–AG2.6 | Regular spin, full multiplier and ordinary shape resolve; singular family-period claim does not: R06. |
| AutomorphicLFunctionsAndLocalFactors AL.4 | Parameter/local-factor normalization resolves; no paramodular uniqueness is silently inferred. |
| ModularityAndLanglandsExtensions §§3.2,3.5(vii),3.9,3.26 | Classification, adjoint-holomorphy and interpolation interfaces resolve with hypotheses. §3.30 is the omitted reconstruction owner: R02. |
| DeformationAndDerivedPatchingAlgebra §§3.1–3.3,5.1–5.9,6.1–6.7,7.6–7.10 | Three distinct patching criteria, marked completions, projective norm and faithfulness/support conditions resolve. |
| EndoscopicTransferAndUnitaryTraceComparison §§11.1,13.2 | General-type transfer and solvable descent retain the full character, Tate twist and irreducibility over the extension. |
| GlobalGaloisDeformations R04.3–R04.6, G7 | General global deformation presentations resolve; the three specified CG/P12/two-torus refinements remain declared gaps. |
| HodgeTateAndCanonicalSubgroups §§0.2–0.5,0.14–0.15 | Hodge–Tate maps and primary Hasse criteria resolve; no secondary invariant is imported under those names. |
| IntegralHeckeAndGaloisDeterminants §§0.7,1.1–1.7,2.1–2.3, IHG.3a–IHG.4 | Full multiplier and finite image/factorial APIs resolve; §1.5 symplectic descent is odd-characteristic and §1.7 needs the declared GSp₄ extension. R04 corrects the adic interpretation. |
| LocalGaloisDeformationRings §§2.7,2.17,2.25,6.3,6.14,6.26–6.27,6.29 | MinimalAt and SiegelOrdinary exist in this supplier, not at the pins. Full flags differ from a split unramified plane; all-p arithmetic regularity and P12 orientation remain gaps. |
| PadicFamiliesPartII E6,S7,F8,K2 | Board design's four pieces, Sen/Cousin classicality, module/control/duality/central-character and Klingen interfaces resolve; P12 horizontal control remains a gap. |
| OverconvergentAutomorphicForms §§8.6–8.7 | Supplied open head resolves analytic Bruhat/distribution coefficients with actual finite-flat covers, quasi-Stein conditions and coefficient/radius maps. |
| PadicHodgeTheory §§3.2–3.6,4.4,5.3–5.4 | Finite-dimensional period, Sen and WD interfaces resolve; no family continuation inferred from these. |
| ShimuraCompactifications C3.9–C3.10,C5.13–C5.18 | Fans, level maps, trace and integral models resolve. C5.12 supplies the logarithmic Kodaira–Spencer input used in R05's repair. |
| ShimuraData §§5.9–5.10,5.18 | CG/Pilloni coordinates, opposite Borels and Kostant shifts resolve. |
| SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3,SR.4.1–SR.4.5 | Generic induction/Jacquet/Satake interfaces resolve; specialized local contracts stay gaps, with R03's central-character correction. |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII §§1.2–1.3,2.1–2.2,3.1–3.2,4.7–4.8,5.2/5.4–5.6,6.3–6.4 | Read its board-main design. The numbered sections exist, including h³, all six dyadic premises and q_v≡1 mod9 at p3. Admission/order remains the previously settled external issue. |
| PotentialAutomorphyInfrastructurePartII PL.4 | Board design defines the dyadic strong-oddness conjugacy condition; nonalternating I and alternating Ψ differ in characteristic two. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 | Multiplicative/connected/étale filtration, BT₁ crystals and Hasse–Witt/Cartier-dual interfaces resolve with their base conditions. |

Ownership searches used roadmaps grep/show, main and Completed, board packages/designs, and all 55 supplied sibling checkouts. The other earlier owner found is AbelianSchemesAndArithmeticModuli A3.12 (R01), and the correct period-continuation owner is AutomorphicGaloisRepresentations §0.4 (R06). The board's AlgebraicModularFormsAndSerreWeightsPartII design overlaps §§1.1,3.1,3.1a,4.1–4.2 and the neighbor prerequisite: its S2–S8 occur later in merge order (line 276 versus this roadmap's 260). The consumed constructions must therefore be owned here and imported by that later roadmap; no upward supplier citation is proposed. In degree two its normalized contraction differs from this roadmap's elementary contraction by the unit −6 (at p11: 4·5=9). This adapter must accompany the ownership transfer. The general lifting endpoints themselves have no earlier owner in the searched copies.

Mechanical dependency check, exit 0, complete output:

```text
depcheck: 56 roadmaps, 661 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap-level check does not detect the subsection self-edge in R05 or supply the missing arithmetic comparisons. No merge-order file, package input, library, source manifest or external application was changed.

The following is the running statement/instance table. “Retained” or a mathematical equality records only the displayed instances, not a proof of the eventual theorem.

| Target | Context and instances | Computed values | Result/change |
| --- | --- | --- | --- |
| Conventions | ε, ℓ=3, a=2; Q=diag(1,1), p=7 | ε(F)=1/3; multiplier=3; determinant=9; d(Q)=−4=3 nonsquare, det=1 square; FNF⁻¹=N/3 | Signs agree |
| 0.1 | F₁₁ pairs (2,3),(2,6),(1,3); F₂ | Products 7,0,0; F₂ all pairs product 0; swapping changes 7 to −7=4 | Equivalent nonvanishing and symmetry; units separately required |
| 0.2 | (k,r)=(0,2),(2,2); finite twist | Weights (2,2),(4,2); λ=(−1,0;4),(−3,0;6); 1²=(−1)²=1 | Central character retained |
| 0.3 | (p,a)=(7,4),(7,6),(7,5); square-zero N | Range true,false,true; ν(c)=−1,−1,+1; N₀²=0; N²=η(E₁₃−E₂₄) | a=5 excluded by oddness, nonminimal thickening rejected |
| 0.4 | Q empty; scalar residual Frobenius at p=7, λ=3 | Δ=1; scalar ratio=1; ν=9=2 forces q≠1 | Empty-level and neatness boundaries retained |
| 0.5 | F₁₃ (2,4,11,9); exchanged (2,11,4,9); x=11,p=5,N=2 | αδ=βγ=5; αβ=γδ=8 initially; exchanged products 9,10; 11=1 mod5 but 11≠1 mod25 | Separation necessary |
| 1.1 | d=0,r=2; b=2; O/ϖ³ with p=ϖ | Valuations ≥4,3,3; exponent 2−b=0; p³·1=0 in quotient | Integral pre-reduction factorization required |
| 1.2 | Residue-field diagonals; nilpotent block; integral perturbed eigenvalue | Joint selectors 0 versus union I; diag(1,0); J²=0 but J≠0; for T=c+ϖ on O, selector=1 but exact c generalized E-space=0 | R04: O-adic selection differs from exact generalized eigenspaces |
| 1.3 | zero space; Eisenstein section; wrong second eigenvalue | Witness set empty; cusp membership false; Qη−αβη≠0 | Nonzero cuspidal simultaneous occurrence retained |
| 2.1 | matrix [[0,2],[1,0]]; zero; Q×Q | Charpoly X²−2, eigenfield degree2; no nonzero occurrence; two rational characters | Finite actual action image essential |
| 2.2 | weights (2,2),(4,2),(3,3) at x=3 | Exponents −1,0,0; valuations −1,0,0 | Obstruction only scalar weight two |
| 2.3 | diag(1,2,3,6); X=0; lattices O,ϖO | Reciprocal coefficients 1,−12,47,−72,36; value1; images in O/ϖ are k,0 | Rational comparison does not identify lattices |
| 2.4 | (m₁,m₂,w)=(1,0,0),(1,0,1); repeated roots | Parity 1=1,0≠1 mod2; difference 1−1=0; Steinberg N rank1 | R06: source theorem valid; supplier period-continuation citation wrong |
| 2.5 | paired ordinary diagonal; ℓ=3; N=0,E₁₂ | Paired products ε⁻¹; det ε⁻²; 3,9 versus 1/3,1/9; N ranks0,1 | Basic comparison only semisimplified |
| 2.6 | F=diag(1,3), N=0 or E₁₂ | FNF⁻¹=0 or N/3; ranks0,1; same r | Purity/adjoint criterion necessary |
| 2.7 | w=0,2; χ₂(u)=ζ₃ | Exponents (−1,−1,−2,−2),(−2,−2,−3,−3); χ₂⁻¹=ζ₃²≠ζ₃ | Double inverse correction; actual occurrence needed |
| 2.8 | dimW=1,2; E[t]/t²; unipotent extension | Dimensions4,8; quotient and socle dimensions1,1; (g−1)²=0≠g−1 | Full annihilation/image hypothesis retained |
| 3.1 | p=5,m=3; ramified ϖ²=2; scalar shift | Required exponent25; (1+ϖ)²−1=ϖ²(1+ϖ); (4+t)−(2+t)=2 | Ramified coefficients allowed |
| 3.1a | μₚ⊕I₁₁⊕Z/p; p=5; square-zero base; node | Primary0, secondary unit; exponent24; ε map nonzero but fiber0; xy=0 | Reducedness and component nonvanishing retained |
| 3.2 | full algebra k×k selected first line; zero; nonintertwiner | Ann=0×k versus0 full; Ann(0)=T; eigenvalues0,1 obstruct relation | R08: selected-image annihilator is 0, preimage kernel is 0×k |
| 3.3 | paired roots1,2,3,6; F₇ roots1,2,3,4; zero ring | Multiplier6, det36; pair products(4,6),(3,1),(2,5), no match; SpecMax0 empty | R02 import reconstruction |
| 3.4 | (a,b)=(4,3),(4,2); unequal p-actions | Exponents0,−1,−3,−4 with sum pairs−4; b=2 repeated0; extra operators0 versus1 | No p-polynomial inferred from away-p data |
| 4.1 | Legendre symbol at p=5, d=1,2,0; Q=(1,0,p); delta-series at pQ | X₂ values1,−1,0; cubes same; d=−4p, coefficients not all0 modp; U output at Q=1 | Formal signs/index condition agree |
| 4.2 | p=7, scalar k=6,8; vector (2,2),(4,2),(6,2) | Θh=0 but h≠0; 8·15=120=1 mod7; degrees−2,0,2; 6<6 false; con=−2=5 versus det·con=0 | R05: circular proof route |
| 4.3 | α=2,β=3,F₁₁; α-Jordan, zero Jordan | πβ on β-line=1; (U−α)²=1 here, at β=4 gives4; J²=0 with J≠0 | Projection distinguished from unnormalized power |
| 4.4 | nilpotent and invertible U on k²; c=6 mod11; c=1 | Stable images0,k²; c³−c=210=1 mod11; at1 value0 | Nondegeneracy excludes scalar X₂ kernel |
| 4.5 | detM=p; Q=(1,0,p); p=7, diag(1,1),diag(1,2) | Reduced covariance factor0; discriminants0,3,6; corresponding symbols0,−1,−1 versus determinant symbols0,1,1 | Singular-index coverage explicitly required |
| 4.6 | Fα,F₀; U-Jordan e₂ | T-components (α+β)Fα,(α+β)F₀; Ue₂−αe₂=e₁≠0 | Spectral reduction cannot be omitted |
| 4.7 | β=3 mod11; constant series; p=7 | 3⁻¹=4; constant d=0 no positive leading index; hF weight(8,8) | R11: cuspidality and exact weight do not supply tame neighbor reciprocity |
| 4.8 | α,β=2,3; O/ϖ² kernel vectorϖ; zero projector | Distinct labels2≠3; vector reduction0 but torsion-layer coefficient1; projected inclusion0 | Both actual composite injections needed |
| 5.1 | e₁,e₂ and e₁,e₁; p=7,a=4 | Minors1,0; inertia multiplier exponent−3 with generator3 gives3^(−3)=6≠1 | Direct summand/isotropy separation correct |
| 5.2 | Q empty/singleton; scalar inertiaχ | SourceRmin/RQ; paired productsχχ⁻¹=1; unramified plane rank2 versus1 | Fixed multiplier and both lines retained |
| 6.1 | F₁₁ roots(2,3,4,6); desired and three other block products | Paired products1,1; desired6; rejected8,7,2; R(6)=8, R(8)=R(7)=R(2)=0 | R07: replace the three nondiscriminating Checks |
| 6.2 | GL₂ q=11,p=5,δ²=−43; Klingen x=1 mod7; Q empty | Degree-normalized composite=1/2−5δ/516=3 mod5; v=6−5δ/43=1 mod5; 4·2=1 mod7; v_empty=1 | Correct inverse, all denominators units |
| 6.3 | k×k multiplier(1,0); node; Hasse exact sequence | Kernel0×k; xy=0; low H¹=coker(H⁰→H⁰_D) when high H¹=0 | Component nonvanishing and H¹ comparison necessary |
| 6.4 | m=2,1,0; Q empty | Lengths1+1=2; residual length1; m0 length0; all empty-Q maps1 | Correct coefficient induction and direction |
| 7.1 | a=4; Δ=1; dual of E/O | L=ω(1,−1); Sym² dual⊗det³ givesω(4,2); S=O; Hom(E/O,O)=0 versus Hom(E/O,E/O)=O | Integral duality bound retained |
| 7.2 | H¹=E/O versus k; a=2,4 | ϖ surjective versus zero; dualO torsionfree versus k killed byϖ; 2≥4 false,4≥4 true | No automatic scalar H² vanishing |
| 7.3 | S=O[Cp], k, S⊕k; (p,a)=(7,4),(7,5) | Defects1,−1,0; Tor₁(k,k) dim2; bounds5>4 true,5>5 false | Whole balance and range distinction correct |
| 7.4 | projections S⊕k onto k,S,0 | Defects−1,1,0 and ranks0,1,0 | Whole balance insufficient; declared rank gap accepted |
| 8.1 | qTW=1; χ near1 at oddp; trivial augmentation | Number formal variables0; χ⁻²=1 impliesχ=1 near1; paired products1 | qTW≥1 prevents negative variable count |
| 8.2 | T¹,T⁰; O[ε]/ε²→O; Q empty | Annihilators0,T; kernel(ε) nonzero; q remains in level | Positive freeness supplies injectivity |
| 8.3 | (p,a)=(7,4),(5,4),(7,2); λ=3 mod7; p=3 | Rangestrue,false,false; λ²=2; all F₃-unit squares1 | R09–R10: surjective p7 datum impossible; q=ε̄(Frob)⁻¹ |
| 8.4 | six-point model; cycles(12),(123); quadratic twist | Cardinality16, group720; fixed counts8,4; geometric twist ratio1 implies diagonal image | R01 existing owner |
| 8.5 | a=4,ℓ=3; ordinary semistable slopes | HT0,0,3,3; multiplier27,det729; slope gaps0 or3 so no gap1, N=0 | Classical point needs actual local hypotheses |
| 9.1 | p=5,7; ε̄ ratio at p=5 | p5 needs neat; p7 alternative; ε̄(generator)=2, inverse3≠2 | Flag orientation cannot be identified naively |
| 9.2 | Λ=O[[w₁,w₂]], M=Λᵈ; Λ/ϖ; κ=(2,2) | SpecializationOᵈ; nonzero module killed byϖ not flat; exponents0,0,−1,−1 versus0,0,1,1 | Family/control and sign gap retained |
| 9.3 | κ=(4,2),(2,2),(1,1) | Lists(0,0,−3,−3),(0,0,−1,−1),(0,1,0,1); t andt+ϖ same modϖ | No universal classicality claim |
| 9.4 | k′=2,3; Λ′ | Lists(0,0,−1,−1),(0,−1,−2,−3); middle exponents difference−1 versus+1; weight variables1 versus2 | Separate flag/sign contract needed |
| 10.1 | p2,r7 andr5; ramified lift with trivial residual inertia | 7=3 mod4 passes,5=1 fails; both1 mod2; 1+ϖ unipotent reduces1 but nontrivial | Actual lift unramifiedness retained |
| 10.2 | one depthN prime; p2,N1; χ(u)=ζ₃ | Δ sizep^(2N)=4; four chambers; inverse characterζ₃²≠ζ₃ | Two diamond directions and involution retained |
| 10.3 | rankd over Λ[C₂²]; d0; p2 | Λ-rank4d; zero rank0; v₂(8)=3 | No averaging or positive rank inference |
| 10.4 | zero module; scalar multipliers±1; action-kernel relation | End0=0; multiplier squares1,1; images of equivalent generators equal | No injectivity of abstract Hecke algebra assumed |
| 10.5 | zero ring target; two actual eigensystems; diamondζ₃ | Unique mapR→0; common kernel intersection; ζ₃≠ζ₃⁻¹ | Zero case separated from residual representation |
| 10.6 | regular and trivial F₂[C₂] modules; Δ1 | Norm[1]=1+g≠0; trivial norm=0, invariants dim1; normidentity | Projectivity retained |
| 10.7 | (1+t)^(pᴺ)−1; rank0; E[[x]]→E[[x]]/(x²) | Linear coefficientpᴺ≠0; rank0; relative differentials0 but kernel(x²) | Open cutoffs and completed-ring comparisons retained |
| 11.1 | R3 at(−4,−1),(0,3),(−1,−4); R0 at(0,0) | Gaps(3,3),(3,−5),(−3,9); R0 gaps(0,1), rejected positivity | Ordered two-wall predicate correct |
| 11.2 | residual t versus t+ϖ; seed at node; omitted A4 | Same reduction; origin lies on2 components instead of1; conjunction without A4 false | Seed conditions kept separately |
| 11.3 | E=Q₇, E′=E(√3); zero fiber; local lines | 3 nonsquare, degree2; fiber dim_E′1 versus dim_E2; zero dim0; tensor local lines dim1 | Residue-field correction correct |
| 11.4 | p3 tame q7,19; E×E moduleE×0; dual numbers | q7=7 mod9 rejected,q19=1 accepted; supportfirst, fibersecond0; ann_E[ε]E=(ε) | Same-component support essential |
| 11.5 | four rank1 E′ fibers, [E′:E]=2; rank0 | Individual dim_E′1, total4; individual dim_E2,total8; rank0 fibers0 | Each chamber rank retained |
| 11.6 | four graded dims1; isotypy4n; repeated Sen block | Sum4, n1; nonzero nilpotent rank1 versus de Rham rank0 | Classicality retains independent Sen input |


| Additional statement or Check | Context and instances | Computed values | Result/change |
| --- | --- | --- | --- |
| Descent contract, three Checks | Standard Sp₄(F₂), trivial action, C=I+ηE₁₄ | Generated matrix dimensions16 versus1; CᵀJC=J+η(E₄₁J+JE₁₄)=J; C⁻¹=I−ηE₁₄ | All three controls agree; arbitrary residue characteristic remains a declared gap |
| Dyadic support contract, six Checks | n4,d1 versus n2,d1; u=(1,3); p2,n2,d2,T3,q5; p3 tame7,19; node; ψ inertia | nd mod4=0 versus2; weight1/3; χ=−5,h³=1,h²=1,h¹=5 (not6); trace I₂=0; residues7,1 mod9; node2 components; ψ−1≠0 in E but0 in k | Correction to BCGP25 cohomology omission verified |
| 0.3 split-plane test | C=I+η(E₁₂−E₃₄) | Plane restriction [[1,η],[0,1]], off-diagonal η≠0; CᵀJC=J | Flag alone fails split-plane requirement |
| 0.4 local groups and ratio test | Empty Q; U₁ versus U₂; q=2 mod7, eigenvalues1,2,3,6 | Empty Δ order1; U₁ monodromy rank1 versus U₂ rank2; root ratio2/1=2 rejected though2≠1 | Local-type and root-ratio boundaries retained |
| 1.1 central term and image relation | p5,b2; Sp=1, Tp,2=0; Q empty; generators A=B | Qp,2=130 versus0, congruent0 mod5; empty diamond order1; image(A−B)=0 | Integral identity distinguished before reduction |
| 1.1 mod-p central/Fourier contribution | Weight2,2, discriminant1, coefficient1 | X₂ coefficient1, so (Z₂+X₂)−Z₂=1 | Reduced operator cannot drop X₂ |
| 3.1 insufficient p-action comparison | Hasse shift t, two models on k with same away-p action, p-action0 versus1 | Weight difference2 in both; p-operator difference1 | Away-p congruence alone insufficient |
| 4.2 scalar/vector linearity | p7, det1/0, con input v/2v/0 | Scalar outputs1/0; vector outputs5/3/0 and2·5=3 | All seven theta Checks covered |
| 4.3–4.4 envelope | Ue₁=e₂, Ue₂=e₁; M=ke₁ | U(M)=ke₂≠M, stable envelope dimension2 | Iteration on M alone undefined |
| 6.3 normality/component controls | k×k, multipliers(1,0),(1,1); node xy=0 | Kernels0×k and0; x·y=0 with y≠0 | Normal disconnectedness and reducedness alone insufficient |
| 7.1 extension convention | Subcanonical inclusion O(−D)→O for nonempty D | Quotient O_D≠0; no unconditional identification of global cohomology | Boundary localization remains needed |
| 8.1 multiplier normalization | Inertia diag(1,1,u,u), u≠1; χ with χ²=u⁻¹ | Untwisted ν=u≠1; after scalar twist ν=χ²u=1 | Fixed-multiplier comparison retained |
| 8.3 surjectivity and convention | p7,a4 and p11,a4,λ2,q5 | ν-image at7={1,6} excludes3²=2; at11,5³=4=2²,ε̄(Frob)=9≠5 | R09–R10 |
| 9.1 distinct image predicates | Trivial quotient C_p; adjoint invariants of a scalar action | Has order-p quotient1; scalar action fixes all16 endomorphisms | No-order-p-quotient and H⁰-dimension requirements are different tests |
| 10.1 residual versus integral condition | Integral diagonal(1+ϖ,1,1,1), trivial reduction | Reduction I₄; characteristic-zero eigenvalue differenceϖ≠0 | A residual-image assertion cannot establish the integral enormousness condition |
| 10.2 partial central condition | Two weight characters sharing one central restriction; χ(u)=ζ₃ | Same restricted value1, distinct full valuesζ₃ andζ₃² | Partial central specialization cannot be replaced by full-center eigenspaces |
| 11.3 rational and nonrational fibers | A=Q₇[t], M=A, point t²−3; split over L | dim over E′=1, over Q₇=2; one local line tensor product1, two refinements2 | All four multiplicity Checks agree |
| 11.4 closed support | E[x], polynomial vanishing at infinitely many E-points; A=E[η]/η²,M=E | Nonzero degree d polynomial has ≤d roots, hence polynomial0; ann(M)=(η)≠0 although support full | Closed support does not imply ring faithfulness |
| Layer 0 example | p11,a4,α2,β3 | Four-factor product7,4<10,ν(c)=−1 | Numerical datum only |
| Layer 1 example | T=diag(5,0),Q=diag(6,0),A=diag(7,9) | Selector diag(1,0); selected A=7 | Actual geometric occurrence still required |
| Layer 2 example | Spin HT0,0,1,1; dual and ε⁻³ twist | HT3,3,2,2; multiplier ε·ε⁻⁶=ε⁻⁵ | Dual/twist conventions agree |
| Layer 3 example | p7,m2,s7t₀; full acting algebra k×k | Shift42rt₀, difference2; quotient (k×k)/(0×k)=k | Distinguish acting algebra from selected image (R08) |
| Layer 4 example | p11,α2,β3,j4 | 3θF=0,3·4=1, hence θF=0 and injectivity F=0 | Conditional on geometric theta and all-index identity |
| Layer 5 example | Residual e₁,e₂ versus e₁,e₁ | Minor1 versus0; ranks2 versus1 | Nakayama control agrees |
| Layer 6 example | x=1 mod7, m2 | Cover degree4, selected coefficient2, product1; lengths1+1=2 | Trace normalization agrees |
| Layer 7 example | O[C₅], S⊕k | Defects1−1=0; selected k defect−1; Tor₁(k,k) dim2, Tor₁(k,O) dim1 | No descent of balance to arbitrary summands |
| Layer 8 example | p7,a4,ℓ3 | HT0,0,3,3; ν27,det729 | Valid without surjectivity claim |
| Layer 9 example | w₁,w₂↦w, k′3 | Weight variable count2→1; exponents0,−1,−2,−3; ratioε versusε⁻¹ | Flag/sign gap necessary |
| Layer 10 example | p2,N1,Δ=C₂² | Order4, ranks4d→d; d0 remains0 | Projective norm and support separated |
| Layer 11 example | R3,weights−4,−1,four chambers | Gaps3,3; graded dimensions1+1+1+1=4=4n⇒n1 | Independent Sen hypothesis retained |
| Nonabelian norm control | F₂[S₃] and trivial F₂[S₃]-module | Regular norm [1]↦sum of6 distinct basis elements≠0, both dimensions1; trivial norm6=0 | Projectivity, not commutativity or division by order, is decisive |
| Domain exclusions | Rank0/1; zero coefficient ring; p2/3 in CG; q1 as a prime; inseparable p-adic extension | 0,1≠4; 1=0 prevents a residue field/CharZero embedding; 2,3<5; 1 not prime; char0 inseparable degree1 | Not admissible instances; no theorem silently extends to them |
| General norm/dual boundary | Empty group, zero module, field instead of O | Norm=identity, zero dual0; for a field E the fraction quotient E/E=0 | Field cannot replace mixed-characteristic DVR in the coherent dual/defect claims |

| 4.7 tame reciprocity | Γ(5), p7, Q=7x²+y², P=x²+7y², M=[[2,5],[35,91]] | detM7; next form1208x²−930xy+179y²; all discriminants−28; modulo5: (2,0,1)→(1,0,2)→(3,0,4) | R11: forward relation is not symmetric |
| Later theta normalization | d2 over F11; normalized versus elementary contraction | 1/3=4, −2=9, factor−6=5 and5·4=9 | Record this unit adapter when the later design imports the earlier theta owner |
| Source geometric nonisogeny control | K=Q(i), non-CM E₀/Q, twist d=1+i | d/dᶜ=i is not a square in K; twists nonisogenous over K but isomorphic over Kbar | CG20 Remark4.12 needs geometric nonisogeny |
| Source p-rank dimensions | Genus2 ordinary rank2; rank1 | Ordinary locus dimension3 versus printed3−2=1; rank1 lies in both inclusive strata | P20 §6.4 misprints do not propagate into target |


## Not verifiable

- No Lean elaboration or build was run, as required by the read-only brief. There are zero own declarations, so the requested elaborated-signature comparison has an empty domain; no prior worker's build is presented as a new test.
- The 20 declared supplier extensions remain contracts, not implemented theorems. This review checks their placement, names, scope and concrete boundary cases; it does not certify the eventual all-p deformation, image, geometric p-action or selected-rank proofs. Apart from R03, their absence is not reported as a defect.
- The theorem proofs still requiring new work include theta extension/injectivity, the all-index contraction, the corrected tame scalar recurrence and the selected coherent rank comparison. The source issues below explain why simply citing the printed proof is insufficient. No counterexample to the final modularity theorem itself was established.
- The P12 flag/exponent comparison between the cited 2009 author version and its eventual deformation interface remains explicitly unresolved. No claim is made about corrections in the 2012 journal version. Likewise, no published correction of the source issues below was verified.
- Ownership against open pull requests without supplied readable files was not checked individually. The indexed object search was used for leads; the 55 supplied sibling folders and the named supplier copies were actually read/searched as recorded above.
- The independent comparison of Pilloni–Stroh modified integral lattices with a CG torsion lattice is not certified. The characteristic-zero theorem does not supply it, and the README correctly does not use it to replace the separate CG torsion argument.
- No required source was inaccessible. There is no new missing-reference request. Source texts were read from the supplied legal cache or fetched through the sources service; no source text was copied into this report.

## Source issues

- **Error** in CG20 at Remark 4.12, printed pages 819–820 (CG20 line 818): the source says nonisogeny over K suffices for independent conjugate elliptic-curve images; it should be nonisogeny over the algebraic closure, excluding geometrically identical quadratic twists; affects a stated result.
- **Gap** in CG20 at Definition 6.15, printed page 844 (CG20 line 1762): the source says existence of a form satisfying the two eigen-equations witnesses Katz modularity; it should be existence of a nonzero such form, since zero satisfies every eigen-equation; affects a stated result.
- **Error** in CG20 at §6.4, printed page 845 (CG20 line 1777): the source says the factorial limit of the product of the two root differences selects their joint root; it should be the product of the two complementary unit-factor projectors; affects a stated result.
- **Misprint** in CG20 at the projector definition before Theorem 7.3, printed page 847 (CG20 line 1854): the source says to take factorial powers of an undefined primed polynomial; it should be the just-defined polynomial R_x; affects nothing.
- **Error** in CG20 at Theorem 7.3, printed pages 847–848 (CG20 line 1864): the source says the covering-degree-normalized trace inverts selected pullback; it should be the trace normalized by tr∘pr_Q∘i on the spherical module; affects a stated result.
- **Misprint** in CG20 at Theorem 7.11, printed page 853 (CG20 line 2058): the source says its earlier bound is p−2>a; it should be the section's bound p>a−2 used by the integral symmetric-power duality; affects a stated result.
- **Error** in CG20 at §8.1, printed page 856 (CG20 line 2207): the source says q-expansions lie in a power-series ring with a globally bounded negative middle exponent; it should be the completed semidefinite-cone coefficient module, permitting unbounded negative middle exponents as the outer degrees grow; affects a stated result.
- **Misprint** in CG20 at §8.2, printed page 856 (CG20 line 2214): the source says every ℤ_p-module is a ℤ[1/L]-algebra; it should be a ℤ[1/L]-module, since E/O need not be a unital algebra; affects nothing.
- **Misprint** in CG20 at Proposition 8.9(2), printed page 861 (CG20 line 2417): the source says vector theta includes an extra determinant factor; it should be the contraction alone, which can be nonzero at a rank-one index; affects a stated result.
- **Gap** in CG20 at Proposition 8.9 and its proof, printed page 861 (CG20 line 2405): the source says the cited theta construction works over arbitrary O/ϖᵐ; it should be restricted to characteristic p unless a separate integral lifting construction is proved; affects a stated result.
- **Error** in CG20 at Theorem 8.10, printed pages 861–862 (CG20 line 2425): the source says scalar theta is injective throughout the displayed arithmetic range; it should be restricted away from k=p−1, where the nonzero Hasse invariant has theta zero; affects a stated result.
- **Error** in CG20 at Lemma 8.20, printed page 872 (CG20 line 2793): the source says the same forward neighbor relation is symmetric at the given congruence level; it should be reciprocity with the reverse double coset, with tame-level transport before identifying the two; affects the proof.
- **Gap** in CG20 at Proposition 8.25, printed page 876 (CG20 line 2940): the source says vanishing of the selected Fourier coefficient gives vanishing of the theta series; it should be an all-index argument, including discriminants divisible by p; affects the proof.
- **Error** in CG20 at proof of Theorem 9.1(a), printed page 879 (CG20 line 3063): the source says auxiliary inertia has shape diag(1,1,u,u) in the fixed-multiplier problem; it should be twisted to multiplier one, retaining the induced invertible change of diamond character; affects the proof.
- **Gap** in CG20 at proof of Theorem 9.1(c), printed page 880 (CG20 line 3076): the source says whole-module balance supplies balance of the selected summand; it should be a rank/defect comparison compatible with that selected integral projector; affects the proof.
- **Misprint** in P20 at §6.4, printed page 35 (P20 line 1532): the source says the rank-at-most and rank-at-least strata use strict inequalities and the rank-r closure has dimension 3−r; it should be inclusive inequalities and dimension r+1; affects a stated result.
- **Misprint** in BCGP25 at Lemma 4.12.1(2), printed page 112 (BCGP25 line 5027): the source says the third and fourth smooth characters have a duplicated inverse; it should be one inverse, as required by the dual-spin twist; affects a stated result.
- **Error** in BCGP25 at §5.4, printed page 123 (BCGP25 line 5569): the source says Thorne's deformation complex has no cohomology outside degrees one and two; it should be h³=h⁰(ad r̄(1))=1 in degree three in the dyadic absolutely irreducible case; affects a stated result.
- **Error** in BCGP25 at §7.2 before Lemma 7.2.2, printed page 162 (BCGP25 line 7391): the source says diamond kernels eventually lie in each augmentation-ideal power; it should be a cofinal system of open cutoffs including coefficient and weight control, since (1+t)^(pᴺ)−1 has nonzero linear coefficient; affects the proof.
- **Gap** in BCGP25 at proof of Proposition 7.2.3, printed pages 162–163 (BCGP25 line 7446): the source says cotangent vanishing immediately gives the asserted completed-ring surjection and lift; it should be justified using completeness, marked coefficient sections, image comparisons and finiteness before that deduction; affects the proof.
- **Error** in Yam14 at §3.2 before Proposition 3.9, printed page 21 (Yam14 line 1157): the source says coordinate partial derivatives are R-valued derivations on a square-zero power-series quotient; it should be a connection calculation on a smooth formal base before truncation, since D(t²)=2t≠0; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d92325627a10e34464f35b2b86246e6105df9c99", "job": "RT-GSp4NonregularModularityLifting~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
