# Review of RestrictedPowerSeries (pull request #2656 at d4364d2)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 29 lines changed since `fe06f84` found no false statement and no missing hypothesis. The split of §5.2 repairs the earlier small correction; the two new counterexamples (the lifting bound is not necessary in §0.2, `‖1‖ = 1` is needed for the norm bound in §2.1) and the restated one-variable target of §2.1 were recomputed and hold. There is one small correction, to the pull request's description, and no format note; neither blocks. The two facts left for the human reviewers are unchanged: the most-cited source could not be read, and the licence of a linked repository was not checked.

## C01 — The description counts 24 Checks and does not mention the two counterexamples or the restated §2.1 target; the head has 25 Checks

The description says "There are 24 Checks." The README at this head has 25: §0.2 gained the Check that the lifting bound is sufficient and not necessary (`TauCetiRoadmap/RestrictedPowerSeries/README.md` lines 252–256), and it is not among the "New ones" the description lists. The description also leaves out two changes of content in §2.1: the remark that the norm bound needs `‖1‖ = 1` (lines 478–480), and the one-variable target for bounded coefficient maps, which is now stated under `‖algebraMap R A a‖ ≤ C ‖a‖` (lines 485–488).

It would be enough to write "There are 25 Checks", add the §0.2 Check to the new ones, and add one bullet under "Statements whose content changed": "§2.1: the one-variable form for bounded coefficient maps assumes `‖algebraMap R A a‖ ≤ C ‖a‖`, which gives `‖f(b)‖ ≤ C ‖f‖_r` without `‖1‖ = 1`; the contractive norm bound is shown to need `‖1‖ = 1`."

## Previous findings

The previous review, of `fe06f84`, raised no finding (no R-numbered remark). Its one small correction is accounted for here:

- C01 (previous) — repaired: "`K⟨r⁻¹X⟩` is a noetherian domain at every positive polyradius (…). At unit radius `T_n` is a unique factorisation domain (…), … a Jacobson ring … and of Krull dimension `n`" (lines 923–928).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 algebra over `S` (line 185) | `S = R`; `S = ℤ`; pin instance | pin: `[CommSemiring S] [Algebra S R]`, map `C ∘ algebraMap S R`; `S = R` gives constants | prose equals the pin's direction (`R` an `S`-algebra) | none |
| §0.2 lifting bound sufficient (line 231) | pin `restrictedMap_surjective`; `ℤ_p → 𝔽_p`, `L = 1` | hypothesis `∀ s, ∃ r, φ r = s ∧ ‖r‖ ≤ C' ‖s‖`, any real `C'`; digit lifts have norm `≤ 1` | "if", as now written, is what the pin proves | none |
| §0.2 new Check (lines 252–256) | `𝔽_p[t]`, `‖f‖ = 2^(deg f)`; target trivial norm; `tⁿ` | `‖fg‖ = ‖f‖‖g‖`, `‖f+g‖ ≤ max`, `‖1‖ = 1`; `‖φ f‖ = 1 ≤ 2^(deg f)`; nonzero norms `≥ 1` so restricted = polynomial; `2ⁿ ≤ L` fails | true: surjective with no bound `L` | none |
| §2.1 `‖1‖ = 1` needed (lines 478–480) | `A = ℚ_p`, `‖x‖ = 2\|x\|_p`; `f = 1` | `‖xy‖ = 2\|xy\| ≤ 4\|x\|\|y\|`; `‖a • x‖ = \|a\|‖x‖`; value `1`, norm `2`; Gauss norm `1` | `2 > 1`: the bound fails; pin has `[NormOneClass A]` | none |
| §2.1 one-variable bounded target (lines 485–488) | term `n = 0`; terms `n ≥ 1`; `A` above with `C = 2` | `‖algebraMap a_0‖ ≤ C‖a_0‖`; `‖algebraMap(a_n) b^n‖ ≤ C‖a_n‖ r^n`; ultrametric max gives `C‖f‖_r`; example: `2 ≤ 2·1` | holds without `‖1‖ = 1`; parenthesis: `x = 1` gives `‖a • 1‖ ≤ C‖a‖` | none |
| §5.2 opening (lines 923–928) | pin signatures | noetherian: `NormedDivisionRing`, complete, `[Finite σ]`, any `c`; domain: any `c`; UFD, Jacobson, dimension: `Tate σ` (unit radius) only | each claim now at the radius the pin proves | none |

