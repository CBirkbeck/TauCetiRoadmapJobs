# Review of ShimuraData (pull request #1038 at 7f7427f)

**Verdict:** needs changes

No P1 or P2 finding. The push gate fails on one style rule (`residue=57`, the HTML anchor tags), and the brief allows no acceptance while the gate fails; the four other findings are P3 notes. The targeted build passes, `Suggested.lean` elaborates with `sorry` as its only warning, its single theorem is true and is not padding, the dependency check shows no UPWARD or CYCLE line, and the seeded source sample verified at every locator I could read (details and line anchors under **Verified sound**).

## R01 (P3) — Gate fails: 57 HTML anchor tags in the README

**Location.** `TauCetiRoadmap/ShimuraData/README.md` lines 100, 130, 170, 191, 234, 255, 275, 315, 341, 373, 406, 439, 467, 494, 514, 535, 560, 592, 614, 638, … (every `<a id="d…"></a>` line before a `###` heading; 57 in all, e.g. line 100 `<a id="d0-hilbert-real-points"></a>`).

**Claim.** The gate's residue rule forbids `<a id=` anchor tags in the README; the worker's gate at this head reports `residue=57 … FAIL` with exactly these lines.

**Witness.** The gate record for 7f7427f lists all 57 lines; every one is an anchor tag, and the intra-README links `[§1.1](#d1-rational-weight-criterion)` etc. point at them.

**Repair.** Delete the 57 anchor lines and replace each `[§k.n](#d…)` link by the plain text `§k.n` (the headings themselves carry GitHub's automatic anchors). Re-run the gate: the only failing check is `residue`, so the gate then passes (I re-ran the dependency check and the build; both are clean).

## R02 (P3) — Four ComplexComparisonPartII declaration names do not exist at the cited head

**Location.** `TauCetiRoadmap/ShimuraData/README.md` line 89 ("ComplexComparisonPartII §C−1.1: `complexSchemeAnalytification.smooth`, `complexSchemeAnalytification.separatedHausdorff`, `complexSchemeAnalytification.openSubspace` and `complexSchemeAnalytification.fibreProduct`") and the same four names in §3.8 (line 574).

**Claim.** These are presented as the supplier's declarations.

**Witness.** ComplexComparisonPartII at its open head (#848) names only `complexSchemeAnalytification` (its README §C-1.1, lines 774–790 of the head's README): the open-restriction, fibre-product, smooth-chart and separated-implies-Hausdorff clauses are all stated there as prose, under no dotted names. The resolver flags the three suffixed names as found nowhere (`fibreProduct`, `openSubspace`, `separatedHausdorff`); `.smooth` is likewise absent.

**Repair.** Keep the citation of §C-1.1 and describe the four clauses in words ("its open-restriction, fibre-product, smooth-chart and Hausdorff comparisons"), citing the one real name `complexSchemeAnalytification`. The mathematics consumed is unchanged.

## R03 (P3) — §5.18 attributes to Pilloni's coordinates a positive system and ρ that differ from what Pilloni prints

**Location.** `TauCetiRoadmap/ShimuraData/README.md` line 1537 ("For the Siegel datum in Pilloni's coordinates the positive system is that of the lower-triangular Borel: `e₂−e₁`, `−2e₁+e₃`, `−e₁−e₂+e₃`, `−2e₂+e₃`; `ρ=(−2,−1;0)`") and the Check at line 1549 ("BP's `ρ=(−1,−2;0)` … differs from Pilloni's by the swap of the compact order").

**Claim.** The section imports ReductiveGroupsPartII's corrected base and then states the resulting positive system and ρ as Pilloni's.

**Witness.** pilloni-gsp4 lines 864–866 print the positive roots {e₁−e₂, −2e₁+e₃, −e₁−e₂+e₃, −2e₂+e₃}, the compact simple root α₁ = e₁−e₂ and ρ = (−1,−2;0); lines 873 print the coroots f₁−f₂ and f₂. So Pilloni's printed ρ equals BP's ρ, and the "swap" the Check describes is between BP and the corrected system of ReductiveGroupsPartII (gsp4-self-dual), not Pilloni's text. The printed base is inconsistent (⟨−2e₂+e₃, f₂⟩ = −2, and −2e₁+e₃ = α₂ − 2α₁ is not a nonnegative combination), which is why ReductiveGroupsPartII corrects it; the README's data are the corrected ones.

**Repair.** Say explicitly: "Pilloni prints the compact root e₁−e₂, ρ = (−1,−2;0) and the coroot f₂; that base is inconsistent with his positive system and his duality matrix, and ReductiveGroupsPartII (gsp4-self-dual) corrects it to α₁ = e₂−e₁, α₂ = e₃−2e₂ with coroots f₂−f₁, −f₂, under which ρ = (−2,−1;0)." Then compare BP's ρ with both. Add the pairing values as the Check already does.

## R04 (P3) — Locator slips: the Boxer–Pilloni Levi identity and Harris's Hodge decomposition

**Location.** `TauCetiRoadmap/ShimuraData/README.md` line 1115 ("Theorem 4.4.43(3) and Principle 4.4.44(1), pp.81–82 (arXiv v1)").

**Witness.** bp-highercoleman: Theorem 4.4.43 begins at line 3716 on p.80 and item (3) occupies lines 3724–3735, still on p.80; Principle 4.4.44 is at line 3801 on p.82, and the identity `M^c_{µ_{B₁}} = M^c_{µ_{G₁}} ×_{M^{ab,c}_{µ_{G₁}}} T^c` that §4.9 corrects is at line 3804 on p.82.

**Repair.** Cite "Theorem 4.4.43(3), p.80; Principle 4.4.44(1) and the displayed identity, p.82".

**Second location.** `TauCetiRoadmap/ShimuraData/README.md` line 357 (§2.2: "Michael Harris, … §3, pp.60–63").

**Witness.** harris-aa1988 lines 1740–1749 (§1.1, printed pp.44–45) carry the objects §2.2 constructs: `K_h` the stabilizer of `h`, the adjoint Hodge decomposition `g_ℂ = g^{0,0} ⊕ g^{−1,1} ⊕ g^{1,−1}` with `g^{0,0} = k_{h,ℂ}`, `p^± = g^{∓1,±1}`, `P_h` with Lie algebra `k_{h,ℂ} ⊕ p⁻` and the Borel embedding. Printed pp.60–63 (lines 2300–2420, §§3.1–3.4) carry the compact Cartan `H ⊂ K_h`, the compact and noncompact positive roots (`R_n⁺` the roots on `p⁺`), `ρ`, `ρ_n`, `ρ_c` and Theorem 3.4 on discrete series.

**Repair.** Cite "Harris §1.1, pp.44–45" for the stabilizer, summands and `k ⊕ p⁻`, and keep "§3, pp.60–63" for the compact Cartan and the root choices (the same split applies to the citation AutomorphicFormsOnReductiveGroups §6.1 inherits).

## R05 (P3) — Reference and consumer hygiene

**Location.** `TauCetiRoadmap/ShimuraData/README.md` line 1641 (Benoist, *The period-index problem for real surfaces*) and line 1630 (Downstream consumers: "HodgeStructuresPartII").

**Witness.** Benoist is cited nowhere in the body (the only occurrence is the References entry). `HodgeStructuresPartII` exists neither on main nor in the merge order nor among the open roadmap pull requests; the five other named consumers are in the merge order after this roadmap (lines 142, 143, 163, 165, 238).

**Repair.** Delete the Benoist entry or cite it at the claim it supports; name the actual consumer of the general variation interface (or drop the sentence).

## Verified sound

**Gate and build.** The worker's gate at 7f7427f: every check zero except `residue=57` (R01); `build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. I built `TauCeti.GroupTheory.Coxeter.Parabolic` (the only Tau Ceti import; its object file was missing from the shared package build, which is why the worker's signature extraction failed) and ran `lake env lean` on `Suggested.lean`: one warning, `declaration uses sorry` at 50:8. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. Pins of the worktree manifest: Mathlib 6b7abb3c, Tau Ceti a91d3aaf, as the README's supplier section states (main's manifest pins 358314d4/f6090c70; every library name below was checked at the worktree pin).

