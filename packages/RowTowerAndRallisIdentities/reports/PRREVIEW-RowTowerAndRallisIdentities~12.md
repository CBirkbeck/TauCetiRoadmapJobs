# Review of RowTowerAndRallisIdentities (pull request #2919 at ccd8860)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 49 lines changed since `df851c3` finds nothing that makes a stated result false or unsupported. The mathematics added holds: the variable of the level vectors of the model lift at a split place (5.7) is the adjoint of the second Lagrangian component and transforms as stated, the sense of the right steps of column `0` (5.8e (A)) agrees with the Definitions and with 5.2, and the narrower Hecke statements of [FormalProof] recorded in 5.10a and the adelic point of the Lemma of 5.11 are what the cited declarations say. There are one small correction and three format notes (all three carried over), none blocking. The standing of the formal proof as main source and the route of this folder to main remain for the human reviewers.

## C01 — The family index now says that each roadmap's reference to the formal proof names the commit; this roadmap's reference names only the repository.

The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 20) gained the clause "the reference to the formal proof in each roadmap names that commit". The [FormalProof] entry of this roadmap's References (lines 2371–2376) gives `https://github.com/leanprover-community/riemann-hypothesis` and the directory `src/`, with no commit; the hash `40e56bab…` occurs nowhere in this README. A reader who follows this roadmap's reference lands on the repository's moving head, which the index says carries changes, and the files cited are those of the first commit. Giving the tree URL of that commit in the [FormalProof] entry makes the index's sentence true of this roadmap.

## N01 — R. Godement ("square-integrable representations") is still credited without a title (line 2360), and S. Kudla, *Seesaw dual reductive pairs* (1984), without a venue (line 2368); every other name-only credit in the References has both.

## N02 — The sentence of 5.9 on how [FormalProof] obtains the gaps still names no file or declaration, unlike every other statement about [FormalProof] in the section. What it describes is `GlobalTheory.Mem.HostFrames.hostHyp_of_gaps`, `Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/StandardLatticesDiagonal.lean`.

## N03 — In the Lemma of 5.11 the twist sets are still said to avoid "the small primes" (line 1907), a term not defined here; the same paragraph calls them "the primes of the host" a few lines below. One name for both would do.

## Questions for the author

- Step (A) of the outline of 5.8e (line 1501) still says that the `n`-fold lift of `ē(w)` is `F′_n(vec_n(𝐩, w))`; `vec_n` occurs only here and is not defined. Since `w ↦ ē(w)` is conjugate-linear, is `vec_n(𝐩, w)` conjugate-linear in `w`, or is `F′_n`? Step (F) uses only the factorisation, so nothing stated depends on the answer; the change to (A) does not settle it and I could not decide it from the text.

## Deferred findings

- D01 — resolved: CongruenceModulesOfThetaLifts Layer 7, at its open head, now reads "RowTowerAndRallisIdentities §5.7 gives the highest weight of `𝒲_j` at each real place".

## Previous findings

