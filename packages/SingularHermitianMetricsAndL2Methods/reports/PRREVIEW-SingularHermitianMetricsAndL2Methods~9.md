# Review of SingularHermitianMetricsAndL2Methods (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 1400 changed lines since `b8f3652`. Checked: every changed statement, Origin and Corollary line; the five removed sections against the general sections said to state them; the seeded sample against its sources; the build; and the dependency check. Two findings block, both in new text. The narrowed statement of 0.4 ends with a clause that is false as written (or vacuous, depending on how it is read). The sentence of 7.3 that summarises ComplexComparisonPartII §C7.15 claims a strict inequality that §C7.15 itself refutes at poles. There are three small corrections and no format notes. The human reviewers' decision on sections that leave the family was applied: the five removed sections are each stated in full where the README points.

## R01 (P2) — The last clause of 0.4's statement is false for chart potentials and vacuous for a global function

An implementer of 0.4 (the form that [FormalProof] has) would be asked to prove a clause that has no proof without a hypothesis the README leaves out. The clause, at line 350, reads: "for every smooth `w` and every smooth `Ω` with `i∂∂̄Ω > 0` in the charts there is a constant `C` with `i∂∂̄(w + C·Ω) ≥ 0`".

- **If `Ω` is one smooth function on the compact `X`,** the hypothesis never holds. At a maximum point of `Ω` the Levi form is `≤ 0`, so the clause says nothing.
- **If `Ω` is a family of chart potentials, as `θ` is,** the clause is false. Take `ℙ¹` with its two standard charts and the coordinate `z` on the first. Choose `Ω₀` with `i∂∂̄Ω₀ = e^{−|z|²}·i dz ∧ dz̄ > 0`, and a smooth `w` on `ℙ¹` equal to `−1/|z|²` near `∞`. In that chart `i∂∂̄w = −|z|^{−4}·i dz ∧ dz̄`. So `w + C·Ω₀` has Levi coefficient `−|z|^{−4} + C·e^{−|z|²}`, which is negative for `|z|` large, whatever `C` is.

The Method label speaks of "a compactness bound for the quotient of two Levi forms", so the formal proof works with some uniformity that the statement drops. The smallest repair is to state that uniformity. For example: the chart domains are relatively compact in larger charts on which `w` and the `Ω_i` are smooth with `i∂∂̄Ω_i > 0`. Or: `i∂∂̄Ω_i ≥ c·i∂∂̄|z|²` with `c > 0`, and the Levi form of `w` is bounded on each chart. Use whichever the formal proof actually has.

## R02 (P2) — 7.3 credits ComplexComparisonPartII §C7.15 with `φ < φ_m` everywhere, which fails at the poles of `φ`

A reader relying on 7.3 is told that the cited theorem gives a strict inequality that cannot hold. The sentence at line 2028 says that §C7.15 provides functions with analytic singularities "with `φ < φ_m ≤ sup_{|ζ−x|<r}φ(ζ) + …`".

Suppose `ν(φ, x) > 2n/m`. Then the Lelong bound in the same sentence gives `ν(φ_m, x) > 0`, so `φ_m(x) = −∞ = φ(x)`. ComplexComparisonPartII §C7.15 accordingly states `φ ≤ φ_m`, strict only where `φ(x) > −∞`. Its own Check works this example on `ℙ¹` with `φ = log|s|²_h`.

The strict form comes from Demailly 1992, Proposition 3.7 (i), and [AMAG] Th. 14.12 (a), which both print it (see Source issues). Repair: write "`φ ≤ φ_m ≤ …`, with `φ < φ_m` where `φ > −∞`".

## C01 — The description does not say what this roadmap loses or which suppliers it gains

A reader of the description cannot learn that this roadmap's sections 1.3, 4.3, 7.2, 7.6 and 9.5 are removed. The description also says "Section numbers are unchanged". Nor can the reader learn that the roadmap gains two suppliers, ArakelovGeometryAndAbelianHeights (§§5.1a–5.1d) and HeightsRationalPointsAndObstructions (§§5.17c.2–5.17c.6). On `main` neither had a supplier subsection. It also drops supplier sections: ComplexHessianEquations Layer 7, AlgebraicModuliForArithmeticGeometry §1.6, ClassicalArithmeticCompletion §6.20, and ComplexKahlerGeometry K2 and K7.2.

