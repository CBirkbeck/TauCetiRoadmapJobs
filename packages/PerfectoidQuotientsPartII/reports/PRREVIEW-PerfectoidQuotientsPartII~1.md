# Review of PerfectoidQuotientsPartII (pull request #2259 at 9f411af)

**Verdict:** needs changes

Five findings, all P3; no statement of `Suggested.lean` was found false, and the gate passes.

## R01 (P3) — Q10.5: the cover enlargement is not needed, and two Checks say it is

**Location:** `TauCetiRoadmap/PerfectoidQuotientsPartII/README.md` lines 1802–1804 and 1837–1839: "a proof that only showed `J`-almost vanishing of the middle `Tor` would conclude annihilation by the image of `J`, not by `c_k`, unless some element of `J` maps to a unit multiple of `c_k`".

**Claim:** False. With `P = (R⁺)^∧` and `J = ker(R_∞ → (R_∞/c)_perfd)`, annihilation by `J` already gives annihilation by `c_k`, for the given cover and with no roots of `c` in it. The same holds for the Check at lines 1824–1836 ("it is the enlarged `R'_∞` that carries `T^{1/pᵏ} ↦ c_k`").

**Witness:** `R = ℤ_p⟦x⟧`, `c = p(x + p)`, cover of Q10.4. `(P/JP)^∧ = P ⊗̂_{R_∞} (R_∞/c)_perfd` is integral perfectoid, so reduced; `c_k^{pᵏ} = c ∈ JP`; hence `c_k ∈ ⋂ₙ (JP + pⁿP)`, which kills the image.

**Repair:** Replace the first paragraph of the proof route by: "Put `P = (R⁺)^∧` and `J = ker(R_∞ → (R_∞/c)_perfd)`. The completion `(P/JP)^∧ = P ⊗̂_{R_∞} (R_∞/c)_perfd` is integral perfectoid (`perfectoid_completed_tensor`, PerfectoidQuotients §0.6), hence reduced (PerfectoidQuotients §0.4). The image of `c_k` in it has `pᵏ`-th power the image of `c ∈ J`, so it is zero: `c_k ∈ JP + pⁿP` for every `n`." In the second paragraph write `R_∞` for `R'_∞`, and end it: "…a submodule killed by `J`; as the map is `R_∞`-linear into a `P/pⁿ`-module, it is killed by `JP + pⁿP`, which contains `c_k`." Delete the sentence "Without the enlargement … containing `c_k`" and the Checks at lines 1824–1839; put in their place: "For `R = ℤ_p`, `p` odd, `R_∞` the completed `ℤ_p^{cycl}` and `c = p`: `J ∋ b_k` with `b_k^{pᵏ} = vp`, and `c_k = p^{1/pᵏ}` is a unit multiple of the image of `b_k`, so `c_k ∈ JP` although `R_∞` contains no `p`-th root of `p`." `*Needs:*` becomes "Q10.3, Q5.4; PerfectoidQuotients §§0.4 and 0.6; PrismaticCohomology §§2.30–2.31; PerfectoidSpaces P0.1–P0.2 and P0.11; Mathlib `CategoryTheory.Tor`, `Module.Flat`".

## R02 (P3) — "How to read the build" understates what Layer Q10 uses

**Location:** `README.md` lines 381–382: "Q10 uses PerfectoidSpaces P4.15.2 and P7, PrismaticCohomology §§2.30–2.31 and Q5.4 for regular local rings."

**Claim:** At this head Q10 also uses Q7 and Q9, so the paragraph disagrees with the layer it describes.

**Witness:** Line 1806: "*Needs:* Q10.3, Q5.4, Q9.1, Q9.2, Q7.4"; line 1883: "*Needs:* Layers Q5, Q7 and Q9".

**Repair:** After R01 the sentence is right; then change line 1883 to "*Needs:* Layer Q5; …". If the enlargement route is kept as a second route, write instead: "Q10 uses PerfectoidSpaces P4.15.2 and P7 and PrismaticCohomology §§2.30–2.31, and for Q10.5 also Q5.4, Q7.4 and Q9.1–Q9.2."

## R03 (P3) — Scope does not say how Q10.2 differs from DirectSummandsAndBigCohenMacaulay §§3.2–3.3

**Location:** `README.md` lines 105–109 ("**Not owned here.**") and line 1608 ("Bhatt Proposition 5.2 with modification (a)").

**Claim:** An earlier roadmap in the merge order states a perfectoid cover of a regular local ring from the same proposition; the scope section, the only place for this, is silent on it.

**Witness:** DirectSummandsAndBigCohenMacaulay (open, merge order line 220) README §3.2, "Perfectoid covers of regular local rings": "(BHATT18, Proposition 5.2 (1) and its proof, pp. 8–9)", with the law "If p ∉ `m_{A₀}`², A₀ → A is faithfully flat".

