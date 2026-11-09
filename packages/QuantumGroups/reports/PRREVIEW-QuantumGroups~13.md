# Review of QuantumGroups (pull request #1705 at 0d7cbcc)

**Verdict:** needs changes

:robot: Independent AI review, full. The head is unchanged since review ~11 (0 changed lines in the folder, nothing outside it). Every passage was reviewed again.

There are four findings: two P2 (blocking) and two P3.

- **R01:** after merge, Layer 8 and `StarCompatibleHopf` restate Tau Ceti.
- **R02:** §§0.2–0.3 have a second owner in two open roadmaps.
- **R03:** carried from review ~11 R01 and still not repaired.
- **R04:** new; two headlines carry a hypothesis they do not need.

The gate passes and the dependency check reports 0 problems. `Suggested.lean` elaborates with exactly 13 `sorry` warnings, and the one-tactic padding probe closes nothing. All 15 seeded targets were checked; the four with only Timmermann locators are under Not verifiable.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Other roadmaps are read on main (`81eec20`) or at the open head named. Sources are cited as `<id> line N` in the worker's cache.

## R01 (P2) — After merge, Layer 8 and `StarCompatibleHopf` restate what main's Tau Ceti pin already proves

**Location:**
- `Suggested.lean:192`: "`U_q(sl₂)` as the quotient of the free complex algebra by `QuantumSL2Relation q`", followed by nine Layer 8 theorems (`:225`–`:340`).
- `Suggested.lean:81`: `class StarCompatibleHopf`.
- README `:1305`–`:1316`: "Construct `QuantumSL2` … as the native `RingQuot` … Own a reusable σ-derivation Ore extension".

**Claim:** Tau Ceti has no `U_q(sl₂)`, Ore extension, finite Hopf-module category or star-coalgebra class, so the roadmap must build and state them.

**Witness:** This branch pins Tau Ceti `358314d`; main pins `2fd255d`. The pull request does not touch `lake-manifest.json`, so the merged folder builds against `2fd255d`. There, `TauCeti.UqSl2` has these exact relations and coproduct, and every Layer 8 headline is proved.

**Detail.** At this branch's own pin none of these exist (`TauCeti/QuantumGroups/` is absent), which is why the gate and the build pass. At `2fd255d` the correspondence is exact:

| This head | Tau Ceti at `2fd255d` |
| --- | --- |
| `QuantumSL2Relation`, `QuantumSL2` | `UqSl2.Rel`, `UqSl2` (`QuantumGroups/UqSl2/Basic.lean:69`–`:86`): same five relations, same `(q − q⁻¹)⁻¹` totalisation |
| `quantumSL2Comul_exists` | `instHopfAlgebra` with `comul_e`, `comul_f`, `comul_k` (`Hopf.lean:167`, `:180`–`:189`): `ΔE=E⊗1+K⊗E`, `ΔF=F⊗K⁻¹+1⊗F` |
| `quantumSL2PBW_exists` | `pbwBasis`, `pbwBasis_apply` (`PBW.lean:184`–`:192`), assuming only `[Fact (q ≠ 0)]` (`:53`) |
| `quantumSL2_domain` | `instIsDomain` (`OreTower.lean:350`; "for every nonzero `q`", `:50`) |
| `quantumSL2_center` | `center_eq_adjoin_casimir`, `polynomialAlgEquivCenter` (`Center.lean:129`, `:187`) |
| `quantumSL2_finite_semisimple` | `isSemisimpleModule_of_finiteDimensional` (`CompleteReducibility.lean:300`) |
| `quantumSL2_simple_classification`, `quantumSL2_exists_ladderAction` | `existsUnique_linearEquiv_ladderModule` (`SimpleClassification.lean:62`) with `LadderModule` |
| `quantumSL2_locallyFinite_iff` | `isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` (`TypeOne.lean:370`) |
| `quantumSL2_locallyFinite_semisimple` | `isSemisimpleModule_of_isLocallyFiniteModule` (`LocallyFinite.lean:63`) |
| `StarCompatibleHopf` | `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean:46`), with the same field `comul_star` |
| §8.1 Ore extension, §8.5 `FiniteHopfModuleCat` | `Algebra/OreExtension/{Basic,Degree}.lean`; `Algebra/Category/FiniteHopfModuleCat/{Basic,Monoidal,RightRigid,Rigid,Pivotal}.lean` |

The folder's own `STATUS.md` (generated, on this head) already lists Q8 items 1–4 and 7 as done in Tau Ceti. After merge, `QuantumSL2` is a stand-in for a native carrier, and nine headlines restate proved library theorems. The README also re-plans built library work as targets. The competing revision #1649 (`cdeeada`, README `:48`–`:65`) already states Layer 8 on the native carrier.

**Repair:** rebase onto main, which brings Tau Ceti `2fd255d`. Then:

