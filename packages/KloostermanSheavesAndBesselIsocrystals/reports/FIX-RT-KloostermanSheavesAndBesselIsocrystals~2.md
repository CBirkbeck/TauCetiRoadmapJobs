# FIX-RT-KloostermanSheavesAndBesselIsocrystals~2

Repair of red-team round 2 (passes a and b). Eleven findings; the two P1 findings overlap and are settled once.
Ten sections: nine applied (two of them differently), none disputed, none not actionable.

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F01, RT-KloostermanSheavesAndBesselIsocrystals~2b/F01 (P1) — applied differently

Both witnesses hold: §4.3 fixed the central scalar by "weights" (`±C(0)` have equal weights, traces of opposite sign),
and §6.2 used HNY Theorem 1(2), owned nowhere. New §1.9 (ℓ-adic local monodromy and Frobenius at `0`) with
gap:equal-characteristic-central-sheaves on GlobalShtukasAndFunctionFieldLanglands Layer 1; §4.3 and §6.2 routes
rewritten through it, naming every input.

Why differently: 2a's repair is applied as proposed; 2b's D'Addezio route for §6.2 is not, because §4.3 needs the
ℓ-adic scalars at `0` anyway (XZ lines 2335–2342), so §6.2 uses §1.9 as XZ does (XZ lines 2404–2408), with 2b's
named inputs (§§RD.5.89, RD.6.55; EtaleDualityAndPerverseSheaves §5.2; §§IG.0.T3, IG.1.2; Riemann–Hurwitz written
out). Gaitsgory (Gai01 line 225) and Görtz–Haines (GH07 line 82) were fetched.

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F02 (P2) — applied

§1.1 Check: "`E_{−π}` in (ii) and the Dwork F-isocrystal in (iii) have the matching trace function" → the
analytification of `E_{−π}`, Frobenius forgotten, is the underlying connection of the Dwork object; the multiplier
`exp(π(t − t^q))` gives `ψ ∘ Tr`; the algebraic `D`-module has no trace (multiplier `2·exp(…)` gives `2^d ψ(Tr a)`).
No other passage assigns traces to de Rham objects (searched).

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F03 (P3) — applied

§1.3 Check: "hypercohomology of `IC_μ ⋆ IC_μ` … super vector space with odd part" → `H^*(IC_μ)` sits in odd degrees
`−1, 1`; the uncorrected constraint is minus the flip (`e ⊗ e ↦ −e ⊗ e`), categorical dimension `−2`; the tensor
square lies in degrees `−2, 0, 2` (dimensions `1, 2, 1`).

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F04 (P3) — applied

§9.2 Check: "multiplies the trace by `−1`" → by `(−1)^m`. Over `𝔽₃`, quadratic `ρ`: `g² = −3`, `g₂ = 3` (sign change
for `m = 1`); `m = 2`: `9 = 9`; `m = 0`: nothing changes. The API bullet `g_{j,d} = (−1)^{d−1} g_j^d` was already
correct.

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F05 (P2) — applied

§6.5: discrete parameter `ϕ : W_{k_∞} → H` "with finite image on inertia" → `ϕ : W_{k_∞} → H(K̄)`, continuous on
inertia with finite image (open kernel), Frobenius image semisimple, finite centralizer (GR line 530, §3.2, p. 15).
New Check: 2a's discontinuous central twist over `𝔽₂((t))` (dense non-open kernel) is excluded. §6.6 now verifies
continuity and semisimplicity (GR Lemma 3.1, GR line 540).

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F06 (P2) — applied differently

§2.4: "for every `χ ∈ Spec A`" → for every `K`-algebra character `χ : A → K` (`K` the algebraically closed base field,
now named), as Zhu states it (Zhu lines 377–380, 435–439). 2a's extension to all scheme points over `κ(χ)` is not
added: it is a new claim with no locator and no consumer. New Check: `A = K[t]`, generic point. Oper renamed `o_χ`
(`π` is the Dwork parameter).

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F07 (P3) — applied

MotivesAndAlgebraicCycles §6.5 (heaps) → §6.8 (tensor-isomorphism torsor, its two actions, conjugation twist),
verified at its head (§6.8: "Construct `Isom^⊗(ω_R,η)` … conjugation"). Replaced in the supplier contract, §6.1
(statement Needs and API bullet), §7.1 Needs, and the Layer 6 and Layer 7 Dependencies: six occurrences.

## RT-KloostermanSheavesAndBesselIsocrystals~2a/F08 (P3) — applied

§10.4: the two non-discriminating Checks replaced by 2a's three (recomputed exactly): `F = 1 − 8x + 8x²`,
`G = 1 + 8x + 24x²`; `h = 1 − 16x + 112x²`, `h′(0) = −16 = η_F(0) − η_G(0)`, `h f_G = f_F h(x²) = 1 − 8x + 0·x²`;
`f_{F,2}`, `f_{F,4}` have `x²` coefficients `16`, `8` (`G`: `16`, `24`). The domain Check is kept.

## RT-KloostermanSheavesAndBesselIsocrystals~2b/F02 (P3) — applied