A sentence that would make it right: "SingularHermitianMetricsAndL2Methods: 1.3, 4.3, 7.2, 7.6 and 9.5 leave it for ComplexComparisonPartII §C5.4e (k), HeightsRationalPointsAndObstructions §5.17c.3, ComplexComparisonPartII §§C7.14 and C5.4i, and HeightsRationalPointsAndObstructions §5.17c.7. It gains ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions as suppliers."

## C02 — The README names the new homes of 7.6 and 9.5 only through ranges

The scope list names Richberg's theorem only inside "§§C5.4a–C5.4j" (line 2951), and Demailly's characterisation of big line bundles only inside "§§5.17c.2–5.17c.7" (line 2985). The complex singularity exponent appears by its exact clause only in 6.3(d). Someone looking for the former 7.6, 9.5 or 1.3 has to search those ranges. It would help to name the exact sections in the scope list: §C5.4i, HeightsRationalPointsAndObstructions §5.17c.7 and §C5.4e (k).

## C03 — The Labels paragraph misdescribes 2.3 and 8.4

The paragraph at lines 140–146 has two slips:

- It counts 2.3 among the sections that "state published theorems", but 2.3's own Origin says "adapted from" Lelong and [AMAG] (3.11).
- It says 7.4's wider form is something "7.7 and 8.4 rest on". 8.4 needs only 4.2 and 7.5. It mentions 7.4 only to explain why the Stein hypothesis is needed.

