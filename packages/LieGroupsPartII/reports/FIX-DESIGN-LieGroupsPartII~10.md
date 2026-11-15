# FIX-DESIGN-LieGroupsPartII~10

This round repairs the round-10 design review (`REV-DESIGN-LieGroupsPartII~9`, two P3 findings). Files edited: `packages/LieGroupsPartII/design/README.md` and `packages/LieGroupsPartII/design/plan.json`. `packages/LieGroupsPartII/sources.toml` is unchanged. No source was added and no `needs-references.toml` was written.

## F01 (P3) — applied

§§3.1, 3.3 and 4.1 *Needs:* now name LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, `g·lieExp X·g⁻¹ = lieExp(Ad g X)`; §4.1 adds Layer 2 for `lieExp(tY) ∈ P ∀t ⇔ Y ∈ Lie(P)`). Layer 3 Dependencies: "LieGroups Layers 0, 2, 9" → "Layers 0, 1, 2, 3, 9; Tau Ceti `map_lieExp`". Plan targets 3.1, 3.3 and 4.1 gain `roadmap:LieGroups Layer 1`.

Verified against LieGroups (main), Layer 1, "Conjugation and the exponential": the conjugation law is native as `TauCeti.Lie.conj_lieExp` (`TauCeti/Geometry/Lie/Adjoint/Exponential/Basic.lean:110`), and `Ad(lieExp X) = exp(ad X)` is native on the tangent carrier as `TauCeti.Lie.tangentAd_mulInvariantExp_apply` (`…/Exponential/Formula.lean:164`). Both are at the Tau Ceti pin `2fd255d9`, in namespace `TauCeti.Lie`.

**Pattern.** I checked every section's route for these two identities, and for the step `θ(k·lieExp X) = k·lieExp(−X)` that goes with them. Other sites repaired:

- **Supplier contract, LieGroups bullet.** It credited `conj_lieExp` with `Ad(lieExp X) = exp(ad X)`. It now names each identity with its own native declaration and adds the matrix shadows (`lieExp` is the matrix exponential and `Ad` is conjugation on `GL (Fin n) ℝ`).
- **§1.1.** Adds Layer 1: the derivative of `Ad(lieExp tX)` gives the `B_θ`-symmetry and skewness of `ad X`, and the conjugation law gives the polar map of a transported datum.
- **§1.2.** Adds the conjugation law, used by the cocycle of steps 2–3.
- **§2.4.** Adds Tau Ceti `map_lieExp`, so that `lieExp 𝔨 ⊆ K` and `g⁻¹θ(g) = lieExp(−2X)`.
- **§2.5.** Adds the conjugation law. Step 3 uses it: conjugate tori of `M⁰` have `Ad`-conjugate Lie algebras.
- **§3.1, beyond the finding.** Also adds Layer 2 `lieSubalgebraOfSubgroup` (for `Lie(L)`), Layer 3 `lieMap` (for `dπ`) and Tau Ceti `map_lieExp` (for `θ(l)⁻¹l = lieExp(2X)` and `dπ ∘ Ad(g) = Ad(π(g)) ∘ dπ`).
- **§3.2.** Adds Layer 1: `M = Z_K(A)`, and `M` and `A` commute and normalize `N`.
- **§3.4.** Adds Layer 1: `gPg⁻¹` is the minimal parabolic of the transported triple, and `Ad(G⁰)` fixes `𝔷`.
- **§4.2.** Adds the conjugation law for `a_t u a_{−t} → 1`.
- **§6.3.** Adds Layer 1: `Ad(G⁰)` is trivial on `𝔷` and acts on `[𝔤, 𝔤]` through `Int([𝔤, 𝔤])`.
- **§7.1.** Adds LieGroups Layers 0–1 (the matrix shadows) and Tau Ceti `map_lieExp` for the inclusion into `GL (Fin n) ℝ`.

**Dependencies lines.** Each Dependencies line now covers its sections' *Needs:* lines:

- Layer 1 adds the two identities and Tau Ceti `map_lieExp`, `lieMap_injective`.
- Layer 4 adds LieGroups Layer 2.
- Layer 7 adds LieGroups Layers 0–1, Tau Ceti `map_lieExp`, `TauCeti.TitsSystem` and Mathlib `Module.End.eigenspace`. The last two were already on §7.3's *Needs:* line.

**Plan.** New prerequisites:

- 1.1, 2.5, 3.2, 3.4 and 6.3: `roadmap:LieGroups Layer 1`.
- 2.4: `tauceti:map_lieExp`.
- 3.1: also `roadmap:LieGroups Layer 3` and `tauceti:map_lieExp`.
- 4.1: also `roadmap:LieGroups Layer 2`.
- 7.1c: `roadmap:LieGroups Layer 0`, `roadmap:LieGroups Layer 1` and `tauceti:map_lieExp`.

The LieGroups `suppliers` entry names the two identities and the matrix shadows. No `target:` edge was added, so the plan graph is unchanged, and LieGroups is on main, so no edge points upward.

Already complete and left as they were: §2.2 (names Layer 1 and `map_lieExp`), §5.1 (names both identities) and §6.2 (names Layer 1). Sections that use neither identity: §§2.1, 2.3, 2.6, 3.5, 6.1, 7.2, 7.3 and 8.1. Their routes go through cited sections, Mathlib's `Matrix.exp_conj`, or abstract Tits systems.

## F02 (P3) — applied

Plan 7.3g `statement`: "𝔞, H₀, M, N, P as in 6.2b" → "… as in 7.3b". In 7.3d and 7.3g `hypotheses`, the entry "𝔞, H₀, LinearComponentCondition as in 6.2b" → three entries: "𝔞 maximal abelian in the symmetric part of linearLieAlgebra G (as in 7.3b)", "H₀ ∈ 𝔞 regular (as in 7.3b)", "LinearComponentCondition G 𝔞". These are 7.3b's own hypotheses.

Verified: the 33 target ids contain no "6.2b". Target 7.3b is the one that fixes `𝔞`, regular `H₀`, `M`, `N = dynamicUnipotent G H₀`, `P = M·exp(𝔞)·N` and `LinearComponentCondition G 𝔞`, and it is already a `target:` prerequisite of both 7.3d and 7.3g.

**Pattern.** I scanned the plan for every `d.d` or `d.dx` token and found no other dangling target id. The others are RealSemisimpleLieGroups sections, AutomorphicFormsOnReductiveGroups §2.3a, AutomorphicSpectralTheoryPartII §1.5 and source locators (Théorème 4.15, Corollaire 5.18, Proposition 7.76, Lemma 7.73). Every `target:` prerequisite names an existing id. Every bare `§d.d` in the README names one of its 23 `###` sections; the rest belong to RealSemisimpleLieGroups.

## Adversarial pass on the changed text

The table uses `θ(g) = (gᵀ)⁻¹`, `J = ((0, −1), (1, 0))`, `H₀ = diag(1, −1)` in `SL_2(ℝ)`, and `E_ij` for the matrix units.

