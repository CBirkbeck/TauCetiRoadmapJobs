# Review of EllipticCurveModularityPartII (pull request #1491 at 504db2f)

**Verdict:** needs changes

This is a full review of the same head that review 21 read; the folder diff since then has 0 changed lines. One new blocking finding (R01) and one carried non-blocking finding (R02).

## R01 (P2) — Kraus's realization at the deletion level M₀ is statable at the pins but absent; §4.8 states only the narrower route through N(E[ℓ])

**Location.**
- `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 535 (§4.8): “an application at the deletion level M₀ needs N(E[ℓ]) = M₀ and weight 2 as separate facts”. Line 539: “For ℓ=5 or 7, retain it as an explicit hypothesis.”
- `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` lines 32–34: “Kraus's rational and full-two-torsion realization theorems are not statable at the pins: the prime-to-ell Artin conductor … and its Serre weight are missing.”

**Claim.** The source §4.8 cites states the realization at level M₀ with only the hypotheses of its Theorem 3: ℓ ≥ 3 prime and E[ℓ] irreducible. That form is true, and it is statable at the pins.

*Why it holds.*
- Kraus's argument uses only three inputs:
  - a newform at the level;
  - its bad-prime coefficients, which are 0 or ±1;
  - the congruences (5)–(6).

  See Kraus1997 lines 307–373 for Theorem 3 and lines 374–441 for Theorem 4.
- The roadmap already imports exactly these inputs at M₀, through deletion-level-lowering (README line 110; SerreWeightAndLevelOptimisation §§6.2–6.3).
  - That contract holds for every prime ℓ ≥ 3, including when ℓ stays in M₀ or the Serre weight is not 2.
  - SerreWeightAndLevelOptimisation §6.2's own Check is such a case: 141a1 at ℓ = 3 has M₀ = 141, N(E[3]) = 47 and Serre weight 4.
- Run §§3.2 and 4.4–4.6 on the level-M₀ newform:
  - If ℓ > F♯(M₀), this gives an elliptic curve C/ℚ of conductor M₀ with C[ℓ] ≅ E[ℓ].
  - If E also has full rational two-torsion and ℓ > H♯(M₀), the same argument gives such a C with full rational two-torsion.
  - A bad prime q of E with q ∤ M₀ is a deleted multiplicative prime, and q ≠ ℓ by size. It is handled by ±(q+1) exactly as in Kraus1997 line 412.

*Why it is statable.*
- The statement needs only carriers the file already uses: `deletionLevel`, `newDimension`, the Γ₀ index, `FullRationalTwo`, `torsionRepresentation`, and the norm of `WeierstrassCurve.algorithmicConductor`.

*What is wrong now.*
- A statable realization headline is absent from `Suggested.lean`.
- The README's deletion-level realization is narrower than its source:
  - at ℓ = 5 and ℓ = 7 it needs an extra local hypothesis;
  - at an additive ℓ, or a multiplicative ℓ with ℓ ∤ ord_ℓ(Δ), it says nothing at M₀.

**Witness.** BS2020 lines 235–239 state Theorem 4 at conductor M₀ under the hypotheses of Theorem 3 (line 184). ErdosProgressionPowers states the specialization on these carriers (`Suggested.lean`:105–117, `comparison_curve`) and must build its own “serre-weight and residual-conductor bridge” (its README line 1214).

**Repair.**
1. In §4.8, replace the sentence at line 535 with two targets in the form of BS Theorem 4:

   > For E/ℚ, a prime ℓ ≥ 3 with E[ℓ] irreducible, and ℓ > F♯(M₀), there is an elliptic curve C/ℚ of conductor exactly M₀ with C[ℓ] ≅ E[ℓ]. If moreover E has full rational two-torsion and ℓ > H♯(M₀), then C can be chosen with full rational two-torsion (BS, §2, Theorem 4, p. 360; the route is Kraus §§3.2–3.3, run on the level-M₀ newform of deletion-level-lowering).

2. Give these targets a *Needs:* line:
   - the deletion-level-lowering, coefficient-bound, newform-quotient and modular-abelian-conductor contracts;
   - §§1.5–1.7, 2.1, 3.1, 4.3 and 4.6;
   - NeronModelsAndSemistableAbelianVarieties §5.3e.
3. Drop line 539's extra hypothesis at ℓ = 5 and 7: these targets do not use it.
4. Keep §§3.3 and 4.7 as Kraus's statements at N(E[ℓ]).
5. In `Suggested.lean`:
   - add real-bodied `sharpF`, `sharpG` and `sharpH` and the two theorems below;
   - narrow the docstring sentence at lines 32–34 so that it covers only the N(E[ℓ]) and Serre-weight forms.
6. Under Downstream consumers, point EC.3 at the new targets.

**Tested.**
- **11a1 at ℓ = 11** (Δ = −11⁵).
  - The hypotheses hold: E[11] is irreducible, since the isogeny class has only 5-isogenies; M₀ = 11; and F♯(11) = 3+2√2 ≈ 5.83 < 11.
  - The current text is silent: the Serre weight is 12 (multiplicative reduction, 11 ∤ 5) and N(E[11]) = 1, so neither §3.3 nor §4.8 applies.
  - The new statement holds with C = E.
- **11a1 at ℓ = 5.**
  - Here M₀ = 1 and F♯(1) = 1 < 5, but no curve has conductor 1.
  - The irreducibility hypothesis is what excludes this case, since E[5] is reducible.
- **Lean.** A scratch copy of `Suggested.lean` with the declarations below elaborates under `lake env lean`. It gives 17 `declaration uses sorry` warnings (15 plus 2) and no error.

```lean
def sharpF (N : ℕ) : ℝ :=
  if h : N = 0 then 0 else
    haveI : NeZero N := ⟨h⟩
    (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ) / 6) + 1) ^ (2 * newDimension N)
