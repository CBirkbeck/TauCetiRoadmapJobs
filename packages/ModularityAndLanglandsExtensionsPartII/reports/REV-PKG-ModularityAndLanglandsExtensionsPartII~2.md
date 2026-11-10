# Review of ModularityAndLanglandsExtensionsPartII (package, round 2)

**Verdict:** needs changes

17 findings: one P1, ten P2, six P3; 11 blocking. The package is repairable. Its Lean acceptance test passes, but that does not validate the mathematical proof routes in the README.

## Verification of the previous repairs

The previous findings and the repair report were checked before the new pass. Quotations below are from the repaired package, not from the papers.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| F01 | packages/ModularityAndLanglandsExtensionsPartII/README.md:227: “Layer 3: the definite unitary group (§3.1), algebraic modular forms (§3.2)”; packages/ModularityAndLanglandsExtensionsPartII/README.md:272: “§8.20 (Layer 8)”. The corresponding headings exist at PotentialAutomorphyInfrastructurePartII's head. The new auxiliary-extension and connectedness citations resolve to PotentialAutomorphyInfrastructure §2.5 and DeformationAndDerivedPatchingAlgebra §6.6. The old pattern survives in packages/ModularityAndLanglandsExtensionsPartII/sources.toml:303. | Partly repaired; R11. |
| F02 | packages/ModularityAndLanglandsExtensionsPartII/README.md:281: “AdicSpacesPartIIPartII Layer 1”. The layer number is repaired. The justification for retaining the old roadmap name is no longer true: merge-order/ORDER.txt:222 says AdicSpacesPartV. | Partly repaired; R10. |
| F03 | packages/ModularityAndLanglandsExtensionsPartII/README.md:343: “Hida's control theorem is taken from PadicFamilies §5.8.” That target exists; §10.2 keeps the slope dimension count in the GL2 supplier gap. The nonexistent OrdinaryAutomorphicFormsAndModularityLifting §2.6 citation is gone. | Repaired. |
| F04 | packages/ModularityAndLanglandsExtensionsPartII/README.md:416 and 1422 say “ls20 §8”; the manifest also says §8. ls20 line 1132 opens the synthesis, with its reducibility formula at line 1145. | Repaired. |
| F05 | packages/ModularityAndLanglandsExtensionsPartII/README.md:330: “Raynaud's embedding theorem (bbm82 Théorème 3.1.1; §R07.1.40 ...)”. The plan's matching gap has the same interpretation. The accessible application is nt21b lines 322–327; the original BBM text remains settled as uncertified. | Repaired; the separate dualization error in §9.2 is R15. |
| F06 | §2.1 now requires “χ_{0,1} unramified”. Computing the two twists gives (ψψ′) on units equal to χ_{0,1}^{−1}, hence 1 precisely under the added condition. The condition agrees with nt21 lines 2344–2345 and 2370–2377. | Repaired. |
| F07 | packages/ModularityAndLanglandsExtensionsPartII/README.md:4263: “(diag(y, y^{−1}), diag(x, x^{−1}))”. The tensor slots now agree with nt26 lines 2037–2040, and the new swapped-slot counterexample works. The assertion of an exact forbidden-set cardinality does not. | Partly repaired; R09. |
| F08 | packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean:39: “lacks a CM predicate on newforms”. The actual all-place automorphic endpoint also requires the missing automorphic-representation carrier described in the preceding paragraph. No substitute theorem was added. | Repaired. |
| F09 | packages/ModularityAndLanglandsExtensionsPartII/sources.toml's ls20 entry has “locator = \"§8\"”; the Conrad source identity and theorem locator were correctly retained. Its supplier-name annotation now has the drift in R10. | The requested repair is complete; subsequent name drift is R10. |

No finding below relies on a previous summary merely saying “sound”. The previous computed examples were reused only for unchanged statements; the 15 new sampled targets, changed passages and new counterexamples were checked again.

## R01 (P1) — A residual determinant identity became a false characteristic-zero identity

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:4341, “an everywhere unramified finite-order character χ ... χ² det r_{π,ι_q} = ε^{−1}”.

**Claim:** a finite-order twist changes the determinant of an arbitrary regular algebraic rank-two representation to ε^{−1}.

**Witness:** For the weight-12 form Δ, HT(det r) = 11. A finite-order χ contributes 0, whereas HT(ε^{−1}) = 1. Restriction to a finite extension preserves these weights. nt26 line 2185 has residual bars.

**Repair:** restore the equality `χ̄² det r̄_{π,ι_q} = ε̄^{−1}`, including bars in the following obstruction discussion, and distinguish χ from its reduction. The proof then produces a weight-zero modular lift of the twisted residual representation; it does not identify its characteristic-zero determinant with a finite twist of the original one. Add the weight-12 negative control. The repaired residual equation has no Hodge–Tate-weight assertion: formally χ̄ = ε̄⁵ changes ε̄^{−11} to ε̄^{−1}. The cached PDF's printed p. 47 was rendered and inspected to distinguish bars lost by text extraction; this is a roadmap error, not a source error.

## R02 (P2) — The endoscopic character lacks its inert-unramified hypothesis

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:1287, “fix a character μ ... restricting to the quadratic character”, used by the unramified identity at :1332.

**Claim:** this restriction alone supplies the L-embeddings and spherical normalization used in §4.2.

**Witness:** nt21 line 410 additionally requires μ unramified at inert places. Locally, for unramified quadratic E/F with q = 3, a character of F₉×/F₃× of order 4 is trivial on F× but nontrivial on inertia.

**Repair:** require μ to be continuous and unramified at every inert finite place, as in nt21 lines 408–410. Add the local negative control: multiplying an allowed μ by that order-four character preserves its restriction to F× but makes an affected embedded unramified parameter ramified. With the restored condition its inertial scalar is 1, and the spherical identity has the required domain.

## R03 (P2) — The strict multiplicity inequality omits the packet-sign choice

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:2050, “the R_i ... isotypic parts”, followed by “a > b = c” or “a > b”.

**Claim:** the inequality holds for the unspecified local members R_i.

**Witness:** ct17 lines 1823–1824 choose Iwahori-spherical R_i with product of signs −1. For l = 5, s = 1, choosing the plus-sign member at v₁ forces the plus-sign member Y at v₀, not X.

**Repair:** define the R_i before M and N, impose `∏_{i≥1} ε_{v_i}(R_i) = −1`, and state that the chosen endoscopic representation contributes to these isotypic parts. Keep the contragredient definition of N. Test both choices: minus product gives `(a,b) = (d+c,d)` with c > 0; plus product gives `(d,d+c)`. For c = 1, d = 0 these are (1,0) and (0,1). §5.10 makes the right choice, but a later choice does not supply §5.9's missing hypothesis.

## R04 (P2) — The passage from PSp modules to Sp modules is missing

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:1631, “Through §4.8 and §4.9 for PSp_{2k}”, and :1650.

