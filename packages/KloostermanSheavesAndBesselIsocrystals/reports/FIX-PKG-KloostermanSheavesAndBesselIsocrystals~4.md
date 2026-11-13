# Repair of KloostermanSheavesAndBesselIsocrystals

The findings below are those of `REV-PKG-KloostermanSheavesAndBesselIsocrystals~3`, a single review, so its ids are used unqualified. Each was checked against the sources and by calculation before it was applied. These are repairs, not an acceptance verdict. No commit was made.

## F01 (P1) — applied

§6.5: the unqualified `D₂ = 1` → Gross–Reeder Proposition 5.6 stated for `ϕ_ad`. For `ϕ` itself: `p ∤ c = |ϕ(I) ∩ Z(H)|`, `D₁ ≅ D^ad_1`, upper breaks `0, 1/h`, and `D₁ = D_c`, `D_{c+1} = 1` (Herbrand, pinned Tau Ceti). Added the `SL₂/𝔽₅((t))` negative control and the `SL₂`, `c = 2` Check. The Swan bound `b ≥ ℓ` now carries `p ∤ |W_H|`.

Evidence: GR line 1173 (the dual group is adjoint in §5.3); GR lines 1323–1324 (`D₂ ⊂ Ť[2]` comes from Lemma 5.5, valid for the adjoint torus only); GR lines 1147 and 1187 (`b ≥ ℓ` is proved only for `p ∤ |W|`). §§6.6 and 11.5 use only adjoint upper breaks and are unchanged.

## F02 (P1) — applied

§9.4: `(Be†_{SO₃} ⋆ Be†_{2n−2})(1/2)` → `…[1](1/2)`, with `⋆ = Rμ_!` unshifted and the isocrystals in the constructible heart. Added the degree-1 concentration (vanishing `H⁰_c` and `H²_c`; GOS rank `2n + 1`) and the `𝔽₃` object-versus-trace Check (`−4/9` against `4/9`). §11.5 now has the same shift, plus a `p = 2` Check (`1/4` against `−1/4`).

Evidence: Miy lines 549–560 and 580–598; XZ lines 701–717, 2605–2607 and 2893–2894. Raw sums and the Lean identity are unchanged.

## F03 (P1) — applied

The Adolphson–Sperber and Wan inputs of §11.2 had no owner → two supplier gaps on PadicDifferentialEquationsAndRigidCohomology Layer RD.6: `gap:toric-exponential-sum-hodge-bound` (degree `N!·Vol`, Newton above Hodge, the Hodge polygon defined) and `gap:toric-exponential-sum-ordinarity` (facial decomposition over codimension-one faces; diagonal criterion). They are recorded in the `plan.json` `gaps` list, the supplier contracts, the §11.2 *Needs*, the Layer 11 dependencies and the scope paragraph. Specialization Checks added.

## F04 (P2) — applied

§11.2: "every face not containing the origin … index `d`" → the `2n + 1` codimension-one faces, listed explicitly with vertex determinant `±d`; nondegeneracy is still required on every face. Added the negative control: the primitive vertex `(1,0,0)` has index `1`, while the facet `(1,0,0),(0,1,0),(0,0,2)` has determinant `2`.

## Gate failures

None were listed for this round.

## Required checks and exact outcomes

- `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`, run from the content checkout: exit 0. Five warnings `declaration uses 'sorry'`, at lines 66, 133, 145, 156 and 169; nothing else. The only import is `import Mathlib`, so no Tau Ceti module had to be built.
- Signatures: a scratch copy with `#check @name` for all 11 declarations (6 `def`s, 5 theorems) elaborated. Each type was compared with its README statement and every binder is present: the DVR, adic-completeness, fraction-field, `CharZero` and `¬IsUnit 2` hypotheses of `signed_dwork_congruence`; `ψ₀ ≠ 1`, `1 ≤ n` and `ringChar F ≠ 2`; `2 ≤ N` and `DecidableEq F`; `ψ₀ : AddChar (ZMod p) ℂ_[p]` and `L : Type` in `orthogonalSum_ordinary`. `Suggested.lean` is unchanged this round, so nothing in it changed.
- Dependency gate, verbatim:

