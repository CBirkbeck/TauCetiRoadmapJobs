# Review of GeometricTopology (pull request #903 at 68bf156)

**Verdict:** needs changes

This is a full review of `68bf156`. The folder changed by 157 lines since `61401bd` (r77). All of those changes are in `README.md`; `Suggested.lean` is unchanged.

## Previous findings (r77)

Six of r77's seven findings are repaired. R03 is unchanged, and the repair it asks for lies outside the folder (see below). The R01 repair brings in new text, and R01 and R02 below are defects in that text.

- **R01 (proportionality through the measure norm): repaired.**
  - 7.2 now has a target bullet for measure chains and Löh's comparison (`README.md:6635–6651`).
  - The reverse inequality now runs on measure cycles: "‖[M]‖_sm ≤ vol(M)/v(σ); Löh's comparison turns this into ‖M‖ ≤ vol(M)/v(σ)" (`:6661–6664`).
  - 7.3 runs "with the norm the measure one throughout" (`:6762–6771`).
  - Every Löh locator matches `loeh2006`:
    - Theorem 1.2 at line 39;
    - Definitions 5.1, 5.2 and 5.6 at lines 588, 608 and 652;
    - Proposition 5.3 at line 613;
    - Theorems 5.7 and 5.9 at lines 661 and 681;
    - Corollary 6.2 at line 712.
  - The Check value `4π(g−1)/π = 4g − 4` is correct.
  - The `S¹` chain `Σ i⁻² δ_(σ_i)` is correct: its total variation is `π²/6`, `∫ dθ/2π` diverges, and its speeds `2πi` are unbounded.
- **R02 (degree −1): repaired.**
  - `:6672–6679` reads "positively oriented when `deg f = 1` and negatively oriented when `deg f = −1`".
  - The Check at `:6729–6734` is correct. Thurston §3.2 is the genus-two totally geodesic example, whose double is closed (`thurston-gt3m` lines 805–828). Also, `z ↦ z̄` sends `(0, 1, ∞, e^(iπ/3))` to `(0, 1, ∞, e^(−iπ/3))`.
- **R03 (two owners of the `δ = √2` Clifford model): not repaired; outside the folder, not raised again.**
  - The pull-request description still does not mention #867.
  - #867 at its head (`7cf3fee`) still calls the model its own target (`README.md:853–855`). Its `Suggested.lean:121–144` still declares `cliffordForm`, `EvenClifford`, `majorana` and `cliffordScalarCoefficient`.
  - This README already states the split (`:56–63`, `:7839–7843`).
  - r77 asked only for a change to the description. r73 settled description-only requests as not actionable in this package.
  - The duplicate ownership persists until #867 cites 4.5.3 and drops its own model. That repair belongs to #867.
- **R04 (missing *Needs:* lines in 4.7.2 and 4.7.5): repaired.**
  - The lines are at `:4307–4313` and `:4435–4437`.
  - Every name in them exists at the pins (table below), including Tau Ceti's `GroupTheory/Perm/SwapFactors.lean`, for example `card_add_orbitCount_le_length_add_two` at `:564`.
- **R05 (braid indexing): repaired.**
  - `:2286` reads "native `BraidWord` letters, zero-based".
  - `(σ₀σ₁⁻¹)²` on three strands has a 3-cycle permutation.
  - The one-based reading `(σ₁σ₂⁻¹)²` fixes strand 0 and closes with covering degrees 3 and 1, as stated at `:2293`.
- **R06 (4.7.7 Checks): repaired.**
  - The `P(3,3,3)` colouring module over `ZMod 9` has `9·3·9 = 243` elements.
  - Over `ZMod 27`, `Ann(3) × Ann(9)` has 27 elements and maximal order 9 (`:4531–4535`).
  - The `P(−3,5,7)` sentence now claims only that the computed invariants do not separate it from the unknot (`:4536–4541`).
- **R07 (`2g ≤ c − 1` at the unknot): repaired.** `:5465–5467` reads "for nontrivial K … 2g(K) + 1 ≤ c(K)", with the trefoil at `3 ≤ 3`.

## R01 (P2) — 4.12's Garside normal form is not unique as stated: `1` and `Δ_n` are positive permutation braids

**Location.** `README.md:5508–5510`:

> every braid is uniquely `Δ_n^k s₁ ⋯ s_r` with `k ∈ ℤ` and `s₁, …, s_r` a left-weighted sequence of positive permutation braids

**Claim.** The pair `(k, (s₁, …, s_r))` is unique.

**Witness.** The positive permutation braids of the identity and of the longest permutation are `1` and `Δ_n`. The README's own wording then gives two normal forms for each of these braids:
- `Δ₃ = Δ₃¹` (with `r = 0`) and `Δ₃ = Δ₃⁰ · Δ₃` (a one-term sequence, left-weighted vacuously).
- `σ₁ = Δ₃⁰ · σ₁ = Δ₃⁰ · σ₁ · 1`, where `(σ₁, 1)` is left-weighted because `1` has empty starting set.

The section's own Check (`:5520`) reads `Δ₃`'s normal form as `k = 1`, `r = 0`. So the statement and the Check disagree.

**Repair.**
- Require each `sᵢ` to be a positive permutation braid different from `1` and `Δ_n`. These are the proper simple elements of Elrifai–Morton's left-weighted form and of Epstein et al.'s left-greedy form.
- Add a Check: `Δ₃ = Δ₃¹ = Δ₃⁰ · Δ₃` shows why `Δ_n` is excluded, and `σ₁ = σ₁ · 1` why `1` is.

Tested: after the repair, `Δ₃` has only `(1, ())`. The Check `σ₁σ₂⁻¹ = Δ₃⁻¹ · σ₂ · (σ₂σ₁)` still qualifies, since both factors are proper and `S(σ₂σ₁) = {2} ⊆ F(σ₂) = {2}`.

## R02 (P2) — 7.2's integration of forms over measure cycles is class-invariant only for closed forms

**Location.** `README.md:6642–6645`:

> Integrating a `k`-form `ω` along a measure chain `μ`, `∫ (∫_Δᵏ σ*ω) dμ(σ)`, is continuous for the `C¹` topology and satisfies Stokes' formula, so on cycles it depends only on the class

**Claim.** For every `k`-form, two homologous measure cycles have equal integrals.

**Witness.** On `T² = ℝ²/ℤ²` take `ω = sin(2πx) dy`, so that `dω = 2π cos(2πx) dx ∧ dy`.
- Let `c` be the boundary of the square `[0, ¼]²` (two straight triangles). It is a smooth singular 1-cycle in the class `0`.
- By Stokes, `∫_c ω = ∫_square dω = ¼ · sin(π/2) = ¼`.
- The zero cycle, in the same class, gives `0`.
- Through `σ ↦ δ_σ` the same pair of measure cycles is a counterexample.

**Repair.**
- Write "Integrating a `k`-form `ω` … satisfies Stokes' formula, so for closed `ω` (`dω = 0`) it depends on cycles only through their class; every `n`-form on an `n`-manifold is closed, which is the case used for `[M]`."
- Add the `T²` pair above as a negative-control Check, with values `¼` against `0`.

The proportionality and Möbius steps use only the volume form, so they are unaffected.

## R03 (P3) — 7.2's *Needs:* line cites a topology on maps between normed spaces for smooth simplices, and omits four inputs of Löh's route

**Location.**
- `README.md:6741–6742`: "and `ContMDiffMap.weakWhitneyTopology` as the chart-level `C¹` topology on smooth simplices".
- `:6747–6749`: "Löh's route also needs smooth singular homology with Whitney smoothing (Löh, Proposition 5.3) and the bounded cohomology of spaces with its duality principle … which are targets here".

**Claim.**
- The cited declaration topologizes the smooth simplices `Δᵏ → M`.
- The listed inputs are what Löh's proof uses.

**Witness.**
- **The topology.**
  - `ContMDiffMap.weakWhitneyTopology` (Tau Ceti `Geometry/Manifold/ContMDiffMap/WeakWhitney/Basic.lean:108`) is a topology only on `C^n⟮𝓘(𝕜, E), E; 𝓘(𝕜, F), F⟯`, maps between two normed spaces. A simplex `Δᵏ → M` is not such a map.
  - The pin has the manifold-level `ContMDiffMap.manifoldWeakWhitneyTopology` (`Geometry/Manifold/ContMDiffMap/Chart/Topology.lean:72`). It tests derivatives "within the extended source chart target, including at boundary and corner points".
