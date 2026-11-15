<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6900577481 -->
Review (claude) of af5090e

Verdict: needs_changes

1. **F01** (P3) sheaf criteria used in 3.1–3.3 are owned by a supplier that is not cited for them

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`:

   - 3.1, definition, line 429: "Define fpqc sheaves and hypercomplete fpqc sheaves in `PreStk_T` as the functors that carry finite products of test rings to products and satisfy descent for Čech nerves, respectively for all flat hypercovers";
   - 3.1, API, line 436: "Hypercomplete fpqc sheaves form an ∞-topos, a left exact localization of fpqc sheaves (HypercompletenessAndCoherence §1.2.1)";
   - 3.1, API, line 437 (added by the last repair): "A sieve on R covers exactly when it contains an fpqc cover of R … (SAG Proposition A.3.2.1, pp. 1764–1765)";
   - 3.1, API, line 438: the universal property, cited to SAG Proposition 1.3.1.7 with its own route;
   - 3.2, route step (3), line 453: "Čech descent implies hyperdescent (HTT Lemma 6.5.2.9 …)".

   **Claim:** every input of these passages is a target, a named supplier section or a pinned declaration.

   **Witness:** the supplier sections cited (§1.2.1, §6.1.1; InfinityTopoi §§8.4.1, 9.2.3) concern sieve-defined sheaves and the hypercomplete objects of an ∞-topos. The design defines its sheaves by finite products and Čech or flat-hypercover descent. The identification of the two is SAG Propositions A.3.3.1 and A.5.7.2 (SAG lines 64326 and 65851), named nowhere. HypercompletenessAndCoherence states all four results at its open head: §9.3.2 (A.3.2.1), §9.4.1 (A.3.3.1), §11.5.1–§11.5.3 (A.5.7.1, A.5.7.2), §4.2.1 (1.3.1.7).

   **Exact repair:** the owner is already a contracted supplier, so only citations change.

   1. In `### From TauCetiRoadmap.InfinityCategoryTheory`, extend the HypercompletenessAndCoherence bullet: "§9.3.2: a class S of morphisms satisfying conditions (a)–(d) generates the topology whose covering sieves are those containing a finite family `{C_i → C}` with `⊔ C_i → C` in S (SAG Proposition A.3.2.1); 3.1 applies it to `T^op` with S the faithfully flat maps. §9.4.1: when coproducts are moreover disjoint, the sheaves for that topology are the functors that preserve finite products and satisfy Čech descent along S (SAG Proposition A.3.3.1). §11.5.1–§11.5.3: S-hypercoverings, hypercomplete D-valued sheaves, and the criterion that these are the functors preserving finite products and carrying S-hypercoverings to limit diagrams (SAG Definition A.5.7.1 and Proposition A.5.7.2). §4.2.1: C-valued sheaves on `Shv(T)` and on T agree (SAG Proposition 1.3.1.7). All are applied in the universe u+1 to `T^op`."
   2. In 3.1, after the definition, add: "By HypercompletenessAndCoherence §9.4.1 and §11.5.3 these are the sheaves for the topology of §9.3.2 and the hypercomplete objects among them; coproducts of `T^op` are disjoint, `Spec A ×_{Spec(A × B)} Spec B = Spec 0` being initial." In the local lifting bullet cite "HypercompletenessAndCoherence §9.3.2 (SAG Proposition A.3.2.1, pp. 1764–1765)". In the universal-property bullet cite §4.2.1, with §11.5.2–§11.5.3 for the hypercomplete case, in place of the restated route.
   3. In 3.2, step (3), add "and a hypercomplete sheaf valued in (n+1)-categories satisfies descent for flat hypercovers (HypercompletenessAndCoherence §11.5.3)".
   4. Add §§4.2.1, 9.3.2, 9.4.1, 11.5.1–11.5.3 to the *Needs* of 3.1, §11.5.3 to the *Needs* of 3.2, and all of them to the Scope list, the Layer 3 Dependencies, and the plan's HypercompletenessAndCoherence supplier entry and prerequisites. Line 166 uses §1.1.1 ("§1.2.1, with §1.1.1"); add §1.1.1 to the same lists. Add Proposition A.3.3.1, Definition A.5.7.1 and Proposition A.5.7.2 to the manifest's SAG locator.

   Tested on the witness. Hypotheses (a)–(d) were checked in the last repair report. Hypothesis (e): for test rings A and B, `A ⊗_{A × B} B = 0` in all three contexts, the two factors being the localizations at complementary idempotents, and `Spec 0` is initial in `T^op`. With §9.4.1, `Mod` (finite products by 1.2, Čech descent by 3.2 step (2)) is a sheaf for the sieve topology, so HTT Lemma 6.2.2.16 applies to it. With §11.5.3 the truncated sheaf of step (3) has flat hyperdescent. The dependency gate is unaffected, the Part being a supplier already.

