# Review of PerfectoidSpacesPartII (pull request #2286 at b2a4617)

**Verdict:** needs changes

## R01 (P2) — the proof sketch of §3.5 translates the source's proof

**Location:** `TauCetiRoadmap/PerfectoidSpacesPartII/README.md` lines 1674–1678: "Since `u^s_{[j′]}` maps to `0` in `R[j]` when `s(j′ − j) ≥ r`, the transition `R[j′] → R[j]` factors through `R[j]_k` for `j′ ≥ j + rpᵏ`, so `lim_j R[j] = lim_{j,k} R[j]_k`."

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 2499–2520 and 2575–2577: the same five steps in the same order with the same letters `R[j]_k`, `S_j`; the quoted sentence translates lines 2503–2504 (about 25 words).

**Repair:** Replace the sketch by: "*Proof sketch.* Write `S_j` for the image of `R` in `R[j]` and treat `R → lim_j S_j` and `lim_j S_j → lim_j R[j]` separately. Second map: a long transition keeps only small exponents, since `R[j′] → R[j]` multiplies `u^s` by `ϖ^{(j′−j)s}`, which is `0` in `R` once `(j′ − j)s ≥ r`; so for `j′ ≥ j + rpᵏ` its image lies in the `R`-span `R[j]_k` of the `u^s_{[j]}` with `s ≤ 1/pᵏ`, and the towers `(R[j])_j` and `(R[j]_k)_{j,k}` are interleaved and have the same limit. For `s ≤ 1/pᵏ`, `T^{1/p^k}u^s_{[j]} = ϖ^{js}T^{1/p^k − s}` comes from `R`, so `S_j ⊆ R[j]_k` with quotient killed by `T^{1/p^k}`, and `⋂_k R[j]_k` is almost `S_j`. First map: an element of `ker(R → S_j)` is a multiple of some `T^{1/p^k}U^{1/p^k} − ϖ^{j/p^k}` in `R[U^{1/p^∞}]`, and the coefficients of the powers of `U` show that `T^{r/j}` kills it when `j` is a power of `p`. Along these `j`, which are cofinal, the kernels form a tower whose tail from `j` on is killed by `T^{r/j}`; its `lim` and `lim¹`, the kernel and cokernel of `R → lim_j S_j`, are killed by every `T^{r/p^ℓ}`, hence almost zero."

## R02 (P2) — step (2) of the proof sketch of §4.3 translates the source's proof

**Location:** `README.md` lines 2092–2095: "The integral closure of `A°` in `B′` maps to the integral closure of `A[j]°` in `B_j`, which is almost `B_j°` … in the limit this gives `δ : B′ → B[1/g]`, and `δ_j` is a right inverse of the counit `η_j`".

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 2979–2988: the same four clauses in the same order with the same letters `δ`, `δ_j`, `η_j`; about 35 words in translation.

**Repair:** Replace step (2) by: "(2) Write `η_j : B{ϖʲ/g} → B_j` for the counit. A map in the other direction comes from integral elements: an element of `B′` integral over `A°` is integral over `A[j]°` in every `B_j`, hence power-bounded there (PerfectoidSpaces P3.12 identifies that integral closure with `B_j°` up to almost isomorphism), and the resulting compatible family is an element of `lim_j B_j° = B°`. Inverting `ϖg` extends this to an `A[1/g]`-algebra map `δ : B′ → B[1/g]`, and base change to `A[j]` followed by completion gives `δ_j : B_j → B{ϖʲ/g}` with `η_j ∘ δ_j = id`. Then `(δ_j ∘ η_j)_j` and the identity are two endomorphisms of `ς(B)` with the same composite to `(B_j)_j`; by the adjunction of §3.11 a morphism `ς(B) → (B_j)_j` factors through the counit in only one way, so `δ_j ∘ η_j = id`."

## R03 (P2) — the Galois step of the proof sketch of §4.4 translates the source's proof

