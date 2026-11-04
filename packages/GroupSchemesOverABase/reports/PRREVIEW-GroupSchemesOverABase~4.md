# Review of GroupSchemesOverABase (pull request #1522 at 0b6474b)

**Verdict:** needs changes

Two blocking classes: GS6–GS7 re-plan the relative reductive theory that ReductiveGroups Layer 8 already plans on main, and `Suggested.lean` carries six `sorry`'d data definitions. The gate fails (blob=5, prnum=7, sorry-data=6, readme-ids-missing=7, target-ids=1). The mathematics of GS0–GS5 and GS8 is largely sound; the computed checks are in the table below.

## R01 (P1) — GS6–GS7 re-plan ReductiveGroups Layer 8 and declare this roadmap its producer

Location: `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 21–24 ("the relative reductive theory over an affine Noetherian base commissioned in ReductiveGroups Layer 8 is its specialization to `S = Spec R` and consumes it"), line 67 (ownership row "this roadmap, GS6–GS7"), lines 82–101 (table "What ReductiveGroups Layer 8 consumes"), GS6.1–GS6.7, GS7.1–GS7.3.

Claim: this roadmap produces `IsReductive`, `center`, `derivedSubgroup`, `torusScheme`, `borScheme`, `rootDatumSheaf`, `split_etaleLocally`, `pinned_iso_model`, `autScheme`, `isomTorsor`, `forms_equiv_H1`, and ReductiveGroups Layer 8 consumes them.

Witness: `TauCetiRoadmap/ReductiveGroups/README.md` on main, lines 1028–1060 (Layer 8, bullet "Relative reductive groups over an affine Noetherian base"): it plans, in its own lane, the fibrewise reductive and semisimple predicates on scheme group objects and Hopf presentations, invariance under base change, products and fpqc descent, the relative centre and derived subgroup, central isogenies and simply connected and adjoint forms, the smooth scheme of maximal tori and the smooth projective scheme of Borels, root-datum sheaves, étale-local splitting into a Layer 9 model, the pinned classification over connected bases, the automorphism sheaf, the `Isom(G₀, G)` torsor and the forms-to-`H¹` equivalence, "using Layer 0's dictionaries and the independent Layer 9 split integral models". Every row of the table at README lines 88–101 is a Layer 8 obligation restated here as a GS target. ReductiveGroups is on main and earlier in the merge order: it cannot consume this roadmap, and its text does not cite it. The open revision of ReductiveGroups (its pull request head, lines 2395–2440) even plans the affine-local gluing to an arbitrary `S` and the non-Noetherian finite-presentation comparison; a revision pull request is not a dependency, but it shows the owner is extending its own plan, not handing it over. SchubertGeometry on its open head (line 97) likewise treats "ReductiveGroups Layer 8's Borel scheme" as the owner.

The principle is binding: what another roadmap plans is imported by name and section, never planned again; an extension is "ReductiveGroups, Part II"-style and says where the base roadmap stops (ReductiveGroupsPartII already exists on main, for DVR models).

Repair, tested against the instance: delete GS6.1–GS6.7 and GS7.1–GS7.3 as targets and the two ownership tables (README lines 65–101); under `## Scope and ownership` record that the relative reductive theory, including over `Spec R`, the scheme of maximal tori and the Borel scheme, is ReductiveGroups Layer 8's, cited by section; keep here only what Layer 8 does not state, written as consumption of Layer 8's objects: GS7.4–GS7.6 (relative `𝓛(λ)` and Picard groups of `Bor` over a base) and GS8 (Steinberg map, cross-section, universal centralizer, Grothendieck–Springer) on ReductiveGroups Layer 8's `Bor(G)`, centre and maximal-torus scheme. If the author believes the arbitrary-base globalization is not Layer 8's, the only sanctioned form is a Part II of ReductiveGroups whose introduction says where Layer 8 stops; it is not GS6–GS7 as written.

## R02 (P1) — six `sorry`'d data definitions

Location: `TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean` lines 36 (`baseChange`), 46 (`identityComponent`), 64 (`diagonalizable`), 90 (`diagonalizableHomEquiv`), 175 (`homFunctor`), 199 (`deformationGroup`), each `:= sorry`; every theorem in the file mentions one of them.

Witness: the gate line `sorry-data=6`; the rule "no sorry'd data ... and nothing that mentions one". For `baseChange` the sorry is unnecessary at the pin: a probe with the body `(Over.pullback f).mapGrp` elaborates with no `sorry` (Mathlib `CategoryTheory/Monoidal/Cartesian/Over.lean` line 198 gives `instance : (Over.pullback f).Braided`, `CategoryTheory/Monoidal/Grp.lean` line 599 gives `Functor.mapGrp`), and its elaborated type is `{S S' : Scheme} → (S' ⟶ S) → Grp (Over S) ⥤ Grp (Over S')`, the README's Convention 2. For `diagonalizable`, Tau Ceti `Algebra/AlgebraicGroup/DiagonalizableGroup/Scheme/Basic.lean` line 88 has `DiagonalizableGroup.groupScheme (R) (G : FGCommGrpCat) : Grp (Over (Spec (CommRingCat.of R)))`, so the README's GS1.1 body exists at the pin for finitely generated `M` only; the Lean signature takes an arbitrary `AddCommGroup M`, which Tau Ceti's carrier cannot supply.

