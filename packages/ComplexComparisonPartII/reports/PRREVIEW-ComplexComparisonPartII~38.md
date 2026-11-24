# Review of ComplexComparisonPartII (pull request #3027 at c4d2f89)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 1603 changed lines since `74a09b7`. The previous review's finding is repaired. Hörmander's theorem (C7.1 (a), (b)) and its form with the datum measured by the Levi form (C7.2) are now stated in `Suggested.lean`, with a distributional `∂/∂z̄_j`. I checked their signs and normalisations at the pins and against sharp examples, and reran computed instances on the other new statements (C-1.5, C0.1a, C5.4a–C5.4j, Layer C7). I also checked for the first time the Demailly 1982 and Skoda 1972 locators, against their Numdam copies. One new finding blocks: C7.15 requires `φ < φ_m` at every point, which is false wherever `φ` has Lelong number above `2n/m`; the cited source makes the same slip. There is one small correction and no format note, and nothing is left for a human to decide.

## R01 (P1) — C7.15 requires the strict inequality `φ < φ_m`, which fails wherever `φ` has Lelong number above `2n/m`

As written, Demailly's global approximation theorem cannot be proved for any `φ` with a positive Lelong number. The statement (README line 5506) asks for `φ < φ_m ≤ sup_{|ζ−x|<r} φ(ζ) + C(|log r|/m + r + ε_m)` together with `ν(φ, x) − 2n/m ≤ ν(φ_m, x)`. Suppose `ν(φ, x) > 2n/m`. Then `ν(φ_m, x) > 0`, and a positive Lelong number forces the value `−∞` (C5.4e (b)). So `φ_m(x) = −∞ = φ(x)`, and the strict inequality fails at `x`.

Here is an instance. Take `X = ℙ¹` (`n = 1`) and `γ = 0`. Let `φ` be the logarithm of the Fubini–Study norm squared of a section of `O(1)` that vanishes at `x`, and `α` the multiple of the Fubini–Study form with `α + i∂∂̄φ ≥ 0`. Then `ν(φ, x) = 2`, so `ν(φ_m, x) ≥ 2 − 2/m > 0` for every `m ≥ 2`. The cited source has the same strict inequality (*Analytic Methods*, Th. 14.12 (a), p. 142, demailly-analytic-methods line 7120). It holds only where `φ(x) > −∞`.

The smallest repair is `φ ≤ φ_m`, or "`φ(x) < φ_m(x)` wherever `φ(x) > −∞`". No consumer needs the strict form. SingularHermitianMetricsAndL2Methods §7.3 (line 2032) quotes C7.15 with the same inequality, so the same change belongs there; that folder has a review of its own.

## C01 — The citation for C7.1 (b) points to a theorem for smooth weights, while (b) is stated for every plurisubharmonic weight

C7.1 (b) (README line 5031) and the docstring of `hormanderL2_strict` (`Suggested.lean` line 271) cite Demailly, VIII.6.5 with (6.4). That theorem assumes a smooth weight (demailly-agbook lines 18476–18477), whereas `hormanderL2_strict` allows any `φ` with `φ − c|z|²` plurisubharmonic. The statement is true: the decreasing regularisation in C7.1's route closes the gap, as in the last step of the proof of VIII.6.9 (lines 18561–18563). But an implementer who opens the citation will find only the smooth case. Adding "for smooth `φ`; the general case by the regularisation of the route" to both citations would fix this.

## Questions for the author

