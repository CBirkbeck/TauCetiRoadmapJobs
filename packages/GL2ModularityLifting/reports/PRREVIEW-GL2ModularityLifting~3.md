# Review of GL2ModularityLifting (pull request #1071 at 21dca94)

**Verdict:** needs changes

This is an incremental re-review: 25 lines in this folder changed since 673cfcb, all in `README.md`. There is one blocking finding. The new supplier contract cites IntegralIwasawaTheory §4.1e and two declarations in it, but that roadmap's head no longer has them (R01). There are four P3 findings:

- the move of abelian Leopoldt to IntegralIwasawaTheory leaves `abelian_leopoldt` in `Suggested.lean` as a restatement of that supplier's target (R02);
- the worker's gate fails `build` on two module-system warnings that come with the new pins (R03);
- the previous review's findings R01 and R02 are not repaired and are carried as R04 and R05.

The previous R03 is repaired. My re-run of the gate at this head printed `OK`. The dependency check reports 0 problems. `lake env lean` gives only the three `sorry` warnings.

## R01 (P1) — IntegralIwasawaTheory §4.1e, `bakerBrumer_expDisc` and `bakerBrumer_expDisc_linearIndependent` do not exist at the supplier's head

**Location.** `TauCetiRoadmap/GL2ModularityLifting/README.md` line 71 ("Brumer's p-adic form of Baker's theorem on the exponential disc, `bakerBrumer_expDisc` and `bakerBrumer_expDisc_linearIndependent` (§4.1e)"). Also line 73 (`*Uses.* §§4.1, 4.1e, 4.2, 4.4`), line 2612 ("The transcendence input is IntegralIwasawaTheory §4.1e, `bakerBrumer_expDisc`"), the §10.7a *Needs:* line 2631, and Layer 10 Dependencies line 2792.

**Claim.** This change replaces the LinearFormsInLogarithms §8.10 contract with an IntegralIwasawaTheory contract. That contract opens with a section and two declarations as if supplied. IntegralIwasawaTheory had them only at ae7b458, and its review found that §§4.1a–4.1e re-planned LinearFormsInLogarithms Layer 8. The next commit, 2266591 ("consume LinearFormsInLogarithms 8.10"), removed them. The current head 78ec69e has §§4.1–4.4 only, and no roadmap at any open head defines `bakerBrumer_expDisc`.

