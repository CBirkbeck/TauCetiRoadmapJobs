# Review of BelyiMaps (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has not changed since the review of `f17d28c`, and this round read the pull request's title and description against the head. They now describe the BelyiMaps change correctly, and the one correction about the description from the previous review is repaired. No finding remains. Six small corrections and two format notes from the previous review, all in text this pull request leaves as it was or already noted, are carried; none blocks. One source question is left for a human (Lando–Zvonkin could not be read).

## C01 — `Suggested.lean`, `conjugation_transfer` (line 93) restates a pinned Tau Ceti lemma

It is `TauCeti.map_conj_eq_conj_of_map_eq_conj` (`TauCeti/GroupTheory/ConjugationTransfer.lean:39`) specialised to `G ≃* G`, and `opposite_third_peripheral` (line 84) closes by `group`. Both are kept as names PeripheralActions consumes; that roadmap could cite the Tau Ceti lemma instead.

## C02 — README lines 184 and 570 give a file that does not exist

They place the van Kampen declarations in `TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen.lean`. At the pin `VanKampen` is a directory; the declarations are in `VanKampen/Basic.lean`.

## C03 — In 8.6's genus reconciliation (line 3279) the two sides are not `Σ (e − 1)`

For the torus triple (`σ0 = σ1` a 4-cycle, `σinf` two 2-cycles, `n = 4`) the sum `Σ (e − 1)` is `3 + 3 + 1 + 1 = 8` while `2g − 2 = 0`. What the two computations share is `2g − 2 = −2n + Σ (e − 1)`; writing that makes the sentence true.

## C04 — 14.2 (line 5448) puts `trueOrbitSize` on the wrong carrier

The display reads `trueOrbitSize (c : IsoClass n)`. Elsewhere `IsoClass n` is the type of relabeling classes of triples (0.2), which carries no Galois action; 11.7 defines the orbit size on classes of algebraic Belyi pairs.

## C05 — 11.6 (line 4528) applies 11.4 without the continuity 11.4 requires

11.4 makes local constancy of `f_σ` a separate input. The missing step is short: for `σ` fixing a number field over which 10.7 gives a model, the identity of that model is the unique `f_σ`, so the family is trivial on an open subgroup.

## C06 — The Source line of 10.7 (lines 4346–4348) quotes Köck

Köck's Theorem (2.2) appears there in quotation marks. A restatement in the roadmap's own words would do, for instance: "the pair has a model over some finite extension of `M(X, t)`, and over `M(X, t)` itself when the covering is Galois".

## N01 — Three lines this pull request adds run past the 100-column limit

`Suggested.lean` line 11 (in the module docstring) and README lines 90 and 2499. Rewrapping fixes it.

## N02 — "frozen" records, snapshot and schema (Layers 3.5 and 14, twelve times) are never identified

Saying once which state of the database is meant, or dropping the word, would fix this.

## Previous findings