1. **Scope and §§8.1–8.5.** Name the Tau Ceti declarations above as supplied, in `## Scope and ownership`, the `From Tau Ceti` contract and §§8.1–8.5. Keep as targets only what `2fd255d` lacks: the Biedenharn–Elliott pentagon, the U_q pivotal comparison, §8.6 and §8.7. #1649's `:48`–`:65` shows the form. The AlgebraicAnalysis comparison (`:1717`) is then superseded by Tau Ceti's own Ore extension.
2. **`Suggested.lean`.** Replace `StarCompatibleHopf` by `TauCeti.StarCoalgebra ℂ A`, importing `TauCeti.Algebra.Coalgebra.Star`. Delete `SL2Generator` through `quantumSL2_locallyFinite_semisimple`, and say in the module docstring that these headlines are proved in Tau Ceti. Add any unproved Layer 8 headline that becomes statable on the native carriers, such as the Biedenharn–Elliott pentagon on `FiniteHopfModuleCat`.
3. **Docstring.** Re-check the "not statable" list of the module docstring at `2fd255d`.

**Tested:** I compared `UqSl2.Rel` (`Basic.lean:69`–`:79`) and `comul_e`/`comul_f`/`comul_k` (`Hopf.lean:180`–`:189`) with `QuantumSL2Relation` (`Suggested.lean:175`–`:190`) and `quantumSL2Comul_exists`: they agree term for term. `pbwBasis` needs only `q ≠ 0`, so it already covers `quantumSL2PBW_exists`. Lean was not run at `2fd255d` (see Not verifiable).

## R02 (P2) — §§0.2–0.3 are also owned by CategoricalOperatorAlgebras (#888) and TemperleyLiebOperatorAlgebras (#867)

**Location:** `:25`–`:28`, "Layer 0 owns the free-module coaction legs built on these, elementary C*-categories with standard conjugates and the unitary Temperley–Lieb category". Sections §0.2 (`:220`–`:268`) and §0.3 (`:270`–`:324`).

**Claim:** Layer 0 is the single owner of C*-categories with standard conjugates and of the unitary Temperley–Lieb category.

**Witness:**
- #888 (`363a7e3`), `README.md:40`–`:46`: CA1a/CA2a "have their single home here; QuantumGroups consumes CA1a and CA2a".
- #867 (`7cf3fee`), `README.md:1272`: "Layer 3: The unitary Temperley–Lieb category"; `:137`: "QuantumGroups consumes Layers 1–3".

