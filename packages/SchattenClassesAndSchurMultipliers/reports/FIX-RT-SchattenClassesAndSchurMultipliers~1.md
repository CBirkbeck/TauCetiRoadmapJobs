# FIX-RT-SchattenClassesAndSchurMultipliers~1

Two red-team reviews were resolved: `RT-SchattenClassesAndSchurMultipliers~1a` (F01, F02) and
`RT-SchattenClassesAndSchurMultipliers~1b` (F01–F06). The findings do not overlap, so each is
settled in its own section. All eight findings were verified and applied. Neither review's "For the
human reviewers" section (licence notes on preprint numbering and on uncertified works) raises a
finding, and nothing was changed because of it. Neither review contained text asking for anything
outside this job.

## RT-SchattenClassesAndSchurMultipliers~1a/F01 (P3) — applied

Verified: caspers-delasalle-2015 lines 485–486 and 626 assume `φ ∈ M_cbA(G)` (defined at lines
26–33; continuity is used at line 483), and Theorem 5.2 (line 543) is for `1 < p < ∞`. cgpt-2023
lines 71–72 state (FS) with no hypothesis on `m`.

Change: §9.5 now states the sources' hypotheses and credits the `L^∞`, `[0, ∞]`, `p ∈ {1, ∞}`
generality to the route (§9.3; mollification with §3.3). New Check: `m = sign`, `p = 2`, both sides
`1`. The docstring of `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` adds "for symbols in
`M_cbA(ℝⁿ)`, extended to `L^∞` symbols in README §9.5".

Same pattern elsewhere: §9.3 cited Theorem 5.2 (`1 < p < ∞`) for statements at every `p`. A
sentence now says that Theorem 5.1 covers `1 ≤ p ≤ ∞` (line 530) and that the endpoints of the
third bullet come from the duality route. §9.4 already recorded the restriction of Lemma 4.1.

## RT-SchattenClassesAndSchurMultipliers~1a/F02 (P3) — applied

Verified on main: `TauCetiRoadmap/NoncommutativeIntegration/README.md` §4.4 is stated "for Layer
11's product state or weight" on a probability space and needs its §3.4, §3.5 and §4.3, so it
works with Haagerup spaces. Its §3.5 is what identifies the tracial `Lᵖ(M, τ)` with the Haagerup
`Lᵖ(M)`.

Change: new contract bullet §3.5. The §4.4 bullet says it is about Haagerup spaces and, read
through §3.5 and §1.5, gives the tracial norm for `∫ ⊗ Tr`. §10.3: "(NoncommutativeIntegration
§4.4)" → "(… §4.4, read tracially through its §1.5 and §3.5)". The §10.3/§10.4 *Needs*, the Layer 10
Dependencies and Scope gain §1.5, §3.5.

## RT-SchattenClassesAndSchurMultipliers~1b/F01 (P2) — applied

Verified: through `K = ℂ`, `⟨ξ_j, η_k⟩ = conj(ξ_j) η_k` has rank ≤ 1, while `[[1, 2], [2, 1]]` has
determinant `−3`. So the infimum is `∞` there but `2` through `ℂ²` (§6.2, first Check). The
embedding argument only gives the inequality "≥ ‖M‖_H" for a fixed `K`.

Change: §6.2, first bullet: "any separable `K`" → the infimum over all separable `K`, or through
one fixed infinite-dimensional `K`; a fixed `d`-dimensional `K` admits only sums of `d` elementary
symbols. New Check: `[[1,2],[2,1]]` through `ℂ`, `ℂ²`, `ℓ²(ℕ)`. The Summary and source gloss are
reworded the same way; constant-symbol Check: `K = ℂ` → `ξ = η = e₀`.

## RT-SchattenClassesAndSchurMultipliers~1b/F02 (P2) — applied

Verified on main: NoncommutativeIntegration §4.4 is "For a probability space (Ω,P)", and its §1.5
identifies only `L^∞(Ω, μ)` (the case `k = 1`) and `B(H)`. Lebesgue measure on `ℝⁿ` with `k ≥ 2` is
covered by neither. A search of main and of the open heads (`roadmaps grep` for the object) found
no other owner. This roadmap therefore owns the target.

Change: new §9.2 target "the tracial picture of `Lᵖ(ℝⁿ; S_p^k)`": `τ_k = ∫ Tr` on
`𝓡_k = L^∞(ℝⁿ; F_k)` is a normal faithful semifinite trace, `𝓡_k` carries the ess sup, and
`Lᵖ(𝓡_k, τ_k) = Lᵖ(ℝⁿ; S_p^k)`. Route, cgpt-2023 lines 249–252, three Checks. §9.3: "(…§1.5 at
`k = 1`)" → "(§9.2)". §9.2 *Needs*, contract §1.3, Scope and Layer 9 Dependencies updated.

