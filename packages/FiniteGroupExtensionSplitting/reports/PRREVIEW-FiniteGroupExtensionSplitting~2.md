# Review of FiniteGroupExtensionSplitting (pull request #1774 at ed4e3aa)

**Verdict:** needs changes

Scope of this review: the roadmap folder `TauCetiRoadmap/FiniteGroupExtensionSplitting/` (README.md, Suggested.lean, metadata.toml) at ed4e3aa9. The pull request changes nothing outside this folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). No previous AI review. The worker's gate at this head fails on `imports`, `mathlib-subimports`, `no-import-mathlib` and `build` (the four build lines are lake's module advisory triggered by the four `Mathlib.<submodule>` imports). Depcheck: `depcheck: 205 roadmaps, 1644 edges, 0 problem(s)`, no UPWARD or CYCLE line; the roadmap is listed last in the merge order, after all of its suppliers (Mathlib and Tau Ceti only).

## R01 (P1) — S2 cites Tau Ceti declarations that do not exist at the pin

Location: README.md lines 72–74 ("native `NonabelianH1.Cocycle` and `GroupExtension.Splitting.cocycleEquiv` from `GroupExtension/NonabelianH1`") and line 20 (`GroupTheory/Transfer/Basic`).

Claim: the quotient-level comparison with a reference splitting consumes these from Tau Ceti.

Witness: the pinned Tau Ceti (lake-manifest rev 358314d4, identical in the content checkout) has `TauCeti/GroupTheory/GroupExtension/{Basic,Character,Cohomology,DihedralSixteen,FactorSetOfSection,ZModFour}.lean` and `Of/`; there is no `NonabelianH1.lean`, and `cocycleEquiv` and `NonabelianH1.Cocycle` occur nowhere in the pinned sources (the worker's citation check flagged `cocycleEquiv` too). `TauCeti/GroupTheory/Transfer/Basic.lean` does not exist either; the transfer-with-arbitrary-representatives, naturality and transitivity results live in `TauCeti/GroupTheory/Transfer.lean` (`MonoidHom.transfer_eq_prod_of_bijective`, `transfer_comp`, `transfer_transfer`, `TauCeti.transfer_eq_prod_lWord`). Both missing files exist only at Tau Ceti commit d7dad378 (30 October 2026), the commit every README link points at, which is 23 days newer than the pin.

Repair: cite only what exists at the pin, by declaration name and file (`TauCeti/GroupTheory/Transfer.lean`). For the quotient-level comparison, either state the splitting ↔ normalized-cocycle dictionary on the quotient extension (a splitting of `N → G → G ⧸ N` corresponds to a normalized crossed map `G ⧸ N → N` relative to a reference splitting, with the inversion formula the README mentions) as an owned S2 target with hypotheses and a locator, or drop the comparison; do not write it as supplied. Replace the commit-pinned GitHub links by declaration names in backticks (the house form), so that the pin, not a later commit, is what is cited.

## R02 (P2) — interface promises without exact statements

Location: README.md lines 95–99, 106–107, 135–137, 158–159, 172–175.

Claim: the prose promises transport, inverse and value lemmas, equivariance, a restriction formula and an internal form, none of which is stated with its hypotheses and conclusion.

Witness: "Prove transport under ambient group equivalences and between subgroups and their ambient images" (95–97) names no map and no statement; "All section-to-complement and complement-to-section maps must come with inverse and value lemmas" (98–99) names neither the maps nor the lemmas; "Supply equivariance under conjugation and restriction to intermediate subgroups" (106–107) does not say by which group one conjugates (an element of `G` moves `H`; an element of `H` fixes it) nor what restriction to `H' ≤ H` with `N ≤ H'` asserts; "Prove the resulting restriction formula for the extension class" (137) does not state the formula (which map `H²(G ⧸ N, N) → H²(H ⧸ N, N)`, through which identification of `H ⧸ (N.subgroupOf H)` with the image of `H`, and that it is Tau Ceti's `map (H.map (mk' N)).subtype (𝟙 _) 2`); "Also derive the internal form for `A ≤ normalizer W`" (158–159) gives no statement (ambient group, `A` a `q`-subgroup normalising the subgroup `W`, `N ≤ W` abelian normal `p`-subgroup normalised by `A`, conclusion `∃ D`, `IsComplement'` inside `W` and `a D a⁻¹ = D`).

