# Review of PDE (pull request #1614 at 9671584)

**Verdict:** needs changes

🤖 Independent AI review, full: the folder changed by 4922 lines since `f019834`. Seven findings (three P2, four P3), all in the text and declarations this pull request adds (§1.8, §4.5, §4.6) or in its description. The gate passes.

## R01 (P2) — Poincaré–Friedrichs and the coercive mixed problem are statable at the pins and absent; the stated obstacle is false

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:46–49`: "the admissibility predicate for boundary parts is a target of §1.8, and §1.6's trace exists at the pins only inside the statement `exists_trace`, not as an operator these statements could name."

**Claim:** The pinned Tau Ceti (`2fd255d`) has the trace as an operator. Independently, Poincaré–Friedrichs (`README.md:1113–1114`) and the coercive case of §4.5 (`:1910–1915`) need neither a trace nor admissibility in their statements: `Γ ⊆ frontier Ω` with `μHE[n] Γ ≠ 0` suffices.

**Witness:** `TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.lean:219` (`W1p.frontierTrace`), `:448` (`W1p.ker_frontierTrace`). Every generator of `W^{1,p}_Γ` vanishes near `closure Γ`, so `T u = 0` on `Γ` for all `u ∈ W^{1,p}_Γ` by continuity of `T`; a constant `c` then has `c = 0`.

**Repair:** In §1.8's Poincaré–Friedrichs bullet, the three bullets of §4.5 and the opening of §4.6 replace "an admissible `Γ`" by "any `Γ ⊆ frontier Ω`"; admissibility stays a hypothesis of the trace characterization only. Add to `Suggested.lean`, section `BoundaryParts` (both elaborate at the pins, `sorry` the only warning; on `(0,1)`, `Γ = {0}` they give `C = 1` and `u = x − x²/2`):

```lean
theorem exists_poincare_friedrichs (hp : p ≠ ⊤) (Ω : Opens (EuclideanSpace ℝ (Fin (n + 1))))
    (hΩ : IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hb : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hc : IsConnected (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    {Γ : Set (EuclideanSpace ℝ (Fin (n + 1)))}
    (hΓ : Γ ⊆ frontier (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hpos : (μHE[n] : Measure (EuclideanSpace ℝ (Fin (n + 1)))) Γ ≠ 0) :
    ∃ C : ℝ, ∀ u ∈ w1pVanishingOnSubmodule mu Ω p Γ,
      ‖W1p.value u‖ ≤ C * ‖W1p.gradient u‖ := by
  sorry

theorem existsUnique_weakSolution_mixed (Ω : Opens (EuclideanSpace ℝ (Fin (n + 1))))
    (hΩ : IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hb : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hc : IsConnected (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    {Γ : Set (EuclideanSpace ℝ (Fin (n + 1)))}
    (hΓ : Γ ⊆ frontier (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hpos : (μHE[n] : Measure (EuclideanSpace ℝ (Fin (n + 1)))) Γ ≠ 0)
    {a : EuclideanSpace ℝ (Fin (n + 1)) → Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ} {lam Lam : ℝ}
    (ha : IsUniformlyEllipticAE mu Ω a lam Lam)
    (hcoeff : MemLp (fun x => energyIntegrand (a x) 0 0) ⊤ (mu.restrict Ω))
    (ℓ : StrongDual ℝ (w1pVanishingOnSubmodule mu Ω 2 Γ)) :
    ∃! u : w1pVanishingOnSubmodule mu Ω 2 Γ, ∀ v : w1pVanishingOnSubmodule mu Ω 2 Γ,
      energyFormH1 a 0 0 (u : W1p mu Ω 2) (v : W1p mu Ω 2) = ℓ v := by
  sorry
```

Each gets a docstring and its name in the README bullet. Replace the docstring entry by: "§1.8 (the trace characterization): the admissibility predicate is a target of §1.8. §4.5 (the mixed problem with a Neumann datum `h`): the pinned trace `TauCeti.W1p.frontierTrace` lives on `Opens (WithLp 2 (ℝ × E))` with `volume`, the pinned energy form on `EuclideanSpace ℝ ι`, and no statement can name both. §4.6: the realization `−Δ_Γ` is a target."

## R02 (P2) — "`W^{1,p}_Γ(Ω)` contains `W^{1,p}_0(Ω)`" is false at the generality of the definition

**Location:** `TauCetiRoadmap/PDE/README.md:1121`: "`W^{1,p}_Γ(Ω)` is a closed submodule containing `W^{1,p}_0(Ω)`", with `:1092` "For an open `Ω`, a set `Γ ⊆ ℝ^{n+1}`" (and `Γ : Set _` unrestricted in `Suggested.lean:195`).

**Claim:** The inclusion needs `Γ` disjoint from `Ω`; the definition and the Lean carrier admit any `Γ`.

**Witness:** `Ω = (0,1)`, `Γ = {1/2}`, finite `p`: every generator vanishes near `1/2` and evaluation at `1/2` is continuous on `W^{1,p}(0,1)` (§1.1), so `W^{1,p}_Γ ⊆ {u(1/2) = 0}`; a bump `φ ∈ C_c^∞(0,1)` with `φ(1/2) = 1` lies in `W^{1,p}_0 ∖ W^{1,p}_Γ`.

**Repair:** "For `Γ` disjoint from `Ω` (in particular `Γ ⊆ frontier Ω`), `W^{1,p}_Γ(Ω)` contains `W^{1,p}_0(Ω)`; for every `Γ` it is a closed submodule, and `Γ ⊆ Γ'` gives …". Then `closure Γ ∩ Ω = ∅` and every test function on `Ω` is a generator; on the witness the repaired bullet asserts nothing. Add the witness as a Check.

## R03 (P2) — The trace-characterization route uses a bi-Lipschitz change of variables that nothing supplies

**Location:** `TauCetiRoadmap/PDE/README.md:1107–1108`: "by a partition of unity subordinate to the charts and a bi-Lipschitz flattening, reduce to a half-space with `Γ` the half-hyperplane `{s < 0}`"; `*Needs:*` at `:1149–1151`.

**Claim:** The route composes `W^{1,p}` functions with the graph shear `(x, t) ↦ (x, t − γ(x))` and with the flattening of the interface, both merely Lipschitz. No target, supplier section or pinned declaration gives that composition, and the `*Needs:*` line omits it.

**Witness:** `TauCeti/Analysis/Sobolev/W1p/ChangeOfVariables.lean:274` (`W1p.compL`) assumes `Φ` differentiable on `U` with bounded derivative; `γ(s) = |s|` (the square's corner chart, §1.6) is not differentiable at `0`. The README has no other change-of-variables target (search for "bi-Lipschitz": lines 1088 and 1108 only).

**Repair:** Add to §1.8 the target "for a bi-Lipschitz homeomorphism `Φ : U → V` of open sets and finite `p`, `u ↦ u ∘ Φ` is a bounded map `W^{1,p}(V) → W^{1,p}(U)` with `∇(u ∘ Φ) = DΦᵀ(∇u ∘ Φ)` almost everywhere (Ziemer, *Weakly Differentiable Functions*, Theorem 2.2.2), by Rademacher and the pinned `TauCeti.W1p.compL` on smooth approximants of `Φ`", and to the `*Needs:*` line "for the trace characterization: … and the bi-Lipschitz composition above". (Ziemer's locator is from memory, not read.)

## R04 (P3) — `w1pVanishingOnSubmodule_empty` restates a theorem the pin proves

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:211–215` and `README.md:1101–1103`: "`W^{1,p}_∅(Ω) = W^{1,p}(Ω)` for bounded Lipschitz `Ω` and finite `p` (`w1pVanishingOnSubmodule_empty`): extend by §1.6's extension operator, approximate … and restrict."

**Claim:** This is the pinned density theorem, with the same hypotheses and the same extend–approximate–restrict proof, read on the roadmap's own carrier.

**Witness:** `TauCeti/Analysis/Sobolev/LipschitzDomain/GlobalExtension.lean:142`, `W1p.denseRange_restrictL_ofTestFunctionₗ_top (hp : p ≠ ∞) (hΩ : IsLipschitzDomainWith L) (hb : IsBounded Ω)`: restrictions of whole-space test functions are dense in `W^{1,p}(Ω)`.

**Repair:** Delete it from `Suggested.lean` (and "and at `Γ = ∅`" from the docstring, line 24). In the README write "`W^{1,p}_∅(Ω) = W^{1,p}(Ω)` for bounded Lipschitz `Ω` and finite `p` is the pinned `TauCeti.W1p.denseRange_restrictL_ofTestFunctionₗ_top`", cite it under "From Tau Ceti" and in §1.8's `*Needs:*` in place of "§1.6's extension operator and §1.2's whole-space density".

## R05 (P3) — §1.8's two definitions have two Checks each, none testing `W^{1,p}_Γ` itself

**Location:** `TauCetiRoadmap/PDE/README.md:1128–1144`: four Checks; the first two are about admissibility, the last two about the Poincaré–Friedrichs constant.

**Claim:** Each definition needs three discriminating Checks. No Check separates `W^{1,p}_Γ` from a wrong model (vanishing on `Γ` rather than near `closure Γ`, the trace kernel at `p = ∞`), and none separates admissibility from a property of `closure Γ`.

**Witness:** A definition of `W^{1,∞}_Γ` as `{u | u = 0 on Γ}` passes all four Checks; on `(0,1)`, `Γ = {0}` it contains `u = x`, while `‖u' − φ'‖_∞ ≥ 1` for every generator `φ`.

**Repair:** Add: (1) "On `(0,1)`, `Γ = {0}`, finite `p`: `x ∈ W^{1,p}_Γ` (the mollified `(x − ε)⁺` converge to it) and `1 − x ∉ W^{1,p}_Γ`, since evaluation at `0` is continuous and equals `1`." (2) "At `p = ∞` on the same data `x ∉ W^{1,∞}_Γ`: every generator has derivative `0` near `0`, at distance `1` from `u' = 1`; the trace characterization is for finite `p` only." (3) "On the unit square, `Γ = {0} × ((0,1) ∖ {1/2})` is relatively open with the closure of the admissible side `{0} × (0,1)` and the same `W^{1,p}_Γ`, but is not admissible: at `(0, 1/2)` it lies over both sides of the base point."

## R06 (P3) — The theorems of §1.8 (Poincaré–Friedrichs), §4.5 and §4.6 carry no source locator

**Location:** `TauCetiRoadmap/PDE/README.md:1113` ("**Poincaré–Friedrichs**: for a connected bounded Lipschitz `Ω` …"), `:1897–1951` (§4.5), `:1953–1992` (§4.6): no citation in any of them.

**Claim:** Every theorem carries a locator. Gröger's paper is listed in the References "for mixed boundary conditions and the spaces `W^{1,p}_Γ`" with no locator, and no section cites it. The sampled §6.8 and §9.3 of main's text have none either.

**Witness:** `bauer-pauly-schomburg` lines 1110–1117: Theorem 4.8 (p. 16) states the compact embedding of `H¹_Γ` and the Poincaré–Friedrichs estimate (`p = 2`, dimension three, weak Lipschitz pairs, mean-zero functions when `Γ = ∅`); the README does not cite it.

**Repair:** At `:1113` add "(Bauer–Pauly–Schomburg, Theorem 4.8, p. 16, for `p = 2` in dimension three)". At the coercive case, the Neumann compatibility condition and the spectral statement add the theorem number and page of the text they were taken from, and either cite Gröger at a claim with a locator or drop the entry.

## R07 (P3) — The description describes an earlier head

**Location:** the pull request's description: "Adds Lane G to the PDE roadmap … built on A.6's Lipschitz charts … Lane G builds on Lanes A and D and leaves their items as they are."

**Claim:** The head has no Lane G, no Lanes A and D and no A.6, and the description does not state the change to `Suggested.lean`.

**Witness:** `README.md:1079`, `:1897`, `:1953`: the additions are "### 1.8 … (A8)", "### 4.5 … (D20)", "### 4.6 … (D21)"; `:200` extends the labels to A1–A8 and D16–D21; `Suggested.lean:193–215`, `:354` add one definition and three theorems.

**Repair:** "Revises the PDE roadmap on main: adds §1.8 (A8: admissible boundary parts, `W^{1,p}_Γ(Ω)`, its trace characterization, Poincaré–Friedrichs) to Layer 1 and §4.5 (D20: mixed and Neumann problems) and §4.6 (D21: their spectra) to Layer 4. No section of main is removed or renumbered; the labels become A1–A8 and D16–D21. `Suggested.lean` gains the definition `w1pVanishingOnSubmodule` and the theorems `w1pVanishingOnSubmodule_frontier`, `w1pVanishingOnSubmodule_empty` and `neumann_solvable_iff`. Two references are added. No supplier is added or dropped." (Adjust to R01 and R04.)

## Previous findings

- R01 of the previous review (the Poincaré bullet without a Lipschitz hypothesis) — repaired: the bullet is gone; `README.md:866` reads "On a nonempty connected bounded Lipschitz domain prove Poincaré–Wirtinger", `:1113` "for a connected bounded Lipschitz `Ω`", and `:1140–1144` keeps the rooms-and-passages witness as a Check.
- R02 of the previous review (the description) — not repaired: the description is unchanged and is now also out of date; written again as R07.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 interval classes | `x`, `x²` on `(0,1)` | `∫xφ' = −∫φ`; `∫x²φ' = −∫2xφ`; endpoint values `(0,1)` | true | none |
| §1.2 density; `dense_contDiffOn_representatives_wkp` | `x^{3/2}`, `k = 2`; `k = 0`; `Ω = ⊥` | `u'' = (3/4)x^{−1/2}`, square `(9/16)x^{−1}` not integrable; `k = 0` is `Lᵖ` density; zero space | true | none |
| §1.4 embeddings | `\|x\|^{−a}`; `x(1−x)`, `n = p = 1` | `(a+1)p < n ⇔ ap* < n`; `1/4 ≤ 1/2` | true | none |
| §1.7 Hölder, Campanato | `\|x\|^α`, `n = 1`, `p = 2`; `sin`, `α = 1/2` | `∫\|u − u_r\|² ≈ r^{1+2α}`, `λ = 1+2α`; pinned norm in `[1 + 2/√π, 3]` | true | none |
| §1.8 admissibility | square, `Γ = {0}×(0,1)`; oscillating `Γ`; `n = 0` | corner chart `t = \|s\|`, `Γ` over `s < 0`; alternation at `(0,0)`; base a point: all or none | true | R05 |
| §1.8 `w1pVanishingOnSubmodule_frontier` | `Ω = ⊥`, `Ω = ⊤`, `p = ∞` | zero space; frontier empty, both sides the closure of `C_c^∞`; `supp φ ∩ closure Ω` compact in `Ω` | true, not padding | none |
| §1.8 `w1pVanishingOnSubmodule_empty` | pinned `denseRange_restrictL_ofTestFunctionₗ_top` | same hypotheses `p ≠ ∞`, Lipschitz, bounded; same route | pinned | R04 |
| §1.8 containment of `W^{1,p}_0` | `(0,1)`, `Γ = {1/2}`; `Γ = {0}` | bump with `φ(1/2) = 1` excluded; with `Γ ⊆ frontier` every test function is a generator | false as stated | R02 |
| §1.8 Poincaré–Friedrichs | `(0,1)`, `Γ = {0}`; `Γ = ∅`; rooms; non-admissible `Γ` of positive measure | `\|u(x)\| ≤ x^{1−1/p}‖u'‖_p`, `C ≤ 1`; constant `1` refutes; `ℓ^{1−p}w = 2^{−3k}`, `Σ_{j≥k}4^{−j} = (4/3)4^{−k}`; trace of generators `0` on `closure Γ` | true; admissibility unused | R01 |
| §4.2; `existsUnique_weakSolution_lifting` | `−u'' = 1`; ball of `ℝ³`; `g = 1`, `ℓ = 0` | `x(1−x)/2`; `Δ(1−\|x\|²)/6 = −1`; `u = 1` | true | none |
| §4.3; `fredholm_compatibility` | `[[1,1],[0,0]]`; `−u''−u = sin 2x` | `ker Lᵀ = span(0,1)`, `(1,0)` solvable; `A = 1/3` | true | none |
| §4.4 Dirichlet spectrum | `(0,π/2)`; `(0,π)²` | `λ₁ = 4 ≥ 1`; `5 = 1+4 = 4+1` | true | none |
| §4.5 mixed and Neumann; `neumann_solvable_iff` | `−u'' = 1`: `Γ = {0}`; `Γ = ∅`, `h = 0`; `h(1) = −1`; `f = cos πx` | `x − x²/2`; `u'(1)−u'(0) = −1 ≠ 0`; `−x²/2 + C`; `u = cos(πx)/π²`, `∫f = 0` | true; one-tactic probe fails | R01 |
| §4.6 mixed spectra | `(0,1)`, `Γ = {0}`; square, one Dirichlet side | `cos((m+½)π) = 0`, `λ₁ = π²/4`; `π²/4 + π² = 5π²/4 < 9π²/4` | true | R01 (hypothesis) |
| §5.1; `exists_wkp_two_of_lipschitz_coefficients` | `a = 1 + 1_{x>0}` | `u' = C/a` jumps: excluded by the Lipschitz hypothesis | true | none |
| §5.2 Meyers | planar example; slit disk | `p(1−μ) < 2`; `\|∇u\| ≈ r^{−1/2}`, `p < 4`; `meyers-1963` lines 264, 300, 397 | true, locators right | none |
| §5.4; the two ball theorems | `u = x₁`; `u = 1` | `r^{−α−n/2}·r^{1+n/2} = r^{1−α}`; Harnack forces `C ≥ 1` | true | none |
| §5.6; `holderOnWith_iteratedFDeriv_two_of_schauder` | `(x₁²−x₂²)(−log r)^{1/2}`; `x₁²` | `g'' + 5g'/r` gives coefficients `−2`, `−1/4`; `0 ≤ C(4r^{−α} + 2r^{−α})` | true | none |
| §6.8 every order | `e^{−t}cos x`; `k = 1` | `u_t = u_xx`; `(u_x)_t − (u_x)_xx = f_x` | consistent; no locator | R06 |
| §8.2 Strichartz | `(4,∞)`, `d = 1`; `(2,6)`, `d = 3`; scaling | `1/2`; `3/2`; `λ^{−d/r−2/q} = λ^{−d/2}` on the line; `tao-dispersive` line 3856 | true, locator right | none |
| §9.3 bootstrap | `A ∈ C^{1,α}`, `d = 1` | `C^β → C^{1,β} → a ∈ C^{1,min(α,β)} → C^{2,min} → C^{2,α}` | consistent; no locator | R06 |
| §2.1 maximal function | `1_{[0,1]}`, `x > 1`; `n = 0`, `p = 2` | centred `1/(2x)` at `r = x`, uncentred `1/x`; constant `8` | true | none |
| §2.3; `CalderonZygmundOperator.eLpNorm_le`, `weakType_one` | `x·f(x)`; Hilbert transform | `R² + R + 1/3 → ∞`, not an instance; `H1_{[0,1]} ≈ 1/(π\|x\|) ∉ L¹` | true | none |
| `exists_poincare_wirtinger`, `exists_trace`, `exists_extension`, Rellich | two balls; `x(1−x)` at `p = ∞`; `sin(jx)/j` | `∇u = 0`, `u − u_Ω = ±1`; zero trace outside the closure; `π/(2j²) → 0` | true as stated | none (see the human reviewers) |
| `hopf_boundary_point`, Krylov–Safonov pair | sign trichotomy; `n = 1` | `c = 0`, or `c ≤ 0` and `u(x₀) ≥ 0`, or `u(x₀) = 0`; `\|u'(x)−u'(y)\| ≤ ‖f‖₁/λ` | true | none |

- Source locators checked against the text: 11 (`bauer-pauly-schomburg` lines 309–322, 329–338, 414–424, 1110–1117, 1556; `meyers-1963` lines 264, 300, 397; `tao-dispersive` line 3856; `krylov-vmo` lines 193, 203; `armstrong-kempe` lines 25, 197).
- Library declarations opened at the pin: `Sobolev/LipschitzDomain/Trace/Frontier.lean:219,448`, `LipschitzDomain/GlobalExtension.lean:94,142`, `LipschitzDomain/RellichKondrachov.lean:53,71`, `LipschitzDomain/Basic.lean:144,290,482`, `W1p/ChangeOfVariables.lean:274`, `W1p/Zero.lean:123`, `PDE/EnergyForm/Sobolev.lean:649,733,941`.
- Gate: every check 0, `OK`. Dependency check: `depcheck: 224 roadmaps, 2417 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 19 diagnostics, all `declaration uses sorry`. One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy: none of the 19 closes.
- Signatures: the worker's 24 elaborated types read against the README; the four new declarations keep `[mu.IsAddHaarMeasure]` and `[Fact (1 ≤ p)]`; none lost a binder.
- Cross-roadmap citations: the resolver lists none unresolved; §1.8, §4.5 and §4.6 cite OperatorTheory's `LinearPMap` vocabulary only, as §4.4 does. The worker's four "Lean names found nowhere" outside `Suggested.lean` are in main's text (`README.md:338`, `:365`, `:2208`): a search of the pinned sources finds none under that name (`exists_ae_value_le_add_mul_rpow_mul_sqrt_setIntegral`, without the suffix, is at `PDE/Regularity/LocalBoundedness/Basic.lean:969`); see the human reviewers.
- Overlap check: read YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation, ComplexHessianEquations (main) and the Neumann-Laplacian passages of SchrodingerOperatorsAndSpectralTypes (open); a search of main and the open heads for `W^{1,p}_Γ`, Poincaré–Friedrichs, mixed boundary conditions and Neumann problems finds no second owner; nothing shared. YangMills asks PDE for the `L^p` Neumann problem on the ball, a different statement from §4.5's weak `H¹` problem.

Source independence: 6 passages compared with 5 sources, none shared (the admissibility condition of `tao-dispersive` line 3857 and the ellipticity condition of `armstrong-kempe` line 25 are formulas); largest share Gilbarg–Trudinger, about 21 of 80 locators, its text and table of contents not read; contents compared with the chapter list the README's References give for it (Layers 1, 3, 4–5 against Chapters 7, 3–4, 8, 6, 9, not in order): independent.

Research link: §1.8 states, in every dimension and for every finite `p`, the density and Poincaré–Friedrichs results that Bauer–Pauly–Schomburg (2016) prove for `p = 2` in dimension three (Lemma 3.1, Theorem 4.8) on the way to the Maxwell compactness property with mixed boundary conditions; rests on `bauer-pauly-schomburg` and the README's References.

## Not verifiable

- Evans; Gilbarg–Trudinger; Leoni (Theorem 7.13); Adams–Fournier (Theorem 3.17); Stein (both books); Grafakos; Giaquinta–Martinazzi; Grisvard: books with no legal open copy found; locators not checked.
- Meyers–Serrin, PNAS 51 (1964): the publisher's page refused the fetch; not read.
- Gröger, Math. Ann. 283 (1989): paywalled; no statement rests on a locator into it.
- Ziemer, Theorem 2.2.2 (named in R03's repair): cited from memory.
- The Lean names `holder_Moser`, `EllipticCoeff`, `quadratic_upper`, `mixed_bound` (`README.md:2191`, References): they are in the repository, not in the arXiv text; the repository was not read.
- "Related PRs #1609 and #1612" in the description: #1612 is not among the open roadmap pull requests given to this review.

## Source issues

- none

## For the human reviewers

- **Not tested.** Gilbarg–Trudinger and Evans carry the largest shares of locators (about 21 and 19 of 80); neither text nor contents page was read, so wording and arrangement were not compared against them.
- **Scope of this pull request.** `README.md:274–276` says the Tau Ceti pin is `358314d`; `lake-manifest.json` pins `2fd255d`. Main's own §1.5–§1.6 headline statements have pinned counterparts in `TauCeti/Analysis/Sobolev/LipschitzDomain/`, and four names main cites (`:338`, `:365`, `:2208`) are not found at the pin. This pull request does not touch that text.
- **Licence.** `README.md:3351–3357` describes names taken from `scottnarmstrong/DeGiorgi` (stated Apache-2.0); the repository and its licence file were not opened.
