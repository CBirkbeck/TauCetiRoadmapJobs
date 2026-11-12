<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6782627510 -->
Review (codex) of 40050a9

Verdict: needs_changes

1. **F01** (P1) Several PAI supplier citations no longer supply their claimed results

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:232`, :252, :260, :262 and :269. For example: “automorphy lifting for potentially diagonalizable representations (§6.5, BLGGT 4.2.1)”. The gap descriptions at :275 and :277 also describe obsolete sections.

   **Claim.** These numbered sections currently supply the stated prerequisites. Some no longer exist, and others now contain different mathematics. These are non-gap citations, not findings against the absence of a declared contract.

   **Witness.** PR #2135, head `4777c48`, `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:80`–106 maps PL identifiers and old §8.17 only; :632 is symmetric-power diagonalizability, :1642 is §7.19, :2059 is §9.8. §§1.6,6.5,7.20,9.9 are absent.

   **Repair.** Resolve by the result, update the exact contracts and every associated Needs/proof citation, and preserve the existing suppliers' hypotheses. The verified replacement map is:

   | Consumed result / old citation | Actual current owner and section (README line) |
   |---|---|
   | Ordinary/Fontaine–Laffaille potential diagonalizability, PAI §1.5 | ModularityAndLanglandsExtensions §2.1; explicitly assigned there by PAI scope line 59 and mapping line 87 |
   | Potentially Barsotti–Tate rank two, PAI §1.6 | PAI Part II §1.4 (:618), still `l>2` |
   | Potentially diagonalizable lifting, PAI §6.5 | ModularityAndLanglandsExtensions §2.16; PAI mapping :98 assigns §§2.15–2.16 to the parent |
   | Weak-primitive generic restriction, §7.13 | §7.13 (:1554), with its current title “Absolute irreducibility at a generic prime survives restriction” |
   | Weak-primitive generic R=T, §7.20 | §7.19 (:1642) |
   | Sum-of-characters finiteness, §8.10 | §8.9 (:1812) |
   | Small reducible locus, §8.13 | §8.12 (:1854) |
   | Generic primes in large quotients, §8.14 | §8.13 (:1868) |
   | Prescribed-component global lifts, §8.15 | §8.14 (:1882) |
   | Automorphic prescribed-type lifts, §8.16 | §8.15 (:1896) |
   | ANT finiteness, §8.18 | §8.7 (:1777) |
   | Two-constituent lifting, §8.19 | §8.8 (:1795) |
   | Auxiliary-place finiteness, §8.20 | §8.16 (:1910) |
   | Adjoint Selmer vanishing, §9.7 | ModularityAndLanglandsExtensions §4.1; PAI scope :59 and mapping :103 |
   | Pseudodeformation ring at automorphic point, §9.8 | §9.7 (:2045) |
   | Ordinary tangent vectors, §9.9 | §9.8 (:2059) |

   Old §8.17 is not a broken citation: the supplier explicitly maps it to the parent's §4.2. Do not report or repair that as an unmapped deletion.

   Also update the two PAI gap descriptions in README and the plan's permitted `gaps` list. The auxiliary-place supplier now retains **geometric weak**, not strong, primitivity from §8.7, and §8.16 supplies the non-scalar auxiliary local/Hecke comparison. It additionally assumes no nontrivial l-power quotient of the cyclotomic restricted image. Import those supplied parts and specify only the remaining extension needed for nt26 Proposition 3.9, including any removal of that extra assumption and the second application. Do not delete the entire gap merely because its old number disappeared. The dyadic gap remains necessary, but its odd-prime comparison section is now §1.4.

   **Repair test.** The old §9.8 currently returns the tangent theorem, whereas the requested residue-field assertion is §9.7. The replacements above resolve both that wrong-result case and the absent §7.20 case. The gap's comparison test `Φ=diag(1,a)` has adjoint-twist eigenvalues `q,q,qa,q/a`; the current §8.16 already handles their being different from 1. This part must not be requested again as missing.

2. **F02** (P1) Residual attachment cites an absent supplier section

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:396`, :1148, :1159 and :1278: “AutomorphicGaloisRepresentations §§2.3, 6.2”.

   **Claim.** Section 2.3 supplies the residual eigensystems used for the level-one refinement argument.

   **Witness.** PR #1007, head `480c64f`, `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:18`–26 assigns residual attachment to AlgebraicModularFormsAndSerreWeights §7.3; :3066 is its DFG comparison. There is no §2.3 or old-to-new map preserving it.

   **Repair.** Cite `AlgebraicModularFormsAndSerreWeights §7.3` for residual attachment, lattice independence and coefficient transport, keeping AutomorphicGaloisRepresentations §6.2 only for its comparison/consequences. The replacement is at `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1535`; its exact reduction-image, weight, coefficient-place and semisimplification conditions must accompany use. It is earlier in the merge order. Update the supplier contract and all three uses in Layer 3.

   **Repair test.** For Δ at a good prime ℓ, the replacement supplies `X²−τ(ℓ)X+ℓ¹¹` after reduction. At ℓ=2 modulo 5 this is `X²−X+3`, with trace 1 and determinant 3. It supplies the actual residual object required, rather than a missing section name.

3. **F03** (P2) The KL classification still has two open owners

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:95` and :1630: “This roadmap owns the Kazhdan–Lusztig classification”.

   **Claim.** Later roadmaps consume this package's classification instead of constructing it again.

   **Witness.** PR #1815, head `b197d70`, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1694` defines the triples; :1722–1728 states and constructs the same classification for quasi-simple split adjoint groups.

   **Re-raised: FIX-PKG-ModularityAndLanglandsExtensionsPartII~3/R05.** The repair calls it applied but says the other roadmap's change is a maintainer note. That note does not establish a single owner at the supplied current head. The local direction-of-supply repair is correct; the cross-head overlap remains.

   **Repair.** Keep this earlier roadmap as owner of the general classification and simply-connected pullback. Coordinate the separate fix to #1815: replace its overlapping triple/classification construction with a citation of this package's §4.9, retaining its additional spherical/generic/Aubert refinements. Record the required merge ordering in the port's description. Do not add an upward dependency here or narrow §4.9 to PSp only. This review does not edit the other roadmap.

   **Repair test.** Both present targets classify PGL₂ with `s=diag(√q,1/√q)` and nonzero nilpotent e, yielding Steinberg. After repair, that bijection has one owner and #1815 only consumes it. The additional pullback remains here: the coroot lattice has index 2 in the adjoint cocharacter lattice.

