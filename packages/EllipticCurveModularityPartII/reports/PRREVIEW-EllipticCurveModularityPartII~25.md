# Review of EllipticCurveModularityPartII (pull request #1491 at 79a07e1)

**Verdict:** needs changes

This is a full review of `79a07e1`, the same head that review 24 read incrementally. The folder has 0 changed lines since then.

There are three findings:
- **R01 (P2), new.** Cartier's theorem now has two owners, §6.0f and GroupSchemesOverABase §4.5. The fact that makes this a defect changed after the head was written: GroupSchemesOverABase left the never-cite list.
- **R02 (P3), carried.** The description still does not settle the duplicate EllipticModularityEffectiveComparisons.
- **R03 (P3), new.** The description's "direct suppliers" sentence omits PadicFamilies.

Everything else checked is sound: the gate, the dependency check, elaboration, all 32 `#check` types, the padding probe, 14 of the 15 seeded locators (Kenku is uncertified), about 120 cross-roadmap ids, 34 library names, and the adversarial table below.

## R01 (P2) — Cartier's theorem has two owners: §6.0f and GroupSchemesOverABase §4.5

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 820: "Prove Cartier's theorem in the generality used here: for a field k of characteristic zero, a `CategoryTheory.GrpObj` … whose structure morphism is `AlgebraicGeometry.LocallyOfFiniteType` has `AlgebraicGeometry.Smooth` structure morphism, with no affineness hypothesis".

The same ownership is claimed in five more places:
- line 11 (Scope);
- line 35 (the Mathlib contract);
- line 41 (the Tau Ceti contract);
- line 830 (§6.0f *Needs:*);
- line 1145 (Layer 6 Dependencies).

**Claim.** One theorem has two owners, so the later roadmap must cite the earlier one. GroupSchemesOverABase is an open pull request by another author that adds a new roadmap folder, so this roadmap may consume it. It owns exactly this statement and expects §6.0f to cite it. By the merge order, GroupSchemesOverABase comes first:
- its last supplier, NeronModelsAndSemistableAbelianVarieties, is `ORDER.txt` line 66;
- its other suppliers are on main or earlier;
- so it is placed before this roadmap, which is line 275.

