<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1225#issuecomment-6399065660 -->
Review (codex) of 301ff44

Verdict: needs_changes

1. **F01** (P2) The vexing selector drops its supplier's conductor hypothesis

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:710`, also lines 714, 719, 870 and 874: “The coefficient datum is the imported CDT minimal-type lattice”. The exact supplier paragraph at line 187 itself mentions the conductor equality.

   **Claim:** Sections 5.1 and 6.3 apply the imported selector to every vexing prime. However, GL2AutomorphicRepresentationsAndTransfer R16.2.11 and R16.3.9 require a(θ/θ^σ)=a(θ). The package assumes no twist-minimality at an irreducible decomposition group. Its invariant-line condition applies only to reducible decomposition groups and does not imply that equality.

   **Witness:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:769,963`: x=5, p=3, θ=θ₀(λ∘Norm), ord(θ₀)=8, a(λ)=2 gives a(θ)=2, a(θ/θ^σ)=1. The excluded selector has Hom dimension (16−20+4)/24=0, not 1.

   **Exact repair:** Preserve all vexing primes. Extend the earlier type supplier, through a precisely declared gap, to norm twists of its conductor-minimal character types, with stable integral lattices, the actual compact quotient, the contragredient convention and the minimal-inertia multiplicity-one assertion. Cite that extension in §§5.1 and 6.3 and their dependencies. A suitable construction in this witness is inflation of the depth-zero Θ(θ₀), twisted by λ∘det, to GL₂(Z/25). More generally the carrier must account for both the conductor of the minimal type and the determinant twist; do not silently apply the old formula at half the original conductor. Do not fix this by excluding the example or restricting the two Lean headlines.

   **Repair test:** In the witness, a(Ind θ)=4 and the residual local representation remains irreducible with reducible inertia, with 5≡−1 mod 3. Reduction preserves the order-five and order-eight characters. The corrected type and Π₀⊗(λ∘det) untwist to Θ(θ₀) and Π₀, so their Hom has dimension 1; the incorrectly extended even-conductor construction has dimension 0. Add this as a discriminating Check and retain the conductor-equality branch as its existing special case.

2. **F02** (P2) The unrestricted scalar contract does not request the global type-three result it consumes

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:952`: “the type-three assertion for its matched global quotient is part of the scalar comparison contract”. Compare the actual contract sentences at lines 165 and 205 and their matching `design/plan.json` gap entries.

   **Claim:** The variable-determinant gap requests a local family and matching types. The global comparison gap requests a finite presentation and a generic-fibre comparison. Neither `needs` sentence requests the integral Cohen–Macaulay type-three statement for the matched variable-determinant global quotient. The first gap's explanatory `detail` discusses this missing theorem, but its intake-facing `needs` does not assign that global result to the global supplier. LocalGaloisDeformationRings §6.18 proves the local ring at p has type three; it does not prove the new global family has type three. GL2ModularityLifting §4.2 requires the specified local Cohen–Macaulay factors and numerical relation bound.

   **Witness:** A=O·(1,1,1,1)+πO⁴ and B=O[t]/∏_{i=0}³(t−iπ) are finite flat local orders with generic fibre K⁴. Their special fibres have length 4 and socle dimensions 3 and 1, respectively.

   **Exact repair:** Declare one precise global deliverable at GL2ModularityLifting, with the same slug and sentence in README and plan: for the variable-inertial-determinant conductor-at-most-one family at every specified norm-one ramified self-extension, prove that its matching ordinary eigenvalue-adorned global quotient is finite flat Cohen–Macaulay of type three, under the stated scalar residual and component-support hypotheses. State the required parameter-count/local-factor hypotheses or include their verification in that deliverable. Keep the local-family gap separate, and make §§7.2–7.5 explicitly conditional on the global deliverable. This can be a new single-deliverable gap; do not hide it inside “generic-fibre comparison”.

   **Repair test:** For A, writing x_i=πe_i gives A/πA≅k[x₁,x₂,x₃]/(x₁,x₂,x₃)², with socle basis x₁,x₂,x₃. For B, reduction gives k[t]/t⁴, with socle basis t³. Both are O-free of rank four and generically K⁴. Thus the repaired contract must distinguish type 3 from type 1 using integral information; finiteness and identical generic fibres cannot substitute for it. This finding concerns the precision of a declared contract, not the absence of its future proof.

3. **F03** (P2) Scalar ordinary-ring finiteness already has an earlier owner

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:205`: “Provide the finite global ordinary eigenvalue-adorned weight-two deformation presentation”; also the import of global finiteness at line 956.

   **Claim:** The finiteness part of `gap:scalar-conductor-comparison`, for the fixed-character scalar problem, asks for work already supplied by PotentialModularityAndCompatibleSystems §8.8. That earlier roadmap is absent from the package's supplier contracts and Needs lines. Its hypotheses are exactly the rational scalar, modular, away-p twist-minimal hypotheses of §7.1, including p=3 and the exceptional nonadequate cases. Conductor-compatible away-p quotients inherit finiteness from its unrestricted fixed-determinant ring.

   **Witness:** `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:1736`, head `29f6025`, states O-finiteness of R_φ and of its eigenvalue-adjoined version. If R_φ has m O-generators, a monic quadratic adjunction has at most 2m; every quotient remains O-finite.

   **Exact repair:** Cite PotentialModularityAndCompatibleSystems §8.8 directly in Scope, Exact supplier contracts, §7.2 Needs and Layer 7 Dependencies for this finiteness input. Narrow the gap's README and plan sentence to the missing conductor-specific presentation/component comparison and any genuinely new variable-determinant extension. Do not ask GL2ModularityLifting to re-plan that finiteness theorem, or introduce an upward dependency there on the later PotentialModularityAndCompatibleSystems roadmap.

   **Repair test:** Impose the norm−1 unipotent/Steinberg quotient on the supplied eigenvalue-adjoined ring. The images of its at most 2m generators still generate the quotient. This proves the exact fixed-character finiteness step used in §7.2, without claiming the generic Hecke comparison or the unrestricted variable-determinant type theorem. Those remain separate work.

