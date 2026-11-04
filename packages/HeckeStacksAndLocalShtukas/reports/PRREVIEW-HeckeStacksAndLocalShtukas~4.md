# Review of HeckeStacksAndLocalShtukas (pull request #1252 at bcb41c1)

**Verdict:** needs changes

## R01 (P2) — The torus excursion witness contradicts the supplier's value for the same functor

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:2366` (HS4.2 Check): “acts on `χ` by the scalar `χ(rec_HS(γ_1γ_2^{-1}))`”; the same value at line 2367 (“`(γ_0,1)∘create_V = χ(rec_HS(γ_0))·create_V`”) and in the Layer HS4 Examples, line 2581.

**Claim:** For `G = G_m`, `V = χ_1`, the composite `annihilate′_V∘(γ_1,γ_2)∘create_V` acts on a smooth character `χ` of `E^×` by `χ(rec_HS(γ_1γ_2⁻¹))`, where `rec_HS` sends an arithmetic Frobenius to `π⁻¹` (line 1744), so a geometric Frobenius to a uniformizer.

**Witness:** HS1.2 (lines 738–739) identifies `T_V` on lisse objects with AutomorphicGaloisRepresentationsPartII AG2.6's `HeckeFunctor`, and both move the degree-`d` stratum to degree `d+1` under the standard character (README line 770; AG2.6 Check “`T_1` carries sheaves on the degree-`d` stratum to the degree-`d+1` stratum”, `roadmaps show` line 2576). For that functor AG2.6 states, in its Check under “The parameter stack and geometric spectral action” (lines 2664–2667): `G = G_m`, `K = ℚ_11`, `ℓ = 5`, unramified `χ` with `χ(11) = 2`, `V = std⊠std^∨`, coevaluation, evaluation and `(γ,1)` with `γ ↦ 11` under its reciprocity (uniformizer to geometric Frobenius, line 239, the same normalisation as `rec_HS`): the raw action from `V ↦ T_V` gives `2⁻¹ = 3`; the stated HS value gives `χ(rec_HS(γ)) = χ(11) = 2`. The direct computation from this roadmap's own conventions gives the supplier's value: by HS1.2 (lines 763, 770) `T_{χ_1}(A)(L,D) = A(L(−D))` and `T_{χ_{−1}}(A)(L,D) = A(L(D))`; the stalk of the character sheaf at `L(±D)` is `Isom(O,L(±D)) ×^{E^×} χ`; the isomorphism `O(D) ≅ O(1)` given by a section `s_D` with divisor `D` scales by `a` when `s_D ↦ a·s_D`, while `I_D ≅ O(−1)`, `f ↦ f/s_D`, scales by `a⁻¹`; with HS2.18's action `γ(s) = s·rec_HS(γ)` (line 1740) transported along the Weil action, leg `1` (weight `1`) contributes `rec_HS(γ_1)⁻¹` and leg `2` (weight `−1`) contributes `rec_HS(γ_2)`, so the scalar is `χ(rec_HS(γ_2γ_1⁻¹))`.

Two roadmaps thus pin the same convention (the Weil action on the descended object `T_V(A)`) by the same witness and get inverse values. The consumer must agree with the owner of the functor or make the disagreement visible; at present it cites the identification and states the opposite number.

**Repair:** Replace the scalar by `χ(rec_HS(γ_2γ_1⁻¹))` at lines 2366 and 2581 and write `(γ_0,1)∘create_V = χ(rec_HS(γ_0))⁻¹·create_V` at line 2367; state in HS1.8/HS1.9 (the descent API) that the `W_E^I`-action on a descended object is transported covariantly along the geometric Weil action on `Spd C`, the direction HS2.18 already uses to define `rec_HS`; add AG2.6's instance as a Check: `E = ℚ_11`, `ℓ = 5`, unramified `χ` with `χ(11) = 2`, `γ` a geometric Frobenius: the raw composite acts by `3`, and AG2.6's normalized action (`V ↦ T_{θ*V}`) by `2`. Tested on that instance: `χ(rec_HS(1·γ⁻¹)) = χ(11⁻¹) = 2⁻¹ = 3`, the supplier's number. If the author instead keeps `2`, the README must say that AG2.6's raw-action Check gives the inverse on this instance (so that the supplier is corrected), rather than citing the identification silently.

## R02 (P3) — Garbled Summary sentence

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:7–8`: “chains on the imported Hecke stack the global Hecke stack, twisted period spaces”.

**Claim:** The sentence lists the reusable objects.

**Witness:** The old identifier was replaced by the phrase “the global Hecke stack” without removing “the imported Hecke stack”; the sentence has two subjects and no verb between them.

**Repair:** “Its reusable objects are the inversion, bounded strata and chains on the imported global Hecke stack, twisted period spaces, general level towers, global solid Satake kernels, and compact-support complexes with commuting group and Weil actions.”