**Detail.**
- **§0.2 against CA1a/CA2a.** §0.2 builds the dagger Karoubi completion, the finite-Hilbert and Hilbert-module categories, standard solutions, intrinsic dimension and signed self-dualities. CA1a/CA2a list exactly these (#888 `:40`–`:46`, `:2135`).
- **§0.3 against #867 Layer 3.** §0.3 builds the Hom-space adjoint, the positive trace forms, the C*-norms, and the rigid C*-tensor envelope with generic and truncated fusion. #867 Layer 3 builds the same (§§3.1–3.4, `:1274`–`:1432`).
- **Mutual hand-offs.** Each side says the other consumes it. Main's README of this roadmap (`:42`–`:43`) still cites both as suppliers.

**Repair:** settle one owner.

- **Owner here (recommended).** QuantumGroups is on main, so the dependency check treats it as earlier than both. A probe copy of this README that cites CA1a/CA2a and TemperleyLiebOperatorAlgebras Layers 1–3 prints:

  ```text
  UPWARD: QuantumGroups (on main) -> CategoricalOperatorAlgebras (#227) at README lines [84, 270]
  UPWARD: QuantumGroups (on main) -> TemperleyLiebOperatorAlgebras (#243) at README lines [85, 326]
  ```

  So keep §§0.2–0.3 here, and change #888 (`:40`–`:46`, `:2135` and CA1a/CA2a) and #867 (`:137`, `:1777`–`:1787` and Layer 3) to cite QuantumGroups §0.2 and §0.3 instead of building these objects. In this folder, list CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras Layer 3 as consumers of §0.2/§0.3 under `## Downstream consumers`. State the arrangement in the pull request description.
- **Owner there.** Merge #888 and #867 first, then cite CA1a/CA2a and TemperleyLiebOperatorAlgebras Layer 3 here and delete §§0.2–0.3. This needs a stated merge order, and the check passes only once both are on main.

**Tested:** with this head's README unchanged the dependency check prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. The probe (owner there, before they merge) prints the two UPWARD lines above.

## R03 (P3) — A conflicting revision with no stated order, and a title and description that describe a different head

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg"; the description "Add Q9 to build `RepUqg`" and "Prerequisites: #1125 and #1124 must merge first".

**Claim:** the description matches the head, and this is the only open revision of QuantumGroups.

**Witness:** this head has no Q9, `RepUqg` or ribbon structure: it has Layers 0–8 and 13 `Suggested.lean` headlines. #1649 (`cdeeada`) also revises QuantumGroups and conflicts in both files (overlaps.md). Its Layer 0 numbers C*-categories §0.1 and the Temperley–Lieb comparison §0.2.

**Repair:**
- Retitle and redescribe the pull request for Layers 0–8 and the 13 headlines, and drop the #1125/#1124 prerequisites.
- State which revision prevails: either this one supersedes #1649, which is closed, or this one is rebased onto #1649.
- Rebasing onto #1649 also settles most of R01, since #1649 already uses `TauCeti.UqSl2` and `TauCeti.StarCoalgebra`.

No file of the folder changes.

Carried from review ~11 R01 (also review ~9 R01, ~7 R03, ~6 R06). No repair report marks it not actionable. Its ownership part is now R02, at the severity the rules give a second owner.

## R04 (P3) — `quantumSL2PBW_exists` and `quantumSL2_domain` assume q is not a root of unity, which neither needs

**Location:**
- `Suggested.lean:243`–`:244` and `:253`–`:254`, `(hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)`, with the docstrings "for `q ≠ 0` not a root of unity".
- README `:1297`–`:1298`, which imposes this on all of Layer 8, §8.1 included.

**Claim:** the PBW basis and the domain property need generic q.

**Witness:** at q = i, σ_E(K) = −K, σ_E(F) = F and δ_E(F) = (K−K⁻¹)/(2i) respect FK = q²KF: both sides give K(K−K⁻¹)/(2i). So §8.1's Ore tower applies. Tau Ceti's `pbwBasis` and `instIsDomain` (`2fd255d`) assume only q ≠ 0.

**Repair:**
- Delete `hgeneric` from both statements and change their docstrings to "for `q ≠ 0`".
- In §8.1, say that PBW and the domain property hold for every q ≠ 0, so the generic hypothesis enters at §8.2.
- Add a Check at q = i, where KF = −FK and the three-step tower still gives the basis F^a K^b E^c.

This is superseded if R01's repair replaces both statements by Tau Ceti's. Keeping `q ≠ 0` is right: at q = 0 the relations force E = F = 0, so the PBW family contains zeros.

**Tested:** at q = i, `δ_E(FK) = σ_E(F)δ_E(K)+δ_E(F)K = (K−K⁻¹)K/(2i)` and `δ_E(q²KF) = q²(σ_E(K)δ_E(F)+δ_E(K)F) = q²q⁻²K(K−K⁻¹)/(2i)`, which are equal. σ_F, σ_E are injective for q ≠ 0, which is what the domain argument uses.

## Previous findings

- **Review ~11 R01 — not repaired.** The head is unchanged; the title is still "construct the ribbon category RepUqg"; #1649 is open (now `cdeeada`, still conflicting); #888 and #867 still claim §§0.2–0.3's objects. Carried as R03, with its ownership part raised as R02.

## Verified sound

**Gate, build and dependency check.**

- **Head and scope.** The head is `0d7cbcce3c83c63ec654d693cc292a0e3d99b59e` with a clean worktree. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are generated roadmap files (`stray-files=0`).
- **Gate.** Re-run: every check 0 (`set_option`, `latex`, `prnum`, `sorry-data`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder`, `source-material` …), ending `OK`. The worker's run also has `build=0`.
- **Build.** `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly 13 `declaration uses sorry` warnings, at lines 109, 140, 150, 158, 225, 243, 253, 260, 268, 280, 301, 324 and 335, and nothing else.
- **Dependency check** (unmodified output of the required command): `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. QuantumGroups is on main and absent from the merge order; every supplier it names is on main: TemperleyLieb, Subfactors, VonNeumannAlgebras, HilbertModules, CStarAlgebras, RepresentationTheory/CompactGroups, RepresentationTheory/LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups and PivotalSpherical.
- **Policy.** No process words, LaTeX delimiters, pull-request numbers, `lemma` or `set_option`.

**Signatures.** I put a `#check @name` for each of the 25 declarations in one scratch file and elaborated it once: 0 errors.

- Each elaborated type matches its README statement at the same generality.
- The one lead in the signature file, `AlgebraicHaar` dropping `[StarModule ℂ A]`, is harmless: its fields never use it.
- The signature file's entry "`on`" is the word "structure" in the module docstring (`Suggested.lean:59`–`:60`), not a declaration.

**Padding probe.** I replaced each `sorry` by `first | rfl | infer_instance | trivial | simp | decide` in a scratch copy. All 13 fail: 12 fall through every alternative, and on `quantumSL2_simple_classification` `simp` leaves goals. None restates a definition, mirrors a Check or computes a small value. No padding.

**Headline coverage (at this branch's pin).**

- Layer 3: `schur_orthogonality`.
- Layer 4: `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive`.
- Layer 8: nine theorems.
- The module docstring names the rest and the carrier each lacks: the minimal C*-tensor product, the free Hilbert module `H⊗A`, the strict topology (a TODO at `Mathlib/Analysis/CStarAlgebra/Multiplier.lean:47`), and the monoidal Hopf-module category. I confirmed none exists at `358314d`/Mathlib `f6090c7`. R01 changes this at `2fd255d`.

**Library declarations opened at this branch's pin:**

- Tau Ceti:
  - `Comodule.coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68`, entry `(i,j)` = coordinate i of δ(b_j), the README's column convention);
  - `comul_coefficientMatrix_eq_sum` (`:117`);
  - `map_antipode_mul_coefficientMatrix` (`:173`);
  - `IsCompletelyReducible` (`Comodule/LinearlyReductive.lean:104`);
  - `antipode_antipode`, `antipodeAlgEquiv` (`Algebra/HopfAlgebra/Antipode.lean`);
  - `FDRep.ofShrink`, `ofShrinkEquiv` (`RepresentationTheory/FDRep.lean`).
- Mathlib:
  - `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean:37`);
  - `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`);
  - `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean:269`);
  - `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `norm_map_star_mul_le`, `norm_map_mul_star_le` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`);
  - `orthogonalComplement_iSup_eigenspaces_eq_bot`, `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean`);
  - `instCompletelyPositiveMapClass`, `gelfandStarTransform_naturality`, `compContinuousMap`, `homeoEval`, `antipode_mul_antidistrib`, `Rep.equivalenceModuleMonoidAlgebra`, `WithConv`, `SkewPolynomial`, all at the files the README names.
