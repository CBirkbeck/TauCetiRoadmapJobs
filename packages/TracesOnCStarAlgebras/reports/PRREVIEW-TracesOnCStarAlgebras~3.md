# Review of TracesOnCStarAlgebras (pull request #2464 at ce1fbe9)

**Verdict:** accepted

Incremental re-review of the 91 lines changed since 133bb83. No finding; the gate passes.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 287–296 state `IsTrace.linearMap_mul_comm_of_mem_traceIdeal` with `1 < p`; README line 584 names it; the docstring (lines 40–41) says the bilinear case is stated.
- R02 — repaired: Tr1.3 has three Checks (README lines 383–388), Tr2.3 three (lines 522–529), Tr3.4 three for `K_N` (lines 648–651); each value recomputed below.
- R03 — repaired: `### Examples` precedes `### Dependencies` in Tr2 (line 531), Tr3 (line 653) and Tr4 (line 756); 3.4 is "The compact, commutative and τ-compact cases (Tr3.4)".
- R04 — repaired: `IsTrace.eq_of_normal_extension` (`Suggested.lean` line 221) has no `hlsc`; README lines 460–464: "more generally, for a densely defined trace `τ` … (such a `τ` is then lower semicontinuous …)".
- R05 — repaired: README lines 806–809, "the normal semifinite extension of a proper (nonzero, densely defined, lower semicontinuous) weight, faithful for KMS weights; … the semifinite case without density is Dixmier's".
- R06 — repaired: the description says "the 25 `sorry`s" (25 at this head), names NoncommutativeGeometry N2–N4 and OperatorTheory/OperatorIdeals Part B under Boundaries, and lists Roe's lectures among the sources.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Tr3.2 cyclicity; `IsTrace.linearMap_mul_comm_of_mem_traceIdeal` | `(M₂, Tr)`, `a = e₁₂`, `b = e₂₁`, `p = q = 2`; `C₀(ℝ)`, `a = b = (1+t²)^{−1/2}`; `p = 1`; `τ = 0` | `ab = e₁₁`, `ba = e₂₂`, `f = 1` and `1`; `∫(1+t²)⁻¹ = π` both sides; `p = 1` forces `q⁻¹ = 0`, excluded by `1 < p`; `f = 0` | holds | none |
| Tr2.2 uniqueness without `hlsc`; `IsTrace.eq_of_normal_extension` | `(K(ℓ²), Tr)`, `π = id` and `π = id ⊕ id`; `c₀` finite-support trace | normal traces on `B(ℓ²)` are `c·Tr`, `c ∈ [0,∞]`; agreement on `K₊` forces `c = 1`; non-lsc `τ` admits no `θ₁` since `θ₁ ∘ π = sup_e θ₁(eπ(·)e)` is lsc | holds | none |
| Tr1.3 third Check | `x = [[1,1],[1,1]]` on `B = ℂ` | eigenvalues `2, 0`; `τ₂ = 1 + 1 = 2`; entry sum `4`; after diagonalising, entry sum `2 ≠ 4` | holds, discriminates | none |
| Tr2.3 Checks | identity representation of `K(ℓ²)` with `Tr`; evaluation at `x₀` with `θ = ∞·λ` | `K ∩ 𝔪_Tr = S₁` generates `B(ℓ²)`; `π_Tr = id ⊗ 1` on `ℓ² ⊗ ℓ²`, multiplicity `∞` against `1`; `𝔪_θ = 0` generates `0 ≠ ℂ`; `θ(f(x₀))` is `0` or `∞`, the trace of README lines 357–360 | holds | none |
| Tr3.4 `K_N` Checks | `B(H)`, `Tr`; `L^∞(ℝ)`; `τ(1) < ∞` | finite-rank projections, closure `K(H)`; `|{(1+t²)^{−1/2} > ε}| = 2(ε⁻² − 1)^{1/2} < ∞` for `ε < 1`, `|{1 > 1/2}| = ∞`; `1` is a finite-trace projection, ideal `N` | holds | none |
| Kustermans–Vaes entry (Tr2.2) | Definition 2.10, Proposition 2.22 | kustermans-vaes lines 117–118, 203 (proper), 509–510 (normal semifinite, extends the weight), 747 (KMS from here), 766 (faithful) | agrees | none |
| Examples of Tr2, Tr3, Tr4 | each bullet against the section it cites | `M_Tr = B(ℓ²)` (Tr2.2 Check); `J_p = S_p`, `C₀(X) ∩ Lᵖ(μ)`, `N ∩ Lᵖ(N,τ)`, `B` (Tr3.4); `Tr_* = id_ℤ`, Bott class `0`, `Hom⁺(ℤ[1/2], ℝ) = ℝ₊` (Tr4.2–Tr4.3) | agree with the sections cited | none |