**Claim:** the adjoint classification directly constructs the modules for the Hecke algebra identified in §4.8.

**Witness:** §4.8 supplies H(Sp₂ₖ,I), not H(PSp₂ₖ,I). Their translation lattices have index 2. ct17 lines 469–480 explicitly pass through representations of PSp₂ₖ with irreducible pullback to Sp₂ₖ.

**Repair:** state and prove the missing pullback interface for the constructed modules, including irreducibility and the identification of Iwahori invariants and exponents, with ct17's proof of Theorem 2.5, pp. 10–11. Alternatively supply a correctly stated general-root-datum classification and apply it to Sp. Do not identify the two Hecke algebras by Lie type. The rank-one lattice test is `X_*(T_SL₂) = ℤα∨` versus `X_*(T_PGL₂) = (1/2)ℤα∨`; the proposed repair retains this index rather than erasing it. For the stated route the dual groups are respectively SO₂ₖ₊₁ and Spin₂ₖ₊₁, with the central quotient accounted for.

## R05 (P2) — Two open roadmaps own the same Kazhdan–Lusztig classification

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:94 and :1588, “The Kazhdan–Lusztig classification ... is stated here”.

**Claim:** this roadmap owns the general split-adjoint classification.

**Witness:** open PR #1815, TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1694 and :1722, also constructs its parameters and proves the split quasi-simple adjoint classification, including temperedness and Springer enhancements.

**Repair:** assign one owner and make the other a consumer. With the present order, keep the needed classification here, explicitly allocate that ownership in Scope, and have #1815 replace its overlapping §§7.3–7.4 construction with a citation to this roadmap (retaining its additional genericity/Aubert results). If ownership is moved to an earlier common supplier instead, both must cite it. This package must not add an upward citation to #1815. merge-order/ORDER.txt puts this package at 284 and SmoothRepresentationsOfLocalGroupsPartII at 294. The overlap includes PGL₂ with nontrivial unipotent parameter and Steinberg Iwahori dimension 1; these are the same object on both sides. Coordinated ownership repair is required, not two independent proofs planned as separate library entries.

## R06 (P2) — Smooth projective does not imply an affine paving

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:1632, “smooth and projective, hence paved by affine spaces”.

**Claim:** smoothness and projectivity justify the homology-dimension calculation.

**Witness:** a smooth projective complex elliptic curve has dim H¹ = 2; a variety with an affine paving has no odd homology. ct17 lines 527–530 additionally use a torus action with eight fixed points.

**Repair:** replace the implication by the actual fixed-point/explicit-fibre calculation for these Springer fibres. For n = 7 name the torus, its eight fixed points and the applicable decomposition theorem, or use the explicit two-points, ℙ¹, ℙ¹×ℙ¹ decomposition already written below. Supply the geometric prerequisite by an earlier owner or a precise gap if using the general theorem. The explicit calculation gives `2 + 2 + 4 = 8`; the elliptic curve no longer satisfies the repaired premise. Do the corresponding explicit calculation for n = 9 and the recursive step, rather than asserting a general implication from projectivity.

## R07 (P2) — The Hecke comparison silently includes partition rings

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:2213, “as in §6.2 ... if R_v ≠ R_v^{St} ... P_D → 𝕋_D”.

**Claim:** excluding only the Steinberg ring suffices for every datum of the enlarged §6.2.

**Witness:** nt21 lines 3842–3850 allow fixed-type, unipotent and Steinberg rings, not arbitrary partition rings. packages/ModularityAndLanglandsExtensionsPartII/README.md:2192 correctly excludes partition rings. R^{(2,1)} requires a q-chain that unramified scalar Frobenius does not have.

**Repair:** restrict this clause to the Newton–Thorne datum already described in §6.2, explicitly excluding partition rings other than its supplied unipotent case. Keep partition data for their separate Clozel–Thorne uses. Test n = 3, p = 5, q = 11, residual Frobenius 1: the characteristic-zero unramified matrix 1 has three eigenvalues 1 and no ratio 11, so it cannot factor through R^{(2,1)}. The repaired comparison makes no such claim. This restores the scope of the source, rather than narrowing its theorem.

## R08 (P2) — The bad-locus proof drops local reducibility

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:1000, “the discriminants ... of Sym^{n−1} ... common vanishing cuts out the finite-order-ratio locus”.

**Claim:** those discriminants alone characterize the locus of sums of two characters with finite-order ratio.

**Witness:** in the faithful two-dimensional Q₈ representation, Sym³(g) has repeated eigenvalues for every g, but the original representation is irreducible. nt21 lines 2606–2612 explicitly retain local reducibility in the closed-locus argument.

**Repair:** for each l and each `1 ≤ i ≤ n−1`, intersect the local reducibility locus with the equations `discr(ρ(g^i)) = 0` for all g, then take the finite union over i and l. Explain finite generation on affinoids if finitely many equations are desired. For Q₈, noncentral elements have eigenvalues i and −i; Sym³ has i and −i each twice, so the proposed discriminants are all zero. The repaired reducibility condition rejects this example. A sum `1 ⊕ η` with η of order 2 passes the i = 2 equations and is retained. The Q₈ example is compatible with the tame local relation at residue cardinality 3: conjugation sends an order-four inertia generator to its inverse.

## R09 (P3) — The repaired tensor Check still gives a false exact cardinality

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:4249 and :4266, “The forbidden set has 4r − 2 elements”.

**Claim:** all the values ±x^i are distinct under the stated order bound.

**Witness:** r = 4, q = 17, x = 2 has order 8 > 6. The forbidden set is {1,2,4,8,9,13,15,16}, of size 8, not 14. In characteristic 2 the signs also coincide.

**Repair:** replace both exact counts by “at most 4r − 2”, and count the intersection with the field in which y is chosen if the two residual fields differ. Add this negative control. The intended existence argument survives: y = 3 gives the eight distinct tensor eigenvalues `7,6,10,11,14,12,3,5` modulo 17. The source at nt26 lines 2037–2040 requires only avoidance, not the false exact count.

## R10 (P3) — The rigid-geometry supplier now has a different name

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:86, :276–285 and subsequent citations; packages/ModularityAndLanglandsExtensionsPartII/sources.toml:131; packages/ModularityAndLanglandsExtensionsPartII/design/plan.json, gap `components-under-field-extension`.

**Claim:** AdicSpacesPartIIPartII is the current supplier name.

**Witness:** open PR #2133 carries TauCetiRoadmap/AdicSpacesPartV/README.md:1, :297, :374 and :406. merge-order/ORDER.txt:222 also says AdicSpacesPartV. The board package index supplies no alternative package with the old name.

**Repair:** replace the obsolete name by AdicSpacesPartV throughout these references, including the plan's gap supplier and manifest annotation; retain Layer 1 and the gap slug. Its §§1.1, 1.4 and 1.5 supply normalization, components and nowhere density; base-field component behavior remains the declared gap. **Re-raised: F02.** The repair report retained the old name because the merge order supposedly required it; the current merge order disproves that reason. This is a name correction to an owned contract, not an allegation that its mathematics has no owner.

