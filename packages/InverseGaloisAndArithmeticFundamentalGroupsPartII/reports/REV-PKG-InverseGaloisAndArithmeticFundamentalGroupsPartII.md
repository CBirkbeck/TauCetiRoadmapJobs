<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2423#issuecomment-6671744941 -->
Review (claude) of 1993dd4

Verdict: needs_changes

1. **F01** (P1) ArithmeticStatisticsPartVIII §5.16 already plans the same theorems, earlier in the merge order

   **Location.** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` lines 1419–1423
   (`## Downstream consumers`: "ArithmeticStatisticsPartVIII §5.19 is conditional on the uniform Betti
   hypothesis (HS) … §5.3 proves that hypothesis"), lines 35–85 (`## Scope and ownership`, which does
   not mention ArithmeticStatisticsPartVIII), and line 298 (gap `dga-graded-tor-spectral-sequences`).

   **Claim.** The README presents this roadmap as the owner of EVW homological stability, the uniform
   Betti bound and the uniform étale Betti bound, and presents ArithmeticStatisticsPartVIII §5.19 as a
   consumer that merely assumes the étale bound. The package report repeats this ("§5.19 assumes the
   uniform Betti hypothesis (HS) that §5.3 proves").

   **Witness.** ArithmeticStatisticsPartVIII at the head of its open pull request (merge order line
   160; this roadmap is at line 308) has a section `### 5.16 Homological stability of Hurwitz spaces,
   uniform Betti numbers and the uniform trace estimate` with the subtargets *Nonsplitting pairs and
   the component ring*, *Stability of the component ring* (EVW Lemma 3.5, with `U_D = Σ r_g^{Dd}`),
   *Tor spectral sequences over graded algebras*, *The K-complex and its homology bound* (EVW
   Theorem 4.2), *The arc spectral sequence* (the coset model `B_n/L_q` with faces
   `b s_{q,i} L_{q−1}`), *Homological stability for Hurwitz spaces* (EVW Theorem 6.1, constants
   independent of `k`), *Stability for unmarked connected Hurwitz spaces* (Corollary 6.2),
   *Finite cell models and the fixed-degree Betti bound* (one cell per subset of the simple
   reflections, `2^{n−1}` cells), *Uniform field Betti bound* (`C₀ = (2|G|)^{A+B+a+1}`, `dim ≤
   C₀^{p+1}`) and *Uniform Betti numbers of Hurwitz schemes* (EVW Proposition 7.8). Its scope section
   says: "The stability theorem and the uniform Betti bounds below are owned by this part", and
   "InverseGaloisAndArithmeticFundamentalGroupsPartII, later in the build, develops Hurwitz
   homological stability for general nonsplitting pairs with its own constants and estimates; nothing
   is imported from it here, and §5.16 states the stability theorem and the uniform Betti bound that
   §5.19 consumes." Its §5.19 cites its own target *uniform betti numbers of hurwitz schemes*, not a
   hypothesis. So the same objects (component ring stability, graded `Tor` spectral sequences, the
   K-complex bound, the arc spectral sequence, Theorem 6.1, Corollary 6.2, the cell model, both
   uniform Betti bounds) are built by two roadmaps, and the earlier one declines to import from this
   one. The gap `dga-graded-tor-spectral-sequences` (README line 298) asks DGAInfinity for the
   composite-functor and hyperhomology spectral sequences that ArithmeticStatisticsPartVIII §5.16
   *Tor spectral sequences over graded algebras* plans at its head (it says explicitly that
   DGAInfinity states no spectral sequence and that it owns them).

   **Repair.** Ownership is a decision for the board, not for a fix round: a human must decide
   whether ArithmeticStatisticsPartVIII §5.16 or this roadmap owns EVW §§3–7. Whichever way it goes,
   the package needs these edits:

   1. `## Scope and ownership` names ArithmeticStatisticsPartVIII §5.16 and states the relation in one
      clause, and `## Downstream consumers` stops claiming that §5.19 assumes (HS): at its head §5.19
      consumes §5.16's own target.
   2. If this roadmap is to be the owner (the natural reading: it is the parent's Part II, its design
      was accepted with this scope, and it proves the unmarked statement for every finite `G` and the
      full-monodromy statement with a uniform `D`, both beyond §5.16), it must be able to sit before
      ArithmeticStatisticsPartVIII in the merge order so that §5.16 can import it. Its only supplier
      later than line 160 is MordellLawrenceVenkatesh (line 176), cited in §§2.1, 2.2, 2.5 for
      surfaces with punctures, cutting, `Mod(S)` and the evaluation fibration. Those four facts about
      a disc are restated as targets here (or re-sourced to GeometricTopology Layers 1 and 3, which
      already own collars, cutting data and `Diff(D, ∂D)`), the MordellLawrenceVenkatesh citations are
      removed, and the depcheck is rerun with `--movable`; the board then announces to
      ArithmeticStatisticsPartVIII that §5.16 is to import by name. The gap
      `dga-graded-tor-spectral-sequences` stays as declared (DGAInfinity is the right owner of generic
      graded `Tor`), but the README says in the DGAInfinity subsection that §5.16's *Tor spectral
      sequences over graded algebras* is the same request.
   3. If ArithmeticStatisticsPartVIII keeps ownership, this package re-plans an open roadmap's
      section and should be rejected rather than repaired: Layers 0–5 would reduce to citations of
      §5.16 and only the general-`G` unmarked statement and the uniform-`D` full-monodromy statement
      would remain.

   Tested on the instance that refuted the original: `tauceti-roadmap roadmaps show
   ArithmeticStatisticsPartVIII` at head e4005e8, lines 22, 28, 30 (scope), 846–1000 (§5.16) and the
   §5.19 proof, which cites "[uniform betti numbers of hurwitz schemes]" as its own target.

2. **F02** (P3) Backticked parent names that the parent does not declare

   **Location.** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` line 185
   ("§IG.3.2, *The Hurwitz braid action* (`HurwitzAction.action`)") and line 188 ("*The braid-orbit
   monoid* (`BraidOrbitMonoid`)").

   **Claim.** The parent roadmap declares `HurwitzAction.action` and `BraidOrbitMonoid`.

   **Witness.** InverseGaloisAndArithmeticFundamentalGroups at the head of its open pull request
   (a5186ac): its README §IG.3.2 defines "the `i`-th Hurwitz move … and the Hurwitz action as a
   homomorphism `TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G)`" and "the braid-orbit monoid
   of `(G, c)`" without Lean names, and its `Suggested.lean` declares `BranchTuple`, `product`,
   `generated`, `HurwitzEquivalent` and `LiftingInvariant.tuple` but no `HurwitzAction.action` and no
   `BraidOrbitMonoid`. `roadmaps grep --fixed 'HurwitzAction.action'` and `--fixed 'BraidOrbitMonoid'`
   match nothing on main or in any open pull request.

   **Repair.** Delete the two parenthesised backticked names and cite the targets by title only:
   "§IG.3.2, *The Hurwitz braid action*: the left action of `B_r` on `G^r` …" and "§IG.3.2, *The
   braid-orbit monoid*: `c`-valued tuples …". Tested: both titles occur verbatim in the parent README
   (lines 2722 and 2752 of the head text).

Previous review: none. Two findings, one blocking. The package is mathematically sound on every
sampled target and the Lean file elaborates with only the two expected `sorry` warnings; the
blocking finding is an ownership conflict with an open roadmap earlier in the merge order, which
the package report describes incorrectly.

## Verified sound

**Principles.** No route-specific shortcut: the statements are for every finite group, every
nonsplitting class and every permitted field, with constants independent of the field. No
re-planning of the parent: branch tuples, the braid action on tuples, the braid-orbit monoid, the
extraction lemma, configuration spaces, the marked and unmarked topological Hurwitz spaces, the
Hurwitz schemes and the fixed-degree comparisons are cited by the parent's target titles, which all
exist at head a5186ac (lines 2680, 2722, 2752, 2843, 5319, 5355, 5424, 5460, 5548, 5633, 5912,
5957 of the head text); the restatement of the Hurwitz action in `Suggested.lean` is explained in
the scope section and is forced by the import rule. No upward or cyclic supply (depcheck below). No
copied passages: every sampled locator is in the author's words. No algorithm. No sorried data, no
`set_option`, no `lemma`, no `#eval`/`#print`/`True` placeholder (scanned). The only non-Mathlib
import is `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`, which exists at the pin. R01 is the one
principle violation (what another roadmap plans is planned again).