def sharpG (N : ℕ) : ℝ :=
  (Real.sqrt (((CongruenceSubgroup.Gamma0 (Nat.lcm N 4)).index : ℝ) / 6) + 1) ^ 2
def sharpH (N : ℕ) : ℝ := max (sharpF N) (sharpG N)

theorem deletion_level_realization (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 3 ≤ ell)
    (hirr : (torsionRepresentation E ell).IsIrreducible)
    (hF : sharpF (deletionLevel E ell) < ell) :
    ∃ (C : WeierstrassCurve ℚ) (_ : C.IsElliptic),
      Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ C) = deletionLevel E ell ∧
      ∃ e : GeometricTorsion E ell ≃ₗ[ZMod ell] GeometricTorsion C ell,
        ∀ σ P, e (torsionRepresentation E ell σ P) = torsionRepresentation C ell σ (e P) := by
  sorry

theorem deletion_level_full_two_realization (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 3 ≤ ell) (hE : FullRationalTwo E)
    (hirr : (torsionRepresentation E ell).IsIrreducible)
    (hH : sharpH (deletionLevel E ell) < ell) :
    ∃ (C : WeierstrassCurve ℚ) (_ : C.IsElliptic), FullRationalTwo C ∧
      Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ C) = deletionLevel E ell ∧
      ∃ e : GeometricTorsion E ell ≃ₗ[ZMod ell] GeometricTorsion C ell,
        ∀ σ P, e (torsionRepresentation E ell σ P) = torsionRepresentation C ell σ (e P) := by
  sorry
```

## R02 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

This finding is carried from review 21's R01, which was first raised in review 11.
- `grep -c EffectiveComparisons` on the description still returns 0.
- No repair report since review 20 marks the finding as not actionable.

**Location.** The pull-request description, including its depends-on and merge-order blocks, never names EllipticModularityEffectiveComparisons.

**Claim.**
- EllipticModularityEffectiveComparisons plans the same objects and results as this roadmap.
- This roadmap is earlier in the merge order (`ORDER.txt` line 275, against line 285), so it is the owner, and the other roadmap must cite it.
- Under that settlement, nothing in this folder changes. The P2 duplication is the other pull request's to repair. Here, only the description has to state the resolution.

**Witness.** EllipticModularityEffectiveComparisons is now at head `c90f56d` (it was `b26ab9f`), and its duplication is unchanged:
- README line 1707: “plans the same results under its own layer numbering”;
- `Suggested.lean` declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169), with the isogeny-degree theorems at :186 and :192.

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed before either pull request merges, or cut down to a consumer of this roadmap. As a consumer it would cite:
- §§1.4, 1.5–1.8, 2.0 and 2.2;
- §4.7, or R01's §4.8 targets;
- §§5.1, 5.4–5.5, 6.0f and 6.18.

No change to the folder is needed.

## Previous findings

- **R01 of review 21 — not repaired.** The description is unchanged (grep: 0 hits). EllipticModularityEffectiveComparisons moved to `c90f56d` (notation repairs only), and its duplication paragraph and Lean declarations remain. Carried as R02.

## Verified sound

### Gate, dependency check, elaboration and signatures

**Gate.** Rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate (`scratch/gate.md`) also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0. Its only messages are 15 `declaration uses sorry` warnings, at lines 99, 104, 139, 162, 175, 186, 213, 219, 225, 239, 246, 257, 276, 284 and 293.

**Signatures.**
- A scratch module with `#check @…` for all 27 declarations elaborates with no error.
- I compared each elaborated type with its README statement. No binder is lost, the generality matches, and nothing was changed.
- Examples of what the comparison covered:
  - `removed_prime_bound` keeps `[Fact ell.Prime]`, `3 ≤ ell`, irreducibility, `p ≠ ell` and both `factorization p` hypotheses;
  - `integral_sturm_congruence` keeps an arbitrary character χ, ideal J and weight k, with the bound `12n ≤ k·[SL₂(ℤ):Γ₀(N)]`.

