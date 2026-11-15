<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6900140697 -->
Review (claude) of a82b0eb

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.9 calls the pronilpotent fundamental Lie algebra a good variation, but it has infinite rank

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:513` (§3.9): "Over `Conf_n` the mixed Hodge structures on the pronilpotent fundamental Lie algebra of `ℙ¹ ∖ S` form a good variation of mixed Hodge–Tate structures".

   **Claim.** The family of fundamental Lie algebras is an object of the class defined in §3.6.

   **Witness.** §3.6 (`README.md:457`) defines a good variation as a variation of MixedHodgeModulesAndIrregularHodgeTheory §3.1, which is "a local system `L` of finite-dimensional `ℚ`-vector spaces" (that roadmap's README, line 367). For `n = 2` the Lie algebra is free on two generators, with graded dimensions `2, 1, 2, 3, 6, …`: infinite rank.

   **Exact repair.**

   - Replace the quoted clause by: "Over `Conf_n` the mixed Hodge structures on the quotients of the pronilpotent fundamental Lie algebra of `ℙ¹ ∖ S` by the terms of its lower central series form good variations of mixed Hodge–Tate structures, compatible under the projections; for `n ≥ 2` the Lie algebra itself has infinite rank and is their inverse limit, not a variation of §3.6".
   - In the next sentence change "Its underlying real variation is described" to "Their underlying real variations are described", and "it is what the period maps of §3.7 read" to "they are what the period maps of §3.7 read".
   - After "gives a map from `CLie_S` to the Lie coalgebra `L^HT_•(Conf_n)` of §3.6" add: ", a cyclic word of weight `m` being read on the quotient by the `(m+2)`-nd term of the lower central series, which keeps the degrees up to `m + 1`".

   **Tested on the instance.** `n = 2`: the quotient by the third term has rank `2 + 1 = 3`, with `gr^W_{−2} = ℚ(1)²` and `gr^W_{−4} = ℚ(2)`, so it is a variation of §3.6. The weight-one word `⟨X_{s₁}, X_{s₂}⟩` is dual to a derivation `X_s ↦ [X_s, u_s]` with `u_s` of degree one, which lands in degree two and is visible on that quotient; it gives the Kummer variation of `s₁ − s₂`, as §3.8 requires. No other statement of the package changes: `Cor^Hod` of a word is already a class of finite-rank framed objects.

   **Same pattern elsewhere.** Searched: §3.8, §5.7 and the two PeriodsAndSpecialValues contracts speak of the motivic fundamental groupoid as an object "in `MT(F)`"; that is the supplier's ind-object (PS.9.10 states it as an increasing union of finite objects) and no sentence there asserts membership in a finite-rank class. Only §3.9 does.

One finding, P3, in a sentence the last repair rewrote (§3.9). The three findings of the previous review are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, has no padding, and states both headline theorems. Nothing else in the package needs a change.

## Verified sound

### The three findings of the previous review

| Previous finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2), §3.6 restated variations and admissibility owned by MixedHodgeModulesAndIrregularHodgeTheory | `README.md:457`: "a good variation of mixed ℚ-Hodge–Tate structures is a variation of mixed Hodge structure on `X(ℂ)` (MixedHodgeModulesAndIrregularHodgeTheory §3.1 …) … and which is admissible on `X` (§3.3 there)". *Needs*, Scope (`:11`, `:25`, `:26`), contract (`:59`, `:113`) and Layer 3 Dependencies (`:618`) all cite §§3.1–3.3. Locator moved to G08 §9, p. 87, G08 lines 3812–3820. | repaired |
| F02 (P2), §3.13(4) lacked a field-of-definition hypothesis | `README.md:568`: "a point `x` of the admissible open of a symbol at which all its arguments take values in `F`"; proof sentence at `:574`; Check at `:584`; §5.1 (`:773`) uses the same hypothesis. | repaired |
| F03 (P3), §3.9 cited real-structure theorems for a rational variation | `README.md:513`: rational variation cited to G08 §10.1 setting 5 (line 4016), §10.2 (line 4060), Theorem 10.3 (line 4176), (235)–(236) and Definition 10.4 (line 4237); the three real theorems now support "Its underlying real variation". `sources.toml` `G08` locator extended. | repaired (R01 is a new point in the same sentence) |

No finding of the repair report was marked not actionable. The repair's departures from the suggested wording were checked and are right:

- **F01.** The supplier's condition (a) (its line 396) asks that the extended Hodge bundles restrict on each `gr^W_k` to the limit filtration. The README's reading, "inducing on each `gr^W_{−2n}` its constant Hodge filtration", is that condition for constant graded pieces. The `𝔸¹` Check is the supplier's own boundary Check (its line 412) restricted to `y = 0`.
- **F02.** The value form is strictly wider than the suggested one and every use of (4) satisfies it (§3.13 route, §5.1, §6.3).

### Adversarial table

Fresh rows cover every passage the repair changed, the 15 sampled targets and the headlines. For text no repair touched and outside the sample, the computed rows of the round-6 table stand (the README lines they quote are unchanged).

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §3.6 definition (changed) | constant `ℚ(n)`; Kummer on `𝔾_m`; `F⁰ = O(e₀ + x e₁)` on `𝔸¹` | `N = 0`, good; Hodge line constant in the canonical frame at `0`, `∞`, good; at `s = 1/x = 0` the saturation is `O(s e₀ + e₁)`, limit `F⁰` has dimensions `(1,0)` on `(gr_{−2}, gr_0)` against `(0,1)` | separates; equals supplier Check |
| §3.6, (b) automatic (changed) | weights `0, −2, −4`; even and odd `l` | `N` zero on `gr^W`, so `N W_l ⊂ W_{l−1}`; `W_{l−1} = W_{l−2}` for even `l`; for odd `l`, `W_l = W_{l−1}` and `N W_{l−1} ⊂ W_{l−3}`; `M = W` induces on `gr^W_k` the filtration concentrated in degree `k` | sound |
| §3.6 API, abelian tensor subcategory (added) | sub of `ℚ(n)^r`; `ℚ(a)⊗ℚ(b)`; dual; extension of good by good | `ℚ(n)^s`; `ℚ(a+b)`; `ℚ(−n)`; graded piece is an extension of constants inside a polarizable pure variation, hence a sum | sound; extensions also hold, not needed |
| §3.6 against G08 lines 3815–3819 (changed) | the `𝔸¹` example | literal (i): `O(s e₀ + e₁)` is a subbundle, holds; (ii): `N = 0`, holds; class `x e₁` not constant while `O(𝔸¹)ˣ = ℂˣ` | README's remark on the source is right (Source issues) |
| §3.9 variation (changed) | `n = 1`; `n = 2` | rank one, abelian; free Lie algebra on two generators, dimensions `2, 1, 2, 3, 6, …` | R01 |
| §3.9 locators (changed) | page markers of G08 | 4016 → p. 92; 4060 → p. 93; 4176 → p. 95; 4237 → p. 97; 796 → p. 19; 3781 → p. 86 | correct |
| §3.13(4) (changed) | `S₄(π)` on `Spec ℂ`; `S₄(πt)` at `t = 2/π`; `S₄(f)` with `f(x) = 1`, `f ≢ 1`; `D₂₁(x,x)` at value `c ∈ F` | `π` in no number field, excluded; value `2`, word `(0,0,0,1,2)`; `1` and `f` not pointwise distinct, outside the admissible open; `−Cor_∞(0,c,1,c)`, repeated argument allowed in weight three | sound |
| §5.1 point value (changed) | `S₄(z)` at `z = i` | `p = (2/5)(5/16)L₄(i) = L₄(i)/8 = β(4)/8 ≈ 0.123618` | agrees with Layer 3 Examples and §6.2 |
| §1.1 (sampled) | `Z(0,1,2,3,4,5)`; `s(∞,1,0,x)`; `s(∞,0,1,x)` | `−(−1)³/((−1)(−1)·5) = 1/5`; `(0−x)/(0−1) = x`; `(1−x)/1 = 1−x` | sound |
| §1.2 table (sampled) | GR (26), lines 407–441, entry by entry | `−{v}₃`, `−{u}₃`, `2{u/v}₃`; `+{v}₄`, `−{u}₄`, `3{u/v}₄`; zero otherwise | identical |
| §1.5 formula against table, every order case (sampled) | `a>0=b`; `a=0<b`; `a=b<0`; `a=b>0`; `a>0>b`; `a<0=b`; `a<b<0` | `[1−1/v₀]+[1−v₀]−[1] = −[v₀]`; `[1−1/u₀]+[1−u₀]−[1] = −[u₀]`; `[1]+[1]+2[v₀/u₀]−[1]−[1] = 2[u₀/v₀]`; `[v₀/u₀]+[1]−[u₀/v₀]−[1] = 0`; `[1]−[1] = 0`; `[1]+[1−1/v₀]−[1−1/v₀]−[1] = 0`; `2[1]−2[1] = 0` | compatible in all seven |
| §1.5 at `(2,3)` (sampled) | arguments | `1/2, 2/3, 3/2, (−2)/(−1) = 2, (2/3)/(1/2) = 4/3` | sound |
| §3.1 cobracket against table (sampled) | `a>0=b`; `a=0<b`; `a=b=−1` | `−S₃(v₀)⊗u(u₀/v₀) + S₃(v₀)⊗u(u₀) = S₃(v₀)⊗u(v₀) = δS₄(v₀)`; `−S₃(u₀)⊗u(u₀/v₀) − S₃(u₀)⊗u(v₀) = −S₃(u₀)⊗u(u₀) = δ(−S₄(u₀))`; `2S₃(u₀/v₀)⊗u(u₀/v₀) + S₃(u₀/v₀)⊗u(u₀/v₀) = δ(3S₄(u₀/v₀))` | signs `+, −, 3` confirmed |
| §3.4 (sampled) | cut counts; weight one; pure word `⟨X_a,X_a⟩`; two punctures | lengths 3, 4, 5: `9−6 = 3`, `16−8 = 8`, `25−10 = 15` cuts; words `n(n+1)/2`, minus `n` pure, `= n(n−1)/2` = derivations (`n(n−1)` parameters, `n(n−1)/2` conditions); `⟨X_a,X_a⟩` gives `ad(2X_a)`, nonzero, so only `s ≠ a` is divided out; `(r−1)⟨X_s,…⟩ = 0` for `r ≥ 3` | sound |
| §3.7 (sampled) | `µ` in weight four; product rule; `dω₂` | zero-forms `1/20`; one-forms `binom(5,2)⁻¹ = 1/10` on both types; two-forms `1/4, 1/6, 1/4`; three-forms `1, 1/3`; `N`-eigenvalues `2m−1` and `1` give `((2m−1)/(2m), −1/(2m))`, `(5/6, −1/6)` for `m = 3`; `dω₂ = (1/4)(ā∧b̄ − a∧b) = −(i/2)Im(a∧b)` with `a = dlog f`, `b = dlog g` | matches `Φ`, the product formula and `(−1)^{n−1}2^{1−n}π_n` |
| §3.7 dilogarithm Check (sampled) | `z = i` on `∂θ` | `dD = −(1/2)log 2`; `ω₂(log|1−z|, log|z|) = −(1/2)log√2·i = −(i/4)log 2`; `dR(S₂) = (i/2)(−(1/2)log 2)` | equal |
| §3.11 (sampled) | `ℓ = 3` | `|I| = 0`: 1 term; `|I| = 1`: 3 terms; `|I| = 2`: `2⟨x,a,a⟩ = 0` by the shuffle; `|I| = 3`: pure, zero | `1 + 1 + 3 = 5` terms, the five-term relation |
| §4.3 (sampled) | sign algebra; `N = 5`, six flags | `∂t_d = t_d∂ + p t_{d−1}`; unsigned sum: `(∂−p)T = T∂`; signed: `(∂+p)t = t∂`; conjugation by `(−1)^q` fixes `∂`, negates `p`, sends `T` to `(−1)^N t`; `p t₀`: signs `+−+−+` give one copy of `A` with relation `(1,1,1,1,−1)`, position 5 gives `−B` with `(1,1,1,1,1)` | sound; GR line 2901 writes the unsigned sum |
| §4.4 (sampled) | `N = 4`; single flag | flag length one, `t` the identity; the section of GR (240) lands in degree one, where the truncated complex is zero | sound |
| §4.5 (sampled) | dual nine-term relation under `δ̃` | `9·8 = 72` ordered terms, signs `(−1)^a(−1)^{b−1}` and `(−1)^b(−1)^a`, 36 cancelling pairs | sound |
| §5.5 (sampled) | `a₁⟨∞,0;1,2⟩`, lifts `(1,0),(0,1),(1,1),(2,1)` and `(6,3)` | `(1·(−2))/(1·(−1)) = 2`; `(1·(−6))/(3·(−1)) = 2`; single determinant `−2` against `−6` | sound |
| §6.1 (sampled) | degrees; rank three | `K₇ → H¹`, `K₆ → H²`, `K₅ → H³`, `K₄ → H⁴`; a single flag maps to `BC₁^{(4)} = 0` | sound |
| §6.2 (sampled) | exponent; phase; `[i]` over `ℚ(i)` | `π^{d−4N}·π^{3d} = π^{4r₂−4r₁−8r₂} = π^{−4(r₁+r₂)}`; `i·p/(−8π³i) = −p/(8π³)`; `0.123618/248.05 ≈ 0.00049836` | sound |
| `zagier_four_exists` (§6.4, sampled) | `ℚ`; `ℚ(i)` with `[i]` | `π⁴/ζ(4) = 90`; `(π⁴/2)β(4) ≈ 48.166 = 45·ζ(4)β(4)` | `q = 90`, `q = 45`; nonzero multiple needed for `r₂ = 0` |
| `zagier_four_everyFamily` | zero column; `[i] + [−i]`; conjugate embedding | `0`; `L₄(i) + L₄(−i) = 0`; row negated | `q = 0`, `q = 0`, `q ↦ −q` |
| `IsCycle4` (Lean) | `V = B₃(F)` and a linear map out of it; `[0]`, `[1]`, `[−1]` | universal `b` gives vanishing in `B₃⊗U`, and `φ⊗id` gives the converse; `unitVector` is `0` at each | equivalent to the kernel of `[x] ↦ [x]₃⊗u(x)` |
| `zagierDeterminantFour` (Lean) | precedence; `ℚ` | `(π^{4(r₁+r₂)}/√|disc|)·det`; `π⁴·1` | matches the README |

### Sources: the seeded sample

All seven texts were read from the cache. The author flagged no locator as unverified. Every sampled locator is on the stated page and supports the statement:

- **1.1**: GR (3), p. 4, GR line 130; (23)–(25), p. 10, GR lines 386–396; (34), p. 13, GR line 540.
- **1.2**: GR (26), pp. 10–11, GR lines 407–441; the worked case with `{u/v}₄` against `3{u/v}₄`, p. 14, GR lines 580–594.
- **1.5**: GR (29)–(31), p. 12, GR lines 491–503 (the source defers the proof of (31), GR line 503); Lemma 5.1 and (106)–(109), Lemma 5.2, p. 54, GR lines 2391–2421.
- **3.1**: GR (37)–(38), pp. 13–14, GR lines 558–575; Proposition 5.5, p. 56, GR line 2555; Theorem 1.14(a), p. 16, GR line 676.
- **3.4**: GR Theorem 2.1 and (62)–(63), p. 27; (66), p. 28, GR line 1217; G08 Lemma 8.1 and Proposition 8.3, p. 84, G08 lines 3667, 3693.
- **3.6**: GR (183)–(184), p. 76, GR lines 3503–3515; G08 §§4.1–4.2, pp. 39–44; G08 §9, p. 87, G08 lines 3812–3820.
- **3.7**: G08 Definition 4.10, p. 47, line 1967; Definition 4.12 and Lemma 4.13, p. 48, lines 2028–2045; (93), p. 42, line 1785; (106), p. 48, line 2023; Lemma 4.16, line 2225; Definition 2.1 and Lemma 2.3, p. 28, lines 1151, 1161; GR Theorem 8.3 with (185)–(186), p. 76, GR line 3520; (1), p. 3, GR line 90; Lemma 2.7, p. 33, GR line 1438.
- **3.11**: GR Theorem 2.6 with (70)–(72), p. 32, GR lines 1390–1416 (`a ≠ b`, `m > 2`); Lemmas 2.7–2.8 with (73), p. 33, GR lines 1438–1447 (some `xᵢ ≠ a`).
- **4.3**: GR (131)–(134) and Theorem 7.1, p. 63, GR lines 2867–2902 (`n > 0`, `p ≥ 0`, flags of length `p + 1` in dimension `n + p`); the unfixed signs, p. 62, GR line 2838.
- **4.4**: GR (240), p. 94, GR lines 4274–4291; §9.1, items 1–3, pp. 85–87, GR lines 3943–3986.
- **4.5**: GR (161)–(162) and Definition 7.5, p. 70, GR lines 3223–3231.
- **5.5**: G00 §2, items 1–2, PDF pp. 5–6, G00 lines 149–196; `a₁`, G00 line 178; Propositions 2.1–2.3, PDF p. 6, G00 lines 197–211; (6), PDF p. 8, G00 line 314.
- **6.1**: GR Theorem 1.3(i), p. 6, GR lines 230–232; GR lines 4236–4243, p. 93; GR line 1126, p. 26.
- **6.2**: GR Theorem 1.3(ii), (iv), pp. 6–7, GR lines 233–242; Theorem 9.1, p. 87, GR line 3988.
- **6.4**: GR Theorem 1.2, p. 5, GR lines 196–200; §9.3, item 4, p. 94, GR line 4292.

### Lean form, headlines and padding

- **Elaboration.** `lake env lean` on the absolute path of `packages/ZagierConjecturePolylogarithms/Suggested.lean`, from the content checkout: two warnings, both `declaration uses sorry` (124:8, 133:8), nothing else.
- **Form.** One import (`import Mathlib`), one module docstring in the required form, namespace `TauCetiRoadmap.ZagierConjecturePolylogarithms`, a docstring on each of the ten declarations, no `set_option`, `lemma`, `#eval`, `#print`, `#synth` or sorry'd data.
- **One-tactic probe, both sorried theorems.** On a scratch copy each was tried with `rfl`, `simp`, `infer_instance`, `exact ⟨0, by simp⟩`, `aesop`, `decide`, a zero-family witness closed by `simp`, `exact ⟨_, rfl⟩` and `norm_num [zagierDeterminantFour]`: 18 probes, 18 failures. No padding.
- **`#check @name`** for all ten declarations in the same scratch file, compared with the worker's elaborated signatures: `[Field F]` on the four field-level definitions, `[AddCommGroup V] [Module ℚ V]` on `TrilogRelationFunction`, `[Field F] [NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems, `hc : ∀ j, IsCycle4 (c j)` on `zagier_four_everyFamily`. No binder lost; each equals README §6.4. Nothing changed.
- **Headlines.** The Summary's end theorems are `zagier_four_exists` and `zagier_four_everyFamily`; both are stated. The extension theorem with the cluster map and cobracket, the two realizations, collision continuity, the configuration chain map with the Chern cocycle, and the K-theory maps with the regulator comparison are each named in the module docstring with the missing carrier. Checked at the pins: no file of Mathlib or Tau Ceti mentions a polylogarithm, a Bloch–Wigner function or a pre-Bloch group; `TauCeti/Algebra/Homology/AInfinity/Stasheff.lean` holds `A∞` identities, not polytope cell complexes.
- **Names.** The ten backticked names the README attributes to this roadmap are the ten declarations, and conversely; `roadmaps resolve` lists nothing.

