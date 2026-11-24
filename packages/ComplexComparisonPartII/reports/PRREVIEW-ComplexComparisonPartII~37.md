# Review of ComplexComparisonPartII (pull request #3027 at f596230)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 1490 changed lines since `74a09b7`. I checked the repairs since the previous review: the curve selection lemma §C-1.5, the five new declarations of `Suggested.lean`, the closedness of the weighted Bergman spaces in C7.9 and the new Check in C5.4e. I also reran computed instances on the other new statements of C0.1a, C5.4a–C5.4j and Layer C7. All six remarks of the previous review are repaired, and every new statement, Lean signature and locator I tested holds. One finding blocks: Hörmander's `L²` theorem (C7.1), which `Suggested.lean` lists as not statable, can be stated at the pins with Mathlib's distributions and is absent. There are no small corrections or format notes, and nothing is left for a human to decide.

## R01 (P2) — Hörmander's theorem (C7.1) can be stated at the pins, but `Suggested.lean` calls it not statable and omits it

C7.1 is the theorem the whole layer rests on: C7.2–C7.13 route through it. The acceptance test leaves it out. The module docstring (lines 108–113) gives the reason that "the pins have Tau Ceti's `∂̄` on smooth forms and Mathlib's scalar distributions with real directional derivatives, but no `∂̄` on forms with distribution coefficients". README line 50 and the Lean bullet of the Conventions (lines 187–188) repeat it.

Nothing is missing. A `(0,1)`-form on an open `Ω ⊆ ℂⁿ` is a tuple `(g_1, …, g_n)` of functions, and `∂/∂z̄_j = ½(∂_{x_j} + i∂_{y_j})`. Mathlib provides both derivatives and the multiplication by `i`: `Distribution.lineDerivCLM` (`Mathlib/Analysis/Distribution/Distribution.lean:235`), `Distribution.mapCLM` (line 189) and `Distribution.ofFun` (line 303). The README's own `CurrentCalculus` (C5.4) already takes the chart coefficients of currents in `Distribution Ω ℂ ⊤`, differentiated by `Distribution.lineDerivCLM`. I appended the following to a copy of the file and elaborated it at the pins. It gave only the `sorry` warning.

```lean
open scoped Distributions

/-- `∂/∂z̄_j` of a complex-valued distribution on an open subset of `ℂⁿ`. -/
noncomputable def dbarDist {n : ℕ} {Ω : TopologicalSpace.Opens (EuclideanSpace ℂ (Fin n))}
    (j : Fin n) (T : 𝓓'(Ω, ℂ)) : 𝓓'(Ω, ℂ) :=
  (1 / 2 : ℝ) • (Distribution.lineDerivCLM (EuclideanSpace.single j (1 : ℂ)) T +
    Distribution.mapCLM (Complex.I • ContinuousLinearMap.id ℝ ℂ)
      (Distribution.lineDerivCLM (EuclideanSpace.single j Complex.I) T))

theorem hormanderL2 {n : ℕ} {Ω : TopologicalSpace.Opens (EuclideanSpace ℂ (Fin n))}
    (hΩ : IsPseudoconvex (Ω : Set (EuclideanSpace ℂ (Fin n))))
    {φ : EuclideanSpace ℂ (Fin n) → EReal} (hφ : IsPlurisubharmonicOn φ Ω)
    (g : Fin n → EuclideanSpace ℂ (Fin n) → ℂ) (hg : ∀ j, LocallyIntegrableOn (g j) Ω)
    (hclosed : ∀ j k, dbarDist k (Distribution.ofFun Ω (g j) volume ⊤) =
      dbarDist j (Distribution.ofFun Ω (g k) volume ⊤))
    (hI : ∫⁻ z in Ω, (∑ j, ‖g j z‖ₑ ^ 2) * EReal.exp (-φ z) < ⊤) :
    ∃ u : EuclideanSpace ℂ (Fin n) → ℂ, LocallyIntegrableOn u Ω ∧
      (∀ j, dbarDist j (Distribution.ofFun Ω u volume ⊤) = Distribution.ofFun Ω (g j) volume ⊤) ∧
      ∫⁻ z in Ω, ‖u z‖ₑ ^ 2 * EReal.exp (-φ z) * ENNReal.ofReal ((1 + ‖z‖ ^ 2) ^ (-2 : ℤ)) ≤
        ∫⁻ z in Ω, (∑ j, ‖g j z‖ₑ ^ 2) * EReal.exp (-φ z) := by
  sorry
```