- At main's pin `2fd255d`: the 14 declarations and files in R01's table.

**External reference.** The AlgebraicAnalysis file at commit `fbb7bb4` (`:1717`) declares `rightMul_assoc_of_ring` and `oreLift` over a noncommutative `[Ring B]`, with the plain-derivation relation `X b = b X + D(b)`, as the README says.

**Cross-roadmap citations resolved (24):**

- VonNeumannAlgebras: Layer 0 (`:275`), Layer 1 (`:392`), Layer 3 (`:905`), Layer 11 (`:2785`, full left Hilbert algebras `:2794`), V4.Core/PositivePredual/Normality (`:244`), V10.ModularTheory (`:2364`), V10.KMS (`:2459`), V13b.SpatialNorm (`:70`, `:3740`).
- CStarAlgebras: C1.7 (`:468`), C1.CommutativeMultiplierMorphisms (`:497`), C5.1 (`:1112`; flip, associativity), C5.2 (`:1143`; `C₀(X)⊗min A≅C₀(X,A)`).
- HilbertModules: H1 (`:126`), H2 (`:179`), H3 (`:262`).
- Subfactors: §3.1 (`:676`), §3.2 (`:697`; `markovTrace_nonneg_iff` `:729`), §3.3 (`:774`; path models, `ker π_n=R_n`, reusable C*-lemma, `tr_n=δ⁻ⁿτ_n`, m = 3 Check).
- TemperleyLieb: Layer 4 presentation theorem (`:554`–`:567`, `presentedTLEquiv`), Layer 6 negligible ideal and Goodman–Wenzl (`:713`–`:724`), Layer 7 (`:767`).
- PivotalSpherical: Layers 0–2 and 7 (`:257`, `:283`, `:318`, `:477`; `leftTrace`/`rightTrace` `:329`–`:330`).
- OperatorAlgebraDynamics: D1 (`:148`), D2 (`:221`).
- FreeProbability: F1 (`:127`), F3 (`:255`), F6 (`:532`).
- AmenableGroups: Layers 1, 5 and 7 (`:98`, `:289`, `:415`).
- RepresentationTheory/CompactGroups: coefficient convention `⟨π g v, w⟩` (`:170`), `su2Irrep` (`:400`).
- RepresentationTheory/LieHighestWeight: `IsSl2Triple` (`:5`, `:140`).
- Consumers: QuantumEnvelopingAlgebras Layer 1 (`:323`, citing Q8 item 1 at `:183`); HopfologicalAlgebra §2.1 (`:317`, citing Q8 item 5 at `:165`).
- The Q8 item 1 and item 5 crosswalk at `:155`–`:160` keeps both ids.

**Overlaps and ownership.**

- overlaps.md lists no dropped id and no id that only an open revision defines; `roadmaps resolve` finds nothing.
- I compared ownership with #888, #867 (R02), #1649 (R03), #1015 NoncompactQuantumSymmetry (particle representations, no compact quantum groups), #1137 OperatorAlgebraDynamics (no claim on these objects) and #1858 ClusterAlgebras (consumer of §8.1 only).
- Searches for "compact quantum group", "SUq(2)", "Tannaka–Krein", "free orthogonal" and `U_q(sl₂)` across main and the open heads find no other owner.
- No declaration of `Suggested.lean` shares a fully qualified name with another roadmap's file (#1649 is this roadmap).

