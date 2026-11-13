# Repair report FIX-RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1

Files changed: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md`,
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`,
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml`. `metadata.toml` and
`design/plan.json` are unchanged (no supplier gap was needed).

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1a/F01 (P2) — applied

Witness holds (`φ = 2X`, `x = 3`: `6 ≠ 3`). §0.3 "commutes with coordinate isomorphisms over `O_K`"
→ "commutes with coefficient-field embeddings; `ℓ_G(φ(x)) = c·ℓ_F(x)` for `φ` of linear coefficient
`c ∈ O_K^×`; strict isomorphisms preserve it". Added the negative-control Check (`6 = 2·3`). Other uses
(§§0.2, 2.4, 9.1, 9.2) concern point maps or traces: correct.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1a/F02 (P2) — applied

Confirmed: `σ² = 1` on `W(𝔽_(p²))[1/p]`, so type `p − sT²` is native substitution; `FormalGroup.log` and
`FormalGroup.zsmulSeries` exist at the Tau Ceti pin. Added `exists_hondaType_log_of_map_zsmulSeries`
(§4.3(ii)) and, since the docstring's "not statable" claim also covered (iii),
`exists_strictIso_hondaLog_of_map_zsmulSeries` (`ℓ_s` characterized by `pℓ − sℓ(X^(p²)) = pX`).
Docstring now lists only general §4.2 as not statable. README §4.3 names both; new Check.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1a/F03 (P2) — applied

`existsUnique_lubinTate_intertwiner` (arity one) → `exists_lubinTate_interpolation`: every `n`,
`a : Fin n → O`; `H` with zero constant term, linear part `Σ aᵢXᵢ`, `f(H) = H(g(Xᵢ))`; the solutions over
a fraction field `K` are exactly the image of `H` (uniqueness over `O` and `K`). README §1.2 keeps
arities one, two as specializations; Checks `n = 0`, `n = 2`.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1a/F04 (P3) — applied

Four non-discriminating §3.2 Checks → three computed ones: additive vs multiplicative over `ℤ₂`
(`(0,0)` vs `(1,1)`); additive transported by `X + cX²` over `W(𝔽₄)` (`−2c`, `−2c`, unit `c(ζ−ζ²)`);
multiplicative transported by `X + 2X²` (`XY` coefficient `−3`, same marked deformation). The
reviewer's "`[2]` alone" made precise: the forgetful map from the Lazard ring is not surjective in
degree one.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1a/F05, RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b/F03 (P3) — applied

Confirmed: AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocityPartII,
ScholzeFunctorAndModpCohomologyOfTheLubinTateTower and RelativeFarguesFontainePartII cite `LT.k`, target
slugs and titles. Added to "How to read the build" a table "Former numbering | Former title | Now",
one row for each of the 10 former layers and 51 design targets (all ids of `design/plan.json`), including the
aliases "Analytic logarithm", "Tate module" and "Artin comparison".

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b/F01 (P1) — applied

Confirmed: RelativeFarguesFontaine §2.5 builds `E(LT[π^m])` on VectorBundlesAndIsocrystals Layer 5's
`G_LT`, normalized by a Dieudonné module, and §1.4 compares only series for the same `π`. Added the §2.3
target "`[π]_(G_LT)` is a Lubin–Tate series for `π`", with a proof route; supplier contracts (new
VectorBundlesAndIsocrystals section); scope; `uπ` negative Check; *Needs* of §§2.3–2.4; Layer 2
Dependencies.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b/F02 (P2) — applied

Confirmed: §12.3 classifies `(G, ρ, α_m)`, `ρ` a quasi-isogeny. Scope, contract and §3.6 now use
§10.2 plus the level-zero, height-zero component of §12.3, identified by rigidity: a marking lifts
uniquely to a height-zero framing; a height-zero framing reduces to an isomorphism (units of `O_D`).
The reviewer's "`ρ = ι`" ignored direction. Added the nonzero-height Check.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b/F04 (P3) — applied

Conventions "Layers 0 and 2–9 characteristic zero" → "§§0.1–0.2 arbitrary coefficient ring;
Layer 1 any DVR; §§0.3–0.4, Layers 2–9 characteristic zero". Same pattern fixed in the formal-module
convention ("when `K/ℚ_p` is finite the `p`-height is `h[K:ℚ_p]`"), the Summary and the §0.1 API
bullet ("in either characteristic; for `F/ℚ_p` finite …").

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b/F05 (P3) — applied

Confirmed: H70 §1 (lines 69–300) is formal; Theorem 1 is H70 line 241, p.218. §0.3 parenthesis →
"H70, §1, Theorem 1, pp.218–219, for the formal logarithm and `F = ℓ⁻¹(ℓ(X)+ℓ(Y))`; LT65, §1, p.383,
for evaluation; convergence from the Tau Ceti declarations of *Needs*". `sources.toml` H70 locator
"§1, pp.216–219" → "§1, Theorem 1, pp.218–219".

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b/F06 (P3) — applied

§9.3 uses §§9.1, 9.2, 8.4, 8.5, 0.3 and the elliptic isomorphism of §4.4, nothing of §§3.6, 5.5.
*Needs:* "§§9.1, 9.2, 8.4, 8.5, 5.5, 3.6, 0.3" → "§§9.1, 9.2, 8.4, 8.5, 4.4, 0.3". Layer 9
Dependencies "§§0.2, 0.3, 3.6, 4.4, 5.5, 8.4, 8.5" → "§§0.2, 0.3, 4.4, 8.4, 8.5", the union of the
§§9.1–9.3 *Needs*.

## Checks run

- Elaboration: `lake env lean packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`
  from the content checkout. No errors. There are exactly 7 warnings, all "declaration uses `sorry`", at
  lines 86, 104, 138, 154, 176, 196 and 221 (the seven theorems). The new imports
  `TauCeti.RingTheory.FormalGroup.Logarithm.Basic` and `TauCeti.RingTheory.FormalGroup.ZSMul` exist
  at the pin, and their object files were already built.
- Elaborated signatures: all 9 declarations were put as `#check @name` into one scratch copy, which was
  elaborated once, and each type was compared with its README statement. Unchanged: both predicates
  (`[CommRing O] [IsLocalRing O]`), `exists_formalGroup_of_isLubinTateSeries`, both Layer 2 theorems
  (`[IsNonarchimedeanLocalField K] [CharZero K]`) and the elliptic theorem. The new
  `exists_lubinTate_interpolation` keeps `[IsDomain O] [IsDiscreteValuationRing O]
  [Finite (IsLocalRing.ResidueField O)]` and gains an explicit `(K) [Field K] [Algebra O K]
  [IsFractionRing O K]`. The two Honda theorems carry `[Fact p.Prime]`, `(K) [Field K] [CharZero K]`
  (which gives `Algebra ℚ K` for `FormalGroup.log`), `[IsFractionRing (WittVector p (GaloisField p 2)) K]` and `[G.IsComm]`
  explicitly. No section binder is lost.
