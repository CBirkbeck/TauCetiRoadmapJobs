# Review of DrinfeldModulesAndTModulesPartII (pull request #1697 at 9b9bd2d)

**Verdict:** accepted

Three P3 notes, no blocking finding, a passing gate, and the adversarial table with its values are below. The head is the one the previous review read; the folder is unchanged. The previous blocking finding was answered on the board by removing the fourteen declared gaps from the plan, which makes the README's local ownership of the depth-one foundations consistent with the declared contracts (now none). That resolution is recorded under *Previous findings*.

## R01 (P3) — Duplicated Check bullets

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md`, Checks of §§0.1, 0.3, 0.4, 0.6, 0.9, 0.10, 0.14, 1.1, 1.3, 3.1 and 3.3. Verbatim duplicates: line 317 repeats line 307 (“ζ_A(∅) = 1.”) and line 1006 repeats line 996 (“𝔏(∅) = 1.”).

**Claim:** Several Check lists state the same test twice, once in each of two wordings, so the lists are longer than their content.

**Witness:** README lines 246 and 250 both test (1, 2) ≤ (2, 1) and its converse; lines 247 and 250 both test (1, 3) against (2, 1, 1); 316 and 320 both state ζ_A(1) = log_C(1); 318 and 321 both state ζ_A(1)² = ζ_A(2) at q = 2; 343 and 345 both say every character is trivial at q = 2; 388 and 392 both state Li₁ = log_C; 441 and 445 both state Z₁ = K·ζ_A(1); 469 and 474 both list Iᵀ₃ and IND₃ at q = 2; 581 and 585 both give Δ^([1])_(1,2) and Δ^([2])_(1,2) at q = 2; 621 and 625 both give [1] ∗ [1]; 956 and 960 both give H₁ = H_q = 1; 1005 and 1009 both give 𝓛(1) = ΩΣ𝕃_d⁻¹.

**Repair:** Delete the second copy in each pair (keep the fuller wording where the two differ, for example line 250 over 246–247 and line 960 over 956). The remaining lists still have at least three discriminating Checks per definition.

## R02 (P3) — Say that no base roadmap exists

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:7`: “This Part II develops the multiple-depth extension of depth-one Carlitz special values. Its foundation targets in §0.0 construct …”.

**Claim:** The title and name announce a Part II, but no roadmap named DrinfeldModulesAndTModules exists on main, at any open head or on the board, and the scope paragraph does not say so. A reader looking for “where the base roadmap stops” finds nothing, and a later roadmap by that name could re-plan what §0.0 now owns.

**Witness:** `roadmaps show 'DrinfeldModulesAndTModules'` returns “no roadmap … on main or in an open roadmap pull request”; the merge order lists only this Part II (line 339). GlobalShtukasAndFunctionFieldLanglands (open head) line 29 assigns the Drinfeld-module theory to that absent roadmap. The plan now declares no gaps (`design/plan.json` line 4735).

**Repair:** Add one sentence to *Scope and ownership*: no earlier roadmap constructs the Carlitz module, its period, Ω, the arithmetic entire ring E, effective dual t-motives or the ABP and Frobenius interfaces, so §0.0 is their owner and a later depth-one roadmap consumes §0.0 by section rather than restating it. No target changes.

