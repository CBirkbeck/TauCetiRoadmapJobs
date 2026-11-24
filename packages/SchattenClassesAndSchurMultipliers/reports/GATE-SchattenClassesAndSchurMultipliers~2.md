# GATE-SchattenClassesAndSchurMultipliers~2: answers to the human review

One comment (kim-em, 2026-11-24T04:13:40Z), a follow-up at head `7a68d30`, recommending approval.
Its acknowledgements of items 1–3 and 6 ask for nothing and are not numbered. Three points are
numbered in the order they appear: the request to adopt three declarations at the next pin bump
(inside items 4 and 5), then the two "small points". Line numbers below are those of
`TauCetiRoadmap/SchattenClassesAndSchurMultipliers/README.md` at the new commit `5e643e98`.
`Suggested.lean` is unchanged.

## H01 (kim-em) — answered

No edit: the pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d` (the content repository's
`lake-manifest.json`), and a grep of both pinned trees finds no `cbNorm`, no `transposeₗ` and no
`integralOperatorLp`. The README cites library declarations only at the pins, so `LinearMap.cbNorm`,
`CStarMatrix.cbNorm_transposeₗ` and `TauCeti.integralOperatorLp` can be cited only once the pins
include them. When that happens, the revision that moves the pins is the place to cite them in the
`p = ∞` comparisons of §1.5, §3.6 and §4.3, which are now stated against CStarAlgebras C3.2, and
in §2.1 and its "From Tau Ceti" contract.

## H02 (kim-em) — applied

§2.1's existence argument uses the density of finite-rank operators in `S₂`, which only §1.1
proves: OperatorIdeals has no density item, and the pinned Tau Ceti has no density lemma for its
Schatten carriers. Line 430 now reads "dense in `S₂` (§1.1)", and the *Needs:* line (476) now
begins "§1.1 (the class `S₂` and the density of finite-rank operators in it)". "How to read the
build" (line 83) was "except that §2.3 and §2.4 use §1.1 and §1.4" and is now "except that §2.1
and §2.3 use §1.1, and §2.3 and §2.4 use §1.4". The new wording matches the *Needs:* lines of
§2.1–§2.5 and Layer 2's Dependencies, "Layer 1 (§1.1, §1.4)". A search of every "dense" in the
README turned up one more route with the same omission: §5.2 tests the pairing formula on
finite-rank operators with `𝓑_α ⊗ 𝓑_α`-measurable kernels, whose density in `S_p` starts from
§1.1. Its route (line 1050) now cites §1.1, its *Needs:* line (1063) lists §1.1, and so do
Layer 5's Dependencies (line 1097) and "How to read the build" (line 87, "Layer 5 needs §1.1 and
Layers 2 and 3"). Every other route that uses this density already lists §1.1: §1.2–§1.5, §2.3,
§3.3, §4.2, §8.2 and §9.3.

## H03 (kim-em) — applied

The definition of `‖S_M‖_{cb,p}` needs only §3.1 and §3.3 on `Ω × Fin m`, and through them §1.1,
§1.4, §2.1 and §2.2, as "How to read the build" says. §3.5 now says so in one sentence after the
definition (lines 806–809), naming what the statements below add: the identification
`L²(Ω × Fin m) = L²(Ω)^m`, multiplicativity (§3.2) and the finite case (§3.4). The *Needs:* line
(843) was "§1.4, §2.4, §3.1, §3.2, §3.3, §3.4; …" and now lists what each item needs. §3.1 and §3.3
cover the definition, the value at `p = 2` and null sets; §1.4 with VonNeumannAlgebras
V2.RectangularL2 covers the amplification and monotonicity in `m`; §3.2 covers multiplicativity;
§3.4 with `Matrix.kroneckerMap` covers finite index sets. §2.4 is dropped: no statement or Check of
§3.5 uses a change of measure, a measure-preserving isomorphism or a sub-σ-algebra. "Layer 3 needs
§2.1–§2.4" stays true through §3.7, whose *Needs:* line lists §2.4.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1: finite-rank operators are dense in `S₂` (§1.1) | zero space; `ℓ²(ℕ)`, `A = diag(1/(j+1))`, compressions `P_d A P_d`; identity of `ℓ²(ℕ)` | zero space: `S₂ = 0`, trivially dense. `‖A − P_d A P_d‖₂² = Σ_{j≥d} (j+1)^{−2}`, which is `π²/6 − 1 ≈ 0.645` at `d = 1` and `→ 0`. Identity: `‖1‖₂ = ∞`, so it is not in `S₂` and no counterexample | holds | locator and *Needs:* §1.1 added |
| How to read: Layer 2 uses §1.1 in §2.1 and §2.3, and §1.4 in §2.3 and §2.4 | the *Needs:* line of each section of Layer 2 | §2.1 {§1.1}; §2.2 {§2.1}; §2.3 {§1.1, §1.4, §2.1, §2.2}; §2.4 {§1.4, §2.1, §2.2}; §2.5 {§2.4}. Layer-1 sections used: {§1.1, §1.4}, as Layer 2's Dependencies say | holds | sentence rewritten |
| §3.5: the definition needs only §3.1, §3.3, hence §1.1, §1.4, §2.1, §2.2 | `m = 1`; `μ = 0`; σ-finiteness of `μ ⊗ count` on `Ω × Fin m`; transitive closure | `m = 1`: `Ω × Fin 1 ≅ Ω` and `‖S_{M_1}‖_p = ‖S_M‖_p`. `μ = 0`: every level is the zero space, so the norm is `0`, as the Check says. Count on `Fin m` has mass `m < ∞`, so the product is σ-finite. Closure: §3.3 → {§1.1, §1.4, §3.1}, §3.1 → {§2.1, §2.2}, union {§1.1, §1.4, §2.1, §2.2} | holds | sentence added |
| §3.5 *Needs:* without §2.4 | each bullet and Check of §3.5 | identification: §1.4 + V2.RectangularL2; monotonicity: §1.4; `p = 2`: §3.1; multiplicativity: §3.2, §3.1, §1.4; null sets: §3.3; finite case: §3.4. Check `[[1, 2], [2, 1]] = (3/2)J − (1/2)vvᵀ` with `v = (1, −1)`: diagonal `3/2 − 1/2 = 1`, off-diagonal `3/2 + 1/2 = 2`; it uses §3.1 and §1.4. Nothing uses §2.4 | holds | §2.4 dropped; items labelled |
| §5.2: measurable-kernel finite-rank operators are dense in `S_p(L²(𝓑))` because finite-rank operators are (§1.1) | dyadic filtration of `[0, 1]`, `u = 1_{[0,1/3)}`, `u₁ = E[u | 𝓑₁]`; `p = ∞` (and so `p' = 1`) | `u₁ = (2/3)·1_{[0,1/2)}`, `‖u − u₁‖₂² = (1/3)(1/9) + (1/6)(4/9) = 1/9`, `→ 0` along the filtration. `‖u⊗v* − u_n⊗v*‖_p ≤ ‖u − u_n‖₂ ‖v‖₂` (`‖·‖_p ≤ ‖·‖₁`, §1.1). At `p = ∞`, `S_∞` is the compact operators, where finite rank is dense; at `p' = 1` likewise | holds | locator, *Needs:*, Dependencies and How to read add §1.1 |
| How to read: Layer 5 needs §1.1 and Layers 2, 3 | union of Layer 5 *Needs:* lines | {§1.1, §2.2, §2.4, §2.5, §3.3, §3.5, §3.6, §3.7, §3.8, §5.1}; Layer-1 part {§1.1} | holds | sentence changed |

The other dependency claims of "How to read the build" were checked against the *Needs:* lines
and need no change: Layer 3's "§2.1–§2.4, not §2.5", "§1.2 only through §3.8", "§1.5 only
through §3.6", and the sentences for Layers 4 and 6–11.

## Lean, ownership, sources

- `Suggested.lean` is not changed (the diff touches only `README.md`), so the elaborated signatures
  in the job's `signatures.md` stand; no new `#check @name` file was needed. `schurCbNorm`'s
  docstring cites README §3.5 only for the definition, which is unchanged.
- No construction is added, so ownership against main and the open pull requests does not arise.
  The repair only corrects which sections of this roadmap each route uses.
- No source was fetched or cited anew; `needs-references.toml` is not written.
- The comment contains no instruction beyond its review points; nothing suspicious.

## Build and gate

`lake build TauCetiRoadmap.SchattenClassesAndSchurMultipliers.Suggested`:
`Build completed successfully (18354 jobs).` with 11 `declaration uses 'sorry'` warnings (the 11
headline theorems).

Gate (after the commit `5e643e98`):

    gate SchattenClassesAndSchurMultipliers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable --pr 2421`):

    depcheck: 131 roadmaps, 1464 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.
