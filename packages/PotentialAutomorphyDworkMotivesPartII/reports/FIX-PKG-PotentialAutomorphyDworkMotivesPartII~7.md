# FIX-PKG-PotentialAutomorphyDworkMotivesPartII~7

The review being answered is `REV-PKG-PotentialAutomorphyDworkMotivesPartII~6`, which has five findings. All five were checked against the sources and the pins, and all five hold. Four are applied as the review asked. F02 is applied differently: it got a more precise wording, because the pins contain more than the review listed.

## F01 (P2) — applied

Old → new. §7.8 now opens "Let `a` be a zero-shaped datum, `F ⊇ ℚ(ζ_N)` a number field, `l ≡ 1 (mod N)` a prime, `λ | l` a prime of `O` …". §7.10(2) now opens "For Qian's datum or the self-dual datum, if `v(t) < 0`". §§4.5 and 4.6 now open "For Qian's datum (`n > 2`)". Negative-control Checks were added to §7.8 (`N = 7` datum: weights `{2, 2, 3}` against `{2, 3, 4}`) and to §7.10 (the `(1, 2, 2, 0, 0)` datum has monodromy operator `0`).

Verification:
- `a = (0, 0, 0, 1, 3, 5, 5)` has `B = {1, 3, 5}`. With `σ = id`, `a + 1, a + 3, a + 5` have `∑⟨·⟩ = 21, 21, 28`, so the grades are `2, 2, 3`. Against this, `M(1) = 21/7 − 1 = 2` predicts `{2, 3, 4}`.
- §8.1's Check (A'Campo, Proposition 2.5.7) gives two singleton blocks for `(1, 2, 2, 0, 0)`.

The same pattern was repaired in four other places:
- the Layer 4 introduction ("of a zero-shaped datum" becomes "of Qian's datum (`n > 2`) or of the self-dual datum", because the layer's targets prove nothing more);
- §4.7, scoped the same way, since it rests on §§4.2–4.5;
- §7.5, which now opens "For a zero-shaped datum" and introduces `F ⊇ ℚ(ζ_N)`, previously used without being introduced;
- §7.11, where the `W` system is now "for Qian's datum" and the untwisted `V^{ss}` system is "for the same datum". Its Hodge–Tate multisets `{M(a_τ), …}` were false for the `N = 7` datum.

The consumers were checked:
- In this roadmap, §§9.3 and 9.4 use §§7.8 and 7.10 with Qian's datum and the self-dual datum.
- PotentialAutomorphyInfrastructurePartII (§6.1 route) uses §§7.8 and 7.10 for the self-dual family only, so it is unaffected.

## F02 (P3) — applied differently

Old → new. Line 73 no longer says "the carrier itself has no geometric fibre functor and no monodromy action". It now names `TauCeti.FiniteEtaleScheme.fiber`, the instance `GaloisCategory (FiniteEtaleScheme S)` and `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso`, together with Mathlib's `CategoryTheory.PreGaloisCategory.functorToContAction`, and says that neither library has lisse sheaves. Line 85 now reads "the lisse-monodromy equivalence and path transport are that section's". The `Suggested.lean` docstring now reads "neither library has …".

It is applied differently because the pins hold more than the review listed:
- Mathlib has `AlgebraicGeometry.Scheme.EllAdicCohomology`, the absolute pro-étale cohomology of a single scheme (Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean).
- Tau Ceti has `TauCeti.fiberLocalSystem`, the fibre-homology local system of a Hurewicz fibration (AlgebraicTopology/Singular/Fibration/LocalSystem.lean).

The docstring therefore names both, and says why neither of them carries a family of schemes: neither library has an analytification functor. A file search of both libraries for lisse, constructible or locally constant étale sheaves found none.

## F03 (P3) — applied

Old → new:
- §0.1: "Beukers–Heckman, Theorem 3.5" → "Definition 2.9, p. 330".
- §0.3: "Definition 2.9 … for their order of the triple" → "Definition 3.1, equation (3.2), p. 330".
- `sources.toml`, `BH89` locator → "Definitions 2.9 and 3.1, Proposition 3.3, Theorem 3.5".

Verified: BH89 line 237 has Definition 2.9 (a reflection is `g` with `g − Id` of rank one). Lines 250–255 have Definition 3.1 and (3.2), `h∞h₁h₀ = Id`. Line 287 has Theorem 3.5 (Levelt). With Theorem 3.5's `h∞ = A`, `h₀ = B⁻¹`, `h₁ = A⁻¹B`, the product is `A·A⁻¹B·B⁻¹ = 1`. No other Beukers–Heckman locator needed a change (§0.4's Proposition 3.3, p. 331, is at line 280).

## F04 (P3) — applied

Old → new:
- §0.10: "(Qian, Proposition 3.7 …, citing Artin, Theorem 2; …)" → "(Artin, Theorem 2; Qian, Proposition 3.7 with proof, arXiv v1 p. 16, which takes the coincidences among the simple groups of type `A_n` from the classification; …)".
- `sources.toml`, `ARTIN55` `version_note` → "… for the same-rank comparison used in QIAN23 Proposition 3.7, which itself refers to the classification of finite simple groups".

Verified: QIAN23 line 754 cites "[Car72]", and line 1322 shows this is Carter. No other passage attributes Artin to Qian.

## F05 (P3) — applied

Old → new. §2.1's *Needs:* gains "§2.2 (Betti lattices)" and "EtaleDualityAndPerverseSheaves §4.3(c)". The proof sketch gains one paragraph. It says that `H^q(X_k̄, ℤ_ℓ)` is torsion-free (§4.3(c), `X` being a smooth hypersurface of dimension `N − 2 ≥ 1`), and that therefore `H^{N−2}(X_k̄, O_λ)` is free. It also says that `H^{N−2}(·, O_λ/λ^k) = H^{N−2}(·, O_λ)/λ^k`, because `H^{N−1}` has no torsion, and that the `e_a`-summand is free over the local ring `O_λ`.

