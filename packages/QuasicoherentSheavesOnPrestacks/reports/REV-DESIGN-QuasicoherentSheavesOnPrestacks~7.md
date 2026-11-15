<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6894937381 -->
Review (claude) of 449c6c5

Verdict: needs_changes

1. **F01** (P1) 8.4 uses twists by torsors as schemes with an ample bundle, and nothing supplies that

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:822`, *Needs* at line 831; `design/plan.json`, target 8.4, prerequisites. Quote: "`[X/G] → BG` is flat, representable by quasi-projective schemes with the linearized ample bundle, so 8.3(b) applies again."

   **Claim:** For every point `Spec R → BG`, a G-torsor P, the base change `P ×^G X` is a qcqs scheme carrying an ample twisted bundle. 8.3(b) needs exactly this ("every base change `Y_η → Spec R` is a flat qcqs morphism of schemes", with an ample family on `Y_η`).

   **Witness:** `G = ℤ/2` over ℚ, `R = ℚ`, `P = Spec ℚ(i)`. P has no section over the one-point `Spec ℚ`, so the Zariski gluing used for `GL_n`-torsors does not apply. SchemeAndStackFoundations §1.16 gives only `contractedProduct_isAlgebraicSpace`; no *Needs* item gives a scheme.

   The route treats `BG → BGL_n` carefully (frame bundles are Zariski-locally trivial) and then asserts the general case in one clause. The statement of 8.4 is true; the input is unowned.

   **Exact repair:** State the input in 8.4, before the last sentence of the route, and give it an owner:

   - Statement: for k of characteristic zero, G affine of finite type over k, P a G-torsor over `Spec R`, and X quasi-projective over k with a G-linearized ample invertible module L, the contracted product `P ×^G X` (SchemeAndStackFoundations §1.16 `contractedProduct`) is a scheme, quasi-projective over R, and the descent of L is ample on it.
   - Route: G is smooth by Cartier's theorem, pinned as `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (TauCeti/AlgebraicGeometry/Group/Cartier.lean:32). So `P → Spec R` is smooth and surjective and has sections over an étale cover `R → R′`. Over `R′` the twist is `X × Spec R′` with L relatively ample. StableReduction Layer 2 ("effective étale descent for schemes equipped with a compatible relatively ample invertible sheaf", on main) descends the scheme and the polarization to R. R is affine, so relatively ample is ample.
   - Add to 8.4's *Needs*, the Layer 8 Dependencies, the supplier contracts and the plan: SchemeAndStackFoundations §1.16, StableReduction Layer 2, the pinned Cartier theorem, and an owner for étale-local sections of a smooth surjection.
   - If StableReduction's statement does not cover non-proper X, or no supplier states the étale-local sections, declare a gap instead: supplier SchemeAndStackFoundations §1.16, `needs` = the statement above.

   Tested on the witness with `X = ℙ¹_ℚ`, the action through `diag(1, −1)` on `ℚ²` and `L = O(1)`: over `R′ = ℚ(i)` the twist is `ℙ¹_{ℚ(i)}`; the descent datum on `ℚ(i)²` is conjugation composed with `diag(1, −1)`, with invariants `ℚ·e₁ ⊕ ℚ·i e₂`; the twist is `ℙ(ℚ²) = ℙ¹_ℚ` with `O(1)` ample, a scheme as 8.3(b) requires.

