<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6905151716 -->
Review (claude) of 45a209c

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.13 uses a weight-one correlator with equal arguments, which §3.8 excludes

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:501` (§3.8): "points `b₀,…,b_m ∈ ℙ¹(F)` different from `a` (repetitions allowed for `m > 1`; `b₀ ≠ b₁` when `m = 1`)"; `README.md:586` (§3.13, Checks): "the two with the pure factor `Cor_∞(0,0) = u(0) = 0`" and "four the factor `Cor_∞(0,0)`".

   **Claim.** §3.8 defines `Cor_{a,v}(b₀,b₁)` only for `b₀ ≠ b₁` and asks for the cut formula (66) on words with repeated letters; §3.13 evaluates that formula with a factor `Cor_∞(0,0)`.

   **Witness.** The word `(0,0,1,y)`, allowed by §3.8 (`m = 3`), has eight cuts; two of them carry the weight-one factor on the letters `(0,0)`, an input §3.8 puts outside the domain. So (66), as a target of §3.8, has terms the section does not define, and the Check of §3.13 assigns one of them a value.

   **Exact repair.** In §3.8, after the sentence ending "…(Goncharov–Rudenko [GR], §2, items 2–5, (62)–(68), Theorem 2.2 and Definition 2.3, pp. 26–29; §1.2, item 5, pp. 14–15).", insert:

   > In the cut formula a weight-one factor on two equal letters is the image of the pure word `⟨X_b,X_b⟩`, which is zero in `CLie_S` (§3.4); it is written `Cor_a(b,b) = 0`, and for `a = ∞` this is the convention `u(0) = 0`. No correlator of weight one with equal arguments occurs otherwise: its Hodge correlator `(2πi)^{−1}log|z₀ − z₁|` has no value on the diagonal (§3.10).

   and add to the second Check of §3.8 ("Repeated arguments are allowed in weight `m > 1`; …") the clause "; in a cut, a factor on two equal letters is zero, as for `(0,0,1,y)` in §3.13".

   **Tested on the instance.** With the inserted convention the eight cuts of `(0,0,1,y)` are: 4 with `⟨0,0,1⟩` or `⟨y,0,0⟩` (first shuffle), 2 with `⟨0,0⟩ = 0` (pure word), 1 with `⟨0,1⟩ = u(−1) = 0`, and the survivor `Cor_∞(0,1,y)∧u(y) = δS₃(y)`: the value §3.13 states, now on defined terms. §3.11's `Cor_b(a,…,a)` (`README.md:555`) has `ℓ ≥ 3` letters and is already inside the domain.

One finding, P3, none blocking. The three findings of round 9 are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, has no padding and states both headline theorems; it needs no change.

## Verified sound

### The findings of the previous review

| Previous finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2), §5.8 correcting cochain | `README.md:942`–`:950`: "Let `h` be the `L₄(F)`-valued cochain on the seven-vector rows … `h = −(3/28)·Alt₇ D₃₁(r(1\|2,5,6,7), r(2\|1,3,4,5))` on `C₇(3)`, `h = −(1/84)·Alt₇ D₃₁(r(1,2,3,4), r(1,5,6,7))` on `C₇(2)` … Put `f′ = f − (δ∘h + h∘D)`"; Checks at `:960`–`:963` | repaired |
| F02 (P3), four sections without API lists | `README.md:449` (§3.5) "The special derivations have the following API."; `:842` (§5.4) "The current regulator has the following API."; `:886` (§5.6) "The map has the following API."; `:952` (§5.8) "The cocycle has the following API." | repaired |
| F03 (P3), page of (19) | `README.md:173`: "(29), p. 12, GR line 494; the further specialization of (29) to the relations (19) of p. 9, GR line 336, is stated on p. 12, GR line 504" | repaired |

No finding of the repair report was marked not actionable. The repaired patterns were looked for in the rest: a correction that covers one of several components (§6.1 "change only the components in degrees one and two", Layer 4 Dependencies, Layer 5 Examples, Worked examples: consistent with the new `h`); definition sections without an API sentence (16 remain, counted by script, all theorem targets or, for §§3.13 and 5.7, numbered property lists); equation pages (the equation and theorem numbers of GR that the README cites were located with their pages by script; those of the sample are listed below, and no further slip was found).

### Adversarial table

Fresh rows: the passages the repairs changed, the 15 sampled targets, the headlines and the target of R01. For unchanged text outside the sample the computed rows of rounds 6 to 9 stand.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §5.8 rows of the dual complex (changed) | `m = 5,…,9`, rows `q ≤ m−4` | `C₈(4)`: `D = p` only; `C₈(3)`: `∂ → C₇(3)`, `p → C₇(2)`; `C₈(2)`: `∂ → C₇(2)`, `p → C₇(1)`; `C₇(3)`: `∂` target `C₆(3)` killed | the seven identities of §4.8 are exactly the chain-map conditions |
| §5.8 `f′` components (changed) | degrees 1 to 4 | degree 2: `R₇³ − δh`, `R₇² − δh`, `0`; degree 1: `𝓛₄R₈⁴ − hp`, `−h(∂+p)`, `−h∂`, `0` on `C₈(1)`; degrees 3, 4: `h = 0` on `C₆`, `C₅`; `m = 9`: `hD = 0` | as stated; `f′D = fD − δhD`, `δf′ = δf − δhD` |
| §5.8 `δ₂₂h` (changed) | coefficients against §4.6 | `−3/28` and `−3/28`; `−1/84` and `−1/84`; coefficient `1` leaves `−31/28` | cancels both rows |
| §5.8 rule `(Alt₇g)∘p = −Alt₈g(8\|·)` (changed) | vector `j` (one-based) in the last slot | sign `(−1)^{8−j} = (−1)^j`, zero-based `(−1)^{i+1}` | `hp = +(3/28)Alt₈D₃₁`, `δ₂₂(𝓛₄R₈⁴ − hp) = (3/28 − 3/28)Alt₈ = 0` |
| §5.8 Gale labels (changed) | `(I\|B)`, `B` the `4×4` Pascal matrix, dual `(−Bᵀ\|I)`, exact rationals | 70 + 70 minors nonzero; `r(8,1\|2,5,6,7)` dual `2`, `r(3,4\|2,5,6,7)` original `2`, same labels on original `3/2`; `r(8,2\|1,3,4,5)` dual `9`, `r(6,7\|1,3,4,5)` original `9`, same labels `19` | as stated |
| §5.8 rows reached (changed) | `N = 4, 5, 6`, `t_a` in dimension `N − \|a\|` | dimensions `4`; `4, 5`; `4, 5, 6`, dual rows `C₇(3)`; `C₇(3), C₇(2)`; `+ C₇(1)` | `C₇(2)` needed for `N ≥ 5` |
| §5.9 Lemma 9.6 with table (26) | residue of `δD₃₁(x,y)` at `x = 0` and at `y = 0`, other argument a unit | `x = 0`: `(+1)(−S₃(y₀)) + 0 + 0 − (−1)S₃(y₀) = 0`; `y = 0`: `(−1)(−S₃(x₀)) + 0 + (−1)S₃(x₀) + 0 = 0` | zero; with the weight-four sign in `D₂₁` the first is `2S₃(y₀)` |
| §3.5 API (changed) | commutator; `n = 2, 3` punctures besides `a` | `[[X,u],u′] − [[X,u′],u] = [X,[u,u′]]`; weight one: `n² − n − n(n−1)/2 = n(n−1)/2` both sides; weight two: `n = 2`: `0` and `0`; `n = 3`: kernel of `V⊗L₂ → L₃` is `9 − 8 = 1`, `CLie` has `⟨123⟩ = −⟨132⟩`, rank `1` | dual ranks agree |
| §5.4 API (changed) | `n = 2`; `t∧u`; `[x]₃⊗t` | `dω₂ = −(1/2)π₂(dlog t∧dlog u)`; `d(∂log\|t\|) = πi·δ`, `d(d^C log\|t\|) = 2πi·δ`; boundary `πi·log\|u\|·δ`; `(2/5)(5/6)L₃*·2πi = (2/3)πi·L₃* = −πi·R(S₃)` | constant `πi` |
| §1.1 | `Z(0,…,5)`; `s(∞,1,0,x)`, `s(∞,0,1,x)` | `1/5`; `x`; `1−x` | sound |
| §1.5 | `D₂₁(2,3)`; nine order cases of (29) against table (26) | `[1/2]+[2/3]+[3/2]+[2]−[4/3]−[1]`; `a>0=b`: `−[v₀]`; `a=b<0`: `2[v₀/u₀]`; `a=b>0`: `[v₀/u₀] − [u₀/v₀] = 0`; `a>b>0`, `a<0=b`, `a<0<b`, `a<b<0`, `a>0>b`: `0` | table compatible in every case |
| §2.1 | `K₀`–`K₃` | `1`; `2` vertices, `1` edge; `5, 5`; `14 − 21 + 9 − 1 = 1` | sound |
| §2.2 flip identity | vectors `(1,0),(3,1),(2,5),(−1,7)` and `(2,1),(1,4),(−3,5),(−6,1)` in `ℚ²`, in `Λ²U(ℚ)` by prime exponents | `X = 19/91`: 11 nonzero coefficients, equal on both sides; `X = 189/136`: 12, equal (for example `2∧3`: `−9`, `−9`); README example `X = 6`: `7∧6` | exact; transposition gives `−W` |
| §3.1 | formula against GR (38); `(2,2)` cuts of `(0,0,x,1,y)` | five terms agree with GR line 573; cuts `i = 1,…,5`: only `⟨0,x,1⟩∧⟨1,y,0⟩ = −[x]₂∧[y]₂` survives | `+[x]₂∧[y]₂` under the Conventions |
| §3.8 | cuts of `(0,1,y)`; (67) | `u(−1)∧u(1−y) + u(1−y)∧u(y) + u(y)∧u(−1) = (1−y)∧y`; `s(∞,0,1,y) = 1−y`, `−[1−y]₂ = [y]₂` | sound; R01 for equal letters |
| §3.10 | `m = 1`; three colliding points | `(2πi)⁻¹log\|z₀−z₁\|` continuous off the diagonal; `L₂((a−c)/(b−c))` depends on direction | sound |
| §3.11 | `ℓ = 3`, `b = ∞`, `a = 0.3+1.1i`, `x = (1.2−0.4i, −0.7+0.9i, 2.1+0.6i)`, Bloch–Wigner periods | left `0.5881058443068864`, right (four terms) `0.5881058443068874`; `Cor_b(a,a,x₃)`: `2⟨X_x,X_a,X_a⟩ = 0` | identity holds; `\|I\| ≥ 2` terms vanish |
| §3.12 | `ℓ = 3, 4, 5` | `ℓ = 3`: `Cor_∞(0,1,y) = [y]₂`, no repeat; `ℓ = 4`: cyclic shift odd; `ℓ = 5`: shuffle of `(0)` with `(x,1,y)` gives `⟨0,x,0,1,y⟩ + ⟨0,x,1,0,y⟩ = −2⟨0,0,x,1,y⟩` | threshold `ℓ > 3` right |
| §3.13 double symbol | word `(0,x,1,y)` | units `(1−y)/y`, `y/x`, `x/(1−x)`, `(1−x)/(1−y)`; classes `−[x]₂`, `−[(1−y)/(1−x)]₂`, `[y]₂`, `[y/x]₂`; sum is `−δD₂₁(x,y)` term by term | `D₂₁ ↦ −Cor_∞(0,x,1,y)` |
| §5.1 weights (used by §5.4) | `n = 4`, types of 1-, 2-, 3-forms | `binom(5,2) = 10`; `4, 6, 4`; `1, 3, 3, 1`; `(5/24)(A−M) + (1/24)(A+M) = A/4 − M/6`; `8·(1/20) = 2/5`, `−4·(1/6) = −2/3` | sound |
| §5.7 | cited rows of round 9 (moment curve, 720 and 144 permutations) | not recomputed; text unchanged | stands |
| §5.10 | `U(3)`; class `ε₄` | primitive degrees `1, 3, 5`, so degree 7 restricts to zero; BorelRegulators line 257: `(2πi)ⁿ` twisted, `1` rational | sound |
| §6.2 exponent | `d = r₂`, `N = r₁ + 2r₂` | `3r₂ + r₂ − 4N = −4(r₁+r₂)` | cancelled by `π^{4(r₁+r₂)}` |
| `zagier_four_exists` | `ℚ`; `ℚ(i)` with `[i]` | `π⁴/ζ(4) = 89.99999999999999`; `π⁴β(4)/2 = 48.16609493406502`, `45ζ(4)β(4) = 48.16609493406503` | `q = 90`, `45` |
| `zagier_four_everyFamily` | zero column; `[i] + [−i]`; conjugate embedding | `0`; `β(4) − β(4) = 0`; row negated | `q = 0`, `0`, `−q` |
| `singleValued 4 2` | lower boundary values, `L = log 2` | `−πL³/6 + πL³/2 − πL³/3 = 0` | matches the Check |
| `zagierDeterminantFour` against Polylogarithms `normalizedPeriod` | `n = 4`, `ι` the complex places | `π^{4(N − r₂)} = π^{4(r₁+r₂)}` | same normalization |

### Sources: the seeded sample

All seven texts were read from the cache; the author flagged no locator as unverified. Every sampled locator is on the stated page and supports the statement.

- **1.1**: (3), p. 4; (23)–(25), p. 10; (34), p. 13 (round 9 lines, text unchanged).
- **1.5**: (29), GR line 494, (30), line 499, (31), line 502, all p. 12; Lemma 5.1, line 2391, (106), line 2394, (109), line 2419, Lemma 5.2, line 2421, all p. 54. The inverse formula agrees with (29) term by term.
- **2.1**: Theorem 3.8, GR line 1749, p. 39; Proposition 3.9, line 1760, p. 40; (85), line 2044, p. 46.
- **2.2**: (49), GR line 814, p. 19; (55), line 869, p. 20; (74)–(75), lines 1617–1619, p. 36.
- **3.1**: (37), GR line 563, p. 13; (38), lines 573–575, p. 14; Proposition 5.5, line 2555, p. 56; Theorem 1.14, line 676, p. 16.
- **3.8**: item 2, GR line 1122, p. 26; (62), line 1157, and Theorem 2.2, line 1196, p. 27; (64)–(66), lines 1205–1217, p. 28; (67), line 1251, Definition 2.3 and (68), lines 1266–1272, p. 29; §1.2 item 5, line 617, p. 14. The signs of the README differ from Definition 2.3 on purpose and are recomputed above.
- **3.10**: M20 Theorem 11, line 899, p. 18; Lemma 29, line 2378, and the closing corollary, lines 2430–2433, printed pp. 44–45 (PDF pp. 64–65: twenty figure pages precede).
- **3.11**: Theorem 2.6 with (70), GR lines 1390–1397, (71)–(72), lines 1413–1416, p. 32; Lemma 2.7, line 1438, Lemma 2.8 with (73), lines 1445–1447, p. 33. The source's `m > 2` is the README's `ℓ ≥ 3`.
- **3.12**: Proposition 2.9, GR line 1456, footnote 12, line 1469, p. 33; the odd case, lines 1472–1485, and Corollary 2.10, line 1486, p. 34.
- **3.13**: GR line 3554 and item 3, line 3560, with (189)–(190), lines 3572–3588, p. 77; Theorem 1.13, line 660, p. 15; Theorem 2.4, line 1282, p. 29; Proposition 2.5, line 1299, p. 30; §5.3, line 2585, p. 56; G08 Theorem 1.12, line 796, p. 19; Theorem 9.1, line 3781, p. 86.
- **5.4**: Proposition 8.4, GR line 3610, p. 78; Lemma 8.5, line 3671, p. 79; Theorem 8.6 and (205), lines 3700–3708, p. 80; Theorem 8.11 with (216), lines 3836–3838, p. 83; (218), line 3868, and Proposition 8.12, line 3881, p. 84; Lemma 8.13, line 3892, p. 85.
- **5.7**: G09 Theorem 3.4, Definition 4.1, Theorems 4.2–4.3; GR lines 4236–4249, p. 93; CGR Theorem 9, line 440 (round 9 lines, text unchanged).
- **5.8**: (224), GR line 3951, p. 86; (228), line 3980, p. 87; lines 4244–4249 and Lemma 9.6, line 4251, p. 93; Theorem 1.14, line 676, and Corollary 1.15, line 701, p. 16. The printed element at line 4247 has no coefficient, as the README says.
- **5.10**: Theorem 9.1, GR line 3988, p. 87; the Milnor-column item, line 4029, p. 88; §9.3 items 3–5, lines 4271–4293, p. 94; G93 (4.13)–(4.14), lines 852–855, scan p. 23.
- **6.4**: Theorem 1.2, GR lines 196–200, p. 5; §9.3 item 4, line 4292, p. 94.

### Lean form, headlines and padding

- **Elaboration.** `lake env lean` on `packages/ZagierConjecturePolylogarithms/Suggested.lean`, run from the content checkout: exit 0, two warnings, both `declaration uses sorry` (124:8, 133:8).
- **Form.** `import Mathlib` only; one module docstring in the required form; namespace `TauCetiRoadmap.ZagierConjecturePolylogarithms`; one layer comment; a docstring on each of the ten declarations; no `set_option`, `lemma`, `#eval`, `#print`, `#synth`, `example` or sorry'd data.
- **One-tactic probe, both sorried theorems.** Twelve tactics on each, on scratch copies: `rfl`, `simp`, `infer_instance`, `exact ⟨0, by simp⟩`, `aesop`, `simp [zagierDeterminantFour, periodMatrixFour, IsCycle4]`, a zero-family witness closed by `simp`, `exact ⟨0, by simp [zagierDeterminantFour, periodMatrixFour]⟩`, `trivial`, `decide`, `norm_num`, `exact ⟨_, rfl⟩`: 24 probes, 24 errors. No padding.
- **`#check @name`** for all ten declarations in one scratch file: `[Field F]` on `unitVector`, `trilogCyclic`, `TrilogRelationFunction`, `IsCycle4`; `[AddCommGroup V] [Module ℚ V]` on `TrilogRelationFunction`; `[Field F] [NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems; the hypothesis `∀ j, IsCycle4 (c j)` on `zagier_four_everyFamily`. No binder lost; each equals README §6.4. Nothing changed.
- **Headlines.** The Summary names `zagier_four_exists` and `zagier_four_everyFamily`; both are stated. The five groups of results that are not statable are named in the module docstring with the missing carriers.
- **Names.** The ten backticked names the README attributes to this roadmap are the ten declarations (extracted by script). Polylogarithms' `Suggested.lean` at its head declares `polylog`, `singleValued`, `unitVector`, `trilogCyclic`, `TrilogRelationFunction` in `TauCetiRoadmap.Polylogarithms`, with the same bodies as here for the last three; PolylogarithmFunctions on main declares `polylog` on `ℤ` and `singleValued` in its own namespace. No fully qualified name is shared.

### Pinned declarations opened

Mathlib: `Finsupp.linearCombination` (`LinearAlgebra/Finsupp/LinearCombination.lean:54`), `Submodule.mkQ` (`LinearAlgebra/Quotient/Defs.lean:227`), `TensorProduct.lift` (`LinearAlgebra/TensorProduct/Basic.lean:122`), `exteriorPower` (`LinearAlgebra/ExteriorAlgebra/Basic.lean:79`), `exteriorPower.ιMulti` (`LinearAlgebra/ExteriorPower/Basic.lean:56`), `Matrix.det_isEmpty`, `Matrix.det_mul` (`LinearAlgebra/Matrix/Determinant/Basic.lean:97`, `:141`), `FreeLieAlgebra` (`Algebra/Lie/Free.lean`), `LieDerivation` (`Algebra/Lie/Derivation/Basic.lean:43`), `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`), `ProjectiveResolution` (`CategoryTheory/Preadditive/Projective/Resolution.lean:41`), its `lift` between two projective resolutions (`CategoryTheory/Abelian/Projective/Resolution.lean:92`), `NumberField.dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:50`), `InfinitePlace.embedding`, `IsComplex` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:188`), `bernoulli_one` (`NumberTheory/Bernoulli.lean:207`, value `−1/2`).

