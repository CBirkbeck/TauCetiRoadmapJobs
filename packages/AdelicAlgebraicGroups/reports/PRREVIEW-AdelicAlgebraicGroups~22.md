# Review of AdelicAlgebraicGroups (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** This pull request revises the roadmap on main. It adds six subsections and removes nothing:

- 1.5a, lattice stabilizers;
- 2.6, measures of top forms, of groups with a unipotent radical and on homogeneous spaces;
- 3.4a, `τ(G_m) = 1` and the Tamagawa numbers of `M ⋉ N`;
- 4.1a, Ono's formula and `τ(R¹_{E/F}G_m) = 2`;
- 4.2a, strong approximation for any finite `S`;
- 4.5a, class-set integration and the mass.

Every statement, Check and worked example in them survived computation, including the degenerate cases and the negative controls. Every cited supplier section and library name exists where it is cited. No layer id or item of the README on main is removed or renumbered, and `Suggested.lean` is unchanged and elaborates. There are no findings. There are three small corrections, all non-blocking:

- the description leaves this roadmap out of its list of the largest additions;
- one locator in 1.5 does not cover the reductive case it is cited for;
- a few new citations have no locator.

There is one question for the author. Nothing is left for the human reviewers to decide.

## C01 — The description does not mention this roadmap, although its addition is larger than three of the additions it names

A reader of the description cannot tell that AdelicAlgebraicGroups gains six subsections. The sentence "The largest additions are to ComplexComparisonPartII (…), ReductiveGroups and RepresentationTheory/CharacterTheory (…), GeometryOfNumbersAndQuadraticArithmetic (…), ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions (…), and MetaplecticAutomorphicForms (…)" omits it.

The diff of this README against main is 653 lines (621 insertions). The diffs of GeometryOfNumbersAndQuadraticArithmetic, HeightsRationalPointsAndObstructions and MetaplecticAutomorphicForms are 303, 256 and 254 lines.

A clause such as the following would make the description right:

> "…, and AdelicAlgebraicGroups (lattice stabilizers; measures of top forms, of groups with a unipotent radical and on homogeneous spaces; `τ(G_m) = 1` and the Tamagawa numbers of groups with a unipotent radical; Ono's formula; strong approximation for any finite set of places; class-set integration and the mass)"

## C02 — [Borel] §5.5 does not state that reductive groups are unimodular, which two targets of 1.5 cite it for

The targets *Local unimodularity of reductive groups* and *Adelic groups of reductive groups are unimodular* (README lines 1016–1024) cite "[Borel], §5.5, p. 20". Borel's Lemma 5.5 (borel line 655–658) proves two things:

- unimodularity of `G_A`, `G_∞` and their subgroups is equivalent to every left-invariant rational top form being right-invariant;
- `G_A` is unimodular when `G` has no rational character.

For `GL_n`, which has the determinant as a character, the step that is needed is that `det Ad = 1` on a reductive group. That step is not in the cited passage, so a reader who opens the locator finds only half of the argument. The statements themselves are true.

Two repairs would work:

- cite Oesterlé, Chapter I, Proposition 5.3 and Corollaire 5.4, p. 23. Both are already in the References. They give the modulus `|det Ad|^{−1}` locally and adelically and the unimodularity of `G(𝔸)` for reductive `G`;
- or add "with `det Ad = 1` on reductive groups" to the citation.

## C03 — Some new citations have no locator, and one new target has none at all

*tamagawa-quadratic-norm-torus* (line 4241) cites only "[Ono], as the case of *tamagawa-torus-ono* computed in the Route". Other new citations also carry no theorem or page:

- [Gross] in *class-set-integration* (line 5217);
- [Kneser], [Platonov] and [Platonov–Rapinchuk] in *strong-approximation-any-places* (lines 4619 and 4625).

A reader cannot check any of these attributions. The statements are standard and the other locators of those targets were verified (Rapinchuk, Theorem 2.3, p. 12; Arthur, (2.1), p. 13), so nothing stated is affected.