## R03 (P3) — VectorBundlesAndIsocrystals layer labels do not exist at the supplier

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:41` (“`VectorBundlesAndIsocrystals`, VB−1–VB4”), lines 266 and 323 (“VB−1's marked untilt Cartier divisors”), lines 424, 541, 1356, 1735 (“VB3, ‘Positive presentations and general two-term geometry’” and “VB3, ‘Basic section sheaves, Lubin–Tate geometry and projectivization’”), line 1159 (“VB4”), line 1702 (“VB1”).

**Claim:** The supplier has layers labelled VB−1 to VB4 with those contents.

**Witness:** VectorBundlesAndIsocrystals at its open head (`roadmaps show`, #1205) numbers its layers 0 to 6 and uses no “VBk” labels: “## Layer 0: relative coefficient and curve foundations” (line 89) contains “### Marked untilt Cartier divisors and Cartier descent” (line 147), and “## Layer 5: Banach–Colmez spaces” (line 1062) contains both named subsections (lines 1064 and 1179). AG2.6 (#1006, line 226) carries the same stale “VB−1”, so the drift is inherited from an older supplier head.

**Repair:** Cite “VectorBundlesAndIsocrystals, Layer 0, ‘Marked untilt Cartier divisors and Cartier descent’” for the divisor base, “Layer 5, ‘…’” for the two Banach–Colmez subsections, “Layers 0–4” for the range at line 41, “Layer 4, ‘Geometric classification of vector bundles’” for the lattice-extension input of HS2.3, and name the subsection meant at line 1702 (or drop the citation if HS2.17 uses none). The named subsections resolve by title, so no contract changes.

## R04 (P3) — Proper noun lower-cased in the title

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1`: “# Roadmap: hecke stacks and local shtuka cohomology”.

**Claim:** House style lower-cases the title.

**Witness:** Main keeps proper nouns capitalised inside lower-case titles: “# Roadmap: Fuchsian groups and orbifold Riemann surfaces”, “# Roadmap: Belyi maps, dessins d'enfants, and three-point covers”, “# Roadmap: Combinatorial Heegaard Floer and grid homology”.

**Repair:** “# Roadmap: Hecke stacks and local shtuka cohomology”.

## Verified sound

**Gate, build, dependency check.** The worker's gate at this head passes every check. `lake env lean` on `TauCetiRoadmap/HeckeStacksAndLocalShtukas/Suggested.lean` exited 0 with no output; the file declares nothing, so the signature probe (`#check @name`) and the one-tactic padding probe have no declaration to run on, and no scratch copy was elaborated. The diff outside the roadmap folder against `origin/main` is empty. The movable dependency check returned exactly