2. **F02** (P3) 3.1 carries only Čech nerves through ι, while 3.2 and 3.3 use all flat hypercovers in the classical context

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, 3.1, API, line 433: "ι and θ carry fpqc covers to fpqc covers and Čech nerves of faithfully flat maps to Čech nerves, since for a flat map the ordinary and derived pushouts agree (1.1)"; 3.2, line 451: "Through θ and θι the same holds for `AnRing` and `CRing`".

   **Claim:** hyperdescent for flat hypercovers of `CAlg^cn` gives hyperdescent for flat hypercovers of `CRing`, whose latching objects are formed with ordinary tensor products.

   **Witness:** the API bullet covers Čech nerves only. θ preserves colimits, so it preserves latching objects. ι does not preserve pushouts (1.1's Check: `𝔽_p ⊗_ℤ 𝔽_p`), and the latching object `L_n` is a colimit over a punctured cube, not one pushout. No sentence says that ι carries flat hypercovers to flat hypercovers.

   **Exact repair:** in the 3.1 bullet, after "Čech nerves", add: "and flat hypercovers to flat hypercovers: the latching object `L_n` is built from the `A_m`, `m < n`, by successive pushouts along base changes of the lower latching maps, which are flat, so by induction on n the ordinary and derived latching objects agree". Mirror it in the plan's 3.1 `stability` entry.

   Tested. For `n = 1`, `L_1 = A_0 ⊗_A A_0` and `Tor_i^A(A_0, A_0) = 0` for `i > 0`, `A → A_0` being flat. For `n = 2`, the colimit over the proper subsets of `{0, 1, 2}` is reached by adjoining the three two-element subsets one at a time, each step a pushout along a base change of the flat `L_1 → A_1`. The statement would fail without the flatness of lower latching maps: for the constant-in-degree-0 diagram `ℤ → 𝔽_p`, the derived `L_1` is `𝔽_p ⊗ᴸ_ℤ 𝔽_p`, with `π₁ = 𝔽_p`, and the ordinary one is `𝔽_p`; that diagram is not a flat hypercover, as 3.2's Check says.

3. **F03** (P3) manifest `cited_for` and one plan locator trail the round-12 citations

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/sources.toml`, entries `Stacks` and `HTT`; `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`, target 3.4, `locator`.

   **Claim:** each entry's `cited_for` lists the sections that cite the work.

   **Witness:** README line 490 (3.4 route) cites "Stacks, Descent, Lemma 35.13.7, tag 023Q", and `Stacks.cited_for` has no "3.4". README line 484 (3.3 *Needs*) cites "HTT Proposition 6.2.3.4", and `HTT.cited_for` has no "3.3". The plan's 3.4 locator names GR-I and SAG only.

   **Exact repair:** add "3.4" to `Stacks.cited_for` and "3.3" to `HTT.cited_for`; append "Stacks, Descent, Lemma 35.13.7 (tag 023Q)" to the plan's 3.4 locator. Tested by script: after these two additions every section's cited works equal the manifest's lists (SGA1 is cited for 8.4 in the supplier contract, which is correct as recorded).

Both findings of the round-11 review are repaired. This round finds no P1 and no P2. It has three P3 findings (R01–R03), all citation or bookkeeping repairs; each is a repair to apply, so the verdict asks for changes. The two declared supplier gaps are stated contracts and are not findings: `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16). No maintainer notes were supplied. This review changed neither the design, the plan nor the manifest.

## Verified sound