§5.2: the Satake-parameter step now cites GlobalShtukasAndFunctionFieldLanglands §1.12 (normalized spherical
Satake, verified at its head) in the route, its *Needs* line and the Layer 5 Dependencies.

## RT-KloostermanSheavesAndBesselIsocrystals~2b/F03 (P3) — applied

§6.6: "the local Weil parameter at `∞` attached to the companion" → "the local monodromy parameter at `∞` of
`Be_H†` (§RD.6.51), a Weil–Deligne parameter … whose nilpotent part vanishes"; HNY Theorem 2/Corollary 2.15 are
labelled as the ℓ-adic analogue, not a target. §11.5: "adjoint upper break" → that of `Ad(Be_H†)`. Downstream
consumers say "for the Bessel object".

## Checks run

- `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` (from the content checkout):
  exit 0; output only the four `declaration uses 'sorry'` warnings (lines 66, 133, 145, 158). `Suggested.lean` is
  unchanged by this round.
- Signature check: a scratch copy of `Suggested.lean` followed by `#check @name` for all ten declarations
  (`dworkBlock`, `signed_dwork_congruence`, `kloostermanSum`, `orthogonalSum`, `quadraticCharIn`,
  `quadraticHypergeometricSum`, `traceChar`, `orthogonalSum_sub_card_eq_kloostermanSum`,
  `gaussSum_mul_orthogonalSum_sub_card`, `orthogonalSum_ordinary`), elaborated once, exit 0. Every elaborated type
  carries the binders of its README statement (no `variable` block; nothing dropped). Nothing changed.
