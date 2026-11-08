# Review of ComplexComparisonPartII (pull request #848 at c2cb8bb)

**Verdict:** needs changes

This is a full review of the head. The folder changed by 380 lines since `1a0a82d`.

- The gate passes and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly three `sorry` warnings, and none of its theorems closes with one tactic.
- 38 pinned names cited by the README resolve under `#check`, and 7 more Tau Ceti declarations were located by file.
- The fifteen seeded targets were read at their locators. The exceptions are Dimca and SGA 4½, which are paywalled.

Seven of the previous review's nine findings are repaired. Two blocking findings are carried, both cross-pull-request ownership problems:

- **R01** concerns the DifferentialGeometry layers that #886 drops.
- **R02** concerns the holomorphic exponential sequence, which ComplexKahlerGeometry K4.P in #1234 also owns.

There are three new P3 findings:

- **R03.** Proper coherent GAGA and the relative Artin exchange are stated over finite-type bases. Their sources allow bases locally of finite type.
- **R04.** `Suggested.lean` has no layer section comments, and the C1 headline row omits `montelTheorem`.
- **R05.** One process word remains in the prose, and one References entry is incomplete.

## Previous findings

- **R01 (DifferentialGeometry layers): partly repaired.**
  - The Layer 6 citation is gone. :537–542 now consumes de Rham cohomology as Tau Ceti's `TauCeti.deRhamCohomology`.
  - Layers 8–9 are still cited at :542, :710–712, :2893, :3665, :3677 and :4283.
  - The pull-request description still names neither DifferentialGeometry nor #886.
  - Carried as R01.
- **R02 (two owners of the exponential sequence): not repaired.**
  - The head now consumes the smooth part from SmoothBundlesConnections B6.1–B6.2 (:144, :3647–3660).
  - It keeps the holomorphic sequence and the bijection to `H¹(M,O_M^×)` in C5.4: "Prove the holomorphic exponential-sequence description here; its smooth part is consumed" (:3633).
  - Carried as R02.
- **R03 (narrow C6 statements): repaired.**
  - `riemannExistence` (:4479) now covers every scheme locally of finite type, with the Check `⊔_{n≥1} G_m` (:4509).
  - `relativeArtinComparison` (i) now covers any `f` with `K ∈ Dᵇ_c` (:4668–4669), with the Check `j : G_m ↪ A¹` (:4705).
- **R04 (AffineMorseLefschetz triangulation): repaired.** The citation now reads "AffineMorseLefschetz, Layer 5 (A4.1), §5.1 `finite_semialgebraic_triangulation`" (:287, :737, :4318). The non-closed marks are consumed directly (:4319–4321, Check :4357).
- **R05 (duplicate targets): repaired.**
  - C-1.3 now only proves `analytification_descent` and the locally-finite-type extension (:980–1000).
  - `analyticPolydisc` is gone.
  - The Conventions agree (:392–395).
- **R06 (locators): repaired.**
  - EGA IV₄ now reads "§16.7 … printed pp. 36–39, and §16.8 … printed pp. 39–44" (:2753–2755).
  - SGA 4 now reads "XI §3, Définition 3.1 and Proposition 3.3, p. 549" (:4555).
- **R07 (References): repaired.**
  - Kleiman, Schröer, Raynaud, Artin 1969 and Hatcher are listed.
  - The Stacks entry now lists the cited tags.
  - Mok–Pila–Tsimerman is removed.
- **R08 (template fragments): repaired.** No "Here <Capital>" fragment or stray "The API" remains.
- **R09 (`Suggested.lean` docstring): repaired.** The docstring is titled "# Complex comparison, part II: target signatures", in the required form.

