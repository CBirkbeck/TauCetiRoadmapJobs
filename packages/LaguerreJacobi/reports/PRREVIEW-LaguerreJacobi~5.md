# Review of LaguerreJacobi (pull request #117 at 7789316)

**Verdict:** needs changes

## R01 (P3) — a Mathlib declaration Layer 5 now consumes is not in the supplier contracts

**Location:** `TauCetiRoadmap/LaguerreJacobi/README.md` line 706: "*Needs:* §§2.4, 4.4; Mathlib `MeasureTheory.Measure.restrict_pi_pi`; Tau Ceti `TauCeti.piHilbertBasis`, `TauCeti.coeFn_piHilbertBasis`."; line 721: "Layers 2 and 4; Tau Ceti `TauCeti.piHilbertBasis`."
**Claim:** `## Exact supplier contracts` (lines 133–205) names every library declaration the layers consume.
**Witness:** `restrict_pi_pi` occurs at lines 702 and 706 only; `### From Mathlib` (lines 135–168) does not list it. The identification of lines 702–704 also uses `MeasureTheory.volume_pi`: `rw [volume_pi, Measure.restrict_pi_pi]` closes it at the pin.
**Repair:**
- Add under `### From Mathlib`: "- `MeasureTheory.Measure.restrict_pi_pi` (`Mathlib/MeasureTheory/Constructions/Pi.lean`): for σ-finite `μ i`, `(Measure.pi μ).restrict (Set.univ.pi s) = Measure.pi fun i => (μ i).restrict (s i)`; with `MeasureTheory.volume_pi` it identifies the measures of the last two targets of Layer 5 with Lebesgue measure restricted to the orthant and to the cube."
- Line 721: "Layers 2 and 4; Mathlib `MeasureTheory.Measure.restrict_pi_pi`; Tau Ceti `TauCeti.piHilbertBasis`."

## Previous findings

- R01 — repaired: lines 694–700 add `Polynomial.exists_hilbertBasis_pi_laguerreFunction` and `Polynomial.exists_hilbertBasis_pi_jacobiFunction` over `Measure.pi fun _ : ι => volume.restrict …`; both are in `Suggested.lean` (lines 348–378); lines 692 and 715–717 reworded. The new *Needs:* entry is R01 above.
- R02 — repaired: `Suggested.lean` lines 129–135, `tendsto_atTop_eval_mul_iteratedDeriv_laguerreWeight (q : ℝ[X]) (α : ℝ) (j n : ℕ)`; README lines 375–386, "a polynomial times a derivative of order below `n`".
- R03 — repaired: README line 216 "qualified by `Polynomial`", lines 442–443 "Names live in the namespace `Polynomial`"; `Suggested.lean` lines 34–35 "live in the namespace `Polynomial`".
- R04 — repaired: line 221, "Roadmaps that cite these targets by the ids A1–F3 read them as follows:".
- R05 — repaired: lines 30–32, "`jacobiSym`, `jacobiSum`, `jacobiTheta`, the Jacobi identity, and Jacobian matrices and determinants".
- R06 — repaired: lines 859–864, "Chapters 5, 14 and 18 … 18.9.1 with Table 18.9.1 … 14.17.6 (Legendre orthogonality); 5.12.1 (the Beta integral)"; the 19 DLMF locators of the text and of the entry coincide.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.3 boundary term at `∞` (`tendsto_atTop_eval_mul_iteratedDeriv_laguerreWeight`) | `(α,n,j,deg q)` = `(−1/2,2,0,1)`, `(−1/2,2,1,3)`, `(−7/2,0,2,4)`, `(2.3,3,5,6)`; `t = 20, 60, 150` | `t^deg ·` derivative: 3.7e-6, 2.4e-22, 2.0e-60; −1.4e-3, −8.6e-19, −4.4e-56; 1.3e-8, 7.6e-26, 9.2e-65; −1.6e5, −6.7e-7, −2.3e-41 | holds (no hypothesis on `α` needed: every summand is `e^{-t} t^s`) | — |
| 2.3 route against the pinned lemma | `m = 1`, `j = 0`, `α = 0`, `n = 1` | `(1+α−t)e^{-t}t^{n+α}` at `t = 20, 60`: −7.8e-7, −3.1e-23; pin asks `Tendsto (u * v)` at `𝓝[>] a` and `atTop`; at `0⁺` the polynomial factor is bounded | the two targets give both boundary limits | — |
| 2.3 orthogonality (sampled; cited by the changed text) | `α ∈ {0, 1, −1/2, 7/10}`, `m, n ≤ 3`, exact rationals | `∫LₘLₙw / Γ(α+1)` vs `δ (α+1)ₙ/n!`: 64 entries equal | holds | — |
| 5 `exists_hilbertBasis_pi_laguerreFunction` (headline) | `ι = Fin 2`, same four `α`, `k = (2,1)` against `(2,1)`, `(1,1)`, `(2,0)`; `α = 0`, `k = (1,0)`; `ι` empty | inner products 1, 0, 0; `∫(1−x)²e^{-x}·∫e^{-y}` = 1·1; `√(x⁰e^{-x})` = `e^{-x/2}`, `√(Γ(k+1)/k!)` = 1; empty product 1 on the one-point space | holds; factor equals the vector of `exists_hilbertBasis_laguerreFunction` | — |
| 5 `exists_hilbertBasis_pi_jacobiFunction` (headline) | `ι = Fin 2`, `(α,β) ∈ {(0,0), (0,1), (1,2)}`, `m, n ≤ 3` exact | 48 Gram entries equal `δ hₙ`; `k = (2,1)`: 1; off-diagonal 0, 0; `(0,0)`, `k = (1,0)`: `(2/3)/(2/3) · 2/2` = 1 | holds; factor equals the vector of `exists_hilbertBasis_jacobiFunction` | — |
| 5 the measure identification (lines 702–704) | `ι` a `Fintype`, `s = Ioi 0` | `Measure.pi fun _ => volume.restrict (Ioi 0) = volume.restrict (univ.pi fun _ => Ioi 0)`: proved at the pin by `rw [volume_pi, Measure.restrict_pi_pi]` | holds | R01 |
| 5 instantiation of `TauCeti.piHilbertBasis` | pinned variable block | asks `[Fintype ι]`, `[∀ i, SigmaFinite (μ i)]`, `[RCLike 𝕜]`; `volume.restrict s` is σ-finite; no finiteness of the measure is asked | applies to both normalizations | — |
| References entry (R06) | every DLMF locator of lines 1–855 | 19 distinct locators in the text, the same 19 in the entry | complete | — |

