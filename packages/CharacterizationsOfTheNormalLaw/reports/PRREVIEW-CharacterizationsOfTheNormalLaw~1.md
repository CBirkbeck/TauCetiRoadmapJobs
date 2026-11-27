# Review of CharacterizationsOfTheNormalLaw (pull request #3197 at e2bebaf)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement and every step of the eleven routes was recomputed (constants, degenerate cases, both directions of each iff), every Bryc locator and the Lukacs statement were read in the sources, and every cited library declaration exists at the pins with the hypotheses the README gives. There are two small corrections and one format note, none blocking. One point is left for the human reviewers: twelve of the thirteen locators are into a single book.

## C01 — The forward direction of the Herschel–Maxwell theorem (3.2) needs only rotations, as in the source, but is stated under invariance by the full orthogonal group

A reader comparing 3.2 with its source finds a weaker forward implication: Bryc, Thm 0.0.1 (p. 1) assumes invariance under rotations of the plane only, while 3.2 (README line 270, `map_linearIsometryEquiv_comp_eq_iff`) assumes invariance under every linear isometry, and the route uses a transposition, which is a reflection. Rotations suffice: the rotation by `π/2` in the plane of the first two coordinates gives `X₁ ∼ −X₂` and `X₂ ∼ X₁`, so the coordinates are symmetric and identically distributed; the rotation by `π/4` then gives `(X₁ − X₂)/√2 ∼ X₁`, and `−X₂ ∼ X₂` is independent of `X₁`, so `(X₁ + X₂)/√2 ∼ X₁` and 3.1 applies; a rotation in the plane of coordinates `1, i` carries the law to the other coordinates. The iff as stated is true. The smallest change would be one sentence after the statement saying that the forward direction uses only rotations (and how), or, if preferred, the forward hypothesis restricted to isometries of determinant one.

## C02 — Two declarations in the Mathlib supplier contracts are used by no route

`IndepFun.hasGaussianLaw_sub_of_sub` (README line 499) and `Matrix.det_vandermonde` (line 523) appear under "From Mathlib" but in no route and on no `*Needs:*` line: 4.1 removes the other summands with the operators `∂_s − bⱼ ∂_t`, not with a Vandermonde system, and no step subtracts a Gaussian from a Gaussian. An implementer reading the contracts would look for where they enter. Remove the two names from the list, or name the step that uses each.

## N01 — Page range of Cramér's paper

The references give Cramér, Math. Z. 41 (1936) 405–414 "through Bryc's bibliography"; Bryc's entry [29] (Bryc1995 line 5650) prints 405–411. Either give the range as the bibliography prints it or check it against the journal and drop "through Bryc" for that entry.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Cramér, iff | `P` not assumed a probability measure in Lean; point masses; dependent `X = ε`, `Y = Z − ε` | either side forces `P.map` to have mass 1, so `P(Ω) = 1`; tail bound `P(|X| ≥ x) ≤ 2P(|S| + c ≥ x)`; `E exp(a(|S|+c)²) < ∞` iff `2av < 1` (README's `4av < 1` suffices); law `gaussianReal β (2γ)` matches `exp(iβt − γt²)` | true; hypotheses in scope |
| 2.1 tail recursion | Cauchy; negative `x`; `p = 0` | `N(Cʲx₁) ≤ qʲ`, `N(x) ≤ q⁻¹(x/x₁)^(−β)`, `β = log(1/q)/log C`; Cauchy ratio `→ 1/C` | true |
| 2.2 even derivatives | `k = 0`; Cauchy | `χ = (−1)ᵏφ^(2k)`; `(2χ(0) − χ(h) − χ(−h))/h² → −χ''(0)` | true |
| 2.3 analytic extension | `R ≤ 0`; Laplace law | `m_{2k} ≤ (2k)! M/A^(2k)`, `E e^{a|X|} ≤ 2M Σ (a/A)^(2k)`; Laplace: `1/(1 − a)` | true |
| 2.4 Marcinkiewicz | `Q` constant `2πik`; `Q = 0`; `deg Q = 3, 4`; `exp(−t⁴)` | step 0: bound at `y + h` up to `2R₀ > R₀`; `H ≤ ‖c‖ρᵐ|sin θ|ᵐ` at `m` maximizing angles forces `m ≤ 2`; `q₁ = iβ`, `q₂ = −γ`, `γ ≥ 0` | true; `natDegree ≤ 2` well defined since `Q` is unique up to `2πiℤ` |
| 3.1 Pólya | Cauchy with `√2` and with `2`; `N(1,1)`; `σ = 0` | `φ(√2t) = φ(t)²`; `E D² ≤ 2ψ(t)/t²`; `ψ(t) = σ²t²/2`; mean `√2 m = m`; Cauchy: `exp(−√2|t|)` | true |
| 3.2 Herschel–Maxwell | `n = 1` two-point law; `v = 0`; rotations only | `n = 1`: invariant, not normal; backward: `N(0, vI)` invariant; forward holds for rotations (C01) | true |
| 4.1 Darmois–Skitovich | `ι` empty; `card ι = 1`; `a = (1,0), b = (0,1)`; equal ratios | `|L| ≥ (εC − (n−1)K)x ≥ nKx`; `N(Cx) ≤ N(x)(P(|M| ≥ nKx) + n²N(x))`; operator leaves `bₖ ∏(bₖ − bⱼ) Qₖ^(m+1)`; `card ι = 1` gives a constant | true |
| 4.2 Kac–Bernstein, iff | both point masses; `X₁ = 1`, `X₂ ∼ N(0,1)`; `X₁ = X₂ = ε` | `cov(X₁+X₂, X₁−X₂) = Var X₁ − Var X₂`; point masses: both sides hold; `0 ≠ 1`: both fail | true |
| 5.1 mean and sum of squares | `n = 1`; `n = 2`; three-point law, `n = 2, 3, 4` | `|X̄| ≥ (n+1)x/n`; `|Xⱼ − X̄| ≥ (n−1)(2n−1)x/n ≥ 3x/2`; identity of step 2 holds to `1e−15` at `t = 0.3, 1.7`; `(φ'/φ)' = −σ²` | true |
| 5.2 Lukacs, iff | `Y` constant, `X` not; both constant; `Exp(1)`, `Exp(2)`; Beta | `Y` constant: `V` a function of `U`, independence forces `X` constant; `κ = (d/c² − 1)/(1 − d/c)`, Beta gives `1/p`; `E V = 2 − 2 log 2`, `cov = 3 log 2 − 2` | true; one non-degeneracy hypothesis suffices |

