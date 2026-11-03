# Review of AdmissiblePairsAndPadicHodgeStructures (pull request #1511 at f4efc7c)

**Verdict:** accepted

This is a full review of the same head the previous review read (the folder has no change since then). The two findings below are P3 notes for the author to take or leave; nothing blocks.

## R01 (P3) — §12.3 proof route: "finite orbits" is not what a discrete reduction forces

Location: `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:2125`, "A reduction to a rigid de Jong covering forces the corresponding compact fibre monodromy to have finite orbits, contradicting the infinite transitive Z_p× action."

Claim: the target's statement (the surjective Z_p× monodromy obstructs a reduction of the crystalline-frame torsor to a rigid analytic de Jong covering) is true, and the same paragraph already gives a valid reason (the inverse-limit realization is not locally of finite type: its geometric fibre Z_p× is infinite profinite and nondiscrete). The quoted sentence, however, asserts a step that does not hold as written.

Witness: a reduction of the Z_p×-torsor to a de Jong covering with discrete group Γ does not force finite orbits on the fibre Z_p×: Γ = Z mapping by n ↦ (1+p)^n acts on Z_p× with infinite orbits (the coset (1+p)^Z is infinite), although Z is discrete. What a reduction actually contradicts is cardinality: a connected de Jong covering of the quasi-compact ordinary locus has countable fibres (finitely many affinoids, finite étale pieces, a locally finite connected gluing graph), so the induced monodromy image ρ(Γ₀) ⊂ Z_p× is countable, whereas the Katz–Igusa monodromy is all of the uncountable Z_p×.

Repair: replace the quoted sentence by "A reduction to a connected rigid de Jong covering over the quasi-compact ordinary locus has a countable fibre, so the induced monodromy image in Z_p× is countable, contradicting surjectivity onto the uncountable Z_p×", or delete it and keep only the local-finite-type obstruction that the paragraph already states. Tested on the refuting instance: Γ = Z with n ↦ (1+p)^n has countable image (1+p)^Z ≠ Z_p×, so the countability argument excludes it while "finite orbits" did not.

## R02 (P3) — §9.4 carries an H-basicness hypothesis that is automatic or unused

Location: `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:1709`, "a class [mu_H] inducing [mu], and an H-basic [b_H]∈B(H,[mu_H^-1]), take a geometric connected component … It is Hodge special if all Ad_H(mu_H)-weights are ≤1, and, when the ambient b is G-basic and b_H is H-basic, Hodge–Tate special if all are ≥−1."

Claim: HKII Definition 8.4.1(1) (HKII line 2353) defines Hodge special subvarieties for any refining (b_H, [μ_H]) with no basicness on b_H; the README requires b_H H-basic for all three notions. Under the standing hypothesis of Layer 11 (b G-basic) this is redundant: if b_G = g f(b_H) σ(g)^{-1} is G-basic then f∘ν_{b_H} = Int(g^{-1})ν_{b_G} is central in G, hence ν_{b_H} is central in H and b_H is automatically H-basic. For nonbasic ambient b (which §9.4 does not exclude for the Hodge-special clause) the hypothesis narrows the source's definition, and no consumer uses that narrowing (§§11.2–11.6 all assume b basic; §11.7 uses no special subvarieties).

Witness: G = GL₂, H the upper Borel, b = b_H = diag(1,p), μ_H = (0,−1): the component is Hodge special in the sense of Definition 8.4.1(1) (weights 0,0,1 on Lie H are ≤ 1), b is not G-basic and b_H is not H-basic (root slope −1), so §9.4 as written does not call it Hodge special.

Repair: drop "H-basic" from the common data of §9.4 and state in the Hodge–Tate clause that for G-basic b the refining b_H is automatically H-basic (one sentence, with the centrality argument above). Tested on the witness: with the hypothesis dropped the Borel component is Hodge special as in the source, and for G-basic b nothing changes.

## Previous findings

The previous review's two findings concern `packages/AdmissiblePairsAndPadicHodgeStructures/design/plan.json` (the `adjoint-kernel-and-orbit-differential` gap still asks for "the image and kernel formulas for differentials of their flag-orbit maps", and the `ordinary-katz-igusa-monodromy` gap still names "Layer IG.1"). Both residues are unchanged on the board at this head. In the roadmap folder they are repaired: `README.md:80` requests only "Prove that the kernel of the adjoint representation of a connected linear algebraic group over a field of characteristic zero is its centre" and assigns submersivity to AdicSpacesPartV RZ.6; `README.md:212–216`, `2117`, `2135` and `2185` cite IgusaVarietiesAndTorsionConcentration Layer 1, which is the supplier's actual heading (its Layer 1 is at its line 797, with §1.1 at 799 and §1.6 at 891; it has no "IG.1"). The author's answer that no authorized-file change is needed is correct: a port job edits only the roadmap folder, and the plan's gap list is board-side. The findings are therefore settled as not actionable in this package and are not re-raised. Residue for the intake, outside this pull request: synchronize the plan's `needs` text of `adjoint-kernel-and-orbit-differential` with README line 80 and change the Igusa gap's `section` to "Layer 1".

