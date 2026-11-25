# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 46 lines changed since `3f8c596`: five credits to the formal proof (8.5, 8.12, 8.19b, 8.19c and its method line) and the new comparison with Bruinier and Howard's volume formula in the origin lines of 8.15d, 8.16 and 8.17 and in the References. Each declaration named was opened in the Lean source and each sentence about Bruinier–Howard was read against Theorem A of arXiv:2105.11274v3; all are right, and the previous small correction on 8.12 is repaired. There is no finding. Accepted with one format note, carried over, which does not block. Two facts are left for the human reviewers.

## N01 — Where `*KNOWN*` and `*NEW*` became `*Sources:*`, the qualifiers they carried still read as if they were sources

Carried over; the text is unchanged. "*Sources:* (this form; …" in 8.14 (line 532), "(statement; …" in 8.14a and 8.14b (lines 598, 663), "*Sources:* ingredients (…" in 8.13, 8.18, 8.18c, 8.18e and 8.19a′ (lines 420, 1427, 1776, 1877, 2491). Dropping "this form;", "statement;" and "ingredients" would fix these.

## Previous findings

The previous report had no finding (no R01); its small correction and format note are accounted for here.

- C01 — repaired: the `*Sources:*` entry of 8.12 now reads "in its case `m = 0` (it also twists by a natural number `m`, with a further term in `m` in the lower bound)" and "which takes one named statement as a hypothesis".
- N01 — not repaired: the qualifiers stand as before (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.12 `*Sources:*`: `GlobalTheory.FlatRootTwist.flat_root_twist` | statement read; `m = 0` | formal bound `Σ w·c1 − q·lrd E·Σ|w| − m·([E:ℚ]/2·(p+q))·(log(2π)/2 + lrd E)`; at `m = 0` the README's; one closed premise, `GlobalTheory.Published.AbelianDeRham` | as described | none |
| 8.5 `*Sources:*`: `GlobalTheory.chowla_selberg_lie_lines` and the existence of the curve | signature read | first argument `hC : CMCurve`; `CMCurve` is the existence statement for `d ≥ 7` squarefree, `d ≡ 3 (mod 4)`; `GlobalTheory.T.exists_cmEllipticCurve_withPeriod : CMCurve`, no premise, in the cited file | as described | none |
| 8.19b `*Sources:*`: `GlobalTheory.ToricDenomRow.toricDenominator` | signature read | `ZetaDenominators → LatIntRam → LatIntUnr → ToricDenominator`: three named hypotheses; the declaration is in `…/DivisorProofs/ToricDenominatorOfZetaDenominators.lean` | as described | none |
| 8.19c statement vs `ToricRatioConjugates` | formula compared; `ψ = 1`; `[t] = 1` | formal: `g(T ψ/T₀) = (g∘ψ)([t])⁻¹·T(g∘ψ)/T₀`, `art(t)⁻¹ = σ`, any CM `E ⊃ K`, `0 < d`, `κ_i ≥ 1`, `UnramFin E`. README: the same. `ψ = 1`: both give `g` fixing `T(1)/T₀` | equal | none |
| 8.19c `*Sources:*`: "`T(χ; 𝔣) ≠ 0` among its conclusions" | conclusion read | `∃ T₀ T, IsToricSum … T₀ ∧ T₀ ≠ 0 ∧ …`; `RatioConj` takes `T₀ ≠ 0` as a hypothesis and quantifies over `Host R` only | as described | none |
| 8.19c `*Sources:*`: `toricRatioConjugates_of_transport` | signature read | `(hT : TwistedTransport) : ToricRatioConjugates`, in `GlobalTheory.ToricTransport` | as described | none |
| 8.19c method line: the hypothesis of the transport of single lattice sums | `LatConj`, `PeriodEx` opened | `LatConj` assumes `TorsTransport ι g t Λ₀ Λ₁ Ω₀ Ω₁` (`g₂/Ω⁴`, `g₃/Ω⁶`, `℘/Ω²`, `℘′/Ω³` at torsion points); `period_existence_cm : EllipticMainTheoremCM → PeriodEx` supplies it | as described | none |
| 8.15d, 8.17, References: Bruinier–Howard, Theorem A = Theorem 8.6.1 | text read at both places | signature `(n−1, 1)`, `k` imaginary quadratic of odd discriminant, moduli stack with no level, metrised Hodge bundle; `v̂ol = (2A′/A(0) − n·C₀(n) + log D)·vol_ℂ`; Theorem 8.6.1 restates it | as described | none |
| 8.16 origin: "logarithmic derivatives … and logarithms of the discriminant … and of its prime factors" | `n = 1`; `n` even | `n = 1`: with the functional equation of `L(s, ε)`, the ratio is `(L′/L)(1, ε) − γ − log(2π/√D) = −log Ω_K` of the Conventions. `n` even: further terms `log ℓ`, `ℓ ∣ D`, from the local factors of `A_W` | as described | none |
| 8.15d origin: "the two have no Shimura variety in common" | `E = K` | 8.15–8.19a‴ ask `E` unramified over `F` at every finite place; `K/ℚ` is ramified at `d`, so `E ≠ K`; and the level here is principal of level `M ≥ 3`, there none | true | none |
| 8.17 origin: the hypotheses named | statement of 8.17 read | mean of volume slopes: `|Φ| ≥ 2`, `u_τ` strictly decreasing, gap `g` on the last `q` (smaller) block; an inequality `≥ −C·err(u, g)` | as described | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `3f8c596`.

- Formal proof: 6 theorems (`chowla_selberg_lie_lines`, `exists_cmEllipticCurve_withPeriod`, `toricDenominator`, `toricRatioConjugates_of_transport`, `ratioConj_of_toricRatioConjugates`, `flat_root_twist`) and 8 definitions (`CMCurve`, `ToricRatioConjugates`, `TwistedTransport`, `RatioConj`, `LatConj`, `PeriodEx`, `TorsTransport`, `LatIntRam`/`LatIntUnr`) opened; the five cited files exist.
- Source locators: 2 (Theorem A and Theorem 8.6.1 of arXiv:2105.11274v3, operator-held text lines 240–257 and 5507–5516; setting at lines 147–176).
- Seeded sample: of its fifteen targets, 8.12, 8.15d, 8.16, 8.19b and 8.19c fall in changed passages and were checked as above; the other ten are untouched.
- Record: no heading, layer, statement or Lean declaration removed since `3f8c596` or against `main`; the change adds no cross-roadmap citation and no supplier.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1410 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: only the `sorry` warning (line 68). The file is unchanged; the elaborated types of `logPeriod` and `chowlaSelberg_classMean` stand as read before.
- Description read against this head (as far as the text supplied shows it): nothing contradicted; the change removes or renumbers no section, changes no declaration and adds no supplier.

Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (on `main`) as in the previous review; the list by results named is empty, and no open pull request changes this roadmap. The change adds no object; nothing shared.

Source independence: changed passages only. 9 passages (the five credits to [FormalProof], the three origin lines and the References entry) compared with 2 sources (the Lean source of [FormalProof]; arXiv:2105.11274v3, abstract and Theorem A), none shared beyond an eight-word standard description of the result; largest share [FormalProof], 113 cited files against at most 5 locators for any published source. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967), read as a Faltings height (Colmez 1993). 8.14–8.19 bring Bost's slope method (Bost 1996), arithmetic Hilbert–Samuel and successive minima (Gillet–Soulé 1992, Zhang 1995, Bost–Gillet–Soulé 1994) and Mumford's proportionality (1977) to unitary Shimura varieties; Bruinier–Howard (2021) is the exact formula for `GU(n − 1, 1)`. Rests on the README's References.

## Not verifiable

- The pull request's description was supplied in a shortened form; the part not shown was not read against this head.
- Yuan's published version (Compositio Math. 157, 2021), Goldstein (1981–1982), Böcherer (2006), Weissauer (1986), Katz (1976, 1978): not opened, as in earlier rounds; no changed passage rests on them.

## Source issues

- none

## For the human reviewers

- Scope: of the 30 sections, 15 are labelled "particular to this proof", 14 "adapted from" and one (8.5) "published". The proof is the formal proof of GRH for Dirichlet L-functions announced on 20 November 2026 (README References), which has not been refereed.
- Licence: the repository of [FormalProof] carries no licence. The README cites its file paths and declaration names only and copies no code; whether citing it in this way needs anything more is for a human to read.
- Decisions of the human reviewers for this pull request: neither was needed for this folder, which removes no layer, section or declaration against `main`.