**Repair:** Add to "Not owned here": "Bhatt's cover of a `p`-torsion-free regular local ring by an integral perfectoid `K°`-algebra, `K = ℚ_p(p^{1/p^∞})^∧`, which is almost faithfully flat and faithfully flat when `p ∉ 𝔪²` (Bhatt Proposition 5.2 (1)–(2)), belongs to DirectSummandsAndBigCohenMacaulay §§3.2–3.3. Q10.2 asks only for an integral perfectoid ring, is faithfully flat in every case and is built by perfecting a prism; neither uses the other."

## R04 (P3) — The pinned syntomic morphisms are attributed to StableReduction only

**Location:** `README.md` lines 74–75: "From StableReduction: syntomic morphisms (Layer 1), whose affine local model is Tau Ceti's `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`", and the Q7.2 API bullet on base change and composition (lines 977–981).

**Claim:** Syntomic morphisms of a fixed relative dimension, with base change and composition, exist at the Tau Ceti pin; the contract does not cite them and Q7.2 does not say that `IsSyntomic` is their variant with the dimension varying by chart.

**Witness:** `TauCeti/AlgebraicGeometry/Morphisms/Syntomic/Basic.lean` lines 47, 83, 120 and 182: `SyntomicOfRelativeDimension`, `syntomicOfRelativeDimension_isStableUnderBaseChange`, `syntomicOfRelativeDimension_comp`, `syntomicOfRelativeDimension_SpecMap_iff`.

**Repair:** Add under "From Tau Ceti": "`TauCeti.AlgebraicGeometry.SyntomicOfRelativeDimension n` (`TauCeti/AlgebraicGeometry/Morphisms/Syntomic/Basic.lean`), with affine form `RingHom.Locally (IsStandardSyntomicOfRelativeDimension n)` (`syntomicOfRelativeDimension_SpecMap_iff`), base change and composition. `IsSyntomic` differs in letting `n` depend on the chart: `ℤ → ℤ × ℤ[x]` is syntomic with charts of dimensions `0` and `1`." Add to the Q7.2 API: "a ring map that is locally standard syntomic of one relative dimension `n` is syntomic."

## R05 (P3) — Q9.5 lists a Mathlib lemma as a fact to prove

**Location:** `README.md` line 1496: "`A` is `p`-Zariski iff `(p : A) ∈ Ideal.jacobson ⊥`"; lines 1488–1489 and the `*Needs:*` at 1491–1492 name no lemma.

**Claim:** This is a pinned Mathlib declaration at `x = p`, and one `simp` reduces the bullet to it.

**Witness:** `Ring.mem_jacobson_iff : x ∈ Ring.jacobson R ↔ ∀ y, IsUnit (x * y + 1)`, `Mathlib/RingTheory/Jacobson/Ideal.lean` line 295; `simp [IsPZariski, Ring.mem_jacobson_iff, add_comm]` closes `IsPZariski p A ↔ (p : A) ∈ Ring.jacobson A` (elaborated on a scratch copy).