## RT-SchattenClassesAndSchurMultipliers~1b/F03 (P3) — applied

Verified: lafforgue-delasalle-2011 lines 489–490 require equal measure per atom of `𝒜`. §7.3
cuts a minimal set `A` into pieces of measure `μ(A)/n`, a value that depends on `A`.

Change: §7.2: "all of the same measure" → "that all have one measure, a value which may depend
on `A`"; route: "(equal masses)" → "(equal masses inside each minimal set of `𝒜`)". The worked
example became a Checks list with masses `(1,1,3,3)` (holds, four permutations) and `(1,2,3,3)`
(fails; weights `(1,2,2,4)/9` against `1/4`).

## RT-SchattenClassesAndSchurMultipliers~1b/F04 (P3) — applied

Verified: §9.3 defines `Λ_F(g)` by its kernel (§2.1), uses the trace formula (§2.2) for
`Tr(Λ_F(g) Λ_F(h))`, and proves the intertwining by comparing kernels (§2.1, §3.1).

Change: the *Needs* of §9.3 go from "§1.1, §1.4, §3.5, §4.1, §9.1" to "§1.1, §1.4, §2.1 (…),
§2.2 (…), §3.1, §3.5, §4.1, §9.1, §9.2". The Layer 9 Dependencies gain "2 (§2.1, §2.2)". "How to
read the build" now says "Layer 9 needs Layers 1, 2 (§2.1, §2.2), 3, 4 and 8". The merge order is
unchanged.

## RT-SchattenClassesAndSchurMultipliers~1b/F05 (P3) — applied

Verified: §2.4 had no Checks block. All three proposed Checks were recomputed:
- `P(E₁₁) = 1/2`, with kernel constant `1/4`, and `P(ι(a)) = a`;
- `C_φ E₁₂ C_φ* = E₃₁` for the cycle, against `E₂₃` with `φ⁻¹`;
- for `ν = δ₀ ≪ δ₀ + δ₁`, `U*U = 1` and `UU* = E₀₀`.

Change: a **Checks.** block with these three bullets was added before the *Needs* line of §2.4. The
third also records that `A ↦ UAU*` lands in the corner `E₀₀ S_p E₀₀`.

## RT-SchattenClassesAndSchurMultipliers~1b/F06 (P3) — applied

Verified: line 17 of `Suggested.lean` began with "theorem is defined here:".

Change: the paragraph now reads "…so that no operator is defined here whose construction is itself
a theorem: …". It was reflowed so that no docstring line starts with a declaration keyword (checked
with `grep`). The statement is unchanged.

## Checks run

**Elaboration.** `lake env lean packages/SchattenClassesAndSchurMultipliers/Suggested.lean`, run
from the content checkout, gave 11 warnings "declaration uses `sorry`" (lines 97, 107, 120, 130,
143, 165, 177, 196, 207, 248, 277) and no errors. No `TauCeti.*` object file was missing.

**Signatures.** A scratch copy of the file with `#check @name` for all 19 declarations (8 `def`, 11
`theorem`) was elaborated once. Every elaborated type is the same as before, because only two
docstrings changed. Each still carries its binders explicitly:
- `schattenGauge` keeps both `CompleteSpace` instances and `Fact (1 ≤ p)`;
- every Schur theorem has `[SigmaFinite μ]` and `MemLp M ∞ (μ.prod μ)`;
- the continuous-symbol theorems keep `LocallyCompactSpace`, `T2Space`, `BorelSpace`,
  `IsFiniteMeasureOnCompacts` and `InnerRegularCompactLTTop`.

No README statement needed a change of binders.

**Dependency check** (command of the brief):

    depcheck: 239 roadmaps, 2258 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The only supplier sections newly cited are
NoncommutativeIntegration §1.3 (already cited) and §3.5, and NoncommutativeIntegration is on main.

**Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name
missing.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §6.2, infimum over fixed `K` | `K = ℂ`, `[[1,2],[2,1]]`; `K = ℂ²`; `K = ℓ²(ℕ)`; `1_{i=j}` on `ℕ`, fixed finite `K`; `μ = 0`, `K = ℂ` | det `−3`, rank ≤ 1, so `∞` against `2`; `2`; `2`; no finite-rank factorisation, so `∞` against `1`; `0 = 0` | the old text is false for finite-dimensional `K`; the new text holds | bullet, Check, Summary |
| §6.2, constant-symbol Check | `1` on `ℕ`, `ξ = η = e₀` | `‖e₀‖² = 1`, value `1` | true | wording |
| §7.2, hypothesis | masses `(1,1,3,3)`; `(1,2,3,3)`; `𝒜 = 𝓑`; `𝒜` trivial on `{1,2}` | holds (values `1`, `3`); fails, weights `(1,2,2,4)/9` against `1/4`; holds, `E = id`; holds | the per-set reading is the one §7.3 needs | wording, two Checks |
| §2.4, `P`, `ι` | `{1,2}`, `𝒜` trivial, `B = E₁₁`, `B = ι(a)` | `P(E₁₁) = 1/2`, kernel `c = 1/4 =` mean of `1_{(1,1)}`; `P(ι(a)) = (a/2)·4/2 = a` | agrees with `k_{P(B)} = condExpL2 k_B` | Check |
| §2.4, `C_φ` | cycle `1→2→3→1`; the `φ⁻¹` model | `C_φδ₁ = δ₃`, `C_φδ₂ = δ₁`, `E₃₁`; `E₂₃` | direction pinned | Check |
| §2.4, `U` | `ν = δ₀`, `μ = δ₀ + δ₁` | `h = 1_{{0}}`, `U*U = 1`, `UU* = E₀₀`; `μ ≪ ν` fails (`μ{1} = 1`, `ν{1} = 0`) | isometry, not unitary, as stated | Check |
| §9.2, tracial picture | `1_{[0,2]}E₁₁`; `1_{[0,1]}[[1,1],[0,0]]`; `1_{[0,1]}I_k`; `1_{[0,∞)}E₁₁`; `k = 1`; `n = 0` | `2^{1/p}` both sides, `1` at `∞`; `√2` both sides, entrywise `2^{1/p}` and `1`; `k^{1/p}`, normalised trace gives `1`; `∞ = ∞`; NoncommutativeIntegration §1.5; `M_k` with `Tr`, `S_p^k` | true; three Checks discriminate the entrywise, normalised and probability-space models | new target |
| §9.2, norm of `𝓡_k` | `g = 1_{[0,1]}a`, test vector `1_{[0,1]}e₁` | `‖g 1_{[0,1]}e₁‖ = ‖a e₁‖ = 1 ≤ √2`; with `v = (1,1)/√2`, `‖av‖ = √2` | ess sup of the operator norm `= √2` | route |
| §9.3, endpoints of the third bullet | `p = ∞`, `h ∈ L¹ ∩ L^∞`, `‖h‖₁ ≤ 1`; `p = 1`, `‖h‖_∞ ≤ 1` | `|∫ tr(gh)| ≤ liminf ‖Λ(g)‖_∞ ‖h‖₁`; `≤ liminf |Q_R|^{−1} ‖Λ(g)‖₁` | covered by the route, not by Theorem 5.2 | sentence |
| §9.5, scope | `m = sign`, `n = 1`, `p = 2`; `n = 0`, `m = 2i` | `‖M_m‖_∞ = 1 = ‖m‖_∞`; `2 = 2` | true outside `M_cbA(ℝ)` | sentence, Check, docstring |
| §10.3, tracial norm | `B = E` rank-one projection, `p = 4`, Haar probability on `𝕋ⁿ` | `(∫ ‖W E W*‖₄⁴ ds)^{1/4} = 1 = ‖E‖₄` | each identification now has an owner (§4.4, §3.5, §1.5) | citations |
| NoncommutativeIntegration §4.4 contract | `𝕋ⁿ` (probability); `ℝⁿ` (infinite) | applies; does not apply | the `ℝⁿ` case is the new §9.2 target | contract text |
| `Suggested.lean` docstrings | 19 `#check` types | identical to the previous signatures | no type change | docstrings only |

## Ownership and sources

- The new §9.2 target is stated here. `roadmaps grep` for the object found it nowhere else, on main
  or at the open heads. The searches covered the von Neumann tensor product `L^∞(ℝⁿ) ⊗̄ M_k`,
  `Lp(ℝⁿ; S_p)`, matrix-valued `Lᵖ` and the Bochner identification. The only nearby statements are
  NoncommutativeIntegration §4.4 (probability spaces) and §1.5 (`k = 1`), on main. Scope and
  ownership records the split.
- No new source was needed. The new locators are:
  - cgpt-2023 lines 249–252, already recorded for §9.2 in `sources.toml`;
  - caspers-delasalle-2015 lines 26–33, 483, 530 and 543;
  - lafforgue-delasalle-2011 lines 489–490.

  `sources.toml` and `needs-references.toml` are unchanged.
- `design/plan.json` and `metadata.toml` are unchanged, since no supplier gap was added.

## For the maintainer

- No section was renumbered and no Lean name was added, removed or renamed. Other roadmaps citing
  this one are unaffected.
- NoncommutativeIntegration on main is now consumed at §3.5 as well. That section was already
  upstream, so no dependency direction changed.