2. **F02** (P2) LanglandsParameterStacks §1.8 also states QCoh of quotient stacks; the Scope omits it

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:7` and line 10; 7.2 at line 707. Quote: "Three roadmaps state parts of the theory; this roadmap imports what they state and extends it".

   **Claim:** The three imported sections are all that earlier roadmaps state of this theory, and for LanglandsParameterStacks that is §1.7 only.

   **Witness:** Open pull request #1202, `TauCetiRoadmap/LanglandsParameterStacks/README.md:391`: §1.8 constructs the "enhanced quasi-coherent category as the totalization of module categories on the action-groupoid nerve", with Perf by chartwise dualizability, and "supplies the … quotient-stack enhancements".

   This is the round-6 R06 pattern on a section that repair did not reach. §1.8 defines `QCoh` of `[Z¹(W, Ĥ)/Ĥ]` and of `BĤ` over animated rings as that totalization; 7.2 and 6.3 prove the same description for every group prestack. LanglandsParameterStacks is at line 82 of the merge order, earlier than this roadmap, so it is the owner of its case.

   **Exact repair:** Extend the LanglandsParameterStacks bullet of Scope: "§1.8 owns the enhanced `QCoh` and `Perf` of its derived parameter stacks, defined as the totalization of module categories over the action-groupoid nerve. 7.2 and 6.3, in the animated context, extend this to every action of a group prestack and agree with it: both sides are the limit over the same bar construction." Add §1.8 to the supplier contract, to the "used unchanged" list, to 7.2's compatibility sentence and *Needs*, to the Layer 7 Dependencies and to the plan's supplier sections. Tested on §1.8's own Checks: for the free translation action 7.2's Check gives `QCoh([G/G]) = QCoh(S)`, which is `Mod_Λ` for `S = Spec Λ`; for `BĤ` 7.2 gives comodules, not `Mod_Λ`. Both agree with §1.8.

3. **F03** (P3) Layer 4 is used by 6.2, 7.1, 7.4 and 8.2 but is not in their *Needs*

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:643`, 703, 747, 791; Dependencies at line 756; line 175. Quote: "Layer 7 treats quotients, using Layers 2, 3 and 6 and, for classical quotient stacks, Layer 5."

   **Claim:** These targets need nothing from Layer 4.

   **Witness:** 6.2(b) defines geometric by "a flat affine map (4.1; p is affine because the diagonal is)". 7.4(d)'s route uses `f_* I` for the affine atlas f, which is 4.2. The plan's prerequisites of 6.2, 7.1, 7.4 and 8.2 contain no `target:4.1` or `target:4.2`.

   **Exact repair:** Add 4.1 to the *Needs* of 6.2, 7.1 (affine over S, affine diagonal) and 8.2 (affine diagonal); add 4.1 and 4.2 to the *Needs* of 7.4; add Layer 4 to the Layer 7 Dependencies and to the two sentences of "How to read the build" on Layers 6 and 7; add the matching `target:` prerequisites in the plan. No cycle arises: 4.1 needs 2.1 and 4.2 needs 1.2, 1.5, 2.3 and 4.1.

4. **F04** (P3) The embedding theorem is a pinned Tau Ceti declaration, cited as ReductiveGroups Layer 1

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:104` and line 168. Quote: "No Tau Ceti declaration is consumed directly".

   **Claim:** ReductiveGroups Layer 1 states the embedding theorem that 8.4 uses.

   **Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:1309` on main says it consumes "the supplied embedding theorem (`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`…)". The declaration is at TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212 at the pin.

   **Exact repair:** Under "From Tau Ceti" cite `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (file and line above): a finite-type affine group scheme over a field has a closed immersion into some `GL_n`. Replace "No Tau Ceti declaration is consumed directly" accordingly, cite the declaration in 8.4's *Needs*, and keep ReductiveGroups Layer 1 only for the comodule dictionary. With R01 the same list gains `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero`. The declaration's hypotheses (a field k, `LocallyOfFiniteType`) are those of 8.4.

5. **F05** (P3) "Preserves colimits, in particular … finite products" is a non sequitur

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:199`; the matching API entry of plan target 1.1. Quote: "θ preserves small colimits, in particular pushouts and finite products".

   **Claim:** Preservation of finite products of rings follows from preservation of colimits.

   **Witness:** A finite product of test rings is a limit: `ℤ × ℤ` is the product, while the coproduct of ℤ with itself is ℤ. Preserving colimits says nothing about it. 3.1 uses the product statement for the sheaf condition.

   **Exact repair:** "θ preserves small colimits, in particular pushouts. It also preserves finite products: θ commutes with the forgetful functors to `D(ℤ)_{≥0}`, which are conservative and preserve limits, and products are computed on underlying objects." On `ℤ × ℤ` both sides have `π₀ = ℤ²` and no higher homotopy.

