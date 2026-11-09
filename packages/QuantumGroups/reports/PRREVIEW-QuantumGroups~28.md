# Review of QuantumGroups (pull request #1705 at 96014ab)

**Verdict:** needs changes

This is a full review of the same head that the previous review (`~25`) read: the change set since `96014ab` is empty and nothing outside the folder changed. Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

**Findings at a glance:**

- R01–R03 are the previous review's three findings, carried. None of them can be repaired by editing the folder:
  - R01 needs `origin/main` merged into the branch.
  - R02 and R03 need the pull request's description changed.
- R04–R06 are new. Each is a folder edit. The sibling revision #1649 (`50d79b7`) already contains the replacement text for R04 and R05, and for the first slip of R06.

## R01 (P2) — 140 of the README's 143 Tau Ceti names do not exist at the branch's pins

Re-raised: H01 of the repair report on `96014ab`. The report is right that a folder edit cannot repair this. The finding still stands, because the pull request as it is would merge a `Suggested.lean` whose docstring is false at main's pin, and it would lack a headline that becomes statable there. The repair is a merge that the worker can make.

**Location:**

- `lake-manifest.json` pins Tau Ceti `358314d4`, Mathlib `f6090c70` and `v4.35.0-rc3`. Main pins `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`.
- In the README: the `From Tau Ceti` contract (`:155`–`:192`), §§3.1 and 4.1, and all of Layer 8 (`:1361`–`:1789`).
- In `TauCetiRoadmap/QuantumGroups/Suggested.lean`:
  - `:24`: "the defining field `comul_star` of Tau Ceti's `TauCeti.StarCoalgebra ℂ A`".
  - `:26`–`:34`: "Proved in the pinned Tau Ceti … `TauCeti.UqSl2`".
  - `:66`–`:69`: `clebschGordanRecouplingEquiv`.
  - `:76`: "the pinned Tau Ceti has none of these modules".

**Claim:** every Tau Ceti declaration the folder cites exists at the pins, and the docstring's "not statable" list holds at those pins.

**Witness:**

- **Name scan.** A namespace- and section-aware scan of the 143 backticked `TauCeti.*` declarations finds:
  - all 143 at `2fd255d9`;
  - 3 at `358314d4`: `TauCeti.HopfAlgebra.antipode_antipode`, `TauCeti.Sl2Std` and `TauCeti.TemperleyLieb`.
- **Docstring.** `:26`–`:34` are false at the branch pin, where `QuantumGroups/UqSl2/` does not exist. `:76` is false at main's pin, where `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`, `Algebra/Category/FiniteHopfModuleCat/Pivotal.lean:119`/`:221` and `Rigid.lean:146` all exist.
- **CI.** The pull request's CI `build` check at this head is SUCCESS, and that check builds against main.

**Repair:**

1. The worker merges `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` reports no conflict, because the branch changes neither `lake-manifest.json` nor `lean-toolchain`. Then re-run the gate with its build.
2. The §8.5 sphericity headline then becomes statable from real-bodied carriers. Put the pivotal structure in place:
   - rigid structure: `TauCeti.FiniteHopfModuleCat.rigidCategory (TauCeti.UqSl2.antipode_bijective q)`;
   - pivotal structure: `{ pivotalIso := TauCeti.FiniteHopfModuleCat.unitEvalNatIso (TauCeti.UqSl2.kUnit q)⁻¹ hg, pivotalIso_isMonoidal := TauCeti.FiniteHopfModuleCat.unitEvalNatIso_isMonoidal _ _ hg₁ }`, where `hg` comes from `TauCeti.UqSl2.antipode_antipode` (`S²x=K⁻¹xK`) and `hg₁` from `comul_kInv`/`counit_kInv`, with no `sorry` in the body.
3. State `theorem uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`, adding the `TauCeti.*` imports of those modules.
4. Delete `:70`–`:77`, list the theorem under "Stated here", and name it in §8.5.
5. Optionally replace `hΔ` by `[TauCeti.StarCoalgebra ℂ A]` (`Algebra/Coalgebra/Star.lean:46`, field `comul_star`), as `:22`–`:24` already describe.

## R02 (P2) — §§0.2–0.3 are also claimed by two open roadmaps, and #1649 still hands the unitary Temperley–Lieb category to one of them

Re-raised: H02 of the repair report on `96014ab`. The report is right on both counts: the README's allocation is the admissible one, and no folder edit can repair this. The finding stands because the double ownership is unchanged at all three heads. Nothing in the folder changes; the action is the description sentence below, and the two open roadmaps then follow it.

**Location:**

- `:33`–`:42`: "Section 0.2 is the single home of C*-categories … §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 … consume these objects from §§0.2–0.3".
- Also `:1796`–`:1802`.