**Location:** `README.md` lines 2131–2136: "put `B₂ = B ⊗_A B` and `B₂^{[j]} = B[j] ⊗_{A[j]} B[j]`; their completions are perfectoid with `(B̂₂)°^a = B°^a ⊗̂ B°^a` … and `B̂₂[j] = B₂^{[j]}`. By §3.6, `lim A[j]° = A°_*`".

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 3096–3128: the same steps in the same order with the same notation `B₂`, `B₂^{[j]}`, formulas (5.4)–(5.10) one after another; the first two sentences translate lines 3098–3107.

**Repair:** Replace from "Characteristic `0`, Galois case" to "hence finite étaleness by §4.1." by: "Characteristic `0`, `B[1/g]` Galois with group `G`. The two conditions of §4.1 are obtained on each annulus and then passed to the limit over `j`. On the annulus, `B[j]` is a finite étale `G`-torsor over the perfectoid `A[j]`: `B[j]^G = A[j]`, so `(B[j]°)^G = A[j]°`, and `B[j] ⊗_{A[j]} B[j] ≅ ∏_G B[j]` through `b ⊗ b′ ↦ (γ(b)b′)_γ`, an isomorphism of perfectoid algebras, hence of unit balls. This tensor square needs no completion, `B[j]` being finite projective, and it is the `j`-th annular localisation of the perfectoid algebra `B ⊗̂_A B`, whose unit ball is almost `B° ⊗̂_{A°} B°` (PerfectoidSpaces P2.13, P2.16). Apply §3.6(1) to `A`, to `B` and to `B ⊗̂_A B`: the limits over `j` of the three families of unit balls are the almost elements `A°_*`, `B°_*` and `(B° ⊗̂_{A°} B°)_*`. Limits commute with invariants and with finite products, so `(B°_*)^G = A°_*` and `(B° ⊗̂_{A°} B°)_* ≅ ∏_G B°_*`. Modulo `p^m` the completion disappears, and these are the two conditions of §4.1 for `B°^a/p^m` over `A°^a/p^m`; finite étaleness follows by §4.1." In the last sentence of the paragraph write `ϖ^{-1/p^∞}(B° ⊗_{A°} B°)[1/g]` for `ϖ^{-1/p^∞}B₂°[1/g]`.

## R04 (P2) — the construction of §4.6 translates the source's proof

**Location:** `README.md` lines 2230–2233: "The integral closure of `A°` in `B′` maps into every `B_j°` …, hence into `B°`; this map of subrings of `B′` is injective, and surjective because `B°` is integral over `A°`, by the Galois invariants formula".

**Claim:** The construction is the roadmap's own wording.

**Witness:** ANDRE18A lines 3187–3193: the same five clauses in the same order, from the replacement of `A°` to the reduction to the Galois case; about 45 words in translation.

**Repair:** Replace the first two sentences of the construction by: "The statements do not change when `A°` is replaced by `g^{-1/p^∞}A°`, so let `A° = g^{-1/p^∞}A°`. Both `(A°)^+_{B′}` and `B°` are subrings of `B′ = B[1/g]` (§4.3(3)), and `B̃° = B°` is an equality of subrings. An element of `B′` integral over `A°` has integral, hence power-bounded, image in every `B_j` (André A, Lemme 2.4.1(1)), and a compatible family of power-bounded elements is an element of `lim_j B_j° = B°` (§2.6); so `(A°)^+_{B′} ⊆ B°`. Conversely `B°` is integral over `A°`. When `B′` is Galois with group `G`, an element `b ∈ B°` is a root of `∏_{γ∈G}(X − γ(b))`, whose coefficients are `G`-invariant elements of `B°`, and `(B°)^G = A°` by the limit argument of §4.4 (André A, (5.6)); in general `B°` lies in the unit ball attached to the frame torsor of §4.2(1), which is integral over `A°` by the Galois case."

## R05 (P2) — the almost-surjectivity step of the proof sketch of §4.7 translates the source's proof

**Location:** `README.md` lines 2307–2309: "if `B′` is faithful, `B̃°` is a faithful `A°`-module, and since `A → B̃` is isometric, `B̃°/p` is faithful over `A°/p`; `B̃°^a/p` is finite étale over `A°^a/p`, so the trace is almost surjective modulo `p`".

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 3196–3200: the same five clauses in the same order with the same symbols; about 45 consecutive words in translation.