Repair: write each as a target in a `### k.n` subsection: the statement with every hypothesis, its API bullets, three Checks and a `*Needs:*` line. Where a promised item has no precise content, cut it.

## R03 (P3) — the gate fails on the imports (no acceptance until repaired)

Location: Suggested.lean lines 1–4.

Claim: the file imports `Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree`, `Mathlib.GroupTheory.GroupExtension.Defs`, `Mathlib.GroupTheory.Complement`, `Mathlib.GroupTheory.Sylow`.

Witness: gate at ed4e3aa: `imports=1 mathlib-subimports=4 no-import-mathlib=1 build=4 FAIL`; the four build lines are the "consider adding `module`" advisory raised for each submodule import.

Repair: replace the four lines by the single line `import Mathlib` (no `TauCeti.*` module is used). The file elaborates unchanged otherwise (checked: `lake env lean` on the file at this head gives only the four `declaration uses 'sorry'` warnings).

## R04 (P3) — the README is not in roadmap form: no Checks, no locators, no supplier contracts

Location: README.md, whole file (186 lines).

Claim: the file is a design sketch, not a roadmap in the house shape.

Witness: there is no `**Summary.**` paragraph, no `## Scope and ownership`, no `## Exact supplier contracts`, no `## How to read the build`, no `## Layer k:` headings with `### k.n` subsections (layers are `### S0`–`### S3` under `## Milestones`), no `*Needs:*` line anywhere, no API bullet, no `**Checks.**` list (the string "Check" does not occur in the file), no `### Examples`/`### Dependencies` per layer, no `## Downstream consumers`. No target carries a locator: Gaschütz 1952 is cited (line 179) without theorem or page, Robinson (181) without theorem number, and the S3.2 invariant-complement theorem has no mathematical source at all (only Lean files, line 183–184). The grep for roadmaps on main shows the expected shape (for example `TauCetiRoadmap/SporadicOrders/README.md`).

Repair: rewrite in the house shape (README of the content repository, "Writing a roadmap"; CONTRIBUTING.md). Locators to use for the two headline results, verified in the paper's text: the coprime-index theorem is Gaschütz 1952, Satz 1, printed p. 99 (gaschutz1952 line 318: an intermediate extension `U` with `(G : U, |A|) = 1`; `G` splits over the abelian normal `A` iff `U` does), and the Sylow detection is the "2. Reduktionssatz", printed p. 100 (gaschutz1952 line 348). Every definition (local complement, crossed projection, the conjugation action, the quotient action of `G ⧸ N`, the normalized transfer) needs its API bullets and at least three Checks; the `C₄ × C₃`, `SL(2,3)` and `p = q` instances of the adversarial table below are ready-made negative controls.

## R05 (P3) — policy: pull-request number, process sentences, commit links

Location: README.md lines 38–39, 183–186; links on lines 20, 22, 32, 35, 45, 74.

Claim: the README cites a pull request by number and link, and carries process language.

Witness: line 38 "[LocalFiniteGroupTheory #1634](…/pull/1634)"; line 186 "Coordinate with their authors before adapting source code"; line 185 "They do not determine names or replace S0–S3's intrinsic specification". Library citations are GitHub links to commit d7dad378 rather than declaration names.

Repair: cite "LocalFiniteGroupTheory, L1 (Hall subgroups, Schur–Zassenhaus conjugacy) and L3 (coprime action, invariant Sylow subgroups)" by name only, under `## Scope and ownership`. Keep the Axiom files in a provenance paragraph of `## References` as prior formalisations, without instructions to the implementer. Replace commit links by backticked declaration names with the file at the pin.

## R06 (P3) — Suggested.lean form and README/Lean agreement

