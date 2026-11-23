# Review of SymmetricHyperbolicSystems (pull request #2246 at b986579)

**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and all four of its small corrections and three format notes are repaired at this head without a new defect in the statements; the two theorems of §2.3 that lost the continuity hypothesis on `F` were recomputed and hold without it. There is one small correction (a loose clause in the new sentence of §2.3) and no format note, nothing blocking. For the human reviewers: the texts of John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 could not be read, so their page and equation locators, and the arrangement against John, remain untested.

## C01 — In §2.3 the new sentence says that `S.apply u` "vanishes where `u` does", which is true only outside the bounded set, not pointwise

The sentence justifying the dropped hypothesis (README lines 269–271) reads "on the open slab `F = S.apply u`, which is continuous and vanishes where `u` does". Read literally this fails: for `A⁰ = 1`, `A¹ = 1`, `B = 0`, `n = N = 1` and `u(t,x) = x χ(x)` with `χ = 1` near `0`, `u(t,0) = 0` but `S.apply u (t,0) = ∂ₓu(t,0) = 1`. What the argument uses, and what is true, is that `S.apply u` vanishes for `‖x‖ > R` when `u(t,x) = 0` for all `t ∈ [0,T]` and `‖x‖ > R`: that set is open in `x` and the `t`-derivative is taken at fixed `x`. Writing "vanishes outside the same bounded set" makes the sentence exact. The statement of the theorem and its Lean form are unaffected.

## Previous findings

The previous review, of `3c07b5d`, had no finding (R); its small corrections and format notes are accounted for here.

