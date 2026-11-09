# Review of QuantumGroups (pull request #1705 at 7c3e850)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed in `TauCetiRoadmap/QuantumGroups/` since `4a56324`, the head the previous review read. The diff touches two passages: the §0.2 sentence transporting standard solutions to the balanced unitary dual functor now carries a locator and a one-clause proof of the unitarity of the tensorator (`README.md:299`–`:304`), and the `Suggested.lean` docstring item for the §8.5 sphericity headline now gives, as the reason it is not statable, that the pinned Tau Ceti has none of the seven modules it would need (`Suggested.lean:70`–`:77`). Nothing outside the folder changed.

Both repairs are correct at the branch pin: the locator lands on the theorem that proves `(f∨)† = (f†)∨`, the proof clause is exactly Neshveyev–Tuset's argument, and the seven modules are indeed absent at Tau Ceti `358314d4`. So R05 and R04 of the previous review are repaired. The three findings that live outside the folder files are untouched: the branch still pins Tau Ceti `358314d4` while the README's Layer 8 and `From Tau Ceti` citations exist only at `2fd255d9` (R01), CategoricalOperatorAlgebras at its current head `136b93af` still declares itself the single home of the §0.2 objects and QuantumGroups its consumer (R02), and the description still describes a different head with no order stated against #1649 (R03). The R04 repair also makes the docstring say two incompatible things about "the pinned Tau Ceti", which is R01 made visible inside the file.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Sources are cited as `<id> line N` in the worker's cache.

## R01 (P2) — The branch pins Tau Ceti `358314d4`, where nothing Layer 8 cites exists, and the docstring now contradicts itself about that pin

**Location:** `lake-manifest.json` on the branch pins Tau Ceti `358314d4`, Mathlib `f6090c70` and `lean-toolchain` `v4.35.0-rc3`; main has `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`. In the folder: the `From Tau Ceti` contract (`:166`–`:192`), §8.5 (`:1605`–`:1610`, `:1661`–`:1671`) and the `Suggested.lean` docstring (`:21`–`:30` and `:70`–`:77`).

**Claim:** every cited declaration exists in the pinned Tau Ceti.

**Witness:** at `358314d4` none of `TauCeti/QuantumGroups/UqSl2/{Antipode,Hopf}.lean`, `TauCeti/Algebra/Category/FiniteHopfModuleCat/{Pivotal,Rigid}.lean`, `TauCeti/CategoryTheory/Monoidal/Pivotal/{Basic,Trace,Spherical}.lean` exists (0 of 7; checked in the worktree's `.lake/packages/TauCeti`); at `2fd255d9` all 7 exist (checked in main's checkout). The docstring now says both "Proved in the pinned Tau Ceti and not restated: the Layer 8 algebra `TauCeti.UqSl2` … its Hopf structure … `TauCeti.FiniteHopfModuleCat`" (`:21`–`:30`) and "the pinned Tau Ceti has none of these modules" (`:76`), the modules being the ones that hold those declarations: no single pin makes both sentences true.

**Repair:** merge `origin/main` into the branch, which brings main's `lake-manifest.json` and `lean-toolchain` (the branch changes neither), then re-run the gate. After the merge the §8.5 sphericity headline becomes statable (the previous reviews' block, two real-bodied instances `uqSl2RigidCategory`, `uqSl2PivotalCategory` and the headline `uqSl2_sphericalCategory (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`, elaborates at `2fd255d9` with five `sorry` warnings): add the five imports and that block, delete `:70`–`:77`, list the headline under "Stated here" and name the three declarations in §8.5. Until the merge, no folder file changes.

Re-raised: R01 of the previous review. No repair report lists it as not actionable; the diff does not touch it.

## R02 (P2) — §§0.2–0.3 have a second owner

**Location:** `:33`–`:41`: "Section 0.2 is the single home of C*-categories … conjugate solutions, standard solutions, intrinsic dimension, the balanced unitary dual functor and signed self-dualities; §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 come later in the build and consume these objects from §§0.2–0.3". Also `:1795`–`:1798`.

**Claim:** §§0.2–0.3 have one owner, and the two named roadmaps consume them.

