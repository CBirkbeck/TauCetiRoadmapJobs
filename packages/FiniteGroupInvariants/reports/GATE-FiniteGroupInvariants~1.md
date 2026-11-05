# GATE-FiniteGroupInvariants~1: answers to the review of `19a7fe9`

All fifteen points come from one review comment (CBirkbeck, 2026-11-02), points F01–F15 in order.
Repairs are in commit `73b2253` on the pull-request branch (not pushed). Section numbers below are
those of the repaired `TauCetiRoadmap/FiniteGroupInvariants/README.md`; the numbers that consumers
cite (7.1, 7.3, 10.5) are unchanged.

## H01 (CBirkbeck) — applied

README 1.7 now reads `e(G) = 1` iff `G` is trivial or not elementary (old: "iff not elementary"), with
the trivial group as a negative-control Check (product `1`, elementary) and `C₃` (product `3`),
`S₃` (product `1`, not elementary) as Checks; the proof notes that a nontrivial group that is
`p`-elementary for `p ∤ |G|` is cyclic, hence `q`-elementary for every `q ∣ |G|`. The definition
`elementaryPrimes` was deleted from `Suggested.lean` (no headline uses it; see H15).

## H02 (CBirkbeck) — applied

Conventions and 4.1 now say `commutatorLength G ≤ 1` iff every element of `G'` is a commutator, and
`= 1` iff moreover `G` is nonabelian (old: "`1` exactly when every element of `G'` is a
commutator"). 4.1's Checks are `C₂` (length `0`, since `commutatorSet C₂ ^ 0 = {1} = G'`), `S₃` and
`Q₈` (length `1`).

## H03 (CBirkbeck) — applied

0.6 now states attainment, the `≤ n` criterion, subgroup and quotient monotonicity and
`d(G) ≤ compositionLength G` for solvable `G` only, keeping the junk value; the Checks include
`C₂ ≤ A₅` (`1` vs `0`) and `A₅ × C₂ → C₂` (`0` vs `1`) as negative controls and `C₃ ≤ S₃`,
`S₃ → C₂` (`1 ≤ 2`). The same defect was in 4.3: invariance of nilpotency class and derived length
under isoclinism is now stated for nonabelian groups, with `C₂` versus the trivial group (classes
`1` and `0`, isoclinic) as the Check.

## H04 (CBirkbeck) — applied differently

All citations of Polynomial Galois Groups Layers 1C–1D and Layer 9 are gone; the `S₁₆` pair is cited
from InductionRestriction §2.2 (`Gassmann.exists_S16_gassmann_pair`). The small-index nonexistence
of Gassmann triples, the `8T15`/`8T23` counts and the "no elusive group of degree `≤ 11`" check are
removed rather than owned: each needs the transitive groups of degree `6`–`11`, which neither
Completed/PolynomialGaloisGroups (degree `≤ 5`) nor PolynomialGaloisGroupsPartII supplies, and no
classification-free proof is known to me, so owning them would mean owning a classification of
transitive groups. In their place, 7.2 owns the Fano triple of index `7` in `GL₃(𝔽₂)` (explicit, no
classification), 8.3 owns non-elusiveness in prime-power degree (`not_isElusive_of_card_eq_prime_pow`,
a proof by a central element of a transitive Sylow subgroup) and states Fein–Kantor–Schacher as an
implication from `TauCeti.ClassificationStatement`.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean` lines 1–6: `import Mathlib` plus three plain
`import TauCeti.*` lines → `module`, `public import Mathlib` and the same three modules as
`public import` (each is already a `module` at the pinned Tau Ceti); the body is wrapped in
`@[expose] public section` … `end`, as in `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on
main, so every declaration stays public with its body exposed and no statement changes. The build
no longer emits the module-system warning, and the gate's `imports` check accepts the form.

## H06 (CBirkbeck) — applied

9.1 now owns Jordan–Zassenhaus (`jordan_zassenhaus`, all lattices of a given rank, not only locally
free ones), with the route through a maximal order `Λ ⊇ ℤ[G]`, Minkowski's convex body theorem
and the lattices between `|G| Λ L` and `Λ L` (reiner-maximal-orders, §26); the trivial rank-one
`ℤ[C₂]`-lattice is a Check. 9.4 owns Kuroda's formula (`classNumber_mul_eq_unitIndex_mul`), stating
`4 h = q h₁h₂h₃` for totally real `K` and `2 h = q h₁h₂h₃` for totally complex `K` separately
(lemmermeyer lines 102–113). The citations of ClassicalArithmeticCompletion 7.40/7.54/7.77 and of
"the class-group roadmaps" are removed.

## H07 (CBirkbeck) — applied

6.3 now states a `ℚ`-basis of the `ℚ`-valued functions constant on divisions, in Lean as
`existsUnique_eq_sum_rationalCharacter` (a `ℚ`-valued `f`, unique rational coefficients). The
constant function `i` on the trivial group is recorded as the reason for the restriction; Checks are
the trivial group (basis `[1]`) and `C₃` (table `[[1, 1], [2, −1]]`, determinant `−3`).

## H08 (CBirkbeck) — applied

The Galois action, its value law, preservation of irreducibility and the field-of-values theorem are
imported from CharacterTheory §4.4 and Tau Ceti's `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction`
(pinned, `TauCeti/RepresentationTheory/CharacterTable/CyclotomicAction.lean`); 6.1–6.2 keep only the
conductor, the orbit count and the rational characters. `commProb_def'` and `IsCyclic.card_mulAut`
are in the Mathlib supplier table; the corresponding targets of 3.1 and 4.1 are deleted.

## H09 (CBirkbeck) — applied

`diederichsen_reiner` is now stated for every prime `p`: a family of `2 h + 1` pairwise
non-isomorphic indecomposable `ℤ[C_p]`-lattices, `h = NumberField.classNumber (CyclotomicField p ℚ)`,
such that every indecomposable lattice is isomorphic to one (Reiner 1957, Corollary, p. 145, read
at its lines 139–142). The bound `p ≤ 19` and the rank-one alternative are gone; Checks are `p = 2`
(trivial and sign lattices distinct), `p = 3` and `p = 23` (`h = 3`, seven classes).

## H10 (CBirkbeck) — applied

`isRationalGroup_iff_forall_mem_range` (6.6) and `exists_conj_le_range_int` (10.1) are added. The
headline audit added `exists_mulEquiv_pi_of_isMinimalNormal`, `smithInvariants_unique`,
`existsUnique_eq_sum_rationalCharacter`, `exists_character_eq_schurIndex_mul_rationalCharacter`,
`card_faithful_irreducibleCharacters`, `irrDegreeC_lt_top_iff`, `minkowskiBound` with
`card_dvd_minkowskiBound`, the `ℚ`-class counts, `jordan_zassenhaus`, Kuroda's formula, and
Fein–Kantor–Schacher and Collins as implications from `TauCeti.ClassificationStatement`. The
docstring now names the two headlines not statable at the pins, Herbrand's theorem (9.3) and
Kubota's unit types (9.4), and the missing carrier (the `ℤ[Gal(K/ℚ)]`-module structure on units).
Bender's theorem and the stem-cover statements are not stated here because they belong to
LocalFiniteGroupTheory L2 and InductionRestrictionPartII §RS.0.1 (see the ownership section).

## H11 (CBirkbeck) — applied

The universal "witness of order `≤ 24`" sentence is removed from Layer 1's preamble; each
non-closure now has its own witness, with orders given in 1.8 (for example `A₅`, order `60`, and its
subgroup of order `2` for quasisimple and almost simple groups; `SL(2,5)` and `S₅`, order `120`;
`A₅ × A₅`, order `3600`).

## H12 (CBirkbeck) — applied

The certificate interface (old 10.4) and every decidability or bounded-search target are deleted.
10.3–10.4 state the counts `13/10`, `73/32`, `710/227` with a mathematical route (Minkowski's bound,
rational representations by characters, `G`-stable lattices between `|G| L₀` and `L₀`); the Checks
keep `710 ≥ 227` and `1152 ∣ 5760`.

## H13 (CBirkbeck) — applied differently

Locators were checked against the texts that could be read: Reiner 1957 (Theorem and Corollary,
p. 145), Serre arXiv:1011.0346v1 (§1.1 Theorem 1, p. 3; §1.2 Lemma 1, p. 4; the values of `M(n)` at
its lines 113–116), lemmermeyer (Theorem 1, lines 102–115), kubota (the seven unit types, lines
13–21), desmit-perlis (lines 14–22, 52). The Fein–Kantor–Schacher hypotheses (degree `> 1`) and its
use of the classification are now in the statement (8.3). Citations whose locators could not be
checked were removed where the claim no longer needs them (Isaacs, Kurzweil–Stellmacher, Newman,
Aschbacher, Karpilovsky). `sources.toml` is kept with the package on the board and was outside this
job's edit scope; it lacks entries for Reiner 1957 and Serre (both readable, the service cached
them) and for Guralnick 1982 and Perlis 1977 (paywalled, to be recorded `uncertified`). The cached
texts of fks, huppert-1954 and hall-1940 are Göttingen volume landing pages, not the papers, so
their locators remain unverified.