Repair: give `baseChange` the body above; give `diagonalizable` the body `(baseChange (specULiftZIsTerminal.from S)).obj (DiagonalizableGroup.groupScheme (ULift ℤ) ⟨Multiplicative M⟩)` with `M` restricted to finitely generated groups (`[Module.Finite ℤ M]` or `FGCommGrpCat`), and say in GS1.1 that `D_S(M)` for non-finitely-generated `M` is not built; delete `identityComponent`, `homFunctor`, `deformationGroup` and the theorems that mention them (README GS0.4, GS3.4 and the GS5 Checks keep the statements), or restate `homFunctor_representable` without a functor only if a real presheaf body is given; restate `diagonalizableHomEquiv` as a theorem (`Nonempty ((D_S M ⟶ D_S N) ≃ (N →+ M))`, or the characterisation through `DiagonalizableGroup.groupSchemeMap`, Tau Ceti line 165), never as a `def`.

## R03 (P2) — GS7.4–GS7.5 consume a SchubertGeometry section that does not exist, from a revision pull request

Location: README line 76 ("S3 and S3P at #1224"), lines 492–496 ("the forgetful map to the Picard group with kernel the restrictions of `X*(G)`, are consumed from S3 (#1224) and not reproved"), line 506 ("SchubertGeometry S3P's ordinary flag Picard group").

Claim: SchubertGeometry S3 (and "S3P") supply the fibre-character equivalence, the forgetful map `Pic^G(G/B⁻) → Pic(G/B⁻)` and its kernel `X*(G)`.

Witness: `TauCetiRoadmap/SchubertGeometry/README.md` on main (headings at lines 30–130) has no section "S3P" and no occurrence of "Pic"; its S3 (lines 46–53) states the associated lines, their tensor, dual, pullback and ampleness laws but not the forgetful map or its kernel. Those appear only at the open head of pull request #1224 (its lines 420–430), which revises an existing roadmap and is therefore never a dependency. The kernel fact GS7.5's exact sequence starts from is thus unowned.

Repair: drop "S3P" and the pull-request number; cite SchubertGeometry S3 (main) for the line laws only; for "two linearisations of one line differ by a character of `G`" and the forgetful map, cite EquivariantIntersectionTheory 1.3 (open head, lines 180–183, a new roadmap, so consumable) or state the kernel `X*(G)` as a GS7.4 target with its proof (`H⁰(G/B⁻, O) = O(S)` and the cocycle).

## R04 (P2) — the GS5.3 inequality for `ρ_ss` is not the one the cited source states

Location: README lines 365–368 (`ρ_ss(s) ≤ ρ_ss(s′)` ... "SGA 3, Exp. X, 8.7") and GS4.4 line 341 (`ρ_ss` = dimension of a maximal torus of `L/R(L)`).

Claim: the semisimple rank is lower semicontinuous under specialization, by SGA 3 X 8.7.

Witness: sga3-10 lines 1493–1512: X 8.7 defines the abelian rank, reductive rank, nilpotent rank and the *semisimple dimension* `d_s` (dimension of the quotient of `V` by its radical), and states `ρ_ab ≤ ρ′_ab`, `ρ_r + ρ_ab ≤ ρ′_r + ρ′_ab`, `d_s ≤ d′_s`, `ρ_n ≥ ρ′_n`, `ρ_u ≥ ρ′_u`; the semisimple *rank* `ρ_s` (sga3-12 lines 74–77) appears in 8.7 only as "continuity of `ρ_s` near a reductive fibre" (line 1522). The README's invariant list has no `d_s`, and the rank inequality is not in the source. Sanity instances I tried (`SL₃ × 𝔾_m` degenerating to `SL₂³`: both reductive of dimension 9 and rank 3, excluded by openness of the reductive locus and constancy of type over a DVR) did not refute it, but no source or route is given.

Repair: add `d_s := dim L/R(L)` to GS4.4 and state `d_s(s) ≤ d_s(s′)` in GS5.3 as the source does; either delete the `ρ_ss` inequality or give it a source and a route (the 8.7 list plus XII 1.7 does not imply it as written).

## R05 (P3) — gate failures and README shape

Location: README lines 73–78 (five `github.com/.../blob/<sha>` links), lines 199, 246, 295, 333, 489, 495, 506 (pull-request numbers), the whole of lines 185–612 (layers as bullet lists `- **GS0.1 ...**`, no `### k.n` subsections, no `*Needs:*` lines, no `### Examples`/`### Dependencies`, no per-definition API bullets and Checks), the missing `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`; lines 25–27 ("Suggested home: `TauCeti/AlgebraicGeometry/GroupScheme/`"), lines 626–634 ("Provenance", local paths `lean/Grothendieck/Folder72.lean`).

