# Review of IncompressibleFluids (pull request #2630 at f9143b3)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 60 lines changed since `e704bba`: the four small corrections and two format notes of the previous review are all repaired, the new Lean statement of the Helmholtz–Weyl theorem is true as written (checked in dimensions 0, 1 and `d ≥ 2`), and every locator the change adds was found at its place in Ożański–Pooley and in Tao's notes with the restrictions the README states. There is no finding and no small correction; two format notes, neither blocking. Left for a human, as before: which roadmap owns the whole-space theory that the open IncompressibleFlows also plans, and the cited texts that could not be read legally.

## N01 — §3.4 still opens with the reflexive hypotheses before saying the target has none

The first two sentences of §3.4 (`TauCetiRoadmap/IncompressibleFluids/README.md` lines 411–413) assume `X₀`, `X₁` reflexive and `1 < p, r < ∞`; the added sentence (lines 415–417) then says the target is the form with no reflexivity and `1 < r ≤ ∞`. Both are true and the added sentence settles which is meant; the paragraph would read more easily with the target's hypotheses stated first and Lions' reflexive case named as the special case.

## N02 — One line of the module docstring exceeds 100 characters

`TauCetiRoadmap/IncompressibleFluids/Suggested.lean` line 20 ("projection with the heat semigroup (§1.2); the off-diagonal …") is longer than 100 characters after the edit.

## Previous findings

The previous review, of `e704bba`, had no finding (it accepted). Its small corrections and format notes, at this head:

- C01 — repaired: §2.3 now cites Ożański–Pooley, Lemma 2.1 (iii) with (2.7)–(2.8), Theorem 2.5, and Tao, Notes 1, Exercise 27; §5.3 cites Tao, Notes 1 and 2, and Ożański–Pooley, Corollary 3.3, Theorem 3.4. All read at the locator.
- C02 — repaired: `mem_orthogonal_solenoidalL2_iff` is marked a check on the definition; the new `mem_orthogonal_solenoidalL2_iff_exists_hasWeakFDerivOn` states the complement as the `L²` weak gradients of locally integrable `q`.
- C03 — repaired: §3.4 says "The target is Simon's form: no reflexivity, `1 < p < ∞` and `1 < r ≤ ∞`", and the Lean docstring says the same; the paragraph's order is N01.
- C04 — repaired: the description lists the Aubin–Lions lemma, the proved auxiliary statements, the PDE sections consumed, and the two earlier reviews; nothing in it is contradicted by this head.
- N01 — repaired: `integral_pow_four_le_of_finrank_eq_two` is stated on an inner product space `E` with `hE : Module.finrank ℝ E = 2`.
- N02 — repaired: the vorticity bullet of §4.3 reads "For `f = 0` and `u₀ ∈ H¹_σ` the vorticity …".
- Question on the symbol of `ℙ` (§1.2) — answered: the locator is now "the display after (2.11)", which is what stands on p. 16 (OP17 lines 714–721).
- Question on Lemarié-Rieusset, Proposition 12.1 (§4.2) — open; the description says so. See `## Not verifiable`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `mem_orthogonal_solenoidalL2_iff_exists_hasWeakFDerivOn` (§1.2, new) | `d = 0`; `d = 1`; `d ≥ 2`; sign; `q` not locally integrable | `d = 0`: both sides true. `d = 1`: `L²_σ = 0`, `q = ∫u`. `d ≥ 2`: annulus Poincaré gives density; `∫∂ᵥφ·q = −∫φ⟪u,v⟫`, so `u = ∇q`. Definition requires `LocallyIntegrableOn q`. | true | none |
| `mem_orthogonal_solenoidalL2_iff` (§1.2, docstring changed) | `K` = test gradients | `L²_σ = Kᗮ`, so `(L²_σ)ᗮ = (Kᗮ)ᗮ = closure K`; docstring now says exactly this | true; marked as a check | none |
| `integral_pow_four_le_of_finrank_eq_two` (§3.1, restated) | `u = 0`; dilation in `d = 1, 2, 3`; constant | `0 ≤ 0`; sides scale `λ^{−d}` and `λ^{2−2d}`, equal only at `d = 2`; proof gives `‖u‖₄⁴ ≤ ‖u‖₂²‖∂₁u‖₂‖∂₂u‖₂ ≤ ½‖u‖₂²‖∇u‖₂²` | true; `hE` needed | none |
| Aubin–Lions, §3.4 and Lean docstring | `r = ∞`; no reflexivity | Hölder exponent `1 − 1/r = 1`; Ehrling and absolute continuity in `X₁` use no reflexivity; Lean has `1 < p`, `p ≠ ∞`, `1 < r` | README and Lean agree | N01 |
| §1.2 symbol locator | Ożański–Pooley p. 16 | (2.11) is the Oseen kernel's transform with `e^{−4π²t‖ξ‖²}`; the next display is `(I − ξ⊗ξ/‖ξ‖²)F̂` for `F − ∇p` | as the README now says | none |
| §2.3 Stokes system locators | `d = 3`, `ν = 1`, `F = 0` | (2.7): `‖u(t)‖ ≤ ∫‖F‖ + ‖u₀‖`; (2.8): `‖u(t)‖² − ‖u₀‖² + 2∫‖∇u‖² = 2∫∫u·F`; README's identity at `ν = 1`, `F = 0` is the same | agree; restrictions stated | none |
| §2.3, Tao Exercise 27 (29) | scalar heat, Schwartz data | left `‖u‖_{C⁰Hˢ} + ν^{1/2}‖∇u‖_{L²Hˢ}`; right `‖u₀‖ + ‖F‖_{L¹Hˢ} + ν^{−1/2}‖G‖_{L²Hˢ}`: the README's bullet at `s = 0` | agree | none |
| §5.3 locators | Exercise 42, Theorem 45, Exercise 47; Proposition 20 | first three on the torus, `s > d/2` resp. `H^{d/2−1}`; Proposition 20 on `ℝ^d`, `s > d/2 − 1`, `s ≥ 1`, remark after it; `2/4 + 3/6 = 1` | agree; README states each restriction | none |
| §4.3 vorticity bullet | `u₀ ∈ H¹_σ`, `f = 0` | `ω₀ ∈ L²`; testing with `ω`: `½ d/dt‖ω‖² + ν‖∇ω‖² = 0` since `∫(u·∇ω)ω = 0` | true | none |