Tau Ceti: `MixedHodgeStructure` (`Geometry/Hodge/Mixed/Basic.lean:72`), `MixedHodgeStructureCat` (`Mixed/Category.lean:56`), the instance `abelian` (`Mixed/Abelian.lean:33`), `MixedHodgeStructure.Hom.range_inf_F_eq_map_F` (`Mixed/Strictness.lean:110`), `tate` (`Tate/Basic.lean:93`), all in the namespace `TauCeti.Hodge`.

By object: a search of the pinned Mathlib and Tau Ceti for polylogarithm, dilogarithm, Bloch–Wigner and pre-Bloch finds one Mathlib file (`Analysis/SpecialFunctions/Integrals/Log.lean`, a docstring mention). Nothing to cite instead of a target.

### Suppliers, gaps and order

Every cross-roadmap citation was resolved again, on main or at the open head.

- **Polylogarithms** (open): §§2.1, 2.2, 3.1–3.7, 4.1–4.7 and 5.1, 5.2, 5.4, 5.5, 5.9 exist (its lines 137–1102); blochWignerDesc (139), stableK_hurewiczPrimitive (168), trilogGroup (313), `IsCycle3` (356), `FiveTermFunction` (362), genericVectorConfig (400), stabilizedConfigurationComparison (402), zagierPeriod_calibration (660), explicitRawCycleFour (679), cycleObstruction (701), zagierExistence_totallyRealEven (722). Its §3.6 gives the dual of `(I_q,B)` as `(−Bᵀ,I)`, used by the new Check of §5.8; its §3.3 has the unit-part homomorphism; its §4.7 gives `Z₄ = π⁴ = 90ζ(4)` over `ℚ`.
- **K3BlochGroups** (open): §§3.2–3.5, 3.8 (593–826); §4.21 with preBloch_rationalSpecialization for `|k| ≥ 4` (1761). **BorelRegulators** (open): §§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a (171–724), `r_Bo = −2r_Be` (848). **PeriodsAndSpecialValues** (open): PS.3.0 (752), PS.9.3 (2085), PS.9.8 (2190), PS.9.9 (2211), PS.9.10 (2231). **MotivicEtaleKTheory** (open): §§3.3, 3.4, 7.1 (398, 421, 651). **MotivesAndAlgebraicCycles** (open): §3.6 (537), Layer 4 (556), §§6.1–6.3 (1117–1150). **MixedHodgeModulesAndIrregularHodgeTheory** (open): §§3.1–3.3 (365–394), with the boundary Check on `𝔸²` (412) that §3.6 restricts to a line.
- **PolylogarithmFunctions** (main): §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7 and `blochWigner_fiveTerm`. **HodgeStructures** (main, under `Completed/`): layer L2.
- Merge order: the suppliers are on lines 39, 92, 138, 139, 261, 302, 306, 321; this roadmap is on line 323.

