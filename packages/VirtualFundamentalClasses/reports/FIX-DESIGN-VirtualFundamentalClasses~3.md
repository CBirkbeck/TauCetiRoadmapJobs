# FIX-DESIGN-VirtualFundamentalClasses~3

This round repairs the findings of the review `REV-DESIGN-VirtualFundamentalClasses~2`. That review had
four findings: one P2 and three P3.

Files edited:
- `packages/VirtualFundamentalClasses/design/README.md`
- `packages/VirtualFundamentalClasses/design/plan.json`
- `packages/VirtualFundamentalClasses/sources.toml` (two `cited_for` lists only)

There is no `Suggested.lean` at the design stage, so nothing was elaborated. No target was added
or removed: the plan still has 61 targets.

## F01 (P2) — applied differently

**The finding holds.** With `𝔐` only reduced, `W` is not smooth over `k`. So the invariance from 4.4
("`Y` smooth", acting by `T_Y`) cannot be applied to `W`. The claim "this is the only use of the
smoothness of `𝔐`" was also wrong.

**The suggested repair is false.** It asks for invariance under `T_{Y/𝔐}` for every regular
`Y' → Y`. A counterexample:

- Take `Y = 𝔸²`, `X` the origin and `Y' = {y = 0}`. Then `X' = X`, `u^*C = C = T_0𝔸²` with
  coordinates `(ξ, η)`, and `N ×_Y C = 𝔸³` with coordinates `(ν, ξ, η)`.
- `C_{u^*C/C} = {ν = 0}`, because `u^*C → C` is the identity.
- `ρ^*C_{X'/Y'} = {η = 0}`, because the cone of the origin in `Y'` is the `ξ`-axis.
- `W_2(𝔸³) = k(𝔸³)^×`, so `β = c·ν/η` for some `c ∈ k^×`.

Now take `𝔅 = 𝔸¹` and `p = x : 𝔸² → 𝔸¹`, a smooth map from which `Y'` is not pulled back. Then `T_{Y/𝔅}` acts by `η ↦ η + b`, and `c·ν/(η + b) ≠ c·ν/η`.

**The existing 4.4 bullet is false too.** It stated invariance under all of `T_Y`, following
behrend-fantechi1997 Proposition 3.5 (line 889). The example above refutes it. The source's proof
(lines 894–897) compares the inverse images `Y' × Y` and `Y × Y'` of `Y'` in `Y × Y`, and these
differ.

**What is true:** invariance holds when `Y'` is pulled back from the base. In that case `p_1` and
`p_2` pull `Y'` back to the same substack `(Y ×_𝔅 Y) ×_𝔅 𝔅'`. Proposition 3.4, applied through each
projection, then gives `p_{1*}^*β = p_{2*}^*β`.

**Changed (old → new):** 4.4: the false `T_Y`-invariance bullet → Proposition 3.4 stated precisely, a
pointer to 8.5 and a negative-control Check. 8.5: new bullet, invariance under `T_{Y/𝔅}` for
`Y' = Y ×_𝔅 𝔅'`, with a corollary for `T_{Y'/𝔐}`, and three Checks. 10.6, 10.7: routes cite 8.5;
"only use" sentence replaced. Plan 4.4, 8.5, 10.6, 10.7 match.

**Details of the 8.5 bullet.** The corollary covers a regular `Y' ⊆ Y` with both smooth over a
reduced `𝔐`. Étale-locally such a `Y'` is the fibre over `{0} × 𝔐` of a smooth `Y → 𝔸^c × 𝔐`; 8.3's
transitivity triangle gives the exact sequence `0 → I/I² → Ω_{Y/𝔐}|_{Y'} → Ω_{Y'/𝔐} → 0`. The Checks
are the `𝔸²` example for both choices of `p`, the review's node instance, and the degenerate cases.
8.5's *Needs* and plan prerequisites now include 4.4 and 8.3, and the plan has a new API item and
three tests for it. The build paragraph now says that 8.5 uses 4.4.