## Verified sound

**Gate, dependency check, elaboration.** The worker's gate at this head reports every check zero and `OK` (set_option, sorry-data, residue, imports, depcheck, metadata, stray-files, outside-folder, build). The outside-folder diff is empty. I ran the prescribed dependency check:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `lake env lean TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` from the pull-request worktree exited 0 with no output. The file has one `import Mathlib`, the namespace, a module docstring listing 23 groups of non-statable headlines with the missing carrier for each, and zero declarations; there is nothing to probe for padding and no `#check` list to elaborate. The merge order lists this roadmap at line 236, after every supplier it names (PerfectoidShimuraVarieties 168, IgusaVarietiesAndTorsionConcentration 170, HeckeStacksAndLocalShtukas 174, AdicSpacesPartV 207).

**Headline coverage.** The README's end theorems (HKII Theorem 9.1.3, Theorem A, Theorem B; HKI Theorem B) and the deep intermediate results (§§0.4–0.5, 1.2, 1.5–1.6, 2.3–2.4, 2.7, 3.2–3.4, 4.5, 4.7, 5.3–5.6, 6.2–6.8, 7.2–7.6, 8.1–8.4, 9.2, 9.5–9.7, 10.2–10.3, 11.4–11.7, 12.2–12.5) all appear in the docstring. None is statable at the pins: Mathlib has `WittVector.Isocrystal` (a module with a Frobenius-semilinear automorphism, no finiteness) and the absolute `BDeRhamPlus`/`BDeRham` completions, but no Fargues–Fontaine curve bundles, modifications, diamonds, B_dR⁺-Grassmannians or period towers; Tau Ceti's `spaX` is a topological orbit quotient (its file says so at line 19). A file stating nothing, with the docstring saying why, is correct here.

**Pinned library declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, the manifest pins; the packages directory resolves to the shared `lake/356835296538146e/packages` at these revisions):

| Declaration | File and line at the pin | What the README says and what the object includes |
| --- | --- | --- |
| `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv` | `Mathlib/RingTheory/WittVector/Isocrystal.lean` 113, 132, 138 | `class Isocrystal … extends Module K(p,k) V` with field `frob : V ≃ᶠˡ[p,k] V`; no finite dimension, as the README says. |
| `StandardOneDimIsocrystal`, `.frobenius_apply`, `isocrystal_classification` | same file 157, 172, 180 | Classification needs `[IsAlgClosed k] [CharP k p]` and `finrank = 1`, as stated. |
| `dense_iInter_of_isOpen`, `nonempty_interior_of_iUnion_of_closed` | `Mathlib/Topology/Baire/Lemmas.lean` 141, 256 | Both take `[Countable ι]`; the second a closed cover and a nonempty space. |
| `BaireSpace.of_completelyPseudoMetrizable` | `Mathlib/Topology/Baire/CompleteMetrizable.lean` 25 | Priority-100 instance. |
| `BDeRhamPlus`, `BDeRham` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean` 75, 88 | Adic completion at `ker (fontaineThetaInvertP R p)` of `Localization.Away p`; the docstring says it is the zero ring when p = 0 in R, as the README records. |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` 138 | Reconstruction of a known Hopf algebra's points. |
| `TauCeti.Subcomodule.exists_finite_subcomodule_mem`, `iUnion_finiteSubcomodules_eq_univ` | `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean` 144, 292 | Both need `[Module.Free R C]`. |
| `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` | `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean` 101 | Needs `I.toIdeal.FG`; gives the line, its unique character and the stabilizer equality over every `CommAlgCat`. |

Tau Ceti has no theorem that the kernel of the adjoint representation of a general affine group is its centre (the files mentioning "adjoint" are `SpecialLinear/*`, `Tangent.lean` and `Isogeny/Center.lean`, whose one theorem is `IsCentralIsogeny.isIso_of_centerDefiningIdeal_eq_augmentation`); ReductiveGroups Layer 2 on main (its line 227) introduces `Ad` without that identity, and its Layer 3 (line 234) has no quasi-affine or observable quotient. The two ReductiveGroups gaps therefore ask for what is not provided.

**Seeded source sample.** All fifteen targets were read against the cached arXiv v2 texts at the lines below; the theorem numbers, printed pages and hypotheses match the README's statements.