## R01 (P2) — DifferentialGeometry Layers 8 and 9 are cited, and the open revision of DifferentialGeometry drops them

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:542` ("The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9."). The same citation appears at:

- :710–712 (Layer 8 `deRhamEquiv`; Layer 9 `finiteDimensional_deRhamCohomology`);
- :2893 ("Layers 5, 8 and 9");
- :3665 and :3677 ("DifferentialGeometry Layer 8's `deRhamEquiv`");
- :4283.

**Claim:** The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8 and 9.

**Witness:** The claim is true on main (`DifferentialGeometry/README.md:816, 862`). At the head of #886 (a565de6, unchanged), the layers are 0–5, 5.6 and 12 only (README:288–1204). Its README:262 hands these results to DeRhamCohomologyAndDuality, which is at `ORDER.txt:389`, after this roadmap (:43).

**Repair:** The README stays as it is: its citations are correct against main, and no earlier owner exists. Add one sentence to the merge-order paragraph of the pull-request description, saying:

- the README consumes `deRhamEquiv` and `finiteDimensional_deRhamCohomology` from DifferentialGeometry Layers 8–9 as they stand on main;
- #886 removes those layers, so before both merge, #886 must keep them or give an old → new map, or DeRhamCohomologyAndDuality must move ahead of this roadmap in the merge order.

Add no *Needs:* edge to DeRhamCohomologyAndDuality while it sits at :389.

## R02 (P2) — The holomorphic exponential sequence and the bijection Pic_hol ≅ H¹(O^×) have two owners

**Location:** `README.md:144`, the ownership row ("C5.4 constructs … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`…"). Also :3633–3643 ("Prove that `L ↦ [L]` is a bijection … onto `H¹(M, O_M^×)`") and :90–91.

**Claim:** C5.4 owns three things on every complex manifold:

- the bijection from holomorphic line bundles to `H¹(M,O^×)`;
- the holomorphic exponential sequence;
- the identification of its connecting map with the integral c₁.

**Witness:** At the head of #1234 (ComplexKahlerGeometry revision, 41f5a15, updated 2026-11-07), README:647–651 reads: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification … Its consumers are ComplexComparisonPartII C5.4".

**Repair:** Settle one owner. ComplexKahlerGeometry is the earlier roadmap (on main), and C5.4 already consumes its K4. The preferred settlement:

- Cite ComplexKahlerGeometry K4.P for the three items.
- Keep in C5.4 only the identification of C1.9's `analyticPicardGroup` with K4.P's `Pic_hol` on manifolds.
- Keep the explicit `δu` cocycle and the `O(±1)` check as Checks on the consumed map.
- Rewrite :144 and :90–91 to match.
- The worker names #1234 in the merge-order paragraph, because K4.P exists only at that head.

