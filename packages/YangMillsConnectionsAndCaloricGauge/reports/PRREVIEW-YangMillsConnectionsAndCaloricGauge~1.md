# Review of YangMillsConnectionsAndCaloricGauge (pull request #2164 at a69a7e7)

**Verdict:** needs changes

## R01 (P2) — The integrality of the `SU(2)` instanton number is statable at the pins but is not stated

**Location.** `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/Suggested.lean` lines 31–35: "integrality and
completeness of the `SU(2)` instanton number (§6.4): missing the curvature of a finite-energy rough connection,
its evaluated invariant polynomial forms, and its topological class."

**Claim.** The integrality half of the §6.4 headline needs neither the topological class nor a general invariant
polynomial. The curvature of a finite-energy rough connection is one short definition over Tau Ceti's
`TauCeti.HasWeakFDerivOn`. By §3.3 (OhTataru-TopClass Proposition 3.10, lines 1328–1347), every finite-energy
connection on `ℝ⁴` has a global potential in `W^{1,2}_loc`, so a statement over such potentials has §6.4's full
generality.

**Witness.** The following file elaborates at the pins (`lake env lean` from the worktree, with
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic` built). The only diagnostic is "declaration uses `sorry`".

```lean
import Mathlib
import TauCeti.Analysis.Sobolev.WeakDeriv.Basic

open MeasureTheory

attribute [local instance] Matrix.frobeniusNormedAddCommGroup Matrix.frobeniusNormedSpace

abbrev Pot := Fin 4 → Matrix (Fin 2) (Fin 2) ℂ

structure IsSU2W12LocPotential (A : EuclideanSpace ℝ (Fin 4) → Pot)
    (DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ] Pot) : Prop where
  skew : ∀ᵐ x, ∀ j, Matrix.conjTranspose (A x j) = -A x j
  traceless : ∀ᵐ x, ∀ j, (A x j).trace = 0
  weakDeriv : TauCeti.HasWeakFDerivOn volume ⊤ A DA
  locL2 : ∀ x : EuclideanSpace ℝ (Fin 4), ∃ r > 0,
    MemLp A 2 (volume.restrict (Metric.ball x r)) ∧
      ∀ v, MemLp (fun y => DA y v) 2 (volume.restrict (Metric.ball x r))

noncomputable def curvature (A : EuclideanSpace ℝ (Fin 4) → Pot)
    (DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ] Pot)
    (x : EuclideanSpace ℝ (Fin 4)) (j k : Fin 4) : Matrix (Fin 2) (Fin 2) ℂ :=
  DA x (EuclideanSpace.single j 1) k - DA x (EuclideanSpace.single k 1) j +
    (A x j * A x k - A x k * A x j)

theorem exists_int_instantonNumber (A : EuclideanSpace ℝ (Fin 4) → Pot)
    (DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ] Pot)
    (hA : IsSU2W12LocPotential A DA)
    (hF : ∀ j k, MemLp (fun x => curvature A DA x j k) 2 volume) :
    ∃ n : ℤ, ∫ x, (2 * ((curvature A DA x 0 1 * curvature A DA x 2 3).trace -
      (curvature A DA x 0 2 * curvature A DA x 1 3).trace +
      (curvature A DA x 0 3 * curvature A DA x 1 2).trace)).re = 8 * Real.pi ^ 2 * n := by
  sorry
```

The integrand is the `dx¹ ∧ dx² ∧ dx³ ∧ dx⁴` coefficient of `tr(F ∧ F)`, which matches §6.4's
`c₂ = (8π²)⁻¹ ∫ tr(F ∧ F)`. The source asserts this integrality for every finite-energy connection
(OhTataru-TopClass line 858).

**Repair.**
- Add the two definitions and the theorem to `Suggested.lean` under `/-! ## Layer 6 … -/`, each with a
  docstring. Optionally add the surjectivity half of "completeness" (for every `n : ℤ` some potential has
  integral `8π²n`), which uses the same two definitions.
- Name the two definitions and the theorem in §6.4's API bullets.
- Narrow the docstring's Layer 6 bullet to what stays unstatable:
  - injectivity of `[a] ↦ c₂(a)`, which needs `Top(4, SU(2))`;
  - the general-`G` statements of §§6.2–6.3, which need a structure-group carrier.

## R02 (P2) — The `vector-valued-wkp` gap asks PDE for the order-one class that Tau Ceti already provides

**Location.** `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/README.md`:
- line 346: "What PDE must provide (gap:vector-valued-wkp): For a finite-dimensional real normed space `V` …
  the space `W^{k,p}(Ω; V)` … complete for the sum of the `L^p` norms …";