### Findings of the previous review

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) effective epimorphisms and universal colimits with no supplier section | repaired, applied differently | 3.1, line 437: "the sheafification `L u` is an effective epimorphism of fpqc sheaves exactly when every point `Spec R → F` lifts to F′, up to homotopy, after some fpqc cover". 3.3 (line 476), 3.4 (line 490), 6.2 (line 647) and 7.1 (line 706) cite it; 4.1 (line 519) cites InfinityTopoi §3.3.2. The fixer's reason for departing from the suggested citations holds: HTT Lemma 6.2.4.5 (HTT line 27932) gives only "local lifts imply effective epimorphism", and 6.2 and 7.1 need the converse. I re-derived the converse (below) and read every cited supplier section at the open head. One input of the new passage is still unnamed: R01. |
| F02 (P3) 6.1 locator for the tensor structure of the connective part | repaired | 6.1, line 633: "(SAG Example 6.2.5.7, p. 495, for colimits and extensions; the paragraph preceding SAG Proposition 6.2.6.3, p. 497, for the unit, tensor products and the symmetric monoidal structure)". SAG lines 18011–18016 and 18085–18087 say exactly this; the plan's 6.1 locator agrees. |

No finding of the repair report is marked "not actionable", so nothing is re-raised. The repaired pattern (a route input with no supplier section) was searched in the whole README: every other source theorem used as an input is a target here (1.5: HA 4.7.4.18, 4.7.5.2) or carries its supplier section (HA 1.4.4.11, HA 1.3.3.2, HTT 5.1.5.6, 5.5.4.20, 6.5.2.9, 6.5.3.11–13); the exceptions are R01.

### Adversarial pass