## R03 (P3) — Locator for the field in Chang’s MZ property

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:1069`: “A nonzero Z ∈ C_∞ has the MZ property of weight w ≥ 1 if …” citing CHANG14 Definition 3.4.1.

**Claim:** Chang states the definition for a nonzero Z in the (algebraic closure of the) completion at infinity, not in C∞ (CHANG14 line 343–346, where the OCR drops the overline on k∞); the README’s wider carrier is the one IKLNDP24 use (IKLNDP24 line 3570–3572 apply it to π̃^w L(s; Q)(θ) with Q containing (q−1)-th roots γ_i ∈ F̄_q, values outside K∞), and the proof of Chang Theorem 3.4.5 uses only ψ ∈ E^d and the specialisations, never the field of Z.

**Witness:** CHANG14 line 343: “A nonzero element Z ∈ k∞^× …”; IKLNDP24 line 3571: “~π^w L(s; Q)(θ) … has the MZ (multizeta) property in the sense of [9, Definition 3.4.1]”.

**Repair:** After the locator, add the clause “stated by Chang for Z in the algebraic closure of K∞ and used by Im–Kim–Le–Ngo Dac–Pham for values in F̄_q·K∞ ⊂ C∞; the proof of §3.9 uses only the witness (Φ, ψ)”. No statement changes.

## Previous findings

- **r3 R01 (P2, restore the fourteen declared supplier contracts): repaired by the plan, not by the README.** The README at this head is byte-identical to the head r3 read (`changes.md`: 0 changed lines). The board commit answering r3 (“answered the review, no change needed”) replaced the plan’s fourteen `gaps` entries by an empty list (`packages/DrinfeldModulesAndTModulesPartII/design/plan.json:4735`, `"gaps": []`), and this review’s brief records “The gaps this roadmap declares: none declared”. The inconsistency r3 reported (fourteen declared, zero represented) no longer exists: zero declared, zero represented, and the README owns the depth-one foundations in §0.0, the degree theorem in §0.2, the generating series in §3.2, the integral stuffle in §1.3 and the finite-place construction in §5.14. I checked that no other roadmap owns any of these objects (see the duplication audit), so local ownership is legitimate; R02 above asks only that the scope say so.
- **r1 R02 (zero-matrix Check): remains repaired.** README line 208 restricts the negative control to positive size; line 209 gives the empty matrix determinant 1, the empty solution and the unique empty lift.

## Verified sound

A full review of the README (1586 lines) and `Suggested.lean` (449 lines), unchanged passages included, against the pinned Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. No route-specific shortcut (every finite field, every positive index, every finite place), no re-planned roadmap, no copied passage, no algorithm, no sorry’d data and no `set_option` was found. The diff outside the folder is empty; `metadata.toml` has the single `topic` line.

### Gate, dependency direction, elaboration and padding

The worker’s gate at this head:

```text
gate DrinfeldModulesAndTModulesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I reran the movable dependency check against the current main and merge order; its complete output is

```text
depcheck: 204 roadmaps, 1657 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. Every `*Needs:*` line names only earlier local targets, Mathlib, Tau Ceti, or the five supplier roadmaps resolved below.

A scratch copy of `Suggested.lean` with every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | sorry` elaborated with `lake env lean` from the worktree: exit 0, no error, exactly 23 `declaration uses sorry` warnings at the 23 admitted theorems (lines 45, 131, 139, 150, 160, 167, 176, 182, 195, 253, 263, 283, 315, 323, 331, 342, 352, 358, 377, 388, 399, 426, 438), with the linter confirming that the `done` after `simp` was never reached. No admitted theorem closes by one tactic; no declaration restates a definition, mirrors a Check or computes a value. The 17 definitions all have real bodies on native carriers and each is used by a headline. The worker’s `signatures.md` lists the 40 elaborated types; I compared each with its README statement (finite field, positive exponent, positive weight and nontrivial-character disjunction for the twisted system, `2 < q` and `2 ≤ k ≤ q` for the two-row system, `2 < q` and `w ≤ 2q − 2` for q-indivisible independence, `w ≤ 2q − 2` and `w ≤ 3q − 2` for the direct bounds, the two scalar towers for the K̄ statements, the explicit `DecidableEq (RatFunc F)`): no binder is missing and no signature needs a change. The file form is correct for this pin: `module`, `public import Mathlib`, `public section`, one module docstring naming the non-statable headlines (Carlitz exponential, period and Ω; Anderson–Thakur interpolation; Chang’s descent for MZ-property values; ABP criteria and Eulerian suffixes; the rewriting operator and relation kernel; period-character splitting; the v-adic realisation), `theorem` only, no `lemma`, no `#check`, no second import.

### Headline coverage

The README’s end results are: power-sum nonvanishing and degree descent (§0.2), nonvanishing of MZVs, AMZVs and CMPL values (§§0.5, 0.7), the graded product algebras (§1.7), weak and strong Brown generation (§§2.7, 2.12), the zeta/polylog bridge (§2.8), Chang’s grading (§3.9), the Frobenius solution dimension, twisted and two-row rigidity (§§4.5–4.7), small-entry and q-indivisible independence (§§5.1, 5.3), the CMPL and Thakur bases with Todd’s formula (§§5.5–5.6), the relation kernel (§5.7), character splitting (§5.8), the alternating Hoffman basis and dimension (§§5.10–5.11), the direct small-weight bounds (§5.13) and the finite-place bound (§5.14). The 23 admitted declarations state every one of these that is statable at the pins; the docstring names the rest with the missing carrier. The small-weight basis corollaries (§§5.2, 5.4) are instances of the stated full bases and are correctly not separate declarations.

