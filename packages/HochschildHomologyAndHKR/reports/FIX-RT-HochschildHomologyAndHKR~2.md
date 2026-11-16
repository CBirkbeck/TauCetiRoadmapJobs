# FIX-RT-HochschildHomologyAndHKR~2

Red-team round 2, passes a and b, at head 7fa7abc. Six findings. The two P2 findings are the same
defect and are settled once. Edits: `packages/HochschildHomologyAndHKR/README.md` (§§1.3, 1.4, 6.1,
6.4, 8.1 and the "From Mathlib" contract) and `packages/HochschildHomologyAndHKR/Suggested.lean`
(one `example` deleted). `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## RT-HochschildHomologyAndHKR~2a/F01, RT-HochschildHomologyAndHKR~2b/F01 (P2) — applied

Old: §6.4 named only the cycle property and `π^cl ∘ b = 0`. New: a three-step route for every
commutative `R`. The chain `Alt(r₀; …)` is a cycle; it is `0` when two `r_i` coincide; and the
boundary identity `b(W) = Alt(r₀a; c, …) − Alt(r₀; ac, …) + Alt(r₀c; a, …)` holds, with its
cancellation argument. Then the factorisation through `⋀[R]^n Ω[R⁄k]`. Two Checks added.

Evidence and choices:

- **The finding is right.** Being a cycle gives a class for each tuple `(r₁,…,r_n)`. To descend to
  `Ω^n` the class must also be a derivation in each `r_i` modulo boundaries. Neither listed fact
  gives that. RefinedTraceMethods §1.9, at its head, lists the step without proof and only for
  `k`-flat `A` or derived chains. §7.5, §8.4 and `homological_hkr_mvPolynomial` all consume (a).
- **The identity is true.** I proved it myself. Write `W` for the signed sum over the orderings
  `w` of `(a, c, r₂,…,r_n)` with `a` before `c`. Three things happen in `b(W)`:
  - Inner faces cancel in adjacent-swap pairs, except where `a` is directly followed by `c`.
    Those terms give `−Alt(r₀; ac, …)`. The sign is right because `sgn(w) = (−1)^{i−1} sgn(v)`
    when the block `ac` sits at position `i`.
  - First faces cancel against the last faces of cyclic shifts, which carry the factor
    `(−1)^{n+1}(−1)^n = −1`.
  - The terms left over are those with `w` beginning with `a` or ending with `c`. They give
    `Alt(r₀a; c, …)` and `(−1)^{n+1}(−1)^{n−1} Alt(r₀c; a, …) = Alt(r₀c; a, …)`.
- **Machine check.** A script on free commuting letters confirms the identity and the cycle
  property for `n = 1, …, 5` (`W` has 1, 3, 12, 60, 360 terms).
- **Route, not citation.** I give a direct cancellation argument instead of the shuffle-product
  derivation property that pass a proposes. The shuffle locator (Loday98 §4.2) is uncertified and
  unread, and the direct argument needs no new supplier or locator. The existing locators (Loday98
  §1.3, Ginz05 §9.2, AV20) stay.
- **Notation.** The antisymmetrised chain is written `Alt(…)`, not `A(…)` (pass a) or `E(…)`
  (pass b). In this README `A` is the algebra, and `E` is an extension (§3.6) or a matrix unit.
- **Proposed Checks not taken.** Pass a's claim that dropping the middle term "leaves
  `1 ⊗ a ⊗ bc − 1 ⊗ ac ⊗ b`" is incomplete. The script gives four extra terms:
  `r₀ ⊗ a ⊗ cr − r₀ ⊗ ar ⊗ c + r₀a ⊗ r ⊗ c − r₀c ⊗ a ⊗ r`. The new Check states only what holds:
  the basis tensor `1 ⊗ a ⊗ rc` survives in `k[a,c,r]`.
- **Pattern searched.** The same descent step appears in §3.4, which is the `n = 1` case: its
  boundary `b(1 ⊗ a ⊗ c)` is already stated, and the new Check names it. It also appears in §7.5
  ("Evaluation … flat or not"), §8.4, and the docstrings of `homological_hkr_mvPolynomial`. These
  all cite §6.4(a), which now carries the step, so no further edit is needed. `π^cl_n ∘ b = 0` was
  recomputed in general (the terms telescope to `(−1)^n T_{n+1} + (−1)^{n+1} T_{n+1}`).

## RT-HochschildHomologyAndHKR~2a/F02 (P3) — applied

Old: §1.3 and §1.4 had no **Checks**. New: three Checks each. For §1.3: the structure map
`k → B` (trace on `HH₀` of `Mat₂(k)`), a non-multiplicative `φ` breaking the chain map
(`1 ⊗ x²`), and the cochain map's image killing `ker φ`. For §1.4: the non-flat `ℤ[ε]/(ε², 2ε)`
for chains and for cochains, and a split sequence over `A = 𝔽₂`.

Recomputed:

- §1.3: `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²` has image `2x ⊗ x`.
- §1.3: `x∂_x` is a derivation of `k[x]/(x²)`, since `2x·x = 0`. The map `p ↦ p′ mod x²` is a
  derivation into `φ*N`, and it sends `x² ↦ 2x`.
- §1.4: `ℤ ⊗ A ≅ ℤ ⊕ ℤ/2`, and `1 ⊗ 2ε = 0`. Every `ℤ`-linear map `A → ℤ` kills `ε` because
  `2ε = 0`.
- §1.4: `𝔽₂ ⊗_ℤ 𝔽₂ = 𝔽₂` and `Hom_ℤ(𝔽₂, M) = M`.

I reworded the multiplicativity Check to say "with the identity on the coefficients `k[x]`". For a
non-multiplicative `φ`, `φ*N` is not a bimodule.

## RT-HochschildHomologyAndHKR~2b/F02 (P3) — applied

Old: "Gerstenhaber degree `n − 1`" (§6.1) and "Gerstenhaber degrees `≥ −1`" (§6.1 API). New:
"suspended degree `n − 1` (the degree of `Θf` for `f` of arity `n`)" and "suspended degrees `≥ −1`",
with the instance `x ∈ C⁰`, `Θx ∈ sA` of degree `−1`.

Evidence: DGAInfinity's README on main does not contain "Gerstenhaber degree". Its Layer 8 says
"Hochschild arity and internal degree". This README's own term is "suspended degrees": an
unsuspended map of arity `n` and internal degree `r` has degree `r + n − 1` (the
`hochschildDifferential` contract). Those were the only two occurrences.

## RT-HochschildHomologyAndHKR~2b/F03 (P3) — applied

Old: §8.1 asserted `R ⊗[k] R ≅ MvPolynomial (Fin m) R` without naming it. New: the route names
`MvPolynomial.algebraTensorAlgEquiv k R`, followed by the `R`-algebra automorphism
`aeval (X_i ↦ X_i + C(X_i))` with inverse `aeval (X_i ↦ X_i − C(X_i))` (`AlgEquiv.ofAlgHom`). The
three names are added to §8.1's *Needs:* and to "From Mathlib" (Regular sequences). The `m = 1`
Check is recomputed.

Pins read:

- `MvPolynomial.algebraTensorAlgEquiv` at `Mathlib/RingTheory/TensorProduct/MvPolynomial.lean:95`
  has type `A ⊗[R] MvPolynomial σ R ≃ₐ[A] MvPolynomial σ A`. Its `_tmul` lemma gives
  `a ⊗ p ↦ a • map (algebraMap R A) p`.
- `AlgEquiv.ofAlgHom` is at `Mathlib/Algebra/Algebra/Equiv.lean:487`.
- `MvPolynomial.aeval` is at `Mathlib/Algebra/MvPolynomial/Eval.lean:572`.

Recomputed:

- `m = 1`: `1 ⊗ X ↦ X ↦ X + C(X)` and `X ⊗ 1 ↦ C(X)`, so the target variable is
  `1 ⊗ X − X ⊗ 1 = −t`, and multiplication sends it to `0`.
- `m = 0`: the composite is `R ⊗ k ≅ R` and the kernel is `0`.

## RT-HochschildHomologyAndHKR~2b/F04 (P3) — applied

Old: `Suggested.lean` had an `example` saying `detCochain k R D r = (Matrix.of fun i j ↦ D j (r i)).det`,
proved by `simp [detCochain]; rfl`. New: deleted. The README keeps the convention and its witness
(Conventions, "Determinant pairing"; §7.5).

Evidence: the example only unfolds the body. Its "row `i`, column `j`" convention cannot be seen in
the value, because `det M = det Mᵀ`. For example, `D = (∂_x, ∂_y)` and `r = (xy, x)` give
`[[y, x], [1, 0]]` and its transpose, both with determinant `−x`. So the example excludes no
plausible wrong model.

The `cupProduct` example stays: it separates `f(first p)·g(last q)` from the reversed product on a
noncommutative `A`. No README text referred to the deleted example.

## Checks run

- **Elaboration.** `lake env lean packages/HochschildHomologyAndHKR/Suggested.lean`, run from the
  content checkout, gives 8 warnings "declaration uses `sorry`" (lines 129, 145, 164, 194, 224,
  238, 255, 275: the 8 theorems). No errors and no other messages. No `TauCeti.*` module needed
  building.
- **Signatures.** I elaborated `#check @name` for all 14 declarations (6 definitions, 8 theorems)
  in one scratch copy and compared each with its README statement. All binders are present and
  unchanged from the worker's signature file. There are no section variables, and nothing lost a
  binder. The only Lean change is the deleted `example`.