All nine round-6 findings are repaired. This round finds five further issues: one P1, one P2 and three P3. Both blocking findings are local to Layer 8.4 and to the Scope list; the design's scope and statements otherwise stand. No maintainer notes were supplied. The design, plan and manifest were not changed.

## Verified sound

### Round-6 findings

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| R01 trivial quotient | repaired | 7.1: "`[X/1] ≃ L X` … X exactly when X is a hypercomplete fpqc sheaf". `[∅/1](0) = ∗`, `∅(0) = ∅`; both `QCoh` are 0. |
| R02 relative groups | repaired | 7.1: "a groupoid object `G_•` of the slice `PreStk_T/S` whose object of objects `G_0 → S` is an equivalence". Over `Spec 𝔽₂` the unit is the identity; `Hom(𝔽₂, ℤ) = ∅`. 7.4 uses `×_k` throughout. |
| R03 mapping spaces | repaired | 8.2: "`RΓ(X, −) = q_*` … preserve small colimits, and `Map(O_X, F) ≃ Ω^∞ RΓ(X, F)`". On `Spec 𝔽₂`: `Map(O, 0 ⊕ 0) = ∗` against two points. 8.3(d) uses `p_{U*}`. |
| R04 dualizable objects of `BGL_n` | repaired | 8.4: "`π₀ Map(V[i], M) ≅ Hom(V, π_i M)` … a statement about `π₀`". `Map(ℚ, O[1]) = K(ℚ, 1)`: `π₀ = 0`, `π₁ = ℚ`. |
| R05 presentability of the connective part | repaired | 6.2(a): "if X is a u-small colimit of affines … or … satisfies the hypothesis of 3.4(b)". SAG line 18017 has the same hypothesis; HA line 6014 needs the subcategory presentable. |
| R06 earlier owners | repaired | Scope lines 9–11 and the three contracts. PrismaticCohomologyPartII §4.0, LanglandsParameterStacks §1.7, HabiroCohomologyFoundations §§1.27–1.28 read at their heads; every cited name is there. The pattern recurs once: R02. |
| R07 Check name | repaired | Line 128: "its first Check, on affine group schemes". The first Check of §1.22 on main has that sentence. |
| R08 GR-I page | repaired | "§§1.1.3–1.1.4, pp. 144–145". GR-I line 7354 (PDF 181) and line 7365 (PDF 182). |
| R09 nonvanishing input | repaired | 8.5 coinduced witness. `groupCohomology.coindIso`, `groupCohomologyIsoEven/Odd`, `exists_prime_orderOf_dvd_card` opened at the pin. |

The replacement of HigherToposTheory by the InfinityCategoryTheory family was checked label by label (below). No finding of the repair report is marked "not actionable", so nothing is re-raised.

### Adversarial pass

