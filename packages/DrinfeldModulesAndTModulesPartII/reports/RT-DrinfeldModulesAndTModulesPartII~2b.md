<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1436#issuecomment-6407253905 -->
Red team round 2 pass b (claude) of 34d0752

Verdict: needs_changes

1. **F01** (P3) The §2.5 Check misdescribes the reduction of ζ_A(q + 1)

   Location: `packages/DrinfeldModulesAndTModulesPartII/README.md:679`, "the reduction gives ζ_A(q + 1) as a combination of ζ_A(q, 1) (type 1) and indices (1, t) of depth ≥ 2 (type 2)".

   Claim: the output of the §2.5 reduction of (q + 1) is supported on (q, 1) and on indices beginning with 1.

   Witness: the route of §2.5 for s = (q+1) is C_{(1)}(R_1) summed over d. By §1.2, S_d(q)S_d(1) = S_d(q+1) + Δ^{[q−1]}_{q,1}S_d(2, q−1) with Δ^{[q−1]}_{q,1} = binom(q−2, 0) = 1, so the relation is S_d(q+1) + S_d(q,1) + S_d(2,q−1) + D_1(S_{d+1}(1,q−1,1) + S_{d+1}(1,1,q−1) + S_{d+1}(1,q)) = 0; the type-2 index (2, q−1) does not begin with 1. Recomputed exactly at q = 3 in u = θ⁻¹ to u³⁹ for d = 0, 1, 2: residual 0 with the (2,2) term, nonzero (first coefficient 2u⁹ at d = 1) without it. At q = 2 the term merges with (q,1) and the two copies cancel in characteristic 2, which is why the Check reads correctly only there.

   Repair: replace the Check by "For s = (q + 1), C_{(1)}(R_1) gives ζ_A(q + 1) = −ζ_A(q, 1) − ζ_A(2, q − 1) − D_1(ζ_A(1, q − 1, 1) + ζ_A(1, 1, q − 1) + ζ_A(1, q)): ζ_A(q, 1) is of type 1 and the four other indices are of type 2, their first entries 2 and 1 being smaller than q + 1. At q = 2 the two copies of ζ_A(2, 1) and of ζ_A(1, 1, 1) cancel and the relation is ζ_A(3) = D_1ζ_A(1, 2)." Tested at q = 3, d = 0: 1 + 0 + 0 + D_1ℓ_1⁻¹ = 0; and at q = 2 it reproduces the Check of §2.10.

2. **F02** (P3) Stray character in the module docstring title

   Location: `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean:3`, "/-!+# Drinfeld modules and t-modules, Part II: target signatures".

   Claim: the module docstring has the form "<title>: target signatures".

   Witness: the opening is `/-!+#`; the title therefore reads "+# Drinfeld modules …". No other `Suggested.lean` on main or at an open head opens with `/-!+` (grep over every `Suggested.lean` on main, in Completed and in the supplied sibling checkouts: 0 hits; PeriodsAndSpecialValues opens `/-!` then `# Periods and special values: target signatures`).

   Repair: replace line 3 by `/-!` and insert a new line 4 `# Drinfeld modules and t-modules, Part II: target signatures`. The docstring content is otherwise unchanged; elaboration is unaffected.

Two new findings, both P3 (S01, S02). Every round-1 finding is repaired at this head, and no repair introduced an error (table below).

## Round-1 findings at this head