The repair is a theorem or page for each. For the norm-one torus, Oesterlé, Chapter IV, Corollaire 3.3, p. 56 (Ono's formula, verified) together with the computation in the Route would do. For [Gross], HermitianFormsAndLattices cites the same class-set facts at Gross 5.5 and 5.7. I could not read Gross, so this is only a lead.

## Questions for the author

- *tamagawa-torus-ono* (lines 4201–4229). Is the global duality for tori meant to be derived inside this target?
  - The route uses that duality in the form of Oesterlé, Chapter IV, 2.5 and 2.7: the duality of `H¹(F, X*(T))` with `H¹(Gal, T(𝔸 ⊗ F̄)/T(F̄))`, the bijectivity of `Λ_T`, and the exact sequence with `Ш²`.
  - The *Needs:* line names only ClassFieldTheory layers 0 (the Tate–Nakayama theorem) and 11 (the global class formation). The bijectivity of `Λ_T` also uses the local invariants and the global Brauer sequence (layers 5 and 10).
  - The one roadmap that states the finiteness and the pairing, ArithmeticGaloisDuality (*Torus Sha duality and adelic annihilators*), comes after this roadmap in the merge order.
  - If the derivation belongs here, the *Needs:* line could say "proved as part of this target", as it already does for the exact-sequence formula.
  - What stopped me: whether the author intends layers 0 and 11 to be read as supplying the derived statements.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 1.5a *lattice-stabilizers* (c) and its Check | `GL₂/ℚ`, `U = gGL₂(Ẑ)g⁻¹`, `g = diag(p,1)` at `p` | `U_p` entries `[[a, pb],[c/p, d]]`; fixes `pℤ_p⊕ℤ_p`; `(1,0) ↦ (a, c/p) ∉ ℤ_p²`; route's sum gives `ℤ_p⊕p⁻¹ℤ_p`, also stable | true |
| 1.5a (a), (b) | trivial `G`; `M_p = pℤ_p⊕ℤ_p` | `Stab = {1}`, compact open in a point; `Stab_{GL₂}(M) = gGL₂(Ẑ)g⁻¹`, compact open | true |
| 2.6 *top-form-measure* | `G_m`, `dT/T`; form `2ω` over `ℝ, ℂ, ℚ₂` | `|ω|_p(ℤ_p^×) = 1 − 1/p`; scaling `2, 4, 1/2` | true |
| 2.6 *tamagawa-measure-unipotent-radical* | `B = G_m ⋉ G_a ⊂ SL₂` | `Ad(a(t))` on `Lie N` is `t²`, `Δ = |t|²_𝔸`, `1` on `B(𝔸)^1`; `mn` coordinates left-invariant, `n′` acts by `m⁻¹n′m` | true |
| 2.6 *homogeneous-gauge-measure* (i), three Checks | `B` on `G_m`; `SL₂×G_m` on `𝔸²`; affine group on `𝔸¹` | left `du∧dt/t³`, right `du∧dt/t`; fibre form `du/t²` against `du`; `s² ≠ 1`; `a ≠ 1`: no invariant form | true; Checks separate |
| 2.6 (iii), its Check | `GL₂` on `PGL₂`, `H = G_m` | restriction `ℤ →(·2) ℤ`, cokernel `ℤ/2`; `(1−q⁻¹)(1−q⁻²)/(1−q⁻¹) = q(q²−1)/q³`; product `ζ_F(2)⁻¹ ≠ 0` | true |
| 2.6 (iii), injectivity hypothesis | `SL₂ ⊂ GL₂`, `Ξ = G_m` | `X*(GL₂) → X*(SL₂) = 0` not injective; masses `1 − q⁻¹`, product `0` | hypothesis needed |
| 3.4a *tamagawa-multiplicative-group* and Checks | `ℚ`; `ℚ(i)` | `∏ν_{T,p}(ℤ_p^×) = 1 = κ_ℚ`; `2π·(1/2)/4 = π/4 = κ`; `dt/t` gives `π/2` | true |
| 3.4a, route at `s = 1` | finite `v ∈ S`; `v ∉ S` | `∫f_v|x|(1−q⁻¹)⁻¹dx/|x|·(1−q⁻¹) = ∫f_v dx`; `z(1_𝒪,1,s) = (1−q^{−s})⁻¹` | true |
| 3.4a *tamagawa-number-unipotent-radical*, Checks | affine group; Heisenberg; `Res G_a` | `da db/a² = (da/a)db′` in `(a,0)(1,b′)`, `(da/a)(db/a)` in `(1,b)(a,0)`; `1·1`; `G_a^{[E:F]}`: `1 = 1` | true |
| 4.1a *tamagawa-torus-ono* | `G_m`; rank-zero torus | `H¹(F,ℤ) = 0`, `Ш¹` a point: `τ = 1`; `1/1 = 1` | true |
| 4.1a *tamagawa-quadratic-norm-torus*, Check | `ℚ(i)/ℚ` | `H¹(C₂,ℤ_−) = ℤ/2`; volumes `π` at `ℝ`, `2` at `ℚ₂` (index 2, `i = (1+i)/(1−i)`); `(4/π)·π·2/4 = 2` | true; C03 (locator) |
| 4.2a *strong-approximation-any-places*, Checks | `D¹` definite, `S = {p}` split; `S = {∞}`; `S = ∅` | `SL₂(ℚ_p)` noncompact, so dense; `D¹(ℝ)` compact, excluded; `G(F)` discrete, not dense | true |
| 4.5a *class-set-integration*, Checks | `GL₁/ℚ`, `Ẑ^×`; norm-one torus of `k`; index-2 `U′` | mass `1/2`; `|Cl|/|μ(k)|`; `1 = 2·½`; `Γ_i` discrete in compact `G(F_∞)^1`, so finite | true |
| 4.5a, hypothesis | `G_m` over real quadratic `F` | `(ℝ^×)²/ℝ_{>0}` noncompact, `𝒪_F^×` infinite: excluded | true |
| 0.3 factorizable integral, Check | `C₂`, constants `2`, `3` | `4·6 = 24`; probability measures give `2·3 = 6` | true |
| 1.1 integral models, Checks | `G_a` with `X ↦ pT`, `v | p`; standard `G_m` | `localPoints = p⁻¹𝒪_v`; `Γ = {±1}` over `ℚ`, `S = {∞}` | true |
| 1.5 modular character, Weyl products | Borel of `GL₂(ℝ)`; `GL₂`, `SL₂`, `PGL₂` | `Δ(diag(a,d)) = |a/d|`; `2I`; `I`; `α(b) = −1`, `b² = 1` | true |
| 1.5 reductive unimodularity | `GL₂(ℚ_p)` | `det Ad = 1`, unimodular; Borel's sufficient condition `X_k(G) = 1` fails for `GL₂` | true; C02 (locator) |
| 2.2 modulus | upper Borel of `GL₂`, `diag(2,1)`, `diag(1,2)` | `δ = 2, 1/2`; both determinants of norm `2` | true |
| 2.3 *finite-covolume-unimodular* | `S₃ ⊃ A₃`, `D = {1,(12)}` | `6 = 3·dġ`, so `dġ = 2 = μ(D)`; normalized counting gives `6` | true |
| 2.4 orders, Weil formula, `G_m` | `SL₂/𝔽₂`; rank-one tori over `𝔽₂`; `G_m` | `2·1·3 = 6`; `|2−1| = 1`, `|−2−1| = 3`; `(1−q⁻¹)⁻¹(1−q⁻¹) = 1` | true |
| 2.5 restriction of scalars | `ℚ(i)/ℚ`, `G_m` | `|d|^{1/2}`: `1` and `2`; `τ(Res G_m) = τ(G_m) = 1` | true |
| 3.2 reduced forms | `b = I₂`, `C = 2`; `diag(9,1)` in order `(e₁,e₂)` | `1 < 2`, `1 < 2·1`; `9 ≥ 2·1` fails (2) | true |
| 3.5 adelic height | `GL₁` point `2`, `σ⊕σ^∨` | `∞`: `√(4+1/4) = √17/2`; at `2`: `max(1/2, 2) = 2`; product `√17` | true |
| 3.7 subgroup containment | `H = G` | `C = {1}`, same triple, `R_u` equal | true |
| 4.4 product index | `K₀(6) ⊂ GL₂(Ẑ)` | `3·4 = 12 = 6·(3/2)(4/3) = [SL₂(ℤ):Γ₀(6)]` | true |
| 4.6 reduced norms, squares quotient | Hamilton quaternions over `ℚ` | `Nrd(D^×) = ℚ_{>0}`; `ℚ^×\𝔸^×/𝔸^{×2}` compact | true |
| 5.1 `GL₁` components | `ℚ(√2)`, `Q = ∅`; `Cl = ℤ/3`, `p = 5` | one circle (narrow `h = 1`); `π₀ = 3` against CG's maximal exponent-5 quotient `1` | README right; source issue |
| headline `finite_classes` | `GL₁/ℚ(√−5)`, `Ô^×` | `2` classes `= h` | true |
| headlines `finite_volume_iff`, `arithmetic_finite_volume_iff` | `G_m/ℚ`; `SL₂/ℚ` | `ℝ_{>0}` factor: infinite; no character: finite | true |
| headline `exists_compact_normOne_iff` | `G_m`; `SL₂` | central cocharacters: compact; `diag(t,t⁻¹)` not central: noncompact | true |
| headlines `hasStrongApproximation_of_simplyConnected`, `hasWeakApproximation_of_simplyConnected` | `SL₂`, `S_f = ∅`; `SL₂`, `{∞,2,3}`; definite `D¹` | `SL₂(ℤ)` dense in `SL₂(Ẑ)`; dense; hypothesis fails (compact) | true |
| headline `exists_isNeatLevel_le` | `K(3) ⊂ GL₂(Ẑ)` | index `|GL₂(𝔽₃)| = 48`, neat | true |
| headline `isCoveringMap_levelMap` | `GL₂`, `K(9) ⊂ K(3)` | `2` components below, `6` above; `3 × 27 = 81 = [K(3):K(9)]` | true |
| headline `exists_componentHomeomorph` | `U = GL₂(Ẑ)` | one class (`det` onto `Ẑ^×`), `Γ = SL₂(ℤ)` | true |

- **Source locators.** About 70 locators were read at their text.
  - Seeded sample: 0.3, 1.1, 1.5, 1.5a, 2.2–2.5, 3.2, 3.4a, 3.5, 3.7, 4.4, 4.6 and 5.1.
  - New-section locators: Oesterlé (GDZ copy, printed page = PDF page − 11) at I 2.3–2.4, 4.7, 5.3, 5.9, 5.12, 5.14, II 1.3, III 3.1–3.3, 5.3, IV 3.1–3.3 and the Introduction; Rapinchuk Thm 2.3, p. 12; Arthur (2.1), p. 13; Borel §2.1, p. 11 and §8.7, pp. 28–29.
  - Old-section locators: Conrad, Conrad RGS, Milne, Rosengarten, Gordon, Dudas–Michel, BKT and its erratum, Orr, BGST, LT, Khayutin, CG, Borel–Tits and Witte Morris.
  - All support the statements as written, except C02.
- **Library declarations opened at the pins.**
  - Mathlib: `Submodule.IsLattice` (`Algebra/Module/Lattice.lean:68`), `ImplicitFunctionData.implicitFunction` (`Analysis/Calculus/Implicit.lean:159`), `groupCohomology.coindIso` (`…/GroupCohomology/Shapiro.lean:58`), `groupCohomology.H1ofAutOnUnitsUnique` (`…/GroupCohomology/Hilbert90.lean`), `NumberField.dedekindZeta_residue` and `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (`NumberTheory/NumberField/DedekindZeta.lean`), `MeasureTheory.Measure.addHaarMeasure`, `Subgroup.index_pi` (`GroupTheory/Index.lean:643`).
  - Tau Ceti: `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`Topology/Algebra/PointTopology/Functoriality.lean:110`), `TauCeti.CommHopfAlgCat.geometricCharacterGroup` and `instGeometricCharacterGroupGaloisAction` (`…/CharacterLattice/Basic.lean:73, 93`), `TauCeti.dedekindZeta_eulerProduct_hasProd`.
  - All are under the namespace the README gives, and all are listed in the supplier contracts.