Either align the labels or drop 8.4 from that clause.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.4, last clause (`w + C·Ω`) | `ℙ¹`, standard charts, `w = −1/|z|²` near `∞`, `i∂∂̄Ω₀ = e^{−|z|²}` | Levi coefficient `−|z|^{−4} + Ce^{−|z|²} < 0` for large `|z|`; global `Ω`: Levi `≤ 0` at its maximum | false or vacuous: R01 |
| 0.4, iff and closure | `u ∈ C²`, `γ = i∂∂̄θ` | `γ + i∂∂̄u = i∂∂̄(θ + u)`; `M_η(θ+u₁, θ+u₂) = θ + M_η(u₁,u₂)` | holds |
| 0.6 (i), (ii) | cone `xy = z²`, disc `g` | `Levi(φ∘g)(ξ) = Levi(φ)(dg ξ) ≥ 0`, since `df(dg ξ) = 0` | holds |
| 1.1 (polydisc maxima) | `u = |z₁|²`, `u = Re z₁` on `ℂ²` | `M(e^s) = e^{2s}`, `e^s`: convex, nondecreasing, tend to `0 = u(0)` | holds |
| 1.2 (form of [FormalProof]) | `c = n`, `n − ½`, `≤ 0`; `f = z₁`, `f = 1` | `∫r^{−1}dr = ∞`; `∫r⁰dr = 1`; `|z₁|²|z|^{−2n} ≤ |z|^{2−2n}` integrable, `f(0) = 0` | holds |
| 1.2 Corollary claim on §C5.4e (g) | `u = c·log|z|²` | `ν = 2c < 2` iff `c < 1` | holds |
| 2.2 (form of [FormalProof]) | `s = z` on `ℂ`; `s = (z₁, z₂)` | `i∂∂̄φ = i∂∂̄φ₀` off `0`; Levi form of `log|z|²` `≥ 0` | holds |
| 2.6 (form of [FormalProof]) | `O(1)`, `O(−1)` on `ℙ¹` | deg `1 ≥ 0`; for `O(−1)`, `∫c₁ = −1` excludes the hypothesis | holds |
| 7.3, sentence on §C7.15 | `ℙ¹`, `φ = log|s|²_h`, `ν = 2`, `m ≥ 2` | `ν(φ_m) ≥ 2 − 2/m > 0`, so `φ_m(x) = −∞ = φ(x)` | strict `<` fails: R02 |
| 7.4 (ii) against the wider form | bounded `φ`, smooth `γ` | `λ_r ≤ 2sup|φ|/log(r₀/r)`; `m_γ(Cr) ≤ Cr`; loss `≤ C/log(1/r) + Cr` | consistent |
| 7.4 (i) constants | `|s_j| < 1/2` | `log log(1/|s|²) ≥ log log 4 > 0`; `ε(t) → 0` | consistent |
| 3.5 against Demailly1982 Th 4.1, Rem 4.2 | constant `ε` | `(1/q)ε^{−1} = 1/(qε)`; pp. 472, 485 | matches |
| 3.8a Origin against Berndtsson Th 3.1 | `s = δ` | constant `4/(δ(1−δ)²)`, p. 1091; README `1/(s(1−√s)²)` is no larger | matches |
| 6.1 against AMAG Lemma 5.6 | weight `e^{−2φ}` vs `e^{−φ}` | `ν < 1`, `n + s`, `E_n ⊂ V ⊂ E_1` become `2`, `2(n+s)`, `E_{2n}`, `E_2` | matches |
| 7.1 against AMAG Th 14.2 | the factor 2 | `(1/m)log(C₂/r^n)`, `ν − n/m` become `(1/m)log(C₂/r^{2n})`, `ν − 2n/m` | matches |
| 6.4, 6.5, 6.6, 8.3 locators | AMAG (15.1), 15.2(b), Cor 5.12; Guan–Zhou Th 1.1 | pp. 158, 159, 40; pp. 1–2 of v1, weight `e^{−φ}` | match |
| 9.2 against Bouche, HRPO §5.17c.5 | `O(1)` on `ℙ¹`, `dV = ω_FS` | `B_k = k + 1`, `k^{−1}B_k → 1`; Théorème principal p. 118, uniform | holds |
| 2.2, 2.3 locators | AMAG Def 1.10, (3.11), Def 3.12 | pp. 8, 26, 26; `(i/π)∂∂̄log‖s‖ = (i/2π)∂∂̄log‖s‖²` | match |
| Former 1.3 → §C5.4e (k) | `g = z₁^a z₂^b` on `ℂ²` | `ν = 2(a+b)`, `c = 1/max(a,b)`, `1/(a+b) ≤ c ≤ 2/(a+b)` | stated in full |
| Former 4.3 → HRPO §5.17c.3 | unit disc at `0` | `c² = 1 = π·(1/π)` | stated in full |
| Former 7.2, 7.6, 9.5 | `E_c`; Richberg; `O(1)` vs `O` on `ℙ¹` | §C7.14 = old 7.2; §C5.4i `u ≤ v ≤ u + δ`; §5.17c.7 iff | stated in full |
| 5.3 Corollary (transpose) | `H′ = Hᵀ` | `H′^{−1}∂H′ = ((∂H)H^{−1})ᵀ` | holds |
| Headline 4.1 (§C7.7) | unit polydisc, `φ = 0`, `f = 1` | `∫|F|² ≥ π·vol(Δ^{n−1})`, equality at `F = 1`; `π/c_D(0)² = π` | holds |
| Headline 8.1 (§C7.16) | `ℂ`, `φ = |z|²`, `g = dz̄` | least-norm `u = z̄`, `∫|z̄|²e^{−|z|²} = π = ∫e^{−|z|²}` | holds |

- Source locators checked against the text: 20. These are [AMAG] Def 1.10, (3.11), Def 3.12, Lemma 5.6, Prop 5.7, Th 5.11, Cor 5.12, Th 14.2, Th 14.12, (15.1) and Th 15.2; Demailly1982 Th 4.1, Rem 4.2 and Lemme 6.9; Demailly1992 Prop 3.7; Demailly1994 Th 1.1; GuanZhou2015 Th 1.1; Skoda1972 Prop 7.1; Berndtsson 1996 Th 3.1; Bouche 1990 Théorème principal.
- Cross-roadmap citations resolved at this head: 42.
  - ComplexComparisonPartII §§C5.4a–C5.4j and C7.1–C7.18.
  - HeightsRationalPointsAndObstructions §§5.17c.2–5.17c.7.
  - ArakelovGeometryAndAbelianHeights §§5.1a–5.1d.
  - PDE §§3.2a and 3.4a; ComplexKahlerGeometry §§3.5a and 4.2a.
  - The five removed sections' destinations, each read in full.