- lines 271–276, the From Tau Ceti contract, which offers only `TauCeti.HasWeakFDerivOn`, `TauCeti.W1p` and
  `TauCeti.Wkp`.

`Suggested.lean` lines 14–17 say the same: "The pins have … the scalar classes `TauCeti.W1p` and `TauCeti.Wkp`,
but not these classes".

**Claim.** A gap must not ask for what the pins already provide. At `k = 1` the requested class, its
completeness, its intrinsic weak-derivative characterisation and its coordinate maps to the scalar class are
all pinned Tau Ceti declarations. The contract does not cite them.

**Witness.** In Tau Ceti, `Analysis/Sobolev/GraphStep/`:
- `TauCeti.WeakDerivStep` (`Basic.lean:209`), taken with `base = ContinuousLinearMap.id` on
  `Lp V p (μ.restrict Ω)`, is `W^{1,p}(Ω; V)` for every complete `V`;
- `CompleteSpace (WeakDerivStep …)` is an instance (`Basic.lean:398`);
- `TauCeti.mem_weakDerivStepSubmodule_iff_hasWeakFDerivOn` (`Basic.lean:184`) characterises membership by
  `HasWeakFDerivOn`;
- `TauCeti.WeakDerivStep.toW1pL` (`ScalarProjection.lean:118`) maps it to `TauCeti.W1p` through any
  functional `V →L[ℝ] ℝ`.

`TauCeti.Wkp` is itself built by iterating this step for scalar fields (`Wkp/Basic.lean:145`).

**Repair.**
- Cite these four declarations, with their files, under From Tau Ceti.
- Restrict the gap's `needs` sentence to what is missing:
  - the orders `k ≥ 2` for `V`-valued fields, by iterating `TauCeti.WeakDerivStep` as `TauCeti.Wkp` does for
    `ℝ`;
  - the continuous linear equivalence with `dim V` copies of `TauCeti.Wkp`;
  - the local class `W^{k,p}_loc(Ω; V)`.
- Restate §2.1's first sentence to match.
- In `Suggested.lean` lines 14–17, say that the order-one class on an open set exists as
  `TauCeti.WeakDerivStep`, and that the local classes and the critical `G`-valued gauges are what is missing.

## R03 (P3) — LocalVariationalFieldTheory is cited at the wrong layer for the Yang–Mills Euler–Lagrange expression

**Location.** README lines 85–86: "the jet-level Yang–Mills Euler–Lagrange and Noether identities are
LocalVariationalFieldTheory's (Layer 5)".

**Witness.** In LocalVariationalFieldTheory on main:
- the Yang–Mills Euler expression `e_A = −D_A†F_A`, with `E^μ = D_νF^{νμ}`, is derived in §4.1 (Layer 4,
  "Noether I and symmetry currents", README line 794);
- Layer 5 (line 822) is "Noether II, reducibility, and identities", and its §5.2 (line 862) derives the
  identity `D_A†e_A = 0`.

**Repair.** Write "are LocalVariationalFieldTheory's (§4.1 for the Euler expression and its currents, §5.2 for
the gauge identity)".

## R04 (P3) — Three sentences of the pull request description do not match the head

**Location.** The description of pull request #2164.

1. "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and
   Tau Ceti". At the head, `Suggested.lean` declares nothing; its docstring lists every headline as not
   statable. **Replace with:** "`Suggested.lean` declares nothing yet; its module docstring lists each headline
   theorem and the carrier the pins lack for it." If R01 is repaired, name the §6.4 statement instead.
2. "none of them is built in Mathlib, Tau Ceti or another roadmap". The head's README (lines 121–126) says
   FourManifolds §5.3 states Uhlenbeck's small-curvature Coulomb gauge on the unit 4-ball for `SU(2)`, the
   case `G = SU(2)`, `d = 4` of §4.1. **Replace with:** "none of them is built in Mathlib, Tau Ceti or a roadmap
   on main; the open FourManifolds roadmap states the case `G = SU(2)`, `d = 4` of Uhlenbeck's lemma, which
   this roadmap, earlier in the merge order, owns in general".
3. "everything else named in the README is a consumer, not a prerequisite". FourManifolds and
   InstantonFloerTheory are named (README lines 85–87, 121–132), are not on main, and are not consumers:
   FourManifolds' README at its head does not cite this roadmap. **Replace with:** "FourManifolds and
   InstantonFloerTheory, both later in the merge order, are named only for the closed-manifold theory this
   roadmap leaves to them; the hyperbolic Yang–Mills roadmap of Downstream consumers is the only consumer."

## Verified sound

