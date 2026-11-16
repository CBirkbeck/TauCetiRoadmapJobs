# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~8

Repair of the round-8 review of the QuasicoherentSheavesOnPrestacks design (five findings: one P1, one P2, three P3). Files changed: `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`, `packages/QuasicoherentSheavesOnPrestacks/sources.toml`.

## F01 (P1) — applied

8.4's route: "`[X/G] → BG` … representable by quasi-projective schemes" → the base change along a torsor P is `P ×^G X` (SchemeAndStackFoundations §1.16), a scheme with ample L by the new **gap:twist-quasiprojective** on §1.16, the review's fallback. Added: two Checks (ℚ(i) witness, ℙ¹ descent datum); *Needs*, Dependencies, contracts, plan gap, SGA1 source.

Why the fallback, not the main repair. StableReduction Layer 2 states polarised étale descent by "recovering the scheme by relative `Proj`", which recovers only projective schemes. SchemeAndStackFoundations and ModularCurves Layer 0.5 both read it as polarised descent of projective curves, so it does not cover quasi-projective X. SchemeAndStackFoundations §0.8 `quasi_sections` does supply étale-local sections, but that alone does not close the route.

Ownership was searched on main (SchemeAndStackFoundations §§0.8, 1.16; StableReduction Layer 2; ModularCurves Layer 0.5; EquivariantIntersectionTheory §2.1) and at the open heads (`roadmaps grep` for linearized-ample twists; SchemeAndStackFoundationsPartII; the SchemeAndStackFoundations revision #1808). EquivariantIntersectionTheory §2.1 is the closest: its mixed spaces `X ×^G U` are quasi-projective, but only for a torsor `U → U/G` inside a representation, not for an arbitrary torsor over an affine base. Nobody states the general twist.

The gap's route pointer is SGA1 Exposé VIII Proposition 7.8, p. 174 (SGA1 line 6972): descent of quasi-compact schemes with a compatible relatively ample invertible module along a faithfully flat quasi-compact map is effective, and the descended module is relatively ample. Over R′ = an fppf trivialization of P, the twist is `X_{R′}`. The route needs neither Cartier's theorem nor étale sections, so `smooth_of_grpObj_of_charZero` is not added.

## F02 (P2) — applied

Scope gains a LanglandsParameterStacks §1.8 bullet (its derived parameter stacks' `QCoh`/`Perf`; 7.2 and 6.3 extend and agree). §1.8 is now in the Summary, the Layer 7 ownership bullet, the contracts, the *Needs* of 6.3 and 7.2 (each with an agreement sentence) and the Layer 6/7 Dependencies. 7.2 gains an agreement Check; the plan matches.

Verified at the head of LanglandsParameterStacks (open, new folder) line 390: "Construct its enhanced quasi-coherent category as the totalization of module categories on the action-groupoid nerve … perfect category by chartwise dualizability". Its Checks (free translation gives `Mod_Λ`; `BĤ` needs coherent action data) match 7.2's.

## F03 (P3) — applied

*Needs*: 6.2, 7.1, 8.2 gain 4.1; 7.4 gains 4.1, 4.2. Layer 7 Dependencies → "Layers 2–6"; "How to read the build" names Layer 4 for Layers 6–7; plan prerequisites match. No cycle: 4.1 needs 2.1; 4.2 needs 1.2, 1.5, 2.3, 4.1. Pattern search: 8.3 already lists 4.1–4.2, and 8.4 reaches affine diagonals only through 6.2.

## F04 (P3) — applied

"From Tau Ceti: No Tau Ceti declaration is consumed directly" → `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212; opened at the pin: field k, `LocallyOfFiniteType`, one universe), cited in 8.4's route, *Needs*, Layer 8 Dependencies and the plan. ReductiveGroups Layer 1 stays only for the comodule dictionary, now cited where 8.4 uses local finiteness.

## F05 (P3) — applied

1.1 API: "θ preserves small colimits, in particular pushouts and finite products" → pushouts from colimits; finite products separately, via the conservative limit-preserving forgetful functors to `D(ℤ)_{≥0}`. New Check: `θι(ℤ×ℤ)` has `π₀ = ℤ²`, coproduct `ℤ ⊗ᴸ ℤ = ℤ`. Same pattern in 2.4 ("hence … the final prestack") now argued via `u_! Spec ℤ = Spec u(ℤ)`. Plan matches.

## Checks run

**Dependency gate** (command of the brief), output:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The new citations add no new supplier roadmap: SchemeAndStackFoundations §1.16 is on main, LanglandsParameterStacks was already a supplier (§1.7), and the Tau Ceti declaration is pinned.

**Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name found nowhere.

**Ids at open revisions:** SchemeAndStackFoundations §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 and ReductiveGroups Layers 1, 3, 6 all keep their headings at the head of the open revision #1808. LanglandsParameterStacks §1.8 exists at its head.

**Plan consistency:** 33 targets and 126 tests, each target with at least three tests. No `target:` prerequisite points forward. The gap slugs match between README and plan (`chevalley-quasiprojective-quotient`, `twist-quasiprojective`).

**Suggested.lean:** this is a design and has no `Suggested.lean`, so no `#check` scratch file was elaborated and no Lean command was run.

**Sources:** SGA1 was fetched through the sources service from arXiv math/0206203v2 (open repository, certified). The manifest key is `SGA1`, with metadata corrected (authors, 1971, retyped edition, page offset 16) and Proposition 7.8 read at SGA1 line 6972. No text was missing and no `needs-references.toml` was written. The style scan of the README found no LaTeX delimiters, process words or machine paths.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1: θ preserves finite products | `ℤ × ℤ`; empty product | `π₀θι(ℤ×ℤ) = ℤ²` = product; coproduct `ℤ⊗ᴸℤ = ℤ`; empty product is the zero ring, `θι(0) = 0` final | true, reason now correct |
| 2.4: `u_!` preserves the final prestack | `u = ι, θ, θι`; empty prestack | `u(ℤ) = ℤ` initial, so `u_! Spec ℤ = Spec ℤ`; `u_! ∅ = ∅` by colimits | true, reason now correct |
| gap:twist-quasiprojective | P trivial; `G = 1`; X a point; X = G by translation; `ℤ/2`, `P = Spec ℚ(i)`, `X = ℙ¹` via `diag(1,−1)`; `R = 0`; X = ∅; G = μ_p in characteristic p | `X_R`; `X_R`; `Spec R`; P itself, affine, `O` ample; invariants `ℚe₁ ⊕ ℚie₂`, twist `ℙ¹_ℚ`; empty over `Spec 0`; empty; fppf (not étale) trivialization, SGA1 7.8 still applies | true; no characteristic or smoothness hypothesis needed |
| 8.4: base change of `[X/G] → BG` along P is `P ×^G X` | `G = 1`; X = G | `[X/1] = X`, base change `X_R`; `[G/G] = Spec k`, base change P | consistent with 8.3(b)'s hypothesis (qcqs, flat, one-element ample family) |
| 8.4 Check, non-product twist | `k = ℚ`, `G = ℤ/2`, `X = G`, `P = Spec ℚ(i)` | twist `Spec ℚ(i)`, no ℚ-point; Zariski gluing gives `Spec ℚ ⊔ Spec ℚ`, two points | excludes the gluing model |
| 8.4 Check, descent datum | same G, P; `ℙ¹`, `O(1)` | `c∘diag(1,−1)`: `ae₁ + be₂ ↦ c(a)e₁ − c(b)e₂`, fixed iff `a ∈ ℚ` and `b ∈ ℚi` | `ℙ¹_ℚ`, `O(1)` ample |
| 7.2 against LanglandsParameterStacks §1.8 | free translation of Ĥ over Λ; `BĤ`; trivial Ĥ | `Mod_Λ`; `O(Ĥ)`-comodules (Ĥ flat affine); `Mod_Λ` | agree with §1.8's Checks |
| 6.3 against §1.8's `Perf` | chart pullback; trivial Ĥ; `⊕_ℕ O` | dualizable in the limit iff dualizable at `[0]` (1.5; higher terms are pullbacks); `Perf(Λ)`; not dualizable on either side | agree |
| F03 prerequisites | ordering of 4.1, 4.2 before 6.2, 7.1, 7.4, 8.2; `G = 1` in 7.1 | 4.1 ← 2.1; 4.2 ← 1.2, 1.5, 2.3, 4.1; `[X/1]` has affine diagonal when X does | no cycle |
| Tau Ceti embedding | trivial G; `G_a`; non-reduced `μ_p` in characteristic p | `n = 0`; upper unipotent in `GL₂`; `μ_p ⊂ GL₁` closed | hypotheses (field, locally of finite type, one universe) match 8.4 |
| ReductiveGroups Layer 1 local finiteness in 8.4 | regular representation `O(GL_n)` over ℚ | directed union of its finite-dimensional subcomodules (Tau Ceti `iUnion_finiteSubcomodules_eq_univ`, over a field the freeness hypothesis holds) | supports "union of finite-dimensional subrepresentations" |

## For the maintainer

- **New supplier gap.** `gap:twist-quasiprojective` asks SchemeAndStackFoundations §1.16 for representability of contracted products by quasi-projective schemes under a G-linearized ample bundle, with SGA1 VIII 7.8 as the route. The other gap (`chevalley-quasiprojective-quotient`, ReductiveGroups Layer 3) is unchanged.
- **New citation.** LanglandsParameterStacks §1.8 (an open pull request adding a new folder, earlier in the merge order). The roadmap already depended on its §1.7, so this adds no new dependency edge.
- **No renamed or dropped ids.** No section, layer or target of this roadmap was renamed, renumbered or deleted. No roadmap on main cites this one; AnalyticStacks, the downstream consumer, is unaffected.
- **Suspicious text.** None found in the review.
- **Ownership coverage.** Ownership against open pull requests was checked through the board's index and `roadmaps grep`. Pull requests outside that index were not checked.
