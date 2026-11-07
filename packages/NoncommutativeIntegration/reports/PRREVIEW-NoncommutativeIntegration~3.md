# Review of NoncommutativeIntegration (pull request #864 at b3ab9bd)

**Verdict:** needs changes

Incremental re-review of the 90 changed lines since bb121b3 (the B(H) identification `μ_t=a_⌊t⌋`, the Schatten quasi-ideals and weak Schatten classes as instances of Layer 1 in §1.5, §1.6, the Scope bullet, the Layer 1 example, the Downstream consumers entry for NoncommutativeGeometry and the Hiai reference entry). `Suggested.lean` is byte-identical to bb121b3 (`git diff bb121b3 HEAD -- TauCetiRoadmap/NoncommutativeIntegration` touches README.md only). The merge of main moved the pins from Mathlib `6b7abb3c` / Tau Ceti `a91d3aa` to Mathlib `1b1ccf4b` / Tau Ceti `2fd255d9`; the file elaborates at the new pins with the five intended `sorry` warnings and the ten signatures are unchanged, but the gate's targeted build now fails on Lake's module-system warning for this folder's file (R01). The mathematics of the changed passages is correct and every new locator resolves; the six findings are the gate failure and the five P3 findings of the previous review, none of which this head repairs.

## R01 (P3) — The gate's build check fails: Lake's module-system warning on `Suggested.lean`

Location: `TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean` line 5, "import Mathlib" (after the copyright header, line 1 is "/-").

Claim: the gate passes at this head.

Witness: `tauceti-roadmap gate … --build` at this head prints `build=2 FAIL` with, twice, "warning: TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". Both lines name this folder's file. At the pins the worker's manifest now carries (Mathlib `1b1ccf4b`), Mathlib is a module-system package; at bb121b3 the manifest pinned `6b7abb3c` and the gate passed. `lake env lean` on the file is clean (five `sorry` warnings), so the elaboration is not the problem; the gate counts the Lake warning as a build failure and no acceptance is possible while it fails.

Repair: make the file a module-system file in Mathlib's own form. Replace the header by: line 1 `module`, a blank line, `public import Mathlib`, then the module docstring, then `@[expose] public section` before `noncomputable section`. Keep everything else. (`module` alone makes every declaration private: an importer then reports the ten names as unknown identifiers. The `@[expose] public section` form keeps them visible; the gate's import scanner accepts `public import`.) After the change, confirm with the targeted build that `build=0` and, from a scratch importer, that `#check @TauCetiRoadmap.NoncommutativeIntegration.matrix_khintchine_one` still resolves.

## R02 (P3) — Wrong value in the §2.4 real-interpolation Check

Location: `README.md` line 545, "`∫ t^(−1)min(t,1)² dt/t=∫₀¹ t dt+∫₁^∞ t^(−2) dt=1/2+1=3/2`".

Claim: for f = 1_(0,1), the `(1/2,2)` gauge squared is 3/2.

Witness: the integrand is `t^(−1)·min(t,1)²·t^(−1) = t^(−2)min(t,1)²`; on (0,1) this is `t^(−2)·t² = 1`, so the first integral is `∫₀¹ 1 dt = 1`, not `∫₀¹ t dt = 1/2`; on (1,∞) it is `t^(−2)`, with integral 1. The value is 2.

Repair: write `∫ t^(−1)min(t,1)² dt/t=∫₀¹ 1 dt+∫₁^∞ t^(−2) dt=1+1=2`. The conclusion of the Check (finiteness, equivalence with L²) is unchanged. Not repaired since the previous review (its R01).

## R03 (P3) — Locators for the tracial subunit range point at the Haagerup-space theorem and at p ≥ 1

Location: `README.md` line 285, "(Fack–Kosaki, Theorem 4.9(iii); Hiai, Lemma 5.3 and Theorem 5.10)" for the p-triangle inequality and completeness of `d(x,y)=‖x−y‖_p^p`, 0 < p < 1, on Lp(M,τ); and the Layer 1 example at line 427, "M̃ is the algebra of measurable functions finite outside sets of finite measure".

Claim: the cited theorems state the tracial subunit facts; the example describes M̃ for L∞(Ω,μ).

Witness: fk86 lines 851–857 open the passage with "we prove norm inequalities of the Haagerup Lp(M)" and Lemma 4.8 states `μ_t(T)=t^(−1/p)‖T‖_p` relative to the canonical trace on the crossed product; Theorem 4.9(iii) (line 871) is the p-triangle inequality for Haagerup Lp, which §3.3 consumes correctly. Hiai Theorem 5.10 (line 2221) is "for every p ∈ [1,∞]"; Lemma 5.3 (lines 1939–1942) gives only the linear-subspace and bounded-multiplier laws for 0 < p ≤ ∞. No source cited at the claim states completeness of the tracial p-metric below 1. For the example, `f = n` on (n,n+1) is finite everywhere but `μ(|f|>λ)=∞` for every λ, so f is not τ-measurable; Hiai, Example 4.13(3) (line 1596) says bounded on X∖A with μ(A) < ∞.

Repair: in §1.3 cite Fack–Kosaki, Theorem 4.7(i) with g(s) = s^p and t → ∞ for the tracial p-triangle inequality (the r ↑ p limit is needed only in §3.3), and give completeness its own route with its locator (Cauchy in the p-metric implies Cauchy in measure by the comparison stated in the same section, then Fatou for μ_t, Fack–Kosaki Lemma 3.4(i)); in the Layer 1 example write "bounded outside a set of finite measure". Not repaired since the previous review (its R02).

## R04 (P3) — The §1.2 negative controls do not refute what they say they refute

Location: `README.md` lines 268–269, "a definition allowing `τ(1−e)<δ` with δ=1 would admit rank-one cuts and give a strictly coarser topology on M₂(ℂ)"; lines 274–276, "the product law … a law with `max(δ₁,δ₂)` in place of the sum is false … x=1_(0,1)·n and y=1_(1,2)·n … with x+y∉V(ε,1)".

Claim: the strict inequality admits rank-one cuts; the witness refutes the product law with max.

Witness: a rank-one cut in M₂(ℂ) with the unnormalized trace has `τ(1−e)=1`, which satisfies `≤1` and fails `<1`: the stated definition at δ = 1 admits it and the strict variant excludes it. Either way the topology generated by all `V(ε,δ)`, δ > 0, is the norm topology (δ < 1 forces e = 1), so neither endpoint convention gives a coarser topology. The second witness computes `x+y`, so it refutes `max` in the sum law `V(ε₁,δ₁)+V(ε₂,δ₂)⊆V(ε₁+ε₂,δ₁+δ₂)`; for the product law `xy=0`, and nothing is refuted.

