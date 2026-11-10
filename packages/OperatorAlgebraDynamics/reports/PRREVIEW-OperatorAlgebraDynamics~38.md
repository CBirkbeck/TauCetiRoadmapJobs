# Review of OperatorAlgebraDynamics (pull request #1137 at e2d8e4d)

**Verdict:** needs changes

This is a full review of the folder at e2d8e4d, the head the previous review also read; nothing in the folder has changed since then. It has two findings, both P3 and both outside the folder's two files:
- the branch still deletes six files of other roadmaps, so the gate fails;
- the description's prose describes Lean files and warning counts that the head does not have.

The full pass over `README.md` and `Suggested.lean` found nothing to change. The record of that pass is under "Verified sound".

## R01 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Re-raised: H04

**Location.** Outside the folder:
- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`;
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`;
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`.

**Claim.** Merging this branch deletes from main six files that belong to other roadmaps. While it does, the gate fails and the folder cannot be accepted.

**Why the reason fails.** The repair report answered that a repair of this folder may edit only the folder. That is a statement about who can make the commit. The deletion is still on the branch, and the gate still refuses it.

**Witness.**
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` at e2d8e4d gives `6 files changed, 159 deletions(-)` for exactly these paths.
- `git log --full-history HEAD -- <path>` shows that they disappear in the merge commit 4133234f.
- My gate run: `outside-folder=6 … FAIL`, every other check 0.

**Repair.** In a new commit on the branch, run `git checkout origin/main -- <the six paths>`, then re-run the gate. Checked on this head: the merge base is 32a0bcc9, and `git cat-file -t` finds each path at 32a0bcc9 and at origin/main and not at HEAD. The checkout therefore restores the dropped blobs and touches nothing else.

## R02 (P3) — The description describes Lean files and warning counts that the head does not have

**Location.** The author's prose of the pull-request description, outside the generated `merge-order` block.

**Claim.** Three passages are wrong about the head.
- "Three native commutant/phase signatures in the new OrbitRepresentationTargets.lean elaborate with intentional proof admissions."
- "Only this added README unit and BoundedSequenceTargets.lean are included".
- "The whole exact Suggested.lean compiles privately … with ten intentional admitted-declaration warnings".

A further sentence says "Only README.md changes; Suggested.lean, metadata and all other public bytes are unchanged."

**Witness.**
- At e2d8e4d the folder contains only `PROGRESS.md`, `README.md`, `STATUS.md`, `Suggested.lean` and `metadata.toml`. There is no `OrbitRepresentationTargets.lean` and no `BoundedSequenceTargets.lean`.
- `lake env lean` of `Suggested.lean` reports 18 `declaration uses 'sorry'` warnings, not ten.
- `git diff --stat origin/main...HEAD -- TauCetiRoadmap/OperatorAlgebraDynamics` changes `README.md` (3968 lines) and `Suggested.lean` (589 lines).

**Repair.** Replace the stale paragraphs with one that describes this head:
- the branch changes `README.md` and `Suggested.lean`;
- `Suggested.lean` has 23 declarations, of which 18 are theorems admitted with `sorry`;
- there are no companion Lean files.

Or delete the paragraphs. The human approver reads this text, so it should match the head.

## Previous findings (review of e2d8e4d)

- **R01 (six deleted files) — not repaired.** The head is unchanged, and the six deletions and `outside-folder=6 … FAIL` remain. Raised again as R01 above.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate** (my run at e2d8e4d): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. It agrees with the worker's `gate.md`, which adds `build=0`.
- **Dependency check:** `depcheck: 234 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - The roadmap is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main.
  - Every *Needs:* line and supplier contract names only those.
  - The roadmaps that are not on main (NoncompactQuantumSymmetry, OperatorKTheory, CStarClassification, QuantumFoundations, CompactQuantumMetricSpaces, MetaplecticAutomorphicForms, CategoricalOperatorAlgebras, RelativisticQuantumFieldTheory, HeisenbergImprimitivity) appear only as deferrals or consumers.
- **Elaboration:** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` exits 0 in 12 s. The only diagnostics are 18 `declaration uses 'sorry'` warnings.
- **`#check @` of all 23 declarations**, plus the two structure constructors, in one scratch file importing the built module: all elaborate. I compared each type with its README statement. No section binder is lost, and the generalities agree:
  - `exists_integratedOperator` is for any `μ` with `InnerRegularCompactLTTop`;
  - `exists_covariantRepresentation_integratedFull` has `H : Type (max u v)`, the carrier's restriction, which README line 361 states;
  - `fullCrossedProductMap_exact` has `A B : Type v`, as functoriality requires;
  - Mackey has `borel G τ = ‹MeasurableSpace G›` and uniqueness among group topologies;
  - `mem_extremePoints_kmsStates_iff` has unital `A`, `[StarOrderedRing A]` and the hypothesis `α.IsKMSState β ω`;
  - `lcaWeyl_classification` has `ι : Type u` with `E : Type u`.
