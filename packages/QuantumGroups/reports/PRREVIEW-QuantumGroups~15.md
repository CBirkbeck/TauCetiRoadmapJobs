# Review of QuantumGroups (pull request #1705 at b4e4777)

**Verdict:** needs changes

:robot: Independent AI review, full (897 changed lines in the folder since `0d7cbcc`, the head review ~13 read; nothing outside it). Every passage was reviewed again, changed or not.

Four findings: three P2 (blocking) and one P3.

- **R01:** the branch still pins Tau Ceti `358314d4`, where none of the Layer 8 declarations the README and the module docstring now consume exist; the merged folder builds against main's `2fd255d9`, where all of them do. The repair is the merge review ~13 asked for, not an edit of the folder.
- **R02:** §§0.2–0.3 still have a second owner at the heads of CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras, and the other open revision of this roadmap settles ownership the opposite way.
- **R03:** carried: the conflicting revision #1649 has no stated order, and the title and description describe a different head.
- **R04:** the pivotal and spherical structure of finite `U_q(sl₂)`-modules, one of the three Layer 8 headlines of the Summary, is statable at main's pin and is neither stated in `Suggested.lean` nor named in its not-statable list.

The gate passes and the dependency check reports 0 problems. `Suggested.lean` elaborates with exactly four `sorry` warnings at this branch's pins and again at main's pins; the one-tactic padding probe closes nothing. All 15 seeded targets were checked; the Timmermann locators are under Not verifiable.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Other roadmaps are read on main (`c44dcc80`) or at the open head named. Sources are cited as `<id> line N` in the worker's cache.

## Previous findings (review ~13 at 0d7cbcc)

- **R01 (Layer 8 and `StarCompatibleHopf` restate Tau Ceti) — repaired in the folder, not in the branch.** `:60`–`:81` and §§8.1–8.7 now consume `TauCeti.UqSl2`, `TauCeti.OreExtension`, `TauCeti.FiniteHopfModuleCat` and the rest by name; `Suggested.lean` keeps four headlines, takes `hΔ` (the field `comul_star` of `TauCeti.StarCoalgebra`) and names the Layer 8 results as proved in Tau Ceti (`Suggested.lean:21`–`:32`). Step 1 of the repair, "rebase onto main, which brings Tau Ceti `2fd255d`", was not done: `lake-manifest.json` is unchanged, so the branch pins `358314d4`. This is R01 below.
- **R02 (§§0.2–0.3 owned twice) — half repaired.** `:33`–`:41` now declares §0.2 and §0.3 "the single home" and says CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 "consume these objects"; `:1769`–`:1775` lists them as consumers. The two other pull requests are unchanged on this point, and #1649 says the opposite. This is R02 below.
- **R03 (conflicting revision, stale description) — not repaired.** Same title and description; #1649 is open at `79e1cb6` and still conflicts in both files. Carried as R03.
- **R04 (`hgeneric` on PBW and domain) — repaired.** Both statements are gone; §8.1 `:1364`–`:1366` and `:1396`–`:1398` say PBW and the domain property hold for every `q ≠ 0`, and the q = i Check at `:1419`–`:1423` is added with the δ_E computation.

## R01 (P2) — The branch pins Tau Ceti `358314d4`, where nothing the README's Layer 8 and `From Tau Ceti` contract cite exists

**Location:**
- `lake-manifest.json` on this branch: Tau Ceti `358314d4`, Mathlib `f6090c70`, `lean-toolchain` `v4.35.0-rc3`; main: `2fd255d9`, `1b1ccf4b`, `v4.36.0-rc2`. The pull request touches neither file.
- `:60`–`:81` ("Layer 8's algebra is implemented in Tau Ceti and consumed here: `TauCeti.UqSl2` …"), `:166`–`:178`, §§8.1–8.7 (`:1341`–`:1752`), and `Suggested.lean:21`–`:32` ("Proved in the pinned Tau Ceti and not restated: the Layer 8 algebra `TauCeti.UqSl2` …").

**Claim:** the cited declarations exist in the pinned Tau Ceti.

**Witness:** at `358314d4` the directories `TauCeti/QuantumGroups/`, `TauCeti/Algebra/OreExtension/`, `TauCeti/Algebra/Category/FiniteHopfModuleCat/` and `TauCeti/CategoryTheory/Monoidal/Pivotal/` and the files `Algebra/Coalgebra/Star.lean`, `Algebra/HopfAlgebra/{Star,Cancellation,InverseAntipode}.lean` are absent (review ~13 R01 recorded this; unchanged). The README cites 138 distinct `TauCeti.*` names; 134 are declarations under those paths.

**Detail.** The gate's targeted build at this head cannot test any of them: `Suggested.lean` imports only the two comodule modules that exist at both pins, so `build=0` says nothing about the citations. At main's pin the citations are right: I put `#check @name` for all 138 names in one scratch file and elaborated it in a checkout at `2fd255d9`/`1b1ccf4b`: 134 resolve with the types the README describes (details under Verified sound), and the remaining 4 (`TauCeti.OreExtension.rightCoeffLinearEquiv`, `TauCeti.SphericalCategory`, `TauCeti.UqSl2.VermaModule.isSimpleModule_iff`, `TauCeti.UqSl2.VermaModule.ladderModuleEquivQuotient`) are in modules whose object files that checkout had not built; I read them in source at `Algebra/OreExtension/RightCoeff.lean:173`, `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`, `QuantumGroups/UqSl2/Verma/Submodule.lean:187` and `:301`. A copy of this head's `Suggested.lean` elaborates at main's pins with exactly the same four `sorry` warnings and nothing else.

