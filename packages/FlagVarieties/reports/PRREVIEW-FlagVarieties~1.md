# Review of FlagVarieties (pull request #1762 at b3bd0b6)

**Verdict:** needs changes

🤖 Independent AI review. Eight findings, five blocking. The stated characteristic-zero classification survived the concrete checks below. The blocking issues concern the missing acceptance file, unavailable suppliers, duplicated work, and unnecessarily restricted generality.

## R01 (P1) — The acceptance file is absent and cannot build

**Location:** `TauCetiRoadmap/FlagVarieties/Suggested.lean` (missing); `TauCetiRoadmap/FlagVarieties/README.md:7`–13, the five objective statements.

**Claim:** The folder supplies the required acceptance test for its headline theorems.

**Witness:** The folder contains only `README.md` and `metadata.toml`. The gate reports `missing-files=1 FAIL`. Direct `lake env lean` on the specified module file exits 1 with “no such file or directory”.

**Repair:** Add `Suggested.lean` with the required module docstring, namespace, single `import Mathlib`, and only individually used Tau Ceti imports. State each headline expressible on native carriers with a few genuine definitions; identify every remaining headline and its missing carrier in the docstring. Do not substitute abstract point-set classification for scheme classification. Run the targeted build and declaration-type audit. The witness is repaired only when this exact module exists and elaborates; no such repair was made in this read-only review.

## R02 (P1) — The named native parabolic APIs are not at the pins

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:25`, 37, 71, 83, 101: “Invoke `TauCeti.TitsSystem.standardParabolicOrderIso`”.

**Claim:** The pinned library provides the standard-parabolic construction, its order isomorphism and self-normalizer theorem, and `HopfIdeal.IsParabolic` with an algebraically closed specialization.

**Witness:** At Tau Ceti `358314d`, `TitsSystem/Basic.lean:50` defines the BN-pair, but none of those four names occurs in the pinned sources. `Borel/Basic.lean:196` defines `HopfIdeal.IsBorel`, not `IsParabolic`.

**Repair:** Replace the claims of availability with precise owned construction targets or declared supplier gaps. ReductiveGroups Layer 7 owns algebraic parabolics and BN-pairs; request the missing predicates and abstract classification/self-normalizer statements there with separate, precise contracts, or allocate a nonduplicating lower layer here. Preserve the actual ambient group and Borel in the bridge. The Weyl-group construction `CoxeterSystem.parabolic` is not the missing subgroup of G. After the contracts are supplied, check the actual imported declarations. Regression: for GL₃ over 𝔽₂ the ambient parabolics have orders 8,24,24,168, while the Weyl parabolics have orders 1,2,2,6; confusing the two changes the statement.

The main CFSGBasicProperties roadmap also mentions `standardParabolicOrderIso` at a different library revision. That citation does not make it available at this PR's pin, and it is not an independent construction contract.

## R03 (P1) — The complete-Borel-quotient route has no exact supplier contract

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:109`–111: “implement the complete Borel-quotient theorem at ReductiveGroups Layers 3A/7 if absent”. Also lines 24, 95, 115, 117.

**Claim:** The cited supplier supplies completeness of G/B, complete-scheme Borel fixed point, and the conjugacy/normalizer inputs needed to use them.

**Witness:** On main, ReductiveGroups §3A.4 constructs some closed orbit; §3A.6 does not identify its stabilizer with B. Layer 7 names conjugacy, but no complete-G/B or Borel fixed-point target is stated there.

**Repair:** Give completeness of G/B and complete-scheme fixed point actual named targets, or declare precise gaps against the earlier supplier. Also name the conjugacy theorem for Borels of an arbitrary smooth connected affine group: F2/F4 apply it inside P_K, which need not be reductive. The pinned `HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` requires an additional `hcontain` hypothesis and does not discharge that input. Separate the Chevalley line-stabilizer realization from the existence of an arbitrary projective orbit. Remove the instruction to enlarge another roadmap implicitly. No gaps are declared for this package.

**Repair test:** For GL₃ and K={s₁}, P_K has dimension 7 and a nontrivial two-dimensional unipotent radical, so a theorem only about reductive ambient groups cannot be applied to it. A general connected-group Borel conjugacy contract does apply. For SL₂, the required complete quotient is ℙ¹; merely obtaining an unspecified closed orbit in some representation does not identify that quotient. Milne Theorem 17.9, printed p.354, supplies a noncircular mathematical route, but its proof is not a library or roadmap contract.

