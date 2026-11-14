# FIX-RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2

Repair of red-team round 2, passes a and b, on `packages/PadicDifferentialEquationsAndRigidCohomologyPartII`. Each of the six findings was checked against the cached sources (TSU, OHK, KED04), the parent PadicDifferentialEquationsAndRigidCohomology at the head of its open pull request (read with `roadmaps show`), and the README's own statements. All six hold. Four are applied as asked. Two are applied differently: 2b/F02 and 2b/F03. None is disputed and none is marked not actionable. The findings do not overlap, so each has its own section.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2a/F01 (P2) — applied

MS.0.1: "it equals `∂_(x_α)` only when `x = x_α`" → "exactly when `dx/dx_α = 1`, in particular when `x = x_α`". New Check: on `A¹` at the origin, the coordinates `x′ = x + p` and `x_α = x` have `dx′/dx_α = 1` and equal derivations, although `x′ ≠ x_α`. No other "only when" or converse claim on coordinates occurs. The API bullet and MS.0.8 state sufficient conditions only.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2a/F02 (P2) — applied

In the MS.0.7 route, "the unique upper-triangular solution `X`" → "the unique block upper-unitriangular solution `X` (every diagonal block the identity)", now cited to Tsuzuki's proof of Theorem 3.10, pp. 14–15 (TSU lines 784–803 have identity diagonal blocks). New Check with `A = diag(1, q)`: `I` and `2I` both solve the equation, and the normalised solution is `I` alone because `φ(u) = q·u` forces `u = 0`. MS.0.6 already normalises its diagonal blocks.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2b/F01 (P2) — applied

The Layer MS.6 introduction now reads "MS.6.1–MS.6.4 work on a smooth separated `k`-scheme `X` of finite type". It says why: smoothness is the hypothesis of §RD.3.37, the convergent realisation (parent: "(`X` smooth)"), and of §RD.5.8, full faithfulness (KED04 line 40). A new "Corrections to the sources" entry covers Tsuzuki §6.3 and Corollary 6.9. KED04 gains locator Theorem 1.1. The pattern was searched: MS.6.6 and MS.6.8 use no realisation or full faithfulness on a non-smooth scheme.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2b/F02 (P2) — applied differently

The `gap:coefficient-linear-weil-ii` text, identical in the README and in `plan.json`, now names `X` (separated, of finite type over `𝔽_q`), `K`, `L`, an isomorphism `ι`, and `w`. It adds the hypothesis that `E` is `ι`-realizable for the `L`-linear Frobenius, as §RD.6.85(a) requires. I kept the mixed form, the exact coefficient-linear analogue, instead of the reviewer's narrower pure-of-weight-`w` form. The pure case is a closing clause that uses `E ⊕ (E^∨ ⊗_L L_c)`. The MS.6.10 route now shows that its two objects are `ι`-real, and a new Check computes a realizability witness.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2b/F03 (P3) — applied differently

In MS.1.7, "Ohkubo, Definition 9.3, p. 41" → "Ohkubo, Definition 4.9, p. 23" (OHK lines 1168–1171: a `φ`-module over a complete field, `c ∈ F^×`). Definition 9.3 is not dropped. It is now cited in the proof route, together with Proposition-Definition 9.2 and Proposition 9.4 (p. 41), where the eigenvector over `R̃^bd` is actually used (OHK line 2180). The reviewer's reason for keeping 9.3, through the gap's Lemma 2.14, does not hold: that gap cites no Definition 9.3. In `sources.toml`, OHK gains Definition 4.9, Proposition-Definition 9.2 and Proposition 9.4.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2b/F04 (P3) — applied

MS.3.8 now states and proves the general affine image theorem. For any morphism `M → P` into a convergent F-isocrystal on a smooth affine `U` with lifts, the image and kernel of `Γ(U, M†) → Γ(U, P)` are overconvergent. The proof is the same with `Γ(U, P)` in place of the top. Two Checks are added: a projection onto `O(0)`, and a rank-2 image inside a rank-1 `P`. MS.4.4, MS.5.7 (now citing MS.3.8 instead of "by Dwork–Berthelot") and MS.6.2 name it in their routes and Needs. Layer MS.5's dependency line gains MS.3.

## Checks

