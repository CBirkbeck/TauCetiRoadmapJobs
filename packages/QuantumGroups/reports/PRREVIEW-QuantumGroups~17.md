# Review of QuantumGroups (pull request #1705 at a9eaeef)

**Verdict:** needs changes

Incremental re-review of the 37 lines changed in `TauCetiRoadmap/QuantumGroups/` since `b4e4777`, the head the previous review read. The diff touches §8.5 of `README.md` in four places (the U_q instantiation, the trace identification and sphericity sentence, an API bullet and a new Check, plus the *Needs:* line) and adds one item to the module docstring of `Suggested.lean`. Nothing outside the folder changed.

There are four findings, three of them P2 (blocking) and one P3. All four were raised by the previous review. None is new. The mathematics the diff adds is correct. I computed the trace identification, the pivot and the q = ±1 Check, and elaborated the U_q rigid and pivotal instances and the sphericity statement at main's Tau Ceti pin (Verified sound).

- **R01:** the branch still pins Tau Ceti `358314d4`, where none of the §8.5 declarations the diff adds exist. The fix is a merge of main, which is the worker's step.
- **R02:** §§0.2–0.3 are still owned twice. The newest head of CategoricalOperatorAlgebras now names QuantumGroups as *its* consumer of the same objects.
- **R03:** the conflicting revision #1649 still has no stated order, and the description still describes a Q9 that this head does not have.
- **R04:** the §8.5 sphericity headline is now listed in the module docstring, but under "Not statable", and the reason given ("which this file does not import") is not a missing carrier. At main's pin it states and elaborates. The tested Lean block is below.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Sources are cited as `<id> line N` in the worker's cache.

## R01 (P2) — The branch pins Tau Ceti `358314d4`, where nothing the diff adds to §8.5 exists

**Location:** `lake-manifest.json` on the branch pins Tau Ceti `358314d4`, Mathlib `f6090c70` and `lean-toolchain` `v4.35.0-rc3`; main has `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`. In the folder: `:1601`–`:1606` ("group-like (`TauCeti.UqSl2.counit_kInv`, `TauCeti.UqSl2.comul_kInv`) … `TauCeti.UqSl2.antipode_bijective`"), `:1657`–`:1665` (`TauCeti.rightTrace`, `TauCeti.leftTrace`, `TauCeti.pivotalExactPairing`), `:1687`, and `Suggested.lean:70`–`:76`. The rest of Layer 8 and the `From Tau Ceti` contract (`:166`–`:192`) have the same problem, as the previous review recorded.

**Claim:** every cited declaration exists in the pinned Tau Ceti.

**Witness:** `TauCeti/QuantumGroups/` and `TauCeti/CategoryTheory/Monoidal/Pivotal/` are absent at `358314d4`. At `2fd255d9` the names are at `UqSl2/Hopf.lean:192`, `:208`, `UqSl2/Antipode.lean:73`, `Pivotal/Basic.lean:187` and `Pivotal/Trace.lean:88`, `:93`.

**Detail.** The merge base is `c9940702`. Main's commit `a891cd19`, which bumps the Tau Ceti pin to `2fd255d99`, is not in the branch. The gate's `build=0` tests none of these names, because `Suggested.lean` imports only the two comodule modules that exist at both pins.

**Repair:** merge `origin/main` into the branch, which brings main's `lake-manifest.json` and `lean-toolchain` (the branch changes neither), then re-run the gate. No folder file changes. This is the worker's rebase step.

Re-raised: R01. The repair report is not in the package's `reports/` directory, so this cites the previous review's id. The repair round could not do this step, and the defect stays until the merge.

## R02 (P2) — §§0.2–0.3 have a second owner, and each side now names the other as its consumer

**Location:** `:33`–`:41`: "Section 0.2 is the single home of C*-categories … §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 come later in the build and consume these objects from §§0.2–0.3". The text is unchanged by this diff.

**Claim:** §§0.2–0.3 have one owner, and the two named roadmaps consume them.

