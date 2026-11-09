# Review of QuantumGroups (pull request #1705 at 4a56324)

**Verdict:** needs changes

Incremental re-review of the 17 lines changed in `TauCetiRoadmap/QuantumGroups/` since `a9eaeef`, the head the previous review read. The diff touches `README.md` in three places: the §0.2 ownership list (`:33`–`:38`), the §0.2 sentence that transports the standard solutions to a dual functor (`:298`–`:301`), and the Downstream consumers entry for CategoricalOperatorAlgebras (`:1792`–`:1795`). Each now names "the balanced unitary dual functor". `Suggested.lean` and everything outside the folder are unchanged.

The mathematics the diff adds is correct: the dual functor induced by standard solutions is a dagger functor with unitary tensorator, which is what the new gloss `(f∨)†=(f†)∨` says, and "balanced" is the literature's name for it (Penneys, the π = 1 unitary dual functor). The term was already in use in §3.3 (`:767`, `:774`), so defining it in §0.2 repairs a forward reference. One new finding: the sentence now makes an explicit claim with no locator, and the source that proves it is at hand (R05, P3).

None of the four previous findings is repaired. The branch still pins Tau Ceti `358314d4` (R01), the ownership of §§0.2–0.3 is still claimed on both sides (R02, where the diff adds the dual functor to the list of objects both sides claim), the description and the conflict with #1649 are unchanged (R03), and the `Suggested.lean` docstring still lists the §8.5 sphericity headline as not statable for a reason that is not a missing carrier (R04).

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Sources are cited as `<id> line N` in the worker's cache.

## R01 (P2) — The branch pins Tau Ceti `358314d4`, where nothing Layer 8 cites exists

**Location:** `lake-manifest.json` on the branch pins Tau Ceti `358314d4`, Mathlib `f6090c70` and `lean-toolchain` `v4.35.0-rc3`; main has `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`. In the folder: the `From Tau Ceti` contract (`:166`–`:192`), §8.5 (`:1601`–`:1606`, `:1657`–`:1665`) and the `Suggested.lean` docstring (`:21`–`:30`, `:70`–`:76`).

**Claim:** every cited declaration exists in the pinned Tau Ceti.

**Witness:** `TauCeti/QuantumGroups/`, `TauCeti/Algebra/Category/FiniteHopfModuleCat/{Pivotal,Rigid}.lean` and `TauCeti/CategoryTheory/Monoidal/Pivotal/` are absent at `358314d4`. At `2fd255d9` the cited names are at `UqSl2/Hopf.lean:192`, `:208`, `UqSl2/Antipode.lean:73`, `Pivotal/Basic.lean:187`, `Pivotal/Trace.lean:88`, `:93` (verified by the previous review; the pin has not moved).

**Repair:** merge `origin/main` into the branch, which brings main's `lake-manifest.json` and `lean-toolchain` (the branch changes neither), then re-run the gate. No folder file changes. This is the worker's rebase step.

Re-raised: R01 of the previous review. No repair report lists it as not actionable; the diff does not touch it.

## R02 (P2) — §§0.2–0.3 have a second owner, and the diff adds the dual functor to the objects both sides claim

**Location:** `:33`–`:41`: "Section 0.2 is the single home of C*-categories … conjugate solutions, standard solutions, intrinsic dimension, the balanced unitary dual functor and signed self-dualities; §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 come later in the build and consume these objects from §§0.2–0.3". Also `:1792`–`:1795`.

**Claim:** §§0.2–0.3 have one owner, and the two named roadmaps consume them.