The smallest repair is to add the definition and state C7.1 (a) in this form, or in the author's own. (b) can be added with the hypothesis that `z ↦ φ z − c‖z‖²` is plurisubharmonic. Then remove C7.1 from the docstring's list of results that cannot be stated, and from README lines 50 and 187–188. C7.2 for smooth `φ` can be stated the same way with `TauCeti.leviForm`. If it stays out, the docstring would need another reason. This is what remains of the previous review's R02: C7.6, C7.7 and C7.12 are now stated.

## Questions for the author

- C5.4j (a) and (b) are cited as Theorems 1 and 2 of Błocki–Kołodziej, in that order, with (a) for a positive continuous form on a compact complex manifold. Is that right? I could not open the paper from a host I may certify (the question is carried over unchanged).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §C-1.5 (a) | `f = z₁`, `g = (z₂)` on `ℂ²`; curves `(t,t)`, `(t,0)` | `|z₁| ≤ C|z₂|` fails near 0; `(t,t)`: `C_γ = 1`; `(t,0)`: `f∘γ = t`, `g∘γ = 0` | holds; VIII.10.7 pp. 396–397; AM (12.20) p. 122 |
| §C-1.5 second Check | `f = z₂²`, `g = z₂² − z₁³`; lines `z₂ = az₁`, `z₁ = 0`; cusp `(t², t³)` | lines: `|a²| ≤ 2|a² − z₁|` once `|z₁| ≤ |a|²/2`; cusp: `g∘γ = 0`, `f∘γ = t⁶` | Check true; lines do not suffice |
| §C-1.5 (b) and route | `z_ν` with `|g(z_ν)| ≤ |f(z_ν)|/ν`; finite projection of component `Y`, generic line `L` | `w(z_ν) → 0`; `π(Y∩{f=0}) ∩ L` discrete, so `f∘γ ≢ 0`; `w_j(0) = 0` | holds; GZ Lemma 2.11 p. 9; II.4.27 pp. 98–99 |
| C5.4e Check | `c·log|z|²`, `c·log|z₁|²` on `ℂⁿ` | `ν = 2c` both; `c(u,0) = n/c = 2n/ν` and `1/c = 2/ν`; with `e^{−2u}`: `n/ν`, `1/ν` | true; attains both bounds of (k) |
| C7.9 closedness | sub-mean value on `B(z,r)`, `φ ≤ M_K` | `vol B(z,r) = πⁿr²ⁿ/n!`; `∫|f|² ≤ e^{M_K}∫|f|²e^{−φ}` | holds; Cauchy ⇒ locally uniform |
| `IsPlurisubharmonicOn` | `u ≡ ⊥`; `ξ = 0`; Demailly I.5.1 (agbook line 1831) | `⊥` satisfies, as C5.4a says; `ξ = 0` trivial; inf of majorant means = upper integral | matches I.5.1 with affine discs |
| `IsPseudoconvex` | `Ω = ∅`; `ℂⁿ` with `‖z‖²`; ball with `−log(1 − ‖z‖²)` | `K = ∅`; sublevel sets are closed balls inside `Ω` | correct |
| `skodaDivision` | `p = 1`; `p = 0`; `n = 0`; `n = 1, p = 2, g = (z,0), f = z³, φ = |z|², α = 2` | `q = 0`, `h = f/g`; `p = 0` forces `Ω = ∅`; `I = π`, `h = (z²,0)` gives `π ≤ 2π` | holds; exponents `−(αq+1)`, `−αq` match README |
| `ohsawaTakegoshi` | disc of radius `r`; `D = Δ∖{½}`; `m = 0` | `perronSolution ≡ log r`, constant `πr²`; `Δ∖{½}`: `max(ε log(|z−½|/2), −M)` gives `h(0) = 0`; `m = 0`: unit Dirac mass | holds; Błocki Th. 1 constant `π/c_D(0)²` |
| `strongOpenness` | `φ = log|z|²` on `ℂ`; `φ ≡ ⊥` | `F = 1`: both sides fail; `F = z`: both hold for `ε < 1`; ⇐ by `e^{−φ} ≤ e^{εM}e^{−(1+ε)φ}` | holds; `simp` probe fails |
| C7.1 (R01) | `dbarDist`, `hormanderL2` appended to a copy of the file | elaboration: one `sorry` warning, no error | statable; absent |
| C7.17 (Nadel) | `ℙ¹`, `L = O(2)`, weight `log|s_x|²` on one `O(1)` factor | `J = 𝔪_x`; `K ⊗ L ⊗ J = O(−1)`, `H¹ = 0`; `iΘ ≥ ω_FS` | holds; not statable (coherent cohomology) |
| C7.13 (a), (b) | sub-mean value; doubling AM 14.2 | `C₂ = n!/πⁿ`; `ν(φ) − 2n/m ≤ ν(φ_m) ≤ ν(φ)` | holds |
| C7.14 | `ν(log Σ|σ_k|², x) = 2·min ord_x σ_k` | `{ν(φ_m) ≥ a}` = common zeros of derivatives of order `< ma/2` | holds |
| `CurrentCalculus` (sample; changed by a cross-reference) | its locators I §2.A–B, §2.D.3, (3.20); III (1.1)–(1.14), (1.21)–(1.22), (2.2)–(2.3) | agbook lines 498/593, 818, 1095; 6463/6611, 6761/6781, 6885/6928, on the cited pages | all as cited |
| `analyticSetLocalFiniteMass` (sample, adjacent) | III.2.5–2.6 | agbook lines 6990, 6997, page 140 | as cited |