**Gate and build.**
- I re-ran the push gate at this head. Every check is 0 and the result is `OK`; the worker's
  `gate.md` agrees.
- `lake env lean` on `Suggested.lean`: exit 0, no diagnostics. The file has no declarations, so there was
  nothing for the `#check @name` audit or the one-tactic padding probe to check.
- The elaborated-signature tool failed with "Unknown identifier `on`", and the generated change list shows
  "+ on". Both are artifacts: docstring line 25 begins with "lemma on the punctured ball". Not a defect in
  the file.
- Dependency check: `depcheck: 236 roadmaps, 2139 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:`
  line.
- In the merge order this roadmap is line 14, right after SmoothBundlesConnections (line 13). Every supplier
  it cites is on main. FourManifolds (line 134) and InstantonFloerTheory (line 297) are named only as owners
  of excluded material, never in a `*Needs:*` line.
- Nothing changes outside the folder.

**Source sample.** All 15 sampled targets were read at their locators. The theorem number, line range,
hypotheses and support are as cited for each:
- §2.2: TopClass Lemma 3.2, lines 1038–1072.
- §3.3: Propositions 3.9–3.10 and Scenarios (1)–(3), lines 1165–1347.
- §5.3: Proposition 1.6 and Remark 1.7, lines 397–405; proof lines 1666–1686.
- §6.2: Corollary 1.10, lines 445–448 and 460–462.
- §6.4: lines 256–264 and 852–860.
- §7.7: TopClass Theorem 1.32 (910–918) and §6 (2300–2451); YMHF Theorem 6.10 (2905–2918); Threshold
  Theorem 1.6 (277–283).
- §8.4: YMHF Theorems 4.7–4.8, lines 1346–1530.
- §9.3: Theorem 5.9, lines 1873–1875.
- §9.4: Theorems 5.10–5.11 and Corollaries 5.12–5.14, lines 1878–1948.
- §9.5: Corollary 5.15 (1952–1957); Lemma 5.33 (2509–2555).
- §9.6: Theorem 6.1, lines 2562–2589.
- §10.1: lines 552–560 and 584–592; Lemma 7.3, lines 3163–3166.
- §10.2: Definition 7.1, Proposition 7.2, Proposition 7.4 and Corollary 7.6 (3000–3008, 3213–3278); Theorems
  2.18 and 2.20 (571–592).
- §10.3: Proposition 7.7 (3286–3290) against Lemma 5.30 (2419–2423).
- §10.5: Definition 2.21 and Theorem 2.22 (604–619); lines 3347–3361; Proposition 7.9 (3363–3385).

Every departure the README states from these sources is correct; I checked each one (Source issues below).
One value was confirmed on the rendered page rather than the text extraction: on TopClass p. 49 the PDF
prints `γ₁ = (2/√3)γ₀ = 4/√6`, which the extraction garbled. It agrees with the README's §1.6 constant
`2√6/3` after the change of norm.

