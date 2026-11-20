# Review of RestrictedPowerSeries (pull request #2656 at c995602)

**Verdict:** needs changes

**Summary.** Changes are needed for four findings. First, this roadmap and AdicSpacesPartIV each list the other as a supplier: §7.3 consumes AdicSpacesPartIV §F1.1, and §F1.1 consumes §§0.1, 1.1 and 5.4 of this roadmap. Second, noetherianity of the unit-radius Tate algebra is claimed both here and by AdicSpaces §0.5. Third, two target clauses (the module form in §2.1 and translation in §7.1) evaluate infinite sums in `R` without assuming `R` complete. Fourth, §7.1 states without qualification a non-surjectivity that fails over `ℤ_p`. All four are repaired by citation or wording changes. There are also three small corrections and one format note. The human reviewers have two facts to consider: the main source could not be read, and the README links a third-party repository whose licence was not checked.

## R01 (P2) — This roadmap and AdicSpacesPartIV supply each other

As written, the two roadmaps have no direction of supply between them, so neither can be placed after the other.

- **This roadmap names AdicSpacesPartIV as a supplier.** §7.3 opens "This section is the supplier contract with AdicSpacesPartIV §F1.1" (line 1324). The same edge appears in the diagram (line 70: "Layers 0–2 and the overconvergent algebra of AdicSpacesPartIV §F1.1 → §7.3"), in the Layer 7 dependencies (line 1363), and in the contract "From TauCetiRoadmap.AdicSpacesPartIV" (line 1616: "§7.3 consumes them").
- **AdicSpacesPartIV on main names this roadmap as a supplier.** Its §F1.1 reads "Supplied by RestrictedPowerSeries §§0.1, 1.1, 5.4" (AdicSpacesPartIV README line 3003), and its supplier table (line 416) has the same row. This README also lists AdicSpacesPartIV under its downstream consumers (line 1379).

The dependency check reports nothing here because both roadmaps are on main and the section-level graph has no loop. At the roadmap level, though, the supply runs both ways. An earlier revision of this roadmap resolved the same point by making AdicSpacesPartIV a consumer only; main and this head still list it as a supplier.

The smallest repair uses the fact that the object §7.3 needs is already at the pin: `TauCeti.Dagger.washnitzerAlgebra` (`TauCeti/RingTheory/Dagger/WashnitzerAlgebra.lean`, line 115), together with `washnitzerAlgebra.ofRestricted`. The *Needs:* line of §7.3 (line 1342) already names only Layer 1 and Tau Ceti. So:

- describe §7.3 as built on that Tau Ceti carrier;
- drop the AdicSpacesPartIV supplier contract, the diagram arrow and the Layer 7 dependency clause;
- keep AdicSpacesPartIV in the downstream table and in the scope as the owner of dagger geometry.

The alternative is to move the one §7.3 target, the polyradius description of `W_n`, into AdicSpacesPartIV §F1.1.

## R02 (P2) — Noetherianity of the unit-radius Tate algebra has two owners

Two places in the scope section contradict each other:

- "This roadmap owns" lists, under "unit-radius Tate algebras over fields", the item "finite quotients, noetherianity, factoriality" (line 1420).
- The bullets under "Owned elsewhere and consumed here" (lines 1452–1457) give "unit-radius Tate noetherianity" to AdicSpaces §0.5 and call it a "supplied result".

AdicSpaces §0.5 lists "Noetherianity of `K⟨X₁,…,Xₙ⟩`" as its milestone 4 (Completed/AdicSpaces/README.md line 243). Main's §5.2 began "Consume noetherianity of `T_n` from AdicSpaces §0.5". This head's §5.2 (line 909) instead states the result as a Tau Ceti theorem at every positive polyradius and no longer cites AdicSpaces. The description says ownership is unchanged.

The repair:

- In the ownership bullet, write "noetherianity at every positive polyradius (the unit-radius case is AdicSpaces §0.5's)".
- In §5.2, cite AdicSpaces §0.5 for the unit radius, as main did.

## R03 (P2) — Two target clauses evaluate an infinite sum in `R` without assuming `R` complete

Without completeness both clauses are undefined, and with Lean's junk sums they are false.

