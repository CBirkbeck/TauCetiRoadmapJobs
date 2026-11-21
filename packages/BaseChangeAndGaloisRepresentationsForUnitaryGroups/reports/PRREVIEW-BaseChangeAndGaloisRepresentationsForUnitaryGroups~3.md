# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 3c2271c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** needs changes

**Summary.** The mathematics held up wherever I could compute it: the ε-factor, rectifier and character formulas at depth zero, the Deligne–Henniart threshold of 10.27 (checked against the source), the Gauss-sum counterexamples in ranks 5, 6 and 8, the multiplicity comparison 13.8a, and the Satake and Hodge–Tate bookkeeping of 16.1. One finding blocks: theorem 16.1 constructs the same Galois representation of a definite unitary group that PotentialAutomorphyInfrastructurePartII §3.6, earlier in the merge order, already plans, and it does not cite it. There are three small corrections (five citations pointing at sections that do not state what is cited, a sentence of the description that no longer holds, a hypothesis of 6.3a that is automatic) and two format notes. The human reviewers have one licence question and one source note.

## R01 (P2) — Theorem 16.1 and PotentialAutomorphyInfrastructurePartII §3.6 both own the Galois representation attached to an automorphic representation of a definite unitary group through Labesse's weak base change

Two plans for one object leave an implementer building it twice and the consumers with two versions to reconcile. UniformWildKernelBounds already reaches 16.1 through HeckeIdealsAndTaylorWilesRelations and uses PotentialAutomorphyInfrastructurePartII directly. PotentialAutomorphyInfrastructurePartII is an open new roadmap placed before this one in the merge order. Its §3.6 (README line 556 at the head of #2135) asks to "prove that there is a continuous semisimple" representation attached to an automorphic representation of its definite group with algebraic archimedean component. That representation is unramified at inert places with hyperspecial-fixed vectors, de Rham above `l` with `HT_τ = {λ_{τ,j} + n − j}`, and crystalline where the component is unramified. It is built exactly as 16.1 builds it: Labesse's base change (its §3.5(2), through EndoscopicTransferAndUnitaryTraceComparison §6.29) followed by AutomorphicGaloisRepresentationsPartII AG2.3 and AG2.2 applied to the blocks. In weight 0 its Check gives `{0, 1, …, n − 1}`, the same normalisation as the trivial example of 16.1. Theorem 16.1 (lines 801–828) and the Scope section (line 854) compare 16.1 with AutomorphicGaloisRepresentationsPartII AG2.7 but never mention that target.

Smallest change: in 16.1 cite PotentialAutomorphyInfrastructurePartII §3.6 for the group of its §3.1. Then say in one clause what 16.1 adds, as the text already does for AG2.7: every Hermitian space definite at infinity, every CM `E/E⁺` with `[E⁺:ℚ] ≥ 2`, the explicit Speh twists `s_{ij}`, and the comparison at every `w ∣ ℓ`. Record the relation in the Scope section.

## C01 — Five route inputs are cited to sections that do not state them

An implementer who follows these pointers finds nothing at the cited place. None of them affects a stated result.

- **Depth zero up to twist.** The *Needs* line of 14.2 (line 658) cites EndoscopicTransferAndUnitaryTraceComparison §6.4 for this notion. That section is "Twisted characters of `θ`-stable representations"; the notion is FiniteReductiveGroups §6.4, as the statement of 14.2 and the Conventions say.
- **Extending a character from a closed subgroup.** The route of 6.3a (line 48), its *Needs* line (62) and the contract (line 908) cite AdelicAlgebraicGroups §2.1 for closed subgroups of idele class groups. That section ("Characters, logarithms and the split centre") contains neither closedness nor the Pontryagin-duality extension that the route uses. Mathlib at the pin has `PontryaginDual` but no extension theorem. Name an owner of the extension step, or make it a step of 6.3a.
- **Genericity of supercuspidals.** EndoscopicTransferAndUnitaryTraceComparison §10.16 is cited for "supercuspidal representations are generic" (line 398 and contract line 864), but it only assumes this under its *Hypotheses*. Cite a section that proves it, for instance the Kirillov-model target *mirabolic-derivatives* of SmoothRepresentationsOfLocalGroups SR.5.1, which LocalFactorsOfTwistsAndTypes §6.5 already uses for this purpose.
- **Weak base change.** "§§13.1–13.4" in 16.1 (line 827) and in the contract (line 864) takes in §13.2 (inputs to `GSp₄` solvable descent) and §13.3 (automorphic induction of a quadratic Hecke character). Only §§13.1 and 13.4 concern unitary weak base change.
- **Prescribed norm residue symbols.** The ClassFieldTheory citation in 13.8a (lines 559–560) and in the contract (line 912) names no layer, and I found no such statement there. Step (5) of the route needs it to realise every family of local classes globally.

## C02 — The description says the family index is identical in every pull request of the family, which no longer holds

The description says the three index files are "carried, with identical content, by every pull request of the family". At the heads of #2881 (FiniteReductiveGroups, a supplier of this roadmap) and #2883 (AdelicHeightsAndSuccessiveMinima), the index README is the earlier text, without the credit to the formal proof. The other 39 family pull requests match this head. Either bring those two up to date, or say which copy merges first and that the others are rebased on it.

## C03 — In 6.3a the condition "at which `η^κ` is unramified" on the split places to be avoided is automatic

At a place of `F` split in `E` the quadratic character `η` is trivial, so the clause (line 41) restricts nothing. A reader may wonder which split places it excludes. Dropping it, or saying that it always holds, would remove the doubt.

## N01 — Three supplier names are written in code font but declared nowhere

`AlgHeckeChar.galoisChar_local` (lines 595, 601, 868), `IsAttached.unique` (lines 821, 868) and `deRham_iff_potentiallySemistable` (lines 755, 928) are names proposed in the supplier READMEs. They are not declarations in any `Suggested.lean` or in the pinned libraries. Say that they are the suppliers' proposed names, or write them in prose.

## N02 — "The abelian window" (Check of 15.1, line 766) is used without definition

Say "the class of parameters allowed in 15.1", or define the term.

## Questions for the author

- 10.33c, 10.33d, 13.8a and 15.1 cite no literature, and the route of 13.8a leaves five steps open. Are these statements taken from the formal proof the family follows, which other sub-roadmaps of the family cite as [FormalProof]? If so, could each name its declaration there? I did not read the proof beyond its top-level listing.
- Does the route of 13.8a need the gap `λ_{τ,i} − λ_{τ,i+1} ≥ 100r⁴`, or is the bound inherited from the formal proof? As I read the route, the gap is used only to make the discrete series the only unitary representations with infinitesimal character `λ_τ`, and much smaller gaps give that. A stronger hypothesis is not wrong; I ask only because a reader will look for where the constant comes from.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 6.3a parity | real `v` complex in `E`, `κ = 1, 2` | `(z/|z|)^m` on `ℝ^×` is `sgn^m`; `η_v^κ = sgn^κ`; `m ≡ κ` forced | holds |
| 6.3a correction step | kernel of `∏ ℂ^×/ℝ^× → C_E/C_F` | `e ∈ E^×` lying in `F_u` at inert `u` forces `e ∈ F`, so the kernel is trivial; the image is compact, hence closed | holds |
| 10.27 valuation (sampled) | `ℚ_3`, `n(ψ) = 0`, `a = 2, 3, 4` | `v(c) = a + n(ψ)` = 2, 3, 4; DH `U(α/2)`, `α = a−1`, is `1+𝔭^{⌊a/2⌋}` | agrees with DH 4.6/4.7 |
| 10.27 `a = 1` | ideal `𝔭 = 𝔭^a` | every `c` with `v(c) ≤ 1` solves it (`c = 1, 3`) | Check true |
| 10.27 invariants | tame `V`, `a ≥ 2` | `V⊗χ` acts by `χ ≠ 1` on `W(β(χ))`, so no invariants | holds |
| 10.29a property 5 (sampled) | `m < n`, supercuspidal | `L = 1` both sides; `(σ⊗σ′)^I = 0` as dimensions differ | matches LocalFactors §6.5 |
| 10.30 added clause (sampled) | rank 1 | `χ∘Art_geo⁻¹ = (χ∘Art_ar⁻¹)^∨` | `(rec⁻¹π)^∨` consistent |
| 10.33a centre (sampled) | `n = 2, 3` | `det Ind 1(Frob)` = sign of the `n`-cycle = `(−1)^{n−1}` | `ξ|_{F^×}η_n` holds |
| 10.33b (sampled) | `n = 2`, `z̄ ∈ k_2∖k` | one fixed vertex (Nakayama); Green value `−(θ(z̄)+θ(z̄^q))` | holds |
| 10.33c `n = 1` | unit `γ`, `δ` | `O_γ = f(γ̄)`; `TO_δ = f(Nδ̄)·vol(F^×∖F_d^×) = f(Nδ̄)` | holds |
| 10.33d (sampled) | `n = l = 2` | orbit `{θ, θ^q}` splits into two orbits of size 1 over `k_2`, giving a principal series | agrees with 10.33a(b) |
| 10.34(ii) (sampled) | Galois side, tame `ξ = Δ_nθ̃` | Tate: `ξ(ϖ)G_n(ξ̄⁻¹)q^{−ns} = (−1)^{n−1}θ̃(ϖ)G_n(θ⁻¹)q^{−ns}`; `λ(F_n/F, ψ) = 1` | equals the automorphic side |
| 10.34(ii) automorphic side | zeta integrals | `Z(s) = vol K⟨v,ṽ⟩/dim σ`; exponent `n + n(n−1)/2 − n² = −n(n−1)/2` | with FRG 5.10(a), same formula |
| 10.34 rank 5 Check | `(q,n) = (4,5)`, `θ` of order 11 | `G_5(θ^{−1}β∘N) = G_5(θ^{−2}β∘N) = 32`; with `ψ_a` and `β(a) = e^{2πi/3}`: both `32e^{2πi/3}` | computed, true |
| 10.34 ranks 6, 8 | `(3,6)` `θ, θ^5` of order 28; `(2,8)` `θ, θ^3` of order 17 | all twisted sums `−27`; `G_8 = 16` for all four | computed, true |
| 10.34 character Check | `A(ξ)` at `ϖ^a u` | `θ̃(ϖ)^a = ((−1)^{n−1}ξ(ϖ))^a`, giving `(−1)^{(n−1)(a+1)}` | holds |
| 10.35(d) (sampled) | `St₂` | `N ≠ 0`, no `K`-fixed vector, depth 0, tame | holds |
| 13.8a Check (sampled) | `GL_3(𝔽_2)` | transvection values `1,−1,−1,2,−1,0` give fixed dimensions `1,0,0,3,1,2`; sum 42 = 168/4; 15 double cosets | true |
| 13.8a packet independence | endoscopic `BC = π_1 ⊞ π_2` | forces `τ_v^{N_{r_1}} ≠ 0` at every `v ∈ S`, contradicting joint cuspidality; `pq` even for `p+q` odd | consistent with the multiplicity formula |
| 13.8a `w ↔ w̄` | jointly cuspidal family | `τ^{N_a} ≠ 0` iff the cuspidal-support sizes have a subset summing to `a`, which is symmetric under `a ↔ r−a` | holds |
| 14.1 (sampled) | `w ∤ ℓ` | AG2.5 Caraiani (CSD) plus the AG2.2 twist | supplied |
| 14.2 (sampled) | `q = 2`, `θ` of order 7 | `⟨2⟩ = {1,2,4} ∌ 6` | Check true |
| 15.1 (sampled) | `S₄` model; step (2) | `ρ⊗sgn ≇ ρ`; `ρ|_{V₄}` = three characters; `[E^×:⟨x⟩U′] = |v(x)|·[𝒪^×:U′]` | holds |
| 15.2 (sampled) | weight `a ∈ (ℤⁿ)_w` | `HT_{τc} = {w − a_{τ,n+1−i} + n − i} = {w+n−1−h}` | holds |
| 16.1 (sampled) | Frobenius on block `(i,j)` | `q^{(n_i−1)/2}αq^{−s_{ij}} = q^{(n−1)/2}αq^{−(d_i−1)/2+j}` | holds |
| 16.1 trivial example | `n = 2`, `λ = 0` | `s_{10}=0`, `s_{11}=−1`; `r = 1⊕ε_ℓ^{−1}`; `P = (X−1)(X−q)`; HT `{0,1}` | holds |
| 16.1 HT | block `(i,j)` | block HT `= −S_{ij} + (n−1)/2`, independent of `n_i` | union is `{a_{τ,i}+n−i}` |
| 16.1 ownership | PotentialAutomorphyInfrastructurePartII §3.6 | same construction and the same weight-0 HT | R01 |

- Source locators checked against text: Deligne–Henniart Théorème 4.6 and Lemme 4.7 (pp. 110–111), Kottwitz 1986 pp. 237–238, and Caraiani–Scholze arXiv v1 §5.5 (numbering differs from the published version).
- Library declarations opened at the pin: `TauCeti.ClassFieldTheory.WeilGroup` (WeilGroup/Basic.lean:181), `weilArtinMap` (WeilGroup/ArtinMap.lean:125), `TauCeti.inertiaSubgroup` (LocalField/Unramified/Inertia/Basic.lean:112), `TauCeti.GlobalNumberFields.HeckeCharacter` (HeckeCharacter/Basic.lean:70), `complexComponent` (HeckeCharacter/InfinityType.lean:150), Mathlib `Topology/Algebra/PontryaginDual.lean`. Neither library has Weil–Deligne, smooth or automorphic representations, so the docstring's "not statable" is correct.
- Cross-roadmap citations resolved: about 70. These cover EndoscopicTransferAndUnitaryTraceComparison (22 sections), AutomorphicGaloisRepresentationsPartII (12 titles), FiniteReductiveGroups (9), LocalFactorsOfTwistsAndTypes (4), SmoothRepresentationsOfLocalGroups, AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, ClassFieldTheory, GlobalNumberFields (Completed), ClassicalArithmeticCompletion, ArithmeticGaloisRepresentations, PadicHodgeTheory, NoncommutativeAndEquivariantIwasawa, ArithmeticGaloisDuality, InductionRestriction, ReductiveGroups, HermitianFormsAndLattices, DiscreteSeriesCoefficientsAndAutomorphicMetrics and ModularityAndLanglandsExtensions §2.43. Exceptions are under C01.
- Dependency check: `depcheck: 171 roadmaps, 2000 edges, 0 problem(s)`; no UPWARD or CYCLE line. Family suppliers are earlier in the family index.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. It declares nothing, so there are no signatures to check with `#check`. There is no `set_option`, a single `import Mathlib`, and no sorry'd data.
- Gate: no substance failures.

Overlap check: read LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, FiniteReductiveGroups, UniformWildKernelBounds and IgusaVarietiesAndTorsionConcentrationPartII (open), and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison and GL2AutomorphicRepresentationsAndTransfer (main). I also checked PotentialAutomorphyInfrastructurePartII (open) and MetaplecticAutomorphicForms (main). Shared: Galois representations of definite unitary groups with PotentialAutomorphyInfrastructurePartII §3.6, earlier in the order (R01). Splitting characters: MetaplecticAutomorphicForms §3.3 and ThetaKernelsForUnitaryDualPairs only use local splitting data, and EndoscopicTransferAndUnitaryTraceComparison §6.3 owns the imaginary-quadratic case that 6.3a extends. Nothing else shared.

Source independence: 6 passages compared with 3 sources (10.27 statement, route and the threshold paragraph of 10.34 with Deligne–Henniart; the 10.33c statement and route with Kottwitz; the CS remark of 16.1 with Caraiani–Scholze), none shared. The largest share of locators is a tie between Deligne–Henniart 1981 and Caraiani–Scholze 2017, 2 of 8 locators each. Contents compared with Deligne–Henniart (§§0–4): independent; the layers carry the numbers of the supplier layers they extend.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005). Layers 14–16 extend polarized local–global compatibility (Caraiani) and Labesse's base change (2011) to definite unitary groups, which the family's theta-chain proof of the Riemann hypothesis for Dirichlet L-functions uses. This rests on the README and the family README.

