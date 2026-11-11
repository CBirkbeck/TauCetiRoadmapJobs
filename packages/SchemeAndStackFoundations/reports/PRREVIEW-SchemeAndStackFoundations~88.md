# Review of SchemeAndStackFoundations (pull request #1656 at a072c0d)

**Verdict:** needs changes

:robot: Independent AI full review. The head is the one the previous review read (no change in the folder). Five P3 findings, no P1 or P2: one carried over (the generated description blocks), four new from this round's seeded sample (§1.23, §2.8, §3.4). The gate passes and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — The two generated description blocks are still stale

**Location.** Pull-request description, `roadmap-summary` block: “The curve dichotomy drops quasi-compactness …” and “Quasi-compactness follows from the other curve hypotheses.” `merge-order` block: “#1276 (SchemeAndStackFoundations) → **this pull request**” and “#1276 → **this pull request** → #1807 → #1808 → #1854”.

**Claim.** The summary says a hypothesis was removed that the head keeps; the merge-order block lists a merged pull request as a predecessor.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:735` has `[QuasiCompact (X ↘ Spec (.of k))]` (elaborated, `#check` confirms). Commit `c20f72af` (#1276) is on `origin/main`. The free-text paragraph of the same description already says the dichotomy “retains main's statement”.

**Repair.** Regenerate both blocks from this head. In `roadmap-summary`, replace the two sentences by: “The curve dichotomy retains main's statement; finite type is expressed by `LocallyOfFiniteType` together with `QuasiCompact`.” In `merge-order`, remove #1276 from both lines, leaving #1656 → #1807 → #1808 → #1854. No roadmap or Lean edit.

## R02 (P3) — §1.23: the locators of `finite_quotient_coarse` and of Rydh's theorem

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3829`: “`Spec A^G` is the coarse space of `[Spec A/G]` (Stacks, Lemmas 106.12.2, 106.12.3)”; `README.md:3823`: “Theorem (6.12), pp. 27–28”.

**Claim.** (a) The two cited lemmas support the statement. (b) Theorem (6.12) is on pp. 27–28 of the 2012-05-04 manuscript.

**Witness.** (a) Lemma 106.12.2 (0DUH) is the bijection between morphisms `[U/R] → Y` and `R`-invariant morphisms `U → Y`; Lemma 106.12.3 (0DUI) says categorical moduli space iff categorical quotient (stacks-project, More on Morphisms of Stacks, lines 1602 and 1613). Neither mentions invariant rings. The ring of invariants is Lemma 106.13.4 (0DUP, line 1699: `M = Spec C`, `C` the `R`-invariant functions, categorical only among affine schemes, a universal homeomorphism) with Lemma 106.13.6 (0DUR, line 1798: uniform categorical moduli space among algebraic spaces). (b) Theorem (6.12) and its proof are lines 1392–1417 of the manuscript, between the markers of pages 28 and 29; page 27 carries Theorem (6.10).

**Repair.** (a) Cite “Stacks, Lemmas 106.13.4 (0DUP) and 106.13.6 (0DUR), with 106.12.2–106.12.3 for the passage between quotients of `Spec A` and moduli spaces of `[Spec A/G]`; Rydh, Theorem (4.1), pp. 19–20, for the geometric quotient”. `[Spec A/G]` is well-nigh affine (the groupoid `G × Spec A ⇉ Spec A` is finite locally free with affine terms), so 0DUP applies to the instance. (b) Write “Theorem (6.12), p. 28”; the following sentence, which uses Theorem (6.10), takes “p. 27”.

## R03 (P3) — §1.23: `IsTame` names the stack and its coarse space by the same letter

**Location.** `README.md:3831`: “`IsTame M` for `M` locally of finite presentation with finite inertia and coarse space `ρ : M → M`: `ρ_* : QCoh(M) → QCoh(M)` is exact”.

**Claim.** This defines tameness.

**Witness.** As written `ρ` is an endomorphism of `M` and `ρ_*` an endofunctor of `QCoh(M)`; for `ρ = 𝟙` every stack would be tame, including `B(ℤ/p)` over `𝔽_p`, which the Checks of the same section exclude. The source distinguishes the stack from its moduli space (Abramovich–Olsson–Vistoli, Definition 3.1, lines 796–804 of arXiv math/0703310v1).

**Repair.** Use two symbols, as `keel_mori` does a few lines above (`π : X → M`): “`IsTame X` for an algebraic stack `X` locally of finite presentation over `S` with finite inertia and coarse space `ρ : X → M` (§1.23's `keel_mori`): `ρ_* : QCoh(X) → QCoh(M)` is exact”. On `X = B(ℤ/p)` over `𝔽_p`, `M = Spec 𝔽_p` and `ρ_*` is the functor of invariants, not exact (`H¹(ℤ/p, 𝔽_p) = 𝔽_p ≠ 0`); on `Bμ_p` it is the degree-zero part of a `ℤ/p`-grading, exact. The repaired definition separates the two as the Check requires.

## R04 (P3) — §2.8: degree concentration is cited to a theorem that states only the quasi-isomorphism

**Location.** `README.md:4474–4479`: “Prove `relativeSupportCohomology_concentration` and `kempf_cousin_resolution` … the relative support sheaves vanish in degrees different from `i`, and the augmentation is a quasi-isomorphism ([BCGP, Theorem 3.9.6] …, printed p. 64)”.

**Claim.** Theorem 3.9.6 gives both conclusions.

**Witness.** Theorem 3.9.6 concludes only that `Cous_Z(F)` is quasi-isomorphic to `F` (BCGP author copy, lines 3111–3116, p. 64). Its proof (lines 3117–3119) refers to Kempf 1978, Theorem 10.9 and the definition on p. 358; the vanishing of `H^k_{Z_i/Z_{i+1}}(F)` for `k ≠ i` is not stated in BCGP, and Kempf 1978 is not in `## References`.