**Witness:**
- **CategoricalOperatorAlgebras** (#888) at its current head `136b93af`, `README.md:40`–`:46`: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories with solutions of the conjugate equations, standard solutions and intrinsic dimension, unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a"; `:2301`–`:2305` lists QuantumGroups as consuming "the balanced unitary dual functor, signed self-duality, standard solutions".
- **TemperleyLiebOperatorAlgebras** (#867) at `ba43cc7a`, `:1344`–`:1346`: its Temperley–Lieb solution "is CA2a's balanced solution", with the unitary dual tensorator and `(f∨)† = (f†)∨` proved there.
- **QuantumGroups #1649** (`9b3ff6cf`), `:30`–`:36`: assigns these objects to CategoricalOperatorAlgebras.

**Detail.** Each side names the other as its consumer: the P2 case "an object that each hands to the other". QuantumGroups is on main and CategoricalOperatorAlgebras is in the merge order (line 229, TemperleyLiebOperatorAlgebras line 245), so a QuantumGroups citation of CA1a/CA2a would be UPWARD; this head's arrangement (owner here) is the only one available to this folder, and it needs the other side to follow. The README cannot carry that, so the statement belongs in this pull request's description.

**Repair:** state in the description that §0.2 and §0.3 own these objects, that #888 (`:40`–`:46`, `:2301`–`:2305`, and its CA2a construction of the balanced dual functor) and #867 (`:1344`–`:1346`, Layer 3) are to cite QuantumGroups §0.2 and §0.3 instead of building them, and that #1649's Layer 0 scope paragraph is superseded. No folder file changes. (The alternative, owner there, means rewriting `:33`–`:41` and `:1795`–`:1798` as #1649 `:30`–`:36` does and importing nothing from #888 or #867.)

Re-raised: R02 of the previous review.

## R03 (P3) — A conflicting revision with no stated order, and a description that describes a different head

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg" and the description ("Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first", "Only the roadmap README changes").

**Claim:** the description matches the head, and no other open revision of the folder conflicts with it.

**Witness:** this head has no Q9, no `RepUqg` and no braiding; it changes `Suggested.lean` (184 lines, four headlines). The overlap listing for this head reports that #1649 (now at `9b3ff6cf`) "and #1705 conflict in `README.md`, `Suggested.lean`". Neither description names an order.

**Repair:** retitle and redescribe the pull request for what the head is (Layers 0–8 on Tau Ceti's rank-one theory, four `Suggested.lean` headlines), drop the #1125/#1124 prerequisites, and state which revision prevails (close #1649, or rebase one onto the other), in the same paragraph as R02's ownership sentence. No folder file changes.

Re-raised: R03 of the previous review.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`, Mathlib `f6090c70`, toolchain `v4.35.0-rc3`; 0 of the 7 §8.5 modules exist there, all 7 at `2fd255d9`. Carried as R01, now with the docstring's two incompatible sentences about the pin.
- R02 — not repaired: `:33`–`:41` unchanged; #888 moved to `136b93af` and `:40`–`:46` still says "have their single home here; QuantumGroups consumes CA1a and CA2a". Carried as R02.
- R03 — not repaired: the description still says "Add Q9 to build `RepUqg`" and "Prerequisites: #1125 and #1124"; #1649 (`9b3ff6cf`) still conflicts in both files with no stated order. Carried as R03.
- R04 — repaired: `Suggested.lean:76`–`:77` now reads "the pinned Tau Ceti has none of these modules, so no statement of it elaborates here", which is true at the branch pin `358314d4` (0 of 7 modules), the form the previous review allowed for a round before the merge. The block becomes due with R01's merge, recorded in R01's repair.
- R05 — repaired: `:299`–`:304` now ends "(Neshveyev–Tuset Theorem 2.2.19 and Remark 2.2.20(ii), pp.36–37; the tensorator compares two standard solutions for X⊗Y, the chosen one and the composite `(ι⊗R_X⊗ι)R_Y`, which is standard by the proof of Theorem 2.2.16, so it is unitary by Proposition 2.2.13)". Verified below.

## Verified sound

**Head, scope and gate.**
- **Head:** `7c3e850a4be8d2ee9d85e43193196052e365e4c3`, clean worktree. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The folder diff since `4a56324` is 8 lines of `README.md` and 5 of `Suggested.lean` (docstring only).
- **Gate:** I re-ran `gate … --base origin/main` on this head: every text check is 0 (`set_option`, `latex`, `prnum`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder`, `dirty`, …) and the result is `OK`; the worker's gate on the same head also records `build=0`.
- **Dependency check** (unmodified output of the required command): `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The diff adds no supplier edge.
- **Policy on the changed lines:** no LaTeX, pull-request number, process word, machine path or `lemma`; the locator sits in parentheses at the claim, as the house shape asks, and the code span `(ι⊗R_X⊗ι)R_Y` matches the style of the neighbouring `bar(r) r=ε φ_X`.

**Elaboration at the branch pin.**
- **Build:** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:121`, `:153`, `:164`, `:174` (each one line below the previous review's, the docstring having grown by one line).
- **Signatures:** the declarations are byte-identical to `4a56324`; `scratch/signatures.md` for this head lists the same six elaborated types as the previous review. The one lead, `AlgebraicHaar` not mentioning `[StarModule ℂ A]`, is harmless because no field uses it.
- **Padding probe:** unchanged declarations; the previous reviews' probe (`first | rfl | infer_instance | trivial | simp | decide` fails on all four headlines) stands.

**The changed passages.**
- **The new locator (`:301`–`:304`).** `nt` line 1633 is Theorem 2.2.19 (extraction page 40, printed p.36): `U ↦ Ū`, `T ↦ T∨` is a contravariant functor, unitary when every solution used is standard, with square naturally unitarily isomorphic to the identity; its proof at lines 1639–1644 is the identity `T*∨ = T∨*`, which is the README's `(f∨)† = (f†)∨`. `nt` line 1661 is Remark 2.2.20(ii) (page 41, printed p.37): the tensor structure `F₂(U,V) ∈ Mor(V̄⊗Ū, \overline{U⊗V})` defined by `(F₂⊗ι⊗ι)(ι⊗R_U⊗ι)R_V = R_{U⊗V}`. The README's "pp.36–37" is right.
- **The new proof clause.** `nt` lines 1574–1591 (proof of Theorem 2.2.16, printed pp.34–35) take standard `(R_U, R̄_U)`, `(R_V, R̄_V)`, form `R = (ι⊗R_U⊗ι)R_V`, `R̄ = (ι⊗R̄_V⊗ι)R̄_U` and show `φ_{U⊗V} = ψ_{U⊗V}`, so the composite is standard, exactly as the README says. `nt` line 1458 (Proposition 2.2.13, printed p.33): two standard solutions for `U` with conjugates `Ū`, `Ū'` differ by a unitary `T ∈ Mor(Ū, Ū')` with `R' = (T⊗ι)R`. Applied to the chosen `R_{U⊗V}` and the composite, `F₂(U,V)` is that `T`, hence unitary. The clause uses only the two standard-solution hypotheses it names; the composite's shape agrees with Neshveyev–Tuset's convention `R_U ∈ Mor(1, Ū⊗U)`, which the README follows (its `R̄ = −τR` normalisation at `:308` is theirs). The previous review's citation "multiplicativity, Theorem 2.2.17" for the same fact was the weaker locator; the proof of Theorem 2.2.16 is where the composite is shown standard, and `nt` line 2712 and line 3088 cite the same step the same way.
- **The docstring item (`Suggested.lean:70`–`:77`).** The seven named modules: 0 of 7 exist at `358314d4` (the worktree's `.lake/packages/TauCeti`), 7 of 7 at `2fd255d9` (main's). The two imports the file does use, `TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.Matrix` and `TauCeti.Algebra.Coalgebra.Subcomodule.Basic`, exist at both. The reason stated is true at the branch pin; its tension with `:21`–`:30` is R01.
- **Text that cites the changed sentence:** §3.3 `:771` ("Use §0.2's balanced unitary dual functor with the stated …") and the Downstream consumers entry `:1795`–`:1798` are unchanged and still agree with `:33`–`:38` word for word; §5.2's `:1075` uses "Rep(O_F^+)'s chosen unitary dual functor", the functor of §0.2 for that category.

**Seeded sample.** None of the fifteen seeded targets contains a changed README line. The changed sentence is in 0.2, whose new locators are checked above and whose older ones (Longo–Roberts Lemma 3.3, Theorems 3.8, 3.11; Neshveyev–Tuset Definitions 2.2.10, 2.2.12, Theorems 2.2.14, 2.2.17, Definition 2.7.1) were verified by the previous review at `longoroberts` 389, 621, 681 and `nt` 1427, 1446, 1501, 1596, 3236. Of the seeded targets, 3.3 (`:771`–`:779`) consumes the changed sentence and is unchanged, and 8.5's docstring item is the other changed passage, checked above, while its README text (`:1574`–`:1694`) is untouched. The remaining thirteen (1.1, 2.2, 3.2, 4.1, 4.3, 5.1, 5.2, 6.3, 7.1, 8.1, 8.2, 8.3, 8.7) are untouched and were verified by the previous reviews; the README flags no locator as unverified.

**Ownership and overlaps.**
- The overlap listing for this head reports no dropped id in either direction and no id only an open revision defines; the diff renames no heading. The one listed overlap, the conflict with #1649, is R03.
- Library at the pins: Mathlib `f6090c70` has no dagger category, C*-tensor category or unitary dual functor; Tau Ceti `358314d4` has none either (the previous review's grep stands; the only "unitary dual" is the unitary dual of a compact group). PivotalSpherical is on main (`TauCetiRoadmap/PivotalSpherical`) and owns the algebraic pivotal and spherical structures the changed sentence transports to. The double ownership against #888/#867 is R02.

**Adversarial table.** Rows marked "r19 …" and "r17 …" carry the previous reports' computed values for statements this diff leaves untouched (q = 1/2 unless stated). Rows marked "new" are computed here for the changed passages.

| Row | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| new | §0.2 the composite `(ι⊗R_X⊗ι)R_Y` is standard and the tensorator unitary (`:301`–`:304`) | `Hilb_f`, `X = ℂ²`, `Y = ℂ³`, `R_X = Σ ē_i⊗e_i`, `R_Y = Σ f̄_j⊗f_j` | composite `= Σ_{i,j} f̄_j⊗ē_i⊗e_i⊗f_j`, `‖·‖² = 6 = d(X)d(Y)`; chosen `R_{X⊗Y} = Σ_k ḡ_k⊗g_k`, `g_k = e_i⊗f_j`; `F₂ : f̄_j⊗ē_i ↦ \overline{e_i⊗f_j}` permutes orthonormal bases, unitary | pass | none |
| new | same with a non-standard chosen solution (negative control for "two standard solutions") | chosen `(2R_{X⊗Y}, R̄_{X⊗Y}/2)` | `F₂ = 2·(unitary)`, `‖F₂‖ = 2 ≠ 1`; Proposition 2.2.13 does not apply (`‖2R‖² = 24 ≠ 6`) | pass (hypothesis needed and stated) | none |
| new | the locator's pages | `nt` page markers 1617 (page 40), 1659 (page 41); printed = extraction − 4 | Theorem 2.2.19 at line 1633 → p.36; Remark 2.2.20(ii) at 1661 → p.37; README "pp.36–37" | pass | none |
| new | `Suggested.lean:76` "the pinned Tau Ceti has none of these modules" | Tau Ceti `358314d4` (branch); `2fd255d9` (main) | 0 of 7 modules; 7 of 7 modules | pass at the branch pin; false after R01's merge | R01 |
| new | `Suggested.lean:21`–`:30` "Proved in the pinned Tau Ceti: `TauCeti.UqSl2` …" against `:76` | the same two pins | at `358314d4`: `:21`–`:30` false, `:76` true; at `2fd255d9`: `:21`–`:30` true, `:76` false | fail (no pin satisfies both) | R01 |
| new | ownership list `:33`–`:38` vs #888 `136b93af` `:40`–`:46` | the six objects of CA2a | all six appear in both "single home" lists | fail | R02 |
| r19 new | §0.2 `(f∨)†=(f†)∨` for the dual functor of standard solutions (`:299`–`:300`) | `Hilb_f`, `X = ℂ²`, `R = Σ e_i⊗e_i`, `f ∈ End(X)` | `f∨ = fᵀ`; `(f∨)† = conj(f) = (f†)∨` | pass | none |
| r19 new | same identity for a non-standard solution (negative control) | `X = ℂ²` with `(2R_X, R̄_X/2)`, `Y = ℂ` standard, `f : X → Y` | `(f∨)† = 2·conj(f)`; `(f†)∨ = conj(f)/2`; unequal | pass | none |
| r19 new | "balanced" excludes the other unitary dual functors | ℤ-graded `Hilb_f`, `X = ℂ` in degree 1, `R = t^{1/2}`, `R̄ = t^{−1/2}`, `t > 0` | dagger functor for every `t`; `tr_L(1_X) = t`, `tr_R(1_X) = t⁻¹`; `‖R‖ = ‖R̄‖` forces `t = 1` | pass | none |
| r19 new | §3.3 "squared norms are both `Tr F = Tr F⁻¹`" (`:773`–`:774`) | `SU_(1/2)(2)` fundamental, `F = diag(2, 1/2)` | `Tr F = 5/2 = Tr F⁻¹ = ‖R‖² = ‖R̄‖²`; with `F = I₂`: `2 = 2` | pass | none |
| r17 #13 | `schur_orthogonality` (headline) | `SU_(1/2)(2)`, `F̃ = diag(2, 1/2)` | `h(a*a) = 1/5`, `h(c*c) = 4/5`, `h(aa*) = 4/5` | pass | none |
| r17 #19 | `compactType_iff` (headline) | ℂ; ℂ[C₂]; zero ring; ℂ[x] | true/true; `|a|²+|b|²`; `h(1) = 0 ≠ 1`, excluded by `Nontrivial`; false/false | pass | none |
| r17 #20 | `haar_modular_automorphism` (headline) | `SU_(1/2)(2)`; ℂ[S₃] | `θ(a) = 4a`, `h(a*θa) = 4/5 = h(aa*)`; θ = id | pass | none |
| r17 #21 | `haar_trace_iff_antipode_involutive` (headline) | ℂ[S₃]; `SU_(1/2)(2)` | both true; `1/5 ≠ 4/5` and `S²(c) = c/4 ≠ c` | pass | none |
| r17 new | §8.5 `K⁻¹` group-like, `S² = Ad(K⁻¹)` | E; wrong pivots K, 2K⁻¹ | `S²(E) = q⁻²E = 4E`; `KEK⁻¹ = E/4`; `ε(2K⁻¹) = 2` | pass | none |
| r17 new | §8.5 traces `rightTrace f = tr(gf)`, `leftTrace f = tr(g⁻¹f)` | `L₁⁺` identity; `L₀⁻`; non-morphism projection | `5/2 = 5/2`; −1, −1; `2 ≠ 1/2` | pass | none |
| r17 new | sphericity for `q − q⁻¹ ≠ 0` | `L₁⁺ ⊕ L₁⁺`, `f = M ⊗ id`; q = i | `tr(Kf) = 10 = tr(K⁻¹f)`; `tr((K−K⁻¹)f) = (q−q⁻¹)tr([E,Ff]) = 0` | pass | none |
| r17 new | q = ±1 Check (`:1690`) | ℂ with K = 2, E = F = 0 | `(q−q⁻¹)⁻¹ = 0`, commutative; right `1/2`, left `2` | pass | none |
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
- **Descriptions not read:** the descriptions of #888, #867 and #1649 (R02, R03). Their README texts were read at the heads named (`136b93af`, `ba43cc7a`, `9b3ff6cf`).
- **Ownership against open pull requests** was checked against the sibling checkouts the brief lists, the overlap listing for this head and the previous reviews' `roadmaps grep`. Pull requests outside those were not searched.

## Source issues

- none