Location: Suggested.lean lines 6–12, 31, 37; README.md.

Claim: the module docstring is the old "suggested interfaces" boilerplate, two headline theorems have no docstring, there are no `/-! ## Layer k -/` comments, four of the five Lean names do not occur in the README, and the S2 comparison "iff between existence of a complement and vanishing of this class" (README 141–143) is neither stated nor named in the docstring as not statable.

Witness: grep of README.md for `conjugationAction`, `exists_complement_iff_crossedProjection`, `exists_isComplement'_iff_sylow`, `exists_invariant_complement`: 0 occurrences each (`exists_isComplement'_of_coprime_index`: 1). The comparison is statable at the pin for `G : Type` only (`TauCeti/GroupTheory/GroupExtension/Cohomology.lean` fixes `G M : Type`) and needs the quotient action of `G ⧸ N` on `N` as a definition; the docstring says nothing about it.

Repair: docstring "FiniteGroupExtensionSplitting: target signatures" saying the roadmap is README.md, that the file states the headline theorems against the pins, and which headline is not stated and why (the cohomological comparison, if left out: universe `Type` and the quotient action it needs); docstrings on `exists_isComplement'_of_coprime_index` (Gaschütz, Satz 1) and `exists_isComplement'_iff_sylow` (2. Reduktionssatz); name all five declarations in the README at the targets they state. The handwritten `CommGroup N` in `exists_complement_iff_crossedProjection` can be the library's scoped instance (`open scoped IsMulCommutative`, `Mathlib/Algebra/Group/IsCommutative.lean` line 107); not required.

## R07 (P3) — the additive conjugation module is not a pinned instance

Location: README.md line 70 ("Use the additive conjugation module `Additive N` for `cochainsCor1`").

Claim: `cochainsCor1` is applied to `M := Additive N` with the conjugation action.

Witness: `TauCeti.ContCohomology.cochainsCor1` needs `[AddCommGroup M] [DistribMulAction G M]` (`TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Basic.lean` lines 104–105, 256). The pinned Mathlib has no `DistribMulAction G (Additive M)` instance derived from `MulDistribMulAction G M`: `Mathlib/Algebra/Group/Action/TypeTags.lean` only provides `Additive.vadd`/`Additive.addAction` (the acting side), and `Rep.ofMulDistribMulAction` (`Mathlib/RepresentationTheory/Rep/Basic.lean` line 379) is a `Rep ℤ G`, not an instance.

Repair: make the instance an S2 definition target (`DistribMulAction G (Additive N)` from `conjugationAction`, with `smul_def` and agreement with `Rep.ofMulDistribMulAction`), with its Checks; nothing else changes.

## Verified sound

