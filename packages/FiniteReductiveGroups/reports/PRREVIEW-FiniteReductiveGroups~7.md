# Review of FiniteReductiveGroups (pull request #2881 at d65cc42)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 70 lines changed since `5305798` found no false statement. The local type statement 6.5, now stated for every finite residue field, is proved by its route with no use of `q` prime; the new sentences of 6.3 and 6.4 on what the formal proof states agree with its Lean declarations, and the two new Steinberg locators are right. There are two small corrections (most targets still have no theorem-level locator; the new sentences on the formal proof name no declaration for six of the seven statements they describe) and four format notes, none blocking. Left for a human: the status and the licence of the Lean formalisation the family is built around, and the published sources that could not be read.

## C01 — Most targets still have no theorem, section or page of a published source at the claim

The change adds locators at 0.3 (Steinberg 1965, 2.7 (a) and 2.11, p. 53) and 0.5 (Lemma 3.2 and Theorem 3.3, pp. 54–55); both are right. The other targets named in the previous report (0.4, 1.0, 1.4, 2.4, 2.6, 4.1, 4.6, 5.1, 5.2, 5.5 apart from the `q`-hook formula, 6.3, the general case of 2.2, and 4.5 (b)) are still tied to the literature only through the References ("Carter …: Layers 0, 1, 4"), so a reader cannot check them against a page. They need the author's own locators.

## C02 — The new sentences of 6.3 and 6.4 on the forms of the formal proof name a declaration for one statement out of seven

In 6.3 (lines 2146–2156) and 6.4 (lines 2182–2189) a reader is told what the formal proof states, and only "the first of these statements" carries a file and a name; the others cannot be found without searching the repository. I located them, and each agrees with the README's description:

- the converse, for characteristic zero: `GlobalTheory.Published.DepthZeroInduction` (`src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/DepthZeroInduction.lean`, line 10, with `[CharZero k]`);
- the statement on labels: `UpperTheory.Gal.InertialTypesAlt.LblOf` (`src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/RegularSemisimpleFibres/ResEmbCompat.lean`, line 184);
- the class of 6.4: `GlobalTheory.RecT.GoodCusp` and `Good` (`src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/RecTExists.lean`, lines 19 and 23);
- twists and contragredients, Langlands quotients, and tame twists: `ClBasic`, `GoodSeg` and `TwTame` of `UpperTheory.Zero.LLC` (`src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/RecTTransport.lean`, lines 152, 170, 148).

Adding these names, in the shape 6.3 already uses for the first statement, would let the reader check each sentence.

## N01 — Paths into the formal proof omit the leading `src/`

Including the two new paths of 6.3 and the new path in the docstring of `exists_regular_of_isCuspidal`; as written they do not resolve in the repository the References give.

## N02 — "The family follows the formal Lean proof"

Still in the family index (line 10) and in the description. "The family plans the mathematics on which that proof rests" would describe it.

## N03 — Forty-three lines of `Suggested.lean` are longer than 100 characters

## N04 — In 5.1 the Coxeter torus is "the only rational maximal torus contained in no proper rational Levi subgroup"

Up to `G^F`-conjugacy (line 1508), as in the sentence before it.

## Questions for the author

- 6.5 is "for `q = p`, statement of [FormalProof]", with no file or declaration. Which one? The files I opened beside it (`src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/SeriesOfIsSubquotient.lean`, `RegularLocalOfDepthZero.lean`) work over `GL_n(ℚ_p)` itself, which is narrower than "residue field of prime order"; I could not find the statement of 6.5 to compare.

## Previous findings