### Sources: the seeded sample (15 of 15 verified)

The README flags no locator as unverified (grep: 0 hits).

| Target | Locator | Lines in the cache | Supports the statement as written |
|---|---|---|---|
| 1.3 | Martin, Theorem 1 and Definitions 1A–1D, p. 2 | Martin2003 69–90 | Yes. At k=2, c₂=−1/4, c₃=−1/3 and δ(1)=1, which gives `N·S/12 − I/2 − A/4 − B/3 + M`. The Lean `localTerms` matches 1A–1D, including p=2 in the p≡2 mod 3 branch of ν₃. |
| 2.2 | BS, §2, equation (3), p. 358; Lemmas 2.1–2.2, p. 359 | BS2020 163–207 | Yes. The hypotheses are a prime ℓ≥3, E[ℓ] irreducible (Theorem 3), p≠ℓ, p∥M and ℓ∣ord_p(Δ). The bound is (√p+1)^((M₀+1)/6), and q=ℓ is not excluded from the product. |
| 3.1 | Kraus, §3.2, Lemma 1, pp. 1144–1145 | Kraus1997 295–306 | Yes. For a newform on Γ₀(M), if a_l∈ℤ for every prime l≤μ(M)/6, then every a_n is in ℤ. |
| 3.2 | Kraus, proof of Theorem 3, p. 1145 | Kraus1997 307–373 | Yes. The steps are: l∤N because a_l∈{0,±1}; l≠p because F(N)>μ(N)/6; the two congruence cases; and the norm bound (√l+1)^(2g). |
| 4.7a | Kraus, §3.1, p. 1143, condition (c) | Kraus1997 210–212 | Yes. For p≥11, weight 2 is equivalent to semistable reduction at p with p∣v_p(Δ_min). The README states the forward direction. |
| 4.8 | BS, §2, Theorems 3–4, pp. 359–360 | BS2020 184–188, 234–239 | The locators are correct. The source states the realization at M₀ with no N(E[ℓ]) or weight hypothesis, so the README's claim is narrower than the source (R01). |
| 5.3 | BS, §3, Lemmas 3.3 and 3.5, pp. 361–363 | BS2020 287–308, 331–343 | Yes, as the README describes it. The lemmas cite Mazur for irreducibility (ℓ≥7 with full two-torsion, ℓ≥11 with one rational two-point). The 2ℓ/4ℓ kernel construction is labelled the README's own. |
| 6.0c | Darmon–Merel, Lemma 8.3, p. 23 | DarmonMerel2001 758–764 | Yes. Galois differences of cusps are torsion by Drinfeld–Manin, and n·φ(P) lies in J_e(ℚ). |
| 6.0d | Darmon–Merel, Proposition 7.1, pp. 18–20; Mazur, Corollary 1.1, p. 137, and §2(d–e), pp. 140–141 | DarmonMerel2001 590–655; Mazur1978 356–365, 369–372, 451–499 | Yes. Darmon–Merel give the annihilator I_e, A_e=A/I_eA, and L(f,1)=⟨f,e⟩ with ω_f=2πi f dτ. Mazur gives the exact cotangent sequences for e<p−1 and semistable B, and the characteristic-2 example on p. 138. |
| 6.0g | Mazur, proof of Theorem 3, p. 130 | Mazur1978 62–75 | Yes. The exceptional case cannot occur for N>17. |
| 6.7 | Darmon–Merel, Lemma 8.2, pp. 22–23; Lemos §3, p. 10 | DarmonMerel2001 725–755; Lemos2017 375–388 | Yes. The cotangent image of f is a₁(f), that of T_nω is a_n(f), and vanishing for (n,p)=1 makes f a form on Γ₀(r). Lemos extends this to r∈{2,3,5,7,13}. |
| 6.8 | Darmon–Merel, Lemmas 8.2–8.3, pp. 22–23; Lemos §3, p. 10 | DarmonMerel2001 716–771; Lemos2017 375–388 | Yes. φ extends to the Néron model over ℤ[1/p,μ_p]⁺, is a formal immersion at ∞ in characteristic ℓ≡±1 mod p, and φ(P) is torsion in J_e(ℚ(μ_p)⁺). |
| 6.12 | Lemos, §2, table, p. 6 | Lemos2017 231–242 | Yes. All five polynomials agree, each monic of degree r+1 with nonzero constant term. |
| 6.14 | Lemos, §2, p. 7 | Lemos2017 249–260 | Yes. The sets recomputed from the numerators equal the printed S_r∩ℤ, with cardinalities 25, 13, 8, 6 and 4. |
| 6.18 | Lemos, Theorem 1.1, p. 2; proof, pp. 5–7 | Lemos2017 44–46, 187–264 | Yes. The hypotheses are End_ℚ̄(E)=ℤ, a nontrivial cyclic ℚ-isogeny and p>37; the conclusion is surjectivity. |

