# Review of GeometricTopology (pull request #903 at 61401bd)

**Verdict:** needs changes

This is a full review of `61401bd`. The folder changed by 325 lines since `1806dd4`, the head the previous review (r76) read.

## Previous findings (r76)

Eight of the nine findings are repaired; R04 is partly repaired (R03 below). Two of the repairs bring in new text with new defects (R01 and R02 below).

- **R01 (PL smoothing in 6.4): repaired.**
  - 6.4 now runs the reduction on "a *disc with conical singularities*" (`README.md:6432–6442`), with the route "from its third sentence on". This matches `levine2016` lines 113–126.
  - The PL form is conditional: "Assuming the input, the reduction gives Levine's Proposition 1.3 as he states it" (`:6464–6478`).
  - The smoothing half goes to Part II (`:191–193`).
  - The combinatorial half is right:
    - an interior edge of a 2-subcomplex of a combinatorial 4-manifold has link pair `(S², S⁰)`;
    - a triangle has `(S¹, ∅)`;
    - a vertex has `(S³, K_v)`.
- **R02 (Mostow inputs): repaired as asked, but see R01 and R02 below.**
  - 7.2 now lists four inputs with locators (`:6602–6631`).
  - *Needs:* names Haar measure and the pinned simplicial volume.
- **R03 (8.5.2 unconditional): repaired.**
  - 8.5.2 opens "Assuming the relative JSJ theorem of 8.5.1 and the cyclic surgery theorem of 5.4" (`:7179–7183`).
  - Gordon–Luecke is also assumed for the knot-equivalence clause (`:7222–7224`).
  - The Scope (`:97–99`) agrees.
- **R04 (two owners of the `δ = √2` Clifford model): partly repaired.**
  - The Scope (`:56–63`) and *Downstream consumers* (`:7750–7754`) now state the split.
  - The other owner and the pull-request description are unchanged (R03 below).
- **R05 (Seifert notation): repaired.**
  - `e` is the Euler obstruction, and Hatcher's `b` is defined as the boundary count (`:7080–7086`).
  - "for `α, β ≠ 0`" is added (`:7098`).
  - This matches `hatcher-3m` (3Mfds) lines 1147–1149 and 1265.
- **R06 (page of Theorem 1.9): repaired.** `:7155` reads "p. 18", and Theorem 1.9 is on printed page 18 at `hatcher-3m` (3Mfds) lines 608 and 628.
- **R07 (three wrong Tau Ceti names): repaired.**
  - The README cites `PreAbstractSimplicialComplex.IsCombinatorialManifold`, `FundamentalGroup.homeomorphMulEquivOfEq` and `HomotopyGroup.homeomorphMulEquivOfEq` (`:270`, `:553–557`, `:2133`).
  - All three exist at the pin (`AlgebraicTopology/FundamentalGroup/Homeomorph.lean:55`, `Topology/Homotopy/HomotopyGroup/Homeomorph.lean:95`).
  - No old form remains.
- **R08 (false conjugation Check): repaired.**
  - The square-lattice Check now says conjugation fixes the orbit (`:6783–6786`).
  - A new Check uses `τ = 1/3 + 2i` (`:6787–6793`), which I recomputed (table).
- **R09 (headline bookkeeping): repaired.**
  - `Suggested.lean:55–60` names Levine's satellite theorem and the mutation statement as not statable, each with its missing carrier. The pin has no satellite or mutation construction; `satellite` occurs only in docstrings.
  - The Kirby entry lists Problem 1.45 (`:7774`).
  - The homology-concordance form of Levine's theorem is now stated as `levine_homology_concordance_theorem` against the pinned `TauCeti.LevineHomologyConcordanceTheorem`.

## R01 (P2) — 7.2's proportionality input uses the pinned singular `ℓ¹` simplicial volume, but its source and its smearing step concern Thurston's measure-chain norm

**Location.** `README.md:6608–6614`:

> `vol(M) = v_n ‖M‖`, where `‖M‖` is the pinned simplicial volume `TauCeti.HomologicalOrientation.simplicialVolume` … (Thurston, Proposition 6.1.4 and Theorem 6.2): … smearing a large straight simplex over `Isom(ℍⁿ)` with its Haar measure gives the reverse inequality.

The same smearing appears in the regular-simplex step (`:6623–6625`, "by smearing"). 7.3 reuses it for the cusped case (`:6681–6684`, "Haar smearing").

**Claim.** Straightening and Haar smearing prove `vol(M) = v_n ‖M‖` for the singular `ℓ¹` seminorm, as stated in Thurston's Theorem 6.2.

**Witness.**
- `thurston-gt3m` lines 3339–3345: Thurston does not prove the equality for the singular norm (his Definition 6.1.2) and drops that definition.
- Lines 3346–3374: Theorem 6.2 is proved for Definition 6.1.8, whose chains are compactly supported Borel measures on `C¹(Δᵏ, M)`.
- Line 3390: `smear_M(σ)` is such a measure, not a finite singular chain.
- The pin defines `simplicialVolume` as the infimum over finite real singular cycles. Its docstring says the proportionality "is not proved here" and cites Benedetti–Petronio, Chapter C (`AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.lean:16–18, 38–39, 57`).
- No target, supplier or *Needs:* entry compares the two norms.