**Repair:** Replace the quoted sentence, up to "onto `(A°^a)_* = g^{-1/p^∞}A°`.", by: "(3), almost surjectivity: argue modulo `p` first. By (2) the almost algebra `B̃°^a/p` is finite étale over `A°^a/p`, and the trace of a faithful finite étale almost algebra is an epimorphism onto the base (PerfectoidSpaces P0.12, P0.14). Faithfulness modulo `p` comes from `B′`: `A[1/g] → B′` is injective, so `A → B̃` is injective and, both norms being spectral, isometric; hence an element `a ∈ A°` lying in `pB̃°` has `a/p ∈ A` of norm at most `1`, that is `a ∈ pA°`, and `A°/p → B̃°/p` is injective. So the trace `B̃° → g^{-1/p^∞}A° = (A°^a)_*` is almost surjective modulo `p`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Previous R01 (§2.1 root saturation) | lines 1001–1018, 3024–3029; `p = 2`, `R = 𝔽₂[t^{1/2^∞}][t^{2^k}s^{4^k}]` | inclusion with equality under `R^† ⊆ t^{−N}R`; least exponents `3, 9, 21` for `n = 3, 15, 63`; `t·sⁿ ∈ R^†` | repaired |
| Previous R02 (§5.8 extension) | lines 2754–2758 | sentence cut; no ramified or multi-element claim left in the README | repaired |
| Previous R03 (§3.3, §3.8) | lines 1563–1573, 1813–1817 against ANDRE18A 2047–2057, 2816–2821 | `η^pη′x = (ηy)^p` with `η′x = y^p`; (3) ⇒ (4) through `x ↦ x^p`; no shared sentence | repaired |
| Previous R04 (§3.11) | lines 1910–1923 against ANDRE18A 2927–2957 | kernel `B_j°/ϖ^{1−1/p}`, cokernel inside `lim¹`, `r = 1 − 1/p`; wording own | repaired |
| Previous R05 (§4.2(2)) | lines 2048–2055 against ANDRE18A 381–384 | `M^G ≅ e_γM` by `x ↦ e_γx`, inverse `y ↦ Σ_σ σ(y)`; invariants `S^G ⊗ S′ = S′` on both sides | repaired |
| §0.4 linear functors | `K°/ϖ^{1/p^n}`, `F = − ⊗_ℤ A` | `F(t^{1/p^k}·id) = F(0) = 0`; `x ⊗ ϖ^{1/p} ≠ 0` as `ϖ^{1/p} ∉ pA` | holds; BHATT18 lines 337–345 |
| §0.5 uniform annihilation | cone in degrees `[−1, 0]`, `γ = g^{1/p^k}t^{1/p^l}` | `γτ` through `H^{−1}(C_n)[1]`, `t^{1/p^{l′}}γτ = 0`; cokernel inside `H^i(K ⊗ C_n)` | holds; BHATT18 lines 418–426 |
| §2.4 Laurent localisation | `A = K × K`, `g = (ϖ², 1)`, `λ = ϖ`, `a = (1, ϖ²)`; `K⟨T⟩{λ²/T²}` | quotient norm `q²`, `inf_m max(q^m, q^{2−m}) = q`; some `\|a_{2j−1,j}\| ≥ \|λ\|^{−1}` | holds; ANDRE18A lines 1107–1200 |
| §2.6 uniform limits | `ulim_j K⟨T, ϖʲ/T⟩` | `\|a_{−n}\|\|ϖ\|^{−jn} ≤ C` for all `j` gives `a_{−n} = 0`; limit `K⟨T⟩` | holds; ANDRE18A lines 1256–1281 |
| §2.8 root algebras | `A = K`, `g = 1`, level `1` | char `0`: `K[S]/(S^p − 1)` reduced of dimension `p`; char `p`: `(S − 1)^p = 0`, uniformization `K` | holds; ANDRE18A lines 1319–1348 |
| §3.4 annular localisations | `(ϖʲ/T)^{1/p}`, `j ≥ 1`; `j = 0` | `ϖ^{j/p − j}T^{1−1/p}U`: quotient norm `\|ϖ\|^{−j(1−1/p)}`, spectral norm `1`; both `1` | holds; ANDRE18A lines 2163–2292 |
| §3.5 limit lemma | `R = K°/ϖ^r`, roots of `T` acting by `0`; R01's rewrite | `R[0] = 0`, `R[j] = k_K[U^{1/p^∞}]`, `lim = k_K`; tail of kernels killed by `T^{r/j}` | statement holds (ANDRE18A lines 2468–2497); wording: R01 |
| §3.6 new sketch | `b` in the root saturation, on the annulus `j` | `b = (g^{1/p^m}b)(ϖʲ/g)^{1/p^m}ϖ^{−j/p^m}`, norm `≤ \|ϖ\|^{−j/p^m}` for all `m`; `ϖg·y = 0` | holds |
| §4.1 almost Galois | `ℤ ⊂ ℤ[i]`; lift of `η·e₁` | images `(1,1), (i,i), (i,−i), (−1,1)`, determinant `4`; `Σ_i t(bb_i)b′_i = ηb` | holds; ANDRE18A lines 296–365 |
| §4.2 closures, rigidity | cyclic cubic; `R[x]/(x² − a)` | six frames, two `ℤ/3`-orbits, `T ≅ S × S`; `δ² = δ` | holds; ANDRE18A lines 366–384 |
| §4.3 annular envelopes | `1/T` in `K⟨T^{1/p^∞}⟩[1/T]`; R02's rewrite | annular norms `\|ϖ\|^{−j}`, unbounded; `η_jδ_j = id` and uniqueness give `δ_jη_j = id` | statement holds (ANDRE18A lines 2969–2973); wording: R02 |
| §4.4 integral almost étaleness | `B = A × A`; R03's rewrite | trivial `ℤ/2`-torsor; `(B[j]°)^G = A[j]°`, `(B° ⊗̂ B°)_* ≅ ∏_G B°_*` | statement holds (ANDRE18A lines 3090–3093); wording: R03 |
| §4.6 envelope | monic equation times `εⁿ`; R04's rewrite | coefficients `ε^{n−i}b_i ∈ A°`; `b` a root of `∏_γ(X − γ(b))` over `(B°)^G = A°` | holds; wording: R04 |
| §4.7 Abhyankar lemma | `A₁ × A₂`, `B′ = A₁`; R05's rewrite | trace image `A₁° × 0` misses `(0, ϖ)`; `a ∈ pB̃° ∩ A°` gives `\|a/p\| ≤ 1` | statement holds (ANDRE18A lines 56–68, 3182–3186); wording: R05 |
| §4.8 affinoid envelopes | `B = A`, `g = 1`; `B = A × A` | `ℬ = 𝒜 = P`; `P × P` | holds; ANDRE18A lines 3201–3214 |
| §5.5 spectral norm | `n = 0`, `\|x\| < 1` | `x = (ζ − 1)·((ζ − 1)u)` once `\|ζ_{p^j} − 1\|² ≥ \|x\|` | holds; ANDRE18B lines 358–366 |
| §5.10 generic fibres | `x` killed by `K°°_∞` in a `K_∞`-module | `x = p⁻¹(px) = 0` | holds; ANDRE18B lines 563–565 |
| §5.12 new sketch | cokernel `Q` of `S ⊆ Â°_∞∞` | kernel of `S/p^m → Â°_∞∞/p^m` a quotient of `Q[p^m]`, cokernel `Q/p^m`, both killed by `K°°_∞` | holds; ANDRE18B lines 606–614 |
| `bhatt_riemann_extension_ker_almostZero` | `m = 0`; `g = (T, 0)` | `b = t^{1/p^l}a`; `hgreg` fails at `a = (0, 1)` for `m ≥ 1` | true as stated |
| `bhatt_quantitative_riemann_extension` | `e ≥ 1/pᵏ`; `e < 1/pᵏ` | `ce ≥ m`, term `0`; `g^{1/p^k − e}t^{(n+c)e}` in the image of `R°` | true; `completedPlusSubring` is the closure of the integral closure (`LocalizationTopology/Plus.lean:117`) |
| `bhatt_kernel_without_regularity` | `g = 0`; `g = (T, 0)` | `0 = 0`; kernel `(0) × K°` killed by `(t^{1/p^k}T^{1/p^k}, 0)` | true; `c` precedes `a` |
| `bhatt_riemann_extension_limit` | `g = 0`; `g` a unit | annuli empty, kernel `R°` killed by `0`; both sides `R°` | true |
| `riemann_extension_completeIntegralClosure` | `b` in the saturation; `g = 1` | `g·bⁿ = g^{1−n/p^k}(g^{1/p^k}b)ⁿ ∈ R°`, module `g⁻¹R°`; both sides `R°` | true |
| `rootSaturation_completelyIntegrallyClosed` | `K × K`, `g = (1, 0)`, `b = ϖ⁻¹` | `\|b\|ⁿ ≤ max \|c_i\|` fails, norms `\|ϖ\|^{−n}` | true |
| `abhyankar_trace_almost_surjective` | `B′ = R[1/g]`; `c = c′c″` | trace the identity, `c·g^{1/p^l}·a` its own trace; ideal idempotent | true |
| `kummer_isPureHom` | `l = 0`; `n = 0`, `g = p`, `l = 1` | identity; split by the coefficient of `1` in `1, p^{1/p}, …` | true; ANDRE18B lines 551–562 |
| `kummer_almost_faithfullyFlat` | `m = V = ℤ`, `M = ℚ`; `g ≠ 0` | `ℚ ⊗ ℤ/2 = 0`, definition fails; source fixes `g ≠ 0` (line 315) | as ANDRE18B line 385 |
| `kummer_ramified_almost_faithfullyFlat` | `m = 0`; `B = A` | zero ring; `B°` almost `Â°_∞∞` | true; ANDRE18B lines 600–607 |