I also re-read these locators outside the sample:
- **Martin:** Theorem 2, p. 3 (Martin2003 lines 113–114); §4, pp. 14–16 (Martin2003 lines 741–846).
- **Kraus:** equations (7)–(9) and Theorems 3–4 (Kraus1997 lines 240–293); Appendix II, Propositions 1–2, the Corollary and §8.1, pp. 1158–1160 (Kraus1997 lines 1056–1173).
- **Mazur:** Theorem 1 (Mazur1978 lines 35–40).
- **Lemos:** Theorem 1.4, Propositions 2.1–2.2, Theorem 2.3, and Theorems 3.3–3.4 (Lemos2017 lines 107–110, 136–184, 223–226, 349–358).
- **BPR:**
  - Theorem 3.1 at 10⁷d²(max{h_F,985}+4 log d)², Theorem 3.2 at 1.4·10⁷ and 1.7·10¹¹, and Proposition 3.3 (BPR2013 lines 450–465);
  - Proposition 4.8 for 11≤p<10¹⁴, p≠13 (BPR2013 line 647).
- **Gaudron–Rémond:** Theorem 1.4, p. 4 (GaudronRemond2011 lines 168–172).
- **Stacks:** Lemma 39.6.3, Tag 047I (StacksProject lines 326–332), and Lemma 39.8.2, Tag 047N (StacksProject lines 631–635).

### Adversarial table