- The review of `f17d28c` had no finding (R). Its C01, on the description, is repaired: the bullet now reads "`Suggested.lean`: `bijOn_balancedProduct_lift` (the universal property; the functor and the adjunction are listed as data)". Its C02–C07, N01 and N02 are not repaired (the folder is unchanged) and are carried above as C01–C06, N01, N02.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `bijOn_balancedProduct_lift` (cited by the description's BelyiMaps bullet) | `G = ℤ/2`, `K = ⊥`, `Z` a point, `Y` any `G`-set | balanced product has 2 points; `G`-maps determined by `f⟦1⟧ = y`, `f⟦s⟧ = s • y`: `|Y|`; maps point `→ Y`: `|Y|` | bijection, true |
| same | `G = K = ℤ/2`, `Z` a point, `Y` two points swapped | product is one point; `G`-maps need a fixed point of `Y`: 0; `K`-maps point `→ Y`: 0 | both empty, true |
| same | `G = K = ℤ/2`, `Z` a point, `Y` two points, trivial action | 2 `G`-maps; 2 `K`-maps | true |
| Description: "sixteen roadmaps" | folders changed against the base | 16 folders, 31 files; 16 bullets | as stated |
| Description: pin `2fd255d` | `lake-manifest.json` | Tau Ceti rev `2fd255d997f4…` | as stated |
| Description: "§§2.4 and 6.2 … ribbon graphs are equivalent to finite `FreeGroup (Fin 2)`-sets" | README 2.4 (lines 1121–1142) | equivalence onto `Action FintypeCat (FreeGroup (Fin 2))` | as stated |
| Description: "balanced product `G ×_K Z` is the left adjoint of restriction … to a subgroup `K`" | README 6.2 (lines 2487–2501) | functor `Action (Type u) K ⥤ Action (Type u) G` left adjoint to `Action.res (Type u) K.subtype` | as stated |
| Description: "the functor and the adjunction are listed as data" | `Suggested.lean` docstring, lines 63–71 | "Supplementary targets not stated here … They are data" | as stated |
| Description: only DynamicalDegreesOfRationalMaps leaves `Suggested.lean` unchanged | diffstat against the base | it is the one folder with a README change only | as stated |
| Description: change stated for this folder | diff against the base | 84 insertions, 11 deletions; no heading or layer removed; one declaration added, none removed | nothing left unstated |

The rows of the previous review, of `f17d28c`, stand for the untouched statements.

- Folder diff since `f17d28c`: empty; the pins are unchanged.
- Elaboration: `Suggested.lean` elaborates with two `sorry` warnings (lines 113, 128) and nothing else.
- Dependency check: `depcheck: 95 roadmaps, 1065 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all text and form checks pass on the folder; the only flag is set aside below.
- Library declarations opened: 1 at the Tau Ceti pin (`map_conj_eq_conj_of_map_eq_conj`, `ConjugationTransfer.lean:39`); the `VanKampen` directory listed.
- Cross-roadmap search: the README and Lean files of the open roadmaps and of main searched for the balanced product, its lift and ribbon graphs; no other owner of a category of bipartite ribbon graphs or of induction of `G`-sets. TemperleyLiebOperatorAlgebras, Foams and SurfaceTopology cite BelyiMaps Layer 2.
- Seeded sample and source locators: no changed passage, so none falls to this round.
- No layer, item or id of the README at the merge base is removed or retitled; the other open pull request that changes this folder (#1791) merges cleanly, as the description's merge-order block records.

Overlap check: read ProfiniteArithmetic, NoncongruenceModularForms, GroupActionsOnRiemannSurfaces (main), NonabelianLevelStructures, SurfaceTopology, SurfaceGroupCharacterVarieties (open); nothing shared. SurfaceTopology names the bipartite ribbon graph as owned by BelyiMaps.

Source independence: changed passages only. No passage of the folder changed since `f17d28c`, so none was compared; no layer is added, removed or reordered, so the arrangement was not compared. Largest share of the README's source mentions: Girondo–González-Diez, not readable.

Research link: the headline targets are Belyi's theorem (Köck 2004, Theorems (2.2), (3.3)), the branch-cycle theorem (Fried 1977; Szamuely 2009, §4.7) and faithfulness of the Galois action on dessins (Lenstra's argument, Girondo–González-Diez 2012, Theorem 4.49); this rests on the README's references.

## Not verifiable

- Lando–Zvonkin 2004, §1.3 and §1.5 (the source line of 2.4): no legal copy; only that the pinned `TauCeti/Combinatorics/RibbonGraph/Classification.lean` cites the same sections.
- Girondo–González-Diez 2012: no legal copy; the text this pull request adds does not cite it.

Automatic checks set aside as false positives: the check for changes outside the folder lists 29 files, all in the fifteen other roadmap folders this pull request itself revises; each has its own review.

## Source issues

- none

## For the human reviewers

- **Not tested.** The one locator the pull request adds here, Lando–Zvonkin §1.3 and §1.5 (README 2.4, line 1132), could not be read; nor could Girondo–González-Diez, the most cited source of the README.
- The earlier scope questions (executable procedures in Layer 3.1, database record structures in Layer 14, the owner of the gap for transitive groups of degree 6 to 11) concern untouched text and are unchanged.