Repair: replace the first control by one that is wrong for a different reason (for instance, a definition using the single neighbourhood `V(ε,1)` alone is strictly coarser on M₂(ℂ), since `e₁₁∈V(ε,1)` for every ε), or drop it; label the second witness as the sum law's negative control and note that for the product law the same x, y give no counterexample because xy = 0. Not repaired since the previous review (its R03).

## R05 (P3) — Check values in §7.2 and §8.4 use the unnormalized trace under the τ = tr/2 convention; one wording in §4.3

Location: `README.md` line 1216, "`‖x‖_(H_C^p)=‖x‖_(H_R^p)=1=sup_n‖x_n‖_p`" for x = e₁₂ in the filtration of §7.1 (M₂(ℂ) with tr/2, line 1195); line 1427, "`‖a‖₁=1≤√2·‖a‖_(H¹)=√2·1`"; lines 857–858, "adjoint to each other but not inverse".

Claim: the stated values 1; the two p = 1 maps are adjoint to each other.

Witness: with τ = tr/2, `‖e₁₂‖_p=τ(e₂₂)^(1/p)=(1/2)^(1/p)`, `‖dx₂‖_(H_C^p)=‖e₂₂‖_p=(1/2)^(1/p)` and `‖a‖₁=τ(e₂₂)=1/2`; the §8.4 Check two lines above already computes `E₀(|a|²)=E₀(e₂₂)=1/2` with the same trace. The equalities and the endpoint bound hold with these values (`1/2≤√2·(1/2)`), so only the numbers are off. In §4.3 the two maps are the preadjoints of the inclusion N → M and of E; on the example, `ι_*∘E_*: c↦(c/2,c/2)↦c` is the identity of N_*, so they are one-sided inverses, and "adjoint to each other" is not their relation.

Repair: write `(1/2)^(1/p)` in §7.2 and `‖a‖₁=1/2≤√2·‖a‖_(H¹)=√2·(1/2)` in §8.4, or state that these two Checks use the unnormalized trace; in §4.3 write "the preadjoints of ι and of E respectively, with `ι_*∘E_*=id` on N_* and `E_*∘ι_*≠id`". Not repaired since the previous review (its R04).

## R06 (P3) — Locators into Cwikel's notes, an unlocated claim, and a misnamed inequality

Location: `README.md` lines 490–491, "(Bergh–Löfström, §4.1; Cwikel, §2.1)" for the strip construction; lines 500–501, "(Cwikel, §2.2; Bergh–Löfström, §4.1)" for the upper method; lines 503–504, "Prove that the lower and upper methods coincide with equal norms when one endpoint is reflexive" (no locator); lines 1134–1135, "the operator Cauchy–Schwarz inequality … (CStarAlgebras C3)".

Witness: cwikel line 289 is "2.1. Preface", which refers the definitions to Calderón's paper; line 425 is "2.2. Preliminaries, mainly about scalar valued analytic functions"; Cwikel's own definitions are "2.3. An alternative definition of the space [X₀,X₁]_θ" (line 879) and "2.4. An alternative definition of the Calderón 'upper' method" (line 1111); the duality theorem is Theorem 2.2 (line 319). The reflexive-endpoint coincidence is Bergh–Löfström, Theorem 4.3.1 (Calderón 1964, §9.2), which neither the claim nor the References entry (lines 1458–1462) names. CStarAlgebras C3 at its head has the finite row/column matrix norm formulas but no inequality by the name "operator Cauchy–Schwarz" (the only Cauchy–Schwarz mentions in that README are the multiplicative-domain Check at line 1012 and a scalar use at line 1383); the inequality used is the row–column factorization `∑u_αv_α=[u_α]·[v_α]ᵀ` through those formulas.

Repair: cite Cwikel §2.3 (with Calderón via Bergh–Löfström §4.1) for the lower method, Cwikel §2.4 for the upper method and Cwikel Theorem 2.2 for the duality; add Bergh–Löfström, Theorem 4.3.1, at the reflexive-endpoint claim and in the References entry; in §6.3 say "the row–column factorization of CStarAlgebras C3's finite row/column norm formulas". Not repaired since the previous review (its R05).

## Previous findings