- Source locators checked against the text: 74 (BHATT18 14, ANDRE18A 41, ANDRE18B 19), all on the stated pages, the 15 sampled targets among them; the README flags none as unverified.
- Library names resolved at the pins: 57, among them `TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean:117`, `TauCeti/RingTheory/Almost/RootSetup.lean:62,92`, `TauCeti/Algebra/Category/ModuleCat/Tower/ProZero.lean:75,88,97,173,189`, `TauCeti/RingTheory/Etale/Torsor/Basic.lean:88,99,221,236`, `TauCeti/LinearAlgebra/Trace/Projective.lean:96–158`, `TauCeti/RingTheory/Perfectoid/Basic.lean:86,102,108`, `Mathlib/RingTheory/Filtration.lean:393`, `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27,32`.
- Cross-roadmap citations resolved: PerfectoidSpaces on main, 25 section ids and 32 slugs, each in the section cited; DerivedDeRhamCohomology `Suggested.lean` line 96 and DeformationAndDerivedPatchingAlgebra `Suggested.lean` line 133 at their open heads; PerfectoidShimuraVarieties §1.3; the consumers DirectSummandsAndBigCohenMacaulay (`README.md` lines 90–94), ArcTopologyAndDescent (line 26) and FiniteEquivalenceRelations (line 78) cite ids of the former-numbering table or §5.1. The other supplier citations rest on the citation resolver (none unresolved).
- Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; the gate passes every check; no change outside the folder.
- Elaboration of `Suggested.lean`: ten `sorry` warnings and nothing else; the file is unchanged since `d8879ce`; the 35 elaborated signatures keep their binders. One-tactic probe (`rfl`, `trivial`, `simp`, `infer_instance`, after `intros` as well) closes none of the ten theorems.
- Headlines: §1.2 (both clauses), §1.4 kernel, §1.5, §3.6(2), §3.6(3), §4.7(3), §5.8, §5.9, §5.12 stated; §1.3, §3.6(1), §3.6(4), §3.11, §4.5, §4.7(1)–(2) named in the docstring with the missing carrier. The pull request's title and description agree with the head.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotientsPartII, PerfectoidQuotients, PerfectoidTowers, RelativeFarguesFontaine, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartII; pure ring maps are owned here and cited by DirectSummandsAndBigCohenMacaulay and FiniteEquivalenceRelations; the localised complete integral closure is owned here and cited by ArcTopologyAndDescent; PerfectoidQuotients §§1.3–1.4 owns the root extension and the monic-root pair, cited here; nothing owned twice.

