# Review of EnriquesSurfaces (pull request #1286 at a85be7e)

**Verdict:** needs changes

:robot: Independent AI-assisted full re-review (418 changed lines since bbfb9e2, above the incremental threshold). One blocking finding is new and comes from the merge order rather than from this head: the general Coxeter geometric-faithfulness theorem that §5.2 and `Suggested.lean` claim to own was merged into RootSystems on main (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`, commit 03a683f6 of 2026-11-04) with an explicit ownership boundary that leaves this roadmap only the T246 application. The previous review's two companion-file findings were relocated into `Suggested.lean` rather than repaired. The gate, the dependency check and the targeted elaboration pass.

## R01 (P2) — The general Coxeter faithfulness theorem now has an earlier owner

**Location:** `TauCetiRoadmap/EnriquesSurfaces/README.md:9` ("Section 5.2 owns the general geometric-faithfulness theorem and its root-sign theory on the native Coxeter representation"); `README.md:525–541` (the general theorem, root-sign theory, transport and four general Checks); `README.md:41`, `:561`, `:621`, `:674`; `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:40` (`coxeterGeometricFaithful`) and `:85` (`reyeGeometricFaithful`).

**Claim:** This roadmap owns injectivity of `CoxeterSystem.geometricRepresentation` for every Coxeter system, the positive/negative root–length criterion, reindexing and parabolic transport, and the "2B equals the positive integral Gram" comparison; RootSystems supplies only abstract exchange, Matsumoto and finite-root chambers.

**Witness:** RootSystems on main, `README.md:11–17`, owns "the general Coxeter geometric sign and faithfulness theorems"; `:31–37` states the boundary with EnriquesSurfaces §5.2: the general arbitrary-index sign, faithfulness and integral comparison are RootSystems §1, while "the T246 lattice, its specified integral reflections, its mod-two action and its congruence kernels belong to EnriquesSurfaces §5.2". Its §1.2 (`:282–333`) proves `geometric_sign_criterion` (ρ(w)αᵢ positive iff i is not a right descent, for arbitrary I, with the same minimal-coset-representative and alternating-word inputs this README lists); §1.3 (`:335–380`) proves `geometric_faithfulness` for every Coxeter system, reindexing, extension by zero for standard parabolics and, for finite I, transport to `I → ℝ` with the same simple-generator formula; §1.4 (`:382–416`) proves `integral_geometric_realization` for any integer matrix A with A = 2B, including transport to a chosen ℤ-basis of another free module and the degenerate [[2,−2],[−2,2]] case. `coxeterGeometricFaithful` is therefore the same object as `geometric_faithfulness`, and `reyeGeometricFaithful` is its instance for `reyeDiagram` (A = 2B = diag 2, edge −1 = `reyeRealPairing`, transported by `Finsupp.linearEquivFunOnFinite`). RootSystems precedes this roadmap in the merge order (it is on main), so the supply direction is fixed.

**Repair:** Import, do not restate. (a) Scope (`:9`), the supplier row (`:41`) and the From Tau Ceti paragraph: replace "RootSystems Layer 3 supplies abstract exchange and Matsumoto; its finite-root chambers do not supply indefinite geometric faithfulness" and "Section 5.2 owns the general geometric-faithfulness theorem" by a contract on RootSystems §§1.1–1.4 (`geometric_sign_criterion`, `geometric_faithfulness`, the reindexing/parabolic transport, `integral_geometric_realization`), each with its hypotheses (arbitrary index type, no nondegeneracy, integer matrix equal to 2B). (b) §5.2: delete the first two paragraphs, the "General geometric faithfulness and root signs" API block and the four general Checks (`:525–541`); keep the T246 definitions, state the integral/real comparison as the §1.4 instance with A = −(β Gram), keep B, K, G and the two kernels. Rewrite the `*Needs:*` line (`:561`), §5.3's Dependencies (`:621`) and U3 (`:674`, "§5.2's general geometric faithfulness theorem") to cite RootSystems §1.3. (c) `Suggested.lean`: delete `coxeterGeometricFaithful` and `reyeGeometricFaithful` (the T246 comparison stays in the README as a target citing RootSystems §1.4) and amend the module docstring accordingly; `reyeReductionImage` remains the statable headline, since the mod-two image is on this roadmap's side of the boundary.

## R02 (P3) — RootSystems layer citations that do not exist on main

**Location:** `README.md:9`, `:41`, `:674` ("RootSystems Layer 3 supplies abstract exchange and Matsumoto", "RootSystems Layer 3's exchange/deletion theorem"); `README.md:561` ("RootSystems Layer 4's finite-parabolic longest elements").

**Claim:** RootSystems' Layer 3 supplies exchange and Matsumoto, and its Layer 4 supplies longest elements of finite parabolics.

**Witness:** RootSystems on main has Layers 1–3 only (`README.md:248`, `:432`, `:504`); Layer 3 is "classification and concrete Weyl groups". Exchange, deletion and Matsumoto are Tau Ceti natives that RootSystems itself consumes (`README.md:166–169`: `CoxeterSystem.strongExchange`, `CoxeterSystem.exchangeCondition`, `TauCeti.matsumoto`), and longest elements come from `TauCeti.longestElement` in `TauCeti/LinearAlgebra/RootSystem/LongestElement.lean` (`README.md:198–201`; at the pin that file's `longestElement` needs a finite Weyl group, which E₇ and E₈ have). A "Layer 4" exists only at the head of the open revision #1196, and there it is "coefficient reflections and the greatest root", not longest elements; the pull-request description names neither that revision nor its numbering.

**Repair:** Cite the Tau Ceti declarations directly (the exchange and parabolic ones are already in the From Tau Ceti paragraph at `:25`; add `TauCeti.longestElement` with its finite-Weyl-group hypothesis) and delete the "Layer 3"/"Layer 4" attributions. This folds naturally into R01's rewrite of the RootSystems row.

## R03 (P3) — Delete the folded-in catalogue from `Suggested.lean`

**Location:** `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:104–309` (sections `LatticeTargets`, `ReflectionTargets`, `SheafTargets`), including `:177` `gram_det`, `:179` `beta_pairing`, `:241` `rootMap_form`, `:266` `baseGlobal`, `:301` `scalar_naturality`.

**Claim:** Folding the three companion files into the acceptance test satisfies the previous review's R01/R02.

**Witness:** The three sections are the companions byte-for-byte (the diff deletes `LatticeTargets.lean`, `ReflectionTargets.lean`, `SheafTargets.lean` and inserts their bodies). They add 43 declarations that the README never names (`grep` of each backticked name in `README.md` returns 0 for all of `gram`, `model`, `modelBasis`, `vector`, `f10Coordinates`, `betaCoordinates`, `rCoordinates`, `beta`, `r`, `parity`, `reyeCarrier`, `betaSpan`, `simpleReflection`, `adjacent`, `gram_det`, `beta_pairing`, `r_square`, `r_beta_pairing`, `betaSpan_eq_reyeCarrier`, `parity_surjective`, `simpleReflection_involutive`, `simpleReflection_isometry`, `simpleReflection_preserves_parity`, `t246Entries`, `t246`, `realRoot`, `rootMap`, `realIntersection`, `realReflection`, `rootMap_bijective`, `rootMap_form`, `rootMap_reflection`, `baseGlobal`, `scalarAut`, `sectionEvaluation`, `SquareTrivialization`, `RawFixedSurfaceArrow`, `class_square_eq_one`, `scalar_naturality`, `Index`, `Ambient`, `gram_isSymm`, and the anonymous decidability instance). Among them: theorems mirroring README Checks (`gram_det` is `README.md:515`; `beta_pairing` is `:516`; `r_square` and `r_beta_pairing` are `:517`; `betaSpan_eq_reyeCarrier` is `:510`/`:515`; `rootMap_form` and `rootMap_reflection` are `:549`/`:555`); definitions no headline uses (`baseGlobal`, `scalarAut`, `sectionEvaluation`, `SquareTrivialization`, `RawFixedSurfaceArrow`, `model`, `modelBasis`, `vector`); two proved theorems, of which `scalar_naturality` is one application of the pinned `Scheme.Modules.globalSectionsSmul_naturality` (`TauCeti/AlgebraicGeometry/Modules/GlobalSections.lean:143`); three duplicates of declarations already in the file (`adjacent = reyeAdjacent`, `t246Entries = reyeCoxeterEntry`, `t246 = reyeDiagram`, each closed by `rfl` in my probe); 23 declarations without a docstring; and section docstrings describing the content as "Illustrative targets … suggestions, not an exhaustive specification" and "Suggested interfaces … nonexhaustive", which contradicts the module docstring's acceptance-test role. The one-tactic probe (`decide`, `simp` with the unfolding set, `rfl`) closed none of the 15 sorried statements, so the finding is the Check/API/duplication criterion, as in the previous review's R02, not a one-tactic closure.

**Repair:** Delete lines 104–309 (the three sections and their imports `TauCeti.AlgebraicGeometry.LineBundle.Class`, `…LineBundle.TensorProduct`, `…Modules.GlobalSections`, `TauCeti.LinearAlgebra.IntegralLattice.Basic` if nothing else uses them). The README keeps every statement as a Check or target; the determinant stays −1, the β pairings stay (−2, 1 on edges, 0), and no headline changes. This was the previous review's R01/R02: not repaired, relocated.

## R04 (P3) — K3Surfaces K7.C does not exist

**Location:** `README.md:11` ("the supplier contract excludes K7.C") and `:654` ("not consequences imported from K3Surfaces K7.C").

**Claim:** K3Surfaces has a section K7.C whose content this roadmap declines to import.

**Witness:** At the #1285 head, Layer 7 of `TauCetiRoadmap/K3Surfaces/README.md` is §7.1 (K7.A, `:796`), §7.2 (K7.B, `:865`) and §7.3 (`:952`); no K7.C. Its `README.md:39` already assigns "the converse canonical-cover comparison" to EnriquesSurfaces E1 and E6.U0–U4, and `:1018` says §7.3 "has no Enriques supplier". The worker's citation resolver reports the token as found nowhere.

**Repair:** Delete the two K7.C tokens and say what is meant: K3Surfaces states no Enriques canonical-cover comparison, and this roadmap's §6.2 U0 owns it.

## R05 (P3) — Simple connectivity is not what K3Surfaces K2 states

**Location:** `README.md:219` ("the simply connected canonical K3 cover from K3Surfaces K2").

**Claim:** K3Surfaces K2 supplies π₁(X) = 1 for the K3 cover.

**Witness:** K3Surfaces §2.1 (`README.md:472–476`) supplies the even unimodular cup lattice and an integral marking H²(X,ℤ) ≃ Λ = U³ ⊕ E₈(−1)², and §1.1 (`:410`) supplies b₁ = 0; a search of that README for "simply connected" or "fundamental group" finds only the period domain (`:712`). The computation at `:219` needs only H₁(S,ℤ) = ℤ/2, which follows from H₁(X,ℤ) = 0 (torsion-free H² and b₁ = 0 give it by universal coefficients) and the connected degree-two cover: an index-two subgroup with trivial abelianization lies in the commutator subgroup, so the abelianization of π₁(S) is ℤ/2.

**Repair:** Cite K2's integral marking and K1's b₁ = 0 for H₁(X,ℤ) = 0, derive H₁(S,ℤ) = ℤ/2 from the degree-two cover as above, and drop "simply connected".

## Previous findings

- R01 (companion form) — not repaired: the companions were folded into `Suggested.lean` (commit a85be7e "stray files folded in") instead of deleted; current R03.
- R02 (companion padding) — not repaired: the same declarations now sit in the acceptance test; current R03.
- R03 (source records) — not carried as a finding: no roadmap folder on main carries a `sources.toml` (0 of 142), the manifest is a board-package file (`packages/EnriquesSurfaces/sources.toml`, absent; `packages/K3Surfaces/sources.toml` exists), this review edits no manifest, and the gate's `source-material` check passes. Every cited text was verified from the worker's cache below.

## Verified sound

**Gate, dependency check and build.** The worker's gate at a85be7e passes every check. My rerun of the prescribed dependency check against the supplied candidate order returned exactly:

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `lake env lean TauCetiRoadmap/EnriquesSurfaces/Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`) finished in 38 s with exactly 15 `declaration uses 'sorry'` warnings and no error; the worker's `signatures.md` note of a type mismatch at line 273 is an artefact of its probe file, not of the head. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder is `README.md`, `Suggested.lean`, `metadata.toml`.

**Signatures.** The worker's elaborated types of all 54 declarations were compared with the README: the 11 declarations the README names keep every binder (`coxeterGeometricFaithful` keeps `{I W : Type*} [Group W] {M : CoxeterMatrix I} (cs : CoxeterSystem M W)`; `reyeGeometricFaithful` and `reyeReductionImage` quantify over the actual `reyeDiagram.Group`); the other 43 have no README statement to compare (R03). No section variable was lost, no sorry'd data, no `set_option`, no stand-in carrier, no admitted example.

**Headline inventory.** Layer 1: canonical cover, Picard specialization, coefficient comparisons, Num ≃ U ⊕ E₈(−1). Layer 2: all-n hyperelliptic classification, resolved double planes. Layer 3: presentation equivalence. Layer 4: Reye family and parameter quotient. Layer 5: general faithfulness (now RootSystems §1.3, R01), T246 realization (its instance), normal kernels, full mod-two image. Layer 6: generic nodal automorphisms and curve transitivity, lifting criterion, very-general unnodal group, algebraic generic-open group. Layer 7: representation comparison and counts. Of these, `reyeReductionImage` is the one headline that is both statable at the pins and this roadmap's own; the module docstring correctly names the missing carriers for the rest (surface predicate, Num quotient, specialization maps, presentation groupoid, Reye family, markings, period families).

**Sources.** The cache ids used below: `dolgachev` (arXiv 1412.7744v2), `cossec-dolgachev-1985` (nodal85 author copy), `davis` (second edition author copy), `peters-sterk` (TU/e institutional copy), `enriques-one` (April 19, 2024 manuscript), `martin` (arXiv 1908.00049v1), `stacks-coherent`, `stacks-resolve`, `stacks-divisors`. Printed-page offsets: `davis` pdf page = printed + 9 for the body and + 19 for Appendix D (headers checked at lines 2395, 4727, 17556); `enriques-one` pdf page = printed + 16; `peters-sterk` pdf page 27 = printed 1624.

| Sampled target | Locator opened | Result |
| --- | --- | --- |
| 0.1 Surface adapters | SchemeAndStackFoundations main §2.6 (`README.md:3437`), §2.20 (`:4275`), §5.2–5.3 (`:6653`, `:6701`), §5.6 (`:6921`), §5.9–5.10 (`:7129`, `:7175`); StableReduction main Layer 4 (`:529–551`): Rees blowup of a finite-type ideal with universal property, exceptional divisor and strict transform | The named cuts exist with the stated content; discrepancy +E recomputed below |
| 0.2 Linear systems | AlgebraicModuliForArithmeticGeometry (#853) §1.1 (`:306`), §1.3 (`:602`); SSF §4.9 (`:5448`) Stein factorisation | Quotient convention and Stein factor exist; no arbitrary-base-change claim for normalization |
| 0.3 Polarized isomorphisms | AlgebraicModuliForArithmeticGeometry §2 (`:1071`), §7.3 (`:9297`) | Action groupoid and framed Picard groupoid exist |
| 1.1 Canonical cover and lift | `dolgachev` lines 272–313 (§3, pp. 7–8: RR gives D or K−D effective, torsion class is K; étale double cover for p ≠ 2, K3 invariants c₂ = 24, K_X = O); SSF §4.6 (`:5291`: obstruction in H²(X,T_X)⊗I, line bundles in H²(O)⊗I); AMAG §7.3 `picard_infinitesimal_lifting` (`:9399`, flat small Artinian thickening with I killed by the maximal ideal); AbelianSchemesAndArithmeticModuli (#849) A4.8 (`:2325`); `stacks-coherent` lines 3641–3655 (Theorem 30.28.4, tag 089A, pdf p. 76–77); K3Surfaces K0.A (`:213`, `:291` the Enriques consumer paragraph) | Supports the statement; W(k)/pⁿ⁺¹ → W(k)/pⁿ has kernel ≅ k killed by p, so the AMAG hypothesis holds |
| 1.6 Genus-one geometry | `dolgachev` lines 435–457 (§4, pp. 11–12: nodal = contains a smooth rational curve; D² = 0 gives D = kE with h⁰(E) = 1, h⁰(2E) = 2; two double fibres when K ≠ 0; Φ(D) = min D·E over E² = 0, Φ = 1 iff two base points); NeronModelsPartII (#870) §2.1 (`:3785`) genus-one fibration with the standing geometric hypotheses | Supports the statement |
| 2.1 Hyperelliptic classification | `enriques-one` lines 14195–14206 (Prop. 2.6.1, printed pp. 290–291: the three systems, fixed component only when n = 1 in the second case), 14245–14248 (Prop. 2.6.4, p. 292: no fixed component gives two simple base points, one infinitely near if not classical), 14358–14368 (Cor. 2.6.5, p. 294: after the two blowups, n = 1 genus-two fibration, n ≥ 2 generically finite of degree 2 onto minimal degree n−1), 14963–14971 (Prop. 3.2.1, p. 308) | Supports the statement; the defective font map leaves the statements readable |
| 2.2 Double-cover algebra | `dolgachev` lines 468–470 (§4, p. 12: D² = 4, Φ = 1, two base points, degree-2 map to P² branched along an Enriques octic) | Supports the statement; the algebra O ⊕ A⁻¹ is the roadmap's construction |
| 2.3 Branch resolution | `dolgachev` lines 488–521 (§4, pp. 12–13: degree-8 polarization, 4-nodal quartic del Pezzo, degenerate octic, Figure 2 with p ≠ 2) | Background supports; the floor/parity transform is derived here (recomputed below) |
| 3.2 Branch presentations | `stacks-divisors` lines 3204–3209 (Lemma 31.29.5, tag 0BXJ, pdf pp. 70–71: Pic(Pⁿ_R) = ℤ for a UFD); `stacks-resolve` lines 2335–2337 (Lemma 54.17.1, tag 0C5R, p. 52) and 2390–2394 (Lemma 54.17.2, tag 0C5S, p. 53); `enriques-one` lines 10108–10127 (Thm 1.1.3 and Remark 1.1.4(1), printed p. 201: minimal model, unique for κ ≥ 0, P² versus P¹×P¹ otherwise) | Supports the statement |
| 4.2 Parameter quotients | `cossec-dolgachev-1985` lines 16–20 (p. 247: open subset of the 9-dimensional variety of Reye congruences), 81–84 and 91–92 (p. 248); AMAG §2, §3.5 (`:1811`); SSF §1.13–1.23 (`:2418–3021`) | Supports; the stack/finite-inertia route is the roadmap's own and is consistent with the sources' "9-dimensional variety" |
| 5.3 Reduction and kernels | `cossec-dolgachev-1985` lines 32–35 (p. 247: W̄(2) ⊃ W(2) with W/W̄(2) ≅ Sp(8,F₂)), 56–68 (p. 248: E₈ on α₀,α₂,…,α₈, E₇ on α₀,…,α₆ and α₀,α₂,…,α₇; B, K, G = w₀·s₉; Prop. 1 (i),(ii)) | Supports; the radical, shear and full-image refinement are recomputed below |
| 6.1 Generic nodal Coble action | `cossec-dolgachev-1985` lines 36–37 (Thm 1), 54–55 (Thm 3, p. 248), 85–115 (§5, pp. 248–249: Kantor, dilated Bertini and Geiser involutions, kernel of the Coble representation is W̄(2), free action off a Zariski open when char ∤ |Sp(8,F₂)|) | Supports; the characteristic list {2,3,5,7,17} is exactly the prime divisors of |Sp₈(F₂)| |
| 6.3 Algebraic generic-open comparison | `martin` lines 104–118 (Thms 1.2, 1.4, p. 3), 151–154 (Prop. 1.9, p. 4: N(1) = 527), 527–534 (Thm 3.7, p. 12: Z₂ of dimension ≤ 5, Z₄ ≤ 2 in a 10-dimensional neighbourhood), 710–720 (Lemma 5.4, pp. 16–17: étale-local extension of a fibration and its 2-marked Jacobian family), 831–854 (Cor. 5.5, p. 19) | Supports; the exceptional loci are closures of finite unions, as the roadmap states |
| 7.1 Orbit decomposition | `cossec-dolgachev-1985` lines 112–115 (p. 249: orbits and stabilizers of W on degree-2 polarizations and on rational curves) | Supports the normal-subgroup orbit identity as the roadmap's own lemma |
| 7.2 Source representations | `cossec-dolgachev-1985` lines 21–24 (regular Cremona transformations of quartic symmetroids, p. 247), 42–46 (Thm 2, 34,780 and 136, terminology delegated to [AS, Chapter X]) | Supports the numbers and the referral; the Chapter X relation itself is not verifiable (below) |
| §5.2 general theorem (R01 context) | `davis` lines 4731–4745 ((6.32)–(6.33), printed p. 108), 2409–2420 (Lemma 4.8.3, p. 52), 17568–17576 (Theorem D.1.1 and Corollary D.1.2, p. 446), 17600–17602 (Lemma D.1.5, p. 447) | Locators correct; the theorem is now RootSystems §1.3's |
| §5.1/§6.2 lattices | `peters-sterk` lines 1038–1049 (Lemma A.5, p. 1624: R₁₀ = E₇(−1) ⊥ ⟨−2⟩ ⊥ U ≅ T₂,₄,₆, unique extension of O↑(R₁₀) to M, W(R₁₀) = Cox₂,₄,₆ ⋉ N(s_r)), 1076–1078 (Prop. A.6, p. 1625: gluing iff ψ̄γ̄₋ = γ̄₊ψ̄), 936–937 (Remark 5.9.2: index 2⁸ of the congruence subgroup in Γ_Y) | Supports §5.1, §5.2's semidirect comparison and §6.2's gluing |

**Pinned API.** Tau Ceti `a91d3aa`: `CoxeterSystem.geometricRepresentation` `TauCeti/GroupTheory/Coxeter/Geometric.lean:479` (`Representation ℝ W (B →₀ ℝ)`, lifted from `geometricReflection` `:161`, form `:125`), `geometricRepresentation_simple` `:485`, the file's own note `:99` that faithfulness is not proved there; `strongExchange` `StrongExchange.lean:413`, `deletionCondition` `:463`; `exists_isMinimalCosetRep` `Parabolic.lean:236`, `length_mul_of_isMinimalCosetRep` `:280`; `wordProd_alternatingWord_eq_of_mem_parabolic_pair` `Dihedral.lean:167`; `globalSectionsSmul` `GlobalSections.lean:46`, `globalSectionsSmul_naturality` `:143`, `baseRingToGlobalSections` `:199`; `IntegralLattice.integralForm` `IntegralLattice/Basic.lean:156`, `ofGramMatrix` `:261`, `ofGramMatrix.basis` `:281`; `LineBundleClass` `LineBundle/Class.lean:50`, `mk` `:58`; `longestElement` `LinearAlgebra/RootSystem/LongestElement.lean` (section with `[Finite P.weylGroup]`). Mathlib `6b7abb3c` has `CoxeterMatrix`/`CoxeterSystem` and no geometric representation (`Mathlib/GroupTheory/Coxeter/` is Basic, Inversion, Length, Matrix).

**Supplier citations resolved.** On main: SSF §§0.3, 1.13–1.23, 2.6, 2.11, 2.19–2.20, 4.6–4.11, 4.13, 5.1–5.10 (all headings present); StableReduction Layers 2 and 4; AlgebraicVectorBundles L0A–L1B (`:215–290`); IntegralLattices Layers 0, 1, 5 and 6A/6C/6F (`:1643`, `:1655`, `:1676`; 6A gives U^{t₊} ⊕ E₈(−1)^k with k = 1 for signature (1,9), so the overlap lead "§6A only in #1239" is a false positive); ModularCurves 0G (`:427`); EtaleCohomologyFoundations F.0.3, F.2.1, F.2.2, F.4.1–F.4.4, 0.9, F.5 and F.6 with `VanishingCycles.etaleGaussBonnet` (`:1200`, `:1219`); AlgebraicTopology integral Poincaré duality (`:1557`, `:2143`); JacobianChallenge Layers A–C (`:111–143`). At open heads: WeilConjectures (#1208) Layer WC.7 (`:1541`); AbelianSchemesAndArithmeticModuli (#849) A4.8 (`:2325`); ComplexComparisonPartII (#848) C1.9 (`:1852`), C3.2d.1–C3.2d.2 (`:2317`, `:2335`, `relative_picard_algebraicSpace` `:2337`), C5.4 (`:3403`), C6.3 (`:4583`), C6.5 (`:4732`), C6.6 (`:4830`), `artinComparison`/`adicArtinComparison` (`:55`); AlgebraicModuliForArithmeticGeometry (#853) §§1.1–1.3, Layer 2, 3.5, 7.3, 7.6.1, 7.6.1a; NeronModelsPartII (#870) §2.1; K3Surfaces (#1285) K0.A, K6.A, K6.B, K7.A, K7.B, §7.3 (and no K7.C, R04); FourManifolds (#936) §7.3 "The Enriques cover" (`:2976`). EnriquesSurfacesAndIntegralNonexistence (#1488) cites E1a–E1f, which `README.md:50` defines; its scope (`:7–9`) owns the characteristic-two and arbitrary-field variants and consumes E0–E1f for characteristic not two, so there is no double owner there. The overlap lead "RootSystems Layer 4 only in #1196" is real (R02).

**Ownership by object.** The general Coxeter faithfulness/sign/integral comparison: RootSystems §§1.1–1.4 on main (R01). The T246 diagram, its mod-two quadratic form, radical, shear image and the two kernels: searched by object (`T246`, `T2,4,6`, `Sp(8`, `Reye`) across main and the open heads; K3SurfacesAndSymplecticBoundedness #1375 mentions Enriques only through K0.A; no other owner. Ownership against open pull requests whose files the brief does not list was not checked.

**Adversarial table.** Values were recomputed by hand or in a scratch Python script (integer Gram arithmetic, exact rational elimination, exhaustive F₂¹⁰ enumeration); `decide` rows were elaborated in a scratch probe at the pins.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.1 canonical discrepancy | blowup chart y = xt | π*(dx∧dy) = dx∧(x dt + t dx) = x dx∧dt, order 1 along E; K = π*K + E, not −E | pass |
| §0.1 intersection and RR polarization | rulings F, G on P¹×P¹ | F² = G² = 0, F·G = 1; χ(O(1,1)) − χ(O(1,0)) − χ(O(0,1)) + χ(O) = 4 − 2 − 2 + 1 = 1 = F·G | pass |
| §0.1 exceptional curve | E of a point blowup | E² = −1, K·E = −1, E·(E+K) = −2 = 2·0 − 2; root square is −2 ≠ −1 | pass |
| §0.2 base ideals | sections {1}, {t}, ∅ on A¹ | ideals (1), (t), (0); base schemes ∅, origin, A¹ | pass |
| §0.2 complete systems | h⁰ = 0, 1, 3 | no map; P⁰; P²; no natural subtraction at h⁰ = 0 | pass |
| §0.2 blowup pullback | ideal (x,y), chart y = xt | (x, xt) = (x), invertible | pass |
| §0.3 scalar kernel | proper geometrically integral S; S ⊔ S | H⁰(O) = k, units k×; k× × k× on two components; 2 then 3 gives 6 on sections, identity on P(H⁰) | pass |
| §1.1 cover invariants | K nontrivial, K² = O | h⁰(K) = 0, χ(K) = χ(O) = 1, χ(O ⊕ K⁻¹) = 2; k[t]/(t²−1) = k × k when b = 1 (disconnected); char 2: (t−1)² | pass |
| §1.1 Pic → Num kernel | numerically trivial L ≠ O | χ(L) = ½L·(L−K) + 1 = 1, so h⁰(L) + h⁰(K−L) ≥ 1; effective numerically trivial is trivial; L = K | pass |
| §1.1 thickenings | W(k)/pⁿ⁺¹ → W(k)/pⁿ | kernel pⁿW/pⁿ⁺¹W ≅ k, square-zero, killed by p; H²(T_S) ⊗ I = 0 ⊗ I = 0 | pass; AMAG §7.3 hypothesis met |
| §1.2 integral pairing | isotropic f, g with f·g = 1 | χ(f+g) − χ(f) − χ(g) + χ(O) = 2 − 1 − 1 + 1 = 1 | pass |
| §1.4 two-primary Brauer | ℓ = 2, n ≥ 1 | H³(S,ℤ) = H₁(S,ℤ) = ℤ/2, so Br[2ⁿ] = ℤ/2, transitions ×2 = 0, inverse limit 0 | pass; H₁ input is R05 |
| §1.5 normal form | signature (1,9), even, det −1 | 6A: k = |1−9|/8 = 1, t₊ = 1, so U ⊕ E₈(−1); U ⊕ E₇(−1) ⊕ ⟨−2⟩ has det (−1)(−2)(−2) = −4 | pass |
| §1.6 Φ | D = 2F₁ + F₂, F₁·F₂ = 1; D = 0 | D² = 0 + 4 + 0 = 4, D·F₁ = 1 so Φ = 1; D = 0 gives minimum 0, excluded | pass |
| §1.6 half-fibre | F, 2F | F² = 0, h⁰(F) = 1, h⁰(2F) = 2 (`dolgachev` line 445) | pass |
| §2.1 squares | nF₁ + F₂; (n+1)F + R | 2n·1 = 2n; 0 + 2(n+1) − 2 = 2n; n = 1: (2F+R)·R = 2 − 2 = 0, R fixed | pass |
| §2.1 n = 2 | 2F₁ + F₂ | h⁰ = D²/2 + 1 = 3; after two base points 4 − 1 − 1 = 2, degree 2 onto P² (Cor. 2.6.5 with n−1 = 1) | pass |
| §2.2 algebra | b = 1; b = 0; A = O(4), O(3) | trace(a + ct) = 2a, norm a² − c²; t nilpotent, norm a²; b ∈ H⁰(O(8)) octic, ω_Y = f*O(−3+4) = f*O(1); sextic: ω_Y = f*O | pass |
| §2.3 branch transform | m = 1, 2, 3 | σ*B = strict + mE, so σ*B − 2⌊m/2⌋E = strict + (m mod 2)E = 2(σ*A − ⌊m/2⌋E); A′ = σ*A, σ*A − E, σ*A − E | pass |
| §2.3 crossing | t² = xy, chart y = xv, t = xu | u² = v, smooth; original origin singular | pass |
| §3.2 square root | Pic(P²) = ℤ, 2d = 8 | d = 4 unique; a base with 2T = 0, T ≠ 0 has (A ⊗ T)² = A² | pass |
| §3.2 deck and scalar | t ↦ −t; b ↦ c²b | order 2 for char ≠ 2, same branch datum; t ↦ ct invertible iff c ≠ 0 | pass |
| §3.2 minimal models | P², P¹×P¹ | Picard ranks 1, 2, both minimal and birational; Remark 1.1.4(1) | pass |
| §3.3 ordered systems | h = f + g, f·g = 1 | h² = 2; (2f+g)² = (f+2g)² = 4; difference f − g has square −2 | pass |
| §4.2 dimensions | Gr(4,10), PGL₄ | 4·6 = 24, 16 − 1 = 15, 24 − 15 = 9 only with finite stabilizers; trivial action leaves 24 | pass |
| §5.1 Gram | basis f₁,…,f₉,δ | det = −1; δ² = 10, δ·fᵢ = 3, fᵢ·fⱼ = 1 − δᵢⱼ; f₁₀ = 3δ − Σfᵢ has f₁₀² = 90 − 162 + 72 = 0 | pass |
| §5.1 β pairings | all 100 pairs | βᵢ² = −2; 1 exactly on the chain 1–9 and the edge 0–4; 0 otherwise; det β Gram = −4; coordinate determinant 2 | pass |
| §5.1 r | r = δ − 2f₁₀ | r² = 10 − 12 + 0 = −2; r·βᵢ = 0 for i < 9; r·β₉ = 3 − 3 − 2 = −2; r·f₁ = 1 so parity is onto | pass |
| §5.2 T246 Gram | 2B | det = (−1)¹⁰·(−4) = −4; chain A₉ minor det 10 > 0; signature (9,0,1) | pass |
| §5.2 subdiagrams | {0,2,…,8}, {0,…,6}, {0,2,…,7} | arms from node 4 of lengths (2,3,5), (2,3,4), (2,3,4): E₈, E₇, E₇; dets of −Gram 1, 2, 2 | pass |
| §5.2 native form | m = 1, 2, 3, 0 | −cos(π/m) = 1, 0, −½, −1; 2B = 2, 0, −1, −2 | pass; theorem now RootSystems §1.4 (R01) |
| §5.2 empty and rank one | I = ∅; A₁ | one endomorphism of 0; ρ(s)e = −e ≠ e | pass; RootSystems §1.3 Check |
| §5.2 infinite dihedral | B = [[1,−1],[−1,1]] | det 0; (s₁s₂)ⁿe₁ = (2n+1, 2n) = (1,0), (3,2), (5,4) | pass; RootSystems §1.3 Check |
| §5.3 quadratic form | 0, e₀, e₀ + e₄ | q = 0, 1, 1 + 1 + 1 = 1 (edge counted once); both orientations would give 0 | pass; `decide` |
| §5.3 radical | all 1024 vectors | exactly {0, u, z, u+z}, u = e₀+e₅+e₇+e₉, z = e₁+e₃+e₅+e₇+e₉; q-values 0, 0, 1, 1; q(au+bz) = b | pass; Python |
| §5.3 isometries fixing the radical | (g_V, ℓ, m) | q(v + au + bz) = q_V(v) + b; m(v) = q_V(v) + q_V(g_V v) is linear iff g_V symplectic; ℓ ∈ V* free; order 2⁸·|Sp₈| | pass |
| §5.3 B, K, G mod 2 | all ten basis vectors | w₀ of E₈ and of E₇{0..6} act integrally and reduce to the identity; G = w₀(E₇{0,2..7})·s₉ satisfies G(x) = x + x₈u in 10/10 cases; G(e₈) = e₈ + u | pass; Python |
| §5.3 orders | Sp₈(F₂) | 2¹⁶·3·15·63·255 = 47,377,612,800 = 2¹⁶3⁵5²7·17; ×2⁸ = 12,128,668,876,800 | pass |
| §6.1 tame primes | p = 11; 2,3,5,7,17 | 11 ∤ |Sp₈(F₂)|; each listed prime divides it | pass |
| §6.1 freeness | [x:y] ↦ [−x:y] | fixes [0:1], [1:0] although 2 is invertible | pass |
| §6.2 pullback scaling | e·f = 1 | (π*e)·(π*f) = 2 | pass |
| §6.2 nodal condition | e′−f′ in U(2); e−2f in U | squares −4, −4; pairing ideals 2ℤ (div 2) and ℤ (div 1); only the first is in Ω_nodal (K3 §7.3) | pass |
| §6.2 M(2) | any x | x² ≡ 0 mod 4, no −2; |A_{M(2)}| = 2¹⁰ | pass |
| §6.2 T237 | α₀ = δ − f₁ − f₂ − f₃, αᵢ = fᵢ − fᵢ₊₁ | det Gram −1, coordinate det −1; α₀·α₃ = 1, α₀·α₄ = 0; T246's β₀ meets β₄ with det −4 | pass; Python |
| §6.2 gluing direction | γḡ = h̄γ (K7.A `:18`) | the pair (g, id_T) extends iff ḡ = id on A_S ≅ M/2M, i.e. g ∈ Γ(2) | pass |
| §6.3 pencils | split q on M/2M | 528 singular vectors including 0 (Python), 527 nonzero = Martin N(1) | pass |
| §6.3 tangent torsion | 2x = 3x = 0 | x = 3x − 2x = 0; fails in characteristic 2 | pass |
| §6.3 dimensions | 10; 5; 2 | complement of a union of closed sets of dimension ≤ 5 in a 10-dimensional family is nonempty | pass |
| §7.1 double cosets | W = S₃, H = A₃, K = ⟨(12)⟩ | |W/K| = 3, A₃ transitive: 1 orbit; Q = C₂, image(K) = C₂: 1 coset; H = 1: 3 = 3; H = W: 1 = 1; W = C₆, H = C₃, K = C₂: 1 = 1 | pass |
| §7.2 counts | 34,780; 136 | 4·5·37·47 = 34,780, and 37, 47 ∤ |Sp₈(F₂)|; 2³(2⁴+1) = 136 | pass |
| `coxeterGeometricFaithful` | I = ∅, A₁, infinite dihedral | as the §5.2 rows; statement true (`davis` Cor. D.1.2) | true but restates RootSystems §1.3 (R01) |
| `reyeGeometricFaithful` | eᵢ, adjacent eⱼ, non-adjacent | eᵢ − 2eᵢ = −eᵢ; eⱼ − (−1)eᵢ = eⱼ + eᵢ; eⱼ unchanged; equals the native σᵢ with 2B = (2, −1, 0) | instance of RootSystems §§1.3–1.4 (R01) |
| `reyeReductionImage` | eᵢ, u, generator orders | ρ(sᵢ)eᵢ = eᵢ + 0 = eᵢ; ρ(sᵢ)u = u since b(u,eᵢ) = 0; adjacent product order 3, non-adjacent 2 (Coxeter relations hold mod 2); image ⊆ radical-fixing q-isometries; equality is the theorem | pass; nonvacuous |
| `reyeAdjacent`, `reyeCoxeterEntry` | (0,4), (0,3), (0,0) | true, false, false; entries 3, 2, 1 | pass; `decide` |
| `reyeQuadratic`, `reyePolar` | 0, e₀, e₀+e₄, u, z; (e₀,e₄), (e₀,e₃), (e₀,e₀) | 0, 1, 1, 0, 1; 1, 0, 0 | pass; `decide` |
| `gram`, `betaCoordinates`, `rCoordinates` | entries; i = 0, 9; r | (9,9) = 10, (0,9) = 3, (0,0) = 0, (0,1) = 1; β₀ = (−1,−1,−1,−1,0,…,0,1), β₉ = (1,…,1,2,−3); r = (2,…,2,−5) | pass; `decide` |
| `adjacent`, `t246Entries`, `t246` | definitional comparison | equal to `reyeAdjacent`, `reyeCoxeterEntry`, `reyeDiagram` by `rfl` | duplicates (R03) |

**Source negative controls.** `stacks-divisors` Lemma 31.29.5 as printed has no n ≥ 1 restriction, and Pic(P⁰_R) = 0 (recorded below); the roadmap only uses n = 2.

## Not verifiable

- **Averbukh, Chapter X** (Shafarevich et al., *Algebraic surfaces*, 1964): no legal text in the cache or through the sources service in the previous rounds; the precise model-equivalence relation behind 34,780/136 remains uncertified, as the README itself states at `:763–765` and `:778`.
- **Enriques Surfaces I typography:** the cached extraction has a defective font map; the statements of Theorem 1.1.3, Propositions 2.6.1, 2.6.4, 3.2.1 and Corollary 2.6.5 are readable in prose, but individual symbols (n versus 2, Φ values) were read from context.
- **Cossec–Dolgachev 1985 is an announcement:** the proofs of Proposition 1, Theorem 1 and Theorem 3 are sketched only; the roadmap treats them as construction targets, which is the right status.
- **Open heads without supplied files:** ownership was checked against main, the listed sibling checkouts and `roadmaps show` of the five open suppliers; no clearance is claimed for other open pull requests.

## Source issues

- **Error** in martin at Caveat 1.6, printed p. 3: the source says O⁺(10,F₂) is the automorphism group of a nondegenerate symmetric bilinear form of Witt defect 0; it should be the isometry group of the split quadratic form, a proper subgroup of the symplectic group of the polar form; affects a stated result.
- **Error** in dolgachev at §6 before Theorem 7, printed p. 25: the source says the full quadratic isometry group of R/2R is 2⁸ ⋊ Sp₈(F₂); it should be the subgroup fixing the polar radical pointwise, since the radical carries a nonzero value of q; affects a stated result.
- **Misprint** in peters-sterk at proof of Lemma A.5(iii), printed p. 1625: the source says the ten nodes of T₂,₃,₆; it should say T₂,₄,₆; affects the proof.
- **Misprint** in stacks-resolve at proof of Lemma 54.17.1, tag 0C5R, printed p. 52 (line 2339): the source says the open V contains all codimension-one points of V; it should say of Y; affects the proof.
- **Error** in stacks-divisors at Lemma 31.29.5, tag 0BXJ, printed pp. 70–71 (lines 3204–3209): the source says Pic(Pⁿ_R) = ℤ for every n; it should require n ≥ 1, since Pic(P⁰_R) = 0; affects a stated result.