4. **F04** (P2) Auxiliary sets are not required to be finite admissible sets

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:2281`–2283: “a set `X` of places of `L⁺` away from `p`”; :4049–4052 defines Q without finiteness.

   **Claim.** Every such datum has the stated ordinary Hecke algebra/global deformation ring, and the tensor datum gives the finite Taylor–Wiles diamond group and patching rings.

   **Witness.** nt21 line 3840 restricts X to the specified finite ramification set; nt26 line 1360 explicitly requires finite Q. Infinitely many proper Iwahori factors have empty interior in the adelic restricted product.

   **Repair.** Require X to be a **finite set of permitted split places**, with chosen lifts and the local residual/type conditions of the applicable source datum (nt21 §6, ct17 §5.1); specify its relation to the fixed ramification and excluded auxiliary sets. Require Q finite in §12.3 and its API, retaining `Q∩S=∅`, splitting, congruence and ordered-distinct-eigenvalue conditions. Do not replace these by an implicit appeal to a proof sketch. Add an infinite-set negative control.

   **Repair test.** For k Iwahori factors in rank two the index in the corresponding maximal compact is `∏_{i=1}^k(q_i+1)`; at infinitely many such places every basic adelic neighbourhood leaves some constrained factor unrestricted, so the product subgroup is not open. In the tensor example with every p-primary factor C₂, finite `|Q|=k` gives `|Δ_Q|=2^k`; an infinite Q gives an infinite product and destroys the asserted finite-group datum. Finiteness excludes both instances while retaining Q empty (`|Δ_Q|=1`).

5. **F05** (P2) The rewritten torus contract loses freeness and repeats a supplied action

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:328`, `gap:formal-torus-patching`, also in `design/plan.json`'s gaps. It assumes “compatible twisting actions” and concludes “the free `Ĝ_m^γ`-action”.

   **Claim.** Compatible finite actions, square-equivariant determinant maps and equivariant module/pseudodeformation actions imply a free patched torus action.

   **Witness.** Over `ℤ₂`, let `R′=ℤ₂[[y]]`, `δ=1+y`, and let λ act by `1+y ↦ λ²(1+y)`. All square-equivariance identities hold, but λ=−1 fixes every point. The stabilizer contains μ₂.

   The same action restricts compatibly to every μ_{2^N}. Its determinant-one fibre is `R=ℤ₂`; take `P=R` and both modules R with trivial μ₂ actions. Adding independent finite group-ring patching variables and free modules does not remove this stabilizer. Thus this is a missing hypothesis, not a difficulty proving freeness from the listed identities.

   **Repair.** Import the rank-two free patched action from `GL2ModularityLifting §§6.1,6.6`, and its fibre/torsor from §6.7 and `GlobalGaloisDeformations §4.11`. Current `TauCetiRoadmap/GL2ModularityLifting/README.md:1577` explicitly requires **free action chunks**; :1693–1719 retains that premise in the limit. Narrow the gap to the genuinely additional simultaneous action on P and the two modules and the required component-transitivity statement. If an abstract action-patching extension is retained, explicitly require compatible free action chunks on cofinal Artinian truncations, with their stabilizer detection and determinant-fibre comparison. Carry the same correction into the gap entry. This repairs both the missing hypothesis and the nonminimal request for an already supplied rank-two action.

   **Repair test.** In the countermodel, over `ℤ/4`, `−1=3≠1` fixes y, so the free-chunk premise fails. For the genuine translation action on `1+x`, λ=−1 sends `1+x` to `−1−x`, distinct modulo 4, while `δ=(1+x)²` remains square-equivariant. Its fibre has equation `x²+2x=0`, finite flat of degree 2. This separates freeness from square-equivariance.

6. **F06** (P2) The temperedness criterion does not define the factor being tested

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:1640`: “tempered exactly when the compact part of `s` (in a Jacobson–Morozov decomposition through `u`) is compact”.

   **Claim.** This is an exact iff criterion for temperedness.

   **Witness.** For PGL₂, take `s=diag(√q,1/√q)` and u=1. Its polar compact factor is 1, but its associated spherical representation is the trivial, non-tempered representation. With regular u, the same s gives tempered Steinberg.

   **Repair.** Define an s-adapted Jacobson–Morozov homomorphism φ through u and the **commuting factor** `s₀=s φ(diag(q^(1/2),q^(−1/2)))⁻¹`, with `s₀` centralizing φ. State that temperedness is equivalent to s₀ lying in a compact subgroup. It is not the compact factor in polar decomposition and must not be called compact before imposing the condition. Specify this factor and the same distinction in the API and Checks. The current #1815 §7.3 already gives this precise normalization, but remains a downstream roadmap, not a supplier here. kl87 remains cited by its settled locator.

   **Repair test.** At u=1 take φ trivial: `s₀=s`, with eigenvalue modulus √q>1. For the regular unipotent and standard φ: `s₀=1`, with both eigenvalue moduli 1. The corrected condition gives non-tempered and tempered respectively. This also prevents reintroducing the source's incorrect condition on s itself (ct17 Theorem 2.4(2a)).

7. **F07** (P3) The non-criticality proof uses the wrong Vandermonde variables and omits its final page

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:743`–744 and :752: “Lemma 2.29 and proof, pp. 44–45”; “a Vandermonde determinant in the powers of `a_τ`”.

   **Claim.** Distinct powers of the filtration parameter supply the nondegenerate matrix.

   **Witness.** nt21 lines 2191–2197 scale the parameter and use the exponent indices. For `a_τ=1`, indices `{0,2}` give derivative matrix `[[1,1],[0,2]]`, determinant 2; a Vandermonde on `(1,1)` has determinant 0.

   **Repair.** Describe the derivative/falling-factorial matrix after scaling the parameter; its determinant is, up to ordering sign, the Vandermonde product in the distinct **indices**, not in powers of `a_τ`. Cite pp. 44–46, since the determinant computation ends on p. 46. Add `a_τ=1`, indices `{0,2}` as the discriminating Check. The theorem's non-criticality hypotheses remain unchanged.

   **Repair test.** The corrected matrix has determinant 2≠0 in characteristic zero and also when the coefficient field is 2-adic. Non-criticality requires nonzero determinant, not an integral unit; no good-prime restriction is introduced.

Seven findings, six blocking (two P1, four P2); one P3. The acceptance file elaborates, and its sole admitted theorem survives the one-tactic probe. The remaining defects concern supplier drift, ownership, hypotheses and mathematical specification. No package input was edited.

## Previous findings: repair-by-repair verification