**Repair:** merge `origin/main` into the branch (this takes main's `lake-manifest.json` and `lean-toolchain`, since the branch changes neither) and re-run the gate, so that the build and the citation check run against the pin the folder cites. No file of the folder changes. This is a worker step; the folder's content needs nothing for it.

**Tested:** the post-merge build above (`scratch/postmerge/Suggested.lean`, 4 warnings, exit 0) and the 138 `#check`s.

## R02 (P2) — §§0.2–0.3 are still built by CategoricalOperatorAlgebras (#888) and TemperleyLiebOperatorAlgebras (#867), and #1649 hands them the other way

**Location:** `:33`–`:41`, "Section 0.2 is the single home of C*-categories with their orthogonal sums … §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 come later in the build and consume these objects from §§0.2–0.3 rather than construct them a second time"; `:1769`–`:1775` (Downstream consumers).

**Claim:** §§0.2–0.3 have one owner, and the two named roadmaps consume them.

**Witness:**
- #888 (`7362bb7`), `README.md:41`–`:46`: C*-categories, their completions and examples (CA1a) and C*-tensor categories with conjugate solutions, standard solutions, intrinsic dimension, unitary dual functors and signed self-dualities (CA2a) "have their single home here"; `:48`–`:49`: the unitary Temperley–Lieb category "is TemperleyLiebOperatorAlgebras Layer 3, which consumes CA1a (3.2–3.3) and CA2a (3.3)".
- #867 (`ba43cc7`), `README.md:1270`–`:1373`: "Layer 3: The unitary Temperley–Lieb category", §§3.1–3.4 (quotient category and dagger, Hom positivity and norms, C*-tensor structure and unitary duality, envelopes and unitary fusion). Its README no longer mentions QuantumGroups at all.
- #1649 (`79e1cb6`), the other open revision of this roadmap, `README.md:30`–`:46`: "The general theory of C*-categories, their Karoubi completion, rigid C*-tensor categories, standard solutions, intrinsic dimension, unitary dual functors and signed self-dualities is owned later in the build by CategoricalOperatorAlgebras, from which nothing is imported here; §0.1 states only the instances this roadmap uses", and likewise the unitary Temperley–Lieb category to TemperleyLiebOperatorAlgebras.

**Detail.** The folder's text now takes the "owner here" branch of review ~13's repair, which is consistent with the merge order (QuantumGroups is on main; a probe that cites CA1a/CA2a prints UPWARD lines, as recorded in review ~13). But the arrangement exists only in this README: the two roadmaps it names as consumers still build the objects and say so, and the sibling revision #1649 writes the opposite contract into the same file. Whichever revision merges first, the other, and #888 and #867, contradict it. The rule for an object two open roadmaps both own is P2.

**Repair:** one of the two, stated in this pull request's description (it cannot be stated in the README):
- **Owner here (what this head says).** Keep §§0.2–0.3 as they are; the description says that #888 (`:41`–`:49`, CA1a, CA2a) and #867 (`:137`, Layer 3) are to cite QuantumGroups §0.2 and §0.3 instead of constructing them, and that #1649's Layer 0 scope paragraph is superseded. Those are edits to the other pull requests, not to this folder.
- **Owner there (what #1649 says).** Rewrite `:33`–`:41` and `:1769`–`:1775` as #1649 `:30`–`:46` does, and cut §§0.2–0.3 to the instances Layers 1–7 use, importing nothing from #888/#867 (citing them is UPWARD until they merge).

Either way R03 fixes which revision prevails.

**Tested:** `depcheck: 239 roadmaps, 2316 edges, 0 problem(s)` on this head (QuantumGroups consumes nothing from #888/#867). The three passages above were read at the heads named.

## R03 (P3) — A conflicting revision with no stated order, and a title and description that describe a different head

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg"; the description ("Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first", "Only the roadmap README changes; no Lean interfaces or implementation files change, so no local Lean rebuild was run").

**Claim:** the description matches the head and this is the only open revision of QuantumGroups.

**Witness:** this head has no Q9, `RepUqg`, braiding or ribbon twist; it has Layers 0–8 and four `Suggested.lean` headlines (`Suggested.lean:95`–`:171`), and the diff against main changes both files (README 1399 insertions, 546 deletions; `Suggested.lean` 350 lines changed). #1649 (`79e1cb6`) revises the same two files and conflicts with this head in both (`scratch/overlaps.md`); its Layer 0 is numbered §0.1 (C*-categories) and §0.2 (Temperley–Lieb comparison), so the ids §0.2/§0.3 that this head tells CA/TLOA to cite mean different sections there.

**Repair:**
- Retitle and redescribe the pull request for what the head is (Layers 0–8 on Tau Ceti's rank-one theory, four headlines), and drop the #1125/#1124 prerequisites.
- State which revision prevails: this one supersedes #1649 (which is closed), or this one is rebased onto #1649. The ownership sentence of R02 goes in the same paragraph.

No file of the folder changes. Carried from review ~13 R03 (and ~11 R01, ~9 R01, ~7 R03, ~6 R06); no repair report marks it not actionable.

## R04 (P2) — The pivotal and spherical structure of finite `U_q(sl₂)`-modules is statable at the cited pin and is absent from `Suggested.lean` and from its not-statable list

**Location:**
- `:9`–`:13` (Summary): "add the Biedenharn–Elliott pentagon, the pivotal and spherical structure of its finite-dimensional modules and their precise comparison with the compact SUq(2) example"; `:76`–`:81`; §8.5 `:1596`–`:1601` ("Bundle this monoidal trivialization … as a `TauCeti.PivotalCategory` instance … instantiate it at U_q with g=K⁻¹") and `:1655`–`:1660` ("deduce … that the pivotal category of finite U_q-modules is a `TauCeti.SphericalCategory`").
- `Suggested.lean:35`–`:81`: the not-statable list names the pentagon (`:73`–`:76`) and the SUq(2) comparison (`:77`–`:79`) and nothing about the pivotal or spherical structure.

**Claim (implicit):** every Layer 8 headline is either stated or named as not statable.

**Witness:** at `2fd255d9` the carriers exist and the statement elaborates. A scratch file with

- `instance : RigidCategory (FiniteHopfModuleCat ℂ (UqSl2 q)) := FiniteHopfModuleCat.rigidCategory (UqSl2.antipode_bijective q)`,
- `theorem kInv_isGroupLike : IsGroupLikeElem ℂ ↑((UqSl2.kUnit q)⁻¹) := ⟨UqSl2.counit_kInv q, UqSl2.comul_kInv q⟩`,
- `instance : PivotalCategory (FiniteHopfModuleCat ℂ (UqSl2 q))` with `pivotalIso := FiniteHopfModuleCat.unitEvalNatIso (UqSl2.kUnit q)⁻¹ (fun a => UqSl2.antipode_antipode q a)` and `pivotalIso_isMonoidal := FiniteHopfModuleCat.unitEvalNatIso_isMonoidal _ (kInv_isGroupLike q)`,
- `theorem uqSl2_spherical (hq : q - q⁻¹ ≠ 0) (X) (f : X ⟶ X) : leftTrace f = rightTrace f := by sorry`

elaborates under `[Fact (q ≠ 0)]` with one `sorry` warning (`scratch/postmerge/Spherical.lean`; `#check` prints `uqPivotal : (q : ℂ) → [Fact (q ≠ 0)] → PivotalCategory (FiniteHopfModuleCat ℂ (UqSl2 q))`). The two instances have real bodies on native carriers, which is what the file's own rule allows for making a headline statable. (My checkout had no object file for `Pivotal/Trace.lean` and `Pivotal/Spherical.lean`, so the probe used verbatim local copies of `TauCeti.leftTrace` and `TauCeti.rightTrace`, `Trace.lean:88` and `:93`; the real file imports those modules and states `TauCeti.SphericalCategory`.)

**Detail.** The hypothesis `q − q⁻¹ ≠ 0` is needed and is the one `TauCeti.UqSl2.trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` carries: at q = ±1 the totalized algebra is commutative and `V = ℂ` with `K = 2`, `E = F = 0` is a module on which `tr K = 2 ≠ 1/2 = tr K⁻¹`. The proof is not one tactic: it needs the identification of Tau Ceti's `leftTrace`/`rightTrace` with `tr(g⁻¹f)` and `tr(gf)` for the pivot `g = K⁻¹` (the §8.5 target "Identify PivotalSpherical's rightTrace(f)=tr_V(gf) and leftTrace(f)=tr_V(g⁻¹f)"), which I checked by hand: `rightTrace f = η ≫ f ▷ Xᘁ ≫ ev_piv` sends `1 ↦ Σ e^i(g f e_i) = tr(gf)`, and `leftTrace f = coev_piv ≫ Xᘁ ◁ f ≫ ε` sends `1 ↦ Σ e^i(f g⁻¹ e_i) = tr(g⁻¹f)`, since the pivotal coevaluation is `Σ e^i ⊗ g⁻¹e_i` for `j(v)(φ) = φ(gv)`.

**Repair:** after R01's merge, add to `Suggested.lean` the imports `TauCeti.Algebra.Category.FiniteHopfModuleCat.{Pivotal,Rigid}`, `TauCeti.CategoryTheory.Monoidal.Pivotal.{Basic,Trace,Spherical}`, `TauCeti.QuantumGroups.UqSl2.{Antipode,Hopf}`, the two instances and the group-like theorem above (as the definitions the headline needs), and the headline

```lean
/-- §8.5: with the pivot `K⁻¹`, finite `U_q(sl₂)`-modules form a spherical category when `q − q⁻¹ ≠ 0`. -/
theorem uqSl2_spherical (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) :
    TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q)) := by
  sorry
```

and name the new Lean names in §8.5 (`:1596`–`:1601` and `:1655`–`:1660`). Add the q = ±1, `K = 2` instance as a Check of §8.5 (the sphericity hypothesis). Re-run the `#check` comparison for the new declarations.

**Tested:** the scratch elaboration above at `2fd255d9`/`1b1ccf4b` (exit 0, one `sorry`).

## Verified sound

**Gate, build and dependency check.**

- **Head and scope.** `b4e477719cf7e0af6c9a0560916ae431bebab7e8`, clean worktree; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. `PROGRESS.md`, `STATUS.md`, `metadata.toml` are generated files (`stray-files=0`).
- **Gate (worker's run on this head):** every check 0, `OK`.
- **Build at this branch's pins** (`lake env lean` from the worktree): exit 0, exactly four `declaration uses sorry` warnings at `Suggested.lean:113`, `:145`, `:156`, `:166`.
- **Build at main's pins** (`2fd255d9`/`1b1ccf4b`, toolchain `v4.36.0-rc2`): the same four warnings, nothing else.
- **Dependency check** (unmodified output of the required command): `depcheck: 239 roadmaps, 2316 edges, 0 problem(s)`. QuantumGroups is on main and absent from the merge order; its suppliers (TemperleyLieb, Subfactors, VonNeumannAlgebras, HilbertModules, CStarAlgebras, RepresentationTheory/CompactGroups and /LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups, PivotalSpherical) are all on main.
- **Policy.** No LaTeX delimiters, pull-request numbers, process words, `lemma` as a keyword, `set_option`, `#eval`, `True` placeholders or sorry'd data.

**Signatures.** `#check @name` for the six declarations in one scratch file, elaborated once at the branch pin: each type equals the README statement at the same generality (`schur_orthogonality` §3.1; `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive` §4.1). The one lead in `signatures.md`, `AlgebraicHaar` dropping `[StarModule ℂ A]`, is harmless: no field uses it. `hΔ` is exactly the field `comul_star` of `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean`, checked at `2fd255d9`).

**Padding probe.** Each `sorry` replaced by `first | rfl | infer_instance | trivial | simp | decide` in a scratch copy: all four fall through every alternative. None restates a definition, mirrors a Check or computes a value.

**Headline coverage.** Stated: Schur orthogonality (§3.1); compact type, modular automorphism, Kac equivalence (§4.1). Named as not statable with the missing carrier, and confirmed missing at both pins: minimal C*-tensor product, free Hilbert module `H⊗A` and its adjointable operators, C*-envelopes, universal C*-algebras `C(SUq(2))`/`A_o(F)`, rigid C*-tensor categories and dagger fibre functors, the quadruple recoupling (the pin's `TauCeti.UqSl2.clebschGordanRecouplingEquiv`, `ClebschGordan/Recoupling.lean:135`, is `ClebschGordanLeft q m n p ≃ ClebschGordanRight q m n p`, triple products only). The omission is R04.

**Tau Ceti at `2fd255d9`: 134 declarations elaborated by `#check`, compared with the README's description of each.** Among them: `UqSl2.pbwBasis_apply` (`F^a K^b E^c`, `[Fact (q ≠ 0)]` only); `UqSl2.instIsDomain` (every `q ≠ 0`); `comul_e = E⊗1 + K⊗E`, `comul_f = F⊗K⁻¹ + 1⊗F`, `comul_k`, `counit_k`, `antipode_e = −K⁻¹E`, `antipode_f = −FK`; `antipode_antipode : S(S x) = K⁻¹ x K`; `antipodeEquiv : U_q ≃ₐ U_qᵐᵒᵖ`; `rescale : ℂˣ →* (U_q ≃ₐ U_q)`; `inverseParameterEquiv : UqSl2 q⁻¹ ≃ₐ UqSl2 q` with `k q⁻¹ ↦ kInv q`, `e ↦ e`, `f ↦ f` (`InverseParameter/Basic.lean:100`–`:114`); `OreExtension.isDomain` (`[IsDomain S]`, injective τ); `OreExtension.monomialBasis` (any σ); `rightCoeffLinearEquiv` (bijective σ, `RightCoeff.lean:173`); `skewPolynomialEquiv` under a `MulSemiringAction (Multiplicative ℕ) R` with `ofAdd 1 • a = σ a`, supplied locally by `RingHom.powersMulSemiringAction` (`Algebra/OreExtension/SkewPolynomial.lean:61`, a Tau Ceti declaration); `SigmaDerivation.ofMatrix` (`Φ r 0 0 = σ r`, `Φ r 1 1 = r`); `VermaModule = UqSl2 q ⧸ span {E, K − μ}` (`Verma/Basic.lean:74`–`:89`), `VermaModule.basis` for `q ≠ 0`, `μ ≠ 0`, `e_smul_vec_succ_eq_zero_iff` (`E v_{j+1} = 0 ↔ μ² = q^{2j}`), `isSimpleModule_iff` (`∀ m, μ² ≠ q^{2m}`), `ladderModuleEquivQuotient`; `LadderModule.k_smul_vec`, `e_smul_vec`, `f_smul_vec` (`Basic.lean:287`–`:302`: `K v_j = εq^{m−2j} v_j`, `E v_j = ε[m−j+1] v_{j−1}`, `F v_j = [j+1] v_{j+1}`); `isSimpleModule`, `nonempty_linearEquiv_iff` (`m = n ∧ ε = δ`), `algebraMap_end_bijective`, `not_isTypeOne` (sign −1); `existsUnique_linearEquiv_ladderModule` (`[FiniteDimensional] [IsSimpleModule]`); `casimir = FE + ((q−q⁻¹)²)⁻¹(qK + q⁻¹K⁻¹)` (`Casimir/Basic.lean:65`), `casimirScalar = (qμ + q⁻¹μ⁻¹)/(q−q⁻¹)²`, `casimir_mem_center` (no hypothesis), `transcendental_casimir` (`q ≠ 0`), `center_eq_adjoin_casimir` and `polynomialAlgEquivCenter` (generic q), `casimirScalar_units_mul_pow_inj` (`↔ m = n ∧ ε = δ`); `isSemisimpleModule_of_finiteDimensional`, `isSemisimpleModule_of_isLocallyFiniteModule`, `isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`, `ladderModuleTensorHomEquiv`, the three type-1 equivalences, `IsTypeOne`/`IsSignedTypeOne` as weight modules with eigenvalues `q^n` / `εq^n` (`TypeOne.lean:178`–`:185`); `IsLocallyFiniteModule` = each `span A {v}` finite over k (`LocallyFinite.lean:59`); `IsGenericQuantumParameter q = q ≠ 0 ∧ ∀ n > 0, q^n ≠ 1`; `quantumInteger = (q^r − q^{−r})/(q − q⁻¹)`, `quantumInteger_add_one`, `_neg`, `_ne_zero`; `clebschGordanCoeff` recurrence `α_{i+1} = −δ q^{m−2i}[n−j+i+1]/[m−i] α_i` (`ClebschGordan/Basic.lean:76`); `clebschGordanEquiv : (j : Fin (min m n + 1)) → L_{m+n−2j}^{εδ} ≃ L_m^ε ⊗ L_n^δ`, `clebschGordanInclusion`, `clebschGordanProjection`, `clebschGordanInclusion_projection_naturality`; `comul_e_pow` and `comul_f_pow` with `q^{s(r−s)} [r choose s]_q`; `signTensorEquiv`, `tensorSignEquiv` (`L_0^- ⊗ L_m^ε ≃ L_m^{−ε}` and the other order); `contragredientEquiv` (ℂ-linear, with `contragredientEquiv_intertwines`, `Dual/LadderModule.lean:169`); `doubleDualEquiv`; `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`q − q⁻¹ ≠ 0`, φ a `U_q`-endomorphism); `trace_rep_k`, `trace_rep_kInv` (`ε[m+1]_q`); `formalCharacter`, `nonempty_linearEquiv_iff_formalCharacter_eq`, `finrank_linearMap_ladderModule_eq_formalCharacter_coeff_sub`; `instStarRing` (`[Fact (IsSelfAdjoint q)]`), `star_e = KF`, `star_f = EK⁻¹`, `star_k = K`, `instStarCoalgebra` (real nonzero q), `star_antipode_star`; `invariantForm`, `invariantForm_pos`, `invariantForm_smul`, `invariantForm_k_pos` (`0 < q`, `q − q⁻¹ ≠ 0`), `eq_smul_invariantForm` (generic real q); `ladderMatrixE/F/K/H` over `LaurentPolynomial ℤ`, `toMatrix_rep_e/f/k`, `ClassicalLadder.isSl2Triple` (`(m : K) ≠ 0`), `equivSl2Std` (`[CharZero K]`, `v_j ↦ (m choose j) w_j`, `ClassicalSpecialization.lean:42`–`:71`); `FiniteHopfModuleCat k H = FullSubcategory` of `ModuleCat.{u} H` by finiteness over k (`Basic.lean:50`, type `Type (max (u+1) v)`), `forgetToModule`, `ofShrink` (`[Module.Finite k V]`), `ofShrinkEquiv`, `instRightRigidCategory`, `leftDual` and `rigidCategory` (both take `Function.Bijective antipode`, `Rigid.lean:69`, `:146`), `unitEvalNatIso g hg` (`hg : S(S a) = g a g⁻¹`), `unitEvalNatIso_isMonoidal` (`IsGroupLikeElem k g`); `PivotalCategory` (`[RigidCategory C]`, fields `pivotalIso`, `pivotalIso_isMonoidal`, `Pivotal/Basic.lean:76`); `SphericalCategory : Prop` (`Spherical.lean:69`); `StarCoalgebra` (a `Prop` class), `StarCoalgebra.counit_star`, `HopfAlgebra.antipode_bijective`, `antipode_star_antipode_star : S(S(a*)*) = a`, `antipodeAlgEquivOp`, `antipode_bijective_of_antipode_antipode`, `comulMulRightEquiv`, `leftMulComulEquiv` (no hypothesis), `comulMulLeftEquiv` (bijective antipode); `HopfAlgebra.antipode_antipode` for commutative A (as §3.3 says); `TemperleyLieb R δ n`; `Sl2Std K m`; `IsLocallyFiniteModule`. The README's statement of each agrees with the elaborated type, including every hypothesis named above.

**Mathlib at both pins** (`f6090c70` and `1b1ccf4b`): `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean:37`, fields `counit_eq_one`, `comul_eq_tmul_self`), `Rep.equivalenceModuleMonoidAlgebra`, `HopfAlgebra.antipode_mul_antidistrib`, `SkewPolynomial`, `WithConv`, `PositiveLinearMap.GNS` and `gnsStarAlgHom`, `norm_map_star_mul_le`, `norm_map_mul_star_le`, `gelfandStarTransform_naturality`, `WeakDual.CharacterSpace.homeoEval`, `instCompletelyPositiveMapClass`, `finite_dimensional_eigenspace`, `orthogonalComplement_iSup_eigenspaces_eq_bot`, `WeakDual.isCompact_closedBall` (`WeakDual.lean:270`), `CStarMatrix`, `DoubleCentralizer`, `WithCStarModule`.

**Cross-roadmap citations resolved on main (`c44dcc80`):** HilbertModules H1 (`:126`), H2 (`:179`; `K_A(H⊗A)≅K(H)⊗min A` `:209`, `L_A(H⊗A)≅M(K(H)⊗min A)` with the strict topology `:213`), H3 (`:262`); VonNeumannAlgebras Layers 0 (`:275`), 1 (`:392`), 3 (`:905`), 11 (`:2785`), V13b.SpatialNorm (`:70`, `:251`), V4.Core/PositivePredual/Normality (`:244`), V10.ModularTheory and V10.KMS (`:265`); CStarAlgebras C1.7 (`:468`), C1.CommutativeMultiplierMorphisms (`:497`), C5.1 (`:1112`), C5.2 (`:1143`); Subfactors §3.1 (`:676`), §3.2 (`:697`, `markovTrace_nonneg_iff` `:729`), §3.3 (`:774`); TemperleyLieb Layer 4 `presentedTLEquiv` (`:564`), Layer 6 Goodman–Wenzl (`:33`, `:231`); PivotalSpherical, which names `PivotalCategory`, `SphericalCategory`, `leftTrace`, `rightTrace` and `FDRep` (`:8`, `:61`, `:74`); RepresentationTheory/LieHighestWeight `IsSl2Triple` (`:5`, `:181`); CompactGroups `su2Irrep` (`:190`, `:400`); OperatorAlgebraDynamics D1 (`:148`), D2 (`:221`); FreeProbability F1 (`:127`), F3 (`:255`), F6 (`:532`); AmenableGroups Layers 1, 5, 7 (`:98`, `:289`, `:415`). Consumers: QuantumEnvelopingAlgebras Layer 1 cites Q8 item 1 (`:183`); HopfologicalAlgebra §2.1 cites Q8 item 5 (`:165`, `:319`); ClusterAlgebras (#1858, `:68`–`:74`) names §8.1's σ-derivation extensions as a boundary and consumes nothing. The Q8 item crosswalk at `:155`–`:160` keeps both ids.

**Overlaps and ownership.** `scratch/overlaps.md`: no dropped id, no id defined only by an open revision; `roadmaps resolve` finds nothing. The single other open pull request touching this roadmap is #1649 (R02, R03). Ownership compared with #888, #867 (R02), #1015 NoncompactQuantumSymmetry (particle representations, no compact quantum group), #1137 OperatorAlgebraDynamics (no claim on these objects), #1858 (above). No declaration of `Suggested.lean` shares a fully qualified name with another readable roadmap's file.

**Seeded sample (15 targets).**

- **0.1 — verified.** Kustermans–Vaes, Notations and conventions, p.840 (`kustermansvaes` lines 168–197): minimal tensor products, unique strictly continuous extension of a strict map on bounded sets, the leg `a ⊗ c ↦ a ⊗ 1 ⊗ c` defining `x_13`. The leg identifications for unital φ are the README's own derivation (rows 1–2).
- **0.2 — verified.** Longo–Roberts §2 p.4 (`longoroberts` lines 121–142: C*-property, conjugate equations), Lemma 3.3 (line 389: same left inverse iff `R' = U ⊗ 1 ∘ R` with U unitary), Theorem 3.8 (line 621: products), Theorem 3.11 (lines 681–683: `R*R R̄*R̄ ≥ d²`, equality iff a multiple is standard), Appendix (lines 2000–2012: subobjects and sums). Neshveyev–Tuset Definition 2.2.10 (`nt` line 1427), Definition 2.2.12 (lines 1446–1454: `‖R_k‖ = ‖R̄_k‖`), Theorem 2.2.14 (lines 1501–1512: standard iff left and right traces agree), Theorem 2.2.17 (lines 1596–1600), §2.5 (lines 2426–2431: `R̄ = −τR`), Definition 2.7.1 and the remark (lines 3236–3241: `d(U) ≥ 1`).
- **1.2 — partly.** Haar existence cites Timmermann Theorem 5.1.6 only (uncertified); the statements are checked computationally (rows 7–9).
- **2.1 — partly.** Timmermann Definition 5.1.4 and §5.3 (uncertified); the analytic inputs (HilbertModules H1–H3, §0.1) resolve as above; rows 10–11.
- **2.3 — partly.** Timmermann Propositions 5.3.7–5.3.8 (uncertified); row 12.
- **3.1 — verified.** Neshveyev–Tuset Theorem 1.4.2 p.9 (`nt` lines 447–452): `h(u_kl u_ij*) = δ_ki ρ_jl/dim_q U`, `h(u_ij* u_kl) = δ_jl (ρ⁻¹)_ki/dim_q U`; with `F̃ = ρᵗ` these are the README's two forms, `(F̃⁻¹)_ik = (ρ⁻¹)_ki`, `Tr F̃ = dim_q U`. Timmermann Propositions 3.2.9, 3.2.17 and Theorem 5.4.1 are uncertified. The Tau Ceti inputs (`map_antipode_mul_coefficientMatrix`, `antipode_bijective`, `antipode_star_antipode_star`) resolve at `2fd255d9`.
- **3.3 — partly.** Timmermann §3.2 and §5.4 (uncertified). The trace conventions were checked against Tau Ceti's `leftTrace`/`rightTrace` (R04 detail) and rows 16–17.
- **3.4 — partly.** Timmermann Theorems 3.2.19, 5.4.5 (uncertified); the VonNeumannAlgebras targets resolve; row 18.
- **4.2 — verified.** Bédos–Murphy–Tuset §2 (`bmt` lines 518–566, regular unitary) and Theorem 3.6 (lines 858–872: coamenable iff `A_u → A_r` is an isomorphism iff `h_u` faithful).
- **4.3 — verified.** Theorem 2.2 (lines 257–258: coamenable iff Haar faithful and counit bounded), Theorem 2.8 (lines 461–464), Corollary 2.9 (lines 478–483), Theorem 3.6 as above.
- **5.1 — verified.** Bédos–Murphy–Tuset p.13 (lines 592–605): the matrix `[[α, −qγ*],[γ, α*]]`. The five relations were derived from `u*u = uu* = 1` (row 21). Timmermann Chapter 6 §2 is uncertified.
- **5.2 — verified.** Banica Proposition 1 and Lemma 1 (`banica` lines 54–66: `E(1) = Σ F_ji e_i ⊗ e_j`, `(E* ⊗ 1)(1 ⊗ E) = c`); Malacarne Lemma 2.1 (`malacarne` lines 183–199: `A/I_F ≅ ℂ[O_F^+]`).
- **6.3 — verified.** Malacarne Theorem 4.1 (line 285) and the uniqueness argument (lines 275–281). The compact-semigroup step is the README's own (row 29).
- **7.1 — verified, with the source misprint below.** Bédos–Murphy–Tuset Theorem 2.12 (lines 614–644) and Corollary 2.13 (line 645): the weighted shift `ϕ(α)e_{n,k} = c_n e_{n−1,k}`, `ϕ(γ)e_{n,k} = q^n e_{n,k+1}`, the Haar formula, the state with `τ(T) = 1`. Timmermann Chapter 6 §2 is uncertified.
- **8.2 — verified.** Virelizier Example 3.3, Proposition 3.7 and Corollary 3.8 (`virelizier` lines 552–594, pp.11–12): type-1 simple modules are the `L(n)`; Virelizier's basis is normalised by `F v_i = v_{i+1}` with asymmetric quantum integers, a rescaling of Tau Ceti's ladder, as the README's "type-1 inputs" wording allows. The Tau Ceti declarations of §8.2 resolve as listed above.

Also read at their locators: Virelizier Proposition 2.4 (line 358: `S² = Ad(K⁻¹)`, spanning by `F^m K^n E^p`), Lemma 2.3 (line 265), Theorem 3.13 and Corollary 3.14 (lines 625–636), Proposition 4.1 (line 644); Neshveyev–Tuset Theorem 1.6.6 (lines 810–820), Theorem 1.7.3 (lines 977–978), Proposition 1.7.7 (lines 1036–1040); Kustermans–Vaes Definition 2.1 (lines 743–746).

**Adversarial pass.** Throughout, q = 1/2 unless stated, u is the sign character of C₂, the SUq(2) matrix is `[[a, −q c*],[c, a*]]`, and `[r]` is the symmetric quantum integer.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.1 legs along ι₁, ι₂ | H=ℂ, A=C(C₂), U=u | `(id⊗Δ)U = u⊗u`; `U_12U_13 = (u⊗1)(1⊗u) = u⊗u`; two ι₂ legs give `1⊗u² = 1 ≠ u⊗u` | pass | none |
| 2 | §0.1 leg along non-injective φ; coefficientwise flip | φ=ε, T=1[s]; W on A⊗A | `T_ε = 0`, `‖T‖ = 1`; `W((1⊗1)(u⊗1)) = 1⊗u ≠ u⊗1 = W(1⊗1)(u⊗1)` | pass | none |
| 3 | §0.2 standard vs rescaled cups | (2R, R̄/2) on ℂ² | norms² 8 and 1/2, product 2 = d; traces 8 ≠ 1/2, so not standard (NT 2.2.12) | pass | none |
| 4 | §0.2 `d ≥ 1`, equality iff invertible | SU_(1/2)(2) fundamental; a character | d = 5/2 > 2 = dim_H; `1 + 21/4 = 25/4 = (5/2)²`; character d = 1 | pass | none |
| 5 | §0.3 truncated fusion `min(k+l, 2(m−2)−k−l)` | m=3; m=4 (d=√2) | m=3: 1⊗1=0 (1·1=1); m=4: 1⊗1=0⊕2 (√2·√2=1+1), [3]=d²−1=1, [4]=d³−2d=0 | pass | none |
| 6 | §0.3 cup, projection, loop | d=5/2 | `tr_2(p) = 1/d² = 4/25`, `tr_2(1−p) = 21/25`; signed e=−(5/2)p, e²=δe both ways; β = d² = 25/4 | pass | none |
| 7 | §1.1 Δ on S₃ fixes the order | g=(12), h=(23), f=1[(123)] | Mathlib `(12)(23)`: 0↦1↦2↦0 = (123) so Δf(g,h)=1; `(23)(12)` = (132), Δf(h,g)=0 | pass | none |
| 8 | §1.2 cancellation fails on {1,0} | Δ(A)(A⊗1) | spanned functions satisfy H(0,0)=H(0,1): dimension 3 of 4 | pass | none |
| 9 | §1.2 Fell absorption | Γ=ℤ | `W(δ_1⊗δ_2) = δ_1⊗δ_3`; `W(λ_1⊗1)W*: δ_1⊗δ_2 ↦ δ_2⊗δ_3` | pass | none |
| 10 | §2.1 isometry excludes 0 | U=0 on ℂ; H=0 | `0 ≠ 1`; H=0: all maps zero, equation holds | pass | none |
| 11 | §2.2 unitarisation | U(s)=[[1,2],[0,−1]] | U²=I; `U*U = [[1,2],[2,5]]`, T = average with I = [[1,1],[1,3]], det 2; `U*TU = T` | pass | none |
| 12 | §2.3 regular corepresentation | C₂; S₃; trivial | 1+1 = 2; 1+1+4 = 6; Λ(2) ↦ 2⊗1 | pass | none |
| 13 | `schur_orthogonality` | SU_(1/2)(2), F̃=diag(2,1/2) | `h(a*a) = (1/2)/(5/2) = 1/5`, `h(c*c) = 2/(5/2) = 4/5`, `h(aa*) = 2/(5/2) = 4/5`; from Haar: `h(c*c) = (1−q²)/(1−q⁴) = 4/5`, `a*a = 1−c*c ↦ 1/5`, `aa* = 1−q²c*c ↦ 4/5` | pass | none |
| 14 | §3.1 `S(u_ij) = u_ji*` | c, c* | `S(c) = u_12* = −qc`, `S(c*) = −q⁻¹c*`, `S²(c) = q²c = c/4` | pass | none |
| 15 | §3.2 Plancherel norm, characters, Vandermonde | a+c; F=diag(2,1/2); λ=1,2 | `1/5+4/5 = 1`; `f_z(a) = 2^z`, `f_1*f_1(a) = 4 = f_2(a)`, θ(a)=4a; det [[1,1],[1,4]] = 3 | pass | none |
| 16 | §3.3 pivotal traces | F=I₂; F=diag(2,1/2) | 2 = 2; `Tr F = Tr F⁻¹ = 5/2 > 2`; `tr(F diag(1,0)) = 2`, `tr(F⁻¹ diag(1,0)) = 1/2` | pass | none |
| 17 | §3.3/§8.5 `rightTrace = tr(gf)`, `leftTrace = tr(g⁻¹f)` | Tau Ceti `Trace.lean:88`, `:93`, pivot `j(v)(φ)=φ(gv)` | `η ≫ f▷ ≫ ev_piv: 1 ↦ Σ e^i(g f e_i)`; `coev_piv = Σ e^i ⊗ g⁻¹e_i`, then `Σ e^i(f g⁻¹ e_i)` | pass | none |
| 18 | §3.4 modular group | a, c | `σ_t(a) = 4^{it}a`, `σ_{−i}(a) = 4a`; `h(aa*) = 4/5 = h(a*σ_{−i}(a))`; `S²(c) = c/4 = τ_{−i}(c)`, `σ_t(c) = c` | pass | none |
| 19 | `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x], x primitive | true/true; `h((a+bu)*(a+bu)) = |a|²+|b|² > 0`; zero ring: `h(1)=h(0)=0≠1`, excluded by `Nontrivial`; `(id⊗h)Δx = x + h(x)` vs `h(x)1` forces x=0: false/false | pass | none |
| 20 | `haar_modular_automorphism` | SU_(1/2)(2); ℂ[S₃] | θ(a)=4a: `h(a*θ(a)) = 4/5 = h(aa*)`; θ⁻¹ gives 1/20; ℂ[S₃]: θ = id | pass | none |
| 21 | `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | both sides true; `1/5 ≠ 4/5` and `S²(c) = c/4 ≠ c`, both false | pass | none |
| 22 | §5.1 relations ⇔ unitarity | entries of u*u, uu* | `(u*u)_11 = a*a+c*c`, `(u*u)_12 = −q a*c* + c*a*`, `(u*u)_22 = q²cc*+aa*`, `(uu*)_12 = ac*−qc*a`, `(uu*)_22 = cc*+a*a`: the five relations, every real q; a=0, c=1 at q=1/2: `aa*+q²c*c = 1/4 ≠ 1` | pass | none |
| 23 | §4.2 pentagon and `Δ_r` | ℤ; V(x⊗y)=Δ(x)(1⊗y) | both words `(1,2,3) ↦ (1,3,6)`; `V(λ(a)⊗1)(x⊗y) = Δ(ax)(1⊗y) = Δ(a)V(x⊗y)` | pass | none |
| 24 | §4.2 C*-norm vs Haar norm | 1+u on C₂ | `‖1+u‖ = 2`, `‖Λ(1+u)‖₂ = √2` | pass | none |
| 25 | §4.3 Følner, free group | ℤ, F_N=[−N,N]; F₂ | boundary ratio `2/(2N+1)`; `‖λ(s)+λ(s)⁻¹+λ(t)+λ(t)⁻¹‖ = 2√3 < 4 = ε(·)` | pass | none |
| 26 | §5.2 cup, sign, bound | F=[[0,1],[−2,0]] | `FF̄ = −2I`; `E = −2e₀⊗e₁ + e₁⊗e₀`, `‖E‖² = 5`, `5/2 ≥ 2`; normalised zigzag −I; `J e₀ = −√2 e₁`, `‖Je₀‖² = 2` (not antiunitary) | pass | none |
| 27 | §5.2 n=1 | F=1 | `u* = u`, `u² = 1`: C*(ℤ/2) | pass | none |
| 28 | §6.2 truncations | H=0; H=ℂ | quotient ℂ; `dim A_{≤1} = 2` | pass | none |
| 29 | §6.3 cancellative compact semigroup | {1,0}; C₂ | `0·1 = 0·0`, `1 ≠ 0`: no reconstruction; C₂: identity e, Haar 1/2 each | pass | none |
| 30 | §7.1 Haar moments | q=1/2; q=±1 | `(1−q²)/(1−q⁴) = 4/5`, `(1−q²)/(1−q⁶) = 16/21`; endpoints `∫t = 1/2`, `∫t² = 1/3` | pass | none |
| 31 | §7.1 weighted-shift character | ξ₂, ξ₃, ξ₅₀ | `√3/4 = 0.433`, `(√3/2+√15/4)/3 = 0.611`, `0.976`; basis vectors give 0 | pass | none |
| 32 | §7.1 q=−1 model | a=√(1−t)zσ₃, c=√t wσ₁ | `a*a+c*c = 1`, `aa*+c*c = 1`; `σ₃σ₁ = −σ₁σ₃` gives `ac = −ca`, `ac* = −c*a` | pass | none |
| 33 | §7.2 dimension recurrences | n=2, d=5/2 | Hilbert 1, 2, 3, 4; intrinsic 1, 5/2, 21/4, 85/8 | pass | none |
| 34 | §7.2 n=2 normal form, SUq(2) matrix | F=[[0,1],[−q⁻¹,0]] | `FF̄ = −q⁻¹I` (sign(c) = −sign(q)); `F ū F⁻¹ = [[a, −qc*],[c, a*]]` | pass | none |
| 35 | §7.2 n=3 | ε(χ) | 3 ∉ [−2,2]; semicircle `m₂=1, m₄=2` vs two-point `m₂=m₄=1` | pass | none |
| 36 | §8.1 quantum integers | r=−2…2 | −5/2, −1, 0, 1, 5/2; `q−q⁻¹ = −3/2` | pass | none |
| 37 | §8.1 Ore tower at q=i | δ_E(FK) vs δ_E(q²KF) | both `K(K−K⁻¹)/(2i)` (checked numerically with K a unit scalar); K² and K⁴ central, not in ℂ[Ω] since Ωⁿ has leading PBW term FⁿEⁿ | pass | none |
| 38 | §8.1 PBW sign | a=b=1 | `KF = q⁻²FK = 4FK`, so `K^bF^a = q^{−2ab}F^aK^b` | pass | none |
| 39 | §8.2 ladders | L₂⁺; L₁⁻ | weights 1/4, 1, 4; `[2−2j]` = 5/2, 0, −5/2; L₁⁻: `EF−FE = diag(−1,1)` | pass | none |
| 40 | §8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | `(q^{m+1}+q^{−m−1})/(9/4)` = 10/9, 17/9, 65/18; on L₁⁺: `FE = diag(0,1)` + `diag(17/9, 8/9)` = (17/9)I; `EF = diag(1,0)` + `diag(8/9, 17/9)` = (17/9)I; mixed: `diag(8/9, 26/9)` | pass | none |
| 41 | §8.4 local finiteness | L₀⁻; ⊕_ℕ L₀⁺; Verma M(1) | K=−1 ∉ {q^z}: locally finite, not type 1; cyclic dimension 1, total infinite; F^j v₀ ≠ 0 with weights 4^j: not locally finite | pass | none |
| 42 | §8.5 Clebsch–Gordan, Δ(E²), pivot | m=n=j=1; r=2; L₁⁺, L₀⁻ | `α₁ = −q = −1/2`, `ΔE(v₀⊗v₁ − ½v₁⊗v₀) = (½−½)v₀⊗v₀ = 0`; middle coefficient `q[2] = 1+q² = 5/4` (q⁻¹[2] = 5); `tr K⁻¹` = 5/2 and −1 | pass | none |
| 43 | sphericity hypothesis | q=±1, V=ℂ, K=2, E=F=0 | `tr K = 2 ≠ 1/2 = tr K⁻¹`: `q−q⁻¹ ≠ 0` needed | narrow | R04 |
| 44 | §8.6 invariant metric and pairing | m=1 | `h₁/h₀ = [1]/([1]q⁻¹) = 1/2`; `⟨Ev₁,v₀⟩ = 1 = ⟨v₁,KFv₀⟩ = q⁻¹h₁`; orthonormal entries `√2 = q^{−1/2}`, `1/√2 = q^{1/2}`; `EF−FE = diag(1,−1)`; `ΔF(v₀⊗v₁ − qv₁⊗v₀) = qv₁⊗v₁ − qv₁⊗v₁ = 0` | pass | none |
| 45 | §8.7 classical specialisation | m=2 | `(2 choose j)` = 1, 2, 1; `Fv₀ = v₁ ↦ 2w₁ = f·w₀ = (2−0)w₁`; `[2]_v = v+v⁻¹ ↦ 2`, totalised `0/0 = 0` | pass | none |

**Source issues** are listed below; nothing else in the sources read disagrees with the README.

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008), is `uncertified` (paywalled) in the manifest and cited by locator only. The Timmermann locators of §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1, 7.1 and 8.6 were not checked against the text; each statement was checked mathematically above and, where Neshveyev–Tuset or Bédos–Murphy–Tuset also covers it, against that text.
- **Tau Ceti modules without object files at main's pin.** `Pivotal/Trace.lean`, `Pivotal/Spherical.lean`, `OreExtension/RightCoeff.lean`, `UqSl2/Verma/Submodule.lean` and `UqSl2/Casimir/Block.lean` were read in source at `2fd255d9` and not elaborated; R04's probe used verbatim copies of the two trace definitions.
- **#888 and #867** were read at their heads through the roadmap index (`7362bb7`, `ba43cc7`); their pull-request descriptions were not read.

## Source issues

- **Misprint** in bmt at Theorem 2.12, proof, printed p.13: the source says the Haar state is (1−q²) times the unweighted sum over n of ⟨ϕ(a)e_(n0), e_(n0)⟩; it should weight the n-th term by q^(2n), since the unweighted sum diverges at a = 1; affects nothing.
