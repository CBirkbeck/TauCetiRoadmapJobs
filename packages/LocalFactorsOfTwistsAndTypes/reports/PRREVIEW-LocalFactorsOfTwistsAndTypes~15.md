# Review of LocalFactorsOfTwistsAndTypes (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 33 lines changed since `3bddf73`. The changes are correct: 6.3 and the subquotient clause of 4.1 (i) are now stated over every nonarchimedean local field, as their general sections and Tadić's Proposition A.4 give them, and the two reworded credits to the formal proof (3.3 (b) and the Method label of 4.2) agree with the proof's source, which I read. No finding: the verdict is accepted, with one small correction (the description does not mention the two reworded credits) and two format notes carried over, none blocking. For the human reviewers there is one decision that was applied.

## C01 — The description does not say that the credits to the formal proof in 3.3 (b) and 4.2 were corrected

The description's list of statements corrected against the formal proof names §§3.4, 4.1, 6.4 and 7.2 of this roadmap. Two further credits differ from `main` at this head. On `main` the route of 3.3 said that (b) "is" the proof's `GlobalTheory.InertZeta.hasSum_spherical`; the head says that this theorem gives the series for `φ_α` under eleven named statements, which are supplied, with the passage to `ω_α`, in `GlobalTheory.InertZeta.unramDoublingInert`. The Method label of 4.2 now says that non-injectivity of the proof's map is a consequence of its construction and not a statement of the proof.

A sentence in that bullet would cover both, for example: "In 3.3 the credit for (b) names the theorem that applies `hasSum_spherical` and supplies its eleven hypotheses; in 4.2 the method label says that the proof's map is not injective by its construction, which the proof does not state."

## N01 — Several Origin labels cite a source with no theorem, section or page

Macdonald (1971) in 3.4 (line 424) and 7.2 (line 1074), Langlands (1971) in 7.2, and Harris–Taylor (2001) and Henniart (2000) in 4.2 carry no locator, in the labels or in the References. Theorem or page numbers would make the attributions checkable.

## N02 — The heading of 6.2 no longer matches what the section states

The heading at line 716 still reads "Multiplicativity of `γ`-factors", while the section, the Summary and the scope call it the reduction of `γ`-factors of pairs to supercuspidal representations. A retitled heading, with the old anchor kept as a line before it, would match.

## Previous findings

- none: the previous review of this folder had no finding. Of its remarks: C01 (6.3 in every characteristic) repaired in all four places; C02 (4.1 (i)) repaired; C03 (description) repaired; N01 and N02 not repaired and written again above. Its question on "wildly ramified" in 4.2 is answered by the proof's source (table below).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 3.3 (b), the changed credit | `n = 0`, `n = 1`; `n = 2`, `α = q` (trivial representation) | `n ≤ 1`: one term `1`; right side `1` (`y = X` at `n = 1`). `n = 2`: `(1+qX)/(1−q²X)`, equal to (c) | holds | none |
| 3.3 (b), credit against the proof | `hasSum_spherical`, `unramDoublingInert` | Eleven closed premises `FracExists … Step`, plus the setting `IsUnramInv`; all eleven supplied in `unramDoublingInert`; bi-invariant `w` replaced by `φ` there | credit accurate | none |
| 4.1 (i), subquotient clause over every `F` | `𝔪 = [1]`, `𝔫 = [ν]` on `GL₂` | `L(𝔪) × L(𝔫) = 1 × ν`, constituents `ν^{1/2}∘det` and its Steinberg twist; `L(𝔪 + 𝔫) = ν^{1/2}∘det`, a constituent | holds | none |
| 4.1 (i) against its source and its general section | Tadić A.4; SR §SR.5.2a (i) | A.4 at Tad86 line 1365, the characteristic-zero sentence only at line 1455; SR.5.2a (i): "F any nonarchimedean local field" | agree | none |
| 4.2 Method label, non-injectivity | two supercuspidals `x`, `y` of rank 2, neither a twist of depth zero, `\|ω_x\| = \|ω_y\|` | Proof's map: `(J 2).lpTw(e x)` and `(J 2).lpTw(e y)`, `e` from the central character; equal parameters, `x ≠ y` | holds | none |
| 4.2 Method label, "wildly ramified" | the proof's fallback parameter | Inertia acts through the additive group of a field of `q^n` elements (a `p`-group); the proof states it is no twist of a tame parameter at places `≅ ℚ_g` | holds | none |
| 6.3, Corollary-of AL §AL.3.3.8a in either characteristic | Steinberg; trivial of `GL₂`; `χν^α × χν^{−α}` | `r = 1`, `α = 0`; exponents `±1/2`, not generic; unitary irreducible for `0 < α < 1/2`; supplier: "F of either characteristic" | holds | none |

