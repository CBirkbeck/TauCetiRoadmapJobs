# Review of EllipticModularityEffectiveComparisons (pull request #1810 at 4a7a185)

**Verdict:** rejected

This is an incremental re-review of the 78 lines changed since 1c8a2cc, which is one commit, 4a7a185. Nothing changed outside the folder. The gate passes on a hand run. The dependency check reports 0 problems. `Suggested.lean` elaborates with exactly 17 `sorry` warnings and exit 0.

The previous review's R02–R05 are repaired. R01 is not: this folder still plans again what EllipticCurveModularityPartII plans, and that roadmap is open and earlier in the merge order. No edit inside this folder repairs that, so the verdict stays `rejected`, and R01 is raised again as the re-raise of H01. R02 below is a small new defect in the rewritten §5.25. It matters only if a human keeps this folder.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~9; earlier GATE~5–~8).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5; `Suggested.lean`, lines 53–302. README line 1701 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII. The r9 report gives the section-by-section list, and it still holds at the sibling's new head. The repair of r9 R03 adds two more duplicates:
- `isogeny_j_tables_11_17_37` (line 286) has the same body as the sibling's `rational_isogeny_j_tables` (its `Suggested.lean` line 230), with `CyclicIsogenyDegree` in place of the sibling's identically defined `HasCyclicIsogeny` (its line 152).
- `non_cm_prime_isogeny_degrees` (line 252) has the same body as the sibling's `noncm_prime_isogeny_degrees` (its line 165), with `GeometricallyNonCM` in place of the identically defined `NonCM` (its line 144).

**Witness.** The sibling's head is now 33c1b4da, marked draft in the index of 2026-11-09T05:16:54Z. Its only change since 32d2da79 is one README line. In ORDER.txt it is on line 273, and this folder is on line 283. Its README line 7 reads "this Part II owns the six comparison layers below".

**Supporting facts at the current heads.**
- Consumers that cite the sibling: a `--lean-only` grep shows AdelicImagesAndModularCurves `Suggested.lean` line 407 citing "EllipticCurveModularityPartII §§5.0a–5.0b". ErdosProgressionPowers (head 3e1048c) is unchanged and still gives the sibling as the supplier of EC.0–EC.6.
- Duplicates by object: a `roadmaps grep --lean-only` for the j-table constants and the prime-degree lists finds statements only in this folder and in the sibling.

**Why the settled reason fails.** GATE~9 answers: "The finding is correct and not disputed … No edit inside this folder repairs it." That reply concedes the finding and gives no reason that it is wrong. The binding rule is that what another roadmap plans is imported and never planned again, and that each object has one owner earlier in the order. Under that rule the finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of these:
1. Close #1810. The consumers and the merge order already point at the sibling.
2. Close #1491 and keep this folder. Then:
   - re-point the sibling's consumers to the counterparts listed at README line 1701;
   - give owners here to the sibling's §1.8 majorants, §6.0e rank-zero theorem, the §6.0f minimal period subvariety and ErdosProgressionPowers's `FullRationalTwo`.

**Tested on the instance.**
- `isogeny_j_tables_11_17_37` and `rational_isogeny_j_tables` give the same seven values, recomputed here: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677 and −9317.
- `martin_sharp_bound` and the sibling's `martin_bound` give 12g = 12, 24, 36, 24, 60 at N = 11, 23, 35, 37, 59 (r9).

## R02 (P3) — §5.25's moduli-form equality does not name the step from a rational point to a rational curve

**Location.** README §5.25 (line 1631): "These are the j-values of the noncuspidal rational points of X₀(r) in the cited tables." Its *Needs:* line (line 1639) lists "ModularCurvesPartII §§5.2, 5.5" and "§§13.1–13.3, 16.2–16.6, 17.3", but not §9.7.

**Claim.** `isogeny_j_tables_11_17_37` now states equality of two sets, so both inclusions are owed.
- The inclusion "every listed value occurs" needs each noncuspidal rational point of X₀(r) to be the class of an elliptic curve over ℚ with a rational cyclic r-isogeny.
- A rational point of the coarse curve gives such a curve only when its j-value is not 0 or 1728. The route ("Evaluate the actual j-maps") and the *Needs:* line omit this step and its hypothesis.
- §5.1 does not have this gap, because it builds its curve directly from CM.
- In the same sentence the locator stops at line 202, but the CM observation it also cites is at lemos-2017 line 212 (p.6).

