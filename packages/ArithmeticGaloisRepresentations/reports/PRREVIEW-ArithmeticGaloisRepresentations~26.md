# Review of ArithmeticGaloisRepresentations (pull request #856 at 00e8930)

**Verdict:** accepted

This is an incremental re-review of the 12 changed lines since `36e5aac`. Only `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` changed, in §7.8 **Pieri and Clebsch–Gordan** (`README.md:5155–5164`). Nothing outside the folder changed, and `Suggested.lean` is byte-identical to the previous head.

The previous report's only finding is repaired. The repair is mathematically correct and introduces no new problem. The gate passes. No finding remains.

## Previous findings

- R01 — repaired: "*Needs:* … §7.4 **Symmetric powers of a symplectic plane** (for `n ≥ 2`, applied to `h(u, w) = det(u | w)` in a basis of `V` … the perfect pairing `B_{n−1}` on `Sym^{n−1}V` with multiplier `det^{n−1}`, whence the duality)" (`README.md:5161–5163`). The prose at `:5155–5157` now names §7.4 and treats `n = 1` separately.

## Verified sound

**Gate, dependency check, diff and elaboration.**
- The prescribed gate on this head prints `gate ArithmeticGaloisRepresentations: set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run (`scratch/gate.md`) adds `build=0`.
- The dependency check prints `depcheck: 239 roadmaps, 2371 edges, 0 problem(s)` (exit 0). There is no UPWARD, CYCLE or `moved:` line. This roadmap is on line 56 of the merge order.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat 36e5aac HEAD` shows only `README.md` (8 insertions, 4 deletions).
- `lake env lean Suggested.lean` exits 0. Its output is exactly 20 lines, each a `declaration uses 'sorry'` warning.
- `#check @name` for all 33 declarations, appended to a scratch copy: 33 elaborated types, 0 errors. They are unchanged from the previous head and match their README statements.
  - The `signatures.md` lead on `isEnormous_symPower` is again a false positive. The theorem binds its own `(n : ℕ)` (elaborated: `∀ {k : Type} [Field k] [Finite k] (n : ℕ) (H : Subgroup (GL (Fin n) k)) …`), which shadows the section's `n : Type`.