The SmoothBundlesConnections B6 consumption added in this head can stay: K4.P also follows SBC B6.1–B6.2 (#1234 README:2213–2214). The test instance survives: #1234 README:653–655 fixes `c₁(O(−1))·[ℂP¹]=−1` "as ComplexComparisonPartII writes it", so the Check at :3684–3687 holds for the consumed map.

If the two authors instead keep the target here, #1234 must drop K4.P's ownership sentence and its "consumers … C5.4" line, and this description must record that settlement.

## R03 (P3) — Proper coherent GAGA and the relative Artin exchange are stated over finite-type bases; their sources allow bases locally of finite type

**Location:**

- `README.md:1826`: "(i) For a scheme `S` of finite type over `ℂ`, the projection `π:P^r_S→S`".
- :1842: "Prove `properSchemeGagaPushforward` for a proper morphism f of finite-type complex schemes".
- :4667: "Let `f : X → Y` be a morphism between finite-type complex schemes".

**Claim:** These comparisons are asserted only over finite-type bases.

**Witness:**

- `sga1` line 9738 (XII Théorème 4.2, retyped p. 248) takes `f` proper between ℂ-schemes locally of finite type.
- `sga4` line 28350 (XVI Théorème 4.1, p. 638) takes `f` of finite type between schemes locally of finite type.
- C2.1 (:2052) already applies `properSchemeGagaPushforward` with `S` locally of finite type.

**Repair:**

- State `projectiveComplexGaga` (i) and `properSchemeGagaPushforward` for a base locally of finite type over `ℂ`.
- State `relativeArtinComparison` for `f` of finite type between schemes locally of finite type.
- The proofs restrict to finite-type affine opens of the base. This works because C0.5's `θ` and the étale/analytic exchange maps commute with open restriction (:1267–1274, :4668).
- Add a Check, tested componentwise by the existing Check at :1848: for `Y = ⊔_{n∈ℕ} A¹`, `X = P¹_Y` and `F = O(−2)`, `R¹f_*F = O_Y` and `θ¹` is an isomorphism on every component. The finite-type statement excludes this `Y`.
- For C6.5, add a second Check, tested componentwise by the Check at :4705: `j : ⊔_n G_m ↪ ⊔_n A¹` with `K = μ_N`.

## R04 (P3) — `Suggested.lean` states two layers without section comments; the C1 headline row omits `montelTheorem`

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/Suggested.lean:62–97` holds `montelTheorem` and `schwartzFiniteness` (C1.6) and `nonempty_sheafSingularComparison` (C5.1), with no `/-! ## Layer … -/` comment. `README.md:49` lists the C1 headline targets ("`localDolbeault`, … `schwartzFiniteness`, `cartanSerreFiniteness`, …") without `montelTheorem`.

**Claim:** The file follows the Lean form, and the README's headline table matches the file.

**Witness:** The form requires `/-! ## Layer k: <title> -/` section comments in README order when the file states targets of several layers. This file states targets of C1 and C5. `montelTheorem` is stated there as a headline, but the C1 row omits it.

**Repair:**

- Insert `/-! ## Layer C1: Analytic coherent cohomology and GAGA -/` before `montelTheorem`.
- Insert `/-! ## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison -/` before `nonempty_sheafSingularComparison`.
- Add `montelTheorem` to the C1 row at :49.

Tested on a scratch copy: `lake env lean` gives the same three `declaration uses sorry` warnings (lines 67, 78 and 95) and exits 0.

## R05 (P3) — A process word and an incomplete References entry

**Location:**

- `README.md:439`: "for this roadmap's current convention `d_c = d^c/(4π)`".
- :4957: "S. L. Kleiman, *The Picard scheme*, arXiv:math/0504020v1 (2005); Propositions 5.10 and 5.20, pp. 41–42 and 47–48."

**Claim:** The prose is timeless, and the References give the locators the body cites.

**Witness:** "Current" is a process word under the house style. The body at :2381 cites Kleiman Theorem 6.16, pp. 58–59. The theorem is at `kleiman-picard` line 2782, p. 58, and is missing from the entry.

**Repair:**

- Write "for this roadmap's convention `d_c = d^c/(4π)`".
- Add "Theorem 6.16, pp. 58–59 (published numbering 9.6.16)" to the Kleiman entry.

## Verified sound

**Gate and dependency check.** My run of the gate on this head printed the following and exited 0:

```text
gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check with `--movable` printed, in full:

```text
depcheck: 240 roadmaps, 2440 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`math.AG`).
- No `design/plan.json` is readable, so no gaps are declared, and nothing should have been one.

