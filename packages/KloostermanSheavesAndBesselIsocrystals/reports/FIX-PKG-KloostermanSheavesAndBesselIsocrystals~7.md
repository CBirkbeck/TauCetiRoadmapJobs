# Repair report: KloostermanSheavesAndBesselIsocrystals, round 7

Review settled: `REV-PKG-KloostermanSheavesAndBesselIsocrystals~6` (five findings: F01–F05). The review
has no `## For the human reviewers` section. Its "Source issues" list names no finding and changed nothing.

## F01 (P1) — applied

Verified. In the triangle of XZ line 2068, `C = i_+ i^!(j_{!+}M)[2]`. For `PGL₂`, `j_{!+}M = L[2]` on a
rationally smooth threefold with `Z` of codimension 2, so `C = L_Z` in holonomic degree 1 and
`ℋ¹(τ_+(M)[1]) ≅ L_Z ≠ 0`. The rest of the PGL₂ computation is in the table below. XZ's argument needs `τ`
affine (XZ line 2070), and `τ` is not affine.

Changes:

- §3.3: the claim "`τ_+(M)[1]` lies in the heart" is replaced by two statements. (i) The image of
  `H^*_c(U_s,M_s) → H^*(U_s,M_s)` is `H^*(Y_s,j_{!+}M_s)`, in degree 0, of dimension `dim W`. (ii) The cone
  `C` lies in degrees `≥ 0` (Corollary 2.6.2(i), p. 19). `Kl_W[1] ↪ ℋ⁰(τ_+(M)[1])` with cokernel `ℋ⁰(C)`,
  `ℋ^k(τ_+M[1]) ≅ ℋ^k(C)` for `k ≥ 1`, and `ℋ⁰(τ_!M[1]) ↠ Kl_W[1]`.
- The route now says that (ii) replaces the whole of Lemma 4.2.6(i), and that §3.4 uses only the
  degree-zero map (XZ (4.2.7.1)).
- Checks: the second Check's last sentence is replaced, with the `PGL₂` ranks 3 and 1 derived from (ii).
  The third Check now ends with the image computation. A new Check: `τ` is never affine, and
  `ℋ^{d−1}(τ_+(M)[1]) ≠ 0` with `d − 1 ≥ 1`.
- §3.1: the specialization map is a morphism of derived direct images, applied on each `ℋ^k`. In the
  non-affine case only `ℋ⁰` of the `[1]`-shifted images is used.

Consumer updated: the §3.4 route now uses the `ℋ⁰` map and the §RD.4.59 square, and §RD.4.59 is added to
its *Needs*. The *Needs* line of §3.3 gains §1.6.

## F02 (P3) — applied

Verified: XZ line 1174 defines `F^{!+} = f^!g^+F` on the attractor (line 1154) and `F^{+!} = f′^+g′^!F`, and
line 1177 gives `ι_F : F^{+!} → F^{!+}`. The §1.2 statement "map from attracting `!`-restriction to
repelling `+`-restriction" now reads "`e₋^+ a₋^! F → e₊^! a₊^+ F`, from the repelling side to the attracting
side". The hypotheses quasi-projective, geometrically connected and normal (XZ line 1152) are now stated.
New letters avoid a clash with the graph `g` of the same paragraph. The Check's repelling side was described
as "cohomology of the `y`-axis with supports in the origin". It now reads "stalk at the origin of the
`!`-restriction to the `y`-axis". The values are unchanged.

## F03 (P3) — applied

Verified: GlobalShtukasAndFunctionFieldLanglandsPartII (at its open head, README line 95) cites KB.2
*invariant-parameter*, *oper-slice*, *quantized-hitchin*, *zhu-identification* and KB.3
*tensor-comparison*. The plan's node titles match §§2.2, 2.3, 2.5, 2.7 and 3.5. Added five rows to the
former-numbering table. All 15 labels that roadmap cites now resolve (KB.0 ×2, KB.1 ×4, KB.2 ×4, KB.3,
KB.4 ×2, KB.6, KB.11).

## F04 (P3) — applied

`[DecidableEq F]` is deleted from `orthogonalSum_sub_card_eq_convolution`. The file elaborates without it
(exit 0, the same five `sorry` warnings). `#check` shows an unchanged conclusion. The README never stated
the binder. No other headline has an unused instance binder: the `Algebra (ZMod p)` binders feed
`traceChar`.

## F05 (P3) — applied differently

The two pages are corrected: §11.3 now cites "Theorem 1.2.4(ii), p. 5, and Theorem 5.4.2(ii), p. 62"
(XZ lines 222 and 245; 2915 and 2932), and §4.2 cites "§2.9.3, p. 24" (XZ lines 1105 and 1128).
Proposition 2.9.4 is not added: §4.2 does not use its nearby-cycle description.

I searched the README for the same slip (a script mapping XZ items to pages, with each hit checked by hand).
Three more were fixed:

- §7.3: §2.9.2, (2.9.2.2), pp. 23–24 → p. 24 (XZ lines 1114 and 1123).
- §6.3 Check: "Lemma 4.5.5, p. 53" → "proof of Lemma 4.5.5, p. 53". The statement is at line 2425 on p. 52,
  and the cited indexing is at line 2440 on p. 53.
- §6.6: Corollary 4.5.7 and Remark 4.5.8, p. 54 → pp. 53–54. Part (i), which §6.6 states, is at line 2479
  on p. 53.

## Checks run

- `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`, run from the content
  checkout: exit 0. The only output is five `declaration uses 'sorry'` warnings, at lines 66, 133, 145, 156
  and 169. No `TauCeti.*` import, so nothing was built.
