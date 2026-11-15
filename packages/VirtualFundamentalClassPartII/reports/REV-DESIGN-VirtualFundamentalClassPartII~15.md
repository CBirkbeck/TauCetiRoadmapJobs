<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6903151729 -->
Review (claude) of 96954fd

Verdict: needs_changes

1. **F01** (P3) 8.4 asks the base curve to be smooth; the route uses regularity only

   - **Location.** `design/README.md` 8.4: "Let `B` be a smooth connected curve over `k`, separated or not: a
     connected `k`-scheme of finite type, smooth of dimension one"; `design/plan.json` 8.4, `statement` and
     first `hypotheses` entry.
   - **Claim.** Deformation invariance of the count needs `B` smooth over `k`.
   - **Witness.** `k = 𝔽_p(a)`, `p` odd, `B = Spec k[x, y]/(y² − x^p + a)`: regular (at `P = (y, x^p − a)` the
     maximal ideal is `(y)`), not smooth at `P`. With `𝔐 = Spec k`, `X = B`, `E = 0`: count `1` at `P` and at
     every other closed point.
   - **Why it holds without the hypothesis.** The route uses that `{b} → B` is a regular immersion of
     codimension one (true at every closed point of a regular one-dimensional scheme), that
     `A_1(B)_ℚ = ℚ·[B]` (a connected regular Noetherian scheme is integral) and that `i_b^![B] = [{b}]` (4.2,
     `B` equidimensional). Smoothness over `k` enters nowhere, and Convention 1 assumes no perfectness.
     Over a perfect field the two hypotheses coincide. This is the pattern of round 14's F01, on the same
     sentence.
   - **Repair.** In 8.4 write "Let `B` be a regular connected curve over `k`, separated or not: a connected
     regular `k`-scheme of finite type and of dimension one (smooth when `k` is perfect)", and in the route
     "a closed point of the regular scheme `B`" stays as it is. Change the plan's 8.4 `statement` and
     `hypotheses` to match. Add the witness as a Check. Tested on the witness: `[X]^vir = [B]`,
     `(X → B)_*[B] = 1·[B]`, `i_P^![B] = [P]`, `deg_{κ(P)}[P] = 1`, with `[κ(P) : k] = p` and `k`-degree `p`.
     Regularity stays: at the node of `Spec k[x, y]/(xy)` the closed point is not a regular immersion.

2. **F02** (P3) 5.2's base-change bullet leaves the class of `M′` unstated

   - **Location.** `design/README.md` 5.2, API, first bullet: "For a morphism of algebraic spaces `M′ → M`,
     `M′` is a moduli space for `ℳ ×_M M′`"; `design/plan.json` 5.2, `api`, `moduliSpace.baseChange`.
   - **Claim.** Every algebraic space over `M` is a moduli space for the base change.
   - **Witness.** `ℳ = BG`, `M = Spec k`, `M′ = ⊔_ℕ Spec k`: `ℳ ×_M M′ = ⊔_ℕ BG` is not quasi-compact, so it is
     not a stack of Convention 1 and `M′` is not of finite type; 5.2's definition does not apply to the pair.
   - **Rated P3, not P2,** because the conclusion cannot be stated outside the class (5.2 defines a moduli
     space only for a stack of Convention 1 and a quasi-separated algebraic space of finite type), so the
     slip is one of wording; 3.5 already writes "a morphism `q : Y′ → Y` of such algebraic spaces".
   - **Repair.** Write "For a morphism `M′ → M` of quasi-separated algebraic spaces of finite type over `k`";
     the same words in the plan's bullet. Tested: for `M′ = Spec K`, `K/k` finite, `BG_K → Spec K` is proper
     and bijective on geometric points; for `[𝔸¹/μ₂] → 𝔸¹_y` and `M′ = {0}`, `[Spec k[x]/(x²)/μ₂] → Spec k` is
     proper with one geometric point; in both, the diagonal of `ℳ ×_M M′` is a base change of that of `ℳ`
     followed by a base change of that of `M′`, so it is a stack of Convention 1.

