# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at f8d56e6)

**Verdict:** needs changes

This is a full review: the folder changed by 226 lines since `f5de135`. The change replaces the citations of HomotopySpheres and PointProcesses with the roadmap's own plans for that material: stable stems, Wall forms and formations over `ℤ`, the Arf invariant and the simply connected L-groups; and Campbell measures with the Poisson law. Both supplier roadmaps still plan that material, under the same names, and both are admissible suppliers. The previous head cited them and passes the dependency check. The result is two owners for each object, which accounts for the two blocking findings. Apart from that, the gate fails on one statement-hygiene rule, and there are four smaller locator, citation and style repairs. All 25 Lean statements and the 15 sampled sections hold up under the adversarial pass below.

## R01 (P2) — §6.1a stable stems and the new §6.8 Wall-form, Arf and surgery paragraphs re-plan HomotopySpheres §3A.3 and §§7B–7C

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` line 23 ("the stable stems of spheres with their comparison to the sphere spectrum; and Wall's nonsingular quadratic forms and formations over `ℤ`, the Arf invariant in characteristic two, and the resulting simply connected quadratic L-groups of `ℤ`"); line 2302 (**Stable stems**), lines 2961–2995 (**Integral Wall forms**, **The Arf invariant**, **Integral Wall formations**, **Integral surgery calculations**), line 3253 (6.10a now consumes `wallFormGroupSignature`, `wallFormGroupArf`, `wallFormationGroup_eq_zero`); lines 72–73 and 92–93; `Suggested.lean` lines 505–531 and docstring lines 19, 21–22, 46–49.

Claim: this roadmap owns these objects.

Witness: HomotopySpheres (merge order line 66, before this roadmap at 68; new-roadmap PR head `8a5be10`) plans §3A.3 (the stable stem as a colimit in `AddCommGrpCat`), §7B.2–7B.3 (ε-quadratic forms, formations) and §7C.1–7C.3 (odd vanishing, E₈/8, Arf coordinate).

The previous head `f5de135` cited exactly these sections (its README lines 176–178, 3188–3190), and the dependency check on that README prints `depcheck: 240 roadmaps, 2386 edges, 0 problem(s)` (rerun this round), so nothing forced the move. HomotopySpheres cites no section of this roadmap, so there is no cycle to break. The 𝔽₂ Arf algebra (Arf zero exactly when a q-zero Lagrangian exists; dimension and Arf classify) is also the declared gap `gap:finite-quadratic-arf` of TangentialBordism B3.2(a) (its README lines 247–261). HomotopySpheres §7C.3 consumes that gap. A third plan of the same algebra here, with headline theorems in `Suggested.lean`, gives that object two owners. The mathematics of the new paragraphs is correct (rows in the table below); only the ownership is wrong.

Repair:
1. Restore `### From TauCetiRoadmap.HomotopySpheres`, citing §3A.3 for the stable stem, its structure maps and universal property, §7B.2–7B.4 for forms, formations and their groups, and §7C.1–7C.3 for odd vanishing, signature/8 and the Arf coordinate.
2. Delete the four §6.8 paragraphs from **Integral Wall forms** to the end of **Integral surgery calculations**.
3. In §6.1a delete the definitions `sphereSuspensionHom` and `stableStem`, with its API. Keep `sphereSpectrumHomotopyIso` as this roadmap's comparison of HomotopySpheres' stable stem with `spectrumHomotopyGroup`, consuming §3A.3 and AlgebraicTopology Stage 8 item 2.
4. In 6.10a replace the three `wallForm…` names with HomotopySpheres §7C.1–7C.3.
5. Remove the last clause of the scope sentence on line 23.
6. Delete `arfMajority`, `arfMajority_eq_zero_iff_exists_lagrangian` and `quadraticMap_equivalent_iff_arfMajority` from `Suggested.lean`, together with the Layer 6 headline bullet and the corresponding docstring sentences.

After these edits the pull request description, which still lists HomotopySpheres as a supplier, is accurate again. Rerun the dependency check afterwards; it printed no problem on the previous head.

## R02 (P2) — The Campbell-measure and Poisson-law paragraphs of §4.2 re-plan PointProcesses Layers 2, 4 and 6, down to the declaration names

Location: `README.md` line 23 ("intensity and Campbell measures of random measures, Poisson random measures of σ-finite intensity with their law, restriction and Campbell formula"), lines 68–70 (headline bullet), 1513–1520 (**Random measures and Campbell measures**), 1531–1539 (**Poisson random measures with σ-finite intensity**, including `poissonLaw_map_restrict` and `iIndepFun_restrict_poissonLaw`); `Suggested.lean` lines 300–341.

Claim: this roadmap owns intensity and Campbell measures, `IsPoissonRandomMeasure`, `poissonLaw` and its restriction theorems.

