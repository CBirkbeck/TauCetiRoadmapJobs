# Review of QuantumGroups (pull request #1649 at ab56b1d)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `ab56b1decbe542b5c2242a545a3acb0574a73a97` (a full review: 600 lines changed since `cc02cfc`, the head the previous review read). No file of the pull request was changed. The worker's gate passes every check, including the dependency check (0 problems) and the targeted build. Six of the previous review's seven findings are repaired. One finding blocks: the Layer 8 block of `Suggested.lean` restates, on a private stand-in carrier, definitions and theorems that Tau Ceti at the pin already provides and proves. Three P3 findings follow, one of them carried from the previous review.

**Status of the previous review's findings (cc02cfc → ab56b1d).**

| Previous | Status at ab56b1d |
| --- | --- |
| R01 (P2) dependency check fails on CategoricalOperatorAlgebras / TemperleyLiebOperatorAlgebras | Repaired by the author-side option: the two supplier rows and contract paragraphs are gone, §0.3/§0.4 became §0.1/§0.2 stating the instances this roadmap uses, and Scope names the two roadmaps as later owners "from which nothing is imported here" (`README.md:32`–`:36`, `:42`–`:44`). The required command now prints `depcheck: 238 roadmaps, 2354 edges, 0 problem(s)`. The move-down is recorded under Ownership below. |
| R02 (P2) Layer 0 restated VonNeumannAlgebras and HilbertModules | Repaired: §§0.1, 0.2, 0.5 deleted; supplier rows added (`README.md:88`–`:89`) whose labels all resolve on main (table below); every re-pointed `*Needs:*` line names the supplier section (`:414`, `:465`, `:493`, `:516`, `:709`, `:814`, `:1041`, `:1085`); `weakClosure_eq_bicommutant` deleted from `Suggested.lean`. |
| R03 (P3) C5.2 cited for `A⊗min A≅C₀(G×G)` | Repaired: Scope `:20`–`:22` and §1.1 `:286`–`:299` state the identification `C₀(X,C₀(Y))≅C₀(X×Y)` as this roadmap's target with the tube-lemma argument, and cite C5.2 only for `C₀(X)⊗min A≅C₀(X,A)`. |
| R04 (P3) Malacarne "Lemma 3.2"; Longo–Roberts §3 page | Repaired: `README.md:1041` and `:1589` read "Lemmas 1.2, 2.1 and 3.1 and the proof of Theorem 4.1, preprint pp.2–6"; `:1565` reads "§3, pp.10–18". |
| R05 (P3) §1.1 without a literature locator | Repaired: `README.md:335`–`:337` and `:353` cite Kustermans–Vaes Definition 2.1, p.853, which is the bi-C*-algebra definition (`kustermansvaes` line 743, under the page marker for p.853 at line 738). |
| R06 (P3) "requires author coordination" | Repaired: the sentence is gone (`README.md:1620`–`:1624`). |
| R07 (P3) two open revisions with no stated order | Not repaired: the description is unchanged and #1705 (now at `0d7cbcc`) still conflicts in both files. Carried as R04. |

## R01 (P2) — Layer 8 of `Suggested.lean` is a private stand-in for the native `TauCeti.UqSl2`, whose headlines the pinned Tau Ceti already proves

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:110`–`:258` (`SL2Generator`, `QuantumSL2Relation`, `QuantumSL2`, `quantumSL2Generator`, `quantumSL2KUnit`, `quantumSL2Casimir`, `quantumInteger`, `QuantumSL2LocallyFinite`, `QuantumSL2SignedWeights` and the eight sorried Layer 8 theorems) and `:35`–`:39` (the docstring's "not statable" claims for Layer 8); `TauCetiRoadmap/QuantumGroups/README.md:1214`, `:1220`–`:1229`, `:1251`, `:1289`, `:1297`, `:1316`–`:1322`, `:1354`, `:1366`–`:1368` (the backticked Lean names).

**Claim:** `Suggested.lean` states headline theorems against the pinned Tau Ceti, on carriers that exist at the pin, with definitions only where a headline is otherwise not statable; "when an earlier roadmap target is already implemented in Tau Ceti, prototype the new interface against that implementation instead of restating it behind a private stand-in" (`README.md` of the content repository, "Import existing Tau Ceti APIs").

**Witness:** Tau Ceti at the pin `2fd255d9` (the branch's `lake-manifest.json`, identical to main's) contains `TauCeti/QuantumGroups/UqSl2/` (43 files) and `TauCeti/QuantumGroups/QuantumInteger/`. Each Layer 8 declaration of this file has a native counterpart, and each sorried theorem is a proved native theorem:

| `Suggested.lean` | Native at the pin (file under `TauCeti/QuantumGroups/`) |
| --- | --- |
| `QuantumSL2`, `SL2Generator`, `QuantumSL2Relation`, `quantumSL2Generator` | `TauCeti.UqSl2` = `RingQuot (UqSl2.Rel q)`, `UqSl2/Basic.lean:86`, `Rel` at `:69`, generators `e`, `f`, `k`, `kInv` |
| `quantumSL2KUnit` | `TauCeti.UqSl2.kUnit`, `UqSl2/Basic.lean:163` |
| `quantumSL2Casimir` | `TauCeti.UqSl2.casimir`, `UqSl2/Casimir/Basic.lean:65`; central at `:138` |
| `quantumInteger` | `TauCeti.quantumInteger` with the same formula, `QuantumInteger/Basic.lean:150`; `IsGenericQuantumParameter` (= `q ≠ 0 ∧ ∀ n > 0, q^n ≠ 1`, the file's `hq`/`hgeneric` pair) at `:33` |
| `quantumSL2Comul_exists` | `TauCeti.UqSl2.instHopfAlgebra`, `UqSl2/Hopf.lean:167`, with `comul_e`, `comul_f`, `comul_k` at `:180`–`:192` giving exactly the three displayed values |
| `quantumSL2PBW_exists` | `TauCeti.UqSl2.pbwBasis : Module.Basis (ℕ × ℤ × ℕ) ℂ (UqSl2 q)`, `UqSl2/PBW.lean:184` |
| `quantumSL2_domain` | `TauCeti.UqSl2.instIsDomain`, `UqSl2/OreTower.lean:350` |
| `quantumSL2_center` | `TauCeti.UqSl2.polynomialAlgEquivCenter : Polynomial ℂ ≃ₐ[ℂ] Subalgebra.center ℂ (UqSl2 q)`, `UqSl2/Center.lean:187` |
| `quantumSL2_finite_semisimple` | `TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional`, `UqSl2/CompleteReducibility.lean:300` |
| `quantumSL2_simple_classification` | `TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule`, `UqSl2/SimpleClassification.lean:62`, on `LadderModule q m ε` (`UqSl2/LadderModule/Basic.lean:86`) |
| `QuantumSL2LocallyFinite`, `QuantumSL2SignedWeights` | `IsLocallyFiniteModule ℂ (UqSl2 q) V` (`TauCeti/RingTheory/Finiteness/LocallyFinite.lean:59`), `TauCeti.UqSl2.IsSignedTypeOne` (`UqSl2/TypeOne.lean:184`) |
| `quantumSL2_locallyFinite_semisimple` | `TauCeti.UqSl2.isSemisimpleModule_of_isLocallyFiniteModule`, `UqSl2/LocallyFinite.lean:63` |
| `quantumSL2_locallyFinite_iff` | not stated verbatim; its pieces are `isLocallyFiniteModule_of_isWeightModule` (`UqSl2/TypeOne.lean:279`), `exists_e_pow_smul_eq_zero_of_isLocallyFiniteModule` and the `f` version (`UqSl2/LocallyFinite.lean:69`, `:77`), and `isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule` (`:104`) |

The roadmap's own generated `STATUS.md` (as of `e8ea0d1`, 2026-10-25) records "Items 2, 4 and 7 are done … Item 3 is done … Item 1 is done except for the right-coefficient monomial basis", naming these declarations. The pin goes further than that snapshot: `clebschGordanEquiv` (`UqSl2/ClebschGordan/Basic.lean:326`) proves the §8.5 decomposition with the README's `α_i` recurrence, `clebschGordanRecouplingEquiv` (`ClebschGordan/Recoupling.lean:135`) gives the 6j change of decomposition, `invariantForm` with `invariantForm_pos` and `invariantForm_k_pos` (`UqSl2/LadderModule/InnerProduct.lean:78`, `:115`, `:265`) is §8.6's metric with the same `h_j/h_(j−1)` formula and `E* = KF`, `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`UqSl2/QuantumTrace.lean:41`) is §8.5's spherical identity, `ClassicalLadder.equivSl2Std` (`UqSl2/ClassicalSpecialization.lean:664`) is §8.7's Lie-module comparison, and `TauCeti.FiniteHopfModuleCat` exists with `Monoidal.lean`, `RightRigid.lean`, `Rigid.lean` and `Pivotal.lean` (`TauCeti/Algebra/Category/FiniteHopfModuleCat/`, the pivot from a group-like `g` with `S² = Ad(g)` exactly as §8.5 specifies). So the docstring's claim at `:35`–`:39` that Layer 8's comparisons "need the constructed Hopf-module monoidal/rigid structures and actual ladder-module family" is false at the pin. Nothing in `TauCeti/QuantumGroups/UqSl2/` mentions a pentagon, so the Biedenharn–Elliott identity of §8.5 is the one Layer 8 headline the pin does not prove.

