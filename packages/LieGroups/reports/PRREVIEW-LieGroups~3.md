# Review of LieGroups (pull request #1051 at 727ab5e)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`

**Verdict:** needs changes

The gate fails (sorry-data 29, depcheck UPWARD + CYCLE, build 55 non-sorry warnings, blob 11, tex 8, residue 7, layer-ids 1, readme-ids-missing 2). `Suggested.lean` elaborates with `lake env lean` (exit 0, no errors, 134 `sorry` declarations, 55 other linter warnings). The dependency check run on this head prints exactly:

```
UPWARD: LieGroups (on main) -> NoncompactQuantumSymmetry (#140) at README lines [989]
CYCLE among: LieGroupoidsPoisson, LieGroups, NoncompactQuantumSymmetry
depcheck: 204 roadmaps, 1654 edges, 2 problem(s)
```

## R01 (P1) — sorry'd data in `Suggested.lean` and the companions

Location: `TauCetiRoadmap/RepresentationTheory/LieGroups/Suggested.lean` lines 299 (`bch`), 686, 886, 969, 1040, 1044, 1058, 1222, 1506, 1514, 1549–1558, 1599–1616, 1682, 1704, 1709, 1727, 1734, 1746, 1823, 1833, 1853, 1873, 1896, 1922 (the gate's 29); `BanachNonintegrabilityTargets.lean` lines 28–33, 58–65, 70, 77–79, 82–98, 127–151, 181, 187–193.

Claim: these are definitions, instances and structure instances whose bodies, membership proofs or law fields are `sorry`, and the headline theorems that mention them (`no_Banach_integration`, `su2_no_section`, `even_complement`, `kernelEquiv`, `representation_kills_center`, `pointStabilizer_equiv_SU3`, …) rest on them.

Witness: `def pointStabilizer … one_mem' := sorry` (line 889); `noncomputable def bch … := by sorry` (299–301); `def loopBracket … by sorry` (companion 77–79); `instance : CompleteSpace B := by sorry` (companion 70). The principles make sorry'd data blocking; the gate rule `sorry-data` lists the 29.

Repair: give the routine ones real bodies (`Subgroup` closure proofs, matrix membership of `su2J`, `su2Diagonal`, `evenTorus`, `periodLattice`, the `Quotient.lift` compatibility proofs) and delete the heavy ones (`bch`, `extendTangentLieIsometry`, `localOrbitTrivialization`, `kernelEquiv`, `halfPeriod`, `quotientProjectiveHomeomorph`, `projectivizationSphereEquiv`, `leftTranslationOnEquivariantFunctions`, the whole Banach companion) together with every theorem that mentions them; the README keeps those statements as targets.

## R02 (P1) — cycle through LieGroupoidsPoisson and NoncompactQuantumSymmetry, upward citation of NoncompactQuantumSymmetry

Location: `README.md` line 736 ("SBC B1.1's principal-bundle construction consumes … LieGroupoidsPoisson G0.1"), line 989 ("NoncompactQuantumSymmetry … consumes it"), line 2190 ("Consume only the pre-polar part of NoncompactQuantumSymmetry M0").

Claim: the README names two open new-folder roadmaps as suppliers that themselves consume this roadmap.

Witness: LieGroupoidsPoisson at its head, `README.md` lines 92–94 and 230–232, lists "From TauCetiRoadmap.LieGroups" Layers 0–5 as its supplier; NoncompactQuantumSymmetry at its head, lines 733–809, consumes "LieGroups Layer9's semisimple specialization" and polar decomposition. The dependency check prints the UPWARD and CYCLE lines quoted above.

Repair: delete the three citations. Layer 6 needs only SmoothBundlesConnections B1.4 (on main), and what B1.1 consumes is B1.1's business. For Layer 9 own the input it needs (a compact real form and a positive Cartan involution of a finite-centre semisimple algebra come from Layer 7's compact real form via LieHighestWeight Layer 7) and say that NoncompactQuantumSymmetry is a downstream consumer in a `Downstream consumers` paragraph, never as a supplier.

## R03 (P1) — supplier sections cited that do not exist where they are cited

Location: `README.md` lines 1763 and 2036 ("SchubertGeometry S2.1, S3.1 and S3.3"), 1807 ("SchubertGeometry S3's early associated-line contract"), 2054 and 2391 ("ComplexKahlerGeometry K5b and K6.0"), 2080 ("RootSystems4A's finite root automorphisms"), 1098 ("[HopfRinow Layer3](../../HopfRinow/README.md)").

Claim: SchubertGeometry and ComplexKahlerGeometry are on main; the cited sub-sections exist only at the heads of their open revision pull requests, which are never dependencies. RootSystems has no section 4A anywhere. The HopfRinow link points at a folder that does not exist.