## R11 (P3) — The old supplier numbering survives in the manifest

**Location:** packages/ModularityAndLanglandsExtensionsPartII/sources.toml:303, “PotentialAutomorphyInfrastructurePartII PL.2”.

**Claim:** this is the supplier locator for ct15 Proposition 3.10.

**Witness:** open PR #2135, TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:959, §3.12, contains the Hida classicality/character-independence input. No PL.2 heading exists at that head.

**Repair:** change only the ct15 `cited_for` annotation to PotentialAutomorphyInfrastructurePartII §3.12 (Layer 3). Keep the source key and recorded fetch metadata. The repaired locator identifies the same character-independence theorem; it does not point to Layer 2's Schur representations. The reviewer has not rewritten the author's manifest entry.

## R12 (P3) — A Check reverses containment of primes

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:3708, “characteristic-p generic primes of dimension 1 exist inside them”.

**Claim:** such a special-fibre prime is inside a characteristic-zero minimal prime.

**Witness:** in 𝒪[[T]], Q = (0) has characteristic 0 and dimension 2; 𝔭 = (ϖ) has characteristic p and dimension 1. Q ⊂ 𝔭, whereas ϖ ∉ Q, so 𝔭 ⊄ Q.

**Repair:** say “each minimal prime is contained in such a characteristic-p generic prime”, agreeing with §11.7's statement and §11.10's use. Distinguish primes from the reverse containment of their closed subsets. The example then reads `(0) ⊂ (ϖ)` and `V(ϖ) ⊂ V(0)`, both correct.

## R13 (P3) — The ramified uniformizer used in the lattice basis is undefined

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:1561, “ε′_i = diag(1, …, ϖ², …, ϖ^{−2}, …, 1)”.

**Claim:** these elements form the indicated translation-lattice basis.

**Witness:** ct17 lines 167–170 choose ϖ in E with ϖ² a uniformizer of F. If ϖ is instead an F-uniformizer, the displayed rank-one element generates 2ℤ inside ℤ, not the whole lattice.

**Repair:** state this local convention explicitly, using a symbol distinct from the coefficient-DVR uniformizer, or write the Sp basis with a separate F-uniformizer ϖ_F. Test E = F(√ϖ_F): `v_F((√ϖ_F)²) = 1`; using ϖ_F² gives valuation 2 and is rejected. Keep the matching unitary translation generator and the map between lattices explicit.

## R14 (P3) — Two sampled locators omit the pages containing the claimed proof or map

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:2561, “Corollary 7.3 and proof, p. 84”; :2902, “Lemma 2.2 and proof, p. 7”.

**Claim:** those pages contain the complete cited arguments, including P → R in §9.2.

**Witness:** nt21 line 4144 starts p. 85 before the twisting/lifting/descent argument. nt21b line 330 starts p. 8; the universal morphism P → R is at lines 332–336.

**Repair:** cite Corollary 7.3, pp. 84–85, and Lemma 2.2, p. 7, followed by the construction of P → R, p. 8. Following these revised locators reaches the exact missing steps. No theorem-number change is needed.

## R15 (P2) — The Barsotti–Tate proof takes symmetric powers of the wrong dual

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:2905, “The dual of A² is ... hence a quotient ... with weights in {0, 1}”.

**Claim:** Raynaud's embedding gives the stated positive-weight quotient for the dual, after which the desired symmetric power of A² follows.

**Witness:** nt21b lines 322–327 distinguish the dual's finite-flat realization from the quotient onto A². With HT(ε) = −1, dualizing weights {0,1} gives {0,−1}; symmetric powers preserve this sign reversal.

**Repair:** state the finite dual being used, embed its finite flat group by Raynaud, and dualize the resulting lattice map to obtain `L ↠ A²` with crystalline weights {0,1}. Then use `Sym^{n−1}_{ℤ_p} L ↠ Sym^{n−1}_A A²`, including the change of coefficient ring. The weight test for `1 ⊕ ε^{−1}` gives Sym² weights {0,1,2}; taking the dual instead gives {0,−1,−2}. The repaired map produces the former, as the theorem requires. The declared Raynaud supplier gap is retained; its own wording already asks for the correct quotient.

## R16 (P2) — Part of the formal-torus gap is already supplied

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:321, gap `formal-torus-patching`, requesting “the resulting Ĝ_m^γ[2]-torsor ... on represented complete-local functors”.

**Claim:** the generic formal quotient/torsor theorem is missing and must be supplied anew by DeformationAndDerivedPatchingAlgebra.

**Witness:** TauCetiRoadmap/GlobalGaloisDeformations/README.md:997, §4.11, already states precisely the free formal-torus, square-equivariant determinant-fibre torsor theorem; §4.6 supplies its quotient. The package itself cites these in its GlobalGaloisDeformations contract.

**Repair:** import the existing generic quotient and torsor theorem rather than requesting it again. Narrow the gap to the additional simultaneous patched-module actions and the required transitivity on components, with precise hypotheses. Keep one earlier owner for those additional results, updating the matching plan entry; GlobalGaloisDeformations §4.11 is an available earlier location if that owner is chosen. Do not move the existing generic theorem into a second roadmap. The generic rank-one test is `y = 2x + x²`: degree 2 at p = 2, and an invertible formal substitution at odd p. This is already the supplier's stated distinction; it does not by itself supply either module action or component transitivity.

## R17 (P2) — The tensor Taylor–Wiles levels are not determined by their quotient

**Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:3943, “V_0(Q) ⊃ V_1(Q; N) with quotient Δ′_Q/(p^N)”.

**Claim:** this determines the levels needed for the freeness and base-level coinvariant theorem.

**Witness:** nt26 lines 1473–1482 define the Iwahori at Q and the kernel of every diagonal residue character. They explicitly distinguish this level from nt21b's level. An abstract quotient does not specify embedded compact subgroups or their ordered diamond action.

**Repair:** define V_0(Q)_v = V_0,v off Q and the transported Iwahori at Q; define V_1(Q;N)_v there as the kernel of the ordered diagonal map to `(k(v)×(p)/(p^N))^{2r}`. State the diamond identification and its compatibility with the ordered η_j, with an API and three discriminating Checks. For r = 1 and p = 2 at a place with a quotient of order 2, this is the full two-coordinate quotient C₂×C₂ of order 4; the determinant-only quotient has order 2 and must fail the definition. A deeper upper/lower-congruence subgroup with the same diagonal quotient must also fail V_0(Q)_v = Iw_v. Those controls exclude plausible wrong levels while preserving the source's theorem.

## Verified sound

### Coverage and principles

Read the four package files, the previous review and repair report, all 109 numbered target blocks and their dependency/Check text, and the plan's 13 gap entries. The report below records the new seeded sample, headline tests and every mathematical finding; it deliberately does not reproduce a 109-entry catalogue. The earlier review's numerical rows remain evidence only for the unchanged statements they actually calculate.

