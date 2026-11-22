# Review of RowTowerAndRallisIdentities (pull request #2919 at 8879eae)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: no finding remains. The finding of the previous review is repaired: the Bessel functionals `ℬ_a` of 5.8e are now defined on `conj(e(w))`, conjugate-linear in the row, in agreement with 5.8f, 5.8i and the formal statements, and the `𝕃`-structure argument of 5.8 is adjusted correctly. The three small corrections are repaired as well. There is one format note and one question, neither blocking. The standing of the formal proof as main source, and which of #2919 and #2954 merges this folder, remain for the human reviewers.

## N01 — R. Godement ("square-integrable representations") and S. Kudla, *Seesaw dual reductive pairs* (1984), are still credited without a title or a venue respectively; every other name-only credit now has both.

## Questions for the author

- Step (A) of the outline of 5.8e (line 1435) now says that the `n`-fold lift of `ē(w)` is `F′_n(vec_n(𝐩, w))` "for a map `F′_n` from one discrete series of `U(V(n, 0))(F_∞)` to cusp forms". Since `w ↦ ē(w)` is conjugate-linear, is `vec_n(𝐩, w)` conjugate-linear in `w` (so that `F′_n` is a linear `(𝔤, K)`-map), or is `F′_n` meant conjugate-linear? `vec_n` is used only here and is not defined, so I could not decide; step (F) uses only the factorisation and is unaffected either way.

## Previous findings

- R01 — repaired: line 1356 reads `ℬ_a(e) := B⁺(⟨ℓ⁺, y_{κ,i}⟩, Θ^{(0)}_{𝐩,𝐜}(ē(w)))`, `ē(w) := conj(e(w))`, "conjugate-linear in `e`"; steps (A), (B), (E), (F) and 5.8i use `ē(w)`; 5.8 says the `ℬ_a` are conjugate-linear.
- C01 — repaired: the parenthesis of 5.8 (lines 1626–1632) records the formal form (a threshold `C_{F,0}`, `HidaSetting` with `HostHyp`) and marks the form for `C_F ≥ 6510` without `HostHyp` as this roadmap's own.
- C02 — repaired: the description now says the family sub-roadmaps "reach main through #2954", that seven separate pull requests are closed in its favour, and that this one "is merged after #2954 or closed in its favour".
- C03 — repaired: the docstring names `TauCeti.GlobalNumberFields.HeckeCharacter` "with their infinity types, and the conductors of those of finite order", and lists only "the partial `L`-functions of Hecke characters" as lacking.
- N01 — repaired: "The results stated here are those of a complete formal proof ([FormalProof]), except where a target says otherwise."
- N02 — repaired: the source list reads "5.1, 5.3–5.7, 5.8a–5.8i, …" and says the files are cited "by their paths under its `src/` directory" (5.2 names no declaration of [FormalProof]).
- N03 — partly repaired: titles and venues given for Rallis 1982, Kudla 1994, Shimura, Deligne, Blasius, Gelfand–Graev, Paul, Petersson, Casselman, Wallach; Godement remains a name (N01 above).

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.8e `ℬ_a` against 5.8f, 5.8i | argument of the functional in the definition, steps (B), (E), (F), 5.8f, 5.8i | `ē(w) = conj(e(w))` in all six places | formal `psiK ch a u = fPsiPhi … (ch.form u)`, no conjugation, on the proof's own rows (the conjugates of the rows of 5.1) | consistent | R01 repaired |
| 5.8 `𝔼_𝕃` is an `𝕃`-subspace | `λ ∈ σ₀(𝕃)`, `e ∈ 𝔼_𝕃` | closed under `𝕃` since conjugation preserves `σ₀(𝕃)` | `ℬ_a(λe) = conj(λ)·ℬ_a(e)`; `conj(λ) ∈ σ₀(𝕃)` as `𝕃` is Galois over `ℚ` (Conventions, line 69); without stability under conjugation it would fail | holds | — |
| 5.8 `𝔼_𝕃 ⊗ ℂ = 𝔼^♮` | `e_i` `𝕃`-independent, `Σ z_i e_i = 0` | `ℂ`-independent, by injectivity and conjugate-linearity | `Σ conj(z_i)·Φ(e_i) = 0`, `Φ(e_i) ∈ c·σ₀(𝕃)^A` and `𝕃`-independent (Φ injective, conj-semilinear), hence `ℂ`-independent; `z_i = 0` | holds | — |
| 5.8 `ι_ξ(x) ∈ 𝔼_𝕃` | identity with conjugate-linear `ℬ_a` | `c_tot(1)κ_G^{−1}ℬ_a(ι_ξ x) ∈ 𝕃` | `= (c_tot(1)/c_tot(ξ))·ϱ_ξ^{−1}·v(ξ, x, a)`, each factor in `𝕃`; linearity of `ℬ_a` not used | holds | — |
| 5.8 formal form (parenthesis) | `Big`, `HidaSetting`, `HostHyp`, `FormulaAt` | `∃ C_{F,0}`, `∀ C_F ≥ C_{F,0}`, `∀ ε`, `∃ x₀`; `HostHyp`: gaps `100r⁴`, interlacing, further gaps; clauses on characters, Weil representations, additive character, frame | `∃ CF0, ∀ ε CF, CF0 ≤ CF → ∃ x₀`; `interlace`, `gap`, `gapR` and `cloudGap` (`100·r⁴`), `nodeGap`, `nodeGapR`; `mu_*`, `fullY`, `fullX`, `std`, `stdX`; `embLL(ze)·cTot·psiK(a)(Th(jX x)) = κ·vK` | agrees | C01 repaired |
| `Suggested.lean` docstring | Hecke characters at the pin | infinity types; conductors of those of finite order; no `L`-functions | `HeckeCharacter/InfinityType.lean`; `conductor (χ) (hχ : χ.IsFiniteOrder)` (Conductor.lean:74); no `LFunction` or `LSeries` in that directory | agrees | C03 repaired |