### Seeded source sample

All fifteen targets were checked at their locators in the cached texts; the README flags no locator as unverified. Page numbers are the printed pages of the cached versions.

| Target | Text at the locator | Comparison |
|---|---|---|
| §0.1 indices and orders | ND21 lines 251–259 (§2.1, p. 5: ≤, T_i, T_i(s) ≤ T_i(t) ⇒ T_k(s) ≤ T_k(t)); ND21 694–701 (Def 2.11, Init and its lexicographic order); ND21 855–859 (Def 3.1, k-admissibility); IKLNDP24 330–367 (§1.1.1–1.1.2, arrays and χ), 702–720 (§1.1.5, sum of arrays (εε′; s + t)), 2917–2927 (Def 1.8, empty array k-admissible); CCM23 266–276 (indices, I^T_w, I^ND_w, I^T_0 = {∅}), 298–301 (Def 2.1.4) | All definitions agree, including zero padding in comparisons, the empty-index conventions and the preorder on arrays. |
| §0.4 Harada’s AMZVs | IKLNDP24 160–181 (§0.2.2, p. 4): ε^(deg a) weights, ζ_A(∅;∅) = 1 | Agrees; depth, weight and the trivial-character specialisation match. |
| §0.6 CMPLs | CHANG14 622–659 (Defs 5.1.1, 5.1.3, (5.1.2)), 660–668 (Remark 5.1.4, D′_s), 669–672 (Remark 5.1.5); CCM23 307–343 (log_C, Li_n, (2.2.1), Def 2.2.2); IKLNDP24 3639–3655 ((2.6)–(2.7): Li(s; ε)(θ) = γ₁⋯γ_r Li(ε; s)/π̃^w) | The series, its term norm, D_s as a convergence condition on decreasing tuples, the polydisc D′_s and the root factor all agree. |
| §0.10 index families | ND21 167–169 (Thm B, T⁰_w), 1343–1353 (T′_w and Lemma 6.1); CCM23 274–285 (I^T_w, I^ND_w, Prop 2.1.1 with the block correspondence); IKLNDP24 3246–3257 (J_w, J′_w, ι), 3258–3320 (AS_w, AJ_w, AJ¹_w, ϕ) | Families, the block bijection and its array version agree; the character 1 over inserted q’s is as in ϕ. |
| §1.5 realisations are homomorphisms | CCM23 440–446 (Prop 2.3.5 (1)–(3)); THAKUR10 230–236 (Thm 3 (i)–(iii)) | The three identities and the F_p coefficients, weight preservation and depth bound agree. |
| §2.9 Thakur decomposition and U^• | CCM23 519–538 ((3.1.3)–(3.1.4), Example 3.1.5, (3.2.1), Def 3.2.2, Remark 3.2.3) | The decomposition, α^•_q, both branches of U^• (including the sign of the first bracket and the D^• correction) and the fixed-point remark agree. |
| §3.1 Anderson–Thakur polynomials | ND21 1014–1041 (§4.2: Γ_n, γ_j, generating series, H_n = AT’s H_{n−1}, ‖H_n‖ < |θ|^(nq/(q−1))); ND21 1425 (H_{q+k−1} formula); IKLNDP24 3582–3611 ((2.4): deg_θ H_n ≤ (n−1)q/(q−1)); CHANG14 902–916 (Thm 5.5.1, H_{s−1}, bound nq/(q−1) in his indexing) | Indexing shift and both bounds agree. |
| §3.4 entireness | CHANG14 704–751 (Lemma 5.3.1: whole-tuple decay hypothesis, L_{s,Q} entire via (5.3.3) and ABP Prop 3.1.3) | The README’s termwise statement is stronger than needed for the first column, and its prefix-from-whole argument is the index shift the proof uses; correctly no tail claim under the weak hypothesis. |
| §3.6 dual t-motives of an index | ND21 995–1013 (Def 4.1, trivialisation), 1042–1045 (Φ_s); IKLNDP24 3477–3492 (Def 2.1), 3563–3569 (Ψ_{s,Q}, Ψ′_{s,Q}) | Agrees. The README adds “injective” to the definition; it is automatic (a σ-semilinear endomorphism of a finite free module whose image contains (t−θ)^ℓ M has full rank, hence zero kernel) and the determinant criterion is equivalent. |
| §3.7 MZ property | CHANG14 343–369 (Def 3.4.1 (1)–(4)), 376–383 (Prop 3.4.4) | Conditions (1)–(4), c ∈ k^× and the monomial closure agree; the field of Z is R03. |
| §5.3 q-indivisible independence | ND21 1354–1358 (Thm 6.2: q > 2, w ≤ 2q − 2), 1393–1398 (reduction to (6.2)) | Hypotheses match the Lean `hq`, `hw`; the reduction to the two-row relation is as restated. |
| §5.4 Thakur basis through 2q − 2 | ND21 172–182 (Cor C, Thm D), 1456–1457 (proof: Thm A + Lemma 6.1 + Thm 6.2) | Agrees, with q = 2 covered by Corollary C. |
| §5.7 all linear relations | CCM23 1404–1433 (Thm 5.4.2 and proof) | R_w, Ker 𝔏^ζ_w = R_w, the direct sum over weights via Chang Thm 2.2.1, and the counting step agree. |
| §5.8 character splitting | IKLNDP24 3942–3957 (Lemma 3.1 and proof), 3958–3995 (Lemma 3.2) | Root independence over F_q and K∞, and the subsum statement, agree. |
| §5.12 lower bound via CMPLs | IKLNDP24 6487–6509 (Prop 4.10) | S_w ⊂ Z_w by Thm 4.9, |S_w| = d(w), independence by Thm 3.4: agrees. |