**Repair.** Keep the BCGP locator for `kempf_cousin_resolution`. For `relativeSupportCohomology_concentration` (and `relativeSupportCohomology_eq_zero_of_affine`) add the primary locator that BCGP's proof uses: Kempf, *The Grothendieck–Cousin complex of an induced representation*, Adv. Math. 29 (1978), Theorem 10.9 with the definition of “locally Cohen–Macaulay with respect to a filtration” on p. 358, and add the entry to `## References` and to the manifest. The DVR Check of this section is the test instance: `H⁰_{Z_0/Z_1}(O) = K`, `H¹_{Z_1}(O) = K/R`, and the off-diagonal terms `H¹_{Z_0/Z_1} = R¹j_*O_η = 0`, `H⁰_{Z_1}(O) = 0` are what the added locator must cover. I could not read Kempf 1978 (see Not verifiable), so check the theorem number against the text when adding it.

## R05 (P3) — §3.4: `picard_units_sequence` needs the `D_i` pairwise distinct

**Location.** `README.md:5940`: “for `X` regular with `X ∖ U = D_1 ∪ ⋯ ∪ D_r` the union of integral closed subschemes of codimension one, the sequence `Γ(X, O)^× → Γ(U, O)^× → ⊕_i ℤ·[D_i] → Pic(X) → Pic(U) → 0` is exact”.

**Claim.** Exactness for every finite family `D_1, …, D_r`.

**Witness.** `X = 𝔸¹_k`, `r = 2`, `D_1 = D_2 = {0}`, `U = 𝔾_m`: `Pic(X) = 0`, so the kernel of `ℤ² → Pic(X)` is `ℤ²`, while the image of `k[t, t⁻¹]^× → ℤ²`, `c tⁿ ↦ (n, n)`, is the diagonal. `(1, −1)` is in the kernel and not in the image.