Witness: main `TauCetiRoadmap/SchubertGeometry/README.md` has only the eight-line headings S1–S9 (lines 30–107) and no `S2.1`/`S3.1`/`S3.3` (grep count 0); the labels appear at the SchubertGeometry revision head (#1224, lines 329, 369, 461). Main `ComplexKahlerGeometry/README.md` has no `K5b` heading (K5 at line 568, K6.0 at 1245; `K5b` only as a forward mention at 578); `5.7 … (K5b.0)` and `5.8 … (K5b.1)` exist only at the revision head #1398. Main `RepresentationTheory/RootSystems/README.md` has Layers 1–6 and no `4A` (grep count 0). HopfRinow is at `Completed/HopfRinow/README.md`, not `TauCetiRoadmap/HopfRinow`. The blob links at lines 1763, 1777, 1807, 2055, 1342, 1347, 1372, 1402, 1798, 1871 pin commits of those revision pull requests.

Repair: cite main as it is (SchubertGeometry S2 and S3 by their main headings, ComplexKahlerGeometry K5 and K6.0, RootSystems Layer 4 and Layer 6 for the finite root automorphisms, or own the Weyl-versus-diagram automorphism statement in Layer 8N), fix the HopfRinow path, and remove every commit-pinned link.

## R04 (P2) — the new application layers are extensions of a roadmap on main

Location: `README.md` Layers 5N (496–690), 6A (846–972), 7E (1267–1397), 7F (1399–1489), 7G₂ (1491–1669), 8N (2076–2175), the SL₂(ℝ) covers (1055–1093), the space of maximal tori (767–824), the big-cell module (1795–2020), and the four companion `.lean` files.

Claim: this pull request revises the 554-line LieGroups roadmap on main into 2436 lines, deleting 378 of its lines and adding seven application layers (Banach non-integrability, finite real fields and the Heisenberg circle, exceptional symmetric spaces, compact centres, the octonionic G₂, compact normalizer lifts, B_{n−1}-orbits and Verma pairings). A Tau Ceti roadmap is built on, never re-planned; extensions are Part II roadmaps.

Witness: `git diff --stat origin/main...HEAD` gives README `+2284/−378`; the README's own Ordering paragraph (line 2399) says "A natural fracture, should this roadmap be split, is LieGroupsCore, LieIntegration, CompactLieGroups, ComplexReductiveGroups, RealReductiveGroups", and Layer 5N opens with "This branch works over complete normed model spaces", a different setting from the roadmap's standing finite-dimensional hypothesis (line 81).

Repair: keep Layers 0–9 of the main roadmap here (with the native-floor corrections of R05) and move each application block to a Part II roadmap whose introduction says where LieGroups stops: at least "LieGroups, Part II" for 5N/6A/7E/7F/7G₂/8N and the SL₂(ℝ) and big-cell examples; cite LieGroups by layer from there.

## R05 (P2) — Layers 0, 2, 3 and 5 restate what Tau Ceti proves at the pin

Location: `Suggested.lean` lines 124–126 (`oneParameterSubgroup_existsUnique`), 212–245 (`EmbeddedLieSubgroupData`, `IsEmbeddedLieSubgroup`, `isEmbeddedLieSubgroup_of_isClosed`), 249–254 (`contMDiff_of_continuous_monoidHom`), 287–289 (`monoidHom_eq_of_lieMap_eq`), 407–414 (`exists_universalCover`); `README.md` lines 278–280, 322–333, 339–341, 361–364, 403–410.

Claim: these are planned here as constructions, but Tau Ceti a91d3aaf already has them.

Witness: `TauCeti/Geometry/Lie/Subgroup/Embedded.lean` line 73 `structure EmbeddedLieSubgroupData`, line 111 `def IsEmbeddedLieSubgroup`, line 157 `theorem isEmbeddedLieSubgroup_of_isClosed` (hypotheses `[FiniteDimensional ℝ E] [LieGroup I ∞ G]`, `IsClosed K`); `Geometry/Lie/AutomaticSmoothness.lean` line 129 `TauCeti.Lie.contMDiff_of_continuous_monoidHom`; `Geometry/Lie/Faithfulness.lean` line 50 `lieMap_injective` (`[PreconnectedSpace G]`); `Geometry/Lie/Exponential/Classification.lean` line 338 `existsUnique_eq_oneParameterSubgroup` (for `φ : Multiplicative ℝ →ₜ* G`); `Geometry/Lie/Subgroup/LimitCriterion.lean` line 105 `mem_lieSubalgebraOfSubgroup_iff_exists_seq` (closed `K`); `Geometry/Manifold/Instances/UniversalCover.lean` line 115 `TauCeti.UniversalCover.instLieGroup` and `Geometry/Lie/UniversalCover.lean` line 47 `lieMap_projHom_bijective`. A scratch probe importing those modules closes the roadmap's `contMDiff_of_continuous_monoidHom` by `TauCeti.Lie.contMDiff_of_continuous_monoidHom φ hφ` and `monoidHom_eq_of_lieMap_eq` by `congrArg ContMDiffMonoidMorphism.toMonoidHom (lieMap_injective h)`.

Repair: delete the five Lean restatements and the roadmap's own `EmbeddedLieSubgroupData`/`IsEmbeddedLieSubgroup` (use `TauCeti.Lie.IsEmbeddedLieSubgroup` wherever `IsImmersedLieSubgroup` is compared with it), list the native names under the Tau Ceti supplier contract, and rewrite the README bullets as consumed facts, leaving as targets only what is new (the subalgebra of a non-closed subgroup, the Lie algebra identification of the closed subgroup).

## R06 (P2) — headline theorems absent or not named as unstatable

Location: `Suggested.lean` module docstring lines 21–50; Layer 7E block 602–722; Layer 8 block 1141–1260; no Lean for Layer 7F.

Claim: the docstring names no headline as unstatable, while several headlines are statable at the pins and absent, and others are absent without being named.

Witness: statable and absent: Layer 5's `ker Ad = Z(G)` for connected `G` (`TauCeti.Lie.Ad` is native, `Subgroup.center` is Mathlib); Layer 7F's homeomorphism `T/W ≃ K/conjugation` (both sides are quotients by `MulAction.orbitRel`, with `weylGroup T` and `IsMaximalTorus` already defined in the file). Absent and unnamed: 7E's `Isom(FII) ≃ F4`, …, `Isom(EVIII) ≃ E8` (no F4/E6/E7/E8 carrier at the pins), 7F's `Z(G_sc) ≃ P∨/Q∨`, Layer 8's Borel–Weil `H⁰(G/B⁺, L_λ) ≃ L(λ)*` and the Bott shifts (the Layer 8 docstring names only the Tits-system application). The 7E block consists of five data structures and one sorried `def` and states no theorem.

Repair: state the two statable headlines; name every other headline in the module docstring with the carrier it lacks; delete the 7E structures (they are interface records, not acceptance tests).

## R07 (P2) — companion Lean files break the Lean form; `⊤` smoothness

Location: `BigCellVermaTargets.lean` line 10 (`set_option autoImplicit false`), lines 1–3; `BigCellCovarianceTargets.lean` lines 1–2; `BanachNonintegrabilityTargets.lean` lines 2–7; `Suggested.lean` lines 938, 1008, 1014, 1079; `README.md` lines 686–689, 824, 1842, 2017.

Claim: a `set_option` of any kind is forbidden; imports are `import Mathlib` plus `TauCeti.*` modules only; the companions import `Mathlib.<submodule>` lines and carry sorry'd data (R01). `ContDiffOn ℝ ⊤` at Mathlib 6b7abb3c is `⊤ : WithTop ℕ∞`, that is analyticity, not the README's "all-orders regularity" (line 1534).

Witness: `import Mathlib.Algebra.Polynomial.Derivative` (BigCellVerma line 1), `set_option autoImplicit false` (line 10); `sectionExtension_smooth : ContDiffOn ℝ ⊤ sectionExtension ambientDomain` (Suggested 938). The README treats the companions as "Suggested forms" (824) and "native polynomial signature examples" (2017).

Repair: delete the four companions (the README keeps their statements as targets; the SL₂ operator identities and the factorial pairing stay as Checks) and write `ContDiffOn ℝ ∞` in the four chart structures.

## R08 (P3) — gate text checks and pull-request references

Location: `README.md` lines 9, 730, 736, 995, 1020, 1099, 1105, 1116, 2190 (links to `pull/NNN`), 821–822 (a Mathlib pull request and a Zulip thread), the gate's `blob` (11 lines), `tex` (8 lines: 319, 327, 488, 2182, 2183, 2201, 2208), `residue` (7 `<a id=` anchors), `layer-ids` (1491 "Layer 7G₂"), `readme-ids-missing` (`bch_R`, `lieExp_eq_expUnit`).

Repair: cite roadmaps by name and section; write `Ad_(exp tX)`, `^{-1}` and `GL_{2n}` in Unicode or in code spans; delete the anchors and flatten the `](#id)` links; rename the layer `Layer 7G: …`; write the BCH value in prose without a backticked name and cite the native `lieExp_eq_expUnit` as `_root_.lieExp_eq_expUnit` in the Tau Ceti contract (the gate reads a bare backticked name as the roadmap's own); fix the 55 non-sorry build warnings (unused section variables, overlapping `IsManifold`/`LieGroup` instances, `letI`, `simpa`, `@[instance_reducible]` on `def`s).

## R09 (P3) — process residue

Location: `README.md` line 2436 (a paragraph after References: "Prototype typing boundary for the positive-pair application … `CompactDivisionOctonion.DivisionOctonionReal` from another unimported file"), lines 231–234 ("gives nonexhaustive signatures for further constructions"), 686–689, 824, 1842, 2017; `Suggested.lean` lines 24–31 ("not exhaustive … `sorry` is allowed in this human-owned roadmap library"), 727 ("LieHighestWeight Layer8 prototype").

Witness: `CompactDivisionOctonion.DivisionOctonionReal` occurs nowhere in the pinned sources (the citation check lists it); the paragraph describes a typing decision, not mathematics.

Repair: delete line 2436 and the sentences naming companion files; make the docstring say what the file is (headline theorems against the pins) and which headlines are not statable.

## R10 (P3) — locators

Location: Layers 5 (415–481), 6A, 7E, 7F, 7G₂, 8N and the big-cell block (1795–2020) carry no locator for their theorems; the Knutson citations "general1 p3" (445), "complex4 pp2–3" (480), "second-semester p5" (1659), "semester2 p6" (1942), "first-semester p49" (1702), "semester1 pp173–176" (1744); `References` names no such notes.

Witness: the cited course page `pi.math.cornell.edu/~allenk/courses/16spring/` lists only `characters.pdf`, `UnReps.pdf`, `BorelWeil.pdf`, `root1.pdf`, `WCFandGC.pdf`, `Construction11.pdf`; none of the six labels resolves to a text, so none of those claims can be checked. Qiu is cited by an HTML view (1395) and Heins by an HTML view (1052); both resolve to arXiv PDFs.

Repair: give each theorem of the new layers a locator into a text a reader can open (Bröcker–tom Dieck, Knapp, Helgason, Neeb, Qiu, Colarusso–Evens), add every cited text to References with a reachable URL, and drop the Knutson page references that have no text.

## R11 (P3) — definitions without Checks

Location: `Tor(K)` (767), `per_ω` (561), `B` and `K` (599, 610), `P_F` (877), `Q` (933), `G` and the Cayley frame (1502, 1524), `C_λ` and `D_X` (1940–1956), `H` and `A` (2114–2124), `IwasawaData` fields.

Claim: only the Bruhat block (1676–1679) has a `**Checks.**` list; every other definition of the new layers has none, although the prose contains the values (the SU(3) alcove vertices, `κ(E_i,E_j)=2δ_ij`, `(tj)² = −I`, the thirteen orbits).

Repair: turn those computed values into three Checks per definition, each with the wrong model it excludes (for `per_ω`: the zero cocycle gives `0`; a coboundary change leaves `d` unchanged; `θ=0` gives `dℤ`).

## R12 (P3) — padding in `Suggested.lean`

Location and witness (one-tactic probe on a scratch copy importing the built module, elaborated with `lake env lean`): `finrank_pos` (1776) closes by `Module.finrank_pos`; `geometric_finite_real_extension` (1799) by `Real.nonempty_algEquiv_or F`; `complex_polynomial_has_root` (1808) by `Complex.exists_root (Polynomial.natDegree_pos_iff_degree_pos.mp hp)`; `real_irreducible_degree` (1805) by `hp.natDegree_le_two`, `hp.natDegree_pos` and `omega`; `su2J_square` (1560) by `simp [su2J, sq, Matrix.one_fin_two]`; `regularPermutation_injective` (1535) by `simpa [regularPermutation] using congrArg (fun e => e 1) h`; `monoidHom_eq_of_lieMap_eq` and `contMDiff_of_continuous_monoidHom` as in R05; `exp_add_smul` (151) and `exp_conj_units` (188) are `NormedSpace.exp_add_of_commute` and `NormedSpace.exp_units_conj` after the same `letI : NormedAlgebra ℚ R := NormedAlgebra.restrictScalars ℚ ℝ R` the file uses at 144. Proved wrappers and `rfl` lemmas restating native or definitional facts: `lieExp_zero`, `lieExp_add_smul`, `Ad_mul`, `conj_lieExp`, `lieMap_lieExp`, `effectiveMetricAction_mk`, `effectiveMetricAction_injective`, `productAut_map_one`, `productAut_map_mul`, `cayleyNormedRing_additive_parent_eq`, `CayleyNormedRing.ofCompatibleParents_*`, `quotientCoordinates_projection`, `commutatorPart`, the `#check`-free `example` at 419. Small-value theorems: `su2J_normalizes`, `su2_coset_square`, `central_half_ne_one`, `generatorPath_commutator`, `central_fourier_parameter`.

Repair: delete them from `Suggested.lean`; the README keeps each as a Check.

## Verified sound

**Adversarial table** (sampled targets, headlines, and every target a finding touches; values computed by hand unless noted).

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| SL₂(ℝ): QR chart, π₁ = ℤ, covers H_m = G̃/⟨ζ^m⟩ (1057–1066) | m = 1, 2, ∞ | kernel of p_m: order 1, 2, ∞; H_1 = SL₂(ℝ) | sound |
| (H_m)_ℂ ≃ SL₂(ℂ), η_m = ι∘p_m, j(ζ)=1 (1068–1075) | m = 2 | j = ι∘p by uniqueness on connected G̃; ι(p(ζ)) = ι(1) = 1 | sound |
| no faithful finite-dim rep of H_m, m ≥ 2 (1077–1083) | standard rep of SL₂(ℝ) | intersection of kernels = ker p_m ≠ 1 | sound |
| diag(−2,−1/2) ∉ exp(sl₂ℝ) (1088) | X commuting with it | X diagonal real ⇒ exp X has entries e^a > 0; det = 1 ✓ | sound |
| E8 roots ±e_i±e_j, half roots with even minus signs; E7 ⊥ e7+e8 (1326–1328) | count | 112 + 128 = 240; E7: 60 (D6) + 2 (A1) + 64 (mixed: 2⁶·2/2) = 126 | sound |
| E6 ⊥ e6+e8, e7+e8; u = e6+e7−e8 (1328–1330) | ⟨u, e6+e8⟩, ⟨u, e7+e8⟩ | 0, 0; roots 40 (D5) + 32 (half, ε6=ε7=−ε8) = 72 | sound |
| λ = (2/3)u ∈ P∖Q, odd D5 flip + u ↦ −u is outer (1368) | pairing with half root | (2/3)(3s/2) = s = ±1 ∈ ℤ; coordinates 2/3 ∉ ℤ∪(ℤ+½); 4 signs flip ⇒ parity kept | sound |
| |Z(G_sc)| = 1,3,2,1 (1334) | det Cartan F4, E6, E7, E8 | 1, 3, 2, 1 | sound |
| N_G(H)/H ≃ N_W(Ψ)/W_Ψ trivial; indices 63, 135, 27, 3 (1357–1365) | |W(E7)|/(|W(D6)|·2), |W(E8)|/|W(D8)|, |W(E6)|/|W(D5)|, |W(F4)|/|W(B4)| | 2903040/46080 = 63; 696729600/5160960 = 135; 51840/1920 = 27; 1152/384 = 3; a group of order ≤ 2 (resp. ≤ 4) dividing an odd number is trivial | sound |
| EIII kernel ⟨(z,i)⟩ order 4 on 27 = V_2 ⊕ S⁺_{−1} ⊕ 1_{−4} (1294, 1304) | (z,i) on the three summands | (−1)·i² = 1; i·i^{−1} = 1; i^{−4} = 1; charges sum 20−16−4 = 0; z² = (−1)^{45}(−1)^{10} = −1 | sound |
| EVI kernel ⟨(ω,−1)⟩ on 56 = (S⁺,1) ⊕ (V12,2) (1295, 1315) | (ω,t) | ω = +1 on S⁺, −1 on V12 ⇒ t = −1; ω² = (−1)^{66} = 1 | sound |
| EVIII kernel {1,ω} on 248 = 120 ⊕ S⁺; FII kernel trivial (1296, 1321) | ω on Λ²V, S⁺; −1 on spin16 | +1, +1; −1 | sound |
| tangent dimensions 16, 32, 64, 128 (table 1291) | dim G − dim H | 52−36, 78−46, 133−69, 248−120 | sound |
| S⁻12 ⊗ ℂ² real form (1316) | n = 12 ≡ 4 mod 8 | quaternionic ⊗ quaternionic = real, dim 64 | sound |
| T/W ≃ K/conj reverse implication (1444–1447) | t, u ∈ T, gtg⁻¹ = u | T, gTg⁻¹ ⊂ C_K(u)⁰; c ∈ C_K(u)⁰ with cg ∈ N(T) and (cg)t(cg)⁻¹ = u | sound |
| SU(n) alcove a₁ ≥ … ≥ a_n, a₁ − a_n ≤ 1; SU(3) vertices (1471–1478) | (2/3,−1/3,−1/3), (1/3,1/3,−2/3) | exp = e^{−2πi/3}I = ω²I and ωI (ω = e^{2πi/3}); kernel = sum-zero ℤ³ | sound |
| SU(2) → SO(3): t ↦ 1/2 − t, angle 4πt (1479–1483) | t = 0, 1/4, 1/2 | −I = exp(2πi·diag(1/2,−1/2)); angles 0, π, 2π | sound |
| Cayley frame sections ṽ(u), z̃(u) (1530–1533) | u = u₀ | denominators ‖v₀‖ = 1, ‖z₀‖ = 1 | sound |
| J² = −1, Ω(b₁,b₂,b₃) = 1, J(jℓ) = −(ij)ℓ (1547–1555) | u = i, b = (j, ℓ, jℓ) | ρ(j,ℓ,jℓ) = ⟨jℓ,jℓ⟩ = 1; ρ(ij,ℓ,jℓ) = ⟨kℓ,jℓ⟩ = 0; with a(bℓ) = (ba)ℓ: i(jℓ) = (ji)ℓ = −kℓ | sound (pins the Cayley–Dickson order, matching LHW Layer 8's `(a,b)(c,d) = (ac − d̄b, da + b c̄)`) |
| product formula u-coefficient +ω(v,w), det_ℂ law ⇒ stabilizer = SU(3) (1558–1565) | v, w ⊥ 1,u | vw = −⟨v,w⟩ + v×w, ⟨v×w,u⟩ = ⟨u×v,w⟩ = g(Jv,w) | sound |
| SU(2)→SU(3)→S⁵, det(U)⁻¹ column fix; π₀, π₁ (1570–1590) | exact sequence | π₁(SU(2)) = 0 → π₁(SU(3)) → π₁(S⁵) = 0; then SU(3) → G → S⁶ | sound |
| G₂ roots α = ε₂, β = ε₁−ε₂ (1602–1605) | inner products | α² = 2/3, β² = 2, (α,β) = −1; α(β∨) = −1, β(α∨) = −3; det = 1 ⇒ P = Q | sound |
| branching table (1641–1646) | dimensions | 7 = 1+3+3; 14 = 8+3+3; 27 = 1+3+3+6+6+8; 64 = 3+3+6+6+8+8+15+15; Sym²7 = 28 = 1+27; 7⊗14 = 98 = 7+27+64 | sound; agrees with the Sage G₂ → A₂ example cited |
| n_i² = α_i∨(−1) = class of α_i∨/2 = exp(π α∨_comp) (2105, 2113) | calibration coroot ↦ 2π α∨_comp | (1/2)·2π = π | sound |
| kernel Q∨/(Q∨ ∩ 2Y) (2122) | image of (1/2)Q∨ in V/Y | (1/2)Q∨ ∩ Y = (1/2)(Q∨ ∩ 2Y) | sound; elementary 2-group |
| SU(2): (tj)² = −I, no section (2140–2143) | t = diag(z, z̄) | j t j⁻¹ = t⁻¹ so (tj)² = t t⁻¹ j² = −I; probe closes `su2J_square` | sound |
| SO(2r), SO(2r+1) complements (2146–2152) | det of plane permutation, plane reflection | sign(σ)² = 1; ∏ε_i (even) resp. ∏ε_i · ∏ε_i = 1 | sound |
| thirteen B₂-orbits on flags of ℂ³ (1707–1742) | five line orbits × plane orbits | 3+3+3+2+2 = 13; dims (0,0,1),(1,1,2),(2,2,3),(2,1),(0,1); counts 3,5,4,1 | sound; matches Colarusso–Evens Example 4.15 (colarusso-evens line 937–958: rows of 3, 5, 4, 1 orbits) |
| b(1,1,1) moves ℂe₂ and span(e₂,e₃) (1749) | e₂ ↦ e₁+e₂ | invariant lines ℂe₁, ℂe₃; planes span(e₁,e₂), span(e₁,e₃) | sound |
| sl₂ operators D_e = −∂, D_h = m − 2z∂, D_f = z²∂ − mz (2007) | Gauss chart with g = exp(tX) | [D_e,D_f] = m − 2z∂ = D_h; [D_h,D_e] = −2∂ = 2D_e; [D_h,D_f] = −2D_f; derived from `f ↦ λ(b−)⁻¹ f(n′)` with b− = diag(1/(1−tz), 1−tz) for X = f | sound |
| ⟨z^i, f^j v_m⟩ = δ_ij (−1)^j j! (2010) | i = j | ((−∂)^j z^j)(0) = (−1)^j j! | sound |
| κ(E_i,E_j) = 2δ_ij, [E₂,E₃] = 2E₁, H(E₁,E₂,E₃) = 2, d = 4π² (633–638) | E₁ = diag(i,−i), E₂, E₃ | E₂E₃ = E₁, E₃E₂ = −E₁; vol(S³) = 2π² | sound |
| ω(f,g) = −2πi Σ n tr(A_{−n}B_n) (680) | g′ = Σ 2πin B_n e^{2πint}, ∫e^{2πi(m+n)t} = δ_{m,−n} | matches | sound |
| per_{ω_θ}(m,n) = d(n − θm), rational θ = a/b gives (d/b)ℤ (662–669) | (d,0) ↦ −θd, (0,d) ↦ d | kernel {((0,t),(0,θt))}; Neeb Remark VI.1.14 (neeb2015 lines 4361–4366) | sound |
| Weyl integration: SU(2) f = 1/sin²θ (841) | D = 4 sin²θ | ∫_G f = ½·∫4 dθ/2π = 2 < ∞; ∫_T 1/sin²θ diverges; pushforward total mass ½·2 = 1 | sound |
| `weylDensity` = |det(Ad(t⁻¹) − 1) on 𝔤/𝔱| (486) | rank 0 | det on 0 = 1, |W| = 1, ∫_G = ∫_T | sound |
| local degrees positive (750–757) | Ad_a on m | det +1, no +1 eigenvalue ⇒ −1 multiplicity even ⇒ dim m even | sound |
| Q ⊂ ℝ refutes the limit criterion for non-closed H (332) | t_n = 1/n, X_n = 1 | 1/n ∈ ℚ yet exp(t·1) ∉ ℚ | sound |
| ℂ/(ℤ+(√2+i)ℤ) ⊃ ℝ/ℤ with no antiholomorphic involution (1163) | conj(√2+i) ∈ Λ? | a + b(√2+i) = √2 − i forces a = 2√2 | sound |
| conjugation by diag(2,1/2) on [[0,−1],[1,0]] (1259) | matrix product | [[0,−4],[1/4,0]] | sound |
| Heisenberg: [[s,0,0],[0,t,0]] = [0,0,st]; weight-k scalar e^{2πikt} (945, 942) | native law (x,y,z)(x′,y′,z′) = (x+x′, y+y′, z+z′+xy′) (`GroupTheory/SpecificGroups/Heisenberg.lean` 92); `fourierChar 1 k` = `fourier k` | (s,t,st)(−s,0,0)(0,−t,0) = (0,0,st); trace of commutator 0 = 2πik·dim V_k | sound |
| P_F = Fˣ/ℝˣ ≅ RP^{d−1} a torus forces d ≤ 2 (891–907) | d = 1, 2, 3 | point; RP¹ = S¹; π₁(RP²) = ℤ/2 ≠ ℤ^r | sound |
| exp(X)_ij coefficient (e^{X_ii} − e^{X_jj})/(X_ii − X_jj) (2226) | Σ_k X^k/k! linear in X_ij | divided difference, value e^{X_ii} at equal diagonals | sound |
| 7F calibration: dν_alg(1) = −iα∨_comp, d(ν|S¹)(i) = α∨_comp, dα_alg(dν_alg(1)) = 2 (1415–1417) | ν(e^{iθ}) = exp(θα∨_comp), dχ_α = iα_comp | α∘ν(z) = z², derivative 2; (−i)(i) = 1 | sound; same values as LieHighestWeight Layer 10 (main lines 1726–1735) |
| Lean `IsotropyRootNormalizerComparison.normalizes_iff` (661) | n ∈ N(T) | n normalizes the full-rank connected H iff w(Ψ) = Ψ | sound |
| Lean `QuotientMetricRealization.kernel_eq_center` (626) | G_sc/H, H ⊇ T ⊇ Z | core(H) has zero Lie algebra, discrete normal ⇒ central ⇒ = Z | sound |
| Lean `evenSignedMatrix`, `rotationMatrix` (1576–1591) | block [[cos,−sin],[sin,cos]], plane reflection diag(1,−1) | det = ∏ε_i | sound |
| Lean `IwasawaData`, `cartan_polar_decomposition` (1324–1432) | K = G^θ meeting every component | ∃! (k, X) for the global matrix-cover model | sound |

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `NormedSpace.exp` (no `𝕂` argument; `exp_units_conj` at `Analysis/Normed/Algebra/Exponential.lean` 588), `Real.nonempty_algEquiv_or` (`Analysis/Complex/Polynomial/Basic.lean` 58), `Complex.exists_root` (37), `Irreducible.natDegree_le_two` (197), `LieDerivation.IsKilling.exists_eq_ad` (`Algebra/Lie/Derivation/Killing.lean` 108), `FundamentalGroup.mul_def` (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean` 41, `p * q = q.trans p`), `IsCoveringMap.monodromy` (`Topology/Homotopy/Lifting.lean`), `deck` (`Topology/Covering/Deck.lean`), `LieAlgebra.ofTwoCocycle`/`ofProd` (`Algebra/Lie/Extension.lean`), `loopAlgebra`/`residuePairing`/`twoCocycleOfBilinear` (`Algebra/Lie/Loop.lean`), `GroupLieAlgebra`/`mulInvariantVectorField` (`Geometry/Manifold/GroupLieAlgebra.lean`), `SemidirectProduct.mulEquivSubgroup`, `RootPairing.weylGroupToPerm`, `weylGroup.ofIdx`, `CoxeterSystem`; Tau Ceti: `lieExp`, `lieExp_zero`, `lieExp_add_smul`, `oneParameterSubgroup` (`Geometry/Lie/Exponential/Basic.lean`), `contMDiff_lieExp`, `isLocalDiffeomorphAt_lieExp_zero`, `unitsLieAlgebraEquiv`/`lieExp_eq_expUnit` (`Exponential/Units/Compatibility.lean` 99, 125), `TauCeti.Lie.Ad`, `conj_lieExp`, `lieMap`/`map_lieExp`, `lieSubalgebraOfSubgroup`, `lieLocalBCH`, `leftInvariantDerivationLieEquivGroupLieAlgebra` (`Tangent/LieEquiv.lean` 103), `pointDerivationEquivTangentSpace`, `TauCeti.kostantPartition`/`finite_setOf_isKostantPartition`/`kostantPartition_zero`, `geckSimpleWeylPoint` (lines 111–121) and `geckWeylWordPoint` (350–352) at the cited blob lines, `g2SimplyConnectedRootDatum`, `G2ShortRoot` (an integral carrier with an 𝔽₃ companion), `VermaModule`/`universalEnvelopingEquivVermaModule`, `IsChevalleySystem`, `antipodeOp`, `TauCeti.Deck.IsRegular.fundamentalGroupEquiv`, `RealProjectiveSpace.mk`/`fundamentalGroupMulEquivAt` (2 ≤ n, `≃* ℤˣ`), `AddCircle.piFundamentalGroupMulEquiv`, `ContRepresentation.exists_nonempty_equiv_fourierRep`, `fourierChar` (`= fourier n`), `HeisenbergGroup`, `heisenbergX`, `derivationLieAlgebraCongr`, `Octonion.trace`/`conj`, `TitsSystem`/`existsUnique_mem_bruhatCell`, `HomotopyGroup.pathLoopSpaceMulEquiv`/`loopSpaceMulEquiv`. `IsCoveringMap.inducedChartedSpace` is not at the pin; the README cites it as DifferentialGeometry 2.3's target, which main's DifferentialGeometry line 357 names, so that citation is sound.

**Cross-roadmap citations resolved on main**: LieHighestWeight Layers 0, 3, 7, 8 (positive division octonions at lines 1287–1310 with the product `(a,b)(c,d) = (ac − d̄b, da + b c̄)` and `TauCeti.derivationLieAlgebra ℝ A`), 10 and its "Late compact-center application in LieGroups" (1623, 1726); ReductiveGroups Layers 0–3, 5, 7, 7C (652), 9A.1a-L (1230), 10; SmoothBundlesConnections B1.1, B1.4 (315, 421); DifferentialGeometry 2.3, 3.1, 3.2, 3.5, Layer 4, 10.2–10.5 (357–400, 884–890); AlgebraicTopology Stage 4.6 (271); SchemeAndStackFoundations §2.2 Leray (3309); CotangentLagrangian C2.0, C2.1 (79, 109, each saying it is independent of LieGroups Layers 7 and 9); ComplexManifolds M1 (172); HamiltonianReduction R2 (127; it consumes LieGroups Layer 6, consistent with the direction claimed at 764); ConvexityToric T1 (32, consumer); DGFloer Layer 1 item 2 (fibration exact sequence with π₀, 464–490); CompactGroups Layers 0, 1, 2, 5 (point separation is a corollary at 318–345); PositiveScalarCurvature P2 (103); RiemannianGeometry R1 (179); BanachSpaceTheory B5 (255); SpinRepresentations; AdoIwasawa; Humphreys §29.1 for `B ∩ N = T` (standard). At open heads: FormalConnectionsOpers F2.4 and F4.3 (rev/1056 lines 691, 1383); TangentialBordism's Cayley plane and F₄/Spin(9) (rev/942 lines 23–24); LieGroupoidsPoisson G0.1 (rev/1050 line 299); NoncompactQuantumSymmetry M0 (rev/1015). Ownership against ComplexComparisonPartII (C−1.1, C0.1/C0.3–C0.5, C1.9) was not checked: the brief gives no checkout of that pull request.

**Sources read** (cache ids): knutson-construction11 48d50fa5 (OCR, 5 pages): lines 15–20 state that the space of tori is `K/N(T)` with fundamental group `W` and lines 33–38 that `T → N(T) → W` does not split but a subgroup with a `Z₂^r` kernel maps onto `W`, as cited at 819 and used in 8N; qiu2024 4b4b566b: §2.2 (line 191) is "Plücker coordinates on E6/Spin(10)×_{Z4}U(1)" and Appendix B (1452) "Adam's construction of exceptional Lie algebra" with B.1 E8, B.2 E6, B.4 F4, as cited at 1395; colarusso-evens 1aa3ff95: Example 4.15 (937–958) is the Bruhat graph of the B₂-orbits on the flag variety of gl(3) with rows of 3, 5, 4, 1 orbits, as cited at 1753; heins2025 a1d9aaec (OCR): Proposition 2.1 (413–426) realizes the universal complexification as the quotient of the simply connected complex integration by the smallest closed complex subgroup containing π₁(G), as cited at 1052; neeb2015 6abc32cb: Theorem VI.1.6 (4261–4268, integrability iff the period group is discrete for central extensions), Remark VI.1.14 (4361–4366, the irrational quotient of a product with Π(g) = ℤd has Π(h) = (ℤ+ℤθ)d), Example VI.1.16 (4373–4391, the van Est–Korthagen example on u(H) × u(H)), as cited in References; styrkas2005 6454616a: (2.17) at line 424 gives the big-cell action whose contragredient realization is stated at 428, as cited at 2019. The `--manifest` run recorded these six entries in the board package's `sources.toml`.

**Build**: `lake env lean` on `Suggested.lean` from the worktree, exit 0, no errors, 134 `declaration uses sorry` warnings, 55 other warnings (unused section variables 5, overlapping instance parameters, `letI`, `simpa`, unused simp argument, `@[instance_reducible]` on `def`). The one-tactic probe is `scratch/Probe3.lean` (imports the built module and `TauCeti.Geometry.Lie.AutomaticSmoothness`, `Faithfulness`).

## Not verifiable

- Knutson's "general1 p3", "complex4 pp2–3", "second-semester p5/p6", "first-semester p49", "semester1 pp173–176" and the pull request's "S2 pp116–118, 129–131": no file of these names exists on the cited course page (only `characters.pdf`, `UnReps.pdf`, `BorelWeil.pdf`, `root1.pdf`, `WCFandGC.pdf`, `Construction11.pdf`), nor on the neighbouring `16fall`/`17spring` pages; the README's source-discrepancy remarks about these notes (1486, 1744–1748) cannot be checked.
- Kirillov, Bump, Knapp, Bröcker–tom Dieck, Hall, Serre LNM 1500, Varadarajan, Humphreys: paywalled books cited for standard material; not opened.
- The Sage branching page (1660) was not fetched; the table was checked by dimension counts and the tensor identities instead.
- ComplexComparisonPartII's cited sections (see above).

## Source issues

- none