### Pinned declarations opened

Mathlib: `Finsupp.linearCombination` (`LinearAlgebra/Finsupp/LinearCombination.lean:54`), `Submodule.mkQ` (`LinearAlgebra/Quotient/Defs.lean:227`), `exteriorPower.ιMulti` (`LinearAlgebra/ExteriorPower/Basic.lean:56`), `exteriorPower` (`LinearAlgebra/ExteriorAlgebra/Basic.lean`, docstring line 22), `Matrix.det_isEmpty`, `Matrix.det_mul` (`LinearAlgebra/Matrix/Determinant/Basic.lean:97`, `:141`), `FreeLieAlgebra` (`Algebra/Lie/Free.lean:121`), `LieDerivation` (`Algebra/Lie/Derivation/Basic.lean:43`), `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`), `ProjectiveResolution` (`CategoryTheory/Preadditive/Projective/Resolution.lean:41`), its `lift` between two projective resolutions (`CategoryTheory/Abelian/Projective/Resolution.lean:92`), `NumberField.dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:50`), `NumberField.discr` (`NumberTheory/NumberField/Discriminant/Defs.lean`), `InfinitePlace.embedding`, `IsComplex`, `nrRealPlaces`, `nrComplexPlaces` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:188`, `:437`, `:441`), `bernoulli_one` (`NumberTheory/Bernoulli.lean:207`).

Tau Ceti: `MixedHodgeStructure` (`Geometry/Hodge/Mixed/Basic.lean:72`), `MixedHodgeStructureCat` (`Mixed/Category.lean:56`), `abelian` (`Mixed/Abelian.lean:33`), `Hom.range_inf_F_eq_map_F` (`Mixed/Strictness.lean:110`), `tate` (`Tate/Basic.lean:93`).

### Suppliers, gaps and order

Every cross-roadmap citation was resolved against main or the open head.

- **MixedHodgeModulesAndIrregularHodgeTheory** (open, merge-order line 261 against 323): §3.1 (line 365, variations on a complex manifold, transversality, fibres in `TauCeti.Hodge.MixedHodgeStructure`, abelian category, tensor, duals, twists), §3.2 (line 383), §3.3 (line 394, disc, boundary, smooth variety, stabilities, Checks at lines 410 and 412). Each is as the README describes it.
- **Polylogarithms** (open): §§2.1, 2.2, 3.1–3.7, 4.1–4.7, 5.1, 5.2, 5.4, 5.5, 5.9 exist; blochWignerDesc (139), stableK_hurewiczPrimitive (168), trilogGroup (313), the unit-part homomorphism (380), the `𝔽₃` Check (396), genericVectorConfig and stabilizedConfigurationComparison (400–402), zagierPeriod_calibration (660), explicitRawCycleFour (679), cycleObstruction (701), zagierExistence_totallyRealEven (722).
- **K3BlochGroups** (open): §§3.2–3.5, 3.8 (lines 593–826); §4.21 preBloch_rationalSpecialization with `|k| ≥ 4` (line 1761).
- **PeriodsAndSpecialValues** (open): PS.3.0 (752), PS.9.3 (2085), PS.9.8–PS.9.10 (2190, 2211, 2231). **BorelRegulators** (open): §§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a, 6.2 (171–795). **MotivicEtaleKTheory** (open): §§3.3, 3.4, 7.1 (398, 421, 651). **MotivesAndAlgebraicCycles** (open): §3.6, Layer 4, §§6.1–6.3 (537, 556, 1117–1150).
- **PolylogarithmFunctions** (main): §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7. **HodgeStructures** (completed, main): Layer L2.

The four declared gaps have the same slugs in `design/plan.json` and under `## Exact supplier contracts`, each with a named supplier and section and one sentence about one object. None asks for what the supplier already states: PS.9.8–PS.9.10 are over `ℚ`, `ℤ` and the three-punctured line; Polylogarithms §3.4 states the comparison for its weight-three use; its §3.1 has no specialization closure. An acceptance in a later round is conditional on them.