Witness: PointProcesses (new-roadmap PR by another author, head `234a33d`) declares `campbellMeasure`, `campbellMeasure_fst`, `lintegral_campbellMeasure`, `IsPoissonRandomMeasure`, `poissonLaw`, `isPoissonRandomMeasure_id_poissonLaw` and `map_eq_poissonLaw` (its `Suggested.lean` lines 229, 244, 249, 382, 396, 400, 404). Layer 6 plans restriction and independent splitting.

It cites no section of this roadmap, so it can supply this one. The previous head cited its Layers 2 and 4 (old README lines 172–174), with the dependency check clean on that README. The new `IsPoissonRandomMeasure` and `campbellMeasure` definitions are the same objects under the same names. The statements are true (table below); only the ownership is wrong.

Repair:
1. Restore `### From TauCetiRoadmap.PointProcesses`: Layer 2 `campbellMeasure`, `campbellMeasure_fst` and `lintegral_campbellMeasure`; Layer 4 `IsPoissonRandomMeasure`, `poissonLaw`, `isPoissonRandomMeasure_id_poissonLaw` and `map_eq_poissonLaw`; Layer 6 restriction and independent splitting.
2. Delete the two paragraphs at lines 1513 and 1531.
3. Keep **Finite Poisson sampling** and `poissonLaw_smul_eq_map` as the identification of the finite samples with PointProcesses' `poissonLaw`, as the previous head did.
4. In the tempered maximal inequality (line 1541), cite PointProcesses for the restriction and independence statements.
5. Delete `intensityMeasure`, `campbellMeasure`, `campbellMeasure_fst`, `lintegral_campbellMeasure`, `IsPoissonRandomMeasure` and `exists_unique_poissonLaw` from `Suggested.lean`, together with the headline bullet and the docstring phrases. Campbell's formula and the existence of the Poisson law are inputs to Lindenstrauss's covering argument, not headline theorems of this roadmap.

## R03 (P3) — Gate failure: `[Fintype F]` beside `[Field F]` in `finite_hermitian_isometry_formula`

Location: `Suggested.lean` lines 133 and 145–147 (`variable {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]`; `{F : Type*} [Field F] [StarRing F] [Fintype F] [DecidableEq F] … (hcard : Fintype.card F = q ^ 2)`).

Claim: the statement meets the gate's statement-hygiene rule.

Witness: the gate, rerun on this head, prints `statement-hygiene: line 146: P3 [Fintype F] beside [Field F] (theorem finite_hermitian_isometry_formula); repair: use [Finite F]`, then `FAIL`, with exit 1.

Repair: define `hermitianEmbeddingCount` as `Nat.card {X : Matrix (Fin m) (Fin n) A // X.conjTranspose * G * X = B ∧ Function.Injective X.mulVec}` with no `[Fintype A] [DecidableEq A]`. In the theorem use `[Finite F]` and `(hcard : Nat.card F = q ^ 2)`.

Tested on a scratch copy: the repaired definition and theorem elaborate with only the `sorry` warning, and an `example` there proves that the new count equals the old `Fintype.card` count for every `[Fintype A] [DecidableEq A]`.

## R04 (P3) — A roadmap on main cites ids this head no longer has, with no old → new lines

Location: `README.md`, *Scope and ownership* (lines 21–35). There is no line mapping the moved Gram–Hadamard, successive-minima and Minkowski ids.

Claim: every id of this roadmap that other roadmaps cite still resolves, or is mapped.

Witness: DiophantineApproximationAndTranscendence on main (README lines 44–46, 53, 59) cites §0.1 `hermitian_gram_hadamard`, §1.2 `successiveMin`, `successiveMin_isLeast`, §1.3 `minkowski_second_lower`, §1.4 `minkowski_linear_forms` and §1.5 `minkowski_second_upper`. At this head Layer 0 starts at 0.2, §§1.4–1.5 do not exist, and §1.2 covers the squared-norm minima.

Repair: add one line per moved id under *Scope and ownership*:
- §0.1 `hermitian_gram_hadamard` → SuccessiveMinima 0.1.
- §1.2 `successiveMin`, `successiveMin_isLeast`, `exists_successiveMin_witnesses` → SuccessiveMinima Layer 1.
- §1.3 `minkowski_second_lower` → SuccessiveMinima 2.1.
- §1.4 `minkowski_linear_forms` → SuccessiveMinima 2.2.
- §1.5 upper Minkowski → §1.3.3 here.

All of these names resolve in SuccessiveMinima's README and `Suggested.lean` on main. ClassicalArithmeticCompletion's citation of §4.3 (the Jacobi triple product behind `jacobi_product_specialization`) still resolves, at line 1800.

