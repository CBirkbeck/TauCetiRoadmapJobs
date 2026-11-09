# Review of QuantumGroups (pull request #1649 at 79e1cb6)

**Verdict:** needs changes

Incremental re-review of the 64 lines changed in `TauCetiRoadmap/QuantumGroups/` since `cdeeada`, the head the previous review read. The diff touches `README.md` in five places (the PivotalSpherical supplier row, the `From Tau Ceti` paragraph, §0.1, §3.3, §8.5) and in `Suggested.lean` rewrites one docstring sentence. No file outside the folder changed. The gate passes, the dependency check reports no problem, and the Lean file elaborates with only its two `sorry` warnings. The previous R02 and R03 are repaired and the repairs introduced no new problem. One P3 remains, carried from the previous report.

## R01 (P3) — Two open revisions of this folder with no stated order; the description describes an earlier head

**Location:** the pull request description (`scratch/pull-request.md`, data) and the folder as a whole.

**Claim:** when two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which. A description also reflects the head under review.

**Witness:** `roadmaps list` shows `#1705 QuantumGroups @kim-em a9eaeef` open beside `#1649 … 79e1cb6`, and the overlap listing reports that they conflict in `README.md` and `Suggested.lean`. #1705's `README.md` at `a9eaeef` differs from this head's from its Summary on (its Scope paragraph is a different text at `:19`–`:47`, and it has 1851 lines against 1699 here); its `Suggested.lean` declares this head's four declarations plus `haar_modular_automorphism` (`:164`) and `haar_trace_iff_antipode_involutive` (`:174`). Of this head's new sentences, #1705 carries `antipode_bijective_of_antipode_antipode` and `TauCeti.PivotalCategory` but not the supplier-row sentence "Tau Ceti implements them as …" nor the trace identification "`TauCeti.rightTrace` sends f to tr_V(gf)". Neither description names the other pull request or an order: this one still says "Current head `d7a6c540…`", "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged" and "No Lean elaboration was repeated because no Lean files change"; #1705's says only that #1125 and #1124 merge first. Re-raised from the previous review's R01 (R03, R04 and R07 before that); the reason is unchanged.

**Repair:** state in the description which of #1649 and #1705 is rebased on the other, or close one (#1705 at `a9eaeef` already contains everything this head states, so closing #1649 or rebasing #1705's five changed passages onto it are the two consistent choices). Replace the head line and the "unchanged / no Lean files change" sentences with what this head does: Q1.ClassicalMultipliers, Layer 8 on native `TauCeti.UqSl2`, a `Suggested.lean` of four declarations.

## Previous findings

- R01 — not repaired: `#1705 … a9eaeef` is still open and conflicts in both files; the description still says "Current head `d7a6c540…`" and names no order. Carried as R01.
- R02 — repaired: `Suggested.lean:42`–`:46` now reads "The Biedenharn–Elliott pentagon of §8.5 is not statable: … Nor is the compact comparison of §8.6, which needs analytic SUq(2)." No "the one" remains; the docstring names both items the README's Scope leaves as targets and nothing else.
- R03 — repaired: `README.md:1489`–`:1492` "Bundle the two as a `TauCeti.PivotalCategory` structure on `TauCeti.FiniteHopfModuleCat k H` with the rigid structure `TauCeti.FiniteHopfModuleCat.rigidCategory hS`, whose right duals are `instRightRigidCategory`"; the `From Tau Ceti` paragraph (`:150`–`:156`) names `TauCeti.doubleRightDualFunctor`, `TauCeti.PivotalCategory`, `TauCeti.leftTrace`, `TauCeti.rightTrace` and `TauCeti.SphericalCategory` with their files; supplier row `:114` says Tau Ceti implements PivotalSpherical's Layers 0–2. Every one of these names is fully qualified and resolves at the pin (table below).

## Verified sound

