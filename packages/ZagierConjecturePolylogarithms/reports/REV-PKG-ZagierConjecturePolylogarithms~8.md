<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6901595138 -->
Review (claude) of f80d3b9

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.13 Check miscounts the cuts of `(0,0,1,y)`: seven vanish and one survives

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:580` (§3.13, Checks, "Weight three, single symbol"): "of the eight cuts of `(0,0,1,y)` six vanish, because `u(0) = u(−1) = 0` and `Cor_∞(0,0,1) = Cor_∞(y,0,0) = 0` … the two survivors give `Cor_∞(0,1,y)∧u(y)`".

   **Claim.** Six of the eight cuts vanish and two survive.

   **Witness.** With the cut rule of §3.4 on the letters `p₁p₂p₃p₄ = 0,0,1,y`, the eight cuts are:

   | Cut letter | Cut | Value |
   | --- | --- | --- |
   | `p₁` | `⟨1,y,0⟩∧⟨0,0⟩` | 0, pure factor |
   | `p₁` | `⟨y,0⟩∧⟨0,0,1⟩` | 0, shuffle |
   | `p₂` | `⟨y,0,0⟩∧⟨0,1⟩` | 0, shuffle |
   | `p₂` | `⟨0,0⟩∧⟨0,1,y⟩` | 0, pure factor |
   | `p₃` | `⟨0,0,1⟩∧⟨1,y⟩` | 0, shuffle |
   | `p₃` | `⟨0,1⟩∧⟨1,y,0⟩` | 0, `u(−1) = 0` |
   | `p₄` | `⟨0,1,y⟩∧⟨y,0⟩` | `Cor_∞(0,1,y)∧u(y)` |
   | `p₄` | `⟨1,y⟩∧⟨y,0,0⟩` | 0, shuffle |

   Seven vanish (2 + 1 + 4) and one survives. Two survivors with the stated value would give `2[y]₂⊗u(y) ≠ δS₃(y)`. The README's own four-letter formula in the next Check agrees: its `k = 2` term is `Cor_∞(0,1,y)∧(u(y) − u(0))`.

   **Exact repair.** Replace the quoted clause, from "of the eight cuts" to "give `Cor_∞(0,1,y)∧u(y)`", by:

   > of the eight cuts of `(0,0,1,y)` seven vanish: the two with the pure factor `⟨X₀,X₀⟩`, the one with the factor `Cor_∞(0,1) = u(−1) = 0`, and the four with a factor `Cor_∞(0,0,1)` or `Cor_∞(y,0,0)`, zero by the first-shuffle relation `2⟨X₁,X₀,X₀⟩ = 0` of §3.4; the one survivor, the cut through the letter `y` and the arc between the two zeros, is `Cor_∞(0,1,y)∧Cor_∞(y,0) = Cor_∞(0,1,y)∧u(y)`

   The rest of the sentence ("which is `[y]₂⊗u(y) = δS₃(y)` under `a∧b ↦ a⊗b` …") stays.

   **Tested on the instance.** The enumeration above gives coefficient one on `Cor_∞(0,1,y)∧u(y)`, which is `δS₃(y)`; the conclusion `S₃(y) ↦ Cor_∞(0,0,1,y)` is unchanged.

   **Same pattern elsewhere.** All other cut counts were recomputed and are right: three cuts of `(0,1,y)` (§3.8); fifteen cuts of `(0,0,0,1,y)` with the one survivor `Cor_∞(0,0,1,y)∧u(y)`; ten cuts of types `(3,1)`, `(1,3)` and one surviving `(2,2)`-cut of `(0,0,x,1,y)` (§3.13); `5 + 5 + 5` for length five (§3.4).

One finding, P3: a miscount in one Check of §3.13. The finding of the previous review is repaired. `Suggested.lean` elaborates with `sorry` as the only warning, has no padding and states both headline theorems. Nothing else in the package needs a change.

## Verified sound

### The finding of the previous review

| Previous finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), §3.9 called the infinite-rank fundamental Lie algebra a good variation | `README.md:513`: "the mixed Hodge structures on the quotients of that Lie algebra by the terms of its lower central series form good variations of mixed Hodge–Tate structures, compatible under the projections"; "for `n ≥ 2` it has infinite rank and is the inverse limit of these quotients, a pro-object …, not a variation of §3.6"; a weight-`m` word "read on the quotient by the `(m+2)`-nd term". API bullet at `:522`, new Check at `:530`. | repaired |

No finding of the repair report was marked not actionable. The repair's additions (numbering of the lower central series, constancy of `gr^W`, the case `n = 1`, "a combination of framings") were each checked; rows below.

### Adversarial table

Fresh rows cover the repaired passage, the 15 sampled targets and the headlines. For text no repair touched and outside the sample, the computed rows of rounds 6 and 7 stand.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §3.9 quotients (changed) | `n = 2`, quotient by terms 2, 3, 4 | ranks `2`, `2+1 = 3`, `2+1+2 = 5`; Witt ranks `2,1,2,3,6,9` | finite rank; full algebra infinite |
| §3.9 constancy of `gr^W` (changed) | Artin action of a pure braid on `F₂` | each `xᵢ` goes to a conjugate, so the action on `H₁` and on the graded Lie algebra is trivial | sound |
| §3.9 reading degree (changed) | `m = 1`, `m = 2` | `[X_s,u_s]` has degree `m+1 = 2`, `3`; visible modulo terms 3, 4 | sound |
| §3.9 framing weight (changed) | §3.6 convention on the Kummer object and on `(gr_{−2}, gr_{−2m−2})` | `1 − 0 = 1`; `(m+1) − 1 = m` | sound |
| §3.9 new Check, derivation | `D(X_{s₁}) = [X_{s₁},X_{s₂}]`, `D(X_{s₂}) = [X_{s₂},X_{s₁}]` | `D(X_∞) = −[X_{s₁},X_{s₂}] − [X_{s₂},X_{s₁}] = 0`; space of such `D`: `c = d`, dimension 1 = `n(n−1)/2` | sound |
| §3.9 locator G08 line 4233 (changed) | page markers | line 4233 lies on p. 96, in §10.4 (heading at 4227); it calls the Lie algebra a pro-object | correct |
| §3.9 phase and `c₂` | `m = 2`, `(0,1,i)` | `i·(−4)(2πi)^{−3}(−1)/2 = 4(2πi)^{−2}(2π)^{−1}/2`; `−(2πi)^{−2}D(i) = D(i)/(4π²) = 0.0232017`; (4) at `1/i = −i` gives the same; `c₂ = −2` | sound |
| §1.1 | `Z(0,…,5)`; `s(∞,1,0,x)`; `s(∞,0,1,x)` | `1/5` (exact arithmetic); `x`; `1−x` | sound |
| §1.2 against §3.1, case `a > 0 = b` | `δD₃₁(tu,v)` term by term | `−S₃(v₀)⊗u(u₀/v₀) + S₃(v₀)⊗u(u₀) = S₃(v₀)⊗u(v₀) = δ(+S₄(v₀))` | sign `+` confirmed |
| §2.1 | `K₂`, `K₃` | 5 triangulations; `14 − 21 + 9 − 1 = 1` | sound |
| §2.3 edge and square | reversal; four edges of a square | `[−X⁻¹]₂ = −[−X]₂`; `A⊗(δA−δA−2δB) + B⊗(2δA+δB−δB) = 2(B⊗δA − A⊗δB) = δ(2·B∧A)` | sound |
| §2.5 hexagon square (uses §2.3) | `(0,1,3,−3/11,2,12/11)` | `s(0,1,3,−3/11) = −6`, `s(−3/11,2,12/11,0) = −10` | sound |
| §2.4 facet identity | `(0,1,3,7,11,17,23)`, `(0,1,2,5,−3,1/2,9)`, `(2,3,5,7,11,13,19)`, exact rationals | facet sum 70 terms (42 + 28), `Q₄` 35 (21 + 14); left minus right: 0 terms in all three; coefficients of `D₃₁(−69/8,−1/4)`: `−1`, `0`; of `D₃₁(−1/4,−69/8)`: `+1`, `−1`; `L¹` plus its rotation by one: 0 terms | identity exact |
| §2.4 correction terms | `δ(D₃₁(y,z) + D₃₁(z,y))` | `(D₂₁(y,z) − D₂₁(z,y))⊗(y/z) + (S₃(y/z) − S₃(z/y))⊗((1−y)/(1−z))`, the other four terms cancel, `Λ²B₂` cancels | sound |
| §3.5 | `n = 2`, weight one; `ad X_{s₁}` | `Sym²V − 2 = 1` word, 1 derivation; `[X_{s₁},X_a] = −[X_{s₁},X_{s₂}] ≠ 0` | sound |
| §3.8 | cuts of `(0,1,y)`; (67) | `u(−1)∧u(1−y) + u(1−y)∧u(y) + u(y)∧u(−1) = (1−y)∧y`; `s(∞,0,1,y) = 1−y`; `Cor^H(1,0,z) = (2πi)^{−2}L₂(1/(1−z)) = (2πi)^{−2}L₂(z)` | sound |
| §3.12 | `ℓ = 3, 4, 5` | cyclic shift of `ℓ` letters is odd for even `ℓ`; `ℓ = 3` excluded by footnote 12 of the source | sound |
| §3.13 weight three | eight cuts of `(0,0,1,y)` | seven zero, one equal to `Cor_∞(0,1,y)∧u(y)` | value right, count wrong: R01 |
| §3.13 `D₂₁` | four-letter formula on `(0,x,1,y)` | `−[x]₂⊗((1−y)/y) + [(y−x)/(1−x)]₂⊗(y/x) + [y]₂⊗(x/(1−x)) + [y/x]₂⊗((1−x)/(1−y))`, equal to `−δD₂₁(x,y)` term by term using `[1−w]₂ = −[w]₂` | sign `−` confirmed |
| §3.13 `D₃₁` | fifteen cuts of `(0,0,x,1,y)` | tensor part `D₂₁(x,y)⊗(x/y) + S₃(x/y)⊗((1−x)/(1−y)) + S₃(x)⊗((1−y)/y) − S₃(y)⊗((1−x)/x)`; `(2,2)` part `−[x]₂∧[y]₂` | equals `δD₃₁(x,y)` under the Conventions |
| §3.13 constants | `ℚ` | ranks of `K₃, K₅, K₇` of `ℚ`: `0, 1, 0` | sound |
| §5.1 single symbols | `n = 2, 3, 4` | `binom(2n−2,n−1) = 2, 6, 20`; `P(S₃)∗log|z| = −4·d(i·L₄*)`, `δP(S₄) = −(1/2)d(8i·L₄*)`; `(2/5)L₄* = (1/8)(L₄ + L₂log²|z|/15)` | sound |
| §5.1 `µ` | weight four | one-forms `1/10`; two-forms `1/4, 1/6, 1/4`; three-forms `1, 1/3, 1/3, 1`; `X/4 − Y/6 = (5/24)(X−Y) + (1/24)(X+Y)` | sound |
| §5.1 diagonal equation | `z = i`, `∂θ` | `L₃(i) = −3ζ(3)/32`, both sides `−3iζ(3)/256 = −0.0140866i`; in `C_H` both `15iζ(3)/128 = 0.1408660i`; weight three both `D(i)/4 = 0.2289914` | sound |
| §5.1 four units | `2, y, z, w` at `1` | types `(3,0)+(0,3)`: `−i/4`, mixed: `−3i/4`; `P = −(i/4)log 2 = −0.1732868i`, `R = (i/8)log 2 = 0.0866434i` | sound |
| §5.1 `(2,1,1)` | `x = i` | `P = −(3/5)i·D(i) = −0.5495794i`, `R = −i·D(i)/8 = −0.1144957i` | sound |
| §5.1 inverse pair | `y = 1/2` | `dL₃/dy = (4/3)log²2`; `−i·log³2/15 = −0.0222016i` | sound |
| §5.2 | `[2+i]`; `[x]+[x⁻¹]` | `D(2+i) = 0.5116664`, correction `0.3313411`, `L₄* = 0.1462942`, `(5/16)L₄ = 0.1393913`; `D(1/x) = −D(x)` | hypothesis needed, sound |
| §5.5 `a₁` | lifts `(2,1)`, `(6,3)` | `(1·(−2))/(1·(−1)) = 2`; `(1·(−6))/(3·(−1)) = 2`; `Δ`: `−2`, `−6` | sound |
| §5.5 `a₂` square | coordinate triangle and `((1,1,1),(1,2,3),(1,3,2))` | both sides `2·u2∧u3 + 2·u2∧u5 − 2·u3∧u5`; for `⟨M;L⟩` both sides the negative | sound |
| §5.5 additivity | fourth vertex `(1,4,9)` | `u(2)∧u(3)`-coefficients `1, −9, −8, 2`; alternating sum zero in every coefficient | sound |
| §6.2 | `[i]` over `ℚ(i)`; exponent | `β(4)/8 = 0.1236181`; `−β(4)/(64π³) = −0.00049836`; `π^{r₂−4N}·π^{3r₂} = π^{−4(r₁+r₂)}` | sound |
| §6.3 | zero cycle; `[x]+[x⁻¹]` | `0`; `L₄(x) + L₄(1/x) = 0` | sound |
| `zagier_four_exists` | `ℚ`; `ℚ(i)` with `[i]` | `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 48.166095 = 45ζ(4)β(4)` | `q = 90`, `q = 45` |
| `zagier_four_everyFamily` | zero column; `[i]+[−i]`; conjugate embedding | `0`; `β(4) − β(4) = 0`; row negated | `q = 0`, `0`, `−q` |
| `singleValued` (Lean) | real `z > 1`; `z = 0`, `z = 1` against Polylogarithms' unbranched formula | `1 − tz` has argument `+π` from `Im z < 0` in every weight; `0`; `ζ(n)` for odd, `0` for even `n` | the two formulas agree |
| `TrilogRelationFunction` (Lean) | against Polylogarithms' `Suggested.lean` at its head | `trilogCyclic` and the four clauses are the same terms; `L₃(1/2) = 7ζ(3)/8 = 1.0517998`, `L₃(−1) = −0.9015427` | same predicate |

### Sources: the seeded sample

All seven texts are in the cache; the author flagged no locator as unverified. Every sampled locator is on the stated page and supports the statement.

- **1.1, 1.2**: as recorded in round 7 (GR lines 130, 386–396, 540; 407–441, 580–594); (35)–(36), p. 13, GR lines 548–552.
- **2.1**: Figure 6, p. 21, GR line 884; Theorem 3.8, p. 39, GR line 1749; Proposition 3.9, p. 40, GR line 1760; (85), p. 46, GR line 2044.
- **2.3**: (94)–(99), pp. 50–51, GR lines 2242–2284; the passage from `e^W` to `W²`, GR lines 2243–2245; Lemmas 3.12–3.15, pp. 42–44, GR lines 1851–1928. The printed square value (99) has no factor 2, as the README says.
- **2.4**: Definition 4.2 with (101)–(102), p. 52, GR lines 2296–2302; Proposition 5.5, p. 56, GR line 2555.
- **3.5**: GR (62)–(63) and Theorem 2.1, p. 27, GR lines 1157–1177 (`CLie` is the shuffle quotient, pure words not removed, as the README says); G08 Lemma 8.1, Propositions 8.2–8.3, p. 84, lines 3667–3693; Proposition 8.4, p. 85, line 3713.
- **3.8**: (64)–(66), p. 28, GR lines 1205–1217 (independence of `v` for `m > 1`, line 1208); (67), Definition 2.3 and (68), p. 29, GR lines 1251–1272; Theorem 2.2, p. 27, GR line 1196.
- **3.9**: M20 (3), p. 3, line 114; (4), Figure 1 and §1.2.2, p. 4, lines 139–150; Theorem 6(a), p. 13, line 627; example after (16), p. 18, lines 889–895; G08 lines 4016 (p. 92), 4060 (p. 93), 4176 (p. 95), 4233 (p. 96), 4237 (p. 97), 796 (p. 19), 3399 (p. 77), 3781 (p. 86), 4628–4632 (p. 105); Lemma 11.2, p. 104, line 4596; Figure 8, GR p. 31.
- **3.12**: Proposition 2.9 with footnote 12, pp. 33–34, GR lines 1456–1469; Corollary 2.10, p. 34, GR line 1486.
- **3.13**: GR lines 3554–3561, p. 77; Theorem 1.13 with (40)–(41), pp. 15–16, GR lines 660–671; Theorem 2.4 and Proposition 2.5, pp. 29–30; §5.3, pp. 56–57, GR lines 2585–2601.
- **5.1**: (190)–(191), p. 77, GR line 3590; (192), p. 78, GR lines 3598–3608; G08 p. 105, line 4628.
- **5.2**: Theorem 1.3(iv), p. 7, GR line 241.
- **5.5, 6.2**: as recorded in round 7; Theorem 1.3(ii), (iv), pp. 6–7, GR lines 233–242.
- **6.3**: §1.5, item 2.1, p. 25, GR lines 1066–1075; (40)–(41) as above.
- M20 Lemma 29 and the closing corollary are on printed pp. 44–45 (PDF pp. 64–65); the manifest says printed pagination.
- The arXiv listing of GR gives v5 the date 15 July 2026, so the year in the References is right.

### Lean form, headlines and padding

- **Elaboration.** `lake env lean` on the absolute path of `packages/ZagierConjecturePolylogarithms/Suggested.lean`, from the content checkout: two warnings, both `declaration uses sorry` (124:8, 133:8), nothing else.
- **Form.** One import (`import Mathlib`), one module docstring in the required form, namespace `TauCetiRoadmap.ZagierConjecturePolylogarithms`, a docstring on each of the ten declarations; no `set_option`, `lemma`, `#eval`, `#print`, `#synth` or sorry'd data.
- **One-tactic probe, both sorried theorems.** On a scratch copy: `rfl`, `simp`, `infer_instance`, `exact ⟨0, by simp⟩`, `aesop`, `decide`, a zero-family witness closed by `simp`, `simp [zagierDeterminantFour, periodMatrixFour]`, `exact ⟨_, rfl⟩`, `norm_num [zagierDeterminantFour]`, `trivial`, `exact ⟨0, by simp [zagierDeterminantFour]⟩`: 24 probes, 24 failures. No padding.
- **`#check @name`** for the eight definitions in the same scratch file, and the two theorem types from the worker's elaborated signatures: `[Field F]` on the four field-level definitions, `[AddCommGroup V] [Module ℚ V]` on `TrilogRelationFunction`, `[Field F] [NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems, `hc` on `zagier_four_everyFamily`. No binder lost; each equals README §6.4. Nothing changed.
- **Headlines.** The Summary's end theorems are `zagier_four_exists` and `zagier_four_everyFamily`; both are stated. The five groups of results that are not statable are named in the module docstring with the missing carriers. At the pins no file of Mathlib or Tau Ceti mentions a polylogarithm, a Bloch–Wigner function or a pre-Bloch group.
- **Names.** The ten backticked names the README attributes to this roadmap are the ten declarations, and conversely; `roadmaps resolve` lists nothing.