## Not verifiable

- Kudla 1994 §1 and Harris–Kudla–Sweet 1996 §1 (6.3a): the first is paywalled; for the second, the service does not read the AMS host.
- Hecke 1918–20, Harris–Taylor 2001, Henniart 2000, Henniart 1992, Bushnell–Henniart 2005, Green 1955, HLTT 2016, Laumon–Rapoport–Stuhler 1993: these are cited without locators, and their texts were not readable through the sources service (paywall, or an AMS host not in a licence class).
- Labesse 2011 (16.1): the only copy found is on a third party's page and was not used. The hypothesis `[E⁺:ℚ] ≥ 2` agrees with EndoscopicTransferAndUnitaryTraceComparison §6.29.
- Caraiani–Scholze Corollary 5.5.5 in the published numbering: arXiv v1 numbers 5.5.5 as a lemma, and the published version is paywalled.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside its roadmap folder listed the three files of the family index, but those files belong to this pull request; and the check of the supplier order noted that this roadmap is not yet in the merge order, which is no defect before it is placed after its last supplier.

## Source issues

- none

## For the human reviewers

- Licence: the family index says the family follows a formal Lean proof. That repository's front page states the proof "was published without a license" and is mirrored for verification only. This README does not cite it, and I could not check whether any wording or arrangement comes from it.
- Not tested: of the two sources with the largest share of locators, Deligne–Henniart was read in full. Caraiani–Scholze was read only in arXiv v1, whose numbering differs from the published Corollary 5.5.5 the README cites.
