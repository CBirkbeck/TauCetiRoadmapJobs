# Review of PerfectoidSpacesPartII (pull request #2286 at 8f8a1bd)

**Verdict:** needs changes

## R01 (P1) — the root-saturation formula for the complete integral closure is false

**Location:** `TauCetiRoadmap/PerfectoidSpacesPartII/README.md` lines 996–998 and 1117–1118: "For a ring `R` with a root system of a nonzerodivisor `t`, the complete integral closure of `R` in `R[1/t]` is the root saturation `t^{-1/p^∞}` of the `p`-root closure".

**Claim:** `R^*_S = t^{-1/p^∞}R^†_S` for `S = R[1/t]`, for every such `R`.

**Witness:** `p = 2`, `R = 𝔽₂[t^{1/2^∞}][ts, t²s⁴, t⁴s¹⁶, …] ⊆ 𝔽₂[t^{±1/2^∞}][s]`: `(t^{1/2^k}s)^{4^k} ∈ R`, yet the least `m` with `t^m sⁿ ∈ R` is `3, 9, 21` for `n = 3, 15, 63`.

**Repair:** Replace the bullet of §2.1 by: "For a ring `R` with a root system of a nonzerodivisor `t` and `S = R[1/t]`: `R^*_S ⊆ t^{-1/p^∞}R^†_S = (R^†_S)^*_S`, with equality on the left when `R^†_S ⊆ t^{−N}R` for some `N`, in particular when `R` is `p`-root closed in `S` (André A, Remarque 2.5.6, p. 27, which states the equality without this condition)." Delete the bullet of §2.3 (lines 1117–1118), which repeats it. Add to the Checks of §2.1: "For `p = 2`, `S = 𝔽₂[t^{±1/2^∞}][s]` and `R = 𝔽₂[t^{1/2^∞}][t^{2^k}s^{4^k} : k ≥ 0]`, `S = R[1/t]` and `(t^{1/2^k}s)^{4^k} ∈ R`, so `s` lies in the root saturation of `R^†_S`; the least `m` with `t^m sⁿ ∈ R` is `3(2^k − 1)` for `n = 4^k − 1`, unbounded, so `s ∉ R^*_S`, while `t·sⁿ ∈ R^†_S` for all `n`. Equality without the bound on `R^†_S` fails here." Add the item to *Corrections to the sources*. (Tested on the witness: `(t·sⁿ)^{4^b} ∈ R` once `2^b ≥ n`, so `s ∈ (R^†_S)^*_S`.)

## R02 (P2) — §5.8 promises an extension that no target states and a consumer contracts

**Location:** `README.md` lines 2714–2716: "the method extends to finitely many elements `g^{(1)}, …, g^{(m)}` and to a ramified complete regular local base of mixed characteristic with perfect residue field (André B, Remarques 2.6.1(4), pp. 82–83)".

**Claim:** André's flatness theorem holds for several elements and over a ramified base.

**Witness:** ANDRE18B lines 578–586: a remark with no statement or proof, noting that the ramified case has no perfectoid base field. DirectSummandsAndBigCohenMacaulay `README.md` line 94 contracts exactly this from this roadmap (`gap:ramified-multielement-kummer`).

**Repair:** Either own it: add §5.13 stating the tower, the almost setup and the flatness and modulo-`pᵐ` conclusions for `g^{(1)}, …, g^{(m)}` over a ramified complete regular local base, with hypotheses, proof route, `*Needs:*` and Checks, and add its slug to the former-numbering table; or cut it: replace the sentence by "Only the statement modulo powers of `p` is needed by the applications (André B, Remarques 2.6.1(4), p. 82)." Layers 2–4 assume a perfectoid base field, so the ramified form does not follow from §5.6–§5.8 as written.

## R03 (P2) — the Mittag-Leffler step of §3.3 and §3.8 translates the source's proof

**Location:** `README.md` lines 1548–1551: "Put `L = B°/ϖ`, so that `B♭° = lim_F L`. Frobenius almost surjectivity makes `F` surjective on `mL`, so `lim_F L → L` is almost surjective by Mittag-Leffler for `𝔽_p`-vector spaces"; again at lines 1788–1789.

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 2049–2057 and 2816–2821: the same five clauses in the same order with the same letter `L` and the same phrase for the Mittag-Leffler lemma; about 35 words in translation.