| Finding | Status | Witness at 34d0752 |
|---|---|---|
| a-F01 (P1) §3.9 (b) used Chang Theorem 5.5.2 | repaired | `packages/DrinfeldModulesAndTModulesPartII/README.md:973`: "(b): in each weight w ≥ 1 choose a K-basis V_w of Z_w consisting of MZVs … by the homogeneous multiplication of §1.7". Needs line 982 lists §1.7 and §0.9; Layer 3 dependencies (line 1043) read "Earlier layers 0, 1". Theorem 5.5.2 is cited only as a locator of (5.5.3) in §3.5. Retested: q = 3, weights 0, 1, 2 give 1 + 1 + 2 basis MZVs; ζ_A(1)² = ζ_A(2) + 2ζ_A(1,1) lies in 𝒵_2 by §1.7, so the K̄-span of all MZVs is closed under products. |
| a-F02 (P3) §2.12 Check without weight range | repaired | line 787: "For w ≤ q, AS_w = AT_w … first differ at w = q + 1 … At q = 2 and w = 3, AS_3 consists of (3) and (1, 1, 1) and AT_3 of (2, 1) and (1, 1, 1)". Recomputed: AS_w = AT_w for w ≤ q at q = 2, 3, 4, 5; (q+1) ∈ AS_{q+1} ∖ AT_{q+1}. |
| a-F03 (P3) label "MZ.1" | repaired | line 597: "In the formal setting of §§1.3–1.4"; no `MZ.n` label remains (grep). |
| b-F01 (P2) spanning bound 2q − 1 | repaired | `Suggested.lean:333` `(hw : w ≤ 2 * Fintype.card F - 2)`; README line 1342 "(1) For w ≤ 2q − 2 … (1) does not assert it"; new Check line 1363 recomputed: (3,2) ∈ I^T_5 ∖ I′_5, (2,3) ∈ I′_5 ∖ I^T_5, both families 130 = s(5) arrays. |
| b-F02 (P2) supplier presented as existing | repaired (applied differently) | line 7: "Every depth-one object used here is a requirement on that roadmap, registered as a supplier gap"; line 61 "Every item below is a requirement"; line 19 "required of DrinfeldModulesAndTModules DM.2 (gap:parent-period-analytic-field)". Each of the 13 DM citations maps to a slug in `design/plan.json` (14 gaps, 13 on DrinfeldModulesAndTModules). The wording no longer claims supply; acceptable. |
| b-F03 (P3) `character_roots_independent` | repaired | absent from `Suggested.lean` (34 declarations); README §5.8 (lines 1272–1282) names no Lean declaration. |
| b-F04 (P3) `two_row_rigidity` | repaired, with the pattern repair of `twisted_system_rigidity` | both absent; §4.7 has no headline paragraph; §4.6 line 1135 "After one forward coefficient twist the vanishing part reads as follows". The forward-twisted system was rederived from IKLNDP24 (3.4)–(3.5) (IKLNDP24 lines 4164–4171): twisting once gives δ_∅⁽¹⁾ = (δ_∅ + γΣδ_child)(t − θᑫ)ʷ; the vanishing claim for (q−1) ∤ w or ε ≠ 1 is Case 1 and Case 2, Subcase 1 of the proof (IKLNDP24 lines 4302–4461), whose induction uses only the tree shape, so it holds on the full tree 𝔦(IND°_w). Check line 1143 recomputed: residual (1 − γ)(t − t³)(t − θ³)². |
| b-F05 (P2) §1.7 absent from Lean | repaired | `Suggested.lean:121` `zeta_space_mul_le`; README line 558 names it. Tested: w = w′ = 0 gives K·K = K; q = 3: ζ_A(2)² = ζ_A(4) + 3ζ_A(2,2) = ζ_A(4) ∈ Z_4; alternating q = 3, ε = −1: ζ_A(−1;1)² = ζ_A(2) + 2ζ_A(−1,−1;1,1) ∈ AZ_2. Pinned `Submodule.mul` at `Mathlib/Algebra/Algebra/Operations.lean:214`, `mul_le` at 222. |

The repair report marks no finding `not actionable in this package`.

## Verified sound

- **Declarations read:** 34 of 34 (16 definitions, 18 theorems), each against the elaborated type in the worker's signatures file and against its README statement. No section variables exist, so no binder can be lost; every `[Field F] [Fintype F] [DecidableEq (RatFunc F)]` is explicit. Definitions have real bodies on native carriers (`Composition`, `Polynomial`, `RatFunc.CompletionAtInfty`, `Submodule.span`, `LinearMap.ker`, `Nat.card`); no sorry'd data, no `True`, no `set_option`, no `lemma`, single `import Mathlib`. All 34 names appear backticked in the README; the only other backticked lower-case names are Mathlib's (`tsum`, `iSupIndep`, `composition_card`).
- **Targets read:** 68 of 68 (14 + 8 + 13 + 12 + 7 + 14, matching line 7). Every *Needs:* line points to earlier sections or declared suppliers; the Layer dependency summaries (0; 0,1; 0,1; 0,3; 0–4) match the Needs lines. Every target has a locator.
- **Adversarial pass** (values computed):