**Adversarial pass.** Values computed by hand, or by a short pure-Python script for the §1.6 and §7.4 rows.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: gauge action `O·A = Ad(O)A − O;x` | `U(1)`, `A = i x₁dx₂`, `O = e^{iφ}`; `SU(2)`, `O = exp(x₁i)exp(x₂j)` | `F₁₂ = i`, `O·A = A − i dφ`; `F₁₂[R] = 2[i,j] = 4k` against `F₁₂[−R] = 0` | sign pinned | none |
| Conventions: SBC's `s′ = s·g` is `O = g⁻¹` | general `g` | `Ad(g⁻¹)A − d(g⁻¹)g = Ad(g⁻¹)A + g⁻¹dg`, which is SBC B3.1 | agrees | none |
| Conventions: `⟨F ∧ F⟩` carries the factor `¼` | `F = X(dx¹² + dx³⁴)` | `\|F\|² = 2\|X\|²`, coefficient `2\|X\|²`; the all-index sum gives `8\|X\|² > 2\|X\|²` | correct; (1.26) misprint confirmed | none |
| 1.2: `U(N)` nearest point | `M_t = [[1,t],[0,1]]` | `U*M = (4+t²)^{−1/2}[[2,t],[t,t²+2]]`, symmetric with determinant `t²+4 > 0`; at `t = 1`, distance² `5 − 2√5 ≈ 0.528 < 1` | correct | none |
| 1.3: corrected Leibniz rule | `X = i`, `g = exp(πk/4)`, `Y = j` | `Ad(g)i = j`; `[O;1, Ad(O)Y] = 2k`; source form `Ad(g)[j,j] = 0` | README right, source misprint | none |
| 1.4: `∫_{S³} Φ*ω_f = −8π²` | frame `dΦ(e₂,e₃,e₄) = (k,i,j)` | `ij = k`, `kij = −1`, `kji = 1`; `tr θ³ = 3(−2 − 2) = −12`; `−12 · 2π² = −24π²`; `⅓ ⇒ −8π²`; a `1/k!` gives `−4π²` | correct | none |
| 1.5: Bogomol'nyi pointwise | self-dual `X(dx¹²+dx³⁴)`; `X dx¹²` | `2\|X\|² = 2\|X\|²`; `\|X\|² > 0` | correct | none |
| 1.6: `γ₀(𝔰𝔲(2), −tr) = √2` | `k`, `i` | `\|[k,i]\|² = 8`, `\|k\|²\|i\|² = 4` | correct | none |
| 1.6: `⟨ω,𝔉_ω(ω)⟩ = ±6√2⟨ω¹,[ω²,ω³]⟩` and the `2√6/3` bound | explicit basis, `ω^a = (i,j,k)`; 1500 random `𝔰𝔲(2)` triples | `−33.9411 = −24√2`; identity exact with sign `−`; maximum ratio `2.2178 ≤ 2.3094 = (2√6/3)√2` | correct | none |
| 1.6: factor constants | `𝔰𝔲(2)⊕𝔰𝔲(2)`, `−tr ⊕ −4tr`; a cross term `c` | `max(√2, √2/2) = √2`; a sum gives `3√2/2`, an RMS gives `√5/2`; cross term `4c ≠ 0` | correct | none |
| 2.1: critical map not continuous | `φ = log log(1/\|x\|)`, `d = 4` | `∫dr/(r log²)`, `∫dr/(r log⁴) < ∞`; vortex `∫ρ^{−2}dρ = ∞` | correct | none |
| 2.2: approximation (sampled) | source `h = 1` on `W` against half-balls `V`, `W` | closures meet on `{x₁ = 0}`, so no continuous `h`; `exp(−1/x₁)`·bump is positive exactly on `W` | README right, source gap | none |
| 2.4: top-order `Ad(O)B` | `O = exp(√L i)`, `B = √L j`, `L = log(1/r)` | `∫\|∂O\|⁴ = (1/16)∫₁^∞L^{−2}dL < ∞`; rotating part `≈ 1/r`, so `∫dr/r = ∞`; constant `B`: `∫dr/(rL²) < ∞` | correct | none |
| 3.3: Lebesgue margin (sampled) | eight balls `±0.9 e_j` in `ℝ⁴` | `max(r² − ar + a²) = max(0.81, 0.91) < 1`; separation `1.27`; margin `≤ 0.1` | README right, Remark 3.8 wrong | none |
| 3.4: BPST mass | `u = s²` | `96π²∫₀^r s³(1+s²)^{−4} = 8π²r⁴(r²+3)/(r²+1)³`; limit `8π²`; small `r`: `24π²r⁴` | correct | none |
| 5.3: homotopy up to constants (sampled) | `U(1)` phases; `G = {±1}`, `A = 0` | `i(−dθ′ + dψ + dθ) = 0`, swapped `2i dψ`; constants `1` and `−1` both gauges at infinity | correct | none |
| 5.4: perturbation needs a good representative | `A = −2x₁ i dx¹`, `b = j dx²/(1+\|x\|²)` | `F = 0`; `F₁₂[A+b] ∋ −4x₁k/(1+\|x\|²)`, so `∫₁^∞ r dr = ∞` | correct | none |
| 6.1: cut-off factor | `η′ = M` near `3e₂` | `∂₁(x₁/\|x\|) = 1/3`; `k`-part `−2Mβ/3`, linear in `M` | correct | none |
| 6.2–6.4: sign `c₂ = −deg` (sampled) | `Φ(x/\|x\|)`; BPST `Φ(x̄/\|x\|)` | `χ = −8π²`, `c₂ = −1`; degree `(−1)³ = −1`, so `c₂ = 1`; ASD `↔ c₂ > 0` (TopClass 869–870) | consistent | none |
| 6.3: `ℰ_e − χ = 2∫\|F⁺\|²` | pointwise identities | `ℰ_e − χ = (\|F⁺\|²+\|F⁻\|²) − (\|F⁻\|²−\|F⁺\|²)`; `I₊ = I₋ = 1` gives a gap of `2` | correct | none |
| 6.4: statability | probe (R01) | elaborates; only `sorry` warning | statable | R01 |
| 7.4: Weitzenböck sign and Kato | self-dual BPST, `u = 48^{1/4}/(1+r²)` | `Δu = −8u/(1+r²)²` equals the right side; at `0`: `½Δ\|F⁺\|² = −768`, `⟨F⁺,𝔉⟩ = 768` (script) | correct | none |
| 7.5: gap constant | chain with `Y(S⁴) = 8√6π` | `8√6π‖F⁺‖ ≤ 2√6γ₀‖F⁺‖² ⇒ ∫\|F⁺\|² ≥ 16π²/γ₀² = 8π²`; `𝔰𝔲(2)⊕𝔰𝔲(2)` pair: `16π² = 0 + 32π²/2` | correct | none |
| 7.6: BPST is ASD | `dx̄ ∧ dx` at `0` | `(12)` coefficient `2k`, `(34)` `−2k` (README matrices), so ASD; `\|F\|² = 6 · 8 = 48`, `ℰ_e = 8π²` | correct | none |
| 7.7: `E_GS = 16π²/γ₀²` (sampled) | TopClass normalisation `⟨α,α⟩ = 2` | `16π²/2 = 8π²` = BPST; inner product `× c` gives `E_GS × c` | correct | none |
| 8.1: realised spaces | `\|D\|^{−1}` kernel; heat block `k = 0, −1`; thin shell | `Γ(3/2)/(2π²Γ(1/2)) = 1/(4π²)`; `e^{−4π²t}`, `e^{−π²t}`; ratio `(4π)^σ`, against `2^σ` | correct | none |
| 8.3: `ℓ²L¹`, not `L¹` | `A = 0`, `K` blocks of `Ḣ^{−1}` size `K^{−1/2}` | `‖∇e^{sΔ}b‖_{L¹L²} ≳ K · K^{−1/2} = K^{1/2}` against `‖b‖ ≈ 1` | README right, Thm 4.6 wrong | none |
| 8.4: `p = ∞` continuity (sampled) | `\|D\|^{−1}b = sign(x₁)` | `e^{sΔ}g = erf(x₁/2√s)`, sup distance `1` for all `s > 0`; exponent `1−β` (4.32) against `1−α/2` (4.34) | README right | none |
| 9.1: curvature order | `A = (i,j,k,0)` | `F₁₂ = 2k`, `F₁₃ = −2j`, `F₂₃ = 2i`; `Δ_AF₁₂ = −16k = −2[F₁₃,F₂₃]`; `∂_sF₁₂ = −32k` | correct | none |
| 9.1: dissipation factor 2 | abelian mode `αe^{2πiξx}` | `d/ds = −32π⁴\|ξ\|⁴\|α\|²…`, `Σ\|∂f\|² = 16π⁴\|ξ\|⁴\|α\|²…`, ratio `2` | README right, (1.19) misprint | none |
| 9.2: `ds/s` weight | parabolic dilation | `λ^{2+n−4/q}λ^{−2(n/2+1−2/q)} = 1`; extra weight `λ^{−1/2}` at `p = ∞`, `q = 4` | correct | none |
| 9.3–9.4: lifespan and `Q` (sampled) | dilation; flat data; `Q = 0` | `s₀ ↦ λ^{−2}s₀`; `λ⁶λ^{−4}λ^{−2} = 1`; flat `Q = 0`; `s₀ = ∞` admits no larger interval; `2Q = 0` would force `F = 0` | correct | none |
| 9.5: operator-norm `C¹` (sampled) | `sin` on `L²(0,1)`, `u_n = π1_{(0,1/n)}` | `‖u_n‖ = π/√n`; `‖cos u_n − 1‖_op = 2`; relative error `1` | correct | none |
| 9.6–9.7: dichotomy and threshold (sampled) | small energy; BPST outside `Ḣ¹` | `ℰ_e(Q) ≥ E_GS > ε`; `\|A_BPST\| ≈ \|x\|^{−1} ∉ L⁴` | correct | none |
| 10.1: uniqueness side | `U(1)`, `a = i∇φ`; `O ↦ cO` against `Oc` | `O·a = 0`; `cO` kills `a`; `(Oc)⁻¹∂(Oc) = Ad(c⁻¹)a` | README right ("left" multiplication) | none |
| 10.2: derivative of `Cal` (sampled) | `U(1)`, `ã_t = it dφ` | `ψ = iφ`, `dO = iφ`, `dCal = 0`; the opposite sign gives `2i dφ` | correct | none |
| 10.3: homogeneous `Ẇ^{1,4/3}` (sampled) | `h_λ = λ²h(λ·)`; two `SU(2)` packets | `‖h_λ‖_{4/3} = λ^{−1}‖h‖`; symbol `(1−4)/5 · 2k = −6k/5 ≠ 0` | README right, Prop 7.7 misprint | none |
| 10.4: split submanifold | unit sphere chart; graph of `\|x₁\|` | `(y − ⟨y,e⟩e)/⟨y,e⟩ = v`; `t ↦ (t³,\|t\|³)` has derivative `0` at `0` | correct | none |
| 10.5: projection (sampled) | `w = D(a)c₀`; `U(1)` | `b = 0`, `c = −c₀`; `Π_a` = Leray | correct | none |
| Gap `inhomogeneous-besov-partition` | PDE §7.1 blocks at `\|ξ\| = 2` | `χ(ξ) + 1 − χ(ξ/2) = 0 + 1 − 1 = 0` (PDE lines 2670–2676) | gap justified | none |
| Gap `vector-valued-wkp` | `TauCeti.WeakDerivStep`, `base = id` | `k = 1` class, completeness and coordinate maps pinned | not minimal | R02 |

