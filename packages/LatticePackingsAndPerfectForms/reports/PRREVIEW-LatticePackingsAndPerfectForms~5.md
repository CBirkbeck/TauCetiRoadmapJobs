# Review of LatticePackingsAndPerfectForms (pull request #1723 at 59e5a7e)

**Verdict:** needs changes

## R01 (P3) — Assign the cusp–Eisenstein decomposition to ModularForms Layer 0

This is R01 of the previous report, not repaired.

**Location:** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md`:282–283: “Layer 0 (forms with character), Layer 1 (the valence formula), Layer 2 (Hecke recurrences) and Layers 4–5 (eigenforms, newforms and the Eisenstein decomposition) are consumed in 4.11 and 6.4.”

**Claim:** The supplier summary assigns `M_k(N,χ) = S_k(N,χ) ⊕ E_k(N,χ)` to ModularForms Layers 4–5. Neither the old nor the current numbering of that roadmap puts it there. The 6.4 Needs line (README:1665–1666) already pairs Layer 0 with the decomposition, so the summary also disagrees with the roadmap's own Needs line.

**Witness:** `TauCetiRoadmap/ModularForms/README.md` on main (5b506d9), §0.1, lines 374–377, proves the decomposition in weights one and two. Its earlier-label table (333–349) maps Layers 4–5 to newforms, bad-prime classification and multiplicity one. None of those is the decomposition.

**Repair:** At README:282–283, write “Layer 0 (forms with character; §0.1 the cusp–Eisenstein decomposition in weights one and two)” and “Layers 4–5 (eigenforms and newforms)”. Tested at weight two, level 11, trivial character: the §0.1 Check gives dimension 2 = 1 + 1, the weight-two case that 6.4 consumes. No supplier edge changes.

## R02 (P3) — The rewritten supplier rows name the wrong consumers

**Location:** README:330, consumer cell “1.6, 1.8, 2.3”; README:331, consumer cell “1.6, 2.3, 1.9, 4.9, 9”.

**Claim:** The rows this revision added or rewrote have three problems. They list consumers whose Needs lines do not use the listed items. They list a milestone that does not exist. They omit a milestone that does consume T⁺. Also, `IsPosDef.three_pow_mul_minimum_pow_le` is listed as consumed (README:90, 330), but no Needs line or route paragraph uses it.

**Witness:** 2.3 Needs (README:838): “L 1.1, 1.8, 2.1”. 4.9 Needs (README:1228) cites no T⁺. Layers end at 7.5, so there is no milestone 9. 7.2 Needs T⁺ `PosDef.Reduction` (README:1764) but is absent from row 331.

**Repair:**
- Row 330: “1.6; 1.8 (the model of its proof)”.
- Row 331: “1.6, 1.9, 7.2, worked examples” (the `E₈` row of the worked examples, README:1903, uses the root count).
- `IsPosDef.three_pow_mul_minimum_pow_le`: either drop it from README:90 and 330, or add it to 1.6's Needs as the root-free form.

Tested: after the edit, every consumer in the two rows names a row item in its Needs line or, for 1.8, in its route. The T⁺ Needs lines (1.6, 1.9, 7.2) are exactly row 331's milestone consumers.

## Previous findings

- R01 — not repaired: README:283 still reads “Layers 4–5 (eigenforms, newforms and the Eisenstein decomposition) are consumed in 4.11 and 6.4”. The diff does not touch lines 279–283. Re-raised above as this report's R01, with witnesses re-resolved against the current ModularForms on main.

## Verified sound

🤖 Independent AI incremental re-review of 52 changed lines since 056a570, at head 59e5a7e.

**Scope.**
- Only `README.md` changed. `Suggested.lean` is byte-identical to 056a570 (same sha256), and there are no changes outside the folder.
- The changed passages are:
  - the second “From Tau Ceti at the pin” bullet (README:87–98);
  - the three rewritten rows of *From Tau Ceti* (326, 330, 331);
  - §1.6 with its Needs line and dependency row (656–673, 757);
  - the §1.8 route paragraph (694–702);
  - the 7.4 Needs line and dependency row (1820, 1863).
- Each was checked against the Tau Ceti pin 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a and the Mathlib pin f6090c7095e1e56b3464c1daba5f24631f1290d2 of the branch's `lake-manifest.json`, and against the current main (5b506d9) of the roadmap repository.
- Two suppliers changed on main after the previous review (dated 2026-11-03):
  - IntegralLattices was renumbered by its 2026-11-08 revision;
  - ModularForms was renumbered by its 2026-11-09 revision, which adds an earlier-label table.

  All citations below were re-resolved against those current texts.

**Gate.**
- The brief's command (default merge order) reported `depcheck=1` with `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`. This is the default-order false positive the previous report recorded, not a defect.
- With the candidate merge order and the targeted build, the gate exited 0:

      gate LatticePackingsAndPerfectForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

- The dependency check (candidate order, `--movable`, main content) printed the following, with no UPWARD, CYCLE or `moved:` line. The candidate order lists the roadmap at line 148.

      depcheck: 238 roadmaps, 2321 edges, 0 problem(s)

**Elaboration.**
- `lake env lean` on `Suggested.lean` exited 0 with 52 warnings, all `declaration uses 'sorry'`.
- A scratch copy with `#check @name` for all 112 declarations exited 0. It printed 112 elaborated types, the same 52 warnings and no error.
- The types agree with the supplied signature inventory. The single binder lead is unchanged and harmless: `polynomialsOfDegreeLE` is a span of functions and needs no measure or finite-dimensionality binder.
- The 7.4 bundlings `discriminantHom` and `discriminantQuadraticHom` elaborate with `[L.IsNondegenerate]`, and the quadratic one also with `(he : L.IsEven)`. This matches the revised 7.4 Needs line. No signature changed and no repair to the Lean file is needed.

