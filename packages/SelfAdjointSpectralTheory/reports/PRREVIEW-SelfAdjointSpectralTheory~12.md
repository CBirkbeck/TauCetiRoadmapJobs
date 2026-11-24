# Review of SelfAdjointSpectralTheory (pull request #1854 at 9288dee)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 94 lines changed since `2f1f33b`; accepted. Both findings of the previous review are repaired: the graph core of SA-C39–SA-C40 is now separated from Mathlib's `LinearPMap.HasCore` for operators that are not closed, with the `ℓ²` example as a Check, and SA-B64 is again a target of this roadmap with its own needs. The two small corrections and the format note of the previous review are also taken up, and every new Teschl locator is on the stated page. One format note remains, not blocking; the licence question for the human reviewers stands as before.

## N01 — "the integral has norm one" in SA-E37 reads as a statement about `C_{B,c}`

In SA-E37 (line 1709) the sentence "The bound holds because the integral has norm one" means that the map from bounded Borel symbols to operators has norm one (Teschl2009, Theorem 3.1, line 3694); read literally it speaks of the operator `C_{B,c}`, and on `H = 0` the map has norm `0`. "because the integral is norm-decreasing on bounded symbols, `‖∫ f dP‖ ≤ sup |f|`" would say what is used, as SA-E40 already does.

## Previous findings

- R01 — repaired: SA-C39 now reads "For closed `A` this is Mathlib's `LinearPMap.HasCore A D` … For closable `A` that is not closed … `HasCore A D` holds for no `D`"; SA-C40 cites `LinearPMap.closureHasCore`.
- R02 — repaired: SA-B64 ends "*Needs:* SA-B39, SA-B81, SA-B83; Mathlib `MeasureTheory.VectorMeasure.withDensity`, …"; Scope lists "weighted regular measures" as owned, and the V2.BorelCalculus lists no longer name it.
- C01 — repaired: "its items SA-B54–SA-B57 also need B.1, B.3 and B.5"; How to read the build names SA-B32–SA-B33, SA-D01–SA-D02, BanachAlgebras §8.1 and SA-A21.
- C02 — repaired: the description names the four folded sections and the textbooks no longer listed.
- N01 — repaired: SA-C20, SA-C34, SA-C87, SA-E12, SA-E13, SA-E37, SA-E39 and SA-E40 carry Teschl2009 locators.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| SA-C39 and its Check | identity on finitely supported sequences of `ℓ²`; identity on `ℓ²` with `D` finitely supported | first: sequential core yes, closure of restriction is identity on `ℓ²` `≠ A`; second: both hold | notions agree for closed `A` only, as now stated | none |
| SA-C39, "holds for no `D`" | `A` closable, not closed | `(A.domRestrict D).closure` is closed (pin: `closure` chooses a closed extension, line 93), `A` is not | true | none |
| SA-C40 | pin `closureHasCore` (line 152) | `f.closure.HasCore f.domain`, no closability hypothesis; closed `A`: `A.closure = A` | true | none |
| SA-C42 | sequential core `D`, closed set `S ⊇ graph(A|_D)` | `(x, Ax) = lim (x_n, A x_n) ∈ S`; both Tau Ceti names present in `LinearPMap/GraphCore.lean` | true | none |
| Milestone B1: SA-B64 | `K` a point, `μ = m δ`, `g = c`; `g = 0` | `|cμ| = |c||m|`; `∫ f d(gμ) = f c m = ∫ f g dμ`; `g = 0`: both `0`; pin gives `(μ.transpose B).variation.withDensity ‖g‖ₑ`, then `variation_transpose_eq` | true; needs exist at pin | none |
| Milestone C1: SA-C20 | `U = e⁻¹`, `Ã = e⁻¹ A e` | `U A = e⁻¹A = Ã U`; `U dom A = e⁻¹(dom A) = dom Ã`; Teschl (3.30) l.3781 p.92 | true | none |
| Milestone C1: SA-C34 | Teschl l.2606 p.64 | `‖(ψ,Aψ)‖² = ‖ψ‖² + ‖Aψ‖²` on both sides | true | none |
| Milestone C5: SA-C87 | `T = diag(1,2)`; `n = 0` | `T*T = diag(1,4)`, `sup ⟪x,T*Tx⟫ = 4 = ‖T‖²`; Teschl (2.91) l.3183 p.77; `n = 0`: `0` | true | none |
| SA-E12 | `diag(0,1)`, `c = 1`, `c = 1/2` | `c=1`: bound holds, `P((1,∞)) = 0`; `c=1/2`: fails at `e₂`, `P((1/2,∞)) = e₂₂` | true | none |
| SA-E13 | `diag(0,1)`, `B = {1}`, `β = α = 1`; `B = ∅` | `⟪e₂, A e₂⟫ = 1`; empty: range `0`; Teschl (3.50) l.3996 p.97 | true | none |
| Milestone E3: SA-E37 | `diag(0,1)`, `B = {1}`, `c = 0`, `r = 1`; `H = 0` | `C = e₂₂`, norm `1 ≤ 1`; `H = 0`: symbol map has norm `0` | bound true; wording | N01 |
| Milestone E3: SA-E39, SA-E40 | `diag(0,1)`, `δ = 1/2` | `G = diag(0,1)`, `A G = e₂₂ = P({|s| ≥ 1/2})`; `‖G‖ = 1 ≤ 2`; Teschl l.4028 p.97 | true | none |

