# Review of OrdinaryAutomorphicFormsAndModularityLiftingPartII (package, round 2)

**Verdict:** needs changes

Six findings, three blocking (P2). The package is repairable. Elaboration and the mechanical dependency check pass. The declared supplier gaps are not findings. The previously recorded human decision concerning the unsourced dimension bound remains in force; R01 concerns a new, purported calculation introduced by its repair.

## R01 (P2) — The new rank-one argument drops half the places above T

**Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:334`, also the rank-one Check at line 340: “M_χ contains the diagonal image” and “K_tors contains `(−1)_{v∈T}`”.

**Claim.** The tuple of local roots at the chosen places has trivial global Artin image because a global root is a principal idele. Consequently K has nonzero cyclic torsion, d(K) = h², and the rank-one obstruction pairing is always nonzero.

**Witness.** The displayed G_loc uses only ṽ. For a = (−1 at ṽ, 1 elsewhere), a/(principal −1) is −1 at every ṽᶜ. These places are inside S, where units are not quotiented out.

The calculation takes place before passing to the anticyclotomic quotient Γ. If x is the sum of the chosen local Artin images, conjugation gives −x for the other half in Γ. Global reciprocity for the principal idele therefore gives x + (−x) = 0, not x = 0. For the order-two tuple, 2x = 0 was already known. Local units at the omitted places cannot simply be discarded: on ℚ₂×, the character trivial on 2 and 1 + 4ℤ₂ and sending −1 to −1 is a continuous quadratic character. This refutes the stated idele factorization argument, not the dimension headline itself. No source opened supplies the additional global assertion about K. In particular, KW09 Lemma 9.4, p. 87 (KW09 line 4000), assumes a free formal-torus action and proves a torsor statement; it does not identify this K.

**Exact repair.** Retain the conditional argument using (★) and (C), the bound (b), and the rank-two alternative. Remove the unconditional assertions that the diagonal tuple lies in M_χ or K, that K_tors is nonzero, that d(K) = h², and that the pairing is always nonzero. Replace the rank-one calculation by `rank K = h² − 1` and `d(K) = h² − 1 + d(K_tors) ≤ h²`; determining K_tors and the relation map is an additional part of this target. If these stronger assertions are retained, supply the missing class-field argument with both sets of places and the actual quotient Γ. Include the idele calculation above as a negative-control Check. Add GlobalGaloisDeformations §§4.8–4.11 to the alternative route's `*Needs:*` list, and give KW09 its bibliographic reference.

**Repair test.** With one split pair, the corrected relation is x − x = 0 and permits either x = 0 or a nonzero element of order 2. The conditional count permits d(K) = h² − 1 or h² respectively; it no longer infers one case from a tautology. This is a new defect in the replacement argument, not a re-raising of the settled request to prove (b) from the cited source.

## R02 (P2) — Residual formal smoothness uses the wrong adjoint for unrestricted lifts

**Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:85`: “R^□_v is formally smooth over O when H²(F_v, ad⁰ρ̄) = 0”.

**Claim.** The trace-zero criterion applies to the unrestricted framed lifting rings imported from LocalGaloisDeformationRings §1.4.

**Witness.** For n = 1, O = ℤ₂, F_v = ℚ₃ and trivial ρ̄, ad⁰ = 0. Yet the character lifting ring is ℤ₂⟦u,X⟧/(u² + 2u), with nonreduced special fibre.

Indeed ℚ₃×(2) = C₂ × ℤ₂, so the ring is ℤ₂[C₂]⟦X⟧. Its special fibre is 𝔽₂⟦u,X⟧/(u²), not formally smooth. The full adjoint has H² of dimension 1 by local duality, whereas the stated ad⁰ has H² of dimension 0. The supplier actually uses the full ad: pull request #923, `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1335`. Its fixed-similitude GSp₄ specialization is at line 1526.

**Exact repair.** State the unrestricted GL_n criterion with H²(F_v, ad ρ̄), equivalently H⁰(F_v, (ad ρ̄)∨(1)); use the trace pairing to identify the latter when appropriate. State separately the fixed-similitude GSp₄ criterion for p > 2, with coefficient module 𝔰𝔭₄ = ad⁰ and its self-duality. The uses in §§5.4, 6.2 and 6.3 are of this latter criterion. For the fixed-multiplier tangent space, specify the Lie algebra of the multiplier kernel.

**Repair test.** The ℚ₃ rank-one example has full-adjoint H² dimension 1 and is excluded. For the intended GSp₄ auxiliary place, the no-eigenvalue-ratio condition still gives H⁰(𝔰𝔭₄(1)) = 0, so its use of formal smoothness survives. F05's section-number repair is correct, but its mathematical contract remains overbroad.

## R03 (P2) — PL supplier numbering no longer exists at the supplied open head

**Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:64`–68, and the PL citations in the scope, target routes, `*Needs:*` lines and layer dependencies: “PL.0”, “PL.1”, “PL.2”, “PL.3”, “PL.4”.

**Claim.** These identify the consumed sections of PotentialAutomorphyInfrastructurePartII.

**Witness.** Pull request #2135, `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:1104`, has §4.4 for the dyadic Taylor–Wiles theorem; lines 1202 and 1237 have §§5.2 and 5.4. No PL numbering or former-numbering alias remains.

**Exact repair.** Resolve the citations by content, throughout the package README, using this map:

| Consumed content | Current supplier location, #2135 unless specified |
| --- | --- |
| Principal-series ordinarity | §0.2, README line 321 |
| Soluble base change and descent | §0.9, line 445 |
| Prescribed auxiliary CM extensions | PotentialAutomorphyInfrastructure §2.5, README line 841, with its prescribed-completion input from PotentialModularityAndCompatibleSystems §2.16 |
| Generic local representations and smooth points | §1.3, line 553 |
| Definite unitary group | §3.1, line 725 |
| Algebraic modular forms; constituent Galois representations | §§3.2 and 3.6, lines 753 and 828 |
| Definite-unitary base change/descent | §3.5, line 808 |
| Universal ordinary Hecke algebra; Hida theory at odd l | §§3.9 and 3.11, lines 886 and 933 |
| Taylor–Wiles datum with a residual eigenspace | §4.1, line 1035 |
| Taylor–Wiles data including p = 2 | §4.4, line 1104 |
| Ordinary R = T with Ihara avoidance | §4.6, line 1132 |
| Strong residual oddness; relaxed adequacy | §§5.2 and 5.4, lines 1202 and 1237 |

**Repair test.** Each replacement heading was opened at the supplied head. §4.4 has exactly the O-coefficient, GHT-adequate presentation that §1.2 extends; §5.4 supplies the relaxed-adequacy variant. The extension construction is imported by that head from the parent, rather than owned by a surviving PL.0 target. These suppliers remain earlier in the merge order. The resolver's no-missing-citation result and the overlaps file missed this drift; they are not evidence that the old ids survive.

## R04 (P3) — Extra Taylor–Wiles primes do not cause the stated dimension mismatch

**Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:210`: “using `q = h¹_{𝒮^⊥,T}` Taylor–Wiles primes … is impossible”; the associated Checks at lines 429 and 443 assert opposite dimension inequalities.

**Claim.** The surviving scalar class forbids that many primes; adding one prime destroys the equality of patched dimensions.

**Witness.** With n = d = 2, #T = 3, q = 6, the displayed formula gives g = 6. Thus dim R_∞ = 19 + 6 = 25 and dim S_∞ = 5 + 6 + 14 = 25.

Starting with the datum of cardinality h¹ − 1, add a prime splitting completely in the residual splitting field and F(ζ₂ᴺ), outside the existing finite set. Its residual Frobenius is 1, which is semisimple; choose eigenvalue 1. Such primes exist by Chebotarev. The surviving class restricts to zero there, so it still survives. The new dual Selmer group still has dimension 1, and the Euler formula gives one additional presentation variable. It is killing the final scalar class that is impossible, not adding a redundant prime. With h² = h³ = 1, χ = 1 − 3 − 6 + 2 = −6 and h¹ = 6. Lines 429 and 443 additionally disagree about which ring has the larger dimension.

**Exact repair.** At line 210 replace the impossibility claim by the impossibility of annihilating the entire dual Selmer group. At line 429 remove the attribution of a dimension discrepancy to choosing an extra prime. Replace line 443 by the q = 6 calculation above, noting that redundant primes preserve the equality when g is updated. An appropriate failing count is instead omission of h³: it gives g = 7 and dim R_∞ = 26 > 25 = dim S_∞.

**Repair test.** The original q = 5 example gives 24 = 24; the added-prime example gives 25 = 25; omission of h³ gives 26 versus 25. The corrected Checks distinguish the actual error without changing the theorem's economical choice q = h¹ − 1.

## R05 (P3) — The auxiliary place is not a trivial-residual place

**Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:437`: “since ρ̄ is trivial at T”.

**Claim.** After adjoining v₁, residual triviality holds at all places in T = S₂ ⊔ R ⊔ {v₁} and justifies every local dimension formula.

**Witness.** Section 4.1 chooses regular semisimple Frobenius at v₁ and n ≥ 2. For n = 2 over 𝔽₄, diag(1,ω) has polynomial (X − 1)(X − ω), not (X − 1)².

**Exact repair.** Say that ρ̄ is trivial at S₂ ∪ R, with the large local degrees at S₂; at v₁ it is unramified with regular semisimple Frobenius, and the unrestricted lifting ring is O-flat and equidimensional of dimension n² + 1 by §2.24 (Sho18 Theorem 2.5), with §2.29 providing the sum-of-characters description.

**Repair test.** For diag(1,ω) the v₁ factor still has dimension 5. For the n = d = 2, #T = 3 example, the two dyadic factors have dimension 8 each and the v₁ factor dimension 5, so the completed tensor product has dimension 8 + 8 + 5 − 2 = 19. No triviality hypothesis at v₁ is needed.

## R06 (P3) — An extraction-line locator remains

**Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:350`: “(Ger19 lines 1003, 1113, 1146)”.

**Claim.** This is a public locator for the dependencies of Geraghty's Galois-representation construction.

**Witness.** Ger19 line 1003 is in the opening of §2.7 on printed p. 22; line 1113 is in Proposition 2.7.3's proof on p. 25; line 1146 is in Proposition 2.7.4's proof on p. 26.

**Exact repair.** Replace the parenthesis by “Ger19 §2.7, opening discussion, p. 22, and proofs of Propositions 2.7.3–2.7.4, pp. 25–26”.

**Repair test.** The first passage invokes CHT08 Lemma 2.1.4; the latter two invoke CHT08 Propositions 3.4.2 and 3.4.4 respectively. These are exactly the three dependencies being located. F07 fixed the two reported singular “line” occurrences but missed this plural occurrence.

## Verified sound

### Earlier findings, checked before the new pass

All eleven prior findings and the repair report were read. Quotes below are from the repaired package, not instructions adopted from the repair report.

