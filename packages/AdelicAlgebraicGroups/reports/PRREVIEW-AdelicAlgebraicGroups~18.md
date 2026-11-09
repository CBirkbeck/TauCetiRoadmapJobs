# Review of AdelicAlgebraicGroups (pull request #792 at 2486445)

**Verdict:** needs changes

Line numbers refer to `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` and `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` at `2486445`. Mathlib paths are relative to the pinned Mathlib (`1b1ccf4`), Tau Ceti paths to the pinned Tau Ceti (`2fd255d`), and other roadmaps' paths to the content repository's main branch unless a pull-request head is named.

The gate passes, and all three findings of r17 (at `8175963`) are repaired; details under Previous findings. There are two new findings, both P3:
- one AA.4.1 target cites a supplier's section and `Suggested.lean` for declarations that are in another section and only in its README;
- one AA.4.7 target lists an unrelated layer on its *Needs:* line.

## Previous findings (r17 at `8175963`)

- **R01 (P3), homogeneous quotient topology restated Mathlib and cited Arthur §1.** Repaired.
  - `:308` adds the supplier row *Homogeneous quotient topology*. It cites `t2Space_quotient_mulAction_of_properSMul`, `IsOpenQuotientMap.locallyCompactSpace`, `MulAction.isOpenQuotientMap_quotientMk`, `isOpenMap_quotient_mk'_mul` and `ContinuousConstSMul.secondCountableTopology`.
  - `:1822–1833` now reads "Compact sets lift to a closed homogeneous quotient … This is this roadmap's deduction". The Arthur locator is gone.
  - All cited declarations are at the pin. Two of them are instances: `Topology/Algebra/ProperAction/Basic.lean:113` and the closed-subgroup `ProperSMul` instances at `:165, 171`. The others are `Topology/Algebra/ConstMulAction.lean:609, 616, 659`, `Topology/Compactness/LocallyCompact.lean:190`, `Topology/Defs/Filter.lean:313–317` (`WeaklyLocallyCompactSpace.exists_compact_mem_nhds`) and `Topology/Compactness/Compact.lean:208`.
  - No Mathlib lemma lifts compact sets through an open quotient map (searched `Topology/Compactness`, `Topology/Algebra/Group`), so the owned target is genuine.
  - The new Checks are right. For `ℤ ⊂ ℝ`, `[0,1]` lies over the circle. For the continuous bijection `ℝ_d → ℝ`, every compact set of `ℝ_d` is finite, so its image cannot contain `[0,1]`.
- **R02 (P3), three AA.4.4 locators.** Repaired.
  - *compact-kernel-split-centre* (`:4811–4820`) is now an owned deduction from *split-centre-decomposition* with "[Arthur], §3, pp. 15–16". The product is arthur line 763–765, p. 16.
  - *Fibre mass for full stabilizers* (`:4907–4921`) is now an orbit–stabilizer deduction. It cites `TauCeti.stabilizerOrbitRelQuotientEquivOrbitRelMapFiber` (`GroupTheory/DoubleCoset/Fiber.lean:97`) and `TauCeti.card_fiber_orbitOfCosetTranslate_mul_card_stabilizer_inv_smul` (`GroupTheory/DoubleCoset/Orbits.lean:351`). Both state exactly the two facts used.
  - The `Map.lean` range now reads "lines 34–76". `quotientMapOfLELeft` is at `:34` and `_surjective` at `:72`.
  - The new Arthur §1, p. 8 locator of *rational-stabilizer-finite* (`:4838`) is arthur line 281–284: a discrete group meets a compact set in a finite set.
- **R03 (P3), the AA.3.6 reductive sentence.** Repaired.
  - `:3581–3584` no longer claims the fixed-`K` covering for reductive `G`. It points to the new *triple-fundamental-set* (`:3797–3825`).
  - That target restates Orr Theorems 2.2 and 2.3, p. 8 (orr line 298–307). Its finiteness clause has the `θ`-orbit form `{γ : γCS ∩ θCS ≠ ∅}` and the corrected footnote (orr line 293, 315).
  - The Siegel-property locator in AA.3.4 (`:3082–3085`) now names both real forms. They come after AA.3.4 and are not inputs to it.