These modules had no object files in the shared build directory; `lake build TauCeti.QuantumGroups.UqSl2.TypeOne TauCeti.QuantumGroups.UqSl2.Center TauCeti.QuantumGroups.UqSl2.ClebschGordan.Recoupling TauCeti.QuantumGroups.UqSl2.LadderModule.InnerProduct TauCeti.Algebra.Category.FiniteHopfModuleCat.Pivotal` from the worktree completed in 35 s (7539 jobs, almost all cached), after which a scratch file importing them elaborated and `#check` printed, for instance, `UqSl2.pbwBasis : (q : ℂ) → [Fact (q ≠ 0)] → Module.Basis (ℕ × ℤ × ℕ) ℂ (UqSl2 q)` and `UqSl2.existsUnique_linearEquiv_ladderModule : … IsGenericQuantumParameter q → ∃! p, Nonempty (UqSl2.LadderModule q p.1 p.2 ≃ₗ[UqSl2 q] V)`.

The same private block, with small differences, is on main and at #1705's head `0d7cbcc` (`QuantumSL2` at its `Suggested.lean:196`), so the defect predates this pull request; it is reported here because the file is reviewed as a whole and the content pin has carried these natives since before the previous round.

**Repair (tested):**

1. In `Suggested.lean` delete lines 110–258 (the `GenericRankOne` section and `quantumInteger`). State on the native carriers the Layer 8 headlines the pin does not prove, with `import TauCeti.QuantumGroups.UqSl2.TypeOne` (and `…ClebschGordan.Recoupling` if the pentagon is stated): the local-finiteness characterization, which elaborates in this form on a scratch copy (`lake env lean`, exit 0, `sorry` the only warning):

   ```lean
   open TauCeti TauCeti.UqSl2 in
   theorem uqSl2_locallyFinite_iff (q : ℂ) (hq : IsGenericQuantumParameter q)
       (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (UqSl2 q) V]
       [IsScalarTower ℂ (UqSl2 q) V] :
       IsLocallyFiniteModule ℂ (UqSl2 q) V ↔ IsSignedTypeOne q V ∧
         (∀ v : V, ∃ n : ℕ, e q ^ n • v = 0) ∧ (∀ v : V, ∃ n : ℕ, f q ^ n • v = 0) := by
     sorry
   ```

   and the Biedenharn–Elliott pentagon on quadruple tensor products of `LadderModule`s, written with `clebschGordanRecouplingEquiv` and the tensor associator; if the author judges that identity not cleanly statable with the native recoupling data, the docstring says so and names `clebschGordanRecouplingEquiv` as the carrier it would need. Rewrite the docstring's Layer 8 bullet accordingly (the compact comparison of §8.6 still needs analytic SUq(2); the classical comparison is proved at the pin).