- R01 — not repaired: line 545 still reads "`∫ t^(−1)min(t,1)² dt/t=∫₀¹ t dt+∫₁^∞ t^(−2) dt=1/2+1=3/2`" (this report's R02).
- R02 — not repaired: line 285 still cites "(Fack–Kosaki, Theorem 4.9(iii); Hiai, Lemma 5.3 and Theorem 5.10)" and line 427 still says "finite outside sets of finite measure" (this report's R03).
- R03 — not repaired: lines 268–269 and 274–276 carry the same two controls, "would admit rank-one cuts" and "with x+y∉V(ε,1) when n>ε" for the product law (this report's R04).
- R04 — not repaired: line 1216 "=1=sup_n‖x_n‖_p", line 1427 "‖a‖₁=1≤√2·‖a‖_(H¹)=√2·1", lines 857–858 "adjoint to each other but not inverse" (this report's R05).
- R05 — not repaired: lines 490–491 "Cwikel, §2.1", lines 500–501 "Cwikel, §2.2", lines 503–504 without a locator, lines 1134–1135 "operator Cauchy–Schwarz inequality … (CStarAlgebras C3)"; `grep 'Theorem 4.3.1' README.md` finds nothing (this report's R06).

## Verified sound

**The changed passages (diff since bb121b3, 65 insertions and 25 deletions, all in README.md).**

- §1.5, `μ_t(x)=a_⌊t⌋(x)` on B(H) with Tr. Route checked step by step: `Tr(1−e)` is an integer or ∞, so `Tr(1−e)≤t` is corank ≤ ⌊t⌋; `x(1−e)` has rank ≤ ⌊t⌋ and `x−x(1−e)=xe`; conversely for F of rank ≤ ⌊t⌋ the projection e onto ker F has corank `dim(ker F)^⊥ = rank F* = rank F ≤ ⌊t⌋` and `Fe=0` gives `‖xe‖=‖(x−F)e‖≤‖x−F‖`. With OperatorIdeals' `a_n(T)=inf{‖T−R‖ : rank R≤n}` (main, `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` lines 35–37, OI-A01 at 125–127: zero-based, `a₀(T)=‖T‖`) the two infima are over the same set, so the identity holds for every bounded x, not only compact ones. Hiai, Lemma 4.16(2) (hiai line 1628–1629) is the projection-cut formula with the `‖ae‖=+∞` convention (line 1619); Example 4.13(1) (line 1584–1587) gives `M̃=B(H)` and the norm topology; Example 4.15(1) (lines 1608–1613) gives `μ_t(a)=λ_n` for `n−1≤t<n` for compact a, which is `a_⌊t⌋` in the zero-based convention (`s_n=a_(n−1)`, OperatorIdeals line 37); Example 5.2(1) (lines 1934–1936) is `Lp(B(H),Tr)={a : Tr|a|^p<∞}` for the full range 0 < p ≤ ∞ of Hiai's definition (line 1932). The sum formula follows from the §1.1 rearrangement formula: `∫₀^∞ a_⌊t⌋^p dt = ∑_j a_j^p`. Compactness of the members: `∑a_j^p<∞` forces `a_j→0`, which is finite-rank approximability in Part A's sense (OperatorIdeals lines 44–45, 90) and compactness in a Hilbert space.
- §1.6, the weak gauge on B(H): on [j,j+1) the function `t^(1/p)a_j` has supremum `(j+1)^(1/p)a_j`, not attained; so `sup_t t^(1/p)μ_t(x)=sup_j (j+1)^(1/p)a_j(x)`. Membership gives `a_j≤C(j+1)^(−1/p)→0`, so the members are compact; at p = 1 the class is `sup_j (j+1)a_j<∞`, which is the `S_(1,∞)` NoncommutativeGeometry writes (main line 372, `sup_(j≥0)(j+1)μ_j(T)<∞`).
- The six new Checks, recomputed: rank-one projection e has `d_e(λ)=1` for λ < 1 and 0 for λ ≥ 1, so `μ_t(e)=1` on (0,1) and 0 for t ≥ 1; `a₀=1`, `a_j=0` for j ≥ 1; `‖e‖_p=(1)^(1/p)=1`; reading `a_⌈t⌉` gives `a₁=0` on (0,1] and 0 after, so `‖e‖_p=0`. `diag((j+1)^(−2))`: `Tr|x|^p=∑(j+1)^(−2p)`, finite iff 2p > 1; `‖x‖₁=ζ(2)=π²/6`, `‖x‖_(3/4)^(3/4)=ζ(3/2)=2.612…`, p = 1/2 gives the harmonic series; `∑a_j=π²/6<∞` so a gauge without the p-th power admits it for every p. Identity: `a_j(1)=inf_{rank F≤j}‖1−F‖=1` in infinite dimension (1−F has a unit vector in ker F), `μ_t(1)=1`, `∑1^p=∞`. Weak gauge of e: `sup_(0<t<1)t^(1/p)=1=(0+1)^(1/p)·1`, and `sup_j j^(1/p)a_j(e)=0·1+0=0`. `diag((j+1)^(−1/p))`: `a_j=(j+1)^(−1/p)` is decreasing, `(j+1)^(1/p)a_j=1`, `∑a_j^p=∑1/(j+1)=∞`; at p = 1 it is `diag(1/(j+1))`.
- Scope bullet, Layer 1 example, Downstream consumers: consistent with §1.5–§1.6 and with each other (S_p for p < 1 as Lp(B(H),Tr), weak Schatten as weak Lp, `μ_t=a_⌊t⌋`, no finite-trace inclusion asserted for B(H)). NoncommutativeGeometry at the head of #1143 (its README, lines 46–52, 143, 525–540, 606, 667, 680–684) assigns exactly these objects to NoncommutativeIntegration Layer 1 §1.3–§1.6 and consumes them; NoncommutativeGeometry on main (line 59, 372–375) and at the head of #1187 (lines 60, 373–375) cite I1 for tracial Lp including 0 < p < 1, weak Lp and the B(H) specialization. OperatorIdeals on main owns S_p for 1 ≤ p ≤ ∞ only (lines 51–52, 97–98) and has no weak Schatten class or subunit exponent (grep for weak, Lorentz, quasi-norm, `0<p`: only the weak-majorization transfer OI-B74). So the Schatten quasi-ideals for p < 1 and the weak Schatten classes have one owner, this roadmap, and the consumers cite it.
- References: the Hiai entry now lists Examples 4.13 and 4.15, Lemma 4.16 and Example 5.2, matching the citations in §1.2 and §1.5.

**Supplier citations in the changed passages, resolved now.** VonNeumannAlgebras is on main (merge order line 5; this roadmap line 285): V10.TracialLp (main README line 2338–2345) constructs Lᵖ(M,τ) for 1 ≤ p < ∞ from τ-measurable operators with completeness, Hölder, L² = GNS and L¹ = M_*, as the Scope bullet says; V10.Affiliation at 2305; Layer 11 at 2785 names "NoncommutativeIntegration I4" at 3066. OperatorTheory/OperatorIdeals Parts A–B on main (lines 108, 282); Majorization MAJ-A28 and MAJ-A31 unchanged since the previous review. BanachSpaceTheory is on main with B1 (line 54) and B2 (line 135). FreeProbability on main cites I4 (lines 64, 435). Mathlib at `1b1ccf4b`: `LinearMap.singularValues : ℕ →₀ ℝ` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean` line 95, embedded through `Fin.valEmbedding`, so zero-indexed with `s_j=0` for j ≥ d) and `singularValues_antitone` (line 142).

**Gate and dependency check.** `tauceti-roadmap gate … --base origin/main`: every text check 0, `outside-folder=0`, `dirty=0`, OK; with `--build`: `build=2 FAIL` on the Lake warning quoted in R01 and nothing else. `gate --depcheck … --movable`: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line for NoncommutativeIntegration. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeIntegration'` is empty (the list of files in the worker's change summary is the merge of main into the branch, not changes of the pull request).

**Lean.** `lake env lean` on `Suggested.lean` at the new pins: five `sorry` warnings (lines 76, 88, 97, 104, 112), nothing else. The worker's `#check @name` file (the file plus ten `#check` lines) elaborated once: the ten types agree with the previous review's and with the README (`matrixLpGauge : {d : ℕ} → ℝ≥0 → CStarMatrix (Fin d) (Fin d) ℂ → ℝ`, the five theorems quantified over `d n` with `p` as the only implicit, constants `B`, `A` and `(√3)⁻¹` uniform in d and n); no section binder is lost. The one-tactic probe and the padding check are carried from the previous review, since the file is byte-identical; the pin move changes no library name the file uses (`CStarMatrix`, `CFC.nnrpow`, `CFC.sqrt`, `Matrix.trace`, the two instance selections, all elaborate).

**Sources in the seeded sample.** Of the fifteen seeded targets, §1.5 and §1.6 fall in the changed passages and were verified above (hiai lines 1584, 1608, 1623–1632, 1932–1936; Bergh–Löfström §1.3 not readable, below). The remaining thirteen (§1.1, §1.4, §2.5, §2.6, §3.4, §3.5, §4.3, §4.4, §5.2, §6.1, §7.3, §7.4, §8.3) are untouched by the diff and carry the previous review's verification. The carried findings' witnesses were re-read at this head: fk86 lines 851–857 and 868–881, hiai lines 1596, 1939–1942 and 2221, cwikel lines 289, 319, 425, 879 and 1111, CStarAlgebras at the head of #860 lines 1012 and 1383.

**Adversarial pass.** One row per statement; rows for statements the diff leaves untouched are carried from the review at bb121b3 and say so; the new rows carry values computed now.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §1.5 `μ_t(x)=a_⌊t⌋(x)` on B(H) | rank-one projection e; t ∈ (0,1), [1,∞) | cut side: corank 0 forces e = 1, `‖e·1‖=1`; corank 1 allows `e'=1−e`, `‖e e'‖=0`; `a₀(e)=‖e‖=1`, `a₁(e)=0` (F = e) | ✓ | none |
| §1.5 identity, dim H = ∞ | t > 0, j ≥ 0 | `‖1−F‖≥1` on a unit vector of ker F, so `a_j(1)=1`; `d_1(λ)=∞` for λ < 1, 0 for λ ≥ 1: `μ_t(1)=1` | ✓ | none |
| §1.5 the two conventions agree | x = diag(3,1) in M₂ | `a₀=3`, `a₁=1`, `a_j=0` (j ≥ 2); `μ_t=3,1,0` on (0,1), [1,2), [2,∞) = `s_⌊t⌋` of §1.1 | ✓ | none |
| §1.5 sum formula | x = diag(3,1), p = 1, 2 | `∫₀^∞a_⌊t⌋^p dt = 3^p+1^p`: 4 and 10; `(Tr|x|^p)^(1/p)=4, √10` | ✓ | none |
| §1.5 `a_⌈t⌉` wrong model | rank-one e, p = 1 | `a_⌈t⌉=a₁=0` on (0,1]: `∫=0`, `‖e‖_p=0` for e ≠ 0 | ✓ excluded | none |
| §1.5 `diag((j+1)^(−2))` | p = 1, 3/4, 1/2 | `∑(j+1)^(−2)=π²/6`; `∑(j+1)^(−3/2)=ζ(3/2)=2.612…`; `∑(j+1)^(−1)=∞`; threshold 2p > 1 | ✓ | none |
| §1.5 gauge without p-th power | same x, any 0 < p < 1 | `∑a_j=π²/6<∞` | ✓ wrong model excluded | none |
| §1.5 compactness of members | `a_j→0` | `‖x−F_j‖→0` with rank F_j ≤ j: norm limit of finite rank | ✓ | none |
| §1.5 p = ∞ | identity | `μ_t(1)=1`, `sup_t μ_t = ‖1‖ = 1`: in L∞ = B(H), in no Lp, p < ∞ | ✓ | none |
| §1.5 1 ≤ p < ∞ against OperatorIdeals S_p | OI symmetric gauge `Φ_p(a)=(∑ aₙ^p)^(1/p)`, 1 ≤ p ≤ ∞ (main lines 455, 464, 487–488) | same sequence `a_n`, same gauge: isometric | ✓ | none |
| §1.6 weak gauge on B(H) | `t^(1/p)a_j` on [j,j+1) | sup `(j+1)^(1/p)a_j`, not attained; overall `sup_j(j+1)^(1/p)a_j` | ✓ | none |
| §1.6 rank-one e, weak gauge | p = 1, 2 | `sup_(0<t<1)t^(1/p)=1`; `(0+1)^(1/p)·1=1`; unshifted `0·a₀+∑_(j≥1)j^(1/p)·0=0` | ✓ | none |
| §1.6 `diag((j+1)^(−1/p))` | p = 1, 2 | `(j+1)^(1/p)a_j=1` for all j: gauge 1; `∑a_j^p=∑1/(j+1)=∞`; p = 1: `diag(1/(j+1))`, `∑1/(j+1)=∞` so not trace class | ✓ | none |
| §1.6 members compact | gauge C | `a_j≤C(j+1)^(−1/p)→0` | ✓ | none |
| §1.6 p = 1 is NoncommutativeGeometry's `S_(1,∞)` | main line 372 | `sup_(j≥0)(j+1)μ_j(T)<∞` with `μ_j` zero-based = `(j+1)^(1/1)a_j` | ✓ same object, one owner | none |
| Scope: "p-summable, respectively `O((j+1)^(−1/p))`" | `diag((j+1)^(−1/p))`, `diag((j+1)^(−2))` | first: weak only; second: Lp for p > 1/2 | ✓ | none |
| Layer 1 example, B(H): "finite-trace inclusions fail" | `diag(1/(j+1))` | in S₂ (`∑(j+1)^(−2)<∞`), not S₁: `Lq⊄Lp` for p = 1 < q = 2 | ✓ | none |
| Downstream: NoncommutativeGeometry N3–N4 consume §1.3–§1.6 | #1143 head lines 143, 525–540, 667, 680–684 | cites §1.3, §1.4, §1.5, §1.6 by number for the same laws | ✓ | none |
| §1.1 `μ_t(x)=s_⌊t⌋(x)`, unnormalized trace | x = diag(3,1), t ∈ (0,1), [1,2), ≥ 2 | d_x = 2, 1, 0 on λ < 1, [1,3), ≥ 3; μ = 3, 1, 0 | ✓ (carried from the review at bb121b3) | none |
| §1.1 normalized trace | same, t = 1/2 | `d/2 ≤ 1/2` ⟺ `#{s_j>λ} ≤ 1`: μ = 1 = s_⌊2·½⌋ | ✓ (carried from the review at bb121b3) | none |
| §1.1 right continuity | f = 1_(0,1/2) on (0,1), t = 1/2 | d_f(λ) ≤ 1/2 for all λ ≥ 0: μ_{1/2} = 0; t < 1/2: μ = 1 | ✓ (carried from the review at bb121b3) | none |
| §1.1 shifted sum law | x = e₁₁, y = e₂₂, s = t = 1/2 | μ₁(1) = 1 ≤ 1+1; unshifted t = 1: μ₁(1) = 1 > 0+0 | ✓ (carried from the review at bb121b3) | none |
| §1.1 `μ_t(f(|x|))=f(μ_t(x))`, f(0) ≠ 0 | f = λ²+1, t ≥ 2 | left 0 (trace 2), right 1 | ✓ fails as stated (carried from the review at bb121b3) | none |
| §1.2 `V(ε,δ)` on M₂, δ < 1 | e ≠ 1 | τ(1−e) ≥ 1 > δ: e = 1, norm ball | ✓ (carried from the review at bb121b3) | none |
| §1.2 rank-one cut at δ = 1 | e = e₁₁ | τ(1−e) = 1: admitted by `≤ 1`, excluded by `< 1` | ✗ control reversed (carried from the review at bb121b3; not repaired) | R04 |
| §1.2 `x_n = n1_(0,1/n)` | e = 1−1_(0,1/n) | x_n e = 0, τ(1−e) = 1/n: x_n ∈ V(ε,1/n), ‖x_n‖_∞ = n | ✓ (carried from the review at bb121b3) | none |
| §1.2 sum law with max | x = n1_(0,1), y = n1_(1,2), ε < n | each in V(ε,1); x+y needs τ(1−e) ≥ 2 | ✓ for sum, xy = 0 for product (carried from the review at bb121b3; wording not repaired) | R04 |
| §1.2 Fatou | x_n = 1_(n,n+1) | τ(0) = 0 < liminf 1 | ✓ (carried from the review at bb121b3) | none |
| §1.3 p-triangle in ℓ^{1/2} | x = e₁, y = e₂ | ‖x+y‖^{1/2}_{1/2} = 2 = 1+1; ‖x+y‖_{1/2} = 4 > 2 | ✓ (carried from the review at bb121b3) | none |
| §1.3 `x_n = n^{1/p}1_(0,1/n)` | p = 1, 2 | ‖x_n‖_p = 1; support 1/n → 0 | ✓ no converse (carried from the review at bb121b3) | none |
| §1.3 `V(ε,δ)∩Lp ⊇ {‖x‖_p ≤ εδ^{1/p}}` | x = ε1_(0,δ) | ‖x‖_p = εδ^{1/p}; boundary of V | ✓ (carried from the review at bb121b3) | none |
| §1.3 completeness 0 < p < 1 locator | — | fk86 4.9 is Haagerup Lp; hiai 5.10 is p ≥ 1 | ✗ locator (carried from the review at bb121b3; not repaired) | R03 |
| §1.4 Ky Fan at k = 1, 2 | x = e₁₁, y = e₂₂ | s(x+y) = (1,1), s(x) = s(y) = (1,0): 1 ≤ 2, 2 ≤ 2 | ✓ (carried from the review at bb121b3) | none |
| §1.4 not weak submajorization | a = (1,1) ≺_w b = (2,0), g = √ | 2 > √2 | ✓ (carried from the review at bb121b3) | none |
| §1.4 concave inequality | x = e₁₁, y = e₁₂, g = √, t = 1 | s(x+y) = (√2,0): 2^{1/4} ≈ 1.19 ≤ 2 | ✓ (carried from the review at bb121b3) | none |
| §1.4 Hölder constant 1 | ℂ², x = y = (1,1), p = q = 2 | ‖xy‖₁ = 2 = √2·√2 | ✓ (carried from the review at bb121b3) | none |
| §1.5 finite-trace inclusion | ℂ², x = (1,1), p = 1, q = 2 | 2 ≤ 2^{1/2}·√2 = 2; exponent reversed gives 2 ≤ 1 | ✓ (carried from the review at bb121b3) | none |
| §1.5 no inclusion for infinite trace | (1/n) ∈ ℓ²∖ℓ¹; t^{−1/2}1_(0,1) ∈ L¹∖L²; 1_(1,∞)/t ∈ L²∖L¹ | ∑1/n² < ∞, ∑1/n = ∞; ∫₀¹t^{−1/2} = 2, ∫₀¹t^{−1} = ∞; ∫₁^∞t^{−2} = 1, ∫₁^∞t^{−1} = ∞ | ✓ (carried from the review at bb121b3) | none |
| §1.5 Schatten values | x = diag(3,1) | ‖x‖₁ = 4, ‖x‖₂ = √10, ‖x‖_∞ = 3; normalized 2, √5, 3 | ✓ (carried from the review at bb121b3) | none |
| §1.5 S_p, 0 < p < 1 | diag(1/n), p = 1/2 | ∑n^{−1/2} = ∞; diag(1/n²) ∈ S₁ | ✓ (carried from the review at bb121b3) | none |
| §1.6 weak Lp ⊋ Lp | f = t^{−1/p} | sup t^{1/p}t^{−1/p} = 1; ∫dt/t = ∞ | ✓ (carried from the review at bb121b3) | none |
| §1.6 q = p recovers ‖·‖_p | — | `(t^{1/p}μ_t)^p/t = μ_t^p` | ✓ (carried from the review at bb121b3) | none |
| §1.6 weak L¹ of diag(3,1) | t ∈ (0,1), [1,2) | sup 3t = 3, sup t·1 = 2: 3; ‖x‖₁ = 4 | ✓ (carried from the review at bb121b3) | none |
| §2.1 L¹ dual is M, not M* | ℓ∞ | (ℓ¹)* = ℓ∞; (ℓ∞)* ⊋ ℓ¹ | ✓ (carried from the review at bb121b3) | none |
| §2.1 norming element | x = diag(3,1), p = 2 | τ(x·x/√10) = 10/√10 = √10 | ✓ (carried from the review at bb121b3) | none |
| §2.1 cyclicity | x = e₁₂, y = e₂₁ | τ(e₁₁) = 1 = τ(e₂₂) | ✓ (carried from the review at bb121b3) | none |
| §2.2 K-functional | f = 1_(0,1) on (0,∞) | K(t,f) = ∫₀ᵗ f* = min(t,1); (E,E): min(1,t)‖x‖ | ✓ (carried from the review at bb121b3) | none |
| §2.2 non-regular (c₀,ℓ∞) | — | c₀ ∩ ℓ∞ = c₀ not dense in ℓ∞ | ✓ (carried from the review at bb121b3) | none |
| §2.3 `[L¹,L∞]_θ = L^p`, 1/p = 1−θ | θ = 1/2 | p = 2; convention 1/p = θ gives the same at 1/2 only | ✓ (carried from the review at bb121b3) | none |
| §2.3 `[ℓ∞₂,ℓ²₂]_{1/2} = ℓ⁴₂` | — | 1/q = 0 + 1/4 | ✓ (carried from the review at bb121b3) | none |
| §2.3 operator estimate 2^θ | T = id: (E,E) → (E,E′), ‖·‖₁ = 2‖·‖ | f(z) = 2^{θ−z}x: boundary norms 2^θ‖x‖, 2·2^{θ−1}‖x‖; three lines on φ gives ‖x‖ ≤ 2^{−θ}‖x‖_θ; ‖T‖_θ = 2^θ = 1^{1−θ}2^θ | ✓ (carried from the review at bb121b3) | none |
| §2.4 (E,E)_{θ,q} | θ ∈ {0,1} | ∫₀¹ t^{−θq}dt/t diverges at θ = 0; ∫₁^∞ t^{(1−θ)q}dt/t at θ = 1 | ✓ (carried from the review at bb121b3) | none |
| §2.4 (L¹,L∞)_{1/2,2} value | f = 1_(0,1) | integrand t^{−2}min(t,1)²: ∫₀¹1 + ∫₁^∞t^{−2} = 1+1 = 2, not 3/2 | ✗ value (carried from the review at bb121b3; not repaired) | R02 |
| §2.4 (L¹,L∞)_{θ,∞} = weak Lp | f = t^{−1/p}, p > 1 | K = t^{1−1/p}/(1−1/p); sup t^{−θ}K < ∞ iff θ = 1−1/p | ✓ (carried from the review at bb121b3) | none |
| §2.5 exponent convention | p₀ = 1, p₁ = ∞, θ = 1/4 | (1−θ)/1 = 3/4 → p = 4/3; swapped: 1/4 → p = 4 | ✓ (carried from the review at bb121b3) | none |
| §2.5 retraction K | x = diag(3,1) | K = 3t, 2+t, 4; K(1) = 3 = ‖diag(2,0)‖₁+‖1‖_∞ | ✓ (carried from the review at bb121b3) | none |
| §2.6 scalar case | ℓ¹_N → ℓ∞_N norm 1, ℓ∞_N → ℓ¹_N norm N | θ = 1/2: bound √N vs actual 1 | ✓ not sharp (carried from the review at bb121b3) | none |
| Conventions / §3.2 sign of θ_s(h_ω) | Tr∘θ_s = eˢTr, ω̂ θ-invariant | Tr(hθ_s y) = Tr(hy) = eˢTr(θ_{−s}(h)y) ⇒ θ_s(h) = eˢh; Lp character e^{s/p} | ✓ (Hiai has e^{−s} with τ∘θ_s = e^{−s}τ, 5036–5037, 5362) (carried from the review at bb121b3) | none |
| §3.1 semifinite core | R = M⊗̄L∞(ℝ), θ_s f(u) = f(u−s), Tr = τ⊗eᵘdu | Tr∘θ_s = eˢTr; θ_s(x⊗e^{−u/p}) = e^{s/p}x⊗e^{−u/p} | ✓ (carried from the review at bb121b3) | none |
| §3.1 Lp ∩ Lq = 0 | p ≠ q | e^{s/p}x = e^{s/q}x ∀s ⇒ x = 0 | ✓ (carried from the review at bb121b3) | none |
| §3.2 M = ℂ, ω = id | h = e^{−u} | Tr(hy) = ∫y du Lebesgue, θ-invariant; Tr(1_(λ,∞)(h)) = ∫_{u<−logλ}eᵘdu = 1/λ | ✓ (carried from the review at bb121b3) | none |
| §3.2 μ_t(h_ω) and Tr(h_ω) | — | inf{λ : ω(1)/λ ≤ t} = ω(1)/t; ∫₀^∞ω(1)/t dt = ∞ | ✓ (carried from the review at bb121b3) | none |
| §3.2 nonfaithful ω = (1,0) | — | h = e₁₁⊗e^{−u}, support e₁₁⊗1 θ-fixed; 1_(0,1)(u) not translation-fixed | ✓ (carried from the review at bb121b3) | none |
| §3.3 distribution formula | p = 2, ‖x‖₂ = 1, λ = 2, t = 4 | 2^{−2} = 1/4; μ₄ = inf{λ : λ^{−2} ≤ 4} = 1/2 = 4^{−1/2} | ✓ (carried from the review at bb121b3) | none |
| §3.3 triangle via Ky Fan | p = 2; p = 1 | ∫₀¹s^{−1/2} = 2 both sides; ∫₀¹s^{−1} = ∞ | ✓ (carried from the review at bb121b3) | none |
| §3.3 p-triangle, p = 1/2, r = 1/4 | — | ∫₀¹s^{−1/2} = 2 cancels; ‖x+y‖^{1/4} ≤ ‖x‖^{1/4}+‖y‖^{1/4}; r ↑ 1/2 | ✓ (carried from the review at bb121b3) | none |
| §3.3 Hölder M = ℂ | x = y = h^{1/2} | ‖h‖₁ = 1 = 1·1 | ✓ (carried from the review at bb121b3) | none |
| §3.4 corner norm | M₂, e = e₁₁, ω ≥ 0 | ‖e h_ω e‖₁ = (eωe)(1) = ω(e) | ✓ (carried from the review at bb121b3) | none |
| §3.5 matrix identification | x h_τ^{1/p} = x⊗e^{−u/p} | tr_H(|x|^p⊗e^{−u}) = τ(|x|^p); with tr/d: /d | ✓ (carried from the review at bb121b3) | none |
| §4.1 left embedding | pairing ω_a(y) = tr(ay) | φ(yx) = tr(hyx) = tr((xh)y); xh = (xh^{1/p})h^{1−1/p} | ✓ (carried from the review at bb121b3) | none |
| §4.1 symmetric vs left | φ = tr(diag(1,2)·)/3, x = e₁₂ | left (2/3)^{1/p}; symmetric (1/3·2/3)^{1/(2p)} = (2/9)^{1/(2p)}; ratio 2^{1/(2p)}; h^{−1/(2p)}e₁₂h^{1/(2p)} = 2^{1/(2p)}e₁₂ reconciles | ✓ (carried from the review at bb121b3) | none |
| §4.3 no contraction below p = 1 | ℂ², (1/2,1/2), f = (1,0), p = 1/2 | ‖f‖^p_p = 1/2, ‖Ef‖^p_p = (1/2)^{1/2}: 1/4 vs 1/2 in the README's normalization: E not contractive | ✓ (carried from the review at bb121b3) | none |
| §4.3 nontracial witness | N diagonal, e₁₁ | h_{φ|N} = h; E_p(h^{1/(2p)}e₁₁h^{1/(2p)}) = (1/3)^{1/p}e₁₁; e₁₂ ↦ 0 | ✓ (carried from the review at bb121b3) | none |
| §4.3 non-invariant N | e₁₂+e₂₁ | σ_t = Ad diag(1,2)^{it}: 2^{−it}e₁₂+2^{it}e₂₁ ∉ N | ✓ (carried from the review at bb121b3) | none |
| §4.3 preadjoints | ℂ², N = ℂ | ι_*: (a,b) ↦ a+b; E_*: c ↦ (c/2,c/2); ι_*E_* = id, E_*ι_* ≠ id | ✓ values, wording (carried from the review at bb121b3; wording not repaired) | R05 |
| §4.4 Bochner norm | Ω two points, M = M₂ | ((‖x‖^p+‖y‖^p)/2)^{1/p} = ‖diag(x,y)‖_p for (1/2)⊗τ | ✓ (carried from the review at bb121b3) | none |
| §5.1 period | f(e^{iθ}) = θ, b_n = f(λ(2^{−n})) | e^{ib_n} = λ(2^{−n}); e^{−i2^{−n}a_n} = λ(2^{−n})*; σ^{φ_n}_{2^{−n}} = id; hjx 334–338 same branch | ✓ (carried from the review at bb121b3) | none |
| §5.1 M = ℂ, tracial M₂ | — | centralizer = R, R_n = R, Φ_n = id | ✓ (carried from the review at bb121b3) | none |
| §5.2 nestedness | λ(2^{−n}) = λ(2^{−n−1})² | b_n ≡ 2b_{n+1} mod 2π; a_n ≡ a_{n+1} mod 2^{n+1}π | ✓ (carried from the review at bb121b3) | none |
| §5.3 Hölder exponent | p = 1/2 | 1/r = 2−1/2 = 3/2, r = 2/3; ‖h^{3/2}‖_{2/3} = tr(h)^{3/2} = 1 | ✓ (carried from the review at bb121b3) | none |
| §5.3 normalization | τ_n(1) = d | x ↦ d^{−1/p}x carries unnormalized to normalized p-norm | ✓ (carried from the review at bb121b3) | none |
| §5.4 p_i ≠ 1 | ℂ², p = e₁, Φ(a,b) = (a,0) | φ∘Φ = (a/2) ≠ φ; pφp(a,b) = a/2 = φ(Φ(a,b)) | ✓ (carried from the review at bb121b3) | none |
| §5.5 BCL ⇒ moduli | u = (x+y)/2, v = (x−y)/2 | ‖u‖² ≤ 1−(p−1)ε²/4 ⇒ δ ≥ (p−1)ε²/8; reversed: ρ(t) ≤ √(1+(p−1)t²)−1 ≤ (p−1)t²/2 | ✓ (carried from the review at bb121b3) | none |
| §5.5 p = 2 | — | δ = 1−√(1−ε²/4) ≥ ε²/8; ρ = √(1+t²)−1 ≤ t²/2 | ✓ (carried from the review at bb121b3) | none |
| §5.5 scalars | x = y = 1, p = 3/2; p = 3 | 2 ≥ 3/2; 2 ≤ 3 | ✓ (carried from the review at bb121b3) | none |
| §5.5 p = 1 excluded | ℓ¹₂, x = e₁, y = e₂ | ‖x−y‖ = 2, ‖(x+y)/2‖ = 1: δ(2) = 0 | ✓ (carried from the review at bb121b3) | none |
| §5.5 matrix witness | x = e₁₁, y = e₁₂, p = 3/2 | s(x±y) = (√2,0): (2+2)/2 = 2 ≥ 1+1/2 | ✓ (carried from the review at bb121b3) | none |
| §6.1 matrix units | a_k = e_{1k}, n | ∑a*a = 1: C_p = n^{1/p}; ∑aa* = ne₁₁: R_p = √n | ✓ (carried from the review at bb121b3) | none |
| §6.1 realization | X = ∑a_k⊗e_{k1} | X*X = ∑a_k*a_k⊗e₁₁ | ✓ (carried from the review at bb121b3) | none |
| §6.1 p = 1 values | a = (e₁₁,e₁₂) | C₁ = ‖1‖₁ = 2; R₁ = ‖√2e₁₁‖₁ = √2 | ✓ (carried from the review at bb121b3) | none |
| §6.1 sum gauge = √2 | b = 0, c = a; dual x = a/√2 | ‖∑x*x‖ = 1/2, ‖∑xx*‖ = 1, ‖x‖_RC = 1; pairing 2/√2 = √2 | ✓ (carried from the review at bb121b3) | none |
| §6.2 K₁, K₂ for (1,1) | — | E|ε₁+ε₂| = 1; K₂ = √2 | ✓ (carried from the review at bb121b3) | none |
| §6.2 Lévy witness | x = (1,1), t = 1; x = (1,1,1) | 1/2 ≤ 2·1/2; P(max > 1) = 1/2, P(|S₃| > 1) = 1/4: 1/2 ≤ 1/2, fails without 2 | ✓ (carried from the review at bb121b3) | none |
| §6.3 dualities | — | (A+B)* = A*∩B* with max; L¹(ℓ²_C)* = L∞(ℓ²_C) | ✓ (carried from the review at bb121b3) | none |
| §6.3 pairing expansion | i = j terms counted | E(S⁴) = A+B+C−2D with all-index sums; (1,1): 4+4+4−4 = 8 = (16+16)/4 | ✓ (carried from the review at bb121b3) | none |
| §6.3 Pauli | σ_x, σ_z | S² = 2, E(S⁴) = 4; A = B = 4, C = 2+2(σ_xσ_z)² = 0, D = 2 | ✓ (carried from the review at bb121b3) | none |
| §6.3 bound 3 | T = ∑x_k² | A = T² ≤ ‖T‖²; B ≤ ‖T‖T; ‖C‖ ≤ ‖B‖ by u = v = x_ix_j; 0 ≤ E(S⁴) ≤ A+B+C | ✓ (carried from the review at bb121b3) | none |
| §6.3 optimality | x_k = 1 | E(S⁴) = 3n²−2n: n = 2: 8, n = 3: 21 | ✓ (carried from the review at bb121b3) | none |
| §6.3 truncation | c₀ = √3/2 | (|t|−c₀)₊² ≤ t⁴/(16c₀²) ⟺ (|t|−2c₀)² ≥ 0; t = √3: 3/4 = 3/4; E(F²) ≤ 3‖T‖²/12 < 1/4 | ✓ (carried from the review at bb121b3) | none |
| §6.3 iteration | — | [x] ≤ c₀(1+1/2+…) = √3 | ✓ (carried from the review at bb121b3) | none |
| §6.3 scalars (1,1) | — | 3^{−1/2}√2 ≈ 0.816 ≤ 1 ≤ √2; sharp n = 2 constant 1/√2 | ✓ (carried from the review at bb121b3) | none |
| §7.1 martingale of e₁₁ | tr/2 | x₀ = 1/2, x₁ = e₁₁; ‖x₀‖₂²+‖dx₁‖₂² = 1/4+1/4 = 1/2 = τ(e₁₁) | ✓ (carried from the review at bb121b3) | none |
| §7.2 values for e₁₂ | tr/2 | ‖dx₂‖_p = (1/2)^{1/p}, not 1 | ✗ value (carried from the review at bb121b3; not repaired) | R05 |
| §7.3 x₁*x₁ identity | dx₀ = 1/2, dx₁ = e₁₁−1/2 | 1/4+1/4 + (e₁₁−1/2) = e₁₁ | ✓ (carried from the review at bb121b3) | none |
| §7.4 transform (1,−1,1) | — | 1/2−(e₁₁−1/2) = e₂₂ | ✓ (carried from the review at bb121b3) | none |
| §7.4 commutation | v = e₂₁, A = e₁₁ | vAv* = e₂₂ ≰ cA | ✓ (carried from the review at bb121b3) | none |
| §7.4 L¹ fails | x_n = 2ⁿ1_(0,2^{−n}) | E_n x_{n+1} = 2^{n+1}/2 = 2ⁿ; norm 1; no L¹ limit | ✓ (carried from the review at bb121b3) | none |
| §7.5 scalars p = 4 | (1,1) | K₄⁴ = (16+16)/4 = 8; max(C₄,R₄) = √2; B₄ ≥ 2^{1/4} | ✓ (carried from the review at bb121b3) | none |
| §7.5 type in ℓ¹ | e_k | n vs √n | ✓ (carried from the review at bb121b3) | none |
| §7.5 McCarthy | ℂ², r = 2, 1/2 | 2 = 2; 2 ≤ 4; √2 ≤ 2 | ✓ (carried from the review at bb121b3) | none |
| §8.1 square function | e₁₂h^{1/p} | h^{1/p}e₂₂h^{1/p} = (2/3)^{2/p}e₂₂ ∈ L^{p/2}, norm (2/3)^{2/p}; sqrt (2/3)^{1/p} = ‖e₁₂h^{1/p}‖_p | ✓ (carried from the review at bb121b3) | none |
| §8.2 trace preservation | y ∈ R_m | φ̂(e^{−a_m}Ê_n y) = φ̂(Ê_n(e^{−a_m}y)) needs e^{−a_m} ∈ R(M₀) | ✓ (carried from the review at bb121b3) | none |
| §8.4 BMO of 1 | n = 0 | E₀(1) = 1: ‖1‖_BMO_C = 1 | ✓ (carried from the review at bb121b3) | none |
| §8.4 BMO of e₁₂ | tr/2 | 1/2, e₂₂, e₂₂ → 1; row e₁₁ → 1; = ‖e₁₂‖_∞ | ✓ (carried from the review at bb121b3) | none |
| §8.4 endpoint value | e₁₂ | ‖a‖₁ = 1/2 (tr/2), not 1 | ✗ value (carried from the review at bb121b3; not repaired) | R05 |
| §8.4 reverse fails | dyadic x_n | dx_k = ±2^{k−1} on (0,2^{−k+1}); S² = (4^j−1)/3 on (2^{−j},2^{−j+1}); ‖S‖₁ = ∑2^{−j}2^j/√3 = ∞ | ✓ (carried from the review at bb121b3) | none |
| §8.4 constants | px97 (ii) | (1/√3)‖a‖ ≤ ‖φ_a‖ ≤ √2‖a‖ ⟺ README | ✓ (carried from the review at bb121b3) | none |
| `matrixLpGauge` | p = 2, x = diag(3,1); wrong models | tr(|x|²)^{1/2} = √10; `x*star x` same by unitary invariance; omitting `.re^(1/p)` fails; normalized trace excluded by `Matrix.trace` | ✓ (carried from the review at bb121b3) | none |
| `columnSquare`/`rowSquare` | (e_{1k}) | n^{1/p} vs √n distinguishes the swapped model | ✓ (carried from the review at bb121b3) | none |
| `randomSumGauge` | n = 1; no division | ‖a‖_p; 2^{n/p} too large | ✓ (carried from the review at bb121b3) | none |
| `rowColumnSumGauge` | n = 0; general | set = {0}: 0; nonempty (b = a, c = 0), bounded below by 0, so `Real.sInf` is the infimum | ✓ (carried from the review at bb121b3) | none |
| `matrix_khintchine_high` | n = 0; d = 0; p = 2 | all gauges 0; S = K, any B ≥ 1 | ✓ (carried from the review at bb121b3) | none |
| `matrix_khintchine_low` / `_one` | n = 0; p = 1 overlap | 0 ≤ 0; A = 1/√3 consistent | ✓ (carried from the review at bb121b3) | none |
| `matrix_ball_carlen_lieb_low/high` | d = 0; p = 2 | 0 ≤ 0; both become the parallelogram law | ✓ (carried from the review at bb121b3) | none |
| Lean generality vs README | all five | matrices with constants uniform in d, n; README states every von Neumann algebra and the docstring says why | ✓ (carried from the review at bb121b3) | none |

## Not verifiable

- Bergh–Löfström, *Interpolation Spaces* (§1.3, cited in §1.6 for the Lorentz gauges; and §§2.3, 3.1, Theorems 3.1.2, 3.4.1, 4.1.2, 4.3.1, 4.5.1, 4.6.1, 5.1.1, 5.1.2, 5.2.1, §5.3): Springer book, DOI 10.1007/978-3-642-66451-9, paywalled; cited by locator.
- Pisier–Xu, *Non-Commutative Lp-Spaces*, Handbook 2 (§§1–3, 5–7): Elsevier, DOI 10.1016/S1874-5849(03)80041-4, paywalled.
- Kosaki, J. Funct. Anal. 56 (1984): Elsevier, paywalled; its use is confirmed through hjx lines 846, 996–1001.
- Takesaki, *Theory of Operator Algebras II* (VIII.3, IX.4.2, X.2.3): book, not online; the statements used are Hiai's.
- Ball–Carlen–Lieb, Invent. Math. 115 (1994): Springer, paywalled; checked through rx14 lines 56–65.
- Lust-Piquard–Pisier, Ark. Mat. 29 (1991): Springer, paywalled.
- Ledoux–Talagrand, *Probability in Banach Spaces* (Proposition 2.3, Theorem 4.7): Springer book, paywalled.
- Burkholder, Handbook 1 (2001), §2: Elsevier, paywalled.
- Ky Fan, PNAS 37 (1951): the cached text `Fan1951` is in the worker's manifest; the inequality is also confirmed from moslehian lines 98–99 with the attribution.

## Source issues

- **Misprint** in hiai at Remark 11.23, printed page 112 (line 5570): the source writes the singular-number formulas with the exponent `t^{1/p}` (and `t^{1/q}`, `t^{1/r}`); it should be `t^{−1/p}` as in (11.9) (line 5429), which the same remark cites; affects nothing.