**Gate, build, scope.** I ran the gate on `79e1cb6ea3fc2b34d8e89f73623b15dcaf82ce08`. With `--build` (the targeted build of `TauCetiRoadmap.QuantumGroups.Suggested`) every check is 0 (`set_option`, `sorry-data`, `readme-ids-missing`, `statement-hygiene`, `stray-files`, `outside-folder`, `dropped`, `depcheck`, `prnum`, `latex`, `build` …) and the result is `OK`, exit 0, agreeing with the worker's gate. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The changed lines contain no process words, LaTeX, pull-request numbers or machine paths.

**Dependency check** (unmodified output of the required command):

```text
depcheck: 236 roadmaps, 2308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` edge, supplier row or cross-roadmap citation; PivotalSpherical, the one roadmap it mentions, is on main and was already a supplier.

**Elaboration and signatures.** I ran `lake env lean` on a copy of `Suggested.lean` with `#check @name` for all 4 declarations: exit 0, exactly 2 `declaration uses sorry` warnings (`:79`, `:107`). The elaborated types are identical to `scratch/signatures.md` and to the previous review's. The `[StarModule ℂ A]` that `AlgebraicHaar` drops is used by no field; both theorems carry it. The statements are untouched by this diff.

**Padding probe.** `first | rfl | simp | infer_instance | exact trivial` fails with "Type mismatch" on `schur_orthogonality` (`:92`) and `compactType_iff` (`:111`). Nothing in the file is padding.

**Native declarations cited by the changed lines** (`#check` at Tau Ceti `2fd255d9`; object files present, nothing rebuilt):

