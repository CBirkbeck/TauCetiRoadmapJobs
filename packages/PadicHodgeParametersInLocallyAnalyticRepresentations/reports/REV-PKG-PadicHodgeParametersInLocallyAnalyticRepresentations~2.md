# Review of PadicHodgeParametersInLocallyAnalyticRepresentations (package, round 2)

**Verdict:** needs changes

Nine findings: three P1, two P2 and four P3. The previous four repairs are applied. The principal new mathematical defect is §4.1: its full Ext spaces cannot have the claimed block identification. Both major suppliers have changed their numbering since the design used by the previous review. No package source file was changed in this review.

## Previous findings, checked first

Locations below are in `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md`.

| Previous finding | Repaired passage | Assessment and independent test |
| --- | --- | --- |
| F01: incompatible Harish–Chandra normalisation | Lines 167–170: “acting by the ordinary permutation action” and “the highest-weight module for the upper-triangular Borel” | **Repaired mathematically.** The matching plan gap also uses ordinary invariants. For n=2, h=(3,1), θ=(0,−1), λ=(3,2), ρ=(1/2,−1/2): e₁(h)=4, e₂(h)=3, whereas e₁(λ+ρ)=5 and e₂(λ+ρ)=21/4. Translation by (1/2,1/2) gives exactly these values. The wrong dot orbit in h contains (0,4), giving e₂=9/4. The remaining ownership problem is R04, not the old normalisation defect. |
| F02: seven nonexistent PhiGamma names | Lines 233–239: “relative (φ,Γ_K)-modules over a finite local E-algebra A” and “a rank-one module … is de Rham exactly when δ is locally algebraic” | **Repaired.** All seven names are absent from the repaired README. The cited supplier sections exist and supply these mathematical objects; the field-coefficient criterion is at its §7.4. A smooth character and an integral algebraic character are de Rham; a character with a nonintegral logarithmic derivative is not. |
| F03: invented B-pair/modification names | Lines 243–246: “imported there from PhiGammaModulesAndIwasawaCohomology §1.6” and “Berger's modification of a filtered module with finite descent” | **Repaired.** `BPair`, `WdRPlus`, and `bergerModification` no longer occur. PadicHodgeTheory §§4.5 and 5.2 and PhiGammaModulesAndIwasawaCohomology §1.6 have precisely this content. |
| F04: abstract algebra quotient versus natural inclusion | Lines 1021–1023: “the natural map A_D → R_D/𝔪², the first projection of the fibre product, is injective” | **Repaired.** At n=3,d_K=1 this is a 10-dimensional algebra inside an 11-dimensional algebra. Its cotangent inclusion has dimensions 9→10. An unrelated linear projection still induces an abstract algebra surjection in the other direction. No other assertion excluding such an abstract quotient remains. |

No previous finding was marked not actionable. The changed passages, their new numerical Check in §2.6, and the same patterns elsewhere were inspected. The earlier table's §4.1 row is not reliable: it substituted the claimed dimension 14 without calculating the dimension of the full Ext spaces actually defined.

## R01 (P1) — The recovery relation uses full Ext spaces instead of parabolic images

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:923`, continuing through line 945: “Ext¹_σ(A, π⁻) ⊕ Ext¹_σ(A, π⁺)” is identified with the block space 𝒱_σ.

**Claim.** This ambient identification is an isomorphism, and its kernel has dimension 5 in rank three.

**Witness.** For n=3,K=ℚ_p, §4.1 itself gives π⁻=π⁺=V. Thus its source has dimension 10+10=20, and its kernel dimension 20−9=11. The proposed block space has dimension 7+7=14, with kernel 5.

**Exact repair.** Define E_F⁻ as the image of 𝔈_(σ,F) under push-forward to Ext¹_σ(A,π⁻), and E_G⁺ similarly. Define ℒ_Π as the kernel of E_F⁻⊕E_G⁺→Ext¹_σ(A,Π). Apply §3.7 to these image spaces, retaining their labelled parabolic origin in every API sentence and in the recovery argument. Do not identify full Ext groups with block products. Add the full-versus-parabolic dimension computation as a negative control.

The repaired instance has dim E_F⁻=dim E_G⁺=5+2=7; their sum maps onto the 9-dimensional target, so the relation has dimension 14−9=5. Surjectivity follows from the endpoint spanning and push-forward. DING25 line 2486 explicitly restricts (3.52) to parabolic images. The printed (3.53)–(3.54), DING25 lines 2509–2523, instead use overlined analytic Ext terms without defining the required parabolic restriction. The PDF on printed pages 53, 55 and 56 was inspected to distinguish the bars from extraction damage. Clarify those terms as the image spaces from (3.52), and record this source gap; do not read the bars as unrestricted Ext.

## R02 (P1) — Trianguline supplier citations point to the wrong sections at its head

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:212`, supplier list through line 229 and its repeated uses: “§12.8 (Ding Proposition 2.12 … is surjective)”.

**Claim.** The cited §§9–12 supply the Hodge-parameter branch and its tangent/recovery interfaces.

**Witness.** Pull request #1829, `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:1161` makes §9.1 a cycle-transfer theorem; line 2083 supplies refinement spanning in §13.8. Its Layer 12 ends at §12.7. No old-number mapping preserves these citations.

**Exact repair.** Resolve the entire supplier list and every occurrence in Scope, Conventions, Needs, Dependencies and examples against #1829's head. The content mapping is:

| Old citation | Section at the head |
| --- | --- |
| §9.1, §9.2, §9.3 | §10.1, §10.2, §10.3 |
| §9.6: modified endpoints | §10.5 |
| §9.8: rank-three example | §10.7 |
| §9.9: modification surjectivity | §10.8 |
| §§10.1–10.8 | §§11.1–11.8, respectively |
| §§11.1–11.7 | §§12.1–12.7, respectively |
| §12.8, §12.13, §12.14, §12.16 | §13.8, §13.13, §13.14, §13.16 |

Expand the undefined “TV” at line 930 to the supplier's name. Do not add duplicate local constructions. Verification of the corrected recovery citation: §13.14 at line 2207 gives the sequence with dimensions 14=5+9; §13.8 gives the surjection required in §0.4. Section §10.1 permits weakly decreasing modified weights; retain this package's strict regularity assumption for its original D. This is supplier drift, including citations to nonexistent sections, not an undeclared mathematical gap.

## R03 (P1) — Representation supplier citations still use obsolete design numbering

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:178`, supplier list through line 208; also lines 30–41: “LR.5 target orlik-strauch-functor” and “LR.7 … ext-pi1”.

**Claim.** These are the supplier's present layers and target identifiers; compact distributions/coadmissibility are owned by LocallyAnalyticDistributionsPartII ND.0–ND.3.

**Witness.** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:931` has Orlik–Strauch in §6.1; line 1302 has ext-pi1's content in §8.12; line 1510 has σ-Ext in §10.5. Neither LR numbering nor the cited slugs have a preservation map.

**Exact repair.** Cite the available supplier README's numbered sections by content throughout. In particular:

| Interface | Present supplier section |
| --- | --- |
| Completed external tensor products | §0.9 |
| Admissible external tensor products; Ext; extensions; tautological extensions | §§1.5, 1.7, 1.8, 1.9 |
| Orlik–Strauch functor | §6.1 |
| Closed induction; Jacquet interfaces | §7.3; §§7.1–7.2 and the supplier's imported Jacquet contract |
| Conventions; A; principal series; constituents and labels | §§8.1–8.5 |
| V; self-extensions; constituent Ext; ζ_w; Ext into PS₁ | §§8.7–8.11 |
| Ext into V; finite-slope amalgam; Ext filtration | §§8.12–8.14 |
| Seven parabolic interfaces | §§9.1–9.7 |
| Seven single-embedding interfaces | §§10.1–10.7 |

The ancillary ownership sentence needs correction too: `packages/LocallyAnalyticDistributionsPartII/README.md:3` imports the compact distribution algebra, Fréchet–Stein and coadmissible theory from PadicLocalLanglandsForGL2Qp §0.1; it no longer owns them under ND.0–ND.3. That actual owner is readable at pull request #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, with the Fréchet–Stein/coadmissibility statements at line 219. Keep the main consumption through the locally analytic representation supplier.

The content survives: §8.12 gives 10 for the rank-three Ext dimension, §9.6 gives 7 for each (2,1) endpoint, and §10.5 gives the embedding decomposition. Only the citation/ownership repair is required, not replanning those results. `roadmaps show` did not expose this supplier as an open content pull request; its board README was read directly, rather than reporting it nonexistent.

## R04 (P2) — The Harish–Chandra gap requests an existing earlier interface

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:164`: “What LieHighestWeight must provide (gap:split-gln-harish-chandra)”.

**Claim.** Split reductive Harish–Chandra theory over the finite coefficient field remains missing from earlier suppliers.

**Witness.** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:749` states split reductive Harish–Chandra theory over any characteristic-zero field, its dot-invariant isomorphism and central-character orbit criterion, with products over embeddings. Line 747 identifies the section.

**Exact repair.** Import that supplier's §4.1, including its Verma characters, instead of requesting the same theory from LieHighestWeight again. Retire the fulfilled gap in the README and reconcile its top-level plan gap entry. Retain this package's ordinary-variable normalisation as the explicit translation μ↦μ−θ in §2.6, with the repaired numerical Check. This is a simple change of coordinates, not another foundational Harish–Chandra theorem.

Test: in gl₂ over ℚ_p the supplier's dot action on ν=(3,2) has partner (1,4). Adding θ gives μ=(3,1) and μ′=(1,3), exactly the ordinary permutation orbit. Their shifted invariant values are both (5,21/4). No algebraic closure of E or new split reductive carrier is needed. F01's mathematical correction remains valid; its old claim of minimality no longer holds against the available supplier.

## R05 (P3) — The parabolic headline is missing from the module docstring

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:13` promises “compatibility with parabolic induction”; `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean:29` proceeds directly to embedding decomposition.

**Claim.** The docstring records every headline that cannot be stated at the pins.

**Witness.** The README's §§3.1–3.2 are the parabolic comparison and induced minimal-subrepresentation results. Neither is named in the docstring's headline list. The file contains zero theorem declarations.

**Exact repair.** Add a docstring item naming §§3.1–3.2, Ding Proposition 3.27 and Remark 3.28, and the missing admissible locally analytic representations, closed parabolic induction, completed Levi tensor products, and comparison maps. Do not add a stand-in theorem. The pin search confirms these carriers are absent; a docstring-only repair keeps the acceptance file honest.

## R06 (P3) — The rank-three flag Check does not specify its Hodge line

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:971`: “σ-Hodge flags spanned by (e_1 + e_2, e_1 + ae_2 + e_3)”.