The package is a Part II extension with an explicit boundary at the parent's statements and one-line proof routes. It retains all ranks and all coefficient primes through the independent Hilbert induction; it does not claim the defective odd-rank construction without its additional block hypothesis. No computational algorithm, copied source passage, `set_option`, sorry'd data, fabricated proposition field, admitted example or process/path residue was found in the roadmap/Lean files. The sole retained definition has a real body. The mathematical layer titles and dependencies express the separate continuation, level-raising and lifting arguments; no heading is a source chapter title and no instruction to follow a source's organization was found. R05 and R16 are the ownership defects found, rather than grounds to reject the whole Part II scope.

Shape counts: 109 numbered targets, 109 `*Needs:*` lines, 109 `**Checks.**` blocks, 15 layer Example sections and 15 layer Dependency sections. Definition APIs and tests were inspected as mathematics, not just counted; R03, R09, R12, R13 and R17 identify failures in otherwise present definitions/Checks. Main-branch shape comparisons were AdicSpacesPartII, AdicSpacesPartIII and ReductiveGroupsPartII. `metadata.toml` records `topic = "math.NT"` and has no conflicting scope information.

### Seeded source verification

All 15 requested source locations were readable in the supplied legal cache. The table distinguishes agreement of the source theorem from defects in a proof sketch or convention. No new source fetch or manifest mutation was necessary. All 18 referenced works have manifest entries; 15 are accessible and three have settled uncertified status.

| Sample | Locator actually read | Hypotheses and result |
|---|---|---|
| 3.2 | nt21 lines 2661–2665, p. 54, remark after Lemma 3.3 | Classical k ≥ 2; m = 0 versus m ≥ 1 and the annulus boundary agree. |
| 3.3 | nt21 lines 2656–2660, p. 54, Lemma 3.3 | Twin slope sum k−1 and positive annulus indices agree; the roadmap uses the correct twin point despite the source's typo. |
| 3.6 | nt21 lines 2736–2744, p. 56, Lemma 3.6 | Same annulus and n-regularity are retained; the preceding large-image/noncritical inputs are cited. |
| 4.1 | nt21 lines 327–437, pp. 7–10, notation and standard assumptions | Matrices, parity of the cocycle, finite-place maps and base change agree. Missing inert-unramified μ condition: R02. The displayed Φ notation begins on p. 7, immediately before the cited notation pages. |
| 4.5 | nt21 lines 773–821, pp. 17–18, §1.8 and Proposition 1.15 | Correct parahoric inflation, θ in general position, order-six congruence, and multiplicity-one occurrence of τ in the reduction. |
| 4.8 | ct17 lines 167–170 and 283–336, pp. 4, 6–7, Proposition 2.2 | Correct ramified odd-residue-characteristic comparison and corrected quadratic relation. Missing local uniformizer convention: R13. |
| 5.9 | ct17 lines 1817–1871, p. 36, Proposition 4.3 and Lemma 4.4 | Dual-type pairing and vanishing argument agree after sufficiently small level; packet-sign premise is omitted: R03. |
| 6.3 | nt21 lines 3836–3850 and 3902–4018, pp. 78–82, Lemmas 6.6–6.7 | Generic prime has dimension 1 and characteristic p; odd extension degree and strict rank bound agree. Hecke comparison exceeds the source datum: R07. |
| 7.3 | nt21 lines 4124–4161, pp. 84–85, Corollary 7.3 | Weight 5, conductor 4 at 2, q ≡ 3 mod 4 and Steinberg at q agree. The roadmap properly makes the rank-n seed conditional. Proof-page repair: R14. |
| 8.3 | nt21 lines 4444–4507, pp. 91–92, Proposition 8.2 | Level-one seed, non-CM condition and n-regular accessible refinements retained; n = 2 treated separately from the source's n ≥ 3 setup. |
| 9.2 | nt21b lines 310–336, pp. 7–8, Lemma 2.2 and subsequent construction | Artinian coefficient objects and torsion-crystalline interval [0,n−1] agree; map direction P → R is correct. Dualization and page corrections: R15, R14. |
| 10.8 | nt21b lines 911–917 and 1234–1282, pp. 20, 26–27, Theorem 3.1 | Relative seed, non-CM forms and all ramified primes retained. Large-image input is applied to π′, not the arbitrary π. |
| 12.4 | nt26 lines 1460–1546, pp. 31–33, Lemma 4.5 and Proposition 4.6 | Correct full γ product, stabilizer shift c_G, all σ-ramification places and dyadic gap. Embedded level definition is missing: R17. |
| 13.1 | nt26 lines 1817–1851, pp. 39–40, Proposition 5.4 | Both dihedral places, their distinct primes and the quadratic splitting condition are retained. The roadmap's two-prime dyadic bound repairs the short source argument. |
| 13.10 | nt26 lines 2296–2340, pp. 49–50, Corollary 6.2, Proposition 6.3 and Theorem 6.4 | Bertrand induction uses r−1 only for r > 1; no SP₀ assumption. All ranks and totally real fields remain in scope. |

The author leaves kl87, bbm82 and kw09 uncertified; these are the only expressly unresolved source-access cases. They were not requested again. The repaired ls20 §8 locator was read directly. No accessible author-flagged locator was left unchecked merely because it was previously labeled uncertain.

### Computed adversarial table