**Headlines and padding.**
- No Lean declaration changed, so the headline inventory and the 52-theorem one-tactic padding probe are inherited from the previous two reports.
  - Headlines covered: real Minkowski and Hermite bounds; attainment and Mordell; sharp Hermite values through rank 8 and in rank 24; covering; Voronoi; rationality and finiteness; Cohn–Elkies; designs; Venkov; 15 and 290; Kitaoka; the rank-one Festi–Veniani index.
  - Padding probe: none closed.
- The newly cited integral Tau Ceti theorems make no README headline newly statable or redundant. At the pin, Hermite's inequality exists only for ℤ-valued forms (`BilinearForm/Hermite.lean:230`, `PosDef/Hermite.lean:81`). There is no real-form Hermite or Minkowski statement at either library pin, so 1.7, 1.8 and their Lean statements duplicate nothing.

**Pinned declarations opened at 358314d.** Paths are relative to the Tau Ceti root.

| File:line | Declaration and what it does (not) include |
| --- | --- |
| `TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean:45` | `successiveMinimum`: least natural bound for `i+1` ℤ-independent vectors, squared norms, index `Fin (finrank ℤ L)` (none in rank 0) |
| same file `:103` | `IsPosSemidef.successiveMinimum_zero`: needs `IsPosSemidef` and `0 < finrank`; gives `L.minimum` |
| `…/IntegralLattice/PosDef/Hermite.lean:60, 81` | `IsPosDef.three_pow_mul_minimum_pow_le` (`3^C(n,2)·minⁿ ≤ 4^C(n,2)·det` in ℤ) and `IsPosDef.minimum_le_rpow_mul_determinant_rpow`; no rank hypothesis |
| `…/IntegralLattice/RootLattice/TypeA/Hermite.lean:37` | `minimum_typeARootLattice_two_eq_rpow_mul_determinant_rpow`: equality for `typeARootLattice 2` |
| `TauCeti/LinearAlgebra/BilinearForm/Hermite.lean:77, 230` | `exists_isPrimitive_forall_apply_self_le` (∃ primitive minimiser; `Module.Free`, `Nontrivial`) and `exists_ne_zero_three_pow_mul_pow_le_four_pow_mul_det` (symmetric, PD, `BilinForm ℤ M`); integral only |
| `TauCeti/LinearAlgebra/Matrix/Condensation.lean:46` | Chiò condensation: for `(n+1)×(n+1)`, `a₀₀·det(cond) = a₀₀ⁿ·det` |
| `TauCeti/Algebra/Module/Primitive.lean:48, 171` | `IsPrimitive` (a functional takes value 1) and `IsPrimitive.exists_basis` |
| `…/IntegralLattice/Dual/Basic.lean:75`; `…/Discriminant/Group.lean:109` | `dualCarrier`; `DiscriminantGroup` |
| `…/Discriminant/Bilinear.lean:128, 192, 224, 235, 255` | `discriminantBilinearModule` (needs `IsNondegenerate`), `Isometry.discriminantBilinearIsometry` (nondegenerate source and target), and its `_refl`, `_symm`, `_trans` |
| `…/Discriminant/Quadratic.lean:122, 184, 232` | `discriminantQuadraticMap` (needs `IsEven`), `discriminantQuadraticModule` (packages the bilinear module), `Isometry.discriminantQuadraticIsometry` (nondegenerate, `IsEven`) |
| `TauCeti/LinearAlgebra/FiniteBilinearModule/`, `…/IntegralLattice/Isometry/Group.lean:85, 100` | No group instance on `FiniteBilinearModule.Isometry` and no `O(L) →* O(D_L)`. `Suggested.lean`'s `bilinearIsometryGroup` and `discriminantHom` duplicate nothing |