Values computed by hand this round. Rows cover the passages the last repair changed, the fifteen sampled targets, the headline theorems and the three findings.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.1 local lifting, "only if" (changed) | `u = id`; `∅ → Spec R`; unit `F → L F` | sieve of lifts is maximal; sieve is empty, covering iff the empty family covers R iff `R = 0`, so `L u` is an effective epimorphism only for `R = 0` (`L∅ = Spec 0`); `L(unit)` is an equivalence, so points of `L F` lift locally | holds |
| 3.1 local lifting, route | image of `P → Spec R` | `P → im → Spec R`; L left exact and colimit-preserving keeps both halves; the composite `L P → L Spec R` is an effective epimorphism, so is the monomorphism `L(im) → L Spec R` (HTT Corollary 6.2.3.12), hence an equivalence; HTT Lemma 6.2.2.16 then says the sieve covers | holds, given R01's identification |
| 3.1 local lifting, hypercomplete case | `Spec ℤ → B(ℤ/2)`; a (−1)-truncated map | `τ≤0` of both is the identity of the final object; a monomorphism inverted by hypercompletion is ∞-connective and truncated, so an equivalence, agreeing with the `τ≤0` argument | holds |
| 3.1 new Check | `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ` | a nonzero `𝔽_p`-algebra has p-torsion, not flat over ℤ; so all nonzero `R_i` are `ℤ[1/p]`-algebras and `𝔽_p ⊗ ∏R_i = 0` | not an effective epimorphism, as stated |
| 3.1 topology (R01) | hypothesis (e) on `A × B`; empty family | `A ⊗_{A×B} B = 0`; `0 → ∏_∅ = 0` faithfully flat, `ℤ → 0` not | criteria apply in all three contexts |
| 3.1 and 3.2, flat hypercovers through ι (R02) | `L_1`, `L_2` of a flat hypercover; `ℤ → 𝔽_p` | `Tor_i^A(A_0, A_0) = 0`, `i > 0`; `L_2` by three pushouts along base changes of `L_1 → A_1`; derived `𝔽_p ⊗ᴸ 𝔽_p` has `π₁ = 𝔽_p` | true, unstated |
| 3.2 flat hyperdescent (headline) | `A → A`; `ℤ → 𝔽_p`; `A = 0` | constant nerve; `ℚ ⊗ᴸ 𝔽_p = 0`, not conservative; `Mod_0 = 0` on both sides | sound |
| 3.3(c) route (changed, headline) | `Spec 𝔽_p → Spec ℤ`; `Spec ℤ[1/2] ⊔ Spec ℤ[1/3] → Spec ℤ`; `∅ → Spec 0` | image `{R : p = 0}`, no local lift of id; image `{R : 2 or 3 invertible}`, lifts on the cover; image ∅, lifts on the empty cover | sound |
| 3.4 (sample; route changed) | empty scheme; doubled plane, `R = k[x,y,a,b]/(ax+by−1)`; `h_W` | only affine open `Spec 0`, limit `Mod_0 = 0`; fibre two points, contractible on `D(x)`, `D(y)`, and `ax + by = 1` makes `R → R_x × R_y` faithfully flat; representables are fpqc sheaves (Stacks Descent line 1906) | sound |
| 4.1 universality (changed) | `X = ∅`; `X = Spec A` | empty colimit, `Y = ∅`; initial point gives `Y = Spec f_id` | sound |
| 4.2 pushforward (sample, headline) | `Spec 0 → Spec R`; `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice | `f_* 0 = 0`; `R[t]`, base change `R′[t]`; `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`) against `𝔽_p`, so flatness is needed classically | sound |
| 1.3 t-structure and flatness (sample) | `A = 0`; `N = ℚ`, `ℤ[x]`, `𝔽_p` with `M = 𝔽_p` over ℤ | heart `ModuleCat 0`, `A → 0` flat and faithfully flat only for `A = 0`; `π_n = 0 = 𝔽_p ⊗ ℚ`; `π₀ = 𝔽_p[x]`; `π₁(𝔽_p ⊗ᴸ 𝔽_p) = 𝔽_p ≠ π₁M ⊗ π₀N = 0` | sound; flatness of N is used |
| 1.4 finiteness (sample) | `A = 0`; `ℤ[1]`; k over `k[ε]/ε²` base-changed to k; k over `k[x₁, …]` | zero module perfect and locally free; dual `ℤ[−1]` not connective, not a summand of `ℤⁿ`; `π_i = k` for all `i ≥ 0`, almost perfect and not perfect; `π₀ = A/𝔪`, 𝔪 not finitely generated | sound |
| 2.2 and 2.3 (sample) | ∅; `Spec 0`; `Spec A ⊔ Spec B`; `BΓ × Spec 𝔽₂` | terminal category; `Mod_0 = 0`; `Mod_A × Mod_B`; `π₀Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂` with every evaluation in `π₋₁A = 0` | sound |
| 5.2 Zariski descent of `Dqc` (sample) | `τ^{≥−m}K`; empty scheme; `j_!O` on a DVR | `H^q` constant for `m ≥ −q`, transitions onto 0 or isomorphisms, so Stacks 0A0J applies; `Dqc(∅) = 0`; stalk 0 at the closed point | sound |
| 5.3 schemes (headline) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `∏_ℕ D∞(ℤ)` both sides; `H¹(O(−2)) = k·t⁻¹` | sound |
| 6.1 pointwise properties (sample) | `Spec 0`; flat on `Spec ℤ`; local freeness under 2.8.4.2 | every object has P; `⊕_ℕ O` flat, not perfect; local freeness = flat + almost perfect (SAG Remark 2.9.1.2), items (6) and (9) of the list | sound |
| 6.2(a) route (changed) | empty index set; `Spec A ⊔ Spec B` in sheaves | `L^hyp ∅ = Spec 0`; id of `A × B` lifts to the presheaf coproduct only on `{A × B → A, A × B → B}` | sound |
| 6.3 perfect = dualizable (headline) | `O[1]`; `O²`; `ℤ/p` | inverse `O[−1]`; rank 4 → 1; dual `ℤ/p[−1]` not connective | sound |
| 6.4 almost perfect (sample) | k on `Spec k[ε]/ε²`; `⊕_ℕ O` on `Spec ℤ`; `ℤ/p` | finite free in each degree, `Tor_i = k` for all i; id does not factor through a finite subsum; `D⁻_coh` (Stacks 08E8) | sound |
| 7.1 atlas (changed) | `G = 1`, `X = ∅`; `ℤ/2`, `R = ℝ`, torsor `Spec ℂ`; `O(G) = ℤ × 𝔽_ℓ` | `[∅/1] = Spec 0`; no lift at ℝ, lift after `ℝ → ℂ`; `Tor₁^ℤ(𝔽_ℓ, 𝔽_ℓ) = 𝔽_ℓ`, atlas surjective and not flat | sound |
| 7.2 realizations (sample) | `G = 1`; constant `ℤ/2` over `𝔽₂`; translation action | `QCoh(X)`; `H¹ = 𝔽₂`; Čech nerve of the split `G → S`, limit `QCoh(S)` | sound |
| 7.3 discrete quotients (sample, headline) | Γ trivial; ℤ trivial on `Spec C`; `S₃` trivial on `Spec ℚ` and `Spec 𝔽₂`; `σ(x) = 2x` | `QCoh(X)`; `H¹(ℤ; C) = C`; irreducibles of dimensions 1, 1, 2 (1 + 1 + 4 = 6), `Hⁱ = 0` over ℚ, `H¹(S₃; 𝔽₂) = Hom(S₃, 𝔽₂) = 𝔽₂`; `id(x·1) = x ≠ 2x` | sound |
| 8.1 qcqs schemes (sample) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `⊕_i O_i = O`, `Hom(O, O) = ∏ℤ ≠ ⊕ℤ`; `O ⊕ O(−1)` | sound; quasi-compactness used |
| 8.2 perfect stacks (headline) | `Spec 𝔽₂`, `Map(O, 0 ⊕ 0)`; `BG_m` | one point against two; weight-n part preserves colimits | sound |
| 8.3 permanence (sample, headline) | (a) `Spec 0 → X`; (b) `I = ∅`; (d) `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p`; adjoint in the Ind step | `QCoh = 0 = Ind(0)`; forces every `Y_η = ∅`, `Y` with zero `QCoh`; animated: `Spec(𝔽_p ⊗ᴸ 𝔽_p)`, affine, perfect; classical: hypothesis (flat) fails, nothing claimed; `Map(f^*M ⊗ L^{−n}, N) = Map(M, f_*(L^n ⊗ N))` is u-small, X being presentable, so the right adjoint exists | sound |
| 8.4 characteristic zero (sample, headline) | `G = 1`; `G = G_a ⊂ GL₂`; `BG_m`, `M = O[1]`; unbounded M on `BGL_n` | X qcqs with affine diagonal (8.1); quotient quasi-affine; `π₀Map = 0`, `π₁ = ℚ`; `π_i RΓ(τ_{≤n}M) = (π_i M)^G` for `i ≤ n`, stable in n | sound, conditional on the gaps |
| 8.5 (headline) | `ℤ/p` over `𝔽_p`; `S₃` over `𝔽₃` | `Hⁱ = 𝔽_p` for all i, `⊕ → ∏` not onto; `H¹ = H² = 0` trivial coefficients, coinduced witness `Hⁱ = 𝔽₃` | sound |
| gap:twist-quasiprojective | P trivial; `G = 1` | `X_R` with pulled-back L; `X_R` | precise, one statement, not provided by §1.16 |
| gap:chevalley-quasiprojective-quotient | `H = GL_n`; `H = 1` | a point; `GL_n`, affine | precise, one statement, not provided |

### Sources: the seeded sample

No locator is flagged unverified in the plan. Every sampled target was read at its locators in the cached texts; the Stacks chapters *Morphisms of Schemes* and *Descent* were fetched through the sources service (the manifest entry `Stacks` was kept unchanged; checksum compared before and after).

| Target | Locators read | Result |
| --- | --- | --- |
| 1.3 | HA lines 47511–47518 (Definition 7.2.2.10, Remark 7.2.2.12, p. 1240), 46134–46143 (Proposition 7.1.1.13, p. 1202), 47519 (Proposition 7.2.2.13, p. 1240), 47532–47540 (Theorem 7.2.2.15, pp. 1240–1241), 6013 (Proposition 1.4.4.11, p. 160), 47387 (Proposition 7.2.1.19, p. 1236) | match |
| 1.4 | HA lines 48274 (p. 1260), 48281, 48357 (pp. 1261, 1263), 48428–48441 (p. 1265), 48556 (p. 1268); SAG lines 10004–10009 (p. 277), 10022 (p. 278), 17974–17989 (pp. 494–495); BZFN line 830 (p. 17) | match |
| 2.2 | SAG lines 17835–17843 (pp. 490–491), 17859 (p. 491), 18068 (p. 497) | match |
| 2.3 | SAG lines 17905–17914 (pp. 492–493), 17758 (p. 488) | match |
| 3.1 | SAG lines 79377–79382 (pp. 2173–2174), 79403–79409 (p. 2174), 64259–64283 (pp. 1764–1765), 4184 (p. 117); HTT lines 27258 (PDF p. 601), 27696, 27932, 27376, 27439, 27523, 27540, 27611, 17740, 23487, 31139, 33572 | match |
| 3.4 | GR-I line 7572 (printed p. 149); SAG line 17912 (p. 493); Stacks Descent line 1906 (tag 023Q); HTT lines 31671, 31680 (PDF p. 698) | match |
| 4.2 | SAG line 18368 (p. 505); GR-I line 7740 (printed p. 153) | match |
| 5.2 | Stacks lines 86–99 (0A0J), 102 (08D3) | match |
| 6.1 | SAG lines 17990–18016 (p. 495), 18085–18087 (p. 497), 9916–9930 (p. 275) | match |
| 6.4 | SAG line 26798 (Proposition 9.1.5.1, p. 736, for quasi-geometric stacks, wider than 6.2's geometric ones); HA lines 48432, 48556; Stacks line 1059 (08E8) | match |
| 7.2 | SAG line 17889 (p. 492); GR-I lines 7463, 7474 (printed p. 147) | match |
| 7.3 | GR-I line 7463 (printed p. 147) | match |
| 8.1 | Stacks lines 1806 (09IS), 1969 (09M1); SAG line 29408 (p. 807) | match |
| 8.3 | BZFN lines 1149 (p. 23), 1189, 1209 (p. 24), 1216 (p. 25), 939 (§3.1.2); Stacks Morphisms lines 999–1010 (0FXR), 1011 (0FXS), 1019–1028 (0FXT); Stacks lines 1897–1914 (0BQR, whose proof uses quasi-compactness, affine diagonal and the affine loci `X_s` only, as the route says) | match |
| 8.4 | BZFN lines 1200–1208 (p. 24); SGA1 line 6972 (Exposé VIII, Proposition 7.8, PDF p. 190 = printed p. 174) | match |

Every cited work is in the manifest (nine entries, all `certified`). No reference request was written.

### Pins, suppliers and ownership

Lean elaboration: not available (this lane does not elaborate). The design has no `Suggested.lean`, so there is nothing to probe or `#check`.