- **The route inputs.** Löh's Theorem 5.9 is proved "as in Section 4.1" (`loeh2006` lines 684–697), so it uses:
  - Theorem 3.5, which rests on Monod's Theorem 7.4.5 and Lemma 7.2.6 (lines 345–363);
  - the Borel section of Theorem 4.1, proved in the Appendix (lines 476, 757);
  - triangulability of smooth manifolds (Remark 3.6, line 332).

  Theorem 5.7 uses Zastrow's Eilenberg–Steenrod axioms for smooth measure homology (line 664). None of these is listed. Layer 11.3, which supplies smooth triangulations, is not in the *Needs:* line.

**Repair.**
- Replace the topology clause by: "Löh's `C¹` topology on smooth simplices (Löh, Definition 5.1), a target here, built from `ContMDiffMap.manifoldWeakWhitneyTopology` (`Geometry/Manifold/ContMDiffMap/Chart/Topology.lean`)".
- Add the following to the route inputs that are targets here:
  - Löh's Theorem 3.5, with Monod's comparison of strong relatively injective resolutions (Monod, *Continuous bounded cohomology of locally compact groups*, LNM 1758, Theorem 7.4.5);
  - the Borel section of Löh's Theorem 4.1 (Appendix);
  - the Eilenberg–Steenrod axioms for smooth measure homology behind Theorem 5.7.
- Add "Layer 11.3 (smooth triangulations, for Löh's Remark 3.6)" to the *Needs:* line.

Tested: with these additions, each step of the proof of Theorem 5.9 (lines 684–697) is a target here, a supplier section or a pinned declaration.

## R04 (P3) — 4.8's Morton–Franks–Williams Check computes the Jones span, not the HOMFLY `v`-span the bound uses

**Location.** `README.md:4638–4639`:

> The closure `T(3, 4)` of `(σ₁σ₂)⁴` has `span V = 5`, and the bound gives braid index `3`, attained by that braid

**Claim.** The Check exercises the bound `(span_v P)/2 + 1` stated at `:4625–4626`.

**Witness.**
- I computed HOMFLY with `v⁻¹P(L₊) − vP(L₋) = zP(L₀)`, the convention that gives the README's trefoil `2v² − v⁴ + v²z²`. For `T(3, 4)` it is `v⁶(5 + 10z² + 6z⁴ + z⁶) − v⁸(5 + 5z² + z⁴) + v¹⁰`.
- Its `v`-exponents are 6, 8 and 10. They fill `[w − k + 1, w + k − 1] = [6, 10]` for `w = 8`, `k = 3`. So `span_v P = 4`, and the bound gives 3.
- The Jones span 5, of `V = t³ + t⁵ − t⁸`, put into the stated formula would give `3.5`, so index at least 4. That contradicts "attained by that braid".

**Repair.** Rewrite the Check as follows:

> The closure `T(3, 4)` of `(σ₁σ₂)⁴`, with `k = 3` and `w = 8`, has HOMFLY `v`-exponents `6, 8, 10`, filling `[w − k + 1, w + k − 1]`, so `span_v P = 4` and the bound gives braid index `3`, attained by that braid (by evaluation).

## R05 (P3) — 4.8's *Needs:* line omits 4.7.1, where the unknotting and bridge numbers it uses are defined

**Location.**
- `README.md:4605`: "Use Layer 4.7.1's unknotting number `u(K)` and bridge number `br(K)`".
- `:4643`: "*Needs:* Layer 4.2 through 4.6."

**Claim.** The *Needs:* line lists what 4.8's statements use.

**Witness.**
- `u` is defined at `:4233` and `br` at `:4237–4238`, both in 4.7.1.
- 4.8's statements `br(K) = 1 ⇔ unknot`, Schubert's additivity and `u(K # J) ≤ u(K) + u(J)` are about these invariants.
- "Layer 4.2 through 4.6" stops before 4.7.

**Repair.** Write "*Needs:* Layer 4.2 through 4.6 and Layer 4.7.1 (the unknotting and bridge numbers)."

## R06 (P3) — 5.4's Check "The unknot is excluded" uses a pair the theorem's conclusion already allows

**Location.** `README.md:5990–5992`:

> The meridian `∞` and the slope `±1` on the unknot both give `S³`, at distance one; the unknot's exterior is a solid torus, Seifert fibred, so the theorem does not apply to it.

**Claim.** The Check shows that the theorem needs its non-Seifert-fibred hypothesis.

**Witness.**
- `Δ(1/0, 1/1) = |1·1 − 0·1| = 1`, which satisfies "distance at most one". So the Check holds whether or not the hypothesis is there.
- On the unknot, the slopes `∞` and `1/2` both give `S³ = L(1, 2)`, at distance `|1·2 − 0·1| = 2`.
- In `cyclic_surgery_theorem`'s form, the value `1/2` is neither `∞` nor an integer, although the filling is cyclic.

**Repair.** Rewrite the Check as follows:

> On the unknot the meridian `∞` and the slope `1/2` both give `S³`, at distance `2`, and `5/2` gives the cyclic `L(5, 2)`, also at distance `2`; the unknot's exterior is a solid torus, Seifert fibred, so the hypothesis excludes it (by evaluation).

## Verified sound

**Gate, dependency check, build.**
- My gate run on `68bf156` ends with `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- The dependency check (`--movable`) prints `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**
- I put the 26 theorems with `#check @name` in one scratch copy. `lake env lean` exits 0 with exactly 26 `declaration uses sorry` warnings and no error.
- The file has no section `variable`s, and every binder is in the signature. The elaborated types match the README statements.
  - The worker's `signatures.md` lists 27 declarations only because the docstring's line 42 begins with "theorem,".