The rows for the untouched statements stand as in the previous review, of `e704bba`.

- Source locators checked against the text: 10, all that the change adds (Ożański–Pooley: the display after (2.11) p. 16, Lemma 2.1 (iii) with (2.7)–(2.8) p. 15, Theorem 2.5 p. 20, Corollary 3.3 and Theorem 3.4 p. 25; Tao, Notes 1: Exercise 27 (29), Exercise 42, Theorem 45, Exercise 47; Notes 2: Proposition 20). All found, with the settings the README gives.
- Library declarations opened at the pin: `TauCeti.HasWeakLineDerivOn` and `TauCeti.HasWeakFDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean` lines 212 and 251): the definition includes completeness of the codomain and local integrability of the function and of the derivative.
- Duplication: no Helmholtz–Weyl statement, solenoidal subspace or Ladyzhenskaya inequality in the pinned Mathlib or Tau Ceti; no other roadmap, open or on main, declares either changed Lean name.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds no supplier. Nothing outside the folder changes.
- Elaboration of `Suggested.lean` at the pins: succeeds, `sorry` the only warning (8, all theorems; no definition or instance). The 14 elaborated types were compared with the README; no binder is lost, and the Ladyzhenskaya statement carries its own binders and `hE`.
- One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy, for the new and the restated theorem: neither closes.
- Headline theorems: the Helmholtz–Weyl theorem is now stated in its own form; the list of headlines not statable at the pins is unchanged.
- Overlap check: read IncompressibleFlows, PDE, CompressibleEulerEquations, YangMillsConnectionsAndCaloricGauge; the whole-space Leray projection, pressure, Biot–Savart law and solution theory are shared with IncompressibleFlows, this roadmap claims them on `E` and says so in its scope section (see the last section); the rest as in the previous review, the change adding no object.

Source independence: changed passages only; 5 passages (§1.2, §2.3, §3.4, §5.3 and the new Lean docstring) compared with 3 texts (Ożański–Pooley, Tao's Notes 1 and 2), none shared; largest share Tao's notes, now 14 of 55 locators; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: the headline targets are the theorems of Leray (1934), Fujita–Kato (1964), Kato (1984), Beale–Kato–Majda (1984) and Yudovich (1963), the base of current work on Navier–Stokes regularity; Layers 1–4 are prerequisites of the stochastic Navier–Stokes programme PDE names. Rests on the README's References and on Ożański–Pooley (2017) and Tao's notes (2018).

## Not verifiable

- Simon 1987: paywalled, not read; that it proves the form of §3.4 with `1 < r ≤ ∞` and no reflexivity was not checked against the paper. The form was checked by computation.
- Lemarié-Rieusset, "Proposition 12.1, (12.10), p. 361" in §4.2: the book could not be read; the author's description reports the same.
- Bedrossian–Vicol, Majda–Bertozzi, Lions 1969, Grafakos, Galdi, and the lecture notes of Wang (2013) and Danchin (2005): as in the previous review, no legal copy; their locators are in untouched text.

Automatic checks set aside as false positives: the report of TeX subscripts in the tightness bullet of §4.2 points at a formula inside a code span that wraps over a line break; the report that the README names a roadmap the project does not cite as a supplier points at the scope bullet on IncompressibleFlows, which states an overlap and cites nothing from it.

## Source issues

- none

## For the human reviewers

- **Scope.** IncompressibleFlows (pull request #237, open) plans the Euclidean Leray projector, pressure, Biot–Savart law and Navier–Stokes and Euler theory; this README claims them on `E` and states the overlap (lines 952–960). One owner must be chosen.
- **Not tested.** `TauCetiRoadmap/IncompressibleFluids/README.md` §5.1 and §6.1 rest only on Wang's and Danchin's lecture notes and on Majda–Bertozzi, none of which could be read; Bedrossian–Vicol (9 locators) likewise.
- **Licence.** Wang (2013) and Danchin (2005) are unpublished lecture notes, and Tao (2018) is a set of notes on its author's page; no host for the first two could be classified.