Values recomputed by hand. The table covers the fifteen sampled targets, the headline theorems and every target a finding touches.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 θ and products | `ℤ × ℤ`; free object on one generator | product has `π₀ = ℤ²`; coproduct `ℤ ⊗ ℤ = ℤ`; `Sym²` has `π₁ = H₁(Σ₂; ℤ) = ℤ/2` | true; reason given is wrong (R05) |
| 1.2 base change and projection | square of `ℤ → 𝔽_p` with itself; `R → R[t]`, `M = R[1]` | derived: both sides `π₀ = π₁ = 𝔽_p`; ordinary: right side `π₁ = 0`; projection: `R[t][1]` both sides | sound |
| 1.4 three notions | k over `k[ε]/ε²`; `ℤ/p`; k over `k[x₁, x₂, …]`; A = 0 | `Tor_i = k` all i; dual `ℤ/p[−1]`, `π₋₁ ≠ 0`; maximal ideal not finitely generated; over 0 every module is 0 and perfect | sound |
| 1.5 descent criterion | identity augmentation; `ℤ → 𝔽_p` | constant diagram, comonadic; `ℚ ↦ 0`, not conservative | sound |
| 2.1 points | `Spec 0`, ∅, BΓ | value at 0: `∗` against ∅; `π₁ BΓ = Γ` | sound |
| 2.3 formal properties | ∅; `ℤ/p ⊗ ℤ/p`; `B(ℤ/2) × Spec 𝔽₂` | `QCoh(∅) = 0`; `π₀ = π₁ = ℤ/p`; class in `H¹ = 𝔽₂` with all evaluations in `π₋₁A = 0` | sound |
| 3.1 covers | empty family; `{ℤ[1/2], ℤ[1/3]}`; `ℤ → ℚ`; `ℤ → 𝔽_p` | covers 0 only; `(2, 3) = ℤ`; `ℚ ⊗ ℤ/p = 0`; `Tor₁(𝔽_p, 𝔽_p) = 𝔽_p` | sound |
| 3.2 flat hyperdescent | `A → A`; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → 𝔽_p` | constant Tot; cofibre `ℤ[1/6]`, `I^{⊗2} → ℤ` in `Ext² = 0`, `Hom(ℤ[1/2], ℤ) = 0` so index 2; ℤ = fibre of `B → ℚ_p`; kills ℚ | sound |
| 3.2 route, step (2) | n-truncated connective modules | Tot is a finite partial totalization; flat `B ⊗_A −` is t-exact and exact | comonadic, as stated |
| 3.4 Zariski gluing | `ℙ¹`; ∅; doubled plane | cokernel of `(a, b) ↦ a − t⁻²b` is `k·t⁻¹`; `h_∅ = Spec 0`; raw fibre `{U, U′}` contractible over `D(x)`, `D(y)` | sound |
| 4.1 affine maps | `Spec k → BG`, `BG → Spec k`, `G = 1` | fibre G affine; `π₁ = G(O(G)) ∋ id ≠ 1`; both identities | sound |
| 4.2 pushforward | `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice | `f_*O = R[t]`, base change `R′[t]`; source `π₁ = 𝔽_p`, target 0 | sound; flatness needed classically |
| 5.2 Zariski descent | tower `τ^{≥−m}K`; `j_!O` on a DVR | `H^q` constant for `q ≥ −m`, target 0 below, so transitions surjective; stalks K and 0 | sound |
| 5.4 schematic pushforward | `ℙ¹_ℤ`, `O(−2)`, base change to ℚ; closed point | `ℤ[−1]` then `ℚ[−1]`; `Tor₁ = 𝔽_p` | sound |
| 6.2(a) | `Spec A`; `⨿_ℕ Spec ℤ`; `BG_m`; colimit in prestacks | `Mod_A^cn`; `∏ Mod_ℤ^cn`; via Čech nerve; `π₀ colim X_j(A)` is a quotient of `⨿ π₀ X_j(A)` | sound |
| 6.2(b) geometric | `BG_m`/ℤ; `B(ℤ/2)`/`𝔽₂`; `𝔽_p` on `Spec ℤ` | graded abelian groups; `𝔽₂[ℤ/2]`-modules; pullback gains `π₁ = 𝔽_p` | sound; SAG shows quasi-geometric stacks are hypercomplete, so no narrowing |
| 6.3 perfect = dualizable | `ℤ ⊕ ℤ[3]`; `O[1]`; `O²`; `BG_m` | dual `ℤ ⊕ ℤ[−3]`; inverse `O[−1]`; evaluation rank 4 → 1; invertibles `O(n)[m]` | sound |
| 6.4 almost perfect | k over dual numbers; `⊕_ℕ O`; `ℤ/p` | Tor in all degrees, each `π_i` finitely presented; `π₀` not finitely generated; two-term resolution | sound |
| 7.1 API | translation action; affine G, X over affine S | split Čech nerve, realization S; `X ×_{[X/G]} X = G ×_S X`, affine | sound |
| 7.2 against LanglandsParameterStacks §1.8 | free translation; `BĤ` | `Mod_Λ`; comodules | agree (R02 asks to say so) |
| 7.4(d) | `B(ℤ/p)`/`𝔽_p`; atlas f | `Ext^i = 𝔽_p`; `Hom(F′, f_*I[n]) = Hom(f^*F′, I[n]) = 0` | sound; uses 4.2 (R03) |
| 8.2 | `BG_m`; `⨿_ℕ Spec ℤ`; `Spec 𝔽₂` | finite weight support = compact = dualizable; `Hom(O, ⊕O_i) = ∏ℤ`; one point against two | sound |
| 8.3(d) | adjointability over `A → A′` | `p_{U*}(F ⊗ p_U^*A′) = p_{U*}F ⊗_A A′` by the projection formula | sound |
| 8.4 (headline) | `BGL₁`/ℚ; `B(ℤ/p)`/ℚ; `G = ℤ/2`, `P = Spec ℚ(i)` | `π₀ Map(ℚ, O[1]) = 0 = Hom(ℚ, π₀)`; `Hⁱ = 0`, `i > 0`; twist not Zariski-locally trivial | statement sound; route input unowned (R01) |
| 8.4 `π₀` formula, unbounded M | `τ_{≤n}M` tower | `π₁ Map(V[i], τ_{≤n}M) = Hom(V, π_{i+1}M)` constant for `n ≥ i + 1`, so `lim¹ = 0` | sound |
| 8.5 (headline) | `ℤ/p`/`𝔽_p`; `S₃`/`𝔽₃`; trivial Γ | `g − 1 = 0`, norm `= p = 0`, so `Hⁱ = k`; `dim V = 2`, `Hⁱ = 𝔽₃`; `colim_N ∏_{i≤N} k = ⊕k ≠ ∏k`; no element of order p | sound |