- **Cross-roadmap citations resolved at this head or on main.**
  - ReductiveGroups: 3A.2 and 3A.5a for orbits, local closedness and smooth orbit schemes; 3A.5d; 3A.5f with `smooth_toOrbit_of_charZero`; 6A item 1, the filtration and the surjectivity of `U(k) → (U/U₁)(k)`.
  - ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts*, with its change of variables.
  - ClassFieldTheory layers 0, 11 and 13.
  - AnalyticNumberTheoryPartII §§5.3f, 5.3h, 5.3j and 5.3k: the residue `κ_F f̂(0)` is in §5.21j, which the route need not cite.
  - The *Needs:* lines name no roadmap later in the merge order, and no RiemannHypothesisForDirichletLFunctions roadmap.
- **Automatic checks and dependency check.**
  - Every gate check passed on this head.
  - The dependency check printed `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)` (exit 0), with no UPWARD or CYCLE line.
  - Nothing outside the pull request's own folders changed.
- **Elaboration and padding probe.**
  - `lake env lean` on `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``.
  - On probe copies of the file, `simp`, `rfl`, `infer_instance` and `trivial` close none of the 19 theorems.
  - The five dropped-binder leads (`RestrictedHaar.box`, `AdelicPoints.InfinitePoints`, `Reduction.IsCentralCocharacter`, `Neat.algebraicPointMap`, `Neat.IsFaithfulAlgebraicPointHom`) drop instances that do not occur in their types.
  - The file is unchanged by this pull request.
  - The new targets are not headline theorems of the Summary. Those about Tamagawa measures are not statable at the pins, as the module docstring says.
- **The roadmap as a record.**
  - The worker's comparison with the merge base reports 0 headings removed and 0 layers retitled.
  - All 32 deleted lines are reflowed text that the head extends, so no item or id is removed.
  - The new ids 1.5a, 2.6, 3.4a, 4.1a, 4.2a and 4.5a reuse no id.
- **The previous review** raised no finding. Its remark on untouched text, that the *Needs:* line of *quotient-measure* cites its own section AA.2.2, still applies and is not blocking.

Overlap check: read GlobalNumberFields, OrthogonalSpinGroups, QuaternionicModularForms, SurfaceGroupCharacterVarieties and HodgeClassesForJacquetLanglands (open), and OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII and ArithmeticLocallySymmetricSpaces (main). Shared objects and their owners:

- OrbitMeasuresOnAdelicGroups 2.6 and 3.4a (changed here) state clauses of AA 2.6 and 3.4a under *Corollary of:* AA §2.6, naming AA as the owner of the general form; owner AA.
- QuaternionicModularForms' quaternion class sets are a case of AA 4.5a; owner AA.
- GlobalNumberFields leaves Tamagawa measures and strong approximation for algebraic groups to this roadmap; owner AA.
- OrthogonalSpinGroups owns neither: it places the orthogonal Tamagawa and strong-approximation applications in OrthogonalTamagawaAndLatticeMass.
- AutomorphicFormsOnReductiveGroups §7.5a owns the class-set inner product and cites AA §4.5a for the mass.
- MetaplecticAutomorphicForms consumes AA §2.6.
- The other roadmaps share nothing with the new targets.

Source independence: 20 passages compared with 11 sources (Oesterlé ×7, Rapinchuk, Arthur, Borel ×2, Rosengarten ×2, Gordon, Dudas–Michel, CG, Khayutin, Milne, BKT). No wording is shared beyond formulas and standard statements. The closest is the step of 4.1a on functions of tori multiplicative in exact sequences: an English statement of the lemma of Oesterlé, IV 3.2 e), p. 56, about twenty words with the clauses reordered, which the mathematics forces. Largest share: Borel, 52 of 363 locators. Contents compared with Borel's §§1–8: independent (Layer 0 is not in Borel, and Layers 2–4 cut across his §§1, 2, 5 and 8).

Research link: 3.7 is the Siegel-set reduction used by Bakker–Klingler–Tsimerman (2020) for definability and by Orr (2018; Orr–Schnell 2023) for height bounds. 4.6 gives the compact quotients of Khayutin's (2019) CM equidistribution. 5.1 is the `GL₁` case of Calegari–Geraghty (2018). Rests on README 3.7, 4.6 and 5.1 and on the texts read.

## Not verifiable

- [Platonov–Rapinchuk–Rapinchuk] (Theorems 3.60, 3.63, 3.64, 3.71, 5.22, 1.34): the publisher's copy is paywalled.
- [Weil], *Adeles and Algebraic Groups* (2.6, Chapter II §§2.2, 2.4): no open copy.
- [Tate], thesis in Cassels–Fröhlich (3.4a, §§4.3–4.4): the sources service found no legal copy.
- [Ono] (4.1a): JSTOR only.
- [Gross] (4.5a): publisher paywall.
- [Kneser] (4.2a): publisher paywall.
- [Orr–Schnell] (3.7): the msp.org copy is not in an open licence class.
- [BHC] (3.7): Annals, not read.
- [Platonov] (4.2a): cited without a locator, not fetched.

## Source issues

- **Error** in CG (Calegari–Geraghty, arXiv:1207.4224v2) at §8.2, p. 79: the source says `π₀(X_Q)` is the maximal exponent-`p^n` quotient of the ray class group of conductor `Q`; it should be `F^×\𝔸^×/U_Q(F⊗ℝ)^{×,0}`, which maps onto the narrow class group (`Q = ∅`, `h = 3`, `p = 5`: three components, not one); affects a stated result.

## For the human reviewers

- none