- Dependency check (exact output):

  ```text
  depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The new supplier VectorBundlesAndIsocrystals is line 124
  of the merge order and this roadmap line 344.
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that resolves
  nowhere. It notes that Lean names outside TauCetiRoadmap were not checked on its host. The five
  `FormalLieGroup`/`BarsottiTate` leads in the worker's citation listing are names that
  FiniteFlatGroupsAndIntegralPadicHodgeTheory plans: `roadmaps grep` finds each in that roadmap's
  README, and none is a pinned declaration. The README already says they are supplied there, and this
  round leaves them unchanged.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3 `ℓ_G(φ(x)) = c·ℓ_F(x)` | additive `ℤ₃`, `φ = 2X`, `x = 3`; `𝔾̂_m` with `[u] = (1+X)^u − 1`; `x = ζ_p − 1`; `x = 0` | `6 = 2·3`; `log((1+x)^u) = u·log(1+x)`; `0 = u·0`; `0 = 0` | true; old claim false at `c = 2` | text + Check |
| Conventions / §0.1 height `nh` | `𝔽_q[[t]]`, `[t] = tX + X^q` (height 1); quadratic unramified `F/ℚ_p`; `ℚ_p(√p)`; `𝔽_q((t^(1/2)))/𝔽_q((t))` | heights `1`; `2`; `[p] = [π_F]²∘[unit]`, first term `X^(p²)`, height `2`; `[t] = [π_F]²`, first term `X^(q²)`, height `2` | true in both characteristics | text |
| `exists_lubinTate_interpolation` | `n = 0`; `n = 1`, `a = 0, 1`, `f = g`; `n = 2`, `f = g = 2X + X²`, `a = (1,1)`; linear candidate `X + Y`; uniqueness over `K` | `H = 0`, both sides `0`; `0`, `X`; `H = X + Y + XY`, both sides `(1+X)²(1+Y)² − 1`; `XY` coefficients `2` vs `0`; degree-`r` part `(π − π^r)H_r` with `π − π^r = π(1 − π^(r−1)) ≠ 0` | true; iff also needs base change of `subst`, which holds | Lean + README |
| `exists_hondaType_log_of_map_zsmulSeries` | `p = 2`, `s = 1`, `G = F_(2X+X⁴)`; Honda model `ℓ_s`; additive, `𝔾̂_m` with `[p]`, `[−p]`; `G = F_(−2X+X⁴)` with `s = 1` | `X⁴` coefficient of `2ℓ − ℓ(X⁴)`: `2(−1/14) − 1 = −8/7`, `v₂ = 3`; `pℓ_s − sℓ_s(X^(p²)) = pX`; reductions `0`, `X^p`, `−X^p + ⋯` (excluded); reduction `[−1]_Ḡ(X⁴) ≠ X⁴` by rigidity (excluded) | true; hypothesis tells the two signs apart at `p = 2` | Lean + README |
| `exists_strictIso_hondaLog_of_map_zsmulSeries` | `G` = Honda model; `G = F_(2X+X⁴)`; uniqueness of `ℓ`; opposite sign | `φ = X`; `X⁴` coefficient `−1/14 − 1/2 = −4/7 ∈ ℤ₂`; `(p − s)a₀ = 0`, `a₁ = 1`, `a_(q^j) = (sp)^(−j)` (`1, −1/2, 1/4` at `p = 2, s = −1`); `ℓ_(−s)⁻¹∘ℓ_s` has `X^q` coefficient `2s/p`, not integral for odd `p` | true (H70 Theorem 3 with `u = v`, `C = t = 1`) | Lean + Check |
| §2.3: `[π]_(G_LT)` is Lubin–Tate for `π` | `E = ℚ_p`, `G_LT = 𝔾̂_m`; `ℚ₂`; `π′ = uπ`, `u ≠ 1` | `(1+X)^p − 1 ≡ X^p`; `2X + X² ≡ X²`; reduction `[ū⁻¹]_(F̄)(X^q) ≠ X^q`, since `[u⁻¹] ≢ X` by rigidity | true for the supplier's normalization; fails for `uπ`, as it must | target + Check |
| §3.6 / §12.3 component | `h = 1`; framing `ρ` composed with `[ϖ]`; height-zero framing over `k̄` | level-zero components are points, the height-0 one is the unique deformation; height `h ≠ 0`; valuation `0` in `D^×` means a unit of `O_D = End(H)`, an automorphism | identification holds on the height-0 component only | text + Check |
| §3.2 Checks | `ℤ₂` additive/multiplicative; `W(𝔽₄)`, `h = X + cX²`; `ℤ₂`, `h = X + 2X²` | `(0,0)`/`(1,1)`; `−2c`, `c(a − a²)`, `(1−ζ)(1−ζ²) = 3` a unit; `1 − 2c = −3` | true | Checks |
| §9.3 *Needs* | statement, proof route | uses §§9.1, 9.2, 8.4, 8.5, 0.3, 4.4; uses neither §3.6 nor §5.5 | corrected | Needs |

Every Check and worked example that touches a changed object was recomputed. That covers §0.3 (old Checks
`log ζ_p = 0`, `r = 1`, `r = 2` at `p = 2`: unchanged), §1.2 (`a = 0, 1`, `c = 1/2`, `p = 2`,
`ā^p ≠ ā`: unchanged), §§2.3–2.6 (degrees `1, 2`, `2, 6`, and the `uπ` tower Checks: consistent with
the new bridge), §§4.3–4.4 (`ℓ_(±1)`, `−1/14`, `y² + y = x³`: consistent with the two new theorems) and
§3.6 (heights 1, 2 at `O_r`: unchanged).

## Ownership and sources

- Ownership: `roadmaps grep` finds `G_LT` only in VectorBundlesAndIsocrystals (its definition). No
  roadmap, on main or at any readable open head, states the comparison of `G_LT` with a Lubin–Tate
  series, so this roadmap owns that comparison: it owns the series construction and is later in the
  merge order. No roadmap or pinned library states Honda types; `roadmaps grep --lean-only` finds no
  match for the new declaration names. No Lean name here is the fully qualified name of another
  roadmap's declaration.
- Sources: no new source. H70 was re-read at lines 69–300 (§1), 241–262 (Theorem 1), 302–320
  (condition (F)), 431–500 (Theorems 2–3) and 738–749 (Lemma 4.2). LT65 is still `uncertified`, cited
  by locator, and not requested again. No `needs-references.toml` entry.

## For the maintainer

- New supplier: VectorBundlesAndIsocrystals Layer 5, "Lubin–Tate universal cover and sections of
  O(1)". The edge points downward (line 124 against 344). The §2.3 bridge reads the supplier's
  normalization (`W_(O_E)(k)`, `F = σ/π`, with the special fibre over `k_K`). Should that supplier
  later choose a model of `G_LT` over `O_E` for another uniformizer, the §2.3 statement would need
  its uniformizer changed, and the `uπ` Check is there to catch that.
- Renamed Lean declaration: `existsUnique_lubinTate_intertwiner` is now `exists_lubinTate_interpolation`
  (all arities). No other roadmap cites the old name. New Lean names:
  `exists_hondaType_log_of_map_zsmulSeries`, `exists_strictIso_hondaLog_of_map_zsmulSeries`.
- Consumers that cite LT.k ids or the design titles (AnticyclotomicLocalUnits,
  ComplexMultiplicationAndExplicitReciprocityPartII, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower,
  RelativeFarguesFontainePartII) now resolve through the former-numbering table. No section of this
  README was renumbered in this round.
- Not verified: the LT65 text (uncertified). The supplier's Dieudonné variance was read from its
  stated normalization and its `G̃(A) = A^♭°°` identification, not from its sources.