- Source locators checked against the text: 12 (Bryc1995 lines 213, 236, 463, 698, 1496, 1507, 1556, 1573, 2240, 3363, 3534, 4364, printed pages as cited; GerMisiewiczWesolowski2012 line 20).
- Library declarations opened or elaborated at the pins: 34 (all names on the `*Needs:*` lines and in the contracts; `taylor_charFun_two`, `iteratedDeriv_charFun`, `contDiff_charFun'` in `MeasureTheory/Measure/CharacteristicFunction/TaylorExpansion.lean` lines 150, 104, 58).
- Cross-roadmap citations resolved on main: 2 (MathematicalStatisticsFoundations §5.2, line 786; StandardDistributions §4.3, line 1623).
- No Mathlib or Tau Ceti declaration at the pins states any of the eleven targets; no other roadmap, on main or open, states them (the Cramér and Pólya theorems named elsewhere are different results).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CharacterizationsOfTheNormalLaw/Suggested.lean`: `sorry` warnings only; elaborated types compared with the README statements, none lost a binder; the automatic checks all passed.
- Padding: decided by reading; none of the eleven statements restates a definition or follows from one library lemma.
- Pull request text read against the head: no contradiction; no change outside the folder.

Overlap check: read StandardDistributions, LocalLimitTheorems, KalmanFiltering (scope sections) and MathematicalStatisticsFoundations §5.2 on main; the open heads (LevyProcesses, RuinTheory, ConstructiveFieldTheoryPhi4 and the rest) were searched by object, their scope sections not read; nothing shared.

Source independence: 16 passages compared with 2 sources, none shared; largest share Bryc1995, 12 of 13 locators; contents compared with Bryc1995: independent (Layer 1 ↔ part of Ch. 2 §5; Layer 2 ↔ parts of Ch. 1 §§3, 5 and Ch. 2 §§3, 5, placed after Layer 1; Layer 3 ↔ Ch. 3 §1 and the Introduction; Layer 4 ↔ Ch. 5 §§3, 1 in reverse order; Layer 5 ↔ Ch. 7 §4 and a second source; Chs. 4 and 6 absent). Step 1 of the route of 4.1 uses the constants of Bryc's Lemma 5.3.2 (`ε`, `K`, `C = 2nK/ε`), which is mathematics, in different words and for the maximum.

Research link: Lukacs' theorem (5.2) is the scalar case of the Wishart and cone characterizations of Olkin–Rubin 1962, Casalis–Letac 1996 and Bobecka–Wesołowski 2002 (GerMisiewiczWesolowski2012 §1); Darmois–Skitovich and Bernstein have group and Banach-space forms (Bryc1995 §§5.2–5.3). Rests on the sources read, not on the README.

## Not verifiable

- The original papers of Cramér, Marcinkiewicz, Pólya, Kac, Bernstein, Darmois, Skitovich and Lukacs: not read; the README cites them without locators, through the two sources.

## Source issues

- **Misprint** in Bryc1995 at the proof of Theorem 2.5.3, printed page 30: the source says the even polynomial equals minus gamma squared times `t`, and the product of characteristic functions is the exponential of that; it should be minus gamma squared times `t²` in both places; affects nothing.

## For the human reviewers

- **Scope / sources.** Twelve of the thirteen locators are into one book (Bryc, Springer LNS 100, read in the author's revised 2008 version from the author's page); the original papers are cited without locators.
- **Research link.** The README itself names no later theory that uses these theorems; the link above rests on the two sources.