**Repair.** Write “the union of pairwise distinct integral closed subschemes `D_1, …, D_r` of codimension one”. On the witness the family becomes `r = 1`, the sequence is `k^× → k^× × t^ℤ → ℤ → 0 → 0` (the section's last Check), and it is exact. Add the repeated-divisor instance to the Checks as the negative control.

## Previous findings

- R01 of the previous review (stale `roadmap-summary` and `merge-order` blocks) — **not repaired**. The description still reads “The curve dichotomy drops quasi-compactness” and still lists “#1276 → **this pull request**”; `Suggested.lean:735` keeps `QuasiCompact`. Repeated as R01.

## Verified sound

### Gate, dependency check, elaboration

- Folder diff since the previous head: empty. Files changed outside the folder against `origin/main`: none. Worktree clean.
- Gate rerun, exit 0, every counter zero:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- Dependency check with `--movable --pr 1656`, exit 0, no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

- `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`: exit 0, 48 warnings, all 48 “declaration uses `sorry`”. No `set_option`, no sorry'd data, one `import Mathlib` followed by 25 `TauCeti.*` modules, all present at the pin.
- `#check @name` scratch file: 100 declarations elaborate; the file's two errors are the scanner's prose tokens `on` and `Formal.DeJong.map`, not declarations. I read every elaborated type against the file: no declaration lost a binder (in `Curve`, `k` and `[Field k]` stay on every statement that mentions `k`). Nothing changed.
- One-tactic padding probe: a scratch copy with each of the 48 `sorry` replaced by `first | rfl | simp | infer_instance | intros; rfl | intros; simp_all | intros; infer_instance | sorry` elaborates with 48 `sorry` warnings and no probe message, so no theorem closes in one tactic.
- Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`), as the README's contracts state.

### Headline theorems

From `README.md:16`: complete Noetherian local rings and quasi-excellent rings are Nagata; linear Noether normalization; Artin's bootstrap; Keel–Mori; coherent duality; the Brauer class of an Azumaya algebra; Picard torsors; Schlessinger; Grothendieck existence; algebraization of morphisms; de Jong's two alteration theorems; Grothendieck–Riemann–Roch; Hodge index; the Weil bound.

Stated in `Suggested.lean`: `Ring.IsJapanese.of_complete_local`, `Ring.IsNagata.of_complete_local`, `Excellence.IsQuasiExcellentRing.isNagata`, `LinearNormalization.exists_linear_normalization`, `Groups.artinBootstrap`, `Formal.grothendieck_existence` (with `_fullyFaithful`), `Formal.algebraize_hom`, `Formal.DeJong.alteration_theorem`, `Formal.DeJong.semistable_alteration_theorem`, `hodge_index`, `weil_bound`. Named in the module docstring as not statable, with the missing carrier: Keel–Mori, coherent duality, the Brauer class, Picard torsors, Schlessinger, GRR, and `K_0 → G_0`. I checked each “the pins have no …” claim by object: no algebraic stack, coarse moduli space, dualizing complex or upper shriek, Chern character or Todd class, small extension or Artinian coefficient category in either pin (0 files each); `relativePicardPresheaf`, `relativePicardFppfSheaf`, `relativePicardDegreeZeroFppfSheaf` exist in Tau Ceti as the docstring says.

### Seeded sample: sources read at their locators

All Stacks locators were read in the chapter PDFs through the sources service (key `stacks-project`; line numbers are those of the chapter extraction). 119 tags opened; every one carries the lemma number and statement the README gives, except the two of R02 (a).

| Section | Locators read | Result |
|---|---|---|
| 0.2 | 01LX (27.4.6), 01T2, 01TQ, 01S7, 02K8, 01WI, 01QO, 01SB | all match; `p_* O = A` is 01LX (3); the module equivalence is 01SB |
| 0.11 | 02KH, 02L5, 02L7, 02KU, 02KZ, 02L1, 02VL, 02VN, 02V5, 02G7, 02G8, 02GE, 02GF | all match; the seven fpqc-local properties have the stated numbers 35.23.x |
| 0.14 | 09XI (five equivalent conditions, with `n ≥ 1` and the root in `1 + I`), 09XK, 0FWT, 0FWU, 09ZL, 0H74, 04GG (items 1, 8, 10, 11, 13), 08HQ | all match |
| 0.27 | 07T8 (both the elementwise and the finite-module form), 00DF (10.12.10) | match |
| 0.30 | 033I, 033J, 033K, 00PD, 00H8, 02JE (Examples §110.19), 09E4, 00NR | match |
| 1.3 | 025Y, 02WQ | match; the README cites 02WQ for “the argument of”, which is accurate |
| 1.16 | poonen-2017 lines 4551 (Theorem 4.5.2), 6494 (§5.12.5.2), 6517–6530 (§5.12.5.3, over a field), 7529–7557 (§6.5.6, constructions over `S`, no bijection) | match, including the README's remark that §6.5.6 has no bijection |
| 1.20 | 036X, 036Y, 04ZM, 04SZ, 04XG, 04XH, 04XJ, 04XL, 04Y8, 04YG, 04YH, 06FS (101.17.1), 04YW, 0513, 06FN, 0CL5, 04TK, 04T5, 06DC, 06FI, 0CLA, 0CLC, 0CLE, 0CLK and the `[Spec ℂ/G]` example after it, 0CLJ, 0CLN, 0CQM | match; 0CQM has exactly the hypotheses of `IsProperStack.ofDVRLifting` with `h = id` |
| 1.23 | 0432, 04S9, 04SZ, 0DUG, 0DUH, 0DUI, 0DUJ; Rydh manuscript Theorems (4.4), (6.10), (6.12); Conrad Theorem 1.1 (pp. 1–2); AOV Definition 3.1, Theorem 3.2, Corollaries 3.3–3.5, Proposition 3.6 | R02, R03; the rest match. Rydh (6.12) has no finite-presentation hypothesis for existence and gives “proper and quasi-finite” for `X → S` locally of finite type, as the README says |
| 2.8 | BCGP author copy lines 3092–3121 (§3.9.5 pp. 63–64, Theorem 3.9.6 and Remark 3.9.7 p. 64) | pages and hypotheses match; R04 for the concentration clause |
| 2.20 | 0DI0, 0E2T, 0E2D, 0E2U, 0E2F, 0E2G, 0DI2, 0E2W, 0E2X, 0E2Y, 0BV8, 0C0Z, 0C10, 0AWQ, 0E9W, 0C08, 0E9Z, 0BRT, 0FVU, 0FW0, 0E31, 0GEW | all match |
| 3.4 | 01IB, 0B8I, 0BE2, 02RJ, 0BE3, 0BE4, 0BE6, 0BE8, 0BE9, 02RX; bhatt-scholze-2017 lines 2703 (Proposition 12.15, p. 58), 821 (Construction 5.1, p. 18), 696 (§4, p. 15) | match |
| 3.5 | 0BCY, 0BCZ, 0BD2 | match; 0BD2 is for constant degree `d ≥ 1`, and the README's passage to locally constant `finrank` (clopen pieces, trivial norm where the fibre is empty) is sound |
| 4.2 | 06GC, 06G9, 06GW, 06GD, 06GH | match; the `Over`-category description is equivalent to 06GC (a surjection from an Artinian local ring to `k` has kernel `m_A`, and a map over `k` is local) |
| 5.10 | 0BEV (33.45.9) | matches; Hartshorne and Fulton locators: see Not verifiable |

### Pinned declarations opened (file and line at the pin)

92 declarations, each at the line the README gives: `RelativeSpec/MorphismProperties.lean:69, 82, 94, 108, 120, 132`; `RelativeSpec/Basic.lean:462`; `Morphisms/FormallyUnramified.lean:132` (Tau Ceti) and `Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean:123`; `RingTheory/Henselian/Idempotent.lean:170, 180`, `Etale.lean:106, 134, 149, 159`, `Quotient.lean:34, 96`, `Ideal.lean:41, 110`, `Radical.lean:34`, `Mathlib/RingTheory/Henselian.lean:154`; `RingTheory/Flat/Annihilator.lean:39, 67, 82, 97`; `RingTheory/Ideal/TensorProduct.lean:55, 72, 87`; `LinearAlgebra/TensorProduct/Quotient.lean:370, 381, 391, 399`; `Submodule.lean:78`; `Scheme/Normal.lean:84, 100, 124, 153, 177, 181, 195, 203`; `Scheme/Regular/Scheme.lean:175`; `Morphisms/CodimensionOne/Basic.lean:72, 91, 105, 117, 127, 138`, `FiniteType.lean:103`, `Normal.lean:99`; `Morphisms/RamificationIdx/Basic.lean:74, 87, 128, 151`, `Normal.lean:60, 76`; `RegularLocalRing/Quotient.lean:98, 113, 129`; `AlgebraicSpace/Basic.lean` at all 20 cited lines (68 … 221), where `IsAlgebraicSpace` is an fppf sheaf with representable diagonal and an étale atlas and does not include quasi-separatedness; `CartierDivisor/ClassGroup.lean:61, 123`; `WeilDivisor/Scheme/Picard.lean:252`; `Mathlib/CategoryTheory/MorphismProperty/Representable.lean:335, 381, 586, 666`; `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:54` and `IsProper.eq_valuativeCriterion`; `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:89` (`Scheme.Hom.finrank`); `Mathlib/Topology/LocallyConstant/Basic.lean:344`; `Mathlib/RingTheory/AdicCompletion/Basic.lean:670`; `ProjectiveSpectrum/ProjectiveOver.lean:57`.

### Cross-roadmap citations and ownership

- The citation resolver lists no cross-roadmap citation found nowhere. I resolved those of the sampled sections on main: AlgebraicVectorBundles L0B, L0C, L1B (`TauCetiRoadmap/AlgebraicVectorBundles/README.md:351, 356, 362`) and StableReduction Layers 1–2. No roadmap of the never-cite list appears in the README.
- Ownership by object against the open pull requests (`roadmaps grep`): Keel–Mori and `finite_quotient_coarse` are cited from here by ModularCurvesPartII (`README.md:178, 337`); absolute integral closure by DirectSummandsAndBigCohenMacaulay (`README.md:129`, “§0.11 supplies”); Hodge index and `Num` by K3SurfacesAndSymplecticBoundedness (`README.md:86, 573`); AutomorphicBundlesPartII uses Cousin complexes of its own strata, not the construction; “linear Noether normalization” occurs in no other roadmap. No second owner found, and no `Suggested.lean` shares a fully qualified name (the namespace is this roadmap's).
- Overlaps: #1807, #1808 and #1854 change this folder; the description states the order #1656 → #1807 → #1808 → #1854 with rebasing, which settles it (apart from the stale #1276 of R01). No cited id is dropped by an open pull request, none is defined only by an open revision, and this pull request drops none.

### Adversarial table

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.2 `relativeSpec_modulesEquiv` | `S = Spec k`, `A = k[t]`, `F = O`; `A = O_S`; `G = 0` | `p^*p_*F = A ⊗_k A`, kernel of multiplication contains `t ⊗ 1 − 1 ⊗ t ≠ 0`; tensoring over `p^*A` gives `A`. Identity. `0 ↦ 0` | Pass |
| §0.11 `unramified_criteria` | `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)`; `Spec k[ε] → Spec k`; `Spec L → Spec K` separable | `Ω = L·dt^{1/p} ≠ 0`, fibre inseparable: both sides false. `Ω = k·dε ≠ 0`, fibre not reduced: false. `Ω = 0`, diagonal `Spec L → Spec L ⊗ L` open: true | Pass |
| §0.11 `absoluteIntegralClosure` | `Spec k`, `k = k̄`; `Spec ℝ`; `Spec k[t]` | `Spec k`. `Spec ℂ`, not `≅ Spec ℝ` over `ℝ`. `t^{1/n}` integral (root of `Xⁿ − t`), not in `k[t]` | Pass |
| §0.14 henselian characterisations | `(ℤ_p, p)`; `(ℤ_(3), 3)`; `I = 0`; `(ℤ_p ⊗ ℤ_p, p)` | Henselian (complete). `p = 3`, `T² − 7`: simple root `1` mod 3, no root in `ℚ`: not henselian. `I = 0`: `f = Tⁿ(T − 1)` has root `1 ∈ 1 + I`, all five hold. Coproduct: quotient `𝔽_p` local but `Spec` disconnected | Pass |
| §0.27 annihilator formulas | `ℤ → ℤ[1/2]`, `(4) ∩ (6)`; `k[x,y] → k[x]`; `ℤ/4 → ℤ/2`, `m = 2`; `ℤ → ℤ/2`, `f = 2`; `⊕ℤ/n` over `ℚ` | `(12) ↦ (3) = (1) ∩ (3)`. `(xy) ↦ (x²) ≠ (x)`. `Ann(2) = (2) ↦ 0` against `Ann(0) = (1)`. `coker = ℤ/2` on both, `Ann = (2) ↦ 0 = Ann_{ℤ/2}(ℤ/2)`. `0` against `ℚ` | Pass |
| §0.30 normal, codimension one, ramification | `k[t², t³]`; `x ↦ x²` on `𝔸¹`, `char ≠ 2`; `k[x,y]_{(x,y)}/(y − x²)`, `/(y² − x³)` | `t` integral, not in the ring. `e = 2` at `0` (`x² = u·x²`), `e = 1` at `1` (`x² − 1 = (x−1)(x+1)`, `x + 1` a unit). `y − x² ∉ 𝔪²`: regular; `y² − x³ ∈ 𝔪²`: `dim 𝔪/𝔪² = 2 > 1` | Pass |
| §1.3 `IsAlgebraicSpace`, representable diagonal | presheaf quotient `h_{Spec L}/Gal`, `L/K` quadratic; constant presheaf `{0,1}` | On `T = Spec L ⊔ Spec L`: `(id, id) ~ (σ, σ)`, `(id, σ) ~ (σ, id)`, two classes; on each component `id ~ σ`, one class. Equaliser not a Zariski sheaf. `F(∅) = 2 ≠ 1` | Pass |
| §1.16 contracted product, twisting | `Spec L ×^{ℤ/2} Spec L`; `P ×^G pt`; frame torsor of `O(1)` | `(L ⊗ L)^G = K[ab]/((ab)² − d²) = K × K`: two `K`-points; presheaf quotient has `(Spec L × Spec L)(K) = ∅`. `pt`. Degree `+1` with `g·φ = φ∘g⁻¹` | Pass |
| §1.20 `Stacks.points`, properness | `B(ℤ/2)` over `k = k̄`; `B𝔾_m`; `ℂ[[t]]`, torsor `K(√t)` | `|BG| = 1` point, `Spec k ×_{BG} Spec k = G` has 2 points against 1. DVR lifts exist, diagonal fibre `𝔾_m` not proper: excluded by separatedness. `v(t) = 1` odd, no lift over `R`; after `t = u²` trivial | Pass |
| §1.23 `keel_mori`, coarse spaces | `B(ℤ/2)`, `k = k̄`; `[𝔸¹/𝔾_m]`; `ℤ[i]` with conjugation, mod 2 | Coarse space `Spec k`, `π` proper quasi-finite. Inertia `𝔾_m` at `0`, not finite: excluded; two geometric orbits against one point. Invariants `ℤ`; mod 2: `𝔽₂[x]/(x+1)²`, action trivial, invariants of dimension 2 against `ℤ/2` of dimension 1 | Pass (statement); R02 locators |
| §1.23 `IsTame` | `B(ℤ/p)`, `Bμ_p` over `𝔽_p`; `ρ = 𝟙` as written | `H¹(ℤ/p, 𝔽_p) = 𝔽_p`: not exact. Degree-zero part: exact. With `ρ : M → M` literally the identity: exact for both | R03 |
| §2.8 Cousin complex | DVR, `Z_1` closed point; `k[x,y]/(xy, y²)`, `Z_1` origin; `𝔸¹ ⊇ V(t)` | `K → K/R`, kernel `R`, cokernel `0`. `H⁰_{Z_1}(O) = (y) ≠ 0`: augmentation not injective. `k[t,t⁻¹] → k[t,t⁻¹]/k[t]`, kernel `k[t]` | Pass; R04 locator |
| §2.20 relative dualising complex, `cm_serre_duality` | `𝟙_S`; `ℙ¹_S`; `k[x,y]/(x,y)²`; nodal cubic; two planes in `𝔸⁴`; `ℙ²` | `O_S[0]`. `O(−2)[1]`. `Hom_k(A,k)`: socle of `A` is `(x, y)`, 2 generators, not invertible. `deg ω = 2·1 − 2 = 0`. Depth 1 < 2: two cohomology sheaves. `h²(O(−3)) = 1 = h⁰(O)` | Pass |
| §3.4 `picard_excision_sequence` | `𝔸¹ ⊇ {0}`; quadric cone `xy = z²` | `ℤ → 0 → 0 → 0`, kernel `ℤ`. `Pic = 0 → Cl = ℤ/2` injective, not surjective | Pass |
| §3.4 `picard_units_sequence` | `𝔸¹`, `r = 1`; `r = 2`, `D_1 = D_2 = {0}` | `k^× → k^× × t^ℤ → ℤ → 0 → 0` exact. Kernel `ℤ²` against image `{(n, n)}` | R05 |
| §3.4 `gradedPicardGroupoid` | `Spec(k × k)`, `f = (0,1)`; `𝔸¹_ℚ`, `f = δ_0` | Self-symmetry `(−1)^{f·f} = (1, −1)`. `δ_0` not locally constant; would need a unit of `ℚ[t]` equal to `−1` at `0` and `1` generically, but units are constants | Pass |
| `lineBundleClass_spec_equiv_pic` | `R` a field; `R = 0`; `R = ℤ[√−5]` | Both groups trivial. `Spec 0 = ∅`, both trivial. Both `ℤ/2`, class of `(2, 1+√−5)~` | Pass |
| §3.5 `lineBundleNorm` | `z ↦ z²` on `ℙ¹`; hyperelliptic `C → ℙ¹`; `𝟙` | `Norm O(1) = O(1)`, `Norm π^*O(1) = O(2) = O(1)^{⊗2}`. `π_*O = O ⊕ O(−g−1)`, `det = O(−g−1)`, so `Norm L ⊗ O(−g−1) = det π_*L`. Identity | Pass |
| §4.2 `C_Λ` | `ℤ/p²`; `ℤ_p`; `k[ε] ×_k k[ε]`; `k[x]/(x³) → k`; `k[x]/(x²) × k` | Artinian local, residue `𝔽_p`. Chain `pⁿℤ_p` infinite: not Artinian. `k[x,y]/(x,y)²`, `dim 𝔪/𝔪² = 2`. Kernel `(x)`, `x·x ≠ 0`: not small; factors through `k[x]/(x²)`. Two maximal ideals: excluded | Pass |
| `hodge_index` | `ℙ¹×ℙ¹`: `H = (1,1)`, `D = (1,−1)`; `H = (1,0)`; `H = (1,−1)`, `D = (1,1)`; `ℙ² ⊔ ℙ²`; blow-up of `ℙ²`, `H = 2L + E`, `D = L + 2E` | `H² = 2`, `D·H = 0`, `D² = −2`. `H² = 0`: excluded, and `D = H` has `D² = 0`, `D·(0,1) = 1`. `H² = −2`: excluded, `D² = 2`. Not integral: `H² = 2`, `D·H = 0`, `D² = 2`, excluded by `IsIntegral`. `H² = 3`, `H·E = −1`, `D·H = 2 − 2 = 0`, `D² = −3` | Pass |
| §5.10 reduction to the ample form | `E = (D·A)H − (H·A)D`; `M' = H²M − (M·H)H` | `E·A = 0`, `E² = (D·A)²H² + (H·A)²D²` (cross term `−2(D·A)(H·A)(D·H) = 0`). `M'·H = 0`, `D·M' = H²(D·M)`, `(tD + M')² = 2t(D·M') + M'²` when `D² = 0` | Pass |
| §5.10 adjunction, Riemann–Roch, Noether | plane curve of degree `d`; `O(a,b)` on `ℙ¹×ℙ¹`; `ℙ²`, `ℙ¹×ℙ¹` | `2g − 2 = d(d − 3)`, `g = (d−1)(d−2)/2`. `½(a,b)·(a+2, b+2) + 1 = ab + a + b + 1`. `12 = 9 + 3`, `12 = 8 + 4` | Pass |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² + y = x³` over `𝔽₂` | `|q + 1 − (q + 1)| = 0 ≤ 0`. Points `(0,0), (0,1), ∞`: `|3 − 3| = 0 ≤ 2√2` | Pass |
| `exists_linear_normalization` | `n = 0`; `𝔽₂[X,Y]/(XY(X+Y))` | `A = k`, `d = 0`, `dim = 0`. Every linear form `ℓ` over `𝔽₂` divides the relation, `A/(ℓ)` not finite over `k`: excluded by `Infinite k` | Pass |
| `Ring.IsNagata/IsJapanese.of_complete_local`, `IsQuasiExcellentRing.isNagata` | `k[[x,y]]`; a field; `ℤ` | Complete local Noetherian: Nagata. Trivially Japanese. G-ring and J-2: Nagata | Pass |
| `artinBootstrap` | `a = 𝟙_U`; `Spec L → h_{Spec K}` | Hypotheses hold, conclusion `U` is a space. Finite flat surjective: `F = h_{Spec K}`. `IsLocallySurjective` for fppf agrees with surjectivity for a flat lfp map (04S6 (3)) | Pass |
| `Torsor.trivial_iff_section`, `torsorRepresentability` | `P = G`; `Spec ℂ` over `ℝ` for `ℤ/2` | Unit section; conversely any isomorphism `G ≅ P` over `S` carries the unit to a section. No `ℝ`-point, not `≅ ℤ/2_ℝ` | Pass |
| `grothendieck_existence`, `algebraize_hom` | `X = Spec A`; `I` replaced by another ideal with the same support; `X = ∅` | `M = lim M_n` finite over complete `A`. On Noetherian `X` the powers are cofinal, same formal completion. Unique empty morphism | Pass |
| `alteration_theorem` | `X = 𝔸¹`, `Z = {0}`; `Z = ∅` (ideal `⊤`); `Z = X` (ideal `⊥`) | `X̄₁ = ℙ¹`, `B = {0, ∞}`. `B` supported on `ℙ¹ ∖ 𝔸¹ = {∞}`. Excluded by `Z ≠ ⊥` | Pass |
| `semistable_alteration_theorem` | `ℤ_p[x,y]/(xy − p²)` | One blow-up gives `uv = p` charts; `R₁ = R` | Pass |
| `isAzumaya_iff_positive_fibres_mulLeftRight` | `A = 0` over `R ≠ 0`; `R = 0`; `M_n(R)` | `0 → End(0)` bijective, rank 0, not faithful: both sides false. No primes, `A = 0`: both true. Rank `n² > 0`, bijective | Pass |
| `IsAzumaya.etale_matrix_splitting_of_finite_cover` | `ι = ∅`; one chart | Cover hypothesis forces `Spec A = ∅`, `A = 0`, all trivial. `B` étale and surjective on spectra: faithfully flat | Pass |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` | `X = ∅`; `ℙ¹`; `𝔸² ∖ 0` | `dim = ⊥ ≤ d`, cohomology zero. `H¹(O(−2)) = k ≠ 0`, `H² = 0`. `H¹(O)` infinite-dimensional, not affine | Pass |
| `flat_over_dedekind` | `S ⊔ 𝔸¹_S`; `k[t,x]/(tx)`; `k[t,x]/(x², tx)` | Flat. Component `V(t)` not dominant: excluded. Not reduced: excluded | Pass |
| `genus_of_finite_etale`, `vectorBundleDegree_pullback` | `[n]` on an elliptic curve; `z ↦ z²`, `O(1)` | `0 = n²·0`. `2 = 2·1` | Pass |
| `CH_coprod` | `I = ∅`; two points | `∐ = ∅`, zero cycle on both sides. Componentwise | Pass |
| Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR | the pins, by object | No carrier in either pin (counts above); the docstring names each | Pass |

## Not verifiable

- Whole-book page numbers of the Stacks project (for example “pp. 1220–1221”, “p. 3155”, “p. 4153”): the chapter PDFs the sources service returns are paginated per chapter. Tags, lemma numbers and statements were verified instead.
- `hartshorne-1977` (II, Proposition 6.5; V.1, Propositions and Theorems 1.5–1.10, Remark 1.9.1, Exercises 1.3, 1.7, 1.9) and `de-jong-1996`: settled as uncertified, cited by locator, not requested again. The statements were checked mathematically (table above), not against the text.
- Fulton 1998 (Proposition 1.8, §15.2 Example 15.2.2, §19.1), cited in §§3.4 and 5.10: not read; no legal copy was sought beyond the manifest in this pass.
- Kempf 1978 (R04): not read; the repair names the locator BCGP's own proof gives.
- Bhatt–Ma–Patakfalvi et al. 2020, Convention 4.1, p. 35 (§0.11's `absoluteIntegralClosure`): not read in this pass; the definition and its three Checks were verified mathematically.
- Bhatt–Scholze 2017, Definition 12.14: the extraction shows Proposition 12.15 on p. 58 (line 2703); I did not locate the definition's own line, only that the page range 58–59 contains the proposition.

## Source issues

- none