Library declarations opened at the pins, each at the file and line the README gives (21 Mathlib, 1 Tau Ceti, all present): `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) and its instance (Quasicategory/Nerve.lean:32), `AlgebraicGeometry.Spec` and `Scheme.Spec` (Scheme.lean:466, 494), `fpqcPrecoverage`, `fpqcTopology` (Sites/Fpqc.lean:61, 76), `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64), `DerivedCategory` (Basic.lean:87), `TStructure.t` (TStructure.lean:33), `Pseudofunctor.IsStack` (IsStack.lean:49), `DescentData` (DescentData.lean:59), `CoGrothendieck` (Bicategory/Grothendieck.lean:235), `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `coindIso` (Shapiro.lean:58), `groupCohomologyIsoEven`, `groupCohomologyIsoOdd` (FiniteCyclic.lean:80, 114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491), and Tau Ceti `exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212, `[Field k]`, `[LocallyOfFiniteType G.obj.X.hom]`).

Supplier citations resolved this round, at the open head of the InfinityCategoryTheory family:

- InfinityTopoi §3.3.2 (universal colimits, HTT 6.1.3.10), §7.1.1, §7.3.1, §7.3.4, §7.4.1, §7.4.2, §7.5.1, §7.6.1, §14.1.1: each present with the content the contract states. §8.4.1 has the "Injectivity" step with HTT Lemma 6.2.2.16; §9.1.1 the step "Covering sieves as images" with HTT Lemma 6.2.3.18; §9.2.3 the step "Local lifting", stated there for any Grothendieck topology, with HTT Lemma 6.2.4.5.
- HypercompletenessAndCoherence §1.1.1, §1.2.1 (left exactness of the hypercompletion is stated at the end of §1.2), §2.4.1, §2.5.1, §2.5.2, §6.1.1; PresentableInfinityCategories §4.4.2, §6.2.3: present.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. For the suppliers on main and the other open suppliers (EnhancedDerivedSheaves, SchemeAndStackFoundations, DerivedModuleAlgebra, ReductiveGroups, PrismaticCohomologyPartII, LanglandsParameterStacks, HabiroCohomologyFoundations) I rely on that resolver run and on the round-11 rows, their citations being unchanged since.

