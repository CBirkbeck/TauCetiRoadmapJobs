# Review of StableReductionPartII (pull request #1841 at 64895ca)

**Verdict:** accepted

This is an incremental re-review of the 10 lines changed since 7f77bd8: the second Check of §2.146 (the completed scalar) and the Ile §7 page range at four locator sites. Both repairs are correct, no finding remains from the previous report, and no new finding arose. The gate passes, the dependency check reports no problem, and `Suggested.lean` (unchanged since ef1de05) elaborates with `sorry` as the only warning.

## Previous findings

- R01 — repaired: §2.146's second Check now uses α∈ℤ₂ with α² = −7 and α ≡ 3 (mod 8); it computes the level-3 value (3+6v+4v²)⊗1, separates σ⊗α from ασ⊗1 in R̂⊗_ℤ ℤ₂ by the map x⊗y ↦ ℓ(φ(x))·y, and records that no scalar of ℚ∩ℤ₂ separates.
- R02 — repaired: §§2.236, 2.237, 2.242 and 2.245 (README lines 5419, 5433, 5534, 5582) all read "[ile], §7, pp. 25–26"; no "pp. 25–27" citation of Ile remains (the three surviving "pp. 25–27" strings at lines 104, 285, 6186 cite CLM, the Stacks project and CLM, and are untouched).

## Verified sound

**Gate, dependency check and elaboration.**
- I re-ran the gate at 64895ca. Every check is 0 and the result is OK (set_option, sorry-data, imports, statement-hygiene, readme-ids-missing, depcheck, metadata, stray-files, dirty, outside-folder, source-material). The worker's `gate.md` records build=0 as well.
- The dependency check prints `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StableReductionPartII'` is empty.
- `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` ran in 20 s and printed exactly the five `declaration uses sorry` warnings (lines 122, 139, 148, 155, 171) and nothing else.
- `Suggested.lean` and `lake-manifest.json` are byte-identical at 7f77bd8 and 64895ca: the diff touches only `README.md`. The 13 elaborated signatures in `signatures.md`, the comparison with §§2.7, 2.8, 2.154, 2.170 and 2.225–2.230, and the one-tactic padding probe (all five theorems resist it) carry over unchanged from the two previous reports.

**The repaired Check of §2.146 (README line 3585), computed.**
- Existence of α. The 2-adic square roots of −7 reduce mod 8 to 3 and 5 (mod 16 the roots of x² ≡ 9 are 3, 5, 11, 13; mod 32 the roots of x² ≡ 25 are 5, 11, 21, 27; mod 2²⁰ the two roots are 474955 and 573621 with their negatives, residues 3 and 5 mod 8). So exactly one root is ≡ 3 (mod 8), as the Check says, and −7 is not a rational square, so α∉ℚ.
- The value. α(1+2v+4v²) has coefficients α, 2α, 4α ≡ 3, 6, 4 (mod 8), which is (3+6v+4v²)⊗1 as stated; the same residues as for 1/3 ≡ 3 (mod 8), so the level-3 value of the previous version is unchanged.
- The separation. φ:R̂→ℤ₂ (u,v ↦ 0) is a ℤ₂-algebra map on the restricted power series ring R̂ = lim (ℤ/2ⁿ)[u,v]/(u²) with φ(σ) = 1. ℓ∘φ is additive R̂→ℚ, and (x,y) ↦ ℓ(φ(x))·y is ℤ-bilinear into ℚ₂, so it induces an additive map on R̂⊗_ℤ ℤ₂ (not on R̂⊗_ℤ₂ ℤ₂, since ℓ is not ℤ₂-linear). It sends σ⊗α to ℓ(1)·α = 0 and ασ⊗1 to ℓ(α) = 1. So the two elements differ in R̂⊗_ℤ ℤ₂.
- The components. eₙ⊗id sends σ⊗α to eₙ(σ)⊗α = α·eₙ(σ) and ασ⊗1 to eₙ(ασ)⊗1 = α·eₙ(σ) (eₙ is ℤ₂-linear, §2.115), so their difference is a nonzero element of R̂⊗_ℤ ℤ₂ killed by every component, as the Check says. On the correct point R̂⊗_ℤ₂ ℤ₂ = R̂ the components are the eₙ, jointly injective because R̂ = lim Qₙ.
- The closing sentence. For a = r/s with s odd, s·(σ⊗a) = σ⊗r = s·(aσ⊗1) and s is invertible on R̂⊗_ℤ ℤ₂ (it is invertible on ℤ₂), so σ⊗a = aσ⊗1; the Check's instance 3·(σ⊗(1/3)) = σ⊗1 = 3·((1/3)σ⊗1) is this with s = 3. This agrees with the previous report's witness for R01.
- Consistency. The two remaining uses of 1/3 in the layer, §2.131's Check (line 3268, ρ₃(σ⊗(1/3)) = (3+6v+4v²)⊗1) and §2.164's Check (line 3971, the lift of 1/3 is (1/3)σ⊗1 with level-2 image 3+2v), are value checks and make no separation claim. §2.147's first Check (σ⊗(1,1/3) lifts to (σ,(1/3)σ), level-2 quotients 1+2v and 3+2v) is consistent with §2.146's first Check and with 1/3 ≡ 3 (mod 4).