The rows for the untouched statements stand as in the previous review, of `3e89142`.

- Source locators: 3 read again against DLMF, those the reference entry gained: 5.12.1 (`∫₀¹ t^{a−1}(1−t)^{b−1} = Γ(a)Γ(b)/Γ(a+b)`, `ℜa, ℜb > 0`), 14.17.6 (at `m = 0` the constant is `1/(n+1/2)`), 18.9.1 with the Laguerre row of Table 18.9.1 (`−1/(n+1)`, `(2n+α+1)/(n+1)`, `(n+α)/(n+1)`). Of the seeded sample only §2.3 falls in a changed passage; its locator (Table 18.3.1, `hₙ`) is unchanged.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): `MeasureTheory.Measure.restrict_pi_pi` (`Mathlib/MeasureTheory/Constructions/Pi.lean` line 417), `MeasureTheory.volume_pi`, `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`, `TauCeti.piHilbertBasis` and `TauCeti.coeFn_piHilbertBasis` (`TauCeti/Analysis/InnerProductSpace/L2/Pi.lean` lines 339, 362; variables lines 64–65).
- Gate at `7789316`: every rule 0, targeted build passes. Dependency check: `depcheck: 262 roadmaps, 2600 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder differs from the merge base.
- Elaboration: `lake env lean` of `Suggested.lean` gives 44 `sorry` warnings and nothing else. `#check @` of the three changed declarations: the elaborated types match README lines 383–386 and 694–700 (no `variable` or `include` in the file). One-tactic probe (`simp`, `rfl`, `infer_instance`, `norm_num`, `fun_prop`, `positivity`, an anonymous-constructor `exact`, `simpa using tendsto_const_nhds`) closes none of the three.
- Pull request text against this head: "Adds … (`README.md`, `metadata.toml`, `Suggested.lean`); nothing outside the folder changes", "44 `declaration uses sorry` warnings" and the Beta sentence agree with the head; the description has no summary block.
- Overlap check: read OrthogonalL2Bases, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsOrthogonalPolynomialsGeneral, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsBessel, SpecialFunctionsConfluent; ownership as in the previous review (product basis: OrthogonalL2Bases, in Tau Ceti, consumed; the families and their tensor bases: LaguerreJacobi). No open head or roadmap on main states a tensor Laguerre or Jacobi basis, and none cites the renamed `tendsto_atTop_iteratedDeriv_laguerreWeight`.
- Source independence: changed passages only; 6 passages compared with 1 source (the three locators above, the two reworded paragraphs of §2.3 and Layer 5, one new docstring), none shared beyond the formulas; largest share DLMF, 27 of 28 locators; no layer added, removed or reordered, so the contents were not compared again.
- Research link: the Laguerre and Jacobi `L²` bases are the classical expansions of DLMF Chapter 18 and Szegő's *Orthogonal Polynomials* (Ch. IV, V) and the setting of Thangavelu's *Lectures on Hermite and Laguerre Expansions*; SpecialFunctionsBessel, SpecialFunctionsConfluent, NoncompactQuantumSymmetry and QuantumFoundations consume them (README motivation, consumers and references).

## Not verifiable

- Szegő, *Orthogonal Polynomials*, §4.3 (the `α + β + 1 = 0` remark): not openly available; untouched by this change.
- Abramowitz–Stegun Ch. 22, Askey, Temme Ch. 6, Thangavelu: listed as background, with no claim located in them; not read.

## Source issues

- none

## For the human reviewers

- **Licence.** DLMF (`dlmf.nist.gov`) is the source of 27 of 28 locators; the sources service has no licence class for the host, and it was read as the publisher's own open site. NIST states a copyright on DLMF.