**Gate and build.** `lake env lean TauCetiRoadmap/FiniteGroupExtensionSplitting/Suggested.lean` at ed4e3aa: exit 0, four `declaration uses 'sorry'` warnings, nothing else. Elaborated signatures (worker's `#check @name` file, 5 declarations) compared with the README: `conjugationAction` drops the section `[Finite G]`, which its type does not need (not a defect); the four theorems keep `[Finite G]`/`[Finite A] [Finite W]`, `N.Normal`, `IsMulCommutative N`, as the README's conventions require. Generality agrees with the README (finite `G`, abelian normal `N`, `Nat.card`/`Subgroup.index`).

**Padding probe.** Each sorried theorem tried with `first | simp [*] | infer_instance | rfl` on a scratch copy: all four fail to close. None restates a definition, mirrors a Check or computes a value. `exists_complement_iff_crossedProjection` is the S1 dictionary rather than an end theorem, but it is the roadmap's central tool and not padding.

**Convention witness.** On the scratch copy, `((g • n : N) : G) = g * n * g⁻¹` under `conjugationAction N` closes by `rfl`, so the `•` in `IsMulCocycle₁` is left conjugation. Mathlib's `IsMulCocycle₁` is `f (g * h) = g • f h * f g` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` line 625) and `IsMulCoboundary₁` is `g • x / x` (line 677): README line 67 and the "principal crossed map of `a`" (118) agree.

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_isComplement'_of_coprime_index` (Gaschütz) | `N = ⊥` | `hcop`: `index.Coprime 1` holds; `D = ⊤` | true | none |
| same | `H = G`, any `K` with `N ⊓ K = ⊥`, `N ⊔ K = ⊤` | `N` normal ⇒ `N * K = N ⊔ K = G`, `IsComplement' N K` (`isComplement'_of_disjoint_and_mul_eq_univ`) | true | none |
| same | `G = S₃`, `N = A₃`, `H = G`, `K = ⟨(12)⟩` | index 1, coprime to 3; `D = ⟨(12)⟩` | true | none |
| same, negative control | `G = C₄ × C₃`, `N = C₂`, `H = C₄` | index 3 coprime to 2, but no `K` with `N ⊓ K = ⊥`, `N ⊔ K = C₄` (subgroups of `C₄`: `⊥, C₂, C₄`); conclusion false and hypothesis false | consistent; needed as a Check | R04 |
| same, `hcop` needed | `G = C₄`, `N = C₂`, `H = C₂`, `K = ⊥` | local complement exists, index 2 not coprime to 2, no complement of `C₂` in `C₄` | `hcop` cannot be dropped | none |
| same, `IsMulCommutative` | `N` nonabelian | the route breaks at the S1 dictionary (row below: `c (g h) ≠ (g • c h) · c g`) and `IsMulCocycle₁` needs `CommGroup N`; no separating instance sought | hypothesis in scope | none |
| `exists_isComplement'_iff_sylow` | `N = ⊥` | left: `D = ⊤`; right: `K = P` | both true | none |
| same | `V₄ ⊴ A₄`, `p = 2`, `P = V₄` | left: `D = ⟨(123)⟩`; right: `K = ⊥`, `N ⊔ ⊥ = V₄ = P` | both true | none |
| same | `Z = {±1} ⊴ SL(2,3)`, `p = 2`, `P = Q₈` | left: a complement would have order 12, `SL(2,3)` has none; right: order-4 subgroups of `Q₈` all contain `−1`, so no `K` | both false | none |
| same, direction → | general, `K := D ⊓ P` | `N ≤ P` (`IsPGroup.le_sylow_of_normal`), `x ∈ P` ⇒ `x = n d` with `d = n⁻¹ x ∈ D ⊓ P`, so `N ⊔ (D ⊓ P) = P`, `N ⊓ D ⊓ P = ⊥` | true | none |
| `exists_invariant_complement`, `hpq` needed | `p = q = 2`, `W = V₄ = ⟨x, y⟩`, `N = ⟨x⟩`, `A = C₂` acting by `x ↦ x`, `y ↦ xy` | `P = W`, `K = ⟨y⟩` local complement; the complements of `N` are `⟨y⟩, ⟨xy⟩`, swapped by `A`; no invariant complement | false without `p ≠ q`; hypothesis present | add as Check (R04) |
| same, no coprimality of `|A|`, `|W|` | `W = S₃`, `N = A₃` (`p = 3`), `A = C₂` acting by conjugation by `(12)` (`q = 2` divides 6) | `P = A₃`, `K = ⊥`; `D = ⟨(12)⟩` is `A`-stable | true; README 163 correct | none |
| same, `A` trivial | any | reduces to the ← direction of the Sylow iff | true | none |
| S3.2 proof route | `W ⋊ A` | `|W ⋊ A| = |W| q^k`: `p`-part unchanged, so `P` is Sylow; Gaschütz with `H = P` gives `D₀`, `[W ⋊ A : D₀] = |N| = p^j`, so a Sylow `q` of `D₀` is Sylow in `W ⋊ A`; conjugate `D₀` to `D₁ ⊇ inr A`; `D := D₁ ⊓ inl W`: `w = n d` ⇒ `d = n⁻¹ w ∈ D`, `a • d = inr a · d · (inr a)⁻¹ ∈ D₁ ⊓ W` | route sound | none |
| `exists_complement_iff_crossedProjection` → | `g = n d`, `c g := n` | `c (g h) = n₁ (d₁ n₂ d₁⁻¹) = c g · (g • c h)` (`N` abelian kills `n₁`) `= (g • c h) · c g` | Mathlib convention | none |
| same ← | `c` normalized cocycle | `c (c g⁻¹ · g) = c g⁻¹ · (c g⁻¹ • c g) = c g⁻¹ · c g = 1`; `ker c ∩ N = 1`; `c (x⁻¹) = x⁻¹ • c x⁻¹` so `ker` is a subgroup | true | none |
| same, `N` nonabelian | `g = n d` | `c (g h) = c g · (d₁ • c h) ≠ (g • c h) · c g` in general | `IsMulCommutative` in scope | none |
| `T n = n ^ [G : H]` (README 115–116) | `n ∈ N ≤ H`, `N ⊴ G` | `n⁻¹ • (g H) = g (g⁻¹ n⁻¹ g) H = g H`, so `lWord H t u n = t u⁻¹ n t u`; summand `t u • (t u⁻¹ n t u) = n`; product over `[G : H]` cosets | true; `TauCeti.lWord_of_mem_of_normal` needs `[H.Normal]`, so this is a new target, as written | none |
| kernels conjugate by `a` (README 117–118) | `c' = c · (g ↦ g • a / a)` | `c' (a d a⁻¹) = a (d • a⁻¹) · (d • a) a⁻¹ = 1` for `d ∈ ker c` | `ker c' = a (ker c) a⁻¹` | none |
| inverse exponent (121–122) | `e [G : H] ≡ 1 (mod |N|)` | exists iff coprime; `T^e` is a crossed map (`N` abelian); `T^e n = n^{e[G:H]} = n` | true | none |
| cohomological route (138–144) | class `x` of the quotient extension | `res_{H/N} x = 0` ⇒ `[G/N : H/N] • x = 0` (`index_nsmul_eq_zero_of_map_eq_zero`); `α^{|N|} = 1` pointwise ⇒ `|N| • x = 0` (`nsmul_cohomologyClass_eq_zero_iff`); `[G/N : H/N] = [G : H]` (`Subgroup.index_map_eq`, `f = mk' N` surjective, `ker = N ≤ H`); Bézout ⇒ `x = 0` ⇒ splitting (`nonempty_splitting_iff_cohomologyClass_eq_zero`) | route sound for `G : Type` | none |
| worked examples (167–175) | `S₃`, `A₄`, `SL(2,3)`, `C₄ × C₃` | `A₃ ⊴ S₃` complement `⟨(12)⟩` (`isComplement'_alternatingGroup_stabilizer_perm_fin_three`); `V₄ ⊴ A₄` complement `C₃`; `Z(SL(2,3))` no complement in `Q₈` nor in `SL(2,3)`; `C₂ ≤ C₄ ≤ C₄ × C₃` index 3, no local complement | all correct | none |

**Library declarations opened at the pins** (Tau Ceti 358314d4, Mathlib f6090c70): `TauCeti.ContCohomology.cochainsCor1` (Corestriction/Basic.lean 256, `U : Subgroup G`, `[U.FiniteIndex]`, `t : G ⧸ U → G` with `ht`, no topology, as README 25 says), `cochainsCor1_isCocycle₁` (309), `cochainsCor1_d0` (318), `cochainsCor1_changeTransversal` (366), `cochainsCor1_res` (385); `TauCeti.lWord` (TransversalWord.lean 71, `(t u)⁻¹ * γ * t (γ⁻¹ • u)`, matching README 113); `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` (GroupExtension/Cohomology.lean 319), `nsmul_cohomologyClass_eq_zero_iff` (157), `G M : Type` (line 100); `TauCeti.groupCohomology.map_subtype_id_comp_corestriction` (GroupCohomology/Corestriction.lean 153), `index_nsmul_eq_zero_of_map_eq_zero` (167); `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` (GroupCohomology/Sylow.lean 56); `factorSetToGroupExtensionEquiv` (FactorSetOfSection.lean 320), `InducesAction` (135); `TauCeti.isEmpty_splitting_zmodFourExtension` (ZModFour.lean 93); `isComplement'_alternatingGroup_stabilizer_perm_fin_three` (Perm/FinThree/Basic.lean 272); `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective` (Gaschutz.lean: generator lifting, a different theorem, as README 45–46 says). Mathlib: `IsMulCocycle₁` (LowDegree.lean 625), `IsMulCoboundary₁` (677), `Subgroup.IsComplement'` (Complement.lean 53), `IsComplement'.sup_eq_top` (636), `isComplement'_of_disjoint_and_mul_eq_univ` (666), `SemidirectProduct.mulEquivSubgroup` (SemidirectProduct.lean 238), `Subgroup.index_map_eq` (Index.lean 335), `IsPGroup.le_sylow_of_normal` (Sylow.lean 107), `Sylow.not_dvd_index` (491), `MulDistribMulAction.compHom` (Algebra/GroupWithZero/Action/End.lean 50), `Subgroup.exists_right_complement'_of_coprime` / `exists_left_complement'_of_coprime` (SchurZassenhaus.lean 297), `GroupExtension.Splitting` (GroupExtension/Defs.lean 270), `Rep.ofMulDistribMulAction` (Rep/Basic.lean 379).

**Duplication.** Gaschütz's splitting theorem, the Sylow detection and the invariant-complement theorem are in neither pinned library (grep "Gasch": only the generator-lifting lemma and its module analogue). `IsMulCocycle₁` is used in Mathlib only in LowDegree.lean and Hilbert90.lean; no complement ↔ normalized-cocycle statement exists in Mathlib's `GroupTheory` or in Tau Ceti's `GroupTheory/GroupExtension` at the pin. Schur–Zassenhaus is cited from Mathlib, not restated.

**Ownership against open work.** LocalFiniteGroupTheory (pull request of another author, read via `roadmaps show`) owns Hall subgroups, Schur–Zassenhaus conjugacy (L1), coprime action and invariant Sylow subgroups under coprime action (L3); it does not plan Gaschütz splitting or invariant complements, and this roadmap's S3.2 assumes no coprimality of `|A|` and `|W|`, so the objects differ. FiniteGroupInvariants cites Schur–Zassenhaus from Mathlib only. OddOrderTheorem (open pull request by the same author) cites this roadmap, S0–S3, as the owner of the Gaschütz complement criterion: a consumer, not a cycle (it is not in the merge order yet). Roadmaps on main under `GroupTheory` (CFSGStatement, CFSGBasicProperties, SporadicOrders, ChevalleyGroups, FreeGroupsAndLimitGroups, ProfiniteCohomology) do not state these theorems. Ownership against open pull requests whose files the brief does not give was checked through `roadmaps grep` only.

**Sources.** The README flags no locator as unverified and has no numbered targets, so the seeded sample was taken as the roadmap's four theorem statements and every library citation (counts above). Gaschütz 1952 was read at GDZ (`gaschutz1952`, OCR of an image-only scan, article id LOG_0011 of Crelle 190): Satz 1 (line 318, printed p. 99) is the coprime-index splitting theorem in both of Hall's senses (`zerfällt` and `zerspaltet`), with the remark (line 338) that the converse direction needs no coprimality; the 2. Reduktionssatz (line 348, printed p. 100) is the Sylow detection for an abelian normal `p`-group. Both support the README's statements as written.

## Not verifiable

- Robinson, *A Course in the Theory of Groups*, 2nd ed. (README 181): Springer, paywalled; the README gives no theorem number, so there is nothing to check at a locator. Cite by theorem number as `uncertified` or drop it in favour of Gaschütz 1952.
- The two Axiom CFSG Lean files (README 183–184) are formalisations, not mathematical sources; not read.
- Gaschütz 1952 pages 1–8 and 10–16 beyond Satz 1 and the 2. Reduktionssatz were not read in full (OCR of an image-only scan; 15 of 16 pages have no text layer).

## Source issues

- none
