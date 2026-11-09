# Review of QuantumGroups (pull request #1649 at cdeeada)

**Verdict:** needs changes

Incremental re-review of the 63 lines changed in `TauCetiRoadmap/QuantumGroups/` since `21777da`, the head the previous review read. The diff touches `README.md` in four places (the Scope paragraph, §8.4, §8.5, §8.6) and in `Suggested.lean` deletes the Layer 8 section and rewrites the docstring. No file outside the folder changed. The gate passes and nothing blocks. The previous R01 and R02 are repaired. Three P3 findings remain:

- the previous R03 (#1705) is carried as R01;
- two problems come from wording the repair adopted, R02 and R03. In both cases this was the previous review's own suggested wording, and this report corrects it.

## R01 (P3) — Two open revisions of this folder with no stated order; the description describes an earlier head

**Location:** the pull request description (`scratch/pull-request.md`, data) and the folder as a whole.

**Claim:** when two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which. A description also reflects the head under review.

**Witness:** `roadmaps list` shows `#1705 QuantumGroups @kim-em 0d7cbcc` open beside `#1649 … cdeeada`. The overlap listing reports that they conflict in `README.md` and `Suggested.lean`. #1705's `Suggested.lean` still declares what this head deletes as native: `[StarCompatibleHopf (A := A)]` (`:110`), `def quantumInteger` (`:221`) and `theorem quantumSL2_locallyFinite_iff` (`:325`). The description still says "Current head `d7a6c540…`" and "No Lean elaboration was repeated because no Lean files change". Re-raised from the previous review's R03 (R04 and R07 before that). The reason is unchanged.

**Repair:** state in the description which of #1649 and #1705 is rebased on the other, or close one. Then rebase, so that a single head carries one Layer 8 and one `Suggested.lean`, without `StarCompatibleHopf`, `quantumInteger` or `quantumSL2_locallyFinite_iff`. Update the head line and the "unchanged / no Lean files change" sentences to match this head.

## R02 (P3) — The docstring calls the pentagon "the one Layer 8 statement not statable" and then names a second one

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:42`–`:46`. The text reads: "The Biedenharn–Elliott pentagon of §8.5 is the one Layer 8 statement not statable: it needs … only for triple products; the compact comparison of §8.6 additionally needs analytic SUq(2)."

**Claim:** the module docstring names every headline that is not statable at the pins and what it lacks, and it does not contradict itself or the README.

**Witness:** the same sentence says §8.6's compact comparison also lacks a carrier (analytic SUq(2)). The README's Scope (`README.md:63`–`:65`) lists four Layer 8 items that "remain targets": the pentagon, the pivotal structure, the §8.6 comparison and the §8.7 comparison. So "the one" is false within this sentence. This head introduced the phrase, following the previous review's suggested wording.

**Repair:** at `:42`–`:46` write "The Biedenharn–Elliott pentagon of §8.5 is not statable: it needs channel coordinates on quadruple tensor products and recoupling maps between all five bracketings, which the pin's `TauCeti.UqSl2.clebschGordanRecouplingEquiv` supplies only for triple products. Nor is the compact comparison of §8.6, which needs analytic SUq(2)."

## R03 (P3) — "the `PivotalCategory` instance" names two different classes; only Tau Ceti's accepts `unitEvalNatIso`

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:1477`–`:1479`. The text reads: "is `TauCeti.FiniteHopfModuleCat.unitEvalNatIso` with `unitEvalNatIso_isMonoidal`. Bundle it as the `PivotalCategory` instance." The supplier row `:114` credits PivotalSpherical with the "pivotal … conventions consumed by … Q8.5". The `From Tau Ceti` paragraph (`:128`–`:155`) does not name a pivotal class.

**Claim:** a supplier declaration named in a target resolves to the declaration that the target can use. Native names are fully qualified, as the rest of §§8.4–8.6 now are.

**Witness:** two classes share the bare name:

- PivotalSpherical's `Suggested.lean` on main declares its own `TauCetiRoadmap.PivotalSpherical.PivotalCategory` (`:132`). Its `pivotalIso` lands in that roadmap's sorry'd `doubleRightDualFunctor` (`:85`), so `unitEvalNatIso` does not fit it.
- Tau Ceti at the pin has `TauCeti.PivotalCategory` (`CategoryTheory/Monoidal/Pivotal/Basic.lean:76`), whose `pivotalIso : 𝟭 C ≅ TauCeti.doubleRightDualFunctor C` does. A scratch `example` builds `TauCeti.PivotalCategory (FiniteHopfModuleCat k H)` under `letI := rigidCategory hS` from `unitEvalNatIso g hg` and `unitEvalNatIso_isMonoidal hg hg₁`. It elaborates with no error.

**Repair:** at `:1479` write "Bundle it as a `TauCeti.PivotalCategory` structure on `rigidCategory hS`." In the `From Tau Ceti` paragraph add "`TauCeti.PivotalCategory` and `TauCeti.doubleRightDualFunctor` (`CategoryTheory/Monoidal/Pivotal/Basic.lean`, `Rigid/DualFunctor.lean`) for §8.5's pivot". In supplier row `:114`, say that PivotalSpherical's conventions are compared with this native class.

## Previous findings

- R01 — repaired: `Suggested.lean` is 113 lines with 4 declarations; it has no Layer 8 section and no `UqSl2.TypeOne` import. `README.md:60`–`:62` reads "The local-finiteness characterization of §8.4 is `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`". The docstring wording this repair adopted is the new R02.
- R02 — repaired: `:1504` `TauCeti.UqSl2.LadderModule.signTensorEquiv`, `:1507` `TauCeti.UqSl2.LadderModule.contragredientEquiv`, `:1542` `TauCeti.UqSl2.LadderModule.invariantForm`; `:1477` "H-linear, natural in V and monoidal, is `…unitEvalNatIso` with `unitEvalNatIso_isMonoidal`". The bare `PivotalCategory` is the new R03.
- R03 — not repaired: #1705 (`0d7cbcc`) is still open and conflicts in both files. The description still says "Current head `d7a6c540…`" and names no order. Carried as R01.

## Verified sound

**Gate, build, scope.** I ran the gate on `cdeeada42f62b6d94b3307870869a7f9be729f94`. Every check is 0 (`depcheck`, `set_option`, `sorry-data`, `readme-ids-missing`, `statement-hygiene`, `stray-files`, `outside-folder`, `dropped` …) and the result is `OK`. The worker's gate on this head also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are untouched. The changed lines contain no process words, LaTeX or pull-request numbers.

**Dependency check** (unmodified output of the required command):

```text
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` edge, supplier row or cross-roadmap citation. Its only new citations are Tau Ceti declarations.

**Elaboration and signatures.** I ran `lake env lean` on a copy of `Suggested.lean` with `#check @name` for all 4 declarations. It exits 0 with exactly 2 `declaration uses sorry` warnings (`:79`, `:107`). The elaborated types are identical to `scratch/signatures.md` and unchanged since the previous review. The `[StarModule ℂ A]` that `AlgebraicHaar` drops is needed by no field, and both theorems carry it. Nothing changed relative to the README.

**Padding probe.** `first | rfl | simp | infer_instance | exact trivial` fails on `schur_orthogonality` (`:92`) and `compactType_iff` (`:111`) with "Type mismatch". The deleted statement `uqSl2_locallyFinite_iff`, re-stated in scratch, closes by `exact (…isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule q ⟨hq.1⟩ V _ _ _ _ hq).symm` with no error and no `sorry`. So deleting it was right.

**Headlines.** Statable and stated:

- weighted Schur orthogonality (§3.1);
- the compact-type characterization (§4.1).

Not statable, and named in the docstring:

- Layers 0–7 as before;
- the §8.5 pentagon and the §8.6 comparison (see R02).

§8.4's characterization is native and the docstring and README name it.

**Native declarations cited by the changed lines** (`#check` at Tau Ceti `2fd255d9`, after `lake build TauCeti.CategoryTheory.Monoidal.Pivotal.Basic`, 1431 jobs, cached):

| README | Pin | Elaborated type agrees |
| --- | --- | --- |
| `isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` (`:62`, `:1411`) | `QuantumGroups/UqSl2/TypeOne.lean:370` | `[Fact (q ≠ 0)]`, arbitrary `V : Type u`, `IsGenericQuantumParameter q → ((IsSignedTypeOne ∧ E-nilp ∧ F-nilp) ↔ IsLocallyFiniteModule)`: the §8.4 sentence and Layer 8's standing hypotheses (`:1244`–`:1247`) |
| `isTypeOne_and_forall_exists_pow_smul_eq_zero_iff_exists_linearEquiv_dfinsupp_ladderModule` (`:1404`) | `TypeOne.lean:359` | `(IsTypeOne ∧ E-nilp ∧ F-nilp) ↔ ∃ ι m, Nonempty (V ≃ₗ[UqSl2 q] Π₀ i, LadderModule q (m i) 1)` |
| `isTypeOne_and_isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule` (`:1405`) | `TypeOne.lean:349` | `(IsTypeOne ∧ IsLocallyFiniteModule) ↔` the same direct sum; with the previous row this gives the README's "and to local finiteness plus type 1" |
| `TauCeti.FiniteHopfModuleCat.unitEvalNatIso` (`:1478`) | `Algebra/Category/FiniteHopfModuleCat/Pivotal.lean:119` | `(g : Hˣ) (hg : ∀ a, S (S a) = g a g⁻¹) : 𝟭 ≅ doubleRightDualFunctor`; components `m ↦ (φ ↦ φ(g m))` (`dualEquiv_unitEvalIso_hom_apply`) = the README's `j_V(v)(φ)=φ(gv)` |
| `unitEvalNatIso_isMonoidal` (`:1478`) | `Pivotal.lean:221` | needs `IsGroupLikeElem k g`, which the README states at `:1472` |
| `TauCeti.UqSl2.LadderModule.signTensorEquiv`, `tensorSignEquiv` | `LadderModule/SignTensor.lean:121`, `:194` (namespace `:66`) | `L₀⁻ ⊗ L_m^ε ≃ L_m^(−ε)` and `L_m^ε ⊗ L₀⁻ ≃ L_m^(−ε)` |
| `TauCeti.UqSl2.LadderModule.contragredientEquiv` | `Dual/LadderModule.lean:135` (namespace `:33`) | `IsGenericQuantumParameter q → L_m^ε ≃ₗ[ℂ] Dual ℂ L_m^ε` |
| `TauCeti.UqSl2.LadderModule.invariantForm`, `invariantForm_pos`, `invariantForm_k_pos` | `LadderModule/InnerProduct.lean:78`, `:115`, `:265` (namespace `:41`) | form on `L_m^+` for `q : ℝ`; positivity needs `0 < q`, `q − q⁻¹ ≠ 0`, both implied by the README's `0<q<1` |

**Source spot-check for the changed §8.4.** `virelizier` lines 529–537 (p.11, §3.2) define type 1 as the direct sum of the `K`-eigenspaces for the eigenvalues `q^n`, `n ∈ ℤ`. This is the README's `IsTypeOne` sentence at `:1402`–`:1403`. The changed passages cite no other source, and none of the seeded sample targets (0.1, 0.2, 1.1, 1.2, 2.1–2.3, 3.1, 4.2, 6.2, 6.3, 7.2, 8.1, 8.3, 8.7) falls in them. Their locator checks are those of the previous report.

**Ownership and overlaps.** The diff claims no new object; it re-points to Tau Ceti. The overlap listing reports no dropped id in either direction. The §8.4 and §8.5 headings keep their numbers, so QuantumEnvelopingAlgebras ("Q8 item 1", `README.md:510`) and HopfologicalAlgebra ("Q8 item 5", `README.md:165`) on main still resolve. The closest open roadmaps (#888 CategoricalOperatorAlgebras, #867 TemperleyLiebOperatorAlgebras) are unchanged relative to this diff. The move-down recorded in the previous review stands. The one other open pull request on this folder is #1705 (R01).

**Remarks on untouched text (no change requested).**

- `README.md:1475` "Prove Ad(g) bijective and deduce S bijective from bijectivity of S∘S" is already `TauCeti.HopfAlgebra.antipode_bijective_of_antipode_antipode` (`Algebra/HopfAlgebra/InverseAntipode.lean:36`).
- `:1407`–`:1409` still sketch a proof of what is now cited as native.

**Adversarial table.** `q = 1/2` throughout. Rows marked "r12" carry forward the previous report's computed values for statements this diff leaves untouched. The other rows are computed for this head.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §8.4 signed characterization (native, `:62`, `:1411`; deleted Lean statement) | `L₀⁻`; Verma of highest weight `q`; zero module | `L₀⁻`: `K = −1 = −q⁰`, `E¹ = F¹ = 0`, cyclic span dimension 1: both sides true. Verma: weights `1/2, 2, 8, …`, `F^j v₀ ≠ 0` for all j: left side false; cyclic span infinite: right side false. Zero module: both true | pass; closes by one `exact` at the pin | Lean statement deleted (correct) |
| §8.4 type-1 pair (native, `:1404`–`:1405`) | `⊕_ℕ L₀⁺`; `L₀⁻`; `L₁⁺ ⊕ L₀⁻` | `⊕_ℕ L₀⁺`: `K = 1 = q⁰`, `E = F = 0`, `ι = ℕ`, `m ≡ 0`: all three true. `L₀⁻`: eigenvalue `−1 ∉ {2^(−k)}`: type 1 false, positive sum false. `L₁⁺ ⊕ L₀⁻`: locally finite true, type 1 false, so `false ∧ true = false ↔ false` | pass | none |
| §8.5 pivot `j_V(v)(φ) = φ(gv)`, `g = K⁻¹` | `L₁⁺`; `L₀⁻` | `K = diag(1/2, 2)`, `g = diag(2, 1/2)`: `j(v₀)(v₀*) = 2`, `j(v₁)(v₁*) = 1/2`. `S²(E) = K⁻¹EK = q⁻²E = 4E = gEg⁻¹` (pin `antipode_antipode`: `S²x = kInv·x·k`). `tr g = 5/2 = [2]_q`; on `L₀⁻`, `tr g = −1 = ε[1]` | pass | none |
| §8.5 monoidality needs group-like | `g' = 2K⁻¹` | `Ad(g') = Ad(K⁻¹)`, so `S² = Ad(g')`; `ε(g') = 2`, so `j_k(1)(φ) = 2φ(1) ≠ φ(1)`: unit coherence fails. With `g = K⁻¹`: `ε = 1` and `Δg = g⊗g`, so `j_(V⊗W)(v⊗w)(φ⊗ψ) = φ(gv)ψ(gw)` | pass: the README states `IsGroupLikeElem` (`:1472`) | none |
| §8.5 bundling into `PivotalCategory` | scratch `example` over a general Hopf algebra | `TauCeti.PivotalCategory` (`pivotalIso : 𝟭 ≅ TauCeti.doubleRightDualFunctor`) built from `unitEvalNatIso`: elaborates. The same-named class in PivotalSpherical lands in a different `doubleRightDualFunctor` | name ambiguous | R03 |
| §8.5 sign tensor, both orders | `L₀⁻ ⊗ L₁⁺`; `L₁⁺ ⊗ L₀⁻` | First: `ΔK` gives `diag(−1/2, −2)`; `ΔE = E⊗1 + K⊗E` acts as `−E`; `ΔF` acts as `F`. This is `L₁⁻` (`Ev₁ = −v₀`, `Fv₀ = v₁`) with no rescaling. Second: `E` acts as `E`, `F` as `−F`; `v_j ↦ (−1)^j v_j` gives `(−E, F)` = `L₁⁻` | pass ("with their basis rescalings") | none |
| §8.6 invariant metric | `m = 1`; `q = 1` | `h₁/h₀ = [1]/([1]q⁻¹) = q = 1/2`. At `q = 1`, `q − q⁻¹ = 0`, which `invariantForm_pos` excludes; the README's `0<q<1` excludes it too | pass | none |
| `Suggested.lean` docstring, Layer 8 bullet | count of not-statable Layer 8 items | the sentence names 2 (§8.5 pentagon, §8.6 comparison) yet calls the first "the one"; README `:63`–`:65` lists 4 remaining targets | inconsistent | R02 |
| 3.1 `schur_orthogonality` (headline; r12) | 1-dim character; SUq(2) `F̃ = diag(2, 1/2)` | `F̃ = 1`: `h(u*u) = 1`; `Tr F̃ = 5/2`, `h(a*a) = 1/5`, `h(c*c) = 4/5`, sum 1 | pass | none |
| 4.1 `compactType_iff` (headline; r12) | ℂ; ℂ[C₂]; zero ring | `h(z) = z`; `h(|a+bu|²) = |a|²+|b|²`; zero ring `h(1) = 0 ≠ 1`, and `[Nontrivial A]` is present | pass | none |
| 0.1 standard conjugates (r12) | ℂ², `(2R, R/2)`; `R = 2e₀⊗e₀+e₁⊗e₁` | norm product 2 = d (minimal, not standard); `5 · 5/4 = 25/4`, square root `5/2 > 2` | pass | none |
| 0.2 Temperley–Lieb comparison (r12) | δ = −2; d = 3/2 | `e² = −2e`; `[5] = −11/16 < 0` excludes d = 3/2 | pass | none |
| 1.1 classical multipliers (r12) | ℤ, `f = 1[0]` | `Δf = 1[m+n=0]` ∉ `C₀(ℤ²)`; `(id⊗ε)Δf = f` | pass | none |
| 1.2 cancellation and Haar (r12) | `{1, 0}` monoid; C₂ | span dimension 3 < 4; `h(1[e]) = 1/2` | pass | none |
| 2.1 corepresentations (r12) | C₂ sign | `(−1)(−1) = 1`, not the direct-sum `−2` | pass | none |
| 2.2 unitarization (r12) | `U = [[1,2],[0,−1]]` | `T = [[1,1],[1,3]]`, det 2, `U*TU = T` | pass | none |
| 2.3 regular corepresentation (r12) | C₂; S₃ | `1+1 = 2`; `1+1+4 = 6` | pass | none |
| 4.2 completions (r12) | ℤ; C₂ | pentagon on `(δ₁,δ₂,δ₃)` gives `(δ₁,δ₃,δ₆)` on both sides; `‖1+u‖ = 2` vs Haar 2-norm `√2` | pass | none |
| 6.2 filtered unions (r12) | H = 0, H = ℂ | degree-0 part ℂ; the square of the degree-1 vector leaves the degree-≤1 space | pass | none |
| 6.3 commutative reconstruction (r12) | absorbing monoid | `0·1 = 0·0`, `1 ≠ 0`: cancellation fails | pass | none |
| 7.2 free orthogonal fusion (r12) | n = 2, d = 5/2; n = 3 | intrinsic `1, 5/2, 21/4, 85/8`; `ε(χ) = 3 ∉ [−2,2]` | pass | none |
| 8.1 presentation/PBW (r12) | `[±2]`, `L₁⁺` | `[2] = 5/2`, `[−2] = −5/2`; `EF−FE = diag(1,−1)` | pass | none |
| 8.3 Casimir (r12) | `L₀⁺, L₁⁺, L₂⁺` | `10/9, 17/9, 65/18`; negatives on `L_m^-` | pass | none |
| 8.7 classical specialization (r12) | v = 1, m = 2 | `[E,F] = diag(2,0,−2)`; `[2]_v → 2` vs `0/0 = 0` | pass | none |

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008): recorded `uncertified` (paywalled), so it is cited by its locator. The changed passages do not cite it. As in the previous report, it was not read.
- Ownership against open pull requests: checked only against those whose files the brief lists, and against the overlap listing (#1705, R01).

## Source issues

- none