- The previous review (of `df851c3`) had no finding.
- C01 of that review — repaired: 5.8 now reads "`GlobalTheory.RowTest.NumbersIn`, `…/Definitions/TwistedInnerProducts/MemHalfCosetSelf.lean`" and "`GlobalTheory.RowClaim.HidaSetting` of `…/Statements/HeckeThetaIntegrals/FormulaAt.lean`"; both declarations are in those files.
- N01 of that review — not repaired: lines 2360 and 2368 are unchanged (N01 above).
- N02 of that review — not repaired: the sentence of 5.9 is unchanged (N02 above).
- N03 of that review — not repaired: "avoids the small primes" stands at line 1907 (N03 above).
- Its question on `vec_n` — the term is still undefined (question above). Its question on CongruenceModulesOfThetaLifts — settled there (D01).

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.7 split place: two Lagrangians (new) | `x, y ∈ Hom(V_w, W_w)`; `B_δ(x, y) = Tr(δ·tr(x^†y))` | each component is Lagrangian | `x^† ∈ Hom(W_w̄, V_w̄)` kills `W_w ⊇ im y`, so `x^†y = 0`, `B_δ = 0`; the two components have equal dimension `r(r+t)` | holds | — |
| 5.7 adjoint variable (new) | `x ∈ Hom(V_w̄, W_w̄)`, `s ∈ V_w̄`, `t ∈ W_w`; `(g, h)x = hxg^{−1}` | `y = x^† ∈ Hom(W_w, V_w)`; `(g, h)` acts by `y ↦ g∘y∘h^{−1}` | `⟨xs, t⟩ ≠ 0` only for `t ∈ W_w`, so `x^†t ∈ V_w`; `(hxg^{−1})^† = (g^{−1})^†x^†h^† = g·x^†·h^{−1}` for unitary `g, h` | holds | — |
| 5.7 against the supplier and itself | ThetaChainsOnDefiniteUnitaryGroups §2.2a (a); `f_v`, `f_H`; `Z_τ` | row-step vectors on `Hom(S_w, T_w)`; level vectors on `(r+t)×r` matrices; `Z_τ` coordinates of `x` | §2.2a (a): model on `x ∈ Hom(S_w, T_w)`, `φ(h^{−1}xg)`; `Hom(W_w, V_w)` is `(r+t)×r` (`dim W = r`, `dim V = r+t`); `z_{a,b}`: `V_j → W_j` | agrees | — |
| 5.8e (A) sense of the right step (changed; sampled) | Definitions of 5.8e; 5.2 | integral over the second member `V(i, 0)` of `(V(i+1, 0)(−1), V(i, 0))`; `Θ_j` over the first member of `(Y_{j−1}, Y_j)` | Definitions: `u_{i+1}(h) = ∫_{[U(V(i,0))]} θ_i(h, g; f_i)u_i(g)dg`, `g` in the second member, ranks `r+is < r+(i+1)s`; 5.2: `Θ_ju(h) = ∫_{[U(Y_{j−1})]}` | agrees | — |
| 5.8 file pointers (changed; sampled) | `NumbersIn`, `HidaSetting` | `MemHalfCosetSelf.lean`, namespace `GlobalTheory.RowTest`; `FormulaAt.lean`, namespace `GlobalTheory.RowClaim` | `structure NumbersIn` at line 245 of the first, in `GlobalTheory.RowTest`; `structure HidaSetting` at line 22 of the second, in `GlobalTheory.RowClaim` | agrees | — |
| 5.10a Hecke form of [FormalProof] (new; sampled) | `HeckeTransform`, `IsSplitOff`, `HeckeReadTie`, `ReadsAt`, `Bridge.SplitOff` | `T_{n,P}`, `n ≤ r`, `P ≠ P̄`, prime to the level, outside `S(1)`; rational and cusp-preserving; at `σ₀` equal to `μ_j(ϖ_P)^{−n}·Σ R(ρ)` | `HeckeTransform = SecTransform ∧ CuspTransform`; `IsSplitOff`: `P ⊔ P̄ = ⊤`, `p ∤ M′`; `i ≤ r`; `ReadsAt`: `g(h) = σ(cq)·muAt^{−k}·Σ_{a∈Rc} f(h·a)` under `σ = σ₀`; `SplitOff`: `P̄ ≠ P`, `P ∉ S` | agrees (`cq = 1`) | — |
| 5.10a Hecke translations over the reflex field (new) | ShimuraVarieties §4.11; AutomorphicBundles §§6.1, 6.4 | `G(𝔸_f)` acts on the tower over the reflex field; so on bundles and subcanonical extensions | §4.11: `T_g: M_K → M_L` descends uniquely to an `E`-morphism when `g⁻¹Kg ⊂ L`; §§6.1, 6.4 have the Hecke maps of the canonical extensions | agrees | — |
| 5.11 Lemma: the point `s` (changed; sampled) | `SeriesRatOn`, `GfC` | "for every `s ∈ U(V_j)(𝔸_f)`" | `∀ s ∈ GfC (Vc D i)`, `GfC V := (infHom V).ker`, the adelic points trivial at infinity | agrees | — |