| Statement | Instances | Computed | Result |
|---|---|---|---|
| `multipleZeta`, `multiplePolylog` at w = 0 | empty composition | one empty tuple, product 1, tsum 1 | ζ_A(∅) = Li(∅) = 1 |
| `carlitzDenominator` | d = 0, 1; q = 3 | 1; θ − θ³ = ℓ_1 = −D_1 | matches conventions |
| S_1(4) vs ℓ_1⁻⁴, q = 3 | d = 1 | S_1(4) = 2u⁶ + …, ℓ_1⁻⁴ = u¹² + … | Li(4) − ζ_A(4) begins u⁶ (§0.6, §0.8, §1.4 Checks) |
| Δ coefficients | q = 2: (1,2); q = 3: (2,2); general (q,q−1), (q−1,q−1), (q,1) | 1, 0; 1; −1 and 0; 2(−1)^q; 1 | §1.1, §2.13, S01 |
| partial-fraction identity of §1.2 | (a,b) = (1,1), (1,2) | both sides 1/(uv), 1/(uv²) | holds |
| S_1(1)S_1(2) = S_1(3) + S_1(2,1), q = 2 | d = 1 | both 1/(θ²+θ)³ | holds |
| [1] ∗^ζ [2], q = 2 | — | [1,2] + [2,1] + [3] + [2,1] = [1,2] + [3] | §1.3 Check |
| Σ_{j≤d} ℓ_j^{1−q} identity (§2.2) | d = 0; inductive step | 1 = −ℓ_1/D_1; −(θ−θ^{q^{d+1}})^q + θ^q − θ = θ^{q^{d+2}} − θ | holds |
| R_1 at d = 0; next-weight relation at d = 0 | all q | 1 + D_1/ℓ_1 = 0 | §2.1, §2.13 Checks |
| B*_1(R_1), C_(1)(R_1), BC_q(R_1) fixed parts | q = 2, d = 1 | 0, D_1⁻³, D_1⁻²; 0 − D_1·D_1⁻³ = D_1⁻² | §2.3 Checks |
| reduction of ζ_A(q+1) | q = 3, d = 0,1,2 to u³⁹ | residual 0 with the (2,2) term, 2u⁹ + … without | S01 |
| U^ζ(3), U^ζ(1,2), (U^ζ)²(3), U^•(q), U^•(q+1) | q = 2; general q | D_1[1,2]; D_1([1,1,1]+[2,1]); D_1²(…); L_1[1,q−1]; −[q,1] + L_1(…) − [2,q−1] | §2.9, §2.10, §5.7 Checks; realisations agree with C_(1)(R_1) and B*_1(R_1) |
| decomposition (q−1,q,q,q+1,1); (1,q,q) | — | s^T = (q−1), m = 2, s″ = (1,1); s^T = (1), m = 2 | unique |
| d, s, t, c sequences | q = 2..5, w ≤ 3q−2 | enumerated counts equal the recurrences at every (q,w); q = 3: d = 1,1,2,3,6,11,20,37; s(4..7) = 46,130,368,1042; t(4) = 48 | §0.11, §0.12 |
| `directIndices` vs the Note's I′_w | q = 2: w = 3, 4; q = 3: w = 4..7; q = 4: w = 10 | {(1,1,1),(1,2)}; {(2,1,1),(1,2,1),(1,3)}; 6, 11, 20, 37 indices with 46, 130, 368, 1040 arrays (s(7) = 1042); 372 indices, 733902 arrays (s = 733908) | matches IKLNDP-NOTE lines 191–214 clause by clause; endpoint deficit (q−2)(q−1) |
| AJ^1_w count | q = 3, w ≤ 7 | 1,2,6,16,46,130,368,1042 = s(w) | §0.12 |
| generating series gap at d = 1 | q general | Σ_c 1/(θ+c−x) = 1/(ℓ_1 + x^q − x); RHS γ_1(θ^q)(x/ℓ_1)^q = x^q | holds |
| H_n | n ≤ q; n = q+k−1; n = 2q−1; q = 3, n = 4 | 1; (t^q−t) + (k−1)(t^q−θ^q); θ^q − t; 2t³ − t − θ³ | §3.1 |
| (H_sΩ^s)^{(d)}(θ) | general | α_s(θ^{q^d})/(π̃^s ℓ_d^s) = Γ_s S_d(s)/π̃^s | §3.2 |
| D_s membership | q = 3, s = (2,2), z = (1,θ⁴) | exponent −3·3^{d_1} + 3^{d_2} ≤ −8·3^{d_2} | §0.6 Check |
| prefix decay from whole-tuple decay (§3.4) | prefix length k | whole norm = const · (prefix norm)^{q^{r−k}}, const > 0 when all Q_j ≠ 0 | argument closes Chang's gap |
| twist recursion of 𝔏 | depth k | terms with e_k = −1 give Q_k⁽⁻¹⁾(t−θ)^{s_k}Ω^{s_k}𝔏(s_1..s_{k−1}) | §3.3, §3.6 |
| det Φ_{(2,1)} | — | (t−θ)³(t−θ) | §3.6 Check |
| q = 2 suffix coordinate (§3.11 Check) | — | D_1Li(1)/π̃ = −1 = 1 | holds |
| Eulerian valuations | general | v(π̃^w) = −wq/(q−1) ∈ ℤ iff (q−1) ∣ w | §0.14 |
| `frobeniusResidual` kernel | w = 0; q = 3, w = 2; q = 2, w = 1, 2 | f ∈ F(t) (dim 1); root t³−θ, leaf t−t³; root a(t²−θ), leaf a(t−t²); w = 2 solved: one parameter a, b_0 = at⁴/(1+t²) | dimension 1 in each divisible case |
| twisted system Check | q = 3, w = 2, γ² = −1 | residual (1−γ)(t−t³)(t−θ³)² | §4.6 |
| weight-zero cases of all 18 theorems | w = 0 | families {1}, spans K·1, toddNumber 1, alternatingNumber 1, finrank 1, (q−1) ∣ 0 | consistent |
| q = 2 degenerate cases | `q_indivisible_independent` (excluded by hq), `direct_small_weight_spanning` (w ≤ 2), `direct_small_weight_independent` (w ≤ 4, listed tuples) | as stated | consistent |
| `zeta_algebra_graded` in an arbitrary E | compositum K∞·K̄ ⊂ E | isomorphic over K∞ to the one in C∞ by a K-automorphism of K̄; the MZV images lie in K∞, so the K̄-spans correspond | independence is E-independent |
| Worked example counts | q = 3, w = 4 | 16 + 24 + 4 + 2 = 46; 16 + 24 + 4 + 4 = 48; all compositions 54 | lines 1352, 1395 |