Table notes:
- All eleven newly cited Tau Ceti names also exist at main's Tau Ceti pin 2fd255d, so the citations survive the pin bump at merge.
- `TauCeti.IntegralLattice.kissingNumber_typeE₈RootLattice` (row 331, “intended home”) is absent at 358314d. It is present at 2fd255d (`RootLattice/TypeE/Roots.lean:119`, value 240), which matches the row's statement that its home is intended, not pinned.

**Changed passages, verified.**
- **The contracts (87–98).** The named integral successive minima, Hermite and form-level statements are at the stated files with the stated content.
- **§1.6.** All three claims hold:
  - Tau Ceti's root-form bound is 1.8 restricted to integer Gram matrices;
  - IntegralLattices 2F's Minkowski statement includes the first bound as its `λᵢ ≥ λ₁` case (IntegralLattices README:693–704), the integral case of 1.7;
  - the first native successive minimum is the minimum under the positive-rank hypothesis.

  The Needs line equals dependency row 757.
- **§1.8.** The real-form route is correct, with the existence of the minimum taken from 1.1 instead of integrality:
  - a minimal vector `v = d·w` with `|d| ≥ 2` would give `A[w] = A[v]/d² < A[v]`;
  - the projection of `K` orthogonal to `v` has Gram determinant `det A / μ`;
  - nearest-integer rounding gives projected norms `≥ μ − μ/4`;
  - the induction closes with exponent `C(n,2)`.
- **§7.4.** The Needs line now names the pinned induced isometries with the right hypotheses and agrees with row 1863.
- **Row 326.** Every name is at the stated file.

**Fresh adversarial rows (changed statements).** A₂ is `[[2,1],[1,2]]` (minimum 2, determinant 3); decimals approximate the exact values shown.

