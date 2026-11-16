# FIX-RT-VirtualFundamentalClassPartII~2

Repair of red-team round 2 (passes a and b) on `packages/VirtualFundamentalClassPartII`. Seven
findings, no overlaps between the two passes; all seven verified and repaired. Files changed:
`README.md`, `Suggested.lean` (module docstring only), `sources.toml` (the `kresch1999b` entry).
`design/plan.json` and `metadata.toml` unchanged: no new supplier gap.

## RT-VirtualFundamentalClassPartII~2a/F01 (P2) — applied differently

New 8.1 paragraph *Intersection with a `P`-divisor*, placed before `β`. It defines *PDivisor*,
*pDivisorIntersection* and `ω(D, E)` and proves kresch1999b Proposition 1.8, Corollary 1.10 and
Proposition 2.1, then extends them to stacks. It adds three Checks; `β` now cites `ω(D, E)`, and the
Needs, Dependencies, Scope and supplier lines are updated. No owner exists elsewhere (see Ownership
below).

Why differently: the suggested support, "the image of the divisor of `x`", is too large. For
`x = a/b` on `𝔸²` with `U′ = {a ≠ 0}`, it adds `{b = 0}`. The text uses `π^*D` (kresch1999b
Definition 1.1). The normalisation is Mathlib's, not Tau Ceti's.

## RT-VirtualFundamentalClassPartII~2a/F02 (P3) — applied

Summary: "of finite type over an arbitrary field with no separatedness assumed" → "… whose diagonal
is quasi-compact and separated (Convention 1), with no separatedness of the stack assumed".
Pattern: the Scope bullet "proper covers of Deligne–Mumford stacks" → "… of the Deligne–Mumford stacks
of Convention 1, whose diagonal is quasi-compact and separated". `Suggested.lean` headline 1 adds
"with quasi-compact separated diagonal"; headline 2 now reads "every such stack".

## RT-VirtualFundamentalClassPartII~2a/F03 (P3) — applied

8.1: `Z_*(𝔛)`, `W_*(𝔛)` are now the compatible families with `z_U ∈ ⊕_j Z_j(U)` (respectively
`⊕_j W_j(U)`). `Z_i`, `W_i` are their degree-`i` subgroups. They equal `⊕_i` for quasi-compact `𝔛` and
are larger when the dimensions of the components are unbounded. Check added: for `⊔_{n≥1} 𝔸ⁿ`, the
`n`-th component of `β` is `ν/ξ_1 ∈ W_n(𝔸^{n+1})`. A wording fix in the same Check: the `⊔_ℕ 𝔸²` element
is in `W_2`.

## RT-VirtualFundamentalClassPartII~2a/F04 (P3) — applied

2.1, fourth Check: "not a stack of Convention 1 and `Z_0(U)` is not defined" → "… and this section
defines no `Z_0(U)`. The group of compatible families of 8.1 on `U` is `Z_0(U) = ℤ^ℕ`, the product
over the points, not free on them. It contains this pullback as the family with every coefficient
`1`, whose restriction to `⊔_{n ≤ m} Spec k` is the sum of its `m + 1` points."

## RT-VirtualFundamentalClassPartII~2b/F01 (P3) — applied

Convention 2: "étale locally on source and target, a regular closed immersion" → existence of
schemes `U`, `V` with smooth surjections `V → 𝒢`, `U → ℱ`, `U → ℱ ×_𝒢 V` étale and `U → V` regular of
codimension `d` (kresch1999b Lemma 2.2 and lines 232–234; vistoli1989 (1.20)). The étale form is
kept as the Deligne–Mumford case. The two witnesses are `η_b` of 8.4 for `𝔐 = B𝔾_m` and `Spec k → BG`.

## RT-VirtualFundamentalClassPartII~2b/F02 (P3) — applied