Two findings, both P3 (R01, R02); no P1 and no P2. Each asks for a repair in the design text, so the
verdict asks for changes. The two declared supplier gaps,
`gap:closed-substacks-of-stacks` (VirtualFundamentalClass §2.1) and
`gap:normal-cones-of-local-immersions` (VirtualFundamentalClass §1.5), are not findings: both are precise,
minimal and declared under the same slugs in `packages/VirtualFundamentalClassPartII/design/plan.json` and
in the README's supplier contracts.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (2091 lines, read in full),
`packages/VirtualFundamentalClassPartII/design/plan.json` (9 layers, 33 targets, 2 gaps; the 5.2, 8.4 and
9.5 entries and the gaps read against the README) and `packages/VirtualFundamentalClassPartII/sources.toml`
(14 entries). This is a design: there is no `Suggested.lean`. This lane does not elaborate, so no
elaboration, no `#check` comparison and no one-tactic probe were run, and none applies at this stage.

## Round-14 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3), 8.4 base assumed separated | repaired | 8.4: "Let `B` be a smooth connected curve over `k`, separated or not: a connected `k`-scheme of finite type, smooth of dimension one, hence a stack of Convention 1"; route: "No step uses separatedness of `B`"; two Checks added (`B = L`, and connectedness); plan 8.4 `statement`, `hypotheses`, `tests` agree. |
| F02 (P3), 9.5 curve class for projective targets | repaired | 9.5: "For `X` proper of pure dimension (projective in AlgebraicGromovWittenTheory §4.3), each `F_t : C_t → X_{κ(t)}` is proper, `C_t` being proper and `X` separated"; 9.1: "stated for proper `X`"; Check added (`ℙ¹ × 𝔸¹`); plan 9.5 `statement` and `tests` agree. |

Both repaired passages were recomputed (table below). The repaired pattern, a hypothesis on a base or
target that no step uses, was looked for in every section: R01 is the one further instance. The other
hypotheses read are each used: 1.3 (separated morphism), 5.1 (`T` separated), 5.3 (the suppliers'
hypotheses), 5.4 (proper), 6.3 (`H⁰(E)` locally free, used in the first case and automatic in the
second), 8.2 (pure dimensions), 8.3 (finite unramified diagonal), 9.1 (smooth target), 9.4 (ampleness on
fibres, reduced fibres).

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 237 roadmaps, 2244 edges, 0 problem(s)

No UPWARD and no CYCLE line. The citation resolver, run again on the README, lists no cross-roadmap
citation and no Lean name found nowhere. Suppliers: VirtualFundamentalClass and StableReductionPartII
(open pull requests that add new folders), and SchemeAndStackFoundations,
EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra (folders
on main). AlgebraicGromovWittenTheory is named as a consumer and for comparison only.
GromovWittenTheory and ImplicitAtlases occur only under "Not part of this roadmap". The stopped package
VirtualFundamentalClasses and the roadmaps of the never-cite list occur 0 times.

## Maintainer notes

None stands as a finding.

1. Words: holds in the text. Convention 2 uses "local immersion" for the class and "local embedding" for
   the chart pair, and gives Vistoli's words once.
2. Cotangent complex: holds. Convention 6 defines no truncated complex; 9.3 builds `φ` into `L_{M/𝔅}` from
   the projection formula and the trace; 7.1's `τ^{≥−1}L_{T/T̄} = J[1]` is the target of the obstruction
   class only.
3. Integral and rational groups: holds, by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and the relative invariance with the plane example. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at its open
   head reads "prove invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch, Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and says that no compatibility datum over the
   graph is used, with the reason (the obstruction to the lift lies in `Ext¹(g^*Ω_{Z′/𝔜}, u^*E)`).
6. Suppliers: holds. AlgebraicVectorBundles, EllipticCohomology and DerivedDeRhamCohomology occur 0 times
   in the README and in the plan; the plan's `suppliers` are the seven named above, each cited by section.

## Adversarial table

