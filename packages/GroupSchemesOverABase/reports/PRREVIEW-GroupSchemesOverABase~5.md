# Review of GroupSchemesOverABase (pull request #1522 at 72ebe87)

**Verdict:** needs changes

The eleven findings of the previous review are repaired (the check is finding by finding below). The gate passes, `lake env lean` gives only the 15 `sorry` warnings, the dependency check shows no UPWARD or CYCLE line, and the 23 elaborated signatures agree with the README. What remains is one overlap defect with an open revision of SchubertGeometry (P2 by the overlap rule) and eight P3 items: two false Checks (the Galois action on `X*(μ_n)` in 2.4, and the characteristic-`p` anti-affine claim in 5.5), a missing hypothesis in the 0.2 comparison, citations without a section, three old ids that other roadmaps still cite, a missing route for the `d_s` inequality, and two wording slips in Checks.

## Repairs of the previous review (0b6474b)

- R01 (GS6–GS7 re-plan ReductiveGroups Layer 8): repaired. The Scope now says "ReductiveGroups Layer 8 … owns the relative reductive theory … This roadmap states none of these and builds Layers 6–7 on them" (README lines 46–54); Layers 6–7 consume `Bor(G)`, central isogenies and 9B's models (lines 148–151) and state only the line bundles, Picard groups, Steinberg map and Grothendieck–Springer space.
- R02 (six `sorry`'d data definitions): repaired. `baseChange` is `(Over.pullback f).mapGrp` (Suggested.lean line 72), `diagonalizable` is the base change of Tau Ceti's `groupScheme` with `[AddGroup.FG M]` (lines 92–96), `identityComponent`, `homFunctor`, `deformationGroup` are gone, and the Hom equivalence is the theorem `bijective_diagonalizableMap` (line 112). Gate: `sorry-data=0`.
- R03 (SchubertGeometry "S3P" from a revision): repaired. 6.1–6.2 cite EquivariantIntersectionTheory 1.1 and 1.3 and SchubertGeometry S3 (lines 737–747, 758–769); no pull-request number remains (`prnum=0`). The remaining overlap with #1224 is R01 below.
- R04 (`ρ_ss` inequality not in the source): repaired. 4.4 defines "the semisimple dimension `d_s = dim L/R(L)`" (line 619) and 5.3 states `d_s(s) ≤ d_s(s′)` (line 674), the list of sga3-10 lines 1507–1512.
- R05 (gate failures and shape): repaired. Gate line at this head: every check passes; the README has `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `### k.n` prose targets with `*Needs:*`, Checks, `### Examples`, `### Dependencies`, `## Downstream consumers`, `## References`.
- R06 (undeclared backticked names): repaired. `readme-ids-missing=0`; each of the 23 names the README backticks as its own is declared in Suggested.lean (list under Verified sound).
- R07 (cross-section sign): repaired. Line 874: "`κ(c) = [[−c, 1], [−1, 0]]`, so `C = {[[t, 1], [−1, 0]]}`", the value I recompute below.
- R08 (padding): repaired. `geometricFiber`, the `identityComponent` API lemmas, the four `diagonalizable` API lemmas and the whole GS5 block are gone; the file has 23 declarations, none mirroring a Check.
- R09 (locators and generality): repaired. 2.1 says IX 1.1 uses fpqc covers and that the notions agree for finite type by X 4.5 (lines 347–348); the 2.5 docstring says "there for geometrically unibranch bases" (Suggested.lean line 190); 0.2 says the source needs smoothness "only along the unit section" (line 214); 7.2 reduces through `G_der × Z⁰ → G` (lines 824–826); 7.6 proves the isomorphism over `ℤ` with a smooth, hence normal, target (lines 913–916); 6.2 cites SchubertGeometry S7.1 for the divisor (line 764); 1.1 is for finitely generated `M` (line 242).
- R10 (consumer claims, short names): repaired. Lines 975–976 say NeronModelsAndSemistableAbelianVarieties "consumes nothing"; full roadmap names throughout.
- R11 (module docstring): repaired. Lines 7–52 list the stated headlines by target and name, then "Not statable at the pins, with the carrier each lacks".

## R01 (P2) — SchubertGeometry S3.1 and S7.1 are dropped by the open revision #1224

Location: `TauCetiRoadmap/GroupSchemesOverABase/README.md` line 72 ("and S7.1 the divisor of the normalized extremal section"), line 170–171 (supplier contract "S7.1, the divisor of the normalized extremal section (6.2)"), line 743 ("(SchubertGeometry S3.1; Jantzen, II.4.4)"), line 764 ("(SchubertGeometry S7.1 at `w = w₀`)"), line 768 ("*Needs:* … SchubertGeometry S7.1"), line 800.

Claim: SchubertGeometry S3.1 supplies the ampleness criterion and S7.1 the divisor of the normalized extremal section.

Witness: on main, `TauCetiRoadmap/SchubertGeometry/README.md` has `## S3.` and `## S7.` with numbered items (lines 46–53, 93–98), so S3.1 and S7.1 are their first items and the content matches (ampleness for strict positivity on the simple roots; divisor along `X(v)`, `v = w s_β`, with coefficient `⟨λ, β^∨⟩`). At the head of pull request #1224 (another author's revision of SchubertGeometry) the same content sits under `### 3.1 Associated lines and their fibres` (its line 398) and `### 7.1 Divisor valuations` (line 930) inside `## Layer 3 … (S3)` and `## Layer 7 … (S7)`; the ids `S3.1` and `S7.1` are no longer headings there, which is what the overlap report lists. The ids `S3` and `S7` resolve at both heads.

Repair: cite the level that resolves on main and at that head: "SchubertGeometry S3, first item (ampleness for strict positivity on the simple roots)" at line 743 and "SchubertGeometry S7, first item (the divisor of the normalized extremal section along `X(w s_β)` has coefficient `⟨λ, β^∨⟩`)" at lines 72, 170–171, 764, 768 and 800. Citing #1224's numbering instead would make a revision a dependency, which the brief forbids.

## R02 (P3) — the 2.4 Check gives `X*(μ_n)` a non-trivial Galois action

Location: README line 403 ("`μ_n` over `ℚ` corresponds to `ℤ/n` with `Gal(ℚ̄/ℚ)` acting through the cyclotomic character").

Claim: under the anti-equivalence of 2.4 the character module of `μ_n` carries the cyclotomic action.

Witness: `μ_{n,ℚ} = D_ℚ(ℤ/n)` by Convention 3, so it is diagonalizable, and 2.3 (line 383, "For `S` connected, `H` is diagonalizable iff `X*(H)` is constant") and the 2.3 Check `X*(μ_n) = (ℤ/n)_S` (line 388) say its character sheaf is constant: the Galois action on `X*(μ_n) = Hom(μ_n, 𝔾_m)` is trivial, since the generator, the inclusion `μ_n ↪ 𝔾_m`, is defined over `ℚ`. Computed on `n = 3`: `σ·ι = σ ∘ ι ∘ σ⁻¹ = ι` for every `σ`. The cyclotomic character acts on the points `μ_n(ℚ̄)`, the Galois module of the Cartier dual `(ℤ/n)(1)`, which Tau Ceti's `MultiplicativeType/GaloisModule.lean` treats as the contragredient (cocharacter) side. The Check contradicts 2.3's own Check and would be a non-example of 2.3's criterion.

Repair: write "`μ_n` over `ℚ` corresponds to `ℤ/n` with trivial action, being diagonalizable; the cyclotomic character is the action on the points `μ_n(ℚ̄)`, that is on the Cartier dual `(ℤ/n)(1)`, not on `X*(μ_n)`", and keep the norm-one torus as the non-split example. Also cite X 1.4 beside X 1.2 at line 397–398: the field statement is the consequence drawn after 1.4 (sga3-10 lines 64–67).

## R03 (P3) — the 5.5 Check claims an anti-affine extension by `𝔾_a` in characteristic `p`

Location: README line 716 ("With class `ω` instead of `p·ω`, `(G_s)_affq = 1` as well").

Claim: the extension of `A_s` by `𝔾_a` with class `ω̄ ≠ 0` has `O(G_s) = k`.

Witness: in characteristic `p` no extension of an abelian variety by `𝔾_a` is anti-affine (Brion, anti-affine groups in positive characteristic are semi-abelian). Computed: `G_s` is a `𝔾_a`-torsor over `A_s` with fibre coordinate `t_i = t_j + c_{ij}`, `[c] = ω̄`; for an additive polynomial `P(t) = Σ a_k t^{p^k}` the functions `P(t_i) + b_i` glue iff `Σ a_k F^k(ω̄) = 0` in `H¹(A_s, O)`, `F` the `p`-linear Frobenius. Since `dim H¹(A_s, O) = g`, the `g + 1` vectors `ω̄, F ω̄, …, F^g ω̄` are dependent, so a nonzero `P` exists and `O(G_s) ∋ P(t) + b` is not `k`. For an elliptic curve with Hasse invariant `h`: `P = t^p − h t` (supersingular: `P = t^p`), and `(G_s)_affq ≅ 𝔾_a`. The jump of 5.5 therefore happens for every class; `p·ω` only makes `G_s` split.

Repair: replace the Check by "In characteristic `p` no extension of `A_s` by `𝔾_a` is anti-affine: with class `ω̄ ≠ 0`, the additive polynomial `P` with `P(ω̄) = 0` in `H¹(A_s, O)` gives a nonconstant function `P(t) + b`, so `(G_s)_affq ≠ 1` for every class, and `p·ω` is chosen to make `G_s = A_s × 𝔾_a`"; the class `0` and `ρ_ab` Checks stay.

## R04 (P3) — the 0.2 comparison with AlgebraicModuliForArithmeticGeometry §7.9 drops its quasi-separatedness hypothesis

Location: README lines 216–217 ("Over a locally Noetherian base, `G⁰` represents the identity-component subfunctor of AlgebraicModuliForArithmeticGeometry §7.9 applied to `G` as a group algebraic space").

Claim: §7.9 applies to every smooth `G` over a locally Noetherian `S`.

Witness: AlgebraicModuliForArithmeticGeometry §7.9 at its open head (line 9794): "`B` locally Noetherian and `P` a quasi-separated group algebraic space locally of finite presentation over `B`" with geometric identity components smooth of locally constant dimension. Smoothness gives local finite presentation and smooth components, and the relative dimension at the unit section is locally constant on `S`, but 0.2 and the Lean statement (`[Smooth G.X.hom]` only) admit a `G` that is not quasi-separated, which §7.9 excludes.

Repair: write "Over a locally Noetherian base and for `G` quasi-separated, `G⁰` represents …" (SGA 3's VI_B 3.9–3.10, the statement proper, needs no such hypothesis, as the text says).

## R05 (P3) — AbelianSchemesAndArithmeticModuli is cited without a section

Location: README lines 70 ("owns abelian schemes and their Tate modules (5.3, 5.5)"), 167–168 ("Abelian schemes and the prime-to-characteristic Tate module (5.3, 5.5)"), 681–682 ("*Needs:* … AbelianSchemesAndArithmeticModuli."), 712, 728.

Witness: the rule "Cross-roadmap citations name the roadmap and its section or target"; every other supplier in the README carries one. At the open head of AbelianSchemesAndArithmeticModuli the carrier is `### A0.1 Abelian schemes` (its line 589) and the Tate module is `### A4.1 The integral Tate module` (line 1822: `AbelianTate A ℓ` for `ℓ` invertible on `S`, a lisse `ℤ_ℓ`-sheaf of rank `2g` with the `π₁`-action).

Repair: cite "AbelianSchemesAndArithmeticModuli A0.1 (abelian schemes) and A4.1 (the `ℓ`-adic Tate module, `ℓ` invertible on `S`)" in the five places.

## R06 (P3) — 1.1 re-constructs the diagonalizable group that ModularCurves 0B builds for finite `M`

Location: README lines 242–248 (1.1) and 61–62 (Scope: "ModularCurves 0B owns finite locally free group schemes and their Cartier duality").

Witness: `TauCetiRoadmap/ModularCurves/README.md` on main, lines 317–321: 0B constructs "the diagonalizable group scheme `D_S(M) = Spec_S 𝒪_S[M]`, `μ_N = D_S(ℤ/Nℤ)`" for finite `M`. 1.1 builds `diagonalizable S M` for every finitely generated `M` from Tau Ceti's carrier and compares it with Tau Ceti over `Spec R` (line 247) and with SchemeAndStackFoundations §2.9 (1.4), but not with 0B's object, which 1.5 then uses for the Cartier dual.

Repair: add to 1.1 "for finite `M`, `diagonalizable S M` is ModularCurves 0B's `D_S(M)`, and `μ_{n,S}` its `μ_n`", and list that comparison in the Scope line for 0B. No change to `Suggested.lean`.

## R07 (P3) — three old ids of this roadmap are cited by other roadmaps with no old → new line

Location: README lines 970–978 (`## Downstream consumers`).

Witness: `TauCetiRoadmap/FlagVarieties/README.md` on main, line 19: "GroupSchemesOverABase GS7 owns relative `Bor(G)`"; NeronModelsAndSemistableAbelianVarieties at its open head, line 47: "GroupSchemesOverABase GS4.2's"; SpringerResolutionAndCharacteristicCycles at its open head, line 10: "GroupSchemesOverABase GS8.5 constructs the multiplicative Grothendieck–Springer space". None of GS7, GS4.2, GS8.5 exists at this head (the targets are now ReductiveGroups Layer 8 with Layer 6 here, 4.2, and 7.6). The Downstream consumers paragraph describes FlagVarieties and NeronModels without naming the ids and omits SpringerResolutionAndCharacteristicCycles.

Repair: add one line per moved id: "GS4.2 → 4.2", "GS7 → `Bor(G)` is ReductiveGroups Layer 8's; the line bundles and Picard groups on it are Layer 6", "GS8.5 → 7.6 (cited by SpringerResolutionAndCharacteristicCycles, which owns the additive `g̃`)".

## R08 (P3) — 5.3 gives no route for the inequality `d_s(s) ≤ d_s(s′)`

Location: README lines 673–682.

Claim: `d_s` is lower semicontinuous along specialization.

Witness: the locator (sga3-10 lines 1501–1515) states the five inequalities without proof and says the seminar proves only the `ρ_r`, `ρ_n`, `ρ_u` cases for affine fibres (lines 1520–1523); the route at lines 676–681 (Noetherian approximation, a dominating DVR, prolonging torsion, centralizers, Tate module) covers `ρ_r + ρ_ab`, `ρ_n`, `ρ_u` and `ρ_ab` but names no input for `d_s`. I could not refute the inequality (instances in the table: `GL₂ → SL₂ × 𝔾_a`, Iwahori `SL₂`, `G^(p)`, `𝔾_m ⋉ 𝔾_a^k`, where `ρ_n(s) ≥ ρ_n(s′)` and `ρ_r(s) ≤ ρ_r(s′)` rule out every attempted jump of `d_s` upward), and in characteristic `0` it follows from the closedness of "has a solvable ideal of dimension `≥ m`" in the variety of Lie algebra structures, but the README's route is silent in characteristic `p`.

Repair: name a route and its inputs for `d_s` (and say which of the five inequalities each listed input serves), or cite a proof; "stated there without proof" is a locator, not a route.

## R09 (P3) — two Check slips

- README line 901 ("At `c = 2` over `ℚ`, `σ(2)` is regular unipotent"): `σ(2) = [[−2, 1], [−1, 0]]` has characteristic polynomial `x² + 2x + 1 = (x + 1)²`, so it is `−1` times a regular unipotent; `σ(−2) = [[2, 1], [−1, 0]]` is the regular unipotent. The fibre `μ₂ × 𝔾_a` is right either way. Write `c = −2`, or "`σ(2)` is regular with semisimple part `−1`".
- README lines 597–598 (4.2 Check: `A[2] × 𝔾_m` "is affine and normal … but not connected"): for `A` supersingular in characteristic `2`, `A[2]` is connected (infinitesimal), so the subgroup is connected and non-smooth; the Check as written needs characteristic `≠ 2`. Add "for characteristic `≠ 2`" or say "not smooth and connected".

## Verified sound

**Gate, build, dependency check.** The worker's gate at 72ebe87: every check passes (`set_option=0 … sorry-data=0 … readme-ids-missing=0 … depcheck=0 … build=0 OK`). `lake env lean TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean` from the worktree: 15 `declaration uses sorry` warnings (lines 79, 112, 118, 125, 132, 139, 175, 192, 200, 215, 231, 239, 249, 267, 279), nothing else, exit 0. Dependency check with `--movable`: `depcheck: 240 roadmaps, 2360 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for this roadmap, which the candidate order lists at line 48 after AlgebraicModuliForArithmeticGeometry (32), AbelianSchemesAndArithmeticModuli (41), InverseGaloisAndArithmeticFundamentalGroups (44), FiniteFlatGroupsAndIntegralPadicHodgeTheory (46), NeronModelsAndSemistableAbelianVarieties (47); ReductiveGroups, SchubertGeometry, ModularCurves, SchemeAndStackFoundations, FlagVarieties are on main; EquivariantIntersectionTheory is a new roadmap in an open pull request (#1685, same author) placed after its last supplier, and its Downstream consumers paragraph (its lines 575–577) names this roadmap as a consumer only: no cycle. Nothing changes outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty); `metadata.toml` is `topic = "math.AG"`.

**Signatures (23) against the README.** The worker's elaborated types: `baseChange : (S' ⟶ S) → Grp (Over S) ⥤ Grp (Over S')` (Convention 2); `exists_identityComponent` keeps `[Smooth G.X.hom]` and asks open immersion, `Smooth`, `QuasiCompact`, `ConnectedSpace` of every fibre (0.2; `ConnectedSpace` includes nonemptiness, true for the unit section); `diagonalizable`/`diagonalizableMap` keep `[AddGroup.FG]` on both groups (1.1); `bijective_diagonalizableMap` keeps `[ConnectedSpace S]` (1.2); `smooth_diagonalizable_iff` has no base hypothesis and `etale_diagonalizable_iff` keeps `[Nonempty S]` (1.3); `flat_surjective_…`/`isKernel_…` keep `Function.Injective φ` (1.4); `IsMultiplicativeType.isotrivial` keeps `[ConnectedSpace S] [IsLocallyNoetherian S]` and the stalk hypothesis (2.5); `isotrivial_component` keeps `IsClopen` and `[ConnectedSpace U]`; `bijective_baseChange_map_of_thickening` keeps `[IsClosedImmersion i] [Surjective i]` (3.1, X 2.1's "même ensemble sous-jacent"); `hom_eq_of_eq_fibre` keeps `[ConnectedSpace S]` (3.2); `eq_of_eq_on_torsion` keeps `[IsSeparated Y.hom]` (3.3); `chevalley` keeps `[PerfectField k] [Smooth] [QuasiCompact] [ConnectedSpace G.X.left]` (4.2); `affinization` keeps `[LocallyOfFiniteType] [QuasiCompact]` (4.3). No binder lost. Every name the README backticks as its own is declared: `baseChange`, `exists_identityComponent`, `diagonalizable`, `diagonalizableMap`, `bijective_diagonalizableMap`, `smooth_diagonalizable_iff`, `etale_diagonalizable_iff`, `flat_surjective_diagonalizableMap`, `isKernel_diagonalizableMap`, `IsDiagonalizable`, `IsMultiplicativeType`, `IsTorus`, `IsMultiplicativeType.exists_etale_cover`, `IsIsotrivial`, `IsMultiplicativeType.isotrivial`, `IsMultiplicativeType.isotrivial_component`, `nodalCurve`, `exists_torus_not_isotrivial`, `bijective_baseChange_map_of_thickening`, `hom_eq_of_eq_fibre`, `eq_of_eq_on_torsion`, `chevalley`, `affinization` (the three the resolver flagged are among them, Suggested.lean lines 175, 192, 200).

**Library declarations opened at the pins (24).** Mathlib: `Hom.monoid` (`CategoryTheory/Monoidal/Cartesian/Mon.lean` line 206: `mul f₁ f₂ := lift f₁ f₂ ≫ μ`, `one := toUnit X ≫ η`, so `(𝟙 H.X) ^ n` is `x ↦ xⁿ` and `pullback.fst ((𝟙 H.X) ^ n) MonObj.one` is `H[n]`), `Grp.forget` (`Monoidal/Grp.lean` 401), `Functor.mapGrp` (598), `mapGrpIdIso`/`mapGrpCompIso` (644, 651: the coherence isomorphisms 0.1 asks for exist for `mapGrp`), `(Over.pullback f).Braided` (`Cartesian/Over.lean` 198), `specULiftZIsTerminal` (`AlgebraicGeometry/Limits.lean` 50), `hopfSpec` (`Group/Affine.lean` 177), `Scheme.Hom.fiber` (`Fiber.lean` 37, the pullback along `fromSpecResidueField`), `fromSpecResidueField` (`ResidueField.lean` 237), `Hom.appTop` (`Scheme.lean` 182), `KernelFork.ofι` (`Limits/Shapes/Kernels.lean` 92), `IsLocallyNoetherian` (`Noetherian.lean` 54), `IsIntegrallyClosed` (`RingTheory/IntegralClosure/IntegrallyClosed.lean` 74, integrally closed in its fraction ring, so with `IsDomain` it is normality of the stalk), `Smooth` (`Morphisms/Smooth.lean` 59), `Etale` (`Morphisms/Etale.lean` 39), the classes `Flat`, `Surjective`, `IsSeparated`, `IsFinite`, `IsClosedImmersion`, `QuasiCompact`, `IsAffineHom`, `LocallyOfFiniteType`, `LocallyOfFinitePresentation` (their `Morphisms/` files), `RootPairing` and `RootDatum` (`LinearAlgebra/RootSystem/Defs.lean` 81, 111). Tau Ceti: `DiagonalizableGroup.groupScheme` (`Algebra/AlgebraicGroup/DiagonalizableGroup/Scheme/Basic.lean` 86: `(hopfSpec R).obj (op (coordinateRing R G))` for `G : FGCommGrpCat`, so 1.1's "over `Spec R` it is isomorphic to Tau Ceti's" is a base change along the identity), `groupSchemeMap` (108), `cartierDualIso` (`CartierDuality/Constant.lean` 133: for `G : FGCommGrpCat` with `[Finite G]`, dual of `D(G)` ≅ the constant group, the biduality form of 1.5), `AbelianVariety` (`AbelianVariety/Basic.lean` 95: `toOver`, `grpObj`, proper, geometrically integral, so `Spec k` is an abelian variety and `chevalley` has a solution for the trivial group and for `G` affine), `multiplicativeTypeCommHopfAlgProperty` (`MultiplicativeType/Basic.lean` 56), `torusCommHopfAlgProperty` (`Torus/Basic.lean` 105), `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean` 50, over a field), `MultiplicativeType/GaloisModule.lean` (contragredient action on cocharacters, header lines 12–31).

**Cross-roadmap citations resolved (23).** ReductiveGroups on main: Layer 8 bullet "Relative reductive groups over an affine Noetherian base" (lines 1028–1060: predicates, centre, derived subgroup, central isogenies, scheme of maximal tori and of Borels, root datum sheaves, splitting, pinned classification, automorphism sheaf, forms), 9B (1610–1657: split models over `ℤ`, pinnings, base change, `x_α`, isomorphism theorem); Layer 11 (1959–2173) is the Lie-algebra spectral quotient over `ℂ`, not 7.1's `T/W`. SchubertGeometry on main: Conventions (lines 9–11: `G/P⁻`, `C(w) = B⁻wP⁻/P⁻`, `L(λ)` with `f(gb) = λ(b)⁻¹ f(g)`, `(g·f)(x) = f(g⁻¹x)`, degree `⟨λ, α_i^∨⟩`, as Convention 5), S3 item 1 (47), S7 item 1 (95). SchemeAndStackFoundations on main: §0.6 (678), §0.9 (848), §1.17 (2624), §2.3 `NonabelianH1` (3330–3344), §2.9 (3582), §2.11 (3656), §3.4 (4789). ModularCurves on main: 0B (280, with `D_S(M)` at 317–321), 0C (345), 0E (386). FlagVarieties on main line 19. Open heads: AlgebraicModuliForArithmeticGeometry §7.9 (9792–9794), FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 (805–811: unique lifting for `H` finite locally free of multiplicative type), InverseGaloisAndArithmeticFundamentalGroups IG.0.3 (666–680: connected normal locally Noetherian `X`, finite monodromy, a connected finite étale cover trivialising `L`) and IG.0.4 (850–865: Noohi groups, pro-étale `π₁`), NeronModelsAndSemistableAbelianVarieties 2.3 (1232–1240, `k` perfect, commutative), AbelianSchemesAndArithmeticModuli A0.1 and A4.1 (589, 1822), EquivariantIntersectionTheory 1.1 (263–281: linearisations, `Pic^G`, the forgetful map) and 1.3 (307–318: `0 → X^*(G) → Pic^G(X) → Pic(X)` for `G` connected, `X` normal with `k[X]^* = k^*`), SpringerResolutionAndCharacteristicCycles line 10 (owns the additive `g̃`, cites the multiplicative `G̃` here).

**Ownership against open pull requests** was checked by object with the roadmap grep (Steinberg map, section and cross-section; Grothendieck–Springer; universal centralizer; isotrivial; nodal-curve torus; Chevalley's theorem; affinization; specialization inequalities; identity component over a base; `Pic(G/B⁻)`; `D_S(M)` over a base). Second owners found: none for the group-scheme objects. The Lie-algebra Kostant section and universal centralizer `J → 𝔠` of EndoscopicTransferAndUnitaryTraceComparison §3.4 (its lines 1177–1213) and the additive simultaneous resolution of SpringerResolutionAndCharacteristicCycles Layer 2 are different objects; ChevalleyGroups' "Steinberg map" is a Frobenius-type endomorphism. The only shared object is R06.

**Seeded sample of locators (15 targets, 31 locators read).**

| Target | Source lines | Result |
| --- | --- | --- |
| 0.1 | Mathlib `mapGrp` 598, `mapGrpIdIso` 644, `mapGrpCompIso` 651, `hopfSpec` 177 | the coherence data exists for `mapGrp` |
| 0.2 | sga3-6b 808–820 (Prop. 3.9: `G⁰ → G` open immersion, `G⁰` quasi-compact over `S`, for `G` locally of finite presentation), 821–826 (Thm 3.10 (i)⇔(iv): smooth at the unit section) | correct; R04 only for the §7.9 clause |
| 1.2, 1.3 | SGA 3 VIII 1.5, 1.6, 2.1: not in the cache (below); checked against sga3-10 881–882 ("établie (VIII 1.5) lorsque G et H sont triviaux") and by the computations in the table | locators not read |
| 1.5 | Tau Ceti `cartierDualIso` 133–140; ModularCurves 0B 317–330 | correct (biduality form) |
| 2.4 | sga3-10 45–54 (Cor. 1.2: isotrivial groups ↔ `π₁`-modules with open stabilisers, `M = Hom(H_ξ, 𝔾_m)`), 61–67 (Prop. 1.4 and the field consequence) | correct statement; R02 for the Check, add 1.4 |
| 3.2 | sga3-9 732–735 (Thm 5.1: `H` multiplicative type of finite type, `S` locally noetherian or `G` of finite presentation, `u_s = v_s`, `u_s` central ⇒ agree near `s`), 783–785 (Cor. 5.3: `G` separated ⇒ the locus is open and closed) | correct: `H′` commutative gives centrality, affine gives separated and finite presentation |
| 3.3 | sga3-9 393–417 (Déf. 4.1 and the separated-target equivalence), 663–665 (Thm 4.7), 686–688 (Cor. 4.8 a) | correct; the Lean's separated `Y` is exactly 4.1's reformulation |
| 3.5 | sga3-11 1046–1048 (Cor. 5.3), 1101–1104 (5.3 bis), 1150–1157 (Prop. 5.9: `Centr` open and closed in `Norm`, quotient quasi-finite étale separated) | correct |
| 4.4 | sga3-10 1486–1498 (`ρ_ab`, `ρ_r`, `ρ_n`, `d_s`, `ρ_u = ρ_n − ρ_r − ρ_ab`), sga3-12 106–112 (Déf. 1.5, invariance under field extension) | correct |
| 5.1 | the same, with 4.4 | correct |
| 5.3 | sga3-10 1501–1515 (the five inequalities over a DVR, "il revient au même" semicontinuity), 1520–1523 (only the affine `ρ_r`, `ρ_n` cases proved in the seminar) | statement correct; R08 for the route |
| 5.2, 5.4 | sga3-12 124–140 (Thm 1.7 a–c), 213–218 (Cor. 1.10), 1189–1205 (Thm 7.1) | correct |
| 7.2 | steinberg1965 592–598 (6.1 b: simply connected, fundamental characters generate; the restriction map), 23–41 (standing hypotheses: algebraically closed `K`, `G` semisimple until 1.9) | correct, the reductive reduction is in the text |
| 7.3, 7.4 | steinberg1965 42–43 (1.1), 61–71 (1.3 and the reductive remark), 77–82 (1.4), 770–772 (7.1), 842–843 (7.9), 928–932 (8.1 a–c) | correct |
| 7.5 | steinberg1965 928–932 (8.1), ega4-3 5571–5580 (11.3.10, hypothesis 2°: locally of finite presentation) | correct |
| 7.4 | ega4-4 3056–3060 (17.9.5: source flat, both locally of finite presentation), conrad-rgs 11841–11844 (B.3.1) | correct |
| 4.2, 4.1 | conrad-chevalley 81–86 (Thm 1.1, perfect `k`, base change to perfect extensions), 67–77 (algebraic group = smooth connected); fga3 560–572 (Thm 7.2, Artin base, `F` flat, finite kernel) | correct |
| 2.1, 2.2, 2.3, 2.5, 2.6, 3.1 | sga3-9 11–28 (IX 1.1: fpqc; isotrivial = finite étale surjective), sga3-10 716–718 (X 4.5), 876–912 (5.6–5.9), 1039–1045 and 1063–1064 (5.16, "on peut supposer S connexe", N.D.E. unibranch), 89–113 (1.6), 132–140 (2.1), sga3-9 298–328 (IX 3.2, 3.3, 3.6) | correct |

**Adversarial table** (values computed on each side; "ok" means the computation agrees with the statement).

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_identityComponent` | `G = 𝔾_m`; `G = ℤ_S`; `G = S`; `S = ∅` | `G⁰ = G`; `G⁰ = e(S)` open since `ℤ_S` is discrete over `S`; `G⁰ = S`; vacuous | an open subgroup with connected fibres is forced to be `⋃ (G_s)⁰`, not vacuous | none |
| 0.2 Check `μ₂/ℤ` | union of fibrewise components | `V(t−1) ∪ V(2, t+1)`, complement `V(t+1) ∩ D(2)` not closed | ok, 0.2 does not apply | none |
| `diagonalizable`, Convention 3 | `φ = n·id`; `M = 0`; `M = ℤ/2` at `3`, `2` | `t ↦ tⁿ`, kernel `μ_n`; `D(0) = S`; `𝔽₃[t]/(t²−1)` two points, `𝔽₂[t]/(t−1)²` | ok | none |
| `bijective_diagonalizableMap` | `S = ∅`; `S = Spec(k×k)`; `M = 0`; `N = 0` | one hom vs `Hom(N, M)`, excluded by `ConnectedSpace`; `End(𝔾_m) = ℤ²` vs `ℤ`, excluded; singleton both sides; singleton both sides | ok | none |
| `smooth_diagonalizable_iff` | `M = ℤ/p` over `𝔽_p`; `M = ℤ`; `M = ℤ/6` over `ℤ`; `S = ∅` | `p = 0`, not smooth; torsion order `1 ≠ 0`, smooth; fails exactly at `2`, `3`; both sides true | ok | none |
| `etale_diagonalizable_iff` | `M = ℤ` (`S ≠ ∅`); `M = 0`; `S = ∅` | `Finite ℤ` false, `𝔾_m` not étale; étale, `1 ≠ 0`; excluded by `[Nonempty S]` | ok | none |
| `flat_surjective_…`, `isKernel_…` | `φ : 0 → ℤ`; `φ = id`; `φ : ℤ → 0` | `𝔾_m → S` flat surjective, kernel `D(ℤ/0) = 𝔾_m`; kernel `D(M/M) = S`; unit section, not flat, excluded by injectivity | ok | none |
| `IsMultiplicativeType` vs IX 1.1 | finite type `G`; `S = ∅` | fppf-local = fpqc-local = étale-local by X 4.5; every `G` over `∅` qualifies, harmless | ok | none |
| `IsTorus` rank `0` | `M = 0` | trivial group is a torus, as the Check says | ok | none |
| `IsIsotrivial`, `isotrivial` | `S = Spec(k×k)`, `G = 𝔾_m ⊔ 𝔾_m²`; `S = Spec k`; nodal curve | one `M` impossible with ranks `1`, `2`; `[ConnectedSpace]` excludes it; split by a finite separable extension; not normal, excluded | ok; source gap recorded | none |
| 2.4 Check `μ_n/ℚ` | `n = 3`, generator `ι : μ₃ ↪ 𝔾_m` | `σ ∘ ι ∘ σ⁻¹ = ι`, trivial action; cyclotomic action lives on `μ₃(ℚ̄)` | Check false | R02 |
| 2.6 nodal torus | cycle of `n` copies; infinite chain; identity gluing | monodromy `[[1,n],[0,1]] ≠ 1`; split; `𝔾_m²` | ok | none |
| `exists_torus_not_isotrivial` over any `k` | base change to `k̄` | isotrivial over `k` ⇒ isotrivial over `k̄`, refuted by X 1.6 | ok | none |
| 2.7 | `H = 𝔾_m × μ₂`; `μ_n` | `X*/tors = ℤ`, `Hᵗᵒʳ = 𝔾_m`, quotient `μ₂`; `Hᵗᵒʳ = 1` | ok | none |
| `bijective_baseChange_map_of_thickening` | `S₀ = S`; `Spec k ↪ 𝔸¹` at `0`; `𝔾_a` over `k[ε]` | identity bijective; not surjective, excluded; `t ↦ (1+ε)t` lifts the identity, excluded by multiplicative type | ok | none |
| `hom_eq_of_eq_fibre` | `t ↦ t`, `t ↦ t⁻¹` on `𝔾_m/ℤ`; `Spec(k×k)`; `GL₂` target over `𝔸¹` | differ on every fibre; agree at one point, differ, excluded by connectedness; `diag(t,1)` vs its `g_a`-conjugate equal at `a = 0` only, excluded by the target hypothesis | ok | none |
| `eq_of_eq_on_torsion` | `n = 0`; `H = μ_n`; `𝔾_a` in characteristic `0` | `(𝟙)^0 = e`, `H[0] = H`, excluded by `0 < n`; `H[n] = H`; `𝔾_a[n] = e`, excluded | ok | none |
| `chevalley` | `G = 1`; `G = A`; `G = 𝔾_a`; `G = A × 𝔾_m` | `L = 1`, `A = Spec k`; `L = 1`; `L = G`, `A = Spec k`; `L = 𝔾_m` | ok (`Spec k` is a Tau Ceti abelian variety) | none |
| 4.2 Check 3 | `A` supersingular, characteristic `2` | `A[2]` connected, so `A[2] × 𝔾_m` connected non-smooth | Check needs char `≠ 2` | R09 |
| `affinization` | `(ℤ/2)_k`; `α_p`; `A`; non-split extension of `A` by `𝔾_a`, char `0` | `O = k × k`; `k[t]/t^p`; `k`; `k` (anti-affine) | ok | none |
| 4.4 Checks | elliptic curve; `𝔾_m`; `𝔾_a`; `GL_n`; `B ⊂ GL₂`; `A × GL_n` | `(ρ_ab, ρ_r, ρ_n, ρ_u, d_s) = (1,0,1,0,0)`, `(0,1,1,0,0)`, `(0,0,1,1,0)`, `(0,n,n,0,n²−1)`, `(0,2,2,0,0)`, `(dim A, n, dim A + n, 0, n²−1)` | ok | none |
| 5.3 inequalities | `G^(p)/ℤ_p`; Weierstrass smooth locus, split multiplicative; Iwahori `SL₂` | `ρ_r: 1 → 0`, `ρ_u: 0 → 1`; `ρ_ab: 1 → 0`, `ρ_r: 0 → 1`, `ρ_r + ρ_ab` constant; `d_s: 3 → 0` | ok | none |
| 5.3 `d_s` upward jumps | generic `𝔾_m ⋉ 𝔾_a^k` (`ρ_n = 1`, `d_s = 0`) vs special `SL₂ ⋉ 𝔾_a^{k−2}` (`ρ_n = 1`, `d_s = 3`) and the other attempts above | not excluded by the other four inequalities; excluded in characteristic `0` by closedness of solvable ideals; no route in the README | not refuted | R08 |
| 5.4 `G^(λ)` | `λ` a unit; `λ = 0` | `t ↦ 1 + λt`, `(1+λt₁)(1+λt₂) = 1 + λ(t₁+t₂+λt₁t₂)`; `𝔾_a` | ok | none |
| 5.5 | class `p·ω`; class `ω`; class `0` | `G_η` anti-affine, `G_s = A_s × 𝔾_a`; additive `P` with `P(ω̄) = 0`, `(G_s)_affq ≅ 𝔾_a` (elliptic: `P = t^p − h t`); `𝔾_a` both | Check 1 false | R03 |
| Convention 5 | `SL₂`, `λ = ϖ`, `b` lower triangular | `(gb)₁₂ = g₁₂ b₁₁⁻¹`, `(gb)₂₂ = g₂₂ b₁₁⁻¹`: sections `g₁₂`, `g₂₂`, the linear forms on `ℙ¹ = G/B⁻` via `g ↦ [g e₂]`, so `𝓛(ϖ) = O(1)` | ok | none |
| Convention 6 | `x_α(1) x_{−α}(−1) x_α(1)` | `[[1,1],[0,1]]·[[1,0],[−1,1]] = [[0,1],[−1,1]]`, times `[[1,1],[0,1]]` gives `[[0,1],[−1,0]]` | ok | none |
| 6.1 | `𝓛(χ|_T)`; torus `G = T`; `𝓛(−ϖ)` | trivial line, linearisation twisted by `χ`; `Bor = S`, `O_S` with linearisation `λ`; `O(−1)` not ample | ok | none |
| 6.2 divisor | `D_α` translated by `n₀` | `n₀ B⁺ s_α B⁻/B⁻ = B⁻ n₀ s_α B⁻/B⁻ = C(w₀ s_α)` in SchubertGeometry's convention, length `ℓ(w₀) − 1` iff `α` simple | ok | none |
| 6.2 `Pic(G)` | `SL₂`; `PGL₂`; `GL_n`; torus | `P/X*(T_der) = 0`, `ℤ/2`, `0` (`X*(T_der) = ℤⁿ/ℤ(1,…,1) = P`), `0` | ok | none |
| 6.3 | `S` normal; `S` nodal | `Pic(𝔸^N_S) = Pic(S)` (seminormal); fails for the nodal curve, so normality is used | ok | none |
| 7.1 | `GL₂`; `SL₂`; torus | `ℤ[x^{±1},y^{±1}]^{S₂} = ℤ[(xy)^{±1}][x+y]`; `ℤ[t+t⁻¹]`; `W = 1` | ok | none |
| 7.2 integrality | `F ∈ ℚ[G]^G` regular on `G^rs_ℤ` | complement of `G_ℚ ∪ G^rs_ℤ` is `⋃_p D_{𝔽_p}`, codimension `2` in the regular `G_ℤ`: Hartogs applies (the text's "fibrewise dense" alone would not suffice, `D` has codimension `1`) | ok | none |
| 7.3 criterion in char `2` | `GL₂`, `g = [[1,1],[0,1]]`; `g = 1`; `diag(a,b)` | `d tr = X₁₁ + X₂₂`, `d det = X₁₁ + X₂₁ + X₂₂`, independent; dependent; independent iff `a ≠ b` | ok | none |
| 7.4 cross-section | `SL₂` | `κ(c) = [[1,c],[0,1]]·[[0,1],[−1,0]] = [[−c,1],[−1,0]]`, trace `−c`, det `1`; `SL₂ × 𝔾_m`: `dim C = 1 < 2` | ok | none |
| 7.5 | char `2`, `u = [[1,1],[0,1]]`; `c ≠ ±2` over `ℚ`; `c = 2` | `{[[a,b],[0,a]] : a² = 1} = k[a,b]/((a−1)²)`; eigenvalues `(−c ± √(c²−4))/2`, split iff `c² − 4` square; `σ(2)` has char. poly. `(x+1)²` | ok, except the word "unipotent" | R09 |
| 7.5 fibre product | `((g,c), c')` with `a(g,c) = σ(c')` | `χ ∘ a = pr₂`, `χ ∘ σ = id` force `c = c'` | ok | none |
| 7.6 | `SL₂`: regular semisimple `x`; regular unipotent `u`; `±1` | fibre `{t, t⁻¹}`; `t + t⁻¹ = 2 ⇔ (t−1)² = 0`, length `2`; `ℙ¹` | ok | none |
| 7.7 | `G̃ → T × Bor`; `S = Spec ℤ`; `SL₂/k` | affine-space bundle, `Pic(G̃) = Pic(T × Bor) = Pic(Bor)` for regular `Bor`; `Pic(S) = 0`, `P/X*(T_der) = 0`; `(0, 0, ℤ)` | ok | none |
| 7.8 | torus; `G̃ → G` for `SL₂` | `G = X̃` works, hypothesis needed; exceptional `ℙ¹` over `±1`, composite not smooth | ok | none |
| 7.8 proof | `L` `p`-ample with `L^n` from `S` | trivial and ample on `p`-fibres ⇒ fibres finite ⇒ `p` finite birational onto normal `G` ⇒ isomorphism | ok | none |

**Padding probe.** By reading (every sorried theorem is a deep statement on `diagonalizable`, `IsMultiplicativeType`, `nodalCurve` or `AbelianVariety`, with no library instance or lemma closing it): none closes in one tactic, none restates a definition or a Check, none computes a value. `isotrivial_component` is a corollary of `isotrivial` through base change to a clopen `U`, not a boundary case; kept.

**Headline theorems.** Statable at the pins and stated: 0.2, 1.2, 1.3, 1.4, 2.2, 2.5, 2.6, 3.1, 3.2, 3.3, 4.2, 4.3. Named in the docstring as not statable, with the missing carrier: 1.5 (Cartier dual over a scheme), 1.6 (`NonabelianH1`), 2.3–2.4, 2.7 (big-site `𝔾_m`), 3.1's smooth target, 3.4, 3.5 (the Hom and centralizer presheaves, heavy definitions), 4.1 (fppf quotients), 4.4 and Layer 5 (maximal tori over `Grp (Over (Spec k))`), Layers 6–7 (`𝒢_R` and `Bor(G)`). Nothing is forced through a stand-in.

## Not verifiable

- SGA 3, Exp. VIII, 1.5, 1.6, 2.1, 3.1, 3.2 (targets 1.1–1.4): not in the sources cache (`sga3-6b`, `sga3-9`–`sga3-12`, `sga3-19`, `sga3-22`–`sga3-25` are); I did not fetch it, since the re-edition of Exp. VIII is a 2009 preprint whose numbering may differ from LNM 152. The statements were checked by the computations in the table and against X 5.6's citation of VIII 1.5.
- SGA 3, Exp. VI_A 3.2 (4.1) and EGA II 7.1.9 (5.3): not in the cache; cited by locator. VI_A 3.2 is quoted for the same statement by conrad-chevalley lines 71–75.
- Sansuc 1981 §6 (6.2): the cached text `sansuc1981` is the Göttingen landing page (37 lines, no article text), although the manifest records it `certified`; the Crelle article is paywalled. Cited by locator; the exact sequence was checked on `SL₂`, `PGL₂`, `GL_n` instead. Popov 1974 §4, Jantzen II.1.8 and II.4.4, Demazure–Gabriel III §3 5.4 and 8.2, Bourbaki Lie VI §3 no. 4 Thm 1, Slodowy ch. 3–4, Milne: no legal open copy; cited by locator (uncertified).
- Brion's theorem used in R03 (no anti-affine extension by `𝔾_a` in characteristic `p`) is not in the cache; the additive-polynomial computation in R03 is self-contained.

## Source issues

- **Gap** in sga3-10 at Théorème 5.16, printed page 83–84 (lines 1039–1045): the source says every finite-type group of multiplicative type over a locally noetherian geometrically unibranch base is isotrivial, with the proof reducing to a connected base; it should assume the base connected, or conclude isotriviality on each connected component, since over `Spec(k × k)` the group `𝔾_m ⊔ 𝔾_m²` is split by no single finite étale cover with one type `M`; affects a stated result (the README states the connected and the componentwise forms separately).