- **§2.1, module form (line 486).** The identity `(f • e)(x) = f(x) • e(x)` for points `x ∈ R^k` needs the value `f(x) ∈ R`. Under §2.1's standing hypotheses only `S` is complete, not `R`. The pinned field case, `TauCeti.MvPowerSeries.IsRestrictedFamily.familyEval_convSMul` (`TateAlgebra/Module/Eval.lean`, line 171), carries `[CompleteSpace K]` for exactly this reason.
- **§7.1, translation (line 1228).** "For `‖1‖ = 1` and `‖a‖ < R₀`, `f(X + a)` is on the open disc": the coefficients of `f(X + a)` are infinite sums. The pinned translation carries `[CompleteSpace R]` (`TateAlgebra/AnalyticSubst.lean`, line 76), and the next clause of the same sentence does say "for complete `R`".

A witness for both:

- Take `R = ℚ` with the `p`-adic norm, and `f = Σ c_n p^n X^n` with digits `c_n ∈ {0, 1}` whose sum `α = Σ c_n p^n` lies in `ℚ_p ∖ ℚ`.
- Then `f` is restricted at radius 1 and lies on the open disc of radius 2.
- Neither `f(1)` nor the constant term of `f(X + 1)` exists in `ℚ`.
- With `E = ℚ_p` and the family `e` that is 1 at exponent 0 and zero elsewhere, `(f • e)(1) = α`, while the right-hand side `f(1) • e(1)` is undefined.

Add "for complete `R`" to both clauses.

## R04 (P2) — §7.1 states without qualification that the bounded-coefficient algebra does not fill the open unit-disc algebra

Line 1216 reads: "it is not surjective, the logarithm `log(1 + X)` being on the open unit disc with unbounded coefficients". This is false for `R = ℤ_p`, or for any `R` whose norm is bounded, such as a trivially normed ring. There every series has bounded coefficients, and every series is restricted below radius 1, so the inclusion is the identity. Also, `log(1 + X)` needs `1/n ∈ R`.

The pinned module says exactly what is true: "The inclusion is not onto in general: over `ℚ_p` …" (`TauCeti/RingTheory/PowerSeries/OpenDisc/Bounded.lean`, lines 24–26, with `TauCeti.not_bddAbove_norm_coeff_log` stated over `ℚ_[p]`). Write "it is not surjective over `ℚ_p`".

## C01 — §6.1 describes the weight-family condition as a topological closure and attributes the open-ideal condition to Wedhorn's §5.6

Lines 1036–1037 gloss `TauCeti.Huber.IsWeightFamily` as "every `M_i^m U` … has closure a neighbourhood of zero". A reader takes this as topological closure. The library's condition (`WeightedRestrictedSeries/Basic.lean`, lines 349–351) is that the additive subgroup *generated* by `M_i^m U` is a neighbourhood of zero. The pin's own docstring calls this Wedhorn's standing hypothesis of §5.6 (wedhorn line 1686–1689), and §5.6 is the locator this section cites.

So "Wedhorn's condition that the ideal generated by each `M_i` be open" is misattributed at that locator. The open-ideal condition is the hypothesis of Wedhorn's Lemma 6.20 (wedhorn line 2050) and Proposition 7.19 (wedhorn line 2510). Suggested wording: "(the additive subgroup generated by every `M_i^m U`, `U` a neighbourhood of zero, is a neighbourhood of zero: Wedhorn's condition in §5.6); over a Huber ring it is equivalent to the open-ideal condition of Wedhorn's Lemma 6.20". The description's sentence on §6.1 ("Wedhorn's open-ideal admissibility condition") needs the same change.

## C02 — "Owned elsewhere and consumed here" lists four roadmaps that this roadmap does not consume

Under that heading (line 1450), four bullets describe roadmaps that are not suppliers:

- AdicSpacesPartII ("this roadmap supplies to it");
- RigidAnalyticGeometry (its §1.5 "consumes §5.4");
- LocallyAnalyticDistributions ("which consume the open-disc and entire-series algebra");
- PadicMeasuresIwasawaAlgebras (described as "a different theorem").

A reader looking for suppliers is told these four are consumed. Retitle the list "Owned elsewhere", or move the four bullets to the downstream consumers.

## C03 — Three targets follow in a line or two from pinned declarations

