# FIX-RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2: red-team round 2 repaired

Files edited: `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md`, `.../Suggested.lean`, `.../sources.toml`. The plan's `gaps` list is unchanged (no finding needed a new supplier gap). All `nv21 line N` locators below refer to a Ghostscript extraction of the cached publisher PDF made in the job's scratch directory, because the cached `nv21` text is an extraction-failure placeholder (its header says no PDF text extractor was available); its line numbers agree with those both reviews cite (Lemma 10.4 at line 3688, Lemma 12.1 at 3978, Lemma 19.8 at 6058, Lemma 24.10 at 7563). Printed pages are the durable locators.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F01 (P2) — applied

Verified: nv21 Lemma 10.4 (line 3691, printed p. 81) takes `a ∈ S^{−∞}_δ`; the README's §2.7 stated the estimates with no class for a. Old → new: §2.7 now fixes `0 ≤ δ < 1/2`, a bounded family `a ∈ S^{−∞}_δ`, irreducible unitary π, σ, a functional factoring through an `H × H`-equivariant map and the trace with `|ℓ| ≤ ν`; M depends on ν, `C_N` on finitely many seminorms. The trivial-group witness `a(h) = e^{1/h}` (value `e^{1/h}`, versus `a = 1` giving 1) is a new negative-control Check. The same hypothesis already appears in §§2.6 and 4.6; no other occurrence lacked it.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F02 (P2) — applied

Verified: nv21 §25.4 (lines 7681–7690, p. 169) defines H and L only for tempered local data; §20 (lines 6475–6478, p. 143) extends `ℓ_σ` to nontempered σ "possibly zero but non-zero if possible"; §28.2 (lines 8578–8600, p. 188) lists "σ or σ′ nontempered" as a case where L is undefined and keeps `P_Σ`. Old → new: §4.5 gains a paragraph defining the auxiliary form `⟨ℓ_σ v₁, ℓ_σ v₂⟩` on nontempered σ with `ℓ_σ` nonzero whenever one exists (unique by multiplicity one), zero exactly when `Hom_H(π, σ) = 0`; §7.6's "possibly 0" and §7.2(ii) refer to it; §9.1 defines L only for tempered σ, σ′, keeps nontempered `P_Σ` unfactored and bounds it in §9.5 as a nonnegative multiple of the auxiliary form; new Checks in §§4.5 and 9.1.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F03 (P2) — applied

Verified: nv21 Lemma 19.8 proof (lines 6074–6087, printed pp. 133–134) first decomposes a into `h^{−O(1)}` pieces on balls `B(ω, h^δ)`, uses an envelope equal to 1 on the double ball and 0 off the triple ball, and proves disjointness of `s·ψ` and the piece through (19.27). The GL₂ ⊃ GL₁ witness is right: (1,1) ↦ (2, 1/2) under t = 2. Old → new: §6.3's route partitions by §1.4 first, with `max(δ, 1/2 − η/2) < δ′ < 1/2`, envelopes, the moderate-range displacement from §5.8 and trivial stabilizers (§5.3), negligible power chosen before summing; §1.4 and §5.3 added to *Needs*; the two-point witness and the separated small ball (r < 1/3) added as a Check.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F04, RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F07 (P2, P3) — applied

Verified at the open head of GanGrossPrasadUnitaryGroups: §3.3 (line 629) says "E/F is a quadratic field extension; the split model is handled separately"; §5.1a (line 1009) is the split `GL_{n+1}(F) × GL_n(F)` identity for F nonarchimedean, ℝ or ℂ, nonzero with a positive diagonal value; §5.2 (line 1049) exports "nonzero iff the local Bessel model is nonzero" through §3.3 (nonsplit) and §5.1a (split). Old → new: the contract, §4.5 (API bullet and *Needs*), §9.1 (text, Check, *Needs*) and the Layer 4 and 9 dependency lists cite §3.3 at places where E is a field, §5.1a at split places, §5.2 for the nonvanishing criterion, the orthogonal gap otherwise; `V_H = 0` is noted as needing no supplier.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F05 (P2) — applied

Verified: LieHighestWeight Layer 7 on main pins its HC and Chevalley isomorphisms "over algebraically closed characteristic-zero K with finite-dimensional Killing-semisimple L"; FormalConnectionsOpers F4.3 at its open head (lines 1455–1476, 1519–1540) builds the reductive Chevalley restriction as the semisimple one tensored with the identity on the centre and retains central affine factors; AutomorphicFormsOnReductiveGroups §2.2 states reductive infinitesimal characters. Old → new: Scope, the LieHighestWeight and FormalConnectionsOpers contracts, §2.1 (*Needs* and the 𝔤𝔩₁ Check), §5.3 and §5.5 *Needs*, and the Layer 2 and 5 dependency lists cite F4.3 and §2.2 for the reductive statements and Layer 7 only for symmetrization and the Killing-semisimple theorem.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F06 (P3) — applied