## R01 (P3) — The canonical `μ₂` class target cites SchemeAndStackFoundations §§1.15, 2.3 "(its `Suggested.lean`)" for declarations that are elsewhere

Location: `README.md:4109–4117`, *Canonical `μ₂` class and scalar extension*: "uses SchemeAndStackFoundations's group space `G = GroupSpace.ofGroupScheme (Spec ℚ[ℤ/2])` … Source interfaces are SchemeAndStackFoundations §§1.15, 2.3 (its `Suggested.lean`)."

Claim: the declarations this target uses are stated in SchemeAndStackFoundations §§1.15 and 2.3, in its `Suggested.lean`.

Witness:
- `GroupSpace.ofGroupScheme` is defined in SchemeAndStackFoundations §1.13 (its `README.md:2418`, `:2427`), not in §1.15 or §2.3.
- The supplier's `Suggested.lean` declares, of the names used here, only `Torsor.trivial_iff_section` (`:1175`).
- `torsorClasses`, `torsorClasses.mk`, `torsorClasses.mk_eq_base_iff` and `Torsor.baseChange` exist only as README targets (`README.md:2510–2519`). `roadmaps grep` finds them in no Lean file on main or at any open head.

The supplier row *Geometric torsors and classes* (`:302`) also omits `GroupSpace.ofGroupScheme`.

Repair:
1. In `:4116–4117`, replace "Source interfaces are SchemeAndStackFoundations §§1.15, 2.3 (its `Suggested.lean`)" with "Source interfaces are SchemeAndStackFoundations §1.13 (`GroupSpace.ofGroupScheme`) and §§1.15, 2.3 (`torsorClasses`, `torsorClasses.mk`, `torsorClasses.mk_eq_base_iff`, `Torsor.baseChange`), README targets there; of these, only `Torsor.trivial_iff_section` is stated in its `Suggested.lean`".
2. In the `:302` row, change "SchemeAndStackFoundations, §§1.15, 2.3" to "SchemeAndStackFoundations, §§1.13, 1.15, 2.3", and add `GroupSpace.ofGroupScheme` to its list of names.

Tested on the instance the target uses. `Spec ℚ[t]/(t²−2)` with coaction `t ↦ t ⊗ g` has no `ℚ`-point, since `√2 ∉ ℚ`, and has the `ℝ`-points `±√2`. All three class assertions of the target are made through the names above, so every one of them is a §1.13/§1.15 README contract and not a pinned or `Suggested.lean` statement.

## R02 (P3) — *Fourier convergence of quadratic-character kernels* lists an unrelated layer on its *Needs:* line

Location: `README.md:5168–5170`: "([Khayutin], Proposition 3.6, arXiv v3 p. 24, and its proof with Remark 3.7, p. 25). *Needs:* AA.2.4; RepresentationTheory/CompactGroups, layer 5."

Claim: the target needs AA.2.4.

Witness:
- AA.2.4 is *Gauge forms and Tamagawa normalization*.
- The statement and its proof use only the Haar probability of the open subgroup `ker χ_i` of a compact abelian group and the orthogonality of characters. Haar probability is RepresentationTheory/CompactGroups, layer 0 (`:578`), and orthogonality is layer 5.
- As written, an implementer of AA.4.7 is blocked behind the Tamagawa layer.

Repair: replace "AA.2.4" in `:5169` with "RepresentationTheory/CompactGroups, layer 0 (Haar probability on a compact group)".

Tested on `C = ∏_ℕ {±1}` with `χ_n` the coordinate characters, the README's own first Check (`:5174`):
- `m_n = 2μ|_{ker χ_n}` integrates a character `ψ` to `1 + [ψ = χ_n]` when `ψ = 1`, and to `[ψ = χ_n]` otherwise.
- So for fixed `ψ ≠ 1` the integral is `0` once `n` passes the index of `ψ`, and `m_n → μ`.
- No gauge form, Tamagawa measure or convergence factor occurs.