The four declared gaps have the same slugs in `design/plan.json` and under `## Exact supplier contracts`, each with a named supplier and section; each `needs` sentence states its hypotheses, and none asks for what the supplier's head states (Polylogarithms §3.4 names decorated flags and stabilizedConfigurationComparison without the flag-length range; its §3.1 has coordinateRelation_specialize, the analytic identity at the remaining admissible values, and no closure of `R₃` under specialization at `t = 0`; PS.9.8–PS.9.10 are over `ℚ`, `ℤ` and three punctures).

Dependency check:

```text
depcheck: 239 roadmaps, 2254 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Duplication and overlap

- `roadmaps grep` over main and the open heads, by object: scissors congruence, Hodge correlators, the tetralogarithm, special derivations, framed mixed Hodge structures, cluster polylogarithms and Hodge–Tate variations occur in no other roadmap; motivic correlators, decorated flags and the Bigrassmannian only in Polylogarithms (its scope paragraph and §3.4) and in a reference line of PolylogarithmFunctions; Stasheff elsewhere only as `A∞` and disc-moduli vocabulary (FukayaTheory, cited in the scope section).
- The overlaps ledger lists no other pull request changing this roadmap, no dropped id and no id only a revision defines. Main has no folder of this name: no second copy.
- The two other board packages (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; neither subject touches this one.

Overlap check: read Polylogarithms, K3BlochGroups, BorelRegulators, PeriodsAndSpecialValues, MotivicEtaleKTheory and PolylogarithmFunctions; decorated flags and their acyclic resolution, owner Polylogarithms §3.4 (cited, with the declared gap decorated-flag-lengths); the weight-four theorem, `L₄*`, `κ` and the transfer to inductive cycles, owner this roadmap (Polylogarithms' scope paragraph and §4.5); mixed Tate motives and path torsors, owner PeriodsAndSpecialValues PS.9.8–PS.9.10 (cited, two declared gaps); nothing else shared.

### Shape, style and copyright

- Six layers, each ending with Examples and Dependencies; 48 numbered sections, each with at least three Checks, 32 with an API list (counted by script).
- Pattern scan of the README and the Lean file for process words, pull-request numbers, round labels, machine paths, HTML and LaTeX delimiters: the only hits are the mathematical word "current".
- The manifest records the seven works of the References; no work is cited without an entry.
- Arrangement against the contents of GR (§§1–10): Layer 1 draws on its §§1.2 and 5.1, Layer 2 on §§1.3, 3, 4, 5.2, Layer 3 on §§2, 5.2, 6, 8.2, Layer 4 on §§7, 9.1, 10, Layer 5 on §§8, 9 with G00, G09, CGR and G93, Layer 6 on §§1.1, 9.3. No run of layers maps one to one onto a run of sections; the order Layer 4 → 5 → 6 is forced by the *Needs* lines of §§5.8 and 6.1.
- Wording, 10 passages beside their sources: §3.8 (GR 1202–1221), §3.11 with its proof route (GR 1390–1434), §3.12 (GR 1456–1485), §5.8 (GR 4244–4249), §5.10 (GR 3988–3992 and 4029–4034), §6.1 (GR 4286–4291), §6.4 and the docstring of `zagier_four_exists` (GR 196–200), §3.13 (GR 3554–3561), §3.10 (M20 2430–2433), §3.9 (G08 796–798). The longest shared run is four words ("injectivity of the regulator"); no sentence, table or list is taken over.

Source independence: 10 passages compared with 3 sources, none shared; largest share GR, 64 of 119 bracketed source citations; contents compared with GR: independent.

## Not verifiable

- The truth of the owned research-level targets: §3.14(1) for an arbitrary discrete valuation, the family realization of §3.13, and the vanishing and regularity (a), (b), (d) of §5.7. They were tested on instances, not proved.
- `X ≠ 0` and the ratio `−9` of §4.8, on which the new Check "`R₇²` is not zero" of §5.8 rests, were not rerun; round 9 carries the values.
- The residue of the `C₇(3)` row of `h` at `|125| = 0`, computed in the repair report, was not recomputed; this round computed Lemma 9.6 at `x = 0` and `y = 0` only.
- G93 is an OCR of a scan: the headings of its Theorems 4.5 and 4.6 are garbled, so the numbers were confirmed by position, with (4.10)–(4.11) and (4.13)–(4.14) on the same pages.
- The year "(2026)" given for arXiv v5 of GR in the References: the cached text carries no arXiv stamp.

## Source issues

- **Gap** in GR at §9.3, item 2, printed p. 93: the source says subtracting the cobracket of one eight-point double-symbol element lands the map in the polylogarithmic complex; it should carry the coefficient 3/28 and a second correction for the wedge-valued map on seven points of the line; affects the proof.
- **Gap** in GR at §2, item 3, (66), printed p. 28: the source says the cobracket is the sum over cuts, for correlators with coinciding points; it should say that a weight-one factor on two equal points is zero; affects nothing.

The other source issues recorded in earlier rounds (GR Theorem 1.2, Lemma 7.9, (36), §1.2 worked specialization, (99), §7.1 signs, (187)–(192), §9.3 with footnote 24; G08 §9; M20 (3) and the example after (16)) lie in text this round did not recompute.

## For the human reviewers

- **Scope.** `packages/ZagierConjecturePolylogarithms/README.md:923` states that part of the §5.7 target is open; §§5.8, 6.1 and 6.2 use it, so `zagier_four_exists` rests on it for `r₂ > 0`. `zagier_four_everyFamily` (§6.3) does not.
- **Scope.** The main source GR is recorded in `sources.toml` as an arXiv preprint (v5) with no journal reference. Reviews of this package record errors and gaps in its proofs (the section above and earlier rounds).
- **Scope.** Polylogarithms' scope paragraph (its README, line 22) lists "decorated flags" and "the presentation map to the inductive complex" among what this roadmap owns; this README imports the flags from its §3.4 and constructs no such map (§6.5). The correction belongs to Polylogarithms.
- **Licence.** G93 is read from the author's page (`sources.toml`, `licence_class = "author-page"`), an OCR of a 1993 volume chapter.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "45a209c4aa380eb0700e596e2fa5b54d1e7c26e0", "job": "REV-PKG-ZagierConjecturePolylogarithms~10", "model": "fable", "worker": "chris-x88"} -->