The rows for the statements the change does not touch stand as in the previous review, of `4f9be71`.

- Formal declarations opened in a local copy of [FormalProof]: `HidaSetting`, `Big`, `FormulaAt`, `Formula2K`, `SumRatK`, `RatioK`, `ConstK` (`Development/AbelianVarietyTheory/Statements/HeckeThetaIntegrals/FormulaAt.lean`, lines 22–92), `HostHyp` (`Formalism/LocalToGlobal/IndefiniteReal/LinksLemmas.lean`, lines 496–504), `psiK` (`Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/ExistsMatchOver.lean`, line 178).
- Library declarations opened at the pin: `TauCeti.GlobalNumberFields.HeckeCharacter` (Basic.lean), `HeckeCharacter.conductor` (Conductor.lean:74), InfinityType.lean present.
- Seeded sample within the changed passages: 5.8e, 5.8f, 5.8i, 5.8 (rows above); the classical locators are untouched.
- New bibliographic entries (ten titles with journal, volume and year) read against what I know of them; none wrong. No locator added.
- Cross-roadmap: no other roadmap cites the functionals of 5.8e; CongruenceModulesOfThetaLifts cites the hypotheses of 5.8 only; the Downstream paragraph already calls the row variable conjugate-linear.
- Dependency check: `depcheck: 136 roadmaps, 1532 edges, 0 problem(s)`. Automatic checks: all passed. Changes outside the folder: none beyond the family index.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file declares nothing, so there is no `#check` comparison and no one-tactic probe.
- Headlines (1) 5.5/5.6/5.10, (2) 5.8, (3) 5.12: none statable at the pins; the docstring names each with what it lacks. Pull request text: a new roadmap, `Suggested.lean` declaring nothing, the route through #2954 as described.

Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts, ThetaKernelsForUnitaryDualPairs (open) and GanGrossPrasadUnitaryGroups, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicFormsOnReductiveGroups (main), as in the previous review, the change touching no ownership; nothing shared. #2954 carries this same folder.

Source independence: changed passages only; 3 passages compared with 1 source ([FormalProof], Lean code without prose: the parenthesis of 5.8, the definition of `ℬ_a`, the note of 5.8i), none shared; largest share [FormalProof], 100 of 107 locators; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004, per the README's References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- That the rows of [FormalProof] are the complex conjugates of the rows of 5.1 (stated in 5.8e, 5.8f and 5.8): I checked only that `psiK` applies the functional to the proof's row with no conjugation; the comparison of the two definitions of a row was not unfolded.
- [FormalProof] beyond the statements listed here and in the previous review: no proof was read.
- The works newly given titles were not opened (no locator is attached to them).

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as mirrored for verification.
- Licence: the repository linked for [FormalProof] shows no licence. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with statements and the arrangement with its directory tree only.
- Process: #2954 (the family in one piece) also carries this folder, and seven supplier pull requests were closed in its favour; which of #2919 and #2954 merges this folder is to be decided, and #2954 must carry the files of this head.
