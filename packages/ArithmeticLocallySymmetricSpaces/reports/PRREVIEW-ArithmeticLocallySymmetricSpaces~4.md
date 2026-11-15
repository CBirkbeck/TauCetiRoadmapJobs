# Review of ArithmeticLocallySymmetricSpaces (pull request #871 at 4f8e95a)

**Verdict:** needs changes

Incremental re-review of the 86 lines changed since 215520b. Two findings: the targeted build fails at this head (R01, P1), and the pull request's description contradicts the head in two sentences and leaves two suppliers unstated (R02, P3).

## R01 (P1) — `Suggested.lean` does not build at this branch's Tau Ceti pin

**Location.** `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/Suggested.lean` lines 63–64 ("`θ' = ((CommHopfAlgCat.innerConjugationIso H.obj g).trans θ).trans (CommHopfAlgCat.innerConjugationIso H.obj g).symm`"); `README.md` line 1202 ("Tau Ceti's `CommHopfAlgCat.innerConjugationIso`").

**Claim.** The branch's `lake-manifest.json` pins Tau Ceti at `a91d3aa`, where the declaration is `TauCeti.CommHopfAlgCat.innerConjugationIso`. The root-namespace name exists only at main's pin `2fd255d`, which the branch (merge base `97199a4e`) has not taken.

**Witness.** `lake env lean` at this head: `Suggested.lean:63:13: Unknown constant CommHopfAlgCat.innerConjugationIso`. Pinned `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/InnerConjugation.lean` lines 49–62: `namespace TauCeti` … `namespace CommHopfAlgCat` … `def innerConjugationIso`.

**Repair.** Merge `origin/main` into the branch and keep both files as they are. Tested: `git merge-tree HEAD origin/main` is conflict-free, and this head's `Suggested.lean` elaborates in a checkout of main (pin `2fd255d`) with two `sorry` warnings only. Restoring the `TauCeti.` prefix builds at `a91d3aa` but would fail on main.

## R02 (P3) — The description names two hypotheses the head no longer has and omits two suppliers

**Location.** Pull request description, "Explicit README hypotheses": "`TopologicalCoefficientInput(R)` covers coefficients, spaces and functor coherence beyond §C6.1's finite-coefficient domain, including arbitrary stalk modules"; and "the compact-manifold-with-boundary triangulability input are conditional assumptions".

**Claim.** The head has no `TopologicalCoefficientInput` and no triangulability hypothesis: both are targets it proves. The description also does not name EnhancedDerivedSheaves, nor SchemeAndStackFoundations §§2.1 and 2.5, which the head consumes, and says the merge order is "below" when it is above.

**Witness.** `README.md`: 0 occurrences of `TopologicalCoefficientInput`; line 832 target `LocallySymmetric.SheafDerived.isoSingular`; line 2406 target `LocallySymmetric.BorelSerre.smoothTriangulation`; "Inputs taken as hypotheses" (lines 526–538) lists neither; line 514 supplier row for EnhancedDerivedSheaves §§0.1, 0.2, 0.4.

**Repair.** Delete the `TopologicalCoefficientInput(R)` bullet and the triangulability clause. Add to the hard supplier contracts: "EnhancedDerivedSheaves (on main) §§0.1–0.2 and 0.4, and SchemeAndStackFoundations (on main) §§2.1 and 2.5, supply `D⁺` of module sheaves over any commutative ring, K-injective replacements, `f^* ⊣ Rf_*` and flasque resolutions computing `Sheaf.H`. ALS.F.3 proves the comparison with `Sheaf.H`, the proper finite-fibre stalk formula, exactness of `f^*` and the arbitrary-stalk singular comparison; ALS.2.4 proves the smooth triangulation of compact manifolds with boundary." Replace "#938" by "EtaleCohomologyFoundations (on main)" and "in the merge order below" by "above".

## Previous findings

- R01 — repaired: lines 513 and 746–748 now read "`Rf_!` for locally proper separated maps between locally compact Hausdorff spaces that are paracompact and locally contractible", as ComplexComparisonPartII §C6.1 states at its head (its README line 4801).
- R02 — repaired: line 769, "(iii) Exactness of the inverse image: for a continuous map `f : T → T′`, `f^*` is exact on `Sh(T′, R)`", with route; both Mathlib names are in the `*Needs:*` line (798–800).