| Statement / changed interface | Instances | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| 1.6: `IsPosDef.minimum_le_rpow_mul_determinant_rpow` is the integral case of 1.8 | [4]; diag(1,4); I₂; A₂; A₃; D₄; E₈ | min vs `(4/3)^{(n−1)/2}det^{1/n}`: 4 ≤ 4; 1 ≤ 2.309401; 1 ≤ 1.154701; 2 ≤ 2.000000; 2 ≤ 2.116535; 2 ≤ 2.177324; 2 ≤ 2.737068 | Pass |
| `IsPosDef.three_pow_mul_minimum_pow_le` | same; rank 0 | `3^C(n,2)minⁿ` vs `4^C(n,2)det`: 4 ≤ 4; 3 ≤ 16; 3 ≤ 4; 12 ≤ 12; 216 ≤ 256; 11664 ≤ 16384; 5.8565·10¹⁵ ≤ 7.2058·10¹⁶; rank 0: 0⁰ = 1 ≤ 1, and the root form gives 0 ≤ 0.866025 | Pass; no rank hypothesis needed natively, while 1.8 keeps `n ≥ 1` |
| `IsPosSemidef.successiveMinimum_zero` | diag(1,4); [4]; A₂; rank 0 | native (1,4) versus lengths (1,2); index 0: 4 = min; (2,2), 2 = min; `Fin 0` has no index | Pass; squared-norm convention matches the 1.6 Checks; positive-rank hypothesis needed and present |
| A₂ equality (1.6 Check) | A₂; wrong exponent n−1 | `(4/3)^{1/2}·3^{1/2}` = 2 = min; `(4/3)·√3` = 2.309401 ≠ 2 | Pass; the Check separates the exponent |
| 1.8 route following `BilinearForm/Hermite.lean` | A₂ with v = e₁; I₂; the closing step | `e₂ − e₁/2` has norm 3/2 = det/μ ≥ (3/4)·2 = 3/2; I₂: 1 = 1/1 ≥ 3/4; `μⁿ ≤ (4/3)^{C(n,2)}det`: 4 ≤ (4/3)·3 = 4 | Pass; “det A / min A” correct |
| Integral analogue `S = μB − B(v,·)B(v,·)` | A₂ | S(e₂,e₂) = 3 = μ·3/2; μ·det S = 6 = μ^{n−1}·det B, while μⁿ·det B = 12 | README unaffected; see the remark on the pinned docstring |
| Minimal vectors are primitive | [1] with v = 2e; [4] | norm 4 > 1, so a proper multiple is never minimal; [4]: ±e primitive, norm 4 | Pass; the pinned theorem gives an integral primitive minimiser |
| 7.4 induced isometries | Gram [8]; [12]; 2I₃; [0] | [8]: bilinear {1,3,5,7}, quadratic {1,7}; q(e/8) = 1/16, q(3e/8) = 9/16; [12]: quadratic {1,5,7,11}, image {±1}, index 2; 2I₃: q(eᵢ/2) = 1/4, b = 1/2; [0]: dual ℚ, A_L = ℚ/ℤ infinite | Pass; `[IsNondegenerate]` excludes [0] on both sides, `IsEven` guards q_L |
| 7.4 homomorphism laws | identity; f = (12), g = (23) on 2I₃ | `_refl` fixes all 8 classes; (f·g)(e₁/2) = e₂/2, (g·f)(e₁/2) = e₃/2, `mul f g := g.trans f` | Pass; matches `_trans` (Bilinear.lean:255) |
| ModularForms summary (R01) | weight 2, level 11, trivial χ; level 1, weight 4 | §0.1 dimensions 2 = 1 + 1 and 1 = 0 + 1; Layers 4–5 are conductor and cross-level multiplicity one | Decomposition is Layer 0: R01 |
| Row 330 consumers | 1.6; 1.8; 2.3 | 1.6 Needs four row items; 1.8 Needs no T item (model only); 2.3 Needs L 1.1, 1.8, 2.1 | R02 |
| Row 331 consumers | 1.6, 1.9, 7.2, 2.3, 4.9, “9” | T⁺ in the Needs of 1.6, 1.9 and 7.2 only; 2.3 and 4.9 none; no milestone 9 | R02 |
| IntegralLattices labels at 97, 331, 337, 1820 | main 2E, 2F, 2G, 6G, 1C–1D, 1G | 2E native label (IL:445, 455); 2F Minkowski II with first bound (693); 2G reduction and classes (716); 6G `\|O(E₈)\|` from the 240 roots (2182, with 184 “2B, 6G”); 1C–1D native discriminant labels (442); 1G finite quadratic modules (444) | Resolve on main |