## H14 (CBirkbeck) — applied

The README is rewritten in house form: Summary, Scope and ownership, Conventions, Exact supplier
contracts, How to read the build, Layers 0–10 with `### k.n` subsections in prose, each definition
with its API and at least three Checks, each layer ending in Examples and Dependencies, Downstream
consumers, References. Undeclared backticked names (`compositionLength_eq_zero_iff`,
`hyperelementaryPrimes`, `derivedLength`, `solvableRadical` and the rest) are now prose or plain
notation; every backticked name of this roadmap is declared in `Suggested.lean`, and every Lean
declaration is named in the README (checked mechanically). The invariant-factor exponent statement
is guarded by nontriviality.

## H15 (CBirkbeck) — applied

Deleted from `Suggested.lean`: `card_out_quaternionGroup_two`, `mobiusSub_bot_perm_four`,
`permutationDegree_quaternionGroup_two`, `irrDegreeC_zmod_four_prod`, `jordanBound_one`,
`GroupCompositionSeries.trivial`, `Isoclinism.refl`, `not_isSupersolvable_alternatingGroup_four`,
`isQuasisimple_SL2_5_not_isAlmostSimple`, `isAGroup_of_isZGroup`,
`commutatorLength_of_isMulCommutative`, `commutatorLength_eq_zero_iff`, `derivedLength_eq_zero_iff`,
`derivedLength_eq_one_iff`, and the definitions used only by them or by deleted API lemmas
(`elementaryPrimes`, `derivedLength`, `Inn`, `Out`, `AutjugacyClasses`, `transitiveDegree`,
`linDegreeC`, `IsQuasisimple`, `ConjClasses.toDivision`). The values `6`, `−12`, `8`, `⊤`, `1` remain
README Checks.