The three §7.1 bullets substituted the clauses of the definition; the §3.4 constant-sequence bullet is a topology axiom. Old → new: §7.1 has the SO(3) ⊃ SO(2) computation (spin 1, h = 1/2, heights 0, 1/2, 1, fibre radii 3/4, √5/4, empty, weights 1, 2, 0; unscaled parameter gives 1, 0, 0) and a `SO(2,1)^0` boundary Check (complementary series `h²λ² < h²` outside a window in `(1/4, 1)`; at h = 1/10 the discrete series `D_8`, `D_{10}` have 49/100, 81/100); §3.4 replaces the constant sequence by the SU(2) shrinking sphere (mass `h(2l+1) → 0`) against the U(1) point mass (mass 1). README only; no Lean examples.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a/F07 (P3) — applied

Verified visually on the rendered PDF page 166 (nv21 lines 7571–7575): the printed polynomial is `(α^{−n} + α^{−n+2} + … + α^n)/n`. The round-one transcription dropped the denominator, so `f_n(1) = n + 1` was wrong: `f_4(1) = 5/4`. Old → new: the §7.7 Check states `f_n = n^{−1} Σ α^{−n+2j}`, bound `(n+1)/n ≤ 2` on the circle, failure on the complementary interval (q = 5, α = 2, n = 4: `341/64 > 2`; growth `≥ α^n/n`), and `f_1(−2) = −5/2` on the negative interval for odd n. The source example remains defective, for the corrected reason.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F01 (P1) — applied

Verified: NilpotentOrbits N1 on main (lines 129–158) constructs χ and the nilcone only; nv21 §6.1 (line 1751, p. 42) cites `[Kos2, Theorem 3 and Remark 16]` (Kostant 1963) and `[Wh, §3]` for the uniform count. Old → new: §3.2's route states the two inputs (Jordan decomposition and finiteness of nilpotent orbits of centralizers over ℂ, bounded by kostant63 Theorem 3 and Remark 16; open `G(ℝ)`-orbits on the semialgebraic real points and Whitney's uniform finiteness of components, whitney57 §3); *Needs* cites N1.1 (the map), N2.2 (finite nilpotent orbits) and the two locators; the 𝔰𝔩₂ counts (ℂ: 2, 1, 1; ℝ: 3, 1, 2) are a new Check. The reviewer's first repair form was chosen over a gap, since both inputs are classical theorems outside NilpotentOrbits' plan. Finiteness of components for one fixed fibre is at the pin through the cylindrical algebraic decomposition (`TauCeti.exists_isCAD_signInvariant`, `TauCeti/Geometry/RealAlgebraic/CAD/Existence.lean:125`; `TauCeti.IsCAD.finite`, `TauCeti.IsCAD.isConnected`, `CAD/Basic.lean:149, 167`), cited for that much only; the bound uniform in the fibre is Whitney's.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F02 (P3) — applied

Verified: nv21 Lemma 27.5 (line 8300, p. 183) cites `[Kos1, Theorem 5.3]`, and the bibliography (lines 9395–9397) has `[Kos1]` = the 1959 principal-three-dimensional-subgroup paper, `[Kos2]` = the 1963 polynomial-rings paper. Old → new: `sources.toml` gains `kostant59` (Theorem 5.3, cited for 8.4, uncertified) and `kostant63` now has locator "Theorem 3 and Remark 16" cited for 3.2; §8.4's route and the References cite kostant59; whitney57 is also added (see F01). One work, one key.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F03 (P3) — applied

Verified: nv21 Lemma 12.1 (lines 3978–3990, p. 87) defines `b = ⟨ξ⟩^{−N}`, `A(h) = Δ_h^N Op_h(b)²` and proves `A(h) ∈ 1 + hΨ^{−1}` with `A(h)^{−1}` of norm O(1). Old → new: §3.9's route displays `Δ_h^N Op_h(⟨ξ⟩^{−N})² ∈ 1 + hΨ^{−1}` (Lemma 12.1, p. 87) and the half-order form `Δ_h^{N/2} Op_h(⟨ξ⟩^{−N/2})²` used for `tr Δ_h^{−N/2}` (proof of Theorem 12.2(ii), p. 89); the Check recomputes `4 · 1/4 = 1`, `2 · 1/2 = 1`, and the unsquared `4 · 1/2 = 2`.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F04 (P3) — applied