**Claim.** These data specify noncritical flags with distinct isomorphism classes as a varies.

**Witness.** The displayed pair specifies a plane. Taking its first vector as the flag line gives (1,1,0), violating noncriticality. Planes alone for a=2,3 are related by diag(1,1,1/2), so they do not recover a.

**Exact repair.** Specify the plane as span(e₁+e₂,e₁+ae₂+e₃) and its Hodge line as E(e₁+ae₂+e₃), with the weight jumps or the line-inside-plane order explicit. Cite the corrected supplier §10.7 and DING25 Example 2.9, printed pp.14–15, DING25 lines 629–644. State this as the crystalline example over K=ℚ_p, choosing generic unramified parameters.

Test: for a=2 the line is (1,2,1) and plane normal (1,−1,1); for a=3 they are (1,3,1) and (1,−1,2). Dot products are zero and all coordinates are nonzero. A diagonal automorphism preserving the plane's intersection E(e₁+e₂) with E e₁+E e₂ forces its first two scalars equal; matching the Hodge lines then forces a to agree. This supplies the distinguishing datum missing from the Check.

## R07 (P3) — Two negative-control Checks fail when the kernel vanishes

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:619`: “since Ext¹_G(A, 𝒦_D ⊗ A) ≠ 0”; line 658: “The split extension … violates (1)”.

**Claim.** These assertions hold under (H), which includes n=1 and n=2.

**Witness.** At n=2, c₂=0 and 𝒦_D=0. Hence Ext¹_G(A,0)=0. The split extension V⊕0 is V=π_min(D), with socle A, and satisfies condition (1).

**Exact repair.** Qualify both negative controls by 𝒦_D≠0 (equivalently n≥3 here). Add the n≤2 alternative explicitly. The other split-extension Check at lines 584–585 already has the necessary condition.

Test over ℚ_p: n=2 gives Ext dimension 0 and socle multiplicity 1; n=3 gives Ext¹_G(A,A) dimension 4 and split socle multiplicity 2. Thus the intended negative controls discriminate exactly in the qualified range.

## R08 (P2) — Non-directness needs hypotheses absent from the spanning theorem

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:352`: “For n ≥ 1 and any abelian group H_char”; lines 354–355: “it is not a direct sum”.

**Claim.** The sum H_Z+ΣH_j is never direct for that full range.

**Witness.** For n=1,H_char=ℤ, there is just H_Z=ℤ and no H_j: the sum map is the identity, with kernel 0. For trivial H_char every summand is zero at every n.

**Exact repair.** Keep the telescoping identity for all n≥1 and all abelian groups. State non-directness only for n≥2 and nontrivial H_char; mention that the p-adic character space meets the latter hypothesis. Add n=1 and trivial H_char as positive direct-sum controls.

Test: for n=2,H_char=ℤ, (1,1) in H_Z and (−1,−1) in H₁ sum to zero and are nonzero, proving the corrected negative assertion. At n=1 the unique summand still maps by the identity. The source's erroneous (3.43) is used in the interior-refinement case; its correction need not overclaim in rank one.

## R09 (P3) — The build-order summary contradicts Layer 5's dependencies

**Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:288`: “Layers 2 and 5 depend on Layer 1 but not on each other”.

**Claim.** Layer 5 has no dependency on Layer 2.

**Witness.** The same README line 1128 gives §5.5's Needs as §§2.1,5.4; line 1147 lists Layers 1–2 as Layer 5 dependencies. Its conclusion identifies the §2.1 object π_min(D).

**Exact repair.** Say that Layer 2 depends on Layer 1, §§5.1–5.4 reformulate Layer 1 using universal extensions, and §5.5 also uses Layer 2's minimal representation. Test the graph on §5.5: the edge 2.1→5.5 is retained, with no reverse edge and no cycle.

## Verified sound

### Scope, principles and coverage

The general setting retains every prime, every finite K/ℚ_p, a finite splitting coefficient field E, and non-étale crystabelline D. There is no good-prime restriction, route-specific replacement, algorithm, copied source passage, or attempt to rebuild the two input theories. Ding's comparison and the constructions from its kernel belong here; the representation and deformation theories remain with their named suppliers. The new findings are repairable and do not require rejection of the scope.

All 30 target subsections and their API bullets, examples and Needs were read. The prior review's numerical rows were used as leads for unchanged material, not as certificates for the new supplier heads. The 15 seeded targets were checked again against the source; §§2.1,3.4,5.2 and the repaired text received fresh object-level checks. Source paragraphs used inside proof routes were read, including the gluing, surjectivity of push-forward, universal induction and recovery diagram. The two source works are both recorded with legal cached copies and version information. No author-flagged unverified locator was found; no new source fetch was needed.

The README has the required Summary, Scope, Conventions, contracts, build guide, six layers, layer Examples/Dependencies, consumers and references. Every target has a locator and stated or standing hypotheses; every construction has prose API bullets. Checks per subsection are:

- Layer 0: 4,4,3,4.
- Layer 1: 4,4,3,4,3,3.
- Layer 2: 4,4,3,3,4,4.
- Layer 3: 4,4,4,4,3,4,3.
- Layer 4: 3,4.
- Layer 5: 5,4,3,5,3.

Those counts do not certify their truth: R01 and R06–R08 identify the failed discriminating tests. The three roadmaps read on main for form/context were `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, `TauCetiRoadmap/ReflectionInvariantTheory/README.md`, and `TauCetiRoadmap/OptimalTransport/README.md`. No process identifiers, machine paths, LaTeX delimiters, or invented local Lean declarations were found in the target README/Lean file. Backticked mathematical expressions are notation; the five `PhiGamma.*` names in the LocalGaloisDeformationRings contract are explicitly supplier API names, not alleged pin declarations.