## R04 (P2) — Delete already supplied API targets and resolve comparison ownership

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:49`, 55, 77, 143: “prove identity, inverse and composition laws”.

**Claim:** These are new API obligations owned by this roadmap.

**Witness:** Pinned `HopfIdeal/Conjugation.lean:96,102,110,116,292` already proves these Hopf/point conjugation laws. Main ReductiveGroups §7C.5 already requests block-parabolic flag/Grassmannian maps; main SchubertGeometry S1.1–3 already owns the incidence/convention comparison.

**Repair:** Cite the existing declarations, with exact files, in supplier contracts and remove their restatements as targets. Retain only explicitly identified additional scheme-to-Hopf comparisons. In F5 consume the existing type-A stabilizer/incidence dictionary and make the four-type classification an application/Check. Resolve the Bruhat-closure input to the precise existing Schubert result (S2.3's subword/Bruhat criterion and its supplied closure geometry), or identify the genuinely additional group-to-flag preimage comparison; do not leave “reuse ... otherwise prove” as an ownership decision for implementers.

**Repair test:** At g=1 the conjugation law is the existing `conjugate_one`; at g=[[1,0],[1,1]], the point-comparison theorem sends the stabilizer of ⟨e₁⟩ to the stabilizer of ⟨e₁+e₂⟩. For GL₃, J={s₁} retains the plane, exactly the supplied block-parabolic dictionary. These checks require no second conjugation or incidence API.

## R05 (P2) — Separate Cartier's corollary from the general smooth theory

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:5`, 49, 79: “Fix an algebraically closed field k of characteristic zero”.

**Claim:** Every layer, including smooth standard parabolics and their projections, is restricted to characteristic zero.

**Witness:** Milne Theorem 21.91, printed pp.453–454, classifies smooth standard parabolics in arbitrary characteristic; Conrad–Feng Appendix T.1, p.305, records the inclusion-preserving classification and unique standard conjugacy representative over fields.

**Repair:** Develop the smooth/reduced parabolic classification and its maps in arbitrary characteristic, retaining characteristic zero as the corollary that permits arbitrary closed subgroup schemes without an extra smoothness hypothesis. For projective homogeneous varieties in characteristic p, require smooth scheme-theoretic stabilizers (equivalently here, separable orbit maps) for classification by the smooth P_J. Do not simply erase `CharZero` from the existing statements.

**Repair test:** In characteristic 2, the standard GL₃ parabolics still have orders 8,24,24,168 on 𝔽₂-points and the projection matrix below is unchanged. Conversely, over an algebraic closure of 𝔽_p, H=F⁻¹(B)⊂SL₂ has defining equation c^p=0, whereas B has c=0. They have the same geometric points, but H is nonsmooth, with Lie dimension 3 rather than 2. The Frobenius-twisted transitive SL₂-action on the smooth projective ℙ¹ has stabilizer H and must be excluded from the smooth-stabilizer classification. This tests both the extension and its necessary qualification.

## R06 (P3) — Attach locators to individual claims and identify all sources

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:148`–157, especially the broad ranges “§§11–12” and “§§24–28”.

**Claim:** The reference list supplies verifiable locators for all definitions, claims and proof steps.

**Witness:** F0.3, F1.2, F2.1 and F4.1 have no claim-local locator. Milne is named without a locator; “Conrad's reductive-group notes” does not identify a work/version. No `sources.toml` exists.

**Repair:** Supply a precise theorem/proposition or section and printed page beside each claim, with hypotheses matching the source. Identify the exact Conrad work/version. Record each work once in the source manifest; preserve Humphreys as uncertified if it remains paywalled. The supplemental locators in the source audit below are usable starting points, not certification of the unread Humphreys locators. Example repair test: F4.1 matches Milne Proposition 5.22, p.104, together with the quotient criterion; this supplies the fixed-point/equivariant-map universal property rather than an unrelated chapter range.

## R07 (P3) — Give each definition discriminating Checks

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:42`, 67, 97, and Layer F5.

**Claim:** The definitions of homogeneous variety, standard parabolic and type have the required API and at least three discriminating Checks.

**Witness:** There are no `**Checks.**` lists. F5 supplies four family examples, but no per-definition tests for the homogeneous-space definition or intrinsic type, and no explicit nonreduced or conjugation-orientation test.

**Repair:** Keep the existing API goals, turn them into explicit per-definition lists, and add three genuinely discriminating computations for each definition. Use the table below: a torus/point, a nonprojective homogeneous Gₘ, a dual-number thickening excluded by smoothness; P_∅, P_S and the GL₃ retained-dimension test; type under conjugation and distinct line/plane types. Add the μ_p point-detection counterexample and the Frobenius-stabilizer example when separating generality. A conjugation example with g≠g⁻¹ distinguishes the direction, unlike a Weyl representative whose inverse acts identically on the relevant flag.