**Repair:** In §3.3 replace from "Put `L = B°/ϖ`" to "the third condition" by: "For the third condition only almost surjectivity of the counit is at stake, injectivity being §3.1. Both unit balls are `ϖ`-adically complete, so by *complete-almost-nakayama* (below) it is enough to treat the reduction `B^♮°/ϖ → B°/ϖ`, which under `B^♮°/ϖ ≅ B♭°/ϖ♭` is the projection of the inverse limit of `B°/ϖ` along Frobenius onto its last term. The second condition makes every element of `m·(B°/ϖ)` the `p`-th power of an element of `m·(B°/ϖ)`; a tower with surjective transitions surjects from its limit onto each term, so the projection hits `m·(B°/ϖ)` and its cokernel is killed by `m`". In §3.8 replace the sentence "Almost surjectivity of Frobenius … (4) ⇒ (3)." by "(4) ⇒ (3) is the argument of §3.3 with `lim(A_α°/ϖ)` in place of `B°/ϖ`."

## R04 (P2) — the proof sketch of §3.11 translates the source's proof

**Location:** `README.md` lines 1884–1889: "Apply §3.9 to `R_j = B_j°/ϖ^r`, which satisfies `R_i[j] ≅ R_j[j] ≅ R_j` almost; so `lim¹_j(B_j°/ϖ^r)^a = 0`. … with inverse localisation followed by the canonical map."

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 2927–2957: the same six steps in the same order with the same letters `R_j`, `r`, `C`; the first and last sentences are translations of lines 2935–2938 and 2955–2957.

**Repair:** Replace the sketch by: "*Proof sketch.* Two things are to be shown: `ulim B_j` is almost perfectoid for every object `(B_j)`, and `ulim` is right adjoint to `ς` with `ulim ∘ ς ≅ id`. In characteristic `p` the first is immediate, a limit of perfect rings being perfect. In characteristic `0`, by the almost form of §3.8 it suffices that `lim_j(B_j°/ϖ) → lim_j(B_j°/ϖ^{1/p})` be almost surjective. Each `B_j°` is `ϖ`-torsion-free, so the obstruction lies in `lim¹_j` of the kernels `B_j°/ϖ^{1−1/p}`; the towers `(B_j°/ϖ^r)_j` are nested in the sense of §3.9, because `B_i{ϖʲ/g} ≅ B_j` and §3.4 identify the localisation of the `i`-th term at `j` with the `j`-th term up to almost isomorphism, and §3.9 with `r = 1 − 1/p` kills the obstruction. For the adjunction, §3.6 gives the unit `C → ulim_j C[j]`, an almost isomorphism; the counit `ς(ulim B_i) → (B_j)` consists of the maps `(ulim B_i){ϖʲ/g} → B_j` induced by the projections, and the triangle identities follow from the universal properties of the uniform limit (§2.6) and of the localisations (§2.4)."

## R05 (P2) — the proof of Galois rigidity in §4.2 translates the source's proof

**Location:** `README.md` lines 2008–2010: "The idempotents splitting `S′ ⊗_R S′ ≅ ∏_G S′` also split `S ⊗_R S′ ≅ ∏_G e_γ(S ⊗_R S′)`; faithful flatness of `S′` over `R` and `G × 1`-invariants give `S ⊗_R S′ = S′ ⊗_R S′`, hence `S = S′`."

**Claim:** The sketch is the roadmap's own wording.

**Witness:** ANDRE18A lines 381–384: the same three clauses in the same order; the first is a word-for-word translation (about 20 words with the formulas).