Verified at the open head (`TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md`): no "SB" label occurs; the content is Layer 2 §2.1, Layer 3 §§3.1 and 3.4, Layer 6 §6.1. Old → new: the four citations (contract, §0.2 and §0.6 *Needs*, Layer 0 dependencies) use the layer and section numbers.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F05 (P3) — applied

Verified mechanically: of the 22 gap sentences, only `unitary-xi-polynomial-tail` differed (the README also had a prefix "the polynomially weighted form of §2.7:" and "where … is" phrasing). Old → new: the README contract sentence is now the plan's sentence verbatim; the prefix and the equivalence `∫_{|h| > X} Ξ_G Ξ_H ≪ X^{−η}` with the log-weight remark moved to a following paragraph. All 22 now compare equal.

## RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2b/F06 (P3) — applied differently

Verified: AutomorphicSpectralTheory §0.9 at its open head opens "Consume VonNeumannAlgebras V4's complex operator trace"; VonNeumannAlgebras V4.Core owns the trace, basis independence, cyclicity and the Hilbert–Schmidt pairing at both open heads (#1041 line 887, #889 line 972). Old → new: a `From TauCetiRoadmap.VonNeumannAlgebras` subsection (V4.Core) is added and cited at every trace consumption (Scope, §§3.7, 3.8, 3.9, 4.4, 8.1, dependency lists). Differently: AutomorphicSpectralTheory §0.9 is kept, narrowed to the bound `‖BC‖₁ ≤ ‖B‖_HS ‖C‖_HS`, which §0.9 states with a locator and which neither V4.Core nor OperatorIdeals Parts B–C state (no Schatten Hölder inequality there). VonNeumannAlgebras is an open pull request adding a new folder and is not in the merge order; the dependency check reports no problem.

## Checks

- `lake env lean packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/Suggested.lean` from the content checkout: exit 0, 7 warnings `declaration uses sorry` (lines 114, 170, 183, 199, 220, 238, 252 after the header repair below), no errors. Before this round the same command failed: line 119 `Unknown identifier TauCeti.ContRepresentation.IsUnitary` (exit 1), the cause of the `(a : sorry)` binder in the worker's signature extraction. The pinned declaration is `ContRepresentation.IsUnitary`, in the root namespace `ContRepresentation` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:29, 48`); the Lean file and the six README mentions now use that name, and the Tau Ceti contract records the namespace. The only other change to `Suggested.lean` is the module header repair recorded under Gate failures.
- `#check @name` audit: a scratch copy of the file with thirteen `#check @TauCetiRoadmap.QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.<name>` lines elaborated (exit 0, 0 errors). Every binder is explicit in its declaration; `exists_norm_quantize_le` now shows `π.IsUnitary →` before strong continuity, matching README §1.9's "strongly continuous unitary representation". No other elaborated type changed, and each agrees with its README statement (binders, hypotheses `[IsAlgClosed k] [CharZero k]`, skew-symmetry and coprimality where the README states them).
- Dependency check: `depcheck: 233 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line (baseline before edits: 238 roadmaps, 2208 edges, 0 problems).
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- Gap sentences: 22 of 22 identical between README and `design/plan.json` (0 differed after the F05 repair).

## Gate failures

None were listed in the brief; the elaboration failure above was found by running the check and is repaired.

The worker's build then logged, twice, the warning that `Suggested.lean` imports `Mathlib` from package `mathlib`, which is designed for use with the module system, and suggested adding `module`. Repaired in place: the file now begins with `module`, its three imports are `public import Mathlib`, `public import TauCeti.Geometry.Lie.Exponential.Basic` and `public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic`, and `@[expose] public section` precedes the `namespace` line (the form of `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on main). No declaration, docstring or README text changed. Re-elaborated with `lake env lean` from the content checkout: exit 0, the same seven `sorry` warnings, no errors.

