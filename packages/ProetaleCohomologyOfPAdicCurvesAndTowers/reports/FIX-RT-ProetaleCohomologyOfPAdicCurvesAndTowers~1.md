# FIX-RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1: repair of red-team round 1 (passes a and b)

The other open head of this roadmap, pull request #2287 at 77d5795, turned out to be this package's round-8 text with further repairs. Its first commit differs from the package by 72 diff lines; the next nearest package state differs by 86. So this package is **rebased on #2287 at 77d5795**: `README.md` and `Suggested.lean` start from that head, and this round's repairs are applied on top. #2287 is therefore an ancestor of the package text. It should be brought to the package text, not repaired on its own. Every change #2287 brought in was checked again here (see "Checks of the text taken from #2287").

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F01 (P2) — applied

Old: the package had its own flag-stabilizer `parabolic` and `parabolic_mono`. New: the package is rebased on #2287. The parabolics are now Tau Ceti's `TauCeti.TitsSystem.standardParabolic` of `TauCeti.glTitsSystem` (checked at the pin, `Parabolic/Basic.lean` line 48, `Diagonal/TitsSystem.lean` line 195). The ColemanIntegrationPartII §§1.1–1.2 compact-graph supplier and the AInfCohomology AI.0:integral Breuil–Kisin twist supplier are kept as #2287 has them.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F02 (P1) — applied

Old (§0.1): `I₂ = {(a, s) : s an endpoint of a}`. New: the edges of `Γ^{(2)}` are endpoint incidences, `I_{2,c} = A_c × {1, 2}`, kept apart for loops, plus one per leg. §§2.2–2.4 name them by pairs `(a, s)` (fine triangulations have no loops). New Check: the subdivided loop gives `L²/L(1, 1) ≅ L`; pairs give `0`.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F03 (P2) — applied

Old: "functorial for morphisms"; "`N_µ` natural for length-preserving maps". New: morphisms defined. `H⁰`, `H¹` are contravariant for all, `H⁰_c`, `H¹_c` for proper ones; `H¹_c(−)^*` is covariant (`f_*`) for proper ones. `N_µ` is equivariant under length-preserving isomorphisms and compatible with subdivision when lengths add. Checks: `ℤ → loop`; split loop `µ′ + µ″`.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F04 (P1) — applied differently

Rebase brings #2287's §3.3: the `p²`-exact sequence `0 → O(Y_S)/O_C → H¹_syn → H¹_dR(Ỹ_S)^{φ=p} → H¹(Y_S, O)` (CDN-CURVES Proposition 6.26), with its symbol form for `p > 2` and an elliptic Check, replaces the false `→ 0`. The suggested rational form is not adopted: it fails on the closed disc, where `X¹_st(H¹_HK^sep) = 0` but `∏(1 + p^{1/p^n}T)^{p^n}` is not in the image of `O(Y)/C` (lines 160–164).

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F05 (P2) — applied differently

The rebase brings in #2287's §2.2: `ι_{a,s}: Y_{s,a} ≅ Y_{a,s}`, from the short's ghost circle to the leg's. This agrees with §2.3 (`O(Y_{a,s}) → O(Y_{s,a})`, `T_{a,s} ↦ u`). It is the opposite choice to the suggested one, and equally consistent; the rescaling Check (`T_{a,s} ↦ αu`) is correct as written.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F06 (P2) — applied