- C01 of the previous review (one iterate beyond `T + 1` in Layer 6) — repaired: "Fix the hypotheses of §5.2 with `T` replaced by `T + 1 + μ` … `k = μ h` with `0 < h ≤ 1` … `(m + 1) k ≤ T + 1 + μ h ≤ T + 1 + μ`".
- C02 (Tau Ceti lemma missing from Layer 3's dependency lines) — repaired: the `*Needs:*` line of §3.1 adds "Tau Ceti's `TauCeti.fwdDiff_iter_smul`" and Layer 3's Dependencies read "Mathlib; Tau Ceti's `TauCeti.fwdDiff_iter_smul`".
- C03 (constant of §7.1 in Lean) — repaired: "The Lean statement `exists_bound_iteratedFDeriv_sqrt_comp` records boundedness only: its constant may depend on `A`. … §7.2 needs only boundedness"; the Lean docstring says the same.
- C04 (continuity of `F` unneeded in §2.3) — repaired: `hFc` is removed from `integral_dotProduct_A0_sub_eq` and `integral_dotProduct_A0_le`, and the README drops the hypothesis with a reason; one clause of that reason is loose (C01 above).
- N01 (`Matrix.dotProduct`) — repaired: both places now cite `dotProduct`, the name at `Mathlib/Data/Matrix/Mul.lean:76`.
- N02 (the letter `N` for a count) — repaired: `J` in the Check of §3.2, `q` in the Space step of §6.2; neither letter is used otherwise in the README.
- N03 ("follows John", "as in John"; the sign of Métivier's `K`) — repaired: §5.1 and §6.1 now carry the locator in parentheses, and the three Métivier citations and the reference entry are removed, each statement keeping a published locator (Friedrichs 1954 and John 1982 at §1.2, John 1982 at §2.1, Lax 2006 at §2.3).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3 `integral_dotProduct_A0_sub_eq` without `hFc` | `A⁰ = 1`, `Aʲ = B = 0`, `u = tχ(x)`, `F = χ` on `(0,T)`, `F = 10⁶` at `t = 0, T`; `T = 0`; `T < 0` | left `t²∫χ²`; right `∫₀ᵗ 2s∫χ² = t²∫χ²`, end values of `F` on a null set; `0 = 0`; vacuous | holds | none |
| §2.3 `integral_dotProduct_A0_le` without `hFc` | same `u`, `κ = 0`, `λ = 1`; `B = −β`, `u = e^{βt}u₀`, `F = 0` | `t²‖χ‖² ≤ eᵗ · t‖χ‖²` since `t ≤ eᵗ`; `e^{2βt} ≤ e^{(2β+1)t}` | holds | none |
| §2.3 integrability of `F = S.apply u` on the open slab | general | derivatives of `u` extend continuously to `[0,T] × {‖x‖ ≤ R}`, coefficients continuous: `F` bounded, zero for `‖x‖ > R` | holds | C01 (wording) |
| §2.3 "vanishes where `u` does" | `u = xχ(x)`, `A¹ = 1` | `u(t,0) = 0`, `S.apply u (t,0) = 1` | pointwise reading false; set reading true | C01 |
| Layer 6 opening, `T + 1 + μ` | `t_m ≤ T + 1 < t_{m+1}`, `h ≤ 1` | `(m+1)k ≤ T + 1 + μh ≤ T + 1 + μ`; support `R + (T+1)/μ + 3h ≤ R₁` | holds | none |
| §7.1 `exists_bound_iteratedFDeriv_sqrt_comp` and its note | `A = 2 + sin x`, `c = 1`, `Λ = 3`, `C = 1`, `m = 1` | `|(√A)'| = |cos x| / (2√(2 + sin x)) ≤ ½ = C/(2√c)`; Lean binds `A` before `∃ C'` | holds; note accurate | none |
| §3.1 `*Needs:*` (`TauCeti.fwdDiff_iter_smul`) | declaration opened at the pin | `Δ_[h]^[n] (f • g) = Σ (n choose i) • (Δ^i f x • Δ^j g (x + i • h))`, `[Module R G]` | exists as cited | none |

The rows for the untouched statements stand as in the previous review, of `3c07b5d`.

- Source locators checked against the text: 0 in this round; the changed passages cite John 1982, Lax 2006 and Friedrichs 1954 only, none of which could be read (below).
- Library declarations opened at the pins: `dotProduct` (`Mathlib/Data/Matrix/Mul.lean:76`, root namespace) and `TauCeti.fwdDiff_iter_smul` (`TauCeti/Algebra/Group/ForwardDiff.lean:102`); pins Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as the description says.
- Cross-roadmap citations: none added or changed; none is a supplier.
- Automatic checks: all passed on this head when rerun. `lake env lean` on `Suggested.lean`: 0 errors, 14 `sorry` warnings, nothing else. The two changed signatures were compared with §2.3: both carry `hu` and `hsupp` and no hypothesis on `F`, as the README states. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: neither changed theorem closes.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- The pull request's title and description agree with this head: seven layers as listed, `Suggested.lean` imports only Mathlib, no source named in the description was removed.
- Overlap check: read CompressibleEulerEquations (open), PDE (main and its open revision), QuaternionicAnalysis (main), HankelFormsAndRealMomentProblems, OneStepMethodsForODEs and HamiltonJacobiAndConservationLaws (open); nothing shared. No other open pull request changes this roadmap, and none drops an id it cites.
- Source independence: changed passages only; 6 added or reworded passages compared with 0 sources, since the sources they cite (John 1982, Lax 2006, Friedrichs 1954) could not be read; the added sentences are commentary on this roadmap's own statements; largest share John 1982, 12 of 25 citations in the layers; no layer added, removed or reordered, so contents not compared again (John's table of contents could not be read).
- Research link: the linear theory of Friedrichs (1954) with the difference scheme of Courant–Friedrichs–Lewy (1928) and Lax; §1.2, §2.1–§2.3 and §7.3 are the linear inputs of the quasilinear theory (Kato, Majda) and are consumed by the open roadmap CompressibleEulerEquations. Rests on the README's references and that roadmap's text.

## Not verifiable

- John 1982, Ch. 5 §3: (3.1a) p. 163, (3.5a)–(3.5b) and (3.6)–(3.8) p. 164, (3.9)–(3.12a) p. 165, (3.20a)–(3.21) pp. 167–168, §3 (b) (the locators of the changed passages in §1.2, §2.1, §2.3, §5.1, §6.1): Springer, paywalled; no text among the sources held for this roadmap.
- Lax 2006, Theorem 4.3, pp. 41–42 and p. 45 (§2.3): no legal copy among the sources held for this roadmap.
- Friedrichs 1954, p. 348 and §7 Theorem 7, p. 361 (§1.2, §2.3): paywalled; no text held.
- The remaining locators into these texts and into Rudin 1976 are as in the previous review: not checked against a text in any round.

## Source issues

- none

## For the human reviewers

- **Not tested.** John 1982 has the largest share of the README's citations (12 of 25 in the layers); its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Not tested.** The page, theorem and equation locators into John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 were not checked against a text in any round.