| Target | Source lines read | Checked |
| --- | --- | --- |
| 0.2 | HKI 890–895 (setting), 930–951 (Def 3.1.1, exact structures), 1148–1170 (bilatticed G-bundles, Def 3.2.5), 1176–1181 (Thm 3.2.6) | Goodness as a double coset, types [μ⁻¹] and [μ] of BB1, BB2; the source's L-structure on B⁺ is matched by a coefficient section extending it (Cohen, HKI 908–910). |
| 1.3 | HKII 1199–1205 | G_b as tensor automorphisms, σ-centralizer on Q_p-points, inner form only when b basic, (4.1.1.1). |
| 1.5 | HKII 1246–1257, proof 1260–1303 | Open substack, [∗/G_b(Q_p)] ≅ Bun^{[b]}, fibre product with the Levi stratum; pro-étale H¹ annihilation along the derived series. |
| 1.6 | HKII 1306–1318 | F_b = Isom(E_b,−), F_b(E_b) ≅ E_1, F_b(E_1) ≅ E_{b⁻¹} with b⁻¹ read in G_b. |
| 2.7 | HKI 1925–1945 | Quadruples (F,F′,β,α) with F trivial and β the slope splitting, via Anschütz's Theorem 3.19; the equivalence is a declared supplier contract. |
| 3.2 | HKI 2117–2119, 2137–2153 | K strict, C = K̂; full faithfulness, subobject stability, crystalline image. |
| 3.4 | HKI 204–207, 347–349, 586–590, 2101–2105, 2174–2180, 2293–2300, 2400–2430, 2490–2500 | Theorem B both directions, Corollary C, Lemma 2.1.5 (centrality), Lemma 5.5.4, Example 5.4.5, Theorem 6.3.2 (slope filtration lifts, graded pieces CM). |
| 4.7 | HKII 1080–1097, 1411–1412 | Theorem 3.3.1(1)–(3) for smooth X; essential image = M₀ of a flat bundle with locally split trace filtration; Proposition 5.0.3(4) for seminormal S. |
| 7.4 | HKII 1710–1730 | HT(ℓ) via ℓ⊗Filⁿ ⊂ L, closed subdiamond, MT-stabilizer interpretation. |
| 7.5 | HKII 1731–1756 | Lemma 6.3.3 for seminormal S of type [μ]; the source's proof applies Theorem 3.3.1(3) to seminormal S (see Source issues), the README routes singular S through §5.5. |
| 7.6 | HKII 1759–1788 | Compatible H-basic class mapping to the G-basic class; Proposition 6.4.1 for M_H-minuscule [μ_H]; weights ≥ −1 give rigid analyticity; Definition 6.4.2. |
| 9.4 | HKII 2353–2365, 2366–2374, 2386–2395 | The three notions with their one-sided bounds; Lemma 8.4.2; the cubic mirabolic with μ_H = (t,t,t⁻²). |
| 11.6 | HKII 222–231, 260–285, 2470–2479 | Definition 1.1.2, Example 1.1.4 (GL₄ parabolic), Theorem A, Example 1.1.5 (algebraic Z′ ⊂ Fl_[μ]), Remark 1.1.6, Remark 9.1.2 (closures equal the inverse-limit closures only in the minuscule case). |
| 12.3 | HKII 2877–2891 | Katz–Igusa tower, not of finite type, surjective Z_p× monodromy. |
| 12.4 | HKII 2892–2914, 2920–2921, 3010–3011 | Hodge type, neat level, basic locus as components M/K_p by a discrete Γ ≤ G_b(Q_p), étale-local period diagram; footnote 7 attributes the input to Daniels–van Hoften–Kim–Zhang [13]. |

Also read for proof routes: HKI Proposition 3.1.7 and Example 3.1.10 (1043–1087), Remark 1.2.1 (329–344, the filtration convention F^p = ⊕_{i≥p} V[i], which fixes P_μ as the weight-≥0 subgroup used by README §0.2 Check 5 and §11.8), Theorems 3.5.1 (1413–1419), 4.4.4 (1730–1732), Definition 4.2.1 (1544–1552), Definition 5.1.1 (1841–1851), Definition 5.4.1 and Example 5.4.6 (2030–2046, 2112–2116); HKII §4.1 (1173–1198), Lemma 2.3.2 and Remark 2.3.3 (771–793), §6.2 (1661–1696), Definition 7.2.2 and Theorem 7.2.3 (1890–1941), §7.3 (1944–1990), Lemma 7.3.5 (2028–2063), Lemma 7.5.1 (2117–2131), Proposition 7.5.2 and Remark 7.5.3 (2132–2150), Definitions 7.5.4–7.5.6 and Examples 7.5.7–7.5.10 (2166–2240), §§8.1–8.3 (2262–2335), Theorem 8.5.1 (2412–2420), Definition 9.1.1 and Theorem 9.1.3 with proof (2458–2635), §9.3 (2637–2735), Definition 10.1.1 (2839–2869), Theorem B (501–510); LiuZhu's finite-extension base (line 86); BhattHansen Definitions 2.4–2.5 and Corollary 2.10 are cited through AdicSpacesPartV RZ.4 (its line 77 names Corollary 2.10).