**Claim:** these objects have a single owner.

**Witness:**

- CategoricalOperatorAlgebras (#888, now `91b6d830`), `README.md:40`–`:46`: "(CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Its `:2599` has the same.
- TemperleyLiebOperatorAlgebras (#867, `ba43cc7a`): `README.md:67` (the unitary Temperley–Lieb category, Layer 3) and `:76` ("Roadmaps that need these objects consume them from here").
- QuantumGroups (#1649, `50d79b7`), `README.md:50`–`:51`: it leaves "the unitary Temperley–Lieb category (TemperleyLiebOperatorAlgebras 1.3, 2.1 and Layer 3)" to TemperleyLiebOperatorAlgebras, against this head's §0.3.

**Why this head's allocation is the admissible one:**

- QuantumGroups is on main. Main's README cites CategoricalOperatorAlgebras CA1a and CA2a and TemperleyLiebOperatorAlgebras as suppliers, but neither is on main; they are merge-order lines 229 and 245.
- A roadmap on main never consumes an open roadmap, so the objects have to move down into QuantumGroups. The open roadmaps then cite them.

**Repair:** put the ownership paragraph of R03's replacement description into the description. The paragraph asks #888 (`:40`–`:46`, `:2599`) and #867 (`:67`, `:72`–`:76`) to cite QuantumGroups §§0.2–0.3. It also says that #1649's assignment at `:50`–`:51` does not prevail.

## R03 (P3) — The description describes a different head, and no order is stated against the conflicting #1649

Re-raised: H03 of the repair report on `96014ab`. The report's reason is that a folder repair cannot write the description. That is right, and the finding is not a folder defect: the worker or the author applies the text below.

**Location:**

- The title: "QuantumGroups: construct the ribbon category RepUqg".
- In the description: "Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first" and "Only the roadmap README changes".

**Claim:** the description matches the head, and the conflicting revision of the folder has a stated order.

**Witness:**

- The head has no `Q9`, `RepUqg` or braiding, and it changes `Suggested.lean`.
- `git merge-tree --write-tree --name-only HEAD 50d79b72` (#1649) reports CONFLICT in `README.md` and `Suggested.lean`.
- #1649's description, which still names head `d7a6c540`, states no order either.

**Repair:** replace the title with "QuantumGroups: Layer 0 foundations, house shape, and Layer 8 on Tau Ceti's U_q(sl₂)" and the description with:

> Rewrites the QuantumGroups roadmap in house shape. Layer 0 (§§0.1–0.3) owns the free-module coaction legs, C*-categories with standard conjugates, intrinsic dimension, the balanced unitary dual functor and signed self-dualities, and the unitary Temperley–Lieb category; main's README took these from CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras, which are not on main. Layers 1–7 keep the compact quantum-group programme, with §1.1's locally compact function-algebra diagrams. Layer 8 consumes Tau Ceti's U_q(sl₂) and keeps as targets the Biedenharn–Elliott pentagon, the pivotal and spherical structure, the representation ring and the SUq(2) comparison. Suggested.lean states four headlines: schur_orthogonality, compactType_iff, haar_modular_automorphism and haar_trace_iff_antipode_involutive. No prerequisites.
>
> Ownership: §§0.2–0.3 are the single home of these objects. CategoricalOperatorAlgebras (#888, CA1a–CA2a) and TemperleyLiebOperatorAlgebras (#867, 1.2–1.3, 2.1 and Layer 3) cite QuantumGroups §§0.2–0.3 instead of building them, and #1649's assignment of the unitary Temperley–Lieb category to TemperleyLiebOperatorAlgebras does not prevail.
>
> Order: this pull request and #1649 both revise QuantumGroups and conflict in README.md and Suggested.lean; [#1649 rebases onto this one after it merges | this pull request is closed in favour of #1649].
>
> Pins: the branch's lake-manifest.json predates main's (Tau Ceti 358314d4, main 2fd255d9); Layer 8 cites Tau Ceti at main's pin, and the CI build of the merge passes.

Keep one alternative in the Order sentence.

## R04 (P3) — §8.3 asks to derive two corollaries that the pins already provide

**Location:**

- `:1517`–`:1519`: "Derive … that K acts diagonalizably on every finite-dimensional module with eigenvalues ±q^k, that every short exact sequence of finite-dimensional modules splits".
- Scope `:74`–`:76`: "the Layer 8 statements Tau Ceti does not prove: … the corollaries of finite complete reducibility listed in §8.3".

**Claim:** these are statements the pins do not prove.

**Witness** (main's Tau Ceti `2fd255d9`):

- **Diagonalizability.** `QuantumGroups/UqSl2/TypeOne.lean:184` defines `IsSignedTypeOne` as "`K` acts diagonalizably with all eigenvalues signed integral powers `± q ^ n`". It is the first conjunct of `:370`'s `isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`, which applies to every finite-dimensional module through the instance `RingTheory/Finiteness/LocallyFinite.lean:79` `of_finite`.
- **Splitting.** It is Mathlib's `IsSemisimpleModule.extension_property`/`lifting_property` (`RingTheory/SimpleModule/Basic.lean:255`, `:261`; `:254`, `:260` at the branch's Mathlib) applied to `UqSl2/CompleteReducibility.lean:300` `isSemisimpleModule_of_finiteDimensional`.

**Repair:** replace `:1517`–`:1521` with:

> At generic q, K acts diagonalizably on every finite-dimensional module with eigenvalues ±q^k, the finite-dimensional case of §8.4's `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` through the instance `TauCeti.IsLocallyFiniteModule.of_finite`, and short exact sequences of finite-dimensional modules split by Mathlib's `IsSemisimpleModule.extension_property` and `IsSemisimpleModule.lifting_property` applied to `TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional`. Derive the Hom formula dim Hom_U(V,W)=Σ_(m,ε) a_(m,ε) b_(m,ε) for V≅⊕(L_m^ε)^(a_(m,ε)) and W≅⊕(L_m^ε)^(b_(m,ε)), with End_U(V)≅Π_(m,ε) M_(a_(m,ε))(ℂ).

At `:75`, write "the Hom and endomorphism formulas of §8.3" for "the corollaries of finite complete reducibility listed in §8.3". #1649 (`50d79b7`) `README.md:1438`–`:1446` makes the same change.

## R05 (P3) — §6.3 uses §4.2 and §4.3, but its *Needs:* line omits them

**Location:**

- `:1225`: "*Needs:* §§6.1–6.2; Mathlib `gelfandStarTransform` …".
- `:1195`: "Compare universal and reduced reconstructed compact quantum groups using Q4".
- `:1210`–`:1212`: "Compare this reconstruction with Q4's single classical-group completion theorem A_u=A_r=C(G)".

**Claim:** the *Needs:* line lists what the target's statement and route need.

**Witness:**

- A_u=A_r=C(G) is proved in §4.3 (`:988`–`:990`), and nothing in §§6.1–6.2's *Needs:* reaches §4.3.
- An implementer who follows `:1225` does not learn that §6.3 waits on §4.3.
- No cycle arises: the *Needs:* lines of §4.2 (`:959`) and §4.3 (`:1005`) do not cite Layer 6.

**Repair:** at `:1225`, write "*Needs:* §§6.1–6.2; §4.2 for the reconstructed universal and reduced completions and §4.3 for A_u=A_r=C(G); Mathlib …". This is #1649 (`50d79b7`) `README.md:1149`.

## R06 (P3) — Two citation slips: the Bédos–Murphy–Tuset pages in §5.1, and a Mathlib name in §0.2

**Location:**

- `:1054`: "Bédos–Murphy–Tuset §2, pp.12–14".
- `:328`: "Mathlib … `CategoryTheory.Karoubi`".

**Claim:** each cited text or declaration is where it is cited.

**Witness:**

- **Pages.** `bmt` lines 512–571 (p.12) finish Theorem 2.11's proof: the unitary `W` and the reduced coproduct. SUq(2), with `U=[[α,−qγ*],[γ,α*]]` and its monomial basis, starts on p.13 (`bmt` lines 586–605).
- **Name.** `#check @CategoryTheory.Karoubi` gives "Unknown identifier" at the branch pin. At both pins the structure is `CategoryTheory.Idempotents.Karoubi` (`CategoryTheory/Idempotents/Karoubi.lean:43`, inside `namespace CategoryTheory`, `namespace Idempotents`).

**Repair:**

- At `:1054`, write "Bédos–Murphy–Tuset §2, pp.13–14", as #1649 (`50d79b7`) `README.md:980` does.
- At `:328`, write `CategoryTheory.Idempotents.Karoubi`.

## Previous findings

- R01 (`~25`), branch pins: **not repaired**. It is the same head; the pins are still `358314d4`/`f6090c70`. Carried as R01.
- R02 (`~25`), §§0.2–0.3 double ownership: **not repaired**. The finding was raised against #888 at `3375f9e`; #888 is now at `91b6d830`, and `:40`–`:46` still read "single home here". #867 `ba43cc7a` `:67`, `:76` and #1649 `50d79b7` `:50`–`:51` are unchanged. Carried as R02.
- R03 (`~25`), the description: **not repaired**. The title still reads "construct the ribbon category RepUqg", checked by `gh pr view`. Carried as R03.
- R04 (`~23`), §8.7's Virelizier locator: repaired at `96014ab`. `:1781` now cites §4.1, p.13, and I re-read it against `virelizier` lines 638–642.

## Verified sound

**Head, gate, order.**

- **Head:** `96014abd`, clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- **Gate:** re-run on this head; every scanner is 0, ending `… outside-folder=0 source-material=0 OK`. The worker's gate records `build=0`.
- **Dependency check:** the required command prints the following, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
```

- **Merges:** `git merge-tree --write-tree HEAD origin/main` is clean. Against #1649 (`50d79b72`, merge base `c9940702`) both files conflict (R03).

**Elaboration, signatures, padding.**

- **Elaboration:** `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:121`, `:153`, `:164` and `:174`.
- **Signatures:** one scratch file with `#check @` for all six declarations gives the types of `scratch/signatures.md`. Each matches its README statement:
  - `[Nontrivial A]` on `compactType_iff`;
  - `StarModule ℂ A` on all four theorems;
  - `hΔ` explicit;
  - the `[StarModule ℂ A]` absent from `AlgebraicHaar` is used by none of its fields.
- **Padding:** on scratch copies, `first | rfl | infer_instance | trivial | simp | decide | aesop` fails on all four headlines (unsolved `mp`/`mpr` goals, "aesop made no progress"). There is no padding. `AlgebraicHaar` and `unitaryCoefficientSet` are the two definitions the headlines need, with real bodies.
- **Mathlib names:** of the README's 52 backticked non-`TauCeti` identifiers, all elaborate at the branch Mathlib except the following:
  - module paths (`Algebra.Coalgebra.Comodule`);
  - notation (`T_12`, `T_13`, `Q_n`, `R_n`);
  - names written without their `CategoryTheory.`/`TauCeti.` prefix (`MonoidalCategory`, `RigidCategory`, `Subcomodule`, `IsCompletelyReducible`, `Comodule.TensorProduct`, `Comodule.convolutionAction`, `Comodule.map_antipode_mul_coefficientMatrix`, each found at the branch Tau Ceti or Mathlib);
  - `RingHom.powersMulSemiringAction`, which is Tau Ceti `Algebra/OreExtension/SkewPolynomial.lean` at main's pin (R01);
  - `CategoryTheory.Karoubi` (R06).

**Conventions checked against the pinned library.**

- **Column convention:** Tau Ceti `Comodule/MatrixCoefficient/Matrix.lean:68`, `:109`, `:117`, `:173` (branch pin) give `δ(e_j)=Σ_i e_i⊗u_ij`, `Δ(u_ij)=Σ_k u_ik⊗u_kj` and `S(u)u=1`, as in the Conventions.
- **Tensor convention:** `Comodule/TensorProduct.lean:99` sends `(m⊗c)⊗(n⊗d)↦(m⊗n)⊗cd`, which is the `U_13V_23` convention.
- **Hopf structure of U_q(sl₂):** Tau Ceti `UqSl2/Hopf.lean:180`, `:184`, `:188`, `:212`, `:217` (main pin) give `ΔE=E⊗1+K⊗E`, `ΔF=F⊗K⁻¹+1⊗F`, `S(E)=−K⁻¹E` and `S(F)=−FK`, and `Antipode.lean:59` gives `S²x=K⁻¹xK`. All agree with §8.1, with `virelizier` lines 354–358 and with QuantumEnvelopingAlgebras' Q8 convention (main `README.md:88`).
- **Sphericity hypothesis:** `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` needs only `q−q⁻¹≠0`. The argument is `K−K⁻¹=(q−q⁻¹)(EF−FE)`, with φ commuting with E and F, so `tr(EFφ)=tr(FEφ)`. This holds at roots of unity too, so the §8.5 hypothesis is the right one.

**Library declarations opened** (file:line at the pin):

- **Tau Ceti, branch pin `358314d4`:** `Comodule/MatrixCoefficient/Matrix.lean:68,109,117,162,173`, `Comodule/TensorProduct.lean:99`, `Comodule/Convolution.lean:49`, `Comodule/Fixed.lean:57`, `Comodule/LinearlyReductive.lean:104`, `MatrixCoefficient/FromMatrix.lean:166`.
- **Tau Ceti, main pin `2fd255d9`:**
  - `CategoryTheory/Monoidal/Pivotal/Basic.lean:76,239`;
  - `Pivotal/Spherical.lean:69`;
  - `Algebra/Category/FiniteHopfModuleCat/Pivotal.lean:82,119,221`;
  - `FiniteHopfModuleCat/Rigid.lean:146`;
  - `QuantumGroups/UqSl2/Antipode.lean:59,73`;
  - `UqSl2/Hopf.lean:180,184,188,192,204,208,212,217`;
  - `UqSl2/TypeOne.lean:184,370`;
  - `UqSl2/CompleteReducibility.lean:300`;
  - `RingTheory/Finiteness/LocallyFinite.lean:79`;
  - `Algebra/Coalgebra/Star.lean:46`;
  - `Analysis/CStarAlgebra/Completion.lean`, a completion of a C*-seminormed ring; neither pin has a C*-envelope or minimal C*-tensor product, so the docstring's "not statable" list for Layers 1–7 holds.
- **Mathlib, both pins:** `RingTheory/SimpleModule/Basic.lean` `extension_property`/`lifting_property`, and `CategoryTheory/Idempotents/Karoubi.lean:43`.

**Cross-roadmap citations resolved on main (`3090489`), 35 in all:**

| Roadmap | Ids (line on main) |
| --- | --- |
| CStarAlgebras | C1.7 `:468`; C1.CommutativeMultiplierMorphisms `:497`; C5.1 `:1112` (units, flip, associativity, functoriality); C5.2 `:1143` (`C₀(X)⊗min A≅C₀(X,A)`, `C(X)⊗min C(Y)≅C(X×Y)`) |
| VonNeumannAlgebras | Layer 0 `:275`; Layer 1 `:392`; Layer 3 `:905`; V4.Core `:972`; V4.PositivePredual `:1059`; V4.Normality `:1124`; V10.ModularTheory `:2364`; V10.KMS `:2459`; Layer 11 `:2785`; V13b.SpatialNorm `:3744` |
| HilbertModules | H1 `:126`; H2 `:179`; H3 `:262` |
| Subfactors | §3.1 `:676`; §3.2 `:697` (`markovTrace_nonneg_iff` `:729`); §3.3 `:774` |
| TemperleyLieb | presentation theorem in Layer 4 `:554`; negligible ideal and Goodman–Wenzl in Layer 6 `:713`–`:725`; Layer 7 `:767` |
| PivotalSpherical | Layers 0–2 `:257`, `:283`, `:318`; Layer 7 `:477` |
| OperatorAlgebraDynamics | D1 `:148`; D2 `:221` |
| FreeProbability | F1 `:127`; F3 `:255`; F6 `:532` |
| AmenableGroups | Layers 1 `:98`, 5 `:289`, 7 `:415` |
| RepresentationTheory | CompactGroups `su2Irrep` `:400`; LieHighestWeight Layer 0 `:319` |
| Consumers | HopfologicalAlgebra `:40`, `:165`, `:319` (Q8 item 5 = §8.5); QuantumEnvelopingAlgebras `:19`, `:56`, `:88` (Q8) |

**Overlaps and dropped names.**

- **Open revisions keep the cited ids:** VonNeumannAlgebras (#1041, `44dcd322`) keeps V13b.SpatialNorm, V10.KMS and its QuantumGroups consumer line `:4971`. OperatorAlgebraDynamics (#1137, `3e67e695`) keeps D1 `:674` and D2 `:1401`. NoncompactQuantumSymmetry (#1015) does not mention QuantumGroups.
- **Dropped declarations:** the 27 `Suggested.lean` declarations of main dropped here are cited by no roadmap on main as `QuantumGroups.<name>`. HopfologicalAlgebra's mention of `FiniteHopfModuleCat` is a docstring with no import, and the README maps Q8 item 5 to `TauCeti.FiniteHopfModuleCat` (`:213`–`:215`, `:1582`).
- **Dropped README names:** the 6 backticked names dropped from main's README are Mathlib or Tau Ceti names, not ids of this roadmap.

**Seeded sample**, read in the cached texts (page = printed page):

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 0.1 | Kustermans–Vaes, Notations and conventions, p.840 | `kustermansvaes` lines 162–200 | Strict extension, `kustermansvaes` 174–178. Leg numbering, 193–200. Correct |
| 0.2 | Longo–Roberts §2 pp.4–5; Lemma 3.3 p.10; Thm 3.8 p.15; Thm 3.11 p.17; Appendix pp.48–49 | `longoroberts` lines 121–175, 389–398, 621–631, 681–699, 2000–2030 | Correct |
| 0.2 | NT Defs 2.2.10, 2.2.12; Prop 2.2.13; Thms 2.2.14, 2.2.16, 2.2.17 (pp.32–35); Thm 2.2.19, Rem 2.2.20(ii) (pp.36–37); §2.5 p.52; Def 2.7.1 p.70 | `nt` lines 1427–1454, 1458–1461, 1501–1512, 1571–1609, 1633–1663, 2426–2431, 3236–3241 | Correct. Def 2.7.1's remark gives `d≥1`; the equality case is derived in the README |
| 1.2, 2.1, 3.2, 3.3 | Timmermann | — | Uncertified (Not verifiable). Cross-checked against `nt` line 218 (Thm 1.2.1, Haar), 262 (representations are invertible), 659 (Thm 1.5.5), 941–963 (`f_0=ε`, `f̄_z=f_(−z̄)`, `f_z*f_w=f_(z+w)`, multiplicative), 1014–1048 (`S²=τ_(−i)`, Prop 1.7.7) |
| 4.1 | NT Thm 1.6.6 p.18; Thm 1.7.3 p.22; Prop 1.7.7 p.23 | `nt` lines 810–820, 965–978, 1036–1048 | Correct. `σ_(−i)(U)=ρUρ`, so θ(u)=FuF with ρ=F (the README's `F̃=Fᵗ`, ρ=F̃ᵗ) |
| 4.2 | Bédos–Murphy–Tuset §§2–3, Thm 3.6 | `bmt` lines 555–585 (pp.12–13), 672–700 (Lemma 3.1, p.15), 858–872 (pp.18–19) | Correct |
| 5.1 | Bédos–Murphy–Tuset §2, pp.12–14 | `bmt` lines 512–605 | p.12 is wrong (R06) |
| 6.2 | Malacarne Lemmas 1.2, 2.1, 2.2, 3.1, Thm 4.1, pp.2–6 | `malacarne` lines 52–60, 63–137, 170–183, 202, 235, 285 | Correct. `R=(ι⊗F)r=Σ F_ji e_i⊗e_j` (lines 171–172), and `U*=FᵗUᵗ(F⁻¹)ᵗ` is `u=FūF⁻¹` |
| 7.1 | Bédos–Murphy–Tuset Thm 2.12, Cor 2.13, pp.13–14 | `bmt` lines 614–646 | Correct (source misprint, Source issues) |
| 7.2 | Banica Prop 1, Lemma 1, Prop 2, Thm 1, pp.1–4 | `banica` lines 42–46, 54–57, 65, 67–75 | Correct for n≥2, which is the README's range (Source issues) |
| 8.1 | Virelizier §2.3, Prop 2.4, p.8 | `virelizier` lines 348–359 | Correct |
| 8.2 | Virelizier Ex 3.3 p.11; Prop 3.7, Cor 3.8 p.12 | `virelizier` lines 552–555, 585–594 | Correct |
| 8.4 | Virelizier §3.2 | `virelizier` lines 529–537 | Correct. Type 1 is a direct sum of the K-eigenspaces of eigenvalue qⁿ |

The README flags no locator as unverified.

**Adversarial table** (q=1/2 unless stated; `u=[[a,−qc*],[c,a*]]`, `F̃=F=diag(2,1/2)`):

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `schur_orthogonality`, first form | `a=u₁₁`, `c=u₂₁` | `h(a*a)=1/5=(F̃⁻¹)₁₁/TrF̃⁻¹=(1/2)/(5/2)`; `h(c*c)=4/5=2/(5/2)`; `h(a*c)=0=(F̃⁻¹)₁₂` | ok | none |
| `schur_orthogonality`, second form | `aa*`, `u₁₂u₁₂*` | `4/5=F̃₁₁/TrF̃`; `q²h(c*c)=1/5=F̃₂₂/TrF̃` | ok | none |
| `schur_orthogonality` vs NT 1.4.2 | ρ=F̃ᵗ | `(ρ⁻¹)_ki=(F̃⁻¹)_ik`; `ρ_lj=F̃_jl` | ok | none |
| `schur_orthogonality`, degenerate | A=ℂ, H=ℂ, u=1; zero ring | `F̃=t`, `t=1/t` forces 1, `h(1)=1`; no `AlgebraicHaar` (`h(1)=h(0)=0≠1`) | ok | none |
| `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x], x primitive | both true; `h((a+bu)*(a+bu))=|a|²+|b|²`; span ⊤ with no Haar (`[Nontrivial A]` excludes it); `(id⊗h)Δx=x+h(x)≠h(x)` and no unitary coefficient but 1: both false | ok | none |
| `compactType_iff`, other star | ℂ[ℤ] with u*=u | `h((u−u⁻¹)*(u−u⁻¹))=−2<0`, so no positive h; unitary group-likes only `u⁰`: both false | ok | none |
| `haar_modular_automorphism` | SU_(1/2)(2); ℂ[S₃] | `θ(a)=4a`: `h(aa*)=4/5=h(a*·4a)`; `θ(a*)=a*/4`: `h(a*a)=1/5=h(a·a*/4)`; θ=id | ok | none |
| modular, wrong model | θ⁻¹ | `h(a*·a/4)=1/20≠4/5` | excluded | none |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | trace and `S²=id`; `1/5≠4/5` and `S²c=c/4≠c` | ok | none |
| 0.1 legs | C₂ sign u; counit; flip | `U₁₂U₁₃=u⊗u=Δu`, both ι₂: `1≠u⊗u`; `‖1[s]‖=1`, `ε(1[s])=0`; `W(yc)=1⊗u=W(y)σ(c)`, `W(y)c=u⊗1` | ok | none |
| 0.1 isometry for injective φ | `‖T_φ(x⊗1)‖` | `=‖φ(⟨Tx,Tx⟩)‖^(1/2)=‖Tx‖`, and `‖x⊗_φ1‖=‖x‖` | ok | none |
| 0.2 C*-identity and standardness | `diag(2,1)`; ℂ² cups ×2, ×1/2 | `4=‖T‖²`, HS `√17≠5`; norms² 8 and 1/2, product 2, traces scale 4 and 1/4: not standard | ok | none |
| 0.2 d≥1, equality iff invertible | SU_(1/2)(2) fundamental; a character | `d=5/2`, `(5/2)²=1+21/4`; d=1 and `X⊗X̄≅1` | ok | none |
| 0.2 sign τ=−ε | SU(2), `R=e₁⊗e₂−e₂⊗e₁` | `(R*⊗ι)(ι⊗R)=−ι`, so `R̄=−R`, τ=1 and ε=−1 | ok | none |
| 0.2 J² | `J(z₁,z₂)=(−z̄₂,z̄₁)` | `J²=−I`; conjugation squares to I | ok | none |
| 1.2 Haar | C(C₂); monoid {1,0} | `h(1[e])=1/2≠ε(1[e])=1`; span of `Δ(A)(A⊗1)` lies in `{F(0,1)=F(0,0)}`, dim 3<4 | ok | none |
| 1.2 Fell absorption | Γ=ℤ | `W(δ₁⊗δ₂)=δ₁⊗δ₃`; `W(λ₁⊗1)W*: δ₁⊗δ₂↦δ₂⊗δ₃=(λ₁⊗λ₁)(δ₁⊗δ₂)` | ok | none |
| 2.1 coefficients | C₂ sign; S₃ permutation | `(−1)²=1` vs sum −2; `u₁₃(gh)=[(123)(3)=1]=1`, `u₁₃(hg)=[(132)(3)=1]=0` | ok | none |
| 2.2 unitarization | `U(s)=[[1,2],[0,−1]]` | `U*U=[[1,2],[2,5]]`, `T=[[1,1],[1,3]]`, det 2, `U*TU=T`; U=0 gives T=0 | ok | none |
| 3.2 characters | `f_z(a)`; Plancherel a+c; Vandermonde | `2^z`, `f₁*f₁(a)=(F²)₁₁=4=f₂(a)`; `1/2+2` over `5/2` =1; `det[[1,1],[1,4]]=3` | ok | none |
| 3.3 dual metrics | ū, `F̃ūF̃⁻¹`, `FuF⁻¹` | invariant `F̃`; `F̃⁻¹`: `F̃⁻¹ū*F̃ūF̃⁻¹=F̃⁻¹`; `F⁻²`: `F⁻¹u*u F⁻¹=F⁻²` | ok | none |
| 3.3 pivotal traces | F, `diag(1,0)` | `trF=trF⁻¹=5/2`; 2 vs 1/2 | ok | none |
| 3.4 modular and scaling | a; c | `σ_(−i)(a)=4a`; `τ_(−i)(c)=F₂₂cF₁₁⁻¹=c/4=S²c`; `σ_t(c)=c` | ok | none |
| 4.2 regular unitary | Γ=ℤ; ℂ; C₂ | `δ₁⊗δ₂↦δ₁⊗δ₃`, pentagon words both `(δ₁,δ₃,δ₆)`; `|2+i|=√5`; `‖1+u‖=2`, Haar square norm 2 | ok | none |
| 4.3 coamenability | ℤ; F₂ | Følner `2/(2N+1)`; `2√3<4` | ok | none |
| 5.1 relations iff unitary | general q | `u*u=1` iff `a*a+c*c=1`, `ac=qca`, `aa*+q²cc*=1`; `uu*=1` iff `aa*+q²c*c=1`, `ac*=qc*a`, `cc*+a*a=1`; together, the five relations | ok | none |
| 5.1 antipode, q=0 | `S(c)=u₁₂*=−qc`; q=0 | `S(c*)=−c*/q`; ū lower triangular with diagonal a*, a, and a* only an isometry: not invertible | ok | none |
| 5.2 cup | `F=[[0,1],[−2,0]]` | `FF̄=−2I`; `E=−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5`; `J(e₀)=−√2e₁` | ok | none |
| 6.2 counit on I_n | 1 ∈ B_n | `a∈I_n` gives `ε(a)=a(1)=0`; H=0 gives A=ℂ | ok | none |
| 6.3 needs (R05) | edges | text uses §4.3 (`:1211`); *Needs:* `:1225` omits it | incomplete | R05 |
| 7.1 Haar | `f(t)=t, t²`; q=±1 | `1/(1+q²)=4/5`, `(1−q²)/(1−q⁶)=16/21`; 1/2, 1/3 | ok | none |
| 7.1 q=−1 model | `a=√(1−t)zσ₃`, `c=√twσ₁` | `a*a+c*c=1`; `ac=−ca` (σ₃σ₁=−σ₁σ₃); at t=0, z=1 a=σ₃, c=0 | ok | none |
| 7.1 character | ξ_n | `⟨ξ₂,aξ₂⟩=√3/4`; `|ω(a)|=1` with `a*a≤1` gives `ω(c*c)=0` | ok | none |
| 7.2 normal form | `F=[[0,1],[−q⁻¹,0]]` | `FūF⁻¹=[[a,−qc*],[c,a*]]`; `c=−q⁻¹`, sign(q)=−sign(c); d: 1, 5/2, 21/4, 85/8; `β=25/4` | ok | none |
| 8.1 PBW and Ore | KF; q=i | `KF=q⁻²FK=4FK`; `δ_E(FK)=δ_E(q²KF)=K(K−K⁻¹)/(2i)`, `K⁴E=EK⁴` | ok | none |
| 8.2 ladders | L₂⁺; L₁⁻ | weights 1/4, 1, 4; `[E,F]=diag(5/2,0,−5/2)=[2−2j]`; `diag(−1,1)=(K−K⁻¹)/(−3/2)` | ok | none |
| 8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | `(5/2)(4/9)=10/9`, `17/9`, `65/18`; FE+toral `=17/9·I` | ok | none |
| 8.3 corollaries (R04) | finite-dimensional V | `IsSignedTypeOne` (TypeOne.lean:184) gives diagonalizable K; `extension_property` gives splitting | pinned | R04 |
| 8.4 type 1 | L₀⁻; Verma M(1) | K=−1 ∉ {qᵏ}; weights `4^j`, F not locally nilpotent | ok | none |
| 8.5 Clebsch–Gordan and Δ(E²) | m=n=j=1; r=2 | `α₁=−q=−1/2`, `ΔE(v₀⊗v₁−½v₁⊗v₀)=(q−½)v₀⊗v₀=0`; `(1+q²)EK⊗E=(5/4)EK⊗E` | ok | none |
| 8.5 sphericity (R01) | L₁⁺; q=±1, ℂ with K=2; q=i | `trK⁻¹=5/2=trK`; 1/2 vs 2 (hypothesis needed); `q−q⁻¹=2i≠0`, cyclicity argument | statement ok; absent | R01 |
| 8.6 metric and pairing | m=1 | `h₁=q=1/2`, `E*=2F=KF`; pairing `[E,F]=diag(1,−1)`, `KE=q²EK` | ok | none |
| 8.7 basis change | m=2, 3 | `F v₁=(5/2)v₂=[2]v₂`; `F v₂=21/4=[3]` | ok | none |
| 5.1, 0.2 citations (R06) | `bmt` p.12; `#check` | p.12 is reduced W; Karoubi name unknown | slips | R06 |

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008). The manifest records it as `uncertified`, cited by locator alone. Its locators in §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1 and 7.1 could not be read; the corresponding statements were cross-checked against `nt` (table above).
- **Elaboration at main's pins:** the Lean commands this review may run use the branch's pins. R01's sphericity statement and R04's witnesses were checked by reading the declarations at `2fd255d9`, not by elaborating them.
- **Descriptions of #888 and #867** were not read. Their README texts were read at `91b6d830` and `ba43cc7a`.
- **Ownership against open pull requests** was checked against the sibling checkouts the brief lists (#888, #867, #1649, #1041, #1137, #1015), `roadmaps grep` and the overlap listing. Other pull requests were not searched.

## Source issues

- **Misprint** in bmt at Theorem 2.12, proof, p.13: the source writes the Haar state as (1−q²) times the unweighted sum over n of ⟨φ(a)e_n0,e_n0⟩; it should weight the n-th term by q^(2n), since otherwise h(1) diverges; affects the proof.
- **Error** in banica at Theorem 1, p.2: the source states SU(2)-type fusion for every n∈ℕ; it should require n≥2, since for n=1 and F=1 the algebra A_o(F)=C*(ℤ/2) has only two irreducibles; affects a stated result.