Rows: the 15 sampled targets, the two repaired passages, the headline statements among them, and the
targets of R01 and R02. Every value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 finite cover (sampled) | `L`; `B_{𝔸¹}G` with `L → B_{𝔸¹}G`; `BG` | separated `Z → L`: two lifts of one generic point, impossible; `Q ×_L Q = Q ⊔ Q\|_{t≠0} = Q ×_{𝔸¹} G`, base change `Q → 𝔸¹` of rank `2`; torsor degree `2` over `t ≠ 0` and `1` over `0` on one component | holds; a separated cover need not exist | none |
| 1.1 proper coverings | component of `Z` dominating integral `ℳ` | finite image closed and dense, so surjective; generically finite | holds | none |
| 1.2 function field, `e` (sampled) | `[𝔸¹/μ₂]`; `B_{𝔸¹}G`; `[Spec ℂ/(ℤ/4)]` over `ℝ`; `Bμ₃` over `ℚ` | `k(x²)`, `e = 1`, `e(Bμ₂) = 2`; `e = 2`, stabiliser `1` at `0`; `ℂ^{ℤ/4} = ℝ`, `e = 2`; inertia degrees `1 + (3/3)·2 = 3` | holds | none |
| 1.3 degree (sampled) | `Spec k → BG → Spec k`; `𝔸¹ → Spec k`; `ℤ/p` on `𝔸²`; `L → B_{𝔸¹}G` | `\|G\| · (1/\|G\|) = 1`; `0`; norm `y^p − x^{p−1}y`, `(1/p)·p = 1`; `(2/1)·1 = 2` | holds | none |
| 1.3 dominant base change | `BG → pt` along `BH → pt`; `pt → B(ℤ/2)` along a nontrivial torsor `Spec K`; `pt → BG` along itself | `\|H\|/(\|G\|\|H\|) = 1/\|G\|`; fibre product `Spec K`, `[K : k] = 2 = \|ℤ/2\|`; `G` not integral for `\|G\| > 1`, outside the statement | holds with "integral" | none |
| 3.1 flat pullback (sampled) | `π : Spec k → BG`; coarse map of `[𝔸¹/μ₂]`; étale 2-isogeny `E′ → E` | `[Spec k]`; `2·[Bμ₂]`; divisor of degree `0` and sum `2Q + T − T = π̂(P) = O` | holds; not injective integrally | none |
| 3.2 pushforward (sampled) | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `ℙ¹ → Spec k` | `\|G\|·[0 × BG]` both sides, norm alone gives `[0 × BG]`; `[κ(P) : k]` | holds; factor `e(f(𝒱))/e(𝒱)` an integer by Lagrange | none |
| 3.3 push–pull, localisation (sampled) | `π` against itself; `[𝔸¹/μ₂]`, `𝒵 = Bμ₂`; `ℙ¹`, two points | `\|G\|·[Spec k]` both, `Σ_z [κ(z) : k] = \|G\|`; `ℤ → ℤ/2 → 0 → 0`; kernel `ℤ·(1, −1)` | exact on the right only | none |
| 4.2 Gysin on stacks (sampled) | `π : Spec k → BG`, `Y = Spec k`; the space `X` over `𝔸¹_ℝ`; `ℱ′` for `ℱ → 𝒢` a local immersion | `\|G\|^{−1}·\|G\|·[Spec k]`; `div(t) = [0_X]`, `A_0(X) = 0 = A_1(X × 𝔸¹)`; diagonal of `ℱ′` an open immersion then a base change of `Δ_{𝒢′}` | holds; `ℱ′` is a stack of Convention 1 | none |
| 4.4 agreement (sampled) | `B(ℤ/2) → Spec k`; `O(1)` on `ℙ¹`; `Spec k` | `(1/2)·[Spec k]`; a point class; `1`; each a Check of VirtualFundamentalClass §2.1 or its Layer 2 Examples, read at the head | holds | none |
| 5.2 moduli spaces (sampled, headline) | `BG`; `[𝔸¹/μ₂]`; `ℤ/p`-quotient; `ℳ = M = L`; `B_{𝔸¹}G → 𝔸¹` | `(1/\|G\|)·[Spec k]`; `ℤ/2 → 0` integrally, `0 ≅ 0` rationally; `p/p = 1 ≠ 1/e`; identity; not separated, so not proper, excluded | holds; rational only | none |
| 5.2 API, base change (R02) | `M′ = ⊔_ℕ Spec k`; `M′ = Spec K`; `M′ = {0} ⊂ 𝔸¹_y` | `⊔_ℕ BG` not quasi-compact; `BG_K → Spec K`; `[Spec k[x]/(x²)/μ₂] → Spec k`, one geometric point | holds for `M′` of finite type and quasi-separated | R02 |
| 5.3 products (sampled, headline) | `G = 1`; `μ_n` on a point; `𝔾_m` on `𝔸² ∖ 0`, weights `(1, 2)` | identity; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; `ℤ[t]/(2t²)`, `∫t = 1/2`, `∫2t = 1`; gradings `A_{(n−c)−g}` on both sides | holds | none |
| 5.4 degree of a point (headline) | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]`, `t²/(t² − 1)` | `2/4 = 1/2`; orders `2, −1, 0`, `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1–6.2 (headline) | `[O(−4) → Ω]` on `ℙ¹`; `𝓛_n` on `L` | `Ext¹ = H¹(O(−2)) = k`, `P = O(3)²`, `c_1(O(3)²/O(2)) = 4`; `n·[0₂] = −n·[0₁]` | holds | none |
| 7.1 obstruction class (sampled, headline) | `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε`; étale; smooth with `T` affine | torsor under `1 + J ≅ J = Hom(O, J)`; `(ε + aε²)² = ε² ≠ 0`; `L = 0`; `Ext¹ = 0` | holds; `L_X` in place of `L_{X/𝔜}` gives the zero group | none |
| 7.2 characterisation (headline) | characteristic `2`, `E = L_X`, `φ = (0, id)` | `φ^*ω = 0` (the class lives on `H^{−1}`), no lift since `(x + ax²)² = x²` | condition 3 fails where 1 fails | none |
| 8.1 non-reduced ambient (headline) | `𝔸¹ × Spec k[ε]/(ε²)`, origin | `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `∂β = 2·[ν = 0] − 2·[T = 0]` | multiplicities kept | none |
| 8.2 regular pullback (sampled, headline) | node with `V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)`, `t = 0`; purity of `𝔜′` | `−2·[pt × pt]` both ways; `2·[pt]` both ways; a nonzerodivisor cuts each component by exactly `1` | holds | none |
| 8.4 deformation invariance (sampled, headline, repair) | `B = L`, `Z(x² − t·y²)`; `𝔸¹_ℂ → 𝔸¹_ℝ`; `B = 𝔸¹ ⊔ 𝔸¹`; `{xb = 1}` | `2, 2, 2`, `[X]^vir = [X]` since the cone is all of `F_1 = O(2)\|_X`; `2` at real and at complex points; `1` and `0`; `1` and `0` | holds for `B` not separated; connectedness and properness needed | none |
| 8.4, `B` regular (R01) | `y² = x^p − a` over `𝔽_p(a)`, `X = B`, `E = 0`; node | `m_P = (y)`, count `1` at `P` (`[κ(P) : k] = p`) and elsewhere; closed point of the node not a regular immersion | holds for regular `B` | R01 |
| 8.4, 4.2's bullet used by the route | `𝒢 = B`, `𝒢_1 = 𝔐 × B`, `𝒢′ = B`, `𝒢″ = X` | `η_b^! = i_b^!` on `A_*(X)_ℚ`; `i_b^! p_* = p_{b*} η_b^!` although `B` does not map to `𝔐 × B` | the bullet covers the step | none |
| 9.2 duality (sampled) | smooth curve, `L` of degree `e`; `ω_C`; nodal fibre | `e + 1 − g`; `g − 1`; `2g(Ẽ) − 2 + #branches` | holds | none |
| 9.4 resolution (sampled, headline) | `V = O`, genus `g`; `L = O`; embedded point | `h¹(H) − h¹(G) = χ(G) − χ(H) = 1 − g`; `G = O`, `H = 0`, `H⁰` missed; `H⁰(O(−N) ⊕ k_p) = k` | holds; ampleness and reducedness used | none |
| 9.5 rank and dimension (headline, repair) | lines in `ℙ²`; `c_1 = 0`, dimension `3`; prestable curves | `−3 + 3 + 2 = 2`; `n`; `3g − 3 + n + δ + dim X·(1 − g) = (1 − g)(dim X − 3) + n + δ`, the formula read at AlgebraicGromovWittenTheory §4.3 | holds | none |
| 9.5 curve class (repair) | `ℙ¹ × 𝔸¹`, `F = ℙ¹ × 0`; `P` with a doubled point | `F^*T = O(2) ⊕ O`, `δ = 2`, `ℓ = 2`, `0 + 2 + 2 = 4 = dim(PGL₂ × 𝔸¹)`, `H¹ = 0`, `β = div(t) = 0`, `A_0 = 0`; `F` not proper, `δ = 2`, dimension `3` | properness is what the curve class needs | none |