**Witness.** GroupSchemesOverABase (#1522 at `2e1e5e7`):
- README line 851 proves `smooth_of_charZero`: a group scheme locally of finite type over a field of characteristic 0 is smooth;
- `Suggested.lean` line 301 states it in Lean;
- README lines 1427–1430 say "§6.0f is to cite it".

**Why review 17's settlement no longer holds.** Review 17 made §6.0f the owner only because GroupSchemesOverABase was then on the never-cite list. The list in this review's brief has 13 names, and GroupSchemesOverABase is not among them. That list changed at 17:26 UTC on 9 November, after review 18 accepted the restored ownership. GroupSchemesOverABase's own review 17 reaches the same placement (67th) and the same repair.

**Repair.**
1. Add a supplier contract: `### From TauCetiRoadmap.GroupSchemesOverABase` — "Consume §4.5, Cartier's theorem `smooth_of_charZero`: a group scheme locally of finite type over a field of characteristic zero is smooth, with no affineness hypothesis; §6.0f applies it to the proper group scheme B₁∩B₂."
2. **Line 820.** Replace the "Prove Cartier's theorem …" paragraph with one sentence: B₁∩B₂ is smooth by GroupSchemesOverABase §4.5 (`smooth_of_charZero`). The α_p and Frobenius-kernel remark can stay as the existing Check at line 849, which tests the use.
3. **Line 11.** Replace the Cartier clause with "consumes Cartier's theorem from GroupSchemesOverABase §4.5, which the existence of A_ω uses".
4. **Line 35.** Delete the Cartier-route sentences: "For Cartier's theorem in §6.0f consume `CategoryTheory.GrpObj` … taken on affine opens" and "The characteristic-zero criterion … §6.0f proves it". Keep the `smooth_of_grpObj` sentence only if something still cites it.
5. **Line 41.** Delete the last two sentences, on the affine Tau Ceti case and "Section 6.0f removes the affineness hypothesis".
6. **Lines 830 and 1145.** Replace the Cartier items with "GroupSchemesOverABase §4.5 (`smooth_of_charZero`)". Drop **Stacks** from References if no locator still uses it.
7. **Description.** The depends-on and merge-order blocks gain #1522 (GroupSchemesOverABase, mycaule).

**Tested.** I made a scratch copy of the README with the contract of step 1 and the §6.0f *Needs:* of step 6.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`.
- GroupSchemesOverABase is absent from the dropped-names list, so the gate's `dropped` check stays 0.
- The two statements are identical: the same base (a field of characteristic 0), the same finiteness (locally of finite type), the same conclusion (smooth structure morphism), and no affineness on either side.
- `Suggested.lean` is unaffected.

## R02 (P3) — The description still does not settle the duplicate EllipticModularityEffectiveComparisons

Carried from review 24's R01, first raised in review 11. The latest repair reply answered it as description-only. It did not mark it `not actionable in this package`, so the finding is not settled.

**Location.** The pull-request description, including its depends-on and merge-order blocks: `grep -c EffectiveComparisons` on it returns 0.

**Claim.** EllipticModularityEffectiveComparisons plans the same objects as this roadmap. This roadmap is the owner, because it comes first: `ORDER.txt` line 275 against line 285. This folder needs no change. Unlike R01, the owner here is this roadmap, so the defect is only that the description does not record the settlement.

**Witness.** EllipticModularityEffectiveComparisons is still at `c90f56d`:
- README line 1707 says this roadmap "plans the same results under its own layer numbering";
- its `Suggested.lean` declares `martin_sharp_bound` (:88), `integral_ideal_sturm` (:108), `torsionRepresentation` (:169) and `lemos_uniform_surjectivity` (:298).

**Repair.** Add one sentence to the description: EllipticModularityEffectiveComparisons is closed before either pull request merges, or is cut down to a consumer that cites this roadmap. The citations it would need are:
- Layers 0–2 → §§1.1–1.8 and 2.1–2.2;
- Layer 3 → Layers 3–4;
- Layer 4 → §§5.0a–5.6;
- Layer 5 → Layer 6.

## R03 (P3) — The description calls PadicFamilies a transitive prerequisite; it is a direct supplier

**Location.** The description's dependency sentence:
- it lists the "direct suppliers" #1229 … #1018 (21 entries, without #1019);
- it ends "the other open pull requests in the merge-order block below are their transitive prerequisites".

**Claim.** PadicFamilies (#1019) is cited directly by name and section, so the sentence misclassifies it. The depends-on block already lists #1019, so only the prose is wrong.

**Witness.**
- README line 63 is "### From TauCetiRoadmap.PadicFamilies";
- lines 67 and 69 state its two gap contracts;
- the *Needs:* of §6.0e (line 798) begins "PadicFamilies §§4.0.1–4.0.3".

**Repair.** Add "#1019 (PadicFamilies)" to the direct-supplier list. After R01, also name #1522 (GroupSchemesOverABase, mycaule) as a direct supplier by another author.

## Previous findings

- **Review 24's R01** (description silent on EllipticModularityEffectiveComparisons): not repaired. The description is unchanged at this head and has 0 hits for "EffectiveComparisons". It is carried as R02.

## Verified sound

### Gate, dependency check, elaboration, signatures and the padding probe

**Gate**, rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate (`scratch/gate.md`) also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).

**Dependency check** (`--movable`) at this head:

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0 in 7.3 s. Its only messages are 17 `declaration uses sorry` warnings. The file has no `variable`, `include`, `set_option` or `lemma`, and it imports only Tau Ceti modules it uses.

**`#check @` of all 32 declarations**, in one scratch file:
- every elaborated type matches its README statement and `scratch/signatures.md`;
- no section binder can be lost, because there are no section variables;
- every hypothesis the README names is in the signature: `[Fact ell.Prime]`, `3 ≤ ell` or `5 ≤ ell` or `11 ≤ ell`, `IsIrreducible`, `NonCM`, `1 < n`, `37 < p`, and `p ∉ {2,3,5,7,13}`.

**One-tactic probe.** On a scratch copy, each of the 17 theorems was given `first | rfl | simp | norm_num | decide | infer_instance | trivial | aesop`. All 17 fail with unsolved goals, so none is padding.

### Seeded sample of sources (15 targets)

All locators were checked against the cached texts.

| Target | Locator in README | Text found | Verdict |
|---|---|---|---|
| 1.2 | Martin Thm 1 at k=2, Defs 1A–1F, p. 2 | Martin2003 lines 69–90. At k=2, c₂ = −1/4, c₃ = −1/3 and δ(1)μ(N) = μ(N), which is martinValue's N·S/12 − I/2 − A/4 − B/3 + M. | supports |
| 1.4 | Thm 2, p. 3; §4 Lemmas 16–22 and proof, pp. 14–16 | Lines 113–114 (Theorem 2). Lines 747–846 (§4; the proof of Theorem 2 is lines 836–846, p. 16). | supports |
| 2.1 | BS §2, proof of Lemma 2.2, p. 359 | BS2020 lines 198–203: ℓ divides Norm(p+1∓c_p) ≤ (√p+1)^(2[K:ℚ]). The general form here is the stated consequence. | supports |
| 4.4 | Kraus §3.3, (10)–(11), p. 1146 | Kraus1997 lines 393–434: statement (∗), bound (10), congruence (11) and the trace comparison. | supports |
| 4.7 | Kraus §3.1 Thm 4, p. 1144; §3.3, pp. 1145–1146 | Lines 284–293 (Théorème 4, with H as in (9), line 279) and lines 374–441. | supports |
| 5.0a | Mazur Thm 1 and table, pp. 129–130; §7, pp. 153–155 | Mazur1978 lines 11–40 (table; CM orders account for N = 11, 19, 27, 43, 67, 163; Theorem 1) and lines 992–1061 (Theorem 7.1 and its class-number-one proof). Lemos2017 line 44 uses End_ℚ̄(E) = ℤ. | supports |
| 5.0b | Kenku pp. 199–201 | uncertified (paywalled); see Not verifiable | — |
| 5.6 | BS §2 Thm 4, p. 360; Kraus §3.3 | BS2020 lines 221–239: H is the majorant without square roots, and irreducibility is assumed through "notation as in Theorem 3". This matches the README's description of the source statement. | supports |
| 6.0b | Lemos §2, pp. 5–6 | Lemos2017 lines 191–202: S₁₁, S₁₇ and S₃₇ as listed. The README rightly does not repeat line 194's rank-zero claim for J₀(37); see Source issues. | supports |
| 6.2 | Lemos Prop 2.2 and proof, pp. 4–5 | Lines 141–180: p ≥ 5, image in the nonsplit normalizer, potentially good reduction at every ℓ ≢ ±1 mod p (p itself included). | supports |
| 6.7 | DarmonMerel Lemma 8.2, pp. 22–23; Lemos §3, p. 10 | DarmonMerel2001 lines 725–755: cotangent injection, a₁(T_nω) = a_n(f), descent to Γ₀(r), and no weight-two forms at r = 2, 3 in characteristic ℓ > 3. | supports |
| 6.13 | Lemos §2, pp. 6–7 | Lines 243–252: b^(r+1)f(a/b) = a^(r+1) + bG forces b = 1, then t divides f(0). The README's monic-degree-≥2 generalisation follows by the same argument. | supports |
| 6.14 | Lemos §2, five finite sets, p. 7 | Lines 253–260. All five sets recomputed below and equal. | supports |
| 6.15 | Lemos §2, numerator table and proof, pp. 6–7 | Lines 231–252: the table at lines 236–241 equals §6.0a's f_r. | supports |
| 6.16 | Lemos §2, proof of Theorem 1.1, p. 5 | Lines 204–205: surjectivity depends only on j, asserted without proof. The README correctly calls its own argument derived. | supports |

Beyond the sample I also checked:
- Kraus1997 lines 198–212 (the weight-2 reading for p ≥ 11, used by §4.7a), lines 1060–1063 (Appendix II, Prop. 1, for §4.2), lines 1082–1093 (Prop. 2) and lines 1146–1154 (the six filters of §4.1);
- GaudronRemond2011 lines 168–170 (Thm 1.4, the constant 10⁷ and the cutoff 985);
- BPR2013 lines 55–56 (Thm 1.1), 454–460 (Thm 3.2: 1.4·10⁷ and 1.7·10¹¹; Prop. 3.3) and 647 (Prop. 4.8: 11 ≤ p < 10¹⁴);
- DarmonMerel2001 lines 520–538 (Prop. 6.5: D has order p, and is principal at p = 3).

### Adversarial table

Every value below was computed this round:
- a Python transcription of the Lean `localTerms`/`martinValue`, checked against an independent genus formula with Möbius-square inversion;
- point counts and Weierstrass invariants;
- brute force over GL₂(ℤ/4) and GL₂(𝔽_p).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `localTerms` (1.1) | (0,0), (2,2), (3,2), (2,3) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0), all equal to the Checks | holds |
| `martinValue`, `dimension_comparison` (1.2–1.3) | N = 1…3000 against Σ_{M∣N} β(N/M)·g₀(M) | 0 mismatches; values at N = 0, 1, 11, 13, 30, 35, 47 are 0, 0, 1, 0, 1, 3, 4. The g⁺ = 0 and g⁺ = 1 lists equal Kraus1997 lines 1048–1052. | holds |
| `martin_bound` (1.4) | N ≤ 3000 | 0 violations; the equality set is {35} ∪ {primes ≡ 11 mod 12}, 110 values, as predicted | holds |
| `sharpF`, `sharpG`, `sharpH` (1.5–1.7) | N = 0, 1, 4, 11, 13, 15, 35, 47 | F♯ = 0, 1, 1, 5.8284, 1, 9, 3148.63, 46149.08; G♯ = 0, 4, 4, 19.928, 22.483, 34.798, 62.856, 62.856; the minimum of H♯ over 1…3000 is 4 | holds |
| 1.8, sharp ≤ majorant | N ≤ 3000 (in logs) | 0 failures; at N = 11, F_K = 9 and G_K = 169 | holds |
| `norm_bound` (2.1) | ℚ(√2), ℓ = 7, x = 3+√2 | embeddings 4.414 and 1.586; norm 7; 7 ≤ 7 ≤ 19.49; B = 1.6 would give 7 ≤ 2.56 | holds; B must bound every embedding |
| `deletionLevel` (2.2) | 11a1, 14a1, 27a1, 26b1, 141a1, 15a1 at ℓ ∈ {0,1,2,3,5,7,11,23,37} | 11a1 (Δ = −11⁵): M₀ = 1 at ℓ = 1 and 5, else 11. 14a1 (Δ = −2⁶·7³): 7 at ℓ = 2, 1 at ℓ = 3. 27a1: 27 always. 26b1: 13 at ℓ = 7. 141a1 (Δ = 3⁷·47): 47 at ℓ = 7. | holds; minimum 1 |
| `removed_prime_bound` (2.2) | 11a1 at ℓ = 5, p = 11; 14a1 at ℓ = 3, p = 2 and 7 | right sides 1.628, 1.342, 1.539 < ℓ; (5,5) has order 5 and (2,2) has order 3, so E[ℓ] is reducible | the irreducibility hypothesis is needed |
| `rationality_of_small_prime_coefficients` (3.1) | N = 11 (μ = 12, q = 2); N ≤ 10 | a₂ = −2; g⁺ = 0 for N ≤ 10, so vacuous | holds |
| `deletion_level_realization` (3.4) | 11a1 at ℓ = 11; 26b1 at ℓ = 7; 141a1 at ℓ = 7; ℓ = 3 | F♯(11) = 5.83 < 11 with −4 a non-square mod 11, so C = E. (1,0) on 26b1 has order 7, so reducible. F♯(47) = 46149 > 7. If g⁺ ≥ 1, the minimum of F♯ is 5.83 > 3. | holds |
| `integral_sturm_congruence` (4.2) | k = 0, N = 1; k = 12, N = 1; J = (1), (0), (6) | bounds 0 and 1; Δ has a₀ = 0 and a₁ = 1 | holds; coefficient 0 needed |
| 4.4 / 4.7 | N = 11 | μ(44)/6 = 12; eligible q = 3, 5, 7; 4√7 = 10.58 < G♯ = 19.93 | holds |
| 4.5 matrix selection | all subgroups of GL₂(ℤ/4) inside the condition set | 86 subgroups, 0 counterexamples; [[1,1],[0,1]]·[[1,0],[2,1]] has det(1−g) = 2 | holds; closure is needed |
| `prime_isogeny_degrees`, `noncm_…`, `cyclic_…` (5.0a–5.0b) | degree 0; 49a1; 20, 22, 41 | `Isogeny.degree_pos` (Degree.lean:148) rules out degree 0. 49a1 has j = −3375, (2,−1) of order 2 and CM by ℚ(√−7), giving 14. 20, 22 and 41 are absent. | holds |
| `NonCM` (5.0a) | j = 1728; 11a1 | (x,y) ↦ (−x, iy) is not an integer; j(11a1) = −122023936/161051 is not integral | the definition discriminates |
| `full_two_irreducible` (5.4) | 15a1; ℓ = 3 | roots −13/4, −1, 3, so full 2-torsion; ℓ = 3 would need degree 12, which is permitted | ℓ ≥ 5 needed |
| `rational_two_irreducible` (5.5) | 49a1 at ℓ = 7 | a rational 2-point plus a 7-line gives 14, which is permitted | ℓ ≥ 11 is sharp |
| `deletion_level_full_two_realization` (5.6) | 15a1; 11a1 at ℓ = 23 | 15a1: M₀ = 15, F♯ = 9, H♯ = 34.80, so it applies from ℓ = 37 with C = E. 11a1: H♯(11) = 19.93 < 23, but a₃ = −1 gives #C(𝔽₃) = 5 | the full 2-torsion hypothesis is needed |
| `rational_isogeny_j_tables` (6.0b) | three levels | −24729001, −32768, −121; −297756989/2, −882216989/131072; −162677523113838677, −9317. None is 0 or 1728. 37a1 has #E(𝔽₂) = 5 and #E(𝔽₃) = 7, so (0,0) is non-torsion. | holds |
| `ImageInNonsplitCartanNormalizer` (6.1); Conventions placement | p = 11; p = 5, 3, 2 | p = 11: N_ns = 240, N_sp = 200, GL₂ = 13200. Intersection 16 at p = 5; 8 after conjugating N_ns alone by [[0,1],[1,1]]; 8 at p = 3; 40 at p = 11; 2 at p = 2. | holds; the diagonal algebra is not a field |
| 6.4 permutation identity | p = 5; p = 2 | 15 + 1 = 10 + 6; 3 + 1 = 1 + 3; the literal split normaliser gives 1 + 1 | holds |
| `nonsplit_of_not_surjective` (6.10) | p = 41 | \|SL₂(𝔽₄₁)\|·40 = 2755200 = \|GL₂(𝔽₄₁)\| | holds |
| `lemos_integral_j` (6.11) | y² = x³ − x at p = 11; 11a1 | j = 1728 ∈ ℤ, a CM case covered; 11a1 has a 5-isogeny and non-integral j, so its image is never nonsplit | holds |
| 6.12–6.15 | f₂ … f₁₃; t = 8, −16, −64, ±1; u = 2t; f = T+1, t = 1/2 | All monic of degree r+1, with constants 4096, 729, 125, 49, 13. f₂: 1728, 0, 1728; u = 2t gives 2048. f₁₃(1) = 2101248, and t = −1 gives 576. The set sizes are 25, 13, 8, 6, 4, each equal to Lemos2017 lines 253–260. f = T+1 at t = 1/2 gives 3. | holds; degree ≥ 2 needed |
| 6.16 | p = 5; p = 3 | 5·16·6 = 480 = \|GL₂(𝔽₅)\|; a = 2 has a² = 4 ≠ 1; at p = 3 both units square to 1 | holds |
| 6.17 | j = 576 | k = 1/2, model y² = x³+24x+64, Δ = −2¹⁵·3⁴, j = 576. Traces at 5, 7, 11, 13, 17, 19: −2, −4, −3, −2, 5, −1. All 21 character values are −1. gcds 1, 1, 2, 1, 1, 1, 1, so B_j = 12. | holds |
| 6.0f bounds | B(1,0); B(2, ≤ 985); [10⁷+i] | 9,702,250,000,000; 3.9028·10¹³; 10¹⁴+1 exceeds the bound, a CM counterexample to the cyclic corollary | holds |
| 6.0f Cartier (R01) | μ_n/ℚ; α_p/𝔽_p; proper non-affine B₁∩B₂ | Both statements make μ_n/ℚ smooth; both exclude α_p (its Ω¹ is free of rank 1 but its dimension is 0); both cover B₁∩B₂, which Tau Ceti's affine `smooth_of_grpObj_of_charZero` (Cartier.lean:32) does not | the same statement has two owners (R01) |