**Repair:** Replace the bullet by "`A` is `p`-Zariski iff `(p : A) ∈ Ring.jacobson A`: this is Mathlib `Ring.mem_jacobson_iff` at `x = p` and is cited, not proved here"; add `Ring.mem_jacobson_iff` to the `*Needs:*` line and to "From Mathlib". (`Ideal.mem_jacobson_bot`, the `Ideal.jacobson ⊥` form, is deprecated at the pin.)

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Q5.6 `isIntegralPerfectoid_fibreProduct` | `A' = 0`; `A = B = 𝔽_p[t^{1/p^∞}] → 𝔽_p`; `𝒪_C ×_{k̄} 𝒪_C` | eqLocus is `A × B`; `{a(0) = b(0)}` is perfect; tilt `𝒪_{C♭} ×_{k̄} 𝒪_{C♭}`; CS24 line 472 | holds | none |
| Q6.2 `isAdicComplete_preTilt_iff` | `A' = 𝒪_C × 𝔽̄_p`, `ϖ♭ = (t^{1/p}, 1)` dividing `ξ₀ = (t, 0)`; `ϖ♭ = 0` | tilt: `𝔽̄_p` not `(1)`-separated; ring: `⋂(p^{1/p}, 1)ⁿ = 0 × 𝔽̄_p ≠ 0`; both sides false. Zero ideal: both true | iff holds | none |
| Q6.4 `valuationRing_iff_preTilt` | perfect field `𝔽_p`; `𝒪_C × 𝒪_C` | tilt `≅ 𝔽_p`, both true; neither side a domain, both false | holds | none |
| Q6.4 `untilt_dvd_iff_and_exists_isUnit_mul_untilt` | `x = 0`; `a = 1 + p` in completed `ℤ_p[p^{1/p^∞}]` | `0 ∣ y ⇔ y = 0 ⇔ y♯ = 0` since `yₙ^{pⁿ} = y♯` in a domain; `a = (1 + p)·1♯` | holds | none |
| Q6.7 `isAlgClosed_fractionRing_iff` | `pA = 0`; completed `ℤ_p[p^{1/p^∞}]`, `p` odd; height of `√(pV)` | `A = A♭`; `X² − u` rootless (residue field `𝔽_p`), both false; `⋂pⁿV = 0` is the largest prime without `p` | holds | none |
| Q6.8, three theorems | `A = 𝔽_p`, `ϖ = 0`, roots `0`; `A = 0` | `Ã` completed `ℤ_p[p^{1/p^∞}]`, `ϖ̃ = p^{1/p}`, `ϖ̃^p = p`, regular, roots `p^{1/p^{n+1}} ↦ 0`; `Ã = 0` | holds | none |
| Q8.3 `exists_approximation` | `m = 0`; trivial valuation on `A/𝔭`, `ϖ ∈ 𝔭`; `pA = 0` | bound `v(p)·max(v(a'♯), 1) = v(p)`; bound `0`, and `a − a'♯ ∈ pA ⊆ 𝔭`; `a' = a` | holds; CS24 lines 895–900 | none |
| Q8.4 `isTopologicallyNilpotent_iff_forall_lt_one` | zero ring; `ℚ_p⟨T⟩`, `a = T`; rank-two `v` with `v(T) = 1` | no valuation, `0` nilpotent, both true; Gauss `v(T) = 1`, `T` not nilpotent; coarsening by `1 × γ^ℤ` is Gauss, real-valued | holds for every universe of value groups | none |
| Q9.3 `exists_indSyntomic_andre` | `A = 0`; `A` perfect, `ϖ = 0`; `P = 1`; `𝒪_C` | all zero; `0`-divisible forces `I' = 0`, completion is `A'`; excluded by `0 < natDegree`; `A' = A`, `I' = 0` | holds; CS24 lines 1004–1010 | none |
| Q9.6 `exists_semiperfectoid_cover` | `A = 𝔽_p`; `A = ℤ`; `A = 0` | `A' = ℤ̄_p/p`, `A'_red = 𝔽̄_p`, `Ã = ℤ̄_p`; `1 + p` not a unit, hypothesis fails; zero | holds | none |
| Q10.2 `exists_faithfullyFlat_isIntegralPerfectoid` | `R = ℤ_p`; a field of characteristic `p`; prism `(ℤ_p, (p))` | `f = p − x₁`, `a₀ = 1`, cover completed `ℤ_p[p^{1/p^∞}]`; perfect closure; quotient `𝔽_p`, not flat, excluded by `d = dim R` variables | holds | R03 |
| Q10.4 `…_injective_completion` | `R = ℤ_p`; `k = 𝔽_p(t)`, `d = 2`; `f = p² − x₁` | `R_n = ℤ_p[p^{1/pⁿ}]`, rank `pⁿ`; rank `pⁿ·p^{2n} = p^{3n}`; `φ(f) = p² − x₁^p ∈ 𝔪²`, excluded by the normalisation | holds | none |
| Q10.5 `tor_map_mul_root_eq_zero_of_cover` | `c = 0`; `S = R`; `i = 0`, `R = S = ℤ_p`, `c = p`; `c = p(x + p)` | `c_k = 0`; source `0`; `1 ↦ p^{1/p} ≠ 0` in `R⁺/p` (valuation `1/p < 1`); `c_k ∈ JP + pⁿP` without enlargement | statement holds; route overstated | R01, R02 |
| Q10.6 `tor_map_mul_root_eq_zero` | `R = ℤ_p⟦x⟧`, `S = R ⊕ 𝔪√x`, `c = px`; `dim R = 1` | source `Tor₁ ≅ Tor₂^R(k, k) = k ≠ 0`, so not vacuous; `S` free, source `0`; HM17 lines 65–70 assume `F`-finite | holds | none |
| Q7.2 `IsSyntomic`, `IsIndSyntomic` | zero algebra; `ℤ → ℤ × ℤ[x]`; `S = 0` | `s = ∅`, `span ∅ = ⊤` (elaborated); charts of dimensions `0`, `1`, so not `Locally` of one `n`; factors through `T = 0` | definitions as described | R04 |
| Q9.5 `IsPZariski` | `ZMod p`; `ℤ`, `p = 2`; Jacobson form | true; false, `1 + 2 = 3` not a unit (both elaborated); one `simp` with `Ring.mem_jacobson_iff` | definition right | R05 |