| Statement (new or changed) | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conjugation law `g·lieExp X·g⁻¹ = lieExp(Ad g X)` (contract, §§1.1–4.2) | `GL_2(ℝ)`, `g = diag(2, 1)`, `X = E₁₂` | `g(I + E₁₂)g⁻¹ = I + 2E₁₂ = exp(2E₁₂)`, and `Ad g X = gXg⁻¹ = 2E₁₂` | Holds | Named correctly in the contract |
| `Ad(lieExp X) = exp(ad X)` | `GL_2`, `X = diag(1, 0)`, `Y = E₁₂` | `diag(e, 1)E₁₂diag(e⁻¹, 1) = eE₁₂`; `ad X·E₁₂ = E₁₂`, so `exp(ad X)E₁₂ = eE₁₂` | Holds | — |
| §1.1: `ad`-invariance gives `B_θ`-symmetry of `ad X`, `X ∈ 𝔭` | `GL_2`, `B = tr(XY)`, `X = diag(1, −1)`, `Y = Z = E₁₂`, `dθY = −Yᵀ` | `B_θ(⁅X,Y⁆, Z) = −tr(2E₁₂·(−E₂₁)) = 2`; `B_θ(Y, ⁅X,Z⁆) = −tr(E₁₂·(−2E₂₁)) = 2` | Symmetric | Needs completed |
| §1.1: transported polar map | general `g` | `(gkg⁻¹, Ad(g)X) ↦ gkg⁻¹·lieExp(Ad g X) = g·(k·lieExp X)·g⁻¹`, so the transported polar map is `c_g` composed with the original one | Holds | Needs completed |
| §1.2: cocycle uses the conjugation law | `ℝ ⋊ ℤ/2`, `θ₀ → θ_a` | `(0,1)·(Y,0) = (−Y, 1) = (a/2, 1)` gives `Y = −a/2`; `Y(k) = Ad(k⁻¹)Z − Z = −2Z` gives `Z = a/4`, as in the §1.2 Check | Holds | Needs completed |
| §2.4: `g⁻¹θ(g) = lieExp(−2X)` for `g = k·lieExp X` | `GL_2`, `g = J·diag(e, e⁻¹)` | `θ(g) = J·diag(e⁻¹, e)`, so `g⁻¹θ(g) = diag(e⁻¹, e)J⁻¹J·diag(e⁻¹, e) = diag(e⁻², e²) = exp(−2X)` | Holds | `map_lieExp` added |
| §2.5: conjugate tori have conjugate Lie algebras | compact `O(3)`, `𝔞 = 0`, `M⁰ = SO(3)`, `𝔱 = ℝL_z`, `n` = the permutation swapping `e₁` and `e₃` (determinant `−1`) | `Ad(n)L_z = ±L_x`; `n·exp(ℝL_z)·n⁻¹` is the group of rotations about `e₁`, with Lie algebra `ℝL_x`; a rotation `m ∈ SO(3)` taking `e₁` to `e₃` gives `Ad(mn)𝔱 = 𝔱` | Holds | Needs completed |
| §3.1 step 1: `θ(l)⁻¹l = lieExp(2X)` | `l = diag(e, e⁻¹)` | `θ(l)⁻¹ = diag(e, e⁻¹)`, so `θ(l)⁻¹l = diag(e², e⁻²) = exp(2·diag(1, −1))` | Holds | `map_lieExp` added |
| §3.1: `dπ ∘ Ad(g) = Ad(π(g)) ∘ dπ` | `π = Ad : SL_2(ℝ) → SO₀(2,1)`, `dπ = ad` | `ad(gXg⁻¹)Y = g⁅X, g⁻¹Yg⁆g⁻¹ = (Ad g ∘ ad X ∘ Ad g⁻¹)Y`, which is conjugation of `dπ X` by `π(g)` | Holds | Layer 3, `map_lieExp` added |
| §3.1: `Lie(Z_G(𝔰)) = Z_𝔤(𝔰)` | `GL_3`, `𝔰 = ℝ·diag(1, 1, −2)` | `⁅X, diag(1,1,−2)⁆` scales `X_{i3}` and `X_{3i}` (`i ≤ 2`) by `±3`; the kernel is `𝔤𝔩_2 ⊕ 𝔤𝔩_1`, of dimension 5 `= dim(GL_2 × GL_1)` | Holds | Layer 2 named |
| §3.2: `A` normalizes `N`, `M` commutes with `A` | `GL_2`, `a = exp(diag(h₁, h₂))`, `m = diag(1, −1)` | `a(I + tE₁₂)a⁻¹ = I + te^{h₁−h₂}E₁₂ = lieExp(e^{ad H}·tE₁₂)`; `m` and `a` are diagonal, so they commute | Holds | Needs completed |
| §3.3(c): conjugates of `N̄` are unbounded, those of `P` bounded | `SL_2`, `n̄ = I + E₂₁`, `p = ((a, b), (0, a⁻¹))` | `exp(−tH₀)·n̄·exp(tH₀) = I + e^{2t}E₂₁`, unbounded as `t → +∞`; `p ↦ ((a, e^{−2t}b), (0, a⁻¹))`, bounded. This agrees with the Conventions formula `e^{−tβ(H₀)}`, `β = e₂ − e₁`, `β(H₀) = −2` | Holds, so `P ∩ N̄ = 1` | Needs completed |
| §3.4: `gPg⁻¹` is the minimal parabolic of the transported triple; `G⁰` keeps the split centre | `SL_2`, `g = J`; `GL_2`, `g ∈ GL_2⁺` | `Ad(J)diag(1, −1) = diag(−1, 1)`, so `Ad(J)𝔞 = 𝔞`, `Ad(J)Σ⁺ = {−α}`, `N'` is lower unitriangular, and `JPJ⁻¹` is lower triangular `= P'`. `Ad(g)·1 = 1`, so `𝔷 ∩ Ad(g)𝔭 = Ad(g)(𝔷 ∩ 𝔭) = ℝ·1` | Holds | Needs completed |
| §4.1: `lieExp(tH₀)` fixes `gP` iff `lieExp(t·Ad(g⁻¹)H₀) ∈ P` iff `Ad(g⁻¹)H₀ ∈ Lie(P)` | `SL_2`; `g = J`; `g = R_{π/4}` | `J⁻¹diag(e^t, e^{−t})J = diag(e^{−t}, e^t) ∈ P`, so `JP` is fixed (`n_sP`). `Ad(R_{π/4}⁻¹)H₀ = S` with `S = ((0, 1), (1, 0))` up to sign: `exp(tS) = cosh t·I + sinh t·S` has lower-left entry `sinh t ≠ 0`, so `S ∉ Lie(P)` and the point is not fixed | Holds; two fixed points, matching the §4.1 Check | Layers 1, 2 added |
| §4.2: `a_t u a_{−t} → 1` as `t → −∞` | `SL_2`, `a_t = diag(e^t, e^{−t})`, `u = I + E₁₂` | `a_t u a_{−t} = I + e^{2t}E₁₂ → I` | Holds | Needs completed |
| §6.3: `Ad(G⁰)` is trivial on `𝔷` and lies in `Int([𝔤,𝔤])` on `[𝔤,𝔤]` | `GL_2`; `g = diag(2, 1) ∈ G⁰`; `d = diag(−1, 1) ∉ G⁰` | `Ad(g)·1 = 1`; on `𝔰𝔩_2`, `Ad(diag(2, 1)) = Ad(diag(√2, 1/√2)) ∈ Ad(SL_2(ℝ)) = Int(𝔰𝔩_2(ℝ))`. `Ad(d)` would equal `Ad(h)` for some `h ∈ SL_2(ℝ)` only if `h = ±d/√(−1)`, which is not real: so `Ad(d) ∈ Aut ∖ Int` | Holds on `G⁰` and fails off it, so the restriction to `G⁰` is needed | Needs completed |
| §7.1: matrix shadows of `lieExp` and `Ad` | `GL_2` (rows 1–2) | `lieExp = NormedSpace.exp` and `Ad g = g(·)g⁻¹`, computed above | Holds | Layers 0–1, `map_lieExp` added |
| F02: hypotheses of 7.3d and 7.3g | O(1,1) (negative control of 7.3b, 7.3d, 7.3g); `GL_n(ℝ)` | The three entries are 7.3b's. Without `LinearComponentCondition`, O(1,1) has `P` normal of index 2 and `dynamicParabolic G 0 = G ≠ P`, as the tests of 7.3d (`O11`) require. `GL_n` satisfies the condition, with `M` the sign matrices | Consistent | Reference repaired |