4. **F04** (P2) The minimal Katz witness needs residual modularity first

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:265`: “The conductor-level Katz witness makes m_∅ proper”; the only witness supplier in §0.2 Needs is SerreWeightAndLevelOptimisation §3.13, at line 281. The same overclaim occurs in its contract at line 195.

   **Claim:** The package starts with an arbitrary continuous odd absolutely irreducible residual representation unramified at p. Its cited supplier produces a conductor-level weight-one witness only for an already modular residual representation. The ClassicalSerreModularity contract at line 121 imports arithmetic interfaces, not its qualitative modularity theorem. Thus the route to the proper residual ideal, and hence the unconditional rational headlines, omits a theorem input.

   **Witness:** `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md:907` requires an actual Katz eigenform or an already modular residual representation. `TauCetiRoadmap/ClassicalSerreModularity/README.md:845` supplies qualitative modularity, but §0.2 does not consume it.

   **Exact repair:** Import ClassicalSerreModularity `R27.5/hypothesis-H-and-theorem-9-1` by name in the contract, §0.2 Needs and Layer 0 Dependencies. Apply it to the standing S-type residual representation, then apply SerreWeightAndLevelOptimisation §3.13 for conductor-level Katz weight one. Keep the Lean conclusions unconditional on a separately supplied modularity witness; adding such a hypothesis would weaken the requested headline.

   **Repair test:** The S₃ standard representation in characteristic 5 associated to the splitting field of X³−2 is absolutely irreducible and odd: a transposition has eigenvalues 1,−1 and determinant −1, while a 3-cycle's two eigenlines are exchanged. Its discriminant −108 is prime to 5. The new first step supplies modularity of this datum; the second supplies the weight-one conductor witness. The existing §3.13 alone starts only after that first step. The source likewise invokes Serre modularity explicitly at cg18 line 315.

5. **F05** (P3) The tensor determinant Check gives 4 instead of 1

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:847`: “tensoring the oldform pairing with a rank-two type … the determinant remains the unit 4”.

   **Claim:** The scalar 2×2 block determinant is 4, but the determinant of the actual rank-four tensor pairing is 1. Both are units, so the theorem is unaffected; the numerical Check is incorrect as written.

   **Witness:** Over F₅, A=[[2,3],[3,4]] has det A=8−9=4. The rank-two type gives A⊗I₂, with determinant (det A)²=16=1, not 4.

   **Exact repair:** Say explicitly that the 2×2 scalar block determinant is 4 and the full tensor determinant is 1; both certify invertibility. Keep the selected-root conclusion that one rank-two type copy survives. Recomputed on the displayed 4×4 matrix, the repaired values are 4 and 1.