**Carried adversarial rows.** These rows are carried without recomputation. Statements untouched by the diff keep the previous report's values. Rows marked r4 are its fresh rows; rows marked r3 were carried by r4 from r3. The previous 1.6 comparison row, the 7.4 composition row and the 7.4/7.5 discriminant row are superseded by the fresh rows above.

| Statement / API | Instances | Values computed on each side | Result; provenance |
| --- | --- | --- | --- |
| 0.5 dual-to-inverse-form isometry | A=[4], x=1/4 | Ax=1; A[x]=1/4=A⁻¹[1] | Pass; r4 |
| 1.8 rounding input | [[2,1],[1,3]], x=1/2 | round 1; \|x−1\| = 1/2 ≤ 1/2; 2·\|−1\| = 2 = a₁₁ | Pass; r4 |
| 3.2 strictness and rank restriction | I₂; [4]; empty | ρ=1/2<μ=0.707107; [4]: ρ=μ=1; rank 0: 0=0 | Pass; r4 |
| 3.2 strict-density consequence | I₂; diag(1,4); [4] | π/4<1; π/8<1; 1=1 | Pass; r4 |
| 3.2 missed open region | I₂, h=(1/2,1/2) | infDist = √2/2; ε=(√2−1)/4 | Pass; r4 |
| 3.2 scaling, covering density | I₂, 4I₂; [4] | (1/2,√2/2)→(1,√2); Θ=π/2; Θ=1 | Pass; r4 |
| 4.1 rationality | A₂/2; [1]; axes only | b forced to 1/2, det 3/4, scale 2 gives A₂; axes leave b free | Pass; r4 |
| 4.1 negative control, rank 0 | [[1,t],[t,1]], t=√2/10; empty | span dim 2<3; empty system | Pass; r4 |
| 4.10 inputs | D₅, E₆, E₇; {[1]} | γ⁵=8; γ⁶=64/3; γ⁷=64; 1=γ₁ | Pass; r4 |
| 4.11 supplier row | r=2, f(0)=f̂(0)=1; 3f | bound 1; ratio 1; Leech γ=4 | Pass; r4 |
| 5.4 Gram derivative | diag(1,4) | Laplacians 3/2 and 0 | Pass; r4 |
| 6.3 dependencies | [1]; ℤ⁴ | misses 2; 7=4+1+1+1 | Pass; r4 |
| 6.4 parity, all primes | 2I₄, [2]; p=2 good, p=11 bad | 29 tests represented; x² misses 2; 2√2; 11⁰=1 | Pass; r4 |
| 0.1 action and similarity | I₂, U=[[1,1],[0,1]]; [2], [6] | UᵀU=[[1,1],[1,2]], det 1; [6] similar, not congruent | Pass; r3 |
| 0.1 primitive representative | [4], rank 0 | [4]→[1]; empty gcd 0 | Pass; r3 |
| 0.2 gramForm positivity | [2], [0], empty | PD; not; PD | Pass; r3 |
| 0.3 covolume | [4], I₂, rank 0 | 2; 1; 1 | Pass; r3 |
| 0.4 shell comparison | [1] t=−1,0; [2] t=2 | 0, 1, 2 | Pass; r3 |
| 0.5 block sums | [2]⊕[3], empty⊕[3] | det 6, (1,1)↦5; [3] | Pass; r3 |
| 1.1 minimum, shells | diag(1,4), I₂, rank 0 | min 1, kiss 2; kiss 4; min 0 | Pass; r3 |
| 1.2 native comparison | [2], diag(1,4), rank 0 | 2=2; lengths 1,2; 0=0 | Pass; r3 |
| 1.4 Vₙ and densities | n=0,1,2,3,4,8,24; [4]; I₂ | 1, 2, π, 4π/3, π²/2, π⁴/24, 0.0019296; Δ=1; π/4 | Pass; r3 |
| 1.5 Hermite, center density | diag(1,4), [4], A₂ | γ=1/2, δ=1/8; γ=1; γ=2/√3 | Pass; r3 |
| 1.5 Bergé–Martinet | I₂, diag(1,1,4), A₂ | 1; 0.62996, 0.39685, 0.5; 1.1547 | Pass; r3 |
| 1.7 Minkowski | n=1; [4]; I₂ | 1.0000=γ₁; 4=4; π<4 | Pass; r3 |
| 1.8 Hermite | [4], A₂, I₂ | 1≤1; 2/√3; 1<1.1547 | Pass; r3 |
| 1.9 reduced family | diag(1/t,t), η=1/4 | t ≤ 4 iff min ≥ 1/4 | Pass; r3 |
| 2.1 range, Mordell | I₂, diag(1,4); n=2,3 | 1, 1/2 in range; 1.2599 ≤ 4/3 | Pass; r3 |
| 2.2 attainment cutoff | ε=γₙ | η=0 admits unbounded family | Pass; r3 |
| 2.3 values | [a], A₂, A₃, I₃ | 1; 4/3; 2; 1<2 | Pass; r3 |
| 3.1 cell, relevant vectors | [4], I₂, A₂ | volume 2; 1; shortest coset norms 1, 2, 2 | Pass; r3 |
| 3.3 Jarník | diag(1,4), [4], I₂ | 1 ≤ √5/2 ≤ 3/2 ≤ 2; 1=1=1 | Pass; r3 |
| 3.4 covering values | I₃, A₂, Λ₂₄, ranks 1, 0 | √3/2; √(2/3); √2, 7.903536; 1; 1 | Pass; r3 |
| 4.1 perfection, KZ | I₂, A₂, D₄, E₈, rank 0 | dims 2<3, 3=3; 6≥6, 24≥20, 240≥72, 0≥0 | Pass; r3 |
| 4.2 eutaxy | I₂, A₂, B, rank 0 | c=1/2; c=1/6; B fails | Pass; r3 |
| 4.3 extremality | A₂, [[1,t],[t,1]] | 2/√3 maximal; 1/√(1−t²) > 1 | Pass; r3 |
| 4.4 finiteness, irreducibility | irrational A; A₂, U | sublevel {0,±e₁,±e₂}; UQ ≠ QU, UQA = QAU | Pass; r3 |
| 4.5 Voronoi iff | A₂, I₂, B, rank 0 | T↔T∧T; F↔F∧T; F↔F∧F; T↔T∧T | Pass; r3 |
| 4.6, 4.7 finiteness | n=0,1,2 | 1; 1; 1 perfect, 2 eutactic | Pass; r3 |
| 4.9 neighbours, Ryshkov | A₂ with N; I₂; [1] | ρ=2, neighbour det 3; dims 2<3; ρ=0 | Pass; r3 |
| 4.10 completeness, counts | s=∅, {[1]}; ranks 4–8 | excluded; 2, 3, 7, 33, 10916 | Pass; r3 |
| 4.10 sharp values | D₄, D₅, E₆, E₇, E₈ | 4, 8, 64/3, 64, 256 | Pass; r3 |
| 4.11 Cohn–Elkies, Leech | n=1, f=(1−x²)e^{−πx²}; r=2 | 0.594640 ≥ 1/2; δ(Λ₂₄)=1, γ=4 | Pass; r3 |
| 5.1 designs, measure | {±1}, {1}, ∅; σ₁, σ₀ | averages 0; fail; masses 1, 1, 0 | Pass; r3 |
| 5.2 moments, k=0 | {±1}; I₂ axes | 2=2; 2=4/2; 2 ≠ 3/2 | 3-design not 5; r3 |
| 5.3 strong eutaxy, strong perfection | A₂, B; A₃, D₄ | T, F; 40 ≠ 192/5; 48=48 | Pass; r3 |
| 5.4 Gram Laplacian | I: 1, X₀², X₀²−X₁²; E₈ | 0, 2, 0; 4 and 0 | Pass; r3 |
| 5.5 Fourier identity | n=1, P=x, τ=i | −iξe^{−πξ²} both sides | Pass; r3 |
| 5.6 harmonic theta, rank 0 | E₈: P=1, 2, 0, odd | constant terms 1, 2, 0; cancel | Pass; r3 |
| 5.7 Venkov | (m,r)=(0,1),(0,2),(1,0); n=24 | t=7, 3, 11; cusp dims < 2 | Pass; r3 |
| 6.1 universality | ℤ³, ℤ⁴, A₂, 2I₄, [2] | 7 missed; 7=4+1+1+1; half-norm min 2 | Pass; r3 |
| 6.2 escalation | [1]; 2ℤ⁴; Esc₁ | dets 1, 2, 1; nine ternary classes | Pass; r3 |
| 6.3 criterion | diag(1,2,5,5), diag(1,2,5,10) | only miss 15; none | Pass; r3 |
| 7.1 tensor | A₂⊗A₂ | det 81, rank 4 | Pass; r3 |
| 7.2 Kitaoka | A₂⊗A₂; [√2]⊗[3]; n=0 | min 4, 18 vectors; 3√2; 0=0 | Pass; r3 |
| 7.3 decomposability | ℤ⁴, A₂, E₈ vs A₂⊗D₄ | 4=2·2; prime rank; 1 ≠ 1296 | Pass; r3 |
| 7.5 rank-one index, m ≥ 3 | m=3,4,5,8,12,15; m=1,2 | 1,1,1,1,2,2; formula 0 ≠ 1 | Pass; hypothesis present; r3 |
| worked bcc, E₈ density | displayed Gram; E₈ | det 128, min 6; π⁴/384 = 0.253670 | Pass; r3 |