**Why 8.5 and not 4.4:** `T_{Y/𝔅}` for a DM stack smooth over an algebraic stack, and the relative
Lemma 3.2, are Layer 8 objects. A bullet in 4.4 would depend on later layers.

**Same pattern elsewhere:** 10.8 uses this descent only through 10.6, so its text did not change.
Behrend-fantechi1997 Lemma 5.9 (line 1416) quotes the false claim "invariant under
`T_{Y×M}`". It only uses the true part, invariance under `T_{Y'×M}`, which is the case
`𝔐 = Spec k` of the deduced statement; 8.5 names it as such.

## F02 (P3) — applied

8.1 used `C_{U/W}` for the conormal sheaf. It now names the conormal sheaf `I/I²`, the degree-one part
of `⊕ I^n/I^{n+1}`, and defines `K_{U,W} := [I/I² → Ω_{W/𝔐}|_U]`. In 9.1, `h^♯ : g^*C_{U/W} → J`
became `h^♯ : g^*(I/I²) → J`. The plan's 8.1 statement changed the same way.

A grep finds no other place that uses `C_{U/W}` for the conormal sheaf. 8.4, 8.5 and 7.5 already
used `I/I²`. The 8.1 Check `K = [(x²)/(x⁴) → A dx]` matches the new notation.

## F03 (P3) — applied

The finding holds: `Spec k → Spec k[ε]/(ε²)` has pure dimension `0` but `vd = −1`. In the 9.2 Check,
"and then `vd = …`, which is `dim M` when `M` has pure dimension" became "in which case `M` has pure
dimension `vd = m + rk τ^{≥−1}L`". The Check now also gives the reason. Take `W` of pure dimension
`m + d` and `U ⊆ W` regular of codimension `c`. Each component of `U` then has dimension
`m + d − c`, since a regular sequence lowers the local dimension by exactly `c` at each generic
point. Also `rk τL = d − c`.

The plan's `IsObstructionTheory.id` now says the same. I searched the README for other claims that
`vd` equals `dim M`. 10.2 ("`dim M = m + rk Ω_{M/𝔐}`", for smooth `M`) and 10.4 ("`s = dim M − vd`",
for smooth `M`) are both correct.

## F04 (P3) — applied

The finding holds: 10.1 is not used. 11.5's *Needs* changed from "11.2, 10.1" to "11.2, 11.4, 7.3,
10.2". In the plan, `target:10.1` was replaced by `target:7.3b`, `target:10.2` and `target:11.4`.

I added 11.4 beyond the suggested repair. 11.5's conclusion ("the obstruction theory of 11.4 has a
global resolution … `[M]^vir` is defined") needs 11.4's obstruction theory. 11.4 does not depend on
11.5, so this creates no cycle.

## Checks run

**Dependency gate** (`tauceti-roadmap … gate --candidate packages/VirtualFundamentalClasses/design/README.md
--only VirtualFundamentalClasses …`):