### Source sample

Printed pages refer to the published DING25 copy and the explicitly cited arXiv v5 of CEGGPS16. Quotient overlines were checked against their definitions; the recovery diagrams were also viewed in the PDF.

| Sampled target | Verified locator and source lines | Result |
| --- | --- | --- |
| 0.2 Block character directions | DING25 (2.21), Cor.2.15, pp.19–20, lines 862–909; proof Thm.3.21, p.49, lines 2188–2209 | Block determinant pullbacks and Weyl transport supported. Restriction to the block centre multiplies by j,n−j, invertible in E even when p divides them. |
| 0.3 Levi-centre spanning | DING25 (3.43) and conclusion of proof, pp.49–50, lines 2189–2222 | Telescoping repairs the source's false direct sum. The roadmap's own boundary overclaim is R08. |
| 1.2 Endpoint gluing | DING25 proof Thm.3.21, pp.48–49, lines 2096–2163; Prop.3.13, p.44, lines 1909–1918 | Correct endpoint families, lower-rank weights and signed descent. |
| 1.3 Every refinement | DING25 (3.42)–(3.43), pp.49–50, lines 2164–2222 | Block Weyl transport plus spanning proves the interior cases; no directness needed. |
| 1.6 Kernel transversality | DING25 Lemma 3.23, p.50, line 2228 | Correct; each refinement restriction is injective. |
| 2.1 Minimal/finite-slope extensions | DING25 definition and (3.44), p.50, lines 2229–2237 | Correct tautological inclusion class, push-out and recovery of the kernel subspace. |
| 2.2 Push-forward | DING25 (3.45) and following paragraph, p.50, lines 2239–2249 | Surjectivity is separately attributed to Lemma 3.5(2), not inferred from the truncated exact sequence. Boundary Check needs R07. |
| 2.4 Intrinsic characterisation | DING25 Cor.3.25, p.51, lines 2258–2271 | Both socle and every-refinement compatibility conditions retained. Boundary Check needs R07. |
| 2.5 Determinant character | DING25 definition before Prop.3.26, p.51, lines 2272–2279; conventions §2.1 and §3.1 | The corrected embedding-indexed exponent and ε^(−N) determinant twist agree. |
| 3.4 Single-embedding minimum | DING25 Remark 3.30(2), p.54, lines 2406–2410 | Correct subextension and maximal partial algebraicity. |
| 3.5 Embedding decomposition | DING25 Cor.3.31 and proof, p.54, lines 2411–2427 | Kernel direct sum, representation amalgam over A, not representation direct sum. |
| 4.1 Embedded relation | DING25 (3.52), p.55, lines 2471–2487; (3.53)–(3.54), p.56, lines 2505–2528; (2.42), p.32, lines 1367–1372 | **Fails:** full Ext replaced the parabolic image spaces. R01 supplies the tested correction. |
| 4.2 Recovery | DING25 Thm.3.34 and proof, p.56, lines 2490–2529; Cor.2.38, p.32, lines 1367–1372 | The theorem's hypotheses and two directions agree. The route needs corrected §4.1; the flag Check needs R06. |
| 5.3 Universal character induction | DING25 Lemma 3.35, (3.56)–(3.57), p.58, lines 2580–2598 | Closed induction, push-out and radical action agree with the source. |
| 5.4 Universal Artinian action | DING25 Thm.3.36, (3.58), pp.58–59, lines 2602–2617 | Correct action formula and uniqueness from generation; the codomain misprint is corrected. No false equality U_w=U[I_w] is claimed. |

Also checked: DING25 Prop.3.26, pp.51–52, lines 2280–2342; Prop.3.27 and Remark 3.28, pp.52–53, lines 2343–2380; Cor.3.32–3.33, p.55, lines 2430–2487; §3.2.2, pp.56–57, lines 2533–2577; Cor.3.37, p.59, line 2619. CEGGPS16 Lemma 3.22, arXiv v5 p.47, line 1921, is the E-rational invariant-centre statement. The completion assertion additionally uses a trivial stabiliser at a generic ordered tuple, as DING25 lines 2555–2561 explain. It is not attributed to an unrestricted étaleness assertion at coincident characters.

### Computed adversarial table