**Witness:**
- **CategoricalOperatorAlgebras** (#888) at its head `c3fc64a4`, `README.md:40`–`:46`: "C*-tensor categories with solutions of the conjugate equations, standard solutions and intrinsic dimension, unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a"; `:2253` lists QuantumGroups as its consumer; `:513`–`:549` build the balanced unitary dual functor and the `t>0` family.
- **TemperleyLiebOperatorAlgebras** (#867) at `ba43cc7a`, `:1344`–`:1362`: its Temperley–Lieb solution "is CA2a's balanced solution", with `(f∨)† = (f†)∨` proved there.
- **QuantumGroups #1649** (`79e1cb6`), `:30`–`:46`: assigns these objects to CategoricalOperatorAlgebras.

**Detail.** Each side names the other as its consumer: the P2 case "an object that each hands to the other". QuantumGroups is on main and CategoricalOperatorAlgebras is in the merge order (line 227), so a QuantumGroups citation of CA1a/CA2a would be UPWARD. This head's arrangement (owner here) is the consistent one for this folder; it needs the other side to follow. The README cannot carry that, so the statement belongs in this pull request's description.

**Repair:** state in the description that §0.2 and §0.3 own these objects, that #888 (`:40`–`:46`, `:513`–`:549`, `:2253`) and #867 (`:1344`–`:1362`, Layer 3) are to cite QuantumGroups §0.2 and §0.3 instead of building them, and that #1649's Layer 0 scope paragraph is superseded. No folder file changes. (The alternative, owner there, means rewriting `:33`–`:41` and `:1792`–`:1795` as #1649 `:30`–`:46` does and importing nothing from #888 or #867.)

Re-raised: R02 of the previous review.

## R03 (P3) — A conflicting revision with no stated order, and a description that describes a different head

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg" and the description ("Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first", "Only the roadmap README changes").

**Claim:** the description matches the head, and no other open revision of the folder conflicts with it.

**Witness:** this head has no Q9, no `RepUqg` and no braiding; it changes `Suggested.lean` (183 lines, four headlines). The overlap listing reports that #1649 (`79e1cb6`) "and #1705 conflict in `README.md`, `Suggested.lean`". Neither description names an order.

**Repair:** retitle and redescribe the pull request for what the head is (Layers 0–8 on Tau Ceti's rank-one theory, four `Suggested.lean` headlines), drop the #1125/#1124 prerequisites, and state which revision prevails (close #1649, or rebase one onto the other), in the same paragraph as R02's ownership sentence. No folder file changes.

Re-raised: R03 of the previous review.

## R04 (P2) — The §8.5 sphericity headline is listed as not statable for a reason that is not a missing carrier

**Location:** `Suggested.lean:70`–`:76`: "§8.5 rigid, pivotal and spherical structure of the finite `U_q(sl₂)`-modules … its carriers are … in the modules … which this file does not import." The README makes it a headline at `:9`–`:13`, `:72` and `:1662`–`:1667`.

**Claim:** the headline is not statable at the pins.

**Witness:** at `358314d4` none of the seven named modules exists, so the true reason at the branch pin is a missing carrier, not an import choice. At `2fd255d9`/`1b1ccf4b` the previous review's block (two real-bodied instances `uqSl2RigidCategory`, `uqSl2PivotalCategory` and the headline `uqSl2_sphericalCategory (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`) elaborates with five `sorry` warnings and no error, and the one-tactic probe does not close it.

**Repair:** unchanged from the previous review. After R01's merge, add the five imports and the block given there, delete `:70`–`:76`, list the sphericity headline under "Stated here", and name the three declarations in §8.5 (`:1601`–`:1606`, `:1662`–`:1666`). If a repair round runs before the merge, replace only "which this file does not import" with the true reason at that pin: the pinned Tau Ceti has none of these modules.

Re-raised: R04 of the previous review. The passage is unchanged since `a9eaeef`.

## R05 (P3) — The dagger-compatibility of the balanced unitary dual functor has no locator

**Location:** `:298`–`:301`: "Transport these solutions to the balanced unitary dual functor, a dagger-compatible dual functor (`(f∨)†=(f†)∨`) with unitary tensorator, and to the pivotal and spherical structures of PivotalSpherical."

**Claim:** every theorem carries a locator. The sentence now asserts the identity `(f∨)† = (f†)∨` and the unitarity of the tensorator for the dual functor induced by standard solutions; the locators that precede it (Longo–Roberts Lemma 3.3, Theorems 3.8, 3.11; Neshveyev–Tuset Definitions 2.2.10, 2.2.12, Theorems 2.2.14, 2.2.17) are about standard solutions and dimension, not about the functor.

**Witness:** `nt` line 1633 (Theorem 2.2.19, printed p.36): the maps `U ↦ Ū`, `T ↦ T∨` form a contravariant functor, unitary when all solutions used are standard, with square naturally unitarily isomorphic to the identity; the proof at lines 1639–1644 is exactly `T*∨ = T∨*`. `nt` line 1661 (Remark 2.2.20(ii), p.37): the tensor structure `F₂(U,V)` defined through `R_{U⊗V}`. The identity fails for non-standard solutions: see the adversarial row below (`(f∨)† = 2·conj f` against `(f†)∨ = conj f / 2`).

**Repair:** end the sentence with the locator "(Neshveyev–Tuset Theorem 2.2.19 and Remark 2.2.20(ii), pp.36–37)". The sentence is otherwise correct; "balanced" is Penneys' name for the unitary dual functor with trivial grading homomorphism, which on a category with simple unit is the one the standard solutions induce.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`, Mathlib `f6090c70`, toolchain `v4.35.0-rc3`; the Layer 8 and `From Tau Ceti` citations exist only at `2fd255d9`. Carried as R01.
- R02 — not repaired: `:33`–`:41` still says CategoricalOperatorAlgebras CA1a–CA2a "consume these objects from §§0.2–0.3", while #888 at `c3fc64a4` `:45` says "QuantumGroups consumes CA1a and CA2a". The diff adds "the balanced unitary dual functor" to both lists. Carried as R02.
- R03 — not repaired: the description still says "Add Q9 to build `RepUqg`" and "Prerequisites: #1125 and #1124". #1649 `79e1cb6` still conflicts in both files. Carried as R03.
- R04 — not repaired: `Suggested.lean:70`–`:76` is byte-identical to the previous head, still under "Not statable" with the reason "which this file does not import". Carried as R04.

## Verified sound

**Head, scope and gate.**
- **Head:** `4a563240dae9cdade8687afc0bab74c71106850f`, clean worktree. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The folder diff since `a9eaeef` is 17 lines of `README.md`; `Suggested.lean` is unchanged.
- **Gate:** I re-ran `gate … --base origin/main` on this head: every check is 0 (`set_option`, `latex`, `prnum`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder`, `dirty`, …) and the result is `OK`, matching the worker's gate, which also records `build=0`.
- **Dependency check** (unmodified output of the required command): `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The diff adds no supplier edge.
- **Policy on the changed lines:** no LaTeX, pull-request number, process word, machine path or `lemma`. The code span `(f∨)†=(f†)∨` matches the style of the neighbouring `bar(r) r=ε φ_X`.

**Elaboration at the branch pin.**
- **Build:** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:120`, `:152`, `:163`, `:173`.
- **Signatures:** the file is unchanged since `a9eaeef`, and `scratch/signatures.md` for this head is identical to the previous review's `#check @name` run over all six declarations. The one lead, `AlgebraicHaar` not mentioning `[StarModule ℂ A]`, is harmless because no field uses it.
- **Padding probe:** unchanged file; the previous review's probe (`first | rfl | infer_instance | trivial | simp | decide` fails on all four headlines) stands.

**The changed passages.**
- **Vocabulary:** "balanced unitary dual functor" is the literature's name (Penneys, *Unitary dual functors for unitary multitensor categories*, Higher Structures 2020, arXiv 1808.00323: unitary dual functors correspond to groupoid homomorphisms π from the universal grading groupoid to ℝ>0; the π = 1 one is the balanced one, and it is the unitary spherical one). CategoricalOperatorAlgebras #888 `:513`–`:549` and TemperleyLiebOperatorAlgebras #867 `:1344`–`:1362` use the term in the same sense. In this README the term was already used in §3.3 (`:767`, `:774`) before the diff; §0.2 `:299` now defines it as the dual functor the standard solutions induce, so the first use in build order is now at its definition.
- **Correctness of the gloss:** on a C*-tensor category with simple unit the standard solutions are unique up to unitary transport (`nt` line 1458, Proposition 2.2.13), so the induced dual functor is well defined; it is a dagger functor (`nt` 1633, Theorem 2.2.19) with tensorator defined through `R_{U⊗V}` (`nt` 1661); since `R_{U⊗V} = (ι⊗R_U⊗ι)R_V` is again standard (multiplicativity, `nt` 1596, Theorem 2.2.17 with 1512–1513), the comparison of Proposition 2.2.13 makes the tensorator unitary. The dual functor of standard solutions has `tr_L = tr_R` (`nt` 1501–1512, Theorem 2.2.14: standard iff `φ_U = ψ_U`), which is the balancing.
- **The sample where it falls in the changed passage (0.2):** Longo–Roberts Lemma 3.3 (`longoroberts` 389: two solutions give the same left inverse iff they differ by a unitary on the conjugate), Theorem 3.8 (`longoroberts` 621: the product of standard left and right inverses is standard), Theorem 3.11 (`longoroberts` 681: `‖R‖²‖R̄‖² ≥ d(ρ)²` with equality iff a multiple of `R` is standard); Neshveyev–Tuset Definition 2.2.10 (`nt` 1427, intrinsic dimension), Definition 2.2.12 (`nt` 1446, standard solutions, p.32), Theorem 2.2.14 (`nt` 1501, p.33), Theorem 2.2.17 (`nt` 1596, p.35: `d_i(U) = min ‖R̄‖‖R‖`, attained exactly on scalar multiples of standard solutions), Definition 2.7.1 (`nt` 3236, dimension functions). All support the statements they are cited for.
- **§3.3 (sample target, depends on the changed passage):** `:767`–`:775` uses §0.2's balanced unitary dual functor for `Pol(G)` with the pivotal comodule map `j_V`, and states that the squared norms of its evaluation and coevaluation are both `Tr F = Tr F⁻¹`. This is the standard-solution normalisation `‖R‖² = ‖R̄‖² = d` of `nt` 1454, consistent with `:299`.
- **Downstream consumers `:1792`–`:1795`:** the list of objects now agrees word for word with the §0.2 ownership list `:33`–`:38`.

**Ownership and overlaps.**
- The overlap listing reports no dropped id in either direction and no id only an open revision defines. The diff renames no heading; QuantumEnvelopingAlgebras "Q8 item 1" and HopfologicalAlgebra §2.1 "Q8 item 5" still resolve.
- Library at the pins: Mathlib `f6090c70` has no dagger category or C*-tensor category under `Mathlib/CategoryTheory`, and Tau Ceti `358314d4` has no unitary dual functor or C*-category (the only hits for "unitary dual" are the unitary dual of a compact group in `RepresentationTheory/Compact/`). PivotalSpherical on main owns the algebraic pivotal and spherical structures, which §0.2 cites. The double ownership against #888/#867 is R02.
- The merge order lists CategoricalOperatorAlgebras at line 227 and TemperleyLiebOperatorAlgebras at line 243 and not QuantumGroups, which is on main; citing either would be UPWARD, so "owner here" is the only arrangement available to this folder.

**Seeded sample.** Of the fifteen seeded targets only 0.2 contains a changed line, and its locators are checked above. 3.3 depends on the changed sentence and is checked above. The others (0.1, 0.3, 2.3, 3.4, 4.1, 4.2, 4.3, 5.2, 6.3, 8.2, 8.3, 8.6, 8.7) are untouched and were verified by the previous reviews; the README flags no locator as unverified.

**Adversarial table.** Rows marked "r17 …" carry the previous report's computed values for statements this diff leaves untouched (q = 1/2 unless stated). Rows marked "new" are computed here for the changed passage and what depends on it.

| Row | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| new | §0.2 `(f∨)†=(f†)∨` for the dual functor of standard solutions (`:299`–`:300`) | `Hilb_f`, `X = ℂ²`, `R = Σ e_i⊗e_i`, `f ∈ End(X)` | `f∨ = fᵀ`; `(f∨)† = conj(f) = (f†)∨` | pass | none |
| new | same identity for a non-standard solution (negative control) | `X = ℂ²` with `(2R_X, R̄_X/2)`, `Y = ℂ` standard, `f : X → Y` | `(f∨)† = 2·conj(f)`; `(f†)∨ = conj(f)/2`; unequal | pass (hypothesis "standard" needed) | R05 locator |
| new | "balanced" excludes the other unitary dual functors | ℤ-graded `Hilb_f`, `X = ℂ` in degree 1, `R = t^{1/2}`, `R̄ = t^{−1/2}`, `t > 0` | dagger functor for every `t` (scaling multiplicative in degree); `tr_L(1_X) = t`, `tr_R(1_X) = t⁻¹`; `‖R‖ = ‖R̄‖` forces `t = 1` | pass | none |
| new | unitary tensorator (`:300`) | `X = Y = ℂ²` standard | `R_{X⊗Y} = (ι⊗R_X⊗ι)R_Y`, `‖R_{X⊗Y}‖² = 4 = d(X)d(Y)`; `F₂` the canonical identification, unitary | pass | none |
| new | §3.3 "squared norms are both `Tr F = Tr F⁻¹`" (`:769`–`:770`) | `SU_(1/2)(2)` fundamental, `F = diag(2, 1/2)` | `Tr F = 5/2 = Tr F⁻¹ = ‖R‖² = ‖R̄‖²`; with `F = I₂`: `2 = 2` | pass | none |
| new | ownership list `:33`–`:38` vs #888 `:40`–`:46` | the six objects of CA2a | all six appear in both "single home" lists | fail | R02 |
| r17 #13 | `schur_orthogonality` (headline) | `SU_(1/2)(2)`, `F̃ = diag(2, 1/2)` | `h(a*a) = 1/5`, `h(c*c) = 4/5`, `h(aa*) = 4/5` | pass | none |
| r17 #19 | `compactType_iff` (headline) | ℂ; ℂ[C₂]; zero ring; ℂ[x] | true/true; `|a|²+|b|²`; `h(1) = 0 ≠ 1`, excluded by `Nontrivial`; false/false | pass | none |
| r17 #20 | `haar_modular_automorphism` (headline) | `SU_(1/2)(2)`; ℂ[S₃] | `θ(a) = 4a`, `h(a*θa) = 4/5 = h(aa*)`; θ = id | pass | none |
| r17 #21 | `haar_trace_iff_antipode_involutive` (headline) | ℂ[S₃]; `SU_(1/2)(2)` | both true; `1/5 ≠ 4/5` and `S²(c) = c/4 ≠ c` | pass | none |
| r17 new | §8.5 `K⁻¹` group-like, `S² = Ad(K⁻¹)` | E; wrong pivots K, 2K⁻¹ | `S²(E) = q⁻²E = 4E`; `KEK⁻¹ = E/4`; `ε(2K⁻¹) = 2` | pass | none |
| r17 new | §8.5 traces `rightTrace f = tr(gf)`, `leftTrace f = tr(g⁻¹f)` | `L₁⁺` identity; `L₀⁻`; non-morphism projection | `5/2 = 5/2`; −1, −1; `2 ≠ 1/2` | pass | none |
| r17 new | sphericity for `q − q⁻¹ ≠ 0` | `L₁⁺ ⊕ L₁⁺`, `f = M ⊗ id`; q = i | `tr(Kf) = 10 = tr(K⁻¹f)`; `tr((K−K⁻¹)f) = (q−q⁻¹)tr([E,Ff]) = 0` | pass | none |
| r17 new | q = ±1 Check (`:1684`) | ℂ with K = 2, E = F = 0 | `(q−q⁻¹)⁻¹ = 0`, commutative; right `1/2`, left `2` | pass | none |
| r17 new | `Suggested.lean:70`–`:76` "not statable" | `358314d4`; `2fd255d9` | 0 of 7 modules exist; the block elaborates with 5 `sorry` | fail | R04 |
| r17 #1 | §0.1 legs | H = ℂ, A = C(C₂) | `U_12U_13 = u⊗u`; two ι₂ legs give `1 ≠ u⊗u` | pass | none |
| r17 #2 | §0.1 non-injective leg, flip | φ = ε | `T_ε = 0`, `‖T‖ = 1`; `1⊗u ≠ u⊗1` | pass | none |
| r17 #3 | 0.2 standard vs rescaled cups | `(2R, R̄/2)` on ℂ² | norms² 8 and 1/2, product 2 = d; traces differ | pass | none |
| r17 #4 | 0.2 `d ≥ 1` | `SU_(1/2)(2)`; character | `d = 5/2 > 2`; `25/4 = 1 + 21/4`; d = 1 | pass | none |
| r17 #5 | 0.3 truncated fusion | m = 3; m = 4 | `1⊗1 = 0`; `0⊕2`, `[4] = 0` | pass | none |
| r17 #6 | 0.3 cup, projection, loop | d = 5/2 | `tr₂(p) = 4/25`, `tr₂(1−p) = 21/25`, `β = 25/4` | pass | none |
| r17 #7 | 1.1 Δ on S₃ | g = (12), h = (23) | `Δf(g,h) = 1`, `Δf(h,g) = 0` | pass | none |
| r17 #8 | 1.2 cancellation fails on {1,0} | `Δ(A)(A⊗1)` | dimension 3 of 4 | pass | none |
| r17 #9 | 1.2 Fell absorption | Γ = ℤ | `W(δ₁⊗δ₂) = δ₁⊗δ₃` | pass | none |
| r17 #10 | 2.1 isometry excludes 0 | U = 0; H = 0 | `0 ≠ 1`; H = 0 holds | pass | none |
| r17 #11 | 2.2 unitarisation | `U = [[1,2],[0,−1]]` | `T = [[1,1],[1,3]]`, `U*TU = T` | pass | none |
| r17 #12 | 2.3 regular corepresentation | C₂; S₃ | 1+1 = 2; 1+1+4 = 6 | pass | none |
| r17 #14 | 3.1 `S(u_ij) = u_ji*` | c, c* | `S(c) = −qc`, `S(c*) = −q⁻¹c*`, `S²(c) = c/4` | pass | none |
| r17 #15 | 3.2 Plancherel, characters | a + c; λ = 1, 2 | `1/5 + 4/5 = 1`; `f₁*f₁(a) = 4 = f₂(a)`; Vandermonde det 3 | pass | none |
| r17 #16 | 3.3 pivotal traces | F = I₂; `diag(2, 1/2)` | 2 = 2; `5/2 = 5/2` | pass | none |
| r17 #18 | 3.4 modular group | a, c | `σ_{−i}(a) = 4a`; `τ_{−i}(c) = c/4` | pass | none |
| r17 #22 | 5.1 relations ⇔ unitarity | entries of `u*u`, `uu*` | five relations; a = 0, c = 1 gives `1/4 ≠ 1` | pass | none |
| r17 #23 | 4.2 pentagon, `Δ_r` | ℤ | both words `(1,3,6)` | pass | none |
| r17 #24 | 4.2 C*-norm vs Haar norm | 1 + u on C₂ | 2 vs `√2` | pass | none |
| r17 #25 | 4.3 Følner, free group | ℤ; F₂ | `2/(2N+1)`; `2√3 < 4` | pass | none |
| r17 #26 | 5.2 cup, sign, bound | `F = [[0,1],[−2,0]]` | `FF̄ = −2I`, `‖E‖² = 5`, `5/2 ≥ 2` | pass | none |
| r17 #27 | 5.2 n = 1 | F = 1 | `u² = 1`: C*(ℤ/2) | pass | none |
| r17 (6.1) | 6.1 reconstruction Checks | Hilb_f; Rep(C₂); Rep(S₃) | ℂ; `1 + 1 = 2`; `1²+1²+2² = 6` vs `4` | pass | none |
| r17 #28 | 6.2 truncations | H = 0; H = ℂ | quotient ℂ; `dim A_{≤1} = 2` | pass | none |
| r17 #29 | 6.3 cancellative compact semigroup | {1,0}; C₂ | `0·1 = 0·0`, `1 ≠ 0`; Haar 1/2 each | pass | none |
| r17 #30 | 7.1 Haar moments | q = 1/2; ±1 | `4/5`, `16/21`; `1/2`, `1/3` | pass | none |
| r17 #31 | 7.1 weighted-shift character | ξ₂, ξ₃, ξ₅₀ | 0.433, 0.611, 0.976 | pass | none |
| r17 #32 | 7.1 q = −1 model | Pauli matrices | `a*a + c*c = 1`, `ac = −ca` | pass | none |
| r17 #33 | 7.2 dimension recurrences | n = 2, d = 5/2 | 1, 2, 3, 4; 1, 5/2, 21/4, 85/8 | pass | none |
| r17 #34 | 7.2 n = 2 normal form | `F = [[0,1],[−q⁻¹,0]]` | `FF̄ = −q⁻¹I`; `[[a, −qc*],[c, a*]]` | pass | none |
| r17 #35 | 7.2 n = 3 | ε(χ) | 3 ∉ [−2,2]; `m₄ = 2` vs 1 | pass | none |
| r17 #36 | 8.1 quantum integers | r = −2…2 | −5/2, −1, 0, 1, 5/2 | pass | none |
| r17 #37 | 8.1 Ore tower at q = i | `δ_E(FK)` vs `δ_E(q²KF)` | both `K(K−K⁻¹)/(2i)` | pass | none |
| r17 #38 | 8.1 PBW sign | a = b = 1 | `KF = 4FK` | pass | none |
| r17 #39 | 8.2 ladders | `L₂⁺`; `L₁⁻` | weights 1/4, 1, 4; `EF−FE = diag(−1,1)` | pass | none |
| r17 #40 | 8.3 Casimir | `L₀⁺, L₁⁺, L₂⁺` | 10/9, 17/9, 65/18 | pass | none |
| r17 #41 | 8.4 local finiteness | `L₀⁻`; `⊕_ℕ L₀⁺`; Verma M(1) | locally finite, not type 1; dimension 1 each; not locally finite | pass | none |
| r17 #42 | §8.5 Clebsch–Gordan, `Δ(E²)` Checks | m = n = j = 1; r = 2 | `α₁ = −1/2`, top coefficient 0; `q[2] = 5/4` vs 5 | pass | none |
| r17 #44 | 8.6 invariant metric | m = 1 | `h₁/h₀ = 1/2`; `⟨Ev₁,v₀⟩ = 1 = q⁻¹h₁` | pass | none |
| r17 #45 | 8.7 classical specialisation | m = 2 | `(2 choose j)` = 1, 2, 1; `[2]_v → 2` | pass | none |

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008), is `uncertified` (paywalled) and cited by locator only. The changed passages do not cite it.
- **Penneys**, *Unitary dual functors for unitary multitensor categories*, is not in the manifest; the README cites no source for the term "balanced", and I checked the term against the paper's abstract and the two sibling roadmaps that use it, not against a cached text. No manifest entry is needed unless the author wants to cite it; the R05 locator into Neshveyev–Tuset covers the claim.
- **Descriptions not read:** the descriptions of #888, #867 and #1649 (R02, R03). Their README texts were read at the heads named.
- **Ownership against open pull requests** was checked against the sibling checkouts the brief lists, the overlap listing and the previous review's `roadmaps grep`. Pull requests outside those were not searched.

## Source issues

- none