## R05 (P3) — Locators that point at text not containing the statement

Location and witness:
- **4.4.3** (line 1936) cites LLL Proposition 1.11 and itself says the transference bound is not an LLL theorem. Evertse's notes, Theorem 2.20 (`evertse-geometry-of-numbers` line 698, printed p.32), state `1 ≤ λ_i λ*_(n+1−i)` for the Euclidean ball.
- **4.4.1** (line 1915) cites Benoist, pp.5–7. Those pages define lattices in Lie groups and never mention a packing radius (`benoist-2019` lines 123–160).
- **4.4.4** (line 1946) cites "Definition 2, p.2 and Poisson identities p.3". Definition 2 is the covering radius; `ρ_s` and the Poisson identities (1)–(2) are on p.2 (`regev-2004-transference` lines 79–87).
- **4.4.6** (line 1961) gives "p.3" for the same equations.
- **6.2.1** (line 2390) cites "§2.4, printed pp.109–110". Schlichting's §2 has only §§2.1–2.2. The sign-changed duality `(E,*,−η)` first appears on p.123 (`schlichting-2010` line 770).
- **6.2.2** (line 2403) gives "§3.1, printed pp.110,113". §3.1 begins on p.114 (`schlichting-2010` line 411).

Repair:
- 4.4.3: cite Evertse, *Geometry of numbers*, Theorem 2.20 and its proof (printed pp.32–33) for the Euclidean case, and Cassels, *An Introduction to the Geometry of Numbers*, Chapter VIII, Theorem VI, for polar bodies. Drop the LLL sentence.
- 4.4.1: cite Conway–Sloane, Chapter 1, where the packing radius is half the minimal distance.
- 4.4.4: read "p.2, the definition of `ρ_s` and equations (1)–(2)".
- 4.4.6: read "p.2, equations (1)–(2)".
- 6.2.1: read "Definition 2.1 and Example 2.2, printed p.109; the sign-changed duality, p.123".
- 6.2.2: read "Definition 2.4, printed p.110; §3.1, printed p.114".

## R06 (P3) — 6.6.1 restates the definition of a cofinal inclusion, which the README never defines

Location: `README.md` line 2698 ("6.6.1. Prove that for a full extension-closed cofinal inclusion A⊂B, every object X of B admits T with X⊕T in A").

Claim: 6.6.1 is a theorem.

Witness: Schlichting §5.1, p.124 (`schlichting-2010` lines 813–815), defines a fully exact inclusion to be cofinal by exactly this property. No paragraph of the README defines "cofinal", so 6.6.1 either restates a definition or uses an undefined term.

Repair: replace 6.6.1 by a definition, "Define a fully exact inclusion A⊂B to be cofinal when every object of B has a complement T with X⊕T isomorphic to an object of A (Schlichting2010, §5.1, printed p.124)", with three Checks:
- Free modules inside finitely generated projectives are cofinal.
- The zero subcategory of a nonzero category is not cofinal.
- A = B is cofinal.

## R07 (P3) — Checks naming Lean counterparts, a misplaced consumer row, and prose slips

Location and witness:
- The 2.9.6 Check (line 819) ends "the Lean hyperbolic predicate requires 2≠0". `Suggested.lean` declares no such predicate, and a Check never claims a Lean counterpart.
- The infinite-dimensional adjoint Check (line 799) sits under `signedHermitianTwist` after an empty line; it tests the carrier's adjoint.
- The *Consumer interfaces* row on line 235 ("SuccessiveMinima §0.1.2 / `hermitian_gram_hadamard` … RandomMatrices Layer 8") involves neither a supplier nor a consumer of this roadmap.
- Several targets start mid-sentence with a capital: "Prove Under" (line 572), "Prove On" (762, 2848), "Prove Outside" (829), "Prove Dualizing" (2786). Line 2387 has "on an TauCeti.ExactStructure", and line 781 has "base-field units/elements".

Repair:
- Line 819: end the Check at "cannot define a hyperbolic bilinear form in characteristic two".
- Line 799: move that Check to the `SignedHermitianSpace` Checks.
- Line 235: delete the row.
- Lower-case the five verbs, and read "on a Tau Ceti `ExactStructure`".
- Line 781: state Lemma 3.1 of Kurinczuk–Skodlerack–Stevens as "the norms are the elements of `F₀^×` that are squares in `F` at even valuation, together with the negatives of squares in `F` at odd valuation".

## Previous findings

- R01 (r7, the branch's manifest pinned a Tau Ceti older than main's): **repaired**. The branch merged main (`b7f4b52`). `lake-manifest.json` and `lean-toolchain` now equal main's (`git diff origin/main HEAD -- lake-manifest.json lean-toolchain` is empty), with Tau Ceti at `2fd255d` and Mathlib at `1b1ccf4`. `TauCeti.QuadraticMap.map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses` resolves at `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean` line 360. The fourteen other spinor-norm names of *From Tau Ceti* also resolve at this pin.