- Padding probe: in a scratch copy, every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | trivial | decide`. That gives 20 errors at the 20 tactic sites (lines 74, 85, 97, 146, 175, 207, 240, 253, 268, 287, 309, 325, 340, 367, 429, 440, 449, 458, 478, 497). None closes in one tactic.

**The changed passage, checked step by step.**
- *§7.4's hypotheses follow from the route's.*
  - For `n ≥ 2`, `2 ≤ 2n − 2` and `n − 1 ≤ 2n − 2`, so `2` and `(n − 1)!` both divide `(2n − 2)!`. Hence `(2n − 2)! ∈ k^×` gives §7.4's `2, d! ∈ F^×` at `d = n − 1`.
  - The claim is one-directional, and needs to be only that. For example, `n = 4`, `p = 5`: `3! = 6 ≡ 1` is a unit, so the duality holds, but `6! ≡ 0`, so Clebsch–Gordan is not claimed.
- *`n = 1` needs its own case.* `(2n − 2)! = 0! = 1` does not make `2` invertible, so §7.4 does not apply in characteristic 2. Directly, `End(Sym⁰V) = 1` and `⊕_{i<1} Sym⁰V ⊗ det⁰ = 1`, as stated.
- *The specialisation of §7.4.* `h(gu, gw) = det(g·(u|w)) = det g · h(u, w)`, so every `g ∈ GL(V)` has multiplier `det g`, and `h(e₁, e₂) = 1` is perfect and alternating. §7.4 (`README.md:4790–4793`) then gives `B_{n−1}` perfect and covariant with multiplier `det^{n−1}`. That yields `Sym^{n−1}V ≅ (Sym^{n−1}V)^∨ ⊗ det^{n−1}`, the stated duality.
- *The assembled formula.* `End S = S^∨ ⊗ S ≅ S ⊗ S ⊗ det^{1−n}`. Clebsch–Gordan with `a = b = n − 1` gives `⊕_{i≤n−1} det^{i+1−n} ⊗ Sym^{2n−2−2i}`. Setting `j = n − 1 − i` gives `⊕_{j<n} Sym^{2j} ⊗ det^{−j}`, the stated formula.
- *Build order.* §7.4 is earlier than §7.8 in Layer 7, and §7.4's target has no *Needs:* on §7.8, so there is no cycle. §1.2 (`README.md:880`) and §7.1 (`:4454`, `∧^n ρ ≅ Dρ`) exist as cited. The edge is intra-layer, so Layer 7's Dependencies need no change.

**Pinned declaration opened.** `TauCeti.nonempty_linearEquiv_of_prod_linearEquiv_of_isFiniteLength`, Tau Ceti `RingTheory/KrullSchmidt/Cancellation.lean:172`: `IsFiniteLength A P → Nonempty ((M × P) ≃ₗ[A] (N × P)) → Nonempty (M ≃ₗ[A] N)`. This is as described in the *Needs:* line.

**Source locator in the changed paragraph.** "CHT, proof of Lemma 2.5.2, p. 56" checks out against `clozel-harris-taylor-2008` lines 2681–2695 (page 56 marker at line 2681; lemma at line 2687, for primes `l > 2n − 1`). The proof's first line gives `ad Sym^{n−1} ≅ 1 ⊕ Sym² ⊕ … ⊕ Sym^{2n−2}` as an `SL₂(F_l)`-module, as the README says.

**Seeded sample.** None of the sampled targets (1.4, 1.9, 1.11, 2.2, 3.1, 3.3, 3.6, 4.3, 4.7, 5.5, 5.6, 5.11, 5.13, 6.6, 7.7) lies in or is cited by the changed passage. The README flags no locator as unverified.

**Ownership and overlaps.** The change adds citations only, and no new object. `scratch/overlaps.md` lists no open pull request that changes this folder, no dropped id, and no id defined only by an open revision. `scratch/citations.md` has no lead in the changed passage.

**Adversarial table, changed statements.** The `B_d` rows come from a scratch script. It builds the Gram matrix of §7.4's `B_d` from `h = det(u|w)` on the monomial basis, then tests `Sym^d(g)ᵀ G Sym^d(g) = det(g)^d G` for 50 random `g ∈ GL₂(F_p)`.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| §7.4 applied with `h = det(u\|w)`: `B_{n−1}` perfect, multiplier `det^{n−1}` | `(d, p) = (1,3), (2,5), (2,3), (3,7), (4,7), (5,7), (3,11)`: `det G ≠ 0`; covariance with `det^d` holds for all 50 samples each. `B_d(v_i, v_{d−i}) = (−1)^i/binom(d,i)` and symmetry `(−1)^d` hold. `d = 2`, `p = 5`: `B₂(x²,y²) = 1`, `B₂(xy,xy) = 2 = −1/2` | Holds |
| Multiplier of `h = det(u\|w)` | `g = diag(2,1)` over `F₅`: `h(gx, gy) = 2 = det g`. `g = (1 1; 0 1)`: `h(x, x + y) = 1 = det g` | Holds |
| Duality `(Sym^{n−1}V)^∨ ≅ Sym^{n−1}V ⊗ det^{1−n}` | Eigenvalues `α, β`: the left side has `α^{−(n−1−i)}β^{−i}`; the right side has `α^{n−1−i}β^i(αβ)^{1−n} = α^{−i}β^{−(n−1−i)}`, the same multiset. `n = 4` over `F₃` fails (§7.1 Check) and is excluded, since `6! ≡ 0` | Holds |
| "`2, (n−1)! ∈ k^×` follow from `(2n−2)! ∈ k^×`" | `n = 2`: `2! = 2`. `n = 3`, `p = 5`: `4! = 24 ≡ 4`. `n = 4`, `p = 7`: `6! = 720 ≡ 6`, `3! ≡ 6`. `p = 2`, `n ≥ 2`: `(2n−2)!` is even, so excluded | Holds |
| `n = 1` case | `(2n−2)! = 1`; `End(Sym⁰V)` has dimension 1, as does `Sym⁰ ⊗ det⁰`. In characteristic 2 §7.4 is inapplicable, so the separate clause is needed | Holds |
| `End(Sym^{n−1}V) ≅ ⊕_{i<n} Sym^{2i}V ⊗ det^{−i}` (assembled) | `n = 2`, `p = 3`: `4 = 1 + 3`. `n = 3`, `p = 5`: `9 = 1 + 3 + 5`. `n = 4`, `p = 7`: `16 = 1 + 3 + 5 + 7` | Holds |

**Adversarial table, untouched statements.** Each row is carried from the previous report (`36e5aac`) and the report before it (`a67c355`), where the values were computed. `Suggested.lean` is unchanged.

| Statement | Values (previous reports) | Result |
| --- | --- | --- |
| Contract: `rank_two_simple'`, `rank_two_simple` | `F₂`, `F₃` have no `a`; `F₄`: `a = ω`; `Nat.card ℚ = 0` | Holds |
| Contract and §3.2: `ramificationGroup_antitone` | `ℚ₂(i)`: `\|G_{−1}\| = \|G_0\| = \|G_1\| = 2`, `\|G_2\| = 1` | Holds |
| Contract: cancellation needs finite length | `ℤ × ℤ^(ℕ) ≅ 0 × ℤ^(ℕ)`, but `ℤ ≇ 0` | Holds |
| §2.6 Krull–Schmidt for WD representations | `1 ⊕ 1`; `Sp(2) ⊕ 1`, string lengths `{2, 1}` | Holds |
| §3.2 finite-level conductors | `ℚ₂(i)`: `d = 2 = v₂(−4)`, Artin sum `2`, Swan sum `1`; `ℚ₃(√3)`: `d = 1` | Holds |
| §7.4 balance | `n = 3`: `H⁰(ad⁰)` of dimension `4`; `ℓ = 3` unbalanced, excluded | Holds |
| §7.6 Goursat for `PGL₂` | Graph of complex conjugation; `PGL₂(ℝ)` sign subgroup; `F̄₂` | Holds |
| §7.8 Pieri, cancellation step | `a = b = 2`, characteristic 5: `9 = 5 + 3 + 1`; `12 = 12` | Holds |
| §7.8 **Modulo `p`**, §7.11 | `F₄`: `α², β²`; `10 = 6 + 4`, `6 = 1 + 1 + 4`, `16 = 10 + 6` | Holds |
| §1.8 `iso_of_charpoly_eq` | Amitsur in rank 2, `det(g+h) = 1` on both sides | Holds |
| §1.11 quotients over an excellent DVR | `ℤ_(p)`; `G_m` weights `±1`; `SL₂`; `C₂` on `ℤ₂[x]` | Holds |
| §5.3 `iso_of_frobenius_charpoly_eq` | Dense `ℕ ⊂ ℤ_p`; `ℤ/3` over `F₄` | Holds |
| `baire_descent`, `exists_integral_conj_GL`, `isAbsolutelyIrreducible_of_isOddAt`, `dickson_projectiveImage` | `n = 0`; `(1 a; 0 1)` under `diag(ℓ,1)`; `F₂` excluded; `PGL₂(F₃) ≅ S₄` | Hold |
| `imageAlgebra_isCentralSimple`, `realizable_iff_imageAlgebra_split`, `realizable_of_charpoly_mem` | `Q₈` over `ℝ` (`ℍ`); `ℤ/3` over `F₂` | Hold |
| `conj_into_of_trace_mem_of_distinct_eigenvalues`, `carayol_conj_of_trace_eq`, `compact_matrix_frattini_isOpen` | `1 ⊕ sgn`; `1 ⊕ 1` excluded; `Φ(1+ℓℤ_ℓ) = 1+ℓ²ℤ_ℓ` | Hold |
| `multiplicative_residual_unramified_iff`, `lowerSwanConductor_le` | `11a1` at `p = 5, 3`; `ℚ₂(√2)`: `2 ≤ 2`; `χ₈`: `2 ≤ 3` | Hold |
| `isAdequate_of_coprime_or_large`, `isAdequate_tensor`, `isEnormous_*`, `exists_linear_lift` | `SL₂(F₇)`; `diag(1,2,3)` over `F₅`; `ℤ/4 → ℤ/2` | Hold |
| §§1.2, 2.4, 2.7, 3.5–3.7, 4.5, 5.4, 5.6, 5.11, 6.1, 6.4, 6.4a, 7.6, 7.10 | `Δ(11a1) = −11⁵`; `ε₂ = −i·4^{1/2−s}`; `#E(F₅) = 6` | Hold |

## Not verifiable

- No item in the changed passage. The locators listed as not verifiable in the previous reports were not re-read; they lie in untouched text. They are GHTT, Theorem 9; NT26, Lemma 2.2; Tate 1979, (4.1.5); and Serre, *Local Fields*, which the manifest records as uncertified.

## Source issues

- none