As stated, these three ask an implementer for almost nothing:

- **§3.2, inverse under evaluation (line 671).** `MvPowerSeries.restrictedEval₂` is a ring homomorphism, so the statement is `IsUnit.map` together with the image of the inverse.
- **§3.3, topologically nilpotent ideal (line 708).** It follows from `TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul` and `TauCeti.MvPowerSeries.powerBoundedSubring_eq_unitClosedBall`.
- **§7.3, polyradius description of `W_n` (line 1340).** One direction is `TauCeti.Dagger.mem_washnitzerAlgebra` (`WashnitzerAlgebra.lean`, line 131). The other is `washnitzerAlgebra.ofRestricted` with `ρ = min_i c_i`.

If they are meant as sanity checks, mark them as such; otherwise keep them as targets with a note that they are glue.

## N01 — In §5.4 the letter `p` is both the common exponent and the prime of the Check

Line 983 reads "one common exponent `p ≥ 1` … `‖u_i‖ r_i^p = 1`", while the Check at line 1004 uses `p` for the prime. A different letter for the exponent would avoid the clash.

## Questions for the author

- §6.1, line 1039: "over a general nonarchimedean ring the open-ideal condition alone does not make the weighted series a ring". Which ring and weights witness this? No locator or pinned declaration is given. The pin's counterexample, in the docstring of `IsWeightFamily`, is one where the ideal `Y·A` is *not* open, so it does not support this sentence.

<details><summary>What was checked</summary>

- **Previous review.** It raised no finding. The two-way supply with AdicSpacesPartIV that an earlier revision had resolved is present again (R01).
- **Automatic checks.** Every check passed. The check that every supplier comes earlier in the merge order and that no two roadmaps supply each other read 200 roadmaps and 2200 supply edges and found no problem: no citation of a later roadmap, no loop, and no need to move this roadmap; the roadmap is on main. The change touches nothing outside the folder.
- **Elaboration.** `Suggested.lean` elaborates at the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4b) with no message. It declares nothing, so there was nothing to probe with one tactic and no `#check` comparison to make.
- **Library names.** All 457 dotted names in the README were resolved at the pins: 360 by `#check`, 95 by reading their declarations in modules without built object files, and 2 by reading their namespace. The 20 names in the docstring of `Suggested.lean` all occur in the README, and their modules contain no `sorry`.
- **Not verifiable.** bgr, coleman and huber are paywalled and settled as uncertified; their locators were not read. bgr's table of contents was not read either.