- **Padding probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | decide | trivial | assumption`. All 26 fail. None restates a README Check.
- All 26 theorem names appear in the README in backticks.

**Headline theorems.**
- The README's end theorems (`:14–24`) are all in `Suggested.lean`:
  - Smale and Watanabe; the annulus theorem;
  - Freedman and Levine's homology-concordance theorem;
  - Mostow; virtual fibering and virtual Haken;
  - JSJ, geometrization and Poincaré;
  - Li; Gabai–Meyerhoff–Milley;
  - Property P and Manolescu;
  - Alexander, the knot-group theorem and Gordon–Luecke.
- So are Property R, the cyclic surgery theorem, Kneser, Milnor, Radó, Moise, the sphere theorem and Waldhausen.
- The module docstring names, each with its missing carrier, the headlines that are not stated:
  - Levine's satellite theorem, the mutation statement, Kondo and Novikov–Rosenberg (not statable);
  - Zeeman (statable but open).
- Cerf and the tubular neighbourhood theorem are explained as library lemmas.

**Pinned declarations opened this round** (Tau Ceti `2fd255d9`, Mathlib at the pin):

| Declaration | File and line |
| --- | --- |
| `ContMDiffMap.weakWhitneyTopology` | `Geometry/Manifold/ContMDiffMap/WeakWhitney/Basic.lean:108` |
| `ContMDiffMap.manifoldWeakWhitneyTopology` | `Geometry/Manifold/ContMDiffMap/Chart/Topology.lean:72` |
| `Diffeomorph.weakWhitneyTopology` | `Geometry/Diffeomorphism/Topology.lean:85` |
| `TriangulationConjecture` | `Topology/TriangulationConjecture.lean:77` (`T2Space`, `CompactSpace`) |
| `IsTriangulable` | `Topology/Triangulable/Basic.lean:38` |
| `AnnulusConjecture`, `CoboundAnnulus` | `Geometry/Manifold/LocallyFlat/Annulus.lean:105`, `:91` |
| `IsSphereBoundsBall` | `Geometry/Manifold/Irreducible.lean:42` |
| `MostowRigidity`, `IsMostowRigid` | `Hyperbolic/Mostow.lean:72`, `:40` (compact, connected, boundaryless, `3 ≤ finrank`) |
| `GabaiMeyerhoffMilleyTheorem` | `Hyperbolic/Weeks.lean:77` |
| `VirtualFiberingConjecture`, `VirtualHakenConjecture` | `VirtualFibering.lean:62`, `VirtualHaken.lean:65` |
| `LiRankGenusTheorem` | `LowDimTopology/Heegaard/RankGenus.lean:138` |
| `ZeemanConjecture`, `Contractible2Complex` | `AlgebraicTopology/SimplicialComplex/Zeeman.lean:124`, `:62` |
| `SSet.homologyL1Seminorm` | `AlgebraicTopology/SimplicialSet/Homology/L1Norm.lean:153` |

Mathlib declarations opened:
- `MeasureTheory.SignedMeasure` (`MeasureTheory/VectorMeasure/Defs.lean:63`);
- `SignedMeasure.totalVariation` (`VectorMeasure/Decomposition/Jordan.lean:460`);
- `Equiv.Perm.IsSwap` (`GroupTheory/Perm/Support.lean:193`);
- `Equiv.Perm.IsThreeCycle` (`GroupTheory/Perm/Cycle/Type.lean:618`);
- `MulAction.orbitRel` (`GroupTheory/GroupAction/Defs.lean:287`);
- `SimpleGraph.Preconnected` (`Combinatorics/SimpleGraph/Connectivity/Connected.lean:234`);
- `SimpleGraph.Connected.card_vert_le_card_edgeSet_add_one` (`Combinatorics/SimpleGraph/Acyclic.lean:469`).

The pin has no bounded cohomology or measure homology, and no other roadmap plans them (`roadmaps grep`). So 7.2's new targets duplicate nothing.

**Cross-roadmap citations** (on main, `bbbde05`):
- DifferentialGeometry: *Boundary and corners* `:63`; Layers 3, 4, 5 and 12 at `:371`, `:402`, `:503`, `:910`.
- HopfRinow (`Completed/`): Layers 1–3 at `:264`, `:427`, `:451`.
- TypeAHeckeAlgebras: H1 `:40`, H2 `:143`.
- TemperleyLieb: Layers 4 and 5 at `:545`, `:606`; its four cited names at `Suggested.lean:94`, `:126`, `:134`, `:146`.
- Subfactors: §§3.1–3.3 at `:676`, `:697`, `:774`; `markovTrace_nonneg_iff` and `jonesLoopParameters` at `Suggested.lean:67`, `:58`.
- ReductiveGroups: §11A at `:1971`.
- SuccessiveMinima: Layer 1 `:266`; target 1.5 `exists_successiveMin_witnesses` at `Suggested.lean:275`.
- `roadmaps resolve` reports no missing citation.

**Overlaps and ownership.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The three anchors that other roadmaps cite are mapped at `:733–742`.
- The conflicting heads #1517, #1791 and #1797 were settled earlier as not actionable in this folder.
- **FourManifolds** (#936 at `46ee76a`) owns the four-dimensional proofs, matching *Scope*. Its `gap:` entries on GeometricTopology are declared contracts.
- **TeichmullerGeometry** (#1169) cites 1.7.2, 3.4 and 11.2.1 items 2 and 5. All of them exist.
- **KhovanovHomology** cites the Layer 4 anchor, which is mapped.
- **SurfaceTopology** (#271, read with `roadmaps show`) claims the classification of compact surfaces and the Dehn–Lickorish theorem. It is on the brief's never-cite list and not in `ORDER.txt`. So this README stays the owner, and the duplication is #271's to remove.
- **TemperleyLiebOperatorAlgebras** (#867): see R03 of r77 above.

**Shape.**
- All 124 numbered sections have a *Needs:* line and Checks; 4.3.1's Checks are split between two lists.
- All 11 layers end with `### Examples` and `### Dependencies`.
- There are no process words, LaTeX or `lemma`.
- No locator is marked as unverified.