Witness: the gate at this head: `blob=5 prnum=7 target-ids=1 ... FAIL`; the rule list in the brief (headings as upstream uses them; cross-roadmap citations by roadmap and section, never a pull-request number; timeless, no local paths).

Repair: remove the blob links and numbers (name roadmap and section: "AlgebraicModuliForArithmeticGeometry §7.9", "FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4", "NeronModelsAndSemistableAbelianVarieties §2.3", "EquivariantIntersectionTheory 1.1"); rewrite each layer as `### k.n` prose targets with `*Needs:*`, API bullets and at least three Checks per definition, `### Examples` and `### Dependencies`; add the four missing sections; delete "Suggested home" and "Provenance".

## R06 (P3) — backticked names claimed as this roadmap's own are not declared

Location: README headline table lines 29–39 and throughout (`exact_diagonalizable`, `characterSheaf`, `multiplicativeTypeEquiv`, `nodalCurve_not_isotrivial`, `torsion_schematicallyDense`, `centralizer_smooth`, `normalizer_quotient_etale`, `quotient_exists`, `chevalley`, `affinization`, `rankInvariants`, `maximalTorus_etaleLocally_iff`, `torusScheme_smooth`, `rank_specialization`, `affine_rank_semicontinuous`, `IsReductive`, `IsSemisimple`, `IsSplit`, `rootDatum`, `steinbergMap`, `regularLocus`, `steinbergSection`, `universalCentralizer`, `grothendieckSpringer`, `pic_group`, `no_simultaneous_resolution`, `lineBundle`, `pic_flag`, `ample_iff`, `borScheme`, `abstractTorus`, `weylGroupScheme`, `chevalley_comm`, `rigidity_finite_eq`, `companion_section`, `a_smooth_iff`, and the seven the gate lists).

Witness: `readme-ids-missing=7` at the gate; a scan of backticked identifiers finds about forty more of this roadmap's own that `Suggested.lean` does not declare (the gate's heuristic reads only API bullets).

Repair: state each fact in prose without the name, keeping a backticked name only for the declarations `Suggested.lean` actually makes.

## R07 (P3) — the GS8 cross-section Check has the wrong sign for the stated `nᵢ`

Location: README line 603 ("`C` is `{[[t, -1],[1, 0]]}`") against line 547 (`nᵢ = x_{αᵢ}(1) x_{−αᵢ}(−1) x_{αᵢ}(1)`) and line 548 (`κ(c) = ∏ x_{αᵢ}(cᵢ) nᵢ`).

Witness: with `x_α(c) = [[1, c],[0, 1]]`, `x_{−α}(c) = [[1, 0],[c, 1]]`, the stated `n = [[1,1],[0,1]]·[[1,0],[−1,1]]·[[1,1],[0,1]] = [[0, 1],[−1, 0]]`, so `κ(c) = x_α(c) n = [[−c, 1],[−1, 0]]` and `C = {[[t, 1],[−1, 0]]}`. ReductiveGroups 9B uses the same convention: `TauCetiRoadmap/ReductiveGroups/README.md` line 598 gives `x_β(c) x_{−β}(−c₋) x_β(c) = [[1 − c c₋, c(2 − c c₋)],[−c₋, 1 − c c₋]]`, which at `c = c₋ = 1` is `[[0, 1],[−1, 0]]`. The displayed set `{[[t, −1],[1, 0]]}` is the cross-section for `n = x_α(−1) x_{−α}(1) x_α(−1) = [[0, −1],[1, 0]]`.

Repair: write `C = {[[t, 1],[−1, 0]]}` (trace `t`, determinant `1`), or change `nᵢ` to `x_{αᵢ}(−1) x_{−αᵢ}(1) x_{αᵢ}(−1)` everywhere, and keep the two-term witness.

## R08 (P3) — padding in `Suggested.lean`