**Witness.** IntegralIwasawaTheory `README.md` at 78ec69e (#1306) has headings §4.1 (line 544), §4.2 (556), §4.3 (564) and §4.4 (576). The strings "4.1e" and `bakerBrumer_expDisc` each occur 0 times. Its §4.2 (line 560) applies LinearFormsInLogarithms §8.10.

**Repair.** This roadmap does not use the exponential-disc theorem itself. It is internal to IntegralIwasawaTheory §4.2, so drop it rather than re-citing LinearFormsInLogarithms:
- Line 71: replace the opening sentence, up to "…linearly independent over the algebraic closure of `ℚ` in that field.", with: "The algebraic-number form of Brumer's p-adic Baker theorem, `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers` (§4.2): for nonzero algebraic numbers in `ℂ_p` with Iwasawa's normalization `log_p p = 0`, logarithms that are independent over `ℚ` are independent over the embedded algebraic numbers." Keep the sentence on §§4.1 and 4.4.
- Line 2612: delete the sentence "The transcendence input is IntegralIwasawaTheory §4.1e, `bakerBrumer_expDisc`: … is trivial." The paragraph then starts with the §4.2 sentence.
- Lines 73, 2631 and 2792: change "§§4.1, 4.1e, 4.2, 4.4" to "§§4.1, 4.2, 4.4".

I tested this on a scratch copy with exactly these edits. `roadmaps resolve` reports "Cross-roadmap citations found nowhere: None"; on the unedited README it reports "IntegralIwasawaTheory has no 4.1e". Every IntegralIwasawaTheory name still cited is at its head: `leopoldtLogMap`, `leopoldtDefect_eq_logKernel` and `leopoldt_iff_logMatrix_fullRank` (line 546), `algebraicLog_kernel` (558), `bakerBrumer_algebraicNumbers` (560) and `abelianLeopoldt` (578). The proof of `abelian_leopoldt` at line 2616 uses only §§4.1 and 4.4, so it is unaffected.

## R02 (P3) — `abelian_leopoldt` is now IntegralIwasawaTheory §§4.1 + 4.4 restated over K, not a headline of this roadmap

**Location.** `TauCetiRoadmap/GL2ModularityLifting/Suggested.lean`:
- lines 10–12: "Three headline results are stated against the pinned libraries: … and abelian Leopoldt (§10.7a)";
- lines 15–17;
- lines 101–123 (`unitLogVector`, `abelian_leopoldt`).

`README.md` line 75: "They use the supplied defect-zero theorem; the transcendence argument and the unit-character argument stay with the supplier". Line 2616: "Prove `abelian_leopoldt` from the defect-zero theorem."

**Claim.** Before this change, §10.7a proved abelian Leopoldt itself, from Brumer's theorem and the unit-character decomposition. That made it a deep headline of this roadmap. After the change, its proof (line 2616) changes the coefficient field from `ℂ_p` to K and the logarithm from Iwasawa's to Mathlib's series after a common power. It then quotes IntegralIwasawaTheory §4.4 through §4.1. The mathematical content is now the supplier's target, so `Suggested.lean` states another roadmap's theorem as one of this roadmap's three headlines.

**Witness.** IntegralIwasawaTheory at 78ec69e, `README.md` line 546 states `leopoldt_iff_logMatrix_fullRank`: Leopoldt holds iff the log matrix has rank `r = r₁ + r₂ − 1` over `ℂ_p`. Line 578 states `abelianLeopoldt`: δ(E, p) = 0 for every abelian E/ℚ and every p.

**Repair.**
- Delete `unitLogVector` and `abelian_leopoldt` (lines 101–123).
- Change docstring lines 10–12 to "Two headline results are stated against the pinned libraries: odd-involution field descent (§0.1) and the soluble prescribed-completion theorem (§1.7, CHT Lemma 4.1.2)."
- Delete the docstring sentence "Abelian Leopoldt covers every prime; … coefficient field." (lines 15–17).
- In `README.md` lines 75, 2616 and 2626, keep the coordinate statement as a prose target of §10.7a without backticks, for example "the unit-logarithm vector" for `unitLogVector`. Delete "in `Suggested.lean`" at line 2616.

I tested this on a scratch copy with these deletions plus the R03 header: it elaborates with exactly two `sorry` warnings. The statement itself is sound (rows below). A Lean form of it belongs in its owner's `Suggested.lean`. That file's docstring (lines 32–34) lists abelian Leopoldt (§4.4) among its own headlines and calls it not statable; the coordinate form shows that it is statable.

## R03 (P3) — The worker's gate fails `build` on two module-system warnings that come with the new pins

**Location.** The worker's gate at 21dca94: `build=2 FAIL`, twice "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file".

**Claim.** The merge of main (881c5a4) moved the pins:
- Mathlib from 6b7abb3c to 1b1ccf4b;
- Tau Ceti from a91d3aaf to 2fd255d9;
- Lean from v4.35.0-rc3 to v4.36.0-rc2.

Lake now prints this warning when it builds a file that imports the module-system Mathlib without a module header. This is not P1: the module compiles, and its build trace records only the three `sorry` warnings. My re-run of the gate printed `OK`, but Lake did not rebuild the module; it left the build products as the worker's run wrote them. The warning therefore appears only on a fresh build, and the next gate will hit it again.

**Witness.** At the pins, Mathlib's `Mathlib/Analysis/Normed/Algebra/Logarithm.lean` (line 6) and Tau Ceti's `TauCeti/NumberTheory/NumberField/Global/Places/Basic.lean` (line 6) begin with `module`. IntegralIwasawaTheory 78ec69e cleared the same warning this way. Eleven `Suggested.lean` files on main begin with `module`.

**Repair.** Make `module`, followed by a blank line, the first line of `Suggested.lean`, and leave the imports unchanged. I tested this on a scratch copy: it elaborates with exactly the three `sorry` warnings and no other diagnostic.

## R04 (P3) — The rational-field forms of Dieulefait–Pacetti's Theorems 1.4–1.6 and the congruence transfer restate ClassicalSerreModularity R33.1 targets (carried from r2 R01)

**Location.** `README.md`:
- §8.8, line 2347: "Assume LL1–LL3 and CC4–CC5. `OddPrimeLifting`(p) (§7.1, statement (a)) holds for every odd prime p";
- §9.3 (line 2429);
- §10.15 (line 2763);
- §§12.1–12.3 (lines 2840, 2862, 2884).

The ClassicalSerreModularity contract (line 81) says only "The other rational-field contracts in §§I.2 and R33.1 are compared with the exports here".

**Claim.** These sections are stated as targets proved here under LL/CC/LC. They are the `ℚ` specialisations of targets that ClassicalSerreModularity, earlier in the merge order, owns.

**Witness.** ClassicalSerreModularity `README.md` at e8c5264 (#1020) states `R33.1/kisin-fontaine-mazur-over-rationals` at line 1301, `R33.1/pan-residually-reducible-lifting` at 1312 and `R33.1/dp-modularity-lifting-inputs` at 1322. Its line 78 says these are "owned here".

**Repair.** As in r2:
- In §8.8, §9.3, §10.15 and §§12.1–12.3, name the R33.1 target each corresponds to.
- State each of these sections as the `F = ℚ` specialisation of §8.7, §9.2 or §10.14 under LL/CC/LC, compared with that target.
- List the three targets in the ClassicalSerreModularity contract (line 81).

PotentialModularityAndCompatibleSystems consumes §§8.7, 9.2 and 12.3 with their conditional hypotheses, which the specialisation keeps.

## R05 (P3) — LL1–LL3 are free hypotheses although PadicLocalLanglandsForGL2Qp plans them for this roadmap (carried from r2 R02)

**Location.** `README.md` lines 195–197 (LL1 "Breuil–Mézard in cycle form", LL2 "Kisin's local inequality", LL3 "Kisin's Hypothesis (1.2.6)"). Also every `*Needs:*` line that reads "hypotheses LL1–LL3 (Conditional arithmetic hypotheses)", for example lines 2121, 2266, 2283 and 2301. "PadicLocalLanglandsForGL2Qp" occurs 0 times in the README.

**Claim.** The local inputs are explicit hypotheses with no supplier. A roadmap earlier in the order plans them and names this roadmap as their consumer.

**Witness.** PadicLocalLanglandsForGL2Qp `README.md` at 84416ad (#1312) has:
- §4.5 "Kisin's Hypothesis (1.2.6)" (line 1513);
- §§6.1–6.6 (lines 2158–2251);
- §6.10 (line 2389), whose first sentence (line 2391) says these local results are "consumed by GL2ModularityLifting §§8–9".

**Repair.** Add a `### From PadicLocalLanglandsForGL2Qp` contract that cites §§4.5, 6.1–6.6 and 6.10. In LL1–LL3, name the section that supplies each input and the hypotheses that section keeps; Tung's §§6.3 and 6.5 are conditional there. Keep the LL names only where the supplier's statement is itself conditional.

## Previous findings

- R01 — not repaired: §8.8 (line 2347) still reads "Assume LL1–LL3 and CC4–CC5. `OddPrimeLifting`(p) (§7.1, statement (a)) holds for every odd prime p", and line 81 still only "compared with the exports here". Carried as R04.
- R02 — not repaired: LL1–LL3 (lines 195–197) still name no supplier, and "PadicLocalLanglandsForGL2Qp" occurs 0 times in the README. Carried as R05.
- R03 — repaired: line 1218 now reads "Import the modular-curve local systems and compact-type lattice constructions from ModularCurvesPartII §§14.1–14.15. Form the displayed Hom action image…". "R14.6" occurs 0 times.

## Verified sound

**Gate and dependency check.**
- Worker's gate at 21dca94: every check 0 except `build=2` (R03).
- My re-run, `gate … --base origin/main`: all checks 0, `OK`.
- Dependency check with `--movable`: `depcheck: 240 roadmaps, 2450 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. IntegralIwasawaTheory is at position 29 in the merge order, this roadmap at 170.
- `git diff origin/main...HEAD` outside `TauCetiRoadmap/GL2ModularityLifting`: empty. The long list of outside files in the change summary is the merge of main (881c5a4), not a change by this pull request.

**Lean.**
- `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 47, 86, 113) and nothing else.
- I put `#check @` for all seven declarations into a scratch copy. Every elaborated type matches the worker's signature file. No binder is lost: the file has no `variable`, and `abelian_leopoldt` keeps `[IsTotallyReal F] [IsAbelianGalois ℚ F] [CompleteSpace K] [FiniteDimensional ℚ_[p] K]`. The signature file's eighth entry, "`-field` (class, line 35)", is a parsing artefact of the docstring word "class-field".
- One-tactic probe at the new pins, `first | simp | rfl | infer_instance | exact ⟨_, rfl⟩ | (intros; simp_all) | trivial | decide | norm_num`: all three theorems are left with unsolved goals (lines 62, 98, 122), so none is padding by that test.
- The Lean file is unchanged since 673cfcb; only the pins moved.

**Library declarations opened at the pins.**
- `NormedSpace.log`, Mathlib 1b1ccf4b, `Mathlib/Analysis/Normed/Algebra/Logarithm.lean` line 90. It is the series `Σ (−1)^(n+1)(x−1)^n/n`, with junk value 0 where the series diverges. Its module docstring lists ultrametric convergence on `‖x−1‖<1` and the product law as TODO.
- Those two facts are what line 2616 uses. DirichletPadicLFunctions §0.6, at 016e54c (#1039), supplies them: line 266 gives `logOneAdd_specialization`, the product law on principal units and vanishing on roots of unity; line 272 gives `map_algHom`, equivariance under isometric `ℚ_p`-algebra maps. §10.7a's *Needs:* already lists that supplier, so the new route has no unowned step.
- Tau Ceti 2fd255d9: `Places/Basic.lean` is a `module` file (line 6).

**Cross-roadmap citations resolved at the heads, for the changed passages.**
- IntegralIwasawaTheory 78ec69e: §§4.1, 4.2, 4.3, 4.4 and the six names listed in R01 (lines 544–578), but not §4.1e (R01). The descriptions at lines 71 and 2612 match those statements; for example, §4.2 claims independence over the embedded algebraic closure, not over `ℚ_p`.
- DirichletPadicLFunctions §0.6 (line 264).
- ModularCurvesPartII 07e21ad: §14.1 (line 3498), §14.6 (3642) and §14.15 (3839); "R14.6" occurs 0 times.
- GlobalGaloisDeformations c3a764e: `HeckeGaloisDatum.classifying_surjective` (1633), `classifying_unique` (1634), `ofPoints` (1671) and `mem_of_points` (1687). These are the four names that the citations file lists as absent from the pinned libraries; they are supplier roadmap names.
- Unchanged passages are as recorded in r2.

**Ownership.** This change hands Baker–Brumer and abelian Leopoldt to IntegralIwasawaTheory. LinearFormsInLogarithms is no longer cited directly, which is correct: IntegralIwasawaTheory §4.2 consumes it. `roadmaps grep bakerBrumer_expDisc` across the 466 open heads and main finds no file that defines the name. The only hits are this README (lines 71 and 2612) and EulerSystemsCyclotomicMainConjecture (lines 223, 3101 and 3145), which carries the same stale citation; that roadmap has its own review. The overlaps file reports no pull request that changes this roadmap and no dropped id. R02 is the only Lean-level overlap.

**Seeded sample.** None of the 15 sampled targets falls in the changed passages. The diff touches the IntegralIwasawaTheory contract (lines 69–75), §5.2 (line 1218), §10.7a and the Layer 10 Dependencies; §10.7 is adjacent but unchanged. Following the incremental brief, they were not re-read.

**Headline theorems.** These are unchanged from r2: KW I Theorem 4.1 (§§5.18, 6.16), Hypothesis (H) (§6.10), Kisin's potentially Barsotti–Tate theorems, Gee's Fontaine–Laffaille theorem, the BCDT theorems, the odd-prime and dyadic de Rham lifting theorems, Pan's theorem and the Layer 12 transfers. None is statable at the pins, and the module docstring names the missing carriers. The stated theorems are §0.1 and §1.7, plus §10.7a, which is subject to R02.

**Adversarial table.** The first eleven rows are new rows for the changed statements. The rest are carried from the previous report (r2, at 673cfcb) for the statements the diff leaves untouched, with r2's finding numbers mapped to R04 and R05.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Contract line 71 and §10.7a line 2612: §4.1e `bakerBrumer_expDisc`, `bakerBrumer_expDisc_linearIndependent` | IntegralIwasawaTheory README at 78ec69e and at ae7b458 | 78ec69e: headings 4.1 (544), 4.2 (556), 4.3 (564), 4.4 (576); "4.1e" count 0, `bakerBrumer_expDisc` count 0; §4.2 (560) applies LinearFormsInLogarithms §8.10. ae7b458: §4.1e at 661, `bakerBrumer_expDisc` at 676 | cites a section absent at the head | R01 |
| Contract: §§4.1, 4.2, 4.4 names | 78ec69e | `leopoldtLogMap`, `leopoldtDefect_eq_logKernel`, `leopoldt_iff_logMatrix_fullRank` (546); `algebraicLog_kernel` (558); `bakerBrumer_algebraicNumbers` (560: over the embedded algebraic closure, not `ℚ_p`); `abelianLeopoldt` (578: every finite abelian E/ℚ, every p) | sound | none |
| §10.7a: one N = q − 1 for all units | `F = ℚ(√5)`, `p = 2`, `K = ℚ₂(√5)`; `F = ℚ`, `K = ℚ₂`; odd p, `K = ℚ_p` | `x²−x−1 ≡ x²+x+1` irreducible mod 2, so K is unramified with residue field 𝔽₄ and N = 3; `ε = (1+√5)/2`, `ε³ = 2+√5`, `ε³−1 = 2ε` of norm 1/2 < 1. `F = ℚ`, p = 2: q = 2, N = 1, `‖−1−1‖ = 1/2 < 1`. Odd p: `(−1)^(p−1) = 1` | sound | none |
| §10.7a: `unitLogVector` additive, zero on torsion, rank from the log matrix | same `ℚ(√5)` at p = 2 | `2·log(−1) = log 1 = 0`, so `log(−1) = 0`; the conjugate is `2−√5 = −(2+√5)⁻¹`, so ε's vector is `(a, −a)` with `a = log(2+√5)/3`; `a ≠ 0` because `2+√5` has infinite order and log on `1+𝔪` kills only roots of unity; K-span dimension `1 = [F:ℚ]−1` | sound | none |
| §10.7a: every embedding into `ℂ_p` factors through `ι(F) ⊆ K` | Galois `ℚ(√5)`; non-Galois `ℚ(∛2)` | both embeddings of `ℚ(√5)` have image `ℚ(√5) ⊆ K`; `ℚ(∛2)` has images `ℚ(∛2)`, `ℚ(ζ₃∛2)`, `ℚ(ζ₃²∛2)`, three different fields, which `[IsAbelianGalois ℚ F]` excludes | sound | none |
| §10.7a: `‖σ(u)‖ = 1` for global units | `u = ε` above; `u = −1` | σ(u) and σ(u⁻¹) are integral over `ℤ_p`, so both norms are ≤ 1 and their product is 1; `‖−1‖ = 1` | sound | none |
| Check: 3 at p = 2 | m = 0, 1, 2 | `v₂(3−1) = 1`, so `‖3−1‖ = 1/2`, which is not `< 1/2`; `v₂(3²−1) = v₂(8) = 3`; `v₂(3⁴−1) = v₂(80) = 4`; in general `v₂(3^(2^m)−1) = m+2` | sound | none |
| Check: N ↦ MN | `y = 2+√5`, N = 3, M = 2 | `log(y⁶)/6 = 2·log(y³)/6 = log(y³)/3`; `‖y^(MN)−1‖ ≤ ‖y^N−1‖ < 1` | sound | none |
| Lean `abelian_leopoldt` vs IntegralIwasawaTheory §§4.1 + 4.4 | totally real F, `r = r₁+r₂−1 = [F:ℚ]−1` | 546: Leopoldt iff rank r over `ℂ_p`; 578: δ = 0 for every abelian E; after `K ⊆ ℂ_p` the rank of a K-matrix does not change | supplier target restated | R02 |
| Gate `build` | worker's run; my re-run; `lake env lean`; scratch copy with a `module` header | worker: 2 module-system warnings; re-run: `OK`, no build entry; build trace: 3 `sorry` warnings; probe: 3 `sorry` warnings | gate fails on a fresh build | R03 |
| §5.2 line 1218, ModularCurvesPartII §§14.1–14.15 | head 07e21ad | §14.1 (3498), §14.6 (3642), §14.15 (3839); "R14.6" occurs 0 times | sound | none (r2 R03 repaired) |
| §0.1 `odd_involution_descent` | `G = 1`; `K = 𝔽₃`, `c = diag(1,−1)`; `T = χ₁ + χ₂`; nonsplit extension; char 2 | `c = 1` forces `T(c) = T(1) = 2 ≠ 0`, hypotheses empty; `T(c) = 0`, `D(c) = (0 − 2)/2 = −1`; `ρ = diag(χ₁,χ₂)` with `det = χ₁χ₂`; same `T` returns the split `ρ`; Brauer–Nesbitt in rank 2 needs only `2 ≠ 0` since `det = (T(g)² − T(g²))/2`; `h2` excludes char 2 | sound; identity in `h_trace` is Pan 2.1.1(3) (`59017112` line 448 uses it with `γ = δ = η = σ*`) (r2) | none |
| §0.2 reducibility ideal | upper-triangular realisation; `B = A`, `C = tA` over `k[[t]]`; `A → k[ε]/(ε²)` | all `b(σ)c(τ) = 0`, `J = 0`; `J = (t)`; image `(ε) ≠ 0` | sound (r2) | none |
| §0.3 one-dimensional comparison | Pan Prop. 2.3.2; `Γ = C₂`, `1 ⊕ sign` at odd `p`; Frobenius `!![1,t;0,1]` over `k[[t]]` | `c ∈ R^{ps} ∖ q`, image `c₀(τ₀) ≠ 0`, `N = N(n)` depends on `n` and `ρ₀`, not on `Γ` (`59017112` lines 439–443); `(1 ± c)/2` split every lattice; finite image of order `p`, trivial reduction, not constant | sound; p. 10 lies in the cited pp. 8–15 (r2) | none |
| §1.7 `cht_soluble_prescribed_completions` | `S = ∅`; `D = ⊥`; real `v`, `L = ℂ`; complex `v`; `F = ℚ`, `S = {3}`, `L = ℚ₃(√−3)` | `E = ⊥`, trivial group solvable; `ℝ ⊗_F E ≅ ℂⁿ`, `n` = complex places above `v`; only `L = ℂ` possible; `E = ℚ(√6)`: `6/(−3) = −2 ≡ 1 mod 3` a square, `n = 1` | sound; CHT Lemma 4.1.2 (`9d3b7079` lines 5723–5726: any number field, any finite set of places, linearly disjoint from `D`) (r2) | none |
| §1.8 allowable change | `F = ℚ`, `p = 5`, `u = 3`, `ℚ(√11)`; `S₀ = {v | p}`, `E_v = F_v` | `11 ≡ 1 mod 5` split, `11 ≡ 2 mod 3` nonsquare so inert, degree 2; `F′` split at `p` | sound (r2) | none |
| §1.9 trace characterisation | arithmetic Frobenius | char. poly `X² − T_vX + N(v)ψ(π_v)` (`53f45f8b` line 3710) | sound (r2) | none |
| §1.10 trace generation | `S₃` over `ℤ₅` extended to `ℤ₅[ε]/(ε²)` | traces in `ℤ₅ ≠ T`, violates "closed subalgebra generated by the `t_v` is `T`" (GlobalGaloisDeformations line 1624) | sound (r2) | none |
| §1.11, §1.12 framed algebra and module | `|S| = 1`; `T⊗_{R̄}R̄^□` | `j = 4·1 − 1 = 3`; `T^□ = T ⊗_{R̄^ψ_S} R̄^{□,ψ}_S` (`53f45f8b` line 3718); the framed module `S_{k,ψ}(U_{Q_n},O)_m ⊗ R̄^{□,ψ}` (line 3792) | sound; the module itself is displayed on p. 82, the algebra on p. 80 (r2) | none |
| §2.1 isotropy quotient | `Δ′_v = ℤ/4`, `N = 2`; `Q = ∅` | `Δ′_v[2] = {0,2}`, `Δ_v = ℤ/2`; `Δ_∅ = 1` | sound (r2) | none |
| §2.8 Taylor–Wiles module system | KW II Prop. 9.2 proof | `O[Δ_{Q_n}][[y_{h+1},…,y_{h+j}]]`-modules, free over `O[Δ_{Q_n}]` of rank independent of `n` (`53f45f8b` lines 3794–3798) | sound (r2) | none |
| §2.9 dyadic twists | `χ = 1`; diamond formula; `p` odd | identity; `(f|⟨h⟩)_χ = χ^{−1}(h) f_χ|⟨h⟩` (`53f45f8b` line 3107), `f_χ|T_v = χ(π_v)(f|T_v)_χ` (3099), `χ ≡ 1 mod m` preserves `m` (3120); order-2 characters not residually trivial at odd `p` | sound; `p = 2` compatibility with `G*_{Q_n,2}` at line 3751 (r2) | none |
| §3.1 patching radius | `s = 1, p = 3, m = 2, h + j = 1`; `𝔽₂[[x,y]]` | `r_m = 1·2·3² = 18`; `m^{(2)} = (x²,y²) ∌ xy` | sound (r2) | none |
| §3.2 shifts | `b = 2`, `r_m = 3`; `h = 1, p = 2, a = 2` | degree-6 monomial in two variables has an exponent `≥ 3`; `(1+y)² − 1 ≡ y² mod 2`, `(1+y)⁸ − 1 ≡ y⁸` | sound (r2) | none |
| §3.7 `R = T[1/p]` | KW II 9.2(III) | surjective with `p`-power torsion kernel (`53f45f8b` line 3776) | sound (r2) | none |
| §4.1 avoidance pair | `p > 2`; `p = 2` | `ζ ≠ ζ^{−1}`; `ζ = −1 = ζ^{−1}` | sound (r2) | none |
| §4.2 integral `R = T` | `r = 0`; `𝒪[[x]] → 𝒪` on `M = 𝒪` | empty regular sequence; nonzero source kernel cannot satisfy `N_n ≃ (S/J_n)^s` with `A`-linear augmentation; supplier hypotheses are `J_n = ((1+z_i)^{p^{n+1}} − 1)`, `ψ_n(ι_n(z_i)) = 0`, `N_n/aN_n ≃ M` (DeformationAndDerivedPatchingAlgebra line 1147) | sound (r2) | none |
| §4.4 component transfer | `C = 𝒪[[x,y]]/(xy)`, `R = C/(x(x−π))`, `M = R/(x)` | minimal primes `(x)` (dim 2) and `(y, x−π)` (dim 1); `R ↪ 𝒪[[y]] × 𝒪` by `x ↦ (0,π)`, `y ↦ (y,0)` kills `xy` and `x(x−π)`; `R/π = k[[x,y]]/(xy,x²)` has the single minimal prime `(x)`, so `M/π` has full special-fibre support while `M` misses `(y,x−π)` | sound; justifies the unique-generalisation hypothesis (r2) | none |
| §5.3 descent field | `F = ℚ`, `L₃ = ℚ₃(√−3)` | `ℚ(√6)`: `ℚ₃(√6) = ℚ₃(√−3)` since `−2` is a square in `ℚ₃` | sound; existence now cited from ClassicalSerreModularity `I.0` (r2) | none |
| §5.4, §6.15 KW II Thm 9.7 | 11a1 at `p = 3`; weight `p + 2`; induced from `ℚ(√−3)` | image `GL₂(𝔽₃)`, `SL₂(𝔽₃)` absolutely irreducible; outside (A); no Taylor–Wiles primes | sound (r2) | none |
| §5.11 Kisin over `ℚ` | `p = 3` | quadratic field `ℚ(√−3)`; residue field `𝔽_p` automatic | statement agrees with KW II §10.2 and Gee's citation; source text not readable (Not verifiable) (r2) | none |
| §5.17 endpoint | `p = 5`, unramified `ν` of order 3 | `ν̄²` has order 3 `≠ 1`; `Ind ω₂^p ≅ Ind ω₂` by conjugation | sound (r2) | none |
| §6.1 dyadic datum | `k[ε]/(ε^{m+1}) → C/(ε)`; `→ k[ε]/(ε^m)` | kernel `(ε) ⊄ (ε^m)` for `m ≥ 2`; kernel `(ε^m) = m^m` | sound (r2) | none |
| §6.2 oddness at 2 | `(1 1;0 −1)`, `diag(1,−1)`, `−1` | det `−1, −1, 1`; reductions `(1 1;0 1), 1, 1` | sound (r2) | none |
| §6.7a ambient support | `R = ℤ₂[[x]]/(x(x−2))`, `M = R/(x) ⊕ R/(x−2)`, `B = R/(x)` | `M ⊗_R B = ℤ₂ ⊕ R/(x,x−2) = ℤ₂ ⊕ 𝔽₂`, not flat | sound (r2) | none |
| §6.8 labelled components | `η(Frob) = ζ₃` over `ℚ₂` | `η̄` of order 3 in `𝔽₄^×`, `η̄^{−1} ≠ η̄`; both lifts have `det = ε` | sound (r2) | none |
| §6.11 power-series presentation | KW II Lemma 9.5; `t = 0` | `dim B[[x]] = (d+1) + (h+j+t−d) = h+j+t+1`; `R′_∞ = R_∞`; proof by dimension of the faithful `O[[y_1..y_{h+j}]]`-action (`53f45f8b` lines 4009–4023) | sound (r2) | none |
| §6.12 archimedean ring | `𝒪[[X₁,X₂,X₃]]/(X₁² + X₂X₃ + 2X₁)` | mod 2: `X₁² + X₂X₃`, gradient `(0,X₃,X₂)` vanishes at 0; after inverting 2: `(X₁+1)² + X₂X₃ = 1`, gradient zero only at `(−1,0,0)` where `0 ≠ 1` | sound (r2) | none |
| §7.5 non-solvable image | `p = 2` | `GL₂(𝔽₂) ≅ S₃` solvable; `SL₂(𝔽₄) ≅ A₅` not | sound (r2) | none |
| §7.6 normalisation | `{3,7}`, `{0,1}`, `{4,4}`, shift by `n` | `k = 7 − 3 + 1 = 5`; `2`; `1`; `5` | sound (r2) | none |
| §7.8 exclusions | Kisin intro theorem; (1.2.7); Hu–Tan; Tung; Paškūnas; Emerton | (2) abelian, (4) `≁ (ωχ ∗;0 χ)` (`0bb3747b` lines 53–63); `p = 3` exceptions `(1 ∗;0 ω)⊗χ`, `Ind ω₂²⊗χ` (line 444), which at `p = 3` equal the README's `(ω ∗;0 1)⊗χ` since `ω = ω^{−1}`; Hu–Tan new only for `1 ⊕ ω` (`d36f237d` lines 199–202); Tung new for `p = 3` and a twist of an extension of 1 by `ω` (`22017bc9` line 771); Paškūnas `p ≥ 5`, scalar endomorphisms (`fce17b36` lines 8–10); Emerton 3.3.22 for de Rham `V_E` with distinct weights (`bf4f8556` lines 1437–1442) | sound (r2) | none |
| §7.9 twist weight | `{0,4}` vs weight 5; equal weights | `m = 0`, `k′ = 5`; weight-one witness excluded | sound (r2) | none |
| §7.10 oddness at odd `p` | `ℤ × ℤ`, `c = diag((1,1),(−1,1))`; `p = 3` | `c² = 1`, `det c = (−1,1) ≠ −1`, first projection mod 3 gives `−1`; `−1 ≠ 1` in `𝔽₃` | sound; the domain hypothesis is used (r2) | none |
| §7.11 geometric twists | `p = 3`, `−2` | `−2 ≡ 1 mod 3`, `−2 ≡ 7 mod 9`, so `−2` generates `1 + 3ℤ₃`; the pro-`ℓ` part of `ℤ_ℓ^×` has finite image in a `p`-adic field | sound (r2) | none |
| §8.2, §8.3, §8.5 corrected rank | `R = ∅`; Gee–Kisin B.3, B.5, B.5.1, B.5.2 | rank `2⁰ = 1` is Lemma (2.2.11) (`0bb3747b` line 2009); `N(v) ≢ −1` (`65cb5797` line 1828); `1 − N(v)` unit, ratio not `N(v)^{±1}`, equal eigenvalues allowed, rank `2^{|R|}` (1859–1864); the four equivalent conditions and the modularity clause (1867–1882); graded bound (1901–1905) | sound (r2) | none |
| §8.6 Kisin over totally split `F` | `C: y² = x³ − x`, `p = 7`, `ρ = V₇(C) ⊗ ε⁶` | `#C(𝔽₇)`: `x = 0,1,6` give one point each, `x = 4,5` two each (`60 ≡ 4`, `120 ≡ 1` are squares), `x = 2,3` none, plus `∞`: `8`; `a₇ = 0`; `ω₇⁶ = 1`; weights `{6,7}`; Theorem (2.2.18) hypotheses (`0bb3747b` lines 2222–2236) | sound (r2) | none |
| §8.8 DP Theorem 1.4 | `p = 3`; multiplicative reduction | field `ℚ(√−3)`; semistable noncrystalline weight 2 covered; hypotheses as printed (`0c6850da` lines 140–147) | sound (r2) | R04 (r2 R01, carried) |
| §8.9 application list | `k = 3`, `w = 7`; `w > 2k ≥ 4` | `7 ∉ {3,5}`; `w ≥ 5` | sound (r2) | none |
| §9.3 dyadic de Rham | Tung Theorem A; Paškūnas (iv) | unipotent `ρ̄` at 2 covered by Tung, not by Paškūnas | sound (as in r1, `a601da37` line 85) (r2) | R04 (r2 R01, carried) |
| §10.2 potentially nice | Pan §7.2.4; `S = Σ_p` | three bullets `p ∈ q`, `dim 1`, irreducible, finite away-`p` image (`59017112` lines 5100–5104); last clause vacuous | sound (r2) | none |
| §10.3 good components | `{0},{0,1},{1,2}`, nice `{0,1}`, seed `{0}`; `{0,1},{1,2}`, nice `{0}`, seed `{0}`; empty seed | chain `C₁ ∋ 0`, `C₂ ∩ C₁ ∋ 0`, `C₃ ∩ C₂ ∋ 1`: all good; `1` not nice: only the first good; none good; Definition 7.4.1 with `q₁` in the closure of the regular de Rham primes of Cor. 7.2.3, which are irreducible (`59017112` lines 5191–5197, 5071–5075) | sound (r2) | none |
| §10.4 detected components | `f = id`; `B = 0`; `ker f ⊄ P` | all minimal primes; empty; `P` not in the image; Definition 7.4.21 (`59017112` line 5402) | sound (r2) | none |
| §10.5 Pan 8.0.1 | hypotheses (1)–(5); `C` at `p = 7` | `ρ̄|G_{F(ζ_p)}` abs. irred., local abs. irred. regular de Rham, `p = 3` exclusions both orientations, `det ρ(c) = −1`, `ρ̄` automorphic (`59017112` lines 5555–5575); Remark 8.0.4 invokes KW (5587) | sound (r2) | none |
| §10.7 Euler characteristic | odd `ρ`, `h⁰(ad⁰) = 0` | `c` has eigenvalues `+1,−1,−1` on `ad⁰`, invariants dim 1; `h¹ − h² = d(3 − 1) = 2d` | sound (r2) | none |
| §10.8, §10.9 ordinary intersections | `d = 4` | `1 + 2d − d = 5`; `1 + 2d + 2d − 3d = 5` | sound (r2) | none |
| §10.11, §10.12 connectedness | `k[[a,b,c,d,z₁..z₆]]/(ab,cd)`; `d = 4`; `d = 1` | four components `(a,c),(a,d),(b,c),(b,d)` of dim 8; every partition contains a pair meeting in `(a,c,d)` or similar, dim 7; the pair `(a,c),(b,d)` meets in `(a,b,c,d)`, dim 6; `2·4 − 1 = 7 > 5`; `1 > 2` false | sound (r2) | none |
| §10.14 Pan 7.1.1 | hypotheses | abelian totally real, `p` split, `χ̄₁/χ̄₂` extends to `G_ℚ`, local irreducible de Rham distinct weights, `p = 3` ratio `≠ ω^{±1}`, `(χ̄₁/χ̄₂)(c) = −1` (`59017112` lines 4995–5009) | sound (r2) | none |
| §10.15 Pan 1.0.2 | `p = 3` | exclusion `χ̄₁χ̄₂|G_{ℚ₃} ≠ ω` (`59017112` lines 100–105); `ω = ω^{−1}` so swapping characters keeps it | sound (r2) | R04 (r2 R01, carried) |
| LC | `L = ℚ`, `S = {p}`; enlarged `S` | Soulé's vanishing of `H²(ℤ[1/p], ℚ_p/ℤ_p(2))`; Pan's "not too hard to deduce" (`59017112` lines 5348–5350) | sound as a hypothesis (r2) | none |
| §11.2 ordinary completion at 3 | `k ∈ {2,4}` | `k − 1 ∈ {1,3}` odd, `ω₃^{k−1} = ω₃ ≠ 1` | sound (r2) | none |
| §12.3 | `V₅(11a1) ⊗ ε₅` | 11a1 has a rational 5-torsion point, `ρ̄^{ss} = 1 ⊕ ω₅`, twist `ω₅ ⊕ ω₅²`, `det = ε³`, weights `{1,2}`; DP Theorem 1.6 hypotheses (`0c6850da` lines 166–172) | sound (r2) | R04 (r2 R01, carried) |
| §7.4, §12.5 ordinary at 3 | DP Theorem 1.7 | printed `ρ̄|D₃ ≠ 1` and `det ρ = ψχ₃^{k−1}` with no condition on `ψ` (`0c6850da` lines 177–180); ClassicalSerreModularity `I.1` requires `ψ` finite order and `χ|D_p ≠ 1` (its line 455); `ω₃` is ramified at 3 so both are automatic | sound (r2) | none |
| Conventions `p*` | `p = 3, 5, 7` | `−3, 5, −7`; `ℚ(√−3) = ℚ(ζ₃)` | sound (r2) | none |
| ClassicalSerreModularity R33.1 vs §§8.8, 9.3, 10.15, 12.1–12.3 | CSM lines 1302, 1313, 1323 | same `ℚ`-theorems stated there unconditionally | restated (r2) | R04 (r2 R01, carried) |
| PadicLocalLanglandsForGL2Qp §6.10 vs LL1–LL3 | PLL lines 1558, 2244–2349, 2490–2492 | supplier names this roadmap §§8–9 as consumer; uncited | bypassed supplier (r2) | R05 (r2 R02, carried) |

## Not verifiable

- **Brumer, *On the units of algebraic number fields*, Mathematika 14 (1967), pp. 121–124** (§10.7a Source line). I did not fetch it again this round. Earlier rounds, and today's review of IntegralIwasawaTheory, found that DOI 10.1112/s0025579300003703 leads to Wiley and is refused with HTTP 403, and no open copy turned up. After R01 and R02 this roadmap proves nothing directly from it.
- **Unchanged passages: not attempted again; r2's list stands.** These are:
  - Kisin, *Moduli of finite flat group schemes, and modularity*: DVI only, and the Annals copy was not reachable;
  - Kisin, *Modularity of 2-adic Barsotti–Tate representations*: DVI only, journal copy paywalled;
  - Kisin, *Modularity for some geometric Galois representations*: DVI only;
  - Lichtenbaum, Proposition 9.6: checked only through Pan's citation.
- **Supplier heads.** IntegralIwasawaTheory, ClassicalSerreModularity, PadicLocalLanglandsForGL2Qp, DirichletPadicLFunctions, ModularCurvesPartII and GlobalGaloisDeformations have no checkouts in this brief. I read them at the heads listed above through `roadmaps show` and read-only GitHub API calls. Ownership against the other open pull requests was checked with the tools' grep and overlaps index of 466 heads.

## Source issues

- none