References in this table are to `packages/ModularityAndLanglandsExtensionsPartII/README.md`, unless stated otherwise. Each quotation is from the repaired package. The old identifiers mean round 2, not the new findings below.

| Previous finding | Repaired passage and status | Verification |
|---|---|---|
| R01, determinant twist | **Repaired**, line 4528: “whose reduction `χ̄` satisfies the residual identity `χ̄² det r̄_{π,ι_q} = ε̄^{−1}`”. | For Δ the characteristic-zero determinant weight stays 11 under a finite-order twist, whereas the residual exponent is `2·5−11=−1`. No characteristic-zero equality is now asserted. |
| R02, inert-place character | **Repaired**, §4.1: “unramified at every place `w` of `F` inert over”. | The restriction to the base field alone permits an order-four character of `𝔽₉×/𝔽₃×`; its inertia value is i rather than 1. The added condition excludes it. |
| R03, packet sign | **Repaired**, line 2158: “`∏_{i=1}^{s} ε_{v_i}(R_i) = −1`”. | At `c=1,d=0`, the corrected sign gives multiplicities `(1,0)`, the opposite sign `(0,1)`. The subsequent pairing contradiction uses the corrected inequality. |
| R04, adjoint/simply-connected interface | **Repaired**, line 1655: “`(p^*π)^{I_sc} = π^I` as `H(G_sc, I_sc)`-modules”. | The added subalgebra, exponent restriction and self-twist criterion distinguish the index-two `SL₂ → PGL₂` lattices. At `s=diag(i,−i)`, multiplication by −1 is Weyl conjugate; for real-positive s it is not. The former has reducible pullback, the latter does not. |
| R05, duplicate KL owner | **Partly repaired**, line 95: “This roadmap owns the Kazhdan–Lusztig classification”. | Direction of supply is fixed locally, but the other head still owns the same bijection. New R03 gives its current lines. A downstream-consumer sentence does not change that head. |
| R06, affine paving | **Repaired**, lines 1748–1779: “two points exchanged by” the component action; “Smooth and projective alone does not give these counts”. | The explicit stable-isotropic-flag calculation gives `2+2+4=8`, then 14 and 22. An elliptic curve has `dim H₁=2`, unlike a paving. The false general inference has gone. |
| R07, partition-ring Hecke comparison | **Repaired**, §6.3: “no `R_v` is the Steinberg ring and no `R_v` is a partition ring”. | ct17 line 2029 supports fixed characters. At `q=11,p=5`, scalar characteristic-zero Frobenius has no ratio 11, so `(X−1)³` does not satisfy the `(2,1)` chain condition. Partition rings are excluded from this comparison. |
| R08, bad locus | **Repaired**, lines 1006–1013: the definition intersects local absolute reducibility with discriminants of `g^i`. | The Q₈ representation is irreducible although its symmetric cube always has repeated eigenvalues; it is excluded. For `1⊕η`, `η²=1`, the discriminants at g and g² are 4 and 0. |
| R09, forbidden count | **Repaired**, line 4430: “at most `4r − 2`”. | For `r=4,q=17,x=2`, the forbidden set has eight elements, not fourteen. With `y=3` the eight tensor eigenvalues are distinct. |
| R10, Adic supplier identity | **Repaired**, line 279: “AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartV”. | The same Part V identity appears in the gap and plan. Its current §§1.1,1.4,1.5 exist; the base-field extension remains a declared additional contract. |
| R11, ct15 supplier locator | **Repaired**, `sources.toml`, ct15 `cited_for`: “§3.12, Layer 3”. | Current PAI Part II §3.12, README line 964, still owns Hida classicality and character independence. This citation survived the other renumberings. |
| R12, prime containment | **Repaired**, line 3856: “`Q ⊂ 𝔭` and … `V(𝔭) ⊂ V(Q)`”. | In `𝒪[[T]]`, `(0)⊂(ϖ)`, quotient dimensions 2 and 1, and `ϖ∉(0)`. |
| R13, ramified uniformizer | **Repaired**, §4.8: “`ϖ_F := ϖ_E²` an `F`-uniformiser”. | For `E=F(√ϖ_F)`, valuations of `ϖ_E²` and `ϖ_F²` are respectively 1 and 2. Only the former gives the required generator. |
| R14, proof pages | **Repaired**, line 2696: “pp. 84–85”; line 3038: “the construction of `P → R` from it, p. 8”. | nt21 lines 4124–4161 and nt21b lines 310–336 support these corrections. The same pattern elsewhere exposes new R07. |
| R15, crystalline quotient direction | **Repaired**, line 3043: “`G_{F_v}`-equivariant surjection `L ↠ A²`”. | The resulting symmetric-square weights are `{0,1,2}`; the dual would give `{0,−1,−2}`. The coefficient-change quotient has the correct direction. |
| R16, formal-torus ownership | **Partly repaired**, line 328: “GlobalGaloisDeformations §§4.6, 4.11 (imported, not restated …)”. | Generic quotient/torsor duplication is removed. The newly formulated patched-action implication omits freeness of its input actions and repeats part of GL2ModularityLifting §6.6; new R05. |
| R17, tensor level subgroup | **Repaired**, line 4094: “`V_0(Q)_v = ι_ṽ^{−1}(Iw_ṽ)`”. | The kernel uses every ordered diagonal character. For two C₂ factors its index is 4; a determinant-only kernel has index 2. For `(α,β,γ)=(2,3,5)`, ordered eigenvalues are `(10,15)`, product 150. |

No finding in the repair report was expressly marked “not actionable in this package”. Its maintainer note for old R05 is addressed explicitly below. Changes were tested again; prior computed rows were used only for unchanged material. A prior prose assertion of soundness was not treated as a computed check.

## Verified sound

### Coverage, principles and shape

Read the four package files, previous review/repair, board-package index, overlap report and declared gaps. There are 109 numbered targets in 15 layers, 109 Checks blocks (each has at least three bullets), 24 explicit API blocks plus prose APIs, and two named Lean declarations. The source manifest has 18 works: 15 cached certified texts and three settled uncertified works. All 13 declared gap slugs match the plan exactly and name suppliers; none has supplier `none`.

The review retains the roadmap's general scope: dyadic patching, primes 2 and 3 in supercuspidal removal, ramified local types, all symmetric-power ranks and all totally real fields. The level-one Lean theorem is a stated analytic consequence on available carriers, not a replacement for the general README endpoints. The parent/Part II division is explicit: parent statements are identified by section, and this Part II develops their intermediate proofs. The mathematical layer dependencies force continuation → eigencurve transport → ping-pong, local types → level raising → seeds, and untwisted tensor → tensor lifting → residual witnesses → induction; layer names are mathematical, not source chapter names. No computational algorithm, copied source passage, sorry'd data, `set_option`, admitted example, or forbidden supplier was found. No section/id was dropped by this package. Metadata is the appropriate `math.NT` topic.