## Checks

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve packages/LieGroupsPartII/design/README.md` (main 1a19c9f, 477 open heads, index of 2026-11-15T17:30:40Z): no cross-roadmap citation and no Lean name found nowhere. The tool did not check names outside TauCetiRoadmap on this host, so I opened the two Tau Ceti names newly backticked in the contract at the pin: `TauCeti.Lie.conj_lieExp` (`Geometry/Lie/Adjoint/Exponential/Basic.lean:110`) and `TauCeti.Lie.tangentAd_mulInvariantExp_apply` (`…/Formula.lean:164`). The worker's two earlier leads, `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`, are ArithmeticLocallySymmetricSpaces API names at its open head, cited as that roadmap's. They are unchanged.

Lean: the design stage has no `Suggested.lean`, so nothing was elaborated and no `#check` comparison was run. No backticked name of this roadmap's own was added, renamed or removed.

`plan.json` was rewritten by parsing and re-serializing it, in the file's own format (one-space indent, final newline). `6.2b` no longer occurs in it. No `target:` edge changed, so the graph is still acyclic, with no forward or missing target edges.

Ownership: no new construction or target was added, only *Needs:*, Dependencies and contract text naming existing suppliers (LieGroups on main, Tau Ceti at the pin). No ownership question arises.

## For the maintainer

- No section, target id or declaration name changed, and no id that other roadmaps cite was dropped.
- The LieGroups contract bullet now credits `TauCeti.Lie.conj_lieExp` with the conjugation law and `TauCeti.Lie.tangentAd_mulInvariantExp_apply` with `Ad(lieExp X) = exp(ad X)` (tangent carrier, transported in LieGroups Layer 1). The earlier text credited `conj_lieExp` with the second identity.
- Neither finding asked for a scope, merge-order or licence decision.