- **One-tactic probe.** I replaced every `sorry` with `first | rfl | infer_instance | trivial | decide | simp | norm_num` in a scratch copy. All 18 theorems fail, with errors at the 18 proof lines, so none is padding by that test.
  - The five definitions and structures have real bodies.
  - There is no sorry'd data, `set_option`, `example`, `lemma` or `True` placeholder.
  - The imports are `Mathlib` plus nine `TauCeti.*` modules, all present at the pin.
- **Headline audit.** The README's headlines and where each is stated:
  - D1: the L¹ integrated form, recovery of the pair, and ideal exactness;
  - D1.CentralTwists: twisted multiplicativity;
  - D1.BorelPrefix: automatic continuity and Mackey's theorem;
  - D2: the amenable full/reduced comparison;
  - D2.OrbitRepresentations: the orbit commutant;
  - D2.FreeGroups: the Powers partition, simplicity and unique trace;
  - D4.Harmonic: both Fourier isomorphisms;
  - D4.LCAWeyl: the LCA Weyl classification;
  - D6: Cuntz simplicity and the residue family;
  - D7: extreme KMS states are exactly the factor states;
  - D9: strong subadditivity.

  All are stated. The docstring's eight "not statable" items each name a missing carrier: reduced crossed product, C*-tensor product, twisted crossed product, imprimitivity bimodule, groupoid C*-algebra and universal `O_n`, Choquet simplex, modular operator, CAR/Weyl/quasi-local algebra. Searching the Tau Ceti declaration index and Mathlib, I found none of them at the pins.

### Seeded sample

- **"Worked example: the saddle flow"** (README lines 2099–2136), against `williams-cpcsa-draft31`.
  - Example 3.32 starts at line 6178, on printed p. 96 (page header at line 6145), and ends on p. 97 (header at line 6191).
  - The action `r·(x,y)=(rx,r⁻¹y)` is at line 6179. "Each b corresponds to two orbits" is at line 6181. "Every neighbourhood of (0,0) contains all the a_i" is at lines 6186–6187.
  - Basis (b) at line 6193 is the README's basis at the origin. Basis (c) at lines 6194–6195 is the basis at a half-axis point: `Q_i` is the right angle of A around `a_i`, that is, the two adjacent quadrant families.
  - The README's orbits, closures, bases and the conclusions T₀, not T₁ and not Hausdorff agree with the source, and every Check recomputes (row 26).
- **"D5.Fields — the standard-fibre model as a measurable field"** (lines 2624–2714).
  - Definition E.16 (line 23770) and Theorem E.17 (line 23776) are on printed p. 405. E.17's hypotheses are H separable, X second-countable locally compact Hausdorff and μ a finite Borel measure: D5.Fields' standing hypotheses.
  - Definition F.1 is at line 23897 on p. 409.
  - The "(nonzero)" fibre assumption is in the §F.1 setup at line 23893, p. 409. The dimension sets `X_n`, n=1,…,ℵ₀, at line 23982 start at 1, consistent with nonzero fibres throughout Appendix F.
  - The seven Checks recompute (row 27).
  - SelfAdjointSpectralTheory SA-B85 on main (its README line 676) delivers active coordinates `ℓ²({j:r_j(x)>0})`, which is the `N(x)` of D5.Fields.
- **"Concrete Cuntz families on separable Hilbert space"** (lines 3103–3139). Every formula is recomputed (row 23). Cuntz 1977 is uncertified (see Not verifiable).
- The README flags no locator as unverified.

### Further locators read (printed pages, all correct)