## Verified sound

**Gate, build and dependency check.**
- My gate run on `2486445` prints `gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- `lake env lean` on `Suggested.lean` exits 0 in 9 s, with 19 warnings, all ``declaration uses `sorry` ``.
- The movable dependency check prints `depcheck: 239 roadmaps, 2364 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
  - `ORDER.txt` has the suppliers SmoothRepresentationsOfLocalGroups (line 25), PolylogarithmFunctions (38), AnalyticNumberTheoryPartI (49) and AnalyticNumberTheoryPartII (50), then this roadmap (51).
  - The consumers come later: SieveMethodsAndPrimePatterns (55), ArithmeticLocallySymmetricSpaces (57) and ProbabilisticAndMetricNumberTheory (60).
  - ProbabilisticAndMetricNumberTheory and KleinianGroups appear only in prose, as downstream specializations, never on a *Needs:* line.
  - None of the 15 never-cite roadmaps occurs in the README.
- Forward references inside the roadmap: a scan of every *Needs:* line finds only two.
  - AA.1.2 *Archimedean points are a Lie group* needs AA.1.4. AA.1.4 does not need that target back.
  - AA.1.5 *local-congruence-levels* needs AA.5.2. This is declared in *How to read the build* (`:604–606`).
  - Neither creates a cycle.

**Signatures and padding.**
- I elaborated `#check @name` for all 19 theorems and for `IsSArithmetic`, `levelArithmetic`, `IsNeatLevel`, `normOne`, `globalPoints`, `localPoints`, `levelSubgroup`, `HasStrongApproximation` and `HasWeakApproximation`, on a scratch copy. It exits 0.
  - Each type matches its README statement.
  - The five dropped-binder leads of `signatures.md` are harmless: `box` and `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap`, `IsFaithfulAlgebraicPointHom` do not use the dropped `Group`/`TopologicalSpace` or `[NumberField F]` binders.