The rows for the untouched statements stand as in the previous review, of `2f1f33b`.

- Source locators checked against the text: 8 new Teschl2009 locators (lines 2606, 3170, 3183, 3687, 3781, 3996, 4028, 4030), all on the stated printed page.
- Library declarations opened at the pin: `LinearPMap.closure`, `HasCore`, `closureHasCore` (Mathlib `Topology/Algebra/Module/LinearPMap.lean`, lines 93, 141, 152); `VectorMeasure.withDensity`, `withDensity_congr`, `variation_withDensity` (`MeasureTheory/VectorMeasure/WithDensityVec.lean`, lines 42, 70, 354); `variation_transpose_eq` (`MeasureTheory/VectorMeasure/Integral.lean`, line 208); the two Tau Ceti `HasCore` lemmas of SA-C42.
- Internal citations of the changed passages resolved: SA-B39, SA-B81, SA-B83 (all realised in Tau Ceti or Part B, none depending on SA-B64), the Dependencies paragraphs of Parts A–E against the new sentence in How to read the build.
- Seeded sample: of the listed milestones the diff touches B1 (SA-B64), C5 (SA-C87) and E3 (SA-E37–SA-E40); checked above.
- Record: 274 item ids present, as before; no layer added, removed or reordered.
- Pull request text: the SelfAdjointSpectralTheory paragraph agrees with this head (29 *Supplied by:* lines, the folded sections and the reference change stated).
- Automatic checks: all passed on this head. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. No change outside the pull request's own folders.
- Elaboration: `Suggested.lean` exits 0 with 6 warnings, all `sorry`; the file is unchanged since `2f1f33b`, so signatures and the one-tactic probe stand.

Overlap check: read SchrodingerOperatorsAndSpectralTypes (open), OneParameterSemigroups (open and completed), VonNeumannAlgebras, UnboundedOperators, SpectralSubspacePerturbation and the OperatorTheory index, as in the previous review; the change moves one object, the weighted regular measures of SA-B64, owner now this roadmap alone (VonNeumannAlgebras V2.BorelCalculus does not state it). Other shared objects as before: bounded Borel calculus and representation measure, owner VonNeumannAlgebras; resolvent predicate of the spectral measure, owner this roadmap; support equal to spectrum, owner UnboundedOperators §1.6; Sylvester solvability, owner SpectralSubspacePerturbation. QuantumHarmonicOscillator and the open revision of VonNeumannAlgebras were not given with files and were not read.

Source independence: changed passages only; 9 passages compared with 1 source (Teschl2009), none shared beyond formulas; largest share Teschl2009; arrangement not compared, the change adds, removes and reorders no layer. Conway1990 and Schmudgen2012 could not be read.

Research link: the spectral theorem and Stone's theorem in the form of Teschl 2009 (Theorems 3.7, 5.1, 5.2) and Schmüdgen 2012 (Theorem 5.7); prerequisites of the Davis–Kahan and Rosenblum theorems of SpectralSubspacePerturbation and of UnboundedOperators. Rests on the README's scope section and Teschl2009.

## Not verifiable

- Conway1990, Theorem IX.1.14: recorded as uncertified, no legal open copy.
- Schmudgen2012, Theorem 5.7: recorded as uncertified, no legal open copy.

## Source issues

- **Gap** in Teschl2009 at Theorem 2.18, p. 77: the source says that for symmetric `A`, `A − E ≥ 0` holds exactly when the spectrum lies in `[E, ∞)`; it should assume `A` self-adjoint for that equivalence, since a closed nonnegative symmetric operator that is not self-adjoint has nonreal spectrum; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean` carries the header "Copyright (c) 2026 Kitware, Inc." and the README's References name the AIQ DKPS formalization (Kitware, Apache-2.0) and the Spectra project (Adam Bornemann, Apache-2.0) as prior formalisations; both were on main already.