6. **F06** (P3) The dependency-summary repair missed Layers 1 and 10

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:426,1334`, compared with Needs at lines 354 and 1294. The summaries say “Earlier internal targets are specified individually in the Needs lines”, but the omissions here are external suppliers.

   **Claim:** The F07 repair fixed its named Layers 4, 6 and 8, while the same pattern remains elsewhere. Layer 1 omits its `Matrix.charpoly` and `Matrix.aeval_self_charpoly` inputs. Layer 10 omits ArithmeticLocallySymmetricSpaces ALS.5b.5–ALS.5b.8, explicitly consumed by §10.4.

   **Witness:** Each omitted input occurs once in the respective target's Needs line and zero times in its layer's Dependencies paragraph. The characteristic-zero cuspidal comparison is at `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:4323,4518`.

   **Exact repair:** Add the two Matrix declarations to Layer 1 Dependencies and ALS.5b.5–ALS.5b.8 to Layer 10 Dependencies. Recompare each layer summary with its external target Needs after R01–R04 are applied. For these three inputs the comparison must change from (Needs=1, summary=0) to (1,1); no new mathematical ownership is required.

Six findings: four P2 blockers and two P3 corrections. The package is a repairable Part II extension. The declared supplier gaps are not rejected merely because their theorems remain unavailable. The blocking findings concern a dropped supplier hypothesis, an imprecise global type contract, existing ownership of part of a gap, and a missing modularity input.

## Verified sound

### Prior-review dispositions

The prior review has eleven distinct findings F01–F11; its R01–R05 summary repeats F01–F05. The repair report marks none “not actionable in this package”. I checked the repaired text first, then searched the rest of the package for the same patterns. Ten findings are repaired; F07 is partly repaired because of R06 above. The new scalar and type findings are not reversals of a settled non-actionability decision.

| Prior finding | Repaired passage and fresh check | Disposition |
|---|---|---|
| F01: re-planned inertia/Frobenius | README:29,37: “Mathlib's `Ideal.inertia` lies in the representation kernel”; “Arithmetic Frobenius uses Mathlib's `IsArithFrobAt`”. Native ideals and inertia replace the local valuation carrier; prime binders survive elaboration. | Repaired |
| F02: normalized-only headlines | README:57: “η = ψ gives ηρ = ρ₀ because ψ³ = 1”. Both Lean statements conclude about original ρ, with normalization on ηρ. Recomputed ψ·ψ²=1 and (detρ)²=ψ²≠1. | Repaired |
| F03: bare internal numbers in gap requests | README:175: “CG18 Propositions 3.3 and 5.2 auxiliary sets”; line 213 names “ArithmeticLocallySymmetricSpaces ALS.0.10(iv)”. The four requests now name their mathematical objects. The rigidifying-prime gap is removed by the stated Chebotarev argument. | Repaired; R02 is a different precision defect |
| F04: selected-root supplier assumes more Galois data | README:223: “assuming only the residual part (i) of B^gal, with no Hecke-valued lift from part (ii)”. §9.2 explicitly consumes this gap. | Repaired |
| F05: non-neat boundary imported from neat theorem | README:215: “at the non-neat projective levels Y₀(Q), Y_Δ(Q)”; separate `gap:non-neat-bianchi-boundary` names the extension. ALS.4.12(b)'s neatness and ♠ are retained at line 209. | Repaired |
| F06: p=3 accidentally loses Conjecture A | README:1227: “Assume Conjecture A for all Q_a, and either p ≥ 5, or p = 3 with hypothesis H₃(3)”. The all-level action is required in both branches. | Repaired |
| F07: dependency summaries drift | README:704,923 includes all three newform APIs; line 1139 includes ALS.0.10 and ALS.4.10. Layer 1's duplicate determinant citation is gone. The two remaining summaries have the independently verified omissions in R06. | Partly repaired |
| F08: full Lean names attached to special cases | README:667,684 calls each statement “the no-vexing case of” its Lean headline. §6.5 supplies the full typed, twist-general formulation. | Repaired |
| F09: two unnecessarily broad gaps | README:197 requests only “annihilation … by the Cayley–Hamilton ideal”; line 988 imports recognition separately. At line 241 the Chebotarev class has ratio 1 versus forbidden ratios 2,2 when p=3. | Repaired; R03 finds this ownership pattern in another gap |
| F10: unproved H₃ statement presented as available | README:211: “The p = 3 conclusions assume the named hypothesis H₃(3)”. This is a declared conditional supplier theorem, not an assertion that CG18 proves orbifold vanishing. | Repaired |
| F11: missing carriers and Lean form | Suggested.lean:24: “missing J₁(N*) with its Hecke action and the Galois action on its torsion”. The Layer 4 comment matches the README. Native modular symbols do not supply that action. | Repaired |

### Principles, shape and scope

Read all 54 numbered targets, every API, Check, proof route and Needs line, and all eleven layer Examples/Dependencies pairs. Each numbered target has at least three Checks. The seven native signature definitions each have their own API description and at least three Checks. The small-level, torsion, repeated-root, p=3 and variable-determinant cases remain visible. No route-specific “good primes only” replacement, computational algorithm, copied source passage, admitted data definition, `set_option`, or re-planning of the base GL2ModularityLifting roadmap was found. The scope explicitly starts where that roadmap's defect-zero work stops.

Read the upstream forms in `Completed/NumberFieldArithmetic/README.md` and `TauCetiRoadmap/ClassFieldTheory/README.md`. The required opening, Scope, Conventions, supplier contracts, build paragraph, ordered layers, downstream consumers and references are present. Metadata is `math.NT`. All eighteen README gap slugs, named suppliers and `needs` sentences equal the plan's corresponding entries; there is no supplier `none`. R02 and R03 identify precision/minimality defects despite that textual synchronization. The other sixteen contracts have identified single mathematical outputs and stated coefficient/level hypotheses; their future existence is not certified by this review.

The declared extensions remain conditional: H₃(3), non-neat integral boundary, principal-type coefficient descent and the unrestricted variable-determinant scalar comparison are not supplied by the cited CG18 proofs. This is not a finding about their future availability. R02 concerns the precise global conclusion the intake-facing contract must request.

### Sources and the seeded sample

Read both available legal cached works. All fifteen sampled targets were checked at the stated theorem/section and printed page, with the source hypotheses compared to the package. The following table separates support for a source theorem from additional conditional extensions. CG22 is the only settled uncertified work; it was not fetched again. No additional source was needed or added, and no source extraction was copied into the repository.

| Target | Locator opened | Result of text/hypothesis comparison |
|---|---|---|
| 0.3 Dual coherent homology | CG18 §3.2.4, p.322, cg18 lines 1029–1045; typed version lines 2224–2227 | Dual of cohomology with Ω¹⊗L∨; degrees become 1−i. The integral torsion convention is retained. |
| 1.2 Selected-root comparison | CG18 Lemma 3.5, pp.317–320, cg18 lines 856–970 | x≡1 mod p, distinct residual roots, chosen U-root and anaemic equivariance match. The package corrects the scalar normalization inside the proof. |
| 1.3 Harmless multiplicity | CG18 Lemma 3.6, pp.320–321, cg18 lines 974–1000 | Forbidden ratios x,x⁻¹ retained; a repeated root retains both copies rather than one. |
| 1.4 Coherent descent | CG18 Proposition 3.8 proof, pp.323–324, cg18 lines 1076–1103 | Correct homological Tor sequence and edge direction. Compactified conductor-level descent is separately declared, not inferred from arbitrary free étale descent. |
| 1.5 Balanced homology | CG18 Proposition 3.8, pp.323–325, cg18 lines 1065–1113 | Finite O-module, torsion-free degree-one term and equal generic ranks are used. The Tor correction is not dropped. |
| 3.2 Doubling ideal | CG18 Definition 3.25, p.338, cg18 lines 1679–1689 | Annihilator of the relative module agrees; it is not a quotient ring by a subring. |
| 3.3 Scalar comparison | CG18 Lemma 3.24, pp.337–338, cg18 lines 1662–1689 | Residual scalar normalization is essential. The c⁻¹Uₚ parameter matches the imported local equality. |
| 4.5 Finite image | CG18 Corollary 1.6, p.304, cg18 lines 326–329; Lemma 4.14, pp.366–368, lines 2823–2874 | CNL coefficients, finite residue field, unramified-at-p deformation problem and generic reducedness route match. Finite characteristic-zero points alone do not kill nilpotents. |
| 6.3 Typed Galois representations | CG18 Theorem 3.30 step (4), pp.353–354, cg18 lines 2286–2338; type setup lines 2182–2187 | Component transport and typed doubling match. The actual imported selector has the additional conductor hypothesis in R01; source citation alone cannot make the supplier broader. |
| 7.4 Scalar multiplicity | CG18 Theorem 4.8, pp.361–366, especially cg18 lines 2801–2805 | Corrected argument uses the interval 3≤d≤4 and residual isotypy, then evenness. The unrestricted integral type hypothesis needs the precise contract in R02. |
| 8.2 Bianchi levels and types | CG18 §§5.2–5.2.1, pp.371–373, cg18 lines 3020–3112 | Standard projective groups are imported. Corrected half-conductor/quadratic selectors and integral coefficient models are additional declared contracts, not conclusions certified by these source pages. |
| 8.3 Hecke data and ideals | CG18 Definitions 5.4–5.5, p.374, cg18 lines 3126–3145; Remark 5.7, pp.375–376, lines 3191–3197 | Anaemic/full images, proper residual factor and uniformizer ambiguity match. Multiplication by a diamond is retained before residual specialization. |
| 9.1 Diamond datum | CG18 §5.3.1, p.376, cg18 lines 3219–3234 | The p-power quotient, O[Δ]-coefficients and Shapiro comparison agree. Groupoid stabilizers remain part of the carrier. |
| 9.3 Amplitude and boundary | CG18 Lemma 5.9, pp.376–377, cg18 lines 3235–3267 | The source's p=3 top-degree proof is insufficient at non-neat groupoid levels. H₃(3) and non-neat boundary are now separate declared contracts; rational duality retains invertibility of the neat-cover index. |
| 10.5 Semistable Bianchi lifting | CG18 Theorem 1.2, p.301, cg18 lines 192–204; Theorem 1.3, p.302, lines 225–246; §5.4, pp.378–380, lines 3311–3376 | All-level Conjecture A, residual modularity at the minimal level, cyclotomic absolute irreducibility, finite-flat precedence and minimality are retained. The p=3 conclusion additionally states H₃(3). |

Also opened CG20 Lemma 8.14, author pp.65–66, cg20 lines 2540–2600: injectivity concerns the Hasse-image summand followed by either distinct ordinary projection, not the entire doubled space. Its two nonzero distinct roots and finite-coefficient socle argument match §2.2. The supplied text is the advance-publication version; its printed page numbering is 65–66. The README gives this author locator as well as the later published locator.

### Supplier order, ownership and citations

The dependency check was run with the supplied configuration, package name, order and `--movable`. Exact output:

```text
depcheck: 52 roadmaps, 595 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. I read all 54 Needs lines separately; a clean mechanical graph does not detect the missing hypotheses and ownership defects above. PotentialModularityAndCompatibleSystems occurs before this package, so the direct import proposed in R03 is permitted. It occurs after GL2ModularityLifting, which is why routing the import through that supplier would be wrong.