**Witness.** ModularCurvesPartII §9.7 ("Rational points of `X_H` and Galois images", at #913's head) proves the converse only when j(x)∉{0,1728}. It warns that at 0 or 1728 a K-point need not come from a curve whose image lies in H̄.

**Repair.**
- Add to §5.25, after the quoted sentence: "None of the seven values is 0 or 1728, so by ModularCurvesPartII §9.7 (Borel level, −I∈H̄) each of these noncuspidal rational points is the class of an elliptic curve over ℚ with a rational cyclic r-isogeny; this gives the inclusion ⊇."
- Add "ModularCurvesPartII §9.7" to the *Needs:* line.
- Change "lemos-2017 lines 191–202" to "lemos-2017 lines 191–202 and 212".

**Tested on the instance.**
- The seven values computed: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677, −9317. None is 0 or 1728, so §9.7 applies to each.
- At r=11, the j-invariants computed from the equations of 121a1 [1,1,1,−30,−76], 121b1 [0,−1,1,−7,10] and 121c1 [1,1,0,−2,−7] are −24729001, −32768 and −121. These are the three curves the lift produces.

## Previous findings

- R01 — not repaired: the folder is unchanged in scope. GATE~9 H01 "The finding is correct and not disputed"; the sibling is open at 33c1b4da, order 273 against 283. It is raised again above as R01.
- R02 — repaired: line 98 now reads "From TauCetiRoadmap.WeightsInEtaleCohomology. Consume §6.1 (Layer R34.6), the Ramanujan bound `newform_ramanujan`, at weight k=2 and trivial nebentypus …". The gap line and every `gap:all-embedding-frobenius` and DWP.1 citation are gone.
- R03 — repaired: `exceptional_prime_isogeny_j` (line 243), `non_cm_prime_isogeny_degrees` (line 252) and `isogeny_j_tables_11_17_37` (line 286) are stated. The docstring now restricts the not-statable claim to "that `Y₀(r)(ℚ)` is a single point". The route gap that came with this repair is R02 above.
- R04 — repaired: line 66 "EllipticCurves Layer 1 supplies … the dual isogeny, whose identities φ̂∘φ=[deg φ] and φ∘φ̂=[deg φ] make a rational isogeny of degree prime to n a Galois-equivariant bijection on n-torsion". §4.19 now cites Layer 2 for E′[2]; §4.20 cites Layer 1 and §4.0.
- R05 — repaired: §3.14 "kraus-1997 lines 437–438, which assert the rational two-point by reference to item [25], IV-6"; §3.15 "lines 438–439, which assert without proof …; this subsection supplies the square-class step."

## Verified sound

**Gate, dependency check and Lean.**
- Hand run of the gate at 4a7a185: every check is 0 and the line ends `OK`, the same as the worker's `gate.md`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only README.md, Suggested.lean and metadata.toml.
- Dependency check (`--movable`, board order, content checkout at e7bcd5eb). It prints no UPWARD, CYCLE or `moved:` line:

      depcheck: 238 roadmaps, 2323 edges, 0 problem(s)

  The new supplier WeightsInEtaleCohomology is on ORDER.txt line 147, before this roadmap on line 283. DeligneWeightsAndPurity is no longer cited.
- `lake env lean` on `Suggested.lean` exits 0 with 17 "declaration uses `sorry`" warnings, at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298, and nothing else.
- `#check` pass: one scratch copy with `#check @` for all 27 declarations elaborated with 0 errors. The file has no `variable`, `include`, `set_option` or `lemma`. The elaborated types of the three new theorems match README §§5.1 and 5.25 word for word in generality:
  - `(r, γ) ∈ {(19, 96), …} → {j | ∃ E, ∃ (x : E.IsElliptic), CyclicIsogenyDegree E r ∧ E.j = j} = {-↑γ ^ 3}`;
  - `GeometricallyNonCM E → ∀ r, Nat.Prime r → CyclicIsogenyDegree E r → r ∈ {2, 3, 5, 7, 11, 13, 17, 37}`;
  - the conjunction of three set equalities, in which the pretty-printed `-2 ^ 15` is `-(2 ^ 15)` as in the source.

  The 24 earlier declarations are unchanged apart from docstrings.
- One-tactic probe: in a scratch copy, each of the 15 line-level `sorry`s was replaced by `first | simp | rfl | infer_instance | trivial | omega | decide`. All 15 fail, the three new theorems among them: line 247 "Expected type must not contain free variables", line 254 "unsolved goals", line 293 "`decide` failed". None is padding.

**Seeded sample, where it falls in the changed passages.**
- §4.0 is now cited by line 66 and by §4.20's *Needs:*.
  - mazur-1978 line 35 is Theorem 1 on p.129, and line 57 is the ρ_N framing on p.130.
  - banwait-najman-padurariu line 72 is Theorem 1.1 on p.2.
  - Its Checks were recomputed in the table below.
- §3.17 depends on §§3.14–3.16. kraus-1997 line 284 is Théorème 4 on p.1144, and line 374 begins §3.3 on p.1145.
- §5.26 depends on §5.25. lemos-2017 lines 204–213 (pp.5–6) give the LMFDB check, and "six non-CM values" is still consistent with the rewritten §5.25.
- The other twelve targets (0.2, 0.7, 0.13, 3.7a, 3.18, 4.11, 4.12, 4.15, 5.2, 5.3b, 5.18, 5.19) neither changed nor depend on changed text. Under the incremental brief they were not re-read; r9 read the overlapping ones.

**New locators read.**
- mazur-1978 lines 13–30 (p.129): the table with v=1 at 19, 43, 67 and 163; the CM existence at lines 26–28.
- lemos-2017:
  - lines 187–189 (p.5): non-CM gives r∈{2,…,37};
  - lines 191–202: S_r is defined as the j-values of Y₀(r)(ℚ), with the three sets;
  - line 212 (p.6): −2¹⁵ is the only CM value.
- kraus-1997 lines 431–441 (p.1146; the page-9 header 1147 is at line 444) and bibliography lines 1213–1215 ([25] is Serre's *Abelian l-adic representations*).

**Library declarations opened at the branch pins (Mathlib f6090c70, Tau Ceti 358314d4).**
- `WeierstrassCurve.j` is at Weierstrass.lean:388, and `WeierstrassCurve.j_eq` at :401 (j = Δ⁻¹c₄³). This is the normalization the new §5.1 Check uses.
- No X₀(r) or modular-curve scheme exists under Tau Ceti `NumberTheory/` or Mathlib, which bears out the docstring's statability claim.
- The 31 declarations r9 opened are unchanged in use.

**Cross-roadmap citations resolved this round.**
- WeightsInEtaleCohomology (#1001, head 9e753f8):
  - its §6.1 sits under "Layer 6 … (R34.6)";
  - its `Suggested.lean` states `newform_ramanujan` for every level, nebentypus, k≥2, prime p∤N and embedding σ, with polynomial X² − a_pX + χ(p)p^(k−1). At χ=1 and k=2 this is the `X^2 - sigma(a_q)*X + q` of line 100.
- AutomorphicGaloisRepresentations (#1007, head 480c64f): §6.1 is the weight-two Tate decomposition, and §6.4 gives the conductor away from ℓ, the bad Euler factors and the K_f=ℚ identification of conductor and L-function. Both match line 96. §§3.5, 3.6 and 3.13 still cite §6.4.
- EllipticCurves on main (e7bcd5eb): Layer 1 dual-isogeny bullet (line 566, both identities); Layer 2 "structure of E[N]" over a separably closed field (line 649); Layer 3 Hasse bound (line 683, bullet at 746).
- ModularCurvesPartII (#913): §9.7 (R02), and §5.2 for the coarse map used by §5.1's inclusion ⊆.
- `roadmaps resolve` on the README lists no citation and no Lean name that is found nowhere. `overlaps.md` lists no open pull request changing this roadmap and no dropped id.

**Remarks, not findings.**
- `design/plan.json` on the board still lists `all-embedding-frobenius` (AutomorphicGaloisRepresentations §6.1). The README no longer declares it, so the intake withdraws it, as r9 R02's repair said.
- The pull-request description still says "fourteen headline theorems" and "nine simple definitions". The file now has 17 theorems and 10 definitions.
- Line 100's "Sections 1.4 and 3.4 use exactly this bound, through §§1.1 and 1.3" fits §1.4 only. §3.4 uses the bound directly. Harmless.

**Declared gaps.** The README declares the seven slugs that remain: optimized-elliptic-weight-two, weight-two-local-reduction, mixed-cusp-charts, chen-winding-comparison, positive-characteristic-support, modular-rank-zero and quantitative-abelian-periods. Their suppliers and sections equal `plan.json`'s, and none has supplier `none`. The r9 point that two of them ask for what the sibling owns is part of R01.

**Adversarial pass.** Changed statements have rows computed in this review. Rows marked (r9) are carried from the r9 report for statements this diff leaves untouched, with r9's values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `exceptional_prime_isogeny_j` §5.1 | (19,96) on y²+y=x³−38x+90; the four γ; pair (19,960); r=11 | c₄=1824=19·96, Δ=−6859=−19³, j=−884736=−96³; −960³=−884736000, −5280³=−147197952000, −640320³=−262537412640768000, each among the 13 rational CM j-values; (19,960) and r=11 lie outside the Finset, so nothing is asserted; ⊇ from mazur-1978 lines 26–28 | sound | none |
| `non_cm_prime_isogeny_degrees` §5.1 | 11a1; the CM curve above; r=1 | 11a1: j=−122023936/161051∉ℤ, so non-CM, with a rational 5-isogeny and 5∈list. The CM curve has r=19∉list, so `hCM` is needed (the new Check). r=1: the identity gives degree 1 for every E and 1∉list, so `hr` is needed | sound | none |
| `isogeny_j_tables_11_17_37` §5.25 | the seven values; 121a1, 121b1, 121c1; 0 and 1728 | −24729001, −32768, −121; −297756989/2, −882216989/131072; −162677523113838677, −9317 = lemos-2017 lines 197–202; only −32768 is CM; j(121a1, 121b1, 121c1) = −24729001, −32768, −121; none of the seven is 0 or 1728 | statement sound; route omits the lift | R02 |
| WeightsInEtaleCohomology §6.1 at k=2, χ=1 (line 100) | 11a at q=2; level 23 at q=2 | X²−a_qX+χ(q)q^(k−1) = X²−a_qX+q; 11a: the roots of X²+2X+2 are −1±i with modulus √2, and 2≤2√2≈2.828; level 23: \|σ(a₂)\| = 0.618, 1.618 ≤ 2.828 | sound | none |
| §1.4 nonvanishing via §1.1 at one embedding | level 23, p=2, s=±1 | α=3∓a₂ has norm 11 (s=+1) and 5 (s=−1), nonzero and ≤(√2+1)⁴≈33.97; α=0 would need \|σ(a₂)\|=3>2.83 | sound | none |
| §3.4 (Ramanujan + Hasse) | level 23, q=2; b∈{−2,…,2}, b=±3 | N(b−a₂)=b²+b−1 = 1, −1, −1, 1, 5 (good case) and 5, 11 (b=∓3); all nonzero and ≤33.97; 4√q against (√q+1)² at q=2, 3, 5: 5.657≤5.828, 6.928≤7.464, 8.944≤10.472 | sound | none |
| Line 66: coprime-degree bijection | y²=x³−x, φ to E/⟨(0,0)⟩, n=3 and n=2 | n=3: φ̂φ=[2] and [2]²=[1] on E[3], so φ is injective, and 9=9 points makes it bijective; n=2: φ(0,0)=O, so it is not injective | sound; coprimality needed | none |
| §4.19 (Layer 2 citation) | E:y²=x³−x, T=⟨(0,0)⟩, T′=⟨(1,0)⟩ | E′: y²=x³+4x with E′[2]={O,(0,0),(±2i,0)}; φ̂(E′[2])=T≠T′, so the kernel ≠E′[2]; a noncyclic order-4 subgroup is killed by 2, so it equals E′[2] | sound | none |
| §4.20 (Layer 1, §4.0) | y²=x(x+5)(x+32), ℓ=3, P=(4,36) | 2P=(4,−36)=−P, so 3P=O; E[3] reducible with full 2-torsion; gcd(2,3)=1 transports the line; 12 is in the Mazur–Kenku list | sound | none |
| §§3.14–3.15 locators | kraus-1997 lines 437–439, 1214 | the rational 2-point "cf. [25], IV-6" with [25]=Serre; the quotient asserted with no argument; p.1146 | sound | none |
| §4.0 Checks | y²=x³+2 at n=3; y²=x³−3x−1; y²=x³−x+1; y²=x³+1 over 𝔽₅ | ψ₃=3x(x³+8) gives (0,±√2), a stable order-3 subgroup with no rational generator; disc 108−27=81, a square, so C₃; disc 4−27=−23, so S₃; 5≡2 mod 3, supersingular, E[5](𝔽̄₅)=0 | sound | none |
| Docstring: point counts not statable | X₀(r) at the pins | no modular-curve carrier in Tau Ceti `NumberTheory/` or Mathlib | sound | none |
| `localTerms` §0.1 (r9) | (0,0), (2,2), (3,2), (2,3), (4,1) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); 0 | sound | none |
| `martin_dimension_formula` §0.5 (r9) | 1≤N≤4000 | 0 mismatches; N=1, 2, 11, 23, 30, 35, 37, 59, 64 give 0, 0, 1, 2, 1, 3, 2, 5, 1 | sound | none |
| `martin_sharp_bound` §0.16 (r9) | 1≤N≤4000 | no 12g>N+1; equality set {35} ∪ primes ≡11 mod 12 | sound | none |
| §§0.6–0.10, 0.14, 0.15, 0.8 (r9) | N≤3000; the cutoff; 505 levels; 11,250 tuples | 0 violations; N>1521; max(12g−N)=−38; min(N−12g)=18; 12g at p=11, 23 is 12, 24 | sound | none |
| §§2.1–2.3 (r9) | N=1, 4, 11, 35 | F=1, 3+2√2, (1+√8)⁶; G=H=4, 4, 13+4√3 | sound | none |
| `newform_integral_of_small_primes` §3.1 (r9) | N=11, 23 | a₂=−2∈ℤ; a₂=(−1±√5)/2∉ℤ | sound | none |
| `integral_ideal_sturm` §3.7a (r9) | N=4, J=4ℤ | cutoff tests n≤1; a₁=1∉4ℤ | sound | none |
| `kraus_prime_power_congruence` §3.10 (r9) | q=2 | `hbad` excludes 2 | sound | none |
| §3.13, `four_divisible_isogeny_realization` §3.16 (r9) | y²=x³−x; a=3, b=1 | #E(𝔽₃,𝔽₅,𝔽₇)=4, 8, 8; quotient x(x−1)(x−5) | sound | none |
| §4.8, §4.18 (r9) | 2≤N<2000; ℓ=3, 11 | 17 levels; ℤ/6, ℤ/22 | sound | none |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees` (r9) | degrees 0, 1, 22, 20 | 0 noncyclic; 1 allowed; 22 and 20 absent | sound | none |
| `full_two_uniform_irreducibility` (r9) | ℓ=3, (4,36) | 3P=0, so the cutoff 5 is needed | sound | none |
| `split_normalizer_exclusion`, §5.5 (r9) | p=11, 13, 17; D=−3 | hypotheses exclude 11 and 13; χ₋₃(17)=−1, R=1 | sound | none |
| `proper_image_nonsplit`, §5.12 (r9) | p>37; PSL₂(𝔽₁₁) | = lemos-2017 Theorem 2.3; order 660, simple | sound | none |
| `cyclic_isogeny_integral_j` §5.18 (r9) | y²=x³−x at p=11 | j=1728∈ℤ, with no non-CM hypothesis | sound | none |
| §§5.19–5.23 (r9) | r=2, 3, 5, 7, 13 | degrees 3, 4, 6, 8, 14; 25, 13, 8, 6, 4 values | sound | none |
| §§5.3a, 5.3c, 5.25a (r9) | d=1, 2; p=5, 17; E₁₁ | 6.247·10⁶<6.895·10⁶; 48.033, 83.790; B(E₁₁)=2 | sound | none |
| `lemos_uniform_surjectivity` §5.28 (r9) | n=1 | excluded by `1 < n` | sound | none |
| Conventions (r9) | q+2q² | L(1)=2; ∫=−2; W=i/π | sound | none |
| Sibling against this folder | the new j-table and degree-list statements | identical bodies; the same seven values | duplicate | R01 |

## Not verifiable

- The table that lemos-2017 cites for S₁₁, S₁₇ and S₃₇ ([6, p.98]) is not in the manifest and was not read. Only the values, and the curves at r=11, were checked.
- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified. They are untouched by this diff.

## Source issues

- **Error** in lemos-2017 at §2, proof of Theorem 1.1, page 5: the source says the Jacobian of X₀(37) has rank zero; it has rank one (one factor has rank one), so the point determination needs a rank-zero quotient instead; affects the proof.
- **Gap** in kraus-1997 at §3.3, proof of Théorème 4, printed page 1146: the source says the quotient by the only rational 2-point has full rational 2-torsion; it should first show b or a²−4b is a square, by Chebotarev on the 4∣n_l condition; affects the proof.