For house shape, compared main `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `TauCetiRoadmap/StableReduction/README.md`. The reviewed package has the requested summary, scope, conventions, exact contracts, build explanation, Examples and Dependencies for its layers, consumers and references. Every target has a locator and explicit dependencies; the defects in their precision are above. README-owned backticked Lean names are the two declarations actually present. No process/date/PR/local-path residue was found in the package's mathematical text. The explicit source-correction discussion describes mathematical issues, not review history.

### Seeded source checks

The following source passages were read, including hypotheses and the proof steps used in the package. Page numbers refer to the recorded versions. “Matches” is a locator/hypothesis comparison, not a claim that numerical tests prove an automorphy theorem.

| Sampled target | Read source and pages | Outcome |
|---|---|---|
| 1.3 Non-criticality | nt21 lines 2140–2197, Lemma 2.29, pp. 44–46 | Regular de Rham, all triangulations non-critical and all ratio powers retained. The theorem matches; proof wording/page requires R07. |
| 1.4 Component of ℰ₂ | nt21 lines 2088–2139, Corollary 2.28, pp. 43–44 | Both branches match. Non-critical branch retains local SL₂ closures and target triangulations; ordinary branch requires source global SL₂ and the common geometric component. |
| 2.4 Eigencurve constancy | nt21 lines 2448–2470 and ensuing proof, Theorem 2.33, pp. 50–51 | Both non-critical and ordinary alternatives, common component over ℂ_p, and non-CM hypotheses match. Component descent remains a declared gap. |
| 3.3 Twin annulus | nt21 lines 2656–2665, Lemma 3.3, p. 54 | The package correctly puts the twin in X_i′, repairing the source's mislabeled point; the slope sum is correct. |
| 5.10 l=5,7 raising | ct17 lines 1807–1888, Theorem 4.2 and pairing proof, pp. 35–37 | The source's case-2 conclusion and small-prime restriction match; §5.9 now supplies the indispensable minus sign. |
| 6.2 Deformation datum | nt21 lines 3836–3861, §6/Lemma 6.4, pp. 78–79; ct17 §5.1, lines 1970–2035, pp. 38–40 | Ring types and dimension bounds match their settings; admissibility/finiteness is missing: R04. |
| 6.4 Galois Steinberg raising | nt21 lines 3713–3761, Theorem 6.1, pp. 76–77 | Odd n≥3, p>2n, local-degree bounds, residual characters, primitivity and ordinary seed are retained. |
| 6.8 Long Jordan block | ct17 lines 2204–2228, Theorem 5.7, p. 43 | Two constituents, parity/divisibility conditions, ordinary hypotheses, auxiliary local block and strict block-size inequality match. Semisimple Frobenius alone is not substituted for monodromy. |
| 9.2 Barsotti–Tate quotient | nt21b lines 310–336, Lemma 2.2 p. 7, construction p. 8 | Correct quotient onto A² and direction P→R; torsion-crystalline interpretation retains p=2. Original Raynaud text remains uncertified. |
| 9.6 Dyadic patching | nt21b lines 789–813, 860–907, Proposition 2.8 p. 17, Lemma 2.9 pp. 18–19 | q,g,γ, ranks, ring-map directions, actions on both modules and square-equivariance match. The citation also gives proof pp. 17–19, covering the continued lemma. The new generic contract needs R05. |
| 10.4 Seasoned large image | nt21b lines 1068–1114, Proposition 3.7, pp. 23–24 | Separate p=q and p≠q cases retained; the choice of coefficient embedding and element-order bound are essential and present. |
| 12.3 Tensor TW datum | nt26 lines 1356–1385, §4, pp. 29–30 | Ordered tensor eigencharacters and group-ring map match; finite Q omitted: R04. Auxiliary lifted characters may ramify, as the diamond action requires. |
| 12.5 Enormous tensor image | nt26 lines 1547–1580, Lemma 4.7, pp. 33–34 | Strong irreducibility plus Hodge–Tate regularity, Sen operator and derived-subgroup argument match. This is characteristic-zero enormous image, not the residual prime-selection hypothesis. |
| 13.4 Coefficient-field propagation | nt26 lines 1975–2050, Proposition 5.6 and proof, pp. 42–44 | Correct symmetric-power/rank-two slots, inertia generation and finite-field avoidance. Forbidden count is now an upper bound. |
| 14.1 All-rank 7.1/E | nt21 lines 4054–4071 and 4390–4429, pp. 83,90–91; nt26 lines 2296–2340, pp. 49–50 | Original seed hypotheses retained; the package explicitly obtains all ranks via its independent SP_n induction, rather than silently using the defective odd-block route. Rank-two seed supplies E once all-rank functoriality is available. |

The other repaired passages were compared to the relevant nt21, nt21b, nt26 and ct17 lines specified in the repair table. The only author-declared inaccessible originals are kl87, bbm82 and kw09. They remain settled, with no repeated request. Every work named in the package's References has its manifest key. No new source was fetched or manifest entry altered.

### Computed adversarial checks

Each row records actual values or sets, including a negative control where relevant. For unchanged targets, computed rows from round 2 were retained only after comparison with the present wording; changed targets and the seeded sample were recomputed. The table covers the sampled targets, headlines and every finding, rather than reproducing a 109-target catalogue.

| Statement / interface | Instances | Computed values on the two sides | Result / required change |
|---|---|---|---|
| 0.1 continuation and components | `xy=0`; quadratic field point after splitting | Node: two 1-dimensional components; y is 0 on one, nonzero on the other. Quadratic field: 1 component before, 2 after splitting. | Componentwise claim retained; field-extension gap explicit. |
| 0.2–0.4 determinants/polarization | Rank one; infinitesimal characters | det=trace=character; `(1+εa)(1+εb)=1+ε(a+b)` for ε²=0. In 𝒢₁, c²=1 forces ν(c)=−1. | Nonreduced tangent and polarization conventions consistent. |
| 1.1–1.4 continuation | n=2; CM rank two | Sym¹ρ=ρ, dimension 2; CM Sym² has dimensions 1+2=3. | Identity case retained; irreducible/non-CM conditions exclude the split symmetric square. |
| 1.3 non-critical filtration | a=1, indices 0,2; a=0 | Derivative determinant 2; Vandermonde on powers `(1,1)` is 0. At a=0 the filtration line equals e₁ and is critical. | R07 corrects matrix, not theorem; determinant 2 is nonzero also over ℚ₂. |
| 2.1 twin convention | χ₁ on units trivial/nontrivial quadratic | Double-twin twist on a unit is respectively 1/−1. | Required unramified first character excludes the wrong domain. |
| 2.4 eigencurve headline | n=2; CM family | Original rank is 2; CM Sym² dimensions 1 and 2, not a cuspidal rank-three lift. | Both source alternatives carry needed restrictions. |
| 2.5 bad locus | Q₈; `1⊕η`, order η=2 | Sym³ Q₈ eigenvalues `(i,i,−i,−i)`, discriminant 0 despite irreducibility. For η, discr(g)=4, discr(g²)=0. | Repaired local reducibility and indexed union distinguish the models. |
| 3.2–3.3 boundary twin | `(k,m)=(3,0),(5,0),(4,0)` | w=4,124,24; valuations 2,2,3. Twin index sums 1,2,1; first cannot be sum of two positive indices, second forces `(1,1)` with slopes `(2,2)`, third is outside annulus. | No claimed twin at an impossible boundary weight. |
| 3.4 residual attachment | Δ, ℓ=2, characteristic 5 | τ(2)=−24≡1; `2¹¹≡3`; polynomial `X²−X+3`. | R02 resolves an absent supplier, preserving these values. |
| 3.6–3.8, Theorem D | Ratio −1 at n=3; Δ at 2 | Ratio square 1 fails n-regularity. Δ slopes 3 and 8 sum to 11; ratio valuation ±5 excludes roots of unity. | Correct regularity/continuation domain. |
| 4.1–4.2 μ | F₉/F₃ | Quotient unit order 8/2=4; order-four character value i versus required inertial value 1. | Repaired unramified condition excludes wrong twist. |
| 4.5 finite-unitary type | n=3,q=3,p=7 | τ dimension 6, other induced type dimension 32; torus order 28; ord₇(3)=6. | Congruence is constituent multiplicity, not dimension equality. |
| 4.8 Hecke and uniformizer | q=3; ramified quadratic E/F | T=3 or −1 makes `(T−3)(T+1)=0`; reversed roots give 12 or −4. Valuations of `ϖ_E²,ϖ_F²` are 1,2. | Correct relation and repaired lattice generator. |
| 4.9 ownership / pullback | SL₂→PGL₂; `s=diag(i,−i)` | Lattice index 2; `−s` is Weyl-conjugate to s; restriction splits a 2-dimensional Iwahori module as 1+1. | Added pullback distinguishes covers; R03 removes duplicate owner. |
| 4.9 tempered iff | Same `s=diag(√q,1/√q)`, u trivial/regular | Correct commuting s₀ equals s/1, with largest eigenvalue modulus √q/1. Polar compact factors both 1. | R06: define commuting factor, reject polar-factor reading. |
| 4.10 KL fibres | n=7,9,11; elliptic curve | Total homology 8=2+2+4, 14=1+11+2, 22=1+16+5. Elliptic odd homology dimension 2 versus 0 for a paving. | Explicit repair passes; no smooth-projective implication remains. |
| 5.4 type level raising | Rank 5, blocks 3+2 | Rank 5=3+2; finite U₃ type at q=3 still dimension 6, not a rank-five finite-group type. | Correct block-specific type. |
| 5.9–5.10 packet/pairing | c=1,d=0; a=2,b=1 | Minus sign gives `(a,b)=(1,0)`, plus `(0,1)`; contradiction `2(a+b)=6>5=a+3b`. | Repaired sign supports headline. |
| 6.2 / 12.3 finiteness | k auxiliary places; infinitely many | Finite Iwahori index `∏(q_i+1)`; infinite product has empty interior. For C₂ factors, finite diamond order `2^k`; infinite product is not finite. | R04: finite admissible sets. Empty Q gives order 1 and is retained. |
| 6.3 comparison domain | q=11,p=5,n=3, Φ=I | Ratios 1,1,1; required nontrivial chain ratio 11 absent, even though 11≡1 mod5. | Partition ring excluded from Hecke comparison. |
| 6.3–6.4 degree and rank bounds | n=3,p=7; d=13 or12; local degree6 | `n+n²=12`; 13>12, 12≯12; `p>2n` gives7>6; local bound4<6. | Strict inequalities and source hypotheses preserved. |
| 6.7–6.8 long-block headline | `(n₁,n₂)=(4,3)`, l=5, partition(5,1,1) | Product12 even, 5∤84; maximal block5>4; kernel dimension3 versus7 for N=0. | Correct monodromy hypothesis; no semisimple substitute. |
| 6.9 level raising | Two rank-one blocks, q≡−1 | Required character ratio −1 gives `(−1)(−1)=1`. | Normalized two-block congruence consistent. |
| 7.3–7.7 seed headlines | p=13,q=103; l=5,7 | q≡3 mod4 and−1 mod13; `−q³(q+1)²≡0`. Sym^(l+1) ranks7,9, hence powers6,8. | Correct residual seed and rank/power indexing. |
| 7.4–7.6 conditional versus all-rank seed | Nontrivial δ; ranks1,2,4 | δ(g)=−1 changes polarization by−1; doubling gives1→2→4 and never rank3. | Odd block remains explicit; all-rank route uses Layer13. |
| 8.3 relative Theorem B | Steinberg at2; n=2; CM | Refinement-ratio powers `2^(±i)≠1`; Sym¹ rank2; CM Sym² splits1+2. | Relative seed, regularity and non-CM hypotheses present. |
| 9.2 Artinian quotient | n=1,2,3; p=2,3,5 | Weight sets `{0}`, `{0,1}`, `{0,1,2}`. Width2 exceeds p−2 at2,3, equals it at5. Dual instead gives `{0,−1,−2}`. | Correct quotient direction; torsion-crystalline formulation avoids a false Fontaine–Laffaille restriction. |
| 9.6 dyadic numerical data | n=3 or4; `|S∪S∞|=m`, q=m−2 | Need `2^a>5` or7: a=3 gives8; γ=0, g=2m−3. γ=1 square map is `y=2x+x²`. | Bounds and rank-zero torus case pass; R05 concerns freeness premise. |
| Formal-torus gap | ℤ₂, action λ² on `1+y`; modulo4 | At λ=3, λ²=1 mod4, so all points fixed; translation by3 sends 1 to3, unequal. | Compatible square action is not free; free-chunk repair excludes it. |
| 9.8 / 10.4 symmetric lifting and seasoning | n=3, t=53; put p^a≤5 | `t>8n(n−1)=48`; `t/2=26.5>24=4n(n−1)`. Hypothetical p^a≤5 gives prime-to-p element bound≤24. | Large element order contradicts small image; p=2 is retained when image field is large enough. |
| 10.8 non-CM removal | sc empty; two supercuspidal places | Empty set has cardinality0; replacing/removing an auxiliary place decreases the relevant induction count from2 to1 then0; Sym⁰ rank1, Sym¹ rank2. | No exclusion of supercuspidal primes2,3. Large image is required of chosen replacement, not arbitrary original. |
| 11.7 support containment | `𝒪[[T]]`, Q=0, 𝔭=(ϖ) | Quotient dimensions2,1; ϖ∈𝔭 andϖ∉Q. | Corrected Q⊂𝔭 and reversed closed-set containment. |
| 11.10 / 12.5 / 12.7 tensor headlines | r=1,2,3; wrong spacing at r=2 | Correct weights `{0,1}+{0,2,…,2r−2}={0,…,2r−1}`; wrong r=2 spacing gives `(0,1,1,2)`. For r=3 blocks4+2=6. | Regularity and strong irreducibility are explicit; distinct Sen eigenvalues distinguish enormous-image route from residual selection. |
| 12.4 tensor level and Hecke product | r=1,p=2; α=2,β=3,γ=5 | Full quotient C₂² order4 vs determinant quotient2. η=(10,15), product150 vs omitted-factor30; second normalized operator uses q⁻¹·150. | Repaired subgroup/order and source-product correction pass. |
| 13.1 residual size | Characteristic2; M=6,q=2 or4 | q±1 sets `{1,3}` / `{3,5}`, no prime>6; two distinct large dihedral primes cannot both be the sole possible q+1. | Both primes used; small dyadic case excluded legitimately. |
| 13.4 propagation | r=4,q=17,x=2,y=3 | Forbidden set `{1,2,4,8,9,13,15,16}`, size8≤14; eigenvalues `7,6,10,11,14,12,3,5`, size8=2r. | Corrected bound and slots pass. |
| 13.5–13.6 residual tensor | r=1,2 | Residual tensor dimensions2 and4; r=1 is coefficient-conjugate rank2. | Residual conclusion, not unproved characteristic-zero tensor lift. |
| 13.7 determinant repair | Δ; complex conjugation | HT11≠1; residual exponent10−11=−1; ε̄(c)det r̄(c)=(−1)(−1)=1. | Correct residual twist and even obstruction. |
| 13.8–13.10 induction / SP_n | `(p,r)=(5,1),(7,3),(7,5)` | `(p−r)+2r=6,10,12=p+r`; for n=12 prerequisites2,4,5,6 are all<12. No index0. | Non-split representation decomposition used only after semisimplification; induction well-founded. |
| 14.1–14.3 endpoints | Rank1,2; CM rank3; F=ℚ | Sym⁰ rank1, Sym¹ rank2, CM Sym²=1+2; `[ℚ:ℚ]=1`. | Assembly preserves non-CM cuspidality and all totally real bases. |
| 14.4 Euler-factor definition | n=0,1,2; α=2,β=3 | Factors `1−x`, `1−5x+6x²`, `1−19x+114x²−216x³`; at x=0 each1; swapping α,β leaves all coefficients fixed. | Native definition correct; j≤n prevents natural-subtraction junk. |
| 14.4 analytic headline | Δ, n=2,p=2; n=0 | α+β=−24, αβ=2048; Sym² sum−1472, polynomial `1+1472x−3014656x²−8589934592x³`; threshold12. n=0 gives ζ with pole at1. | Positive n essential. In the stated half-plane root terms have modulus<1/p<1, excluding zero denominators. |
| Supplier tests R01/R02 | Old/new section; Δ mod5 | PAI old9.8 yields tangent statement, new9.7 residue-field statement; residual polynomial `X²−X+3` has trace1,det3. | Concrete requested objects now resolve under proposed repairs. |

### Lean elaboration, signatures, headlines and padding

Ran the prescribed `lake env lean` on `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` from the pinned content checkout. Exit 0; only `Suggested.lean:80:8: warning: declaration uses sorry`. The imported Satake object was present, so no build was needed. No Lean process remains running.

A scratch copy contained `#check @...` for **both** named declarations and attempted `simp`, `rfl`, `infer_instance`, and `exact f.LSeries_eulerProduct_hasProd_satakeParameters` against the **sole** sorried theorem using failure assertions. It elaborated with only the remaining sorry warning: none of those tactics closed the theorem. The definition elaborates to `ℕ → ℂ → ℂ → ℂ → ℂ`. The theorem retains k, the native `Newform 1 k`, n, `1≤n`, α,β and the equality of Satake pairs at every prime; its conclusion has exactly the stated half-plane, `Differentiable ℂ L` and unconditional `HasProd`. No section hypothesis disappeared. Nothing was changed.