- One-tactic probe on scratch copies:
  - Every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (aesop; done)`. This gives 19 errors on 19 theorems.
  - A second copy with `exact?` gives 19 errors and no "Try this".
  - Nothing is padding. `Suggested.lean` is unchanged since r17, and the pins are unchanged.

**Headline theorems.** All are stated, except those the module docstring (`:40–49`) names as not statable with their missing carriers. Those are Tamagawa normalization, Siegel covering and cusps, the disconnected criterion, the torsor Hasse principle, the `GL₁` class and cohomology identifications, and the `GL₂` Riemann-surface comparison. The new *triple-fundamental-set* belongs to the "Siegel covering" group: Siegel triples, windows and their domains are not carried by the pins.

| Headline | Lean statement |
|---|---|
| Convergent Haar products | `exists_unique_convergentHaarProduct` |
| Restricted-product comparison | `exists_restrictedProductEquiv` |
| Restriction of scalars on adelic points | `exists_weilRestriction_adelicPointsEquiv` |
| Arithmetic covolume | `arithmetic_finite_volume_iff` |
| Finite class numbers | `finite_classes` |
| Finite volume | `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` |
| Compactness | `exists_compact_normOne_iff` |
| `GL_n` reduction | `exists_reduced_GLZ` |
| Weak and strong approximation | `hasWeakApproximation_of_simplyConnected`, `hasStrongApproximation_of_simplyConnected` |
| Neat levels, covering maps | `exists_isNeatLevel_le`, `isCoveringMap_levelMap` |
| Quaternion norms | `nrd_image` |
| Idele classes modulo squares | `compactSpace_ideleClassGroup_quotient_squares` |
| Fourier limits | `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` |
| `GL₁` tori, `GL₂` decomposition | `nonempty_connectedComponent_homeomorph`, `exists_componentHomeomorph` |

**Library declarations opened at the pins (27).**
- Mathlib:
  - `Topology/Algebra/ProperAction/Basic.lean:113, 165, 171`;
  - `Topology/Algebra/ConstMulAction.lean:609, 616, 659`;
  - `Topology/Compactness/LocallyCompact.lean:53, 190`;
  - `Topology/Defs/Filter.lean:313–317`;
  - `Topology/Compactness/Compact.lean:208`.
- Tau Ceti:
  - `GroupTheory/DoubleCoset/Map.lean:34, 43, 50, 64, 72`;
  - `GroupTheory/DoubleCoset/Fiber.lean:38, 57, 81, 97`;
  - `GroupTheory/DoubleCoset/Orbits.lean:330–357` (the two multiplicity identities);
  - `NumberTheory/NumberField/Global/Ideles/Norm/Basic.lean:34–47`.
- `grep` of both pins for Siegel sets, neatness, adelic Tamagawa measure and strong approximation finds only the elliptic-curve Tamagawa files of Tau Ceti, so the README's "Mathlib has no … Siegel sets … neatness" (`:459–461`) holds.

**Cross-roadmap citations resolved** (main at `9a7e5d1`; open heads through `roadmaps show`).
- **AnalyticNumberTheoryPartII** (pull request 1167):
  - its README has §5.3f (`:668`), §5.3j (`:720`, local unit mass `N(𝔇_v)^{−1/2}`), §5.3k and §5.3l–m;
  - its `Suggested.lean` has `exists_unique_restrictedAddHaar` (`:268`), `exists_unique_quotientMeasure` (`:313`) and `gl2_classNumber` (`:353`).
- **AnalyticNumberTheoryPartI** (pull request 1126): §2.18a (`:14`).
- **ProbabilisticAndMetricNumberTheory** (pull request 1421): `lattice_invariant_probability_unique` (`Suggested.lean:589`), `modularQuotient_existsUnique_invariant` (`:670`).
- **KleinianGroups** (pull request 432): `isDiscrete_bianchi` (`Suggested.lean:192`).
- **ReductiveGroupsPartII on main**:
  - all eight cited target slugs occur in its README;
  - so do `AlgebraicRelativeRoots`, `characterValue_coe`, `derivedIdeal_gl_n` and `centralizerIdeal_points_iff`;
  - its `Suggested.lean` declares `modularCharacter_eq_adjointModulus`, `modularCharacter_eq_one` and `lang_surjective`.
- **DiophantineApproximationAndTranscendence on main**: §2.5 (`:1217`), *Relative Euclidean projective normalization* (`:1357`), `arakelovMulHeight_eq_height2` and `height2_baseExtension` in its `Suggested.lean`.
- **MassFormula on main**: Layer 2 (`:280`).
- **SchemeAndStackFoundations on main**: §§1.13, 1.15, 2.3; see R01.
- `citations.md` lists 47 Lean names. Each is a declaration of this `Suggested.lean` or one of the supplier names resolved above.

**Ownership.**
- `roadmaps grep` for "Siegel triple" and "fundamental set" over main and every open head finds the new *triple-fundamental-set* objects only here. The other hits are real binary quartic fundamental sets (ArithmeticStatisticsPartIII) and a Satake compactness argument (ShimuraVarieties).
- `overlaps.md` reports no open pull request changing this roadmap and no dropped ids.
- The full READMEs of ArithmeticLocallySymmetricSpaces, ShimuraVarieties and ShimuraData were not read: the brief gives their pull requests without files. So the ALS-owned Cartan bridge at `:5634–5648` was not checked against ALS itself.

**Sources: the seeded sample, read at the locators.** Page offsets are as follows:
- Borel: printed page = marker + 3.
- Witte Morris: printed page = marker − 16.
- All other texts: marker = printed page.

| Sample target | Locators checked (source line) | Result |
|---|---|---|
| 0.1 | Sutherland §23.3 pp. 5–6 (lines 281–309: local normalizations, box σ-algebra, product measure) | supports; PRR §3.5 paywalled |
| 0.2 | AnalyticNumberTheoryPartII §5.3f (its README `:668`) | supports; right invariance is an owned deduction |
| 0.4 | Sutherland p. 6 (285–309); Rosengarten §1 p. 2 (42–70, convergence factors and complex `\|dz∧dz̄\|` mass 2); Borel §5.5 p. 21 (672–678); ANT II §5.3j (`:720`) | supports; PRR Lemma 3.63 paywalled |
| 1.2 | Conrad Prop 2.1 p. 2 (53), Ex 2.3 p. 3 (115), Rem 3.5 p. 6 (253–277), Thm 3.6 p. 6 (281), (3.6.2) p. 7 (308); Witte Morris A4.6 p. 435 (18075) | supports |
| 2.1 | Arthur §3 pp. 15–16 (742–765), §5 (5.1) p. 24 (1307–1310); Borel Lemma 5.9 and §5.8 p. 22 (716–736) | supports |
| 2.2 | Arthur §5 p. 25 (1348–1351); Mathlib quotient-topology declarations (above) | supports; Arthur sign misprint (Source issues); PRR Thm 3.64 paywalled |
| 2.4 | Rosengarten §1.1 pp. 2–3 (49–91); Gordon (1) p. 3 (117), (48) p. 32 (1626); Dudas–Michel Prop 7.12(iii) p. 27 (1245), Prop 7.14 p. 28 (1278–1279) | supports; PRR Thms 3.71, 5.22, Ex 5.23 paywalled |
| 2.5 | Rosengarten §1 p. 2 (61–62); Gordon (48) p. 32 (1626) | supports; PRR Thms 3.60, 3.71 paywalled |
| 3.3 | Borel Lemma 4.4 and Thm 4.5 pp. 17–18 (541–580), §5.3–5.4 p. 20 (636–654); Orr §2.A p. 6 (202–215) | supports; BHC, PRR §4.2 paywalled |
| 3.4 | Borel Def 4.1 p. 17 (510–516), Thm 4.6 p. 18 (581–583), Thm 5.1/§5.6 p. 21 (679–693), Thm 5.8 p. 22 (716–719); Orr Thms 2.2–2.3 p. 8 (298–307) | supports |
| 3.5 | Arthur §13 p. 70 (13.2)–(13.4); DiophantineApproximationAndTranscendence §2.5 | supports |
| 3.7 | Orr Lemma 2.1 and §2.B pp. 6–7 (216–245), §2.C (246–286), §2.D p. 8 (287–315) | supports, including the new *triple-fundamental-set* |
| 4.1 | HW §1 p. 6 (258–262), Thm 6.1 p. 21 (872–882), Lemme 6.3 p. 22 (911); Rapinchuk Lemma 1.2 p. 3 (96–103); SchemeAndStackFoundations §§1.13, 1.15 | supports, except the section and file of R01; PR 1994 paywalled |
| 4.4 | Milne Lemma 5.13 p. 57 (2486); LT §3.2 p. 11 (407), (20) p. 14 (496), (21) (519); Arthur §1 p. 8 (281–284), §2 p. 13 (567–600), §3 pp. 15–16; Tau Ceti double-coset declarations | supports |
| 4.7 | Khayutin Def 3.1 p. 22 (912–919), Prop 3.6 p. 24 (1001–1008), Rem 3.7 and proof p. 25 (1011–1039) | supports; *Needs:* line is R02 |

The README flags no locator as unverified. The texts not in the manifest were fetched through the sources service into a scratch copy of the manifest, leaving the package manifest unedited:
- Sutherland (institutional page);
- Rosengarten (arXiv 1806.10723v3);
- Gordon (2205.02391v1);
- Dudas–Michel (author page);
- Khayutin (1710.04557v3);
- Rapinchuk (1207.4425, served as v1);
- HW (1802.09605v2).

**Adversarial table.** Every value was computed this round.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; one `C₄`, `B = {0,2}`, `S = ι`; `C i₁ = G` (mass `∞`), `C i₂ = ∅` | point mass: `1·∏'∅ = 1`; box mass `2`, empty tail; `ν(∅) = 0 = ∞·0` in `ℝ≥0∞` | true |
| 0.1 Borel boxes | `ι = ℕ`, `ℤ/4 ⊃ 2ℤ/4`; singleton `{0}` | not open, not a cofinite box; `⋂_n` of boxes, measurable; not a union of fibres of `x ↦ (x_i mod B_i)` | true |
| 0.2 right invariance | `C₂` counting; translate by `g` with `g_i ∈ B_i` a.e. | box masses `∏μ_i(C_i g_i⁻¹) = ∏μ_i(C_i)` | true |
| 0.4 normalizations | `[0,1)×ℤ̂`; `ℚ(i)`, annulus `1≤\|z\|≤e` | `1`; `4π` here vs `2π` in ANT II §5.3j, ratio `4^{1/2} = 2 = \|d\|^{1/2}`; `2·2π·1 = 4π` | true |
| 0.4 idele mass | `x₂ ∈ 1+4ℤ₂`, units elsewhere, `[1,e]` | `(1−½)⁻¹·¼ = ½`; `¼` without the factor | true |
| Lean `exists_weilRestriction_adelicPointsEquiv` | `ℚ(i)/ℚ`, `G_a`, point `i`; conjugate coefficient map | `i⊗1 ↦ 1⊗i ↦` diagonal `i`; conjugate gives `−i`, not `ℚ(i)`-linear | true |
| Lean `exists_restrictedProductEquiv` | standard `G_m` model; `H = F` | `𝔸_f^× ≃ Πʳ[ℚ_p^×, ℤ_p^×]`; both sides singletons | true |
| 1.2 Lie components | `SO(x²−y²)`, `SO(x²+y²)`; `SL₂`, `PGL₂` | `{diag(t,t⁻¹)} ≅ ℝ^×` (2 components), `SO(2)` (1); 1 vs 2 | true |
| 2.1 split centre | real quadratic `G_m`, idele `(2,½)`, finite part `1` | norm `1`; not in `F^×` (finite part forces `1`); in `Z(F_∞)^0` | true |
| 2.1 Arthur product | `G_m/ℚ`, `K∞ = ℝ^×` | `ℝ^× = ℝ_{>0}×{±1}`, kernel `{±1}` | true |
| 2.2 modulus and Arthur p. 25 | `ax+b`: left `dx dy/x²`, right `dx dy/\|x\|`, `δ = \|x\|` | `d_l/d_r = δ⁻¹`; Arthur prints `e^{+2ρ}` | README true; source misprint |
| 2.2 compact lifting | `H={1}`; `ℤ ⊂ ℝ`; `ℝ_d → ℝ` | `D = C`; `[0,1]`; finite compacts miss `[0,1]` | true |
| 2.4 gauge pullback | upper Borel at `diag(a,d)`; `\|ω\|(Eg⁻¹) = \|R_{g⁻¹}^*ω\|(E)` | pullback `(a/d)⁻¹`; `map(·g)\|ω\| = \|det Ad g\|·\|ω\| = \|a/d\|·\|ω\|`, agreeing with 1.5's `Δ` | true |
| 2.4 Weil, orders | `GL₂`, `q = 2`; `SL₂/𝔽₂`; nonsplit rank one; `U₃(q)` | `6/16 = 3/8`; `2·1·3 = 6`; `\|−2−1\| = 3`; `q³(q²−1)(q+1)(1+q³)` | true |
| 2.4 corrected volumes | `q⁻¹` coefficient | torus `−tr θ`, Bruhat `+#θ`-fixed simple roots, net `−tr(θ\|X*(H))`, cancelled by `L_v(X*,1)` | true |
| 2.4 Tamagawa | `G_a/ℚ` on `[0,1)×ℤ̂`; `G_m` integral factor | `\|d\|^{−1/2}·\|d\|^{1/2} = 1`; `(1−q⁻¹)⁻¹(1−q⁻¹) = 1` | true |
| 2.5 global Jacobian | `ℚ(i)/ℚ`, `β = (1,i)` | finite `j = 1`; real `2⁻¹·1`; product `½ = 4^{−1/2}` | true |
| 2.5 gauge restriction | trivial group, `ℚ(i)`, `ω = 1+i` | complex `\|1+i\|² = 2`, at `(1+i)`: `½`; over `ℚ`: `2`, `\|2\|₂ = ½` | true |
| 3.3 Siegel domain, Gram | `[[√y,x/√y],[0,1/√y]]`; columns `(1,0),(1,2)` | `g·i = x+iy`, in `Σ₂` iff `\|x\|≤u`, `y≥t`; `[[1,1],[1,5]]` | true |
| 3.4 Siegel property | `G_m/ℚ`, `𝔖 = ωA_GK` | `𝔖𝔖⁻¹ ∩ G^1 = ωω⁻¹K` compact, meets `ℚ^×` finitely | true |
| 3.4 `S`-arithmetic | `ℚ(√2)`, `π = 3+√2` | `N(π) = 7 = ππ′`; `SL₂(𝒪[1/π]) ⊂ SL₂(𝒪[1/7])` of infinite index | true |
| 3.5 heights | `GL₁` point `2`; `(I₂,I₂⁻¹)`; `G_a` unipotent | `√(4+¼)·2 = √17`; `2^{[F:ℚ]}`; `√(4+2t²)`, `max(1,\|t\|_p)` | true |
| 3.7 *triple-fundamental-set* | `G_m/ℚ`, window `({1},1)`; `SL₂`, `\|x\|≤½`, `t = ¾` vs `1`; `SL₂(ℤ[½])` | `ℝ_{>0}·{±1} = ℝ^×`; `√3/2 > ¾` covers, `0.45+0.9i` (`\|z\|² = 1.0125`) blocks `t=1`; `diag(2^k,2^{−k})·i = 4^k i` gives infinitely many `γ` | true |
| Lean `arithmetic_finite_volume_iff` | `G_m/ℚ`; `SL₂/ℚ` | `{±1}\ℝ^×` infinite, `X* = ℤ`; finite, `X* = 0` | true |
| Lean `finite_classes` | `G_m`, `ℤ̂^×`; `U = {1}` | `Cl(ℤ) = 1`; excluded by `hUo` | true |
| Lean `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` | `G_m`; `G_a` | `ℚ^×\𝔸¹` compact, full quotient infinite, `T^ℤ` not subsingleton; `𝔸/ℚ` compact, `GroupLike F[T] = {1}` | true |
| Lean `exists_compact_normOne_iff` | `G_m`; `GL₂`, `X₁₁ ↦ T` | central, compact; `[[2,2],[0,1]] ≠ [[2,1],[0,1]]`, noncompact | true |
| Lean `exists_reduced_GLZ` | `n = 0`; `n = 1`, `b = [β]` | `1 < C·1` needs `C > 1`; `β < Cβ` | true |
| Lean approximation pair | `μ₂`, `{∞,2}`; `G_m`, `x = 2` at 2, `U` with `1+5ℤ₅`; `SL₂ × D¹` | `{(1,1),(−1,−1)}` not dense; `±2 ≡ 2,3 (mod 5)`; `hS` fails for compact `D¹(ℝ)` | true |
| Lean `exists_isNeatLevel_le` | `GL₂`, `U = GL₂(ℤ̂)` | `K(3)` of index `48`; its rational points `≡ I (mod 3)` | true |
| Lean `isCoveringMap_levelMap` | `GL₁`, `U(3) ⊃ U(9)`; `SL₂`, `Γ(9) → Γ(3)` | `2 → 6`, fibres `3`; `648/24 = 27` | true |
| 4.4 compact kernel (repaired) | `G_m`, `K∞ = ℝ_{>0}`, `ℝ^×`, `{±1}` | kernel `{1}`, `{±1}`; product `ℝ^× ≠ {±1}` | true |
| 4.4 full fibre mass (repaired) | `SL₂`, `SO(2)`, `SL₂(ℤ̂) ⊃ Γ̂(2)`, `x = [i]` | `\|A_x\| = 4`, image in `SL₂(𝔽₂)` of order `2`, `3` orbits, `\|A_y\| = 2`: `3·½ = 6/4` | true |
| 4.4 central fibre mass | from full: `\|A\| = \|Γ\|·\|Z\|` | `Σ1/\|Γ_y\| = [U:U′]\|Z_{U′}\|/(\|Γ_x\|\|Z_U\|)` | true |
| 5.3 level change (repaired route) | Hurwitz, `U₁(9)` at `3` | `81−9 = 72`, `ℚ^×∩U₁(9) = 1`, `72/24 = 3` free orbits; `3 = (72/2)(1/12)` | true |
| Lean `nrd_image` | Hamilton, `c = −1, 3`; split `a = 1` | no norm and RHS false; `1+1+1` and RHS true; RHS vacuous, every `c` a norm | true |
| Lean `compactSpace_ideleClassGroup_quotient_squares` | `2` at `∞`; `−1` at `3` | `√2` is an idele, class dies; `−1` not a square in `ℚ₃`, survives | true |
| Lean Fourier pair | `∏_ℕ{±1}`, coordinate `χ_n`; repeated `χ` | `∫ψ dm_n = [ψ=1]+[ψ=χ_n] → [ψ=1]`; `ker χ` limit excluded by `hχ` | true; R02 on *Needs:* |
| 4.1 `μ₂` class (R01 target) | `ℚ[t]/(t²−2)` | no `ℚ`-point, `ℝ`-points `±√2` | true; R01 on locator |
| Lean `nonempty_connectedComponent_homeomorph` | `ℚ`; `ℚ(√2)`, `Q = ∅` | rank `0`, a point; rank `1`, a circle | true |
| Lean `exists_componentHomeomorph` | `GL₂(ℤ̂)` | `ℚ^×_{>0}\𝔸_f^×/ℤ̂^× = 1`, one component | true |