These are tests of statements and interfaces, not assertions that examples prove the global theorems. “Pass” means the tested values agree and the negative control is excluded. A missing carrier or source-access limit is recorded separately below.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §0.1 component continuation | Node xy = 0; quadratic field point after splitting | Node has 2 components, each dimension 1; vanishing on x-axis gives 0 there but y-coordinate is nonzero on the other axis. A quadratic field point has 1 component over K and 2 after splitting, both over that component. | Pass for componentwise assertion; field-extension input remains a gap; R10 repairs its name. |
| §§0.2–0.4 determinant/polarization conventions | Rank 1; trivial group; infinitesimal character 1+εa | det rank 1 = trace = character; `(1+εa)(1+εb)=1+ε(a+b)`. For 𝒢₁ and c²=1 the square condition forces multiplier component 1 and ν(c)=−1. | Compatible sign must be fixed; no free sign is supplied by the trace theorem. |
| §§1.1, 1.2, 1.4 continuation headlines | n = 2; CM rank-two input | Sym¹ρ = ρ, rank 2 on each side. For induced CM ρ, Sym² has a rank-one summand and a rank-two summand, 1+2=3. | Pass: identity case and ordinary non-CM exclusion. |
| §2.1 repaired twin | χ₁ unramified versus χ₁(u)=−1 | τ² twisting character on units is χ₁(u)⁻¹ = 1 versus −1. | F06 repaired; wrong domain excluded. |
| §2.4 eigencurve headline | n = 2; two points on a CM component | Sym¹ gives the original automorphic rank 2; CM Sym² splits 1+2. | Pass for stated alternatives; no cuspidal CM symmetric-square conclusion. |
| §2.5 discriminant construction | Q₈ standard representation, n = 4; 1⊕η with η²=1 | Noncentral Q₈ element: Sym³ eigenvalues (i,i,−i,−i), discriminant 0; representation is not a character sum. For 1⊕η, ρ(g²) has eigenvalues (1,1), discriminant 0. | Fail / R08; local reducibility separates the two. |
| §3.2 boundary weights | (k,m)=(3,0),(4,0),(2,1),(6,0) | w = 4,24,−2,624; v₂ = 2,3,1,4; quotients (k−1)/v₂ = 1,1,1,5/4. Only first and third lie in the specified annulus. | Pass; the 5/4 case is outside the annulus, not a counterexample to integrality there. |
| §3.3 twin index | k=3,m=0 and k=5,m=0 | Required sums i+i′ = 1 and 2; positive indices have minimum sum 2, so the first is impossible and the second forces (1,1), slopes (2,2). | Pass. |
| §3.6 movement within annulus | n=3, refinement ratio −1; n=2 | Ratio squared = 1, violating regularity; Sym¹ rank = 2. | Pass; the ratio −1 example is excluded. |
| §3.8 Theorem D | Δ and weight-16 form at 2 | v₂(−24)=3, determinant valuation 11, slopes 3+8=11; v₂(216)=3, determinant valuation 15, slopes 3+12=15. | Pass; distinct slopes give non-root-of-unity ratios. |
| §4.1 involution | n=1 and n=2 | U₁ equation xc(x)=1; Φ₂²=−I and Φ₂ᵗ=−Φ₂, so θ₂²(g)=g. | Pass for matrix convention. |
| §§4.1–4.2 μ | Unramified quadratic residue fields F₉/F₃ | Unit quotient order 8/2=4. ν trivial on F₃× but ν(generator)=i; inertia scalar i differs from required 1. | Fail / R02. |
| §4.5 types | n=3,q=3,p=7 | dim τ=3·2=6; dim λ=4·8=32; torus order 3³+1=28, divisible by 7; order of 3 modulo 7 is 6. | Pass; congruence means constituent multiplicity, not equality of dimensions. |
| §4.8 Hecke relation | q=3; trivial and Steinberg characters | T=3 or −1 gives `(T−3)(T+1)=0`; the printed `(T−1)(T+3)` gives 12 or −4. T has nonunit eigenvalue 3 over ℤ. | Correct repair of source signs/integrality. |
| §4.8 lattice convention | k=1, E=F(√ϖ_F) | v_F((√ϖ_F)²)=1 gives ℤ; v_F(ϖ_F²)=2 gives 2ℤ. | R13. |
| §§4.9–4.10 group change | SL₂ versus PGL₂ | Cocharacter lattices ℤα∨ versus half-integral α∨; quotient has order 2. Steinberg Iwahori dimension is 1 in either group, which alone does not identify their full Hecke algebras. | Missing interface / R04; overlapping classification / R05. |
| §4.10 paving and module dimensions | n=7,9,11; elliptic curve negative control | 2+2+4=8=1+7; n=9: 1+11+2=14; n=11: Y=11+5=16, Z=2+3=5. Elliptic H¹ has dimension 2, versus 0 for an affine paving. | Numerical module lists pass; implication needs R06. |
| §5.4 type level raising | Odd rank n=5, blocks (3,2) | 3+2=5; the type at the rank-three block is the same 6-dimensional τ at q=3, not a rank-five representation of that finite quotient. | Pass for type/rank distinction and retained block hypotheses. |
| §5.9 multiplicities | l=5,s=1,c=1,d=0; both auxiliary signs | Minus product: (a,b)=(1,0); plus product: (0,1). Claimed strict inequality has opposite truth values. | Fail / R03. |
| §5.10 level-raising contradiction | a=2,b=1 | Perfect-pairing ambient dimension a+3b=5; two annihilating subspaces each a+b=3 would need 6≤5. Algebraically inequality becomes a≤b, i.e. 2≤1. | Pass once §5.9 is repaired. |
| §6.3 comparison | p=5,q=11,n=3, scalar unramified Frobenius | Eigenvalue ratios all 1; R^{(2,1)} requires a ratio 11. Residual 11≡1 mod5 does not imply characteristic-zero equality. | Fail / R07. |
| §6.3 generic-prime bound | n=3,d=13 versus d=12 | n+n²=12; 13>12, while 12>12 is false. Odd d also has gcd(d,2)=1 for the CM compositum. | Pass for strict bound and parity. |
| §6.4 Steinberg raising | n=3,p=7, local degree 6 | p>2n is 7>6; n(n−1)/2+1=4 and 6>4. | Pass; small local degree 4 is excluded. |
| §§6.7–6.8 long-block lifting | (n₁,n₂)=(4,3),l=5; partition (5,1,1); N=0 | n₁n₂=12 even; 5∤84; largest block 5>4. N=0 has largest block 1 and kernel dimension 7; (5,1,1) has kernel dimension 3. | Pass; semisimple q-string alone does not force Steinberg monodromy. |
| §6.9 p-adic level raising | n₁=n₂=1, q≡−1 modp | Condition becomes ψ₁/ψ₂ times q ≡1; taking ratio −1 gives (−1)(−1)=1. | Pass for normalized two-block congruence. |
| §7.3 weight-five seed | p=13,q=103 | q≡3 mod4 and q≡−1 mod13; a_q=0; `−q³(q+1)²≡0`, matching a_q²=0. | Pass mathematically; R14 locator. |
| §§7.4–7.6 conditional odd step and even seed | Nontrivial quadratic δ at g; ranks 1→2→4 | δ(g)=−1 changes the required polarized character by a factor −1, not 1. Even iteration doubles 1,2,4; it does not establish rank 3 by itself. | Pass: missing odd block is explicit and all-rank endpoint uses Layer 13. |
| §7.7 sixth/eighth powers | l=5 and 7 | Sym^{l+1} has ranks l+2 = 7 and 9, hence powers 6 and 8. | Pass; source's rank/power indexing retained. |
| §8.3 relative Theorem B | Steinberg refinement at l=2; n=2; CM | Ratio 2^{±1} has i-th power 2^{±i}≠1 for i≥1; n=2 gives Sym¹. CM Sym² splits 1+2. | Pass with source hypotheses. |
| §9.2 Artinian symmetric powers | n=1,2,3; p=2,3,5 | Weights {0}, {0,1}, {0,1,2}; n=3 interval length 2 exceeds p−2 for p=2,3 and meets it for p=5. | Torsion-crystalline statement preserves small primes; proof dual needs R15. |
| §9.2 dualization | 1⊕ε⁻¹ and its dual | HT sets {0,1} versus {0,−1}; Sym² gives {0,1,2} versus {0,−1,−2}. | R15; quotient must land in A². |
| §§9.6–9.8 dyadic lifting headline | p=2,n=3 or 4 | Need 2^a>5 or >7; a=2 gives 4, a=3 gives 8. Formal square at p=2: (1+x)²−1=2x+x². | Pass for retained dyadic case and bounds; minimality of gap is R16. |
| §10.8 all non-CM forms relative to seed | n=1,2; ramified prime 3 | Sym⁰ has rank 1 and Sym¹ rank 2. The 3-adic step is retained even for additive potentially good local type; replacing its chosen π′ by arbitrary π would remove the asserted large-image input. | Pass; no good-prime restriction. |
| §11.7 prime containment | 𝒪[[T]], Q=(0), 𝔭=(ϖ) | dim R/Q=2, dim R/𝔭=1; ϖ∈𝔭 and ϖ∉Q. | R12; Q⊂𝔭, not the reverse. |
| §11.10 untwisted tensor | r=1,2,3 | Ranks 2,4,6; weights {0,1}, {0,1,2,3}, {0,1,2,3,4,5}; r=3 blocks have ranks 4+2=6. | Pass; no SP₀ in rank-one base case. |
| §12.4 ordered Hecke product | r=1, α=2,β=3,γ₁=5 | η=(10,15); η₁η₂=150; corrected αβγ₁²=150; omitted-factor expression=30. | Correction passes; level definition needs R17. |
| §12.4 level kernel | r=1,p=2, each diagonal quotient C₂ | Full ordered quotient has 2²=4 elements; determinant-only quotient has 2 elements. | R17; the embedded kernel and ordering must be specified. |
| §12.7 tensor lifting headline | r=2; correct versus wrong σ weights | {0,1}+{0,2}={0,1,2,3}; {0,1}+{0,1} gives (0,1,1,2), with repeated weight 1. | Pass; spacing-two hypothesis is essential. |
| §13.1 large image | characteristic 2,M=6,q=2 or 4 | q±1 give {1,3} or {3,5}; no prime >6 divides them. More generally two distinct primes >M cannot both equal the only possible q+1. | Pass; two-prime correction handles the dyadic boundary. |
| §13.4 tensor element | r=4,q=17,x=2,y=3; swapped-slot example q=43 | Forbidden count 8≠14; allowed tensor eigenvalues are 7,6,10,11,14,12,3,5. Swapped-slot y of order 3 gives y³=y⁻³=1. | F07 slots pass; R09 repairs the count. |
| §§13.5–13.6 residual witnesses | r=1; r=2 | Residual ranks 2·1=2 and 2·2=4; for r=1 the witness is coefficient-conjugate r̄. A Steinberg condition on π does not supply one on Π. | Pass for residual, rather than characteristic-zero tensor, conclusion. |
| §13.7 replacement | Δ, finite-order twist | HT determinant 11+2·0=11 versus required 1. Residual exponent equation 2·5−11=−1. | Fail / R01; residual repair passes. |
| §13.8 block induction | p=5,r=1; p=7,r=3 | Ranks (p−r)+2r = 4+2=6 and 4+6=10, equal to p+r. | Pass for semisimplified decomposition, not an assertion of splitting. |
| §13.10 SP_n | n=6,7,12 | (p,r)=(5,1) uses {1,2,4}; (5,2) uses {1,2,3}; (7,5) uses {2,4,5,6}; (11,1) uses {1,2,10}. Each index <n, none 0. | Pass. |
| §§14.1–14.3 all-rank endpoints | Rank 1 and 2; CM rank 3; base ℚ | Sym⁰ rank 1; Sym¹ rank 2; CM Sym² decomposes 1+2, so non-CM remains necessary for the cuspidal endpoint. ℚ is totally real of degree 1. | Pass for assembly from SP_n and the non-CM restriction. |
| §14.4, Euler factor definition | n=0,1,2; α=2,β=3; x=0 | Factors: 1−x; 1−5x+6x²; 1−19x+114x²−216x³. At x=0 all equal 1; α↔β leaves each unchanged. | Pass; total subtraction is used only at j≤n. |
| §14.4, Δ test | k=12,n=2,p=2 | α+β=−24, αβ=2048, α²+αβ+β²=−1472; polynomial `1+1472x−3014656x²−8589934592x³`; convergence threshold 2·11/2+1=12. | Pass. |
| §14.4, analytic and degenerate tests | n=0; primes p≥2; Δ n=1 | n=0 product is ζ with a pole at 1, excluded by hn. At σ>n(k−1)/2+1 each root term has modulus <1/p<1, so local denominators are nonzero. n=1 threshold 13/2. | Pass; no 0/0 or out-of-range prime enters the Lean theorem. |