The tables contain 13 fresh rows and 60 carried rows.

**Seeded source sample.** None of the fifteen seeded targets lies in a changed passage, and none cites one. Their locator evidence is therefore carried from the previous two reports. The supplier citations among them were re-resolved this round.

| Seeded targets | Disposition this round |
| --- | --- |
| 0.1, 0.5, 1.1, 1.3 | Untouched; dsv2007 lines 43–59 (r4) carried |
| 3.3 | Untouched; GoN §4.4.2 resolved at its open head (r4) carried |
| 4.2, 4.5 | Untouched; dsv2007 lines 65–68 and the r3 Voronoi values carried |
| 4.10 | Untouched; its inputs are Completed IntegralLattices Layer 5 and L 2.1–4.9, none changed |
| 4.11 | Untouched. “ModularForms Layer 1 (valence formula)” resolves through ModularForms' earlier-label table (ModularForms README:336) to `TauCeti.ModularForm.valence_formula_weighted` (`TauCeti/NumberTheory/ModularForms/LevelOne/ValenceFormula.lean:117`, present at 358314d) and §1.1. The ckmrv2017 check is carried |
| 5.5, 5.6 | Untouched; GoN §4.3 and venkov2001 p.59 (r3) carried |
| 6.1, 6.2 | Untouched; bhargava2000 line 1481 (r3) carried |
| 6.3 | Untouched; its IntegralLattices §4A resolves on main (IntegralLattices README:1507, class sets and genus); bhargava2000 §6 (r3) carried |
| 7.3 | Untouched; its inputs are T `Isometry`, `determinant` and L 7.1–7.2; r3 values carried |