Source independence: 32 passages compared with 3 sources, 5 shared (R01–R05); largest share ANDRE18A, 92 of 164 locators; contents compared with ANDRE18A: independent at the level of layers (Layer 3 merges its §§3–4, Layer 4 takes §1.9, Proposition 4.4.4 and §5, Layer 2 inserts ANDRE18B §1.2; the order Layer 2 → 3 → 4 is forced by the `*Needs:*` lines of §3.3–§3.6 and §4.3–§4.7). GR03 and SCHOLZE12 were not opened this round.

## Not verifiable

- none

## Source issues

- **Error** in ANDRE18A at Remarque 2.5.6, p. 27: the source says the complete integral closure of `R` in `R[1/t]` equals the root saturation of its `p`-root closure; it should be an inclusion, with equality for the complete integral closure of the `p`-root closure; affects nothing.
- **Misprint** in ANDRE18A at Lemme 2.5.3, proof of (2) ⇒ (6), p. 27: the source says the step follows from condition (1); it should cite condition (2), the element lying in `B[1/g]`; affects nothing.
- **Misprint** in ANDRE18A at formula (2.17), §2.5.3(1), p. 26: the source says the middle term inverts `p`; it should invert the pseudouniformizer, since in characteristic `p` inverting `p` gives the zero ring; affects nothing.
- **Error** in ANDRE18A at Lemme 2.6.3, proof, p. 29: the source says the norm of the image of `a` in the Laurent localisation is the infimum over `m` of the norms of `(g/λ)^m a`; it should be the quotient norm, which is `q²` against `q` for `K × K`, `g = (ϖ², 1)`, `λ = ϖ`, `a = (1, ϖ²)`; affects the proof.
- **Error** in ANDRE18A at Remarque 2.6.4(1), p. 29: the source says all restriction maps between uniformized Laurent localisations are injective; it should exclude cases such as `K × K`, `g = (ϖ², 1)`, radii `ϖ³` and `ϖ`, where a factor dies; affects nothing.
- **Misprint** in ANDRE18B at Remarque 2.6.1(1), p. 82: the source says the completed tower is faithfully flat over `A_∞`; it should be `A_∞0`; affects nothing.