The proved symmetry example genuinely tests the one retained definition by reindexing `j↦n−j`; it is not an admitted headline or a padding theorem. The file has no stand-in automorphy predicates, sorry'd data, API catalogue or `set_option`. Its imports use the pin's `module`/`public import` form for Mathlib and the single actually used Tau Ceti Satake module.

| Headline family identified in README | Acceptance-test disposition |
|---|---|
| Unitary continuation, eigencurve constancy and Theorem D (§§1.1–1.4,2.4,3.8) | Docstring names the missing eigenvariety/pseudocharacter and automorphy carriers through the continuation endpoint. |
| Local-type and Steinberg level raising (§§5.4,5.10,6.4,6.7–6.9) | Named as not statable: unitary automorphic representations, types and their Galois representations absent. |
| Seed, Theorem7.1/E and Sym⁶/Sym⁸ (§§7.5–7.7,14.1) | Named as not statable: automorphic/Galois carriers absent. |
| Relative TheoremB and level-one/all-non-CM endpoints (§§8.3,10.8,14.2–14.3) | TheoremB and general non-CM endpoint named; the general newform CM predicate and global carriers are missing. |
| Symmetric-power lifting (§9.8) | Named; deformation/pseudodeformation rings and automorphy absent. |
| Untwisted tensor, tensor lifting, residual witnesses (§§11.10,12.7,13.5–13.6) | Named; associated automorphic Galois representations and simultaneous patching absent. |
| SP_n over every totally real field (§13.10) | Named; Hilbert automorphic representation carriers absent. |
| Entire symmetric-power L-functions in level one (§14.4) | Stated with native Newform/Satake/HasProd/Differentiable and one simple definition. |