`scratch/overlaps.md` lists no competing pull request, no dropped id, no id defined only by a revision and no second copy.

Ownership, searched by object at the open heads and on main: "perfect stack" occurs in no other roadmap; SAG Theorem D.6.3.1 and "flat hyperdescent" occur only in LanglandsParameterStacks §1.7 (Čech descent for animated rings, cited and extended here); SAG Proposition 6.2.4.1 in none. The local lifting criterion of 3.1 is stated nowhere else as a target. The sheaf criteria of R01 are owned by HypercompletenessAndCoherence. Ownership against pull requests outside the tools' index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), AnalyticStacks, InfinityTopoi and HypercompletenessAndCoherence of the InfinityCategoryTheory family; shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4, cited by both; general ∞-topos theory and the Čech and hypercomplete sheaf criteria — owner the InfinityCategoryTheory family, cited (R01 adds sections); abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations, cited.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has 33 targets, each with a locator and 3 to 6 tests; its supplier entries and the prerequisites of 3.1, 3.3, 3.4 and 6.1 agree with the README's *Needs* lines.

- `gap:twist-quasiprojective`: same slug in the README (line 135) and the plan; supplier SchemeAndStackFoundations §1.16; one `needs` sentence with all hypotheses.
- `gap:chevalley-quasiprojective-quotient`: same slug in the README (line 180) and the plan; supplier ReductiveGroups Layer 3; one `needs` sentence.