## Verified sound

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `IsCartanInvolution.conj` (Lean, changed) | this head at pin `a91d3aa`; this head at main's pin `2fd255d`; `TauCeti.`-prefixed probe at `a91d3aa` | unknown constant; two `sorry` warnings; two `sorry` warnings, type `∃ g, θ' = (innerConjugationIso H.obj g ≪≫ θ) ≪≫ (…).symm` | fails at the branch's pin only | R01 |
| `IsCartanInvolution.conj`, torus | `G_m`, `θ = θ′ =` inversion, any `g` | inner conjugation is the identity on a commutative group, so the right side is `θ` | holds with every `g` | none |
| ALS.F.3 (iii) exactness of `f^*` | `f : pt → T′` at `x`; open `j : U → T′`; wrong model `f_*` for `S¹ → pt` | stalk functor at `x` (filtered colimit, exact); restriction (exact); `H¹(S¹, R) = R ≠ 0` | `f^*` exact, `f_*` not: direction matters | none |
| ALS.F.3 (iii) route | `TopCat.Presheaf.stalkPullbackIso`, `TopCat.Sheaf.pullbackIso` | `F.stalk (f x) ≅ ((pullback C f).obj F).stalk x`; sheaf pullback ≅ presheaf pullback then sheafification, which keeps stalks | route's inputs exist as cited | none |
| `Rf_!` clause (lines 513, 746) | supplier text; the roadmap's spaces | §C6.1: locally proper separated, paracompact, locally contractible; `X̄^G × G(𝔸^∞)^δ` is a disjoint union of manifolds with corners | hypotheses equal the supplier's and hold | none |
| ALS.F.4 definition (reworded) | discrete `G` | `X × G = ⊔_g X`, `p^*F` restricts to `F`, `m^*F` to `g^*F`: `θ` is a family `θ_g : F ≅ g^*F` with cocycle | agrees with the discrete clause; content as before | none |
| ALS.5b.8 (reworded) | `n = 1`; `n = 2`, `[F⁺:ℚ] = 1`; general | `q₀ = 0`, `ℓ₀ = d − 1`; `[1, 2]`, `2q₀ + ℓ₀ = 3`; `2q₀ + ℓ₀ = dn² − 1` | same statement as at 215520b and as ACC+23 Theorem 2.4.10; Checks agree | none |

Rows for untouched statements stand as in the previous review, of `215520b`.

- Source locators checked against the text: 2 (ACC+23 arXiv 1812.09999v2, §2.4.9 and Theorem 2.4.10, lines 2089–2105, arXiv p. 52; NT16 arXiv 1511.04913v1, §2.4 Definitions 2.22–2.23, Lemma 2.24, §2.4.1 Lemmas 2.25–2.28, lines 745–796, p. 17). Numbering agrees with the README's locators; printed page numbers not rechecked.
- Seeded sample: only "Shared algebraic Cartan comparison" falls in a changed passage (line 1202, see R01); "Local systems with arbitrary stalks" sits below the changed part of ALS.F.3 and is unchanged. The other five targets are untouched.
- Library declarations opened at the pin: 6 (Mathlib `Topology/Sheaves/Stalks.lean` 172 `stalkPushforward`, 333 `stalkPullbackIso`; `Topology/Sheaves/Functors.lean` 89 `pullback`, 96 `pullbackIso`, 101 `pullbackPushforwardAdjunction`; Tau Ceti `InnerConjugation.lean` 62).
- Cross-roadmap citations resolved for the changed passages: 1 (ComplexComparisonPartII §C6.1 at its open head). No other roadmap, on main or open, cites the renamed heading of ALS.F.4 (`roadmaps grep`: no match); nothing in the README cites the former "(1)"/"(2)" of ALS.5b.8.
- Gate: every scanner 0, `depcheck = 0`, `build = 2` FAIL (R01). Dependency check run on this head: `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No file changed outside the folder.
- `#check @` of the three declarations on the prefixed probe copy: types equal those the previous review recorded; no section binder lost. No padding probe needed: no statement other than the constant's name changed.
- Overlap check: the closest-roadmap lists (PotentialAutomorphyInfrastructure, AutomorphicFormsOnReductiveGroups, HilbertModularVarietiesAndShimuraCurves, CrystallineLocalGlobalCompatibilityCM, CompletedCohomologyPartII; AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups, ReductiveGroupsPartII) were not reread: their scopes were compared by the review of `215520b`, and the diff adds one owned object, ALS.F.3 (iii), which `roadmaps grep` over main and every open head finds only in this roadmap; nothing shared.
- Source independence: changed passages only; 2 passages compared with 2 sources (ALS.F.4 with NT16 lines 748–764, ALS.5b.8 with ACC+23 lines 2090–2105), longest shared run 5 words, all formula or standard names; the former ALS.F.4 heading, which was NT16's §2.4 title, is replaced; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Printed page numbers of ACC+23 (pp. 948–951) and NT16 for the two reworded passages: read in arXiv versions, whose pagination differs; theorem and section numbers agree.

## Source issues

- none

## For the human reviewers

- none
