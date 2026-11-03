# Review of LatticePackingsAndPerfectForms (pull request #1723 at 5e4d25b)

**Verdict:** needs changes

## R01 (P2) — The strict covering inequality in rank ≥ 2 is not supplied by 1.4 and 1.7

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:873–874: "with equality exactly in rank `1` when n > 0 (in rank `≥ 2` the packing balls have density `< 1` by 1.4 and 1.7, so they do not cover)".

**Claim:** The route for `packingRadius A < coveringRadius A` when `n ≥ 2` rests on a strict density bound that neither cited milestone provides. 1.4 proves `density A ≤ 1` by disjointness; 1.7 proves Minkowski's bound, and the density it yields is not strict.

**Witness:** With `γ ≤ cₙ = (4/π)Γ(n/2+1)^{2/n}` from 1.7, `Δ = Vₙ(γ/4)^{n/2} ≤ Vₙ(cₙ/4)^{n/2} = Γ(n/2+1)/π^{n/2} · Vₙ = 1` exactly; computed 1.000 for n = 1, 2, 3, 4, 8, 24. Mathlib's theorem is strict in the volume hypothesis, so a packing of density exactly one is not excluded by it.

**Repair:** Keep the statement and replace the parenthetical by an argument the roadmap owns: by 3.1 the Voronoi cell is a bounded intersection of finitely many half-spaces containing the open ball of radius `ρ`; if `μ = ρ` then the cell lies in the closed ball of radius `ρ`, so the cell is that ball, which is not a polytope for `n ≥ 2` (a bounded polytope's boundary contains a flat `(n−1)`-dimensional face, a sphere contains none). Hence `ρ < μ` for `n ≥ 2`, and `Δ < 1` follows from it, not the other way round. On `I₂`: `ρ = 1/2`, `μ = √2/2`, the cell is the square; on `[4]`: `ρ = μ = 1`, the cell is an interval. Add the `I₂` pair as the discriminating Check for the strict inequality.

## R02 (P3) — A Mathlib declaration cited in 1.8 does not exist at the pin

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:692 and 737: "*Needs:* M `Int.exists_two_mul_abs_sub_mul_le`".

**Claim:** No declaration of that name exists in the pinned Mathlib (grep over the whole tree returns nothing for `exists_two_mul_abs` or `two_mul_abs_sub`).

**Witness:** The rounding fact Hermite's induction uses is `abs_sub_round (x : α) : |x - round x| ≤ 1 / 2`, at Mathlib/Algebra/Order/Round.lean:193.

**Repair:** Cite `abs_sub_round` (or `Int.fract` bounds) in the 1.8 Needs line and the Layer 1 dependency table; the proof route is unchanged (`2|a₁₂| ≤ a₁₁` after replacing `e₂` by `e₂ − round(a₁₂/a₁₁)e₁`, which for `[[2,1],[1,3]]` gives `2·1 ≤ 2`).

## R03 (P3) — The dual-lattice isometry of 0.5 is cited to the wrong Theta Series milestone

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:474–475 and 490: "its inverse is y ↦ A⁻¹y (TS 2A)"; "*Needs:* … TS 2A".

**Claim:** Theta Series 2A is "Predicates and their equivalences" (integrality, evenness, unimodularity; TauCetiRoadmap/ThetaSeries/README.md:489). The dual lattice and its involution are Theta Series Layer 1 (`dual`, `dual_dual`; TauCetiRoadmap/ThetaSeries/Suggested.lean:45) and the scaling law `(c • L)^∨ = c⁻¹ • L^∨` is 2B (README.md:494).

**Witness:** For `A = [4]` the dual generator `1/4` has `A`-norm `1/4`; `x ↦ Ax` sends it to `1 ∈ ℤ`, of `A⁻¹`-norm `1/4`. Nothing in 2A mentions a dual.

**Repair:** Cite "TS Layer 1 `dual`, 2B" in the sentence, the Needs line and the Layer 0 dependency row.

## R04 (P3) — Three dependency-table rows disagree with their Needs lines

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1290 (4.10 row), 1653 (6.3 row), 1654 (6.4 row), against the Needs lines at 1228, 1597 and 1627–1631.

**Claim:** The 4.10 row lists `T IsPosDef.finite_isometry; L 0.2, 2.1, 2.2, 4.1, 4.3, 4.5, 4.9` while the Needs line lists `2.2, 4.5, 4.6, 4.9` and Completed IntegralLattices Layer 5; the 6.3 row adds `IL 9B` that the Needs line does not name; the 6.4 row (`T IsEven; L 6.1, 6.2, 6.3`) omits ThetaSeries §5, ModularForms Layers 0, 2, 4, 5, WeightsInEtaleCohomology §6.1, IntegralLattices §4A and GlobalQuadraticForms §6.1 that the Needs line names.

**Witness:** The dependency check reads Needs lines (it reports `0 problem(s)`), so no supplier edge is hidden, but a reader of the table alone would not see 4.6 under 4.10 or the modular-form inputs under 6.4.

**Repair:** Make each row the exact content of its Needs line; drop `IL 9B` from 6.3 unless 6.3 consumes it.

## R05 (P3) — The rationality locator points to a definition, not the statement

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:963–965: "**rationality**: a perfect form with `min A = 1` has rational entries … (0.1; Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3, §1, p.2)".

**Claim:** dsv2007 lines 60–62 (p.2) define perfection as uniqueness of the solution `B = A` of `vᵀBv = λ(A)`, `v ∈ Min(A)`; the page states neither rationality nor similarity to a primitive integral form. The same locator is used at 1020–1021 for "critical ⇒ extreme", which p.2 does support through `γ_d = max γ`.

**Witness:** dsv2007 lines 52–71 contain the definitions of minimum, Hermite invariant, perfect, eutactic, extreme and Voronoi's theorem; the word rational does not occur there.

**Repair:** Write "by the unique-solution definition (Dutour Sikirić–Schürmann–Vallentin, §1, p.2) the entries of `A` solve an integer linear system, so are rational", i.e. cite the definition for what it is and leave the deduction as this roadmap's own; or add the Martinet locator as uncertified.

## Verified sound

Full review of the 1,951-line README and 746-line Lean file at head 5e4d25b9e23f0bcf525faa4bee4bdfbfd08a061e. The worktree is clean, `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds only README.md, Suggested.lean and metadata.toml (`topic = "math.MG"`). Helpers were not used; every source line and library declaration below was read by me.

**Previous review (r2 at 74904bb), finding by finding.**

| r2 finding | Passage at 5e4d25b | Assessment and recomputed control |
| --- | --- | --- |
| R01 (P1) spanning shell | 4.4 README:1039–1042 "choose C ≥ 0 with C ≥ A[eᵢ] … finite sublevel … acts faithfully by permutations" | Repaired. For `A = [[1,√2/10],[√2/10,√3]]`: det = √3 − 1/50 = 1.71205 > 0; sublevel `A[x] ≤ √3` computed as {0, ±e₁, ±e₂} (norms 0, 1, 1, 1.7321, 1.7321), span dimension 2; each nonzero shell is a ± pair. The Check at 1060–1063 records this instance. |
| R02 (P1) bcc scaling | README:1861 "the dual of `A₃` with its bilinear form multiplied by 8"; 1871–1874 | Repaired. Computed `Uᵀ(8A₃⁻¹)U = [[6,−2,−2],[−2,6,−2],[−2,−2,6]]` with `det U = −1`, det 128, minimum 6, 8 minimal vectors; the rejected scale 2 gives det 2, min 3/2 as the README now says. |
| R03 (P2) omitted headlines | Lean 383–409 five class counts; 651–654 `min_tensor_kitaoka` | Repaired. Counts 2, 3, 7, 33, 10916 agree with dsv2007 Table 1 (lines 87–95) and Theorem 1.1 (line 107). `A₂ ⊗ A₂`: Kronecker Gram `[[4,2,2,1],[2,4,1,2],[2,1,4,2],[1,2,2,4]]`, det 81, min 4 = 2·2, 18 minimal vectors. |
| R04 (P2) discriminant convention | README:1791 "`q_L(x) = x²/(2m) mod ℤ`"; Check 1806–1808 | Repaired. Gram [8]: `q(e/8) = (1/2)(1/8) = 1/16`; `u = 3` gives 9/16 ≠ 1/16 though `b` is preserved (9/8 ≡ 1/8 mod 1); residues {1,7}, index 1. |
| R05 (P2) sphere radius | README:207–208 "for r ≥ 0 … σ₀ is the point mass at zero"; 1300; Check 1321–1323 | Repaired. In ℝ: σ₁ masses 1/2, 1/2; σ₀ = δ₀; r = −1 excluded. Lean `IsSphericalDesign` forces `r ≥ 0` through `‖x‖ = r` on a nonempty set. |
| R06 (P2) degree-zero theta | README:1444–1446 "`Θ_{L,c} = c · Θ_L`"; Check 1463–1464 | Repaired. P = 2 on E₈: constant 2, norm-two coefficient 480 = 2·240; P = 1 recovers Θ_L. |
| R07 (P2) Venkov range | README:1478 "throughout the stated range"; Check 1493–1496 | Repaired. n = 24: weights 14, 16, 18, 20, 22 have cusp dimensions 0, 1, 1, 1, 1 < 2; weight 24 has 2 (d = 12 fails), weight 26 has 1 (d = 14 vanishes), matching Venkov Remark 16.5 (venkov2001 lines 8401–8408: degree t + 3). |
| R08 (P3) locators | 4.1/4.3/4.5 DSV p.2; 4.5/4.7 Ash §4 p.1052; 6.3 Bhargava §6(ii)–(iii) p.31; 4.11 CKMRV §§2–4 and Appendix A; 7.2 Coulangeon–Nebe | Repaired except the precision point in R05 above. Each new locator was opened (table below). |
| R09 (P3) supplier locators | README:92, 317 "§6G"; 783 and Lean 228 "GoN 4.5.8"; 1228 "Completed/IntegralLattices Layer 5" | Repaired. IL §6G (IntegralLattices/README.md:1680) is the `O(E₈)`/240-root milestone; GoN 4.5.8 (open head, line 2070) is `mahler_compactness`; Completed IL Layer 5 (Completed/IntegralLattices/README.md:327) and the pinned TypeA/TypeD/TypeE modules supply the root lattices. |
| R10 (P3) Checks | 1.5 Checks 636–637; 4.9 Checks 1178–1188 | Repaired. diag(1,1,4): γ = 4^(−1/3) = 0.62996, dual 4^(−2/3) = 0.39685, γ′ = 0.5; A₂ dual γ = 2/√3. A₂ neighbour: admissible t ∈ [0,2] (min 2 at t = 0, 1, 2; min 1 at t = 2.5), endpoint det 3, new minimal vectors ±(1,1). |
| R11 (P3) decidability | README:1522–1524 "representation is equivalent to the existence of a vector of the specified norm"; 1204 "not enumeration procedures" | Repaired. No decision procedure remains as a deliverable. |
| R12 (P3) knowl attribution | README:177–178 "radius √2/2 gives π⁴/384, whereas radius 1 would give π⁴/24 > 1" | Repaired. π⁴/384 = 0.253670; π⁴/24 = 4.058712. |

**Principles, gate, dependency check, elaboration.** No route-specific shortcut, re-planned roadmap, copied passage, executable algorithm, sorry'd data, `set_option`, foreign-roadmap import or pull-request number was found. The gate output supplied for this head:

```text
gate LatticePackingsAndPerfectForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The dependency check, rerun with the candidate order (the roadmap sits at line 133 of it):

```text
depcheck: 204 roadmaps, 1617 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; no gap is declared (no plan.json). Direct `lake env lean` on Suggested.lean: exit 0, 52 warnings, all `declaration uses 'sorry'`, matching the 52 `sorry` tokens in the file. A scratch copy with `#check @name` appended for all 112 declarations elaborated with the same 52 warnings and printed 112 types; I compared each with its README statement. The one scanner lead (`polynomialsOfDegreeLE` without `[FiniteDimensional ℝ E]`, `[MeasurableSpace E]`, `[BorelSpace E]`) is harmless: the span of the functions `⟪a,·⟫^k` needs only the inner product; `IsSphericalDesign` keeps all three. The new declarations elaborate to `Nat.card ↑(Set.range fun A => Quot.mk Similar ↑A) = 2` (…3, 7, 33, 10916) and to `C.min = A.min * B.min` under `C.1 = reindex finProdFinEquiv finProdFinEquiv (A.1 ⊗ₖ B.1)` and `n ≤ 43`. No binder repair is needed.

**Padding probe.** A scratch copy replacing every `sorry` by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry` elaborated with exactly 52 sorry warnings: none of the 52 admitted statements closes by one of these tactics. Reading the pinned libraries for a single-lemma closure: `finite_minimalVectors` follows from the file's own `finite_setOf_eval_le` plus a subset argument, not from a library lemma; `summable_harmonicTheta`, `exists_isDeepHole`, `stdLattice_eq_span` (proved, used for the two instances) are infrastructure the headlines need. No padding finding.

**Headline inventory.** From the README: Minkowski and Hermite bounds for real forms (1.7, 1.8); attainment and Mordell (2.1–2.2); γ₁, γ₂, γ₃ (2.3); γ₄–γ₈ and the class counts (4.10); γ₂₄ with the Cohn–Elkies lattice bound and the dimension-24 auxiliary function (4.11); Voronoi cell compactness and fundamental domain, deep holes at vertices, covering density ≥ 1 (3.1–3.2); determination by minimal vectors, Korkine–Zolotarev, rationality (4.1); Voronoi's theorem (4.5); finiteness of perfect and eutactic classes (4.6–4.7); neighbour perfection and completeness (4.9–4.10); moment criterion (5.2); strongly eutactic ⇔ 2-design, strongly perfect ⇒ perfect (5.3); harmonic Gaussian Fourier identity, harmonic theta cusp form, Venkov (5.5–5.7); rank ≤ 3 non-universality, 15 and 290 theorems (6.1–6.4); Kitaoka (7.2); rank-one Festi–Veniani index (7.5). All are stated in Suggested.lean. The docstring names the not-statable ones: the bundled integral tensor product and its decomposition API (7.1, 7.3) and the Leech covering radius and deep holes (3.4), each with the missing carrier. The bridge statements `minimum_eq_min`, `kissingNumber_eq_kissingNumber`, `gramForm_eq_actGL` are the dictionary the LMFDB columns rest on.

**Computed adversarial pass.** `A₂ = [[2,1],[1,2]]`, `A₃ = [[2,1,0],[1,2,1],[0,1,2]]`, `B = [[2,1],[1,3]]`, `I₂`, `Q(A) = Σ_{x∈S(A)} xxᵀ`. Shell searches are exact over boxes of radius 3 (radius 2 for the rank-4 Kronecker form). Class counts are source checks, not re-enumerations.

| Statement / API | Instances | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| 0.1 action and similarity | I₂, U = [[1,1],[0,1]]; [2], [6] | UᵀU = [[1,1],[1,2]], det 1; [6] = 3·[2] similar, not GL₁-congruent; kissing numbers I₂: 4, A₂: 6 | Pass |
| 0.1 primitive representative | [4], rank 0 | [4] → [1]; empty gcd 0 excludes rank 0 | Pass: positive rank in hypothesis |
| 0.2 gramForm positivity | Gram [2], [0], empty | [2] PD; [0] not; empty PD (det 1) | Pass |
| 0.3 covolume | [4], I₂, rank 0 | √4 = 2 = interval volume; 1; 1 = √det [] | Pass |
| 0.4 shell comparison | [1] t = −1, 0; [2] t = 2 | cards 0 (sphere of radius √(−1) excluded), 1, 2 | Pass: t ≥ 0 guard |
| 0.5 dual, inverse action | A = [4]; I₂ with U | dual generator 1/4 ↦ 1, both norms 1/4; (UᵀU)⁻¹ = [[2,−1],[−1,1]] = U⁻¹U⁻ᵀ | Pass; locator R03 |
| 0.5 block sums | [2]⊕[3], empty⊕[3] | det 6, (1,1) ↦ 5; [3] | Pass |
| 1.1 minimum, shells | diag(1,4), I₂, rank 0, [1] sublevels | min 1, S = {±e₁}, kiss 2, span dim 1; I₂ kiss 4; min 0, S = ∅; sublevels C = −1, 0, 1: ∅, {0}, {−1,0,1} | Pass |
| 1.2 native comparison | Gram [2], diag(1,4), rank 0 | minima 2 = 2, kissing 2 = 2; lengths 1, 2 square to 1, 4; 0 = 0 | Pass |
| 1.4 Vₙ and densities | n = 0,1,2,3,4,8,24; [4]; I₂; 4I₂ | Vₙ = 1, 2, π, 4π/3, π²/2, π⁴/24, π¹²/12! = 0.0019296; ρ = 1, δ = 1/2, Δ = 1; ρ = 1/2, Δ = π/4 → 4I₂: ρ = 1, Δ = π/4 | Pass |
| 1.4 density_le_one at n = 0 | empty form | V₀ = 1, δ = 0⁰/1 = 1, Δ = 1 ≤ 1 | Pass: no hn needed |
| 1.5 Hermite / center density | diag(1,4), [4], A₂ | γ = 1/2, δ = 1/8 = (γ/4)¹, Δ = π/8 = 0.392699; γ = 1, δ = 1/2 = (1/4)^{1/2}; γ = 2/√3 | Pass |
| 1.5 Bergé–Martinet | I₂, diag(1,1,4), A₂ | 1; γ = 0.62996, γ(dual) = 0.39685, γ′ = 0.5; γ′ = 2/√3 = 1.1547 | Pass |
| 1.6 integral comparison | [4], diag(1,4), A₂ | native minima 4; 1, 4 vs lengths 2; 1, 2; Hermite 2/√3 both | Pass; pinned `minimum_le_rpow_mul_determinant_rpow` at PosDef/Hermite.lean:81 |
| 1.7 Minkowski | n = 1; [4]; I₂ | (4/π)Γ(3/2)² = 1.0000 = γ₁; (min)^{n/2}Vₙ = 4 = 2√det; π < 4 | Pass |
| 1.7 derived density | n = 1,2,3,4,8,24 | Vₙ(cₙ/4)^{n/2} = 1.000 each | Bound is exactly 1: R01 |
| 1.8 Hermite | [4], A₂, I₂ | 1 ≤ 1; 2/√3 = (4/3)^{1/2}; 1 < 1.1547 | Pass; Needs name R02 |
| 1.8 Hermite-derived density | n = 2,3,4,8,12,20 | 0.9069, 0.8061, 0.7311, 0.8898, 4.327, 18210 | Not a route to Δ < 1 in high rank: R01 |
| 1.9 reduced family | diag(1/t,t), η = 1/4 | min 1/t ≥ 1/4 iff t ≤ 4; t = 5 fails | Pass |
| 2.1 range, Mordell | I₂, diag(1,4); n = 2, 3 | 1 ∈ range, 1/2 ∈ range; γ₂⁰ = 1 = γ₁; 2^{1/3} = 1.2599 ≤ 4/3 | Pass |
| 2.1 critical predicate | A₂, [a], I₂ | 2/√3 = γ₂; 1 = γ₁; 1 < γ₂ | Pass |
| 2.2 attainment cutoff | ε = γₙ | η = 0 admits diag(1/t,t) unbounded | Pass: ε < γₙ needed |
| 2.3 values | [a], A₂, A₃, I₃ | 1; 4/3; 8/4 = 2; 1 < 2 | Pass |
| 3.1 cell, relevant vectors | [4], I₂, A₂ | interval [−1/2,1/2] of volume 2; square of volume 1; coset e₁+2ℤ² shortest {±e₁} norm 1 (next 5); coset (1,1)+2ℤ² four shortest norm 2; A₂ coset e₁−e₂+2ℤ² shortest ±(e₁−e₂) norm 2, next ±(e₁+e₂) norm 6 | Pass |
| 3.2 radii | [4], I₂, rank 0 | ρ = μ = 1; ρ = 1/2 < μ = √2/2 = 0.7071, Θ = π/2; 0 = 0 | Statement passes; route R01 |
| 3.3 Jarník | diag(1,4), [4], I₂ | 1 ≤ √5/2 ≤ 3/2 ≤ 2; 1 = 1 = 1; sublattice (1,1),(1,−1) bound √2 ≥ √2/2 | Pass |
| 3.4 covering values | I₃, A₂, Λ₂₄, rank 1, rank 0 | √3/2, π√3/2; √(2/3), 2π/√27; √2, V₂₄·2¹² = 7.903536 = 2¹²π¹²/12!; Θ = 1; Θ = 1·0⁰ = 1 | Pass; Leech text unread |
| 4.1 perfection | I₂, A₂, rank 0, 2A₂ | dims 2 < 3, 3 = 3, 0 = 0; equal shells but minima 2, 4 | Pass |
| 4.1 KZ bound | A₂, D₄, E₈, rank 0 | 6 ≥ 6, 24 ≥ 20, 240 ≥ 72, 0 ≥ 0 | Pass |
| 4.2 eutaxy | I₂, A₂, B, rank 0 | c = 1/2 = 2/(4·1); Q = 6A₂⁻¹, c = 1/6; B: outer products have (2,2)-entry 0, A⁻¹ has 2/5; 0/0 convention | Pass |
| 4.3 extremality | A₂, A(t) = [[1,t],[t,1]] | 2/√3 maximal; γ = 1/√(1−t²) > 1 = γ(I₂) | Pass |
| 4.4 finiteness | irrational A above; [a]; rank 0 | sublevel {0,±e₁,±e₂}, faithful; Aut = {±1}; trivial | Pass |
| 4.4 irreducibility route | A₂, U = [[−1,−1],[0,1]] | QA = 6I; UQ = [[−2,−2],[−2,4]] ≠ QU = [[−4,−6],[2,6]]; UQA = QAU | Pass; Venkov p.21 states the criterion |
| 4.5 Voronoi iff | A₂, I₂, B, rank 0 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; T ↔ T∧T (empty matrix inverse is the empty sum) | Pass |
| 4.6, 4.7 finiteness | n = 0, 1, 2 | 1; 1; perfect 1 (A₂), eutactic 2 (I₂, A₂) | Pass |
| 4.9 facet normal / neighbour | P = A₂, N = [[0,−1],[−1,0]]; N = I₂; 2N | zero shell ±e₁, ±e₂ spans dim 2 = 3 − 1; min(P+tN) = 2 at t = 0, 1, 2 and 1 at t = 2.5, so ρ = 2, neighbour [[2,−1],[−1,2]] det 3 min 2 with ±(1,1); I₂ zero shell ∅; 2N gives ρ = 1 | Pass |
| 4.9 Ryshkov, domain | I₂, A₂/2, I₂/2; A₂ domain | active dims 2 < 3, 3, min 1/2 outside; (1/3)(e₁e₁ᵀ+e₂e₂ᵀ+(e₁−e₂)(e₁−e₂)ᵀ) = A₂⁻¹; I₂ coefficient (1,1,0) boundary; A₂ off-diagonal +1 outside | Pass |
| 4.9 rank one | P = [1], N = [1] | zero shell span 0 = 1 − 1; admissible {0}; ρ = 0 | Pass; no positive step asserted |
| 4.9 PSD normal impossible | n ≥ 2 | a PSD N vanishing on a spanning zero shell is 0, whose zero shell spans dim n(n+1)/2 ≠ n(n+1)/2 − 1 | Pass: ρ finite for facet normals |
| 4.10 completeness | s = ∅, {[1]} | excluded; meets the one class, max γ = 1 | Pass |
| 4.10 class counts | ranks 4–8 | 2, 3, 7, 33, 10916 = dsv2007 Table 1 lines 91–95 | Source check |
| 4.10 sharp values | D₄, D₅, E₆, E₇, E₈ | 2⁴/4 = 4, 2⁵/4 = 8, 2⁶/3 = 64/3, 2⁷/2 = 64, 2⁸/1 = 256 | Pass |
| 4.11 Cohn–Elkies | n = 1, f = (1−x²)e^{−πx²}, r = 1; 3f | f̂(0) = 1 − 1/(2π) = 0.840845; bound 0.594640 ≥ 1/2 = δ(ℤ); 3f same bound | Pass; scaling (r/2)ⁿ from g(x) = f(rx) |
| 4.11 Leech | r = 2, f(0) = f̂(0) = 1 | δ ≤ 1; δ(Λ₂₄) = (√4/2)²⁴ = 1; γ = 4 | Pass |
| 5.1 designs, measure | {±1}, {1}, ∅; σ₁, σ₀, r = −1; Pol₀,₁,₂ on ℝ | averages 0, 1 = sphere 0, 1; fail; excluded; masses 1/2+1/2, 1, 0; dims 1, 2, 3 | Pass |
| 5.2 moments | {±1}; I₂ axes, a = e₁ | 2 = 2; 2 = 4/2; fourth 2 ≠ 3·4/(2·4) = 3/2 | 3-design, not 5 |
| 5.2 k = 0 | antipodal X | j = 0: #X = #X; 1-design automatic | Pass |
| 5.3 strong eutaxy iff 2-design | A₂, B, rank 0 | T, T; F, F; vacuous vs empty shell | Pass: hn |
| 5.3 strongly perfect ⇒ perfect | A₃ vs D₄ | A₃ fourth moment 40 ≠ 192/5; D₄ 48 = 48 | Pass |
| 5.4 Gram Laplacian | A = I: 1, X₀², X₀²−X₁²; diag(1,4); E₈ | 0, 2, 0; 3/2, 0; E₈ Cartan inverse diagonal (4, 8, 14, 30, 20, 12, 6, 2), so X₀²−X₇² ↦ 2·4 − 2·2 = 4 and X₀²−2X₇² ↦ 0 | Pass |
| 5.5 Fourier identity | n = 1, P = x, τ = i; d = 2 | 𝓕(xe^{−πx²}) = −iξe^{−πξ²} = (i/i)^{−1/2}·i^{−1}·ξ·e^{−πξ²}; −1 | Pass |
| 5.6 harmonic theta | E₈: P = 1, 2, 0, odd P | constant terms 1, 2, 0; odd shells cancel | Pass |
| 5.6 rank 0 | L = 0, d > 0 | homogeneous P of positive degree is 0, theta 0 is a cusp form | Pass |
| 5.7 Venkov | (m, r) = (0,1), (0,2), (1,0); n = 24 degrees | t = 7, 3, 11; weights 14–22 cusp dims 0,1,1,1,1 < 2; weight 24 dim 2; weight 26 dim 1 | Pass |
| 6.1 universality | ℤ³, ℤ⁴, A₂, 2I₄, [2] | 7 missed; 7 = 4+1+1+1; norms 2 yes 1 no; half-norm universal, min 2; half-norms u² miss 2 | Pass |
| 6.2 escalation | [1]; 2ℤ⁴; Esc₁ | a ∈ {−1,0,1}, dets 1, 2, 1 → I₂, diag(1,2); rank kept, index 2; nine ternary classes = bhargava2000 line 1481 | Pass |
| 6.3 criterion | diag(1,2,5,5), diag(1,2,5,10) | only miss below 100 is 15; none | Pass |
| 6.4 half-norm | 2I₄, [2], A₂ | all 29 by four squares; half-norm 2 missing; norm 4 missing in A₂ | Pass |
| 7.1 tensor | A₂⊗A₂ | Gram as above, det 81 = 3²·3², rank 4 | Pass |
| 7.2 Kitaoka headline | A₂⊗A₂; [√2]⊗[3]; n = 0 or m = 0; A = B = [2], C = [1] | min 4 = 2·2, 18 minimal vectors; 3√2; `sInf ∅ = 0` gives 0 = 0·min; 1 ≠ 4 excluded by hC | Pass |
| 7.3 decomposability | ℤ⁴, A₂, E₈ vs A₂⊗D₄ | 4 = 2·2; prime rank; det 1 ≠ 1296 | Pass |
| 7.4 composition order | 2I₃, f = (12), g = (23) | (f·g)(e₁/2) = e₂/2, (g·f)(e₁/2) = e₃/2; q(eᵢ/2) = 1/4, b = 1/2; Lean `mul f g := g.trans f` is f ∘ g | Pass |
| 7.5 rank-one index | m = 3, 4, 5, 8, 12, 15 | residues {1,2}, {1,3}, {1,4}, {1,7}, {1,5,7,11}, {1,4,11,14}; indices 1, 1, 1, 1, 2, 2 | Pass |
| 7.5 hypothesis m ≥ 3 | m = 1, 2 | formula gives 0/2 = 0 and 1/2 = 0 while the index is 1 | Pass: hypothesis needed and present |
| worked bcc | displayed Gram | det 128 = 8³/4, min 6 = 8·3/4, 8 minimal vectors | Pass |
| worked E₈ density | E₈ | π⁴/384 = 0.253670 vs radius-1 value 4.058712 | Pass |

63 rows; routine API rows duplicated from r2 are omitted.

**Seeded source sample.** No README target is flagged unverified. All texts were read from the sources cache (ids from the previous round's manifest draft); no manifest was edited.

| Target | Text and locator read | Result |
| --- | --- | --- |
| 0.4 real model | ThetaSeries README:515 (2D), 545 (2G); Suggested.lean:520–526 `RealSpace`, `realModel` | Supplier names and milestones exist; the comparison is this roadmap's. |
| 1.5 covolume / Hermite | dsv2007 lines 52–58 (p.2); Tau Ceti PosDef/Covolume.lean `covolume_range_sq_eq_determinant` | Normalizations agree. |
| 1.6 integral comparison | TauCeti PosDef/Hermite.lean:81, PosDef/SuccessiveMinima.lean:45, PosDef/Minimum.lean:81 | Native statements are the integral cases. |
| 1.7 Minkowski | Mathlib MeasureTheory/Group/GeometryOfNumbers.lean (strict volume), VolumeOfBalls.lean:343 | Supports `≤`; see R01 for strictness. |
| 2.2 attainment | GoN open head line 2070 `mahler_compactness` (n ≥ 2, positive shortest length) | Matches the η cutoff. |
| 3.3 GoN identification | GoN line 1906 `latticeCoveringRadius` (4.4.2); SuccessiveMinima README:488 (1.5 real basis witnesses) | Supports the stated inputs; Gruber–Lekkerkerker unread. |
| 3.4 covering values | formula values recomputed above | Conway–Sloane Ch. 23 unread (Not verifiable). |
| 4.4 automorphisms | venkov2001 lines 2427–2439, printed pp.20–21 (Definition 6.1 and the sentence after it) | The irreducibility criterion for strong eutaxy is stated there, with [M-V] for proofs; Prop. 6.2 (lines 2440–2446) gives the coefficient n/(N(L)|X|) used in 4.2. |
| 4.9 Ryshkov / neighbours | dsv2007 lines 72–84 (domains, tessellation, finiteness) | Supports the domain tiling; Schürmann unread. |
| 4.11 Leech bound | cohnelkies2003 lines 212–221 (Theorem 3.1, p.694); ckmrv2017 lines 60–75 (Theorem 1.2, p.1018), 644–659 (Appendix A, journal pp.1029–1032) | Signs, normalization and the appendix inequalities as cited. |
| 5.2 moment criterion | venkov2001 lines 1175–1200 (Definition 3.1, Theorem 3.2 setup, printed p.11) | Design definition with normalized measure agrees. |
| 5.3 strongly perfect | venkov2001 lines 2463 (Definition 6.3) and 2440–2446 (Prop. 6.2) | Agrees. |
| 5.6 harmonic theta | venkov2001 lines 8251–8259 (Theorem 16.1, p.59) | Weight n/2 + deg P, cusp for deg P > 0. |
| 7.3 tensor decomposability | coulangeonnebe2012 lines 79–86 (Euclidean tensor pairing, Prop. 2.2) | Definition agrees; Kitaoka unread. |
| 7.5 Festi–Veniani index | festiveniani lines 109–120 (§2.1, p.3) | `O(L) → O(L♯)` with `q : L♯ → ℚ/2ℤ`; the ℚ/ℤ adapter is recorded at README:1791. |

Further locators opened: dsv2007 lines 60–71 (perfect, eutactic, extreme, Voronoi's theorem), 87–107 (Table 1, Theorem 1.1, p.3); ash1977 lines 519–530 (§4 Corollary and Theorem 3, printed p.1052); bhargava2000 lines 1459–1481 (§3, printed p.28: two binary and nine ternary escalators) and 1696–1718 (§6(ii)–(iii), printed p.31; page header "ON THE CONWAY-SCHNEEBERGER FIFTEEN THEOREM 31" at line 1689); coulangeonnebe2012 lines 100–113 (Corollary 2.3 citing Kitaoka Theorem 7.1.1 for split minimal vectors when a rank is ≤ 43; Remark 2.4(1): Steinberg, failure from dimension 292); venkov2001 lines 8394–8412 (Theorem 16.4 and Remark 16.5, p.61). The Coulangeon–Nebe setting is Euclidean lattices, so the real-form headline `min_tensor_kitaoka` is at the source's generality.

**Pinned library audit.** Pins from lake-manifest.json: Mathlib and Tau Ceti as supplied. Opened at the pin (paths relative to the library root):

| File:line | Content and boundary |
| --- | --- |
| Mathlib/LinearAlgebra/Matrix/PosDef.lean:181, 456, 550, 579 | `PosDef.transpose`, `posDef_iff_dotProduct_mulVec`, `det_pos`, `PosDef.inv` |
| Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42 | `GeneralLinearGroup` abbrev |
| Mathlib/Algebra/Group/Int/Units.lean:45 | `Int.isUnit_iff` |
| Mathlib/Algebra/Module/ZLattice/Basic.lean:329, 438 | `setFinite_inter` (ProperSpace, finite index), `instIsZLatticeRealSpan` |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean:72, 102, 125 | `covolume`, `covolume_comap`, `covolume_eq_det` |
| Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:307, 343, 359 | `EuclideanSpace.volume_ball`, `InnerProductSpace.volume_ball`, `volume_ball_of_dim_even` |
| Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:51, 72, 142 | `toSphere`, `toSphere_apply_univ'`, `measurePreserving_homeomorphUnitSphereProd` |
| Mathlib/Topology/Order/LocalExtr.lean:55, 67 | `IsLocalMaxOn`, `IsLocalMax` |
| Mathlib/RingTheory/MvPolynomial/Basic.lean:164; Homogeneous.lean:87 | `restrictTotalDegree`, `homogeneousSubmodule` |
| Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean:51 | `fourierTransformCLM` |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:65, 146, 155, 160 | `discriminantEquiv`, odd weight vanishing, weight < 12, weight 12 |
| Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean:63; TensorProduct/Basis.lean:37; Matrix/Kronecker.lean:55 | `tensorDistrib_tmul`, `Basis.tensorProduct`, `kroneckerMap`; `det_kronecker` present in the same file |
| Mathlib/GroupTheory/Index.lean:55; Algebra/Order/Round.lean:193 | `Subgroup.index`; `abs_sub_round` (R02) |
| TauCeti/LinearAlgebra/IntegralLattice/Signature.lean:94 | `IsPosDef` abbrev: the integral form's quadratic map is positive definite |
| TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:261, 281 | `ofGramMatrix`, `ofGramMatrix.basis` |
| TauCeti/LinearAlgebra/IntegralLattice/Gram.lean:78, 193, 248, 326 | `gramMatrix`, `determinant`, `discriminant`, `ofGramMatrixEq` |
| TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:94, 210 | `integralNorm` (full self-pairing), `vectorsOfNorm` |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Minimum.lean:81, 123, 198, 215, 234, 249 | `minimum`, `IsPosSemidef.isLeast_minimum`, `kissingNumber`, `kissingNumber_eq_representationNumber`, `Isometry.minimum_eq`, `Isometry.kissingNumber_eq` |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean:93, 140 | `IsPosDef.finite_vectorsOfNorm`, `IsPosDef.finite_isometry` |
| TauCeti/LinearAlgebra/IntegralLattice/PosDef/{Hermite,SuccessiveMinima,Covolume,RepresentationNumber}.lean:81, 45, 120, 73 | Hermite inequality, `successiveMinimum`, covolume realization, `representationNumber` |
| TauCeti/LinearAlgebra/IntegralLattice/Isometry/Group.lean:100, 155 | `Isometry.det`, `specialOrthogonalGroup` |
| TauCeti/LinearAlgebra/IntegralLattice/Dual/Basic.lean:75; Discriminant/Bilinear.lean:96; Discriminant/Quadratic.lean:122 | `dualCarrier`, `discriminantPairing`, `discriminantQuadraticMap` |
| TauCeti/LinearAlgebra/IntegralLattice/{RankOne.lean:109, RootLattice/TypeA/Basic.lean:106, TypeD/Basic.lean:231, TypeE.lean:111/396/682/744, D8Plus/Basic.lean:164} | `rankOne`, `typeARootLattice`, `checkerboardLattice`, `typeE₆/₇/₈RootLattice`, `minimum_typeE₈RootLattice = 2`, `d8PlusLattice` |
| TauCeti/LinearAlgebra/BilinearForm/Hermite.lean; TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean:41 | module named in 1.8 exists; `mvPolynomialEquivModularForms` |

Every declaration used by Suggested.lean exists by the build; the table covers the prose-only citations. The 16 scanner leads are own theorem names, module references under the T⁺ convention, the planned `kissingNumber_typeE₈RootLattice` (declared "cited in prose only") and database field names; none is a missing library declaration.

**Ownership and supplier order.** `roadmaps grep` over main and the 439 open pull requests for Hermite constant, perfect form, eutactic, covering radius, spherical design, 290, Festi, Kitaoka, Voronoi cell, strongly perfect: every mathematical hit outside this roadmap is a consumer or scope boundary (NumberFieldEnumeration's "Hermite hypothesis" is Hermite's finiteness, not the constant; GoN 4.4.2 is the consumed covering radius; SiegelModularForms names designs as a boundary). GeometryOfNumbersAndQuadraticArithmeticPartII (open head) has no Voronoi, covering, design or perfect-form object. No second owner and no duplicate fully qualified name were found; the board's five packages are unrelated. Cross-roadmap citations resolved this round:

| Supplier and location | Resolved |
| --- | --- |
| TauCetiRoadmap/IntegralLattices/README.md:562, 599, 609, 619, 642, 772–813, 1273, 1655–1680, 2013, 2041 | 0F, 1B–1D, 1G, 2A–2G, 4A, 6C–6G, 9A, 9B all present on main |
| Completed/IntegralLattices/README.md:258, 327 | Layer 3 finite modules, Layer 5 ADE |
| TauCetiRoadmap/ThetaSeries/README.md:423, 489, 494, 515, 545, 673, 949, 966; Suggested.lean:45, 154, 185, 191, 320, 325, 520–521 | Layer 1 `poissonSummation`, `gaussian`, `fourier_gaussian`; 2A (predicates, R03), 2B, 2D, 2G, Layer 5, 8B, 8D; `RealSpace`, `realModel`, `shell`, `repNum` |
| TauCetiRoadmap/Rank24LatticeConstructions/README.md:312, 369 | Layer 6 Leech, minimum 4 |
| TauCetiRoadmap/SuccessiveMinima/README.md:266–300, 488, 658 | Layer 1 (1.1 definition, 1.5 witnesses), 2.1.4 |
| GeometryOfNumbersAndQuadraticArithmetic (open head #851) lines 437, 1711–1727, 1895, 1906, 2030, 2040, 2070, 2167 | 1.3; 4.3 harmonic theory with real parameter t > 0; 4.4.1; 4.4.2; 4.5.1; 4.5.2; 4.5.8; 5.1.4 |
| OrthogonalTamagawaAndLatticeMass (open head #1222) README:523–551 | Layer 4 automorphism orders and class counts |
| TauCetiRoadmap/ModularForms/README.md:259, 327, 383, 532, 638 | Layers 0, 1 (valence formula), 2, 4, 5 |
| WeightsInEtaleCohomology (open head #1001) line 695 | §6.1 Ramanujan bound |
| GlobalQuadraticForms (open head #1200) README:472, 720 | 4.4 Hilbert reciprocity, 6.1 scalar representation |
| EffectiveDiophantineMethods (open head #1046) line 1312 | §1.8 Fincke–Pohst, boundary only |
| TauCetiRoadmap/RepresentationTheory/RootSystems/README.md | exists on main |

All consumed roadmaps precede this one in the candidate order or are on main; IntegralLattices is cited as on main (its open pull request revises an existing roadmap).

## Not verifiable

- **kitaoka1993** (Theorem 7.1.1, Ch. 7): Cambridge landing page only; the rank-43 theorem is checked through Coulangeon–Nebe's statement of it and the `A₂ ⊗ A₂` instance, not from the book.
- **conwaysloane1999** (Ch. 21 §3, Ch. 23) and **cassels1971**: publisher paywalled; the Leech deep-hole classification and covering radius √2 remain uncertified, the covering values were recomputed from the formulas.
- **martinet2003** (Ch. 2 §2.3, Ch. 3 §3.4, Ch. 9, Ch. 16): author-hosted contents only; Mordell's inequality and the reduction theory are checked on instances.
- **steinweiss1971**, **gruber1987**, **schuermann2009**, **voronoi1908**: no legal full text found by the sources service in this or the previous rounds; the five unresolved texts are kept in the missing-references file.
- **LMFDB knowls**: the live site answered with a CAPTCHA last round; no claim about stored values was audited.

## Source issues

- **Error** in dsv2007 at §1, preprint p.2: the source says that `A = PᵀBP` gives `Dom(A) = P Dom(B) Pᵀ`; it should be `P⁻¹ Dom(B) P⁻ᵀ`, since `Min(A) = P⁻¹ Min(B)`; affects a stated result.
- **Misprint** in dsv2007 at §1, preprint p.2: the source says the arithmetically inequivalent perfect forms of a dimension are finitely many; perfection is preserved by positive scaling, so finiteness holds up to similarity or after fixing the minimum; affects a stated result.
- **Misprint** in ash1977 at Theorem 3, printed p.1052: the source counts finitely many Γ-orbits of eutactic and perfect points in the cone, although these properties depend only on the ray, so the count is of ℝ₊Γ-orbits; affects a stated result.
- **Misprint** in ckmrv2017 at Theorem 1.2, printed p.1018: the source types the Schwartz function as a map into ℝⁿ; it is scalar-valued; affects nothing.