- **Dependency check:**

      depcheck: 252 roadmaps, 2397 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean
  names found nowhere: None."
- **Style.** No LaTeX delimiters, process words, pull-request numbers or machine paths in the
  edited text.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.4 `Alt` is a cycle | `n = 1`; `n = 2`; script `n ≤ 5` | `b(r₀ ⊗ r₁) = r₀r₁ − r₁r₀ = 0`; `n = 2`: six terms cancel in pairs; script: `b(Alt) = 0` | holds | stated |
| §6.4 `Alt = 0` for `r_i = r_j` | `n = 2`, `r₁ = r₂ = x`, char 2 | `r₀ ⊗ x ⊗ x − r₀ ⊗ x ⊗ x = 0` literally, so no division by 2 | holds | added |
| §6.4 boundary identity | `n = 1`; `n = 2` by hand; script `n = 1…5` | `n = 1`: `r₀a ⊗ c − r₀ ⊗ ac + cr₀ ⊗ a` (§3.4); `n = 2`: 12 terms, 6 cancel, 6 form the right side; script: difference `0` | holds | added |
| §6.4 identity over non-flat `R` | `k = ℤ`, `R = 𝔽₂[x,y]`, `a = c = x`, `r = y`, `r₀ = 1` | over `ℤ`: `b(W) = 2x⊗x⊗y − 2x⊗y⊗x − 1⊗x²⊗y + 1⊗y⊗x²`; mod 2: `1⊗x²⊗y + 1⊗y⊗x²` | `[1 ⊗ x² ⊗ y − 1 ⊗ y ⊗ x²] = 0`, matching `d(x²) = 0` | Check added |
| §6.4 every ordering needed | `k[a,c,r]`, middle ordering dropped | extra `b(1⊗a⊗r⊗c) = a⊗r⊗c − 1⊗ar⊗c + 1⊗a⊗rc − c⊗a⊗r` | the right side has no `1⊗a⊗rc` | Check added |
| §6.4 factoring through `⋀Ω` | `n = 0`; `n = 1`; alternation for `ω = dx + dy` | `ε^cl₀ = id`; `n = 1` gives §3.4's inverse `r dr′ ↦ [r ⊗ r′]`; `φ(dx,dy) + φ(dy,dx) = φ(d(x+y), d(x+y)) − φ(dx,dx) − φ(dy,dy) = 0` | holds | route stated |
| §6.4(b) `π^cl ∘ b = 0` | general `n`; `n = 1` | telescoping leaves `(−1)^n T_{n+1} + (−1)^{n+1} T_{n+1} = 0`; `r₀a dc − r₀ d(ac) + cr₀ da = 0` | holds | none |
| §1.3 Check, structure map | `B = N = Mat₂(k)` | `b(n ⊗ c) = nc − cn = 0`, so `HH₀(k,N) = N`; quotient by trace-zero matrices `≅ k` | holds | added |
| §1.3 Check, multiplicativity | `φ(x^j) = 0` for `j ≥ 2`, `k` nonzero | image `2x ⊗ x` against `2x ⊗ x − 1 ⊗ x²` | differ by `1 ⊗ x² ≠ 0` | added |
| §1.3 Check, cochain direction | `k[x] → k[x]/(x²)`; `2 = 0` against `2 ≠ 0` | `x∂_x(x²) = 2x² = 0`; `(x²)′ = 2x` | separates iff `2 ≠ 0` (Check says so) | added |
| §1.4 Check, chains | `A = ℤ[ε]/(ε², 2ε)` | `ℤ ⊗ A = ℤ ⊕ ℤ/2`; `2(1 ⊗ ε) = 0` | not injective | added |
| §1.4 Check, cochains | same | `g : A → ℤ` has `2g(ε) = 0`, so `g(ε) = 0` | no lift | added |
| §1.4 Check, split case | `A = 𝔽₂`, `n = 0, 1, 2` | `C_0 = M`, `C_n = M ⊗ 𝔽₂ = M`, `C^n = M` | exact | added |
| §6.1 suspended degree | arity `0, 1, 2` | degrees `−1, 0, 1` (`r + n − 1` with `r = 0`); `HH⁰ ↔ −1`, `Der ↔ 0`, `HH² ↔ 1` | consistent with the conventions | renamed |
| §8.1 change of variables | `m = 0`, `m = 1`, `k = 0` | `R ⊗ k ≅ R`, kernel `0`; `Y ↦ X`, `μ(Y) = 0`; all zero over `k = 0` | holds | stated |
| `detCochain` example | `D = (∂_x, ∂_y)`, `r = (xy, x)`; transposed convention | `det [[y,x],[1,0]] = −x = det [[y,1],[x,0]]` | separates no wrong model | deleted |

## Ownership

No new construction or target was added. The boundary identity is one step of the route of §6.4(a),
the classical antisymmetrisation for every commutative `R`, which this roadmap already owns (Scope,
Layer 6). RefinedTraceMethods §1.9, at its open head, states the derived and flat version and names
the same step without a proof. That is consistent with the Scope deferral and needs no change. I
searched the open heads and main for "derivation in each slot/argument" and the antisymmetrisation:
the only other match is that §1.9 passage.

## For the maintainer

- No Lean name changed or was removed. The deleted declaration was an anonymous `example`. No other
  roadmap cites this one.
- `sources.toml` is unchanged. No new locator was introduced, and pass a's offered Loday98 §4.2
  (uncertified, unread) is not used. `needs-references.toml` was not written.
- `design/plan.json` is unchanged: no supplier gap was added. The existing
  `gap:smooth-hkr-antisymmetrisation` is untouched.
- No suspicious instructions were found in the reviews.