### Headline theorems

The README's headlines that are statable at the pins are all stated:
- §§1.3–1.4, 2.1–2.2, 3.1, 3.4 and 4.2;
- §§5.0a–5.0b and 5.4–5.6;
- §§6.0b (moduli form), 6.10, 6.11 and 6.18.

Those that are not statable are named in the module docstring with the carrier each lacks:
- §§3.3 and 4.7 need N(E[ℓ]) and the Serre weight;
- §6.0e needs A_f and L;
- §§6.0d and 6.3–6.9 need modular curves, Jacobians and integral models;
- §6.0f needs the stable Faltings height;
- §6.0h needs the Néron reduction;
- §6.17 needs the reduction trace.

Nothing is forced through a stand-in. The README's backticked own names are exactly the 32 declarations.

### Library declarations opened at the pins

**Mathlib `1b1ccf4`:**
- `Matrix.SL2.commutator_eq_top` (LinearAlgebra/Matrix/SpecialLinearGroup.lean:804, hypotheses a ≠ 0 and a² ≠ 1);
- `Algebra.norm_eq_prod_embeddings` (RingTheory/Norm/Transitivity.lean:261);
- `AlgHom.card` (FieldTheory/PrimitiveElement.lean:360);
- `AddMonoidHom.toZModLinearMap` (Algebra/Module/ZMod.lean:81);
- `AddSubgroup.torsionBy` (Algebra/Module/Torsion/Basic.lean:971) and its `zmodModule` (:1009);
- `AlgebraicGeometry.smooth_of_grpObj` (AlgebraicGeometry/Group/Smooth.lean:62, which needs `GeometricallyReduced`).