- Dependency check (`gate --depcheck … --movable`):

  ```text
  depcheck: 239 roadmaps, 2180 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. New supplier edges: InverseGaloisAndArithmeticFundamentalGroups (order 55),
  LefschetzPencilsAndVanishingCycles (69), EtaleDualityAndPerverseSheaves (108), all before this roadmap (366);
  SchemeAndStackFoundations is on main; GlobalShtukasAndFunctionFieldLanglands (360) was already a supplier.
- `roadmaps resolve` on the README: one lead, line 160, KloostermanMomentsAndPotentialAutomorphy §2.6 — the known
  false positive (a board package; its §2.6 exists at its head, as both reviews recorded). Lean names found nowhere:
  none.
- `design/plan.json` parses; its 13 gap slugs equal the 13 `gap:` slugs of the README.
- `sources.toml` parses (26 sources). Two added through the sources service: `Gai01` (arXiv:math/9912074v4) and
  `GH07` (arXiv:math/0402143v1), both certified open-repository texts; HNY, GR, AC, XZ locators and `cited_for`
  extended. No `needs-references.toml` was produced: no text is missing.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.9 Frobenius at `0`: char. poly `det(1 − (2ρ)(c_q)T∣W)` | `W = 1`; `SL₂` Std; `SL₂` Sym²; torus, trivial datum | `1−T` both sides; `{c_q^{−1}, c_q}` both; `{q^{−1}, 1, q}` both; `(1−T)^{dim W}` and `2ρ = 0` | holds | new target |
| §1.9 scalars, not weights | `SL₂` Std, `ε = −1` | trace `−(c_q + c_q^{−1})` vs `c_q + c_q^{−1}`; same absolute values | `ε = −1` excluded | Check |
| §1.9 principal unipotent | `Lie SL₃`; subregular alternative; torus | grading `1,2,2,2,1` in `−4…4`, blocks `3, 5`, `dim ker = 2 = rank`; subregular kernel `4`; torus `N = 0` | regular | Check |
| §1.9 hypotheses | `G = 𝔾_m`, nontrivial `χ` (order 4 over `𝔽₅`) | inertia acts through `χ`, not unipotently | trivial `χ` needed | Check |
| Weil–Deligne direction | `Φ = diag(c_q^{−1}, c_q)`, `N = E₁₂` | `Φ N Φ^{−1} = c_q^{−2}N = q^{−1}N`; matches §4.3 `C N C^{−1} = q^{−1}N` and DWP §5.11 | consistent | Check |
| §4.3 route (`ε = 1`) | `SL₂` Std; `SL₃` Std, `ε ∈ μ₃`; `PGL₂` | top-valuation eigenvalue `−c_q` vs `c_q`; `ζc_q²` vs `c_q²` forces `ζ = 1`; `Z = 1` | `ε` determined | route rewritten, Check |
| §6.2 Euler characteristic | `SL₂` Std over `𝔽₃` | normalized traces `1/√3`, `−2/√3`, sum `−1/√3 = −c_q^{−1}(Σψ)²`; `Swan_∞ = 1`, `χ_c = −1`; tame would give `0` | consistent | route, Check |
| §6.2 tame `π₁(𝔾_m)` | Galois degree `d`: `2g−2 = −2d + (d − r₀) + (d − r_∞)`; Kummer `z ↦ zⁿ` | `= −(r₀ + r_∞)`, so `g = 0`, `r₀ = r_∞ = 1`; Kummer: `d = n`, `r₀ = r_∞ = 1` | procyclic | route |
| §6.2 `G_geo°` semisimple | `SL₂`; torus | centre `{±1}` finite; torus: no principal `SL₂`, Check already present | holds | route |
| §6.5 continuity | 2a's twist over `𝔽₂((t))`; degree-20 control | kernel dense, not open; control kernel open | excluded / included | definition, Check |
| §6.6 Frobenius semisimple | `SL₂`, `p` odd | centralizer `{±1}`, `ϕ(W)` finite (GR Lemma 3.1) | holds | route clause |
| §2.4 characters | `A = K[t]` | `t ↦ 0` has kernel `(t)`; `(0)` is no kernel of `K[t] → K` | restricted | statement, Check |
| §1.1 Check | multiplier `2·exp(π(t − t^q))`, `𝔽₂`, `a = 1`, `d = 1` | trace `−2` vs `−1` | multiplier is datum | Check |
| §1.3 Check | `PGL₂`, minuscule | `e⊗e ↦ −e⊗e` vs `e⊗e`; sdim `−2` vs `2`; square degrees `−2,0,2`, dims `1,2,1` | discriminates | Check |
| §9.2 Check | `m = 0, 1, 2` over `𝔽₃` | factor `1`, `−1` (`−3` vs `3`), `1` (`9` vs `9`) | `(−1)^m` | Check |
| §10.4 Checks | `n = 1`, exact rationals | values in the 2a/F08 section; also `x³` coefficient of `h f_G` and `f_F h(x²)` both `1664/27` | consistent with §10.5 (`h^{−1}` on duals) | Checks |
| gap:equal-characteristic-central-sheaves | `W = 1`; minuscule `PGL₂` | `Z(δ) = δ` (Gai01 line 211); constituents at the base point `IC(0), IC(−1)`, Frobenius `1, q`, i.e. `c_q^{−1}, c_q` after the twist | consistent with §1.9 | new gap |
| MotivesAndAlgebraicCycles §6.8 | `μ₂`-torsor `Spec ℚ(√2)` | torsor without rational section (its §6.8 Check) | correct locator | citation |

## Ownership and suppliers

- The local monodromy and Frobenius of `Kl_H^{ét,ℓ}` at `0` (HNY Theorem 1(2)) is owned here (§1.9): searches for
  "principal unipotent", "regular unipotent", "central sheaves", "Gaitsgory" over main and the open heads find no
  other owner; GlobalShtukasAndFunctionFieldLanglandsPartII consumes it from this roadmap.
- Gaitsgory's equal-characteristic central functor and the Görtz–Haines constituents are owned nowhere
  (GeometricSatakeAndFusion treats Fargues–Fontaine local models, not the function-field degeneration). They are
  requested from GlobalShtukasAndFunctionFieldLanglands Layer 1 (BD Grassmannians §1.1, Iwahori Hecke geometry
  §1.6, Satake §1.9) by gap:equal-characteristic-central-sheaves, as 2a proposed.
- Citations verified at the heads: GlobalShtukasAndFunctionFieldLanglands §§0.14, 1.6, 1.8, 1.9, 1.12;
  InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3, IG.1.2; EtaleDualityAndPerverseSheaves §5.2
  (`curveEulerPoincareSwan`); LefschetzPencilsAndVanishingCycles §0.6; DeligneWeightsAndPurity §§5.11, 8.14, 8.19;
  MotivesAndAlgebraicCycles §6.8; PadicDifferentialEquationsAndRigidCohomology §§RD.2.51, RD.5.89, RD.6.25,
  RD.6.51, RD.6.52, RD.6.55; SchemeAndStackFoundations §3.2 (`scheme_riemann_hurwitz`) on main.
- No notion moved down from a later roadmap.

## For the maintainer

- New gap for GlobalShtukasAndFunctionFieldLanglands: gap:equal-characteristic-central-sheaves (Layer 1). Extended
  gap for PadicDifferentialEquationsAndRigidCohomology: gap:arithmetic-d-module-operations now also names Abe–Caro
  Theorem 4.3.1, nearby-cycle ℓ-independence and the log-fibre identification of nearby cycles (XZ Proposition 2.9.4).
- New section §1.9; no id was renumbered or dropped. GlobalShtukasAndFunctionFieldLanglandsPartII §4.0 uses the
  principal unipotent action of `I_0` on `Kl_{H,Ad}` (its Check on `ker(ad N)`); §1.9 now owns that fact, and the
  former label KB.1 still maps to Layer 1.
- Pattern repairs beyond the cited lines: the p-adic semisimplicity of `G_geo°` in §6.2, previously cited only to the
  ℓ-adic DeligneWeightsAndPurity §8.19, now cites Abe–Caro Theorem 4.3.1 (AC line 3019); §1.6's locator is narrowed
  to HNY Theorem 1(1),(3); the ℓ-adic trace formula's owner (§IG.0.T3) is named where it is used.
- New suppliers: InverseGaloisAndArithmeticFundamentalGroups, EtaleDualityAndPerverseSheaves,
  LefschetzPencilsAndVanishingCycles, SchemeAndStackFoundations (all earlier or on main).
- The other open pull request on this roadmap (the export of the same roadmap) must take these repairs when the
  two texts are reconciled.
- No suspicious instructions were found in the reviews or fetched texts.