## Verified sound

- **Shape.** 9 layers, 33 numbered sections, each with a *Needs:* line and at least 3 Checks (counted by
  script: minimum 3, maximum 7); every layer ends with Examples and Dependencies. A search found no LaTeX
  delimiters, no `lemma`, no process words, no pull-request numbers, no machine paths and no
  `set_option`. Proposed names are in italics; every backticked Lean name is a library or supplier
  declaration.
- **Headline statements** (Summary): 2.2–2.3, 4.1–4.3, 5.1–5.4, 6.2, 7.1–7.2, 8.1–8.4, 9.3–9.5. Each is a
  named target with a locator. None is statable at the pins: neither pinned tree contains
  `IsAlgebraicStack` or `IsDeligneMumford` (searched).
- **Sampled locators, read at the text** (the author flagged none as unverified). All 15 sampled sections
  carry the item number, the hypotheses and the statement the README gives:
  - vistoli1989 lines 299–328, 337–376, 379–452, 542–584, 974–1074, 1197–1207, 1603–1623, 1655–1672,
    1758–1776;
  - rydh2015 lines 81–90; deligne-mumford1969 lines 1012–1019; kresch1999b lines 307–315, 329–343, 396–404;
  - behrend-fantechi1997 lines 890–897, 1067–1078, 1300–1306, 1414–1418, 1592–1597, 1607–1609, 1634–1643,
    1664–1699;
  - edidin-graham1998 lines 1042–1045, 1069–1076; keel-mori1997 lines 28–29;
  - li-tian1998 lines 1472–1474, 1501–1503, 1565–1566; behrend1997 lines 165–187;
  - stacks-chow-spaces lines 813–819.