</details>

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 restricted subring, zero variables | `σ = ∅`; `X i` over nonzero vs zero ring | one exponent, cofinite filter `⊥`, decay vacuous; pin `algebraMap` surjective under `IsEmpty σ`; coefficient 1 at `single i 1`; zero ring `X i = 0` | holds | none |
| §0.1 one-variable comparison | Mathlib definition | `PowerSeries.IsRestricted` is an abbrev for `MvPowerSeries.IsRestricted (σ := Unit) (fun _ ↦ c)` (Mathlib `PowerSeries/Restricted.lean` line 28) | definitional, as stated | none |
| §0.2 coefficient maps, lifting bound | `C < 0`; `ℤ_p → 𝔽_p`, `L = 1`; zero map `R → 0` | `C<0` forces `φ = 0` on a nonzero ring; digit lift norm `1 ≤ 1·1`; kernel `p·ℤ_p⟨X⟩`, image `𝔽_p[X]`; everything maps to 0 | holds; pin norm bound needs `0 ≤ C`, stated | none |
| §0.3 families and convolution | `E = R`; non-ultrametric `E` | `isRestrictedFamily_coeff_iff`; pin `IsRestrictedFamily.convSMul` carries `[IsUltrametricDist E]`, as stated | holds | none |
| §1.1 Checks | `X^n` at `r = 1`, `‖1‖ = 1`; `r = √p` over `ℚ_p` | coefficients tend to 0 pointwise, `‖X^n‖ = 1`; `|ℚ_p×| = p^ℤ ∌ √p` | holds | none |
| §1.2 radius change and rescaling | `Σ p^(2n)X^n` at `p` and 1; `Σ p^n X^n`; `‖u‖ s = r` | weights `p^(−n)`, norm 1 at both radii; `p^(−n)` vs constant 1; `‖u^ν a_ν‖ s^ν = ‖a_ν‖ r^ν`, pin needs no `Finite σ` | not surjective, dense; isometric | none |
| §1.3 Check | `Σ X^i Y^i` at `(1, 1)` | each slice `Y^i` finitely supported with Gauss norm 1; coefficient 1 at infinitely many `(i, i)` | not restricted, as stated | none |
| §2.1 evaluation, ultrametric `A` | `b = 0`; `ℓ¹(ℕ, ℚ_p)`, `b = e₁`, `|a_n|` about `1/log n` | `φ(a_0)`; `Σ a_n e_n` has ℓ¹ norm `Σ|a_n| = ∞` | ultrametric needed, as stated | none |
| §2.1 module form | `R = ℚ` with `p`-adic norm, `E = ℚ_p`, `x = 1`, `e_0 = 1` | `(f•e)(1) = α ∈ ℚ_p ∖ ℚ`; `f(1)` not in `ℚ`; pin field case has `[CompleteSpace K]` | needs `R` complete | R03 |
| §2.2 Check | translation by 1 at `r = 1` | `‖X + 1‖ = 1 ≤ 1`; constant 1 not nilpotent, so `HasSubst` fails | holds | none |
| §2.3 Check | char 2, `T²` | `D⁽²⁾T² = C(2,2) = 1`; second derivative `2 = 0` | holds | none |
| §2.4 Strassmann and maximum principle | `X^p − X` over `ℚ_p`; `𝔽_p` trivial norm; `X² − p` at `p^(−1/2)` | values `≤ p⁻¹` on `ℤ_p` vs norm 1; vanishes on all of `𝔽_p`; zeros `±√p`, bound 2 attained | holds; pin needs complete `L` only | none |
| §3.1 multiplicative units | norm `2‖·‖` on `ℚ_p` (`‖1‖ = 2`); `1 + a`, `‖a‖ < 1` | no multiplicative unit exists (`‖u·1‖ = ‖u‖‖1‖` forces `‖1‖ = 1`); Neumann series under `NormOneClass` | pin hypotheses as stated | none |
| §3.2 unit criteria | `1 − pX`, `1 − X`; `1 + εX` over `K[ε]/(ε²)` | unit; not a unit (vanishes at 1); `(1+εX)(1−εX) = 1` with tie `‖ε‖ = 1` | field criterion fails for Banach rings, as stated | C03 (target) |
| §3.3 Checks and example | `Σ p^n X^n`; `p`; `1 + X`; `1 + pX` | reduction 1; unit of `T`, not of `T°`; reduction `1 + X` not a unit, vanishes at `−1`; inverse `Σ(−p)^n X^n` | holds | C03 (target) |
| Headline: Banach-ring division and norm identity (§§4.1–4.2) | `s = 0`; `T⁴ ÷ (T² − ε)` at `r = 1`; zero ring | `b = 0`; `(T²−ε)(T²+ε) = T⁴`; distinguished impossible (`0 < 0`) | pin `existsUnique_mul_add_eq` matches | none |
| Headline: preparation (§4.3) | `p + X + pX²` over `ℚ_p`, `r = 1` | weights `p⁻¹, 1, p⁻¹`; `a = −p − pa²`, `‖a‖ = p⁻¹`; `e = pX + (1+pa)`, `‖pX‖ < 1 = ‖1+pa‖` | holds | none |
| §4.3 targets | `g` a polynomial; `w = T^s − b` | monic division of `g` by `w` and uniqueness give `e` polynomial with remainder 0; `T^s = w·1 + (T^s − w)` | true | none |
| Headline: several variables (§4.4) | `T² − ε` at `r < 1`; `X² − p` at `p^(−1/2)` | greatest attaining index 0, `−ε` not a unit; weights `p⁻¹, p⁻¹`, its own Weierstrass polynomial | Checks hold; pin needs completeness, any `σ` | none |
| §5.1 Weierstrass polynomials | `X² − p` at `r = 1`; monic factor `w₁` of `w` | Gauss norm 1, basis `1, X`, quotient `ℚ_p(√p)`; `1 = ‖w₁‖‖w₂‖`, each `≥ 1` | holds | none |
| Headline: noetherian, UFD, Jacobson, dimension (§5.2) | `n = 0`; `n = 1`; trivially normed `K` | `T_0 = K`; `T_1` a PID, dimension 1; `T_n = K[X]`, dimension `n` (pin uses `NormedField K`) | holds | R02 (owner) |
| §5.2 Rückert criteria | `B/(b) ≅ A[X]/(w)`; prime `P ⊇ (b)` | irreducible monic `w` is prime in a factorial `A[X]`, so `φ(w)` is prime; `B/P` is a quotient of a finite `A`-algebra | true | none |
| Headline: maximal ideals, maximum principle, closed ideals | `(X − a)`, `‖a‖ ≤ 1`; `(X² − p)`; `N = 0` | residue field `K`; `ℚ_p(√p)` of degree 2; empty generator family | pin declarations match | none |
| §5.4 Check | `r = √p`, `s = 2`, `c = p` | `‖p‖(√p)² = 1`; `‖a(pX²) + Xb(pX²)‖ = max(‖a‖, √p‖b‖)`, disjoint parities | holds | N01 |
| §6.1 universal property | trivial weights; union of the sets `S_i` | power-bounded `b_i`; `VB₁ ⊆ W`, `WB₂ ⊆ U`, so products of bounded sets are bounded | equivalence holds | C01 |
| §6.2 unit weights | weight sets `{u_i}`, `‖u_i‖ c_i = 1` | `a_ν ∈ u^ν U` iff `c^ν‖a_ν‖` is small | equals radius `c` | none |
| §6.3 Checks | `ℤ_p`, `I = (p)`; `Σ X^n` | finitely many `a_k ∉ p^m ℤ_p`; coefficients 1 do not tend to 0 | matches ega 7.5.1, 7.5.3 | none |
| §7.1 open disc | `ℤ_p`; `log(1+X)` over `ℚ_p`; `R = ℚ`, `a = 1`, `R₀ = 2` | over `ℤ_p` bounded = all series; `‖1/n‖` unbounded over `ℚ_p`; constant term of `f(X+1)` not in `ℚ` | fails over `ℤ_p`; needs completeness | R04, R03 |
| Headline: entire division (§7.2) | unit constant `P`; `T − a`; `T³ ÷ (T² + aT + b)` | `Q = P⁻¹F`, `B = 0`; `q_n = Σ f_(n+1+k)a^k`; `b_k = 1, −a, a²−b` give quotient `T − a` | holds | none |
| Headline: inverse at a zero | `F(0) = 1`, `F(a) = 0` | `1 = a·(−Σ c_(n+1)a^n)`; `a` commutes with the series | holds; pin needs only `IsBoundedSMul` and complete `A` | none |
| §7.2 resultants and non-normability | `Res(T², a+bT)`; `Res(1, 0)`; `Res(P, P)`; trivially normed `K` | `det[[a,0],[b,a]] = a²`; rank 0, det 1; remainder 0, det 0; `{‖f‖_1 < 1} = {0}` | holds | none |
| §7.3 Check and supply | `Σ p^⌈n/2⌉X^n` | at `√p` the weights `p^(n/2−⌈n/2⌉)` lie in `{1, p^(−1/2)}`; in `W_1` via `ρ ∈ (1, √p)`; no `ρ ∈ p^ℤ` | holds | R01, C03 |
| `Suggested.lean` | headline list vs docstring | 20 names, all in the README, all at the pin, in modules without `sorry` | an empty file is correct | none |