**Supplier audit.** Every `*Needs:*` line, supplier paragraph and Dependencies bullet was resolved against the supplier as it is now: on main for ReductiveGroups, ReductiveGroupsPartII, AdicSpacesPartII, PerfectoidSpaces, AlgebraicVectorBundles and `Completed/AdicSpaces`; at the open heads (via `roadmaps show`) for PadicHodgeTheory, RelativeFarguesFontaine, BunGAndNewtonStrata, VectorBundlesAndIsocrystals, VStackSheavesAndLisseCategories, GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas, AInfCohomology, MotivesAndAlgebraicCycles, DiamondsAndVStacks, DiamondSixOperations, EndoscopicTransferAndUnitaryTraceComparison, IgusaVarietiesAndTorsionConcentration, PerfectoidShimuraVarieties, HilbertModularVarietiesAndShimuraCurves, HodgeTateAndCanonicalSubgroups, AlgebraicModularFormsAndSerreWeights and PadicPeriodRings; in the board design `packages/AdicSpacesPartV/design/README.md` for the sixteen RZ slugs. Every cited heading or slug exists: RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9, 7.0, 7.2, 7.4, 7.6 (lines 1825–2727; §7.6 restricts (b) and (c) to reductive G, as the README says); BunGAndNewtonStrata §§0.6, 1.8, 1.13, 1.23, 1.33, 1.36, 2.12 (123–1206); the nine VectorBundlesAndIsocrystals titled subsections (280–1221); VStackSheavesAndLisseCategories VS4.0 (1084) with the paragraphs "The stack of bundles" (1086) and "Full stratum automorphisms" (1105); GeometricSatakeAndFusion §§0.1, 0.3, 0.6, 0.12–0.15 (234–519); HeckeStacksAndLocalShtukas HS2.12 (1487) and HS2.15 (1581, reductive G, point over a finite extension of F̆, connected admissible cell); DiamondSixOperations S2.4, S3.2, S4.2, S4.3; EndoscopicTransfer §§12.5 (4653), 12.11 (4788); HilbertModularVarieties R18.5.7, R18.5.15, R18.5.20, R18.5.21 (1998–2458); all fifteen DiamondsAndVStacks slugs, including D5.10's profinite product with universally closed projection (7598) and the seminormal full-faithfulness slug (9716); PadicPeriodRings §2 (272, "Tate–Sen over a general p-adic field"), `tateSen_H0` (205), §§4.1, 4.3; AdicSpacesPartII R1.3 (8968); PerfectoidSpaces P4.15.6 (11208), P6.11 (14821); AdicSpaces Layer 6 and §6.4 (691, 807); AlgebraicVectorBundles L0A–L0C, L2A–L2B; ReductiveGroupsPartII RG2.0's four slugs (539–804) and RG2.1 steinberg-quasi-split (1469); ReductiveGroups Layers 1–3, 5, 6A (479, with the equivariant central series at 507) and 7; HodgeTateAndCanonicalSubgroups §2.14 (1008) and §5.1 (1371, the ordinary Igusa tower as a pro-étale O_p×-torsor with finite étale formal models); AlgebraicModularFormsAndSerreWeights §3.5 "The Igusa interpretation" (696, full unit monodromy modulo p^m); IgusaVarieties Layer 1, §§1.1 (799) and 1.6 (891); PerfectoidShimuraVarieties §§2.2 (1044), 3.1 (1188), 3.5 (1297), with no uniformization statement; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8 (1115–1228) with no canonical-reduction statement; AInfCohomology AI.2.2 (1650), "Operations in valid BKF subcategories" (1686), the crystalline-rigidified variant (1674) and Fargues classification (1846), with no rational modification-quadruple equivalence; PadicHodgeTheory §§2.2, 2.3, 5.5 (1072, the tensor torsor), 7.1 (1226, associated lattice, uniqueness and full faithfulness over any complete discretely valued k with perfect residue field) and 7.4 (1304), with no Serre openness and no full-rank de Rham criterion. The one non-literal label is "VStackSheavesAndLisseCategories §VS4.0 / bundle-stack-geometry": VS4.0 exists and the supplier's own `*Needs:*` lines use the phrase "VS4.0, bundle-stack geometry" (its line 1174), so the citation resolves. The worker's citation resolver reported nothing unresolved.