9.5, second Check: "`X` with `c_1(T_X) = 0` and of pure dimension `3`: the virtual dimension is `n`"
→ the Check now requires `X` proper, over a base of pure dimension `b = 3g − 3 + n`, giving
`3g − 3 + n + 3(1 − g) = n`. It adds the negative instance `𝔅 = Spec k`, `g = 0`, `X` an abelian
threefold: value `3`, which is `dim Hom(ℙ¹, X) = dim X`.

## RT-VirtualFundamentalClassPartII~2b/F03 (P3) — applied

8.1, route of the third statement: "pull `Y′` back to the same closed substack
`(Y ×_𝔅 Y) ×_𝔅 𝔅′`" → "pull `Y′ → Y` back to the same local immersion
`(Y ×_𝔅 Y) ×_𝔅 𝔅′ → Y ×_𝔅 Y`, the two pullbacks being identified by the 2-isomorphism
`p ∘ p_1 ≅ p ∘ p_2`". The witness `𝔸² → BG × 𝔸²` (finite étale of degree `|G|`) is added in
parentheses.

## Checks run

- Elaboration: `lake env lean packages/VirtualFundamentalClassPartII/Suggested.lean`, run from the
  content checkout: no output, exit 0. The file still has no declaration (module docstring and an
  empty namespace), and it imports only `Mathlib`.
- `#check @name`: there is no declaration of `Suggested.lean` to compare. I did elaborate one scratch
  file with `#check` on the five library names the repair cites:
  `AlgebraicGeometry.Scheme.Hom.normalization`, `…fromNormalization`, `…normalizationPullback`,
  `AlgebraicGeometry.Scheme.ord` and `TauCeti.AlgebraicGeometry.isFinite_fromNormalization_of_isJapanese`.
  All exist at the pins, with the hypotheses the README states: qcqs `f`, an iso along smooth `g`, an
  integral locally Noetherian scheme, and Japanese rings on affine opens with `L` finite over `k(Y)`.
- Dependency check:

      depcheck: 250 roadmaps, 2382 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The tool
  did not check names outside TauCetiRoadmap; the `#check` above covers the new ones.
- `sources.toml` parses: 14 sources. No new source; no `needs-references.toml`.