Also opened for the headlines: ND21 1401–1425 and 1453–1455 (two-row system (6.3)–(6.4), Remark 6.3), IKLNDP24 4010–4030 (Lemma 3.3), 4058–4075 (Thm 3.4 end, Thm 3.6), 4150–4173 ((3.4)–(3.5): γ^(−1) only at the root), 6435–6440 (Prop 4.8), 6517–6526 (Prop 4.11, AT¹_w, |AT¹_w| = s(w)); IKLNDP-NOTE 191–228 (I′_w, J′_w), 233–264 (Props 1.3–1.4, Thms 1.5–1.6); CCM23 750–772 (examples of (E_w)), 1371–1395 (Thm 5.2.1); THAKUR09P 354–396 and 455–465 (Thm 1 part II, Thm 4 proof for general q via the minimal decomposition and Sheats); SHEATS98 143–150 (Thm 1.2, Lemma 1.3).

### Duplication and supplier audit

By object, not by name. Pinned Mathlib: `grep -ril carlitz\|drinfeld` finds only the Drinfeld centre (`Mathlib/CategoryTheory/Monoidal/Center.lean`, `Braided/Basic.lean`); pinned Tau Ceti: only the DG-category Drinfeld quotient files. Roadmap service (`roadmaps grep`, 441 open heads and main): “Carlitz” occurs outside this folder only in PadicDifferentialEquationsAndRigidCohomology line 13704 (a Frobenius trace remark, not the module); “Drinfeld module”, “t-motive”, “Anderson–Thakur”, “multizeta” hit only Yetter–Drinfeld modules and the classical real MZVs of PeriodsAndSpecialValues PS.9. No open head and no board package names `DrinfeldModulesAndTModules`. So this roadmap is the only owner of the Carlitz, Anderson, ABP and Frobenius foundations it builds in §0.0, of the multiple-depth value theory, and of the finite-place construction; nothing is restated. Ownership against open pull requests was checked through the listed sibling checkouts and the service’s index.

Cross-roadmap citations resolved at the copies the brief names:

| Citation | Where | Found |
|---|---|---|
| RestrictedPowerSeries §§0.1–0.3, 1.1–1.2, 2.1, 7.2 | main, `TauCetiRoadmap/RestrictedPowerSeries/README.md` lines 193, 207, 224, 247, 264, 306, 723 | Native restricted series, coefficients, Gauss norms, radii, evaluation, entire series. |
| PeriodsAndSpecialValues PS.9.1–PS.9.4 | open head, `TauCetiRoadmap/PeriodsAndSpecialValues/README.md` lines 2003, 2028, 2054, 2076 | PS.9.2 constructs the stuffle word algebra by ordered merges with multiplicity over ℚ; §1.3 here extends the integer multiplicities to every commutative ring, as the README says. |
| PadicDifferentialEquationsAndRigidCohomology §RD.0.33 | open head via `roadmaps show` (lines 307–350 of its README name RD.0.33 and the `IsAlgClosed.of_denseRange` CharZero caveat) | Completed algebraic closure in every characteristic. |
| ReductiveGroupsPartII §RG2.3.7 | main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201` | Lang’s theorem and lifting. |
| GlobalShtukasAndFunctionFieldLanglands Layers 0–3, §2.7 | open head, README lines 163, 537, 895, 1054, 1176 | Elliptic sheaves as a specialisation; a scope boundary, not a supplier of a theorem. |
| FunctionFieldArithmetic Layers 0–5 | open head, README lines 438–1717 | Global fields and curve arithmetic; a scope boundary. |

All suppliers precede this roadmap in the merge order (RestrictedPowerSeries and ReductiveGroupsPartII on main; PeriodsAndSpecialValues, PadicDifferentialEquationsAndRigidCohomology, FunctionFieldArithmetic and GlobalShtukasAndFunctionFieldLanglands earlier in `ORDER.txt`).

### Pinned declarations opened

`Mathlib/Combinatorics/Enumerative/Composition.lean:101` (structure, positive blocks summing to n), `:1033` (`composition_card`, 2^(n−1)); `Mathlib/FieldTheory/RatFunc/Degree.lean:40` (`intDegree` as num degree minus denom degree, `intDegree 0 = 0`), `Mathlib/FieldTheory/RatFunc/Valuation.lean` (`inftyValuation`, `CompletionAtInfty`; the headline carriers elaborate); `Mathlib/FieldTheory/Finite/Basic.lean:266` (`card'`), `:290` (`sum_pow_units`), `:333` (`frobeniusAlgHom`, x ↦ x^q on an F-algebra); `Mathlib/Order/SupIndep.lean:328` (`iSupIndep`); `Mathlib/Analysis/Normed/Field/Dense.lean:45` (`IsAlgClosed.of_denseRange` needs `CharZero`, so RD.0.33 is needed); `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:76, 80, 94, 105` (`norm_eq_gaussNorm`, `norm_coeff_mul_pow_le`, `norm_C`, `norm_X` with `NormOneClass`), `:14` (`PowerSeries.IsRestricted.subring c`). These match the supplier contracts’ descriptions, including the caveats they state.

### Adversarial table