These are concrete checks of definitions, conventions and consistency, not a claim that numerical dimensions alone prove the future theorems. R01 illustrates why the actual defined source must be computed before using the claimed dimension. Degenerate instances outside (H)—rank zero, characteristic-p coefficients, nonfields, nonregular original weights—were tested for admissibility and are excluded by the stated hypotheses, not silently admitted. The abelian-group theorem §0.3 does admit the trivial group and rank one, giving R08.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: norm and cyclotomic twist | Uniformiser with residue degree f; n=2 | v_p(Nϖ_K)=f, so abs(Nϖ_K)=p^(−f)=abs(ϖ_K)_K; ε^(−1)∘θ at diag(x,y) is ε(y)=z(y)abs(y), equal to ηz^(−θ) | Consistent for ramified and unramified K; no division by p in E is forbidden. |
| 0.1 Endpoint families | n=1,2,3; w=(123) | n=1: 1=0! in both families; n=2: {id} and {(12)}; (123)(3)=1 while its inverse sends 3 to 2 | Correct inverse convention; endpoint families are not both subgroups. |
| 0.2 Block directions | n=3,j=1; n=2,j=1,p=2 | (a,b,b) pulls back to a(t₁)+b(t₂t₃); centre restriction is a(x)+2b(y). At p=2, 2·(1/2)=1 in E | Correct determinant direction; dim H₁=2(1+d_K), not 1+d_K. |
| 0.3 Spanning and non-directness | v=(5,2,−1); n=1; H=0 | (−1,−1,−1)+(3,0,0)+(3,3,0)=(5,2,−1). For n=1 the sum map is id with kernel 0; for H=0 all spaces are 0 | Identity holds; non-directness fails without R08. |
| 0.4 Refinement presentation | n=3,d=1; n=1 | dim C=6·6=36; ker R dimension 36−10=26; ker s dimension 36−9=27. At n=1 both kernels have dimension 0 | Quotient Q is essential: full Ext retains the one-dimensional Ext₀ killed by κ. |
| 1.1 Kernel coefficient | n=0,…,5 | c_n=0,0,0,1,5,16; c₄=2c₃+3=5; c₅=2c₄+6=16. At n=0 the natural subtraction is 1−1=0 | Correct recurrence and subtraction; geometric rank zero excluded. |
| 1.2 Gluing | Nonzero shared b; n=2; h=(3,1,−2) | t_F(b)−t_G(b)=0 versus 2t_F(b); blocks have weights (3,1) and (1,−2); rank-two endpoints cover both permutations | Correct signed descent; agreement only on the n-dimensional g-part would miss d_K directions. |
| 1.3 Interior refinement | n=3,w=(23) | (23)(23)=id sends 3→3; (12)(23) sends 3→1. H-space spanning has dimension 6, versus 10 for the false external direct sum | Correct transport/spanning route. |
| 1.4 Comparison headline | Rank one, ψ=ord_K; general uniqueness | ord_K(ϖ_K)=1 on both parameter sides; t_D(ζ(ψ))=κ⁻¹(ψ). If two maps agree after R_D, their difference is 0 since im R_D=𝔈 | Correct source formulation; zero map fails on ψ. |
| 1.5 Kernel dimension headline | d=1,n=1,…,5; n=3,d=2 | (dim𝔈,dimQ,dimker)=(2,2,0),(5,5,0),(10,9,1),(19,14,5),(36,20,16); for d=2:17−15=2 | Correct rank–nullity arithmetic. |
| 1.6 Transversality | b=ζ_w(ψ), t_D(b)=0; n=3,d=1 | a_wκ_w⁻¹ψ=0 gives ψ=0 and b=0; a nonzero ψ has nonzero image. Dimensions 1 and 6 inside 10 alone would allow intersection 1 | Correct argument uses injectivity, not the dimension count. |
| 2.1 Kernel extensions | n=2 and n=3,d=1 | c₂=0 gives quotient 0 and π_min=V; c₃=1 gives class k↦k, not the zero class; push-out preserves quotient dimension 1 | Correct tautological versus split model. |
| 2.2 Push-forward | k in kernel; n=2,3,d=1 | f_D(k)=0; dimensions 10−1=9 at n=3. At n=2 Ext¹(A,𝒦⊗A)=Ext¹(A,0)=0, not nonzero | Theorem consistent; R07 fixes the Check. |
| 2.3 Refinement images | n=3,d=1 | dim𝔈_w^min=6=dimQ_w; dim𝔈_g^min=3=dimQ_g; full de Rham Ext dimension 4 is different | Correct quotient/image conventions. |
| 2.4 Characterisation headline | n=2 split; n=3 split and a different line L | Split socle multiplicities 1+0=1 and 1+1=2. For L≠𝒦, ker(f_L)=L whereas compatibility forces ker(t_D)=𝒦 | Both characterisation conditions retained; R07 qualifies the split negative control. |
| 2.5 Determinant character | n=1; n=2 at two embeddings; n=3 | N₁=0; exponent sums (2,0),(5,1) give (2,6), not (8,8); at n=3, (Σh+3)−3=Σh and abs³·abs^(−3)=1 | Correct twist and labelled exponent. |
| 2.6 Character headline and repaired normalisation | h=(3,1), repeated h=(1,1); n=2,p=2 | Jacobian determinants 2 and 0; 2≠0 in ℚ₂. e(h)=(4,3), e(λ+ρ)=(5,21/4); wrong dot partner gives (5,9/4) | F01 repaired. Scalar radical part on 𝒦 is d_inf(k)=HC(d_Sen(0))=0. Ownership needs R04. |
| 3.1 Parabolic headline | P=B,G; blocks (2,1),(3,1),(2,2) | Sum of block coefficients is 0,c_n,0,1,0 respectively; for n=4 the full coefficient is 5 | Correct block kernel formula; do not replace by the full kernel. |
| 3.2 Parabolic minimum | n=4,blocks(3,1); P=B,G | Quotient multiplicities d versus 5d; θ^P=(0,0,0,−3) gives twist 1⊠ε³. P=B gives V; P=G gives π_min | Correct image-space formulation already present here. |
| 3.3 One embedding | n=3,d=2; derivative at σ or τ | dim𝔈_σ−dimQ_σ=10−9=1 versus 17−15=2 globally; derivative at τ≠σ is 1 for log_τ and 0 for log_σ | Correct “de Rham away from σ” convention. |
| 3.4 One-embedding minimum | n=2,3; one/two embeddings | Quotient multiplicity c₂=0,c₃=1; at d=1 the partial object is the whole object. Off-σ constituent count is nonzero for n=2,d=2 | Correct maximal partial algebraicity, excludes replacing π₁,σ by V. |
| 3.5 Embedding decomposition headline | n=3,d=2 | Kernel dimensions 1+1=2; 𝔈 dimensions after common g quotient: (10−3)+(10−3)=17−3=14; direct representation sum would have socle multiplicity 2 instead of 1 | Correct direct sum for kernels, amalgam for representations. |
| 3.6 Modification | Off-σ weights (3,1,0); d=1 | Modified weights (0,0,0); regularity differences 2,1 become 0,0. At d=1 T_σ=id and ker(T_σt)=ker t | Transport correct; original regular theorem is not reapplied to D_σ. |
| 3.7 Minimal Ext comparison | n=2,3 | 5−0=5 and 10−1=9; parabolic (2,1) target dimension 5+2=7 | Correct use of parabolic images; R01 must preserve it. |
| 4.1 Embedded relation | n=3,d=1; sum sign | Defined full source:20→9, kernel11. Intended restricted source:14→9, kernel5. For nonzero target class x, x+(−x)=0 but x+x=2x≠0 | **False identification**, R01. |
| 4.2 Recovery headline and example | n=2,d=1,2; rank-three a=2,3 | One embedding: diagonal torus transitive on lines E(1,a),a≠0. Two embeddings retain the ratio a_τ/a_σ. Rank-three corrected normals/lines: (1,−1,1)·(1,2,1)=0 and (1,−1,2)·(1,3,1)=0 | Source theorem sound after relation repair; R06 fixes the incomplete flag. Modified isomorphism classes need not determine D for d>1. |
| 5.1 End(D) and Artinian algebras | n=2 noncritical line; n=3,d=1 | diag(a,b)(1,1) preserves its line iff a=b; A_D,A_Dw,I_w,R_D/𝔪² dimensions 10,7,3,11; cotangent inclusion 9→10 | F04 repaired; formal smoothness/tangent owners exist. |
| 5.2 Universal extensions and actions | Zero/nonzero coefficient b; radical x,y | Pullback classes 0 and b; x(ζ_w⁻¹b)=1 produces a, while x(ζ_w⁻¹b)=0 produces 0; p(i_A(a))=0 gives xy=0 | Correct tangent/cotangent variance, not a dual-basis inversion. |
| 5.3 Closed induction | n=1; n=3,d=1 | n=1: θ=0, PS₁=A=δ and U_w=U; rank-three quotient multiplicity n(1+d)=6 | Matches Lemma 3.35; full induction is a different object. |
| 5.4 Universal action headline | b in 𝒦; t_D(b)≠0; x in I_w | x(t_D(b))=0 for every x if b∈𝒦; choose x(t_D(b))=1 otherwise. On U_w, x vanishes on Q_w, giving 0. Every product of radical operators is 0 | Correct formula, compatibility, and uniqueness from ΣU_w=U. |
| 5.5 Annihilator headline | n≤2 and n=3,d=1 | Annihilator quotient over V has multiplicity 0 and 1; U/V has multiplicity 10 at n=3; radical image is A, so U/𝔪U=U/A | Correct distinction between annihilator and quotient. R09 fixes its layer dependency. |