### Pinned declarations opened

Mathlib: `Finsupp.linearCombination` (`LinearAlgebra/Finsupp/LinearCombination.lean:54`), `Submodule.mkQ` (`LinearAlgebra/Quotient/Defs.lean:227`), `exteriorPower.ιMulti` (`LinearAlgebra/ExteriorPower/Basic.lean:56`), `exteriorPower` (`LinearAlgebra/ExteriorAlgebra/Basic.lean:22`), `Matrix.det_isEmpty`, `Matrix.det_mul` (`LinearAlgebra/Matrix/Determinant/Basic.lean:97`, `:141`), `FreeLieAlgebra` (`Algebra/Lie/Free.lean:121`), `LieDerivation` (`Algebra/Lie/Derivation/Basic.lean:43`), `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`), `ProjectiveResolution` (`CategoryTheory/Preadditive/Projective/Resolution.lean:41`), its `lift` (`CategoryTheory/Abelian/Projective/Resolution.lean:92`, between two projective resolutions only), `NumberField.dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:50`, the L-series of ideal-norm counts), `NumberField.discr` (`NumberTheory/NumberField/Discriminant/Defs.lean:36`), `InfinitePlace.embedding`, `IsComplex`, `nrRealPlaces`, `nrComplexPlaces` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:188`, `:437`, `:441`), `bernoulli_one` (`NumberTheory/Bernoulli.lean:207`, value `−1/2`).

Tau Ceti: `MixedHodgeStructure` (`Geometry/Hodge/Mixed/Basic.lean:72`), `MixedHodgeStructureCat` (`Mixed/Category.lean`), the abelian instance (`Mixed/Abelian.lean`), `Hom.range_inf_F_eq_map_F` (`Mixed/Strictness.lean`), `tate` (`Tate/Basic.lean:93`).

### Suppliers, gaps and order

Every cross-roadmap citation was resolved again, against main or the open head.

- **Polylogarithms** (open): §§2.1, 2.2, 3.1–3.7, 4.1–4.7, 5.1, 5.2, 5.4, 5.5, 5.9 exist; blochWignerDesc (139), stableK_hurewiczPrimitive (168), trilogGroup (313), `IsCycle3` and `FiveTermFunction` (356), the unit-part homomorphism (380), genericVectorConfig and stabilizedConfigurationComparison (400–402), rankTwo_vanish (523), zagierPeriod_calibration (658), explicitRawCycleFour (679), cycleObstruction (701), zagierExistence_totallyRealEven (722).
- **K3BlochGroups** (open): §§3.2–3.5, 3.8 (593–826); §4.21 with `|k| ≥ 4` (1761). **PeriodsAndSpecialValues** (open): PS.3.0 (752), PS.9.3 (2085), PS.9.8–PS.9.10 (2190, 2211, 2231). **BorelRegulators** (open): §§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a, 6.2 (171–795). **MotivicEtaleKTheory** (open): §§3.3, 3.4, 7.1 (398, 421, 651). **MotivesAndAlgebraicCycles** (open): §3.6, Layer 4, §§6.1–6.3 (537, 556, 1117–1150). **MixedHodgeModulesAndIrregularHodgeTheory** (open): §§3.1–3.3 (365, 383, 394).
- **PolylogarithmFunctions** (main): §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7 (105–806). **HodgeStructures** (completed, main): its layers are named L0–L2.
- Merge order: the suppliers are on lines 92, 138, 139, 261, 302, 306, 321; this roadmap is on line 323.

The four declared gaps have the same slugs in `design/plan.json` and under `## Exact supplier contracts`, each with a named supplier and section. None asks for what the supplier's head already states: PS.9.8–PS.9.10 are over `ℚ`, `ℤ` and the three-punctured line; Polylogarithms §3.4 states the decorated-flag comparison for its weight-three use only; its §3.1 has no specialization closure of `R₃`. An acceptance in a later round is conditional on them.