**Library declarations opened at the pins.**
- Mathlib:
  - `LinearAlgebra/UnitaryGroup.lean`: `unitaryGroup`, `specialUnitaryGroup` section at 272;
  - `Analysis/Normed/Algebra/Exponential.lean:521` (`exp_add_of_commute`);
  - `Analysis/Normed/Algebra/MatrixExponential.lean:145` (`isUnit_exp`);
  - `Algebra/Lie/Killing.lean:76` (`instSemisimple`);
  - `Algebra/Lie/Semisimple/Basic.lean:133` (`isSimple_of_isAtom`);
  - `Topology/Homotopy/Basic.lean:354` (`Homotopic.equivalence`);
  - `Topology/Homotopy/HomotopyGroup.lean:441`;
  - `Analysis/FunctionalSpaces/SobolevInequality.lean:602`;
  - `MeasureTheory/Constructions/HaarToSphere.lean:52`;
  - `Analysis/Normed/Module/Ball/RadialEquiv.lean:71`;
  - `Analysis/Distribution/FourierMultiplier.lean:143` (`TemperedDistribution.fourierMultiplierCLM`);
  - `Analysis/Distribution/TemperedDistribution.lean:160`;
  - `Geometry/Manifold/SmoothEmbedding.lean:70`;
  - `Geometry/Manifold/Immersion.lean:1008` (`IsImmersion.isDiffImmersionAt`);
  - `Geometry/Manifold/HasGroupoid.lean:284`;
  - `Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31` and `:66`;
  - `Analysis/InnerProductSpace/Orientation.lean:170`;
  - `Analysis/Matrix/Normed.lean:537` and `:562`.