### Lean acceptance test, signatures and padding

Ran `lake env lean` on packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean from the pinned content checkout: exit 0, only the warning that the theorem at line 80 uses `sorry`. Its Tau Ceti module object was available, so no build was needed. No Lean process remains running.

A separate scratch copy with `#check @...` for both named declarations elaborated. The definition has type `ℕ → ℂ → ℂ → ℂ → ℂ`. The theorem retains `{k : ℤ}`, `f : Newform 1 k`, `n : ℕ`, `hn : 1 ≤ n`, α, β, and the prime-indexed Satake-pair equality. It concludes existence of a complex-differentiable L and unconditional HasProd on exactly `Re(s) > n(k−1)/2+1`. There is no section-variable loss and no mismatch with §14.4. No signature was changed.

The one-tactic probe covered the sole sorried theorem, not a sample: `simp` made no progress, `rfl` failed, `infer_instance` found no class target, and `exact f.LSeries_eulerProduct_hasProd_satakeParameters` had the wrong conclusion. The last pinned theorem concerns the original degree-two Euler factor and L-series, not all symmetric powers or their entire extensions. The retained proved symmetry example reindexes a finite product and verifies the sole definition's independence of the ordered Satake roots; it is a legitimate test, not a second admitted headline. No padding finding.

README-owned backticked Lean identifiers resolve to the two declarations `symPowerEulerFactor` and `symPowerEulerProduct_levelOne_entire`; mathematical notation such as P_D and SP_n is not presented as extra Lean declarations. The import header contains Mathlib and the one used TauCeti Satake module, using the pin's public-import/module syntax; no root TauCeti import or other-roadmap import is present.

### Headlines and statability

| Headline(s) identified in the Summary and endpoint layers | Acceptance-test disposition |
|---|---|
| Component continuation, Theorem 2.33 and Theorem D (§§2.4, 3.8) | Named in docstring; missing eigenvarieties and automorphy predicate. |
| Local-type/Steinberg level raising (§§5.4, 5.10, 6.4, 6.7–6.9) | Named in docstring; missing definite-unitary automorphic representations, types and associated Galois representations. |
| Theorem 7.1, Theorem E and Sym⁶/Sym⁸ (§§7.5–7.7, 14.1) | Named in docstring; missing the automorphic/Galois carriers. |
| Theorems A/B and the relative-seed step (§§8.3, 14.2) | Named in docstring; same missing automorphy carrier. |
| Symmetric-power automorphy lifting (§9.8) | Named in docstring; missing deformation rings and automorphy. |
| Untwisted tensor, tensor lifting and residual witnesses (§§11.10, 12.7, 13.5–13.6) | Named in docstring; missing automorphic Galois representations, pseudodeformation rings and patching objects. |
| SP_n over all totally real fields (§13.10) | Named in docstring; missing Hilbert automorphic representations. |
| Every non-CM modular form (§§10.8, 14.3) | Docstring names the endpoint and absent CM predicate, as well as the global carriers. Its good-prime analytic consequence is explanatory text, not a substitute theorem. |
| Entire level-one symmetric-power L-functions (§14.4) | Stated at the pins with native Newform, Satake parameters, HasProd and Differentiable; one simple Euler-factor definition. |

