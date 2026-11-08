# FIX-DESIGN-VirtualFundamentalClasses~4

This round repairs the findings of the review `REV-DESIGN-VirtualFundamentalClasses~3`. The review
has two findings, both P3. Both hold. Each is applied differently from the repair the review proposed:

- F01: the cited theorem concerns Kresch's own rational equivalence, not Vistoli's `β`.
- F02: the proposed reduction through an obstruction theory on `Z' ×_𝔐 X` is false in general.

Files edited:
- `packages/VirtualFundamentalClasses/design/README.md`
- `packages/VirtualFundamentalClasses/design/plan.json`
- `packages/VirtualFundamentalClasses/sources.toml`: the new entry `kresch1999b`, added through
  the sources service and then refined.

There is no `Suggested.lean` at the design stage, so nothing was elaborated and no `#check` file was
run. No target was added or removed: the plan still has 61 targets and 0 gaps.

## F01 (P3) — applied differently

**The finding holds.** The design corrected behrend-fantechi1997 Proposition 3.5 (line 889) on its
own authority. The published correction exists:

- kresch1999b lines 41–47 say that the equivariance has a mistaken proof in BF.
- kresch1999b lines 340–343 say that BF Lemma 5.9 invokes the incorrect stronger claim of
  Proposition 3.5.
- kresch1999b Theorem 3.1 (line 334, proof lines 344–405) proves invariance under the tangent bundle
  of the smooth, regularly embedded substack.

**Why the proposed wording was changed.** The review's text says "this is kresch1999b Theorem 3.1",
on "Vistoli's double deformation space". But Theorem 3.1 is about "the rational equivalence produced
in the proof of Proposition 2.3" (line 334). That is Kresch's own element, built from Corollary 1.10
on the double deformation space (lines 259–304). It is not Vistoli's blow-up construction (vistoli1989
lines 1465–1470).

Its boundary is that of `β`. Translating Kresch's line 304 into our notation (his `X` is our `Y'`,
his `Y'` is our `X`):
- `[C_{X×_Y C_{Y'}Y} C_{Y'}Y]` becomes `[C_{u^*C/C}]`;
- `[C_{C_XY ×_Y Y'} C_XY]` becomes `[C_{j^*N/N}] = [ρ^*C_{X'/Y'}]`, since `ρ` is flat.

Kresch never says that the two elements are equal. So the README cites the theorem for his element
and its boundary, and does not call it the invariance of `β`.

The misprint the review records (Theorem 3.1 prints `T_{Y'}`, while the proof at line 400 acts by
`𝔸^m = T_X`) checks out:
- the action is trivial when `X ⊂ Y'` (line 346);
- `T_{Y'}` would act trivially on `C_{Y'}Y` in every case.

**Changed (old → new).** 4.4: "…asserts (Checks)." → "…asserts (Checks; the error is recorded at
kresch1999b lines 41–47 and 340–343)." 8.5: new sentence citing kresch1999b Theorem 3.1 for
`𝔐 = Spec k`, for its own rational equivalence (boundary of `β`), with the notation swap and
misprint. Also updated: References, plan 4.4/8.5, and the `kresch1999b` manifest entry.

## F02 (P3) — applied differently

**The finding holds.** The second case of 10.7 is stated for any local complete intersection
`v : Z' → Z` between stacks smooth over a reduced `𝔐`. But its route used `β` for
`Z' ×_𝔐 W → Z ×_𝔐 W`, which is an embedding only when `v` is one. Example: `v : 𝔸² → 𝔸¹`,
`(s, t) ↦ st`.

**The proposed repair is false in general.** It factors `v` through its graph and uses the product
theory `G = pr^*Ω_{Z'/𝔐} ⊕ pr^*E` on `Z' ×_𝔐 X`. It claims `G` is compatible with `E` over the
projection (true) and that `F` is compatible with `G` over the graph. The second claim is
behrend-fantechi1997 lines 1495–1498, and it fails.

Over the graph, the fibre of `F → τL_{X'} → τL_{X'/Z'×X}` is forced to be `w^*G`. By the octahedral
axiom, that fibre is the extension of `g^*Ω_{Z'}` by `u^*E` with class `o = χ ∘ g^*a`. Here `a` is
the class of the conormal sequence of `v`.

Counterexample:
- **Setup.** `v : C → ℙ²` a smooth conic, `X = ℙ² × ℙ¹`, `E = Ω_X ⊕ V[1]` with
  `V = O(−2) ⊠ O(−2)`, and `χ` with a nonzero component in `Ext¹(g^*N^∨, u^*V) = H¹(O(0,−2)) = k`.