Values computed by hand or by a scratch script (truncated Laurent series in u = 1/θ over F₂, F₃ and F₄, precision u^14; power sums enumerated over all monic polynomials for degree ≤ 3 and for every exponent above q, Carlitz’s identity used for exponents ≤ q at degree ≥ 4 after being verified by enumeration at degree ≤ 3; results reliable to u^6 after multiplication by D₁). D₁ = θ^q − θ, ℓ₁ = −D₁.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| Conventions, q versus p | F₄: 4 ∤ 2, 2 ∣ 2; IND excludes 4-multiples | (2) ∈ IND₂ at q = 4; deg S₁(2) = −8 ≠ 0 at q = 4 | Keep q, not p |
| Conventions, sign of ℓ₁ | q = 3 | ℓ₁ + D₁ = 0; raw S₁(1) = −1/(θ³−θ) | Keep |
| Conventions, Ω^(1)(θ) at q = 3 | π̃⁻¹/ℓ₁ | = −π̃⁻¹/D₁ | Matches line 34 |
| §0.2 `powerSum` body, d = 0 | empty coefficient tuple | X^0 = 1, S₀(k) = 1 | Correct boundary |
| §0.2 `powerSum_degree_descent` | q = 2, k = 1, 2, 3, d = 0..3 (raw) | degrees (0, −2, −6, −14), (0, −4, −12), (0, −4, −12) | Strictly descending; matches lines 291–293 |
| same | q = 3, k = 1..4, d = 0..2 (raw) | (0, −3, −12), (0, −6), (0, −9), (0, −6) | deg S₁(4) = −6 as line 292 |
| same, nonprime q | q = 4, k = 1, 2, 3, 5, d = 0, 1 (raw) | (0, −4), (0, −8), (0, −12), (0, −8) | Nonzero at k = 2 = p; keep prime-power generality |
| §0.2 Carlitz identity | q = 2, 3: n ≤ q, d ≤ 3; q = 4: n ≤ 3, d ≤ 2 (raw) | S_d(n) − ℓ_d^(−n) = 0 in every case | Keep |
| §0.2 identity fails past q | q = 2: S₁(3) − ℓ₁⁻³; q = 3: S₁(4) − ℓ₁⁻⁴; q = 4: S₁(5) vs ℓ₁⁻⁵ | valuations 4, 6, and 8 versus 20 | Nonzero: the bound n ≤ q is sharp (line 292) |
| §0.2 no-carry minimum | q = 2, k = 1, d = 2 | (m₁, m₂) = (2, 1), degree −6 | Matches raw −6 |
| §0.3 `multipleZeta` at weight 0 | empty composition | one tuple, `StrictAnti` on `Fin 0` true, product 1 | Value 1 as README |
| §0.3 summability | terms of degree-d tuples | norm ≤ q^(−d s₁), finitely many above any bound | `tsum` is the value in the complete ultrametric completion |
| §0.4 twist by ε^(deg a) | q = 3, ζ_A(−1; 1) − ζ_A(1) | valuation 3 | Nontrivial twist (line 344) |
| §0.5 `multipleZeta_ne_zero` | q = 2: ζ_A(2, 1) | valuation 4, nonzero | Keep |
| §0.6 `multiplePolylog` vs ζ | q = 3: Li(4) − ζ_A(4); Li(1,2), Li(2,2), Li(3,1) vs ζ | valuation 6; three zeros to u^14 | Matches lines 390, 418, 647–648 |
| §0.7 `multiplePolylog_ne_zero` | q = 3, s = (1, 1) | term (1, 0) norm 3⁻³, next 3⁻¹² | Unique maximal term; keep |
| §0.8 range | q = 3, s = (3, 1) vs (4) | Li(3,1) = ζ(3,1) to u^14; Li(4) ≠ ζ(4) | Entry bound essential |
| §0.9 weight spaces | w = 0 | span K·1, finrank 1 | Native submodule |
| §0.10 families at q = 3, w = 4 | enumeration | Iᵀ₄ = {(1,1,1,1),(1,1,2),(1,2,1),(2,1,1),(2,2),(3,1)}, IND₄ swaps (3,1) for (4) | Matches line 470 |
| §0.10 at q = 2, w = 3 | enumeration | Iᵀ₃ = {(1,1,1),(2,1)}, IND₃ = {(1,1,1),(3)} | Matches line 469 |
| §0.11 d, s, t, c versus counts | q = 2, 3, 4; w = 0..8 | recurrences equal |Iᵀ|, |IND|, |AJ¹| = |AS|, |AT|, |I⁰| in all 27 cases | Matches lines 497–503 (d(5) = 11, s(4) = 46, t(4) = 48, t(5) = 140, s(5) = 130; q = 4: 756, 750, c(5) = 13, d(5) = 14) |
| §0.12 `toddNumber`, `alternatingNumber` | q = 3, w = 4 | 6 and 46 | Matches line 515 |
| §0.13 sign | q = 3 | ζ_A(2)/π̃² = −1/D₁ from z/e_C(z) = 1 − z^(q−1)/D₁ + … | Keep |
| §0.14 Eulerian valuation | q = 3, w = 1, 2 | v(π̃) = −3/2, v(π̃²) = −3 | (q−1) ∣ w criterion |
| §1.1 Δ coefficients | (q,a,b,j) = (2,1,2,1), (2,1,2,2), (3,2,2,2), (3,1,2,1), (3,3,2,2), (3,3,2,4), (3,3,1,2) | 1, 0, 1, 0, −1, 0, 1 | Matches lines 581–585, 919, 803 |
| §1.2 Chen’s formula | q = 3: S_d(2)² − S_d(4) − S_d(2,2), d = 1, 2; S_d(3)S_d(2) − S_d(5) + S_d(3,2); q = 2: S_d(1)S_d(2) − S_d(3) − S_d(2,1), d = 1, 2, 3 | all zero to u^14 | Keep |
| §1.3 integral stuffle | [1] ∗ [1] | 2[1,1] + [2]; coefficient 2 is 0 at q = 2 | Keep coefficient extension |
| §1.5 / §1.7 products | q = 2: ζ(1)² − ζ(2); ζ(1)ζ(2) − ζ(3) − ζ(1,2); Li(1)Li(2) − Li(1,2) − Li(2,1) − Li(3); q = 3: ζ(1)² − ζ(2) − 2ζ(1,1); ζ(−1;1)² − ζ(2) − 2ζ(−1,−1;1,1) | all zero to u^14 | Matches lines 662, 689–691 |
| §1.7 `zeta_space_mul_le` at weight 0 | K·1 times K·1 | K·1 ≤ Z₀ | Keep |
| §2.1 one-way summation | ([∅], −[∅]) | R(−1) = −1, R(0) = 1, sum 0 | Not a binary relation |
| §2.2 R₁ degreewise | q = 2, 3: S_d(q) + D₁S_(d+1)(1, q−1), d = 0, 1, 2 (q = 3: also F₄ at d ≤ 1 by the identity) | zero to reliable precision | Keep |
| §2.2 summed | ζ(q) + D₁ζ(1, q−1), q = 2, 3 | zero | Keep |
| §2.3 BC at q = 2, d = 1 | fixed parts | B*₍₂₎(R₁): D₁⁻² + D₁·D₁⁻³ = 0; C₍₁,₁₎(R₁): D₁⁻³; S₁(2,2) = D₁⁻² | 0 − D₁·D₁⁻³ = D₁⁻² as line 778 |
| §2.5 reduction of (q+1) | expand C₍₁₎(R₁) | ζ(q+1) = −ζ(q,1) − ζ(2,q−1) − D₁(ζ(1,q−1,1) + ζ(1,1,q−1) + ζ(1,q)); at q = 3, d = 0: 1 + D₁ℓ₁⁻¹ = 0 | Matches line 803 |
| §2.7 `brown_spanning` example | q = 2 | ζ(3) − D₁²(ζ(1,1,1) + ζ(2,1)) = 0 to u^12 | Matches line 831 |
| §2.9 U at q = 2 | s = (3), (1, 2) | U(3) = D₁[1,2]; U(1,2) = D₁([1,1,1] + [2,1]); Δ^([1])_(2,1) = 1, Δ^([2])_(2,1) = 0, (1)∗^ζ(1) = [2] | Matches line 883 |
| §2.13 next-weight relation | q = 3: S_d(5) + D₁S_(d+1)(1,4), d = 0, 1; ζ(5) + D₁ζ(1,4); q = 2: ζ(3) + D₁ζ(1,2) | zero to reliable precision | Keep; its Li analogue is not claimed (Li(5) + D₁Li(1,4) has valuation 9) |
| §3.1 H_(q+k−1) | q = 3, k = 2, 3 | H₄ = 2t³ − t − θ³, H₅ = θ³ − t, deg_θ 3 ≤ 6 | Matches lines 957, 961 |
| §3.3 whole-tuple vs termwise | q = 3, s = (2,2), Q = (1, θ⁴) | normalized exponents −3, +1; whole ≤ −8·3^(d₂); tail +3^j | Prefix-only conclusion |
| §3.6 determinant | s = (2, 1); depth 0 | (t−θ)³(t−θ) = (t−θ)⁴; Φ = (1) | Keep |
| §3.9 `zeta_algebra_graded` | q = 3, ζ(2)/π̃² | = −1/D₁ ∈ K: normalised ratios are not graded | Grading of values, not ratios; any E with compatible embeddings is a quotient of K∞ ⊗_K K̄ permuted by Aut(K̄/K), so independence is E-independent |
| §4.1 `reducedPrefixes`, `frobeniusResidual` | q = 3, w = 2; w = 0 | tree {∅, (2)}; f_∅ = t³−θ, f₍₂₎ = t−t³: f_∅(θ³) − (f_∅ + f₍₂₎)(t−θ)² = t³−θ³ − (t−θ)³ = 0; w = 0: residual f(θ^q) − f | Kernel contains the displayed line; weight 0 is the constants |
| §4.1 linearity | θ·f at w = 0 | residual θ^q − θ ≠ 0 | F(t)-linear only, as line 1209 |
| §4.5 `frobenius_solution_dimension` | w = 0; q = 3, w = 1, 2 | 1; root degree ≤ 1/2 forces 0; the displayed line | 1, 0, 1 as predicted |
| §4.6 `twisted_system_rigidity` | q = 3, w = 2, γ = 1 vs γ² = −1 | root residual 0 vs (1−γ)(t−t³)(t−θ³)² ≠ 0 | Nontrivial character excluded; at w = 0, δ_∅ = 1 would solve, so `hw` is essential; (3.5) places γ at the root only |
| §4.7 `two_row_rigidity` endpoint | q = 3, k = 2: δ₁ = (t−θ)⁶, a₁ = t³−t, δ₂ = a₂ = 0 | (t−θ)⁶ + (t³−t)(2t³−t−θ³) = t² + tθ³ + θ⁶ = (t−θ³)²; both sides (t−θ³)⁶ | Eulerian line, not zero |
| §4.7 boundary k = q | q = 3, k = 3 | after a = b = c = 0: (f + a₁)θ³ − ft³ − a₁t = 0 ⇒ f = a₁ = 0 | Zero branch correct; H₅ = θ³ − t |
| §5.1, §5.2 | q = 2, w = 1; q = 3, w = 4 | {(1)}; |I⁰₄| = 5 < d(4) = 6 | Small-entry family is not a basis beyond q |
| §5.3 at the bound | q = 3, w = 5 | ζ(5) + D₁ζ(1,4) = 0 with (5), (1,4) ∈ IND₅ | w ≤ 2q − 2 sharp |
| §5.6 `todd_dimension` | q = 2, w = 1..5; q = 3, w = 5 | 1, 1, 2, 3, 5; 11 | Counts match recurrences |
| §5.7 kernel at q = 2 | w = 1, 2, 3 | dimensions 0, 1, 2 with pivots [2]; [1,2], [3] | Matches lines 1407–1409; weight-three relation D₁ζ(1,1,1) + D₁ζ(2,1) + ζ(1,2) = 0 verified to u^14 |
| §5.8 `character_roots_independent` | q = 3, roots 1 and i | X² + 1 has no root in F₃; F₉((1/θ)) is a field, so F₉ ⊗ K∞ → E is injective | Independent in every E |
| §5.13 `directIndices` | q = 3, w = 4, 5, 6, 7 | 6/46, 11/130, 20/368, 37/1040 indices/arrays; s(7) = 1042; (2,3) in and (5) out at w = 5; (2,3,1), (1,2,3) in and (3,2,1) out at w = 6; (4,3), (2,5) in and (7), (2,2,3) out at w = 7 | Matches lines 1495–1498; endpoint not a basis |
| §5.13 at q = 2, w = 3, 4 | enumeration | {(1,1,1),(1,2)}; {(2,1,1),(1,2,1),(1,3)}; ζ(1,1,2) + D₁(ζ(1,1,1,1) + ζ(1,2,1)) = 0 to u^13; ζ(1,2) − D₁ζ(1,1,1) has valuation 2 | Matches line 1499 and the Note 206–207 |
| §5.14 bound | q = 3, w = 1..4; q = 2, w = 1..3 | 1, 1, 2, 4; 0, 0, 1 | Matches line 1538 |
| §0.0 empty matrix Checks (lines 208–209) | ℓ = 0 | det = 1 = 1·(t−θ)⁰, evaluation 1 ≠ 0; size one: det 0 | Repaired control still correct |
| §0.0 effective dual t-motive | rank 1, Φ = (0), (t), (1), (t−θ) | (0) not injective; (t) cokernel at t = 0; the others allowed | “Injective” is redundant given the cokernel condition; harmless |

## Not verifiable

- CHANG14 Definition 3.4.1: the OCR of the cached arXiv text renders the field of Z as “k∞^×” and drops overlines elsewhere (line 180), so whether Chang writes K∞ or its algebraic closure cannot be settled from the cache; R03 phrases the locator so that either reading is covered.
- The 23 headline theorems remain admitted; elaboration, source comparison and finite arithmetic to u^14 are evidence, not proofs. Depth-one sums with exponent ≤ q at degree ≥ 4 were taken from Carlitz’s identity (verified by enumeration at degree ≤ 3), so the summed identities test the README’s relations given that identity.
- All twenty cached sources were readable; no fetch, manifest edit or missing-reference request was needed.

## Source issues

- **Misprint** in CCM23 at (2.3.2), printed p. 9 (line 421): the source says the divisibility condition is on k while the coefficient is indexed by j; it should be (q − 1) divides j; affects a stated result.
- **Misprint** in CHANG14 at Definition 3.4.1, printed p. 8 (line 343), as cached: the field of Z is printed as the completion at infinity although Proposition 5.4.1 and later users apply the property to values outside it; it should be read as the algebraic closure of that completion, or C∞; affects nothing (the proofs use only the witness).