- **`williams-cpcsa-draft31`:**
  - Chapter 1: Prop. 1.76 p. 24, Lemma 1.78 p. 25, Cor. 1.79 p. 26, (1.20) p. 26 (line 1760, positive character), (1.21) p. 27 (line 1792, `n↔z^(−n)`).
  - Chapters 2–3: Prop. 2.23 p. 49, Prop. 2.40 p. 59 (line 3988), Thm 2.61 p. 72, Lemma 2.73 p. 76, Prop. 3.1 p. 82 (line 5398), Prop. 3.19 p. 93 (line 6050).
  - Chapter 4: Thm 4.1 p. 110, Cor. 4.17 p. 129, Thm 4.22 p. 132, Cor. 4.23 p. 133, Thm 4.24 p. 133 (line 8504), Def. 4.26 p. 135 (line 8646), Lemma 4.28 p. 136 (line 8678), Thm 4.29 p. 137 (line 8788).
  - Chapters 5 and 7: Thm 5.9 p. 157, Lemma 5.10 p. 158, Thm 7.1 p. 190, Lemma 7.2 p. 192, Lemma 7.8 p. 198, Ex. 7.11 p. 198, Thm 7.13 p. 199 (line 12297), Cor. 7.18 p. 203.
  - Appendix D: Thm D.3 and Lemma D.4 p. 370, Thm D.11 p. 372 (line 21995: separable metric groups, G Polish, which are the Lean hypotheses), Lemmas D.15–D.16 pp. 372–373, Def. D.19 and Lemma D.20 p. 375, Def. D.21 p. 376 (line 22176, `(r,s)↦r⁻¹s` Borel), Thm D.23 p. 376 (line 22193: nonzero, left-invariant, σ-finite), Prop. D.28 p. 383, Lemmas D.37 p. 391, D.40 p. 393, D.42–D.44 p. 395.
  - Appendices F and I: Lemma F.20 p. 417, Thm F.21 p. 418, Prop. F.26 p. 419, Prop. F.33 p. 423, Prop. I.1 p. 479 (line 27398), Prop. I.21 p. 494.
- **`delaharpe2007`:**
  - Definition 9: line 323, p. 7. Its N≥1 and arbitrary F match; N=0 in the Lean statement is vacuous.
  - Corollary 12(i): line 367, p. 8. Free products with `(|Γ₁|−1)(|Γ₂|−1)≥2` give arbitrary-rank free groups as `ℤ∗F(ι∖{a})`.
  - Theorem 14: line 423, p. 10, with the `2√N` estimate at line 435.
  - The Dixmier remark: lines 860–866, p. 19.
- **`attal-fock`:** Def. 8.3 p. 7, Def. 8.4, Prop. 8.5 and Cor. 8.6 p. 8, Defs. 8.11–8.12 p. 12, Prop. 8.13 p. 13, Def. 8.19 p. 17, Def. 8.20 and Prop. 8.21 p. 18, (8.18) and Prop. 8.23 p. 19.
- **`sims-groupoids2017`:** Thm 4.1.5 (line 1128), Lemma 4.2.3 (line 1253), Prop. 4.2.6 (line 1309), Thm 4.2.7 (line 1324), Prop. 4.3.2 (line 1361), Thm 4.3.3 (line 1431, bijective exactly for strongly effective G), Thm 4.3.6 (line 1527), Prop. 4.3.7 (line 1539), Prop. 5.1.14 (line 1790).
- **Groupoid papers:**
  - `muhly-williams2008`: Thm 5.5 at line 1174, p. 20; Thm 7.8 at line 2410, p. 35.
  - `sims-williams2012`: Thm 13 at line 552, p. 10; Thm 17 at line 733, p. 12.
  - `takeishi2014`: Thm 5.4 at line 496, p. 11, for every locally compact Hausdorff étale G.
- **Other sources:**
  - `nielsen-petz2005`: inequality (1) at line 28, p. 1.
  - `arici-mesland2019`: Definition 2.1 at line 114 and extension (4) at line 122, both p. 3.
  - `araki1973`: Props. 4.1 (line 236), 4.3 (line 323), Cor. 4.4 (line 385), Props. 4.5 (line 419), 4.6 (line 446), 4.8 (line 467) and 4.12 (line 578).

### Library declarations at the pins