Verified:
- EtaleDualityAndPerverseSheaves §4.3(c) is on main, under "Smooth complete intersections".
- §2.2 does not use §2.1, so no cycle arises.
- The layer's Dependencies line already lists §4.3(c).
- Test case, the Fermat cubic with `λ | 7`: `H¹ ≅ O_λ²` and `H² ≅ O_λ`, so the two eigensummands each have rank 1.

## Checks run

- **Elaboration.** `lake env lean packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean` from the content checkout: exit 0. The only warnings are `declaration uses 'sorry'`, at lines 97, 116, 136, 155 and 190. No Lean statement changed; only the module docstring did.
- **`#check`.** A scratch file ran `#check @name` on all 10 declarations and the three structure fields. The elaborated types are unchanged and match the README; no binder was lost.
- **Library names.** A second scratch file confirmed at the pins every library name the docstring and the README now cite: `AlgebraicGeometry.Scheme.EllAdicCohomology`, `CategoryTheory.PreGaloisCategory.functorToContAction`, `TauCeti.FiniteEtaleScheme.fiber`, `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso` and `TauCeti.fiberLocalSystem`.
- **Dependency check.** `gate --depcheck … --movable` exits 0:

```text
depcheck: 208 roadmaps, 1914 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures.** None were listed for this round.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §7.8, zero-shaped | self-dual `(1,0,0,0,4)`, `N = 5`, `l = 11`; Qian `N = 401`, `n = 3`; `N = 7` datum, `l = 29` | `M(1) = 10/5 − 1 = 1`, weights `{1, 2}` = grades; `∑⟨a_j + 1⟩ = 79799 = 401·199`, `M(1) = 198`, weights `{198, 199, 200}`; `21/7 − 1 = 2`, formula `{2, 3, 4}` (sum 9) against grades `{2, 2, 3}` (sum 7) | Hypothesis added; negative Check added |
| §7.8, `λ` of `O` | `l ≡ 1 (mod N)`, `N` odd | `l = 2` would need `N | 1`, so `l` is odd, `l ∤ 2N` and `λ ∈ Spec O`; `t = 0 ∈ 𝔪`, `t^N − 1 = −1` is a unit | Sound |
| §7.10(2) | self-dual `n = 2`; `(1,2,2,0,0)`, `N = 5`; `d = −v(t) = 1, 2` | single block for `n = 2` (Steinberg); blocks `1 + 1`, `N = 0`, minimal polynomial `X`; `(1 + ν)^d − 1 = dν(…)`, still of order `n` | Scoped; negative Check added |
| §§4.5–4.7, scoped | Qian `N = 401`, `n = 3`; `(1,2,2,0,0)` | `0 ∉ B = {1, 2, 398}`, so `(X − 1)³` is coprime to `∏(X − ζ^{−b})`; for `(1,2,2,0,0)` the eigenvalues at `γ∞` come from `{0, 2}`, not `(X − 1)²`, so the companion model fails there | Scoped |
| §7.5, zero-shaped | Qian `N = 401`; self-dual `N = 5`; the hypothesis `∏ρᵢ = 1` of §3.5 | weights `397` and `2`; for any zero-shaped datum `∑B = −∑_{b∉B} b = ∑(distinct values) = ∑a_j ≡ 0` (`N` odd, so all residues sum to 0; each nonzero value occurs once), e.g. `{2, 3}` → 5, `{1, 2, 398}` → 401 | Hypothesis explicit; the §3.5 hypothesis holds automatically |
| §7.11, Qian's datum | `N = 401`, `t = 0`; `N = 7` datum | HT `{198, 199, 200}` at `σ = id` (consecutive); the unscoped reading gives `{2, 2, 3} ≠ {2, 3, 4}` | Scoped |
| §2.1, integral clause | Fermat cubic `λ | 7`; `ℓ = 5` over `𝔽₂₅`; Enriques surface | ranks `2, 1`, eigensummands `1 + 1`; excluded (ℓ not invertible); `H¹(ℤ/2) = ℤ/2` while `H¹(ℤ_2)/2 = 0`, which is why §4.3(c) is named | Input added |
| Contract line 73 | identity cover of `Spec ℚ`; empty `S` | fibre is one point with trivial action; `ConnectedSpace` excludes the empty scheme (it is required by both the instance and `nonempty_fiber_iso`) | Sound |
| BH89 order | Theorem 3.5 generators | `A·(A⁻¹B)·B⁻¹ = 1`, i.e. (3.2) `h∞h₁h₀ = 1` | Sound |

## Maintainer notes

- No name cited by other roadmaps changed, and no section was renumbered. The consumer PotentialAutomorphyInfrastructurePartII uses §§7.8 and 7.10 for the self-dual family, which stays inside the new hypotheses.
- EtaleCohomologyFoundations §F.0.2 on main still plans the Galois category and geometric fibre functors on `TauCeti.FiniteEtaleScheme`, which the pinned Tau Ceti already provides (FiniteEtale/Fiber.lean, FiniteEtale/Galois/Category.lean). That is for that roadmap's maintainers. This roadmap now takes the cover side from the pins and only the lisse equivalence and path transport from §F.0.2.
- No source was fetched and `needs-references.toml` was not created. Ownership: no new object was introduced, so there was nothing new to check against open pull requests.
- No fetched or reviewed text contained instructions.