**Repair.** Do one of the following.
- **(a) Compare the two norms.** Add a target to 7.2 with hypotheses and a locator: for a closed manifold, Thurston's measure chains compute real singular homology, and the measure seminorm of the fundamental class equals `SSet.homologyL1Seminorm` (Löh, *Measure homology and singular homology are isometrically isomorphic*, Math. Z. 253 (2006)). Add the measure-chain carriers to *Needs:*.
- **(b) Stay with singular chains.** Replace "smearing … gives the reverse inequality" by a discretized smearing that produces finite real singular cycles. Cite a source that proves the singular form (the pin's own reference, Benedetti–Petronio, Chapter C), and run the regular-simplex step on the same cycles.

Either way, the cusped route of 7.3 (`:6681–6684`) uses the same step, and its locator must change with it.

Test case: Thurston's cycle `½ smear_M(σ − σ⁻)` (lines 3393–3397) has total variation `v(M)`.
- Under (a), it bounds `SSet.homologyL1Seminorm` only through the comparison.
- Under (b), it is replaced by a finite singular cycle of norm at most `v(M)/v(σ) + ε`.

## R02 (P2) — 7.2's regular-simplex input sends positively oriented simplices to positively oriented ones for every homotopy equivalence; this is false in degree `−1`

**Location.** `README.md:6622–6624`:

> For `n ≥ 3`, `∂f̃` carries the vertices of every positively oriented regular ideal `n`-simplex to the vertices of a positively oriented regular ideal `n`-simplex (Thurston, Lemma 6.3.2 …).

Here `f` is the arbitrary homotopy equivalence of `:6602–6603`, with no degree condition.

**Claim.** The orientation of a regular ideal simplex is preserved.

**Witness.**
- Let `M` be the double of a compact hyperbolic `3`-manifold with totally geodesic boundary. The reflection exchanging the two halves is an isometry of degree `−1`.
- Its lift is a reflection of `ℍ³`, anti-Möbius on `S²`. Conjugated to `z ↦ z̄`, it fixes `0, 1, ∞` and sends `e^(iπ/3)` to `e^(−iπ/3)`.
- So it maps a positively oriented regular simplex to a negatively oriented one: these are the two orientations the README itself computes at `:6651–6652`.
- `thurston-gt3m` line 3463 (Lemma 6.3.2) carries the same tacit degree-one assumption.

**Repair.** Make the orientation depend on the degree, and add a Check.
- State the conclusion as "to a regular ideal simplex of the same orientation when `deg f = 1`, and of the opposite orientation when `deg f = −1`".
- In the Möbius conclusion, add "the isometry is orientation-reversing when `deg f = −1`". Alternatively, first compose `f̃` with a reflection of `ℍⁿ`.
- Add the reflection of a double as a Check: on `(0, 1, ∞, e^(iπ/3))`, the corrected statement gives `(0, 1, ∞, e^(−iπ/3))`, as computed.

## R03 (P2) — The finite even-Clifford model at `δ = √2` still has two owners; the other pull request keeps it as its own target, and this pull request states no order

Partly repaired r76 R04.

**Location.**
- `README.md:56–63`: "TemperleyLiebOperatorAlgebras §1.7 consumes this finite model".
- `:7750–7752`: "consumes Layer 4.5.3's finite algebraic Clifford map, scalar trace, radical quotient, coordinate inclusions and braid phases".

**Claim.** TemperleyLiebOperatorAlgebras takes `Cl_m⁰`, `s_m`, `F_m`, the radical quotient, the coordinate inclusions and the braid phases from 4.5.3.

**Witness.** TemperleyLiebOperatorAlgebras at the head of #867 (`7cf3fee`):
- `README.md:853–855` says "The finite algebraic model, its scalar trace, its radical quotient, its coordinate inclusions and its braid phases are targets of this section".
- Its supplier section (`:365–367`) cites GeometricTopology only for Layer 4's closure normalisation.
- Its `Suggested.lean:118–157` declares `cliffordForm`, `EvenClifford`, `majorana`, `cliffordScalarCoefficient` and `exists_evenCliffordModel`.
- This pull request's description does not mention #867.

**Repair.** No further README change is needed. In the pull-request description, state:
- that #903 merges before #867;
- that #867's §1.7 then cites GeometricTopology 4.5.3 for `F_m`, `s_m`, the radical quotient, the coordinate inclusions and the braid phases;
- that #867 keeps only the analytic adjoint, the `Q_n` comparison, the blocks and the tower.

#867 is the later owner in the merge order (`ORDER.txt` line 242), and the 4.5.3 model exists only in this revision.

## R04 (P3) — 4.7.2 and 4.7.5 have no `*Needs:*` line

**Location.**
- `README.md:4268–4298` (4.7.2) runs from its heading to the Check "*Generation is the hypothesis.*" and straight into `### 4.7.3` at `:4299`.
- `:4399–4418` (4.7.5) runs into `### 4.7.6` at `:4419`.

**Claim.** Every target lists what its statement and route need.

**Witness.**
- The other 122 numbered sections each have a `*Needs:*` line.
- These two use Layer 4.2's braid action, 4.4's Wirtinger presentation, 4.7.1's overpass and Smith comparisons, and 4.4.6's `5₂` model, without listing them.

**Repair.** Add the two lines.
- **4.7.2:** Layers 4.2, 4.4 and 4.7.1; Mathlib `Quandle.Conj`, `Subgroup.closure` and `SimpleGraph.Connected.card_vert_le_card_edgeSet_add_one` (`Combinatorics/SimpleGraph/Acyclic.lean:469`); Tau Ceti `TauCeti/GroupTheory/Perm/SwapFactors.lean`.
- **4.7.5:** 4.4.6's `5₂` PD model, 4.2's PD/arc comparison, and 4.7.1's Smith adapter.

## R05 (P3) — 4.2.10's two braid Checks use different indexings, and the second is false under the native one

**Location.** `README.md:2284–2287`:
- "the closure of `σ_0³` … covering degree 2";
- "The closure of `(σ₁σ₂⁻¹)²` … returns it with covering degree `3`".

**Claim.** Both Checks are about native `TauCeti.BraidWord` letters.

**Witness.**
- Native letters are pairs `(i, ±1)` with `i : Fin n` on `n + 1` strands (`KnotTheory/BraidWord/Jones.lean:91`), so `σ_0` is zero-based.
- Read the same way, `(σ₁σ₂⁻¹)²` needs four strands. Its permutation is `(2 4 3)` with strand 1 fixed, so the closure has two components, of covering degrees 3 and 1.
- 4.2.3 declares its convention (`:1760`, "Displayed σ indices are one-based"); 4.2.10 does not.

**Repair.** Write `(σ₀σ₁⁻¹)²` on three strands, or add "one-based" to that Check. Its permutation is then a three-cycle, giving degree 3 as stated.

## R06 (P3) — Two of 4.7.7's Checks state more than they compute

**Location.**
- `README.md:4511–4512`: "so its ZMod n colouring module is Ann(3) × Ann(9), not Ann(27)".
- `:4515–4516`: "A unit Alexander polynomial does not make `P(−3, 5, 7)` the unknot (by evaluation)".

**Claim.** Each statement follows by evaluation from the section's formulas.

**Witness.**
- The section defines the colouring module as `R × ker(G_R)` and counts `n·gcd(n,g)·gcd(n,|B|/g)` colourings (`:4486–4497`). For `P(3,3,3)` and `n = 9` that count is `9·3·9 = 243`, while `Ann(3) × Ann(9) ⊂ (ZMod 9)²` has 27 elements.
- Nothing in the section, or elsewhere in the README, proves `P(−3, 5, 7)` nontrivial. Its determinant is 1 and its Fox colourings are constant, so no computed invariant here separates it from the unknot.

**Repair.**
- Write "its based module `ker G` is `Ann(3) × Ann(9)`, and with the constants `ZMod n × Ann(3) × Ann(9)`".
- For `P(−3, 5, 7)`, either name the certificate of nontriviality and its owner (a target or a supplier), or drop the sentence and keep the computed values.

## R07 (P3) — 4.11.3's bound `2g(K) ≤ c(K) − 1` fails for the unknot over `ℤ`

**Location.** `README.md:5439–5440`: "Seifert genus 2g_D = n − s + 1 ≤ n − 1, so 2g(K) ≤ c(K) − 1".

**Claim.** The bound holds for every knot.

**Witness.**
- The derivation needs a diagram with at least one crossing.
- For the unknot `c = g = 0`, which gives `0 ≤ −1` over `ℤ`. It holds only through the junk value of natural-number subtraction.

**Repair.** Write "for nontrivial `K`, `2g(K) + 1 ≤ c(K)`" (the trefoil gives `3 ≤ 3`), and note that the unknot is excluded.

## Verified sound

**Gate, dependency check and build** (my runs on `61401bd`):
- Gate: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- Dependency check: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are on main and unchanged.

**Lean.**
- I put `#check @` for all 26 theorems in one scratch copy. `lake env lean` exits 0 with exactly 26 `declaration uses sorry` warnings and no error.
- The types equal r76's except for the new `levine_homology_concordance_theorem : TauCeti.LevineHomologyConcordanceTheorem`.
- There are no section `variable`s.
- The worker's `signatures.md` counts 27 declarations only because docstring line 42 begins with the word "theorem,".
- Padding probe: each `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | assumption` gives 26 errors out of 26.
- The new headline restates no README Check and is the pinned Kirby 1.31 proposition, so it is not padding.

**Headline theorems.**
- The README's end theorems (`:14–25`) are all in `Suggested.lean`:
  - the Smale conjecture and Watanabe's theorem;
  - the annulus theorem;
  - Freedman's theorem and Levine's homology-concordance theorem;
  - Mostow rigidity;
  - virtual fibering and virtual Haken;
  - the JSJ theorem, geometrization and the Poincaré conjecture;
  - Li's theorem and Gabai–Meyerhoff–Milley;
  - Property P and Manolescu's theorem;
  - Alexander's theorem, the knot-group theorem and Gordon–Luecke.
- So are the extra statements the summary promises: Property R, the cyclic surgery theorem, Kneser, Milnor, Radó, Moise, the sphere theorem and Waldhausen.
- The non-statable ones are named with their missing carriers: Levine's satellite theorem, the mutation statement, Kondo, Novikov–Rosenberg, and Zeeman (open).

**Pinned declarations opened** (Tau Ceti `2fd255d9`):

| Declaration | File and line |
| --- | --- |
| `LevineHomologyConcordanceTheorem` | `KnotTheory/HomologyConcordance.lean:74`: `X` compact contractible on `(𝓡 3).prod (𝓡∂ 1)`, `κ` onto the boundary, `∀ K' ⊂ S³, ¬ HomologyConcordant ℤ` |
| `not_forall_not_homologyConcordant_sphere` | same file, `:105` |
| `SmoothEmbedding.HomologyConcordant` | `Geometry/Manifold/SmoothEmbedding/HomologyConcordance.lean:111`: compact Hausdorff `W`, properly embedded cylinder |
| `IsHomologyCobordism` | `Geometry/Manifold/HomologyCobordism.lean:81` |
| `HomologicalOrientation.simplicialVolume` | `AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.lean:84` |
| `simplicialVolume_eq_zero_of_one_lt_abs`, `simplicialVolume_eq_of_homotopyEquiv` | same file, `:139`, `:150` |
| `SSet.homologyL1Seminorm` | `SimplicialSet/Homology/L1Norm.lean:153`, in `namespace SSet` |
| `Diffeomorph.ofSmoothFamily` | `Geometry/Diffeomorphism/Topology.lean:133` |
| `Diffeomorph.t2Space_weakWhitney` | same file, `:115` |
| `orthogonalToDiffSphere_injective`, `continuous_orthogonalToDiffSphere`, `continuousOrthogonalToDiffSphere` | `Diffeomorphism/Sphere.lean:300, 308, 315` |
| `BraidWord` letters `(i, ±1)`, `toBraid_append` | `KnotTheory/BraidWord/Jones.lean:91`; `ArtinEquivalence.lean:137` |

Mathlib names opened:
- `Continuous.isClosedEmbedding` (`Topology/Separation/Hausdorff.lean:685`);
- `Complex.areaForm` (`Analysis/InnerProductSpace/TwoDim.lean:510`, `= (conj w * z).im`);
- `SimpleGraph.Connected.card_vert_le_card_edgeSet_add_one` (`Acyclic.lean:469`);
- `Quandle.Conj` (`Algebra/Quandle.lean:384`).

**Cross-roadmap citations and ownership.**
- `roadmaps resolve` on the README reports no citation and no Lean name found nowhere.
- TemperleyLiebOperatorAlgebras at #867 was opened for R03.
- KleinianGroups (#432, `README.md:49–51`) excludes Mostow rigidity, so 7.2 has no second owner.
- `roadmaps grep` finds no other owner of simplicial-volume proportionality, discs with conical singularities, or homology concordance.

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The three anchors that other roadmaps cite are mapped at `README.md:731–740`.
- The conflicts with #1517, #1791 and #1797 were settled in earlier rounds and are not re-raised.

**Shape.**
- All 11 layers end with `### Examples` and `### Dependencies`.
- All 124 numbered sections have at least three Check bullets. In 4.3.1 they are split between two Check lists.
- There are no process words, `lemma` or `set_option`.
- The only missing `*Needs:*` lines are those of R04.

**Seeded sample** (each source opened at its locator):
- **3.2:**
  - Hirsch is uncertified.
  - The pinned names are as in the table.
- **4.2.5:**
  - Dowker–Thistlethwaite is paywalled.
  - All four computational Checks were recomputed (table).
- **4.2.10:**
  - `lambropoulou2018` lines 72–100: §3, sliding triangles.
  - Morton is not readable.
- **4.5.2:** `jones1985` line 122: Theorem 5, "b₊ − 3b₋ − n + 1 positive", on printed p. 105.
- **4.5.4:** Kauffman 1987 is uncertified. The mathematics is in the table.
- **4.6:** Lickorish is not readable. The skein and trace values were recomputed.
- **4.6.2:** no outside locator. The signature and `ρ_K` specializations were recomputed.
- **4.7.7:** `bfkp2012` lines 669–674 and 762–774: the pretzel matrix `½[[p+q, q+1], [q−1, q+r]]`, which is the README's push-first `W`, with `V = Wᵀ` native, as stated.
- **4.10.1:** `kauffman-lambropoulou2003` lines 83–109: Theorems 2 and 3, with `q, q′` odd in the oriented case, as stated in 4.10.
- **4.11.3:** Teragaito is paywalled. The family rows were recomputed.
- **5.4.1:**
  - `taylor2008` lines 1123–1130: Theorem 5.12, with the README's hypotheses and conclusion.
  - Lines 1139–1140: distance `d = 2n` for a generalized crossing change.
  - 5.4.1's spanning-disc dichotomy supplies the Seifert-surface hypothesis that Taylor's Corollary 5.13 leaves implicit.
- **6.1:** `livingston2005` line 130: Theorem 2.2, p. 4.
- **6.4:**
  - `levine2016` lines 31–33 (Theorem 1.1), 89–91 (Theorem 1.2), 110–126 (Proposition 1.3 and its proof, second and third sentences as cited), 129–134 (Remark 1.4) and 135–143 (Remark 1.5, Problem 1.31).
- **7.3:** `thurston-gt3m` lines 83–92 (Chapter 5 §§5.10–5.11, Chapter 6 §6.5 at line 3614). The route inherits R01.
- **8.5:** `hatcher-3m` (3Mfds):
  - Theorem 1.9 at line 628 (p. 18);
  - Lemma 1.11 at line 681;
  - Propositions 1.12–1.14 at lines 707, 811 and 837;
  - Lemmas 1.16–1.18 at lines 884, 915 and 928;
  - §2.1 notation at lines 1147–1149 (p. 33);
  - Theorem 2.3 at lines 1260–1266 (p. 37).
- **7.2:** `thurston-gt3m` Lemma 5.9.1 at line 2772, Proposition 5.9.2 at 2788, Corollaries 5.9.3 and 5.9.5 at 2805 and 2859, Proposition 6.1.4 at 3269, Lemma 6.3.1 at 3457, Lemma 6.3.2 at 3463, the density at 3477–3479, and the all-dimensions remark at 3453–3456. These are all as cited, apart from R01 and R02.

**Adversarial table** (values computed this round; scripts in scratch):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 3.2 inverse not continuous | `F_k = exp(i sin(kθ)/k) z` | rotation angle `≤ 1/k → 0` uniformly; `∂_θF_k(0,z) = i cos 0 · z = iz` for every `k` | right |
| 3.2 non-smooth family | `e^(i|t|) z` | one-sided `t`-derivatives `±iz` at `0`; `ofSmoothFamily` is injective, so it is not in the image | right |
| 4.2.5 parity Check | `(4,10,8,2,6)`, 32 rotation vectors | 16 with 3 faces, 16 with 5, none with `n + 2 = 7` | right |
| 4.2.5 seven-crossing word | `(8,10,12,2,14,6,4)`, 128 vectors | planar only all-same (face degrees `2,2,2,2,3,3,4,4,6`); Fox matrix gives `4 − 7t + 4t²`, `Δ(1) = 1`, `det = 15` | right |
| 4.2.5 outer faces | `(10,12,2,14,6,4,8)` | planar exactly `±(+,−,+,−,+,−,−)`; face degrees `2,2,3,3,3,3,3,4,5` | right |
| 4.2.5 sign adapter, change sets | `a` west→east over, `b` south→north; trefoil over bits `(T,T,F)` | `b` crosses right to left, sign `+1`; `|S_true| = 1`, `|S_false| = 2` | right |
| 4.2.10 apex | `c = −a − b` | `im(conj a·c) = im(conj c·b) = −im(conj a·b)`; barycentre `0` | right |
| 4.2.10 braid Checks | `σ_0³`; `(σ₁σ₂⁻¹)²` one- and zero-based | degree 2; one-based 3-cycle gives degree 3; zero-based `(2 4 3)` plus a fixed strand gives degrees 3 and 1 | indexing (R05) |
| 4.5.2 support bound | Hopf `σ₁²`; trefoil `σ₁³`; empty word; general state | `{1,5} ⊂ [1,7]`; `{2,6,8} ⊂ [2,10]`; `[−(n−1), n−1]` attained; with `A = u^(−1/2)` the exponents are `p−q+r₊−r₋ ± (c−1)` | right |
| 4.5.4 bracket algebra | `r₊r₋`; curls; trefoil `h`; `(1,0,1)`; `ZMod 2` | `abI + (a²+b²+abc)E`; `ac+b = −a³`, `bc+a = −a⁻³`; `h` gives `−A⁵ − A⁻³ + A⁻⁷`, mirror `h(0,3) = h(3,2) = 1`, `h(1,2) = h(2,1) = 3`; `S = 1` but `r₊r₋ = E`; `c = 0`, `Z = 0`, `S = 1` | right |
| 4.6 HOMFLY | trefoil; Hopf at `(1,−1,w)`; `N = 2`, `q = 2` | Hopf `vz + (v−v³)/z`, trefoil `2v² − v⁴ + v²z²`, at `v = 1` this is `t − 1 + t⁻¹`; `P_H = −w`; `tr = q³ + q = 10`, `[2] = 5/2`, `¼·10/(5/2) = 1` | right |
| 4.6.2 `K` | word `[1,1,1,−2,−1,−1,3,−2,3]` | permutation `(1 2 4 3)`, so a knot; bands 5/2/2 and loops 4/1/1; self-pairings `−1,−1,0,1,1,−1`; tree with matching `a₁a₂, a₃a₄, bc`, `det = 1`; signature `−2`, nullity `0` for all 32 signs; `ρ_K(i, iz) = 1 − 2z² − z⁴`; at `(it⁻¹, i(t^(−1/2) − t^(1/2)))`, `V = t³ − t² + t − 1 + t⁻¹ − t⁻² + t⁻³`, `V(−1) = −7` | right |
| 4.7.7 pretzels | symbolic `p, q, r`; `(−3,5,7)`; `(3,5,−7)`; `(3,3,3)` | `det(W − tWᵀ) = A(1−t)² + t`; `Fitt₁ = (t+1, p, q, r)`; `B ≡ 3 mod 4` for every odd residue class; `B = −1`; `B = −41`, `Δ = −10t + 21 − 10t⁻¹`, `Δ(−1) = 41`; Smith `(3,9)`, 243 colourings mod 9 against 27 in the Check | Check wording (R06) |
| 4.10, 4.10.1 | `cf([2,0])`, `cf([0])`, `cf([0,0])`; products; Schubert | `1/2, 0, ∞`; `3, 3/2, 10/3, 9/2`; `7/(−2) = 7/5 ≅ 7/3` with `3 ∉ {2, 4}` mod 7; `3/4 → 3/7`, `7 ≡ 1` mod 6 | right |
| 4.11.3 families | `A_r, B_r, C_r, E_r`; unknot | `b`: `2`, `4r − (2r−1)`, `4r − (r−1)`, `2(r+1)`; witnesses `r = F(·)+1` all exceed; `2g ≤ c − 1` gives `0 ≤ −1` over `ℤ` | junk value (R07) |
| 5.4 Moser | `T(2,3)` at `p/q = 5, 7, 6`; `T(1,2)` | `L(5,9) = L(5,4)`, `L(7,9) = L(7,2)`, `L(2,1) # L(3,1)`; `|5 − 2| = 3` yet `L(5,1)` | right |
| 5.4.1 replacement | `n = 1`; tubed disc | `i(m_U, m_K) = |k|·2² = 4n`, so `d = 2n` against slope distance `n`; `χ = 1 − 2 + 0 = −1`, `b = 1`, `g = 1` | right |
| 6.1 | trefoil and mirror; square knot | `σ = −2` against `+2`; `Δ = (t − 1 + t⁻¹)² ≠ 1` but slice | right |
| 6.4 reduction | core pattern; trefoil cone; capping | `X_P = D⁴`, `Y_P = S³` by `(0,0)` Hopf surgery; `d(tx)/dt = x ⊥ T_x S³`, trefoil group non-abelian; `H_*(W ∪_(S³) D⁴) ≅ H_*(D⁴)` by Mayer–Vietoris | right |
| `levine_homology_concordance_theorem` | pinned definition; `Y = S³` | docstring matches `:74–84`; `not_forall_not_homologyConcordant_sphere` forces `Y ≠ S³` | right |
| 7.2 proportionality | Thurston's Theorem 6.2; the pinned norm | measure-chain norm (lines 3369–3374) against finite singular chains (pin `SimplicialVolume.lean:16–18`); genus two: `4π/π = 4 = 2|χ|` | gap (R01) |
| 7.2 regular simplices | reflection of a double; `z ↦ z̄` | degree `−1`; `(0,1,∞,e^(iπ/3)) ↦ (0,1,∞,e^(−iπ/3))` | missing hypothesis (R02) |
| 7.3 | figure-eight; cusp end; Whitehead link | `2v₃ = 2.02988`; `∫_h^∞ A_E/y³ dy = A/2`; `3.66386` | right (route inherits R01) |
| 7.3.1 conjugation | `τ = 1/3 + 2i`; `(1, i)` | `|Re| = 1/3 < 1/2`, `|τ|² = 37/9 > 1`, so `−τ̄ ≁ τ`; `1/(−i) = i` | right |
| 8.4, 8.5 | Hatcher 3Mfds; Anosov bundle; `T³` | pages 18, 33, 37 as cited; JSJ torus is the fibre; the empty family is a proper subfamily | right |
| 8.5.2 | granny and square knots | same group; `|σ| = 4` against `0` | right, now conditional |
| `property_P`, `property_R` | unknot; slopes `p/q` | `S³_(1/q)(U) = S³`, so `hK` is needed; `H₁ = ℤ/|p|`, so only slope `0` can give `S¹ × S²` | right |
| `cyclic_surgery_theorem` | trefoil `11/2`; wild neighbourhood of the unknot | `|11 − 12| = 1`, lens space at distance 2, exterior Seifert fibred, so `hSF` is needed; shrinking to the concentric tame torus `Φ(∂V₀(1−ε))` shows the `5/2` filling is `L(5,2)` | right |
| 26 headlines | `#check`; one-tactic probe | types as in the README; 26 of 26 fail the probe | right |

## Not verifiable

- **Uncertified or unreadable sources:**
  - `hirsch1976`, `kauffman1987` and `haagerup-munkholm1981` are uncertified (3.2, 4.5.4, 7.2).
  - `kauffman1990` is image-only.
- **Paywalled or with no legal copy found** (sources service):
  - Teragaito, Bull. Austral. Math. Soc. (doi 10.1017/S0004972718000539): the 8₅ relators of 4.11.3's Check are unchecked.
  - Morton 1986 (4.2.10).
  - Dowker–Thistlethwaite 1983 (4.2.5), uncertified.
- **Not fetched:** Lickorish's *An Introduction to Knot Theory* (4.5, 4.6) and Ratcliffe (7.2, 7.3).
- **Texts read but not in the package manifest**, because this review edits none:
  - `jones1985`, `taylor2008`, `lambropoulou2018`, `kauffman-lambropoulou2003`, `bfkp2012`;
  - Hatcher's `3Mfds.pdf`.
- The manifest's `hatcher-3m` records `3M.pdf`, whose numbering differs from the `3Mfds.pdf` numbering the README cites. In `3M.pdf`, Proposition 1.12 is the irreducibility statement. This is a worker-level manifest fix, not a README defect.

## Source issues

- **Misprint** in levine2016 at Proposition 1.3, proof, p. 3: the source says the slice disc for `P(−K)` contradicts the conclusion of Theorem 1.1; it should be Theorem 1.2, the hypothesis on `P`; affects nothing.
- **Gap** in thurston-gt3m at Lemma 6.3.2, p. 129: the source says a homotopy equivalence sends positively oriented regular ideal simplices to positively oriented ones; it should assume degree one, or allow the opposite orientation in degree `−1`; affects a stated result.
- **Gap** in thurston-gt3m at Lemma 6.4.2, p. 131: the source's proof ends with an unresolved cross-reference ("???"); it should cite the dihedral-angle estimate for near-maximal ideal simplices; affects the proof.
