# Review of IncompressibleFluids (pull request #2630 at f380b14)

**Verdict:** needs changes

**Summary.** Changes are needed, though no stated formula, constant, exponent or Check was found false: every one recomputed below came out as written. The four findings are that no theorem carries a source locator (and two cited papers are not in the References), that the whole-space objects are also planned by the open roadmap IncompressibleFlows with neither text naming the other, that the Aubin–Lions lemma is statable at the pins but is declared not statable, and that `Suggested.lean` admits the proofs inside a definition and an instance. There are four small corrections and two format notes, and three points are left for a human, chiefly which of the two fluid roadmaps owns the whole-space theory.

## R01 (P2) — No theorem in the README has a locator, so none of its named results can be checked against a source

An implementer cannot tell which statement of which paper a target is, nor whether the hypotheses here are the source's. The layers cite by author and year only ("Leray 1934 for `d = 3` on the whole space; Hopf 1951", line 470; "Lions–Prodi 1959, Ladyzhenskaya 1959", line 501; "Kato 1972", line 771; "Beale–Kato–Majda 1984", line 797; "Wolibner (1933), Kato (1967)", line 817), the References give no theorem, section or page (only chapter ranges for two books, lines 1034 and 1036), and §1.1–§1.4, §2.1–§2.3, §3.1–§3.4, §5.1 and §6.1–§6.2 cite nothing at all. Two cited works are missing from the References: Kato 1967 (line 817) and Ladyzhenskaya 1959 (line 501; the list has only her 1969 book).

The citations that are given do not cover the statements as written. §4.2 claims existence for `d ∈ {2, 3}` with a force `f ∈ L²(0,T'; L²)` and a tightness bound that keeps the spatial tail of `f`. In the one account of Leray's paper I could read (Ożański–Pooley, arXiv:1708.09787), existence is Theorem 4.7 for `d = 3`, `f = 0`, `ν = 1`, and the separation-of-energy bound is Lemma 4.3 with no force; the same text notes that Hopf worked on a bounded domain. The forced and two-dimensional whole-space cases therefore need a locator of their own. For comparison, that text's Corollary 3.12 is the blow-up rate of §5.4 and its Theorem 4.12 bounds the singular times by `C‖u₀‖⁴`, which agrees with `T₀ = Cν⁻⁵‖u₀‖₂⁴` at `ν = 1`.

The smallest change: put a locator (theorem or section, and page) in parentheses at each named theorem and each estimate with a stated constant, as PDE does on main ("Grafakos, Theorem 5.3.3"); add the two missing works to the References; and where a target is more general than the cited theorem (§4.2 with force, §6.4 and §6.5 on `ℝ^d` rather than the setting of the original papers) cite a text that proves it at that generality.

## R02 (P2) — The whole-space Leray projection, pressure operator, Biot–Savart law and solution theory are also planned by the open roadmap IncompressibleFlows, and neither text names the other

Two open pull requests each build these objects, so an implementer has two definitions to choose from and no owner. IncompressibleFlows (pull request #237, `TauCetiRoadmap/IncompressibleFlows/README.md`) constructs "the Euclidean Leray projector as a tempered-distribution Fourier multiplier" with its `L²`, `Hˢ` and `Lᵖ` bounds (line 232), the Euclidean pressure multiplier `Σ R_i R_j (u_i u_j)` (line 237), the Euclidean Biot–Savart law (line 244), and lists Leray–Hopf existence, the two-dimensional theory with Yudovich, and Fujita–Kato and Kato mild solutions among its completion targets (lines 621–624). These are §1.2, §1.3, §6.2 and Layers 4–6 here. "Scope and ownership" (lines 858–902) does not mention that roadmap, and the description's sentence "no roadmap currently owns divergence-free vector fields, the Leray projection or any fluid equation" is true of main only.

The two also disagree on a shared supplier: IncompressibleFlows says it "consumes the PDE roadmap's Aubin–Lions theorem" (its Layer 0, item 6), while PDE on main states no such theorem and §3.4 here owns it.

The smallest change: one bullet in "Scope and ownership" naming IncompressibleFlows and saying, object by object, which roadmap owns the whole-space Leray projection, pressure operator, Biot–Savart law and the solution theory, and one sentence in the description. Which of the two roadmaps is to carry the subject is for the maintainers (see the last section); the text should not be silent about it.

## R03 (P2) — The Aubin–Lions lemma is statable at the pins, and the reason the module docstring gives for omitting it contradicts the Conventions

`Suggested.lean` is the acceptance test, and it leaves out a headline that needs no new carrier. The docstring (lines 30–33) says §3.4 lacks "the weak time derivative of an `L^r(0,T; X₁)`-valued function for a general Banach space `X₁`". The Conventions say the opposite ("weak time derivatives are the pinned `TauCeti.HasWeakLineDerivOn` on an interval", lines 87–88), and at the pin `TauCeti.HasWeakLineDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean:212`) takes `u u' : E → F` for an arbitrary normed space `F`; the pinned Gelfand-triple theorems already use it for `V*`-valued functions of time.