**Witness:**
- **CategoricalOperatorAlgebras** (#888), at its new head `3e67101a`, `README.md:40`–`:46`: CA1a and CA2a "have their single home here; QuantumGroups consumes CA1a and CA2a". Its Downstream consumers section (`:2145`) lists QuantumGroups.
- **TemperleyLiebOperatorAlgebras** (#867), `ba43cc7a`, `:106`–`:107`: assigns these objects to CA1a/CA2a. Its Layer 3 (`:1269`) builds the unitary Temperley–Lieb category.
- **QuantumGroups #1649** (`79e1cb6`), `:30`–`:44`: assigns these objects to CategoricalOperatorAlgebras.

**Detail.** #888's newest commit (`3e67101a`, "QuantumGroups consumer restored as on main") restores main's arrangement. On main, QuantumGroups lists CategoricalOperatorAlgebras CA1a,CA2a as a supplier (`TauCetiRoadmap/QuantumGroups/README.md:42` on main). The two open texts now each hand the objects to the other. That is the P2 case "an object … that each hands to the other". QuantumGroups is on main and CategoricalOperatorAlgebras is in the merge order, so a QuantumGroups citation of CA1a/CA2a would be UPWARD. That rules out "consume from CA" for this folder. Two arrangements remain consistent: owner here, or #1649's "owned there, nothing imported here".

**Repair:** choose one and state it in this pull request's description, since the README cannot carry it:
- **Owner here (this head).** Keep `:33`–`:41`. State that #888 (`:40`–`:46`, `:2145`) and #867 (`:106`–`:107`, Layer 3) are to cite QuantumGroups §0.2 and §0.3 instead of building these objects, and that #1649's Layer 0 scope paragraph is superseded. The edits belong to those pull requests.
- **Owner there (#1649).** Rewrite `:33`–`:41` and the Downstream consumers entry as #1649 `:30`–`:44` does. Cut §§0.2–0.3 to the instances Layers 1–7 use, and import nothing from #888 or #867.

Re-raised: R02 (previous review). The diff does not touch this.

## R03 (P3) — A conflicting revision with no stated order, and a title and description that describe a different head

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg" and the description ("Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first", "Only the roadmap README changes; no Lean interfaces … change").

**Claim:** the description matches the head, and no other open revision of the folder conflicts with it.

**Witness:** this head has no Q9, no `RepUqg` and no braiding. This round it changes `Suggested.lean` again (+7 lines). `scratch/overlaps.md` reports that #1649 (`79e1cb6`) "and #1705 conflict in `README.md`, `Suggested.lean`". Neither description names an order.

**Repair:**
- Retitle and redescribe the pull request for what the head is: Layers 0–8 on Tau Ceti's rank-one theory, with four `Suggested.lean` headlines. Drop the #1125/#1124 prerequisites.
- State which revision prevails: close #1649, or rebase one onto the other. Put R02's ownership sentence in the same paragraph.

No folder file changes.

Re-raised: R03 (previous review). The description is unchanged.

## R04 (P2) — The §8.5 sphericity headline is statable at the pin the folder cites, but the docstring lists it as not statable for a reason that is not a missing carrier

**Location:** `Suggested.lean:70`–`:76`: "§8.5 rigid, pivotal and spherical structure of the finite `U_q(sl₂)`-modules … its carriers are `TauCeti.FiniteHopfModuleCat.rigidCategory`, … `TauCeti.SphericalCategory`, in the modules …, which this file does not import." The README makes it a headline at `:9`–`:13` (Summary), `:72` (Scope) and `:1662`–`:1667`.

**Claim:** the headline is not statable at the pins.

**Witness:** at `2fd255d9`/`1b1ccf4b` this file, with the block below added, elaborates with five `sorry` warnings and no error. At `358314d4`, none of the seven named modules exists. So "this file does not import" is not the reason at either pin.

**Detail.** The repair recorded the headline, which is half of the previous R04. A file not importing a module is a choice, not a missing carrier. At the pin the docstring names, the carriers exist and the headline is statable, so the rule for a statable but absent headline (P2) still applies. Nothing in the block is padding. The one-tactic probe (`first | rfl | infer_instance | trivial | simp | decide`) does not close `uqSl2_sphericalCategory`. Its proof needs the §8.5 identification of `TauCeti.rightTrace`/`leftTrace` with `tr(K⁻¹f)`/`tr(Kf)` and `TauCeti.UqSl2.trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`. The two instances are real-bodied definitions on native carriers, which the headline needs in order to be stated.

**Repair:**
1. After R01's merge, add to `Suggested.lean`:
   - the imports `public import TauCeti.Algebra.Category.FiniteHopfModuleCat.Pivotal`, `….FiniteHopfModuleCat.Rigid`, `TauCeti.CategoryTheory.Monoidal.Pivotal.Spherical`, `TauCeti.QuantumGroups.UqSl2.Antipode` and `TauCeti.QuantumGroups.UqSl2.Hopf`;
   - the block below, before the final `end`.

   Then delete the docstring item `:70`–`:76`, and add the sphericity of finite `U_q(sl₂)`-modules with pivot `K⁻¹` for `q − q⁻¹ ≠ 0` (§8.5) to "Stated here". In §8.5 (`:1601`–`:1606`, `:1662`–`:1666`), name `uqSl2RigidCategory`, `uqSl2PivotalCategory` and `uqSl2_sphericalCategory`, so that `readme-ids` passes.
2. If a repair round runs before the merge, the block cannot elaborate at `358314d4`. In that case replace only the reason "which this file does not import" with the true one at that pin: the pinned Tau Ceti has none of these modules.

```lean
/-! ## Layer 8: Generic U_q(sl₂), signed modules and integrability -/

section UqSl2Pivotal

open CategoryTheory

variable (q : ℂ) [Fact (q ≠ 0)]

/-- The rigid structure on finite `U_q(sl₂)`-modules (§8.5): right duals are the
antipode-twisted contragredients, left duals use the inverse antipode, which exists because
`S² = Ad(K⁻¹)`. -/
noncomputable instance uqSl2RigidCategory :
    RigidCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q)) :=
  TauCeti.FiniteHopfModuleCat.rigidCategory (TauCeti.UqSl2.antipode_bijective q)

/-- The pivotal structure on finite `U_q(sl₂)`-modules with pivot `K⁻¹` (§8.5): the double-dual
comparison `v ↦ (φ ↦ φ(K⁻¹ v))`, monoidal because `K⁻¹` is group-like and `S² = Ad(K⁻¹)`. -/
noncomputable instance uqSl2PivotalCategory :
    TauCeti.PivotalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q)) where
  pivotalIso := TauCeti.FiniteHopfModuleCat.unitEvalNatIso (TauCeti.UqSl2.kUnit q)⁻¹
    (fun a => by simpa using TauCeti.UqSl2.antipode_antipode q a)
  pivotalIso_isMonoidal := TauCeti.FiniteHopfModuleCat.unitEvalNatIso_isMonoidal _ (by
    rw [TauCeti.UqSl2.kUnit_inv]
    exact ⟨TauCeti.UqSl2.counit_kInv q, TauCeti.UqSl2.comul_kInv q⟩)

/-- Sphericity of finite `U_q(sl₂)`-modules (§8.5): with the pivot `K⁻¹` the right and left traces
of a module endomorphism `f` are `tr(K⁻¹ f)` and `tr(K f)`, and they agree when `q − q⁻¹ ≠ 0`. -/
theorem uqSl2_sphericalCategory (hq : q - q⁻¹ ≠ 0) :
    TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q)) := by
  sorry

end UqSl2Pivotal
```

**Tested:** I appended the block to a copy of this head's `Suggested.lean`, with the five imports, still in `module` form under `@[expose] public section`. Run with `lake env lean` at main's pins (`2fd255d9`/`1b1ccf4b`, toolchain `v4.36.0-rc2`), it exits 0 with exactly five `declaration uses sorry` warnings: the four existing headlines and `uqSl2_sphericalCategory`. No line exceeds 100 characters. The probe of the new headline fails every alternative.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`, Mathlib `f6090c70` and `v4.35.0-rc3`, while the diff adds §8.5 citations of `TauCeti.UqSl2.counit_kInv`, `comul_kInv`, `antipode_bijective` and `TauCeti.pivotalExactPairing`, which exist only at `2fd255d9`. Carried as R01.
- R02 — not repaired: `:33`–`:41` still says CategoricalOperatorAlgebras CA1a–CA2a "consume these objects from §§0.2–0.3", while #888 at `3e67101a` `:45` says "QuantumGroups consumes CA1a and CA2a". Carried as R02.
- R03 — not repaired: the description still says "Add Q9 to build `RepUqg`" and "Prerequisites: #1125 and #1124". #1649 `79e1cb6` still conflicts in both files. Carried as R03.
- R04 — partly repaired: `Suggested.lean:70`–`:76` now names "§8.5 rigid, pivotal and spherical structure … with the pivot `K⁻¹` and the sphericity hypothesis `q − q⁻¹ ≠ 0`", but under "Not statable", because the carriers are in modules "which this file does not import". The q = ±1 Check is added (`:1684`). Carried as R04.

## Verified sound

**Head, scope and gate.**
- **Head:** `a9eaeefe9cef5c7f3054ae7630a4ca93bf154a6c` with a clean worktree. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- **Gate:** I re-ran it (`gate … --base origin/main`) on this head. Every check is 0 (`set_option`, `sorry-data`, `readme-ids-missing`, `statement-hygiene`, `stray-files`, `outside-folder`, `depcheck`, `prnum`, `latex`, …) and the result is `OK`, matching the worker's gate, which also has `build=0`.
- **Dependency check** (unmodified output of the required command): `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The diff adds no supplier edge: it names Tau Ceti declarations and PivotalSpherical, which is on main and already a supplier.
- **Policy:** the changed lines contain no LaTeX, pull-request number, process word, machine path or `lemma`.

**Elaboration at the branch pin.**
- **Build:** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:120`, `:152`, `:163` and `:173`. These are the previous report's lines shifted by the seven docstring lines.
- **Signatures:** I ran `#check @name` for all six declarations in one scratch copy and elaborated it once. The types are identical to `scratch/signatures.md` and to the previous review's. The diff changes no statement. The one lead, `AlgebraicHaar` dropping `[StarModule ℂ A]`, is harmless because no field uses it.
- **Padding probe:** replacing each `sorry` with `first | rfl | infer_instance | trivial | simp | decide` fails on all four (`:134`, `:157`, `:168`, `:179` of the probe copy).

**Tau Ceti at `2fd255d9`, the names the diff adds.** These were elaborated by `#check` in a scratch file run with `lake env lean` from the content checkout at main's pins. Every module had its object file, and nothing was rebuilt.
- `TauCeti.UqSl2.counit_kInv` and `comul_kInv` (`UqSl2/Hopf.lean:208`, `:192`; `[Fact (q ≠ 0)]`): `ε(K⁻¹) = 1` and `Δ(K⁻¹) = K⁻¹ ⊗ K⁻¹`, exactly the two fields of Mathlib's `IsGroupLikeElem`.
- `TauCeti.UqSl2.antipode_antipode` (`Antipode.lean:59`): `S(S x) = K⁻¹ x K`, which is `Ad(K⁻¹)`.
- `TauCeti.UqSl2.antipode_bijective` (`Antipode.lean:73`): built from `antipode_bijective_of_antipode_antipode (g := (kUnit q)⁻¹)`.
- The Hopf instance (`Hopf.lean:30`, `:167`) needs `[Fact (q ≠ 0)]`, which matches the README's "for every q≠0".
- `TauCeti.FiniteHopfModuleCat.rigidCategory` (`Rigid.lean:146`): takes `Function.Bijective (antipode k)`.
- `unitEvalNatIso` (`FiniteHopfModuleCat/Pivotal.lean:119`): components `m ↦ (φ ↦ φ(g m))` (`:99`).
- `unitEvalNatIso_isMonoidal` (`:221`): needs `IsGroupLikeElem k g`.
- `TauCeti.pivotalExactPairing` (`Pivotal/Basic.lean:187`): `ExactPairing Xᘁ X`, the pairing of `Xᘁ` with `Xᘁᘁ` transported along `φ_X`. This matches the README's "the chosen right-dual pairing transported along the pivot".
- `TauCeti.leftTrace` and `rightTrace` (`Trace.lean:88`, `:93`), unfolded at `:116` and `:123`.
- `TauCeti.SphericalCategory` (`Spherical.lean:69`): a `Prop` class asking that `leftTrace f = rightTrace f` for every endomorphism.
- `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`QuantumTrace.lean:41`): `q − q⁻¹ ≠ 0`, and `φ` is `UqSl2 q`-linear.
- The *Needs:* additions `QuantumGroups/UqSl2/{Antipode,Hopf}` exist.
- At the pin, the instantiation `RigidCategory`/`PivotalCategory` on `FiniteHopfModuleCat ℂ (UqSl2 q)` and the sphericity statement elaborate (R04's block).

**The trace identification (`:1657`–`:1662`), computed.**
- **Coevaluation:** by `leftTrace_eq_pivotalIsoApp`, the pivotal coevaluation is `η_{Xᘁ,Xᘁᘁ}` followed by `Xᘁ ◁ φ_X⁻¹`. It sends `1 ↦ Σ e^i ⊗ φ_X⁻¹(can e_i) = Σ e^i ⊗ g⁻¹e_i`, since `φ_X(g⁻¹e_i)(ψ) = ψ(e_i)`.
- **Evaluation:** by `rightTrace_eq_pivotalIsoApp`, the pivotal evaluation is `v ⊗ φ ↦ φ(gv)`.
- **Traces:** hence `rightTrace f = Σ e^i(g f e_i) = tr(gf)` and `leftTrace f = Σ e^i(f g⁻¹ e_i) = tr(g⁻¹f)`, as the README states.
- **Source convention:** the right-dual coevaluation `1 ↦ Σ u_i ⊗ u_i*` agrees with Virelizier Lemma 2.3 (`virelizier` lines 265–269, p.6).

**Ownership and overlaps.**
- **Overlap listing:** `scratch/overlaps.md` lists no dropped id in either direction. The diff renames no heading, so the consumers' citations still resolve: QuantumEnvelopingAlgebras "Q8 item 1" and HopfologicalAlgebra §2.1 "Q8 item 5".
- **Ownership:** `roadmaps grep 'SphericalCategory|pivotalExactPairing'` finds only PivotalSpherical on main (the general classes, which this README cites), #867 `:317` (general traces, no U_q) and the two QuantumGroups revisions. No other roadmap owns the U_q pivot or sphericity, so §8.5 is its owner.
- **Other open pull requests:** #888 and #867 are in R02, and #1649 is in R02 and R03.

**Seeded sample.**
- **In the changed passages:** none of the 15 seeded targets (0.2, 0.3, 1.1, 1.2, 2.1, 2.3, 3.2, 4.1, 4.2, 4.3, 5.2, 6.1, 6.2, 6.3, 8.3) contains a changed line, and the README flags no locator as unverified.
- **Checked against the text:**
  - 8.3: Virelizier Theorem 3.13 and Corollary 3.14 (`virelizier` lines 625–636, on p.13, whose page marker is line 608) say that submodules in category F are direct factors and that every such module is a finite sum of the L(n). This matches §8.3's *Needs:* locator "p.13".
  - §8.5's *Needs:* locators: Lemma 2.3 is at line 265, pp.6–7, and Proposition 4.1 at line 644, p.13, with its proof on p.14 (line 652).
- **Previously verified:** the other sampled locators were verified by the previous review (0.2, 1.2, 2.1, 2.3, 4.2, 4.3, 5.2, 6.3) or by earlier ones, and are untouched.

**Adversarial table.** q = 1/2 unless stated. Rows marked "r15 #n" carry the previous report's computed values for statements this diff leaves untouched. The rows marked "new" are computed for this head's changed passages.

| Row | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| new | §8.5 `K⁻¹` group-like, `S² = Ad(K⁻¹)` (`:1601`–`:1603`) | E; wrong pivots K, 2K⁻¹ | `S²(E) = K⁻¹EK = q⁻²E = 4E` (`antipode_antipode_e`); with K: `KEK⁻¹ = q²E = E/4 ≠ 4E`; `2K⁻¹`: `ε = 2 ≠ 1`, not group-like | pass | none |
| new | §8.5 U_q rigid and pivotal instances for q≠0 (`:1603`–`:1606`) | `[Fact (q ≠ 0)]`; q = 0 | both elaborate at `2fd255d9`; q = 0 has no Hopf instance (`Hopf.lean:30`) | pass | none |
| new | pivotal coevaluation and evaluation (`:1659`–`:1662`) | `L₁⁺`, `g = diag(2, 1/2)` | coev `1 ↦ (1/2)v⁰⊗v₀ + 2v¹⊗v₁`; ev `v_i⊗v^j ↦ δ_ij g_ii`; zigzag `v₀ ↦ 2·(1/2)v₀ = v₀`, `v₁ ↦ (1/2)·2v₁ = v₁` | pass | none |
| new | `rightTrace f = tr(gf)`, `leftTrace f = tr(g⁻¹f)` (`:1657`–`:1659`) | `L₁⁺` identity; `L₀⁻`; projection onto `v₀` | `5/2 = [2]_q` both sides; `L₀⁻`: −1, −1; projection (not `U_q`-linear, so not a morphism): `tr(gf) = 2 ≠ 1/2 = tr(g⁻¹f)` | pass | none |
| new | sphericity for `q − q⁻¹ ≠ 0` (`:1663`–`:1666`) | `L₁⁺ ⊕ L₁⁺`, `f = M ⊗ id`, `M = [[1,2],[0,3]]`; q = i | `tr(Kf) = 4·5/2 = 10 = tr(K⁻¹f)`; at q = i, `q − q⁻¹ = 2i ≠ 0`, and `tr((K−K⁻¹)f) = (q−q⁻¹)tr([E,Ff]) = 0` covers non-semisimple modules | pass | none |
| new | "at generic q … q²≠1" (`:1666`–`:1667`) | q = 1/2; q = −1 | `q − q⁻¹ = −3/2 ≠ 0`; q = −1 is not generic (`(−1)² = 1`) and `q − q⁻¹ = 0` | pass | none |
| new | q = ±1 Check (`:1684`) | ℂ with K = 2, E = F = 0 | `(q−q⁻¹)⁻¹ = 0⁻¹ = 0` (`Basic.lean:79`), `q² = q⁻² = 1`: commutative; the tuple elaborates as `GeneratorTuple 1 ℂ` and `GeneratorTuple (−1) ℂ`; right `tr K⁻¹ = 1/2`, left `tr K = 2`; pivot K: right 2, left 1/2 | pass | none |
| new | `Suggested.lean:70`–`:76` "not statable" | `358314d4`; `2fd255d9` | 0 of the 7 named modules exist; R04's block elaborates with 5 `sorry` warnings | fail | R04 |
| r15 #13 | `schur_orthogonality` (headline) | `SU_(1/2)(2)`, `F̃ = diag(2, 1/2)` | `h(a*a) = 1/5`, `h(c*c) = 4/5`, `h(aa*) = 4/5`, matching the Haar values | pass | none |
| r15 #19 | `compactType_iff` (headline) | ℂ; ℂ[C₂]; zero ring; ℂ[x] | true/true; `|a|²+|b|²`; `h(1) = 0 ≠ 1`, excluded by `Nontrivial`; false/false | pass | none |
| r15 #20 | `haar_modular_automorphism` (headline) | `SU_(1/2)(2)`; ℂ[S₃] | `θ(a) = 4a`, `h(a*θa) = 4/5 = h(aa*)`; θ = id | pass | none |
| r15 #21 | `haar_trace_iff_antipode_involutive` (headline) | ℂ[S₃]; `SU_(1/2)(2)` | both true; `1/5 ≠ 4/5` and `S²(c) = c/4 ≠ c` | pass | none |
| r15 #1 | §0.1 legs | H = ℂ, A = C(C₂) | `U_12U_13 = u⊗u`; two ι₂ legs give `1 ≠ u⊗u` | pass | none |
| r15 #2 | §0.1 non-injective leg, flip | φ = ε | `T_ε = 0`, `‖T‖ = 1`; `1⊗u ≠ u⊗1` | pass | none |
| r15 #3 | 0.2 standard vs rescaled cups | `(2R, R̄/2)` on ℂ² | norms² 8 and 1/2, product 2 = d; traces differ | pass | none |
| r15 #4 | 0.2 `d ≥ 1` | `SU_(1/2)(2)`; character | `d = 5/2 > 2`; `25/4 = 1 + 21/4`; d = 1 | pass | none |
| r15 #5 | 0.3 truncated fusion | m = 3; m = 4 | `1⊗1 = 0`; `0⊕2`, `[4] = 0` | pass | none |
| r15 #6 | 0.3 cup, projection, loop | d = 5/2 | `tr₂(p) = 4/25`, `tr₂(1−p) = 21/25`, `β = 25/4` | pass | none |
| r15 #7 | 1.1 Δ on S₃ | g = (12), h = (23) | `Δf(g,h) = 1`, `Δf(h,g) = 0` | pass | none |
| r15 #8 | 1.2 cancellation fails on {1,0} | `Δ(A)(A⊗1)` | dimension 3 of 4 | pass | none |
| r15 #9 | 1.2 Fell absorption | Γ = ℤ | `W(δ₁⊗δ₂) = δ₁⊗δ₃` | pass | none |
| r15 #10 | 2.1 isometry excludes 0 | U = 0; H = 0 | `0 ≠ 1`; H = 0 holds | pass | none |
| r15 #11 | 2.2 unitarisation | `U = [[1,2],[0,−1]]` | `T = [[1,1],[1,3]]`, `U*TU = T` | pass | none |
| r15 #12 | 2.3 regular corepresentation | C₂; S₃ | 1+1 = 2; 1+1+4 = 6 | pass | none |
| r15 #14 | 3.1 `S(u_ij) = u_ji*` | c, c* | `S(c) = u₁₂* = −qc`, `S(c*) = −q⁻¹c*`, `S²(c) = q²c = c/4` | pass | none |
| r15 #15 | 3.2 Plancherel, characters | a + c; λ = 1, 2 | `1/5 + 4/5 = 1`; `f₁*f₁(a) = 4 = f₂(a)`; Vandermonde det 3 | pass | none |
| r15 #16 | 3.3 pivotal traces | F = I₂; `diag(2, 1/2)` | 2 = 2; `5/2 = 5/2` | pass | none |
| r15 #18 | 3.4 modular group | a, c | `σ_{−i}(a) = 4a`; `τ_{−i}(c) = c/4` | pass | none |
| r15 #22 | 5.1 relations ⇔ unitarity | entries of `u*u`, `uu*` | five relations; a = 0, c = 1 gives `1/4 ≠ 1` | pass | none |
| r15 #23 | 4.2 pentagon, `Δ_r` | ℤ | both words `(1,3,6)` | pass | none |
| r15 #24 | 4.2 C*-norm vs Haar norm | 1 + u on C₂ | 2 vs `√2` | pass | none |
| r15 #25 | 4.3 Følner, free group | ℤ; F₂ | `2/(2N+1)`; `2√3 < 4` | pass | none |
| r15 #26 | 5.2 cup, sign, bound | `F = [[0,1],[−2,0]]` | `FF̄ = −2I`, `‖E‖² = 5`, `5/2 ≥ 2` | pass | none |
| r15 #27 | 5.2 n = 1 | F = 1 | `u² = 1`: C*(ℤ/2) | pass | none |
| new (untouched, computed here) | 6.1 reconstruction Checks | Hilb_f; Rep(C₂); Rep(S₃) | coefficient algebra ℂ; `1 + 1 = 2 = dim C(C₂)`, sign collapsed gives 1; `1²+1²+2² = 6` vs diagonal `1+1+2 = 4` | pass | none |
| r15 #28 | 6.2 truncations | H = 0; H = ℂ | quotient ℂ; `dim A_{≤1} = 2` | pass | none |
| r15 #29 | 6.3 cancellative compact semigroup | {1,0}; C₂ | `0·1 = 0·0`, `1 ≠ 0`; Haar 1/2 each | pass | none |
| r15 #30 | 7.1 Haar moments | q = 1/2; ±1 | `4/5`, `16/21`; `1/2`, `1/3` | pass | none |
| r15 #31 | 7.1 weighted-shift character | ξ₂, ξ₃, ξ₅₀ | 0.433, 0.611, 0.976 | pass | none |
| r15 #32 | 7.1 q = −1 model | Pauli matrices | `a*a + c*c = 1`, `ac = −ca` | pass | none |
| r15 #33 | 7.2 dimension recurrences | n = 2, d = 5/2 | 1, 2, 3, 4; 1, 5/2, 21/4, 85/8 | pass | none |
| r15 #34 | 7.2 n = 2 normal form | `F = [[0,1],[−q⁻¹,0]]` | `FF̄ = −q⁻¹I`; `[[a, −qc*],[c, a*]]` | pass | none |
| r15 #35 | 7.2 n = 3 | ε(χ) | 3 ∉ [−2,2]; `m₄ = 2` vs 1 | pass | none |
| r15 #36 | 8.1 quantum integers | r = −2…2 | −5/2, −1, 0, 1, 5/2 | pass | none |
| r15 #37 | 8.1 Ore tower at q = i | `δ_E(FK)` vs `δ_E(q²KF)` | both `K(K−K⁻¹)/(2i)` | pass | none |
| r15 #38 | 8.1 PBW sign | a = b = 1 | `KF = 4FK` | pass | none |
| r15 #39 | 8.2 ladders | `L₂⁺`; `L₁⁻` | weights 1/4, 1, 4; `EF−FE = diag(−1,1)` | pass | none |
| r15 #40 | 8.3 Casimir | `L₀⁺, L₁⁺, L₂⁺` | 10/9, 17/9, 65/18; `FE`, `EF` both `(17/9)I` on `L₁⁺` | pass | none |
| r15 #41 | 8.4 local finiteness | `L₀⁻`; `⊕_ℕ L₀⁺`; Verma M(1) | locally finite, not type 1; dimension 1 each; not locally finite | pass | none |
| r15 #42 | §8.5 Clebsch–Gordan, `Δ(E²)` Checks (untouched) | m = n = j = 1; r = 2 | `α₁ = −1/2`, top coefficient `1/2 − 1/2 = 0`; `q[2] = 5/4` vs 5 | pass | none |
| r15 #44 | 8.6 invariant metric | m = 1 | `h₁/h₀ = 1/2`; `⟨Ev₁,v₀⟩ = 1 = q⁻¹h₁` | pass | none |
| r15 #45 | 8.7 classical specialisation | m = 2 | `(2 choose j)` = 1, 2, 1; `[2]_v → 2` | pass | none |

r15 rows #17 (trace convention) and #43 (sphericity hypothesis) are superseded by the "new" rows on the same statements, which now carry the README's own text.

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008), is `uncertified` (paywalled) and cited by locator only. The changed passages do not cite it. The untouched Timmermann locators of §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1, 7.1 and 8.6 stand as recorded in the previous report.
- **Descriptions not read:** the descriptions of #888, #867 and #1649 (R02, R03). Their README texts were read at the heads named.
- **Ownership against open pull requests** was checked against the sibling checkouts the brief lists, the overlap listing and `roadmaps grep`. Pull requests outside those were not searched.

## Source issues

- none