- Source locators checked against the cached texts: about 70 (CS24 about 30, Stacks 18 tags, BMS1 6, BS22 6, Wedhorn 4, Bha18 3, Ces19 3, Sch12 2, HM17 1); all 16 README theorems, which contain the seeded sample, agree with their sources in number, page and hypotheses.
- Library declarations opened at the pins: 51 named in the contracts, all found, among them `TauCeti/RingTheory/Perfectoid/Integral.lean:76`, `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:90`, `TauCeti/RingTheory/Valuation/Continuous/Basic.lean:129`, `TauCeti/RingTheory/Huber/Basic.lean:163` and `:213`, `Mathlib/RingTheory/Teichmuller.lean:195`. No pinned declaration states a `Suggested.lean` theorem.
- Cross-roadmap citations resolved: PerfectoidQuotients (23 identifiers, §§0.2–0.6, 1.2, 1.4, at its open head), PerfectoidSpaces (15 sections and 8 names, main), PrismaticCohomology §§0.61–0.63, 0.79, 0.83–0.84, 2.30–2.31, EnhancedDerivedSheaves §E1.6, DerivedDeRhamCohomology §1.10, DeformationAndDerivedPatchingAlgebra §1.10, StableReduction Layer 1; the consumers' sections (EtaleDualityAndPerverseSheavesPartII §§8.1–8.5, ArcTopologyAndDescent §12.6) exist. The three names of the worker's citation list are declarations of open suppliers, not of the pins.
- Gate at this head: every check passed. Dependency check: `depcheck: 213 roadmaps, 1891 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 16 `sorry` warnings and nothing else. One-tactic probe on a scratch copy: none of the 16 theorems closes. The 19 elaborated signatures were compared with the README statements: no binder lost, nothing changed. No headline statable at the pins is absent; the relative tilting equivalence (Q6.1) is named in the docstring.
- Pull request text read against the head: no sentence contradicted; it adds the roadmap and names the four open suppliers.
- PurityForFlatCohomology (open) declares `gap:regular-tower-tilt` on §Q10.1, the tilt of the completed tower of PerfectoidSpaces P7.17; this head does not state it.
- Overlap check: read PerfectoidQuotients, DirectSummandsAndBigCohenMacaulay, PrismaticCohomology, PurityForFlatCohomology, PrismaticCohomologyPartIII, PerfectoidSpaces, AdicEtaleGeometry, SchemeAndStackFoundations; perfectoid covers of regular local rings are shared with DirectSummandsAndBigCohenMacaulay §§3.2–3.3 as two different statements, each with its own owner (R03); nothing else shared.

Source independence: 9 passages compared with 3 sources, and every 7-word run of the README and of `Suggested.lean` searched in 8 cached texts, none reproduced beyond clauses of theorem statements (longest 11 words); largest share CS24, about 60 of 141 locators; contents compared with CS24: independent (Q5 and Q6 split its §2.1 and omit 2.1.3, 2.1.6–2.1.8 and 2.1.11; Q7 precedes Q8 where the source has 2.3.3 after 2.3.1–2.3.2; Q10 is not from it; the order Q5 → Q6 → Q9 is forced by the `*Needs:*` lines of Q6.2, Q6.8 and Q9.3).

## Not verifiable

- Stacks Lemma 15.32.2 as the number of tag 0BIQ: the cached Stacks text is the Commutative Algebra chapter only; the tag itself is the one CS24 line 1080 cites.
- Scholze Corollary 6.7 (i), named in Q8.3 as the model of the approximation lemma: not opened; nothing is derived from it.

## Source issues

- **Misprint** in CS24 at proof of Corollary 2.3.7, p. 29: the source says that part (d) of Proposition 2.1.11, on products, gives perfectoidness of the completion of the reduced quotient; it should be part (c), on quotients by root-stable sets; affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, p. 25, and Corollary 2.3.7, p. 28: the source says every monic polynomial acquires a root; it should be every monic polynomial of positive degree, since the constant `1` has no root in a nonzero ring; affects nothing.
- **Gap** in BS22 at Remark 10.13, p. 83: the source says Remark 3.11 gives, for every complete regular local ring of mixed characteristic, a faithfully flat perfectoid cover inside the completed absolute integral closure; it should assume an `F`-finite residue field, as HM17 Theorem 1.3 does, and construct the map; affects the proof.

## For the human reviewers

- Wording: the Q5.5 proof route (README line 564) shares a 9-word run with CS24 line 475, and the docstring of `exists_indSyntomic_andre` an 11-word run with the statement at CS24 line 1009; neither was raised as a finding.
- Licence: `Wedhorn` is cited from an arXiv text (1910.05934v1) with no journal reference, and `HM17` from arXiv 1708.05761v3 with no journal named in the README.