**Repair:** Replace by: "(2) As `S′` is faithfully flat over `R` (§4.1), it suffices that `S′ ⊗_R S′ → S ⊗_R S′` be bijective. Base change along `R → S′` trivialises the torsor `S′`, and the orthogonal idempotents `e_γ` of `S′ ⊗_R S′ ≅ ∏_G S′`, which `G × 1` permutes simply transitively, cut both rings into `|G|` pieces, each isomorphic to the ring of `G × 1`-invariants through `x ↦ e_γx`. Invariants commute with the flat base change, so `(S ⊗_R S′)^{G×1} = S^G ⊗_R S′ = S′ = (S′ ⊗_R S′)^{G×1}`; the map is therefore bijective on every piece, and `S′ = S`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Previous R01 (two unowned lemmas) | lines 1580–1612, 2114–2144 | both owned as supporting results with proofs and Checks; no `gap:` left; P0.26 cited only for comparison | repaired |
| Previous R02 (§5.9 sketch) | lines 2765–2778 against ANDRE18B 552–562 | element `x`, stage `a`, `Ann(x) = I_a·A°_∞0` by flatness; no coherence step, no shared sentence | repaired |
| Previous R03 (§2.9 sketch) | lines 1372–1381 against ANDRE18A 1386–1394 | `C → Q` by `U ↦ 0`; spectral seminorm of `f` at most `\|ϖ\|^i`; density of `B` | repaired |
| Previous R04 (§5.1 list) | lines 2368, 2384–2400 | "Prove the facts of the API below"; nine bullets grouped by use | repaired |
| Previous R05 (§2.1 Check) | `z = i`, `z = 1 + i` | arguments `π/2`, `π/4`; `kπ/4 = mπ/3ⁿ` gives `4 ∣ k` | repaired |
| Previous R06 (description) | "Dependencies" paragraph | names AdicSpacesPartV §1.7 and PerfectoidShimuraVarieties §1.3 as non-inputs; the two owned lemmas are stated | repaired |
| §0.1 almost-pro-zero | `K°/ϖ^{1/p^n}`; constant `(K°, id)` | image generated by `ϖ^{1/p^n − 1/p^{n′}}`, killed by `ϖ^{1/p^k}` iff `n′ ≥ k`; image `K°` not killed | holds; BHATT18 lines 309–324 |
| §0.3 derived limits | `ℤ ←p ℤ`, `t = 1`; extension step | `lim¹ = ℤ_p/ℤ`; `t^{2/p^{k+1}}` divides `t^{1/p^k}` | holds; BHATT18 lines 326–336 |
| §0.5 uniform annihilation | cone in degrees `[−1, 0]`, `γ = g^{1/p^k}t^{1/p^l}` | `γτ` factors through `H^{−1}[1]`; `t^{1/p^{l′}}γτ = 0`; kernel a quotient of `H^{i−1}(K ⊗ C_n)` | holds; BHATT18 lines 418–426 |
| §1.1 annular tower | `g = 0`; `g = (T, 0)` | annuli empty, ring `0`; `(0, 1) ∈ ker f_n`, not killed by `t^{1/p^k}` | holds; BHATT18 lines 348–353, 374–394 |
| §1.4 without regularity | `g = (T, 0)`; kernel tower | kernel `(0) × K°` killed by `(t^{1/p^k}T^{1/p^k}, 0)`; `ker f_{n+c} ⊆ ker f_n`, `c = pᵏm` from §0.5 | holds; BHATT18 lines 427–445 |
| §2.1 root-closure bullet (R01) | `R = 𝔽₂[t^{1/2^∞}][t^{2^k}s^{4^k}]` | `s ∈ t^{-1/2^∞}R^†`; least exponents `3, 9, 21` | false as stated; inclusion `⊆` holds |
| §2.4 quotient norm | `A = K × K`, `g = (ϖ², 1)`, `a = (1, ϖ²)`, `λ = ϖ` | quotient norm `q²`; `inf_m max(q^m, q^{2−m}) = q` | holds |
| §2.8 root algebras | `A = K`, `g = 1` | char `0`: `K[S]/(S^p − 1)`, dimension `p`; char `p`: `(S − 1)^p = 0`, gives `K` | holds; ANDRE18A lines 1316–1348 |
| §3.3 almost perfectoid | `B = K + (T₁^{1/p^∞}P)^− + (T₂P)^−`; R03's rewrite | `T₂^{1/p} ∉ B`, `B°^a = P°^a`; `ηx = (εz)^p` with `η = ε^pε′`, `ε′x = z^p` | statement holds (ANDRE18A lines 1988–2064, 2109–2123); wording: R03 |
| §3.4 annular localisations | `(ϖʲ/T)^{1/p}`; `j = 0` | equals `ϖ^{j/p − j}T^{1−1/p}U`, norm `\|ϖ\|^{−j(1−1/p)}`; spectral norm `1` | holds; ANDRE18A lines 2163–2292 |
| §3.5 limit lemma | `R = K°/ϖ^r`, roots of `T` acting by `0` | `R[0] = 0`, `R[j] = k_K[U^{1/p^∞}]`, `lim = k_K`, kernel `K°°/ϖ^r` | holds; ANDRE18A lines 2468–2578 |
| §3.8 limits of perfectoid algebras | constant system; two-term system | all five conditions; chain `(1) ⇔ (2) ⇐ (3) ⇔ (4) ⇔ (5)` as at source line 2783 | holds; sentence at 1788: R03 |
| §3.11 nested systems | zero system; R04's rewrite | `ulim = 0`; kernels `B_j°/ϖ^{1−1/p}`, `r = 1 − 1/p ∈ ℕ[1/p]` | statement holds (ANDRE18A lines 2924–2966); wording: R04 |
| §4.2 Galois closures, rigidity | `R[x]/(x² − a)`; cyclic cubic; R05's rewrite | `δ² = δ`; six frames, two `ℤ/3`-orbits, `T ≅ S × S`; `M^G ≅ e_γM` | statement holds (ANDRE18A lines 366–384); wording: R05 |
| §4.6 Abhyankar envelope | `B′ = A[1/T]`; monic equation times `εⁿ` | envelope `A`; coefficients `ε^{n−i}b_i ∈ A°` | holds; ANDRE18A lines 3171–3195 |
| §5.1 pure maps | `×2` on `ℤ`; `ℤ → ℤ[1/2]`; infinite product | zero map on `ℤ/2`; `ℤ/2 ⊗ ℤ[1/2] = 0`; `P ⊗ ∏S_i = ∏(P_i ⊗ S_i)` for finitely presented `P` | holds; ANDRE18B lines 835–877 |
| §5.3 Krull detection | `R = S = K°`, `M = K°/K°°` | Noetherianity fails, `M ≠ 0`; `K ⊆ JⁿS`, `R ∩ JⁿS = Jⁿ` | holds |
| §5.6 tubes for the Kummer tower | `p = 2`, `g = 2`, `j = 3`, `l = 1` | `u² = 2`, `e = (1 + X/u)/2`, `e² = e` | holds; ANDRE18B lines 367–383 |
| §5.8 extension clause (R02) | ramified base | no perfectoid base field (source lines 584–586); no target | not owned |
| §5.9 Kummer purity | `n = 0`, `g = p`; `p = 2`, `g = 1` | split by the coefficient of `1`; `ℤ₂ → ℤ₂ × ℤ₂` split | holds |
| *complete-almost-nakayama* | `ℤ_(p) → ℤ_p`; `ℤ_p → ℤ_p ⊕ ℚ_p`; `K°° → K°` | identity modulo `p`, not onto; isomorphism modulo `p`, not onto; cokernel `k_K` | holds; GR03 lines 5509–5519 |
| *principal-almost-flatness* | `M = 𝔽_p` over `ℤ`; `M = ℚ_p` over `ℤ_p[x]` | `Tor_1 = 𝔽_p`; killed by `x` | holds; GR03 lines 5263–5289, case `A = C` |
| `bhatt_riemann_extension_ker_almostZero` | `m = 0`; `g = (T, 0)` | conclusion trivial; `hgreg` fails at `a = (0, 1)` | true as stated |
| `bhatt_quantitative_riemann_extension` | `e ≥ 1/pᵏ`; `e < 1/pᵏ`; `m = 0` | `ce ≥ m`, term `0`; `g^{1/p^k − e}t^{(n+c)e}`; `y` absorbs everything | true; restriction from `n + pᵏm` to `n` |
| `bhatt_kernel_without_regularity` | `g = 0`; `g = (T, 0)` | conclusion `0 = 0`; `(0) × K°` killed by `(tT)^{1/p^k}` | true; `c` chosen before `a` |
| `bhatt_riemann_extension_limit` | `g = 0`; `g` a unit | limit `0`, kernel `R°` killed by `0`; both sides `R°` | true |
| `riemann_extension_completeIntegralClosure` | `g = 1`; zero ring | both sides `R°` (uniform); everything | true |
| `rootSaturation_completelyIntegrallyClosed` | `A = K × K`, `g = (1, 0)`; `g = 0` | saturation `K°`, `\|ϖ^{−1}\|ⁿ` unbounded; both rings `0` | true |
| `abhyankar_trace_almost_surjective` | `g = 1`, `B′ = R`; `B′ = A₁` not faithful | trace the identity on `R°`; misses `(0, ϖ)`, excluded by `hfaith`; ideals `(ϖT)^{1/p^∞}` and `T^{1/p^∞}K°°` equal | true |
| `kummer_isPureHom` | `l = 0`; relations at `p = 2` | identity; `ζ₀ = 1`, `ζ₁ = −1`, stage `j` is `W[x]/Φ_{p^j}` | true |
| `kummer_almost_faithfullyFlat` | `m = V = ℤ`, `M = ℚ` | `ℚ ⊗ ℤ/2 = 0`, `ℤ/2 ≠ 0`: definition discriminates | statement as ANDRE18B line 385 |
| `kummer_ramified_almost_faithfullyFlat` | `m = 0`; `B = 0`; `B = A` | zero ring; excluded by `hinj`; `B°` almost `Â°_∞∞` | true; ANDRE18B lines 600–607 |