No additional statable headline was identified. Native symmetric tensor powers alone do not define automorphic representations or their functorial lifts. The general all-place statements remain README targets rather than being encoded as arbitrary predicates.

### Pinned declarations and duplication by object

The following declarations were opened at the actual library pins. Paths are library-repository-relative.

| File and line | Declaration / comparison |
|---|---|
| Mathlib/NumberTheory/Multiplicity.lean:359, :402 | `Nat.multiplicity_pow_two_sub_one` and the existing `padicValNat.pow_two_sub_one` alias; odd base and nonzero even exponent retained. At 5⁴−1 the valuation is 4. |
| Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934 | `Polynomial.discr`; the genuine discriminant, not a placeholder for distinct eigenvalues. Characteristic-polynomial degree prevents the zero-polynomial ambiguity. |
| Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean:50 | `GaussianInt = Zsqrtd (-1)`; units' fourth powers are 1 in the CM construction. |
| Mathlib/NumberTheory/Bertrand.lean:225 | `Nat.exists_prime_lt_and_le_two_mul`; its integer bounds give the strict prime interval used in §13.10. |
| Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275 | `NumberField.abs_discr_gt_two`; degree >1 rules out a nontrivial number field unramified at every finite prime. |
| Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107 | `HasProd` is convergence of finite products along the default unconditional filter. It does not itself assert nonzero factors or continuous multiplication; ℂ supplies the topology and the roadmap's convergence argument supplies nonvanishing. |
| Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172 | `Differentiable` quantifies DifferentiableAt at every point, so over ℂ it is the intended entire-function predicate. |
| Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:27 | `Complex.cpow` uses the principal logarithm off zero and explicit total values at zero. Here the base is a prime natural number ≥2. |
| Mathlib/Algebra/BigOperators/Intervals.lean:157 | `Finset.prod_range_reflect`; used in the retained symmetry test. |
| Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53 | `SymmetricPower` is the quotient symmetric tensor power. It supplies the algebraic object, not the desired analytic L-function theorem. |
| Mathlib/NumberTheory/EulerProduct/Basic.lean:175 | Euler-product theorem assumes absolute summability and multiplicativity; it does not prove symmetric-power functoriality or entire continuation. |
| Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:91, :122 | ζ and Dirichlet-character Euler products; neither is the arbitrary-rank cusp-form statement. |
| TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:98, :104 | Native eigenform nonzero condition and Newform with newness/normalization; zero forms are excluded. |
| TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91, :108, :117, :191 | Root multiset, sum/product characterization, existence of a pair, ordinary Euler product. At this pin the latter's region is `(k+1)/2 < Re s`; the README's weaker quoted region is valid. The Satake-angle bound is an explicit hypothesis, not a supplied Ramanujan theorem. |
| TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:192 | `CuspForm.hasEntireExtension_qExpansion_coeff`, positive weight, supplies the original form's entire extension, not all n. |

Object searches covered symmetric powers, Satake/Euler factors, entire L-series, automorphic representations, eigenvarieties, deformation rings, local types, the formal determinant torus and KL classification. The library near-match leads were compared to actual declarations rather than accepted as duplicates by name. No pinned declaration duplicates the retained headline. Parent and nearby roadmap ownership was also compared using the roadmap service; the actual overlaps found are R05 and R16.

### Supplier resolution, order and gaps

