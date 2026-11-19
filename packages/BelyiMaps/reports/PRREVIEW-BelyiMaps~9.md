# Review of BelyiMaps (pull request #1791 at a370b60)

**Verdict:** needs changes

**Summary.** Changes are needed, and both findings are on what this pull request adds: the new adapter of 7.7 makes a roadmap on main depend on SurfaceTopology and PlanarTopology, which are not on main and which themselves consume BelyiMaps, so the supply runs in a circle (R01); and the pull request edits `Completed/ConformalMapping/README.md`, a folder outside the ones under review (R02). The rest of the folder is main's text, whose mathematics I recomputed and found sound; it carries six small corrections and two format notes, none blocking. Two questions are left for a human: who owns the transitive groups of degrees 6 to 11, and whether Layers 3.1 and 14 are within scope.

## R01 (P1) — The adapter of 7.7 takes its inputs from two roadmaps that are not on main, one of which consumes this roadmap

A reader of main after this merge would find a target of Layer 7 whose prerequisites exist nowhere on main, and a supply that runs both ways between BelyiMaps and SurfaceTopology. The new text of 7.7 (lines 2954–2963 and 2985–2987) says "This section supplies the adapter to SurfaceTopology Layer 5's general topological branched-cover predicate" and "The adapter additionally uses SurfaceTopology Layer 5's general branched-cover and degree results and PlanarTopology Layer 0's chart transport"; the new Boundaries paragraph (lines 198–203) says SurfaceTopology's "Layer 2 supplies the conversions". Neither `TauCetiRoadmap/SurfaceTopology/` nor `TauCetiRoadmap/PlanarTopology/` is on main: both are added by the open pull request #271, so the four relative links are dead as well. At the head of #271, SurfaceTopology's own contract lists `PermutationTriple` and `BipartiteRibbonGraph` as "owned by `BelyiMaps`" among what it consumes, and says of the two roadmaps that the relationship "has two directions at distinct interfaces". Two interfaces do not make a cycle between two roadmaps acyclic. The rule is that a roadmap takes its inputs only from roadmaps earlier than it in the merge order, so that supply runs one way and each layer can be built when its turn comes. The mechanical test of that rule reports 200 roadmaps, 2198 edges and no problem here only because the merge order gives neither SurfaceTopology nor PlanarTopology a position, so the two edges are never compared.

The new lines also contradict the README's own bookkeeping: §Prerequisites (line 117) allows "a named layer of another roadmap in this repository", and the import list of section B (line 320) ends "and nothing else; UniversalCovers; AlgebraicTopology Stage 1; …" without either roadmap. And the adapter is not yet a statement: SurfaceTopology's `IsBranchedCover` is declared for spaces with a `ChartedSpace (EuclideanHalfSpace 2)` instance, while `TauCeti.TopBranchedCover` carries none (`AlgebraicTopology/ThricePuncturedSphere/TopBranchedCover.lean:148–167`; 7.7 itself says "No atlas is part of the data and none is needed"), so the text must say which atlas on `Z` and on the sphere the adapter is stated for.

The smallest change keeps one direction, BelyiMaps → SurfaceTopology. Move the adapter to SurfaceTopology Layer 5 as a target there: it consumes `TauCeti.TopBranchedCover`, `TauCeti.IsLocalPowerAt.unique` and `TauCeti.TopBranchedCover.localDegree`, which are at the Tau Ceti pin, and states, for a chosen half-space atlas, that `π` with `marked` and `localDegree` satisfies its predicate with total degree `n`. In this README, delete the paragraph "Comparison with general surface covers" as a target and the sentence after the Prerequisites line of 7.7, and reword the Boundaries paragraph and the Layer 2 bullet as consumer statements by roadmap name and layer, without a link ("SurfaceTopology consumes Layers 0, 2 and 7.7; nothing here consumes it"). The `z ↦ z²` sentence can stay as a Check on the local degree. If BelyiMaps is to own the adapter instead, it belongs in a Part II roadmap placed after SurfaceTopology.

## R02 (P2) — The pull request edits `Completed/ConformalMapping/README.md`