- **Source locators checked against the text: 33.**
  - martin: 673, 676, 683, 694, 720, 735, 766, 840, 876.
  - bosch: 440, 532, 558, 580, 618–660, 710, 771, 804, 847, 852, 860.
  - wedhorn: 1686, 1719, 1739, 1762, 2050, 2510.
  - ega: 2634, 2672, 2681.
  - colmez: 628, 1417.
  - gk: 72, 84, 94, 110.
- **Library declarations.** 457 resolved at Tau Ceti 2fd255d and Mathlib 1b1ccf4b; about 45 signatures compared with the README's hypotheses. Among them:
  - `IsMulDistinguished` (`MulDistinguished.lean` line 87);
  - `IsDistinguished` (`PowerSeries/GaussNorm.lean` line 351);
  - `IsNormMulUnit` (`Monoid/MulUnit.lean` line 66);
  - `IsWeightFamily` (`WeightedRestrictedSeries/Basic.lean` line 349);
  - `exists_pointNorm_eq_norm` (`Affinoid/MaximumModulus.lean` line 73).
- **Cross-roadmap citations resolved on main.**
  - AdicSpaces §§0.1–0.5 (lines 139–233).
  - AdicSpacesPartIII §F0.1 *restricted-power-series-adic* (lines 231, 270).
  - AdicSpacesPartII §R0.3 (lines 1769, 1992).
  - AdicSpacesPartIV §F1.1 and its two targets (lines 2998, 3017, 3170).
  - RigidAnalyticGeometry §1.5 (line 642); PadicMeasuresIwasawaAlgebras §4.3 (line 2485).
  - The bold label "Monic entire resultant" that LocallyAnalyticDistributions cites is kept (line 1265).