| Earlier finding | Repaired passage and location | Assessment |
| --- | --- | --- |
| F01: missing seed fixed vectors | README:348, “`π_ṽ^{U_v} ≠ 0` for every v ∈ T ∖ (R ∪ S_2)” | Repaired. The seed is first used with trivial characters, then its maximal ideal is transported through the common mod-ϖ module. The negative control at line 357 excludes a spherical level for a ramified residual representation. |
| F02: unexplained rank-one pairing | README:334, “(★) is the step the sources do not supply” and “this reduction is only sufficient” | Partly repaired. The old unconditional vanishing is gone and the two extra inputs are explicit. The new unconditional torsion argument and Check have R01's defect. The already settled source gap in (b) is not itself a new finding. |
| F03: b₀ = 1 freeness | README:437, “`U(l^{1,1})` is sufficiently small and 2.2(1) applies with b₀ = 1” | Repaired. Torsion-free U_v₁ supplies the hypothesis; the central −1 obstruction is excluded. |
| F04: AutomorphicBundles numbering | README:128, “Layer 12 (§§12.11–12.13, formerly B5.10–B5.12)” | Repaired in the contract and gap section fields. The supplier also retains the former-numbering alias. The unchanged plan detail fields are the settled out-of-scope item in the repair report. |
| F05: wrong formal-smoothness locator | README:85, “§1.4: the tangent and obstruction description” | Partly repaired: the target exists and the downstream citations were changed, but the unrestricted/fixed-multiplier distinction is still missing (R02). |
| F06: patching locator | README:423, “KT17 §3, Proposition 3.1” | Repaired. KT17 line 630 starts the Λ-coefficient patching proposition; §4 starts at line 745 and concerns deformation theory. The manifest locator includes both. |
| F07: extraction locators | README:175, “proof of Lemma 2.13, p. 9”; line 225, “Ger19 §2, opening paragraph, p. 4” | These two are repaired. Pattern search finds the remaining occurrence R06. |
| F08: stale pin hashes | README:49, “at the pinned Mathlib”; line 60, “at the pinned Tau Ceti” | Repaired. All eight named declarations were opened at the actual pins below. |
| F09: downstream reasonableness | README:712, “GSp4NonregularModularityLifting consumes 5.2” | Repaired. Its contract at its current README:179 consumes §5.2. The separate AbelianSurfacesModularity supplier-gap ownership issue remains the intake issue explicitly settled as not actionable in this package. |
| F10: smallness as a carrier hypothesis | README:229, “is assumed only where stated” | Repaired. General levels are allowed in §2.1; §2.2 adds smallness at b₀. |
| F11: p ≥ 3 in the local gap | README:91, “with fixed similitude, p ≥ 3” | Repaired and equal in mathematical scope to the plan's needs sentence. The p = 2 trace-form failure remains excluded. |

### Coverage, principles and shape

Read all four package files, all 30 numbered targets, all 30 `*Needs:*` lines, the six layer dependency lists, the seven plan gaps, the previous review's computed table and the repair report. The earlier table has computed entries for the unchanged targets; those were used as permitted, while the seeded targets, changed passages and findings were checked afresh. The table below records the numerical or algebraic tests relied upon; it is not a claim that testing proves the end theorems.

The parent OrdinaryAutomorphicFormsAndModularityLifting remains the rank-two ordinary/Skinner–Wiles owner; its current scope was opened. This package extends it to the stated dyadic arbitrary-rank and fixed-similitude symplectic results. No re-planning, computational algorithm, copied source passage, good-primes-only shortcut, upward edge, cycle, sorry'd data or `set_option` was found. The source arrangement is not asserted to be the plan. The mathematical chain is forced: deformation and Hecke objects feed the global problem; patching and component support feed the dyadic result; selected symplectic components and patched Hida modules feed the symplectic result. The independent symplectic branch being placed second is not evidence of copying a chapter plan.