| README | Pin (file and line) | Elaborated type agrees |
| --- | --- | --- |
| `TauCeti.doubleRightDualFunctor` (`:151`, `:1487`) | `CategoryTheory/Monoidal/Rigid/DualFunctor.lean:325` | `C ⥤ C` under `[RightRigidCategory C]`, `X ↦ Xᘁᘁ`, with `Functor.Monoidal` (`:330`) |
| `TauCeti.PivotalCategory` (`:153`, `:200`, `:679`, `:1490`) | `CategoryTheory/Monoidal/Pivotal/Basic.lean:76` | needs `[RigidCategory C]`; fields `pivotalIso : 𝟭 C ≅ doubleRightDualFunctor C` and `pivotalIso_isMonoidal : NatTrans.IsMonoidal pivotalIso.hom`: "a monoidal natural isomorphism from the identity to that functor" |
| `TauCeti.leftTrace`, `TauCeti.rightTrace` (`:155`, `:680`–`:681`, `:1524`–`:1525`) | `Pivotal/Trace.lean:79`, `:84` | `leftTrace f = η_ Xᘁ X ≫ Xᘁ ◁ f ≫ ε_ X Xᘁ` with the pivotal coevaluation; `rightTrace f = η_ X Xᘁ ≫ f ▷ Xᘁ ≫ ε_ Xᘁ X` with the pivotal evaluation (`:116`, `:123` unfold the pivot) |
| `TauCeti.SphericalCategory` (`:156`, `:200`, `:1528`) | `Pivotal/Spherical.lean:69` | `Prop`-class `leftTrace f = rightTrace f` for every endomorphism |
| `TauCeti.FiniteHopfModuleCat.instRightRigidCategory` (`:1474`, `:1492`, `:1526`) | `Algebra/Category/FiniteHopfModuleCat/RightRigid.lean:123` | instance; antipode-twisted contragredients |
| `TauCeti.FiniteHopfModuleCat.leftDual`, `rigidCategory` (`:1476`–`:1477`, `:1491`) | `FiniteHopfModuleCat/Rigid.lean:69`, `:146` | both take `hS : Function.Bijective (antipode k)`; `rigidCategory` has `toRightRigidCategory := instRightRigidCategory` (`:147`), so "whose right duals are `instRightRigidCategory`" is literally its definition |
| `TauCeti.HopfAlgebra.antipode_bijective_of_antipode_antipode` (`:1483`) | `Algebra/HopfAlgebra/InverseAntipode.lean:36` | `{g : Hˣ} (hg : ∀ a, S (S a) = g * a * g⁻¹) : Function.Bijective S` |
| `TauCeti.FiniteHopfModuleCat.unitEvalNatIso`, `unitEvalNatIso_isMonoidal` (`:1488`–`:1489`) | `FiniteHopfModuleCat/Pivotal.lean:119`, `:221` | `(g : Hˣ) (hg) : 𝟭 ≅ doubleRightDualFunctor _`; monoidality needs `IsGroupLikeElem k g`; components `m ↦ (φ ↦ φ(g • m))` (`dualEquiv_unitEvalIso_hom_apply`, `:100`) |
| `TauCeti.UqSl2.comul_kInv`, `counit_kInv` (`:1494`) | `QuantumGroups/UqSl2/Hopf.lean:192`, `:208` | `Δ(K⁻¹) = K⁻¹ ⊗ K⁻¹`, `ε(K⁻¹) = 1`: exactly the two fields of Mathlib's `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean:37`) |
| `TauCeti.UqSl2.antipode_antipode` (`:1495`) | `UqSl2/Antipode.lean:59` | `S (S x) = K⁻¹ * x * K`, i.e. `S² = Ad(K⁻¹)` with `g = K⁻¹`, `g⁻¹ = K` |
| `TauCeti.UqSl2.trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`:1527`) | `UqSl2/QuantumTrace.lean:41` | `q − q⁻¹ ≠ 0 → ∀ φ : V →ₗ[UqSl2 q] V, tr(K ∘ φ) = tr(K⁻¹ ∘ φ)`; the hypothesis is Layer 8's generic `q` |

**The §8.5 bundling, elaborated.** A scratch file (`lake env lean`, exit 0, no error) builds, for an arbitrary Hopf algebra with a unit `g` satisfying `S² = Ad(g)` and `IsGroupLikeElem k g`, a `TauCeti.PivotalCategory (TauCeti.FiniteHopfModuleCat k H)` under `letI := rigidCategory (antipode_bijective_of_antipode_antipode hg)` with `pivotalIso := unitEvalNatIso g hg` and `pivotalIso_isMonoidal := unitEvalNatIso_isMonoidal hg hg₁`; then at `U_q` with `g = (kUnit q)⁻¹`, `hg` from `antipode_antipode` by `simpa`, and `⟨counit_kInv q, comul_kInv q⟩ : IsGroupLikeElem ℂ (kInv q)`. So each sentence of `:1482`–`:1495` is what the pin provides, in the form it provides it.

**The trace identification (`:1524`–`:1526`, `:680`–`:681`), computed.** With `Xᘁ = V*` and the standard pairing `ε_ X Xᘁ : φ ⊗ v ↦ φ(v)`, `η_ X Xᘁ : 1 ↦ Σ v_i ⊗ v^i`, and `φ_X(v) = (ψ ↦ ψ(g v))`: `rightTrace_eq_pivotalIsoApp` gives `rightTrace f = Σ_i (φ_X(f v_i))(v^i) = Σ_i v^i(g f v_i) = tr(g ∘ f)`; `leftTrace_eq_pivotalIsoApp` gives `leftTrace f = Σ_i v^i(f (φ_X⁻¹(can v_i))) = Σ_i v^i(f g⁻¹ v_i) = tr(g⁻¹ ∘ f)`, since `φ_X(g⁻¹ v_i) = can(v_i)`. This is the README's assignment (right ↦ `tr(gf)`, left ↦ `tr(g⁻¹f)`), and for §3.3's pivot of matrix `F` the same computation gives `tr(Ff)` and `tr(F⁻¹f)`. The opposite assignment is excluded by the Check at `:1545`: on `L₁⁺` at `q = 1/2`, `g = K⁻¹ = diag(2, 1/2)` and both traces of the identity are `5/2`, so the identity does not separate them; the endomorphism `f = K` of `L₁⁺ ⊕ L₁⁺`-type objects does not either (it is not `U_q`-linear on a simple), which is why sphericity is a theorem (`trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`) rather than a check: for `U_q`-linear `f` the two traces agree, and for `g' = 2K⁻¹` (the plausible wrong pivot, `S² = Ad(g')` still) `tr(g'f) = 2 tr(gf) ≠ (1/2) tr(g⁻¹f)`, which the group-like hypothesis of `unitEvalNatIso_isMonoidal` excludes (`ε(g') = 2`).

**PivotalSpherical's Layers 0–2 on main** (`TauCetiRoadmap/PivotalSpherical/README.md:257`, `:283`, `:318`): Layer 0 is `doubleRightDualFunctor` with `Functor.Monoidal`, Layer 1 `PivotalCategory` with `pivotalIso : 𝟭 C ≅ doubleRightDualFunctor C` and `pivotalIso_isMonoidal` (`:286`), Layer 2 `leftTrace f = η_ Xᘁ X ≫ Xᘁ ◁ f ≫ ε_ X Xᘁ`, `rightTrace f = η_ X Xᘁ ≫ f ▷ Xᘁ ≫ ε_ Xᘁ X` (`:329`–`:330`) and `SphericalCategory`. These are, formula for formula, the Tau Ceti declarations at the pin, so the supplier row's "Tau Ceti implements them as …" (`:114`) and §0.1's "which are the native `TauCeti.PivotalCategory` and `TauCeti.SphericalCategory`" (`:199`–`:200`) are accurate. PivotalSpherical's own `Suggested.lean` still declares a same-named sorry'd class; the README no longer points at it.

**Ownership and overlaps.** The diff claims no new object; it re-points three passages to Tau Ceti. No roadmap on main or at the open heads listed owns the identification of `TauCeti.rightTrace`/`leftTrace` with `tr(gf)`/`tr(g⁻¹f)` on `FiniteHopfModuleCat` (grep of the pinned `QuantumGroups/` and `FiniteHopfModuleCat/` directories: no `leftTrace`/`rightTrace`), so §8.5 is its owner. The overlap listing reports no dropped id in either direction; the §§0.1, 3.3, 8.5 headings keep their numbers, so QuantumEnvelopingAlgebras ("Q8 item 1") and HopfologicalAlgebra ("Q8 item 5") on main still resolve. The closest open roadmaps (#888 CategoricalOperatorAlgebras, #867 TemperleyLiebOperatorAlgebras) are untouched by this diff. The one other open pull request on this folder is #1705 (R01).

**Seeded sample.** Of the sampled targets, only 0.1 and 8.5 contain changed lines, and those lines cite no source: §0.1's changed sentence names PivotalSpherical and two Tau Ceti classes, §8.5's name Tau Ceti declarations (table above). The Longo–Roberts, Neshveyev–Tuset and Virelizier locators of 0.1, 0.2, 3.1, 8.3, 8.5 and 8.7 stand as checked in the previous reports; the other sampled targets (1.1, 2.2, 3.4, 4.2, 4.3, 5.2, 6.1, 6.2, 7.1) are untouched.

**Remarks on untouched text (no change requested).**

- `:1483` "write hS for that proof": at `U_q` the pin already packages it as `TauCeti.UqSl2.antipode_bijective` (`UqSl2/Antipode.lean:73`), built from exactly `antipode_bijective_of_antipode_antipode (g := (kUnit q)⁻¹)`.
- `:1407`–`:1409` still sketch a proof of what §8.4 cites as native (noted in the previous report).

**Adversarial table.** `q = 1/2` throughout. Rows marked "r14" or "r12" carry forward the earlier reports' computed values for statements this diff leaves untouched; rows marked "computed here" are untouched sampled targets whose values I recomputed; the other rows are computed for this head's changed passages.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §8.5 `rightTrace f = tr(gf)`, `leftTrace f = tr(g⁻¹f)` (`:1524`–`:1526`) | `L₁⁺`, `f = id`; `L₀⁻`, `f = id`; `f = c·id` | `g = diag(2, 1/2)`: right `2 + 1/2 = 5/2`, left `1/2 + 2 = 5/2`; `L₀⁻`: `g = −1`, both `−1`; `c·id`: both `c·5/2`. Formula derivation from `rightTrace_eq_pivotalIsoApp`/`leftTrace_eq_pivotalIsoApp` above | pass | none |
| §8.5 sphericity at `g = K⁻¹` (`:1526`–`:1528`) | `U_q`-linear `f` on `L₁⁺ ⊕ L₁⁺` as a `2×2` scalar matrix `M`; wrong pivot `g' = 2K⁻¹` | `tr(gf) = tr(M)·5/2 = tr(g⁻¹f)`; with `g'`: `2·tr(M)·5/2` vs `(1/2)·tr(M)·5/2`, unequal for `tr M ≠ 0`; `ε(g') = 2 ≠ 1` fails `IsGroupLikeElem` | pass; pin needs `q − q⁻¹ ≠ 0`, which generic `q` gives (`q = 1/2`: `1/2 − 2 = −3/2`) | none |
| §8.5 `g = K⁻¹` group-like and `S² = Ad(K⁻¹)` (`:1493`–`:1495`) | scratch `example`s | `⟨counit_kInv, comul_kInv⟩ : IsGroupLikeElem ℂ (kInv q)` elaborates; `S²x = K⁻¹ x K = ↑(kUnit q)⁻¹ * x * ↑((kUnit q)⁻¹)⁻¹` by `simpa` | pass | none |
| §8.5 bundling into `TauCeti.PivotalCategory` on `rigidCategory hS` (`:1489`–`:1492`) | generic `(H, g)`; `U_q` | both scratch `example`s elaborate; `rigidCategory`'s `toRightRigidCategory` is `instRightRigidCategory` at `Rigid.lean:147` | pass | none (R03 repaired) |
| §3.3 traces `tr(Ff)`, `tr(F⁻¹f)` (`:680`–`:681`) | SUq(2) fundamental, `F = diag(2, 1/2)` | right `Tr F = 5/2`, left `Tr F⁻¹ = 5/2`, equal as `:684` states; `F̃ = F` on a diagonal `F` so the Check at `:659` (`1/5 + 4/5 = 1`) is unchanged | pass | none |
| §0.1 transport to `TauCeti.PivotalCategory`/`SphericalCategory` (`:199`–`:200`) | PivotalSpherical `:286`, `:329`–`:330` vs pin `Basic.lean:76`, `Trace.lean:79`, `:84` | the same `pivotalIso : 𝟭 ≅ doubleRightDualFunctor`, the same two trace formulas | pass | none |
| `Suggested.lean` docstring (`:42`–`:46`) | count of not-statable Layer 8 items named | 2 named (pentagon, §8.6 comparison), no "the one"; README Scope `:63`–`:65` lists the pentagon, the pivotal structure (now a README target consuming native classes), §8.6 and §8.7 comparisons | pass | none (R02 repaired) |
| §8.4 signed characterization (native; r14) | `L₀⁻`; Verma of highest weight `q`; zero module | both sides true; left false / right false; both true | pass | none |
| §8.4 type-1 pair (native; r14) | `⊕_ℕ L₀⁺`; `L₀⁻`; `L₁⁺ ⊕ L₀⁻` | all true; `−1 ∉ {2^(−k)}`; `false ∧ true ↔ false` | pass | none |
| §8.5 pivot `j_V(v)(φ) = φ(gv)` (r14) | `L₁⁺`; `L₀⁻` | `j(v₀)(v₀*) = 2`, `j(v₁)(v₁*) = 1/2`; `S²(E) = 4E = gEg⁻¹`; `tr g = 5/2 = [2]_q`; `L₀⁻`: `−1 = ε[1]` | pass | none |
| §8.5 sign tensor, both orders (r14) | `L₀⁻ ⊗ L₁⁺`; `L₁⁺ ⊗ L₀⁻` | `(−E, F)` = `L₁⁻` directly; `(E, −F)` = `L₁⁻` after `v_j ↦ (−1)^j v_j` | pass | none |
| §8.6 invariant metric (r14) | `m = 1`; `q = 1` | `h₁/h₀ = 1/2`; `q − q⁻¹ = 0` excluded by `0<q<1` | pass | none |
| 3.1 `schur_orthogonality` (headline; r12) | 1-dim character; SUq(2) `F̃ = diag(2, 1/2)` | `h(u*u) = 1`; `h(a*a) = 1/5`, `h(c*c) = 4/5`, sum 1 | pass | none |
| 4.1 `compactType_iff` (headline; r12) | ℂ; ℂ[C₂]; zero ring | `h(z) = z`; `|a|²+|b|²`; `h(1) = 0 ≠ 1`, `[Nontrivial A]` present | pass | none |
| 0.1 standard conjugates (r12) | ℂ², `(2R, R/2)` | norm product `2 = d`, not standard; `5·5/4 = 25/4 > 4` | pass | none |
| 0.2 Temperley–Lieb comparison (r12) | δ = −2; d = 3/2 | `e² = −2e`; `[5] = −11/16 < 0` | pass | none |
| 1.1 classical multipliers (r12) | ℤ, `f = 1[0]` | `Δf ∉ C₀(ℤ²)`; `(id⊗ε)Δf = f` | pass | none |
| 2.2 unitarization (r12) | `U = [[1,2],[0,−1]]` | `T = [[1,1],[1,3]]`, `U*TU = T` | pass | none |
| 3.4 Tomita comparison (untouched; computed here) | C₂ function algebra; SUq(2) coefficient `a`, `F = diag(2, 1/2)` | commutative core: Haar is a trace, `σ_t = id`; SUq(2): `σ_t(a) = 4^{it} a`, and at `t = −i` this is `4a = θ(a)`, the Check at `:661` | pass | none |
| 4.2 completions (r12) | ℤ; C₂ | pentagon on `(δ₁,δ₂,δ₃)`; `‖1+u‖ = 2` vs `√2` | pass | none |
| 4.3 coamenability (untouched; computed here) | ℤ; F₂ | `C*_r(ℤ) = C(𝕋)`, counit = evaluation at 1, bounded; `C*_r(F₂)`: `‖a+a*+b+b*‖ = 2√3 ≈ 3.46 < 4 = ε(a+a*+b+b*)`, so the counit is unbounded | pass | none |
| 5.2 free orthogonal (untouched; computed here) | n = 2, `F = 1`; `F = diag(2, 1/2)`-type | `F = 1`: `u = ū` unitary, the SU₋₁(2) relations (Banica); `F F̄ = 1` holds for both, `Tr F = 5/2 ≠ 2 = n` for the second so it is not Kac type | pass | none |
| 6.1 reconstruction (untouched; computed here) / 6.2–6.3 (r14) | Rep(C₂) with its forgetful functor; H = 0, H = ℂ; absorbing monoid | coefficient span of the two characters has dimension `1 + 1 = 2 = dim C(C₂)`; degree-0 part ℂ, square of the degree-1 vector leaves degree ≤ 1; `0·1 = 0·0` with `1 ≠ 0` | pass | none |
| 7.1 SUq(2) Haar (untouched; computed here) | `q = 1/2`, fundamental | `h(a*a) = q²/(1+q²) = 1/5`, `h(c*c) = 1/(1+q²) = 4/5`: the entries `F⁻¹_11/Tr F⁻¹`, `F⁻¹_22/Tr F⁻¹` of 3.1 with `F = diag(2, 1/2)` | pass | none |
| 8.3 Casimir (r12) | `L₀⁺, L₁⁺, L₂⁺` | `10/9, 17/9, 65/18`; negatives on `L_m^−` | pass | none |
| 8.7 classical specialization (r12) | v = 1, m = 2 | `[E,F] = diag(2,0,−2)`; `[2]_v → 2` vs `0/0 = 0` | pass | none |

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008): recorded `uncertified` (paywalled), cited by its locator; the changed passages do not cite it.
- Ownership against open pull requests: checked against the sibling checkouts the brief lists and the overlap listing (#1705, R01); other open pull requests were not searched.

## Source issues

- none