**The Ile locator (R02), at the source.** `ile line 1247` is the page-25 marker and `ile line 1259` the §7 heading "The stabilisation map"; `ile line 1299` is the page-26 marker and `ile line 1349` the last line of §7; `ile line 1350` is the page-27 marker, followed by the running head at 1351 and "References" at 1352. So §7 is pp. 25–26.

**Seeded sample, where it falls in the changed passages.**
- 2.237 "Global section dual and residue line" (its citation line changed): `knudsen2 lines 471–498` is Lemma 2.2 on printed p. 175 (page marker at line 465), with the stable reflexivity, J′ ≅ J∨ and invertibility of Δ*(J∨/O_X) statements for a Noetherian S and a flat family of reduced curves with at most ordinary double points; `knudsen2 line 501` is Definition 2.3 on printed p. 176 and line 509 the canonical base-change isomorphism for any T→S. `knudsen2012 line 114` is the Main Lemma on p. 3 (same three statements, Noetherian S, geometric fibres reduced with at most ordinary double points), and `knudsen2012 line 525` is "4. Proof of the Main Lemma" on p. 13 (page marker at line 516). The target's hypotheses (S locally Noetherian, C/S flat finitely presented nodal) match the sources' Noetherian, flat, nodal hypotheses locally; the arbitrary base change is the target's own deduction from §2.232, as its proof route states.
- 2.147 "Completed coordinate of a cone lift" (it cites §2.146 and its Checks use the same fixture): its three Checks are recomputed in the table and agree with §2.146's repaired Check; its locator `Mathlib/LinearAlgebra/TensorProduct/Pi.lean` line 140 (`TensorProduct.piScalarRightHom_tmul`, x⊗f ↦ (j ↦ f j • x)) was opened at the pin in the previous report and the file is unchanged.
- The other thirteen seeded targets (1.3, 1.15, 2.36, 2.40, 2.89, 2.114, 2.119, 2.144, 2.156, 2.197, 2.255, 3.14, 6.3) lie outside the changed passages and their suppliers and dependents; under the incremental scope I did not re-read them this round.

**Citations and ownership.**
- `citations.md` has the same single lead as before, `ModuliDescent.polarizedDescentComparison` (README line 183): a target name of AlgebraicModuliForArithmeticGeometry §3.5, an earlier supplier, not a library name.
- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no revision-only id.
- The 28 declared gaps are untouched by the diff and carry over from the first report.

