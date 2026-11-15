# Answer to human review of `1a0f6c3` (pull request head), repairs committed as `bd09c51`

The comment (CBirkbeck, 2026-11-15T16:03:14Z) carries five findings F01–F05. F01 makes three
separate claims (AutomorphicBundles §12.13; ComputationalNumberTheory §4.18; the
AutomorphicFormsOnReductiveGroups and MetaplecticAutomorphicForms sections), numbered H01–H03 below;
F02–F05 are H04–H07. Line numbers are those of `TauCetiRoadmap/LevelOneAutomorphicFormsForClassicalGroups/README.md`
at `bd09c51`.

## H01 (CBirkbeck) — applied

§6.1 (README:2141–2142) now says that the Hecke operators of AutomorphicBundles §12.11 are given at the
non-neat level `Sp_{2g}(ℤ)` by its §12.13, and its *Needs:* (README:2150) reads "AutomorphicBundles
§§11.1–11.2, 11.9, 11.16, 12.10, 12.11, 12.13 and 12.15"; the Layer 6 Dependencies add 12.13. Verified at
the AutomorphicBundles head: §§12.10–12.11 work on neat toroidal models, and §12.13
(`ClassicalHecke.nonNeatDescent`) builds the Hecke action at non-neat level as invariants of a neat
normal cover; `Sp_{2g}(Ẑ)` contains `−1` and is not neat.

## H02 (CBirkbeck) — applied

§2.16 (README:1029–1036) now says that its intervals are the rational enclosures of
ComputationalNumberTheory §4.18 of the closed formulas that §2.4 identifies with the eight scalars, and
its *Needs:* reads "§§2.4, 2.9; ComputationalNumberTheory §§4.18 and 4.29–4.33"; the Layer 2 Dependencies
add 4.18. The same input was missing in two places that do not pass through §2.16, now repaired: §5.2
(positive definiteness at an explicit `ℓ`, README:1953) gets "§2.4; ComputationalNumberTheory §4.18".
§6.11 (README:2421–2429) said "`ℓ = log 4`, the enclosures of §2.4", but §2.4 gives closed formulas, not
enclosures, and §4.18 covers rational `ℓ` only. It now takes `ℓ = 7/5`, cites §4.18 and keeps CL14's
`log 4` as the source's value. Recomputed with the closed formulas of ComputationalNumberTheory §4.17: at
`ℓ = log 4` the left side of CL14 (3.6) is `−1.0700, −0.6412, −0.4857, −0.3500, −0.2294, −0.7868, −0.8631,
−0.3549, −0.0505, −0.8205` for the ten parameters, which is CL14's `−1.07, …, −0.82` (CL14 line 12336–12338).
At `ℓ = 7/5` the ten values are `−1.0787, −0.6479, −0.4916, −0.3555, −0.2343, −0.7975, −0.8727, −0.3619,
−0.0575, −0.8294`, all negative, with both diagonal entries positive.

The same mechanical comparison also found ComputationalNumberTheory §§4.1–4.7 (interval and complex-box
arithmetic) in the scope and contract and in no *Needs:* line. They enter only inside §4.18, so they are
removed from the scope bullet (README:87–90) and the contract (README:404). The contract now states the
rational-`ℓ` hypothesis of §4.18.

## H03 (CBirkbeck) — applied differently

Each section is now cited where its route uses it. AutomorphicFormsOnReductiveGroups §§3.2 and 3.4 are
added to §1.1 (README:496), as suggested. §2.4 is added to §3.4 (README:1258), as suggested, and also to
§1.3 (README:550), whose claim that `SO_{4n+2}` has no discrete series is §2.4's compact-Cartan criterion.
That claim now says `n ≥ 1` (README:543): `SO₂` is a split torus, and by §2.4's own `SO(1,1)` Check every
unitary character of it is square-integrable modulo `A_G`. MetaplecticAutomorphicForms §§0.15 and 2.4c are
added to §6.4 for the theta-kernel route (README:2235–2236), as suggested.

§§3.4, 3.5, 3.7 and 5.6 go to §6.8 (README:2317–2326), not §6.10, because the Rallis relation is where
they are used. §3.21 is a local statement about a nonzero theta lift. Applying it to `θ_g(v)` needs
`θ_g(v)` to be the global lift of §5.6, whose local components are the small theta lifts (§§3.4–3.5),
irreducible by Howe duality (§3.7). The route sentence of §6.8 now says this. §6.10 inherits these through
§6.8 and adds §5.6 itself (README:2405). The source of §6.10, CT20 Lemma 5.7, rests on [Ral84] and
[MW94] (CT20 line 2093–2096), not on Howe duality. Layers 1, 3 and 6 Dependencies are updated. A rerun of
the comparison of contract sections against all *Needs:* lines finds no other unconsumed section; the
remaining hits are references to this roadmap's own sections inside contract text.