## Adversarial pass on every statement added or changed

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Summary / Scope: finite cover by a scheme for Convention 1 stacks | `Bℤ`; `B_{𝔸¹}G` | `Z → Bℤ` finite gives `P` finite over `k` with `P ×_Z P ≅ P × ℤ` immersed in finite `P ×_k P`, so `P = ∅`; `B_{𝔸¹}G` has quasi-compact separated diagonal and the degree-`2` cover by `L` | `Bℤ` excluded by the new wording, `B_{𝔸¹}G` kept | wording |
| Conv. 2 regular local immersion (smooth charts) | `η_b : B𝔾_m × {b} → B𝔾_m × B`; `Spec k → BG`; diagonal of smooth `ℳ` of dim `n` (5.1) | chart `V = B`, `U = {b}`: `U → ℱ ×_𝒢 V = {b}` iso, codim `1`; `U = V = Spec k`, `U → G` unit section (open and closed), codim `0`; Vistoli's étale atlases give codim `n` | holds | new definition |
| Conv. 2, wrong model: étale-local definition | `B𝔾_m × B` | an étale `V → B𝔾_m × B` from a scheme gives `P = T → B` (with `T` the `𝔾_m`-torsor on `V`) factoring through `V`, of dim `dim V + 1`, so never quasi-finite: no nonempty étale chart | the old definition selects nothing | excluded |
| 8.1 `Z_*`, `W_*` ungraded | `⊔_{n≥1} 𝔸ⁿ`, `X` origins, `Y′ = ⊔{x_1 = 0}`; `n = 1` | `β_n = ν/ξ_1 ∈ W_n(𝔸^{n+1})`; for `n = 1`: `∂β = [ν=0] − [ξ_1=0]`; `[Y]` has `[𝔸ⁿ]` in degree `n` | `β ∈ W_*`, `∉ ⊕_i W_i` | definition |
| 8.1 `Z_* = ⊕ Z_i` for quasi-compact | `B T_{𝔸¹}`; `⊔_ℕ 𝔸²` | one atlas `𝔸¹` of rel. dim `1`: `Z_i = Z_{i+1}(𝔸¹)`, degrees `−1, 0`; `⊔_ℕ 𝔸²` (not quasi-compact, bounded): `β` only in degree `2` | consistent with the statement, which claims equality only for quasi-compact `𝔛` | — |
| 2.1 Check vs 8.1 | `U = ⊔_ℕ Spec k` | `Z_0(U) = ℤ^ℕ`; pullback `(1, 1, …)`; restriction to `⊔_{n≤m}` has `m + 1` points; descent image = sequences with equal pullbacks to `⊔_{ℕ×ℕ} Spec k` = constants | agree | wording |
| PDivisor: fibre over `0` | plane double space, `s` | `|D| = {s = 0} = {s=t=0} ∪ {s=ν=0}`, `U, U′` the preimages of `ℙ¹∖∞`, `ℙ¹∖0`, `s` a unit on `s ≠ 0` | is one | new |
| PDivisor: support through `π^*D` | nodal cubic `v² = u²(u+1)`, `φ = (τ−1)/(τ+1)` | Weil divisor `1 − 1 = 0` at the node; `|D| = π({τ = ±1}) = {node}` | `(M, M∖node, φ)` is one; a support taken from the Weil divisor would be `∅` | Check 3 |
| PDivisor: support, suggested wording | `M` normal, `x` with a zero on `M ∖ U` (`U = M∖{b=0}`, `U′ = M∖{a=0}`, `x = a/b` on `𝔸²_{a,b}`, unit on `ab ≠ 0`) | `div(x) = [a=0] − [b=0]`, but `D` is `1` on `U′ ⊇ {b = 0}∖{a=0}`, so `|D| = {a = 0}` | divisor of `x` ≠ support of `D` | wording via `π^*D` |
| `D·` on `W_*` depends on `x` | `𝔸²_{a,b}`/ℚ, `x = a` vs `2a`, `α = (M, a)` | `({a=0}, a/a) = 0`; `({a=0}, 1/2) ≠ 0`; `∂α = [a=0] ⊆ |D|`, both sides of Prop. 1.8 `= 0` | agree with Remark 1.7 | Check 2 |
| `D·` on `W_*`, nodal | `α = (M, τ + 2)`, char `∉ {2,3}` | branch values `3^1 = 3`, `1^{−1} = 1`; `D·α = (node, 3)`; `∂ = 0 ∈ Z_{−1}`; `D·∂α = D·[τ = −2] = 0` | agree | Check 3 |
| Prop. 1.8 `∂(D·α) = D·(∂α)` | `𝔸²`, `x = a`, `α = (M, b)` | `D·α = ({a=0}, b)`, `∂ = [a=b=0]`; `∂α = [b=0]`, `D·[b=0] = div(a|_{b=0}) = [0]` | agree | — |
| Cor. 1.10 `D·[E] − E·[D] = ∂ω` | plane double space; `𝔸²` with `x = a`, `y = ab` | plane: `D·[E] = [s=t=η=0]`, `E·[D] = [s=t=ν=0]`, `ω = (W, t/s) = (W, η/ν)`, `∂ω = [η=0] − [ν=0]`; `𝔸²`: `D·[E] = [0]`, `E·[D] = 0`, `ω = ({a=0}, b)`, `∂ω = [0]` | agree | Check 1 |
| `ω(E, D) = −ω(D, E)` | plane | `(W, s/t) = (W, ν/η) = −(W, η/ν)` | agree | — |
| Prop. 2.1 smooth pullback | `f : 𝔸³ → 𝔸²` projection, `D = div(a)`, `α = (𝔸², b)` | `f^*(D·α) = ({a=0} × 𝔸¹, b) = (f^*D)·(𝔸³, b)` | agree | — |
| Plane double space normal and integral | `sη − tν` | irreducible; singular locus `s=t=η=ν=0`, dim `1` in dim `4`, codim `3`; hypersurface so S2 | normal | — |
| `β = −ω(D, E)`, D first projection | plane | `ν/η`, `∂β = [ν=0] − [η=0] = [C_{u^*C/C}] − [j^*N × C_{X′/Y′}]` | agrees with 8.1's first Check, `c = 1` | — |
| Stack extension of `D·` | `[𝔸¹/μ₂] → ℙ¹`, `y = x²` | chart `𝔸¹_x`: `f^*D = div(x²) = 2[0]`; on the stack `[D] = 2[Bμ₂]` | agrees with 2.1/2.2 Checks | — |
| 8.1 route, pullback of `Y′` | `𝔅 = BG`, `𝔅′ = Spec k`, `Y = BG × 𝔸¹` | `Y ×_𝔅 Y = BG × 𝔸²`; pullback `𝔸² → BG × 𝔸²`, finite étale of degree `|G| > 1`; `p_1^*Y′ = p_2^*Y′` via `p∘p_1 ≅ p∘p_2` | not a substack; same local immersion | wording |
| 9.5 Check, `c_1 = 0`, dim `3` | `g = 0, n = 3`; `g = 2, n = 0`; `b = 0, g = 0`, abelian threefold | `0 + 0 + 3 = 3`; `3 + 0 − 3 = 0`; `0 + 0 + 3 = 3 = dim X`, `H⁰(ℙ¹, O³) = k³`, `H¹ = 0` | `n` only for `b = 3g − 3 + n` | Check restated |