**Elaboration.** `lake env lean <Suggested.lean>` from the content checkout (object file of the
Tau Ceti module present): exactly two warnings, `declaration uses 'sorry'` at lines 501 and 518,
in 9 s. A scratch copy with `#check @name` for all 40 declarations elaborated; the two headline
types carry `{G : Type} [Group G] [Fintype G] (c : ConjClasses G)`, `IsNonsplitting c`, and the
quantifier order `∃ m, 0 < m ∧ (∀ g ∈ c.carrier, g ^ m = 1) ∧ ∃ A B, ∀ (k : Type) [Field k],
(Fintype.card G : k) ≠ 0 → ∀ full p n, A * p + B < n → …` and `∃ C, ∀ k [Field k], … → ∀ full i
n, Module.rank … ≤ C^(i+1) ∧ …`, agreeing with README §4.5 and §5.2. `markedStabilizer`,
`unmarkedStabilizer` and `unmarkedGlueSum` carry `[Fintype G]` explicitly; no binder was lost.

**Padding probe.** Each sorried theorem was tried with `simp`, `rfl`, `infer_instance`, `exact
trivial` and `aesop` on five scratch copies: all ten fail (unsolved goals, `rfl` failure, "type
class instance expected", type mismatch, heartbeat timeout or exhaustive-search failure). The 38
other declarations are definitions with real bodies and proved lemmas that the definitions and the
`Rep` morphisms use (`hurwitzMove_comm`/`hurwitzMove_braid` feed `TauCeti.BraidGroup.lift`;
`hurwitzFibre_prop_iff` feeds `HurwitzFibre.instMulAction`; `glue_smul` feeds `glueRepHom`;
`unmarkedGlueSum_conj`, `_smul`, `_eq_of_mk_eq` feed `unmarkedStabilizer`); none is sorried, none
mirrors a README Check, none computes a value. No padding.

**Headline theorems.** README summary lists three: `hurwitz_homological_stability` (EVW Theorem 6.1
and Corollary 6.2), `uniform_betti_bound` (Proposition 2.5 with the topological part of
Proposition 7.8), and the uniform étale Betti bound (Proposition 7.8). The first two are stated at
the pins in braid-group-homology form; the third is named in the module docstring as not statable
(no Hurwitz scheme at the pins; `AlgebraicGeometry.Scheme.EllAdicCohomology` exists at
`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75` but has nothing to be applied to). The
docstring also names EVW Theorem 4.2 and the arc-complex connectivity as not statable, with the
missing carriers. The braid-group form is not a stand-in: `Conf_n` is a `K(B_n,1)` (parent
§IG.5.1) and the Hurwitz spaces are the covering spaces with the stated fibres (parent §IG.5.2), so
`H_p(Hur_n;k) ≅ H_p(B_n; k[X])` by AlgebraicTopology Stage 5 item 3 (permutation local system of a
finite cover, main line 870 ff.) and ClassifyingSpaces Stage 4 item 17 (local coefficients on a
`K(G,1)` are `groupHomology`, main line 238 ff.); §0.5 records this with those suppliers.

**README and Lean agree.** A script extracted every backticked own-looking identifier of the
README and every declaration of the Lean file: all 40 declarations occur in the README, and every
own-looking backticked name in the README is declared (the remainder are mathematical variables).
`HurwitzFibre.smul_tuple`, flagged by `roadmaps resolve`, is declared at line 298 of the Lean file
(the lead was a false positive). R02 concerns names attributed to the parent, not to this roadmap.

**Pinned declarations opened** (file:line at the pins). Tau Ceti
`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`: `BraidGroup` 97, `sigma` 104,
`sigma_mul_sigma_comm` 118, `sigma_braid` 123, `sigma_induction_on` 166, `lift` 179, `lift_sigma`
204, `strand` 215, `strandSucc` 218, `val_strand` 220, `val_strandSucc` 222,
`strand_ne_strandSucc` 225, `strand_ne_strandSucc_of_succ` 236, `strand_eq_strandSucc_of_succ`
242, `permHom` 304, `pureSubgroup` 394. Mathlib: `ConjClasses.mem_carrier_iff_mk_eq`
`Algebra/Group/Conj.lean:286`, `mk_eq_mk_iff_isConj` 151; `Subgroup.map_closure`
`Algebra/Group/Subgroup/Map.lean:582`, `map_top_of_surjective` 262;
`Sylow.isPretransitive_of_finite` `GroupTheory/Sylow.lean:345` (an instance),
`IsPGroup.exists_le_sylow` 196, `Sylow.card_eq_multiplicity` 833;
`MonoidAlgebra.mapDomainLinearMap` `Algebra/MonoidAlgebra/Module.lean:78`, `coeffLinearEquiv` 73,
`mapDomainLinearMap_single` 87, `lhom_ext'` 250, `MonoidAlgebra.coeff_single`
`Algebra/MonoidAlgebra/Defs.lean:225`; `Rep.ofMulAction` `RepresentationTheory/Rep/Basic.lean:333`,
`Rep.ofHom` 92; `Representation.ofMulAction` `RepresentationTheory/Basic.lean:395`,
`ofMulAction_single` 414; `groupHomology` `RepresentationTheory/Homological/GroupHomology/Basic.lean:228`,
`groupHomology.map` `…/Functoriality.lean:157` (takes `f : G →* H` and `φ : A ⟶ res f B`, as the
README says); `CategoryTheory.GradedObject` `CategoryTheory/GradedObject.lean:43`;
`CategoryTheory.SpectralSequence` `Algebra/Homology/SpectralSequence/Basic.lean:36`;
`CategoryTheory.Functor.leftDerived` `CategoryTheory/Abelian/LeftDerived.lean:106`;
`IsCoveringMap` `Topology/Covering/Basic.lean:287`. No Hurwitz action, Hurwitz fibre, nonsplitting
predicate or braid-orbit monoid exists in Mathlib or Tau Ceti at the pins (grep for `hurwitz`
finds only Riemann–Hurwitz and Hurwitz zeta material). Tau Ceti's `strandIncl`
(`Braid/Basic.lean:326`, `σ_i ↦ σ_i.castSucc`, adding a strand on the right) is a different map
from `shiftHom` (adding `m` strands on the left) and is not a duplicate.

**Cross-roadmap citations resolved.** Parent (head a5186ac): all twelve target titles found (list
above). MordellLawrenceVenkatesh (head 3756140): §5.1 surfaces with punctures (line 1711), §5.7
annular neighbourhoods and cutting (1785), §5.9 `Mod(S)` with `Mod(D²) = 1` (1817, 1838), §5.17
evaluation fibration with fibre the homeomorphisms fixing the point (1932). ReductiveGroups (main):
Layer 11A based comparison of plane and disc configurations with `TauCeti.BraidGroup n`, with the
half twist checked against IG.3.2 (lines 1975–2010); 11B Salvetti face/chamber model, good open-star
cover, quotient with one vertex and one one-cell per simple wall, "homotopy or sufficient
two-skeleton comparison" (2030–2045), so the gap asking for the full homotopy equivalence and the
cell count is precise and minimal. ClassifyingSpaces (main) Stage 4 items 16–17 (lines 224, 238).
AlgebraicTopology (main): Stage 2 (line 326), Stage 4 item 7 `simplicialRealizationCW` (817),
Stage 5 items 1 (Alexander–Whitney/Eilenberg–Zilber and Künneth, 856), 3 (transfer, permutation
local system of a nonregular finite cover, Cartan–Leray, coinvariants when `|G|` is invertible,
870–909), 5 (Serre spectral sequence, 910–935), Stage 8 relative simplicial approximation (1679),
Hurewicz (1684), Whitehead (1700). GeometricTopology (main): Layer 1 collar and tubular
neighbourhoods (206, 219), Layer 3 `Diff(M, ∂M)` with the `C^∞` topology as a topological group
(357–393). DGAInfinity (main): Layer 0 graded modules as graded objects and internal direct sums
(265), Layer 1 DG modules, tensor product and derived tensor target, extension of scalars (305),
Layer 5 derived tensor and semi-free modules (434). The six AlgebraicTopology, GeometricTopology
and DGAInfinity gaps ask for nothing these texts already state (thick realization of a
semisimplicial space, Borel construction with induced-space equivalence, join connectivity, arc
isotopy extension, the marked-disc subgroup of `Diff(D, ∂D)`, internally graded modules without
Koszul signs); each has the same slug, supplier and section in `design/plan.json` (8 entries) and
in the README. The `dga-graded-tor-spectral-sequences` gap is precise and minimal against
DGAInfinity; its overlap with ArithmeticStatisticsPartVIII is part of R01.

**Depcheck.**

```
depcheck: 241 roadmaps, 2425 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Sources: the seeded sample, all verified at the locator.**

| Target | Locator checked | Finding |
| --- | --- | --- |
| 0.1 Nonsplitting classes | EVW16 Definition 3.1, line 537 | generates `G` and `c ∩ H` empty or one class of `H`: matches |
| 0.5 Hurwitz homology as braid-group homology | EVW16 §2.2 lines 399–416, 426–428 | fibres identified with tuples, monodromy = braiding action (1.3.2), Borel construction: matches |
| 0.8 Stability on components | EVW16 Lemma 3.5 lines 623–685, Proposition 3.4 lines 574–600 | `U_D = Σ r_g^{D|g|}` central; surjection on `S_n(H)` eventually bijective; `D` from permutation orders; `|c ∩ H|` invertible; matches |
| 1.1 Support degree and internal shift | EVW16 §1.11 lines 342–349 | nonnegative grading, `deg`, `M[k]_n = M_{n−k}`: matches |
| 1.4 Balanced tensor estimate | EVW16 Lemma 4.4 lines 785–799 | `deg(N ⊗_R M) ≤ deg N + deg H_0(M)`, proof by top-degree filtration: matches |
| 1.8 Graded Nakayama | EVW16 Lemma 4.8 lines 899–908 | `deg M̄ ≤ deg(k ⊗ M̄) + deg R̄`, lowest-degree argument: matches |
| 1.12 Right linearity and tensor comparison | EVW16 §4.1 lines 736–738, proof of 4.13 line 982 | right `R`-module structure on `H_*(K(R))`; `K(M) = K(R) ⊗_R M`: matches |
| 1.13 Null-homotopies | EVW16 Lemma 4.11 proof lines 954–958 | `S_g(g_0…g_q; s) = (g^{(g_0⋯g_q ∂s)⁻¹}, …)`, `(S_g d + d S_g) = ` right mult. by `r_g`: matches |
| 1.14 Positive ideal kills `H_q K(R)` | EVW16 Lemma 4.11 line 953 | matches |
| 1.17 Low K-homology controls augmentation `Tor` | EVW16 (4.14.1) lines 1007–1035 | `H_0(M) = H_0(K(M))`, factorisation `α`, `β`, `deg H_1(M) ≤ deg H_1(K(M))`: matches |
| 2.3 Truncated braid-coset model | EVW16 §5.2 lines 1062–1069 | `L_q = ⟨σ_{q+2},…,σ_{n−1}⟩`, `A_q = B_n/L_q`, `∂_i(bL_q) = b s_{q,i} L_{q−1}`, `s_{q,i} = σ_{i+1}⋯σ_q`: matches; truncation at `q ≥ n` is the README's stated correction |
| 3.3 Rows are K-complexes | EVW16 lines 1105–1134 (Lemma 5.4) | `H_*((A_q × c^n)//B_n) ≅ H_*(c^{q+1} × Hur_{n−q−1})`; faces act by `s_{q,i}^{-1}` moving `g_i^{g_{i+1}⋯g_q}` after position `q`: matches |
| 3.5 Edge sequence | EVW16 proof of Theorem 6.1 lines 1279–1306 | (6.1.3), `e` the edge map, `f = d¹`, no differentials into or out of `E²_{0P}`: matches |
| 4.3 Full-monodromy stability | EVW16 lines 1310–1337, (6.1.6) line 1325 | induction on `|Q|`, `U_Q = Σ_{g∈c∩Q} r_g^{D|g|}`; the source's factor `|c|/|c∩Q|` is the README's stated correction (see Source issues) |
| 5.3 Uniform étale Betti bound | EVW16 Proposition 7.8 lines 1578–1606, Remark 7.9 | hypotheses centreless, rational generating nonsplitting `c`, `ℓ > max(|G|, q, n)`; (7.8.2) at fixed `n`; `ℚ_ℓ` from `𝔽_ℓ` by universal coefficients: matches |

Also verified: EVW16 (1.3.2) line 102 (the move `(a,b) ↦ (aba⁻¹, a)`), `g^h = h⁻¹gh` line 341,
Lemma 3.2 line 544, §3.3 lines 561–569 with (3.3.1), Proposition 2.5 lines 501–505, §2.6 line 509,
§2.1 lines 354–368, (4.1.1) lines 726–735, (4.3.1) line 782, (4.5.1)–(4.5.3) lines 817–827,
(4.6.3) line 854, Lemma 4.7 lines 866–886, Proposition 4.12 line 959, Proposition 4.13 lines
979–988, (5.0.2) line 1043, Proposition 5.1 lines 1049–1052, Proposition 5.3 line 1070, §5.5
lines 1139–1159, Proposition 5.6 line 1160, Theorem 6.1 lines 1256–1270, Corollary 6.2 lines
1341–1360, the `S₄` remark line 131. HW10: Lemma 7.1 line 1631 (p. 34), Proposition 7.2 lines
1644–1667 (p. 35, `(n−2)`-connected, bad simplices, joins of cut surfaces), Definition 3.4 line 724
(p. 16). CD95: Theorem 1.4.1 line 181 (p. 5), Lemma 2.2.1 line 324 (p. 8), Corollary 2.2.3 line
334 (p. 9, one cell of dimension `|T|` per `T ∈ S^f`). The author flagged no locator as
unverified. All three cited works are in `sources.toml` with status `certified`; no other work is
cited in the README.

**Adversarial table.** Values computed on each side; `x^y = y⁻¹xy`; permutations compose right to
left.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `IsNonsplitting` | trivial group; `S₃` transpositions; `S₄` transpositions; `C₆` involution; `A₄` one 3-cycle class | `S₃`: subgroups `S₃, A₃, 3×C₂, 1` give `c, ∅, {t}, ∅`; `S₄`: `H = ⟨(12),(34)⟩` abelian contains `(12),(34)` not `H`-conjugate; `C₆`: `⟨s⟩ ≠ C₆`; `A₄`: class generates a normal subgroup containing a 3-cycle, so `A₄`; each `C₃` meets `c` in one of `g, g⁻¹` | holds / fails / fails / holds | none |
| §0.2 involution class | `S₃`, `D_{2s}`, `C₆`, `S₄` | `|C₆| = 6 = 2·3`, one involution, does not generate; `|S₄| = 24`, `s = 12` even | hypotheses discriminate | none |
| §0.3 move convention | `a = (12), b = (23)` | `aba⁻¹ = (12)(23)(12) = (13)`; move `((13),(12))`; products `(12)(23) = (123) = (13)(12)` | matches EVW (1.3.2) | none |
| §0.3 fibre counts | `S₃`, transpositions, `n = 2` | orbit of `((12),(23))`: `((13),(12)) → ((23),(13)) → ((12),(23))`, size 3, product `(123)`; orbit of `((23),(12))` size 3, product `(132)`; 3 fixed constant pairs; total 5 orbits on 9 points; generating pairs 6 | matches Checks | none |
| §0.3 unmarked fibre | same | conjugation orbits: constant pairs 1 orbit; `((12),(23))` has stabiliser `C_{S₃}(S₃) = 1`, orbit 6; total 2 | matches | none |
| §0.4 `shiftHom` | `m = 0`; `m = 1, n = 2` | native index `m + i`: `0 + i = i` identity; `1 + 0 = 1` = classical `σ_2` | matches Check | none |
| §0.5 `H_0` | `S₃`, `n = 2` | `H_0(B_2; k[c²]) = k[c²/B_2]`, dimension 5 | matches | none |
| §0.6 ring | `S₃` | `∂(r_{(12)} r_{(23)}) = (123) ≠ (132) = ∂(r_{(23)} r_{(12)})`, different orbits, noncommutative; `dim R_2 = 5` | matches | none |
| §0.7 `U_D` | `C₂`, `S₃`, trivial `G` | `C₂`: `d = 2`, `U_D = r_s^{2D}`; `S₃`, `D = 1`: `r_{(12)}² + r_{(13)}² + r_{(23)}²` degree 2; `U_1² ≠ U_2` (mixed terms `r_g² r_h²`) | matches | none |
| §0.8 diagonal coefficient | `S₃`, `H` of order 2 | `c ∩ H = {t}`, coefficient 1 | matches; refutes EVW (6.1.6) factor 3 | none |
| §1.1 shift junk value | `k[1]` at `n = 0` | `M_{0−1}` with ℕ-subtraction would be `M_0 = k`; convention gives 0 | README states the convention | none |
| §1.2, §1.6 | `R = k[t]`, `U = t`, `M = k` | `R[U] = 0`, `M[U] = k`, `M/UM = k`, `A(M) = 0`; `Tor_1^{k[t]}(k,k) = k[1]`, `δ(M) = 1`; second map of degree `a = 1` sends `k` (degree 0) onto `k[1]` (degree 1); `0 ≤ 1 + A1 = 2` | holds | none |
| §1.8 Nakayama | `k[t,t⁻¹]` over `k[t]` | coinvariants `k[t,t⁻¹]/t k[t,t⁻¹] = 0`, module nonzero: lower bound needed over `R`; over `R̄` augmentation ideal nilpotent (`deg R̄ < ∞`) | Check correct | none |
| §1.9 | `k[t]`, `M = k` | `δ = 1 ≤ max(0,1) + 4·1 = 5` | holds | none |
| §1.11 `d²` | `(g,h) ⊗ m` | `d = (h) ⊗ r(h⁻¹gh) m − (g) ⊗ r_h m`; `d² = (r_h r_{h⁻¹gh} − r_g r_h) m`; (3.3.1) with `(h, h⁻¹gh)`: `r_h r_{h⁻¹gh} = r_{g} r_h` | `d² = 0` | none |
| §1.11 wrong convention | `g = (123), h = (134)` in `A₄` | with `hgh⁻¹`: products `h²gh⁻¹` vs `gh`, equal iff `g` commutes with `h² = (143)`; `(123)(143) = (14)(23)`, `(143)(123) = (12)(34)` | terms do not cancel; excluded | none |
| §1.13 `S_g` | `w = ∅`, `s` with `∂s = b` | prefix `g^{b⁻¹} = b g b⁻¹`; `r_{bgb⁻¹} s = s r_g`; for `s = r_h`: `r_{hgh⁻¹} r_h = r_h r_g` is (3.3.1) | holds | none |
| §1.15 `K(R)` for `k[t]` | all `q` | `d: K_{q+1} → K_q` is `(Σ_{i=0}^q (−1)^i) t = t` (`q` even), `0` (`q` odd); `H_0 = k`, `H_1 = 0`, `H_2 = k[2]`, `H_3 = 0`; `deg H_q = q ≤ A2 + q` | matches Check | none |
| §1.16 constants | trivial `G`, `M = k` | `A1 = 1, A2 = 2`: bound `max(0,1) + q + 4 + 2 = q + 7 ≥ q`; EVW's `A1 = 0, A2 = 1`: bound 2 but `H_3 K(k) = k[3]` has degree 3 | EVW Prop 4.13 fails as printed; README's constants repair it | none |
| §1.7 shift | `C₂`: `a = 2`, `A(R) = 1` | `a > A(R)`: the induction needs `A1 ≥ a` with `P_1 = R[a]`; README's `A1 ≥ a` supplies it | sound | none |
| §1.18, §1.19 | trivial `G`, `M = k`; `M = R` | `h_q = q ≤ 1 + 7q`; `A(M) ≤ b + 5A1 < b + A0` since `A2 ≥ 2`; `t: R_n → R_{n+1}` iso for all `n` with `b = 0` | holds | none |
| Layer 1 examples | trivial `G`; `C₂` | `A1 = max(1,1,−∞,0) = 1, A2 = 2, A0 = 7`; `C₂`: `R̄ = k[r]/(r²)` degree 1, `A1 = max(1,2,−∞,1) = 2, A2 = 4, A0 = 14` | matches | none |
| §2.3 `L_{n,q}` | `n = 2`; `n = 3, q = 0`; `q = n−1` | `L_{2,0}`: classical `σ_2…σ_1` empty, trivial; `A(2)_0 = A(2)_1 = ℤ`; `L_{3,0} = ⟨σ_2⟩` (native 1); `L_{n,n−1}`: range `n+1…n−1` empty | matches | none |
| §2.4 faces and vertices | `q = 1`; `q = 2` | `∂_0(bL_1) = bσ_1L_0`, `∂_1 = bL_0`; vertices of `bL_2`: `∂_1∂_2 = bL_0`, `∂_0∂_2 = bσ_1L_0`, `∂_0∂_0 = bσ_1σ_2σ_1L_0 = bσ_2σ_1σ_2L_0 = bσ_2σ_1L_0` (`σ_2 ∈ L_0`), and `∂_0∂_1 = bσ_2σ_1L_0` as the identity `∂_0∂_1 = ∂_0∂_0` requires | matches Check | none |
| §2.6 connectivity | `n = 0, 1, 2` | empty / one vertex (nonempty, `(−1)`-connected) / connected graph (`0`-connected); `n = 2` coset model is the real line | matches | none |
| §3.3 faces on tuples | `q = 1` | `s_{1,0}^{-1}: (g_0, g_1, x) ↦ (g_1, g_0^{g_1}, x)`, `s_{1,1} = 1` | equals `d((g_0,g_1) ⊗ m)` of §1.11 | none |
| §3.4, §3.5 | trivial `G`, `M = R`, `n = 1` | `coker(K_2 → K_1)_1 = (K_1)_1 = k` (`d = 0` from `K_2`), `(H_1K(R))_1 = 0`, `(M_0)_1 = k`, `(H_0K(R))_1 = 0`: sequence `0 → 0 → k → k → 0 → 0` | exact | none |
| §4.1, §4.2 constants | `P ≥ 1` | `n > A2 + 3A0P ≥ 2 + 21P > P + 2`; `B = A2 + A0 + 2 ≥ A2 + A0 − 1` from §1.19 | ranges consistent | none |
| §4.4 coinvariants | `C₂` antipodal on `S²`, `k = 𝔽₂` | `H_1(ℝP²;𝔽₂) = 𝔽₂`, `H_1(S²;𝔽₂)_{C₂} = 0` | invertibility needed; Check correct | none |
| §4.5 general `G` | `C₂`; `S₃`, `n = 2` | `C₂`: quotient map identity; `S₃`: 5 orbits, conjugation swaps the two size-3 orbits (products `(123) ↔ (132)`) and permutes the 3 constant orbits: 2 coinvariant classes | matches `dim H_0(Hur_2/G) = 2`; `U` is `G`-equivariant (`glue_conjFibre`), coinvariants exact when `|G|` invertible | none |
| Headline `hurwitz_homological_stability` | trivial `G`; `full = true`, `n` small; `n = 0` | `c = {1}` nonsplitting; statement is braid-group stability under `shiftHom m n`; empty fibres give `0 → 0`; `n > A p + B ≥ 0` excludes `n = 0` | not vacuous, carriers are the roadmap's own | none |
| §5.1, §5.2 cell count | `n = 0,1,2,3`; `CHur_0` | `Z_2`: one vertex, one edge, `S¹`; `Z_3`: 1,2,1 cells; `Hur_0` one cell `≤ 1`; `Hur_1` `|c| ≤ 2|G|`; `(2|G|)^m ≤ C^{i+1}` for `m ≤ Ai + B + a` since `Ai + B + a ≤ (A+B+a+1)(i+1)` | holds | none |
| Headline `uniform_betti_bound` | `n = 0`, `full` both; `i = 0` | `H_0(Hur_0) = k`, rank `1 ≤ C`; `CHur_0 = ∅` for nontrivial `G`, rank 0; `i = 0`: `dim H_0(Hur_n) = #` braid orbits, bounded by §0.8 | holds | none |
| §5.3 hypotheses vs parent | parent §IG.5.5 | parent requires centreless `G`, rational generating `c`, `q` prime to `|G|`, `ℓ > max(|G|, q, n)`: identical | matches | none |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (per supplier, with
gap lines), How to read the build, Layers 0–5 with `### k.n` prose subsections, API bullets in
prose, at least three Checks per definition (§0.1: 5; §0.3: 5; §0.4: 3; §0.6: 5; §0.7: 5; §1.1: 4;
§1.2: 4; §1.11: 5; §2.2: 5; §2.3: 4; §3.1: 4), every theorem with hypotheses and a locator, every
layer with Examples and Dependencies, Notes on the sources, Downstream consumers, Worked examples,
References. Unicode mathematics, no LaTeX delimiters, no process words, no pull-request numbers, no
machine paths (scanned). `sources.toml` records the three works with `cited_for`, `sha256`,
`licence_class` and `status`.

## Not verifiable

- Ownership against open pull requests other than those named in the brief was not checked; the
  brief's sibling list was used through `roadmaps grep` and `roadmaps show`.
- The published Annals pagination of EVW16 was not opened (the manifest reads arXiv v4 and the
  README says so); theorem and equation numbers were checked against the arXiv text only.

## Source issues

- **Misprint** in EVW16 at Definition 2.2, printed p. 9: the source lists the fibres of
  `CHur_{G,n}` and `CHur^c_{G,n}` in the wrong order and places `Sur(π, G)` inside `Hom^c(π, G)`;
  it should pair `CHur_{G,n}` with generating tuples in `G^n` and `CHur^c_{G,n}` with generating
  tuples in `c^n`; affects nothing.
- **Misprint** in EVW16 at proof of Lemma 4.6, printed p. 18: the source writes `M ⊗_R R[U]` for a
  left module `M`; it should be `R[U] ⊗_R M`, as in (4.6.3); affects nothing.
- **Error** in EVW16 at Proposition 4.13, printed p. 21: the source bounds
  `deg H_q(K(M))` by `max(deg H_0, deg H_1) + A1 q + 4A1 + A2` with `A1 = A(R)`, which may be 0;
  for the trivial group, `M = k`, the bound is 2 for every `q` while `H_3 K(k) = k[3]`; it should
  use `A1 ≥ max(1, A(R))` (the step `q − i + A1 i ≤ A1 q` needs `A1 ≥ 1`); affects a stated result
  (the constants of Theorem 4.2 and Theorem 6.1, not their existence).
- **Gap** in EVW16 at proof of Lemma 4.7, printed p. 19: the source splices `R[U] → R → R → R̄`
  with `P_0 = P_1 = R`, but multiplication by `U` has degree `deg U`, so the homogeneous complex
  needs `P_1 = R[deg U]` and the induction then needs `A1 ≥ deg U`; it should state the shift and
  enlarge `A1` to `max(A(R), deg U)`; affects the proof.
- **Misprint** in EVW16 at §5.2, printed p. 23: the source defines `A_q = B_n/L_q` for all `q`;
  it should restrict to `0 ≤ q < n` with `A_q = ∅` for `q ≥ n` (a `q`-simplex of the arc complex
  needs `q + 1` distinct endpoints; for `n = 1` the formula gives a point `A_1`); affects nothing.
- **Error** in EVW16 at (6.1.6), printed p. 29: the source says the diagonal of `U` on the stratum
  of exact image `Q` is `|c|/|c ∩ Q|` times `U_Q`; it should be `U_Q` itself, since each summand
  with `g ∈ Q` occurs once and the others leave the stratum; affects nothing (both factors are
  units).
- **Misprint** in EVW16 at (7.8.3), printed p. 35: the source writes the stabilisation from `n` to
  `n + D`; it should be `n + deg U = n + D|g|`, and the comparison at both ends needs
  `ℓ > max(|G|, q, n + deg U)`; affects nothing (Proposition 7.8 uses only the fixed-`n`
  comparison).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1993dd46b6be6c1aa3def7df8e60f633056ae200", "job": "REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII", "model": "fable", "worker": "chris-x19"} -->