Shape was compared with `TauCetiRoadmap/PolylogarithmFunctions/README.md` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` on main. Required opening and closing sections, six Examples sections and six Dependencies sections are present. Definition/data blocks in §§1.1, 1.3, 2.1, 3.1, 3.5, 4.2, 5.1, 5.2, 5.4 and 5.5 have their mathematical API and at least three Checks; statements cite sources or explicit supplier targets. No own Lean identifier is promised in backticks without a declaration: the backticked non-library expressions are mathematical notation, not claimed Lean names. No process dates, job ids, machine paths, HTML anchors or pull-request numbers were found in the roadmap text. R06 is the remaining non-public locator. `metadata.toml` has topic math.NT.

### Seeded source verification

All 15 seeded targets were opened in the supplied legal extractions, including their hypotheses and proof passages where the roadmap uses a proof step. “Matches” below means the stated source content, with the roadmap's explicitly identified corrections; it does not certify the unsourced step of §3.2(b).

| Target | Locator and extraction witness | Comparison |
| --- | --- | --- |
| 1.1 | BCGP25 §5.4, pp. 121–122, line 5444 through line 5509; Tho17 Lemmas 2.8, 2.10–2.11, p. 7, lines 274, 291, 297 | Full Ĝ_n conjugacy, the GL₁ factor, absolute irreducibility and (n² + 1)#T − 1 match. README's inverse-frame map is correct; Tho17's displayed map has the opposite order. |
| 1.2 | BCGP25 (5.4.1)–(5.4.3), pp. 122–123, line 5523; Proposition 5.5.6, p. 126, line 5694; Tho17 Lemma 2.15, p. 10, line 432 | The h³ = 1 correction is necessary. Hypotheses F = F⁺(√−1), near adequacy, real-place condition and Λ-local factors are retained. The presentation has q = h¹_dual − 1 and g = q + #T − 1 − dn(n−1)/2. |
| 1.4 | BCGP25 Lemma 5.5.3 and proof, pp. 125–126, lines 5640–5687 | Least m, totally real L⁺/F⁺, scalar inclusion and Hilbert-symbol argument match after the stated source corrections. The extra-prime Check does not follow (R04). |
| 2.2 | Ger19 Proposition 2.5.3 and Corollary 2.5.4, pp. 16–17, lines 716–752; Proposition 2.6.1, p. 18, line 771; BCGP25 p. 132, lines 5996–6001 | Freeness is over Λ_b₀, with b₀ chosen for smallness; finite/reduced Hecke algebra and dense arithmetic control match. Ger19's arbitrary prime in §2 is retained. |
| 3.2 | BCGP25 Lemma 5.7.7, pp. 133–134, lines 6044–6059; Tho17 Lemma 2.15; Sho18 Theorems 2.5 and 4.6, lines 305 and 801; KW09 Lemma 9.4, p. 87, line 4000 | The stated dimension is 1 + nd, not 1 + n[F:ℚ]. The cohomological count gives only nd. Sho18's general flatness statement allows 2; the Breuil–Mézard theorem assumes l > 2. KW09 supplies the rank-two torsor alternative, not the asserted rank-one kernel calculation. R01. |
| 3.5 | BCGP25 Lemma 5.7.12 and Definition 5.7.13, p. 134, lines 6080–6087 | Uniform local fixed vectors and sufficient depth quantify over all lifts of the fixed residual local representation. Shrinking the level preserves the property. |
| 4.1 | BCGP25 Lemma 5.6.2, p. 128, line 5794; proof of Theorem 5.7.14, pp. 135–136, lines 6118–6158 | Soluble preparation, large dyadic degree, residual image preservation and the auxiliary regular-semisimple place match. The added uniform unipotence clause correctly concerns restrictions of original lifts. |
| 4.3 | BCGP25 proof of Theorem 5.7.14, pp. 136–137, lines 6160–6200, especially (5.7.16)–(5.7.17) at line 6178 | Patched dimensions agree and b₀ = 1 is now justified. Residual triviality must exclude v₁ (R05); the redundant-prime Check is R04. |
| 4.4 | BCGP25 list (1)–(5), p. 137, lines 6201–6220; BCGNT25 Lemma 3.2.4 and proof, pp. 33–34, lines 1636–1669 | Product-component argument matches. The dyadic local input comes from the named local supplier, not BCGNT25's different crystalline setting. |
| 4.6 | BCGP25 proof, p. 138, lines 6250–6277 | Sums of local characters can be made unramified; repeated patching transports the chosen components. The roadmap correctly includes S₂(L⁺) in T′. |
| 4.7 | BCGP25 Theorem 5.7.14, pp. 134–135, lines 6088–6109; proof, p. 139, lines 6289–6292 | Six hypotheses and finite restriction argument match. The proof uses finiteness of the prepared component quotients, not the unsourced general dimension step. |
| 5.2 | WHI22 Definitions 3.15 and 3.19, pp. 21–24, lines 985 and 1064; Lemmas 3.16 and 3.20, lines 1001 and 1073 | Semisimple, not necessarily regular, elements; centre-of-Levi detection; the H⁰ clause; and the conditional cyclotomic H¹ clause match. |
| 6.1 | BCGP25 Lemma 6.2.6, pp. 145–146, lines 6596–6605; proof of Theorem 6.3.4, p. 148, lines 6697–6710 | Dominance is proved from the global finite torsion-free Hecke component. The local theorem assumes dominance and supplies the unique special-fibre generalization. |
| 6.3 | BCGP25 Hypothesis 6.3.1, p. 146, lines 6628–6644; selected problem, p. 147, lines 6680–6690; Theorem 6.3.4 and proof, pp. 148–149, lines 6694–6746 | Fixed similitude, reasonable and tidy image, seed-selected components, distinct tame characters and the auxiliary-place condition are retained. The argument uses the seed and the unique special-fibre component, not mere nonzero support. |
| 6.4 | BCGP25 Theorem 6.3.4, p. 148, lines 6694–6696; proof ending at line 6746 | Finiteness follows from nilpotent kernel, finite Hecke quotient and complete Noetherian local hypotheses. |

The repaired §3.3 was additionally compared with BCGP25 Proposition 5.7.9 at line 6060 and its applications at lines 6152 and 6293. KT17 §3 was opened for F06. The newly cited Khare–Wintenberger source was absent from the original manifest: the sources service added KW09 from the author's institutional page, with Lemma 9.4 as locator. All thirteen author-recorded entries were preserved. There are now fourteen source keys, with no duplicate work introduced. Published/preprint numbering is distinguished for Ger19. No requested source was unavailable in the legal cache or the added author copy.

### Adversarial computations

The rows include every seeded target, every headline and every target touched by a finding. For unchanged non-sampled targets, the previous review's computed rows were retained only where they had actual values; those retained rows are explicitly identified. Empty, rank-zero or zero-ring inputs are excluded by the positive-rank/absolute-irreducibility and CNL_O hypotheses where appropriate; those exclusions were checked rather than treating such inputs as examples.

| Statement | Instances and computed values on both sides | Result / change |
| --- | --- | --- |
| Conventions: Artin, multiplier, weight dimension | q = 2, p = 7: geometric ε = 2⁻¹ = 4, arithmetic ε = 2; n = 4: ε^(1−n)δⁿ = ε⁻³; n = d = 2: rank T(l) = 4 and dim Λ = 5 | Distinguishes inverse Frobenius and the CM-degree factor. |
| 1.1: framing and quotient action | n = 4, #T = 3: 17·3 − 1 = 50 versus GL₄-only 16·3 − 1 = 47; T = ∅: relative dimension 0, ring unchanged | Correct. |
| 1.1: square roots and frame order | In 𝔽₂[t]/t², (x + yt)² = x², so 1 + t is not a square. For A = 𝔽₂[t]/t³, g = diag(1+t,1), r the swap matrix, α = 1: correct transformed local matrix = r; the wrong order gives g²rg⁻² = (1+t²)r ≠ r | README correct; Tho17 source misprint below. |
| 1.2: Euler/presentation count | n = d = 2, #T = 3, q = 5: χ = −5, h² = h³ = 1, h¹ = 1 − 1 + 5 = 5 = g; omitting h³ gives 6 | Corrected source count confirmed. |
| 1.2: real-place condition | B = I₂: Y + Yᵀ has zero diagonal, so I₂ is not in its image; B = Ψ₂ alternating: scalar class is in the norm image, so the H² map is 0 | Strong residual oddness distinguishes the two cases. |
| 1.3: full-adjoint weak adequacy | Retained prior computed row: H = {1} on k² gives dim U = 3; GL₂(𝔽₂) has semisimple elements 1,A,A² spanning 𝔽₄, dimension 2 < dim M₂ = 4, so U has dimension 2 | Nonabelian S₃ excludes the converse “irreducible implies weakly adequate”. |
| 1.3: near versus GHT adequacy | Retained prior row: the A₅ four-dimensional example has H¹(H,k) = H¹(H,ad) = 0 but dim H¹(H,ad/k) = 1 | Variant is genuinely distinct from the imported predicate. |
| 1.4: surviving quadratic class | √2 absent: m = 3 and [L⁺:F⁺] = 2; F⁺ = ℚ(√2): m = 4, [L⁺:ℚ] = 4. Scalar trace factor n = 2 becomes 0 in k. At a new split TW prime ψ_v = 0 | Main claim correct; adding a redundant prime does not remove ψ (R04). |
| 2.1: twist and Hecke polynomial | Retained prior row: n = 1 twist = 1; n = 2 twist u ↦ ∏τ τ(u₂)⁻¹; polynomial X² − T¹X + qT². At λ = (1,0), normalized factors for j = 1,2 are 1 and ϖ | Conventions agree with Ger19 and the local rings. |
| 2.2: finite freeness and torsion | n = d = 2 gives Λ free of rank 16 over O⟦w₁,…,w₄⟧; (1−[−1])(1+[−1]) = 0. If −I belongs to every tame level, [−I]−ε₀ acts by 0 but is nonzero; at torsion-free v₁ this case is excluded and b₀ = 1 | Correct repaired use of freeness. |
| 2.3: constituent generality | Retained prior row: rank-one conjugate duality is rᶜ = r⁻¹; Speh(1,n) gives the n characters 1, ε⁻¹,…,ε^(1−n), rather than an irreducible cuspidal Galois representation | Discrete constituents and the cuspidal residual localization remain distinguished. |
| 3.1: multiplier and residual conjugacy | n = 3 at c_v: (−1)⁻²(−1) = −1; n = 4: (−1)⁻³ = −1. In finite characteristic-2 k, squaring on k× is bijective | Correct. |
| 3.2(a): component dimension | n = d = 2, #T = 3: dim Rloc = 1+12+6 = 19; h¹−h² = −1; framing dimension = 14; lower bound 19−1−14 = 4 = nd | Correct count; it does not give 5. |
| 3.2(b): target and source typo | Same instance: target 1+nd = 5; printed 1+n[F:ℚ] = 9. A finite algebra over a 5-dimensional Λ cannot have a 9-dimensional component | Target's correction is necessary; missing proof input remains explicit. |
| 3.2: rank-one kernel | rank G_loc = #T+d; source rank = #T+d+h¹; target rank = d+2#T−1; rank K = h¹−#T+1 = h²−1. Thus d(K) is h²−1 or h², depending on d(K_tors) = 0 or 1 | R01: principal reciprocity supplies x−x = 0, not x = 0; the second alternative has not been established. |
| 3.2: conditional torsion mechanism | P = O⟦x⟧[t]/(t²−1,(t+1)x): t=1 piece is O⟦x⟧/(2x), with both a horizontal O component and a vertical k⟦x⟧ component; t=−1 piece is O⟦x⟧. J=(t−1) leaves the vertical component | (C) is a real additional hypothesis; equality of mod-ϖ character quotients alone is not flatness. This validates keeping (★),(C) conditional. |
| 3.2: determinant parity | On (g,a)j, ν(det x)=−aⁿ whereas ν(x)ⁿ=(−1)ⁿaⁿ; correction δ^(n+1) gives −1 at every c_v, for both n=1 and n=2 | Correct homomorphism and multiplier. |
| 3.3: fixed-vector repair | Ramified residual at hyperspecial v: every lift remains ramified, spherical eigensystems matching it = 0. Unramified seed at v₁ or Q_N: invariants contain a translate of a nonzero maximal-compact invariant | Repaired hypothesis excludes the negative example and covers both applications. |
| 3.4: uniform inertial support | Retained prior row: trivial GL₂ representation has N=0; Steinberg has N≠0; both have inertial support [T,1]. A finite list of Weil inertial restrictions therefore concerns blocks with monodromy forgotten | Supplier gap is formulated with the necessary distinction. |
| 3.5: sufficient depth | For GL₁ over K=ℚ₅, a nontrivial tame order-4 character has O_K× invariants 0 but (1+ϖ_K O_K) invariants of dimension 1; for U′⊂U, V^U⊂V^U′ | Correct uniform, shrinking-stable notion. |
| 4.1: preparation | A tame ψ≠1 reducing to 1 gives polynomial (X−ψ(σ))(X−1)^(n−1), unequal to (X−1)ⁿ. No index-2 quotient follows from H¹(H,k)=0 | Original lifts versus arbitrary prepared-field lifts are correctly distinguished. |
| 4.2: torsion coefficient ring and boundary | q=j=0: S_N=S_∞=Λ and H_N=H, hence H free over Λ; for the degree-two split-at-2 field example Λ has rank 16 over Λ⁰ and the displayed zero-divisor product is 0 | Correct extension of regular-base patching. Wrong explanatory dimension Check is R04. |
| 4.3: dimensions and extra primes | q=5 gives g=5 and 24=24; q=6 gives g=6 and 25=25; if h³ is incorrectly set to 0, g=7 and 26≠25 | R04. |
| 4.3: auxiliary local factor | n=2, Frob=diag(1,ω): two distinct eigenvalues, residual representation not trivial; v₁ factor dimension 5; dyadic factors 8,8; total 8+8+5−2=19 | R05; target dimension remains correct. |
| 4.4: components | R empty: the product indexing set reduces to components at v₁. For n=2 at a tame R-place, the distinct-character ring has one component; the unipotent ring has the unramified and nonzero-monodromy components | Matches the source's product description and unique-generalization assertion, with the stated local inputs. |
| 4.5: support and arithmetic points | Retained prior computed row: patched dimension 24, augmentation length 5+14=19, so each selected quotient has dimension at least 5=dim Λ; support intersection is C_X∩V(a∞) in both directions | No use of the unprepared bound (b) is needed here. |
| 4.6: removal of v₁ | With R=∅, corrected T′ still contains S₂(L⁺) and v′₁. Omitting S₂ removes all ordinary factors; retaining it gives one chosen factor for each dyadic place | Corrected source convention is essential and present. |
| 4.7: finiteness | The tame ψ example of §4.1 is excluded as a nonrestriction. Each restricted component quotient is finite over Λ_L; finite restriction and specialization give finite-dimensional residual fibre over k_F | Matches the finite-map route; arbitrary prepared-field lifts are not used. |
| 4.8: reduced R=T | A hypothetical component finite over Λ/(ϖ) has dimension 4 when dim Λ=5 and can miss all characteristic-zero arithmetic weights; bound (b) excludes it. A 5-dimensional component finite over Λ dominates a Λ-component | Correct conditional use of (b); R01 concerns the newly proposed proof, not this implication. |
| 5.1: symplectic framing | Retained prior row: dim 𝔤𝔰𝔭₄=11, dim 𝔰𝔭₄=10; #T=1 gives 11−1=10 framing variables, #T=3 gives 33−1=32, not GL₄'s 47 | Correct fixed-similitude framing. |
| 5.2: reasonableness | A torus image has nonzero invariant Lie directions and fails condition (a). On the diagonal Cartan, trace pairing =2(xx′+yy′): nondegenerate for p=3, identically 0 for p=2 | Correct p>2 boundary; enormous Sp₄(𝔽₃) example matches the named supplier. |
| 5.3: semisimple TW places | Frob=1 gives Levi=GSp₄ and N_v=0, an allowed semisimple nonregular case. With H⁰≠0, the inflation–restriction kernel used by WHI22 is not forced to vanish | General semisimple local gap and explicit H⁰ hypothesis are necessary and present. |
| 5.4 and smoothness contract | At p=3, 19≡1 mod9 but 7≢1 mod9. If q_w₀≡1 modp, the eigenvalue ratio 1 equals q and invariant Cartan dimension is at least 2. For unrestricted rank-one lifts over ℚ₃, ad⁰=0 but special fibre has u²=0, u≠0 | Intended GSp₄ condition excludes the first failure; generic contract needs R02. |
| 5.5: selected components | Retained prior row: p-distinguished ordinary generic fibre has one component, so its flat reduced selected quotient is the whole ordinary component ring; without uniqueness there can be more than one minimal prime through the seed | Selection is not erased from the statement. |
| 5.6: weight boundary | Large regular weights satisfy k_v≥l_v>2; parallel weight 2 has l_v=2 and fails that inequality | The separate ordinary weight-2 Galois contract supplies the boundary; no use of regular-weight WHI22 alone. |
| 6.1: dominance | One split p-adic place: Λ_v=O⟦x,y⟧, dim=3; relative dimensions 16 over O and 14 over Λ_v agree: 1+16=3+14=17 | Correct. The p=2 torsion case is excluded. |
| 6.2: symplectic dimension count | d=1, #S=3, t=7: g=7−4+3−1=5; R relative dimension=5+30+4=39; S relative dimension=7+33−1=39 | Correct; t counts cyclic factors, not places. |
| 6.3: support on selected component | Test R=O⟦x⟧/(x(x−ϖ)): two horizontal components, both specialize to x=0. A module supported only on x=0 is nonzero yet misses the other component | Roadmap uses the stronger unique-special-fibre component Z, so this wrong proof is excluded. |
| 6.4: nilpotent thickening and completeness | For Λ=O⟦x,y⟧, R=Λ[ε]/ε²→Λ has kernel square 0 and R free of rank 2. Mod m_Λ, length R/m_ΛR=2 versus length target=1; both finite | Correct Noetherian complete thickening argument, not an assertion that reducedness suffices without finiteness hypotheses. |

### Pinned-library and Lean audit

The checked pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened these actual declarations, rather than relying on names returned by the resolver:

| Declaration | File and line at the pin | What was verified |
| --- | --- | --- |
| Matrix.trace; Matrix.trace_one | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`, `:144` | Sum of diagonal entries; trace of identity is cardinality. |
| Module.End.IsSemisimple | `Mathlib/LinearAlgebra/Semisimple.lean:56` | Semisimplicity of the associated R[X]-module; no invertibility condition. |
| Submodule.span | `Mathlib/LinearAlgebra/Span/Defs.lean:46` | Infimum of submodules containing the given set. |
| Matrix.symplecticGroup | `Mathlib/LinearAlgebra/SymplecticGroup.lean:102` | Submonoid defined by A J Aᵀ=J; not a similitude carrier. |
| LieAlgebra.Symplectic.sp | `Mathlib/Algebra/Lie/Classical.lean:157` | Skew-adjoint matrix Lie subalgebra for J. |
| groupCohomology | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183` | Homology of inhomogeneous cochains of a group representation; not the missing global Selmer carrier. |
| TauCeti.completedGroupAlgebra | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Inverse limit over open normal subgroups. Native inputs are a commutative ring and a topological group carrier; completeness/profiniteness are not silently fields of the definition. The applications explicitly choose the appropriate profinite groups and O. |

Object searches across both pinned libraries for deformation rings, Hida modules, ordinary Hecke algebras, automorphic representations and the residual-image predicates found no implementation of the headline carriers. Existing group cohomology, symplectic matrices, trace, span and completed group algebras are imported, not redefined.

`lake env lean` was run on the package's absolute Suggested.lean path from the pinned content checkout: **exit 0, no output, no warnings**. No TauCeti module build was necessary. The file has one `import Mathlib`, one module docstring and an empty namespace. There are **zero declarations and zero sorried theorems**: the exhaustive one-tactic padding probe and explicit-binder `#check @name` inventory both have zero cases. No surrogate theorem, arbitrary Prop, sorry'd data or imported roadmap module was introduced.