## Build and gate

`lake build TauCetiRoadmap.FiniteGroupInvariants.Suggested` on `91dc700`: `Build completed
successfully (9747 jobs)`, with only `declaration uses 'sorry'` warnings; no module-system warning,
no errors.

Gate (`--base origin/main`, merge order read from the board copy) on `91dc700`:

```text
gate FiniteGroupInvariants: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`--depcheck … --movable`):

```text
depcheck: 209 roadmaps, 1730 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The old README passed only because the check parsed no supplier
edge from it (`1726` edges with or without it); the supplier-contract headings now give four edges.
Every named supplier is on main, earlier in the order (InductionRestrictionPartII,
ArithmeticStatisticsPartV), or LocalFiniteGroupTheory, a new-folder pull request by another author.
`roadmaps resolve` on the repaired README: no cross-roadmap citation and no Lean name found
nowhere.

## Elaborated signatures

All 94 declarations were checked with `#check @name` in one elaboration (lines appended to the
module, built once, removed). Every theorem that needs finiteness carries `[Finite G]` or
`[Fintype G]` in its own signature; `characterField`, `GaloisConj`, `rationalCharacter`,
`schurIndex` and `irrDegreeC` carry `[Finite G]` explicitly (in the old file `characterField`,
`schurIndex`, `irrDegreeC` and `linDegreeC` took it only from a `section` variable). The
lost-binder lead `is` of the old signature list was comment text; it is gone. No elaborated type
differs from its README statement.