**Declared gaps.** All nine slugs occur in both `plan.json` and the README under `## Exact supplier contracts`, each with a supplier earlier in the merge order. Searches by object: no roadmap on main or at an open head states Sen–Serre openness (grep for "open in its Zariski closure", "Zariski closure of the image", "Lie algebra of the image": no match anywhere), none states a basic uniformization of a Hodge-type Shimura variety (the only "uniformization" hit outside this roadmap is HilbertModularVarieties' PEL table row), and the supplier sections named above do not state canonical reduction, the rational rigidified modification equivalence, the arbitrary-field full-rank de Rham criterion, the Igusa crystalline-frame comparison or the localized B_D-module descent (RelativeFarguesFontaine §6.9 is the positive-ring gluing equivalence). Each `needs` sentence states one obligation with its hypotheses. The README's narrowed adjoint contract (line 80) is precise and minimal.

**Ownership.** `roadmaps grep` over main and the 440 open heads: "bilattice" occurs only here; "Ax-Lindemann" elsewhere only as references (DiamondsAndVStacks 10270, RelativeFarguesFontaine 2854, BunG 1806, HeckeStacks 2621) or for the complex and abelian theorems (ShimuraVarieties, AbelianSchemesAndArithmeticModuliPartII B2.15, CM PartII); "Howe–Klevdal" elsewhere only in references and in RelativeFarguesFontaine's modification section (2789–2808, which this roadmap imports); "p-adic Hodge structure" elsewhere only in reference lists. No competing owner of admissible pairs, neutral families, non-reductive period domains or the bi-analytic theorem exists.

**Shape.** Thirteen layers, each ending with Examples and Dependencies; 78 numbered targets, each with a locator and a `*Needs:*` line; every definition has an interface list and at least three Checks; no LaTeX delimiters, no process words, no pull-request numbers, no `lemma`, no `set_option`.

**Adversarial computations.** One row per statement; values are the ones I computed. R denotes the DVR, t or ξ its uniformizer.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions table | Q_p(n), n = 1 | Frobenius p⁻¹σ, slope −1, E(W) = O(1); L_et = ξB⁺ turns O(1) into O(1)(−∞) = O; V_et = Q_p; L_dR = ξ⁻¹B⁺; (Q_p, Fil⁻¹) modifies O to O(1), slope 1 = −w/2 ⇒ w = −2 | Agrees with HKI Remark 4.2.2 |
| 0.1 | L₂ = tᵃR; off-diagonal t⁻¹; ×t | trFilⁱ = k iff i+a ≤ 0; det valuation 0, minimum −1 ⇒ (−1,1), sub/quotient types 0; f(R) = tR ≠ K∩R | Retain |
| 0.2 | G_a lattice; torus; PGL₂; G_m⋉G_a | trFil⁰ ambient k e₁ ↦ 0 in quotient, quotient trace k; torus type = tuple; Brauer 1/2 ↦ 0 over Q̄_p[[t]]; weight −1 gives P_μ = G_m, flag A¹, inverse gives point | Retain |
| 0.3 | G_a extension | Levi (0,0), actual (1,−1): first partial sum 1 ≥ 0, totals equal | Retain |
| 0.4 | same | BB1 inexact at i = 0 ⇔ not good | Retain |
| 0.5 | GL₂ (2,0); γ: u ↦ 2u, t ↦ 2t | ⟨t²e₁, e₂+cte₁⟩ share the flag, differ for c = 0,1; ⟨e₁, e₂+ut⁻¹e₁⟩ is γ-invariant (2u/(2t) = u/t), type (−1,1), flag C², Ce₁, Ce₁, 0 at i = −1,0,1,2; its canonical lattice ⟨t⁻¹e₁, te₂⟩ differs; u ∈ C(χ⁻¹)^γ ≠ 0 | Refutes HKI 3.1.7(2); README hypothesis excludes it |
| 1.1–1.2 | Borel, b = diag(p,1) | Ad(b)E₁₂ = pE₁₂, slope 1: basic in T, not in B; b = 1 slopes 0 | Retain |
| 1.3 | GL₂ diag(p,1); b = 1 | G_b = T, dimension 2 < 4, not an inner form; G_1 = G | Retain |
| 1.5 | Borel b = 1 vs diag(p,1) | H¹(O) = 0 ⇒ Aut = B(Q_p); H¹(O(−1)) ≠ 0 at the nonbasic class | Retain |
| 1.6 | b = [[1,1],[0,1]], x = diag(2,1) | σ_b(x) = [[2,−1],[0,1]]; b⁻¹σ_b(x) = σ(x)b⁻¹ = [[2,−2],[0,1]]; reversed order [[2,1],[0,1]] | Retain |
| 2.1–2.2 | Q_p(1), dual; O(1)⊕O(−1) | Fil⁻¹ ↦ O(1), w = −2; Fil¹ ↦ O(−1), w = 2; degree 0 but not semistable | Retain |
| 2.3–2.5 | unit sums, Tate, extension | End(1) = Q_p; groups 1, G_m, G_a; [[1,u],[0,1]] fixes e₁-line for all u, e₂ only at u = 0 | Retain |
| 2.6 | G_m, Q_p(1); PGL₂ b = [[0,p],[1,0]] | μ = 1, b = p⁻¹, κ = −1 = μ⁻¹, weight −2 = 2·(−1); b² = p, ν = 0, v(det) = 1 ⇒ κ = 1 ∉ B(PGL₂,[0]) = {[1]} | Standard-fibre condition needed; retain |
| 2.7 | Tate | (O, O(1), α, β); β records the splitting | Retain |
| 3.1 | Q_p(1); ξ⁻¹-extension | jump −1, L_et = Fil¹, type +1; ξ⁻¹ ∉ B⁺ so not analytic (Ext¹ over C₀bar is 0, HKI 2105) | Retain |
| 3.2–3.3 | unit, cyclotomic; p = 2 | D_cris rank 1 with Frobenius 1, p⁻¹; cyclotomic image contains 1+4Z₂, open in G_m(Q₂); trivial image open in envelope 1 | Retain |
| 3.4 | G_a extension | commutative, cocharacter 0 central, yet nonanalytic ⇒ the vanishing of analytic self-extensions is the step that kills the vector factor | Retain |
| 4.1 | F₂((u)); cusp | f(T)² = T forces 2·ord f = 1; u ∉ L⟨u²,u³⟩ | Retain |
| 4.2 | O(1) on Spa L; PGL₂ torsor | H⁰(G_L, C(1)) = 0 ⇒ no line-bundle structure; P(Q_p) = ∅ so the frame sheaf has no sections, P(C) ≠ ∅ | Retain |
| 4.3 | z/ξ; ideals 0, 1 | integral iff z = 0; V(0) = S, V(1) = ∅ | Retain |
| 4.4 | ⟨e₁, e₂+(z/ξ)e₁⟩ | z ≠ 0: det valuation 0, minimum −1 ⇒ (−1,1); z = 0: (0,0) | Retain |
| 4.6–4.7 | jump a | lattice Fil⁻ᵃ·M₀; a = −1 gives tB⁺ (PadicHodgeTheory §7.1 Check agrees); rank 0 both zero | Retain |
| 5.1–5.2 | G_a; G_m/1; SL₂/U | ξ⁻¹ ∈ B_dR/B⁺ nonzero, good cell {0}; G_m/1 affine, SL₂/U = A²∖0 quasi-affine; stabilizer graph z = χ(h)⁻¹ | Retain |
| 5.3–5.4 | GL₂ (1,0), (2,0); G_a ⊂ GL₂ | P¹ closed; (1,1) in the closure of (2,0); ξ⁻¹ has representation type (1,−1) above Levi bound 0 | Retain |
| 5.6 | weights −1,0,1; 2; 0,1,−2 | BB bijective; weight 2 leaves the parameter c; 0,1,−2 ≤ 1 but inverse 0,−1,2 not | Retain |
| 6.1–6.2 | Y = two points | a morphism is one scalar; (1,2) is not; End(1) = Q_p | Retain |
| 6.3 | T ⊂ SL₂ norm-one unramified, b = 1 | B(T) = Q̆_p×/{cσ(c)} = Z/2 (valuation parity); H¹(Q_p,T) = Z/2, H¹(SL₂) = 1; lattice t^{μ₁} (odd) is SL₂-admissible (κ_T = 1 ↦ [1] ∈ B(SL₂)) but its modified T-bundle is the nontrivial class, so its étale T-form is nonneutral while t^{μ₀} is neutral | Connected base needed; refutes HKII Lemma 7.5.1(1) as stated |
| 6.5–6.6 | G_m, Frobenius pˢ, lattice tᵃ | E_b = O(−s) modified to O(−s−a): admissible iff s+a = 0; G = 1 one point | Retain |
| 6.7–6.8 | singletons; two 2-point factors; Aᵐ | H⁰ = F_ℓ ⊗ F_ℓ = F_ℓ; F_ℓ⁴ for the disconnected product; π₀(Aᵐ) = 1 | Retain |
| 7.1–7.3 | quadratic character; Borel (1,0); Tate | monodromy {±1} vs {1}; diag(p,1) has root slope 1, noncentral ⇒ no domain; weight −2n | Retain |
| 7.4–7.6 | Filⁿ ⊂ Filᵃ; adjoint −2 | holds iff n ≥ a; (−1,0) fails since t⁻¹ ∉ B⁺; −2 < −1 fails the lower bound | Retain |
| 8.1–8.2 | Tate; g₁ = [[1,1],[0,1]], g₂ = [[1,0],[1,1]] | whole base; g₂g₁ = [[1,1],[1,2]] ≠ g₁g₂ = [[2,1],[1,1]] | Retain |
| 8.3, 8.6 | Borel, L_{[a:c]} = R²+Rξ⁻¹(ae₁+ce₂), type (−1,0) | Hodge flag at i = 1 is the line [a:c]; weak admissibility for b = diag(p,1): φ-lines Ke₁ (t_N = 1, t_H = [c=0]) ok, Ke₂ (t_N = 0, t_H = [a=0]) fails iff a = 0, so G-admissible iff a ≠ 0, H-admissible iff c = 0, [1:1] separates; for b = diag(1,p): fails iff c = 0, so the admissible locus is {[x:1]} = A¹ = the (0,−1) H-cell, all H-admissible | README's diagonal is the one giving A¹ → A¹; Remark 7.5.3's is not |
| 8.4–8.5 | torus; D×/F× | point or empty by s+a; dim 4−2 = 2 = dim P¹(F) | Retain |
| 8.6 (GL₃) | ⟨e₁, e₂+(z/ξ)e₁, e₃+(1/ξ)e₁⟩ | 2×2 minor −1/ξ for all z ⇒ divisors (−1,0,1) throughout; Levi (−1,1;0) for z ≠ 0, (0,0;0) at z = 0 | Retain |
| 9.1–9.2 | G_m, b = 1, μ = 0 | frame fibre Q_p×; Q_p×/Z_p× = Z; level Z × Spd L, discrete union over C | Retain |
| 9.4–9.5 | mirabolic (1,1,−2); GL₂ μ = diag(t,1) | Lie weights 0,1,−2 (≤ 1, not ≥ −1); coinvariant sum 0 = κ(1); GL₂ weights −1,0,0,1, Borel 0,0,1; if b_G = g f(b_H)σ(g)⁻¹ is G-basic then f∘ν_{b_H} is central so b_H is H-basic | R02 |
| 9.6 | G_m pⁿ; unipotent b | n ↦ −n, μ ↦ μ⁻¹; σ ↦ Int(b)σ with the §1.6 matrices | Retain |
| 10.1–10.3 | two CM tori; {pⁿ}; finite residue q | GL₂ generated; {pⁿ : n ≥ 1} not closed in the disc; |x^q−x| ≤ |π| on O_L-points while Gauss norm is 1 and {|π| ≤ |x^q−x|²} is a disjoint neighbourhood | Retain |
| 11.1 | G_m tower, K_n = (1+pⁿZ_p)×I | ∩(1+pⁿZ_p) = {1}; {1,p} by valuations 0,1; 1+pᵐZ_p at level m | Retain |
| 11.3 | g H_{b_H}(Q_p) g⁻¹ | (ghg⁻¹)b_G = g h f(b_H)σ(g)⁻¹ = b_G σ(ghg⁻¹) | Inner-form level is right; source's H(Q_p) is a slip |
| 11.4–11.5 | GL₂/P; inverse mirabolic | tangent 4 → 1, kernel 3; inverse weights 0,−1,2 give HT-special, not special; empty index ⇒ all M_C | Retain |
| 11.6–11.7 | [1:c], c ∈ L([μ])∖E; GL₄; trivial group | not E-rational; weights −1,0,1 on the parabolic; point = point | Retain |
| 11.8 | b = diag(1,p), μ = diag(1,z⁻¹) | Ad(μ)E₁₂ weight +1 ⇒ Fl_[μ] = point, Fl_[μ⁻¹] = A¹; Ad(b)E₁₂ = p⁻¹E₁₂, slope −1; lattices at x = 0,1 differ (ξ⁻¹e₂ ∉ second); trace flags [0:1], [1:1] | Retain; source's diag(z⁻¹,1) would give HT flag A¹ |
| 12.1 | Borel of GL₂; GL_n; p = 7 | head of Sym^kV⊗det^j restricted to B is χ₁^jχ₂^{k+j}, equal to χ₁ only for k = −1, so χ₁ is never a direct summand of a tensor construction, only a subquotient; GL_n semisimple; μ₃ ⊂ Q₇ since 3 | 6 | Retain |
| 12.2–12.3 | rank one; (Z/pᵐ)× | Z_p× ⊂ Q_p×, cosets Z; orders p^{m−1}(p−1): (1,2,4) at p = 2, (2,6,18) at p = 3; −1 ≡ 1 mod 2, 3 mod 4; Z → Z_p×, n ↦ (1+p)ⁿ has infinite orbits | R01 |
| 12.4–12.5 | Γ = 1; Ram(D) = {p,ℓ}; n = 2 | γx ≠ x in the product; Ram(B) = {∞,ℓ}, invariants swap at p and ∞; (Ω/Γ₁)×(Ω/Γ₂) | Retain |
| Suggested.lean | all 23 docstring groups | 0 declarations, 0 sorries; no carrier at the pins for any headline | Correct |

## Not verifiable

- The declared supplier gaps are contracts, not results verified here; the strict-field Serre openness, the arbitrary-field full-rank de Rham criterion and the basic Hodge-type uniformization remain explicit hypotheses at their consumers, as the README states.
- AdicSpacesPartV exists only as a board design; its RZ targets were read there, not on main or at an open head.
- The published versions of HKI (Algebra & Number Theory 20, 2026) and HKII (Inventiones, DOI 10.1007/s00222-025-01400-6) were not collated; every locator is to arXiv v2, as the manifest records.
- Ownership against open pull requests was checked only through the `roadmaps grep` index of 2026-11-03 and the sibling checkouts named in the brief.

## Source issues

- **Error** in HKI at Proposition 3.1.7(2), printed pp. 22–23 (HKI lines 1047–1051, 1065): the source says an invariant lattice descends to K[[t]] whenever the group scales t by an infinite-order character; it should also require vanishing of the nonzero twisted coefficient invariants, as the γ: u ↦ 2u, t ↦ 2t example shows; affects a stated result.
- **Misprint** in HKI at the proof of Lemma 4.3.1, printed p. 34 (HKI line 1610): the source writes the cokernel as M₁/M₂; it should be M₂/M₁; affects nothing.
- **Misprint** in HKI at the proof of Lemma 4.3.2, printed p. 35 (HKI lines 1628–1631): the source uses slope λ/2 for the weight-λ modification; it should be −λ/2 in the p-adic convention of Definition 4.2.1; affects nothing.
- **Misprint** in HKI at the proof of Theorem 5.1.6, printed p. 42 (HKI line 1960): the source indexes the weight-w summand by slope −w/2; it should be w/2 (Tate weight −2 has slope −1); affects the proof.
- **Error** in HKII at Remark 2.3.5, printed p. 17 (HKII lines 794–811): the source says every exact tensor functor to constant-coefficient local systems is a G(Q_p)-torsor; it should require local isomorphism to the standard fibre functor, since the quaternionic PGL₂ fibre functor has no sections; affects a stated result.
- **Misprint** in HKII at the proof of Proposition 6.2.3, printed p. 37 (HKII line 1686): the source says the isocrystal of a weight-2ν Hodge structure has slope morphism 2ν; it should be ν; affects the proof.
- **Gap** in HKII at the proof of Lemma 6.3.3, printed p. 38 (HKII lines 1737–1740): the source applies Theorem 3.3.1(3), stated for smooth X, to a seminormal S; it should pass through a resolution and seminormal descent, or Theorem 5.0.4(4); affects the proof.
- **Gap** in HKII at the proof of Theorem 7.2.3, printed p. 42 (HKII lines 1938–1941): the source invokes Liu–Zhu Theorem 3.9(iv) over a general p-adic base field; Liu–Zhu is stated for finite extensions of Q_p (LiuZhu line 86), so the general-field criterion needs its own proof; affects the proof.
- **Error** in HKII at Lemma 7.5.1(1), printed pp. 46–47 (HKII lines 2117–2122): the source says the b_H-rigidified canonical reduction factors through the neutral H-admissible locus for any locally spatial Y; it should assume Y connected or state it per component, since on Spd C ⊔ Spd C with the norm-one torus T ⊂ SL₂, b = 1 and lattices t^{μ₀}, t^{μ₁} the second point has a nonneutral étale T-form; affects a stated result.
- **Gap** in HKII at the proof of Proposition 7.5.2, printed pp. 47–48 (HKII lines 2154–2165): the source says the Chevalley-line Hodge locus maps into the b_H-admissible locus; it should first select the neutral piece of the locally constant H¹-kernel, by the same T ⊂ SL₂ example; affects the proof.
- **Error** in HKII at Remark 7.5.3, printed p. 47 (HKII lines 2137–2139): the source says the preimage of the b_G-admissible locus is the b_H-admissible locus; it should retain the subgroup condition, since the Borel point [1:1] is GL₂-admissible for diag(p,1) but not Borel-admissible; affects a stated result.
- **Misprint** in HKII at Remark 7.5.3, printed p. 47 (HKII lines 2141–2145): the source gives b = diag(p,1) for the isomorphism A¹ → A¹ of admissible loci; with that b the Borel-admissible locus of the A¹ cell is empty, and b = diag(1,p) with μ_H = (0,−1) gives the stated isomorphism; affects nothing.
- **Misprint** in HKII at Remark 9.1.4, printed p. 56 (HKII line 2503): the source gives μ = diag(z⁻¹,1), b = diag(p,1) for the ordinary Serre–Tate family; with the paper's filtration convention these give Hodge–Tate flag A¹, and μ = diag(1,z⁻¹), b = diag(1,p) give the asserted single Hodge–Tate point; affects nothing.
- **Misprint** in HKII at the proof of Theorem 9.1.3, printed p. 57 (HKII line 2573): the source forms the Hodge–Tate-side level from H(Q_p) × I; it should use g H_{b_H}(Q_p) g⁻¹ × I, the embedded inner form; affects the proof.
- **Error** in HKII at §10.1, printed p. 64 (HKII lines 2885–2886): the source says the Katz–Igusa Z_p×-tower equals the crystalline-frame G_b(Q_p)-torsor; it should be its integral reduction, the rational torsor being the Q_p×-extension; affects a stated result.
- **Misprint** in HKII at §10.1, printed p. 64 (HKII line 2901): the source writes a uniformized component as M/K_p × Γ; it should be the quotient of M/K_p by the discrete Γ; affects nothing.