- **Locators verified:** about 110 line locators across the 19 manifest texts checked for the presence of the cited statement; 31 statements read in full against the roadmap's wording: ND21 Theorems A, B, D, Corollary C, Lemma 6.1, Theorem 6.2, (6.1), (6.5) and the H_w display; IKLNDP24 Theorem 1.11, Theorem 2.4 with (LW)/(LD), Lemmas 3.1, 3.3, Theorem 3.4, Theorem 3.6, (3.4)–(3.9) and the full case analysis of §3.3, Proposition 4.2, Proposition 4.11, Remark 4.12, Proposition 4.13; IKLNDP-NOTE I′_w, J′_w, Propositions 1.3–1.4, Theorems 1.5–1.6; CCM23 Theorem 1.2.4, Corollary 1.2.7, Proposition 2.3.5, Definition 3.1.1, Theorem 3.2.4, Corollary 3.2.5, Theorem 3.2.6, R and (E_M), Lemmas 4.2.2–4.2.3, Theorem 4.3.5, Lemma 5.1.1, Theorem 5.2.1, Theorem 5.4.2; CHANG14 Theorem 2.2.1, Definition 3.4.1, Proposition 3.4.4, Theorem 3.4.5, Proposition 4.3.1, Definition 5.1.3, Lemma 5.3.5, Proposition 5.4.1, Theorem 5.4.3, Theorems 5.5.1–5.5.2, Corollary 5.5.5; THAKUR10 Theorem 3; THAKUR09P Theorem 4; THAKUR09R Theorem 5; LRT14 Theorem 3.1(2) (n = 0, s_1 = s_2 = 1, k_1 = 0 gives a = 1, b = 2q−2); CH21 Proposition 2.12 and (2.10); CPY19 Propositions 2.2.1, 2.3.3; PAP08 §2.2, Lemma 3.3.2, §4.1.6; ABP04 Theorem 3.1.1, Proposition 3.1.3; AT09 2.4.1–2.4.2; CM21 Theorem 1.2.2; CCM-ALG Theorem 1.2.3. Manifest: 19 entries, all `certified`; 14 gap slugs identical in `design/plan.json` and the README, every supplier named.
- **Checks tested:** 41 Check instances recomputed (table above); apart from S01 none false, vacuous or a restatement. Every Lean definition has at least three discriminating Checks in its section (`carlitzDenominator`: lines 30, 63, 873; `reducedPrefixes`: lines 1069–1071; `directIndices`: lines 1352–1356).
- **Pins:** `RatFunc.CompletionAtInfty` (`Mathlib/FieldTheory/RatFunc/Valuation.lean:138`, section `variable [DecidableEq (RatFunc F)]` at line 46), `inftyValuation.X`, `.X_inv`, `.polynomial` (lines 97, 103, 108), `Submodule.mul`/`mul_le` (Operations.lean 214, 222), `iSupIndep` (SupIndep.lean 328), `Composition`, `blocksFun`, `sizeUpTo`, `composition_card` (Composition.lean 101, 155, 217, 1033), `FiniteField.card'`, `sum_pow_units`, `frobeniusAlgHom` (Finite/Basic.lean 266, 290, 333), `Polynomial.Monic` (Degree/Defs.lean 59), `Polynomial.comp`, `mapRingHom` (Eval/Defs.lean 380, 533), `RatFunc` (Defs.lean 67), `Finsupp` (Defs.lean 88), `Finsupp.single` (Single.lean 47), `Nat.choose` (Choose/Basic.lean 50), `Submodule.span` (Span/Defs.lean 46), `UniformSpace.Completion.algebra` (UniformRing.lean 198); Tau Ceti `norm_eq_gaussNorm`, `norm_coeff_mul_pow_le`, `norm_C`, `norm_X` (TateAlgebra.lean 76, 80, 94, 105; `norm_X` carries `[NormOneClass R]` as the README says). No Carlitz, multizeta or stuffle object exists at either pin.
- **Sibling citations:** RestrictedPowerSeries §§0.1–0.3, 1.1–1.2, 2.1, 7.2 on main (README lines 193–723); PeriodsAndSpecialValues PS.9.1–PS.9.4 at its head (lines 1989–2062; PS.9.2 is the stuffle word algebra over ℚ, so the integer gap is needed); FunctionFieldArithmetic Layers 0–5 and GlobalShtukasAndFunctionFieldLanglands Layers 0–3 exist at their heads and own no special-value series. Merge order: FunctionFieldArithmetic 167, GlobalShtukas 170, PeriodsAndSpecialValues 199, this roadmap 286. Ownership by object (`roadmaps grep` for Carlitz, multizeta, multiple zeta, Thakur, Anderson–Thakur over main and all open heads, plus the sibling checkouts and the board package index): no competing owner; the only hits are classical real MZVs (PeriodsAndSpecialValues) and p-adic MZV citations. DrinfeldModulesAndTModules exists nowhere (`roadmaps show` prints nothing; not in the merge order; not on the board), as every round has recorded; all its citations are declared gaps.
- **Policy:** `git diff --stat origin/main...HEAD` touches only `packages/DrinfeldModulesAndTModulesPartII/` (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, three reports). No pull-request number or process word in README or docstrings; `theorem` only; no `set_option`; no computational algorithm.
- **Dependency check** (complete output):

  ```text
  depcheck: 56 roadmaps, 640 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- **Headlines and padding:** the headlines named in the README (nonvanishing, products, weak and strong Brown generation, the two bridges, Chang's grading, the Frobenius dimension formula, Ngo Dac's two independence theorems, the CMPL and Thakur bases over K and K̄, Todd's formula, the alternating Hoffman basis and dimension, the direct small-weight spanning and independence) are all stated; the module docstring names the unstatable ones with the missing carrier. The one-tactic probe finds no padding among the 18 theorems; `todd_dimension` and `alternating_dimension` follow from their basis theorems only through finrank-of-a-basis and a sigma-type cardinality, and are the named conjectures.

## Not verifiable

- No Lean was run (read-only pass); signature verification used the worker's elaboration artifact, which the repair report says was produced from `#check @name` for all 34 declarations.
- AT90 displays (3.6.4), (3.7.1), (3.7.3)–(3.7.4) are absent from the extraction (AT90 lines 738–761 carry the section text only); AT09 2.4.1–2.4.2 and CHANG14 Theorem 5.5.1 were used instead.
- The elimination proofs of IKLNDP-NOTE §5 (weights 2q−1 to 3q−2), the block-matrix step of CCM23 Theorem 4.3.5 for ℓ ≥ 2 and the all-type-1 chain of IKLNDP24 Theorem 1.11 were read, not recomputed.
- Ownership against open pull requests without a supplied checkout was checked only through `roadmaps grep` and `roadmaps show`.
- The 14 declared gaps are requirements on a roadmap that does not yet exist; their fulfilment is not certified here.

## Source issues

- **Misprint** in AT09 at §2.3, printed p. 4 (AT09 line 195): the source says the base-q digits of n satisfy 0 ≤ n_i ≤ q; it should be 0 ≤ n_i ≤ q − 1; affects nothing.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p. 6 (CPY19 line 248): the source says the matrix of the homomorphism of rationalised Frobenius modules has entries in k̄[t]; it should be k̄(t), the modules being over k̄(t); affects nothing (the proof bounds the denominator).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "34d07525c82d4a8799ff98905d0bfe878dc65093", "job": "RT-DrinfeldModulesAndTModulesPartII~2b", "model": "fable", "worker": "chris-k"} -->
