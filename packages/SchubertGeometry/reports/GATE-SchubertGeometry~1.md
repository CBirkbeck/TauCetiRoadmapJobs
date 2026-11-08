# GATE-SchubertGeometry~1: answers to the human review of #1224 (head b6cf2e7)

One review comment (roed-math, 2026-11-06T06:16:48Z) making three points. The repairs are in commit
a4a7f5c3 (`SchubertGeometry: review repairs (native Coxeter citations, Picard scope split, stable
section ids)`) on top of b6cf2e7. Only `TauCetiRoadmap/SchubertGeometry/README.md` changed;
`TauCetiRoadmap/SchubertGeometry/Suggested.lean` is byte-identical to b6cf2e7. Line numbers are those
of `TauCetiRoadmap/SchubertGeometry/README.md` at a4a7f5c3 unless another file is named. The open heads
were re-read for this report: ReductiveGroups #1676 at 528579c, FormalConnectionsOpers #1056 at
0694b63, ComplexKahlerGeometry #1234 at f44628f, GeometricQuantization #1186 at 663f762, RootSystems
#1196 at 265d185, ComplexComparisonPartII #848 at 1a0a82d. Main is eaf17b1.

## H01 (roed-math) — disputed

The three-way ownership claim is real, but this README can take the point topology and smooth charts
from neither proposed owner: citing ComplexComparisonPartII C−1.1 or FormalConnectionsOpers §2.4 is an
UPWARD edge (depcheck output below), and ReductiveGroups 3A.5 builds the topology only at the head of
#1676, while main's ReductiveGroups 3A.5 itself consumes ComplexComparisonPartII C−1.1's
`.complexPoints` (`TauCetiRoadmap/ReductiveGroups/README.md` line 342 on main). S9.0 (lines 1135–1148)
is unchanged. Once #1676 is on main, S9.0's topology, Hausdorff/second-countability and smooth-chart
clauses (lines 1145–1147) should be replaced by a citation of ReductiveGroups 3A.5.

Evidence:

- **Direction.** A scratch copy of this README with one extra `*Needs:*` line citing
  ComplexComparisonPartII C−1.1/C1.9, ComplexKahlerGeometry K4, GeometricQuantization §3.3 and
  FormalConnectionsOpers §2.4 was run through the dependency check today. It printed:
  `UPWARD: SchubertGeometry (on main) -> ComplexComparisonPartII (#38)`,
  `UPWARD: SchubertGeometry (on main) -> FormalConnectionsOpers (#39)`,
  `UPWARD: SchubertGeometry (on main) -> GeometricQuantization (#142)` and
  `CYCLE among: GeometricQuantization, SchubertGeometry`.
  SchubertGeometry is on main and the other two are not (merge-order lines 39 and 40). That is why
  main's citation of C−1.1 (main README line 26) was replaced by S9.0.
- **A revision is not a supplier.** #1676 revises a roadmap that is already on main. Citing
  "ReductiveGroups 3A.5" for the classical topology now would cite content that only #1676 defines,
  so #1676 would become a merge dependency.
- **The two heads still name different owners.**
  - #1676 makes ReductiveGroups 3A.5 the owner of the classical topology on X(ℂ) for every locally
    finite-type ℂ-scheme (its README lines 20–21 and 829–830). It lists ComplexComparisonPartII
    C−1.1, FormalConnectionsOpers §2.4 and SchubertGeometry S9 as consumers (lines 31–35 and
    3729–3735).
  - #1056 still takes "complex points, their classical topology and all these comparisons from C−1.1
    alone" (its README lines 48–57). At this head it gives ReductiveGroups 3A.5 only the topology,
    charts and Lie-group structure on `G(ℂ)` for affine algebraic groups (lines 79–80).
