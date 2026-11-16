# Review of VirtualFundamentalClassPartII (pull request #2446 at 1cb68bf)

**Verdict:** needs changes

## R01 (P3) — 9.3 API bullet reverses the direction of the map dual to `H⁰(φ)`

**Location:** `TauCetiRoadmap/VirtualFundamentalClassPartII/README.md:2368–2369`: "at a point `[F]` of `M`, `H⁰(φ)` is dual to the tangent map `H⁰(C, F^*T_X) → T_{[F]}M`."

**Claim:** At `[F]`, `H⁰(φ)` runs from `h⁰(E) ⊗ k = H⁰(C, F^*T_X)^∨` to `Ω_M ⊗ k = T_{[F]}M^∨`. It is therefore dual to a map `T_{[F]}M → H⁰(C, F^*T_X)`, not to a map in the opposite direction. A map `H⁰ → T` exists only when `(M, F)` is a relative space of maps, and the bullet does not assume that.

**Witness:** Take `M = Spec k` and `F = id_{ℙ¹}` (9.1's third Check). Then `H⁰(φ) : (k³)^∨ → 0`. Its dual is `0 → k³ = H⁰(ℙ¹, T_{ℙ¹})`. The dual of a map `k³ → 0` would be `0 → (k³)^∨`.

**Repair:** "For `𝔅 = Spec k` and a fixed curve `C` prestable over `k`, at a point `[F]` of `M`, `H⁰(φ)` is dual to the map `T_{[F]}M → H⁰(C, F^*T_X)` that sends a first-order deformation of `[F]` to the induced first-order deformation of `F`. This map is bijective when `(M, F)` is a relative space of maps." Tested on the witness: the map is `0 → k³`. Tested on `Mor_1(ℙ¹, ℙ^r)`: it is an isomorphism between spaces of dimension `2r+1`.

## R02 (P3) — Layer 9 example takes the whole morphism scheme, which is not of finite type

**Location:** `README.md:2468–2469`: "The space of morphisms from a fixed prestable curve to a smooth projective variety, with the obstruction theory of behrend-fantechi1997 Proposition 6.2."

**Claim:** In Layer 9, `M` must be a stack of Convention 1, which is of finite type (Convention 1, lines 151–152). The whole of `Mor(C, V)` is not of finite type. 9.1's first Check rules out `⊔_ℕ Spec k` for exactly this reason, and 9.1's API bullet says "open subscheme of finite type".

**Witness:** `Mor(ℙ¹, ℙ¹) = ⊔_{d≥0} Mor_d`, and each `Mor_d` is nonempty (`z ↦ z^d`). So the scheme has infinitely many components and is not quasi-compact.

**Repair:** "An open subscheme of finite type of the space of morphisms from a fixed prestable curve to a smooth projective variety `V` (for instance the maps `F` with `deg F^*L = d` for an ample `L` on `V`), with the obstruction theory of behrend-fantechi1997 Proposition 6.2." With `C = V = ℙ¹` this is the single scheme `Mor_d`, which is open in `ℙ^{2d+1}`.

## Previous findings

- R01 — repaired: "on a smooth ambient kresch1999b Theorem 3.1 is a statement about `β` … VirtualFundamentalClass §2.5's rational equivalence is Vistoli's … there it has the same boundary as `β`, and no statement here uses that the two agree in `W_*`". The *Needs:* line, Layer 8's Dependencies and the build-order paragraph no longer cite §2.5.
- R02 — repaired: "a fixed projective curve `C` with `C → Spec k` a prestable family (9.1's setting: geometrically connected and at worst nodal)" at line 2263, and "a fixed curve `C` prestable over `k`" at line 2368.
- R03 — repaired: the description now reads "`Suggested.lean` states no declaration: no headline theorem is statable at the pins …" and "the targeted Lake build succeeds with no warnings".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.1 `β` against Vistoli's (changed first bullet) | plane `Y = 𝔸²`, `X = 0`, `Y′ = {y=0}`; `Y = 𝔸¹ × Spec k[ε]/(ε²)` | `sη = tν`, `W = {s=t=0}`, `ord_W s = ord_W t = 1`, `ω = (W, η/ν)`, `β = ν/η`; `∂β = [ν=0]−[η=0]` = Vistoli's boundary; non-reduced `Y`: vistoli1989 Lemma 4.6 inapplicable, `[C] = 2[T-line]` | holds; agreement unused | none |
| 8.1 fourth statement, `𝔐 = Spec k` (changed route) | plane example; `T_Y` in place of `T_{Y′}` | `ξ ↦ ξ+a` fixes `ν/η`; `η ↦ η+b` gives `ν/(η+b) ≠ ν/η` | holds; restriction to `T_{Y′}` needed | none |
| VirtualFundamentalClass §2.5 as described in 8.1 | head of #1996, README lines 497–500 | it builds Vistoli's equivalence (BF 3.3–3.4) and states Kresch's Theorem 3.1 invariance for it | matches the text | none |
| Layer 8 Dependencies and build paragraph (§2.5 removed) | union of the 8.1–8.4 *Needs:* lines | VirtualFundamentalClass §§0.2, 1.5, 1.6, 5.5, 6.4–6.5, 8.1, 9.1, 9.3, 9.5, equal to the list; only 8.1's plane-example Check cites §2.5 | complete | none |
| 9.1 second API bullet (prestable `C`) | `ℙ¹`; cuspidal cubic; `ℙ¹ ⊔ ℙ¹`; `x²+y²+z² = 0` over `ℝ`; nodal cubic | `Mor_d(ℙ¹,ℙ^r)` open in `ℙ^{(r+1)(d+1)−1}`; cusp not nodal: excluded; disconnected: excluded; pointless conic: prestable, covered; nodal: covered | holds | none |
| 9.3 API bullet (changed) | `M = Spec k`, `F = id_{ℙ¹}`; `Mor_1(ℙ¹,ℙ^r)` | `H⁰(φ) : (k³)^∨ → 0`, dual `0 → k³`; both sides of dimension `2r+1` | map direction reversed | R01 |
| Layer 9 Examples, first bullet (changed) | `C = V = ℙ¹`; nodal `C` with BF Prop. 6.2 | `⊔_{d≥0} Mor_d`, each nonempty: not of finite type; nodal ⇒ lci ⇒ Gorenstein, so Prop. 6.2 applies | whole scheme excluded by Convention 1 | R02 |
| Pull-request text | head `Suggested.lean`; docstring | 0 declarations, empty elaboration output, 12 headlines listed; description says no declaration and no warnings | consistent | none |

The rows for the statements the diff does not touch stand as in the previous review, of `fd554cb`.

- Source locators checked against the cached texts: 7 ranges, all supporting the changed text as written: kresch1999b lines 319–345 and 386–405; behrend-fantechi1997 lines 811–897 and 1583–1614; vistoli1989 lines 1172–1174, 1188–1202 and 1451–1470.
- Library declaration opened at the pin: `TauCeti.AlgebraicGeometry.PrestableFamily` (`TauCeti/AlgebraicGeometry/Curves/Prestable.lean:45`), which extends `IsProper` and `GeometricallyConnected` and has an `atWorstNodalOfRelativeDimensionOne` field.
- Cross-roadmap citations resolved: VirtualFundamentalClass §2.5 at the #1996 head, and StackPointsAndResidualGerbes lines 52–62 at the #2429 head (`8ca9dfb`). No other roadmap, open or on main, states `P`-divisors or Kresch's construction (grep of all heads).
- Gate rerun at `1cb68bf`: every check 0, `OK`. Dependency check: `depcheck: 255 roadmaps, 2431 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` exits 0 with no output. The file is unchanged since `fd554cb` and has no declarations, so the binder probe and the padding probe are empty.
- Declared gaps `closed-substacks-of-stacks` and `normal-cones-of-local-immersions` are untouched by the diff.
- Remark: the §2.5 contract (lines 345–350) and the Scope bullet (lines 84–89) still list Vistoli's equivalence and its invariance. That is accurate as a description of §2.5, and only 8.1's plane-example Check now uses it.
- Remark: VirtualFundamentalClass §2.5 states Kresch's Theorem 3.1 for Vistoli's construction, but kresch1999b lines 334–336 prove it only for Kresch's own. That concerns VirtualFundamentalClass, not this text.

Overlap check: read VirtualFundamentalClass (#1996), StackPointsAndResidualGerbes (#2429), AlgebraicGromovWittenTheory (#1998), SchemeAndStackFoundations, MotivicStructuresInModuliOfCurves (#2437), EquivariantIntersectionTheory and StableReduction. The diff changes no ownership. Vistoli's equivalence is owned by VirtualFundamentalClass §2.5, Kresch's `β` on arbitrary ambients by 8.1 here, and the other shared objects are as in the previous review.

Source independence: changed passages only. 5 passages (8.1 first bullet, 8.1 route sentence, 9.1 API bullet, 9.3 API bullet, Layer 9 example) were compared with 3 sources (kresch1999b, behrend-fantechi1997, vistoli1989). None shares wording beyond forced terms; the longest common run is 3 words. The largest share is vistoli1989, with 80 of 189 source-id mentions. The diff adds, removes or reorders no layer, so contents were not compared again (independent at `fd554cb`).

## Not verifiable

- None in the changed passages. gillet1984 and fulton1998 remain settled as uncertified and are not cited in them.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, p. 26: the source says Vistoli's rational equivalence is invariant under the whole of `j^*N ×_Y T_Y`; it should be only the restricted action of `T_{Y′}|_{X′}` (in the plane example `η ↦ η + b` moves `ν/η`); affects a stated result; corrected in print at kresch1999b Theorem 3.1, p. 10.
- **Misprint** in kresch1999b at Theorem 3.1, p. 10: the source names `T_{Y′}|_{X′}`, where `Y′` is the arbitrary stack, as the acting bundle; it should be the tangent bundle of the smooth regularly embedded `X`, restricted to `X′`, as the proof uses; affects a stated result.

## For the human reviewers

- StackPointsAndResidualGerbes at the #2429 head (`README.md`, lines 54–62) names VirtualFundamentalClasses, a stopped board package, as the owner of integral closed substacks and cycles. This roadmap's `gap:closed-substacks-of-stacks` assigns them to VirtualFundamentalClass §2.1.