- Tau Ceti:
  - `Analysis/Sobolev/WeakDeriv/Basic.lean:251` (`HasWeakFDerivOn`);
  - `Analysis/Sobolev/W1p/Basic.lean:372`, scalar `Lp ℝ`;
  - `Analysis/Sobolev/Wkp/Basic.lean:145`;
  - `Analysis/Sobolev/D1p0/Basic.lean:117` and `:246`;
  - `Analysis/Sobolev/Wkp/MeyersSerrin.lean:291`;
  - `Analysis/Fourier/MihlinHormander.lean:300`;
  - `Analysis/Calculus/IteratedFDeriv/Homogeneous.lean:40`;
  - `AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean:161`;
  - `Analysis/Sobolev/Morrey.lean:181`;
  - `Analysis/PDE/HeatKernel/Basic.lean:76`;
  - `Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:157`;
  - `Geometry/Manifold/DifferentialForm/ExtDeriv.lean:145` (`mextDeriv`);
  - `Geometry/Manifold/DifferentialForm/Wedge/Basic.lean:238` (`RoughForm.wedgeWith`);
  - `Analysis/Sobolev/GraphStep/Basic.lean:184, 209, 398` and `ScalarProjection.lean:118` (see R02).

**Cross-roadmap citations resolved on main.**
- SmoothBundlesConnections B3.1 (line 871), B4.1 (979), B4.2 (1010); I checked their formulas against §1.3
  and the Conventions. Part II is assigned in its scope at lines 64–69. The open revision of
  SmoothBundlesConnections keeps B3.1, B4.1 and B4.2.
- CharacteristicClasses C4 item 1 (1321) and C5a.3 (1530–1560), with the normalisation `CS_P` and no
  `1/k!` (line 180).
- RiemannianGeometry R6 (3358; nearest-point retraction and uniform radius at 3476–3480).
- DifferentialGeometry Layer 0 (691), Layer 1 (862), 5.2 (1705), 5.3 (1735), 5.4 (1757), 10.3–10.5
  (2716, 2750).