No further statable headline or padding was found. The abstract symmetric tensor power present in Mathlib does not provide an automorphic lift or its analytic L-function.

### Pinned declarations opened and compared

Paths here are relative to the respective pinned library repository, not machine paths.

| Pinned file and line | What was verified |
|---|---|
| `Mathlib/NumberTheory/Multiplicity.lean:359`, :402 | `Nat.multiplicity_pow_two_sub_one` and retained deprecated `padicValNat.pow_two_sub_one` alias. Odd x>1, nonzero even exponent. At x=5,n=4 the valuation is4. |
| `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934` | `Polynomial.discr` is the signed Sylvester determinant; constant polynomials have discriminant1. The roadmap uses positive-degree characteristic polynomials, not the zero-polynomial convention. |
| `Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean:50` | `GaussianInt` is `Zsqrtd (−1)`; the CM-form coefficient carrier exists. |
| `Mathlib/NumberTheory/Bertrand.lean:225` | `Nat.exists_prime_lt_and_le_two_mul` requires a positive natural input and gives n<p≤2n. The induction's n≥6 makes its floor input positive and excludes the even upper endpoint being prime. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275` | `NumberField.abs_discr_gt_two` assumes degree>1 and gives absolute discriminant>2. It applies to the nontrivial field fixed by inertia generation. |
| `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107` | `HasProd` is convergence of finite products along the unconditional filter. It does not itself include nonzero factors or continuity of multiplication; ℂ and the half-plane argument supply these. |
| `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172` | `Differentiable` means differentiable at every point; over ℂ it gives entireness. |
| `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:27` | `Complex.cpow` has explicit total values at zero. The theorem uses prime bases≥2, so those junk values never enter. |
| `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` | Quotient symmetric tensor power, not automorphic functoriality or analytic continuation. |
| `Mathlib/NumberTheory/EulerProduct/Basic.lean:175` | Euler product requires norm summability, f(0)=0, f(1)=1 and coprime multiplicativity; it supplies no continuation theorem. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:98`, :104 | Eigenform is nonzero; Newform adds newness and first coefficient1. Zero cusp forms cannot satisfy the Lean headline's input. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91`, :108, :117, :191 | Root multiset, sum/product iff, pair existence and original L-series Euler product. Its region `(k+1)/2<Re(s)` implies the weaker region quoted in the supplier paragraph. It does not assert all symmetric-power continuations. |
| `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:192` | `CuspForm.hasEntireExtension_qExpansion_coeff` requires positive weight and concerns the original cusp-form L-series, not arbitrary symmetric powers. |

