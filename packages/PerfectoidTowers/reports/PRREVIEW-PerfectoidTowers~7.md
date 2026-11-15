# Review of PerfectoidTowers (pull request #816 at 0e61ddc)

**Verdict:** needs changes

Incremental re-review of the 93 lines changed since `ad8056c`. Both previous findings are repaired. The merge of main moved the library pins, and one Tau Ceti declaration the README and the description cite by name no longer exists under that name: two P3 findings, nothing blocking.

## R01 (P3) — The continuous-lift lemma is cited under a name and file the pin no longer has

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:69`, `:317`, `:1901`, `:1917`, `:1919`; line 317 reads "`TauCeti.ContCohomology.exists_continuous_lift`, `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean`".

**Claim:** At the Tau Ceti pin of this head (`2fd255d`, brought in by the merge of main) no declaration `TauCeti.ContCohomology.exists_continuous_lift` exists, and `ShortExact.lean` declares no `exists_continuous_lift`; it only uses the lemma (its line 524) and names it in docstrings as `TauCeti.exists_continuous_lift`.

**Witness:** Pinned Tau Ceti, `TauCeti/Topology/Discrete.lean:50`: `theorem exists_continuous_lift {X B C} … [DiscreteTopology C] {p : B → C} (hp : Function.Surjective p) {f : X → C} (hf : Continuous f)`, inside `namespace TauCeti` (line 33). It is the only declaration of that name.

**Repair:** In the five places write `TauCeti.exists_continuous_lift`, and in the table row of line 317 give the file as `TauCeti/Topology/Discrete.lean`. The statement is the one the README describes (any topological source, a bare surjection onto a discrete space), so no other text changes.

## R02 (P3) — The description names the same declaration under its old name

**Location:** pull request description, summary block: "Mathlib's `Algebra.IsInvariant` and Tau Ceti's `TauCeti.ContCohomology.exists_continuous_lift` are reused, not restated."

**Claim:** The head's pins contradict the second name (R01).

**Witness:** `TauCeti/Topology/Discrete.lean:50` at the pinned Tau Ceti declares `TauCeti.exists_continuous_lift`; no `TauCeti.ContCohomology.exists_continuous_lift` exists there.

**Repair:** "Mathlib's `Algebra.IsInvariant` and Tau Ceti's `TauCeti.exists_continuous_lift` are reused, not restated."

## Previous findings

- R01 — repaired: all 22 spans are now italic or prose, e.g. line 1163 "The restricted orbit relation *MulAction.subsetOrbitRel* of `H` on `W`", line 1248 "the pair `P` of *TowerGeometry.basePair* at `K`", lines 2836–2841 "*sections* … *presheaf* … *isSheaf* gives *sheaf*".
- R02 — repaired: lines 936–939 cite AdicSpacesPartII layer R0's `Pair.completedTensor` for the plus ring, [KL I] Lemma 2.4.13(a), p. 42, as the pattern, and Definition 2.4.1, p. 38, only for "open and integrally closed".

## Verified sound

**Adversarial table** (statements the diff changes, and the statement the findings touch).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Left-action convention `(ρ (g * h)).asIso.hom = (ρ h).asIso.hom ≫ (ρ g).asIso.hom` (README 486, 812) | abstract `Aut X` at the pin; `S₃` on three points, `σ = (12)`, `τ = (23)` | `rfl` elaborates (`Mathlib/CategoryTheory/Endomorphism.lean:147`, `mul x y := .of (y.asIso.trans x.asIso)`); `(στ)(3) = σ(2) = 1`, the right-action reading gives `τ(σ(3)) = 2` | holds; distinguishes the two conventions | none |
| `IsCategoricalQuotient` (fields now through `.asIso.hom`) | trivial action, `q = 𝟙`; `ρ g ≠ 1`, `q = 𝟙` | `(1 : Aut X).asIso.hom ≫ 𝟙 = 𝟙`, fibres `x = y ↔ ∃ g, x = y`; `invariant` gives `(ρ g).asIso.hom = 𝟙`, so `ρ g = 1` by `Aut.ext (Iso.ext _)`: the kept `example` elaborates | same statement as at `ad8056c` | none |
| `exists_isCategoricalQuotient_of_invertible_order` | `G` trivial; `X = ∅`; one-tactic probe | card `1` a unit, `Y = X`, `V = U`; cover hypothesis vacuous, `Y = ∅`; `simp`, `rfl`, `infer_instance`, `decide`, `trivial`, `aesop` all fail to close it | not padding; binders `isAdic`, unit order, Tate affinoid cover present in the elaborated type | none |
| P8.7 plus rings `C⁺`, `D⁺` (reworded locator sentence) | `A = K × K`, `L = K` | image of `(K⁺ × K⁺) ⊗ K⁺` is `K⁺ × K⁺`, integrally closed and closed in `K × K`, open in `(K × K)° = K° × K°`: both readings give `K⁺ × K⁺` | agrees with AdicSpacesPartII R0.3 `completedTensor.plus_eq` | none |
| *zariski-closed-embedding* (P8.14, reworded) | `X` affinoid perfectoid, `U = X`; `Z = ∅` | condition at `U = X` is the affinoid notion of PerfectoidSpaces P4.15; ideal `(1)`, empty vanishing locus | same quantifier (every open affinoid perfectoid `U`) as HJ Definition 5.4(1) | none |
| *analytically-separated* (P8.15, reworded) | `X = Spa(A, A⁺)`; two discs glued along `|T| ≥ |ϖ|` | diagonal given by the surjection `(A ⊗̂ A)^u → A`, Zariski closed; rank-two point in the closure of the gluing locus has two lifts, diagonal not closed | same definition as HJ Definition 5.4(2) | none |
| *good-tower* (P8.19, reworded) | constant tower `Spa K`, `K` perfectoid; constant `ℙ¹` in mixed characteristic; affine-line tower | (1) `Spec K` projective, identities finite, (2) `Spd K`, (3) `U = V = Spa K`; (2) fails; (1) fails | the three conditions and their order of quantifiers (`i_j` depending on `j`) are those of HJ Definition 5.12 | none |
| *weight-extension-of-function-descent* (P9.7, reworded hypotheses) | `Γ = 1`; `Γ` finite | `X = Y`, `h = 𝟙`, invariants are everything; finite étale descent after base change to `L` | hypotheses as BHW Lemma 3.7 with the roadmap's `L₀ ⊆ L` | none |
| `TauCeti.exists_continuous_lift` as P9.0 uses it | `ℝ → ℝ/ℤ`; any surjection onto a discrete `C` | no continuous section (target not discrete, hypothesis fails); `surjInv ∘ f` continuous since `f` is locally constant | the pinned statement is the one P9.0 needs | R01, R02 |

The rows of the previous review for the untouched statements stand as in the previous review, of `ad8056c`.

- Gate, run again on this head: every counter zero, `OK`, exit 0; the worker's gate (with `build=0`) agrees. No file changed outside the folder against `origin/main`.
- Dependency check: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line; DiamondsAndVStacks (merge order 21, on main) precedes PerfectoidTowers (22).
- Elaboration of `Suggested.lean` at the new pins: 9 `declaration uses sorry` warnings, nothing else; `#check` of the three touched declarations compared with README P8.6 and P8.9; the import `TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Affinoid.Basic` exists at the pin.
- Pins moved with the merge, so the cited library names were opened again: 89 Mathlib declarations by `#check` (no error), 32 fully qualified Tau Ceti names by grep, and all 62 name–file pairs of the README's tables; the only drift is R01.
- Source locators checked in the text, 7: KLI lines 1484–1490 (Definition 2.4.1, p. 38) and 1635–1639 (Lemma 2.4.13(a), p. 42); HJ lines 1300–1306 (Definition 5.4, p. 29) and 1442–1450 (Definition 5.12, pp. 32–33); BHW lines 312 (§1.5) and 459–463 (Lemma 3.7, p. 10); ECD lines 986, 994 (Definitions 5.6, 5.7, p. 24).
- Cross-roadmap citation resolved: AdicSpacesPartII layer R0, §R0.3 (README line 1769), `completedTensor.plus_eq` (line 1817): closure of the integral closure of the image of the plus rings.
- Overlap check: read PerfectoidSpaces, DiamondsAndVStacks, AdicEtaleGeometry (main), PerfectoidSpacesPartII, PerfectoidShimuraVarieties; nothing shared. `IsCategoricalQuotient` of ModularCurves, ArithmeticDynamics and FiniteEquivalenceRelations is the scheme quotient, another namespace.
- Source independence: changed passages only; 5 passages compared with 4 sources (HJ, BHW, KLI, ECD), none shared (longest common run 6 words, "a map of perfectoid spaces `Z → X`"); largest share HJ, 47 of 199 bracketed citations; arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- [Torsion] Lemma II.2.2, cited inside the reworded sentence of P8.14: the locator is unchanged and was not opened this round.
- The sources service wrote a manifest while fetching; it was removed again, since this review records no manifest.

## Source issues

- none

## For the human reviewers

- none