```
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

  It printed no UPWARD, CYCLE or moved line.
- `roadmaps resolve` reports one lead, "KloostermanMomentsAndPotentialAutomorphy §2.6". This is a false positive: §2.6 is at line 747 of the board package `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`. No Lean name was reported unresolved. The two new Tau Ceti names were checked at the pinned Tau Ceti `2fd255d`: `TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean` line 176 and `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean` line 98, both in namespace `TauCeti.LocalFieldsRamification`.
- `sources.toml` still parses (24 entries). Locators were added for GR (Conjecture 5.2 p. 30, §5.3 p. 31, Proposition 5.4 pp. 31–33), Miy (Definition 2.1.1 p. 14, Proposition 2.1.3 p. 15) and XZ (§5.2.1, (5.2.1.2), p. 56). AS89, Wan93 and Wan04 are now also cited for "Exact supplier contracts". No new source and no missing-reference request: those three stay settled uncertified and are cited by locator.
- `design/plan.json`: only the `gaps` list changed (two entries appended); the rest of the JSON was compared and is identical.

## Ownership

- Adolphson–Sperber / Wan. I searched by object ("Adolphson", "Hodge polygon", "Newton polytope/polyhedr", "nondegenerate Laurent", "facial/boundary decomposition", "toric exponential") across main, the open roadmap heads and the board packages. No owner exists. The p-adic roadmap mentions Adolphson–Sperber only for Kloosterman deformation (RD.6.94, RD.6.97). The board package MixedHodgeModulesAndIrregularHodgeTheory has complex twisted de Rham concentration with no Frobenius or Newton conclusion. PadicDifferentialEquationsAndRigidCohomology is earlier in the merge order (line 121 against 366) and owns the Dwork-operator machinery, so it is the supplier.
- Herbrand quotient theorems: pinned Tau Ceti, cited by name. This roadmap states nothing new about them.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §6.5 adjoint GR conclusion | `PGL₂`, adjoint image of the `𝔽₅((t))` example | `|D^ad| = 10`, lower break 1, `D^ad_2 = 1`, upper break `1·5/10 = 1/2` | Holds; stated for `ϕ_ad` |
| §6.5 central lift, lower filtration | `SL₂/𝔽₅((t))`: `u⁴ = t`, `z⁵ − z = u^{−2}` | `(2u)^{−2} = 4u^{−2} = −u^{−2}`; `v(uz²) = 5 − 4 = 1`; `v(σ(uz²) − uz²) = 5 − 2 = 3` ⇒ `D₁ = D₂ = C₅`, `D₃ = 1`; `ϕ(τ²) = −I`, `c = 2`; Herbrand `2/c = 1` | Old claim `D₂ = 1` is false; new `D_c = D₁`, `D_{c+1} = 1` holds |
| §6.5 upper breaks for a central lift | Same example | `φ_D(2) = 2·5/20 = 1/2`; `φ_{D^ad}(1) = 1·5/10 = 1/2` | Equal, as claimed |
| §6.5 Swan of `Ad` | Same example | `b = (5/20)·2 + (5/20)·2 = 1 = ℓ`; invariants: Cartan negated by `τ` ⇒ 0 | Hypotheses hold |
| §6.5 `p ∤ c` from `p ∤ |W_H|` | `A_ℓ`: `ℓ+1 | (ℓ+1)!`; `B,C`: `2`; `D_ℓ`: `4 | 2^{ℓ−1}ℓ!`; `E₆`: `3 | 51840`; `E₇`: `2`; `SL₃, p = 5`: `5 ∤ 3` | All divide | Holds |
| §6.5 `SL₂` every parameter | `n = [[0,b],[−b^{−1},0]]` | `n² = −I` ⇒ `c = 2` always; `PGL₂`: `c = 1` | New Check |
| §6.5 Swan inequality bullet | GR lines 1142, 1147, 1187 | Proved only when `p ∤ |W|` | Hypothesis added |
| §9.4 shift, `𝔽₃`, `n = 2`, `a = 1` | Direct sums | `R₂(1) = −1`, `R₂(2) = 2`, `U₂(1) = 7`; `Σ = −4/(3√3)`; unshifted `−4/9`, `T_{SO₅} = 4/9`, shifted `4/9` | `[1]` added |
| §9.4 further instances | `𝔽₃` `a=2`; `𝔽₅` `a=1,3`; `𝔽₃` `n=3`; `𝔽₇` `a=1` | unshifted / `T_SO`: `0.5556/−0.5556`; `−0.84/0.84`, `−0.04/0.04`; `0.5185/−0.5185`; `1.0183/−1.0183` | Shifted value equals `T_SO` each time |
| §11.5 shift at `p = 2` | `𝔽₂`, `n = 2`, `a = 1` | `T_{SO₃} = −1/2`, `K₂ = −1/√2`; unshifted `1/4`, `T_{SO₅} = (1−2)/4 = −1/4` | Shift transported |
| §9.4 rank of `R¹` | `n = 2, 3` | `Sw_∞ = 2n−2`, `Sw_0 = 3`: rank `5`, `7` | Equals `2n+1` |
| §11.2 Hodge numbers (lattice count) | `n = 1, 2`, `d = 1, 2, 3` | `H(k) = 1` for `0 ≤ k < d(2n+1)`, else 0; totals `3, 6, 9, 5, 10, 15 = N!·d/(2n)!` | Slopes `j/d` confirmed |
| §11.2 facets | general `n` | `L₀ = Σx + z/d`, `L_j = Σ_{i≠j}x_i − (2n−1)x_j + z/d`; dets `d`, `±d`; volume `(2n+1)·d/(2n+1)! = d/(2n)!` | Exactly `2n+1` facets |
| gap hodge-bound | `f = x^d`, `N = 1`, `p ≡ 1 (d)` | `L* = (1−T)∏_{χ≠1}(1 + g(χ)T)`, degree `d`; Stickelberger slopes `0, 1/d, …` = HP | Consistent |
| gap diagonal criterion | diagonal `V`, `p | det` | kernel `y` of `V mod p` gives `a_j x^{V_j} = y_j` on the face `supp y`, so degenerate; `p ∤ det` gives independence mod `p` | Iff confirmed |
| §11.2 `p = 2`, `d = 2` | vertex `(0,…,0,2)` | `z∂_z(−z²) = −2z² = 0`; `2 ∤ 1` | New negative Check |
| §11.2 face index (F04) | `n = 1`, `d = 2` | facet det `2`; vertex `(1,0,0)` group `{0}` | New negative Check |

## For the maintainer

- New supplier requests to PadicDifferentialEquationsAndRigidCohomology: `gap:toric-exponential-sum-hodge-bound` and `gap:toric-exponential-sum-ordinarity`. KloostermanMomentsAndPotentialAutomorphy (merge order line 310, after that supplier) relies on Wan's boundary decomposition for `gap:scalar-kloosterman-ordinarity`, which it owes this roadmap. It can consume the same contracts; that is its own decision.
- No section, target or Lean name of this roadmap was renamed, and the former-numbering table is unchanged. §6.5 still defines simple wild parameters, and its conclusions for non-adjoint `H` are now weaker than before (no `D₂ = 1`). No downstream citation of §6.5 relies on `D₂ = 1`.
- Ownership against open pull requests was checked through `roadmaps grep` over main and the 439 indexed open heads.
- Source issue: GR Proposition 5.6(3), read outside its §5.3 adjoint convention, is false for central lifts. This is a scope point, not an erratum in GR. XZ (5.3.9.1) omits the shift `[1]`; the review already recorded this.
- No suspicious instructions were found in the review text.