Dependency check:

```text
depcheck: 246 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Duplication and overlap

- Searched main and the open heads by object (`roadmaps grep`): scissors congruence, special derivations, Hodge–Tate variations and cluster polylogarithms occur nowhere else; Hodge and motivic correlators and the Bigrassmannian only in Polylogarithms, which hands weight four to this roadmap; Stasheff appears on main only as `A∞` vocabulary (DGAInfinity, TangentialBordism and others), with no cell complex of dissections; "framed" elsewhere means framed deformations.
- Polylogarithms' `Suggested.lean` and PolylogarithmFunctions' declare `polylog`, `singleValued`, `unitVector` and the relation predicates in their own namespaces; no fully qualified name is shared.
- The overlaps ledger lists no other pull request changing this roadmap, no dropped id and no id only a revision defines. Main has no folder of this name: no second copy.
- MotivicEtaleKTheory's consumer line (its README, line 737) refers to "ZagierConjecturePolylogarithms M.8"; no such id was ever this roadmap's (it is that roadmap's own former label), so nothing here is to map.
- Ownership against the two other board packages (AnalyticNumberTheory, LawrenceVenkateshMethod) was not opened; their subjects are disjoint.

Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory and PolylogarithmFunctions; variations of mixed Hodge structure and admissibility, owner MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3 (cited); decorated flags and their acyclic resolution, owner Polylogarithms §3.4 (declared gap decorated-flag-lengths); the weight-four theorem, `L₄*`, `κ` and the transfer to inductive cycles, owner this roadmap (Polylogarithms lines 22 and 1554); nothing else shared.

### Shape, style and copyright

- Six layers, each ending with Examples and Dependencies; 47 numbered sections, each with at least three Checks (counted: minimum 3, §6.4 has 25); every definition has an API list; every theorem target has hypotheses and a locator.
- Pattern scan of the README and the Lean file for process words, pull-request numbers, round labels, machine paths, HTML anchors and LaTeX delimiters: no hit.
- Arrangement against GR's contents (§§1–10): Layer 1 draws on §§1.2 and 5.1, Layer 2 on §§1.3, 3, 4, Layer 3 on §§2, 5.2, 6, 8.2, Layer 4 on §§7, 10, Layer 5 on §§8, 9 with G00, G09, CGR, G93, Layer 6 on §§1.1, 9.3. No run of layers maps one to one onto a run of sections.
- Wording, 14 passages beside their sources: §1.2 (GR 407–441), §1.5 (GR 491–503), §3.1 (GR 566–595), §3.6 (G08 3812–3820, four consecutive words shared, forced), §3.7 rigidity (GR 1438–1444), §3.9 (G08 4016–4019), §3.10 (M20 899, a statement of a dozen words), §3.11 (GR 1390–1399), §4.3 (GR 2894–2902), §4.5 (GR 3223–3231), §5.5 (G00 155–176), §5.7 candidate (CGR 440–452), §6.1 (GR 4274–4291), the docstring of `zagier_four_exists` (GR 196–200). Formulas agree where the mathematics forces them; no sentence, table, figure or list is taken over.

Source independence: 14 passages compared with 5 sources, none shared; largest share GR, 64 of 121 locators; contents compared with GR: independent.

## Not verifiable

- The truth of the owned research-level targets: §3.14(1) for an arbitrary discrete valuation with infinite residue field, the family realization of §3.13, and the vanishing and regularity (a), (b), (d) of §5.7. They were tested on instances, not proved; see the last section.
- The `8!` alternation of §4.8, the tetrahedron coassociativity of §5.5, the off-unit-circle differences of §5.1 and the numerical cobracket values of §§3.1 and 3.13 were not rerun; the earlier rounds' rows carry their computed values and the text is unchanged.
- G93 is an OCR of a scan; its two locators (§§5.9, 5.10) are outside the sample and were not reopened.
- The year "(2026)" given for arXiv v5 of GR in the References: the cached text carries no date stamp.

## Source issues

- **Gap** in G08 at §9, the conditions at infinity before Theorem 9.3, printed p. 87: the source says the Hodge bundles need only extend to holomorphic subbundles of the canonical extension; it should also require the constant Hodge filtration on each weight-graded piece; affects a stated result.
- **Error** in GR at Theorem 1.2, printed p. 5, GR line 199: the source says the determinant expression equals the zeta value for every number field; it should allow a nonzero rational factor, which is 90 over the rationals; affects a stated result.
- **Misprint** in GR at §1.2, item 3, the worked specialization after (38), printed p. 14, GR line 581: the source says the equal-pole specialization is the single symbol of the quotient; it should be three times it, as (26) and its own computation give; affects nothing.
- **Gap** in GR at §7.1, before Theorem 7.1, printed pp. 62–63, GR lines 2838 and 2901: the source says the unsigned sum over dimension vectors is a chain map after an unspecified sign change; it should fix the row sign, or sum with alternating signs; affects the proof.

The other source issues recorded in earlier rounds (GR (99), (187)–(192), §9.3 with footnote 24 and the coefficient before Lemma 9.6, Lemma 7.9, the lift in §9.3 item 2; M20 (3), (4) and the example after (16)) lie in text this round did not reopen.

## For the human reviewers

- **Scope.** `packages/ZagierConjecturePolylogarithms/README.md:902` states that part of the §5.7 target is open; §§5.8, 6.1 and 6.2 use it, so `zagier_four_exists` rests on it. `zagier_four_everyFamily` (§6.3) does not.
- **Scope.** The main source GR is cited as an arXiv preprint (v5) only, in the README and in `sources.toml`; this and earlier reviews record gaps in its proofs of Theorems 1.3 and 1.13.
- **Scope.** Polylogarithms' scope sentence (its README, line 22) lists "decorated flags" among what this roadmap owns, while its §3.4 states them and the declared gap names §3.4 as supplier; the correction belongs to Polylogarithms.
- **Licence.** G93 is read from the author's page (`sources.toml`, `licence_class = "author-page"`), an OCR of a 1993 volume chapter.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a82b0eb0c7dde37a083f518872b90a60f9b26c6f", "job": "REV-PKG-ZagierConjecturePolylogarithms~7", "model": "fable", "worker": "chris-x90"} -->