## R08 (P3) — Supply the required roadmap structure and local dependencies

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:1`–3 and 45–144.

**Claim:** The folder has the required prose roadmap form and an implementable layer dependency description.

**Witness:** It lacks the `Roadmap:` title, opening `Summary`, `Exact supplier contracts`, `How to read the build`, per-layer `Examples`/`Dependencies`, and downstream-consumer section. There are zero `*Needs:*` lines.

**Repair:** Use the prescribed headings and give each target its own dependency list. F1.1 must explicitly include the closure and root-cell inputs; F2.1 must include conjugacy inside connected P_K; F3 must include the independently supplied complete-Borel-quotient theorem; F4 must include scheme-level descent and the normalizer comparison. Move all availability claims into ownership/contracts and remove temporal/process language such as “current native definition” and “missing bridge”. Re-run the shape scanners and dependency check. The current mechanical dependency result below is clean, but it cannot validate nonexistent theorem-level edges.

## Verified sound

The entire 157-line README was read. The target head is `b3bd0b6876f82cf01d6816ba46ef21a3d216674e`; content main is `929496d4221b974c60787257a3cdc28b600fc49c`. Pins were checked against the manifest and the package Git heads: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The outside-folder diff is empty. There are no algorithms, copied passages identified in the accessible comparison texts, sorry'd data, options, or Lean padding in the submitted folder; the last three observations concern an absent Lean file, not a passing acceptance test. No previous repair report or declared gap was supplied.

Three main roadmaps were opened for form and ownership: ReductiveGroups, SchubertGeometry, and SchemeAndStackFoundations. Object searches used the roadmap service across main/open heads and read the board package files. Open SchubertGeometry's supplied head was also read. A revision of an existing roadmap was not treated as a replacement supplier for main.

**Gate and dependency evidence.** The worker's gate at this head reports:

```text
gate FlagVarieties: missing-files=1 FAIL
missing-files: TauCetiRoadmap/FlagVarieties/Suggested.lean
```

The requested mechanical dependency command was run with `--movable` and the supplied candidate order/content snapshot; its complete output was:

```text
depcheck: 205 roadmaps, 1642 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All five supplier-table rows and the prose supplier references were read. No `*Needs:*` lines exist to audit. Direct elaboration was attempted on the requested `Suggested.lean` and failed because the file is absent. There are zero submitted declarations for the `#check @name` binder audit and zero sorry bodies for the one-tactic padding probe; neither check can certify a future file. No Lean process remains running.

**Pinned objects opened.** Paths below are library-relative and refer to the verified pins, not newer web documentation. Fourteen groups of concrete definitions/theorems were inspected in full or in their defining/signature blocks; closely related laws are grouped in the same row.

| Object or law | Pinned file and line | What it supplies, and what it does not |
| --- | --- | --- |
| `QuotientGroup.leftRel`, `leftRel_apply` | `Mathlib/GroupTheory/Coset/Defs.lean:66,71` | x⁻¹y∈H; the cosets are gH. This is a set quotient, not a scheme. |
| `Module.Grassmannian` | `Mathlib/RingTheory/Grassmannian.lean:66` | A submodule with finite projective quotient of constant stalk rank. Its rank parameter is quotient rank, not subspace dimension; it is not a representing scheme. |
| `Module.Basis.flag` | `Mathlib/LinearAlgebra/Basis/Flag.lean:37` | The span of the first k basis vectors, indexed by `Fin (n+1)`. |
| `TauCeti.TitsSystem` and its simple set | `TauCeti/GroupTheory/TitsSystem/Basic.lean:50,61,105` | An actual BN-pair on a group, with Weyl quotient and simple reflections. No algebraic scheme or standard-parabolic order isomorphism is a structure field. |
| `HopfIdeal.IsBorelOverAlgClosed`, `IsBorel` | `TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean:148,196` | Minimal Hopf ideal among smooth connected solvable candidates, geometrically after base change. Neither is `IsParabolic`. |
| `HopfIdeal.le_of_quotientPointsSubgroup_le` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Separation.lean:58` | Reverse point inclusion implies ideal inclusion; finite type and reducedness of the quotient on the right are explicit. |
| `HopfIdeal.eq_of_quotientPointsSubgroup_eq` | Same file, line 84 | Both quotient algebras must be reduced and finite type. Equality of geometric points alone is insufficient. |
| `quotientPointsSubgroup_antitone`, `quotientPointsSubgroup_sup` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Order.lean:55,102` | Hopf-ideal order reverses geometric subgroup order; ideal join gives intersection of point subgroups. |
| `HopfIdeal.conjugate` and identity/composition/inverse laws | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Conjugation.lean:66,96,102,110,116` | A genuine Hopf-ideal action, already implemented over a commutative base ring. |
| `CommHopfAlgCat.pointConjugation_mem_conjugate_iff` | Same file, line 292 | Explicit g x g⁻¹ membership comparison for every value algebra. |
| `HopfIdeal.exists_conjugate_eq_of_isBorelOverAlgClosed` | `TauCeti/Algebra/AlgebraicGroup/Borel/Conjugation.lean:161` | Conjugacy conditional on a distinguished candidate and the separate containment hypothesis; not unconditional Borel conjugacy. |
| `CommHopfAlgCat.fppfHomogeneousQuotient`, `fppfHomogeneousQuotientHomEquiv` | `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:216,280` | Sheafification and its invariant-map universal property; no representability or projectivity assumption/conclusion is built into the definition. |
| `isLocallySurjective_fppfHomogeneousQuotientSheafProjection`, `isPullback_fppfHomogeneousQuotientTorsor` | `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Torsor.lean:152,158` | Local lifting and torsor kernel pair in sheaves, not a scheme quotient carrier. |
| `Comodule.range_toProjectiveOrbit_kernelPoint_eq_closedPoints` | `TauCeti/Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Homogeneous.lean:42` | Actual projective orbit points, with algebraic closedness, finite-type Hopf algebra, finite module and unimodular vector. It does not realize every prescribed subgroup as a line stabilizer or assert that every orbit is closed. |

The dynamic `Cocharacter.parabolic` in `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:293` and the Coxeter-parabolic API in `TauCeti/GroupTheory/Coxeter/Parabolic.lean` were also inspected. They operate on different carriers from the missing claimed declarations. Searches by parabolic, subgroup, normalizer, conjugation, quotient, flag and orbit objects did not reveal a pinned replacement for the claimed native classification APIs.

**Supplier and ownership resolution.**

| README citation | Resolved owner and evidence | Audit result |
| --- | --- | --- |
| ReductiveGroups Layers 0–3 | Main `TauCetiRoadmap/ReductiveGroups/README.md:129,176,234` | Dictionary, representation and quotient targets exist. Reuse the native point/conjugation/sheaf APIs already implemented. |
| ReductiveGroups 3A | Same file, lines 249–395 | Actual stabilizers, orbit maps and closed orbits exist as targets. Completeness of the particular G/B is not stated there: R03. |
| ReductiveGroups Layers 4–7, 7C | Same file, lines 432,628,632,648,652,686,688 | Tori, parabolics, root groups, BN-pairs and type-A block-flag maps exist. Complete fixed-point and complete-Borel-quotient contracts claimed here are missing. |
| SchubertGeometry conventions/S1 | Main `TauCetiRoadmap/SchubertGeometry/README.md:7,19,21,30` | Quotient/Borel conventions and relative-incidence/root-cell comparison exist. Main explicitly assigns universal flags to AlgebraicModuliForArithmeticGeometry §1.3 and parabolic type quotients to ShimuraData §3.8. Thus it is not itself the original owner of those carriers on main. |
| SchubertGeometry closure comparison | Main same file, S2.3 at line 42 | The subword/Bruhat criterion is already a target. F1 should identify the additional preimage-in-G comparison, if needed. |
| SchemeAndStackFoundations Layers 0–1 | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:28`–29, 80–111, 178–180 | Scheme foundations and descent are supplied, with explicit deferrals to ModularCurves, StableReduction and AlgebraicVectorBundles. Broad layer ranges should become exact contracts. |
| Open SchubertGeometry S1.0–1 | `TauCetiRoadmap/SchubertGeometry/README.md:87` onward at the supplied open head | This revision explicitly develops relative parabolic quotients, self-normalization, projectivity and flags. It confirms overlap to coordinate, but is not consumed instead of main. |
| Board packages | `packages/SpringerResolutionAndCharacteristicCycles/design/README.md:1488,1755` and `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:15` | These are consumers of the reductive/flag floor, not alternate proofs of the missing native BN-pair declarations. |

