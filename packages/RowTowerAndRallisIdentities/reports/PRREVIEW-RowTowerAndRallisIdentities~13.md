# Review of RowTowerAndRallisIdentities (pull request #2919 at 63a93cf)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 64 lines changed since `ccd8860` finds nothing that makes a stated result false or unsupported. The new normalisation of the rational lift (5.11, phase one) is consistent: the scalings of the lift, of `𝒞(W_j)_𝕃` and of `κ_rat` under a change of the intertwiner and of the extremal vector are as stated, a pair with `κ_rat = 1` exists by the Lemma, and the eleven declarations of [FormalProof] it cites are in the files named and say what the text reports. The small correction of the previous review is repaired; three format notes are carried over, none blocking. The standing of the formal proof as main source and the route of this folder to main remain for the human reviewers.

## N01 — R. Godement ("square-integrable representations") is still credited without a title (line 2413), and S. Kudla, *Seesaw dual reductive pairs* (1984), without a venue (line 2421); every other name-only credit in the References has both.

## N02 — The sentence of 5.9 on how [FormalProof] obtains the gaps still names no file or declaration, unlike every other statement about [FormalProof] in the section. What it describes is `GlobalTheory.Mem.HostFrames.hostHyp_of_gaps`, `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/StandardLatticesDiagonal.lean`.

## N03 — In the Lemma of 5.11 the twist sets are still said to avoid "the small primes" (line 1910), a term not defined here; the same section calls them "the primes of the host" further down. The new paragraph refers back to it as "the condition on the twist sets above", so one name for both would now serve two places.

## Questions for the author

- Step (A) of the outline of 5.8e (line 1501) still says that the `n`-fold lift of `ē(w)` is `F′_n(vec_n(𝐩, w))`; `vec_n` occurs only here and is not defined. Is `vec_n(𝐩, w)` conjugate-linear in `w`, or is `F′_n`? Nothing stated depends on the answer; the text does not let me decide it.

## Previous findings

- The previous review (of `ccd8860`) had no finding.
- C01 of that review — repaired: the [FormalProof] entry now reads "cited here by their paths under the directory `src/` of the first commit of that repository", with the tree URL of `40e56bab…`; the family index dropped the clause.
- N01 of that review — not repaired: lines 2413 and 2421 are unchanged (N01 above).
- N02 of that review — not repaired: the sentence of 5.9 is unchanged (N02 above).
- N03 of that review — not repaired: "avoids the small primes" stands at line 1910 (N03 above).
- Its question on `vec_n` — the term is still undefined (question above).

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.11 normalisation: the lift under `(I_j, e₀) ↦ (aI_j, be₀)` (new; sampled) | 5.7: `(θ_j y)(e)(g) = ∫ θ(h, g; I_j(e ⊗ ỹ(h)) ⊗ f)dh` | lift at the extremal vector multiplied by `ab`; unit vector of `𝒲_j` by `(ab)^{−1}` | integrand linear in `I_j` and in `e`: factor `a·b`; `(aI_j)(be₀ ⊗ w′) = Δ_j` forces `w′ = (ab)^{−1}w` | holds | — |
| 5.10a: `𝒞(W_j)_𝕃` under `e₀ ↦ be₀` (new; sampled) | `φ ∈ 𝒞(W_j)` rational iff `φ(e₀)` is a rational section | subspace multiplied by `b^{−1}` | `φ(be₀) = bφ(e₀)` rational iff `φ ∈ b^{−1}·`(old subspace) | holds | — |
| 5.11: `κ_rat` under the change (new) | Lemma: `κ_rat·θ_j(x) ∈ 𝒞(W_j)_𝕃`; Theorem (a): `j_{σ₀}(y) = κ_rat·θ_j(x)` | `κ_rat` multiplied by `(ab)^{−1}` | `κ′·aθ ∈ b^{−1}𝒞_𝕃` iff `κ′ab·θ ∈ 𝒞_𝕃`, so `κ′ = κ_rat(ab)^{−1}` | holds | — |
| 5.11: a pair with `κ_rat = 1` exists (new) | `a = 1`, `b = κ_rat` at one `τ` | "multiply the extremal vector … by its phase `κ_rat`" | `κ′ = κ_rat·(1·κ_rat)^{−1} = 1`; `|b| = 1` keeps the vector a unit weight vector | holds | — |
| 5.11: invariants of the change (new) | `θ_jθ_j^*`; Petersson products | unchanged | `θθ^* ↦ |a|²θθ^* = θθ^*`; `⟨by, by′⟩ = |b|²⟨y, y′⟩` | holds | — |
| 5.11: a phase is not harmless over `𝒪_𝕃` (new) | `u = (3+4i)/5` | "need not lie in `σ₀(𝕃)`, and one that does need not be a unit at a finite place" | `|u| = 1`, `u ∈ ℚ(i)`, valuation `−1` at `(2+i)`, `+1` at `(2−i)`; `e^{i}` is transcendental | holds | — |
| 5.11: [FormalProof] phase-one statement (new) | `GeoExV`; the two `…Statement` theorems | lift of every rational form of the base tuple is a realisation, no phase; under (R5), orthonormal frame, finitely many tuples | `GeoExV`: `∀ i x, ∃ y, (FW i).j σ₀ y = thG i μ0 (jV i μ0 x)`; hypotheses `8·f·r + 4 ≤ nV`, `∀ i, VStd D i` (`gram = 1`, lattice standard), `Finite T0`, `QGuard R` | agrees | — |
| 5.11: phase as datum, compatibility (new) | `RealDat3.phs`, `charW_keep`, `phEff_one`, `PhaseTie`, `phaseCompatible_splitPart_of_liftUniformisation` | phase a datum, `1` for the chain; if a class sum for some constants and phase, then for the realisation's constants and phase `1` | `phs : Fin m → ℂ`; `charW_keep` builds the record with `fun _ => 1`; `phEff p.R i = 1`; `PhaseTie ph i := OneMapRow0 … → OneMapOf … (T.cE …) (ph i)`, supplied with `fun _ => 1` | agrees | — |
| 5.11: extremal vector and realisation of [FormalProof] (new) | `IsChosenExtremalVector`, `FWTie.ev`, `phi_cE` | intertwiner pairs it with a unit vector to `Δ_j`; realisation at it is the adelic function times constants per component | `ExtremalVectorPairsToDelta`: `‖w‖ = 1 ∧ ioP i (tprod u) w = Delta i`; `ev`: value at `v₀` equals `phiJ`, which `phi_cE` writes through the constants `cE` | agrees | — |
| 5.11 Theorem (a) (changed) | `κ_rat` in the normalisation | "equal to `1` in the normalisation above" | by the row on existence; the identity `𝔲_σ·j_σ(y) = κ_σ·R(ζ)θ_j^σ(x^σ)` is otherwise unchanged | agrees | — |
| Downstream consumers (changed) | GluedTargetAndDivisionInequality §§8.19e, 8.20, 8.20b at its open head | it uses the rational lift in the normalisation of 5.11 | all three sections exist; §8.20 and §8.20b cite "the normalisation of RowTowerAndRallisIdentities §5.11 (phase `κ_rat = 1`)" | agrees | — |