2. In the README, remove or replace every backticked Lean name of the deleted block (`QuantumSL2`, `SL2Generator`, `QuantumSL2Relation`, `quantumSL2Generator`, `quantumSL2KUnit`, `quantumSL2PBW_exists`, `quantumSL2_domain`, `quantumSL2Comul_exists`, `quantumSL2Casimir`, `quantumSL2_center`, `quantumSL2_finite_semisimple`, `quantumSL2_simple_classification`, `QuantumSL2LocallyFinite`, `QuantumSL2SignedWeights`, `quantumSL2_locallyFinite_iff`, `quantumSL2_locallyFinite_semisimple`, `quantumInteger`), since the gate reads each as a claim that `Suggested.lean` declares it; where a name is kept as a headline label, use the new native-carrier name. Add to Scope (the only place that says "already in the library") one paragraph: Layer 8's algebra, PBW basis, domain, center, ladder modules, classification, complete reducibility, local finiteness, Clebsch–Gordan and recoupling maps, invariant metric, quantum traces and classical specialization are in Tau Ceti under `TauCeti/QuantumGroups/UqSl2/` and `TauCeti/Algebra/Category/FiniteHopfModuleCat/`, by the names above; Layer 8's prose remains the specification they implement. Add a `From Tau Ceti` sentence naming `TauCeti.UqSl2`, `TauCeti.UqSl2.LadderModule`, `TauCeti.quantumInteger`, `TauCeti.FiniteHopfModuleCat` and `TauCeti.OreExtension` (`TauCeti/Algebra/OreExtension/Basic.lean:120`, with `skewPolynomialEquiv` at `SkewPolynomial.lean:148` for §8.1's δ=0 comparison).

## R02 (P3) — `StarCompatibleHopf` duplicates the native `TauCeti.StarCoalgebra`; §§3.1 and 4.1 restate native Hopf-star and cancellation theorems

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:54`–`:57`, `:76`, `:105`; `TauCetiRoadmap/QuantumGroups/README.md:554` ("The predicate `StarCompatibleHopf` records star preservation of Δ"), `:556`–`:558` ("Prove ε star-preserving, S bijective and `S⁻¹(a)=S(a*)*` from these axioms"), `:752` ("Prove the algebraic cancellation maps and their antipode inverses").

**Claim:** what the pinned Tau Ceti states is cited, not restated.

**Witness:** `class TauCeti.StarCoalgebra (R A) … : Prop` with the single field `comul_star (a : A) : comul (star a) = star (comul a)` is `TauCeti/Algebra/Coalgebra/Star.lean:46`–`:49`, the same axiom as `StarCompatibleHopf.comul_star`. On that class Tau Ceti proves `TauCeti.HopfAlgebra.antipode_star_antipode_star` (`S(S(a*)*) = a`, `TauCeti/Algebra/HopfAlgebra/Star.lean:65`), `star_antipode_star_antipode` (`:81`) and `antipode_bijective` (`:85`), and `TauCeti/Algebra/HopfAlgebra/Cancellation.lean` constructs `comulMulRightEquiv` (`:72`) and `leftMulComulEquiv` (`:149`) with the span statements (`:97`), i.e. §4.1's cancellation maps with their antipode inverses. A scratch copy of `Suggested.lean` with the class deleted, `[TauCeti.StarCoalgebra ℂ A]` in place of `[StarCompatibleHopf (A := A)]` in both theorems and `import TauCeti.Algebra.Coalgebra.Star` elaborates (exit 0, `sorry` the only warning).

**Repair:** make that substitution in `Suggested.lean`; in the README replace `:554` by "Star preservation of Δ is native `TauCeti.StarCoalgebra`", cite `TauCeti.HopfAlgebra.antipode_bijective` and `antipode_star_antipode_star` at `:556`–`:558` instead of proving them, and cite `TauCeti.HopfAlgebra.comulMulRightEquiv` and `leftMulComulEquiv` at `:752`. List the three files in the `From Tau Ceti` paragraph.

## R03 (P3) — §0.2 cites TemperleyLieb Layer 4 for an identification of "the categorical trace with the Markov trace" that Layer 4 does not state

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:231`–`:233` ("this trace radical is the degree-n part of TemperleyLieb Layer 6's negligible ideal by TemperleyLieb Layer 4's identification of the categorical trace with the Markov trace") and the supplier row `:90` ("the Markov trace and its comparison with the categorical trace (Layer 4)").

**Claim:** a supplier is cited for a statement it makes.

**Witness:** TemperleyLieb on main, Layer 4 (`README.md:545`–`:605`) defines the diagrammatic Markov trace `tr̂` by right closure, proves its uniqueness (`IsMarkovTrace`, `existsUnique_isMarkovTrace`) and compares it with Tau Ceti's `markovTrace` (`:599`–`:604`); the string "categorical trace" occurs nowhere in that README, and its Scope says the pivotal and spherical API "is not built here" (`:47`–`:52`). Layer 6 defines the negligible ideal directly by `tr̂` (`:720`). The identification §0.2 needs is therefore Subfactors 3.2's closure trace `T_n` with `tr̂`, which is Layer 4's comparison with Tau Ceti's `markovTrace` (the carrier Subfactors 3.1 uses) plus uniqueness, not a categorical-trace theorem.

**Repair:** at `:232`–`:233` write "by TemperleyLieb Layer 4's uniqueness of the Markov trace, which identifies Subfactors 3.2's closure trace with the trace `tr̂` defining Layer 6's negligible ideal", and in the row at `:90` replace "its comparison with the categorical trace" by "its uniqueness and comparison with Tau Ceti's `markovTrace`".

## R04 (P3) — Two open revisions of this folder with no stated order

**Location:** the pull request description (`scratch/pull-request.md`, data) and the folder as a whole.

**Claim:** when two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which.

**Witness:** the overlap listing: "#1705 … #1649 and #1705 conflict in `TauCetiRoadmap/QuantumGroups/README.md`, `TauCetiRoadmap/QuantumGroups/Suggested.lean`". At #1705's head `0d7cbcc` the README differs from this head by 655 diff lines (its Layer 0 keeps three sections and builds the unitary Temperley–Lieb category in a §0.3; its supplier table cites VonNeumannAlgebras V13b.SpatialNorm and CStarAlgebras §§1.7–1.8, 5.1–5.2 in a different shape), and its `Suggested.lean` carries its own `QuantumSL2` (`:196`) with a different `quantumSL2Comul_exists`. The description of this pull request names neither #1705 nor an order. Re-raised from the previous review's R07, reason unchanged.

**Repair:** state in the description which of the two is rebased on the other (or close one), and rebase so that one head carries one Layer 0, one supplier table and one `Suggested.lean`; R01 above then applies once.

## Verified sound

**Gate, build and scope.** Head `ab56b1decbe542b5c2242a545a3acb0574a73a97`; the worker's gate reports every check at 0 (`depcheck=0`, `set_option=0`, `sorry-data=0`, `prnum=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `build=0`) and `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The branch's `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, identical to main's. `PROGRESS.md`, `STATUS.md` and `metadata.toml` in the folder are unchanged from main.

**Lean elaboration, signatures, padding.** `lake env lean` on `Suggested.lean` exits 0 with exactly 10 `declaration uses sorry` warnings (22.6 s). A scratch copy with `#check @name` for all 22 declarations elaborated (10 warnings, exit 0); each type agrees with `scratch/signatures.md` and with its README statement: complex scalars, `Nontrivial A` in `compactType_iff` (§4.1 "nonzero"), `IsSimpleOrder (TauCeti.Subcomodule ℂ A H)` in `schur_orthogonality` (§3.1 "finite irreducible"), `IsScalarTower ℂ (QuantumSL2 q) V` and `FiniteDimensional ℂ V` exactly where §§8.2–8.3 say finite-dimensional, no finiteness in the two local-finiteness theorems (§8.4 "arbitrary"). The binder the worker flagged, `[StarModule ℂ A]` dropped from `AlgebraicHaar`, is not needed by its fields; both theorems that use it carry it. **Padding probe:** every `sorry` replaced by `first | rfl | simp | infer_instance | exact trivial` on a scratch copy: all 10 fail (nine "Type mismatch", one unsolved goal at the classification theorem), so nothing closes in one tactic; the Layer 8 statements are nevertheless already proved at the pin (R01).

**Headline coverage.** Statable and stated: weighted Schur orthogonality (§3.1), compact-type characterization (§4.1), and the eight Layer 8 theorems, which R01 moves to the native carrier. Not statable and named in the docstring with the missing carrier: Haar existence and uniqueness, analytic corepresentations and Peter–Weyl, Hopf core and Plancherel and Tomita, completions and coamenability, SUq(2), O_F^+, Tannaka–Krein and commutative reconstruction, fusion and Haar laws. The pinned Tau Ceti has no compact-quantum-group, Haar-state, corepresentation, SUq(2) or free-orthogonal declaration (grep of `TauCeti/` for those names finds only docstring mentions in `UqSl2/Star.lean`, `Algebra/HopfAlgebra/Cancellation.lean` and `MatrixCoefficient/Matrix.lean`), so those docstring claims are correct. The Layer 8 docstring claims are not (R01).

**Dependency check (unmodified output of the required command):**

```text
depcheck: 238 roadmaps, 2354 edges, 0 problem(s)
```

QuantumGroups is on main and absent from `ORDER.txt`; no `moved:` line is printed.

**Ownership against open work, and the recorded move-down.** §0.1 states standard conjugate solutions, intrinsic dimension and signed self-dualities, and §0.2 the signed Temperley–Lieb comparison; CategoricalOperatorAlgebras at `7a2845fd` (`README.md:39`–`:44`, `:1956`–`:1958`) and TemperleyLiebOperatorAlgebras at `7cf3fee` (`README.md:137`, `:1777`–`:1787`) claim those objects as their "single home" and name QuantumGroups as consumer. Both are later in the merge order (lines 226 and 242) than this on-main roadmap, which the dependency check places first, so citing them is UPWARD (the previous review's R01, now resolved in this direction). Under the brief's rule the notions move down into this roadmap and the citation runs from the later owner: the repair belongs to #888 and #867 (re-point CA1a/CA2a and TLOA 2.1/3.3 to QuantumGroups §§0.1–0.2 once a head of this folder merges), not to this folder; Scope here already names them as later owners with nothing imported. The other vocabulary neighbours (VonNeumannAlgebras, OperatorAlgebraDynamics, NoncompactQuantumSymmetry) are on main or build no compact quantum groups. Ownership against open pull requests whose files the brief does not list was not checked beyond #1705 (R04).

**Supplier citations resolved (every row of the table, every contract paragraph, every `*Needs:*` line), on main at `13665dd` unless stated.**

| Citation | Resolved at |
| --- | --- |
| CStarAlgebras C1.CommutativeMultiplierMorphisms (pullbacks, nondegeneracy, properness, composition through the §1.7 extension); C1.7 strict topology and `M(C₀(X)) = C_b(X)`; C2.1 state extension; C3; C4.1 multiplicative domain; C5.1–C5.2 (`C₀(X)⊗min A ≅ C₀(X,A)`, compact `C(X)⊗C(Y)≅C(X×Y)`); C8.4 Toeplitz with symbol of `S` the coordinate `z` | `CStarAlgebras/README.md:497`–`:507`, `:468`–`:478`, `:544`, `:886`, `:986`–`:1000`, `:1112`, `:1143`–`:1154`, `:1676`–`:1682` |
| VonNeumannAlgebras Layer 0; Layer 1 (bicommutant, Kaplansky); Layer 3 (finite-dimensional algebras, commutant and multiplicity); V4.Core, V4.PositivePredual, V4.Normality; V10.ModularTheory, V10.KMS; Layer 11 (full left Hilbert algebra, full closure, canonical weight) | `VonNeumannAlgebras/README.md:275`, `:392`/`:477`, `:905`/`:913`/`:933`, `:972`, `:1059`, `:1124`, `:2364`, `:2459`, `:2785`/`:2794`–`:2801`/`:2846` |
| HilbertModules H1 (`H⊗A`, the `a_n=p_n/√(n+1)` example), H2 (`L_A(E)≅M(K_A(E))`, strict topology on bounded sets, `K_A(H⊗A)≅K(H)⊗min A`, `L_A(H⊗A)≅M(K(H)⊗min A)`), H3 (interior tensor, Gram positivity, associating and unit unitaries) | `HilbertModules/README.md:126`/`:165`, `:179`/`:203`–`:213`, `:262`–`:276` |
| TemperleyLieb Layers 0–7, `TLCat.lift`/`TLCat.lift_unique` with hypothesis `η_ V V ≫ ε_ V V = δ • 𝟙`, Markov trace and uniqueness, negligible ideal, Karoubi envelope, Clebsch–Gordan, root-of-unity quotient | `TemperleyLieb/README.md:254`, `:333`, `:459`–`:470`, `:545`–`:604`, `:680`/`:720`, `:767`, `:885` (R03 for the wording at Layer 4) |
| Subfactors 3.1–3.3, trace radical, `markovTrace_nonneg_iff`, `jonesLoopParameters = {2cos(π/m)} ∪ [2,∞)`, pullback criterion (compatible *-homomorphisms with positive tracial functionals; injectivity not needed) | `Subfactors/README.md:676`, `:697`, `:726`–`:732`, `:752`–`:754`, `:774` |
| OperatorTheory/SelfAdjointSpectralTheory Part B | `README.md:252` |
| RepresentationTheory/CompactGroups, `su2Irrep`, `matrixCoeff π v w = ⟪π g v, w⟫` (so §1.2's conjugation crosswalk is right) | `README.md:271`–`:273`, `:400`–`:413` |
| RepresentationTheory/LieHighestWeight sl₂ worked example, `IsSl2Triple`, `sl (Fin 2) K` | `README.md:181`–`:188`, `:319`, `:1536` |
| OperatorAlgebraDynamics D1–D2, Reiter P₁/P₂ | `README.md:148`, `:221`, `:258`–`:261` |
| FreeProbability F1, F3 (`2√3 < 4`), F6 | `README.md:127`, `:255`/`:306`–`:307`, `:532` |
| AmenableGroups Layers 1, 5, 7 | `README.md:98`, `:289`, `:415` |
| PivotalSpherical Layers 0–2, 7; `leftTrace`/`rightTrace`; `RigidCategory (FDRep k G)` built from a genuine `LeftRigidCategory (FGModuleCat K)` | `README.md:257`, `:283`, `:318`/`:329`–`:330`, `:477`/`:486`–`:491` |
| Kustermans–Vaes Definition 2.1 | `kustermansvaes` line 743, p.853 |
| Downstream: QuantumEnvelopingAlgebras QEA1 (rank-one comparison), HopfologicalAlgebra §2.1 (cites "Q8 item 5") | `QuantumEnvelopingAlgebras/README.md:27`, `:323`; `HopfologicalAlgebra/README.md:317`–`:331` |
| Mathlib at the pin: `PositiveLinearMap.GNS` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:147`), `gnsStarAlgHom` (`:246`), `orthogonalComplement_iSup_eigenspaces_eq_bot` and `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean`), `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean`), `WithConv` (`Algebra/WithConv.lean`), `SkewPolynomial` with the `MulSemiringAction (Multiplicative ℕ)` convention (`Algebra/SkewPolynomial/Basic.lean:24`–`:48`), `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean:37`), `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`), `ModuleCat.restrictScalars` (`Algebra/Category/ModuleCat/ChangeOfRings.lean:85`), `Rep.equivalenceModuleMonoidAlgebra`, `HopfAlgebra.antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean`), `ExactPairing`, `IsSl2Triple` (`Algebra/Lie/Sl2.lean`), `ObjectProperty.FullSubcategory`, `det_vandermonde` | all present |
| Tau Ceti at the pin: `TauCeti.Comodule.coefficientMatrix` (`MatrixCoefficient/Matrix.lean:69`), `Subcomodule` (`Subcomodule/Basic.lean:73`), `IsCompletelyReducible` (`Comodule/LinearlyReductive.lean:126`), `fixedSubcomodule`, `convolutionAction`, `matrixComodule`, `Finite/Monoidal`, `Finite/RightRigid` (any `Semiring H`, `instRightRigidCategory` `:246`), `Finite/Rigid` (`CommSemiring H`, `:43`–`:47`), `TauCeti.HopfAlgebra.antipode_antipode` (commutative, `Algebra/HopfAlgebra/Antipode.lean:91`) and `antipodeAlgEquiv` (`:100`), `FDRep.ofShrink` (`RepresentationTheory/FDRep/Basic.lean:314`) | all present |

**Sources read (legal copies in the cache; locators as `<id> line N`).** `kustermansvaes` 743–744 (Definition 2.1: nondegenerate `Δ : A → M(A⊗A)` with `(Δ⊗ι)Δ = (ι⊗Δ)Δ`, p.853). `longoroberts` §2 heading 123 (p.4), §3 heading 365 (p.10, restricted to irreducible unit, which §0.1's "simple unit" supplies), Lemma 3.3 389–391, Theorem 3.8 621–625, Theorem 3.11 681–699 (`R*R·R̄*R̄ ≥ d(ρ)²`, equality iff a multiple of `R` is standard, p.17), Appendix 2000 (p.48). `nt` §2.2 runs from printed p.29 (PDF 33, line 1284), §2.5 at printed pp.52–53 with `R̄ = −τR`, `−τ(R*⊗ι)(ι⊗R) = ι` (2426–2438), so the README's "their sign parameter is −ε" is right. `banica` Theorem 1 42–46 (p.2), Proposition 1 54–57, Lemma 1 65, relations (1)–(3) with `β = c⁻²‖E(1)‖⁴` 70–72, Proposition 2 75–77. `malacarne` Theorem 1.1 52 (p.2), Lemma 1.2 127, Lemma 2.1 183 (pp.3–4), Lemma 3.1 235 (p.4), Theorem 4.1 285–291 (p.5; essentially small, conjugates, closed under finite sums and subobjects, unitary fiber functor; Hopf *-algebra unique up to isomorphism). `virelizier` §2.3 348–357 (p.8: relations, coproduct, antipode as in §8.1), Proposition 2.4 358 (`S² = K⁻¹(·)K`, spanning by `F^mK^nE^p`), Lemma 2.3 265 (p.6), §3.2 529–536 (p.11, type 1 by `K`-eigenvalues `q^n`), Example 3.3 552–554, Proposition 3.7 585–593 and Corollary 3.8 594 (p.12), Theorem 3.13 625 and Corollary 3.14 635 (p.13), Proposition 4.1 644 (p.13) with the normalized basis `w_i = F^i w_0/(i)_q!` at 639–642. `bmt` Theorem 2.2 257 (p.6), Theorem 2.8 461 (p.10), Corollary 2.9 478 (p.11), Theorem 2.12 614–619 (p.13, `0<|q|<1`, with `ϕ(α)e_{n,k} = c_n e_{n−1,k}`, the `a₀ = S*D` of §7.1), Corollary 2.13 645 (p.14), Theorem 3.6 858–865 (pp.18–19). `egno` Chapter 5 heading 4752 (p.91). `hiai`, `penneys`, `landsman` are no longer cited.

**Computed adversarial table.** `q = 1/2` unless stated; `u = [[a, −qc*],[c, a*]]` with indices 0, 1; `F = [[0,1],[−2,0]]` for O_F^+; "pass" means both sides agree on the instance. Rows cover the seeded sample (1.2, 2.2, 2.3, 3.2, 3.3, 4.1, 4.2, 5.1, 5.2, 6.2, 6.3, 8.1, 8.3, 8.4, 8.6), the headlines, and every passage a finding or a repair touches (0.1, 0.2, 1.1, 3.1, 8.2, 8.5, 8.7).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 C*-norm identity | `T = diag(2,1)`; Hilbert–Schmidt instead | `‖T†T‖ = 4 = ‖T‖²`; HS gives `√17 ≠ 5` | pass | none |
| 0.1 idempotent versus projection | `[[1,1],[0,0]]` | `A*A = [[1,1],[1,1]]`, eigenvalues 2, 0, norm `√2`, not self-adjoint; range projection `diag(1,0)` | pass | none |
| 0.1 minimal norm product | ℂ², `(2R, R/2)` with `R = Σ e_i⊗e_i` | zigzags identity; squared norms 8 and 1/2, product 2 = d; not standard | pass (LR 3.11) | none |
| 0.1 non-minimal pair | `R = 2e₀⊗e₀+e₁⊗e₁`, `R̄ = ½e₀⊗e₀+e₁⊗e₁` | `r_js_j = 1` both j; `‖R‖² = 5`, `‖R̄‖² = 5/4`, product 5/2 > 2; rescaling keeps 5/2 | pass | none |
| 0.1 fiber functor and standardness | SUq(2) fundamental | `d = q+q⁻¹ = 5/2`, Hilbert dimension 2; forgotten product 5/2 > 2 | pass | none |
| 0.1 sign under the forgetful functor | SU(2) cup `e₀⊗e₁−e₁⊗e₀` | `(R*⊗1)(1⊗R)e₀ = −e₀`: ε = −1; symmetric cup ε = +1, not invariant; `J² = −I` versus conjugation `I` | pass | none |
| 0.2 d = 1 kernel | `X = ℂ`, `R = 1` | `Φ_R(e) = 1`, `Φ_R(f₂) = 0`, `T₂(f₂) = δ²−1 = 0`; `Q₂ = ℂ`; `TL(1,0) = 0` while `Hom(X,1) = ℂ`: not full | pass | none |
| 0.2 SU(2) loop | `R` as above, δ = −2 | `Φ_R(e) = −RR*`, `e² = RR*RR* = 2RR* = −2e = δe`; `p = RR*/2` | pass | none |
| 0.2 sign map and traces | one and two strands; δ = −5/2 | `T₁^(d)(1) = d = −T₁^(−d)(1)`; `T₂^(d)(se) = −d = T₂^(−d)(e)`, `T₂(1) = d²` both; `k+c ≡ n (mod 2)` from the word count; normalized trace of `p`: `δ⁻²·δ/δ = 4/25` both signs | pass | none |
| 0.2 pullback criterion applies | ε = +1 and ε = −1 | `σ_n = d⁻ⁿ εⁿ R_n*(·⊗1)R_n` on the image of `Φ_R` (resp. `Φ_R∘s⁻¹`): `σ_n∘ρ_n = d⁻ⁿ T_n^(d)` after `(−1)ⁿ(−1)ⁿ = 1`; positive, tracial on the image | pass (Subfactors `:752`) | R03 (wording only) |
| 0.2 d = 3/2 excluded | quantum integers | `[2] = 3/2`, `[3] = 5/4`, `[4] = 3/8`, `[5] = −11/16 < 0`; `√2 < 3/2 < (1+√5)/2` | pass | none |
| 0.2 Rep(SU(2)) | `r = 0,1,2` at δ = −2 | `T_r(f_r) = 1, −2, 3`; dimensions `1, 2, 3 = εʳT_r(f_r)` | pass | none |
| 1.1 trivial group; `G = ℤ` | `f = 2+i`; `f = 1[0]` | `Δf = εf = Sf = 2+i`, both inverse composites `2+i`; `Δf(m,n) = 1[m+n=0]`, value 1 at every `(N,−N)`, not `C₀(ℤ²)`, norm 1; `r_±Δf ≡ 1`; `(id⊗ε)Δf = f` | pass | none |
| 1.1 `C₀(X,C₀(Y)) ≅ C₀(X×Y)` | `H = 1[m+n=0]` on ℤ²; `e^{−x²−y²}` and `e^{−(x−y)²}` on ℝ² | slices `1[−m]` of constant norm 1: in neither space; Gaussian: slices `C₀`, `‖H(x,·)‖ = e^{−x²} → 0`, both sides; `e^{−(x−y)²}`: slice norms ≡ 1, value 1 on the diagonal, in neither | pass both directions | none |
| 1.1 order; elementary tensors | `S₃`, `g=(12)`, `h=(23)`, `f=1[(123)]`; `a=1[1]`, `b=1[−1]` | `gh = (123)`: `Δf(g,h) = 1`; `hg = (132)`: 0; `d(a⊗b) = ab = 0`, `r₊ = aS(b) = 1[1]`, `r₋ = S(a)b = 1[−1]`, `S² = id` | pass | none |
| 1.1 bi-C*-algebra axioms | `(C₀(G), Δ)` | `Δ` nondegenerate by C1.8 with `h = m`, `(Δ⊗id)Δ(f) = f((gh)k) = f(g(hk)) = (id⊗Δ)Δ(f)` | pass (KV Def 2.1) | none |
| 1.2 Haar versus evaluation; cancellation | `C(C₂)`; monoid `{1,0}` | `h(1[e]) = 1/2 ≠ 1`; `Δf(0,1) = Δf(0,0) = f(0)`: span of `Δ(A)(A⊗1)` has dimension 3 < 4 | pass | none |
| 1.2 group algebra | `ℂΓ`; `Γ = ℤ` | `h(u_g) = δ_{g,e}`, convolution the same; `W(δ₁⊗δ₂) = δ₁⊗δ₃`; `W(λ₁⊗1)W*(δ₁⊗δ₂) = δ₂⊗δ₃ = (λ₁⊗λ₁)(δ₁⊗δ₂)` | pass | none |
| 2.1 Checks | ℂ, `H = 0`; `C₂` sign; `S₃` | `U = 1`; `0 ≠ 1`; `(−1)² = 1 ≠ −2`; `u₁₃(gh) = 1`, `u₁₃(hg) = 0` | pass | none |
| 2.2 unitarization | `U(s) = [[1,2],[0,−1]]` | `U² = I`; `U*U = [[1,2],[2,5]]`; `T = [[1,1],[1,3]]`, det 2; `TU = [[1,1],[1,−1]]`, `U*TU = T` | pass | none |
| 2.2 noninvertible; trivial | `U = 0` on ℂ; `U = 1` on ℂ² | `T = 0`, no inverse; `T = I`, multiplicity 2 | pass | none |
| 2.3 regular multiplicities | `C₂`; `S₃`; trivial | `1+1 = 2`; `1+1+4 = 6`; `δ_hΛ(2) = 2⊗1` | pass | none |
| 3.1 `schur_orthogonality` | SUq(2), `F̃ = diag(2,1/2)`, `Tr = 5/2` | `h(a*a) = (1/2)/(5/2) = 1/5`, `h(c*c) = 2/(5/2) = 4/5 = (1−q²)/(1−q⁴)`; `h(aa*) = 4/5 = 1 − q²·4/5`; mixed `h(a*c) = (F̃⁻¹)₀₁/Tr = 0` | pass | none |
| 3.1 normalization; degenerate | character; `H = 0` | `F̃ = 1`; `2 ≠ 1/2`; `H = 0`: `IsSimpleOrder` false | pass | R02 (class only) |
| 3.2 Plancherel, characters, Vandermonde | `a+c`; `f_z(a) = 2^z`; `λ = 1,2` | `1/5+4/5 = 1`; `θ(u) = FuF`: `θ(a) = 4a`, `f₁*f₁(a) = 4 = f₂(a)`; `[[1,1],[1,4]]` det 3 | pass | none |
| 3.2 modular identity | `h(ab) = h(bθ(a))`, `a = a`, `b = a*` | `h(aa*) = 4/5 = 4·h(a*a) = h(a*θ(a))` | pass | none |
| 3.3 traces and Kac | `F = I₂`; `F = diag(2,1/2)` | 2 = 2; `5/2 = 5/2 > 2`; `tr(F·diag(1,0)) = 2`, `tr(F⁻¹·diag(1,0)) = 1/2`; `Tr F = Tr F⁻¹ ≥ n`, equality iff `F = I` (AM–GM) | pass | none |
| 3.3 `S²` and `F` | `S(c) = −qc`, `S(c*) = −q⁻¹c*` | `S²(c) = q²c = c/4 = (FuF⁻¹)₁₀` | pass | none |
| 3.4 modular and scaling groups | `f_z*u*f_w = F^w u F^z` | `σ_t(a) = 4^(it)a`, `σ_(−i)(a) = 4a`, `h(a*σ_(−i)(a)) = 4/5 = h(aa*)`; inverse convention 1/20; `τ_t(c) = 4^(−it)c`, `τ_(−i)(c) = c/4 = S²(c)`; `σ_t(c) = c` | pass | none |
| 4.1 `compactType_iff` | ℂ; `ℂ[C₂]`; zero ring; `ℂ[x]` primitive | both sides; `h((a+bu)*(a+bu)) = |a|²+|b|²`; `Nontrivial` excludes 0; `x+h(x)·1 = h(x)·1` forces `x = 0` | pass both directions | R02 (class only) |
| 4.2 regular unitary and norms | `Γ = ℤ`; ℂ; `C₂`, `1+u` | `(1,2,3) ↦ (1,3,6)` on both pentagon words; `√5` both; C*-norms 2, Haar norm² 2, `√2 ≠ 2` | pass (BMT 3.6) | none |
| 4.3 coamenability criteria | ℤ; `F₂`; reduced `F₂` | `2/(2N+1) → 0`; `2√3 < 4 = ε(adjacency)`; `h_r` faithful, `ε_r` unbounded | pass (BMT 2.2, 2.8, 2.9) | none |
| 5.1 relations; antipode | `(a,c) = (1,0)`; `(0,1)` at `q = 1`, `1/2` | `u = I₂`; `[[0,−1],[1,0]]` unitary; `aa*+q²c*c = 1/4 ≠ 1`; `S²(c) = c/4` | pass | none |
| 5.2 O_F^+ data | `F = [[0,1],[−2,0]]` | `FF̄ = −2I`; `E(1) = −2e₀⊗e₁+e₁⊗e₀` (Banica 56–57), norm² 5; normalized zigzag `−I`; `5/2 ≥ 2 = n`, `Tr F*F = 5 > 4 = n|c|`; `J(e₀) = −√2e₁`, norm² 2; `n = 1`: `u* = u`, `u² = 1` | pass | none |
| 6.1 reconstruction Checks | `Hilb_f`; `Rep(C₂)`; `Rep(S₃)` | ℂ; dimension 2 versus 1; `1+1+4 = 6` versus 4; Malacarne 4.1 hypotheses as cited | pass | none |
| 6.2 truncations; generators | `H = 0`; `H = ℂ`; characters `z, w` | quotient ℂ; `A_(≤1)` dimension 2; `{z,w}` contains `zw`; Malacarne 1.2 uses finite-dimensional bicommutants (VNA Layer 1) | pass | none |
| 6.3 cancellative semigroups | `C₂`; `{1,0}`; `{e} → C₂` | bijective translations; `0·1 = 0·0`, `1 ≠ 0`; `(a,b) ↦ a` | pass | none |
| 7.1 Haar of `c*c`; `q = −1` model | `q = 1/2`; `q = ±1`; `σ₃σ₁ = −σ₁σ₃` | `4/5`, `(1−q²)/(1−q⁶) = 16/21`; `∫t = 1/2`, `∫t² = 1/3`; `ac = −ca`, `a*a+c*c = (1−t)+t = 1`; at `t = 0, z = 1`: `a = σ₃`, `c = 0`, value 1 on the `+1` eigenspace; `a₀ = S*D` with `D e_n = c_n e_n`, `c_n → 1` (BMT 616–619) | pass | none |
| 7.1 fusion dimensions | `r₁⊗r₁` | `2·2 = 1+3`; `(5/2)² = 25/4 = 1+21/4`, `[3] = 1/4+1+4` | pass | none |
| 7.2 sign, loop, β, recurrences | `F` above; `n = 2, 3, 1` | `c = −2`, `d = 5/2`, `δ = −5/2`, `β = (1/4)·25 = d²`; Hilbert `1,2,3,4`; intrinsic `1, 5/2, 21/4, 85/8`; `ε(χ) = 3 ∉ [−2,2]`; `m₂ = 1, m₄ = 2` versus `1, 1`; `|q|+|q|⁻¹ = 5/2` gives `q = 1/2`, `sign(q) = +` | pass; Banica Thm 1 "n ∈ ℕ" (source issue) | none |
| 8.1 relations and quantum integers | `q = 1/2` | `q−q⁻¹ = −3/2`; `[2] = 5/2`, `[−2] = −5/2`, `[0] = 0`; `KF = 4FK = q^(−2)FK`; `q = 0`: `E = F = 0`; `q = ±1`: commutative | pass; native `TauCeti.quantumInteger` identical | R01 |
| 8.1 coproduct and Casimir | symbolic | `ΔK = K⊗K`, `ΔE = E⊗1+K⊗E`, `ΔF = F⊗K⁻¹+1⊗F` = Virelizier 355 = native `comul_e/f/k`; `Ω = FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)²` = native `casimir` | pass | R01 |
| 8.2 ladders | `L₂⁺`; `L₁⁻`; `L₁⁺` | weights `1/4, 1, 4`; `F: 1, 5/2, 0`; `E: 0, 5/2, 1`; `EF−FE = diag(5/2, 0, −5/2) = [2−2j]`; `L₁⁻`: `K = −diag(1/2,2)`, `EF−FE = diag(−1,1) = (K−K⁻¹)/(q−q⁻¹)`; `L₁⁺`: `diag(1,−1)` | pass; Virelizier Ex 3.3 rescaled by `[j]!` | R01 |
| 8.3 Casimir scalars and splitting | `m = 0,1,2`; `L₁⁺`; `L₀⁻⊕L₁⁺` | `(q−q⁻¹)² = 9/4`; scalars `10/9, 17/9, 65/18`, negated for ε = −1, six distinct; on `L₁⁺`: `FE = diag(0,1)`, toral `diag(17/9, 8/9)`, sum `(17/9)I`; blocks `−10/9, 17/9` | pass; native `isSemisimpleModule_of_finiteDimensional` | R01 |
| 8.4 local finiteness | `L₀⁻`; `⊕ℕ L₀⁺`; Verma λ = 1; `V = 0` | `K = −1 ≠ 2^(−z)`; cyclic dimension 1, total infinite; weights `q^(−2j) = 4^j`, `F` not nilpotent; both sides on 0 | pass; native `IsSignedTypeOne`, `isLocallyFiniteModule_of_isWeightModule` | R01 |
| 8.5 Clebsch–Gordan; `Δ(E²)`; pivot | `m = n = j = 1`; `r = 2`; `g = K⁻¹` | `α₁ = −q = −1/2`; `ΔE(v₀⊗v₁ − ½v₁⊗v₀) = (½−½)v₀⊗v₀ = 0`; middle coefficient `1+q² = q[2] = 5/4` (not `q⁻¹[2] = 5`); `tr K⁻¹ = tr K = 5/2` on `L₁⁺`, `−1` on `L₀⁻` | pass; native `clebschGordanEquiv`, `trace_lsmul_k…` | R01 (docstring) |
| 8.6 compact form | `m = 1` | `h₁ = q = 1/2`; `⟨Ev₁,v₀⟩ = 1 = ⟨v₁, 2Fv₀⟩`: `E* = 2F = KF` (with `h₁ = 1`: `F`); orthonormal entries `√2`, `1/√2`; commutator `diag(1,−1)` | pass; native `invariantForm` with the same ratio | R01 (docstring) |
| 8.7 specialization | `v = 1`, `m = 1, 2` | `[E,F] = diag(1,−1)`, `[H,E] = 2E`; `m = 2`: `diag(2,0,−2)`; `[2]_v → 2` versus totalized `0` | pass; native `equivSl2Std` | R01 (docstring) |
| Lean generality | all 22 `#check` types | binders match the README; `hq` unused in `quantumSL2Comul_exists` (native needs only `Fact (q ≠ 0)`); `hgeneric` unused by PBW's truth (native `pbwBasis` needs only `Fact (q ≠ 0)`) | pass | R01 |

## Not verifiable

- **Timmermann, *An Invitation to Quantum Groups and Duality*** (Definitions 5.1.1, 5.1.4, Theorem 5.1.6, Theorem 5.3.3, Propositions 5.3.7–5.3.8, Theorems 5.4.1, 5.4.3, 5.4.5, Propositions 2.2.4, 3.2.9, 3.2.17, Theorems 3.2.12, 3.2.19, Remark 2.2.2(iv)(c), Chapter 6 §2): settled uncertified in the manifest (DOI 10.4171/043, subscription only). These locators carry the seeded targets 1.2, 2.2, 2.3, 3.2, 3.3 and parts of 4.1, 5.1, 7.1 and 8.6; their mathematics was checked in the table against Bédos–Murphy–Tuset, Virelizier, Neshveyev–Tuset and the standard SUq(2) values.
- **Takesaki, *Theory of Operator Algebras II*** and **Jones 1983**: settled uncertified; no longer cited directly by this head (the Tomita material is consumed from VonNeumannAlgebras Layer 11).
- **Generality beyond the computed instances**: the table does not prove the nonseparable Peter–Weyl theorem, Tannaka reconstruction or the Biedenharn–Elliott pentagon; those were assessed through their hypotheses, routes, owned inputs and the source readings above.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type classification holds for every n; it should be restricted to n ≥ 2 as in its abstract, since n = 1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says the displayed quantum numbers (t)_q for all integers t lie in the unit group; it should exclude t = 0, where the number is zero; affects nothing.