- AlgebraicTopology §6.5 (2967) and §8.3 (3334).
- LieGroups Layers 0, 1, 2, 5A, 6 (252, 301, 356, 641, 673), including the "Compact real roots…" and
  "Rank-one representatives" items.
- Yamabe Y2 item 1 (150).
- PDE §§1.2, 1.4, 1.5 (ball case and linear scaling), 1.6, 2.2, 2.3 (Riesz multiplier `−iξ_j/\|ξ\|`), 3.2,
  6.1, 6.3, 7.1 (heat-block estimate for `j ≥ 1`; the first Check on `P_{j−1}`), 7.2, 7.3.
- HamiltonianReduction R5 and SeibergWittenTheory SW4.
- LocalVariationalFieldTheory: see R03.

**Gaps.** All six slugs appear both in `design/plan.json` and under Exact supplier contracts. For four of
them nothing at the pins or on main provides what is asked, so I found no overlap:
- `lp-neumann-ball`: PDE has no Lᵖ Neumann problem on main. The open PDE revision's "Lane G" treats `L²`
  mixed and Neumann problems on Lipschitz domains, not `W^{2,p}` on the ball.
- `lp-divcurl-normal-ball`: no normal-component div–curl estimate at the pins.
- `hardy-inequality`: no `ℝ^d` Hardy inequality in Mathlib, Tau Ceti or PDE; other open roadmaps have only
  the half-line and fractional ones.
- `compact-su2-subalgebra`: LieGroups Layer 6 builds the rank-one subalgebras but not the metric
  extremality.

`inhomogeneous-besov-partition` is justified by PDE §7.1's own definitions; `vector-valued-wkp` is R02. None
has supplier `none`.

**Ownership and duplication.**
- Neither Mathlib nor Tau Ceti has a Yang–Mills, caloric, Chern–Simons or Uhlenbeck object. Tau Ceti's
  `SeibergWitten` files are abelian.
- Tau Ceti `Geometry/Manifold/Riemannian/SelfDual.lean` proves the self-dual splitting for real-valued forms:
  `RoughForm.alternatingFormInner_self_eq_add` (324), `wedge_self_apply` (338) and
  `selfDualPart_neg_orientation` (163). §1.5 is the `𝔤`-valued pointwise version, so it is not a
  duplicate; citing those lemmas in §1.5's route would shorten it.
- FourManifolds (open, merge-order line 134) §5.3 states the `SU(2)`, `d = 4` case of §4.1. This roadmap is
  earlier and owns the general statement, so FourManifolds should cite it; that repair belongs to
  FourManifolds' review.
- InstantonFloerTheory consumes FourManifolds, not this roadmap.
- The `overlaps.md` facts were checked: no other open pull request changes this roadmap, none drops an id it
  cites, and it drops none.

**Headline theorems** (Summary, lines 13–22):
- §3.2: gauge invariance of finite energy.
- §4.1: Uhlenbeck's lemma.
- §5.2: the good global gauge.
- §§5.4–5.5: the topological class and the trivial class.
- §6.2: topological invariance of characteristic numbers.
- §6.3: the Bogomol'nyi bound.
- §6.4: integrality and completeness of `c₂`.
- §§7.5 and 7.7: the energy gap and the ground state.
- §§9.3–9.5: local well-posedness, continuation and flat limits.
- §§9.6–9.7: the Dichotomy and Threshold Theorems.
- §10.2: the caloric gauge.
- §§10.4–10.5: the caloric manifold, its tangent spaces and the nonlinear div–curl decomposition.

Apart from R01, I accept the docstring's reasons for non-statability:
- the local `G`-valued gauge classes and the gauge action (§§3–5);
- the topological-class quotient (§§5.4, 6.2, and injectivity in 6.4);
- a structure-group carrier for general `G` (§§6.3, 7.5, 7.7);
- realised homogeneous and Besov spaces (Layer 8);
- the flow-solution carriers (Layers 9–10).

## Not verifiable

- Uhlenbeck-LpCurvature Theorem 1.3, Uhlenbeck-RemovableSingularities Theorem 4.1, FreedUhlenbeck-Instantons
  Ch. 3, DonaldsonKronheimer Ch. 3, Bogomolnyi-Stability, MimuraToda-TopologyLieGroups Ch. IV–V, and
  BahouriCheminDanchin-FourierAnalysis Definition 2.15, the §2.3 completeness theorem and §2.6. The
  manifest records all of them as `uncertified` (paywalled; cited by locator), so I did not read them. No
  sampled target rests on them alone.
- §9.6's claim that OhTataru-YMHF's proof of Theorem 6.1 does not show `x_n → x₀`. I read the statement
  (lines 2562–2589) but not the whole proof (lines 2605–2786). The README's weaker statement omits the
  clause, so the target as written is supported either way.