**Seeded sample** (each source opened at its locator):
- **1.7:** Hirsch is uncertified. The mathematics is in the table.
- **4.4.8:** Hoste (arXiv 1907.03812v1, fetched) Theorem 1 at line 49 and §4 at line 140. The swap of `p` and `q` (his footnote at line 69), the raw polynomial `tP` and the fold `t^(1−e)P` are as stated.
- **4.7.3:** Kolay Exercise 16 p. 13 (line 564) and Claims 17–20 p. 14 (lines 574–651); Claim 17's determinant is `pq + pr + qr`.
- **4.8:** Schubert, Turaev, Armond–Lowrance, Morton and Franks–Williams were not fetched. Lickorish is not readable. The mathematics is in the table.
- **4.8.2:** cites no outside source.
- **4.10:** Kauffman–Lambropoulou was read in r77 (lines 83–109); this round I recomputed the arithmetic.
- **4.10.2:** proved here; recomputed.
- **4.12:** Garside, Epstein et al. and Elrifai–Morton are not readable. See R01.
- **5.4:** CGLS, Moser and Scharlemann 1985 were not fetched. Kronheimer–Mrowka's introduction (`km2004` lines 71–75) reduces Property P for every slope to `±1` through CGLS.
- **6.4:** `levine2016` lines 110–126.
- **7.3:** `thurston-gt3m` §6.5 at lines 3614–3624, and Lemma 6.5.4 at line 3685 (p. 136), oriented and finite volume.
- **7.4:** `gmm2009` line 52, Theorem 1.1 (`0.9427…`); `agol2013` lines 662–664, Theorems 9.1 and 9.2.
- **8.1:** Hatcher `3Mfds.pdf` (fetched; the README names this file): Theorem 1.1 at line 57, Theorem 3.8 at line 2219, Proposition 1.13 at lines 811 and 2229. The same file confirms 8.4–8.5: Proposition 1.12 at line 707; Theorem 1.9 on p. 18 (line 628); Lemmas 1.10, 1.11, 1.14, 1.16 and 1.17.
- **9.2:**
  - `li2013` line 66, Theorem 1.1.
  - `scharlemann2002`: §2.1 at line 88, §3.2 at line 325, Theorem 3.4 (Haken's lemma) at line 375, Theorem 3.7 at line 425.
  - 9.1's "Reidemeister–Singer (Scharlemann, §3)" is stated at lines 302–304 and points ahead to Theorem 7.1 (line 966).
- **11.5:** Zeeman 1964 was not fetched. The pinned statement is as described.
- **Also checked:**
  - Livingston Theorem 2.2 (`livingston2005` line 130, 6.1).
  - Thurston Corollary 6.1.7 and Theorem 6.2 (lines 3314, 3372).

**Adversarial table** (values computed this round; scripts in scratch):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.7 `g = (2−χ−b)/2`, `rank H₁` | torus; holed torus; annulus; disc | `g = 1, 1, 0, 0`; ranks `2, 2, 1, 0 = 2g+b−1`; `(rank−b+1)/2` on the torus is `3/2` | right |
| 4.4.8 Fox row and walk | every coprime odd `q < 2p`, odd `p < 40` | row `= (P, −P)`, `e` even, `P(1) = 1`, `P(−1) = p`, `P(t⁻¹) = t^(−e)P` in all cases; `K(5,7)`: signs `−,+,+,−`, `P = 3 − t − t⁻¹` | right |
| Hypothesis 4.4.8a | 14 Conway words | `3/1, 5/2→5/7, 5/1, 7/2→7/9, 9/2→9/11, 11/3, 13/5, 7/1, 11/2→11/13, 13/3, 15/4→15/19, 17/5, 19/8→19/27, 21/8→21/29`; `55 ≡ 1 (mod 18)` | right |
| 4.4.8 `D = F₃² ⋊ C₂` | `tat`, `ata`, `at`; generating pairs | `(−e₁,1)`, `(−e₁,1)`, `(e₁,0)`; translation pairs miss `C₂`, reflection with translation ≤ 6, two reflections reduce to that case; `Δ(−1)`: `7₄` −15, `6₃` 13, `7₇` 21 | right |
| 4.7.3 classification | all `(p,q,r) ∈ [−6,6]³` × 216 swap triples | 0 mismatches for the `C₂`, `V₄`, `S₃`, `S₄` conditions; (a),(b) ⇒ (c) in every case | right |
| 4.7.3 Checks | `P(3,3,3)`, `(3,3,4)`, `(3,3,5)`, `(0,0,0)` | `6+96+24 = 126`; `S₄` occurs / does not; all 216 triples close (18 `V₄`, 96 `S₄`) | right |
| 4.7.3 `L` over `ZMod 3` | dihedral reduction of (a), (b) | rows `(p+r, −p)`, `(−r, −q)`; `det = −(pq+pr+qr)` | right |
| 4.8 split correction | 2- and 3-component unlinks | `−t^½ − t^−½` (span 1), `t + 2 + t⁻¹` (span 2) | right |
| 4.8 MFW Check | `T(3,4)`, `w = 8`, `k = 3` | `v`-exponents `6, 8, 10` → bound 3; Jones `t³ + t⁵ − t⁸`, span 5 → 3.5 | wrong span (R04) |
| 4.8 *Needs:* | `u`, `br` | defined in 4.7.1 (`:4233`, `:4237–4238`); *Needs:* says 4.2–4.6 | missing (R05) |
| 4.8.2 Arf Check | `L₄`, `L₄` with one component reversed, `L₋₄`, Hopf, unlink | `V(i) = √2, −√2, √2, 0, −√2` → Arf `1, 0, 1`, undefined, `0` | right |
| 4.10 | `cf([2,0])`, `cf([0])`, `cf([0,0])`; `7/2` against `7/3`; `3/4` | `1/2, 0, ∞`; `3 ∉ {2,4}` mod 7; `3/7`, `7 ≡ 1` mod 6 | right |
| 4.10.1 products | `1·2`, `2·1`, `(1·2)·3`, `1·(2·3)` | `3`, `3/2`, `10/3`, `9/2` | right |
| 4.10.2 | `a = (1234)`, `b = (1243)`; `V₆`, `V₉`; `K(9,5)` | `w = (132)`, `aw² = w²b = (1324)`, `a²b = (14)`, `|⟨a,b⟩| = 24`; both `det(tV−Vᵀ) = −2t²+5t−2`, `V−Vᵀ = [[0,−1],[1,0]]`; signs `+,−,−,+,+,−,−,+`, `W = (ba⁻¹b⁻¹a)²` | right |
| 4.12 Garside | `Δ₃`; `σ₁`; `σ₁σ₂⁻¹` | `Δ₃¹ = Δ₃⁰·Δ₃`; `σ₁ = σ₁·1`; `Δ₃⁻¹·σ₂·(σ₂σ₁)` with `S = {2} ⊆ F = {2}` | uniqueness fails (R01) |
| 4.12.1 | `[a²,b²]` against `(ab⁻¹)³` (faithful Burau of `B₃`); `n = 4` | equal; `X₁X₂X₃ − X₁X₃X₂ − X₂X₃X₁ + X₃X₂X₁`, `2² = 4` words | right |
| 5.3 Mathieu | `9/1`, `9/2` | `|9−6| = |9−12| = 3`; `H₁ = ℤ/9` | right |
| 5.4 Moser | `T(2,3)` at 5, 7, 6; `T(1,2)` at 5 | `L(5,4)`, `L(7,2)`, `L(2,1)#L(3,1)`; `|5−2| = 3` yet `L(5,1)` | right |
| 5.4 unknot Check | `∞` with `±1`; `∞` with `1/2` | distance 1 (allowed); distance 2, filling `S³` | does not discriminate (R06) |
| 6.2 | trefoil, figure-eight `V+Vᵀ`; band surface | `det 3`, `σ = −2`; `det −5`, `σ = 0`; `Δ(−1) = 5` not a square; `r + n = p + s` from `χ = n − p` | right |
| 6.4 | Levine lines 110–126; core pattern | route as cited; `X_P = D⁴`, `Y_P = S³` | right |
| 7.2 integration | `sin(2πx)dy` on `T²`, `c = ∂[0,¼]²` | `∫_c ω = ¼` against `0` for the zero cycle | needs `dω = 0` (R02) |
| 7.2 Löh comparison | Löh 1.2, 5.1–5.9, 6.2 | numbering as cited; `M` connected; natural | right |
| 7.2 Löh route inputs | proof of Theorem 5.9 | uses Theorem 3.5 (Monod 7.4.5), Theorem 4.1, Remark 3.6, Zastrow; none listed | incomplete (R03) |
| 7.2 smearing | `½ smear(σ − σ⁻)`; genus `g` | variation `vol/2 + vol/2`; `∫ vol = v(σ)·vol(M)`; `4π(g−1)/π = 4g − 4` | right |
| 7.2 `S¹` Check | `Σ i⁻² δ_(σᵢ)` | variation `π²/6`; `Σ 1/i = ∞`; speeds `2πi` | right |
| 7.2 degree −1 | `z ↦ z̄`; Thurston §3.2 | `(0,1,∞,e^(iπ/3)) ↦ (0,1,∞,e^(−iπ/3))`; genus-two geodesic boundary, double closed | right |
| 7.2 topology | `ContMDiffMap.weakWhitneyTopology` | domain only `C^n⟮𝓘(𝕜,E),E; 𝓘(𝕜,F),F⟯` | supplier drift (R03) |
| 7.3 relative route | Thurston 6.5, Lemma 6.5.4 | norm = variation off `A`; straightening `≥ v(M[ε,∞))/v₃`; smearing `≤ v(M)/v₃`; Gieseking `1.0149`; Whitehead `3.6638` | right |
| 7.4 | Weeks `H₁`; volumes | `lk = 0` gives `ℤ/5 ⊕ ℤ/5`; `0.9427 < 1.0149 < 2.0298` | right |
| 8.1 inversion Check | `y ↦ y/|y|²` | `det |y|⁻²(I − 2ŷŷᵀ) = −|y|⁻⁶` | right |
| 8.5.2 | granny, square | same group, `|σ| = 4` against `0` | right |
| 9.2 | `L(1,q)`; `T³`; Poincaré sphere | `g = 0`; `g = 3 = rank`; `g = 2 = rank` | right |
| 11.5 | `∂Δ²`; dunce hat | vertices in 2 edges each, no free face, `H₁ = ℤ`; finite, dimension ≤ 2, contractible | right |
| `property_P`, `property_R` | unknot `1/q`; slope `p/q` | `S³_(1/q)(U) = S³` (so `hK` is needed); `H₁ = ℤ/|p|` | right |
| `cyclic_surgery_theorem` | trefoil `11/2` | `|11−12| = 1`, a lens space at distance 2 with Seifert fibred exterior (so `hSF` is needed) | right |
| Triangulation headlines | pinned definition | `T2Space` excludes non-Hausdorff compact surfaces; `n = 2, 3` true, `n ≥ 5` false | right |
| 26 headlines | `#check`; one-tactic probe | types match the README; 26 of 26 fail | right |

## Not verifiable

- **Uncertified** (cited by locator): `hirsch1976` (1.7), `haagerup-munkholm1981` (7.2), `kauffman1987`.
- **Image-only:** `kauffman1990` (4.6.1). OCR is not available on this worker.
- **Not fetched this round** (paywalled, books, or not reached):
  - Garside 1969, Epstein et al., Elrifai–Morton (4.12);
  - Schubert 1954, Turaev 1987, Armond–Lowrance 2017, Morton 1986, Franks–Williams 1987 (4.8);
  - CGLS 1987, Moser 1971, Scharlemann 1985, Kanenobu–Murakami 1986 (5.4);
  - Prasad 1973, Ratcliffe (7.2–7.3);
  - Zeeman 1964 (11.5);
  - Lickorish's *An Introduction to Knot Theory*.
- **Read into a scratch manifest only** (this review edits no manifest): `3Mfds.pdf` and Hoste arXiv 1907.03812v1.
  - The package manifest's `hatcher-3m` records `3M.pdf`, while the README cites `3Mfds.pdf` and says so (`:7867–7873`). Recording `3Mfds.pdf` is a worker-level manifest fix, not a README defect.

## Source issues

- **Misprint** in levine2016 at Proposition 1.3, proof, p. 3: the source says the slice disc for `P(−K)` contradicts Theorem 1.1; it should be Theorem 1.2, the hypothesis on `P`; affects nothing.
- **Misprint** in loeh2006 at §5.3, after Definition 5.6, p. 14: the source calls the norm-preserving inclusion a cochain map; it should be a chain map; affects nothing.
- **Misprint** in loeh2006 at §5.4, p. 15: the source invokes "Theorem (3.11)" for the duality principle; it should be Lemma (3.11), the duality principle of measure homology; affects nothing.
- **Misprint** in kolay2019 at the proof of Claim 19, p. 14: the source assumes `n` divides none of `q₂, …, q_n`; it should be `q₂, …, q_m`, `m` the number of twist regions; affects nothing.
- **Gap** in thurston-gt3m at Lemma 6.3.2, p. 129: the source says a homotopy equivalence sends positively oriented regular ideal simplices to positively oriented ones; it should assume degree one, or allow the opposite orientation in degree −1; affects a stated result.