New Lean headline `generalizedSteinberg_nonempty_equiv_iff` (irreducibility's hypotheses; `Nonempty (Sp_J(A).Equiv Sp_{J′}(A)) ↔ J = J′`; GK14 Corollary 4.4(a), line 1328; Noether–Deuring descent in char 0). It is named in §0.4(a), with a new Check (`d = 1`; the all-trivial model; `d = 0`). Multiplicity one is listed in the docstring as not statable: no composition multiplicities at the pins.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F07 (P3) — applied

§4.9 Check, old: "the limit stabilizes". New: `ι_BdR(x)` is the Fontaine period, a limit that need not be reached at a finite stage. For `x = 0` with constant lifts `v ≠ 0` in `ker(J̃ → J)(B_dR^+)`, the terms `p^n v → 0` are never eventually constant.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F08 (P3) — applied

§5.5 Check, old: `Ω⁰/ker d = O(X_C)/C`. New: product form `O(X_C)/H⁰_dR(X_C)`, which is `O(X_C)/C` for connected `X_C`. Witness added: two half-plane models, `(0, 1)`. No other unrestricted `/C` remains for possibly disconnected spaces: §§4.1–4.2, 7.3 and 7.5 already use `H⁰_dR`.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F09 (P3) — applied

§7.2 Check, old: two standard `O_F`-models. New: over `F₂`, two copies with two standard `O_{F₂}`-models; over `F`, their descent, Frobenius exchanging the copies. This gives `H⁰ = 𝔽_p` as in §7.7, where a split model would give `𝔽_p²`. The fourth Check now says its components `(v, i)` are those over `O_{F₂}`, i.e. the geometric ones.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F10 (P3) — applied

`parabolic_mono` is deleted through the rebase. Monotonicity is `TauCeti.TitsSystem.standardParabolic_monotone` (line 80), used in `steinbergRelations` and cited in §0.3.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F11 (P2) — applied

New in Lean, with real bodies: `steinbergIndex` (the index set `{s_1,…,s_{d−r}}`), `hyperplaneTranslation` (equations `[a] ∈ ℙ(K^{d+1})`, `g⁻¹` acting by `a ↦ a·g`; `map_one'`/`map_mul'` proved) and `hyperplaneCocycles` (alternating-sum and `Projectivization.Dependent` conditions). New headline `generalizedSteinberg_equiv_hyperplaneCocycles` for `r ≤ d`. All of these are in README §§0.3 and 0.5 with Checks; the module docstring is updated.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F12 (P3) — applied

Three §2.1 Checks added: `Spf O_C⟨T⟩` is a short; `O_C⟨T,U⟩/(TU − p)` is not (its special fibre is singular at the origin); `O_C⟨T,E⟩/(E² − E)` is formally smooth but has two components. The definition's special fibre was corrected from "smooth proper curve with marked points" to the smooth connected affine complement of the marked points (CDN-CURVES line 284).

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a/F13 (P3) — applied

The purported counterexamples are deleted from the Checks of §5.3 and §6.7. The statements now carry scope sentences: "no comparison is asserted in degrees above `r`" (§5.3), and `1 − φ^{−1}` is formed on `τ≤i AΩ{i}` with no untruncated comparison asserted (§6.7). Each section keeps three distinct Checks.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1b/F01 (P3) — applied differently

`A_st` is now defined in §3.3 (rebase): `A_cris[Log p̃]^PD` with `φ(Log p̃) = p Log p̃` and `N = d/dLog p̃` (the source's sign `+1`, stated as opposite to `N(u) = −1`), and `ι_p̃(x) = 1⊗x − Log p̃⊗Nx` (CDN-CURVES lines 3748–3762). This uses the source's sign rather than the suggested `−1` with an automorphism; the two are equivalent.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1b/F02 (P3) — applied

The rebase adds contracts for FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.20/.25/.26/.28, RD.4.34, RD.4.38, ClassicalAdicEtaleCohomology §1.4, Layer 8 and §9.1, SR.0d and AdicSpacesPartIII F0. Added here: an AbelianSchemesAndArithmeticModuli §A4.CR.7.2 contract (Dieudonné crystal, Grothendieck–Messing), and an "It imports" bullet for AbelianSchemesAndArithmeticModuli and FiniteFlatGroupsAndIntegralPadicHodgeTheory. All headings were checked at the suppliers' heads.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1b/F03 (P3) — applied

`comapₗ` line 326 → 327; `Isocrystal` 113 → 112; same pattern for `EllAdicCohomology` 75 → 76 (its docstring line). `toLin` is no longer cited after the rebase. Every Mathlib and Tau Ceti line locator in the README was re-checked at the pins.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1b/F04 (P3) — applied

SR.3 → SR.3.4 (*steinberg*) in the scope, contract, §0.4 Needs and Layer 0 Dependencies. The §0.3 Check now gives the map `f ↦ (xB ↦ f(Bx⁻¹))` from functions on `B∖G` with right translation to functions on `G/B` with left translation, and cites the irreducibility as the case `J = ∅`, `A = ℂ` of §0.4(a).

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1b/F05 (P3) — applied

§4.8, old: `C ⊗ Lie(J)`. New: `0 → V_p(J) → Ĵ → Lie(J) → 0`, with `Lie(J)` the `g`-dimensional `C`-Lie algebra of `J(C)`, equal to `C ⊗_K Lie(J_K)` for a model over `K` (CDN-CURVES lines 4015–4028). The Check is changed to match (`g = 1`: `C`, not `C ⊗_{ℚ_p} C`).

## Checks of the text taken from #2287

- Tau Ceti locators at the pin: `glTitsSystem` 195, `glTitsSystemSimpleRep` 248, `standardParabolic` 48, `_monotone` 80, `_empty` 190, `_univ` 196, `standardParabolic_le_standardParabolic_iff` (Classification.lean 139), `standardParabolic_weightParabolicSimple` 132, `coind` 104, `SimpleGraph.FirstCohomology` 99, `AdicSpace` 249: all exact.
- ColemanIntegrationPartII §1.1–1.2 (head of #1360): `div_ℓ(c)(v) = Σ_{tail=v} c/ℓ`, `d f = f(tail) − f(head)`. So `div_µ(µφ) = ∂^*φ`, loops contribute `0` on both sides, and `Harm_µ ⊕ im d = C¹` is the compact case of `N_µ` being an isomorphism. Checked on a loop of length `µ`: `N = µ`.
- PadicLocalLanglandsForGL2Qp §6.9(iii) states `H¹_dR(Σ_n)^ρ ≅ M*_dR ⊗ π*`, as the scope bullet says. Supplier headings AI.0:integral, §1.4, Layer 8, §9.1, RD.4.34, RD.4.38, R07.2.20/25/26/28, SR.0d, SR.3.4, F0 and A4.CR.7.2 all exist.
- The §7.7 Check citing CDN23 Théorème 4.1 is corrected: that theorem is for `k_L` coefficients with `ϖ = p` (lines 1755–1756), and Remarque 4.2 extends it to `O_L/m_L^k`.
- The §0.3 indexing Check (`d = 2`): `P_{{s_0}}` is block `(2,1)` and stabilizes `Ke₀ + Ke₁`, so `X_J` is the set of planes. With `k = 1` one gets the stabilizer of `Ke₀`, i.e. lines; these are distinct by §0.4(a).

## Adversarial pass

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.1 incidence subdivision | loop; segment `s₁→s₂`; one leg | loop: `im ∂ = L(1,1)`, `H¹ = L`, pair version `H¹ = 0`; segment: `∂(x₁,x₂,x_a) = (x_a−x₁, x_a−x₂)` onto `L²`, `H¹ = 0 =` original; leg: `I_{2,c} = ∅`, `H¹ = 0` | fixed |
| §0.1 functoriality | `ℤ → loop`; 2-cycle → loop | pullback of `1` is constant `1` on `ℤ`, not finite support; `φ = (1,1) ∈ ker ∂^*`, `f_*φ = 2`, `∂^*(2) = 2−2 = 0 = f_*(∂^*φ)` | fixed, Check added |
| §0.2 subdivision | loop with `µ′,µ″ = 1,2`, `µ = 3` | `N(1,1) = [(1,2)] ↦ 1+2 = 3 = µ`; with `µ′ + µ″ = 4`: `4 ≠ 3` | Check added |
| `steinbergIndex` | `d=2`, `r=0,1,2,3`; `d=1,r=2` | `{0,1}`, `{0}`, `∅`, `∅` (truncated `2−3 = 0`); `d=1,r=2`: `∅` gives Steinberg `≠ 0 = Sp_2` | hypothesis `r ≤ d` kept, Checks added |
| non-isomorphism | `d=1`, `A = ℚ, 𝔽_p`; `d=0` | `dim Sp_∅ = ∞`, `dim Sp_{{s}} = 1`; `d=0`: single `J` | true; all-trivial model refuted |
| presentation | `d=r=0`; `d=1,r=0`; `d=r=1`; `d=1,r=2` | `ℤ = ℤ`; `ℤ = ℤ` (constants); `LC(ℙ¹)/ℤ` both, via `g(H₁)−g(H₀)`; cocycles `0`, Lean index gives Steinberg | true for `r ≤ d`; `hr` needed |
| cocycle sign | `r = 1` | `i=0: +f(H₁,H₂)`, `i=1: −f(H₀,H₂)`, `i=2: +f(H₀,H₁)` = CDN-STEIN line 2048 | agrees |
| `hyperplaneTranslation` direction | `d=1`, `g = [[1,1],[0,1]]`, `a = (1,0)` | `a·g = (1,1)` ↔ `K(−1,1) = g⁻¹(Ke₁)`; `a·g⁻¹ = (1,−1)` ↔ `K(1,1) = g(Ke₁)` | left action; Lean `example` confirms formula by `simp` |
| shorts | `O_C⟨T⟩`; `O_C⟨T,U⟩/(TU−p)`; `O_C⟨T⟩²` | `𝔸¹` smooth; Jacobian `(U,T)` vanishes at `0`; `π₀ = 2` | Checks added |
| §3.3 sequence | proper elliptic; closed disc | `O(Y_S)/O_C = 0`, `Symb = ℤ_p²`, `X¹_st` Dimension `(1,2)`, so not onto; disc: product `u` not in `O(Y)/C` | `p²`-exact form kept; rational form rejected |
| `A_st` sign | `N(Log p̃) = ±1`, `Nx ≠ 0` | `+1`: `N(ι x) = 1⊗Nx − 1⊗Nx = 0`; `−1` with same `ι`: `2(1⊗Nx) ≠ 0` | consistent |
| §4.8 `Lie(J)` | `g = 1` | `Lie(J) = C`; `C ⊗_{ℚ_p} C` has infinite `C`-rank | fixed |
| §4.9 limit | `x = 0`, lifts `v ≠ 0` | `p^n v − p^{n+1} v = p^n(1−p)v ≠ 0`, limit `0 = ι(0)` | Check fixed |
| §5.5 dim-one | two half-planes | `ker d = C²`; `(0,1)` is `0` mod `H⁰_dR`, `≠ 0` mod diagonal | fixed |
| §7.2 `n = 0` | `K = F`, `F₂` | `π₀ = 1` point over `F` (`H⁰ = 𝔽_p`), `2` over `F₂`; split model gives `𝔽_p²` | fixed, agrees with §7.7 |
| §0.3 `B∖G` map | `f̌(xB) = f(Bx⁻¹)` | `(g·f)ˇ(yB) = f(By⁻¹g) = f̌(g⁻¹yB)` | equivariant |

## Lean context check

I ran `#check @name` on all ten declarations in one scratch copy (`translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`, `generalizedSteinberg_nonempty_equiv_iff`, `steinbergIndex`, `hyperplaneTranslation`, `hyperplaneCocycles`, `generalizedSteinberg_equiv_hyperplaneCocycles`). Every elaborated type carries its own binders: there is no section variable, and `Nontrivial Kˣ`, `Field A`, `CharZero A ∨ CharP A p` and `r ≤ d` are all present. Each matches its README statement. Nothing changed as a result.

## Checks run

- Elaboration (`lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`): three warnings `declaration uses sorry` (lines 133, 147, 226, i.e. the three headline theorems) and no errors. `hyperplaneTranslation` and `hyperplaneCocycles` have fully proved fields.
- Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Ownership: searched main and the open heads for the hyperplane-cocycle presentation, Iovita–Spiess, Schneider–Stuhler and generalized Steinberg representations. No second owner; SmoothRepresentationsOfLocalGroups (now on main) has only the complex segment representations, as the scope says.
- Gate failures listed in the brief: none. `design/plan.json` is unchanged; its four gaps match the README contracts.

## For the maintainer

- The package is rebased on #2287 at 77d5795; #2287 should take the package text, not be repaired separately.
- Lean names dropped (already dropped in #2287): `parabolic`, `parabolic_mono`. Added: `generalizedSteinberg_nonempty_equiv_iff`, `steinbergIndex`, `hyperplaneTranslation`, `hyperplaneCocycles`, `generalizedSteinberg_equiv_hyperplaneCocycles`. No roadmap on main, at an open head or in the board packages cites any of this roadmap's Lean names. Section numbering is unchanged, so the citations of ScholzeFunctorAndModpCohomologyOfTheLubinTateTower and PadicLocalLanglandsForGL2QpPartII still resolve.
- Source issues, recorded in the README:
  - CDN-CURVES §1.2.3, line 774: indexing edges by endpoint pairs loses one half of a loop.
  - CDN-CURVES Proposition 6.29, line 3769: the sequence does not end in `0` for proper curves of positive genus.
  - CDN23 Théorème 0.4 has no slope hypothesis (unchanged).
- No new source was fetched and no text is missing. The locators added are all in sources already recorded: CDN-CURVES lines 284, 766–782 and 4015–4028; CDN23 lines 1755–1756; GK14 line 1328; CDN-STEIN lines 2046–2054.