The values were recomputed at this head by scratch scripts. One script renders the Lean `localTerms`/`martinValue` exactly. Another computes the Γ₀(N) newspace dimension from the genus of X₀(N) and β = μ∗μ.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `dimension_comparison` (1.3) | every N≤1200 | `martinValue N` against the classical g⁺(N): 0 mismatches. N=1, 11, 13, 30, 35 give 0, 1, 0, 1, 3 on both sides | true |
| `martin_bound` (1.4) | every N≤3000 | No N with 12g⁺>N+1. Equality set {11,23,35,47,59,71,83,107,…} = {35} ∪ {primes ≡11 mod 12} | true |
| `localTerms` Checks (1.1) | (0,0), (2,2), (3,2), (2,3) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0) | match lines 185–188 |
| F♯, G♯, H♯ and majorants (1.5–1.8) | N=1, 2, 3, 4, 11, 35 | F♯: 1, 1, 1, 1, 5.828=3+2√2, 3148.63=(1+√8)⁶. G♯: 4, 4, 9, 4, 19.928=13+4√3, 62.86. F_K(11)=9 and G_K(11)=169. F♯≤F_K for every N<800 | match lines 245–294 |
| `norm_bound` (2.1) | K=ℚ(√2), x=3+√2, ℓ=7 | Embeddings 4.414 and 1.586, norm 7, so 7≤7≤(3+√2)²=19.49. With B=1.6: 7≤2.56 fails, so B must bound every embedding | true; Check holds |
| `deletionLevel` and `removed_prime_bound` (2.2) | 11a1 Δ=−11⁵; 14a1 −2⁶·7³; 27a1 −3⁹; 141a1 3⁷·47; 14a1 with Δ·7¹² | M₀ at ℓ=0,1,2,3,5,7: 11a1 [11,1,11,11,1,11]; 14a1 [14,1,7,1,14,14]; 27a1 always 27; 141a1 [141,1,141,141,141,47]; non-minimal model gives 2, not 14. Bounds: 1.628<5 and 1.342, 1.539<3 (E[5], E[3] reducible); 141a1, ℓ=7, p=3: 3103.9≥7 | match lines 355–370 |
| `rationality_of_small_prime_coefficients` (3.1) | N=11 (μ=12, q≤2); N=23 (μ=24, q≤4) | 11a: a₂=−2∈ℤ, and all coefficients are integers. 23: a₂ lies in ℚ(√5)∖ℚ, so the hypothesis fails, as it must. Pinned `Newform` carries `isNew` and `isNorm` (a₁=1) | true |
| 3.2 | N=11, ℓ≥7 | F♯=5.83>μ/6=2, so q=2<ℓ and c₂=−2∈ℤ | true |
| 3.3 Check | 14a1 two-division polynomial | 4x³+x²+18x−23=(x−1)(4x²+5x+23), with discriminant 25−368=−343 | matches line 412 |
| `integral_sturm_congruence` (4.2) | k=12, N=1, f=Δ, J=(2); k=0; J=(0) and (1) | Bound 12n≤12, so n≤1. a₁(Δ)=1∉(2), so the hypothesis fails. At k=0 only a₀ is tested. J=(0) gives equality and J=(1) is trivial. Agrees with Kraus Proposition 1 (bound μ(N)k/12) | true |
| 4.5 matrix selection | all subgroups of GL₂(ℤ/4) generated by ≤3 elements inside {det(1−g)≡0, g(2e₁)=2e₁} | 85 subgroups, 0 counterexamples. The product of [[1,1],[0,1]] and [[1,0],[2,1]] is [[3,1],[2,1]], with det(1−g)=2 | true; Check holds |
| 4.7a | 11a1 at ℓ=13 and ℓ=11 | ℓ=13: good reduction, weight 2, the "good" branch holds. ℓ=11: multiplicative with 11∤5, weight 12, so no claim | consistent with Kraus1997 lines 210–212 |
| 4.8 / §§3.3, 4.7 | 11a1 at ℓ=11 | M₀=11 ≠ N(E[11])=1, weight 12. F♯(11)=5.83<11. The M₀ form holds with C=E; the README says nothing | R01 |
| 5.0a and 5.0b degree lists | 49a1; composite degrees 2ℓ, 4ℓ | 49a1: Δ=−343, c₄=105, j=−3375; (2,−1) is on the curve with 2y+x=0, so a cyclic 14-isogeny exists. Degrees 14 and 12 are listed; 20, 22, 26, 28 and 34 are not | true |
| 5.3 kernel construction | full two-torsion, T≠T′ | For P′ generating T′, choose Q with φ̂(Q)=P′. Then 2Q=φ(P′)≠0, so Q has order 4 and the kernel of E/T→E→E/T′ is cyclic of order 4 | true |
| `full_two_irreducible` and `rational_two_irreducible` (5.4–5.5) | ℓ=3, 5, 7, 11 | 4ℓ = 12 (listed), 20 and 28 (not listed). 2ℓ = 14 (listed), 22 (not listed) | hypotheses sharp, statements true |
| `rational_isogeny_j_tables` (6.0b) | levels 11, 17, 37 | Lean sets equal Lemos S₁₁, S₁₇, S₃₇ (Lemos2017 lines 197–202). −2¹⁵ is the CM value. Denominators 2 and 2¹⁷=131072 | true |
| 6.0a and 6.12 coordinates | r=2: t=8, −16 and u=2t; r=13: t=−1; constants and degrees | 1728 and 0; (u+16)³/u at u=16 is 2048; r=13 gives 576. Constants 4096, 729, 125, 49, 13; degrees 3, 4, 6, 8, 14; t=8 and t=−64 both give 1728 | match lines 687–689, 1006, 1011–1013 |
| 6.0c | X₀(11); m=5, h=7 | ord(Δ(11z)/Δ(z)) is 10 at ∞ and −10 at 0, so the class is torsion (exact order 5, Ogg). The multiple hm is 35 | true |
| 6.0d and 6.7 normalization | f=e^(2πiz)+2e^(4πiz); f=t+2t² at width p | W(f)=i/π, period −2 (reversed path +2). ω_f=(p+2pt)dt with cusp value p·dt; at p=11 the value is 11dt | match lines 740, 950 |
| 6.0d, 6.7, 6.8 ramification | q≡±1 mod p | First such q: 23 for p=11, 67 for 17, 37 for 19, 47 for 23, 83 for 41, against 2p−1 = 21, 33, 37, 45, 81. Also 1<22 at q=23, and 1<1 fails at q=2 | match lines 739, 947, 951 |
| 6.0f numerics | B(1,0); B(2,h≤985); [10⁷+i] | B(1,0)=9,702,250,000,000; B(2,·)=3.9028·10¹³; deg[10⁷+i]=10¹⁴+1 with kernel cyclic over ℚ(i). BPR ranges 1.4·10⁷ and 1.7·10¹¹ lie below 10¹⁴ | match lines 818–821 |
| 6.0g | p=17, 19; A₄, S₄, A₅ | Largest element orders 3, 4, 5; group orders 12, 24, 60. Mazur1978 line 75 requires N>17 | true |
| 6.0h | y²+xy=x³+4x²+x | Δ=225; P=(−1/4,1/8) is on the curve with 2y+x=0, and [−2:1:8]≡[0:1:0] mod 2 | matches line 847 |
| `ImageInNonsplitCartanNormalizer` (6.1) | p=11 | \|GL₂(𝔽₁₁)\|=13200, \|N_ns\|=240, \|N_sp\|=200, and 200∤240 | matches lines 864–866 |
| 6.4 joint placement | p=5, δ=2; p=3; p=2 | \|N_sp\|=32, \|N_ns\|=48, intersection 16, equal to the four scalar cosets of 1, J, S, SJ. Conjugating N_ns alone by [[0,1],[1,1]] gives 8. p=3 gives 8. Dimensions 15+1=10+6, and 3+1=1+3 at p=2 | matches lines 900–902 |
| `nonsplit_of_not_surjective` (6.10) | p=41 | \|SL₂(𝔽₄₁)\|·40 = 2,755,200 = \|GL₂(𝔽₄₁)\| | matches line 981 |
| `lemos_integral_j` (6.11) | y²=x³−x, r=2, p=11; 11a1 | j=1728∈ℤ with CM image in N_ns (11 inert in ℚ(i)), so the conclusion holds without non-CM. 11a1 has j=−2¹²·31³/11⁵ and a 5-isogeny, so it can have no N_ns image at any p∉Σ | true |
| 6.14 | five levels | Cardinalities 25, 13, 8, 6, 4; the only coincidences are 1728 (t=8, −64) and 0 (t=−3, −27). The r=13 set is {−64·9·4079³, 576, 4096·27·19, 4096·27·19·991³}. All five sets equal Lemos2017 lines 253–260 | true |
| 6.17 | j=576: k=1/2, u=2, y²=x³+24x+64 | Δ=−2654208=−2¹⁵·3⁴, S={2,3}. Traces at 5, 7, 11, 13, 17, 19: −2, −4, −3, −2, 5, −1. All 21 character values are −1. The gcds are 1, 1, 2, 1, 1, 1, 1, so B_j=12 | matches line 1091 |
| `lemos_surjectivity` (6.18) | y²=x³−x at p=43; n=1 | CM image in N_ns, not surjective, so `NonCM` is needed. HasCyclicIsogeny E 1 always holds, so dropping `1<n` would claim Serre uniformity | hypotheses necessary |
| Frobenius convention | y²=x³−x over 𝔽₅ | 8 points, a₅=−2, det(1−Frob T)=1+2T+5T² | matches line 19 |