- **The one arrangement every direction rule allows.** ReductiveGroups 3A.5 owns the bare topology
  on X(ℂ), the separated/proper comparisons and the smooth charts. ReductiveGroups is on main and
  already supplies SchubertGeometry (Layers 7–9). ComplexComparisonPartII and FormalConnectionsOpers
  come later in the merge order and can consume it. SchubertGeometry cannot own these for
  ReductiveGroups, because ReductiveGroups → SchubertGeometry already holds and the reverse edge
  would close a cycle. #1676 lines 3731–3735 describe this arrangement: the analytic ring sheaf
  extends the topology by the identity on X(ℂ).
- **What S9.0 keeps.** It keeps the analytic ring sheaf with nilpotents, coherent analytification,
  the exchange maps and proper GAGA. Against ComplexComparisonPartII (merge-order line 39), S9.0 is
  the earlier owner, so ComplexComparisonPartII should cite S9.0 rather than the reverse. That edit
  belongs to #848, not to this folder.
- **Stale consumer line in #1056.** Its README lines 2483–2485 still list SchubertGeometry as a
  consumer of §2.4's fixed-model manifold. That was main's S9.1. This head does not consume §2.4:
  line 1147 excludes the fixed-model tangent/connection interfaces, and the citation is UPWARD.

## H02 (roed-math) — applied differently

Scope (lines 23–31) states the generic/flag split and no longer gives generic holomorphic Picard groups
to GeometricQuantization.
- Old: "Ordinary holomorphic Picard groups, the root-degree basis and the compact character-to-degree
  forgetful map belong to GeometricQuantization §§3.3–3.4."
- New: "No layer here constructs or consumes a holomorphic Picard group: S3.1's forgetful map lands in
  the Picard group of the scheme G/P−, S5's vanishing theorems are algebraic coherent cohomology, and
  S9.8 retains only the algebraic-to-holomorphic equivariant-line adapter … The generic holomorphic
  Picard group Pic_hol(M)≃H¹(M,𝒪^×) of a complex manifold and its exponential sequence are not
  targets here. The ordinary holomorphic Picard group of the compact flag K/H, its root-degree basis
  and the compact character-to-degree forgetful map belong to GeometricQuantization §§3.3–3.4."

Answer to the question: no. S5 does not consume K4.P, and neither does any other layer here.
- S3.1 (line 476) constructs the forgetful map to the ordinary Picard group of the scheme.
- S5's splitting, normality and vanishing are algebraic coherent cohomology on
  `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`.
- S9.8 (lines 1338–1347) compares associated lines only.
- The current head of #1234 (f44628f) already says this: its README lines 674–676 state that
  SchubertGeometry S5 "is neither an input nor a consumer of K4.P". The review quotes an earlier
  head (0cad4c7); that head was not re-read here.

Why K4.P is not named as the generic owner:
- K4.P exists only at the head of #1234, a revision of ComplexKahlerGeometry; main's
  ComplexKahlerGeometry has no Picard group or exponential sequence. Naming it would make #1234 a
  merge dependency for a notion this roadmap does not use.
- Other open roadmaps do not agree on the generic owner either. #1186's Scope (its lines 20–21) and
  §3.3 (line 650) take the exponential sequence from ComplexComparisonPartII C5.4. #1234 lines 669–671
  claim it for K4.P. Settling that is for #1234, #848 and #1186.
- The GeometricQuantization attribution was checked at 663f762. §3.3 (line 625) proves
  Pic_hol(K/H)≃H²(K/H;ℤ)≃P_I with its degree basis (line 651). §3.4 (line 681) carries the forgetful
  map X^*(T)→P (line 688).

## H03 (roed-math) — applied differently

Every RootSystems layer citation now names the native Tau Ceti and Mathlib declarations it meant, and
#1196 is not made a dependency. Example: S2.3 *Needs* (line 404), old "RootSystems Layers 1–3
exchange/deletion and Bruhat order" → new "the native `CoxeterSystem.exchangeCondition`,
`CoxeterSystem.deletionCondition`, `CoxeterSystem.BruhatLE` and
`CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`, applied to `TauCeti.weylCoxeterSystem`".
The README no longer mentions RootSystems anywhere.