**Seeded sample (15 targets).**

- **0.2 — verified.** Longo–Roberts:
  - §2 p.4 (`longoroberts` lines 121–142): C*-property, conjugate equations;
  - Lemma 3.3 p.10 (line 389);
  - Theorem 3.8 p.15 (line 621);
  - Theorem 3.11 p.17 (lines 681–683): `R*R·R̄*R̄ ≥ d²`, with equality iff a multiple is standard;
  - Appendix pp.48–49 (lines 2000–2050): completion by sums and subobjects.

  Neshveyev–Tuset:
  - Definition 2.2.10 p.32 (`nt` line 1427);
  - Definition 2.2.12 (lines 1446–1454: standard needs `‖R_k‖=‖R̄_k‖`);
  - Theorem 2.2.14 p.33 (lines 1501–1512: standard iff the left and right traces agree, the README's definition);
  - Theorem 2.2.17 p.35 (lines 1596–1600);
  - §2.5 p.52 (lines 2426–2431: `R̄=−τR`);
  - Definition 2.7.1 p.70 (lines 3236–3241, with the remark giving d ≥ 1).

  The "equality iff invertible" step is the README's own argument, which I checked (row 2).
- **0.3 — verified.** Penneys:
  - Proposition 4.5.3 p.158 (`penneys` line 745);
  - Facts 4.5.5 p.159 (line 758);
  - Example 4.6.12 p.163 (line 941);
  - Example 4.6.14 p.164 (lines 1000–1008: truncation to vertices 0…n−1 when [n+1]=0).

  Neshveyev–Tuset pp.54–55 (lines 2490–2559): `TL_(d,τ)` for d ≥ 2 or d = 2cos(π/k), k ≥ 4. The m = 3 case rests on Subfactors §3.3, as stated.
- **1.1 — verified.** Kustermans–Vaes, Notations p.840 (`kustermansvaes` lines 168–197: minimal tensors, unique strict extension, leg map `a⊗c↦a⊗1⊗c`) and Definition 2.1 p.853 (lines 743–746).
- **1.2 — partly.** Haar existence cites only Timmermann Theorem 5.1.6 (uncertified). The statements are checked computationally (rows 8–9).
- **2.3 — partly.** Timmermann Propositions 5.3.7–5.3.8 (uncertified); statements checked (row 10).
- **3.2 — verified against Neshveyev–Tuset.** The convolution convention `a↦(ι⊗f)Δ(a)` (`nt` line 966), `f_z` (lines 941–963), `f̄_z=f_(−z̄)` and `σ_z=f_(iz)*a*f_(iz)` (lines 955–972) match. The Timmermann locators are uncertified.
- **4.1 — verified.**
  - Neshveyev–Tuset Theorem 1.4.2 p.9 (`nt` lines 447–452): the README's forms are NT's with `F̃=ρᵗ`, `(F̃⁻¹)_ik=(ρ⁻¹)_ki`, `dim_q=Tr ρ`.
  - Theorem 1.6.6 p.18 (lines 810–820): spanning by unitary coefficients gives the invariant functional.
  - Theorem 1.7.3 p.22 (lines 977–978): `h(ab)=h(bσ_(−i)(a))`, with `σ_(−i)(a)=f_1*a*f_1=θ(a)`.
  - Proposition 1.7.7 p.23 (lines 1036–1040): trace ⇔ `S²=ι`.
- **4.2 — verified.** Bédos–Murphy–Tuset §2 p.12 (`bmt` lines 518–566): the regular unitary, isometry by invariance, onto by cancellation, `Δ=W(1⊗·)W*`. Theorem 3.6 pp.18–19 (lines 858–871).
- **5.1 — verified.** Bédos–Murphy–Tuset pp.13–14 (`bmt` lines 592–605): the matrix `[[α,−qγ*],[γ,α*]]`. The five relations were derived from `u*u=uu*=1` (row 20). Timmermann Chapter 6 is uncertified.
- **6.2 — verified.** Malacarne:
  - Theorem 1.1 p.2 (`malacarne` lines 52–60, hypotheses (1)–(5) as in the README);
  - the tensor algebra, `A_n`, `B_n`, `I_n` (lines 63–126);
  - Lemma 1.2 (line 127);
  - Lemma 2.1 p.3 (line 183);
  - Lemma 2.2 p.4 (line 202);
  - Lemma 3.1 (line 235);
  - Theorem 4.1 p.5 (line 285).
- **6.3 — verified.** Malacarne Theorem 4.1 p.5 and the uniqueness argument (lines 275–281). The semigroup step is the README's own argument.
- **7.1 — verified, with a source misprint (below).** Bédos–Murphy–Tuset Theorem 2.12 p.13 and Corollary 2.13 p.14 (`bmt` lines 614–646). The weighted shift `ϕ(α)e_(n,k)=c_n e_(n−1,k)`, `ϕ(γ)e_(n,k)=q^n e_(n,k+1)` matches `:1198`. The source's Haar formula lacks the weight `q^(2n)`; the README's `(1−q²)Σq^(2j)f(q^(2j))` is the correct one (row 25).
- **8.1 — verified.** Virelizier §2.3, Proposition 2.4 p.8 (`virelizier` lines 348–359): q not a root of unity, `Δ(E)=K⊗E+E⊗1`, `Δ(F)=1⊗F+F⊗K⁻¹`, `S(E)=−K⁻¹E`, `S(F)=−FK`, `S²=Ad(K⁻¹)`, spanning by `F^mK^nE^p`. The README claims only convention and spanning from it.
- **8.4 — verified.** Virelizier §3.2 p.11 (`virelizier` lines 529–537): type 1 means a direct sum of the `q^n`-eigenspaces. Example 3.3 and Proposition 3.7 (lines 552–593) cover positive ladders only, as the README says.
- **8.6 — verified.** The pairing and metric are the README's own computations (rows 41–42). Virelizier §2.3 as above; Timmermann Chapter 6 is uncertified.

**Adversarial pass.** Throughout, q = 1/2 unless stated, u is the sign character of C₂, and the SUq(2) matrix is `[[a,−qc*],[c,a*]]`.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.2 standard solutions and minimal product | (2R, R̄/2) on ℂ² | norms² 8 and 1/2, product √8·√(1/2)=2=d (minimal); traces φ(1)=8, ψ(1)=1/2 differ, so not standard (NT Def 2.2.12, Thm 2.2.17 "up to scalars") | pass | none |
| 2 | §0.2 d(X)≥1, equality iff invertible | SU_(1/2)(2) fundamental; a character | d=5/2>1; `X⊗X̄=1⊕r_2`: 1+21/4=25/4=(5/2)²; character d=1, `χ⊗χ̄=1` | pass | none |
| 3 | §0.2 τ=−ε | SU(2) fundamental | NT `−τ(R*⊗ι)(ι⊗R)=ι` with τ=1 gives zigzag −1=ε; J(z₁,z₂)=(−z̄₂,z̄₁), J²=−I | pass | none |
| 4 | §0.3 truncation `min(k+l,2(m−2)−k−l)` | m=3; m=4 | m=3: 1⊗1=0 (dim 1=1); m=4: 1⊗1=0⊕2 (2=1+1), 1⊗2=1 (√2=√2), 2⊗2=0 (1=1) | pass | none |
| 5 | §0.3 cup, projection and JW₃ | d=5/2; d=√2 | `tr_2(p)=1/d²=4/25`, `tr_2(1−p)=21/25`; `[4]=d³−2d=2√2−2√2=0` | pass | none |
| 6 | §1.1 coproduct and bi-C*-algebra | ℤ, f=1[0]; S₃, g=(12), h=(23) | Δf=1[m+n=0] has norm 1, not in C₀(ℤ²); (12)(23)=(123) (Mathlib order): Δf(g,h)=1, Δf(h,g)=0 | pass | none |
| 7 | §1.1 `C₀(X,C₀(Y))≅C₀(X×Y)` | H=1[m=n=0]; H=1[m+n=0] on ℤ² | first in both; second has constant fibre norm 1, in neither | pass | none |
| 8 | §1.2 cancellation fails on monoid {1,0} | Δ(A)(A⊗1) | spanned functions satisfy H(0,0)=H(0,1): dimension 3 vs 4 | pass | none |
| 9 | §1.2 Fell absorption | general g,k; Γ=ℤ | `W(λ_s⊗1)W*(δ_g⊗δ_k)=δ_(sg)⊗δ_(sk)`; δ₁⊗δ₂ ↦ δ₂⊗δ₃ | pass | none |
| 10 | §2.3 regular corepresentation | C₂; S₃; trivial | 1+1=2; 1+1+4=6=\|S₃\|; Λ(2)↦2⊗1 | pass | none |
| 11 | §3.2 Plancherel norm | a+c | `((F̃⁻¹)₁₁+(F̃⁻¹)₂₂)/Tr F̃⁻¹=(1/2+2)/(5/2)=1`; `h(a*c)=0` | pass | none |
| 12 | §3.2 modular characters | a, c | f_z(a)=2^z; f_1*f_1(a)=4=f_2(a); θ(a)=4a, θ(c)=F₂₂cF₁₁=c | pass | none |
| 13 | §3.2 Vandermonde | λ=1,2 | det [[1,1],[1,4]]=3≠0 | pass | none |
| 14 | `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] with x primitive | true/true; h(\|a\|²+\|b\|²)>0; zero ring excluded by `Nontrivial`; unitary comodules are exp(xN) with N nilpotent and skew, so N=0, span ℂ≠ℂ[x], no Haar: false/false | pass | none |
| 15 | `haar_modular_automorphism` | SU_(1/2)(2); ℂ[S₃] | h(aa*)=4/5=4·h(a*a)=h(a*θ(a)); θ⁻¹ gives 1/20; ℂ[S₃]: θ=id | pass | none |
| 16 | `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | both true; 1/5≠4/5 and S²(c)=c/4≠c, both false | pass | none |
| 17 | §4.2 pentagon | V(x⊗y)=Δ(x)(1⊗y); ℤ | both words give `(Δ⊗ι)Δ(x)(1⊗y'⊗y''z)`; (1,2,3)↦(1,3,6) both | pass | none |
| 18 | §4.2 V implements Δ_r | V(λ(a)⊗1)(x⊗y) | =Δ(ax)(1⊗y)=Δ(a)V(x⊗y) | pass | none |
| 19 | §4.2 C*- vs Haar norm | 1+u on C₂ | ‖1+u‖=2 in both completions; ‖Λ(1+u)‖₂=√2 | pass | none |
| 20 | §5.1 relations ⇔ unitarity | u*u, uu* entries; a=0, c=1 | entries a*a+c*c, q²cc*+aa*, ac−qca, ac*−qc*a; q=1/2: aa*+q²c*c=1/4≠1, q=1: I₂ | pass | none |
| 21 | §5.1 antipode | S(u_ij)=u_ji* | S(c)=u₁₂*=−qc; S(c*)=−q⁻¹c*; S²(c)=c/4 | pass | none |
| 22 | §5.2 cup, invariance and bound | F=[[0,1],[−2,0]] | FF̄=−2I; E=−2e₀⊗e₁+e₁⊗e₀, ‖E‖²=5; F*F=diag(4,1), 5/2≥2; `Σ u_ijF_lj u_kl=Σ_a F_ka(uu*)_ia=F_ki` | pass | none |
| 23 | §6.2 truncations | H=0; H=ℂ; R=ΣF_ji e_i⊗e_j | A=ℂ, quotient ℂ; dim A_≤1=2; (R*⊗1)(1⊗R)=FF̄ | pass | none |
| 24 | §6.3 cancellative semigroup | {1,0}; C₂ | 0·1=0·0 with 1≠0; identity e, inverse fixes both points, Haar 1/2 each | pass | none |
| 25 | §7.1 Haar on c*c | q=1/2; f=1; q=±1 | (1−q²)/(1−q⁴)=4/5, (1−q²)/(1−q⁶)=16/21; f=1 gives 1 (an unweighted sum diverges); ∫t=1/2, ∫t²=1/3 | pass | none |
| 26 | §7.1 weighted-shift character | ξ₂, ξ₃; e_(k,0) | √3/4≈0.433; (√3/2+√15/4)/3≈0.611, increasing to 1; basis vectors give 0 | pass | none |
| 27 | §7.1 q=−1 model | a=√(1−t)zσ₃, c=√t wσ₁ | a*a+c*c=(1−t)+t=1; σ₃σ₁=−σ₁σ₃ gives ac=−ca, ac*=−c*a | pass | none |
| 28 | `quantumSL2Comul_exists` | relation check | cross terms KF⊗EK⁻¹=FK⊗K⁻¹E cancel; [ΔE,ΔF]=(K⊗K−K⁻¹⊗K⁻¹)/(q−q⁻¹)=Δ([E,F]) | pass | R01 |
| 29 | `quantumSL2Comul_exists`, role of q≠0 | q=0 | relations force E=F=0, U₀=ℂ[K^±], Δ exists uniquely; `hq` is a note only, matching Tau Ceti's `[Fact (q ≠ 0)]` | pass | none |
| 30 | `quantumSL2PBW_exists`, `quantumSL2_domain` | q=i | δ_E(FK)=K(K−K⁻¹)/(2i)=δ_E(q²KF): tower valid without `hgeneric` | narrow | R04 |
| 31 | §8.5 Δ(E^r) | r=2 | middle term (1+q²)EK⊗E=q[2]_q=5/4; q⁻¹[2] gives 5 | pass | none |
| 32 | `quantumSL2_center` | L_m^ε; q=±1 | Casimir 10/9, 17/9, 65/18 and negatives; L₁⁺: diag(0,1)+diag(17/9,8/9)=(17/9)I; q=±1 commutative, excluded by `hgeneric` | pass | R01 |
| 33 | `quantumSL2_finite_semisimple` | L₀⁻⊕L₁⁺; q=1 | blocks −10/9, 17/9; q=1 (excluded): E=[[0,1],[0,0]], F=0, K=1 is a non-split extension | pass | R01 |
| 34 | `quantumSL2_simple_classification` | ladder identity; L₂⁺; sign uniqueness | `[j+1][m−j]−[j][m−j+1]=[m−2j]`: 5/2, 0, −5/2; −q^m=q^(m−2j) forces q^(4j)=1 | pass | R01 |
| 35 | `quantumSL2_exists_ladderAction` | (m,ε)=(0,−1), (1,1) | K=−1, E=F=0 on ℂ¹; K e₀=e₀/2 | pass | R01 |
| 36 | `quantumSL2_locallyFinite_iff` | L₀⁻; Verma M(1); 0; ⊕_ℕ L₀⁺ | true/true; F^jv₀≠0 (weights 4^j): false/false; true/true; infinite-dimensional, true/true | pass | R01 |
| 37 | `quantumSL2_locallyFinite_semisimple` | ⊕_ℕ L₀⁺; M(1) | semisimple; M(1) excluded by `hV` (Fv₀ singular, no complement) | pass | R01 |
| 38 | §8.4 type 1 | L₀⁻ | K=−1 ∉ {q^k}; locally finite, not type 1 | pass | none |
| 39 | §8.5 Clebsch–Gordan recurrence | m=n=j=1 | α₁=−q=−1/2; ΔE(v₀⊗v₁−½v₁⊗v₀)=½v₀⊗v₀−½v₀⊗v₀=0 | pass | none |
| 40 | §8.5 pivot g=K⁻¹ | linearity of j; traces | `(h·j(v))(φ)=φ(S²(h)gv)` needs S²=Ad(g)=Ad(K⁻¹) (Virelizier Prop 2.4); tr K⁻¹ on L₁⁺=5/2, on L₀⁻=−1 | pass | none |
| 41 | §8.6 invariant metric and pairing | m=1 | h₁/h₀=[1]/([1]q⁻¹)=1/2; E*=KF=2F; orthonormal entries √2=q^(−1/2), 1/√2=q^(1/2); ΔF(v₀⊗v₁−qv₁⊗v₀)=qv₁⊗v₁−qv₁⊗v₁=0 | pass | none |
| 42 | §8.6 SUq(2) cup comparison | F=[[0,1],[−q⁻¹,0]] | `FūF⁻¹=[[a,−qc*],[c,a*]]`; cup ∝ e₀⊗e₁−qe₁⊗e₀=v₀⊗v₁−qv₁⊗v₀ with v₁=√q u₁; (EF−FE)*=EF−KFEK⁻¹=EF−FE | pass | none |
| 43 | `schur_orthogonality` | SU_(1/2)(2) | `ū*F̃ū` entries 2, 1/2, 0, 0 for F̃=diag(2,1/2); h(a*a)=1/5, h(c*c)=4/5, h(aa*)=4/5, h(q²c*c)=1/5 | pass | none |
| 44 | §7.2 dimensions and coamenability | n=2, d=5/2; n=3 | intrinsic 1, 5/2, 21/4, 85/8; Hilbert 1, 2, 3, 4; ε(χ)=3∉[−2,2] | pass | none |
| 45 | §7.2 n=2 normal form | [[0,1],[−q⁻¹,0]]; F=I₂ | FF̄=−q⁻¹I, so sign c=−sign q; V=(1/√2)[[1,i],[1,−i]] gives VVᵗ=[[0,1],[1,0]] (q=−1) | pass | none |
| 46 | §2.2 unitarisation | U(s)=[[1,2],[0,−1]] | U²=I; T=[[1,1],[1,3]], det 2; U*TU=T | pass | none |
| 47 | §0.1 legs | φ=ε, T=1[s]; σ, U₁₂=u⊗1 | T_ε=0 while ‖T‖=1; σ(u⊗1)=1⊗u=U₁₃ | pass | none |

## Not verifiable

- **Timmermann.** *An Invitation to Quantum Groups and Duality* (EMS 2008) is `uncertified` (paywalled) in the manifest, so it is cited by locator only. The Timmermann locators of §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1, 7.1 and 8.6 were not checked against the text. Each of those statements was checked mathematically above, and where Neshveyev–Tuset or Bédos–Murphy–Tuset also covers it, against that text.
- **Main's Tau Ceti pin.** Lean was not run at `2fd255d`: the brief's pins are this branch's manifest. R01 reads those declarations as source files in the main checkout's package directory. Whether this `Suggested.lean` elaborates unchanged against main's Mathlib `1b1ccf4` was not tested.

## Source issues

- **Misprint** in bmt at Theorem 2.12, proof, printed p.13: the source says the Haar state is (1−q²) times the unweighted sum over n of ⟨ϕ(a)e_(n0), e_(n0)⟩; it should weight the n-th term by q^(2n), since the unweighted sum diverges at a = 1; affects nothing.