### Pin audit, elaboration and padding

The manifest pins inspected are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. They differ from the pins quoted in the previous review, so the library checks were repeated.

The required `lake env lean` invocation on `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`, run from the content checkout using the absolute tool argument, exited 0 with no output and no warnings. The file has one `import Mathlib`, one module docstring, the required namespace and **zero declarations**. Therefore there are zero sorried theorems to try with the one-tactic probe, zero retained definitions requiring signature comparisons, zero `#check @localName` obligations, zero sorry'd data, and no padding or `set_option`. No Tau Ceti module build was needed. All commands completed.

A separate scratch file checked the twelve named Mathlib suppliers in the exact contract, plus the older root-level Ext, in one elaboration; it also exited 0 without warnings. In particular `CategoryTheory.Abelian.Ext` really exists: its source is the newer derived-category file, not the older root-level `Ext` functor at `Mathlib/CategoryTheory/Abelian/Ext.lean:41`. This possible false positive was resolved before reporting.

| Declaration opened | File at pin and line | Relevant content/hypothesis |
| --- | --- | --- |
| `LinearMap.ker` | `Mathlib/Algebra/Module/Submodule/Ker.lean:59` | Kernel is comap of bottom. |
| `LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean:57` | Range carrier is the actual set range; semilinear version requires a surjective scalar homomorphism. |
| `LinearMap.prod` | `Mathlib/LinearAlgebra/Prod.lean:95` | Pairing two maps with common source. |
| `LinearMap.quotKerEquivOfSurjective` | `Mathlib/LinearAlgebra/Isomorphisms.lean:47` | Requires surjectivity; no comparison map constructed by it. |
| `LinearMap.finrank_range_add_finrank_ker` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:173` | Finite source module, rank-nullity hypotheses; applies over E. |
| `Submodule.finrank_sup_add_finrank_inf_eq` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:53` | Both submodules finite-dimensional. |
| `Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean:61` | Linear maps to the coefficient ring. |
| `Equiv.Perm` | `Mathlib/Logic/Equiv/Defs.lean:94` | Self-equivalences of the supplied type. |
| `TrivSqZeroExt` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:68` | Carrier R×M; multiplication has radical product zero. Does not supply a deformation tangent space. |
| `DualNumber` | `Mathlib/Algebra/DualNumber.lean:46` | Specialisation `TrivSqZeroExt R R`. |
| `IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean:30` | Includes nontriviality; the zero ring is excluded. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Actual shifted derived morphisms with `[HasExt C]`; not an analytic representation category. |
| `LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84` | Native additive/scalar-compatible maps; also implicit in every successful linear-map signature check. |
| `Submodule` | `Mathlib/Algebra/Module/Submodule/Defs.lean:39` | Additive submonoid stable under scalar action; no analytical structure. |
| `TauCeti.hcProjection` | `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:437` | Unshifted central projection, under `[IsKilling K L]` at line 88 and splitting Cartan hypotheses. |
| `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` | Same file, line 403 | Evaluation of the Cartan projection gives the Verma character. |

Object searches in both pinned libraries for Robba, PhiGamma, crystabelline and locally analytic representation carriers returned no carriers for the headline statements. Generic linear maps, Ext, square-zero algebras and the semisimple Harish–Chandra projection do not make Ding's actual objects statable. The zero Killing form in gl₁ and the central kernel in gl_n explain the Tau Ceti limitation explicitly.

| README headline | Status at pins / docstring |
| --- | --- |
| Comparison §1.4 | Not statable; missing locally analytic and Robba carriers; named at Lean line 14. |
| Kernel dimension §1.5 | Not statable on the actual t_D; named at line 20. |
| Intrinsic characterisation §2.4 | Not statable; missing representations and socles; named at line 22. |
| Central and infinitesimal characters §2.6 | Not statable; missing π_min and its actions; named at line 25. |
| Parabolic comparison/minimal induction §§3.1–3.2 | Not statable; **missing docstring item, R05**. |
| Embedding decomposition §3.5 | Not statable; named at line 29. |
| Recovery §4.2 | Not statable; missing D_σ and π_min; named at line 31. |
| Universal action §5.4 and annihilator §5.5 | Not statable; named together at line 34. |

No statable headline was found omitted or replaced by a free-variable stand-in. Layer 0's elementary identities and c_n are statable but remain appropriate README material.

### Supplier order, ownership and overlap

The board package index was read before judging availability. The supplied overlap report found no competing head changing this roadmap, dropped cited ids, or open-revision-only ids. Those empty rows do not resolve this package's stale design citations: R02 was established by reading #1829's actual README, and R03 by the actual board supplier files.

The dependency command was run with the specified name, order, movable flag and content checkout. Its complete output was:

```text
depcheck: 234 roadmaps, 2117 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The available order puts LocallyAnalyticDistributionsPartII at 199, LocallyAnalyticRepresentationsOfLocalGroups at 253, TriangulineVarietyAndItsLocalModel at 259, and this roadmap at 260. LieHighestWeight is on main. All named suppliers are earlier; no forbidden supplier is used. Local lower-rank use of Theorem 1.4 is strong induction, not a circular same-rank premise. The dependency command checks roadmap edges; it does not validate the section-level citations or the contradictory prose in R09.

