# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~8

Repair of the four P3 findings of REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~7 (design, round 7).
Files edited: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`, `design/plan.json`,
`sources.toml`. The review's "For the human reviewers" section (scope, licences) was not acted on.

## F01 (P3) — applied

Verified. The old second Check of §6.1 said that ramification at both `v` and `v^c` rules out every CM preparation. That is false when `ρ(I_{v^c})` has order three. The new Check states the impossibility only when `ρ(I_{v^c})` is infinite or of order divisible by five, gives the order-three case as the counterexample, and says why this route needs `v^c` unramified.

Refinement of the suggested text: the reviewer wrote "order divisible by five". `ρ(I_{v^c})` can be infinite (unipotent ℓ-adic inertia), so the Check names that case separately, with its proof: an open subgroup of an infinite profinite group is nontrivial. Plan test `prep_conjugate_ramified` was rewritten to match. Pattern search: §6.2's hypothesis at `v^c` and §7.2's second Check ("a single selected place would leave `v^c` possibly bad") claim nothing about every CM extension, so neither needed a change.

## F02 (P3) — applied

Verified. Theorem 2.1 assumes `ζ₅ ∉ K`, so the `ζ₅ ∈ K` branch of §8.1 cannot cite it. The branch now re-runs the argument of 2.1(c) explicitly:
- `F = K(μ₃ₚ)` is CM by Theorem 1.1.
- `A_t` is geometrically non-CM: its mod-five image `SL₂(𝔽₅)` has no abelian subgroup of index at most two.
- Hence `H¹(A_t)|G_F` is absolutely irreducible (Faltings R28.6.2–R28.6.3).
- PotentialAutomorphyInfrastructure §2.3(1) gives the base change, which realizes `V_η` by the parent's §4.2.

*Needs:*, the Layer 8 Dependencies and the plan's 8.1 prerequisites now include Theorem 1.1, the parent's §4.2 and Faltings R28.6.2–R28.6.3. The parent's §4.2 identification `V_η ≅ H¹(A_t)` is also used by the route, and the reviewer did not list it. Pattern: §§6.2 and 7.5 descend using residual absolute irreducibility, not Faltings, and their *Needs* lines are complete.

## F03 (P3) — applied differently

Verified (`h(0) = 1` contradicts the cubic `x³ − x`; `k_v` was a residue field in §5.2 and an integer in §7.2). Changes in §§7.1–7.2:
- the base field `k` is now `K`;
- the integer `k_v` is now `m_v`;
- the unit series is now `λ`, and the Tate parameter is written `q_A = s³λ(s)` with `λ(0) ≠ 0`.

Why not the reviewer's letters: `u` was the `A₁` coordinate in `uv = s²` in §7.1(c), and the constant `c` collided with conjugation `v^c` in §7.2.

The same kind of clash, repaired elsewhere:
- `uv = s²` is now `z₁z₂ = s²`, because `v` was also the valuation in (d);
- the index `j ∈ ℤ/3` is now `r`, because `j` is also the j-invariant in §7.1;
- the Tate parameter `q` is now `q_A` in §7.1 and §7.3, because `q` is the auxiliary prime in §§7.2 and 7.5;
- the §6.2 Check's `h = diag(1,2)` is now `γ`.

The Conventions now say that the `sl₂` basis vector `h` occurs only in Layers 3–4, where the cubic `h` does not occur, and that `O` in Layer 7 is the origin of `E`, as in the parent. The plan's 6.2, 7.1, 7.2 and 7.3 entries were updated to match.

## F04 (P3) — applied

Verified. The roadmap has no "Lemma 4.2", and LeHung26 is cited in §1.1 but `cited_for` lacked "1.1". The AKT23 reference now reads "replaced in this case by §4.2", and LeHung26 `cited_for` gains "1.1".

Pattern repair after a mechanical comparison of every manifest entry with the README:
- LeHung26: the nonexistent "1.3" is replaced by "Layer 1" (the Layer 1 Examples cite Remark 4.2).
- CaptainSude26 gains "Conventions" and "Scope and ownership"; OpenAI26 gains "Scope and ownership"; CN23 gains "2.5"; CHT08 gains "Exact supplier contracts".
- ACC23 claimed §6.1 without a §6.1 citation. §6.1 now cites ACC23 §6.5.12, p. 178, lines 7163–7187 (the three imaginary quadratic fields).

## Checks run

Dependency check (`tauceti-roadmap … gate --candidate …/design/README.md --only EllipticCurveModularityImaginaryQuadraticPartII …`):

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

- `roadmaps resolve` on the README gives the same three leads as before (LeHung26, OpenAI26 and CaptainSude26 read as roadmap names). They are source keys, not defects. No Lean name is unresolved.
- `plan.json` and `sources.toml` parse, and the plan's formatting is unchanged apart from the edited fields.
- There are no LaTeX delimiters or machine paths in the edited files.
- This is a design: there is no `Suggested.lean`, so there was no `#check @name` pass and no elaboration.
- No gate failures were listed for this round.

## Citations and ownership

Every new citation was checked against the cited roadmap now:
- FaltingsFinitenessAndIsogenyTheorems R28.6.2 ("Semisimplicity of the Tate module of an elliptic curve") and R28.6.3 ("The Tate Hom comparison for elliptic curves"), read at the head of its open pull request.
- The parent's §4.2 `cubic_character_elliptic` (`V_η ≅ H¹(A_t)` over `F`), read at the parent's head.