- **The conormal sequence does not split.** `T_{ℙ²}|_C = O(3)²`, because `H⁰(T|_C(−4)) = 0` by the
  Euler sequence. So `a ≠ 0` in `H¹(O(−2)) = k`.
- **The class `o` is nonzero.** Its component `(a ⊠ 1) ∪ χ_2`, with `χ_2` that nonzero component, in
  `Ext²(g^*Ω_C, u^*V) = H²(O(−2,−2)) = k` is nonzero. This makes the `k`-invariant of the fibre
  nonzero.
- **No `G` can match.** Every `G` compatible with `E` over the projection has
  `h^0(G) = Ω`, `h^{−1}(G) = q^*V` and `k`-invariant in `Ext²(Ω_{C×X}, q^*V) = 0`. This vanishes by
  Künneth, since `O(−2)` and `T_{ℙ²}(−2)` are acyclic on `ℙ²`.

So no theory on `Z' ×_𝔐 X` is compatible both ways.

The conclusion of 10.7 still holds in this example. `Ob` is locally free on both sides, so 10.4 gives
`c_1(O(4,2)) ∩ [C × ℙ¹]` for both.

**Changed (old → new).** 10.7 route: `β` for `Z' ×_𝔐 W → Z ×_𝔐 W` (an embedding only for
embeddings `v`) → `β` for the graph `Z' ×_𝔐 W → Z' ×_𝔐 Z ×_𝔐 W` with `Z' ×_𝔐 U`. It is descended
by 8.5, identified with `𝔉 ×_{u^*𝔈} u^*C_X` through the compatibility over `v` alone, and closed
through `K_1`. Needs gain 4.5 and 10.1. Two Checks are added (`st`, conic), and plan 10.7 is
updated.

**Pattern.** The only use of 10.7's second case inside the roadmap is the 8.5 cross-reference, which
stays correct. 10.6 and 10.8 use regular embeddings (`W' ⊆ W`, `𝔐 × {b} ⊆ 𝔐 × B`) and are
unaffected. No other passage passes through a product theory on `Z' ×_𝔐 X`.

## Checks run

**Dependency gate.** Command as in the brief; output:

```
candidate: VirtualFundamentalClasses is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2351 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

**Citations** (`roadmaps resolve` on the README, main `1653eec`, 474 open heads): no cross-roadmap
citation found nowhere, and no Lean name found nowhere.

**Overlaps** (`scratch/overlaps.md`):
- no open pull request changes this roadmap or drops an id it cites;
- this round adds no cross-roadmap citation;
- the closest roadmaps (EquivariantIntersectionTheory and the SchemeAndStackFoundations revisions)
  are unaffected.

**Ownership.** No new object or target. `roadmaps grep` for compatible obstruction theories and for
Kresch's paper has no match on main or at the open heads. Open pull requests were checked only
through this grep tool, since the brief gave no sibling checkout paths.

**plan.json.** Valid JSON, 61 targets, `gaps: []`. **sources.toml.** Valid TOML, 22 entries, no
local paths.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 8.5 Kresch citation: same boundary as `β` | Kresch line 304 translated (his `X` = our `Y'`, his `Y'` = our `X`) | `X_K ×_Y C_{Y'_K}Y = u^*C`, so the first term is `[C_{u^*C/C}]`; `C_{X_K}Y ×_Y Y'_K = j^*N` and `C_{j^*N/N} = ρ^*C_{X'/Y'}` (`ρ` flat) | boundaries agree; equality of the elements is not claimed by Kresch | wording: "for the rational equivalence of its Proposition 2.3" |
| Kresch's acting group | `X ⊂ Y'`; proof with `Y = 𝔸^n`, `X = 𝔸^m` | `T_X` acts by `z_i ↦ z_i + D_a f_i = z_i` when `f_i|_X = 0`; `T_{Y'}` acts trivially on `C_{Y'}Y` always; proof uses `𝔸^m` (line 400) | group is `T_X`, our `T_{Y'}` | misprint noted in 8.5 |
| 8.5 deduced invariance, `𝔐 = Spec k` (review's instance) | `Y = 𝔸²`, `X` the origin, `Y' = {y = 0}` | `β = c·ν/η`; `T_{Y'} = ⟨∂_x⟩` acts by `ξ ↦ ξ + a`, fixing `c·ν/η` | agrees with Theorem 3.1 | none |
| 10.7 graph `Y' → Y` | `v = id`; `v` regular; `v = st` | diagonal, normal bundle `T_Z`, `𝔑_v = 0`; `𝔑_v = N_v` (`dv` injective); `{z = st}` a smooth divisor in `𝔸⁴_{s,t,z,w}`, codimension `1 = dim Z` | regular local embedding, normal bundle `v^*T_Z` | route text |
| 10.7 fibre product `U' = (Z' ×_𝔐 U) ×_Y Y'` | general; `st` example | equals `U ×_Z Z'`; `{z = w = st} ≅ 𝔸² = X'` | holds | none |
| 10.7 quotient is a `g^*𝔑_v`-torsor | `st` example, `U = W = 𝔸¹` | `(a, b, e)` acts by `ζ ↦ ζ + at + bs − e`, transitive with stabiliser `T_{𝔸²}`; quotient `B T_{𝔸²} = 𝔉`; `𝔑_v = [𝔸¹/𝔸²]` of rank `−1` (`B𝔾_a` off the origin, `𝔸¹ × B𝔾_a²` at the origin) | holds | new Check |
| 10.7 `K_1 = F_1 ×_{u^*𝔈} u^*E_1` | local chain representative; `st` example | locally `K_1 ≅ F_1 ⊕ E_0`, map to `E_1` is `(f, t) ↦ φ_1 f − dt`, surjective because `𝔉 → u^*𝔈` is; `st`: `F_1 = X'`, `E_0 = v^*T`, `K_1 = v^*T_{𝔸¹}`, rank `1 = 0 + 1` | vector bundle with both surjections | route text |
| 10.7 final identity | `st` example | both sides are `[N × K_1]` in a 4-dimensional bundle; `0^!` gives `[𝔸²]`; `v^![𝔸¹] = Γ_v^![𝔸³] = [𝔸²] = v^*[𝔸¹]` | holds | none |
| 10.7 ranks | general | `rk 𝔉 = rk 𝔈 + dim Z' − dim Z`, `vd' = vd + dim Z' − dim Z = deg v^!` | consistent | none |
| BF reduction over the graph (negative Check) | conic `C ⊂ ℙ²`, `X = ℙ² × ℙ¹`, `V = O(−2) ⊠ O(−2)` | `T_{ℙ²}|_C = O(3)²`; `a ≠ 0` in `H¹(O(−2)) = k`; `χ_2 ≠ 0` in `H¹(O(0,−2)) = k`; `o_2 = a ⊠ χ_2 ≠ 0` in `H²(O(−2,−2)) = k`; `Ext²(Ω_{C×X}, q^*V) = 0` | no `G` compatible both ways | new Check; route avoids it |
| 10.7 conclusion on the conic | same | `[X, E] = c_1(O(2,2)) ∩ [X]`, restriction `c_1(O(4,2)) ∩ [X']`; `[X', F] = c_1(u^*V^∨) ∩ [X'] = c_1(O(4,2)) ∩ [X']` (10.4) | theorem holds there | none |
| 10.7 degenerate | `Z = 𝔐`; `Z' = 𝔐` (a section) | `v` smooth (first case); `Ω_{Z'/𝔐} = 0`, graph = `v` regular | covered | none |
| 10.7 local embedding `Z' ×_𝔐 U → Y ×_𝔐 Y` | general | it is `Δ_{Z'/𝔐} × (U → (Z ×_𝔐 W)²)`, a product of local embeddings | holds | route text |

## Sources

- `kresch1999b`: arXiv alg-geom/9710011v2, fetched through the sources service, certified,
  open-repository. Read lines 1–60 and 180–420.
- behrend-fantechi1997: read lines 805–897 and 1376–1498.
- No text is missing, and `scratch/needs-references.toml` was not created.

## For the maintainer

- **Source issue (new).** behrend-fantechi1997, proof of Proposition 5.10, lines 1495–1498:
  - the claim that `F` is compatible with `Ω_{Y'} ⊞ E` over the graph `Γ_v` fails in general (the
    conic example above);
  - the proposition itself survives, through the graph-ambient route now in 10.7;
  - the README records the gap as a Check.
- **Source issue (confirmed).** kresch1999b Theorem 3.1 prints the acting bundle as `T_{Y'}` where its
  proof uses `T_X`. Also, its rational equivalence is Kresch's own, with the boundary of Vistoli's.
- No name or section id that other roadmaps cite changed.
- The review contained no instruction-like or suspicious text.