```text
depcheck: 205 roadmaps, 1664 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The merge order places the roadmap at line 173, after BunGAndNewtonStrata (171) and IgusaVarietiesAndTorsionConcentrationPartII (172); every cited supplier is on main (EnhancedDerivedSheaves, ClassFieldTheory, ReductiveGroups, ReductiveGroupsPartII, AdicEtaleGeometry, AdicSpacesPartII) or earlier in the order (lines 15–171); AdmissiblePairsAndPadicHodgeStructures (line 235) is cited only as a consumer. No supplier gap is declared and none is needed: every cited section exists where it is cited (table below).

**Repair status of the r3 findings.**

| r3 finding | Status at bcb41c1 |
| --- | --- |
| R01 obsolete BunG contracts | Repaired. Lines 41–43, 214 and 1607–1610 cite VStackSheavesAndLisseCategories §VS4.0 with its four paragraph labels, which exist at #1230 (lines 1084–1125: “The stack of bundles”, “Newton geometry”, “Full stratum automorphisms”, “Filtered charts and contraction”); BunG is cited only for §§0.7, 1.19, 2.8, 2.11–2.23, 3.10–3.11, 3.18, 4.7, all present at #1241 (lines 159, 654, 1146, 1192–1387, 1480, 1492, 1524, 1549). No “3.3–3.5”, “3.9”, “3.16–3.17” or “4.1–4.7” remains. The `O(1)⊕O` test is the HS2.15 Check (lines 1616–1624): kernel dimension 1, stratum dimension −1, lower-left block `H⁰(O(−1)) = 0`, agreeing with VS4.0's own check and BunG §3.11's remark. |
| R02 nonexistent LP3.0 | Repaired. Lines 32–37, 218 and 642 cite LP §4.1 (“Highest-weight modules and good filtrations”, #1202 line 919, stated over a field with ReductiveGroups §10B), LP §§6.2–6.3 (lines 1294, 1304, with `ℓ ∤ |π₁(Ĥ)_tors|` over `ℤ_ℓ` and `𝔽̄_ℓ` and no condition in characteristic zero, exactly as the Scope says) and GS §§4.24–4.25 (#1235 lines 2226, 2242, all-prime, with the `PGL₂`, `ℓ = 2` check). The HS1.0 Check at line 630 records the `PGL₂`, `ℓ = 2` separation. |
| R03 rebuilt constructions | Repaired. HS4.1 is now a compatibility statement between AG2.6's descended family and the condensed enrichment of HS1.8 (lines 2254–2289); HS1.1 pulls GS §4.25's local solid functor back along the completion map (line 648); HS1.6 uses VS5.3's criterion (line 879; #1230 lines 1390–1398 “ULA for lisse `Bun_G` sheaves”, “Lisse ULA and perfect invariants”); HS1.4, HS1.5, HS1.7, HS1.9, HS2.9, HS2.10, HS3.4, HS3.5 and HS3.8 each name what AG2.6 owns and keep only the extension. |
| R04 prospective API names | Repaired. Lines 72–80 no longer authorise prospective declarations; `HckI.swap` and `GeneralShtukaTower.transition` are gone; the remaining backticked names are mathematical notation or pinned library and supplier names (every dotted name at lines 169–204, 746, 799, 871, 2293–2315, 2339 resolves at the pins, see below). `readme-ids-missing = 0`. |
| R05 GLX identity | Repaired. The reference (lines 2616–2622) is arXiv:2208.07195v3 with two-level numbers; I fetched it through the sources service (cache `d2249ddb…`) and checked every GLX locator: Theorem 3.11 and Proposition 3.12 on p. 24 (lines 973, 977), §3.5 p. 24 (line 960), §3.6 and Definition 3.14 p. 25 (lines 1008, 1023), Lemma 3.2 p. 16, Lemma 3.6 and (3.6) pp. 20–21, (3.7) p. 21, Theorem 3.9 p. 22, Theorem 6.1 p. 41 (line 1750), Proposition 6.4 p. 44, Proposition 6.6 pp. 45–46 (line 1920), Proposition 6.7 p. 46, footnote 8 p. 8 (line 337, the Tate-module torsor). The version-of-record pages stay uncertified as the README says. |

**Seeded sample.**

- *BunGAndNewtonStrata* (#1241): §0.7 pure inner twisting of torsors (line 159), §1.19 basic inner form equivalence `Bun_G ≃ Bun_{J_b}` for basic `b` (line 654), §2.8 geometrically trivial open locus `[*/G(E)] ≃ Bun_G^1` (line 1146), §2.18 Kottwitz sign with the checks “`ξB_dR⁺` has GS component 1, bundle `O(−1)`, Kottwitz invariant 1” (lines 1285–1300), §2.21 modification bound `b ∈ B(G,{μ})` for a geometric point of `Gr_{G,μ}` modifying the trivial bundle (line 1351), §2.22 minuscule image surjective onto `B(G,{μ})` (line 1369), §3.10 reduction of full automorphism torsors (line 1480), §3.11 `ℓ`-dimension `−⟨2ρ,ν_b⟩` with the `O⊕O(1)` remark (line 1492), §3.18 components, §4.7 chart image `{b′ : κ(b′) = κ(b), ν_{b′} ≤ ν_b}` (line 1549). The README's contract at line 213 (modifying the trivial target by `μ(ξ)` gives `κ = +μ♯`, image in `B(G,μ)`, equality for minuscule `μ`) is exactly §§2.18, 2.21, 2.22.
- *VStackSheavesAndLisseCategories* (#1230): VS4.0 as above, VS4.4 “Compact generation of `Bun_G` coefficients” (line 1271), VS5.3 “Lisse `Bun_G` Künneth formula” (line 1382) and the two ULA paragraphs, VS0.2 enhanced smooth descent (line 131), VS2/VS3/VS5 layers (lines 957, 1287).
- *AutomorphicGaloisRepresentationsPartII* AG2.6 (#1006): the four sections at lines 2469, 2502, 2599, 2678 and the nine names `HeckeModification`, `HeckeFunctor`, `T_{μ,C}`, `geometricSpectralAction`, `excursionOperator`, `semisimpleParameter`, `localShimuraTower`, `localShimuraCohomology`, `localShimuraHeckeRealization`. Orientation agrees with this README: AG2.6 fixes `E_{π⁻¹} = O(1)`, admissible classes `B(G,μ⁻¹)` with `κ(b) = −μ♯`, `T_1` moving degree `d` to `d+1`, kernel `Λ[−d](−d/2)` on a minuscule fibre of dimension `d`, realization `RΓ_c ≅ i_b* T_μ(j₁! c-Ind)` up to the shift fixed by `d_μ = ⟨2ρ,μ⟩`, and the adjoint formula through `i₁* T_{μ^∨}(R i_{b*}ρ)`; all match HS2.9, HS3.4 and HS3.8. AG2.6 also records that FS §IX.3 labels the same space by `B(G,μ)`, which the README's Conventions handle by the `λ = μ⁻¹` dictionary. The only disagreement is the excursion witness of R01.
- *Integral tensor generator*: FS, proof of Proposition IX.5.1, printed p. 328 (FS lines 12698–12703): the argument uses only that a `⊗`-generator `V` exists and reduces `P`-triviality to one leg through exterior products; the README's integral, all-`Λ`, arbitrary-`Q` generator with bounded-weight resolutions is stated as its own target (lines 589–605), correctly, and FS lines 12527–12529 (Corollary IX.2.3) confirm the “possibly infinite resolution involving finitely many weights” that HS1.0 distinguishes from the thick generation for `Ĝ^I`.
- *Solid-dual Demazure generation*: FS, proof of Proposition IX.2.1, p. 322 (lines 12488–12495): the ULA objects are generated under colimits by `Rf_{ẇ*}ℤ_ℓ` for Demazure resolutions, and Proposition VII.4.3 (line 10222–10225, `(Rf_*A)^∨ ≅ f_♮A^∨` for `f` proper, representable in spatial diamonds, finite `dim.trg`) transports to the duals. The README makes the generation after duality its own target (lines 690–704) and says duality alone does not transfer colimit generation, which is right: `A ↦ A^∨` is contravariant and exchanges Ind with Pro (FS line 10218).

**Resolved supplier citations** (every `*Needs:*` line and the contract table were read; copies: main at 929496d for the six main suppliers, `roadmaps show` heads for the rest).

| Citation | Where it resolves |
| --- | --- |
| GeometricSatakeAndFusion GS0 “Loop quotients and ordered divisors”, “Generic bounds and integral affine flags”, “Open cells, action truncation and minuscule flags”; GS2 “Proper correspondences and rational semismallness”; GS4 “Integral identification, normalization and functoriality”, §4.22 “Weil restriction naturality”, §4.24, §4.25 “Perfect-complex Satake extension” | #1235 lines 230, 348, 491, 1450, 1970, 2191, 2226, 2242. §4.25 fixes “a finite quotient `Q` of `W_E` through which the pinned action factors”, as HS1.0 requires. |
| SmoothRepresentationsOfLocalGroups SR.0d.1–SR.0d.2, SR.1, SR.2, SR.3, SR.6.1–SR.6.3 | #1688 lines 1632, 1694, 1012, 1865, 2518, 4865–5027. |
| ReductiveGroupsPartII RG2.0.4; ReductiveGroups Layer 9, §10B | main lines 852; 1092, 1759. |
| ClassFieldTheory Layer 9: `WeilGroup`, `weilTransfer`, `index_range_weilTransfer`, `weilDegree`, `surjective_weilDegree`, `localWeilArtinEquiv` (finite extensions of `ℚ_p` only) | main lines 1505–1540, 557–559. `weilDegree` agrees with the arithmetic `unramifiedCoordinate` (line 1533), so the README's `deg_ar` with arithmetic Frobenius of degree 1 is the supplier's convention. |
| EnhancedDerivedSheaves E5:abstract, E5:presentability | main lines 1436, 1593. |
| AdicEtaleGeometry A2; AdicSpacesPartII R0 | main lines 6592; 514. |
| PadicHodgeTheory §§0.1, 3.2–3.5, 7.1 | #1062 lines 121, 666–733, 1226. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.2.20, R07.3.3, R07.4.13 | #879 lines 577, 3061, 3699, 4706, 6021. |
| ClassicalAdicEtaleCohomology §§8.1–8.6, 9.4–9.7; DiamondSixOperations S0–S5; AdicCoefficientsAndComparisons L0 | #875 lines 3905–4438, 4849–5153; #927 lines 116–935; #965 line 500. |
| EndoscopicTransferAndUnitaryTraceComparison §§12.1–12.8, 12.17; IgusaVarietiesAndTorsionConcentration §§0.11, 0.27; AInfCohomology AI.2 | #999 lines 4536–4724, 4927; #1090 lines 365, 612; #1044 line 1548. |
| RelativeFarguesFontaine Layers 0–7, §§0.18–0.20, 1.1–1.3, 3.1–3.9, 4.6–4.13, 7.0–7.7 | #1209 lines 286–2769 (0.18, 0.20, 1.1, 1.3, 3.1, 3.9, 4.6, 4.13, 7.0, 7.7 all present). |
| DiamondsAndVStacks D3–D6 | #820 lines 4543, 5761, 6850, 8642. |
| VectorBundlesAndIsocrystals | Layers 0–6 only; see R03. |
| Mathlib `FGModuleCat.exactPairing`; Tau Ceti `CategoryTheory.Functor.mapExactPairing`, `…_evaluation`, `…_coevaluation` | `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:255`; `TauCeti/CategoryTheory/Monoidal/Rigid/Functor.lean:75, 99, 106`. |

**Pinned library evidence** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`, the manifest's pins): `TauCeti.IsProP` at `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`; `TauCeti.IsSmoothDiscrete` (structure) at `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272` and `TauCeti.SmoothDiscreteTopRep` at line 618; `TauCeti.ReductiveAffineGroupSchemeCat` in `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean` over a field; `WittVector.Isocrystal` at `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`; no file of Tau Ceti mentions `WeilGroup`, no reductive group scheme over a ring exists (the only “Chevalley” files are Lie-algebra Serre presentations), and `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine` holds `Y`, `Quotient` and `Window` only. So the module docstring's statement that none of the six headline groups is statable is correct: no `Bun_G`, no towers, no Weil group, no integral dual group, no enhanced smooth category at the pins. The `roadmaps resolve` lead `dim.trg` (line 215) is Fargues–Scholze's notation for the transcendence-degree dimension, not a Lean name.

