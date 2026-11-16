# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~17

Findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~16` (two findings, both P3). Files edited: `packages/QuasicoherentSheavesOnPrestacks/design/README.md` and `design/plan.json`. `sources.toml` is unchanged because no new source is cited. The review's section for the human reviewers (the licence of SAG and HA) lists no finding, and nothing was changed because of it.

## F01 (P3) — applied

Verified. In `PreStk_CRing` the coproduct of prestacks `P = ⨿_ℕ Spec ℤ` has `P(R) = ℕ` for every R. Over the point `(0, 1)` of `P × P` at ℤ, the fibre of the diagonal has value `{n : n = 0 and n = 1} = ∅` at every ring, the zero ring included. An affine has a point at the zero ring (2.1's Check), so the old Check was false for the prestack coproduct. It is true for `h_X`, X the scheme, which is the object 8.1's Check uses.

8.2 Check, old → new: "`⨿_ℕ Spec ℤ` has affine diagonal …" → "For the scheme `X = ⨿_ℕ Spec ℤ`, in the classical context, `h_X` has affine diagonal … fibre … `Spec(Re)` … The coproduct of prestacks … same `QCoh`, `∏_ℕ D∞(ℤ)` (2.3, 3.3), and does not have affine diagonal …". I made the same change to plan 8.2, test `non_qc`.

Departures from the review's repair text:
- I added "in the classical context", since `h_X` is defined only there (2.5).
- I cited 2.3 next to 3.3, because 2.3 computes `QCoh(P)` directly.
- I added the reason the empty fibre is not affine (2.1's Check).

Pattern search: I checked every other `⨿_ℕ` and every "coproduct of countably many" in the README and the plan. These are the Conventions witness, 3.4, 5.3, 8.1, and plan 3.4, 5.3 and 8.1. Each claims only a value of `QCoh`, and that value is the same for P and for `h_X`. No other passage says a coproduct of prestacks has affine diagonal. The 7.1 Check on `BΓ` already treats the prestack coproduct `Spec R ⊔ Spec R` correctly.

## F02 (P3) — applied

Verified. The witness `K(ℤ, 2) × Spec ℚ` holds:
- `QCoh = lim_K Mod_ℚ = Fun(K(ℤ, 2), Mod_ℚ)`, by 2.3, the constant prestack being the colimit over K of the final prestack.
- The heart is `Fun(K, Vect_ℚ) ≃ Vect_ℚ`, because K is simply connected. It is semisimple.
- Yet `π₀ Map(O, O[2]) = H²(ℂP^∞; ℚ) = ℚ`, while `Ext²` in the heart is 0.

So the step "semisimple heart ⇒ t-exact invariants" needs 7.4(d). That applies to `[Spec k/GL_n]`, which is quasi-compact with affine diagonal (X = Spec k is affine).

Changes, old → new:
- 8.4 route: "… sum of irreducible finite-dimensional ones, and the derived invariants are t-exact" → semisimple heart, all objects injective, `Ext^i = 0`; 7.4(d) gives `π₀ Map(O, M[i]) = Ext^i(O, M)`; `q_*` keeps the heart in the heart; t-exactness spelled out (left: right adjoint of the flat `q^*`; right: induction, then left completeness with no `lim¹`). The duplicate Layer 1 citation later in the route now reads "as above".
- 8.4 Checks: added the `K(ℤ, 2) × Spec ℚ` Check.
- 8.4 *Needs*: "7.4 (7.4(a) and the affine diagonal)" → "…; the hearts of 7.4(b) and 7.4(c); the comparison 7.4(d), for the exactness of invariants".
- plan 8.4: updated API `BGLn` and added test `semisimple_heart_not_enough`. The prerequisites already contained `target:7.4`.

Pattern repair: the 8.4 Check on `B(ℤ/p)` over ℚ had the same gap ("by Maschke's theorem invariants are exact"). It now names its comparison: by Maschke `Hⁱ(ℤ/p; V) = 0` for `i > 0`, and these groups are `π₀ Map(O, V[i])` by 8.5's group-cohomology formula. That formula comes from 2.2's mapping-space formula and EnhancedDerivedSheaves E5:presentability.3, and uses no hypothesis on the characteristic. I updated plan test `BZp_Q` to match. No other "invariants are exact", "semisimple" or "completely reducible" step occurs in the README; the remaining "t-exact" hits concern extension of scalars, which is a different claim.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 8.2 Check: `h_X` has affine diagonal, X the scheme `⨿_ℕ Spec ℤ` | `R = ℤ × ℤ`, `f = (0, 1)`, `g = (0, 0)`; `R = ℤ`, `f = 0`, `g = 1`; `R = 0` | e = (1, 0), `Re = ℤ × 0 ≅ ℤ`; e = 0, `Re = 0`, fibre `Spec 0` with one point at the zero ring; f = g = empty function, e = 1 = 0, `Re = 0` | affine in each case | applied |
| 8.2 Check: prestack coproduct P has no affine diagonal | indices (0, 1) at ℤ; same in the animated and `E∞` contexts | fibre value ∅ at every ring, including 0; `P(R) = ℕ` in every context, so the same holds there | not affine | applied |
| 8.2 Check: `QCoh(P) = QCoh(h_X)` | `P → h_X` at R = 0 and at `ℤ × ℤ` | ℕ → point (not injective); n ↦ (n, n) in ℕ² (not surjective); hypersheafification fixes both through the empty cover of 0 and the cover by the two factors; both sides `∏_ℕ D∞(ℤ)` | holds | cited 2.3, 3.3 |
| 8.2 Check: `h_X` not perfect | `O = (ℤ, ℤ, …)`, `O_i` | `⊕_i O_i = O`; `Hom(O, ⊕_i O_i) = ∏ ℤ ≠ ⊕ ℤ = ⊕_i Hom(O, O_i)`; each `O_i` is compact and the `O_i` generate | compactly generated, not perfect | — |
| 8.4 route: semisimple heart gives `Ext^i = 0`, then 7.4(d) | n = 1, k = ℚ; n = 0 | heart = graded ℚ-vector spaces, all injective; direct check `Map(O, M) = Ω^∞ M_0`, so `π₀ Map(O, M[i]) = π_{−i} M_0 = 0` for M discrete and i > 0, which agrees with 7.4(d); `GL_0 = 1`, `BGL_0 = Spec k`, heart `Vect_k` | consistent | applied |
| 8.4 route: `q_*` is t-exact | M = `⊕_{j≥0} ℚ[j]` in weight 0 on `BG_m`; fibre `RΓ(π_m M)[m]` | `τ_{≤m} M = ⊕_{j≤m} ℚ[j]`; `π₀ RΓ = ℚ` constant for m ≥ 0; the fibre has homotopy only in degree m, so `π₀` and `π_{−1}` are unchanged for m ≥ 1; `lim¹` of a constant tower is 0, so the limit is connective | holds | applied |
| 8.4 route: `q^*` is t-exact | k a field, A a k-algebra | `(q^*N)(A) = A ⊗_k N`, A flat over k | holds | stated |
| 8.4 route: characteristic hypothesis | `GL_2` over `𝔽_p` | Sym^p of the standard representation is not semisimple, so `Ext¹ ≠ 0` in the heart; 7.4(d) still holds (7.4 Check: `Ext^i = 𝔽_p` for ℤ/p over `𝔽_p`) | characteristic zero is needed only for semisimplicity | — |
| new 8.4 Check: `K(ℤ, 2) × Spec ℚ` | K = K(ℤ, 2) = ℂP^∞ | heart `Vect_ℚ`, `Ext²(O, O) = 0`; `π₀ Map(O, O[2]) = H²(ℂP^∞; ℚ) = ℚ` | negative control holds | added |
| 8.4 Check: `B(ℤ/p)` over ℚ | V = ℚ trivial; V = ℚ[ℤ/p]; same group over `𝔽_p` | `H¹ = Hom(ℤ/p, ℚ) = 0`; `H^{2j} = ℚ/Nℚ = ℚ/pℚ = 0`, odd degrees `ker N/(g − 1) = 0`; the coinduced V has `Hⁱ = 0` for i > 0; over `𝔽_p`, `Hⁱ = 𝔽_p` for all i (8.5) | consistent with 8.5's Check "over ℚ … `Hⁱ = 0`" | applied |
| 8.4 *Needs*: 7.4(b), (c), (d) used | the route text | 7.4(b) for L in the heart; 7.4(c) for comodules; 7.4(d) for `Ext` | all now listed | applied |

## Checks

Dependency gate (command of the brief), output:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2254 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Other checks:
- **Lean:** the design has no `Suggested.lean`, so there was nothing to elaborate or `#check`.
- **Citations:** the new text cites only ReductiveGroups Layers 1 and 6, which were already cited. I re-read both on main (Layer 1 at README line 1275; Layer 6 at line 2448, with complete reducibility at line 2477). All other references in the new text are internal: 2.1, 2.3, 3.3, 7.4(b)–(d) and 8.5.
- **Sources:** no new locator; GR-I and SAG for 7.4(d) are unchanged.
- **Ownership:** the repair adds no construction, so no ownership check was needed. Ownership against open pull requests outside the tools' index was not checked.
- **Style:** the README has no LaTeX delimiters. The new text has no process words.
- **Plan:** `plan.json` still parses, and its diff is limited to the four entries named above.

## For the maintainer

No name or id that other roadmaps cite changed. No section was renumbered and no gap was added or removed.