### Headline theorems and padding

**Stated in `Suggested.lean`:**
- Martin's formula and bound;
- the norm bound and the removed-prime bound;
- finite-prime rationality and the integral ideal-congruence Sturm theorem;
- the prime, non-CM prime and composite isogeny-degree theorems;
- the j-tables in moduli form;
- both irreducibility theorems;
- the proper-image classification, Cartan integrality and Lemos's theorem.

**Named in the docstring as not statable:**
- Kraus realization at N(E[ℓ]) — but its M₀ form is statable (R01);
- the Cartan correspondence, winding quotient and formal immersion;
- BPR's rational-point theorem and the normalized coordinates;
- modular rank zero and the integral winding comparison;
- the reduction alternative and the exceptional-image bound;
- Néron torsion specialization and finite-j divisibility;
- the quantitative isogeny bound and the cup/Chern comparisons.

Cartier's theorem beyond the affine case (§6.0f) is foundational, not a headline, so its absence from the file is not a finding.

**One-tactic probe.** A scratch copy replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | (norm_num; done) | decide | (aesop; done)`. None of the 15 theorems closed, so nothing is padding.

### Library declarations opened at the pins

**Tau Ceti `2fd255d`:**

| Declaration | File and line | What it provides |
|---|---|---|
| `HeckeRing.GL2.Newform` | `NumberTheory/ModularForms/Newforms/Newform.lean:104` | `isNew` at :106, `isNorm` at :108 |
| `cuspFormCharSpace` | `DiamondOperators.lean:291` | |
| `modFormCharSpace` | `DiamondOperators.lean:327` | |
| `TauCeti.cuspFormsNew` | `Newforms/Basic.lean:269` | |
| `TauCeti.cuspFormsOld` | `Newforms/Basic.lean:180` | |
| `TauCeti.isCompl_cuspFormsOld_cuspFormsNew` | `Newforms/Basic.lean:311` | |
| `ModularForm.sturm_bound_finiteIndex` | `SturmBound.lean:55` | characteristic zero only |
| `ModularForm.eq_of_sturm_bound` | `SturmBound.lean:78` | characteristic zero only; no ideal-congruence Sturm at the pin |
| `WeierstrassCurve.torsionGaloisAction` | `EllipticCurve/Affine/Point/Galois.lean:77` | |
| `WeierstrassCurve.algorithmicConductor` | `TateAlgorithm/Reduction/Conductor.lean:103` | |
| `WeierstrassCurve.minimalDiscriminantIdeal` | `MinimalModel/DiscriminantIdeal.lean:170` | |
| `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` | `AlgebraicGeometry/Group/Cartier.lean:32` | still assumes `[IsAffine G.left]` |
| `TauCeti.Isogeny.Hom.torsionRepresentation` | `Isogeny/Hom/Torsion.lean:132` | the endomorphism-ring action; a different object in a different namespace |
| `tateModuleGaloisRepresentation` | `TateModule/Galois.lean:80` | ℤ_ℓ-adic only; there is no mod-n Galois representation at the pin, so `torsionRepresentation` duplicates nothing |

**Mathlib:**

| Declaration | File and line |
|---|---|
| `AddSubgroup.torsionBy` | `Algebra/Module/Torsion/Basic.lean:971` |
| its ZMod module `torsionBy.zmodModule` | `Algebra/Module/Torsion/Basic.lean:1009` |
| `AddMonoidHom.toZModLinearMap` | `Algebra/Module/ZMod.lean:81` |
| `Algebra.norm_eq_prod_embeddings` | `RingTheory/Norm/Transitivity.lean:261` |
| `Matrix.SL2.commutator_eq_top` | `LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` |
| `AlgebraicGeometry.smooth_of_grpObj` | `AlgebraicGeometry/Group/Smooth.lean:62` |

### Cross-roadmap citations resolved

**Section headings, and the quoted titles of the supplier contracts, re-read at the open heads:**
- **SerreWeightAndLevelOptimisation:**
  - §6.1, line 1368: “Reduced elliptic level M₀”;
  - §6.2, line 1400: the newform at M₀ for ℓ≥3;
  - §6.3, line 1418;
  - §6.12, line 1671;
  - §§2.13, 3.7 and 4.1.
- **EisensteinIdealAndRationalTorsion:** §7.8; §7.9, line 1029, containing the Manin–Drinfeld statement for every congruence curve; §8.9.
- **NeronModelsAndSemistableAbelianVarieties:** §§1.5, 3.5, 5.3a, 5.3e, 5.3h and 6.4d.
- **ModularCurvesPartII:**
  - §3.8, §§5.2–5.3, §9.1;
  - §9.5, line 2675; §9.6, line 2691; §9.7, line 2728;
  - §13.1, line 3239; §§13.2–13.3; §14.15; §16.2, line 4120; §16.5, line 4175.
- **ArithmeticGaloisRepresentations:**
  - §§2.3, 3.2, 3.3, 3.6 and 4.4;
  - §4.1, §4.5 and §6.2. The quoted titles “Absolute irreducibility from oddness”, “Serre's propositions” and “Determinant and oddness” are bold paragraph labels inside these sections, and the contents match.
- **AutomorphicGaloisRepresentations:** §§6.1–6.4 and 7.5.
- **PadicFamilies:** §§4.0.1–4.0.3.
- **EllipticCurveModularity:** “The newform of an elliptic curve” (line 1198, in R29.3) and “The level is the conductor” (line 1341, in R29.4).
- **WeightsInEtaleCohomology:** §6.1, “Eigenform purity and the Ramanujan bound”, in Layer 6 (R34.6).
- **AlgebraicModularFormsAndSerreWeights:** Layer 4, “The local Serre weight”.

**On main:** Chebotarev (`Completed/Chebotarev`, Layer 10 “Dirichlet-density Chebotarev”, line 410), together with EllipticCurves, ModularForms, ModularCurves, StableReduction, JacobianChallenge and ImaginaryQuadraticClassNumber.

**Tools.** `scratch/citations.md` lists nothing unresolved. `scratch/overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.

