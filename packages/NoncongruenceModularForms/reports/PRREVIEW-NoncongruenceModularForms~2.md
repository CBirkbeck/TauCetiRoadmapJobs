# Review of NoncongruenceModularForms (pull request #1709 at e4ce532)

**Verdict:** needs changes

## R01 (P1) — The degree-6–11 transitive-group label is a target with no owner

Location: `TauCetiRoadmap/NoncongruenceModularForms/README.md:1196`–`1202` ("For degrees 6–11 the required supplier contract is a reference family of transitive subgroups … PolynomialGaloisGroups does not contain this contract, and PolynomialGaloisGroupsPartII's ramified-merging theory does not supply it. The larger-degree label target requires that additional classification"), consumed at `README.md:1653` (`monodromy_group` column, "with its transitive-group label (6.2)").

Claim: the `nTk` label of the monodromy group is a target of this roadmap up to degree 11, and only degrees above 11 are out of scope.

Witness: `Completed/PolynomialGaloisGroups/README.md:1172` (Layer 6) stops at degree 5; a search of PolynomialGaloisGroupsPartII at its open head for `6T`, `11T`, `nTk` or "transitive subgroups of" returns nothing; the pull request has no `plan.json`, so no gap is declared. The prerequisite is stated as required and as supplied by nobody.