## H04 (CBirkbeck) — applied

§2.6 (README:841–846) now applies AnalyticNumberTheoryPartI §1.8 to `κ⁻¹Λ(s, π^∨ × π′)` and
`κ⁻¹Λ(s, π × π′^∨)`. Here `κ` is the product of `π^{−1/2}` over the summands `e` and of `2(2π)^{−w/2}` over
the summands `I_w` of `L(π∞)L(π′∞)`, and the text says that division by `κ` changes no zero, pole,
logarithmic derivative or functional equation. Verified against §1.8 (iv) on main: the factor is
`A^s ∏ Γ(a_i s + b_i)` with no constant, and only zero-slope constants `Γ(b_i)` are removable there. The
suggested Check is added (README:863–865): `κ = 2(2π)^{−11/2} ≈ 8.148·10⁻⁵` for `(1, Δ₁₁)` and `κ = 1` for
`(1, 1)`.

## H05 (CBirkbeck) — applied

`(R_k)` (README:1292–1295) is now defined for an effective `U ∈ K∞`, with `r(U)` the multiplicity of the
weight `0`. `π ∈ Π_alg` satisfies `(R_k)` when `L(π∞)` does, with `r(π) = r(L(π∞))`, and the first API
bullet is stated for `U`. This matches CT20 §5.2.2's condition (R) on `π` (CT20 line 1787–1790).
`1 + e + I₂` has no realization in `Π_alg`: it has motivic weight 2 and rank 4, and §5.3 leaves only the
trivial class below weight 11. The three Checks now apply to the predicate's domain: `1 + e + I₂` has
weights `1, 0, 0, −1` and passes at `k = 2` but fails at `k = 1`; `3·1` has `r = 3` with `1` three times
and fails; `2I₁` has `±1/2` twice and fails. §§3.10–3.11, which apply `(R_k)` and `r` to the `π_i`, read
the same.

## H06 (CBirkbeck) — applied

`Suggested.lean` line 64: `/-! ## Layer 4: geometric torsion classes and masses -/` →
`/-! ## Layer 4: geometric torsion classes and exact mass recovery -/`, the README heading at README:1515.
The other section comment (Layer 8) already matches. As the comment says, its first two edits were
already in the docstring and in the From Tau Ceti contract (`TauCeti.leechLattice`, README:224–232).

## H07 (CBirkbeck) — applied