- Signatures: I put `#check @name` for all 11 declarations in one scratch file and elaborated it once. All
  11 printed. I compared each with its README statement. The only change from the previous signatures is
  that `orthogonalSum_sub_card_eq_convolution` no longer has `[DecidableEq F]`. No binder is lost.
- Dependency check, complete output:

```
depcheck: 208 roadmaps, 1908 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` gave one lead: "KloostermanMomentsAndPotentialAutomorphy §2.6 found nowhere". It is a
  false positive. The roadmap is the board package at merge order 310, and its §2.6 "The Bessel connection
  dictionary" is at line 747 of its README.
- Sources: no new work is cited and `sources.toml` is unchanged. Every locator is against the cached XZ
  text. No `needs-references.toml` entry.
- Ownership: no new object is introduced. (i) and (ii) of §3.3 are statements about this roadmap's own
  family. I re-read §RD.4.59 of PadicDifferentialEquationsAndRigidCohomology at its open head (the
  commutative square `ι_rig = ρ_M ∘ ι_dR ∘ ρ_{c,M}`) before citing it in §3.4.

## Adversarial pass (changed statements)

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §3.3 (ii), cone | `PGL₂`, `d = 2` | `j_{!+}M = L[2]`, `i^!L = L_Z[−4]`, so `C = L_Z[0]`, holonomic degree 1; `ℋ⁰(C) = 0`, `ℋ¹(C)` rank 1 | holds |
| §3.3 (ii), `τ_+` | `PGL₂` | `ℋ⁰(τ_+M[1]) = Kl_W[1]` rank `3 + 0`; `ℋ¹` rank 1; `ℋ^{<0} = 0` | matches fibres `h⁰ = 3`, `h¹ = 1` |
| §3.3 (ii), dual | `PGL₂` | `i^+(L[2]) = L_Z[2]`, holonomic degree −1; `ℋ⁻¹(τ_!M[1])` rank 1, `ℋ⁰(τ_!M[1]) ≅ Kl_W[1]` rank 3 | matches `h⁻¹_c = 1`, `h⁰_c = 3` |
| §3.3 (ii), image | `PGL₂` | `ℋ⁰(τ_!) ↠ Kl_W[1] ↪ ℋ⁰(τ_+)`, image rank 3 | holds |
| §3.3 (ii), control | minuscule `W` (`Z = ∅`) | `C = 0`, `τ_+(M)[1] = Kl_W[1]`; `SL₂` standard: rank 2 in degree 0 | agrees with §3.2 |
| §3.3 (i) | `PGL₂` | `H_c`: `(h⁻¹, h⁰) = (1, 3)`; `H`: `(h⁰, h¹) = (3, 1)`; image: degree 0, dim 3; `H⁻¹_c → H⁻¹ = 0`, `H¹_c = 0 → H¹` | dim `W` = 3 |
| §3.3 Check, `ℋ^{d−1} ≠ 0` | general quasi-minuscule `λ` | `d = ⟨2ρ, λ⟩ ≥ 2`, since `⟨2ρ, α^∨⟩ ≥ 2` for a positive coroot; `H^{d−1}(U_s, M_s) ≅ H^d(i^! j_{!+}M_s)`, dual to `H^{−d}(i^+ IC) ≠ 0` | nonzero, so `U_s` is not affine (Artin vanishing) |
| §3.3 Check, `ℋ^{d−1} ≠ 0` | `PGL₂` | `H¹(U_s, M_s) ≅ H²(K[−2]) = K` | dim 1, as in the Check |
| §3.1 `ℋ^k` | `W = 1`; `SL₂` std; `PGL₂` adjoint | `ℋ⁰` only, rank 1; `ℋ⁰` only, rank 2; `ℋ⁰` rank 3 and `ℋ¹` rank 1 | the clause is needed only in the last case |
| §3.4 route | `PGL₂` | the image of `Kl_W` in `ℋ⁰` has fibre `H⁰(Y_s, j_{!+})` of dim 3 in both theories; the square makes specialization map dR onto rigid; dims `3 = 3` | iso |
| §1.2 Braden | weights `(1, −1)` | attracting: `e₊^!(K_{x-axis}) = K[−2](−1)`; repelling: `e₋^+(K_{y-axis}[−2](−1)) = K[−2](−1)` | equal |
| §1.2 Braden | weights `(1, 1)` | attracting: `e₊^! K_{𝔸²} = K[−4](−2)`; repelling: `a₋^! K = K[−4](−2)` at the origin | equal |
| §1.2 Braden | trivial action (weight 0) | `Q⁺ = Q⁻ = Q⁰ = Q`; both sides are `F`; the map is the identity | holds |
| Former-numbering rows | GlobalShtukasAndFunctionFieldLanglandsPartII citations | 15 cited; 10 + 5 mapped | all resolve |
| Convolution headline | no `[DecidableEq F]` | exit 0; the same conclusion in `#check` | holds |

## Notes for the maintainer

- No Lean name changed. The README now maps five more former labels, so the citations in
  GlobalShtukasAndFunctionFieldLanglandsPartII §§KB.2–KB.3 resolve.
- §3.3 no longer asserts Xu–Zhu Lemma 4.2.6(i). Any roadmap that relies on "`τ_+(M)[1]` holonomic" should
  use the degree-zero statement (ii). I searched main, the open heads and the board packages: no other
  roadmap cites Xu–Zhu Lemma 4.2.6 (the hits are other papers' Lemma 4.2.6).
- Untrusted text: the review contains no instruction outside its findings.
