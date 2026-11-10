# Review of EllipticCurveModularityPartII (pull request #1491 at 99111f0)

**Verdict:** accepted

This is an incremental re-review of the 19 lines that changed in the folder since `79a07e1`, which review 25 read. All of them are in `README.md`; `Suggested.lean` is byte-identical. The pull-request description also changed.

There are no findings at this head. All three findings of review 25 are repaired, and no repair introduced a new problem.

The acceptance is conditional on the declared gap `gap:mixed-modular-jacobians` (ModularCurvesPartII).

## Previous findings

- R01 — repaired: README line 822 now says B₁∩B₂ "is smooth by Cartier's theorem (GroupSchemesOverABase §4.5), which needs characteristic zero but no affineness". Line 92 adds `### From TauCetiRoadmap.GroupSchemesOverABase`, consuming §4.5 (`smooth_of_charZero` there).
- R02 — repaired: the description now settles the duplicate: "#1810 is to be closed, or cut down to a consumer that cites this roadmap for everything it restates, before either pull request merges". It also gives the layer-to-section mapping.
- R03 — repaired: the description's direct-supplier list now ends "#1018 (EllipticCurveModularity), #1019 (PadicFamilies)". It names #1522 (GroupSchemesOverABase) as a direct supplier by another author.

## Verified sound

### The R01 repair, step by step against review 25's repair

1. **New contract (README lines 90–92).** It states: for a field k of characteristic zero, every group object in schemes over Spec k whose structure morphism is locally of finite type is smooth, with no affineness assumed.
   - This is GroupSchemesOverABase §4.5 at the #1522 head `2e1e5e7`: README line 851 proves `smooth_of_charZero`, and `Suggested.lean` line 301 states it.
   - The Lean statement is `[CharZero k] (G : Grp (Over (Spec (CommRingCat.of k)))) [LocallyOfFiniteType G.X.hom] : Smooth G.X.hom`.
   - Base, finiteness and conclusion are identical, and neither side assumes affineness.
2. **§6.0f (line 822).** The existence argument for A_ω now cites §4.5 within its hypotheses:
   - K⊆ℂ has characteristic 0;
   - B₁∩B₂ is a closed subgroup scheme of A, so it is of finite type, hence locally of finite type, and it is a group object over Spec K.
   - The contract also says B₁∩B₂ is "affine only when it is finite". That is right: proper and affine imply finite, and finite implies affine.
3. **Scope (line 11).** The Cartier clause now reads "GroupSchemesOverABase §4.5 supplies Cartier's theorem … which the existence of A_ω uses". §6.0f still owns A_ω, the explicit isogeny bound and the Gaudron–Rémond estimates.
4. **Mathlib contract (line 35).** The Cartier-route sentences are gone. No remaining line cites `CategoryTheory.GrpObj`, `KaehlerDifferential`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.Smooth` or `AlgebraicGeometry.smooth_of_grpObj` (grep: 0 hits).
5. **Tau Ceti contract (line 41).** Its two affine-Cartier sentences are gone. The new contract (line 92) names `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` only to say that it does not reach the non-affine case. That is correct at the pin: `TauCeti/AlgebraicGeometry/Group/Cartier.lean:32` carries `[IsAffine G.left]`.
6. **Needs and Dependencies.** The §6.0f *Needs:* (line 832) and the Layer 6 Dependencies (line 1147) both name "GroupSchemesOverABase §4.5". **Stacks** is dropped from References, and no `Stacks`, `047I` or `047N` locator remains (grep: 0 hits).
7. **Description.** #1522 is in the depends-on block and in the merge-order chain, as "#1522 (GroupSchemesOverABase, mycaule) → this pull request".

The rest of §6.0f was reread around the change and is consistent with it:
- the API bullets;
- the second *Needs:* ("The minimal period subvariety and the period estimates in the route are proved within this subsection"), which stays true because A_ω's definition and its existence argument remain here;
- the characteristic-p Check at line 851 (relative Frobenius, ker F×0).

### Nothing at the pins already proves the general Cartier theorem

- **Tau Ceti `2fd255d`:**
  - `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (`Group/Cartier.lean:32`) needs `IsAffine`.
  - `smooth_of_grpObj_of_isAlgClosed_of_isReduced` (`Group/Smooth.lean:41`) needs an algebraically closed field and `IsReduced`.