## Verified sound

**Gate and build.**
- The gate, rerun on this head with the brief's command, ends with `statement-hygiene=1 … FAIL` (exit 1). Every other check is `0`, including `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0` and `depcheck=0`. That failure is R03.
- The worker's `build=2` lines are Lake's advisory that `Mathlib` is a module-system package ("consider adding `module`"). They come from the mandated `import Mathlib` header, not from this file's content, and the Lean form rules leave the author no repair. I therefore record no finding for them.
- `lake env lean` on `Suggested.lean` gives 25 `declaration uses 'sorry'` warnings (lines 85 … 524, one per theorem), no error, exit 0.
- `git diff --stat origin/main...HEAD` outside the folder is empty, and the worktree is clean.

**Dependency check**, verbatim: `depcheck: 240 roadmaps, 2386 edges, 0 problem(s)`. The identical command on the previous head's README prints the same line.

**Signature check and padding probe.**
- The ten "looks dropped" leads of `signatures.md` are false positives. The Ratner hypotheses `hρ`, `hμ`, `hU` and the `hΓ` of the four `SL_n(ℝ)/Γ` theorems are present as anonymous arrows in the elaborated types. `StarBody`, `admissible` and `IsFiniteType` drop only `[FiniteDimensional ℝ E]`, which they do not use, and `criticalDeterminant` and `critical_lattice_exists` carry it.
- The new declarations carry `hN`, `hY` and `[SigmaFinite (intensityMeasure P N)]` (Campbell), `[SigmaFinite Λ]` (Poisson), and `hq`, `hq'`, `hdim` (Arf).
- One-tactic probe on a scratch copy, with every `sorry` replaced by `first | rfl | infer_instance | simp | simp [defs] | ext; simp [defs]`: all 25 theorems fail. The closest is `campbellMeasure_fst`, which leaves `((fun ω => map … (N ω)) ∘ₘ P).fst s = (N ∘ₘ P) s` open. No theorem is padding by that test, though R01 and R02 remove five of them for ownership.

**Library declarations opened at the pins.**
- Tau Ceti `2fd255d`: `Integral/SpinorNorm.lean` line 360 (above). No Arf invariant of quadratic forms, no Wall forms and no stable stem exists in the pinned Mathlib or Tau Ceti. The `Arf` hits are all Hasse–Arf, under `NumberTheory/LocalField/Herbrand`.
- Campbell measures and Poisson random measures are absent from both libraries (the `Campbell` hits are Baker–Campbell–Hausdorff).
- Mathlib `Measure.bind`, `ProbabilityTheory.HasLaw`, `poissonMeasure` and `iIndepFun` elaborate as used.

**Cross-roadmap citations resolved.**
- HomotopySpheres §3A.3 (its README line 749), §7B (lines 2256–2356) and §7C (lines 2360–2405), at the brief's head.
- TangentialBordism `gap:finite-quadratic-arf` (lines 247–261) and B3.2(a) (line 282).
- PointProcesses `Suggested.lean` lines 229–404 and README Layers 2, 4 and 6 (lines 797, 1033, 1276).
- DifferentialGeometry `riemannianDensity` (its `Suggested.lean` line 3246, main).
- SuccessiveMinima `hermitian_gram_hadamard`, `successiveMin_isLeast`, `exists_successiveMin_witnesses`, `minkowski_second_lower` and `minkowski_linear_forms` (main).
- Completed IntegralLattices Layers 1, 2 and 4 (its README lines 162, 227, 293).
- HermitianKTheoryOfPoincareCategories, next in the order, consumes this roadmap's Layer 6 and §6.8a (its README lines 12, 50), so §6.8a has one owner.

**Overlap leads.** `overlaps.md` says IntegralLattices §2F and §7E exist only at the head of its open revision. That is false: main defines both, as bold milestones at IntegralLattices README lines 801 (squared-norm successive minima, values of `β x x`) and 1869 (the archimedean factor). The README's use of them, squared-norm minima and the `SO(n)` volume product, matches main. No open pull request changes this roadmap.

**Ownership against open work.**
- Checked by object with `roadmaps grep` and the given heads. The duplicates found are R01 and R02.
- Ownership of the theta series (ThetaSeries), the successive-minima carrier (SuccessiveMinima) and the orthogonal mass inputs (§3.3, consumed by OrthogonalTamagawaAndLatticeMass) is as stated in *Scope and ownership*.
- Open pull requests named in the brief without a path were not searched beyond `roadmaps grep`.

**Sources read at their locators** (ids are fetch keys; line numbers are into the sources cache).

