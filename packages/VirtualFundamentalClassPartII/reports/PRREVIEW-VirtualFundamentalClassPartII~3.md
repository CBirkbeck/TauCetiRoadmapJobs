# Review of VirtualFundamentalClassPartII (pull request #2446 at fed9814)

**Verdict:** needs changes

## R01 (P2) — 9.1 says the stack of stable maps is a stack of Convention 1 over every field

**Location:** `TauCetiRoadmap/VirtualFundamentalClassPartII/README.md:2253–2255`: "and the stack of stable maps of a given class, which is proper, is such an open substack (behrend1997 lines 129–138 and Proposition 4, lines 139–141)." Here `k` is arbitrary (Convention 1).

**Claim:** "Such" means a stack of Convention 1, so the stack must be Deligne–Mumford. In characteristic `p` a stack of stable maps of a given class need not be: properness gives finite type, but it does not make the stabilisers unramified. AlgebraicGromovWittenTheory (#1998 head, Scope, lines 74–75) restricts to characteristic `0`.

**Witness:** Take `k = 𝔽_p` and the Frobenius `F : ℙ¹ → ℙ¹`, a stable map of genus `0` and degree `p`. Since `F ∘ A = A^{(p)} ∘ F`, `Aut F ⊇ ker(Frob : PGL₂ → PGL₂)`. Because `dF = 0`, its Lie algebra is all of `H⁰(ℙ¹, T_{ℙ¹}) = k³`, so the stack is not Deligne–Mumford.

**Repair:** In 9.1, replace the clause with: "and, when `k` has characteristic `0`, the stack of stable maps of a given class, which is proper and Deligne–Mumford, is such an open substack (behrend1997 lines 129–138 and Proposition 4, lines 139–141)." Add this to 9.1's **Checks**: "In characteristic `p`, the Frobenius `F : ℙ¹ → ℙ¹`, `[x : y] ↦ [x^p : y^p]`, is a stable map of genus `0` and degree `p`. Its automorphism group scheme contains the Frobenius kernel of `PGL₂`, of order `p³`, whose Lie algebra is `H⁰(ℙ¹, T_{ℙ¹}) ≅ k³` because `dF = 0`. So the stack of stable maps of degree `p` to `ℙ¹` is not Deligne–Mumford and is not a stack of Convention 1." Tested on the witness: in characteristic `0` the Frobenius instance does not arise, and behrend1997 Proposition 4 gives a proper Deligne–Mumford stack. In characteristic `p` the sentence makes no claim, and the Check records the counterexample.

## Previous findings

- R01 — repaired: "`H⁰(φ) ⊗ κ : H⁰(C_κ, F^*T_X)^∨ → Ω_{M/k} ⊗ κ` is dual to the tangent map `T_{[F]}M → H⁰(C_κ, F^*T_X)` … this map is bijective when `(M, F)` is a relative space of maps" (lines 2369–2373).
- R02 — repaired: "An open subscheme of finite type of the space of morphisms from a fixed prestable curve to a smooth projective variety `V`, such as the maps `F` with `deg F^*L = d` for an ample `L` on `V`" (lines 2472–2474).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 9.1 stable-map clause (changed), characteristic `0` | `V = ℙ^r`, genus `0`, class `d` | proper DM (behrend1997 Prop. 4); finite diagonal, finite type: a Convention 1 stack, open in `Mor_𝔐(𝒞, V)` and representable over `𝔐` | holds | none |
| 9.1 stable-map clause (changed), characteristic `p` | `k = 𝔽_p`, `V = ℙ¹`, degree `p`, Frobenius | `F∘A = A^{(p)}∘F`; stabiliser `⊇ ker Frob_{PGL₂}`, order `p³`, Lie algebra `k³`: not Deligne–Mumford | fails Convention 1 | R01 |
| 9.1 clause, finite type (the previous R02 concern) | all classes against one class | the union over classes is not quasi-compact; a single class is proper, hence of finite type | repaired | none |
| 9.3 first API bullet (changed) | `M = Spec k`, `F = id_{ℙ¹}`, `κ = k` | `H⁰(φ)⊗k : (k³)^∨ → 0`; tangent map `0 → k³`, whose dual is `(k³)^∨ → 0`; not bijective, as 9.1's third Check says | holds | none |
| 9.3 first API bullet | `M = Mor_1(ℙ¹, ℙ^r)`, `κ = k` | `dim T_{[F]}M = 2r+1`; Euler sequence: `h⁰(F^*T_{ℙ^r}) = 2(r+1) − 1 = 2r+1`, `h¹ = 0`; bijective | holds | none |
| 9.3 first API bullet, source of `H⁰(φ)⊗κ` | `k = 𝔽_p(a)`, `κ = k(a^{1/p})`, the same `M` | `h⁰(E)⊗κ = h⁰(E⊗^Lκ) = H⁰(C_κ, F^*T_X)^∨` (right exactness, 9.2 base change); `T = Der_k(O_M, κ)`: dimension `2r+1` on both sides | holds | none |
| Layer 9 Examples, first bullet (changed) | `C = V = ℙ¹`, `L = O(1)`, `d = −1, 0, 1` | empty; `ℙ¹` (constant maps); `PGL₂ ⊂ ℙ³`; each open and closed, of finite type | holds | none |
| Layer 9 Examples, first bullet | `C` two `ℙ¹` meeting in a node, `V = ℙ¹`, `d = 1` | graph Hilbert polynomial `n(deg O_C(1) + d) + 1 − p_a` is fixed by `d`; bidegrees `(1,0)`, `(0,1)`; nodal ⇒ Gorenstein, so BF Prop. 6.2 applies | holds | none |
| Pull-request text | description against the head | "`(Rπ_* F^*T_X)^∨ → L_{M/𝔅}` … over any pure-dimensional base" is in 9.3; "no warnings" matches the silent elaboration; no sentence covers the changed passages | consistent | none |

The rows for the statements the diff does not touch stand as in the previous review, of `1cb68bf`.

- Source locators checked against the cached texts: behrend1997 lines 20–47, 82–91 and 129–141; behrend-fantechi1997 lines 1583–1614.
- Library declarations: the diff names none. `Suggested.lean` is unchanged since `fd554cb` and has 0 declarations, so the `#check` binder probe and the padding probe are empty.
- Cross-roadmap citations resolved: AlgebraicGromovWittenTheory at the #1998 head (Scope, lines 74–75; §3.3 owns properness and the Deligne–Mumford property) and StackPointsAndResidualGerbes at the #2429 head (`8ca9dfb`, lines 52–62).
- Gate rerun at `fed9814`: every check 0, `OK` (the worker's gate also reports `build=0`). Dependency check: `depcheck: 258 roadmaps, 2454 edges, 0 problem(s)`; there is no UPWARD or CYCLE line.
- Elaboration: `lake env lean Suggested.lean` exits 0 with no output.
- The declared gaps `closed-substacks-of-stacks` and `normal-cones-of-local-immersions` are untouched by the diff. No file outside the folder changed.

Overlap check: AlgebraicGromovWittenTheory (#1998) and StackPointsAndResidualGerbes (#2429) were read again. VirtualFundamentalClass (#1996), SchemeAndStackFoundations, MotivicStructuresInModuliOfCurves (#2437), EquivariantIntersectionTheory and StableReduction stand as in the previous review. The diff changes no ownership. The stack of stable maps and its properness are owned by AlgebraicGromovWittenTheory §3.3 (this README's Scope, line 132, defers them). The obstruction theory of relative spaces of maps is owned by 9.3 here.

Source independence: changed passages only. 3 passages (9.1 stable-map clause, 9.3 first API bullet, Layer 9 first example) were compared with 2 sources (behrend1997 lines 129–141; behrend-fantechi1997 lines 1583–1614). None shares wording beyond forced terms; the longest common run is 4 words ("stack of stable maps"). The largest share is vistoli1989, with 80 of 189 source-id mentions. The diff adds, removes or reorders no layer, so contents were not compared again (independent at `fd554cb`).

## Not verifiable

- None in the changed passages. gillet1984 and fulton1998 remain settled as uncertified and are not cited in them.

## Source issues

- **Error** in behrend1997 at Proposition 4, p. 5: the source calls the stack of stable maps a proper Deligne–Mumford stack over an arbitrary field (line 82); it should assume characteristic `0` or bound the class against `p`, since the Frobenius `ℙ¹ → ℙ¹` has non-reduced automorphisms; affects a stated result.

## For the human reviewers

- StackPointsAndResidualGerbes at the #2429 head (`8ca9dfb`, `README.md` lines 54–62) still names VirtualFundamentalClasses, a stopped board package, as the owner of integral closed substacks and cycles. This roadmap's `gap:closed-substacks-of-stacks` assigns them to VirtualFundamentalClass §2.1.