- none: the previous report (of `5305798`) had no finding. Its small corrections at this head: the restriction of 6.5 to prime residue fields, the three statement-only locators, the downstream-consumer entry for LocalGaloisDeformationRings §2.26.2, the parenthesis in 6.0, the "identical content" sentence of the description and "Cited at 2.7(b) and 2.8" are all repaired; the missing locators are partly repaired (C01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.5 local type statement, every `q` | `q = 4`, `a = b = 1`, `f = {β}`, `β ≠ α`; `f = {α}`; route step by step | `x` spans a `β ⊗ α` line of `(π^{K₁})^{U(k)}`; `μ₁μ₂⁻¹` ramified, so `π = μ₁ × μ₂` irreducible; `f = {α}` gives `(χ∘det) ⊗ St`, excluded | holds for every `q`; no step uses `q` prime | none |
| 6.5, the factor `π₂` | Jacquet module of `π₁ × π₂` along `(a, b)` | only `π₁ ⊗ π₂` has its `GL_b` support among the `b` twists of `χ`, so `α∘det ⊂ π₂^{K₁}` and `π₂ ⊗ χ⁻¹` is spherical | holds | none |
| 6.0 equivalence without the parenthesis | Steinberg of `GL₂(F)`; supplier §2.1 (a) | support `{ν^{1/2}, ν^{−1/2}}` unramified and `St^{K₁} = St_{GL₂(k)} ≠ 0`; supplier states both directions for every `F` | agrees | none |
| 6.3 forms of the formal proof | three declarations opened | `DepthZeroSupport`: no `CharZero`; `DepthZeroInduction`, `LblOf`: `[CharZero k]`; `LblOf` concludes a nonzero pairing (`Meets`), one constituent | as described | C02 |
| 6.4 forms of the formal proof | `n = 1`; rank 2 over `𝔽_q((t))` and over `F ≠ ℚ_p` | `GoodCusp`: rank one, or `F ≅ ℚ_p` and a twist of depth zero; `n = 1` all characters on both sides; rank 2 excluded off `ℚ_p` | as described | C02 |
| 6.4 tame twists | `n = 1`, `π₀ = c` tame | `χc` tame iff `χ` tame; `TwTame` has `0 < n` and `[CharZero k]` | as described | none |
| 0.3 regular semisimple elements | `GL₂`, split and elliptic; Steinberg1965 lines 198–202, 222–231 | `C_G(s) = T` of order `(q−1)²`, `q²−1`; 2.7 (a), 2.11 on printed p. 53, semisimple `G` | locator right | none |
| 0.5 (a), (b) | Steinberg1965 lines 263–269, 281–284 | Lemma 3.2 on p. 54, Theorem 3.3 on p. 55, §3 for semisimple `G` | locator right | none |
| `exists_regular_of_isCuspidal`, docstring | three declarations opened | `green_of_regular (hG : GreenRegularCharacters) : Green`; `GreenRegularCharacters` a `def … : Prop` in the file named | as described | none |

The rows for the statements the change does not touch stand as in the previous review, of `5305798`.

- Source locators checked against the text: Steinberg1965 lines 198–231, 258–300 (2.7, 2.9, 2.11, 3.2, 3.3); 14 declarations of [FormalProof] in 11 files (`DepthZeroSupport`, `depthZeroSupport`, `DepthZeroInduction`, `LblOf`, `HasLbl`, `Meets`, `GoodCusp`, `Good`, `ClBasic`, `GoodSeg`, `TwTame`, `GreenRegularCharacters`, `green_of_regular`, `Green`; `MirabolicBound` and `PlaceBound` confirmed as definitions).
- Cross-roadmap citations resolved: LocalGaloisDeformationRings §2.26.2 on main (line 2118: the finite-group calculations are part of that target), as the new paragraph of Scope and ownership says; LocalFactorsOfTwistsAndTypes §2.1 (a) as in the previous review.
- Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all pass; run by hand without the candidate order, the only two reports are that the merge order does not list this roadmap yet and the three files of the family index outside the folder, which are the pull request's own.
- Elaboration: `sorry` the only warning (lines 112, 174, 193). The diff changes one docstring and no signature.
- Family index: the change since `5305798` rewords the opening sentence and adds what the repository says of its licence; nothing else outside the folder.
- Pull request text: the description agrees with this head (3 theorems, 4 definitions; the validation paragraph; the family index said to differ between heads).

Overlap check: read LocalFactorsOfTwistsAndTypes, BaseChangeAndGaloisRepresentationsForUnitaryGroups, BesselPoincareSeriesAndGramBounds, TensorInductionAndFiniteGroupInputs (open), SmoothRepresentationsOfLocalGroups, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main); the third list is empty. Shared objects as in the previous review: the depth-zero Jacquet comparison, owner LocalFactorsOfTwistsAndTypes §2.1; depth-zero cuspidal types over `F/ℚ_p`, owner SmoothRepresentationsOfLocalGroups SR.5.2; tensor induction and characters on a coset, owner TensorInductionAndFiniteGroupInputs §§6.1, 6.2; the Steinberg character for split groups, owner SmoothRepresentationsOfLocalGroupsPartII SRU.4.1; the finite-group calculations of the level-zero classes, owner LocalGaloisDeformationRings §2.26.2, now said in Scope and ownership. Nothing else shared.

Source independence: changed passages only: 6 passages compared with 2 sources (Steinberg1965, two; [FormalProof], four), none shared; largest share [FormalProof], about 15 of about 31 exact locators; the diff adds, removes or reorders no layer, so the arrangement was not compared again. Deligne–Lusztig 1976, Green 1955 and Digne–Michel could not be read.

Research link: Layers 3–5 are Deligne–Lusztig (1976) and Green (1955), with Shintani (1976) in 5.11; Layer 6 is the depth-zero theory of Moy–Prasad (1994, 1996). The family's later roadmaps use them for parameters of depth-zero supercuspidal representations and for theta chains, after Alpöge's formal proof (2026). Rests on the README.

## Not verifiable

- Deligne–Lusztig 1976, Green 1955, Digne–Michel, Carter, Dudas–Michel, Macdonald, Zelevinsky, S. I. Gelfand 1970, Howlett–Lehrer 1980, Iwahori 1964, Solomon 1966, Curtis 1966, Lusztig–Srinivasan 1977, Moy–Prasad 1994 and 1996, Shintani 1976, Kondo 1963: no legal copy readable, as in the previous review; none is cited by a changed passage.
- Where [FormalProof] states 6.5, and for which fields: not found (see the question).

## Source issues

- none

## For the human reviewers

- **Scope.** The family is built around a Lean formalisation announced on 20 November 2026 ([FormalProof]); its repository's README says it "claims" the proof, with verification still to be run. This roadmap's headlines are published (Deligne–Lusztig 1976, Green 1955).
- **Scope.** Only 2.7 (b), (c), 2.8, the lower bound of 5.8 (c), the form of 5.11 (e) and 6.5 for `q = p` have [FormalProof] as their sole source (README References); 6.5 for every `q` is the roadmap's own.
- **Licence.** The repository's README states that the submission "was published without a license" and is mirrored for verification only; the README and `Suggested.lean` cite its declarations by path and name, and the family index now says so.
- **Licence.** `besselCharacter`, `degenerateCharacter`, `IsCuspidal` encode the objects of its `symEdge` (`src/Formalism/LocalToGlobal/Divisibility/DefGroup.lean` line 217), `cutEdge` and `IsCuspidal`, with other binders and bodies; only the name `IsCuspidal` is shared.
- **Not tested.** The wording and the arrangement were compared only with Steinberg 1965 and the cited files of [FormalProof]; Deligne–Lusztig 1976, Green 1955 and Digne–Michel could not be read.