The current content checkout is main `e98875dbbea872d0496e323bc880e2b7fd00beb9`. The supplied older citation report is only a lead; the following citations were resolved again using `roadmaps show`, `roadmaps grep`, the main checkout and the board index. Open revisions of existing main roadmaps were not used as suppliers. Each open-head supplier below is a new roadmap.

| Supplier and copy | Sections/objects opened and resolved | Scope of the supplied result |
|---|---|---|
| ClassicalSerreModularity, `6c79d1c` | Arithmetic interfaces, README:131; Suggested.lean's GQ, IntBar, IsFrobAt, IsUnramifiedAt; R27.5 at README:845 | Native arithmetic places and qualitative modularity are separate inputs. R04 adds the latter. |
| DeformationAndDerivedPatchingAlgebra, `a3b5dea` | §§3.1, 3.4–3.5, 3.9; §§5.1–5.5, notably README:1019,1086 | Balanced square presentations, rank-minus-Tor defect, q−1-variable patching, regular parameter and canonical-module type arguments. H=0 does not supply faithfulness. |
| AlgebraicModularFormsAndSerreWeights, `4e550b1` | R15.1–R15.3; Eisenstein boundary at README:673; twisted duality at README:980; torsion weight-one Tₚ/Hasse block | Katz, Hodge/cusp geometry, normalized correspondences, full boundary and typed duality remain here. Conductor rigidification and integral bad-prime extensions remain the declared gaps. |
| IntegralHeckeAndGaloisDeterminants, `1383569` | §§1.3, 1.6 at README:2595, 2.1–2.2 | Split residually absolutely irreducible reconstruction and isotypy require the Cayley–Hamilton annihilation; represented images allow torsion and do not assume nonflat base change of images. |
| ModularCurvesPartII, `35be0c8` | §17.2, README:4614 | Arithmetic-Frobenius Eichler–Shimura with ℓ⟨ℓ⟩, on the actual Jacobian and appropriate torsion. It does not itself prove the requested full-ideal annihilation. |
| LocalGaloisDeformationRings, `11b2c65` | §§2.1–2.5, 2.19 at README:2072; §4.1; §§6.7, 6.18 at README:3469; §7.5 at README:3952 | Fixed determinant away-p rings, flat conditions, scalar ordinary local ring and local doubling equality. The new variable-determinant global type is not among these conclusions. |
| GlobalGaloisDeformations, `b0adf32` | §§3.3–3.7, 5.1–5.8, 6.2–6.8 and Layer R04.6 | Representability, local-to-global presentation and image maps exist. The exact defect-one numerical and small-image auxiliary-set specializations remain named gaps; no adequacy condition is silently added. |
| AutomorphicGaloisRepresentations, `81e9d0f` | §§2.8–2.10, 3.7, 4.1–4.6, 5.1, 6.8–6.12 | Weight-one Artin and high-weight attachments, ordinary lattice and quotient characters, conductor/local compatibility. The finite Hasse whole-image extension remains a separate gap. |
| GL2AutomorphicRepresentationsAndTransfer, `69bcab7` | R16.2.7, R16.2.11, R16.3.9, R16.4, R16.6.5–R16.6.6 | Newvectors, conductor-qualified CDT types, contragredients, and classical dictionaries. The exact failing conductor qualification is R01. Finite-level dimension is retained rather than replaced by global multiplicity one. |
| SerreWeightAndLevelOptimisation, `c9bed25` | §§3.4, 3.10–3.13, especially README:905–907 | Field-valued weight-one unramifiedness; Gross sequence; known multiplicities; conditional minimal Katz witness. R04 records its modularity prerequisite. |
| GL2ModularityLifting, `1e734ab` | §§3.7, 4.1–4.2, especially README:1089 | Generic support and integral comparison with exact dimension/presentation hypotheses. It neither supplies the undeclared variable-family type theorem nor becomes the owner of PMCS's finiteness specialization. |
| ArithmeticLocallySymmetricSpaces, `7dca7ea` | ALS.0–ALS.1, ALS.0.8, ALS.0.10 at README:1438; ALS.2–ALS.4, ALS.3.14, ALS.4.10 at README:3655, ALS.4.12(b); ALS.5a.2–ALS.5a.6; ALS.5b.5–ALS.5b.8; ALS.6.1–ALS.6.3 | Projective levels, groupoid coefficients, Hecke transport, support and finite-cover descent. Non-neat rational duality uses an invertible neat-cover index. The neat boundary theorem is not silently extended integrally. |
| AutomorphyLiftingBeyondTaylorWiles, readable board design | `packages/AutomorphyLiftingBeyondTaylorWiles/design/README.md`, BT.3/lemma-9-6 and B^gal(i),(ii) | Design states the comparison with both Galois clauses; this package correctly asks for the residual-only extension. No nonexistent pinned declaration is claimed. See the availability limit below. |
| ClassFieldTheory, main | Layers 7, 11–12 | Geometric reciprocity convention, global reciprocity and ray-class finiteness. Revisions in open pull requests were not substituted for main. |
| PotentialModularityAndCompatibleSystems, `29f6025` | §8.8, README:1734–1736 and its local-to-global finiteness proof | Existing fixed-character scalar ordinary-ring finiteness, including exceptional p=3 and p=5 images; R03 identifies duplicated supply. |

The three supplied resolver leads are resolved, not missing pinned APIs: `LocallySymmetric.IsEisensteinCG` is an ALS.4.10 planned declaration, while `TauCeti.SerreConjecture.IntBar` and `IsFrobAt` occur in ClassicalSerreModularity's readable interface/Suggested.lean. This acceptance test imports none of those future modules.

Object searches covered main and the open-head index through `roadmaps grep`, both pinned libraries, local board packages, and all nineteen heads in `board-packages-index.txt`. Where the indexed head had only a design README, I read that design at the same head instead of reporting the package absent. The index's four package READMEs and fifteen design READMEs were retrievable after resolving their exact paths. In particular ArithmeticLocallySymmetricSpacesPartII at `c1b8f80` develops characteristic-zero weight-growth and neat cusp bounds; its §§5.1–5.2 do not supply the integral non-neat boundary gap here. OrdinaryAutomorphicFormsAndModularityLiftingPartII at `7e88c38` develops the dyadic ordinary CM theory, not this rational unramified-at-p scalar finiteness theorem. Neither is a reason to reassign the defect-one applications.

The local scalar type-three ring, generic patching, geometric Frobenius interfaces, Hasse construction, isotypic recognition and newform uniqueness retain their earlier owners. The package owns arithmetic defect-one applications and their particular modules, rather than recreating those generic theories. Searching the fully qualified prefix `TauCetiRoadmap.GL2ModularityLiftingPartII` against main/open roadmaps found no existing declaration. R03 is the positive ownership collision; the current names introduce no duplicate fully qualified declaration.