FlagVarieties can own the final classification of projective homogeneous G-varieties and the assembly of the equivariant morphism classification, after the supplied foundations and comparisons are separated. I did not find an existing main folder named FlagVarieties, or a reason that this entire consumer objective is irreparable; the verdict is therefore needs changes, not rejection. No new ownership was assigned or moved during review.

**Source audit: 15 explicit targets.** The brief says the worker found no targets by heading and supplies no target IDs or seed output. I cannot honestly reproduce an unspecified random sample. I audited the following fifteen source-bearing claims, covering every F0–F4 subsection and the five headline objectives. No locator is explicitly labelled unverified in the README. Humphreys is the primary source for all fifteen, but its text was unavailable; the table records independent checks against the legally fetched supporting work, not successful verification of Humphreys' numbering. Printed pages below are book pages, not PDF page indices.

Milne denotes *Algebraic Groups* (2017), author-hosted text at [the author's book page PDF](https://www.jmilne.org/math/Books/iAG2017.pdf). Conrad denotes Conrad–Feng, *Reductive Groups over Fields*, version December 5, 2020, [author-hosted notes](https://math.stanford.edu/~conrad/249BW16Page/handouts/AMSalggroups2.pdf). Both were fetched through the sources service; no source text was copied into the PR or report.

| # | Target and README line | Text read and conclusion |
| --- | --- | --- |
| S01 | F0.1 point detection, 49 | Pinned separation theorems, lines 58–91 above, verify finite type, algebraic closedness and reducedness exactly. The Humphreys §§11–12 attribution is uncertified. |
| S02 | F0.2 conjugation, 55 | Pinned conjugation theorem at line 292 verifies orientation and all-value-algebra compatibility. This part is already supplied. |
| S03 | F0.2 quotient lifting and maps, 55 | Milne Proposition 5.22, p.104, line 4545; Proposition 5.24, p.104, line 4562; Proposition 7.15, p.142, line 6061. These give the universal map and torsor fibre comparison; algebraic-closed rational lifting still uses finite type. |
| S04 | F0.3 orbit/stabilizer quotient, 59 | Milne Propositions 7.11–7.13 and Remark 7.16(c), pp.141–143, lines 6036–6094. Smooth X and the actual scheme stabilizer are essential to the intended application; merely matching point sets is not the proof. |
| S05 | F1.1 algebraic realization, 67–75 | Milne Theorem 21.91, pp.453–454, lines 18691–18717, gives the actual parabolic and Bruhat union. The source first works split semisimple, after explicitly reducing reductive groups in lines 18622–18627. Keep that reduction/central-torus input. |
| S06 | F1.1 union closedness and group structure, 77 | Milne line 18704 onward constructs the subscheme and uses the BN multiplication law. It supports the resulting subgroup, but does not certify the README's alternate subword-closure proof verbatim. That alternate route needs its explicit Schubert input. |
| S07 | F1.2 order classification, 83–85 | Milne Theorem 21.91, lines 18691–18701; Conrad Appendix T.1, p.305, lines 13450–13457. Both support smooth parabolic classification, not arbitrary nonreduced subgroups in characteristic p. |
| S08 | F1.2 intersection/join, 87 | Consequence of the order classification, using reduced/point detection in characteristic zero. Conrad line 13455 explicitly states the order direction. The scheme-theoretic recovery is a separate required adapter. |
| S09 | F2.1 standard conjugacy representative, 93–97 | Conrad Appendix T.1, p.305, lines 13453–13456; Milne Theorem 17.9(b), p.354, line 14526 and Corollary 17.49 proof, p.367, lines 15080–15084. Conjugation is inside connected P_K, not assumed normality of B. |
| S10 | F2.2 normalizers, 101 | Milne Theorem 17.48 and Corollary 17.49, p.367, lines 15049–15085, distinguish scheme smoothness from rational-point equality. |
| S11 | F3.1 prescribed line stabilizer, 107 | Milne Theorem 4.27, pp.94–95, lines 4189–4211, gives a finite-dimensional representation realizing every algebraic subgroup; Theorem 7.18, p.143, lines 6102–6111 gives the immersion of its quotient. |
| S12 | F3.1 completeness/projectivity, 109 | Milne Theorem 17.9(a), p.354, lines 14525–14540; Theorem 17.16 proof, p.356, lines 14610–14612. The complete image plus projective immersion route is valid. It is not a proof that arbitrary proper schemes are projective. |
| S13 | F3.2 fixed point and equivalence, 115–117 | Milne Corollary 17.3, p.353, lines 14471–14484; Definition 17.15 and Theorem 17.16, p.356, lines 14605–14615. Smooth connected solvable acting group and nonempty complete target are present. Milne defines parabolic via completeness, so a definition-comparison theorem is needed for the proposed Borel-containment convention. |
| S14 | F3.3 homogeneous classification, 121 | Derived from Milne 7.13/7.16(c), 17.16 and Conrad T.1 at the preceding locators. It is an assembly of these results, not a single verified theorem at the README's sole §30.1 reference. |
| S15 | F4.1–2 morphisms and projections, 129–135 | Milne Proposition 5.22, p.104, line 4545, gives the universal equivariant map; Theorem 17.48 and Borel conjugacy give the unique B-fixed coset. Together with the order classification this proves the stated direction and uniqueness. |

**Adversarial values.** The following 48 rows cover the definitions/conventions, all substantive assertion groups in F0–F5, the fifteen source targets above, every headline and the mathematical claims touched by findings. A row is a concrete regression check, not a proof of the general theorem. Unless indicated otherwise, matrix examples are over an algebraically closed characteristic-zero field. Finite-field rows test the proposed generality repair and polynomial conventions; they do not silently remove the README's characteristic-zero assumption.

For the finite calculation, GL₃(𝔽₂) was enumerated independently: 168 invertible matrices, 7 lines, 7 planes, 21 incident line-plane flags. Let A=P_{s₁} stabilize ⟨e₁,e₂⟩ and C=P_{s₂} stabilize ⟨e₁⟩. The order of types is ∅,{s₁},{s₂},S. This gives an independent check against swapping the two maximal parabolics.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| 01. Standing field/group scope (line 5) | Trivial group, Gₘ, SL₂ | Semisimple ranks 0,0,1; numbers of standard labels 1,1,2 | No positive-rank or faithful-action hypothesis needed. Extend smooth cases as R05. |
| 02. Hopf-ideal order (36) | GL₂: B⊂G | I(G)=0⊂(c)=I(B), while dim B=3<4=dim G | `OrderDual` direction correct. |
| 03. Borel-containing parabolic convention (37) | SL₂: B,G,T | Contains a Borel: yes,yes,no; quotient dimensions 1,0,2; projective: yes,yes,no | Mathematical convention sound; named native predicate absent, R02. |
| 04. Left action/right multiplication quotient (38) | S₃, H=⟨(12)⟩, g=(123), right-to-left permutation composition | gH={(123),(13)}; Hg={(123),(23)}; x⁻¹y∈H for x=g,y=g(12) | Coset direction discriminated; Mathlib uses gH. |
| 05. J records included Levi roots (39) | GL₃, J={s₁} vs {s₂} | Retained dimensions {2} vs {1}; parabolic block sizes (2,1) vs (1,2) | Correct; complement convention required. |
| 06. Normalizer representative independence (40) | SL₂, n=[[0,−1],[1,0]], t=diag(a,a⁻¹) | nB=ntB; both lines [0:1]; changing a≠0 changes representative but not point | Correct; a=0 is excluded by t∈T. |
| 07. Fppf quotient is not every-algebra point quotient (41) | Gₘ/μ₂, R=k[t,t⁻¹] | Quotient point t∈R×; x²=t has 0 solutions in R, but 2 in k at any nonzero scalar | Correct warning; needs sheafification. |
| 08. Homogeneous-variety definition (42) | Point; Gₘ by translation; two points with trivial action | Geometric orbit counts 1,1,2; nonempty smooth homogeneous yes,yes,no; projective yes,no,yes | Definition does not presume projectivity. Add Checks, R07. |
| 09. Smoothness excludes pointwise junk (42) | X=Spec k[ε]/ε² with trivial action; empty X | Geometric points 1 and 0; tangent dimensions 1 and none; homogeneous predicate false and false | Nonempty/smooth conditions reject both wrong models. |
| 10. Opposition convention (43) | GL₂ upper and lower Borels | Fixed lines ⟨e₁⟩ and ⟨e₂⟩; n sends [1:0] to [0:1] | Relabelling B as the supplier's B− needs the stated opposition map. |
| 11. F0.1 inclusion/equality reflection | Gₐ, zero subgroup vs Gₐ | Ideals (t)≠0; point sets {0}≠k; inclusion on both sides reverses exactly once | Matches the pinned reduced finite-type theorem. |
| 12. F0.1 nonreduced negative control | μ_p vs 1 over algebraic closure of 𝔽_p | Both point sets {1}; coordinate lengths p and 1; ideals ((t−1)^p) and (t−1) | Point equality cannot detect nonreduced schemes; warning correct. |
| 13. F0.2 conjugation orientation | GL₂, g=[[1,0],[1,1]], B upper | gBg⁻¹ stabilizes [1:1]; g⁻¹Bg stabilizes [1:−1], different in char 0 | Pinned point comparison has correct orientation; cite it, R04. |
| 14. F0.2 identity/inverse/composition | Same g, conjugate twice | g² sends e₁ to (1,2); g⁻¹g sends it to (1,0); both composed conjugations give those lines | Existing native laws suffice. |
| 15. F0.2 rational quotient map | SL₂/B→ℙ¹ | gB↦[a:c] for first column (a,c); identity↦[1:0], n↦[0:1]; right B multiplication scales column | Both points and equivariance agree; not a scheme-isomorphism proof by themselves. |
| 16. F0.3 stabilizer and orbit fibre | GL₂ on lines at [e₁] | Stabilizer c=0 has dim 3; fibre over [1:1] is gB with same dim 3; dim quotient 4−3=1 | Fits actual ℙ¹ and quotient-by-stabilizer. |
| 17. F0.3 separability control | Frobenius-twisted SL₂ on ℙ¹, char p | Stabilizer c^p=0 has Lie dim 3; reduced B has Lie dim 2; orbit derivative rank 0 vs expected smooth rank 1 | Outside current scope; requires smooth stabilizer in R05 extension. |
| 18. F1.1 smallest closed generation | GL₃ over 𝔽₂, B plus selected negative simple root groups | Generated subgroup orders 8,24,24,168; corresponding stabilizer orders 8,24,24,168 | Agrees for all four J. |
| 19. F1.1 minimality/monotonicity | J=∅⊂{s₁}⊂S | Orders 8≤24≤168; retained flag dimensions {1,2}⊃{2}⊃∅ | Correct direction; generation is not a premise of the equality. |
| 20. F1.1 rank-one two cells | SL₂ over 𝔽₂ and 𝔽₃ | B and BnB sizes (2,4) and (6,18); sums 6 and 24 equal group orders | Both small characteristics work. |
| 21. F1.1 Bruhat union for J={s₁} | GL₃ over 𝔽₂ | W_J={e,s₁}; cells have sizes 8 and 16; sum 24=order P_J | Ambient P_J is not the 2-element Weyl parabolic. |
| 22. F1.1 closedness comparison | GL₃ plane stabilizer | Equations a₃₁=a₃₂=0; c-type Bruhat union has exactly the same stabilizer points, dimension 7 | Explicit closed model validates this instance; general closure input still needed. |
| 23. F1.1 subgroup scheme from reduced locus | Same block matrices | (AB)₃₁=(AB)₃₂=0 and inverse lower-left block 0; reduced coordinate chart has dim 7 | Product/inverse preserve locus; reducedness alone is not a universal representability argument. |
| 24. F1.1 connectedness/endpoints | GL₃: B,A,G; torus | Block models GL₁³×A³, GL₂×GL₁×A², GL₃ have 1 component each; P_∅=B, P_S=G; torus endpoint same G | Endpoints and connectedness consistent. |
| 25. F1.2 order isomorphism (headline 1) | Four GL₃ types | 4 subsets and 4 standard stabilizers; strict inclusions ∅→{s₁},{s₂}→S; singleton types incomparable | Same poset on both sides. |
| 26. F1.2 inverse label test | Q=A | P_{s₁}⊆Q: true; P_{s₂}⊆Q: false; inverse label {s₁} | Excludes complement-labelled inverse. |
| 27. F1.2 intersection | A∩C | On 𝔽₂, 24-element stabilizers intersect in 8-element B; J∩K=∅, P_∅ order 8 | Scheme ideals add to upper-triangular equations. |
| 28. F1.2 closed generated join | ⟨A,C⟩ | Enumerated generated group order 168; J∪K=S, P_S order 168 | Correct join, not set union (which has 40 points). |
| 29. F2.1 standard conjugacy (headline 2) | GL₃: B,A,C,G | Quotient dimensions 3,2,2,0; A and C are distinguished by invariant-plane/line types even though dimensions agree | Unique label cannot be inferred from dimension alone. |
| 30. F2.1 conjugating inside P_K | K={s₁}, u=I+E₂₁∈A | B fixes line e₁; uBu⁻¹ fixes e₁+e₂; u⁻¹ restores B inside A | B is not normal in A; the stated bridge has the right mathematical form. R03 supplies the theorem. |
| 31. F2.1 type and its converse | Conjugates of A; A vs C | types {s₁},{s₁} for A,gAg⁻¹; types {s₁},{s₂} for A,C; latter not conjugate | Both directions consistent; dimension would be a wrong type invariant. |
| 32. F2.2 self-normalizers | GL₃(𝔽₂), P=B,A,C,G | Fixed flags of P of its own type: 1 each; thus normalizer/P has size 1; normalizer sizes 8,24,24,168 | Pointwise normalizer values agree; scheme upgrade needs its own input. |
| 33. F3.1 Chevalley line model | GL₂, H=B; H=G | Standard representation line e₁ has stabilizer B and orbit ℙ¹; trivial representation line has stabilizer G and orbit one point | A prescribed stabilizer matters; arbitrary line choice is not enough. |
| 34. F3.1 complete quotient descent | GL₃/B→GL₃/A | Dimensions 3→2, fibre ℙ¹ dimension 1; finite counts 21→7 with 3 flags per plane | Compatible with surjectivity and properness route. |
| 35. F3.1 closed projective immersion | SL₂/B in ℙ¹; GL₂/T in ℙ¹×ℙ¹ | First image all ℙ¹, closed; second image pairs of distinct lines, missing diagonal | An arbitrary locally closed orbit is not automatically proper. |
| 36. F3.2 Borel fixed-point criterion | B acting on ℙ¹; Gₘ acting on itself | Fixed loci {e₁} and ∅; complete targets yes and no | Properness hypothesis prevents false fixed-point assertion. |
| 37. F3.2 parabolic/proper/projective (headline 3) | SL₂: H=B,G,T | Truth triples (true,true,true), (true,true,true), (false,false,false) | Both directions survive. G/T is distinct ordered pairs, not complete. |
| 38. F3.3 projective homogeneous classification (headline 4) | SL₂ projective transitive X | X=ℙ¹ has H=B,J=∅; X=point has H=G,J=S | Existence, labels and nonfaithful point action agree. |
| 39. F3.3 choice of base point | ℙ¹ at [1:0] and [0:1] | Stabilizers B and nBn⁻¹; both conjugate to label ∅ | Choice independence is conjugacy, not equality of stabilizers. |
| 40. F3.3 reverse construction and size | Rank 0 and GL₃ | Quotient dimensions 0 and (3,2,2,0); one orbit on every quotient; labels 1 and 4 | No type of all varieties is needed for ∃! J statements. |
| 41. F4.1 evaluation/fixed points | G=Gₘ, P=Q=1; SL₂, P=Q=B | Equivariant Gₘ endomorphisms are x↦xa, evaluation a arbitrary; SL₂/B endomorphism evaluates only at eB | Generic statement does not incorrectly claim uniqueness for all subgroups. |
| 42. F4.1 conjugate containment | SL₂, P=Q=B, g=e or n | g⁻¹Bg⊆B: true for e, false for n; B-fixed coset: eB yes, nB no | Correct inverse direction. |
| 43. F4.1 representative independence/descent | gQ=(gq)Q, q∈Q | (gq)⁻¹P(gq)=q⁻¹(g⁻¹Pg)q; containment in Q unchanged; map hP↦hgQ unchanged | Both construction and well-definedness have the right source/target. |
| 44. F4.2 unique B-fixed point | GL₃(𝔽₂), all four quotients | B-fixed-point counts (1,1,1,1) in spaces of sizes (21,7,7,1) | Correct; T-fixed counts would instead be (6,3,3,1). |
| 45. F4.2 morphisms (headline 5) | GL₃(𝔽₂), rows source/columns target in the four-type order | P_J-fixed counts: [1,1,1,1]; [0,1,0,1]; [0,0,1,1]; [0,0,0,1]. Boolean J⊆K gives exactly this matrix | All 16 directions checked, including both forbidden line↔plane maps. |
| 46. F4.2 identity/composition/autos | ∅⊂{s₁}⊂S; J=K | Flag (L,H)→H→point equals direct constant map; diagonal map counts 1, hence equivariant automorphism group order 1 | Does not assert the underlying variety has trivial automorphisms. |
| 47. F5 torus, SL₂, n=0,1,2 | Gₘ; GL₀; GL₁; SL₂ | Label counts 1,1,1,2; quotient dimensions 0,0,0,(1,0); GL₀ has empty rank set, not a negative rank | Empty-index/zero-module endpoints consistent. Zero ring is excluded by Field. |
| 48. F5 GL₃/Grassmannian comparison | Full flag, plane, line, point | Dimensions (3,2,2,0); Mathlib quotient ranks for plane/line (1,2); underlying middle varieties ℙ² and dual ℙ², equivariant cross-map counts 0 | Checks match all formulas; do not swap subspace and quotient ranks. |

The nonabelian S₃ coset test and the cyclic/commutative Gₘ tests rule out treating arbitrary cosets as quotient groups. The μ_p and Frobenius tests cover p=2 and p=3 as well as general p. There are no numerical denominator formulas, DVR-normalized expressions, analytic compactness claims, or uniform estimates in this roadmap to test. The only matrix inverse/scalar inverse examples above explicitly use invertible matrices and nonzero scalars. Nonclosed-field forms and inseparable-field descent are excluded by the declared base-field scope and were not silently treated as rational-point classifications.

**Headline and Lean-form inventory.**

| Headline | README location | Acceptance-test status at this head |
| --- | --- | --- |
| Standard-parabolic order classification | Objective 1 / F1.2 | Absent. Hopf ideals, Borel predicates and Tits systems exist; a native statement using them must be assessed with real simple definitions. The missing named order-isomorphism theorem is a proof target, not by itself a reason it cannot be stated. |
| Unique standard conjugacy representative/type | Objective 2 / F2.1 | Absent. Native Hopf-ideal conjugation exists; the specified P_J construction/type interface is not supplied. No docstring explains the missing interface. |
| Parabolic iff proper iff projective quotient | Objective 3 / F3.2 | Absent. Fppf quotient sheaf exists; the named `IsParabolic` and a represented standard quotient interface do not. The author must distinguish a genuine statement using existing scheme/sheaf data from an invented quotient carrier. |
| Projective homogeneous G-varieties classified by J | Objective 4 / F3.3 | Absent. The proposed homogeneous-variety predicate and standard quotient scheme interface are not provided. No weakened theorem on abstract transitive sets is acceptable. |
| Equivariant morphisms iff inclusion, uniqueness | Objective 5 / F4.2 | Absent. Native schemes/sheaves/actions support generic morphism expressions, but the P_J quotient scheme family is missing. If that family is not statable with simple definitions, name precisely this obstacle in the module docstring. |

I have not claimed that all five headlines are impossible to state: several ingredients already have native carriers. The absence of any file prevents the requested signature-by-signature binder, generality and one-tactic checks. The repair must make that distinction explicit instead of padding the file with small flag calculations. The point/torus/GL₂/GL₃ examples above belong in README Checks.

## Not verifiable

- **Humphreys, Linear Algebraic Groups:** the source service resolved the book only to the paywalled Springer DOI family and returned `uncertified`. Consequently §§11–12, 17.6, 19, 21–23 (including 21.2–21.3 and 23.3), 24–28, 29.1–29.3 and 30.1 were not checked against the primary text. No page number or hypothesis verification for those locators is claimed. The readable Milne/Conrad comparisons above do not certify Humphreys' numbering. No new request for this settled paywall result was added to a missing-reference manifest.
- **Seeded sample identity:** no fifteen target IDs or seed were present in the provided brief/scratch data; the explicit replacement audit is disclosed above. A claim to have reproduced that unspecified random selection would be unsupported.
- **Unspecified Conrad reference:** the legal Conrad–Feng 2020 notes were located and read, but the README does not distinguish these from Conrad's separate reductive-group-schemes article. It supplies no locator to certify. R06 requests the identity and version, not an invented attribution.
- **Lean acceptance:** no module file, declarations, or elaborated signatures exist. The gate and direct elaboration fail. Library absence was checked by object/name searches at the verified pins; no `#check` success for the missing names is asserted.
- **Source copying:** comparison with the two legally read supporting texts found no copied passage. Copying from the inaccessible Humphreys text cannot be excluded by that check.

## Source issues

- **Misprint** in Milne at Proposition 7.15, printed p.142: the smooth/finite clause reverses the quotient arrow; it should be G/H→G/H′ for H⊆H′; affects a stated result.
- **Misprint** in Milne at Corollary 17.49 proof, printed p.367: Borel conjugacy is attributed to 17.10; it should be attributed to Theorem 17.9(b); affects the proof.
- **Error** in Milne at Corollary 21.92 proof, printed p.455: B is said to be generated by its positive root groups; it should be generated by T and those root groups; affects the proof.
- **Misprint** in Milne at Lemma 4.28 proof, printed p.95: the expansion uses w∧w; it should use w∧v, with w the displayed top wedge and v the variable vector; affects the proof.
- **Misprint** in Milne at §7.9, printed p.141: the complement is called a submodule of M; it should be a submodule of N in the decomposition N=M⊕M′; affects a stated result.