## Adversarial pass on changed statements

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §2.7 joint localization | G = H = {1}, ℓ = id, a(h) = e^{1/h}; a = 1 | e^{1/h} versus every h^{−M}; 1 = O(1) | hypothesis added; witness is a Check |
| §3.2 fibre count | 𝔰𝔩₂, fibres over 0, 1, −1 | ℂ: 2, 1, 1 orbits; ℝ: 3, 1, 2 (centralizer determinants a² > 0, −1 present, a² + b² > 0) | route and Check added; bounds 2 and 3 |
| §3.2 pinned CAD route | sign-invariant CAD for the defining polynomials | finitely many connected cells, set is a union of cells | cited for a fixed fibre only; uniformity left to whitney57 |
| §3.4 limit topology | spin-l sphere, h → 0; U(1) character | mass h(2l+1) → 0 (empty limit); mass 1 → point {0} | Check replaced |
| §3.9 Lemma 12.1 display | ℝ, N = 2, t = 1/h | 4 · 1/4 = 1; 2 · 1/2 = 1; unsquared 4 · 1/2 = 2 | display corrected; Check recomputed |
| §4.5 auxiliary form | ℓ_σ ↦ cℓ_σ; ℓ_σ = 0 with Hom ≠ 0; SO(3) ⊃ SO(2) | c²H_σ; P_Σ(−⊗T′) = c·0 = 0 contradicts P ≠ 0; H_σ = 1 on the weight-one projector | normalization fixed; Check added |
| §6.3 separation | GL₂ ⊃ GL₁, t = 2, set ∋ (1,1), (2,1/2); ball radius r | translate meets the set at (2,1/2); ball separated when 3r < √5/2 ≈ 1.118 | route partitions first; Check added |
| §7.1 weights | SO(3) ⊃ SO(2), l = 1, h = 1/2, m = 0, 1, 2 | heights 0, 1/2, 1; radii 3/4, √5/4, ∅; weights 1, 2, 0; unscaled 1, 0, 0 | Checks replaced |
| §7.1 boundary | SO(2,1)^0, window (1/4, 1), h = 1/10 | complementary h²λ² < 1/100; D_8, D_10 at 49/100, 81/100 | Check added |
| §7.7 central polynomial | α = 1, n = 4; α = 2, n = 4, q = 5; α = −2, n = 1 | 5/4 ≤ 2; 341/64 > 2; −5/2 < 1 | Check corrected |
| §9.1 L and P_Σ | tempered σ with H_σ = 0; nontempered σ with Hom ≠ 0 | Hom = 0 ⇒ period 0 ⇒ P_Σ = 0; P_Σ(−⊗T′) = cH_σ, c > 0 when P ≠ 0 | L restricted to tempered pairs; Check added |
| §9.1 split place | GL₂(F) ⊃ GL₁(F), nonzero Whittaker tests | diagonal value ab|λ(W)|² > 0 | §5.1a cited; §3.3 alone excluded E = F × F |
| §9.5 nontempered terms | scale of auxiliary H_σ by c | both sides of §7.2(ii) scale by c | route sentence added |
| `exists_norm_quantize_le` | E = 0, b = 2, unit v; unitarity binder | ‖2v‖ ≤ C·M with M ≥ 2; π.IsUnitary explicit | name repaired; type unchanged otherwise |

## Sources

- The sources service was run for Whitney 1957 (doi 10.2307/1969908) and Kostant 1959 (doi 10.2307/2372999); both resolve only to JSTOR landing pages ("no legal source found"), and the service wrote them to the job's `needs-references.toml` instead of the manifest. Following the manifest's existing convention for its five paywalled works, both are recorded by hand in `sources.toml` as `uncertified` (`licence_class = "none"`, DOI as `url`, locator and `cited_for`), and the generated missing-table file was deleted, since an uncertified citation is settled and must not be listed. Neither text was read; both are cited by locator as nv21 §6.1 and Lemma 27.5 cite them.
- `kostant63` keeps its key; its locator now reads "Theorem 3 and Remark 16" (fibre count, §3.2); the regular-nilpotent criterion moved to `kostant59`.
- The `nv21` cache text is still an extraction-failure placeholder; the page-166 denominator was checked on a rendered image of the cached PDF.

## Ownership and consequences

- Ownership searches (`roadmaps grep` over main and all open heads) for Whitney's finiteness of components, "fibres of the adjoint quotient" and "finite union of orbits" found no roadmap owner; the Tau Ceti CAD declarations named above are the only pinned material and are cited for exactly what they prove. No RealAlgebraicGeometry roadmap exists on main.
- VonNeumannAlgebras has two open heads (#889 and #1041) with the same roadmap name; both place the trace in V4.Core, which is the section cited. FormalConnectionsOpers F4.3 was checked at its open head (#1056; the 2b review's line numbers 1519–1540 match that head, the 2a review's 617–640 do not, but the content cited is the same).
- No name of this roadmap cited by another roadmap changed; the only renamed identifier is the supplier name `ContRepresentation.IsUnitary` inside this package.
- Nothing in this round asks another roadmap to state something new: the two classical inputs of §3.2 are cited by locator, and the reductive Chevalley restriction and reductive infinitesimal characters are already planned by FormalConnectionsOpers F4.3 and AutomorphicFormsOnReductiveGroups §2.2.