The supplied Loogle/LeanSearch leads were treated as leads. The abstract Euler product, symmetric power, Dirichlet/ζ products and periodic-function L-series do not duplicate the retained theorem. Searches by objects in both pins found no native eigenvariety, automorphic GL_n carrier or newform CM predicate that makes the listed missing headlines immediately statable. The roadmap service's object searches also covered KL classification, determinant torsors, eigenvarieties and symmetric-power L-functions; R03 and R05 are the remaining ownership issues.

### Current suppliers, overlaps and merge order

The board index was read before any absence claim. The supplied overlap report contains no conflicting package head or dropped-id warning; manual current-head resolution nevertheless found R01 and R02. A generic resolver success does not certify numbered section content. The closest open scopes (#2135 PAI Part II, #1180 parent, #1075 PotentialModularityAndCompatibleSystems, #1071 GL2ModularityLifting and #1020 ClassicalSerreModularity) were compared with this package's ownership. #1815 was found by object search, not just name proximity. No forbidden independent discovery of unlisted PRs was used.

Representative resolved citations, including the critical interfaces, follow. All file names in this table are `TauCetiRoadmap/<supplier>/README.md`; lines are actual README lines, excluding the roadmap service's header.

| Supplier | Resolved sections / lines and boundary checked |
|---|---|
| ModularityAndLanglandsExtensions | §0.2 :387, §1.10 :649, §1.12 :684, §1.15 :756, §4.1 :2407, §4.2 :2430, §4.3 :2452; existing predicates, low powers, adjoint Selmer and eigenvariety interfaces. Parent endpoint statements remain identified, not new alternative ownership. |
| PotentialAutomorphyInfrastructure | §2.5 :841; finite prescribed splitting/disjointness and CM extension requirements. |
| PotentialAutomorphyInfrastructurePartII | Layers0–5 resolve, including §3.12 :964. Renumbered/relocated items and the changed weak-primitive auxiliary-place contract are R01. No absence of a declared dyadic conclusion was treated as unowned. |
| AdicSpacesPartII / III / V | R1.9 :10509; R2.9 :7714; PartV §§1.1 :308,1.4 :383,1.5 :415. Quasi-separated components and normalization do not alone supply the declared base-field extension theorem. |
| IntegralHeckeAndGaloisDeterminants | §§0.2 :703,0.5 :985,1.1 :1933,1.3 :2270,1.4 :2444,1.5 :2606. Determinants versus traces and residually split Henselian matrix-algebra conditions distinguished. |
| LocalGaloisDeformationRings | F.1.5 :359, F.1.9 :464, F.2.11 :890; §§2.24 :2072,2.26 :2105,6.10 :3083,8.12 :3825,8.14 :3841. Despite §6.10's old heading, its body correctly defines Frobenius q-chain conditions, not arbitrary monodromy bounds. Its opposite HT convention is translated. |
| GlobalGaloisDeformations | §§4.6 :829,4.11 :996,5.7 :1316,8.1 :1877,8.3 :1963,8.5 :2028,8.6 :2079. Formal torsor requires a free action. Residual Taylor–Wiles selection is distinct from characteristic-zero enormous image. |
| DeformationAndDerivedPatchingAlgebra | §§5.4 :1082,5.5 :1097,5.6 :1125,6.1 :1223,6.6 :1289,6.7 :1302,9.2 :1752. Compatible finite actions descend; their existence alone does not prove free torus action (R05). |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.40 :2636, R07.4.20 :6371, R07.5.10 :7948, R07.5.11 :8007. Embedding, crystalline-to-BT and residual types are distinct; torsion Artinian converse remains a declared contract. |
| GL2ModularityLifting | §§2.5 :724,2.8 :781; Layer3 :891–1033; §§6.1 :1577,6.6 :1693,6.7 :1719. Explicit free finite action chunks are required; rank-two action is already owned here. |
| PadicFamilies / OrdinaryAutomorphicFormsAndModularityLifting | Padic §§2.8 :1925,2.10 :1963,2a.4–2a.14 :1415–1611,5.8 :2810; Ordinary §2.11 :342. Small-slope classicality and Hida weight-change inputs resolve. |
| PotentialModularityAndCompatibleSystems / SerreWeightAndLevelOptimisation | §§9.2 :1595,10.10 :1746; Serre §§2.4 :388,3.2 :631,6.9 :1600,6.11 :1638. Prescribed-component and auxiliary-level strengthening is kept in the declared contract. |
| ArithmeticGaloisRepresentations / ArithmeticGaloisDuality | Arithmetic §§1.8 :1226,4.4 :3263,7.1 :4454,7.6 :4861,7.8 :5145,7.9 :5242,7.10 :5337; Duality R02.3.5 :2666. Mod-p decomposition is semisimplified; adequacy and enormous image are not interchanged. |
| AutomorphicGaloisRepresentations / PartII | §§1.5 :1801,6.2 :3066,7.4 :3733,7.5 :3741; PartII AG2.3 :1358,AG2.6 :2149. Missing §2.3 is R02; replacement owner §7.3 was opened. |
| GL2AutomorphicRepresentationsAndTransfer | R16.3.1–3.8 :951–1071; normalized principal/Steinberg parameters and wild supercuspidals retained. |
| EndoscopicTransferAndUnitaryTraceComparison | §§2.8–2.15 :863–1042,4.9–4.10 :1912–1946,6.4 :2148,6.9–6.10 :2272–2290,6.24–6.29 :2587–2678,11.2 :4457,13.1–13.5 :5044–5121. Abstract packets/transfer are supplied; explicit finite-unitary and socle statements remain gaps. |
| SmoothRepresentationsOfLocalGroups / ReductiveGroupsPartII | Smooth SR.1.4 :1445,SR.1.5 :1583,SR.2.1–2.3 :1916–2205,SR.3.1–3.4 :2571–2957,SR.4.4 :3459; Reductive RG2.1.3 :2080,RG2.3.3 :4151,RG2.4.1 :5533,RG2.4.2 :5711. Ramified quasi-split Iwahori presentation is explicitly requested as a gap. |
| Other named interfaces | PadicHodgeTheory §4.4 :894,§5.3 :1016; PhiGammaModulesAndIwasawaCohomology §7.5 :3008; CompletedCohomologyAndLocalGlobalCompatibility §0.7 :379; ClassicalSerreModularity R27.1 :925; Chebotarev Layer10 :410; ClassFieldTheory Layers11–14; AutomorphicLFunctionsAndLocalFactors AL.2 :1156. No generic citation was used to erase the declared Drinfeld/socle/finite-unitary additions. |

The exact dependency command from the brief, using `--movable` and the supplied current order/content, returned:

```text
depcheck: 236 roadmaps, 2161 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This does not detect the section-content mismatches or duplicate ownership above. No merge-order/tool file was edited, and no later roadmap was added as supplier.

The 13 gaps have matching slugs and named owners. Their absence was not raised as an unowned-prerequisite defect. Most distinguish specific missing mathematics: dyadic unitary forms, geometric components under field extension, simultaneous residual Taylor–Wiles primes, Artinian crystalline quotients, unobstructed auxiliary primes/slope counts, prescribed local components, explicit tempered packets/socles, Deligne–Lusztig transfer, ramified Iwahori presentation, localized Drinfeld concentration, and finite-unitary representation theory. R01 updates the PAI auxiliary-finiteness contract to its actual remaining scope, and R05 narrows and corrects the formal-torus contract. No conditional acceptance is issued while repairs remain.

## Not verifiable

- **kl87**, Theorem7.12 and §8: original text settled as uncertified. The accessible ct17 application and the other open roadmap's precise factor normalization were read; these do not certify every clause of the original KL proof. No new request.
- **bbm82**, Théorème3.1.1: original book settled as uncertified. Its application in nt21b Lemma2.2 and the Raynaud supplier interface were checked, not the inaccessible original proof. No new request.
- **kw09**, Proposition9.3 and the other recorded locators: original text settled as uncertified. nt21b lines893–907 and the GL2 supplier's free-action-chunk formulation were checked. No new request.
- Declared supplier extensions are contracts, not completed proofs; their future proofs are not certified here. Their named-owner, precision, minimality and matching-slug requirements were audited, with R01/R05 recorded.

There is no additional missing-reference request. Ownership was checked against main, the board index and the permitted open-head sources using the roadmap service. No claim is made about unlisted/unavailable open work.

## Source issues

- **Misprint** in nt21 at Lemma 3.3, p. 54: the source places the original point in the second annulus; it should place its twin there; affects a stated result.
- **Misprint** in ct17 at §2.1, p. 7: the source assigns double-coset generator roots 1 and −q; it should assign roots q and −1; affects a stated result.
- **Error** in ct17 at §2.1, pp. 6–7: the source uses invertible braid-group generators over the integers; it should invert q or use positive braid generators; affects a stated result.
- **Error** in ct17 at Theorem 2.4(2a), p. 10: the source requires s itself compact for tempered representations; it should require the commuting factor after removing the Jacobson–Morozov q-weight compact; affects a stated result.
- **Gap** in nt21 at proof of Lemma 6.7, p. 81: the source uses multiplicity one for the antiunit contribution of a union of places; it should obtain the bound from one place with multiplicity-one induced representation; affects the proof.
- **Misprint** in nt26 at §4, Hecke generators after the Taylor–Wiles level definition, p. 32: the source omits the product of all r γ-parameters in the second branch; it should multiply by that product before the first i−r γ-parameters; affects a stated result.
- **Misprint** in nt26 at Lemma 4.7 proof, p. 34: the source refers to root subgroups inside the diagonal torus; it should refer to kernels of root characters, where two diagonal eigenvalues agree; affects the proof.
- **Gap** in nt26 at proof of Proposition 5.4, p. 39: the source infers q>M from one prime t>M dividing q±1; it should use both distinct dihedral primes in characteristic two to exclude q+1=t; affects the proof.
- **Misprint** in nt26 at proof of Proposition 6.1, p. 47: the source makes auxiliary t avoid the conductor of π; it should also avoid the conductor of the newly constructed π_a used at t; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "40050a9994f62e85209f7b7940dd9f9c6c936cad", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~3", "model": "gpt-6-astra", "worker": "chris-30"} -->