- **Tau Ceti:** all 106 Tau Ceti names in the README elaborate with `#check @`, in a scratch file importing Mathlib and the 70 built Tau Ceti modules that define them. That covers actions, the convolution algebra, covariant pairs, the full crossed product, real dynamics, KMS and ground states, quantum spin, matrix entropy, `PiTensorProduct.reindexRepresentation`, `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.equivOfCoboundary` and `TauCeti.circleEquivPontryaginDualInt`. Two needed a second import:
  - `TauCeti.Amenable.of_commGroup` (`GroupTheory/Amenable/Abelian.lean` line 47; it needs only `CommGroup`, `TopologicalSpace` and `IsTopologicalGroup`);
  - `TauCeti.CStarAction.descend` (`Analysis/CStarAlgebra/Action/Quotient.lean` line 92; it needs a surjective `f` with invariant kernel).
- **Mathlib:** the 48 Mathlib names cited also elaborate. Among them:
  - `MeasureTheory.Measure.AddMonoidHom.continuous_of_measurable` (`MeasureTheory/Measure/Haar/NormedSpace.lean` line 79): a locally compact seminormed additive group into a real normed space, as the README says. It does not cover `U(H)_s`.
  - `CharacterModule.exists_character_apply_ne_zero_of_ne_zero`, `MeasureTheory.Measure.ext_of_charFun`, `ProbabilityTheory.charFun_gaussianReal`, `Real.fourier_eq'`, `PositiveLinearMap.gnsStarAlgHom`, `Units.oneSub`, `MonoidHom.isOpenMap_of_sigmaCompact` and `MeasureTheory.Measure.div_mem_nhds_one_of_haar_pos`.
- **Duplication:** a search of the Tau Ceti declaration index and Mathlib for strong subadditivity, Cuntz families, Powers groups, Mackey topologies, automatic continuity into non-normed groups, extreme KMS states, Takai and uniform Roe algebras finds none. `scratch/library-matches.md` has no candidate that states any of the 23 declarations.

### Cross-roadmap citations, resolved on main (f8836c4)

- **CStarAlgebras:** C1.3 (line 305), C1.4 (380), C1.6 (435), C1.7 (468), C2.1–C2.4 (544–643), C2.AnnHull, C5.1–C5.2 (1112, 1143), C5.4 (1203), C6.1–C6.2 (1272, 1297), C6.5 (1414), C7.1 (1455), C8.4 (1676). C1.7 states the unique strictly continuous unital extension `M(A)→M(B)` exactly as consumed.
- **HilbertModules:** H1 (34), H2 (115), H3 (65).
- **VonNeumannAlgebras:**
  - V1, V2 with `commIsometry`/`assocIsometry` (627–628), V4.0.Fields, V4.0.Decomposition, V8, V10.ModularTheory (2364);
  - V10.KMS (2459): the strip `F(t)=φ(α_t(x)y)`, `F(t+i)=φ(yα_t(x))`, matching D7's substitution `z↦−βz+iβ`;
  - V11.UnitizationCharacters and V11.FourierUniqueness (250–251), in the positive-character convention (line 3154).
- **BanachAlgebras:** A7.CharactersAndUniqueness (1739), `χ_γ(f)=∫fγ dμ` "with no conjugation" (1742).
- **SelfAdjointSpectralTheory:** SA-A21, SA-B14, SA-B44, SA-B50, SA-B59, SA-B67, SA-B79 (592) and SA-B85 (676).
- **Others:** LieGroupoidsPoisson G0.0 (22), FreeProbability F3 (56), AmenableGroups Layers 5 and 7 (73–74), RepresentationTheory/CompactGroups and SpinRepresentations, `Completed/OneParameterSemigroups`.
- `scratch/citations.md` lists nothing unresolved.

### Ownership and overlaps

- **`O_n`:** OperatorKTheory (its README lines 46 and 251), CStarClassification (lines 51–57: its K7 owns the K-groups, D6 owns "the universal models of `O_n`") and CategoricalOperatorAlgebras (line 56) all name D6 as the owner.
- **`C*(L,c)`:** OperatorKTheory (line 48) and HeisenbergImprimitivity §3.1 (its lines 503–508, "consumed, not rebuilt") name D1.CentralTwists and D2.CentralTwists as the owner. CompactQuantumMetricSpaces (its README lines 89–94) attributes ownership to HeisenbergImprimitivity §3.1, which in turn takes it from here. The chain ends at this roadmap, so it has a single owner here. The wording is that pull request's to tidy.
- **Fully qualified names:** `roadmaps grep` finds no other roadmap declaring `IsAnalyticBorelSpace`, `cuntz_isSimpleRing`, `mem_extremePoints_kmsStates_iff`, `twistedConvolution` or `vonNeumannEntropy_strong_subadditivity`, or using the namespace `TauCetiRoadmap.OperatorAlgebraDynamics`.
- **`scratch/overlaps.md`:** no dropped id and no id that only an open revision defines. Its one conflict, the pin bump #1187, is ordered in the description's generated block ("`OperatorAlgebraDynamics`: this pull request → #1187").

