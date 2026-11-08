# Review of McKaySkewGroup (pull request #223 at 109db10)

**Verdict:** needs changes

Incremental re-review of the 19 lines changed since `2592d6c` (the head the previous review read): one supplier-contract line of `README.md` and the import line plus two new instances of `Suggested.lean`. The gate fails at this head on the import, which is the one blocking finding; the four P3 findings of the previous report are unrepaired and are written again; one new P3 concerns the README's silence on the two new instance names. The changed passages were reviewed in full, the gate and the dependency check were rerun, and the Lean file was elaborated at the branch's pin on three probe copies.

## R01 (P1) — The imported module does not exist at the pinned Tau Ceti, so the build fails

**Location:** `TauCetiRoadmap/McKaySkewGroup/Suggested.lean:7` (`import TauCeti.RingTheory.Idempotents.Corner.Basic`); `README.md:217` (`TauCeti/RingTheory/Idempotents/Corner/Basic.lean`).

**Claim:** the commit adapts the folder to the Tau Ceti pin of `main` (`2fd255d9`, Mathlib `1b1ccf4b`), where the corner file was moved to `Corner/Basic.lean`; but the branch itself still pins Tau Ceti `a91d3aaf` (Mathlib `6b7abb3c`) in its `lake-manifest.json`, and at that pin the module is `TauCeti/RingTheory/Idempotents/Corner.lean` and `Corner/Basic.lean` does not exist. The gate reports `imports=1` and the targeted build exits with `bad import 'TauCeti.RingTheory.Idempotents.Corner.Basic'`.

**Witness:** gate at this head: `imports: line 7 … TauCeti module TauCeti.RingTheory.Idempotents.Corner.Basic does not exist at the pinned Tau Ceti`, `build=3 FAIL`; the branch's packages directory lists `Idempotents/Corner.lean` and no `Corner/` directory; at `2fd255d9` the listing is the reverse (`Corner/Basic.lean`, `Corner/Jacobson.lean`, no `Corner.lean`).

**Repair:** rebase the branch onto `main` so that its own `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, keeping the import as it is now; the two pins cannot both be satisfied by any edit inside the folder (reverting the import to `TauCeti.RingTheory.Idempotents.Corner` makes the gate pass at `a91d3aaf` but the merged result fails at `main`'s pin, where that file is gone). Checked for the rebase: every other imported module and every Tau Ceti and Mathlib name the file uses exists at `2fd255d9` / `1b1ccf4b` (table under Verified sound); and at the branch's pin, with the import repointed to the old module, the whole file elaborates with only `sorry` warnings (probe 1). No Tau Ceti object files exist in the bumped pin's package directory on this worker, so the targeted build at the bumped pin could not be run here; the worker reruns it after the rebase.

## R02 (P3) — The source manifest is still absent

**Location:** `TauCetiRoadmap/McKaySkewGroup/` (folder listing: `README.md`, `Suggested.lean`, `metadata.toml`); `README.md:2153` (`## References`).