The following elaborates against the pins with the extra import `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, `sorry` the only warning:

```lean
theorem aubinLions (i : X₀ →L[ℝ] X) (j : X →L[ℝ] X₁) (hi : IsCompactOperator i)
    (hj : Function.Injective j) {p r : ℝ≥0∞} (hp : 1 < p) (hp' : p ≠ ∞) (hr : 1 < r)
    {T : ℝ} (hT : 0 < T) (u : ℕ → ℝ → X₀) (u' : ℕ → ℝ → X₁) {C : ℝ≥0}
    (hu : ∀ n, AEStronglyMeasurable (u n) (volume.restrict (Ioo 0 T)) ∧
      eLpNorm (u n) p (volume.restrict (Ioo 0 T)) ≤ C)
    (hd : ∀ n, HasWeakLineDerivOn volume ⟨Ioo 0 T, isOpen_Ioo⟩ (fun t ↦ j (i (u n t))) (u' n) 1)
    (hu' : ∀ n, eLpNorm (u' n) r (volume.restrict (Ioo 0 T)) ≤ C) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ v : ℝ → X, MemLp v p (volume.restrict (Ioo 0 T)) ∧
      Tendsto (fun n ↦ eLpNorm (fun t ↦ i (u (φ n) t) - v t) p (volume.restrict (Ioo 0 T)))
        atTop (nhds 0) := by
  sorry
```

with `X₀`, `X`, `X₁` real Banach spaces. It omits the reflexivity of `X₀` and `X₁` that §3.4 assumes: I found no reflexivity predicate in the pinned Mathlib, and the compactness conclusion does not need it (it follows from Ehrling's lemma and the time-translation estimate of §3.4's own bullets). The smallest change: state §3.4 in the file, in this or the author's form, and correct the docstring's sentence.

## R04 (P2) — `solenoidalL2` and the orthogonal-projection instance have `sorry` in their bodies

Every later declaration (`lerayProjection`, Helmholtz–Weyl, the commutation with the heat semigroup) is then a statement about an object whose well-definedness is admitted inside a definition, where a later proof of the theorems does not discharge it. In `Suggested.lean`, `solenoidalL2` (lines 69–73) proves `add_mem'`, `zero_mem'` and `smul_mem'` by `sorry`, and the instance `(solenoidalL2 E).HasOrthogonalProjection` (lines 81–82) is `by sorry`.

The instance needs no admission: it follows from the theorem already stated two lines above it. This elaborates at the pins:

```lean
instance : (solenoidalL2 E).HasOrthogonalProjection :=
  haveI : CompleteSpace (solenoidalL2 E) := (isClosed_solenoidalL2 (E := E)).completeSpace_coe
  inferInstance
```

For the submodule, prove the three closure fields; they need only that `x ↦ ⟪u x, ∇φ x⟫` is integrable for `u ∈ L²` and a test function `φ`, and that the representative of a sum or a scalar multiple agrees almost everywhere with the sum or multiple of representatives. The carrier is a true submodule (I checked the three properties by hand), so nothing in the mathematics changes.

## C01 — The References say that two layers take their organization from two books

"Chapters 1–4 and 8, the organization of Layer 6 and its exact solutions" (line 1034) and "the organization of Layers 4 and 5" (line 1038) attribute the arrangement of the roadmap to a source's chapters, which a roadmap's layers are not to have. Within Layer 6 the *Needs* lines force only that §6.4 follows §6.2 and §6.3 and that §6.5 follows the rest; §6.1, §6.2 and §6.3 are independent of one another. Would the entries say instead which results each book is cited for, with locators (this also serves R01)?

## C02 — §3.3 does not say how its product and commutator estimates differ from CompressibleEulerEquations §4.3

CompressibleEulerEquations (an open new roadmap, earlier in the merge order) states in its §4.3 the product estimate `‖∂^α(fg)‖_{L²} ≤ C(‖f‖_∞‖g‖_{Hᵏ} + ‖f‖_{Hᵏ}‖g‖_∞)` and a commutator estimate at integer order on its spaces `Hᵏ_Λ`, including `Λ = 0`, and its scope paragraph on fractional orders assigns the real-order Kato–Ponce estimates to a Part II of its own. At integer `s` on the whole space the product estimate of §3.3 is the same theorem. One clause in "Scope and ownership" would settle it: §3.3 is the real-order statement on the Bessel scale, and the integer-order case on `Hᵏ_Λ` is CompressibleEulerEquations §4.3.

## C03 — §2.1 and §2.2 allow `p = ∞`, where the heat semigroup of the Conventions is not defined, and the Lean statement excludes it

§2.1 is stated "for `1 ≤ p ≤ q ≤ ∞`" and `f ∈ Lᵖ(E; F)` (line 242), and §2.2 likewise (line 270), but `e^{tΔ}` is by the Conventions the pinned `TauCeti.heatSemigroup`, which exists for `p ≠ ∞` only (`Analysis/PDE/HeatKernel/Semigroup.lean:88`); `eLpNorm_heatSemigroup_le` accordingly assumes `p ≠ ∞`. Either restrict the prose to `p < ∞`, or say that for `p = ∞` the operator means convolution with `K_t`.

## C04 — Several suppliers are cited by Tau Ceti names that do not exist at the pinned revision

`TauCeti.rieszTransform` with its five lemmas, `TauCeti.BesovSpace`, `duhamel` and `IsForcedMildSolution` (lines 962–966, 980–981, 989–991) and their files are absent from the pinned Tau Ceti (`2fd255d`); the README says so, but the *Needs* lines of §1.2, §1.3, §2.3 and §3.3 then rest on names no reader can open, and the sign convention of the Riesz transforms in the Conventions (line 68) is pinned to one of them. The content has owners that can be read: PDE §2.3 states the Riesz transforms with multiplier `−iξ_j/|ξ|` (the same sign), PDE §7.2–§7.3 the Besov spaces and Bony's decomposition, and PDE §6.3 Duhamel's formula for the heat equation, with the pinned `TauCeti.Semigroups.IsMildSolution`. Cite those sections as the suppliers and fix the sign convention by PDE §2.3.

## N01 — Time-bound wording in the supplier contracts and the module docstring

"on Tau Ceti's `main` and newer than that pin" (README line 939; `Suggested.lean` line 24) describes a moment in time and will be false after the next pin bump; with C04 it can go.

## N02 — `lerayProjection_heatSemigroup` carries a redundant `[CompleteSpace E]`

`E` is finite-dimensional in the section, so the binder adds nothing to the statement; if the pinned `heatSemigroup` needs the instance, a `haveI` from finite-dimensionality inside the statement's context keeps the signature equal to the README's.

## Questions for the author

- Do the five sections of Layer 6 correspond one for one, in order and in scope, to Chapters 1, 2, 3, 4 and 8 of Majda–Bertozzi, as line 1034 suggests? I could not read the book or its contents page from a legal copy, so I could not compare.
- Is the multiplier of the Riesz transform in the Tau Ceti development `−iξ_j/‖ξ‖`, as line 69 says? The declaration is not at the pin, so I could not open it; PDE §2.3 uses that sign.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: Riesz signs, `ℙ`, pressure | symbols on the Fourier side | `RⱼRₖ ↔ −ξⱼξₖ/‖ξ‖²`; `Σ RⱼRⱼ = −1`; `−Δp = ∂ⱼ∂ₖF` gives `p̂ = −ξⱼξₖF̂/‖ξ‖²` | agree | C04 |
| Conventions: `(u·∇)v = div(v ⊗ u)` | components | `∂ₖ(vⱼuₖ) = uₖ∂ₖvⱼ + vⱼ div u` | holds iff `div u = 0` | none |
| Conventions: scalings | NS `λ`, Euler `(a,b)` | `Ḣ^{d/2−1}`: `λ^{s+1−d/2} = 1`; `L^d`: `λ·λ⁻¹`; Euler terms all scale `a²b` | invariant | none |
| 1.1 weak divergence, `L²_σ` (S1) | `d = 1`; rotation; strain; `u = x`; shear | const in `L²(ℝ)` is 0; divergences 0, 0, `d`; shear `∂₁g(x₂) = 0` | true | R04 |
| 1.2 Helmholtz–Weyl, Lean `iff` | `d = 0, 1, 2`; `u = (φ,0)` | `d = 1`: mean-zero `φ'` dense in `L²(ℝ)`; `(ℙu)^ = (ξ₂², −ξ₁ξ₂)φ̂/‖ξ‖²`, `⟂ ξ` | true both directions | none |
| 1.3 `Lᵖ` projection, pressure (S3) | `F = φ·1`; `u = (φ,0)`, `∫φ ≠ 0` | `ΠF = −φ`, `ℙ div F = ∇φ − ∇φ = 0`; tail `‖x‖^{−d}` not integrable | true | R01 |
| 1.4 solenoidal Sobolev (S4) | `u = ∇φ`; `u = ∇^⊥ψ` | `‖∇u − ∇uᵀ‖² = 2‖∇u‖² − 2‖div u‖²`; gradient: RHS 0; `ω = Δψ` | true | R01 |
| 2.1 off-diagonal heat (L5), Lean | `p = q`; `q = ∞`; `f = K_s`; `d = 0`; dilation | `‖K_t‖_r = (4πt)^{−(d/2)(1−1/r)} r^{−d/(2r)} ≤` stated constant; exponent 0 at `p = q`; both sides `λ^{−d/q}` | true | C03 |
| 2.2 Stokes, Oseen (L6) | Fourier side; `p = q` | `sup r e^{−νtr²} = (2eνt)^{−1/2}`; `∫4π²‖ξ‖²e^{−8π²ν‖ξ‖²t}dt = 1/(2ν)`; `∫(‖x‖+√t)^{−d−1} = Ct^{−1/2}` | true | R01, C03 |
| 2.3 Stokes system (L7) | `F = −u ⊗ u`; `f₀ = ∇φ` | `(1−ℙ)div F = −∇ΠF`, so `p = −ΠF + q = Π(u ⊗ u) + q`, matching §4.1 | consistent | R01, C04 |
| 3.1 Ladyzhenskaya, Lean | `d = 2`; dilation | proof gives `∫u⁴ ≤ ½‖u‖₂²‖∇u‖₂²`, so constant 2 holds; `θ = d(½ − 1/q)`; `(4,4)`, `(10/3,10/3)`, `(4,3)` satisfy `2/r + d/q = d/2` | true | none |
| 3.2 trilinear form | `d = 2` | `‖u‖₄‖∇v‖₂‖w‖₄ ≤ 2^{1/4}·2^{1/4} = √2` times the stated product; `L^{4/3}` in time for `d = 3` | true | none |
| 3.3 product, Kato–Ponce | `s = 2` with `Δ`; `|x|^{−a}χ` on `ℝ` | `Δ(fg) − fΔg = gΔf + 2∇f·∇g`; in `Hˢ` iff `s < ½ − a`; square fails for `a ≥ (½ − s)/2` | true | C02 |
| 3.4 Aubin–Lions (N11) | identity embedding; `sin(nt)x`; translates | no convergent subsequence; `‖u_n‖² → (T/2)‖x‖²`; Hölder exponent `1 − 1/r` | Checks true | R03 |
| 4.1 weak solutions | exponents | `∂ₜu ∈ L^{4/d}`: 2 and 4/3; pressure in `L²`, `L^{5/3}`; Lamb–Oseen tail `Γ/(2π‖x‖) ∉ L²` | true | none |
| 4.2 Leray existence (W13) | `u₀ = 0`; source at `d = 3`, `f = 0` | Ożański–Pooley Thm 4.7 (line 2172), Lemma 4.3 (line 1989): unforced, `d = 3` only | true; forced and `d = 2` cases unlocated | R01 |
| 4.3 two-dimensional theory | stability constant; Lamb–Oseen | `√2abc ≤ νb² + (1/2ν)a²c²`, so rate `1/ν`; `∫_{‖y‖≤r}K_{νt} = 1 − e^{−r²/4νt}` | true | R01 |
| 4.4 weak–strong uniqueness (W15) | `p = ∞`; `(4,6)`; general `p` | `θ = d/p`, `1 − θ = 2/q`; Young gives `ν^{−(1+θ)/(1−θ)} = ν^{1−q}`; `2/4 + 3/6 = 1` | true | R01 |
| 5.1 bilinear lemma (M16), Lean | `X = ℝ`; `a = 0` | ball `R = 2‖a‖`: `‖a‖ + 4η‖a‖² < R`, contraction `4η‖a‖ < 1`; other root `1/η > 1/(2η)`; Lipschitz `(1 − 4ηr)^{−1/2}` | true | none |
| 5.2 Fujita–Kato, Kato (M17) | dimensional analysis | bilinear `ν^{−3/4}`, linear `ν^{−1/4}`, product `ν⁻¹‖u₀‖`; Kato: `∫(t−s)^{−3/4}s^{−1/2}ds = Bt^{−1/4}`; `‖∇u₀‖₂ ↦ λ^{1/2}` | true | R01 |
| 5.4 blow-up rates (M19) | ODE; scaling; source | `y' ≤ Cν⁻³y³` gives `y² ≥ ν³/(2C(T*−t))`; `T₀ ≥ ‖u₀‖⁴/(2c⁴ν⁵)`; Ożański–Pooley Cor. 3.12, Thm 4.12 agree at `ν = 1` | true | R01 |
| 6.1 vorticity, conservation (E20) | rotation; strain; Beltrami; `d = 2, 3` | `Ω₂₁ = ω`, `Ωh = ω × h`; `ΩA + AᵀΩ = ΩS + SΩ`, zero for `d = 2`; `curl u = u`, `p = −‖u‖²/2` | true | R01 |
| 6.2 Biot–Savart | radial `ω`; far field | `Δuⱼ = ∂ₖΩⱼₖ`; `(1/2π‖x‖)∫_{‖y‖≤‖x‖}ω` counterclockwise; `K₂ ∉ L²` at infinity | true | R02 |
| 6.3 local theory, inviscid limit | Riccati; rate | `y ≤ y₀/(1 − Cty₀) ≤ 2y₀` at `T = 1/(2Cy₀)`; `d/dt‖w‖ ≤ ‖∇u⁰‖_∞‖w‖ + ν‖Δu⁰‖₂` | true | R01 |
| 6.4 Beale–Kato–Majda (E23) | `d = 2`; scalings | `∫‖ω_λ‖_∞dt`: `λ²·λ⁻²`; Euler: `ab·(ab)⁻¹` | invariant | R01 |
| 6.5 two-dimensional Euler (E24) | Osgood; radial `ω₀` | `∫₀¹dr/(r(1 − log r)) = ∞`; `r(t) = r₀^{exp(−Ct)}`; angular velocity `(1/2πρ²)∫_{‖y‖≤ρ}ω₀` | true | R01 |

- Source locators checked against the text: the README has none; four statements were compared with Ożański–Pooley (arXiv:1708.09787) at lines 1659, 1989, 2172 and 2621.
- Library declarations opened at the pins: 36 (10 in Mathlib, 26 in Tau Ceti), all at the cited file and line; 9 cited names are not at the pin (C04).
- Cross-roadmap citations resolved: PDE §1.3, §1.4, §2.2, §2.3, §6.1, §6.3, §7.1–§7.3 on main; OneParameterSemigroups Part A on main (completed).
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the pins: succeeds, `sorry` the only warning (10 warnings). The ten elaborated types were compared with the README statements; no section binder is lost.
- One-tactic probe: none of the seven sorried theorems closes by `simp`, `rfl` or `infer_instance`; no padding.
- Headline theorems: Helmholtz–Weyl, off-diagonal heat estimate, Ladyzhenskaya and the bilinear lemma are stated; Aubin–Lions is statable and absent (R03); the remaining ones are named in the docstring.
- Overlap check: read IncompressibleFlows, PDE, CompressibleEulerEquations, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation; the whole-space Leray projection, pressure operator, Biot–Savart law and Navier–Stokes and Euler solution theory are shared with IncompressibleFlows and have no single owner (R02); the integer-order product estimate is CompressibleEulerEquations §4.3 (C02); Riesz transforms, Besov spaces and the heat semigroup are PDE's and are consumed, not restated; YangMills only names the Leray projection in two Checks.

Source independence: 6 passages compared with 1 source (Ożański–Pooley 2017), none shared; the README has 0 locators, so no source has a largest share; contents not compared: Majda–Bertozzi and Robinson–Rodrigo–Sadowski could not be read.

Research link: the headline targets are the theorems of Leray (1934), Fujita–Kato (1964), Kato (1984), Beale–Kato–Majda (1984) and Yudovich (1963), on which current work on Navier–Stokes regularity builds, and Layers 1–4 are prerequisites of the stochastic Navier–Stokes programme PDE names; rests on the README's References and on Ożański–Pooley (2017).

## Not verifiable

- Fujita–Kato 1964, Kato 1972, Kato 1984, Kato–Ponce 1988, Beale–Kato–Majda 1984, Simon 1987: publisher pages are paywalled or returned only a landing page; the statements of §3.3, §3.4, §5.2, §6.3 and §6.4 were checked by computation, not against the texts.
- Leray 1934 itself: only the landing page was readable; §4.2 and §5.4 were compared with the Ożański–Pooley account of it.
- Majda–Bertozzi, Bahouri–Chemin–Danchin, Robinson–Rodrigo–Sadowski, Temam, Constantin–Foias, Lemarié-Rieusset, Ladyzhenskaya: books with no legal open copy found.
- The Tau Ceti declarations of C04: not at the pinned revision, so neither their statements nor the Riesz sign could be opened.
- Ownership against board packages: the two packages listed on the board (analytic number theory, Lawrence–Venkatesh) are unrelated; their files were not read.

Automatic checks set aside as false positives: the report of TeX subscripts in the tightness bullet of §4.2 points at a formula that is inside a code span; the span wraps over a line break, which the scanner does not follow.

## Source issues

- none

## For the human reviewers

- **Scope.** IncompressibleFlows (pull request #237, draft) and this roadmap both plan the whole-space Leray projection, Biot–Savart law and Navier–Stokes and Euler theory (its README lines 232–244, 621–624); one owner has to be chosen.
- **Not tested.** `TauCetiRoadmap/IncompressibleFluids/README.md` lines 1034 and 1038 say Layer 6 and Layers 4–5 take their organization from Majda–Bertozzi and Robinson–Rodrigo–Sadowski; neither contents page could be read, so the arrangement was not compared.
- **Not tested.** The README has no source locators, so the wording comparison covers one open text only (arXiv:1708.09787); the primary papers are paywalled.