### Ownership against open work

- **EllipticModularityEffectiveComparisons (#1810, `c90f56d`)** duplicates Layers 1, 2, 5 and 6. This roadmap is earlier, so it is the owner (R02).
- **ErdosProgressionPowers (`3e1048c`)** consumes EC.0–EC.6. It restates `deletionLevel` and the full-two-torsion predicate in its own namespace, which README line 1113 records. `ORDER.txt` places it at line 53, before this roadmap (275); that placement is its own depcheck's matter, not a supplier edge here.
- **KatoEulerSystems (`903763b`)** cites §6.0e as the owner of A_f(ℚ) finiteness (its lines 91, 99, 3043, 3052).
- **FaltingsFinitenessAndIsogenyTheoremsPartII (`f49680f`)** cites §6.0f for the isogeny bound and for A_ω (its lines 13, 362). Its constant 9,781,210,000,000 = 10⁷·989² is consistent with B(d,H).
- **AdelicImagesAndModularCurves** cites §§5.0a–5.0b.
- **EllipticCurveModularityPartIIGL2TypeAbelianVarieties (#1036)** has no shared object.
- **Namespaces.** No `Suggested.lean` reuses a fully qualified name from this namespace: the others use `…EllipticModularityEffectiveComparisons` and `…ErdosProgressionPowers`.
- Ownership against open pull requests whose files the brief does not give was checked only through the `roadmaps grep` index.

### Declared gaps and settled items

- **`gap:mixed-modular-jacobians`** (supplier ModularCurvesPartII) is the same slug in `design/plan.json` and in README line 134.
  - The Jacobians themselves follow from ModularCurvesPartII §13.1's generic assignment for smooth proper geometrically connected coarse quotients.
  - The mixed-level T_n for n prime to p are genuinely missing: §9.1 builds degeneracy maps for Γ₁(N) only.
  - So the gap is essentially minimal, and it is precise.
- **`kato-labelled-pushforward` and `kato-labelled-reciprocity`** are absent from `plan.json`. GATE~11 H01 marked this not actionable in the package, because the plan file is outside the job's editable files. That reason still holds, so the item is not re-raised.

## Not verifiable

- **Kenku1982**, pp. 199–201, is cited at §§5.0b and 5.2 for the composite cyclic degrees. It is recorded as uncertified (paywalled) and cited by its locator. The degree list agrees with Mazur's introduction (Mazur1978 lines 11–32, 92–108).

## Source issues

- **Misprint** in BS2020 at §2, equation (3), p. 358: the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that largest power, as ℓ ∣ ord_q(Δ) requires; affects nothing.
- **Misprint** in Kraus1997 at Appendix II, Proposition 1, p. 1158: the source says χ is a Dirichlet character of conductor N; it should be a character modulo N, since the proof of Proposition 2 applies it to trivial-character forms on Γ₀(M); affects nothing.
- **Gap** in BS2020 at §2, Theorem 4, p. 360: the source attributes realization at level M₀ for every irreducible E[ℓ] to Kraus's Théorème 4; Kraus states it at N(ρ̄) under Serre weight 2, so the M₀ form needs Kraus's proof rerun on Theorem 3's newform; affects the proof.
- **Misprint** in BPR2013 at the proof of Proposition 3.3, p. 9: the source writes the bound as 10⁷d²·max(h_F(E)+4 log d, 10³)²; it should be 10⁷d²(max{h_F(E),985}+4 log d)², as in its Theorem 3.1; affects nothing.