The seven headline conclusions were matched to the docstring individually:

| Headline | README | Lean coverage and missing carriers |
| --- | --- | --- |
| Dyadic ordinary finiteness | 4.7 | Named; ordinary polarized deformation rings and the automorphic seed carrier absent. |
| Dyadic ordinary reduced R=T | 4.8 | Named; also definite-unitary algebraic forms and universal ordinary Hecke algebra absent. |
| Dyadic component dimension bound | 3.2(b) | Named; actual deformation rings absent. |
| Symplectic ordinary reduced R=T | 6.3 | Named; GSp₄ automorphic/Galois data, Hida–Hecke algebra and selected flag-image deformation rings absent. |
| Symplectic ordinary finiteness | 6.4 | Named with the same missing carriers. |
| Reasonable-image Taylor–Wiles places | 5.3 | Named; G_{F,S} with decomposition/local conditions and dual Selmer carriers absent. |
| Dyadic Taylor–Wiles presentations over Λ | 1.2(4) | Named; same global/local deformation and Selmer carriers absent. |

None can be stated faithfully by adding only a few simple definitions to native carriers. No statable headline was found omitted. Finite-group linear algebra subtargets are not substituted for them.

### Supplier resolution, ownership and order

The board-packages index was read before searching for owners. The `roadmaps show` and object-oriented `roadmaps grep` tools were used over main and the supplied 438 open heads. The closest five scopes were opened: PotentialAutomorphyInfrastructurePartII (#2135), AbelianSurfacesModularity (#1746), GSp4NonregularModularityLifting (#1817), AutomorphyLiftingBeyondTaylorWiles (#1824), and PotentialModularityAndCompatibleSystems (#1075). PotentialAutomorphyInfrastructurePartII owns the odd-prime ordinary theory and O-coefficient dyadic presentations; the package supplies the dyadic Hecke theory and Λ-coefficient variant. AutomorphyLiftingBeyondTaylorWiles has the unpolarized/derived-patching direction, not these ordinary component theorems. GSp4NonregularModularityLifting consumes them explicitly at `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:173`, `:177`, `:179` and `:1602`.

By-object searches included nearly adequate images, reasonable GSp₄ images, Thorne's complex, ordinary universal Hecke algebras, Hilbert–Siegel Hida modules, sufficiently deep levels and the two end-theorem locators. AutomorphicCongruences (#1816), README:446 and :641, concerns its GU(2,2)/Skinner–Urban algebra; this is not a second owner of the definite-unitary dyadic construction. No duplicate fully qualified Lean name is possible here because Suggested.lean declares none. The earlier intake warning concerning AbelianSurfacesModularity's gap was checked against its README:384 and :522 and is not re-raised as a package repair.

Every cited supplier section was resolved by reading its content, not merely its heading. The following ledger uses repository-relative supplier paths; line numbers are README lines, excluding the one-line wrapper printed by `roadmaps show`.

| Supplier copy | Consumed sections and opened README locations | Resolution |
| --- | --- | --- |
| LocalGaloisDeformationRings #923 | §1.3:1308; §1.9:1406; §1.4:1333; §1.17:1508; §F.2.6:745; §§2.17:1944, 2.22:2034, 2.23:2048, 2.24:2072, 2.29:2204; §§6.24:3324, 6.27:3354, 6.29:3411, 6.31:3504, 6.35:3574 | Exist. Full ad versus fixed multiplier is R02. §2.17 is the four-distinct-eigenvalue special case; §6.24 requires trivial residual representation and large local degree, so the declared general gaps are not already supplied. |
| GlobalGaloisDeformations #920 | §3.3:405; §4.2:712; §§4.8:888, 4.9:925, 4.10:953, 4.11:996; §§8.1:1877, 8.2:1939, 8.3:1963, 8.4:1995 | Exist. Rank-two twisting/determinant results are not a proof of the new general rank-one calculation. |
| DeformationAndDerivedPatchingAlgebra #1034 | §1.12:281; §§4.1:898, 4.2:914, 4.6:990; §§5.2:1049, 5.3:1062, 5.4:1082, 5.5:1097; §§6.1:1223, 6.3:1258, 6.5:1283, 6.7:1302; §§8.2:1605, 8.3:1626, 8.4:1646, 8.5:1672; §9.6:1865 | Exist. Finite residue, Noetherianity, actual actions, regular-base depth and component-support hypotheses were compared. §4.2 needs dimension ≥1; this is retained when producing arithmetic points. |
| ArithmeticGaloisRepresentations #856 | §§7.4:4649, 7.5:4827, 7.9:5242, 7.11:5397 | Current headings exist. Trace-zero versus full-adjoint variant, group conventions, vast/tidy/enormous predicates and the Sp₄(𝔽₃) example agree. |
| AutomorphicFormsOnReductiveGroups #1037 | §§7.4:1218, 7.5:1245 | Weighted right-action carrier, finite stabilizers, coefficient base change and sufficient smallness imported accurately. |
| AutomorphicGaloisRepresentationsPartII #1006 | GSp₄ construction:536; AG2.2 twisting:1285; AG2.3 arbitrary regular existence:1364; AG2.5 away-prime compatibility:1857 and temperedness:2012 | Exist. The GSp₄ construction here is over ℚ, so the totally-real GSp₄ contract remains a real gap. |
| PotentialAutomorphyInfrastructure #1081 | §§2.3:819, 2.5:841, 3.44:1778, 3.47:1837 | Exist, including the CM prescription route and ordinary base change. |
| PotentialAutomorphyInfrastructurePartII #2135 | Current numbered targets in R03 | Mathematical imports found; old ids need repair. Odd-l hypotheses in §§3.2 and 3.6 distinguish the owned extension here. |
| SmoothRepresentationsOfLocalGroups #1688 | §SR.3.2:2710 | Bernstein inertial classes, blocks and projective generators exist; the exact LLC/uniform-level interface is declared as a gap. |
| ModularityAndLanglandsExtensions #1180 | §3.9:1882 | Discrete GSp₄ automorphic representations, general/endoscopic type and transfer agree. |
| AutomorphicBundles #1069 | Layer 12:4505; §§12.11:4928, 12.12:4981, 12.13:5010; former-numbering alias:222 | Correct repaired citation. Its four settings do not supply the three requested ordinary Hilbert–Siegel interfaces. |
| EndoscopicTransferAndUnitaryTraceComparison #999 | §13.2:5070 | The downstream deferral is to the stated GSp₄ solvable-descent input, not to a theorem owned here. |

The overlaps file reports no shared conflicting head or dropped ids; direct checking found R03 nevertheless. No ids of this package have been dropped by the repair, and the current downstream citations to §§2.1–2.2, 3.1–3.2, 4.7–4.8, 5.2, 5.4–5.6 and 6.3–6.4 still resolve. No additional two-owner finding was established.

The seven declared gaps have the same slugs in the plan and README and named earlier suppliers: `dyadic-flag-ring-dimension`, `gsp4-semisimple-taylor-wiles-places`, `inertial-types-and-block-levels`, `hilbert-siegel-hida-module-free`, `hilbert-siegel-taylor-wiles-coinvariants`, `hilbert-siegel-ordinary-classicality`, and `gsp4-galois-representations-totally-real`. Their hypotheses and interfaces are explicit. The two clauses of the flag-ring contract concern the same local ring and its specializations; the Bernstein clauses concern the one uniform-type interface. No gap with supplier `none`, vague unnamed output or duplicate supplied target was found. Their eventual implementation is not certified by this review.

Dependency-check output, verbatim:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Manual resolution of the supplier ids is still necessary, as R03 demonstrates. The internal forward reference §1.2(4)→§1.3 does not form a cycle: §1.3 consumes only suppliers, and §1.4 uses the cohomological setup rather than being needed to define it.

## Not verifiable

- The strengthened general dimension bound §3.2(b) is stated in BCGP25, but the cited proof's corrected count is one short. The general inputs (★) and (C), and the asserted rank-one torsion calculation, are not proved by the texts opened. Sho18's relevant Breuil–Mézard theorem assumes l > 2; KW09's free-torus torsor does not fill this general gap. The prior human decision on retaining the dimension headline stands. R01 requests correction of a new claimed computation, not withdrawal of that headline.
- Ger19's published Math. Ann. version was not independently opened; the legal preprint and its manifest numbering/concordance were used. No published-page identity is asserted beyond that concordance.
- Labesse and Chenevier–Harris results appearing inside Ger19's proof were checked as named supplier inputs, not independently recertified from their original publications. They are not new package-owned statements. The same limitation applies to proofs of upstream roadmap contracts: their current statements and applicability were checked, not their future formalizations.
- The seven declared supplier gaps remain contracts. Acceptance after these findings are fixed would still be conditional on them.

## Source issues

- **Misprint** in Tho17 at the natural transformation after Lemma 2.11, printed page 7: the source conjugates the local representation by the frame on the left; it should use inverse frame on the left, compatible with Definition 2.9; affects a stated result.
- **Error** in BCGP25 at §5.4, printed page 123: the source excludes degree-three cohomology for nonempty T; it should retain h³ = h⁰(ad r̄(1)) = 1 at p = 2; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed pages 133–134: the source derives the full weight dimension from its relation count; it should account for the nonzero h³ term and supply an additional dimension argument; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, printed page 133: the source uses [F:ℚ] in the weight dimension; it should use [F⁺:ℚ], giving 1 + nd; affects nothing.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed page 133: the source invokes the prepared trivial-residual local theorem before preparation; it should provide the required lower bound for the general residual flag-image rings; affects the proof.
- **Gap** in BCGP25 at Proposition 5.7.9, printed page 134: the source asserts a nonzero residual Hecke localization for insufficiently constrained levels; it should require seed fixed vectors at the remaining places of T; affects a stated result.
- **Misprint** in BCGP25 at Lemma 5.5.3, proof, printed page 125: the source places F⁺ inside the next real cyclotomic field; it should choose the least m with K⁺_m not contained in F⁺; affects nothing.
- **Misprint** in BCGP25 at Lemma 5.5.3, proof, printed page 126: the source assigns the quadratic class and unramifiedness to reversed or different extensions; it should use L⁺/F⁺; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6(i), printed page 126: the source names µ as the prescribed multiplier; it should name χ; affects nothing.
- **Misprint** in BCGP25 at §5.6.1, printed page 129: the source applies Artin reciprocity to an inertia element; it should apply the inverse Artin map before evaluating the character; affects nothing.
- **Misprint** in BCGP25 at §5.4 and Definition 6.1.4, printed pages 121–122 and 141: the source places polarized or symplectic global representations over the wrong field symbol; it should use the appropriate totally real Galois group; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed page 137: the source names a module from a later base change in the support inclusion; it should use H₁ at that stage; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed page 138: the source omits the dyadic places from T′; it should retain S₂(L⁺) to retain the ordinary conditions; affects nothing.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, printed pages 135 and 139: the preparation list omits uniform unipotence needed by the final restriction map; it should impose Lemma 5.6.2 for restrictions of all original local lifts; affects the proof.
- **Misprint** in BCGP25 at §6.3 before the selected problem, printed page 147: the source labels local stabilizing characters by p; it should label them by the place v; affects nothing.
- **Gap** in BCGP25 at Hypothesis 6.3.1 and preceding paragraph, printed page 146: the source cites an ordinary weight-two construction for a regular-weight seed; it should also cite the regular-weight Galois construction over the totally real field; affects nothing.
- **Gap** in WHI22 at Proposition 3.18, printed page 22: the source's hypotheses omit H⁰ vanishing used through Lemma 3.16; it should include Definition 3.15(1a), already present in reasonableness; affects a stated result.