### Shape, principles, headlines

- The README has the required parts in order. All 33 subsections have a `**Checks.**` list of at least three bullets (counted by script: 3 to 6) and a *Needs* line; all 8 layers end with Examples and Dependencies.
- Regex scan: no LaTeX delimiters, process words, pull-request numbers, machine paths or `set_option`; "lemma" occurs only in "Shapiro's lemma" and in source locators.
- No algorithm, no sorry'd data, no route-specific shortcut. The README does not say it follows a source, and no layer is named after a source's chapter.
- Headline theorems (from the Summary): flat hyperdescent (3.2) with sheafification invariance and Čech descent (3.3); affine pushforward with base change and projection formula (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). None is statable at the pins without the suppliers' ∞-categorical carriers; the package stage decides the Lean file.

Source independence: 41 passages compared with 8 sources (HA lines 46134, 47511, 47532, 48274, 48428, 48432, 48556; SAG lines 4184, 9916, 17974, 17990, 18011, 18085, 26798, 29408, 64259, 79377, 79403; HTT lines 27258, 27696, 27932, 33572; GR-I lines 7463, 7474, 7740; BZFN lines 834, 970, 1149, 1189, 1200; Stacks lines 86, 102, 999, 1011, 1019, 1059, 1806, 1897, 1906, 1969; SGA1 line 6972), none shared beyond what a definition forces (at most nine consecutive words, in the criterion of 8.2 against BZFN line 972); largest share HTT, about 55 of 184 locators by a pattern count, nearly all in the supplier contracts and *Needs* lines, then SAG, about 50; contents compared with HTT Chapters 1–7 and with SAG §§6.2.1–6.2.6, 6.3 and 9.1: independent. No layer corresponds to an HTT chapter. Against SAG: Layer 1 draws on HA; Layer 2 joins SAG 6.2.2 with parts of 6.2.3 and 6.2.6 and its own 2.4–2.5; Layer 4 (SAG 6.3) precedes Layer 5 (SAG 6.2.4) because 5.4 needs 4.2; Layer 6 joins 6.2.5, 6.2.6 and 9.1; Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests were read at the heads of the index of 2026-11-15; they can move before they merge.
- Targets outside this round's sample whose text no repair touched (1.1, 1.2, 1.5, 2.1, 2.4, 2.5, 5.1, 5.4, 7.4) were read in full, but their source locators were not reopened; for them I rely on the round-11 rows that carry computed values and line numbers. The Stacks chapter *Sheaves on Algebraic Stacks* (tags 06WG, 06WT, cited in 7.4, outside the sample) was not reopened.

## Source issues

- none

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "af5090e0ea6e0d8656d2f4bc0b5e9d91b6675c72", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~12", "model": "fable", "worker": "chris-x91"} -->