**Ownership against open pull requests.** `roadmaps grep` for twisted Grassmannians and local shtuka spaces hits only this roadmap (38 matches), EndoscopicTransferAndUnitaryTraceComparison (3, its Lubin–Tate and Drinfeld towers, which HS imports), GlobalShtukasAndFunctionFieldLanglands, IgusaVarietiesAndTorsionConcentration and EtaleDualityAndPerverseSheaves (one incidental mention each). No other open pull request builds the general-field, arbitrary-bound tower or the global solid operator. HeckeStacksAndLocalShtukasPartII sits later in the order (line 192) and is a consumer.

**Adversarial table.** Each row gives the instance and the values computed on each side.

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| Conventions: slope and Kottwitz sign | `G_m`, `b = π` | `E_b = O(−1)`, `c_1 = −1`, `κ = v_π(π) = 1`; BunG §2.18 check: `ξB_dR⁺ ↦ O(−1)`, `κ = 1` | agree |
| Conventions: type and `κ(E_1) = κ(E_2) + μ♯` | `E_1 = L(−D) ↪ E_2 = L` | type 1; `deg E_1 = deg E_2 − 1` so `κ(E_1) = κ(E_2) + 1` | agree |
| Nonemptiness `[b] ∈ B(G,μ⁻¹)` | `G_m`, `μ = 1` | `κ(b) = −1 ⇒ b = π⁻¹`, `E_b = O(1)`, `O ⇢ O(1)` of type 1 nonempty; `b = π` empty; SW Definition 24.1.1 (line 8592) `b ∈ B(G,μ⁻¹)`, `κ(b) = −μ♮`; AG2.6 the same | agree |
| HS0.1 torus | `I = ∅`, geometric point | classes `ℤ`, automorphisms `E^×`; one leg: classes `ℤ²`, diagonal `E^×` | agree |
| HS0.2 `GL₂` fibres | `≤(1,0)`; `≤(2,0)` | `ℙ¹(C♯)`; cell `(2,0)` plus the point `ξÊ_2` of position `(1,1)`; `Ê_2` excluded | agree |
| HS0.2 nonsplit torus bounds | `Res_{F|E}G_m`, `{(1,0)}`; collision `D′_2 = γD′_1` | not `Γ`-stable; position `(1,1) = μ_1 + γμ_2 ≠ (2,0)` (for a torus `≤` is equality) | agree |
| HS0.4 chains | `G_m`, coincident legs, total `n` | fibre `{(a,b): a+b = n}` infinite; disjoint legs: `c` bijective | agree |
| HS0.4 `GL₂` flags | `Λ_0 ⊂ Λ_1 ⊂ Ê_2` | fibre over `ξÊ_2` is `ℙ¹`, over a cyclic quotient one point | agree |
| HS0.5 twisted Grassmannian | `G_m`, `m = 2`, `b = 1`, `S♯_2 = φ⁻¹S♯_1` | order along `S♯_2`: `a` (from `n = 1`) `+ c` (from `n = 0`); position relative to `Frob^*P_η`: `c` | agree |
| HS0.5 no legs | `m = 0` | one point `(G × Y, b × Frob, id)` | agree |
| HS0.6 inner forms | `GL₂`, slope `1/2` | `J_b = D^×`, `H¹(E,GL₂) = 1`, so not pure inner; FS Example III.4.4 p. 101 | agree |
| HS1.0 torsion in `π₁` | `Ĝ = PGL₂`, `ℓ = 2` | `|π₁(PGL₂)_tors| = 2`; LP §6.2 excluded, GS §4.24 included (its own `PGL₂`, `ℓ = 2` check) | agree |
| HS1.0 non-solvable `Q` | `Q = A₅` | every finite quotient of `W_E` is (p-group)-by-cyclic-by-cyclic, solvable; `A₅` has order 60 and is simple | agree |
| HS1.0 generator | `Ĝ = G_m`, `U = χ_1 ⊕ χ_{−1}` | powers of `χ_1` alone give weights `n ≥ 0` only | agree |
| HS1.1 minuscule kernel | `PGL₂`, `d = 1` | `𝔻(i_*Λ[1](1/2)) = i_*Λ[2](1)[−1](−1/2) = S_V`; `(i_*S_V)^∨ = i_♮Λ[−1](−1/2)` by FS VII.4.3 | agree |
| HS1.1 torus convolution | `V_n ⋆ V_m` | `L_1 = L_2(−nD)`, `L_2 = L_3(−mD)` so `L_1 = L_3(−(n+m)D)` | agree |
| HS1.2 torus direction | `T_{V_n}`, degree `d` | target degree `d+n`, Kottwitz `a ↦ a−n`; AG2.6 `T_1`: `d ↦ d+1` | agree |
| HS1.2 empty legs | `I = ∅`, `M` projective | `T_M(A) = A ⊗ M`, `T_Λ = id` | agree |
| HS1.2 minuscule shift | `PGL₂` | `h_♮ = Rh_!(− ⊗ h^!Λ)`, `h^!Λ = Λ[2](1)`: `h_♮g^*A[−1](−1/2) = Rh_*g^*A[1](1/2)`; FS VII.5.2 line 10293 with `A = Λ` | agree |
| HS1.3 order of composition | `f(x,y) = (x+y,y)`, `g(x,y) = (x,y+x)` | `g(f(1,0)) = (1,1)`; `f(g(1,0)) = (2,1)` | agree |
| HS1.3 diagonal kernel | `ℚ_3`, `𝔽_2`, `X = (ℙ¹_C)^♦` | `Δ_♮Λ ≅ (Δ_*Λ)^∨` (FS VII.4.3, `Δ` proper of `dim.trg` 0), in degree 0 (VII.4.1 t-exact, line 10182); `Δ^*Δ_♮Λ = Λ` by base change; `Rπ_{1*}(Δ_*Λ)^∨ = (π_{1♮}Δ_*Λ)^∨ = (Λ[2](1))^∨ = Λ[−2](−1)` | agree |
| HS1.3 fused stalk | `GL₂`, two `(1,0)` steps over `ξ(B⁺_dR)²` | `RΓ(ℙ¹,Λ)[2](1)`: ranks 1 in degrees `−2` and `0` | agree |
| HS1.5 both adjoints | labels `V ↦ θ*V` | `θ*` commutes with `V ↦ V^∨`; adjunction is label-invariant | agree |
| HS1.6 ULA criterion | `G = 1`, `𝔽_ℓ` | `Λ²` perfect; `⊕_{n≥0}Λ` has infinite-dimensional invariants, not perfect (VS5.3's own check) | agree |
| HS1.7 duality formula | `sw^* = θ∘Ad(ρ̂(−1))` (FS VI.12.1 line 9295) | `θ(ρ̂(−1)) = ρ̂(−1)`, so `θ*sw^*θ* = sw^*`; FS IX.2.2 (line 12500) reads the same in both labellings | agree |
| HS1.8 condensed Hom | `G = 1`, `S` infinite | `C(S,ℤ_ℓ)` contains the identity of `S = ℤ_ℓ`, not locally constant | agree |
| HS1.8 Hecke algebra | `K` pro-`p` | `c-Ind_KΛ` projective; `End = Λ[K\G/K]` in degree 0 | agree |
| HS1.8 Kummer object | tame `ℓ`-adic inertia | unipotent of infinite order; `ℓ`-adically continuous; no open subgroup acts trivially | agree |
| HS2.1 one leg | `G_m`, `d = 1` | `b = p⁻¹` nonempty, `b = p` empty | agree |
| HS2.1 height two | `b = [[0,1],[p⁻¹,0]]` | `det = −p⁻¹`, `κ = −1`, slope `−1/2`, `E_b = O(1/2)`; `∐_ℤ D̊` (SW 24.2.5 p. 227) | agree |
| HS2.2 full automorphisms | `O ⊕ O(1)` | `(a,d,u)`, `u ∈ H⁰(O(1))`; lower-left `H⁰(O(−1)) = 0`; VS4.0 ordered `O(1)⊕O` has the block upper-right | agree |
| HS2.3 Kottwitz obstruction | norm-one torus | `B(T) = ℤ/2`, `(X_*⊗ℚ)^Γ = 0` so `ν ≡ 0`, `κ ≠ 0`, `S^a = ∅` | agree |
| HS2.3 Iwahori | `GL₂` | degree `p+1` | agree |
| HS2.6, HS2.10 degrees | `K_n = 1+pⁿℤ_p`; `ker(GL₂(ℤ_p)→GL₂(𝔽_p))`; `1+p^mM_2` | `(p−1)p^{n−1}`; `(p²−1)(p²−p)`; `p^{4(m−1)}(p²−1)(p²−p)` | agree |
| HS2.10 non-minuscule | `GL₂`, `(2,0)` | `dim Gr = 2 > 1 = dim ℙ¹`, fibres `𝔸¹` | agree |
| HS2.11 boundary point | `GL₂`, `(2,0)`, `b = p⁻¹·1` | `κ = −2 = −μ♯`; at `ξÊ_2`: `E_1 = O(1)²(−D) = O²`; torsor of bases of `ℚ_p(1)²`; type `(1,1)` | agree |
| HS2.12 equal characteristic | `Λ_a = L[[ξ]]ξ²e₁ + L[[ξ]](e₂+aξe₁)` | quotient cyclic of length 2; all images mod `ξ` equal `Le₂`; `M_a⁻¹M_b` has entry `(b−a)/ξ`, non-integral | agree |
| HS2.15 chart dimensions | `O(1)⊕O` | kernel `BC(O(1))`, dimension 1; stratum `−⟨2ρ,ν_b⟩ = −1` (BunG §3.11) | agree |
| HS2.16 lemma | profinite `K`, component-separated `A` | `π_0(A)` totally separated; two compact orbits separated by a clopen `W`; `{x : K·x ⊂ W}` clopen by the tube lemma and closed projection; its preimage disconnects `A/K` | agree |
| HS2.16 non-example | `ℤ` on `ℤ_p × Spa C` | quotient connected (dense orbits); uncountably many components, countable group | agree |
| HS2.18 reciprocity | arithmetic Frobenius; `Art_ar(u)` | `v_π = −1`, image `π⁻¹`; `rec_HS(Art_ar(u)) = u⁻¹ = χ_LT(Art_ar(u))`; `ℚ_7`, order-3 value `ζ`: `ζ⁻¹ ≠ ζ`; CFT `weilDegree` arithmetic; AG2's reciprocity the same map | agree |
| HS3.2 Lubin–Tate | height 2, `K = GL₂(ℤ_p)` | `RΓ_c = ⊕_ℤℤ_ℓ(−1)[−2]`; `f_♮ℤ_ℓ = RΓ_c[2](1) = ⊕ℤ_ℓ`; fibre of `C_K` is `⊕Λ(−1/2)[−1] = c-Ind_{O_D^×}^{D^×}` | agree |
| HS3.2 completion order | `G_m` | `⊕_ℤΛ`; completing after the sum adds `Σ ℓⁿδ_n`; inverting `ℓ` before the limit gives 0 | agree |
| HS3.5, HS3.6 non-pro-`p` level | `ℤ_p^×`, `ℓ ∣ p−1` | `H^{2k}(𝔽_p^×,ℤ_ℓ) = ℤ_ℓ/(p−1) ≠ 0`: `c-Ind_{ℤ_p^×}ℤ_ℓ` not compact; FS IX.3.2 as printed (lines 12614, 12640) omits pro-`p` | agree (source issue below) |
| HS3.9 shift | `GL_n`, `(1^d,0^{n−d})` | `⟨2ρ,μ⟩ = d(n−d)`; `RΓ_c = C_K[−δ](−δ/2)` fibre | agree |
| HS3.10 torus class | `n = 1`, `E_{b′} = O(−1)` | `κ(b) = 1 − 1 = 0`; FS IX.7.4 (line 13141): `T_std` from `O(−1/n) ⊂ E = Oⁿ` | agree |
| HS3.10 non-pro-`p` Ext | `ℤ_p^×`, `𝔽_ℓ`, `ℓ ∣ p−1` | `H^n(𝔽_p^×,𝔽_ℓ) = 𝔽_ℓ` for all `n` | agree |
| HS4.2 rank | `GL_n` std; `FGModuleCat ℚ`, `ℚ²` | `n`; `2` | agree |
| HS4.2 excursion scalar | `G_m`, `χ_1 ⊠ χ_{−1}`, `(γ_1,γ_2)` | README `χ(rec_HS(γ_1γ_2⁻¹))`; AG2.6 raw action on `χ(11) = 2`, `(γ,1)`: `3`; direct computation `χ(rec_HS(γ_2γ_1⁻¹))`, i.e. `3` | **R01** |
| HS4.5 ranks | `[E′:E] = 2`, `G′ = 1`, `I = {1,2}` | legwise induction then diagonal: `4 = 2 + 2`; induction after fusion: `2`; totally ramified `e > 1`: `r′ = r` | agree |
| HS4.6 degrees | `GL₂` Borels; `GL₃` nested | `⟨(1,0),(1,−1)⟩ = 1`, lower Borel `−1`; `GL₃`: `a+b−2c`, `a−b`, sum `2a−2c = ⟨λ,(2,0,−2)⟩` | agree |
| HS4.7 wild triviality | `P^I` on `T_V`, `T_W` | `P^{I⊔I}` trivial on `T_{V⊠W}`, diagonal `P^I` on `T_{V⊗W}` (FS lines 12698–12701) | agree |

**Source locators checked** (printed pages; FS and SW from the author-hosted texts in the cache, offsets as the References state). FS: VII.3.1 p. 257, VII.3.5 p. 260, VII.4.1 p. 262, VII.4.2–VII.4.3 p. 263, VII.5.2 p. 265, VII.7.2 p. 272, VII.7.3–VII.7.4 p. 273, VII.7.6 p. 274, VII.7.8–VII.7.9 p. 275, VII.7.10 p. 276, VI.1.7 p. 193, VI.2.2 p. 197, VI.2.6 p. 200, VI.2.7 p. 201, VI.7.13 p. 223, VI.8.4 p. 226, VI.9.4 pp. 228–229, VI.11.1 p. 235, VI.12.1 p. 239, II.1.21 p. 56, II.2.3 pp. 60–61, II.2.4 p. 61, III.3.6 pp. 99–100, III.4.2–III.4.4 pp. 100–102, IV.7 p. 164, IV.7.3 p. 165, V.7.1 p. 183, VIII.4.2 p. 291, IX.1.1–IX.1.2 p. 320, IX.2 pp. 321–323, IX.2.1–IX.2.4 pp. 322–323, IX.3 and IX.3.1 pp. 324–325, IX.3.2 pp. 326–327, IX.5.1 p. 328, IX.6.1–IX.6.3 pp. 330–332, IX.6.4–IX.6.5 p. 333, IX.7.1 p. 334, IX.7.2 pp. 335–337, IX.7.3 pp. 337–338, IX.7.4 p. 338. SW: 10.4.2 p. 81, 11.1.2 pp. 90–91, 19.1.4 p. 171, 19.2.1 p. 172, 19.4.2 pp. 176–177, 19.5.3 p. 180, 20.1.4 p. 183, 20.4.2 and 20.4.4 p. 187, 20.4.5 pp. 187–188, 22.3.3 p. 209, 22.5.2 p. 212, 22.6.1 p. 213, 22.6.2 p. 214, 23.1.1 pp. 216–217, 23.1.4 and 23.2.1 p. 217, 23.3.1 p. 218, 23.3.2 p. 219, 23.3.3 p. 220, 23.4.1–23.4.3 pp. 221–222, 23.5.1–23.5.2 p. 223, 23.5.3 p. 224, 24.1.1–24.1.2 p. 225, 24.1.3 p. 226, 24.2.5 p. 227, 24.3.5 p. 231. GL: Theorem 1.1 p. 3, Theorem 2.13 p. 8, Proposition 2.15 p. 9, Theorems 3.1–3.2 p. 10, Lemma 3.3 p. 12 (fibres of (3.7) are unipotent-automorphism torsors or empty). HK: Definition 7.2.2 p. 41, Theorem 7.2.3 p. 42, Propositions 7.3.3–7.3.4 p. 43. RV: Proposition 3.1 p. 11. DHKM: Theorems 1.1–1.2 p. 1, Corollary 1.4 p. 2, Lemma 3.1 p. 9, Remark 3.6 p. 11. HHS: footnote on torsion coefficients p. 2 (line 80), Theorem 1.3.1 p. 6, Theorem 7.1.4 p. 60. HI: Proposition 1.1 = 3.18 p. 2 and p. 22, Proposition 4.1 p. 24, Propositions 4.4–4.5 p. 25, Lemma 4.7 p. 26. Stacks: Tag 0906 (line 2117, `π_0` of a spectral space is profinite). GLX: as listed under R05 above.

**Shape.** Five layers in build order, each with Examples and Dependencies; definitions carry API lists and at least three discriminating Checks; every target carries a locator and a `*Needs:*` line; no process words, pull-request numbers, LaTeX delimiters or anchors; cross-roadmap citations by name and section. The README and the (empty) Lean file agree: no backticked name of this roadmap's own is claimed as a declaration.

## Not verifiable

- The GLX version of record (Inventiones 243, pp. 805–861) remains uncertified, as the README says; every GLX locator was checked against arXiv:2208.07195v3, which the sources service fetched from arXiv and recorded under the key `GLX` in `packages/HeckeStacksAndLocalShtukas/sources.toml` (the brief's fetch command records entries; no other manifest change was made).
- Which sign Fargues–Scholze themselves intend for the torus excursion of Proposition IX.6.5 cannot be read off the text: the proof (line 12929–12931) says only that it is “an easy consequence of Section II.2.1”, and p. 61 identifies the torsor map with “the usual Artin reciprocity map” without fixing a normalisation. R01 is therefore stated as a disagreement between this roadmap and its supplier on the same functor, settled by direct computation from this roadmap's own conventions, not by an FS locator.
- The general-coefficient compactness of HS3.8 (`X(ρ)` for arbitrary `Λ`) and the arbitrary-bound integral assertions of HS1.0 are proof obligations of the roadmap; the sources give the route, not a statement with these quantifiers. The instances above test them, they do not prove them.

## Source issues

- **Error** in FS at Proposition IX.3.2, printed p. 326: the source says the restriction of `f_{K♮}S′_W` to `D(G_b(E),Λ)` is compact for every compact open `K`; it should require `K` pro-`p` (as Theorem IX.3.1 does); affects a stated result. For `E = ℚ_3`, `G = G_m`, zero bound, `K = ℤ_3^×`, `Λ = 𝔽_2`, the object is `c-Ind_{ℤ_3^×}^{ℚ_3^×}𝔽_2`, with `H^n(𝔽_3^×,𝔽_2) ≠ 0` for all `n`. HS3.6 already restricts to pro-`p` levels.
- **Error** in GL at the display after Theorem 2.13, §2.3, printed p. 8: the source says the pairing `⟨2ρ_L − 2ρ_M, ν_b⟩` is unchanged when `ν_b` is replaced by the `L`-average `ν_{a_L(b)}`; it should keep `ν_b`, since the `W_L`-average of `2ρ_L` is zero; affects a stated result. For `L = GL₂`, `M = T`, `ν_b = (1,0)`: left side `1`, right side `⟨(1,−1),(1/2,1/2)⟩ = 0`.
- **Misprint** in FS at Proposition VII.7.10, printed p. 276 (line 10698–10699): the source says the exterior product of compact lisse objects lies in `D_ét(Bun_G,Λ)`; it should say `D_lis(Bun_G,Λ)`, the category of the statement; affects nothing. HS4.4 already reads it that way.