**Tau Ceti `2fd255d`:** all 27 names in the README resolve. Among them:
- `torsionGaloisAction` (Affine/Point/Galois.lean:77);
- `cuspFormsNew` (Newforms/Basic.lean:269);
- `Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (BadPrime/Vanishing.lean:101);
- `Newform.isIntegral_qExpansion_coeff` (Newforms/NumberField.lean:152);
- `heckeTCuspAlgebra_finite` (HeckeSlash/Finite.lean:122);
- `normalizedAtkinLehnerOperatorCusp` (AtkinLehner/Normalized.lean:134);
- `Gamma0_index_mul_prod_primeFactors` (CongruenceSubgroups/Basic.lean:1076);
- `algorithmicConductor` and `algorithmicConductor_ne_bot` (Reduction/Conductor.lean:103 and :115);
- `minimalDiscriminantIdeal` (MinimalModel/DiscriminantIdeal.lean:170);
- `smooth_of_grpObj_of_charZero` (Group/Cartier.lean:32);
- `sturm_bound_finiteIndex` and `eq_of_sturm_bound` (SturmBound.lean:55 and :78);
- `cuspFormCharSpaceOneEquiv` (TrivialNebentypus.lean:221);
- `cuspFormCharSpace` and `modFormCharSpace` (DiamondOperators.lean:291 and :327, joint diamond eigenspaces);
- `Newform` with field `χ` (Newforms/Newform.lean:87 and 104).

### Cross-roadmap citations resolved

About 120 ids, all found at the copy named.

**On main `f8836c4`:**
- Completed/Chebotarev Layer 10 (line 410);
- ModularForms §§0.2, 1.1, 3.1, 8.2, 10C (lines 395, 531, 634, 971, 1247);
- ModularCurves 1A and 1D;
- StableReduction Layer 5;
- JacobianChallenge Layers D–F;
- EllipticCurves Layers 0–8 and 4.5b;
- ImaginaryQuadraticClassNumber §H3.6 (nine fields, thirteen orders).

**At the open heads:**
- SerreWeightAndLevelOptimisation §§2.13, 3.7, 4.1, 6.1–6.3, 6.12 and Layer 3;
- EllipticCurveModularity R29.3 and R29.4;
- NeronModelsAndSemistableAbelianVarieties §§1.5, 3.5, 5.3a, 5.3e, 5.3h (whose formula for N(E[ℓ]) matches §4.8) and 6.4d;
- ArithmeticGaloisRepresentations §§2.3, 3.2, 3.3, 3.6, 4.1, 4.4, 4.5 and 6.1–6.3;
- AutomorphicGaloisRepresentations §§6.1–6.4 and 7.5;
- WeightsInEtaleCohomology R34.5 and R34.6 (§6.1, the Ramanujan bound);
- ModularCurvesPartII, all 27 cited sections;
- EisensteinIdealAndRationalTorsion §§7.8, 7.9 (which contains the Manin–Drinfeld theorem) and 8.9;
- ModularSymbolsPadicLFunctions §§0.6–0.8 and 1.1;
- PadicFamilies §§4.0.1–4.0.3 (§4.0.3 is the cyclotomic bound, not the base-level rank-zero result, so §6.0e is not a duplicate);
- EulerSystemsAndKolyvaginSystems Layers 2 and 4 and §§4.3, 4.17, 4.20;
- ComplexMultiplicationAndExplicitReciprocity Layers 1 and 3;
- ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.7, 3.4, 3.5, 4.4, 5.9;
- AbelianSchemesAndArithmeticModuli A2, A5.1, A6 and A6.3–A6.5;
- AlgebraicModularFormsAndSerreWeights R15.5A.1–2, Layer 4 and §§4.1–4.5;
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3;
- SchemeKTheoryOperations §§2.2–2.4, 3.6, 6.1;
- K2SymbolsBrauer §§6.4, 6.7–6.9, 8.1–8.3;
- K2SymbolsBrauerPartII §§1.1 and 5.5;
- HeightsRationalPointsAndObstructions §§1.7 and 1.18;
- SelmerIwasawaCohomology §2.12a;
- ComputationalNumberTheory §3.4.

### Ownership and overlaps

I searched `roadmaps grep` for this roadmap's name and for its objects (Martin's bound, Cartier's theorem). Every citing roadmap was read:
- ErdosProgressionPowers, FaltingsFinitenessAndIsogenyTheoremsPartII (it cites A_ω and the §6.0f bound and does not restate them), RankOneConverse, KatoEulerSystems, AdelicImagesAndModularCurves and EllipticCurvePeriodsAndModularParametrizations are consumers.
- EisensteinIdealAndRationalTorsion, AbelianSchemesAndArithmeticModuli and ImaginaryQuadraticClassNumber list this roadmap only as a consumer, so there is no cycle.
- The two duplicates are R01 and R02.

`scratch/overlaps.md` and `scratch/citations.md` list no dropped id, no revision-only id and no conflicting head.

### Gaps

- **`gap:mixed-modular-jacobians`.** It has the same slug in `design/plan.json` and on README line 134. Its supplier is named, and its *needs* sentence is precise. It is not already provided: ModularCurvesPartII §13.1 supplies Jacobians of smooth geometrically connected coarse curves in general, but §13.3's Hecke algebra is defined only on J₁(N), so the mixed-level T_n are genuinely missing.
- **The two Kato gaps.** Their absence from `plan.json` is settled (GATE~11 H01).

## Not verifiable

- **Kenku1982**, pp. 199–201, the composite cyclic-degree list of §§5.0b and 5.2. The manifest records it as uncertified (paywalled), so it is cited by its locator. The list {1…19, 21, 25, 27, 37, 43, 67, 163} agrees with Mazur's table of known degrees (Mazur1978 lines 11–19 and 28–30), but completeness cannot be checked without the text.

## Source issues

- **Error** in Lemos2017 at §2, proof of Theorem 1.1, p. 5 (line 194): the source says the Jacobian of X₀(37) has rank 0; it should be rank 1 (37a: (0,0) has infinite order), so the point list needs a separate argument; affects the proof.
- **Misprint** in Martin2003 at §4, proof of Theorem 3, p. 16 (line 858): the source says the final factor is 2^(α−4); it should be 2^(α−5), as in the statement of Theorem 3; affects nothing.
- **Misprint** in Martin2003 at §4, proof of Lemma 16, p. 14 (line 764): the source says the computation establishes the corollary; it should say the lemma; affects nothing.
- **Misprint** in Kraus1997 at Appendix II, Proposition 1, p. 1158 (line 1060): the source says χ has conductor N; it should be a character modulo N, since Proposition 2 applies it to trivial-character forms on Γ₀(M); affects nothing.
- **Misprint** in BS2020 at §2, equation (3), p. 358 (lines 174–175): the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that power; affects nothing.
- **Misprint** in BPR2013 at the proof of Proposition 3.3, p. 9 (line 462): the source writes the bound as 10⁷d²·max(h_F(E)+4 log d, 10³)²; it should be 10⁷d²(max{h_F(E),985}+4 log d)², as in its Theorem 3.1; affects nothing.