- **Mathlib `1b1ccf4`:** `AlgebraicGeometry.smooth_of_grpObj` (`AlgebraicGeometry/Group/Smooth.lean:62`) needs `GeometricallyReduced`.

None of these gives the non-affine characteristic-zero statement, so §4.5's target is not a library duplicate.

### Ownership of Cartier's theorem

I searched every README with `roadmaps grep -i "Cartier'?s (smoothness )?theorem"`, and `git grep` on main `4ee3e19`.
- GroupSchemesOverABase §4.5 is the only owner of the non-affine statement.
- AdelicAlgebraicGroups, ClassicalGroups, ReductiveGroups (#1676), FormalConnectionsOpers and PadicDifferentialEquationsAndRigidCohomology use only the affine Tau Ceti case.
- No roadmap on main owns it.
- GroupSchemesOverABase lists this roadmap only under Downstream consumers (its README lines 1427–1430), which now matches this README.

### Supplier order

- **GroupSchemesOverABase is an admissible supplier.** It is a new roadmap folder by another author, and it is not on the never-cite list.
- **Its placement.** `gate --candidate` on its README places it after NeronModelsAndSemistableAbelianVarieties (`ORDER.txt` line 66), with 0 problems. Its other suppliers are on main (ReductiveGroups, SchemeAndStackFoundations, ModularCurves, FlagVarieties) or earlier in the merge order (FiniteFlatGroupsAndIntegralPadicHodgeTheory at line 65, AlgebraicModuliForArithmeticGeometry). This roadmap is line 275.
- **Dependency check** for this roadmap (`--movable`, `--pr 1491`):

```text
depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

### Gate, elaboration, signatures, padding probe

**Gate**, rerun at `99111f0`:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0. Its only messages are 17 `declaration uses sorry` warnings.

**`#check @` of all 32 declarations**, in one scratch file:
- The types equal `scratch/signatures.md` and review 25's record. The file has no section variables, so no binder can be lost.
- The hypotheses are all present: `[Fact ell.Prime]`, `3 ≤ ell`, `5 ≤ ell`, `11 ≤ ell`, `IsIrreducible`, `NonCM`, `1 < n`, `37 < p`, and `p ∉ {2,3,5,7,13}`.

**One-tactic probe**, stricter than review 25's: every sorry was replaced by `first | (rfl; done) | (simp; done) | (norm_num; done) | (decide; done) | (infer_instance; done) | (trivial; done) | (aesop; done)`. All 17 theorems still fail. None is padding.

### Headline theorems

`Suggested.lean` is unchanged, so review 25's account stands. The statable headlines of §§1.3–1.4, 2.1–2.2, 3.1, 3.4, 4.2, 5.0a–5.0b, 5.4–5.6, 6.0b (moduli form), 6.10, 6.11 and 6.18 are stated. The docstring names the non-statable ones and the carrier each lacks.

The change does not touch a headline: §6.0f's isogeny-degree bound remains non-statable for want of the stable Faltings height, and A_ω was never a Lean declaration.

### The description (R02, R03)

**The EllipticModularityEffectiveComparisons mapping** was checked against that roadmap's README at `c90f56d`:
- its Layer 0 (Martin) and Layer 2 (Kraus thresholds) → §§1.1–1.8;
- its Layer 1 (removed-prime) → §§2.1–2.2;
- its Layer 3 → Layers 3–4 (its 3.7a → §4.2, its 3.18 → §4.8);
- its §4.0 → §2.0 and §5.1, and the rest of its Layer 4 → Layer 5;
- its Layer 5 → Layer 6, with its §5.0 → §5.0a.

Its §5.1 j-values (−96³, −960³, −5280³, −640320³) have no counterpart here: a grep for 640320 or 5280 returns 0 hits.

**The direct-supplier list** now has 22 entries plus #1522. Together they equal the depends-on block (23 entries) and the roadmaps that are not on main and are cited in `### From …` headings or *Needs:* lines.

### Seeded sample

None of the 15 seeded targets falls in a changed passage. The changed passages are line 11, lines 35/41/90–92, §6.0f, the Layer 6 Dependencies and References.

Review 25 verified 1.4, 4.4, 6.0a (Lemos2017 lines 236–241), 6.2, 6.13 and 6.14 at the same text. I also checked the other nine against the cached texts:

| Target | Locator | Text found | Verdict |
|---|---|---|---|
| 1.6 | Kraus §3.1 (8), p. 1144 | Kraus1997 line 270, on the page marked 1144: G(n)=(√(μ(lcm(4,n))/6)+1)² | supports |
| 1.8 | Kraus (7)–(9), pp. 1143–1144; BS §2 p. 360 | Kraus1997 lines 240 (p. 1143), 270 and 279 (p. 1144) | supports |
| 3.1 | Kraus §3.2 Lemma 1, pp. 1144–1145 | Kraus1997 lines 295–299: a newform in S₂^new(M) with a_l∈ℤ for primes l≤μ(M)/6 has all aₙ∈ℤ | supports |
| 4.3 | Kraus App. II Prop. 2 and Corollary, pp. 1158–1159 | Kraus1997 lines 1082–1093 (conditions (i)–(ii), modulus Pᵐ, M=lcm(4,N)) and 1095–1108 (the mod-4 equivalence, with P=2ℤ and m=2) | supports |
| 4.8 | BS §2 Thms 3–4, pp. 359–360; Kraus §3.1 Thms 3–4, p. 1144 | BS2020 lines 184 and 235; Kraus1997 lines 249 and 284 | supports |
| 5.3 | BS §3 Lemmas 3.3, 3.5, pp. 361–363 | BS2020 lines 287–298 (full 2-torsion, ℓ≥7, Mazur) and 331–336 (one 2-point, ℓ≥11). The README correctly marks the 2ℓ/4ℓ kernel argument as derived. | supports |
| 5.5 | BS §3 Lemma 3.5 proof, p. 363 | BS2020 lines 334–336 | supports |
| 6.0d | DarmonMerel Prop. 7.1, pp. 18–20; Mazur Cor. 1.1, p. 137 | DarmonMerel2001 lines 590–600 (Hecke-stable kernel of J→J_e); Mazur1978 line 356 (e(K/ℚ_p)<p−1) | supports |
| 6.1 | Lemos §2 (2.1), pp. 4–5 | Lemos2017 lines 145 and 168–178: C_ns is diag(a, aᵖ) with a∈𝔽_{p²}^× | supports |

### Adversarial table

**Rows added this round, with values computed now:**
- a Python point counter over 𝔽_q (Legendre-symbol sum) and discriminants from the a-invariants;
- direct arithmetic for the rest.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 6.0f existence of A_ω via GroupSchemesOverABase §4.5 (changed) | μ₂/ℚ; α_p/𝔽_p; E³ with B₁=E×E×0, B₂=E×0×E; E×E with B₁=E×0, B₂=graph[2] | x²−1 has roots ±1 and derivative ±2≠0, so étale, as §4.5 gives. α_p has Ω¹ free of rank 1 but dimension 0, so not smooth, excluded by `[CharZero k]`. In E³: B₁∩B₂=E×0×0 has dim 1 and tangent {(a,b,0)}∩{(a,0,c)}={(a,0,0)} of dim 1, so it is smooth, proper and not affine, outside Tau Ceti's `IsAffine` case. E[2]×0 in char 0: tangent {(v,0)}∩{(v,2v)}=0, order 4, 4 geometric points. In char 2 the tangent is 1-dimensional while the dimension is 0. | holds; char 0 needed, affineness not |
| 4.3 mod-4 recognition | 11a1, 14a1, 15a1, 17a1, 20a1, 21a1, 26b1, 30a1, 37a1, 49a1, all good primes q<3000 | Bounds μ(lcm(N,4))/6 = 12, 8, 24, 18, 6, 32, 14, 24, 38, 56. Where divisibility fails, the least failing q is 3, 3, 3, 3, 3, 5, each within the bound. 15a1, 17a1, 21a1 and 30a1 pass up to the bound, for example 15a1 gives 8, 16, 16, 16, 16, 24 at 7…23, and show 0 failures below 3000. | holds; 0 counterexamples |
| 4.8 M₀ vs N(E[ℓ]) | 11a1 at ℓ=5 and 11; 27a1 at ℓ=5; 50a1 at ℓ=5 | 11a1 (Δ=−11⁵): M₀=1 at ℓ=5, 5∤M₀, N(E[5])=1. At ℓ=11, M₀=11 is divisible by ℓ, while N(E[11]) is 1. 27a1 (Δ=−3⁹): M₀=27=N(E[5]). 50a1 (Δ=−2·5⁴, N=2·5²): M₀=50 with 5∣M₀, prime-to-5 part 2=N(E[5]). | holds, both directions |
| 5.3 cyclic 4-kernel | E[4]≅(ℤ/4)², T=⟨(2,0)⟩, T′=⟨(0,2)⟩, P=(0,1) | 2P=(0,2)∉T, so φ_T(P) has order 4 and the kernel of E/T→E→E/T′ is cyclic of order 4. Taking T=T′ would give 2P∈T, so distinctness is needed. | holds |
| 6.0a normalization | f₂=(t+16)³, f₁₃ | f₂(8)/8=1728 and f₂(−16)/(−16)=0. With u=2t, u=16 gives 2048. f₁₃(−1)/(−1)=576. f_r(ct)=c·f_r(t) at t=0 forces c=1, since f_r(0)≠0. | holds |
| 6.0d winding period | f=e^(2πiz)+2e^(4πiz) | ∫₀^∞ f(it)dt = 1/(2π)+2/(4π) = 0.318310 = 1/π, so W=i/π and 2πi·W=−2.0; the reverse path gives +2. Width p: p(t+2t²)dt/t = (p+2pt)dt. | holds |
| 6.2 local condition | p=7, q=2, 3, 5, 11, 13, 29 | q² mod 7 = 4, 2, 4, 2, 1, 1. Only q≡±1 (13, 29) escape forced potentially good reduction. At q=p, χ_p² is trivial on inertia only if p−1∣2. | holds |

**Rows carried from review 25** (statements this diff leaves untouched; values as recorded there):

| Statement | Values (review 25) | Result |
|---|---|---|
| `localTerms` (1.1) | (0,0), (2,2), (3,2), (2,3) → (1,1,1,1,1), (1/4,0,−1,1,0), (5/9,1,1,−1,0), (3/8,0,1,0,0) | holds |
| `martinValue`, `dimension_comparison` (1.2–1.3) | 0 mismatches for N≤3000 against the genus formula with Möbius-square inversion; N=0,1,11,13,30,35,47 → 0,0,1,0,1,3,4 | holds |
| `martin_bound` (1.4) | 0 violations for N≤3000; equality set {35} ∪ {primes ≡ 11 mod 12}, 110 values | holds |
| `sharpF`/`sharpG`/`sharpH` (1.5–1.7) | F♯ = 0, 1, 1, 5.8284, 1, 9, 3148.63, 46149.08 and G♯ = 0, 4, 4, 19.928, 22.483, 34.798, 62.856, 62.856 at N = 0, 1, 4, 11, 13, 15, 35, 47 | holds |
| 1.8 sharp ≤ majorant | 0 failures for N≤3000; at N=11, F_K=9 and G_K=169 | holds |
| `norm_bound` (2.1) | ℚ(√2), ℓ=7, x=3+√2: 7≤7≤19.49; B=1.6 gives 2.56 | holds |
| `deletionLevel` (2.2) | 11a1: M₀=1 at ℓ=1 and 5, else 11; 14a1: 7 at ℓ=2, 1 at ℓ=3; 27a1: 27; 26b1: 13 at ℓ=7; 141a1: 47 at ℓ=7 | holds |
| `removed_prime_bound` (2.2) | right sides 1.628, 1.342, 1.539 < ℓ at reducible instances | irreducibility needed |
| `rationality_of_small_prime_coefficients` (3.1) | N=11: μ=12, a₂=−2; g⁺=0 for N≤10 | holds |
| `deletion_level_realization` (3.4) | F♯(11)=5.83<11; 26b1 at ℓ=7 reducible; F♯(47)=46149>7 | holds |
| `integral_sturm_congruence` (4.2) | k=0, N=1 gives bound 0; k=12 gives 1; Δ has a₀=0, a₁=1 | holds |
| 4.4/4.7 | N=11: μ(44)/6=12; q=3, 5, 7; 4√7=10.58<19.93 | holds |
| 4.5 matrix selection | 86 subgroups of GL₂(ℤ/4), 0 counterexamples | holds |
| 5.0a–5.0b degree theorems, `NonCM` | 49a1: j=−3375, degree 14; 20, 22, 41 absent; j=1728 fails NonCM; j(11a1) not integral | holds |
| `full_two_irreducible` (5.4) | 15a1 roots −13/4, −1, 3; ℓ=3 permits degree 12 | ℓ≥5 needed |
| `rational_two_irreducible` (5.5) | 49a1 at ℓ=7 gives the permitted degree 14 | ℓ≥11 sharp |
| `deletion_level_full_two_realization` (5.6) | 15a1: M₀=15, H♯=34.80; 11a1 at ℓ=23: #C(𝔽₃)=5 | holds; full 2-torsion needed |
| `rational_isogeny_j_tables` (6.0b) | the seven j-values; 37a1 #E(𝔽₂)=5, #E(𝔽₃)=7 | holds |
| `ImageInNonsplitCartanNormalizer` (6.1) | p=11: N_ns=240, N_sp=200, GL₂=13200; intersections 16, 8, 8, 40, 2 | holds |
| `nonsplit_of_not_surjective` (6.10) | \|SL₂(𝔽₄₁)\|·40 = 2755200 = \|GL₂(𝔽₄₁)\| | holds |
| `lemos_integral_j` (6.11) | y²=x³−x: j=1728 (CM); 11a1 has a 5-isogeny and non-integral j | holds |
| 6.12–6.15 | constants 4096, 729, 125, 49, 13; set sizes 25, 13, 8, 6, 4 = Lemos2017 lines 253–260 | holds |
| 6.16–6.17 | 5·16·6=480=\|GL₂(𝔽₅)\|; j=576: Δ=−2¹⁵·3⁴, B_j=12 | holds |
| 6.0f bounds | B(1,0)=9,702,250,000,000; B(2,≤985)≈3.9028·10¹³; [10⁷+i] has kernel 10¹⁴+1 | holds |

### Gaps and overlaps

- **`gap:mixed-modular-jacobians`.** It has the same slug in `design/plan.json` (supplier ModularCurvesPartII) and on README line 138. It is unchanged since review 25, which found it precise and not already provided.
- **`scratch/overlaps.md`.** No other open pull request changes this roadmap, no cited id is dropped and no id depends on a revision. Of the closest roadmaps, EllipticModularityEffectiveComparisons is now settled in the description.
- **`scratch/citations.md`.** It lists no unresolved citation or Lean name. `smooth_of_charZero` resolves at #1522.

### Remarks (no change requested of this folder)

- **A consumer's description is now stale.** FaltingsFinitenessAndIsogenyTheoremsPartII README line 136, at its head, says that A_ω's existence uses Cartier's theorem, "which is proved there" (in §6.0f). After this repair §6.0f imports it from GroupSchemesOverABase §4.5. That clause belongs to that roadmap's own review. Its citation of §6.0f for A_ω stays valid.
- **The board manifest keeps an unused entry.** The board package's `sources.toml` still records `StacksProject` (Tags 047I/047N) for §6.0f, but the README no longer cites the Stacks project. The worker may drop that entry.
- **Earlier source issues.** The six source issues reported by review 25 (Lemos2017, Martin2003 ×2, Kraus1997, BS2020, BPR2013) stand. This round's locator checks found no new ones.

## Not verifiable

- **Kenku1982**, pp. 199–201, the composite cyclic-degree list used by §§5.0b and 5.2. The manifest records it as uncertified (paywalled), so it is cited by its locator. The text is unchanged since review 25.

## Source issues

- none