## Ownership

Searched by object with `roadmaps grep` (main and all open roadmap pull requests): Fitting subgroup,
supersolvable, Hall subgroups, quasisimple, Jordan–Zassenhaus, Minkowski's lemma and bound, Jordan's
theorem, Perlis, chief series, socle, Taketa and M-groups, Schur index, Eulerian functions,
Diederichsen–Reiner, Kuroda, commutator length, permutation degree, Huppert, Brauer–Speiser,
Gaschütz, stem extensions and isoclinism. Found and now imported: LocalFiniteGroupTheory L1–L2
(Hall's theorem, Fitting subgroup, quasisimple groups, components, `F*(G)`, Bender), which the old
README planned again in 0.8, 1.5, 1.10 and 2.2; InductionRestrictionPartII §RS.0.1 (the kernel of a
stem extension), which old 4.4 planned again. InverseGaloisAndArithmeticFundamentalGroups uses a
local supersolvability hypothesis without theory; ownership here is stated. SatoTateGroups,
AdelicImagesAndModularCurves and QuaternionArithmetic consume 10.5, 7.1 and 7.3 (numbers kept). The
sibling ArtinRepresentations (same author, not in the merge order) is no longer cited as a supplier;
Perlis' theorem is routed through NumberFieldArithmetic 1.4 and Chebotarev Layer 10 instead.
ArithmeticStatisticsPartV §3.9 has no Lean names; the old README's `malleIndex`, `malleB` and
neighbours did not exist there and are replaced by that section's notation. Links to
PolynomialGaloisGroups, Chebotarev, NumberFieldArithmetic and Multiquadratic pointed outside
`Completed/`; they are now cited as `Completed/…`.

## Adversarial pass

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| modular law, `NormalSubgroup` (0.1) | `Subgroup A₄`, `A=⟨(12)(34)⟩≤C=V₄`, `B=⟨(123)⟩` | `|A ⊔ (B ⊓ C)| = 2`, `|(A ⊔ B) ⊓ C| = 4` | fails without normality, as stated | Check added |
| `chiefFactors_eq` (0.2) | `C₆` two series; `S₄`; trivial | `{C₂,C₃}={C₂,C₃}`; `{V₄,C₃,C₂}`; `∅` | holds | Checks |
| `exists_mulEquiv_pi_of_isMinimalNormal` (0.3) | `V₄ ⊴ A₄`; base of `A₅ ≀ C₂` | `(ZMod 2)²`, `k=2`; `A₅²`, `k=2` | holds; minimal normal need not be simple | Check |
| `compositionLength_quotient_add` (0.5) | `S₄`, `N=V₄`; `N=⊥`; `A₅×C₂` | `2+2=4`; `ℓ(G)+0=ℓ(G)`; `ℓ=2` vs `Ω(120)=5` | holds | Check corrected (`5`, not `4`) |
| derived length monotone (0.6) | `C₂≤A₅`; `A₅×C₂→C₂`; `C₃≤S₃` | `1>0`; `0<1`; `1≤2` | false without solvability | hypothesis added (H03) |
| nilpotent bound `d ≤ ⌊log₂ c⌋+1` (0.6) | `c=0,1,2,3,4` | `d≤1,1,2,2,3`; `⌈log₂(c+1)⌉ = 0,1,2,2,3` | holds (`c=0`: `d=0≤1`) | none |
| `isMulCommutative_socle` (0.7) | `S₄`; `A₅` | `V₄` abelian; `A₅` nonabelian | needs solvable | Check |
| `smithInvariants` (0.9) | `ZMod 6`; `ZMod 2×ZMod 2×ZMod 3`; trivial | `[6]`; `[2,6]`; `[]` | exponent claim needs nontrivial | guarded |
| Huppert (1.1) | trivial; `S₃`; `A₄` | vacuous/true; indices `2,3`/true; index `4`/false | holds | Checks |
| `isMetacyclic_of_isZGroup` (1.2) | `S₃`; `Q₈` (not Z) | metacyclic; metacyclic but not Z | holds, converse fails | Check |
| `IsRationalGroup` (1.4) | trivial; `C₃`; `A₄` | rational (`n` coprime to `1` gives `1`); `g≁g²`; `(123)≁(132)` | as stated | Checks |
| `isAlmostSimple_iff` (1.5) | `S₅`; `SL(2,5)`; trivial | true/true; false/false; false/false | holds | Checks |
| `isComplete_perm_fin` (1.6) | `n=0,1,3`; `n=2`; `n=6` | complete; centre `C₂`; `|Out|=2` | holds, exclusions needed | none |
| elementary product (1.7) | trivial; `C₃`; `S₃`; `C₆` | `1`, elementary; `3`; `1`, not elementary; `6` | old iff false at trivial group | fixed (H01) |
| non-closure witnesses (1.8) | quasisimple/almost simple | smallest examples order `60` | old "`≤ 24`" impossible | removed (H11) |
| Hall's converse (2.1) | trivial; `S₄`; `A₅` | vacuous, solvable; complements `3`,`8`; no subgroup of order `20` | holds | route made precise |
| `nonempty_division_equiv_orbits` (3.7) | `A₄`, `e=6`; `C₃`; trivial | `3` orbits = `3` divisions; `2=2`; `1=1` | holds | Checks |
| commutator length (4.1) | `C₂`; `S₃`; `Q₈` | `0`; `1`; `1` (`−1=⁅i,j⁆`) | "exactly 1" false at `C₂` | fixed (H02) |
| isoclinism invariants (4.3) | `C₂` vs trivial; `D₄` vs `Q₈` | classes `1`,`0` (isoclinic); `2`,`2` | needs nonabelian | fixed |
| `exists_isoclinic_isStemGroup` (4.4) | `D₄×C₂`; abelian `G` | stem `D₄`, order `8`; trivial group | holds | Checks |
| `mobiusSub` (5.1) | `A₄`; `S₄`; `Q₈` | `μ(1)=4` (from `μ(C₃)=μ(V₄)=−1`, `μ(C₂)=0`); `−12`; `0` | consistent with Hall's vanishing | Checks |
| `eulerian_eq_sum_mobiusSub` (5.2) | `S₃,k=2`; `C₂², k=2`; `k=0` | `36−9−12+3=18`; `16−12+2=6`; `0` / `1` | holds; `6 ∣ 18` | Checks |
| `card_faithful_irreducibleCharacters` (5.3) | `C₂`; `C₂²`; `S₃`; `Q₈`; `S₄` | `2−1=1`; `4−6+2=0`; `3−2+0=1`; `5−4=1`; `5−3=2` | matches the tables | Checks |
| Johnson (5.4) | trivial; `C₂`; `C₆` | `0` (empty family, `⊤=⊥`); `2`; `5` | holds | Checks |
| `card_quot_galoisConj_eq_card_division` (6.2) | `C₃`; `A₄`; `A₅` | `2=2`; `3=3`; `4=4` | holds | Checks |
| `existsUnique_eq_sum_rationalCharacter` (6.3) | trivial; `C₃`; complex `i` on trivial | basis `[1]`; det `−3`; not in `ℚ`-span | ℚ-valued needed | fixed (H07) |
| Schur index, Brauer–Speiser (6.4) | `Q₈` deg 2; `D₄` deg 2; linear | `2 ≤ 2`, `2 ∣ 2`; `1`; `1` | holds | Checks |
| `exists_character_eq_schurIndex_mul_rationalCharacter` (6.5) | `Q₈` on `ℍ`; `C₃` on `ℚ²`; trivial | `4 = 2·2`, char `2χ`; `(2,−1,−1)=1·(ω+ω̄)` sums; `1·1` | holds | new headline |
| `isRationalGroup_iff_forall_mem_range` (6.6) | `S₃`; `C₃`; `A₄`; `Q₈` | T/T; F/F; F/F; T/T | holds | new headline |
| Taketa, M-groups (6.7) | `SL(2,3)`; `A₅`; `S₄` | solvable non-M; non-solvable non-M; M | consistent | Checks |
| `irrDegreeC_lt_top_iff` (6.8) | trivial; `C₄×C₄`; `A₅×A₅` | `1`, socle `⊥=⟨⟨1⟩⟩`; `⊤`, socle `C₂²` not normally cyclic; faithful `χ⊗ψ`, socle normally generated by `(a,b)` | holds | Checks |
| `almostConjugateOfFiniteIndex_iff_map` (7.3) | `ℤ²`, `H=2ℤ×ℤ`, `K=ℤ×2ℤ`, `γ=(1,0)` | fixed cosets `0` vs `2` both sides | holds | Check |
| Fano triple (7.2) | order `7`; involution; order `3` | fixed points/lines `0/0`; `3/3`; `1/1` | Gassmann, not conjugate | new |
| Perlis (7.4) | `H=K`; distinct normal index 2 | T/T; F/F | holds | route without Artin `L`-functions |
| invariants (7.5) | `ℚ(⁸√−15)`,`ℚ(⁸√−240)`; `ℚ(√2)`,`ℚ(√3)` | equal zeta, `h` ratio `2`; discriminants `8`,`12` | class number excluded correctly | Checks |
| `not_isElusive_of_card_eq_prime_pow` (8.3) | `C₂²` regular; trivial on 1 point (degree `1 = p⁰`, excluded by `a ≥ 1`) | involutions fixed-point-free; elusive | `a ≥ 1` and FKS degree `> 1` needed | Check |
| `jordan_zassenhaus` (9.1) | rank 1 over `ℤ[C₂]`; rank 0 | `2` classes; `1` class | covers non-locally-free | Check (H06) |
| `diederichsen_reiner` (9.2) | `p=2`; `p=3`; `p=23` | `h=1`: `3`; `h=1`: `3`; `h=3`: `7` | holds, no bound | fixed (H09) |
| Kuroda (9.4) | `ℚ(√2,√3)`; `ℚ(i,√2)`; swapped factors | `4·1=4·1`, `q=4`; `2·1=2·1`, `q=2`; `h=2`, `h=1/2` | real/complex factors pinned | Checks |
| unit types (9.4) | subgroups of `(ZMod 2)³` of order `≤4` mod `S₃` | `1+3+3=7` orbits; `q = 1,2,4,2,4,4,2` | old "15 module types, 7 up to Aut" conflated subgroups and module types | rephrased |
| `exists_conj_le_range_int` (10.1) | `n=0`; `[[0,2],[1/2,0]]` | identity; `diag(1,2)` gives `[[0,1],[1,0]]` | holds | new headline (H10) |
| Minkowski lemma (10.2) | `m=2`; `m=3`; `m=4` | `−1≡1 mod 2`, order 2 (fails); holds; holds (Serre: `m≥3`) | `m ≥ 3` needed | generalized from prime `p` to `m` |
| `minkowskiBound` (10.2) | `n=0,1,2,3,4` | `1, 2, 2³·3, 2⁴·3, 2⁷·3²·5` = Serre's `1,2,24,48,5760` | holds | new |
| counts (10.3–10.4) | `n=1,2` | `(2,2)`, `(13,10)`, ℤ-classes map onto ℚ-classes | consistent | none |
| `jordanBound` (10.5) | `n=0`; `n=1`; `SL(2,5)`; `SL(2,p)` | `1`; `1`; index `60`; `p(p²−1)/2` | Schur needs `n≥1`; char 0 needed | Checks |
| Collins (10.5) | `S_{n+1}`, `n≥71` | no nontrivial abelian normal subgroup: index `(n+1)!` | lower bound consistent | stated from `TauCeti.ClassificationStatement` |

## Untrusted text

The review's repair suggestions were treated as claims and checked; nothing in it asked for an
action outside this job.