The previous review's rows for C0.1a, C5.4a–C5.4j and C7.1–C7.18 stand. Their text is unchanged since `477bb48`, apart from the additions checked above.

- Earlier findings: R01 repaired (§C-1.5, cited in C7.12's *Needs:*). R02 repaired for C7.6, C7.7 and C7.12; C7.1 is R01 here. C01 repaired (C7.12 cites C0.1a). C02 repaired (C7.9 proves closedness). N01 repaired (Levi-form carriers named in C5.4a). N02 repaired (Check added to C5.4e).
- Source locators checked against the text this round: 13. VIII.10.7 (line 19361), II.4.27 (4814), I.5.1 (1831), III.2.3, III.2.5–2.6 and the six `CurrentCalculus` locators of Demailly's book; *Analytic Methods* (12.20) (line 6090); Guan–Zhou arXiv v1, Lemmas 2.10–2.11, Remark 2.12, Prop. 2.15 (lines 446–521).
- Library declarations opened at the pins: 15.
  - Tau Ceti: `TauCeti.perronSolution` (`TauCeti/Analysis/PDE/Perron/Basic.lean:157`), `perronFamily` (:133), `harmonicOnNhd_perronSolution` (:348), `TauCeti.SubharmonicOn` (`.../Harmonic/Subharmonic.lean:74`), `TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean:119`), `manifoldLeviForm` (`TauCeti/Geometry/Manifold/Complex/LeviForm.lean:106`), `IsManifoldStrictlyPlurisubharmonicAt` (:343).
  - Mathlib: `Real.circleAverage` (`Mathlib/MeasureTheory/Integral/CircleAverage.lean:55`), `EReal.exp` (`Mathlib/Analysis/SpecialFunctions/Log/ERealExp.lean:39`), `IsCoveringMap.liftPath` and `liftHomotopy` (`Mathlib/Topology/Homotopy/Lifting.lean:258, 310`), `Distribution.lineDerivCLM`, `mapCLM` and `ofFun` (`Mathlib/Analysis/Distribution/Distribution.lean:235, 189, 303`).
  - Measures: `volume` on `EuclideanSpace ℂ (Fin n)` is `measureSpaceOfInnerProductSpace`, and on the product it is `Measure.prod.measureSpace`, so the constant `π` of `ohsawaTakegoshi` refers to Lebesgue measure on `ℂ`.