The board package index was read before treating any name as missing. The supplied overlap report has no conflicting head, dropped cited id or id defined only by an open revision. Its five closest roadmaps were checked: PotentialAutomorphyInfrastructurePartII (#2135), ModularityAndLanglandsExtensions (#1180), PotentialModularityAndCompatibleSystems (#1075), GL2ModularityLifting (#1071), ClassicalSerreModularity (#1020). Their residual-image, local lifting, patching and parent-endpoint ownership is imported here; the finer continuation and simultaneous functoriality arguments are this Part II's extension. R05 was found by a further object search, despite not appearing among those five nearest matches.

Resolved the named sections at main or the supplied open heads, not at remembered design labels. Representative anchors below also identify the critical changed contracts; the table gives repository-relative supplier paths.

| Supplier file | Resolved section anchors and contract check |
|---|---|
| TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md | :388 §0.2; :650 §1.10; :685 §1.12; :757 §1.15; :2408 §4.1; :2453 §4.3; :2509 §4.4; :2570 §4.8; :2765 §4.22. Parent predicates, low powers, eigenvariety interfaces and reductions are imported. |
| TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md | :842 §2.5: cyclic extensions of prescribed positive degree, disjointness and splitting, with CM refinement. |
| TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md | :296 onward Layer 0; :509 §§1.1–1.2; :612 §1.6 explicitly l>2; :655 §§2.1–2.2; :754–959 §§3.2–3.12 explicitly odd l; :1036 Layer 4; :1258 §5.5; :1384 §6.5; :1413–1703 Layer 7; :1973–2015 §§8.17–8.20; :2043 onward Layer 9. Weak/strong primitivity and the coefficient splitting-field distinction are retained. |
| TauCetiRoadmap/AdicSpacesPartII/README.md; TauCetiRoadmap/AdicSpacesPartIII/README.md; TauCetiRoadmap/AdicSpacesPartV/README.md | R1.9 and R2.9 resolve; Part V :297 Layer 1, :374 components, :406 nowhere density. R10 fixes the supplier name; the geometrically irreducible base-change assertion remains outside that layer. |
| TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md | :704 §0.2; :986 §0.5; :1934 §1.1; :2271 §1.3; :2607 §1.5; §1.4 reducibility ideals. Determinant versus trace and Henselian matrix-algebra hypotheses were distinguished. |
| TauCetiRoadmap/LocalGaloisDeformationRings/README.md | :360 F.1.5; :465 F.1.9; :891 F.2.11; :1276, :1334, :1430, :1534 local framed rings; :1900–2156 local types/components; :3084 partition rings; :3826–3842 torsion semistable quotients. Its HT(ε)=+1 convention is explicitly translated to the source's −1 convention at §8.14. |
| TauCetiRoadmap/GlobalGaloisDeformations/README.md | :830 §4.6; :997 §4.11; :1317 §5.7; :1878 §8.1; :1964 §8.3; :2029 §8.5; :2080 §8.6. R16 prevents a second owner for the generic torsor theorem. |
| TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md | :1098 §5.5; :1126 §5.6; :1224 §6.1; :1290 §6.6; :1303 §6.7; :1753 §9.2. In particular connectedness dimension is capped by ring dimension; the local node has value 0, a d-dimensional domain value d. |
| TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md | :2637 R07.1.40; :6372 R07.4.20; :7949–8008 R07.5.10–11. Raynaud embedding, crystalline-to-BT and residual-type inputs are distinct. |
| TauCetiRoadmap/GL2ModularityLifting/README.md | :725 §2.5; :782 §2.8; :892–1034 Layer 3; :1578, :1694, :1720 Layer 6. Arithmetic rank-two patching is imported, not rebuilt as the simultaneous rank-n comparison. |
| TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md; TauCetiRoadmap/PadicFamilies/README.md | :343 §2.11; PadicFamilies :1926 §2.8, :1964 §2.10, :1416–1612 §§2a.4–2a.14, :2811 §5.8. F03's nonexistent §2.6 has not survived. |
| TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md; TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md | :1596 §9.2 and :1747 §10.10; Serre :389 §2.4, :632 §3.2, :1601 §6.9, :1639 §6.11. Prescribed components and level raising retain their separate scopes. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md; TauCetiRoadmap/ArithmeticGaloisDuality/README.md | :1227 §1.8, :3264 §4.4, :4455 §7.1, :4862 §7.6, :5146 §7.8, :5243 §7.9, :5338 §7.10; Duality :2667 R02.3.5. The tensor decomposition is semisimplified; large-image and adequacy bounds are not interchanged. |
| TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md; TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md | §§1.5, 2.3, 6.2, 7.4–7.5; AG2.3 and AG2.6. Rank-two realization, polarization sign and coefficient-conjugation interfaces resolve. |
| TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md | :952–1072 R16.3.1–3.8: normalized parameters, Steinberg monodromy, wild supercuspidals and tamely dihedral order. |
| TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md | :864–1043 §§2.8–2.15; :1913–1947 §§4.9–4.10; :2149 §6.4; :2273–2291 §§6.9–6.10; :2588–2679 §§6.24–6.29; :4458 §11.2; :5045–5122 §§13.1–13.5. Abstract packets/transfer are supplied; explicit finite-unitary and socle calculations remain declared gaps. |
| TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md; TauCetiRoadmap/ReductiveGroupsPartII/README.md | Smooth :1446 SR.1.4, :1584 SR.1.5, :1917 SR.2.1, :2206 SR.2.3, :2572 SR.3.1, :2958 SR.3.4, :3460 SR.4.4; Reductive :2081 RG2.1.3, :4152 RG2.3.3, :5534 RG2.4.1, :5712 RG2.4.2. Split presentation does not silently become the ramified quasi-split presentation: the latter is a gap. |
| Other cited suppliers | PadicHodgeTheory §§4.4,5.3; PhiGammaModulesAndIwasawaCohomology §7.5; CompletedCohomologyAndLocalGlobalCompatibility §0.7; ClassicalSerreModularity R27.1; Chebotarev Layer 10; ClassFieldTheory; CharacterTheory Layer 9; AutomorphicLFunctionsAndLocalFactors AL.2 resolve. Their names do not supply the extra Drinfeld concentration or finite-unitary representation calculations without the declared contracts. |

The dependency command prescribed in the brief was run against this README with `--movable` and the current content/order. Its complete diagnostic was:

```text
depcheck: 236 roadmaps, 2159 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This mechanical result does not resolve the unrecognized old Adic name or the duplicate ownership: R10 and R05 explain those separately.

All 13 gap slugs agree between README and packages/ModularityAndLanglandsExtensionsPartII/design/plan.json, and each has a named supplier. Their absent conclusions were not classified as unowned prerequisites. The weak-primitive auxiliary-finiteness gap remains necessary because §8.20 retains §8.7's strong-primitivity assumptions; the dyadic gap remains necessary because the supplied unitary-form construction and potentially-BT result state odd-prime hypotheses. The base-field component, tensor-prime-selection, Artinian quotient, explicit packet/socle, finite-unitary Deligne–Lusztig, transfer, prescribed-component and Drinfeld contracts specify their extra inputs and relevant hypotheses. R10 corrects one supplier identity and R16 removes a nonminimal part of a contract. Since the verdict is needs changes, no conditional acceptance is being issued.

## Not verifiable

- kl87 Theorem 7.12 and §8: the original text is settled as uncertified/paywalled. The accessible ct17 application was read; it does not certify every clause of the proposed general KL API. No renewed request.
- bbm82 Théorème 3.1.1: settled as uncertified. The exact use in nt21b Lemma 2.2 and the supplier's Raynaud-embedding contract were read; the original book was not. No renewed request.
- kw09 Proposition 2.5: settled as uncertified. The accessible Newton–Thorne applications and the formal-functor supplier statements were read; the original proposition was not. No renewed request.
- The declared packet/socle and geometric weak-primitive extensions are supplier contracts, not completed proofs. Their full future proofs are not certified by this review. The accessible source statements and the mismatch they are intended to cover were checked.

There is no additional missing-text request. Ownership against open work was checked through the supplied index and roadmap tools, including the relevant head files; no unlisted pull request was discovered by an independent network search.

## Source issues

- **Misprint** in nt21 at Lemma 3.3, p. 54: the source places the original point in the second annulus; it should place its twin there; affects a stated result.
- **Misprint** in ct17 at §2.1, p. 7: the source assigns the double-coset generator roots 1 and −q; it should assign roots q and −1; affects a stated result.
- **Error** in ct17 at §2.1, pp. 6–7: the source uses invertible braid-group generators over the integers; it should invert q or use positive braid generators; affects a stated result.
- **Error** in ct17 at Theorem 2.4(2a), p. 10: the source requires s itself to be compact for tempered representations; it should require the commuting factor s₀ after removing the Jacobson–Morozov q-weight to be compact; affects a stated result.
- **Gap** in nt21 at proof of Lemma 6.7, p. 81: the source uses multiplicity one for the antiunit contribution of a union of places; it should obtain the lower bound from one place, whose induced representation has multiplicity one; affects the proof.
- **Misprint** in nt26 at §4, generators following the Taylor–Wiles level definition, p. 32: the source omits the product of all r γ-parameters in the second branch; it should multiply by that product before the initial i−r γ-parameters; affects a stated result.
- **Gap** in nt26 at proof of Proposition 5.4, p. 39: the source infers q>M from one prime t>M dividing q±1; it should use both distinct dihedral primes in characteristic two to exclude q+1=t; affects the proof.
- **Misprint** in nt26 at proof of Proposition 6.1, p. 47: the source makes the auxiliary t avoid the conductor of π; it should also avoid the conductor of the newly constructed π_a used at t; affects the proof.

The residual bars in nt26 p. 47 are present in the PDF. R01 must not be entered as an erratum against that source.