**Lean (pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**

- `lake env lean Suggested.lean` gives exactly three `declaration uses sorry` warnings (lines 65, 76 and 91) and exits 0.
- **One-tactic probe** (`first | rfl | simp | infer_instance | aesop` on a scratch copy): all three fail, with two unsolved goals and `aesop` making no progress. Nothing is padding, and no declaration restates a definition or mirrors a Check.
- **Signatures:** the elaborated types lose no binder. They match the README statements:
  - `montelTheorem`: an open set in a finite-dimensional complex normed space, which is `ℂⁿ` up to equivalence;
  - `schwartzFiniteness`: complete metrizable Hausdorff locally convex spaces;
  - `nonempty_sheafSingularComparison`: `LocallyContractibleSpace`, coefficient object `ULift ℤ`.
  - The `Nonempty` form of the last one is declared in the docstring and at :2862.
- **`LocallyContractibleSpace`** at the pin: for every point `x` and neighbourhood `U` of `x`, some neighbourhood `V ⊆ U` of `x` has null-homotopic inclusion. This is equivalent to Sella's semi-local contractibility (Sella p. 1: each open set has an open cover by sets contractible in it). Taking interiors goes one way, and taking the member of the cover containing `x` goes the other.
- **38 pinned names checked with `#check`.** All resolve, among them:
  - `TauCeti.montel` (open `Ω ⊆ ℂ`, `ProperSpace E`), so the several-variable statement is new;
  - `IsCompactOperator.isClosed_range_pow_one_sub` and `IsCompactOperator.finiteDimensional_quotient_range_one_sub` (`IsRCLikeNormedField`, Banach);
  - `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (Banach);
  - `ContinuousLinearMap.isOpenMap` (Banach only), so `frechetOpenMapping` duplicates nothing;
  - `OpenPartialHomeomorph.analyticAt_symm'`, `hasFPowerSeriesAt_symm`, `HasStrictFDerivAt.toOpenPartialHomeomorph`, `AnalyticAt.hasStrictFDerivAt` and `ContDiffAt.to_localInverse`;
  - `circleIntegral.integral_sub_inv_of_mem_ball`, giving `2πi`;
  - `Distribution.mapCLM`, `.delta` (real-valued), `.lineDerivCLM` and `.ofFun`;
  - `Bundle.Trivialization.pullback` and `Manifold.IsSubmersion`;
  - `Abelian.Ext.mapExactFunctor`, `Functor.mapDerivedCategory` and `Scheme.AffineEtale`;
  - `UniversallyClosed.eq_valuativeCriterion` (`= ValuativeCriterion.Existence ⊓ QuasiCompact`);
  - `Module.FaithfullyFlat.of_flat_of_isLocalHom`, `Module.Flat.of_flat_tensorProduct` and `Module.free_of_flat_of_isLocalRing`;
  - `AddSubmonoid.NSMulSaturated`, `Algebra.GrothendieckGroup` and `KaehlerDifferential.ideal`;
  - the C1.9 curve suppliers `MeromorphicFunction.ofMeromorphic_const` (`RiemannSurface/FunctionField.lean:538`), `MeromorphicFunction.ratFuncEquiv` (`RiemannSurface/RationalFunction.lean:251`), `finite_setOf_eq_infty`, `orderSystem`, `divisorSections.mem_range_toMeromorphic_iff`, `divisorSheafZeroIso`, `SchemeWeilDivisor.globalSectionsEquivRiemannRochSpace` and `holomorphicStructureSheaf.smoothSheafIso`.

**Seeded sample, read at the locators.**

- *Riemann surface of a smooth complex curve.* SGA 1 XII Proposition 3.1 is at `sga1` line 9594, retyped p. 244, with (iii) étale, (iv) smooth and (viii) separated. Proposition 3.2 is at line 9639, pp. 245–246, with (v) proper and (vi) finite. The proofs run to p. 247 (retyped printed = PDF − 16).
- *Curve GAGA.* SGA 1 XII Théorème 4.4 is at `sga1` line 9805, pp. 249–250.
- *`IsDifferentialOperator`.* EGA IV₄ checks out against `ega4-4` (printed = PDF + 1):
  - (16.7.1) is at line 1260, p. 36;
  - §16.8 opens at line 1370, p. 39;
  - (16.8.1) is the `P^n` factorisation;
  - (16.8.8) at line 1489, p. 42: for arbitrary `O_X`-Modules, order ≤ n iff every `D(a·) − aD` has order ≤ n−1, which is `commutatorWith`;
  - (16.8.9) and (16.8.9.2) are at lines 1526–1537, p. 43;
  - §16.9 opens on p. 46, matching the References' "pp. 39–46".
- *`artinDeRhamBetti`.* Deligne 1968 Theorem (5.5) covers `S` of characteristic 0 and `f` proper and smooth. Lemma (5.5.3) (the resolution of the constant sheaf `A`) and (5.5.4) (length `= lg(A)·dim H^n`) are on printed p. 124.
- *`CurrentCalculus`.* Demailly (printed = PDF):
  - I (2.1)–(2.7) are on pp. 13–15, with (2.6) `⟨dT,u⟩=(−1)^{q+1}⟨T,du⟩` and (2.7) `d[Z]=(−1)^{m−p+1}[∂Z]`;
  - §2.D.3 is on p. 19 and (3.20) on p. 25;
  - III (1.14) is on p. 133;
  - III (2.3) El Mir is on p. 139, with its proof on p. 140.
- *`realComplexCurrentComparison`.* Demailly III (1.14)–(1.15) are on pp. 133–134. (1.21) is on p. 135, and (1.22) and (1.24) on p. 136. Demailly's `σ_T = (2^p p!)⁻¹ T∧ω_D^p` with `ω_D = iΣh dz∧dz̄` equals the README's `T∧ω^p/p!` with `ω = ω_D/2`.
- *`complexAlgebraicTopology`.* AffineMorseLefschetz on main, README:948–962, §5.1 `finite_semialgebraic_triangulation`: the marks "need not be closed", each is a union of open-simplex images, and BCR 9.2.1 is cited there.
- *`topologicalCoefficientComparison`.*
  - Sella: the Theorem (p. 2, any abelian group, semi-locally contractible), Lemma 0.1 (pp. 2–4), Example 0.3 (p. 5) and the nesting definition (p. 6, conditions i–iii) all match the C5.1 description.
  - Hatcher §3.H: local-coefficient cochains are at `hatcher-at` line 14583, p. 333.
  - Dimca is listed under *Not verifiable*.
- *`riemannExistence`.* SGA 1 XII Théorème 5.1 (`sga1` line 9872, p. 251) covers `X` locally of finite type.
- *`artinComparison`.* The `sga4` locators match the retyped edition (printed = PDF − 9):
  - XI Définition 3.1 is at line 24606 and Proposition 3.3 at line 24629, both p. 549;
  - XI Théorème 4.4 is at line 24767, p. 552, and Variante 4.6 at line 24818, p. 553;
  - XVI Théorème 4.1 is at line 28350, p. 638.
  Milne LEC v2.21 has Theorem 21.1 (p. 130), 21.5 (p. 132), and Definition 21.7 and Proposition 21.8 (p. 133).
- *The named unit map.* SGA 4 XVI §4 compares through the morphism of sites `ε`. XVI 4.1 uses the base-change maps of XII 4.2.
- *`artinComparisonCompactSupport`.* XVII Corollaire 5.3.5 (`sga4` line 31745, p. 705) covers arbitrary torsion `F` on separated compactifiable `X`. This supports the new D⁺ clause at :4627–4630. XVI 4.1(i) is the proper case for any torsion sheaf.
- *`relativeArtinComparison`.* XVI 4.1 case (ii) (constructible, any `f`) and case (i) (proper, any torsion sheaf) match clauses (i) and (ii). XVII Théorème 5.3.3 (line 31733, p. 704, by way-out reduction to XVI 4.1(i)) and Variante 5.3.4(i) (line 31740, p. 705) match clause (iii). The generality is R03.
- *`artinSmoothTrace`.* XVIII 2.8, (2.8.1), Théorème 2.9 (uniqueness under the stated variance), Proposition 2.10 and the forward reference to 3.2.5 are at `sga4` lines 37190–37466.
- *`adicArtinComparison`.* Bhatt–Scholze (arXiv v2) has §5 (relations with the étale topology), §6.5 (constructible complexes, pro-étale), §6.7 (six functors) and §6.8 (`Zℓ`/`Qℓ`-sheaves).
- *Other locators read:* Kleiman Theorem 6.16 is on p. 58 (`kleiman-picard` line 2782), and its locally Noetherian convention is on p. 15 (line 749).

The texts not in the package manifest were fetched through the sources service into a scratch manifest. No package manifest was edited.

**Cross-roadmap citations resolved (copy named).**

- *On main:*
  - SmoothBundlesConnections B1.5 (:498), B6.1 (:1375: stalk exactness of `exp(2πi·)` and acyclicity of smooth real functions) and B6.2 (:1668: dual-character `c₁` with `⟨c₁(Hopf),[ℂP¹]⟩=1`);
  - CharacteristicClasses item 5 of C1 (:689–713, "compare with SBC B6 on smooth bases") and :208 (the standard-character sign);
  - AffineMorseLefschetz Layer 4 (A4.0, :616) and Layer 5 (A4.1, :946);
  - DifferentialGeometry Layers 8–9 (:816, :862);
  - TopologicalSheafCohomology, which hands the CW sheaf–singular comparison to CharacteristicClasses C1.2b and claims no singular comparison, so C5.1 duplicates nothing.
- *At open heads:*
  - EtaleCohomologyFoundations #1891 keeps G.1–G.3, F.0.1–F.3.0, 0.7, 0.8 and all eleven `VanishingCycles.*`/`ClassicalAlgebraic.*` names I sampled, so the citations survive that revision.
  - FormalConnectionsOpers (rev 1056, 7e7e507) consumes C−1.1, C0.3–C0.4 and C5.1–C5.2 from here (:47, :597, :866), in one direction.
  - ComplexKahlerGeometry #1398 (20c666e) only cites C−1.1, C0.4 and C5.1–C5.2 (:869).
  - DeRhamCohomologyAndDuality #1768 does not mention this roadmap.
- *Leads:* the citations file's 39 Lean-name leads are the EtaleCohomologyFoundations, EnhancedDerivedSheaves, AlgebraicModuliForArithmeticGeometry and DerivedDeRhamCohomology names resolved in the previous round. I re-resolved the EtaleCohomologyFoundations ones above. Its cross-roadmap list is empty.

**Ownership against open pull requests.**

- The overlap file lists no other pull request changing this roadmap and no id that only an open revision defines. Its one dropped id is R01; I also checked Layer 9.
- Of the closest roadmaps in vocabulary:
  - #1234 is R02;
  - #1398 adds nothing owned here;
  - #1807, #1808 and #1854 were checked only through the overlap tool, which reports no dropped id cited here.

**Computed adversarial pass.**

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Riemann surface of `C` (seeded) | `P¹`; `z↦z²`; nodal cubic; doubled origin | transition `z↦1/z` on `ℂ*` is its own inverse; derivative `2z` is `≠0` on `ℂ*` and `=0` at 0 on `A¹`; `F=y²−x³−x²` has `∂_xF=−3x²−2x=0` and `∂_yF=2y=0` at the node; doubled origin: non-Hausdorff `T_C` | Pass |
| `functionFieldToMeromorphic`, `picardAnalytification` (seeded) | `z` on `P¹`; `E: y²=x³−x`; `D=∞`; `E∖∞` | `ord₀z=1` and `ord_∞z=−1`; at `(0,0)`, `∂_x(x³−x−y²)=−1≠0`, so `y` is a parameter and `ord x=2`; `ord_∞(x,y)=(−2,−3)`; `div x=2(0,0)−2∞` has degree 0; `h⁰(divisorSheaf ∞)=2=h⁰(O(1))`, and the reversed sign gives 0; `Pic(E∖∞)≅E(ℂ)≠0`, while analytic line bundles on the noncompact surface are trivial | Pass |
| `IsDifferentialOperator` (seeded) | `ℂ[z]`; `𝔽₂[z]`; `𝔽₃[z]` | `d/dz(zf)−z f′=f`; `(z+t)²=z²+t²`, so `z²↦1` while `(d/dz)²z²=2=0`; the `t³`-coefficient of `(z+t)⁴` is `4z≡z`; `P^m(k[z])=k[t]/t^{m+1}` | Pass |
| `artinDeRhamBetti` (seeded) | `A=ℂ[ε]/ε²`, `X=P¹_A`; `A=ℂ` | `H⁰,H²` are free of rank 1 with length `2=lg(A)·1`, and `H¹=0`, matching (5.5.4); `A=ℂ` recovers `properDeRhamBetti` | Pass |
| `CurrentCalculus` (seeded) | `α=a dx+b dy`, `η=φdx+ψdy`; smooth `α`; `|z|⁻²` | `α∧η=(aψ−bφ)dx∧dy`; Stokes gives `∫α∧dη=(−1)^{k+1}∫dα∧η`, so `dT_α=T_{dα}`; `∫₀^ε r⁻²·r dr=∞`; `[a]` has trace mass 1 | Pass |
| `realComplexCurrentComparison` (seeded) | disc (`n=1,q=2`); segment (`q=1`); `½δ_a` | `(−1)^{2n−q+1}` is `−1` for the disc and `+1` for the segment, giving `J₀(δ_b−δ_a)`; the sign agrees with `CurrentCalculus` `(dS)(η)=(−1)^{k+1}S(dη)` at `k=2n−q`; mass `½` | Pass |
| `complexAlgebraicTopology` (seeded) | `P¹` with marks `{0},{∞},ℂ*`; `A¹` | §5.1 non-closed marks give `ℂ*` as a union of open simplices directly; `x↦x/√(1+|x|²)` maps `ℝᴺ` homeomorphically onto the open unit ball | Pass |
| `topologicalCoefficientComparison` (seeded) | `𝔽₃`, monodromy `−1`; `𝔽₅`, transport 2; `(0,1)⊂[0,1]`; `ℤ/2` over `ℤ/4` | `v=−v` gives `2v=0`, so `v=0` and `H⁰=0`; dual transport `3` since `2·3≡1`; `H¹_c=coker(Λ→Λ²)=Λ` while `H¹=0`; `Tor_i=ℤ/2` for all `i`, so not perfect | Pass |
| `riemannExistence` (seeded) | `z↦zⁿ` on `ℂ*`; `⊔_{n≥1}G_m` | deck group `μ_n≅ℤ/n`; the unbounded-degree cover is admitted, since locally finite type matches SGA 1 XII 5.1 | Pass |
| `artinComparison` (seeded) | `G_m`, `μ_n`; `Spec ℂ`, `Λ=ℤ/4`, `K=ℤ/2` | the root `e^{iθ/n}` gains `e^{2πi/n}` around the loop, and the negated map gives `e^{−2πi/n}`, which differs iff `n≥3`; `Tor_i=ℤ/2` for all `i`, so `K` is in `Dᵇ_c` but not ctf | Pass |
| `IsIso (artinComparisonMap)` (seeded) | `Spec ℂ` | both sites have sheaves equal to `Λ`-modules, so the unit is the identity | Pass |
| `artinComparisonCompactSupport` (seeded) | `A¹`; conjugation on `P¹`; `⊕_x(i_x)_*Λ` on `P¹` | `H^•_c(A¹)=(0,0,Λ(−1))`; `z↦z̄` has degree `−1` and inverts `μ_n`, so `(−1)(−1)=+1` on `H²(Λ(1))`; on compact `P¹(ℂ)` locally finite support means finite, so both sides agree | Pass |
| `relativeArtinComparison` (seeded) | `j:G_m↪A¹`, `μ_n`; `⊕_x(i_x)_*Λ` on `A¹` | `(R¹j_*μ_n)_0`: Kummer `K^{sh×}/n` is generated by `z` on one side, and `H¹(Δ*,μ_n)≅μ_n` on the other, both free of rank 1, with `R^{≥2}=0`; étale `H⁰` is finitely supported functions, while classical `H⁰` contains `1_ℤ`, so the map is not surjective and constructibility is needed | Pass (generality R03) |
| `artinSmoothTrace` (seeded) | `P¹→pt`; `A¹⊔A¹`; `n=2` | `tr c₁(O(1))=1`; `H²_c(Λ(1))=Λ²` with trace `(a,b)↦a+b`, whose kernel `{(a,−a)}` contains `(1,1)` when `n=2` | Pass |
| `adicArtinComparison` (seeded) | `ℤ/ℓ` system; `P¹` | torsion `⊗ℚ_ℓ=0`; degree 2 has rank 1 and trace 1 at every level | Pass |
| `montelTheorem` (Lean) | `Ω=∅`; `E=0`; `f_n=n`; `f_n=zⁿ` | `∅`: `g=0`, `φ=id`; `E=0`: Bolzano–Weierstrass on `f_n(0)`; `f_n=n` violates `hb` and has no convergent subsequence, so `hb` is used; `|zⁿ|≤rⁿ→0` on `|z|≤r<1` | Pass |
| `schwartzFiniteness` (Lean) | `h=0`; `g=id`, `h=−K`; `g=−h=id` on `ℓ²`; `ℓ¹↪ℓ²` | codim 0; matches Riesz `finiteDimensional_quotient_range_one_sub`; `−id` is not compact in infinite dimension, so it is excluded (otherwise codim `∞`); the inclusion is not surjective and its range is not closed, so surjectivity is used | Pass |
| `nonempty_sheafSingularComparison` (Lean) | `∅`; point; Cantor set `𝒞`, `A=ℤ/2` | `0=0`; `A` in degree 0 on both sides; `𝒞` is not LC, with sheaf `H⁰` the locally constant maps (countable) and singular `H⁰=A^𝒞` (uncountable), so the hypothesis is used | Pass |
| `multiplicativePeriodInterface` (R01) | `dz/z` on `G_m` | `∮(z−0)⁻¹=2πi` by `circleIntegral.integral_sub_inv_of_mem_ball` | Pass; ids R01 |
| `integralLineBundleChernClass` (R02) | `O(1)` on `P¹`, `e₁=z e₀`; `g↦g/|g|` | `g₀₁=z`, positive generator; `exp(2πiu)/|exp(2πiu)|=exp(2πi Re u)`, so `(id, Re, g/|g|)` maps the holomorphic sequence to the circle sequence and preserves `δ`; Enriques `K`: `δu` is the nonzero Bockstein with real image 0 | Pass; owner R02 |
| `properSchemeGagaPushforward` (R03) | `Y=⊔_n A¹`, `X=P¹_Y`, `O(−2)` | `R¹f_*=O_Y`; `θ¹` is an isomorphism on each `A¹` (:1848); `Y` is excluded by "finite-type" but admitted by SGA 1 XII 4.2 | R03 |
| `regularSingularDeRhamComparison` | `G_m`: lattices with residues `(−1,0)`, `(1,0)`, `(−1,+1)` | `Ω¹_{P¹}(log{0,∞})=O`: terms `O(1)` with matrix `diag(0,−1)`, so `H⁰=H¹=ℂ`; terms `O(−1)` give 0; terms `O` with `−1` are acyclic; only the first avoids positive-integer residues | Pass |
| `compactEllipticHodge` | `−∂²−2`, `u=1`; `−∂²−1` | `⟨Pu,u⟩+‖u‖²=−‖u‖²`; `λ=3` gives `‖u′‖²+‖u‖²`; `ker=span(e^{±iθ})`; `P+2` has eigenvalues `k²+1>0` | Pass |
| `lelongPoincareSection` | `‖e‖²=e^{−|z|²}`; `O(1)`, `z₀`; `z/(z−1)` | `(i/π)∂∂̄(−|z|²/2)=−(i/2π)dz∧dz̄=−(1/π)dx∧dy`; `0=1−1`; `[0]−[1]` | Pass |
| `weightedDolbeaultEstimate`, C1.3 | Gaussian on `ℂⁿ`, `ω=iΣdz∧dz̄` | `[L,Λ]=p+q−n`: `k` on `(n,k)`, `−1` on `(0,1)` and `+1` on `(2,1)` for `n=2` | Pass |
| `AnalyticLogDifferentials` | `ℂ{z,ε}/(ε²)`; `xy=0` over `0^†` | `d(ε²)=2εdε` gives `A dz⊕(A/ε)dε`; absolute module free on `dlog x, dlog y`, base `dlog t↦dlog x+dlog y` | Pass |
| `chernFubiniStudyIntersection` | `∫_ℂπ⁻¹(1+|z|²)⁻²` | `π⁻¹·2π·½=1` | Pass |
| C3.2e/C3.2f Checks | Enriques char ≠ 2 and ordinary char 2 | `Pic⁰=0`, `Pic^τ=ℤ/2`; `μ₂=Spec k[t]/(t−1)²` is connected and nonreduced | Pass |
| `artinComparisonCompactSupport` D⁺ clause | `RΓ_c=RΓ(X̄,j_!K)` | XVII 5.3.5 for torsion `F` plus the way-out extension | Pass |

**Policy.** No copied passage, algorithm, `set_option`, sorry'd data, `lemma`, pull-request number in the README, or machine path. The process word is R05.

## Not verifiable

- A. Dimca, *Sheaves in Topology*, §§2.1–2.5, §3.2 and §4.1 (C6.1). Springer, paywalled; no legal copy found. The C6.1 statement is checked instead against Sella and Hatcher §3.H.
- P. Deligne, SGA 4½, *Théorèmes de finitude*, §§1–2 (C6.4). Paywalled Springer LNM 569. C6.4 is checked against SGA 4 XVI 4.1 and XVII 5.3.3–5.3.5.
- Hironaka 1975 and Bochnak–Coste–Roy §9.2 (C6.0). These are paywalled; the consumed statement is checked on AffineMorseLefschetz §5.1 instead.
- Kato 1989, Katz–Oda 1968, Knutson, Whitney and tom Dieck 2009. None is in the seeded sample, and none was read this round.

## Source issues

- **Misprint** in Deligne 1970 (LNM 163) at II §5, printed p. 94: the source numbers the paragraph after 5.2 as 4.3; it should be 5.3, as Proposition 5.4 refers to "T comme en 5.3"; affects nothing.