- C5.4j (a) and (b) are cited as Theorems 1 and 2 of Błocki–Kołodziej 2007, in that order. Is that right? The DOI resolves to the AMS journal page, a host I cannot certify, so I could not open the paper.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `dbarDistribution` (C7.1) | `z̄`, `z` on `ℂ`; unfolded on a test function by `rfl` | `½(1 + i·(−i)) = 1`, `½(1 + i·i) = 0`; `lineDerivCLM v T f = −T(∂_v f)`; `(c • T) f = c·T f` by `rfl` | correct sign and normalisation; Check true |
| `hormanderL2` (C7.1 (a)) | `n = 0`; `Ω = ∅`; `φ ≡ ⊥`; `ℂ`, `φ = |z|²`, `g = 1` | point of mass 1: `u = 0` gives `0 ≤ 0`; `⊥` forces `g = 0` a.e.; `u = z̄`: LHS `< π` = RHS | holds; Hörmander's `(1 + |z|²)^{−2}` form |
| `hormanderL2_strict` (C7.1 (b)) | `ℂ`, `φ = c|z|²`, `g = 1`, every `c > 0` | least solution `z̄` (orthogonal to `z^k`): LHS `π/c²`, RHS `(1/c)(π/c)`; `c` in place of `c⁻¹` fails for `c < 1` | sharp; holds |
| `hormanderL2_leviNorm` (C7.2) | `ℂ`, `φ = |z|²`, `v = 1`; `φ = 0`; `diag(a, b)` on `ℂ²` | `Re leviForm = (D²(ξ,ξ) + D²(iξ,iξ))/4 = |ξ|²`; `π = π`; `θ = 0` forces `v = 0`; sup gives `|v₁|²/a + |v₂|²/b` | holds; normalisation sharp |
| C7.15 (R01) | `ℙ¹`, `φ` with `ν(φ, x) = 2`, `m ≥ 2` | `ν(φ_m, x) ≥ 2 − 2/m > 0` ⇒ `φ_m(x) = −∞ = φ(x)`; `<` false | false as stated; same slip in AM 14.12 (a) |
| C7.13 (a), (b) | AM 14.2 with weight `e^{−2mφ}` translated | doubling: `2ν − 2n/m ≤ 2ν_m ≤ 2ν`; `C₂ = n!/πⁿ` from `vol B(z, r)` | holds; pp. 136–137 |
| C7.14 | `φ_m = (1/m)log Σ|σ_k|²` | `ν(φ_m) = (2/m)·min ord σ_k ≥ a` iff derivatives of order `< ma/2` vanish; `⋂_m` equals `E_c` both ways | holds |
| C7.6, `skodaDivision` | Skoda Th. 1; `p = 1`; `n = 0` | exponents `−2αq − 2`, `−2αq`, constant `α/(α−1)` match; `p = 1`: `h = f/g`, `I ≤ αI/(α−1)` | holds; pp. 555–556 |
| C7.7 Check | unit polydisc, `φ = 0`, `f = 1` | `∫|F|² ≥ π·π^{n−1}` by sub-mean value in `z_n`; `F = 1` gives equality; constant `π/c_D(0)² = π` | true |
| C5.4e (c), (k) | `u = log|z|²` on `ℂ²`; `c·log|z|²`, `c·log|z₁|²` | `Δu = 4/r²`, `σ_T(B_r) = 2πr²`, ratio to `πr²` is `2 = ν`; `n/c = 2n/ν`, `1/c = 2/ν` | holds |
| C5.4e (g)–(i), C5.4g (d) | `u = c·log|z|²`; AM Lemma 5.6 with the weight halved | `e^{−u} = |z|^{−2c}` integrable iff `ν = 2c < 2n`; thresholds `2`, `2n`, `2(n + s)` | holds |
| C5.4f (b), (d) | `‖s‖² = |f|²e^{−φ}`; Kodaira's lemma | `(i/π)∂∂̄log|f| = [div s]`, `(i/π)∂∂̄(φ/2) = c₁`; `i∂∂̄log|f_E|² = 2π[E]` | holds |
| C-1.5 Checks | `f = z₂²`, `g = z₂² − z₁³`; lines `z₂ = az₁`; cusp | `|a² − z₁| ≥ |a|²/2` for `|z₁| ≤ |a|²/2`; `g(t², t³) = 0`, `f = t⁶` | true |
| C0.1a, C7.4, C7.5, C7.15a, C7.16 locators | demailly-agbook II.3.22; Demailly 1982 | agbook line 4351 (p. 90); 1982: Th. 1.3, 1.5, Rem. 1.6, Prop. 1.4, 1.6, Th. 4.1, Rem. 4.2, 5.1, Lemme 3.2, 6.9, Th. 9.1 | all on the cited pages, as stated |
| `CurrentCalculus` (sample; cross-references added) | I §2.D.3, I (3.20), III (1.21)–(1.22) | agbook lines 818 (p. 19), 1095 (p. 25), 6761 and 6781 (pp. 135–136) | as cited |

- Earlier findings: R01 repaired. `hormanderL2` and `hormanderL2_strict` state C7.1 (a), (b), and `hormanderL2_leviNorm` states C7.2. The docstring now names only C7.1's `(p,q)` clause, C7.3–C7.5 and C7.17 as not statable, and README lines 45–52 and 179–195 agree with it.
- Source locators checked against the text this round: 24. Demailly 1982 (Numdam): Th. 0.1/1.3, 0.2, Prop. 1.4, Th. 1.5, Rem. 1.6, Prop. 1.6, Lemme 3.2 (3.4), Th. 4.1, Rem. 4.2, Th. 5.1, Lemme 6.9, Th. 9.1 (12). Skoda 1972 (Ann.) (Numdam): Lemme 1, Th. 1 (2). demailly-agbook: VIII.6.1, VIII.6.5, (6.4), VIII.6.9, II.3.22, I §2.D.3, I (3.20), III (1.21)–(1.22) (8). demailly-analytic-methods: Th. 14.2, Th. 14.12 (2).
- Library declarations opened at the pins: 9. Tau Ceti: `TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean:119`), `re_leviForm_apply` (:128), `leviForm_apply_self` (:142). Mathlib: `Distribution` (`Mathlib/Analysis/Distribution/Distribution.lean:166`), `mapCLM` (:189), `lineDerivCLM` (:235), `lineDerivCLM_apply` (:239), `ofFun` (:303), `ofFun_eq_zero` (:312).
- Cross-roadmap citations resolved at this head, 25 distinct: ComplexKahlerGeometry §§3.1, 3.4, 3.5, 3.5a, 4.2a, 7.2 and K2, K3, K4, K5a, K5b.0, K6.0 (§§3.5a and 4.2a are added by this pull request); PDE §§3.2a, 3.4, 3.4a; RealAnalyticGeometry R3.1, R3.2; ComplexHessianEquations §§5.4, 7.1 (on `main`; each states what C5.4b and C5.4e (j) take); AlgebraicModuliForArithmeticGeometry §§1.5, 1.6 (`bigLineBundle`), 9.10 (`algebraicMultiplierIdeal`); ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`, with no UPWARD or CYCLE line. No file outside the folders named in the pull request is changed.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean` gives ten `sorry` warnings and nothing else. I ran `#check @` on `dbarDistribution` and the three new theorems; each matches its README statement and keeps every binder. A one-tactic `simp` probe on `hormanderL2` fails. The other six declarations are unchanged since the previous review.
- Record: the README at the merge base has 8 layers, and the head keeps every id and title. The change adds 33 headings, including Layer C7, and removes none. The 38 deleted lines are each replaced by an extended version.
- Seeded sample: 13 of the 15 targets lie in text the change does not touch or affect. Two targets are in affected text: `CurrentCalculus`, which gained cross-references to C5.4a and C5.4c, and the adjacent `closedCurrentExtension`. Both were checked above.