## Ownership, sources, supplier contracts

- Ownership of the `P`-divisor operations: `roadmaps grep` for `P.?-divisor`, `Corollary 1\.10` and
  `tame symbol` over main and the open heads finds no owner by object. K2SymbolsBrauer's tame symbols
  are symbols on `K₂` of fields, not rational equivalences on schemes. SchemeAndStackFoundations
  §§5.3, 5.5 stop at Chow classes. The only consumer is 8.1's `β`, so this roadmap owns them.
- New supplier-contract entries, all checked at the pins:
  - Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`, `…fromNormalization`,
    `…normalizationPullback` (`Mathlib/AlgebraicGeometry/Normalization.lean`).
  - Tau Ceti `TauCeti.AlgebraicGeometry.isFinite_fromNormalization_of_isJapanese`
    (`TauCeti/AlgebraicGeometry/Normalization/Finite.lean`).
- `kresch1999b` locators read in the cached text this round: lines 52–54 (varieties are integral
  schemes of finite type over a field), 65–72, 83–102, 109–141, 142–163, 182–190, 192–207, 218–237,
  259–304, 334–343, 390–405. The manifest entry's `locator` and `cited_for` now list Definitions 1.1
  and 1.4–1.6, Remarks 1.2 and 1.7, Propositions 1.8–1.9, and the smooth-chart definition of regular
  local immersions. vistoli1989 lines 485–535 were reread for Convention 2. No passage was copied.

## For the maintainer

- No name changed that other roadmaps cite. The new proposed names *PDivisor*,
  *pDivisorIntersection* and *pDivisorRatEquivalence* are in italics and declared nowhere.
- Convention 2's definition of a regular local immersion now uses smooth charts, which is what
  VirtualFundamentalClass §2.4 and gap:normal-cones-of-local-immersions already assume. On
  Deligne–Mumford targets it agrees with the étale form.
- No new supplier gap and no change to `design/plan.json`. Ownership against open pull requests was
  checked with `roadmaps grep` and `overlaps.md`: no shared roadmap and no dropped id.
- The questions the reviews leave to humans (OCR of vistoli1989; bases that need not be smooth or
  reduced in 8.1–8.3) were not acted on.