Both roadmaps are earlier in the merge order and already listed as suppliers in `plan.json`.

ACC23 §6.5.12 was read in the sources cache: the heading is at line 7059 and the construction of `E_a, E_b, E_c` is at lines 7163–7187, printed p. 178. Nothing was fetched and nothing is missing. This round introduces no new object, so no new ownership question arises; no declaration name changed.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §6.1 Check: impossible when `ρ(I_{v^c})` is infinite or of order divisible by 5 | order 5 (`ρ̄` protected at `v^c`); infinite unipotent; order 15 | order 5: every place `w ∣ v^c` with `ρ` unramified needs `5 ∣ e(w)`. Then `e(c'w) = e(w)`, the image of `I_{c'w}` in `ℤ₅(1)` lies in `5ℤ₅`, and `ρ̄(I) = ⟨U⁵⟩ = 1`. Infinite: `ρ(I_w)` has finite index in `ℤ₅`, so it is `≠ 1`. Order 15: `5 ∣ 15`, same as order 5 | true | text as stated |
| §6.1 Check: order-three witness | `ρ(I_{v^c})` of order 3, residue characteristic `ℓ ≠ 3` and `ℓ = 3` | `ℓ ≠ 3`: an `e = 3` tame extension has `I_L = 3·I^tame`, which is the kernel. `ℓ = 3`: take the fixed field of `ker ρ`, which has `e = 3`. Above `v`: index `3·ℤ₅ = ℤ₅` in `ℤ₅(1)`, so residual inertia is `⟨U³⟩ ≠ 1` | protection kept; the reviewer's witness holds | added |
| §6.1 Check: the route needs `v^c` unramified | `P ∪ P^c` completely split | `F'_w = F_{v^c}`; `ρ` ramified at `v^c` gives `w ∈ S'` (§5.4: unramified outside `S`) | true | added |
| §8.1, `ζ₅ ∈ K` branch | `K = ℚ(ζ₅)`; `K₆₀` | `ℚ(ζ₅)`: `F = ℚ(ζ₁₅ₚ)` is CM (Thm 1.1 with `S = {3p}`); `SL₂(𝔽₅)` is perfect of order 120, so its only subgroup of index `≤ 2` is itself, which is nonabelian, so `A_t` is non-CM. Then `End_{G_F}V = ℚ_ℓ` and `V` is absolutely irreducible. `K₆₀`: `ζ₅ ∉ K₆₀`, first branch | every step has a listed input | *Needs*, Dependencies, plan |
| §7.1(d) `q_A = s³λ(s)`, `λ(0) ≠ 0` | `y² = x³ − x` (`h(0) = 0`); `y² = x³ + x + 1` | `λ` is no longer tied to the cubic. `1/j = q + O(q²)`, so the order of `1/j` is 3, which equals the order of `q_A` (3). `c s³ h(s) = s³λ(s)` with `λ = c·h` | equivalent to the old content; clash gone | renamed |
| §7.1(c) `z₁z₂ = s²` | resolution of `A₁` | one exceptional curve; thickness `1 + 1 + 1 = 3` (second Check) | unchanged content | renamed |
| §7.1(b) `2(P₀ + rT') = c₀` | `r ∈ ℤ/3` | `2r ≡ const mod 3` has the unique solution `r = 2·const` | unchanged | renamed |
| §7.2 `v(Δ_min) = 3m_v`, `v(q_A) = 3v(s)` | `v(s) = m_v = 1, 5, 7` | `λ(s) ≡ λ(0)` is a unit, so `v(q_A) = 3, 15, 21`; residues mod 5 are `3, 0, 1` | protection lost exactly at `5 ∣ m_v`; first Check agrees | renamed |
| §7.3 `v(Δ_min) = v(q_A)` | `v(q_A) = 3, 15` | inertia `[[1, v(q_A)],[0,1]]`: `[[1,3],[0,1]]` (nontrivial), `[[1,0],[0,1]]` | Checks agree | renamed |
| §6.2 first Check with `γ = diag(1,2)` | `𝔽₂₅`, `μ² = 2` | `det(μγ) = 2·2 = 4 = −1`; `tr(μγ) = 3μ ∉ 𝔽₅` (2 is not a square mod 5); `(μγ)² = 2·diag(1,4) = diag(2,3)`, with determinant `6 = 1` | unchanged values | renamed |
| Conventions: basis `h` only in Layers 3–4 | grep of every `h` | basis `h`: Conventions and lines in §§3.1, 3.2, 3.4 (third Check), 3.5, 4.2. Cubic `h`: Conventions, the parent's supplier contract, §2.2, §7.1 | disjoint layers | clause added |
| Conventions: `O` in Layer 7 | grep of Layer 7 | `O` occurs only as `(O, 1)` (§7.1) and as the boundary point `O` (§7.2); no coefficient ring occurs in Layer 7 | true | clause added |
| §6.1 ACC23 locator | ACC23 cache | §6.5.12 begins at line 7059; `E_a, E_b, E_c` at 7163–7178; `E = E₀E_aE_bE_c` at 7179–7187, p. 178 | supported | citation added |

## For the maintainer

- Renamed symbols in Layer 7 (`m_v`, `q_A`, `λ`) are local notation, not declaration names. No name that another roadmap cites changed. No section was renumbered.
- No suspicious instructions were found in the review text.