The rows for untouched statements stand as in the previous review, of `fe06f84`.

- Source locators: the changed passages carry none, and no target of the seeded sample has a locator inside them; none re-read.
- Library declarations opened at the Tau Ceti pin: `RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` 594 (algebra instance) and 88 (domain), `Map.lean` 190 and 208, `Quotient.lean` 44, 52, 63, `RingTheory/PowerSeries/EvalAt.lean` 298–304 and 413–464, `TateAlgebra/Groebner.lean` 415–427, `UniqueFactorization.lean` 93, `Jacobson.lean` 122, `KrullDimension.lean` 102.
- Passages that cite the changed text were read against it: §0.3/§6.4 "bounded lifts, not algebraic surjectivity" (lines 1156, 1184), the Layer 0 example `ℤ_p → 𝔽_p` with `L = 1` (line 289), the overview and scope on noetherianity (lines 26, 997, 1440). All agree.
- Cross-roadmap citations: none added or changed. Open heads of NewtonPolygons, CompactOperators and AdicSpacesPartII cite this roadmap by section (§§0–4, 7; §§2.1, 2.3, 7.2; §§2.4, 5.2, 6.2) and only consume.
- Automatic checks: all passed, rerun on this head. Dependency check output: `depcheck: 172 roadmaps, 2003 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, no message. The file is unchanged and declares nothing, so there is no statement to probe with one tactic and no signature to compare.
- The description was read against the head: one small correction (C01); its other statements still hold.
- No change outside the roadmap folder.

Overlap check: read NewtonPolygons, CompactOperators, QuaternionicModularForms and AdicSpacesPartII (open heads), and LocallyAnalyticDistributions, RigidAnalyticGeometry and PadicFunctionalAnalysis (main; as in the previous review, the change touches no ownership). Shared objects: Gauss norms, evaluation, Hasse derivatives, Layer 4 division, Strassmann's bound, entire division and the maximal ideals of `T_n` are owned here and consumed by them by section; unit-radius Tate noetherianity is owned by AdicSpaces §0.5 and cited in §5.2.

Source independence: changed passages only; 4 passages compared with 6 sources (martin, bosch, wedhorn, ega, gk, colmez) by search for their examples and phrasing, none shared; largest share bgr, 7 of 23 locators (unchanged, text not readable); the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: Layer 4 is the Banach-ring Weierstrass theory of Martin (2016, §1.3), used there for overconvergent subanalytic sets; §7.2 is the entire-series input of Coleman's Fredholm theory (1997, Appendix A3); `W_n` of §7.3 is Große-Klönne's Washnitzer algebra (2000, §1). Rests on the README and on martin and gk.

## Not verifiable

- bgr, coleman and huber are paywalled and settled as uncertified: their locators were not read (none lies in a changed passage).
- The cited declarations were read in the pinned sources, not elaborated one by one with `#check`.
- Ownership against the open heads was read through the roadmap search tools.

## Source issues

- none

## For the human reviewers

- **Not tested.** `bgr` has the largest share of the README's source locators (7 of 23) and is paywalled (settled as uncertified): neither its wording nor its table of contents was compared; the arrangement was judged from the README's own `bgr` section numbers.
- **Licence.** The Provenance section of `TauCetiRoadmap/RestrictedPowerSeries/README.md` links William Coram's public GitHub repository as prior work whose proofs may be reused with attribution; that repository's licence was not read.