Every cross-roadmap citation family was resolved by object:

| Supplier | Resolution and inspected locations |
| --- | --- |
| LieHighestWeight on main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:77`, Layers 3,7,9 at lines 405,931,1432. Algebraically closed base convention and dot/linear invariants distinguished. No dependency on its open revision was used. |
| LocallyAnalyticRepresentationsOfLocalGroups | Board README §§0.9,1.5,1.7–1.9,6.1,7.1–7.3,8.1–8.14,9.1–9.7,10.1–10.7 provide the intended objects. R03 gives the current sections. §4.1 already supplies the R04 gap. |
| TriangulineVarietyAndItsLocalModel, #1829 | Current Layers 10–13 supply the original/modified parameters, quotient tangent spaces, transport, refinement spanning and relations. Especially README lines 1371,1467,1515,1625,1713,1729,1873,1903,2083,2179,2207,2237. R02 repairs the old locations. |
| PhiGammaModulesAndIwasawaCohomology, #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md`: §§1.0,1.2,1.6,3.4a,3.6,7.1,7.2,7.2a,7.3,7.4,7.5 at lines 572,868,1026,1520,1751,2800,2848,2881,2912,2953,3008. Field/finite-local coefficients, Tate character, Sen and character weights, rank-one criterion and triangulations match. |
| PadicHodgeTheory, #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:934` (§4.5) imports the B-pair and supplies labelled lattices; line 999 (§5.2) supplies Berger modification with finite descent. The selective construction remains a declared contract. |
| LocalGaloisDeformationRings, #923 | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1234` (§0.4), line 1612 (§1.23). The five cited `PhiGamma.*` API names occur at lines 1618–1622. End(D)=E, generic noncritical hypotheses, deformation tangents and first-order Cartesian comparison are present. Resolver's pin-name warnings about them are false positives: they are supplier names. |
| SmoothRepresentationsOfLocalGroups, #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2710`, §SR.3.2, has the complex Bernstein decomposition/centre. The finite-E completion interface is declared rather than falsely attributed to that complex statement. |
| LocallyAnalyticDistributionsPartII / PadicLocalLanglandsForGL2Qp | The former's board README scope explicitly imports compact distributions/coadmissibility from the latter's §0.1; #1312 README lines 205–219 were read. R03 corrects the indirect attribution. |