### Pinned declarations opened

Pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are the pins used for elaboration and the following native-carrier checks.

| Pinned file and line | Declaration/content actually checked | Consequence and limit |
|---|---|---|
| `Mathlib/RingTheory/Ideal/Defs.lean:154` | `Ideal.inertia`, membership through differences g·x−x in I | No primality is built into the generic inertia definition; the headline explicitly quantifies over prime Q lying over (ℓ). |
| `Mathlib/RingTheory/Frobenius.lean:54,183,194,200` | `IsArithFrobAt`, stabilizer implication, `mul_inv_mem_inertia` | Exponent is cardinality of the base residue quotient, hence ℓ; arithmetic rather than inverse Frobenius. |
| `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:259` | Induced semiring action on integral closure | Native action on algebraic integers; no new arithmetic-place structure. |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | `absoluteGaloisGroup` as algebraic-closure automorphisms, Krull topology | The explicit carrier in Suggested.lean is this group, not an arbitrary topological group. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:54,87` | `scalar`, `scalar_commute` | Real scalar character twist is a homomorphism over a commutative ring. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | Native invariants are vectors fixed by every group element | The signature-only inertia intersection specializes this native object; it adds no unjustified base-change law. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132,214`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809` | `Matrix.charpoly`, `Matrix.aeval_self_charpoly`, `Matrix.det_fin_two` | General matrix algebra is imported; only the arithmetic correspondence matrix is a target. Empty rank has charpoly 1, but the headline matrices use Fin 2. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65` | `groupHomology.indIso` | Group homology of induced coefficients, with shared universes. It supplies neither Bianchi localization nor boundary vanishing. |
| `Mathlib/NumberTheory/ModularForms/Basic.lean:72,80` | `ModularForm`, `CuspForm` | Holomorphic complex forms with all-cusp conditions; no integral Katz coefficient carrier or attached Hecke/Galois data. |
| `TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115,120` | `TauCeti.MonoidAlgebra.augmentation`, `augmentation_single` | Sum of coefficients, [g]↦1; works for a monoid over a ring, not just an abelian group. |
| `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51,75` | Density and infinitude of `frobeniusPrimeSet` | Finite Galois extensions of number fields; nonempty conjugacy class has positive density. Disjointness with the cyclotomic field is proved in §0.1. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84,104` | Eigenform/Newform structures | Nonzero new cusp form and first coefficient 1; actual nonzero level and integer weight. |
| `TauCeti/NumberTheory/ModularForms/Eigenform.lean:65` | `IsEigenformAwayFromLevel` | Alone permits the zero form; the headline uses the stronger Newform carrier. |
| `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:96` | `Newform.eq_of_forall_prime_eigenvalue_eq` | Same level, weight and nebentypus, equality at all good primes; no unjustified differing-level uniqueness. |
| `TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.lean:315`; `TauCeti/NumberTheory/ModularForms/ModularSymbols/Hecke/Finite.lean:54` | Weight-(w+2) coinvariants and `heckeTAlgebra` | No Jacobian torsion Galois action or Jacobian comparison. They cannot state scalar-Frobenius multiplicity two. |

The object searches for Katz cohomology, arithmetic Bianchi homology, minimal deformation rings and Jacobian Hecke/Galois actions exposed no native replacement for the missing arithmetic carriers named in the docstring. The apparent Bianchi hits were differential-geometric curvature identities; Katz hits included bibliographic mentions of Katz–Mazur in elliptic-curve files. Those are not the needed carriers.

### Computed adversarial table

The scratch ledger has 75 computed rows covering every numbered target and the shared definitions/conventions. The report includes the seeded targets, headlines, repaired patterns and all finding witnesses. All arithmetic in the displayed finite rings was recomputed; determinant, finite-invariant and Kummer witnesses were also evaluated in a small independent scratch script. Conditional inputs remain conditional. The examples distinguish false substitutes; they are not claimed to prove deep arithmetic theorems.

| Statement | Instances | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Coefficients | O=Z₃; F₃[[t]]; zero ring | Characteristics 0 versus 3; residue cardinalities 3 versus 1 for zero ring | Characteristic-zero and field binders exclude the latter two | Retain |
| Arithmetic/geometric convention | Character value 2 in F₇ | Inverse 4; 2·4=1 | Correct direction | Retain |
| Native IsUnramifiedAt | Trivial inertia; diag(ζ₃,1); ℓ=1 | I₂ versus nonidentity; zero primes above unit ideal | Prime restriction prevents vacuous arithmetic conclusion | Retain |
| Native Frobenius | F₂₇, t³=t+1 | t³=t+1; t⁹=t+2; t²⁷=t | Distinguishes inverse convention | Retain |
| Native twist | diag(2,3), η=2 in F₇; η⁻¹=4 | diag(4,6), trace 3=2·5, determinant 3=2²·6; inverse gives diag(2,3) | Scalar and square laws hold | Retain |
| Native adic continuity | Field; O[e]/e² | m=0: discrete; (π,e)²=(π²,πe) | Nilpotent direction retained | Retain |
| Native absolute reducibility | Diagonal action; S₃ over F₅; trivial subgroup | One invariant coordinate line; zero common eigenlines for S₃; every line invariant for H=1 | Absolute closure and subgroup needed | Retain |
| Native inertia invariants | I; diag(u,1), u−1 unit; diag(4,1) over Z/9 | A²; Ae₂; 3Ae₁+Ae₂ has 27 elements versus 9 in free rank one | Fixed submodule, not residual dimension | Retain |
| Native residual predicate | p=3, c=diag(1,2); diagonal global action; p=2 | det c=2=−1; invariant line dimension 1; 3≤2 false | Oddness and irreducibility explicit | Retain |
| Native minimal predicate | k=F₃, determinant 4 in Z/9; vexing inertial kernel | 4²=7≠1 versus 1²=1; two distinct inertial lifts of same element violate injectivity | Genuine minimality retained | Retain |
| Twist-general headlines | Cubic ψ of conductor 7 at p=3; ρ=ρ₀ψ², η=ψ | (detρ)²=ψ²≠1, ηρ=ρ₀ψ³=ρ₀; finite image bound | Accepts full twist-general datum | Retain |
| Hasse socle convention | θV₃(q) over Z/9 and F₃ | 3q³≠0 versus 0 | Theta must be applied on socle | Retain |
| 0.1 Level datum | Q empty, Δ=1; Chebotarev (1,2), p=3 | Cover degree 1; residual ratio 1 versus r=r⁻¹=2; density 1/size(G)>0 | Repeated harmless roots allowed | Retain |
| 0.2 Hecke datum | j=1,x=2,n=1,d=3,a₂=4,a₀=1; Katz witness | Correct coefficient 4 versus unguarded 7; supplier requires residual modularity, absent from input | Missing qualitative Serre input | R04 |
| 0.3 Dual homology | Cohomological degrees 0,1; π-torsion length 1 | Dual homological degrees 1,0; torsion length stays 1 while generic dimension 0 | Shift and integral torsion retained | Retain |
| 0.4 Weight-one duality | n=2,x=2, eigenvalue 2; n=1 | Homological value 2⁻¹·2=1 versus 2; at n=1 factor 1 | Weight-one exception justified | Retain |
| 1.2 Selected root | x=1, roots 1,2 in F₅; repeated 1,1 | Pairing [[2,3],[3,4]], det=4=−(1−2)²; repeated determinant 0 | Distinct-root hypothesis essential | Retain |
| 1.3 Harmless multiplicity | x=2, roots 1,1 in F₅; ratio 2 | Pairing det=3; U−I=[[1,2],[2,4]] nonzero with square zero; forbidden ratio gives det=0 | Two old copies retained | Retain |
| 1.4 Coherent descent | Δ=1; C₃ on k=F₃ | Trivial-group Tor₁=0; C₃ resolution has g−1=0,N=3=0 on k, so Tor₁=k | Nonflat descent not replaced by ordinary invariants | Retain |
| 1.5 Balance | Δ=1,M=k; M=S^r; M=0 | Betti (1,1), defect 0; (r,0), defect r; (0,0), defect 0 | Matches rank-minus-Tor | Retain |
| 2.1 Hasse matrix | T=0,d=3; d=1 | Ue₂=(3,0) versus printed (1,0); U²=−3I; matrices equal at d=1 | Repaired source normalization | Retain |
| 2.2 Projection injectivity | F₅ roots 1,2 for U=[[3,2],[−1,0]] | Eigenvectors (4,1),(3,1); e₁=v₁+4v₂, both projections nonzero; full-double projection has rank-one kernel | Source claims only Hasse first column | Retain |
| 2.4 Quadratic doubling | Monic quadratic; repeated root over k | Basis 1,X gives rank 2; k[X]/(X−1)² length 2 versus reduced quotient length 1 | Quadratic algebra not reduced prematurely | Retain |
| 3.2 Doubling ideal | Relative module zero; B[X]/monic quadratic over B | Ann(0)=B; quotient by B is BX, Ann=0 | Unit-ideal extreme correct | Retain |
| 3.3 Scalar comparison | c=2,U=6 in F₇ | c⁻¹U=4·6=3 versus U=6; relative free summand ann=0 | Normalized eigenvalue essential | Retain |
| 3.4 Three Frobenius cases | diag(1,2), Jordan(1), I₂ | Traces 3,2,2; determinants 2,1,1; repeated eigenspace dimensions 1,2 | Exhaustion does not conflate scalar and Jordan | Retain |
| 4.1 TW datum | q=1; group C₃ | q−1=0, A∞=O; augmentation[g]=1 vs coefficient at identity 0 | No negative variable count | Retain |
| 4.2 R=T | R=T=k,H=k; H=0 | H rank 1 and ann=0; zero H has ann=R | Nonzero proper residual ideal needed | R04 applies upstream |
| 4.3 Torsion rank one | T=k[e]/e² | Length 2, dual m-eigenspace dimension 1; generic dimension 0 | Rank one not inferred from generic multiplicity | Retain |
| 4.4 Modularity | Frobenius diag(2,3); finite-order twist | Trace 5, determinant 6; η=2 gives trace 3, determinant 3 in F₇ | Native newform can state conclusion | R04 applies upstream |
| 4.5 Finite image | Finite torsion ideal size s; O[e]/e² | Matrix fibres ≤s⁴; I+a e E₁₂ gives infinitely many elements as a varies in O despite one reduced point | Generic reducedness route necessary | Retain |
| 5.1 CDT datum | x=5,p=3, θ=θ₀(λ∘Norm), order θ₀=8,a(λ)=2 | a(θ)=2, a(θ/θσ)=1, a(Indθ)=4; wrong selector Hom=(16−20+4)/24=0 versus required 1 | Supplier conductor equality missing | R01 |
| 5.3 Base change | Tame character line; averaging C₃ in F₃ | q²O[[t]]⊗k=q²k[[t]], rank 1; norm on trivial C₃ module=3=0 | Tame splitting, not arbitrary averaging | Retain |
| 5.4 Cusp duality | e=5,i=2; i=0 | q^(−2)q⁵=q³; i=0 subline q⁵O[[q⁵]], not qO[[q⁵]] | Cusp correction determines dual | Retain |
| 6.1 Type degeneracy | F₅ oldform A=[[2,3],[3,4]], rank-two type | det A=4; det(A⊗I₂)=4²=1 | Claimed numeric determinant 4 false | R05 |
| 6.2 Typed balance | Trace 5, determinant 6, diamond 2 in F₇; r=2,Tor=1 | Dual trace 5/6=2, diamond 4; defect 2−1=1 | Contragredient ideal essential | Retain |
| 6.3 Typed Galois construction | Equivariant two components; norm-twisted vexing type | Equivariant zero transports to zero on both; wrong selector Hom=0 versus minimal occurrence 1 | Construction misses allowed norm twist | R01 |
| 6.4 Typed R=T | σ diamond 2, σ* diamond 4; nonzero versus zero generic fibre | Applying inverse twice gives 2; r·1=1 forces r=1, r·0=0 does not | Dual localization plus conditional rank valid | R01 affects supply |
| 6.5 Twisted lifting/finiteness | ρ=ρ₀ψ², ψ³=1; η=ψ | ηρ=ρ₀; (detρ)²=ψ²≠1; untwisted image ≤size(η)size(ηρ) | Full signatures agree | R01/R04 affect proof inputs |
| 7.2 Scalar global type | A=O·1+πO⁴; B=O[t]/∏(t−iπ), i=0..3 | Generic fibres K⁴, O-ranks 4; reductions square-zero length 4,type 3 versus k[t]/t⁴ length 4,type 1 | Generic comparison does not supply integral type | R02 |
| 7.2 Finiteness ownership | Existing O-finite Rφ with m generators | Adjoin monic quadratic eigenvalue: ≤2m generators; every conductor quotient still ≤2m | PMCS §8.8 already supplies this | R03 |
| 7.2 Variable determinant | Inertial pairs (ψ,1),(1,ψ⁻¹) | Determinants ψ,ψ⁻¹; both normalized unordered pairs {ψ^1/2,ψ^−1/2} | Fixed-determinant twist not injective | Existing gap retained; R02 precise global conclusion |
| 7.3 Integral twist identity | O[C₃]; congruence order in O² | Group rank 3, squares recover all 3 basis elements; congruence order index size(k), generic K² | Generic equality alone insufficient | Retain |
| 7.4 Scalar multiplicity | Gross bounds 3≤d≤4, residual dimension 2 | {3,4}∩2Z={4}, multiplicity 4/2=2; type 3 versus Gorenstein type 1 | Correct conditional argument | R02 upstream |
| 8.2 Levels/types | Scalar aI, ψ²=1; p=3,norm7 versus5 | a/d=1, ψ(a²)=1; Γp index3 versus1; nonquadratic ψ(a²) need not be1 | Half-conductor and quadratic selectors differ | Declared principal-type gaps |
| 8.3 Hecke data | Uniformizer multiplied by unit; T killed by π | U=2,diamond3 becomes6 in F₇; π image0 | Whole Hecke action differs although residual diamond may be1 | Retain |
| 8.4 Conjecture A | T=k[e]/e²; one Q versus all Q | e≠0 in T, e=0 in k; one quotient supplies 1 level, patching needs all levels | Whole-image/all-level requirement explicit | Retain |
| 9.1 Diamond datum | Δ=1,C₃ | Regular O-module ranks1,3; both coinvariant ranks1 | Groupoid cover and Shapiro match | Retain |
| 9.2 Selected-root comparison | Norm1,roots2,4 in F₇ | Pair determinant4−36=3=−(2−4)²; α²−1=3; repeated gives0 | Residual-only supplier extension expressly declared | Retain gap |
| 9.3 Amplitude/boundary | C₃ stabilizer in F₃; coarse point; H₀ component exchange | H₃ dimension1 versus0; degree-two exchange has eigenvalues2,−2 versus2,2 for 2I | p=3 H₃ and torus boundary separate | Retain two gaps |
| 9.3 Non-neat boundary | F=Q(i),p=3; Q(sqrt−3) | Units order4 invertible mod3; latter discriminant−3 excludes unramified-at3 | Boundary hypotheses not implied by degree-three vanishing | Retain |
| 9.4 Balanced Bianchi | Δ=1,M=O^r⊕k^s; general r=2,Tor=1 | Betti(r+s,s), defectr; 2−1=1 | Correct defect with torsion retained | Retain |
| 10.1 Bianchi TW | q=1;p=3 with only H₃ | A∞=O,zero variables; H₃ alone supplies zero R_Q→T_Q maps | All-level Conjecture A retained at p=3 | Retain |
| 10.2 Bianchi R=T | T=k,H=k² versus H=0 | Free rank2, generic dimension0; zero module annihilatorT | Proper ideal/nonzero module needed; no universal rank1 | Retain |
| 10.3 Dimension-zero CI | O/(π²); O/(0) | Length2,dimension0,one regular equation; dimension1 excluded | q=1 boundary works | Retain |
| 10.4 Generic multiplicity | Two local dimensions2,3; global multiplicity1 | 1·2·3=6, not1; S-only singleton dimensions give1 | Correct finite-type factor | R06 dependency summary |
| 10.5 Bianchi lifting | π-killed Hecke algebra; O-valued point | π maps0 in source but π≠0 in O | Lift forces nonzero generic fibre; all-level A and p3H₃ retained | Retain |
| 10.6 GL/PGL obstruction | C₃; order9 Kummer over F₁₉, g=2,α=8 | Group algebra rank3 versus scalar rank1; α⁶=1 but α²=7≠1 | Ninth-power condition cannot be replaced by cubic | Retain |
| Dependency summaries | Layer1 two matrix inputs; Layer10 ALS5b.5–8 | Needs occurrences1 each; corresponding summary occurrences0 | Prior repair pattern remains elsewhere | R06 |

The §6.4 duality check is not based on pretending σ is self-dual. H₀ with σ* is the dual of sections with σ; the passage to coherent H¹ uses contragredient representations, inverse diamonds and the transported residual ideal. Over F₇, diamond 2 becomes 4 and returns to 2 after the second dual, while trace 5 with determinant 6 becomes 2. The stated generic-rank conclusion requires a nonzero generic fibre; torsion modules have generic dimension zero at every free rank.

For R01, the finite character calculation can be checked without trusting a roadmap assertion: the central elements of F₂₅× contribute 4·4=16 to the inner product with the depth-zero cuspidal character. The twenty noncentral elements contribute −20−(−4)=−16. Dividing the total by 24 gives 0. Twisting the actual depth-zero type and the desired representation by the same determinant character instead preserves their original multiplicity 1.

### Headline coverage, elaboration and padding

The README's end theorems and major intermediate headlines are accounted for as follows. “Not statable” means the actual arithmetic carrier is missing at these pins, not that an arbitrary algebraic stand-in would be difficult to write.

| README headline | Acceptance-test treatment |
|---|---|
| §1.5 balanced coherent homology | Named in the module docstring; needs actual integral Katz/dual coherent homology with diamond-level Hecke action. |
| §§2.1–2.4 Hasse doubling and separate ordinary projections | Named in the docstring; finite-coefficient Katz forms and matching ordinary Hecke images are missing. Matrix Cayley–Hamilton is not a substitute. |
| §§3.4–3.5 torsion weight-one local–global compatibility | Named in the docstring; the whole arithmetic torsion Hecke image is missing. |
| §§4.2–4.3 minimal weight-one R=T and conductor rank one | Named in the docstring; actual minimal deformation ring, conductor Katz module and Hecke image are missing. |
| §§4.4–4.5,6.5 minimal modularity and finite image, allowing finite-order normalization twists | Both full headlines are stated as `minimal_weight_one_modularity` and `minimal_lift_finite_image`; the no-vexing statements are explicitly special cases. |
| §§5.3–5.4 type-bundle freeness, coefficient change and cusp duality | Named in the docstring; compactified covers and their invariant-pushforward type bundles are missing. |
| §6.4 typed minimal R=T and generic rank | Named in the docstring; CDT bundles, exact Hecke images and matching minimal ring are missing. R01 affects the README's supplier route. |
| §§7.2–7.3 scalar global type and integral character twisting | Named in the docstring; matched ordinary global family and character-restricted Hecke images are missing. |
| §7.4 scalar-Frobenius multiplicity two | Named in the docstring; Jacobian torsion with both Hecke and Galois actions is missing. No unstructured dimension statement replaces it. |
| §§9.3–9.4 localized Bianchi amplitude and balancedness | Named in the docstring; actual arithmetic orbifold homology, localized Hecke action and coefficient/duality comparisons are missing. |
| §§10.2–10.4 conditional Bianchi R=T, dimension-zero complete intersection and exact generic rank | Named in the docstring; matching arithmetic minimal deformation/Hecke carriers and finite-type spaces are missing. |
| §10.5 minimal semistable Bianchi lifting | Named in the docstring; minimal local conditions, minimal-level residual homology and automorphic realization are missing. |

The authorized `lake env lean` invocation on the absolute pathname of `packages/GL2ModularityLiftingPartII/Suggested.lean`, run from the content checkout, exited **0**. Only the two expected “declaration uses sorry” warnings occurred, at lines **136** and **178**. The used Tau Ceti Newform module's object file was present; no build or package update was needed.

A second scratch file appended `#check @name` for **all nine declarations** and elaborated once, exit **0**, again with only those two warnings. I compared all displayed types with Conventions and §6.5. The explicit DVR, finite Zₚ-algebra, characteristic-zero, local scalar map, finite residue field, residue characteristic and completeness binders survive. In the CNL theorem, Noetherianity, completeness and residue-map compatibility survive. Both signatures retain continuity of ρ and η, finite image/unramifiedness of η, original residual oddness and absolute irreducibility, and minimality of the normalized twist. No lost binder or signature change was needed. The generic predicate alone does not assert a finite residue field; the two headline signatures supply it explicitly.