- Source locators checked against the text: 62 (BHATT18 12, ANDRE18A 31, ANDRE18B 11, GR03 8), all on the stated pages; the 15 sampled targets among them; none is flagged unverified in the README.
- Library declarations opened at the pins: 31, among them `Mathlib/RingTheory/Filtration.lean:393`, `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27,32`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:385`, `TauCeti/RingTheory/Perfectoid/Basic.lean:86`, `TauCeti/RingTheory/Invariant/Free.lean:111,118`, `TauCeti/RingTheory/Almost/RootSetup.lean:62,92`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Plus/Basic.lean:116,151,225`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean:219`, `TauCeti/LinearAlgebra/Trace/Projective.lean:118,147`, `TauCeti/Algebra/Category/ModuleCat/Tower/ProZero.lean:173,189`. No module purity, almost flatness, root saturation or almost-pro-zero declaration at either pin (`AlgebraicGeometry.UniversallyInjective` is the spectral notion).
- Cross-roadmap citations resolved: PerfectoidSpaces (38 sections, 33 slugs) on main; AdicSpaces §§2.2, 3.1, AdicSpacesPartII R0.3, R0.4, R0.9, AdicSpacesPartIII R3.5, R3.9, AdicEtaleGeometry A4.2, A4.2a, A4.3, DerivedModuleAlgebra §§0.K.1, 0.2, 1.1 on main; PerfectoidQuotients §§1.3–1.4, DerivedDeRhamCohomology §1.10 (`ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness`, its `Suggested.lean` line 96), DeformationAndDerivedPatchingAlgebra §1.13 (`flatCompletion_finiteComparison`, line 133), PerfectoidShimuraVarieties §1.3, AdicSpacesPartV §1.7 at their open heads.
- Dependency check: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; the worker's gate passes every check; no change outside the folder.
- Elaboration of `Suggested.lean`: ten `sorry` warnings and nothing else; the file is unchanged since `d8879ce`, and the 35 elaborated types of the signature check agree with the README, no binder lost. One-tactic probe (`rfl`, `trivial`, `simp`, `infer_instance`, `exact?`) closes none of the ten theorems.
- Headlines: §1.2 (both clauses), §1.4 kernel, §1.5, §3.6(2), §3.6(3), §4.7(3), §5.8, §5.9, §5.12 stated; §1.3, §3.6(1), §3.6(4), §3.11, §4.5, §4.7(1)–(2) named in the docstring with the missing carrier. The pull request's text agrees with the head.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotientsPartII, PerfectoidQuotients, PerfectoidTowers, RelativeFarguesFontaine, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartII; one object handed over without an owner, the multi-element ramified Kummer statement (R02); pure ring maps are owned here and cited by DirectSummandsAndBigCohenMacaulay, FiniteEquivalenceRelations; PerfectoidQuotients §§1.3–1.4 owns Bhatt's root extension and the monic-root pair, cited here.

Source independence: 24 passages compared with 4 sources, 3 shared (R03, R04, R05); largest share ANDRE18A, 73 of 122 locators; contents compared with ANDRE18A: independent at the level of layers (Layer 3 merges its §§3–4, Layer 4 takes §1.9, Proposition 4.4.4 and §5, Layer 2 inserts ANDRE18B §1.2). SCHOLZE12 was not opened this round.

## Not verifiable

- none

## Source issues

- **Error** in ANDRE18A at Remarque 2.5.6, p. 27: the source says the complete integral closure of `R` in `R[1/t]` equals the root saturation of its `p`-root closure; it should be an inclusion, with equality for the complete integral closure of the `p`-root closure; affects nothing.
- **Misprint** in ANDRE18A at Lemme 2.5.3, proof of (2) ⇒ (6), p. 27: the source says the step follows from condition (1); it should cite condition (2), the element lying in `B[1/g]`; affects nothing.
- **Misprint** in ANDRE18B at Remarque 2.6.1(1), p. 82: the source says the completed tower is faithfully flat over `A_∞`; it should be `A_∞0`; affects nothing.

## For the human reviewers

- **Scope.** Within layers the sections keep the source's order: §§2.2–2.4, 2.6–2.9 follow ANDRE18A §§2.3, 2.5, 2.6, 2.8, 2.9, and §§3.3–3.11, 4.3–4.8 follow its §§3.5–5.4 (`README.md` lines 1015–1394, 1527–2332); the `*Needs:*` lines force most of it.
- **Licence.** The sketches of §3.6, §4.1 and §5.12 (`README.md` lines 1714–1724, 1950–1957, 2878–2885) keep the order of steps of ANDRE18A lines 2588–2627, 334–347 and ANDRE18B lines 610–614 in compressed form; they were outside this round's sample and are not counted.
- **Scope.** `README.md` lines 2953–3003, "Corrections to the sources", lists fourteen claimed errors in BHATT18, ANDRE18A and ANDRE18B; this round recomputed two (the quotient norm of §2.6.2 and Lemme 2.5.3) and found one the list lacks (R01).