- §§9.5 and 10.2's operator-norm Fréchet routes go beyond the source's curve argument. I checked their
  structure and the `sin` counterexample but not every difference estimate.

## Source issues

- **Misprint** in OhTataru-TopClass at Lemma 3.4(3), p. 22: the source says the second term of
  `∂(Ad(O)B)` is `Ad(O)[O;x, B]`; it should be `[O;x, Ad(O)B]`, equivalently `Ad(O)[O⁻¹∂O, B]`; affects a
  stated result.
- **Error** in OhTataru-TopClass at Lemma 3.4(2), p. 22: the source says `Ad(O)B` is continuous into
  `W^{k′,d/k}_loc` up to `k′ = k`; it should require `B ∈ L^∞_loc` at `k′ = k`, since `O = exp(√L i)`,
  `B = √L j`, `d = 4`, `k = 1` fail; affects a stated result.
- **Gap** in OhTataru-TopClass at Lemma 3.2 proof, p. 21: the source says a smooth `h` equal to `0` on `V`
  and `1` on `W` exists when `V ∩ W = ∅`; it should take `h` zero on `V` and off `U` and positive on `W`,
  since the closures may meet; affects the proof.
- **Misprint** in OhTataru-TopClass at Proposition 3.9, p. 26: the source says the global potential lies in
  `W^{k,d/k}(B_R)`; it should be `W^{k−1,d/k}(B_R)`, as its displayed bound states; affects a stated result.
- **Error** in OhTataru-TopClass at Remark 3.8, p. 26: the source says uniformly separated unit balls have a
  Lebesgue constant of order one; it should let constants depend on the Lebesgue number, since eight balls
  at `±(1−ε)e_j` have margin at most `ε`; affects the proof.
- **Misprint** in OhTataru-TopClass at (1.26), p. 17: the source says `−⟨F ∧ F⟩` is the all-index sum
  without a factor; it should carry `¼`, as in OhTataru-YMHF (6.11); affects a stated result.
- **Error** in OhTataru-TopClass at Proposition 1.6(1) and Lemma 3.21, pp. 9 and 33: the source says gauges
  at infinity are homotopic and extension holds iff `[O] = [id]`; for disconnected `G` it should be "up to
  constants" and "the class of a constant map"; affects a stated result.
- **Misprint** in OhTataru-TopClass at Lemma 3.22, p. 33: the source says `O ∈ G^{2,d/2}(ℝ^d ∖ B)`, an
  inhomogeneous class that no unitary map on an infinite-measure set belongs to; it should assume local
  regularity with `∂O ∈ L^d`; affects a stated result.
- **Misprint** in OhTataru-YMHF at (1.19), p. 6: the source says `dE_e/ds = −∫|D^jF_jk|²`; it should be
  `−2∫|D^jF_jk|²` for `E_e = ½∫⟨F_jk, F^jk⟩`, as an abelian mode shows; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.6, p. 29: the source says the bound holds for `‖DB‖_{L¹Ḣ^σ}`; it
  should be `‖DB‖_{ℓ²L¹Ḣ^σ}`, the norm its proof sums, since `K` dyadic blocks give `L¹L² ≳ K^{1/2}`;
  affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.7, p. 30: the source says `B ∈ C([0,∞); Ẇ^{σ,p})` also at
  `p = ∞`; it should restrict continuity at `s = 0` to the heat-continuous data, since `|D|^{−1}b = sign(x₁)`
  stays at distance `1`; affects a stated result.
- **Misprint** in OhTataru-YMHF at Theorem 4.8, (4.34)–(4.35), p. 33: the source says the exponent is
  `1 − α/2`; it should be `1 − β`, matching (4.32); affects a stated result.
- **Gap** in OhTataru-YMHF at Lemma 5.33(1), Step 3, p. 55: the source says `C¹` dependence of `A_∞` follows
  from differentiating along `C¹` curves; it should prove operator-norm continuity of the derivative; affects
  the proof.
- **Gap** in OhTataru-YMHF at Corollary 5.15, p. 42: the source says the linearised limit exists for
  `−1 < σ < 2`; its proof, Lemma 5.33(2) on p. 54, covers `0 ≤ σ ≤ 1` only; affects a stated result.
- **Misprint** in OhTataru-YMHF at Proposition 7.7, (7.7), p. 69: the source says the divergence is bounded in
  inhomogeneous `W^{1,4/3}`; it should be `Ẇ^{1,4/3}`, as in Lemma 5.30, since `L^{4/3}` scales by `λ^{−1}`;
  affects a stated result.