The rows for the untouched statements stand as in the previous review, of `ccd8860`.

- [FormalProof], read in the copy the operator holds: the 11 files the change newly cites exist, each with the declaration named in the namespace named (`FWTie`, `IsChosenExtremalVector`, `exists_geometricHalf_phase_one_over_lawful_core`, `geometricExistence_core_forms_analytic_phaseOne`, `GeoExV`, `consts_core`, `RealDat3`, `charW_keep`, `phEff_one`, `PhaseTie`, `phaseCompatible_splitPart_of_liftUniformisation`); all eleven statements opened, and in addition `ExtremalVectorPairsToDelta`, `OneMapRowR`, `phi_cE`, `VStd`.
- Cross-roadmap citations of the changed passages resolved: GluedTargetAndDivisionInequality §§8.19e, 8.20, 8.20b at its open head (a consumer, not a supplier); 5.7, 5.10a, 5.11 within this README.
- Dependency check: `depcheck: 133 roadmaps, 1491 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file is unchanged since `ccd8860`, declares nothing, has one `import Mathlib`, no `sorry`, no `set_option`. No `#check` comparison and no one-tactic probe apply.
- Headlines: unchanged ((1) Rallis identities 5.5/5.6/5.10, (2) rational structure 5.8, (3) descent on rational coordinates 5.12); none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder: the family index only (the sentence on the commit reworded, the clause on each roadmap's reference dropped); the pull request's own. The hash in this README's reference equals the one in the index.
- Pull request text: no sentence contradicted by this head; the change adds a normalisation inside 5.10a and 5.11 and one consumer clause, no supplier, removes no section and no declaration.
- Seeded sample: of its targets, the change touches 5.10a and 5.11 (rows above); the others are untouched.

Overlap check: read GluedTargetAndDivisionInequality, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (open; as consumers of 5.11) for the changed passages; nothing shared: the normalisation of the rational lift is owned here (5.11) and GluedTargetAndDivisionInequality §§8.20, 8.20b cite it by section. The other closest roadmaps (HodgeClassesForJacquetLanglands; GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactorsPartII on main) are as in the previous review: the change adds no object.

Source independence: changed passages only; 5 passages compared with 1 source (the statements of [FormalProof], which has no prose), none shared; largest share [FormalProof], as in the previous review; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004: README References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- That the files cited exist under the same paths at the first commit `40e56bab…`, which the reference now names: the copy of [FormalProof] read here is of a later commit of the same repository, and the two trees were not compared.
- The parenthesis of 5.11 that the class-sum identity holds with phase `1` "for the constants of the charts multiplied by one scalar of absolute value `1`": `consts_core` gives constants `cc` rescaled by a scalar of norm `1` and takes the phase-one compatibility as a hypothesis; I did not follow its proof.
- That `QGuard` of [FormalProof] is exactly "the condition on the twist sets" of the Lemma: I checked only that it is a hypothesis of the first theorem and guards the clause for the other tuples.
- The description's sentence that the family pull request carries the family index "with the same content as here": that head was not compared, and this head changes the index.
- No proof of [FormalProof] was read; the works cited by name without a locator: as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as a public verification setup.
- Licence: the family index says the proof was published without a licence and is mirrored for verification only. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with statements only.
- Process: #2954 (open, draft) carries this folder; this head changes the folder and the family index, so its copy is to be brought to this head. Which of #2919 and #2954 merges this folder is to be decided.
- Several theorems of [FormalProof] cited across the family take hypotheses named `GlobalTheory.Published.*`; the two phase-one theorems newly cited in 5.11 take `GlobalTheory.Published.CuspRapidDecay`. Whether these are proved there was not examined.