The diff against main adds six lines to the "Downstream consumers" of `Completed/ConformalMapping/README.md` (after line 1368), naming PlanarTopology Layer 2 as a consumer through a link to `TauCetiRoadmap/PlanarTopology/README.md`. That folder is neither this roadmap's nor GeometricTopology's, so the change reaches main with no review of its own, and its link target does not exist on main either. Either take the six lines out of this pull request (they belong with #271, which adds the consumer), or have the ConformalMapping edit reviewed as a folder of this pull request.

## C01 — The two proved statements of `Suggested.lean` ask an implementer for nothing, and one of them is already at the pin

`opposite_third_peripheral` (line 72) closes by `group`, and `conjugation_transfer` (line 81) is `TauCeti.map_conj_eq_conj_of_map_eq_conj` (`GroupTheory/ConjugationTransfer.lean:39`) specialised from any `MonoidHomClass` to `G ≃* G`, as §Pinned conventions already says. They are kept because PeripheralActions cites them by these names. Would you mark them in the docstring as exports kept for that consumer rather than as targets, or have PeripheralActions cite the Tau Ceti lemma?

## C02 — The file given for the van Kampen declarations does not exist

Boundaries (line 182) and the supplier table (line 576) place `TauCeti.vanKampenEquiv` in `TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen.lean`. At the pin `VanKampen` is a directory; `vanKampenEquiv_toMonoidHom` is at `FundamentalGroup/VanKampen/Basic.lean:558`.

## C03 — In the genus reconciliation of 8.6 the two sides are not `Σ (e − 1)`

Line 3260 says "Both sides are `Σ (e − 1)` over the three fibers". For `torusTriple` that sum is `3 + 3 + 1 + 1 = 8`, while `2g − 2 = 0` (8.5 computes `2g − 2 = 4·(−2) + 8`). What the two computations share is `2g − 2 = −2n + Σ (e − 1)`, with `Σ (e − 1) = 3n − Σ c(σ_i)` on the combinatorial side; writing that identity makes the sentence true.

## C04 — 14.2 displays `trueOrbitSize` on the wrong carrier

The display at line 5429 reads `def trueOrbitSize (c : IsoClass n)`. Everywhere else `IsoClass n` is the set of relabeling classes of triples (0.2), on which no Galois action is defined in the roadmap; 11.7 and the pin (`FieldTheory/FunctionField/Belyi/GaloisAction.lean:271`) define the orbit size on isomorphism classes of algebraic Belyi pairs. Use that carrier in the display.

## C05 — 11.6 invokes 11.4 without the continuity that 11.4 requires

11.4 makes local constancy of the family `f_σ` a hypothesis of the descent datum ("not an automatic consequence"), and 11.6 (line 4508) passes from uniqueness of `f_σ` to "the family is automatically a cocycle and 11.4 applies". The missing step is short: for `σ` fixing the number field of 10.7's model, the identity of the model is an isomorphism from the conjugate, hence is the unique `f_σ`. Say so in 11.6.

## C06 — The statement of Köck's (2.2) is quoted rather than restated

The Source line of 10.7 (lines 4327–4329) gives the theorem inside quotation marks, sharing fifteen consecutive words with kock2004 line 277. The roadmap states results in its own words; for instance: "Köck (2.2): the pair has a model over some finite extension of `M(X, t)`, and over `M(X, t)` itself when the covering is Galois."

## N01 — "the frozen snapshot" is never identified

Layers 3.5 and 14 speak of "the frozen snapshot", "the 13 frozen LMFDB records" and "the frozen `belyi_passports` schema" (for example line 5379), while the opening of Layer 14 says records are read from the database pages by label. Say once which state of the database is meant, or drop the word.

## N02 — A second acceptance statement is available at the pin

If 11.3's "the field of moduli is a number field" counts as a headline, it is statable now: `FiniteDimensional ℚ c.fieldOfModuli` for `c : TauCeti.AlgebraicBelyiPair.IsoClass (AlgebraicClosure ℚ)` (`Belyi/FieldOfModuli.lean:94`). The one-tactic probe does not close the 13.5 statement, which is not padding.

## Previous findings

The folder is now main's rewritten text, so the previous review's passages were looked up one by one at this head.

| Previous | At this head | Result |
|---|---|---|
| R01 compact-surface carrier given to SurfaceTopology | sentence gone; replaced by the 7.7 adapter | superseded by R01 above |
| R02 supplier count | line 128: "The supplier boundaries are stated once here." | repaired |
| R03 dead link to SurfaceTopology | lines 198, 267, 2956, 2985–2986 | not repaired; in R01 |
| R04 nonexistent successor roadmaps | §Scope owns Layers 0–14 | repaired |
| R05 cycle with PeripheralActions | line 133: "this roadmap cites nothing of PeripheralActions" | repaired |
| R06 monodromy of a disjoint sum | 0.6 item 2: image of the common representation, diagonal `C₂` | repaired |
| R07 spherical list | 4.4: `(1,b,c)` with `ZMod (gcd b c)`; exact signatures apart | repaired |
| R08 elliptic criterion | 4.5 item 3: `m ≥ 2`, distinct unit eigenvalues, trace `2` excluded | repaired |
| R09 meromorphy and holomorphy | 8.1 (3): sphere extension and normal form | repaired |
| R10 poles and orders | 9.2: locally discrete; `ord` on units, `⊤` at zero | repaired |
| R11 local comparison | 9.6: `K_D`-algebra maps, field factor selected | repaired |
| R12 degree-reduction measure | 10.2: `ν` counts nonrational points | repaired |
| R13 raw tensor | 10.7 step 5: `ℂ(t) ⊗_{k(t)} F_k`, or the fraction field | repaired |
| R14 Galois category | 12.6 step 1: all finite covers, empty included | repaired |
| R15 sorry'd data | `Suggested.lean` has no definition | repaired |
| R16 degrees 6–11, base change | declared gap at lines 594–599; 9.1C | repaired (see the human question) |
| R17 affine coefficients | 13.5: `c = β_m/α_m`, `d = β_0 − c α_0` | repaired |
| R18 convention controls | lines 387–395, 1946, 1956, 5045 | repaired, except the 8.6 sentence (C03) |
| R19 build warning | elaborates with one `sorry` warning | repaired |
| R20 raw passport equality | 0.8, 1.2: class sets and labels, groups conjugate | repaired |
| R21 CharacterTheory names | lines 148–152, pinned names | repaired |
| R22 duplicate carriers | milestones carry *Tau Ceti:* lines at the pin | repaired |
| R23 compact-surface supplier rows | FuchsianOrbifolds Layer 5; ModularForms §10B | repaired |
| R24 connectedness at `n = 0` | 4.2: "`n ≠ 0` and … pretransitive" | repaired |
| R25 restriction to the branch set | 7.7: `markedᶜ.restrictPreimage π` | repaired |
| R26 separators at poles | 9.3 step 2: regular evaluations | repaired |
| R27 descent continuity | 11.4: continuity a hypothesis; witness | repaired (C05 for its use) |
| R28 modulus `0` | 12.1: `n : ℕ+` | repaired |
| R29 classes and the embedded group | 12.12: image comparison first; `C₅` against `A₅` | repaired |
| R30 linear disjointness | 12.8: over `ℚ` | repaired |
| R31 absent headlines | 13.5 stated; the others named with what they lack | repaired |
| R32 executable enumeration, record parsing | 3.1 and Layer 14 unchanged | not repaired; accepted on main since, left to the humans below |
| R33 `set_option` | none | repaired |
| R34 copied statement | lines 4327–4329, now in quotation marks | partly; C06 |
| R35 padding | removed; see C01 for the two exports | repaired |
| R36, R37 process residue, pin drift | pull-request numbers and stale statuses gone | repaired, except N01 |
| R38 edit outside the folder | still in the diff | not repaired; R02 |

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 7.7 adapter (R01) | `TopBranchedCover` fields; SurfaceTopology `IsBranchedCover` at #271 | no charted structure on `Z`; predicate needs `ChartedSpace (EuclideanHalfSpace 2)` | not yet a statement; supply circular |
| 7.7 new Check, `z ↦ z²` | fibre over `0`; fibre over `1` | card 1, weight 2; card 2, weight 2 | true |
| 7.7 fold witness | `β = x²` on `y² = x³ − x`, fold `h` | 8 points over unmarked values; `h` locally injective off `[a]` | fails only the covering clause |
| Compact Riemann surfaces (sample) | FuchsianOrbifolds Layer 5 item 3; ModularForms §10B on main | Riemann–Hurwitz at lines 62, 132; §10B at 1173 | resolves |
| Cycle data (sample) | identity of `S₃` | `cycleType` sum 0; full type `[1,1,1]` sum 3 | convention needed; pin `Perm/Partition.lean:111` |
| Euler characteristic and genus (sample) | torus triple; `C₂ ⊔ C₂`; parity | `χ = 0`, `g = 1`; `χ = 4`; `3n − Σc` even | true; transposition induction keeps `χ ≤ 2·orbits` |
| Algebraic Belyi pairs (sample) | `k = ℚ`, `t ↦ u³` at `1` | `{(1,1),(1,2)}`, weighted sum 3 | true; `Bundled.lean:55` has `CharZero` |
| The Galois action is outer (sample) | splitting at `t = 2` | rational point, section exists, not canonical | consistent with 12.8 |
| Cyclotomic character (sample) | Kummer identity, `σ̃(t^{1/n}) = ζ^b t^{1/n}` | `σ̃γσ̃⁻¹(t^{1/n}) = ζ^{χ(σ)} t^{1/n}` | exponent `χ`, matches `toFun_spec` (`CyclotomicCharacter.lean:133`) |
| API of 6.2 (sample) | `monodromy_actionCoverFiberEquiv`, `fiberActionEquivalence` | `ActionCover/Basic.lean:201`; `FundamentalGroupAction.lean:174` | names at the pin, no inverse |
| Automorphism groups, 6.3 (sample) | `Deck.conjMulEquiv`, `automorphismGroup_smul` | `Deck/Conjugation.lean:129`; `PermutationTriple/Basic.lean:542` | at the pin |
| Branch-point compatibility (sample) | `mob01` on peripheral classes | `h_*(periphInf) = p₁⁻¹·periphInf·p₁` equals `b⁻¹cb` | `swap01` third component |
| Corollary 1.93(iv); Corollary 2.70 (sample) | — | — | not verifiable |
| The moduli field of a pair (sample) | kock2004 lines 115, 139, 146, 257, 270 | statements and hypotheses agree; `M(X) ⊆ M(X,t)` | supported |
| The conjugation action (sample) | `conj`, `instMulAction`, `degree_smul` | `GaloisAction.lean:79, 239, 262` | at the pin |
| Monodromy image comparison (sample) | `r ∘ θ⁻¹` with `θ` bijective | `range = range r` | one conjugator `τ` |
| Passport invariance (sample) | `(a,a,a³)` against `(a,b,(ba)⁻¹)` in `S₅` | all 5-cycles; groups of order 5 and 60 | slotwise conjugacy insufficient, as stated |
| 2.6 identities | all 617 triples of degree ≤ 4 | 0 counterexamples to the nine identities; naive swap gives `(0 2 1) ≠ 1` on `s3Triple` | true |
| Counts of 3.5 and 6.3 | degrees 1–4 | connected `1, 3, 26, 426`; classes `1, 3, 7, 26`; ordered passports `1, 3, 7, 26` | true |
| 3.2 Frobenius; 3.4 formula | `S₃`; `C₅` with `([5],[5],[5])` | `6` and `0`; `12·5/20 = 3` | true |
| §Pinned conventions, degree-5 pair | `a = (1 2)(3 4)`, `b = (0 1 2 3)` | types `[2,2,1],[4,1],[4,1]` both; no simultaneous conjugator; `χ = 2` | true |
| 4.4 polyhedral rows; `6T6` | three permutation pairs; two generators | orders 12, 24, 60; order 24 | true |
| 4.5 traces | `(2,3,7)` | `tr(YX) = −2cos(π/7)`; commutator trace `2.247` | true |
| 10.2 measure; 10.3 | `{±√2}`; `B_{m,n}(m/(m+n))` | `ν: 2 → 0`; value `1` | true |
| 13.5 lemma | `H₁ = x, H₂ = 2x`; char `p` pair | `c = 2`; both composites `x^{p²} − x^p` | true |
| 12.12 fifth powers | `((012),(01),(12))` | product sends `0 ↦ 1` | not a triple, as stated |
| Headline 13.5 in Lean | one-tactic probe; `#check` | not closed; type `FaithfulSMul Gal(ℚ̄/ℚ) (IsoClass ℚ̄)` | equals the README statement |
| Headlines 9.8, 10.7, 11.6, 12.6, 12.11, 13.3 | Belyi files at the pin | no transcendental base change, no definability carrier, no `π₁ᵍᵉᵒ` | not statable, named in the docstring |

- Source locators checked against the text: 6 in kock2004 ((1.4), (1.5), (1.6), (2.1), (2.2) and the first steps of its proof), 2 in mssv2019 (relation at line 114, Algorithm 2.3.1 at line 188).
- Library declarations opened at the pin (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`): 19, with file and line above.
- Cross-roadmap citations resolved on main: FuchsianOrbifolds, ModularForms §10B, AlgebraicCurves 12B.0a/b/d (lines 2044–2083 name this roadmap), AlgebraicTopology Stage 1, ComplexManifolds, CharacterTheory, and the completed UniversalCovers, ProfiniteArithmetic, PolynomialGaloisGroups, PeripheralActions; SurfaceTopology and PlanarTopology read at the head of #271.
- Automatic checks: two failed, both real (R01, R02); the targeted build passes. Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with the single `sorry` warning at line 97; `#check` of the three declarations agrees with the README; no section binder is lost.
- The declared gap for transitive groups of degrees 6 to 11 is precise (counts `16, 7, 50, 34, 45, 8`) and names its supplier; no plan file exists for a roadmap on main.
- Duplication: `conjugation_transfer` against the pinned lemma (C01); no other declaration of `Suggested.lean` is at the pin or in another roadmap.

Overlap check: read SurfaceTopology (open), GroupActionsOnRiemannSurfaces (open), NoncongruenceModularForms, ProfiniteArithmetic and PeripheralActions (main); permutation triples, dessins, triangle groups and `TopBranchedCover` are owned here and cited by the others; the profinite ring and outer automorphisms are ProfiniteArithmetic's; the marked-cover adapter is claimed here and handed back by SurfaceTopology (R01).

Source independence: 8 passages compared with 2 sources, one shared (fifteen consecutive words, C06); largest share ggd2012, 19 of 60 source mentions, text and contents not readable; its chapter numbers appear out of order across the layers (chapter 1 in Layers 7–9, chapter 2 in Layers 4–6 and 12, chapter 4 in Layer 13): independent as far as the README shows.

Research link: The headline targets are Belyi's theorem as in Köck 2004, the branch-cycle theorem of Fried 1977 and Szamuely 2009, and faithfulness of the Galois action on dessins (Lenstra, in Girondo–González-Diez 2012); the database semantics follow Musty–Schiavone–Sijsling–Voight 2019. Rests on the README's sources and on kock2004 and mssv2019 as read.

## Not verifiable

- ggd2012 (Girondo–González-Diez) and szamuely2009: publisher landing pages only; Corollary 1.93(iv), Corollary 2.70, Theorem 2.61, Proposition 1.54, Theorem 1.76 and Szamuely 4.7.3 stay uncertified.
- lando-zvonkin2004, Proposition 1.5.3: paywalled.
- Forster, Couveignes, Stix, Fried, Deligne, Weil: not in the sample, not fetched this round.
- The LMFDB statements of Layers 3.5 and 14 (thirteen records of degree ≤ 4, four imprimitive ones, completeness through degree 6): no fixed public snapshot to read them against.

## Source issues

- none

## For the human reviewers

- **Scope.** Layer 3.1 prescribes executable procedures and Layer 14 database record structures and label parsers (README lines 1307–1360, 5344–5614). This text is on main and was accepted there; this pull request does not touch it.
- **Scope.** The gap for transitive groups of degrees 6 to 11 names PolynomialGaloisGroups (README lines 594–599), whose own scope section lists that completeness as outside the roadmap (`Completed/PolynomialGaloisGroups/README.md` line 57).
- **Not tested.** ggd2012 has the largest share of the locators (19 of 60) and its text and table of contents could not be read: wording and arrangement were not checked against it.
- **Scope.** `Completed/PeripheralActions/README.md` line 106 says BelyiMaps' Layer 13 cites its existence theorems; this README (line 133) says it cites nothing of PeripheralActions.