### Sources: the seeded sample

No locator is flagged unverified in the plan. Each sampled target was read at its locator; page numbers below are the page markers of the cached texts.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.2 | HA lines 22977–22985 (4.5.3.1–2, p. 601), 28674 (4.8.5.21, p. 754), 28032 (4.8.4.6, p. 737); SAG line 17835 | match; hypotheses (geometric realizations preserved by ⊗) as restated |
| 1.4 | HA lines 48274, 48428, 48281, 48357, 48432, 48556 (pp. 1260–1268); SAG lines 10004–10009, 10022, 17974; BZFN line 830 | match; HA 7.2.4.17 assumes left coherent, as the README does |
| 2.1 | SAG lines 17853, 17867 (p. 491) | match |
| 2.3 | SAG lines 17905, 17758 (p. 488); GR-I lines 7354–7365; HTT line 15522 | match |
| 3.1 | SAG lines 79377, 79403 (pp. 2173–2174), 4184 (p. 117) | match |
| 3.2 | SAG lines 79502, 79518, 79526 (pp. 2177–2178), 79395, 79462; GR-I lines 7446, 7452 (pp. 146); HTT line 31182 (PDF p. 687) | match; no descendability hypothesis in the source |
| 3.4 | GR-I line 7572 (p. 149); HTT lines 31671, 31680 (PDF p. 698) | match |
| 4.1 | SAG lines 18224–18236 (§6.3.2, pp. 501–502) | supports relative representability; the affine case is the README's own definition |
| 4.2 | SAG lines 18368, 18458 (pp. 505, 507); GR-I line 7740 (p. 153) | match |
| 5.2 | Stacks lines 86–92 (0A0J), 102–107 (08D3) | match |
| 5.4 | Stacks lines 311 (08DZ), 2312 (08EU), 2351–2362 (08IB) | match; Tor-independence as restated |
| 6.2 | SAG lines 18017–18031, 26667–26696 (pp. 733); GR-I lines 7581, 7600 (pp. 149–150); HA line 6013 (p. 160) | match |
| 6.3 | SAG lines 18072, 18088 (p. 497), 10219 (p. 283); HA line 23655 (p. 620); GR-I lines 8201, 8209 (p. 163) | match |
| 6.4 | SAG line 26798 (p. 736); Stacks line 1059 (08E8) | match |
| 8.4 | BZFN lines 1200–1205 (p. 24) | match; see Source issues |