## For the human reviewers

- **Licence.** Theorem statements follow the sources' statements clause by clause: §4.7(1)–(3) (`README.md` lines 2263–2275, ANDRE18A lines 56–68), §5.5 (lines 2659–2663, ANDRE18B lines 358–366), §5.4 (lines 2549–2553, ANDRE18B lines 333–345). They were counted as forced by the mathematics.
- **Licence.** The short sketches of §3.1, §3.7, §5.3 and §5.8 (`README.md` lines 1464–1466, 1783–1786, 2524–2527, 2764–2779) list the same steps, in order, as ANDRE18A lines 1720–1723, 2637–2643 and ANDRE18B lines 232–234, 386–545; they were counted as routes.
- **Scope.** Within layers the sections keep the source's order: §§2.2–2.4, 2.6–2.9 follow ANDRE18A §§2.3, 2.5, 2.6, 2.8, 2.9, and §§3.3–3.11, 4.3–4.8 follow its §§3.5–5.4; the `*Needs:*` lines force most of it.
- **Scope.** DirectSummandsAndBigCohenMacaulay `README.md` line 94 declares `gap:ramified-multielement-kummer` with this roadmap as supplier; this head states no multi-element or ramified-base Kummer target (§5.8, lines 2754–2758).
- **Scope.** `README.md` lines 2998–3054, "Corrections to the sources", lists fifteen claimed errors in BHATT18, ANDRE18A and ANDRE18B; this round recomputed five of them (the items under Source issues above from ANDRE18A).