**Adversarial table.** Rows for the changed statements are computed this round; the others are carried forward from PRREVIEW-StableReductionPartII~2 (at 7f77bd8) and ~1 (at ef1de05) because the diff leaves those statements untouched.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §2.146 Check 2 (rewritten) — existence of α | x² ≡ −7 mod 8, 16, 32, 64, 2²⁰ | residues of the roots mod 8: {1,3,5,7} at 8, {3,5} from 16 on; roots mod 2²⁰ are 474955 ≡ 3 and 573621 ≡ 5 (mod 8) with their negatives | α with α ≡ 3 (mod 8) exists |
| §2.146 Check 2 — level-3 value | σ⊗α, level 3 | α·(1,2,4) ≡ (3,6,4) (mod 8); same as 3·(1,2,4) since 1/3 ≡ 3 (mod 8) | (3+6v+4v²)⊗1, correct |
| §2.146 Check 2 — separation in R̂⊗_ℤ ℤ₂ | σ⊗α versus ασ⊗1 under x⊗y ↦ ℓ(φ(x))·y | φ(σ) = 1, ℓ(1) = 0, ℓ(α) = 1: values 0 and 1 | They differ, correct |
| §2.146 Check 2 — components kill the difference | eₙ⊗id, n = 1, 2, 3 | both map to α·eₙ(σ): α, α(1+2v), α(1+2v+4v²) | Nonzero element with all components zero in the wrong model; eₙ jointly injective on R̂ |
| §2.146 Check 2 — ℚ∩ℤ₂ scalars | a = 1/3; general a = r/s, s odd | 3(σ⊗(1/3)) = σ⊗1 = 3((1/3)σ⊗1), 3 invertible on R̂⊗_ℤ ℤ₂; s likewise | No separation by ℤ_(2) scalars, correct |
| §2.146 Checks 1, 3, 4 and API (unchanged text) | as in report ~2 | e₃(σ) = 1+2v+4v², e₂(σ) = 1+2v; N = ℤ/4: stabilises at (1+2v)⊗1̄; N = ℚ₂: all components 0, point R̂[1/2] ≠ 0 | Carried forward |
| §2.147 Checks (seeded, cites §2.146) | r = 2, σ⊗(1,1/3); u⊗(0,1); cone with legs a ↦ a·eₙ(σ)⊗(1,0) | lifts (σ,(1/3)σ), level 2: 1+2v, 3+2v (1/3 ≡ 3 mod 4); lifts (0,u); lifts (σ,0) | Correct, consistent with §2.146 |
| §2.237 (seeded, locator changed) | Lemma 2.2 / Main Lemma hypotheses versus the target's | source: S Noetherian, flat, reduced fibres with ordinary double points; target: S locally Noetherian, flat finitely presented nodal, local statements; `knudsen2 lines 471–478`, `knudsen2012 lines 114–121` | Locators and hypotheses match |
| §§2.236, 2.237, 2.242, 2.245 (Ile locator) | page range of Ile §7 | heading `ile line 1259` (p. 25), last line 1349 (p. 26), References at 1352 (p. 27) | pp. 25–26, correct |
| `nodeSection_universallyExact`, `pointedSection_reflexive`, `pointedSection_universalCoefficients`, `relativelyStablyReflexive_iff_universalCoefficients`, `relativelyStablyReflexive_iff_completion` | as in reports ~1 and ~2 | det Φ̃ = F monic in X; Ker Φ̄ = Im Ψ̄ in the u² = 0 fixture; Tor₁ = 0 since F mod I stays monic; A = R = ℤ_(2), M = R/(2) both sides false; Ext¹ = 𝔽₂ on both sides of the completion | Carried forward, Lean unchanged |
| Other rows (§§2.1, 2.63, 2.73, 2.90, 2.116, 2.120, 2.126, 2.132, 2.148, 2.166, 2.182, 2.192, 2.203, 2.227, 2.253, 3.1, 3.3, 3.13, 4.2, 5.17, 5.19, 7.1, 7.7, Conventions, Deligne pairing, graded determinant, two-ring counterexample) | as in reports ~1 and ~2 | e.g. discriminants 4, 1, 0 (§2.1); 12·2 = 4+20 (§5.19); (−1)^{deg L}; dim M̄₂,₂ = 5 | Carried forward, statements untouched |

**Headline theorems.** Unchanged since the first report: the geometric headlines (§§2.248, 5.19, 6.8, 6.11, 6.20, 7.6–7.7) are not statable at the pins and the module docstring names each; the five local headlines are stated. The diff touches neither the headlines nor the Lean file.

## Not verifiable

- `blr-relative-picard-LwkQQl` (Bosch–Lütkebohmert–Raynaud) and `mc6-fc1990` (Faltings–Chai) are settled as uncertified and cited by locator only; they are outside the changed passages.
- Ownership against open pull requests was checked only through the worker's `overlaps.md` and `citations.md` at the index of 2026-11-07T23:43:04Z; the diff adds no construction, so no new object needed an owner search.

## Source issues

- none