- Cross-roadmap citations resolved at this head: ComplexKahlerGeometry §3.4 (line 708) and §3.5 (line 797), for §C-1.5; PDE §3.4 (line 1562), §3.2a and §3.4a; ComplexHessianEquations §§5.4 and 7.1, the only new supplier, on `main`, and named in the description. No holomorphic curve selection lemma exists elsewhere: ShimuraVarieties §3.4e is the o-minimal one.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean` exits 0 with seven `sorry` warnings and nothing else. I ran `#check` on the five new declarations; each matches its README statement and keeps its binders. The four other declarations are unchanged. A one-tactic `simp` probe on `strongOpenness` fails, and the other two theorems are existence statements with estimates.
- Record: the merge-base README has 8 layers, and the head keeps every id and title. The change adds 33 headings and removes none.
- Seeded sample: 13 of the 15 targets lie in untouched text the change does not affect. `CurrentCalculus` (one cross-reference added) and `analyticSetLocalFiniteMass` (adjacent) were checked.

Overlap check: I read SingularHermitianMetricsAndL2Methods (this head; it cites C5.4a–C7.6 through *Corollary of:* lines and owns none of them), ComplexKahlerGeometry (`main` and #2536), RealAnalyticGeometry, and EtaleCohomologyFoundations, AbelianSchemesAndArithmeticModuli, ClassicalAdicEtaleCohomology and InverseGaloisAndArithmeticFundamentalGroups (#3036). This roadmap owns plurisubharmonic functions, multiplier ideals, the `L²` theorems and holomorphic curve selection. #3036 also edits this README, but its head does not conflict with this one here.

Source independence: changed passages only. I compared 19 passages with 7 sources: the previous 14, plus §C-1.5 (a), its route and (b) against Demailly VIII.10.7, *Analytic Methods* (12.20) and Guan–Zhou Lemma 2.11, and the docstrings of `IsPlurisubharmonicOn` and `strongOpenness` against I.5.1 and Guan–Zhou Th. 1.1. Only the dozen-word statement of (a) shares a run of about ten words, which the statement forces. The largest share is *Analytic Methods*, with 23 of the 73 source citations in the added lines. Contents compared with *Analytic Methods*: Layer C7 takes C7.7–C7.8 from §13, C7.9 from §5, C7.10–C7.11 from §15, C7.13–C7.15 from §14 and C7.16–C7.18 from §5, not in the source's order. Independent.

Research link: Layer C7 states the `L²` theory behind current work on positivity and multiplier ideals. It covers Skoda's division theorem (Skoda 1972), Ohsawa–Takegoshi with Błocki's optimal constant (Błocki 2013; Guan–Zhou 2015), Nadel coherence and vanishing (Nadel 1990), strong openness (Guan–Zhou 2015) and Demailly's approximation (Demailly 1992). This rests on the README's references and on *Analytic Methods*.

## Not verifiable

- Błocki–Kołodziej 2007 (C5.4j (a), (b)): no copy on a host I may certify.
- Błocki 2013 (C7.7, Theorem 1, p. 150; §2): Springer paywall.
- Fornæss–Narasimhan 1980 (C5.4d, C5.4j (c)): Springer paywall.
- Hörmander's *Introduction* (C5.4e (j), C7.1 (a)) and Lazarsfeld I §2.2, II ch. 9: paywalled books.
- Cited by name and not opened: Demailly 1992, 1994, 2000; Ohsawa–Takegoshi 1987; Manivel 1993; Nadel 1990; Demailly–Ein–Lazarsfeld 2000; Siu 1974; Lelong 1957; Grauert–Remmert 1956; Richberg 1968; Hiep 2014; Guan–Zhou 2015 (Ann. 181). Their *Analytic Methods* counterparts were checked instead.

## Source issues

- none

## For the human reviewers

- none