No locator in the README is flagged as unverified, and the changed passages add no source locator.

**Ownership and supplier resolution.**
- The changed passages move consumption onto pinned Tau Ceti declarations and introduce no new owned object.
- Hermite ownership was searched by object across main and the open heads:
  - IntegralLattices on main treats Hermite's inequality as native (README:688–691);
  - NumberFieldEnumeration at its open head 98f9ddf7 defers Hermite's constant to geometry of numbers (README:46–48).

  Neither states the real-form inequality, so this roadmap remains its only owner.
- The ownership of the untouched objects is carried from the previous report.

| Supplier | Resolved object / location |
| --- | --- |
| `TauCetiRoadmap/IntegralLattices/README.md` (main) | 442, 444, 445 native labels 1C–1D, 1G, 2A–2F; 455 “2A–2E name the native declarations”; 693 2F; 716 2G; 1507 4A; 2182 6G; 2657 9B |
| `TauCetiRoadmap/ModularForms/README.md` (main) | 162–175 character spaces and Eisenstein carriers; 176–180 valence; 333–349 earlier-label table; 374–377 §0.1 decomposition; 670 Layer 4; 708 Layer 5 |
| IntegralLattices at the open #1411 head (46e4ab9) | 610 1C, 797 2E, 802 2F, 2014 9A: the pre-revision headings |