The rows for the untouched statements stand as in the previous review, of `df851c3`.

- [FormalProof], read in the copy the operator holds: 6 files and 6 declarations the change newly cites or relocates exist where cited (`NumbersIn`, `HidaSetting`, `HeckeTransform`, `HeckeReadTie`, `Bridge.SplitOff`, `SeriesRat`); statements opened: all six, and in addition `IsSplitOff`, `ReadsAt`, `IsUnitaryHeckeOperatorSplitPrimeData`, `SeriesRatOn`, `GfC`.
- Cross-roadmap citations of the changed passages resolved: ThetaChainsOnDefiniteUnitaryGroups §2.2a (a), (c) at its open head; ShimuraVarieties §§4.4, 4.11, 4.12, 6.7 and AutomorphicBundles §§6.1, 6.4 on main. §4.11 is now in the item, the route, the *Needs:* line, the layer's Dependencies and the supplier contract alike.
- Dependency check: `depcheck: 133 roadmaps, 1491 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file is unchanged since `df851c3`, declares nothing, has one `import Mathlib`, no `sorry`, no `set_option`. No `#check` comparison and no one-tactic probe apply.
- Headlines: unchanged ((1) Rallis identities 5.5/5.6/5.10, (2) rational structure 5.8, (3) descent on rational coordinates 5.12); none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder: the family index only, one clause (C01); the pull request's own.
- Pull request text: no sentence contradicted by this head; the change adds no supplier (ShimuraVarieties was already one, on main), removes no section and no declaration.
- Seeded sample: of its targets, the change touches 5.8e, 5.8, 5.10a and 5.11 (rows above); the others are untouched.

Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts (open) and ShimuraVarieties, AutomorphicBundles (main) for the changed passages; nothing shared: the Hecke translations over the reflex field stay with ShimuraVarieties §4.11, which 5.10a cites, and the normal form of a step with ThetaChainsOnDefiniteUnitaryGroups §2.2a. The other closest roadmaps (SeesawForThetaChains, GluedTargetAndDivisionInequality, BesselPoincareSeriesAndGramBounds, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs; GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactorsPartII on main) are as in the previous review: the change adds no object.

Source independence: changed passages only; 4 passages compared with 1 source (the statements of [FormalProof], which has no prose), none shared; largest share [FormalProof], as in the previous review; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004: README References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- Whether [FormalProof] proves `HeckeTransform` and `HeckeReadTie` outright: both are propositions; I saw `HeckeTransform` derived from another named proposition (`heckeTransform_of_pointLaws`) and did not follow the chain. The README says only that the proof "has" them.
- That the set `R.Sb` of `Bridge.SplitOff` is the `S(1)` of 5.10a: I checked only that the places are excluded from a fixed set.
- That the copy of [FormalProof] read here is the tree of the commit the family index names: not compared.
- The description's sentence that the family pull request carries the family index "with the same content as here": that head was not compared, and this head changes the index.
- No proof of [FormalProof] was read; the works cited by name without a locator: as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as a public verification setup.
- Licence: the family index says the proof was published without a licence and is mirrored for verification only. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with statements only.
- Process: #2954 (open, draft) carries this folder; this head changes the folder and the family index, so its copy is to be brought to this head. Which of #2919 and #2954 merges this folder is to be decided.
- Several theorems of [FormalProof] cited across the family take hypotheses named `GlobalTheory.Published.*` (seen in `Development/AbelianVarietyTheory/Proofs/SatakeParameters/DownLiftUpLiftPositiveScalarUsedTuples.lean`); whether these are proved there was not examined.