The remaining theorem numbers and pages of the README were checked in bulk against the page markers (HTT 2.1.1.3, 2.4.1.5, 2.4.2.2, 2.4.2.4, 3.1.2.1, 5.5.4.20, 6.1.0.6, 6.1.2.6–7, 6.1.3.10, 6.1.3.19; HA 1.3.3.2, 4.7.4.18, 4.7.5.2–3, 5.2.2.36, 7.1.1.13, 7.1.3.18, 7.2.1.19, 7.2.2.13; SAG 2.1.2.3, 2.2.3.3, 2.2.6.2, 2.8.4.2, 6.2.3.1, 6.2.4.1, 9.6.1.1, 10.4.6.8–9; GR-I 1.3.7, 1.3.8, 1.3.11, 2.4.3, 2.4.5; BZFN 3.2, 3.9, 3.20–3.24). All agree. Every cited work is in the manifest; no text was missing and no reference request was written.

### Pins, suppliers and ownership

Pinned declarations opened (Mathlib and Tau Ceti as in `lake-manifest.json`):

- `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) and its instance (Quasicategory/Nerve.lean:32).
- `AlgebraicGeometry.Spec` and `Scheme.Spec` (Scheme.lean:466, :494); `fpqcPrecoverage` and `fpqcTopology` (Sites/Fpqc.lean:61, :76).
- `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64), `DerivedCategory` (Basic.lean:87), `TStructure.t` (TStructure.lean:33).
- `Pseudofunctor.IsStack`, `DescentData`, `CoGrothendieck` (IsStack.lean:49, DescentData.lean:59, Grothendieck.lean:235); `Functor.IsFibered` (FiberedCategory/Fibered.lean:65).
- `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `groupCohomology.coindIso` (Shapiro.lean:58), `groupCohomologyIsoEven/Odd` (FiniteCyclic.lean:80, :114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491; it assumes `Fintype`).
- Tau Ceti: `exists_isClosedImmersion_generalLinear` (Embedding.lean:212) and `smooth_of_grpObj_of_charZero` (Group/Cartier.lean:32), for R04 and R01.

No prestack `QCoh` ∞-category exists at either pin (object search for "prestack" and `QCoh`).

Supplier citations resolved this round:

- EnhancedDerivedSheaves on main: every cited name found, in the cited sections (E2.8 `descendableCover_zariski` at line 2427; E5:presentability.3 `homotopyFixedPoints`, `continuousDerivedInvariants` at lines 1720–1722; `compactMappingComparison` is filtered-only, line 1601).
- SchemeAndStackFoundations on main: every cited name found; §§1.1, 1.13, 1.18, 1.21, 1.22, 2.18 exist under those headings.
- DerivedModuleAlgebra on main: §0.2 and §1.E.0 with the four cited names.
- ReductiveGroups on main: Layers 1, 3 and 6. Layer 3 treats `G/H` as an fppf quotient sheaf and does not state quasi-projectivity, so the declared gap asks for nothing already provided.
- PrismaticCohomologyPartII (#1065) §4.0: every cited name at lines 711–732. LanglandsParameterStacks (#1202) §1.7 at line 380. HabiroCohomologyFoundations (#1428) §§1.27–1.28 at lines 807–821.
- InfinityCategoryTheory family (#2270, another author, new folders): all 19 labelled statements exist with the cited content (for example CartesianFibrations 1.3.1 at line 288, StableInfinityCategories 11.1.1 at line 2262, HypercompletenessAndCoherence 6.1.1 at line 1264).
- AnalyticStacks (#1687) §§1.1–1.2, the one downstream consumer: it builds `D(R) = Mod_R(D(ℤ))` on animated affines, as the README says. No roadmap on main or open cites this roadmap.

The resolver's nine "Lean names found nowhere" are all supplier-planned names, each found in its supplier's README above.

`scratch/overlaps.md` lists no competing pull request, no dropped id and no id defined only by a revision; I confirmed that the two EnhancedDerivedSheaves revisions keep the cited section ids. Ownership was searched by object across main and the open heads (`roadmaps grep` for the point-limit definition, right Kan extension, totalization over action nerves, flat hyperdescent, perfect stacks, compact generation); the board index lists two unrelated packages. The one new hit is R02. Ownership against pull requests outside the index was not checked.

Overlap check: read EnhancedDerivedSheaves (main, #1330, #1630), AnalyticStacks (#1687), InfinityCategoryTheory with HypercompletenessAndCoherence (#2270), SchemeAndStackFoundations (main); shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4, cited by both; general ∞-category theory — owner the InfinityCategoryTheory family, cited; abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations, cited.

### Dependency gate and the declared gap

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has 33 targets and 122 tests, at least three each, and no forward `target:` prerequisite.

`gap:chevalley-quasiprojective-quotient` has the same slug in the README (line 171) and the plan, supplier ReductiveGroups Layer 3, and one precise `needs` sentence with its hypotheses (a field, a closed subgroup of finite type of `GL_n`). It is not a finding.

### Shape, principles, headlines

The README has the required parts in order; every definition has API prose and at least three Checks; every theorem has a locator. No LaTeX delimiters, process words, pull-request numbers, machine paths, algorithms, `set_option` or sorry'd data. No route-specific shortcut was found: 8.4's characteristic-zero hypothesis is the theorem's, and 8.5 shows it cannot be dropped.

Headline theorems (from the Summary): flat hyperdescent (3.2) with sheafification invariance (3.3); affine pushforward with base change (4.2); `QCoh(h_X) ≃ Dqc(X)` for every scheme (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and their permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5).

This is a design: there is no `Suggested.lean`, so there are no sorried declarations to probe and no signatures to compare.

Source independence: 14 passages compared with 6 sources (HA lines 48274, 48428, 47511, 6013; SAG lines 10004, 17990, 18072, 79403, 18025, 26690; BZFN lines 834, 1200; GR-I line 7600; Stacks line 86), none shared beyond what a definition forces (at most six consecutive words); largest share SAG, 43 of 120 locators; contents compared with SAG §§6.2.1–6.2.6, 6.3, 9.1 and D.6: independent. Layer 1 is drawn from HA, Layer 3 from SAG Appendix D, Layer 5 sits after Layer 4 because 5.4 needs 4.2, and Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available: this lane does not elaborate. No Lean command was run.
- The Chevalley contract is a declared gap: its statement was checked, not a future proof.
- StableReduction Layer 2's descent statement (R01) was read in its README only; whether its eventual proof covers non-proper X is not something the text settles, which is why R01 offers the gap as the alternative.

## Source issues

- **Error** in BZFN at proof of Corollary 3.22, arXiv page 24: the source says the compact and dualizable objects on the classifying stack are the finite-dimensional representations; it should be their shifts, finite extensions and retracts; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "449c6c50fba6c5c378af29604887d1dbfa3cb348", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~7", "model": "fable", "worker": "chris-x82"} -->