The six overlap leads were each checked:
- §4A is defined on main (IntegralLattices README:1507); the lead is a false positive.
- §1C and §2E are labels on main for native declarations (442, 445, 455), so the changed citations at 97, 331, 337 and 1820 resolve there.
- §9A (README:1874) is defined only at #1411's head. That line is untouched text, so it is listed as a remark below.

The citations tool's thirteen leads are LMFDB knowl identifiers (README:17–19) or are declared in `Suggested.lean` or as T⁺ module names, as the previous report found; none lies in a changed passage. Ownership against open pull requests was checked through the sibling checkouts and the roadmaps index of 2026-11-09.

**Remarks on untouched text** (no change requested):
- The IntegralLattices contract (README:252–258) still describes that roadmap's pre-revision labels: “2E Minkowski's and Hermite's bounds, 2F integral successive minima … 9A/9B the stored-column certificates”. On main, 2A–2E name native declarations, 2F is Minkowski's second theorem, and Layer 9 has only 9B (exhaustion from mass saturation), with no stored-column certificates. README:128 and 1874 cite 9B and §9A–9B for that certificate shape.
- Other ModularForms labels resolve only through the earlier-label table to Tau Ceti declarations. For example, 6.4's “Layer 4 (bad-prime eigenvalues)” points to `Newforms/BadPrime/Classification.lean`. That file exists at main's Tau Ceti pin 2fd255d but not at the branch pin 358314d, where `BadPrime/` holds only `Stability.lean` and `Vanishing.lean`.
- The untouched rows README:323 and 324 list consumers “8.1” and “7.6”, which do not exist.
- The §1.8 Needs line (README:714) omits `TauCeti.IsPrimitive.exists_basis` (`Algebra/Module/Primitive.lean:171`), the basis extension its route uses.
- The pinned module docstring of `BilinearForm/Hermite.lean` (lines 41–43) writes `μ·det S = μⁿ·det B` with n the rank. `Condensation.lean:46–48` gives the exponent rank − 1: for A₂, 6 = 2·3, not 12. The README's `det A / min A` is correct.

## Not verifiable

No changed claim needed a source text. These access limits are inherited from r3 and r4, not reopened, and no manifest was edited:

- kitaoka1993, Theorem 7.1.1: Cambridge landing page only.
- conwaysloane1999 (Chapters 21 and 23) and cassels1971: publisher paywalls.
- martinet2003: author-hosted contents only.
- steinweiss1971, gruber1987, schuermann2009 and voronoi1908: no legal full text found by the sources service.
- LMFDB knowls: CAPTCHA.

## Source issues

- none