§8.6 (README:2902–2906) now defines `κ_h` as the order of the kernel of the action of `O(Q_h)` on its
discriminant group, and cites CT19a Lemma 2.4, p. 12, for `e₈, e₁₂, e₁₆`, and Proposition 3.13, p. 24,
with Propositions 3.6 and 3.11, for `n_g` and `κ_h`. Verified: Lemma 2.4 gives only `ω₈ = ±5`,
`ω₁₆ = ±5`, `ω₁₂ = ±18` (CT19a line 496–500). `|K_g|` is at line 985–988, `n_g |K_{24−g}| = |O(Leech)|`
at line 989–990, and the kernels at lines 726–727 (Prop. 3.6, isomorphism for `g = 6, 8`) and 900–901
(Prop. 3.11, kernels `ℤ/3`, `ℤ/5 ⋊ ℤ/2`). This gives `κ₈ = 1`, `κ₁₂ = 3`, `κ₁₆ = 10`, so
`n₈ = |O(Leech)|/10` and `n₁₂ = |O(Leech)|/3`, as the first Check of §8.6 says. The roadmap folder has no
`sources.toml`, and this job may edit only the README and `Suggested.lean`, so the suggested manifest
locator is not added here.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.6, `κ` | `(1,1)`; `(1,Δ₁₁)`; `(1,Sym²Δ₁₁)`; the constants of `Γ_ℝ(s)`, `Γ_ℝ(s+1)`, `Γ_ℂ(s+w/2)` | `U = 1`: `κ = 1`. `U = I₁₁`: `κ = 2(2π)^{−5.5} = 8.1478·10⁻⁵`. `U = I₂₂ + e`: `κ = 2(2π)^{−11} · π^{−1/2}`, with `π^{−1/2} = 0.56419`. `Γ_ℝ(s)`: constant `1`. `Γ_ℝ(s+1) = π^{−1/2}·π^{−s/2}Γ(s/2+1/2)`. `Γ_ℂ(s+w/2) = 2(2π)^{−w/2}·(2π)^{−s}Γ(s+w/2)` | The same `κ` for `Λ₁` and `Λ₂`, since `L(π^∨_∞) = L(π∞)` (§1.5). `κ⁻¹Λ₁(1−s) = ε κ⁻¹Λ₂(s)`. `A = π^{−a/2}(2π)^{−b} > 0`. `Σa_i = Σa′_i` | Check added |
| §3.6, `(R_k)` on `U` | `1+e+I₂` at `k = 1, 2`; `3·1`; `2I₁`; `L(Sym²Δ₁₁) = I₂₂ + e` at `k = 11, 12`; `L(Δ₁₁) = I₁₁` at `k = 6, 7` | `1+e+I₂`: weights `{1,0,0,−1}`, max `1`, fails at `k = 1`, passes at `k = 2`. `3·1`: `coeff(1) = 3 > 2`, fails. `2I₁`: `±1/2` each twice, fails. `I₂₂+e`: max weight `11`, `r = 1`, fails at `k = 11`, passes at `k = 12`. `I₁₁`: max weight `5.5`, fails at `k = 6`, passes at `k = 7` | The definition on `π` is unchanged. `r(U) = coeff(1) + coeff(e)`, since `I_w` with `w > 0` has no weight `0` | defined on `U` |
| §2.16 with §4.18 | `ℓ` rational vs irrational | §2.16 already requires rational `ℓ`; §4.18 holds at rational `ℓ`, for every width `2^{−P}` | consistent | route sentence, *Needs:* |
| §6.11 at `ℓ = 7/5` | all ten parameters at `ℓ = log 4` and `ℓ = 7/5` | At `log 4`: LHS of CL14 (3.6) as listed under H02, matching CL14. At `7/5`: max LHS `−0.0575` (`I₂₁+I₁₃`). `A−J(1) = 0.1686`. `A−J(V²)` lies in `[0.0538, 1.2027]` | `b + √(ac) < 0` with `a, c > 0` gives `b < 0` and `b² > ac`, so §2.12 applies | `ℓ = 7/5` |
| §1.3, `SO_{4n+2}` has no discrete series | `n = 0` (`SO₂`), `n = 1` (`SO(3,3)`) | `SO₂(ℝ) ≅ ℝ^×`, and `G/A_G ≅ {±1}` is compact, so it has discrete series (AFORG §2.4 Check). `SO(3,3)`: absolute rank 3, compact rank 2, none | false at `n = 0` | `n ≥ 1` |
| §6.8 route | `p = 2` (dyadic); definite `O_n` | Metaplectic §3.7 includes dyadic residue fields. `O_n(ℝ)` is compact, so the lift integral over `[O_n]` at level `O_n(Ẑ)` is a finite sum over `X_n` | holds | route sentence |
| §8.6, `κ_h` | `h = 0, 8, 12, 16` | `κ₀ = 1` (`Q₀ = 0`). `κ₈ = 1` (Prop. 3.6). `κ₁₂ = 3` and `κ₁₆ = 10` (Prop. 3.11). So `n₂₄ = n₁₆ = |O|`, `n₁₂ = |O|/3`, `n₈ = |O|/10` | matches the §8.6 Checks | locator, definition |

## Lean signatures, ownership, dependencies

Only a section comment of `Suggested.lean` changed; no declaration changed. The elaborated types supplied with
this job therefore still hold, and each was compared again with its README statement in
§§4.7, 8.5 and 8.6: none of those statements changed. A separate `#check` file was not elaborated,
because this job may run only the build and gate commands. No construction was added, so ownership is
unaffected, and no notion moved down from a later roadmap. The citations added are to sections listed in
the contracts at the heads of AutomorphicFormsOnReductiveGroups, AutomorphicBundles,
MetaplecticAutomorphicForms and ComputationalNumberTheory; all four are earlier in the merge order.

## Build and gate

- `lake build TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups.Suggested`: `Build completed
  successfully (18292 jobs).`, with the four expected `declaration uses 'sorry'` warnings (lines 87, 130,
  143, 155).
- Gate (after commit `bd09c51`): `gate LevelOneAutomorphicFormsForClassicalGroups: set_option=0 blob=0
  latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
  mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0
  readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0
  metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved
  line.