There are **seven real-bodied definitions and two admitted theorems**, in the required namespace, with a single `import Mathlib` followed by the one used Tau Ceti module. Each declaration has a mathematical docstring and appears in the README. There are no admitted data, admitted examples, `lemma` declarations, options, free proposition placeholders or API-padding theorems. The 211-line file stays well below the size limit.

On a scratch copy, each admitted theorem was attempted with the one-tactic alternatives `simp`, `rfl` and `infer_instance`. Neither closed; the remaining goals are respectively existence of an actual primitive weight-one newform with the stated Frobenius comparison, and finiteness of the actual representation image. The final failed alternative reports that a type-class instance was expected. The pin/object search found no single library theorem proving either headline from these hypotheses; `Set.finite_range` cannot apply to an arbitrary CNL target. Neither theorem restates a definition, checks a boundary case, or computes a small value. **No padding finding** is warranted.

The inspected package inputs, including the plan, were not edited. Only this review report and `review.json` are review deliverables; sources remained unchanged. No GitHub write, merge-order edit or library edit was made. No Lean process started by this review remains running.

## Not verifiable

- **CG22, pp.855–856:** the manifest settles this as `uncertified`, paywalled, cited by locator alone. Its contents were not guessed, requested again or added to missing references. The formal-series convention itself is coherent; attribution to the correction is not text-certified.
- **CG20's later published page offset:** the readable advance-publication PDF explicitly says final pagination remained unassigned at cg20 line 31. Lemma 8.14 was verified at its author pp.65–66. The additional published locator pp.865–866 was not independently visible in that extraction; this does not invalidate the author-page locator also supplied by the README.
- **AutomorphyLiftingBeyondTaylorWiles open package head:** the roadmap service did not expose a README for it, and the supplied board-head index does not identify its own package head. I inspected its readable board design and resolved BT.3/lemma-9-6 there. Ownership against an unavailable open package head was not checked. The declared residual-only gap remains a valid contract rather than a missing-supplier finding.