```
candidate: VirtualFundamentalClasses is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2392 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines.

**Other checks:**
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is missing.
- `plan.json` parses, and `sources.toml` parses with 21 `[[source]]` entries, as before.
- I grepped the README for `$`, `\(`, `\[` and for process words; there are no hits.
- The `#check` comparison was not run: there is no `Suggested.lean` at the design stage.

**Ownership:** `roadmaps grep` over main and the open pull requests finds no other owner of Vistoli's
rational equivalence or its invariance. It stays with this roadmap (4.4, 8.5). Ownership against
open pull requests was checked only through that grep tool.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.4 Prop. 3.4 restated | `π = id`; `𝔸²`, origin, `Y' = {y=0}`, `Ỹ = 𝔸⁴` via `p_1` | `α = id`; `β(Ỹ', X) = c·ν/η₁ = α^*(c·ν/η)` | holds | none |
| 4.4 old `T_Y`-invariance | `𝔸²`, origin, `Y' = {y=0}` | `β = c·ν/η`; `η ↦ η+b` gives `c·ν/(η+b)` | false | deleted, Check added |
| 8.5 invariance, `Y'` pulled back | `p = y` on `𝔸²`; node `W = 𝔐 × 𝔸¹`, `𝔐' = V(a+b)`; `p` étale; `𝔅' = 𝔅`; `X = Y' = {y=0}` | `ξ`-translation fixes `c·ν/η`; `T_{W/𝔐} = O`, `Ω_W` fibre 3 vs 2, `p_i^{-1}W' = 𝔐' × 𝔸²` for both; `T = 0`; `β = 0`; `T_{Y/𝔅}` maps to `0` in `N_{X/Y}`, trivial action | holds | new bullet |
| 8.5 invariance, `Y'` not pulled back | `p = x` on `𝔸²` | `c·ν/(η+b) ≠ c·ν/η` | hypothesis needed | negative Check |
| 8.5 deduced (`Y' ⊆ Y` smooth over `𝔐`) | `𝔐 = Spec k`, `𝔸² ⊇ {y=0}`; `Y' = Y`; `Y × {0} ⊆ Y × 𝔸^c` | invariant under `T_{Y'}` (ξ); `β = 0`; `𝔅 = 𝔸^c`, `T_{Y/𝔅}|_{Y'} = T_Y` | holds | new |
| 10.6 regular case | origin of `𝔸¹`, `M = 𝔸¹ × Y`; `𝔐 = k[ε]/(ε²)` | `v^![𝔸¹×Y] = [Y]`; `W` non-reduced, not covered | consistent | route rewritten |
| 10.7 second case | `Z' = Z × {0} ⊆ Z × 𝔸¹` (regular, both smooth over `𝔐`) | `Z'×_𝔐W` pulled back from `Z`; deduced statement gives `T_{Z'/𝔐} ⊕ T_{W/𝔐}`-invariance | holds | route rewritten |
| 8.1 `K_{U,W} = [I/I² → Ω]` | `k[x]/(x²) ⊆ 𝔸¹`; `BG`, `(G, Spec k)`; `f = id` | `(x²)/(x⁴) → A dx`, `x² ↦ 2x dx`; `I = 0`, `K = 0`; `K = 0` | matches Checks | notation |
| 9.2 lci ⇒ pure dimension `vd` | hypersurface in `𝔸^n`; smooth `M` of dim `n`; `Spec k → Spec k[ε]` | `vd = n − 1 = dim`; `c = 0`, `vd = n`; not lci, `vd = −1 ≠ 0` (no claim) | holds | clause fixed |
| 11.5 needs | the statement | global resolution (7.3), class (10.2), theory (11.4); 10.1 unused | consistent | needs fixed |

## Sources

No new source was needed, and `needs-references.toml` was not created. The `cited_for` lists of
`behrend-fantechi1997` (4.4 and 8.5) and `stacks-properties` (8.5) were extended.

Locators were read at their lines:
- behrend-fantechi1997: line 762 (Proposition 3.1), lines 774–809 (Lemma 3.2), lines 834–897
  (Propositions 3.3–3.5), line 1397 (Lemma 5.9) and lines 1640–1739 (§7).
- stacks-properties: Lemma 12.1, line 1374.

**Source issue (error):** behrend-fantechi1997 Proposition 3.5, printed page 26, line 889. It claims
invariance under all of `T_Y`, but `β` is invariant only along directions tangent to the fibres of a
smooth map from which `Y'` is pulled back. Counterexample: `𝔸²`, `X` the origin, `Y' = {y = 0}`,
where `β = c·ν/η`. The same false claim appears in the proof of Lemma 5.9 (line 1416), which uses
only the true part.

## For the maintainer

- No Lean names, ids or section numbers that other roadmaps cite were changed.
- Earlier statements of 4.4's invariance under `T_Y` were false; the corrected form is in 8.5.
- Nothing in the review was suspicious: it contains no instructions.