### Adversarial table

Rows 1–25 are the stated declarations; rows 26–28 are the seeded sample; rows 29–40 are conventions and Checks recomputed in the README.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ counting, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−\|n\|)a`; uncountable discrete G with counting measure | `T=π(a)+π(b)U_1`; `‖f‖₁=‖a‖(1+2Σ_(n≥1)2^(−n))=3‖a‖`; finite-measure sets are finite, hence compact, and integrable f has countable support | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` | G trivial, A=ℂ², `L(x,y)=x`; L=0 on H=ℂ; A=0 | P=(L,1); for L=0 the span of the vectors `L(x)ξ` is 0, not dense in ℂ, so `hL` excludes it; for A=0 only H=0 is nondegenerate | holds | none |
| 3 | `fullCrossedProductMap_exact` | G trivial; A=ℂ², trivial action, I=ℂ⊕0; I=A | `0→I→A→A/I→0`; the kernel of the second projection is the first summand; I=A forces B=0 and makes the first map onto | holds | none |
| 4 | `CentralCocycle` | (r,s,t)=(s,s⁻¹,s); ℤ/2 on M₂, `ω(a,a)=diag(1,−1)` | `α̃_s(ω(s⁻¹,s))ω(s,e)=ω(s,s⁻¹)ω(e,s)`, the README's inverse identity; at (a,a,a) both sides are `diag(1,−1)` so the cocycle law holds, but `diag(1,−1)E₁₂=E₁₂≠−E₁₂=E₁₂diag(1,−1)`, so only `central` fails | discriminating | none |
| 5 | `CentralCovariantPair` | associativity of `U_rU_sU_t` | `(U_rU_s)U_t=π̃(ω(r,s)ω(rs,t))U_rst`; `U_r(U_sU_t)=π̃(α̃_r(ω(s,t))ω(r,st))U_rst`; these are equal exactly by the `cocycle` field on left actions | consistent | none |
| 6 | `twistedConvolution` | `T_fT_g`; (ℤ/2)², `ω=(−1)^(ba′)`, u=(1,0), v=(0,1) | `π(f(r))U_rπ(g(t))U_t=π(f(r)α_r(g(t))ω(r,t))U_rt`; t=r⁻¹s gives the right multiplier `ω(r,r⁻¹s)` (`.snd`); `δ_u*δ_v=ω(u,v)δ_(u+v)=δ_(u+v)`, while `ω(r⁻¹s,r)` gives `−δ_(u+v)` | pins the argument order | none |
| 7 | `centralIntegrated_twistedConvolution` | ℤ/2, `ω(a,a)=−1`, H=ℂ; `U_a=i` and `U_a=1` | `T_(δ_a*δ_a)=−1=i²`; `U_a=1` gives 1≠−1 and fails the `projective` field (1·1≠−1·1), so it is not a `CentralCovariantPair` | holds; uses ω | none |
| 8 | `continuous_of_measurable_monoidHom` | Hamel ℚ-linear map ℝ→ℝ; D.11 | discontinuous, hence not Borel; D.11's "separable metric groups, G Polish" (line 21995) are the Lean classes | holds | none |
| 9 | `IsAnalyticBorelSpace` | ℝ with its Borel sets; ℝ with the countable–cocountable σ-algebra | holds with X=ℝ, s=univ; the second fails: countably many countable or cocountable generators cannot separate two points outside the union of the countable ones, while a relative Borel structure of a Polish space is countably separated | discriminating | none |
| 10 | `existsUnique_groupTopology_of_isAnalyticBorelSpace` | ℝ with Lebesgue; φ swapping [0,1) and [1,2); counting measure on ℝ; μ=0 on `ℝ^ℕ` | usual topology; `U=φ((−½,½))=(−½,0)∪[1,3/2)` is τ′-open, `U−1=(−3/2,−1)∪[0,½)`, `φ(U−1)=(−3/2,−1)∪[1,3/2)` is not open, so τ′ is no group topology; counting measure is not σ-finite; an lcsc group topology on `ℝ^ℕ` would be homeomorphic to the product topology, which is not locally compact | holds; "group", σ-finite and μ≠0 all needed | none |
| 11 | `injective_integratedFull_regular_of_amenable` | ℤ, A=ℂ; F₂, `h=δ_a+δ_(a⁻¹)+δ_b+δ_(b⁻¹)`; ρ(z)=z⊕0 | `‖λ(f)‖=sup_𝕋\|f̂\|`; the trivial character gives 4, while `‖λ(h)‖=2√3<4`; a degenerate faithful ρ adds a zero summand and keeps the kernel | holds; amenability needed | none |
| 12 | `transitive_commutant_scalar` | general; trivial action on {p,q}; I empty | `value f j·T_ij=value f i·T_ij` gives `T_ij=0` for i≠j; transitivity makes the diagonal constant; under the trivial action `diag(1,0)` commutes and is not scalar; I empty gives lp=0, so any c | holds | none |
| 13 | `exists_powers_partition` | general f with \|p\|,\|q\|<L; F={b}, L=2; ℤ, F={1}, N=3; N=0 | `w f w⁻¹=a b^(L+p) g b^(q−L) a⁻¹` or `a b^k a⁻¹`, reduced, starting with a and ending with a⁻¹; `wbw⁻¹=aba⁻¹`; ℤ fails at N=3 by the density count; N=0 is vacuous | holds; a≠b needed | none |
| 14 | `generatedCStarAlgebra` | λ on F₂ without closure; bilateral shift | the augmentation ideal of ℂ[F₂] is proper; the shift generates C(𝕋) | discriminating | none |
| 15 | `reducedFreeGroup_isSimpleRing` | singleton basis; {a,b}; nonclosed ideals | C(𝕋) has the ideal of functions vanishing at 1; the closure of a proper ideal of a unital C*-algebra is proper (open invertibles), so closed-ideal simplicity gives `IsSimpleRing` | holds; a≠b needed | none |
| 16 | `reducedFreeGroup_trace_unique` | singleton basis; {a,b} | `ev_z(λ(b))=z≠0=τ(λ(b))`; `⟨δ_1,λ(g)δ_1⟩=δ_1(g⁻¹)=[g=1]`, linear in the second variable | holds | none |
| 17 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; S₃; involution | `f̂(1)=f₀+f₁`, `f̂(χ)=f₀−f₁`, `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `C*(S₃)=ℂ²⊕M₂` is not commutative; `(f*)^(χ)=∫conj(f(y))χ(y⁻¹)=conj(f̂(χ))` | holds | none |
| 18 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | G=ℤ; ν↦cν | the unitary of `C*(𝕋)` at z goes to `n↦zⁿ`; f with respect to cν is cf with respect to ν | holds | none |
| 19 | `lcaWeyl_classification` | ℤ/2; ℤ; ℤ/3 shift with `V_χ=diag(1,ω,ω²)`; E=0 | `U_aV_χU_a*=diag(−1,1)=−V_χ`; `U_sV_zU_s*=conj(z^s)V_z`; `U₁V_χU₁*=ω⁻¹V_χ` but `V_χU₁V_χ*=ωU₁`, so the phase is not symmetric; E=0 gives ι=∅ | holds | none |
| 20 | `cuntz_isSimpleRing` | n=1 bilateral shift; H=0; finite-dimensional H, n=2 | `U*U=UU*=1` and `C*(U)=C(𝕋)` is not simple; H=0 gives the zero ring, which is not simple; n orthogonal copies of H inside H are impossible | holds; `2≤n` and `Nontrivial H` needed | none |
| 21 | `mem_extremePoints_kmsStates_iff` (β≠0) | ℂ⊕ℂ, trivial dynamics; M₂, K=diag(0,1); rotation of C(S¹) | (½,½) has `π_ω(A)''=ℂ²`, so it is neither extreme nor a factor state; the Gibbs state is the unique KMS state, a factor state (`M₂⊗1`) but not pure; for the rotation `K_β=∅` while `ev_z` is a factor state, so `hω` is needed | holds | none |
| 22 | `mem_extremePoints_kmsStates_iff` (β=0) | traces, central z | `K_0` is the tracial states (`isKMSState_zero_iff`); `ω̄(zπ(a)π(b))=ω̄(π(b)zπ(a))=ω̄(zπ(b)π(a))`, so the split states are tracial; `ω=0` is excluded by `norm_eq_one` | holds | none |
| 23 | `exists_residue_family` (sampled) | n=2; n=1; shift family | `⟨b_k,S_jb_m⟩=[k=nm+j]` gives the adjoint formula; `S₀*b₃=0`, `S₁*b₃=b₁`, `(S₀S₀*+S₁S₁*)b₃=S₁b₁=b₃`; n=1 gives `S₀=id`; `S_jb_k=b_(k+j)` gives `S₁*S₀=S₁*≠0` | holds | none |
| 24 | `vonNeumannEntropy_strong_subadditivity` | GHZ; 2·GHZ; `\|0⟩⟨0\|⊗Φ⁺`; ρ=0 | `0+log2≤2log2`; `S(2σ)=2S(σ)−2log2` gives `−2log2≤0`; `log2=log2`, and with `ρ_A` in place of `ρ_AB` it reads `log2≤0`, false; `0≤0` | holds; partial traces pinned | none |
| 25 | `CentralCocycle` continuity and `twistedConvolution` integrability | f, g ∈ C_c | `‖ω(q).snd‖≤1` plus pointwise strict continuity give joint continuity of `(q,a)↦ω(q).snd a`, so the integrand is continuous and compactly supported | integrable | none |
| 26 | Saddle flow (sampled) | (1,1), (−1,−1), (1,−2); `{x>0,\|xy\|<ε}` | orbits `{(u,1/u):u>0}`, `{(u,1/u):u<0}`, `{(u,−2/u):u>0}`; the set is saturated and open, misses 0, and meets the Q₁ and Q₄ branches with r<ε; the +x and +y neighbourhoods share Q₁ branches | holds; locator correct | none |
| 27 | D5.Fields (sampled) | N={0} below ½, {0,1} from ½; non-measurable S; S=[0,½] | `1_(x≥½)E₀₁` is a field; constant `E₁₀` sends `e₀` outside `span e₀` below ½; `1_Se₀` is not measurable; zero fibres give `L²(S)` | holds; locators correct | none |
| 28 | Concrete Cuntz families (sampled) | basis change W | `WS_jW*` is the residue family of `b′=Wb` | holds | none |
| 29 | D1 convolution direction | ℤ/3 shift on ℂ³ | `(f*g)(2)=e₀α₁(e₂)=e₀`; the inverse convention gives `e₀e₁=0` | holds | none |
| 30 | `T_b` and `ψ_b` directions | ℤ/3, `b(1)=i`, `b(2)=1`; ℤ/2 | `U^b_sU^b_t=π̃(ω^b(s,t))U^b_st` and `T^(U^b)_f=T^U_(fb)`; `ω^b(1,2)=i`; `(iδ₁)δ₂=iδ₀`, reversed `−δ₀`; `(1,a)⁴=(1,e)`, `(i,a)²=(i·i·(−1),e)=(1,e)` | holds | none |
| 31 | Twisted involution and multiplier formulas | U_s* algebra; right action | `U_s*=U_(s⁻¹)π̃(ω(s,s⁻¹))*`, `s↦s⁻¹` with factor `Δ(s⁻¹)=c(s)` gives `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)`; `T_fU_t` with `r=st⁻¹` gives `c(t)f(st⁻¹)ω(st⁻¹,t)` | holds | none |
| 32 | Twisted regular family | `V_sV_t` | equals `Π̃(ω(s,t))V_st` via the cocycle at (s,t,t⁻¹s⁻¹r) and centrality; scalar case: `W_bV^(ω^b)_sW_b*=b(s)V^ω_s` | holds | none |
| 33 | D3 modular factor | star law of `⟨f,g⟩_(A⋊H)` | `⟨f,g⟩*(h)=Δ_H(h⁻¹)γ(h⁻¹)Δ_G(h)∫…`, so the law holds iff `γ²=Δ_G/Δ_H` | holds | none |
| 34 | D5 dictionaries | one-unit groupoid; transformation groupoid | `(Δ^½f)*(Δ^½g)=Δ^½(f*g)`; both stars give `Δ(s)^(−½)conj(f(s⁻¹))`; `(f*h)(s,x)=Δ(s)^½(F*G)(s)(sx)` | holds | none |
| 35 | D2 sequence algebras | `E_ij`; parity p; e | `E_ijδ_n=[n=j]δ_i`; `UpU*=1−p`, so there is no character; e is full since its ideal contains K and `q(e)=1`; `eUe=S` | holds | none |
| 36 | D6 strong effectiveness and full shift | ℤ on `ℤ⊔{+∞}`; `(0^m10^∞,·,0^∞)` | the isotropy interior is the units, the reduction to {+∞} is ℤ, and there are three invariant opens against the ideals indexed by closed subsets of 𝕋; in the subspace topology non-unit arrows converge to a unit, and `Z([0],1,0,X)` is not open | holds | none |
| 37 | KMS sign, modular group, perturbation | K=diag(0,1), a=E₁₂, b=E₂₁; P=−K | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; `ρ^(it)xρ^(−it)=τ_(−βt)(x)`; `F(t)=ω̄(τ̄_(−βt)(b)a)`, `F(t+i)=ω̄(aτ̄_(−βt)(b))`; `Ω^Q=e^(−β(K+P)/2)/√Z_K`, `u_t=diag(1,e^(iβt))`, `Ad(u_t)∘τ_(−βt)=id` | holds | none |
| 38 | CAR and permutations | f⊥g; σ=(1 2), τ=(2 3) on ℂ³; one-mode Bogoliubov | without √(n+1): `bb†g=‖f‖²g/2`; `U_σU_τe₁₂₃=e₃₁₂=U_(στ)e₁₂₃`, `V_(στ)e₁₂₃=e₂₃₁`; `uv=0` and `\|u\|²+\|v\|²=1` leave `λa` or `λa*` | holds | none |
| 39 | Weyl and Fock | Schrödinger on ℝ²; h=ℂ, f=1, g=i; ξ with `\|ξ\|²=c/(1+\|λ\|⁵)` | BCH gives `e^(isx)e^(t∂)=e^(−ist/2)e^(isx+t∂)`; `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`, `W_F(i)W_F(1)=e^(i/2)W_F(1+i)`; vacuum variance ½ and fourth moment ¾; c=1/2.138=0.4677, second moment 0.618, fourth moment infinite | holds | none |
| 40 | D9 values | Ising, λ=1, d=2; on-site h; d=1 | `M_λ=\|h\|+2\|J\|e^λ`, `M_(λ,2)=\|h\|+8\|J\|e^λ`, bound `(½)/(1+8e)=1/(2+16e)`; `p=log2coshβh`, `s−βe=p`; `p=−β`, `e=1`, `s=0` | holds | none |

## Not verifiable

The manifest records these as uncertified (paywalled), and I did not read them:

- **Cuntz 1977, §1.** It is behind the seeded "Concrete Cuntz families" target and `cuntz_isSimpleRing`. The relations, the residue family and the n=1 and H=0 controls are checked by computation (rows 20 and 23), not against the text.
- **Bratteli–Robinson 2:**
  - Theorem 5.3.30: checked on the instances of rows 21–22, with β=0 against Tau Ceti's `isKMSState_zero_iff`;
  - Theorem 5.2.8;
  - Theorem 5.4.4: its sign is checked in finite dimensions (row 37);
  - §§5.2.1, 5.2.4 and 5.2.5;
  - Theorems 6.2.4, 6.2.18, 6.2.40 and 6.2.42;
  - Proposition 6.2.45: I could not check the constant `(λ/2)/(1+e^λd³/(d−1))` against the text, only its Ising evaluation (row 40).
- **Bratteli–Robinson 1, Renault 1980, Brown–Ozawa Proposition 5.1.3.**

Rudin's *Fourier Analysis on Groups* has no manifest entry. It is cited only for statements consumed from VonNeumannAlgebras V11.

Ownership against open pull requests was checked with `roadmaps grep` over the indexed heads and by reading the scope paragraphs of OperatorKTheory, CStarClassification, HeisenbergImprimitivity, CompactQuantumMetricSpaces and NoncommutativeGeometry. I did not open every sibling README.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at Example 3.32, p. 96 (lines 6184 and 6188): the source opens an instruction with "Given" and writes "The a basis"; it should read "Give A and the Qi the relative topology" and "A basis"; affects nothing.
- **Misprint** in williams-cpcsa-draft31 at Theorem D.23, p. 376 (lines 22194–22195): the source asserts a unique second-countable locally compact topology compatible with the Borel structure; it should assert uniqueness among such group topologies, since a non-homeomorphic Borel automorphism of ℝ transports the usual topology; affects nothing.