Location: `Suggested.lean` lines 39–41 (`geometricFiber`, used by nothing), 49–54 (two API lemmas about `identityComponent`), 76–86 (`isCommMonObj_`, `isAffineHom_`, `flat_`, `locallyOfFinitePresentation_diagonalizable`: API restating GS1.1), 192–218 (the whole GS5 section: `deformationGroup` and five theorems that mirror the README's GS5 **Checks** paragraph, lines 381–384).

Witness: the rule "declarations that mirror README Checks, API lemmas, examples per definition stay in the README"; the GS5 block is literally the Checks paragraph in Lean. The one-tactic probe could not be run on these because every one mentions a `sorry`'d definition; by reading, each is a definitional property of the intended body.

Repair: delete them from `Suggested.lean`; the README keeps the statements as API bullets and Checks.

## R09 (P3) — generality and locator notes

- GS2.1 cites SGA 3 IX 1.1 for an fppf-local definition; IX 1.1 (sga3-9 lines 11–15) defines multiplicative type fpqc-locally. For finite type the two agree by X 4.5 (sga3-10 lines 716–718), which GS2.2 cites; say so, or define as the source does.
- GS2.5 prose is for geometrically unibranch bases, the Lean (`Suggested.lean` lines 144–147, 152–156) for normal ones through stalks; the docstring should say that geometric unibranchness is not expressible at the pins and the Lean is the normal case.
- GS0.4 prose: "smooth along its identity section" (sga3-6b line 822, VI_B 3.10 (i)); the Lean `identityComponent` requires `[Smooth G.X.hom]` everywhere. If the definition stays as a README target, state the source's hypothesis.
- GS8.2 cites Steinberg 1965 §6 for `O(G)^G ≅ O(T)^W` "on every geometric fibre" for reductive `G` with simply connected derived group; steinberg1965 lines 592–595 (Theorem 6.1 b) is for simply connected semisimple `G`. The reductive case needs the reduction through `G_der × Z⁰ → G`; add it to the route.
- GS8.5's route "birational ... target smooth over `T`, hence normal; Zariski's main theorem" needs `S` normal; the GS8 standing hypotheses allow any `S`. Prove the isomorphism over `ℤ` (both sides flat, EGA IV₄ 17.9.5, ega4-4 lines 3056–3060) and base change, as GS8.4 does.
- GS7.5's divisor computation (`D_α`, degree `δ_{αβ}` on `C_β`, `O(D_α) = 𝓛(ϖ_α)`) over a field is SchubertGeometry S7.1 (main, line 95: the divisor of the extremal section along the codimension-one Schubert variety has coefficient `⟨λ, β^∨⟩`); cite it rather than reprove it, and keep only the base-`S` extension GS7.6.
- GS1.1's "`D_ℤ(M)` is Tau Ceti's `DiagonalizableGroup.groupScheme`" holds for finitely generated `M` only (Tau Ceti takes `FGCommGrpCat`); the prose "of finite presentation when `M` is finitely generated" suggests a larger carrier that nothing supplies.

## R10 (P3) — consumer claims and short names in the ownership table

Location: README line 78 and lines 333–334 ("NeronModels §2.3 (#852) applies it ... `chevalley_comm` identifies its decomposition with this theorem, which §2.3 consumes"); line 246 ("FiniteFlatGroups R07.1.4"), line 333 ("NeronModels §2.3").

Witness: NeronModelsAndSemistableAbelianVarieties at its open head, lines 44–47: the commutative Chevalley decomposition is its own 2.3, "while the theorem for noncommutative groups and its comparison with 2.3 are GroupSchemesOverABase GS4.2's, from which nothing is consumed here"; it is earlier in the merge order, so it cannot consume this roadmap. The resolver finds no roadmap "FiniteFlatGroups" or "NeronModels" (the citation report lists both).

Repair: say that GS4.2 states the general theorem and owns the comparison `chevalley_comm` with NeronModelsAndSemistableAbelianVarieties 2.3, which consumes nothing; use full roadmap names everywhere.

## R11 (P3) — module docstring is not in acceptance-test form

Location: `Suggested.lean` lines 3–18.

Witness: it says the file "is not exhaustive", "suggest[s] Lean forms for particular milestones", and that field-predicate milestones "stay in the README until their carriers can be imported"; it does not name which headline theorems are not statable at the pins and what each lacks (Chevalley's theorem: a quotient of a group scheme over a field; `characterSheaf`/`multiplicativeTypeEquiv`: étale sheaves on `S`; GS6–GS8: the relative reductive carriers of ReductiveGroups Layer 8, root spaces over a base, `Bor(G)`).

Repair: the form "<title>: target signatures" with the statement that the file states the headline theorems against the pinned APIs, and the list of non-statable headlines with the missing carrier of each.

## Verified sound

**Gate and build.** `lake env lean TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean` at the pins: 24 `declaration uses sorry` warnings and nothing else (the worker's `build (1)` line was the toolchain's "consider adding `module`" notice; my re-run of the full gate shows no build item). Dependency check: `depcheck: 205 roadmaps, 1660 edges, 0 problem(s)`, no UPWARD or CYCLE line for this roadmap (it is last in the merge order, line 374; every cited roadmap is on main or earlier: AlgebraicModuliForArithmeticGeometry 32, AbelianSchemesAndArithmeticModuli 41, FiniteFlatGroupsAndIntegralPadicHodgeTheory 46, NeronModelsAndSemistableAbelianVarieties 47; ReductiveGroups, ReductiveGroupsPartII, ChevalleyGroups, SchubertGeometry, ModularCurves, SchemeAndStackFoundations, RepresentationTheory/RootSystems on main; EquivariantIntersectionTheory is a new roadmap in an open pull request, consumable). Signatures: the 32 elaborated types in the worker's `signatures.md` agree with the README statements where the README states one (ConnectedSpace carries Nonempty, so GS1.2's "connected and nonempty" matches `diagonalizableHomEquiv`; `smooth_rootsOfUnity_iff` carries `[NeZero n]`, which excludes `μ_0 = 𝔾_m`).

**Cross-roadmap citations resolved (12).** ReductiveGroups Layer 8 (main lines 1023–1060), 9B (1610–1657, `n_{α_i}(1) = x_{α_i}(1) x_{-α_i}(-1) x_{α_i}(1)` at 548), Layer 3 (234), Layer 7 (627); ReductiveGroupsPartII RG2.0a (943), RG2.3.1 (393), `IntegralModel.SmoothModel.IsReductive` (238), `SmoothModel.identityComponent` (3819); ChevalleyGroups `DynkinType.chevalleyGroupScheme` (68, 271); ModularCurves 0B–0F (280–412); SchemeAndStackFoundations §§0.6, 0.9, 1.13, 1.15, 1.16, 1.17, 2.3, 2.9, 2.11, 3.4 (678–4789); RepresentationTheory/RootSystems `DynkinType.simplyConnectedRootDatum` (377); AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion` (open head line 9807: locally Noetherian `B`, quasi-separated `P`, smooth of locally constant dimension); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 `multiplicativeTypeRigidity` (open head line 805); NeronModelsAndSemistableAbelianVarieties 2.3 (open head line 1142); EquivariantIntersectionTheory 1.1 (open head line 157, `G`-linearised invertible sheaves and `Pic^G`); SchubertGeometry S3 and Conventions (main 7–16, 46–53: flags `G/B⁻`, `f(gb) = λ(b)⁻¹ f(g)`, `(g·f)(x) = f(g⁻¹x)`, degree `⟨λ, α_i^∨⟩`, as Convention 6 says).

**Library declarations opened at the pins (13).** Mathlib: `hopfSpec` (`AlgebraicGeometry/Group/Affine.lean` 177, `(CommHopfAlgCat R)ᵒᵖ ⥤ Grp (Over (Spec R))`), `hopfSpec.fullyFaithful` (187), `essImage_hopfSpec` (482, affine), `Functor.mapGrp` (`CategoryTheory/Monoidal/Grp.lean` 599), `(Over.pullback f).Braided` (`CategoryTheory/Monoidal/Cartesian/Over.lean` 198), `grpObjMkPullbackSnd` (304), `CartesianMonoidalCategory (Over S)` for schemes (`AlgebraicGeometry/Pullbacks.lean` 709), `smooth_of_grpObj` (`Group/Smooth.lean` 63, needs `GeometricallyReduced`), `specULiftZIsTerminal` (`Limits.lean` 50), `fromSpecResidueField` (`ResidueField.lean` 237), `RootDatum` (`LinearAlgebra/RootSystem/Defs.lean` 111, an abbreviation for `RootPairing ι ℤ X₁ X₂`). Tau Ceti: `DiagonalizableGroup.groupScheme` and `groupSchemeMap` (`Algebra/AlgebraicGroup/DiagonalizableGroup/Scheme/Basic.lean` 88, 165), `FGCommGrpCat` (`Algebra/Category/CommGrpCat/FiniteGeneration.lean` 54), and the existence of `reductiveCommHopfAlgPropertyOver`, `IsBorelOver`, `SplitMaximalTorus`, `Pinning`, `IsPositiveRoot` (`Algebra/AlgebraicGroup/Pinning/Basic.lean`), `multiplicativeTypeCommHopfAlgProperty`, `torusCommHopfAlgProperty`, `splitTorusCommHopfAlgProperty`, `IsMaximalTorus`, `IsBorel`, `MultiplicativeTypeAffineGroupSchemeCat`, `CartierDuality/Constant.lean`, `MultiplicativeType/GaloisModule.lean`, `Fppf/Quotient/`, `AlgebraicGeometry/AbelianVariety`. Ownership against open pull requests was checked by object with the roadmap grep (isotrivial, Steinberg map and cross-section, Grothendieck–Springer, universal centralizer, scheme of Borels, multiplicative type over a base, Picard groups of reductive groups and flags): no second owner of GS0–GS5 or GS8; GS6–GS7 see R01.

**Seeded sample of locators (17 verified against the text).**

| Target | Source | Result |
| --- | --- | --- |
| GS0.4 identity component, no Noetherian hypothesis | sga3-6b lines 808–826 (Prop. 3.9: `G⁰ → G` open immersion, `G⁰` quasi-compact over `S`; Thm 3.10 (i)⇔(iv)) | correct; hypothesis is "smooth at the points of the unit section" |
| GS2.1 definition | sga3-9 lines 11–28 (Déf. 1.1) | fpqc-local, not fppf (R09); isotrivial = finite étale surjective `S' → S` with `G_{S'}` diagonalizable, as the Lean |
| GS2.2 quasi-isotriviality | sga3-10 lines 716–718 (Cor. 4.5) | correct |
| GS2.5 isotriviality | sga3-10 lines 1039–1045 (Thm 5.16), 1063–1064 (N.D.E. 46: "normal" replaced by "géométriquement unibranche") | correct, including the editorial remark and "on peut supposer `S` connexe" |
| GS2.6 non-isotrivial torus | sga3-10 lines 89–113 (1.6: nodal curve, connected étale `ℤ`-torsor, `ϕ(n) = [[1, n],[0, 1]]`, relative dimension 2) | correct |
| GS3.4 Hom schemes | sga3-11 lines 819–821 (Cor. 4.2: `G` smooth affine, `H` multiplicative type of finite type ⇒ representable, smooth, separated) | correct |
| GS3.5 centralizers | sga3-11 lines 1046–1048 (Cor. 5.3: closed smooth subgroup) | correct |
| GS5.4, GS5.2 | sga3-12 lines 124–135 (Thm 1.7 a, b: `G` affine smooth; `ρ_r` lower, `ρ_n` upper semicontinuous; étale-local maximal torus iff `ρ_r` locally constant) | correct |
| GS5.3 | sga3-10 lines 1493–1515 (Rem. 8.7) | the inequality list is for `d_s`, not `ρ_ss` (R04); the others match |
| GS6.1 | sga3-19 lines 470–474 (Déf. 2.7), conrad-rgs lines 3334–3338 (Def. 3.1.1) | correct (smooth affine, connected reductive geometric fibres) |
| GS6.2 | conrad-rgs 3868–3876 (Thm 3.2.6: quasi-affine `Tor`, `G/N_G(T) ≅ Tor`), 4072–4075 (Thm 3.3.4: centre of multiplicative type, flat, kernel of the action on `Tor`), 6685–6691 (Thm 5.3.1); sga3-19 956–959 (Prop. 6.1) | correct |
| GS6.4, GS7.1–7.2 | sga3-22 lines 157 (Déf. 1.13), 245–247 (Cor. 2.3), 2042–2049 (Cor. 5.8.3: `Tor`, `Bor`, `Kil` smooth of finite presentation, `Bor` projective) | correct |
| GS6.5–6.6 | sga3-23 973–978 (Thm 4.1), sga3-25 20–26 (Thm 1.1, Cor. 1.2), conrad-rgs 8159–8165 (Thm 6.1.16), 8173–8181 (Thm 6.1.17), 9761–9769 (Ex. 6.5.2) | correct, including "unique up to `(T/Z_G)(S)`" |
| GS6.7 | sga3-24 115–124 (Thm 1.3), conrad-rgs 10164–10171 (Thm 7.1.9) | correct: `1 → G/Z_G → Aut → Out → 1`, `Out` étale locally constant, split by a pinning |
| GS4.1 | fga3 lines 560–573 (Thm 7.2: Artin base, `F` flat, finite kernel) | correct |
| GS4.2 | conrad-chevalley lines 81–86 (Thm 1.1), 67–77 (conventions: algebraic group = smooth connected) | correct, including base change to perfect extensions |
| GS8.3, GS8.4, GS8.5 | steinberg1965 lines 42–43 (1.1), 61–64 (1.3: codimension 3), 77–82 (1.4: `N = X₁σ₁ ⋯ X_rσ_r`), 592–595 (6.1 b), 770–772 (7.1), 842–843 (7.9), 928–932 (8.1) | correct; 6.1 is for simply connected semisimple `G` (R09) |
| GS8.4, GS8.4a | ega4-4 lines 3056–3060 (17.9.5), ega4-3 lines 5571–5580 (11.3.10), conrad-rgs 11841–11844 (Lemma B.3.1) | correct |

**Adversarial table** (values computed on each side; "ok" means the computation agrees with the statement).

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `baseChange` (Convention 2) | identity `f = 𝟙 S`; probe body `(Over.pullback f).mapGrp` | elaborated type `Grp (Over S) ⥤ Grp (Over S')`, no sorry | real body exists | R02 |
| `smooth_rootsOfUnity_iff` | `n = 1`: `μ_1 = D(ℤ/1) = S`; `n = 2` over `𝔽_2`; `n = 0` | `n=1`: both sides true; `n=2`, `𝔽_2`: `μ_2` infinitesimal, `2 = 0` in `𝔽_2`, both false; `n=0`: `ZMod 0 = ℤ`, `μ_0 = 𝔾_m` smooth but `0 ≠ 0` false, excluded by `[NeZero n]` | ok | none |
| `diagonalizableHomEquiv` | `S = ∅` | `Hom(D M, D N)` a singleton, `N →+ M` not; `ConnectedSpace` includes `Nonempty`, excludes it | ok | none |
| GS1.2 general `S` | `S = Spec k ⊔ Spec k` | `Hom = Hom(N,M)²`, locally constant functions as stated | ok | none |
| `IsIsotrivial`, `IsMultiplicativeType.isotrivial` | `S = Spec k ⊔ Spec k`, `G = 𝔾_m ⊔ 𝔾_m²` | any finite étale surjective `S'` splits over both points with ranks 1 and 2, no single `M`: not isotrivial, matches the docstring; `S` disconnected is excluded by `[ConnectedSpace S]`; `S = ∅` makes everything true, excluded | ok | none |
| `isotrivial_component` | `U = ∅` | excluded by `[ConnectedSpace U]` | ok | none |
| `IsMultiplicativeType` vs IX 1.1 | finite type `G` | fppf-local ⇔ fpqc-local ⇔ étale-local by X 4.5 | equivalent, locator imprecise | R09 |
| `hom_eq_of_eq_fibre` | `S` connected, `φ, ψ : H → H'` agreeing on `Spec κ(s)` | equaliser of two sections of the étale separated `Hom(H,H')` is clopen and contains `s`, hence `S` | ok | none |
| GS3 Check (subtori of `GL₂` over `𝔸¹`) | `t ↦ diag(t,1)` and its conjugate by `[[1,a],[0,1]]` | equal at `a = 0`, differ for `a ≠ 0`; tangent space of `{g² = 1}` at `diag(1,−1)`: `X` with `g₀Xg₀⁻¹ = −X`, the off-diagonal plane, dimension 2 | ok | none |
| `homFunctor_representable_etale` | `H = H' = 𝔾_m`, `S` connected | `Hom = ℤ_S`, étale separated | ok | R02 (sorry'd functor) |
| `not_isMultiplicativeType_deformationGroup_zero` | `λ = 0`, `S = Spec k` | `G^(0) = 𝔾_a`, not fppf-locally `D(M)` | ok | R08 |
| `deformationGroup_basicOpen` | `λ` a unit | `t ↦ 1 + λt` inverse `u ↦ λ⁻¹(u − 1)`, law `(1+λt₁)(1+λt₂) = 1 + λ(t₁ + t₂ + λt₁t₂)` | ok | R08 |
| GS4.4 Checks | elliptic curve; `𝔾_m`; `𝔾_a`; `GL_n` | `(dAff, ρ_ab, ρ_r, ρ_n, ρ_n^aff, ρ_u, ρ_ss) = (0,1,0,1,0,0,0)`, `(1,0,1,1,1,0,0)`, `(1,0,0,1,1,1,0)`, `(n²,0,n,n,n,0,n−1)` | ok | none |
| GS4.4 vs X 8.7 | `ρ_u` | `dim Z_G(T) = dim Z_L(T) + ρ_ab` (since `G = L·N_G(T)`), so `ρ_n^aff − ρ_r = ρ_n − ρ_r − ρ_ab`, the source's `ρ_u` | ok | none |
| GS4.4 `ρ_ss` vs X 8.7 `d_s` | `GL_n` | `ρ_ss = n − 1`, `d_s = n² − 1` | different invariants | R04 |
| GS5.5 | `A/ℤ_p`, class `p·ω` | generic: class `≠ 0` in characteristic 0, anti-affine, `(G_η)_affq = 1`; special: class `0`, `G_s = A_s × 𝔾_a`, `O(G_s) = k[t]`; `dAff = 1` both | ok | none |
| GS5 Check `G^(p)` over `ℤ_p` | `ρ_r`, `ρ_u`, maximal torus | generic `𝔾_m`: `(1,0)`; special `𝔾_a`: `(0,1)`; a torus over `Spec ℤ_p` has constant rank, so none is maximal on both fibres | ok | none |
| GS6.6 `centralQuotient_iso_model` | `GL₂`; `SL₂`; `Φ = ∅` | `GL₂`: `X = ℤ²`, `X ∩ ℚΦ = ℤ(1,−1)`, map `(a,b) ↦ (a−b, a+b)`, cokernel `ℤ/2`, `K = μ₂`; `SL₂`: cokernel `0`; `Φ = ∅`: `G_R = D(X)` | ok | none |
| Convention 6 sign | `SL₂`, `μ = ϖ` | `h(g) = f(g n₀⁻¹)` satisfies `h(gb⁺) = (w₀λ)(b⁺)⁻¹ h(g)`; `B⁺`-line of `−ϖ` is `O(1)` on `SL₂/B⁺` | ok | none |
| GS7.5 degrees, `Pic(G)` | `SL₂`, `PGL₂`, `GL_n` | `𝓛(ϖ)` degree `⟨ϖ, α^∨⟩ = 1 = O(1)`; `P/X*(T_der)`: `0`, `ℤ/2`, `0` (for `GL_n`, `X*(T_der) = ℤ^n/ℤ(1,…,1) = P`) | ok | none |
| GS7.5 `D_α` | `C_β ∩ D_α` | `C_β = {u_β(c)B⁻} ∪ {s_βB⁻}`, the first in the big cell, `s_βB⁻ ∈ B⁺s_βB⁻ ⊆ D_β` only (Bruhat closure order `s_β ≥ s_α ⇔ α = β`) | ok; duplicates SchubertGeometry S7.1 | R09 |
| GS7.6 | `S` normal, `U⁺ ≅ 𝔸^N_S` | `Pic(𝔸^N_S) = Pic(S)`, Cartier divisors supported on `⋃D_α` are `Σ n_α D_α` on the normal `G/B⁻`; `n_α` read off on root curves | ok | none |
| GS8.1 polynomial ring | `GL₂`; general `X ⊇ X*(G)` with `X/X*(G) = P` | `ℤ[x^{±1}, y^{±1}]^{S₂} = ℤ[(xy)^{±1}][x + y]`; in general orbit sums of lifted fundamental weights are triangular with unit leading coefficients in `ℤ[X*(G)]` | ok (even though `X ≠ X*(G) ⊕ P` `W`-equivariantly: for `GL₂` the splitting needs `½(1,1)`) | none |
| GS8.2 | reductive `G` with simply connected derived group | Steinberg 6.1 b) is for semisimple simply connected; `GL_n` holds (`ℤ[c_1,…,c_{n−1}, det^{±1}]`), the reduction step is missing | gap in route | R09 |
| GS8.4 cross-section | `SL₂`, `n = x_α(1)x_{−α}(−1)x_α(1)` | `n = [[0,1],[−1,0]]`, `κ(c) = [[−c, 1],[−1, 0]]`, trace `−c`, det `1`; README's `[[t,−1],[1,0]]` is for `n = [[0,−1],[1,0]]` | Check wrong sign | R07 |
| GS8.4 central torus | `SL₂ × 𝔾_m` | `dim C = 1`, `dim T/W = 2` | not a section, as stated | none |
| GS8.4a | `u = [[1,1],[0,1]]` in `SL₂`, characteristic 2 | centralizer `{[[a,b],[0,a]] : a² = 1}`, ring `k[a,b]/((a−1)²)`, nilpotent `a − 1`; characteristic 0: `k[a,b]/(a²−1)` reduced | ok | none |
| GS8.4a fibre product | `((g,c), c')` with `a(g,c) = σ(c')` | `χ∘a = pr₂`, `χ∘σ = id` force `c = c'` scheme-theoretically | ok | none |
| GS8.5 Checks | `SL₂`: regular semisimple `x`, regular unipotent `u`, `±1` | fibre of `G ×_{T/W} T`: `{t, t⁻¹}`; `t + t⁻¹ = 2 ⇔ (t−1)² = 0`, length 2; `±1`: `ℙ¹` | ok | none |
| GS8.6 | `S` regular, `G` smooth with connected fibres | kernel of `Cl(G) → Cl(G_η)` spanned by `G_s = π*(s)`, `s` of codimension 1; retraction by the unit section | ok | none |
| GS8.7 | `G = T` a torus | `steinbergMap = id` smooth, `X̃ = G` is a resolution: the hypothesis "positive semisimple rank" is needed and present | ok | none |
| GS0 Check `μ_2/ℤ` | fibres | over `2`: `𝔽_2[x]/(x−1)²` connected; generic: two points | ok | none |
| GS2 Checks | `D(ℤ/2)` over `ℤ[1/2]`, over `𝔽_2`; `R¹_{ℂ/ℝ}𝔾_m` | constant `ℤ/2`; `𝔽_2[x]/(x−1)²` not étale; `X* = ℤ` with conjugation `−1`, non-split | ok | none |

## Not verifiable

- Sansuc 1981 §6 and Popov 1974 §4 (GS7.5): Crelle 327 is behind a publisher paywall; the Göttingen digitisation page resolves to a volume landing page, not the article text; the Russian original of Popov on mathnet was not consulted. Cited by locator only (uncertified). The exact sequence was checked on `SL₂`, `PGL₂`, `GL_n` instead.
- Milne 2017 Chapter 12, Jantzen 2003 (I.5.8, II.1.8, II.2.1, II.2.6, II.4.4), Demazure–Gabriel III §3 5.4 and 8.2, Bourbaki Lie VI §3 no. 4 Thm 1, Slodowy LNM 815 ch. 3–4: no legal open copy; cited by locator (uncertified). Jantzen's conventions were checked against SchubertGeometry's statement of them; Bourbaki's theorem was checked by the `GL₂` computation above.
- SGA 3 Exp. VIII (GS1.2, GS1.4) and XIV, XV (GS5.2, GS5.3): the editors' page carries them, but the re-edition of Exp. VIII is a 2009 preprint whose numbering may differ from LNM 152; not read.
- The fetches recorded entries in the board manifest for this package (`conrad-rgs`, `conrad-chevalley`, `steinberg1965`, `fga3`, `sga3-6b`, `sga3-9`, `sga3-10`, `sga3-11`, `sga3-12`, `sga3-19`, `sga3-22`, `sga3-23`, `sga3-24`, `sga3-25`, `ega4-4`, `ega4-3`); `sga3-1` (a wrong URL) is in `needs-references.toml` and `sansuc1981` points to a landing page: the worker may drop both.

## Source issues

- none