Layer 0 and Layer 2:
- `horesh-karasik-2023`: Proposition B.4 at line 1375 (published p.1290); Proposition B.5 and Corollary B.6 at lines 1391–1399 (p.1291).
- `emery-kim-2022`: §5.1 at lines 475–493 (pp.10–11); Lemma 5.1 at lines 494–498 (p.11), with `φ_h(e_i)=e_i^* a_i` and inverse `e_i^* ↦ e_i a_i⁻¹`; Lemma 5.2 at lines 504–550 (p.11), giving PID, split order, regular module and `Sp_(2n+2)(R)`.
- `kurinczuk-skodlerack-stevens`: Lemma 3.1 at lines 457–474 (p.10, statement and proof); §3.2 at line 521 (pp.12–13); §3.3 adjoint and twist at lines 610–631 (pp.13–14); Proposition 3.12 at line 650 (p.14); §3.5 at lines 674–692 (p.15); Propositions 3.13–3.14 at lines 694–713 (p.15).

Layer 3:
- `li-zhang-2019`: §3 scope at line 597 (characteristic not two, unramified, residue characteristic 2 allowed); §3.1 at lines 599–613 (pp.15–16); (3.2.0.1)–(3.2.0.2) at lines 618–633 (p.16); `m(a;X)` at line 682 (p.17); Theorem 3.5.1 at line 688 (p.17) and its proof with the count `q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m})` at lines 698–707 (p.18).
- `cho-yamauchi-2020`: Definition 3.1 at line 553 (p.11); Lemma 3.4 at line 621 (p.12); Corollary 3.5 at line 670 (p.13); Theorem 3.9, Lemma 3.10, Corollary 3.11 and Theorem 3.12 at lines 755–790 (p.15); (3.4) at line 821 (p.16).
- `hironaka-2011`: (1.2) at line 104 (p.3); (1.4) at line 164 (p.4); Theorem 2.3 at line 502 (p.10); Theorem 2.6 at line 950 (p.15); Corollary 2.7 at line 1005 (p.16); (5.1) at line 1679 (p.27); Lemma 5.1 and Theorem 5.2 at lines 1709–1736 (p.28); (5.3) and Proposition 5.3 at lines 1781–1789 (p.29); Corollary 5.4 at line 1833 (p.30); Theorem 5.6 at line 1886 (p.31); Remark 5.7 at line 1941 (p.32).
- `duke-1988` p.74 (lines 37–50) treats the theta series of `x²+y²+z²` weighted by spherical harmonics, with `r₃(n)` as coefficients, as cited by 3.4.

Layers 4 and 5:
- `regev-2004-transference`: Definition 2 and Example 1 at lines 54–62 (p.2); Claim 3 and Theorem 4 at lines 63–77 (p.2); (1)–(2) at lines 84–87 (p.2); Lemmas 5–6 (p.3); Lemma 7 (p.4); Corollary 8 and Lemma 9 (p.5); proof of Theorem 4 (pp.5–6).
- `evertse-geometry-of-numbers` Theorem 2.20 at line 698 (p.32).
- `lll-1982` (OCR): (1.2)–(1.4) at lines 73–82 (p.2); (1.6) and (1.7) at lines 96–134 (p.3); (1.11) at line 143 (p.4).