Repair: either scope it out or own it. The cheap repair: in Scope and ownership add a deferral "the `nTk` label of the monodromy group is a target for `n ≤ 5` only (PolynomialGaloisGroups Layer 6); for `n ≥ 6` the label string is not a target, the monodromy group of 1.1 is", and rewrite the last five sentences of 6.2 and the `monodromy_group` item of 9.1 accordingly. Test: the degree-7 monodromy groups of orders 42, 168 and 5040 computed in the worked examples are still identified as abstract groups by 1.1 and 3.5; only the label string is deferred. (The previous review's R08 asked for an eligible owner or an owned target; the head replaced the wrong citation by an unowned contract, which is not a repair.)

## R02 (P2) — The strict Wohlfahrt theorem is a statable owned headline absent from `Suggested.lean`

Location: `README.md:764`–`768` ("For arbitrary finite-index Γ ≤ SL₂(ℤ), prove the strict version `IsCongruenceSubgroup Γ ↔ Gamma (strictLevel Γ) ≤ Γ`, using the elementary normal-generation argument of Kiming–Schütt–Verrill"); `Suggested.lean:186`–`207` (Layer 3 states only `generalLevel`, `strictLevel` and the composition-factor obstruction); the module docstring (`Suggested.lean:14`–`30`) does not name it as not statable.

Claim: §3.3 owns the strict form of Wohlfahrt's theorem; §4.4's proof of `hsu_strict` consumes it ("`Gamma N_s ≤ Γ` by the `SL₂` form of 3.3").

Witness: every carrier is at the pins (`CongruenceSubgroup.Gamma`, `IsCongruenceSubgroup`, and the file's own `strictLevel`); the previous head stated it (`wohlfahrt_strict` in the previous review's table) and the repair deleted it although ModularFormsPartII W1.8 owns only the signed form (`packages/ModularFormsPartII/design/README.md:358`–`380`: conclusion `Γ(L(G)) ≤ ⟨G, E⟩` for an arbitrary congruence `G`).

Repair: add to Layer 3 of `Suggested.lean`
`theorem wohlfahrt_strict (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] : IsCongruenceSubgroup Γ ↔ Gamma (strictLevel Γ) ≤ Γ := sorry`.
Tested instances: `Γ(3)` (strict level 3, `Γ(3) ≤ Γ(3)`, both sides true); `Γ₁(5)` (strict level 5, contains `Γ(5)`, both true); Kiming–Schütt–Verrill's lift `⟨−T, A, B⟩` of `Γ₀(6)` (ksv line 641–649: strict level `lcm(2, 12, 3, 2) = 12`, noncongruence, so `Γ(12) ⊄ Γ`, both false); the kernel `{γ ∈ Γ(2) : a ≡ 1 mod 4}` (strict level 4, congruence of level 4, both true). The ⟹ direction follows the KSV proof (ksv line 200–261) with `N_s` in place of `2N`: the only inputs are `gT^{M}g⁻¹ ∈ Γ` for all `g` and `N_s ∣ ν`, both of which hold for `M = N_s` by definition of the strict level. The projective form on `lift Γ'` is W1.8's and need not be restated.

## R03 (P3) — Library declarations and files cited that do not exist at the pins

Location: `README.md:683` (`Gamma0Projective_index`), `:612` ("Tau Ceti proves in `CongruenceSubgroups/Elliptic/Gamma0.lean`"), `:686`–`687` ("Tau Ceti's `Cusp/Width.lean` and `Cusp/Count.lean`"), `:259` (`index_normalCore`).

Witness, at the pinned Tau Ceti: the only `Γ₀` index theorems are `Gamma0_prime_index` and `Gamma0_prime_power_index` (`TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean:556`, `:640`); no file `Elliptic/Gamma0.lean` exists (the `CongruenceSubgroups` directory holds `Basic.lean` and `Units.lean`); `TauCeti/NumberTheory/ModularForms/Cusps/` holds `Basic`, `ConstantTerm`, `LevelRaise`, `ModularGroup`, `Rat` and no `Width.lean` or `Count.lean`; no theorem on `Γ₀(N)` cusp counts or elliptic counts was found by grep. At the pinned Mathlib there is `Subgroup.finiteIndex_normalCore` (`Mathlib/GroupTheory/Index.lean:890`) and no `index_normalCore`.

Repair: cite the two existing `Γ₀` index declarations and state the general-`N` index, the cusp count `Σ_{d ∣ N} φ(gcd(d, N/d))`, the widths `N/(d·gcd(d, N/d))` and the elliptic counts of Diamond–Shurman Corollary 3.7.2 as targets of §2.5/§2.2 (they follow from the `ℙ¹(ℤ/N)` action already stated there); drop `index_normalCore` from the Mathlib table or replace it by `finiteIndex_normalCore`. Test: `N = 4` gives index 6, widths `{1, 1, 4}`, `ε₂ = ε₃ = 0`; `N = 11` gives index 12, widths `{11, 1}`, `ε₂ = ε₃ = 0`; both agree with the permutation rows of the worked examples.

## R04 (P3) — §3.1 re-plans the intersection and normal-core laws that §3.2 imports

Location: `README.md:732`–`739` ("Prove, for finite-index `Γ̄, Γ̄₁, Γ̄₂ ≤ PSL₂(ℤ)`: … `N(Γ̄₁ ⊓ Γ̄₂) = lcm(N(Γ̄₁), N(Γ̄₂))` … `N(Γ̄.normalCore) = N(Γ̄)`"), against `README.md:49`–`50` and `:753`–`754` ("ModularFormsPartII W1.3, W1.5–W1.6 and W1.8 own geometric level, intersection/core laws"; "Transport W1.5 and W1.6 to projective intersections and normal cores").

Witness: `packages/ModularFormsPartII/design/README.md:301`–`337` (W1.5, W1.6) state exactly these laws for groups containing `−I`, which every `lift Γ̄` does; W1.3 (`:242`) says its level equals that of the projective closure.

Repair: in §3.1 keep the strict-level identities (W1.5 assumes `−I`, so they are new) and the order-of-`T̄` description; delete the projective "Prove" and point at §3.2's transport. Test: the images of `Γ(2)` and `Γ(3)` give `lcm(2, 3) = 6` for the intersection on both routes.

## R05 (P3) — Software packages cited as the source of the mixed-case relations

Location: `README.md:915`–`916` ("the mixed-case relations as implemented in Kurth's KFarey package and Sage's `arithgroup_perm`").

Witness: the relations (B1)–(B7) and (A1)–(A3) as written are the list of Hamilton–Loeffler (hamilton-loeffler line 79–102, printed p.2), reproduced from Hsu Theorem 3.1 with the signed third relation; a package is not a legal source.

Repair: cite Hamilton–Loeffler 2014, Theorem 2 and the displayed list, p.2, for the signed forms, and Hsu 1996, Theorem 3.1, pp.1353–1357, for the projective case; delete the software citation. Note the two source slips recorded below (the `1/5` modulus and the interchanged `L`, `R`).

## R06 (P3) — A backticked name of this roadmap's own that `Suggested.lean` does not declare

Location: `README.md:1216` ("`noncongruenceCurve Γ̄` is the algebraic Belyi pair of the class of `modularTriple Γ̄ e`").

Witness: `grep noncongruenceCurve Suggested.lean` is empty; the README rule makes a backticked own name a claim that the file declares it.

Repair: write the name in prose without backticks (6.3 says nothing is proved here and the algebraic Belyi carrier is not at the pins), as 0.4 does for `psl2Index` and 2.4 for `invariants`.

## Verified sound

### The previous review's findings at this head

| Previous | Passage at this head | Status |
|---|---|---|
| R01 Farey carrier admits infinite index | `README.md:981`–`983` nondegeneracy "at least two entries, or an odd side occurs. Equivalently, `6r + 3e₂ + 4e₃ > 6`"; `Suggested.lean:286` `nondegenerate`; negative Checks at `:998`–`1001` | repaired; equivalence checked below |
| R02 cusp width and scaling | `README.md:566` "whose scaling is the projective image of σ⁻¹"; `:577`–`578` "using the same scaling for both cusp data"; Check `:593` | repaired |
| R03 `PSL₂(ℤ/N)` versus the sign quotient | `README.md:214`–`216` `Q_N = SL₂(ℤ/N)/⟨−I⟩` with the `N = 8` orders 192 and 96; Checks `:700`–`702` | repaired; orders recomputed below |
| R04 algebraic uniformizer | `README.md:1395`–`1399` "`q^(1/w) = κt + O(t²)` … `κʷ ∈ Kˣ`"; Check `:1413` | repaired |
| R05 finiteness of symbols | `README.md:988`–`991` bounds on numerators, denominators and labels; Check `:1002`–`1004` | repaired |
| R06 Scholl's inputs unowned | `README.md:1555`–`1592` four owned construction paragraphs with suppliers ModularCurvesPartII §§14.1–14.4, CrystallineCohomology CR.2.3 and CR.DDR.6.11–6.14, DeligneWeightsAndPurity §6.4 | repaired as a plan; the cited sections exist at the open heads (resolved below) |
| R07 rational denominators supplier | `README.md:297`–`303` AlgebraicModularFormsAndSerreWeights §2.9 with the full namespace | repaired; declaration at `Suggested.lean:52` of that head |
| R08 degree 6–11 labels | `README.md:1196`–`1202` | not repaired: see R01 |
| R09 build gate | `Suggested.lean:1` `module`; gate `build=0` | repaired |
| R10 ModularFormsPartII owner | `README.md:287`–`295` contract W1.2–W1.3, W1.5–W1.6, W1.8, W6.3–W6.5 | repaired; one leftover in §3.1, see R04 |
| R11 native double-coset action | `README.md:1356`–`1358`; `Suggested.lean:450`–`451` use `HeckeRing.GL2.heckeSlashModularFormEnd` | repaired |
| R12 `fullCycleType` | `README.md:551`–`553`; `Suggested.lean:147` | repaired |
| R13 missing headlines | Kulkarni's `group_finiteIndex`, `exists_group_eq`, `group_index` (`Suggested.lean:338`–`347`), odd-weight `finrank_odd`, `finrank_one` (`:394`–`415`), `berger` (`:424`) | repaired; but see R02 for Wohlfahrt |
| R14 padding | 58 declarations, 25 admitted | repaired; one-tactic probe below closes none |
| R15 executable procedures | `README.md:152`–`153`; `hsuTest` is a `Prop` (`Suggested.lean:216`) | repaired |
| R16 locators | `README.md:1055`, `:1095`, `:1138`, `:1148` cite Kurth–Long §3.3 Theorem 3 p.7, §3.1 Theorems 1–2 p.5, §3.4 p.8, §§5.1 and 5.3 | repaired; checked against kurth-long lines 199–203, 330–351, 354–390, 460, 703 |
| R17 shape | `**Summary.**`, `## Exact supplier contracts`, `## How to read the build`, `### Examples`/`### Dependencies` on every layer | repaired |

### Build, gate, dependency check, signatures

- `lake env lean TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean` exits 0 with exactly 25 `declaration uses sorry` warnings and nothing else (3.7 s). The worker's gate at this head has every scanner at zero and `build=0`.
- Dependency check (candidate order, `--movable`, main content): `depcheck: 204 roadmaps, 1545 edges, 0 problem(s)`. No `UPWARD`, `CYCLE` or `moved:` line. The suppliers cited sit above this roadmap in the candidate order: CrystallineCohomology (line 19), ModularCurvesPartII (70), DeligneWeightsAndPurity (75), AlgebraicModularFormsAndSerreWeights (84), PolynomialGaloisGroupsPartII (198), ModularFormsPartII (256), this roadmap (257).
- `#check @name` for all 31 theorems and non-trivial definitions, appended to a scratch copy and elaborated: every type agrees with the worker's `signatures.md` and with the README statement. The one binder the worker flagged as lost, `[Γ.FiniteIndex]` on `cuspExpansion` (`Suggested.lean:359`), is harmless: the definition is `qExpansion` of a translate and needs no finiteness; every theorem about it carries the instance.
- The one-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?` on each admitted statement, scratch copy) closed none of the 25 statements; `hsu` was skipped by the sed rewrite and is visibly not one-tactic.
- Outside-folder diff against `origin/main`: empty.

### Adversarial table

Permutations compose as functions, right to left; `σ0 = permS · permT⁻¹`, `R_H = σ0 · permS`. All rows were recomputed from the README's permutations by a script (worklist in scratch), including monodromy orders by closure and Hsu's relations at the row's level.

| Statement | Instances tried | Values computed, left = right | Result |
|---|---|---|---|
| 1.1 relation `σinf σ1 σ0 = 1`, `permR = permS·permT` | all 18 worked rows | identity on every row; `permR` recomputed equals the listed `permR` on every row | pass |
| 1.1 Γ₀(2) on `ℙ¹(ℤ/2)` | `(0:1),(1:0),(1:1) = 1,2,3` | `σinf = (1 3)`, `σ1 = (1 2)`, `σ0 = (1 3 2)` | pass |
| 1.1 mirror `J = diag(1,−1)` | `S, T, U` | `JSJ = S⁻¹`, `JTJ = T⁻¹`, `JUJ = [[0,1],[−1,−1]] = −R`; mirror triple satisfies the product relation | pass |
| Conventions, opposite reading | BMR entry `15_1_2_1_0_2_a` (bmr-database line 304–306) | `σ_R ∘ σ_S` sends `1 ↦ 3`, `11 ↦ 12`, agreeing with `σ_T`; `σ_S ∘ σ_R` sends `1 ↦ 11 ≠ 3` | pass |
| 2.1–2.3 invariants | 18 rows | `(ε₂, ε₃, widths, g, N)`: full `(1,1,{1},0,1)`; Γ₀(2) `(1,0,{2,1},0,2)`; Γ₀(4) `(0,0,{4,1,1},0,4)`; Γ(2) `(0,0,{2,2,2},0,2)`; Γ₀(11) `(0,0,{11,1},1,11)`; index-7 rows `(3,1,{7},0,7)×2`, `(1,1,{6,1},0,6)×2`, `(1,1,{4,3},0,12)`, `(1,1,{5,2},0,10)`; index-8 rows `(0,2,{7,1},0,7)`, `(2,2,{8},0,8)×4` | pass, all equal the README |
| 2.3 genus formula | same rows | `12g + 3ε₂ + 4ε₃ + 6c = 12 + n`: 13, 15, 18, 18, 24, 19 (×6), 20 (×5) | pass |
| 2.4 mirror pair `{6,1}` | the two rows | relabeling `1↦1, 4↦3, 7↦7, 5↦2, 2↦6, 3↦4, 6↦5` carries `(permS, permT⁻¹)` of the first to the second; no relabeling carries `(permS, permT)` (only one rotation fixes 1 and it sends `(2 3)` to `(7 3)`) | pass |
| 2.5 `Q_N` orders | `N = 1,2,3,4,6,8,10,12` | `|SL₂| = 1,6,24,48,144,384,720,1152`; `Q_N = 1,6,12,24,72,192,360,576`; center sizes 1,1,2,2,2,4,2,4 | pass |
| 3.1 level is `lcm` | widths `{4,3}`, `{1,2}` | `orderOf permT = 12 = lcm(4,3)`; `2 = lcm(1,2)`; `12 > 7` refutes `N ≤ n` | pass |
| 3.1 strict versus signed | `{γ ∈ Γ(2) : a ≡ 1 mod 4}` at cusp 1, `σ = [[1,−1],[1,0]]` | `σT²σ⁻¹ = [[−1,2],[−2,3]] ∉`, `−σT²σ⁻¹ ∈`: strict width 4, signed width 2 | pass |
| 3.3 strict Wohlfahrt | KSV lifts of Γ₀(6) (ksv line 641–649) | `⟨T,−A,B⟩`: strict widths 1, 12, 3, 4, `N_s = 12` = its level 12; `⟨−T,A,B⟩`: strict level 12, noncongruence | consistent with the owned statement; see R02 |
| 3.5 order obstruction | index-7 noncongruence rows | `7 ∤ 72, 360, 576`; `8 ∣ 192` is silent at index 8 | pass |
| 3.5 monodromy orders | all rows | 1, 2, 6, 3, 24, 6, 660, 168, 168, 42, 42, 5040, 5040, 168, 48, 48, 336, 336 | pass, equal the README |
| 4.2 `hsuTest` at the row's level | all rows | `T` on every congruence row (odd branch at 1, 3, 7, 11; 2-power at 2, 4, 8; mixed at 6, 12 for Γ₀(4)-type rows absent); index-7 noncongruence: `FFFFTTF` at 6, 6, 12 and `FFFFTTT` at 10; index-8 noncongruence: `FFT` at 8 | pass; (B1)–(B4) and (A1) are the failing relations as the README says |
| 4.2 odd relator is central, sign matters | `N = 3, 5, 7, 9, 15` | `(R_H² L^{−1/2})³ ≡ −I`; `(R_H² L^{+1/2})³` non-scalar (e.g. `[[0,4],[1,3]]` at 5) | pass |
| 4.2 `L R_H⁻¹ L` | integral | `= [[0,1],[−1,0]] = S⁻¹`, so `(LR_H⁻¹L)² = −I`: HL's third relation reduces to Hsu's projectively | pass |
| 4.2 CRT constants in `hsuTest` | `N = 12`: `e = 4, m = 3` | `c = 4·4⁻¹ mod 3 = 4 ≡ 0 (4), ≡ 1 (3)`; `d = 3·3⁻¹ mod 4 = 9 ≡ 1 (4), ≡ 0 (3)` | pass |
| 4.3 witness | `g = [[73,−32],[16,−7]]` | `det = 1`, `g ≡ I (8)`; the word `T⁴ S T⁻² S T⁻⁵ S T⁻² S T⁻¹ = [[−73,32],[−16,7]] = −g`; on the two noncongruence index-8 rows it sends `1 ↦ 6`, on the two congruence rows `1 ↦ 1` | pass |
| 4.4 modulus `2N_s` | `N_s` odd (Γ₁(5)), `N_s = 2N` (irregular) | `2N_s` is even so the odd branch is never used; `Γ(2N_s) ≤ Γ(N_s)` keeps HL's criterion valid when `N_s = 2N` | pass |
| 5.1 nondegeneracy equivalence | singletons `(even,even)`, `(free,free)`, `(even,odd)`, `(odd,odd)`; `m ≥ 1` | scores 6, 6, 7, 8; with `m ≥ 1` at least three sides, score `≥ 9` | pass: "two entries or an odd side" ⟺ score `> 6` |
| 5.1 degenerate matrices | `(even,even)` at 0; `(free,free)` at 0 | both even matrices `[[0,1],[−1,0]]`; free matrix `−I`, reversed `I` | pass (excluded) |
| 5.2 matrices | `(−1/0, 0/1)` even; `(0/1, 1/0)` odd; Γ₀(2), Γ(2), `{4,3}`, Γ₀(11) pairs | `S⁻¹`; `[[0,1],[−1,1]] = −U`; `−T`, `[[−1,1],[−2,1]]`; `−T²`, `[[−3,2],[−2,1]]`; `[[−4,7],[−3,5]]`, `[[−3,1],[−1,0]]`; `[[−7,2],[−11,3]]`, `[[−8,3],[−11,4]]`; all of determinant 1, traces 0 / 1 as stated; each is the negative of Kurth–Long Theorem 3's matrix (line 330–350) | pass |
| 5.2 free generator parabolic iff adjacent | `(0,1)~(1,2)`; `(0,1)~(2,∞)`; Γ₀(11) pairs | traces `−2`; `−3`; `−4`, `−4`. Proof of the claim: trace `= (ab′ − a′b) + (cd′ − c′d)`, each term `≤ −1`, equality forces Farey-adjacent endpoints, impossible with a vertex strictly between | pass |
| 5.3 index formula | `[0]` even/odd; Γ₀(2); Γ(2); Γ₀(11); `{4,3}` | `7−6 = 1`; `9−6 = 3`; `12−6 = 6`; `18−6 = 12`; `13−6 = 7`; matches Kurth–Long `μ = 3n + e₃` (line 390) | pass |
| 5.4 widths and genus | Γ₀(11) symbol; `{4,3}` symbol | classes `{∞}` width 1 and `{0,1/3,1/2,2/3,1}` width `3+1+3+1+3 = 11`, `g = (3+1−2)/2 = 1`; classes `{∞,0}` width `2+1 = 3`, `{1,2}` width `2+1+1 = 4`, `g = 0`; vertex term `(b_{i−1}+b_{i+1})/b_i` equals Kurth–Long's `|a_{i−1}b_{i+1} − a_{i+1}b_{i−1}|` by the two unimodular relations | pass |
| 7.3 even weight | `SL₂(ℤ)`, `k = 12`, `k = 2`; Γ₀(2), `k = 4` | `M: −11+3+4+6 = 2`, `S: 1`; `k = 2`: `M = g − 1 + ε∞ = 0`; Γ₀(2): `M = −3+1+0+4 = 2` | pass |
| 7.3 odd weight (`finrank_odd`) | Γ₁(3) (`g=0, ε₃=1, r=2, s=0`), Γ₁(4) (`g=0, ε₃=0, r=2, s=1`), `k = 3` | `2M = −4+2+6 = 4`, `2S = 0`; `2M = −4+6+2 = 4`, `2S = 0`; known dimensions 2 and 0 in both cases | pass |
| 7.3 weight one (`finrank_one`) | Γ₁(3), Γ₁(4) | `2(1−0) = 2 = r`; `r = 2 > 2g−2 = −2` forces `S₁ = 0`; Clifford branch gives `4·dim S₁ ≤ 2g+2−r` from `deg = g−1−r/2` | pass |
| 7.3 `regularCuspCount` well defined | `σ' = σ·(±T^j)`, `σ' = γσ` | conjugation by `±T^j` fixes `strictPeriods` and `periods`; `γ ∈ Γ` leaves `σ⁻¹Γσ` unchanged | pass |
| 7.2 `cuspExpansion` carrier | `ModularForm.translate f g : ModularForm (toConjAct g⁻¹ • 𝒢) k` (`Mathlib/NumberTheory/ModularForms/NormTrace.lean:53`) | width taken on the same group `toConjAct (mapGL σ)⁻¹ • Γ_ℝ = σ⁻¹Γσ` | pass |
| 7.4 `berger`, degree count | weight-0 constant `1` | LHS `[Γ : Γ ∩ α⁻¹Γα]/p`, RHS `[Γᶜ : Γ](p+1)/p`: the statement asserts `ΓαΓ = ΓᶜαΓᶜ` as right-coset unions, Berger's theorem as Li–Long report it (li-long line 148–154) | consistent; primary not readable |
| 7.4 Berger, smallest case | index-8 noncongruence, `k = 4` | `Γᶜ = SL₂(ℤ)`, `S₄(SL₂(ℤ)) = 0`, `dim S₄(Γ) = 2`; good primes `p ∤ 8` | pass |
| 8.1 bounded denominators | `Δ/11`; zero form; constant `α ∈ K` | `D = 11` clears `1/11, −24/11`; `D = 1`; `D` the denominator of `α`, `D = 0` excluded by `D ≠ 0` | pass |
| 8.2 CDT transport | width-2 cusp, width-6 expansion | `a₁, a₂` at exponents 3, 6 and zeros elsewhere; boundedness unchanged | pass |
| 8.3 `d = 1`, `d = 0` | `Δ`, `p = 2`, `A₂ = −24`, `ε₂ = 1`; zero space | `−24 − (−24)·1 + 2048·0 = 0`; polynomial 1, all `a_m = 0` | pass |
| 8.4 dimensions | index-7 noncongruence; index-8 level 8 | `S₄: −3+1+1+2 = 1`; `S₄: −3+2+2+1 = 2`, `M₄ = 3`, `M₂ = 0`; index-7 `M₂ = 1`, `S₆ = −5+1+2+4 = 2` | pass |
| 8.4 rationality | `{4,3}`, `{5,2}` | unique in their passport, automorphism group of prime index non-normal is trivial, cusps of distinct widths are fixed by Galois; `{6,1}` mirror pair is non-conjugate | pass |
| 0.1 identities | `S, T, R, U` | `S² = −I`, `U³ = I`, `TSU = −I`, `SR⁻¹S⁻¹ = −U`, `RU⁻¹ = ST²S⁻¹`, `S⁻¹T⁻¹S = [[1,0],[1,1]] = R_H`, `US = −R_H` | pass |
| 0.3 ping-pong | `q > 0`, `q < 0` | `S̄q = −1/q` changes sign; `R̄q = −1/(q+1) ∈ (−1,0)`, `R̄²q = −(q+1)/q < −1` for `q > 0` | pass |
| 1.3 counts | `n = 1..8` | conjugacy classes 1,1,2,2,1,8,6,7 and noncongruence 0,0,0,0,0,0,4,2 agree with the worked rows (index 7: 2 congruence, 4 not; index 8: 5 and 2) | pass |

### Seeded source audit

| Target | Text and locator opened | Outcome |
|---|---|---|
| 1.1 | bmr-computation line 209–219 (Definition 2.5–2.6, Theorem 2.7, p.4; right cosets, `σ_T = σ_Sσ_R` composed left to right, Example 2.8 verified: `(1 2 3 5 4)(6)`); bmr-database line 301–306 (entry `15_1_2_1_0_2_a`); kurth-long line 391–458 (§4, left cosets, cusp width as cycle length, p.8–9) | supported; Millington primary not readable |
| 2.5 | formulas checked by enumeration (`Q_N`, `|SL₂(ℤ/N)|`) and on `ℙ¹(ℤ/2)`; Diamond–Shurman §3.8 not readable; library claims wrong, see R03 | statement sound, locator uncertified |
| 3.1 | ksv line 169–195 (general level by signed widths, Lemma 7, p.4–5); hamilton-loeffler line 21–24 (level `d` or `2d`) | supported |
| 3.4 | own definition; KSV Proposition 3 gives `Δ ⊇ Γ(N_s(Δ))`, so the closure is `Γ ⊔ Γ(N_s(Γ))` | supported by 3.3 |
| 5.2 | kurth-long line 330–351 (Theorem 3, §3.3, p.7): matrices are the negatives of the README's | supported |
| 5.3 | kurth-long line 199–206 (Theorems 1–2, §3.1, p.5), line 282–299 (Definition 4, polygon from a symbol, p.7) | supported; Kulkarni primary not readable; Definition 4's gap recorded below |
| 5.4 | kurth-long line 354–390 (§3.4, p.8) | supported |
| 5.5 | kurth-long line 460–630 (§5.1, pp.9–12), line 703–720 (§5.3, p.14) | supported |
| 6.1 | FuchsianOrbifolds Layer 0 item 5 (free locus, covering), Layer 2 item 1 (covolume), main `TauCetiRoadmap/FuchsianOrbifolds/README.md:207`–`212`, `:237`–`241`; `Completed/UniversalCovers/README.md:98`–`124` (Stage 2 items 7–8) | supported |
| 7.1 | `TauCeti/NumberTheory/ModularForms/SturmBound.lean:87`–`99` (`(k·Γ.index).toNat/12` against the order of `qExpansion strictWidthInfty`); `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:147` (`eq_zero_of_neg_one_mem` takes `−1 ∈ 𝒢`); `Cusps/Basic.lean:143` (`integerCuspWidth`) | supported |
| 7.5 | bmr-database line 74–86 ((2.4)–(2.5), `a_n = u^n b_n`, p.2); Scholl not readable | the `u^m b_m` presentation supported; model theorem uncertified |
| 8.1 | AlgebraicModularFormsAndSerreWeights at its head, `README.md:413`–`432` (§2.9) and `Suggested.lean:52`–`61` (`boundedDenominators`: `Γ(N) ≤ Γ`, width-`N` rational expansion, one `D > 0`) | supported |
| 8.2 | cdt line 59–71 (Theorem 1.0.1, p.2, with `q = exp(πiτ)`), line 2350 (Remark 6.3.1) | supported |
| 8.3 | li-long line 164–199 (§2, p.5: Scholl's hypothesis, (2.3), (2.4), `p > k−2`); li-long-yang line 75–91 (Theorem 1.1, p.2) and line 556–623 (§5, Proposition 5.1, pp.11–13: the quadratic twist between the two realizations) | supported as a plan; Scholl §5 not readable |
| 8.4 | own computation (table above) | supported |

Also opened: hsu line 100–109 (Theorem 2.4, p.1353: congruence iff the induced representation respects a presentation of `SL₂(ℤ/N)/{±I}` on `L, R`), line 36–46 (`L = [[1,1],[0,1]]`, `R = [[1,0],[1,1]]`), line 303–343 (proof of Theorem 3.1, pp.1356–1357). hamilton-loeffler line 59–102 (Proposition 3 and the signed list). ksv line 533–649 (Example 18). The Hsu text used is a cached copy from a third-party course page; it was read for corroboration and the primary is listed as not certified below.

### Suppliers and pins resolved

- ModularFormsPartII: board design `packages/ModularFormsPartII/design/README.md` (plan status `complete`), listed in the candidate merge order at line 256 and in the eligible-supplier list of this job. W1.1 (`:178`), W1.2 (`:200`), W1.3 (`:242`), W1.5 (`:301`), W1.6 (`:320`), W1.8 (`:358`), W6.3 (`:986`), W6.4 (`:1005`), W6.5 (`:1024`) exist and state what the README's contract says. The citations tool's "found nowhere" lead for W1.3 is explained by this: the supplier is a design, not a folder on main or in a pull request; the README says so (`:292`).
- AlgebraicModularFormsAndSerreWeights (#928 head): §2.9 and `KatzModularForms.boundedDenominators` resolve.
- ModularCurvesPartII (#913 head): §§14.1–14.4 (`README.md:3499`–`3600`) resolve; 14.1 coefficient systems, 14.2 parabolic cohomology as the image of compact support, 14.3 boundary sequence, 14.4 Artin comparison.
- CrystallineCohomology (#857 head): CR.2.3 (`:2451`), CR.DDR.6.11–6.14 (`:9635`–`9800`) resolve.
- DeligneWeightsAndPurity (#929 head): §6.4 (`:2071`) resolves and states purity of `H¹(C, j_*ℱ)`, identified with the parabolic image.
- FuchsianOrbifolds on main: Layer 0 items 4–5, Layer 2 items 1 and 3, Layer 3 items 2 and 4, Layer 4 item 4, Layer 5 items 1, 3, 5, 6, Layer 6 item 4 (`README.md:193`–`363`) resolve to the items cited.
- ModularForms on main: Layer 1 (`:327`, projective-index remark at `:366`–`371`), Layer 2 (`:383`), Layer 3 Petersson for every finite-index subgroup (`:481`–`490`), Layer 8 `CoefficientField` (`:149`, `:764`), Layer 10B (`:1068`), 10C (`:1119`) resolve.
- BelyiMaps on main: 2.5 (`:961`), 4.1–4.2, 4.6, 5.x, 6.x, 8.4 (`:2691`), 8.6 (`:2767`), 9.1 (`:2847`), 9.5 (`:3122`), 10.7 (`:3508`), 11.3 (`:3616`), 11.5 (`:3681`), 11.6 (`:3701`) resolve; `:54`–`90` retains Layers 8–11 as specifications for the named successors.
- PolynomialGaloisGroups (Completed): Layer 0 `fullCycleType` (`:442`), Layer 6 labels for `n ≤ 5` (`:1172`). FreeGroupsAndLimitGroups §4.11 (`:1013`). UniversalCovers Stage 2 (`:98`).
- Tau Ceti modules named in the supplier table: all 26 module paths exist at the pin; all 60 declaration names grepped exist, except `Gamma0Projective_index` (R03). Mathlib names: all exist except `index_normalCore` (R03). Opened at the pin: `fullCycleType` (`Partition.lean:96`, `cycleType` plus one part per fixed point), `orbitCount` (`OrbitCount/Basic.lean:92`), `PermutationTriple.Equivalent`, `monodromyGroup`, `IsConnected` (`n ≠ 0` and pretransitive), `automorphismGroup` (stabilizer of the triple; `Basic.lean:288`, `:347`, `:427`, `:482`), `genus` (`EulerCharacteristic.lean:204`, `((2 − χ)/2).toNat`), `TriangleGroup.lift` (`Basic.lean:179`, relation `r·q·p = 1`), `Equiv.permutationRepresentation` (`PermutationRepresentation.lean:71`), `HeckeRing.GL2.heckeSlashModularFormEnd` with its `variable` block (`HeckeSlash/ModularForm.lean:84`–`135`: arithmetic image, finite `DecompQuotient`, positive determinant representative), `HeckeCoset` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:157`), `CuspOrbits` and `cosetToCuspOrbit ⟦g⟧ = [g⁻¹ • ∞]` (`Mathlib/NumberTheory/ModularForms/Cusps.lean:166`–`180`), `strictPeriods`, `IsRegularAtInfty` (`:223`, `:242`), `strictWidthInfty` (`:317`), `rank_two_simple` (`Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean:135`, needs `4 ≤ Nat.card F`), `FreeGroupBasis` (`Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean:68`), `lift_injective_of_ping_pong` (`Mathlib/GroupTheory/CoprodI.lean`).
- Ownership by object: the permutation-triple, cycle-partition, Fuchsian, compactification, Hecke-slash and Belyi carriers are consumed from their owners; the objects new here (modular triple of a subgroup, Hsu's relation predicate, Farey symbols and their generated subgroup, cusp expansions and dimension formulas at finite index, denominator transport, ASD) were searched by object in the sibling checkouts listed in the brief and on main; no second owner was found. Ownership against open pull requests not listed in the brief was not checked.

### Headline coverage

| README headline | `Suggested.lean` |
|---|---|
| triangle presentation and freeness (0.3) | `modularHom_bijective`, `exists_freeGroupBasis_of_torsionFree` |
| Millington (1.2) | `millington`, `exists_modularTriple_equivalent`, `card_subgroups_of_class` |
| cusp and genus dictionary (2.1–2.3) | `period_permT_coset`, `cuspCount_eq_card_cuspOrbits`, `genus_formula`, `index_Gamma_map_toPSL` |
| Wohlfahrt (3.3) | signed form imported from ModularFormsPartII W1.8; strict form missing: R02 |
| obstructions (3.5) | `compositionFactor_of_isCongruenceSubgroup` |
| Hsu and Hamilton–Loeffler (4.2, 4.4) | `hsu`, `hsu_strict` |
| Kulkarni (5.3) | `group_finiteIndex`, `exists_group_eq`, `group_index`; polygon presentation named as not statable |
| Belyi identification and descent (6.2–6.3) | named as not statable (analytic/algebraic Belyi pair carrier) |
| expansions, dimensions, coefficients (7.2, 7.3, 7.5) | `cuspExpansion`, `finrank_*`, `finrank_odd`, `finrank_one`, `exists_basis_coeff_mem_numberField` |
| Berger (7.4) | `berger` |
| denominators (8.1, 8.2) | `exists_bounded_denominators_numberField`, `unbounded_denominators`, `_numberField` |
| Scholl's congruences (8.3) | named as not statable (arithmetic model, parabolic cohomology, integral comparison) |
| label prefix (9.1) | prose only, which is right: it is bookkeeping |

## Not verifiable

Nine texts were read as legal open-repository copies through the sources service (kurth-long, ksv, hamilton-loeffler, li-long, li-long-yang, cdt, bmr-database, bmr-computation) plus the Hsu copy noted above. The remaining cited works could not be read legally this round; the service recorded each in the job's `needs-references.toml` with where it looked. No statement was treated as verified on their authority; what the table above marks "pass" was checked by computation or against a readable text.

- **hsu** (Proc. AMS 1996): the AMS landing page is on a host in no licence class; a cached copy from a third-party course page was read for corroboration only (Theorems 2.4 and 3.1 agree with the README), the primary is not certified.
- **wohlfahrt** (Illinois J. Math. 1964): the Project Euclid page exposes no PDF link; read through Kiming–Schütt–Verrill §3 instead.
- **millington** (J. London Math. Soc. 1969): Wiley returns HTTP 403; Theorem 2 is cited through bmr-computation Theorem 2.7 and kurth-long §4.
- **scholl** (Invent. Math. 1985): paywalled publisher; §§1–2 and §5 not read; the statements of 7.5 and 8.3 were checked against Li–Long §2 and Li–Long–Yang Theorem 1.1 only.
- **kulkarni** (Amer. J. Math. 1991): JSTOR landing page only; Theorems 3.2–3.3 and 6.1 read through Kurth–Long Theorems 1–3.
- **berger** (C. R. Acad. Sci. 1994), **atkin-swinnerton-dyer** (PSPUM 19), **long** (2008), **jones** (1986): no legal text found; Berger's factorization checked only for internal consistency (degree count, smallest case) and against Li–Long's report.
- **diamond-shurman**, **shimura**, **serre**, **alperin**, **girondo-gonzalez**, **katok**: books or paywalled articles; the facts cited from them (genus formula, `Γ₀(N)` counts, dimension formulas, free-product presentation, ping-pong) were checked by computation or against ModularForms Layer 10C and the pinned Mathlib instead.

## Source issues

- **Gap** in kurth-long at Definition 4 and the construction after it, §3.2, arXiv:0710.1835v1 p.7 (line 282–299): the source says any generalized Farey sequence with pairing data gives a special polygon; it should exclude the singleton data with two non-odd sides, whose two sides are one geodesic; affects a stated result.
- **Misprint** in kurth-long at §3.4, arXiv:0710.1835v1 p.8 (line 372–373): the source says the width of `x_i` is the width of `γP` at `∞` where `γ⁻¹` sends `x_i` to `∞`; it should be `γ⁻¹P`; affects the proof.
- **Misprint** in hamilton-loeffler at the mixed-modulus list, arXiv:1307.0625v1 p.2 (line 93–94): the source says `1/5` in `s = l^{20} r^{1/5} l^{−4} r^{−1}` is read modulo `m`; it should be modulo `e`, the 2-power part, since `l` and `r` have order dividing `e`; affects a stated result.
- **Misprint** in hamilton-loeffler at the displayed generators, arXiv:1307.0625v1 p.1 (line 36–45): the source says `L` is the lower unitriangular and `R` the upper unitriangular matrix; it should be the reverse, Hsu's (1.4), whose relations the paper reproduces; affects nothing, since conjugation by the antidiagonal matrix interchanges them.
- **Misprint** in bmr-computation at Theorem 2.7, arXiv:2207.13365v1 p.4 (line 216–217): the source says the number of cusps is the number of elements fixed by `σ_T`; it should be the number of cycles of `σ_T`, fixed points included; affects a stated result.
- **Error** in ksv at Example 18, arXiv:0905.4798v4 p.11 (line 636–637): the source says the four lifts `⟨A,B,C⟩, ⟨A,−B,C⟩, ⟨−A,B,−C⟩, ⟨−A,−B,−C⟩` contain `Γ(12)`; it should list the lifts with equal signs on `B` and `C` and either sign on `A`, as the vector `(0,1,1)` and the table on the same page require; affects a stated result.