Dependency check:

```text
depcheck: 242 roadmaps, 2255 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Duplication and overlap

- Searched main and the open heads by object (`roadmaps grep`): scissors congruence, Hodge correlators, special derivations, cluster polylogarithms, the tetralogarithm and Hodge–Tate variations occur nowhere else; motivic correlators only in Polylogarithms' hand-over sentence and in two reference lists; Stasheff on main and in other open roadmaps only as `A∞` and disc-moduli vocabulary.
- Polylogarithms' `Suggested.lean` declares `polylog`, `singleValued`, `unitVector`, `trilogCyclic` and `TrilogRelationFunction` in its own namespace; no fully qualified name is shared and the mathematics agrees (table).
- The overlaps ledger lists no other pull request changing this roadmap, no dropped id and no id only a revision defines. Main has no folder of this name: no second copy.
- The two other board packages (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; their subjects are disjoint.

Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory and PolylogarithmFunctions; decorated flags and their acyclic resolution, owner Polylogarithms §3.4 (cited, with the declared gap decorated-flag-lengths); variations of mixed Hodge structure and admissibility, owner MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3 (cited); the weight-four theorem, `L₄*`, `κ` and the transfer to inductive cycles, owner this roadmap (Polylogarithms §4.5 and its Downstream consumers); nothing else shared.

### Shape, style and copyright

- Six layers, each ending with Examples and Dependencies; 48 numbered sections, each with at least three Checks (counted; §3.9 now has four); every definition has an API list; every theorem target has hypotheses and a locator.
- Pattern scan of the README and the Lean file for process words, pull-request numbers, round labels, machine paths, HTML anchors and LaTeX delimiters: no hit.
- Arrangement against GR's contents (§§1–10): Layer 1 draws on §§1.2 and 5.1, Layer 2 on §§1.3, 3, 4, Layer 3 on §§2, 5.2, 6, 8.2, Layer 4 on §§7, 10, Layer 5 on §§8, 9 with G00, G09, CGR, G93, Layer 6 on §§1.1, 9.3. No run of layers maps one to one onto a run of sections; the order Layer 1 → 2 → 3 is forced by the *Needs* lines of §§2.3–2.5 and 3.1.
- Wording, 12 passages beside their sources: §2.3 (GR 2246–2289), §2.4 (GR 2292–2302), §3.5 (GR 1146–1177; G08 3691–3713), §3.8 (GR 1202–1217, 1249–1262), §3.9 (G08 4231–4241; M20 108–118), §3.10 (M20 2430–2433), §3.12 (GR 1456–1486), §3.13 (GR 3554–3561, 660–671), §5.1 (GR 3589–3608), §5.2 (GR 241–242), §6.3 (GR 1066–1075), the docstring of `zagier_four_exists` (GR 196–200). The longest shared run is four words, in formulas' surroundings; no sentence, table, figure or list is taken over.

Source independence: 12 passages compared with 3 sources, none shared; largest share GR, 54 of 93 locators; contents compared with GR: independent.

## Not verifiable

- The truth of the owned research-level targets: §3.14(1) for an arbitrary discrete valuation with infinite residue field, the family realization of §3.13, and the vanishing and regularity (a), (b), (d) of §5.7. They were tested on instances, not proved; see the last section.
- The plane integral `∫ log|x| d log|x−1| ∧ d log|x−i| = −πD(i)` of §3.9 was not integrated numerically; the value it leads to agrees with formula (4) of M20, which was evaluated.
- The numerical cobracket values of §§3.1 and 3.13 (`0.5011`, `0.1206`, `0.1481`, `0.0275`) were not rerun; the same identities were checked symbolically this round (table). The `8!` alternation of §4.8, the tetrahedron coassociativity of §5.5 and the off-unit-circle points of §5.1 were not rerun; earlier rounds carry their values and the text is unchanged.
- G93 is an OCR of a scan; its two locators (§§5.9, 5.10) are outside the sample and were not reopened.

## Source issues

- **Error** in GR at Theorem 1.2, printed p. 5, GR line 199: the source says the determinant expression equals the zeta value for every number field; it should allow a nonzero rational factor, which is 90 over the rationals; affects a stated result.
- **Misprint** in GR at §4.3, item 3b, (99), printed p. 51, GR line 2284: the source says the square value is the plain wedge of the two symbols; it should carry the factor two that its change from the exponential to the square gives the other cells; affects a stated result.
- **Error** in M20 at §2.1.3, the example after (16), printed p. 18, M20 line 895: the source says the weight-two correlator at `(1,0,z)` is minus one half of the normalized dilogarithm; it should be the dilogarithm itself, as its formula (4) gives; affects nothing.

The other source issues recorded in earlier rounds (G08 §9 conditions at infinity; GR §1.2 worked specialization, §7.1 signs, (187)–(192), §9.3 with footnote 24, Lemma 7.9; M20 (3)) lie in text this round did not reopen beyond the lines listed above.

## For the human reviewers

- **Scope.** `packages/ZagierConjecturePolylogarithms/README.md:903` states that part of the §5.7 target is open; §§5.8, 6.1 and 6.2 use it, so `zagier_four_exists` rests on it. `zagier_four_everyFamily` (§6.3) does not.
- **Scope.** The main source GR is cited as an arXiv preprint (v5) in the README and in `sources.toml`; its arXiv comment field says it is accepted by Annals of Mathematics, with no journal reference yet. Reviews of this package record gaps in its proofs.
- **Scope.** Polylogarithms' scope sentence (its README, line 22) lists "decorated flags" and "the presentation map to the inductive complex" among what this roadmap owns; this README imports the flags from its §3.4 and constructs no such map (§6.5). The correction belongs to Polylogarithms.
- **Licence.** G93 is read from the author's page (`sources.toml`, `licence_class = "author-page"`), an OCR of a 1993 volume chapter.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f80d3b9558b4fb7207fa1fc70bfea15f09c1095b", "job": "REV-PKG-ZagierConjecturePolylogarithms~8", "model": "fable", "worker": "chris-x88"} -->