Layer 6:
- `schlichting-2010`, printed page = physical + 104: Definition 2.1 and Example 2.2 at lines 178–196 (p.109); Definitions 2.4–2.5 at lines 205–234 (p.110); §2.2 and Lemma 2.8 at lines 268–293 (pp.111–112); §4.3, Proposition 4.9 and Lemma 4.10 (pp.119–121); Lemma 4.15 (p.123); §5.1 (p.124); Theorem 5.1 (p.126); Corollary 5.2 (p.127); §9.1 and Definition 9.1 (pp.153–155); Lemmas 9.2–9.5 (pp.156–160); Corollary 9.6 (p.161); Definition 9.10, Theorem 9.11 and Remark 9.12 (p.162).
- `barwick-heart` (arXiv v4, numbering identical to the README's author manuscript): Recollection 1.2 and Definition 1.3 (p.4); Definition 3.1 (p.6); Theorem 5.16 and Corollary 5.16.1 (p.19); Theorems 6.1 (p.19), 6.2 (p.20) and 6.4 (p.21).
- `hls-2023`: Theorem 6.1, Proposition 6.2 and Lemma 6.4 (p.16); Propositions 6.6 and 6.8 and Theorem 6.9 (p.17); proofs to p.19.
- `cdh-iii`: Remark R.4 (p.8); Proposition R.6 (p.9); Example 1.1.4 (p.12); Corollary 1.2.12 (p.18); Theorem 1.2.22 (p.21); Corollary 1.3.9 (p.30); Corollary 1.3.14 (pp.31–32); Remark 1.3.16 (p.32); Example 2.3.13 (p.46, the L-groups of `ℤ` and multiplication by 8); Proposition 3.1.14 (p.54); Lemma 3.2.7 (p.58).
- `ranicki-foundations` (arXiv:math/0111315v1) fetched for §2.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3.1 `covolume_projection` | `ℤ²`, `W=ℝ(1,1)`; `W=E`; `W=0` | comap `ℤ(1,1)`, covol `√2`; image `ℤ(1/2,−1/2)`, covol `1/√2 = 1/√2`; `W=E`: 0-space covol `1 = covolΔ/covolΔ`; `W=0`: `covolΔ = covolΔ/1` | holds, matches B.4 for any full Δ | none |
| 0.3.3 `primitive_orthogonal_covolume` | `ℤ²`, `W=ℝ(1,2)`; `W=ℝ(1,1)` | `ℤ(1,2)`, `ℤ(2,−1)`: both `√5`; `ℤ(1,1)`, `ℤ(1,−1)`: both `√2` | holds; B.5's argument works for any self-dual Δ (`Δ*=Δ` replaces `ℤⁿ`) | none |
| 2.3.1–2.3.3 | `ℤ`, `q=x²`; `q=xy` on `ℤ²` | polar `2xy`, dual `½ℤ`, `#L∨/L=2`; `B=polar(q)` even, `L∨=L` | consistent with Completed IntegralLattices Layers 1, 2, 4 | none |
| 2.8.3–2.8.4 | `(f·a)(xb)`; diagonal units `a_i` | `ā f(x) b`; `φ(e_i)=e_i^*a_i`, inverse `e_i^* ↦ e_i a_i⁻¹` | matches Emery–Kim Lemma 5.1 | none |
| 2.8.5 | `O⊗R≅M₂(R)`, rank `r` | `U ≅ Sp_(2r)(R)` | matches Lemma 5.2 (`r=n+1`) | none |
| 2.9.1 norms | ramified `F₀(√π)`, unramified `F₀(√ε)` | ramified: `−π=−(√π)² ∈ N`, units in `N` are unit squares; unramified: every unit is an `F`-square, odd valuation is never `−`square | `(F^{×2}∩even) ∪ (−F^{×2}∩odd)` in both cases | R07 (wording) |
| 2.9.2 | hyperbolic `[[0,1],[ε,0]]` | det `−ε` | holds | none |
| 2.9.3 twist | `h_a(w,v)` with `a*=ηa` | `ε σ(h(v,a*w)) = εη σ(h_a(v,w))`; adjoint `a⁻¹b*a` | ηε-hermitian; matches p.14 | none |
| 2.9.4 Witt group | `⟨1⟩⊥⟨1⟩` | det `1` vs hyperbolic `−1`: zero iff `−1∈N`; order 4 | `C₂×C₂` or `C₄`, Prop 3.12 | none |
| 2.9.6, 2.9.9 | `λ_*(H)`; `W^even`, `W^odd` | `nH`; each coset has 2 elements differing by the maximal element | matches §3.5, Prop 3.14 | none |
| 3.1.1–3.1.2 | `ℤ/3`, `G=B=1`; `G=1,B=0`; `n=0` | 2; representations 1, embeddings 0; 1 | holds | none |
| 3.1.3 `finite_hermitian_isometry_formula` | `n=m=1,a=0`; `a=1`; `q=2`, `m=1,2,3`; `n=1,a=1,m=2`; `n+a>m` | `q+1`; `0`; `3, 8·¾=6, 32·9/8=36`; `q³(1−q⁻²)(1+q⁻¹)=(q²−1)(q+1)`; factor `i=m` vanishes, and radical dim `≤ m−n` | identical to Li–Zhang p.18 count | R03 (form only) |
| 3.2.1 normalized count | `x²=1/ℤ/3`, `N=0,1`; `m=n=1` | `2`; `2/3`; exponent `N`, not `2N` | holds (total function) | none |
| 3.2.4/3.2.6 | rank one, valuation `a=1,2,3` | overlattice sums `1−X`; `1−X+X²`; `(1−X)+X²(1−X)` | `Σ(−X)^i`, Li–Zhang Ex. 3.5.2 | none |
| 3.2.5 weight | `a=0,1,2` | `−m′(1)=0, 1, 1+q` | matches `m(a)` | none |
| 3.2.7 and `g_T` | `n=1,a=1,2` | `qY(1+q·q⁻²Y⁻¹)=1+qY`; `D=1−X`; `(−1)^{a(n−1)}q^{an}(−q)^{−na}=(−1)^a` | equals Hironaka Thm 5.6 after cancelling `f_n` | none |
| norm Gaussian | `e=1`, `q=2` | `(1+(q+1)(−1))/q² = −1/q = −½` | `(−q)^{−e}` | none |
| finite Fourier count | `F₄`, `N(x)=1`; `T=0` | `3/2 = 1+(−1)(−½)`; `1/2 = 1−½` | holds | none |
| 3.4 theta | `ℤ`, `ℤ²`, rank 0 | coefficients `2,0,0,2`; `4,4`; `1` | holds | none |
| Layer 3 example | `x²+y²=3` over `ℚ₃(i)` | one solution mod 3 (`x=0`), none mod 9 | density 0 | none |
| 4.4.1–4.4.2 | `aℤ`; `ℤ²` | packing `a/2`, covering `a/2`; `½` vs `√2/2` | holds | R05 (locator) |
| 4.4.3 polar lower bound | box `∏[−a_i,a_i]` | `λ_i(K)=1/a_(n+1−i)`, `λ_(n+1−i)(K°)=a_(n+1−i)`, product 1 | holds | R05 (locator) |
| 4.4.6–4.4.8 | `ℤ`, `u=½` | odd dual terms change sign: shifted < unshifted | matches Regev (1)–(2), Lemmas 5–6 | R05 (page) |
| 4.4.12 | `x=c^n`, `R≤x/(1−x)` | `1−R > x(1+R) ⟺ x<⅓`; `c=2e^{−3π/4}=0.190` | contradiction valid | none |
| 4.4.13 `euclidean_dual_transference_upper` | `aℤ`; hexagonal; `b(¾)³`; tail | 1; `2/√3≤2`; `0.529³=0.148<0.15`; `e^{−π/3}+0.190³=0.358<0.4` | holds; README target | none |
| 4.4.14 | `aℤ`; `ℤⁿ` | `1/2`; `√n/2 ≤ n` | Regev Thm 4 with `Λ=L*`, Claim 3 | none |
| 5.1 `IsLLLReduced`, 5.1.3 | `((1,0),(½,1))`; `((2,0),(1,1))`; GS lengths `1, ½` | `1 ≥ (¾−¼)·1`; `1 ≥ 2` fails; `1 ≤ 2·½` | equality case attained | none |
| 5.1.4 `lll_short_vector_factor` | basis above; `n=1` | `1 ≤ 2·1`; factor `2⁰` | LLL (1.11) | none |
| 6.1b Checks | cofiber of 2 in `Perf(ℤ)`; `Perf(ℤ)→Perf(ℤ[½])`; `(ℤ/2)²⊕ℤ/3`; `C₃` rotation | `[ℤ/2]=0`; cone of 2 dies, cone of 3 survives; multiplicities 2, 1; `End=ℂ`, multiplicity 1 | holds | none |
| 6.2 Checks | `F₂`, `b=xy`; `H(ℤ)` | `−1=1`, `b(1,1)=1`, not alternating; Gram `[[0,1],[1,0]]` | holds | R07 (one Check names Lean) |
| 6.4.2a | `(ℝ,2xy)`; `(F₃,2xy)`, `(F₃,xy)` | `⟨1⟩`; `⟨1⟩`, `⟨2⟩`, distinct since `−1` is not a square mod 3 | holds | none |
| 6.4.6 | field, trivial `D` | `FH[X]=[X]+[DX]=2[X]` | holds | none |
| 6.6.4 | Corollary 5.2 | `GW_i` iso for `i≥1`, mono for `i=0` | as stated | R06 (6.6.1) |
| 6.7.16, 6.7.18–6.7.19 | `id⊥T≅T` in `GW₀`; `π_iΩGW=GW_(i+1)` | `[X]+[TX]=[TX] ⇒ [X]=0`; loop removes `GW₀` | matches Cor 9.6, Thm 9.11, Rem 9.12 | none |
| 6.10a ranges and groups | `i=−2, 0, 2, −4, −6, 1` | `Lq₋₂=ℤ/2`, `Lgs₋₂=0`; `×8`; `Ls₂=0`; `×8`; `Lgs₋₆=ℤ/2→0`; `Lgs₁=Ls₁=ℤ/2` | agrees with CDH III Ex. 2.3.13 and Cor. 1.3.14 sharpened | R01 (suppliers) |
| `atomic_normal_form` | zero form rank 2; `xy/ℤ₂` | `s=0, z=2`; one block, `v(1)=0<v(0)=∞` | holds in every characteristic | none |
| `davenport_multiset_estimate` | `n=1` | `sSup ∅=0`, bound `C·max 1 0=C` | holds | none |
| `howe_moore`, `moore_ergodicity` | `SL₂(ℝ)`; horocycle `N` | finite centre, simple, noncompact; `N` closed noncompact, ergodic | correct hypotheses | none |
| Ratner 4.2.4–4.2.6 | periodic horocycle; identity flow | `L=N`, `ν` uniform on orbit; average `f(x)` | holds | none |
| `dani_margulis_nondivergence` | `u≡1` | occupation `T ≥ (1−ε)T` | holds | none |
| `oppenheim_values` | `x²+y²−√2z²`; `x²+y²−z²`; `n=2` | dense; values in `ℤ`, excluded by `hirr`; `x²−α²y²` with α badly approximable is bounded away from 0 | hypotheses load-bearing | none |
| `three_square_hurwitz` | `n=1,2,3,7` | `12(½−0)=6`; `12(1−0)=12`; `12(4/3−2/3)=8`; `12(2−2)=0` | holds | none |
| `siegel_three_square_lower_bound`, `duke_sphere_equidistribution` | `n≡7 (8)` | shell empty, `0/0`, excluded by the filter | denominators nonzero on the filter (Legendre) | none |
| `mahler_relativelyCompact_iff` | `diag(t,1/t)ℤ²`, `t→0` | first minimum `t→0`; not relatively compact | both sides false | none |
| `critical_lattice_exists` | disc | hexagonal, `Δ=√3/2` | attained | none |
| `siegel_mean_value` | `n=1`, `1_{[−½,½]}` | `0` vs `1`, excluded by `n≥2` | hypothesis load-bearing | none |
| `campbellMeasure_fst`, `lintegral_campbellMeasure` | `N≡μ`; `N=δ_Z`; `g=1_{A×B}` | `μ`; law of `Z`; `∫N(A)1_{Y∈B}dP` both sides | true (the a.e.-measurability adapter of line 1513 makes the bind well defined) | R02 (owner) |
| `exists_unique_poissonLaw` | `Λ=0`; `Λ=2δ_x`; `K(δ_a+δ_b)` | `δ_0`; `Kδ_x`, `K~Po(2)`; counts equal, not independent | true; non-example excluded | R02 (owner) |
| `arfMajority` and the two Arf theorems | `xy`; `x²+xy+y²`; dim 0; `H⊕H` vs `H` | ones `1/4` → 0, Lagrangian `⟨(1,0)⟩`; ones `3/4` → 1, no q-zero line; `1<0` false → 0, `L=0`; Arf both 0 but dims 4 ≠ 2 | true; `hdim` load-bearing | R01 (owner) |
| Wall forms (§6.8) | `H₋₁` with `μ(e)=μ(f)=1`; `μ(x+2y)` | `a²+ab+b²` odd for coprime `(a,b)`; `μ(x)+4μ(y)+2λ(x,y) ≡ μ(x)` | correct, but planned in HomotopySpheres §7B–7C | R01 |

## Not verifiable

- Ranicki 1981 (6.10a, §4.3, Proposition 4.3.1, pp.418–420): the author-hosted `exact.pdf` was fetched with the author-page licence class, but the service did not finish within the 10-minute limit, so the locator is unchecked.
- Couveignes 2020 (0.3.3, p.493): the service refused the Annals host (no licence class). Not read; the README cites it only as a use of the standard-lattice case.
- Last–Penrose 2017 and Kallenberg 2017 (§4.2): only the Cambridge and Springer landing pages were reached, and the service found no open copy. Their locators matter only for material R02 asks to delete.
- Wall, *Surgery on Compact Manifolds*; Ranicki, *Algebraic L-theory I*; Kervaire–Milnor 1963; Arf 1941; Browder 1969; Cassels: not fetched. They support the §6.8 paragraphs that R01 deletes, or a repair locator.
- Quillen, *Higher algebraic K-theory I*, §5, Theorem 4 and Corollary 1 (6.1b dévissage): no open copy named in *References*; not read.
- Banaszczyk 1993, Iwaniec 1987, Siegel 1945 and 1935, Davenport 1951, Margulis–Tomanov 1994, Lindenstrauss 2001, Weil 1965, Sansuc 1981, Gross–Gan 1999, Rognes–Weibel 2000, Quillen 1972, Schlichting 2004, Segal 1974, McDuff–Segal 1976, Waldhausen 1985, Friedlander 1976, Conway–Sloane and Platonov–Rapinchuk–Rapinchuk 2023: paywalled or books. They are cited by locator, as in the earlier full reviews, and none is a locator of the sampled targets, except Banaszczyk for 4.4.13, whose statement I checked against Regev's account on p.1 (`regev-2004-transference` line 31).

## Source issues

- **Misprint** in schlichting-2010 at Remark 9.12, printed p.162: the source says the idempotent-completion map is an equivalence by cofinality, citing a theorem 5.2; it should cite Corollary 5.2 (Theorem 5.1 concerns `Qʰ`, and there is no Theorem 5.2); affects nothing.