The rows for untouched statements stand as in the previous review, of `133bb83`.

- Source locators checked against the text: 5 (kustermans-vaes Theorem 1.6 line 188, Proposition 1.7 line 195, Definition 2.10 line 509, Proposition 2.22 line 766; knr Definition 6.1 lines 695–697).
- Cross-roadmap citations resolved on main (`c6ef576`): AmenableTracesOnCStarAlgebras §1.4, "The GNS representation of a tracial state" (README line 671); NoncommutativeIntegration §2.1 and the Tr-internal references of the new Examples are unchanged from the previous review.
- Elaboration of `Suggested.lean` at ce1fbe9: 25 `sorry` warnings and nothing else. `#check @` on a scratch copy: both changed theorems carry `[StarOrderedRing B]` and every stated hypothesis; `eq_of_normal_extension` has `hτ`, `hd`, `hπ`, `h₁`, `h₂`, `h₁π`, `h₂π`.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `simp_all` with the definitions unfolded): neither changed theorem closes.
- Dependency check: `depcheck: 261 roadmaps, 2601 edges, 0 problem(s)`; no UPWARD or CYCLE line. Gate at ce1fbe9: every check passed. Nothing outside the roadmap folder changes.
- Pull-request text against the head: 25 targets, the pins (Lean v4.36.0-rc2, TauCeti `2fd255d`, Mathlib `1b1ccf4`), the eight supplier roadmaps and the seven sources all agree with the README and `lake-manifest.json`.
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or defines one it cites.
- Remark: the module docstring's "follow by Hölder's inequality" also uses the monotonicity `J_p ⊆ J_{m+1}` of Tr3.2, as README Tr3.3 says.

Overlap check: read SchattenClassesAndSchurMultipliers, AmenableTracesOnCStarAlgebras, NoncommutativeGeometry, VonNeumannAlgebras; nothing shared (Schatten classes and their gauges: OperatorTheory/OperatorIdeals Part B; tracial states and their GNS data: AmenableTracesOnCStarAlgebras §§1.1, 1.4; normal semifinite traces, their `L²` and `Lᵖ`: VonNeumannAlgebras V6, V10.TracialLp; Dixmier traces: NoncommutativeGeometry N4; each cited, none restated).

Source independence: changed passages only; 3 passages compared with 2 sources (kustermans-vaes, knr), none shared; largest share dixmier1963, 12 of 26 locators; no layer added, removed or reordered, so the comparison of contents with dixmier1963 stands: independent.

Research link: Tr3–Tr4 are the trace ideal `N ∩ L¹(N,τ)` and its K-theory used by Hochs–Kaad–Schemaitat (2018) for the semifinite Fuglede–Kadison determinant, the homomorphism `τ_* : K₀(K_N) → ℝ` of Kaad–Nest–Rennie (2007) for spectral flow, and Thomsen's (2022) pairing of densely defined traces with `K₀`; rests on hks §6, knr §6 and thomsen-wtk §4, which were read.

## Not verifiable

- Roe, *Lectures on K-Theory and Operator Algebras*, Lectures 14–16: not opened; the README consumes it only through OperatorKTheory K3.5.
- thomsen-kms Theorem D.1.16: the statement line is damaged in the extracted text (lines 9507–9508); Lemmas D.1.14–D.1.15, which the README cites, are legible.
- NoncommutativeIntegration §§1.4, 2.1 and VonNeumannAlgebras V10.TracialLp, V11: the sections exist on main and state what the README consumes; their own sources were not opened.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 818–819 link Roe's lecture notes on a `wpmucdn.com` host serving a `sites.psu.edu` page; the copy was not opened and the host's status as an author page was not settled.