## Not verifiable

- **Paywalled:**
  - Platonov–Rapinchuk–Rapinchuk 2023 and Platonov–Rapinchuk 1994: Cambridge University Press and Academic Press. Every PRR and PR locator is taken as given, including the `Suggested.lean` docstring locators (Theorems 4.12, 5.22(2), 5.24, 7.8, 7.12, 1.34; Lemma 3.63) and the README's remark on the exponent printed in the proof of PRR Theorem 5.22, p. 315.
  - Borel–Harish-Chandra 1962 (JSTOR), Schneider 2011 and Voight 2021 (Springer), and the English translation of Platonov 1969 and its addendum.
- **Not read this round:** Conrad RGS, Casselman, Loeffler, CG, BKT and its erratum, BGST, Orr–Schnell, and the Stacks tags. None is a locator of the sampled targets except BKT §4.5 in 3.3 and the Stacks tags in 4.1, which r17 read.
- **Not in the manifest:** the roadmap's `sources.toml` records only the eleven works of its manifest. The other cited works were fetched for this review through the service into a scratch copy of the manifest, so the package manifest was not edited.
- **Ownership against open pull requests:** checked by `roadmaps grep` over every open head. The ArithmeticLocallySymmetricSpaces, ShimuraVarieties and ShimuraData READMEs were not read, since the brief names those pull requests without files.

## Source issues

- **Misprint** in arthur at §5, p. 25: the source says left and right Haar measures on `P(𝔸)` satisfy `d_ℓp = e^{2ρ(H_P(p))} d_rp`; it should be `e^{−2ρ(H_P(p))}`, as the `ax+b` group (left `dx dy/x²`, right `dx dy/|x|`) shows; affects nothing.
- **Misprint** in Dudas–Michel at Proposition 7.14, p. 28: the source says `|T_w^F| = det(wF − 1 | X(T))`; it should be the absolute value of that determinant, which is `−(q+1)` for the nonsplit rank-one torus; affects nothing.