- **Automatic checks and elaboration.** Every gate check passed. The dependency check found 0 problems. `lake env lean` on `Suggested.lean` exited 0 with no messages; there are no declarations to `#check` or to probe.
- **Overlap check:** read NewtonPolygons, CompactOperators, LocallyAnalyticDistributions, AdicSpacesPartIV and QuaternionicModularForms (open heads, through the roadmap grep tool), and RigidAnalyticGeometry, PadicFunctionalAnalysis and LocallyAnalyticDistributions (main). Shared objects and their owners:
  - `W_n`: owner AdicSpacesPartIV, with the supply running both ways (R01).
  - Unit-radius Tate noetherianity: owner AdicSpaces §0.5 (R02).
  - Layer 4 division, Strassmann's bound, entire division and monic entire resultants: owner this roadmap, consumed by NewtonPolygons, CompactOperators, LocallyAnalyticDistributions and QuaternionicModularForms.
  - ColemanIntegration cites two old `Suggested.lean` names; the description names it.
- **Source independence:** 16 passages compared with 6 sources (martin, bosch, wedhorn, ega, colmez, gk); none shared beyond formulas and statements of a dozen words. Largest share: bgr, 7 of 22 locators outside the references (text paywalled). Contents compared with bgr only through the README's own bgr section numbers: the ranges overlap (Layer 3 cites 5.1.2–5.1.3, inside the ranges of Layers 1–2), Layers 6–7 have no bgr counterpart, and the order Layer 3 → 4 → 5 is forced by the *Needs:* lines (§4 needs §3.1, §5.1 needs Layer 4). Result: independent.
- **Research link:** Layer 4 is Martin's Banach-ring Weierstrass theory (Martin 2016, §1.3), which he uses for overconvergent subanalytic sets in Berkovich spaces. §7.2's entire division and resultants are the series input of Coleman's Fredholm theory for p-adic families of modular forms (Coleman 1997, App. A3), consumed by CompactOperators. `W_n` in §7.3 is Große-Klönne's dagger algebra (2000). Based on the README and on martin and gk.

## Not verifiable

- bgr (Bosch–Güntzer–Remmert 1984) is paywalled and recorded as uncertified. The locators §§5.1–5.2, §5.2.5 (Rückert datum) and §7.1.1 were not read. The statements were checked against bosch §§1.2–1.3, gk 1.3–1.4 and by computation.
- coleman (1997), Appendix A3, is paywalled and uncertified. Entire division was checked by computation and against the pinned `existsUnique_entire_mul_add_eq`.
- huber (1996), §1.2, is paywalled and uncertified. It is cited only for the AdicSpacesPartII target.
- Ownership against the open revisions of NewtonPolygons, CompactOperators, LocallyAnalyticDistributions and AdicSpacesPartIV was checked with the roadmap grep tool only, because no checkout of those heads was given.

## Source issues

- none

## For the human reviewers

- **Not tested.** bgr, the source with the largest share of locators (7 of 22), is paywalled. Neither its wording nor its table of contents was compared; the arrangement was judged only from the README's own bgr section numbers.
- **Licence.** The Provenance section (README lines 1392–1403) links William Coram's public GitHub repository as prior work whose proofs may be reused "with attribution preserved". The repository's licence was not checked.