**Claim:** sixteen works are cited and no `sources.toml` records their identity, access status or version (unchanged since the previous report's R01).

**Witness:** `ls TauCetiRoadmap/McKaySkewGroup/sources.toml` fails; the brief's manifest line reads "none recorded yet".

**Repair:** add `TauCetiRoadmap/McKaySkewGroup/sources.toml` (schema `tauceti-roadmap-sources/v1`), one key per work with locator scheme, locator and `cited_for`; arXiv and journal versions of FKS05, KV00, BKR01, Rei97, HK01, CBK22 as one entry each with a version note; CBH98, Spr77, CS03, Isaacs and the Conze paper as `uncertified`. No source text enters the repository.

## R03 (P3) — BKR01 does not cite Ito–Nakamura

**Location:** `README.md:1966–1967`: "which covers dimension two; the case of `SL₂(ℂ)` is due to Ito and Nakamura, cited there".

**Claim:** the attribution is not in the cited source (unchanged since the previous report's R02): BKR01 credits the dimension-two case to Gonzalez-Sprinberg–Verdier via Ito–Nakajima's observation and cites Nakamura alone only for abelian subgroups of `SL(3, ℂ)`.

**Witness:** `BKR01 line 62–66`; its reference list has `[12]` Ito–Nakajima and `[18]` Nakamura and no Ito–Nakamura entry.

**Repair:** cite Ito–Nakamura directly (Y. Ito and I. Nakamura, *McKay correspondence and Hilbert schemes*, Proc. Japan Acad. Ser. A 72 (1996), 135–138) as a References entry, or write "the case of `SL₂(ℂ)` is Gonzalez-Sprinberg–Verdier's construction, as BKR01 notes citing Ito–Nakajima".

## R04 (P3) — `TauCeti.SplitK0.of_mul_of` is in a different file

**Location:** `README.md:190–193` (supplier contract: "product rule `TauCeti.SplitK0.of_mul_of` … (`TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`, `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`)").

**Claim:** the product rule lives in neither listed file (unchanged since the previous report's R03).

**Witness:** at the branch's pin `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean:179` (`theorem of_mul_of`); at `main`'s pin `2fd255d9` the same file, line 132. `Split.lean` has only `def of` (line 124, resp. 138).

**Repair:** add `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean` to the parenthesis.

## R05 (P3) — A backticked model name that `Suggested.lean` does not declare

**Location:** `README.md:380–381`: "together with the trivial subgroup `cyclicSU2 1 := ⊥`".

**Claim:** a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; `cyclicSU2` is declared nowhere (unchanged since the previous report's R04).

**Witness:** `grep -n cyclicSU2 TauCetiRoadmap/McKaySkewGroup/Suggested.lean` is empty.

**Repair:** write it in prose ("together with the trivial subgroup, the cyclic model with `n = 1`").

## R06 (P3) — The two new instances are not named in the README

**Location:** `Suggested.lean:282–292` (`skewMonoidAlgebra_smulCommClass`, `skewMonoidAlgebra_isScalarTower`); `README.md:831–834` ("each commuting with scalars (`symmetricAlgebraAction_smulCommClass`, `exteriorAlgebraAction_smulCommClass`, `tensorAlgebraAction_smulCommClass`), so that Mathlib's `SkewMonoidAlgebra` over each of them is a `k`-algebra").

**Claim:** the README names the six earlier instances of the section but neither of the two added in this change, so "every Lean name appears in the README" fails for them; the README also does not say what they are for (the bumped corner instance `IsIdempotentElem.Corner.instAlgebra` now takes `[Module R A] [SMulCommClass R A A] [IsScalarTower R A A]` on a nonunital `A` instead of `[Algebra R A]`, and for the three skew algebras of this section instance search does not find the first two from Mathlib's `Algebra k (SkewMonoidAlgebra A G)` alone).

**Witness:** `grep -n 'skewMonoidAlgebra_smulCommClass\|skewMonoidAlgebra_isScalarTower' README.md` is empty; at `2fd255d9`, `TauCeti/RingTheory/Idempotents/Corner/Basic.lean:206–211` (the variables of `instAlgebra`); probe 2 below (the instances deleted: `failed to synthesize SMulCommClass k (SkewMonoidAlgebra (SymmetricAlgebra k ↑V.V) G) …` and the same for `ExteriorAlgebra`), probe 3 (present: clean).

**Repair:** extend the sentence at `README.md:831–834`: "… and the scalars of `k` commute with, and form a tower over, multiplication in each `A ⋊ Γ` (`skewMonoidAlgebra_smulCommClass`, `skewMonoidAlgebra_isScalarTower`), which is what the corner algebra instance `IsIdempotentElem.Corner.instAlgebra` consumes".

## Previous findings

- R01 (P3, no `sources.toml`) — not repaired: the folder still lists `README.md`, `Suggested.lean`, `metadata.toml` only. Written again as R02.
- R02 (P3, BKR01 and Ito–Nakamura) — not repaired: `README.md:1967` still reads "is due to Ito and Nakamura, cited there". Written again as R03.
- R03 (P3, `of_mul_of` file) — not repaired: `README.md:190–193` still lists `RepresentationRing/Basic.lean` and `Split.lean` only. Written again as R04.
- R04 (P3, `cyclicSU2`) — not repaired: `README.md:381` still has "`cyclicSU2 1 := ⊥`". Written again as R05.

## Verified sound

**Head, change set, gate, dependency check.** Head `109db10ca2cc82185fc47a8f81ddb393d899898b`, worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/McKaySkewGroup'` is empty (the branch does not touch `lake-manifest.json`; its pin is the merge base's). The change since `2592d6c` is exactly the diff in the brief: `README.md:217` (one path), `Suggested.lean:7` (the import) and `Suggested.lean:279–292` (two instances with docstrings). Rerun of the gate at this head: every text scanner `0`, `imports=1`, `FAIL` (R01); `outside-folder=0`, `readme-ids-missing=0`, `sorry-data=0`, `set_option=0`. Rerun of the dependency check:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**The two pins.** Branch `lake-manifest.json`: Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; `origin/main`: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. The worktree's `.lake/packages` resolves to the branch's pin (Mathlib reflog: checked out `6b7abb3c` on 2026-11-05 19:11, 8569 of 8569 Mathlib object files present, no concurrent build). The bumped pin's package directory holds Tau Ceti sources but no Tau Ceti object files, so nothing could be elaborated at `main`'s pin; its names were checked by reading the sources.

**Elaboration at the branch's pin (three probe copies, the import repointed to `TauCeti.RingTheory.Idempotents.Corner`).**

| Probe | Content | Result |
| --- | --- | --- |
| 1 | the head file plus `#check @name` for all 26 declarations and `#check @SkewMonoidAlgebra.instModule`, `#check @IsIdempotentElem.Corner.instAlgebra` | 9 `declaration uses 'sorry'` warnings, no other warning or error in the roadmap's lines, 9 s. `skewMonoidAlgebra_smulCommClass : ∀ {k G} [Field k] [Group G] {A} [Semiring A] [Algebra k A] [MulSemiringAction G A] [SMulCommClass G k A], SMulCommClass k (SkewMonoidAlgebra A G) (SkewMonoidAlgebra A G)`; `skewMonoidAlgebra_isScalarTower` the same binders with `IsScalarTower`. Both keep every section variable their types mention (`k`, `G`, `Field k`, `Group G`) and nothing else; nothing is lost to the section-variable rule. `SkewMonoidAlgebra.instModule` exists at the pin with `[Semiring S] [AddCommMonoid k] [Module S k] : Module S (SkewMonoidAlgebra k G)`, so the docstrings name a real declaration. The other 24 elaborated types are unchanged from the previous report. |
| 2 | the two instances deleted; `theorem needsNonunital {A} [NonUnitalSemiring A] {R} [CommSemiring R] [Module R A] [SMulCommClass R A A] [IsScalarTower R A A] : True` (the exact hypotheses of `instAlgebra` at `2fd255d9`, `Corner/Basic.lean:206–207`) applied to `SkewMonoidAlgebra (SymmetricAlgebra k V) G`, `(ExteriorAlgebra ℂ V)`, and the `CBHAlgebra` quotient | `failed to synthesize SMulCommClass k (SkewMonoidAlgebra (SymmetricAlgebra k ↑V.V) G) (…)` and the same for `ExteriorAlgebra ℂ ↑V.V`; the quotient carrier and the generic `A` with `[Algebra k A]` succeed. So at the bumped pin the headline statements `hf.Corner ≃ₐ[ℂ] …` of Layer 4 would not elaborate without the instances. |
| 3 | the head file, instances present, the same `needsNonunital` tests for the symmetric, exterior and tensor carriers, and `SMulCommClass … := Algebra.to_smulCommClass` as a term | exit 0, no error: the instances close the gap, and their bodies (`Algebra.to_smulCommClass`, `IsScalarTower.right`, both at the pin: `Mathlib/Algebra/Algebra/Basic.lean:430` and `Defs.lean:308`) type-check by unfolding Mathlib's `Algebra k (SkewMonoidAlgebra A G)` (`Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean:1237–1238`, needing `[MulSemiringAction G A] [SMulCommClass G k A]`, the hypotheses the instances carry). |

The two instances are therefore glue the headline statements need at the bumped pin, not padding: they restate no definition, mirror no Check and compute no value; the one-tactic probe (`inferInstance`) fails on their statements for the concrete carriers (probe 2). The padding probe of the previous report (each of the nine theorem bodies replaced by one tactic: none closed) is unaffected since no theorem changed.

**Names at `main`'s pin (`2fd255d9` / `1b1ccf4b`), read in the sources.**

| Name | At `2fd255d9` / `1b1ccf4b` |
| --- | --- |
| the nine `TauCeti.*` imports | all nine exist (`Simple/Basic`, `AffineDynkinType/Basic`, `/Deletion`, `GrothendieckGroup/Split`, `RepresentationRing/Basic`, `Idempotents/Corner/Basic`, `Preprojective/Basic`, `Zigzag/Orientation`, `Zigzag/Relations`) |
| `IsIdempotentElem.Corner.instAlgebra` | `Corner/Basic.lean:211`, variables `[NonUnitalSemiring A] [CommSemiring R] [Module R A] [SMulCommClass R A A] [IsScalarTower R A A]` (`:206–207`); at `a91d3aaf` `Corner.lean:162` with `[Semiring A] [Algebra R A]` |
| `IsIdempotentElem.cornerEquivalence` | `Morita/Corner.lean:391`, `(hfull : TwoSidedIdeal.span {e} = ⊤)` |
| `TauCeti.SimpleFDRepClasses`, `.mk` | `Simple/Basic.lean:188, 196` |
| `TauCeti.repRing`, `SplitK0.of`, `of_mul_of` | `RepresentationRing/Basic.lean:106`, `Split.lean:138`, `Monoidal/Basic.lean:132` |
| `AffineDynkinType.nodes, Valid, IsGraphical, graph, cartanMatrix, marks, affineNode, finiteType, bourbakiNode` | `Basic.lean:136, 156, 179, 228, 370, 502, 521`; `Deletion.lean:84, 131` |
| `TauCeti.pathAlgebra`, `doubledVertexIdempotent`, `preprojectiveRelator`, `preprojectiveAlgebra` | `PathAlgebra/Basic.lean:116`; `Preprojective/Basic.lean:118, 404, 688` (`pathAlgebra k (Symmetrify Q) ⧸ (preprojectiveIdeal k Q).asIdeal`, same shape as at the branch's pin) |
| `TauCeti.nonisolatedZigzagQuotient` | `Zigzag/Relations.lean:280` |
| `TauCeti.IsBasic` | `Semisimple/BasicAlgebra.lean:191` |
| Mathlib `IsIdempotentElem.Corner` | `RingTheory/Idempotents.lean:553` (`:552` at `6b7abb3c`) |
| `SkewMonoidAlgebra` (`single:236`, the `Algebra k (SkewMonoidAlgebra A G)` instance `:1237`, `isScalarTower_self:1153`, `instModule:795`) | `Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean`; the file differs between the pins only by an import order and one docstring parenthesis |
| `Algebra.to_smulCommClass`, `IsScalarTower.right`, `Algebra.compHom`, `MulAut.conj`, `QuaternionGroup`, `Representation.asAlgebraHom`, `leftRegular`, `FDRep.of`, `AlgEquiv.ofAlgHom`, `coe_toAlgHom_injective`, `TwoSidedIdeal.asIdeal`, `MonoidAlgebra.coeff` | `Algebra/Algebra/Basic.lean:430`, `Defs.lean:308, 344`, `Algebra/Group/End.lean:721`, `SpecificGroups/Quaternion.lean:51`, `RepresentationTheory/Basic.lean:119, 402`, `FDRep.lean:119`, `Algebra/Algebra/Equiv.lean:487, 199`, `TwoSidedIdeal/Operations.lean:324`, `MonoidAlgebra/Defs.lean:69` |

**The changed README line.** `README.md:216–218` now locates `IsIdempotentElem.Corner.instAlgebra` in `TauCeti/RingTheory/Idempotents/Corner/Basic.lean`, which is right at `main`'s pin and wrong at the branch's (R01 covers the mismatch; after the rebase the line is correct). The other two paths of the bullet (`Morita/Corner.lean`, `Semisimple/BasicAlgebra.lean`) are correct at both pins.

**Adversarial pass.** Rows A01–A47 of the previous report (`PRREVIEW-McKaySkewGroup~5`) concern statements the diff leaves untouched and are carried forward, each with its key values; A48–A51 are new.

| ID / statement | Instances and values | Result |
| --- | --- | --- |
| A01 §0.1 quaternion map (r5) | `!![I,0;0,−I]·!![0,1;−1,0] = !![0,I;I,0]` = image of `k`; icosahedral count `96 + 24 = 120`. | Retain. |
| A02 §0.2 pole equation (r5) | `(2,3,4)`: `23/12 = 2 − 2/24`; `(2,3,6)`: sum `2`, impossible. | Retain. |
| A03 `finite_subgroup_SL2_classification` (r5) | trivial `H` cyclic; `C₄₈`, `Q₄₈` both order `48`; `QuaternionGroup 1 ≅ C₄` excluded by `2 ≤ n`. | Retain. |
| A04 conjugacy theorems (r5) | cyclic: `diag(ζ^a, ζ^{−a})`, `a` a unit, same image; `SL(2,𝔽₃)`: `det(ρ⊗χ^j) = χ^{2j}`, only `j = 0`; order `48`: `C₄₈`, `QuaternionGroup 12`, `2O`. | Retain. |
| A05 `IsMcKayLabelling`, `C₂`, `A 1` (r5) | `Hom(sign, V⊗triv) = 2 = 0 − (−2)`; marks `(1,1)`; `cartanMatrix 0 1 = −2`. | Retain. |
| A06 trivial group (r5) | `Hom(triv, V⊗triv) = 2 ≠ 0`: no labelling; `[Nontrivial G]` needed. | Retain. |
| A07 invalid types (r5) | `D 3`: `(Mδ)_end = 1 ≠ 2`; `D 2`: `(Mδ)_1 = 0 ≠ 2`. | Retain. |
| A08 `Ẽ₈` marks (r5) | `(Cδ)_0 = 12 − 12 = 0`, `Σδ² = 120`; `Ẽ₇`: `48`; `Ẽ₆`: `24`; `D̃_{n+2}`: `4n`. | Retain. |
| A09 `rootLatticeQuotientMap` (r5) | `Ã₁`: `(1,0) ↦ −1`, `(0,1) ↦ 1`, `(1,1) ↦ 0`. | Retain. |
| A10 form preservation (r5) | `x = (0,1)`: `2 = 1·2·1`; `.A 0`, `x = [1]`: `2 ≠ 0`, `Valid` necessary. | Retain. |
| A11 kernel and image (r5) | kernel `ℤδ` since `δ_0 = 1`; `q(e_{b(i)}) = e_i`. | Retain. |
| A12 `Q₈`, `Ẽ₈` Checks (r5) | `(1,1,1,2)·C·(1,1,1,2) = 14 − 12 = 2`; column at node `8` is `e_7`, mark `2`. | Retain. |
| A13 §3.1 Checks (r5) | `single g 1 * single 1 x = single g (−x)`; `A = k`, `Γ = C₂`: two simples. | Retain. |
| A14 §3.2 Checks (r5) | `(1#g)(x#1) = −x#g`; `(x#1)(1#g) = x#g`. | Retain. |
| A15 `IsMcKayQuiver` (r5) | trivial group one loop; `C₂` two arrows; `Q₈`: `M_ii = 0`. | Retain. |
| A16 boundary groups (r5) | trivial: `ℂ[x,y] = Π(loop)`, `f = 1`; `C₂`: `Π(Ã₁)` on four arrows. | Retain. |
| A17 cyclic corner (r5) | `n = 3`: `(−1)³ = −1` invariant; `n = 4`: `X_i ↦ (−1)^i X_i`; dimensions `4n + 10`, `34`. | Retain. |
| A18 `Q₈` scalar-weight module (r5) | `aa* − a*a = E₁₁ − E₀₀`: `λ = (1, −1)`, simple of dimension `2`. | Retain. |
| A19 trace-weight exclusion (r5) | `(−2, +1, 0,0,0)`: `−2d_c + d_l = 0`, `d_c + d_l ≤ 2` forces `0`; `1 + 2·(−1) = −1 ≠ 0`. | Retain. |
| A20 trace versus scalar (r5) | `z = e_c`: scalars `(0,0,0,0,1)`, traces `(0,0,0,0,2)`; `Tik22 line 137`. | Retain. |
| A21 §5.3 Checks (r5) | scaling by `2`: `4λ`; Weyl algebra: `Tr[a,a*] = 0 ≠ dim`; `𝔽₂`: `E₀₀ − E₁₁ = I`. | Retain. |
| A22 sign of `λ` (r5) | `a ↔ a*` sends `ρ ↦ −ρ`; trivial group: Weyl algebra. | Retain. |
| A23 `cbhRelator` (r5) | `z = 0`: ideal `(xy − yx)`, `CBHAlgebra ≅ Sym(V)⋊G`. | Retain. |
| A24 §6.2 kernel square (r5) | FKS (6.3) at `x = −x_a` equals `l(s_a c) − r(c)` on both summands. | Retain. |
| A25 §6.2 Checks (r5) | braid: both composites send `(x_a,x_b) ↦ (−x_b, −x_a)`. | Retain. |
| A26 §6.1 Checks (r5) | `ℚ[t]/(t²)`: nonzero in `Mod(Ã_0)`, zero in `K(A,0)`; `ℚ[u,u⁻¹]`: `h = u⁻¹d/2`. | Retain. |
| A27 §6.3 central lifts (r5) | `Σ z_i = 1`; `θ(Ωe_c)` central; `ewe = 0` for `w = E^c₁₂`. | Retain. |
| A28 parameter dictionary (r5) | `t_i = −ζ^Q_i`, `x = −t_a`. | Retain. |
| A29 §6.4 Fourier Check (r5) | `e_χ = (χ(1)/|G|) Σ χ(g⁻¹)g`; dimensions `4δ_a`, `16δ_a²`. | Retain. |
| A30 §6.5 `Q₈` endpoint test (r5) | `c_ab = 1`, `c_ba = −2`; weighted `2, −2`. | Retain. |
| A31 §6.5 Checks 2–3 (r5) | `(v,w) ↦ (v, rw)` rescaling; `f_c` changes by `2f_l`. | Retain. |
| A32 §7.1 Checks (r5) | `s·x = −y`, `s·y = x`; `C₂` fibre length `3 ≠ 2`. | Retain. |
| A33 §7.1 freeness (r5) | eigenvalue `1` in `SL₂` of finite order forces `g = I`. | Retain. |
| A34 §7.2 cyclic and dihedral (r5) | `X² = Z(Y² − 4Z^m)`; `m = 1`: `C₄`, `A₃`. | Retain. |
| A35 §7.2 Checks (r5) | Molien `C₂`: `(1+t²)/(1−t²)²`; `Q₈` at `(1,2)`: `900 = 4·225`; `12·20 = 240 = 2|Γ|`. | Retain. |
| A36 §7.2 table vs GSV83 (r5) | `GSV83 line 424–428`: `E₆ (6,8,12)`, `E₇ (8,12,18)`, `E₈ (12,20,30)`. | Retain. |
| A37 §7.3 Checks (r5) | `C₂`: one `P¹`, `E² = −2`; `C₃`: `−C(A₂)`; `Γ = 1`: empty. | Retain. |
| A38 §7.4 Checks (r5) | `(y − ax, x² − b)`: basis `1, x`; tangent dimension `2`. | Retain. |
| A39 §7.5 Reynolds projector (r5) | `P = ½!![1,1;1,1]`, `P² = P`, `det !![1,1;1,−1] = −2`; `S₃`: ranks `1 + 2`. | Retain. |
| A40 §7.5 ranks (r5) | `Q₈`: `Σδ_i² = 8`, `Σδ_i = 6`; `O_Y → T_triv` an isomorphism. | Retain. |
| A41 §7.5 degrees and cycle (r5) | `Z·E_c = −4 + 3 = −1`, `Z·E_k = 0`; `E_c + ΣE_k` fails (`+1`). | Retain. |
| A42 §7.5 minimality (r5) | `Y + E ≤ Z` step; stops at the highest root. | Retain. |
| A43 §7.6 Checks (r5) | `248 = 8 + 240`; `Σδ_i = 29` over finite `Ẽ₈` nodes, unrelated. | Retain. |
| A44 §1.1 weighted identity (r5) | `Σ_{j≠i} M_ijδ_j = 2δ_i − M_iiδ_i` gives `xᵀ(2I−M)x`; `M = [2]`: `0 = 0`. | Retain. |
| A45 §1.1 highest-root lemma (r5) | `A₂`: `C′(1,1) = (1,1)`; `A₁×A₁` two dominant roots; `B₂` two. | Retain. |
| A46 §3.3 Checks (r5) | `R = x⊗W`: dimension `2` versus `4`; `Π_n S` uncountable vs `ℚ[x,y]`. | Retain. |
| A47 Lean generality vs README (r5) | §1.2, §2.2, §4.1, §5.3 hypotheses match `[Nontrivial G]`, `ht`, `hneg`/`hgraph`, `hz`/`hlam`. | Retain. |
| A48 `skewMonoidAlgebra_smulCommClass`: `c • (x * y) = x * (c • y)` in `A ⋊ G` | `x = single g a`, `y = single h b`, `c ∈ k`: left `single (gh) (c·(a·(g•b)))`; right `single (gh) (a·(g•(c·b))) = single (gh) (a·c·(g•b))` by `SMulCommClass G k A`, equal as `c` is central in `A`. Negative control without that hypothesis: `k = A = ℂ`, `G = C₂` by conjugation, `x = 1#g`, `y = 1#1`, `c = i`: `c•(xy) = i#g`, `x(c•y) = (1#g)(i#1) = (g•i)#g = −i#g`: unequal, so the hypothesis is needed and is carried. Trivial `G`: `A ⋊ 1 ≅ A`, the statement is `A`'s own `Algebra.to_smulCommClass`. `A = k`: Mathlib's own `isScalarTower_self` (`:1153`) is the special case of A49, consistent. | Retain; the elaborated statement carries exactly `[Algebra k A] [MulSemiringAction G A] [SMulCommClass G k A]`. |
| A49 `skewMonoidAlgebra_isScalarTower`: `(c • x) * y = c • (x * y)` | same `x, y, c`: `(c•single g a)(single h b) = single (gh) ((c·a)·(g•b)) = c • single (gh) (a·(g•b))`; holds for `k` central in `A` with no use of `SMulCommClass G k A` (the binder is kept for the `Algebra k (SkewMonoidAlgebra A G)` instance the body unfolds). Conjugation control: `(i•(1#1))(1#g) = i#g = i•((1#1)(1#g))`: holds, as expected. | Retain. |
| A50 `README.md:216–218` file location of `instAlgebra` | `a91d3aaf`: `Idempotents/Corner.lean:162`; `2fd255d9`: `Idempotents/Corner/Basic.lean:211`. The README names the latter; the branch pins the former. | R01. |
| A51 `Suggested.lean:7` import | module present at `2fd255d9`, absent at `a91d3aaf` (and `Corner.lean` absent at `2fd255d9`): no single import satisfies both pins. | R01. |

**House style on the changed lines.** The two docstrings state the mathematics and name the Mathlib module structure they refer to; no process words, pull-request numbers or paths (gate `prnum=0 round-labels=0 private-paths=0`); `instance` with real bodies, no `sorry`, no `set_option`; the README's lines 831–834 are prose. The headline list is unchanged: Layer 0 (three theorems), Layer 1 (two), Layer 2 (one), Layer 4 (two), Layer 5 (one) stated; Layers 3, 6, 7 named in the docstring as not statable with their missing carriers (checked by the previous report at the branch's pin; the bumped pin adds no relative quadratic dual, equivariant Hilbert scheme or minimal resolution either: no file under `TauCeti/` at `2fd255d9` mentions `Hilb` with a group action or a minimal resolution).

**Ownership.** The change adds no construction another roadmap could own (two `Prop`-valued instances on Mathlib's skew monoid algebra); the previous report's ownership search over main and the open heads stands. Ownership against open pull requests the brief does not list with files was not checked.

## Not verifiable

- **The build at `main`'s pin** (`2fd255d9` / `1b1ccf4b`): the bumped pin's package directory on this worker has Tau Ceti sources but no Tau Ceti object files (the worker's own signature elaboration failed on `TauCeti/RepresentationTheory/Simple/Basic.olean` missing there), and the review may build only in the branch's worktree, whose packages are at the branch's pin. The file's names were checked at the bumped pin by reading the sources (table above), and its elaboration at the branch's pin by the three probes.
- **Ste85, McK80, CBH98, the Conze paper, Spr77, CS03, Isaacs, CL18**: unchanged from the previous report (no legal copy found or paywalled; cited by locator); none of the changed lines cites them.

## Source issues

- none