| Section (line) | Old | New |
|---|---|---|
| S2.3 *Needs* (404) | RootSystems Layers 1–3 exchange/deletion and Bruhat order | `CoxeterSystem.exchangeCondition`, `CoxeterSystem.deletionCondition`, `CoxeterSystem.BruhatLE`, `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq` on `TauCeti.weylCoxeterSystem` |
| S2.4 *Needs* (420) | RootSystems finite Coxeter braid and length theory | `TauCeti.braidEquivalent_of_isReduced_wordProd_eq`, `TauCeti.length_weylCoxeterSystem_eq` |
| Layer 2 Dependencies (444) | none | native exchange, deletion, Matsumoto, Bruhat declarations for S2.3–2.4 |
| S3.4 *Needs* (565) | RootSystems finite braid theory | `TauCeti.matsumoto` on the monoid of ℤ-linear endomorphisms of ℤ[X] |
| S3.6 *Needs* (635) | the type-A weight lattice from RootSystems | the GL₃ character lattice of `TauCeti.GeneralLinear.diagonalRootDatum 3`, α₁=ε₁−ε₂, α₂=ε₂−ε₃ |
| Layer 3 Dependencies (643) | none | `TauCeti.matsumoto` (S3.4), `TauCeti.GeneralLinear.diagonalRootDatum` (S3.6) |
| S4.1 *Needs* (675) | RootSystems Layers 1–3's Weyl/Coxeter theory and Layer 6's integral root data | Mathlib `RootDatum`, `RootPairing.Base`, `RootPairing.weylGroup`; `TauCeti.weylCoxeterSystem`, `CoxeterSystem.BruhatLE`; `TauCeti.DynkinType.simplyConnectedRootDatum`, `TauCeti.GeneralLinear.diagonalRootDatum` |
| S4.2 *Needs* (692) | RootSystems roots and coroot pairing | roots, coroots and pairing of Mathlib's `RootPairing` |
| S4.3 text (699) | RootSystems' exchange/deletion API | `CoxeterSystem.strongExchange`, `CoxeterSystem.deletionCondition` |
| S4.3 *Needs* (713) | RootSystems quotient Bruhat order and coroots | `CoxeterSystem.MinimalCosetRepCovBy`, `CoxeterSystem.MinimalCosetRepChain`, `CoxeterSystem.exists_minimalCosetRepChain`; Mathlib coroots |
| S4.4 *Needs* (735) | RootSystems' finite root datum | Mathlib's `RootDatum` |
| S4.5 *Needs* (756) | RootSystems finite Bruhat order | `CoxeterSystem.BruhatLE`, `CoxeterSystem.MinimalCosetRepChain` |
| Layer 4 Dependencies (786) | RootSystems Layers 1–3 and 6 | Mathlib `RootDatum` and the native declarations of the supplier contracts |
| S9.5 *Needs* (1288) | RootSystems Layer 6's type-A datum | `TauCeti.GeneralLinear.diagonalRootDatum n` (keeps the GLₙ central lattice) and, for n≥2, `TauCeti.DynkinType.simplyConnectedRootDatum` at type A_(n−1) |

Supporting changes:
- The "From Tau Ceti" supplier contract gains two paragraphs (lines 75–95 and 97–115) giving each
  declaration's file and hypotheses. Scope (lines 13–17) says these inputs are consumed from Tau Ceti
  directly.