**Dependency check.** `gate --depcheck … --movable` output: `depcheck: 205 roadmaps, 1402 edges, 0 problem(s)`. ShimuraData is line 101 of the merge order, directly after PELModuli (100); every supplier cited is on main or earlier in the order (AdelicAlgebraicGroups 30, ComplexComparisonPartII 38, AbelianSchemesAndArithmeticModuli 40, ArithmeticLocallySymmetricSpaces 61, AutomorphicFormsOnReductiveGroups 62, ShimuraVarieties 89, PELModuli 100; ReductiveGroups, ReductiveGroupsPartII, ComplexManifolds, ComplexKahlerGeometry, StableReduction, RepresentationTheory/LieGroups on main; HodgeStructures and LocalFieldsRamification under Completed/). No `*Needs:*` line cites a later roadmap.

**Suggested.lean.** Form: `import Mathlib` plus one existing `TauCeti.*` module; module docstring "headline target signatures" naming the roadmap and listing the unstatable headlines with the missing carriers; `namespace TauCetiRoadmap.ShimuraData`; one `theorem` with docstring; no `lemma`, `set_option`, `#eval`, `#print`, sorry'd data. `#check @kostantInvolution` elaborated in a scratch copy: the type is exactly the README's §3.13 statement (Coxeter system, `J : Set B`, `w₀`, `w₀J`, maximality hypotheses, `IsMinimalCosetRep J w⁻¹`); nothing silently dropped, since there is no `variable` block.

Truth of `kostantInvolution`. At the pin, `TauCeti/GroupTheory/Coxeter/Parabolic.lean` line 233 defines `IsMinimalCosetRep J u := ∀ v ∈ cs.parabolic J, ℓ u ≤ ℓ (u * v)` (minimal in `u·W_J`), line 311 `isMinimalCosetRep_iff` (no right descent in `J`), line 101 `parabolic J := closure (simple '' J)`, line 364 `length_mul_of_forall_not_isLeftDescent`, line 377 `existsUnique_mem_parabolic_mul`. Applied to `w⁻¹`, the hypothesis says `w` has no left descent in `J`, i.e. `w` is minimal in `W_J·w`, the README's convention (`W_M\W`, `w⁻¹Φ_M⁺ ⊂ Φ⁺`). For such `w`, `ℓ(u w) = ℓ(u) + ℓ(w)` for `u ∈ W_J`, so `ℓ(w₀J w) = ℓ(w₀J) + ℓ(w)` and `ℓ(w₀J w w₀) = ℓ(w₀) − ℓ(w₀J) − ℓ(w)`; for `s ∈ J`, `ℓ(s w₀J w w₀) = ℓ(w₀) − ℓ(w₀J) + 1 − ℓ(w)`, so the image has no left descent in `J`; `w₀² = w₀J² = 1` by uniqueness of the longest element. Witness on S₃ = ⟨s,t⟩, `J = {s}`: left-minimal set {1, t, ts}; `w₀J = s`, `w₀ = sts`; the map sends 1 ↦ ts, t ↦ t, ts ↦ 1; lengths 2+0+1 = 1+1+1 = 0+2+1 = 3 = ℓ(w₀). Had the native predicate been applied to `w` instead of `w⁻¹`, the statement would be false: 1 ↦ ts and ts·s = t is shorter. Degenerate cases: `J = ∅` (w₀J = 1, map `w ↦ w w₀`, lengths add), `J = B` (forces `w = 1`), trivial `W`, infinite `W` (no `w₀`, vacuous) all hold.