Ownership searches used `roadmaps grep` over main and open heads and object searches in the board packages and pinned libraries. The closest open roadmaps were read: TriangulineVarietyAndItsLocalModel #1829 owns the deformation side, not t_D; CompletedCohomologyAndLocalGlobalCompatibility #1270 owns arithmetic/global comparisons; LocalGaloisDeformationRings #923 owns deformation rings; PadicLocalLanglandsForGL2Qp #1312 owns the GL₂ correspondence; PhiGammaModulesAndIwasawaCohomology #1310 owns Robba foundations. None owns this package's Ding comparison and its kernel extension. The genuine overlap is R04's split reductive Harish–Chandra input. Source citations to Ding elsewhere are not duplicate ownership of §3.2. No local Lean declarations exist, so there is no fully qualified name collision.

This was a head-catalogue object search plus targeted reading of the closest owners, not a mathematical review of every target in all 435 open pull requests. No conclusions about unrelated unavailable heads are needed.

The plan and README have matching slugs for all three declared gaps. The selective-modification gap has a named earlier owner and a concrete lattice, cutoff and filtered comparison; DING25 lines 560–578 support its construction. The Bernstein-completion gap distinguishes the finite-E, ordered, generic completion interface from the complex supplier. Both remain legitimate conditional supplier contracts. The Harish–Chandra gap is mathematically precise after F01, but not minimal, by R04. This needs-changes verdict is not conditional acceptance, so no `conditional_gaps` acceptance field is emitted.

## Not verifiable

- The published CEGGPS pagination was not separately opened. The actual citation uses arXiv v5, Lemma 3.22, p.47, which was read; its manifest version note makes this limitation harmless.
- The catalogue has no open content pull request for LocallyAnalyticRepresentationsOfLocalGroups or LocallyAnalyticDistributionsPartII. Their supplied board package READMEs were inspected, so their contents and the witnessed drift are verifiable, but no unseen content-PR head is certified here.
- Future proofs are not certified by the empty Lean acceptance file. Source support, explicit computations and supplier resolution are the evidence supplied above. No requested source text was inaccessible, and no missing-reference request was created.

## Source issues

- **Error** in DING25 at (3.43), proof of Theorem 3.21, printed page 49: the source says the full torus character space is a direct sum of all maximal-Levi-centre spaces and the centre space; it should be their sum with overlaps, as 10≠6 in rank three over ℚ_p; affects the proof.
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, printed page 51: the source says the exponent is summed over both coordinate and embedding indices; it should be the tuple of coordinate sums, one per embedding; affects a stated result.
- **Gap** in DING25 at the proof of Proposition 3.26, printed page 51: the source says polynomiality of the invariant algebra gives a bijective tangent map; it should use regularity and the nonzero Vandermonde determinant at h; affects the proof.
- **Gap** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, printed page 56: the source says overlined analytic Ext terms identify with the block-product space, without defining their restriction; it should specify the parabolic push-forward image spaces from (3.52), with dimensions 7+7 rather than unrestricted 10+10; affects the proof.
- **Misprint** in DING25 at the paragraph after (3.54), printed page 56: the source says replacement by D′_σ again yields the relation attached to D_σ; it should yield the relation attached to D′_σ; affects the proof.
- **Misprint** in DING25 at the first paragraph of the proof of Theorem 3.34, printed page 56: the source says the only-if direction follows from Corollary 3.32 and proves the if direction by induction; it should interchange those direction labels; affects the proof.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, printed page 58: the source says the radical operator ends in a refinement universal extension; it should end in the full universal extension; affects the proof.
- **Misprint** in DING25 at the proof of Corollary 2.14, printed page 19: the source says the quotient paraboline dimension is d_K dim(B∩L_P)−n; it should be d_K dim(B∩L_P)+n; affects the proof.
- **Misprint** in DING25 at the definition before Corollary 2.38, printed page 31: the source says the third endpoint of the relation is D₂,σ; it should be C₁,σ; affects a stated result.
- **Misprint** in DING25 at the paragraph after (3.30), printed page 43: the source says the endpoint inductions use P₁⁻ and P₂⁻ with the displayed twists on the opposite blocks; it should use P_(n−1)⁻ and P₁⁻ with twists 1⊠ε^(n−1) and 1⊠(ε∘det); affects the proof.
- **Misprint** in DING25 at (3.12), (3.15) and (3.33), printed pages 38–39 and 46: the source says constituent labels range over subsets of the first n−1 indices; it should allow every nonempty proper subset of all n indices, giving 2ⁿ−2 labels per embedding; affects a stated result.
- **Misprint** in DING25 at the proof of Lemma 2.11, printed page 16: the source says the last triangulation parameter has algebraic factor z^(h₁); it should have factor z^(h_n), as required by the ordered weights; affects the proof.