- **Pinned declarations opened** (`lake-manifest.json`: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to the
  plan's baseline):
  - `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: `AlgebraicCycle` (44), `map` (69,
    `[QuasiCompact f]`); `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: `ord` (52; value `0` for `f = 0`
    and for `coheight z ≠ 1`, as the contract says).
  - `TauCeti/AlgebraicGeometry/Chow/Basic.lean`: `cyclesOfDimension` (86), `RatEquiv` (257), `ChowGroup`
    (295), `cycleClass` (304), `equivIntOfUnique` (369); `Chow/ClosedImmersion.lean`: pushforward along
    closed immersions (docstring lines 15–18).
  - `TauCeti/AlgebraicGeometry/Stack/Basic.lean`: `SchPseudofunctor` (37);
    `AlgebraicSpace/Basic.lean`: `IsAlgebraicSpace` (docstring line 34: fppf sheaf, representable diagonal,
    étale atlas; no quasi-separatedness); `Curves/Prestable.lean`: `PrestableFamily` (45: proper,
    geometrically connected, at worst nodal; genus separate; syntomic of relative dimension one);
    `VectorBundle/Degree.lean`: `vectorBundleDegree` (82: `χ(E) − r·χ(O)`).
- **Cross-roadmap citations resolved.**
  - VirtualFundamentalClass at its open head: headings §§0.1–9.6 exist under the cited numbers; its
    Conventions and §§1.5, 1.6, 2.1–2.5, 7.6, 7.7, 9.1–9.6 were read and say what the contract quotes (§1.5:
    representable closed immersions only; §2.1: separated stacks, rational; §2.5: Kresch's restricted
    action and the plane example; §9.2: separated with the resolution property; §9.4: smooth bases).
  - SchemeAndStackFoundations on main: §§1.3, 1.9, 1.10, 1.18–1.23, 2.6, 2.10, 2.18–2.20, 3.3, 4.1, 4.14,
    5.1–5.6 exist under the cited numbers; 29 declaration names the contract quotes were searched and each occurs in
    its README; §1.23 (`keel_mori`: finite inertia, `π` proper and quasi-finite), §5.5 (regular immersions
    that need not be closed, the `z ↦ z²` Check) and §5.6 (no separatedness, the extended Gysin map of the
    diagonal) were read.
  - StableReductionPartII at its open head: §5.15 states the Edidin–Graham comparison
    `A_{i−d}([X/G])_ℚ → A^G_i(X) ⊗ ℚ` with the hypotheses the contract quotes, compatible with Chern classes
    and proper pushforward, and no product statement.
  - AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 exist; characteristic zero and projective
    targets; §4.3's dimension is `(1 − g)(d − 3) + n + c₁(T_X)·β`.
  - EquivariantIntersectionTheory on main: Conventions 1, 4, 5 and §§2.1–2.2; StableReduction on main:
    Layers 2 and 3; EnhancedDerivedSheaves on main: §0.3, E1.4, E1.8; DerivedModuleAlgebra on main: §§0.7,
    0.12, 0.25. Each heading exists under the cited number.
- **Gaps.** Both `needs` sentences name one construction with its properties and hypotheses.
  VirtualFundamentalClass §1.5 at its head forms cones of representable closed immersions only, and its
  §2.1 uses integral closed substacks without stating their theory; neither gap asks for what a
  supplier, Mathlib or Tau Ceti already states.
- **Duplication and ownership.** Fixed-string searches of main and the open heads: "deformation
  invariance" (AnalyticStableMaps only, symplectic), "proper cover" (unrelated uses), "Chow groups of
  Deligne" (AlgebraicGromovWittenTheory's convention line), "generic stabiliser", "stabilizer order"
  (group-action roadmaps, unrelated), "Poincaré duality for bivariant" (no match),
  "VirtualFundamentalClassPartII" (no match). No other roadmap states a target of this one. The overlap
  file lists no dropped id, no revision-only id, no conflicting head and no second copy; the roadmap is
  not on main. Layer 9 against AlgebraicGromovWittenTheory §4.1 is settled by the maintainer's ownership
  note: Layer 9 is the statement for every base and every smooth target scheme and builds no moduli
  stack.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source. The
  order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 1.1, 1.3, 3.1–3.4; 5.1
  needs 4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 (8.2 needs 6.2) and 9 after 7 (9.1 needs 7.1).
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. No source was fetched this round and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at 16 passages with 9 sources: 1.1 with rydh2015, deligne-mumford1969 and
  kresch1999b; 1.2, 1.3, 3.1, 3.2, 4.2, 5.2 with vistoli1989; 3.3 with stacks-chow-spaces; 5.3 with
  edidin-graham1998; 7.1, 8.2, 9.2 with behrend-fantechi1997; 8.4 with li-tian1998; 9.4 with behrend1997.
  The longest shared runs are 6 words, in statements that can be written one way ("finite, finitely
  presented and surjective morphism", rydh2015 line 84; "the extensions form a torsor under",
  behrend-fantechi1997 line 1077). Arrangement: vistoli1989's sections are 1 (stacks), 2 (moduli spaces),
  3 (intersection theory), 4 (the basic lemma), 5 (bivariant theory), 6 (moduli spaces of smooth stacks);
  its section 3 is split over Layers 2, 3 and 4 by integrality, its section 2 feeds Layer 5 after its
  sections 3 and 5, and its section 4 is no layer. No table, figure, list of examples or numerical data
  is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction; normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory and Hom schemes: SchemeAndStackFoundations; nothing else shared.

Source independence: 16 passages compared with 9 sources, none shared beyond parts of statements of at most 6 words; largest share vistoli1989, 74 of 166 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each is
  cited in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; the displays of (1.15) (line 370), (2.1) (line 543) and of the
  covering formula (lines 1607–1609) are garbled and were matched by content.
- kresch1999b Theorem 3.1: its statement (lines 334–336) and the end of its proof (lines 400–404) were
  read; the README's reading of which bundle acts was not rechecked against the whole proof this round.
- The global gluing in 8.1–8.3 was checked on charts and on the instances of the table, not as a proof.
- Locators of the 18 sections outside the sample were not reread this round, except those at the lines
  listed above.
- Ownership search: the regular-expression form of the search tool did not finish within its time
  limit, and the fixed-string search for "local immersion" stopped on an unresolved open head; the other
  fixed-string searches listed above completed.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5 (lines 890–891), as used in the proof of Lemma 5.9, lines 1416–1417: the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since an isomorphism in the derived category need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in vistoli1989 at the paragraph before Lemma 5.3, line 1613: the source says multiplicativity of the degree is Lemma 1.15; it should be Lemma 1.16 (line 379), unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at the proof of Proposition 6.1, line 1768: the source says integrality of the reduced fibre product follows from Lemma 2.5; it should be Lemma 2.3 (2.5 is a corollary on degrees), unless the slip is the scan's; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "96954fdc5c1e47ce6b3d6a286807754f79bafde3", "job": "REV-DESIGN-VirtualFundamentalClassPartII~15", "model": "fable", "worker": "chris-x55"} -->