- Every name was read at the governing Tau Ceti pin 2fd255d, the pin of main's `lake-manifest.json`:

  | Declaration | File under `TauCeti/`, line |
  |---|---|
  | `CoxeterSystem.strongExchange`, `exchangeCondition`, `deletionCondition` | `GroupTheory/Coxeter/StrongExchange.lean` 424, 445, 518 |
  | `TauCeti.braidEquivalent_of_isReduced_wordProd_eq`, `TauCeti.matsumoto` | `GroupTheory/Coxeter/Matsumoto.lean` 83, 136 |
  | `CoxeterSystem.BruhatLE`, `bruhatLE_iff_exists_sublist_wordProd_eq`, `MinimalCosetRepCovBy`, `MinimalCosetRepChain` | `GroupTheory/Coxeter/Bruhat.lean` 182, 473, 588, 650 |
  | `CoxeterSystem.IsMinimalCosetRep` | `GroupTheory/Coxeter/Parabolic.lean` 239 |
  | `CoxeterSystem.MinimalCosetRepChain.length_last_add_length`, `exists_minimalCosetRepChain` | `GroupTheory/Coxeter/ChainProperty.lean` 165, 178 |
  | `TauCeti.weylCoxeterSystem`, `TauCeti.length_weylCoxeterSystem_eq` | `LinearAlgebra/RootSystem/Coxeter/Presentation.lean` 167, 191 |
  | `TauCeti.DynkinType.simplyConnectedRootDatum`, `simplyConnectedBase`, `simpleIndex` | `LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.lean` 77, 92, 203 |
  | `TauCeti.GeneralLinear.diagonalRootDatum` | `Algebra/AlgebraicGroup/GeneralLinear/Root/Datum.lean` 118 |

- The hypotheses stated in the README match the pin.
  - `weylCoxeterSystem` needs `[Finite ι] [CharZero R] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]`
    and a base (Presentation.lean lines 80–83, 109). It does not need spanning.
  - `simplyConnectedRootDatum` needs `t.Valid`, and `A n` is valid iff 1 ≤ n (`DynkinType.lean`
    line 153). Hence the "for n≥2" in S9.5.
- In this round's wording fix, `IsMinimalCosetRep` is described as the predicate it is (line 88).
  Old: "selects the minimal representative of a left coset uW_J". New: "is the predicate that u has
  minimal length in its left coset uW_J".

Why #1196 and its §1.1–§1.2 are not cited:
- #1196 revises a roadmap that is already on main, so it cannot be a dependency.
- The citations no longer depend on any RootSystems numbering. Main's RootSystems also consumes these
  items from Tau Ceti and calls them "not additional construction targets" (main README lines 15–19).
- §1.1–§1.2 develop geometric signs for arbitrary Coxeter systems, which no SchubertGeometry target
  uses.
- The old citations were wrong even against main. Main's RootSystems Layers 1–3 (lines 248, 432, 504)
  are geometric roots, the marked presentation and classification, not exchange and Bruhat order.
  At #1196's head 265d185 there are six layers, and Layer 6 (line 1030) is "invariant metrics and
  root lengths", so "Layer 6's type-A datum" would point at unrelated content.

## Other repairs in this commit (not raised in the review)