No new missing-reference request is necessary. All other source-dependent work in this review was completed with the supplied legal texts.

## Source issues

- **Misprint** in cg18 at Lemma 3.5 proof, pp.318–319, cg18 lines 900,914: the source says the second degeneracy column maps under U_x to the diamond without x; it should be x times that diamond, consistent with the displayed matrix at line 917; affects nothing.
- **Misprint** in cg18 at Proposition 3.8 proof, p.323, cg18 line 1076: the source says the cohomological Hochschild–Serre sequence lies in the second quadrant; it should be first-quadrant, with its reindexed Pontryagin dual third-quadrant; affects nothing.
- **Misprint** in cg18 at Theorem 3.11 proof, p.328, cg18 lines 1265–1275: the source says U_p has the matrix for a differently scaled second column; it should be [[T_p,diamond],[−1,0]] for the stated pair (Hasse,diamond·V_p); affects nothing.
- **Misprint** in cg18 at Theorem 3.30 proof step (2), p.351, cg18 line 2210: the source says the boundary input is Proposition 3.7(2); it should be Lemma 3.7(2); affects nothing.
- **Error** in cg18 at §3.8 final paragraph, p.340, cg18 line 1773: the source says U_x vanishes whenever x² divides N; it should be vanishing when inertia invariants are zero, since wildly ramified χ⊕1 can have conductor exponent at least two and nonzero invariant-line Frobenius; affects the proof.
- **Gap** in cg18 at Theorem 4.8 proof, p.363, cg18 lines 2664–2685: the source says fixed-determinant twisting identifies the full conductor-minimal generic Hecke fibre; it should be a comparison accounting for norm-one ramified self-extension branches whose determinant-normalizing twists collide; affects the proof.
- **Misprint** in cg18 at Lemma 4.14 proof, p.368, cg18 line 2870: the source says the smaller Galois group has finite image in the larger one; it should be finite index, giving the finite quotient used for inflation; affects nothing.
- **Gap** in cg18 at Lemma 5.9(1) proof, p.377, cg18 line 3246: the source says degree-three residual homology vanishes without addressing order-three stabilizers; it should be vanishing for p≥5, or separately established localized groupoid vanishing at p=3; affects the proof.
- **Error** in cg18 at Lemma 5.9(1) proof, p.377, cg18 line 3247: the source says Hecke operators on H₀ preserve every component and act by degree; it should be degree times the abelian component permutation, whose eigencharacters are still Eisenstein; affects the proof.
- **Misprint** in cg18 at Lemma 5.9(2) proof, p.377, cg18 line 3252: the source says degree-three vanishing with μ eliminates uniformizer torsion in degree two; it should be degree-three vanishing with μ/π in the coefficient long exact sequence; affects the proof.
- **Misprint** in cg18 at Theorem 5.11 proof, p.379, cg18 line 3334: the source says q is the dimension of the untwisted adjoint Selmer group; it should be the dimension of the Tate-twisted dual adjoint Selmer group of Proposition 5.2; affects nothing.
- **Misprint** in cg18 at Theorem 5.11 proof (b), p.380, cg18 line 3364: the source says Tor with no second argument in the spectral sequence; it should be Tor with O as the augmentation module; affects nothing.
- **Gap** in cg18 at the deduction following Theorem 5.11, p.380, cg18 lines 3372–3373: the source says global multiplicity one implies Hecke-module rank one; it should be global multiplicity times the actual finite local invariant-space dimensions, with their being one established separately; affects the proof.
- **Misprint** in cg20 at Lemma 8.14 proof, author p.66, cg20 line 2581: the source says UVF=F belongs to the β-summand after assuming F lies in the α-summand; it should be membership in the α-summand; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "301ff44640251a3704593a74f227521f3d3baecf", "job": "REV-PKG-GL2ModularityLiftingPartII~3", "model": "gpt-6-astra", "worker": "chris-17"} -->