The rows for the untouched statements stand as in the previous review, of `3bddf73`.

- Source locators checked against the text: 2 in Tadić 1986 (Proposition A.4, Tad86 line 1365; the restriction to characteristic zero, Tad86 line 1455) and 6 declarations of [FormalProof] at its first commit (`hasSum_spherical`, `unramDoublingInert`, `IsSphericalU`, `JunkEx`, `cuspEx`, `GoodCusp`), with the two cited file paths.
- Cross-roadmap citations resolved at this head: AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a (line 1465) and SmoothRepresentationsOfLocalGroups §SR.5.2a (line 4500); both state what the changed text says of them.
- The family's index page changed since `3bddf73`; its row on the local Langlands correspondence agrees with the Method label of 4.2 (a map the proof constructs and does not compare with the correspondence).
- Base against head: 7 layers, none removed or retitled; `Suggested.lean` unchanged since `3bddf73`, four declarations.
- Automatic checks: all passed at this head; the pull request's other changed paths all lie in roadmap folders that are its own. Dependency check: `depcheck: 121 roadmaps, 1389 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses 'sorry'` at line 123.

Overlap check: read SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicLFunctionsAndLocalFactorsPartII, BaseChangeAndGaloisRepresentationsForUnitaryGroups and ThetaKernelsForUnitaryDualPairs; the general theorems have one owner each (the Zelevinsky classification in SmoothRepresentationsOfLocalGroups §SR.5.2a, the exponent bound in AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a) and this roadmap records 4.1 and 6.3 as their corollaries; nothing else shared by the changed passages.

Source independence: changed passages only; 4 passages compared with 2 sources (Tadić 1986 and [FormalProof]), none shared beyond declaration names and file paths; largest share [FormalProof]; arrangement not compared, since the change adds, removes and reorders no layer.

Research link: Layers 4 and 6 state the Zelevinsky classification (1980), the local converse theorem (Henniart 1993; Jacquet–Liu 2018; Chai 2019) and the characterisation of the local Langlands correspondence for `GL_n` by `ε`-factors of pairs (Henniart 1993, 2002); Layers 3 and 7 give Satake bounds used in Rallis inner products (Harris–Kudla–Sweet 1996). Rests on the README and on Henniart 2002, Jacquet–Liu and Chai, which I read.

## Not verifiable

- Henniart 1993 (6.4, 6.5), Moy–Prasad 1996 (2.1), Bernstein 1984 and Jacquet–Shalika 1981 (6.3), Macdonald 1971 and 1979, Shimura 1997, Jacquet–Piatetski-Shapiro–Shalika 1983, Harris–Kudla–Sweet 1996, Borel 1979 and Langlands 1971: paywalled or not read, as in the previous review; none is cited by a changed passage.
- [FormalProof]: read only for the two changed credits (3.3 (b), 4.2); the other Method labels were not compared with it.

## Source issues

- none

## For the human reviewers

- The decision that published theorems live in the general roadmaps was applied: the general multiplicativity left 6.2 and is stated in full by AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a; 1.1, 2.1, 3.2, 4.1, 6.3 and 6.4 keep their statements, as corollaries.
- Licence: [FormalProof], the most-cited source, is a public repository published without a licence; the README cites its declaration names and file paths only, and copies no code.