- **Section ids that other roadmaps cite.** The overlap facts list S2.3, S3.2, S4.1, S4.3, S4.4, S7.3,
  S9.1, S9.5, S9.6 and S9.7 as dropped by this pull request. They are cited by FlagVarieties (main
  line 265), CharacteristicClasses (main lines 1668 and 1722, and #1807, #1808, #1854),
  HamiltonianReduction (main, #1187), TensorProductCombinatorics #1107, GeometricQuantization #1186 and
  LanglandsParameterStacks #1202.
  - Main defined each id as item n under a `## Sk.` heading.
  - All 53 `### k.n` headings now end in `(Sk.n)`, for example line 382
    `### 2.3 Subwords and images (S2.3)`.
  - Each labelled section was compared with main's item of the same number, and the content matches:
    - S2.3 is subwords/images;
    - S3.2 is the ∇λ realization;
    - S4.1, S4.3 and S4.4 are path crystals, LS components and characters/components;
    - S7.3 is the Chow-to-cohomology comparison;
    - S9.1 is the complex comparison of flag/word schemes;
    - S9.5 is the type-A specialization;
    - S9.6 is K/N(T) with the SU₂/N(T)=ℝP² Check that CharacteristicClasses cites;
    - S9.7 is moment–Morse.
- **A false "the pin has no …" sentence** in the Tau Ceti contract (line 71).
  - Old: "no flag or Bott–Samelson scheme, LS path, crystal, Demazure operator, Frobenius-splitting
    carrier, Chow group, algebraic K-ring or complex analytic space".
  - New: "no flag or Bott–Samelson scheme, Frobenius-splitting carrier, algebraic K-ring of a scheme
    or complex analytic space".
  - The remaining absences were re-checked at Tau Ceti 2fd255d and Mathlib 1b1ccf4:
    - no Bott–Samelson or flag-variety declaration (the only hit is a docstring in
      `LinearAlgebra/RootSystem/Weyl/Demazure/Basic.lean` line 27, which says the file treats only the
      combinatorial operator);
    - `AlgebraicGeometry/Frobenius/` has no splitting;
    - no K₀ of a scheme;
    - no complex analytic space.

## Outstanding defect not repaired here: pin drift against Tau Ceti 2fd255d

At the governing pin, Tau Ceti has constructions that this README still plans as targets, and that
the `Suggested.lean` docstring calls missing:

| Module under `TauCeti/` | Contents at 2fd255d | README sections that restate it |
|---|---|---|
| `RepresentationTheory/LSPath/` (16 files, 4647 lines) | `TauCeti.LSPath` (`Basic.lean` line 101), PL paths, root operators, partial inverses, string lengths, distinguished representatives, central transport, unique highest path | S4.1–4.2, S4.4–4.5, S9.5 |
| `RepresentationTheory/Crystal/` | crystals, components, tensor, characters | S4.1 crystals, S4.4 |
| `LinearAlgebra/RootSystem/Weyl/Demazure/` | `RootPairing.demazureOperator` (`Basic.lean` line 81), D_i²=D_i (line 232), braid relations, longest element | S3.3–3.4 |
| `LinearAlgebra/RootSystem/Weyl/CoverBond.lean`, `IntervalBondGcd.lean` | positive cover bonds; `intervalBondGcd` (line 292) with chain independence `bondGcd_eq_of_head_eq_of_last_eq` (line 277) | S4.3's bond and interval-gcd targets |
| `AlgebraicGeometry/Chow/Basic.lean` | `ChowGroup` (line 295) | S7.3's carrier |
| `AlgebraicGeometry/Grassmannian/` | the Grassmannian scheme, properness, universal quotient | S1.1's ambient Grassmannian |

Not done in this round, for two reasons:
- The review did not raise it, and it is a re-plan of S3.3–S4.5 rather than a citation repair.
- It cannot be finished on this branch as it stands. The branch's `lake-manifest.json` pins Tau Ceti
  a91d3aa (branch base fee8e0e), where none of these modules exist. The
  `Suggested.lean` docstring's reason for S4 ("need the rational path quotient, its root operators and
  the LS components") holds at a91d3aa but not at 2fd255d. At 2fd255d, an S4 headline such as the LS
  character equals the Demazure character along a reduced word of w₀ may be statable on the native
  carriers, but it cannot be elaborated here without that rebase.

The branch needs a rebase onto main (pin bump to 2fd255d). Then S3.3–S4.5, S7.3's carrier and S1.1's
ambient Grassmannian should consume these modules, and S4's headlines should be re-examined for
`Suggested.lean`.

## Build

`lake build TauCetiRoadmap.SchubertGeometry.Suggested`:
`✔ [8976/8976] Built TauCetiRoadmap.SchubertGeometry.Suggested (12s)`, then
`Build completed successfully (8976 jobs).`

The earlier attempt's errno-17 failure on `.lake/packages` came from the environment: the shared
package directory of Lake pin `356835296538146e` had been removed from the host. That directory is
present again, and the build above ran against it unchanged.

## Gate

`gate SchubertGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Direction check

`depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line for
SchubertGeometry. RootSystems is no longer cited, so the overlap lead "RootSystems Layer 6
(line 1237): only #1196 defines it" no longer applies. No citation in this README depends on an open
revision.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope: no layer constructs or consumes a holomorphic Picard group | SL₂/B− weight-one line (S3.1 Check); torus flag; S5–S8 text | algebraic Pic(ℙ¹)=ℤ, the line has degree +1; torus flag is a point, Pic=0, characters 0 and 1 give the trivial line; S5–S8 cite no holomorphic or Picard input | holds | new sentence |
| Pic_hol(M)≃H¹(M,𝒪^×), named as not a target | M = point; ℂP¹; elliptic curve E | 0=0; H¹(𝒪)=H²(𝒪)=0 so H¹(𝒪^×)≅H²(ℂP¹;ℤ)=ℤ, generated by O(1); Pic⁰(E)≅E≠0 | standard identity holds | none |
| GeometricQuantization §§3.3–3.4 own the compact-flag Picard group, degree basis, forgetful map | #1186 lines 625–690 | Pic_hol(K/H)≃H²(K/H;ℤ)≃P_I; degree matrix (1) on ℂP¹ and the identity matrix on SU(3)/T; forgetful map X^*(T)→P at line 688 | holds | narrowed from generic to compact flag |
| "the pin has no flag/Bott–Samelson scheme, Frobenius splitting, scheme K-ring, analytic space" | declarations at Tau Ceti 2fd255d and Mathlib 1b1ccf4 | 0 declarations of each kind; the one Bott–Samelson hit is a docstring | holds | four false items removed |
| deletion condition | ω=(i,i) | not reduced; deleting both letters gives π()=e=s_i² | holds | — |
| exchange condition | A₂, ω=(1,2) reduced, s₁ a left descent | s₁·s₁s₂=s₂=π((2)), reduced, length 1=2−1 | holds | — |
| strong exchange, arbitrary word | A₂, ω=(1,2,1), t=s₁s₂s₁ | t·w₀=t²=e=π((1,1)) after deleting the middle letter | holds | — |
| Matsumoto: braid-compatible map, reduced words, no square relation | A₁×A₁ with f(s_i)=D_i; A₁ non-reduced (1,1) versus () | D₁D₂=D₂D₁ on both reduced words of s₁s₂; D₁²=D₁, and D(e^λ)=e^λ+e^(λ−α)≠e^λ when ⟨λ,α∨⟩=1 | holds; negative control shows "reduced" is needed | — |
| subword characterization of Bruhat order, reduced word | A₂: ω=(1,2,1); ω=(1,2); non-reduced (1,1) | subwords of 121 give all 6 elements; subwords of 12 give e,s₁,s₂,s₁s₂, not s₂s₁ (also length 2); (1)⊂(1,1) but s₁≰e=π(1,1) | holds; reducedness needed | — |
| saturated chains in W/W_J have length ℓ(x)−ℓ(y) | A₂ J=∅; A₂ J={2}; A₁ J={1} | 4 maximal chains e→w₀, each of length 3=3−0; s₂s₁⋗s₁⋗e, length 2=2−0; one coset, length 0 | holds | — |
| `IsMinimalCosetRep` is a predicate | A₂, J={2} | s₁ is minimal in {s₁, s₁s₂}: ℓ=1<2; s₁s₂ is not; e is minimal in W_J | holds | wording fixed |
| `TauCeti.weylCoxeterSystem` without spanning; length = inversions | GL₂ datum; GL₁ (no roots) | W={1,s}, ℓ(s)=1=#{e₁−e₂ sent negative}; e₁+e₂ is outside the root span ℤ(e₁−e₂); trivial W, ℓ=0 | holds | — |
| the GLₙ datum keeps a central character that the simply connected datum lacks | n=2, n=3; A₁ simply connected | ⟨e₁+e₂, e₁∨−e₂∨⟩=0; (1,1,1) pairs to 0 with every e_i−e_j; on X=ℤω, s(mω)=−mω, W-fixed only for m=0 | holds | — |
| S2.3 *Needs* (Bruhat order for the Demazure product) | Q=(i,i) | δ=max(s_i, e)=s_i since e≤s_i | consistent with the S2.3 Check (image dimension 1) | — |
| S2.4 *Needs* | A₂ words 121 and 212 | one braid move; length 3 = 3 positive roots | holds | — |
| S3.4 *Needs* (Matsumoto in End(ℤ[X])) | A₂ words 121 and 212 (S3.6) | both give dimension 81 and 46 distinct weights (recomputed: weights of sum 12 dominated by (7,5,0)); D_i²=D_i, so the no-square-relation form is the one needed | holds | — |
| S3.6 *Needs* (GL₃ lattice) | λ=(7,5,0) | ⟨λ,α₁∨⟩=2, ⟨λ,α₂∨⟩=5, i.e. 2ω₁+5ω₂; weight sum 12; dim=3·6·9/2=81 | holds | — |
| S4.1 *Needs* (SL₂, GL₂ models) | A₁ validity; GL₂ path (t,0) | `A 1` valid since 1≤1; endpoint (1,0) | matches the S4.1 Checks | — |
| S4.2 *Needs* (pairing) | GL₂ path (t,0) | ⟨(t,0), e₁∨−e₂∨⟩=t | matches the S4.2 Check | — |
| S4.3 *Needs* (quotient covers) | rank one, λ=2ω | W/W_λ={e,s}; s⋗e with bond −⟨−2ω,α∨⟩=2; a=1/2 gives 1, integral; a=1/3 gives 2/3, not integral | matches the S4.3 Check | — |
| S4.5 *Needs* | S₃ Bruhat poset | 6 vertices, 4 maximal chains e→w₀ | matches the S4.5 Check | — |
| S9.5 *Needs* | n=2; n=1 | (t,0) has height t; +(1,1) gives endpoint (2,1); GL₁ has no roots and `A 0` is not valid, hence "for n≥2" | holds | qualifier n≥2 |
| `(Sk.n)` heading labels | the ten cited ids, each against main's item of the same number | content matches in all ten (listed above) | ids stay defined | 53 headings labelled |

## Mechanical signature check

`Suggested.lean` declares nothing: it has the module docstring and an empty namespace. So there is no
`#check @name` to elaborate, and nothing in it changed. The native names newly cited in the README were
read at their declarations in Tau Ceti 2fd255d (files and lines in H03). Several of them
(`weylCoxeterSystem`, `MinimalCosetRepCovBy`, `MinimalCosetRepChain`, the `ChainProperty.lean`
theorems) do not exist at the branch's own pin a91d3aa, so they could not be `#check`ed in this
worktree before the rebase that the pin-drift section calls for.

## Ownership and citations checked

- **Ownership** was checked against main (eaf17b1) and the heads listed at the top, read with the
  roadmap tool's `show`.
- **No new objects** were added to this roadmap in this round. S9.0's ownership is argued under H01.
- **No declaration name clashes:** `Suggested.lean` declares nothing, so none of its names is the
  fully qualified name of another roadmap's declaration.
- **Citation resolve:** it reports five "found nowhere" leads (BrionFlags, KnutsonBottSamelson,
  KnutsonDemazure, SerreGAGA, KnutsonSymplectic). All five are source keys defined in References
  (lines 1526–1550), not roadmaps. It reports no unresolved Lean names.
- **Cross-roadmap citations resolved:**
  - TensorProductCombinatorics §8.3 and Layer 6 exist at #1107.
  - GeometricQuantization §§3.3–3.4 exist at #1186 (lines 625 and 681).

## Sources

No source citation was added or changed, so nothing was fetched and no `needs-references.toml` entry
was written. The roadmap folder has no `sources.toml`, and that file is outside what this job may
edit.

## Suspicious text

None. The review is a plain overlap report with suggestions.