- No other roadmap cites the removed sections 1.3, 4.3, 7.2, 7.6 or 9.5. A grep of this head and the overlap report agree.
- Overlap check: read ComplexKahlerGeometry, MinimalSurfaces and HeightsRationalPointsAndObstructionsPartII (open), and HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and ComplexHessianEquations (main). ComplexKahlerGeometry's finite mass of analytic sets is not this roadmap's Lelong theory. The general theorems this roadmap now cites are owned by ComplexComparisonPartII, HeightsRationalPointsAndObstructions, ArakelovGeometryAndAbelianHeights, PDE and ComplexKahlerGeometry, and the scope says so. Nothing else is shared.
- Dependency check output: `depcheck: 130 roadmaps, 1456 edges, 0 problem(s)`.
- Automatic checks: every check passed at this head.
- Elaboration: `lake env lean` of `Suggested.lean` printed nothing and exited 0. The file has no declarations, so there were no `#check` signatures to compare. The only change in it is the removal of the 4.3 sentence from the docstring. The four headlines (8.1, 6.2/8.2, 4.1/4.2, 9.1/9.2) remain named as not statable at the pins.
- Source independence: changed passages only. 9 passages were compared with 7 sources, with no shared wording beyond forced formulas. The largest share of citations is DemaillyAMAG (37). No layer was added, removed or reordered, so contents were not compared.
- Research link: Layers 3–8 restate the `L²` methods of Hörmander (1965), Demailly (1982), Ohsawa–Takegoshi (1987), Nadel (1990), Demailly (1992) and Guan–Zhou (2015), which the README says Alpöge's announced 2026 formal proof of RH for Dirichlet L-functions uses (README References, [FormalProof], [Announcement]).

## Not verifiable

- Grauert–Remmert 1956 (0.6, 7.7): no legal copy found by the sources service.
- Fornæss–Narasimhan 1980 (0.6): publisher paywall only.
- Błocki–Kołodziej 2007, Theorems 1–2 (7.4, 7.5, 7.7): the AMS host is in no licence class, and the landing page refused the request.
- Tian 1990, Zelditch 1998, Catlin 1999 (9.2) and Nadel 1990 (6.1): not fetched. Bouche and [AMAG] cover the claims sampled.
- The [FormalProof] declaration names in 7.4 and 8.3: that repository is not available here.

## Source issues

- **Error** in DemaillyAMAG at Th. 14.12 (a), p. 142: the source says `φ(x) < φ_m(x)` at every point; it should be `φ ≤ φ_m`, strict only where `φ(x) > −∞`, since both are `−∞` where `ν(φ, x) > n/m`; affects a stated result.
- **Error** in Demailly1992 at Proposition 3.7 (i): the same strict inequality `ψ < ψ_m` at every point; it should be `ψ ≤ ψ_m`, strict where `ψ > −∞`; affects a stated result.
- **Misprint** in DemaillyAMAG at Cor. 5.12, p. 40: the source says the target sheaf is built from `K_X + L`; it should be `K_X + F`, the bundle of Theorem 5.11; affects nothing.
- **Misprint** in DemaillyAMAG at the proof of Cor. 5.13, p. 40: the source cites Lemma 5.6 (b) for integrability and (a) for `J(φ)_x ⊂ m^{s+1}`; it should be (a) and (b) respectively; affects nothing.

## For the human reviewers

- The decision on sections stated in full in a general roadmap was applied. 1.3, 4.3, 7.2, 7.6 and 9.5 are stated in full at ComplexComparisonPartII §C5.4e (k), HeightsRationalPointsAndObstructions §5.17c.3, ComplexComparisonPartII §§C7.14 and C5.4i, and HeightsRationalPointsAndObstructions §5.17c.7, and the README names them (7.6 and 9.5 only within ranges).
- The "Method of the formal proof" labels describe an unpublished formalisation announced on 20 November 2026 (README References, [FormalProof] and [Announcement]). The theorems stated are from refereed sources.
- Not tested: Grauert–Remmert 1956, Fornæss–Narasimhan 1980 and Błocki–Kołodziej 2007 could not be read legally, so the wording comparison skipped them.