Overlap check: I read SingularHermitianMetricsAndL2Methods (`main` and this head), ComplexKahlerGeometry (this head; #2536 also changes it), RealAnalyticGeometry, ComplexHessianEquations, and #3036's version of this README. AbelianSchemesAndArithmeticModuli, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology and InverseGaloisAndArithmeticFundamentalGroups (#3036) came up on vocabulary only, and I compared only their titles with this roadmap's objects.

SingularHermitianMetricsAndL2Methods states counterparts of C5.4a–C7.18, but each counterpart cites this roadmap as its supplier (for example §6.2, "This is ComplexComparisonPartII §C7.9", with C7.9 in its *Needs:*), and this roadmap cites that roadmap nowhere. This roadmap therefore owns plurisubharmonic functions, Lelong numbers, singular metrics, multiplier ideals, the `L²` theorems and curve selection. RealAnalyticGeometry R3.1 owns only the smooth-weight theorem on complete Kähler manifolds, which C1.4 and C7 extend. ComplexHessianEquations names Layer C5.4 only to say it does not build it. #3036 edits only *Needs:* lines in Layers C-1 to C6, which this change does not touch.

Source independence: changed passages only. I compared 12 passages with 4 sources and found no shared run beyond what the statements force. The passages: C0.1a; C7.1 (b) and the `hormanderL2_strict` docstring; C7.4; C7.5; C7.6; C7.13; C7.15; C7.15a; C7.16; the `hormanderL2_leviNorm` docstring; the `dbarDistribution` docstring; C-1.5. The sources: demailly-agbook, demailly-analytic-methods, Demailly 1982 and Skoda 1972. C7.15a lists the clauses of Demailly 1982 Th. 9.1 in English, as the theorem's statement forces. Largest share: *Analytic Methods*, about 21 of 67 citations in the added lines. Contents compared with *Analytic Methods*, because the change adds Layer C7: C7 draws on its §§5, 13, 14 and 15 out of the source's order, and on Hörmander, Skoda, Błocki, Guan–Zhou and Demailly 1982 for C7.1–C7.7, C7.12 and C7.15a. Independent.

Research link: Layer C7 states the `L²` theory that current work on multiplier ideals and positivity builds on: Hörmander 1965, Skoda's division theorem (1972), Ohsawa–Takegoshi (1987) with Błocki's optimal constant (2013), Nadel coherence and vanishing (1990), Demailly's approximation (1992), Siu's analyticity theorem (1974) and Guan–Zhou's strong openness (2015). This rests on the README's references and on *Analytic Methods*.

## Not verifiable

- Błocki–Kołodziej 2007 (C5.4j (a), (b)): the DOI resolves to the AMS journal page, a host I cannot certify.
- Błocki 2013 (C7.7), Fornæss–Narasimhan 1980 (C5.4d, C5.4j (c)), Hörmander's *Introduction* (C5.4e (j), C7.1 (a)) and Lazarsfeld I–II: paywalled.
- Cited by name and not opened: Demailly 1992, 1994, 2000, 2015; Ohsawa–Takegoshi 1987; Manivel 1993; Nadel 1990; Demailly–Ein–Lazarsfeld 2000; Siu 1974; Lelong 1957; Grauert–Remmert 1956; Richberg 1968; Hiep 2014; Guan–Zhou 2015 (Ann. 181). I checked their *Analytic Methods* counterparts instead.

## Source issues

- **Misprint** in demailly-analytic-methods at Theorem 14.12 (a), p. 142: the source says the approximants satisfy a strict inequality `φ(x) < φ_m(x)` at every point; it should be `≤`, strict only where `φ(x) > −∞`, since both are `−∞` where `ν(φ, x) > n/m`; affects a stated result.

## For the human reviewers

- none