**Headlines and padding.** README end results: the connected-datum lift (§4.6), the distinguished datum's centre and Levi identities (§4.9), the all-places Iwahori neatness criterion (§5.21), plus the Layer 0–3 comparisons. At the pin Tau Ceti has no Deligne torus, Shimura datum, Mumford–Tate group, Hermitian group datum, Weil restriction, Iwahori subgroup or integral Schubert scheme (grep of the pinned `TauCeti/` tree for these objects: no hits; the `Geometry/Hodge` and `Algebra/AlgebraicGroup` directories were listed and contain only the carriers the README names), so none of those headlines is statable and the docstring says so for each. The one statable Kostant theorem is stated. One-tactic probe on a scratch copy: `simp_all` leaves the full goal (the native predicate unfolds to the right-descent form only), `aesop` times out; the theorem is not padding.

**Supplier citations resolved** (every cross-roadmap citation of the README, at main or at the open head the brief names):

- ShimuraVarieties (#933 head): §§P.1–P.5 at README lines 148–202; `TauCeti.Shimura.PureDatum`, full `G(ℝ)`-class, SV1–SV3, Hodge and abelian type, connected convention (C1)–(C3), the Borel embedding, reflex fields, the "fundamental `PGL₂` cocharacter does not lift to `SL₂`" Check all present.
- PELModuli (#966): §M0.12 line 949 (`RationalPELDatum.toShimuraDatum`, `siegelMorphism`, connectedness and SV3 imposed, `pelShimuraDatum_typeD`, definite case); §M5.1 line 3500 (B = ℚ Siegel data); §M5.4 line 3605 (Case C Hilbert datum, `h(√−1)(a,b)=(−b,a)`, reflex ℚ, relative dimension d); §M5.5 line 3661 (signatures, `Σ r_τ s_τ`, signature (2,0) fails SV3).
- AutomorphicFormsOnReductiveGroups (#1037): §6.1 line 931 exposes `HermitianGroupDatum`, `hodgeStabilizer`, `positiveSplitCentre`, `compactQuotient`, `pPlus`, `pMinus`, `parabolicLie`; §6.3 line 970 exposes `splitCharacter`, `compactCharacter`, `toCompact`, `toSplit`, `rho`, `chamber`, torus `diag(t₁,t₂,νt₁⁻¹,νt₂⁻¹)`, positive roots (1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1), the four chambers and `C_i ↦ C_{3−i}` under contragredience; §6.7 line 1069: `{}ᴹW` minimal representatives of `W_M\W`, lengths 0,1,2,3 for g = 2.
- ArithmeticLocallySymmetricSpaces (#871): ALS.F.1 line 580 (`LocallySymmetric.realPoints_lieGroup`, finitely many components, embedding independence); ALS.0.1 line 1159 (Cartan involution via compact twisted form, Killing criterion on the derived algebra, central torus separate, conjugacy); ALS.0.2 line 1238; ALS.4.5 line 3586 (`W^P` = {w : w⁻¹α > 0 for every simple root α of M}, full Levi weight kept), which is exactly §3.10's `kostantIndexComparison`.
- AdelicAlgebraicGroups (#792): §1.3 line 1224 (discreteness in finite adeles iff `G(F) ∩ U` finite); §1.4 line 1279 (local factors, naturality, base-change-adelic); §3.4 lines 3141/3408 (anisotropic arithmetic quotients compact); §4.3 line 4463 (`Neat.IsNeatAut`, `Neat.IsNeatLevel`, `|ζ−1|_p` bound for primitive `p^k`-th roots).
- ReductiveGroupsPartII (main): RG2.0a lines 943–1445 (`WeilRestriction.pointsMulEquiv` line 958; RG2.0a.3 `DeligneTorus` with `z ↦ (z,z̄)`, `w(r) = r⁻¹`, `μ(z) = (z,1)` lines 1379–1445); RG2.1.5 line 2446 (z-extensions); RG2.3 lines 3760–4408 (Iwahori, pro-p Iwahori, pro-unipotent radical); RG2.5 gsp4-self-dual lines 7120–7150 (parity lattice, `e_i`, `f_i`, corrected base α₁ = e₂−e₁, α₂ = e₃−2e₂, coroots f₂−f₁, −f₂; I recomputed the four pairings: 2, 2, −1, −2).
- ComplexComparisonPartII (#848): §C-1.1 lines 724–815 (see R02).
- AbelianSchemesAndArithmeticModuli (#849): A5.2 line 2558 (Riemann forms), A5.5 line 2662 (polarized Hodge equivalence, weight-one contravariant on `H¹`).
- ReductiveGroups (main): Layers 0–4, 6, 7, 9 at lines 129–1092 (Layer 9 "pinned Chevalley–Demazure group schemes over ℤ" line 1092). StableReduction (main) Layer 2 line 405, polarized effective étale descent via graded section algebra and relative Proj at line 456. ComplexManifolds Milestone 7 line 319; ComplexKahlerGeometry K4 line 444; HodgeStructures L0/L1 line 273; RepresentationTheory/LieGroups Layer 7 line 407 and Layer 8 line 428 (both on main); LocalFieldsRamification Layer 0.

Library declarations opened at the pins: `AddValuation` and `map_inv/map_le_add/map_mul/map_zero` (Mathlib `RingTheory/Valuation/Basic.lean`), `IsDedekindDomain.FiniteAdeleRing`, `Matrix.GeneralLinearGroup.map/toLin`, `Matrix.unitaryGroup`, `NumberField.IsCMField`, `NumberField.IsTotallyReal`, `RootPairing`, `RootPairing.Base`, `RootPairing.Base.IsPos`, `RootPairing.weylGroup`; Tau Ceti `Cocharacter.parabolic/levi/limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`), `Hodge.PeriodDomain.Point`, `Hodge.IsPolarization`, `HodgeStructureOn.IsSubstructure` and its `.hodgeStructure`, `.isMorphism_subtype`, `IsMorphism.isSubstructure_ker/range`, `RationalHodgeSubstructure.orthogonal/isCompl_orthogonal`, `HopfIdeal.sSup_toIdeal`, `GeneralLinear.coordinateHopfAlgebra`, `LocalCoefficientSystem`, `geometricallyConnectedCommHopfAlgProperty`, `reductiveCommHopfAlgProperty`, `CommHopfAlgCat.commonKernelHopfIdeal`: all exist at the files the README links. Ownership against open pull requests: the brief's sibling checkouts were searched by object (Shimura datum, Mumford–Tate group, variation of Hodge structure, compact dual, Kostant representatives, Lovering's `B`, Iwahori neatness); none of the roadmaps listed builds these, and the roadmaps that do (ShimuraVarieties, PELModuli, AFRG, ALS) are cited as suppliers, not restated.

**Source sample** (the brief's fifteen targets plus every locator a finding touches; `<id> line N` into the cached texts):

| Target | Source and locator | Found | Result |
|---|---|---|---|
| 1.4 reductivity | milne-svh lines 1181–1185 (Cor 6.5, printed p.495; pdf page 29) | reductive via semisimplicity of polarizable structures | matches, route identical |
| 3.2 morphisms | milne-svi lines 1186–1188 (p.27), 1240–1264 (pp.28–29) | morphism = linear map preserving `V^{p,q}`; variation = holomorphic family with transversality | matches |
| 3.4 integral polarized variation | milne-svh lines 1051–1072 (p.492); bkt-tame lines 186–209 (§1.3 pp.4–5), 626 (§4.2 p.13) | local system + holomorphic filtration + Griffiths; PVHS of ℤ-Hodge structures | matches |
| 3.5 flat bundle local | milne-svi lines 1240–1264 | constant local system, holomorphic Hodge filtration | matches |
| 3.6 tangent criterion | milne-svi lines 1037–1039 ((18), p.24), 1253–1264 (p.29) | `dφ_s` into ⊕Hom(F^p, V/F^p); transversality iff image in ⊕Hom(F^p, F^{p−1}/F^p) | matches |
| 3.11 Kostant cone criterion | bp-higherhida lines 1766, 1777–1779 (p.34) | `^MW` by `wX*(T)⁺ ⊆ X*(T)^{+,M}`, "equivalently" `w⁻¹Φ^{+,M} ⊆ Φ⁺` with `Φ^{+,M}` the roots of `u_P` (line 1766) | README's correction confirmed: for M = T the printed root criterion gives {1}, not W (source issue below) |
| 3.15 Schubert loci | bp-higherhida lines 3108–3112 (§6.1.8 p.60); bp-highercoleman lines 1472–1484 (pp.31–32) | `C_w = P\PwB`, `X_w = ∪_{w′≤w}C_{w′}`, `X^w`, `Y_w = ∪_{w′≥w}C_{w′}`, `X^w ↪ Y_w` | matches |
| 4.2 type implications | hansen-johansson lines 1040–1046 (Def 4.1, pdf p.27); milne-svi lines 3819–3828 (p.88), 2885–2888 (p.66) | preabelian = adjoint connected datum of a Hodge-type datum; PEL datum "when G is connected" | matches |
| 4.5 PEL type | milne-svi lines 3771–3773 (Prop 8.14, p.87), 3817–3828 (p.88) | Zink's `h`, SV1–4, connectedness required | matches; SV3 imposed here as PELModuli does |
| 4.7 product reflex field | milne-svi lines 4813–4849 (Lemma 12.1, Def 12.2, Remark 12.3, pp.111–112) | reflex field = fixed field of the stabilizer of `c(X)`; 12.3(c) functoriality | matches; compositum argument is Galois theory |
| 5.4 scalar-determinant Hilbert | milne-svi lines 3539–3544 (p.82), 3655–3659 (Prop 8.7(C), p.84), 4066 (p.94) | `G` = preimage of `G_m` under `ν`; case C: connected reductive, `ν` identifies `T` with `G_m` | matches; the p.94 label omits the determinant restriction (source issue) |
| 5.8 Kostant sequences | bp-higherhida lines 1790–1795 (p.34) | `w_i = dim(x⁻¹⟨e_{g+1..2g}⟩ ∩ ⟨e_{g+1..g+i}⟩)` on `C_w` | matches verbatim in meaning |
| 5.16 Cayley basis | cg-siegel lines 365–407 (p.10), 289–300 (p.8), 307–315 (p.9) | `f₁..f₄`, `V^∓` bases, `Lie Q⁻ = k_ℂ ⊕ p⁻`, `h(x+iy)`, `K∞,1` | matches; I recomputed `Jf₁ = −if₁`, `Jf₃ = if₃`, `C·C⁻¹ = I₄` |
| 5.20 products keep the bound | bcgp-abelian lines 10010–10015 (proof of Lemma 7.8.3, printed p.409) | valuation of `1−ζ` ≥ 1/4 vs ≤ 1/(l−1) | matches; README expands the generated-group step |
| 5.21 Iwahori neatness | bcgp-abelian lines 10007–10009 (Lemma 7.8.3), 1983–2002 (Def 3.2.1, pp.201–202) | one place `v`, `K_v = Iw₁(v)`, residue char > 5 ⇒ neat; neat = `∩_l (ℚ̄^× ∩ Γ_{g_l})_tors = 1` with `l` rational primes | README's all-places strengthening is needed (source issue below); README's own statement and proof are correct |
| 1.1, 1.2 | milne-svi lines 1152–1153 (p.26), 1299–1306 (Thm 2.14 proof, p.30), 1360–1370 (Aside, p.31) | rational Hodge structure iff `w_h` over ℚ; MT = smallest subgroup through which `h` factors | matches |
| 1.3 | milne-svh lines 1125–1131 (p.494) | connectedness by replacing with identity component | matches |
| 2.1, 2.2 | milne-svi lines 2441–2453 (Prop 5.9, p.56) | unique complex structure from one faithful representation | matches |
| 3.8 | milne-svi lines 1314–1323 (diagram (26), p.30); conrad-reductive lines 2993–3004 (Thm 2.3.6), 6512–6520, 6551–6556 (Cor 5.2.8–5.2.9, pp.155–156) | `G/P` smooth proper with ample `det(Lie P)*`, `Par_{G/S}` representable | matches |
| 3.13 | bp-higherhida lines 238–240 (p.5) | involution `w ↦ w₀,M w w₀` | matches |
| 3.17 | brion-lakshmibai lines 189–193 (Lemma 1, p.5) | `X^v_w ≠ ∅ iff v ≤ w`, dimension `ℓ(w)−ℓ(v)`, T-fixed points | matches |
| 4.3, 4.4 | milne-svi lines 2731–2748 (p.63), 2749–2771 (Ex 5.24), 2781–2807 (5.25–5.27, p.64) | SV2*, SV4–SV6; `w` over the field fixed by the stabilizer of `I_nc`; `T_a` criterion | matches |
| 4.6 | milne-svh lines 1744 (8.1, p.509), 1867–1905 (8.8–8.9, pp.512–513); milne-shih lines 446–521 (OCR, pp.297–299); milne-svi 2868–2872 (Aside, p.66) | central extension with `N` a product of `Res_{L/k}G_m`, weight killed by `Ĥ⁰ = 0`, SV2* by the smallest subtorus | matches; the sign of `µ₀` is as the README says (source misprint below) |
| 4.8 | lovering-integral lines 1471–1559 (pp.37–40); bp-highercoleman lines 3655–3672 (pp.78–79); deligne-corvallis lines 1592–1598 (2.5.6, p.282) | `r = N∘Res(µ^ab)`, `B = G ×_{G^ab} E*`, `h_E` real/complex place, reflex field `E` | matches |
| 4.9 | bp-highercoleman lines 2291–2295 (p.48), 3716–3735 (Thm 4.4.43), 3804 (p.82) | `Z_s`, Hodge type `Z_s = 1`, `Res_{L/ℚ}GSp` kernel of norm; the Levi fibre product | matches apart from the base (see Source issues) |
| 5.5–5.7 | bp-higherhida lines 1770–1795 | dominance `v(t_{g+1}) ≥ … ≥ v(t_{2g}) ≥ v(t₁) ≥ … ≥ v(t_g)`; `W` as signed permutations | README's positive roots and cyclic order follow from it |
| 5.9–5.11 | cg-siegel lines 274–287 (p.8), 1127–1149 (p.28) | `w̃₁,w̃₂,w̃₃` actions, `w₀` swap, `C₀..C₃`, `λ=(2−b,1−a;−a−b−2c)` | matches |
| 5.14, 5.15 | cg-siegel lines 323–362 (p.9) | `H = ℝ_{>0}H₁`, parity lattice `a+b ≡ c` | matches (kernel misprint below) |
| 5.18 | pilloni-gsp4 lines 856–873 (p.20), 1022–1025 (p.23) | lattice, printed roots and coroots | see R03 |
| 1.5 | masser-zannier lines 85–113 (p.637) | Hodge generic ⇔ MT equals full GSp | matches |
| 2.2 | harris-aa1988 lines 1740–1749 (§1.1, pp.44–45), 2300–2308 (§3.1, p.60) (OCR of the author-page scan) | `K_h`, `g^{0,0} = k_{h,ℂ}`, `p^± = g^{∓1,±1}`, `Lie P_h = k ⊕ p⁻`; compact Cartan and `R_n⁺` on `p⁺` | matches; pages split as R04 says |

**Adversarial table** (each row gives the instance and the values computed on both sides):

| Statement | Instance | Values | Result |
|---|---|---|---|
| Lean `kostantInvolution` | S₃, J={s}, w=1,t,ts | images ts,t,1; lengths 2+0+1, 1+1+1, 0+2+1 = 3 = ℓ(sts); images have no left descent s | holds; with `w` in place of `w⁻¹` the image ts has right descent s: false form excluded |
| same, degenerate | J=∅; J=B; W=1; W infinite | w₀J=1, map w↦ww₀; forces w=1; trivial; `h₀` unsatisfiable | holds/vacuous as expected |
| §1.1 criterion | ℚ(1); elliptic H₁; irrational-line example on ℚ² | w_h = t⁻², t⁻¹; lines ℝ(1,±√2) not Galois-stable | rational iff grading rational |
| §1.2 MT of ℚ(ζ₅), h through one complex place by z/z̄ | X*(T)=ℤ⁴, L={a₁=ā₁} rank 3, σL={a₂=ā₂}, L∩σL rank 2 | dim MT = 4−2 = 2, kernel of both relative norms = norm-one torus of ℚ(ζ₅)/ℚ(√5); K_h = ideal of two conjugate 1-dim subtori | Check correct, `K_h` not a Hopf ideal |
| §1.2 other Checks | trivial action; ℚ(1); ℤ[i] basis (1,i) | I_MT=(X−1); X↦z₁z₂ injective so I_MT=0; X₁₁−X₂₂, X₁₂+X₂₁ killed | correct |
| §1.5 elliptic endomorphisms | α=a+cτ, ατ=b+dτ | cτ²+(a−d)τ−b=0 | ℚ unless τ imaginary quadratic |
| §2.2 compact quotient | GL₂: K^h=ℝ^×SO(2), A_h=ℝ_{>0}; Res_{ℚ(√2)/ℚ}GL₂ | K^h/A_h ≅ SO(2); (ℝ^×SO(2))²/(ℝ_{>0})² ≅ SO(2)²; diagonal line leaves ℝ^× factor | correct, diagonal A∞ insufficient |
| §3.1 weight-3 non-horizontal family | F³=ℂ(e₀+ze₃), Q(e₀,e₃)=i, Q(e₁,e₂)=−i | F¹=(F³)^⊥=⟨e₀+ze₃,e₁,e₂⟩; i³Q(v,v̄)=1−|z|²>0; H^{2,1}=ℂe₁ with iQ(e₁,e₂)=1; dF³(0)=e₃∉F²(0) | polarized, holomorphic, not transversal: Check correct |
| §3.1 weight-one non-effective family | F²=F¹=F⁰=ℂ(e₀+ze₁) | opposed for |z|<1, types (2,−1),(−1,2); derivative e₁∉F¹(0) | not transversal: correct |
| §3.5 monodromy −1 on ℂ^× | section z^{1/2}e | ∇ = d + dz/(2z) | bundle trivial, connection not: correct |
| §3.7 limit convention | μ(t)=diag(1,t), u=[[1,1],[0,1]] | μ(t)⁻¹uμ(t)=[[1,t],[0,1]]→I; μuμ⁻¹ has t⁻¹ | stabilizer is P(μ⁻¹): correct |
| §3.10 ^MW for GL₃, p=2 | w⁻¹ increasing on {1,2} | 3 elements, lengths 0,1,2 = C(3,2), pq=2 | correct |
| §3.11 criterion | A₂, W_M=⟨s₁⟩: s₂⁻¹α₁=α₁+α₂; s₁ϖ₁=ϖ₁−α₁ | ⟨s₁ϖ₁,α₁^∨⟩=−1 | s₂ passes, s₁ fails both sides |
| §3.11 both directions | strictly dominant λ exists (coroots independent) | w⁻¹α<0 ⇒ ⟨wλ,α^∨⟩<0 | iff holds |
| §3.12 cone decomposition | λ=uwλ⁺, u∈W_M, w∈^MW | wλ⁺ M-dominant by §3.11; W_M-conjugate M-dominant weights equal | union holds; A₂ half-space = C∪s₂C∪s₂s₁C with ϖ₁ on the wall |
| §3.12 genus-two chambers | C₀..C₃ of CG | cases b≥0; b<0≤a with a≥−b or a<−b; a<0 | union = {a≥b}, each C_i ⊂ {a≥b} |
| §3.13 A₂ and C₂ | map w↦s₁ww₀ | A₂: 1↔s₂s₁, s₂↦s₂; C₂: 1↔s₂s₁s₂, s₂↔s₂s₁ | lengths reversed |
| §3.14 point counts | A₂ Levi ⟨s₁⟩; Siegel g=2 | 1+q+q²; (1+q)(1+q²) | = #ℙ²(𝔽_q), #Lagrangians in 𝔽_q⁴ |
| §4.3 SV2* for GL₂×GL₂ | centre G_m² mod diagonal weight | quotient G_m split, Int h(i) trivial on it, ℝ^× not compact | product fails SV2*, factors satisfy it |
| §4.3 (G_m,{1}) | w trivial, G/w(G_m)=G_m | twisted form ℝ^× | SV2* fails, SV1–SV6 hold |
| §4.3 Milne 5.24 weight | B/ℚ(√2) split at one place | w=(1,r⁻¹I₂) not Galois-stable | SV4 fails: matches milne-svi line 2770 |
| §4.4 norm-one tori | ℚ(i); ℚ(√2) | T(ℤ)={±1,±i}; N(1+√2)=−1 so T(ℤ)=±(1+√2)^{2n} | discrete / not discrete |
| §4.6 weight adjustment | w=−μ−ιμ, w=(ι+1)μ₀ | −(1+ι)(μ+μ₀)=w−w=0; with μ−μ₀ one gets 2w | README's sign right |
| §4.7 | two stabilizers | fixed field of intersection = compositum | correct |
| §4.8 Lovering B | GL₂, E=ℚ: μ^ab=id, r=id; E=ℚ(i): r=Nm | B=GL₂; B={(g,e): det g=Nm e}, dim 4+2−1=5; (diag(25,1),3+4i): 25=9+16 | Checks correct |
| §4.9 (d) | E totally real / CM | ι trivial, anisotropic part = norm-one torus; coinvariants ℚ[Hom(E⁺,ℝ)] | correct |
| §4.9 centralizer non-descent | τ=i·2^{1/4}, basis (1,τ): τ² = −√2 | centralizer x I + y[[0,−√2],[1,0]]: g₁₂=−√2g₂₁ | √2↦−√2 changes it |
| §5.5 BP roots | compact e_i−e_j (i<j), noncompact −e_i−e_j | ρ_i=½[(g−2i+1)−(g+1)]=−i; ρ_nc,i=−(g+1)/2; simple roots e_i−e_{i+1}, −2e₁ | dominance 0≥k₁≥…≥k_g; g=2: ρ=(−1,−2;0), ρ_nc=(−3/2,−3/2;0) |
| §5.6 cyclic order | g=2, pairs (w⁻¹(3),w⁻¹(4)) | positivity of w⁻¹(e₁−e₂) gives exactly (3,4),(3,1),(4,2),(1,2); numeric order gives (3,4),(1,2),(1,3),(2,4) | README's set correct, BP's printed criterion wrong |
| §5.7–5.8 sequences | S=w⁻¹{3,4} | (3,4)→(0,1,2), (3,1)→(0,1,1), (4,2)→(0,0,1), (1,2)→(0,0,0); L=⟨e₃,e₁⟩∩⟨e₃⟩, ∩⟨e₃,e₄⟩ lines | correct |
| §5.9 pairings | roots·coroots | 2,2,2,2; off-diagonal −1,−2; ρ=½(4,2;−3); conversion ρ↦(2,1;0), roots↦(1,−1;0),(0,2;0),(1,1;0),(2,0;0) | C₂ Cartan matrix, Checks correct |
| §5.10 Weyl actions | s₁ swap; s₂ reflection in (0,2;−1) with coroot (0,1;0) | s₂(a,b;c)=(a,−b;b+c); s₂s₁=(b,−a;a+c); s₂s₁s₂=(−b,−a;a+b+c); w₀=(−a,−b;a+b+c); w⁻¹(1,−1;0) = (1,−1;0),(1,1;−1),(1,1;−1),(1,−1;0) | all positive; s₁ gives (−1,1;0) |
| §5.11 reversal | −w₀,M=(a,b;c)↦(−b,−a;−c) | C₀→C₃, C₁→C₂; −w₀,G=(a,b;−a−b−c) fixes each | correct |
| §5.12 | gᵀJg=νJ, gJ=Jg; D=diag(1,1,−1,−1) | gᵀg=νI; DJD=−J, ν(D)=−1 | correct |
| §5.15 kernel | e^z R(t₁,t₂)=I | R=±I: (2πm,2πn;2πik) or (π+2πm,π+2πn;πi+2πik); (a,b;c) on h(π,π;πi) gives πi(a+b+c) | parity a+b≡c forced |
| §5.16, 5.17 | C=[[I,−iS],[−iS,I]]; k=[[SAS,SB],[−BS,A]] | C·½[[I,iS],[iS,I]]=I; Jf₁=−if₁, Jf₃=if₃; C⁻¹kC=diag(SAS−iSBS, A+iB); for exp h(t₁,t₂;0): diag(e^{−it₁},e^{−it₂},e^{it₂},e^{it₁}); split (a,b;c) ↦ compact (−a,−b;a+b+2c) | all Checks correct |
| §5.18 pairings | α₁=e₂−e₁, α₂=e₃−2e₂, f₂−f₁, −f₂ | 2, 2, −1, −2; ρ=½(−4,−2;−4−2+6)=(−2,−1;0) | correct for the corrected base |
| §5.19–5.21 | u=7+5√2 at (7,√2−3), (7,√2+3) | u≡1, u≡−1 mod 7; N(u)=−1; ζ₅: v(ζ−1)=1/4; ℓ=7: v(8·(−6)−1)=2, v(8/(−6)−1)=1 | bound 1/4 sharp at ℓ=5; single place insufficient |
| §0.1, 0.2 | F=ℚ(√2) | (I₂,diag(1,−1))∈G(ℝ)∖G*(ℝ); diag(√2,1)↦(diag(√2,1),diag(−√2,1)) | Checks correct; compact-open argument via U-normalized V₀ verified |

## Not verifiable

- Jantzen, *Representations of Algebraic Groups* (II.13–14, pp.353–378), cited at §§3.14–3.16: paywalled monograph (DOI 10.1090/surv/107); the service records no legal text. Cited by locator only; the statements (Bruhat cells over ℤ, Schubert schemes flat with reduced fibres over Dedekind rings) are standard and consistent with bp-highercoleman Lemma 3.1.3.
- Milne–Shih, *Conjugates of Shimura varieties*, Prop 3.1, Lemma 3.2, Remark 3.3(a): read from an OCR of an image-only scan (milne-shih lines 446–521, pp.297–299); the statement of Prop 3.1 (central extension with `N` free over `ℤ[Gal(L/k)]`, prescribed derived cover) and Remark 3.3(a) (`N` a product of `Res_{L/k}G_m`) are legible; Lemma 3.2's exact wording is garbled, so the README's presentation details rest on Prop 3.1 and Milne 2013 Prop 8.8.
- Deligne 1979, 2.1.1.1–2.1.1.5 and 2.5.6 were read in the IAS scan (deligne-corvallis lines 830, 1592–1598); the OCR is rough but the construction 2.5.6 (neutral component of the fibre product of two data with the same derived group) is legible on p.282.

## Source issues

- **Error** in bp-higherhida at §3.1, printed p.34 (line 1779): the source says `^MW` is cut out by `w⁻¹Φ^{+,M} ⊆ Φ⁺`, with `Φ^{+,M}` the roots of the unipotent radical (line 1766); it should be `w⁻¹Φ⁺_M ⊆ Φ⁺` with the Levi roots, as in Higher Coleman theory p.31 (for `M = T` the printed condition selects only `w = 1`); affects a stated result.
- **Error** in bp-higherhida at §3.1, printed p.34 (line 1784): the source says `^MW` is the set of `w` with `w⁻¹(g+1) < … < w⁻¹(2g)` in the numeric order; with the stated dominance order (line 1775) it should be increasing for `g+1 ≺ … ≺ 2g ≺ 1 ≺ … ≺ g` (for g = 2 the element with `w⁻¹ = (4,2,3,1)` is minimal but fails the printed test, and `(2,4,1,3)` passes it but is not minimal); affects a stated result.
- **Error** in bcgp-abelian at Lemma 7.8.3, printed p.409 (lines 10007–10015): the source says one absolutely unramified place `v` of residue characteristic > 5 with `K_v = Iw₁(v)` makes `K` neat in the sense of Definition 3.2.1; when that characteristic `ℓ` has a second place `w` of `F`, the element with component `1` at `v` and `−I₄` at every other place lies in `K` and has `−1` in every `Γ_{g_l}`, so it is not neat; it should require `Iw₁` at every place above `ℓ` (or a unique place above `ℓ`); affects a stated result.
- **Error** in milne-svi at §8, printed p.87 (line 3805): the source says SV3 follows from nontriviality of `h` and simplicity of `G^ad`; for a wholly definite unitary PEL datum of rank at least two `h` is nontrivial but central, `X` is a point and SV3 fails; it should impose SV3 (or exclude the definite case); affects a stated result.
- **Error** in milne-svi at §9, printed p.94 (line 4066): the source says the datum of `G = Res_{F/ℚ}B^×` with `B = M₂(F)` is of PEL type; the PEL datum of p.88 is the common-determinant subgroup (similitude in `ℚ`), and the full group fails SV5 for `F ≠ ℚ`, so it is not of Hodge type; it should say the Hilbert PEL datum is attached to the subgroup with rational determinant; affects a stated result.
- **Misprint** in milne-svi at Example 5.25(c), printed p.64 (line 2790): the source says `T(ℤ) = {±(1+√2)ⁿ}` for the norm-one torus of `ℚ(√2)`; `1+√2` has norm `−1`, so it should be `±(1+√2)^{2n}`; affects nothing.
- **Misprint** in milne-svi at §5 Notes, printed p.66 (line 2888): the source says "(2.1.1.5) = SV2"; by its own table two lines above it should be SV2*; affects nothing.
- **Misprint** in milne-svh at Proposition 8.8, proof, printed p.513 (line 1897): the source says to replace `µ` by `µ − µ₀`, where `w = −µ − ιµ = (ι+1)µ₀`; that gives weight `2w`, and it should be `µ + µ₀`; affects nothing.
- **Error** in pilloni-gsp4 at §5.1.1, printed p.20 (lines 864–873): the source says the base is `{e₁−e₂, −2e₂+e₃}` with coroots `{f₁−f₂, f₂}`; `⟨−2e₂+e₃, f₂⟩ = −2` and `−2e₁+e₃ = α₂ − 2α₁` is not a nonnegative combination, so the base and coroots are not those of the printed positive system; it should be `α₁ = e₂−e₁` with coroots `f₂−f₁`, `−f₂` (the choice compatible with the printed duality matrix) or else `α₂ = −2e₁+e₃`; affects a stated result.
- **Error** in cg-siegel at §2.1, PDF p.8 (line 283): the source says the longest element of `W_G` acts by `(a,b;c) ↦ (b,a;c)`; that is the longest element of `W_M` (length 1), while the longest element of `W_G` acts by `(−a,−b;a+b+c)`; affects nothing (Theorem 5.5's proof uses it consistently as the swap).
- **Misprint** in cg-siegel at §2.2, PDF p.9 (line 352): the source says the kernel of `exp: h_ℂ → H_ℂ` is `{t₁,t₂ ∈ 2πℤ, z ∈ 2πiℤ}`; that is the kernel into `ℂ^× × H₁,ℂ`, and the kernel into `H_ℂ` also contains `h(π,π;πi)`, which is what forces the parity lattice stated at line 359; affects nothing.
- **Error** in bp-highercoleman at §4.4, printed p.82 (line 3804): the source says `M^c_{µ_{B₁}} = M^c_{µ_{G₁}} ×_{M^{ab,c}_{µ_{G₁}}} T^c`; no map `T^c → M^{ab,c}_{µ_{G₁}}` is given, and for the genus-two Siegel Levi `M^{ab} = G_m²` while `T` maps only to `G₁^{ab} = G_m`; it should be the fibre product over `(G₁^{ab})^c`; affects nothing (the torsor comparison in Theorem 4.4.43(5) uses the correct product).