- **Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout, exits 0 with no output (about 10 s).
- **`Suggested.lean`.** It is unchanged. It has 0 declarations, so the mechanical `#check @name` comparison has zero cases and there are no binders to compare. No finding changes a headline named in the module docstring: the generality of MS.6.1–MS.6.4 and the image theorem of MS.3.8 are not named there. The file still has a single `import Mathlib`, no `set_option` and no sorried data.
- **Dependency check:**

  ```
  depcheck: 240 roadmaps, 2169 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.
- **Gap agreement.** For all nine gap slugs, the README line `What <supplier> must provide (gap:<slug>): <needs>` equals the `plan.json` `gaps` entry character for character. Only the `coefficient-linear-weil-ii` entry changed in `plan.json`.
- **Contract against Needs.** Recomputed over every `*Needs:*` paragraph. No Needs id is missing from the contract. The contract ids that appear in no Needs line are exactly the seven of the "extended by requests" row (§§RD.0.34, RD.2.25, RD.2.26, RD.3.48, RD.6.61, RD.6.77, RD.6.85), as before. Every MS id cited in a Needs line exists.
- **Style.** New lines are at most 106 characters, except the one-line gap text, which keeps the file's format for gap lines. There are no LaTeX delimiters, process words or machine paths.
- **Sources.** No new source is needed. In `sources.toml`, the KED04 locator becomes "Theorem 1.1; Proposition 4.1" with a new `cited_for` entry, and OHK gains three locators. Every locator was read in the cached text: KED04 lines 37–45 (p. 2); OHK lines 1168–1171 (p. 23) and 2141–2155 (p. 41); TSU lines 784–803 (pp. 14–15), 1456–1505 (pp. 28–29) and 1297–1298 (Corollary 5.5, p. 25). No `needs-references.toml` entry was needed.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| MS.0.1 derivation criterion | `x′ = x + p`, `x_α = x` at `0`; `x = y⁻¹` at `∞`; `x = x_α` | `dx′/dx_α = 1`, `∂_(x′) = ∂_(x_α)`; `dx/dy = −y⁻²`, factor `−y²`, `∂_x(y⁻¹) = 1`; factor 1 | holds; "only when" refuted by the first, so replaced |
| MS.0.7 normalised splitting | `A = diag(1, q)`; `X = diag(a, b)`; `X = [[1, u], [0, 1]]`; `p = 2` | `I`, `2I` solve; diagonal solutions need `φ(a) = a`, `φ(b) = b`; `φ(u) = qu` with `|φ(u)| = |u| > |qu|` gives `u = 0`, also for `p = 2` (`|q| < 1`) | unique once normalised |
| MS.6.1–MS.6.4 on smooth `X` | `X = A¹_(𝔽_p)` (third Check of MS.6.1); witness curves; MS.6.5–MS.6.14 consumers | all smooth; §RD.3.37 frames with `X` smooth; §RD.5.8 for `X` smooth (KED04 line 40) | no consumer loses a case |
| Weil II request, realizability | `E` a line on `Spec 𝔽_q`, `ι(a) = 2i`; `E ⊕ (E^∨ ⊗ L_c)` with `ι(c) = 4`; `L = K` | `q^w = 4`; `1 − 2i·t` is not real; eigenvalues `2i`, `−2i`, polynomial `1 + 4t²`; at `L = K` the request is §RD.6.85(a) | hypothesis needed, and the pure case meets it |
| Weil II request, use in MS.6.10 | `M†^∨ ⊗ M†` on `U`; `N† = M†` the unit on `A¹`; `H²_c(A¹)` | eigenvalues `a/b`, `b/a`, `|ι(a/b)| = 1`, conjugate pairs, so `ι`-real; weight `≤ j < 2d` off the top degree; `H²_c(A¹, 1)` has eigenvalue `q`, weight `2 = 0 + 2` | holds |
| MS.6.10 purity step | `N†^∨ ⊗ M†` pure of weight `w0` | fixing `b`, every `|ι(a)|` is equal, so `M` is pointwise pure and `M^∨ ⊗ M` has weight 0 at every point | holds |
| MS.1.7 locator | OHK Def 4.9 against Def 9.3; `f_2` of the logarithmic module | 4.9: `c ∈ F^×`, slope `log|c|/log|q^d|`; `d = 1`: `c = q`, slope 1; `d = 2`: `c = q²`, slope `2/2 = 1` | Check values unchanged |
| MS.3.8 general form | `A²`, `O(−1) ⊕ O(0)` → `O(0)`; same → `Top = O(−1)`; Legendre `L†|_U` → `Top(L|_U)`; `P = 0`; `M† = 0` | image `A†e_2`, Frobenius 1, kernel `A†e_1`; image `A†e_1`, Frobenius `q`, kernel `A†e_2`; injective, image rank 2 > 1; image 0, kernel `M†`; image 0 | holds; the image is a quotient of `M†`, not a subobject of `P` |
| MS.3.8 Frobenius step for general `P` | `L† ⊆ Γ(P)`; `φ` flat; `A† ⊗_φ Â ≅ Â` | `A† ⊗_φ L† ↪ A† ⊗_φ Γ(P) = Â ⊗_φ Γ(P) ≅ Γ(P)` through `Φ_P`; surjective onto `L†` as the image of `Φ_(M†)` | linearisation invertible |
| MS.5.7 kernel step | ordinary rank-two `M†`, `N` the unit-root line | kernel of `Γ(M†^∨) → Γ(N^∨)`: an overconvergent subobject of the irreducible `M†^∨`, not everything because the map is nonzero, hence 0; image rank 2, `rank Top(M^∨) = rank N = 1` | holds |
| MS.4.4 sum map | `M† = N† = O(−1) ⊕ O(0)`, `h = id` | the sum map `G_i ⊕ G_i → Top(G_i)` has source top of rank 2, target rank 1, so it is not the canonical map to the source's top; image = `G_i`, recovered isomorphism `id` | holds with the general form |

## Ownership, suppliers and notes for the maintainer

- **Ownership.** `roadmaps grep` for the affine image theorem and for an image of dagger sections in a convergent module finds no match on main or in any open roadmap pull request. In the parent, §RD.5.8a descends idempotents and states no image theorem. MS.3.8 therefore owns the general form. The parent has no coefficient-linear Weil II (no `L`-linear form, no Abe–Caro), so the gap stays.
- **Supplier gap changed.** `coefficient-linear-weil-ii` now has stated hypotheses, including `L`-linear realizability. The parent PadicDifferentialEquationsAndRigidCohomology should be told that the request is the exact coefficient-linear form of its §RD.6.85(a). No gap slug was added or removed.
- **No renamed ids.** No target id was renamed, removed or renumbered. The only change in generality is that MS.6.1–MS.6.4 now require `X` smooth, and every consumer, here or in the README's downstream list, uses smooth `X`.
- **Untrusted text.** Neither review contained instructions beyond its findings. Their "For the human reviewers" sections (scope, licence, the corrections list) were read and changed nothing.
